@interface VSDeveloperSettingsFetchOperation
- (VSDeveloperServiceConnection)connection;
- (VSDeveloperSettingsFetchOperation)init;
- (VSOptional)result;
- (void)executionDidBegin;
- (void)setConnection:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VSDeveloperSettingsFetchOperation

- (VSDeveloperSettingsFetchOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSDeveloperSettingsFetchOperation;
  v2 = [(VSDeveloperSettingsFetchOperation *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    v4 = v2->_result;
    v2->_result = v3;
  }
  return v2;
}

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
  v3 = [(VSDeveloperSettingsFetchOperation *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke;
  v8[3] = &unk_1E6BD28B0;
  v8[4] = self;
  v4 = [v3 serviceWithErrorHandler:v8];

  v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Will fetch developer settings.", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke_5;
  v6[3] = &unk_1E6BD28D8;
  v6[4] = self;
  [v4 fetchDeveloperSettingsWithCompletionHandler:v6];
}

uint64_t __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = +[VSFailable failableWithError:a2];
  v5 = +[VSOptional optionalWithObject:v4];
  [v3 setResult:v5];

  objc_super v6 = *(void **)(a1 + 32);

  return [v6 finishExecutionIfPossible];
}

uint64_t __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 unwrapObject:&__block_literal_global_14 error:&__block_literal_global_9_0];
  v4 = *(void **)(a1 + 32);
  v5 = +[VSOptional optionalWithObject:v3];

  [v4 setResult:v5];
  objc_super v6 = *(void **)(a1 + 32);

  return [v6 finishExecutionIfPossible];
}

void __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Did fetch developer settings %@", (uint8_t *)&v4, 0xCu);
  }
}

void __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke_7_cold_1((uint64_t)v2, v3);
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

void __54__VSDeveloperSettingsFetchOperation_executionDidBegin__block_invoke_7_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch developer settings: %@", (uint8_t *)&v2, 0xCu);
}

@end