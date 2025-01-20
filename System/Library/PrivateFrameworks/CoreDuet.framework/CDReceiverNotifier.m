@interface CDReceiverNotifier
@end

@implementation CDReceiverNotifier

void __37___CDReceiverNotifier_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192FB2F20]();
  v1 = objc_alloc_init(_CDReceiverNotifier);
  v2 = (void *)sharedInstance__pasExprOnceResult_1;
  sharedInstance__pasExprOnceResult_1 = (uint64_t)v1;
}

void __27___CDReceiverNotifier_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleXPCNotificationEvent:v3];
}

void __44___CDReceiverNotifier__publishXPCEvent_uid___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _logChannel();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44___CDReceiverNotifier__publishXPCEvent_uid___block_invoke_cold_2(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __44___CDReceiverNotifier__publishXPCEvent_uid___block_invoke_cold_1(a1, v5);
  }
}

void __44___CDReceiverNotifier__publishXPCEvent_uid___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Successfully sent event to %@", (uint8_t *)&v3, 0xCu);
}

void __44___CDReceiverNotifier__publishXPCEvent_uid___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_5(&dword_18ECEB000, a2, a3, "Failed to event to subscriber %@ for AppIntent: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end