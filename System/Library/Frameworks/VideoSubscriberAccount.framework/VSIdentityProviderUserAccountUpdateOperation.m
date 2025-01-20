@interface VSIdentityProviderUserAccountUpdateOperation
- (NSArray)userAccounts;
- (NSError)error;
- (VSIdentityProvider)provider;
- (VSIdentityProviderUserAccountUpdateOperation)initWithIdentityProvider:(id)a3 userAccounts:(id)a4;
- (id)_allowedBundleIDs;
- (void)executionDidBegin;
- (void)setError:(id)a3;
@end

@implementation VSIdentityProviderUserAccountUpdateOperation

- (VSIdentityProviderUserAccountUpdateOperation)initWithIdentityProvider:(id)a3 userAccounts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VSIdentityProviderUserAccountUpdateOperation;
  v9 = [(VSIdentityProviderUserAccountUpdateOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeStrong((id *)&v10->_userAccounts, a4);
  }

  return v10;
}

- (void)executionDidBegin
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = [(VSIdentityProviderUserAccountUpdateOperation *)self userAccounts];
  if ([v2 count])
  {
    v3 = VSDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [v2 count];
      v5 = [(VSIdentityProviderUserAccountUpdateOperation *)self provider];
      *(_DWORD *)buf = 134218242;
      uint64_t v27 = v4;
      __int16 v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "%lu user accounts to write for provider %@", buf, 0x16u);
    }
    v6 = objc_alloc_init(VSUserAccountServiceConnection);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke;
    v24[3] = &unk_1E6BD28B0;
    v24[4] = self;
    v15 = v6;
    id v7 = [(VSUserAccountServiceConnection *)v6 serviceWithErrorHandler:v24];
    id v8 = objc_alloc_init(VSWaitGroup);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v16 = v2;
    id v9 = v2;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
          [(VSWaitGroup *)v8 enter];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_2;
          v18[3] = &unk_1E6BD4180;
          v18[4] = self;
          v18[5] = v14;
          v19 = v8;
          [v7 updateUserAccount:v14 completion:v18];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v11);
    }

    [(VSWaitGroup *)v8 waitWithMilliseconds:0];
    [(VSAsyncOperation *)self finishExecutionIfPossible];

    v2 = v16;
  }
}

void __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_cold_1((uint64_t)v3, v4);
  }

  [*(id *)(a1 + 32) setError:v3];
  [*(id *)(a1 + 32) finishExecutionIfPossible];
}

void __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = VSErrorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_2_cold_1((uint64_t)v3, v4);
    }

    [*(id *)(a1 + 32) setError:v3];
  }
  else
  {
    v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated user account for provider: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 48) leave];
}

- (id)_allowedBundleIDs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(VSIdentityProviderUserAccountUpdateOperation *)self provider];
  v5 = [v4 nonChannelAppDescriptions];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 bundleID];

        if (!v12) {
          [MEMORY[0x1E4F1CA00] raise:v9 format:@"The [appDescription bundleID] parameter must not be nil."];
        }
        uint64_t v13 = [v11 bundleID];
        [v3 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v3;
}

- (VSIdentityProvider)provider
{
  return self->_provider;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSArray)userAccounts
{
  return self->_userAccounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAccounts, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

void __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error with user account service connection: %@", (uint8_t *)&v2, 0xCu);
}

void __65__VSIdentityProviderUserAccountUpdateOperation_executionDidBegin__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error updating user account for provider: %@", (uint8_t *)&v2, 0xCu);
}

@end