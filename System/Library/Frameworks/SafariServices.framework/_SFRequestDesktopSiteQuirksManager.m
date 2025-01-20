@interface _SFRequestDesktopSiteQuirksManager
+ (_SFRequestDesktopSiteQuirksManager)sharedManager;
- (_SFRequestDesktopSiteQuirksManager)init;
- (void)getAllQuirkValuesWithCompletionHandler:(id)a3;
- (void)quirksValueForDomain:(id)a3 completionHandler:(id)a4;
@end

@implementation _SFRequestDesktopSiteQuirksManager

+ (_SFRequestDesktopSiteQuirksManager)sharedManager
{
  if (sharedManager_onceToken_3 != -1) {
    dispatch_once(&sharedManager_onceToken_3, &__block_literal_global_60);
  }
  v2 = (void *)sharedManager_sharedQuirksManager;

  return (_SFRequestDesktopSiteQuirksManager *)v2;
}

- (_SFRequestDesktopSiteQuirksManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)_SFRequestDesktopSiteQuirksManager;
  v2 = [(_SFRequestDesktopSiteQuirksManager *)&v19 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1350]);
    v4 = objc_msgSend(MEMORY[0x1E4F28B50], "sf_mobileSafariFrameworkBundle");
    v5 = (void *)[v3 initWithName:@"RequestDesktopSiteQuirks" bundle:v4];

    v6 = [v5 data];
    v2->_supportsDesktopClassBrowsing = [v6 length] != 0;

    if (v2->_supportsDesktopClassBrowsing)
    {
      v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      v8 = objc_msgSend(v7, "safari_settingsDirectoryURL");

      id v9 = objc_alloc(MEMORY[0x1E4F98DA8]);
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __42___SFRequestDesktopSiteQuirksManager_init__block_invoke;
      v17[3] = &unk_1E5C781B8;
      id v18 = v5;
      uint64_t v12 = [v9 initWithDataFormat:0 downloadsDirectoryURL:v8 resourceName:@"RequestDesktopSiteQuirks" resourceVersion:@"1" updateDateDefaultsKey:@"SFRequestDesktopSiteQuirksUpdateKey" updateInterval:v10 snapshotClass:86400.0 snapshotTransformerClass:v11 builtInDataProvider:v17];
      remotelyUpdatableDataController = v2->_remotelyUpdatableDataController;
      v2->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v12;

      [(WBSRemotelyUpdatableDataController *)v2->_remotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:1];
      v14 = v2;
    }
    else
    {
      v15 = v2;
    }
  }
  return v2;
}

- (void)getAllQuirkValuesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_supportsDesktopClassBrowsing)
  {
    remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77___SFRequestDesktopSiteQuirksManager_getAllQuirkValuesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E5C78208;
    id v8 = v4;
    [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:v7];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, MEMORY[0x1E4F1CC08]);
  }
}

- (void)quirksValueForDomain:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_supportsDesktopClassBrowsing)
  {
    remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77___SFRequestDesktopSiteQuirksManager_quirksValueForDomain_completionHandler___block_invoke;
    v10[3] = &unk_1E5C781E0;
    id v12 = v7;
    id v11 = v6;
    [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:v10];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void).cxx_destruct
{
}

@end