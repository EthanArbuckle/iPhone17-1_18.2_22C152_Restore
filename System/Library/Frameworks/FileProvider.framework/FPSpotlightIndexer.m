@interface FPSpotlightIndexer
+ (id)indexerPropertyOfClass:(Class)a3 forKey:(id)a4 supportURL:(id)a5;
+ (void)setIndexerProperty:(id)a3 forKey:(id)a4 supportURL:(id)a5;
- (BOOL)isIndexing;
- (CSSearchableIndex)index;
- (FPProviderDomain)providerDomain;
- (FPSpotlightDropIndexDelegate)dropIndexDelegate;
- (FPSpotlightIndexer)initWithDomain:(id)a3 providerDomain:(id)a4 indexName:(id)a5 log:(id)a6 supportURL:(id)a7 dropIndexDelegate:(id)a8;
- (FPSpotlightIndexer)initWithDomain:(id)a3 providerDomain:(id)a4 log:(id)a5 supportURL:(id)a6 dropIndexDelegate:(id)a7;
- (FPXDomainContext)domainContext;
- (NSData)lastIndexState;
- (NSFileProviderDomain)domain;
- (NSFileProviderEnumerator)vendorEnumerator;
- (OS_dispatch_workloop)workloop;
- (OS_os_log)log;
- (id)_fetchClientStateIfNeeded;
- (id)description;
- (void)_fetchClientStateIfNeeded;
- (void)_fetchCurrentIndexingAnchorWithCompletionHandler:(id)a3;
- (void)_indexOneBatchFromAnchor:(id)a3 toAnchor:(id)a4 updatedItems:(id)a5 deletedItems:(id)a6 completionHandler:(id)a7;
- (void)_indexOneBatchWithCompletionHandler:(id)a3;
- (void)_indexOutOfBandUpdatedItems:(id)a3 deletedItems:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6;
- (void)_invalidate;
- (void)clearIndexState;
- (void)dealloc;
- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5;
- (void)dropIndexAndInvalidateWithDropReason:(unint64_t)a3 completionHandler:(id)a4;
- (void)dropIndexInQueue:(id)a3 dropReason:(unint64_t)a4 completionHandler:(id)a5;
- (void)dropIndexWithDropReason:(unint64_t)a3 completionHandler:(id)a4;
- (void)dumpStateTo:(id)a3;
- (void)fetchCurrentIndexingAnchorWithCompletionHandler:(id)a3;
- (void)indexOneBatchFromAnchor:(id)a3 toAnchor:(id)a4 updatedItems:(id)a5 deletedItems:(id)a6 completionHandler:(id)a7;
- (void)indexOneBatchWithCompletionHandler:(id)a3;
- (void)indexOutOfBandUpdatedItems:(id)a3 deletedItems:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6;
- (void)invalidate;
- (void)invalidateAsync;
- (void)learnNewIndexState:(id)a3;
- (void)setDomain:(id)a3;
- (void)setDomainContext:(id)a3;
- (void)setIndexing:(BOOL)a3;
- (void)setProviderDomain:(id)a3;
@end

@implementation FPSpotlightIndexer

void __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained) {
    __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_3_cold_1();
  }
  v7 = WeakRetained;
  v8 = [WeakRetained updatedItems];
  [*(id *)(a1 + 32) setUpdatedItems:v8];

  v9 = [v7 deletedItemIDs];
  [*(id *)(a1 + 32) setDeletedItemIDs:v9];

  [*(id *)(a1 + 32) setPassExpectedState:1];
  v10 = [v7 nextAnchor];
  [*(id *)(a1 + 32) setNextAnchor:v10];

  [*(id *)(a1 + 32) setFetchError:v5];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 hasMore];
  uint64_t v11 = [v7 nextAnchor];
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void __47__FPSpotlightIndexer__fetchClientStateIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = 0;

  v7 = *(void **)(a1 + 32);
  if (a3) {
    [v7 clearIndexState];
  }
  else {
    [v7 learnNewIndexState:v8];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 104));
}

- (void)learnNewIndexState:(id)a3
{
  v4 = (NSData *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPSpotlightIndexer learnNewIndexState:]();
  }

  lastIndexState = self->_lastIndexState;
  self->_lastIndexState = v4;
  self->_clientState = 3;
}

- (void)_indexOneBatchWithCompletionHandler:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v4 = fpfs_adopt_log(self->_log);
  uint64_t v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  v46 = [v5 currentPersona];

  id v66 = 0;
  v6 = [v46 userPersonaUniqueString];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  id v8 = [WeakRetained domain];
  v9 = [v8 personaIdentifier];
  if (v6 == v9)
  {

LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  id v10 = objc_loadWeakRetained((id *)&self->_domainContext);
  uint64_t v11 = [v10 domain];
  uint64_t v12 = [v11 personaIdentifier];
  char v13 = [v6 isEqualToString:v12];

  if ((v13 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v65 = 0;
  id v14 = (void *)[v46 copyCurrentPersonaContextWithError:&v65];
  id v15 = v65;
  id v16 = v66;
  id v66 = v14;

  if (v15)
  {
    v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  id v18 = objc_loadWeakRetained((id *)&self->_domainContext);
  v19 = [v18 domain];
  v20 = [v19 personaIdentifier];
  v21 = [v46 generateAndRestorePersonaContextWithPersonaUniqueString:v20];

  if (v21)
  {
    v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v42 = objc_loadWeakRetained((id *)&self->_domainContext);
      v43 = [v42 domain];
      v44 = [v43 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_error_impl(&dword_1A33AE000, v22, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  if (self->_vendorEnumerator || [(FPProviderDomain *)self->_providerDomain isUsingFPFS]) {
    goto LABEL_19;
  }
  id v23 = objc_loadWeakRetained((id *)&self->_domainContext);
  if (!v23) {
    __assert_rtn("-[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:]", "FPSpotlightIndexer.m", 261, "self->_domainContext");
  }

  v24 = [(FPSpotlightIndexer *)self domainContext];
  v25 = [v24 vendorInstance];
  v26 = +[NSFileProviderRequest requestFromTheSystem];
  id v64 = 0;
  v27 = [v25 enumeratorForContainerItemIdentifier:@"NSFileProviderWorkingSetContainerItemIdentifier" request:v26 error:&v64];
  id v28 = v64;
  vendorEnumerator = self->_vendorEnumerator;
  self->_vendorEnumerator = v27;

  if (self->_vendorEnumerator)
  {

LABEL_19:
    id v28 = [(FPSpotlightIndexer *)self _fetchClientStateIfNeeded];
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    char v60 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v68 = __Block_byref_object_copy__2;
    v69 = __Block_byref_object_dispose__2;
    id v70 = 0;
    v30 = [[FPSpotlightFetchOneBatchFromWorkingSetOperation alloc] initWithIndexer:self queue:self->_workloop];
    [(FPSpotlightFetchOneBatchFromWorkingSetOperation *)v30 setQualityOfService:17];
    if (self->_fetchStateOperation) {
      -[FPSpotlightFetchOneBatchFromWorkingSetOperation addDependency:](v30, "addDependency:");
    }
    v31 = [[FPSpotlightIndexOneBatchOperation alloc] initWithIndexer:self isInitialIndexing:0 isOutOfBandIndexing:0 queue:self->_workloop];
    [(FPSpotlightIndexOneBatchOperation *)v31 setIndexReason:1];
    id location = 0;
    objc_initWeak(&location, self);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_81;
    v53[3] = &unk_1E5AF1C40;
    objc_copyWeak(&v57, &location);
    v55 = buf;
    v56 = v59;
    id v54 = v45;
    [(FPOperation *)v31 setFinishedBlock:v53];
    [(FPSpotlightIndexOneBatchOperation *)v31 setQualityOfService:17];
    if (self->_fetchStateOperation) {
      -[FPSpotlightIndexOneBatchOperation addDependency:](v31, "addDependency:");
    }
    id from = 0;
    objc_initWeak(&from, v30);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_3;
    v47[3] = &unk_1E5AF1C68;
    objc_copyWeak(&v51, &from);
    v32 = v31;
    v48 = v32;
    v49 = v59;
    v50 = buf;
    [(FPOperation *)v30 setFinishedBlock:v47];
    if (v28)
    {
      v33 = fp_current_or_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:]();
      }

      [(NSOperationQueue *)self->_operationQueue addOperation:v28];
    }
    v34 = fp_current_or_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:]();
    }

    operationQueue = self->_operationQueue;
    p_operationQueue = &self->_operationQueue;
    [(NSOperationQueue *)operationQueue addOperation:v30];
    v37 = fp_current_or_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:]();
    }

    [(NSOperationQueue *)*p_operationQueue addOperation:v32];
    objc_destroyWeak(&v51);
    objc_destroyWeak(&from);

    objc_destroyWeak(&v57);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v59, 8);
    goto LABEL_32;
  }
  if (objc_msgSend(v28, "fp_isFileProviderError:", -1000))
  {
    v38 = fp_current_or_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(v28, "fp_prettyDescription");
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v39;
      _os_log_impl(&dword_1A33AE000, v38, OS_LOG_TYPE_DEFAULT, "[WARNING] can't create vendor enumerator: %@", buf, 0xCu);
    }
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke;
    v61[3] = &unk_1E5AF0E90;
    id v63 = v45;
    id v28 = v28;
    id v62 = v28;
    [(FPSpotlightIndexer *)self dropIndexWithDropReason:12 completionHandler:v61];
  }
  else
  {
    v40 = fp_current_or_default_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = objc_msgSend(v28, "fp_prettyDescription");
      [(FPSpotlightIndexer *)v41 _indexOneBatchWithCompletionHandler:v40];
    }

    (*((void (**)(id, void, id))v45 + 2))(v45, 0, v28);
  }
LABEL_32:

  _FPRestorePersona(&v66);
}

- (void)setDomainContext:(id)a3
{
}

- (FPSpotlightIndexer)initWithDomain:(id)a3 providerDomain:(id)a4 log:(id)a5 supportURL:(id)a6 dropIndexDelegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = NSString;
  id v18 = [v13 providerID];
  v19 = [v17 stringWithFormat:@"com.apple.FileProvider/%@", v18];

  if (v12)
  {
    v20 = [v12 spotlightDomainIdentifier];
    uint64_t v21 = [v19 stringByAppendingPathComponent:v20];

    v19 = (void *)v21;
  }
  v22 = [(FPSpotlightIndexer *)self initWithDomain:v12 providerDomain:v13 indexName:v19 log:v14 supportURL:v15 dropIndexDelegate:v16];

  return v22;
}

- (FPSpotlightIndexer)initWithDomain:(id)a3 providerDomain:(id)a4 indexName:(id)a5 log:(id)a6 supportURL:(id)a7 dropIndexDelegate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if ([getCSSearchableIndexClass() isIndexingAvailable])
  {
    v38.receiver = self;
    v38.super_class = (Class)FPSpotlightIndexer;
    v19 = [(FPSpotlightIndexer *)&v38 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_domain, a3);
      objc_storeStrong((id *)&v20->_providerDomain, a4);
      objc_storeStrong((id *)&v20->_indexName, a5);
      objc_storeStrong((id *)&v20->_supportURL, a7);
      uint64_t v21 = [v14 identifier];
      v22 = (void *)v21;
      if (v21) {
        id v23 = (__CFString *)v21;
      }
      else {
        id v23 = @"NSFileProviderDomainDefaultIdentifier";
      }
      objc_storeStrong((id *)&v20->_domainID, v23);

      dispatch_workloop_t v24 = dispatch_workloop_create("spotlight-indexer");
      workloop = v20->_workloop;
      v20->_workloop = (OS_dispatch_workloop *)v24;

      uint64_t v26 = objc_opt_new();
      operationQueue = v20->_operationQueue;
      v20->_operationQueue = (NSOperationQueue *)v26;

      [(NSOperationQueue *)v20->_operationQueue setMaxConcurrentOperationCount:1];
      objc_storeWeak((id *)&v20->_dropIndexDelegate, v18);
      id v28 = objc_alloc((Class)getCSSearchableIndexClass());
      indexName = v20->_indexName;
      uint64_t v30 = *MEMORY[0x1E4F28358];
      v31 = [v15 topLevelBundleIdentifier];
      uint64_t v32 = [v28 initWithName:indexName protectionClass:v30 bundleIdentifier:v31];
      index = v20->_index;
      v20->_index = (CSSearchableIndex *)v32;

      v20->_clientState = 1;
      dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
      clientStateSemaphore = v20->_clientStateSemaphore;
      v20->_clientStateSemaphore = (OS_dispatch_semaphore *)v34;
    }
    self = v20;
    v36 = self;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

void __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_81(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained) {
    goto LABEL_19;
  }
  int v6 = objc_msgSend(v4, "fp_isFileProviderError:", -1000);
  if (objc_msgSend(v4, "fp_isFileProviderError:", -1002))
  {
    int v7 = 1;
    if (v4) {
      goto LABEL_7;
    }
  }
  else
  {
    int v7 = objc_msgSend(v4, "fp_isFileProviderError:", -1002);
    if (v4) {
      goto LABEL_7;
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
LABEL_7:
    int v8 = v6 | v7;
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  int v8 = 1;
  if (v6)
  {
LABEL_8:
    char v9 = 0;
    if (!v8)
    {
LABEL_9:
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      goto LABEL_19;
    }
    goto LABEL_15;
  }
LABEL_11:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    char v9 = 1;
  }
  else {
    char v9 = v7;
  }
  if (!v8) {
    goto LABEL_9;
  }
LABEL_15:
  if (v6) {
    uint64_t v10 = 12;
  }
  else {
    uint64_t v10 = 8;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E5AF1C18;
  id v13 = *(id *)(a1 + 32);
  char v14 = v9;
  id v12 = v4;
  [WeakRetained dropIndexWithDropReason:v10 completionHandler:v11];

LABEL_19:
}

- (void)indexOneBatchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FPSpotlightIndexer *)self domainContext];
  workloop = self->_workloop;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__FPSpotlightIndexer_indexOneBatchWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5AF08A0;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(workloop, block);
}

- (FPXDomainContext)domainContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);

  return (FPXDomainContext *)WeakRetained;
}

- (BOOL)isIndexing
{
  return self->_indexing;
}

- (void)setIndexing:(BOOL)a3
{
  self->_indexing = a3;
}

- (id)_fetchClientStateIfNeeded
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = fpfs_adopt_log(self->_log);
  id v4 = [MEMORY[0x1E4FB36F8] sharedManager];
  v31 = [v4 currentPersona];

  id v34 = 0;
  uint64_t v5 = [v31 userPersonaUniqueString];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  id v7 = [WeakRetained domain];
  id v8 = [v7 personaIdentifier];
  if (v5 == v8)
  {

LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  id v9 = objc_loadWeakRetained((id *)&self->_domainContext);
  id v10 = [v9 domain];
  uint64_t v11 = [v10 personaIdentifier];
  char v12 = [v5 isEqualToString:v11];

  if ((v12 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v33 = 0;
  id v13 = (void *)[v31 copyCurrentPersonaContextWithError:&v33];
  id v14 = v33;
  id v15 = v34;
  id v34 = v13;

  if (v14)
  {
    id v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  id v17 = objc_loadWeakRetained((id *)&self->_domainContext);
  id v18 = [v17 domain];
  v19 = [v18 personaIdentifier];
  v20 = [v31 generateAndRestorePersonaContextWithPersonaUniqueString:v19];

  if (v20)
  {
    uint64_t v21 = fp_current_or_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v28 = objc_loadWeakRetained((id *)&self->_domainContext);
      v29 = [v28 domain];
      uint64_t v30 = [v29 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      v36 = v30;
      __int16 v37 = 2112;
      objc_super v38 = v20;
      _os_log_error_impl(&dword_1A33AE000, v21, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  if (self->_clientState == 1)
  {
    self->_clientState = 2;
    v22 = [FPSpotlightFetchClientStateOperation alloc];
    index = self->_index;
    indexName = self->_indexName;
    v25 = [(NSFileProviderDomain *)self->_domain spotlightDomainIdentifier];
    uint64_t v26 = [(FPSpotlightFetchClientStateOperation *)v22 initWithIndexer:self index:index indexName:indexName spotlightDomainIdentifier:v25 reason:@"indexing one batch" supportURL:self->_supportURL];

    [(FPOperation *)v26 setCallbackQueue:self->_workloop];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __47__FPSpotlightIndexer__fetchClientStateIfNeeded__block_invoke;
    v32[3] = &unk_1E5AF1BF0;
    v32[4] = self;
    [(FPOperation *)v26 setFinishedBlock:v32];
    [(FPSpotlightFetchClientStateOperation *)v26 setQualityOfService:17];
    objc_storeStrong((id *)&self->_fetchStateOperation, v26);
  }
  else
  {
    uint64_t v26 = 0;
  }

  _FPRestorePersona(&v34);

  return v26;
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

uint64_t __57__FPSpotlightIndexer_indexOneBatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 40) + 136) isUsingFPFS]) {
    __57__FPSpotlightIndexer_indexOneBatchWithCompletionHandler___block_invoke_cold_1();
  }
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 _indexOneBatchWithCompletionHandler:v3];
}

- (FPProviderDomain)providerDomain
{
  return self->_providerDomain;
}

- (NSFileProviderEnumerator)vendorEnumerator
{
  return (NSFileProviderEnumerator *)objc_getProperty(self, a2, 96, 1);
}

- (NSData)lastIndexState
{
  return self->_lastIndexState;
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)dealloc
{
  if (self->_vendorEnumerator)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"FPSpotlightIndexer.m" lineNumber:190 description:@"should call -invalidate"];
  }
  v5.receiver = self;
  v5.super_class = (Class)FPSpotlightIndexer;
  [(FPSpotlightIndexer *)&v5 dealloc];
}

- (id)description
{
  if (self->_clientState == 3) {
    uint64_t v3 = &stru_1EF68D1F8;
  }
  else {
    uint64_t v3 = @" not-ready";
  }
  if ([(NSOperationQueue *)self->_operationQueue isSuspended]) {
    id v4 = @" suspended";
  }
  else {
    id v4 = &stru_1EF68D1F8;
  }
  return (id)[NSString stringWithFormat:@"<%@:%@ %p %@%@ [%lu ops]>", objc_opt_class(), self->_indexName, self, v3, v4, -[NSOperationQueue operationCount](self->_operationQueue, "operationCount")];
}

- (void)clearIndexState
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Forgetting change token", v1, 0xCu);
}

uint64_t __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_indexOneBatchFromAnchor:(id)a3 toAnchor:(id)a4 updatedItems:(id)a5 deletedItems:(id)a6 completionHandler:(id)a7
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v43 = a4;
  id v45 = a5;
  id v44 = a6;
  id v42 = a7;
  id v12 = fpfs_adopt_log(self->_log);
  id v13 = [MEMORY[0x1E4FB36F8] sharedManager];
  v47 = [v13 currentPersona];

  id v54 = 0;
  id v14 = [v47 userPersonaUniqueString];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  id v16 = [WeakRetained domain];
  id v17 = [v16 personaIdentifier];
  if (v14 == v17)
  {

LABEL_13:
    v29 = 0;
    goto LABEL_14;
  }
  id v18 = objc_loadWeakRetained((id *)&self->_domainContext);
  v19 = [v18 domain];
  v20 = [v19 personaIdentifier];
  char v21 = [v14 isEqualToString:v20];

  if ((v21 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v53 = 0;
  v22 = (void *)[v47 copyCurrentPersonaContextWithError:&v53];
  id v23 = v53;
  id v24 = v54;
  id v54 = v22;

  if (v23)
  {
    v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  id v26 = objc_loadWeakRetained((id *)&self->_domainContext);
  v27 = [v26 domain];
  id v28 = [v27 personaIdentifier];
  v29 = [v47 generateAndRestorePersonaContextWithPersonaUniqueString:v28];

  if (v29)
  {
    uint64_t v30 = fp_current_or_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v39 = objc_loadWeakRetained((id *)&self->_domainContext);
      v40 = [v39 domain];
      v41 = [v40 personaIdentifier];
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = v41;
      __int16 v56 = 2112;
      id v57 = v29;
      _os_log_error_impl(&dword_1A33AE000, v30, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", location, 0x16u);
    }
  }
LABEL_14:
  v31 = [(FPSpotlightIndexer *)self _fetchClientStateIfNeeded];
  uint64_t v32 = [[FPSpotlightIndexOneBatchOperation alloc] initWithIndexer:self isInitialIndexing:0 isOutOfBandIndexing:0 queue:self->_workloop];
  [(FPSpotlightIndexOneBatchOperation *)v32 setUpdatedItems:v45];
  [(FPSpotlightIndexOneBatchOperation *)v32 setDeletedItemIDs:v44];
  [(FPSpotlightIndexOneBatchOperation *)v32 setFetchError:0];
  [(FPSpotlightIndexOneBatchOperation *)v32 setIndexReason:0];
  [(FPSpotlightIndexOneBatchOperation *)v32 setPassExpectedState:1];
  id v33 = [[FPSpotlightIndexState alloc] initWithPage:v43 changeToken:v46];
  id v34 = [(FPSpotlightIndexState *)v33 dataRepresentation];
  [(FPSpotlightIndexOneBatchOperation *)v32 setNextAnchor:v34];

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke;
  v51[3] = &unk_1E5AF1C90;
  id v35 = v46;
  id v52 = v35;
  [(FPSpotlightIndexOneBatchOperation *)v32 setCanIndexFromCurrentState:v51];
  *(void *)id location = 0;
  objc_initWeak((id *)location, self);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_87;
  v48[3] = &unk_1E5AF1CB8;
  objc_copyWeak(&v50, (id *)location);
  id v36 = v42;
  id v49 = v36;
  [(FPOperation *)v32 setFinishedBlock:v48];
  [(FPSpotlightIndexOneBatchOperation *)v32 setQualityOfService:17];
  if (self->_fetchStateOperation) {
    -[FPSpotlightIndexOneBatchOperation addDependency:](v32, "addDependency:");
  }
  if (v31)
  {
    __int16 v37 = fp_current_or_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:]();
    }

    [(NSOperationQueue *)self->_operationQueue addOperation:v31];
  }
  objc_super v38 = fp_current_or_default_log();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:]();
  }

  [(NSOperationQueue *)self->_operationQueue addOperation:v32];
  objc_destroyWeak(&v50);
  objc_destroyWeak((id *)location);

  _FPRestorePersona(&v54);
}

uint64_t __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    objc_super v5 = +[FPSpotlightIndexState stateWithData:v4];
    int v6 = v5;
    if (v5
      && ([v5 lastPage], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      if (*(void *)(a1 + 32))
      {
        id v8 = [v6 lastPage];
        char v9 = tokensAreEqual(v8, *(void **)(a1 + 32));

        if (v9)
        {
          uint64_t v10 = 1;
          goto LABEL_16;
        }
        id v15 = [v6 lastChangeToken];
        int v16 = tokensAreEqual(v15, *(void **)(a1 + 32));

        id v17 = fp_current_or_default_log();
        uint64_t v11 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_28;
          }
          goto LABEL_29;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_6();
        }
      }
      else
      {
        id v13 = [v6 lastChangeToken];

        id v14 = fp_current_or_default_log();
        uint64_t v11 = v14;
        if (!v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
LABEL_28:
          }
            __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_3();
LABEL_29:
          uint64_t v10 = 1;
          goto LABEL_15;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_4();
        }
      }
    }
    else
    {
      uint64_t v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_2();
      }
    }
    uint64_t v10 = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (!*(void *)(a1 + 32))
  {
    uint64_t v10 = 1;
    goto LABEL_18;
  }
  int v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_1();
  }
  uint64_t v10 = 0;
LABEL_16:

LABEL_18:
  return v10;
}

void __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_87(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v6 = objc_msgSend(v4, "fp_isFileProviderError:", -1000);
    if ((objc_msgSend(v4, "fp_isFileProviderError:", -1002) & 1) != 0
      || (v6 | objc_msgSend(v4, "fp_isFileProviderError:", -1002)) == 1)
    {
      if (v6) {
        uint64_t v7 = 12;
      }
      else {
        uint64_t v7 = 8;
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_2;
      v8[3] = &unk_1E5AF0E90;
      id v10 = *(id *)(a1 + 32);
      id v9 = v4;
      [WeakRetained dropIndexWithDropReason:v7 completionHandler:v8];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

uint64_t __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)indexOneBatchFromAnchor:(id)a3 toAnchor:(id)a4 updatedItems:(id)a5 deletedItems:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  workloop = self->_workloop;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99__FPSpotlightIndexer_indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke;
  v23[3] = &unk_1E5AF1CE0;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(workloop, v23);
}

uint64_t __99__FPSpotlightIndexer_indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke(void *a1)
{
  if (([*(id *)(a1[4] + 136) isUsingFPFS] & 1) == 0) {
    __99__FPSpotlightIndexer_indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_1();
  }
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[9];

  return [v2 _indexOneBatchFromAnchor:v3 toAnchor:v4 updatedItems:v5 deletedItems:v6 completionHandler:v7];
}

- (void)_indexOutOfBandUpdatedItems:(id)a3 deletedItems:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v41 = a4;
  id v38 = a6;
  id v9 = fpfs_adopt_log(self->_log);
  id v10 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v43 = [v10 currentPersona];

  id v49 = 0;
  uint64_t v11 = [v43 userPersonaUniqueString];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  id v13 = [WeakRetained domain];
  id v14 = [v13 personaIdentifier];
  if (v11 == v14)
  {

LABEL_13:
    id v26 = 0;
    goto LABEL_14;
  }
  id v15 = objc_loadWeakRetained((id *)&self->_domainContext);
  id v16 = objc_msgSend(v15, "domain", v38);
  id v17 = [v16 personaIdentifier];
  char v18 = [v11 isEqualToString:v17];

  if ((v18 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v48 = 0;
  id v19 = (void *)[v43 copyCurrentPersonaContextWithError:&v48];
  id v20 = v48;
  id v21 = v49;
  id v49 = v19;

  if (v20)
  {
    id v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  id v23 = objc_loadWeakRetained((id *)&self->_domainContext);
  id v24 = [v23 domain];
  id v25 = [v24 personaIdentifier];
  id v26 = [v43 generateAndRestorePersonaContextWithPersonaUniqueString:v25];

  if (v26)
  {
    id v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v35 = objc_loadWeakRetained((id *)&self->_domainContext);
      id v36 = [v35 domain];
      __int16 v37 = [v36 personaIdentifier];
      *(_DWORD *)buf = 138412546;
      id v51 = v37;
      __int16 v52 = 2112;
      id v53 = v26;
      _os_log_error_impl(&dword_1A33AE000, v27, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
    }
  }
LABEL_14:
  id v28 = [(FPSpotlightIndexer *)self _fetchClientStateIfNeeded];
  [v28 setQualityOfService:qos_class_self()];
  v29 = [[FPSpotlightIndexOneBatchOperation alloc] initWithIndexer:self isInitialIndexing:0 isOutOfBandIndexing:1 queue:self->_workloop];
  [(FPSpotlightIndexOneBatchOperation *)v29 setUpdatedItems:v42];
  [(FPSpotlightIndexOneBatchOperation *)v29 setDeletedItemIDs:v41];
  [(FPSpotlightIndexOneBatchOperation *)v29 setFetchError:0];
  [(FPSpotlightIndexOneBatchOperation *)v29 setNextAnchor:0];
  [(FPSpotlightIndexOneBatchOperation *)v29 setIndexReason:a5];
  [(FPSpotlightIndexOneBatchOperation *)v29 setQualityOfService:qos_class_self()];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __93__FPSpotlightIndexer__indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke;
  v44[3] = &unk_1E5AF1D08;
  id v30 = v42;
  id v45 = v30;
  id v31 = v41;
  id v46 = v31;
  id v32 = v39;
  id v47 = v32;
  [(FPOperation *)v29 setFinishedBlock:v44];
  if (v28)
  {
    id v33 = fp_current_or_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:]();
    }

    [(NSOperationQueue *)self->_operationQueue addOperation:v28];
  }
  id v34 = fp_current_or_default_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:]();
  }

  [(NSOperationQueue *)self->_operationQueue addOperation:v29];
  _FPRestorePersona(&v49);
}

void __93__FPSpotlightIndexer__indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __93__FPSpotlightIndexer__indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke_cold_1(a1, (uint64_t)v4, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)indexOutOfBandUpdatedItems:(id)a3 deletedItems:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(FPSpotlightIndexer *)self domainContext];
  workloop = self->_workloop;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__FPSpotlightIndexer_indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke;
  v19[3] = &unk_1E5AF1D30;
  id v20 = v13;
  id v21 = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  int64_t v25 = a5;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(workloop, v19);
}

uint64_t __92__FPSpotlightIndexer_indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _indexOutOfBandUpdatedItems:*(void *)(a1 + 48) deletedItems:*(void *)(a1 + 56) indexReason:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 64)];
}

- (void)_fetchCurrentIndexingAnchorWithCompletionHandler:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v4 = fpfs_adopt_log(self->_log);
  uint64_t v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v34 = [v5 currentPersona];

  id v39 = 0;
  uint64_t v6 = [v34 userPersonaUniqueString];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  id v8 = [WeakRetained domain];
  id v9 = [v8 personaIdentifier];
  if (v6 == v9)
  {

LABEL_13:
    id v21 = 0;
    goto LABEL_14;
  }
  id v10 = objc_loadWeakRetained((id *)&self->_domainContext);
  id v11 = objc_msgSend(v10, "domain", v32);
  id v12 = [v11 personaIdentifier];
  char v13 = [v6 isEqualToString:v12];

  if ((v13 & 1) != 0 || !voucher_process_can_use_arbitrary_personas()) {
    goto LABEL_13;
  }
  id v38 = 0;
  id v14 = (void *)[v34 copyCurrentPersonaContextWithError:&v38];
  id v15 = v38;
  id v16 = v39;
  id v39 = v14;

  if (v15)
  {
    id v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[FPSpotlightIndexer _fetchClientStateIfNeeded]();
    }
  }
  id v18 = objc_loadWeakRetained((id *)&self->_domainContext);
  id v19 = [v18 domain];
  id v20 = [v19 personaIdentifier];
  id v21 = [v34 generateAndRestorePersonaContextWithPersonaUniqueString:v20];

  if (v21)
  {
    id v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v29 = objc_loadWeakRetained((id *)&self->_domainContext);
      id v30 = [v29 domain];
      id v31 = [v30 personaIdentifier];
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = v31;
      __int16 v41 = 2112;
      id v42 = v21;
      _os_log_error_impl(&dword_1A33AE000, v22, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", location, 0x16u);
    }
  }
LABEL_14:
  id v23 = [(FPSpotlightIndexer *)self _fetchClientStateIfNeeded];
  *(void *)id location = 0;
  objc_initWeak((id *)location, self);
  id v24 = (void *)MEMORY[0x1E4F28B48];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __71__FPSpotlightIndexer__fetchCurrentIndexingAnchorWithCompletionHandler___block_invoke;
  v35[3] = &unk_1E5AF1D58;
  objc_copyWeak(&v37, (id *)location);
  id v25 = v33;
  id v36 = v25;
  id v26 = [v24 blockOperationWithBlock:v35];
  [v26 setQualityOfService:17];
  [v26 setName:@"ReturnCurrentAnchor"];
  if (self->_fetchStateOperation) {
    objc_msgSend(v26, "addDependency:");
  }
  if (v23)
  {
    id v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:]();
    }

    [(NSOperationQueue *)self->_operationQueue addOperation:v23];
  }
  id v28 = fp_current_or_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:]();
  }

  [(NSOperationQueue *)self->_operationQueue addOperation:v26];
  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)location);

  _FPRestorePersona(&v39);
}

void __71__FPSpotlightIndexer__fetchCurrentIndexingAnchorWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    uint64_t v3 = (void *)WeakRetained[8];
    if (v3)
    {
      if ([v3 length])
      {
        id v4 = +[FPSpotlightIndexState stateWithData:v9[8]];
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = *(void *)(a1 + 32);
          uint64_t v7 = [v4 lastPage];
          (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);

LABEL_9:
          id WeakRetained = v9;
          goto LABEL_10;
        }
      }
      id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v8();
    goto LABEL_9;
  }
LABEL_10:
}

- (void)fetchCurrentIndexingAnchorWithCompletionHandler:(id)a3
{
  id v4 = a3;
  workloop = self->_workloop;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__FPSpotlightIndexer_fetchCurrentIndexingAnchorWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF07B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workloop, v7);
}

uint64_t __70__FPSpotlightIndexer_fetchCurrentIndexingAnchorWithCompletionHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 136) isUsingFPFS] & 1) == 0) {
    __70__FPSpotlightIndexer_fetchCurrentIndexingAnchorWithCompletionHandler___block_invoke_cold_1();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _fetchCurrentIndexingAnchorWithCompletionHandler:v3];
}

- (void)_invalidate
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: invalidating", v1, 0xCu);
}

- (void)invalidate
{
  workloop = self->_workloop;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__FPSpotlightIndexer_invalidate__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_async_and_wait(workloop, block);
}

uint64_t __32__FPSpotlightIndexer_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)invalidateAsync
{
  workloop = self->_workloop;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__FPSpotlightIndexer_invalidateAsync__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_async(workloop, block);
}

uint64_t __37__FPSpotlightIndexer_invalidateAsync__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  index = self->_index;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke;
  v15[3] = &unk_1E5AF12B8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  [(CSSearchableIndex *)index deleteSearchableItemsWithDomainIdentifiers:v14 reason:a4 completionHandler:v15];
}

void __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2;
  block[3] = &unk_1E5AF1D80;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = fp_current_or_default_log();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2_cold_2(a1, v2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2_cold_1(a1, v5);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)dropIndexInQueue:(id)a3 dropReason:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workloop = self->_workloop;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__FPSpotlightIndexer_dropIndexInQueue_dropReason_completionHandler___block_invoke;
  v13[3] = &unk_1E5AF1650;
  id v15 = v9;
  unint64_t v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  fp_dispatch_async_with_logs(workloop, v13);
}

void __68__FPSpotlightIndexer_dropIndexInQueue_dropReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [FPSpotlightDropIndexOperation alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 32);
  uint64_t v5 = [*(id *)(v3 + 128) spotlightDomainIdentifier];
  uint64_t v6 = *(void *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
  id v8 = [(FPSpotlightDropIndexOperation *)v2 initWithIndexer:v3 index:v4 spotlightDomainIdentifier:v5 dropReason:v6 delegate:WeakRetained];

  [(FPOperation *)v8 setCallbackQueue:*(void *)(*(void *)(a1 + 32) + 40)];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __68__FPSpotlightIndexer_dropIndexInQueue_dropReason_completionHandler___block_invoke_2;
  id v13 = &unk_1E5AF1DA8;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(id *)(a1 + 48);
  [(FPOperation *)v8 setFinishedBlock:&v10];
  id v9 = *(void **)(a1 + 40);
  if (v9) {
    objc_msgSend(v9, "addOperation:", v8, v10, v11, v12, v13, v14);
  }
  else {
    [(FPOperation *)v8 start];
  }
}

void __68__FPSpotlightIndexer_dropIndexInQueue_dropReason_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __68__FPSpotlightIndexer_dropIndexInQueue_dropReason_completionHandler___block_invoke_2_cold_1();
    }
  }
  [*(id *)(a1 + 32) clearIndexState];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dropIndexWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
}

- (void)dropIndexAndInvalidateWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__FPSpotlightIndexer_dropIndexAndInvalidateWithDropReason_completionHandler___block_invoke;
  v8[3] = &unk_1E5AF0800;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(FPSpotlightIndexer *)self dropIndexWithDropReason:a3 completionHandler:v8];
}

void __77__FPSpotlightIndexer_dropIndexAndInvalidateWithDropReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dumpStateTo:(id)a3
{
  id v4 = a3;
  if (self->_clientState == 2)
  {
    clientStateSemaphore = self->_clientStateSemaphore;
    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    intptr_t v7 = dispatch_semaphore_wait(clientStateSemaphore, v6);
  }
  else
  {
    intptr_t v7 = 0;
  }
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__2;
  v23[4] = __Block_byref_object_dispose__2;
  id v24 = 0;
  workloop = self->_workloop;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__FPSpotlightIndexer_dumpStateTo___block_invoke;
  block[3] = &unk_1E5AF0828;
  dispatch_semaphore_t v21 = v8;
  id v22 = v23;
  void block[4] = self;
  uint64_t v10 = v8;
  dispatch_async(workloop, block);
  dispatch_time_t v11 = dispatch_time(0, 5000000000);
  intptr_t v12 = dispatch_semaphore_wait(v10, v11);
  id v13 = self->_workloop;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __34__FPSpotlightIndexer_dumpStateTo___block_invoke_3;
  v15[3] = &unk_1E5AF1870;
  id v18 = v23;
  intptr_t v19 = v12 | v7;
  id v16 = v4;
  id v17 = self;
  id v14 = v4;
  dispatch_async_and_wait(v13, v15);

  _Block_object_dispose(v23, 8);
}

void __34__FPSpotlightIndexer_dumpStateTo___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 72) == 3)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(v2 + 64));
    uint64_t v3 = a1[5];
    dispatch_semaphore_signal(v3);
  }
  else
  {
    id v4 = [FPSpotlightFetchClientStateOperation alloc];
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void *)(v5 + 32);
    uint64_t v7 = *(void *)(v5 + 8);
    dispatch_semaphore_t v8 = [*(id *)(v5 + 128) spotlightDomainIdentifier];
    id v9 = [(FPSpotlightFetchClientStateOperation *)v4 initWithIndexer:v5 index:v6 indexName:v7 spotlightDomainIdentifier:v8 reason:@"dumping state" supportURL:*(void *)(a1[4] + 112)];

    [*(id *)(a1[4] + 48) addOperation:v9];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__FPSpotlightIndexer_dumpStateTo___block_invoke_2;
    v12[3] = &unk_1E5AF1DD0;
    long long v11 = *(_OWORD *)(a1 + 5);
    id v10 = (id)v11;
    long long v13 = v11;
    [(FPOperation *)v9 setFinishedBlock:v12];
  }
}

void __34__FPSpotlightIndexer_dumpStateTo___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __34__FPSpotlightIndexer_dumpStateTo___block_invoke_3(void *a1)
{
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v2 = 0;
  }
  else if (a1[7])
  {
    uint64_t v2 = @"timed out while fetching token";
  }
  else
  {
    uint64_t v2 = @"none";
  }
  uint64_t v3 = (void *)a1[4];
  id v4 = [(__CFString *)v2 description];
  uint64_t v5 = [v4 UTF8String];
  if (v5)
  {
    objc_msgSend(v3, "write:", @"    change token: %s\n", v5);
  }
  else
  {
    id v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) description];
    objc_msgSend(v3, "write:", @"    change token: %s\n", objc_msgSend(v6, "UTF8String"));
  }
  uint64_t v7 = (void *)a1[4];
  id v9 = [*(id *)(a1[5] + 48) operations];
  id v8 = [v9 description];
  objc_msgSend(v7, "write:", @"    operation: %s\n", objc_msgSend(v8, "UTF8String"));
}

+ (void)setIndexerProperty:(id)a3 forKey:(id)a4 supportURL:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:a1 file:@"FPSpotlightIndexer.m" lineNumber:764 description:@"nil key"];
  }
  intptr_t v12 = [v11 URLByAppendingPathComponent:@"Indexer.plist" isDirectory:0];
  id v13 = a1;
  objc_sync_enter(v13);
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v12];
  id v15 = [v14 objectForKey:v10];
  if (([v9 isEqual:v15] & 1) == 0)
  {
    id v16 = (void *)[v14 mutableCopy];
    id v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = (id)objc_opt_new();
    }
    intptr_t v19 = v18;

    [v19 setValue:v9 forKey:v10];
    id v24 = 0;
    char v20 = [v19 writeToURL:v12 error:&v24];
    id v21 = v24;
    if ((v20 & 1) == 0)
    {
      id v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v26 = v10;
        __int16 v27 = 2112;
        id v28 = v9;
        __int16 v29 = 2112;
        id v30 = v21;
        _os_log_impl(&dword_1A33AE000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to store indexer value (%@) %@: %@", buf, 0x20u);
      }
    }
  }

  objc_sync_exit(v13);
}

+ (id)indexerPropertyOfClass:(Class)a3 forKey:(id)a4 supportURL:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a1;
  objc_sync_enter(v9);
  id v10 = (void *)MEMORY[0x1E4F1C9E8];
  id v11 = [v8 URLByAppendingPathComponent:@"Indexer.plist" isDirectory:0];
  intptr_t v12 = [v10 dictionaryWithContentsOfURL:v11];

  objc_sync_exit(v9);
  id v13 = [v12 objectForKey:v7];
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  return v14;
}

- (void)setDomain:(id)a3
{
}

- (void)setProviderDomain:(id)a3
{
}

- (FPSpotlightDropIndexDelegate)dropIndexDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dropIndexDelegate);

  return (FPSpotlightDropIndexDelegate *)WeakRetained;
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dropIndexDelegate);
  objc_destroyWeak((id *)&self->_domainContext);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_providerDomain, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_supportURL, 0);
  objc_storeStrong((id *)&self->_clientStateSemaphore, 0);
  objc_storeStrong((id *)&self->_vendorEnumerator, 0);
  objc_storeStrong((id *)&self->_fetchStateOperation, 0);
  objc_storeStrong((id *)&self->_lastIndexState, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_domainID, 0);

  objc_storeStrong((id *)&self->_indexName, 0);
}

- (void)learnNewIndexState:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] %@: Learning change token %@");
}

- (void)_fetchClientStateIfNeeded
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, v0, v1, "[ERROR] won't restore persona: %@", v2, v3, v4, v5, v6);
}

- (void)_indexOneBatchWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] scheduling %@ on %@");
}

- (void)_indexOneBatchWithCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] scheduling %@ on %@");
}

- (void)_indexOneBatchWithCompletionHandler:(os_log_t)log .cold.4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] can't create vendor enumerator: %@", buf, 0xCu);
}

void __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_3_cold_1()
{
}

void __57__FPSpotlightIndexer_indexOneBatchWithCompletionHandler___block_invoke_cold_1()
{
}

void __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_5_2(&dword_1A33AE000, v0, v1, "[ERROR] [spotlight] CS lost the indexation state, forcing a new indexing from scratch", v2, v3, v4, v5, v6);
}

void __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_5_2(&dword_1A33AE000, v0, v1, "[ERROR] [spotlight] CS indexing state is invalid, forcing a new indexing from scratch", v2, v3, v4, v5, v6);
}

void __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_30();
  _os_log_debug_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] [spotlight] CS state seems to be more advanced than FPFS", v1, 2u);
}

void __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_5_2(&dword_1A33AE000, v0, v1, "[ERROR] [spotlight] CS indexing don't match FPFS state, forcing a new indexing from scratch", v2, v3, v4, v5, v6);
}

void __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_5_2(&dword_1A33AE000, v0, v1, "[ERROR] [spotlight] CS indexing state does not match FPFS state", v2, v3, v4, v5, v6);
}

void __99__FPSpotlightIndexer_indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_1()
{
}

void __93__FPSpotlightIndexer__indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v6 = [*(id *)(a1 + 32) count];
  int v7 = [*(id *)(a1 + 40) count];
  v8[0] = 67109634;
  v8[1] = v6;
  __int16 v9 = 1024;
  int v10 = v7;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] out-of-band indexing of (%u updates, %u deletions, completed with error %@", (uint8_t *)v8, 0x18u);
}

void __70__FPSpotlightIndexer_fetchCurrentIndexingAnchorWithCompletionHandler___block_invoke_cold_1()
{
}

void __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  [*(id *)(a1 + 56) timeIntervalSinceNow];
  int v6 = 138412802;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  double v11 = -v5;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] [spotlight] %@: deleted searchable items with domain identifiers %@ in %.3fs", (uint8_t *)&v6, 0x20u);
}

void __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = objc_msgSend(*a2, "fp_prettyDescription");
  [*(id *)(a1 + 56) timeIntervalSinceNow];
  int v9 = 138413058;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  __int16 v13 = 2112;
  id v14 = v7;
  __int16 v15 = 2048;
  double v16 = -v8;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] [spotlight] %@: failed deleting searchable items with domain identifiers %@: %@ in %.3fs", (uint8_t *)&v9, 0x2Au);
}

void __68__FPSpotlightIndexer_dropIndexInQueue_dropReason_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, v0, v1, "[ERROR] can't drop spotlight index: %@", v2, v3, v4, v5, v6);
}

@end