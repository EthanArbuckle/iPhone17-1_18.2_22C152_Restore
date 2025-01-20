@interface DRSEnableDataGatheringQuery
+ (id)_ON_MOC_QUEUE_enableDataGatheringQueriesForFilterPredicate:(id)a3 context:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 errorOut:(id *)a7;
+ (id)_ON_MOC_QUEUE_enableDataGatheringQueryForID:(id)a3 context:(id)a4;
+ (id)cachedQueryResponseForQuery:(id)a3 inContext:(id)a4 errorOut:(id *)a5;
+ (id)enableDataGatheringQueriesForFilterPredicate:(id)a3 context:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 errorOut:(id *)a7;
+ (id)enableDataGatheringQueryForID:(id)a3 context:(id)a4;
+ (id)entityName;
+ (id)leastRecentDateFirstSortDescriptor;
+ (id)mostRecentDateFirstSortDescriptor;
- (BOOL)doesMatchCachedQuery:(id)a3;
- (BOOL)isContinue;
- (BOOL)isEqualToDataGatheringQuery:(id)a3;
- (BOOL)submitQuery;
- (Class)pbBatchResponseClass;
- (DRSDecisionServerBatchRequest)pbBatchInstance;
- (DRSEnableDataGatheringQuery)initWithXPCDict:(id)a3;
- (NSData)contextDictionaryData;
- (NSDate)queryDate;
- (NSDictionary)contextDictionary;
- (NSString)build;
- (NSString)debugDescription;
- (NSString)functionName;
- (NSString)issueCategory;
- (NSString)logType;
- (NSString)rejectionReason;
- (NSString)responseString;
- (NSString)teamID;
- (NSUUID)queryID;
- (id)_initWithMO_ON_MOC_QUEUE:(id)a3;
- (id)jsonCompatibleDictionaryRepresentation;
- (id)protobufRepresentation;
- (unsigned)attemptCount;
- (unsigned)response;
- (void)queryFinishedWithDecision:(id)a3 error:(id)a4;
- (void)setIsContinue:(BOOL)a3;
- (void)setRejectionReason:(id)a3;
- (void)setResponse:(unsigned __int8)a3;
- (void)updateContextWithDataGatheringQuery_ON_MOC_QUEUE:(id)a3;
@end

@implementation DRSEnableDataGatheringQuery

- (id)protobufRepresentation
{
  if ([(DRSEnableDataGatheringQuery *)self response] == 2)
  {
    v3 = objc_alloc_init(DRSProtoEnableDataGatheringRequest);
    v4 = objc_alloc_init(DRSProtoRequestDescription);
    v5 = [(DRSEnableDataGatheringQuery *)self teamID];
    [(DRSProtoRequestDescription *)v4 setTeamId:v5];

    v6 = [(DRSEnableDataGatheringQuery *)self issueCategory];
    [(DRSProtoRequestDescription *)v4 setIssueCategory:v6];

    v7 = [(DRSEnableDataGatheringQuery *)self contextDictionaryData];
    [(DRSProtoRequestDescription *)v4 setContextDictionaryData:v7];

    v8 = [(DRSEnableDataGatheringQuery *)self queryDate];
    [v8 timeIntervalSince1970];
    [(DRSProtoRequestDescription *)v4 setRequestTime:(unint64_t)v9];

    [(DRSProtoEnableDataGatheringRequest *)v3 setRequestDescription:v4];
    v10 = [(DRSEnableDataGatheringQuery *)self logType];
    [(DRSProtoEnableDataGatheringRequest *)v3 setLogType:v10];

    [(DRSProtoEnableDataGatheringRequest *)v3 setIsContinue:[(DRSEnableDataGatheringQuery *)self isContinue]];
  }
  else
  {
    v11 = DPLogHandle_CKInvernessError();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BadEnableDataGatheringQuery", "Tried to create a protobuf for a query that was not in RETRY state", v13, 2u);
    }

    v3 = 0;
  }

  return v3;
}

- (DRSDecisionServerBatchRequest)pbBatchInstance
{
  v2 = objc_alloc_init(DRSProtoEnableDataGatheringRequestBatch);

  return (DRSDecisionServerBatchRequest *)v2;
}

- (Class)pbBatchResponseClass
{
  return (Class)objc_opt_class();
}

- (NSString)functionName
{
  return (NSString *)@"shouldEnableDataGatheringBatch";
}

- (NSString)debugDescription
{
  id v20 = [NSString alloc];
  v19 = [(DRSEnableDataGatheringQuery *)self build];
  v21 = [(DRSEnableDataGatheringQuery *)self queryID];
  v18 = [v21 UUIDString];
  v3 = [(DRSEnableDataGatheringQuery *)self responseString];
  uint64_t v4 = [(DRSEnableDataGatheringQuery *)self rejectionReason];
  v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"-";
  }
  unsigned int v7 = [(DRSEnableDataGatheringQuery *)self attemptCount];
  v8 = [(DRSEnableDataGatheringQuery *)self teamID];
  double v9 = [(DRSEnableDataGatheringQuery *)self issueCategory];
  v10 = [(DRSEnableDataGatheringQuery *)self logType];
  if ([(DRSEnableDataGatheringQuery *)self isContinue]) {
    v11 = @"Continue";
  }
  else {
    v11 = @"Initial";
  }
  v12 = [(DRSEnableDataGatheringQuery *)self contextDictionary];
  uint64_t v13 = [v12 debugDescription];
  v14 = (void *)v13;
  v15 = @"-";
  if (v13) {
    v15 = (__CFString *)v13;
  }
  v16 = (void *)[v20 initWithFormat:@"%@ %@ %@ %@ %u %@/%@ %@ %@ %@", v19, v18, v3, v6, v7, v8, v9, v10, v11, v15];

  return (NSString *)v16;
}

- (NSString)responseString
{
  unsigned int v2 = [(DRSEnableDataGatheringQuery *)self response];
  if (v2 > 3) {
    return (NSString *)@"UNKNOWN";
  }
  else {
    return &off_263FCA338[(char)v2]->isa;
  }
}

+ (id)entityName
{
  return @"DRSEnableDataGatheringQueryMO";
}

- (id)_initWithMO_ON_MOC_QUEUE:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)DRSEnableDataGatheringQuery;
  v5 = [(DRSEnableDataGatheringQuery *)&v30 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 contextDictionaryData];
  contextDictionaryData = v5->_contextDictionaryData;
  v5->_contextDictionaryData = (NSData *)v6;

  if (!v5->_contextDictionaryData) {
    goto LABEL_4;
  }
  v8 = [(DRSEnableDataGatheringQuery *)v5 contextDictionaryData];
  uint64_t v9 = DRSDictionaryForData((uint64_t)v8);
  contextDictionary = v5->_contextDictionary;
  v5->_contextDictionary = (NSDictionary *)v9;

  v11 = [(DRSEnableDataGatheringQuery *)v5 contextDictionary];

  if (v11)
  {
LABEL_4:
    uint64_t v12 = [v4 teamID];
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v12;

    uint64_t v14 = [v4 issueCategory];
    issueCategory = v5->_issueCategory;
    v5->_issueCategory = (NSString *)v14;

    uint64_t v16 = [v4 build];
    build = v5->_build;
    v5->_build = (NSString *)v16;

    uint64_t v18 = [v4 queryDate];
    queryDate = v5->_queryDate;
    v5->_queryDate = (NSDate *)v18;

    uint64_t v20 = [v4 logType];
    logType = v5->_logType;
    v5->_logType = (NSString *)v20;

    v5->_response = [v4 response];
    uint64_t v22 = [v4 queryID];
    queryID = v5->_queryID;
    v5->_queryID = (NSUUID *)v22;

    v5->_attemptCount = [v4 attemptCount];
    uint64_t v24 = [v4 rejectionReason];
    rejectionReason = v5->_rejectionReason;
    v5->_rejectionReason = (NSString *)v24;

    v5->_isContinue = [v4 isContinue];
LABEL_5:
    v26 = v5;
    goto LABEL_6;
  }
  v28 = DPLogHandle_CoreDataError();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MalformedEnableDataGatheringQueryMO", "Could not convert context dict data into dict", v29, 2u);
  }

  v26 = 0;
LABEL_6:

  return v26;
}

- (DRSEnableDataGatheringQuery)initWithXPCDict:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "TeamID");
  uint64_t v6 = xpc_dictionary_get_string(v4, "Category");
  unsigned int v7 = (char *)xpc_dictionary_get_string(v4, "LogType");
  size_t length = 0;
  data = xpc_dictionary_get_data(v4, "ContextDict", &length);

  if (data) {
    BOOL v9 = length == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    uint64_t v12 = 0;
    v10 = 0;
    BOOL v13 = 0;
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", data);
    v11 = DRSDictionaryForData((uint64_t)v10);
    uint64_t v12 = v11;
    BOOL v13 = v11 == 0;
    if (v11) {
      id v14 = v11;
    }
  }
  if (string) {
    BOOL v15 = v6 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  BOOL v16 = v15 || v7 == 0;
  if (v16 || !v12 && length)
  {
    v17 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v17))
    {
      if (string) {
        uint64_t v18 = string;
      }
      else {
        uint64_t v18 = "MISSING";
      }
      if (!v6) {
        uint64_t v6 = "MISSING";
      }
      if (v7) {
        v19 = v7;
      }
      else {
        v19 = "MISSING";
      }
      if (v13)
      {
        uint64_t v20 = @"MALFORMED";
      }
      else
      {
        uint64_t v38 = [v12 debugDescription];
        unsigned int v7 = (char *)v38;
        uint64_t v20 = @"-";
        if (v38) {
          uint64_t v20 = (__CFString *)v38;
        }
      }
      *(_DWORD *)buf = 136446978;
      v43 = v18;
      __int16 v44 = 2082;
      v45 = v6;
      __int16 v46 = 2082;
      v47 = v19;
      __int16 v48 = 2114;
      v49 = v20;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MalformedEnableDataGatheringRequest", "Received invalid log gathering query from %{public, name=teamID}s/%{public, name=issueCategory}s/%{public, name=logType}s %{public, name=contextDictionaryDescription}@", buf, 0x2Au);
      if (!v13) {
    }
      }
    v37 = 0;
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)DRSEnableDataGatheringQuery;
    v21 = [(DRSEnableDataGatheringQuery *)&v40 init];
    uint64_t v22 = v21;
    if (v21)
    {
      objc_storeStrong((id *)&v21->_contextDictionary, v12);
      objc_storeStrong((id *)&v22->_contextDictionaryData, v10);
      uint64_t v23 = [NSString stringWithUTF8String:string];
      teamID = v22->_teamID;
      v22->_teamID = (NSString *)v23;

      uint64_t v25 = [NSString stringWithUTF8String:v6];
      issueCategory = v22->_issueCategory;
      v22->_issueCategory = (NSString *)v25;

      uint64_t v27 = [NSString stringWithUTF8String:v7];
      logType = v22->_logType;
      v22->_logType = (NSString *)v27;

      uint64_t v29 = [MEMORY[0x263EFF910] date];
      queryDate = v22->_queryDate;
      v22->_queryDate = (NSDate *)v29;

      uint64_t v31 = [MEMORY[0x263F08C38] UUID];
      queryID = v22->_queryID;
      v22->_queryID = (NSUUID *)v31;

      v22->_response = 2;
      v22->_attemptCount = 0;
      v33 = +[DRSSystemProfile sharedInstance];
      uint64_t v34 = [v33 build];
      build = v22->_build;
      v22->_build = (NSString *)v34;

      rejectionReason = v22->_rejectionReason;
      v22->_rejectionReason = 0;

      v22->_isContinue = 0;
    }
    self = v22;
    v37 = self;
  }

  return v37;
}

+ (id)_ON_MOC_QUEUE_enableDataGatheringQueryForID:(id)a3 context:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unsigned int v7 = (void *)MEMORY[0x263F08A98];
  id v8 = a4;
  BOOL v9 = [v7 predicateWithFormat:@"queryID == %@", v6];
  id v16 = 0;
  v10 = objc_msgSend(a1, "_ON_MOC_QUEUE_enableDataGatheringQueriesForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", v9, v8, 0, 0, &v16);

  id v11 = v16;
  if (v10 && [v10 count])
  {
    if ([v10 count] == 1)
    {
      uint64_t v12 = [v10 firstObject];
      goto LABEL_9;
    }
    BOOL v13 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v13))
    {
      uint64_t v14 = [v10 count];
      *(_DWORD *)buf = 138543618;
      id v18 = v6;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "QueryMangedObjectFetchUnexpectedMatches", "Query for UUID %{public}@ found %lu objects", buf, 0x16u);
    }
  }
  uint64_t v12 = 0;
LABEL_9:

  return v12;
}

+ (id)_ON_MOC_QUEUE_enableDataGatheringQueriesForFilterPredicate:(id)a3 context:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 errorOut:(id *)a7
{
  id v12 = a4;
  BOOL v13 = (void *)MEMORY[0x263EFF260];
  id v14 = a5;
  id v15 = a3;
  id v16 = [a1 entityName];
  v17 = [v13 fetchRequestWithEntityName:v16];

  [v17 setPredicate:v15];
  [v17 setSortDescriptors:v14];

  if (a6) {
    [v17 setFetchLimit:a6];
  }
  id v23 = 0;
  id v18 = [v12 executeFetchRequest:v17 error:&v23];
  id v19 = v23;
  uint64_t v20 = v19;
  if (v19)
  {
    id v21 = 0;
    *a7 = v19;
  }
  else
  {
    id v21 = v18;
  }

  return v21;
}

+ (id)mostRecentDateFirstSortDescriptor
{
  if (mostRecentDateFirstSortDescriptor_onceToken_0 != -1) {
    dispatch_once(&mostRecentDateFirstSortDescriptor_onceToken_0, &__block_literal_global_9);
  }
  unsigned int v2 = (void *)mostRecentDateFirstSortDescriptor_mostRecentDateSortDescriptor_0;

  return v2;
}

void __64__DRSEnableDataGatheringQuery_mostRecentDateFirstSortDescriptor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"queryDate" ascending:0];
  v1 = (void *)mostRecentDateFirstSortDescriptor_mostRecentDateSortDescriptor_0;
  mostRecentDateFirstSortDescriptor_mostRecentDateSortDescriptor_0 = v0;
}

+ (id)leastRecentDateFirstSortDescriptor
{
  if (leastRecentDateFirstSortDescriptor_onceToken_0 != -1) {
    dispatch_once(&leastRecentDateFirstSortDescriptor_onceToken_0, &__block_literal_global_47_0);
  }
  unsigned int v2 = (void *)leastRecentDateFirstSortDescriptor_leastRecentDateSortDescriptor_0;

  return v2;
}

void __65__DRSEnableDataGatheringQuery_leastRecentDateFirstSortDescriptor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"queryDate" ascending:1];
  v1 = (void *)leastRecentDateFirstSortDescriptor_leastRecentDateSortDescriptor_0;
  leastRecentDateFirstSortDescriptor_leastRecentDateSortDescriptor_0 = v0;
}

+ (id)enableDataGatheringQueriesForFilterPredicate:(id)a3 context:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 errorOut:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__5;
  uint64_t v38 = __Block_byref_object_dispose__5;
  id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  id v33 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __120__DRSEnableDataGatheringQuery_enableDataGatheringQueriesForFilterPredicate_context_sortDescriptors_fetchLimit_errorOut___block_invoke;
  v20[3] = &unk_263FCA318;
  id v26 = a1;
  id v15 = v12;
  id v21 = v15;
  id v16 = v13;
  id v22 = v16;
  id v17 = v14;
  id v23 = v17;
  uint64_t v24 = &v28;
  unint64_t v27 = a6;
  uint64_t v25 = &v34;
  [v16 performBlockAndWait:v20];
  if (a7) {
    *a7 = (id) v29[5];
  }
  id v18 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

void __120__DRSEnableDataGatheringQuery_enableDataGatheringQueriesForFilterPredicate_context_sortDescriptors_fetchLimit_errorOut___block_invoke(void *a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  v5 = (void *)a1[9];
  uint64_t v6 = a1[10];
  id v31 = 0;
  unsigned int v7 = objc_msgSend(v5, "_ON_MOC_QUEUE_enableDataGatheringQueriesForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", v2, v3, v4, v6, &v31);
  id v8 = v31;
  id v9 = v31;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v8);
  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v16 = [DRSEnableDataGatheringQuery alloc];
          uint64_t v17 = -[DRSEnableDataGatheringQuery _initWithMO_ON_MOC_QUEUE:](v16, "_initWithMO_ON_MOC_QUEUE:", v15, (void)v27);
          if (!v17)
          {
            id v19 = (void *)MEMORY[0x263F087E8];
            uint64_t v32 = *MEMORY[0x263F08320];
            id v33 = @"Failed to create query for queryMO";
            uint64_t v20 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
            id v21 = [v19 errorWithDomain:@"DiagnosticPipelinePersistenceError" code:0 userInfo:v20];

            uint64_t v22 = *(void *)(a1[7] + 8);
            id v23 = *(void **)(v22 + 40);
            *(void *)(v22 + 40) = v21;
            id v24 = v21;

            uint64_t v25 = *(void *)(a1[8] + 8);
            id v26 = *(void **)(v25 + 40);
            *(void *)(v25 + 40) = 0;

            goto LABEL_12;
          }
          id v18 = (void *)v17;
          [*(id *)(*(void *)(a1[8] + 8) + 40) addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v34 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

+ (id)cachedQueryResponseForQuery:(id)a3 inContext:(id)a4 errorOut:(id *)a5
{
  v32[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x263F08A98];
  id v10 = [v7 teamID];
  uint64_t v11 = [v7 issueCategory];
  uint64_t v12 = [v7 logType];
  uint64_t v13 = [v7 build];
  id v14 = [v9 predicateWithFormat:@"teamID == %@ AND issueCategory == %@ AND logType == %@ AND build == %@", v10, v11, v12, v13];

  uint64_t v15 = +[DRSEnableDataGatheringQuery mostRecentDateFirstSortDescriptor];
  v32[0] = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];

  id v30 = 0;
  uint64_t v17 = [a1 enableDataGatheringQueriesForFilterPredicate:v14 context:v8 sortDescriptors:v16 fetchLimit:1 errorOut:&v30];
  id v18 = v30;
  if (v17 && [v17 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v19 = v17;
    id v20 = (id)[v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v20)
    {
      id v25 = v8;
      uint64_t v21 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v20; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v19);
          }
          id v23 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v7 doesMatchCachedQuery:v23])
          {
            id v20 = v23;
            goto LABEL_14;
          }
        }
        id v20 = (id)[v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v20) {
          continue;
        }
        break;
      }
LABEL_14:
      id v8 = v25;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

+ (id)enableDataGatheringQueryForID:(id)a3 context:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v6 = (__CFString *)a3;
  id v7 = (void *)MEMORY[0x263F08A98];
  id v8 = a4;
  id v9 = [v7 predicateWithFormat:@"queryID == %@", v6];
  id v23 = 0;
  id v10 = [a1 enableDataGatheringQueriesForFilterPredicate:v9 context:v8 sortDescriptors:0 fetchLimit:1 errorOut:&v23];

  id v11 = v23;
  if (v10 && [v10 count])
  {
    if ([v10 count] == 1)
    {
      uint64_t v12 = [v10 firstObject];
      goto LABEL_16;
    }
    uint64_t v13 = DPLogHandle_EnableDataGatheringQueryError();
    if (os_signpost_enabled(v13))
    {
      uint64_t v21 = [v10 count];
      *(_DWORD *)buf = 138543618;
      id v25 = v6;
      __int16 v26 = 2048;
      uint64_t v27 = v21;
      uint64_t v17 = "QueryMangedObjectFetchUnexpectedMatches";
      id v18 = "Query for UUID %{public}@ found %lu objects";
      id v19 = v13;
      uint32_t v20 = 22;
      goto LABEL_14;
    }
  }
  else
  {
    if (v11)
    {
      uint64_t v13 = DPLogHandle_CoreDataError();
      if (os_signpost_enabled(v13))
      {
        uint64_t v14 = [v11 localizedDescription];
        uint64_t v15 = (void *)v14;
        id v16 = @"Unknown";
        if (v14) {
          id v16 = (__CFString *)v14;
        }
        *(_DWORD *)buf = 138543362;
        id v25 = v16;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "QueryMangedObjectFetchFailure", "Failed to fetch a query object based on MO ID: %{public}@", buf, 0xCu);
      }
      goto LABEL_15;
    }
    uint64_t v13 = DPLogHandle_EnableDataGatheringQuery();
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v6;
      uint64_t v17 = "QueryMangedObjectFetchMiss";
      id v18 = "No cached query with MO ID %{public}@";
      id v19 = v13;
      uint32_t v20 = 12;
LABEL_14:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v17, v18, buf, v20);
    }
  }
LABEL_15:

  uint64_t v12 = 0;
LABEL_16:

  return v12;
}

- (void)updateContextWithDataGatheringQuery_ON_MOC_QUEUE:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(DRSEnableDataGatheringQuery *)self queryID];
  objc_msgSend(v5, "_ON_MOC_QUEUE_enableDataGatheringQueryForID:context:", v6, v4);
  id v7 = (DRSEnableDataGatheringQueryMO *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    id v8 = DPLogHandle_EnableDataGatheringQuery();
    if (os_signpost_enabled(v8))
    {
      id v9 = [(DRSEnableDataGatheringQuery *)self queryID];
      int v18 = 138543362;
      id v19 = v9;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "QueryMangedObjectFetchMiss", "No cached query with MO ID %{public}@", (uint8_t *)&v18, 0xCu);
    }
    id v7 = [[DRSEnableDataGatheringQueryMO alloc] initWithContext:v4];
    id v10 = [(DRSEnableDataGatheringQuery *)self teamID];
    [(DRSEnableDataGatheringQueryMO *)v7 setTeamID:v10];

    id v11 = [(DRSEnableDataGatheringQuery *)self issueCategory];
    [(DRSEnableDataGatheringQueryMO *)v7 setIssueCategory:v11];

    uint64_t v12 = [(DRSEnableDataGatheringQuery *)self logType];
    [(DRSEnableDataGatheringQueryMO *)v7 setLogType:v12];

    uint64_t v13 = [(DRSEnableDataGatheringQuery *)self contextDictionaryData];
    [(DRSEnableDataGatheringQueryMO *)v7 setContextDictionaryData:v13];

    uint64_t v14 = [(DRSEnableDataGatheringQuery *)self build];
    [(DRSEnableDataGatheringQueryMO *)v7 setBuild:v14];

    uint64_t v15 = [(DRSEnableDataGatheringQuery *)self queryDate];
    [(DRSEnableDataGatheringQueryMO *)v7 setQueryDate:v15];

    id v16 = [(DRSEnableDataGatheringQuery *)self queryID];
    [(DRSEnableDataGatheringQueryMO *)v7 setQueryID:v16];
  }
  [(DRSEnableDataGatheringQueryMO *)v7 setResponse:[(DRSEnableDataGatheringQuery *)self response]];
  [(DRSEnableDataGatheringQueryMO *)v7 setAttemptCount:(__int16)[(DRSEnableDataGatheringQuery *)self attemptCount]];
  uint64_t v17 = [(DRSEnableDataGatheringQuery *)self rejectionReason];
  [(DRSEnableDataGatheringQueryMO *)v7 setRejectionReason:v17];

  [(DRSEnableDataGatheringQueryMO *)v7 setIsContinue:[(DRSEnableDataGatheringQuery *)self isContinue]];
}

- (BOOL)isEqualToDataGatheringQuery:(id)a3
{
  id v4 = a3;
  v5 = [(DRSEnableDataGatheringQuery *)self teamID];
  uint64_t v6 = [v4 teamID];
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_19;
  }
  id v8 = [(DRSEnableDataGatheringQuery *)self issueCategory];
  id v9 = [v4 issueCategory];
  int v10 = [v8 isEqualToString:v9];

  if (!v10) {
    goto LABEL_19;
  }
  id v11 = [(DRSEnableDataGatheringQuery *)self logType];
  uint64_t v12 = [v4 logType];
  int v13 = [v11 isEqualToString:v12];

  if (!v13) {
    goto LABEL_19;
  }
  uint64_t v14 = [(DRSEnableDataGatheringQuery *)self build];
  uint64_t v15 = [v4 build];
  int v16 = [v14 isEqualToString:v15];

  if (!v16) {
    goto LABEL_19;
  }
  uint64_t v17 = [(DRSEnableDataGatheringQuery *)self queryDate];
  int v18 = [v4 queryDate];
  int v19 = [v17 isEqualToDate:v18];

  if (!v19) {
    goto LABEL_19;
  }
  uint64_t v20 = [(DRSEnableDataGatheringQuery *)self queryID];
  uint64_t v21 = [v4 queryID];
  int v22 = [v20 isEqual:v21];

  if (!v22) {
    goto LABEL_19;
  }
  uint64_t v23 = [(DRSEnableDataGatheringQuery *)self contextDictionary];
  if (v23
    && (id v24 = (void *)v23,
        [v4 contextDictionary],
        id v25 = objc_claimAutoreleasedReturnValue(),
        v25,
        v24,
        v25))
  {
    __int16 v26 = [(DRSEnableDataGatheringQuery *)self contextDictionary];
    uint64_t v27 = [v4 contextDictionary];
    char v28 = [v26 isEqualToDictionary:v27];

    if ((v28 & 1) == 0) {
      goto LABEL_19;
    }
  }
  else
  {
    long long v29 = [(DRSEnableDataGatheringQuery *)self contextDictionary];
    if (v29) {
      goto LABEL_18;
    }
    id v30 = [v4 contextDictionary];

    if (v30) {
      goto LABEL_19;
    }
  }
  uint64_t v31 = [(DRSEnableDataGatheringQuery *)self rejectionReason];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    id v33 = [v4 rejectionReason];

    if (v33)
    {
      uint64_t v34 = [(DRSEnableDataGatheringQuery *)self rejectionReason];
      uint64_t v35 = [v4 rejectionReason];
      char v36 = [v34 isEqualToString:v35];

      if ((v36 & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_22;
    }
  }
  long long v29 = [(DRSEnableDataGatheringQuery *)self rejectionReason];
  if (v29)
  {
LABEL_18:

    goto LABEL_19;
  }
  id v39 = [v4 rejectionReason];

  if (v39) {
    goto LABEL_19;
  }
LABEL_22:
  int v40 = [(DRSEnableDataGatheringQuery *)self attemptCount];
  if (v40 == [v4 attemptCount])
  {
    int v41 = [(DRSEnableDataGatheringQuery *)self isContinue];
    if (v41 == [v4 isContinue])
    {
      int v42 = [(DRSEnableDataGatheringQuery *)self response];
      BOOL v37 = v42 == [v4 response];
      goto LABEL_20;
    }
  }
LABEL_19:
  BOOL v37 = 0;
LABEL_20:

  return v37;
}

- (BOOL)doesMatchCachedQuery:(id)a3
{
  id v4 = a3;
  v5 = [(DRSEnableDataGatheringQuery *)self teamID];
  uint64_t v6 = [v4 teamID];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(DRSEnableDataGatheringQuery *)self issueCategory];
    id v9 = [v4 issueCategory];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      id v11 = [(DRSEnableDataGatheringQuery *)self logType];
      uint64_t v12 = [v4 logType];
      int v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        uint64_t v14 = [(DRSEnableDataGatheringQuery *)self build];
        uint64_t v15 = [v4 build];
        int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          uint64_t v17 = [(DRSEnableDataGatheringQuery *)self contextDictionary];
          if (v17
            && (int v18 = (void *)v17,
                [v4 contextDictionary],
                int v19 = objc_claimAutoreleasedReturnValue(),
                v19,
                v18,
                v19))
          {
            uint64_t v20 = [(DRSEnableDataGatheringQuery *)self contextDictionary];
            uint64_t v21 = [v4 contextDictionary];
            char v22 = [v20 isEqualToDictionary:v21];

            if (v22) {
              goto LABEL_14;
            }
          }
          else
          {
            uint64_t v23 = [(DRSEnableDataGatheringQuery *)self contextDictionary];
            if (v23)
            {
            }
            else
            {
              id v24 = [v4 contextDictionary];

              if (!v24)
              {
LABEL_14:
                BOOL v25 = 1;
                goto LABEL_13;
              }
            }
          }
        }
      }
    }
  }
  BOOL v25 = 0;
LABEL_13:

  return v25;
}

- (BOOL)submitQuery
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  ++self->_attemptCount;
  id v4 = DPLogHandle_CKInverness();
  v5 = [(DRSEnableDataGatheringQuery *)self queryID];
  os_signpost_id_t v6 = [v5 hash];

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = [(DRSEnableDataGatheringQuery *)self queryID];
    id v8 = [(DRSEnableDataGatheringQuery *)self teamID];
    id v9 = [(DRSEnableDataGatheringQuery *)self issueCategory];
    int v10 = [(DRSEnableDataGatheringQuery *)self logType];
    id v11 = [(DRSEnableDataGatheringQuery *)self contextDictionary];
    if (v11)
    {
      uint64_t v2 = [(DRSEnableDataGatheringQuery *)self contextDictionary];
      uint64_t v12 = [v2 debugDescription];
    }
    else
    {
      uint64_t v12 = @"-";
    }
    int v19 = 138544386;
    uint64_t v20 = v7;
    __int16 v21 = 2114;
    char v22 = v8;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    __int16 v26 = v10;
    __int16 v27 = 2114;
    char v28 = v12;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EnableDataGatheringQuery", "Began request to decision server to enable data gathering for query ID %{public}@, %{public, name=teamID}@/%{public, name=issueCategory}@/%{public, name=logType}@ %{public, name=contextDictionary}@", (uint8_t *)&v19, 0x34u);
    if (v11)
    {
    }
  }

  int v13 = [(DRSEnableDataGatheringQuery *)self response];
  if (v13 != 2)
  {
    uint64_t v14 = DPLogHandle_CKInverness();
    uint64_t v15 = [(DRSEnableDataGatheringQuery *)self queryID];
    os_signpost_id_t v16 = [v15 hash];

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      uint64_t v17 = [(DRSEnableDataGatheringQuery *)self responseString];
      int v19 = 138543362;
      uint64_t v20 = v17;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_INTERVAL_END, v16, "EnableDataGatheringQuery", "FAILED: Query in unexpected state: %{public}@", (uint8_t *)&v19, 0xCu);
    }
  }
  return v13 == 2;
}

- (void)queryFinishedWithDecision:(id)a3 error:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unsigned int v8 = [(DRSEnableDataGatheringQuery *)self attemptCount];
    id v9 = DPLogHandle_CKInverness();
    int v10 = [(DRSEnableDataGatheringQuery *)self queryID];
    os_signpost_id_t v11 = [v10 hash];

    unint64_t v12 = v11 - 1;
    if (v8 < 3)
    {
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        uint64_t v25 = [v7 localizedDescription];
        __int16 v26 = (void *)v25;
        __int16 v27 = @"Unknown";
        if (v25) {
          __int16 v27 = (__CFString *)v25;
        }
        int v28 = 138543362;
        uint64_t v29 = v27;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_INTERVAL_END, v11, "EnableDataGatheringQuery", "Attempt failed due to error: %{public}@", (uint8_t *)&v28, 0xCu);
      }
    }
    else
    {
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        uint64_t v13 = [v7 localizedDescription];
        uint64_t v14 = (void *)v13;
        uint64_t v15 = @"Unknown";
        if (v13) {
          uint64_t v15 = (__CFString *)v13;
        }
        int v28 = 138543362;
        uint64_t v29 = v15;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_INTERVAL_END, v11, "EnableDataGatheringQuery", "Query invalidated due to attempt count. Last error:%{public}@", (uint8_t *)&v28, 0xCu);
      }
      self->_response = 3;
      uint64_t v16 = [v7 localizedDescription];
      id v9 = v16;
      if (v16) {
        uint64_t v17 = (__CFString *)v16;
      }
      else {
        uint64_t v17 = @"Unknown";
      }
      objc_storeStrong((id *)&self->_rejectionReason, v17);
    }
  }
  else
  {
    self->_response = [v6 requestAccepted];
    rejectionReason = self->_rejectionReason;
    self->_rejectionReason = 0;

    id v9 = DPLogHandle_CKInverness();
    int v19 = [(DRSEnableDataGatheringQuery *)self queryID];
    os_signpost_id_t v20 = [v19 hash];

    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      __int16 v21 = [(DRSEnableDataGatheringQuery *)self responseString];
      uint64_t v22 = [(DRSEnableDataGatheringQuery *)self rejectionReason];
      __int16 v23 = (void *)v22;
      id v24 = @"-";
      if (v22) {
        id v24 = (__CFString *)v22;
      }
      int v28 = 138543618;
      uint64_t v29 = v21;
      __int16 v30 = 2114;
      uint64_t v31 = v24;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_INTERVAL_END, v20, "EnableDataGatheringQuery", "Query successful with response: %{public}@, rejection reason: %{public}@", (uint8_t *)&v28, 0x16u);
    }
  }
}

- (id)jsonCompatibleDictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x21050DCE0](self, a2);
  id v4 = objc_alloc_init(MEMORY[0x263F088C0]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = [(DRSEnableDataGatheringQuery *)self build];
  [v5 setObject:v6 forKeyedSubscript:@"build"];

  id v7 = [(DRSEnableDataGatheringQuery *)self queryDate];
  unsigned int v8 = [v4 stringFromDate:v7];
  [v5 setObject:v8 forKeyedSubscript:@"date"];

  id v9 = [(DRSEnableDataGatheringQuery *)self teamID];
  [v5 setObject:v9 forKeyedSubscript:@"teamID"];

  int v10 = [(DRSEnableDataGatheringQuery *)self issueCategory];
  [v5 setObject:v10 forKeyedSubscript:@"issueCategory"];

  os_signpost_id_t v11 = [(DRSEnableDataGatheringQuery *)self responseString];
  [v5 setObject:v11 forKeyedSubscript:@"response"];

  unint64_t v12 = [(DRSEnableDataGatheringQuery *)self logType];
  [v5 setObject:v12 forKeyedSubscript:@"logType"];

  uint64_t v13 = [(DRSEnableDataGatheringQuery *)self queryID];
  uint64_t v14 = [v13 UUIDString];
  [v5 setObject:v14 forKeyedSubscript:@"queryID"];

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[DRSEnableDataGatheringQuery attemptCount](self, "attemptCount"));
  [v5 setObject:v15 forKeyedSubscript:@"uploadAttemptCount"];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[DRSEnableDataGatheringQuery isContinue](self, "isContinue"));
  [v5 setObject:v16 forKeyedSubscript:@"isContinue"];

  uint64_t v17 = [(DRSEnableDataGatheringQuery *)self rejectionReason];

  if (v17)
  {
    int v18 = [(DRSEnableDataGatheringQuery *)self rejectionReason];
    [v5 setObject:v18 forKeyedSubscript:@"rejectionReason"];
  }
  int v19 = [(DRSEnableDataGatheringQuery *)self contextDictionary];

  if (v19)
  {
    os_signpost_id_t v20 = (void *)MEMORY[0x263F08900];
    __int16 v21 = [(DRSEnableDataGatheringQuery *)self contextDictionary];
    LODWORD(v20) = [v20 isValidJSONObject:v21];

    if (v20)
    {
      uint64_t v22 = [(DRSEnableDataGatheringQuery *)self contextDictionary];
      [v5 setObject:v22 forKeyedSubscript:@"contextDictionary"];
    }
    else
    {
      __int16 v23 = DPLogHandle_Request();
      if (os_signpost_enabled(v23))
      {
        id v24 = [(DRSEnableDataGatheringQuery *)self debugDescription];
        int v26 = 138543362;
        __int16 v27 = v24;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SkippedContextDictionaryJSONSerialization", "Context dictionary for %{public}@ cannot be serialized in JSON", (uint8_t *)&v26, 0xCu);
      }
      [v5 setObject:@"<Could not serialize>" forKeyedSubscript:@"contextDictionary"];
    }
  }

  return v5;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSString)issueCategory
{
  return self->_issueCategory;
}

- (NSString)logType
{
  return self->_logType;
}

- (NSString)build
{
  return self->_build;
}

- (NSDate)queryDate
{
  return self->_queryDate;
}

- (NSUUID)queryID
{
  return self->_queryID;
}

- (unsigned)response
{
  return self->_response;
}

- (void)setResponse:(unsigned __int8)a3
{
  self->_response = a3;
}

- (NSData)contextDictionaryData
{
  return self->_contextDictionaryData;
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (unsigned)attemptCount
{
  return self->_attemptCount;
}

- (NSString)rejectionReason
{
  return self->_rejectionReason;
}

- (void)setRejectionReason:(id)a3
{
}

- (BOOL)isContinue
{
  return self->_isContinue;
}

- (void)setIsContinue:(BOOL)a3
{
  self->_isContinue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectionReason, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
  objc_storeStrong((id *)&self->_contextDictionaryData, 0);
  objc_storeStrong((id *)&self->_queryID, 0);
  objc_storeStrong((id *)&self->_queryDate, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_logType, 0);
  objc_storeStrong((id *)&self->_issueCategory, 0);

  objc_storeStrong((id *)&self->_teamID, 0);
}

@end