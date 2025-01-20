@interface ATXBackgroundSaver
- (ATXBackgroundSaver)initWithQueue:(id)a3 block:(id)a4;
- (void)_cancelSaveTimer;
- (void)_cancelSaveTimerWithLockWitness:(id)a3;
- (void)_saveImmediatelyOnSigterm;
- (void)dealloc;
- (void)handleSigterm;
- (void)scheduleSave;
- (void)scheduleSaveImmediately;
@end

@implementation ATXBackgroundSaver

- (void)_cancelSaveTimerWithLockWitness:(id)a3
{
  v3 = *((void *)a3 + 1);
  if (v3)
  {
    id v5 = a3;
    dispatch_source_cancel(v3);
    id v6 = (id)*((void *)a3 + 1);
    *((void *)a3 + 1) = 0;
  }
}

id __34__ATXBackgroundSaver_scheduleSave__block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
  [*(id *)(a1 + 32) _cancelSaveTimer];
  return self;
}

- (void)_cancelSaveTimer
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__ATXBackgroundSaver__cancelSaveTimer__block_invoke;
  v3[3] = &unk_1E68B3A18;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

uint64_t __38__ATXBackgroundSaver__cancelSaveTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _cancelSaveTimerWithLockWitness:a2];
}

- (ATXBackgroundSaver)initWithQueue:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ATXBackgroundSaver;
  v9 = [(ATXBackgroundSaver *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = [v8 copy];
    id block = v10->_block;
    v10->_id block = (id)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F93B70]);
    v14 = objc_opt_new();
    uint64_t v15 = [v13 initWithGuardedData:v14];
    lock = v10->_lock;
    v10->_lock = (_PASLock *)v15;
  }
  return v10;
}

- (void)dealloc
{
  [(ATXBackgroundSaver *)self _cancelSaveTimer];
  [(ATXSigtermListener *)self->_sigtermListener unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)ATXBackgroundSaver;
  [(ATXBackgroundSaver *)&v3 dealloc];
}

- (void)handleSigterm
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__ATXBackgroundSaver_handleSigterm__block_invoke;
  v3[3] = &unk_1E68B3A18;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

uint64_t __35__ATXBackgroundSaver_handleSigterm__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 8)) {
    return [*(id *)(result + 32) scheduleSaveImmediately];
  }
  return result;
}

- (void)_saveImmediatelyOnSigterm
{
  if (!self->_sigtermListener)
  {
    objc_super v3 = [MEMORY[0x1E4F4B670] sharedInstance];
    sigtermListener = self->_sigtermListener;
    self->_sigtermListener = v3;

    id v5 = self->_sigtermListener;
    [(ATXSigtermListener *)v5 registerObserver:self];
  }
}

- (void)scheduleSave
{
  sel_getName(a2);
  objc_super v3 = (void *)os_transaction_create();
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__ATXBackgroundSaver_scheduleSave__block_invoke;
  v6[3] = &unk_1E68B3A40;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [(_PASLock *)lock runWithLockAcquired:v6];
}

void __34__ATXBackgroundSaver_scheduleSave__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  v4 = a2;
  [v3 _saveImmediatelyOnSigterm];
  [*(id *)(a1 + 32) _cancelSaveTimerWithLockWitness:v4];
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  id v6 = (void *)v4[1];
  v4[1] = v5;

  id v7 = v4[1];
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
  v9 = v4[1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__ATXBackgroundSaver_scheduleSave__block_invoke_2;
  v12[3] = &unk_1E68AB870;
  v10 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v10;
  dispatch_source_set_event_handler(v9, v12);
  uint64_t v11 = v4[1];

  dispatch_resume(v11);
}

- (void)scheduleSaveImmediately
{
  sel_getName(a2);
  objc_super v3 = (void *)os_transaction_create();
  [(ATXBackgroundSaver *)self _cancelSaveTimer];
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__ATXBackgroundSaver_scheduleSaveImmediately__block_invoke;
  v6[3] = &unk_1E68AB870;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(queue, v6);
}

id __45__ATXBackgroundSaver_scheduleSaveImmediately__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigtermListener, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end