@interface HDMaintenanceOperation
+ (id)maintenanceOperationWithName:(id)a3 asynchronousBlock:(id)a4;
+ (id)maintenanceOperationWithName:(id)a3 asynchronousBlock:(id)a4 canceledBlock:(id)a5;
+ (id)maintenanceOperationWithName:(id)a3 database:(id)a4 asynchronousBlock:(id)a5;
+ (id)maintenanceOperationWithName:(id)a3 database:(id)a4 asynchronousBlock:(id)a5 canceledBlock:(id)a6;
+ (id)maintenanceOperationWithName:(id)a3 queue:(id)a4 synchronousBlock:(id)a5;
+ (id)maintenanceOperationWithName:(id)a3 queue:(id)a4 synchronousBlock:(id)a5 canceledBlock:(id)a6;
- (BOOL)faultOnTimeout;
- (BOOL)isImmediateRequest;
- (HDMaintenanceOperation)init;
- (HDMaintenanceOperation)initWithName:(id)a3;
- (NSString)name;
- (double)elapsedTime;
- (double)enqueuedTime;
- (double)timeout;
- (double)timeoutTime;
- (id)canceledBlock;
- (id)description;
- (void)cancel;
- (void)finish;
- (void)setCanceledBlock:(id)a3;
- (void)setEnqueuedTime:(double)a3;
- (void)setFaultOnTimeout:(BOOL)a3;
- (void)setTimeout:(double)a3;
- (void)startWithCompletionDelegate:(id)a3 fromImmediateRequest:(BOOL)a4;
@end

@implementation HDMaintenanceOperation

- (HDMaintenanceOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDMaintenanceOperation)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDMaintenanceOperation;
  v5 = [(HDMaintenanceOperation *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 copy];
    name = v6->_name;
    v6->_name = (NSString *)v7;

    v6->_timeout = 900.0;
    *(_WORD *)&v6->_faultOnTimeout = 1;
    id canceledBlock = v6->_canceledBlock;
    v6->_id canceledBlock = 0;
  }
  return v6;
}

+ (id)maintenanceOperationWithName:(id)a3 asynchronousBlock:(id)a4
{
  return (id)[a1 maintenanceOperationWithName:a3 asynchronousBlock:a4 canceledBlock:0];
}

+ (id)maintenanceOperationWithName:(id)a3 asynchronousBlock:(id)a4 canceledBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[_HDMaintenanceWorkCoordinatorAsynchronousOperation alloc] initWithName:v9 operationBlock:v8 canceledBlock:v7];

  return v10;
}

+ (id)maintenanceOperationWithName:(id)a3 queue:(id)a4 synchronousBlock:(id)a5
{
  return (id)[a1 maintenanceOperationWithName:a3 queue:a4 synchronousBlock:a5 canceledBlock:0];
}

+ (id)maintenanceOperationWithName:(id)a3 queue:(id)a4 synchronousBlock:(id)a5 canceledBlock:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[_HDMaintenanceWorkCoordinatorSynchronousOperation alloc] initWithName:v12 queue:v11 block:v10 canceledBlock:v9];

  return v13;
}

+ (id)maintenanceOperationWithName:(id)a3 database:(id)a4 asynchronousBlock:(id)a5
{
  return (id)[a1 maintenanceOperationWithName:a3 database:a4 asynchronousBlock:a5 canceledBlock:0];
}

+ (id)maintenanceOperationWithName:(id)a3 database:(id)a4 asynchronousBlock:(id)a5 canceledBlock:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[_HDMaintenanceWorkCoordinatorProtectedDatabaseOperation alloc] initWithName:v12 database:v11 operationBlock:v10 canceledBlock:v9];

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)startWithCompletionDelegate:(id)a3 fromImmediateRequest:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_hasStarted)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_isImmediateRequest = a4;
    self->_hasStarted = 1;
    objc_storeWeak((id *)&self->_delegate, v6);
    double Current = CFAbsoluteTimeGetCurrent();
    double v8 = Current + self->_timeout;
    self->_startedTime = Current;
    self->_timeoutTime = v8;
    os_unfair_lock_unlock(&self->_lock);
    id v9 = _HKLogPersistedSignposts();
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);

    _HKInitializeLogging();
    id v11 = HKLogInfrastructure();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = @" Immediately";
      if (!self->_isImmediateRequest) {
        id v12 = &stru_1F1728D60;
      }
      int v18 = 138543618;
      v19 = self;
      __int16 v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Started%{public}@.", (uint8_t *)&v18, 0x16u);
    }

    _HKInitializeLogging();
    v13 = _HKLogPersistedSignposts();
    BOOL v14 = os_signpost_enabled(v13);

    if (v14)
    {
      v15 = _HKLogPersistedSignposts();
      v16 = v15;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        v17 = [(HDMaintenanceOperation *)self name];
        int v18 = 138543362;
        v19 = v17;
        _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v10, "maintenance work operation", "name=%{public}@", (uint8_t *)&v18, 0xCu);
      }
    }
    [(HDMaintenanceOperation *)self main];
  }
}

- (void)cancel
{
  (*((void (**)(void))self->_canceledBlock + 2))();

  -[HDMaintenanceOperation finish]((uint64_t)self);
}

- (void)finish
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = _HKLogPersistedSignposts();
    os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, (const void *)a1);

    _HKInitializeLogging();
    id v4 = HKLogInfrastructure();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime v5 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 16);
      int v12 = 138543618;
      uint64_t v13 = a1;
      __int16 v14 = 2048;
      CFAbsoluteTime v15 = v5;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped after %0.3lfs.", (uint8_t *)&v12, 0x16u);
    }

    _HKInitializeLogging();
    id v6 = _HKLogPersistedSignposts();
    BOOL v7 = os_signpost_enabled(v6);

    if (v7)
    {
      double v8 = _HKLogPersistedSignposts();
      id v9 = v8;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        os_signpost_id_t v10 = [(id)a1 name];
        int v12 = 138543362;
        uint64_t v13 = (uint64_t)v10;
        _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v9, OS_SIGNPOST_INTERVAL_END, v3, "maintenance work operation", "name=%{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    *(unsigned char *)(a1 + 49) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_storeWeak((id *)(a1 + 40), 0);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    [WeakRetained operationDidFinish:a1];
  }
}

- (double)timeoutTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_hasStarted) {
    double timeoutTime = self->_timeoutTime;
  }
  else {
    double timeoutTime = CFAbsoluteTimeGetCurrent() + self->_timeout;
  }
  os_unfair_lock_unlock(p_lock);
  return timeoutTime;
}

- (double)elapsedTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_hasStarted) {
    double v4 = CFAbsoluteTimeGetCurrent() - self->_startedTime;
  }
  else {
    double v4 = 0.0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isImmediateRequest) {
    double v4 = @" (Immediate)";
  }
  else {
    double v4 = &stru_1F1728D60;
  }
  CFAbsoluteTime v5 = [NSString stringWithFormat:@"%@%@", self->_name, v4];
  if (self->_hasFinished)
  {
    [NSString stringWithFormat:@"<%@:%p %@ finished>", objc_opt_class(), self, v5, v13, v14];
  }
  else if (self->_hasStarted)
  {
    id v6 = NSString;
    uint64_t v7 = objc_opt_class();
    [v6 stringWithFormat:@"<%@:%p %@ running for %0.3lfs/%0.3lfs>", v7, self, v5, CFAbsoluteTimeGetCurrent() - self->_startedTime, *(void *)&self->_timeout];
  }
  else
  {
    double enqueuedTime = self->_enqueuedTime;
    id v9 = NSString;
    uint64_t v10 = objc_opt_class();
    if (enqueuedTime <= 0.0) {
      [v9 stringWithFormat:@"<%@:%p %@ not enqueued>", v10, self, v5, v13, v14];
    }
    else {
      [v9 stringWithFormat:@"<%@:%p %@ pending for %0.3lfs>", v10, self, v5, CFAbsoluteTimeGetCurrent() - self->_enqueuedTime, v14];
    }
  id v11 = };
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (BOOL)faultOnTimeout
{
  return self->_faultOnTimeout;
}

- (void)setFaultOnTimeout:(BOOL)a3
{
  self->_faultOnTimeout = a3;
}

- (BOOL)isImmediateRequest
{
  return self->_isImmediateRequest;
}

- (double)enqueuedTime
{
  return self->_enqueuedTime;
}

- (void)setEnqueuedTime:(double)a3
{
  self->_double enqueuedTime = a3;
}

- (id)canceledBlock
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setCanceledBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canceledBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_name, 0);
}

@end