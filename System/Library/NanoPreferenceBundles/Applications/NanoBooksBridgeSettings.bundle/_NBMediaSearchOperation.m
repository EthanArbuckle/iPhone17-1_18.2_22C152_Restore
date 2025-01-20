@interface _NBMediaSearchOperation
- (_NBMediaSearchOperation)initWithSearchDataSource:(id)a3 searchString:(id)a4;
- (id)_representativeItemFromCollection:(id)a3;
- (id)results;
- (void)executeSearch;
@end

@implementation _NBMediaSearchOperation

- (_NBMediaSearchOperation)initWithSearchDataSource:(id)a3 searchString:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_NBMediaSearchOperation;
  v7 = [(_NBSearchOperation *)&v14 initWithSearchDataSource:v6 searchString:a4];
  if (v7)
  {
    v8 = [v6 searchQuery];
    v9 = (MPMediaQuery *)[v8 copy];
    query = v7->_query;
    v7->_query = v9;

    uint64_t v11 = objc_opt_new();
    searchResults = v7->_searchResults;
    v7->_searchResults = (NSMutableArray *)v11;
  }
  return v7;
}

- (void)executeSearch
{
  [(NSMutableArray *)self->_searchResults removeAllObjects];
  query = self->_query;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10A78;
  v4[3] = &unk_20C18;
  v4[4] = self;
  [(MPMediaQuery *)query _enumerateCollectionsUsingBlock:v4];
}

- (id)_representativeItemFromCollection:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a3, "items", 0);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 mediaType] == &dword_4)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)results
{
  id v2 = [(NSMutableArray *)self->_searchResults copy];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end