@interface AMSFinishedPromise
+ (BOOL)_errorIsCanceledError:(id)a3;
+ (BOOL)_errorIsTimeOutError:(id)a3;
+ (id)promiseWithError:(id)a3;
+ (id)promiseWithPromiseResult:(id)a3;
+ (id)promiseWithResult:(id)a3;
+ (void)logUnavailableInitWithSelector:(SEL)a3;
- (AMSFinishedPromise)init;
- (AMSFinishedPromise)initWithTimeout:(double)a3;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isFinishedWithLock;
- (id)BOOLCompletionHandlerAdapter;
- (id)binaryPromiseAdapterForClass:(Class)a3;
- (id)completionHandlerAdapter;
- (id)condition;
- (id)continueWithBlock:(id)a3;
- (id)nilValueCompletionHandlerAdapter;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (id)resultWithError:(id *)a3;
- (id)valueFromAddingBlock:(id)a3 orCallWithResult:(id)a4;
- (void)addBlock:(id)a3 orCallWithResult:(id)a4;
- (void)addErrorBlock:(id)a3;
- (void)addFinishBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)resultBeforeDate:(id)a3 completion:(id)a4;
- (void)resultWithCompletion:(id)a3;
@end

@implementation AMSFinishedPromise

+ (id)promiseWithResult:(id)a3
{
  id v4 = a3;
  if ((id)*MEMORY[0x1E4F1CFD0] == v4 && (id)objc_opt_class() == a1)
  {
    if (_MergedGlobals_108 != -1) {
      dispatch_once(&_MergedGlobals_108, &__block_literal_global_60);
    }
    id v7 = (id)qword_1EB38D8F0;
  }
  else
  {
    id v5 = objc_alloc((Class)a1);
    v6 = [[AMSPromiseResult alloc] initWithResult:v4 error:0];
    id v7 = (id)[v5 initWithPromiseResult:v6];
  }
  return v7;
}

- (void)addFinishBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  id v7 = [(AMSPromise *)self promiseResult];
  id v5 = [v7 result];
  v6 = [v7 error];
  v4[2](v4, v5, v6);
}

- (void)addErrorBlock:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  id v4 = [(AMSPromise *)self promiseResult];
  id v5 = [v4 error];

  if (v5) {
    v6[2](v6, v5);
  }
}

- (void)addSuccessBlock:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  id v4 = [(AMSPromise *)self promiseResult];
  id v5 = [v4 result];

  if (v5) {
    v6[2](v6, v5);
  }
}

- (id)continueWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  id v5 = [(AMSPromise *)self promiseResult];
  v6 = [v5 result];
  id v7 = [v5 error];
  v8 = v4[2](v4, v6, v7);

  return v8;
}

- (void)addBlock:(id)a3 orCallWithResult:(id)a4
{
  id v6 = a4;
  id v7 = [(AMSPromise *)self promiseResult];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (id)binaryPromiseAdapterForClass:(Class)a3
{
  id v4 = [(AMSPromise *)self promiseResult];
  id v5 = [v4 result];

  if (v5)
  {
    id v6 = [(objc_class *)a3 promiseWithSuccess];
  }
  else
  {
    id v7 = [v4 error];
    id v6 = [(objc_class *)a3 promiseWithError:v7];
  }
  return v6;
}

+ (id)promiseWithError:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [[AMSPromiseResult alloc] initWithResult:0 error:v4];

  id v7 = (void *)[v5 initWithPromiseResult:v6];
  return v7;
}

- (BOOL)isFinished
{
  return 1;
}

- (void)resultWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  id v7 = [(AMSPromise *)self promiseResult];
  id v5 = [v7 result];
  id v6 = [v7 error];
  v4[2](v4, v5, v6);
}

- (id)resultWithError:(id *)a3
{
  id v4 = [(AMSPromise *)self promiseResult];
  id v5 = [v4 error];

  if (a3 && v5)
  {
    *a3 = [v4 error];
  }
  id v6 = [v4 result];

  return v6;
}

+ (id)promiseWithPromiseResult:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithPromiseResult:v4];

  return v5;
}

void __40__AMSFinishedPromise_promiseWithResult___block_invoke()
{
  v0 = [AMSFinishedPromise alloc];
  v1 = [AMSPromiseResult alloc];
  id v4 = [(AMSPromiseResult *)v1 initWithResult:MEMORY[0x1E4F1CC38] error:0];
  uint64_t v2 = [(AMSPromise *)v0 initWithPromiseResult:v4];
  v3 = (void *)qword_1EB38D8F0;
  qword_1EB38D8F0 = v2;
}

+ (void)logUnavailableInitWithSelector:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = AMSLogKey();
    v8 = NSString;
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = v9;
    if (v7)
    {
      AMSLogKey();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      [v8 stringWithFormat:@"%@: [%@] ", v10, a1];
    }
    else
    {
      [v8 stringWithFormat:@"%@: ", v9];
    v11 = };
    v12 = NSStringFromSelector(a3);
    *(_DWORD *)buf = 138543618;
    v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Attempt to initialize AMSFinishedPromise using %@. A mutable promise will be returned instead.", buf, 0x16u);
    if (v7)
    {

      v11 = a1;
    }
  }
}

- (AMSFinishedPromise)init
{
  +[AMSFinishedPromise logUnavailableInitWithSelector:a2];
  v3 = objc_alloc_init(AMSMutablePromise);

  return v3;
}

- (AMSFinishedPromise)initWithTimeout:(double)a3
{
  +[AMSFinishedPromise logUnavailableInitWithSelector:a2];
  id v5 = [[AMSMutablePromise alloc] initWithTimeout:a3];

  return v5;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  return [(AMSFinishedPromise *)self resultWithError:a4];
}

- (void)resultBeforeDate:(id)a3 completion:(id)a4
{
}

- (id)valueFromAddingBlock:(id)a3 orCallWithResult:(id)a4
{
  id v6 = a4;
  id v7 = [(AMSPromise *)self promiseResult];
  v8 = (*((void (**)(id, void *))a4 + 2))(v6, v7);

  return v8;
}

- (BOOL)isFinishedWithLock
{
  return 1;
}

- (BOOL)isCancelled
{
  v3 = objc_opt_class();
  id v4 = [(AMSPromise *)self promiseResult];
  id v5 = [v4 error];
  LOBYTE(v3) = [v3 _errorIsCanceledError:v5];

  return (char)v3;
}

+ (BOOL)_errorIsCanceledError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v5 = [v3 code] == 3072;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)_errorIsTimeOutError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:@"AMSErrorDomain"]) {
    BOOL v5 = [v3 code] == 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)condition
{
  return 0;
}

- (id)BOOLCompletionHandlerAdapter
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = AMSLogKey();
    id v6 = NSString;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = v7;
    if (v5)
    {
      AMSLogKey();
      self = (AMSFinishedPromise *)objc_claimAutoreleasedReturnValue();
      [v6 stringWithFormat:@"%@: [%@] ", v8, self];
    }
    else
    {
      [v6 stringWithFormat:@"%@: ", v7];
    uint64_t v9 = };
    *(_DWORD *)buf = 138543362;
    v12 = v9;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@Attempted to get a completion handler for an already-finished promise, which will have no effect when called.", buf, 0xCu);
    if (v5)
    {

      uint64_t v9 = self;
    }
  }
  return &__block_literal_global_11;
}

- (id)completionHandlerAdapter
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = AMSLogKey();
    id v6 = NSString;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = v7;
    if (v5)
    {
      AMSLogKey();
      self = (AMSFinishedPromise *)objc_claimAutoreleasedReturnValue();
      [v6 stringWithFormat:@"%@: [%@] ", v8, self];
    }
    else
    {
      [v6 stringWithFormat:@"%@: ", v7];
    uint64_t v9 = };
    *(_DWORD *)buf = 138543362;
    v12 = v9;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@Attempted to get a completion handler for an already-finished promise, which will have no effect when called.", buf, 0xCu);
    if (v5)
    {

      uint64_t v9 = self;
    }
  }
  return &__block_literal_global_14;
}

- (id)nilValueCompletionHandlerAdapter
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = AMSLogKey();
    id v6 = NSString;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = v7;
    if (v5)
    {
      AMSLogKey();
      self = (AMSFinishedPromise *)objc_claimAutoreleasedReturnValue();
      [v6 stringWithFormat:@"%@: [%@] ", v8, self];
    }
    else
    {
      [v6 stringWithFormat:@"%@: ", v7];
    uint64_t v9 = };
    *(_DWORD *)buf = 138543362;
    v12 = v9;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@Attempted to get a completion handler for an already-finished promise, which will have no effect when called.", buf, 0xCu);
    if (v5)
    {

      uint64_t v9 = self;
    }
  }
  return &__block_literal_global_16;
}

@end