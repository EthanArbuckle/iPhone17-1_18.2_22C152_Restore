@interface HKAsynchronousOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (HKAsynchronousOperation)init;
- (HKAsynchronousOperation)initWithName:(id)a3 operationBlock:(id)a4;
- (id)_isExecutingKeyPath;
- (id)_isFinishedKeyPath;
- (void)_operationDidFinish;
- (void)_operationDidStart;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation HKAsynchronousOperation

- (HKAsynchronousOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKAsynchronousOperation)initWithName:(id)a3 operationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKAsynchronousOperation;
  v8 = [(HKAsynchronousOperation *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(HKAsynchronousOperation *)v8 setName:v6];
    uint64_t v10 = [v7 copy];
    id operationBlock = v9->_operationBlock;
    v9->_id operationBlock = (id)v10;

    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_finished = 0;
    v9->_executing = 0;
    v12 = -[HKAsynchronousOperation _isExecutingKeyPath](v9);
    [(HKAsynchronousOperation *)v9 addObserver:v9 forKeyPath:v12 options:3 context:HKAsynchronousOperationSelfObservingContext];
  }
  return v9;
}

- (id)_isExecutingKeyPath
{
  if (a1)
  {
    a1 = NSStringFromSelector(sel_isExecuting);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)dealloc
{
  v3 = -[HKAsynchronousOperation _isExecutingKeyPath](self);
  [(HKAsynchronousOperation *)self removeObserver:self forKeyPath:v3 context:HKAsynchronousOperationSelfObservingContext];

  v4.receiver = self;
  v4.super_class = (Class)HKAsynchronousOperation;
  [(HKAsynchronousOperation *)&v4 dealloc];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  v3 = -[HKAsynchronousOperation _isExecutingKeyPath](self);
  objc_super v4 = -[HKAsynchronousOperation _isFinishedKeyPath](self);
  [(HKAsynchronousOperation *)self willChangeValueForKey:v3];
  [(HKAsynchronousOperation *)self setExecuting:1];
  [(HKAsynchronousOperation *)self didChangeValueForKey:v3];
  id operationBlock = self->_operationBlock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__HKAsynchronousOperation_start__block_invoke;
  v9[3] = &unk_1E58BB9C8;
  v9[4] = self;
  id v10 = v3;
  id v11 = v4;
  id v6 = (void (*)(void *, void *))operationBlock[2];
  id v7 = v4;
  id v8 = v3;
  v6(operationBlock, v9);
}

- (id)_isFinishedKeyPath
{
  if (a1)
  {
    a1 = NSStringFromSelector(sel_isFinished);
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t __32__HKAsynchronousOperation_start__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) willChangeValueForKey:*(void *)(a1 + 48)];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 260));
  *(unsigned char *)(*(void *)(a1 + 32) + 257) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 256) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 260));
  [*(id *)(a1 + 32) didChangeValueForKey:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 didChangeValueForKey:v3];
}

- (BOOL)isExecuting
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_executing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setExecuting:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_executing = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isFinished
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFinished:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_finished = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)HKAsynchronousOperationSelfObservingContext == a6)
  {
    uint64_t v11 = *MEMORY[0x1E4F284E0];
    id v12 = a5;
    v13 = [v12 objectForKeyedSubscript:v11];
    int v14 = [v13 BOOLValue];

    v15 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];

    int v16 = [v15 BOOLValue];
    if (v14 != v16)
    {
      if (v16)
      {
        -[HKAsynchronousOperation _operationDidStart]((CFAbsoluteTime *)self);
      }
      else
      {
        -[HKAsynchronousOperation _operationDidFinish]((double *)self);
      }
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HKAsynchronousOperation;
    id v10 = a5;
    [(HKAsynchronousOperation *)&v17 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (void)_operationDidStart
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = _HKLogPersistedSignposts();
    os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, a1);

    _HKInitializeLogging();
    objc_super v4 = HKLogInfrastructure();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (v5)
    {
      id v6 = HKLogInfrastructure();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v12 = 138543362;
        v13 = a1;
        _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_INFO, "%{public}@: Started.", (uint8_t *)&v12, 0xCu);
      }
    }
    _HKInitializeLogging();
    id v7 = _HKLogPersistedSignposts();
    BOOL v8 = os_signpost_enabled(v7);

    if (v8)
    {
      v9 = _HKLogPersistedSignposts();
      id v10 = v9;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        uint64_t v11 = [(CFAbsoluteTime *)a1 name];
        int v12 = 138543362;
        v13 = v11;
        _os_signpost_emit_with_name_impl(&dword_19C023000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v3, "HKAsynchronousOperation", "name=%{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
    a1[33] = CFAbsoluteTimeGetCurrent();
  }
}

- (void)_operationDidFinish
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = _HKLogPersistedSignposts();
    os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, a1);

    _HKInitializeLogging();
    objc_super v4 = HKLogInfrastructure();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (v5)
    {
      id v6 = HKLogInfrastructure();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        CFAbsoluteTime v7 = CFAbsoluteTimeGetCurrent() - a1[33];
        int v13 = 138543618;
        uint64_t v14 = a1;
        __int16 v15 = 2048;
        CFAbsoluteTime v16 = v7;
        _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_INFO, "%{public}@: Stopped after %0.3lfs.", (uint8_t *)&v13, 0x16u);
      }
    }
    _HKInitializeLogging();
    BOOL v8 = _HKLogPersistedSignposts();
    BOOL v9 = os_signpost_enabled(v8);

    if (v9)
    {
      id v10 = _HKLogPersistedSignposts();
      uint64_t v11 = v10;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        int v12 = [a1 name];
        int v13 = 138543362;
        uint64_t v14 = v12;
        _os_signpost_emit_with_name_impl(&dword_19C023000, v11, OS_SIGNPOST_INTERVAL_END, v3, "HKAsynchronousOperation", "name=%{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end