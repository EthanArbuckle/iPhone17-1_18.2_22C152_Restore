@interface FPItemOperationLocator
@end

@implementation FPItemOperationLocator

uint64_t __55__FPItemOperationLocator_Daemon__startAccessingLocator__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
}

void __69__FPItemOperationLocator_Daemon__annotateWithPersonaSandboxIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__FPItemOperationLocator_Daemon__annotateWithPersonaSandboxIfNeeded___block_invoke_cold_1(a1, (uint64_t)v5, v7);
    }
  }
  v8 = [v6 url];
  v9 = [*(id *)(a1 + 32) asFPItem];
  [v9 setFileURL:v8];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__FPItemOperationLocator_Daemon__annotateWithPersonaSandboxIfNeeded___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 32) asFPItem];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] can't get url for item %@, %@", (uint8_t *)&v6, 0x16u);
}

@end