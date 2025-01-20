@interface AKBaseFollowupManager
- (AKBaseFollowupManager)initWithFollowUpFactory:(id)a3 provider:(id)a4;
- (BOOL)synchronizeFollowUpsWithServerPayload:(id)a3 altDSID:(id)a4 error:(id *)a5;
- (id)_alignedInsertionCandidates:(id)a3 withExistingItems:(id)a4;
- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKBaseFollowupManager

- (AKBaseFollowupManager)initWithFollowUpFactory:(id)a3 provider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKBaseFollowupManager;
  v9 = [(AKBaseFollowupManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_factory, a3);
    objc_storeStrong((id *)&v10->_provider, a4);
  }

  return v10;
}

- (BOOL)synchronizeFollowUpsWithServerPayload:(id)a3 altDSID:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [a3 objectForKeyedSubscript:@"items"];
  v10 = _AKLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "Synchronizing local follow up state.", buf, 2u);
    }

    v10 = [(AKFollowUpProvider *)self->_provider pendingFollowUpItems:0];
    objc_super v12 = [(AKFollowUpItemFactory *)self->_factory itemsForAltDSID:v8 pushMessageInfo:0 fromIDMSPayload:v9];
    if (v10)
    {
      v13 = (void *)MEMORY[0x1E4F1CAD0];
      v14 = objc_msgSend(v9, "aaf_map:", &__block_literal_global_44);
      v15 = [v13 setWithArray:v14];

      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke_2;
      v51[3] = &unk_1E5761C80;
      id v40 = v15;
      id v52 = v40;
      v41 = [v10 aaf_filter:v51];
      if ([v41 count])
      {
        v16 = _AKLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v41;
          _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "Deleting: %@", buf, 0xCu);
        }

        provider = self->_provider;
        id v50 = 0;
        char v18 = [(AKFollowUpProvider *)provider removeFollowUpItems:v41 error:&v50];
        id v19 = v50;
        if ((v18 & 1) == 0)
        {
          v20 = _AKLogSystem();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[AKBaseFollowupManager synchronizeFollowUpsWithServerPayload:altDSID:error:]((uint64_t)v19, v20);
          }
        }
      }
      v21 = (void *)MEMORY[0x1E4F1CAD0];
      v22 = [(AKFollowUpItemFactory *)self->_factory itemIdentifiersRequiringNotificationClearFromPayload:v9];
      v23 = [v21 setWithArray:v22];

      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke_18;
      v48[3] = &unk_1E5761C80;
      id v24 = v23;
      id v49 = v24;
      v25 = [v10 aaf_filter:v48];
      if ([v25 count])
      {
        v38 = a5;
        id v39 = v8;
        v26 = _AKLogSystem();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v25;
          _os_log_impl(&dword_193494000, v26, OS_LOG_TYPE_DEFAULT, "Clearing Notifications: %@", buf, 0xCu);
        }

        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v27 = v25;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v45 != v30) {
                objc_enumerationMutation(v27);
              }
              [(AKFollowUpProvider *)self->_provider clearNotificationsForItem:*(void *)(*((void *)&v44 + 1) + 8 * i) error:0];
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }
          while (v29);
        }

        a5 = v38;
        id v8 = v39;
      }
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke_19;
      v42[3] = &unk_1E5761C80;
      id v43 = v24;
      id v32 = v24;
      uint64_t v33 = objc_msgSend(v12, "aaf_filter:", v42);

      objc_super v12 = (void *)v33;
    }
    v34 = [(AKBaseFollowupManager *)self _alignedInsertionCandidates:v12 withExistingItems:v10];

    v35 = _AKLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v34;
      _os_log_impl(&dword_193494000, v35, OS_LOG_TYPE_DEFAULT, "Inserting: %@", buf, 0xCu);
    }

    char v36 = [(AKFollowUpProvider *)self->_provider addFollowUpItems:v34 error:a5];
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "No followup items found in payload.", buf, 2u);
    }
    char v36 = 0;
  }

  return v36;
}

uint64_t __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"id"];
}

uint64_t __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke_18(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __77__AKBaseFollowupManager_synchronizeFollowUpsWithServerPayload_altDSID_error___block_invoke_19(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = [v6 itemIdentifier];
  if (v8
    && (v9 = (void *)v8,
        [v6 altDSID],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    BOOL v11 = [v6 akAction];
    char v12 = [v11 isEqualToString:@"delete"];

    v13 = [v6 akAction];
    int v14 = [v13 isEqualToString:@"teardown"];

    if ((v12 & 1) != 0 || v14)
    {
      provider = self->_provider;
      v15 = [v6 itemIdentifier];
      v19[0] = v15;
      char v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      [(AKFollowUpProvider *)provider removeFollowUpItemsWithIdentifiers:v18 error:0];
    }
    else
    {
      v15 = _AKLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[AKBaseFollowupManager teardownFollowUpWithContext:completion:]();
      }
    }

    v7[2](v7, 1, 0);
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7044);
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v16);
  }
}

- (id)_alignedInsertionCandidates:(id)a3 withExistingItems:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionary];
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke;
  v25[3] = &unk_1E5761CA8;
  id v11 = v10;
  id v26 = v11;
  id v12 = v9;
  id v27 = v12;
  [v8 enumerateObjectsUsingBlock:v25];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_24;
  v21[3] = &unk_1E5761CD0;
  id v13 = v11;
  id v22 = v13;
  id v14 = v12;
  id v23 = v14;
  id v24 = self;
  [v7 enumerateObjectsUsingBlock:v21];

  v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v13;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "Found incoming sparse followups: %@", buf, 0xCu);
  }

  v16 = _AKLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v14;
    _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "Found incoming full followups: %@", buf, 0xCu);
  }

  v17 = [v13 allValues];
  char v18 = [v14 allValues];
  id v19 = [v17 arrayByAddingObjectsFromArray:v18];

  return v19;
}

void __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 uniqueIdentifier];

  if (v4)
  {
    v5 = [v3 actions];
    if ([v5 count])
    {
      id v6 = [v3 informativeText];

      if (v6)
      {
        id v7 = *(void **)(a1 + 40);
LABEL_10:
        v9 = [v3 uniqueIdentifier];
        [v7 setObject:v3 forKeyedSubscript:v9];

        goto LABEL_11;
      }
    }
    else
    {
    }
    id v7 = *(void **)(a1 + 32);
    goto LABEL_10;
  }
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_cold_1();
  }

LABEL_11:
}

void __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 uniqueIdentifier];
  if (v4)
  {
    v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    if (v5
      && ([v3 notification], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
    {
      id v7 = [v5 notification];

      if (v7)
      {
        id v8 = [v5 notification];
        v9 = [v8 informativeText];
        v10 = [v3 notification];
        [v10 setInformativeText:v9];

        id v11 = [v5 notification];
        id v12 = [v11 title];
        id v13 = [v3 notification];
        [v13 setTitle:v12];

        id v14 = [v5 notification];
        [v14 frequency];
        double v16 = v15;
        v17 = [v3 notification];
        [v17 setFrequency:v16];

        char v18 = [v5 notification];
        id v19 = [v18 options];
        v20 = [v3 notification];
        [v20 setOptions:v19];
      }
      else
      {
        [v3 setNotification:0];
      }
      id v24 = _AKLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_24_cold_3((uint64_t)v4, v24);
      }

      [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
    }
    else
    {
      v21 = [v3 notification];

      if (!v21)
      {
        id v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
        if (v22)
        {
          if ([*(id *)(*(void *)(a1 + 48) + 8) IsFollowUpItemNotificationForced:v22])
          {
            id v23 = _AKLogSystem();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
              __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_24_cold_1();
            }
          }
          else
          {
            [v22 setNotification:0];
            id v23 = _AKLogSystem();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
              __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_24_cold_2();
            }
          }
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);

  objc_storeStrong((id *)&self->_factory, 0);
}

- (void)synchronizeFollowUpsWithServerPayload:(uint64_t)a1 altDSID:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Failed to clear existing follow ups: %@", (uint8_t *)&v2, 0xCu);
}

- (void)teardownFollowUpWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_193494000, v0, OS_LOG_TYPE_ERROR, "Unknown action, ignoring...", v1, 2u);
}

void __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_193494000, v0, OS_LOG_TYPE_ERROR, "Detected an item without an identifier, invalid payload", v1, 2u);
}

void __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "Incoming notification was forced, keeping it!", v1, 2u);
}

void __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_24_cold_2()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "Existing item notification was previously dismissed, ignoring incoming notification", v1, 2u);
}

void __71__AKBaseFollowupManager__alignedInsertionCandidates_withExistingItems___block_invoke_24_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_193494000, a2, OS_LOG_TYPE_DEBUG, "Updating existing item with identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end