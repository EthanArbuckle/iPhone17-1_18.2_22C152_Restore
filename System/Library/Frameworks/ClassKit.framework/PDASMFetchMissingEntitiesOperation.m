@interface PDASMFetchMissingEntitiesOperation
- (BOOL)processResponseZone:(id)a3;
- (BOOL)resultsWillExpire;
- (BOOL)wantsToExecute;
- (NSMutableDictionary)missingIDsByClass;
- (PDASMFetchMissingEntitiesOperation)initWithDatabase:(id)a3;
- (id)generateFetchQueryForZoneName:(id)a3 forObjectIDs:(id)a4;
- (id)logSubsystem;
- (id)requestData;
- (id)zoneNamesWithMissingEntities;
- (void)addFilterQueryForZoneNamed:(id)a3 toSearchRequest:(id)a4;
- (void)setMissingIDsByClass:(id)a3;
@end

@implementation PDASMFetchMissingEntitiesOperation

- (BOOL)resultsWillExpire
{
  return 0;
}

- (id)logSubsystem
{
  return CLSLogSearch;
}

- (PDASMFetchMissingEntitiesOperation)initWithDatabase:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDASMFetchMissingEntitiesOperation;
  v3 = [(PDASMSearchOperation *)&v7 initWithDatabase:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    v5 = *(void **)(v3 + 306);
    *(void *)(v3 + 306) = v4;
  }
  return (PDASMFetchMissingEntitiesOperation *)v3;
}

- (BOOL)wantsToExecute
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v12[0] = v4;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v12[1] = v6;
  objc_super v7 = +[NSArray arrayWithObjects:v12 count:2];

  v8 = +[PDDatabase whereSQLForArray:v7 prefix:@"entityName in "];
  v9 = [(PDOperation *)self database];
  id v10 = [v9 count:objc_opt_class() where:v8 bindings:v7];

  return (uint64_t)v10 > 0;
}

- (id)zoneNamesWithMissingEntities
{
  v3 = objc_opt_new();
  uint64_t v4 = [(PDOperation *)self database];
  uint64_t v5 = objc_opt_class();
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_10008F9DC;
  v20 = &unk_1001F3878;
  v21 = self;
  id v6 = v3;
  id v22 = v6;
  [v4 selectAll:v5 block:&v17];
  objc_super v7 = sub_1000795D4(6);
  unsigned int v8 = objc_msgSend(v6, "containsObject:", v7, v17, v18, v19, v20, v21);

  if (v8)
  {
    v9 = sub_1000795D4(7);
    [v6 addObject:v9];
    id v10 = [(PDASMFetchMissingEntitiesOperation *)self missingIDsByClass];
    v11 = sub_1000795D4(6);
    v12 = [v10 objectForKeyedSubscript:v11];
    v13 = [(PDASMFetchMissingEntitiesOperation *)self missingIDsByClass];
    [v13 setObject:v12 forKeyedSubscript:v9];
  }
  v14 = v22;
  id v15 = v6;

  return v15;
}

- (void)addFilterQueryForZoneNamed:(id)a3 toSearchRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(PDASMFetchMissingEntitiesOperation *)self missingIDsByClass];
  v9 = [v8 objectForKeyedSubscript:v6];

  id v10 = [(PDASMFetchMissingEntitiesOperation *)self generateFetchQueryForZoneName:v6 forObjectIDs:v9];
  v11 = [(PDASMSearchOperation *)self createSearchRequestZoneForZoneName:v6 usingQuery:v10];
  if (v10)
  {
    CLSInitLog();
    v12 = [(PDASMFetchMissingEntitiesOperation *)self logSubsystem];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = objc_opt_class();
      id v14 = v13;
      id v15 = [(PDURLRequestOperation *)self operationID];
      v16 = [v11 dictionaryRepresentation];
      int v17 = 138544386;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      v20 = v15;
      __int16 v21 = 2114;
      id v22 = v9;
      __int16 v23 = 2114;
      id v24 = v6;
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Detected missing IDs: %{public}@ for zone %{public}@ query: %@", (uint8_t *)&v17, 0x34u);
    }
    [v7 addSearchRequestZones:v11];
  }
}

- (id)requestData
{
  if ([(PDOperation *)self isAborted])
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = objc_alloc_init(PDDPEESearchRequest);
    uint64_t v5 = [(PDASMFetchMissingEntitiesOperation *)self zoneNamesWithMissingEntities];
    if ([*(id *)((char *)&self->super._personsRequiringFilterProcessing + 2) count])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = v5;
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            -[PDASMFetchMissingEntitiesOperation addFilterQueryForZoneNamed:toSearchRequest:](self, "addFilterQueryForZoneNamed:toSearchRequest:", *(void *)(*((void *)&v17 + 1) + 8 * i), v4, (void)v17);
          }
          id v8 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
        }
        while (v8);
      }

      CLSInitLog();
      v11 = [(PDASMFetchMissingEntitiesOperation *)self logSubsystem];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v13 = objc_opt_class();
        id v14 = v13;
        id v15 = [(PDURLRequestOperation *)self operationID];
        v16 = [(PDDPEESearchRequest *)v4 dictionaryRepresentation];
        *(_DWORD *)buf = 138543874;
        id v22 = v13;
        __int16 v23 = 2114;
        id v24 = v15;
        __int16 v25 = 2114;
        v26 = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Fetch missing request: %{public}@", buf, 0x20u);
      }
      v3 = [(PDDPEESearchRequest *)v4 data];
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (id)generateFetchQueryForZoneName:(id)a3 forObjectIDs:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  id v7 = a4;
  if (![v7 count])
  {
    id v8 = 0;
    goto LABEL_15;
  }
  id v8 = objc_alloc_init(PDDPSearchQuery);
  [(PDDPSearchQuery *)v8 setType:3];
  uint64_t v9 = sub_1000795D4(6);
  if (!(v6 | v9)) {
    goto LABEL_13;
  }
  id v10 = (void *)v9;
  v11 = sub_1000795D4(6);
  v12 = v11;
  if (v6 && v11)
  {
    v13 = sub_1000795D4(6);
    unsigned __int8 v14 = [v13 isEqualToString:v6];

    if (v14) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  uint64_t v15 = sub_1000795D4(7);
  if (v6 | v15)
  {
    v16 = (void *)v15;
    long long v17 = sub_1000795D4(7);
    long long v18 = v17;
    if (v6 && v17)
    {
      long long v19 = sub_1000795D4(7);
      unsigned __int8 v20 = [v19 isEqualToString:v6];

      if (v20) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    CFStringRef v21 = @"person_id";
    goto LABEL_14;
  }
LABEL_13:
  CFStringRef v21 = @"class_id";
LABEL_14:
  id v22 = [(PDASMSearchOperation *)self criteriaForFieldName:v21 andValues:v7 withFormat:0];
  [(PDDPSearchQuery *)v8 setCriteria:v22];

LABEL_15:

  return v8;
}

- (BOOL)processResponseZone:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 status];
  unsigned int v6 = [v5 code];

  if (v6 == 1)
  {
    id v7 = [(PDASMFetchMissingEntitiesOperation *)self missingIDsByClass];
    id v8 = [v4 zoneName];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    if ([v9 count])
    {
      id v10 = +[PDDatabase whereSQLForArray:v9 prefix:@"entityId in "];
      v11 = [(PDOperation *)self database];
      [v11 deleteAll:objc_opt_class() where:v10 bindings:v9];
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)PDASMFetchMissingEntitiesOperation;
  BOOL v12 = [(PDASMSearchOperation *)&v14 processResponseZone:v4];

  return v12;
}

- (NSMutableDictionary)missingIDsByClass
{
  return *(NSMutableDictionary **)((char *)&self->super._personsRequiringFilterProcessing + 2);
}

- (void)setMissingIDsByClass:(id)a3
{
}

- (void).cxx_destruct
{
}

@end