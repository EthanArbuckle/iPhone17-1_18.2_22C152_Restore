@interface CSSearchQuery
+ (id)_makeQueryErrorWithErrorCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5;
+ (void)initialize;
+ (void)preheat:(id)a3;
+ (void)setConnectionName:(id)a3;
- (BOOL)addOrUpdateLiveOID:(int64_t)a3 bundleID:(id)a4 identifier:(id)a5;
- (BOOL)attribute;
- (BOOL)counting;
- (BOOL)grouped;
- (BOOL)internal;
- (BOOL)isCJK;
- (BOOL)isCancelled;
- (BOOL)isKeyboardCJK;
- (BOOL)isTopHitQuery;
- (BOOL)live;
- (BOOL)privateIndex;
- (BOOL)privateQuery;
- (BOOL)removeLiveOID:(int64_t)a3 outBundleID:(id *)a4 outIdentifier:(id *)a5;
- (BOOL)removeUserFSLiveOID:(int64_t)a3 outBundleID:(id *)a4 outIdentifier:(id *)a5;
- (BOOL)suspended;
- (BOOL)userFSIndex;
- (CSSearchQuery)init;
- (CSSearchQuery)initWithQueryString:(NSString *)queryString attributes:(NSArray *)attributes;
- (CSSearchQuery)initWithQueryString:(NSString *)queryString queryContext:(CSSearchQueryContext *)queryContext;
- (CSSearchQuery)initWithQueryString:(id)a3 context:(id)a4;
- (CSSearchQuery)initWithQueryString:(id)a3 options:(id)a4;
- (CSSearchQueryContext)queryContext;
- (NSArray)fetchAttributes;
- (NSArray)protectionClasses;
- (NSIndexSet)indexSet;
- (NSMapTable)liveIndexBundleIDToBundleString;
- (NSMapTable)liveIndexBundleIDToIndexItemIDMap;
- (NSMapTable)liveIndexUserFSOIDTOIdentifierMap;
- (NSMutableDictionary)currentDenseCandidates;
- (NSMutableDictionary)currentTopHitCandidates;
- (NSString)privateBundleID;
- (NSString)queryString;
- (NSUInteger)foundItemCount;
- (OS_dispatch_queue)queue;
- (PRSQueryRankingConfiguration)rankConfig;
- (PRSRankingItemRanker)ranker;
- (double)currentTime;
- (id)addOrUpdateUserFSLiveOID:(int64_t)a3 userFSDomain:(id)a4 identifier:(id)a5;
- (id)bundleIDs;
- (id)changedAttributesHandler;
- (id)changedItemsHandler;
- (id)completionScoresHandler;
- (id)completionsHandler;
- (id)connection;
- (id)copyCSSearchableItemWithValues:(id *)a3 valueCount:(unint64_t)a4 attrKeys:(unint64_t *)a5 protectionClass:(id)a6 mappingStrategy:(id)a7 attrInfo:(signed __int16 *)a8 requestedAttributeCount:(unint64_t)a9 unpackInfo:(CSUnpackInfo)a10 userFSDomain:(id)a11;
- (id)copyResultsFromPlist:(id)a3 protectionClass:(id)a4;
- (id)countChangedHandler;
- (id)debugDescription;
- (id)debugDescriptionWithQueryString:(BOOL)a3;
- (id)description;
- (id)foundAttributesHandler;
- (id)foundItemHandler;
- (id)gatherEndedHandler;
- (id)getTopHitResult:(id)a3 fetchAttrs:(id)a4;
- (id)interruptedHandler;
- (id)keyboardLanguage;
- (id)options;
- (id)photosComputedAttributesHandler;
- (id)preferredLanguages;
- (id)priorityGatherEndedHandler;
- (id)processFromMegadomePeopleSuggestions:(id)a3 resultsFromMultiQuery:(id)a4 fromSuggestions:(id)a5 processedSuggestions:(id)a6;
- (id)processToMegadomePeopleSuggestions:(id)a3 resultsToMultiQuery:(id)a4 toSuggestions:(id)a5 processedSuggestions:(id)a6;
- (id)rankBatch:(id)a3 withRanker:(id)a4 withBundle:(id)a5 maxCount:(unint64_t)a6 userQuery:(id)a7 queryID:(int64_t)a8 rankingConfiguration:(id)a9 isCJK:(BOOL)a10 clientBundle:(id)a11 isKeyboardCJK:(BOOL)a12 privateQuery:(BOOL)a13 collectL2Signals:(BOOL)a14 onlyEmbeddingResults:(BOOL)a15;
- (id)removedItemsHandler;
- (id)resolvedAttributeNamesHandler;
- (id)restartGatherEndedHandler;
- (id)restartedHandler;
- (id)scopes;
- (unint64_t)dispatchApplyWidth;
- (unint64_t)hitCount;
- (unint64_t)originalHitCount;
- (unint64_t)originalMaxRankedResultCount;
- (void)_finishWithError:(id)a3;
- (void)_removeIdentifiers:(id)a3 withBundleID:(id)a4 andQueryID:(int64_t)a5;
- (void)addSuggestionCountQuery:(id)a3;
- (void)cancel;
- (void)commonInitWithQueryString:(id)a3 queryContext:(id)a4;
- (void)completionHandler;
- (void)deactivate;
- (void)dealloc;
- (void)didFinishWithError:(id)a3;
- (void)didResolveFriendlyAttributeNames:(id)a3 fromFetchAttributes:(id)a4;
- (void)didReturnResults:(int64_t)a3 resultsData:(id)a4 oidData:(id)a5 protectionClass:(id)a6 completionHandler:(id)a7;
- (void)filterMegadomePeopleSuggestions:(id)a3 isShortQuery:(BOOL)a4 completionHandler:(id)a5;
- (void)filterRankedItems:(id)a3 maxCount:(unint64_t)a4 bundle:(id)a5 userQuery:(id)a6 queryID:(int64_t)a7 privateQuery:(BOOL)a8 rankingConfiguration:(id)a9 currentTime:(double)a10 clientBundle:(id)a11 ranker:(id)a12;
- (void)filterZKWPeopleSuggestions:(id)a3 completionHandler:(id)a4;
- (void)finishTopHitRanking;
- (void)foundItemsHandler;
- (void)handleCompletion:(id)a3;
- (void)handleError:(id)a3;
- (void)handleFoundAttributes:(id)a3 values:(id)a4 attributesHandler:(id)a5;
- (void)handleFoundItems:(id)a3;
- (void)handleGatherEnded;
- (void)poll;
- (void)populateSuggestionCount:(id)a3 completionHandler:(id)a4;
- (void)processAttributesData:(id)a3 update:(BOOL)a4 protectionClass:(id)a5;
- (void)processCompletionsResultsData:(id)a3 protectionClass:(id)a4;
- (void)processInstantAnswer:(id)a3;
- (void)processLiveResultsData:(id)a3 oidData:(id)a4 protectionClass:(id)a5;
- (void)processPhotosComputedData:(id)a3 protectionClass:(id)a4;
- (void)processRemoveResultsData:(id)a3 protectionClass:(id)a4;
- (void)processResultFromPlist:(id)a3 atIndex:(unint64_t)a4 protectionClass:(id)a5 oids:(int64_t *)a6 oidCount:(unsigned int)a7 addItems:(id *)a8 updateItems:(id *)a9 moveItems:(id *)a10;
- (void)processResultItems:(id)a3;
- (void)processResultsData:(id)a3 protectionClass:(id)a4;
- (void)processResultsForTopHitRanking:(id)a3 protectionClass:(id)a4;
- (void)processSuggestions:(id)a3;
- (void)removeSuggestionCountQuery:(id)a3;
- (void)setBundleIDs:(id)a3;
- (void)setChangedAttributesHandler:(id)a3;
- (void)setChangedItemsHandler:(id)a3;
- (void)setCompletionHandler:(void *)completionHandler;
- (void)setCompletionScoresHandler:(id)a3;
- (void)setCompletionsHandler:(id)a3;
- (void)setCountChangedHandler:(id)a3;
- (void)setCurrentDenseCandidates:(id)a3;
- (void)setCurrentTopHitCandidates:(id)a3;
- (void)setFoundAttributesHandler:(id)a3;
- (void)setFoundItemHandler:(id)a3;
- (void)setFoundItemsHandler:(void *)foundItemsHandler;
- (void)setGatherEndedHandler:(id)a3;
- (void)setHitCount:(unint64_t)a3;
- (void)setIndexSet:(id)a3;
- (void)setInterruptedHandler:(id)a3;
- (void)setIsCJK:(BOOL)a3;
- (void)setIsKeyboardCJK:(BOOL)a3;
- (void)setLiveIndexBundleIDToBundleString:(id)a3;
- (void)setLiveIndexBundleIDToIndexItemIDMap:(id)a3;
- (void)setLiveIndexUserFSOIDTOIdentifierMap:(id)a3;
- (void)setOriginalHitCount:(unint64_t)a3;
- (void)setOriginalMaxRankedResultCount:(unint64_t)a3;
- (void)setPhotosComputedAttributesHandler:(id)a3;
- (void)setPriorityGatherEndedHandler:(id)a3;
- (void)setPrivateBundleID:(id)a3;
- (void)setPrivateIndex:(BOOL)a3;
- (void)setPrivateQuery:(BOOL)a3;
- (void)setProtectionClasses:(NSArray *)protectionClasses;
- (void)setQueryContext:(id)a3;
- (void)setQueryString:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRankConfig:(id)a3;
- (void)setRanker:(id)a3;
- (void)setRemovedItemsHandler:(id)a3;
- (void)setResolvedAttributeNamesHandler:(id)a3;
- (void)setRestartGatherEndedHandler:(id)a3;
- (void)setRestartedHandler:(id)a3;
- (void)setScopes:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setUserFSIndex:(BOOL)a3;
- (void)setupFetchAttributesForSearch;
- (void)setupTopHitQueryContextForClientBundleId:(id)a3;
- (void)start;
- (void)updateQueryContext:(id)a3;
- (void)updateQueryString:(id)a3;
- (void)userEngagedWithResult:(id)a3 interactionType:(int)a4;
- (void)willStartQuery;
@end

@implementation CSSearchQuery

- (id)debugDescriptionWithQueryString:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)MEMORY[0x192F99810](self, a2);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@:%p", objc_opt_class(), self];
  queryContext = self->_queryContext;
  if (queryContext)
  {
    objc_msgSend(v6, "appendFormat:", @" qid=%ld flag=0x%4.4x", -[CSSearchQueryContext queryID](queryContext, "queryID"), -[CSSearchQueryContext flags](self->_queryContext, "flags"));
    v8 = [(CSSearchQueryContext *)self->_queryContext scopes];
    if ([v8 count])
    {
      v9 = [v8 componentsJoinedByString:@", "];
      [v6 appendFormat:@" scopes=(%@)", v9];
    }
    v10 = [(CSSearchQueryContext *)self->_queryContext mountPoints];
    if ([v10 count])
    {
      v11 = [v10 componentsJoinedByString:@", "];
      [v6 appendFormat:@" mount=(%@)", v11];
    }
  }
  if (self->_started)
  {
    objc_msgSend(v6, "appendFormat:", @" count=%ld", -[CSSearchQuery foundItemCount](self, "foundItemCount"));
    [v6 appendString:@" started=true"];
  }
  if (self->_cancelled) {
    [v6 appendString:@" cancelled=true"];
  }
  if (self->_suspended) {
    [v6 appendString:@" suspended=true"];
  }
  if (self->_finished) {
    [v6 appendString:@" finished=true"];
  }
  if ([(CSSearchQuery *)self privateQuery]
    || [(CSSearchQueryContext *)self->_queryContext privateQuery])
  {
    [v6 appendString:@" private=true"];
  }
  else
  {
    v13 = self->_queryContext;
    if (v13)
    {
      v14 = [(CSSearchQueryContext *)v13 userQuery];
      uint64_t v15 = [v14 length];

      if (v15)
      {
        v16 = [(CSSearchQueryContext *)self->_queryContext userQuery];
        v17 = CSRedactString(v16, 1);
        [v6 appendFormat:@" userQuery=%@", v17];
      }
    }
    if ([(NSString *)self->_queryString length])
    {
      if (v3)
      {
        [v6 appendFormat:@" queryString=%@", self->_queryString];
      }
      else
      {
        v18 = CSRedactString(self->_queryString, 1);
        [v6 appendFormat:@" queryString=%@", v18];
      }
    }
  }
  [v6 appendString:@">"];

  return v6;
}

- (BOOL)privateQuery
{
  return self->_privateQuery;
}

- (NSUInteger)foundItemCount
{
  v2 = self;
  objc_sync_enter(v2);
  NSUInteger foundItemCount = v2->_foundItemCount;
  objc_sync_exit(v2);

  return foundItemCount;
}

- (void)didReturnResults:(int64_t)a3 resultsData:(id)a4 oidData:(id)a5 protectionClass:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  BOOL v15 = [(CSSearchQueryContext *)self->_queryContext attribute];
  BOOL v16 = [(CSSearchQueryContext *)self->_queryContext counting];
  BOOL v17 = [(CSSearchQueryContext *)self->_queryContext live];
  qos_class_t v18 = qos_class_self();
  if ([(CSSearchQueryContext *)self->_queryContext qos]) {
    qos_class_t v18 = [(CSSearchQueryContext *)self->_queryContext qos];
  }
  int64_t v19 = [(CSSearchQueryContext *)self->_queryContext queryID];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke;
  block[3] = &unk_1E554C6B0;
  BOOL v34 = v15;
  BOOL v35 = v16;
  BOOL v36 = v17;
  id v31 = v14;
  int64_t v32 = v19;
  int64_t v33 = a3;
  block[4] = self;
  id v28 = v11;
  id v29 = v13;
  id v30 = v12;
  id v21 = v12;
  id v22 = v13;
  id v23 = v11;
  id v24 = v14;
  dispatch_block_t v25 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v18, 0, block);
  dispatch_async(queue, v25);
}

- (NSString)queryString
{
  return self->_queryString;
}

void __109__CSSearchQuery_processResultFromPlist_atIndex_protectionClass_oids_oidCount_addItems_updateItems_moveItems___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 56))
  {
    *a3 = 1;
    return;
  }
  uint64_t v6 = *(void *)(a1 + 64);
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = *(void *)(v6 + 8 * *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  if (!v7) {
    goto LABEL_15;
  }
  if ((*(__int16 *)(a1 + 104) & 0x80000000) == 0
    && (id v8 = *(id *)(a2 + 8 * *(unsigned __int16 *)(a1 + 104))) != 0)
  {
    v9 = v8;
    if (*(__int16 *)(a1 + 106) < 0 || (id v10 = *(id *)(a2 + 8 * *(unsigned __int16 *)(a1 + 106))) == 0)
    {
      LODWORD(v7) = 0;
    }
    else
    {
      id v11 = v10;
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      if (v13)
      {
        uint64_t v7 = [v12 addOrUpdateUserFSLiveOID:v7 userFSDomain:v13 identifier:v11];
        if (v7)
        {
          id v14 = **(void ***)(a1 + 72);
          if (v14)
          {
            [v14 addObject:v7];
          }
          else
          {
            uint64_t v27 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
            id v28 = *(void ***)(a1 + 72);
            id v29 = *v28;
            *id v28 = (void *)v27;
          }
        }

        LODWORD(v7) = 0;
      }
      else
      {
        LODWORD(v7) = [v12 addOrUpdateLiveOID:v7 bundleID:v9 identifier:v11];
      }
    }
  }
  else
  {
LABEL_14:
    LODWORD(v7) = 0;
  }
LABEL_15:
  BOOL v15 = [*(id *)(a1 + 32) foundItemHandler];

  if (!v15)
  {
    uint64_t v18 = *(void *)(a1 + 32);
    int64_t v19 = objc_msgSend((id)v18, "copyCSSearchableItemWithValues:valueCount:attrKeys:protectionClass:mappingStrategy:attrInfo:requestedAttributeCount:unpackInfo:userFSDomain:", a2, *(void *)(a1 + 80), *(void *)(v18 + 72), *(void *)(a1 + 48), *(void *)(v18 + 64), v18 + 26, *(__int16 *)(v18 + 24), *(void *)(a1 + 108), *(unsigned __int16 *)(a1 + 116), *(void *)(a1 + 40));
    id v31 = v19;
    if (v19)
    {
      v20 = v19;
      if (v7)
      {
        id v21 = **(void ***)(a1 + 88);
        if (!v21)
        {
          uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:&v31 count:1];
          id v23 = *(void ***)(a1 + 88);
LABEL_35:
          v26 = *v23;
          *id v23 = (void *)v22;

          goto LABEL_36;
        }
      }
      else
      {
        id v21 = **(void ***)(a1 + 96);
        if (!v21)
        {
          uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:&v31 count:1];
          id v23 = *(void ***)(a1 + 96);
          goto LABEL_35;
        }
      }
      [v21 addObject:v20];
    }
LABEL_36:

    return;
  }
  if ((v7 & 1) != 0 || (BOOL v16 = *(void **)(a1 + 64)) != 0 && *v16 == 3213)
  {
    uint64_t v17 = 1;
  }
  else
  {
    uint64_t v17 = 0;
    ++*(void *)(*(void *)(a1 + 32) + 8);
  }
  id v24 = *(__int16 **)(a1 + 32);
  if (*(void *)(a1 + 80) >= (unint64_t)v24[12]) {
    uint64_t v25 = v24[12];
  }
  else {
    uint64_t v25 = *(void *)(a1 + 80);
  }
  id v30 = [v24 foundItemHandler];
  v30[2](v30, v17, v25, a2, a3);
}

- (id)copyCSSearchableItemWithValues:(id *)a3 valueCount:(unint64_t)a4 attrKeys:(unint64_t *)a5 protectionClass:(id)a6 mappingStrategy:(id)a7 attrInfo:(signed __int16 *)a8 requestedAttributeCount:(unint64_t)a9 unpackInfo:(CSUnpackInfo)a10 userFSDomain:(id)a11
{
  unint64_t v14 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  BOOL v16 = (char *)&v38 - ((8 * a4 + 23) & 0xFFFFFFFFFFFFFFF0);
  size_t v17 = 8 * a4 + 8;
  bzero(v16, v17);
  bzero(v16, v17);
  if (a10.var0 < 0 || a10.var0 >= v14) {
    return 0;
  }
  id v18 = a3[a10.var0];
  id v19 = (id)*MEMORY[0x1E4F1D260];
  if (!v18 || v18 == v19) {
    return 0;
  }
  id v39 = a6;
  id v44 = a11;
  if ((uint64_t)(v14 - 1) >= 0)
  {
    uint64_t v23 = *(void *)&a10.var0 >> 16;
    v41 = 0;
    uint64_t v42 = a10.var4 + 1;
    unint64_t v45 = a9;
    id v46 = 0;
    uint64_t v40 = a10.var0 + 1;
    id v24 = a3 - 1;
    uint64_t v25 = a5 - 1;
    uint64_t v43 = (*(uint64_t *)&a10.var0 >> 48) + 1;
    while (1)
    {
      uint64_t v26 = v14 - 1;
      id v27 = v24[v14];
      if (v27) {
        BOOL v28 = v27 == v19;
      }
      else {
        BOOL v28 = 1;
      }
      if (v28) {
        goto LABEL_29;
      }
      if (v26 == (__int16)v23)
      {
        id v46 = v27;
        if (v26 >= v45)
        {
          LOWORD(v23) = -1;
          goto LABEL_29;
        }
        v24[v14] = 0;
        LOWORD(v23) = -1;
      }
      else if (((uint64_t)(*(void *)&a10.var0 << 16) >> 48) + 1 == v14 || v43 == v14 || v42 == v14)
      {
        id v27 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v27];
      }
      else
      {
        if (v44 && v40 == v14)
        {
          id v29 = [NSString alloc];
          uint64_t v30 = [v29 initWithFormat:@"%@/%@", v44, v27];
          v41 = v27;
          id v27 = (id)v30;
        }
        v24[v14] = 0;
      }
      *(void *)&v16[8 * v25[v14]] = v27;
LABEL_29:
      --v14;
      if (v26 <= 0) {
        goto LABEL_32;
      }
    }
  }
  id v46 = 0;
  v41 = 0;
LABEL_32:
  id v31 = v39;
  if (v39)
  {
    if (!v44)
    {
      uint64_t v32 = [a7 indexForKey:@"_kMDItemProtectionClass"];
      if (v32 != 0x7FFFFFFFFFFFFFFFLL && !*(void *)&v16[8 * v32]) {
        *(void *)&v16[8 * v32] = v31;
      }
    }
  }
  int64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F1C0F8]) initWithSearchStrategy:a7];
  [v33 _setValues:v16 retain:0];
  BOOL v34 = v41;
  if (v41)
  {
    if ([a7 indexForKey:@"kMDItemFileItemID"] != 0x7FFFFFFFFFFFFFFFLL
      && ![v33 objectForKeyedSubscript:@"kMDItemFileItemID"])
    {
      [v33 setObject:v34 forKeyedSubscript:@"kMDItemFileItemID"];
    }

    if ([a7 indexForKey:@"FPDomainIdentifier"] != 0x7FFFFFFFFFFFFFFFLL
      && ![v33 objectForKeyedSubscript:@"FPDomainIdentifier"])
    {
      [v33 setObject:v31 forKeyedSubscript:@"FPDomainIdentifier"];
    }
    if ([a7 indexForKey:@"FPCapabilities"] != 0x7FFFFFFFFFFFFFFFLL
      && ![v33 objectForKeyedSubscript:@"FPCapabilities"])
    {
      [v33 setObject:&unk_1EDBD6A00 forKeyedSubscript:@"FPCapabilities"];
    }
    if ([a7 indexForKey:@"FPParentFileItemID"] != 0x7FFFFFFFFFFFFFFFLL
      && ![v33 objectForKeyedSubscript:@"FPParentFileItemID"])
    {
      [v33 setObject:@"NSFileProviderRootContainerItemIdentifier" forKeyedSubscript:@"FPParentFileItemID"];
    }
  }
  BOOL v35 = [[CSSearchableItemAttributeSet alloc] initWithKnownKeysDictionary:v33];

  id v21 = [[CSSearchableItem alloc] initWithAttributeSet:v35];
  BOOL v36 = v46;
  if (v46)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v36 length] == 16)
    {
      v37 = (void *)[v36 bytes];
      -[CSSearchableItem setScore:](v21, "setScore:", *v37, v37[1]);
    }
  }

  return v21;
}

- (id)foundItemHandler
{
  return objc_getProperty(self, a2, 272, 1);
}

- (BOOL)addOrUpdateLiveOID:(int64_t)a3 bundleID:(id)a4 identifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_liveItemLock);
  liveIndexBundleIDToIndexItemIDMap = self->_liveIndexBundleIDToIndexItemIDMap;
  if (!liveIndexBundleIDToIndexItemIDMap)
  {
    id v11 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:0];
    id v12 = self->_liveIndexBundleIDToIndexItemIDMap;
    self->_liveIndexBundleIDToIndexItemIDMap = v11;

    uint64_t v13 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:0];
    liveIndexBundleIDToBundleString = self->_liveIndexBundleIDToBundleString;
    self->_liveIndexBundleIDToBundleString = v13;

    liveIndexBundleIDToIndexItemIDMap = self->_liveIndexBundleIDToIndexItemIDMap;
  }
  BOOL v15 = [(NSMapTable *)liveIndexBundleIDToIndexItemIDMap objectForKey:a3 >> 32];
  if (!v15)
  {
    BOOL v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:0];
    [(NSMapTable *)self->_liveIndexBundleIDToIndexItemIDMap setObject:v15 forKey:a3 >> 32];
    [(NSMapTable *)self->_liveIndexBundleIDToBundleString setObject:v8 forKey:a3 >> 32];
  }
  [v15 setObject:v9 forKey:a3];
  os_unfair_lock_unlock(&self->_liveItemLock);

  return 0;
}

- (void)setupFetchAttributesForSearch
{
  __assert_rtn("-[CSSearchQuery setupFetchAttributesForSearch]", "CSSearchQuery.m", 3041, "[_queryContext.fetchAttributes objectAtIndex:(NSUInteger)bvi] == s");
}

- (BOOL)isTopHitQuery
{
  return 0;
}

- (BOOL)live
{
  return [(CSSearchQueryContext *)self->_queryContext live];
}

- (void)setRemovedItemsHandler:(id)a3
{
}

- (void)setGatherEndedHandler:(id)a3
{
}

- (void)setChangedItemsHandler:(id)a3
{
}

void __22__CSSearchQuery_start__block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[56])
  {
    id v16 = [(id)objc_opt_class() _makeQueryErrorWithErrorCode:-2003 description:0 underlyingError:0];
    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:");
  }
  else
  {
    [v2 willStartQuery];
    if (_os_feature_enabled_impl() && [*(id *)(a1 + 32) isTopHitQuery])
    {
      BOOL v3 = logForCSLogCategoryQuery();
      v4 = [*(id *)(a1 + 32) queryContext];
      os_signpost_id_t v5 = [v4 queryID];

      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18D0E3000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "setupTopHitQueryContext", (const char *)&unk_18D1D2AFF, buf, 2u);
      }

      [*(id *)(a1 + 32) setupTopHitQueryContextForClientBundleId:*(void *)(a1 + 40)];
      uint64_t v6 = logForCSLogCategoryQuery();
      uint64_t v7 = [*(id *)(a1 + 32) queryContext];
      os_signpost_id_t v8 = [v7 queryID];

      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18D0E3000, v6, OS_SIGNPOST_INTERVAL_END, v8, "setupTopHitQueryContext", (const char *)&unk_18D1D2AFF, buf, 2u);
      }
    }
    if (isClientPhotosOrPhotosCtl(*(void **)(a1 + 40)))
    {
      id v9 = NSString;
      id v10 = [*(id *)(a1 + 32) queryContext];
      id v11 = [v10 userQuery];
      id v12 = [v9 stringWithFormat:@"(**=\"%@*\"cwdt)", v11];

      v18[0] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      unint64_t v14 = [*(id *)(a1 + 32) queryContext];
      [v14 setRankingQueries:v13];
    }
    [*(id *)(a1 + 32) setupFetchAttributesForSearch];
    BOOL v15 = [*(id *)(a1 + 32) connection];
    [v15 startQuery:*(void *)(a1 + 32) context:*(void *)(*(void *)(a1 + 32) + 152)];
  }
}

- (id)connection
{
  if ([(CSSearchQuery *)self privateIndex])
  {
    BOOL v3 = [(CSSearchQuery *)self privateBundleID];
    v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      os_signpost_id_t v8 = [MEMORY[0x1E4F28B50] mainBundle];
      id v5 = [v8 bundleIdentifier];
    }
    id v9 = CSPrivateSearchConnection;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ([(CSSearchQuery *)self userFSIndex]) {
        +[CSSearchConnection sharedCSUserFSConnection];
      }
      else {
      id v10 = +[CSSearchConnection sharedSearchConnection];
      }
      goto LABEL_16;
    }
    uint64_t v6 = [(CSSearchQuery *)self privateBundleID];
    uint64_t v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F28B50] mainBundle];
      id v5 = [v11 bundleIdentifier];
    }
    id v9 = CSManagedSearchConnection;
  }
  id v10 = [(__objc2_class *)v9 connectionWithToken:v5];

LABEL_16:

  return v10;
}

- (BOOL)userFSIndex
{
  return self->_userFSIndex;
}

- (BOOL)privateIndex
{
  return self->_privateIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateBundleID, 0);
  objc_storeStrong(&self->_restartGatherEndedHandler, 0);
  objc_storeStrong(&self->_restartedHandler, 0);
  objc_storeStrong(&self->_interruptedHandler, 0);
  objc_storeStrong(&self->_foundItemHandler, 0);
  objc_storeStrong(&self->_completionScoresHandler, 0);
  objc_storeStrong(&self->_completionsHandler, 0);
  objc_storeStrong(&self->_resolvedAttributeNamesHandler, 0);
  objc_storeStrong(&self->_countChangedHandler, 0);
  objc_storeStrong(&self->_photosComputedAttributesHandler, 0);
  objc_storeStrong(&self->_changedAttributesHandler, 0);
  objc_storeStrong(&self->_foundAttributesHandler, 0);
  objc_storeStrong(&self->_removedItemsHandler, 0);
  objc_storeStrong(&self->_changedItemsHandler, 0);
  objc_storeStrong(&self->_priorityGatherEndedHandler, 0);
  objc_storeStrong(&self->_gatherEndedHandler, 0);
  objc_storeStrong((id *)&self->_liveIndexUserFSOIDTOIdentifierMap, 0);
  objc_storeStrong((id *)&self->_liveIndexBundleIDToBundleString, 0);
  objc_storeStrong((id *)&self->_liveIndexBundleIDToIndexItemIDMap, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_foundItemsHandler, 0);
  objc_storeStrong((id *)&self->_megadomeCountingQuerySearchTo, 0);
  objc_storeStrong((id *)&self->_megadomeCountingQuerySearchFrom, 0);
  objc_storeStrong((id *)&self->_suggestionCountDispatchGroup, 0);
  objc_storeStrong((id *)&self->_suggestionCountQueries, 0);
  objc_storeStrong((id *)&self->_mappingStrategy, 0);

  objc_storeStrong((id *)&self->_originalAttributes, 0);
}

- (void)dealloc
{
  free(self->_attrKeys);
  v3.receiver = self;
  v3.super_class = (Class)CSSearchQuery;
  [(CSSearchQuery *)&v3 dealloc];
}

uint64_t __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_4();
  }

  int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
  v4 = logForCSLogCategoryQuery();
  id v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 72);
      uint64_t v8 = *(void *)(a1 + 80);
      int v38 = 134218240;
      uint64_t v39 = v7;
      __int16 v40 = 1024;
      int v41 = v8;
      _os_log_impl(&dword_18D0E3000, v5, OS_LOG_TYPE_INFO, "qid=%ld - Results type: %d ", (uint8_t *)&v38, 0x12u);
    }

    uint64_t v9 = 0;
    switch(*(void *)(a1 + 80))
    {
      case 0:
        goto LABEL_39;
      case 1:
        if (_os_feature_enabled_impl() && [*(id *)(a1 + 32) isTopHitQuery])
        {
          id v10 = logForCSLogCategoryQuery();
          id v11 = v10;
          os_signpost_id_t v12 = *(void *)(a1 + 72);
          if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            LOWORD(v38) = 0;
            _os_signpost_emit_with_name_impl(&dword_18D0E3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "finishTopHitRanking", (const char *)&unk_18D1D2AFF, (uint8_t *)&v38, 2u);
          }

          [*(id *)(a1 + 32) finishTopHitRanking];
          uint64_t v13 = logForCSLogCategoryQuery();
          unint64_t v14 = v13;
          os_signpost_id_t v15 = *(void *)(a1 + 72);
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
          {
            LOWORD(v38) = 0;
            _os_signpost_emit_with_name_impl(&dword_18D0E3000, v14, OS_SIGNPOST_INTERVAL_END, v15, "finishTopHitRanking", (const char *)&unk_18D1D2AFF, (uint8_t *)&v38, 2u);
          }
        }
        [*(id *)(a1 + 32) _finishWithError:0];
        goto LABEL_7;
      case 2:
        if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", @"Priority", 0))
        {
          id v16 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = *(void *)(a1 + 72);
            int v38 = 134217984;
            uint64_t v39 = v17;
            _os_log_impl(&dword_18D0E3000, v16, OS_LOG_TYPE_DEFAULT, "qid=%ld - Priority Gather ended", (uint8_t *)&v38, 0xCu);
          }

          uint64_t v18 = [*(id *)(a1 + 32) priorityGatherEndedHandler];
          id v5 = v18;
          if (v18) {
            (*(void (**)(uint64_t))(v18 + 16))(v18);
          }
          goto LABEL_6;
        }
        uint64_t v23 = *(unsigned char **)(a1 + 32);
        if (!v23[57])
        {
          v23[57] = 1;
          id v24 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v25 = *(void *)(a1 + 72);
            int v38 = 134217984;
            uint64_t v39 = v25;
            _os_log_impl(&dword_18D0E3000, v24, OS_LOG_TYPE_DEFAULT, "qid=%ld - Gather ended", (uint8_t *)&v38, 0xCu);
          }

          [*(id *)(a1 + 32) handleGatherEnded];
          uint64_t v23 = *(unsigned char **)(a1 + 32);
        }
        id v5 = [v23 queryContext];
        if ([v5 generateSuggestions])
        {
          uint64_t v26 = logForCSLogCategoryQuery();
          id v27 = [*(id *)(a1 + 32) queryContext];
          os_signpost_id_t v28 = [v27 queryID];

          if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
          {
            LOWORD(v38) = 0;
            _os_signpost_emit_with_name_impl(&dword_18D0E3000, v26, OS_SIGNPOST_INTERVAL_END, v28, "CSUserQuerySuggestions", " enableTelemetry=YES ", (uint8_t *)&v38, 2u);
          }
          goto LABEL_76;
        }
        uint64_t v26 = [*(id *)(a1 + 32) queryContext];
        if ([v26 rankingType] == 1)
        {
          id v29 = logForCSLogCategoryQuery();
          uint64_t v30 = [*(id *)(a1 + 32) queryContext];
          os_signpost_id_t v31 = [v30 queryID];

          if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            LOWORD(v38) = 0;
            _os_signpost_emit_with_name_impl(&dword_18D0E3000, v29, OS_SIGNPOST_INTERVAL_END, v31, "CSUserQueryTopHits", " enableTelemetry=YES ", (uint8_t *)&v38, 2u);
          }
          goto LABEL_75;
        }
        id v29 = [*(id *)(a1 + 32) queryContext];
        int v32 = [v29 counting];
        int64_t v33 = logForCSLogCategoryQuery();
        BOOL v34 = [*(id *)(a1 + 32) queryContext];
        os_signpost_id_t v35 = [v34 queryID];

        if (v32)
        {
          if (v35 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v33)) {
            goto LABEL_74;
          }
          LOWORD(v38) = 0;
          BOOL v36 = "CSUserQueryCounting";
        }
        else
        {
          if (v35 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v33)) {
            goto LABEL_74;
          }
          LOWORD(v38) = 0;
          BOOL v36 = "CSUserQuery";
        }
        _os_signpost_emit_with_name_impl(&dword_18D0E3000, v33, OS_SIGNPOST_INTERVAL_END, v35, v36, " enableTelemetry=YES ", (uint8_t *)&v38, 2u);
LABEL_74:

LABEL_75:
LABEL_76:

        goto LABEL_6;
      case 5:
        if (!*(unsigned char *)(a1 + 89)) {
          goto LABEL_7;
        }
        if ([*(id *)(a1 + 40) length] != 8) {
          goto LABEL_7;
        }
        uint64_t v20 = *(void *)[*(id *)(a1 + 40) bytes];
        if (!v20) {
          goto LABEL_7;
        }
        id v21 = *(id *)(a1 + 32);
        objc_sync_enter(v21);
        *(void *)(*(void *)(a1 + 32) + 8) += v20;
        objc_sync_exit(v21);

        uint64_t v22 = [*(id *)(a1 + 32) countChangedHandler];
        id v19 = v22;
        if (v22) {
          (*(void (**)(uint64_t, uint64_t))(v22 + 16))(v22, v20);
        }
LABEL_30:

        goto LABEL_7;
      case 6:
        if (*(unsigned char *)(a1 + 88) || *(unsigned char *)(a1 + 90))
        {
          uint64_t v9 = 1;
LABEL_39:
          if (!*(unsigned char *)(a1 + 89))
          {
            if (*(unsigned char *)(a1 + 88))
            {
              [*(id *)(a1 + 32) processAttributesData:*(void *)(a1 + 40) update:v9 protectionClass:*(void *)(a1 + 48)];
            }
            else if (*(unsigned char *)(a1 + 90))
            {
              [*(id *)(a1 + 32) processLiveResultsData:*(void *)(a1 + 40) oidData:*(void *)(a1 + 56) protectionClass:*(void *)(a1 + 48)];
            }
            else
            {
              v37 = logForCSLogCategoryQuery();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
                __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_2();
              }

              [*(id *)(a1 + 32) processResultsData:*(void *)(a1 + 40) protectionClass:*(void *)(a1 + 48)];
            }
          }
        }
        goto LABEL_7;
      case 7:
        if (*(unsigned char *)(a1 + 90) && !*(unsigned char *)(a1 + 88) && !*(unsigned char *)(a1 + 89)) {
          [*(id *)(a1 + 32) processRemoveResultsData:*(void *)(a1 + 56) protectionClass:*(void *)(a1 + 48)];
        }
        goto LABEL_7;
      case 8:
        [*(id *)(a1 + 32) processCompletionsResultsData:*(void *)(a1 + 40) protectionClass:*(void *)(a1 + 48)];
        goto LABEL_7;
      case 0xALL:
        [*(id *)(a1 + 32) handleQueryRewritten];
        goto LABEL_7;
      case 0xBLL:
        [*(id *)(a1 + 32) processPhotosComputedData:*(void *)(a1 + 40) protectionClass:*(void *)(a1 + 48)];
        goto LABEL_7;
      default:
        id v19 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_1();
        }
        goto LABEL_30;
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_3();
  }
LABEL_6:

LABEL_7:
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_finishWithError:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_finished) {
    goto LABEL_27;
  }
  BOOL v5 = [(CSSearchQueryContext *)self->_queryContext live];
  BOOL cancelled = self->_cancelled;
  int64_t v7 = [(CSSearchQueryContext *)self->_queryContext queryID];
  self->_finished = 1;
  if (cancelled || v5)
  {
    uint64_t v8 = +[CSSearchConnection sharedSearchConnection];
    uint64_t v9 = [NSNumber numberWithInteger:v7];
    id v10 = (id)[v8 removeQueryForID:v9];
  }
  if (_os_feature_enabled_impl() && [(CSSearchQuery *)self isTopHitQuery]) {
    [(CSSearchQuery *)self deactivate];
  }
  id v11 = v4;
  os_signpost_id_t v12 = v11;
  if (!v11)
  {
    os_signpost_id_t v15 = 0;
LABEL_16:
    id v16 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v29 = v7;
      _os_log_impl(&dword_18D0E3000, v16, OS_LOG_TYPE_DEFAULT, "qid=%ld - Finished", buf, 0xCu);
    }
    goto LABEL_18;
  }
  uint64_t v13 = [v11 domain];
  char v14 = [v13 isEqualToString:@"CSSearchQueryErrorDomain"];

  os_signpost_id_t v15 = v12;
  if ((v14 & 1) == 0)
  {
    os_signpost_id_t v15 = [(id)objc_opt_class() _makeQueryErrorWithErrorCode:-2000 description:0 underlyingError:v12];
  }
  if (cancelled || !v15) {
    goto LABEL_16;
  }
  id v16 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[CSSearchQuery _finishWithError:]();
  }
LABEL_18:

  uint64_t v17 = +[CSPowerLog sharedInstance];
  uint64_t v18 = sMainBundleId;
  unint64_t foundItemCount = self->_foundItemCount;
  uint64_t v20 = [(CSSearchQueryContext *)self->_queryContext reason];
  if (v20)
  {
    [v17 logWithBundleID:v18 indexOperation:5 itemCount:foundItemCount reason:v20];
  }
  else
  {
    id v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    [v17 logWithBundleID:v18 indexOperation:5 itemCount:foundItemCount reason:v22];
  }
  if (self->_suggestionCountDispatchGroup)
  {
    uint64_t v23 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v29 = v7;
      _os_log_impl(&dword_18D0E3000, v23, OS_LOG_TYPE_DEFAULT, "qid=%ld - wait for suggestion count", buf, 0xCu);
    }

    suggestionCountDispatchGroup = self->_suggestionCountDispatchGroup;
    queue = self->_queue;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __34__CSSearchQuery__finishWithError___block_invoke;
    v26[3] = &unk_1E5548FE0;
    v26[4] = self;
    id v27 = v12;
    dispatch_group_notify(suggestionCountDispatchGroup, queue, v26);
  }
  else
  {
    [(CSSearchQuery *)self handleCompletion:v12];
  }

LABEL_27:
}

- (void)start
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_started)
  {
    objc_sync_exit(v2);

    int v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"The query was already started" userInfo:0];
    [v3 raise];
  }
  else
  {
    v2->_started = 1;
    objc_sync_exit(v2);
    int v3 = v2;
  }

  [(CSSearchQuery *)v2 prepareSearch];
  qos_class_t v4 = qos_class_self();
  if ([(CSSearchQueryContext *)v2->_queryContext qos]) {
    qos_class_t v4 = [(CSSearchQueryContext *)v2->_queryContext qos];
  }
  BOOL v5 = [(CSSearchQuery *)v2 queryContext];
  int v6 = [v5 internal];

  int64_t v7 = [(CSSearchQuery *)v2 queryContext];
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 bundleIDs];

    if ([v9 count] == 1)
    {
      id v10 = [v9 firstObject];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = [v7 clientBundleID];
    uint64_t v9 = v8;
  }

  queue = v2->_queue;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __22__CSSearchQuery_start__block_invoke;
  uint64_t v22 = &unk_1E5548FE0;
  uint64_t v23 = v2;
  id v12 = v10;
  id v24 = v12;
  dispatch_block_t v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, &v19);
  dispatch_async(queue, v13);

  char v14 = +[CSPowerLog sharedInstance];
  uint64_t v15 = sMainBundleId;
  id v16 = [(CSSearchQueryContext *)v2->_queryContext reason];
  if (v16)
  {
    [v14 logWithBundleID:v15 indexOperation:3 itemCount:1 reason:v16];
  }
  else
  {
    uint64_t v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    [v14 logWithBundleID:v15 indexOperation:3 itemCount:1 reason:v18];
  }
}

- (void)handleCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSSearchQuery *)self completionHandler];
  int v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
    int64_t v7 = [(CSSearchQuery *)self completionHandler];

    if (v7 == v6) {
      [(CSSearchQuery *)self setCompletionHandler:0];
    }
  }
  [(CSSearchQuery *)self setFoundItemsHandler:0];
  if (!self->_gatherEnded)
  {
    uint64_t v8 = [(CSSearchQuery *)self queryContext];
    if ([v8 generateSuggestions])
    {
      uint64_t v9 = logForCSLogCategoryQuery();
      id v10 = [(CSSearchQuery *)self queryContext];
      os_signpost_id_t v11 = [v10 queryID];

      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18D0E3000, v9, OS_SIGNPOST_INTERVAL_END, v11, "CSUserQuerySuggestions", " enableTelemetry=YES ", buf, 2u);
      }
      goto LABEL_23;
    }
    uint64_t v9 = [(CSSearchQuery *)self queryContext];
    if ([v9 rankingType] == 1)
    {
      id v12 = logForCSLogCategoryQuery();
      dispatch_block_t v13 = [(CSSearchQuery *)self queryContext];
      os_signpost_id_t v14 = [v13 queryID];

      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_signpost_emit_with_name_impl(&dword_18D0E3000, v12, OS_SIGNPOST_INTERVAL_END, v14, "CSUserQueryTopHits", " enableTelemetry=YES ", v23, 2u);
      }
      goto LABEL_22;
    }
    id v12 = [(CSSearchQuery *)self queryContext];
    int v15 = [v12 counting];
    id v16 = logForCSLogCategoryQuery();
    uint64_t v17 = [(CSSearchQuery *)self queryContext];
    os_signpost_id_t v18 = [v17 queryID];

    if (v15)
    {
      if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16)) {
        goto LABEL_21;
      }
      __int16 v22 = 0;
      uint64_t v19 = "CSUserQueryCounting";
      uint64_t v20 = (uint8_t *)&v22;
    }
    else
    {
      if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16)) {
        goto LABEL_21;
      }
      __int16 v21 = 0;
      uint64_t v19 = "CSUserQuery";
      uint64_t v20 = (uint8_t *)&v21;
    }
    _os_signpost_emit_with_name_impl(&dword_18D0E3000, v16, OS_SIGNPOST_INTERVAL_END, v18, v19, " enableTelemetry=YES ", v20, 2u);
LABEL_21:

LABEL_22:
LABEL_23:
  }
}

- (void)completionHandler
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setFoundItemsHandler:(void *)foundItemsHandler
{
}

- (void)setCompletionHandler:(void *)completionHandler
{
}

- (void)willStartQuery
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = [(CSSearchQuery *)self queryContext];
  if (![v4 generateSuggestions])
  {
    uint64_t v5 = [(CSSearchQuery *)self queryContext];
    if ([v5 rankingType] == 1)
    {
      int v15 = logForCSLogCategoryQuery();
      id v16 = [(CSSearchQuery *)self queryContext];
      os_signpost_id_t v17 = [v16 queryID];

      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        os_signpost_id_t v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        id v51 = objc_claimAutoreleasedReturnValue();
        uint64_t v48 = [v51 UTF8String];
        uint64_t v19 = [(CSSearchQuery *)self queryContext];
        uint64_t v20 = [v19 queryID];
        __int16 v21 = [(CSSearchQuery *)self queryContext];
        __int16 v22 = [v21 clientBundleID];
        if (v22)
        {
          id v44 = [(CSSearchQuery *)self queryContext];
          id v2 = [v44 clientBundleID];
          uint64_t v23 = (const char *)[v2 UTF8String];
        }
        else
        {
          uint64_t v23 = "Unknown";
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v54 = v48;
        __int16 v55 = 2048;
        uint64_t v56 = v20;
        __int16 v57 = 2080;
        v58 = v23;
        _os_signpost_emit_with_name_impl(&dword_18D0E3000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CSUserQueryTopHits", "QueryClass=%{signpost.description:attribute}s, qid=%{signpost.description:attribute}lu, BundleID=%{signpost.description:attribute}s", buf, 0x20u);
        if (v22)
        {
        }
      }
      goto LABEL_36;
    }
    int v15 = [(CSSearchQuery *)self queryContext];
    int v24 = [v15 counting];
    uint64_t v25 = logForCSLogCategoryQuery();
    id v26 = [(CSSearchQuery *)self queryContext];
    os_signpost_id_t v27 = [v26 queryID];

    if (v24)
    {
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        os_signpost_id_t v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        id v52 = objc_claimAutoreleasedReturnValue();
        uint64_t v45 = [v52 UTF8String];
        v49 = [(CSSearchQuery *)self queryContext];
        uint64_t v29 = [v49 queryID];
        uint64_t v30 = [(CSSearchQuery *)self queryContext];
        os_signpost_id_t v31 = [v30 clientBundleID];
        if (v31)
        {
          uint64_t v43 = [(CSSearchQuery *)self queryContext];
          id v26 = [v43 clientBundleID];
          int v32 = (const char *)[v26 UTF8String];
        }
        else
        {
          int v32 = "Unknown";
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v54 = v45;
        __int16 v55 = 2048;
        uint64_t v56 = v29;
        __int16 v57 = 2080;
        v58 = v32;
        BOOL v36 = "CSUserQueryCounting";
LABEL_32:
        _os_signpost_emit_with_name_impl(&dword_18D0E3000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, v36, "QueryClass=%{signpost.description:attribute}s, qid=%{signpost.description:attribute}lu, BundleID=%{signpost.description:attribute}s", buf, 0x20u);
        if (v31)
        {
        }
      }
    }
    else if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      int64_t v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      id v52 = objc_claimAutoreleasedReturnValue();
      uint64_t v46 = [v52 UTF8String];
      v49 = [(CSSearchQuery *)self queryContext];
      uint64_t v34 = [v49 queryID];
      uint64_t v30 = [(CSSearchQuery *)self queryContext];
      os_signpost_id_t v31 = [v30 clientBundleID];
      if (v31)
      {
        uint64_t v43 = [(CSSearchQuery *)self queryContext];
        id v26 = [v43 clientBundleID];
        os_signpost_id_t v35 = (const char *)[v26 UTF8String];
      }
      else
      {
        os_signpost_id_t v35 = "Unknown";
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v54 = v46;
      __int16 v55 = 2048;
      uint64_t v56 = v34;
      __int16 v57 = 2080;
      v58 = v35;
      BOOL v36 = "CSUserQuery";
      goto LABEL_32;
    }

LABEL_36:
    goto LABEL_37;
  }
  uint64_t v5 = logForCSLogCategoryQuery();
  id v6 = [(CSSearchQuery *)self queryContext];
  os_signpost_id_t v7 = [v6 queryID];

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v50 = objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v50 UTF8String];
    id v10 = [(CSSearchQuery *)self queryContext];
    uint64_t v11 = [v10 queryID];
    id v12 = [(CSSearchQuery *)self queryContext];
    dispatch_block_t v13 = [v12 clientBundleID];
    if (v13)
    {
      uint64_t v47 = [(CSSearchQuery *)self queryContext];
      id v6 = [v47 clientBundleID];
      os_signpost_id_t v14 = (const char *)[v6 UTF8String];
    }
    else
    {
      os_signpost_id_t v14 = "Unknown";
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v54 = v9;
    __int16 v55 = 2048;
    uint64_t v56 = v11;
    __int16 v57 = 2080;
    v58 = v14;
    _os_signpost_emit_with_name_impl(&dword_18D0E3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CSUserQuerySuggestions", "QueryClass=%{signpost.description:attribute}s, qid=%{signpost.description:attribute}lu, BundleID=%{signpost.description:attribute}s", buf, 0x20u);
    if (v13)
    {
    }
  }
LABEL_37:

  if (self->_requireQueryParse)
  {
    v37 = [(CSSearchQuery *)self queryContext];
    int v38 = [v37 userQuery];

    uint64_t v39 = GetCSUserQueryParser();
    __int16 v40 = [(CSSearchQuery *)self queryContext];
    int v41 = objc_msgSend(v39, "_CSQueryCreateQueryDictionaryWithOptionsDict:attribute:input:options:", &unk_1EDBD6B60, 0, v38, objc_msgSend(v40, "userQueryOptions"));

    uint64_t v42 = [v41 objectForKeyedSubscript:@"kMDUserQueryDictionaryQueryDefaultStringKey"];
    if (v42) {
      [(CSSearchQuery *)self updateQueryString:v42];
    }
  }
}

- (CSSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- (void)handleGatherEnded
{
  id v2 = [(CSSearchQuery *)self gatherEndedHandler];
  if (v2)
  {
    int v3 = v2;
    v2[2]();
    id v2 = v3;
  }
}

- (id)gatherEndedHandler
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)processResultsData:(id)a3 protectionClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  [v8 bytes];
  [v8 length];

  id Trusted = (id)_MDPlistBytesCreateTrusted();
  id v9 = [(CSSearchQuery *)self copyResultsFromPlist:Trusted protectionClass:v7];

  [(CSSearchQuery *)self processResultItems:v9];
}

- (void)processResultItems:(id)a3
{
  uint64_t v186 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v163 = self;
  uint64_t v5 = [(CSSearchQuery *)self queryContext];
  if ([v5 generateSuggestions])
  {
    uint64_t v6 = [v4 count];

    if (!v6) {
      goto LABEL_118;
    }
  }
  else
  {
    id v7 = [(CSSearchQuery *)v163 queryContext];
    if (([v7 enableInstantAnswers] & 1) == 0)
    {

      goto LABEL_118;
    }
    uint64_t v8 = [v4 count];

    if (!v8) {
      goto LABEL_118;
    }
  }
  id v154 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v146 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v152 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v149 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v10 = [(CSSearchQuery *)v163 queryContext];
  uint64_t v11 = [v10 bundleIDs];
  uint64_t v12 = [v11 count];
  dispatch_block_t v13 = [(CSSearchQuery *)v163 queryContext];
  os_signpost_id_t v14 = [v13 additionalBundleIDs];
  v155 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v14, "count") + v12);

  int v15 = [(CSSearchQuery *)v163 queryContext];
  id v16 = [v15 bundleIDs];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    os_signpost_id_t v18 = [(CSSearchQuery *)v163 queryContext];
    uint64_t v19 = [v18 bundleIDs];
    [v155 addObjectsFromArray:v19];
  }
  uint64_t v20 = [(CSSearchQuery *)v163 queryContext];
  __int16 v21 = [v20 additionalBundleIDs];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    uint64_t v23 = [(CSSearchQuery *)v163 queryContext];
    int v24 = [v23 additionalBundleIDs];
    [v155 addObjectsFromArray:v24];
  }
  uint64_t v25 = [(CSSearchQuery *)v163 queryContext];
  v158 = [v25 clientBundleID];

  unsigned int v153 = 0;
  if (_os_feature_enabled_impl() && v158)
  {
    if (([v158 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
      || ([v158 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
    {
      unsigned int v153 = 1;
    }
    else if (([v158 isEqualToString:@"com.apple.corespotlight.InternalTestsHost"] & 1) != 0 {
           || [v158 hasPrefix:@"com.apple.SpotlightUITests"])
    }
    {
      unsigned int v153 = [v155 containsObject:@"com.apple.omniSearch"];
    }
    else
    {
      unsigned int v153 = 0;
    }
  }
  *(void *)v182 = 0;
  *(void *)&v182[8] = v182;
  *(void *)&v182[16] = 0x3032000000;
  v183 = __Block_byref_object_copy__9;
  v184 = __Block_byref_object_dispose__9;
  id v185 = 0;
  id v185 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  obuint64_t j = v4;
  uint64_t v26 = [obj countByEnumeratingWithState:&v172 objects:v181 count:16];
  if (v26)
  {
    id v27 = v154;
    if (!v153) {
      id v27 = v146;
    }
    v151 = v27;
    uint64_t v160 = *(void *)v173;
    do
    {
      id v161 = (id)v26;
      for (i = 0; i != v161; i = (char *)i + 1)
      {
        if (*(void *)v173 != v160) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void **)(*((void *)&v172 + 1) + 8 * i);
        uint64_t v30 = [v29 bundleID];
        int v31 = [v30 isEqualToString:@"com.apple.spotlight.contacts"];

        if (!v31)
        {
          int64_t v33 = [v29 bundleID];
          int v34 = [v33 isEqualToString:@"com.apple.spotlight.events"];

          if (!v34)
          {
            [v154 addObject:v29];
            continue;
          }
          os_signpost_id_t v35 = [v29 domainIdentifier];
          if (v35)
          {
            v156 = [v29 domainIdentifier];
            if ([v155 containsObject:v156])
            {

LABEL_62:
              id v52 = [v29 attributeSet];
              v53 = [v52 eventType];
              int v54 = [v53 isEqualToString:@"flight"];

              if (v54)
              {
                __int16 v55 = logForCSLogCategoryDefault();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
                  v148 = [v29 attributeSet];
                  v147 = [v148 flightCarrierCode];
                  CSRedactString(v147, 1);
                  id v150 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v56 = [v29 attributeSet];
                  __int16 v57 = [v56 flightNumber];
                  CSRedactString(v57, 1);
                  id v58 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v59 = [v29 attributeSet];
                  v60 = [v59 flightDepartureDateTime];
                  v61 = [v60 description];
                  CSRedactString(v61, 1);
                  v62 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v150;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v58;
                  *(_WORD *)&buf[22] = 2112;
                  v178 = v62;
                  _os_log_impl(&dword_18D0E3000, v55, OS_LOG_TYPE_INFO, "[instant answers][retrival]: Found flight event with number: %@%@ and departureTime: %@", buf, 0x20u);
                }
                v63 = logForCSLogCategoryDefault();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                {
                  v64 = [v29 attributeSet];
                  v65 = [v64 flightCarrierCode];
                  v66 = [v29 attributeSet];
                  v67 = [v66 flightNumber];
                  v68 = [v29 attributeSet];
                  v69 = [v68 flightDepartureDateTime];
                  v70 = [v69 description];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v65;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v67;
                  *(_WORD *)&buf[22] = 2112;
                  v178 = v70;
                  _os_log_debug_impl(&dword_18D0E3000, v63, OS_LOG_TYPE_DEBUG, "[debug][instant answers][retrival]: Found flight event with number: %@%@ and departureTime: %@", buf, 0x20u);
                }
              }
              else
              {
                v71 = [v29 attributeSet];
                v72 = [v71 eventType];
                int v73 = [v72 isEqualToString:@"hotel"];

                if (v73)
                {
                  v74 = logForCSLogCategoryDefault();
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                  {
                    v75 = [v29 attributeSet];
                    v76 = [v75 hotelReservationId];
                    CSRedactString(v76, 1);
                    id v77 = (id)objc_claimAutoreleasedReturnValue();
                    v78 = [v29 attributeSet];
                    v79 = [v78 startDate];
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v77;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v79;
                    _os_log_impl(&dword_18D0E3000, v74, OS_LOG_TYPE_INFO, "[instant answers][retrival]: Found hotel event with reservationId: %@, startDate: %@", buf, 0x16u);
                  }
                  v63 = logForCSLogCategoryDefault();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                  {
                    v80 = [v29 attributeSet];
                    v81 = [v80 hotelReservationId];
                    v82 = [v29 attributeSet];
                    v83 = [v82 startDate];
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v81;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v83;
                    _os_log_debug_impl(&dword_18D0E3000, v63, OS_LOG_TYPE_DEBUG, "[debug][instant answers][retrival]: Found hotel event with reservationId: %@, startDate: %@", buf, 0x16u);
                  }
                }
                else
                {
                  v84 = [v29 attributeSet];
                  v85 = [v84 eventType];
                  int v86 = [v85 isEqualToString:@"restaurant"];

                  if (v86)
                  {
                    v87 = logForCSLogCategoryDefault();
                    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
                    {
                      v88 = [v29 attributeSet];
                      v89 = [v88 restaurantReservationId];
                      CSRedactString(v89, 1);
                      id v90 = (id)objc_claimAutoreleasedReturnValue();
                      v91 = [v29 attributeSet];
                      v92 = [v91 startDate];
                      *(_DWORD *)buf = 138412546;
                      *(void *)&uint8_t buf[4] = v90;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v92;
                      _os_log_impl(&dword_18D0E3000, v87, OS_LOG_TYPE_INFO, "[instant answers][retrival]: Found restaurant event with reservationId: %@, startDate: %@", buf, 0x16u);
                    }
                    v63 = logForCSLogCategoryDefault();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                    {
                      v93 = [v29 attributeSet];
                      v94 = [v93 restaurantReservationId];
                      v95 = [v29 attributeSet];
                      v96 = [v95 startDate];
                      *(_DWORD *)buf = 138412546;
                      *(void *)&uint8_t buf[4] = v94;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v96;
                      _os_log_debug_impl(&dword_18D0E3000, v63, OS_LOG_TYPE_DEBUG, "[debug][instant answers][retrival]: Found restaurant event with reservationId: %@, startDate: %@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    v63 = logForCSLogCategoryDefault();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                    {
                      v97 = [v29 attributeSet];
                      v98 = [v97 eventType];
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v98;
                      _os_log_impl(&dword_18D0E3000, v63, OS_LOG_TYPE_INFO, "[instant answers][retrival]: Found unknown event of type %@", buf, 0xCu);
                    }
                  }
                }
              }

              [v151 addObject:v29];
              continue;
            }
            if (!v158)
            {

              if ((v153 & 1) == 0) {
                continue;
              }
              goto LABEL_62;
            }
LABEL_53:
            id v50 = [v29 uniqueIdentifier];
            int v51 = [v50 hasSuffix:v158];

            int v49 = v51 | v153;
            if (v35)
            {

              if ((v49 & 1) == 0) {
                continue;
              }
              goto LABEL_62;
            }
          }
          else
          {
            int v49 = v153;
            if (v158) {
              goto LABEL_53;
            }
          }

          if (!v49) {
            continue;
          }
          goto LABEL_62;
        }
        int v32 = [v29 domainIdentifier];
        if (v32)
        {
          v159 = [v29 domainIdentifier];
          if ([v155 containsObject:v159]) {
            goto LABEL_40;
          }
          if (!v158)
          {

            goto LABEL_47;
          }
        }
        else if (!v158)
        {
          continue;
        }
        BOOL v36 = [v29 uniqueIdentifier];
        if ([v36 hasSuffix:v158])
        {

          if (v32) {
LABEL_40:
          }

LABEL_42:
          v37 = [CSSuggestion alloc];
          int v38 = [(CSSearchQuery *)v163 queryContext];
          uint64_t v39 = [v38 userQuery];
          __int16 v40 = [(CSSearchQuery *)v163 queryContext];
          int v41 = [v40 suggestion];
          int v32 = [(CSSuggestion *)v37 initWithUserString:v39 currentSuggestion:v41 itemResult:v29];

          if (v32)
          {
            uint64_t v42 = [(CSSearchQuery *)v163 queryContext];
            -[CSSuggestion setEnableFragments:](v32, "setEnableFragments:", [v42 enableSuggestionTokens]);

            uint64_t v43 = [v29 domainIdentifier];
            if (!v43
              || ([v29 domainIdentifier],
                  id v44 = objc_claimAutoreleasedReturnValue(),
                  char v45 = [v44 isEqualToString:@"com.apple.mobilemail"],
                  v44,
                  v43,
                  uint64_t v46 = v149,
                  (v45 & 1) == 0))
            {
              uint64_t v46 = *(void **)(*(void *)&v182[8] + 40);
            }
            [v46 addObject:v32];
          }
LABEL_47:

          continue;
        }
        uint64_t v47 = [v29 uniqueIdentifier];
        char v48 = [v47 hasPrefix:v158];

        if (v32)
        {
        }
        else
        {
        }
        if (v48) {
          goto LABEL_42;
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v172 objects:v181 count:16];
    }
    while (v26);
  }

  if (_os_feature_enabled_impl() && [v149 count])
  {
    v99 = [(CSSearchQuery *)v163 queryContext];
    v100 = [v99 userQuery];
    BOOL v101 = (unint64_t)[v100 length] < 5;

    v102 = dispatch_semaphore_create(0);
    dispatch_time_t v103 = dispatch_time(0, 400000000);
    v169[0] = MEMORY[0x1E4F143A8];
    v169[1] = 3221225472;
    v169[2] = __36__CSSearchQuery_processResultItems___block_invoke;
    v169[3] = &unk_1E554C660;
    v169[4] = v163;
    v171 = v182;
    v104 = v102;
    v170 = v104;
    [(CSSearchQuery *)v163 filterMegadomePeopleSuggestions:v149 isShortQuery:v101 completionHandler:v169];
    if (dispatch_semaphore_wait(v104, v103))
    {
      v105 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18D0E3000, v105, OS_LOG_TYPE_INFO, "[MegadomeSearch]: Timed out waiting for results at query completion", buf, 2u);
      }
    }
    megadomeCountingQuerySearchFrom = v163->_megadomeCountingQuerySearchFrom;
    if (megadomeCountingQuerySearchFrom) {
      [(_CSMultiQuery *)megadomeCountingQuerySearchFrom cancel];
    }
    megadomeCountingQuerySearchTo = v163->_megadomeCountingQuerySearchTo;
    if (megadomeCountingQuerySearchTo) {
      [(_CSMultiQuery *)megadomeCountingQuerySearchTo cancel];
    }
  }
  v108 = [(CSSearchQuery *)v163 queryContext];
  if ([v108 generateSuggestions])
  {
    uint64_t v109 = [v154 count];
    LOBYTE(v109) = v109 == [obj count];

    if ((v109 & 1) == 0)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v178 = __Block_byref_object_copy__9;
      v179 = __Block_byref_object_dispose__9;
      id v180 = 0;
      id v180 = *(id *)(*(void *)&v182[8] + 40);
      v110 = [(CSSearchQuery *)v163 queryContext];
      int v111 = [v110 pommesZKW];

      if (v111)
      {
        uint64_t v112 = *(void *)(*(void *)&v182[8] + 40);
        v168[0] = MEMORY[0x1E4F143A8];
        v168[1] = 3221225472;
        v168[2] = __36__CSSearchQuery_processResultItems___block_invoke_1070;
        v168[3] = &unk_1E55483C0;
        v168[4] = buf;
        [(CSSearchQuery *)v163 filterZKWPeopleSuggestions:v112 completionHandler:v168];
      }
      [(CSSearchQuery *)v163 processSuggestions:*(void *)(*(void *)&buf[8] + 40)];
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
  }
  v113 = [(CSSearchQuery *)v163 queryContext];
  int v114 = [v113 enableInstantAnswers];

  if (v114)
  {
    v115 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
    {
      uint64_t v116 = [v146 count];
      v117 = [(CSSearchQuery *)v163 queryContext];
      v118 = [v117 userQuery];
      v119 = CSRedactString(v118, 1);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v116;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v119;
      _os_log_impl(&dword_18D0E3000, v115, OS_LOG_TYPE_INFO, "[instant answers][retrival]: foundEvents count = %lu for userQuery = %@", buf, 0x16u);
    }
    v120 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v143 = [v146 count];
      v144 = [(CSSearchQuery *)v163 queryContext];
      v145 = [v144 userQuery];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v143;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v145;
      _os_log_debug_impl(&dword_18D0E3000, v120, OS_LOG_TYPE_DEBUG, "[debug][instant answers][retrival]: foundEvents count = %lu for userQuery = %@", buf, 0x16u);
    }
    if ([v146 count])
    {
      v121 = [(CSSearchQuery *)v163 queryContext];
      v122 = [v121 instantAnswersOverrideDate];
      v123 = +[CSInstantAnswers selectInstantAnswersEventsWithFoundEvents:v146 forDate:v122 isSearchToolQuery:v153];

      long long v166 = 0u;
      long long v167 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      id v162 = v123;
      uint64_t v124 = [v162 countByEnumeratingWithState:&v164 objects:v176 count:16];
      if (v124)
      {
        uint64_t v125 = *(void *)v165;
        do
        {
          for (uint64_t j = 0; j != v124; ++j)
          {
            if (*(void *)v165 != v125) {
              objc_enumerationMutation(v162);
            }
            v127 = *(void **)(*((void *)&v164 + 1) + 8 * j);
            v128 = [(CSSearchQuery *)v163 queryContext];
            v129 = [v128 userQuery];
            v130 = [(CSSearchQuery *)v163 queryContext];
            v131 = [v130 suggestion];
            v132 = [(CSSearchQueryContext *)v163->_queryContext answerAttributes];
            v133 = +[CSSuggestion instantAnswerWithUserString:v129 currentSuggestion:v131 itemResult:v127 answerAttributes:v132];

            v134 = logForCSLogCategoryQuery();
            if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
            {
              v135 = [v127 attributeSet];
              v136 = [v135 eventType];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v136;
              _os_log_impl(&dword_18D0E3000, v134, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected instant answer type %@", buf, 0xCu);
            }
            if (v133) {
              [v152 addObject:v133];
            }
          }
          uint64_t v124 = [v162 countByEnumeratingWithState:&v164 objects:v176 count:16];
        }
        while (v124);
      }

      [(CSSearchQuery *)v163 processInstantAnswer:v152];
    }
  }

  _Block_object_dispose(v182, 8);
  id v4 = v154;
LABEL_118:
  uint64_t v137 = [v4 count];
  if (v137)
  {
    uint64_t v138 = [(CSSearchQueryContext *)v163->_queryContext queryID];
    BOOL v139 = !v163->_cancelled;
    v140 = logForCSLogCategoryQuery();
    v141 = v140;
    if (v139)
    {
      if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v182 = 134218240;
        *(void *)&v182[4] = v138;
        *(_WORD *)&v182[12] = 2048;
        *(void *)&v182[14] = v137;
        _os_log_impl(&dword_18D0E3000, v141, OS_LOG_TYPE_DEFAULT, "qid=%ld - Found: %ld items", v182, 0x16u);
      }

      v142 = v163;
      objc_sync_enter(v142);
      v142->_foundItemCount += v137;
      objc_sync_exit(v142);

      [(CSSearchQuery *)v142 handleFoundItems:v4];
    }
    else
    {
      if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG)) {
        -[CSSearchQuery processResultItems:]();
      }
    }
  }
}

- (void)processLiveResultsData:(id)a3 oidData:(id)a4 protectionClass:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v9 length];
  id v11 = v9;
  [v11 bytes];
  uint64_t v12 = _MDStoreOIDArrayCreate();
  if (v12)
  {
    dispatch_block_t v13 = (const void *)v12;
    uint64_t v48 = 0;
    int v49 = &v48;
    uint64_t v50 = 0x3032000000;
    int v51 = __Block_byref_object_copy__9;
    id v52 = __Block_byref_object_dispose__9;
    id v53 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = &v42;
    uint64_t v44 = 0x3032000000;
    char v45 = __Block_byref_object_copy__9;
    uint64_t v46 = __Block_byref_object_dispose__9;
    id v47 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__9;
    __int16 v40 = __Block_byref_object_dispose__9;
    id v41 = 0;
    int64_t v14 = [(CSSearchQueryContext *)self->_queryContext queryID];
    id v15 = v8;
    [v15 bytes];
    [v15 length];
    id Trusted = (void *)_MDPlistBytesCreateTrusted();
    _MDChildPlistBytesContextCreate();
    int v35 = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    id v17 = Trusted;
    id v33 = v10;
    _MDStoreOIDArrayApplyBlockParallel();
    _MDChildPlistBytesContextDestroy();
    CFRelease(v13);
    uint64_t v18 = [(id)v49[5] count];
    uint64_t v19 = [(id)v43[5] count];
    uint64_t v20 = [(id)v37[5] count];
    if (v18 | v19)
    {
      if (self->_cancelled)
      {
        uint64_t v21 = logForCSLogCategoryQuery();
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG)) {
          -[CSSearchQuery processResultItems:]();
        }
      }
      else
      {
        uint64_t v22 = v20;
        if (v20)
        {
          uint64_t v23 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            int64_t v55 = v14;
            __int16 v56 = 2048;
            uint64_t v57 = v22;
            _os_log_impl(&dword_18D0E3000, v23, OS_LOG_TYPE_DEFAULT, "qid=%ld - moved: %ld items", buf, 0x16u);
          }

          if (self->_userFSIndex)
          {
            int v24 = [(CSSearchQuery *)self removedItemsHandler];
            BOOL v25 = v24 == 0;

            if (!v25)
            {
              uint64_t v26 = [(CSSearchQuery *)self removedItemsHandler];
              v26[2](v26, UserFSBundleID, v37[5]);
            }
          }
        }
        if (v18)
        {
          id v27 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            int64_t v55 = v14;
            __int16 v56 = 2048;
            uint64_t v57 = v18;
            _os_log_impl(&dword_18D0E3000, v27, OS_LOG_TYPE_DEFAULT, "qid=%ld - Found: %ld items", buf, 0x16u);
          }

          os_signpost_id_t v28 = self;
          objc_sync_enter(v28);
          v28->_foundItemCount += v18;
          objc_sync_exit(v28);

          uint64_t v29 = [(CSSearchQuery *)v28 foundItemsHandler];

          if (v29)
          {
            uint64_t v30 = [(CSSearchQuery *)v28 foundItemsHandler];
            v30[2](v30, v49[5]);
          }
        }
        if (!v19) {
          goto LABEL_23;
        }
        int v31 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          int64_t v55 = v14;
          __int16 v56 = 2048;
          uint64_t v57 = v19;
          _os_log_impl(&dword_18D0E3000, v31, OS_LOG_TYPE_DEFAULT, "qid=%ld - Updated: %ld items", buf, 0x16u);
        }

        int v32 = [(CSSearchQuery *)self changedItemsHandler];

        if (!v32) {
          goto LABEL_23;
        }
        uint64_t v21 = [(CSSearchQuery *)self changedItemsHandler];
        (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v21, v43[5]);
      }
    }
LABEL_23:

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v48, 8);
  }
}

- (void)handleFoundItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = logForCSLogCategoryQuery();
  id v7 = [(CSSearchQuery *)self queryContext];
  os_signpost_id_t v8 = [v7 queryID];

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    id v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    id v10 = objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 UTF8String];
    uint64_t v12 = [(CSSearchQuery *)self queryContext];
    dispatch_block_t v13 = [v12 clientBundleID];
    if (v13)
    {
      id v17 = [(CSSearchQuery *)self queryContext];
      id v3 = [v17 clientBundleID];
      int64_t v14 = (const char *)[v3 UTF8String];
    }
    else
    {
      int64_t v14 = "Unknown";
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = v11;
    __int16 v20 = 2080;
    uint64_t v21 = v14;
    __int16 v22 = 2048;
    uint64_t v23 = [v5 count];
    _os_signpost_emit_with_name_impl(&dword_18D0E3000, v6, OS_SIGNPOST_EVENT, v8, "CSUserQuery_FoundItems", "QueryClass=%{signpost.description:attribute}s, BundleID=%{signpost.description:attribute}s, ItemsCount=%{signpost.description:attribute}lu", buf, 0x20u);
    if (v13)
    {
    }
  }

  id v15 = [(CSSearchQuery *)self foundItemsHandler];

  if (v15)
  {
    id v16 = [(CSSearchQuery *)self foundItemsHandler];
    ((void (**)(void, id))v16)[2](v16, v5);
  }
}

- (void)foundItemsHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (id)copyResultsFromPlist:(id)a3 protectionClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = [(CSSearchQuery *)self fetchAttributes];
  uint64_t v9 = [v8 count];
  int64_t v10 = [(CSSearchQueryContext *)self->_queryContext queryID];
  uint64_t v11 = [(CSSearchQuery *)self foundItemHandler];

  if (v11)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke;
    aBlock[3] = &unk_1E554C570;
    aBlock[4] = self;
    aBlock[5] = v9;
    uint64_t v12 = _Block_copy(aBlock);
    [v6 enumerateQueryResults:v9 stringCache:0 usingBlock:v12];

    dispatch_block_t v13 = 0;
  }
  else
  {
    int64_t v37 = v10;
    int v49 = v7;
    signed __int16 v14 = self->_attrInfo[1];
    signed __int16 v43 = self->_attrInfo[10];
    signed __int16 v45 = self->_attrInfo[6];
    signed __int16 v39 = self->_attrInfo[12];
    signed __int16 v41 = self->_attrInfo[11];
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    int v64 = 0;
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    _MDChildPlistBytesContextCreate();
    uint64_t v16 = _MDPlistBytesCopyChildPlistBytesAtIndex();
    if (v16)
    {
      id v17 = (const void *)v16;
      size_t v18 = 0;
      do
      {
        CFArrayAppendValue(Mutable, v17);
        CFRelease(v17);
        ++v18;
        id v17 = (const void *)_MDPlistBytesCopyChildPlistBytesAtIndex();
      }
      while (v17);
    }
    else
    {
      size_t v18 = 0;
    }
    uint64_t v48 = v8;
    _MDChildPlistBytesContextDestroy();
    uint64_t v19 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[CSSearchQuery copyResultsFromPlist:protectionClass:]();
    }
    __int16 v20 = v14 - 1;
    __int16 v21 = v45 - 1;
    __int16 v22 = v43 - 1;
    __int16 v44 = v41 - 1;
    __int16 v46 = v22;
    __int16 v42 = v39 - 1;

    if (self->_userFSIndex)
    {
      uint64_t v23 = v49;
      [v49 dataUsingEncoding:4];
      __int16 v40 = v21;
      v25 = __int16 v24 = v20;
      uint64_t v26 = [v25 base64EncodedStringWithOptions:0];
      id v27 = [@"__fp" stringByAppendingPathComponent:v26];

      __int16 v20 = v24;
      __int16 v21 = v40;
    }
    else
    {
      id v27 = 0;
      uint64_t v23 = v49;
    }
    unint64_t v28 = [(CSSearchQuery *)self dispatchApplyWidth];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_1042;
    block[3] = &unk_1E554C598;
    uint64_t v55 = v9;
    unint64_t v56 = v28;
    block[4] = self;
    id v29 = v23;
    __int16 v59 = v20;
    __int16 v60 = v21;
    __int16 v61 = v46;
    __int16 v62 = v44;
    __int16 v63 = v42;
    id v52 = v29;
    id v53 = v27;
    uint64_t v57 = &v64;
    id v30 = v47;
    id v54 = v30;
    uint64_t v58 = Mutable;
    id v31 = v27;
    dispatch_apply(v18, 0, block);
    CFRelease(Mutable);
    os_signpost_id_t v8 = v48;
    if (_os_feature_enabled_impl() && [(CSSearchQuery *)self isTopHitQuery])
    {
      int v32 = logForCSLogCategoryQuery();
      id v33 = v32;
      if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18D0E3000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v38, "processResultsForTopHitRanking", (const char *)&unk_18D1D2AFF, buf, 2u);
      }

      [(CSSearchQuery *)self processResultsForTopHitRanking:v30 protectionClass:v29];
      int v34 = logForCSLogCategoryQuery();
      int v35 = v34;
      if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18D0E3000, v35, OS_SIGNPOST_INTERVAL_END, v38, "processResultsForTopHitRanking", (const char *)&unk_18D1D2AFF, buf, 2u);
      }
    }
    if (self->_cancelled)
    {

      id v30 = 0;
    }
    id v7 = v49;
    dispatch_block_t v13 = [v30 array];
  }
  return v13;
}

- (unint64_t)dispatchApplyWidth
{
  return 4;
}

- (void)setProtectionClasses:(NSArray *)protectionClasses
{
  if (protectionClasses)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [v6 allObjects];
    [(CSSearchQueryContext *)self->_queryContext setProtectionClasses:v4];
  }
  else
  {
    queryContext = self->_queryContext;
    -[CSSearchQueryContext setProtectionClasses:](queryContext, "setProtectionClasses:");
  }
}

- (void)setBundleIDs:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4 && [v4 count])
  {
    id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    id v6 = [v5 allObjects];
    [(CSSearchQueryContext *)self->_queryContext setBundleIDs:v6];
  }
  else
  {
    [(CSSearchQueryContext *)self->_queryContext setBundleIDs:0];
  }
}

- (CSSearchQuery)initWithQueryString:(NSString *)queryString queryContext:(CSSearchQueryContext *)queryContext
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = queryString;
  id v7 = queryContext;
  os_signpost_id_t v8 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchQuery initWithQueryString:queryContext:]();
  }

  v13.receiver = self;
  v13.super_class = (Class)CSSearchQuery;
  uint64_t v9 = [(CSSearchQuery *)&v13 init];
  if (v9)
  {
    int64_t v10 = v7;
    if (!v10)
    {
      int64_t v10 = objc_alloc_init(CSSearchQueryContext);
      v14[0] = @"kMDItemDisplayName";
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      [(CSSearchQueryContext *)v10 setFetchAttributes:v11];
    }
    [(CSSearchQuery *)v9 commonInitWithQueryString:v6 queryContext:v10];
  }
  return v9;
}

- (CSSearchQuery)initWithQueryString:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchQuery initWithQueryString:queryContext:]();
  }

  if (![v6 length])
  {
    uint64_t v9 = [v7 userQuery];
    if ([v9 length])
    {
      objc_msgSend(v7, "setUserQueryOptions:", objc_msgSend(v7, "userQueryOptions") | 0x1000);
      self->_requireQueryParse = 1;
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CSSearchQuery;
  int64_t v10 = [(CSSearchQuery *)&v13 init];
  uint64_t v11 = v10;
  if (v10) {
    [(CSSearchQuery *)v10 commonInitWithQueryString:v6 queryContext:v7];
  }

  return v11;
}

- (void)commonInitWithQueryString:(id)a3 queryContext:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_storeStrong((id *)&self->_queryString, a3);
  id v8 = a4;
  uint64_t v9 = (void *)[v8 copy];
  [v9 setClientBundleID:sMainBundleId];
  int64_t v10 = [v8 instantAnswersOverrideDate];

  [v9 setInstantAnswersOverrideDate:v10];
  atomic_fetch_add(sCSSearchQueryID, 1u);
  objc_msgSend(v9, "setQueryID:");
  p_queryContext = &self->_queryContext;
  objc_storeStrong((id *)&self->_queryContext, v9);
  uint64_t v12 = [(CSSearchQueryContext *)self->_queryContext mountPoints];
  uint64_t v13 = [v12 count];

  if (v13) {
    self->_userFSIndex = 1;
  }
  BOOL v14 = [(CSSearchQueryContext *)*p_queryContext live];
  if (v14
    && ([(CSSearchQueryContext *)*p_queryContext clientBundleID],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v12 isEqualToString:@"com.apple.mobilemail"]))
  {
  }
  else
  {
    id v15 = [(CSSearchQueryContext *)*p_queryContext clientBundleID];
    int v16 = [v15 isEqualToString:@"com.apple.mobileslideshow"];

    if (v14)
    {

      if ((v16 & 1) == 0) {
        goto LABEL_13;
      }
    }
    else if (!v16)
    {
      goto LABEL_13;
    }
  }
  id v17 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = [(CSSearchQueryContext *)*p_queryContext queryID];
    *(_DWORD *)buf = 67109120;
    int v26 = v18;
    _os_log_impl(&dword_18D0E3000, v17, OS_LOG_TYPE_DEFAULT, "qid=%d is a live query; also disabling blocking on index.",
      buf,
      8u);
  }

  [(CSSearchQueryContext *)*p_queryContext setDisableBlockingOnIndex:1];
LABEL_13:
  self->_liveItemLock._os_unfair_lock_opaque = 0;
  uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.corespotlight.searchQuery.%ld.%p", -[CSSearchQueryContext queryID](self->_queryContext, "queryID"), self);
  if (sQueryPoolQueueOnce != -1) {
    dispatch_once(&sQueryPoolQueueOnce, &__block_literal_global_958);
  }
  id v20 = v19;
  __int16 v21 = (const char *)[v20 UTF8String];
  __int16 v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v23 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v21, v22, (dispatch_queue_t)sQueryPoolQueue);
  queue = self->_queue;
  self->_queue = v23;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_storeStrong((id *)&sConnectionName_0, @"com.apple.spotlight.SearchAgent");
    id v2 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v3 = [v2 bundleIdentifier];
    id v4 = (void *)sMainBundleId;
    sMainBundleId = v3;

    if (!sMainBundleId)
    {
      id v7 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v5 = [v7 processName];
      id v6 = (void *)sMainBundleId;
      sMainBundleId = v5;
    }
  }
}

void __64__CSSearchQuery_processLiveResultsData_oidData_protectionClass___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a5 >= 2)
  {
    obj[5] = v5;
    obj[6] = v6;
    if (a3 == 3213 || a3 == 2781)
    {
      uint64_t v10 = _MDPlistBytesCopyChildPlistBytesAtIndex();
      if (v10)
      {
        uint64_t v11 = (const void *)v10;
        id v26 = 0;
        obj[0] = 0;
        id v25 = 0;
        [*(id *)(a1 + 40) processResultFromPlist:v10 atIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) protectionClass:*(void *)(a1 + 48) oids:a4 oidCount:a5 addItems:obj updateItems:&v26 moveItems:&v25];
        if ([obj[0] count])
        {
          os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 96));
          uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
          id v15 = *(void **)(v12 + 40);
          uint64_t v13 = (id *)(v12 + 40);
          BOOL v14 = v15;
          if (v15) {
            [v14 addObjectsFromArray:obj[0]];
          }
          else {
            objc_storeStrong(v13, obj[0]);
          }
          os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 96));
        }
        if ([v26 count])
        {
          os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 96));
          uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
          id v20 = *(void **)(v17 + 40);
          int v18 = (id *)(v17 + 40);
          uint64_t v19 = v20;
          if (v20) {
            [v19 addObjectsFromArray:v26];
          }
          else {
            objc_storeStrong(v18, v26);
          }
          os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 96));
        }
        if ([v25 count])
        {
          os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 96));
          uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
          __int16 v24 = *(void **)(v21 + 40);
          __int16 v22 = (id *)(v21 + 40);
          uint64_t v23 = v24;
          if (v24) {
            [v23 addObjectsFromArray:v25];
          }
          else {
            objc_storeStrong(v22, v25);
          }
          os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 96));
        }
        CFRelease(v11);
      }
    }
    else
    {
      int v16 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __64__CSSearchQuery_processLiveResultsData_oidData_protectionClass___block_invoke_cold_1();
      }
    }
  }
}

- (void)processResultFromPlist:(id)a3 atIndex:(unint64_t)a4 protectionClass:(id)a5 oids:(int64_t *)a6 oidCount:(unsigned int)a7 addItems:(id *)a8 updateItems:(id *)a9 moveItems:(id *)a10
{
  id v13 = a3;
  id v14 = a5;
  context = (void *)MEMORY[0x192F99810]();
  uint64_t v27 = [(CSSearchQuery *)self fetchAttributes];
  uint64_t v15 = [v27 count];
  id v30 = v13;
  if (self->_userFSIndex)
  {
    int v16 = [v14 dataUsingEncoding:4];
    uint64_t v17 = [v16 base64EncodedStringWithOptions:0];
    int v18 = [@"__fp" stringByAppendingPathComponent:v17];
  }
  else
  {
    int v18 = 0;
  }
  __int16 v19 = self->_attrInfo[1] - 1;
  __int16 v20 = self->_attrInfo[6] - 1;
  __int16 v21 = self->_attrInfo[10] - 1;
  __int16 v22 = self->_attrInfo[11] - 1;
  __int16 v23 = self->_attrInfo[12] - 1;
  __int16 v24 = self->_attrInfo[0] - 1;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __109__CSSearchQuery_processResultFromPlist_atIndex_protectionClass_oids_oidCount_addItems_updateItems_moveItems___block_invoke;
  v31[3] = &unk_1E554C548;
  v31[4] = self;
  int v34 = v47;
  int v35 = a6;
  __int16 v40 = v24;
  __int16 v41 = v19;
  id v25 = v18;
  id v32 = v25;
  uint64_t v36 = a10;
  uint64_t v37 = v15;
  id v26 = v14;
  __int16 v42 = v19;
  __int16 v43 = v20;
  __int16 v44 = v21;
  __int16 v45 = v22;
  __int16 v46 = v23;
  id v33 = v26;
  os_signpost_id_t v38 = a9;
  signed __int16 v39 = a8;
  [v30 enumerateQueryResults:v15 stringCache:0 usingBlock:v31];

  _Block_object_dispose(v47, 8);
}

- (NSArray)fetchAttributes
{
  return [(CSSearchQueryContext *)self->_queryContext fetchAttributes];
}

void __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_4(uint64_t a1, unint64_t a2)
{
  for (id i = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(unint64_t)(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)+ *(void *)(a1 + 72)- 1)/ *(void *)(a1 + 72)];
        a2 < *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        a2 += *(void *)(a1 + 72))
  {
    unint64_t v2 = v2 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(a1 + 112);
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "copyCSSearchableItemWithValues:valueCount:attrKeys:protectionClass:mappingStrategy:attrInfo:requestedAttributeCount:unpackInfo:userFSDomain:", *(void *)(a1 + 80) + 8 * *(void *)(a1 + 88) * a2, *(__int16 *)(*(void *)(a1 + 32) + 24), *(void *)(a1 + 104), v2, *(void *)(a1 + 48));
    uint64_t v6 = *(void *)(a1 + 88);
    for (unint64_t j = v6 * a2; j < v6 * (a2 + 1); ++j)
    {
      id v8 = *(const void **)(*(void *)(a1 + 80) + 8 * j);
      if (v8)
      {
        CFRelease(v8);
        uint64_t v6 = *(void *)(a1 + 88);
      }
    }
    if (v5) {
      [i addObject:v5];
    }
  }
  if ([i count])
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 96));
    [*(id *)(a1 + 56) addObjectsFromArray:i];
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 96));
  }
}

void __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_2(uint64_t a1, void *__src, unsigned char *a3)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 56)) {
    *a3 = 1;
  }
  memcpy((void *)(*(void *)(a1 + 72)+ 8 * *(void *)(a1 + 80) * *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)), __src, 8 * *(void *)(a1 + 80));
  bzero(__src, 8 * *(void *)(a1 + 80));
  if (++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 1024)
  {
    uint64_t v5 = *(void *)(a1 + 80);
    size_t v6 = *(void *)(a1 + 88);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_3;
    v13[3] = &unk_1E554C598;
    id v7 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 72);
    size_t v17 = v6;
    uint64_t v18 = v8;
    uint64_t v19 = v5;
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 104);
    id v14 = v9;
    uint64_t v21 = v10;
    __int16 v22 = *(_WORD *)(a1 + 112);
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 96);
    id v15 = v11;
    uint64_t v20 = v12;
    id v16 = *(id *)(a1 + 56);
    dispatch_apply(v6, 0, v13);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void __56__CSSearchQuery_commonInitWithQueryString_queryContext___block_invoke()
{
  v0 = dispatch_queue_attr_make_initially_inactive(MEMORY[0x1E4F14430]);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.corespotlight.searchQuery.shared", v0);
  unint64_t v2 = (void *)sQueryPoolQueue;
  sQueryPoolQueue = (uint64_t)v1;

  dispatch_queue_set_width();
  uint64_t v3 = sQueryPoolQueue;

  dispatch_activate(v3);
}

- (NSIndexSet)indexSet
{
  return (NSIndexSet *)objc_getAssociatedObject(self, sel_indexSet);
}

- (void)setIndexSet:(id)a3
{
}

- (PRSRankingItemRanker)ranker
{
  return (PRSRankingItemRanker *)objc_getAssociatedObject(self, sel_ranker);
}

- (void)setRanker:(id)a3
{
}

- (PRSQueryRankingConfiguration)rankConfig
{
  return (PRSQueryRankingConfiguration *)objc_getAssociatedObject(self, sel_rankConfig);
}

- (void)setRankConfig:(id)a3
{
}

- (BOOL)isCJK
{
  unint64_t v2 = objc_getAssociatedObject(self, sel_isCJK);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIsCJK:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, sel_isCJK, v4, (void *)1);
}

- (BOOL)isKeyboardCJK
{
  unint64_t v2 = objc_getAssociatedObject(self, sel_isKeyboardCJK);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIsKeyboardCJK:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, sel_isKeyboardCJK, v4, (void *)1);
}

- (unint64_t)hitCount
{
  unint64_t v2 = objc_getAssociatedObject(self, sel_hitCount);
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setHitCount:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  objc_setAssociatedObject(self, sel_hitCount, v4, (void *)1);
}

- (unint64_t)originalHitCount
{
  unint64_t v2 = objc_getAssociatedObject(self, sel_originalHitCount);
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setOriginalHitCount:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  objc_setAssociatedObject(self, sel_originalHitCount, v4, (void *)1);
}

- (unint64_t)originalMaxRankedResultCount
{
  unint64_t v2 = objc_getAssociatedObject(self, sel_originalMaxRankedResultCount);
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setOriginalMaxRankedResultCount:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  objc_setAssociatedObject(self, sel_originalMaxRankedResultCount, v4, (void *)1);
}

- (NSMutableDictionary)currentTopHitCandidates
{
  return (NSMutableDictionary *)objc_getAssociatedObject(self, sel_currentTopHitCandidates);
}

- (void)setCurrentTopHitCandidates:(id)a3
{
}

- (NSMutableDictionary)currentDenseCandidates
{
  return (NSMutableDictionary *)objc_getAssociatedObject(self, sel_currentDenseCandidates);
}

- (void)setCurrentDenseCandidates:(id)a3
{
}

- (void)setupTopHitQueryContextForClientBundleId:(id)a3
{
  uint64_t v224 = *MEMORY[0x1E4F143B8];
  id v186 = a3;
  v190 = self;
  v191 = [(CSSearchQuery *)self queryContext];
  v187 = [v191 userQuery];
  v183 = [(CSSearchQuery *)self queryString];
  uint64_t v4 = [v191 maxCount];
  uint64_t v5 = 0x7FFFFFFFLL;
  if (v4) {
    uint64_t v5 = v4;
  }
  unint64_t v182 = v5;
  if ([v191 maxRankedResultCount] < 1)
  {
    uint64_t v7 = 100;
  }
  else
  {
    unint64_t v6 = [v191 maxRankedResultCount];
    uint64_t v7 = 100;
    if (v6 < 0x64) {
      uint64_t v7 = v6;
    }
  }
  unint64_t v185 = v7;
  if ([v186 isEqualToString:@"com.apple.mobilemail"])
  {
    unint64_t v8 = [v187 length];
    if (v8 < 5)
    {
      uint64_t v9 = 20;
    }
    else if (v8 <= 8)
    {
      if (v8 == 8)
      {
        uint64_t v9 = 50;
      }
      else
      {
        uint64_t v9 = 25;
        if (v8 > 6) {
          uint64_t v9 = 40;
        }
      }
    }
    else
    {
      uint64_t v9 = 65;
    }
    unint64_t v185 = v9;
    if ([v191 generateSuggestions])
    {
      uint64_t v10 = [v187 length];
      uint64_t v11 = v185;
      if (!v10) {
        uint64_t v11 = 100;
      }
      unint64_t v185 = v11;
    }
  }
  v184 = [v191 keyboardLanguage];
  unsigned __int8 v203 = 0;
  id v12 = CSGetCurrentLocale(0, (uint64_t)&v203);
  id v13 = [v184 lowercaseString];
  if (([v13 hasPrefix:@"ja"] & 1) != 0
    || ([v13 hasPrefix:@"zh"] & 1) != 0
    || ([v13 hasPrefix:@"ko"] & 1) != 0)
  {
    unsigned int v181 = 1;
  }
  else
  {
    unsigned int v181 = [v13 hasPrefix:@"yue"];
  }

  if (!v187 || ![v191 parseUserQuery])
  {
    if (v182 <= v185) {
      unint64_t v28 = v185;
    }
    else {
      unint64_t v28 = v182;
    }
    [v191 setMaxCount:v28];
    id v29 = 0;
    goto LABEL_137;
  }
  [v191 setMaxCount:v185];
  [v191 setGrouped:v185 != 0];
  int v174 = v203;
  char v172 = [v191 disableNLP];
  uint64_t v169 = [v191 queryID];
  id v14 = v187;
  id v178 = v186;
  id v177 = v184;
  id v15 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchQuery(TopHitRanking) setupTopHitQueryContextForClientBundleId:].cold.6(v15);
  }

  v188 = objc_opt_new();
  [v188 setObject:MEMORY[0x1E4F1CC28] forKey:@"isNLQuery"];
  [v188 setObject:MEMORY[0x1E4F1CC28] forKey:@"isAdvancedSyntax"];
  [v188 setObject:MEMORY[0x1E4F1CC28] forKey:@"isMath"];
  [v188 setObject:MEMORY[0x1E4F1CBF0] forKey:@"suggestions"];
  [v188 setObject:MEMORY[0x1E4F1CC08] forKey:@"rankCategories"];
  [v188 setObject:MEMORY[0x1E4F1CC08] forKey:@"rankTerms"];
  [v188 setObject:MEMORY[0x1E4F1CBF0] forKey:@"queryTerms"];
  [v188 setObject:&stru_1EDBB3A50 forKey:@"query"];
  [v188 setObject:&stru_1EDBB3A50 forKey:@"completionString"];
  [v188 setObject:&unk_1EDBD69B8 forKey:@"completionCount"];
  [v188 setObject:&unk_1EDBD69B8 forKey:@"completionOptions"];
  [v188 setObject:MEMORY[0x1E4F1CBF0] forKey:@"completionAttributes"];
  id v180 = v14;
  unint64_t v176 = [v180 length];
  [v180 length];
  v197 = objc_opt_new();
  v194 = objc_opt_new();
  v179 = objc_opt_new();
  v193 = objc_opt_new();
  v192 = objc_opt_new();
  if ([MEMORY[0x1E4F1CBF0] count] && objc_msgSend(MEMORY[0x1E4F1CBF0], "count"))
  {
    long long v216 = 0u;
    long long v217 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    uint64_t v16 = [MEMORY[0x1E4F1CBF0] countByEnumeratingWithState:&v214 objects:&v219 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v215;
      uint64_t v18 = v180;
      do
      {
        uint64_t v19 = 0;
        uint64_t v20 = v18;
        do
        {
          if (*(void *)v215 != v17) {
            objc_enumerationMutation(MEMORY[0x1E4F1CBF0]);
          }
          uint64_t v21 = *(void **)(*((void *)&v214 + 1) + 8 * v19);
          uint64_t v18 = [v21 queryString];

          __int16 v22 = [v21 spotlightQueryString];
          if (v22) {
            [v197 addObject:v22];
          }
          __int16 v23 = [v21 spotlightFilterQueries];
          if (v23) {
            [v194 addObjectsFromArray:v23];
          }
          __int16 v24 = [v21 spotlightRankCategories];
          if (v24) {
            [v192 addEntriesFromDictionary:v24];
          }
          id v25 = [v21 spotlightRankTerms];
          if (v25) {
            [v193 addEntriesFromDictionary:v25];
          }
          int v26 = [v21 isScopedSearch];
          uint64_t v27 = [v21 isNLPEntitySearch];

          ++v19;
          uint64_t v20 = v18;
        }
        while (v16 != v19);
        uint64_t v16 = [MEMORY[0x1E4F1CBF0] countByEnumeratingWithState:&v214 objects:&v219 count:16];
      }
      while (v16);
    }
    else
    {
      int v26 = 0;
      uint64_t v27 = 0;
      uint64_t v18 = v180;
    }
    id v30 = [v193 keysSortedByValueUsingSelector:sel_compare_];
    [v179 addObjectsFromArray:v30];
  }
  else
  {
    int v26 = 0;
    uint64_t v27 = 0;
    uint64_t v18 = v180;
  }
  if ([v18 length])
  {
    int v31 = [v197 count] ? v26 : 1;
    if (v31 == 1)
    {
      if (v174) {
        BOOL v32 = v176 > 1;
      }
      else {
        BOOL v32 = 0;
      }
      uint64_t v33 = v32;
      id v171 = v18;
      uint64_t v210 = 0;
      v211 = &v210;
      uint64_t v212 = 0x2020000000;
      int v34 = getSSDefaultQueryParseResultsForQueryStringSymbolLoc_ptr;
      v213 = getSSDefaultQueryParseResultsForQueryStringSymbolLoc_ptr;
      if (!getSSDefaultQueryParseResultsForQueryStringSymbolLoc_ptr)
      {
        uint64_t v205 = MEMORY[0x1E4F143A8];
        uint64_t v206 = 3221225472;
        uint64_t v207 = (uint64_t)__getSSDefaultQueryParseResultsForQueryStringSymbolLoc_block_invoke;
        v208 = &unk_1E5548E88;
        v209 = &v210;
        int v35 = (void *)SpotlightServicesLibrary();
        uint64_t v36 = dlsym(v35, "SSDefaultQueryParseResultsForQueryString");
        *(void *)(v209[1] + 24) = v36;
        getSSDefaultQueryParseResultsForQueryStringSymbolLoc_ptr = *(_UNKNOWN **)(v209[1] + 24);
        int v34 = (void *)v211[3];
      }
      _Block_object_dispose(&v210, 8);
      if (!v34) {
        goto LABEL_213;
      }
      HIBYTE(v162) = v26;
      LOBYTE(v162) = 0;
      uint64_t v37 = ((void (*)(id, BOOL, void, uint64_t, void, void, void, void, _DWORD))v34)(v171, v174 != 0, 0, v33, 0, 0, 0, 0, v162);

      if (v37)
      {
        os_signpost_id_t v38 = [v37 objectForKeyedSubscript:@"query"];
        signed __int16 v39 = [v37 objectForKeyedSubscript:@"completionString"];
      }
      else
      {
        os_signpost_id_t v38 = 0;
        signed __int16 v39 = v180;
      }
      char v40 = v172;
      if (v176 < 3) {
        char v40 = 1;
      }
      if (v40)
      {
        __int16 v41 = 0;
        v168 = 0;
        v170 = 0;
        long long v166 = 0;
        long long v167 = 0;
        long long v173 = 0;
        long long v175 = 0;
        BOOL v42 = 0;
        if (v38)
        {
LABEL_100:
          __int16 v59 = v38;
          __int16 v60 = v59;
          if (v175) {
            int v61 = v27;
          }
          else {
            int v61 = 0;
          }
          if (v61 == 1)
          {
            if (v170) {
              [v192 addEntriesFromDictionary:v170];
            }
            if (v168) {
              [v193 addEntriesFromDictionary:v168];
            }
            if (v167) {
              [v179 addObjectsFromArray:v167];
            }
            __int16 v62 = v60;
            if ([v175 length])
            {
              __int16 v62 = [NSString stringWithFormat:@"(%@ || %@)", v175, v60];
            }
            if (v166) {
              [v188 setObject:v166 forKey:@"suggestions"];
            }
            uint64_t v27 = 1;
          }
          else
          {
            __int16 v62 = v59;
            if (v42)
            {
              if (v170) {
                [v192 addEntriesFromDictionary:v170];
              }
              if (v168) {
                objc_msgSend(v193, "addEntriesFromDictionary:");
              }
              uint64_t v27 = 1;
              __int16 v62 = v60;
            }
          }
          if ([v173 length])
          {
            uint64_t v63 = [NSString stringWithFormat:@"(%@ || %@)", v173, v62];

            __int16 v62 = (__CFString *)v63;
          }
          if (!v62) {
            __int16 v62 = @"*=*";
          }
          [v197 addObject:v62];

          goto LABEL_126;
        }
      }
      else
      {
        long long v164 = v38;
        __int16 v43 = [MEMORY[0x1E4F1CA60] dictionary];
        __int16 v44 = v43;
        if (v178) {
          [v43 setObject:v178 forKeyedSubscript:@"kMDQueryOptionContextIdentifier"];
        }
        __int16 v45 = [NSNumber numberWithInteger:v169];
        [v44 setObject:v45 forKey:@"queryID"];

        id v46 = v171;
        id v165 = v44;
        uint64_t v210 = 0;
        v211 = &v210;
        uint64_t v212 = 0x2020000000;
        id v47 = getSSQueryParseResultsForQueryStringSymbolLoc_ptr;
        v213 = getSSQueryParseResultsForQueryStringSymbolLoc_ptr;
        if (!getSSQueryParseResultsForQueryStringSymbolLoc_ptr)
        {
          uint64_t v205 = MEMORY[0x1E4F143A8];
          uint64_t v206 = 3221225472;
          uint64_t v207 = (uint64_t)__getSSQueryParseResultsForQueryStringSymbolLoc_block_invoke;
          v208 = &unk_1E5548E88;
          v209 = &v210;
          uint64_t v48 = (void *)SpotlightServicesLibrary();
          int v49 = dlsym(v48, "SSQueryParseResultsForQueryString");
          *(void *)(v209[1] + 24) = v49;
          getSSQueryParseResultsForQueryStringSymbolLoc_ptr = *(_UNKNOWN **)(v209[1] + 24);
          id v47 = (void *)v211[3];
        }
        _Block_object_dispose(&v210, 8);
        if (!v47) {
          goto LABEL_213;
        }
        __int16 v41 = ((void (*)(id, id, uint64_t, void, void))v47)(v46, v165, v33, 0, 0);

        if (v41)
        {
          long long v175 = [v41 objectForKeyedSubscript:@"nlQuery"];
          long long v173 = [v41 objectForKeyedSubscript:@"annQuery"];
          uint64_t v50 = [v41 objectForKeyedSubscript:@"isNLQuery"];
          uint64_t v27 = [v50 BOOLValue];

          v170 = [v41 objectForKeyedSubscript:@"rankCategories"];
          v168 = [v41 objectForKeyedSubscript:@"rankTerms"];
          long long v167 = [v41 objectForKeyedSubscript:@"queryTerms"];
          long long v166 = [v41 objectForKeyedSubscript:@"suggestions"];
          int v51 = [v41 objectForKeyedSubscript:@"filterQueries"];
          if ([v51 count]) {
            [v188 setObject:v51 forKey:@"filterQueries"];
          }
          id v52 = [v41 objectForKeyedSubscript:@"queryUnderstandingOutput"];
          [v188 setObject:v52 forKey:@"queryUnderstandingOutput"];
          BOOL v42 = v52 != 0;
        }
        else
        {
          v168 = 0;
          v170 = 0;
          long long v166 = 0;
          long long v167 = 0;
          long long v173 = 0;
          long long v175 = 0;
          BOOL v42 = 0;
        }

        os_signpost_id_t v38 = v164;
        if (v164) {
          goto LABEL_100;
        }
      }
      uint64_t v204 = 0;
      id v53 = v171;
      uint64_t v210 = 0;
      v211 = &v210;
      uint64_t v212 = 0x2020000000;
      id v54 = (void (*)(id, uint64_t *))getSSPhraseQueryEscapeStringSymbolLoc_ptr;
      v213 = getSSPhraseQueryEscapeStringSymbolLoc_ptr;
      if (!getSSPhraseQueryEscapeStringSymbolLoc_ptr)
      {
        uint64_t v205 = MEMORY[0x1E4F143A8];
        uint64_t v206 = 3221225472;
        uint64_t v207 = (uint64_t)__getSSPhraseQueryEscapeStringSymbolLoc_block_invoke;
        v208 = &unk_1E5548E88;
        v209 = &v210;
        uint64_t v55 = (void *)SpotlightServicesLibrary();
        unint64_t v56 = dlsym(v55, "SSPhraseQueryEscapeString");
        *(void *)(v209[1] + 24) = v56;
        getSSPhraseQueryEscapeStringSymbolLoc_ptr = *(_UNKNOWN **)(v209[1] + 24);
        id v54 = (void (*)(id, uint64_t *))v211[3];
      }
      _Block_object_dispose(&v210, 8);
      if (v54)
      {
        uint64_t v57 = v54(v53, &v204);

        if (v176 > 2) {
          int v58 = 1;
        }
        else {
          int v58 = v26;
        }
        if (v58 == 1) {
          [NSString stringWithFormat:@"(**=\"%@*\"cwdt)", v57];
        }
        else {
        os_signpost_id_t v38 = [NSString stringWithFormat:@"((*=\"%@*\"cwdt) || (kMDItemTextContent=\"%@\"cwdt))", v57, v57];
        }

        goto LABEL_100;
      }
LABEL_213:
      CSSectionIsSyndicatedPhotos_cold_1();
LABEL_214:
      __break(1u);
    }
  }
  signed __int16 v39 = v180;
LABEL_126:
  _os_feature_enabled_impl();
  _os_feature_enabled_impl();
  if ([v197 count])
  {
    int v64 = [v197 componentsJoinedByString:@" && "];
  }
  else
  {
    int v64 = @"(true)");
  }
  if ([v194 count])
  {
    v65 = [v194 componentsJoinedByString:@" && "];
    if (v65)
    {
      uint64_t v66 = [NSString stringWithFormat:@"((%@) && (%@))", v64, v65];

      int v64 = (__CFString *)v66;
    }
  }
  [v188 setObject:v192 forKey:@"rankCategories"];
  [v188 setObject:v193 forKey:@"rankTerms"];
  [v188 setObject:v179 forKey:@"queryTerms"];
  v67 = [NSNumber numberWithBool:v27];
  [v188 setObject:v67 forKey:@"isNLQuery"];

  v68 = [NSNumber numberWithBool:0];
  [v188 setObject:v68 forKey:@"isAdvancedSyntax"];

  v69 = [NSNumber numberWithBool:0];
  [v188 setObject:v69 forKey:@"isMath"];

  [v188 setObject:v64 forKey:@"query"];
  v70 = [v188 objectForKeyedSubscript:@"query"];
  v71 = (void *)[v70 mutableCopy];

  if ([v71 length]
    && [v183 length]
    && ([v71 isEqualToString:v183] & 1) == 0)
  {
    objc_msgSend(v71, "appendString:", @"&&(");
    [v71 appendString:v183];
    [v71 appendString:@""]);
    uint64_t v72 = [NSString stringWithFormat:@"(%@)", v71];

    v183 = (void *)v72;
  }

  id v29 = v188;
LABEL_137:
  *(void *)&long long v214 = 0;
  *((void *)&v214 + 1) = &v214;
  *(void *)&long long v215 = 0x2050000000;
  int v73 = (void *)getPRSRankingItemRankerClass_softClass;
  *((void *)&v215 + 1) = getPRSRankingItemRankerClass_softClass;
  if (!getPRSRankingItemRankerClass_softClass)
  {
    uint64_t v219 = MEMORY[0x1E4F143A8];
    uint64_t v220 = 3221225472;
    v221 = __getPRSRankingItemRankerClass_block_invoke;
    v222 = &unk_1E5548E88;
    v223 = (uint64_t *)&v214;
    __getPRSRankingItemRankerClass_block_invoke((uint64_t)&v219);
    int v73 = *(void **)(*((void *)&v214 + 1) + 24);
  }
  v189 = v29;
  v74 = v73;
  _Block_object_dispose(&v214, 8);
  id v198 = [v74 alloc];
  if (isClientPhotosOrPhotosCtl(v186))
  {
    v75 = [getSSPommesPhotosRankerClass() PhotosRankingRequiredAttributes];
    v76 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v75];
  }
  else
  {
    id v77 = v198;
    uint64_t v78 = [v191 queryID];
    [v191 currentTime];
    v79 = objc_msgSend(v77, "initWithSearchString:queryID:language:currentTime:", v187, v78, v184);

    [v79 activate];
    v80 = [v191 keyboardLanguage];
    id v198 = v79;
    id v81 = v186;
    id v82 = v183;
    id v83 = v187;
    id v84 = v80;
    if ([v81 isEqualToString:@"com.apple.mobilemail"])
    {
      id v195 = v198;
      id v85 = v81;
      id v86 = v82;
      id v87 = v83;
      id v88 = v84;
      if (getQueryRankingConfigurationForMail_onceToken != -1) {
        dispatch_once(&getQueryRankingConfigurationForMail_onceToken, &__block_literal_global_479);
      }
      if (getMailVIPList_onceToken != -1) {
        dispatch_once(&getMailVIPList_onceToken, &__block_literal_global_493);
      }
      double Current = CFAbsoluteTimeGetCurrent();
      id v90 = (id)getMailVIPList_vipListLock;
      objc_sync_enter(v90);
      if (*(double *)&getMailVIPList_lastUpdateTime == 0.0
        || Current - *(double *)&getMailVIPList_lastUpdateTime > 60.0)
      {
        getMailVIPList_lastUpdateTime = *(void *)&Current;
        uint64_t v91 = fetchMailVIPList();
        v92 = (void *)getMailVIPList_vipList;
        getMailVIPList_vipList = v91;
      }
      objc_sync_exit(v90);

      LOBYTE(v163) = 0;
      v93 = [v195 rankingConfigurationWithMeContact:getQueryRankingConfigurationForMail_meContactIdentifier emailAddresses:getQueryRankingConfigurationForMail_meEmailAddresses phoneFavorites:getQueryRankingConfigurationForMail_phoneFavorites vipList:getMailVIPList_vipList clientBundle:v85 isScopedSearch:0 spotlightQuery:v86 userQuery:v87 tokenString:0 queryKind:11 isPeopleSearch:v163 keyboardLanguage:v88];
    }
    else
    {
      LOBYTE(v163) = 0;
      v93 = [v198 rankingConfigurationWithMeContact:0 emailAddresses:0 phoneFavorites:0 vipList:0 clientBundle:v81 isScopedSearch:0 spotlightQuery:v82 userQuery:v83 tokenString:0 queryKind:11 isPeopleSearch:v163 keyboardLanguage:v84];
    }

    v94 = [v191 completionString];

    if (v94)
    {
      uint64_t v95 = [v93 fuzzyMatchMask];
      objc_msgSend(v191, "setFuzzyMask:", v95, v96);
      uint64_t v97 = [v93 fuzzyMatchCheck];
      objc_msgSend(v191, "setFuzzyMatch:", v97, v98);
    }
    v99 = [v191 bundleIDs];
    uint64_t v100 = [v99 count];

    if (v100)
    {
      BOOL v101 = [MEMORY[0x1E4F28E78] string];
      objc_msgSend(v101, "appendFormat:", @"FieldMatch(%@,"), CFSTR("_kMDItemBundleID");
      long long v201 = 0u;
      long long v202 = 0u;
      long long v199 = 0u;
      long long v200 = 0u;
      v102 = [v191 bundleIDs];
      uint64_t v103 = [v102 countByEnumeratingWithState:&v199 objects:v218 count:16];
      if (v103)
      {
        uint64_t v104 = *(void *)v200;
        do
        {
          for (uint64_t i = 0; i != v103; ++i)
          {
            if (*(void *)v200 != v104) {
              objc_enumerationMutation(v102);
            }
            [v101 appendFormat:@"%@,", *(void *)(*((void *)&v199 + 1) + 8 * i)];
          }
          uint64_t v103 = [v102 countByEnumeratingWithState:&v199 objects:v218 count:16];
        }
        while (v103);
      }

      v106 = objc_msgSend(v101, "substringToIndex:", objc_msgSend(v101, "length") - 1);
      v107 = (void *)[v106 mutableCopy];

      [v107 appendString:@""]);
      v108 = [MEMORY[0x1E4F1CA48] arrayWithObject:v107];
      uint64_t v109 = [v189 objectForKeyedSubscript:@"filterQueries"];
      if ([v109 count]) {
        [v108 addObjectsFromArray:v109];
      }
      v110 = [v191 filterQueries];
      BOOL v111 = v110 == 0;

      if (v111)
      {
        [v191 setFilterQueries:v108];
      }
      else
      {
        uint64_t v112 = [v191 filterQueries];
        v113 = [v112 arrayByAddingObjectsFromArray:v108];
        [v191 setFilterQueries:v113];
      }
    }
    int v114 = [v93 rankingQueries];
    if (v189)
    {
      v115 = [v189 objectForKeyedSubscript:@"queryTerms"];
      uint64_t v116 = [v189 objectForKeyedSubscript:@"rankCategories"];
      [v114 count];
      v117 = [v189 objectForKeyedSubscript:@"isNLQuery"];
      uint64_t v118 = [v117 BOOLValue];

      if (v118)
      {
        if (v115)
        {
          id v119 = v115;
          *(void *)&long long v214 = 0;
          *((void *)&v214 + 1) = &v214;
          *(void *)&long long v215 = 0x2020000000;
          v120 = (void (*)(id))getPRSRankingItemRankerAddJunkFilterSymbolLoc_ptr;
          *((void *)&v215 + 1) = getPRSRankingItemRankerAddJunkFilterSymbolLoc_ptr;
          if (!getPRSRankingItemRankerAddJunkFilterSymbolLoc_ptr)
          {
            uint64_t v219 = MEMORY[0x1E4F143A8];
            uint64_t v220 = 3221225472;
            v221 = __getPRSRankingItemRankerAddJunkFilterSymbolLoc_block_invoke;
            v222 = &unk_1E5548E88;
            v223 = (uint64_t *)&v214;
            v121 = (void *)SpotlightServicesLibrary();
            v122 = dlsym(v121, "PRSRankingItemRankerAddJunkFilter");
            *(void *)(v223[1] + 24) = v122;
            getPRSRankingItemRankerAddJunkFilterSymbolLoc_ptr = *(_UNKNOWN **)(v223[1] + 24);
            v120 = *(void (**)(id))(*((void *)&v214 + 1) + 24);
          }
          _Block_object_dispose(&v214, 8);
          if (!v120) {
            goto LABEL_211;
          }
          v123 = v120(v119);

          if ([v123 count])
          {
            uint64_t v124 = objc_msgSend(v123, "objectAtIndex:", objc_msgSend(v123, "count") - 1);
            uint64_t v125 = [v114 arrayByAddingObject:v124];

            int v114 = (void *)v125;
          }
        }
        if (v116)
        {
          v126 = [v116 keysSortedByValueUsingSelector:sel_compare_];
          [v198 setRankCategories:v126];
        }
        [v198 setIsNLSearch:1];
      }
      [v114 count];
    }
    else
    {
      uint64_t v118 = 0;
    }
    [v191 setParseUserQuery:v118];
    [v191 setRankingQueries:v114];
    objc_msgSend(v191, "setStrongRankingQueryCount:", objc_msgSend(v93, "strongRankingQueryCount"));
    objc_msgSend(v191, "setDominantRankingQueryCount:", objc_msgSend(v93, "dominantRankingQueryCount"));
    objc_msgSend(v191, "setDominatedRankingQueryCount:", objc_msgSend(v93, "dominatedRankingQueryCount"));
    objc_msgSend(v191, "setShortcutBit:", objc_msgSend(v93, "shortcutBit"));
    objc_msgSend(v191, "setHighMatchBit:", objc_msgSend(v93, "highMatchBit"));
    objc_msgSend(v191, "setLowMatchBit:", objc_msgSend(v93, "lowMatchBit"));
    objc_msgSend(v191, "setHighRecencyBit:", objc_msgSend(v93, "highRecencyBit"));
    objc_msgSend(v191, "setLowRecencyBit:", objc_msgSend(v93, "lowRecencyBit"));
    v76 = [v93 requiredAttributes];
    v127 = [v93 requiredAttributes];
    v75 = [v127 array];

    [(CSSearchQuery *)v190 setRankConfig:v93];
  }
  v128 = [v191 fetchAttributes];
  uint64_t v196 = [v128 count];

  v129 = (void *)MEMORY[0x1E4F1CAD0];
  v130 = [v191 fetchAttributes];
  uint64_t v131 = [v129 setWithArray:v130];
  originalAttributes = v190->_originalAttributes;
  v190->_originalAttributes = (NSSet *)v131;

  id v133 = [v191 fetchAttributes];
  id v134 = v75;
  uint64_t v135 = [v133 count];
  uint64_t v136 = [v134 count];
  uint64_t v137 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v136 + v135];
  uint64_t v138 = [MEMORY[0x1E4F1CA80] setWithArray:v133];
  long long v216 = 0u;
  long long v217 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  uint64_t v205 = 0;
  uint64_t v206 = (uint64_t)&v205;
  uint64_t v207 = 0x2020000000;
  BOOL v139 = (void (*)(void))getrankingAttributeNameArraySymbolLoc_ptr;
  v208 = getrankingAttributeNameArraySymbolLoc_ptr;
  if (!getrankingAttributeNameArraySymbolLoc_ptr)
  {
    uint64_t v219 = MEMORY[0x1E4F143A8];
    uint64_t v220 = 3221225472;
    v221 = __getrankingAttributeNameArraySymbolLoc_block_invoke;
    v222 = &unk_1E5548E88;
    v223 = &v205;
    v140 = (void *)SpotlightServicesLibrary();
    v141 = dlsym(v140, "rankingAttributeNameArray");
    *(void *)(v223[1] + 24) = v141;
    getrankingAttributeNameArraySymbolLoc_ptr = *(_UNKNOWN **)(v223[1] + 24);
    BOOL v139 = *(void (**)(void))(v206 + 24);
  }
  _Block_object_dispose(&v205, 8);
  if (!v139)
  {
LABEL_211:
    CSSectionIsSyndicatedPhotos_cold_1();
    goto LABEL_214;
  }
  v142 = v139();
  uint64_t v143 = [v142 countByEnumeratingWithState:&v214 objects:&v219 count:16];
  if (v143)
  {
    uint64_t v144 = *(void *)v215;
    do
    {
      for (uint64_t j = 0; j != v143; ++j)
      {
        if (*(void *)v215 != v144) {
          objc_enumerationMutation(v142);
        }
        uint64_t v146 = *(void *)(*((void *)&v214 + 1) + 8 * j);
        if (([v133 containsObject:v146] & 1) != 0
          || [v134 containsObject:v146])
        {
          [v137 addObject:v146];
          [v138 removeObject:v146];
        }
      }
      uint64_t v143 = [v142 countByEnumeratingWithState:&v214 objects:&v219 count:16];
    }
    while (v143);
  }

  if ([v138 count])
  {
    v147 = [v138 allObjects];
    [v137 addObjectsFromArray:v147];
  }
  [v191 setFetchAttributes:v137];

  v148 = [v191 fetchAttributes];
  objc_msgSend(v191, "setTopHitExtraFetchAttributeCount:", objc_msgSend(v148, "count") - v196);

  id v149 = [v191 fetchAttributes];
  uint64_t v150 = [v149 count];
  id v151 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (v150)
  {
    for (uint64_t k = 0; k != v150; ++k)
    {
      unsigned int v153 = [v149 objectAtIndexedSubscript:k];
      int v154 = [v76 containsObject:v153];

      if (v154) {
        [v151 addIndex:k];
      }
    }
  }
  [(CSSearchQuery *)v190 setHitCount:v185];
  [(CSSearchQuery *)v190 setOriginalHitCount:v182];
  [(CSSearchQuery *)v190 setIsCJK:v203];
  [(CSSearchQuery *)v190 setIsKeyboardCJK:v181];
  [(CSSearchQuery *)v190 setIndexSet:v151];
  [(CSSearchQuery *)v190 setRanker:v198];
  id v155 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(CSSearchQuery *)v190 setCurrentTopHitCandidates:v155];

  id v156 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(CSSearchQuery *)v190 setCurrentDenseCandidates:v156];

  -[CSSearchQuery setOriginalMaxRankedResultCount:](v190, "setOriginalMaxRankedResultCount:", [v191 maxRankedResultCount]);
  v157 = [v191 clientBundleID];
  if ([v157 isEqualToString:@"com.apple.mobilemail"])
  {
  }
  else
  {
    v158 = [v191 clientBundleID];
    char v159 = [v158 isEqualToString:@"com.apple.pommesctl"];

    if ((v159 & 1) == 0 && [v191 maxRankedResultCount] >= 1)
    {
      uint64_t v160 = [v191 maxRankedResultCount];
      if (3 * v160 >= 100) {
        uint64_t v161 = 100;
      }
      else {
        uint64_t v161 = 3 * v160;
      }
      [v191 setMaxRankedResultCount:v161];
    }
  }
}

- (void)processResultsForTopHitRanking:(id)a3 protectionClass:(id)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [(CSSearchQuery *)self queryContext];
  __int16 v59 = objc_opt_new();
  uint64_t v55 = [v6 queryID];
  BOOL v7 = [(CSSearchQuery *)self isCJK];
  BOOL v8 = [(CSSearchQuery *)self isKeyboardCJK];
  __int16 v62 = [v6 userQuery];
  uint64_t v9 = [v6 clientBundleID];
  if ([v9 isEqualToString:@"com.apple.mobilemail"])
  {
  }
  else
  {
    uint64_t v10 = [v6 clientBundleID];
    int v11 = [v10 isEqualToString:@"com.apple.pommesctl"];

    if (!v11 && [v6 maxRankedResultCount] >= 1)
    {
      uint64_t v12 = [v6 maxRankedResultCount];
      goto LABEL_7;
    }
  }
  uint64_t v12 = [v6 maxCount];
LABEL_7:
  CFIndex v60 = v12;
  unint64_t v70 = 0;
  id v13 = [(CSSearchQuery *)self queryContext];
  uint64_t v14 = [v13 maxDenseResultCount];

  CFIndex v61 = v14;
  if (!v14)
  {
    id v15 = [v6 bundleIDs];
    if ([v15 count])
    {
      uint64_t v16 = [v6 bundleIDs];
      uint64_t v17 = [v16 objectAtIndexedSubscript:0];
      int v18 = [v17 isEqual:@"com.apple.mobileslideshow"];

      uint64_t v19 = 1000;
      if (!v18) {
        uint64_t v19 = 0;
      }
      CFIndex v61 = v19;
    }
    else
    {

      CFIndex v61 = 0;
    }
  }
  unint64_t v56 = v6;
  uint64_t v54 = [v5 count];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v20 = v5;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v21)
  {
    uint64_t v23 = v21;
    uint64_t v24 = *(void *)v67;
    uint64_t v25 = 2;
    if (!v7 && !v8) {
      uint64_t v25 = 3;
    }
    unint64_t v57 = v25;
    unint64_t v58 = 0;
    *(void *)&long long v22 = 134217984;
    long long v53 = v22;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v67 != v24) {
          objc_enumerationMutation(v20);
        }
        uint64_t v27 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        if ([(CSSearchQuery *)self isCancelled])
        {
          id v52 = v20;
          goto LABEL_47;
        }
        unint64_t v28 = [v27 attributeSet];
        id v29 = [v27 bundleID];
        if (v29)
        {
          id v30 = v62;
          v65 = v29;
          id v31 = v29;
          BOOL v32 = v30;
          id v33 = v31;
          if (![v32 length]) {
            goto LABEL_32;
          }
          [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          uint64_t v63 = v28;
          int v64 = v33;
          v35 = uint64_t v34 = v23;
          [v32 stringByTrimmingCharactersInSet:v35];
          uint64_t v36 = v32;
          uint64_t v37 = v24;
          os_signpost_id_t v38 = self;
          v40 = signed __int16 v39 = v20;
          uint64_t v41 = [v40 length];

          uint64_t v20 = v39;
          self = v38;
          uint64_t v24 = v37;
          BOOL v32 = v36;
          unint64_t v42 = v41;

          uint64_t v23 = v34;
          unint64_t v28 = v63;
          id v33 = v64;
          if (!v42
            || ([v64 isEqualToString:@"com.apple.mobilemail"] & 1) == 0
            && ![v64 isEqualToString:@"com.apple.pommesctl"])
          {
            goto LABEL_32;
          }
          if (v42 < v57)
          {
            __int16 v43 = logForCSLogCategoryQuery();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v51 = [v32 length];
              *(_DWORD *)buf = 134218752;
              uint64_t v73 = v55;
              __int16 v74 = 2048;
              uint64_t v75 = v51;
              __int16 v76 = 2048;
              unint64_t v77 = v42;
              __int16 v78 = 2048;
              unint64_t v79 = v57;
              _os_log_debug_impl(&dword_18D0E3000, v43, OS_LOG_TYPE_DEBUG, "qid=%lu - query (length=%lu, trimmed length=%lu) is too short (threshold=%lu) for topHit results", buf, 0x2Au);
            }

            __int16 v44 = logForCSLogCategoryQuery();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v53;
              uint64_t v73 = v55;
              _os_log_debug_impl(&dword_18D0E3000, v44, OS_LOG_TYPE_DEBUG, "qid=%lu - returning empty tophits", buf, 0xCu);
            }
          }
          else
          {
LABEL_32:

            __int16 v45 = [(CSSearchQuery *)self currentDenseCandidates];
            id v46 = updateDenseCandidatesAndReturnItemToBeSentToClientNow((uint64_t)v45, v61, v27, v33, v28, v45);

            if (v46)
            {
              id v47 = [(CSSearchQuery *)self currentTopHitCandidates];
              uint64_t v48 = updateTopHitCandidatesAndReturnItemToBeSentToClientNow((uint64_t)v47, v60, v46, v33, v28, v47, &v70);

              if (v48)
              {
                [v59 addObject:v48];
              }
              else
              {
                ++v58;
              }
            }
          }
          id v29 = v65;
        }
        else
        {
          int v49 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            uint64_t v50 = [v27 uniqueIdentifier];
            *(_DWORD *)buf = 134218242;
            uint64_t v73 = v55;
            __int16 v74 = 2112;
            uint64_t v75 = (uint64_t)v50;
            _os_log_error_impl(&dword_18D0E3000, v49, OS_LOG_TYPE_ERROR, "qid=%ld - Missing bundleID for item with ID: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v23 = [v20 countByEnumeratingWithState:&v66 objects:v71 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v58 = 0;
  }

  [v20 removeAllObjects];
  [v20 addObjectsFromArray:v59];
  id v52 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    uint64_t v73 = v55;
    __int16 v74 = 2048;
    uint64_t v75 = v54;
    __int16 v76 = 2048;
    unint64_t v77 = v70;
    __int16 v78 = 2048;
    unint64_t v79 = v58;
    _os_log_debug_impl(&dword_18D0E3000, v52, OS_LOG_TYPE_DEBUG, "qid=%lu - current batch has %ld items (%ld items are L1 topHit candidates, %ld items are L2 topHit candidates)", buf, 0x2Au);
  }
LABEL_47:
}

- (void)finishTopHitRanking
{
  unint64_t v2 = self;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  if ([(CSSearchQuery *)self isCancelled]) {
    return;
  }
  unint64_t v3 = [(CSSearchQuery *)v2 queryContext];
  BOOL v77 = [(CSSearchQuery *)v2 isCJK];
  BOOL v76 = [(CSSearchQuery *)v2 isKeyboardCJK];
  uint64_t v4 = [(CSSearchQuery *)v2 hitCount];
  id v5 = [(CSSearchQuery *)v2 ranker];
  uint64_t v80 = [(CSSearchQuery *)v2 rankConfig];
  id v81 = v5;
  uint64_t v75 = v4;
  [v5 setTopHitMaxCount:v4];
  uint64_t v74 = [v3 queryID];
  unint64_t v79 = [v3 clientBundleID];
  __int16 v78 = [v3 userQuery];
  char v73 = [v3 privateQuery];
  unint64_t v6 = [v3 fetchAttributes];
  char v72 = [v6 containsObject:@"_kMDItemPhotosL2Signals"];

  BOOL v7 = [v3 clientBundleID];
  if ([v7 isEqualToString:@"com.apple.mobilemail"])
  {

LABEL_7:
    uint64_t v10 = [v3 maxCount];
    goto LABEL_8;
  }
  BOOL v8 = [v3 clientBundleID];
  int v9 = [v8 isEqualToString:@"com.apple.pommesctl"];

  if (v9 || [v3 maxRankedResultCount] < 1) {
    goto LABEL_7;
  }
  uint64_t v10 = [v3 maxRankedResultCount];
LABEL_8:
  CFIndex v11 = v10;
  uint64_t v114 = 0;
  id v82 = v3;
  uint64_t v12 = [v3 fetchAttributes];
  id v13 = objc_opt_new();
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  obuint64_t j = [(CSSearchQuery *)v2 currentDenseCandidates];
  uint64_t v14 = [obj countByEnumeratingWithState:&v110 objects:v122 count:16];
  uint64_t v97 = v2;
  id v85 = v12;
  v94 = v13;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v111;
    uint64_t v87 = *(void *)v111;
    do
    {
      uint64_t v17 = 0;
      uint64_t v89 = v15;
      do
      {
        if (*(void *)v111 != v16) {
          objc_enumerationMutation(obj);
        }
        int v18 = *(void **)(*((void *)&v110 + 1) + 8 * v17);
        uint64_t v19 = [(CSSearchQuery *)v2 currentDenseCandidates];
        uint64_t v20 = [v19 objectForKeyedSubscript:v18];

        uint64_t v21 = -[CSDenseCandidateQueue getAllItemsAndClearHeap]((uint64_t)v20);
        if ([v21 count])
        {
          if (v11 < 1)
          {
            [v13 addObjectsFromArray:v21];
          }
          else
          {
            id v95 = v20;
            long long v108 = 0u;
            long long v109 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            v93 = v21;
            id v22 = v21;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v106 objects:v121 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v107;
              do
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v107 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v27 = *(void **)(*((void *)&v106 + 1) + 8 * i);
                  unint64_t v28 = [v27 attributeSet];
                  id v29 = [(CSSearchQuery *)v2 currentTopHitCandidates];
                  id v30 = updateTopHitCandidatesAndReturnItemToBeSentToClientNow((uint64_t)v29, v11, v27, v18, v28, v29, &v114);

                  if (v30) {
                    [v94 addObject:v30];
                  }

                  unint64_t v2 = v97;
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v106 objects:v121 count:16];
              }
              while (v24);
            }

            uint64_t v12 = v85;
            id v13 = v94;
            uint64_t v20 = v95;
            uint64_t v16 = v87;
            uint64_t v15 = v89;
            uint64_t v21 = v93;
          }
        }

        ++v17;
      }
      while (v17 != v15);
      uint64_t v15 = [obj countByEnumeratingWithState:&v110 objects:v122 count:16];
    }
    while (v15);
  }

  if ([v13 count]) {
    [(CSSearchQuery *)v2 processResultItems:v13];
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v71 = [(CSSearchQuery *)v2 currentTopHitCandidates];
  id v31 = v82;
  uint64_t v86 = [v71 countByEnumeratingWithState:&v102 objects:v120 count:16];
  if (v86)
  {
    BOOL v83 = 0;
    uint64_t v84 = *(void *)v103;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v103 != v84) {
          objc_enumerationMutation(v71);
        }
        id v33 = *(void **)(*((void *)&v102 + 1) + 8 * v32);
        uint64_t v34 = [(CSSearchQuery *)v2 currentTopHitCandidates];
        uint64_t v35 = [v34 objectForKeyedSubscript:v33];

        uint64_t v36 = -[CSL1CandidateQueue getAllItemsAndClearHeap]((__CFBinaryHeap **)v35);
        if ([v36 count])
        {
          if (CSSectionIsSyndicatedPhotos(v33)) {
            BOOL v83 = v35 && !*(void *)(v35 + 8) && !*(void *)(v35 + 24) && *(void *)(v35 + 16) != 0;
          }
          id obja = (id)v35;
          uint64_t v37 = objc_opt_new();
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          id v90 = v36;
          id v38 = v36;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v98 objects:v119 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v99;
            do
            {
              for (uint64_t j = 0; j != v40; ++j)
              {
                if (*(void *)v99 != v41) {
                  objc_enumerationMutation(v38);
                }
                __int16 v43 = [(CSSearchQuery *)v2 getTopHitResult:*(void *)(*((void *)&v98 + 1) + 8 * j) fetchAttrs:v12];
                [v37 addObject:v43];
              }
              uint64_t v40 = [v38 countByEnumeratingWithState:&v98 objects:v119 count:16];
            }
            while (v40);
          }

          BYTE3(v70) = v83;
          BYTE2(v70) = v72;
          BYTE1(v70) = v73;
          LOBYTE(v70) = v76;
          LOBYTE(v69) = v77;
          id v88 = -[CSSearchQuery rankBatch:withRanker:withBundle:maxCount:userQuery:queryID:rankingConfiguration:isCJK:clientBundle:isKeyboardCJK:privateQuery:collectL2Signals:onlyEmbeddingResults:](v2, "rankBatch:withRanker:withBundle:maxCount:userQuery:queryID:rankingConfiguration:isCJK:clientBundle:isKeyboardCJK:privateQuery:collectL2Signals:onlyEmbeddingResults:", v37, v81, v33, v75, v78, v74, v80, v69, v79, v70);
          objc_msgSend(v37, "addObjectsFromArray:");
          id v44 = v37;
          __int16 v45 = [MEMORY[0x1E4F1CA48] array];
          long long v115 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          id v96 = v44;
          uint64_t v46 = [v96 countByEnumeratingWithState:&v115 objects:v123 count:16];
          if (v46)
          {
            uint64_t v47 = v46;
            uint64_t v48 = *(void *)v116;
            do
            {
              for (uint64_t k = 0; k != v47; ++k)
              {
                if (*(void *)v116 != v48) {
                  objc_enumerationMutation(v96);
                }
                uint64_t v50 = *(void **)(*((void *)&v115 + 1) + 8 * k);
                uint64_t v51 = [v50 resultItem];
                id v52 = [v50 rankingItem];
                long long v53 = [v51 bundleID];
                int v54 = CSPommesRankingForSectionBundle(v53);

                uint64_t v55 = NSNumber;
                if (v54)
                {
                  [v52 pommesL1Score];
                  unint64_t v56 = objc_msgSend(v55, "numberWithFloat:");
                  unint64_t v57 = [v51 attributeSet];
                  [v57 setMailResultScoreL1:v56];

                  unint64_t v58 = NSNumber;
                  [v52 l2Score];
                  __int16 v59 = objc_msgSend(v58, "numberWithFloat:");
                  CFIndex v60 = [v51 attributeSet];
                  [v60 setMailResultScoreL2:v59];
                }
                else
                {
                  [v50 scoreL1];
                  CFIndex v61 = objc_msgSend(v55, "numberWithFloat:");
                  __int16 v62 = [v51 attributeSet];
                  [v62 setMailResultScoreL1:v61];

                  uint64_t v63 = NSNumber;
                  __int16 v59 = [v50 rankingItem];
                  [v59 score];
                  CFIndex v60 = objc_msgSend(v63, "numberWithFloat:");
                  int v64 = [v51 attributeSet];
                  [v64 setMailResultScoreL2:v60];
                }
                v65 = [v52 l2Signals];
                long long v66 = [v51 attributeSet];
                [v66 setPhotosL2Signals:v65];

                [v45 addObject:v51];
              }
              uint64_t v47 = [v96 countByEnumeratingWithState:&v115 objects:v123 count:16];
            }
            while (v47);
          }

          long long v67 = (void *)[v45 copy];
          unint64_t v2 = v97;
          [(CSSearchQuery *)v97 processResultItems:v67];

          id v31 = v82;
          uint64_t v12 = v85;
          uint64_t v35 = (uint64_t)obja;
          uint64_t v36 = v90;
        }

        ++v32;
      }
      while (v32 != v86);
      uint64_t v68 = [v71 countByEnumeratingWithState:&v102 objects:v120 count:16];
      uint64_t v86 = v68;
    }
    while (v68);
  }

  objc_msgSend(v31, "setMaxCount:", -[CSSearchQuery originalHitCount](v2, "originalHitCount"));
  objc_msgSend(v31, "setMaxRankedResultCount:", -[CSSearchQuery originalMaxRankedResultCount](v2, "originalMaxRankedResultCount"));
}

- (void)deactivate
{
  unint64_t v3 = [(CSSearchQuery *)self rankConfig];

  if (v3)
  {
    id v4 = [(CSSearchQuery *)self ranker];
    [v4 deactivate];
  }
}

- (id)getTopHitResult:(id)a3 fetchAttrs:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (getTopHitResult_fetchAttrs__urlIndexOnceToken != -1) {
    dispatch_once(&getTopHitResult_fetchAttrs__urlIndexOnceToken, &__block_literal_global_7);
  }
  uint64_t v27 = [v6 attributeSet];
  BOOL v8 = [v27 attributeDictionary];
  int v9 = [(CSSearchQuery *)self indexSet];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v10 = [v7 objectsAtIndexes:v9];
  uint64_t v11 = 0;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [v8 objectForKey:*(void *)(*((void *)&v32 + 1) + 8 * i)];

        if (v15) {
          ++v11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v12);
  }

  uint64_t v41 = 0;
  unint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v16 = (uint64_t (*)(uint64_t))getSSCompactRankingAttrsAllocSymbolLoc_ptr;
  id v44 = getSSCompactRankingAttrsAllocSymbolLoc_ptr;
  if (!getSSCompactRankingAttrsAllocSymbolLoc_ptr)
  {
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    id v38 = __getSSCompactRankingAttrsAllocSymbolLoc_block_invoke;
    uint64_t v39 = &unk_1E5548E88;
    uint64_t v40 = &v41;
    uint64_t v17 = (void *)SpotlightServicesLibrary();
    int v18 = dlsym(v17, "SSCompactRankingAttrsAlloc");
    *(void *)(v40[1] + 24) = v18;
    getSSCompactRankingAttrsAllocSymbolLoc_ptr = *(_UNKNOWN **)(v40[1] + 24);
    uint64_t v16 = (uint64_t (*)(uint64_t))v42[3];
  }
  _Block_object_dispose(&v41, 8);
  if (!v16)
  {
    CSSectionIsSyndicatedPhotos_cold_1();
    __break(1u);
  }
  uint64_t v19 = v16(v11);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __59__CSSearchQuery_TopHitRanking__getTopHitResult_fetchAttrs___block_invoke_2;
  v28[3] = &unk_1E5549578;
  id v20 = v8;
  id v29 = v20;
  id v21 = v7;
  id v30 = v21;
  uint64_t v31 = v19;
  [v9 enumerateIndexesUsingBlock:v28];
  uint64_t v41 = 0;
  unint64_t v42 = &v41;
  uint64_t v43 = 0x2050000000;
  id v22 = (void *)getPRSRankingItemClass_softClass;
  id v44 = (void *)getPRSRankingItemClass_softClass;
  if (!getPRSRankingItemClass_softClass)
  {
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    id v38 = __getPRSRankingItemClass_block_invoke;
    uint64_t v39 = &unk_1E5548E88;
    uint64_t v40 = &v41;
    __getPRSRankingItemClass_block_invoke((uint64_t)&v36);
    id v22 = (void *)v42[3];
  }
  uint64_t v23 = v22;
  _Block_object_dispose(&v41, 8);
  uint64_t v24 = (void *)[[v23 alloc] initWithAttrs:v19];
  uint64_t v25 = [[CSTopHitResult alloc] initWithRankingItem:v24 resultItem:v6];

  return v25;
}

uint64_t __59__CSSearchQuery_TopHitRanking__getTopHitResult_fetchAttrs___block_invoke()
{
  getTopHitResult_fetchAttrs__contentURLRankingIdx = CSRankingAttributeIndexForName(@"kMDItemContentURL");
  uint64_t result = CSRankingAttributeIndexForName(@"kMDItemURL");
  getTopHitResult_fetchAttrs__itemURLRankingIdx = result;
  return result;
}

void __59__CSSearchQuery_TopHitRanking__getTopHitResult_fetchAttrs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  id v12 = [v4 objectForKey:v5];

  id v6 = v12;
  if (v12)
  {
    id v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
    uint64_t v8 = CSRankingAttributeIndexForName(v7);

    BOOL v9 = v8 == getTopHitResult_fetchAttrs__contentURLRankingIdx || v8 == getTopHitResult_fetchAttrs__itemURLRankingIdx;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = [v12 absoluteString];
      CSCompactRankingAttrsInsertValue(v10, v8, v11);
    }
    else
    {
      CSCompactRankingAttrsInsertValue(*(void *)(a1 + 48), v8, v12);
    }
    id v6 = v12;
  }
}

- (void)filterRankedItems:(id)a3 maxCount:(unint64_t)a4 bundle:(id)a5 userQuery:(id)a6 queryID:(int64_t)a7 privateQuery:(BOOL)a8 rankingConfiguration:(id)a9 currentTime:(double)a10 clientBundle:(id)a11 ranker:(id)a12
{
  BOOL v14 = a8;
  uint64_t v19 = a12;
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v75 = a5;
  id v73 = a6;
  id v72 = a9;
  id v71 = a11;
  id v20 = a12;
  if ([(CSSearchQuery *)self isCancelled]) {
    goto LABEL_70;
  }
  uint64_t v68 = v20;
  uint64_t v69 = self;
  id v21 = [(CSSearchQuery *)self queryContext];
  if ([v21 filterTopHits])
  {
    id v22 = [(CSSearchQuery *)self queryContext];
    int v23 = [v22 generateSuggestions];
    if (v23
      && ([(CSSearchQuery *)self queryContext],
          id v12 = objc_claimAutoreleasedReturnValue(),
          [v12 additionalBundleIDs],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          ([v19 containsObject:v75] & 1) != 0))
    {
      uint64_t v24 = v12;
      int v25 = 0;
    }
    else
    {
      int v26 = [(CSSearchQuery *)self queryContext];
      if ([v26 enableInstantAnswers])
      {
        uint64_t v27 = [(CSSearchQuery *)self queryContext];
        unint64_t v28 = [v27 instantAnswersBundleIDs];
        BOOL v76 = v27;
        uint64_t v24 = v12;
        int v25 = [v28 containsObject:v75] ^ 1;
      }
      else
      {
        uint64_t v24 = v12;
        int v25 = 1;
      }

      if (!v23) {
        goto LABEL_12;
      }
    }

LABEL_12:
    goto LABEL_13;
  }
  int v25 = 0;
LABEL_13:

  if (CSPommesRankingForSectionBundle(v75))
  {
    uint64_t v101 = 0;
    long long v102 = &v101;
    uint64_t v103 = 0x2050000000;
    id v29 = (void *)getSSPommesRankerClass_softClass;
    uint64_t v104 = getSSPommesRankerClass_softClass;
    if (!getSSPommesRankerClass_softClass)
    {
      uint64_t v96 = MEMORY[0x1E4F143A8];
      uint64_t v97 = 3221225472;
      long long v98 = __getSSPommesRankerClass_block_invoke;
      long long v99 = &unk_1E5548E88;
      long long v100 = &v101;
      __getSSPommesRankerClass_block_invoke((uint64_t)&v96);
      id v29 = (void *)v102[3];
    }
    id v30 = v29;
    _Block_object_dispose(&v101, 8);
    uint64_t v31 = [v30 sharedPommesRanker];
    [v31 sortAndFilterRankedItems:v74 maxCount:a4 bundleID:v75 userQuery:v73 queryID:a7 privateQuery:v14 currentTime:a10];
LABEL_69:

    id v20 = v68;
    goto LABEL_70;
  }
  int v67 = v25;
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __150__CSSearchQuery_TopHitRanking__filterRankedItems_maxCount_bundle_userQuery_queryID_privateQuery_rankingConfiguration_currentTime_clientBundle_ranker___block_invoke;
  v95[3] = &__block_descriptor_48_e43_q24__0__CSTopHitResult_8__CSTopHitResult_16l;
  *(double *)&v95[4] = a10;
  *(double *)&v95[5] = a10;
  [v74 sortWithOptions:1 usingComparator:v95];
  if (v25)
  {
    id v77 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v32 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v33 = v74;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v91 objects:v108 count:16];
    if (v34)
    {
      uint64_t v35 = 0;
      uint64_t v36 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v92 != v36) {
            objc_enumerationMutation(v33);
          }
          id v38 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          uint64_t v39 = [v38 rankingItem];
          [v39 withinBundleScore];
          BOOL v41 = v40 < -9500.0;

          if (v41)
          {
            [v32 addIndex:v35 + i];
          }
          else
          {
            unint64_t v42 = [v38 threadId];
            if (v42)
            {
              if ([v77 containsObject:v42]) {
                [v32 addIndex:v35 + i];
              }
              else {
                [v77 addObject:v42];
              }
            }
          }
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v91 objects:v108 count:16];
        v35 += i;
      }
      while (v34);
    }

    [v33 removeObjectsAtIndexes:v32];
  }
  id v20 = v68;
  if (![(CSSearchQuery *)v69 isCancelled])
  {
    uint64_t v31 = objc_opt_new();
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v43 = v74;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v87 objects:v107 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v88 != v45) {
            objc_enumerationMutation(v43);
          }
          uint64_t v47 = [*(id *)(*((void *)&v87 + 1) + 8 * j) rankingItem];
          [v31 addObject:v47];
        }
        uint64_t v44 = [v43 countByEnumeratingWithState:&v87 objects:v107 count:16];
      }
      while (v44);
    }

    uint64_t v101 = 0;
    long long v102 = &v101;
    uint64_t v103 = 0x2050000000;
    uint64_t v48 = (void *)getPRSAnonymousPipelineManagerClass_softClass;
    uint64_t v104 = getPRSAnonymousPipelineManagerClass_softClass;
    if (!getPRSAnonymousPipelineManagerClass_softClass)
    {
      uint64_t v96 = MEMORY[0x1E4F143A8];
      uint64_t v97 = 3221225472;
      long long v98 = __getPRSAnonymousPipelineManagerClass_block_invoke;
      long long v99 = &unk_1E5548E88;
      long long v100 = &v101;
      __getPRSAnonymousPipelineManagerClass_block_invoke((uint64_t)&v96);
      uint64_t v48 = (void *)v102[3];
    }
    id v49 = v48;
    _Block_object_dispose(&v101, 8);
    uint64_t v50 = [v49 sharedManager];
    objc_msgSend(v50, "queryWillFinishWithItems:forClient:forQuery:anonymousDataCollectionAllowed:", v31, v75, v73, objc_msgSend(v72, "allowAnonymousDataCollection"));

    if ([v43 count] > a4) {
      int v51 = v67;
    }
    else {
      int v51 = 0;
    }
    if (v51 == 1) {
      objc_msgSend(v43, "removeObjectsInRange:", a4, objc_msgSend(v43, "count") - a4);
    }
    if (([v75 isEqualToString:@"com.apple.MobileSMS"] & 1) != 0
      || [v75 isEqualToString:@"com.apple.mobilemail"])
    {
      id v52 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v53 = v43;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v83 objects:v106 count:16];
      if (v54)
      {
        uint64_t v55 = *(void *)v84;
        do
        {
          for (uint64_t k = 0; k != v54; ++k)
          {
            if (*(void *)v84 != v55) {
              objc_enumerationMutation(v53);
            }
            unint64_t v57 = [*(id *)(*((void *)&v83 + 1) + 8 * k) rankingItem];
            [v52 addObject:v57];
          }
          uint64_t v54 = [v53 countByEnumeratingWithState:&v83 objects:v106 count:16];
        }
        while (v54);
      }

      unint64_t v58 = [v68 filterRankedItems:v52 bundle:v75 userQuery:v73];
      unint64_t v59 = [v58 count];
      if (v59 < [v52 count])
      {
        id v78 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v60 = v53;
        uint64_t v61 = [v60 countByEnumeratingWithState:&v79 objects:v105 count:16];
        if (v61)
        {
          uint64_t v62 = 0;
          uint64_t v63 = *(void *)v80;
          do
          {
            for (uint64_t m = 0; m != v61; ++m)
            {
              if (*(void *)v80 != v63) {
                objc_enumerationMutation(v60);
              }
              v65 = [*(id *)(*((void *)&v79 + 1) + 8 * m) rankingItem];
              char v66 = [v58 containsObject:v65];

              if ((v66 & 1) == 0) {
                [v78 addIndex:v62 + m];
              }
            }
            uint64_t v61 = [v60 countByEnumeratingWithState:&v79 objects:v105 count:16];
            v62 += m;
          }
          while (v61);
        }

        [v60 removeObjectsAtIndexes:v78];
      }
    }
    goto LABEL_69;
  }
LABEL_70:
}

uint64_t __150__CSSearchQuery_TopHitRanking__filterRankedItems_maxCount_bundle_userQuery_queryID_privateQuery_rankingConfiguration_currentTime_clientBundle_ranker___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 rankingItem];
  uint64_t v8 = [v6 rankingItem];
  uint64_t v9 = [v7 compare:v8 currentTime:*(double *)(a1 + 32)];

  if (!v9)
  {
    uint64_t v10 = [v5 score];
    unint64_t v12 = v11;
    uint64_t v13 = [v6 score];
    if (__PAIR128__(v14, v13) >= __PAIR128__(v12, v10))
    {
      if (__PAIR128__(v12, v10) >= __PAIR128__(v14, v13))
      {
        double v15 = *(double *)(a1 + 40);
        uint64_t v16 = [v5 interestingDate];
        [v16 timeIntervalSinceReferenceDate];
        double v18 = vabdd_f64(v15, v17);

        double v19 = *(double *)(a1 + 40);
        id v20 = [v6 interestingDate];
        [v20 timeIntervalSinceReferenceDate];
        double v22 = vabdd_f64(v19, v21);

        if (v18 < v22) {
          goto LABEL_5;
        }
        if (v18 <= v22)
        {
          uint64_t v9 = 0;
          goto LABEL_8;
        }
      }
      uint64_t v9 = -1;
      goto LABEL_8;
    }
LABEL_5:
    uint64_t v9 = 1;
  }
LABEL_8:

  return -v9;
}

- (id)rankBatch:(id)a3 withRanker:(id)a4 withBundle:(id)a5 maxCount:(unint64_t)a6 userQuery:(id)a7 queryID:(int64_t)a8 rankingConfiguration:(id)a9 isCJK:(BOOL)a10 clientBundle:(id)a11 isKeyboardCJK:(BOOL)a12 privateQuery:(BOOL)a13 collectL2Signals:(BOOL)a14 onlyEmbeddingResults:(BOOL)a15
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v62 = a4;
  id v63 = a5;
  id v60 = a7;
  id v59 = a9;
  id v61 = a11;
  unint64_t v58 = v19;
  id v20 = (void *)[v19 mutableCopy];
  double v21 = objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v66 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = [*(id *)(*((void *)&v65 + 1) + 8 * i) rankingItem];
        [v21 addObject:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v24);
  }

  unint64_t v28 = v62;
  id v29 = v63;
  [v62 prepareItemsForL1Ranking:v21 inBundle:v63];
  if (!CSSectionIsSyndicatedPhotos(v63))
  {
    if (![v62 pommes]) {
      goto LABEL_23;
    }
    id v38 = v63;
    id v39 = v61;
    if ([v38 isEqualToString:@"com.apple.mobilemail"])
    {
      [v38 isEqualToString:@"com.apple.mobilesafari"];
    }
    else
    {
      int v40 = [v38 isEqualToString:@"com.apple.pommesctl"];
      char v41 = [v38 isEqualToString:@"com.apple.mobilesafari"];
      if ((v40 & 1) == 0 && (v41 & 1) == 0)
      {

        unint64_t v28 = v62;
        id v29 = v63;
        goto LABEL_23;
      }
      if (!v40)
      {
        if ([v39 isEqualToString:@"com.apple.mobilesafari"])
        {
LABEL_19:

          unint64_t v28 = v62;
          id v29 = v63;
LABEL_20:
          [v28 prepareForPurePommesL2RankingWithItems:v21 inBundle:v38];
LABEL_24:
          id v34 = v60;
          id v35 = v61;
          unint64_t v36 = a6;
          BOOL v37 = a13;
          [v28 updateScoresForPreparedItems:v21 isCJK:a10 clientBundleID:v61 thresholdValue:0 queryNodeMatchInfo:a14 collectL2Signals:-1.79769313e308];
          goto LABEL_25;
        }
        goto LABEL_22;
      }
    }
    if (([v39 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
      || ([v39 isEqualToString:@"com.apple.pommesctl"] & 1) != 0)
    {
      goto LABEL_19;
    }
LABEL_22:
    int v42 = [v39 isEqualToString:@"com.apple.search"];

    unint64_t v28 = v62;
    id v29 = v63;
    if (v42) {
      goto LABEL_20;
    }
LABEL_23:
    [v28 prepareItems:v21 inBundle:v29];
    goto LABEL_24;
  }
  id v30 = [getSSPommesPhotosRankerClass() sharedInstance];
  [v62 currentTime];
  double v32 = v31;
  id v33 = [v62 keyboardLanguage];
  LOBYTE(v56) = a15;
  id v34 = v60;
  [v30 updateScoresForItems:v21 withSectionBundle:v63 userQuery:v60 queryID:a8 currentTime:a14 collectL2Signals:v33 keyboardLanguage:v32 onlyEmbeddingResults:v56];

  unint64_t v28 = v62;
  id v29 = v63;

  id v35 = v61;
  unint64_t v36 = a6;
  BOOL v37 = a13;
LABEL_25:
  [v28 currentTime];
  -[CSSearchQuery filterRankedItems:maxCount:bundle:userQuery:queryID:privateQuery:rankingConfiguration:currentTime:clientBundle:ranker:](self, "filterRankedItems:maxCount:bundle:userQuery:queryID:privateQuery:rankingConfiguration:currentTime:clientBundle:ranker:", v22, v36, v29, v34, a8, v37, v59, v35, v28);
  if (CSSectionIsSyndicatedPhotos(v29) && [v22 count])
  {
    unint64_t v43 = 0;
    do
    {
      uint64_t v44 = [v22 objectAtIndexedSubscript:v43];
      uint64_t v45 = logForCSLogCategoryDefault();
      unint64_t v46 = v43 + 1;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        uint64_t v47 = [v44 rankingItem];
        uint64_t v48 = [v47 identifier];
        id v49 = [v44 rankingItem];
        [v49 pommesL1Score];
        double v51 = v50;
        id v52 = [v44 rankingItem];
        [v52 l2Score];
        *(_DWORD *)buf = 134218754;
        unint64_t v70 = v43 + 1;
        __int16 v71 = 2112;
        id v72 = v48;
        __int16 v73 = 2048;
        double v74 = v51;
        __int16 v75 = 2048;
        double v76 = v53;
        _os_log_impl(&dword_18D0E3000, v45, OS_LOG_TYPE_INFO, "%lu. Final Photos item identifier (%@), L1Score=%f, L2Score=%f", buf, 0x2Au);
      }
      unint64_t v54 = [v22 count];
      if (v43 > 0x12) {
        break;
      }
      ++v43;
    }
    while (v46 < v54);
  }
  [v58 removeObjectsInArray:v22];

  return v22;
}

+ (void)setConnectionName:(id)a3
{
  sConnectionName_0 = [a3 stringByAppendingString:@".search"];

  MEMORY[0x1F41817F8]();
}

+ (void)preheat:(id)a3
{
  id v3 = a3;
  id v4 = +[CSSearchConnection sharedSearchConnection];
  [v4 preheat:v3];
}

- (CSSearchQuery)init
{
  id v3 = [NSString alloc];
  id v4 = NSStringFromSelector(sel_initWithQueryString_attributes_);
  id v5 = (void *)[v3 initWithFormat:@"Use %@ instead", v4];

  id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v5 userInfo:0];
  [v6 raise];

  return 0;
}

- (void)updateQueryString:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchQuery updateQueryString:]();
  }

  queryString = self->_queryString;
  self->_queryString = v4;
}

- (void)updateQueryContext:(id)a3
{
  id v4 = a3;
  id v5 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchQuery updateQueryContext:]();
  }

  id v6 = (CSSearchQueryContext *)[v4 copy];
  queryContext = self->_queryContext;
  if (queryContext) {
    uint64_t v8 = [(CSSearchQueryContext *)queryContext queryID];
  }
  else {
    uint64_t v8 = 0;
  }
  [(CSSearchQueryContext *)v6 setQueryID:v8];
  uint64_t v9 = [(CSSearchQueryContext *)self->_queryContext clientBundleID];
  [(CSSearchQueryContext *)v6 setClientBundleID:v9];

  uint64_t v10 = [v4 attributedUserQuery];
  [(CSSearchQueryContext *)v6 setAttributedUserQuery:v10];

  unint64_t v11 = self->_queryContext;
  self->_queryContext = v6;
}

- (CSSearchQuery)initWithQueryString:(NSString *)queryString attributes:(NSArray *)attributes
{
  id v6 = attributes;
  id v7 = queryString;
  uint64_t v8 = objc_opt_new();
  [v8 setFetchAttributes:v6];

  uint64_t v9 = [(CSSearchQuery *)self initWithQueryString:v7 context:v8];
  return v9;
}

- (CSSearchQuery)initWithQueryString:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  [v8 setProtectionClasses:0];
  [v8 setOptions:v6];

  uint64_t v9 = [(CSSearchQuery *)self initWithQueryString:v7 context:v8];
  return v9;
}

- (NSArray)protectionClasses
{
  unint64_t v2 = [(CSSearchQueryContext *)self->_queryContext protectionClasses];
  id v3 = v2;
  if (!v2)
  {
    if (protectionClasses_onceToken != -1) {
      dispatch_once(&protectionClasses_onceToken, &__block_literal_global_962);
    }
    id v3 = (void *)protectionClasses_sAllProtectionClasses;
  }
  id v4 = v3;

  return (NSArray *)v4;
}

void __34__CSSearchQuery_protectionClasses__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F28348];
  v4[0] = *MEMORY[0x1E4F28340];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F28358];
  v4[2] = *MEMORY[0x1E4F28368];
  v4[3] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  id v3 = (void *)protectionClasses_sAllProtectionClasses;
  protectionClasses_sAllProtectionClasses = v2;
}

- (id)bundleIDs
{
  return [(CSSearchQueryContext *)self->_queryContext bundleIDs];
}

- (id)keyboardLanguage
{
  return [(CSSearchQueryContext *)self->_queryContext keyboardLanguage];
}

- (id)preferredLanguages
{
  return [(CSSearchQueryContext *)self->_queryContext preferredLanguages];
}

- (id)options
{
  return [(CSSearchQueryContext *)self->_queryContext options];
}

- (id)scopes
{
  return [(CSSearchQueryContext *)self->_queryContext scopes];
}

- (void)setScopes:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    id v5 = [v4 allObjects];
    [(CSSearchQueryContext *)self->_queryContext setScopes:v5];
  }
  else
  {
    [(CSSearchQueryContext *)self->_queryContext setScopes:0];
  }
}

- (BOOL)internal
{
  return [(CSSearchQueryContext *)self->_queryContext internal];
}

- (BOOL)grouped
{
  return [(CSSearchQueryContext *)self->_queryContext grouped];
}

- (BOOL)counting
{
  return [(CSSearchQueryContext *)self->_queryContext counting];
}

- (BOOL)attribute
{
  return [(CSSearchQueryContext *)self->_queryContext attribute];
}

- (double)currentTime
{
  [(CSSearchQueryContext *)self->_queryContext currentTime];
  return result;
}

- (id)description
{
  queryContext = self->_queryContext;
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (queryContext) {
    [v4 stringWithFormat:@"<%@:%p qid=%ld flag=0x%4.4x>", v5, self, -[CSSearchQueryContext queryID](self->_queryContext, "queryID"), -[CSSearchQueryContext flags](self->_queryContext, "flags")];
  }
  else {
  id v6 = [v4 stringWithFormat:@"<%@:%p", v5, self, v8, v9];
  }

  return v6;
}

- (id)debugDescription
{
  return [(CSSearchQuery *)self debugDescriptionWithQueryString:0];
}

+ (id)_makeQueryErrorWithErrorCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5
{
  unint64_t v7 = (unint64_t)a4;
  unint64_t v8 = (unint64_t)a5;
  if (v7 | v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v10 = v9;
    if (v7) {
      [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    if (v8) {
      [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  unint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"CSSearchQueryErrorDomain" code:a3 userInfo:v10];

  return v11;
}

uint64_t __34__CSSearchQuery__finishWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCompletion:*(void *)(a1 + 40)];
}

- (void)handleError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__CSSearchQuery_handleError___block_invoke;
  v8[3] = &unk_1E5548FE0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  dispatch_async(queue, v7);
}

uint64_t __29__CSSearchQuery_handleError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:*(void *)(a1 + 40)];
}

- (void)poll
{
  qos_class_t v3 = qos_class_self();
  if ([(CSSearchQueryContext *)self->_queryContext qos]) {
    qos_class_t v3 = [(CSSearchQueryContext *)self->_queryContext qos];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__CSSearchQuery_poll__block_invoke;
  block[3] = &unk_1E5548F00;
  block[4] = self;
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v3, 0, block);
  dispatch_async(queue, v5);
}

void __21__CSSearchQuery_poll__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) queryID];
  qos_class_t v3 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    uint64_t v7 = v2;
    _os_log_impl(&dword_18D0E3000, v3, OS_LOG_TYPE_INFO, "qid=%ld - Polling", (uint8_t *)&v6, 0xCu);
  }

  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "command", "pollResults");
  xpc_dictionary_set_uint64(v4, "qid", v2);
  dispatch_block_t v5 = [*(id *)(a1 + 32) connection];
  [v5 sendMessageAsync:v4 completion:&__block_literal_global_1017];
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)cancel
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_cancelled)
  {
    self->_BOOL cancelled = 1;
    BOOL finished = self->_finished;
    uint64_t v4 = [(CSSearchQueryContext *)self->_queryContext queryID];
    dispatch_block_t v5 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v4;
      _os_log_impl(&dword_18D0E3000, v5, OS_LOG_TYPE_INFO, "qid=%ld - Canceling", buf, 0xCu);
    }

    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, "command-type", "search-type");
    xpc_dictionary_set_string(v6, "command", "cancelQuery");
    xpc_dictionary_set_uint64(v6, "qid", v4);
    uint64_t v7 = [(CSSearchQuery *)self connection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __23__CSSearchQuery_cancel__block_invoke;
    v18[3] = &unk_1E554C488;
    v18[4] = self;
    [v7 sendMessageAsync:v6 completion:v18];

    if (!finished)
    {
      uint64_t v8 = +[CSPowerLog sharedInstance];
      uint64_t v9 = sMainBundleId;
      uint64_t v10 = [(CSSearchQueryContext *)self->_queryContext reason];
      if (v10)
      {
        [v8 logWithBundleID:v9 indexOperation:4 itemCount:1 reason:v10];
      }
      else
      {
        unint64_t v11 = (objc_class *)objc_opt_class();
        unint64_t v12 = NSStringFromClass(v11);
        [v8 logWithBundleID:v9 indexOperation:4 itemCount:1 reason:v12];
      }
    }
    uint64_t v13 = self;
    objc_sync_enter(v13);
    [(NSMutableArray *)v13->_suggestionCountQueries enumerateObjectsUsingBlock:&__block_literal_global_1023];
    suggestionCountQueries = v13->_suggestionCountQueries;
    v13->_suggestionCountQueries = 0;

    suggestionCountDispatchGroup = v13->_suggestionCountDispatchGroup;
    v13->_suggestionCountDispatchGroup = 0;

    objc_sync_exit(v13);
  }
  megadomeCountingQuerySearchTo = self->_megadomeCountingQuerySearchTo;
  if (megadomeCountingQuerySearchTo) {
    [(_CSMultiQuery *)megadomeCountingQuerySearchTo cancel];
  }
  megadomeCountingQuerySearchFrouint64_t m = self->_megadomeCountingQuerySearchFrom;
  if (megadomeCountingQuerySearchFrom) {
    [(_CSMultiQuery *)megadomeCountingQuerySearchFrom cancel];
  }
}

void __23__CSSearchQuery_cancel__block_invoke(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() _makeQueryErrorWithErrorCode:-2003 description:0 underlyingError:0];
  [*(id *)(a1 + 32) didFinishWithError:v2];
}

uint64_t __23__CSSearchQuery_cancel__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (void)userEngagedWithResult:(id)a3 interactionType:(int)a4
{
  id v18 = a3;
  uint64_t v6 = [(CSSearchQueryContext *)self->_queryContext queryID];
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "command", "userEngaged");
  xpc_dictionary_set_uint64(v7, "qid", v6);
  xpc_dictionary_set_uint64(v7, "uintt", a4);
  xpc_dictionary_set_string(v7, "query", [(NSString *)self->_queryString UTF8String]);
  id v8 = [(CSSearchQueryContext *)self->_queryContext userQuery];
  xpc_dictionary_set_string(v7, "userquery", (const char *)[v8 UTF8String]);

  id v9 = [v18 uniqueIdentifier];
  xpc_dictionary_set_string(v7, "qenr", (const char *)[v9 UTF8String]);

  id v10 = [v18 bundleID];
  xpc_dictionary_set_string(v7, "qenb", (const char *)[v10 UTF8String]);

  id v11 = [v18 protection];
  uint64_t v12 = [v11 UTF8String];

  if (v12)
  {
    id v13 = [v18 protection];
    xpc_dictionary_set_string(v7, "pc", (const char *)[v13 UTF8String]);
  }
  else
  {
    unint64_t v14 = [(CSSearchQueryContext *)self->_queryContext protectionClasses];
    uint64_t v15 = [v14 count];

    if (v15 != 1) {
      goto LABEL_6;
    }
    id v13 = [(CSSearchQueryContext *)self->_queryContext protectionClasses];
    id v16 = [v13 objectAtIndexedSubscript:0];
    xpc_dictionary_set_string(v7, "pc", (const char *)[v16 UTF8String]);
  }
  double v17 = [(CSSearchQuery *)self connection];
  [v17 sendMessageAsync:v7];

LABEL_6:
}

- (void)didResolveFriendlyAttributeNames:(id)a3 fromFetchAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(CSSearchQueryContext *)self->_queryContext queryID];
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__CSSearchQuery_didResolveFriendlyAttributeNames_fromFetchAttributes___block_invoke;
  v12[3] = &unk_1E554C4D0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  int64_t v15 = v8;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, v12);
}

void __70__CSSearchQuery_didResolveFriendlyAttributeNames_fromFetchAttributes___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 56))
  {
    if (*(void *)(v1 + 248))
    {
      unint64_t v3 = [*(id *)(a1 + 40) count];
      unint64_t v4 = [*(id *)(a1 + 48) count];
      if (v3 && v3 >= v4)
      {
        unint64_t v6 = v4;
        id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
        if (v6)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            id v9 = [*(id *)(a1 + 48) objectAtIndexedSubscript:i];
            id v10 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
            if (([v9 isEqualToString:v10] & 1) == 0) {
              [v7 setObject:v10 forKeyedSubscript:v9];
            }
          }
        }
        if ([v7 count]) {
          (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 248) + 16))();
        }
      }
    }
    id v11 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __70__CSSearchQuery_didResolveFriendlyAttributeNames_fromFetchAttributes___block_invoke_cold_1();
    }
  }
}

- (void)handleFoundAttributes:(id)a3 values:(id)a4 attributesHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, id, id))a5 + 2))(a5, a3, a4);
  }
}

- (void)processAttributesData:(id)a3 update:(BOOL)a4 protectionClass:(id)a5
{
  id v7 = a3;
  [v7 bytes];
  [v7 length];

  id Trusted = (void *)_MDPlistBytesCreateTrusted();
  if (a4) {
    [(CSSearchQuery *)self changedAttributesHandler];
  }
  else {
  id v9 = [(CSSearchQuery *)self foundAttributesHandler];
  }
  id v10 = _Block_copy(v9);

  id v11 = [(CSSearchQuery *)self fetchAttributes];
  uint64_t v12 = [v11 count];
  int64_t v13 = [(CSSearchQueryContext *)self->_queryContext queryID];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__CSSearchQuery_processAttributesData_update_protectionClass___block_invoke;
  v16[3] = &unk_1E554C4F8;
  v16[4] = self;
  int64_t v19 = v13;
  uint64_t v20 = v12;
  id v14 = v11;
  id v17 = v14;
  id v15 = v10;
  id v18 = v15;
  [Trusted enumerateQueryResults:v12 stringCache:0 usingBlock:v16];
  if ([(CSSearchQueryContext *)self->_queryContext disableResultStreaming]) {
    [(CSSearchQuery *)self handleFoundAttributes:kCSEndOfBatchMarker values:0 attributesHandler:v15];
  }
}

void __62__CSSearchQuery_processAttributesData_update_protectionClass___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 56))
  {
    dispatch_block_t v5 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __62__CSSearchQuery_processAttributesData_update_protectionClass___block_invoke_cold_1();
    }

    *a3 = 1;
  }
  else if (*(void *)(a1 + 64))
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = *(id *)(a2 + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = *(void **)(a1 + 32);
        id v10 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v7];
        [v9 handleFoundAttributes:v10 values:v8 attributesHandler:*(void *)(a1 + 48)];
      }
      ++v7;
    }
    while (v7 < *(void *)(a1 + 64));
  }
}

- (void)processPhotosComputedData:(id)a3 protectionClass:(id)a4
{
  id v5 = a3;
  [v5 bytes];
  [v5 length];

  id Trusted = (const void *)_MDPlistBytesCreateTrusted();
  uint64_t v7 = [(CSSearchQuery *)self photosComputedAttributesHandler];
  if (v7)
  {
    uint64_t v10 = v7;
    [(CSSearchQueryContext *)self->_queryContext queryID];
    CFArrayRef v8 = (const __CFArray *)_MDPlistBytesCopyPlistAtIndex();
    if (CFArrayGetCount(v8)) {
      (*(void (**)(uint64_t, uint64_t, const __CFArray *))(v10 + 16))(v10, CSPhotosSceneClassificationIdentifierAndType, v8);
    }
    CFRelease(v8);
    CFArrayRef v9 = (const __CFArray *)_MDPlistBytesCopyPlistAtIndex();
    if (CFArrayGetCount(v9)) {
      (*(void (**)(uint64_t, __CFString *, const __CFArray *))(v10 + 16))(v10, @"kMDItemPhotosPeoplePersonIdentifiers", v9);
    }
    CFRelease(v9);
    CFRelease(Trusted);
    if ([(CSSearchQueryContext *)self->_queryContext disableResultStreaming]) {
      (*(void (**)(uint64_t, uint64_t, void))(v10 + 16))(v10, kCSEndOfBatchMarker, 0);
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)_removeIdentifiers:(id)a3 withBundleID:(id)a4 andQueryID:(int64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 count];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218240;
      int64_t v16 = a5;
      __int16 v17 = 2048;
      uint64_t v18 = v11;
      _os_log_impl(&dword_18D0E3000, v12, OS_LOG_TYPE_DEFAULT, "qid=%ld - Removed: %ld items", (uint8_t *)&v15, 0x16u);
    }

    int64_t v13 = self;
    objc_sync_enter(v13);
    v13->_foundItemCount -= v11;
    objc_sync_exit(v13);

    removedItemsHandler = (void (**)(id, id, id))v13->_removedItemsHandler;
    if (removedItemsHandler) {
      removedItemsHandler[2](removedItemsHandler, v9, v8);
    }
  }
}

- (void)processRemoveResultsData:(id)a3 protectionClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 length];
  id v8 = v6;
  [v8 bytes];
  id v9 = (const void *)_MDStoreOIDArrayCreate();
  int64_t v10 = [(CSSearchQueryContext *)self->_queryContext queryID];
  if (v9)
  {
    int64_t v11 = v10;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__9;
    id v22 = __Block_byref_object_dispose__9;
    id v23 = 0;
    uint64_t v12 = 0;
    int64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    int v15 = __Block_byref_object_copy__9;
    int64_t v16 = __Block_byref_object_dispose__9;
    id v17 = 0;
    _MDStoreOIDArrayApplyBlock();
    [(CSSearchQuery *)self _removeIdentifiers:v19[5] withBundleID:v13[5] andQueryID:v11];
    CFRelease(v9);
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }
}

void __58__CSSearchQuery_processRemoveResultsData_protectionClass___block_invoke(uint64_t a1, int a2, int a3, uint64_t a4, unsigned int a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int64_t v10 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134218496;
    uint64_t v32 = v26;
    __int16 v33 = 1024;
    int v34 = a2;
    __int16 v35 = 1024;
    int v36 = a3;
    _os_log_debug_impl(&dword_18D0E3000, v10, OS_LOG_TYPE_DEBUG, "qid=%ld - RemoveResults tag:0x%x opcode :0x%x", buf, 0x18u);
  }

  if (a5 >= 2)
  {
    int64_t v11 = (uint64_t *)(a4 + 8);
    for (uint64_t i = a5 - 1; i; --i)
    {
      uint64_t v14 = *v11++;
      uint64_t v13 = v14;
      int v15 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 64))
      {
        id v27 = 0;
        id v28 = 0;
        int v16 = [v15 removeUserFSLiveOID:v13 outBundleID:&v28 outIdentifier:&v27];
        id v17 = v28;
        id v18 = v27;
        if (v16) {
          goto LABEL_9;
        }
      }
      else
      {
        id v29 = 0;
        id v30 = 0;
        char v19 = [v15 removeLiveOID:v13 outBundleID:&v30 outIdentifier:&v29];
        id v17 = v30;
        id v18 = v29;
        if (v19)
        {
LABEL_9:
          if (([v17 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] & 1) == 0)
          {
            [*(id *)(a1 + 32) _removeIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withBundleID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) andQueryID:*(void *)(a1 + 56)];
            uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
            uint64_t v21 = *(void **)(v20 + 40);
            *(void *)(v20 + 40) = 0;
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v17);
          id v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          if (!v22)
          {
            id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
            uint64_t v25 = *(void **)(v24 + 40);
            *(void *)(v24 + 40) = v23;

            id v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          }
          [v22 addObject:v18];
        }
      }
    }
  }
}

- (BOOL)removeLiveOID:(int64_t)a3 outBundleID:(id *)a4 outIdentifier:(id *)a5
{
  unsigned int v7 = a3;
  int64_t v9 = a3 >> 32;
  p_liveItemLocuint64_t k = &self->_liveItemLock;
  os_unfair_lock_lock(&self->_liveItemLock);
  int64_t v11 = [(NSMapTable *)self->_liveIndexBundleIDToIndexItemIDMap objectForKey:v9];
  if (v11)
  {
    uint64_t v12 = v7;
    uint64_t v13 = [(NSMapTable *)self->_liveIndexBundleIDToBundleString objectForKey:v9];
    uint64_t v14 = [v11 objectForKey:v7];
    if (v14) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    BOOL v16 = !v15;
    if (!v15)
    {
      [v11 removeObjectForKey:v12];
      *a4 = v13;
      *a5 = v14;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
  os_unfair_lock_unlock(p_liveItemLock);

  return v16;
}

- (id)addOrUpdateUserFSLiveOID:(int64_t)a3 userFSDomain:(id)a4 identifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_liveItemLock);
  if (self->_liveIndexUserFSOIDTOIdentifierMap)
  {
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v13 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:0];
  liveIndexUserFSOIDTOIdentifierMap = self->_liveIndexUserFSOIDTOIdentifierMap;
  self->_liveIndexUserFSOIDTOIdentifierMap = v13;

  if (v8)
  {
LABEL_3:
    uint64_t v10 = [v8 stringByAppendingFormat:@"/%@", v9];

    id v9 = (id)v10;
  }
LABEL_4:
  int64_t v11 = [(NSMapTable *)self->_liveIndexUserFSOIDTOIdentifierMap objectForKey:a3];
  if ([v11 isEqualToString:v9])
  {

    int64_t v11 = 0;
  }
  [(NSMapTable *)self->_liveIndexUserFSOIDTOIdentifierMap setObject:v9 forKey:a3];
  os_unfair_lock_unlock(&self->_liveItemLock);

  return v11;
}

- (BOOL)removeUserFSLiveOID:(int64_t)a3 outBundleID:(id *)a4 outIdentifier:(id *)a5
{
  p_liveItemLocuint64_t k = &self->_liveItemLock;
  os_unfair_lock_lock(&self->_liveItemLock);
  uint64_t v10 = [(NSMapTable *)self->_liveIndexUserFSOIDTOIdentifierMap objectForKey:a3];
  if (v10)
  {
    [(NSMapTable *)self->_liveIndexUserFSOIDTOIdentifierMap removeObjectForKey:a3];
    *a4 = (id) UserFSBundleID;
    *a5 = v10;
  }
  os_unfair_lock_unlock(p_liveItemLock);

  return v10 != 0;
}

void __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 56))
  {
    *a3 = 1;
    uint64_t v6 = *(void *)(a1 + 32);
  }
  unint64_t v7 = *(void *)(a1 + 40);
  if (v7 >= *(__int16 *)(v6 + 24)) {
    unint64_t v8 = *(__int16 *)(v6 + 24);
  }
  else {
    unint64_t v8 = v7;
  }
  id v9 = [(id)v6 foundItemHandler];
  (*((void (**)(id, void, unint64_t, uint64_t, unsigned char *))v9 + 2))(v9, 0, v8, a2, a3);
}

void __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_1042(uint64_t a1, CFIndex a2)
{
  unint64_t v4 = malloc_type_calloc(0x400uLL, 8 * *(void *)(a1 + 64), 0x80040B8603338uLL);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_2;
  aBlock[3] = &unk_1E554C5C0;
  __int16 v35 = v41;
  int v36 = v4;
  id v5 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  long long v37 = *(_OWORD *)(a1 + 64);
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 96);
  id v32 = v6;
  uint64_t v39 = v7;
  __int16 v40 = *(_WORD *)(a1 + 104);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 80);
  id v33 = v8;
  uint64_t v38 = v9;
  id v34 = *(id *)(a1 + 56);
  uint64_t v10 = _Block_copy(aBlock);
  int64_t v11 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 88), a2);
  [v11 enumerateQueryResults:*(void *)(a1 + 64) stringCache:0 usingBlock:v10];
  size_t v12 = *(void *)(a1 + 72);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_4;
  v20[3] = &unk_1E554C5E8;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(a1 + 40);
  uint64_t v24 = v41;
  size_t v25 = v12;
  v20[4] = v13;
  uint64_t v15 = *(void *)(a1 + 64);
  uint64_t v26 = v4;
  uint64_t v27 = v15;
  id v16 = v14;
  uint64_t v17 = *(void *)(a1 + 96);
  id v21 = v16;
  uint64_t v29 = v17;
  __int16 v30 = *(_WORD *)(a1 + 104);
  id v18 = *(id *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 80);
  id v22 = v18;
  uint64_t v28 = v19;
  id v23 = *(id *)(a1 + 56);
  dispatch_apply(v12, 0, v20);
  free(v4);

  _Block_object_dispose(v41, 8);
}

void __54__CSSearchQuery_copyResultsFromPlist_protectionClass___block_invoke_3(uint64_t a1, unint64_t a2)
{
  id v9 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0x400uLL / *(void *)(a1 + 64)];
  if (a2 <= 0x3FF)
  {
    do
    {
      unint64_t v2 = v2 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(a1 + 104);
      id v5 = objc_msgSend(*(id *)(a1 + 32), "copyCSSearchableItemWithValues:valueCount:attrKeys:protectionClass:mappingStrategy:attrInfo:requestedAttributeCount:unpackInfo:userFSDomain:", *(void *)(a1 + 72) + 8 * *(void *)(a1 + 80) * a2, *(__int16 *)(*(void *)(a1 + 32) + 24), *(void *)(a1 + 96), v2, *(void *)(a1 + 48));
      uint64_t v6 = *(void *)(a1 + 80);
      for (unint64_t i = v6 * a2; i < v6 * (a2 + 1); ++i)
      {
        id v8 = *(const void **)(*(void *)(a1 + 72) + 8 * i);
        if (v8)
        {
          CFRelease(v8);
          uint64_t v6 = *(void *)(a1 + 80);
        }
      }
      if (v5) {
        [v9 addObject:v5];
      }

      a2 += *(void *)(a1 + 64);
    }
    while (a2 < 0x400);
  }
  if ([v9 count])
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 88));
    [*(id *)(a1 + 56) addObjectsFromArray:v9];
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 88));
  }
}

- (void)addSuggestionCountQuery:(id)a3
{
  id v12 = a3;
  unint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = v12;
  suggestionCountQueries = v4->_suggestionCountQueries;
  if (!suggestionCountQueries)
  {
    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = v4->_suggestionCountQueries;
    v4->_suggestionCountQueries = v7;

    suggestionCountQueries = v4->_suggestionCountQueries;
    id v5 = v12;
  }
  [(NSMutableArray *)suggestionCountQueries addObject:v5];
  suggestionCountDispatchGroup = v4->_suggestionCountDispatchGroup;
  if (!suggestionCountDispatchGroup)
  {
    dispatch_group_t v10 = dispatch_group_create();
    int64_t v11 = v4->_suggestionCountDispatchGroup;
    v4->_suggestionCountDispatchGroup = (OS_dispatch_group *)v10;

    suggestionCountDispatchGroup = v4->_suggestionCountDispatchGroup;
  }
  dispatch_group_enter(suggestionCountDispatchGroup);
  objc_sync_exit(v4);
}

- (void)removeSuggestionCountQuery:(id)a3
{
  id v8 = a3;
  unint64_t v4 = self;
  objc_sync_enter(v4);
  suggestionCountDispatchGroup = v4->_suggestionCountDispatchGroup;
  if (suggestionCountDispatchGroup)
  {
    dispatch_group_leave(suggestionCountDispatchGroup);
    [(NSMutableArray *)v4->_suggestionCountQueries removeObject:v8];
    if (![(NSMutableArray *)v4->_suggestionCountQueries count])
    {
      suggestionCountQueries = v4->_suggestionCountQueries;
      v4->_suggestionCountQueries = 0;

      uint64_t v7 = v4->_suggestionCountDispatchGroup;
      v4->_suggestionCountDispatchGroup = 0;
    }
  }
  objc_sync_exit(v4);
}

- (id)processToMegadomePeopleSuggestions:(id)a3 resultsToMultiQuery:(id)a4 toSuggestions:(id)a5 processedSuggestions:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(CSSearchQuery *)self isCancelled])
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = [v12 count];
    if (v15 == [v11 count])
    {
      int v36 = self;
      if ([v12 count])
      {
        unint64_t v16 = 0;
        uint64_t v17 = 0;
        do
        {
          id v18 = [v11 objectAtIndexedSubscript:v16];
          uint64_t v19 = [v18 count];

          if (v19)
          {
            uint64_t v20 = [v12 objectAtIndexedSubscript:v16];
            id v21 = [v20 currentToken];
            [v21 setSelectedScope:1];

            id v22 = [v12 objectAtIndexedSubscript:v16];
            [v13 addObject:v22];

            ++v17;
          }
          ++v16;
        }
        while (v16 < [v12 count]);
      }
      else
      {
        uint64_t v17 = 0;
      }
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v37 = v10;
      id v24 = v10;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v39 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            if ([v13 containsObject:v29]) {
              [v14 addObject:v29];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v50 count:16];
        }
        while (v26);
      }

      id v23 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        __int16 v30 = [(CSSearchQuery *)v36 queryContext];
        uint64_t v31 = [v30 queryID];
        uint64_t v32 = [v13 count];
        uint64_t v33 = [v14 count];
        *(_DWORD *)buf = 134218752;
        uint64_t v43 = v31;
        __int16 v44 = 2048;
        uint64_t v45 = v32;
        __int16 v46 = 2048;
        uint64_t v47 = v17;
        __int16 v48 = 2048;
        uint64_t v49 = v33;
        _os_log_impl(&dword_18D0E3000, v23, OS_LOG_TYPE_INFO, "[MegadomeSearch]: qid: %lu, Processed suggestions: %lu, Recipient suggestions: %lu, Total trimmed suggestions: %lu", buf, 0x2Au);
      }
      id v10 = v37;
    }
    else
    {
      id v23 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        __int16 v35 = [(CSSearchQuery *)self queryContext];
        *(_DWORD *)buf = 134218496;
        uint64_t v43 = [v35 queryID];
        __int16 v44 = 2048;
        uint64_t v45 = [v12 count];
        __int16 v46 = 2048;
        uint64_t v47 = [v11 count];
        _os_log_fault_impl(&dword_18D0E3000, v23, OS_LOG_TYPE_FAULT, "[MegadomeSearch]: qid: %lu, toSuggestions.count %lu != resultsToMultiQuery.count %lu", buf, 0x20u);
      }
      uint64_t v14 = 0;
    }
  }

  return v14;
}

- (id)processFromMegadomePeopleSuggestions:(id)a3 resultsFromMultiQuery:(id)a4 fromSuggestions:(id)a5 processedSuggestions:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([(CSSearchQuery *)self isCancelled])
  {
    id v12 = 0;
  }
  else
  {
    if ([(CSSearchQueryContext *)self->_queryContext currentTokenScope] == 1
      || (uint64_t v13 = [v10 count], v13 == objc_msgSend(v9, "count")))
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      if ([(CSSearchQueryContext *)self->_queryContext currentTokenScope] != 1)
      {
        unint64_t v15 = 0;
        do
        {
          if (v15 >= [v10 count]) {
            break;
          }
          unint64_t v16 = [v9 objectAtIndexedSubscript:v15];
          uint64_t v17 = [v16 count];

          if (v17)
          {
            id v18 = [v10 objectAtIndexedSubscript:v15];
            uint64_t v19 = [v18 currentToken];
            [v19 setSelectedScope:0];

            uint64_t v20 = [v10 objectAtIndexedSubscript:v15];
            [v14 addObject:v20];

            id v21 = [v10 objectAtIndexedSubscript:v15];
            [v11 addObject:v21];
          }
          ++v15;
        }
        while ([(CSSearchQueryContext *)self->_queryContext currentTokenScope] != 1);
      }
      uint64_t v22 = [v10 count];
      uint64_t v23 = [v14 count];
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v22 - v23];
      if (v22 != v23)
      {
        long long v38 = v11;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v24 = [v10 differenceFromArray:v14];
        uint64_t v25 = [v24 insertions];

        uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v40 != v28) {
                objc_enumerationMutation(v25);
              }
              __int16 v30 = [*(id *)(*((void *)&v39 + 1) + 8 * i) object];
              [v12 addObject:v30];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v43 count:16];
          }
          while (v27);
        }

        uint64_t v31 = logForCSLogCategoryDefault();
        id v11 = v38;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = [(CSSearchQuery *)self queryContext];
          uint64_t v33 = [v32 queryID];
          uint64_t v34 = [v38 count];
          uint64_t v35 = [v14 count];
          *(_DWORD *)buf = 134218496;
          uint64_t v45 = v33;
          __int16 v46 = 2048;
          uint64_t v47 = v34;
          __int16 v48 = 2048;
          uint64_t v49 = v35;
          _os_log_impl(&dword_18D0E3000, v31, OS_LOG_TYPE_INFO, "[MegadomeSearch]: qid: %lu, Processed suggestions: %lu, Author suggestions: %lu", buf, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v14 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        id v37 = [(CSSearchQuery *)self queryContext];
        *(_DWORD *)buf = 134218496;
        uint64_t v45 = [v37 queryID];
        __int16 v46 = 2048;
        uint64_t v47 = [v10 count];
        __int16 v48 = 2048;
        uint64_t v49 = [v9 count];
        _os_log_fault_impl(&dword_18D0E3000, v14, OS_LOG_TYPE_FAULT, "[MegadomeSearch]: qid: %lu, fromSuggestions.count %lu != resultsFromMultiQuery.count %lu", buf, 0x20u);
      }
      id v12 = 0;
    }
  }

  return v12;
}

- (void)filterMegadomePeopleSuggestions:(id)a3 isShortQuery:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v58 = a4;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void))a5;
  id v52 = v7;
  if ([(CSSearchQuery *)self isCancelled])
  {
    v8[2](v8, 0);
    goto LABEL_33;
  }
  if (![v7 count])
  {
    ((void (**)(id, id))v8)[2](v8, v7);
    goto LABEL_33;
  }
  unint64_t v54 = self;
  uint64_t v51 = v8;
  uint64_t v72 = 0;
  __int16 v73 = &v72;
  uint64_t v74 = 0x3032000000;
  __int16 v75 = __Block_byref_object_copy__9;
  double v76 = __Block_byref_object_dispose__9;
  id v77 = 0;
  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count"));
  id v77 = (id)objc_claimAutoreleasedReturnValue();
  float v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v55 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v71 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v68 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (!v9) {
    goto LABEL_25;
  }
  uint64_t v59 = *(void *)v69;
  do
  {
    uint64_t v60 = v9;
    for (uint64_t i = 0; i != v60; ++i)
    {
      if (*(void *)v69 != v59) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v68 + 1) + 8 * i);
      id v12 = [v11 currentToken];
      BOOL v13 = v12 == 0;

      if (!v13)
      {
        if (v58)
        {
          uint64_t v14 = [v11 currentToken];
          if ([v14 isMailingList])
          {
            unint64_t v15 = [v11 currentToken];
            int v16 = [v15 isMegadomeToken];

            if (v16)
            {
              uint64_t v17 = (void *)v73[5];
LABEL_20:
              [v17 addObject:v11];
              continue;
            }
          }
          else
          {
          }
        }
        id v18 = [v11 currentToken];
        uint64_t v19 = [v18 itemSummary];
        if (v19)
        {
          uint64_t v20 = [v11 currentToken];
          id v21 = [v20 itemSummary];
          uint64_t v22 = [v21 emailAddresses];
          if (v22)
          {
            uint64_t v23 = [v11 currentToken];
            id v24 = [v23 itemSummary];
            uint64_t v25 = [v24 emailAddresses];
            BOOL v56 = [v25 count] == 0;

            if (v56) {
              continue;
            }
            uint64_t v26 = [(CSSearchQueryContext *)v54->_queryContext currentTokenScope];
            uint64_t v17 = v55;
            if (v26 != 1)
            {
              uint64_t v27 = [v11 currentToken];
              uint64_t v28 = [v27 itemSummary];
              uint64_t v29 = [v28 emailAddresses];
              [v53 addObject:v29];

              uint64_t v17 = v55;
            }
            goto LABEL_20;
          }
        }
      }
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
  }
  while (v9);
LABEL_25:

  __int16 v30 = [(CSSearchQuery *)v54 queryContext];
  uint64_t v31 = +[CSUserQuery generateFilterQueriesBasedOnPreviousSuggestions:v30];

  uint64_t v32 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    uint64_t v33 = [(CSSearchQuery *)v54 queryContext];
    uint64_t v34 = [v33 queryID];
    uint64_t v35 = [obj count];
    uint64_t v36 = [(id)v73[5] count];
    uint64_t v37 = [v53 count];
    *(_DWORD *)buf = 134218752;
    *(void *)&uint8_t buf[4] = v34;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v79 = v36;
    __int16 v80 = 2048;
    uint64_t v81 = v37;
    _os_log_impl(&dword_18D0E3000, v32, OS_LOG_TYPE_INFO, "[MegadomeSearch]: qid: %lu, Total entries: %lu, Cached suggestions: %lu, Fresh entries: %lu", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v79) = 0;
  long long v38 = [(CSSearchQuery *)v54 queryContext];
  long long v39 = [v38 suggestion];
  if (v39)
  {
    long long v40 = [(CSSearchQuery *)v54 queryContext];
    long long v41 = [v40 suggestion];
    long long v42 = [v41 previousSuggestionTokens];
    BOOL v43 = [v42 count] != 0;
  }
  else
  {
    BOOL v43 = 0;
  }

  LOBYTE(v79) = v43;
  __int16 v44 = (void *)[v53 copy];
  uint64_t v45 = [(CSSearchQuery *)v54 queryContext];
  uint64_t v46 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke;
  v61[3] = &unk_1E5549030;
  v61[4] = v54;
  id v62 = obj;
  id v47 = v55;
  id v63 = v47;
  long long v66 = &v72;
  id v65 = v51;
  id v48 = v31;
  id v64 = v48;
  long long v67 = buf;
  uint64_t v49 = +[_CSMultiQuery countingQueryForEmailsArrays:v44 scope:1 context:v45 contextualFilterQueries:v48 includeSecondaryRecipients:v46 completionHandler:v61];
  megadomeCountingQuerySearchFrouint64_t m = v54->_megadomeCountingQuerySearchFrom;
  v54->_megadomeCountingQuerySearchFrouint64_t m = (_CSMultiQuery *)v49;

  [(_CSMultiQuery *)v54->_megadomeCountingQuerySearchFrom start];
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v72, 8);
  id v8 = (void (**)(id, void))v51;
LABEL_33:
}

void __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = (void *)[*(id *)(a1 + 48) copy];
  id v7 = [v4 processFromMegadomePeopleSuggestions:v5 resultsFromMultiQuery:v3 fromSuggestions:v6 processedSuggestions:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

  if (!v7)
  {
LABEL_18:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_19;
  }
  if ([v7 count])
  {
    id v38 = v3;
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v44;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v43 + 1) + 8 * v13) currentToken];
          unint64_t v15 = [v14 itemSummary];
          int v16 = [v15 emailAddresses];
          [v8 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v11);
    }

    uint64_t v17 = [*(id *)(a1 + 32) queryContext];
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v19 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke_1046;
    v39[3] = &unk_1E5549008;
    uint64_t v20 = *(void **)(a1 + 40);
    v39[4] = *(void *)(a1 + 32);
    id v40 = v20;
    id v41 = v9;
    long long v37 = *(_OWORD *)(a1 + 64);
    id v21 = (id)v37;
    long long v42 = v37;
    uint64_t v22 = +[_CSMultiQuery countingQueryForEmailsArrays:v8 scope:2 context:v17 contextualFilterQueries:v18 includeSecondaryRecipients:v19 completionHandler:v39];
    uint64_t v23 = *(void *)(a1 + 32);
    id v24 = *(void **)(v23 + 104);
    *(void *)(v23 + 104) = v22;

    [*(id *)(*(void *)(a1 + 32) + 104) start];
    id v3 = v38;
    goto LABEL_19;
  }
  uint64_t v25 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
  uint64_t v26 = logForCSLogCategoryDefault();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
  if (!v25)
  {
    if (v27) {
      __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke_cold_1(v26, v28, v29, v30, v31, v32, v33, v34);
    }

    goto LABEL_18;
  }
  if (v27) {
    __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke_cold_2(v26, v28, v29, v30, v31, v32, v33, v34);
  }

  uint64_t v35 = *(void *)(a1 + 64);
  uint64_t v36 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) copy];
  (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v36);

LABEL_19:
}

void __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke_1046(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = (void *)a1[6];
  id v6 = a2;
  id v7 = (void *)[v5 copy];
  id v11 = [v3 processToMegadomePeopleSuggestions:v4 resultsToMultiQuery:v6 toSuggestions:v7 processedSuggestions:*(void *)(*(void *)(a1[8] + 8) + 40)];

  uint64_t v8 = [v11 count];
  uint64_t v9 = a1[7];
  if (v8)
  {
    uint64_t v10 = (void *)[v11 copy];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
}

- (void)filterZKWPeopleSuggestions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_cancelled)
  {
    if ([v6 count])
    {
      uint64_t v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      id location = 0;
      objc_initWeak(&location, self);
      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x3032000000;
      uint64_t v26 = __Block_byref_object_copy__9;
      BOOL v27 = __Block_byref_object_dispose__9;
      id v28 = 0;
      queryString = self->_queryString;
      uint64_t v10 = [(CSSearchQuery *)self queryContext];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      int v16 = __62__CSSearchQuery_filterZKWPeopleSuggestions_completionHandler___block_invoke;
      uint64_t v17 = &unk_1E554C610;
      objc_copyWeak(&v22, &location);
      id v18 = v6;
      id v21 = &v23;
      id v20 = v7;
      id v11 = v8;
      uint64_t v19 = v11;
      uint64_t v12 = +[_CSMultiQuery countingQueryWithPeopleSuggestions:v18 filterQuery:queryString context:v10 completionHandler:&v14];
      uint64_t v13 = (void *)v24[5];
      v24[5] = v12;

      -[CSSearchQuery addSuggestionCountQuery:](self, "addSuggestionCountQuery:", v24[5], v14, v15, v16, v17);
      [(id)v24[5] start];
      dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      _Block_object_dispose(&v23, 8);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, id))v7 + 2))(v7, v6);
    }
  }
}

void __62__CSSearchQuery_filterZKWPeopleSuggestions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v7 = [*(id *)(a1 + 32) count];
  if (v7 == [v3 count])
  {
    if ([*v5 count])
    {
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = [v3 objectAtIndexedSubscript:v8];
        uint64_t v10 = [v9 count];

        if (v10)
        {
          id v11 = [*v5 objectAtIndexedSubscript:v8];
          [v6 addObject:v11];
        }
        ++v8;
      }
      while (v8 < [*v5 count]);
    }
  }
  else
  {
    uint64_t v12 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __62__CSSearchQuery_filterZKWPeopleSuggestions_completionHandler___block_invoke_cold_1((id *)(a1 + 32), v3);
    }
  }
  [WeakRetained removeSuggestionCountQuery:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)populateSuggestionCount:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (!self->_cancelled)
  {
    if ([v6 count]
      && _os_feature_enabled_impl()
      && ([(CSSearchQuery *)self queryContext],
          unint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 enableResultCountsPerSuggestion],
          v8,
          (v9 & 1) != 0))
    {
      id location = 0;
      objc_initWeak(&location, self);
      uint64_t v18 = 0;
      uint64_t v19 = &v18;
      uint64_t v20 = 0x3032000000;
      id v21 = __Block_byref_object_copy__9;
      id v22 = __Block_byref_object_dispose__9;
      id v23 = 0;
      uint64_t v10 = [(CSSearchQuery *)self queryContext];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __59__CSSearchQuery_populateSuggestionCount_completionHandler___block_invoke;
      v13[3] = &unk_1E554C638;
      objc_copyWeak(&v17, &location);
      id v14 = v6;
      uint64_t v15 = v7;
      int v16 = &v18;
      uint64_t v11 = +[_CSMultiQuery countingQueryWithSuggestions:v14 context:v10 completionHandler:v13];
      uint64_t v12 = (void *)v19[5];
      v19[5] = v11;

      [(CSSearchQuery *)self addSuggestionCountQuery:v19[5]];
      [(id)v19[5] start];
      _Block_object_dispose(&v18, 8);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      v7[2](v7);
    }
  }
}

void __59__CSSearchQuery_populateSuggestionCount_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = (id *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 32) count];
  if (v6 == [v3 count])
  {
    if ([*v5 count])
    {
      unint64_t v7 = 0;
      do
      {
        unint64_t v8 = [v3 objectAtIndexedSubscript:v7];
        uint64_t v9 = [v8 count];
        uint64_t v10 = [*v5 objectAtIndexedSubscript:v7];
        [v10 setResultCount:v9];

        ++v7;
      }
      while (v7 < [*v5 count]);
    }
  }
  else
  {
    uint64_t v11 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __62__CSSearchQuery_filterZKWPeopleSuggestions_completionHandler___block_invoke_cold_1((id *)(a1 + 32), v3);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [WeakRetained removeSuggestionCountQuery:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)processInstantAnswer:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    int64_t v5 = [(CSSearchQueryContext *)self->_queryContext queryID];
    uint64_t v6 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218240;
      int64_t v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = [v4 count];
      _os_log_impl(&dword_18D0E3000, v6, OS_LOG_TYPE_DEFAULT, "qid=%ld - Found: %ld instant answers", (uint8_t *)&v7, 0x16u);
    }

    [(CSSearchQuery *)self handleFoundInstantAnswers:v4];
  }
}

- (void)processSuggestions:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    int64_t v5 = [(CSSearchQueryContext *)self->_queryContext queryID];
    uint64_t v6 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218240;
      int64_t v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = [v4 count];
      _os_log_impl(&dword_18D0E3000, v6, OS_LOG_TYPE_DEFAULT, "qid=%ld - Found: %ld suggestions", (uint8_t *)&v7, 0x16u);
    }

    [(CSSearchQuery *)self handleFoundSuggestions:v4];
  }
}

void __36__CSSearchQuery_processResultItems___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  if ([v4 count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v4];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  objc_sync_exit(v3);
}

void __36__CSSearchQuery_processResultItems___block_invoke_1070(uint64_t a1, void *a2)
{
}

- (void)processCompletionsResultsData:(id)a3 protectionClass:(id)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v60 = a4;
  id v7 = v6;
  [v7 bytes];
  uint64_t v59 = v7;
  [v7 length];
  id Trusted = (void *)_MDPlistBytesCreateTrusted();
  long long v68 = self;
  id v61 = Trusted;
  if (Trusted)
  {
    __int16 v9 = (void *)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    id v10 = 0;
    id v63 = 0;
    id v64 = 0;
    if (objc_opt_isKindOfClass())
    {
      BOOL v58 = v9;
      if ([v9 count])
      {
        id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v11 = [(CSSearchQuery *)self queryContext];
        if ([v11 generateSuggestions]) {
          id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        else {
          id v64 = 0;
        }

        uint64_t v12 = [(CSSearchQuery *)self queryContext];
        if ([v12 generateSuggestions]) {
          id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        else {
          id v62 = 0;
        }

        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        obuint64_t j = v9;
        uint64_t v72 = [obj countByEnumeratingWithState:&v85 objects:v90 count:16];
        if (v72)
        {
          uint64_t v70 = *(void *)v86;
          do
          {
            for (uint64_t i = 0; i != v72; ++i)
            {
              if (*(void *)v86 != v70) {
                objc_enumerationMutation(obj);
              }
              id v14 = *(void **)(*((void *)&v85 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v15 = [v14 firstObject];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v63 addObject:v15];
                  long long v71 = objc_msgSend(v14, "subarrayWithRange:", 1, objc_msgSend(v14, "count") - 2);
                  long long v67 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v14, "count") - 1);
                  if (v71)
                  {
                    int v16 = [(CSSearchQuery *)v68 completionScoresHandler];
                    BOOL v17 = v16 == 0;

                    if (!v17)
                    {
                      uint64_t v18 = [(CSSearchQuery *)v68 completionScoresHandler];
                      ((void (**)(void, void *, void *, void *))v18)[2](v18, v15, v71, v67);
                    }
                  }
                  if (v64)
                  {
                    uint64_t v19 = [CSSuggestion alloc];
                    uint64_t v20 = [(CSSearchQuery *)v68 queryContext];
                    id v21 = [v20 userQuery];
                    id v22 = [(CSSearchQuery *)v68 queryContext];
                    id v23 = [v22 suggestion];
                    long long v69 = [(CSSuggestion *)v19 initWithUserString:v21 currentSuggestion:v23 displayString:v15 attributeValues:v71 attributeStrings:v67 options:MEMORY[0x1E4F1CC08]];

                    if (v69)
                    {
                      id v24 = [(CSSearchQuery *)v68 queryContext];
                      -[CSSuggestion setEnableFragments:](v69, "setEnableFragments:", [v24 enableSuggestionTokens]);

                      uint64_t v25 = [(CSSuggestion *)v69 currentToken];
                      BOOL v26 = [v25 tokenKind] == 16;

                      if (v26)
                      {
                        id v65 = [(CSSearchQuery *)v68 queryContext];
                        id v73 = [v65 suggestion];
                        BOOL v27 = [v73 previousSuggestionTokens];
                        if (![v27 count])
                        {
LABEL_44:

                          goto LABEL_45;
                        }
                        id v28 = [(CSSuggestion *)v69 currentToken];
                        uint64_t v29 = [v28 itemSummary];
                        uint64_t v30 = [v29 allEmailAddresses];
                        BOOL v31 = [v30 count] == 0;

                        if (!v31)
                        {
                          uint64_t v32 = (void *)MEMORY[0x1E4F1CAD0];
                          uint64_t v33 = [(CSSuggestion *)v69 currentToken];
                          uint64_t v34 = [v33 itemSummary];
                          uint64_t v35 = [v34 allEmailAddresses];
                          id v65 = [v32 setWithArray:v35];

                          long long v84 = 0u;
                          long long v82 = 0u;
                          long long v83 = 0u;
                          long long v81 = 0u;
                          uint64_t v36 = [(CSSearchQuery *)v68 queryContext];
                          long long v37 = [v36 suggestion];
                          id v73 = [v37 previousSuggestionTokens];

                          uint64_t v38 = [v73 countByEnumeratingWithState:&v81 objects:v89 count:16];
                          if (v38)
                          {
                            uint64_t v39 = *(void *)v82;
                            while (2)
                            {
                              for (uint64_t j = 0; j != v38; ++j)
                              {
                                if (*(void *)v82 != v39) {
                                  objc_enumerationMutation(v73);
                                }
                                id v41 = *(void **)(*((void *)&v81 + 1) + 8 * j);
                                if ([v41 tokenKind] == 16)
                                {
                                  long long v42 = [v41 itemSummary];
                                  if (v42)
                                  {
                                    long long v43 = [v41 itemSummary];
                                    long long v44 = [v43 allEmailAddresses];
                                    BOOL v45 = [v44 count] == 0;

                                    if (!v45)
                                    {
                                      long long v46 = (void *)MEMORY[0x1E4F1CAD0];
                                      id v47 = [v41 itemSummary];
                                      uint64_t v48 = [v47 allEmailAddresses];
                                      uint64_t v49 = [v46 setWithArray:v48];
                                      LODWORD(v46) = [v65 intersectsSet:v49];

                                      if (v46)
                                      {
                                        if (![v41 selectedScope])
                                        {
                                          BOOL v27 = [(CSSuggestion *)v69 currentToken];
                                          [v27 setSelectedScope:1];
                                          goto LABEL_44;
                                        }
                                        if ([v41 selectedScope] == 1)
                                        {
                                          BOOL v27 = [(CSSuggestion *)v69 currentToken];
                                          [v27 setSelectedScope:0];
                                          goto LABEL_44;
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                              uint64_t v38 = [v73 countByEnumeratingWithState:&v81 objects:v89 count:16];
                              if (v38) {
                                continue;
                              }
                              break;
                            }
                          }
LABEL_45:
                        }
                        [v62 addObject:v69];
                      }
                      else
                      {
                        [v64 addObject:v69];
                      }
                    }
                  }
                }

                continue;
              }
            }
            uint64_t v72 = [obj countByEnumeratingWithState:&v85 objects:v90 count:16];
          }
          while (v72);
        }

        uint64_t v75 = 0;
        double v76 = &v75;
        uint64_t v77 = 0x3032000000;
        uint64_t v78 = __Block_byref_object_copy__9;
        uint64_t v79 = __Block_byref_object_dispose__9;
        id v80 = 0;
        id v10 = v62;
        id v80 = v10;
        uint64_t v50 = [(CSSearchQuery *)v68 queryContext];
        int v51 = [v50 pommesZKW];

        if (v51)
        {
          v74[0] = MEMORY[0x1E4F143A8];
          v74[1] = 3221225472;
          v74[2] = __63__CSSearchQuery_processCompletionsResultsData_protectionClass___block_invoke;
          v74[3] = &unk_1E55483C0;
          v74[4] = &v75;
          [(CSSearchQuery *)v68 filterZKWPeopleSuggestions:v10 completionHandler:v74];
        }
        [(CSSearchQuery *)v68 processSuggestions:v76[5]];
        _Block_object_dispose(&v75, 8);
      }
      else
      {
        id v10 = 0;
        id v63 = 0;
        id v64 = 0;
      }
      __int16 v9 = v58;
    }

    id Trusted = v63;
  }
  else
  {
    id v10 = 0;
    id v64 = 0;
  }
  id v52 = Trusted;
  if ([Trusted count] || objc_msgSend(v64, "count"))
  {
    [(CSSearchQueryContext *)v68->_queryContext queryID];
    if (v68->_cancelled)
    {
      float v53 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
        -[CSSearchQuery processResultItems:]();
      }
    }
    else
    {
      unint64_t v54 = [(CSSearchQuery *)v68 completionsHandler];
      if (v54)
      {
        BOOL v55 = [v52 count] == 0;

        if (!v55)
        {
          BOOL v56 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
            -[CSSearchQuery processCompletionsResultsData:protectionClass:]();
          }

          unint64_t v57 = [(CSSearchQuery *)v68 completionsHandler];
          ((void (**)(void, void *))v57)[2](v57, v52);
        }
      }
      if ([v64 count]) {
        [(CSSearchQuery *)v68 handleFoundCompletions:v64];
      }
    }
  }
}

void __63__CSSearchQuery_processCompletionsResultsData_protectionClass___block_invoke(uint64_t a1, void *a2)
{
}

- (void)didFinishWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CSSearchQuery_didFinishWithError___block_invoke;
  v7[3] = &unk_1E5548FE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __36__CSSearchQuery_didFinishWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:*(void *)(a1 + 40)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setQueryString:(id)a3
{
}

- (void)setQueryContext:(id)a3
{
}

- (NSMapTable)liveIndexBundleIDToIndexItemIDMap
{
  return self->_liveIndexBundleIDToIndexItemIDMap;
}

- (void)setLiveIndexBundleIDToIndexItemIDMap:(id)a3
{
}

- (NSMapTable)liveIndexBundleIDToBundleString
{
  return self->_liveIndexBundleIDToBundleString;
}

- (void)setLiveIndexBundleIDToBundleString:(id)a3
{
}

- (NSMapTable)liveIndexUserFSOIDTOIdentifierMap
{
  return self->_liveIndexUserFSOIDTOIdentifierMap;
}

- (void)setLiveIndexUserFSOIDTOIdentifierMap:(id)a3
{
}

- (id)priorityGatherEndedHandler
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setPriorityGatherEndedHandler:(id)a3
{
}

- (id)changedItemsHandler
{
  return objc_getProperty(self, a2, 200, 1);
}

- (id)removedItemsHandler
{
  return objc_getProperty(self, a2, 208, 1);
}

- (id)foundAttributesHandler
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setFoundAttributesHandler:(id)a3
{
}

- (id)changedAttributesHandler
{
  return objc_getProperty(self, a2, 224, 1);
}

- (void)setChangedAttributesHandler:(id)a3
{
}

- (id)photosComputedAttributesHandler
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setPhotosComputedAttributesHandler:(id)a3
{
}

- (id)countChangedHandler
{
  return objc_getProperty(self, a2, 240, 1);
}

- (void)setCountChangedHandler:(id)a3
{
}

- (id)resolvedAttributeNamesHandler
{
  return objc_getProperty(self, a2, 248, 1);
}

- (void)setResolvedAttributeNamesHandler:(id)a3
{
}

- (id)completionsHandler
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setCompletionsHandler:(id)a3
{
}

- (id)completionScoresHandler
{
  return objc_getProperty(self, a2, 264, 1);
}

- (void)setCompletionScoresHandler:(id)a3
{
}

- (void)setFoundItemHandler:(id)a3
{
}

- (id)interruptedHandler
{
  return objc_getProperty(self, a2, 280, 1);
}

- (void)setInterruptedHandler:(id)a3
{
}

- (id)restartedHandler
{
  return objc_getProperty(self, a2, 288, 1);
}

- (void)setRestartedHandler:(id)a3
{
}

- (id)restartGatherEndedHandler
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setRestartGatherEndedHandler:(id)a3
{
}

- (void)setPrivateIndex:(BOOL)a3
{
  self->_privateIndex = a3;
}

- (void)setUserFSIndex:(BOOL)a3
{
  self->_userFSIndex = a3;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (NSString)privateBundleID
{
  return self->_privateBundleID;
}

- (void)setPrivateBundleID:(id)a3
{
}

- (void)setPrivateQuery:(BOOL)a3
{
  self->_privateQuery = a3;
}

- (void)updateQueryString:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "updateWithQueryString:%@", v2, v3, v4, v5, v6);
}

- (void)updateQueryContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "updateQueryContext:%@", v2, v3, v4, v5, v6);
}

- (void)initWithQueryString:queryContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "initWithQueryString:%@", v2, v3, v4, v5, v6);
}

- (void)_finishWithError:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10_0(&dword_18D0E3000, v0, v1, "qid=%ld - Finished with error error:%@");
}

void __70__CSSearchQuery_didResolveFriendlyAttributeNames_fromFetchAttributes___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14();
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_1_1(&dword_18D0E3000, v1, v2, "qid=%ld - Resolved attribute names: %@", v3);
}

void __62__CSSearchQuery_processAttributesData_update_protectionClass___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "qid=%ld - Dropping results", v2, v3, v4, v5, v6);
}

- (void)copyResultsFromPlist:protectionClass:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_1_1(&dword_18D0E3000, v1, (uint64_t)v1, "qid=%ld - Plists count %ld ", v2);
}

void __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __80__CSSearchQuery_filterMegadomePeopleSuggestions_isShortQuery_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__CSSearchQuery_filterZKWPeopleSuggestions_completionHandler___block_invoke_cold_1(id *a1, void *a2)
{
  [*a1 count];
  [a2 count];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12_0(&dword_18D0E3000, v3, v4, "suggestions.count %lu != results.count %lu", v5, v6, v7, v8, v9);
}

- (void)processResultItems:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "qid=%ld - Dropping results", v2, v3, v4, v5, v6);
}

- (void)processCompletionsResultsData:protectionClass:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_1(&dword_18D0E3000, v0, (uint64_t)v0, "qid=%ld - Got completions %@", v1);
}

void __64__CSSearchQuery_processLiveResultsData_oidData_protectionClass___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_11(&dword_18D0E3000, v0, v1, "qid=%ld - Opcode 0x%x not handled", v2, v3);
}

void __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_11(&dword_18D0E3000, v0, v1, "qid=%ld - Unknown type :%d", v2, v3);
}

void __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_13_0();
  __int16 v4 = 2048;
  uint64_t v5 = v0;
  OUTLINED_FUNCTION_1_1(&dword_18D0E3000, v1, v2, "qid=%ld - Result oidData: %p", v3);
}

void __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "qid=%ld - Dropping results", v2, v3, v4, v5, v6);
}

void __88__CSSearchQuery_didReturnResults_resultsData_oidData_protectionClass_completionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3_3();
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  qos_class_t v2 = qos_class_self();
  uint64_t v3 = *(void *)(v1 + 72);
  int v4 = *(unsigned __int8 *)(v1 + 88);
  int v5 = *(unsigned __int8 *)(v1 + 89);
  int v6 = *(unsigned __int8 *)(v1 + 90);
  v7[0] = 67110144;
  v7[1] = v2;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  __int16 v10 = 1024;
  int v11 = v4;
  __int16 v12 = 1024;
  int v13 = v5;
  __int16 v14 = 1024;
  int v15 = v6;
  _os_log_debug_impl(&dword_18D0E3000, v0, OS_LOG_TYPE_DEBUG, "[QoS] %u qid=%ld didReturnResults inside method async call. attribute:%b counting:%b live:%b", (uint8_t *)v7, 0x24u);
}

@end