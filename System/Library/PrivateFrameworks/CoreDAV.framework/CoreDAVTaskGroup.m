@interface CoreDAVTaskGroup
- (CoreDAVAccountInfoProvider)accountInfoProvider;
- (CoreDAVTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4;
- (CoreDAVTaskGroupDelegate)delegate;
- (CoreDAVTaskManager)taskManager;
- (NSError)error;
- (NSMutableSet)outstandingTasks;
- (double)timeoutInterval;
- (id)completionBlock;
- (id)context;
- (id)progressBlock;
- (void)_tearDownAllTasks;
- (void)bailWithError:(id)a3;
- (void)cancelTaskGroup;
- (void)dealloc;
- (void)finishCoreDAVTaskGroupWithError:(id)a3;
- (void)finishCoreDAVTaskGroupWithError:(id)a3 delegateCallbackBlock:(id)a4;
- (void)finishEarlyWithError:(id)a3;
- (void)setAccountInfoProvider:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setProgressBlock:(id)a3;
- (void)setTaskManager:(id)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)startTaskGroup;
- (void)submitWithTaskManager:(id)a3;
- (void)taskGroupWillCancelWithError:(id)a3;
@end

@implementation CoreDAVTaskGroup

- (CoreDAVTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CoreDAVTaskGroup;
  v8 = [(CoreDAVTaskGroup *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accountInfoProvider, v6);
    objc_storeWeak((id *)&v9->_taskManager, v7);
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    outstandingTasks = v9->_outstandingTasks;
    v9->_outstandingTasks = v10;

    v9->_timeoutInterval = 240.0;
  }

  return v9;
}

- (void)dealloc
{
  if ([(NSMutableSet *)self->_outstandingTasks count])
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"CoreDAVTaskGroup.m", 45, @"We should never finish a task group with an existing task.  I have %@", self->_outstandingTasks object file lineNumber description];
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)CoreDAVTaskGroup;
  [(CoreDAVTaskGroup *)&v5 dealloc];
}

- (void)startTaskGroup
{
}

- (void)taskGroupWillCancelWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
  }
  id v5 = v4;
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v4 delegateCallbackBlock:0];
}

- (void)_tearDownAllTasks
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!self->_isTearingDown)
  {
    self->_isTearingDown = 1;
    v3 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
    id v4 = (void *)[(NSMutableSet *)self->_outstandingTasks copy];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "finishEarlyWithError:", v3, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)bailWithError:(id)a3
{
  if (!self->_isCancelling)
  {
    self->_isCancelling = 1;
    id v4 = a3;
    [(CoreDAVTaskGroup *)self _tearDownAllTasks];
    [(CoreDAVTaskGroup *)self taskGroupWillCancelWithError:v4];
  }
}

- (void)cancelTaskGroup
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
  [(CoreDAVTaskGroup *)self bailWithError:v3];
}

- (void)finishCoreDAVTaskGroupWithError:(id)a3 delegateCallbackBlock:(id)a4
{
  id v11 = a3;
  uint64_t v6 = (void (**)(void))a4;
  if (!self->_isFinished)
  {
    self->_isFinished = 1;
    [(CoreDAVTaskGroup *)self setError:v11];
    uint64_t v7 = self;
    uint64_t v8 = [(CoreDAVTaskGroup *)v7 delegate];
    if (v6) {
      v6[2](v6);
    }
    uint64_t v9 = [(CoreDAVTaskGroup *)v7 completionBlock];

    if (v9)
    {
      long long v10 = [(CoreDAVTaskGroup *)v7 completionBlock];
      v10[2]();
    }
    else if (objc_opt_respondsToSelector())
    {
      [v8 taskGroup:v7 didFinishWithError:v11];
    }
    [(CoreDAVTaskGroup *)v7 setProgressBlock:0];
    [(CoreDAVTaskGroup *)v7 setCompletionBlock:0];
  }
}

- (void)finishCoreDAVTaskGroupWithError:(id)a3
{
}

- (void)finishEarlyWithError:(id)a3
{
  [(CoreDAVTaskGroup *)self bailWithError:a3];
  [(CoreDAVTaskGroup *)self setDelegate:0];
}

- (void)submitWithTaskManager:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3)
  {
    -[CoreDAVTaskGroup setTaskManager:](self, "setTaskManager:");
    [(CoreDAVTaskGroup *)self startTaskGroup];
  }
  else
  {
    id v4 = +[CoreDAVLogging sharedLogging];
    id v5 = [v4 logHandleForAccountInfoProvider:0];
    uint64_t v6 = v5;
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      uint64_t v9 = self;
      _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_ERROR, "TaskGroup %@ submitted with no taskManager, returning immediately", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
    [(CoreDAVTaskGroup *)self finishEarlyWithError:v7];
  }
}

- (CoreDAVAccountInfoProvider)accountInfoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  return (CoreDAVAccountInfoProvider *)WeakRetained;
}

- (void)setAccountInfoProvider:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (CoreDAVTaskGroupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CoreDAVTaskGroupDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSMutableSet)outstandingTasks
{
  return self->_outstandingTasks;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (CoreDAVTaskManager)taskManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskManager);
  return (CoreDAVTaskManager *)WeakRetained;
}

- (void)setTaskManager:(id)a3
{
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outstandingTasks, 0);
  objc_destroyWeak((id *)&self->_accountInfoProvider);
  objc_destroyWeak((id *)&self->_taskManager);
}

@end