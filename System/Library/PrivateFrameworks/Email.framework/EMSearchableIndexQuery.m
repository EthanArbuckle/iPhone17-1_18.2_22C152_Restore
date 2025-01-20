@interface EMSearchableIndexQuery
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
+ (double)intervalForSpotlightFailureSimulation;
+ (id)_modifierStringFromModifiers:(unint64_t)a3;
+ (id)_operandStringForOperand:(int64_t)a3;
+ (id)_queryStringForPhrase:(id)a3 attributes:(id)a4 modifiers:(unint64_t)a5 phraseMatchFormatString:(id)a6;
+ (id)_queryStringForPhrase:(id)a3 attributes:(id)a4 modifiers:(unint64_t)a5 phraseMatchFormatString:(id)a6 comparisonOperator:(int64_t)a7;
+ (id)queryStringByJoiningQueries:(id)a3 withOperand:(int64_t)a4;
+ (id)queryStringForPhrase:(id)a3 attributes:(id)a4 modifiers:(unint64_t)a5 languages:(id)a6;
+ (id)queryStringForPhrase:(id)a3 attributes:(id)a4 modifiers:(unint64_t)a5 languages:(id)a6 phraseMatchFormatString:(id)a7 comparisonOperator:(int64_t)a8;
+ (id)queryWithExpression:(id)a3 builder:(id)a4;
+ (id)searchWordsForPhrase:(id)a3 languages:(id)a4;
- (BOOL)_isCancellationError:(id)a3;
- (BOOL)_isFinishedQueryStatus:(id)a3;
- (BOOL)attribute;
- (BOOL)counting;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)live;
- (BOOL)liveQueryDidGather;
- (BOOL)queryDidMoveToFinishedState;
- (CSSearchQuery)query;
- (EFPromise)resultsPromise;
- (EMSearchableIndexQuery)init;
- (EMSearchableIndexQuery)initWithExpression:(id)a3 builder:(id)a4;
- (EMSearchableIndexQuery)initWithExpression:(id)a3 builder:(id)a4 queryContext:(id)a5 querySetup:(id)a6;
- (EMSearchableIndexQueryExpression)expression;
- (NSArray)fetchAttributes;
- (NSArray)protectionClasses;
- (NSArray)rankingQueries;
- (NSError)simulatedFailedQueryError;
- (NSLock)lock;
- (NSProgress)internalProgress;
- (NSProgress)progress;
- (NSString)bundleID;
- (NSString)ef_publicDescription;
- (NSString)logIdentifier;
- (NSString)logPrefixString;
- (NSString)queryStatus;
- (id)changedAttributeResultsBlock;
- (id)changedItemsBlock;
- (id)completionBlock;
- (id)countChangedBlock;
- (id)failureBlock;
- (id)foundAttributeResultsBlock;
- (id)gatheredBlock;
- (id)removedItemsBlock;
- (id)resultsBlock;
- (int64_t)count;
- (int64_t)maxCount;
- (unint64_t)signpostID;
- (void)_cancel;
- (void)_cancelQuery;
- (void)_changeCount:(int64_t)a3;
- (void)_changedAttribute:(id)a3 values:(id)a4;
- (void)_changedItems:(id)a3;
- (void)_completed;
- (void)_failedWithError:(id)a3;
- (void)_foundAttribute:(id)a3 values:(id)a4;
- (void)_foundItems:(id)a3;
- (void)_gathered;
- (void)_logSignpostForSearchQueryDidFinishWithStatus:(id)a3;
- (void)_logSignpostForSearchQueryDidReceiveFirstResultsWithItemCount:(unint64_t)a3;
- (void)_logSignpostForSearchQueryStart;
- (void)_performClientWork:(id)a3;
- (void)_removeAllLiveUpdatesBlocks;
- (void)_removeResultsBlock;
- (void)_removedItems:(id)a3;
- (void)_searchQueryDidChangeAttribute:(id)a3 values:(id)a4;
- (void)_searchQueryDidChangeCount:(int64_t)a3;
- (void)_searchQueryDidChangeItems:(id)a3;
- (void)_searchQueryDidComplete;
- (void)_searchQueryDidFailWithError:(id)a3;
- (void)_searchQueryDidFindAttribute:(id)a3 values:(id)a4;
- (void)_searchQueryDidFindItems:(id)a3;
- (void)_searchQueryDidRemoveIdentifiers:(id)a3;
- (void)_searchQueryGatherDidEnd;
- (void)cancel;
- (void)dealloc;
- (void)setAttribute:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setChangedAttributeResultsBlock:(id)a3;
- (void)setChangedItemsBlock:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setCountChangedBlock:(id)a3;
- (void)setCounting:(BOOL)a3;
- (void)setExpression:(id)a3;
- (void)setFailureBlock:(id)a3;
- (void)setFetchAttributes:(id)a3;
- (void)setFoundAttributeResultsBlock:(id)a3;
- (void)setGatheredBlock:(id)a3;
- (void)setInternalProgress:(id)a3;
- (void)setLive:(BOOL)a3;
- (void)setLiveQueryDidGather:(BOOL)a3;
- (void)setLock:(id)a3;
- (void)setLogIdentifier:(id)a3;
- (void)setLogPrefixString:(id)a3;
- (void)setMaxCount:(int64_t)a3;
- (void)setProgress:(id)a3;
- (void)setProtectionClasses:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueryDidMoveToFinishedState:(BOOL)a3;
- (void)setQueryStatus:(id)a3;
- (void)setRankingQueries:(id)a3;
- (void)setRemovedItemsBlock:(id)a3;
- (void)setResultsBlock:(id)a3;
- (void)setResultsPromise:(id)a3;
- (void)setSimulatedFailedQueryError:(id)a3;
- (void)simulateFailedQueryWithError:(id)a3;
- (void)start;
@end

@implementation EMSearchableIndexQuery

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__EMSearchableIndexQuery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_37 != -1) {
    dispatch_once(&log_onceToken_37, block);
  }
  v2 = (void *)log_log_37;
  return (OS_os_log *)v2;
}

void __29__EMSearchableIndexQuery_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_37;
  log_log_37 = (uint64_t)v1;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EMSearchableIndexQuery_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_4 != -1) {
    dispatch_once(&signpostLog_onceToken_4, block);
  }
  v2 = (void *)signpostLog_log_4;
  return (OS_os_log *)v2;
}

void __37__EMSearchableIndexQuery_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_4;
  signpostLog_log_4 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (double)intervalForSpotlightFailureSimulation
{
  if (intervalForSpotlightFailureSimulation_onceToken != -1) {
    dispatch_once(&intervalForSpotlightFailureSimulation_onceToken, &__block_literal_global_47);
  }
  return *(double *)&intervalForSpotlightFailureSimulation_intervalForSpotlightFailureSimulation;
}

void __63__EMSearchableIndexQuery_intervalForSpotlightFailureSimulation__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v3 = [v0 objectForKey:@"kSearchableIndexQueryKeyIntervalForSpotlightFailureSimulation"];

  os_log_t v1 = v3;
  if (v3)
  {
    [v3 doubleValue];
    intervalForSpotlightFailureSimulation_intervalForSpotlightFailureSimulation = v2;
    os_log_t v1 = v3;
  }
}

+ (id)queryWithExpression:(id)a3 builder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initWithExpression:v6 builder:v7];

  return v8;
}

- (EMSearchableIndexQuery)init
{
}

- (NSString)logPrefixString
{
  logPrefixString = self->_logPrefixString;
  if (!logPrefixString)
  {
    id v4 = [NSString alloc];
    v5 = [(EMSearchableIndexQuery *)self logIdentifier];
    id v6 = (NSString *)[v4 initWithFormat:@"%@<%@: %p>", v5, objc_opt_class(), self];
    id v7 = self->_logPrefixString;
    self->_logPrefixString = v6;

    logPrefixString = self->_logPrefixString;
  }
  return logPrefixString;
}

- (EMSearchableIndexQuery)initWithExpression:(id)a3 builder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__EMSearchableIndexQuery_initWithExpression_builder___block_invoke;
  v13[3] = &unk_1E63E60E8;
  id v8 = v6;
  id v14 = v8;
  v9 = (void *)MEMORY[0x1C18A2160](v13);
  id v10 = objc_alloc_init(MEMORY[0x1E4F23830]);
  v11 = [(EMSearchableIndexQuery *)self initWithExpression:v8 builder:v7 queryContext:v10 querySetup:v9];

  return v11;
}

id __53__EMSearchableIndexQuery_initWithExpression_builder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F23828]);
  v5 = [*(id *)(a1 + 32) queryString];
  id v6 = (void *)[v4 initWithQueryString:v5 context:v3];

  return v6;
}

- (EMSearchableIndexQuery)initWithExpression:(id)a3 builder:(id)a4 queryContext:(id)a5 querySetup:(id)a6
{
  v108[1] = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  id v10 = (void (**)(id, EMSearchableIndexQuery *))a4;
  id v11 = a5;
  id v12 = a6;
  v72 = (void (**)(void, void))v12;
  if (v10)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    [v62 handleFailureInMethod:a2, self, @"EMSearchableIndexQuery.m", 120, @"Invalid parameter not satisfying: %@", @"builder" object file lineNumber description];

    if (v72) {
      goto LABEL_3;
    }
  }
  v63 = [MEMORY[0x1E4F28B00] currentHandler];
  [v63 handleFailureInMethod:a2, self, @"EMSearchableIndexQuery.m", 121, @"Invalid parameter not satisfying: %@", @"querySetup" object file lineNumber description];

LABEL_3:
  v103.receiver = self;
  v103.super_class = (Class)EMSearchableIndexQuery;
  v13 = [(EMSearchableIndexQuery *)&v103 init];
  id v14 = v13;
  if (!v13) {
    goto LABEL_41;
  }
  logIdentifier = v13->_logIdentifier;
  v13->_logIdentifier = (NSString *)&stru_1F1A3DFB0;

  v10[2](v10, v14);
  v16 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  lock = v14->_lock;
  v14->_lock = v16;

  v18 = (EFPromise *)objc_alloc_init(MEMORY[0x1E4F60E18]);
  resultsPromise = v14->_resultsPromise;
  v14->_resultsPromise = v18;

  queryStatus = v14->_queryStatus;
  v14->_queryStatus = (NSString *)@"not started";

  v14->_count = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v21 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  progress = v14->_progress;
  v14->_progress = (NSProgress *)v21;

  uint64_t v23 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
  internalProgress = v14->_internalProgress;
  v14->_internalProgress = (NSProgress *)v23;

  [(NSProgress *)v14->_progress addChild:v14->_internalProgress withPendingUnitCount:1];
  os_activity_t v25 = _os_activity_create(&dword_1BEFDB000, "Spotlight search query", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  activity = v14->activity;
  v14->activity = (OS_os_activity *)v25;

  [(id)objc_opt_class() intervalForSpotlightFailureSimulation];
  if (v27 > 0.0)
  {
    dispatch_time_t v28 = dispatch_time(0, (uint64_t)(v27 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke;
    block[3] = &unk_1E63E26B0;
    v102 = v14;
    dispatch_after(v28, MEMORY[0x1E4F14428], block);
  }
  v29 = [(EMSearchableIndexQuery *)v14 resultsBlock];
  v67 = v29;
  if (v29)
  {
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_2;
    v98[3] = &unk_1E63E6110;
    id v100 = v29;
    v30 = v14;
    v99 = v30;
    v31 = (void *)MEMORY[0x1C18A2160](v98);
    [(EMSearchableIndexQuery *)v30 setResultsBlock:v31];
  }
  v69 = [(EMSearchableIndexQuery *)v14 completionBlock];
  v32 = [(EFPromise *)v14->_resultsPromise future];
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_3;
  v95[3] = &unk_1E63E6138;
  v33 = v14;
  v96 = v33;
  id v66 = v69;
  id v97 = v66;
  [v32 addSuccessBlock:v95];

  [(EMSearchableIndexQuery *)v33 setCompletionBlock:0];
  v68 = [(EMSearchableIndexQuery *)v33 failureBlock];
  v34 = [(EFPromise *)v14->_resultsPromise future];
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_4;
  v92[3] = &unk_1E63E55F0;
  v35 = v33;
  v93 = v35;
  id v65 = v68;
  id v94 = v65;
  [v34 addFailureBlock:v92];

  [v35 setFailureBlock:0];
  [v35 setExpression:v71];
  v36 = [v35 fetchAttributes];
  [v11 setFetchAttributes:v36];

  [v35 setFetchAttributes:0];
  v37 = [v35 rankingQueries];
  [v11 setRankingQueries:v37];

  [v35 setRankingQueries:0];
  objc_msgSend(v11, "setLive:", objc_msgSend(v35, "live"));
  objc_msgSend(v11, "setCounting:", objc_msgSend(v35, "counting"));
  uint64_t v38 = [v35 bundleID];
  v39 = (void *)v38;
  if (v38)
  {
    v108[0] = v38;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:1];
  }
  else
  {
    v40 = 0;
  }
  [v11 setBundleIDs:v40];
  if (v39) {

  }
  objc_msgSend(v11, "setAttribute:", objc_msgSend(v35, "attribute"));
  objc_msgSend(v11, "setMaxCount:", objc_msgSend(v35, "maxCount"));
  v41 = [v35 protectionClasses];

  if (v41)
  {
    v42 = [v35 protectionClasses];
    [v11 setProtectionClasses:v42];

    [v35 setProtectionClasses:0];
  }
  else
  {
    v43 = [MEMORY[0x1E4F60D58] currentDevice];
    int v44 = [v43 isAppleSilicon];

    if (v44)
    {
      uint64_t v107 = *MEMORY[0x1E4F28358];
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
    }
    else
    {
      uint64_t v106 = *MEMORY[0x1E4F28340];
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
    v45 = };
    [v11 setProtectionClasses:v45];
  }
  v46 = ((void (**)(void, id))v72)[2](v72, v11);
  [v35 setQuery:v46];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v35);
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_5;
  v89[3] = &unk_1E63E2688;
  objc_copyWeak(&v90, &location);
  [(NSProgress *)v14->_internalProgress setCancellationHandler:v89];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_63;
  v87[3] = &unk_1E63E6160;
  objc_copyWeak(&v88, &location);
  [v35[22] setFoundItemsHandler:v87];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_2_64;
  v85[3] = &unk_1E63E6188;
  objc_copyWeak(&v86, &location);
  [v35[22] setCompletionHandler:v85];
  if ([v35 live])
  {
    id v47 = (id)[MEMORY[0x1E4F28F90] progressWithTotalUnitCount:-1 parent:v14->_progress pendingUnitCount:-1];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_3_65;
    v83[3] = &unk_1E63E2688;
    objc_copyWeak(&v84, &location);
    [v35[22] setGatherEndedHandler:v83];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_4_66;
    v81[3] = &unk_1E63E6160;
    objc_copyWeak(&v82, &location);
    [v35[22] setChangedItemsHandler:v81];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_5_67;
    v79[3] = &unk_1E63E61B0;
    objc_copyWeak(&v80, &location);
    [v35[22] setRemovedItemsHandler:v79];
    if ([v35 attribute])
    {
      v48 = +[EMSearchableIndexQuery log];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[EMSearchableIndexQuery initWithExpression:builder:queryContext:querySetup:](v48);
      }
    }
    objc_destroyWeak(&v80);
    objc_destroyWeak(&v82);
    objc_destroyWeak(&v84);
    goto LABEL_29;
  }
  v49 = [v35 gatheredBlock];
  if (v49 || ([v35 removedItemsBlock], (v49 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_28;
  }
  v50 = [v35 changedItemsBlock];
  BOOL v51 = v50 == 0;

  if (!v51)
  {
LABEL_28:
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2 object:v35 file:@"EMSearchableIndexQuery.m" lineNumber:268 description:@"Attempting to add live query related block(s) to a non-live query"];
  }
LABEL_29:
  if ([v35 counting])
  {
    v14->_count = 0;
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_72;
    v77[3] = &unk_1E63E61D8;
    objc_copyWeak(&v78, &location);
    [v35[22] setCountChangedHandler:v77];
    objc_destroyWeak(&v78);
  }
  else
  {
    v53 = [v35 countChangedBlock];
    BOOL v54 = v53 == 0;

    if (!v54)
    {
      v64 = [MEMORY[0x1E4F28B00] currentHandler];
      [v64 handleFailureInMethod:a2 object:v35 file:@"EMSearchableIndexQuery.m" lineNumber:278 description:@"Attempting to add count changed related block to a non-counting query"];
    }
  }
  if ([v35 attribute])
  {
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_2_77;
    v75[3] = &unk_1E63E61B0;
    objc_copyWeak(&v76, &location);
    [v35[22] setFoundAttributesHandler:v75];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_3_78;
    v73[3] = &unk_1E63E61B0;
    objc_copyWeak(&v74, &location);
    [v35[22] setChangedAttributesHandler:v73];
    objc_destroyWeak(&v74);
    objc_destroyWeak(&v76);
  }
  else
  {
    v55 = [v35 foundAttributeResultsBlock];
    if (v55)
    {
      v56 = [v35 changedAttributeResultsBlock];
      BOOL v57 = v56 == 0;

      if (!v57)
      {
        v58 = [MEMORY[0x1E4F28B00] currentHandler];
        [v58 handleFailureInMethod:a2 object:v35 file:@"EMSearchableIndexQuery.m" lineNumber:293 description:@"Attempting to add attribute results block to a non-attribute query"];
      }
    }
  }
  v59 = +[EMSearchableIndexQuery log];
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = [v35 description];
    *(_DWORD *)buf = 138412290;
    v105 = v60;
    _os_log_impl(&dword_1BEFDB000, v59, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  objc_destroyWeak(&v86);
  objc_destroyWeak(&v88);
  objc_destroyWeak(&v90);
  objc_destroyWeak(&location);

LABEL_41:
  return v14;
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"This is a simulated failure" code:-1 userInfo:0];
  objc_msgSend(v1, "_searchQueryDidFailWithError:");
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = self;
}

uint64_t __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeResultsBlock];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) _removeResultsBlock];
  [*(id *)(a1 + 32) _removeAllLiveUpdatesBlocks];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_5(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = +[EMSearchableIndexQuery log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [WeakRetained logPrefixString];
    __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_5_cold_1(v3, v4, v2);
  }

  [WeakRetained _cancel];
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_63(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _searchQueryDidFindItems:v3];
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_2_64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = v3;
  id v10 = v5;
  if (!v5)
  {
    id v6 = [WeakRetained simulatedFailedQueryError];

    if (v6)
    {
      id v5 = [WeakRetained simulatedFailedQueryError];
    }
    else
    {
      id v5 = 0;
    }
  }
  int v7 = [WeakRetained live];
  if (v5) {
    int v8 = 0;
  }
  else {
    int v8 = v7;
  }
  v9 = v5;
  if (v8 == 1)
  {
    if ([WeakRetained liveQueryDidGather]) {
      objc_msgSend(MEMORY[0x1E4F28C58], "ef_connectionInterruptedError");
    }
    else {
    v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_temporarilyUnavailableError");
    }
  }
  if (v9) {
    [WeakRetained _searchQueryDidFailWithError:v9];
  }
  else {
    [WeakRetained _searchQueryDidComplete];
  }
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_3_65(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _searchQueryGatherDidEnd];
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_4_66(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _searchQueryDidChangeItems:v3];
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_5_67(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _searchQueryDidRemoveIdentifiers:v4];
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_72(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _searchQueryDidChangeCount:a2];
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_2_77(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _searchQueryDidFindAttribute:v6 values:v5];
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_3_78(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _searchQueryDidChangeAttribute:v6 values:v5];
}

- (void)dealloc
{
  [(EMSearchableIndexQuery *)self _cancelQuery];
  id v3 = [(EFPromise *)self->_resultsPromise future];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)EMSearchableIndexQuery;
  [(EMSearchableIndexQuery *)&v4 dealloc];
}

- (NSString)ef_publicDescription
{
  [(NSLock *)self->_lock lock];
  id v3 = [(EMSearchableIndexQuery *)self queryStatus];
  objc_super v4 = [(CSSearchQuery *)self->_query gatherEndedHandler];
  id v5 = NSStringFromBOOL();

  id v6 = [(CSSearchQuery *)self->_query countChangedHandler];
  int v7 = NSStringFromBOOL();

  int v8 = [(CSSearchQuery *)self->_query countChangedHandler];
  if (v8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%ld)", self->_count);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1F1A3DFB0;
  }

  [(NSLock *)self->_lock unlock];
  id v10 = NSString;
  id v11 = [(EMSearchableIndexQuery *)self logPrefixString];
  id v12 = [(EMSearchableIndexQueryExpression *)self->_expression ef_publicDescription];
  v13 = [v10 stringWithFormat:@"%@ %@ - %@ live:%@ counting:%@%@", v11, v3, v12, v5, v7, v9];

  return (NSString *)v13;
}

- (BOOL)_isFinishedQueryStatus:(id)a3
{
  id v3 = a3;
  if (_isFinishedQueryStatus__onceToken != -1) {
    dispatch_once(&_isFinishedQueryStatus__onceToken, &__block_literal_global_91_0);
  }
  char v4 = [(id)_isFinishedQueryStatus__finishedQueryStatuses containsObject:v3];

  return v4;
}

void __49__EMSearchableIndexQuery__isFinishedQueryStatus___block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"failed";
  v2[1] = @"gathered";
  v2[2] = @"completed";
  v2[3] = @"cancelled";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  os_log_t v1 = (void *)_isFinishedQueryStatus__finishedQueryStatuses;
  _isFinishedQueryStatus__finishedQueryStatuses = v0;
}

- (void)setQueryStatus:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (NSString *)a3;
  if (self->_queryStatus != v5)
  {
    id v6 = +[EMSearchableIndexQuery log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = [(EMSearchableIndexQuery *)self logPrefixString];
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_INFO, "%{public}@ status changed to '%{public}@'", (uint8_t *)&v8, 0x16u);
    }
    objc_storeStrong((id *)&self->_queryStatus, a3);
    if ([(EMSearchableIndexQuery *)self _isFinishedQueryStatus:v5]
      && ![(EMSearchableIndexQuery *)self queryDidMoveToFinishedState])
    {
      [(EMSearchableIndexQuery *)self setQueryDidMoveToFinishedState:1];
      if (![(NSString *)self->_queryStatus isEqualToString:@"gathered"]) {
        [(NSProgress *)self->_internalProgress setCancellationHandler:0];
      }
      [(EMSearchableIndexQuery *)self _logSignpostForSearchQueryDidFinishWithStatus:v5];
    }
  }
}

- (int64_t)count
{
  [(NSLock *)self->_lock lock];
  int64_t count = self->_count;
  [(NSLock *)self->_lock unlock];
  return count;
}

- (BOOL)isFinished
{
  id v2 = [(EFPromise *)self->_resultsPromise future];
  char v3 = [v2 isFinished];

  return v3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)_foundItems:(id)a3
{
  id v8 = a3;
  char v4 = [(EFPromise *)self->_resultsPromise future];
  char v5 = [v4 isFinished];

  if ((v5 & 1) == 0)
  {
    [(NSLock *)self->_lock lock];
    id v6 = (void (**)(void, void))[self->_resultsBlock copy];
    int v7 = [(EMSearchableIndexQuery *)self queryStatus];

    if (v7 != @"gathering")
    {
      [(EMSearchableIndexQuery *)self setQueryStatus:@"gathering"];
      -[EMSearchableIndexQuery _logSignpostForSearchQueryDidReceiveFirstResultsWithItemCount:](self, "_logSignpostForSearchQueryDidReceiveFirstResultsWithItemCount:", [v8 count]);
    }
    [(NSLock *)self->_lock unlock];
    if (v6) {
      ((void (**)(void, id))v6)[2](v6, v8);
    }
  }
}

- (void)_changedItems:(id)a3
{
  id v5 = a3;
  [(NSLock *)self->_lock lock];
  char v4 = (void (**)(void, void))[self->_changedItemsBlock copy];
  [(NSLock *)self->_lock unlock];
  if (v4) {
    ((void (**)(void, id))v4)[2](v4, v5);
  }
}

- (void)_removedItems:(id)a3
{
  id v5 = a3;
  [(NSLock *)self->_lock lock];
  char v4 = (void (**)(void, void))[self->_removedItemsBlock copy];
  [(NSLock *)self->_lock unlock];
  if (v4) {
    ((void (**)(void, id))v4)[2](v4, v5);
  }
}

- (void)_changeCount:(int64_t)a3
{
  [(NSLock *)self->_lock lock];
  id v6 = (id)[self->_countChangedBlock copy];
  [(EMSearchableIndexQuery *)self setCount:a3];
  [(NSLock *)self->_lock unlock];
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(void))v6 + 2))();
    id v5 = v6;
  }
}

- (void)_foundAttribute:(id)a3 values:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  int v7 = [(EFPromise *)self->_resultsPromise future];
  char v8 = [v7 isFinished];

  if ((v8 & 1) == 0)
  {
    [(NSLock *)self->_lock lock];
    v9 = (void (**)(void, void, void))[self->_foundAttributeResultsBlock copy];
    __int16 v10 = [(EMSearchableIndexQuery *)self queryStatus];

    if (v10 != @"gathering") {
      [(EMSearchableIndexQuery *)self setQueryStatus:@"gathering"];
    }
    [(NSLock *)self->_lock unlock];
    if (v9) {
      ((void (**)(void, id, id))v9)[2](v9, v11, v6);
    }
  }
}

- (void)_changedAttribute:(id)a3 values:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(NSLock *)self->_lock lock];
  int v7 = (void (**)(void, void, void))[self->_changedAttributeResultsBlock copy];
  [(NSLock *)self->_lock unlock];
  if (v7) {
    ((void (**)(void, id, id))v7)[2](v7, v8, v6);
  }
}

- (void)_completed
{
  [(NSLock *)self->_lock lock];
  [(EMSearchableIndexQuery *)self setQueryStatus:@"completed"];
  [(NSLock *)self->_lock unlock];
  [(NSProgress *)self->_internalProgress setTotalUnitCount:[(NSProgress *)self->_internalProgress completedUnitCount]];
  resultsPromise = self->_resultsPromise;
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [(EFPromise *)resultsPromise finishWithResult:v4];
}

- (void)_gathered
{
  [(NSLock *)self->_lock lock];
  uint64_t v4 = (void (**)(void))[self->_gatheredBlock copy];
  id gatheredBlock = self->_gatheredBlock;
  self->_id gatheredBlock = 0;

  [(EMSearchableIndexQuery *)self setQueryStatus:@"gathered"];
  [(EMSearchableIndexQuery *)self setLiveQueryDidGather:1];
  [(NSLock *)self->_lock unlock];
  if (v4) {
    v4[2]();
  }
}

- (BOOL)_isCancellationError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_cancelledError");
  char v5 = [v3 isEqual:v4];

  if (v5) {
    goto LABEL_2;
  }
  int v7 = [v3 domain];
  if (![v7 isEqualToString:*MEMORY[0x1E4F229E0]])
  {

LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = [v3 code];

  if (v8 != -2003) {
    goto LABEL_7;
  }
LABEL_2:
  BOOL v6 = 1;
LABEL_8:

  return v6;
}

- (void)_failedWithError:(id)a3
{
  id v6 = a3;
  BOOL v4 = -[EMSearchableIndexQuery _isCancellationError:](self, "_isCancellationError:");
  [(NSLock *)self->_lock lock];
  if (v4) {
    char v5 = @"cancelled";
  }
  else {
    char v5 = @"failed";
  }
  [(EMSearchableIndexQuery *)self setQueryStatus:v5];
  [(NSLock *)self->_lock unlock];
  [(EFPromise *)self->_resultsPromise finishWithError:v6];
}

- (void)cancel
{
}

- (void)_cancelQuery
{
  [(CSSearchQuery *)self->_query setCompletionHandler:0];
  [(CSSearchQuery *)self->_query setFoundItemHandler:0];
  query = self->_query;
  [(CSSearchQuery *)query cancel];
}

- (void)_cancel
{
  [(NSLock *)self->_lock lock];
  [(EMSearchableIndexQuery *)self _cancelQuery];
  [(NSLock *)self->_lock unlock];
  objc_msgSend(MEMORY[0x1E4F28C58], "ef_cancelledError");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EMSearchableIndexQuery _failedWithError:](self, "_failedWithError:");
}

- (BOOL)isCancelled
{
  [(NSLock *)self->_lock lock];
  id v3 = [(EMSearchableIndexQuery *)self queryStatus];
  char v4 = [v3 isEqualToString:@"cancelled"];

  [(NSLock *)self->_lock unlock];
  return v4;
}

- (void)start
{
  v3.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  v3.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter((os_activity_t)self->activity, &v3);
  [(NSLock *)self->_lock lock];
  [(CSSearchQuery *)self->_query start];
  [(EMSearchableIndexQuery *)self setQueryStatus:@"started"];
  [(EMSearchableIndexQuery *)self _logSignpostForSearchQueryStart];
  [(NSLock *)self->_lock unlock];
  os_activity_scope_leave(&v3);
}

- (void)simulateFailedQueryWithError:(id)a3
{
  id v4 = a3;
  -[EMSearchableIndexQuery setSimulatedFailedQueryError:](self, "setSimulatedFailedQueryError:");
  [(CSSearchQuery *)self->_query cancel];
}

- (void)_removeResultsBlock
{
  [(NSLock *)self->_lock lock];
  [(EMSearchableIndexQuery *)self setResultsBlock:0];
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)_removeAllLiveUpdatesBlocks
{
  [(NSLock *)self->_lock lock];
  [(EMSearchableIndexQuery *)self setGatheredBlock:0];
  [(EMSearchableIndexQuery *)self setChangedItemsBlock:0];
  [(EMSearchableIndexQuery *)self setCountChangedBlock:0];
  [(EMSearchableIndexQuery *)self setRemovedItemsBlock:0];
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)_performClientWork:(id)a3
{
  os_activity_scope_state_s v3 = (void (**)(void))a3;
  v3[2]();
}

- (void)_searchQueryDidFindItems:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = +[EMSearchableIndexQuery log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(EMSearchableIndexQuery *)self logPrefixString];
    *(_DWORD *)buf = 138543618;
    id v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = [v4 count];
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ found %lu items", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__EMSearchableIndexQuery__searchQueryDidFindItems___block_invoke;
  v8[3] = &unk_1E63E2760;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [(EMSearchableIndexQuery *)self _performClientWork:v8];
}

uint64_t __51__EMSearchableIndexQuery__searchQueryDidFindItems___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 200) becomeCurrentWithPendingUnitCount:1];
  [*(id *)(a1 + 32) _foundItems:*(void *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 200);
  return [v2 resignCurrent];
}

- (void)_searchQueryDidFailWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = +[EMSearchableIndexQuery log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [(EMSearchableIndexQuery *)self logPrefixString];
    id v7 = objc_msgSend(v4, "ef_publicDescription");
    -[EMSearchableIndexQuery _searchQueryDidFailWithError:](v6, v7, buf, v5);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__EMSearchableIndexQuery__searchQueryDidFailWithError___block_invoke;
  v9[3] = &unk_1E63E2760;
  v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  [(EMSearchableIndexQuery *)self _performClientWork:v9];
}

uint64_t __55__EMSearchableIndexQuery__searchQueryDidFailWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _failedWithError:*(void *)(a1 + 40)];
}

- (void)_searchQueryDidComplete
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v3 = +[EMSearchableIndexQuery log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(EMSearchableIndexQuery *)self logPrefixString];
    *(_DWORD *)buf = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ completed", buf, 0xCu);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__EMSearchableIndexQuery__searchQueryDidComplete__block_invoke;
  v5[3] = &unk_1E63E26B0;
  v5[4] = self;
  [(EMSearchableIndexQuery *)self _performClientWork:v5];
}

uint64_t __49__EMSearchableIndexQuery__searchQueryDidComplete__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completed];
}

- (void)_searchQueryGatherDidEnd
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v3 = +[EMSearchableIndexQuery log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(EMSearchableIndexQuery *)self logPrefixString];
    *(_DWORD *)buf = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ gathered", buf, 0xCu);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__EMSearchableIndexQuery__searchQueryGatherDidEnd__block_invoke;
  v5[3] = &unk_1E63E26B0;
  v5[4] = self;
  [(EMSearchableIndexQuery *)self _performClientWork:v5];
}

uint64_t __50__EMSearchableIndexQuery__searchQueryGatherDidEnd__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _gathered];
}

- (void)_searchQueryDidChangeItems:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = +[EMSearchableIndexQuery log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(EMSearchableIndexQuery *)self logPrefixString];
    *(_DWORD *)buf = 138543618;
    id v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = [v4 count];
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ changed %lu items", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__EMSearchableIndexQuery__searchQueryDidChangeItems___block_invoke;
  v8[3] = &unk_1E63E2760;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [(EMSearchableIndexQuery *)self _performClientWork:v8];
}

uint64_t __53__EMSearchableIndexQuery__searchQueryDidChangeItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changedItems:*(void *)(a1 + 40)];
}

- (void)_searchQueryDidRemoveIdentifiers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = +[EMSearchableIndexQuery log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(EMSearchableIndexQuery *)self logPrefixString];
    *(_DWORD *)buf = 138543618;
    id v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = [v4 count];
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removed %lu items", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__EMSearchableIndexQuery__searchQueryDidRemoveIdentifiers___block_invoke;
  v8[3] = &unk_1E63E2760;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [(EMSearchableIndexQuery *)self _performClientWork:v8];
}

uint64_t __59__EMSearchableIndexQuery__searchQueryDidRemoveIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removedItems:*(void *)(a1 + 40)];
}

- (void)_searchQueryDidChangeCount:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v5 = +[EMSearchableIndexQuery log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(EMSearchableIndexQuery *)self logPrefixString];
    *(_DWORD *)buf = 138543618;
    id v9 = v6;
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ count changed %lu items", buf, 0x16u);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__EMSearchableIndexQuery__searchQueryDidChangeCount___block_invoke;
  v7[3] = &unk_1E63E2AB8;
  v7[4] = self;
  v7[5] = a3;
  [(EMSearchableIndexQuery *)self _performClientWork:v7];
}

uint64_t __53__EMSearchableIndexQuery__searchQueryDidChangeCount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changeCount:*(void *)(a1 + 40)];
}

- (void)_searchQueryDidFindAttribute:(id)a3 values:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[EMSearchableIndexQuery log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(EMSearchableIndexQuery *)self logPrefixString];
    *(_DWORD *)buf = 138543874;
    v16 = v9;
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2048;
    uint64_t v20 = [v7 count];
    _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ found attribute %{public}@ with %lu values", buf, 0x20u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__EMSearchableIndexQuery__searchQueryDidFindAttribute_values___block_invoke;
  v12[3] = &unk_1E63E2848;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [(EMSearchableIndexQuery *)self _performClientWork:v12];
}

uint64_t __62__EMSearchableIndexQuery__searchQueryDidFindAttribute_values___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 200) becomeCurrentWithPendingUnitCount:1];
  [*(id *)(a1 + 32) _foundAttribute:*(void *)(a1 + 40) values:*(void *)(a1 + 48)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 200);
  return [v2 resignCurrent];
}

- (void)_searchQueryDidChangeAttribute:(id)a3 values:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[EMSearchableIndexQuery log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(EMSearchableIndexQuery *)self logPrefixString];
    *(_DWORD *)buf = 138543874;
    v16 = v9;
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2048;
    uint64_t v20 = [v7 count];
    _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ change attribute %{public}@ with %lu values", buf, 0x20u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__EMSearchableIndexQuery__searchQueryDidChangeAttribute_values___block_invoke;
  v12[3] = &unk_1E63E2848;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [(EMSearchableIndexQuery *)self _performClientWork:v12];
}

uint64_t __64__EMSearchableIndexQuery__searchQueryDidChangeAttribute_values___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 200) becomeCurrentWithPendingUnitCount:1];
  [*(id *)(a1 + 32) _changedAttribute:*(void *)(a1 + 40) values:*(void *)(a1 + 48)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 200);
  return [v2 resignCurrent];
}

- (void)_logSignpostForSearchQueryStart
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v3 = +[EMSearchableIndexQuery signpostLog];
  os_signpost_id_t v4 = [(EMSearchableIndexQuery *)self signpostID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    char v5 = [(EMSearchableIndexQuery *)self expression];
    int v6 = 138477827;
    id v7 = v5;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "EMSearchableIndexQuery", "QueryStartedWithExpression=%{signpost.description:attribute,private}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_logSignpostForSearchQueryDidReceiveFirstResultsWithItemCount:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v5 = +[EMSearchableIndexQuery signpostLog];
  os_signpost_id_t v6 = [(EMSearchableIndexQuery *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v7 = 134349056;
    unint64_t v8 = a3;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v5, OS_SIGNPOST_EVENT, v6, "EMSearchableIndexQuery", "ReceivedFirstResultsWithItemCount=%{signpost.description:attribute,public}lu", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_logSignpostForSearchQueryDidFinishWithStatus:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = +[EMSearchableIndexQuery signpostLog];
  os_signpost_id_t v6 = [(EMSearchableIndexQuery *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_1BEFDB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "EMSearchableIndexQuery", "QueryFinishedWithStatus=%{signpost.description:attribute,public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (id)resultsBlock
{
  return self->_resultsBlock;
}

- (void)setResultsBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)failureBlock
{
  return self->_failureBlock;
}

- (void)setFailureBlock:(id)a3
{
}

- (id)gatheredBlock
{
  return self->_gatheredBlock;
}

- (void)setGatheredBlock:(id)a3
{
}

- (id)changedItemsBlock
{
  return self->_changedItemsBlock;
}

- (void)setChangedItemsBlock:(id)a3
{
}

- (id)foundAttributeResultsBlock
{
  return self->_foundAttributeResultsBlock;
}

- (void)setFoundAttributeResultsBlock:(id)a3
{
}

- (id)changedAttributeResultsBlock
{
  return self->_changedAttributeResultsBlock;
}

- (void)setChangedAttributeResultsBlock:(id)a3
{
}

- (id)removedItemsBlock
{
  return self->_removedItemsBlock;
}

- (void)setRemovedItemsBlock:(id)a3
{
}

- (id)countChangedBlock
{
  return self->_countChangedBlock;
}

- (void)setCountChangedBlock:(id)a3
{
}

- (BOOL)counting
{
  return self->_counting;
}

- (void)setCounting:(BOOL)a3
{
  self->_counting = a3;
}

- (BOOL)attribute
{
  return self->_attribute;
}

- (void)setAttribute:(BOOL)a3
{
  self->_attribute = a3;
}

- (NSArray)fetchAttributes
{
  return self->_fetchAttributes;
}

- (void)setFetchAttributes:(id)a3
{
}

- (NSArray)protectionClasses
{
  return self->_protectionClasses;
}

- (void)setProtectionClasses:(id)a3
{
}

- (NSArray)rankingQueries
{
  return self->_rankingQueries;
}

- (void)setRankingQueries:(id)a3
{
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(int64_t)a3
{
  self->_maxCount = a3;
}

- (BOOL)live
{
  return self->_live;
}

- (void)setLive:(BOOL)a3
{
  self->_live = a3;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
{
}

- (EMSearchableIndexQueryExpression)expression
{
  return self->_expression;
}

- (void)setExpression:(id)a3
{
}

- (void)setCount:(int64_t)a3
{
  self->_int64_t count = a3;
}

- (void)setLogPrefixString:(id)a3
{
}

- (NSString)queryStatus
{
  return self->_queryStatus;
}

- (BOOL)queryDidMoveToFinishedState
{
  return self->_queryDidMoveToFinishedState;
}

- (void)setQueryDidMoveToFinishedState:(BOOL)a3
{
  self->_queryDidMoveToFinishedState = a3;
}

- (BOOL)liveQueryDidGather
{
  return self->_liveQueryDidGather;
}

- (void)setLiveQueryDidGather:(BOOL)a3
{
  self->_liveQueryDidGather = a3;
}

- (CSSearchQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)internalProgress
{
  return self->_internalProgress;
}

- (void)setInternalProgress:(id)a3
{
}

- (EFPromise)resultsPromise
{
  return self->_resultsPromise;
}

- (void)setResultsPromise:(id)a3
{
}

- (NSError)simulatedFailedQueryError
{
  return self->_simulatedFailedQueryError;
}

- (void)setSimulatedFailedQueryError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedFailedQueryError, 0);
  objc_storeStrong((id *)&self->_resultsPromise, 0);
  objc_storeStrong((id *)&self->_internalProgress, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryStatus, 0);
  objc_storeStrong((id *)&self->_logPrefixString, 0);
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_rankingQueries, 0);
  objc_storeStrong((id *)&self->_protectionClasses, 0);
  objc_storeStrong((id *)&self->_fetchAttributes, 0);
  objc_storeStrong(&self->_countChangedBlock, 0);
  objc_storeStrong(&self->_removedItemsBlock, 0);
  objc_storeStrong(&self->_changedAttributeResultsBlock, 0);
  objc_storeStrong(&self->_foundAttributeResultsBlock, 0);
  objc_storeStrong(&self->_changedItemsBlock, 0);
  objc_storeStrong(&self->_gatheredBlock, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_resultsBlock, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->activity, 0);
}

+ (id)_operandStringForOperand:(int64_t)a3
{
  os_activity_scope_state_s v3 = @"&&";
  if (a3 == 2) {
    os_activity_scope_state_s v3 = @"||";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"!";
  }
}

+ (id)_modifierStringFromModifiers:(unint64_t)a3
{
  os_activity_scope_state_s v3 = "c";
  id v4 = "";
  if ((a3 & 1) == 0) {
    os_activity_scope_state_s v3 = "";
  }
  char v5 = "d";
  if ((a3 & 2) == 0) {
    char v5 = "";
  }
  os_signpost_id_t v6 = "w";
  if ((a3 & 4) == 0) {
    os_signpost_id_t v6 = "";
  }
  int v7 = "t";
  if ((a3 & 8) == 0) {
    int v7 = "";
  }
  if ((a3 & 0x10) != 0) {
    id v4 = "f070";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s%s%s%s%s", v3, v5, v6, v7, v4);
}

+ (id)queryStringByJoiningQueries:(id)a3 withOperand:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)[v6 count] > 1)
  {
    id v8 = NSString;
    uint64_t v9 = [a1 _operandStringForOperand:a4];
    id v10 = [v8 stringWithFormat:@" %@ ", v9];

    id v11 = NSString;
    uint64_t v12 = [v6 componentsJoinedByString:v10];
    int v7 = [v11 stringWithFormat:@"(%@)", v12];
  }
  else
  {
    int v7 = [v6 firstObject];
  }

  return v7;
}

+ (id)_queryStringForPhrase:(id)a3 attributes:(id)a4 modifiers:(unint64_t)a5 phraseMatchFormatString:(id)a6
{
  id v6 = [a1 _queryStringForPhrase:a3 attributes:a4 modifiers:a5 phraseMatchFormatString:a6 comparisonOperator:0];
  return v6;
}

+ (id)_queryStringForPhrase:(id)a3 attributes:(id)a4 modifiers:(unint64_t)a5 phraseMatchFormatString:(id)a6 comparisonOperator:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = [a1 _modifierStringFromModifiers:a5];
  v16 = objc_msgSend(v12, "em_stringForQuotingWithCharacter:", 39);
  __int16 v17 = objc_msgSend(NSString, "stringWithFormat:", v14, v16);
  id v18 = @"!=";
  if (!a7) {
    id v18 = @"=";
  }
  __int16 v19 = v18;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __152__EMSearchableIndexQuery_EMSearchableIndexQueryStringGeneration___queryStringForPhrase_attributes_modifiers_phraseMatchFormatString_comparisonOperator___block_invoke;
  v26[3] = &unk_1E63E6200;
  uint64_t v20 = v19;
  double v27 = v20;
  id v21 = v17;
  id v28 = v21;
  id v22 = v15;
  id v29 = v22;
  uint64_t v23 = objc_msgSend(v13, "ef_map:", v26);
  v24 = [a1 queryStringByJoiningQueries:v23 withOperand:2];

  return v24;
}

id __152__EMSearchableIndexQuery_EMSearchableIndexQueryStringGeneration___queryStringForPhrase_attributes_modifiers_phraseMatchFormatString_comparisonOperator___block_invoke(void *a1, uint64_t a2)
{
  id v2 = [NSString stringWithFormat:@"%@ %@ '%@'%@", a2, a1[4], a1[5], a1[6]];
  return v2;
}

+ (id)queryStringForPhrase:(id)a3 attributes:(id)a4 modifiers:(unint64_t)a5 languages:(id)a6
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_msgSend(v10, "ef_stringByRemovingQuotesForLanguages:", v12);
  id v14 = [a1 _queryStringForPhrase:v13 attributes:v11 modifiers:a5 phraseMatchFormatString:@"*%@*"];
  if ((a5 & 4) == 0 || (unint64_t)[v11 count] < 2) {
    goto LABEL_8;
  }
  v15 = [a1 searchWordsForPhrase:v10 languages:v12];
  if ((unint64_t)[v15 count] <= 1)
  {

LABEL_8:
    __int16 v17 = 0;
    BOOL v18 = v14 != 0;
    goto LABEL_9;
  }
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __118__EMSearchableIndexQuery_EMSearchableIndexQueryStringGeneration__queryStringForPhrase_attributes_modifiers_languages___block_invoke;
  double v27 = &unk_1E63E6228;
  id v29 = a1;
  id v28 = v11;
  unint64_t v30 = a5;
  v16 = objc_msgSend(v15, "ef_map:", &v24);
  __int16 v17 = objc_msgSend(a1, "queryStringByJoiningQueries:withOperand:", v16, 1, v24, v25, v26, v27);

  BOOL v18 = v14 != 0;
  if (v14 && v17)
  {
    v31[0] = v14;
    v31[1] = v17;
    __int16 v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    id v20 = [a1 queryStringByJoiningQueries:v19 withOperand:2];

    goto LABEL_13;
  }
LABEL_9:
  if (v18) {
    id v21 = v14;
  }
  else {
    id v21 = v17;
  }
  id v20 = v21;
LABEL_13:
  id v22 = v20;

  return v22;
}

id __118__EMSearchableIndexQuery_EMSearchableIndexQueryStringGeneration__queryStringForPhrase_attributes_modifiers_languages___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 40) _queryStringForPhrase:a2 attributes:*(void *)(a1 + 32) modifiers:*(void *)(a1 + 48) phraseMatchFormatString:@"%@*"];
  return v2;
}

+ (id)queryStringForPhrase:(id)a3 attributes:(id)a4 modifiers:(unint64_t)a5 languages:(id)a6 phraseMatchFormatString:(id)a7 comparisonOperator:(int64_t)a8
{
  id v14 = a4;
  id v15 = a7;
  v16 = objc_msgSend(a3, "ef_stringByRemovingQuotesForLanguages:", a6);
  __int16 v17 = [a1 _queryStringForPhrase:v16 attributes:v14 modifiers:a5 phraseMatchFormatString:v15 comparisonOperator:a8];

  return v17;
}

+ (id)searchWordsForPhrase:(id)a3 languages:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  __int16 v19 = objc_msgSend(v17, "ef_quotedWordComponentsForLanguages:");
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v19;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    unsigned __int8 v8 = 0;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unint64_t v12 = [v11 length];
        if (((v12 > 3) & v8) == 1)
        {
          if ([v5 length]) {
            [v20 addObject:v5];
          }
          uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v11];

          id v5 = (id)v13;
        }
        else
        {
          uint64_t v14 = [v5 length];
          id v15 = @" ";
          if (!v14) {
            id v15 = &stru_1F1A3DFB0;
          }
          [v5 appendFormat:@"%@%@", v15, v11];
        }
        v8 |= v12 > 3;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  if ([v5 length]) {
    [v20 addObject:v5];
  }

  return v20;
}

- (void)initWithExpression:(os_log_t)log builder:queryContext:querySetup:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Live queries for attribute values are not implemented in EMSearchableIndexQuery. If this is required, then additional plumbing will be required. Will fall back to using a one-time foundAttributesHandler.", v1, 2u);
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_5_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_DEBUG, "%{public}@ cancelled via NSProgress", buf, 0xCu);
}

- (void)_performClientWork:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_FAULT, "#Warning %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_searchQueryDidFailWithError:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed: %{public}@", buf, 0x16u);
}

@end