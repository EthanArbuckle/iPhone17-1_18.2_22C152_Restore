@interface SFAppAutoFillPasswordViewController
@end

@implementation SFAppAutoFillPasswordViewController

void __72___SFAppAutoFillPasswordViewController__connectToServiceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v8 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __72___SFAppAutoFillPasswordViewController__connectToServiceWithCompletion___block_invoke_cold_2(a1, v9, (uint64_t)v6);
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 992), a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "setDelegate:");
    v10 = [*(id *)(*(void *)(a1 + 32) + 992) serviceViewControllerProxy];
    [*(id *)(*(void *)(a1 + 32) + 1000) setTarget:v10];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    __72___SFAppAutoFillPasswordViewController__connectToServiceWithCompletion___block_invoke_cold_1(v9, v7);
  }
}

uint64_t __102___SFAppAutoFillPasswordViewController_authenticateToPresentInPopover_savedAccountContext_completion___block_invoke(uint64_t a1, char a2)
{
  v4 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __102___SFAppAutoFillPasswordViewController_authenticateToPresentInPopover_savedAccountContext_completion___block_invoke_cold_1(a1, a2, v4);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72___SFAppAutoFillPasswordViewController__connectToServiceWithCompletion___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_fault_impl(&dword_1A690B000, v3, OS_LOG_TYPE_FAULT, "Failed to get remote password picker view controller with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

void __72___SFAppAutoFillPasswordViewController__connectToServiceWithCompletion___block_invoke_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = a2;
  int v6 = 134218498;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = objc_opt_class();
  __int16 v10 = 2048;
  uint64_t v11 = a3;
  _os_log_debug_impl(&dword_1A690B000, v5, OS_LOG_TYPE_DEBUG, "In-process view controller %p got remote password picker view controller %{public}@ <%p>", (uint8_t *)&v6, 0x20u);
}

void __102___SFAppAutoFillPasswordViewController_authenticateToPresentInPopover_savedAccountContext_completion___block_invoke_cold_1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2 & 1;
  _os_log_debug_impl(&dword_1A690B000, log, OS_LOG_TYPE_DEBUG, "In-process view controller %p got authentication result %d ", (uint8_t *)&v4, 0x12u);
}

@end