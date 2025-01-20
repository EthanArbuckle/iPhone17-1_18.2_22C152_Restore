@interface CPLCKRecordRequestor
- (BOOL)needsRequestedRecords;
- (BOOL)processedFetchedRequestedRecordsWithError:(id *)a3;
- (CPLCKRecordFetchCache)fetchCache;
- (CPLCKRecordRequestor)initWithFetchCache:(id)a3 scopeProvider:(id)a4;
- (CPLCloudKitScopeProvider)scopeProvider;
- (NSArray)requestedRecordIDs;
- (void)_fetchRecordsForNextOperationTypeInEnumerator:(id)a3 task:(id)a4 completionHandler:(id)a5;
- (void)fetchRequestedRecordsForTransportTask:(id)a3 completionHandler:(id)a4;
- (void)requestRecordWithRecordID:(id)a3 operationType:(int64_t)a4 forRecordWithRecordID:(id)a5 completionHandler:(id)a6;
@end

@implementation CPLCKRecordRequestor

- (CPLCKRecordRequestor)initWithFetchCache:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLCKRecordRequestor;
  v8 = [(CPLCKRecordRequestor *)&v12 init];
  if (v8)
  {
    if (v6) {
      v9 = (CPLCKRecordFetchCache *)v6;
    }
    else {
      v9 = objc_alloc_init(CPLCKRecordFetchCache);
    }
    fetchCache = v8->_fetchCache;
    v8->_fetchCache = v9;

    objc_storeStrong((id *)&v8->_scopeProvider, a4);
  }

  return v8;
}

- (void)requestRecordWithRecordID:(id)a3 operationType:(int64_t)a4 forRecordWithRecordID:(id)a5 completionHandler:(id)a6
{
  id v25 = a3;
  id v10 = a5;
  id v11 = a6;
  requestedRecordIDs = self->_requestedRecordIDs;
  if (!requestedRecordIDs)
  {
    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v14 = self->_requestedRecordIDs;
    self->_requestedRecordIDs = v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    requests = self->_requests;
    self->_requests = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    requestedRecordIDsPerOperationType = self->_requestedRecordIDsPerOperationType;
    self->_requestedRecordIDsPerOperationType = v17;

    requestedRecordIDs = self->_requestedRecordIDs;
  }
  [(NSMutableSet *)requestedRecordIDs addObject:v25];
  v19 = sub_1000A809C((id *)[CPLCKRecordRequest alloc], v25, v10, v11);
  [(NSMutableArray *)self->_requests addObject:v19];
  v20 = self->_requestedRecordIDsPerOperationType;
  v21 = +[NSNumber numberWithInteger:a4];
  id v22 = [(NSMutableDictionary *)v20 objectForKeyedSubscript:v21];

  if (!v22)
  {
    id v22 = objc_alloc_init((Class)NSMutableSet);
    v23 = self->_requestedRecordIDsPerOperationType;
    v24 = +[NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v23 setObject:v22 forKeyedSubscript:v24];
  }
  [v22 addObject:v25];
}

- (BOOL)needsRequestedRecords
{
  return [(NSMutableSet *)self->_requestedRecordIDs count] != 0;
}

- (void)_fetchRecordsForNextOperationTypeInEnumerator:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 nextObject];
  if (v11)
  {
    objc_super v12 = [(NSMutableDictionary *)self->_requestedRecordIDsPerOperationType objectForKeyedSubscript:v11];
    v13 = [v12 allObjects];

    id v14 = [v11 integerValue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000A82E4;
    v15[3] = &unk_10027A3F8;
    id v19 = v10;
    id v16 = v9;
    v17 = self;
    id v18 = v8;
    [v16 fetchRecordsWithIDs:v13 fetchResources:0 wantsAllRecords:0 type:v14 completionHandler:v15];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)fetchRequestedRecordsForTransportTask:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  requestedRecordIDsPerOperationType = self->_requestedRecordIDsPerOperationType;
  id v8 = a3;
  id v9 = [(NSMutableDictionary *)requestedRecordIDsPerOperationType keyEnumerator];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A84B8;
  v11[3] = &unk_1002766A8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(CPLCKRecordRequestor *)self _fetchRecordsForNextOperationTypeInEnumerator:v9 task:v8 completionHandler:v11];
}

- (NSArray)requestedRecordIDs
{
  v2 = [(NSMutableSet *)self->_requestedRecordIDs allObjects];
  v3 = v2;
  if (!v2) {
    v2 = &__NSArray0__struct;
  }
  v4 = v2;

  return v4;
}

- (BOOL)processedFetchedRequestedRecordsWithError:(id *)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obj = self->_requests;
  id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v8);
        if (v9) {
          id v10 = *(void **)(v9 + 24);
        }
        else {
          id v10 = 0;
        }
        id v11 = (uint64_t (*)(void))v10[2];
        id v12 = v10;
        char v13 = v11();
        id v14 = (__CFString *)0;

        if ((v13 & 1) == 0)
        {
          if (v9) {
            v15 = *(void **)(v9 + 16);
          }
          else {
            v15 = 0;
          }
          scopeProvider = self->_scopeProvider;
          id v17 = v15;
          id v18 = [(CPLCloudKitScopeProvider *)scopeProvider rejectedScopedIdentifierForRejectedCKRecordID:v17];

          id v19 = [v4 objectForKeyedSubscript:v18];

          if (!v19)
          {
            if (!v14) {
              id v14 = @"processing requested record failed";
            }
            if (!_CPLSilentLogging)
            {
              v20 = __CPLGenericOSLogDomain();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                if (v9)
                {
                  id v21 = *(id *)(v9 + 8);
                  uint64_t v22 = *(void *)(v9 + 16);
                }
                else
                {
                  id v21 = 0;
                  uint64_t v22 = 0;
                }
                *(_DWORD *)buf = 138413058;
                id v37 = v21;
                __int16 v38 = 2112;
                uint64_t v39 = v22;
                __int16 v40 = 2112;
                v41 = v18;
                __int16 v42 = 2114;
                v43 = v14;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Processing requested record %@ for %@ (on behalf of %@) was rejected: %{public}@", buf, 0x2Au);
              }
            }
            [v4 setObject:v14 forKeyedSubscript:v18];
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v23 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v44 count:16];
      id v6 = v23;
    }
    while (v23);
  }

  id v24 = [v4 count];
  if (v24)
  {
    uint64_t v34 = CPLErrorRejectedRecordIdentifiersAndReasonsKey;
    id v35 = v4;
    id v25 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v26 = +[CPLErrors cplErrorWithCode:18 underlyingError:0 userInfo:v25 description:@"Rejecting some records because of bad or missing requested records"];

    if (a3) {
      *a3 = v26;
    }
  }
  return v24 == 0;
}

- (CPLCKRecordFetchCache)fetchCache
{
  return self->_fetchCache;
}

- (CPLCloudKitScopeProvider)scopeProvider
{
  return self->_scopeProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeProvider, 0);
  objc_storeStrong((id *)&self->_fetchCache, 0);
  objc_storeStrong((id *)&self->_requestedRecordIDsPerOperationType, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_requestedRecordIDs, 0);
}

@end