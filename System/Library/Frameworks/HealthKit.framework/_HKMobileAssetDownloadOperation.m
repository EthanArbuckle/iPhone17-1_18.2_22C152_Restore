@interface _HKMobileAssetDownloadOperation
- (_HKMobileAssetDownloadOperation)initWithAsset:(id)a3 queue:(id)a4 downloadOptions:(id)a5 maxNumberOfRetriesAllowed:(int64_t)a6 completion:(id)a7;
- (id)description;
- (void)_queue_callCompletionWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_queue_downloadAsset;
- (void)_queue_run;
- (void)_queue_transitionToCompleted;
- (void)_queue_transitionToDownloadingAsset;
- (void)_queue_transitionToFailureWithDownloadResult:(int64_t)a3;
- (void)_queue_transitionToInitialized;
- (void)_queue_transitionToState:(int64_t)a3;
- (void)run;
@end

@implementation _HKMobileAssetDownloadOperation

- (void)_queue_transitionToInitialized
{
}

- (void)_queue_transitionToState:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v5 = HKLogMobileAsset;
  if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
  {
    int64_t state = self->_state;
    int v7 = 138543874;
    v8 = self;
    __int16 v9 = 2048;
    int64_t v10 = state;
    __int16 v11 = 2048;
    int64_t v12 = a3;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Transitioning from state %ld to state %ld", (uint8_t *)&v7, 0x20u);
  }
  self->_int64_t state = a3;
}

- (void)run
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___HKMobileAssetDownloadOperation_run__block_invoke;
  block[3] = &unk_1E58BBA00;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_queue_run
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_state)
  {
    [(_HKMobileAssetDownloadOperation *)self _queue_transitionToDownloadingAsset];
    unint64_t v3 = [(MAAsset *)self->_asset state];
    _HKInitializeLogging();
    v4 = HKLogMobileAsset;
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543618;
      v6 = self;
      __int16 v7 = 2048;
      unint64_t v8 = v3;
      _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Asset is in asset state %ld", (uint8_t *)&v5, 0x16u);
    }
    if (v3 <= 6)
    {
      if (((1 << v3) & 0x6C) != 0)
      {
        [(_HKMobileAssetDownloadOperation *)self _queue_transitionToCompleted];
      }
      else if (((1 << v3) & 0x12) != 0)
      {
        [(_HKMobileAssetDownloadOperation *)self _queue_downloadAsset];
      }
    }
  }
}

- (void)_queue_transitionToDownloadingAsset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"_HKMobileAssetDownloadManager.m", 468, @"Invalid parameter not satisfying: %@", @"_state == _HKMobileAssetDownloadOperationStateInitialized" object file lineNumber description];
  }

  [(_HKMobileAssetDownloadOperation *)self _queue_transitionToState:1];
}

- (void)_queue_transitionToCompleted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 1)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"_HKMobileAssetDownloadManager.m", 494, @"Invalid parameter not satisfying: %@", @"_state == _HKMobileAssetDownloadOperationStateDownloadingAsset" object file lineNumber description];
  }
  [(_HKMobileAssetDownloadOperation *)self _queue_transitionToState:3];

  [(_HKMobileAssetDownloadOperation *)self _queue_callCompletionWithSuccess:1 error:0];
}

- (void)_queue_callCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  completion = (void (**)(id, _HKMobileAssetDownloadOperation *, BOOL, id))self->_completion;
  if (completion) {
    completion[2](completion, self, v4, v8);
  }
  asset = self->_asset;
  self->_asset = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_downloadOptions, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (_HKMobileAssetDownloadOperation)initWithAsset:(id)a3 queue:(id)a4 downloadOptions:(id)a5 maxNumberOfRetriesAllowed:(int64_t)a6 completion:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_HKMobileAssetDownloadManager.m", 392, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"_HKMobileAssetDownloadManager.m", 393, @"Invalid parameter not satisfying: %@", @"queue != NULL" object file lineNumber description];

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)_HKMobileAssetDownloadOperation;
  v18 = [(_HKMobileAssetDownloadOperation *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_retryCount = 0;
    objc_storeStrong((id *)&v18->_asset, a3);
    v20 = _Block_copy(v17);
    id completion = v19->_completion;
    v19->_id completion = v20;

    objc_storeStrong((id *)&v19->_queue, a4);
    objc_storeStrong((id *)&v19->_downloadOptions, a5);
    v19->_maxNumberOfRetriesAllowed = a6;
    [(_HKMobileAssetDownloadOperation *)v19 _queue_transitionToInitialized];
  }

  return v19;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(MAAsset *)self->_asset assetType];
  v6 = [v3 stringWithFormat:@"<%@:%p assetType:\"%@\">", v4, self, v5];

  return v6;
}

- (void)_queue_transitionToFailureWithDownloadResult:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(_HKMobileAssetDownloadOperation *)self _queue_transitionToState:2];
  if (self->_retryCount >= self->_maxNumberOfRetriesAllowed)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MADownloadResult" code:a3 userInfo:0];
    -[_HKMobileAssetDownloadOperation _queue_callCompletionWithSuccess:error:](self, "_queue_callCompletionWithSuccess:error:", 0);
  }
  else
  {
    _HKInitializeLogging();
    int v5 = HKLogMobileAsset;
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEBUG))
    {
      int64_t retryCount = self->_retryCount;
      int64_t maxNumberOfRetriesAllowed = self->_maxNumberOfRetriesAllowed;
      *(_DWORD *)buf = 138543874;
      int64_t v10 = self;
      __int16 v11 = 2048;
      int64_t v12 = retryCount;
      __int16 v13 = 2048;
      int64_t v14 = maxNumberOfRetriesAllowed;
      _os_log_debug_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Retry count (%ld) less than max number of retries allowed (%ld), retrying.", buf, 0x20u);
    }
    ++self->_retryCount;
    [(_HKMobileAssetDownloadOperation *)self _queue_transitionToInitialized];
    [(_HKMobileAssetDownloadOperation *)self run];
  }
}

- (void)_queue_downloadAsset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  asset = self->_asset;
  downloadOptions = self->_downloadOptions;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55___HKMobileAssetDownloadOperation__queue_downloadAsset__block_invoke;
  v5[3] = &unk_1E58C4DF8;
  v5[4] = self;
  [(MAAsset *)asset startDownload:downloadOptions then:v5];
}

@end