@interface NBSearchDataSource
- (BOOL)_isSearchCancelled;
- (MPMediaQuery)searchQuery;
- (NBSearchDataSource)init;
- (NSArray)familyDSIDs;
- (NSString)searchString;
- (id)items;
- (unint64_t)count;
- (void)_combineSearchResults;
- (void)dealloc;
- (void)filterResultsUsingSearchString:(id)a3 completion:(id)a4;
- (void)setFamilyDSIDs:(id)a3;
@end

@implementation NBSearchDataSource

- (NBSearchDataSource)init
{
  v9.receiver = self;
  v9.super_class = (Class)NBSearchDataSource;
  v2 = [(NBSearchDataSource *)&v9 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    uint64_t v5 = +[MPMediaQuery nb_storeOnlyAudiobooksQuery];
    searchQuery = v2->_searchQuery;
    v2->_searchQuery = (MPMediaQuery *)v5;

    familyDSIDs = v2->_familyDSIDs;
    v2->_familyDSIDs = (NSArray *)&__NSArray0__struct;
  }
  return v2;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)NBSearchDataSource;
  [(NBSearchDataSource *)&v3 dealloc];
}

- (unint64_t)count
{
  unint64_t result = [(NSString *)self->_searchString length];
  if (result)
  {
    results = self->_results;
    return [(NSArray *)results count];
  }
  return result;
}

- (id)items
{
  return self->_results;
}

- (void)filterResultsUsingSearchString:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  [(NSOperationQueue *)self->_operationQueue waitUntilAllOperationsAreFinished];
  mediaSearchOperation = self->_mediaSearchOperation;
  self->_mediaSearchOperation = 0;

  jaliscoSearchOperation = self->_jaliscoSearchOperation;
  self->_jaliscoSearchOperation = 0;

  v10 = NBDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v6;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Starting search for term '%@'", buf, 0xCu);
  }

  results = self->_results;
  self->_results = 0;

  v12 = (NSString *)[v6 copy];
  searchString = self->_searchString;
  self->_searchString = v12;

  if ([(NSString *)self->_searchString length])
  {
    v14 = [(NBSearchDataSource *)self searchQuery];
    v15 = objc_msgSend(v14, "nb_existingSearchPredicate");
    if (v15) {
      [v14 removeFilterPredicate:v15];
    }
    [v14 setCollectionPropertiesToFetch:0];
    v16 = self->_searchString;
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", MPMediaItemPropertyArtist, MPMediaItemPropertyTitle, 0);
    v18 = +[_MPMediaSearchStringPredicate predicateWithSearchString:v16 forProperties:v17];

    [v14 addFilterPredicate:v18];
    v19 = objc_opt_new();
    v20 = [[_NBMediaSearchOperation alloc] initWithSearchDataSource:self searchString:v6];
    v21 = self->_mediaSearchOperation;
    self->_mediaSearchOperation = v20;

    [v19 addObject:self->_mediaSearchOperation];
    v22 = [(NBSearchDataSource *)self familyDSIDs];
    BOOL v23 = [v22 count] == 0;

    if (!v23)
    {
      v24 = [[_NBJaliscoSearchOperation alloc] initWithSearchDataSource:self searchString:v6];
      v25 = self->_jaliscoSearchOperation;
      self->_jaliscoSearchOperation = v24;

      [v19 addObject:self->_jaliscoSearchOperation];
    }
    [(NSOperationQueue *)self->_operationQueue addOperations:v19 waitUntilFinished:0];
    objc_initWeak((id *)buf, self);
    operationQueue = self->_operationQueue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_FE6C;
    v28[3] = &unk_20BF0;
    objc_copyWeak(&v31, (id *)buf);
    v30 = v7;
    id v29 = v6;
    [(NSOperationQueue *)operationQueue addBarrierBlock:v28];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
  else if (v7)
  {
    v27 = NBDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Completed search for term '%@'", buf, 0xCu);
    }

    v7[2](v7);
  }
}

- (BOOL)_isSearchCancelled
{
  mediaSearchOperation = self->_mediaSearchOperation;
  if (mediaSearchOperation
    && ([(_NBMediaSearchOperation *)mediaSearchOperation isCancelled] & 1) != 0)
  {
    LOBYTE(jaliscoSearchOperation) = 1;
  }
  else
  {
    jaliscoSearchOperation = self->_jaliscoSearchOperation;
    if (jaliscoSearchOperation)
    {
      LOBYTE(jaliscoSearchOperation) = [(_NBJaliscoSearchOperation *)jaliscoSearchOperation isCancelled];
    }
  }
  return (char)jaliscoSearchOperation;
}

- (void)_combineSearchResults
{
  mediaSearchOperation = self->_mediaSearchOperation;
  if (!mediaSearchOperation
    || ([(_NBMediaSearchOperation *)mediaSearchOperation isCancelled] & 1) == 0)
  {
    jaliscoSearchOperation = self->_jaliscoSearchOperation;
    if (!jaliscoSearchOperation
      || ([(_NBJaliscoSearchOperation *)jaliscoSearchOperation isCancelled] & 1) == 0)
    {
      v64 = self;
      uint64_t v5 = [(_NBMediaSearchOperation *)self->_mediaSearchOperation results];
      id v6 = +[NSMutableSet set];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v7 = v5;
      id v8 = [v7 countByEnumeratingWithState:&v65 objects:v75 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v66;
        uint64_t v11 = MPMediaItemPropertyStoreID;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v66 != v10) {
              objc_enumerationMutation(v7);
            }
            v13 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            objc_opt_class();
            v14 = [v13 valueForProperty:v11];
            v15 = BUDynamicCast();

            if (v15) {
              [v6 addObject:v15];
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v65 objects:v75 count:16];
        }
        while (v9);
      }

      v16 = v64;
      v17 = [(_NBJaliscoSearchOperation *)v64->_jaliscoSearchOperation results];
      if ([v7 count] && !objc_msgSend(v17, "count"))
      {
        v45 = NBDefaultLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          id v46 = [v7 count];
          v47 = [(NBSearchDataSource *)v64 searchString];
          *(_DWORD *)buf = 134218242;
          id v70 = v46;
          v16 = v64;
          __int16 v71 = 2112;
          id v72 = v47;
          _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Only media items(%lu) found for search: %@", buf, 0x16u);
        }
        v48 = (NSArray *)v7;
      }
      else
      {
        if (![v17 count] || objc_msgSend(v7, "count"))
        {
          if ([v7 count] && objc_msgSend(v17, "count"))
          {
            v18 = NBDefaultLog();
            v62 = v17;
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              id v19 = [v17 count];
              id v20 = [v7 count];
              v21 = [(NBSearchDataSource *)v64 searchString];
              *(_DWORD *)buf = 134218498;
              id v70 = v19;
              __int16 v71 = 2048;
              id v72 = v20;
              __int16 v73 = 2112;
              v74 = v21;
              _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Combining jalisco items (%lu) and media items (%lu) for search: %@", buf, 0x20u);

              v17 = v62;
            }

            v22 = objc_opt_new();
            BOOL v23 = [v7 objectEnumerator];
            v24 = [v17 objectEnumerator];
            v63 = v23;
            v25 = [v23 nextObject];
            uint64_t v26 = [v24 nextObject];
            v28 = (void *)v26;
            if (v25)
            {
              id v29 = v64;
              if (v26)
              {
                *(void *)&long long v27 = 138412290;
                long long v60 = v27;
                while (1)
                {
                  if ([(NBSearchDataSource *)v29 _isSearchCancelled]) {
                    goto LABEL_49;
                  }
                  v30 = [v28 storeID];
                  id v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v30 integerValue]);
                  unsigned int v32 = [v6 containsObject:v31];

                  if (v32) {
                    break;
                  }
                  uint64_t v34 = [v28 title];
                  if (!v34) {
                    goto LABEL_32;
                  }
                  v35 = (void *)v34;
                  v36 = [v25 title];
                  v37 = [v28 title];
                  v38 = (char *)[v36 localizedCaseInsensitiveCompare:v37];

                  BOOL v39 = v38 + 1 == 0;
                  id v29 = v64;
                  if (!v39)
                  {
LABEL_32:
                    [v22 addObject:v28];
LABEL_33:
                    uint64_t v40 = [v24 nextObject];
                    v41 = v28;
                    v28 = (void *)v40;
                    goto LABEL_34;
                  }
                  [v22 addObject:v25];
                  uint64_t v42 = [v63 nextObject];
                  v41 = v25;
                  v25 = (void *)v42;
LABEL_34:

                  if (!v25 || !v28) {
                    goto LABEL_48;
                  }
                }
                id v33 = NBDefaultLog();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v60;
                  id v70 = v28;
                  _os_log_debug_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, "Skipping jalisco item %@", buf, 0xCu);
                }

                goto LABEL_33;
              }
            }
LABEL_48:
            if (v25)
            {
              do
              {
LABEL_49:
                [v22 addObject:v25];
                uint64_t v52 = [v63 nextObject];

                v25 = (void *)v52;
              }
              while (v52);
            }
            if (v28)
            {
              *(void *)&long long v27 = 138412290;
              long long v61 = v27;
              do
              {
                v53 = objc_msgSend(v28, "storeID", v61);
                v54 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v53 integerValue]);
                unsigned __int8 v55 = [v6 containsObject:v54];

                if ((v55 & 1) == 0)
                {
                  v56 = NBDefaultLog();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = v61;
                    id v70 = v28;
                    _os_log_debug_impl(&dword_0, v56, OS_LOG_TYPE_DEBUG, "Skipping jalisco item %@", buf, 0xCu);
                  }

                  [v22 addObject:v28];
                }
                uint64_t v57 = [v24 nextObject];

                v28 = (void *)v57;
              }
              while (v57);
            }
            v58 = (NSArray *)[v22 copy];
            results = v64->_results;
            v64->_results = v58;

            v17 = v62;
          }
          else
          {
            v43 = NBDefaultLog();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              v44 = [(NBSearchDataSource *)v64 searchString];
              *(_DWORD *)buf = 138412290;
              id v70 = v44;
              _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "No jalisco or media items found for search:%@", buf, 0xCu);
            }
            v22 = v64->_results;
            v64->_results = (NSArray *)&__NSArray0__struct;
          }
          goto LABEL_58;
        }
        v49 = NBDefaultLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          id v50 = [v17 count];
          v51 = [(NBSearchDataSource *)v64 searchString];
          *(_DWORD *)buf = 134218242;
          id v70 = v50;
          v16 = v64;
          __int16 v71 = 2112;
          id v72 = v51;
          _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "Only jalisco items(%lu) found for search: %@", buf, 0x16u);
        }
        v48 = v17;
      }
      v22 = v16->_results;
      v16->_results = v48;
LABEL_58:
    }
  }
}

- (NSArray)familyDSIDs
{
  return self->_familyDSIDs;
}

- (void)setFamilyDSIDs:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (MPMediaQuery)searchQuery
{
  return self->_searchQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_familyDSIDs, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_jaliscoSearchOperation, 0);
  objc_storeStrong((id *)&self->_mediaSearchOperation, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end