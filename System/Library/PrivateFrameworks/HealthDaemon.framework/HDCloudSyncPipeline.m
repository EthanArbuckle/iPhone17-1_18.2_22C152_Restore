@interface HDCloudSyncPipeline
+ (id)operationGroupForContext:(id)a3 syncCircleIdentifier:(id)a4 assetDownloadStagingManager:(id)a5;
+ (id)retrieveAndResetSyncCounts;
+ (uint64_t)_shouldIncrementCountForSyncAnalyticsForContext:(uint64_t)a1;
- (BOOL)continueWhenSyncDisabled;
- (BOOL)ignoreCloudKitOperationDelay;
- (CKOperationGroup)operationGroup;
- (HDAssertion)accessibilityAssertion;
- (HDCloudSyncContext)context;
- (HDCloudSyncOperationConfiguration)operationConfiguration;
- (HDCloudSyncRepository)repository;
- (NSProgress)progress;
- (NSUUID)identifier;
- (OS_dispatch_queue)queue;
- (id)analyticsDictionary;
- (id)beginWithCompletion:(id)a3;
- (id)beginWithTaskTree:(id)a3;
- (id)description;
- (id)initForContext:(id)a3 repository:(id)a4 accessibilityAssertion:(id)a5 queue:(id)a6;
- (id)pipelineCompletionHandler;
- (id)stages;
- (int64_t)status;
- (void)addStage:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)setContinueWhenSyncDisabled:(BOOL)a3;
- (void)setIgnoreCloudKitOperationDelay:(BOOL)a3;
- (void)setOperationGroup:(id)a3;
- (void)setPipelineCompletionHandler:(id)a3;
@end

@implementation HDCloudSyncPipeline

- (id)initForContext:(id)a3 repository:(id)a4 accessibilityAssertion:(id)a5 queue:(id)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v11 = a4;
  id v55 = a5;
  id v54 = a6;
  v61.receiver = self;
  v61.super_class = (Class)HDCloudSyncPipeline;
  v12 = [(HDCloudSyncPipeline *)&v61 init];
  if (v12)
  {
    if (!v11)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      [v52 handleFailureInMethod:a2, v12, @"HDCloudSyncPipeline.m", 78, @"Invalid parameter not satisfying: %@", @"repository" object file lineNumber description];
    }
    v12->_status = 0;
    uint64_t v13 = [v56 copy];
    context = v12->_context;
    v12->_context = (HDCloudSyncContext *)v13;

    objc_storeStrong((id *)&v12->_repository, a4);
    objc_storeStrong((id *)&v12->_queue, a6);
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v15;

    v17 = [(NSUUID *)v12->_identifier UUIDString];
    uint64_t v18 = [v17 substringToIndex:4];
    shortPipelineIdentifier = v12->_shortPipelineIdentifier;
    v12->_shortPipelineIdentifier = (NSString *)v18;

    v12->_pipelineResult = 1;
    v20 = [(HDCloudSyncRepository *)v12->_repository profile];
    v21 = [v20 database];
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    if (v55)
    {
      uint64_t v60 = 0;
      uint64_t v24 = [v21 cloneAccessibilityAssertion:v55 ownerIdentifier:v23 error:&v60];
      v25 = (id *)&v60;
    }
    else
    {
      uint64_t v59 = 0;
      uint64_t v24 = [v21 takeAccessibilityAssertionWithOwnerIdentifier:v23 timeout:&v59 error:600.0];
      v25 = (id *)&v59;
    }
    id v53 = *v25;
    accessibilityAssertion = v12->_accessibilityAssertion;
    v12->_accessibilityAssertion = (HDAssertion *)v24;

    if (!v12->_accessibilityAssertion)
    {
      _HKInitializeLogging();
      v27 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138543874;
        *(void *)&location[4] = v11;
        __int16 v63 = 2114;
        v64 = v12;
        __int16 v65 = 2114;
        id v66 = v53;
        _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "%{public}@: Failed to acquire database accessibility assertion for cloud sync in repo: %{public}@, with error: %{public}@", location, 0x20u);
      }
    }
    objc_initWeak((id *)location, v12);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __78__HDCloudSyncPipeline_initForContext_repository_accessibilityAssertion_queue___block_invoke;
    v57[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v58, (id *)location);
    uint64_t v28 = +[HDPowerAssertion powerAssertionWithIdentifier:@"Health Sync" timeout:v57 timeoutHandler:600.0];
    powerAssertion = v12->_powerAssertion;
    v12->_powerAssertion = (HDPowerAssertion *)v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stages = v12->_stages;
    v12->_stages = v30;

    id v32 = objc_alloc(MEMORY[0x1E4F65CC8]);
    v33 = [(NSUUID *)v12->_identifier UUIDString];
    uint64_t v34 = [v32 initWithAssertionIdentifier:@"HDCloudSyncDownloadDirectoryAssertionIdentifier" ownerIdentifier:v33];
    inProgressDownloadDirAssertion = v12->_inProgressDownloadDirAssertion;
    v12->_inProgressDownloadDirAssertion = (HDAssertion *)v34;

    v36 = [v11 profile];
    v37 = [v36 cloudSyncManager];
    v38 = [v37 assetDownloadStagingManagerWithAssertion:v12->_inProgressDownloadDirAssertion];

    v39 = [v11 syncCircleIdentifier];
    uint64_t v40 = +[HDCloudSyncPipeline operationGroupForContext:v56 syncCircleIdentifier:v39 assetDownloadStagingManager:v38];
    operationGroup = v12->_operationGroup;
    v12->_operationGroup = (CKOperationGroup *)v40;

    v42 = [HDCloudSyncOperationConfiguration alloc];
    v43 = v12->_operationGroup;
    v44 = [v11 syncCircleIdentifier];
    v45 = v12->_accessibilityAssertion;
    v46 = v12->_identifier;
    v47 = objc_msgSend(v56, "unitTest_syncDateOverride");
    v48 = v47;
    if (!v47)
    {
      v48 = [MEMORY[0x1E4F1C9C8] date];
    }
    uint64_t v49 = [(HDCloudSyncOperationConfiguration *)v42 initWithRepository:v11 operationGroup:v43 syncContainerPrefix:v44 context:v56 accessibilityAssertion:v45 syncIdentifier:v46 syncDate:v48];
    operationConfiguration = v12->_operationConfiguration;
    v12->_operationConfiguration = (HDCloudSyncOperationConfiguration *)v49;

    if (!v47) {
    objc_destroyWeak(&v58);
    }
    objc_destroyWeak((id *)location);
  }
  return v12;
}

void __78__HDCloudSyncPipeline_initForContext_repository_accessibilityAssertion_queue___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    v1 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1BCB7D000, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: Power assertion has expired.", buf, 0xCu);
    }
  }
}

- (void)dealloc
{
  [(HDPowerAssertion *)self->_powerAssertion invalidate];
  [(HDAssertion *)self->_accessibilityAssertion invalidate];
  [(HDAssertion *)self->_inProgressDownloadDirAssertion invalidate];
  cloudKitOperationDelayTimer = self->_cloudKitOperationDelayTimer;
  if (cloudKitOperationDelayTimer)
  {
    dispatch_source_cancel(cloudKitOperationDelayTimer);
    id v4 = self->_cloudKitOperationDelayTimer;
    self->_cloudKitOperationDelayTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)HDCloudSyncPipeline;
  [(HDCloudSyncPipeline *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  shortPipelineIdentifier = self->_shortPipelineIdentifier;
  uint64_t v5 = [(HDCloudSyncOperationConfiguration *)self->_operationConfiguration shortSyncIdentifier];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"    ";
  }
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [(HDCloudSyncContext *)self->_context reason];
  v10 = HKCloudSyncReasonToString();
  id v11 = HDCloudSyncOperationStatusToString(self->_status);
  v12 = [v3 stringWithFormat:@"<[%@:%@] %@ (%@) %@>", shortPipelineIdentifier, v7, v9, v10, v11];

  return v12;
}

- (id)analyticsDictionary
{
  v37[13] = *MEMORY[0x1E4F143B8];
  v36[0] = @"syncIdentifier";
  v35 = [(HDCloudSyncOperationConfiguration *)self->_operationConfiguration syncIdentifier];
  uint64_t v34 = [v35 UUIDString];
  v37[0] = v34;
  v36[1] = @"pipelineIdentifier";
  v33 = [(NSUUID *)self->_identifier UUIDString];
  v37[1] = v33;
  v36[2] = @"syncCircleIdentifier";
  id v32 = [(HDCloudSyncRepository *)self->_repository syncCircleIdentifier];
  v37[2] = v32;
  v36[3] = @"primaryContainerIdentifier";
  v31 = [(HDCloudSyncRepository *)self->_repository primaryCKContainer];
  uint64_t v3 = [v31 containerIdentifier];
  analyticsCloudKitIdentifier = &stru_1F1728D60;
  if (self->_analyticsCloudKitIdentifier) {
    analyticsCloudKitIdentifier = (__CFString *)self->_analyticsCloudKitIdentifier;
  }
  v30 = (void *)v3;
  v37[3] = v3;
  v37[4] = analyticsCloudKitIdentifier;
  v36[4] = @"cloudKitIdentifier";
  v36[5] = @"reason";
  v29 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDCloudSyncContext reason](self->_context, "reason"));
  v37[5] = v29;
  v36[6] = @"options";
  uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HDCloudSyncContext options](self->_context, "options"));
  v37[6] = v28;
  v36[7] = @"operationType";
  v27 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDCloudSyncContext purpose](self->_context, "purpose"));
  v37[7] = v27;
  v36[8] = @"purpose";
  v26 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDCloudSyncContext purpose](self->_context, "purpose"));
  v37[8] = v26;
  v36[9] = @"duration";
  uint64_t v5 = NSNumber;
  int64_t status = self->_status;
  if ((unint64_t)(status - 2) >= 2)
  {
    double v8 = 0.0;
    if (status != 1) {
      goto LABEL_8;
    }
    double Current = CFAbsoluteTimeGetCurrent();
  }
  else
  {
    double Current = self->_endTime;
  }
  double v8 = Current - self->_startTime;
LABEL_8:
  v25 = [v5 numberWithDouble:v8];
  v37[9] = v25;
  v36[10] = @"changesPullOperationCount";
  v9 = NSNumber;
  uint64_t v24 = [(HDCloudSyncPipeline *)self operationConfiguration];
  v10 = [v24 computedState];
  id v11 = [v10 pullTargets];
  v12 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v37[10] = v12;
  v36[11] = @"changesPushOperationCount";
  uint64_t v13 = NSNumber;
  v14 = [(HDCloudSyncPipeline *)self operationConfiguration];
  uint64_t v15 = [v14 computedState];
  v16 = [v15 pushTargets];
  v17 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  v37[11] = v17;
  v36[12] = @"changesRebaseCount";
  uint64_t v18 = NSNumber;
  v19 = [(HDCloudSyncPipeline *)self operationConfiguration];
  v20 = [v19 computedState];
  v21 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v20, "countOfRebaselineOperations"));
  v37[12] = v21;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:13];

  return v23;
}

- (void)addStage:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (self->_status)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDCloudSyncPipeline.m", 189, @"Invalid parameter not satisfying: %@", @"_status == HDCloudSyncOperationStatusPending" object file lineNumber description];

    id v5 = v7;
  }
  [(NSMutableArray *)self->_stages addObject:v5];
}

- (id)beginWithTaskTree:(id)a3
{
  id v5 = a3;
  if (self->_status)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDCloudSyncPipeline.m", 196, @"Invalid parameter not satisfying: %@", @"_status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  self->_int64_t status = 1;
  uint64_t v6 = [(NSMutableArray *)self->_stages count];
  id v7 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100 * v6 + 15];
  progress = self->_progress;
  self->_progress = v7;

  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke;
  v13[3] = &unk_1E62F7618;
  v13[4] = self;
  [v5 addTaskOnQueue:queue task:v13];
  v10 = self->_progress;

  return v10;
}

void __41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 72) = CFAbsoluteTimeGetCurrent();
  id v53 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "hk_map:", &__block_literal_global_89);
  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 8);
    v10 = v7;
    uint64_t v11 = [v9 count];
    v12 = [*(id *)(*(void *)(a1 + 32) + 128) profile];
    uint64_t v13 = [v12 profileIdentifier];
    [v53 componentsJoinedByString:@", "];
    uint64_t v15 = v14 = v5;
    [*(id *)(a1 + 32) accessibilityAssertion];
    v17 = uint64_t v16 = a1;
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2114;
    __int16 v65 = v13;
    *(_WORD *)id v66 = 2114;
    *(void *)&v66[2] = v15;
    __int16 v67 = 2114;
    v68 = v17;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting %ld-stage pipeline for %{public}@: %{public}@ with assertion: %{public}@", buf, 0x34u);

    a1 = v16;
    id v5 = v14;
  }
  uint64_t v18 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v18 + 104))
  {
    v51 = v6;
  }
  else
  {
    v19 = [*(id *)(v18 + 128) profile];
    v20 = [v19 cloudSyncManager];
    id v57 = 0;
    char v21 = [v20 canPerformCloudSyncWithError:&v57];
    id v22 = v57;

    if ((v21 & 1) == 0)
    {
      v6[2](v6, 2, v22);

      goto LABEL_18;
    }
    v51 = v6;

    uint64_t v18 = *(void *)(a1 + 32);
  }
  uint64_t v23 = *(void *)(v18 + 144);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __63__HDCloudSyncPipeline__queue_computeConfigurationWithTaskTree___block_invoke;
  __int16 v65 = &unk_1E62F7618;
  *(void *)id v66 = v18;
  id v24 = v5;
  [v24 addTaskOnQueue:v23 task:buf];
  uint64_t v25 = *(void *)(v18 + 144);
  *(void *)&long long v58 = MEMORY[0x1E4F143A8];
  *((void *)&v58 + 1) = 3221225472;
  *(void *)&long long v59 = __63__HDCloudSyncPipeline__queue_computeConfigurationWithTaskTree___block_invoke_3;
  *((void *)&v59 + 1) = &unk_1E62F7618;
  *(void *)&long long v60 = v18;
  [v24 addTaskOnQueue:v25 task:&v58];

  uint64_t v26 = *(void *)(a1 + 32);
  uint64_t v27 = *(void *)(v26 + 144);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke_367;
  v56[3] = &unk_1E62FF3E8;
  v56[4] = v26;
  [v24 addCheckpointTaskOnQueue:v27 task:v56];
  uint64_t v28 = *(void *)(a1 + 32);
  id v52 = v5;
  uint64_t v49 = v24;
  uint64_t v50 = a1;
  if (v28)
  {
    v29 = *(NSObject **)(v28 + 144);
    id v30 = v24;
    dispatch_assert_queue_V2(v29);
    uint64_t v31 = *(void *)(v28 + 144);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __72__HDCloudSyncPipeline__queue_waitForCloudKitOperationDelayWithTaskTree___block_invoke;
    __int16 v65 = &unk_1E62F7618;
    *(void *)id v66 = v28;
    [v30 addTaskOnQueue:v31 task:buf];

    uint64_t v32 = *(void *)(a1 + 32);
    id v33 = v30;
    if (v32)
    {
      uint64_t v34 = v33;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v32 + 144));
      long long v61 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v58 = 0u;
      id obj = *(id *)(v32 + 8);
      uint64_t v35 = [obj countByEnumeratingWithState:&v58 objects:buf count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v59 != v37) {
              objc_enumerationMutation(obj);
            }
            id v39 = *(id *)(*((void *)&v58 + 1) + 8 * i);
            uint64_t v40 = *(NSObject **)(v32 + 144);
            id v41 = v34;
            dispatch_assert_queue_V2(v40);
            uint64_t v42 = *(void *)(v32 + 144);
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __48__HDCloudSyncPipeline__queue_runStage_taskTree___block_invoke;
            v62[3] = &unk_1E62F7640;
            v62[4] = v32;
            id v43 = v39;
            id v63 = v43;
            [v41 addTaskOnQueue:v42 task:v62];
          }
          uint64_t v36 = [obj countByEnumeratingWithState:&v58 objects:buf count:16];
        }
        while (v36);
      }
    }
  }
  else
  {
    id v48 = v24;
  }

  uint64_t v44 = *(void *)(v50 + 32);
  uint64_t v45 = *(void *)(v44 + 144);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __63__HDCloudSyncPipeline__queue_reportFinalAnalyticsWithTaskTree___block_invoke;
  __int16 v65 = &unk_1E62FF3E8;
  *(void *)id v66 = v44;
  [v49 addCheckpointTaskOnQueue:v45 task:buf];
  uint64_t v46 = *(void *)(v50 + 32);
  uint64_t v47 = *(void *)(v46 + 144);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke_369;
  v55[3] = &unk_1E62FF3E8;
  v55[4] = v46;
  [v49 addCheckpointTaskOnQueue:v47 task:v55];
  uint64_t v6 = v51;
  v51[2](v51, 0, 0);
  id v5 = v52;
LABEL_18:
}

NSString *__41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke_2()
{
  v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

uint64_t __41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke_367(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished computing configuration and beginning pipeline stages", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(a1 + 32) + 176) setCompletedUnitCount:10];
}

void __41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke_369(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 176), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 176), "totalUnitCount"));
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 80) = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 56);
  if (v5)
  {
    if (v5 == 1)
    {
      *(void *)(v4 + 112) = 2;
      _HKInitializeLogging();
      uint64_t v6 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v31 = 138543362;
        uint64_t v32 = v7;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Pipeline finished.", (uint8_t *)&v31, 0xCu);
      }
      if (+[HDCloudSyncPipeline _shouldIncrementCountForSyncAnalyticsForContext:]((uint64_t)HDCloudSyncPipeline, *(void **)(*(void *)(a1 + 32) + 120))&& *(void *)(a1 + 32))
      {
        os_unfair_lock_lock((os_unfair_lock_t)&_syncCountLock);
        uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        v9 = [v8 dictionaryForKey:@"HDCloudSyncCountDictionary"];

        if (v9) {
          [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v9];
        }
        else {
        uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        uint64_t v16 = [v15 valueForKey:@"HDCloudSyncCountOfSuccessfulSyncs"];
        v17 = v16;
        if (v16)
        {
          uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "intValue") + 1);
          [v15 setValue:v18 forKey:@"HDCloudSyncCountOfSuccessfulSyncs"];
        }
        else
        {
          [v15 setValue:&unk_1F17ECB10 forKey:@"HDCloudSyncCountOfSuccessfulSyncs"];
        }
        v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        v20 = (void *)[v15 copy];
        [v19 setValue:v20 forKey:@"HDCloudSyncCountDictionary"];

        os_unfair_lock_unlock((os_unfair_lock_t)&_syncCountLock);
      }
    }
  }
  else
  {
    *(void *)(v4 + 112) = 3;
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      v12 = v10;
      uint64_t v13 = [v3 allErrors];
      id v14 = [v13 firstObject];
      int v31 = 138543618;
      uint64_t v32 = v11;
      __int16 v33 = 2114;
      uint64_t v34 = v14;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Pipeline failed: %{public}@.", (uint8_t *)&v31, 0x16u);
    }
  }
  if (+[HDCloudSyncPipeline _shouldIncrementCountForSyncAnalyticsForContext:]((uint64_t)HDCloudSyncPipeline, *(void **)(*(void *)(a1 + 32) + 120)))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_syncCountLock);
    char v21 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v22 = [v21 dictionaryForKey:@"HDCloudSyncCountDictionary"];

    if (v22) {
      [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v22];
    }
    else {
    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v24 = [v23 valueForKey:@"HDCloudSyncCountOfTotalSyncs"];
    uint64_t v25 = v24;
    if (v24)
    {
      uint64_t v26 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v24, "intValue") + 1);
      [v23 setValue:v26 forKey:@"HDCloudSyncCountOfTotalSyncs"];
    }
    else
    {
      [v23 setValue:&unk_1F17ECB10 forKey:@"HDCloudSyncCountOfTotalSyncs"];
    }
    uint64_t v27 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v28 = (void *)[v23 copy];
    [v27 setValue:v28 forKey:@"HDCloudSyncCountDictionary"];

    os_unfair_lock_unlock((os_unfair_lock_t)&_syncCountLock);
  }
  [*(id *)(*(void *)(a1 + 32) + 88) invalidate];
  uint64_t v29 = *(void *)(a1 + 32);
  id v30 = *(void **)(v29 + 88);
  *(void *)(v29 + 88) = 0;
}

+ (uint64_t)_shouldIncrementCountForSyncAnalyticsForContext:(uint64_t)a1
{
  id v2 = a2;
  self;
  unint64_t v3 = [v2 reason];

  return (v3 > 0x1F) | (0x7FFFFFD7u >> v3) & 1;
}

- (id)beginWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F65CD8]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __43__HDCloudSyncPipeline_beginWithCompletion___block_invoke;
  uint64_t v13 = &unk_1E62FF410;
  id v14 = self;
  id v15 = v4;
  id v6 = v4;
  uint64_t v7 = (void *)[v5 initWithDescription:@"Sync pipeline" completion:&v10];
  uint64_t v8 = -[HDCloudSyncPipeline beginWithTaskTree:](self, "beginWithTaskTree:", v7, v10, v11, v12, v13, v14);
  [v7 begin];

  return v8;
}

uint64_t __43__HDCloudSyncPipeline_beginWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 48), *(void *)(*(void *)(a1 + 32) + 56));
}

- (void)cancel
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__HDCloudSyncPipeline_cancel__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __29__HDCloudSyncPipeline_cancel__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138543362;
    uint64_t v12 = v10;
    _os_log_error_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_ERROR, "%{public}@: Pipeline cancellation requested.", (uint8_t *)&v11, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  [*(id *)(*(void *)(a1 + 32) + 168) cancelAllOperations];
  unint64_t v3 = (void (**)(void *, uint64_t, void *))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  if (v3)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 728, @"Pipeline cancelled while waiting for CloudKit operation delay.");
    v3[2](v3, 2, v6);
  }
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (v7)
  {
    dispatch_source_cancel(v7);
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = 0;
  }
}

void __63__HDCloudSyncPipeline__queue_computeConfigurationWithTaskTree___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(*(void *)(a1 + 32) + 128);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HDCloudSyncPipeline__queue_computeConfigurationWithTaskTree___block_invoke_2;
  v7[3] = &unk_1E62F29A0;
  id v8 = v4;
  id v6 = v4;
  [v5 cacheAllOwnerIdentifiersWithCompletion:v7];
}

uint64_t __63__HDCloudSyncPipeline__queue_computeConfigurationWithTaskTree___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__HDCloudSyncPipeline__queue_computeConfigurationWithTaskTree___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 144));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = *(id *)(v4 + 8);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v12 = [*(id *)(v4 + 160) expectedSendSize];
          uint64_t v13 = [v11 expectedSendSize];
          if (v12 <= v13) {
            uint64_t v14 = v13;
          }
          else {
            uint64_t v14 = v12;
          }
          [*(id *)(v4 + 160) setExpectedSendSize:v14];
          uint64_t v15 = [*(id *)(v4 + 160) expectedReceiveSize];
          uint64_t v16 = [v11 expectedReceiveSize];
          if (v15 <= v16) {
            uint64_t v17 = v16;
          }
          else {
            uint64_t v17 = v15;
          }
          [*(id *)(v4 + 160) setExpectedReceiveSize:v17];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v8);
    }
  }
  uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 128);
  v19 = [v18 primaryCKContainer];
  id v26 = [v18 cachedOwnerIdentifierForContainer:v19];

  uint64_t v20 = [v26 cloudKitIdentifier];
  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = *(void **)(v21 + 64);
  *(void *)(v21 + 64) = v20;

  uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 128) profile];
  id v24 = [v23 daemon];
  uint64_t v25 = [v24 analyticsSubmissionCoordinator];
  objc_msgSend(v25, "cloudSync_reportPipelineStarted:", *(void *)(a1 + 32));

  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

void __63__HDCloudSyncPipeline__queue_reportFinalAnalyticsWithTaskTree___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v45 = v3;
  if (*(void *)(v4 + 56) == 1)
  {
    id v5 = [*(id *)(v4 + 128) profile];
    id v6 = [v5 daemon];
    uint64_t v7 = [v6 analyticsSubmissionCoordinator];
    objc_msgSend(v7, "cloudSync_reportPipelineFinished:", *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v8 = [v3 allErrors];
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = objc_msgSend(v9, "hd_errorSurfacingFatalCloudKitPartialFailureForAnalytics");
    int v11 = v10;
    if (v10)
    {
      id v5 = v10;
    }
    else
    {
      uint64_t v12 = [v45 allErrors];
      id v5 = [v12 firstObject];
    }
    id v6 = [*(id *)(*(void *)(a1 + 32) + 128) profile];
    uint64_t v7 = [v6 daemon];
    uint64_t v13 = [v7 analyticsSubmissionCoordinator];
    objc_msgSend(v13, "cloudSync_reportPipelineFailed:error:", *(void *)(a1 + 32), v5);
  }
  uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 128) profile];
  uint64_t v15 = [v14 daemon];
  uint64_t v16 = [v15 analyticsSubmissionCoordinator];
  uint64_t v17 = *(void **)(a1 + 32);
  uint64_t v18 = [v17 operationConfiguration];
  v19 = [v18 cachedCloudState];
  objc_msgSend(v16, "cloudCache_reportCacheSyncAnalyticsForPipeline:operationCount:", v17, objc_msgSend(v19, "operationCountForAnalytics"));

  uint64_t v44 = [*(id *)(*(void *)(a1 + 32) + 128) profile];
  id v43 = [v44 daemon];
  uint64_t v20 = [v43 analyticsSubmissionCoordinator];
  uint64_t v21 = *(void **)(a1 + 32);
  uint64_t v42 = [v21 operationConfiguration];
  id v41 = [v42 cachedCloudState];
  uint64_t v39 = [v41 changedZonesCount];
  uint64_t v40 = [*(id *)(a1 + 32) operationConfiguration];
  id v22 = [v40 cachedCloudState];
  uint64_t v23 = [v22 deletedZonesCount];
  id v24 = [*(id *)(a1 + 32) operationConfiguration];
  uint64_t v25 = [v24 cachedCloudState];
  uint64_t v26 = [v25 changedRecordsCount];
  long long v27 = [*(id *)(a1 + 32) operationConfiguration];
  long long v28 = [v27 cachedCloudState];
  objc_msgSend(v20, "cloudCache_reportCacheFetchAndUpdateAnalyticsForPipeline:changedZonesCount:deletedZonesCount:changedRecordsCount:deletedRecordsCount:", v21, v39, v23, v26, objc_msgSend(v28, "deletedRecordsCount"));

  [*(id *)(*(void *)(a1 + 32) + 152) invalidate];
  uint64_t v29 = *(void *)(a1 + 32);
  long long v30 = *(void **)(v29 + 152);
  *(void *)(v29 + 152) = 0;

  int v31 = (void (**)(void *, uint64_t, uint64_t, void *))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 184));
  uint64_t v32 = *(void *)(a1 + 32);
  __int16 v33 = *(void **)(v32 + 184);
  *(void *)(v32 + 184) = 0;

  if (v31)
  {
    uint64_t v34 = *(void *)(a1 + 32);
    uint64_t v35 = *(void *)(v34 + 48);
    uint64_t v36 = *(void *)(v34 + 56);
    uint64_t v37 = [v45 allErrors];
    v38 = [v37 firstObject];
    v31[2](v31, v35, v36, v38);
  }
}

void __48__HDCloudSyncPipeline__queue_runStage_taskTree___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 24))
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 728, @"Pipeline canceled.");
    v4[2](v4, 2, v6);
  }
  else
  {
    uint64_t v7 = [*(id *)(v5 + 8) indexOfObject:*(void *)(a1 + 40)] + 1;
    _HKInitializeLogging();
    uint64_t v8 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v9;
      __int16 v27 = 2048;
      uint64_t v28 = v7;
      __int16 v29 = 2114;
      uint64_t v30 = v10;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Stage %ld: %{public}@: Starting...", buf, 0x20u);
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __48__HDCloudSyncPipeline__queue_runStage_taskTree___block_invoke_384;
    v22[3] = &unk_1E62FF438;
    v22[4] = *(void *)(a1 + 32);
    uint64_t v24 = v7;
    int v11 = v4;
    uint64_t v23 = v11;
    [*(id *)(a1 + 40) setOnSuccess:v22];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __48__HDCloudSyncPipeline__queue_runStage_taskTree___block_invoke_386;
    uint64_t v18 = &unk_1E62FF460;
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v21 = v7;
    uint64_t v20 = v11;
    [*(id *)(a1 + 40) setOnError:&v15];
    objc_msgSend(*(id *)(a1 + 40), "setCloudState:", *(void *)(*(void *)(a1 + 32) + 48), v15, v16, v17, v18, v19);
    [*(id *)(a1 + 40) start];
    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 176);
    uint64_t v14 = [v12 progress];
    [v13 addChild:v14 withPendingUnitCount:100];
  }
}

void __48__HDCloudSyncPipeline__queue_runStage_taskTree___block_invoke_384(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[6];
    int v10 = 138543874;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Stage %ld: %{public}@: Finished successfully.", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v7 = [v3 cloudState];
  uint64_t v8 = a1[4];
  uint64_t v9 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = v7;

  (*(void (**)(void))(a1[5] + 16))();
}

void __48__HDCloudSyncPipeline__queue_runStage_taskTree___block_invoke_386(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_msgSend(v6, "hd_cloudKitRetryDelay");
  if (v7 > 0.0)
  {
    double v8 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) repository];
    int v10 = [v9 profile];
    uint64_t v11 = [v10 daemon];
    __int16 v12 = [v11 cloudSyncCoordinator];
    [v12 delayNextCloudKitOperation:v8];
  }
  if (!objc_msgSend(v6, "hk_isHealthKitErrorWithCode:", 701))
  {
    _HKInitializeLogging();
    uint64_t v19 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 48);
      int v27 = 138544130;
      uint64_t v28 = v20;
      __int16 v29 = 2048;
      uint64_t v30 = v21;
      __int16 v31 = 2114;
      id v32 = v5;
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Stage %ld: %{public}@: Finished with error: %{public}@", (uint8_t *)&v27, 0x2Au);
    }
    *(void *)(*(void *)(a1 + 32) + 56) = 0;
    uint64_t v22 = *(void *)(a1 + 40);
    [v5 criticalFailureOnError];
    uint64_t v18 = *(void (**)(void))(v22 + 16);
    goto LABEL_11;
  }
  int v13 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 104);
  _HKInitializeLogging();
  __int16 v14 = *MEMORY[0x1E4F29FA8];
  BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 48);
      int v27 = 138543874;
      uint64_t v28 = v16;
      __int16 v29 = 2048;
      uint64_t v30 = v17;
      __int16 v31 = 2114;
      id v32 = v5;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Stage %ld: %{public}@: Detected cloud sync disabled but pipeline is configured to continue anyway.", (uint8_t *)&v27, 0x20u);
    }
    uint64_t v18 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_11:
    v18();
    goto LABEL_12;
  }
  if (v15)
  {
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 48);
    int v27 = 138543874;
    uint64_t v28 = v23;
    __int16 v29 = 2048;
    uint64_t v30 = v24;
    __int16 v31 = 2114;
    id v32 = v5;
    _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Stage %ld: %{public}@: Detected cloud sync disabled; disabling locally and failing pipeline.",
      (uint8_t *)&v27,
      0x20u);
  }
  *(void *)(*(void *)(a1 + 32) + 56) = 0;
  uint64_t v25 = *(void *)(a1 + 40);
  uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 701, @"Sync has been disabled for this account.");
  (*(void (**)(uint64_t, uint64_t, void *))(v25 + 16))(v25, 2, v26);

LABEL_12:
}

void __72__HDCloudSyncPipeline__queue_waitForCloudKitOperationDelayWithTaskTree___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 128) profile];
  id v6 = [v5 daemon];
  double v7 = [v6 cloudSyncCoordinator];
  [v7 nextCloudKitOperationDelay];
  double v9 = v8;

  if (v9 <= 0.0)
  {
LABEL_5:
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    goto LABEL_6;
  }
  int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 105);
  _HKInitializeLogging();
  uint64_t v11 = *MEMORY[0x1E4F29FA8];
  BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v13;
      __int16 v32 = 2048;
      double v33 = v9;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %0.2lfs CloudKit operation delay because this pipeline has ignoreCloudKitOperationDelay=YES", buf, 0x16u);
    }
    goto LABEL_5;
  }
  if (v12)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v14;
    __int16 v32 = 2048;
    double v33 = v9;
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Waiting %0.2lfs for the CloudKit operation delay before beginning pipeline.", buf, 0x16u);
  }
  BOOL v15 = *(void **)(a1 + 32);
  uint64_t v16 = v15[4];
  if (v16)
  {
    dispatch_source_cancel(v16);
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void **)(v17 + 32);
    *(void *)(v17 + 32) = 0;

    BOOL v15 = *(void **)(a1 + 32);
  }
  objc_initWeak((id *)buf, v15);
  uint64_t v19 = _Block_copy(v4);
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  dispatch_source_t v22 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 144));
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t v24 = *(void **)(v23 + 32);
  *(void *)(v23 + 32) = v22;

  uint64_t v25 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  dispatch_time_t v26 = dispatch_walltime(0, (uint64_t)(v9 * 1000000000.0));
  dispatch_source_set_timer(v25, v26, 0xFFFFFFFFFFFFFFFFLL, 0);
  int v27 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __72__HDCloudSyncPipeline__queue_waitForCloudKitOperationDelayWithTaskTree___block_invoke_391;
  handler[3] = &unk_1E62F6BD0;
  objc_copyWeak(&v29, (id *)buf);
  dispatch_source_set_event_handler(v27, handler);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
LABEL_6:
}

void __72__HDCloudSyncPipeline__queue_waitForCloudKitOperationDelayWithTaskTree___block_invoke_391(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v7 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[18]);
    id v2 = _Block_copy(v7[5]);
    dispatch_queue_t v3 = v7[5];
    v7[5] = 0;

    id v4 = v7[4];
    if (v4)
    {
      dispatch_source_cancel(v4);
      dispatch_queue_t v5 = v7[4];
      void v7[4] = 0;
    }
    if (v2)
    {
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        double v9 = v7;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished waiting for CloudKit operation delay.", buf, 0xCu);
      }
      (*((void (**)(void *, void, void))v2 + 2))(v2, 0, 0);
    }

    id WeakRetained = v7;
  }
}

- (id)stages
{
  id v2 = (void *)[(NSMutableArray *)self->_stages copy];

  return v2;
}

+ (id)retrieveAndResetSyncCounts
{
  os_unfair_lock_lock((os_unfair_lock_t)&_syncCountLock);
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  dispatch_queue_t v3 = [v2 dictionaryForKey:@"HDCloudSyncCountDictionary"];

  if (v3) {
    [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
  }
  else {
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  dispatch_queue_t v5 = [v4 valueForKey:@"HDCloudSyncCountOfSuccessfulSyncs"];
  if (!v5) {
    [v4 setValue:&unk_1F17ECB28 forKey:@"HDCloudSyncCountOfSuccessfulSyncs"];
  }
  id v6 = [v4 valueForKey:@"HDCloudSyncCountOfTotalSyncs"];
  if (!v6) {
    [v4 setValue:&unk_1F17ECB28 forKey:@"HDCloudSyncCountOfTotalSyncs"];
  }
  double v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v7 setValue:0 forKey:@"HDCloudSyncCountDictionary"];

  os_unfair_lock_unlock((os_unfair_lock_t)&_syncCountLock);
  double v8 = (void *)[v4 copy];

  return v8;
}

+ (id)operationGroupForContext:(id)a3 syncCircleIdentifier:(id)a4 assetDownloadStagingManager:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v9 = (objc_class *)MEMORY[0x1E4F1A218];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  BOOL v12 = NSString;
  uint64_t v13 = HDCloudSyncContextPurposeToString([v7 purpose]);
  uint64_t v14 = [v12 stringWithFormat:@"CloudSync-%@-%@-%zd", v10, v13, objc_msgSend(v7, "reason")];

  [v11 setName:v14];
  objc_msgSend(v11, "setQuantity:", objc_msgSend(v7, "options"));
  unint64_t v15 = 1;
  [v11 setExpectedSendSize:1];
  [v11 setExpectedReceiveSize:1];
  id v16 = v7;
  self;
  if (([v16 options] & 0x400) == 0)
  {
    unint64_t v17 = [v16 reason];
    if (v17 <= 0x20) {
      unint64_t v15 = (0x4FFFFFD2uLL >> v17) & 1;
    }
    else {
      unint64_t v15 = 0;
    }
  }

  uint64_t v18 = [v11 defaultConfiguration];
  [v18 setAllowsCellularAccess:v15];

  id v19 = v16;
  self;
  unint64_t v20 = [v19 reason];

  if (v20 <= 0x20 && ((1 << v20) & 0x1B000012DLL) != 0)
  {
    uint64_t v21 = [v11 defaultConfiguration];
    [v21 setQualityOfService:17];
  }
  else
  {
    uint64_t v21 = HKCreateSerialDispatchQueueWithQOSClass();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__HDCloudSyncPipeline_operationGroupForContext_syncCircleIdentifier_assetDownloadStagingManager___block_invoke;
    block[3] = &unk_1E62F3198;
    id v29 = v11;
    uint64_t v30 = 25;
    dispatch_async_and_wait(v21, block);
  }
  dispatch_source_t v22 = [v19 xpcActivity];

  if (v22)
  {
    uint64_t v23 = [v11 defaultConfiguration];
    uint64_t v24 = [v19 xpcActivity];
    uint64_t v25 = [v24 currentActivity];
    [v23 setXPCActivity:v25];
  }
  if (v8)
  {
    dispatch_time_t v26 = [v11 defaultConfiguration];
    [v26 setAssetDownloadStagingManager:v8];
  }

  return v11;
}

void __97__HDCloudSyncPipeline_operationGroupForContext_syncCircleIdentifier_assetDownloadStagingManager___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) defaultConfiguration];
  [v2 setQualityOfService:v1];
}

- (int64_t)status
{
  return self->_status;
}

- (HDCloudSyncContext)context
{
  return self->_context;
}

- (HDCloudSyncRepository)repository
{
  return self->_repository;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HDAssertion)accessibilityAssertion
{
  return self->_accessibilityAssertion;
}

- (CKOperationGroup)operationGroup
{
  return self->_operationGroup;
}

- (void)setOperationGroup:(id)a3
{
}

- (HDCloudSyncOperationConfiguration)operationConfiguration
{
  return self->_operationConfiguration;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)continueWhenSyncDisabled
{
  return self->_continueWhenSyncDisabled;
}

- (void)setContinueWhenSyncDisabled:(BOOL)a3
{
  self->_continueWhenSyncDisabled = a3;
}

- (BOOL)ignoreCloudKitOperationDelay
{
  return self->_ignoreCloudKitOperationDelay;
}

- (void)setIgnoreCloudKitOperationDelay:(BOOL)a3
{
  self->_ignoreCloudKitOperationDelay = a3;
}

- (id)pipelineCompletionHandler
{
  return self->_pipelineCompletionHandler;
}

- (void)setPipelineCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pipelineCompletionHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_operationConfiguration, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_repository, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_inProgressDownloadDirAssertion, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_analyticsCloudKitIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudState, 0);
  objc_storeStrong(&self->_delayTimerCompletionBlock, 0);
  objc_storeStrong((id *)&self->_cloudKitOperationDelayTimer, 0);
  objc_storeStrong((id *)&self->_shortPipelineIdentifier, 0);

  objc_storeStrong((id *)&self->_stages, 0);
}

@end