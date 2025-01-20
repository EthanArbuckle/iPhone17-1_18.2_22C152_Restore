@interface DKContactsPrivacyMaintainer
@end

@implementation DKContactsPrivacyMaintainer

uint64_t __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleContactDeletionNotification];
}

void __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_2_cold_1();
  }

  [WeakRetained[6] runAfterDelaySeconds:1 coalescingBehavior:8.0];
}

void __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_499(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_499_cold_1();
  }

  [WeakRetained[6] runAfterDelaySeconds:1 coalescingBehavior:8.0];
}

void __71___DKContactsPrivacyMaintainer_handleRecentlyDeletedContactsWithLimit___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = [a2 deletedContactIdentifiers];
  [*(id *)(a1 + 32) _deleteIntentsRelatedToContactIdentifiers:v5];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v5 count];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > *(void *)(a1 + 56))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }
  v6 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    uint64_t v9 = [v5 count];
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      v11 = @"YES";
    }
    else {
      v11 = @"NO";
    }
    int v12 = 138413058;
    v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    v19 = v11;
    _os_log_debug_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_DEBUG, "%@ - visitEventsWithBatchSize processed batch with size: %lu, numContactsProcessed: %lu, shouldSaveToken: %@", (uint8_t *)&v12, 0x2Au);
  }
}

uint64_t __65___DKContactsPrivacyMaintainer_scheduleIntentsPruningXPCActivity__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupPendingDeletedContacts];
}

void __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_2_cold_1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v2, v3, "%@ got __ABDataBaseChangedByOtherProcessNotification notification, triggering deleteInteractionsRelatedToDeletedContacts", v4, v5, v6, v7, v8);
}

void __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_499_cold_1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v2, v3, "%@ got CNContactStoreDidChangeNotification notification, triggering deleteInteractionsRelatedToDeletedContacts", v4, v5, v6, v7, v8);
}

@end