@interface PDASMExpandMissingGroupReferencesOperation
- (BOOL)processResponseZone:(id)a3;
- (BOOL)wantsToExecute;
- (NSMutableArray)missingGroupIDs;
- (PDASMExpandMissingGroupReferencesOperation)initWithDatabase:(id)a3;
- (id)generateFetchQueryForObjectIDs:(id)a3;
- (id)logSubsystem;
- (id)requestData;
- (void)setMissingGroupIDs:(id)a3;
@end

@implementation PDASMExpandMissingGroupReferencesOperation

- (id)logSubsystem
{
  return CLSLogSearch;
}

- (PDASMExpandMissingGroupReferencesOperation)initWithDatabase:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDASMExpandMissingGroupReferencesOperation;
  v3 = [(PDASMSearchOperation *)&v7 initWithDatabase:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    v5 = *(void **)(v3 + 306);
    *(void *)(v3 + 306) = v4;
  }
  return (PDASMExpandMissingGroupReferencesOperation *)v3;
}

- (BOOL)wantsToExecute
{
  v2 = [(PDOperation *)self database];
  id v3 = [v2 count:objc_opt_class() where:0 bindings:0];

  return (uint64_t)v3 > 0;
}

- (id)requestData
{
  if ([(PDOperation *)self isAborted])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v4 = [(PDOperation *)self database];
    uint64_t v6 = sub_100003A74(v4);
    objc_super v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = *(void *)(v6 + 72);
    }
    else {
      uint64_t v8 = 0;
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10014A0C0;
    v19[3] = &unk_1001F6048;
    v19[4] = self;
    [v4 selectAll:objc_opt_class() where:0 orderBy:0 limit:v8 offset:0 bindings:0 block:v19];

    if ([*(id *)((char *)&self->super._personsRequiringFilterProcessing + 2) count])
    {
      v9 = objc_alloc_init(PDDPEESearchRequest);
      v10 = [(PDASMExpandMissingGroupReferencesOperation *)self generateFetchQueryForObjectIDs:*(NSMutableDictionary **)((char *)&self->super._personsRequiringFilterProcessing + 2)];
      v11 = sub_1000795D4(13);
      v12 = [(PDASMSearchOperation *)self createSearchRequestZoneForZoneName:v11 usingQuery:v10];

      [(PDDPEESearchRequest *)v9 addSearchRequestZones:v12];
      CLSInitLog();
      v13 = [(PDASMExpandMissingGroupReferencesOperation *)self logSubsystem];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v15 = objc_opt_class();
        id v16 = v15;
        v17 = [(PDURLRequestOperation *)self operationID];
        v18 = [(PDDPEESearchRequest *)v9 dictionaryRepresentation];
        *(_DWORD *)buf = 138543874;
        v21 = v15;
        __int16 v22 = 2114;
        v23 = v17;
        __int16 v24 = 2114;
        v25 = v18;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Expand missing groups request: %{public}@", buf, 0x20u);
      }
      id v3 = [(PDDPEESearchRequest *)v9 data];
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (id)generateFetchQueryForObjectIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = objc_alloc_init(PDDPSearchQuery);
    [(PDDPSearchQuery *)v5 setType:3];
    uint64_t v6 = [(PDASMSearchOperation *)self criteriaForFieldName:@"group_id" andValues:v4 withFormat:0];
    [(PDDPSearchQuery *)v5 setCriteria:v6];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)processResponseZone:(id)a3
{
  id v4 = a3;
  v5 = [v4 status];
  unsigned int v6 = [v5 code];

  if (v6 == 1 && [*(id *)((char *)&self->super._personsRequiringFilterProcessing + 2) count])
  {
    objc_super v7 = +[PDDatabase whereSQLForArray:*(NSMutableDictionary **)((char *)&self->super._personsRequiringFilterProcessing + 2) prefix:@"objectID in "];
    uint64_t v8 = [(PDOperation *)self database];
    [v8 deleteAll:objc_opt_class() where:v7 bindings:*(NSMutableDictionary **)((char *)&self->super._personsRequiringFilterProcessing + 2)];
  }
  v11.receiver = self;
  v11.super_class = (Class)PDASMExpandMissingGroupReferencesOperation;
  BOOL v9 = [(PDASMSearchOperation *)&v11 processResponseZone:v4];

  return v9;
}

- (NSMutableArray)missingGroupIDs
{
  return *(NSMutableArray **)((char *)&self->super._personsRequiringFilterProcessing + 2);
}

- (void)setMissingGroupIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end