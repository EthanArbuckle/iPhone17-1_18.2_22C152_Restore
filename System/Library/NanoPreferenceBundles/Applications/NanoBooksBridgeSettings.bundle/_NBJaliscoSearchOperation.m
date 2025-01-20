@interface _NBJaliscoSearchOperation
- (_NBJaliscoSearchOperation)initWithSearchDataSource:(id)a3 searchString:(id)a4;
- (id)results;
- (void)executeSearch;
@end

@implementation _NBJaliscoSearchOperation

- (_NBJaliscoSearchOperation)initWithSearchDataSource:(id)a3 searchString:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_NBJaliscoSearchOperation;
  v4 = [(_NBSearchOperation *)&v8 initWithSearchDataSource:a3 searchString:a4];
  v5 = v4;
  if (v4)
  {
    searchResults = v4->_searchResults;
    v4->_searchResults = (NSArray *)&__NSArray0__struct;
  }
  return v5;
}

- (void)executeSearch
{
  uint64_t v3 = +[NBBridgeUtilities isExplicitMaterialAllowed] ^ 1;
  v4 = NBDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [(_NBSearchOperation *)self dataSource];
    v6 = [v5 familyDSIDs];
    v7 = [(_NBSearchOperation *)self searchString];
    int v15 = 138412802;
    v16 = v6;
    __int16 v17 = 2112;
    v18 = v7;
    __int16 v19 = 1024;
    int v20 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "NBJaliscoSearchOperation executing jalisco fetch with dsid:(%@), searchString:(%@), isExplicitRestricted: (%i)", (uint8_t *)&v15, 0x1Cu);
  }
  objc_super v8 = +[BLJaliscoReadOnlyDAAPClient sharedClient];
  v9 = [(_NBSearchOperation *)self dataSource];
  v10 = [v9 familyDSIDs];
  v11 = [(_NBSearchOperation *)self searchString];
  v12 = [v8 searchAllServerItemsForDSIDs:v10 matchingSearchString:v11 isExplicitRestricted:v3];

  objc_msgSend(v12, "bu_arrayByRemovingItemsWithDuplicateValuesForKey:", @"storeID");
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  searchResults = self->_searchResults;
  self->_searchResults = v13;
}

- (id)results
{
  return self->_searchResults;
}

- (void).cxx_destruct
{
}

@end