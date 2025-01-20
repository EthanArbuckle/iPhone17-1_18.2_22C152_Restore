@interface LSMIRegistrantServerStrategy
- (id)notificationJournallerForBundleIdentifier:(id)a3 registeringPlaceholder:(BOOL)a4;
- (id)preUnregistrationContextForBundleIdentifier:(id)a3;
- (void)runSyncBlockInWriteContext:(id)a3;
@end

@implementation LSMIRegistrantServerStrategy

- (id)preUnregistrationContextForBundleIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[_LSInstallProgressService sharedInstance];
  v9[0] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v6 = [v4 _prepareApplicationProxiesForNotification:0 identifiers:v5 withPlugins:0];
  v7 = [v6 firstObject];

  return v7;
}

- (void)runSyncBlockInWriteContext:(id)a3
{
  id v3 = a3;
  v4 = +[LSDBExecutionContext sharedServerInstance]();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__LSMIRegistrantServerStrategy_runSyncBlockInWriteContext___block_invoke;
  v6[3] = &unk_1E522D260;
  id v5 = v3;
  id v7 = v5;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v4, v6);
}

void __59__LSMIRegistrantServerStrategy_runSyncBlockInWriteContext___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LSMIResultRegistrantServerDatabaseContextProviding);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)notificationJournallerForBundleIdentifier:(id)a3 registeringPlaceholder:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[_LSRegistrationNotificationJournaller alloc] initWithPrimaryBundleID:v5 placeholder:v4];

  return v6;
}

@end