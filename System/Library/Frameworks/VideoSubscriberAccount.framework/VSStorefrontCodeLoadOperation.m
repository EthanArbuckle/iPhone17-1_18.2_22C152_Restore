@interface VSStorefrontCodeLoadOperation
- (NSOperationQueue)privateQueue;
- (VSOptional)result;
- (VSStorefrontCodeLoadOperation)init;
- (void)executionDidBegin;
- (void)setPrivateQueue:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VSStorefrontCodeLoadOperation

- (VSStorefrontCodeLoadOperation)init
{
  v11.receiver = self;
  v11.super_class = (Class)VSStorefrontCodeLoadOperation;
  v2 = [(VSStorefrontCodeLoadOperation *)&v11 init];
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

- (void)executionDidBegin
{
  v3 = @"countryCode";
  v4 = objc_alloc_init(VSAMSBagLoadOperation);
  [(VSAMSBagLoadOperation *)v4 setBagKey:v3];
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __50__VSStorefrontCodeLoadOperation_executionDidBegin__block_invoke;
  v9 = &unk_1E6BD2880;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  [(VSAMSBagLoadOperation *)v4 setCompletionBlock:&v6];
  v5 = [(VSStorefrontCodeLoadOperation *)self privateQueue];
  [v5 addOperation:v4];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __50__VSStorefrontCodeLoadOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v3) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The value parameter must not be nil."];
    }
    id v4 = v3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v7 = *MEMORY[0x1E4F1C3C8];
      if (!v3) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The value parameter must not be nil."];
      }
      uint64_t v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      [v6 raise:v7, @"Unexpectedly, VSForceUnwrapNullable(value) was %@, instead of NSString.", v9 format];
    }
    if (!v3) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The value parameter must not be nil."];
    }
    id v10 = [v4 lowercaseString];
    uint64_t v11 = +[VSFailable failableWithObject:v10];
  }
  else
  {
    v12 = [WeakRetained error];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      VSPrivateError(-25, 0);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = v14;

    uint64_t v11 = +[VSFailable failableWithError:v10];
  }
  v15 = (void *)v11;
  v16 = +[VSOptional optionalWithObject:v11];
  [v2 setResult:v16];

  [v2 finishExecutionIfPossible];
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
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

  objc_storeStrong((id *)&self->_result, 0);
}

@end