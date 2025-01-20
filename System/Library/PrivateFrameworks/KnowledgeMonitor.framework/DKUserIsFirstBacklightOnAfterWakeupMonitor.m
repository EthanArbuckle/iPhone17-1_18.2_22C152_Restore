@interface DKUserIsFirstBacklightOnAfterWakeupMonitor
@end

@implementation DKUserIsFirstBacklightOnAfterWakeupMonitor

void __91___DKUserIsFirstBacklightOnAfterWakeupMonitor_setInternalSettingsChangedNotficationHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setUINotificationEligibility];
}

void __66___DKUserIsFirstBacklightOnAfterWakeupMonitor_showUINotification___block_invoke(uint64_t a1)
{
  CFOptionFlags v3 = 0;
  CFUserNotificationDisplayAlert(0.0, 0x40uLL, 0, 0, 0, (CFStringRef)[*(id *)(a1 + 32) objectForKey:@"alert_title"], (CFStringRef)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"alert_msg"), (CFStringRef)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"alert_option_one"), (CFStringRef)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"alert_option_two"), 0, &v3);
  v2 = [*(id *)(a1 + 32) objectForKey:@"response_alert_title"];

  if (v2)
  {
    if (v3) {
      CFUserNotificationDisplayAlert(0.0, 0x40uLL, 0, 0, 0, (CFStringRef)[*(id *)(a1 + 32) objectForKey:@"response_alert_title"], (CFStringRef)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"response_alert_msg"), 0, 0, 0, 0);
    }
  }
}

uint64_t __72___DKUserIsFirstBacklightOnAfterWakeupMonitor_receiveNotificationEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleScreenUnlockEvent];
}

void __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke(uint64_t a1, int a2)
{
  v4 = [MEMORY[0x263F34FB8] knowledgeChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke_cold_2();
  }

  v5 = (void *)os_transaction_create();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    if (!notify_get_state(a2, &state64))
    {
      v7 = [*(id *)(a1 + 32) queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke_145;
      block[3] = &unk_264714CE8;
      id v10 = WeakRetained;
      uint64_t v11 = state64;
      dispatch_sync(v7, block);
    }
    v8 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke_cold_1();
    }
  }
}

void __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke_145(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A629AA0]();
  [*(id *)(a1 + 32) setupNotificationEligiblityPeriod];
  CFOptionFlags v3 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40)) {
    [v3 handleBacklightTurnedOnEvent];
  }
  else {
    [v3 handleBacklightTurnedOffEvent];
  }
}

void __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_225002000, v0, v1, "FirstBacklight?  Done handling display status change", v2, v3, v4, v5, v6);
}

void __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_225002000, v0, v1, "FirstBacklight?  Begin handling display status change", v2, v3, v4, v5, v6);
}

@end