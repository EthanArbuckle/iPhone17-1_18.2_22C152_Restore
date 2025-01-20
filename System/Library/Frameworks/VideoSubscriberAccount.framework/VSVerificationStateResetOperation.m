@interface VSVerificationStateResetOperation
- (NSOperationQueue)privateQueue;
- (NSURLSessionTask)resetStateTask;
- (VSAuditToken)auditToken;
- (VSOptional)result;
- (VSVerificationStateResetOperation)init;
- (void)_resetVerificationStateWithURL:(id)a3;
- (void)cancel;
- (void)executionDidBegin;
- (void)setAuditToken:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setResetStateTask:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VSVerificationStateResetOperation

- (VSVerificationStateResetOperation)init
{
  v11.receiver = self;
  v11.super_class = (Class)VSVerificationStateResetOperation;
  v2 = [(VSVerificationStateResetOperation *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    v4 = v2->_result;
    v2->_result = v3;

    v5 = (void *)MEMORY[0x1E4F28F08];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = [v5 queueWithName:v7];
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (NSOperationQueue *)v8;
  }
  return v2;
}

- (void)_resetVerificationStateWithURL:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Resetting verification state with URL %@", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E4F290F0];
  v7 = [(VSVerificationStateResetOperation *)self auditToken];
  uint64_t v8 = objc_msgSend(v6, "vs_defaultSessionConfigurationForSourceAppWithAuditToken:", v7);

  id v9 = objc_alloc_init(MEMORY[0x1E4F4EF78]);
  objc_msgSend(v8, "set_appleIDContext:", v9);

  [v8 setTimeoutIntervalForRequest:30.0];
  v10 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v8 delegate:0 delegateQueue:0];
  objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F290D0]) initWithURL:v4];
  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__VSVerificationStateResetOperation__resetVerificationStateWithURL___block_invoke;
  v13[3] = &unk_1E6BD3180;
  objc_copyWeak(&v14, (id *)buf);
  v12 = [v10 dataTaskWithRequest:v11 completionHandler:v13];
  [(VSVerificationStateResetOperation *)self setResetStateTask:v12];
  [v12 resume];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __68__VSVerificationStateResetOperation__resetVerificationStateWithURL___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v18 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v18)
    {
      id v8 = v18;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v9 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v10 = *MEMORY[0x1E4F1C3C8];
          objc_super v11 = (objc_class *)objc_opt_class();
          v12 = NSStringFromClass(v11);
          [v9 raise:v10, @"Unexpectedly, response was %@, instead of NSHTTPURLResponse.", v12 format];
        }
        unint64_t v13 = [v8 statusCode] - 200;

        if (v13 <= 0x63)
        {
          id v14 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
          uint64_t v15 = +[VSFailable failableWithObject:v14];
LABEL_10:
          id v16 = (void *)v15;
          uint64_t v17 = +[VSOptional optionalWithObject:v15];
          [WeakRetained setResult:v17];

          [WeakRetained finishExecutionIfPossible];
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    VSPrivateError(-15, v6);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = +[VSFailable failableWithError:v14];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)executionDidBegin
{
  v3 = @"gsOtp";
  id v4 = objc_alloc_init(VSAMSBagLoadOperation);
  [(VSAMSBagLoadOperation *)v4 setBagKey:v3];
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__VSVerificationStateResetOperation_executionDidBegin__block_invoke;
  v7[3] = &unk_1E6BD31A8;
  objc_copyWeak(&v9, &from);
  objc_copyWeak(&v10, &location);
  v5 = v3;
  id v8 = v5;
  [(VSAMSBagLoadOperation *)v4 setCompletionBlock:v7];
  id v6 = [(VSVerificationStateResetOperation *)self privateQueue];
  [v6 addOperation:v4];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __54__VSVerificationStateResetOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    v5 = [v3 value];
    id v6 = [v4 error];
    if (v5)
    {
      v7 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v8 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v9 = *MEMORY[0x1E4F1C3C8];
          id v10 = (objc_class *)objc_opt_class();
          objc_super v11 = NSStringFromClass(v10);
          [v8 raise:v9, @"Unexpectedly, value was %@, instead of NSString.", v11 format];
        }
        v7 = v7;
        v12 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
        unint64_t v13 = VSDefaultLogObject();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            uint64_t v15 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            v23 = v12;
            __int16 v24 = 2112;
            v25 = v15;
            _os_log_impl(&dword_1DA674000, v13, OS_LOG_TYPE_DEFAULT, "Did load URL value (%@) for bag key %@", buf, 0x16u);
          }

          [WeakRetained _resetVerificationStateWithURL:v12];
          goto LABEL_20;
        }
        if (v14)
        {
          v19 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v23 = v7;
          __int16 v24 = 2112;
          v25 = v19;
          _os_log_impl(&dword_1DA674000, v13, OS_LOG_TYPE_DEFAULT, "Did load value (%@) for bag key %@ but could not create a URL", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v17 = VSDefaultLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v23 = v7;
          __int16 v24 = 2112;
          v25 = v18;
          _os_log_impl(&dword_1DA674000, v17, OS_LOG_TYPE_DEFAULT, "Did load value (%@) for bag key %@ but it was NOT a string", buf, 0x16u);
        }
      }
    }
    else
    {
      v7 = VSDefaultLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = *(NSObject **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v23 = v16;
        __int16 v24 = 2112;
        v25 = v6;
        _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Did NOT load value for bag key %@: %@", buf, 0x16u);
      }
    }

    v12 = VSPrivateError(-14, v6);
    v20 = +[VSFailable failableWithError:v12];
    v21 = +[VSOptional optionalWithObject:v20];
    [WeakRetained setResult:v21];

    [WeakRetained finishExecutionIfPossible];
LABEL_20:
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VSVerificationStateResetOperation;
  [(VSAsyncOperation *)&v4 cancel];
  id v3 = [(VSVerificationStateResetOperation *)self resetStateTask];
  [v3 cancel];
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSURLSessionTask)resetStateTask
{
  return self->_resetStateTask;
}

- (void)setResetStateTask:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_resetStateTask, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end