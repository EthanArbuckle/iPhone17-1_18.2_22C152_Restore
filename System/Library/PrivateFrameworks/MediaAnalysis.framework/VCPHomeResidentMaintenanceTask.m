@interface VCPHomeResidentMaintenanceTask
+ (id)taskWithOptions:(id)a3 extendTimeoutBlock:(id)a4 completionHandler:(id)a5;
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (VCPHomeResidentMaintenanceTask)initWithOptions:(id)a3 extendTimeoutBlock:(id)a4 completionHandler:(id)a5;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPHomeResidentMaintenanceTask

- (VCPHomeResidentMaintenanceTask)initWithOptions:(id)a3 extendTimeoutBlock:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VCPHomeResidentMaintenanceTask;
  v12 = [(VCPHomeResidentMaintenanceTask *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_options, a3);
    v14 = _Block_copy(v10);
    id extendTimeoutBlock = v13->_extendTimeoutBlock;
    v13->_id extendTimeoutBlock = v14;

    v16 = _Block_copy(v11);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = v16;

    v13->_taskID = -1;
  }

  return v13;
}

+ (id)taskWithOptions:(id)a3 extendTimeoutBlock:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOptions:v7 extendTimeoutBlock:v8 completionHandler:v9];

  return v10;
}

- (void)dealloc
{
  v11[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v6 = [NSString stringWithFormat:@"Home resident maintenance task cancelled"];
    v11[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v8 = [v5 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v7];
    completionHandler[2](completionHandler, 0, v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)VCPHomeResidentMaintenanceTask;
  [(VCPHomeResidentMaintenanceTask *)&v9 dealloc];
}

- (float)resourceRequirement
{
  return 0.7;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
}

- (BOOL)isCanceled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_cancel);
  if (v2)
  {
    LOBYTE(cancelBlock) = 1;
  }
  else
  {
    cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
    if (cancelBlock) {
      LOBYTE(cancelBlock) = cancelBlock[2]();
    }
  }
  return (char)cancelBlock;
}

- (int)run
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = (void *)MEMORY[0x1C186D320](self, a2);
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "Running Home Resident Maintenance task", buf, 2u);
    }
  }
  *(void *)buf = 0;
  v32 = buf;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__22;
  v35 = __Block_byref_object_dispose__22;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v5 = (void *)getHMITaskServiceClass(void)::softClass;
  uint64_t v40 = getHMITaskServiceClass(void)::softClass;
  if (!getHMITaskServiceClass(void)::softClass)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = (uint64_t)___ZL22getHMITaskServiceClassv_block_invoke;
    v27 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62970F8;
    v28 = (void (*)(uint64_t))&v37;
    ___ZL22getHMITaskServiceClassv_block_invoke((uint64_t)&v24);
    v5 = (void *)v38[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v37, 8);
  id v36 = [v6 taskService];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  LODWORD(v40) = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __37__VCPHomeResidentMaintenanceTask_run__block_invoke;
  v30[3] = &unk_1E6298738;
  v30[4] = self;
  v30[5] = buf;
  v30[6] = &v37;
  id v7 = +[VCPTimer timerWithIntervalSeconds:1 isOneShot:0 andBlock:v30];
  uint64_t v24 = 0;
  uint64_t v25 = (uint64_t)&v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__22;
  v28 = __Block_byref_object_dispose__22;
  dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__VCPHomeResidentMaintenanceTask_run__block_invoke_7;
  aBlock[3] = &unk_1E6299030;
  aBlock[4] = self;
  id v8 = _Block_copy(aBlock);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __37__VCPHomeResidentMaintenanceTask_run__block_invoke_9;
  v18 = &unk_1E6299058;
  id v9 = v7;
  id v19 = v9;
  v20 = self;
  v21 = &v37;
  v22 = &v24;
  uint64_t v10 = _Block_copy(&v15);
  self->_int taskID = objc_msgSend(*((id *)v32 + 5), "submitTaskWithOptions:progressHandler:completionHandler:", self->_options, v8, v10, v15, v16, v17, v18);
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int taskID = self->_taskID;
      *(_DWORD *)v41 = 67109120;
      int v42 = taskID;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "HomeAI request submitted (%d)", v41, 8u);
    }
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v25 + 40), 0xFFFFFFFFFFFFFFFFLL);
  int v13 = *((_DWORD *)v38 + 6);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(buf, 8);

  return v13;
}

_DWORD *__37__VCPHomeResidentMaintenanceTask_run__block_invoke(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  result = (_DWORD *)a1[4];
  if (result[7] != -1)
  {
    result = (_DWORD *)[result isCanceled];
    if (result)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        unsigned __int8 v3 = VCPLogInstance();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          int v4 = *(_DWORD *)(a1[4] + 28);
          v5[0] = 67109120;
          v5[1] = v4;
          _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "Canceling Home Resident Maintenance task (%d)", (uint8_t *)v5, 8u);
        }
      }
      result = (_DWORD *)[*(id *)(*(void *)(a1[5] + 8) + 40) cancelTask:*(unsigned int *)(a1[4] + 28)];
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = -128;
    }
  }
  return result;
}

uint64_t __37__VCPHomeResidentMaintenanceTask_run__block_invoke_7(uint64_t a1, double a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    int v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134217984;
      double v7 = a2;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEBUG, "Progress %.2f", (uint8_t *)&v6, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

void __37__VCPHomeResidentMaintenanceTask_run__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) destroy];
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 8) + 16))();
  if (v5) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 code];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_extendTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end