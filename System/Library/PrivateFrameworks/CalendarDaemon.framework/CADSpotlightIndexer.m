@interface CADSpotlightIndexer
+ (__CFSet)_entityTypesThatAffectSpotlightIndexing;
+ (id)_personaID:(void *)a3;
+ (id)_spotlightDomainIDForItem:(void *)a3 bundleID:(id)a4 personaID:(id)a5;
+ (id)spotlightDomainIDForItem:(void *)a3 inDatabaseWithPersonaID:(id)a4;
+ (id)spotlightDomainIDForItemInMainDatabase:(void *)a3;
+ (void)_executeWithNumRetriesOnFailure:(int64_t)a3 block:(id)a4;
- (BOOL)_deleteFromIndex:(id)a3;
- (BOOL)_mostRecentFailureWithinADayOfNow:(id)a3;
- (BOOL)_pushBatchedUpdatesForCalendarItemsWithUUIDs:(id)a3 database:(CalDatabase *)a4 personaID:(id)a5 deleteBeforeInserting:(BOOL)a6;
- (BOOL)_pushUpdatesForCalendarItemsWithUUIDs:(id)a3 database:(CalDatabase *)a4 personaID:(id)a5 deleteBeforeInserting:(BOOL)a6;
- (BOOL)_pushUpdatesForCalendarItemsWithUUIDs:(id)a3 inBatchesOf:(unint64_t)a4 database:(CalDatabase *)a5 personaID:(id)a6 deleteBeforeInserting:(BOOL)a7;
- (BOOL)_sendSpotlightUpdates:(id)a3 deletes:(id)a4 toIndex:(id)a5;
- (BOOL)_upsertToIndex:(__CFArray *)a3 inDatabase:(CalDatabase *)a4 personaID:(id)a5 deleteBeforeInserting:(BOOL)a6;
- (CADSpotlightIndexer)initWithDatabaseConfiguration:(id)a3 spotlightIndexProvider:(id)a4 spotlightDefaults:(id)a5 spotlightEntityAnnotator:(id)a6;
- (CADSpotlightIndexer)initWithSpotlightEntityAnnotator:(id)a3;
- (id)_mostRecentFailure;
- (id)_spotlightItemAttributes:(void *)a3;
- (id)_textRepresentationForEvent:(void *)a3;
- (void)_enumerateDatabases:(id)a3;
- (void)_fullReindexIfAllowedWithTransaction:(id)a3 reason:(unint64_t)a4;
- (void)_fullReindexWithReason:(unint64_t)a3;
- (void)_incrementalUpdate;
- (void)_resetDatabase:(CalDatabase *)a3;
- (void)_upsertsAndDeletesFromChanges:(id)a3 inDatabase:(CalDatabase *)a4 personaID:(id)a5 outUpserts:(id *)a6 outDeletes:(id *)a7;
- (void)cancelOngoingWorkAndShutdown;
- (void)checkForAndReportPastSpotlightMigrationErrorsAndReindexIfNeeded;
- (void)indexUnconsumedChanges;
- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5;
- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6;
- (void)waitUntilIdle;
@end

@implementation CADSpotlightIndexer

- (CADSpotlightIndexer)initWithSpotlightEntityAnnotator:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CADCoreSpotlightIndexProvider);
  v6 = [MEMORY[0x1E4F576E0] shared];
  v7 = [(CADSpotlightIndexer *)self initWithDatabaseConfiguration:0 spotlightIndexProvider:v5 spotlightDefaults:v6 spotlightEntityAnnotator:v4];

  return v7;
}

- (CADSpotlightIndexer)initWithDatabaseConfiguration:(id)a3 spotlightIndexProvider:(id)a4 spotlightDefaults:(id)a5 spotlightEntityAnnotator:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)CADSpotlightIndexer;
  v15 = [(CADSpotlightIndexer *)&v30 init];
  if (v15)
  {
    id v26 = v11;
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("spotlightIndexingQueue", v16);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v17;

    objc_initWeak(&location, v15);
    id v19 = objc_alloc(MEMORY[0x1E4F57668]);
    v20 = v15->_queue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __119__CADSpotlightIndexer_initWithDatabaseConfiguration_spotlightIndexProvider_spotlightDefaults_spotlightEntityAnnotator___block_invoke;
    v27[3] = &unk_1E624E4E0;
    objc_copyWeak(&v28, &location);
    uint64_t v21 = [v19 initWithQueue:v20 andBlock:v27];
    incrementalUpdateQueue = v15->_incrementalUpdateQueue;
    v15->_incrementalUpdateQueue = (CalAccumulatingQueue *)v21;

    objc_storeStrong((id *)&v15->_databaseConfiguration, a3);
    objc_storeStrong((id *)&v15->_spotlightIndexProvider, a4);
    objc_storeStrong((id *)&v15->_spotlightDefaults, a5);
    objc_storeStrong((id *)&v15->_spotlightEntityAnnotator, a6);
    v23 = (CalCancellationTokenSource *)objc_alloc_init(MEMORY[0x1E4F57680]);
    cancellationTokenSource = v15->_cancellationTokenSource;
    v15->_cancellationTokenSource = v23;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    id v11 = v26;
  }

  return v15;
}

void __119__CADSpotlightIndexer_initWithDatabaseConfiguration_spotlightIndexProvider_spotlightDefaults_spotlightEntityAnnotator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _incrementalUpdate];
    id WeakRetained = v2;
  }
}

- (void)cancelOngoingWorkAndShutdown
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BBC88000, v0, v1, "Returning because indexer was shutdown", v2, v3, v4, v5, v6);
}

+ (__CFSet)_entityTypesThatAffectSpotlightIndexing
{
  if (_entityTypesThatAffectSpotlightIndexing_onceToken != -1) {
    dispatch_once(&_entityTypesThatAffectSpotlightIndexing_onceToken, &__block_literal_global_11);
  }
  return (__CFSet *)_entityTypesThatAffectSpotlightIndexing_entityTypes;
}

void __62__CADSpotlightIndexer__entityTypesThatAffectSpotlightIndexing__block_invoke()
{
  _entityTypesThatAffectSpotlightIndexing_entityTypes = (uint64_t)CFSetCreateMutable(0, 5, 0);
  CFSetAddValue((CFMutableSetRef)_entityTypesThatAffectSpotlightIndexing_entityTypes, (const void *)0x1A);
  CFSetAddValue((CFMutableSetRef)_entityTypesThatAffectSpotlightIndexing_entityTypes, (const void *)6);
  CFSetAddValue((CFMutableSetRef)_entityTypesThatAffectSpotlightIndexing_entityTypes, (const void *)1);
  CFSetAddValue((CFMutableSetRef)_entityTypesThatAffectSpotlightIndexing_entityTypes, (const void *)2);
  v0 = (__CFSet *)_entityTypesThatAffectSpotlightIndexing_entityTypes;
  CFSetAddValue(v0, (const void *)5);
}

- (void)waitUntilIdle
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = (void *)os_transaction_create();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CADSpotlightIndexer_waitUntilIdle__block_invoke;
  block[3] = &unk_1E624E508;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(queue, block);
}

- (void)_enumerateDatabases:(id)a3
{
  databaseConfiguration = self->_databaseConfiguration;
  if (databaseConfiguration) {
    MEMORY[0x1F410E578](databaseConfiguration, a3);
  }
  else {
    CalDatabaseEnumerateDatabases();
  }
}

- (void)_incrementalUpdate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__CADSpotlightIndexer__incrementalUpdate__block_invoke;
  v2[3] = &unk_1E624E530;
  v2[4] = self;
  [(CADSpotlightIndexer *)self _enumerateDatabases:v2];
}

void __41__CADSpotlightIndexer__incrementalUpdate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C1867850]();
  while (1)
  {
    uint8_t v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "token", v35);
    int v7 = [v6 isCancelled];

    v8 = CADSpotlightHandle;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
        -[CADSpotlightIndexer cancelOngoingWorkAndShutdown]();
      }
      id v26 = @"returning because indexer was shutdown";
      goto LABEL_39;
    }
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = a2;
      _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_DEFAULT, "Fetching changes for database %@", buf, 0xCu);
    }
    int v51 = 0;
    char v50 = 0;
    v49 = 0;
    [(id)objc_opt_class() _entityTypesThatAffectSpotlightIndexing];
    v37 = &v49;
    v35 = &v50;
    uint64_t ChangedEKObjectsForClient = CalDatabaseGetChangedEKObjectsForClient();
    if (ChangedEKObjectsForClient == -1)
    {
      v27 = CADSpotlightHandle;
      if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
        __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_2(v27, v28, v29, v30, v31, v32, v33, v34);
      }
      uint64_t v36 = -1;
      id v26 = @"error fetching changes: %ld";
LABEL_39:
      +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", v26, v36, v37);
      goto LABEL_43;
    }
    if (v50) {
      break;
    }
    uint64_t v10 = ChangedEKObjectsForClient;
    id v11 = v49;
    id v12 = (void *)CADSpotlightHandle;
    BOOL v13 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT);
    if (v10 == 1)
    {
      if (!v13) {
        goto LABEL_13;
      }
      id v14 = v12;
      uint64_t v18 = objc_msgSend(v11, "count", &v50, &v49);
      *(_DWORD *)buf = 134218498;
      uint64_t v53 = v18;
      __int16 v54 = 1024;
      int v55 = v51;
      __int16 v56 = 2112;
      uint64_t v57 = a2;
      v16 = v14;
      dispatch_queue_t v17 = "Processing a partial batch of %lu changes (through %i) for %@";
    }
    else
    {
      if (!v13) {
        goto LABEL_13;
      }
      id v14 = v12;
      uint64_t v15 = objc_msgSend(v11, "count", &v50, &v49);
      *(_DWORD *)buf = 134218498;
      uint64_t v53 = v15;
      __int16 v54 = 1024;
      int v55 = v51;
      __int16 v56 = 2112;
      uint64_t v57 = a2;
      v16 = v14;
      dispatch_queue_t v17 = "Processing all remaining %lu changes (through %i) for %@";
    }
    _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0x1Cu);

LABEL_13:
    id v19 = [(id)objc_opt_class() _personaID:a3];
    if (v19)
    {
      v20 = *(void **)(a1 + 32);
      id v48 = 0;
      id v47 = 0;
      [v20 _upsertsAndDeletesFromChanges:v11 inDatabase:a2 personaID:v19 outUpserts:&v48 outDeletes:&v47];
      id v21 = v48;
      id v22 = v47;
      v23 = [*(id *)(*(void *)(a1 + 32) + 56) token];
      int v24 = [v23 isCancelled];

      if (v24)
      {
        if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
          __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_3(&v45, v46);
        }
        +[CADSpotlightLogger logError:@"returning because indexer was shutdown", v35];

        char v25 = 0;
        goto LABEL_21;
      }
      if ([*(id *)(a1 + 32) _deleteFromIndex:v22])
      {
        if ([*(id *)(a1 + 32) _upsertToIndex:v21 inDatabase:a2 personaID:v19 deleteBeforeInserting:1])
        {
          CalDatabaseClearChangedObjectIDsUpToSequenceNumberForClient();
        }
        else if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
        {
          __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_4(&v43, v44);
        }
      }
      else if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
      {
        __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_5(&v41, v42);
      }

      if (v10 == 1) {
LABEL_19:
      }
        objc_msgSend(*(id *)(a1 + 32), "_resetDatabase:", a2, v35);
    }
    else if (v10 == 1)
    {
      goto LABEL_19;
    }
    char v25 = 1;
LABEL_21:

    if (v10 != 1 || (v25 & 1) == 0) {
      goto LABEL_43;
    }
  }
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
    __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_6();
  }
  objc_msgSend(*(id *)(a1 + 32), "_fullReindexWithReason:", 1, &v50, &v49);
  *a4 = 1;
LABEL_43:
}

- (void)indexUnconsumedChanges
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CalCancellationTokenSource *)self->_cancellationTokenSource token];
  int v4 = [v3 isCancelled];

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
      -[CADSpotlightIndexer cancelOngoingWorkAndShutdown]();
    }
    +[CADSpotlightLogger logError:@"returning because indexer was shutdown"];
  }
  else
  {
    int v7 = @"incrementalUpdateTransactionKey";
    id v5 = (void *)os_transaction_create();
    v8[0] = v5;
    uint8_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

    [(CalAccumulatingQueue *)self->_incrementalUpdateQueue updateTagsAndExecuteBlock:0 withContext:v6];
  }
}

- (void)_fullReindexIfAllowedWithTransaction:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CADSpotlightIndexer__fullReindexIfAllowedWithTransaction_reason___block_invoke;
  block[3] = &unk_1E624E558;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __67__CADSpotlightIndexer__fullReindexIfAllowedWithTransaction_reason___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _mostRecentFailure];
  if (!v2)
  {
LABEL_8:
    [*(id *)(a1 + 32) _fullReindexWithReason:*(void *)(a1 + 48)];
    goto LABEL_9;
  }
  char v3 = [*(id *)(a1 + 32) _mostRecentFailureWithinADayOfNow:v2];
  int v4 = CADSpotlightHandle;
  BOOL v5 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_DEFAULT, "1 day since last failure, reindex needed", buf, 2u);
    }
    goto LABEL_8;
  }
  if (v5)
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_DEFAULT, "reindex aborted, less than one day since last failure", v6, 2u);
  }
  +[CADSpotlightLogger log:@"reindex aborted, less than one day since last failure"];
LABEL_9:
}

- (void)checkForAndReportPastSpotlightMigrationErrorsAndReindexIfNeeded
{
  char v3 = [(CalCancellationTokenSource *)self->_cancellationTokenSource token];
  int v4 = [v3 isCancelled];

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
      -[CADSpotlightIndexer cancelOngoingWorkAndShutdown]();
    }
    +[CADSpotlightLogger logError:@"returning because indexer was shutdown"];
  }
  else
  {
    BOOL v5 = (void *)os_transaction_create();
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __86__CADSpotlightIndexer_checkForAndReportPastSpotlightMigrationErrorsAndReindexIfNeeded__block_invoke;
    v8[3] = &unk_1E624E580;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    dispatch_async(queue, v8);
  }
}

void __86__CADSpotlightIndexer_checkForAndReportPastSpotlightMigrationErrorsAndReindexIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:@"kCalDBLastSpotLightIndexVersion"];
  char v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:@"LastABCReport"];
  int v4 = [*(id *)(a1 + 32) _mostRecentFailure];
  if (v4)
  {
    char v5 = [*(id *)(a1 + 32) _mostRecentFailureWithinADayOfNow:v4];
    id v6 = CADSpotlightHandle;
    BOOL v7 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_DEFAULT, "****** [Spotlight indexing] reindex aborted, less than one day since last failure", (uint8_t *)&v15, 2u);
      }
      +[CADSpotlightLogger log:@"reindex aborted, less than one day since last failure"];
      if (v3) {
        goto LABEL_17;
      }
    }
    else
    {
      if (v7)
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_DEFAULT, "****** [Spotlight indexing] 1 day since last failure, reindex needed", (uint8_t *)&v15, 2u);
      }
      if (v3) {
        goto LABEL_15;
      }
    }
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F57648]) initWithType:@"Database" subtype:@"Spotlight" context:@"IndexFailure"];
    [v12 report];
    BOOL v13 = *(void **)(*(void *)(a1 + 32) + 32);
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v13 setObject:v14 forKey:@"LastABCReport"];

    if ((v5 & 1) == 0)
    {
LABEL_15:
      uint64_t v11 = 2;
LABEL_16:
      [*(id *)(a1 + 32) _fullReindexWithReason:v11];
    }
  }
  else
  {
    int v8 = [v2 intValue];
    id v9 = CADSpotlightHandle;
    BOOL v10 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT);
    if (v8 <= 22)
    {
      if (v10)
      {
        int v15 = 138412290;
        v16 = v2;
        _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_DEFAULT, "****** [Spotlight indexing] reindex needed, last version was %@", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v11 = 3;
      goto LABEL_16;
    }
    if (v10)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_DEFAULT, "****** [Spotlight indexing] spotlight index is current", (uint8_t *)&v15, 2u);
    }
  }
LABEL_17:
}

- (id)_mostRecentFailure
{
  uint64_t v3 = [(CADSpotlightDefaults *)self->_spotlightDefaults objectForKey:@"CalDBSpotLightError"];
  uint64_t v4 = [(CADSpotlightDefaults *)self->_spotlightDefaults objectForKey:@"LastUnfinishedSpotlightReindex"];
  char v5 = (void *)v4;
  if (v3 | v4)
  {
    if (v3) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      id v8 = (id)v3;
    }
    else
    {
      if (v3) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v4 == 0;
      }
      if (v7)
      {
        id v8 = [(id)v3 laterDate:v4];
      }
      else
      {
        id v8 = (id)v4;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (BOOL)_mostRecentFailureWithinADayOfNow:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  char v5 = [v3 date];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  return v7 <= 86400.0;
}

- (void)_fullReindexWithReason:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  char v5 = [(CalCancellationTokenSource *)self->_cancellationTokenSource token];
  int v6 = [v5 isCancelled];

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
      -[CADSpotlightIndexer cancelOngoingWorkAndShutdown]();
    }
    +[CADSpotlightLogger logError:@"returning because indexer was shutdown"];
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    [(CADSpotlightDefaults *)self->_spotlightDefaults setObject:0 forKey:@"CalDBSpotLightError"];
    spotlightDefaults = self->_spotlightDefaults;
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    [(CADSpotlightDefaults *)spotlightDefaults setObject:v8 forKey:@"LastUnfinishedSpotlightReindex"];

    id v9 = (void *)CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v11 = v9;
      id v12 = [v10 numberWithUnsignedInteger:a3];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1BBC88000, v11, OS_LOG_TYPE_DEFAULT, "Beginning spotlight re-index for all databases: %@", (uint8_t *)&buf, 0xCu);
    }
    BOOL v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    +[CADSpotlightLogger log:@"started _fullReindexWithReason: %@", v13];

    id v14 = (id)*MEMORY[0x1E4F57920];
    int v15 = (void *)[(CADSpotlightIndexProvider *)self->_spotlightIndexProvider newSpotlightIndexForBundleID:v14];
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    uint64_t v17 = CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_DEFAULT, "Deleting events for database during full re-index", (uint8_t *)&buf, 2u);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x2020000000;
    char v37 = 1;
    uint64_t v18 = objc_opt_class();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke;
    v30[3] = &unk_1E624E5D0;
    id v19 = v15;
    id v31 = v19;
    id v20 = v14;
    id v32 = v20;
    p_long long buf = &buf;
    id v21 = v16;
    uint64_t v33 = v21;
    [v18 _executeWithNumRetriesOnFailure:1 block:v30];
    id v22 = [(CalCancellationTokenSource *)self->_cancellationTokenSource token];
    int v23 = [v22 isCancelled];

    if (v23)
    {
      if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
        -[CADSpotlightIndexer cancelOngoingWorkAndShutdown]();
      }
      +[CADSpotlightLogger logError:@"returning because indexer was shutdown"];
    }
    else
    {
      if (!*(unsigned char *)(*((void *)&buf + 1) + 24)
        || (v29[0] = MEMORY[0x1E4F143A8],
            v29[1] = 3221225472,
            v29[2] = __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_63,
            v29[3] = &unk_1E624E620,
            v29[4] = self,
            v29[5] = &buf,
            [(CADSpotlightIndexer *)self _enumerateDatabases:v29],
            !*(unsigned char *)(*((void *)&buf + 1) + 24)))
      {
        +[CADSpotlightLogger logError:@"error while attemping full reindex, writing error pref"];
        int v24 = self->_spotlightDefaults;
        char v25 = [MEMORY[0x1E4F1C9C8] date];
        [(CADSpotlightDefaults *)v24 setObject:v25 forKey:@"CalDBSpotLightError"];
      }
      [(CADSpotlightDefaults *)self->_spotlightDefaults setObject:0 forKey:@"LastUnfinishedSpotlightReindex"];
      [(CADSpotlightDefaults *)self->_spotlightDefaults setObject:0 forKey:@"LastABCReport"];
      [(CADSpotlightDefaults *)self->_spotlightDefaults setObject:&unk_1F151D8C0 forKey:@"kCalDBLastSpotLightIndexVersion"];
      id v26 = CADSpotlightHandle;
      if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_1BBC88000, v26, OS_LOG_TYPE_DEFAULT, "Finished spotlight re-index for all databases", v28, 2u);
      }
      v27 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
      +[CADSpotlightLogger log:@"finished _fullReindexWithReason: %@", v27];
    }
    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke(uint64_t a1, char a2)
{
  CFRetain(*(CFTypeRef *)(a1 + 32));
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2;
  v9[3] = &unk_1E624E5A8;
  char v13 = a2;
  int v6 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  id v10 = v6;
  id v11 = *(id *)(a1 + 32);
  [v4 deleteAllSearchableItemsForBundleID:v5 completionHandler:v9];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

  return v7;
}

void __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = *(unsigned __int8 *)(a1 + 56);
    BOOL v5 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v5) {
        __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_cold_2();
      }
      int v6 = @"error deleting searchable items for calendar: %@. Retrying...";
    }
    else
    {
      if (v5) {
        __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_cold_1();
      }
      int v6 = @"error deleting searchable items for calendar: %@";
    }
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", v6, v3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v7 = CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_DEFAULT, "Deleted events for database during full re-index, beginning index", buf, 2u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

uint64_t __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_63(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_64;
  v8[3] = &unk_1E624E5F8;
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  long long v9 = *(_OWORD *)(a1 + 32);
  return [v6 _executeWithNumRetriesOnFailure:1 block:v8];
}

uint64_t __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_64(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CalRemoveClientForPersistentChangeTracking();
  CalDatabaseRegisterClientForPersistentChangeTracking();
  int v4 = CalDatabaseCopyCalendarItemUUIDs();
  BOOL v5 = (void *)CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    *(_DWORD *)long long buf = 134217984;
    uint64_t v15 = [v4 count];
    _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_DEFAULT, "Indexing %lu events in this database as part of full-reindex", buf, 0xCu);
  }
  +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", @"Indexing %lu events in this database as part of reindex", [v4 count]);
  if ([v4 count])
  {
    uint64_t v7 = [(id)objc_opt_class() _personaID:*(void *)(a1 + 56)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _pushBatchedUpdatesForCalendarItemsWithUUIDs:v4 database:*(void *)(a1 + 48) personaID:v7 deleteBeforeInserting:0];
    id v8 = (void *)CADSpotlightHandle;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
      {
        long long v9 = v8;
        uint64_t v10 = [v4 count];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v15 = v10;
        _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_DEFAULT, "Finished indexing %lu events in this database as part of a full-reindex", buf, 0xCu);
      }
      +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", @"Finished indexing %lu events in this database as part of a full-reindex", [v4 count]);
    }
    else
    {
      BOOL v11 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR);
      if (a2)
      {
        if (v11) {
          __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_64_cold_1(v8, v4);
        }
        +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", @"error indexing %lu events in this database as part of a full-reindex, retrying...", [v4 count]);
      }
      else
      {
        if (v11) {
          __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_64_cold_2(v8, v4);
        }
        +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", @"error indexing %lu events in this database as part of a full-reindex, out of retries", [v4 count]);
      }
    }
  }
  uint64_t v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  return v12;
}

+ (void)_executeWithNumRetriesOnFailure:(int64_t)a3 block:(id)a4
{
  do
  {
    if ((*((uint64_t (**)(id, BOOL))a4 + 2))(a4, a3 > 0)) {
      break;
    }
  }
  while (a3-- > 0);
}

+ (id)_personaID:(void *)a3
{
  if (!a3)
  {
    id v3 = @"CalMainDatabasePersona";
    goto LABEL_7;
  }
  id v3 = (__CFString *)CalAuxDatabaseCopyPersonaID();
  if ([(__CFString *)v3 length])
  {
LABEL_7:
    id v3 = v3;
    int v4 = v3;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
    +[CADSpotlightIndexer _personaID:]();
  }
  int v4 = 0;
LABEL_8:

  return v4;
}

- (void)_upsertsAndDeletesFromChanges:(id)a3 inDatabase:(CalDatabase *)a4 personaID:(id)a5 outUpserts:(id *)a6 outDeletes:(id *)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  id v53 = (id)objc_claimAutoreleasedReturnValue();
  CFIndex v12 = [v10 count];
  theSet = CFSetCreateMutable(0, v12, MEMORY[0x1E4F1D548]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v60;
    __int16 v56 = (void *)*MEMORY[0x1E4F57920];
    v52 = a4;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v60 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v59 + 1) + 8 * v16);
        uint64_t v18 = [v17 objectForKeyedSubscript:@"record"];
        if (v18)
        {
          id v19 = [v17 objectForKeyedSubscript:@"type"];
          uint64_t v20 = [v19 integerValue];

          int v21 = [v18 entityType];
          id v22 = v56;
          switch(v21)
          {
            case 1:
              if (v20 == 2)
              {
                int v23 = [v17 objectForKeyedSubscript:@"UUID"];
                int v24 = [v17 objectForKeyedSubscript:@"store_id"];
                [v24 intValue];

                uint64_t v25 = CalDatabaseCopyStoreWithUID();
                if (v25)
                {
                  id v26 = (const void *)v25;
                  v27 = (void *)CalStoreCopyUUID();
                  if (v27 && v23)
                  {
                    uint64_t v28 = [NSString stringWithFormat:@"%@.%@.%@.%@", v22, v11, v27, v23];
                    [v53 addObject:v28];

                    a4 = v52;
                  }
                  CFRelease(v26);
                }
                goto LABEL_29;
              }
              goto LABEL_44;
            case 2:
              if (v20 != 2)
              {
                uint64_t v38 = [v18 entityID];
                char v37 = a4;
                goto LABEL_31;
              }
              __int16 v54 = [v17 objectForKeyedSubscript:@"UUID"];
              id v32 = [v17 objectForKeyedSubscript:@"calendar_id"];
              [v32 intValue];

              uint64_t v33 = (const void *)CalDatabaseCopyCalendarWithUID();
              if (v33) {
                uint64_t v34 = (void *)CalCalendarCopyUUID();
              }
              else {
                uint64_t v34 = 0;
              }
              v42 = [v17 objectForKeyedSubscript:@"store_id"];
              [v42 intValue];

              char v43 = (const void *)CalDatabaseCopyStoreWithUID();
              if (v43)
              {
                v44 = (void *)CalStoreCopyUUID();
                if (v44 && v34 && v54)
                {
                  [NSString stringWithFormat:@"%@.%@.%@.%@.%@", v22, v11, v44, v34, v54];
                  char v45 = v50 = v11;
                  [v53 addObject:v45];

                  id v11 = v50;
                }
                if (v33) {
LABEL_40:
                }
                  CFRelease(v33);
              }
              else
              {
                v44 = 0;
                if (v33) {
                  goto LABEL_40;
                }
              }
              if (v43) {
                CFRelease(v43);
              }

              a4 = v52;
LABEL_44:

              break;
            case 3:
            case 4:
              goto LABEL_20;
            case 5:
              if (v20 != 2)
              {
                v35 = [v17 objectForKeyedSubscript:@"event_id_tomb"];
                uint64_t v36 = [v35 intValue];

                char v37 = a4;
                uint64_t v38 = v36;
LABEL_31:
                v40 = (const void *)MEMORY[0x1C1865800](v37, v38);
                if (v40)
                {
                  char v41 = v40;
                  CFSetAddValue(theSet, v40);
                  CFRelease(v41);
                }
              }
              goto LABEL_44;
            case 6:
              if (v20 == 2)
              {
                int v23 = [v17 objectForKeyedSubscript:@"persistent_id"];
                v39 = [NSString stringWithFormat:@"%@.%@.%@", v22, v11, v23];
                [v53 addObject:v39];

LABEL_29:
              }
              goto LABEL_44;
            default:
              if (v21 == 26)
              {
                if (v20 == 2)
                {
                  uint64_t v29 = [v17 objectForKeyedSubscript:@"persona_id"];

                  uint64_t v30 = [NSString stringWithFormat:@"%@.%@", v22, v29];
                  [v53 addObject:v30];

                  id v11 = (id)v29;
                }
              }
              else
              {
LABEL_20:
                id v31 = CADSpotlightHandle;
                if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 67109120;
                  int v64 = v21;
                  _os_log_error_impl(&dword_1BBC88000, v31, OS_LOG_TYPE_ERROR, "Got changes for unexpected entity type: %d", buf, 8u);
                }
              }
              goto LABEL_44;
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
            -[CADSpotlightIndexer _upsertsAndDeletesFromChanges:inDatabase:personaID:outUpserts:outDeletes:](&v57, v58);
          }
          +[CADSpotlightLogger logError:@"CADObjectId was nil for change, skipping"];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v46 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
      uint64_t v14 = v46;
    }
    while (v46);
  }

  *a6 = [(__CFSet *)theSet allObjects];

  id v47 = v53;
  *a7 = v47;
}

- (BOOL)_deleteFromIndex:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  if ([v4 count])
  {
    BOOL v5 = (id)CADSpotlightHandle;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v30 = v6;
      _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEFAULT, "Beginning delete of %lu domain ids", buf, 0xCu);
    }

    uint64_t v7 = (void *)[(CADSpotlightIndexProvider *)self->_spotlightIndexProvider newSpotlightIndexForBundleID:*MEMORY[0x1E4F57920]];
    id v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    CFRetain(v7);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __40__CADSpotlightIndexer__deleteFromIndex___block_invoke;
    uint64_t v20 = &unk_1E624E648;
    id v9 = v4;
    id v21 = v9;
    int v24 = &v25;
    id v10 = v7;
    id v22 = v10;
    id v11 = v8;
    int v23 = v11;
    [v10 deleteSearchableItemsWithDomainIdentifiers:v9 completionHandler:&v17];
    CFIndex v12 = CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBC88000, v12, OS_LOG_TYPE_DEFAULT, "Beginning wait for deletion of domain ids", buf, 2u);
    }
    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v13 = (id)CADSpotlightHandle;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_msgSend(v9, "count", v17, v18, v19, v20, v21, v22);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v30 = v14;
      _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_DEFAULT, "Finished deleting %lu domain ids", buf, 0xCu);
    }

    int v15 = *((unsigned __int8 *)v26 + 24);
  }
  else
  {
    int v15 = *((unsigned __int8 *)v26 + 24);
  }
  _Block_object_dispose(&v25, 8);

  return v15 != 0;
}

void __40__CADSpotlightIndexer__deleteFromIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
      __40__CADSpotlightIndexer__deleteFromIndex___block_invoke_cold_1(a1);
    }
    +[CADSpotlightLogger logError:@"Failed to push spotlight deletes for domain ids: %@", v3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (BOOL)_upsertToIndex:(__CFArray *)a3 inDatabase:(CalDatabase *)a4 personaID:(id)a5 deleteBeforeInserting:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CFIndex Count = CFArrayGetCount(a3);
  if (Count)
  {
    uint64_t v11 = Count;
    v79 = self;
    CFIndex v12 = CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v98 = v11;
      _os_log_impl(&dword_1BBC88000, v12, OS_LOG_TYPE_DEFAULT, "Start upserting %ld entities", buf, 0xCu);
    }
    context = (void *)MEMORY[0x1C1867850]();
    uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
    v78 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
    uint64_t v14 = CalDatabaseCopyNaturalLanguageSuggestionsCalendar();
    if (v14)
    {
      int v15 = (const void *)v14;
      int UID = CalCalendarGetUID();
      CFRelease(v15);
    }
    else
    {
      int UID = -1;
    }
    p_isa = (id *)&v79->super.isa;
    uint64_t v82 = *MEMORY[0x1E4F57920];
    v73 = (void *)-[CADSpotlightIndexProvider newSpotlightIndexForBundleID:](v79->_spotlightIndexProvider, "newSpotlightIndexForBundleID:");
    if (v11 >= 1)
    {
      CFIndex v17 = 0;
      uint64_t v77 = v11;
      do
      {
        uint64_t v18 = (void *)MEMORY[0x1C1867850]();
        ValueAtIndex = CFArrayGetValueAtIndex(a3, v17);
        v88 = [p_isa _spotlightItemAttributes:ValueAtIndex];
        uint64_t v20 = [(id)objc_opt_class() _spotlightDomainIDForItem:ValueAtIndex bundleID:v82 personaID:v9];
        if (!v20)
        {
          uint64_t v25 = CADSpotlightHandle;
          if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v98 = (uint64_t)ValueAtIndex;
            _os_log_error_impl(&dword_1BBC88000, v25, OS_LOG_TYPE_ERROR, "Skipping record %@ because we got a nil domain id", buf, 0xCu);
          }
          +[CADSpotlightLogger logError:@"Skipping record because we got a nil domain id"];
          goto LABEL_39;
        }
        id v21 = (void *)v20;
        v87 = (void *)CalCalendarItemCopyUUID();
        if (v6) {
          [v78 addObject:v21];
        }
        v85 = v21;
        if (CalEventGetJunkStatus() == 1)
        {
          uint64_t v22 = CADSpotlightHandle;
          if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            int v23 = v22;
            int v24 = "Skip indexing event marked as junk";
LABEL_21:
            _os_log_impl(&dword_1BBC88000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
          }
        }
        else
        {
          if (CalEventGetCalendarId() != UID)
          {
            char v27 = 0;
            goto LABEL_24;
          }
          uint64_t v26 = CADSpotlightHandle;
          if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            int v23 = v26;
            int v24 = "Skip indexing event on natural language suggested calendar";
            goto LABEL_21;
          }
        }
        char v27 = 1;
        p_isa = (id *)&v79->super.isa;
LABEL_24:
        v83 = v18;
        uint64_t v28 = CalEventCopyContactName();
        v86 = (void *)CalEventCopyContactIdentifier();
        v84 = (void *)v28;
        if (!v86 || v28)
        {
          if (CalCalendarItemGetRowID() != -1)
          {
            if ((v27 & 1) == 0)
            {
              if (CalCalendarItemIsPhantomMaster())
              {
                uint64_t v30 = CADSpotlightHandle;
                if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_1BBC88000, v30, OS_LOG_TYPE_DEFAULT, "Skip indexing event because is a phantom master", buf, 2u);
                }
              }
              else
              {
                uint64_t v31 = CalEventCopyUniqueIdentifier();
                if (v31)
                {
                  id v32 = (const void *)v31;
                  [v88 setIdentifier:v31];
                  CFRelease(v32);
                }
                uint64_t v11 = v77;
                if (CalDatabaseLockForThread())
                {
                  uint64_t v33 = (const void *)CalFilterCreateWithDatabaseShowingAll();
                  v80 = _CalEventOccurrenceCacheCopySpotlightOccurrenceDates();
                  CFRelease(v33);
                  unsigned int Duration = _CalEventGetDuration();
                  int HasRecurrenceRules = _CalCalendarItemHasRecurrenceRules();
                  CalDatabaseUnlockForThread();
                  started = (void *)CalCalendarItemCopyStartDate();
                  if ((CalEventIsAllDay() & 1) != 0 || CalEventIsFloating())
                  {
                    uint64_t v34 = (void *)CalCopyTimeZone();
                    uint64_t v35 = [started dateInTimeZone:v34 fromTimeZone:0];

                    started = (void *)v35;
                  }
                  uint64_t v11 = v77;
                  uint64_t v36 = v80;
                  if (v86)
                  {
                    char v37 = (void *)CalCalendarItemCopyCalendarScale();
                    uint64_t v38 = [MEMORY[0x1E4F1C9A8] CalCalendarWithUnsanitizedCalendarIdentifier:v37];
                    v70 = [v38 calendarIdentifier];
                  }
                  else
                  {
                    v70 = 0;
                  }
                  unint64_t v39 = 0x1E4F1C000;
                  id v67 = v9;
                  if (![v80 count])
                  {
                    v40 = (void *)MEMORY[0x1E4F28ED0];
                    [started timeIntervalSinceReferenceDate];
                    char v41 = objc_msgSend(v40, "numberWithDouble:");
                    v96 = v41;
                    uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];

                    unint64_t v39 = 0x1E4F1C000uLL;
                    uint64_t v36 = (void *)v42;
                  }
                  long long v91 = 0u;
                  long long v92 = 0u;
                  long long v89 = 0u;
                  long long v90 = 0u;
                  id obj = v36;
                  uint64_t v75 = [obj countByEnumeratingWithState:&v89 objects:v95 count:16];
                  if (v75)
                  {
                    uint64_t v74 = *(void *)v90;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v75; ++i)
                      {
                        if (*(void *)v90 != v74) {
                          objc_enumerationMutation(obj);
                        }
                        [*(id *)(*((void *)&v89 + 1) + 8 * i) doubleValue];
                        double v45 = v44;
                        double v46 = v44 + (double)Duration;
                        objc_msgSend(*(id *)(v39 + 2504), "dateWithTimeIntervalSinceReferenceDate:");
                        v48 = unint64_t v47 = v39;
                        [v88 setStartDate:v48];

                        v49 = [*(id *)(v47 + 2504) dateWithTimeIntervalSinceReferenceDate:v46];
                        [v88 setEndDate:v49];

                        if (v86)
                        {
                          id v50 = (void *)MEMORY[0x1E4F576B0];
                          int v51 = [v88 startDate];
                          v52 = [v50 birthdayStringForContactName:v84 eventDate:v51 birthDate:started lunarCalendar:v70];

                          [v88 setTitle:v52];
                        }
                        uint64_t v53 = [NSString stringWithFormat:@"%@.%f", v87, *(void *)&v45];
                        id v54 = objc_alloc(MEMORY[0x1E4F23840]);
                        int v55 = (void *)[v88 copy];
                        v81 = (void *)v53;
                        __int16 v56 = (void *)[v54 initWithUniqueIdentifier:v53 domainIdentifier:v85 attributeSet:v55];

                        if (HasRecurrenceRules)
                        {
                          unint64_t v39 = 0x1E4F1C000uLL;
                          char v57 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v45];
                        }
                        else
                        {
                          char v57 = 0;
                          unint64_t v39 = 0x1E4F1C000uLL;
                        }
                        [p_isa[6] associateEventEntityWithIdentifier:v87 occurrenceDate:v57 withSearchableItem:v56];
                        uint64_t v58 = [MEMORY[0x1E4F1C9C8] distantFuture];
                        [v56 setExpirationDate:v58];

                        [v13 addObject:v56];
                        if ((unint64_t)[v13 count] >= 0x64)
                        {
                          long long v59 = v13;
                          long long v60 = [p_isa[7] token];
                          int v61 = [v60 isCancelled];

                          if (v61)
                          {
                            if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
                              -[CADSpotlightIndexer _upsertToIndex:inDatabase:personaID:deleteBeforeInserting:](buf, &buf[1]);
                            }
                            +[CADSpotlightLogger logError:@"returning NO because indexer was shutdown"];
                            uint64_t v13 = v59;
                            long long v62 = v78;
LABEL_78:

                            id v9 = v67;
                            goto LABEL_79;
                          }
                          uint64_t v13 = v59;
                          long long v62 = v78;
                          if (![p_isa _sendSpotlightUpdates:v59 deletes:v78 toIndex:v73])goto LABEL_78; {
                          [v59 removeAllObjects];
                          }
                          [v78 removeAllObjects];
                          p_isa = (id *)&v79->super.isa;
                          unint64_t v39 = 0x1E4F1C000;
                        }

                        uint64_t v11 = v77;
                      }
                      uint64_t v75 = [obj countByEnumeratingWithState:&v89 objects:v95 count:16];
                      if (v75) {
                        continue;
                      }
                      break;
                    }
                  }

                  id v9 = v67;
                }
              }
            }
            goto LABEL_38;
          }
        }
        else
        {
          uint64_t v29 = CADSpotlightHandle;
          if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1BBC88000, v29, OS_LOG_TYPE_DEFAULT, "Skip indexing event because it is a bad birthday", buf, 2u);
          }
          if (CalCalendarItemGetRowID() != -1) {
            goto LABEL_38;
          }
        }
        if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
          -[CADSpotlightIndexer _upsertToIndex:inDatabase:personaID:deleteBeforeInserting:](&v93, v94);
        }
        +[CADSpotlightLogger logError:@"Skip indexing event because it has a row id of -1"];
LABEL_38:

        uint64_t v18 = v83;
LABEL_39:

        ++v17;
      }
      while (v17 != v11);
    }
    long long v62 = v78;
    if (([v13 count] || objc_msgSend(v78, "count"))
      && ![p_isa _sendSpotlightUpdates:v13 deletes:v78 toIndex:v73])
    {
LABEL_79:

      BOOL v64 = 0;
      goto LABEL_80;
    }

    v63 = CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v98 = v11;
      _os_log_impl(&dword_1BBC88000, v63, OS_LOG_TYPE_DEFAULT, "Finished upserting %ld entities to index", buf, 0xCu);
    }
  }
  BOOL v64 = 1;
LABEL_80:

  return v64;
}

- (BOOL)_sendSpotlightUpdates:(id)a3 deletes:(id)a4 toIndex:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  uint64_t v11 = [v8 count];
  if (v11)
  {
    dispatch_group_t v12 = dispatch_group_create();
    uint64_t v13 = (void *)[v8 copy];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke;
    v31[3] = &unk_1E624E698;
    uint64_t v14 = v12;
    id v32 = v14;
    uint64_t v36 = v11;
    id v15 = v10;
    id v33 = v15;
    id v16 = v13;
    id v34 = v16;
    uint64_t v35 = &v37;
    CFIndex v17 = (void (**)(void))MEMORY[0x1C1867AB0](v31);
    if ([v9 count])
    {
      uint64_t v18 = (id)CADSpotlightHandle;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v9 count];
        *(_DWORD *)long long buf = 134218240;
        uint64_t v42 = v19;
        __int16 v43 = 2048;
        uint64_t v44 = v11;
        _os_log_impl(&dword_1BBC88000, v18, OS_LOG_TYPE_DEFAULT, "Beginning delete of %lu events, before indexing %lu events", buf, 0x16u);
      }

      dispatch_group_enter(v14);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_148;
      v26[3] = &unk_1E624E6C0;
      id v27 = v9;
      uint64_t v30 = &v37;
      uint64_t v29 = v17;
      uint64_t v28 = v14;
      [v15 deleteSearchableItemsWithDomainIdentifiers:v27 completionHandler:v26];
    }
    else
    {
      v17[2](v17);
    }
    uint64_t v20 = [v9 count];
    id v21 = CADSpotlightHandle;
    BOOL v22 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v22)
      {
        *(_WORD *)long long buf = 0;
        int v23 = "Beginning wait for delete, then indexing of events";
LABEL_12:
        _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
      }
    }
    else if (v22)
    {
      *(_WORD *)long long buf = 0;
      int v23 = "Beginning wait for indexing of events";
      goto LABEL_12;
    }
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  }
  BOOL v24 = *((unsigned char *)v38 + 24) != 0;
  _Block_object_dispose(&v37, 8);

  return v24;
}

void __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1C1867850]();
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v3 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 64);
    *(_DWORD *)long long buf = 134217984;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEFAULT, "Beginning indexing of %lu events", buf, 0xCu);
  }
  CFRetain(*(CFTypeRef *)(a1 + 40));
  BOOL v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_144;
  v9[3] = &unk_1E624E670;
  uint64_t v12 = *(void *)(a1 + 56);
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 64);
  id v10 = v7;
  uint64_t v13 = v8;
  id v11 = *(id *)(a1 + 32);
  [v7 indexSearchableItems:v6 completionHandler:v9];
}

void __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_144(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
      __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_144_cold_1();
    }
    +[CADSpotlightLogger logError:@"Failed to push spotlight inserts/updates: %@", v3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  uint64_t v4 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 56);
    *(_DWORD *)long long buf = 134217984;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_DEFAULT, "Finished indexing of %lu events", buf, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_148(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)CADSpotlightHandle;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
      __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_148_cold_1(a1);
    }
    +[CADSpotlightLogger logError:@"Failed to push spotlight deletes for ids before indexing: %@", v3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = v4;
      *(_DWORD *)long long buf = 134217984;
      uint64_t v8 = [v5 count];
      _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_DEFAULT, "Finished delete of %lu events, beginning indexing", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (id)spotlightDomainIDForItemInMainDatabase:(void *)a3
{
  return (id)[a1 spotlightDomainIDForItem:a3 inDatabaseWithPersonaID:@"CalMainDatabasePersona"];
}

+ (id)spotlightDomainIDForItem:(void *)a3 inDatabaseWithPersonaID:(id)a4
{
  return (id)[a1 _spotlightDomainIDForItem:a3 bundleID:*MEMORY[0x1E4F57920] personaID:a4];
}

+ (id)_spotlightDomainIDForItem:(void *)a3 bundleID:(id)a4 personaID:(id)a5
{
  id v24 = a4;
  id v23 = a5;
  RecordLock = (os_unfair_lock_s *)CalGetRecordLock();
  os_unfair_lock_lock(RecordLock);
  uint64_t v8 = (const void *)MEMORY[0x1C1865500](a3);
  _CalDatabaseGetRecordStore();
  int v9 = _CalEntityIsOfType();
  id v10 = (unsigned char *)MEMORY[0x1E4F56A58];
  if (v9)
  {
    Store = CFRetain(a3);
    Calendar = 0;
    uint64_t v13 = 0;
    goto LABEL_18;
  }
  if (_CalEntityIsOfType())
  {
    Calendar = CFRetain(a3);
    if (!Calendar) {
      goto LABEL_5;
    }
  }
  else
  {
    if (!_CalEntityIsOfType())
    {
      uint64_t v13 = 0;
      int v14 = 0;
      Calendar = 0;
      goto LABEL_21;
    }
    Calendar = (const void *)_CalCalendarItemGetCalendar();
    if (!Calendar)
    {
      CPRecordGetOriginalProperty();
      Calendar = (const void *)_CalGetCalendarWithUID();
      if (!Calendar)
      {
LABEL_5:
        uint64_t v13 = 0;
        int v14 = 0;
LABEL_21:
        Store = 0;
        goto LABEL_22;
      }
    }
    CFRetain(Calendar);
  }
  Store = (const void *)_CalCalendarGetStore();
  if (Store) {
    goto LABEL_16;
  }
  if (*v10)
  {
    if (CPRecordGetStore())
    {
      Context = (const os_unfair_lock *)CPRecordStoreGetContext();
      if (Context) {
        os_unfair_lock_assert_owner(Context + 20);
      }
    }
  }
  CPRecordGetOriginalProperty();
  Store = (const void *)_CalGetStoreWithUID();
  if (Store) {
LABEL_16:
  }
    CFRetain(Store);
  uint64_t v13 = (const void *)_CalCalendarCopyUUID();
LABEL_18:
  int v14 = v9 ^ 1;
  if (Store)
  {
    uint64_t v16 = (const void *)_CalStoreCopyUUID();
    char v17 = 0;
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v16 = 0;
  char v17 = 1;
LABEL_23:
  if (_CalEntityIsOfType())
  {
    uint64_t v18 = (const void *)_CalCalendarItemCopyUUID();
    uint64_t v19 = [NSString stringWithFormat:@"%@.%@.%@.%@.%@", v24, v23, v16, v13, v18];
    CFRelease(v18);
    if (!v8) {
      goto LABEL_33;
    }
LABEL_32:
    CFRelease(v8);
    goto LABEL_33;
  }
  if (v16 && v13)
  {
    [NSString stringWithFormat:@"%@.%@.%@.%@", v24, v23, v16, v13];
    goto LABEL_31;
  }
  if (v16)
  {
    [NSString stringWithFormat:@"%@.%@.%@", v24, v23, v16, v22];
    uint64_t v19 = LABEL_31:;
    if (!v8) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
    +[CADSpotlightIndexer _spotlightDomainIDForItem:bundleID:personaID:]();
  }
  uint64_t v19 = 0;
  if (v8) {
    goto LABEL_32;
  }
LABEL_33:
  if (v14) {
    CFRelease(Calendar);
  }
  if ((v17 & 1) == 0) {
    CFRelease(Store);
  }
  uint64_t v20 = (unsigned char *)MEMORY[0x1E4F56A58];
  if (v13) {
    CFRelease(v13);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (*v20) {
    os_unfair_lock_assert_owner(RecordLock);
  }
  os_unfair_lock_unlock(RecordLock);

  return v19;
}

- (id)_spotlightItemAttributes:(void *)a3
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F23850]);
  uint64_t v4 = (void *)[v3 initWithContentType:*MEMORY[0x1E4F44358]];
  uint64_t v5 = CalCalendarItemCopyCalendar();
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    uint64_t v7 = (const void *)CalCalendarCopyStore();
    if (v7) {
      uint64_t v8 = (const void *)CalStoreCopyExternalID();
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = CalCalendarCopyTitle();
    if (v9)
    {
      id v10 = (const void *)v9;
      [v4 setContainerDisplayName:v9];
      CFRelease(v10);
    }
    if (CalCalendarIsHolidaySubscribedCalendar()) {
      [v4 setCalendarHolidayIdentifier:@"Y"];
    }
    id v11 = v4;
    uint64_t IsSubscribed = CalCalendarIsSubscribed();
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mobilecal_calendarIsSubscribedCalendar" searchable:1 searchableByDefault:0 unique:1 multiValued:0];
    int v14 = [MEMORY[0x1E4F28ED0] numberWithBool:IsSubscribed];
    [v11 setValue:v14 forCustomKey:v13];

    uint64_t v15 = CalCalendarCopyUUID();
    if (v15)
    {
      uint64_t v16 = (const void *)v15;
      char v17 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mobilecal_calendarIdentifier" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
      [v11 setValue:v16 forCustomKey:v17];
      CFRelease(v16);
    }
    uint64_t v4 = v11;
    if (v8)
    {
      [v11 setAccountIdentifier:v8];
      CFRelease(v8);
    }
    uint64_t v18 = (void *)CalCalendarCopySelfIdentityAddress();
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = [v18 resourceSpecifier];
      id v21 = (void *)v20;
      if (v20)
      {
        v99[0] = v20;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:1];
        [v11 setAccountHandles:v22];

        uint64_t v4 = v11;
      }
      CFRelease(v19);

      if (v7) {
        goto LABEL_17;
      }
    }
    else if (v7)
    {
LABEL_17:
      if (CalStoreIsDelegate())
      {
        id v23 = (void *)CalStoreCopyName();
        [v4 setCalendarDelegateIdentifier:v23];
      }
      if (CalStoreGetType() == 6) {
        [v4 setDisableSearchInSpotlight:MEMORY[0x1E4F1CC38]];
      }
      CFRelease(v6);
      goto LABEL_24;
    }
    uint64_t v7 = v6;
LABEL_24:
    CFRelease(v7);
  }
  uint64_t v24 = CalCalendarItemCopyUUID();
  if (v24)
  {
    uint64_t v25 = (const void *)v24;
    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mobilecal_calendarItemIdentifier" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
    [v4 setValue:v25 forCustomKey:v26];
    CFRelease(v25);
  }
  uint64_t v27 = CalCalendarItemCopySummary();
  if (v27)
  {
    uint64_t v28 = (const void *)v27;
    [v4 setTitle:v27];
    CFRelease(v28);
  }
  uint64_t v29 = CalCalendarItemCopyDescription();
  if (v29)
  {
    uint64_t v30 = (const void *)v29;
    [v4 setComment:v29];
    CFRelease(v30);
  }
  uint64_t v31 = MEMORY[0x1E4F1CC38];
  v98[0] = @"com.apple.calendar.spotlight.identifier";
  v98[1] = @"com.apple.calendar.ics";
  v98[2] = @"com.apple.ical.ics";
  id v32 = [(id)*MEMORY[0x1E4F44510] identifier];
  v98[3] = v32;
  id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:4];
  [v4 setProviderDataTypes:v33];

  uint64_t v34 = CalCalendarItemCopyLocation();
  if (v34)
  {
    uint64_t v35 = (const void *)v34;
    uint64_t v36 = CalLocationCopyTitle();
    if (v36)
    {
      uint64_t v37 = (const void *)v36;
      [v4 setNamedLocation:v36];
      CFRelease(v37);
    }
    if (CalLocationHasCoordinates())
    {
      CalLocationGetCoordinates();
      uint64_t v38 = [MEMORY[0x1E4F28ED0] numberWithDouble:0.0];
      [v4 setLatitude:v38];

      uint64_t v39 = [MEMORY[0x1E4F28ED0] numberWithDouble:0.0];
      [v4 setLongitude:v39];

      [v4 setSupportsNavigation:MEMORY[0x1E4F1CC38]];
    }
    CFRelease(v35);
  }
  if (CalCalendarItemIsAllDay()) {
    uint64_t v40 = v31;
  }
  else {
    uint64_t v40 = MEMORY[0x1E4F1CC28];
  }
  [v4 setAllDay:v40];
  uint64_t v41 = CalCalendarItemCopyOrganizer();
  if (v41)
  {
    uint64_t v42 = (const void *)v41;
    __int16 v43 = (void *)MEMORY[0x1C1866560]();
    uint64_t v44 = (void *)MEMORY[0x1C1866580](v42);
    uint64_t v45 = CalCalendarItemCopyAttendees();
    if (v45)
    {
      CFArrayRef v46 = (const __CFArray *)v45;
      v80 = v42;
      v81 = v4;
      v87 = [MEMORY[0x1E4F1CA48] array];
      v86 = [MEMORY[0x1E4F1CA48] array];
      v83 = [MEMORY[0x1E4F1CA48] array];
      unint64_t v47 = [MEMORY[0x1E4F1CA48] array];
      long long v90 = [MEMORY[0x1E4F1CA48] array];
      long long v91 = [MEMORY[0x1E4F1CA48] array];
      v85 = [MEMORY[0x1E4F1CA48] array];
      CFIndex Count = CFArrayGetCount(v46);
      if (Count >= 1)
      {
        CFIndex v48 = 0;
        uint64_t v82 = *MEMORY[0x1E4F1ADC8];
        uint64_t v84 = *MEMORY[0x1E4F1AEE0];
        v88 = v43;
        long long v89 = v44;
        CFArrayRef v92 = v46;
        v94 = v47;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v46, v48);
          uint64_t v50 = MEMORY[0x1C1864F60]();
          int v51 = (void *)MEMORY[0x1C1864F70](ValueAtIndex);
          uint64_t v52 = MEMORY[0x1C1864FB0](ValueAtIndex);
          CFTypeRef cf = (CFTypeRef)v52;
          if (v43)
          {
            if ([v43 isEqualToString:v51]) {
              break;
            }
          }
          if (v44)
          {
            int v56 = [v44 isEqualToString:v52];
            BOOL v53 = v51 != 0;
            if (v51) {
              char v57 = v51;
            }
            else {
              char v57 = (void *)v52;
            }
            id v55 = v57;
            if (v55)
            {
              if (!v56) {
                goto LABEL_68;
              }
LABEL_57:
              [v85 addObject:v55];
LABEL_58:
              int v56 = 1;
            }
            if (!v50)
            {
              LODWORD(v52) = v52 != 0;
              if (v56)
              {
                if (v53) {
                  goto LABEL_99;
                }
                goto LABEL_102;
              }
              goto LABEL_96;
            }
            if (v56)
            {
              [v91 addObject:v50];
              if (!v53)
              {
                if (!v52)
                {
                  CFRelease((CFTypeRef)v50);
                  goto LABEL_104;
                }
                int v70 = 0;
                int v64 = 1;
                goto LABEL_84;
              }
              id v58 = v55;
              long long v59 = (const void *)v50;
              int v60 = 1;
              goto LABEL_78;
            }
            BOOL v65 = v53;
            id v58 = v55;
            goto LABEL_77;
          }
          BOOL v53 = v51 != 0;
          if (v51) {
            int v61 = v51;
          }
          else {
            int v61 = (void *)v52;
          }
          id v62 = v61;
          if (v62)
          {
            id v55 = v62;
LABEL_68:
            [v83 addObject:v55];
            if (!v50) {
              goto LABEL_95;
            }
            BOOL v63 = v53;
            id v58 = v55;
            long long v59 = (const void *)v50;
            [v86 addObject:v50];
            int v60 = 0;
            LODWORD(v50) = 0;
            int v64 = 0;
            if (!v63) {
              goto LABEL_82;
            }
LABEL_78:
            id v66 = objc_alloc(MEMORY[0x1E4F23810]);
            v97 = v51;
            LODWORD(v50) = 1;
            id v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
            v68 = (void *)[v66 initWithDisplayName:v59 handles:v67 handleIdentifier:v82];

            uint64_t v52 = (uint64_t)cf;
            if (v60) {
              v69 = v90;
            }
            else {
              v69 = v87;
            }
            [v69 addObject:v68];

            int v64 = v60;
            goto LABEL_82;
          }
          if (!v50)
          {
            id v55 = 0;
LABEL_95:
            int v56 = 0;
            LODWORD(v52) = v52 != 0;
            goto LABEL_96;
          }
          BOOL v65 = v51 != 0;
          id v58 = 0;
LABEL_77:
          long long v59 = (const void *)v50;
          [v86 addObject:v50];
          int v60 = 0;
          LODWORD(v50) = 0;
          int v64 = 0;
          if (v65) {
            goto LABEL_78;
          }
LABEL_82:
          if (v52)
          {
            int v70 = v50;
            uint64_t v50 = (uint64_t)v59;
            id v55 = v58;
LABEL_84:
            id v71 = objc_alloc(MEMORY[0x1E4F23810]);
            uint64_t v96 = v52;
            v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
            v73 = (void *)[v71 initWithDisplayName:v50 handles:v72 handleIdentifier:v84];

            if (v64)
            {
              [v90 addObject:v73];

              CFRelease((CFTypeRef)v50);
              if (v70) {
                CFRelease(v51);
              }
              __int16 v43 = v88;
              uint64_t v44 = v89;
LABEL_103:
              CFRelease(cf);
              goto LABEL_104;
            }
            [v87 addObject:v73];

            int v56 = 1;
            LODWORD(v52) = 1;
            BOOL v53 = v70;
            __int16 v43 = v88;
            uint64_t v44 = v89;
            goto LABEL_96;
          }
          uint64_t v44 = v89;
          if (v64)
          {
            __int16 v43 = v88;
            goto LABEL_98;
          }
          int v56 = 1;
          int v74 = v50;
          __int16 v43 = v88;
          uint64_t v50 = (uint64_t)v59;
          id v55 = v58;
          BOOL v53 = v74;
LABEL_96:
          uint64_t v75 = [MEMORY[0x1E4F28ED0] numberWithInt:CalAttendeeGetStatus()];
          [v94 addObject:v75];

          if (v56)
          {
            BOOL v76 = v53;
            id v58 = v55;
            long long v59 = (const void *)v50;
            LOBYTE(v50) = v76;
LABEL_98:
            CFRelease(v59);
            id v55 = v58;
            if (v50) {
              goto LABEL_99;
            }
            goto LABEL_102;
          }
          if (v53)
          {
LABEL_99:
            CFRelease(v51);
            if ((v52 & 1) == 0) {
              goto LABEL_104;
            }
            goto LABEL_103;
          }
LABEL_102:
          if (v52) {
            goto LABEL_103;
          }
LABEL_104:

          ++v48;
          CFArrayRef v46 = v92;
          unint64_t v47 = v94;
          if (Count == v48) {
            goto LABEL_107;
          }
        }
        BOOL v53 = v51 != 0;
        if (v51) {
          id v54 = v51;
        }
        else {
          id v54 = (void *)v52;
        }
        id v55 = v54;
        if (v55) {
          goto LABEL_57;
        }
        goto LABEL_58;
      }
LABEL_107:
      uint64_t v4 = v81;
      if ([v87 count]) {
        [v81 setPrimaryRecipients:v87];
      }
      if ([v86 count]) {
        [v81 setRecipientNames:v86];
      }
      if ([v83 count]) {
        [v81 setRecipientEmailAddresses:v83];
      }
      if ([v47 count])
      {
        uint64_t v77 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mobilecal_recipientParticipationStatuses" searchable:1 searchableByDefault:0 unique:0 multiValued:1];
        [v81 setValue:v47 forCustomKey:v77];
      }
      if ([v90 count]) {
        [v81 setAuthors:v90];
      }
      uint64_t v42 = v80;
      if ([v91 count]) {
        [v81 setAuthorNames:v91];
      }
      if ([v85 count]) {
        [v81 setAuthorEmailAddresses:v85];
      }
      CFRelease(v46);
    }
    CFRelease(v42);
    if (v43) {
      CFRelease(v43);
    }
    if (v44) {
      CFRelease(v44);
    }
  }
  id v78 = v4;

  return v78;
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a5;
  uint64_t v9 = [(CalCancellationTokenSource *)self->_cancellationTokenSource token];
  int v10 = [v9 isCancelled];

  if (v10)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
      -[CADSpotlightIndexer reindexAllItemsForBundleID:protectionClass:acknowledgementHandler:]();
    }
    +[CADSpotlightLogger logError:@"calling ack handler and returning because indexer was shutdown"];
LABEL_11:
    v8[2](v8);
    goto LABEL_12;
  }
  char v11 = [v7 isEqualToString:*MEMORY[0x1E4F57920]];
  uint64_t v12 = CADSpotlightHandle;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
      -[CADSpotlightIndexer reindexAllItemsForBundleID:protectionClass:acknowledgementHandler:]((uint64_t)v7);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_1BBC88000, v12, OS_LOG_TYPE_DEFAULT, "CADSpotlightDaemonClientHandler: Received request to reindex all searchable items for Core Spotlight for bundleID: %@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v13 = (void *)os_transaction_create();
  [(CADSpotlightIndexer *)self _fullReindexIfAllowedWithTransaction:v13 reason:0];
  v8[2](v8);

LABEL_12:
}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  char v11 = (void (**)(void))a6;
  uint64_t v12 = [(CalCancellationTokenSource *)self->_cancellationTokenSource token];
  int v13 = [v12 isCancelled];

  if (v13)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
      -[CADSpotlightIndexer reindexAllItemsForBundleID:protectionClass:acknowledgementHandler:]();
    }
    +[CADSpotlightLogger logError:@"calling ack handler and returning because indexer was shutdown"];
LABEL_20:
    v11[2](v11);
    goto LABEL_21;
  }
  uint64_t v14 = *MEMORY[0x1E4F57920];
  char v15 = [v10 isEqualToString:*MEMORY[0x1E4F57920]];
  uint64_t v16 = CADSpotlightHandle;
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412802;
      id v41 = v9;
      __int16 v42 = 2112;
      id v43 = v10;
      __int16 v44 = 2112;
      uint64_t v45 = v14;
      _os_log_error_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_ERROR, "CADSpotlightDaemonClientHandler: Aborting unexpected request to reindex searchable items for Core Spotlight: %@ for bundleID: %@ for donation manager with bundleID: %@", buf, 0x20u);
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v41 = v9;
    __int16 v42 = 2112;
    id v43 = v10;
    _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_DEFAULT, "CADSpotlightDaemonClientHandler: Received request to reindex searchable items for Core Spotlight: %@ for bundleID: %@", buf, 0x16u);
  }
  char v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v10);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v30 = v9;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)(*((void *)&v35 + 1) + 8 * v22) componentsSeparatedByString:@"."];
        uint64_t v24 = [v23 firstObject];

        if (v24) {
          [v17 addObject:v24];
        }

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v20);
  }

  uint64_t v25 = (void *)os_transaction_create();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__CADSpotlightIndexer_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke;
  block[3] = &unk_1E624E738;
  void block[4] = self;
  id v32 = v18;
  id v33 = v17;
  id v34 = v25;
  id v27 = v25;
  id v28 = v17;
  dispatch_async(queue, block);
  v11[2](v11);

  id v10 = v29;
  id v9 = v30;
LABEL_21:
}

void __99__CADSpotlightIndexer_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __99__CADSpotlightIndexer_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_2;
  v3[3] = &unk_1E624E710;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _enumerateDatabases:v3];
}

void __99__CADSpotlightIndexer_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [(id)objc_opt_class() _personaID:a3];
  if (v5)
  {
    uint64_t v6 = (void *)CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 40);
      uint64_t v8 = v6;
      *(_DWORD *)long long buf = 134217984;
      uint64_t v16 = [v7 count];
      _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_DEFAULT, "Indexing %lu events in this database because spotlight told us to.", buf, 0xCu);
    }
    id v9 = objc_opt_class();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __99__CADSpotlightIndexer_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_190;
    v10[3] = &unk_1E624E6E8;
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    uint64_t v14 = a2;
    id v12 = v5;
    id v13 = *(id *)(a1 + 40);
    [v9 _executeWithNumRetriesOnFailure:1 block:v10];
  }
}

uint64_t __99__CADSpotlightIndexer_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_190(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) _pushBatchedUpdatesForCalendarItemsWithUUIDs:*(void *)(a1 + 40) database:*(void *)(a1 + 64) personaID:*(void *)(a1 + 48) deleteBeforeInserting:1];
  if (v4)
  {
    id v5 = (void *)CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 56);
      id v7 = v5;
      int v12 = 134217984;
      uint64_t v13 = [v6 count];
      uint64_t v8 = "Finished indexing %lu events in this database because spotlight told us to.";
LABEL_7:
      _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (a2)
  {
    id v9 = (void *)CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(a1 + 56);
      id v7 = v9;
      int v12 = 134217984;
      uint64_t v13 = [v10 count];
      uint64_t v8 = "Error indexing %lu events in this database because spotlight told us to, retrying...";
      goto LABEL_7;
    }
  }
  return v4;
}

- (id)_textRepresentationForEvent:(void *)a3
{
  id v28 = (void *)CalCalendarItemCopySummary();
  id v3 = (const void *)CalCalendarItemCopyLocation();
  uint64_t v4 = (void *)CalLocationCopyTitle();
  if (v3) {
    CFRelease(v3);
  }
  id v5 = (void *)CalCalendarItemCopyURL();
  uint64_t v6 = (void *)CalCalendarItemCopyDescription();
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F1509B08];
  id v27 = [NSString stringWithFormat:@"%@\n", v28];
  objc_msgSend(v7, "appendString:");
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
  CalEventGetStartDate();
  id v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  id v10 = (void *)MEMORY[0x1E4F1C9C8];
  CalEventGetEndDate();
  id v11 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t IsAllDay = CalEventIsAllDay();
  started = (void *)CalEventCopyStartTimeZone();
  uint64_t v14 = [MEMORY[0x1E4F576C8] dateStringRepresentationForEventCompontentsStartDate:v9 endDate:v11 allDay:IsAllDay timeZone:started];
  char v15 = [NSString stringWithFormat:@"%@\n", v14];

  [v7 appendString:v15];
  if ([v4 length])
  {
    uint64_t v16 = [NSString stringWithFormat:@"%@\n", v4];
    [v7 appendString:v16];
  }
  if (v5)
  {
    uint64_t v17 = NSString;
    [v5 absoluteString];
    id v18 = v9;
    uint64_t v19 = v6;
    uint64_t v20 = v5;
    uint64_t v21 = v4;
    v23 = uint64_t v22 = v11;
    uint64_t v24 = [v17 stringWithFormat:@"%@\n", v23];
    [v7 appendString:v24];

    id v11 = v22;
    uint64_t v4 = v21;
    id v5 = v20;
    uint64_t v6 = v19;
    id v9 = v18;
  }
  if (v6)
  {
    uint64_t v25 = [NSString stringWithFormat:@"%@\n", v6];
    [v7 appendString:v25];
  }
  return v7;
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))a6;
  uint64_t v17 = (void (**)(id, void, void *))a8;
  id v18 = [(CalCancellationTokenSource *)self->_cancellationTokenSource token];
  int v19 = [v18 isCancelled];

  if (v19)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F28228];
    v55[0] = @"CADSpotlightIndexer is shutdown";
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
    uint64_t v22 = [v20 errorWithDomain:@"CADSpotlightDaemonClientHandlerErrorDomain" code:0 userInfo:v21];
    v17[2](v17, 0, v22);

    goto LABEL_18;
  }
  char v23 = [v13 isEqualToString:*MEMORY[0x1E4F57920]];
  uint64_t v24 = CADSpotlightHandle;
  if (v23)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v49 = v16;
      _os_log_impl(&dword_1BBC88000, v24, OS_LOG_TYPE_DEFAULT, "CADSpotlightDaemonClientHandler: Received request to provide data for bundleID: %@, %@, %@", buf, 0x20u);
    }
    if ([v16 isEqualToString:@"com.apple.calendar.spotlight.identifier"])
    {
      uint64_t v21 = [v15 dataUsingEncoding:4];
      ((void (**)(id, void *, void *))v17)[2](v17, v21, 0);
      goto LABEL_18;
    }
    uint64_t v21 = [v15 componentsSeparatedByString:@"."];
    id v27 = [v21 firstObject];
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v49 = __Block_byref_object_copy__3;
    uint64_t v50 = __Block_byref_object_dispose__3;
    id v51 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __118__CADSpotlightIndexer_provideDataForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
    v35[3] = &unk_1E624E760;
    id v34 = v27;
    id v36 = v34;
    long long v37 = v16;
    id v28 = v17;
    long long v38 = self;
    id v39 = v28;
    uint64_t v40 = buf;
    id v41 = &v42;
    [(CADSpotlightIndexer *)self _enumerateDatabases:v35];
    uint64_t v29 = *(void **)(*(void *)&buf[8] + 40);
    if (*((unsigned char *)v43 + 24))
    {
      if (!v29) {
        goto LABEL_17;
      }
    }
    else if (!v29)
    {
      id v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28228];
      unint64_t v47 = @"Event Identifier not found";
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      uint64_t v32 = [v30 errorWithDomain:@"CADSpotlightDaemonClientHandlerErrorDomain" code:0 userInfo:v31];
      id v33 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v32;

      uint64_t v29 = *(void **)(*(void *)&buf[8] + 40);
    }
    v28[2](v28, 0, v29);
LABEL_17:

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v42, 8);

    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
    -[CADSpotlightIndexer provideDataForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:]((uint64_t)v13);
  }
  uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v52 = *MEMORY[0x1E4F28228];
  BOOL v53 = @"Incorrect Bundle ID";
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  uint64_t v26 = [v25 errorWithDomain:@"CADSpotlightDaemonClientHandlerErrorDomain" code:0 userInfo:v21];
  v17[2](v17, 0, v26);

LABEL_18:
}

void __118__CADSpotlightIndexer_provideDataForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (const void *)CalDatabaseCopyCalendarItemWithUUID();
  CFTypeRef cf = v6;
  if (v6)
  {
    CFTypeRef v7 = v6;
    if (([*(id *)(a1 + 40) isEqualToString:@"com.apple.calendar.ics"] & 1) != 0
      || [*(id *)(a1 + 40) isEqualToString:@"com.apple.ical.ics"])
    {
      CFArrayRef v8 = CFArrayCreate(0, &cf, 1, MEMORY[0x1E4F1D510]);
      if (v8 && (v9 = v8, id v10 = (void *)CalCreateiCalendarDataFromCalEntitiesWithOptions(), CFRelease(v9), v10))
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      else
      {
        id v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = *MEMORY[0x1E4F28228];
        v29[0] = @"Failed to create ICS";
        id v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1, cf);
        uint64_t v12 = [v11 errorWithDomain:@"CADSpotlightDaemonClientHandlerErrorDomain" code:0 userInfo:v10];
        uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
        id v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }
      CFTypeRef v7 = cf;
    }
    else
    {
      id v15 = *(void **)(a1 + 40);
      uint64_t v16 = [(id)*MEMORY[0x1E4F44510] identifier];
      LODWORD(v15) = [v15 isEqualToString:v16];

      if (v15)
      {
        uint64_t v17 = [*(id *)(a1 + 48) _textRepresentationForEvent:v7];
        uint64_t v18 = *(void *)(a1 + 56);
        int v19 = [v17 dataUsingEncoding:4];
        (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v19, 0);
      }
      else
      {
        uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = *MEMORY[0x1E4F28228];
        id v27 = @"Unrecognized type Identifier";
        uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        uint64_t v22 = [v20 errorWithDomain:@"CADSpotlightDaemonClientHandlerErrorDomain" code:0 userInfo:v21];
        uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;
      }
    }
    CFRelease(v7);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  v15[1] = *MEMORY[0x1E4F143B8];
  CFArrayRef v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4F28228];
  v15[0] = @"FileURLs are not provided for events";
  id v10 = (void *)MEMORY[0x1E4F1C9E8];
  id v11 = a8;
  uint64_t v12 = [v10 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v13 = [v9 errorWithDomain:@"CADSpotlightDaemonClientHandlerErrorDomain" code:0 userInfo:v12];
  (*((void (**)(id, void, void *))a8 + 2))(v11, 0, v13);
}

- (BOOL)_pushBatchedUpdatesForCalendarItemsWithUUIDs:(id)a3 database:(CalDatabase *)a4 personaID:(id)a5 deleteBeforeInserting:(BOOL)a6
{
  return [(CADSpotlightIndexer *)self _pushUpdatesForCalendarItemsWithUUIDs:a3 inBatchesOf:100 database:a4 personaID:a5 deleteBeforeInserting:a6];
}

- (BOOL)_pushUpdatesForCalendarItemsWithUUIDs:(id)a3 inBatchesOf:(unint64_t)a4 database:(CalDatabase *)a5 personaID:(id)a6 deleteBeforeInserting:(BOOL)a7
{
  BOOL v32 = a7;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v33 = a6;
  if (v11 && [v11 count])
  {
    uint64_t v12 = (void *)CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v14 = v12;
      id v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v40 = v15;
      __int16 v41 = 2112;
      uint64_t v42 = v16;
      _os_log_impl(&dword_1BBC88000, v14, OS_LOG_TYPE_INFO, "Pushing [%@] calendar items in batches of [%@]", buf, 0x16u);
    }
    unint64_t v17 = [v11 count];
    if (v17 >= a4) {
      unint64_t v18 = a4;
    }
    else {
      unint64_t v18 = v17;
    }
    int v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v18];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v31 = v11;
    id v20 = v11;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          [v19 addObject:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          if ([v19 count] >= a4)
          {
            BOOL v25 = [(CADSpotlightIndexer *)self _pushUpdatesForCalendarItemsWithUUIDs:v19 database:a5 personaID:v33 deleteBeforeInserting:v32];
            [(CADSpotlightIndexer *)self _resetDatabase:a5];
            [v19 removeAllObjects];
            if (!v25) {
              goto LABEL_24;
            }
          }
          uint64_t v26 = [(CalCancellationTokenSource *)self->_cancellationTokenSource token];
          int v27 = [v26 isCancelled];

          if (v27)
          {
            if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR)) {
              -[CADSpotlightIndexer _pushUpdatesForCalendarItemsWithUUIDs:inBatchesOf:database:personaID:deleteBeforeInserting:]();
            }
            +[CADSpotlightLogger logError:@"returning NO because indexer was shutdown"];
LABEL_24:

            BOOL v28 = 0;
            goto LABEL_25;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    BOOL v28 = [(CADSpotlightIndexer *)self _pushUpdatesForCalendarItemsWithUUIDs:v19 database:a5 personaID:v33 deleteBeforeInserting:v32];
LABEL_25:

    id v11 = v31;
  }
  else
  {
    uint64_t v29 = CADSpotlightHandle;
    BOOL v28 = 1;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1BBC88000, v29, OS_LOG_TYPE_INFO, "No UUIDs were given.  Will not push any calendar items to Spotlight in batches.", buf, 2u);
    }
  }

  return v28;
}

- (BOOL)_pushUpdatesForCalendarItemsWithUUIDs:(id)a3 database:(CalDatabase *)a4 personaID:(id)a5 deleteBeforeInserting:(BOOL)a6
{
  BOOL v23 = a6;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v22 = a5;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEBUG)) {
    -[CADSpotlightIndexer _pushUpdatesForCalendarItemsWithUUIDs:database:personaID:deleteBeforeInserting:]();
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * v14);
        uint64_t v16 = (const void *)CalDatabaseCopyCalendarItemWithUUID();
        if (v16)
        {
          unint64_t v17 = v16;
          CFArrayAppendValue(Mutable, v16);
          CFRelease(v17);
        }
        else
        {
          unint64_t v18 = CADSpotlightHandle;
          if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v29 = v15;
            _os_log_error_impl(&dword_1BBC88000, v18, OS_LOG_TYPE_ERROR, "Could not find a calendar item with UUID [%@].  Will not push this item to Spotlight.", buf, 0xCu);
          }
          +[CADSpotlightLogger logError:@"Could not find a calendar item with UUID [%@].  Will not push this item to Spotlight.", v15];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v12);
  }

  BOOL v19 = [(CADSpotlightIndexer *)self _upsertToIndex:Mutable inDatabase:a4 personaID:v22 deleteBeforeInserting:v23];
  CFRelease(Mutable);

  return v19;
}

- (void)_resetDatabase:(CalDatabase *)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationTokenSource, 0);
  objc_storeStrong((id *)&self->_spotlightEntityAnnotator, 0);
  objc_storeStrong((id *)&self->_databaseConfiguration, 0);
  objc_storeStrong((id *)&self->_spotlightDefaults, 0);
  objc_storeStrong((id *)&self->_spotlightIndexProvider, 0);
  objc_storeStrong((id *)&self->_incrementalUpdateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_1(&dword_1BBC88000, v2, (uint64_t)v2, "Returning because indexer was shutdown", v3);
}

void __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_1(&dword_1BBC88000, v2, (uint64_t)v2, "Spotlight error while upserting to the index, not advancing change sequence number", v3);
}

void __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_1(&dword_1BBC88000, v2, (uint64_t)v2, "Spotlight error while deleting from index, not advancing change sequence number", v3);
}

void __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BBC88000, v0, v1, "While fetching changes to do an incremental index, change tracking told us changes were truncated so we are registering for changes and doing a full-reindex", v2, v3, v4, v5, v6);
}

void __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1BBC88000, v0, v1, "Error deleting searchable items for calendar, error = %@", v2, v3, v4, v5, v6);
}

void __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1BBC88000, v0, v1, "Error deleting searchable items for calendar, error = %@. Retrying...", v2, v3, v4, v5, v6);
}

void __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_64_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1BBC88000, v4, v5, "Error indexing %lu events in this database as part of a full-reindex, retrying...", v6, v7, v8, v9, v10);
}

void __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_64_cold_2(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1BBC88000, v4, v5, "Error indexing %lu events in this database as part of a full-reindex, out of retries", v6, v7, v8, v9, v10);
}

+ (void)_personaID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BBC88000, v0, v1, "Error determining non-empty personaID for non-nil auxDatabase", v2, v3, v4, v5, v6);
}

- (void)_upsertsAndDeletesFromChanges:(unsigned char *)a1 inDatabase:(unsigned char *)a2 personaID:outUpserts:outDeletes:.cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_1(&dword_1BBC88000, v2, (uint64_t)v2, "CADObjectId was nil for change, skipping", v3);
}

void __40__CADSpotlightIndexer__deleteFromIndex___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1BBC88000, v1, v2, "Failed to push spotlight deletes for domain ids: %{public}@, %@", (void)v3, DWORD2(v3));
}

- (void)_upsertToIndex:(unsigned char *)a1 inDatabase:(unsigned char *)a2 personaID:deleteBeforeInserting:.cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_1(&dword_1BBC88000, v2, (uint64_t)v2, "Skip indexing event because it has a row id of -1", v3);
}

- (void)_upsertToIndex:(unsigned char *)a1 inDatabase:(unsigned char *)a2 personaID:deleteBeforeInserting:.cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_1(&dword_1BBC88000, v2, (uint64_t)v2, "Returning NO because indexer was shutdown", v3);
}

void __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_144_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1BBC88000, v0, v1, "Failed to push spotlight inserts/updates: %@", v2, v3, v4, v5, v6);
}

void __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_148_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1BBC88000, v1, v2, "Failed to push spotlight deletes for ids before indexing: %{public}@, %@", (void)v3, DWORD2(v3));
}

+ (void)_spotlightDomainIDForItem:bundleID:personaID:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1BBC88000, v0, v1, "Unable to get valid domain ID when there's not a valid storeID. CalendarID: %@", v2, v3, v4, v5, v6);
}

- (void)reindexAllItemsForBundleID:protectionClass:acknowledgementHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BBC88000, v0, v1, "Calling ack handler and returning because indexer was shutdown", v2, v3, v4, v5, v6);
}

- (void)reindexAllItemsForBundleID:(uint64_t)a1 protectionClass:acknowledgementHandler:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1BBC88000, v1, v2, "CADSpotlightDaemonClientHandler: Aborting unexpected request to reindex all searchable items for Core Spotlight for bundleID: %@ for donation manager with bundleID: %@", (void)v3, DWORD2(v3));
}

- (void)provideDataForBundleID:(uint64_t)a1 protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1BBC88000, v1, v2, "CADSpotlightDaemonClientHandler: Aborting unexpected request for data on searchable items for Core Spotlight for bundleID: %@ for donation manager with bundleID: %@", (void)v3, DWORD2(v3));
}

- (void)_pushUpdatesForCalendarItemsWithUUIDs:inBatchesOf:database:personaID:deleteBeforeInserting:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BBC88000, v0, v1, "Returning NO because indexer was shutdown", v2, v3, v4, v5, v6);
}

- (void)_pushUpdatesForCalendarItemsWithUUIDs:database:personaID:deleteBeforeInserting:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1BBC88000, v0, OS_LOG_TYPE_DEBUG, "Attempting to push calendar items to Spotlight.  Calendar item UUIDs: [%@]", v1, 0xCu);
}

@end