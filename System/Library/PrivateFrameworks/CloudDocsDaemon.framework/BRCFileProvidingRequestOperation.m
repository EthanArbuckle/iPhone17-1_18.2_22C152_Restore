@interface BRCFileProvidingRequestOperation
- (BOOL)isRecursive;
- (BOOL)shouldRetryForError:(id)a3;
- (BOOL)wantsCurrentVersion;
- (BRCFileProvidingRequestOperation)initWithDirectoryItem:(id)a3;
- (BRCFileProvidingRequestOperation)initWithDocumentItem:(id)a3 client:(id)a4 session:(id)a5;
- (BRCFileProvidingRequestOperation)initWithName:(id)a3 session:(id)a4 readingOptions:(unint64_t)a5;
- (BRCFileProvidingRequestOperation)initWithURL:(id)a3 readingOptions:(unint64_t)a4 client:(id)a5 session:(id)a6;
- (NSSet)trackedFileObjects;
- (int)kind;
- (void)_detachAllTrackedDocID:(id)a3 error:(id)a4;
- (void)_finishAfterWaitingForDocumentsWithID:(id)a3 withEtagIfLoser:(id)a4 error:(id)a5;
- (void)_provideDirectoryContents:(id)a3 appLibrary:(id)a4;
- (void)_provideDirectoryRecursively:(id)a3;
- (void)_provideDocument:(id)a3;
- (void)_provideFlatDirectoryStructure:(id)a3;
- (void)_provideItem;
- (void)_provideURL;
- (void)addCompletionCallback:(id)a3;
- (void)cancel;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4;
- (void)main;
- (void)networkReachabilityChanged:(BOOL)a3;
- (void)setIsRecursive:(BOOL)a3;
- (void)setWantsCurrentVersion:(BOOL)a3;
@end

@implementation BRCFileProvidingRequestOperation

- (BOOL)isRecursive
{
  return self->_isRecursive;
}

- (void)setIsRecursive:(BOOL)a3
{
  self->_isRecursive = a3;
}

- (BOOL)wantsCurrentVersion
{
  return self->_wantsCurrentVersion;
}

- (void)setWantsCurrentVersion:(BOOL)a3
{
  self->_wantsCurrentVersion = a3;
}

- (BRCFileProvidingRequestOperation)initWithURL:(id)a3 readingOptions:(unint64_t)a4 client:(id)a5 session:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  v13 = [(BRCFileProvidingRequestOperation *)self initWithName:@"coordinated-read" session:a6 readingOptions:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_url, a3);
    objc_storeStrong((id *)&v14->_client, a5);
    uint64_t v15 = objc_opt_new();
    trackerFileObjects = v14->_trackerFileObjects;
    v14->_trackerFileObjects = (NSMutableSet *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    appLibrariesMonitored = v14->_appLibrariesMonitored;
    v14->_appLibrariesMonitored = v17;

    [(_BRCFrameworkOperation *)v14 setIgnoreMissingRemoteClientProxy:1];
  }

  return v14;
}

- (BRCFileProvidingRequestOperation)initWithDirectoryItem:(id)a3
{
  id v5 = a3;
  v6 = [v5 appLibrary];
  v7 = [v6 session];
  v8 = [(BRCFileProvidingRequestOperation *)self initWithName:@"recursive-download" session:v7 readingOptions:0];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_directoryItem, a3);
    uint64_t v9 = objc_opt_new();
    trackerFileObjects = v8->_trackerFileObjects;
    v8->_trackerFileObjects = (NSMutableSet *)v9;

    [(_BRCFrameworkOperation *)v8 setIgnoreMissingRemoteClientProxy:1];
  }

  return v8;
}

- (void)_provideDirectoryContents:(id)a3 appLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if ([(_BRCOperation *)v8 finishIfCancelled])
  {
    objc_sync_exit(v8);
  }
  else
  {
    uint64_t v9 = [[BRCTreeEnumerator alloc] initWithSession:v8->_session];
    treeEnumerator = v8->_treeEnumerator;
    v8->_treeEnumerator = v9;

    v8->_isStillEnumeratingDirectory = 1;
    objc_sync_exit(v8);

    objc_initWeak(&location, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke;
    v14[3] = &unk_1E69938D0;
    objc_copyWeak(&v15, &location);
    [(BRCTreeEnumerator *)v8->_treeEnumerator setCompletionHandler:v14];
    id v11 = v8->_treeEnumerator;
    BOOL isRecursive = v8->_isRecursive;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke_2;
    v13[3] = &unk_1E6994498;
    v13[4] = v8;
    [(BRCTreeEnumerator *)v11 enumerateBelow:v6 appLibrary:v7 recursively:isRecursive handler:v13];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  obj = objc_loadWeakRetained(v2);
  objc_sync_enter(obj);
  obj[552] = 0;
  objc_sync_exit(obj);

  [obj _finishAfterWaitingForDocumentsWithID:0 withEtagIfLoser:0 error:v3];
}

id __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isReserved])
  {
    v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke_2_cold_1();
    }

    id v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = [v3 itemID];
    v8 = [v7 itemIDString];
    uint64_t v9 = objc_msgSend(v6, "brc_errorNotOnDisk:", v8);

    goto LABEL_11;
  }
  if (![v3 isDocument])
  {
LABEL_10:
    uint64_t v9 = 0;
    goto LABEL_11;
  }
  v10 = [v3 asDocument];
  id v11 = [v10 st];
  id v12 = [v11 documentID];

  if (v12)
  {
    [*(id *)(a1 + 32) _provideDocument:v10];
LABEL_9:

    goto LABEL_10;
  }
  if ([v10 isDead]) {
    goto LABEL_9;
  }
  v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke_2_cold_2();
  }

  v16 = (void *)MEMORY[0x1E4F28C58];
  v17 = [v10 itemID];
  v18 = [v17 itemIDString];
  uint64_t v9 = objc_msgSend(v16, "brc_errorNotOnDisk:", v18);

LABEL_11:
  return v9;
}

- (void)_provideDirectoryRecursively:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 clientZone];
  id v7 = [v4 itemID];
  v8 = objc_msgSend(v6, "fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:", v7, -[_BRCOperation nonDiscretionary](v5, "nonDiscretionary"), 1);

  if (v8)
  {
    [v8 beginObservingChanges];
    objc_initWeak(&location, v5);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryRecursively___block_invoke;
    v14[3] = &unk_1E69944E8;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    [v8 addRecursiveDirectoryListCompletionBlock:v14];
    id WeakRetained = objc_loadWeakRetained((id *)&v5->_recursiveList);

    if (WeakRetained)
    {
      id v12 = brc_bread_crumbs();
      v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BRCFileProvidingRequestOperation(LegacyAdditions) _provideDirectoryRecursively:]();
      }
    }
    objc_storeWeak((id *)&v5->_recursiveList, v8);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = [v4 itemID];
    id v11 = [v4 appLibrary];
    [(BRCFileProvidingRequestOperation *)v5 _provideDirectoryContents:v10 appLibrary:v11];
  }
  objc_sync_exit(v5);
}

void __82__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryRecursively___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeWeak(WeakRetained + 71, 0);
    if (v3)
    {
      [v5 completedWithResult:0 error:v3];
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) appLibrary];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __82__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryRecursively___block_invoke_2;
      v7[3] = &unk_1E69944C0;
      v7[4] = v5;
      id v8 = *(id *)(a1 + 32);
      [v6 notifyClient:@"recursive-provide" whenFaultingIsDone:v7];
    }
  }
}

void __82__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryRecursively___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[BRCUserDefaults defaultsForMangledID:0];
    char v5 = [v4 ignoreFaultingErrorsDuringDirectoryProviding];

    if ((v5 & 1) == 0)
    {
      [*(id *)(a1 + 32) completedWithResult:0 error:v3];
      goto LABEL_8;
    }
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __82__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryRecursively___block_invoke_2_cold_1();
    }
  }
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) itemID];
  v10 = [*(id *)(a1 + 40) appLibrary];
  [v8 _provideDirectoryContents:v9 appLibrary:v10];

LABEL_8:
}

- (void)_provideFlatDirectoryStructure:(id)a3
{
  id v4 = a3;
  char v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 clientZone];
  id v7 = [v4 itemID];
  id v8 = [v6 fetchDirectoryContentsIfNecessary:v7 isUserWaiting:1 rescheduleApplyScheduler:1];

  if (v8)
  {
    [v8 beginObservingChangesWithDelegate:v5];
    objc_initWeak(&location, v5);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84__BRCFileProvidingRequestOperation_LegacyAdditions___provideFlatDirectoryStructure___block_invoke;
    v14[3] = &unk_1E69944E8;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    [v8 addDirectoryListCompletionBlock:v14];
    id WeakRetained = objc_loadWeakRetained((id *)&v5->_listOp);

    if (WeakRetained)
    {
      id v12 = brc_bread_crumbs();
      v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BRCFileProvidingRequestOperation(LegacyAdditions) _provideFlatDirectoryStructure:]();
      }
    }
    objc_storeWeak((id *)&v5->_listOp, v8);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCFileProvidingRequestOperation(LegacyAdditions) _provideFlatDirectoryStructure:]();
    }

    [(_BRCOperation *)v5 completedWithResult:0 error:0];
  }

  objc_sync_exit(v5);
}

void __84__BRCFileProvidingRequestOperation_LegacyAdditions___provideFlatDirectoryStructure___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeWeak(WeakRetained + 70, 0);
  }
  if (v3)
  {
    [v5 completedWithResult:0 error:v3];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) appLibrary];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__BRCFileProvidingRequestOperation_LegacyAdditions___provideFlatDirectoryStructure___block_invoke_2;
    v7[3] = &unk_1E69939E8;
    v7[4] = v5;
    [v6 notifyClient:@"flat-provide" whenFaultingIsDone:v7];
  }
}

void __84__BRCFileProvidingRequestOperation_LegacyAdditions___provideFlatDirectoryStructure___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[BRCUserDefaults defaultsForMangledID:0];
    int v5 = [v4 ignoreFaultingErrorsDuringDirectoryProviding];

    if (v5)
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __84__BRCFileProvidingRequestOperation_LegacyAdditions___provideFlatDirectoryStructure___block_invoke_2_cold_1();
      }

      id v3 = 0;
    }
  }
  [*(id *)(a1 + 32) completedWithResult:0 error:v3];
}

- (void)_provideURL
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_directoryItem)
  {
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCFileProvidingRequestOperation(LegacyAdditions) _provideURL]();
    }
  }
  id v3 = self->_url;
  id v4 = [(BRCAccountSession *)self->_session clientDB];
  [v4 assertOnQueue];

  memset(v22, 0, sizeof(v22));
  __brc_create_section(0, (uint64_t)"-[BRCFileProvidingRequestOperation(LegacyAdditions) _provideURL]", 198, v22);
  int v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = v22[0];
    v17 = [(NSURL *)v3 path];
    *(_DWORD *)buf = 134218498;
    uint64_t v24 = v16;
    __int16 v25 = 2112;
    id v26 = v17;
    __int16 v27 = 2112;
    v28 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx coordinated read for %@%@", buf, 0x20u);
  }
  id v7 = [[BRCURLToItemLookup alloc] initWithURL:v3 allowAppLibraryRoot:1 session:self->_session];
  id v21 = 0;
  BOOL v8 = [(BRCURLToItemLookup *)v7 resolveAndKeepOpenWithError:&v21];
  id v9 = v21;
  if (!v8)
  {
    id v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v18 = [(NSURL *)v3 path];
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = (uint64_t)v18;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 2112;
      v28 = v12;
      _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] can't resolve the parent, granting the read %@: %@%@", buf, 0x20u);
    }
    goto LABEL_12;
  }
  v10 = [(BRCURLToItemLookup *)v7 byIDLocalItem];
  if (!v10)
  {
    v10 = [(BRCURLToItemLookup *)v7 faultedLocalItem];
    if (!v10)
    {
      id v12 = brc_bread_crumbs();
      v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[BRCFileProvidingRequestOperation(LegacyAdditions) _provideURL]();
      }
LABEL_12:

      [(BRCURLToItemLookup *)v7 closePaths];
      [(_BRCOperation *)self completedWithResult:0 error:0];
      v10 = 0;
      goto LABEL_13;
    }
  }
  if ([v10 isDocument])
  {
    id v11 = [v10 asDocument];
    [(BRCFileProvidingRequestOperation *)self _provideDocument:v11];
LABEL_9:

    [(BRCURLToItemLookup *)v7 closePaths];
    goto LABEL_13;
  }
  if ([v10 isDirectory])
  {
    if ([(BRCFileProvidingRequestOperation *)self isRecursive])
    {
      id v11 = [v10 asDirectory];
      [(BRCFileProvidingRequestOperation *)self _provideDirectoryRecursively:v11];
    }
    else
    {
      id v11 = [v10 asDirectory];
      [(BRCFileProvidingRequestOperation *)self _provideFlatDirectoryStructure:v11];
    }
    goto LABEL_9;
  }
  v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[BRCFileProvidingRequestOperation(LegacyAdditions) _provideURL]();
  }

  [(BRCURLToItemLookup *)v7 closePaths];
  [(_BRCOperation *)self completedWithResult:0 error:0];
LABEL_13:

  __brc_leave_section(v22);
}

- (void)addCompletionCallback:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  callbacks = v4->_callbacks;
  if (!callbacks)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = v4->_callbacks;
    v4->_callbacks = (NSMutableArray *)v6;

    callbacks = v4->_callbacks;
  }
  BOOL v8 = (void *)MEMORY[0x1D94389C0](v9);
  [(NSMutableArray *)callbacks addObject:v8];

  objc_sync_exit(v4);
}

- (NSSet)trackedFileObjects
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSMutableSet *)v2->_trackerFileObjects copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BRCFileProvidingRequestOperation)initWithName:(id)a3 session:(id)a4 readingOptions:(unint64_t)a5
{
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BRCFileProvidingRequestOperation;
  v10 = [(_BRCOperation *)&v20 initWithName:a3];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_session, a4);
    if (initWithName_session_readingOptions__onceToken != -1) {
      dispatch_once(&initWithName_session_readingOptions__onceToken, &__block_literal_global_33);
    }
    id v12 = [(_BRCOperation *)v11 callbackQueue];
    dispatch_set_target_queue(v12, (dispatch_queue_t)initWithName_session_readingOptions__queue);

    BOOL v13 = (a5 & 0x40000) == 0;
    unint64_t v14 = (a5 & 0x40000) >> 18;
    unint64_t v15 = (a5 >> 17) & 1;
    v11->_BOOL isRecursive = v15;
    uint64_t v16 = v13;
    [(_BRCOperation *)v11 setNonDiscretionary:v16];
    v17 = [(BRCAccountSession *)v11->_session analyticsReporter];
    v18 = [(_BRCOperation *)v11 operationID];
    [v17 createUserDownloadEventForOperationID:v18 isRecursive:v15 isForBackup:v14];
  }
  return v11;
}

void __72__BRCFileProvidingRequestOperation_initWithName_session_readingOptions___block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("provide-request-queue", v0);

  v2 = (void *)initWithName_session_readingOptions__queue;
  initWithName_session_readingOptions__queue = (uint64_t)v1;
}

- (BRCFileProvidingRequestOperation)initWithDocumentItem:(id)a3 client:(id)a4 session:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [(BRCFileProvidingRequestOperation *)self initWithName:@"document-download" session:a5 readingOptions:0];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_documentItem, a3);
    objc_storeStrong((id *)&v12->_client, a4);
    uint64_t v13 = objc_opt_new();
    trackerFileObjects = v12->_trackerFileObjects;
    v12->_trackerFileObjects = (NSMutableSet *)v13;

    [(_BRCFrameworkOperation *)v12 setIgnoreMissingRemoteClientProxy:1];
  }

  return v12;
}

- (void)cancel
{
  v10.receiver = self;
  v10.super_class = (Class)BRCFileProvidingRequestOperation;
  [(_BRCOperation *)&v10 cancel];
  id v3 = self;
  objc_sync_enter(v3);
  id WeakRetained = objc_loadWeakRetained((id *)&v3->_listOp);
  [WeakRetained endObservingChangesWithDelegate:v3];

  objc_storeWeak((id *)&v3->_listOp, 0);
  id v5 = objc_loadWeakRetained((id *)&v3->_recursiveList);
  [v5 endObservingChanges];

  objc_storeWeak((id *)&v3->_recursiveList, 0);
  [(BRCTreeEnumerator *)v3->_treeEnumerator cancel];
  uint64_t v6 = (NSSet *)[(NSMutableSet *)v3->_trackerFileObjects copy];
  trackedVersionsToCancel = v3->_trackedVersionsToCancel;
  v3->_trackedVersionsToCancel = v6;
  BOOL v8 = v6;

  objc_sync_exit(v3);
  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  [(BRCFileProvidingRequestOperation *)v3 _detachAllTrackedDocID:v8 error:v9];
}

- (void)_detachAllTrackedDocID:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unint64_t v14 = objc_msgSend(v13, "fileObjectID", (void)v16);
          unint64_t v15 = [v13 etagIfLoser];
          [(BRCFileProvidingRequestOperation *)self downloadTrackedForFileObjectID:v14 withEtagIfLoser:v15 didFinishWithError:v7];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    [(BRCFileProvidingRequestOperation *)self downloadTrackedForFileObjectID:0 withEtagIfLoser:0 didFinishWithError:v7];
  }
}

- (void)_provideDocument:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 fileObjectID];
  if ([(_BRCOperation *)self nonDiscretionary])
  {
    id v6 = [(BRCAccountSession *)self->_session diskReclaimer];
    [v6 didAccessDocument:v4];
  }
  if ([v4 downloadStatus] == 3)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCFileProvidingRequestOperation _provideDocument:]();
    }
LABEL_6:

    [(BRCFileProvidingRequestOperation *)self _finishAfterWaitingForDocumentsWithID:0 withEtagIfLoser:0 error:0];
    goto LABEL_36;
  }
  if (![(BRCFileProvidingRequestOperation *)self wantsCurrentVersion]
    && [v4 downloadStatus] == 2)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCFileProvidingRequestOperation _provideDocument:]();
    }
    goto LABEL_6;
  }
  if (self->_client)
  {
    uint64_t v9 = [v4 appLibrary];
    if (v9 && ([(NSMutableSet *)self->_appLibrariesMonitored containsObject:v9] & 1) == 0)
    {
      [(NSMutableSet *)self->_appLibrariesMonitored addObject:v9];
      [(BRCXPCClient *)self->_client addAppLibrary:v9];
    }
  }
  uint64_t v10 = [v4 appLibrary];
  [v10 cancelWriteCoordinatorForItem:v4];

  id v36 = 0;
  char v11 = [v4 startDownloadInTask:0 options:0 etagIfLoser:0 stageFileName:0 error:&v36];
  id v12 = v36;
  if ((v11 & 1) == 0)
  {
    v22 = brc_bread_crumbs();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v38 = v4;
      __int16 v39 = 2112;
      id v40 = v12;
      __int16 v41 = 2112;
      v42 = v22;
      _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed to start downloading item %@: %@%@", buf, 0x20u);
    }

    [(BRCFileProvidingRequestOperation *)self _finishAfterWaitingForDocumentsWithID:0 withEtagIfLoser:0 error:v12];
    goto LABEL_35;
  }
  uint64_t v13 = +[BRCSystemResourcesManager manager];
  unint64_t v14 = [(BRCAccountSession *)self->_session volume];
  char v15 = objc_msgSend(v13, "hasEnoughSpaceForDevice:", objc_msgSend(v14, "deviceID"));

  if ((v15 & 1) == 0)
  {
    long long v16 = brc_bread_crumbs();
    long long v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[BRCFileProvidingRequestOperation _provideDocument:]();
    }

    long long v18 = [(BRCAccountSession *)self->_session diskReclaimer];
    [v18 requestPurgeSpace];
  }
  long long v19 = self;
  objc_sync_enter(v19);
  char v20 = [(BRCFileProvidingRequestOperation *)v19 isCancelled];
  if (v20)
  {
    int v21 = 0;
  }
  else
  {
    uint64_t v24 = +[BRCSystemResourcesManager manager];
    char v25 = [v24 isNetworkReachable];

    if (v25)
    {
      trackerFileObjects = v19->_trackerFileObjects;
      __int16 v27 = +[BRCTrackedVersion trackedVersionFor:v5 withEtagIfLoser:0 kind:[(BRCFileProvidingRequestOperation *)v19 kind]];
      [(NSMutableSet *)trackerFileObjects addObject:v27];

      v28 = [(BRCAccountSession *)self->_session analyticsReporter];
      uint64_t v29 = [(_BRCOperation *)v19 operationID];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __53__BRCFileProvidingRequestOperation__provideDocument___block_invoke;
      v33[3] = &unk_1E69981F8;
      id v34 = v5;
      id v35 = v4;
      [v28 lookupUserDownloadEventByOperationID:v29 accessor:v33];

      v30 = v34;
    }
    else
    {
      uint64_t v31 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4355 userInfo:0];
      v30 = v12;
      id v12 = (id)v31;
    }

    int v21 = 0;
    if (!v19->_isMonitoringReachability && !v12)
    {
      int v21 = 1;
      v19->_isMonitoringReachability = 1;
    }
  }
  objc_sync_exit(v19);

  if (v12)
  {
    [(BRCFileProvidingRequestOperation *)v19 _finishAfterWaitingForDocumentsWithID:v5 withEtagIfLoser:0 error:v12];
LABEL_35:

    goto LABEL_36;
  }
  if ((v20 & 1) == 0)
  {
    v32 = [(BRCAccountSession *)self->_session downloadTrackers];
    [v32 addDownloadTracker:v19 forFileObjectID:v5 withEtagIfLoser:0];

    if (v21)
    {
      id v12 = +[BRCSystemResourcesManager manager];
      [v12 addReachabilityObserver:v19];
      goto LABEL_35;
    }
  }
LABEL_36:
}

void __53__BRCFileProvidingRequestOperation__provideDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fileObjectIDs];
  [v4 addObject:*(void *)(a1 + 32)];

  objc_msgSend(v3, "setItemCount:", objc_msgSend(v3, "itemCount") + 1);
  id v5 = [*(id *)(a1 + 40) currentVersion];
  objc_msgSend(v3, "setTotalContentSize:", objc_msgSend(v3, "totalContentSize") + objc_msgSend(v5, "size"));
}

- (void)_provideItem
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _url == nil%@", v2, v3, v4, v5, v6);
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  id obj = a4;
  p_listOp = &self->_listOp;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_listOp);

  if (WeakRetained == v7) {
    objc_storeWeak((id *)p_listOp, obj);
  }
}

- (void)main
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _url != nil || _directoryItem != nil || _documentItem != nil%@", v2, v3, v4, v5, v6);
}

void __40__BRCFileProvidingRequestOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 32);
  if ([*(id *)(a1 + 32) finishIfCancelled])
  {
    uint64_t v2 = brc_bread_crumbs();
    uint64_t v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __40__BRCFileProvidingRequestOperation_main__block_invoke_cold_1(v1);
    }
  }
  else
  {
    uint64_t v4 = (void *)*v1;
    if (*(void *)(*v1 + 528))
    {
      [v4 _provideURL];
    }
    else
    {
      [v4 _provideItem];
    }
  }
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  if (!a3)
  {
    memset(v11, 0, sizeof(v11));
    __brc_create_section(0, (uint64_t)"-[BRCFileProvidingRequestOperation networkReachabilityChanged:]", 333, v11);
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[BRCFileProvidingRequestOperation networkReachabilityChanged:](v11);
    }

    uint8_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4355 userInfo:0];
    id v7 = [(_BRCOperation *)self callbackQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__BRCFileProvidingRequestOperation_networkReachabilityChanged___block_invoke;
    v9[3] = &unk_1E6993628;
    v9[4] = self;
    id v8 = v6;
    id v10 = v8;
    dispatch_async_with_logs_9(v7, v9);

    __brc_leave_section(v11);
  }
}

void __63__BRCFileProvidingRequestOperation_networkReachabilityChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 trackedFileObjects];
  [v2 _detachAllTrackedDocID:v3 error:*(void *)(a1 + 40)];
}

- (void)_finishAfterWaitingForDocumentsWithID:(id)a3 withEtagIfLoser:(id)a4 error:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = self;
  objc_sync_enter(v10);
  if (v10->_isFinished) {
    goto LABEL_4;
  }
  if (v10->_isStillEnumeratingDirectory)
  {
    objc_storeStrong((id *)&v10->_lastDownloadError, a5);
LABEL_4:
    objc_sync_exit(v10);

LABEL_5:
    goto LABEL_6;
  }
  p_lastDownloadError = (id *)&v10->_lastDownloadError;
  if (v9) {
    objc_storeStrong(p_lastDownloadError, a5);
  }
  else {
    id v9 = *p_lastDownloadError;
  }
  objc_sync_exit(v10);

  id v12 = v10;
  objc_sync_enter(v12);
  if (v16)
  {
    id v13 = v12[74];
    unint64_t v14 = +[BRCTrackedVersion trackedVersionFor:withEtagIfLoser:kind:](BRCTrackedVersion, "trackedVersionFor:withEtagIfLoser:kind:", v16, v8, [v12 kind]);
    [v13 removeObject:v14];
  }
  uint64_t v15 = [v12[74] count];
  objc_sync_exit(v12);

  if (!v15 || v9)
  {
    v10->_isFinished = 1;
    [v12 completedWithResult:0 error:v9];
    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (int)kind
{
  return 0;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCFileProvidingRequestOperation finishWithResult:error:]();
    }
  }
  else
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCFileProvidingRequestOperation finishWithResult:error:]();
    }
  }
  BOOL v10 = v7 == 0;

  char v11 = [(BRCAccountSession *)self->_session analyticsReporter];
  id v12 = [(_BRCOperation *)self operationID];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke;
  v53[3] = &unk_1E69981F8;
  id v13 = v7;
  id v54 = v13;
  v55 = self;
  [v11 lookupUserDownloadEventByOperationID:v12 accessor:v53];

  if (v10)
  {
    char v20 = [(BRCAccountSession *)self->_session clientDB];
    int v21 = [v20 serialQueue];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_14;
    v44[3] = &unk_1E6993698;
    v44[4] = self;
    dispatch_sync(v21, v44);
  }
  else if ([(BRCFileProvidingRequestOperation *)self isCancelled])
  {
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    char v52 = 0;
    unint64_t v14 = brc_task_tracker_create("cancellation");
    uint64_t v15 = [(BRCAccountSession *)self->_session clientDB];
    id v16 = [v15 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2;
    block[3] = &unk_1E6996D20;
    block[4] = self;
    id v17 = v14;
    id v47 = v17;
    v48 = &v49;
    dispatch_sync(v16, block);

    brc_task_tracker_wait((uint64_t)v17);
    if (*((unsigned char *)v50 + 24))
    {
      long long v18 = [(BRCAccountSession *)self->_session clientDB];
      long long v19 = [v18 serialQueue];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_13;
      v45[3] = &unk_1E6993698;
      v45[4] = self;
      dispatch_sync(v19, v45);
    }
    _Block_object_dispose(&v49, 8);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v22 = self->_appLibrariesMonitored;
  uint64_t v23 = [(NSMutableSet *)v22 countByEnumeratingWithState:&v40 objects:v57 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v22);
        }
        [(BRCXPCClient *)self->_client removeAppLibrary:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      }
      uint64_t v23 = [(NSMutableSet *)v22 countByEnumeratingWithState:&v40 objects:v57 count:16];
    }
    while (v23);
  }

  id v26 = +[BRCSystemResourcesManager manager];
  [v26 removeReachabilityObserver:self];

  __int16 v27 = [(BRCAccountSession *)self->_session downloadTrackers];
  [v27 removeDownloadTracker:self];

  v28 = self;
  objc_sync_enter(v28);
  uint64_t v29 = v28->_callbacks;
  callbacks = v28->_callbacks;
  v28->_callbacks = 0;

  objc_sync_exit(v28);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v31 = v29;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v36 objects:v56 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v37;
LABEL_21:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v37 != v33) {
        objc_enumerationMutation(v31);
      }
      if (!(*(unsigned int (**)(void))(*(void *)(*((void *)&v36 + 1) + 8 * v34) + 16))()) {
        break;
      }
      if (v32 == ++v34)
      {
        uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v36 objects:v56 count:16];
        if (v32) {
          goto LABEL_21;
        }
        break;
      }
    }
  }

  v35.receiver = v28;
  v35.super_class = (Class)BRCFileProvidingRequestOperation;
  [(_BRCFrameworkOperation *)&v35 finishWithResult:v6 error:v13];
}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [v7 setEndTime:v3];

  [v7 setDidSucceed:*(void *)(a1 + 32) == 0];
  uint64_t v4 = [v7 itemCount];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 576) analyticsReporter];
  id v6 = v5;
  if (v4) {
    [v5 submitEventMetric:v7];
  }
  else {
    [v5 forgetEventMetric:v7];
  }
}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = *(id *)(*(void *)(a1 + 32) + 616);
  objc_sync_exit(v2);

  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_cold_1();
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v21;
    *(void *)&long long v8 = 138412546;
    long long v19 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v13 = *(void **)(*(void *)(a1 + 32) + 576);
        unint64_t v14 = objc_msgSend(v12, "fileObjectID", v19, (void)v20);
        uint64_t v15 = [v13 itemByFileObjectID:v14];

        if ([v15 isFault])
        {
          id v16 = brc_bread_crumbs();
          id v17 = brc_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            long long v18 = [v12 fileObjectID];
            *(_DWORD *)buf = v19;
            char v25 = v18;
            __int16 v26 = 2112;
            __int16 v27 = v16;
            _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] evicting %@ because it's a fault and its download was cancelled%@", buf, 0x16u);
          }
          [v15 evictInTask:*(void *)(a1 + 40) options:1 error:0];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v9);
  }
}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_13(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 576) clientDB];
  [v1 flushToMakeEditsVisibleToIPCReaders];
}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_14(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 576) clientDB];
  [v1 flushToMakeEditsVisibleToIPCReaders];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDownloadError, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_trackedVersionsToCancel, 0);
  objc_storeStrong((id *)&self->_documentItem, 0);
  objc_storeStrong((id *)&self->_appLibrariesMonitored, 0);
  objc_storeStrong((id *)&self->_trackerFileObjects, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_recursiveList);
  objc_destroyWeak((id *)&self->_listOp);
  objc_storeStrong((id *)&self->_treeEnumerator, 0);
  objc_storeStrong((id *)&self->_directoryItem, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

void __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Item '%@' isn't on disk yet, failing the coordination%@");
}

void __90__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryContents_appLibrary___block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Huh? %@ doesn't have a document id...%@", v1, 0x16u);
}

void __82__BRCFileProvidingRequestOperation_LegacyAdditions___provideDirectoryRecursively___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Ignoring faulting error for recursive provide%@", v2, v3, v4, v5, v6);
}

void __84__BRCFileProvidingRequestOperation_LegacyAdditions___provideFlatDirectoryStructure___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Ignoring faulting error for flat provide%@", v2, v3, v4, v5, v6);
}

- (void)_provideDocument:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] %@ is already current%@");
}

- (void)_provideDocument:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] We don't have enough space on disk to download %@.  Let's try to free some%@");
}

- (void)_provideDocument:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] %@ is already downloaded%@");
}

void __40__BRCFileProvidingRequestOperation_main__block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] %@ was cancelled%@", (void)v3, DWORD2(v3));
}

- (void)networkReachabilityChanged:(void *)a1 .cold.1(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx network becomes not reachable, finishing the providing request%@", (void)v3, DWORD2(v3));
}

- (void)finishWithResult:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] granting coordinated read%@", v1, 0xCu);
}

- (void)finishWithResult:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] failing coordinated read with %@%@");
}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] we were cancelled, cancelling docIDs %@%@");
}

@end