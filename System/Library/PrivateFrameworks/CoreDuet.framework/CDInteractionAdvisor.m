@interface CDInteractionAdvisor
@end

@implementation CDInteractionAdvisor

void __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "XPC Error: %@", v2, v3, v4, v5, v6);
}

uint64_t __49___CDInteractionAdvisor_sharedInteractionAdvisor__block_invoke()
{
  v0 = [[_CDInteractionAdvisor alloc] initWithServiceName:@"com.apple.coreduetd.people"];
  uint64_t v1 = sharedInteractionAdvisor_advisor;
  sharedInteractionAdvisor_advisor = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) setError:v3];
}

void __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_7(uint64_t a1, void *a2)
{
}

void __57___CDInteractionAdvisor_adviseInteractionsUsingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) setError:v3];
}

void __57___CDInteractionAdvisor_adviseInteractionsUsingSettings___block_invoke_9(uint64_t a1, void *a2)
{
}

void __65___CDInteractionAdvisor_adviseInteractionsForDate_usingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) setError:v3];
}

void __65___CDInteractionAdvisor_adviseInteractionsForDate_usingSettings___block_invoke_18(uint64_t a1, void *a2)
{
}

void __87___CDInteractionAdvisor_adviseSocialInteractionsForDate_andSeedContacts_usingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) setError:v3];
}

void __87___CDInteractionAdvisor_adviseSocialInteractionsForDate_andSeedContacts_usingSettings___block_invoke_19(uint64_t a1, void *a2)
{
}

void __77___CDInteractionAdvisor_adviseInteractionsForKeywordsInString_usingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) setError:v3];
}

void __77___CDInteractionAdvisor_adviseInteractionsForKeywordsInString_usingSettings___block_invoke_20(uint64_t a1, void *a2)
{
}

void __73___CDInteractionAdvisor_tuneSocialAdvisorUsingSettings_heartBeatHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) setError:v3];
}

@end