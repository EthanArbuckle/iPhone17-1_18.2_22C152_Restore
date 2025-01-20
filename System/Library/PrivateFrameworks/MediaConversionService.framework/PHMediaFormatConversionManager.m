@interface PHMediaFormatConversionManager
- (NSMutableArray)queuedJobs;
- (NSURL)directoryForTemporaryFiles;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)preflightQueue;
- (OS_dispatch_queue)stateQueue;
- (PHMediaFormatConversionImplementation)conversionImplementation;
- (PHMediaFormatConversionJob)currentlyProcessingJob;
- (PHMediaFormatConversionManager)init;
- (id)jobForConversionRequest:(id)a3 completionHandler:(id)a4;
- (id)rootAncestorRequestForRequest:(id)a3;
- (id)ut_objectsToBeDeallocatedWithReceiver;
- (unint64_t)state;
- (void)cancellationRequestedForJob:(id)a3;
- (void)configureTransferBehaviorUserPreferenceForRequest:(id)a3;
- (void)enqueueConversionRequest:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)performConversionRequest:(id)a3 completionHandler:(id)a4;
- (void)preflightAllRelatedRequestsForCurrentJob;
- (void)preflightConversionRequest:(id)a3;
- (void)preflightConversionRequest:(id)a3 completionHandler:(id)a4;
- (void)processQueuedJobs;
- (void)setCallbackQueue:(id)a3;
- (void)setConversionImplementation:(id)a3;
- (void)setCurrentlyProcessingJob:(id)a3;
- (void)setDirectoryForTemporaryFiles:(id)a3;
- (void)setPreflightQueue:(id)a3;
- (void)setQueuedJobs:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateQueue:(id)a3;
- (void)setTransferBehaviorUserPreferenceOverride:(id)a3;
- (void)setupConversionImplementation;
- (void)validateLivePhotoPairingIdentifierConfigurationForRequest:(id)a3;
@end

@implementation PHMediaFormatConversionManager

- (void)preflightConversionRequest:(id)a3
{
  id v4 = a3;
  [(PHMediaFormatConversionManager *)self configureTransferBehaviorUserPreferenceForRequest:v4];
  [v4 setDirectoryForTemporaryFiles:self->_directoryForTemporaryFiles];
  [v4 preflightWithConversionManager:self];
}

- (void)configureTransferBehaviorUserPreferenceForRequest:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PHMediaFormatConversionManager *)self conversionImplementation];
  uint64_t v6 = [v5 transferBehaviorUserPreference];

  transferBehaviorUserPreferenceOverride = (uint64_t (**)(id, id))self->_transferBehaviorUserPreferenceOverride;
  if (transferBehaviorUserPreferenceOverride)
  {
    uint64_t v8 = transferBehaviorUserPreferenceOverride[2](transferBehaviorUserPreferenceOverride, v4);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v9 = 134218240;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Media conversion transfer user preference overridden from %ld to %ld", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = v6;
  }
  [v4 setTransferBehaviorUserPreference:v8];
}

- (PHMediaFormatConversionImplementation)conversionImplementation
{
  return (PHMediaFormatConversionImplementation *)objc_getProperty(self, a2, 32, 1);
}

- (void)setupConversionImplementation
{
  id v3 = (id)objc_opt_new();
  [(PHMediaFormatConversionManager *)self setConversionImplementation:v3];
}

- (void)setConversionImplementation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_currentlyProcessingJob, 0);
  objc_storeStrong((id *)&self->_queuedJobs, 0);
  objc_storeStrong((id *)&self->_conversionImplementation, 0);
  objc_storeStrong((id *)&self->_directoryForTemporaryFiles, 0);
  objc_storeStrong(&self->_transferBehaviorUserPreferenceOverride, 0);
}

- (void)setPreflightQueue:(id)a3
{
}

- (OS_dispatch_queue)preflightQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStateQueue:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentlyProcessingJob:(id)a3
{
}

- (PHMediaFormatConversionJob)currentlyProcessingJob
{
  return (PHMediaFormatConversionJob *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueuedJobs:(id)a3
{
}

- (NSMutableArray)queuedJobs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSURL)directoryForTemporaryFiles
{
  return self->_directoryForTemporaryFiles;
}

- (id)ut_objectsToBeDeallocatedWithReceiver
{
  id v3 = [(PHMediaFormatConversionManager *)self conversionImplementation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(PHMediaFormatConversionManager *)self conversionImplementation];
    uint64_t v6 = objc_msgSend(v5, "ut_objectsToBeDeallocatedWithReceiver");
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)invalidate
{
  char v4 = [(PHMediaFormatConversionManager *)self stateQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PHMediaFormatConversionManager_invalidate__block_invoke;
  v5[3] = &unk_1E6CFEB68;
  v5[4] = self;
  v5[5] = a2;
  dispatch_sync(v4, v5);
}

void __44__PHMediaFormatConversionManager_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] != 1)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PHMediaFormatConversion.m" lineNumber:2345 description:@"Invalidate can only be called once."];
  }
  [*(id *)(a1 + 32) setState:2];
  v2 = [*(id *)(a1 + 32) currentlyProcessingJob];
  id v3 = v2;
  if (v2)
  {
    char v4 = [v2 conversionRequest];
    v5 = [v4 progress];
    [v5 cancel];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "queuedJobs", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      __int16 v11 = v3;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v3 = *(id *)(*((void *)&v15 + 1) + 8 * v10);

        uint64_t v12 = [v3 conversionRequest];
        uint64_t v13 = [v12 progress];
        [v13 cancel];

        ++v10;
        __int16 v11 = v3;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)cancellationRequestedForJob:(id)a3
{
  id v4 = a3;
  v5 = [(PHMediaFormatConversionManager *)self stateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PHMediaFormatConversionManager_cancellationRequestedForJob___block_invoke;
  v7[3] = &unk_1E6CFEA78;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __62__PHMediaFormatConversionManager_cancellationRequestedForJob___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) conversionRequest];
  if ([v2 status] == 2)
  {
    [v2 markAsCancelled];
    id v3 = [*(id *)(a1 + 40) queuedJobs];
    [v3 removeObject:*(void *)(a1 + 32)];

    id v4 = [*(id *)(a1 + 40) callbackQueue];
    v5 = [*(id *)(a1 + 32) completionHandler];
    dispatch_async(v4, v5);

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v6 = [v2 identifier];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled queued request %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)jobForConversionRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  [v8 setConversionRequest:v6];
  [v8 setCompletionHandler:v7];
  uint64_t v9 = [v6 progress];
  uint64_t v10 = [v9 cancellationHandler];

  objc_initWeak(&location, v8);
  objc_initWeak(&from, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PHMediaFormatConversionManager_jobForConversionRequest_completionHandler___block_invoke;
  v14[3] = &unk_1E6CFEB40;
  objc_copyWeak(&v16, &from);
  objc_copyWeak(&v17, &location);
  id v11 = v10;
  id v15 = v11;
  uint64_t v12 = [v6 progress];
  [v12 setCancellationHandler:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v8;
}

void __76__PHMediaFormatConversionManager_jobForConversionRequest_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v2) {
    [WeakRetained cancellationRequestedForJob:v2];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (id)rootAncestorRequestForRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 parentRequest];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      id v6 = v5;

      v5 = [v6 parentRequest];

      id v3 = v6;
    }
    while (v5);
  }
  else
  {
    id v6 = v3;
  }
  return v6;
}

- (void)preflightAllRelatedRequestsForCurrentJob
{
  uint64_t v4 = [(PHMediaFormatConversionManager *)self currentlyProcessingJob];
  v5 = [v4 conversionRequest];
  id v6 = [(PHMediaFormatConversionManager *)self rootAncestorRequestForRequest:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PHMediaFormatConversionManager_preflightAllRelatedRequestsForCurrentJob__block_invoke;
  v9[3] = &unk_1E6CFEB18;
  v9[4] = self;
  id v10 = v4;
  id v11 = v5;
  SEL v12 = a2;
  id v7 = v5;
  id v8 = v4;
  [(PHMediaFormatConversionManager *)self preflightConversionRequest:v6 completionHandler:v9];
}

void __74__PHMediaFormatConversionManager_preflightAllRelatedRequestsForCurrentJob__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PHMediaFormatConversionManager_preflightAllRelatedRequestsForCurrentJob__block_invoke_2;
  block[3] = &unk_1E6CFEB18;
  id v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v8 = v5;
  dispatch_async(v2, block);
}

uint64_t __74__PHMediaFormatConversionManager_preflightAllRelatedRequestsForCurrentJob__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentlyProcessingJob];
  char v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = *(void *)(a1 + 56);
    SEL v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    v14 = [v12 currentlyProcessingJob];
    [v10 handleFailureInMethod:v11, v12, @"PHMediaFormatConversion.m", 2263, @"Current job mismatch: %@/%@", v13, v14 object file lineNumber description];
  }
  if ([*(id *)(a1 + 48) status] != 3)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 56);
    long long v18 = [*(id *)(a1 + 48) statusString];
    [v15 handleFailureInMethod:v17, v16, @"PHMediaFormatConversion.m", 2264, @"Current job request state mismatch: %@", v18 object file lineNumber description];
  }
  id v4 = [*(id *)(a1 + 48) progress];
  int v5 = [v4 isCancelled];

  if (v5) {
    [*(id *)(a1 + 48) markAsCancelled];
  }
  if ([*(id *)(a1 + 48) status] == 3 && objc_msgSend(*(id *)(a1 + 48), "preflighted"))
  {
    [*(id *)(a1 + 48) setStatus:2];
    id v6 = [*(id *)(a1 + 32) queuedJobs];
    [v6 insertObject:*(void *)(a1 + 40) atIndex:0];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) callbackQueue];
    id v7 = [*(id *)(a1 + 40) completionHandler];
    dispatch_async(v6, v7);
  }
  [*(id *)(a1 + 32) setCurrentlyProcessingJob:0];
  long long v8 = *(void **)(a1 + 32);
  return [v8 processQueuedJobs];
}

- (void)validateLivePhotoPairingIdentifierConfigurationForRequest:(id)a3
{
  id v7 = a3;
  if ((unint64_t)([v7 livePhotoPairingIdentifierBehavior] - 3) <= 1)
  {
    int v5 = [v7 livePhotoPairingIdentifier];

    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:2247 description:@"Unexpected nil pairing identifier"];
    }
  }
}

- (void)performConversionRequest:(id)a3 completionHandler:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v8 = (void (**)(void))a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 2214, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 2215, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  if ([v7 isCompositeRequest])
  {
LABEL_16:
    v9[2](v9);
    goto LABEL_17;
  }
  uint64_t v10 = [v7 backwardsCompatibilityStatus];
  uint64_t v11 = (void *)MEMORY[0x1E4F442D8];
  SEL v12 = [v7 source];
  uint64_t v13 = [v12 fileType];
  v14 = [v11 typeWithIdentifier:v13];

  if (![v7 requiresPassthroughConversion])
  {
LABEL_10:
    if (v10 == 2) {
      goto LABEL_11;
    }
LABEL_12:
    if ([v7 backwardsCompatibilityStatus] != 1)
    {
LABEL_15:

      goto LABEL_16;
    }
    [v7 setStatus:4];
    long long v18 = [v7 source];
    v19 = +[PHMediaFormatConversionDestination destinationForConversionReturningUnchangedSource:v18];
    [v7 setDestination:v19];
LABEL_14:

    goto LABEL_15;
  }
  id v15 = [v7 source];
  if ([v15 mediaType] != 1)
  {

    goto LABEL_10;
  }
  char v16 = [v14 isEqual:*MEMORY[0x1E4F44490]];

  if (v10 != 2) {
    goto LABEL_12;
  }
  if ((v16 & 1) == 0)
  {
    [v7 setStatus:5];
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"Passthrough video conversion is only available for QuickTime input format";
    long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v19 = [v17 errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:4 userInfo:v18];
    [v7 setError:v19];
    goto LABEL_14;
  }
LABEL_11:
  [(PHMediaFormatConversionManager *)self validateLivePhotoPairingIdentifierConfigurationForRequest:v7];
  uint64_t v20 = [(PHMediaFormatConversionManager *)self conversionImplementation];
  [v20 performConversionRequest:v7 completionHandler:v9];

LABEL_17:
}

- (void)processQueuedJobs
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = [(PHMediaFormatConversionManager *)self stateQueue];
  dispatch_assert_queue_V2(v4);

  if ([(PHMediaFormatConversionManager *)self state] != 1) {
    goto LABEL_4;
  }
  int v5 = [(PHMediaFormatConversionManager *)self currentlyProcessingJob];
  if (v5)
  {

    goto LABEL_4;
  }
  uint64_t v11 = [(PHMediaFormatConversionManager *)self queuedJobs];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
LABEL_4:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = [(PHMediaFormatConversionManager *)self state];
      id v7 = [(PHMediaFormatConversionManager *)self currentlyProcessingJob];
      long long v8 = [v7 conversionRequest];
      uint64_t v9 = [v8 identifier];
      uint64_t v10 = [(PHMediaFormatConversionManager *)self queuedJobs];
      *(_DWORD *)buf = 134218498;
      unint64_t v22 = v6;
      __int16 v23 = 2112;
      v24 = v9;
      __int16 v25 = 2048;
      uint64_t v26 = [v10 count];
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Process queued jobs: not starting job, state: %ld, current request: %@, queued job count: %lu", buf, 0x20u);
    }
    return;
  }
  uint64_t v13 = [(NSMutableArray *)self->_queuedJobs firstObject];
  v14 = [(PHMediaFormatConversionManager *)self queuedJobs];
  [v14 removeObjectAtIndex:0];

  [(PHMediaFormatConversionManager *)self setCurrentlyProcessingJob:v13];
  id v15 = [v13 conversionRequest];
  if ([v15 status] != 2)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v18 = [v15 statusString];
    [v17 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 2179, @"Unexpected request state %@", v18 object file lineNumber description];
  }
  [v15 setStatus:3];
  if ([v15 preflighted])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      char v16 = [v15 identifier];
      *(_DWORD *)buf = 138543618;
      unint64_t v22 = (unint64_t)v13;
      __int16 v23 = 2114;
      v24 = v16;
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Process queued jobs: starting job %{public}@ for request %{public}@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v13);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__PHMediaFormatConversionManager_processQueuedJobs__block_invoke;
    v19[3] = &unk_1E6CFEAF0;
    objc_copyWeak(v20, (id *)buf);
    v20[1] = (id)a2;
    v19[4] = self;
    [(PHMediaFormatConversionManager *)self performConversionRequest:v15 completionHandler:v19];
    objc_destroyWeak(v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(PHMediaFormatConversionManager *)self preflightAllRelatedRequestsForCurrentJob];
  }
}

void __51__PHMediaFormatConversionManager_processQueuedJobs__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"PHMediaFormatConversion.m" lineNumber:2192 description:@"Current job went away unexpectedly"];
  }
  char v3 = [WeakRetained conversionRequest];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v4 = [v3 identifier];
    int v5 = [v3 statusString];
    unint64_t v6 = [v3 error];
    *(_DWORD *)buf = 138543874;
    char v16 = v4;
    __int16 v17 = 2114;
    long long v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Process queued jobs: completed request %{public}@, status = %{public}@, error = %@", buf, 0x20u);
  }
  [v3 didFinishProcessing];
  id v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PHMediaFormatConversionManager_processQueuedJobs__block_invoke_865;
  block[3] = &unk_1E6CFEAC8;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = WeakRetained;
  uint64_t v13 = v8;
  uint64_t v14 = *(void *)(a1 + 48);
  id v9 = WeakRetained;
  dispatch_async(v7, block);
}

void __51__PHMediaFormatConversionManager_processQueuedJobs__block_invoke_865(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];
  v2[2]();

  char v3 = [*(id *)(a1 + 40) stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PHMediaFormatConversionManager_processQueuedJobs__block_invoke_2;
  block[3] = &unk_1E6CFEAC8;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  uint64_t v8 = *(void *)(a1 + 48);
  dispatch_async(v3, block);
}

uint64_t __51__PHMediaFormatConversionManager_processQueuedJobs__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentlyProcessingJob];
  char v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v9 currentlyProcessingJob];
    [v6 handleFailureInMethod:v7, v9, @"PHMediaFormatConversion.m", 2204, @"Current job mismatch: %@/%@", v8, v10 object file lineNumber description];
  }
  [*(id *)(a1 + 32) setCurrentlyProcessingJob:0];
  id v4 = *(void **)(a1 + 32);
  return [v4 processQueuedJobs];
}

- (void)setDirectoryForTemporaryFiles:(id)a3
{
  int8x16_t v5 = (NSURL *)a3;
  unint64_t v6 = [(NSURL *)v5 path];
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  unsigned __int8 v15 = 0;
  unsigned int v8 = [v7 fileExistsAtPath:v6 isDirectory:&v15];
  unsigned int v9 = [v7 isWritableFileAtPath:v6];
  int v10 = v9 ^ 1;
  if (((v8 ^ 1) & 1) != 0 || !v15 || (BOOL v11 = 0, v10))
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 2162, @"Invalid temporary directory URL parameter '%@' not satisfying exists && isDirectory && isWritable (%d/%d/%d)", v5, v8, v15, v9 object file lineNumber description];

    BOOL v11 = v15 == 0;
  }
  if ((v8 ^ 1 | v11 | v10) == 1)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 2163, @"Invalid parameter not satisfying: %@", @"exists && isDirectory && isWritable" object file lineNumber description];
  }
  directoryForTemporaryFiles = self->_directoryForTemporaryFiles;
  self->_directoryForTemporaryFiles = v5;
}

- (void)setTransferBehaviorUserPreferenceOverride:(id)a3
{
  self->_transferBehaviorUserPreferenceOverride = (id)MEMORY[0x1E01C2040](a3, a2);
  MEMORY[0x1F41817F8]();
}

- (void)preflightConversionRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(PHMediaFormatConversionManager *)self preflightQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PHMediaFormatConversionManager_preflightConversionRequest_completionHandler___block_invoke;
  block[3] = &unk_1E6CFEAA0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __79__PHMediaFormatConversionManager_preflightConversionRequest_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) preflightConversionRequest:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) callbackQueue];
  dispatch_async(v2, *(dispatch_block_t *)(a1 + 48));
}

- (void)enqueueConversionRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unsigned int v8 = (void (**)(void))a4;
  if ([v7 status] != 1)
  {
    unsigned __int8 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 2078, @"Invalid parameter not satisfying: %@", @"conversionRequest.status == PHMediaFormatRequestStatusInitialized" object file lineNumber description];
  }
  if ([v7 isCompositeRequest]) {
    [v7 enqueueSubrequestsOnConversionManager:self];
  }
  id v9 = [v7 source];
  id v10 = [v9 renderOriginatingSignature];

  if (v10 == @"PHMediaFormatConversionUnknownFutureIdentifierPlaceholder")
  {
    char v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:2085 description:@"Invalid attempt to enqueue a request using an identifier placeholder. The placeholder may only be used for preflight."];
  }
  if (![v7 requiresSinglePassVideoConversion]) {
    goto LABEL_10;
  }
  BOOL v11 = objc_opt_new();
  [v11 setMediaType:1];
  [v11 generateTemporaryOutputFileURLForRequest:v7];
  objc_msgSend(v11, "enableSinglePassVideoConversionWithTargetLength:", objc_msgSend(v7, "estimatedOutputFileLength"));
  id v20 = 0;
  char v12 = [v11 createTemporaryOutputDirectoryWithError:&v20];
  id v13 = v20;
  if (v12)
  {
    [v7 setDestination:v11];

LABEL_10:
    uint64_t v14 = [(PHMediaFormatConversionManager *)self stateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PHMediaFormatConversionManager_enqueueConversionRequest_completionHandler___block_invoke;
    block[3] = &unk_1E6CFEAA0;
    void block[4] = self;
    id v18 = v7;
    __int16 v19 = v8;
    dispatch_sync(v14, block);

    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v13;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create format conversion output temporary directory: %@", buf, 0xCu);
  }
  [v7 setError:v13];
  [v7 setStatus:5];
  v8[2](v8);

LABEL_14:
}

void __77__PHMediaFormatConversionManager_enqueueConversionRequest_completionHandler___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([a1[4] state] == 1)
  {
    id v2 = [a1[4] jobForConversionRequest:a1[5] completionHandler:a1[6]];
    [a1[5] setStatus:2];
    char v3 = [a1[4] queuedJobs];
    [v3 addObject:v2];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v4 = [a1[5] identifier];
      int8x16_t v5 = [a1[4] queuedJobs];
      int v7 = 138412546;
      unsigned int v8 = v4;
      __int16 v9 = 2048;
      uint64_t v10 = [v5 count];
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Enqueued request %@, enqueued count now %lu", (uint8_t *)&v7, 0x16u);
    }
    [a1[4] processQueuedJobs];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = [a1[5] identifier];
      int v7 = 138412290;
      unsigned int v8 = v6;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Rejecting conversion request %@ enqueued to manager not in running state", (uint8_t *)&v7, 0xCu);
    }
    [a1[5] markAsCancelled];
    id v2 = [a1[4] callbackQueue];
    dispatch_async(v2, a1[6]);
  }
}

- (PHMediaFormatConversionManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)PHMediaFormatConversionManager;
  id v2 = [(PHMediaFormatConversionManager *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    queuedJobs = v2->_queuedJobs;
    v2->_queuedJobs = (NSMutableArray *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.photos.mediaformatconversion.state", 0);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.photos.mediaformatconversion.callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.photos.mediaformatconversion.preflight", 0);
    preflightQueue = v2->_preflightQueue;
    v2->_preflightQueue = (OS_dispatch_queue *)v9;

    v2->_state = 1;
    uint64_t v11 = (void *)MEMORY[0x1E4F1CB10];
    char v12 = NSTemporaryDirectory();
    uint64_t v13 = [v11 fileURLWithPath:v12 isDirectory:1];
    directoryForTemporaryFiles = v2->_directoryForTemporaryFiles;
    v2->_directoryForTemporaryFiles = (NSURL *)v13;

    [(PHMediaFormatConversionManager *)v2 setupConversionImplementation];
  }
  return v2;
}

@end