@interface AXMTaskDispatcher
- (AXMTaskDispatcher)initWithIdentifier:(id)a3 delegate:(id)a4;
- (AXMTaskDispatcherDelegate)delegate;
- (BOOL)isEmpty;
- (id)_queue_dequeueTask;
- (id)_queue_unscheduleAllTasks;
- (id)unscheduleAllTasks;
- (int64_t)_queue_count;
- (int64_t)count;
- (void)_queue_processNextTask;
- (void)_queue_scheduleTask:(id)a3;
- (void)scheduleTask:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AXMTaskDispatcher

- (AXMTaskDispatcher)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AXMTaskDispatcher;
  id v8 = [(AXMTaskDispatcher *)&v22 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v9;

    objc_storeWeak((id *)v8 + 5, v7);
    v11 = (const char *)[v6 UTF8String];
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    v14 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v13;

    dispatch_source_t v15 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, *((dispatch_queue_t *)v8 + 2));
    v16 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v15;

    objc_initWeak(&location, v8);
    v17 = *((void *)v8 + 1);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__AXMTaskDispatcher_initWithIdentifier_delegate___block_invoke;
    v19[3] = &unk_1E6116E48;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v17, v19);
    dispatch_activate(*((dispatch_object_t *)v8 + 1));
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return (AXMTaskDispatcher *)v8;
}

void __49__AXMTaskDispatcher_initWithIdentifier_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_processNextTask");
}

- (int64_t)count
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__AXMTaskDispatcher_count__block_invoke;
  v5[3] = &unk_1E6116EC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__AXMTaskDispatcher_count__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_count");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_queue_count
{
  return [(NSMutableArray *)self->_queue_taskList count];
}

- (BOOL)isEmpty
{
  return [(AXMTaskDispatcher *)self count] == 0;
}

- (void)_queue_processNextTask
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "task should not be in the completed state", v2, v3, v4, v5, v6);
}

void __43__AXMTaskDispatcher__queue_processNextTask__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  uint8_t v6 = AXMediaLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __43__AXMTaskDispatcher__queue_processNextTask__block_invoke_cold_1((uint64_t)v5, a3, v6);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained[2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AXMTaskDispatcher__queue_processNextTask__block_invoke_26;
  block[3] = &unk_1E6117090;
  block[4] = WeakRetained;
  dispatch_async(v8, block);
}

void __43__AXMTaskDispatcher__queue_processNextTask__block_invoke_26(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 32))
  {
    uint64_t v3 = AXMediaLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __43__AXMTaskDispatcher__queue_processNextTask__block_invoke_26_cold_1();
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 32) = 0;
  dispatch_source_merge_data(*(dispatch_source_t *)(*(void *)(a1 + 32) + 8), 1uLL);
}

- (void)scheduleTask:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__AXMTaskDispatcher_scheduleTask___block_invoke;
    v7[3] = &unk_1E6116F08;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

uint64_t __34__AXMTaskDispatcher_scheduleTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleTask:", *(void *)(a1 + 40));
}

- (void)_queue_scheduleTask:(id)a3
{
  [(NSMutableArray *)self->_queue_taskList addObject:a3];
  if (!self->_queue_taskIsBeingProcessed)
  {
    processQueueSource = self->_processQueueSource;
    dispatch_source_merge_data(processQueueSource, 1uLL);
  }
}

- (id)unscheduleAllTasks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AXMTaskDispatcher_unscheduleAllTasks__block_invoke;
  v5[3] = &unk_1E6116EC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__AXMTaskDispatcher_unscheduleAllTasks__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllTasks");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_queue_unscheduleAllTasks
{
  uint64_t v3 = (void *)[(NSMutableArray *)self->_queue_taskList copy];
  [(NSMutableArray *)self->_queue_taskList removeAllObjects];

  return v3;
}

- (id)_queue_dequeueTask
{
  if ([(NSMutableArray *)self->_queue_taskList count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_queue_taskList objectAtIndex:0];
    [(NSMutableArray *)self->_queue_taskList removeObjectAtIndex:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (AXMTaskDispatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMTaskDispatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue_taskList, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_processQueueSource, 0);
}

void __43__AXMTaskDispatcher__queue_processNextTask__block_invoke_cold_1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "Task is marked complete: %@ -> %d", (uint8_t *)&v3, 0x12u);
}

void __43__AXMTaskDispatcher__queue_processNextTask__block_invoke_26_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "taskIsBeingProcessed should be YES", v2, v3, v4, v5, v6);
}

@end