@interface LSStartupJournalledDatabaseRebuiltNotification
@end

@implementation LSStartupJournalledDatabaseRebuiltNotification

void __69___LSStartupJournalledDatabaseRebuiltNotification_sharedNotification__block_invoke()
{
  v0 = objc_alloc_init(_LSStartupJournalledDatabaseRebuiltNotification);
  v1 = (void *)sharedNotification_instance;
  sharedNotification_instance = (uint64_t)v0;
}

@end