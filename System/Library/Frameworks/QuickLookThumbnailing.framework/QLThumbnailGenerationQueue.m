@interface QLThumbnailGenerationQueue
+ (id)sharedInstance;
- (NSMutableDictionary)queuedURLs;
- (NSOperationQueue)queue;
- (QLThumbnailGenerationQueue)init;
- (void)enqueueThumbnailGenerationIfNeededForDocumentAtURL:(id)a3 atBackgroundPriority:(BOOL)a4 completionHandler:(id)a5;
- (void)noteThumbnailGenerationQueuedExternallyForDocumentAtURL:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueuedURLs:(id)a3;
@end

@implementation QLThumbnailGenerationQueue

- (QLThumbnailGenerationQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)QLThumbnailGenerationQueue;
  v2 = [(QLThumbnailGenerationQueue *)&v8 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v2->_queue;
    v2->_queue = v3;

    [(NSOperationQueue *)v2->_queue setName:@"com.apple.quicklook.thumbnailgeneration"];
    [(NSOperationQueue *)v2->_queue setQualityOfService:9];
    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queuedURLs = v2->_queuedURLs;
    v2->_queuedURLs = v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__QLThumbnailGenerationQueue_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, block);
  }
  v2 = (void *)sSharedInstance;

  return v2;
}

uint64_t __44__QLThumbnailGenerationQueue_sharedInstance__block_invoke(uint64_t a1)
{
  sSharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (void)enqueueThumbnailGenerationIfNeededForDocumentAtURL:(id)a3 atBackgroundPriority:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = qltLogHandles[0];
  if (!qltLogHandles[0])
  {
    QLTInitLogging();
    v10 = qltLogHandles[0];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[QLThumbnailGenerationQueue enqueueThumbnailGenerationIfNeededForDocumentAtURL:atBackgroundPriority:completionHandler:]((uint64_t)v8, v10, v9);
  }
  v11 = (void *)MEMORY[0x1E4F28B48];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke;
  v20 = &unk_1E600A5C8;
  v21 = self;
  id v22 = v8;
  BOOL v24 = v6;
  id v23 = v9;
  id v12 = v9;
  id v13 = v8;
  v14 = [v11 blockOperationWithBlock:&v17];
  v15 = v14;
  if (v6) {
    uint64_t v16 = 9;
  }
  else {
    uint64_t v16 = 25;
  }
  objc_msgSend(v14, "setQualityOfService:", v16, v17, v18, v19, v20, v21);
  [(NSOperationQueue *)self->_queue addOperation:v15];
}

void __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke(id *a1)
{
  v1 = (char *)a1;
  v22[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] queuedURLs];
  v3 = v1 + 40;
  v4 = [v2 objectForKeyedSubscript:*((void *)v1 + 5)];

  v5 = qltLogHandles[0];
  if (!v4)
  {
    if (!qltLogHandles[0])
    {
      QLTInitLogging();
      v5 = qltLogHandles[0];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_cold_1(v5);
    }
    v7 = [[QLThumbnailStoreRetrievalOperation alloc] initWithDocumentAtURL:*((void *)v1 + 5)];
    [(QLThumbnailStoreRetrievalOperation *)v7 setGenerateThumbnailsAtBackgroundPriority:v1[56]];
    objc_initWeak(&location, v7);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_5;
    uint64_t v17 = &unk_1E600A5A0;
    objc_copyWeak(&v20, &location);
    uint64_t v18 = *((void *)v1 + 4);
    id v19 = *((id *)v1 + 5);
    [(QLThumbnailStoreRetrievalOperation *)v7 setCompletionBlock:&v14];
    if (v1[56]) {
      uint64_t v9 = 9;
    }
    else {
      uint64_t v9 = 25;
    }
    -[QLThumbnailStoreRetrievalOperation setQualityOfService:](v7, "setQualityOfService:", v9, v14, v15, v16, v17, v18);
    v10 = [*((id *)v1 + 4) queue];
    [v10 addOperation:v7];

    v11 = [*((id *)v1 + 4) queuedURLs];
    uint64_t v12 = *((void *)v1 + 6);
    if (v12)
    {
      v1 = (char *)_Block_copy(*((const void **)v1 + 6));
      v22[0] = v1;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    }
    else
    {
      id v13 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [v11 setObject:v13 forKey:*v3];
    if (v12)
    {
    }
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    goto LABEL_21;
  }
  if (!qltLogHandles[0])
  {
    QLTInitLogging();
    v5 = qltLogHandles[0];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_cold_2((uint64_t *)v1 + 5, v5);
  }
  BOOL v6 = (const void *)*((void *)v1 + 6);
  if (v6)
  {
    v7 = (QLThumbnailStoreRetrievalOperation *)_Block_copy(v6);
    id v8 = [v4 arrayByAddingObject:v7];
    [*(id *)(*((void *)v1 + 4) + 16) setObject:v8 forKeyedSubscript:*((void *)v1 + 5)];

LABEL_21:
  }
}

void __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_5(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained error];

  id v5 = objc_loadWeakRetained(v2);
  BOOL v6 = [v5 addition];
  uint64_t v7 = [v6 additionSize];

  id v8 = objc_loadWeakRetained(v2);
  char v9 = [v8 thumbnailWasJustAutomaticallyGenerated];

  v10 = qltLogHandles[0];
  if (!qltLogHandles[0])
  {
    QLTInitLogging();
    v10 = qltLogHandles[0];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_5_cold_1(v10, v2);
  }
  v11 = [*(id *)(a1 + 32) queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_6;
  v14[3] = &unk_1E600A578;
  uint64_t v12 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  char v18 = v9;
  id v16 = v4;
  uint64_t v17 = v7;
  id v15 = v12;
  id v13 = v4;
  [v11 addOperationWithBlock:v14];
}

void __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "queuedURLs", 0);
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id v8 = [*(id *)(a1 + 32) queuedURLs];
  [v8 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)noteThumbnailGenerationQueuedExternallyForDocumentAtURL:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__QLThumbnailGenerationQueue_noteThumbnailGenerationQueuedExternallyForDocumentAtURL___block_invoke;
  v7[3] = &unk_1E6009870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)queue addOperationWithBlock:v7];
}

void __86__QLThumbnailGenerationQueue_noteThumbnailGenerationQueuedExternallyForDocumentAtURL___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];

  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
    [v4 setObject:v5 forKeyedSubscript:v3];
  }
}

- (NSMutableDictionary)queuedURLs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueuedURLs:(id)a3
{
}

- (NSOperationQueue)queue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedURLs, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)enqueueThumbnailGenerationIfNeededForDocumentAtURL:(uint64_t)a1 atBackgroundPriority:(void *)a2 completionHandler:(const void *)a3 .cold.1(uint64_t a1, void *a2, const void *a3)
{
  id v4 = a2;
  long long v11 = _Block_copy(a3);
  OUTLINED_FUNCTION_0_4(&dword_1B281E000, v5, v6, "Will queue for %@ and completion block %@", v7, v8, v9, v10, 2u);
}

void __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B281E000, log, OS_LOG_TYPE_DEBUG, "Scheduling retrieval operation", v1, 2u);
}

void __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1B281E000, a2, OS_LOG_TYPE_DEBUG, "%@ already queued, adding completion block", (uint8_t *)&v3, 0xCu);
}

void __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_5_cold_1(void *a1, id *a2)
{
  id v3 = a1;
  id WeakRetained = objc_loadWeakRetained(a2);
  OUTLINED_FUNCTION_0_4(&dword_1B281E000, v5, v6, "Retrieval operation %@ finished with error %@", v7, v8, v9, v10, 2u);
}

@end