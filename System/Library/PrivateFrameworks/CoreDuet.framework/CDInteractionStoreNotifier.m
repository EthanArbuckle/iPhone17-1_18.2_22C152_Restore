@interface CDInteractionStoreNotifier
@end

@implementation CDInteractionStoreNotifier

void __45___CDInteractionStoreNotifier_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192FB2F20]();
  v1 = objc_alloc_init(_CDInteractionStoreNotifier);
  v2 = (void *)sharedInstance__pasExprOnceResult_3;
  sharedInstance__pasExprOnceResult_3 = (uint64_t)v1;
}

void __35___CDInteractionStoreNotifier_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleXPCNotificationEvent:v3];
}

void __35___CDInteractionStoreNotifier_init__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleXPCNotificationEvent:v3];
}

uint64_t __57___CDInteractionStoreNotifier_filterInteractionsForUser___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 nsUserName];
  id v3 = NSUserName();
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

void __40___CDInteractionStoreNotifier_recorded___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v18 = v1;
    LOBYTE(v5) = 0;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      char v9 = v5;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v2);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        char v11 = [v10 mechanism];
        int v5 = 1;
        if ((v9 & 1) == 0)
        {
          v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "mechanism"));
          int v5 = [v12 isEqual:&unk_1EDE1DF70];
        }
        v6 |= 1 << v11;
        ++v8;
        char v9 = v5;
      }
      while (v4 != v8);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v4);

    uint64_t v1 = v18;
    [*(id *)(v18 + 40) postPackedMechanisms:v6];
  }
  else
  {

    int v5 = 0;
  }
  v13 = [*(id *)(v1 + 40) filterInteractionsForUser:*(void *)(v1 + 32)];
  if ([v13 count])
  {
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v23 = @"_CDInteractionsKey";
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
    if (*(void *)(v1 + 32)) {
      uint64_t v15 = *(void *)(v1 + 32);
    }
    uint64_t v24 = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [v14 postNotificationName:@"_CDInteractionStoreRecordedInteractionsNotification" object:0 userInfo:v16];

    [*(id *)(v1 + 40) publishRecordedXPCEvent:v13];
    if (v5)
    {
      v17 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v17 postNotificationName:@"_CDInteractionStoreRecordedShareSheetInteractionNotification" object:0 userInfo:0];
    }
  }
}

void __39___CDInteractionStoreNotifier_deleted___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= 1 << objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "mechanism", (void)v12);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v4);

    [*(id *)(a1 + 40) postPackedMechanisms:v5];
  }
  else
  {
  }
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "filterInteractionsForUser:", *(void *)(a1 + 32), (void)v12);
  if ([v8 count])
  {
    char v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v16 = @"_CDInteractionsKey";
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
    if (*(void *)(a1 + 32)) {
      uint64_t v10 = *(void *)(a1 + 32);
    }
    uint64_t v17 = v10;
    char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v9 postNotificationName:@"_CDInteractionStoreDeletedInteractionsNotification" object:0 userInfo:v11];

    [*(id *)(a1 + 40) publishDeletedXPCEvent:v8];
  }
}

void __38___CDInteractionStoreNotifier_suspend__block_invoke(uint64_t a1)
{
}

void __55___CDInteractionStoreNotifier_publishRecordedXPCEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55___CDInteractionStoreNotifier_publishRecordedXPCEvent___block_invoke_cold_1(a1);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEFAULT, "Successfully sent event to %@", (uint8_t *)&v7, 0xCu);
  }
}

void __54___CDInteractionStoreNotifier_publishDeletedXPCEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55___CDInteractionStoreNotifier_publishRecordedXPCEvent___block_invoke_cold_1(a1);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEFAULT, "Successfully sent event to %@", (uint8_t *)&v7, 0xCu);
  }
}

void __55___CDInteractionStoreNotifier_publishRecordedXPCEvent___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_5(&dword_18ECEB000, v1, v2, "Failed to event to subscriber %@ for recorded interaction: %@", (void)v3, DWORD2(v3));
}

@end