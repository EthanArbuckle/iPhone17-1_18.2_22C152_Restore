@interface _LSStartupJournalledDatabaseRebuiltNotification
+ (id)sharedNotification;
- (void)dispatchToObserver:(id)a3 forInstallProgressService:(id)a4;
@end

@implementation _LSStartupJournalledDatabaseRebuiltNotification

+ (id)sharedNotification
{
  if (sharedNotification_onceToken != -1) {
    dispatch_once(&sharedNotification_onceToken, &__block_literal_global_85);
  }
  v2 = (void *)sharedNotification_instance;

  return v2;
}

- (void)dispatchToObserver:(id)a3 forInstallProgressService:(id)a4
{
}

@end