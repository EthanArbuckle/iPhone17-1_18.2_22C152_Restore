@interface _GEOPlaceDataRequestHelper
+ (id)helperExpiredIdentifiers:(id)a3;
+ (id)helperForHandler:(id)a3 identifiers:(id)a4;
- (BOOL)finishedIdentifier:(id)a3 withResult:(id)a4 error:(id)a5;
- (id)description;
- (void)failAllRemainingRequests;
@end

@implementation _GEOPlaceDataRequestHelper

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = objc_retainBlock(self->_requestHandler);
  v6 = [(NSDictionary *)self->_identifierOrderMap allKeys];
  v7 = +[NSString stringWithFormat:@"<%@ %p handler %p identifiers %@ remaning %@ results.count: %d", v4, self, v5, v6, self->_remaningIdentifiers, [(NSMutableArray *)self->_results count]];

  return v7;
}

+ (id)helperForHandler:(id)a3 identifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_GEOPlaceDataRequestHelper);
  if (v7)
  {
    id v8 = [v5 copy];
    id requestHandler = v7->_requestHandler;
    v7->_id requestHandler = v8;

    uint64_t v10 = +[NSMutableSet setWithArray:v6];
    remaningIdentifiers = v7->_remaningIdentifiers;
    v7->_remaningIdentifiers = (NSMutableSet *)v10;

    uint64_t v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    results = v7->_results;
    v7->_results = (NSMutableArray *)v12;

    v14 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_10004595C;
    v23 = &unk_1000732D8;
    v15 = v7;
    v24 = v15;
    id v25 = v14;
    id v16 = v14;
    [v6 enumerateObjectsUsingBlock:&v20];
    v17 = (NSDictionary *)objc_msgSend(v16, "copy", v20, v21, v22, v23);
    identifierOrderMap = v15->_identifierOrderMap;
    v15->_identifierOrderMap = v17;
  }

  return v7;
}

+ (id)helperExpiredIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_GEOPlaceDataRequestHelper);
  if (v4)
  {
    id v5 = (NSMutableSet *)[v3 mutableCopy];
    remaningIdentifiers = v4->_remaningIdentifiers;
    v4->_remaningIdentifiers = v5;
  }

  return v4;
}

- (BOOL)finishedIdentifier:(id)a3 withResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(NSMutableSet *)self->_remaningIdentifiers removeObject:v8];
  if (v9 && self->_results)
  {
    uint64_t v11 = [(NSDictionary *)self->_identifierOrderMap objectForKeyedSubscript:v8];
    if (!v11)
    {
      BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v18) {
        sub_10004D0D4(v18, v19, v20, v21, v22, v23, v24, v25);
      }
      goto LABEL_6;
    }
    uint64_t v12 = (void *)v11;
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_100045C28;
    v29 = &unk_100073300;
    v30 = self;
    id v31 = v9;
    [v12 enumerateIndexesUsingBlock:&v26];
  }
  if ([(NSMutableSet *)self->_remaningIdentifiers count])
  {
LABEL_6:
    BOOL v13 = 0;
    goto LABEL_13;
  }
  id requestHandler = (void (**)(id, void, id))self->_requestHandler;
  if (requestHandler)
  {
    if (v10)
    {
      requestHandler[2](self->_requestHandler, 0, v10);
    }
    else
    {
      v15 = sub_100045C38(self->_results);
      ((void (**)(id, void *, id))requestHandler)[2](requestHandler, v15, 0);
    }
    id v16 = self->_requestHandler;
    self->_id requestHandler = 0;
  }
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

- (void)failAllRemainingRequests
{
  if ([(NSMutableSet *)self->_remaningIdentifiers count])
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4 = [(NSMutableSet *)self->_remaningIdentifiers allObjects];
      id v5 = [v4 componentsJoinedByString:@", "];
      int v10 = 138543362;
      uint64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Watchdog timeout, server error fetching muids: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    id v6 = +[NSError GEOErrorWithCode:-19 reason:@"timed-out waiting for requested ids"];
    id requestHandler = (void (**)(id, void *, void *))self->_requestHandler;
    if (requestHandler)
    {
      id v8 = sub_100045C38(self->_results);
      requestHandler[2](requestHandler, v8, v6);

      id v9 = self->_requestHandler;
      self->_id requestHandler = 0;
    }
    [(NSMutableSet *)self->_remaningIdentifiers removeAllObjects];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_remaningIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifierOrderMap, 0);

  objc_storeStrong(&self->_requestHandler, 0);
}

@end