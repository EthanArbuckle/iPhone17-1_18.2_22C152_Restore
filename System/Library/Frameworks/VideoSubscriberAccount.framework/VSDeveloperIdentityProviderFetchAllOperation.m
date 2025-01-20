@interface VSDeveloperIdentityProviderFetchAllOperation
- (VSDeveloperServiceConnection)connection;
- (VSOptional)result;
- (void)executionDidBegin;
- (void)setConnection:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VSDeveloperIdentityProviderFetchAllOperation

- (VSDeveloperServiceConnection)connection
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_connection;
  if (!v3)
  {
    v3 = objc_alloc_init(VSDeveloperServiceConnection);
    objc_storeStrong((id *)&v2->_connection, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (void)executionDidBegin
{
  objc_initWeak(&location, self);
  v3 = [(VSDeveloperIdentityProviderFetchAllOperation *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke;
  v9[3] = &unk_1E6BD2928;
  objc_copyWeak(&v10, &location);
  v4 = [v3 serviceWithErrorHandler:v9];

  v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Will fetch developer identity providers.", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_5;
  v6[3] = &unk_1E6BD3D50;
  objc_copyWeak(&v7, &location);
  [v4 fetchDeveloperIdentityProvidersWithCompletionHandler:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke_cold_1((uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = +[VSFailable failableWithError:v3];
  id v7 = +[VSOptional optionalWithObject:v6];
  [WeakRetained setResult:v7];

  [WeakRetained finishExecutionIfPossible];
}

void __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 unwrapObject:&__block_literal_global_32 error:&__block_literal_global_10_0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = +[VSOptional optionalWithObject:v3];

  [WeakRetained setResult:v4];
  [WeakRetained finishExecutionIfPossible];
}

void __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Did fetch developer %@ identity providers.", (uint8_t *)&v5, 0xCu);
  }
}

void __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_8_cold_1((uint64_t)v2, v3);
  }
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

void __65__VSDeveloperIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_8_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch developer identity providers: %@", (uint8_t *)&v2, 0xCu);
}

@end