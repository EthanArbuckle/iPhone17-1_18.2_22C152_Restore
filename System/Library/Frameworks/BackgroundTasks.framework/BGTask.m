@interface BGTask
- (BOOL)_completed;
- (NSString)identifier;
- (OS_dispatch_queue)_handlerQueue;
- (_DASActivity)_activity;
- (id)_completionHandler;
- (id)_initWithIdentifier:(id)a3 activity:(id)a4;
- (id)_unsafe_setTaskCompletedWithSuccess:(BOOL)a3 afterDelay:(double)a4;
- (os_unfair_lock_s)_lock;
- (void)_callExpirationHandler;
- (void)_setActivity:(id)a3;
- (void)_setCompleted:(BOOL)a3;
- (void)_setCompletionHandler:(id)a3;
- (void)_setHandlerQueue:(id)a3;
- (void)_setLock:(os_unfair_lock_s)a3;
- (void)_setTaskCompletedWithSuccess:(BOOL)a3 actionsIfNotAlreadyCompleted:(id)a4;
- (void)dealloc;
- (void)expirationHandler;
- (void)setExpirationHandler:(void *)expirationHandler;
- (void)setTaskCompletedWithSuccess:(BOOL)success;
@end

@implementation BGTask

- (id)_initWithIdentifier:(id)a3 activity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BGTask;
  v9 = [(BGTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->__lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->__activity, a4);
  }

  return v10;
}

- (id)_unsafe_setTaskCompletedWithSuccess:(BOOL)a3 afterDelay:(double)a4
{
  self->__completed = 1;
  [(BGTask *)self setExpirationHandler:0];
  id v7 = [(BGTask *)self _completionHandler];
  [(BGTask *)self _setCompletionHandler:0];
  id v8 = [(BGTask *)self _handlerQueue];
  v9 = v8;
  if (v7)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __57__BGTask__unsafe_setTaskCompletedWithSuccess_afterDelay___block_invoke;
    v12[3] = &unk_264421910;
    double v15 = a4;
    id v13 = v8;
    id v14 = v7;
    BOOL v16 = a3;
    v10 = (void *)MEMORY[0x21D4B0AB0](v12);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __57__BGTask__unsafe_setTaskCompletedWithSuccess_afterDelay___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  if (v2 == 0.0)
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
  else
  {
    dispatch_time_t v3 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__BGTask__unsafe_setTaskCompletedWithSuccess_afterDelay___block_invoke_2;
    v6[3] = &unk_2644218E8;
    v4 = *(NSObject **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    char v8 = *(unsigned char *)(a1 + 56);
    dispatch_after(v3, v4, v6);
  }
}

uint64_t __57__BGTask__unsafe_setTaskCompletedWithSuccess_afterDelay___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setTaskCompletedWithSuccess:(BOOL)success
{
}

- (void)_setTaskCompletedWithSuccess:(BOOL)a3 actionsIfNotAlreadyCompleted:(id)a4
{
  BOOL v4 = a3;
  char v8 = (void (**)(void))a4;
  os_unfair_lock_lock(&self->__lock);
  if (self->__completed)
  {
    os_unfair_lock_unlock(&self->__lock);
  }
  else
  {
    if (v8) {
      v8[2]();
    }
    else {
      double v6 = 0.0;
    }
    id v7 = [(BGTask *)self _unsafe_setTaskCompletedWithSuccess:v4 afterDelay:v6];
    os_unfair_lock_unlock(&self->__lock);
    if (v7)
    {
      v7[2](v7);
    }
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C7BC000, a2, OS_LOG_TYPE_ERROR, "Task %{public}@ dealloc'd without completing. This is a programmer error.", (uint8_t *)&v2, 0xCu);
}

- (void)_callExpirationHandler
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C7BC000, a2, OS_LOG_TYPE_ERROR, "Client didn't provide an expiration handler for task %{public}@, completing with NO success for them", (uint8_t *)&v2, 0xCu);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)expirationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setExpirationHandler:(void *)expirationHandler
{
}

- (_DASActivity)_activity
{
  return self->__activity;
}

- (void)_setActivity:(id)a3
{
}

- (BOOL)_completed
{
  return self->__completed;
}

- (void)_setCompleted:(BOOL)a3
{
  self->__completed = a3;
}

- (os_unfair_lock_s)_lock
{
  return self->__lock;
}

- (void)_setLock:(os_unfair_lock_s)a3
{
  self->__lock = a3;
}

- (OS_dispatch_queue)_handlerQueue
{
  return self->__handlerQueue;
}

- (void)_setHandlerQueue:(id)a3
{
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong((id *)&self->__handlerQueue, 0);
  objc_storeStrong((id *)&self->__activity, 0);
  objc_storeStrong(&self->_expirationHandler, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end