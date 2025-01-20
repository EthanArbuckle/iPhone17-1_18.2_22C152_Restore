@interface MRUCoordinatedUpdateController
- (MPWeakTimer)timer;
- (MRUCoordinatedUpdateController)init;
- (MRUCoordinatedUpdateControllerDelegate)delegate;
- (NSMutableArray)queue;
- (NSString)context;
- (double)cadence;
- (void)addUpdate:(id)a3 completion:(id)a4;
- (void)processQueue;
- (void)resetTimer;
- (void)setCadence:(double)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setupTimer;
@end

@implementation MRUCoordinatedUpdateController

- (MRUCoordinatedUpdateController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRUCoordinatedUpdateController;
  v2 = [(MRUCoordinatedUpdateController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    queue = v2->_queue;
    v2->_queue = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)setCadence:(double)a3
{
  if (self->_cadence != a3)
  {
    self->_cadence = a3;
    [(MRUCoordinatedUpdateController *)self setupTimer];
  }
}

- (void)addUpdate:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [[MRUCoordinatedUpdate alloc] initWithUpdate:v7 completion:v6];

  [(NSMutableArray *)self->_queue addObject:v8];
  v9 = MCLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(NSMutableArray *)self->_queue count];
    context = self->_context;
    int v13 = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    v18 = context;
    _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ adding update with items in queue: #%lu for context: %{public}@", (uint8_t *)&v13, 0x20u);
  }

  [(MRUCoordinatedUpdateController *)self setupTimer];
}

- (void)processQueue
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_queue copy];
  [(NSMutableArray *)self->_queue removeAllObjects];
  v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [v3 count];
    context = self->_context;
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v5;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    __int16 v18 = 2114;
    uint64_t v19 = context;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ number of items processed: #%lu for context: %{public}@", buf, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__MRUCoordinatedUpdateController_processQueue__block_invoke;
  v12[3] = &unk_1E5F0D7F8;
  id v13 = v3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__MRUCoordinatedUpdateController_processQueue__block_invoke_2;
  v10[3] = &unk_1E5F0D7F8;
  id v11 = v13;
  id v9 = v13;
  [WeakRetained coordinatedUpdateController:self processCoordinatedUpdates:v12 completion:v10];
}

uint64_t __46__MRUCoordinatedUpdateController_processQueue__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeObjectsPerformSelector:sel_process];
}

uint64_t __46__MRUCoordinatedUpdateController_processQueue__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeObjectsPerformSelector:sel_complete];
}

- (void)setupTimer
{
  if (!self->_timer)
  {
    if ([(NSMutableArray *)self->_queue count])
    {
      objc_initWeak(&location, self);
      id v3 = objc_alloc(MEMORY[0x1E4F31A98]);
      double cadence = self->_cadence;
      uint64_t v5 = MEMORY[0x1E4F14428];
      id v6 = MEMORY[0x1E4F14428];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __44__MRUCoordinatedUpdateController_setupTimer__block_invoke;
      v9[3] = &unk_1E5F0DA00;
      objc_copyWeak(&v10, &location);
      id v7 = (MPWeakTimer *)[v3 initWithInterval:v5 queue:v9 block:cadence];
      timer = self->_timer;
      self->_timer = v7;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __44__MRUCoordinatedUpdateController_setupTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetTimer];
}

- (void)resetTimer
{
  [(MRUCoordinatedUpdateController *)self processQueue];
  [(MPWeakTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  [(MRUCoordinatedUpdateController *)self setupTimer];
}

- (MRUCoordinatedUpdateControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUCoordinatedUpdateControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (double)cadence
{
  return self->_cadence;
}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MPWeakTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end