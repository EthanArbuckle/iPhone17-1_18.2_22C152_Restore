@interface AMSMutablePromise
+ (AMSMutablePromise)promiseWithAll:(id)a3;
+ (AMSMutablePromise)promiseWithAll:(id)a3 timeout:(double)a4;
+ (AMSMutablePromise)promiseWithAny:(id)a3;
+ (AMSMutablePromise)promiseWithAny:(id)a3 timeout:(double)a4;
+ (AMSMutablePromise)promiseWithFlattenedPromises:(id)a3;
+ (BOOL)_finishPromise:(id)a3 withResult:(id)a4 error:(id)a5 logDuplicateFinishes:(BOOL)a6;
+ (BOOL)cancelPromise:(id)a3;
+ (BOOL)finishPromise:(id)a3 withError:(id)a4;
+ (BOOL)finishPromise:(id)a3 withPromise:(id)a4;
+ (BOOL)finishPromise:(id)a3 withResult:(id)a4;
+ (BOOL)finishPromise:(id)a3 withResult:(id)a4 error:(id)a5;
+ (void)startTimeoutForPromise:(id)a3 timeout:(double)a4;
- (AMSMutablePromise)initWithTimeout:(double)a3;
- (AMSMutablePromise)promiseWithTimeout:(double)a3;
- (BOOL)cancel;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithPromise:(id)a3;
- (BOOL)finishWithPromiseResult:(id)a3;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (BOOL)finishWithResult:(id)a3 error:(id)a4 logDuplicateFinishes:(BOOL)a5;
- (id)_mutableBinaryPromiseWrappingBinaryPromise:(id)a3;
- (id)_mutablePromiseWrappingPromise:(id)a3;
- (id)catchWithBinaryPromiseBlock:(id)a3;
- (id)catchWithBlock:(id)a3;
- (id)continueWithBinaryPromiseBlock:(id)a3;
- (id)continueWithBlock:(id)a3;
- (id)thenWithBinaryPromiseBlock:(id)a3;
- (id)thenWithBlock:(id)a3;
- (void)startTimeout:(double)a3;
@end

@implementation AMSMutablePromise

- (id)thenWithBlock:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMSMutablePromise;
  v4 = [(AMSPromise *)&v7 thenWithBlock:a3];
  v5 = [(AMSMutablePromise *)self _mutablePromiseWrappingPromise:v4];

  return v5;
}

- (id)continueWithBlock:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMSMutablePromise;
  v4 = [(AMSPromise *)&v7 continueWithBlock:a3];
  v5 = [(AMSMutablePromise *)self _mutablePromiseWrappingPromise:v4];

  return v5;
}

- (id)_mutablePromiseWrappingPromise:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (AMSMutablePromise *)v3;
  }
  else
  {
    v4 = objc_alloc_init(AMSMutablePromise);
    [(AMSMutablePromise *)v4 finishWithPromise:v3];
  }

  return v4;
}

+ (BOOL)finishPromise:(id)a3 withPromise:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v5 isFinished];
  if ((v7 & 1) == 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__AMSMutablePromise_finishPromise_withPromise___block_invoke;
    v12[3] = &unk_1E559E310;
    id v8 = v5;
    id v13 = v8;
    [v6 addSuccessBlock:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__AMSMutablePromise_finishPromise_withPromise___block_invoke_2;
    v10[3] = &unk_1E559F028;
    id v11 = v8;
    [v6 addErrorBlock:v10];
  }
  return v7 ^ 1;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4 logDuplicateFinishes:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  LOBYTE(v5) = [(id)objc_opt_class() _finishPromise:self withResult:v9 error:v8 logDuplicateFinishes:v5];

  return v5;
}

+ (BOOL)_finishPromise:(id)a3 withResult:(id)a4 error:(id)a5 logDuplicateFinishes:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v10 = (os_unfair_lock_s *)a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  id v13 = (void *)v12;
  if (v11 && v12)
  {
    v14 = +[AMSLogConfig sharedPromiseConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138543874;
      id v25 = a1;
      __int16 v26 = 2114;
      unint64_t v27 = v11;
      __int16 v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Someone is finishing a promise with both a result and an error. This will result in both the success and error blocks being called. result = %{public}@ error = %{public}@", (uint8_t *)&v24, 0x20u);
    }
  }
  else if (!(v11 | v12))
  {
    v16 = +[AMSLogConfig sharedPromiseConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138543362;
      id v25 = a1;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Someone is finishing a promise with neither a result nor an error.", (uint8_t *)&v24, 0xCu);
    }

    id v13 = AMSError(2, @"Invalid Parameter", @"Some attempted to finish a promise without a result/error.", 0);
  }
  os_unfair_lock_lock_with_options();
  int v18 = [(os_unfair_lock_s *)v10 isFinishedWithLock];
  if (v18)
  {
    if (v6)
    {
      v19 = +[AMSLogConfig sharedPromiseConfig];
      if (!v19)
      {
        v19 = +[AMSLogConfig sharedConfig];
      }
      v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 138543362;
        id v25 = a1;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEBUG, "%{public}@: Someone is attempting to finish or cancel a finished AMSPromise.", (uint8_t *)&v24, 0xCu);
      }
    }
    os_unfair_lock_unlock(v10 + 2);
  }
  else
  {
    v21 = [[AMSPromiseResult alloc] initWithResult:v11 error:v13];
    [(os_unfair_lock_s *)v10 setPromiseResult:v21];
    v22 = [(os_unfair_lock_s *)v10 condition];
    os_unfair_lock_unlock(v10 + 2);
    if (v22)
    {
      [v22 lock];
      [(os_unfair_lock_s *)v10 setConditionHasSignaled:1];
      [v22 broadcast];
      [v22 unlock];
    }
    [(os_unfair_lock_s *)v10 flushCompletionBlocksWithResult:v21];
    [(os_unfair_lock_s *)v10 stopRetainingSelf];
  }
  return v18 ^ 1;
}

- (BOOL)finishWithPromise:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(id)objc_opt_class() finishPromise:self withPromise:v4];

  return (char)self;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  return [(AMSMutablePromise *)self finishWithResult:a3 error:a4 logDuplicateFinishes:1];
}

BOOL __47__AMSMutablePromise_finishPromise_withPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[AMSMutablePromise finishPromise:*(void *)(a1 + 32) withError:a2];
}

+ (BOOL)finishPromise:(id)a3 withError:(id)a4
{
  return [a1 _finishPromise:a3 withResult:0 error:a4 logDuplicateFinishes:1];
}

+ (BOOL)finishPromise:(id)a3 withResult:(id)a4
{
  return [a1 _finishPromise:a3 withResult:a4 error:0 logDuplicateFinishes:1];
}

BOOL __47__AMSMutablePromise_finishPromise_withPromise___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSMutablePromise finishPromise:*(void *)(a1 + 32) withResult:a2];
}

- (BOOL)finishWithResult:(id)a3
{
  return [(AMSMutablePromise *)self finishWithResult:a3 error:0];
}

- (id)catchWithBlock:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMSMutablePromise;
  id v4 = [(AMSPromise *)&v7 catchWithBlock:a3];
  uint64_t v5 = [(AMSMutablePromise *)self _mutablePromiseWrappingPromise:v4];

  return v5;
}

+ (BOOL)finishPromise:(id)a3 withResult:(id)a4 error:(id)a5
{
  return [a1 _finishPromise:a3 withResult:a4 error:a5 logDuplicateFinishes:1];
}

- (AMSMutablePromise)initWithTimeout:(double)a3
{
  id v4 = [(AMSPromise *)self init];
  uint64_t v5 = v4;
  if (v4) {
    [(AMSMutablePromise *)v4 startTimeout:a3];
  }
  return v5;
}

+ (void)startTimeoutForPromise:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  if (a4 > 0.0)
  {
    objc_initWeak(&location, v6);
    objc_super v7 = dispatch_get_global_queue(17, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__AMSMutablePromise_startTimeoutForPromise_timeout___block_invoke;
    v13[3] = &unk_1E55A3EF0;
    objc_copyWeak(v14, &location);
    v14[1] = a1;
    id v8 = v7;
    id v9 = v13;
    v10 = AMSLogKey();
    if (a4 * 1000000000.0 <= 9.22337204e18) {
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    }
    else {
      dispatch_time_t v11 = -1;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAfter_block_invoke_5;
    block[3] = &unk_1E559EAE0;
    id v17 = v10;
    id v18 = v9;
    id v12 = v10;
    dispatch_after(v11, v8, block);

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
}

- (void)startTimeout:(double)a3
{
  uint64_t v5 = objc_opt_class();
  [v5 startTimeoutForPromise:self timeout:a3];
}

+ (BOOL)cancelPromise:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F281F8];
  id v6 = a3;
  objc_super v7 = [v4 errorWithDomain:v5 code:3072 userInfo:0];
  LOBYTE(a1) = [a1 finishPromise:v6 withResult:0 error:v7];

  return (char)a1;
}

- (AMSMutablePromise)promiseWithTimeout:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSMutablePromise;
  id v3 = [(AMSPromise *)&v5 promiseWithTimeout:a3];
  return (AMSMutablePromise *)v3;
}

- (BOOL)finishWithError:(id)a3
{
  return [(AMSMutablePromise *)self finishWithResult:0 error:a3];
}

- (BOOL)cancel
{
  id v3 = objc_opt_class();
  return [v3 cancelPromise:self];
}

void __52__AMSMutablePromise_startTimeoutForPromise_timeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = AMSError(1, @"Promise Timed Out", 0, 0);
    [*(id *)(a1 + 40) _finishPromise:WeakRetained withResult:0 error:v2 logDuplicateFinishes:0];
  }
}

+ (AMSMutablePromise)promiseWithAll:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AMSMutablePromise;
  id v3 = objc_msgSendSuper2(&v5, sel_promiseWithAll_, a3);
  return (AMSMutablePromise *)v3;
}

+ (AMSMutablePromise)promiseWithAll:(id)a3 timeout:(double)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AMSMutablePromise;
  id v4 = objc_msgSendSuper2(&v6, sel_promiseWithAll_timeout_, a3, a4);
  return (AMSMutablePromise *)v4;
}

+ (AMSMutablePromise)promiseWithAny:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AMSMutablePromise;
  id v3 = objc_msgSendSuper2(&v5, sel_promiseWithAny_, a3);
  return (AMSMutablePromise *)v3;
}

+ (AMSMutablePromise)promiseWithAny:(id)a3 timeout:(double)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AMSMutablePromise;
  id v4 = objc_msgSendSuper2(&v6, sel_promiseWithAny_timeout_, a3, a4);
  return (AMSMutablePromise *)v4;
}

+ (AMSMutablePromise)promiseWithFlattenedPromises:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AMSMutablePromise;
  id v3 = objc_msgSendSuper2(&v5, sel_promiseWithFlattenedPromises_, a3);
  return (AMSMutablePromise *)v3;
}

- (id)catchWithBinaryPromiseBlock:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMSMutablePromise;
  id v4 = [(AMSPromise *)&v7 catchWithBinaryPromiseBlock:a3];
  objc_super v5 = [(AMSMutablePromise *)self _mutableBinaryPromiseWrappingBinaryPromise:v4];

  return v5;
}

- (id)continueWithBinaryPromiseBlock:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMSMutablePromise;
  id v4 = [(AMSPromise *)&v7 continueWithBinaryPromiseBlock:a3];
  objc_super v5 = [(AMSMutablePromise *)self _mutableBinaryPromiseWrappingBinaryPromise:v4];

  return v5;
}

- (id)thenWithBinaryPromiseBlock:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMSMutablePromise;
  id v4 = [(AMSPromise *)&v7 thenWithBinaryPromiseBlock:a3];
  objc_super v5 = [(AMSMutablePromise *)self _mutableBinaryPromiseWrappingBinaryPromise:v4];

  return v5;
}

- (id)_mutableBinaryPromiseWrappingBinaryPromise:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (AMSMutableBinaryPromise *)v3;
  }
  else
  {
    id v4 = objc_alloc_init(AMSMutableBinaryPromise);
    [(AMSMutableBinaryPromise *)v4 finishWithPromise:v3];
  }

  return v4;
}

- (BOOL)finishWithPromiseResult:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 result];
  objc_super v6 = [v4 error];

  LOBYTE(self) = [(AMSMutablePromise *)self finishWithResult:v5 error:v6 logDuplicateFinishes:1];
  return (char)self;
}

@end