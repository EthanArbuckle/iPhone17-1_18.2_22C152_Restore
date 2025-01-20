@interface HKDeepBreathingSession
@end

@implementation HKDeepBreathingSession

uint64_t __48___HKDeepBreathingSession_connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_deactivate");
}

void __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_2;
    block[3] = &unk_1E58BBA28;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_3(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_4;
  v5[3] = &unk_1E58BBA50;
  uint64_t v3 = a1[4];
  v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  objc_msgSend(a2, "remote_startSessionWithStartDate:completion:", v3, v5);
}

void __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_5;
    block[3] = &unk_1E58BBA00;
    void block[4] = v6;
    dispatch_sync(v7, block);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDeepBreathing, OS_LOG_TYPE_ERROR)) {
      __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_4_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_transitionToServerState:", 3);
}

void __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDeepBreathing, OS_LOG_TYPE_ERROR)) {
    __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_18_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __39___HKDeepBreathingSession_startGuiding__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startGuiding");
}

void __39___HKDeepBreathingSession_startGuiding__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDeepBreathing, OS_LOG_TYPE_ERROR)) {
    __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_18_cold_1();
  }
}

uint64_t __51___HKDeepBreathingSession_endSessionWithEndReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_endSessionWithEndReason:", *(void *)(a1 + 32));
}

void __51___HKDeepBreathingSession_endSessionWithEndReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDeepBreathing, OS_LOG_TYPE_ERROR)) {
    __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_18_cold_1();
  }
}

uint64_t __38___HKDeepBreathingSession_serverState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

uint64_t __56___HKDeepBreathingSession__connectionDidEncounterError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_deactivate");
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return objc_msgSend(v2, "_queue_alertDelegateDidEncounterError:", v3);
}

uint64_t __44___HKDeepBreathingSession__isServerAttached__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_isServerAttached");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __67___HKDeepBreathingSession_clientRemote_sessionDidReceiveHeartRate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_alertDelegateDidReceiveHeartRate:", *(double *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_queue_deactivate");
}

uint64_t __63___HKDeepBreathingSession_clientRemote_sessionDidReceiveError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_alertDelegateDidEncounterError:", *(void *)(a1 + 40));
}

void __67___HKDeepBreathingSession__queue_alertDelegateDidReceiveHeartRate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained deepBreathingSession:*(void *)(a1 + 32) didReceiveHeartRate:*(double *)(a1 + 48)];
}

void __65___HKDeepBreathingSession__queue_alertDelegateDidEncounterError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained deepBreathingSession:*(void *)(a1 + 32) didEncounterError:*(void *)(a1 + 40)];
}

void __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "error starting session: %{public}@", v2, v3, v4, v5, v6);
}

void __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "received server error: %{public}@", v2, v3, v4, v5, v6);
}

@end