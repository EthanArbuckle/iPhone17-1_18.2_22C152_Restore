@interface _HDAWDPeriodicAction
- (id)lastProcessedDate;
- (void)_queue_setIntervalCounter:(uint64_t)a1;
- (void)_queue_setLastProcessedDate:(uint64_t)a1;
- (void)_queue_setLastSubmissionAttemptDate:(uint64_t)a1;
- (void)_queue_setWaitingToRun:(uint64_t)a1;
- (void)dealloc;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
@end

@implementation _HDAWDPeriodicAction

- (void)dealloc
{
  [(HDAssertion *)self->_preparedDatabaseAccessibilityAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_HDAWDPeriodicAction;
  [(_HDAWDPeriodicAction *)&v3 dealloc];
}

- (void)_queue_setWaitingToRun:(uint64_t)a1
{
  if (a1)
  {
    *(void *)(a1 + 128) = a2;
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setInteger:a2 forKey:*(void *)(a1 + 8)];
  }
}

- (void)_queue_setIntervalCounter:(uint64_t)a1
{
  if (a1)
  {
    *(void *)(a1 + 144) = a2;
    id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 setInteger:*(void *)(a1 + 144) forKey:*(void *)(a1 + 24)];
  }
}

- (void)_queue_setLastSubmissionAttemptDate:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 136), a2);
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setObject:v5 forKey:*(void *)(a1 + 16)];
  }
}

- (void)_queue_setLastProcessedDate:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 152), a2);
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setObject:*(void *)(a1 + 152) forKey:*(void *)(a1 + 32)];
  }
}

- (id)lastProcessedDate
{
  if (a1)
  {
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__100;
    v9 = __Block_byref_object_dispose__100;
    id v10 = 0;
    v1 = *(NSObject **)(a1 + 96);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41___HDAWDPeriodicAction_lastProcessedDate__block_invoke;
    v4[3] = &unk_1E62F3230;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  xpc_object_t xdict = a4;
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141C8], self->_repeatInterval);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141A8], self->_graceInterval);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  if (self->_requiresClassB) {
    xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14318], 1);
  }
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_INFO))
  {
    taskName = self->_taskName;
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = taskName;
    *(_WORD *)&buf[22] = 2112;
    v27 = v6;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ fired with activity %@", buf, 0x20u);
    BOOL v10 = self == 0;
LABEL_5:
    queue = self->_queue;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __42___HDAWDPeriodicAction__beginWaitingToRun__block_invoke;
    v27 = &unk_1E62F3208;
    v28 = self;
    dispatch_sync(queue, buf);
    goto LABEL_6;
  }
  if (self)
  {
    BOOL v10 = 0;
    goto LABEL_5;
  }
  BOOL v10 = 1;
LABEL_6:
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __59___HDAWDPeriodicAction_performPeriodicActivity_completion___block_invoke;
  v23 = &unk_1E62F69A0;
  v24 = self;
  id v25 = v7;
  id v12 = v7;
  v13 = &v20;
  v14 = v13;
  if (!v10)
  {
    v15 = self->_taskName;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __69___HDAWDPeriodicAction__doIfWaitingOnMaintenanceQueueWithCompletion___block_invoke;
    v27 = &unk_1E6301108;
    v28 = self;
    v29 = v13;
    v16 = +[HDMaintenanceOperation maintenanceOperationWithName:asynchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:asynchronousBlock:", v15, buf, v20, v21, v22, v23, v24, v25);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v18 = [WeakRetained daemon];
    v19 = [v18 maintenanceWorkCoordinator];
    [v19 enqueueMaintenanceOperation:v16];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_lastProcessedDate, 0);
  objc_storeStrong((id *)&self->_lastSubmissionAttemptDate, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_preparedDatabaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_lastProcessedDateKey, 0);
  objc_storeStrong((id *)&self->_intervalCounterKey, 0);
  objc_storeStrong((id *)&self->_lastSubmissionAttemptKey, 0);

  objc_storeStrong((id *)&self->_waitingToRunKey, 0);
}

@end