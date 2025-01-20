@interface HDCloudSyncOperation
+ (BOOL)shouldFailOnXPCActivityDeferral;
+ (BOOL)shouldLogAtOperationEnd;
+ (BOOL)shouldLogAtOperationStart;
+ (BOOL)shouldProduceOperationAnalytics;
+ (id)finishedOperationTags;
+ (id)operationTagDependencies;
+ (id)unitTest_operationHandler;
+ (int64_t)progressCount;
+ (void)unitTest_clearAllOperationHandlers;
+ (void)unitTest_setOperationHandler:(id)a3;
- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4;
- (HDCloudSyncCloudState)cloudState;
- (HDCloudSyncOperation)init;
- (HDCloudSyncOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncOperation)initWithPreceedingOperation:(id)a3 transitionHandler:(id)a4;
- (HDCloudSyncOperation)operationWithRunCondition:(id)a3;
- (HDCloudSyncOperationConfiguration)configuration;
- (HDProfile)profile;
- (NSProgress)progress;
- (NSString)description;
- (NSUUID)identifier;
- (id)analyticsDictionary;
- (id)asPipelineStage;
- (id)onError;
- (id)onSuccess;
- (id)operationIgnoringErrors;
- (int64_t)status;
- (void)chainFromOperation:(id)a3 transitionHandler:(id)a4;
- (void)delegateToOperation:(id)a3;
- (void)main;
- (void)setCloudState:(id)a3;
- (void)setOnError:(id)a3;
- (void)setOnSuccess:(id)a3;
- (void)skip;
- (void)start;
- (void)updateCompletedProgressCount:(int64_t)a3;
@end

@implementation HDCloudSyncOperation

- (id)asPipelineStage
{
  v2 = [[HDCloudSyncOperationPipelineStage alloc] initWithOperation:self];

  return v2;
}

+ (int64_t)progressCount
{
  return 1;
}

+ (BOOL)shouldFailOnXPCActivityDeferral
{
  return 1;
}

+ (BOOL)shouldLogAtOperationStart
{
  return 1;
}

+ (BOOL)shouldLogAtOperationEnd
{
  return 1;
}

+ (BOOL)shouldProduceOperationAnalytics
{
  return 1;
}

+ (id)finishedOperationTags
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)operationTagDependencies
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (HDCloudSyncOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HDCloudSyncOperation;
  v9 = [(HDCloudSyncOperation *)&v32 init];
  if (v9)
  {
    v10 = [v7 repository];
    v11 = [v10 profile];
    uint64_t v12 = [v11 legacyRepositoryProfile];
    profile = v9->_profile;
    v9->_profile = (HDProfile *)v12;

    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v9->_cloudState, a4);
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend((id)objc_opt_class(), "progressCount"));
    progress = v9->_progress;
    v9->_progress = (NSProgress *)v14;

    uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v16;

    id v31 = [NSString alloc];
    v18 = [(HDCloudSyncOperationConfiguration *)v9->_configuration shortSyncIdentifier];
    v19 = [(NSUUID *)v9->_identifier UUIDString];
    v20 = [v19 substringToIndex:4];
    v21 = [(HDCloudSyncOperationConfiguration *)v9->_configuration shortProfileIdentifier];
    v22 = [(HDCloudSyncOperationConfiguration *)v9->_configuration repository];
    [v22 profileType];
    v23 = HKStringFromProfileType();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    id v25 = v7;
    v27 = id v26 = v8;
    uint64_t v28 = [v31 initWithFormat:@"[%@:%@] [%@:%@] %@", v18, v20, v21, v23, v27];
    loggingPrefix = v9->_loggingPrefix;
    v9->_loggingPrefix = (NSString *)v28;

    id v8 = v26;
    id v7 = v25;
  }
  return v9;
}

- (HDCloudSyncOperation)initWithPreceedingOperation:(id)a3 transitionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 configuration];
  v9 = [(HDCloudSyncOperation *)self initWithConfiguration:v8 cloudState:0];

  [(HDCloudSyncOperation *)v9 chainFromOperation:v7 transitionHandler:v6];
  return v9;
}

- (void)setOnSuccess:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_status)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDCloudSyncOperation.m", 101, @"Invalid parameter not satisfying: %@", @"_status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  v5 = (void *)[v8 copy];
  id onSuccess = self->_onSuccess;
  self->_id onSuccess = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)onSuccess
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = _Block_copy(self->_onSuccess);
  os_unfair_lock_unlock(p_lock);
  v5 = _Block_copy(v4);

  return v5;
}

- (void)setOnError:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_status)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDCloudSyncOperation.m", 117, @"Invalid parameter not satisfying: %@", @"_status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  v5 = (void *)[v8 copy];
  id onError = self->_onError;
  self->_id onError = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)onError
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = _Block_copy(self->_onError);
  os_unfair_lock_unlock(p_lock);
  v5 = _Block_copy(v4);

  return v5;
}

- (void)chainFromOperation:(id)a3 transitionHandler:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HDCloudSyncOperation_chainFromOperation_transitionHandler___block_invoke;
  v11[3] = &unk_1E62F2950;
  v11[4] = self;
  id v7 = a3;
  [v7 setOnError:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HDCloudSyncOperation_chainFromOperation_transitionHandler___block_invoke_2;
  v9[3] = &unk_1E62F5D20;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 setOnSuccess:v9];
}

void __61__HDCloudSyncOperation_chainFromOperation_transitionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 onError];
  v7[2](v7, v6, v5);
}

void __61__HDCloudSyncOperation_chainFromOperation_transitionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 cloudState];
  [*(id *)(a1 + 32) setCloudState:v3];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v5, *(void *)(a1 + 32));
  }
  [*(id *)(a1 + 32) start];
}

- (void)start
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_onSuccess)
  {
    objc_super v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"HDCloudSyncOperation.m", 149, @"Invalid parameter not satisfying: %@", @"_onSuccess != nil" object file lineNumber description];
  }
  if (!self->_onError)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"HDCloudSyncOperation.m", 150, @"Invalid parameter not satisfying: %@", @"_onError != nil" object file lineNumber description];
  }
  if (self->_status)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"HDCloudSyncOperation.m", 151, @"Invalid parameter not satisfying: %@", @"_status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  self->_status = 1;
  self->_startTime = CFAbsoluteTimeGetCurrent();
  configuration = self->_configuration;
  id v6 = [(id)objc_opt_class() operationTagDependencies];
  id v36 = 0;
  BOOL v7 = [(HDCloudSyncOperationConfiguration *)configuration satisfiesOperationTagDependencies:v6 error:&v36];
  id v8 = v36;

  if (v7)
  {
    v9 = [(HDCloudSyncOperation *)self configuration];
    int v10 = [v9 canceled];

    if (v10)
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v38 = self;
        _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation cancellation requested.", buf, 0xCu);
      }
      os_unfair_lock_unlock(p_lock);
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      v13 = @"Operation cancellation requested.";
      uint64_t v14 = 728;
    }
    else
    {
      if (![(id)objc_opt_class() shouldFailOnXPCActivityDeferral]) {
        goto LABEL_31;
      }
      v15 = [(HDCloudSyncOperation *)self configuration];
      uint64_t v16 = [v15 context];
      v17 = [v16 xpcActivity];
      int v18 = [v17 shouldDefer];

      if (!v18)
      {
LABEL_31:
        if ([(id)objc_opt_class() shouldLogAtOperationStart])
        {
          _HKInitializeLogging();
          id v25 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v38 = self;
            _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting.", buf, 0xCu);
          }
        }
        os_unfair_lock_unlock(p_lock);
        if ([(id)objc_opt_class() shouldProduceOperationAnalytics])
        {
          id v26 = [(HDCloudSyncOperationConfiguration *)self->_configuration repository];
          v27 = [v26 profile];
          uint64_t v28 = [v27 daemon];
          v29 = [v28 analyticsSubmissionCoordinator];
          objc_msgSend(v29, "cloudSync_operationStarted:", self);
        }
        uint64_t v30 = objc_msgSend((id)objc_opt_class(), "unitTest_operationHandler");
        v24 = (void *)v30;
        if (v30)
        {
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __29__HDCloudSyncOperation_start__block_invoke;
          v35[3] = &unk_1E62F2978;
          v35[4] = self;
          (*(void (**)(uint64_t, HDCloudSyncOperation *, void *))(v30 + 16))(v30, self, v35);
        }
        else
        {
          id v31 = (void *)MEMORY[0x1C187C0E0]();
          [(HDCloudSyncOperation *)self main];
        }
        goto LABEL_27;
      }
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        v21 = [(HDCloudSyncOperation *)self configuration];
        v22 = [v21 context];
        v23 = [v22 xpcActivity];
        *(_DWORD *)buf = 138543618;
        v38 = self;
        __int16 v39 = 2114;
        v40 = v23;
        _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation deferral requested for activity %{public}@.", buf, 0x16u);
      }
      os_unfair_lock_unlock(p_lock);
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      v13 = @"Operation activity deferred.";
      uint64_t v14 = 708;
    }
    v24 = objc_msgSend(v12, "hk_error:format:", v14, v13);
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v24];
LABEL_27:

    goto LABEL_28;
  }
  os_unfair_lock_unlock(p_lock);
  [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v8];
LABEL_28:
}

uint64_t __29__HDCloudSyncOperation_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithSuccess:a2 error:a3];
}

- (void)main
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)skip
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t status = self->_status;
  id onSuccess = self->_onSuccess;
  self->_id onSuccess = 0;

  id onError = self->_onError;
  self->_id onError = 0;

  os_unfair_lock_unlock(p_lock);
  if (status)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDCloudSyncOperation.m", 215, @"Invalid parameter not satisfying: %@", @"status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
}

- (void)delegateToOperation:(id)a3
{
  id v5 = a3;
  if ([(HDCloudSyncOperation *)self status] != 1)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDCloudSyncOperation.m", 220, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusActive" object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__HDCloudSyncOperation_delegateToOperation___block_invoke;
  v13[3] = &unk_1E62F2928;
  v13[4] = self;
  [v5 setOnSuccess:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__HDCloudSyncOperation_delegateToOperation___block_invoke_2;
  v12[3] = &unk_1E62F2950;
  v12[4] = self;
  [v5 setOnError:v12];
  id v6 = [v5 progress];
  uint64_t v7 = [v6 totalUnitCount];

  id v8 = [(HDCloudSyncOperation *)self progress];
  objc_msgSend(v8, "setTotalUnitCount:", objc_msgSend(v8, "totalUnitCount") + v7);

  v9 = [(HDCloudSyncOperation *)self progress];
  int v10 = [v5 progress];
  [v9 addChild:v10 withPendingUnitCount:v7];

  [v5 start];
}

uint64_t __44__HDCloudSyncOperation_delegateToOperation___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 cloudState];
  [*(id *)(a1 + 32) setCloudState:v3];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 finishWithSuccess:1 error:0];
}

uint64_t __44__HDCloudSyncOperation_delegateToOperation___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithSuccess:0 error:a3];
}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  int64_t status = self->_status;
  if (status == 1)
  {
    int64_t v9 = 2;
    if (!v4) {
      int64_t v9 = 3;
    }
    self->_int64_t status = v9;
    int v10 = (void (**)(void *, HDCloudSyncOperation *))_Block_copy(self->_onSuccess);
    v11 = (void (**)(void *, HDCloudSyncOperation *, id))_Block_copy(self->_onError);
    id onSuccess = self->_onSuccess;
    self->_id onSuccess = 0;

    id onError = self->_onError;
    self->_id onError = 0;

    self->_endTime = CFAbsoluteTimeGetCurrent();
    if (_HDIsUnitTesting)
    {
      int64_t v14 = [(NSProgress *)self->_progress completedUnitCount];
      if (v14 > [(NSProgress *)self->_progress totalUnitCount])
      {
        v40 = [MEMORY[0x1E4F28B00] currentHandler];
        [v40 handleFailureInMethod:a2, self, @"HDCloudSyncOperation.m", 257, @"Invalid parameter not satisfying: %@", @"_progress.completedUnitCount <= _progress.totalUnitCount" object file lineNumber description];
      }
    }
    [(NSProgress *)self->_progress setCompletedUnitCount:[(NSProgress *)self->_progress totalUnitCount]];
    os_unfair_lock_unlock(&self->_lock);
    if (v4)
    {
      if ([(id)objc_opt_class() shouldLogAtOperationEnd])
      {
        _HKInitializeLogging();
        v15 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v47 = self;
          _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished.", buf, 0xCu);
        }
      }
      if ([(id)objc_opt_class() shouldProduceOperationAnalytics])
      {
        uint64_t v16 = [(HDCloudSyncOperationConfiguration *)self->_configuration repository];
        v17 = [v16 profile];
        int v18 = [v17 daemon];
        v19 = [v18 analyticsSubmissionCoordinator];
        objc_msgSend(v19, "cloudSync_operationFinished:", self);
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v20 = [(id)objc_opt_class() finishedOperationTags];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v42 != v23) {
              objc_enumerationMutation(v20);
            }
            [(HDCloudSyncOperationConfiguration *)self->_configuration didFinishOperationTag:*(void *)(*((void *)&v41 + 1) + 8 * i)];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v22);
      }

      v10[2](v10, self);
    }
    else
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 2000, @"%@ failed without reporting an error.", self);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        _HKInitializeLogging();
        id v26 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v47 = self;
          _os_log_fault_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_FAULT, "%{public}@: Failed but did not provide an error.", buf, 0xCu);
        }
      }
      if ([(id)objc_opt_class() shouldLogAtOperationEnd])
      {
        _HKInitializeLogging();
        v27 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v47 = self;
          __int16 v48 = 2114;
          id v49 = v7;
          _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed with error: %{public}@.", buf, 0x16u);
        }
      }
      uint64_t v28 = objc_msgSend(v7, "hd_errorSurfacingFatalCloudKitPartialFailureForAnalytics");
      v29 = (void *)v28;
      if (v28) {
        uint64_t v30 = (void *)v28;
      }
      else {
        uint64_t v30 = v7;
      }
      id v31 = v30;

      objc_super v32 = [(HDCloudSyncOperationConfiguration *)self->_configuration repository];
      v33 = [v32 profile];
      v34 = [v33 daemon];
      v35 = [v34 analyticsSubmissionCoordinator];
      objc_msgSend(v35, "cloudSync_operationFailed:error:", self, v31);

      v11[2](v11, self, v7);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v25 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      v37 = v25;
      v38 = NSStringFromSelector(a2);
      __int16 v39 = HDCloudSyncOperationStatusToString(self->_status);
      *(_DWORD *)buf = 138543874;
      v47 = self;
      __int16 v48 = 2114;
      id v49 = v38;
      __int16 v50 = 2114;
      v51 = v39;
      _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ called in unexpected state %{public}@", buf, 0x20u);
    }
    os_unfair_lock_unlock(&self->_lock);
  }

  return status == 1;
}

- (id)analyticsDictionary
{
  v19[5] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v18[0] = @"operationClass";
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v19[0] = v5;
  v18[1] = @"status";
  id v6 = [NSNumber numberWithInteger:self->_status];
  v19[1] = v6;
  v18[2] = @"startTime";
  id v7 = [NSNumber numberWithDouble:self->_startTime];
  v19[2] = v7;
  v18[3] = @"endTime";
  id v8 = [NSNumber numberWithDouble:self->_endTime];
  v19[3] = v8;
  v18[4] = @"duration";
  int64_t v9 = NSNumber;
  os_unfair_lock_assert_owner(p_lock);
  int64_t status = self->_status;
  if ((unint64_t)(status - 2) >= 2)
  {
    double v12 = 0.0;
    if (status != 1) {
      goto LABEL_6;
    }
    double Current = CFAbsoluteTimeGetCurrent();
  }
  else
  {
    double Current = self->_endTime;
  }
  double v12 = Current - self->_startTime;
LABEL_6:
  v13 = [v9 numberWithDouble:v12];
  v19[4] = v13;
  int64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
  v15 = [(HDCloudSyncOperationConfiguration *)self->_configuration analyticsDictionary];
  uint64_t v16 = objc_msgSend(v14, "hk_dictionaryByAddingEntriesFromDictionary:", v15);

  os_unfair_lock_unlock(p_lock);

  return v16;
}

- (NSString)description
{
  v2 = NSString;
  loggingPrefix = self->_loggingPrefix;
  BOOL v4 = HDCloudSyncOperationStatusToString(self->_status);
  id v5 = [v2 stringWithFormat:@"<%@ %@>", loggingPrefix, v4];

  return (NSString *)v5;
}

- (void)updateCompletedProgressCount:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(HDCloudSyncOperation *)self progress];
  uint64_t v8 = [v7 completedUnitCount];

  uint64_t v9 = v8 + a3;
  if (_HDIsUnitTesting)
  {
    if (a3 < 0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"HDCloudSyncOperation.m", 329, @"Invalid parameter not satisfying: %@", @"updated >= current" object file lineNumber description];
    }
    int v10 = [(HDCloudSyncOperation *)self progress];
    uint64_t v11 = [v10 totalUnitCount];

    if (v9 > v11)
    {
      int64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"HDCloudSyncOperation.m", 330, @"Invalid parameter not satisfying: %@", @"updated <= self.progress.totalUnitCount" object file lineNumber description];
    }
  }
  double v12 = [(HDCloudSyncOperation *)self progress];
  [v12 setCompletedUnitCount:v9];

  os_unfair_lock_unlock(p_lock);
}

+ (id)unitTest_operationHandler
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_217);
  v3 = (void *)qword_1EBA18DA8;
  BOOL v4 = NSStringFromClass((Class)a1);
  id v5 = [v3 objectForKeyedSubscript:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_217);
  id v6 = _Block_copy(v5);

  return v6;
}

+ (void)unitTest_setOperationHandler:(id)a3
{
  id v10 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_217);
  if (!qword_1EBA18DA8)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = (void *)qword_1EBA18DA8;
    qword_1EBA18DA8 = (uint64_t)v4;
  }
  id v6 = (void *)[v10 copy];
  id v7 = _Block_copy(v6);
  uint64_t v8 = (void *)qword_1EBA18DA8;
  uint64_t v9 = NSStringFromClass((Class)a1);
  [v8 setObject:v7 forKeyedSubscript:v9];

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_217);
}

+ (void)unitTest_clearAllOperationHandlers
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_217);
  v2 = (void *)qword_1EBA18DA8;
  qword_1EBA18DA8 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_217);
}

- (HDProfile)profile
{
  return self->_profile;
}

- (HDCloudSyncOperationConfiguration)configuration
{
  return self->_configuration;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (int64_t)status
{
  return self->_status;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HDCloudSyncCloudState)cloudState
{
  return (HDCloudSyncCloudState *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCloudState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudState, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_storeStrong(&self->_onError, 0);

  objc_storeStrong(&self->_onSuccess, 0);
}

- (id)operationIgnoringErrors
{
  v3 = [HDCloudSyncIgnoredErrorsOperation alloc];
  id v4 = [(HDCloudSyncOperation *)self configuration];
  id v5 = [(HDCloudSyncOperation *)self cloudState];
  id v6 = [(HDCloudSyncIgnoredErrorsOperation *)v3 initWithConfiguration:v4 cloudState:v5 operation:self];

  return v6;
}

- (HDCloudSyncOperation)operationWithRunCondition:(id)a3
{
  id v4 = a3;
  id v5 = [HDCloudSyncConditionalOperation alloc];
  id v6 = [(HDCloudSyncOperation *)self configuration];
  id v7 = [(HDCloudSyncOperation *)self cloudState];
  uint64_t v8 = [(HDCloudSyncConditionalOperation *)v5 initWithConfiguration:v6 cloudState:v7 operation:self shouldRunHandler:v4];

  return (HDCloudSyncOperation *)v8;
}

@end