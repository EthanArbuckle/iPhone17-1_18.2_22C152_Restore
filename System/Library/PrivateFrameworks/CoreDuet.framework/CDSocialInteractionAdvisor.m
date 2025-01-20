@interface CDSocialInteractionAdvisor
@end

@implementation CDSocialInteractionAdvisor

void __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke_147(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v3 = *(float *)(a2 + 4);
  float v4 = *(float *)(a3 + 4);
  if (v3 <= v4) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = -1;
  }
  if (v3 < v4) {
    return 1;
  }
  else {
    return v5;
  }
}

void __87___CDSocialInteractionAdvisor_adviseInteractionsForDate_andSeedContacts_usingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    float v4 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __87___CDSocialInteractionAdvisor_adviseInteractionsForDate_andSeedContacts_usingSettings___block_invoke_156(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v3 = *(float *)(a2 + 4);
  float v4 = *(float *)(a3 + 4);
  if (v3 < v4) {
    return 1;
  }
  if (v3 <= v4) {
    return (*(_DWORD *)a2 > *(_DWORD *)a3) - (*(_DWORD *)a2 < *(_DWORD *)a3);
  }
  return 0xFFFFFFFFLL;
}

void __66___CDSocialInteractionAdvisor_tuneUsingSettings_heartBeatHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    float v4 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66___CDSocialInteractionAdvisor_tuneUsingSettings_heartBeatHandler___block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __66___CDSocialInteractionAdvisor_tuneUsingSettings_heartBeatHandler___block_invoke_161(uint64_t a1, float a2, float a3, float a4, float a5, float a6, uint64_t a7, BOOL *a8)
{
  objc_msgSend(*(id *)(a1 + 32), "tuningHeartBeatLambda:w0:threshold:score:progress:");
  v15 = *(void **)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(float *)&double v17 = a2;
  *(float *)&double v18 = a3;
  *(float *)&double v19 = a4;
  *(float *)&double v20 = a5;
  *(float *)&double v21 = a6;
  [v15 modelTuner:WeakRetained heartBeatWithlambda:v17 w0:v18 threshold:v19 score:v20 progress:v21];

  *a8 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56) > *(double *)(a1 + 64);
}

void __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void __66___CDSocialInteractionAdvisor_tuneUsingSettings_heartBeatHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "While tuning: %@", v2, v3, v4, v5, v6);
}

@end