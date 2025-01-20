@interface CHSToolSupportService
- (CHSToolServiceConnection)connection;
- (CHSToolSupportService)init;
- (CHSToolSupportService)initWithConnection:(id)a3;
- (void)allCachedSnapshotURLsWithCompletion:(id)a3;
- (void)cacheDescriptorsForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)contentURLForActivityID:(id)a3 completion:(id)a4;
- (void)expireLocationGracePeriods;
- (void)extensionInfo:(id)a3;
- (void)extensionInfoForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)fetchStateForItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)fetchStateWithCompletion:(id)a3;
- (void)listStateCaptureIdentifiersWithCompletion:(id)a3;
- (void)reloadControlsOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)reloadDescriptorsForExtensionBundleIdentifier:(id)a3 completion:(id)a4;
- (void)reloadTimelinesOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)resetCaches:(unint64_t)a3 completion:(id)a4;
- (void)runMigrationReaper;
- (void)runReaper;
- (void)timelineForWidgetKey:(id)a3 completion:(id)a4;
- (void)widgetsWithTimelines:(id)a3;
@end

@implementation CHSToolSupportService

- (CHSToolSupportService)init
{
  v3 = +[CHSToolServiceConnection sharedInstance];
  v4 = [(CHSToolSupportService *)self initWithConnection:v3];

  return v4;
}

- (CHSToolSupportService)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSToolSupportService;
  v6 = [(CHSToolSupportService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)cacheDescriptorsForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__CHSToolSupportService_cacheDescriptorsForBundleIdentifier_completion___block_invoke;
  v8[3] = &unk_1E56C9698;
  id v9 = v6;
  id v7 = v6;
  [(CHSToolSupportService *)self reloadDescriptorsForExtensionBundleIdentifier:a3 completion:v8];
}

void __72__CHSToolSupportService_cacheDescriptorsForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v9)
  {
    id v7 = [v9 orderedDescriptors];
    v8 = [v9 extensionBundleIdentifier];
    [v6 setObject:v7 forKeyedSubscript:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reloadDescriptorsForExtensionBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__CHSToolSupportService_reloadDescriptorsForExtensionBundleIdentifier_completion___block_invoke;
  v9[3] = &unk_1E56C9698;
  id v10 = v6;
  id v8 = v6;
  [(CHSToolServiceConnection *)connection refreshDescriptorsForExtensionBundleIdentifier:a3 completion:v9];
}

uint64_t __82__CHSToolSupportService_reloadDescriptorsForExtensionBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetCaches:(unint64_t)a3 completion:(id)a4
{
}

- (void)allCachedSnapshotURLsWithCompletion:(id)a3
{
}

- (void)listStateCaptureIdentifiersWithCompletion:(id)a3
{
}

- (void)fetchStateWithCompletion:(id)a3
{
}

- (void)fetchStateForItemWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)extensionInfoForBundleIdentifier:(id)a3 completion:(id)a4
{
}

- (void)extensionInfo:(id)a3
{
}

- (void)widgetsWithTimelines:(id)a3
{
}

- (void)timelineForWidgetKey:(id)a3 completion:(id)a4
{
}

- (void)reloadControlsOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6
{
}

- (void)reloadTimelinesOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6
{
}

- (void)expireLocationGracePeriods
{
}

- (void)contentURLForActivityID:(id)a3 completion:(id)a4
{
}

- (void)runReaper
{
}

- (void)runMigrationReaper
{
}

- (CHSToolServiceConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end