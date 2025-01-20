@interface _GEOFailedSearchTicket
- (NSString)searchQuery;
- (_GEOFailedSearchTicket)initWithError:(id)a3 searchQuery:(id)a4 traits:(id)a5;
@end

@implementation _GEOFailedSearchTicket

- (_GEOFailedSearchTicket)initWithError:(id)a3 searchQuery:(id)a4 traits:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GEOFailedSearchTicket;
  v9 = [(_GEOFailedTicket *)&v14 initWithError:a3 traits:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    searchQuery = v9->_searchQuery;
    v9->_searchQuery = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);

  objc_storeStrong((id *)&self->searchQuery, 0);
}

@end