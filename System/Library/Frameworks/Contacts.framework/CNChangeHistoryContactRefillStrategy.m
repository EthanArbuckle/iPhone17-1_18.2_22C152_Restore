@interface CNChangeHistoryContactRefillStrategy
@end

@implementation CNChangeHistoryContactRefillStrategy

void __70___CNChangeHistoryContactRefillStrategy_fetchContactsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 identifier];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v5 = +[CNChangeHistoryTriageLogger log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __70___CNChangeHistoryContactRefillStrategy_fetchContactsWithIdentifiers___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
}

void __70___CNChangeHistoryContactRefillStrategy_fetchContactsWithIdentifiers___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1909E3000, a2, OS_LOG_TYPE_FAULT, "Contact has empty identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end