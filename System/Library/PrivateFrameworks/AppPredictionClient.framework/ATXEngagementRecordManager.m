@interface ATXEngagementRecordManager
+ (ATXEngagementRecordManager)sharedInstance;
- (ATXEngagementRecordManager)init;
- (ATXEngagementRecordManager)initWithCacheDirectory:(id)a3;
- (BOOL)_writeData:(id)a3;
- (BOOL)hasEngagedWithExecutable:(id)a3 engagedExecutables:(id)a4;
- (BOOL)hasEngagedWithExecutable:(id)a3 engagementRecordType:(unint64_t)a4;
- (BOOL)hasEngagedWithSuggestion:(id)a3 engagedExecutables:(id)a4;
- (BOOL)hasEngagedWithSuggestion:(id)a3 engagementRecordType:(unint64_t)a4;
- (BOOL)hasReferenceForSuggestion:(id)a3;
- (NSString)description;
- (double)minDurationForTrackedReferencesToStayAround;
- (id)_engagedEntriesNoSync;
- (id)_engagedEntriesNoSyncOfType:(unint64_t)a3 queryOptions:(unint64_t)a4;
- (id)_identifiersFromEntries:(id)a3;
- (id)_readData;
- (id)engagedExecutablesOfType:(unint64_t)a3 queryOptions:(unint64_t)a4;
- (id)jsonDict;
- (unint64_t)_referenceCountForExecutable:(id)a3;
- (void)_addEngagedExcutableNoSync:(id)a3 clientModelId:(id)a4 type:(unint64_t)a5;
- (void)_addEngagedSuggestionNoSync:(id)a3 type:(unint64_t)a4;
- (void)_addHiddenSuggestionNoSync:(id)a3 duration:(double)a4 engagementRecordType:(unint64_t)a5;
- (void)_engagedEntriesNoSync;
- (void)_filterOutExplicitEngagementsThatShouldNotClearOnEngagement:(id)a3;
- (void)_logDidAddEntryToBiomeStream:(id)a3;
- (void)_readData;
- (void)_removeEngagedSuggestionsIfPossibleNoSync;
- (void)_removeEngagementsOnQueuePassingTest:(id)a3;
- (void)_serializeAndWriteNoSyncSet:(id)a3;
- (void)addEngagedExecutable:(id)a3 clientModelId:(id)a4 engagementRecordType:(unint64_t)a5;
- (void)addEngagedSuggestion:(id)a3 engagementRecordType:(unint64_t)a4;
- (void)addHiddenSuggestion:(id)a3 duration:(double)a4 engagementRecordType:(unint64_t)a5;
- (void)fetchEngagedEntriesWithCompletionHandler:(id)a3;
- (void)removeAllEngagementsForSuggestion:(id)a3;
- (void)removeAllEngagementsOfRecordType:(unint64_t)a3;
- (void)removeAllEngagementsWithCompletion:(id)a3;
- (void)removeEngagementForExecutableIdentifier:(id)a3 recordType:(unint64_t)a4 abortingRemovalIfEngagementDateIsLaterThanDate:(id)a5;
- (void)removeEngagementForSuggestion:(id)a3 recordType:(unint64_t)a4;
- (void)setMinDurationForTrackedReferencesToStayAround:(double)a3;
- (void)updateForClientModelCacheUpdate:(id)a3 clientModelId:(id)a4;
@end

@implementation ATXEngagementRecordManager

+ (ATXEngagementRecordManager)sharedInstance
{
  if (sharedInstance__pasOnceToken6_5 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_5, &__block_literal_global_34);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_6;

  return (ATXEngagementRecordManager *)v2;
}

void __44__ATXEngagementRecordManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_6;
  sharedInstance__pasExprOnceResult_6 = v1;
}

- (ATXEngagementRecordManager)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionCacheDirectory];
  v4 = [(ATXEngagementRecordManager *)self initWithCacheDirectory:v3];

  return v4;
}

- (ATXEngagementRecordManager)initWithCacheDirectory:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXEngagementRecordManager;
  v5 = [(ATXEngagementRecordManager *)&v18 init];
  v6 = v5;
  if (v5)
  {
    v5->_minDurationForTrackedReferencesToStayAround = 900.0;
    uint64_t v7 = [v4 stringByAppendingPathComponent:@"ATXEngagementRecords.pb"];
    path = v6->_path;
    v6->_path = (NSString *)v7;

    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    id v10 = objc_claimAutoreleasedReturnValue();
    v11 = (const char *)[v10 UTF8String];
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    v15 = [[ATXExecutableReferenceManager alloc] initWithCacheDirectory:v4 minDurationForTrackedReferencesToStayAround:v6->_minDurationForTrackedReferencesToStayAround];
    referenceManager = v6->_referenceManager;
    v6->_referenceManager = v15;
  }
  return v6;
}

- (NSString)description
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  id v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__ATXEngagementRecordManager_description__block_invoke;
  v5[3] = &unk_1E5D06DE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __41__ATXEngagementRecordManager_description__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _engagedEntriesNoSync];
  uint64_t v2 = [v5 description];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)jsonDict
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ATXEngagementRecordManager_jsonDict__block_invoke;
  block[3] = &unk_1E5D04FC8;
  block[4] = self;
  id v9 = v3;
  id v5 = v3;
  dispatch_sync(queue, block);
  id v10 = @"engagedEntries";
  v11[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v6;
}

void __38__ATXEngagementRecordManager_jsonDict__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_engagedEntriesNoSync", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) jsonDict];
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)updateForClientModelCacheUpdate:(id)a3 clientModelId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__ATXEngagementRecordManager_updateForClientModelCacheUpdate_clientModelId___block_invoke;
  block[3] = &unk_1E5D05D78;
  id v12 = v7;
  dispatch_queue_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __76__ATXEngagementRecordManager_updateForClientModelCacheUpdate_clientModelId___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)os_transaction_create();
  uint64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "Began updating recently engaged cache for client model with id: %@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v5 + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__ATXEngagementRecordManager_updateForClientModelCacheUpdate_clientModelId___block_invoke_16;
  v9[3] = &unk_1E5D05D78;
  v9[4] = v5;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 32);
  [v6 performBatchUpdateOfReferencesWithBlock:v9];
  id v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Finished updating recently engaged cache for client model with id: %@", buf, 0xCu);
  }
}

uint64_t __76__ATXEngagementRecordManager_updateForClientModelCacheUpdate_clientModelId___block_invoke_16(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeEngagedSuggestionsIfPossibleNoSync];
  if (![*(id *)(a1 + 40) count])
  {
LABEL_4:
    [*(id *)(*(void *)(a1 + 32) + 8) markReferencesAsPurgableFromClientModelIdIfPossible:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 8) purgeReferencesForSuggestions:*(void *)(a1 + 40) clientModelId:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _removeEngagedSuggestionsIfPossibleNoSync];
    [*(id *)(*(void *)(a1 + 32) + 8) addReferencesForSuggestions:*(void *)(a1 + 40) clientModelId:*(void *)(a1 + 48)];
    goto LABEL_6;
  }
  uint64_t v2 = [*(id *)(a1 + 40) firstObject];
  uint64_t v3 = [v2 clientModelSpecification];
  uint64_t v4 = [v3 engagementResetPolicy];

  if (v4 != 1)
  {
    if (v4) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  [*(id *)(*(void *)(a1 + 32) + 8) updateReferencesForProactiveSuggestions:*(void *)(a1 + 40) clientModelId:*(void *)(a1 + 48)];
LABEL_6:
  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 _removeEngagedSuggestionsIfPossibleNoSync];
}

- (BOOL)hasEngagedWithSuggestion:(id)a3 engagementRecordType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__ATXEngagementRecordManager_hasEngagedWithSuggestion_engagementRecordType___block_invoke;
  v10[3] = &unk_1E5D07140;
  id v12 = &v14;
  unint64_t v13 = a4;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __76__ATXEngagementRecordManager_hasEngagedWithSuggestion_engagementRecordType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__ATXEngagementRecordManager_hasEngagedWithSuggestion_engagementRecordType___block_invoke_2;
  v6[3] = &unk_1E5D07140;
  uint64_t v3 = *(void *)(a1 + 56);
  v6[4] = v1;
  uint64_t v8 = v3;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [v2 performBatchUpdateOfReferencesWithBlock:v6];
}

void __76__ATXEngagementRecordManager_hasEngagedWithSuggestion_engagementRecordType___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeEngagedSuggestionsIfPossibleNoSync];
  id v5 = [*(id *)(a1 + 32) _engagedEntriesNoSyncOfType:*(void *)(a1 + 56) queryOptions:0];
  [*(id *)(a1 + 32) _filterOutExplicitEngagementsThatShouldNotClearOnEngagement:v5];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2 _identifiersFromEntries:v5];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 hasEngagedWithSuggestion:v3 engagedExecutables:v4];
}

- (BOOL)hasEngagedWithSuggestion:(id)a3 engagedExecutables:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v7 = ATXAllowedEngagementRecordManagerClasses();
  uint64_t v8 = [v5 executableSpecification];
  id v9 = [v8 executableClassString];
  int v10 = [v7 containsObject:v9];

  if (v10)
  {
    id v11 = ATXExecutableIdentifierForSuggestion(v5);
    char v12 = [v6 containsObject:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)hasEngagedWithExecutable:(id)a3 engagementRecordType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__ATXEngagementRecordManager_hasEngagedWithExecutable_engagementRecordType___block_invoke;
  v10[3] = &unk_1E5D07140;
  char v12 = &v14;
  unint64_t v13 = a4;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __76__ATXEngagementRecordManager_hasEngagedWithExecutable_engagementRecordType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__ATXEngagementRecordManager_hasEngagedWithExecutable_engagementRecordType___block_invoke_2;
  v6[3] = &unk_1E5D07140;
  uint64_t v3 = *(void *)(a1 + 56);
  v6[4] = v1;
  uint64_t v8 = v3;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [v2 performBatchUpdateOfReferencesWithBlock:v6];
}

void __76__ATXEngagementRecordManager_hasEngagedWithExecutable_engagementRecordType___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeEngagedSuggestionsIfPossibleNoSync];
  id v3 = [*(id *)(a1 + 32) _engagedEntriesNoSyncOfType:*(void *)(a1 + 56) queryOptions:0];
  [*(id *)(a1 + 32) _filterOutExplicitEngagementsThatShouldNotClearOnEngagement:v3];
  uint64_t v2 = [*(id *)(a1 + 32) _identifiersFromEntries:v3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) hasEngagedWithExecutable:*(void *)(a1 + 40) engagedExecutables:v2];
}

- (BOOL)hasEngagedWithExecutable:(id)a3 engagedExecutables:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  long long v7 = [[ATXExecutableIdentifier alloc] initWithString:v6];

  LOBYTE(v6) = [v5 containsObject:v7];
  return (char)v6;
}

- (void)_filterOutExplicitEngagementsThatShouldNotClearOnEngagement:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__ATXEngagementRecordManager__filterOutExplicitEngagementsThatShouldNotClearOnEngagement___block_invoke;
  v6[3] = &unk_1E5D07168;
  v6[4] = self;
  id v4 = a3;
  id v5 = [v3 predicateWithBlock:v6];
  [v4 filterUsingPredicate:v5];
}

uint64_t __90__ATXEngagementRecordManager__filterOutExplicitEngagementsThatShouldNotClearOnEngagement___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 engagementRecordType] & 0x78) == 0 && (objc_msgSend(v3, "engagementRecordType"))
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 8);
    id v6 = [v3 executable];
    uint64_t v4 = [v5 canExecutableClearOnEngagement:v6];
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

- (id)engagedExecutablesOfType:(unint64_t)a3 queryOptions:(unint64_t)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__7;
  char v12 = __Block_byref_object_dispose__7;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__ATXEngagementRecordManager_engagedExecutablesOfType_queryOptions___block_invoke;
  v7[3] = &unk_1E5D07190;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(queue, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __68__ATXEngagementRecordManager_engagedExecutablesOfType_queryOptions___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  long long v1 = *(_OWORD *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 48);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v5[1] = 3221225472;
  v5[2] = __68__ATXEngagementRecordManager_engagedExecutablesOfType_queryOptions___block_invoke_2;
  v5[3] = &unk_1E5D07190;
  long long v6 = v1;
  long long v7 = v2;
  return [v3 performBatchUpdateOfReferencesWithBlock:v5];
}

void __68__ATXEngagementRecordManager_engagedExecutablesOfType_queryOptions___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeEngagedSuggestionsIfPossibleNoSync];
  long long v2 = *(void **)(a1 + 32);
  id v6 = [v2 _engagedEntriesNoSyncOfType:*(void *)(a1 + 48) queryOptions:*(void *)(a1 + 56)];
  uint64_t v3 = [v2 _identifiersFromEntries:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)addEngagedSuggestion:(id)a3 engagementRecordType:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__ATXEngagementRecordManager_addEngagedSuggestion_engagementRecordType___block_invoke;
  block[3] = &unk_1E5D071B8;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __72__ATXEngagementRecordManager_addEngagedSuggestion_engagementRecordType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeEngagedSuggestionsIfPossibleNoSync];
  long long v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 _addEngagedSuggestionNoSync:v3 type:v4];
}

- (void)addEngagedExecutable:(id)a3 clientModelId:(id)a4 engagementRecordType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__ATXEngagementRecordManager_addEngagedExecutable_clientModelId_engagementRecordType___block_invoke;
    v12[3] = &unk_1E5D071E0;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    unint64_t v15 = a5;
    dispatch_async(queue, v12);
  }
  else
  {
    unint64_t v11 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXEngagementRecordManager addEngagedExecutable:clientModelId:engagementRecordType:](a5, v11);
    }
  }
}

void __86__ATXEngagementRecordManager_addEngagedExecutable_clientModelId_engagementRecordType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeEngagedSuggestionsIfPossibleNoSync];
  long long v2 = [[ATXExecutableIdentifier alloc] initWithString:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) recordExecutable:v2 clientModelId:*(void *)(a1 + 48) shouldClearEngagement:0];
  [*(id *)(a1 + 32) _addEngagedExcutableNoSync:v2 clientModelId:*(void *)(a1 + 48) type:*(void *)(a1 + 56)];
}

- (void)addHiddenSuggestion:(id)a3 duration:(double)a4 engagementRecordType:(unint64_t)a5
{
  id v8 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __80__ATXEngagementRecordManager_addHiddenSuggestion_duration_engagementRecordType___block_invoke;
  v11[3] = &unk_1E5D05D28;
  v11[4] = self;
  id v12 = v8;
  double v13 = a4;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

uint64_t __80__ATXEngagementRecordManager_addHiddenSuggestion_duration_engagementRecordType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addHiddenSuggestionNoSync:*(void *)(a1 + 40) duration:*(void *)(a1 + 56) engagementRecordType:*(double *)(a1 + 48)];
}

- (void)_removeEngagedSuggestionsIfPossibleNoSync
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(ATXExecutableReferenceManager *)self->_referenceManager purgeReferencesIfPossible];
  uint64_t v3 = [(ATXEngagementRecordManager *)self _engagedEntriesNoSyncOfType:1021 queryOptions:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__ATXEngagementRecordManager__removeEngagedSuggestionsIfPossibleNoSync__block_invoke;
  v8[3] = &unk_1E5D07208;
  v8[4] = self;
  uint64_t v4 = [v3 objectsPassingTest:v8];
  if ([v4 count])
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      long long v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138412546;
      id v10 = v7;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%@ - removing executables with ref count of zero: %@", buf, 0x16u);
    }
    [v3 minusSet:v4];
    [(ATXEngagementRecordManager *)self _serializeAndWriteNoSyncSet:v3];
  }
}

BOOL __71__ATXEngagementRecordManager__removeEngagedSuggestionsIfPossibleNoSync__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 engagementRecordType] & 0x380) != 0) {
    goto LABEL_2;
  }
  id v6 = *(void **)(*(void *)(a1 + 32) + 8);
  long long v7 = [v3 executable];
  uint64_t v8 = [v6 referenceCountForExecutable:v7];

  if (!v8)
  {
    BOOL v4 = 1;
    goto LABEL_3;
  }
  if (([v3 engagementRecordType] & 0x78) != 0)
  {
LABEL_2:
    BOOL v4 = 0;
  }
  else
  {
    id v9 = [v3 dateEngaged];
    [v9 timeIntervalSinceNow];
    BOOL v4 = fabs(v10) > 14400.0;
  }
LABEL_3:

  return v4;
}

- (void)removeEngagementForSuggestion:(id)a3 recordType:(unint64_t)a4
{
  id v6 = ATXExecutableIdentifierForSuggestion(a3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__ATXEngagementRecordManager_removeEngagementForSuggestion_recordType___block_invoke;
  v8[3] = &unk_1E5D07230;
  id v9 = v6;
  unint64_t v10 = a4;
  id v7 = v6;
  [(ATXEngagementRecordManager *)self _removeEngagementsOnQueuePassingTest:v8];
}

BOOL __71__ATXEngagementRecordManager_removeEngagementForSuggestion_recordType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 executable];
  if ([v4 isEqual:*(void *)(a1 + 32)]) {
    BOOL v5 = [v3 engagementRecordType] == *(void *)(a1 + 40);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)removeAllEngagementsForSuggestion:(id)a3
{
  BOOL v4 = ATXExecutableIdentifierForSuggestion(a3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__ATXEngagementRecordManager_removeAllEngagementsForSuggestion___block_invoke;
  v6[3] = &unk_1E5D07258;
  id v7 = v4;
  id v5 = v4;
  [(ATXEngagementRecordManager *)self _removeEngagementsOnQueuePassingTest:v6];
}

uint64_t __64__ATXEngagementRecordManager_removeAllEngagementsForSuggestion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 executable];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)removeAllEngagementsOfRecordType:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__ATXEngagementRecordManager_removeAllEngagementsOfRecordType___block_invoke;
  v3[3] = &__block_descriptor_40_e34_B16__0__ATXEngagementRecordEntry_8l;
  v3[4] = a3;
  [(ATXEngagementRecordManager *)self _removeEngagementsOnQueuePassingTest:v3];
}

BOOL __63__ATXEngagementRecordManager_removeAllEngagementsOfRecordType___block_invoke(uint64_t a1, void *a2)
{
  return (*(void *)(a1 + 32) & [a2 engagementRecordType]) != 0;
}

- (void)removeEngagementForExecutableIdentifier:(id)a3 recordType:(unint64_t)a4 abortingRemovalIfEngagementDateIsLaterThanDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __128__ATXEngagementRecordManager_removeEngagementForExecutableIdentifier_recordType_abortingRemovalIfEngagementDateIsLaterThanDate___block_invoke;
  v12[3] = &unk_1E5D072A0;
  id v14 = v9;
  unint64_t v15 = a4;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  [(ATXEngagementRecordManager *)self _removeEngagementsOnQueuePassingTest:v12];
}

uint64_t __128__ATXEngagementRecordManager_removeEngagementForExecutableIdentifier_recordType_abortingRemovalIfEngagementDateIsLaterThanDate___block_invoke(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 executable];
  if (![v4 isEqual:a1[4]])
  {
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v5 = [v3 engagementRecordType];
  uint64_t v6 = a1[6];

  if (v5 != v6)
  {
LABEL_7:
    uint64_t v14 = 0;
    goto LABEL_8;
  }
  id v7 = (void *)a1[5];
  id v8 = [v3 dateEngaged];
  id v9 = [v7 laterDate:v8];
  id v10 = (void *)a1[5];

  uint64_t v4 = __atxlog_handle_home_screen();
  BOOL v11 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v9 != v10)
  {
    if (v11)
    {
      uint64_t v12 = a1[6];
      uint64_t v13 = a1[4];
      int v18 = 134218242;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "EngagementRecordManager: not removing engagement (type %lu) for executable identifier %@ because it was engaged too recently", (uint8_t *)&v18, 0x16u);
    }
    goto LABEL_6;
  }
  if (v11)
  {
    uint64_t v16 = a1[6];
    uint64_t v17 = a1[4];
    int v18 = 134218242;
    uint64_t v19 = v16;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "EngagementRecordManager: removing engagement (type %lu) for executable identifier %@", (uint8_t *)&v18, 0x16u);
  }

  uint64_t v14 = 1;
LABEL_8:

  return v14;
}

- (void)_removeEngagementsOnQueuePassingTest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ATXEngagementRecordManager__removeEngagementsOnQueuePassingTest___block_invoke;
  v7[3] = &unk_1E5D053E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __67__ATXEngagementRecordManager__removeEngagementsOnQueuePassingTest___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v2 = [*(id *)(a1 + 32) _engagedEntriesNoSync];
  id v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40))) {
          objc_msgSend(v3, "addObject:", v9, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    [v4 minusSet:v3];
    [*(id *)(a1 + 32) _serializeAndWriteNoSyncSet:v4];
  }
}

- (void)removeAllEngagementsWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ATXEngagementRecordManager_removeAllEngagementsWithCompletion___block_invoke;
  v7[3] = &unk_1E5D053E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __65__ATXEngagementRecordManager_removeAllEngagementsWithCompletion___block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  id v3 = objc_opt_new();
  [v2 _serializeAndWriteNoSyncSet:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (BOOL)hasReferenceForSuggestion:(id)a3
{
  id v4 = ATXExecutableIdentifierForSuggestion(a3);
  LOBYTE(self) = [(ATXEngagementRecordManager *)self _referenceCountForExecutable:v4] != 0;

  return (char)self;
}

- (id)_identifiersFromEntries:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "executable", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_engagedEntriesNoSyncOfType:(unint64_t)a3 queryOptions:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v19 = self;
  uint64_t v8 = [(ATXEngagementRecordManager *)self _engagedEntriesNoSync];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v13 engagementRecordType] & a3) != 0)
        {
          if (v4)
          {
            if ((v4 & 2) == 0 || [v13 engagementRecordType] == a3)
            {
              referenceManager = v19->_referenceManager;
              long long v15 = [v13 executable];
              LOBYTE(referenceManager) = [(ATXExecutableReferenceManager *)referenceManager isExecutableHidden:v15];

              if ((referenceManager & 1) != 0
                || (uint64_t v16 = v19->_referenceManager,
                    [v13 executable],
                    uint64_t v17 = objc_claimAutoreleasedReturnValue(),
                    LOBYTE(v16) = [(ATXExecutableReferenceManager *)v16 canExecutableClearOnEngagement:v17], v17, (v16 & 1) != 0))
              {
LABEL_15:
                [v7 addObject:v13];
                continue;
              }
            }
          }
          else if ((v4 & 2) == 0 || [v13 engagementRecordType] == a3)
          {
            goto LABEL_15;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)fetchEngagedEntriesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__ATXEngagementRecordManager_fetchEngagedEntriesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5D064C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __71__ATXEngagementRecordManager_fetchEngagedEntriesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _engagedEntriesNoSync];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_engagedEntriesNoSync
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__7;
  long long v22 = __Block_byref_object_dispose__7;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__ATXEngagementRecordManager__engagedEntriesNoSync__block_invoke;
  v17[3] = &unk_1E5D06DE8;
  v17[4] = self;
  v17[5] = &v18;
  uint64_t v3 = +[ATXRunningBoardAssertion performWorkWithFinishTaskAssertionName:@"ATXEngagementRecordManager" block:v17];
  if (v19[5])
  {
    id v4 = (void *)MEMORY[0x1AD0D3C30](v3);
    id v5 = (void *)MEMORY[0x1E4F28DC0];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = v19[5];
    id v16 = 0;
    uint64_t v10 = [v5 unarchivedObjectOfClasses:v8 fromData:v9 error:&v16];
    id v11 = v16;

    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      long long v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(ATXEngagementRecordManager *)(uint64_t)v11 _engagedEntriesNoSync];
      }

      id v12 = (id)objc_opt_new();
    }
    long long v13 = v12;
  }
  else
  {
    long long v13 = objc_opt_new();
  }
  _Block_object_dispose(&v18, 8);

  return v13;
}

uint64_t __51__ATXEngagementRecordManager__engagedEntriesNoSync__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _readData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)_addEngagedSuggestionNoSync:(id)a3 type:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = ATXAllowedEngagementRecordManagerClasses();
  id v8 = [v6 executableSpecification];
  uint64_t v9 = [v8 executableClassString];
  int v10 = [v7 containsObject:v9];

  if (v10)
  {
    id v11 = ATXExecutableIdentifierForSuggestion(v6);
    id v12 = [v6 clientModelSpecification];
    long long v13 = [v12 clientModelId];

    [(ATXEngagementRecordManager *)self _addEngagedExcutableNoSync:v11 clientModelId:v13 type:a4];
    long long v14 = __atxlog_handle_default();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      int v20 = 138412546;
      long long v21 = v16;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "%@ - adding engaged suggestion to engagement record manager: %@", (uint8_t *)&v20, 0x16u);
    }
    if (a4 == 4)
    {
      uint64_t v17 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v6 executableSpecification];
        uint64_t v19 = [v18 executableIdentifier];
        int v20 = 138412290;
        long long v21 = v19;
        _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "EngagementRecordManager: adding inferred engagement for suggestion with executable spec ID %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
}

- (void)_addEngagedExcutableNoSync:(id)a3 clientModelId:(id)a4 type:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  referenceManager = self->_referenceManager;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__ATXEngagementRecordManager__addEngagedExcutableNoSync_clientModelId_type___block_invoke;
  v13[3] = &unk_1E5D071E0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [(ATXExecutableReferenceManager *)referenceManager performBatchUpdateOfReferencesWithBlock:v13];
}

void __76__ATXEngagementRecordManager__addEngagedExcutableNoSync_clientModelId_type___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) updateDateOfReferenceForExecutable:*(void *)(a1 + 40) clientModelId:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 32) _engagedEntriesNoSync];
  uint64_t v2 = [ATXEngagementRecordEntry alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [(ATXEngagementRecordEntry *)v2 initWithExecutable:v3 dateEngaged:v4 engagementRecordType:*(void *)(a1 + 56)];

  [v6 removeObject:v5];
  [v6 addObject:v5];
  [*(id *)(a1 + 32) _serializeAndWriteNoSyncSet:v6];
  [*(id *)(a1 + 32) _logDidAddEntryToBiomeStream:v5];
}

- (void)_addHiddenSuggestionNoSync:(id)a3 duration:(double)a4 engagementRecordType:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = ATXAllowedEngagementRecordManagerClasses();
  int v10 = [v8 executableSpecification];
  id v11 = [v10 executableClassString];
  int v12 = [v9 containsObject:v11];

  if (v12)
  {
    long long v13 = ATXExecutableIdentifierForSuggestion(v8);
    referenceManager = self->_referenceManager;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __87__ATXEngagementRecordManager__addHiddenSuggestionNoSync_duration_engagementRecordType___block_invoke;
    v20[3] = &unk_1E5D072C8;
    double v23 = a4;
    v20[4] = self;
    id v21 = v13;
    id v15 = v8;
    id v22 = v15;
    unint64_t v24 = a5;
    id v16 = v13;
    [(ATXExecutableReferenceManager *)referenceManager performBatchUpdateOfReferencesWithBlock:v20];
    uint64_t v17 = __atxlog_handle_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138412546;
      v26 = v19;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "%@ - adding explicitly rejected suggestion to engagement record manager: %@", buf, 0x16u);
    }
  }
}

void __87__ATXEngagementRecordManager__addHiddenSuggestionNoSync_duration_engagementRecordType___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 < *(double *)(v3 + 40)) {
    double v2 = *(double *)(v3 + 40);
  }
  id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v2];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = [*(id *)(a1 + 48) clientModelSpecification];
  uint64_t v7 = [v6 clientModelId];
  [v5 markReferenceAsHiddenForExecutable:v4 clientModelId:v7 untilDate:v13];

  id v8 = [*(id *)(a1 + 32) _engagedEntriesNoSync];
  id v9 = [ATXEngagementRecordEntry alloc];
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = [MEMORY[0x1E4F1C9C8] date];
  int v12 = [(ATXEngagementRecordEntry *)v9 initWithExecutable:v10 dateEngaged:v11 engagementRecordType:*(void *)(a1 + 64)];

  [v8 addObject:v12];
  [*(id *)(a1 + 32) _serializeAndWriteNoSyncSet:v8];
  [*(id *)(a1 + 32) _logDidAddEntryToBiomeStream:v12];
}

- (void)_logDidAddEntryToBiomeStream:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  if (!self->_eventStream)
  {
    id v6 = objc_alloc_init(ATXBiomeERMStream);
    eventStream = self->_eventStream;
    self->_eventStream = v6;
  }
  referenceManager = self->_referenceManager;
  id v9 = [v5 executable];
  id v14 = [(ATXExecutableReferenceManager *)referenceManager clientModelIdsForExecutable:v9];

  uint64_t v10 = [ATXERMEvent alloc];
  id v11 = objc_opt_new();
  int v12 = [(ATXERMEvent *)v10 initWithEventDate:v11 eventType:1 recordEntry:v5 clientModelIds:v14];

  id v13 = [(ATXBiomeERMStream *)self->_eventStream source];
  [v13 sendEvent:v12];
}

- (void)_serializeAndWriteNoSyncSet:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)MEMORY[0x1AD0D3C30]();
  id v6 = (void *)MEMORY[0x1AD0D3C30]();
  id v14 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v14];
  id v8 = v14;
  if (v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__ATXEngagementRecordManager__serializeAndWriteNoSyncSet___block_invoke;
    v12[3] = &unk_1E5D04FC8;
    void v12[4] = self;
    id v13 = v7;
    +[ATXRunningBoardAssertion performWorkWithFinishTaskAssertionName:@"ATXEngagementRecordManager" block:v12];
    id v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "Refreshing blending after engagement record manager update", v11, 2u);
    }

    [MEMORY[0x1E4F93940] refreshBlendingLayerWithReason:@"ERM change"];
  }
  else
  {
    uint64_t v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXEngagementRecordManager _serializeAndWriteNoSyncSet:]((uint64_t)v8, v10);
    }
  }
}

uint64_t __58__ATXEngagementRecordManager__serializeAndWriteNoSyncSet___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeData:*(void *)(a1 + 40)];
}

- (BOOL)_writeData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = open([(NSString *)self->_path fileSystemRepresentation], 514, 384);
  if (v5 == -1)
  {
    id v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXEngagementRecordManager _writeData:]();
    }
    char v7 = 0;
  }
  else
  {
    int v6 = v5;
    char v7 = ATXCacheFileWrite();
    if ((v6 & 0x80000000) == 0) {
      close(v6);
    }
    id v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = @"ATXEngagementRecords.pb";
      _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "Successfully wrote data to cache file: %@", buf, 0xCu);
    }
  }

  return v7;
}

- (id)_readData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = open([(NSString *)self->_path fileSystemRepresentation], 0);
  if (v2 == -1)
  {
    int v6 = *__error();
    char v7 = __atxlog_handle_default();
    id v8 = v7;
    if (v6 == 2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "No recently engaged cache file found.", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[ATXEngagementRecordManager _readData]();
    }

    id v5 = 0;
  }
  else
  {
    int v3 = v2;
    ATXCacheFileRead();
    if ((v3 & 0x80000000) == 0) {
      close(v3);
    }
    id v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = @"ATXEngagementRecords.pb";
      _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "Successfully read data from cache file: %@", buf, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

- (unint64_t)_referenceCountForExecutable:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ATXEngagementRecordManager__referenceCountForExecutable___block_invoke;
  block[3] = &unk_1E5D072F0;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __59__ATXEngagementRecordManager__referenceCountForExecutable___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) referenceCountForExecutable:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (double)minDurationForTrackedReferencesToStayAround
{
  return self->_minDurationForTrackedReferencesToStayAround;
}

- (void)setMinDurationForTrackedReferencesToStayAround:(double)a3
{
  self->_minDurationForTrackedReferencesToStayAround = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_referenceManager, 0);
}

- (void)addEngagedExecutable:(uint64_t)a1 clientModelId:(NSObject *)a2 engagementRecordType:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "EngagementRecordManager: addEngagedExecutable null for engagementRecordType: %lu", (uint8_t *)&v2, 0xCu);
}

- (void)_engagedEntriesNoSync
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Unable to get recent suggestions: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_serializeAndWriteNoSyncSet:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "Unable to serialize recent engagements. Error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_writeData:.cold.1()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_1_7(&dword_1A790D000, v1, v2, "Couldn't create cache file: [%i] %s", v3, v4, v5, v6, v7);
}

- (void)_readData
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_1_7(&dword_1A790D000, v1, v2, "Couldn't open recently engaged cache file: [%i] %s", v3, v4, v5, v6, v7);
}

@end