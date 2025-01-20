@interface LNConnectionOperation
- (LNConnectionOperation)initWithIdentifier:(id)a3 priority:(int64_t)a4 queue:(id)a5 activity:(id)a6;
- (LNConnectionOperationDelegate)connection;
- (LNWatchdogTimer)requestTimer;
- (NSUUID)identifier;
- (OS_dispatch_queue)queue;
- (OS_os_activity)activity;
- (double)timeout;
- (id)description;
- (id)validatingResult:(id)a3 error:(id)a4;
- (int64_t)priority;
- (unint64_t)hash;
- (void)cancelTimeout;
- (void)extendTimeout;
- (void)finishWithError:(id)a3;
- (void)setConnection:(id)a3;
- (void)setRequestTimer;
- (void)start;
@end

@implementation LNConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_requestTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_activityProvider, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNConnectionOperation *)self identifier];
  v7 = [v3 stringWithFormat:@"<%@: %p, identifier: %@>", v5, self, v6];

  return v7;
}

- (unint64_t)hash
{
  v2 = [(LNConnectionOperation *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (LNConnectionOperation)initWithIdentifier:(id)a3 priority:(int64_t)a4 queue:(id)a5 activity:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNConnectionOperation.m", 25, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)LNConnectionOperation;
  v14 = [(LNConnectionOperation *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSUUID *)v15;

    v14->_priority = a4;
    v17 = _Block_copy(v13);
    id activityProvider = v14->_activityProvider;
    v14->_id activityProvider = v17;

    objc_storeStrong((id *)&v14->_queue, a5);
    v19 = v14;
  }

  return v14;
}

- (void)setRequestTimer
{
  [(LNConnectionOperation *)self timeout];
  if (v3 != *(double *)&LNConnectionOperationRequestTimeoutDisabled)
  {
    objc_initWeak(&location, self);
    v4 = [LNWatchdogTimer alloc];
    [(LNConnectionOperation *)self timeout];
    double v6 = v5;
    v7 = [(LNConnectionOperation *)self connection];
    v8 = [v7 queue];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __40__LNConnectionOperation_setRequestTimer__block_invoke;
    v14 = &unk_1E5B3A1D0;
    objc_copyWeak(&v15, &location);
    v9 = [(LNWatchdogTimer *)v4 initWithTimeoutInterval:v8 onQueue:&v11 timeoutHandler:v6];
    requestTimer = self->_requestTimer;
    self->_requestTimer = v9;

    [(LNWatchdogTimer *)self->_requestTimer start];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (double)timeout
{
  return *(double *)&LNConnectionOperationRequestTimeout;
}

- (void)finishWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(LNConnectionOperation *)self queue];
  dispatch_assert_queue_V2(v5);

  double v6 = getLNLogCategoryConnection();
  v7 = v6;
  if (v4)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v16 = 138543618;
    v17 = self;
    __int16 v18 = 2114;
    id v19 = v4;
    v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    int v16 = 138543362;
    v17 = self;
    v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
    uint32_t v11 = 12;
  }
  _os_log_impl(&dword_1A4419000, v9, v10, v8, (uint8_t *)&v16, v11);
LABEL_7:

  uint64_t v12 = [(LNConnectionOperation *)self requestTimer];
  [v12 cancel];

  id v13 = [(LNConnectionOperation *)self connection];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = [(LNConnectionOperation *)self connection];
    [v15 connectionOperation:self didFinishWithError:v4];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (LNWatchdogTimer)requestTimer
{
  return self->_requestTimer;
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v3 = [(LNConnectionOperation *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "Starting operation %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [(LNConnectionOperation *)self setRequestTimer];
  double v5 = [(LNConnectionOperation *)self connection];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(LNConnectionOperation *)self connection];
    [v7 connectionOperationWillStart:self];
  }
}

- (LNConnectionOperationDelegate)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_os_activity)activity
{
  activity = self->_activity;
  if (!activity)
  {
    (*((void (**)(void))self->_activityProvider + 2))();
    id v4 = (OS_os_activity *)objc_claimAutoreleasedReturnValue();
    double v5 = self->_activity;
    self->_activity = v4;

    id activityProvider = self->_activityProvider;
    self->_id activityProvider = 0;

    activity = self->_activity;
  }
  v7 = activity;
  return v7;
}

- (int64_t)priority
{
  return self->_priority;
}

- (id)validatingResult:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    int v8 = 0;
  }
  else
  {
    if (v6)
    {
      id v9 = v6;
    }
    else
    {
      LNConnectionErrorWithCode(1014);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    int v8 = v9;
  }

  return v8;
}

void __40__LNConnectionOperation_setRequestTimer__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained connection];
  char v3 = [v2 targetIsBeingDebugged];

  if ((v3 & 1) == 0)
  {
    id v4 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543618;
      id v7 = WeakRetained;
      __int16 v8 = 2050;
      uint64_t v9 = LNConnectionOperationRequestTimeout;
    }

    id v5 = LNConnectionErrorWithCode(1002);
    [WeakRetained finishWithError:v5];
  }
}

- (void)extendTimeout
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(LNConnectionOperation *)self timeout];
  if (v3 != *(double *)&LNConnectionOperationRequestTimeoutDisabled)
  {
    id v4 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [(LNConnectionOperation *)self identifier];
      int v7 = 138543362;
      __int16 v8 = v5;
      _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "Extending timeout for operation with identifier %{public}@", (uint8_t *)&v7, 0xCu);
    }
    int v6 = [(LNConnectionOperation *)self requestTimer];
    [v6 cancel];

    [(LNConnectionOperation *)self setRequestTimer];
  }
}

- (void)cancelTimeout
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(LNConnectionOperation *)self timeout];
  if (v3 != *(double *)&LNConnectionOperationRequestTimeoutDisabled)
  {
    id v4 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [(LNConnectionOperation *)self identifier];
      int v7 = 138543362;
      __int16 v8 = v5;
      _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "Canceling timeout for operation with identifier %{public}@", (uint8_t *)&v7, 0xCu);
    }
    int v6 = [(LNConnectionOperation *)self requestTimer];
    [v6 cancel];
  }
}

@end