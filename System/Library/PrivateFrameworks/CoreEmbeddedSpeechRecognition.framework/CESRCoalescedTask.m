@interface CESRCoalescedTask
- (BOOL)isExecuted;
- (CESRCoalescedTask)initWithTaskId:(id)a3 eventId:(id)a4 date:(id)a5 taskBlock:(id)a6 completionQueue:(id)a7 completion:(id)a8;
- (NSDate)date;
- (id)_runBlockForTask:(id)a3 completionQueue:(id)a4 completion:(id)a5;
- (id)description;
- (void)execute;
- (void)executeAfterDelay:(double)a3 onQueue:(id)a4;
@end

@implementation CESRCoalescedTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong(&self->_runBlock, 0);
  objc_storeStrong((id *)&self->_eventId, 0);

  objc_storeStrong((id *)&self->_taskId, 0);
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isExecuted
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_executed);
  return v2 & 1;
}

- (void)executeAfterDelay:(double)a3 onQueue:(id)a4
{
  int64_t v5 = (uint64_t)(a3 * 1000000000.0);
  v6 = a4;
  dispatch_time_t v7 = dispatch_time(0, v5);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CESRCoalescedTask_executeAfterDelay_onQueue___block_invoke;
  block[3] = &unk_1E61C38C0;
  block[4] = self;
  dispatch_after(v7, v6, block);
}

uint64_t __47__CESRCoalescedTask_executeAfterDelay_onQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) execute];
}

- (void)execute
{
}

- (id)_runBlockForTask:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = a4;
  v11 = [(CESRCoalescedTask *)self description];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CESRCoalescedTask__runBlockForTask_completionQueue_completion___block_invoke;
  block[3] = &unk_1E61C3820;
  id v21 = v11;
  id v22 = v8;
  id v12 = v8;
  id v13 = v11;
  dispatch_block_t v14 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__CESRCoalescedTask__runBlockForTask_completionQueue_completion___block_invoke_5;
  v18[3] = &unk_1E61C3820;
  v18[4] = self;
  id v19 = v9;
  id v15 = v9;
  dispatch_block_notify(v14, v10, v18);

  v16 = _Block_copy(v14);

  return v16;
}

void __65__CESRCoalescedTask__runBlockForTask_completionQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = (os_log_t *)MEMORY[0x1E4F4E380];
  v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 136315394;
    id v8 = "-[CESRCoalescedTask _runBlockForTask:completionQueue:completion:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Executing task - (%@)", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int64_t v5 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136315394;
    id v8 = "-[CESRCoalescedTask _runBlockForTask:completionQueue:completion:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1B8CCB000, v5, OS_LOG_TYPE_INFO, "%s Finished executing task - (%@)", (uint8_t *)&v7, 0x16u);
  }
}

uint64_t __65__CESRCoalescedTask__runBlockForTask_completionQueue_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (id)description
{
  uint64_t v2 = NSString;
  taskId = self->_taskId;
  eventId = self->_eventId;
  int64_t v5 = CESRISO8601StringForDate(self->_date);
  uint64_t v6 = [v2 stringWithFormat:@"taskId: %@, eventId: %@, received: %@", taskId, eventId, v5];

  return v6;
}

- (CESRCoalescedTask)initWithTaskId:(id)a3 eventId:(id)a4 date:(id)a5 taskBlock:(id)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v25 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)CESRCoalescedTask;
  v20 = [(CESRCoalescedTask *)&v26 init];
  id v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_taskId, a3);
    objc_storeStrong((id *)&v21->_eventId, a4);
    objc_storeStrong((id *)&v21->_date, a5);
    uint64_t v22 = [(CESRCoalescedTask *)v21 _runBlockForTask:v17 completionQueue:v18 completion:v19];
    id runBlock = v21->_runBlock;
    v21->_id runBlock = (id)v22;

    atomic_store(0, (unsigned __int8 *)&v21->_executed);
  }

  return v21;
}

@end