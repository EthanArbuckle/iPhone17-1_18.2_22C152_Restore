@interface CPLEngineResourceDownloadTask
+ (unint64_t)maximumResourceDownloadSizeForResourceType:(unint64_t)a3;
+ (void)initialize;
- (BOOL)isCancelledByEngine;
- (BOOL)willGenerateReport;
- (CPLEngineResourceDownloadTask)initWithResource:(id)a3 taskIdentifier:(id)a4 target:(id)a5 launchHandler:(id)a6 cancelHandler:(id)a7 didStartHandler:(id)a8 progressHandler:(id)a9 completionHandler:(id)a10;
- (CPLEngineTransportResourcesDownloadTask)transportTask;
- (CPLPlaceholderRecord)cloudRecord;
- (CPLRecordTarget)target;
- (CPLResource)cloudResource;
- (CPLTransportScopeMapping)transportScopeMapping;
- (NSData)transportScope;
- (NSString)transportIdentifier;
- (id)cancelHandler;
- (id)completionHandler;
- (id)didStartHandler;
- (id)launchHandler;
- (id)progressHandler;
- (unint64_t)taskIdentifierForQueue;
- (void)associateCloudResource:(id)a3 ofRecord:(id)a4;
- (void)cancelTask;
- (void)launch;
- (void)noteActiveQueuesStatusAtEnqueingTime:(id)a3;
- (void)noteStateDidProgress:(unint64_t)a3;
- (void)noteTaskHasBeenPreempted;
- (void)setCancelledByEngine:(BOOL)a3;
- (void)setTaskIdentifierForQueue:(unint64_t)a3;
- (void)setTransportIdentifier:(id)a3;
- (void)setTransportScope:(id)a3;
- (void)setTransportScopeMapping:(id)a3;
- (void)setTransportTask:(id)a3;
@end

@implementation CPLEngineResourceDownloadTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportIdentifier, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_launchHandler, 0);
  objc_destroyWeak((id *)&self->_transportTask);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_cloudRecord, 0);
  objc_storeStrong((id *)&self->_cloudResource, 0);
  objc_storeStrong((id *)&self->_activeQueuesStatusAtEnqueingTime, 0);
  objc_storeStrong((id *)&self->_stateProgressDates, 0);
}

- (void)setTransportIdentifier:(id)a3
{
}

- (NSString)transportIdentifier
{
  return self->_transportIdentifier;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (id)didStartHandler
{
  return self->_didStartHandler;
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (id)launchHandler
{
  return self->_launchHandler;
}

- (void)setTransportTask:(id)a3
{
}

- (CPLEngineTransportResourcesDownloadTask)transportTask
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transportTask);
  return (CPLEngineTransportResourcesDownloadTask *)WeakRetained;
}

- (void)setCancelledByEngine:(BOOL)a3
{
  self->_cancelledByEngine = a3;
}

- (BOOL)isCancelledByEngine
{
  return self->_cancelledByEngine;
}

- (void)setTaskIdentifierForQueue:(unint64_t)a3
{
  self->_taskIdentifierForQueue = a3;
}

- (unint64_t)taskIdentifierForQueue
{
  return self->_taskIdentifierForQueue;
}

- (void)setTransportScopeMapping:(id)a3
{
}

- (CPLTransportScopeMapping)transportScopeMapping
{
  return self->_transportScopeMapping;
}

- (CPLRecordTarget)target
{
  return self->_target;
}

- (CPLPlaceholderRecord)cloudRecord
{
  return self->_cloudRecord;
}

- (CPLResource)cloudResource
{
  return self->_cloudResource;
}

- (void)noteTaskHasBeenPreempted
{
}

- (void)noteActiveQueuesStatusAtEnqueingTime:(id)a3
{
  v4 = (NSString *)[a3 copy];
  activeQueuesStatusAtEnqueingTime = self->_activeQueuesStatusAtEnqueingTime;
  self->_activeQueuesStatusAtEnqueingTime = v4;
  MEMORY[0x1F41817F8](v4, activeQueuesStatusAtEnqueingTime);
}

- (void)noteStateDidProgress:(unint64_t)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if ([(CPLEngineResourceDownloadTask *)self willGenerateReport])
  {
    unint64_t v5 = [(NSMutableArray *)self->_stateProgressDates count];
    if (v5 >= a3)
    {
      unint64_t v6 = v5;
      v7 = [MEMORY[0x1E4F1C9C8] date];
      while (v6 <= a3)
      {
        [(NSMutableArray *)self->_stateProgressDates addObject:v7];
        ++v6;
      }
      if (a3 != 3) {
        goto LABEL_24;
      }
      v28 = [(CPLResourceTransferTask *)self resource];
      v8 = (void *)[@"[launch]" mutableCopy];
      v9 = [(NSMutableArray *)self->_stateProgressDates objectAtIndexedSubscript:0];
      for (uint64_t i = 0; i != 3; ++i)
      {
        v11 = v9;
        v9 = [(NSMutableArray *)self->_stateProgressDates objectAtIndexedSubscript:i + 1];
        [v9 timeIntervalSinceDate:v11];
        [v8 appendFormat:@"-( %.1fs)-[%@]", v12, off_1E60A7F78[i]];
      }
      v13 = (void *)MEMORY[0x1E4F28B68];
      v14 = [v28 identity];
      uint64_t v15 = objc_msgSend(v13, "stringFromByteCount:countStyle:", objc_msgSend(v14, "fileSize"), 1);

      v16 = +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", [v28 resourceType]);
      v17 = [(NSMutableArray *)self->_stateProgressDates objectAtIndexedSubscript:0];
      v27 = +[CPLDateFormatter stringFromDate:v17];

      if (self->_preemptingCount) {
        v18 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"\n- Preempted %lu times", self->_preemptingCount);
      }
      else {
        v18 = &stru_1F0D5F858;
      }
      if (self->_activeQueuesStatusAtEnqueingTime) {
        v19 = (__CFString *)[[NSString alloc] initWithFormat:@"\n- Competing tasks when enqueued:\n%@", self->_activeQueuesStatusAtEnqueingTime];
      }
      else {
        v19 = &stru_1F0D5F858;
      }
      v20 = (void *)v15;
      if (self->_transportIdentifier)
      {
        if (!_CPLSilentLogging)
        {
          v21 = __CPLProgressOSLogDomain();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            [v28 itemScopedIdentifier];
            v22 = v18;
            v24 = v23 = v16;
            transportIdentifier = self->_transportIdentifier;
            *(_DWORD *)buf = 138414082;
            v30 = v23;
            __int16 v31 = 2112;
            uint64_t v32 = v15;
            __int16 v33 = 2112;
            v34 = v24;
            __int16 v35 = 2112;
            v36 = v8;
            __int16 v37 = 2112;
            v38 = v27;
            __int16 v39 = 2112;
            v40 = (__CFString *)transportIdentifier;
            __int16 v41 = 2112;
            v42 = v19;
            __int16 v43 = 2112;
            v44 = v22;
            _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEFAULT, "[%@ (%@) %@]: %@ [launch: %@] [transport ID: %@]%@%@", buf, 0x52u);

            v16 = v23;
            v18 = v22;
            v20 = (void *)v15;
          }
LABEL_22:
        }
      }
      else if (!_CPLSilentLogging)
      {
        v21 = __CPLProgressOSLogDomain();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v26 = [v28 itemScopedIdentifier];
          *(_DWORD *)buf = 138413826;
          v30 = v16;
          __int16 v31 = 2112;
          uint64_t v32 = v15;
          __int16 v33 = 2112;
          v34 = v26;
          __int16 v35 = 2112;
          v36 = v8;
          __int16 v37 = 2112;
          v38 = v27;
          __int16 v39 = 2112;
          v40 = v19;
          __int16 v41 = 2112;
          v42 = v18;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEFAULT, "[%@ (%@) %@]: %@ [launch: %@]%@%@", buf, 0x48u);
        }
        goto LABEL_22;
      }

LABEL_24:
    }
  }
}

- (BOOL)willGenerateReport
{
  return _CPLEngineResourceDownloadTaskReportStateProgress
      && [(CPLResourceTransferTask *)self isHighPriority];
}

- (void)cancelTask
{
  v3.receiver = self;
  v3.super_class = (Class)CPLEngineResourceDownloadTask;
  [(CPLResourceTransferTask *)&v3 cancelTask];
  (*((void (**)(void))self->_cancelHandler + 2))();
}

- (void)launch
{
}

- (void)associateCloudResource:(id)a3 ofRecord:(id)a4
{
  unint64_t v6 = (CPLResource *)a3;
  v7 = (CPLPlaceholderRecord *)a4;
  cloudResource = self->_cloudResource;
  self->_cloudResource = v6;
  v10 = v6;

  cloudRecord = self->_cloudRecord;
  self->_cloudRecord = v7;
}

- (void)setTransportScope:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CPLEngineResourceDownloadTask setTransportScope:]", "CPLEngineResourceDownloadTask.m", 100, "0");
}

- (NSData)transportScope
{
  transportScopeMapping = self->_transportScopeMapping;
  if (!transportScopeMapping) {
    __assert_rtn("-[CPLEngineResourceDownloadTask transportScope]", "CPLEngineResourceDownloadTask.m", 95, "_transportScopeMapping");
  }
  id v3 = [(CPLResource *)self->_cloudResource itemScopedIdentifier];
  v4 = [v3 scopeIdentifier];
  unint64_t v5 = [(CPLTransportScopeMapping *)transportScopeMapping objectForKeyedSubscript:v4];

  return (NSData *)v5;
}

- (CPLEngineResourceDownloadTask)initWithResource:(id)a3 taskIdentifier:(id)a4 target:(id)a5 launchHandler:(id)a6 cancelHandler:(id)a7 didStartHandler:(id)a8 progressHandler:(id)a9 completionHandler:(id)a10
{
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v56.receiver = self;
  v56.super_class = (Class)CPLEngineResourceDownloadTask;
  v23 = [(CPLResourceTransferTask *)&v56 initWithResource:a3 taskIdentifier:a4];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_target, a5);
    if (_CPLEngineResourceDownloadTaskReportStateProgress)
    {
      v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      stateProgressDates = v24->_stateProgressDates;
      v24->_stateProgressDates = v25;

      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke;
      v54[3] = &unk_1E60A7F08;
      id v55 = v18;
      uint64_t v27 = [v54 copy];
      id launchHandler = v24->_launchHandler;
      v24->_id launchHandler = (id)v27;

      uint64_t v29 = [v19 copy];
      id cancelHandler = v24->_cancelHandler;
      v24->_id cancelHandler = (id)v29;

      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke_2;
      v52[3] = &unk_1E60A7F08;
      id v53 = v20;
      uint64_t v31 = [v52 copy];
      id didStartHandler = v24->_didStartHandler;
      v24->_id didStartHandler = (id)v31;

      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke_3;
      v50[3] = &unk_1E60A7F30;
      id v51 = v21;
      uint64_t v33 = [v50 copy];
      id progressHandler = v24->_progressHandler;
      v24->_id progressHandler = (id)v33;

      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke_4;
      v48[3] = &unk_1E60A7F58;
      id v49 = v22;
      uint64_t v35 = [v48 copy];
      id completionHandler = v24->_completionHandler;
      v24->_id completionHandler = (id)v35;

      id v37 = v55;
    }
    else
    {
      uint64_t v38 = [v18 copy];
      id v39 = v24->_launchHandler;
      v24->_id launchHandler = (id)v38;

      uint64_t v40 = [v19 copy];
      id v41 = v24->_cancelHandler;
      v24->_id cancelHandler = (id)v40;

      uint64_t v42 = [v20 copy];
      id v43 = v24->_didStartHandler;
      v24->_id didStartHandler = (id)v42;

      uint64_t v44 = [v21 copy];
      id v45 = v24->_progressHandler;
      v24->_id progressHandler = (id)v44;

      uint64_t v46 = [v22 copy];
      id v37 = v24->_completionHandler;
      v24->_id completionHandler = (id)v46;
    }
  }
  return v24;
}

void __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 noteStateDidProgress:0];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 noteStateDidProgress:1];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, float a3)
{
  id v6 = a2;
  [v6 noteStateDidProgress:2];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id, float))(v5 + 16))(v5, v6, a3);
  }
}

void __150__CPLEngineResourceDownloadTask_initWithResource_taskIdentifier_target_launchHandler_cancelHandler_didStartHandler_progressHandler_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [v7 noteStateDidProgress:3];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

+ (unint64_t)maximumResourceDownloadSizeForResourceType:(unint64_t)a3
{
  return 10485760;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    _CPLEngineResourceDownloadTaskReportStateProgress = [v2 BOOLForKey:@"CPLReportDownloadStateProgress"];

    if (_CPLEngineResourceDownloadTaskReportStateProgress && _CPLSilentLogging == 0)
    {
      id v4 = __CPLProgressOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Will report high priority download stats", v5, 2u);
      }
    }
  }
}

@end