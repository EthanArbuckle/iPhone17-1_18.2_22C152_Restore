@interface VSIdentityProviderUserAccountFetchOperation
- (NSArray)results;
- (NSError)error;
- (NSOperationQueue)privateQueue;
- (VSIdentityProvider)provider;
- (VSIdentityProviderUserAccountFetchOperation)initWithIdentityProvider:(id)a3;
- (void)executionDidBegin;
- (void)setError:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation VSIdentityProviderUserAccountFetchOperation

- (VSIdentityProviderUserAccountFetchOperation)initWithIdentityProvider:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VSIdentityProviderUserAccountFetchOperation;
  v6 = [(VSIdentityProviderUserAccountFetchOperation *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_provider, a3);
    v8 = (void *)MEMORY[0x1E4F28F08];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = [v8 queueWithName:v10];
    privateQueue = v7->_privateQueue;
    v7->_privateQueue = (NSOperationQueue *)v11;

    [(NSOperationQueue *)v7->_privateQueue setMaxConcurrentOperationCount:1];
  }

  return v7;
}

- (void)executionDidBegin
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [(VSIdentityProviderUserAccountFetchOperation *)self provider];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = [v2 nonChannelAppDescriptions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = [v10 bundleID];

        if (!v11) {
          [MEMORY[0x1E4F1CA00] raise:v8 format:@"The [appDescription bundleID] parameter must not be nil."];
        }
        v12 = [v10 bundleID];
        [v3 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  v13 = objc_alloc_init(VSUserAccountServiceConnection);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__VSIdentityProviderUserAccountFetchOperation_executionDidBegin__block_invoke;
  v21[3] = &unk_1E6BD28B0;
  v21[4] = self;
  objc_super v14 = [(VSUserAccountServiceConnection *)v13 serviceWithErrorHandler:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__VSIdentityProviderUserAccountFetchOperation_executionDidBegin__block_invoke_5;
  v18[3] = &unk_1E6BD3FC0;
  v18[4] = self;
  id v19 = v2;
  id v20 = v3;
  id v15 = v3;
  id v16 = v2;
  [v14 queryUserAccountsWithOptions:0 completion:v18];
}

void __64__VSIdentityProviderUserAccountFetchOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_cold_1((uint64_t)v3, v4);
  }

  [*(id *)(a1 + 32) setError:v3];
  [*(id *)(a1 + 32) finishExecutionIfPossible];
}

void __64__VSIdentityProviderUserAccountFetchOperation_executionDidBegin__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__VSIdentityProviderUserAccountFetchOperation_executionDidBegin__block_invoke_5_cold_1((uint64_t)v6, v7);
    }

    [*(id *)(a1 + 32) setError:v6];
    [*(id *)(a1 + 32) finishExecutionIfPossible];
  }
  else
  {
    uint64_t v23 = a1;
    uint64_t v8 = [*(id *)(a1 + 40) providerID];
    v9 = [v8 forceUnwrapObject];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v22 = v5;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v16 sourceType] == 2)
          {
            v17 = [v16 sourceIdentifier];
            int v18 = [v17 isEqual:v9];
          }
          else
          {
            int v18 = 0;
          }
          if ([v16 sourceType])
          {
            int v19 = 0;
          }
          else
          {
            id v20 = *(void **)(v23 + 48);
            v21 = [v16 sourceIdentifier];
            int v19 = [v20 containsObject:v21];
          }
          if ((v18 | v19) == 1) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    [*(id *)(v23 + 32) setResults:v10];
    [*(id *)(v23 + 32) finishExecutionIfPossible];

    id v6 = 0;
    id v5 = v22;
  }
}

- (VSIdentityProvider)provider
{
  return self->_provider;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
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
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

void __64__VSIdentityProviderUserAccountFetchOperation_executionDidBegin__block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error fetching user accounts: %@", (uint8_t *)&v2, 0xCu);
}

@end