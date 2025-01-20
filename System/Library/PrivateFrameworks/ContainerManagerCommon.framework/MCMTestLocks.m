@interface MCMTestLocks
+ (id)sharedInstance;
- (BOOL)enabled;
- (MCMTestLocks)init;
- (OS_dispatch_queue)stateQueue;
- (int64_t)countOfLock:(unint64_t)a3;
- (void)_stateQueue_acquireLock:(unint64_t)a3;
- (void)_stateQueue_releaseLock:(unint64_t)a3;
- (void)_stateQueue_updateCountForLock:(unint64_t)a3 byCount:(int64_t)a4;
- (void)acquireLock:(unint64_t)a3;
- (void)releaseAllLocks;
- (void)releaseLock:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setStateQueue:(id)a3;
- (void)waitOnLock:(unint64_t)a3;
@end

@implementation MCMTestLocks

- (void)waitOnLock:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(MCMTestLocks *)self enabled])
  {
    v5 = self->_lockQueue[a3];
    v6 = [MEMORY[0x1E4F29128] UUID];
    v7 = [v6 UUIDString];

    v8 = container_log_handle_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = [v7 UTF8String];
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      _os_log_impl(&dword_1D7739000, v8, OS_LOG_TYPE_DEFAULT, "[%s] Waiting on lock: %llu", buf, 0x16u);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __27__MCMTestLocks_waitOnLock___block_invoke;
    v10[3] = &unk_1E6A7F160;
    id v11 = v7;
    unint64_t v12 = a3;
    id v9 = v7;
    dispatch_sync((dispatch_queue_t)v5, v10);
  }
}

- (BOOL)enabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL enabled = v2->_enabled;
  objc_sync_exit(v2);

  return enabled;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_singleton;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  for (uint64_t i = 0; i != -15; --i)
    objc_storeStrong((id *)&self->_lockSemaphore[i + 14], 0);
  for (uint64_t j = 240; j != 120; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
}

- (void)setStateQueue:(id)a3
{
  p_stateQueue = &self->_stateQueue;

  objc_storeStrong((id *)p_stateQueue, a3);
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)_stateQueue_releaseLock:(unint64_t)a3
{
  v3 = self->_lockSemaphore[a3];

  dispatch_semaphore_signal(v3);
}

- (void)_stateQueue_acquireLock:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = (id *)(&self->super.isa + a3);
  id v5 = v4[31];
  id v6 = v4[16];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MCMTestLocks__stateQueue_acquireLock___block_invoke;
  block[3] = &unk_1E6A7F160;
  id v10 = v5;
  unint64_t v11 = a3;
  id v7 = v5;
  v8 = v6;
  dispatch_barrier_async(v8, block);
}

void __40__MCMTestLocks__stateQueue_acquireLock___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = container_log_handle_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1D7739000, v2, OS_LOG_TYPE_DEFAULT, "Blocking waiters for lock: %llu", (uint8_t *)&v6, 0xCu);
  }

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v4 = container_log_handle_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1D7739000, v4, OS_LOG_TYPE_DEFAULT, "Unblocking waiters for lock: %llu", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_stateQueue_updateCountForLock:(unint64_t)a3 byCount:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    lockCount = self->_lockCount;
    int64_t v6 = self->_lockCount[a3];
    int64_t v7 = v6 + a4;
    if (v6 + a4 < 0)
    {
      int64_t v11 = self->_lockCount[a3];
      id v10 = container_log_handle_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        unint64_t v13 = a3;
        __int16 v14 = 2048;
        int64_t v15 = a4;
        __int16 v16 = 2048;
        int64_t v17 = v11;
        _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "Unbalanced update to test lock: %llu by: %ld from: %ld", buf, 0x20u);
      }

      abort();
    }
    if (v6) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v7 == 0;
    }
    if (v8)
    {
      if (!v7) {
        [(MCMTestLocks *)self _stateQueue_releaseLock:a3];
      }
    }
    else
    {
      [(MCMTestLocks *)self _stateQueue_acquireLock:a3];
    }
    lockCount[a3] = v7;
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = self;
  objc_sync_enter(v4);
  if (v3)
  {
    if (!v4->_enabled)
    {
      uint64_t v5 = container_log_handle_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v9 = 0;
        int64_t v6 = "Enabled test locks feature.";
        int64_t v7 = (uint8_t *)&v9;
LABEL_8:
        _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v4->_enabled)
  {
    [(MCMTestLocks *)v4 releaseAllLocks];
    uint64_t v5 = container_log_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      int64_t v6 = "Disabled test locks feature.";
      int64_t v7 = (uint8_t *)&v8;
      goto LABEL_8;
    }
LABEL_9:
  }
  v4->_BOOL enabled = v3;
  objc_sync_exit(v4);
}

- (int64_t)countOfLock:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = -1;
  if ([(MCMTestLocks *)self enabled])
  {
    uint64_t v5 = [(MCMTestLocks *)self stateQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __28__MCMTestLocks_countOfLock___block_invoke;
    v8[3] = &unk_1E6A800E0;
    v8[4] = self;
    v8[5] = &v9;
    v8[6] = a3;
    dispatch_sync(v5, v8);
  }
  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void *__28__MCMTestLocks_countOfLock___block_invoke(void *result)
{
  *(void *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 8 * result[6] + 8);
  return result;
}

void __27__MCMTestLocks_waitOnLock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = container_log_handle_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) UTF8String];
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 136315394;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D7739000, v2, OS_LOG_TYPE_DEFAULT, "[%s] No longer waiting on lock: %llu", (uint8_t *)&v5, 0x16u);
  }
}

- (void)releaseAllLocks
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MCMTestLocks *)self stateQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__MCMTestLocks_releaseAllLocks__block_invoke;
  v4[3] = &unk_1E6A80730;
  v4[4] = self;
  dispatch_sync(v3, v4);
}

void __31__MCMTestLocks_releaseAllLocks__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  for (uint64_t i = 1; i != 16; ++i)
    objc_msgSend(*(id *)(a1 + 32), "_stateQueue_updateCountForLock:byCount:", i - 1, -*(void *)(*(void *)(a1 + 32) + 8 * i));
  uint64_t v3 = container_log_handle_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D7739000, v3, OS_LOG_TYPE_DEFAULT, "Released all test locks.", v4, 2u);
  }
}

- (void)releaseLock:(unint64_t)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MCMTestLocks *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MCMTestLocks_releaseLock___block_invoke;
  block[3] = &unk_1E6A7F160;
  void block[4] = self;
  block[5] = a3;
  dispatch_sync(v5, block);
}

void __28__MCMTestLocks_releaseLock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_updateCountForLock:byCount:", *(void *)(a1 + 40), -1);
  v2 = container_log_handle_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8 * v3 + 8);
    int v5 = 134218240;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D7739000, v2, OS_LOG_TYPE_DEFAULT, "Released test lock: %llu; count: %ld",
      (uint8_t *)&v5,
      0x16u);
  }
}

- (void)acquireLock:(unint64_t)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  int v5 = [(MCMTestLocks *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MCMTestLocks_acquireLock___block_invoke;
  block[3] = &unk_1E6A7F160;
  void block[4] = self;
  block[5] = a3;
  dispatch_sync(v5, block);
}

void __28__MCMTestLocks_acquireLock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_updateCountForLock:byCount:", *(void *)(a1 + 40), 1);
  v2 = container_log_handle_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8 * v3 + 8);
    int v5 = 134218240;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D7739000, v2, OS_LOG_TYPE_DEFAULT, "Acquired test lock: %llu; count: %ld",
      (uint8_t *)&v5,
      0x16u);
  }
}

- (MCMTestLocks)init
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)MCMTestLocks;
  v2 = [(MCMTestLocks *)&v13 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_BOOL enabled = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.containermanagerd.MCMTestLocks.stateQueue", 0);
    stateQueue = v3->_stateQueue;
    v3->_stateQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = 0;
    __int16 v7 = MEMORY[0x1E4F14430];
    do
    {
      dispatch_queue_t v8 = dispatch_queue_create("com.apple.containermanagerd.MCMTestLocks.lockQueue", v7);
      uint64_t v9 = v3->_lockQueue[v6];
      v3->_lockQueue[v6] = (OS_dispatch_queue *)v8;

      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      uint64_t v11 = v3->_lockSemaphore[v6];
      v3->_lockSemaphore[v6] = (OS_dispatch_semaphore *)v10;

      ++v6;
    }
    while (v6 != 15);
  }
  return v3;
}

uint64_t __30__MCMTestLocks_sharedInstance__block_invoke()
{
  sharedInstance_singleton = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end