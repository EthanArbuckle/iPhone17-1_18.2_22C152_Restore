@interface SKHandleInvalidReceiptRequest
- (void)_start;
@end

@implementation SKHandleInvalidReceiptRequest

- (void)_start
{
  v3 = +[SKServiceBroker defaultBroker];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__SKHandleInvalidReceiptRequest__start__block_invoke;
  v6[3] = &unk_1E5FA9938;
  v6[4] = self;
  v4 = [v3 storeKitSynchronousServiceWithErrorHandler:v6];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SKHandleInvalidReceiptRequest__start__block_invoke_35;
  v5[3] = &unk_1E5FA9A08;
  v5[4] = self;
  [v4 handleInvalidReceipt:v5];
}

void __39__SKHandleInvalidReceiptRequest__start__block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __39__SKHandleInvalidReceiptRequest__start__block_invoke_cold_1(a1, a2);
  }
}

void __39__SKHandleInvalidReceiptRequest__start__block_invoke_35(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = 138543362;
    uint64_t v4 = v2;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Terminated due to invalid receipt.", (uint8_t *)&v3, 0xCu);
  }
}

void __39__SKHandleInvalidReceiptRequest__start__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543618;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Error in remote proxy while terminating for invalid receipt: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end