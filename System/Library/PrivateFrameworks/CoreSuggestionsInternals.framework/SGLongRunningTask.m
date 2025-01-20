@interface SGLongRunningTask
- (BOOL)shouldDefer;
- (SGLongRunningTask)initWithDeadline:(id)a3 manager:(id)a4;
- (void)markFinished;
- (void)requestDefer;
@end

@implementation SGLongRunningTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deadline, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)markFinished
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  [WeakRetained unregister:self];
}

- (void)requestDefer
{
}

- (BOOL)shouldDefer
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_deferRequested);
  if (v2)
  {
    LOBYTE(deadline) = 1;
  }
  else
  {
    deadline = self->_deadline;
    if (deadline)
    {
      v4 = objc_opt_new();
      LOBYTE(deadline) = [(NSDate *)deadline compare:v4] == NSOrderedAscending;
    }
  }
  return (char)deadline;
}

- (SGLongRunningTask)initWithDeadline:(id)a3 manager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGLongRunningTask;
  v9 = [(SGLongRunningTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deadline, a3);
    objc_storeWeak((id *)&v10->_manager, v8);
  }

  return v10;
}

@end