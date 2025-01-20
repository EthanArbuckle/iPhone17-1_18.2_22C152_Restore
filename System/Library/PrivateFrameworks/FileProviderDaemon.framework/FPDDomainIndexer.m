@interface FPDDomainIndexer
- (BOOL)isIndexed;
- (BOOL)learnNeedsAuthenticationFromBatchError;
- (BOOL)needsAuthentication;
- (BOOL)needsIndexing;
- (FPDDomain)domain;
- (FPDDomainIndexer)initWithExtension:(id)a3 domain:(id)a4 enabled:(BOOL)a5;
- (FPDDomainIndexerDelegate)delegate;
- (FPDDomainIndexerState)state;
- (FPDExtension)extension;
- (NSString)domainIdentifier;
- (NSString)watcherLabel;
- (OS_dispatch_queue)queue;
- (id)description;
- (id)localSpotlightIndexer;
- (unint64_t)maxRetryDelayInSec;
- (void)__indexOneBatchIfPossibleClearingNeedsIndexing:(BOOL)a3;
- (void)_cancelTimer;
- (void)_handleOneBatchCompletionWithError:(id)a3 hasMoreChanges:(BOOL)a4;
- (void)_indexOneBatchIfPossibleClearingNeedsIndexing:(BOOL)a3;
- (void)_signalChangesWithCompletionHandler:(id)a3;
- (void)_unregisterFromScheduler;
- (void)clearNeedsAuth;
- (void)dropIndexForReason:(unint64_t)a3 completion:(id)a4;
- (void)dumpStateTo:(id)a3;
- (void)dumpStateTo:(id)a3 withName:(id)a4;
- (void)indexOneBatchWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setExtension:(id)a3;
- (void)setIndexingEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setMaxRetryDelayInSec:(unint64_t)a3;
- (void)setNeedsAuth;
- (void)setState:(id)a3;
- (void)sharedSchedulerCanRun:(id)a3;
- (void)sharedSchedulerIsDeferred:(id)a3;
- (void)signalChangesWithCompletionHandler:(id)a3;
- (void)signalNeedsReindexFromScratchWithDropReason:(unint64_t)a3 completionHandler:(id)a4;
- (void)signalNeedsReindexItemsWithIdentifiers:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5;
- (void)start;
@end

@implementation FPDDomainIndexer

- (BOOL)isIndexed
{
  v3 = [(FPDDomainIndexer *)self state];
  if (([v3 droppedIndex] & 1) != 0 || !self->_isStarted)
  {
    v5 = [(FPDDomainIndexer *)self state];
    char v4 = [v5 needsIndexing];
  }
  else
  {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)needsAuthentication
{
  v2 = [(FPDDomainIndexer *)self state];
  char v3 = [v2 needsAuth];

  return v3;
}

- (FPDDomainIndexerState)state
{
  return self->_state;
}

- (NSString)watcherLabel
{
  return self->_providerDomainID;
}

- (void)sharedSchedulerCanRun:(id)a3
{
  id v4 = a3;
  indexingScheduler();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v7 = NSString;
    v8 = [v4 label];
    v9 = [v7 stringWithFormat:@"[ASSERT] ‼️ unexpected scheduler called the indexer: %@", v8];

    v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomainIndexer sharedSchedulerCanRun:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 400, (const char *)[v9 UTF8String]);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__FPDDomainIndexer_sharedSchedulerCanRun___block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __55__FPDDomainIndexer_signalChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  char v3 = [*(id *)(a1 + 32) domain];
  id v4 = [v3 log];
  v8 = fpfs_adopt_log();

  uint64_t section = __fp_create_section();
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __55__FPDDomainIndexer_signalChangesWithCompletionHandler___block_invoke_cold_2();
  }

  if (*((unsigned char *)*v2 + 41))
  {
    objc_msgSend(*v2, "_signalChangesWithCompletionHandler:", *(void *)(a1 + 40), section, v8);
  }
  else
  {
    v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __55__FPDDomainIndexer_signalChangesWithCompletionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
  }
  __fp_leave_section_Debug();
  __fp_pop_log();
}

- (FPDDomain)domain
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  return (FPDDomain *)WeakRetained;
}

void __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke_2_118(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) domain];
  char v3 = [v2 log];
  id v4 = fpfs_adopt_log();

  [*(id *)(a1 + 32) _handleOneBatchCompletionWithError:*(void *)(a1 + 40) hasMoreChanges:*(unsigned __int8 *)(a1 + 48)];
  __fp_pop_log();
}

uint64_t __42__FPDDomainIndexer_sharedSchedulerCanRun___block_invoke(uint64_t a1)
{
  __fp_create_section();
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__FPDDomainIndexer_sharedSchedulerCanRun___block_invoke_cold_2();
  }

  [*(id *)(a1 + 32) _unregisterFromScheduler];
  char v3 = *(unsigned char **)(a1 + 32);
  if (v3[40])
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __42__FPDDomainIndexer_sharedSchedulerCanRun___block_invoke_cold_1();
    }
  }
  else
  {
    objc_msgSend(v3, "__indexOneBatchIfPossibleClearingNeedsIndexing:", v3[44]);
  }
  return __fp_leave_section_Debug();
}

- (void)_handleOneBatchCompletionWithError:(id)a3 hasMoreChanges:(BOOL)a4
{
  int v4 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 extensionIndexerDidIndexOneBatch:self];
  }
  uint64_t section = __fp_create_section();
  v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v37 = objc_msgSend(v7, "fp_prettyDescription");
    v38 = (void *)v37;
    v39 = @"success";
    if (v37) {
      v39 = (__CFString *)v37;
    }
    v40 = @"no";
    *(_DWORD *)buf = 134218754;
    *(void *)&buf[4] = section;
    __int16 v56 = 2112;
    unint64_t v57 = (unint64_t)self;
    __int16 v58 = 2112;
    if (v4) {
      v40 = @"yes";
    }
    unint64_t v59 = (unint64_t)v39;
    __int16 v60 = 2112;
    v61 = v40;
    _os_log_debug_impl(&dword_1D744C000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: handling batch index completion: %@ more-changes:%@", buf, 0x2Au);
  }
  self->_isIndexing = 0;
  *(int64x2_t *)&self->_batchIndexedCount = vaddq_s64(*(int64x2_t *)&self->_batchIndexedCount, vdupq_n_s64(1uLL));
  if (v7)
  {
    ++self->_consecutiveBatchErrorCount;
    objc_storeStrong((id *)&self->_lastError, a3);
    if (objc_msgSend(v7, "fp_isFileProviderError:", -1000)) {
      int v4 = 0;
    }
    else {
      int v4 = objc_msgSend(v7, "fp_isFeatureUnsupportedError") ^ 1;
    }
  }
  else
  {
    if (([(NSError *)self->_lastError fp_isSyncAnchorExpiredError] & 1) == 0)
    {
      self->_unint64_t consecutiveBatchErrorCount = 0;
      lastError = self->_lastError;
      self->_lastError = 0;
    }
    [(FPDDomainIndexer *)self _cancelTimer];
  }
  if ([(FPDDomainIndexer *)self learnNeedsAuthenticationFromBatchError])
  {
    v13 = [(FPDDomainIndexer *)self state];
    int v14 = [v13 needsAuth];

    if (v14)
    {
      if (v7) {
        goto LABEL_18;
      }
      v15 = [(FPDDomainIndexer *)self state];
      [v15 setNeedsAuth:0];
    }
    else
    {
      if (!objc_msgSend(v7, "fp_isFileProviderError:", -1000)) {
        goto LABEL_18;
      }
      v15 = [(FPDDomainIndexer *)self state];
      [v15 setNeedsAuth:1];
    }
  }
LABEL_18:
  v16 = [(FPDDomainIndexer *)self state];
  int v17 = [v16 droppedIndex];
  if (v7) {
    int v18 = 0;
  }
  else {
    int v18 = v17;
  }

  if (v18)
  {
    v19 = objc_loadWeakRetained((id *)&self->_domain);
    if ([v19 isHidden])
    {
LABEL_25:

      goto LABEL_26;
    }
    id v20 = objc_loadWeakRetained((id *)&self->_domain);
    char v21 = [v20 isHiddenByUser];

    if ((v21 & 1) == 0)
    {
      v19 = [(FPDDomainIndexer *)self state];
      [v19 setDroppedIndex:0];
      goto LABEL_25;
    }
  }
LABEL_26:
  if ((v4 & 1) == 0)
  {
    v22 = [(FPDDomainIndexer *)self state];
    char v23 = [v22 needsIndexing];

    if ((v23 & 1) == 0)
    {
      v28 = [(FPDDomainIndexer *)self state];
      [v28 setNeedsIndexing:0];

      lastIndexingStartDate = self->_lastIndexingStartDate;
      self->_lastIndexingStartDate = 0;

      self->_batchIndexedCountSinceLastIndexing = 0;
      [(FPDDomainIndexer *)self _unregisterFromScheduler];
      v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[FPDDomainIndexer _handleOneBatchCompletionWithError:hasMoreChanges:].cold.5();
      }
      goto LABEL_36;
    }
  }
  v24 = [(FPDDomainIndexer *)self state];
  int v25 = [v24 needsIndexing];

  if (((v25 ^ 1 | v4) & 1) == 0)
  {
    v26 = fp_current_or_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomainIndexer _handleOneBatchCompletionWithError:hasMoreChanges:].cold.4();
    }
  }
  if (!v7)
  {
LABEL_48:
    [(FPDDomainIndexer *)self _indexOneBatchIfPossibleClearingNeedsIndexing:v4 ^ 1u];
    goto LABEL_49;
  }
  [(FPDDomainIndexer *)self _unregisterFromScheduler];
  if (objc_msgSend(v7, "fp_isFeatureUnsupportedError"))
  {
    v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[FPDDomainIndexer _handleOneBatchCompletionWithError:hasMoreChanges:]();
    }
LABEL_36:

    goto LABEL_49;
  }
  if (self->_timerSource)
  {
    v30 = fp_current_or_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend(v7, "fp_prettyDescription");
      [(FPDDomainIndexer *)v31 _handleOneBatchCompletionWithError:buf hasMoreChanges:v30];
    }

    goto LABEL_49;
  }
  unint64_t consecutiveBatchErrorCount = self->_consecutiveBatchErrorCount;
  BOOL v33 = consecutiveBatchErrorCount > 2;
  char v34 = consecutiveBatchErrorCount - 2;
  if (!v33)
  {
    v35 = fp_current_or_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = objc_msgSend(v7, "fp_prettyDescription");
      [(FPDDomainIndexer *)v36 _handleOneBatchCompletionWithError:buf hasMoreChanges:v35];
    }

    goto LABEL_48;
  }
  unint64_t v41 = 100000000 << v34;
  if (1000000000 * self->_maxRetryDelayInSec >= v41) {
    unint64_t v42 = v41;
  }
  else {
    unint64_t v42 = 1000000000 * self->_maxRetryDelayInSec;
  }
  v43 = fp_current_or_default_log();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    v50 = objc_msgSend(v7, "fp_prettyDescription");
    unint64_t v51 = self->_consecutiveBatchErrorCount;
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v50;
    __int16 v56 = 2048;
    unint64_t v57 = v42 / 0xF4240;
    __int16 v58 = 2048;
    unint64_t v59 = v51;
    _os_log_error_impl(&dword_1D744C000, v43, OS_LOG_TYPE_ERROR, "[ERROR] we received an error %@, retry in %llums (count:%lu)...", buf, 0x20u);
  }
  v44 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  timerSource = self->_timerSource;
  self->_timerSource = v44;

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v46 = self->_timerSource;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __70__FPDDomainIndexer__handleOneBatchCompletionWithError_hasMoreChanges___block_invoke;
  v52[3] = &unk_1E6A74010;
  objc_copyWeak(&v53, (id *)buf);
  v47 = v46;
  dispatch_block_t v48 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v52);
  dispatch_source_set_event_handler(v47, v48);

  dispatch_time_t v49 = dispatch_time(0, v42);
  dispatch_source_set_timer((dispatch_source_t)self->_timerSource, v49, 0xFFFFFFFFFFFFFFFFLL, v42);
  dispatch_resume((dispatch_object_t)self->_timerSource);
  objc_destroyWeak(&v53);
  objc_destroyWeak((id *)buf);
LABEL_49:
  __fp_leave_section_Debug();
}

- (void)_unregisterFromScheduler
{
  if (self->_registeredWithScheduler)
  {
    char v3 = indexingScheduler();
    [v3 removeWatcher:self];

    self->_registeredWithScheduler = 0;
  }
}

- (BOOL)learnNeedsAuthenticationFromBatchError
{
  return 1;
}

- (void)_signalChangesWithCompletionHandler:(id)a3
{
  int v4 = (void (**)(id, BOOL))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_timerSource)
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomainIndexer _signalChangesWithCompletionHandler:]((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);
    }

    [(FPDDomainIndexer *)self _cancelTimer];
  }
  v12 = [(FPDDomainIndexer *)self state];
  [v12 setNeedsIndexing:1];

  if (self->_isIndexing)
  {
    v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomainIndexer _signalChangesWithCompletionHandler:]((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  else
  {
    if (self->_isStarted)
    {
      [(FPDDomainIndexer *)self _indexOneBatchIfPossibleClearingNeedsIndexing:1];
      BOOL isIndexing = 0;
      goto LABEL_11;
    }
    v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomainIndexer _signalChangesWithCompletionHandler:]();
    }
  }

  BOOL isIndexing = self->_isIndexing;
LABEL_11:
  v4[2](v4, isIndexing);
}

- (void)_indexOneBatchIfPossibleClearingNeedsIndexing:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_timerSource) {
    -[FPDDomainIndexer _indexOneBatchIfPossibleClearingNeedsIndexing:]();
  }
  id v5 = [(FPDDomainIndexer *)self state];
  if ([v5 droppedIndex])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
    if ([WeakRetained isHidden])
    {

LABEL_7:
      uint64_t v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[FPDDomainIndexer _indexOneBatchIfPossibleClearingNeedsIndexing:]();
      }

      return;
    }
    id v7 = objc_loadWeakRetained((id *)&self->_domain);
    int v8 = [v7 isHiddenByUser];

    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  self->_clearNeedsIndexing = a3;
  id location = 0;
  objc_initWeak(&location, self);
  if (self->_registeredWithScheduler)
  {
    uint64_t v10 = indexingScheduler();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__FPDDomainIndexer__indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke;
    v14[3] = &unk_1E6A73FE8;
    v14[4] = self;
    char v11 = [v10 runIfPossible:v14];

    if ((v11 & 1) == 0)
    {
      v12 = fp_current_or_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[FPDDomainIndexer _indexOneBatchIfPossibleClearingNeedsIndexing:]();
      }
    }
  }
  else
  {
    self->_registeredWithScheduler = 1;
    v13 = indexingScheduler();
    [v13 addWatcher:self];
  }
  objc_destroyWeak(&location);
}

- (void)_cancelTimer
{
  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    int v4 = self->_timerSource;
    self->_timerSource = 0;
  }
}

- (void)__indexOneBatchIfPossibleClearingNeedsIndexing:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_timerSource) {
    -[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:].cold.6();
  }
  v15[5] = __fp_create_section();
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:].cold.5();
  }

  if (self->_invalidated)
  {
    uint64_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:].cold.4();
    }
  }
  else
  {
    if (self->_isIndexing)
    {
      uint64_t v10 = [NSString stringWithFormat:@"[ASSERT] ‼️ we are already indexing"];
      char v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        +[FPDVolume prettyNameForDomain:]();
      }

      __assert_rtn("-[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 465, (const char *)[v10 UTF8String]);
    }
    if (!self->_isStarted)
    {
      v12 = [NSString stringWithFormat:@"[ASSERT] ‼️ we try to index before starting"];
      v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        +[FPDVolume prettyNameForDomain:]();
      }

      __assert_rtn("-[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 466, (const char *)[v12 UTF8String]);
    }
    self->_BOOL isIndexing = 1;
    if (v3)
    {
      id v7 = [(FPDDomainIndexer *)self state];
      [v7 setNeedsIndexing:0];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke;
    v15[3] = &unk_1E6A73580;
    v15[4] = self;
    int v8 = (void *)MEMORY[0x1D9471EC0](v15);
    if (self->_enabled)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke_117;
      v14[3] = &unk_1E6A76AA0;
      v14[4] = self;
      [(FPDDomainIndexer *)self indexOneBatchWithCompletionHandler:v14];
    }
    else
    {
      uint64_t v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[FPDDomainIndexer __indexOneBatchIfPossibleClearingNeedsIndexing:]();
      }

      [(FPDDomainIndexer *)self dropIndexForReason:3 completion:v8];
    }
  }
  __fp_leave_section_Debug();
}

- (void)signalChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__FPDDomainIndexer_signalChangesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A73878;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke_117(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 120);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke_2_118;
  block[3] = &unk_1E6A75278;
  block[4] = v6;
  id v10 = v5;
  char v11 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
}

- (FPDDomainIndexer)initWithExtension:(id)a3 domain:(id)a4 enabled:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)FPDDomainIndexer;
  char v11 = [(FPDDomainIndexer *)&v34 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_extension, v9);
    id v13 = objc_storeWeak((id *)&v12->_domain, v10);
    uint64_t v14 = [v10 nsDomain];
    uint64_t v15 = [v14 spotlightDomainIdentifier];
    spotlightDomainIdentifier = v12->_spotlightDomainIdentifier;
    v12->_spotlightDomainIdentifier = (NSString *)v15;

    if (!v12->_spotlightDomainIdentifier)
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      id WeakRetained = objc_loadWeakRetained((id *)&v12->_domain);
      [v32 handleFailureInMethod:a2, v12, @"FPDDomainIndexer.m", 171, @"Domain %@ has no spotlight domain identifier", WeakRetained object file lineNumber description];
    }
    id v17 = objc_loadWeakRetained((id *)&v12->_domain);
    uint64_t v18 = [v17 identifier];
    domainIdentifier = v12->_domainIdentifier;
    v12->_domainIdentifier = (NSString *)v18;

    id v20 = objc_loadWeakRetained((id *)&v12->_domain);
    uint64_t v21 = [v20 providerDomainID];
    providerDomainID = v12->_providerDomainID;
    v12->_providerDomainID = (NSString *)v21;

    char v23 = [FPDDomainIndexerState alloc];
    v24 = [v10 supportURL];
    uint64_t v25 = [(FPDDomainIndexerState *)v23 initWithSupportURL:v24];
    state = v12->_state;
    v12->_state = (FPDDomainIndexerState *)v25;

    v12->_enabled = a5;
    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v28 = dispatch_queue_create("indexer", v27);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v28;

    v12->_maxRetryDelayInSec = 60;
    -[FPDDomainIndexerState setNeedsIndexing:](v12->_state, "setNeedsIndexing:", [v10 shouldIndexWhenStart]);
    v30 = indexingScheduler();
    [v30 ping];
  }
  return v12;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extension);
  uint64_t v6 = [WeakRetained identifier];
  BOOL v7 = [(NSString *)self->_domainIdentifier isEqualToString:*MEMORY[0x1E4F25C00]];
  if (v7)
  {
    id v8 = @"(default)";
  }
  else
  {
    id v8 = [(NSString *)self->_domainIdentifier fp_obfuscatedFilename];
  }
  id v9 = [v3 stringWithFormat:@"<%@: %p %@:%@ e:%d>", v4, self, v6, v8, self->_enabled];
  if (!v7) {

  }
  return v9;
}

- (void)start
{
  if (self->_invalidated)
  {
    BOOL v3 = [NSString stringWithFormat:@"[ASSERT] ‼️ can't resume an invalidated indexer"];
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomainIndexer start]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 195, (const char *)[v3 UTF8String]);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__FPDDomainIndexer_start__block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __25__FPDDomainIndexer_start__block_invoke(uint64_t a1)
{
  BOOL v3 = [*(id *)(a1 + 32) domain];
  uint64_t v4 = [v3 log];
  uint64_t v16 = fpfs_adopt_log();

  if (*(unsigned char *)(*(void *)(a1 + 32) + 43))
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __25__FPDDomainIndexer_start__block_invoke_cold_3();
    }
  }
  else
  {
    uint64_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __25__FPDDomainIndexer_start__block_invoke_cold_2();
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 43) = 1;
  }
  BOOL v7 = [*(id *)(a1 + 32) state];
  [v7 loadPersistedState];

  id v8 = [*(id *)(a1 + 32) state];
  if ([v8 needsIndexing] && (uint64_t v9 = *(void *)(a1 + 32), !*(unsigned char *)(v9 + 40)))
  {
    uint64_t v15 = *(void *)(v9 + 24);

    if (!v15) {
      [*(id *)(a1 + 32) _indexOneBatchIfPossibleClearingNeedsIndexing:1];
    }
  }
  else
  {
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  char v11 = [WeakRetained isHidden];
  if ((v11 & 1) != 0
    || (id v1 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128)), ([v1 isHiddenByUser] & 1) != 0))
  {
    v12 = [*(id *)(a1 + 32) state];
    char v13 = [v12 droppedIndex];

    if ((v11 & 1) == 0) {
    if ((v13 & 1) == 0)
    }
    {
      uint64_t v14 = fp_current_or_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __25__FPDDomainIndexer_start__block_invoke_cold_1();
      }

      [*(id *)(a1 + 32) dropIndexForReason:2 completion:&__block_literal_global_26];
    }
  }
  else
  {
  }
  __fp_pop_log();
}

- (void)invalidate
{
  if (self->_invalidated)
  {
    BOOL v3 = [NSString stringWithFormat:@"[ASSERT] ‼️ invalidated twice"];
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomainIndexer invalidate]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 234, (const char *)[v3 UTF8String]);
  }
  self->_invalidated = 1;
  [(FPDDomainIndexer *)self _unregisterFromScheduler];
  [(FPDDomainIndexer *)self _cancelTimer];
}

- (void)clearNeedsAuth
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__FPDDomainIndexer_clearNeedsAuth__block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __34__FPDDomainIndexer_clearNeedsAuth__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) state];
  int v3 = [v2 needsAuth];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) state];
    [v4 setNeedsAuth:0];

    id v5 = [*(id *)(a1 + 32) delegate];
    uint64_t v6 = *(void **)(a1 + 32);
    BOOL v7 = [v6 state];
    objc_msgSend(v5, "extensionIndexer:didChangeNeedsAuthentification:", v6, objc_msgSend(v7, "needsAuth"));

    id v8 = *(unsigned char **)(a1 + 32);
    if (v8[41])
    {
      [v8 _signalChangesWithCompletionHandler:&__block_literal_global_94];
    }
  }
}

- (void)setNeedsAuth
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__FPDDomainIndexer_setNeedsAuth__block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __32__FPDDomainIndexer_setNeedsAuth__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) state];
  char v3 = [v2 needsAuth];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 32) state];
    [v4 setNeedsAuth:1];

    id v7 = [*(id *)(a1 + 32) delegate];
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 state];
    objc_msgSend(v7, "extensionIndexer:didChangeNeedsAuthentification:", v5, objc_msgSend(v6, "needsAuth"));
  }
}

void __70__FPDDomainIndexer__handleOneBatchCompletionWithError_hasMoreChanges___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __70__FPDDomainIndexer__handleOneBatchCompletionWithError_hasMoreChanges___block_invoke_cold_1();
    }

    [WeakRetained _cancelTimer];
    [WeakRetained _indexOneBatchIfPossibleClearingNeedsIndexing:0];
  }
}

- (void)sharedSchedulerIsDeferred:(id)a3
{
  id v8 = a3;
  indexingScheduler();
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 != v8)
  {
    uint64_t v4 = NSString;
    id v5 = [v8 label];
    uint64_t v6 = [v4 stringWithFormat:@"[ASSERT] ‼️ unexpected scheduler called the indexer: %@", v5];

    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDDomainIndexer sharedSchedulerIsDeferred:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 423, (const char *)[v6 UTF8String]);
  }
}

void __66__FPDDomainIndexer__indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  indexingScheduler();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 sharedSchedulerCanRun:v2];
}

void __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 120);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke_2;
  v7[3] = &unk_1E6A736C0;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __67__FPDDomainIndexer___indexOneBatchIfPossibleClearingNeedsIndexing___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) domain];
  id v3 = [v2 log];
  uint64_t v4 = fpfs_adopt_log();

  objc_msgSend(*(id *)(a1 + 32), "_handleOneBatchCompletionWithError:hasMoreChanges:");
  __fp_pop_log();
}

- (void)indexOneBatchWithCompletionHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [NSString stringWithFormat:@"missing implementation of %s in %@", "-[FPDDomainIndexer indexOneBatchWithCompletionHandler:]", self];
  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = v5;
    _os_log_fault_impl(&dword_1D744C000, v6, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
  }

  __assert_rtn("-[FPDDomainIndexer indexOneBatchWithCompletionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomainIndexer/FPDDomainIndexer.m", 497, (const char *)[v5 UTF8String]);
}

- (void)signalNeedsReindexFromScratchWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  id v8 = [WeakRetained session];
  uint64_t v9 = (void *)[v8 newFileProviderProxyWithTimeout:0 pid:180.0];

  domainIdentifier = self->_domainIdentifier;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__FPDDomainIndexer_signalNeedsReindexFromScratchWithDropReason_completionHandler___block_invoke;
  v12[3] = &unk_1E6A73710;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 dropIndexForDomain:domainIdentifier dropReason:a3 completionHandler:v12];
}

void __82__FPDDomainIndexer_signalNeedsReindexFromScratchWithDropReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__FPDDomainIndexer_signalNeedsReindexFromScratchWithDropReason_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6A76AC8;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 signalChangesWithCompletionHandler:v7];
}

uint64_t __82__FPDDomainIndexer_signalNeedsReindexFromScratchWithDropReason_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)signalNeedsReindexItemsWithIdentifiers:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = objc_msgSend(a3, "fp_map:", &__block_literal_global_125);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  id v11 = [WeakRetained session];
  v12 = (void *)[v11 newFileProviderProxyWithTimeout:0 pid:180.0];

  domainIdentifier = self->_domainIdentifier;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__FPDDomainIndexer_signalNeedsReindexItemsWithIdentifiers_indexReason_completionHandler___block_invoke_2;
  v15[3] = &unk_1E6A73710;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  [v12 signalNeedsReindexItemsWithIdentifiers:v9 domainIdentifier:domainIdentifier indexReason:a4 completionHandler:v15];
}

id __89__FPDDomainIndexer_signalNeedsReindexItemsWithIdentifiers_indexReason_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = 0;
  [MEMORY[0x1E4F25D30] getDomainIdentifier:0 andIdentifier:&v4 fromCoreSpotlightIdentifier:a2];
  id v2 = v4;
  return v2;
}

void __89__FPDDomainIndexer_signalNeedsReindexItemsWithIdentifiers_indexReason_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__FPDDomainIndexer_signalNeedsReindexItemsWithIdentifiers_indexReason_completionHandler___block_invoke_3;
  v7[3] = &unk_1E6A76AC8;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 signalChangesWithCompletionHandler:v7];
}

uint64_t __89__FPDDomainIndexer_signalNeedsReindexItemsWithIdentifiers_indexReason_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)localSpotlightIndexer
{
  id v3 = NSString;
  p_extension = &self->_extension;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extension);
  id v6 = [WeakRetained identifier];
  id v7 = [v3 stringWithFormat:@"com.apple.FileProvider/%@", v6];

  id v8 = [v7 stringByAppendingPathComponent:self->_spotlightDomainIdentifier];

  id v9 = objc_alloc(MEMORY[0x1E4F23838]);
  id v10 = objc_loadWeakRetained((id *)p_extension);
  id v11 = [v10 descriptor];
  v12 = [v11 topLevelBundleIdentifier];
  id v13 = (void *)[v9 _initWithName:v8 protectionClass:0 bundleIdentifier:v12 options:0];

  return v13;
}

- (void)dropIndexForReason:(unint64_t)a3 completion:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a4;
  id v7 = [(FPDDomainIndexer *)self state];
  int v8 = [v7 droppedIndex];

  if (v8)
  {
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomainIndexer dropIndexForReason:completion:]();
    }

    v6[2](v6, 0);
  }
  else
  {
    id v10 = [(FPDDomainIndexer *)self state];
    [v10 recordIndexDropReason:a3];

    id v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[FPDDomainIndexer dropIndexForReason:completion:]();
    }

    v12 = [(FPDDomainIndexer *)self localSpotlightIndexer];
    id v13 = self->_domainIdentifier;
    v22[0] = self->_spotlightDomainIdentifier;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke;
    v17[3] = &unk_1E6A76B40;
    v17[4] = self;
    id v18 = v12;
    uint64_t v19 = v13;
    id v20 = v6;
    unint64_t v21 = a3;
    uint64_t v15 = v13;
    id v16 = v12;
    [v16 deleteSearchableItemsWithDomainIdentifiers:v14 reason:0 completionHandler:v17];
  }
}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) domain];
  id v5 = [v4 log];
  fpfs_adopt_log();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) beginIndexBatch];
    id v7 = *(void **)(a1 + 40);
    int v8 = [MEMORY[0x1E4F1C9B8] data];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_2;
    v10[3] = &unk_1E6A76B18;
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    [v7 endIndexBatchWithClientState:v8 completionHandler:v10];

    if (*(void *)(a1 + 64) != 1)
    {
      id v9 = [*(id *)(a1 + 32) state];
      [v9 setDroppedIndex:1];
    }
  }
  __fp_pop_log();
}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) domain];
  id v5 = [v4 log];
  fpfs_adopt_log();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_133;
    v9[3] = &unk_1E6A76AF0;
    id v7 = *(void **)(a1 + 40);
    int v8 = *(void **)(a1 + 48);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    id v11 = *(id *)(a1 + 56);
    [v8 fetchLastClientStateWithCompletionHandler:v9];
  }
  __fp_pop_log();
}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) domain];
  int v8 = [v7 log];
  id v16 = fpfs_adopt_log();

  if (v6)
  {
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_133_cold_2();
    }
LABEL_7:

    goto LABEL_8;
  }
  if ([v5 length])
  {
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_133_cold_1(a1, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_7;
  }
LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __fp_pop_log();
}

- (void)setIndexingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__FPDDomainIndexer_setIndexingEnabled_completionHandler___block_invoke;
  block[3] = &unk_1E6A737B0;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __57__FPDDomainIndexer_setIndexingEnabled_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) domain];
  id v3 = [v2 log];
  fpfs_adopt_log();
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t section = __fp_create_section();
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    BOOL v11 = @"user-enabled";
    if (!*(unsigned char *)(a1 + 48)) {
      BOOL v11 = @"user-disabled";
    }
    *(_DWORD *)buf = 134218498;
    uint64_t v17 = section;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    unint64_t v21 = v11;
    _os_log_debug_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: setting indexing to %@", buf, 0x20u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(v5 + 41))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    *(void *)(v5 + 48) = 0;
    *(void *)(*(void *)(a1 + 32) + 56) = 0;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 41) = *(unsigned char *)(a1 + 48);
    id v8 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48))
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __57__FPDDomainIndexer_setIndexingEnabled_completionHandler___block_invoke_141;
      v12[3] = &unk_1E6A73EB0;
      id v13 = *(id *)(a1 + 40);
      [v8 _signalChangesWithCompletionHandler:v12];
      id v9 = v13;
    }
    else
    {
      [v8 dropIndexForReason:3 completion:*(void *)(a1 + 40)];
      id v9 = [*(id *)(a1 + 32) state];
      [v9 setNeedsIndexing:0];
    }
  }
  __fp_leave_section_Debug();
  __fp_pop_log();
}

uint64_t __57__FPDDomainIndexer_setIndexingEnabled_completionHandler___block_invoke_141(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dumpStateTo:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
    id v9 = [WeakRetained nsDomain];
    uint64_t v10 = [v9 displayName];
    BOOL v11 = objc_msgSend(v10, "fp_obfuscatedFilename");

    if ([v11 length])
    {
      uint64_t v12 = [NSString stringWithFormat:@"(%@)", v11];

      BOOL v11 = (void *)v12;
    }
    [v6 write:@"domain: %@ %@\n", v7, v11];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__FPDDomainIndexer_dumpStateTo_withName___block_invoke;
  block[3] = &unk_1E6A736C0;
  id v14 = v6;
  id v26 = v14;
  v27 = self;
  dispatch_sync(queue, block);
  id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28CB0]), "initWithFileDescriptor:closeOnDealloc:", objc_msgSend(v14, "fd"), 0);
  id v16 = [(FPDDomainIndexer *)self extension];
  uint64_t v17 = [v16 domainForIdentifier:self->_domainIdentifier reason:0];
  __int16 v18 = [v17 session];
  uint64_t v19 = [v18 existingFileProviderProxyWithTimeout:0 onlyAlreadyLifetimeExtended:0 pid:-1.0];
  __int16 v20 = [v19 synchronousRemoteObjectProxy];
  domainIdentifier = self->_domainIdentifier;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __41__FPDDomainIndexer_dumpStateTo_withName___block_invoke_2;
  v23[3] = &unk_1E6A73580;
  id v24 = v14;
  id v22 = v14;
  [v20 dumpIndexStateForDomain:domainIdentifier toFileHandler:v15 completionHandler:v23];
}

void __41__FPDDomainIndexer_dumpStateTo_withName___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) write:@"      spDomainID:     %@\n", *(void *)(*(void *)(a1 + 40) + 88)];
  id v2 = *(void **)(a1 + 32);
  id v3 = indexingScheduler();
  [v2 write:@"      scheduler:      %@\n", v3];

  if (*(unsigned char *)(*(void *)(a1 + 40) + 41)) {
    id v4 = "yes";
  }
  else {
    id v4 = "no";
  }
  objc_msgSend(*(id *)(a1 + 32), "write:", @"      enabled:        %s\n", v4);
  if (*(unsigned char *)(*(void *)(a1 + 40) + 40)) {
    uint64_t v5 = "yes";
  }
  else {
    uint64_t v5 = "no";
  }
  objc_msgSend(*(id *)(a1 + 32), "write:", @"      indexing:       %s\n", v5);
  id v6 = [*(id *)(a1 + 40) state];
  [v6 dumpStateTo:*(void *)(a1 + 32)];

  objc_msgSend(*(id *)(a1 + 32), "write:", @"      errors:         %ld\n", *(void *)(*(void *)(a1 + 40) + 64));
  objc_msgSend(*(id *)(a1 + 32), "write:", @"      batch-indexed (since last startup): %lu\n", *(void *)(*(void *)(a1 + 40) + 48));
  uint64_t v7 = *(void *)(a1 + 40);
  if (*(void *)(v7 + 72))
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 40) + 72)];
    objc_msgSend(v8, "write:", @"      on-going index started:     %.3fs ago\n", v10);

    objc_msgSend(*(id *)(a1 + 32), "write:", @"      on-going index batch count: %lu\n", *(void *)(*(void *)(a1 + 40) + 56));
    uint64_t v7 = *(void *)(a1 + 40);
  }
  BOOL v11 = *(void **)(v7 + 80);
  if (v11)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    id v13 = [v11 description];
    objc_msgSend(v12, "write:", @"      last error: %s\n", objc_msgSend(v13, "UTF8String"));
  }
}

void __41__FPDDomainIndexer_dumpStateTo_withName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    int v4 = objc_msgSend(v3, "fp_isCocoaErrorCode:", 3072);
    uint64_t v5 = *(void **)(a1 + 32);
    if (v4)
    {
      [v5 write:@"      not dumping extension: not running\n"];
    }
    else
    {
      id v6 = [v7 description];
      [v5 write:@"      can't dump the extension: %@\n", v6];
    }
    id v3 = v7;
  }
}

- (void)dumpStateTo:(id)a3
{
}

- (BOOL)needsIndexing
{
  id v2 = [(FPDDomainIndexer *)self state];
  char v3 = [v2 needsIndexing];

  return v3;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (FPDDomainIndexerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FPDDomainIndexerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)maxRetryDelayInSec
{
  return self->_maxRetryDelayInSec;
}

- (void)setMaxRetryDelayInSec:(unint64_t)a3
{
  self->_maxRetryDelayInSec = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setState:(id)a3
{
}

- (FPDExtension)extension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extension);
  return (FPDExtension *)WeakRetained;
}

- (void)setExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extension);
  objc_storeStrong((id *)&self->_state, 0);
  objc_destroyWeak((id *)&self->_domain);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spotlightDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lastIndexingStartDate, 0);
  objc_storeStrong((id *)&self->_stableGroup, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_providerDomainID, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

void __25__FPDDomainIndexer_start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] Domain is hidden, dropping index", v2, v3, v4, v5, v6);
}

void __25__FPDDomainIndexer_start__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] 🧲  starting indexation", v2, v3, v4, v5, v6);
}

void __25__FPDDomainIndexer_start__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] 🧲  re-starting indexation", v2, v3, v4, v5, v6);
}

- (void)_handleOneBatchCompletionWithError:hasMoreChanges:.cold.1()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] indexing is not supported for this provider, don't retry", v1, 2u);
}

- (void)_handleOneBatchCompletionWithError:(uint8_t *)buf hasMoreChanges:(os_log_t)log .cold.2(void *a1, uint64_t *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *a2;
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = v5;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] we received an error %@, trying again (count:%lu)...", buf, 0x16u);
}

- (void)_handleOneBatchCompletionWithError:(uint8_t *)buf hasMoreChanges:(os_log_t)log .cold.3(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *(void *)(a2 + 64);
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v5;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] we received an error %@, retry is already scheduled (count:%u)...", buf, 0x12u);
}

- (void)_handleOneBatchCompletionWithError:hasMoreChanges:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] we were signaled while fetching changes, indexing again", v2, v3, v4, v5, v6);
}

- (void)_handleOneBatchCompletionWithError:hasMoreChanges:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] we're done!", v2, v3, v4, v5, v6);
}

void __70__FPDDomainIndexer__handleOneBatchCompletionWithError_hasMoreChanges___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] scheduling timer expired", v2, v3, v4, v5, v6);
}

void __42__FPDDomainIndexer_sharedSchedulerCanRun___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] already indexing", v2, v3, v4, v5, v6);
}

void __42__FPDDomainIndexer_sharedSchedulerCanRun___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx %@: XPC activity granted us some CPU time");
}

- (void)_indexOneBatchIfPossibleClearingNeedsIndexing:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] Not indexing - hidden domain", v2, v3, v4, v5, v6);
}

- (void)_indexOneBatchIfPossibleClearingNeedsIndexing:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] waiting for XPC activity before indexing", v2, v3, v4, v5, v6);
}

- (void)_indexOneBatchIfPossibleClearingNeedsIndexing:.cold.3()
{
}

- (void)__indexOneBatchIfPossibleClearingNeedsIndexing:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] dropping index", v2, v3, v4, v5, v6);
}

- (void)__indexOneBatchIfPossibleClearingNeedsIndexing:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] can't index anymore", v2, v3, v4, v5, v6);
}

- (void)__indexOneBatchIfPossibleClearingNeedsIndexing:.cold.5()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_3(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx %@: indexing one batch");
}

- (void)__indexOneBatchIfPossibleClearingNeedsIndexing:.cold.6()
{
}

- (void)dropIndexForReason:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] Index was already dropped, reason: %lu", v2, v3, v4, v5, v6);
}

- (void)dropIndexForReason:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] Dropping index, reason: %lu", v2, v3, v4, v5, v6);
}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Failed to drop index for domain %@; %@",
    v1,
    0x16u);
}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_8_0(&dword_1D744C000, v0, v1, "[CRIT] Failed to erase client state %@; %@");
}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_133_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__FPDDomainIndexer_dropIndexForReason_completion___block_invoke_133_cold_2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_8_0(&dword_1D744C000, v0, v1, "[CRIT] Failed verify client state %@; %@");
}

- (void)_signalChangesWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] not yet started", v2, v3, v4, v5, v6);
}

- (void)_signalChangesWithCompletionHandler:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_signalChangesWithCompletionHandler:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__FPDDomainIndexer_signalChangesWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] indexing is disabled because domain is disabled", v2, v3, v4, v5, v6);
}

void __55__FPDDomainIndexer_signalChangesWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1D744C000, v0, v1, "[DEBUG] ┏%llx %@: a change was signaled");
}

@end