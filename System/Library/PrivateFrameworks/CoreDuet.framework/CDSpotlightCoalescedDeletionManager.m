@interface CDSpotlightCoalescedDeletionManager
@end

@implementation CDSpotlightCoalescedDeletionManager

id __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  v9 = v8;
  if (v7)
  {
    *a4 = [v8 addDeletion:v7];
    v10 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = @"YES";
      if (!*a4) {
        v11 = @"NO";
      }
      int v13 = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_INFO, "_CDSpotlightCoalescedDeletionManager coalescing new deletion operation: %@, change was consequential: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  return v9;
}

void __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_DEFAULT, "_CDSpotlightCoalescedDeletionManager running coalesced delete operation: %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke_12;
  v5[3] = &unk_1E5610830;
  v5[4] = *(void *)(a1 + 32);
  [v3 enumerateDeletionPredicatesAndCompletionsWithBlock:v5];
}

void __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke_2;
  v8[3] = &unk_1E5610478;
  id v9 = v5;
  id v7 = v5;
  [v6 deleteKnowledgeEventsMatchingPredicate:a2 withCompletion:v8];
}

void __60___CDSpotlightCoalescedDeletionManager_setupCoalescingTimer__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x192FB2F20](v7);
        (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }
}

@end