@interface SLDataMigrationController
+ (id)sharedController;
- (BOOL)needsFileProtectionUpgradeForProfileImagesAtPath:(id)a3 serviceNameForLogging:(id)a4;
- (BOOL)needsMigrationForSocialDaemonBundleID:(id)a3 preferenceKey:(id)a4;
- (void)didFinishMigrationForSocialDaemonBundleID:(id)a3 preferenceKey:(id)a4;
- (void)ensureSocialUserDataDirectory;
- (void)removeAncillarySocialDatabaseFilesWithPrefix:(id)a3 serviceNameForLogging:(id)a4;
@end

@implementation SLDataMigrationController

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedController_sharedController;

  return v2;
}

uint64_t __45__SLDataMigrationController_sharedController__block_invoke()
{
  sharedController_sharedController = objc_alloc_init(SLDataMigrationController);

  return MEMORY[0x1F41817F8]();
}

- (BOOL)needsMigrationForSocialDaemonBundleID:(id)a3 preferenceKey:(id)a4
{
  v5 = (__CFString *)a4;
  v6 = (__CFString *)a3;
  v7 = (void *)DMCopyCurrentBuildVersion();
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFPreferencesSynchronize(v6, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  v10 = (void *)CFPreferencesCopyValue(v5, v6, v8, v9);

  BOOL v11 = v7 && (!v10 || [v7 compare:v10 options:1]);
  return v11;
}

- (void)didFinishMigrationForSocialDaemonBundleID:(id)a3 preferenceKey:(id)a4
{
  applicationID = (__CFString *)a3;
  v5 = (__CFString *)a4;
  v6 = (void *)DMCopyCurrentBuildVersion();
  if (v6)
  {
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
    CFPreferencesSetValue(v5, v6, applicationID, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    CFPreferencesSynchronize(applicationID, v7, v8);
  }
}

- (void)ensureSocialUserDataDirectory
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v2 = SLUserDataDirectory();
  if (([v3 fileExistsAtPath:v2] & 1) == 0) {
    [v3 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:0];
  }
}

- (BOOL)needsFileProtectionUpgradeForProfileImagesAtPath:(id)a3 serviceNameForLogging:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = 0;
  CFStringRef v9 = [v8 contentsOfDirectoryAtPath:v6 error:&v20];
  id v10 = v20;
  if (v10)
  {
    id v11 = v10;
    _SLLog(v4, 3, @"Failed to get contents of %@ profile image directory with errror %@");
    BOOL v12 = 0;
  }
  else
  {
    if (![v9 count])
    {
      BOOL v12 = 0;
      goto LABEL_11;
    }
    v18 = [v9 lastObject];
    v13 = objc_msgSend(@"/", "stringByAppendingString:");
    v14 = [v6 stringByAppendingString:v13];

    id v19 = 0;
    v15 = [v8 attributesOfItemAtPath:v14 error:&v19];
    id v11 = v19;
    v16 = [v15 objectForKey:*MEMORY[0x1E4F28370]];
    BOOL v12 = 1;
    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v16 isEqualToString:*MEMORY[0x1E4F28340]]) {
        BOOL v12 = 0;
      }
    }
  }
LABEL_11:
  _SLLog(v4, 3, @"%@ needs profile image file protection upgrade? %d");

  return v12;
}

- (void)removeAncillarySocialDatabaseFilesWithPrefix:(id)a3 serviceNameForLogging:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SLUserDataDirectory();
  CFStringRef v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = (void *)v8;
  id v19 = [v9 contentsOfDirectoryAtPath:v8 error:0];
  id v10 = v7;
  _SLLog(v4, 7, @"%@ migration got contents of social directory %@");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v19;
  uint64_t v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16, v7, v19);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v16 hasPrefix:v6])
        {
          v17 = [@"/" stringByAppendingString:v16];
          v18 = [v20 stringByAppendingString:v17];

          _SLLog(v4, 7, @"%@ migration trying to delete %@");
          objc_msgSend(v9, "removeItemAtPath:error:", v18, 0, v10, v18);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
}

@end