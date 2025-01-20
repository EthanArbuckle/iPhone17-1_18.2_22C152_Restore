@interface EXHostSessionDriver
@end

@implementation EXHostSessionDriver

void __51___EXHostSessionDriver_initWithHostViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _EXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __51___EXHostSessionDriver_initWithHostViewController___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  [WeakRetained invalidateDeactivatingSessions];
}

void __49___EXHostSessionDriver_hostSessionDidInvalidate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) retryProcessConfiguration];
  uint64_t v3 = [*(id *)(a1 + 32) retrySessionConfiguration];
  if (WeakRetained)
  {
    if (v2 && v3 != 0) {
      [*(id *)(a1 + 32) startSessionWithProcessConfiguration:v2 configuration:v3];
    }
  }
}

void __51___EXHostSessionDriver_initWithHostViewController___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end