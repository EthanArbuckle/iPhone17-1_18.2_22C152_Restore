@interface CDInteractionStoreNotificationReceiver
@end

@implementation CDInteractionStoreNotificationReceiver

void __47___CDInteractionStoreNotificationReceiver_init__block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  if (notify_get_state(token, &state64))
  {
    WeakRetained = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __47___CDInteractionStoreNotificationReceiver_init__block_invoke_cold_1(WeakRetained, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained postPackedMechanisms:state64];
  }
}

void __47___CDInteractionStoreNotificationReceiver_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end