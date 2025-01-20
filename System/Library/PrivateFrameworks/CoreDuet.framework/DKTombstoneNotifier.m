@interface DKTombstoneNotifier
@end

@implementation DKTombstoneNotifier

void __93___DKTombstoneNotifier_sendDistributedNotificationsForTombstoneRequirementIdentifiers_queue___block_invoke(uint64_t a1)
{
  v2 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __93___DKTombstoneNotifier_sendDistributedNotificationsForTombstoneRequirementIdentifiers_queue___block_invoke_cold_1(a1, v2);
  }

  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 postNotificationName:@"_DKKnowledgeStorageDidTombstoneEventsNotification" object:*(void *)(a1 + 32) userInfo:0 deliverImmediately:0];
}

void __93___DKTombstoneNotifier_sendDistributedNotificationsForTombstoneRequirementIdentifiers_queue___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Posting distributed notification for 'did tombstone events' with requirement identifier: %@", (uint8_t *)&v3, 0xCu);
}

@end