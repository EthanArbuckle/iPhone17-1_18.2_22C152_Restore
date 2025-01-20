@interface NSURL(BackingStores)
+ (id)dnds_assertionSyncMetadataFileURL;
+ (id)dnds_backingStoreRootDirectoryURL;
+ (id)dnds_globalConfigurationBackingStoreFileURL;
+ (id)dnds_idsSyncEngineMetadataFileURL;
+ (id)dnds_legacySettingsFileURL;
+ (id)dnds_localAssertionBackingStoreFileURL;
+ (id)dnds_locationAssertionExplicitRegionFileURL;
+ (id)dnds_locationAssertionUntilExitRegionFileURL;
+ (id)dnds_meDeviceStoreFileURL;
+ (id)dnds_metricsBackingStoreFileURL;
+ (id)dnds_modeConfigurationsBackingStoreFileURL;
+ (id)dnds_modeConfigurationsSecureBackingStoreFileURL;
+ (id)dnds_placeholderModesLocalBackingStoreFileURL;
+ (id)dnds_rootDirectoryURL;
+ (id)dnds_settingsBackingStoreFileURL;
+ (id)dnds_syncEngineLastChanceFileURL;
+ (id)dnds_syncEngineMetadataFileURL;
@end

@implementation NSURL(BackingStores)

+ (id)dnds_rootDirectoryURL
{
  if (dnds_rootDirectoryURL_onceToken != -1) {
    dispatch_once(&dnds_rootDirectoryURL_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)dnds_rootDirectoryURL_directoryURL;
  return v0;
}

+ (id)dnds_backingStoreRootDirectoryURL
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__NSURL_BackingStores__dnds_backingStoreRootDirectoryURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (dnds_backingStoreRootDirectoryURL_onceToken != -1) {
    dispatch_once(&dnds_backingStoreRootDirectoryURL_onceToken, block);
  }
  v1 = (void *)dnds_backingStoreRootDirectoryURL_directoryURL;
  return v1;
}

+ (id)dnds_localAssertionBackingStoreFileURL
{
  if (dnds_localAssertionBackingStoreFileURL_onceToken != -1) {
    dispatch_once(&dnds_localAssertionBackingStoreFileURL_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)dnds_localAssertionBackingStoreFileURL_fileURL;
  return v0;
}

+ (id)dnds_settingsBackingStoreFileURL
{
  if (dnds_settingsBackingStoreFileURL_onceToken != -1) {
    dispatch_once(&dnds_settingsBackingStoreFileURL_onceToken, &__block_literal_global_15);
  }
  v0 = (void *)dnds_settingsBackingStoreFileURL_fileURL;
  return v0;
}

+ (id)dnds_metricsBackingStoreFileURL
{
  if (dnds_metricsBackingStoreFileURL_onceToken != -1) {
    dispatch_once(&dnds_metricsBackingStoreFileURL_onceToken, &__block_literal_global_20);
  }
  v0 = (void *)dnds_metricsBackingStoreFileURL_fileURL;
  return v0;
}

+ (id)dnds_legacySettingsFileURL
{
  if (dnds_legacySettingsFileURL_onceToken != -1) {
    dispatch_once(&dnds_legacySettingsFileURL_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)dnds_legacySettingsFileURL_fileURL;
  return v0;
}

+ (id)dnds_locationAssertionUntilExitRegionFileURL
{
  if (dnds_locationAssertionUntilExitRegionFileURL_onceToken != -1) {
    dispatch_once(&dnds_locationAssertionUntilExitRegionFileURL_onceToken, &__block_literal_global_33);
  }
  v0 = (void *)dnds_locationAssertionUntilExitRegionFileURL_fileURL;
  return v0;
}

+ (id)dnds_locationAssertionExplicitRegionFileURL
{
  if (dnds_locationAssertionExplicitRegionFileURL_onceToken != -1) {
    dispatch_once(&dnds_locationAssertionExplicitRegionFileURL_onceToken, &__block_literal_global_38);
  }
  v0 = (void *)dnds_locationAssertionExplicitRegionFileURL_fileURL;
  return v0;
}

+ (id)dnds_modeConfigurationsBackingStoreFileURL
{
  if (dnds_modeConfigurationsBackingStoreFileURL_onceToken != -1) {
    dispatch_once(&dnds_modeConfigurationsBackingStoreFileURL_onceToken, &__block_literal_global_43);
  }
  v0 = (void *)dnds_modeConfigurationsBackingStoreFileURL_fileURL;
  return v0;
}

+ (id)dnds_modeConfigurationsSecureBackingStoreFileURL
{
  if (dnds_modeConfigurationsSecureBackingStoreFileURL_onceToken != -1) {
    dispatch_once(&dnds_modeConfigurationsSecureBackingStoreFileURL_onceToken, &__block_literal_global_48);
  }
  v0 = (void *)dnds_modeConfigurationsSecureBackingStoreFileURL_fileURL;
  return v0;
}

+ (id)dnds_globalConfigurationBackingStoreFileURL
{
  if (dnds_globalConfigurationBackingStoreFileURL_onceToken != -1) {
    dispatch_once(&dnds_globalConfigurationBackingStoreFileURL_onceToken, &__block_literal_global_53);
  }
  v0 = (void *)dnds_globalConfigurationBackingStoreFileURL_fileURL;
  return v0;
}

+ (id)dnds_placeholderModesLocalBackingStoreFileURL
{
  if (dnds_placeholderModesLocalBackingStoreFileURL_onceToken != -1) {
    dispatch_once(&dnds_placeholderModesLocalBackingStoreFileURL_onceToken, &__block_literal_global_58);
  }
  v0 = (void *)dnds_placeholderModesLocalBackingStoreFileURL_fileURL;
  return v0;
}

+ (id)dnds_syncEngineMetadataFileURL
{
  if (dnds_syncEngineMetadataFileURL_onceToken != -1) {
    dispatch_once(&dnds_syncEngineMetadataFileURL_onceToken, &__block_literal_global_66);
  }
  v0 = (void *)dnds_syncEngineMetadataFileURL_fileURL;
  return v0;
}

+ (id)dnds_syncEngineLastChanceFileURL
{
  if (dnds_syncEngineLastChanceFileURL_onceToken != -1) {
    dispatch_once(&dnds_syncEngineLastChanceFileURL_onceToken, &__block_literal_global_71);
  }
  v0 = (void *)dnds_syncEngineLastChanceFileURL_fileURL;
  return v0;
}

+ (id)dnds_idsSyncEngineMetadataFileURL
{
  if (dnds_idsSyncEngineMetadataFileURL_onceToken != -1) {
    dispatch_once(&dnds_idsSyncEngineMetadataFileURL_onceToken, &__block_literal_global_76);
  }
  v0 = (void *)dnds_idsSyncEngineMetadataFileURL_fileURL;
  return v0;
}

+ (id)dnds_assertionSyncMetadataFileURL
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = BSCurrentUserDirectory();
  v6[0] = v1;
  v6[1] = @"Library";
  v6[2] = @"DoNotDisturb";
  v6[3] = @"DB";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v3 = [v0 fileURLWithPathComponents:v2];

  v4 = [v3 URLByAppendingPathComponent:@"AssertionSyncMetadata.plist"];

  return v4;
}

+ (id)dnds_meDeviceStoreFileURL
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = BSCurrentUserDirectory();
  v6[0] = v1;
  v6[1] = @"Library";
  v6[2] = @"DoNotDisturb";
  v6[3] = @"DB";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v3 = [v0 fileURLWithPathComponents:v2];

  v4 = [v3 URLByAppendingPathComponent:@"MeDeviceStatus.json"];

  return v4;
}

@end