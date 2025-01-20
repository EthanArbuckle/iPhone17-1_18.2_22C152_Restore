@interface CPLSyncSession
+ (NSString)scopeIdentifierToAutomaticallyExcludeFromMingling;
+ (id)detachedSyncSessionWithScheduler:(id)a3 configuration:(id)a4 scopeFilter:(id)a5;
+ (void)setScopeIdentifierToAutomaticallyExcludeFromMingling:(id)a3;
- (BOOL)allowsLocalConflictResolution;
- (BOOL)allowsLocalConflictResolutionWhenOverQuota;
- (BOOL)isAfterDate:(id)a3;
- (BOOL)isBeforeDate:(id)a3;
- (BOOL)isComputeStateTaskUploadEnabled;
- (BOOL)isDetached;
- (BOOL)isInLessThanTimeInterval:(double)a3;
- (BOOL)isInMoreThanTimeInverval:(double)a3;
- (BOOL)needsToAcquireRescheduler;
- (BOOL)shouldBeDiscretionary;
- (BOOL)shouldConsiderRequestingMoreTime;
- (BOOL)shouldDefer;
- (BOOL)shouldHaveRequestedMoreTime;
- (BOOL)shouldRequestMoreTime;
- (BOOL)shouldRescheduleASyncSession;
- (CPLBackgroundActivity)detachedActivity;
- (CPLEngineScheduler)scheduler;
- (CPLScopeFilter)scopeFilter;
- (CPLSyncSession)initWithSequenceNumber:(unint64_t)a3 expectedDate:(id)a4 scheduler:(id)a5 configuration:(id)a6 scopeFilter:(id)a7;
- (CPLSyncSessionPredictor)predictor;
- (CPLSyncSessionRescheduler)rescheduler;
- (NSArray)currentSessionInformation;
- (NSDate)expectedDate;
- (NSDate)proposedRescheduleDate;
- (NSSet)scopeIdentifiersExcludedFromMingling;
- (NSSet)scopeIdentifiersExcludedFromPushToTransport;
- (NSString)description;
- (NSString)whenItWillStartDescription;
- (double)estimatedRemainingTime;
- (id)addDeferHandler:(id)a3;
- (id)popSessionInformation;
- (int64_t)activityState;
- (int64_t)maximumComputeStatesToUploadPerBatch;
- (unint64_t)currentState;
- (unint64_t)requiredStateAtEndOfSyncSession;
- (unint64_t)sequenceNumber;
- (void)_unwatchPredictor;
- (void)_updatePrediction:(id)a3;
- (void)_watchOrUnwatchPredictorIfNecessary;
- (void)_watchPredictor;
- (void)deferWithBlock:(id)a3;
- (void)dropExpectedDate;
- (void)engineIsClosing;
- (void)excludeScopeIdentifierFromMingling:(id)a3;
- (void)excludeScopeIdentifierFromPushToTransport:(id)a3;
- (void)includeScopeIdentifierInMingling:(id)a3;
- (void)includeScopeIdentifierInPushToTransport:(id)a3;
- (void)noteClientNeedsToPullIfNecessary;
- (void)noteSyncSessionInformation:(id)a3;
- (void)noteSyncSessionInformation:(id)a3 arguments:(char *)a4;
- (void)noteSyncSessionMovedToState:(unint64_t)a3;
- (void)predictor:(id)a3 changedPrediction:(id)a4;
- (void)removeDeferHandler:(id)a3;
- (void)requestSyncStateAtEndOfSyncSession:(unint64_t)a3 reschedule:(BOOL)a4;
- (void)requestSyncStateAtEndOfSyncSession:(unint64_t)a3 reschedule:(BOOL)a4 proposedRescheduleDate:(id)a5;
- (void)resetNoteClientNeedsToPull;
- (void)sessionIsDone;
- (void)sessionWillStart;
- (void)sessionWontHappen;
- (void)setDetachedActivity:(id)a3;
- (void)setRescheduler:(id)a3;
- (void)setShouldConsiderRequestingMoreTime:(BOOL)a3;
- (void)setShouldHaveRequestedMoreTime:(BOOL)a3;
- (void)setShouldRequestMoreTime:(BOOL)a3;
- (void)setupWithConfiguration:(id)a3;
- (void)updateScopeFilter:(id)a3;
@end

@implementation CPLSyncSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeFilter, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_proposedRescheduleDate, 0);
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_destroyWeak((id *)&self->_scheduler);
  objc_storeStrong((id *)&self->_detachedActivity, 0);
  objc_storeStrong((id *)&self->_rescheduler, 0);
  objc_storeStrong((id *)&self->_sessionInformation, 0);
  objc_storeStrong((id *)&self->_scopeIdentifiersExcludedFromPushToTransport, 0);
  objc_storeStrong((id *)&self->_scopeIdentifiersExcludedFromMingling, 0);
}

- (NSSet)scopeIdentifiersExcludedFromPushToTransport
{
  return &self->_scopeIdentifiersExcludedFromPushToTransport->super;
}

- (CPLScopeFilter)scopeFilter
{
  return self->_scopeFilter;
}

- (void)setShouldConsiderRequestingMoreTime:(BOOL)a3
{
  self->_shouldConsiderRequestingMoreTime = a3;
}

- (void)setShouldHaveRequestedMoreTime:(BOOL)a3
{
  self->_shouldHaveRequestedMoreTime = a3;
}

- (BOOL)shouldHaveRequestedMoreTime
{
  return self->_shouldHaveRequestedMoreTime;
}

- (void)setShouldRequestMoreTime:(BOOL)a3
{
  self->_shouldRequestMoreTime = a3;
}

- (BOOL)shouldRequestMoreTime
{
  return self->_shouldRequestMoreTime;
}

- (CPLSyncSessionPredictor)predictor
{
  return self->_predictor;
}

- (NSDate)proposedRescheduleDate
{
  return self->_proposedRescheduleDate;
}

- (BOOL)shouldRescheduleASyncSession
{
  return self->_shouldRescheduleASyncSession;
}

- (unint64_t)requiredStateAtEndOfSyncSession
{
  return self->_requiredStateAtEndOfSyncSession;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSDate)expectedDate
{
  return self->_expectedDate;
}

- (CPLEngineScheduler)scheduler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);
  return (CPLEngineScheduler *)WeakRetained;
}

- (BOOL)isComputeStateTaskUploadEnabled
{
  return self->_isComputeStateTaskUploadEnabled;
}

- (int64_t)maximumComputeStatesToUploadPerBatch
{
  return self->_maximumComputeStatesToUploadPerBatch;
}

- (BOOL)allowsLocalConflictResolution
{
  return self->_allowsLocalConflictResolution;
}

- (BOOL)allowsLocalConflictResolutionWhenOverQuota
{
  return self->_allowsLocalConflictResolutionWhenOverQuota;
}

- (NSArray)currentSessionInformation
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1176;
  v15 = __Block_byref_object_dispose__1177;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v7 = __43__CPLSyncSession_currentSessionInformation__block_invoke;
  v8 = &unk_1E60A5CE8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v4;
}

uint64_t __43__CPLSyncSession_currentSessionInformation__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  return MEMORY[0x1F41817F8]();
}

- (id)popSessionInformation
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1176;
  v15 = __Block_byref_object_dispose__1177;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v7 = __39__CPLSyncSession_popSessionInformation__block_invoke;
  v8 = &unk_1E60A5CE8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

void __39__CPLSyncSession_popSessionInformation__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (void)noteSyncSessionInformation:(id)a3
{
  [(CPLSyncSession *)self noteSyncSessionInformation:a3 arguments:&v3];
}

- (unint64_t)currentState
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v7 = __30__CPLSyncSession_currentState__block_invoke;
  v8 = &unk_1E60A5CE8;
  v9 = self;
  v10 = &v11;
  uint64_t v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  unint64_t v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t __30__CPLSyncSession_currentState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 72);
  return result;
}

- (void)noteSyncSessionMovedToState:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v6 = __46__CPLSyncSession_noteSyncSessionMovedToState___block_invoke;
  v7 = &unk_1E60A6598;
  p_lock = &self->_lock;
  v8 = self;
  unint64_t v9 = a3;
  unint64_t v4 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __46__CPLSyncSession_noteSyncSessionMovedToState___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72) = *(void *)(result + 40);
  return result;
}

- (void)noteSyncSessionInformation:(id)a3 arguments:(char *)a4
{
  id v6 = a3;
  v7 = (void *)[[NSString alloc] initWithFormat:v6 arguments:a4];
  p_lock = &self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v12 = __55__CPLSyncSession_noteSyncSessionInformation_arguments___block_invoke;
  uint64_t v13 = &unk_1E60A6728;
  uint64_t v14 = self;
  id v9 = v7;
  id v15 = v9;
  v10 = v11;
  os_unfair_lock_lock(p_lock);
  v12((uint64_t)v10);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __55__CPLSyncSession_noteSyncSessionInformation_arguments___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)predictor:(id)a3 changedPrediction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v12 = __46__CPLSyncSession_predictor_changedPrediction___block_invoke;
  uint64_t v13 = &unk_1E60A6728;
  uint64_t v14 = self;
  id v9 = v7;
  id v15 = v9;
  v10 = v11;
  os_unfair_lock_lock(p_lock);
  v12((uint64_t)v10);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __46__CPLSyncSession_predictor_changedPrediction___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLSchedulerOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Updating prediction for %@ to %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  return [*(id *)(a1 + 32) _updatePrediction:*(void *)(a1 + 40)];
}

- (void)updateScopeFilter:(id)a3
{
}

- (NSSet)scopeIdentifiersExcludedFromMingling
{
  scopeIdentifiersExcludedFromMingling = self->_scopeIdentifiersExcludedFromMingling;
  if (_scopeIdentifierToAutomaticallyExcludeFromMingling)
  {
    if (scopeIdentifiersExcludedFromMingling)
    {
      -[NSMutableSet setByAddingObject:](scopeIdentifiersExcludedFromMingling, "setByAddingObject:");
      uint64_t v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v3 = (NSMutableSet *)objc_msgSend(v4, "initWithObjects:", _scopeIdentifierToAutomaticallyExcludeFromMingling, 0);
    }
  }
  else
  {
    uint64_t v3 = scopeIdentifiersExcludedFromMingling;
  }
  return (NSSet *)v3;
}

- (void)excludeScopeIdentifierFromMingling:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSMutableSet *)self->_scopeIdentifiersExcludedFromMingling containsObject:v4] & 1) == 0)
  {
    if (!self->_scopeIdentifiersExcludedFromMingling)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      scopeIdentifiersExcludedFromMingling = self->_scopeIdentifiersExcludedFromMingling;
      self->_scopeIdentifiersExcludedFromMingling = v5;
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLSchedulerOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412546;
        uint64_t v9 = self;
        __int16 v10 = 2114;
        id v11 = v4;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "%@ will exclude %{public}@ from mingling", (uint8_t *)&v8, 0x16u);
      }
    }
    [(NSMutableSet *)self->_scopeIdentifiersExcludedFromMingling addObject:v4];
  }
  [(CPLSyncSession *)self requestSyncStateAtEndOfSyncSession:4 reschedule:0];
}

- (void)includeScopeIdentifierInMingling:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableSet *)self->_scopeIdentifiersExcludedFromMingling containsObject:v4])
  {
    if (!_CPLSilentLogging)
    {
      v5 = __CPLSchedulerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412546;
        uint64_t v7 = self;
        __int16 v8 = 2114;
        id v9 = v4;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "%@ will finally include %{public}@ in mingling", (uint8_t *)&v6, 0x16u);
      }
    }
    [(NSMutableSet *)self->_scopeIdentifiersExcludedFromMingling removeObject:v4];
  }
}

- (void)excludeScopeIdentifierFromPushToTransport:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSMutableSet *)self->_scopeIdentifiersExcludedFromPushToTransport containsObject:v4] & 1) == 0)
  {
    if (!self->_scopeIdentifiersExcludedFromPushToTransport)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      scopeIdentifiersExcludedFromPushToTransport = self->_scopeIdentifiersExcludedFromPushToTransport;
      self->_scopeIdentifiersExcludedFromPushToTransport = v5;
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLSchedulerOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412546;
        id v9 = self;
        __int16 v10 = 2114;
        id v11 = v4;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "%@ will exclude %{public}@ from push-to-transport", (uint8_t *)&v8, 0x16u);
      }
    }
    [(NSMutableSet *)self->_scopeIdentifiersExcludedFromPushToTransport addObject:v4];
  }
  [(CPLSyncSession *)self excludeScopeIdentifierFromMingling:v4];
  [(CPLSyncSession *)self requestSyncStateAtEndOfSyncSession:4 reschedule:0];
}

- (void)includeScopeIdentifierInPushToTransport:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableSet *)self->_scopeIdentifiersExcludedFromPushToTransport containsObject:v4])
  {
    if (!_CPLSilentLogging)
    {
      v5 = __CPLSchedulerOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412546;
        uint64_t v7 = self;
        __int16 v8 = 2114;
        id v9 = v4;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "%@ will finally include %{public}@ in push-to-transport", (uint8_t *)&v6, 0x16u);
      }
    }
    [(NSMutableSet *)self->_scopeIdentifiersExcludedFromPushToTransport removeObject:v4];
  }
  [(CPLSyncSession *)self includeScopeIdentifierInMingling:v4];
}

- (void)setupWithConfiguration:(id)a3
{
  id v4 = a3;
  self->_allowsLocalConflictResolutionWhenOverQuota = [v4 allowsLocalConflictResolutionWhenOverQuota];
  self->_allowsLocalConflictResolution = [v4 allowsLocalConflictResolution];
  self->_maximumComputeStatesToUploadPerBatch = [v4 maximumComputeStatesToUploadPerBatch];
  char v5 = [v4 isComputeStateTaskUploadEnabled];

  self->_isComputeStateTaskUploadEnabled = v5;
}

- (double)estimatedRemainingTime
{
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x40AC200000000000;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = __40__CPLSyncSession_estimatedRemainingTime__block_invoke;
  __int16 v8 = &unk_1E60AA7E0;
  id v9 = self;
  uint64_t v10 = &v11;
  uint64_t v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  double v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

double __40__CPLSyncSession_estimatedRemainingTime__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    [v2 estimatedRemainingTime];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    double result = fmax(fmin(*(double *)(v4 + 24), 3600.0), 10.0);
    *(double *)(v4 + 24) = result;
  }
  return result;
}

- (void)removeDeferHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__1176;
    id v16 = __Block_byref_object_dispose__1177;
    id v17 = 0;
    p_lock = &self->_lock;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    __int16 v8 = __37__CPLSyncSession_removeDeferHandler___block_invoke;
    id v9 = &unk_1E60A5CE8;
    uint64_t v10 = self;
    uint64_t v11 = &v12;
    int v6 = v7;
    os_unfair_lock_lock(p_lock);
    v8((uint64_t)v6);
    os_unfair_lock_unlock(p_lock);

    [(id)v13[5] removeDeferHandler:v4];
    _Block_object_dispose(&v12, 8);
  }
}

void __37__CPLSyncSession_removeDeferHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) currentActivity];
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

- (id)addDeferHandler:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1176;
  v18 = __Block_byref_object_dispose__1177;
  id v19 = 0;
  p_lock = &self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  uint64_t v10 = __34__CPLSyncSession_addDeferHandler___block_invoke;
  uint64_t v11 = &unk_1E60A5CE8;
  uint64_t v12 = self;
  uint64_t v13 = &v14;
  int v6 = v9;
  os_unfair_lock_lock(p_lock);
  v10((uint64_t)v6);
  os_unfair_lock_unlock(p_lock);

  uint64_t v7 = [(id)v15[5] addDeferHandler:v4];
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __34__CPLSyncSession_addDeferHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) currentActivity];
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

- (BOOL)shouldConsiderRequestingMoreTime
{
  if (self->_shouldHaveRequestedMoreTime) {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = __50__CPLSyncSession_shouldConsiderRequestingMoreTime__block_invoke;
  __int16 v8 = &unk_1E60AA7E0;
  id v9 = self;
  uint64_t v10 = &v11;
  id v4 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

  BOOL v2 = *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v2;
}

void *__50__CPLSyncSession_shouldConsiderRequestingMoreTime__block_invoke(uint64_t a1)
{
  double result = *(void **)(*(void *)(a1 + 32) + 48);
  if (result)
  {
    double result = (void *)[result shouldConsiderRequestingMoreTime];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  return result;
}

- (void)setDetachedActivity:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v9 = __38__CPLSyncSession_setDetachedActivity___block_invoke;
  uint64_t v10 = &unk_1E60A6728;
  uint64_t v11 = self;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = v8;
  os_unfair_lock_lock(p_lock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __38__CPLSyncSession_setDetachedActivity___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _watchOrUnwatchPredictorIfNecessary];
}

- (CPLBackgroundActivity)detachedActivity
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = __Block_byref_object_copy__1176;
  id v15 = __Block_byref_object_dispose__1177;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = __34__CPLSyncSession_detachedActivity__block_invoke;
  __int16 v8 = &unk_1E60A5CE8;
  id v9 = self;
  uint64_t v10 = &v11;
  id v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CPLBackgroundActivity *)v4;
}

void __34__CPLSyncSession_detachedActivity__block_invoke(uint64_t a1)
{
}

- (void)resetNoteClientNeedsToPull
{
  p_lock = &self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  char v5 = __44__CPLSyncSession_resetNoteClientNeedsToPull__block_invoke;
  id v6 = &unk_1E60A5DD8;
  uint64_t v7 = self;
  id v3 = v4;
  os_unfair_lock_lock(p_lock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __44__CPLSyncSession_resetNoteClientNeedsToPull__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

- (void)noteClientNeedsToPullIfNecessary
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = __50__CPLSyncSession_noteClientNeedsToPullIfNecessary__block_invoke;
  __int16 v8 = &unk_1E60AA7E0;
  id v9 = self;
  uint64_t v10 = &v11;
  id v4 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

  if (*((unsigned char *)v12 + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);
    [WeakRetained noteClientNeedsToPull];
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __50__CPLSyncSession_noteClientNeedsToPullIfNecessary__block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(result + 32) + 40) = 1;
  }
  return result;
}

- (BOOL)needsToAcquireRescheduler
{
  if ([(CPLSyncSession *)self isDetached]) {
    return 0;
  }
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  __int16 v8 = __43__CPLSyncSession_needsToAcquireRescheduler__block_invoke;
  id v9 = &unk_1E60A5CE8;
  uint64_t v10 = self;
  uint64_t v11 = &v12;
  char v5 = v7;
  os_unfair_lock_lock(p_lock);
  v8((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);

  BOOL v3 = *((unsigned char *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  return v3;
}

uint64_t __43__CPLSyncSession_needsToAcquireRescheduler__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48) == 0;
  return result;
}

- (void)setRescheduler:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v9 = __33__CPLSyncSession_setRescheduler___block_invoke;
  uint64_t v10 = &unk_1E60A6728;
  uint64_t v11 = self;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = v8;
  os_unfair_lock_lock(p_lock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __33__CPLSyncSession_setRescheduler___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _watchOrUnwatchPredictorIfNecessary];
}

- (CPLSyncSessionRescheduler)rescheduler
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__1176;
  char v15 = __Block_byref_object_dispose__1177;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = __29__CPLSyncSession_rescheduler__block_invoke;
  __int16 v8 = &unk_1E60A5CE8;
  id v9 = self;
  uint64_t v10 = &v11;
  BOOL v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CPLSyncSessionRescheduler *)v4;
}

void __29__CPLSyncSession_rescheduler__block_invoke(uint64_t a1)
{
}

- (void)_watchOrUnwatchPredictorIfNecessary
{
  rescheduler = self->_rescheduler;
  if (self->_watchingPredictor)
  {
    if (!rescheduler && !self->_detachedActivity) {
      [(CPLSyncSession *)self _unwatchPredictor];
    }
  }
  else if (rescheduler || self->_detachedActivity)
  {
    [(CPLSyncSession *)self _watchPredictor];
  }
  if (self->_watchingPredictor && self->_detachedActivity)
  {
    id v4 = [(CPLSyncSessionPredictor *)self->_predictor currentPrediction];
    [(CPLSyncSession *)self _updatePrediction:v4];
  }
}

- (void)_unwatchPredictor
{
  if (self->_watchingPredictor)
  {
    [(CPLSyncSessionPredictor *)self->_predictor removeObserver:self];
    self->_watchingPredictor = 0;
  }
}

- (void)_watchPredictor
{
  if (!self->_watchingPredictor)
  {
    [(CPLSyncSessionPredictor *)self->_predictor addObserver:self];
    self->_watchingPredictor = 1;
  }
}

- (void)_updatePrediction:(id)a3
{
  id v4 = a3;
  rescheduler = self->_rescheduler;
  if (rescheduler)
  {
    [(CPLSyncSessionRescheduler *)rescheduler updateSyncSessionPrediction:v4];
  }
  else
  {
    detachedActivity = self->_detachedActivity;
    if (detachedActivity) {
      [(CPLBackgroundActivity *)detachedActivity updatePrediction:v4];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)whenItWillStartDescription
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(CPLSyncSession *)self isDetached])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v10 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        id v16 = v11;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);
      }
    }
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m"];
    uint64_t v14 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, v13, 228, @"%@ called on a detached sync session", v14 object file lineNumber description];

    abort();
  }
  expectedDate = self->_expectedDate;
  if (!expectedDate)
  {
    uint64_t v7 = [(CPLSyncSessionRescheduler *)self->_rescheduler goodConditionsDescription];
    if (v7) {
      __int16 v8 = (__CFString *)[[NSString alloc] initWithFormat:@"when conditions are good (%@)", v7];
    }
    else {
      __int16 v8 = @"when conditions are good";
    }

    goto LABEL_13;
  }
  [(NSDate *)expectedDate timeIntervalSinceNow];
  if (v5 > 1.0)
  {
    uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"in %.1fs", *(void *)&v5);
LABEL_9:
    __int16 v8 = (__CFString *)v6;
    goto LABEL_13;
  }
  if (v5 < -1.0)
  {
    uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"very soon (%.1fs overdue)", -v5);
    goto LABEL_9;
  }
  __int16 v8 = @"very soon";
LABEL_13:
  return (NSString *)v8;
}

- (void)engineIsClosing
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(CPLSyncSession *)self isDetached])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        __int16 v8 = (CPLSyncSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v8;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);
      }
    }
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m"];
    uint64_t v11 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, v10, 219, @"%@ called on a detached sync session", v11 object file lineNumber description];

    abort();
  }
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLSchedulerOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = self;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "%@ won't happen in this life: engine is closing", buf, 0xCu);
    }
  }
  p_lock = &self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  uint64_t v13 = __33__CPLSyncSession_engineIsClosing__block_invoke;
  uint64_t v14 = &unk_1E60A5DD8;
  char v15 = self;
  uint64_t v6 = v12;
  os_unfair_lock_lock(p_lock);
  v13((uint64_t)v6);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __33__CPLSyncSession_engineIsClosing__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) engineIsClosing];
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _unwatchPredictor];
}

- (void)sessionWontHappen
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    BOOL v3 = __CPLSchedulerOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = self;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "%@ won't happen", buf, 0xCu);
    }
  }
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = __35__CPLSyncSession_sessionWontHappen__block_invoke;
  __int16 v8 = &unk_1E60A5DD8;
  id v9 = self;
  double v5 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __35__CPLSyncSession_sessionWontHappen__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) sessionWontHappen];
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _unwatchPredictor];
}

- (void)sessionIsDone
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    BOOL v3 = __CPLSchedulerOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = self;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "%@ is done", buf, 0xCu);
    }
  }
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = __31__CPLSyncSession_sessionIsDone__block_invoke;
  __int16 v8 = &unk_1E60A5DD8;
  id v9 = self;
  double v5 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __31__CPLSyncSession_sessionIsDone__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) sessionIsDone];
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _unwatchPredictor];
}

- (void)deferWithBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(CPLSyncSession *)self isDetached])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v11 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        uint64_t v12 = (CPLSyncSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v12;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);
      }
    }
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m"];
    char v15 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, v14, 193, @"%@ called on a detached sync session", v15 object file lineNumber description];

    abort();
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v6 = __CPLSchedulerOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Deferring %@", buf, 0xCu);
    }
  }
  expectedDate = self->_expectedDate;
  self->_expectedDate = 0;

  p_lock = &self->_lock;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  uint64_t v17 = __33__CPLSyncSession_deferWithBlock___block_invoke;
  uint64_t v18 = &unk_1E60A5EE8;
  id v19 = self;
  id v9 = v5;
  id v20 = v9;
  uint64_t v10 = v16;
  os_unfair_lock_lock(p_lock);
  v17((uint64_t)v10);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __33__CPLSyncSession_deferWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) deferWithBlock:*(void *)(a1 + 40)];
}

- (void)sessionWillStart
{
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  uint64_t v6 = __34__CPLSyncSession_sessionWillStart__block_invoke;
  uint64_t v7 = &unk_1E60A5DD8;
  __int16 v8 = self;
  id v4 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);

  if (self->_shouldRequestMoreTime) {
    [(CPLSyncSession *)self noteSyncSessionInformation:@"Session will request more time"];
  }
}

void __34__CPLSyncSession_sessionWillStart__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (void)dropExpectedDate
{
  self->_expectedDate = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)isInLessThanTimeInterval:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(CPLSyncSession *)self isDetached])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __int16 v8 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v8;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);
      }
    }
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m"];
    uint64_t v11 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, v10, 174, @"%@ called on a detached sync session", v11 object file lineNumber description];

    abort();
  }
  return ![(CPLSyncSession *)self isInLessThanTimeInterval:a3];
}

- (BOOL)isInMoreThanTimeInverval:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(CPLSyncSession *)self isDetached])
  {
    if (!_CPLSilentLogging)
    {
      id v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        char v15 = v10;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m"];
    uint64_t v13 = NSStringFromSelector(a2);
    [v11 handleFailureInMethod:a2, self, v12, 163, @"%@ called on a detached sync session", v13 object file lineNumber description];

    abort();
  }
  expectedDate = self->_expectedDate;
  if (!expectedDate) {
    return 1;
  }
  [(NSDate *)expectedDate timeIntervalSinceNow];
  return v7 > a3;
}

- (BOOL)isBeforeDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(CPLSyncSession *)self isDetached])
  {
    if (!_CPLSilentLogging)
    {
      __int16 v8 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);
      }
    }
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m"];
    uint64_t v12 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, v11, 158, @"%@ called on a detached sync session", v12 object file lineNumber description];

    abort();
  }
  BOOL v6 = [(CPLSyncSession *)self isAfterDate:v5];

  return !v6;
}

- (BOOL)isAfterDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(CPLSyncSession *)self isDetached])
  {
    if (!_CPLSilentLogging)
    {
      id v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v10;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "%@ called on a detached sync session", buf, 0xCu);
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLSyncSession.m"];
    uint64_t v13 = NSStringFromSelector(a2);
    [v11 handleFailureInMethod:a2, self, v12, 148, @"%@ called on a detached sync session", v13 object file lineNumber description];

    abort();
  }
  expectedDate = self->_expectedDate;
  if (expectedDate) {
    BOOL v7 = [(NSDate *)expectedDate compare:v5] == NSOrderedDescending;
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)requestSyncStateAtEndOfSyncSession:(unint64_t)a3 reschedule:(BOOL)a4
{
}

- (void)requestSyncStateAtEndOfSyncSession:(unint64_t)a3 reschedule:(BOOL)a4 proposedRescheduleDate:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = v8;
  if (self->_requiredStateAtEndOfSyncSession > a3)
  {
    self->_requiredStateAtEndOfSyncSession = a3;
    if (v5)
    {
      self->_shouldRescheduleASyncSession = 1;
      if (!v8)
      {
        id v9 = [MEMORY[0x1E4F1C9C8] date];
      }
      proposedRescheduleDate = self->_proposedRescheduleDate;
      uint64_t v13 = v9;
      if (proposedRescheduleDate)
      {
        uint64_t v11 = [(NSDate *)proposedRescheduleDate earlierDate:v9];
      }
      else
      {
        uint64_t v11 = v9;
      }
      uint64_t v12 = self->_proposedRescheduleDate;
      self->_proposedRescheduleDate = v11;

      id v9 = v13;
    }
  }
  MEMORY[0x1F41817F8](v8, v9);
}

- (int64_t)activityState
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__1176;
  uint64_t v17 = __Block_byref_object_dispose__1177;
  id v18 = 0;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v8 = __31__CPLSyncSession_activityState__block_invoke;
  id v9 = &unk_1E60AB220;
  uint64_t v10 = self;
  uint64_t v11 = &v19;
  uint64_t v12 = &v13;
  BOOL v3 = v7;
  os_unfair_lock_lock(p_lock);
  v8(v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (void *)v14[5];
  if (v4) {
    int64_t v5 = [v4 activityState];
  }
  else {
    int64_t v5 = v20[3];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v5;
}

void __31__CPLSyncSession_activityState__block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  if (v1[7] || v1[12] == -1)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = 2;
  }
  else
  {
    BOOL v2 = (void *)v1[6];
    if (v2) {
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v2);
    }
    else {
      *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
    }
  }
}

- (BOOL)shouldDefer
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__1176;
  uint64_t v17 = __Block_byref_object_dispose__1177;
  id v18 = 0;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v8 = __29__CPLSyncSession_shouldDefer__block_invoke;
  id v9 = &unk_1E60AB220;
  uint64_t v10 = self;
  uint64_t v11 = &v19;
  uint64_t v12 = &v13;
  BOOL v3 = v7;
  os_unfair_lock_lock(p_lock);
  v8(v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (void *)v14[5];
  if (v4) {
    char v5 = [v4 shouldDefer];
  }
  else {
    char v5 = *((unsigned char *)v20 + 24) != 0;
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v5;
}

void __29__CPLSyncSession_shouldDefer__block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  BOOL v3 = *(void **)(v2 + 56);
  if (v3)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v3 shouldDefer];
  }
  else
  {
    id v4 = *(void **)(v2 + 48);
    if (v4)
    {
      char v5 = (id *)(*(void *)(a1[6] + 8) + 40);
      objc_storeStrong(v5, v4);
    }
    else
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    }
  }
}

- (BOOL)shouldBeDiscretionary
{
  return ![(CPLSyncSession *)self isDetached];
}

- (BOOL)isDetached
{
  return self->_sequenceNumber == -1;
}

- (NSString)description
{
  if (self->_sequenceNumber == -1) {
    uint64_t v2 = @"[detached session]";
  }
  else {
    uint64_t v2 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"[session #%lu]", self->_sequenceNumber);
  }
  return (NSString *)v2;
}

- (CPLSyncSession)initWithSequenceNumber:(unint64_t)a3 expectedDate:(id)a4 scheduler:(id)a5 configuration:(id)a6 scopeFilter:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CPLSyncSession;
  uint64_t v17 = [(CPLSyncSession *)&v23 init];
  id v18 = v17;
  if (v17)
  {
    v17->_lock._os_unfair_lock_opaque = 0;
    v17->_sequenceNumber = a3;
    objc_storeStrong((id *)&v17->_expectedDate, a4);
    objc_storeWeak((id *)&v18->_scheduler, v14);
    objc_storeStrong((id *)&v18->_scopeFilter, a7);
    id WeakRetained = objc_loadWeakRetained((id *)&v18->_scheduler);
    uint64_t v20 = [WeakRetained predictor];
    predictor = v18->_predictor;
    v18->_predictor = (CPLSyncSessionPredictor *)v20;

    v18->_requiredStateAtEndOfSyncSession = 14;
    [(CPLSyncSession *)v18 setupWithConfiguration:v15];
  }

  return v18;
}

+ (void)setScopeIdentifierToAutomaticallyExcludeFromMingling:(id)a3
{
  uint64_t v3 = [a3 copy];
  uint64_t v4 = _scopeIdentifierToAutomaticallyExcludeFromMingling;
  _scopeIdentifierToAutomaticallyExcludeFromMingling = v3;
  MEMORY[0x1F41817F8](v3, v4);
}

+ (NSString)scopeIdentifierToAutomaticallyExcludeFromMingling
{
  return (NSString *)(id)_scopeIdentifierToAutomaticallyExcludeFromMingling;
}

+ (id)detachedSyncSessionWithScheduler:(id)a3 configuration:(id)a4 scopeFilter:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[CPLSyncSession alloc] initWithSequenceNumber:-1 expectedDate:0 scheduler:v9 configuration:v8 scopeFilter:v7];

  return v10;
}

@end