@interface AMSLazyPromise
- (AMSLazyPromise)initWithBlock:(id)a3;
- (AMSLazyPromise)initWithPromiseResult:(id)a3;
- (AMSLazyPromise)initWithTimeout:(double)a3 block:(id)a4;
- (BOOL)_runBlock;
- (BOOL)executedBlock;
- (double)timeout;
- (id)block;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (id)resultWithError:(id *)a3;
- (id)resultWithTimeout:(double)a3 error:(id *)a4;
- (id)valueFromAddingBlock:(id)a3 orCallWithResult:(id)a4;
- (void)addBlock:(id)a3 orCallWithResult:(id)a4;
- (void)addErrorBlock:(id)a3;
- (void)addFinishBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)setBlock:(id)a3;
- (void)setExecutedBlock:(BOOL)a3;
- (void)setTimeout:(double)a3;
@end

@implementation AMSLazyPromise

- (id)valueFromAddingBlock:(id)a3 orCallWithResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AMSLazyPromise *)self _runBlock];
  v10.receiver = self;
  v10.super_class = (Class)AMSLazyPromise;
  v8 = [(AMSPromise *)&v10 valueFromAddingBlock:v7 orCallWithResult:v6];

  return v8;
}

- (void)addFinishBlock:(id)a3
{
  id v4 = a3;
  [(AMSLazyPromise *)self _runBlock];
  v5.receiver = self;
  v5.super_class = (Class)AMSLazyPromise;
  [(AMSPromise *)&v5 addFinishBlock:v4];
}

- (void).cxx_destruct
{
}

- (void)addErrorBlock:(id)a3
{
  id v4 = a3;
  [(AMSLazyPromise *)self _runBlock];
  v5.receiver = self;
  v5.super_class = (Class)AMSLazyPromise;
  [(AMSPromise *)&v5 addErrorBlock:v4];
}

- (void)addBlock:(id)a3 orCallWithResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AMSLazyPromise *)self _runBlock];
  v8.receiver = self;
  v8.super_class = (Class)AMSLazyPromise;
  [(AMSPromise *)&v8 addBlock:v7 orCallWithResult:v6];
}

- (BOOL)_runBlock
{
  p_stateLock = &self->super._stateLock;
  os_unfair_lock_lock_with_options();
  if ([(AMSPromise *)self isFinishedWithLock] || *(&self->_executedBlock + 4))
  {
    os_unfair_lock_unlock(p_stateLock);
    return 0;
  }
  else
  {
    BOOL v4 = 1;
    *(&self->_executedBlock + 4) = 1;
    os_unfair_lock_unlock(p_stateLock);
    [(AMSLazyPromise *)self timeout];
    +[AMSMutablePromise startTimeoutForPromise:timeout:](AMSMutablePromise, "startTimeoutForPromise:timeout:", self);
    objc_super v5 = [(AMSLazyPromise *)self block];
    ((void (**)(void, AMSLazyPromise *))v5)[2](v5, self);
  }
  return v4;
}

- (double)timeout
{
  return self->_timeout;
}

- (id)block
{
  return self->_block;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(AMSLazyPromise *)self _runBlock];
  v9.receiver = self;
  v9.super_class = (Class)AMSLazyPromise;
  id v7 = [(AMSPromise *)&v9 resultBeforeDate:v6 error:a4];

  return v7;
}

- (AMSLazyPromise)initWithBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AMSLazyPromise;
  id v6 = [(AMSPromise *)&v26 init];
  id v7 = v6;
  if (v6)
  {
    v6->_timeout = 0.0;
    if (v5)
    {
      uint64_t v8 = [v5 copy];
      block = v7->_block;
      v7->_block = (id)v8;
    }
    else
    {
      BOOL v10 = +[AMSUnitTests isRunningUnitTests];
      uint64_t v11 = +[AMSLogConfig sharedPromiseConfig];
      v12 = (void *)v11;
      if (v10)
      {
        if (!v11)
        {
          v12 = +[AMSLogConfig sharedConfig];
        }
        v13 = [v12 OSLogObject];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = AMSLogKey();
          v15 = NSString;
          uint64_t v16 = objc_opt_class();
          uint64_t v17 = v16;
          if (v14)
          {
            uint64_t v3 = AMSLogKey();
            [v15 stringWithFormat:@"%@: [%@] ", v17, v3];
          }
          else
          {
            [v15 stringWithFormat:@"%@: ", v16];
          v18 = };
          *(_DWORD *)buf = 138543362;
          v28 = v18;
          _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@An AMSLazyPromise instance was unexpectedly initialized without a block. It will fail immediately with an error.", buf, 0xCu);
          if (v14)
          {

            v18 = (void *)v3;
          }
        }
        v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v19 = +[AMSLogConfig sharedPromiseConfig];
        [v12 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v19 userInfo:0];
      }
      else
      {
        if (!v11)
        {
          v12 = +[AMSLogConfig sharedConfig];
        }
        v19 = [v12 OSLogObject];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          v20 = AMSLogKey();
          v21 = NSString;
          uint64_t v22 = objc_opt_class();
          uint64_t v23 = v22;
          if (v20)
          {
            uint64_t v3 = AMSLogKey();
            [v21 stringWithFormat:@"%@: [%@] ", v23, v3];
          }
          else
          {
            [v21 stringWithFormat:@"%@: ", v22];
          v24 = };
          *(_DWORD *)buf = 138543362;
          v28 = v24;
          _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_FAULT, "%{public}@An AMSLazyPromise instance was unexpectedly initialized without a block. It will fail immediately with an error.", buf, 0xCu);
          if (v20)
          {

            v24 = (void *)v3;
          }
        }
      }

      block = [MEMORY[0x1E4F28C58] errorWithDomain:@"AMSErrorDomain" code:2 userInfo:0];
      +[AMSMutablePromise finishPromise:v7 withError:block];
    }
  }
  return v7;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  [(AMSLazyPromise *)self _runBlock];
  v9.receiver = self;
  v9.super_class = (Class)AMSLazyPromise;
  id v7 = [(AMSPromise *)&v9 resultWithTimeout:a4 error:a3];
  return v7;
}

- (AMSLazyPromise)initWithTimeout:(double)a3 block:(id)a4
{
  result = [(AMSLazyPromise *)self initWithBlock:a4];
  if (result) {
    result->_timeout = a3;
  }
  return result;
}

- (void)addSuccessBlock:(id)a3
{
  id v4 = a3;
  [(AMSLazyPromise *)self _runBlock];
  v5.receiver = self;
  v5.super_class = (Class)AMSLazyPromise;
  [(AMSPromise *)&v5 addSuccessBlock:v4];
}

- (AMSLazyPromise)initWithPromiseResult:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__AMSLazyPromise_initWithPromiseResult___block_invoke;
  v8[3] = &unk_1E55A3518;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(AMSLazyPromise *)self initWithBlock:v8];

  return v6;
}

uint64_t __40__AMSLazyPromise_initWithPromiseResult___block_invoke(uint64_t a1, void *a2)
{
  return [a2 finishWithPromiseResult:*(void *)(a1 + 32)];
}

- (BOOL)executedBlock
{
  v2 = self;
  p_stateLock = &self->super._stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_executedBlock + 4);
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (id)resultWithError:(id *)a3
{
  [(AMSLazyPromise *)self _runBlock];
  v7.receiver = self;
  v7.super_class = (Class)AMSLazyPromise;
  id v5 = [(AMSPromise *)&v7 resultWithError:a3];
  return v5;
}

- (void)setExecutedBlock:(BOOL)a3
{
  *(&self->_executedBlock + 4) = a3;
}

- (void)setBlock:(id)a3
{
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

@end