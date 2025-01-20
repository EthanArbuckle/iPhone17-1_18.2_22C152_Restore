@interface HDSynchronousTaskGroup
- (HDSynchronousTaskGroup)init;
- (HDSynchronousTaskGroupDelegate)delegate;
- (id)didFinish;
- (int)taskCount;
- (int64_t)beginTask;
- (void)failTaskWithError:(id)a3;
- (void)finishTask;
- (void)setDelegate:(id)a3;
- (void)setDidFinish:(id)a3;
@end

@implementation HDSynchronousTaskGroup

- (HDSynchronousTaskGroup)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDSynchronousTaskGroup;
  result = [(HDSynchronousTaskGroup *)&v3 init];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_success = 1;
  }
  return result;
}

- (int)taskCount
{
  return atomic_load((unsigned int *)&self->_taskCount);
}

- (int64_t)beginTask
{
  return (int)(atomic_fetch_add(&self->_taskCount, 1u) + 1);
}

- (void)failTaskWithError:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  self->_success = 0;
  if (v7)
  {
    errors = self->_errors;
    if (!errors)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v6 = self->_errors;
      self->_errors = v5;

      errors = self->_errors;
    }
    [(NSMutableArray *)errors addObject:v7];
  }
  os_unfair_lock_unlock(&self->_lock);
  [(HDSynchronousTaskGroup *)self finishTask];
}

- (void)finishTask
{
  int add = atomic_fetch_add(&self->_taskCount, 0xFFFFFFFF);
  if (add <= 0)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [(NSMutableArray *)v10 handleFailureInMethod:a2, self, @"HDSynchronousTaskGroup.m", 61, @"Invalid parameter not satisfying: %@", @"resultCount >= 0" object file lineNumber description];
  }
  else
  {
    if (add != 1) {
      return;
    }
    os_unfair_lock_lock(&self->_lock);
    BOOL success = self->_success;
    errors = self->_errors;
    if (!errors) {
      errors = (NSMutableArray *)MEMORY[0x263EFFA68];
    }
    v10 = errors;
    v6 = self->_errors;
    self->_errors = 0;

    self->_BOOL success = 1;
    os_unfair_lock_unlock(&self->_lock);
    id v7 = [(HDSynchronousTaskGroup *)self delegate];
    [v7 synchronousTaskGroup:self didFinishWithSuccess:success errors:v10];

    v8 = [(HDSynchronousTaskGroup *)self didFinish];
    [(HDSynchronousTaskGroup *)self setDidFinish:0];
    if (v8) {
      ((void (**)(void, HDSynchronousTaskGroup *, BOOL, NSMutableArray *))v8)[2](v8, self, success, v10);
    }
  }
}

- (HDSynchronousTaskGroupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSynchronousTaskGroupDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)didFinish
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setDidFinish:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinish, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_errors, 0);
}

@end