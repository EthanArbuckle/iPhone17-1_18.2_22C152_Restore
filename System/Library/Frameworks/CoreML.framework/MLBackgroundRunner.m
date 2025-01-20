@interface MLBackgroundRunner
- (BOOL)createExtensionDataSourceWithInfoKey:(id)a3 conformingToProtocol:(id)a4;
- (BOOL)prepareForActivity:(id)a3;
- (BOOL)shouldStop;
- (MLBackgroundRunner)init;
- (MLBackgroundTask)task;
- (NSObject)dataSource;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)watchdogQueue;
- (_DASActivity)activity;
- (unsigned)start;
- (void)setActivity:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)setTask:(id)a3;
- (void)setWatchdogQueue:(id)a3;
- (void)stop;
@end

@implementation MLBackgroundRunner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_watchdogQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_task, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWatchdogQueue:(id)a3
{
}

- (OS_dispatch_queue)watchdogQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setDataSource:(id)a3
{
}

- (NSObject)dataSource
{
  return self->_dataSource;
}

- (void)setTask:(id)a3
{
}

- (MLBackgroundTask)task
{
  return self->_task;
}

- (void)setActivity:(id)a3
{
}

- (_DASActivity)activity
{
  return self->_activity;
}

- (void)stop
{
  [(MLBackgroundRunner *)self setShouldStop:1];
  kdebug_trace();
  v3 = [(MLBackgroundRunner *)self watchdogQueue];
  v4 = +[MLBackgroundWatchdog watchdogWithTimeout:@"-taskWillEnd:" label:v3 queue:5.0];

  v5 = [(MLBackgroundRunner *)self delegateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__MLBackgroundRunner_stop__block_invoke;
  block[3] = &unk_1E59A5328;
  block[4] = self;
  dispatch_sync(v5, block);

  [v4 invalidate];
}

uint64_t __26__MLBackgroundRunner_stop__block_invoke(uint64_t a1)
{
  kdebug_trace();
  v2 = [*(id *)(a1 + 32) dataSource];
  v3 = [*(id *)(a1 + 32) task];
  v4 = (void *)[v3 copy];
  [v2 taskWillEnd:v4];

  return kdebug_trace();
}

- (unsigned)start
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v3 = [(MLBackgroundRunner *)self task];
  int v4 = [v3 isMemberOfClass:objc_opt_class()];

  if (!v4)
  {
    v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v49 = [(MLBackgroundRunner *)self task];
      LODWORD(v94) = 138412290;
      *(void *)((char *)&v94 + 4) = objc_opt_class();
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Task of unexpected type: %@", (uint8_t *)&v94, 0xCu);
    }
    goto LABEL_13;
  }
  v5 = [(MLBackgroundRunner *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
    v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v50 = [(MLBackgroundRunner *)self dataSource];
      LODWORD(v94) = 138412290;
      *(void *)((char *)&v94 + 4) = v50;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Data source (%@) for inference does not conform to MLBackgroundPredictionTask", (uint8_t *)&v94, 0xCu);
    }
LABEL_13:

    return 1;
  }
  *(void *)&long long v94 = 0;
  *((void *)&v94 + 1) = &v94;
  uint64_t v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__15560;
  v97 = __Block_byref_object_dispose__15561;
  id v98 = 0;
  v7 = (void *)MEMORY[0x19F3C29E0]();
  v8 = [(MLBackgroundRunner *)self task];
  v9 = [v8 modelURL];
  v10 = [v8 modelConfiguration];

  if (!v10)
  {
    v10 = +[MLModelConfiguration defaultConfiguration];
  }
  [v10 setAllowBackgroundGPUCompute:1];
  v11 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v10;
    _os_log_impl(&dword_19E58B000, v11, OS_LOG_TYPE_INFO, "Using model configuration: %@", buf, 0xCu);
  }

  kdebug_trace();
  uint64_t v12 = *((void *)&v94 + 1);
  id obj = *(id *)(*((void *)&v94 + 1) + 40);
  v54 = +[MLModel modelWithContentsOfURL:v9 configuration:v10 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  kdebug_trace();
  if (v54 && !*(void *)(*((void *)&v94 + 1) + 40))
  {
    int v16 = 1;
  }
  else
  {
    v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v51 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v94 + 1) + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      v91 = v51;
      _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "Error loading model from %@ (%@): %@", buf, 0x20u);
    }

    int v16 = 0;
  }

  if (v16)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v91 = __Block_byref_object_copy__15560;
    v92 = __Block_byref_object_dispose__15561;
    id v93 = 0;
    v17 = [(MLBackgroundRunner *)self watchdogQueue];
    v18 = +[MLBackgroundWatchdog watchdogWithTimeout:@"-batchProviderForTask:" label:v17 queue:1.0];

    v19 = [(MLBackgroundRunner *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__MLBackgroundRunner_start__block_invoke;
    block[3] = &unk_1E59A5300;
    block[4] = self;
    void block[5] = buf;
    dispatch_sync(v19, block);

    [v18 invalidate];
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    uint64_t v77 = 0;
    v20 = [(MLBackgroundRunner *)self watchdogQueue];
    v21 = +[MLBackgroundWatchdog watchdogWithTimeout:@"-count" label:v20 queue:1.0];

    v22 = [(MLBackgroundRunner *)self delegateQueue];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __27__MLBackgroundRunner_start__block_invoke_2;
    v73[3] = &unk_1E59A4978;
    v73[4] = &v74;
    v73[5] = buf;
    dispatch_sync(v22, v73);

    [v21 invalidate];
    v53 = [(MLBackgroundRunner *)self dataSource];
    v23 = [(MLBackgroundRunner *)self task];
    if (v75[3] >= 1)
    {
      uint64_t v25 = 0;
      *(void *)&long long v24 = 138412290;
      long long v52 = v24;
      do
      {
        if ([(MLBackgroundRunner *)self shouldStop]) {
          break;
        }
        v26 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LODWORD(v85) = 134217984;
          *(void *)((char *)&v85 + 4) = v25;
          _os_log_impl(&dword_19E58B000, v26, OS_LOG_TYPE_INFO, "Processing batch %ld", (uint8_t *)&v85, 0xCu);
        }

        *(void *)&long long v85 = 0;
        *((void *)&v85 + 1) = &v85;
        uint64_t v86 = 0x3032000000;
        v87 = __Block_byref_object_copy__15560;
        v88 = __Block_byref_object_dispose__15561;
        id v89 = 0;
        v27 = [(MLBackgroundRunner *)self watchdogQueue];
        v28 = +[MLBackgroundWatchdog watchdogWithTimeout:@"-featuresAtIndex:" label:v27 queue:2.0];

        kdebug_trace();
        v29 = [(MLBackgroundRunner *)self delegateQueue];
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __27__MLBackgroundRunner_start__block_invoke_123;
        v72[3] = &unk_1E59A49A0;
        v72[4] = &v85;
        v72[5] = buf;
        v72[6] = v25;
        dispatch_sync(v29, v72);

        kdebug_trace();
        [v28 invalidate];
        uint64_t v66 = 0;
        v67 = &v66;
        uint64_t v68 = 0x3032000000;
        v69 = __Block_byref_object_copy__15560;
        v70 = __Block_byref_object_dispose__15561;
        id v71 = 0;
        v30 = [(MLBackgroundRunner *)self watchdogQueue];
        v31 = +[MLBackgroundWatchdog watchdogWithTimeout:@"-predictionFrom*" label:v30 queue:10.0];

        v32 = [(MLBackgroundRunner *)self delegateQueue];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __27__MLBackgroundRunner_start__block_invoke_2_127;
        v60[3] = &unk_1E59A49C8;
        v63 = &v66;
        id v61 = v54;
        v64 = &v85;
        id v62 = v23;
        v65 = &v94;
        dispatch_sync(v32, v60);

        [v31 invalidate];
        if (*(void *)(*((void *)&v94 + 1) + 40))
        {
          v33 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            uint64_t v47 = *(void *)(*((void *)&v94 + 1) + 40);
            *(_DWORD *)v83 = v52;
            uint64_t v84 = v47;
            _os_log_error_impl(&dword_19E58B000, v33, OS_LOG_TYPE_ERROR, "Error executing model: %@", v83, 0xCu);
          }
        }
        if (!v67[5])
        {
          uint64_t v34 = [*(id *)(*((void *)&v94 + 1) + 40) localizedFailureReason];
          if (v34) {
            v35 = (__CFString *)v34;
          }
          else {
            v35 = @"Timeout";
          }
          v36 = [MLDictionaryFeatureProvider alloc];
          v81 = @"errorString";
          v82 = v35;
          v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
          uint64_t v38 = *((void *)&v94 + 1);
          id v59 = *(id *)(*((void *)&v94 + 1) + 40);
          uint64_t v39 = [(MLDictionaryFeatureProvider *)v36 initWithDictionary:v37 error:&v59];
          objc_storeStrong((id *)(v38 + 40), v59);
          v40 = (void *)v67[5];
          v67[5] = v39;
        }
        v41 = [MLArrayBatchProvider alloc];
        uint64_t v80 = v67[5];
        v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
        v43 = [(MLArrayBatchProvider *)v41 initWithFeatureProviderArray:v42];

        v44 = [(MLBackgroundRunner *)self watchdogQueue];
        v21 = +[MLBackgroundWatchdog watchdogWithTimeout:@"-task:processPredictionResults:error:" label:v44 queue:5.0];

        v45 = [(MLBackgroundRunner *)self delegateQueue];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __27__MLBackgroundRunner_start__block_invoke_141;
        v55[3] = &unk_1E59A49F0;
        id v56 = v53;
        v57 = self;
        v46 = v43;
        v58 = v46;
        dispatch_sync(v45, v55);

        [v21 invalidate];
        _Block_object_dispose(&v66, 8);

        _Block_object_dispose(&v85, 8);
        ++v25;
      }
      while (v25 < v75[3]);
    }

    [(MLBackgroundRunner *)self stop];
    _Block_object_dispose(&v74, 8);
    _Block_object_dispose(buf, 8);

    unsigned __int8 v14 = 0;
  }
  else
  {
    unsigned __int8 v14 = 1;
  }

  _Block_object_dispose(&v94, 8);
  return v14;
}

void __27__MLBackgroundRunner_start__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) dataSource];
  v2 = [*(id *)(a1 + 32) task];
  v3 = (void *)[v2 copy];
  uint64_t v4 = [v7 batchProviderForTask:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __27__MLBackgroundRunner_start__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __27__MLBackgroundRunner_start__block_invoke_123(void *a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1[5] + 8) + 40) featuresAtIndex:a1[6]];
  uint64_t v3 = *(void *)(a1[4] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __27__MLBackgroundRunner_start__block_invoke_2_127(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) predictionOptions];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v3 predictionFromFeatures:v2 options:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __27__MLBackgroundRunner_start__block_invoke_141(uint64_t a1)
{
  kdebug_trace();
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) task];
  uint64_t v4 = (void *)[v3 copy];
  [v2 task:v4 processPredictionResults:*(void *)(a1 + 48) error:0];

  return kdebug_trace();
}

- (BOOL)createExtensionDataSourceWithInfoKey:(id)a3 conformingToProtocol:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    v9 = [v8 infoDictionary];
    v10 = [v9 objectForKeyedSubscript:v6];

    Class v11 = NSClassFromString(v10);
    if (v11)
    {
      uint64_t v12 = v11;
      if ([(objc_class *)v11 conformsToProtocol:v7])
      {
        v13 = objc_alloc_init(v12);
        unsigned __int8 v14 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v20 = 138543618;
          v21 = v12;
          __int16 v22 = 2112;
          v23 = v13;
          _os_log_impl(&dword_19E58B000, v14, OS_LOG_TYPE_INFO, "Created data source of class %{public}@: %@", (uint8_t *)&v20, 0x16u);
        }

        [(MLBackgroundRunner *)self setDataSource:v13];
        BOOL v15 = 1;
        goto LABEL_12;
      }
      v13 = +[MLLogging coreChannel];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_11:
        BOOL v15 = 0;
LABEL_12:

        goto LABEL_13;
      }
      int v20 = 138543874;
      v21 = v6;
      __int16 v22 = 2114;
      v23 = v10;
      __int16 v24 = 2114;
      id v25 = v7;
      int v16 = "Info.plist key %{public}@ has value \"%{public}@\", but that class doesn't conform to the %{public}@ protocol";
      v17 = v13;
      uint32_t v18 = 32;
    }
    else
    {
      v13 = +[MLLogging coreChannel];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      int v20 = 138543618;
      v21 = v6;
      __int16 v22 = 2114;
      v23 = v10;
      int v16 = "Info.plist key %{public}@ has value \"%{public}@\", but no class with that name was found.";
      v17 = v13;
      uint32_t v18 = 22;
    }
    _os_log_error_impl(&dword_19E58B000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v20, v18);
    goto LABEL_11;
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)prepareForActivity:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MLBackgroundRunner *)self setActivity:v4];
  uint64_t v5 = [v4 userInfo];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"MLBackgroundTask"];

  id v12 = 0;
  id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v12];
  id v8 = v12;
  [(MLBackgroundRunner *)self setTask:v7];

  v9 = [(MLBackgroundRunner *)self task];

  if (!v9)
  {
    v10 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "Unable to de-serialize task from data: %@", buf, 0xCu);
    }
  }
  return v9 != 0;
}

- (MLBackgroundRunner)init
{
  v11.receiver = self;
  v11.super_class = (Class)MLBackgroundRunner;
  uint64_t v2 = [(MLBackgroundRunner *)&v11 init];
  if (!v2) {
    goto LABEL_3;
  }
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("CoreML Background Extension Watchdog Queue", v3);
  watchdogQueue = v2->_watchdogQueue;
  v2->_watchdogQueue = (OS_dispatch_queue *)v4;

  uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("CoreML Background Extension Queue", v6);
  delegateQueue = v2->_delegateQueue;
  v2->_delegateQueue = (OS_dispatch_queue *)v7;

  v9 = 0;
  if ([(MLBackgroundRunner *)v2 createExtensionDataSourceWithInfoKey:@"MLBackgroundDataSourceClass" conformingToProtocol:&unk_1EF14E770])
  {
LABEL_3:
    v9 = v2;
  }

  return v9;
}

@end