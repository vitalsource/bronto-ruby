module Bronto
  class Unsubscribe < Base
    attr_accessor :contactId, :method, :created
    # Finds unsubscribes based on the `filter` (Bronto::Filter object).
    # * `page_number` is the page of contacts to unsubscribes. Bronto doesn't specify how many unsubscribes are returned per page,
    #    only that you should keep increasing the number until no more unsubscribes are returned.
    def self.find(filter = Bronto::Filter.new, page_number = 1, api_key = nil)
      body = { filter: filter.to_hash, page_number: page_number }
      api_key = api_key || self.api_key

      resp = request(:read, body)
      Array.wrap(resp[:return])
    end

    def initialize(options = {})
      super(options)
    end
  end
end
