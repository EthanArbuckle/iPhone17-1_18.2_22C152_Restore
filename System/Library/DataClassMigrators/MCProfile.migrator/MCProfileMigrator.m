@interface MCProfileMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)_placeholderCloudConfig;
- (id)dataClassName;
- (void)_allowGrandfatheredRestrictionsIfNeeded;
- (void)_applyHeuristicsToGrandfatheredRestrictionsIfNeeded;
- (void)_createSystemMetadataFileIfNeeded;
- (void)_handleUnsupervisedGrandfatheredRestrictions;
- (void)_recomputeProfileRestrictions;
- (void)_setStopFilteringGrandfatheredRestrictionsState:(BOOL)a3;
- (void)_stopAllowingGrandfatheredRestrictions;
- (void)_storeAllowedGrandfatheredRestrictionsIfNeeded;
@end

@implementation MCProfileMigrator

- (id)dataClassName
{
  return @"mc_profiles";
}

- (float)estimatedDuration
{
  return 1.0;
}

- (float)migrationProgress
{
  return -1.0;
}

- (BOOL)performMigration
{
  _DMLogFunc();
  v3 = MCSystemProfileStorageDirectory();
  sub_2390(v3);

  v4 = MCSystemPublicInfoDirectory();
  sub_2390(v4);

  if ([(MCProfileMigrator *)self didRestoreFromBackup])
  {
    unsigned int v5 = [(MCProfileMigrator *)self didMigrateBackupFromDifferentDevice];
    v6 = MCSystemMetadataFilePath();
    v7 = +[NSMutableDictionary dictionaryWithContentsOfFile:v6];

    if (v7)
    {
      [v7 removeObjectForKey:kMCMetaLastMigratedBuildKey];
      v8 = MCSystemMetadataFilePath();
      [v7 MCWriteToBinaryFile:v8];
    }
    v9 = MCUserMetadataFilePath();
    v10 = +[NSMutableDictionary dictionaryWithContentsOfFile:v9];

    if (v10)
    {
      [v10 removeObjectForKey:kMCMetaLastMigratedBuildKey];
      v11 = MCUserMetadataFilePath();
      [v10 writeToFile:v11 atomically:1];
    }
    BOOL v12 = v5 == 0;
    if (v5) {
      unsigned int v13 = 3;
    }
    else {
      unsigned int v13 = 2;
    }
    CFStringRef v14 = @"Restore from the same device";
    CFStringRef v15 = @"Restore from a different device";
  }
  else
  {
    unsigned int v13 = [(MCProfileMigrator *)self didUpgrade];
    CFStringRef v14 = @"Device erasure";
    CFStringRef v15 = @"Software update";
    BOOL v12 = v13 == 0;
  }
  if (v12) {
    CFStringRef v16 = v14;
  }
  else {
    CFStringRef v16 = v15;
  }
  v17 = MCCloudConfigurationDetailsFilePath();
  v18 = +[NSDictionary dictionaryWithContentsOfFile:v17];

  if (v18)
  {
    v19 = [v18 objectForKeyedSubscript:kCCIsSupervisedKey];
    unsigned __int8 v20 = [v19 BOOLValue];
  }
  else
  {
    unsigned __int8 v20 = 0;
  }
  v21 = +[NSFileManager defaultManager];
  if (v13 == 3)
  {
    _DMLogFunc();
    v24 = MCCloudConfigurationDetailsFilePath();
    [v21 removeItemAtPath:v24 error:0];

    v25 = MCLegacyCloudConfigurationDetailsFilePath();
    [v21 removeItemAtPath:v25 error:0];

    MCSendCloudConfigurationDetailsChangedNotification();
    v26 = MCPostSetupAutoInstallProfilePath();
    [v21 removeItemAtPath:v26 error:0];

    v27 = MCLegacyPostSetupAutoInstallProfilePath();
    [v21 removeItemAtPath:v27 error:0];
  }
  else
  {
    if (v13 != 2
      || (_DMLogFunc(),
          MCCloudConfigurationDetailsFilePath(),
          v22 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v23 = [v21 fileExistsAtPath:v22 isDirectory:0],
          v22,
          (v23 & 1) != 0))
    {
      if (v20) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    v27 = [(MCProfileMigrator *)self _placeholderCloudConfig];
    v28 = MCCloudConfigurationDetailsFilePath();
    [v27 MCWriteToBinaryFile:v28];

    MCSendCloudConfigurationDetailsChangedNotification();
  }

LABEL_25:
  [(MCProfileMigrator *)self _handleUnsupervisedGrandfatheredRestrictions];
LABEL_26:
  _DMLogFunc();
  v29 = +[MCProfileConnection sharedConnection];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_264C;
  v31[3] = &unk_41A8;
  unsigned int v34 = v13;
  v32 = (__CFString *)v16;
  v33 = self;
  [v29 shutDownWithCompletion:v31];

  return 1;
}

- (id)_placeholderCloudConfig
{
  v2 = +[NSMutableDictionary dictionary];
  [v2 setObject:&__kCFBooleanFalse forKeyedSubscript:kCCIsSupervisedKey];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCAllowPairingKey];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCIsMandatoryKey];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCCloudConfigurationUICompleteKey];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCPostSetupProfileWasInstalledKey];

  return v2;
}

- (void)_handleUnsupervisedGrandfatheredRestrictions
{
  _DMLogFunc();
  if ([(MCProfileMigrator *)self didUpgrade])
  {
    [(MCProfileMigrator *)self _allowGrandfatheredRestrictionsIfNeeded];
  }
  else if ([(MCProfileMigrator *)self didRestoreFromBackup])
  {
    [(MCProfileMigrator *)self _stopAllowingGrandfatheredRestrictions];
  }

  [(MCProfileMigrator *)self _applyHeuristicsToGrandfatheredRestrictionsIfNeeded];
}

- (void)_applyHeuristicsToGrandfatheredRestrictionsIfNeeded
{
  _DMLogFunc();
  v2 = MCSystemMetadataFilePath();
  v3 = +[NSMutableDictionary dictionaryWithContentsOfFile:v2];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  id v15 = v5;

  uint64_t v6 = kMCMetaAllowedGrandfatheredRestrictions;
  v7 = [v15 objectForKeyedSubscript:kMCMetaAllowedGrandfatheredRestrictions];
  id v8 = [v7 mutableCopy];
  v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  v11 = v10;

  BOOL v12 = +[MCHacks sharedHacks];
  [v12 _applyHeuristicsToGranfatheredRestrictionPayloadKeys:v11];

  if ([v11 count])
  {
    _DMLogFunc();
    id v13 = objc_msgSend(v11, "copy", v11);
    [v15 setObject:v13 forKeyedSubscript:v6];

    CFStringRef v14 = MCSystemMetadataFilePath();
    [v15 MCWriteToBinaryFile:v14];
  }
}

- (void)_createSystemMetadataFileIfNeeded
{
  v2 = +[NSFileManager defaultManager];
  v3 = MCSystemMetadataFilePath();
  unsigned __int8 v4 = [v2 fileExistsAtPath:v3];

  if ((v4 & 1) == 0)
  {
    _DMLogFunc();
    id v6 = (id)objc_opt_new();
    id v5 = MCSystemMetadataFilePath();
    [v6 MCWriteToBinaryFile:v5];
  }
}

- (void)_storeAllowedGrandfatheredRestrictionsIfNeeded
{
  [(MCProfileMigrator *)self _setStopFilteringGrandfatheredRestrictionsState:1];
  [(MCProfileMigrator *)self _recomputeProfileRestrictions];
  v3 = +[MCRestrictionManager effectiveGrandfatheredRestrictionPayloadKeysDictionary];
  id v4 = [v3 count];

  if (v4)
  {
    [(MCProfileMigrator *)self _createSystemMetadataFileIfNeeded];
    id v5 = MCSystemMetadataFilePath();
    id v6 = +[NSMutableDictionary dictionaryWithContentsOfFile:v5];

    _DMLogFunc();
    if (v6)
    {
      uint64_t v7 = kMCMetaAllowedGrandfatheredRestrictions;
      id v8 = [v6 objectForKeyedSubscript:kMCMetaAllowedGrandfatheredRestrictions];
      v9 = +[MCRestrictionManager effectiveGrandfatheredRestrictionPayloadKeysDictionary];
      id v10 = +[MCRestrictionManager addRestrictionPayloadKeysDictionary:v9 toRestrictionPayloadKeysDictionary:v8];

      [v6 setObject:v10 forKeyedSubscript:v7];
      v11 = MCSystemMetadataFilePath();
      [v6 MCWriteToBinaryFile:v11];
    }
  }
  else
  {
    _DMLogFunc();
  }

  [(MCProfileMigrator *)self _setStopFilteringGrandfatheredRestrictionsState:0];
}

- (void)_setStopFilteringGrandfatheredRestrictionsState:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCProfileMigrator *)self _createSystemMetadataFileIfNeeded];
  id v4 = MCSystemMetadataFilePath();
  id v7 = +[NSMutableDictionary dictionaryWithContentsOfFile:v4];

  if (v7)
  {
    id v5 = +[NSNumber numberWithBool:v3];
    [v7 setObject:v5 forKeyedSubscript:kMCMetaStopFilteringGrandfatheredRestrictions];

    id v6 = MCSystemMetadataFilePath();
    [v7 MCWriteToBinaryFile:v6];
  }
}

- (void)_allowGrandfatheredRestrictionsIfNeeded
{
  _DMLogFunc();

  [(MCProfileMigrator *)self _storeAllowedGrandfatheredRestrictionsIfNeeded];
}

- (void)_stopAllowingGrandfatheredRestrictions
{
  _DMLogFunc();
  BOOL v3 = MCSystemMetadataFilePath();
  id v5 = +[NSMutableDictionary dictionaryWithContentsOfFile:v3];

  if (v5)
  {
    [v5 setObject:0 forKeyedSubscript:kMCMetaStopFilteringGrandfatheredRestrictions];
    [v5 setObject:0 forKeyedSubscript:kMCMetaAllowedGrandfatheredRestrictions];
    id v4 = MCSystemMetadataFilePath();
    [v5 MCWriteToBinaryFile:v4];
  }
  [(MCProfileMigrator *)self _recomputeProfileRestrictions];
}

- (void)_recomputeProfileRestrictions
{
  id v2 = +[MCProfileConnection sharedConnection];
  [v2 recomputeProfileRestrictionsWithCompletionBlock:&stru_41E8];
}

@end