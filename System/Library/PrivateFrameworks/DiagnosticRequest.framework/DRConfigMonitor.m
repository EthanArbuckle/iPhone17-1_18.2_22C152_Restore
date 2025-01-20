@interface DRConfigMonitor
- (BOOL)_markConfigUUID:(id)a3 isRejected:(BOOL)a4 errorOut:(id *)a5;
- (BOOL)markCompletedConfigUUID:(id)a3 errorOut:(id *)a4;
- (BOOL)rejectConfigUUID:(id)a3 errorOut:(id *)a4;
- (DRConfig)currentConfig;
- (DRConfigMonitor)initWithTeamID:(id)a3 targetQueue:(id)a4 configProcessingBlock:(id)a5;
- (NSString)teamID;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)targetQueue;
- (id)currentConfigSnapshotWithErrorOut:(id *)a3;
- (id)processingBlock;
- (void)_handleCurrentConfig:(id)a3 error:(id)a4 forceBroadcast:(BOOL)a5;
- (void)_notifyClientOfConfig:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)setCurrentConfig:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation DRConfigMonitor

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (DRConfigMonitor)initWithTeamID:(id)a3 targetQueue:(id)a4 configProcessingBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)DRConfigMonitor;
  v12 = [(DRConfigMonitor *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_teamID, a3);
    uint64_t v14 = MEMORY[0x1E0198120](v11);
    id processingBlock = v13->_processingBlock;
    v13->_id processingBlock = (id)v14;

    objc_storeStrong((id *)&v13->_targetQueue, a4);
    id v16 = [NSString stringWithFormat:@"DRConfigMonitor %@", v9];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    accessQueue = v13->_accessQueue;
    v13->_accessQueue = (OS_dispatch_queue *)v17;
  }
  return v13;
}

- (id)currentConfigSnapshotWithErrorOut:(id *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  v4 = [(DRConfigMonitor *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__DRConfigMonitor_currentConfigSnapshotWithErrorOut___block_invoke;
  v7[3] = &unk_1E6C2ACA0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_notifyClientOfConfig:(id)a3 error:(id)a4
{
  id v6 = a4;
  [(DRConfigMonitor *)self setCurrentConfig:a3];
  v7 = [(DRConfigMonitor *)self targetQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__DRConfigMonitor__notifyClientOfConfig_error___block_invoke;
  v9[3] = &unk_1E6C2AE10;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (DRConfig)currentConfig
{
  return self->_currentConfig;
}

void __47__DRConfigMonitor__notifyClientOfConfig_error___block_invoke(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) processingBlock];
  v2 = [*(id *)(a1 + 32) currentConfig];
  v3[2](v3, v2, *(void *)(a1 + 40));
}

- (void)startMonitoring
{
  id v3 = +[DRSubscriptionManager sharedInstance];
  [v3 addMonitor:self];
}

- (void)stopMonitoring
{
  id v3 = +[DRSubscriptionManager sharedInstance];
  [v3 removeMonitor:self];
}

- (void)dealloc
{
  [(DRConfigMonitor *)self stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)DRConfigMonitor;
  [(DRConfigMonitor *)&v3 dealloc];
}

- (void)_handleCurrentConfig:(id)a3 error:(id)a4 forceBroadcast:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(DRConfigMonitor *)self accessQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__DRConfigMonitor__handleCurrentConfig_error_forceBroadcast___block_invoke;
  v13[3] = &unk_1E6C2AE38;
  BOOL v16 = a5;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

void __61__DRConfigMonitor__handleCurrentConfig_error_forceBroadcast___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    v2 = DPLogHandle_ConfigMonitor();
    if (os_signpost_enabled(v2))
    {
      objc_super v3 = [*(id *)(a1 + 32) teamID];
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = [*(id *)(a1 + 40) configUUID];
      id v6 = (void *)v5;
      v7 = *(__CFString **)(a1 + 48);
      *(_DWORD *)v31 = 138544130;
      if (v5) {
        id v8 = (__CFString *)v5;
      }
      else {
        id v8 = @"None";
      }
      *(void *)&v31[4] = v3;
      if (!v7) {
        v7 = @"None";
      }
      *(_WORD *)&v31[12] = 2050;
      *(void *)&v31[14] = v4;
      *(_WORD *)&v31[22] = 2114;
      v32 = v8;
      __int16 v33 = 2114;
      v34 = v7;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ForcedNotify", "Monitor %{public}@ (%{public}p) notifying client about config %{public}@ (FORCED, error: %{public}@)", v31, 0x2Au);
    }
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    goto LABEL_25;
  }
  if (*(void *)(a1 + 48))
  {
    id v12 = DPLogHandle_ConfigMonitor();
    if (os_signpost_enabled(v12))
    {
      id v13 = [*(id *)(a1 + 32) teamID];
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(__CFString **)(a1 + 48);
      *(_DWORD *)v31 = 138543874;
      *(void *)&v31[4] = v13;
      *(_WORD *)&v31[12] = 2050;
      *(void *)&v31[14] = v14;
      *(_WORD *)&v31[22] = 2114;
      v32 = v15;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NotifyOfError", "Monitor %{public}@ (%{public}p) notifying client about error: %{public}@", v31, 0x20u);
    }
    id v9 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v10 = 0;
    goto LABEL_25;
  }
  BOOL v16 = [*(id *)(a1 + 32) currentConfig];

  if (v16)
  {
    dispatch_queue_t v17 = [*(id *)(a1 + 32) currentConfig];
    int v18 = [v17 isEqualToConfig:*(void *)(a1 + 40)];

    v19 = DPLogHandle_ConfigMonitor();
    BOOL v20 = os_signpost_enabled(v19);
    if (v18)
    {
      if (v20)
      {
        v21 = [*(id *)(a1 + 32) teamID];
        uint64_t v22 = *(void *)(a1 + 32);
        *(_DWORD *)v31 = 138543618;
        *(void *)&v31[4] = v21;
        *(_WORD *)&v31[12] = 2050;
        *(void *)&v31[14] = v22;
        v23 = "Monitor %{public}@ (%{public}p) notifying client (non-nil current vs. equal new config)";
LABEL_29:
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoNotification", v23, v31, 0x16u);

        goto LABEL_30;
      }
      goto LABEL_30;
    }
    if (v20)
    {
      v26 = [*(id *)(a1 + 32) teamID];
      uint64_t v29 = *(void *)(a1 + 32);
      *(_DWORD *)v31 = 138543618;
      *(void *)&v31[4] = v26;
      *(_WORD *)&v31[12] = 2050;
      *(void *)&v31[14] = v29;
      v28 = "Monitor %{public}@ (%{public}p) notifying client (non-nil current vs. non-equal new config)";
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 40);
    v19 = DPLogHandle_ConfigMonitor();
    BOOL v25 = os_signpost_enabled(v19);
    if (!v24)
    {
      if (v25)
      {
        v21 = [*(id *)(a1 + 32) teamID];
        uint64_t v30 = *(void *)(a1 + 32);
        *(_DWORD *)v31 = 138543618;
        *(void *)&v31[4] = v21;
        *(_WORD *)&v31[12] = 2050;
        *(void *)&v31[14] = v30;
        v23 = "Monitor %{public}@ (%{public}p) not notifying client (nil current vs. nil new config)";
        goto LABEL_29;
      }
LABEL_30:

      return;
    }
    if (v25)
    {
      v26 = [*(id *)(a1 + 32) teamID];
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)v31 = 138543618;
      *(void *)&v31[4] = v26;
      *(_WORD *)&v31[12] = 2050;
      *(void *)&v31[14] = v27;
      v28 = "Monitor %{public}@ (%{public}p) notifying client (nil current vs. non-nil new config)";
LABEL_23:
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientNotification", v28, v31, 0x16u);
    }
  }

  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = 0;
LABEL_25:
  objc_msgSend(v9, "_notifyClientOfConfig:error:", v10, v11, *(_OWORD *)v31, *(void *)&v31[16]);
}

- (BOOL)_markConfigUUID:(id)a3 isRejected:(BOOL)a4 errorOut:(id *)a5
{
  id v8 = a3;
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v9 = [(DRConfigMonitor *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__DRConfigMonitor__markConfigUUID_isRejected_errorOut___block_invoke;
  block[3] = &unk_1E6C2AE60;
  id v14 = v8;
  id v15 = self;
  BOOL v18 = a4;
  BOOL v16 = &v19;
  dispatch_queue_t v17 = a5;
  id v10 = v8;
  dispatch_sync(v9, block);

  char v11 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v11;
}

void __55__DRConfigMonitor__markConfigUUID_isRejected_errorOut___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [*(id *)(a1 + 40) currentConfig];
  uint64_t v4 = [v3 configUUID];
  LODWORD(v2) = [v2 isEqual:v4];

  if (v2) {
    [*(id *)(a1 + 40) setCurrentConfig:0];
  }
  uint64_t v5 = [*(id *)(a1 + 40) teamID];
  id v6 = *(void **)(a1 + 32);
  int v7 = *(unsigned __int8 *)(a1 + 64);
  id v10 = 0;
  char v8 = _DPCMarkConfigUUIDCompletedOrRejected(v5, v6, v7, &v10);
  id v9 = v10;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && *(void *)(a1 + 56)) {
    **(void **)(a1 + 56) = v9;
  }
}

- (BOOL)markCompletedConfigUUID:(id)a3 errorOut:(id *)a4
{
  return [(DRConfigMonitor *)self _markConfigUUID:a3 isRejected:0 errorOut:a4];
}

- (BOOL)rejectConfigUUID:(id)a3 errorOut:(id *)a4
{
  return [(DRConfigMonitor *)self _markConfigUUID:a3 isRejected:1 errorOut:a4];
}

uint64_t __53__DRConfigMonitor_currentConfigSnapshotWithErrorOut___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) currentConfig];

  return MEMORY[0x1F41817F8]();
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setCurrentConfig:(id)a3
{
}

- (id)processingBlock
{
  return self->_processingBlock;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong(&self->_processingBlock, 0);
  objc_storeStrong((id *)&self->_currentConfig, 0);

  objc_storeStrong((id *)&self->_teamID, 0);
}

@end