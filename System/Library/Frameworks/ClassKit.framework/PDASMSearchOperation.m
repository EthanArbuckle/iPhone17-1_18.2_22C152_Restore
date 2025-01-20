@interface PDASMSearchOperation
+ (id)defaultEndpointInfo;
- (BOOL)didCallFinishBlock;
- (BOOL)haveIncompleteSyncData;
- (BOOL)isValidASMSearchSpecification:(id)a3;
- (BOOL)needsToMakeNetworkRequest;
- (BOOL)postFilterPersonsByRequiredClassMemberRole;
- (BOOL)postFilterPersonsByRequiredRolePrivilege;
- (BOOL)postFilterPersonsByRequiredRoleType;
- (BOOL)postFilterWillAcceptPerson:(id)a3 withRoleLocations:(id)a4;
- (BOOL)processClassMember:(id)a3;
- (BOOL)processClassPayload:(id)a3;
- (BOOL)processGroupMember:(id)a3;
- (BOOL)processGroupPayload:(id)a3;
- (BOOL)processOrganization:(id)a3;
- (BOOL)processPerson:(id)a3;
- (BOOL)processResponseZone:(id)a3;
- (BOOL)receivedResponse;
- (BOOL)resultsWillExpire;
- (BOOL)shouldProcessResponseBody;
- (BOOL)wantsToExecute;
- (CLSSearchSpecification)searchSpec;
- (Class)expectedResponseClass;
- (NSMutableDictionary)personsRequiringFilterProcessing;
- (NSMutableDictionary)queryHashesByZone;
- (PDASMSearchOperation)initWithDatabase:(id)a3;
- (PDASMSearchOperation)initWithDatabase:(id)a3 objectsMatching:(id)a4 enumerationBlock:(id)a5 finishBlock:(id)a6;
- (id)acceptContentType;
- (id)createQueryIfNoneExists:(id)a3;
- (id)createSearchRequestZoneForZoneName:(id)a3 usingQuery:(id)a4;
- (id)criteriaForFieldName:(id)a3 andValue:(id)a4;
- (id)criteriaForFieldName:(id)a3 andValues:(id)a4 withFormat:(id)a5;
- (id)customRequestHeaders;
- (id)endpointIdentifier;
- (id)generateFilterQueryForZoneName:(id)a3;
- (id)logSubsystem;
- (id)postFilterWillAcceptClassMember:(id)a3;
- (id)postFilterWillAcceptGroupMember:(id)a3;
- (id)processClassLocationIDsSearchQuery:(id)a3;
- (id)processClassMemberSearchQuery:(id)a3;
- (id)processGroupLocationIDsSearchQuery:(id)a3;
- (id)processGroupMemberSearchQuery:(id)a3;
- (id)processOrganizationSearchQuery:(id)a3;
- (id)processPersonSearchQuery:(id)a3;
- (id)requestContentType;
- (id)requestData;
- (void)callFinishBlockIfNeeded;
- (void)execute;
- (void)markAsFinished;
- (void)setDidCallFinishBlock:(BOOL)a3;
- (void)setPostFilterPersonsByRequiredClassMemberRole:(BOOL)a3;
- (void)setPostFilterPersonsByRequiredRolePrivilege:(BOOL)a3;
- (void)setPostFilterPersonsByRequiredRoleType:(BOOL)a3;
- (void)setQueryHashesByZone:(id)a3;
- (void)setReceivedResponse:(BOOL)a3;
@end

@implementation PDASMSearchOperation

+ (id)defaultEndpointInfo
{
  v2 = objc_alloc_init(PDEndpointInfo);
  sub_10007C770((uint64_t)v2, @"apple_school_manager");
  sub_1000435F8((uint64_t)v2, @"ee.autocomplete");
  sub_100043608((uint64_t)v2, @"https://ws.school.apple.com/maid/v1/directory/search");
  if (v2)
  {
    v2->_payloadLimitBytes = 0;
    v2->_responseTTLSeconds = 0;
    v2->_payloadLimitItems = 200;
    *(_WORD *)&v2->_requiresAuth = 257;
  }
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (BOOL)resultsWillExpire
{
  return 1;
}

- (id)logSubsystem
{
  return CLSLogSearch;
}

- (id)endpointIdentifier
{
  return @"ee.autocomplete";
}

- (id)requestContentType
{
  return @"application/x-protobuf";
}

- (id)acceptContentType
{
  return @"application/x-protobuf";
}

- (Class)expectedResponseClass
{
  return (Class)objc_opt_class();
}

- (PDASMSearchOperation)initWithDatabase:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PDASMSearchOperation;
  v5 = [(PDASMPayloadOperation *)&v14 initWithDatabase:v4];
  v6 = v5;
  if (v5)
  {
    HIBYTE(v5->_expireRecordsAfterSeconds) = 0;
    uint64_t v7 = objc_opt_new();
    v8 = *(CLSSearchSpecification **)((char *)&v6->_searchSpec + 2);
    *(CLSSearchSpecification **)((char *)&v6->_searchSpec + 2) = (CLSSearchSpecification *)v7;

    sub_100003A74(v4);
    v9 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    unsigned int v10 = [(PDASMSearchOperation *)v6 resultsWillExpire];
    double v11 = 0.0;
    if (v10) {
      BOOL v12 = v9 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12) {
      double v11 = (double)v9[8];
    }
    *(double *)(&v6->_resultsBlockStop + 2) = v11;
    [(PDASMSearchOperation *)v6 setQualityOfService:33];
    BYTE6(v6->_expireRecordsAfterSeconds) = 0;
  }
  return v6;
}

- (PDASMSearchOperation)initWithDatabase:(id)a3 objectsMatching:(id)a4 enumerationBlock:(id)a5 finishBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(PDASMSearchOperation *)self initWithDatabase:a3];
  if (v13)
  {
    id v14 = [v10 copy];
    v15 = *(void **)(&v13->_postFilterPersonsByRequiredClassMemberRole + 1);
    *(void *)(&v13->_postFilterPersonsByRequiredClassMemberRole + 1) = v14;

    v16 = (NSMutableSet *)objc_retainBlock(v11);
    v17 = *(NSMutableSet **)((char *)&v13->super._unresolvedMissingEntityIDs + 2);
    *(NSMutableSet **)((char *)&v13->super._unresolvedMissingEntityIDs + 2) = v16;

    id v18 = objc_retainBlock(v12);
    v19 = *(id *)((char *)&v13->_resultsBlock + 2);
    *(id *)((char *)&v13->_resultsBlock + 2) = v18;

    BYTE2(v13->_finishBlock) = 0;
    uint64_t v20 = objc_opt_new();
    v21 = *(NSMutableDictionary **)((char *)&v13->_queryHashesByZone + 2);
    *(NSMutableDictionary **)((char *)&v13->_queryHashesByZone + 2) = (NSMutableDictionary *)v20;
  }
  return v13;
}

- (id)customRequestHeaders
{
  uint64_t v3 = [(PDASMSearchOperation *)self searchSpec];
  if (!v3) {
    goto LABEL_6;
  }
  id v4 = (void *)v3;
  v5 = [(PDASMSearchOperation *)self searchSpec];
  v6 = [v5 adminRequestor];

  if (v6)
  {
    uint64_t v7 = [(PDASMSearchOperation *)self searchSpec];
    v8 = [v7 adminRequestor];

    v9 = [(PDOperation *)self database];
    uint64_t v10 = objc_opt_class();
    id v11 = [v8 objectID];
    id v12 = [v9 select:v10 identity:v11];

    if (v12)
    {
      objc_msgSend(v8, "setState:", objc_msgSend(v12, "state"));
      v13 = [v12 serverRequestHeaders];
      [v8 setServerRequestHeaders:v13];
    }
    id v14 = [v8 serverRequestHeaders];
  }
  else
  {
LABEL_6:
    id v14 = 0;
  }

  return v14;
}

- (void)callFinishBlockIfNeeded
{
  uint64_t v3 = (os_unfair_lock_s *)((char *)&self->_expireRecordsAfterSeconds + 2);
  os_unfair_lock_lock((os_unfair_lock_t)((char *)&self->_expireRecordsAfterSeconds + 2));
  if (*(id *)((char *)&self->_resultsBlock + 2) && !LOBYTE(self->_finisherLock._os_unfair_lock_opaque))
  {
    CLSInitLog();
    id v4 = [(PDASMSearchOperation *)self logSubsystem];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = objc_opt_class();
      id v6 = v5;
      uint64_t v7 = [(PDURLRequestOperation *)self operationID];
      int v8 = 138543618;
      v9 = v5;
      __int16 v10 = 2114;
      id v11 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Calling ASM Search finish block.", (uint8_t *)&v8, 0x16u);
    }
    (*(void (***)(void))((char *)&self->_resultsBlock + 2))[2]();
    LOBYTE(self->_finisherLock._os_unfair_lock_opaque) = 1;
  }
  os_unfair_lock_unlock(v3);
}

- (void)execute
{
  if (![(PDASMSearchOperation *)self wantsToExecute]) {
    [(PDASMSearchOperation *)self markAsFinished];
  }
  v3.receiver = self;
  v3.super_class = (Class)PDASMSearchOperation;
  [(PDEndpointRequestOperation *)&v3 execute];
}

- (void)markAsFinished
{
  [(PDASMSearchOperation *)self callFinishBlockIfNeeded];
  v7.receiver = self;
  v7.super_class = (Class)PDASMSearchOperation;
  [(PDEndpointRequestOperation *)&v7 markAsFinished];
  if (BYTE6(self->_expireRecordsAfterSeconds))
  {
    objc_super v3 = [PDASMExpandMissingGroupReferencesOperation alloc];
    id v4 = [(PDOperation *)self database];
    v5 = [(PDASMExpandMissingGroupReferencesOperation *)v3 initWithDatabase:v4];

    if ([(PDASMExpandMissingGroupReferencesOperation *)v5 wantsToExecute])
    {
      id v6 = [(PDOperation *)self manager];
      sub_100110A9C(v6, v5);
    }
  }
}

- (BOOL)isValidASMSearchSpecification:(id)a3
{
  id v4 = a3;
  if (((unint64_t)[v4 options] & 0xB) != 0)
  {
    uint64_t v5 = [v4 searchString];
    if (v5)
    {
      id v6 = (void *)v5;
      objc_super v7 = [v4 searchString];
      id v8 = [v7 length];
      v9 = [(PDOperation *)self database];
      __int16 v10 = sub_100003A74(v9);
      if (v10) {
        unint64_t v11 = v10[6];
      }
      else {
        unint64_t v11 = 0;
      }
      BOOL v12 = (unint64_t)v8 < v11;

      char v13 = !v12;
    }
    else
    {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

- (BOOL)haveIncompleteSyncData
{
  objc_super v3 = objc_opt_new();
  if ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) isPersonSearch])
  {
    id v4 = sub_1000795D4(5);
    [v3 addObject:v4];
  }
  if ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) isClassSearch])
  {
    uint64_t v5 = sub_1000795D4(6);
    [v3 addObject:v5];
  }
  if ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) isClassMemberSearch])
  {
    id v6 = sub_1000795D4(7);
    [v3 addObject:v6];
  }
  if ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) isGroupSearch])
  {
    objc_super v7 = sub_1000795D4(12);
    [v3 addObject:v7];
  }
  if ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) isGroupMemberSearch])
  {
    id v8 = sub_1000795D4(13);
    [v3 addObject:v8];
  }
  if ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) isOrganizationSearch])
  {
    v9 = sub_1000795D4(9);
    [v3 addObject:v9];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v16 = [(PDOperation *)self database];
        v17 = [v16 select:objc_opt_class() identity:v15];

        if (!v17 || v17[3] != 1)
        {

          BOOL v18 = 1;
          goto LABEL_25;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      BOOL v18 = 0;
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_25:

  return v18;
}

- (BOOL)needsToMakeNetworkRequest
{
  if (![(PDASMSearchOperation *)self isValidASMSearchSpecification:*(void *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1)])
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  objc_super v3 = [(PDOperation *)self database];
  uint64_t v4 = sub_100003A74(v3);
  uint64_t v5 = (void *)v4;
  if (v4 && *(unsigned char *)(v4 + 10))
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    unsigned __int8 v7 = [(PDASMSearchOperation *)self haveIncompleteSyncData];

    if (v7)
    {
      LOBYTE(v6) = 1;
      goto LABEL_12;
    }
    if (![*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) isOrganizationSearch])
    {
      LOBYTE(v6) = 0;
      goto LABEL_12;
    }
    uint64_t v5 = [(PDOperation *)self manager];
    BOOL v6 = !sub_100003494((BOOL)v5);
  }

LABEL_12:
  if ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) isClassMemberSearch])
  {
    BOOL v21 = v6;
    id v8 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v20 = self;
    v9 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredClassMemberClassIDs];
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v15 = [v3 select:objc_opt_class() identity:v14];
          v16 = [v15 dateExpires];

          if (v16) {
            [v8 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    LOBYTE(v6) = v21;
    if ([v8 count])
    {
      id v17 = [*(id *)(&v20->_postFilterPersonsByRequiredClassMemberRole + 1) copy];
      BOOL v18 = *(void **)(&v20->_postFilterPersonsByRequiredClassMemberRole + 1);
      *(void *)(&v20->_postFilterPersonsByRequiredClassMemberRole + 1) = v17;

      objc_msgSend(*(id *)(&v20->_postFilterPersonsByRequiredClassMemberRole + 1), "requireClassMemberRole:forClassIDs:", objc_msgSend(*(id *)(&v20->_postFilterPersonsByRequiredClassMemberRole + 1), "requiredClassMemberRole"), v8);
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (BOOL)wantsToExecute
{
  [*(id *)((char *)&self->super.super._responseStatusError + 2) removeAllObjects];
  BOOL v3 = [(PDASMSearchOperation *)self needsToMakeNetworkRequest];
  if (v3) {
    LOBYTE(v3) = HIBYTE(self->_expireRecordsAfterSeconds) == 0;
  }
  return v3;
}

- (id)createSearchRequestZoneForZoneName:(id)a3 usingQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(PDDPEESearchRequestZone);
  v9 = *(void **)(&self->_postFilterPersonsByRequiredClassMemberRole + 1);
  if (v9)
  {
    id v10 = [v9 searchString];
    [(PDDPEESearchRequestZone *)v8 setKeyword:v10];

    -[PDDPEESearchRequestZone setCompareOptions:](v8, "setCompareOptions:", [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) compareOptions]);
    id v11 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) searchString];
    uint64_t v12 = +[PDASMSearchRecordZone hashForQuery:v7 withSearchText:v11];
  }
  else
  {
    [(PDDPEESearchRequestZone *)v8 setCompareOptions:2];
    uint64_t v12 = +[PDASMSearchRecordZone hashForQuery:v7 withSearchText:0];
  }
  [*(id *)((char *)&self->_searchSpec + 2) setObject:v12 forKeyedSubscript:v6];
  uint64_t v13 = [(PDOperation *)self database];
  uint64_t v14 = objc_opt_class();
  v23[0] = v6;
  v23[1] = v12;
  uint64_t v15 = +[NSArray arrayWithObjects:v23 count:2];
  v16 = [v13 select:v14 where:@"zoneName = ? AND queryHash = ?" bindings:v15];

  id v17 = sub_100079528(v6, v16);
  [(PDDPEESearchRequestZone *)v8 setRequestZone:v17];
  uint64_t v18 = [(PDEndpointRequestOperation *)self endpointInfo];
  v19 = (void *)v18;
  if (v18) {
    uint64_t v20 = *(unsigned int *)(v18 + 64);
  }
  else {
    uint64_t v20 = 0;
  }
  BOOL v21 = [(PDDPEESearchRequestZone *)v8 requestZone];
  [v21 setLimit:v20];

  if (v7) {
    [(PDDPEESearchRequestZone *)v8 setFilterQuery:v7];
  }

  return v8;
}

- (id)requestData
{
  if ([(PDOperation *)self isAborted])
  {
    BOOL v3 = 0;
  }
  else
  {
    v39 = objc_alloc_init(PDDPEESearchRequest);
    uint64_t v4 = objc_opt_new();
    if ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) options])
    {
      if ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) isClassMemberSearch])
      {
        int v5 = 7;
      }
      else if ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) isGroupMemberSearch])
      {
        int v5 = 13;
      }
      else
      {
        int v5 = 5;
      }
      id v6 = sub_1000795D4(v5);
      [v4 addObject:v6];
    }
    if (([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) options] & 2) != 0)
    {
      id v7 = sub_1000795D4(6);
      [v4 addObject:v7];
    }
    if (([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) options] & 0x10) != 0)
    {
      id v8 = sub_1000795D4(12);
      [v4 addObject:v8];
    }
    if (([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) options] & 8) != 0)
    {
      v9 = sub_1000795D4(9);
      [v4 addObject:v9];
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v11)
    {
      id v13 = v11;
      uint64_t v14 = *(void *)v41;
      *(void *)&long long v12 = 138543874;
      long long v36 = v12;
      id obj = v10;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          id v17 = -[PDASMSearchOperation generateFilterQueryForZoneName:](self, "generateFilterQueryForZoneName:", v16, v36);
          uint64_t v18 = [(PDASMSearchOperation *)self createSearchRequestZoneForZoneName:v16 usingQuery:v17];
          v19 = [(PDASMSearchOperation *)self searchSpec];

          if (v19)
          {
            uint64_t v20 = [(PDASMSearchOperation *)self searchSpec];
            BOOL v21 = [v20 adminRequestor];
            long long v22 = sub_10007B314(v21);
            long long v23 = [v18 requestZone];
            [v23 setRequestor:v22];
          }
          long long v24 = +[PDUserDefaults sharedDefaults];
          unsigned int v25 = [v24 enableVerboseLogging];

          if (v25)
          {
            CLSInitLog();
            v26 = [(PDASMSearchOperation *)self logSubsystem];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              v27 = objc_opt_class();
              id v37 = v27;
              v28 = [(PDURLRequestOperation *)self operationID];
              v29 = [v18 description];
              *(_DWORD *)buf = v36;
              v45 = v27;
              __int16 v46 = 2114;
              v47 = v28;
              __int16 v48 = 2112;
              v49 = v29;
              _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ adding eeSearchRequestZone: %@", buf, 0x20u);
            }
          }
          [(PDDPEESearchRequest *)v39 addSearchRequestZones:v18];
        }
        id v10 = obj;
        id v13 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
      }
      while (v13);
    }

    CLSInitLog();
    v30 = [(PDASMSearchOperation *)self logSubsystem];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v32 = objc_opt_class();
      id v33 = v32;
      v34 = [(PDURLRequestOperation *)self operationID];
      v35 = [(PDDPEESearchRequest *)v39 dictionaryRepresentation];
      *(_DWORD *)buf = 138543874;
      v45 = v32;
      __int16 v46 = 2114;
      v47 = v34;
      __int16 v48 = 2114;
      v49 = v35;
      _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ Search request: %{public}@", buf, 0x20u);
    }
    BOOL v3 = [(PDDPEESearchRequest *)v39 data];
  }

  return v3;
}

- (BOOL)shouldProcessResponseBody
{
  v4.receiver = self;
  v4.super_class = (Class)PDASMSearchOperation;
  BOOL result = [(PDEndpointRequestOperation *)&v4 shouldProcessResponseBody];
  HIBYTE(self->_expireRecordsAfterSeconds) = 1;
  return result;
}

- (BOOL)processResponseZone:(id)a3
{
  id v4 = a3;
  int v5 = [(PDOperation *)self database];
  id v6 = *(CLSSearchSpecification **)((char *)&self->_searchSpec + 2);
  id v7 = [v4 zoneName];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [v4 zoneName];
    v36[0] = v10;
    v36[1] = v8;
    id v11 = +[NSArray arrayWithObjects:v36 count:2];
    long long v12 = [v5 select:v9 where:@"zoneName = ? AND queryHash = ?" bindings:v11];
  }
  else
  {
    long long v12 = 0;
  }
  id v13 = [v4 status];
  unsigned int v14 = [v13 code];

  uint64_t v15 = [v4 status];
  unsigned int v16 = [v15 code];

  if (v16 == 111)
  {
    CLSInitLog();
    id v17 = [(PDASMSearchOperation *)self logSubsystem];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v30 = [v4 zoneName];
      *(_DWORD *)buf = 138412290;
      v35 = v30;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "zone access denied: %@", buf, 0xCu);
    }
    uint64_t v18 = [v4 zoneName];
    v33.receiver = self;
    v33.super_class = (Class)PDASMSearchOperation;
    unsigned __int8 v19 = [(PDASMPayloadOperation *)&v33 handleZoneRemoved:v18];
LABEL_13:
    unsigned __int8 v25 = v19;
LABEL_14:

    goto LABEL_20;
  }
  if (v14 == 4)
  {
    uint64_t v20 = [v4 cursor];

    if (v20)
    {
      CLSInitLog();
      BOOL v21 = [(PDASMSearchOperation *)self logSubsystem];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v32 = [v4 zoneName];
        *(_DWORD *)buf = 138412290;
        v35 = v32;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "search zone: %@ has more data, saving cursor.", buf, 0xCu);
      }
      long long v22 = [PDASMSearchRecordZone alloc];
      long long v23 = [v4 zoneName];
      uint64_t v18 = [(PDASMSearchRecordZone *)v22 initWithZoneName:v23 andQueryHash:v8];

      [v18 setExpiration:*(double *)(&self->_resultsBlockStop + 2)];
      long long v24 = [v4 cursor];
      [v18 setCursor:v24];

      unsigned __int8 v19 = [v5 insertOrUpdateObject:v18];
      goto LABEL_13;
    }
  }
  if (v12)
  {
    CLSInitLog();
    v26 = [(PDASMSearchOperation *)self logSubsystem];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v31 = [v4 zoneName];
      *(_DWORD *)buf = 138412290;
      v35 = v31;
      _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "search zone: %@ complete, deleting it.", buf, 0xCu);
    }
    if (([v5 deleteObject:v12] & 1) == 0)
    {
      CLSInitLog();
      uint64_t v18 = [(PDASMSearchOperation *)self logSubsystem];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "failed to delete old PDASMSearchRecordZone record.", buf, 2u);
      }
      unsigned __int8 v25 = 0;
      goto LABEL_14;
    }
  }
  unsigned __int8 v25 = 1;
LABEL_20:
  if ([v4 hasRequestor])
  {
    v27 = [v4 requestor];
    v28 = sub_10007B420(v27);

    if (v28) {
      unsigned __int8 v25 = [v5 insertOrUpdateObject:v28];
    }
  }
  return v25;
}

- (BOOL)postFilterWillAcceptPerson:(id)a3 withRoleLocations:(id)a4
{
  id v5 = a3;
  if (([v5 isSearchable] & 1) != 0
    || [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) includeUnsearchablePersons])
  {
    if (!HIBYTE(self->_finisherLock._os_unfair_lock_opaque))
    {
      BOOL v8 = 1;
      goto LABEL_7;
    }
    id v6 = *(NSMutableDictionary **)((char *)&self->_queryHashesByZone + 2);
    id v7 = [v5 objectID];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

- (id)postFilterWillAcceptClassMember:(id)a3
{
  id v4 = a3;
  id v5 = *(NSMutableDictionary **)((char *)&self->_queryHashesByZone + 2);
  id v6 = [v4 personID];
  id v7 = [v5 objectForKeyedSubscript:v6];

  BOOL v8 = *(NSMutableDictionary **)((char *)&self->_queryHashesByZone + 2);
  uint64_t v9 = [v4 personID];
  [v8 removeObjectForKey:v9];

  if (v7
    && (unint64_t v10 = (unint64_t)[v4 roles],
        ((unint64_t)[*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredClassMemberRole] & v10) == 0))
  {
    id v11 = 0;
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

- (id)postFilterWillAcceptGroupMember:(id)a3
{
  id v4 = *(NSMutableDictionary **)((char *)&self->_queryHashesByZone + 2);
  id v5 = a3;
  id v6 = [v5 personID];
  id v7 = [v4 objectForKeyedSubscript:v6];

  BOOL v8 = *(NSMutableDictionary **)((char *)&self->_queryHashesByZone + 2);
  uint64_t v9 = [v5 personID];

  [v8 removeObjectForKey:v9];

  return v7;
}

- (BOOL)processPerson:(id)a3
{
  id v4 = a3;
  id v5 = [(PDOperation *)self database];
  id v6 = sub_100079604(v4);
  [v6 setExpiration:*(double *)(&self->_resultsBlockStop + 2)];
  id v7 = sub_100079A04(v4);

  unsigned int v8 = sub_10010C28C(v5, v6, v7);
  if (v8
    && *(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2)
    && !BYTE2(self->_finishBlock)
    && [(PDASMSearchOperation *)self postFilterWillAcceptPerson:v6 withRoleLocations:v7])
  {
    CLSInitLog();
    uint64_t v9 = CLSLogSearch;
    if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      long long v12 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Adding ASM search result to buffer. %@", (uint8_t *)&v11, 0xCu);
    }
    ((void (*)(void))(*(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2))[2].super.super.isa)();
  }

  return v8;
}

- (BOOL)processClassPayload:(id)a3
{
  id v4 = a3;
  if ([v4 hasClassInfo])
  {
    id v5 = [v4 classInfo];
    id v6 = sub_10007A010(v5);

    [v6 setExpiration:*(double *)(&self->_resultsBlockStop + 2)];
    id v7 = [v4 tempObjectId];
    [v6 setTempObjectID:v7];

    BOOL v8 = [(PDASMPayloadOperation *)self insertEntity:v6];
    if (v8 && *(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2) && !BYTE2(self->_finishBlock))
    {
      CLSInitLog();
      uint64_t v9 = CLSLogSearch;
      if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412290;
        long long v12 = v6;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Adding ASM search result to buffer. %@", (uint8_t *)&v11, 0xCu);
      }
      ((void (*)(void))(*(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2))[2].super.super.isa)();
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)processClassMember:(id)a3
{
  sub_10007A5A4(a3);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v28;
    char v8 = 1;
    *(void *)&long long v5 = 138412290;
    long long v24 = v5;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "setExpiration:", *(double *)(&self->_resultsBlockStop + 2), v24);
        unsigned int v11 = [(PDASMPayloadOperation *)self insertEntity:v10];
        if (!v11)
        {
          id v13 = [v10 personID];
          uint64_t v14 = objc_opt_class();
          uint64_t v15 = [v10 objectID];
          [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v13 forClass:v14 fromEntityWithID:v15 withClass:objc_opt_class()];

          unsigned int v16 = [v10 parentObjectID];
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = [v10 objectID];
          LODWORD(v17) = [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v16 forClass:v17 fromEntityWithID:v18 withClass:objc_opt_class()];

          if (!v17) {
            goto LABEL_19;
          }
          CLSInitLog();
          unsigned __int8 v19 = (void *)CLSLogSearch;
          if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_DEBUG))
          {
            BOOL v21 = v19;
            long long v22 = [v10 parentObjectID];
            *(_DWORD *)buf = v24;
            v32 = v22;
            _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "ClassMember referenced missing class: '%@'", buf, 0xCu);
          }
          uint64_t v20 = *(NSError **)((char *)&self->super.super._responseStatusError + 2);
          long long v12 = [v10 parentObjectID];
          [v20 addObject:v12];
          goto LABEL_18;
        }
        if (*(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2)
          && !BYTE2(self->_finishBlock)
          && ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) options] & 1) != 0)
        {
          long long v12 = [(PDASMSearchOperation *)self postFilterWillAcceptClassMember:v10];
          if (v12)
          {
            CLSInitLog();
            log = CLSLogSearch;
            if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v24;
              v32 = v10;
              _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Adding ASM search result to buffer. %@", buf, 0xCu);
            }
            ((void (*)(void))(*(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2))[2].super.super.isa)();
          }
LABEL_18:
        }
LABEL_19:
        v8 &= v11;
      }
      id v6 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (!v6) {
        goto LABEL_23;
      }
    }
  }
  char v8 = 1;
LABEL_23:

  return v8;
}

- (BOOL)processGroupPayload:(id)a3
{
  id v4 = a3;
  if ([v4 hasGroupInfo])
  {
    long long v5 = [(PDOperation *)self database];
    id v6 = [v4 groupInfo];
    uint64_t v7 = sub_100079D7C(v6);

    char v8 = [PDGroupReferencesToExpand alloc];
    uint64_t v9 = [v7 objectID];
    unint64_t v10 = sub_1000C630C((id *)&v8->super.isa, v9);

    [v5 insertOrUpdateObject:v10];
    BYTE6(self->_expireRecordsAfterSeconds) = 1;
    [v7 setExpiration:*(double *)(&self->_resultsBlockStop + 2)];
    BOOL v11 = [(PDASMPayloadOperation *)self insertEntity:v7];
    if (v11 && *(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2) && !BYTE2(self->_finishBlock))
    {
      CLSInitLog();
      long long v12 = CLSLogSearch;
      if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 138412290;
        uint64_t v15 = v7;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Adding ASM search result to buffer. %@", (uint8_t *)&v14, 0xCu);
      }
      ((void (*)(void))(*(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2))[2].super.super.isa)();
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)processGroupMember:(id)a3
{
  sub_10007A6EC(a3);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v36 = *(void *)v38;
    char v7 = 1;
    char v8 = CKRecordID_ptr;
    *(void *)&long long v5 = 138412290;
    long long v33 = v5;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v38 != v36) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        BOOL v11 = [(PDOperation *)self database];
        uint64_t v12 = objc_opt_class();
        id v13 = [v10 parentObjectID];
        int v14 = [v11 select:v12 identity:v13];

        if (!v14)
        {
          id v15 = [objc_alloc((Class)v8[44]) _init];
          [v15 setGroupName:&stru_1001F6580];
          unsigned int v16 = [v10 parentObjectID];
          [v15 setObjectID:v16];

          [v15 setExpiration:*(double *)(&self->_resultsBlockStop + 2)];
          if (![(PDASMPayloadOperation *)self insertEntity:v15])
          {
            CLSInitLog();
            uint64_t v17 = (void *)CLSLogSearch;
            if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_ERROR))
            {
              long long v30 = v17;
              v31 = [v15 objectID];
              *(_DWORD *)buf = v33;
              long long v42 = v31;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Error inserting CLSGroup with identifier: %@", buf, 0xCu);
            }
          }
        }
        [v10 setExpiration:*(double *)(&self->_resultsBlockStop + 2)];
        unsigned int v18 = [(PDASMPayloadOperation *)self insertEntity:v10];
        if (!v18)
        {
          uint64_t v20 = [v10 personID];
          uint64_t v21 = objc_opt_class();
          long long v22 = [v10 objectID];
          [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v20 forClass:v21 fromEntityWithID:v22 withClass:objc_opt_class()];

          long long v23 = [v10 parentObjectID];
          uint64_t v24 = objc_opt_class();
          unsigned __int8 v25 = [v10 objectID];
          LODWORD(v24) = [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v23 forClass:v24 fromEntityWithID:v25 withClass:objc_opt_class()];

          if (!v24) {
            goto LABEL_24;
          }
          CLSInitLog();
          v26 = (void *)CLSLogSearch;
          if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_DEBUG))
          {
            long long v28 = v26;
            long long v29 = [v10 parentObjectID];
            *(_DWORD *)buf = v33;
            long long v42 = v29;
            _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "GroupMember referenced missing group: '%@'", buf, 0xCu);
          }
          long long v27 = *(NSError **)((char *)&self->super.super._responseStatusError + 2);
          unsigned __int8 v19 = [v10 parentObjectID];
          [v27 addObject:v19];
          goto LABEL_23;
        }
        if (*(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2)
          && !BYTE2(self->_finishBlock)
          && ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) options] & 1) != 0)
        {
          unsigned __int8 v19 = [(PDASMSearchOperation *)self postFilterWillAcceptGroupMember:v10];
          if (v19)
          {
            CLSInitLog();
            log = CLSLogSearch;
            if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v33;
              long long v42 = v10;
              _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Adding ASM search result to buffer. %@", buf, 0xCu);
            }
            ((void (*)(void))(*(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2))[2].super.super.isa)();
          }
LABEL_23:
        }
LABEL_24:
        v7 &= v18;

        char v8 = CKRecordID_ptr;
      }
      id v6 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (!v6) {
        goto LABEL_28;
      }
    }
  }
  char v7 = 1;
LABEL_28:

  return v7;
}

- (BOOL)processOrganization:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (v4)
  {
    id v6 = sub_10007AF14(v4);
    long long v28 = v6;
    long long v30 = v5;
    if ([v6 count])
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v7 = v6;
      id v8 = [v7 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v37;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v37 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            objc_msgSend(v12, "setExpiration:", *(double *)(&self->_resultsBlockStop + 2), v28, v30);
            if (![(PDASMPayloadOperation *)self insertEntity:v12])
            {
              CLSInitLog();
              id v13 = [(PDASMSearchOperation *)self logSubsystem];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                int v14 = objc_opt_class();
                *(_DWORD *)buf = 138543618;
                long long v42 = v14;
                __int16 v43 = 2114;
                v44 = v12;
                id v15 = v14;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@ failed to save location: %{public}@", buf, 0x16u);
              }
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v36 objects:v45 count:16];
        }
        while (v9);
      }

      id v6 = v28;
      long long v5 = v30;
    }
    unsigned int v16 = sub_10007B058(v5);
    [v16 setExpiration:*(double *)(&self->_resultsBlockStop + 2)];
    BOOL v17 = [(PDASMPayloadOperation *)self insertEntity:v16];
    if (v17)
    {
      if (*(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2) && !BYTE2(self->_finishBlock))
      {
        CLSInitLog();
        unsigned int v18 = CLSLogSearch;
        if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v42 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Adding ASM search result to buffer. %@", buf, 0xCu);
        }
        ((void (*)(void))(*(NSMutableSet **)((char *)&self->super._unresolvedMissingEntityIDs + 2))[2].super.super.isa)();
      }
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      unsigned __int8 v19 = objc_msgSend(v16, "locationIDs", v28, v30);
      id v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v33;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v33 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * (void)j);
            uint64_t v25 = objc_opt_class();
            v26 = [v16 objectID];
            [(PDEndpointRequestOperation *)self checkForMissingEntityWithObjectID:v24 forClass:v25 fromEntityWithID:v26 withClass:objc_opt_class()];
          }
          id v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v21);
      }

      id v6 = v29;
      long long v5 = v31;
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (id)generateFilterQueryForZoneName:(id)a3
{
  id v4 = a3;
  long long v5 = sub_1000795D4(5);
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [(PDASMSearchOperation *)self processPersonSearchQuery:0];
LABEL_13:
    unsigned int v18 = (void *)v7;
    goto LABEL_14;
  }
  id v8 = sub_1000795D4(6);
  unsigned int v9 = [v4 isEqualToString:v8];

  if (v9)
  {
    uint64_t v7 = [(PDASMSearchOperation *)self processClassLocationIDsSearchQuery:0];
    goto LABEL_13;
  }
  uint64_t v10 = sub_1000795D4(7);
  unsigned int v11 = [v4 isEqualToString:v10];

  if (v11)
  {
    uint64_t v7 = [(PDASMSearchOperation *)self processClassMemberSearchQuery:0];
    goto LABEL_13;
  }
  uint64_t v12 = sub_1000795D4(12);
  unsigned int v13 = [v4 isEqualToString:v12];

  if (v13)
  {
    uint64_t v7 = [(PDASMSearchOperation *)self processGroupLocationIDsSearchQuery:0];
    goto LABEL_13;
  }
  int v14 = sub_1000795D4(13);
  unsigned int v15 = [v4 isEqualToString:v14];

  if (v15)
  {
    uint64_t v7 = [(PDASMSearchOperation *)self processGroupMemberSearchQuery:0];
    goto LABEL_13;
  }
  unsigned int v16 = sub_1000795D4(9);
  unsigned int v17 = [v4 isEqualToString:v16];

  if (v17)
  {
    uint64_t v7 = [(PDASMSearchOperation *)self processOrganizationSearchQuery:0];
    goto LABEL_13;
  }
  unsigned int v18 = 0;
LABEL_14:

  return v18;
}

- (id)createQueryIfNoneExists:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3) {
    long long v5 = (PDDPSearchQuery *)v3;
  }
  else {
    long long v5 = objc_alloc_init(PDDPSearchQuery);
  }
  unsigned int v6 = v5;

  return v6;
}

- (id)criteriaForFieldName:(id)a3 andValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(PDDPSearchCriteria);
  [(PDDPSearchCriteria *)v7 setFieldName:v6];

  [(PDDPSearchCriteria *)v7 setSearchOperator:2];
  id v8 = objc_alloc_init(PDDPTypedValue);
  [(PDDPTypedValue *)v8 setType:1];
  [(PDDPTypedValue *)v8 setStringValue:v5];

  [(PDDPSearchCriteria *)v7 setValue:v8];

  return v7;
}

- (id)criteriaForFieldName:(id)a3 andValues:(id)a4 withFormat:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count] == (id)1)
  {
    unsigned int v11 = [v9 firstObject];
    uint64_t v12 = [(PDASMSearchOperation *)self criteriaForFieldName:v8 andValue:v11];
  }
  else
  {
    unsigned int v13 = objc_alloc_init(PDDPSearchCriteria);
    id v27 = v8;
    [(PDDPSearchCriteria *)v13 setFieldName:v8];
    uint64_t v25 = v13;
    [(PDDPSearchCriteria *)v13 setSearchOperator:7];
    int v14 = objc_alloc_init(PDDPTypedValue);
    [(PDDPTypedValue *)v14 setType:2];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v26 = v9;
    id v15 = v9;
    id v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        unsigned __int8 v19 = 0;
        do
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v19);
          if (v10)
          {
            id v28 = 0;
            id v21 = +[NSString stringWithValidatedFormat:v10, @"%@", &v28, v20 validFormatSpecifiers error];
            id v22 = v28;
            if (v21)
            {
              [(PDDPTypedValue *)v14 addStringListValue:v21];
            }
            else
            {
              CLSInitLog();
              long long v23 = CLSLogSearch;
              if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v34 = v10;
                __int16 v35 = 2112;
                id v36 = v22;
                _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to validate formatString: '%@', error: %@", buf, 0x16u);
              }
            }
          }
          else
          {
            [(PDDPTypedValue *)v14 addStringListValue:v20];
          }
          unsigned __int8 v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v17);
    }

    uint64_t v12 = v25;
    [(PDDPSearchCriteria *)v25 setValue:v14];

    id v9 = v26;
    id v8 = v27;
  }

  return v12;
}

- (id)processClassLocationIDsSearchQuery:(id)a3
{
  id v4 = a3;
  id v5 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) classLocationIDs];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(PDASMSearchOperation *)self createQueryIfNoneExists:v4];
    [v7 setType:3];
    id v8 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) classLocationIDs];
    id v9 = [(PDASMSearchOperation *)self criteriaForFieldName:@"location_uid" andValues:v8 withFormat:0];

    [v7 setCriteria:v9];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (id)processGroupLocationIDsSearchQuery:(id)a3
{
  id v4 = a3;
  id v5 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredGroupMemberGroupIDs];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(PDASMSearchOperation *)self createQueryIfNoneExists:v4];
    [v7 setType:3];
    id v8 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) groupLocationIDs];
    id v9 = [(PDASMSearchOperation *)self criteriaForFieldName:@"location_uid" andValues:v8 withFormat:0];

    [v7 setCriteria:v9];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (id)processGroupMemberSearchQuery:(id)a3
{
  id v4 = a3;
  id v5 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredGroupMemberGroupIDs];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(PDASMSearchOperation *)self createQueryIfNoneExists:v4];
    HIBYTE(self->_finisherLock._os_unfair_lock_opaque) = 1;
    [v7 setType:3];
    id v8 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredGroupMemberGroupIDs];
    id v9 = [(PDASMSearchOperation *)self criteriaForFieldName:@"group_id" andValues:v8 withFormat:0];

    [v7 setCriteria:v9];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (id)processPersonSearchQuery:(id)a3
{
  id v7 = a3;
  id v8 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredRoleType];
  if (v8
    || ([*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredRoleID],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) personLocationIDs];
    int v9 = 1;
    BOOL v10 = 1;
    if ([v3 count]) {
      goto LABEL_16;
    }
  }
  else
  {
    int v9 = 0;
  }
  unsigned int v11 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredPrivilege];
  if (v11)
  {
    id v4 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredPrivilegeLocationIDs];
    if ([v4 count])
    {
      BOOL v10 = 1;
      goto LABEL_15;
    }
    __int16 v35 = v5;
  }
  else
  {
    __int16 v35 = v5;
  }
  uint64_t v12 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) prohibitedPrivilege];
  if (v12)
  {
    unsigned int v13 = (void *)v12;
    [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) prohibitedPrivilegeLocationIDs];
    int v14 = v37 = v7;
    BOOL v10 = [v14 count] != 0;

    id v7 = v37;
  }
  else
  {
    BOOL v10 = 0;
  }
  id v5 = v35;
  if (v11)
  {
LABEL_15:

    if ((v9 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v9) {
LABEL_16:
  }

LABEL_17:
  if (!v8)
  {

    if (v10) {
      goto LABEL_19;
    }
LABEL_24:
    id v21 = v7;
    goto LABEL_43;
  }
  if (!v10) {
    goto LABEL_24;
  }
LABEL_19:
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100081114;
  v41[3] = &unk_1001F3630;
  v41[4] = self;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000811A4;
  v39[3] = &unk_1001F3658;
  id v15 = objc_retainBlock(v41);
  v39[4] = self;
  id v40 = v15;
  id v16 = objc_retainBlock(v39);
  id v17 = [(PDOperation *)self database];
  uint64_t v18 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) personLocationIDs];
  id v19 = [v18 count];

  if (!v19) {
    goto LABEL_28;
  }
  uint64_t v20 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredRoleID];
  if (!v20)
  {
    if (![*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredRoleType]) {
      goto LABEL_28;
    }
    long long v23 = sub_100051FC8(v17, (uint64_t)[*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredRoleType]);
    if (![v23 count])
    {
      id v21 = 0;
      BYTE1(self->_finisherLock._os_unfair_lock_opaque) = 1;
      goto LABEL_22;
    }
    uint64_t v24 = [v23 firstObject];
    uint64_t v20 = [v24 objectID];

    if (!v20)
    {
LABEL_28:
      id v21 = 0;
      goto LABEL_29;
    }
  }
  id v21 = [(PDASMSearchOperation *)self createQueryIfNoneExists:v7];
  id v22 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) personLocationIDs];
  ((void (*)(void *, uint64_t, void *, id))v16[2])(v16, v20, v22, v21);

  long long v23 = (void *)v20;
LABEL_22:

LABEL_29:
  uint64_t v25 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredPrivilegeLocationIDs];
  id v26 = [v25 count];

  if (v26)
  {
    id v27 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredRoleID];
    id v28 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredPrivilege];
    if (v28)
    {
      id v38 = v7;
      long long v29 = sub_100051C1C(v17, v28);
      if ([v29 count])
      {
        [v29 firstObject];
        v30 = id v36 = v16;
        [v30 objectID];
        uint64_t v32 = v31 = v15;

        id v16 = v36;
        id v27 = (void *)v32;
        id v15 = v31;
      }
      else
      {
        BYTE2(self->_finisherLock._os_unfair_lock_opaque) = 1;
      }

      id v7 = v38;
    }
    if (v27)
    {
      if (!v21)
      {
        id v21 = [(PDASMSearchOperation *)self createQueryIfNoneExists:v7];
      }
      long long v33 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredPrivilegeLocationIDs];
      ((void (*)(void *, void *, void *, id))v16[2])(v16, v27, v33, v21);
    }
  }

LABEL_43:

  return v21;
}

- (id)processClassMemberSearchQuery:(id)a3
{
  id v4 = a3;
  id v5 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredClassMemberClassIDs];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(PDASMSearchOperation *)self createQueryIfNoneExists:v4];
    HIBYTE(self->_finisherLock._os_unfair_lock_opaque) = 1;
    [v7 setType:3];
    id v8 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredClassMemberClassIDs];
    int v9 = [(PDASMSearchOperation *)self criteriaForFieldName:@"class_id" andValues:v8 withFormat:0];

    [v7 setCriteria:v9];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (id)processOrganizationSearchQuery:(id)a3
{
  id v4 = a3;
  id v5 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredOrganizationEmailDomain];

  if (v5)
  {
    id v6 = [(PDASMSearchOperation *)self createQueryIfNoneExists:v4];
    [v6 setType:3];
    id v7 = [*(id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1) requiredOrganizationEmailDomain];
    id v8 = [(PDASMSearchOperation *)self criteriaForFieldName:@"org_email_domain" andValue:v7];

    [v6 setCriteria:v8];
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (CLSSearchSpecification)searchSpec
{
  return *(CLSSearchSpecification **)(&self->_postFilterPersonsByRequiredClassMemberRole + 1);
}

- (BOOL)receivedResponse
{
  return HIBYTE(self->_expireRecordsAfterSeconds);
}

- (void)setReceivedResponse:(BOOL)a3
{
  HIBYTE(self->_expireRecordsAfterSeconds) = a3;
}

- (BOOL)didCallFinishBlock
{
  return self->_finisherLock._os_unfair_lock_opaque;
}

- (void)setDidCallFinishBlock:(BOOL)a3
{
  LOBYTE(self->_finisherLock._os_unfair_lock_opaque) = a3;
}

- (NSMutableDictionary)queryHashesByZone
{
  return *(NSMutableDictionary **)((char *)&self->_searchSpec + 2);
}

- (void)setQueryHashesByZone:(id)a3
{
}

- (BOOL)postFilterPersonsByRequiredRoleType
{
  return BYTE1(self->_finisherLock._os_unfair_lock_opaque);
}

- (void)setPostFilterPersonsByRequiredRoleType:(BOOL)a3
{
  BYTE1(self->_finisherLock._os_unfair_lock_opaque) = a3;
}

- (BOOL)postFilterPersonsByRequiredRolePrivilege
{
  return BYTE2(self->_finisherLock._os_unfair_lock_opaque);
}

- (void)setPostFilterPersonsByRequiredRolePrivilege:(BOOL)a3
{
  BYTE2(self->_finisherLock._os_unfair_lock_opaque) = a3;
}

- (BOOL)postFilterPersonsByRequiredClassMemberRole
{
  return HIBYTE(self->_finisherLock._os_unfair_lock_opaque);
}

- (void)setPostFilterPersonsByRequiredClassMemberRole:(BOOL)a3
{
  HIBYTE(self->_finisherLock._os_unfair_lock_opaque) = a3;
}

- (NSMutableDictionary)personsRequiringFilterProcessing
{
  return *(NSMutableDictionary **)((char *)&self->_queryHashesByZone + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_queryHashesByZone + 2), 0);
  objc_storeStrong((id *)((char *)&self->_searchSpec + 2), 0);
  objc_storeStrong((id *)(&self->_postFilterPersonsByRequiredClassMemberRole + 1), 0);
  objc_storeStrong((id *)((char *)&self->_resultsBlock + 2), 0);

  objc_storeStrong((id *)((char *)&self->super._unresolvedMissingEntityIDs + 2), 0);
}

@end