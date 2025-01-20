@interface MIGlobalConfiguration
+ (id)sharedInstance;
- (BOOL)_isInternalReleaseType;
- (BOOL)allowDeletableSystemApps;
- (BOOL)allowsInternalSecurityPolicy;
- (BOOL)hasEAPFSVolumeSplit;
- (BOOL)hasInternalContent;
- (BOOL)isSharediPad;
- (MIGlobalConfiguration)init;
- (NSDictionary)coreServicesAppBundleIDToInfoMap;
- (NSDictionary)internalAppBundleIDToInfoMap;
- (NSDictionary)stagedSystemAppBundleIDToInfoMap;
- (NSDictionary)systemAppBundleIDToInfoMap;
- (NSDictionary)systemAppPlaceholderBundleIDToInfoMap;
- (NSSet)allExtensionKitExtensionsDirectories;
- (NSSet)allFrameworksDirectories;
- (NSSet)appBundleMetadataItemNames;
- (NSSet)builtInApplicationBundleIDs;
- (NSSet)builtInExtensionKitExtensionsDirectories;
- (NSSet)builtInFrameworkBundleIDs;
- (NSSet)cryptexExtensionKitExtensionsDirectories;
- (NSSet)cryptexFrameworksDirectories;
- (NSSet)dataContainerRootItemNames;
- (NSSet)developerDirectories;
- (NSSet)installationBlacklist;
- (NSSet)standardInfoMapInfoPlistKeys;
- (NSSet)systemAppPlaceholderAppExtensionBundleIDs;
- (NSSet)systemAppPlaceholderBundleIDs;
- (NSSet)systemAppPlaceholderXPCServiceBundleIDs;
- (NSString)alternateThinningModelIdentifier;
- (NSString)primaryPersonaString;
- (NSURL)backedUpStateDirectory;
- (NSURL)backupSystemAppInstallStateFilePath;
- (NSURL)cachesDirectory;
- (NSURL)coreServicesDirectory;
- (NSURL)cryptexAppsDirectory;
- (NSURL)cryptexExtensionKitExtensionsDirectory;
- (NSURL)cryptexOSDirectory;
- (NSURL)dataDirectory;
- (NSURL)developerRootDirectory;
- (NSURL)helperLogDirectory;
- (NSURL)installdLibraryPath;
- (NSURL)installdPath;
- (NSURL)internalAppsDirectory;
- (NSURL)internalExtensionKitExtensionsDirectory;
- (NSURL)internalFrameworksRootDirectory;
- (NSURL)internalRootDirectory;
- (NSURL)lastBuildInfoFileURL;
- (NSURL)logDirectory;
- (NSURL)migrationPlistURL;
- (NSURL)mobilePath;
- (NSURL)oldArchiveDirectory;
- (NSURL)oldDataDirectoryPath;
- (NSURL)oldLoggingPath;
- (NSURL)roleUserMigrationMarkerFilePath;
- (NSURL)rootPath;
- (NSURL)stagedSystemAppsDirectory;
- (NSURL)systemAppDetachedSignaturesDirectory;
- (NSURL)systemAppInstallStateFilePath;
- (NSURL)systemAppPlaceholdersDirectory;
- (NSURL)systemAppsDirectory;
- (NSURL)systemDeveloperRootDirectory;
- (NSURL)systemExtensionKitExtensionsDirectory;
- (NSURL)systemFrameworksRootDirectory;
- (NSURL)testFileSentinelForSyncURL;
- (id)_bundleIDMapForAppsInDirectory:(id)a3;
- (id)_bundleIDMapForAppsInDirectory:(id)a3 loadingAdditionalKeys:(id)a4;
- (id)_bundleIDMapForBundlesInDirectory:(id)a3 withExtension:(id)a4;
- (id)_bundleIDMapForBundlesInDirectory:(id)a3 withExtension:(id)a4 loadingAdditionalKeys:(id)a5;
- (id)disableSystemAppDeletionCanaryFile;
- (unint64_t)helperServiceJetsamLimit;
- (unint64_t)installdJetsamLimit;
- (unsigned)gid;
- (unsigned)uid;
- (void)reScanCoreServicesApps;
- (void)reScanInternalApps;
- (void)reScanSystemApps;
- (void)setSystemAppPlaceholderBundleIDToInfoMap:(id)a3;
@end

@implementation MIGlobalConfiguration

- (MIGlobalConfiguration)init
{
  v17.receiver = self;
  v17.super_class = (Class)MIGlobalConfiguration;
  v2 = [(MIGlobalConfiguration *)&v17 init];
  if (v2)
  {
    id v15 = 0;
    uint64_t v16 = 0;
    MIFetchInfoForUsername("_installd", (uid_t *)&v16 + 1, (gid_t *)&v16, &v15);
    v3 = (NSURL *)v15;
    installdPath = v2->_installdPath;
    v2->_installdPath = v3;
    v5 = v3;

    unsigned int v6 = v16;
    v2->_uid = HIDWORD(v16);
    v2->_gid = v6;
    id v14 = 0;
    MIFetchInfoForUsername("mobile", 0, 0, &v14);
    v7 = (NSURL *)v14;
    mobilePath = v2->_mobilePath;
    v2->_mobilePath = v7;
    v9 = v7;

    uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/" isDirectory:1];
    rootPath = v2->_rootPath;
    v2->_rootPath = (NSURL *)v10;

    v12 = [getUMUserManagerClass_0() sharedManager];
    v2->_isSharediPad = [v12 isSharedIPad];
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MIGlobalConfiguration_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __39__MIGlobalConfiguration_sharedInstance__block_invoke()
{
  sharedInstance_instance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (BOOL)allowDeletableSystemApps
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MIGlobalConfiguration_allowDeletableSystemApps__block_invoke;
  block[3] = &unk_1E62E6B68;
  block[4] = self;
  if (allowDeletableSystemApps_onceToken != -1) {
    dispatch_once(&allowDeletableSystemApps_onceToken, block);
  }
  return self->_allowDeletableSystemApps;
}

uint64_t __49__MIGlobalConfiguration_allowDeletableSystemApps__block_invoke(uint64_t a1)
{
  v2 = +[MIFileManager defaultManager];
  v3 = [*(id *)(a1 + 32) disableSystemAppDeletionCanaryFile];
  int v4 = [v2 itemExistsAtURL:v3];

  if (v4)
  {
    uint64_t result = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      uint64_t result = MOLogWrite();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  }
  else
  {
    uint64_t result = +[ICLFeatureFlags systemAppDeletionEnabled];
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = result;
  }
  return result;
}

- (BOOL)hasEAPFSVolumeSplit
{
  return 1;
}

- (NSURL)oldDataDirectoryPath
{
  v2 = [(MIGlobalConfiguration *)self mobilePath];
  v3 = [v2 URLByAppendingPathComponent:@"Library/MobileInstallation" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)oldLoggingPath
{
  v2 = [(MIGlobalConfiguration *)self mobilePath];
  v3 = [v2 URLByAppendingPathComponent:@"Library/Logs/MobileInstallation" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)oldArchiveDirectory
{
  v2 = [(MIGlobalConfiguration *)self mobilePath];
  v3 = [v2 URLByAppendingPathComponent:@"Media/ApplicationArchives" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)roleUserMigrationMarkerFilePath
{
  v2 = [(MIGlobalConfiguration *)self dataDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"RoleUserMigration.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)systemAppInstallStateFilePath
{
  v2 = [(MIGlobalConfiguration *)self backedUpStateDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"SystemAppInstallState.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)backupSystemAppInstallStateFilePath
{
  v2 = [(MIGlobalConfiguration *)self backedUpStateDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"BackupSystemAppInstallState.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)logDirectory
{
  v2 = [(MIGlobalConfiguration *)self installdLibraryPath];
  v3 = [v2 URLByAppendingPathComponent:@"Logs/MobileInstallation" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)helperLogDirectory
{
  if (self->_helperLogDirectory)
  {
    uint64_t v3 = 493;
  }
  else
  {
    uint64_t v18 = 1;
    uint64_t v4 = container_system_group_path_for_identifier();
    if (v4)
    {
      v5 = (void *)v4;
      unsigned int v6 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v4 isDirectory:1 relativeToURL:0];
      v7 = [v6 URLByAppendingPathComponent:@"Library/Logs" isDirectory:1];
      helperLogDirectory = self->_helperLogDirectory;
      self->_helperLogDirectory = v7;

      free(v5);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v15 = v18;
      MOLogWrite();
    }
    uint64_t v3 = 511;
  }
  v9 = +[MIFileManager defaultManager];
  uint64_t v10 = self->_helperLogDirectory;
  id v17 = 0;
  char v11 = [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 mode:v3 error:&v17];
  id v12 = v17;

  if ((v11 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v16 = [(NSURL *)self->_helperLogDirectory path];
    MOLogWrite();
  }
  v13 = self->_helperLogDirectory;

  return v13;
}

- (NSURL)internalRootDirectory
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"AppleInternal" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)developerRootDirectory
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Developer" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)systemDeveloperRootDirectory
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"System/Developer" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)coreServicesDirectory
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"System/Library/CoreServices" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)systemAppsDirectory
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Applications" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)systemAppPlaceholdersDirectory
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"System/Library/AppPlaceholders" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)systemAppDetachedSignaturesDirectory
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"System/Library/AppSignatures" isDirectory:1];

  return (NSURL *)v3;
}

- (id)disableSystemAppDeletionCanaryFile
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"System/Library/disableSystemAppDeletion" isDirectory:0];

  return v3;
}

- (NSURL)internalAppsDirectory
{
  v2 = [(MIGlobalConfiguration *)self internalRootDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Applications" isDirectory:1];

  return (NSURL *)v3;
}

- (NSSet)developerDirectories
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [(MIGlobalConfiguration *)self developerRootDirectory];
  v5 = [(MIGlobalConfiguration *)self systemDeveloperRootDirectory];
  unsigned int v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);

  return (NSSet *)v6;
}

- (NSURL)stagedSystemAppsDirectory
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"private/var/staged_system_apps" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)cryptexAppsDirectory
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"System/Cryptexes/App" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)cryptexOSDirectory
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"System/Cryptexes/OS" isDirectory:1];

  return (NSURL *)v3;
}

- (NSSet)cryptexFrameworksDirectories
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MIGlobalConfiguration_cryptexFrameworksDirectories__block_invoke;
  block[3] = &unk_1E62E6B68;
  block[4] = self;
  if (cryptexFrameworksDirectories_onceToken != -1) {
    dispatch_once(&cryptexFrameworksDirectories_onceToken, block);
  }
  return self->_cryptexFrameworksDirectories;
}

void __53__MIGlobalConfiguration_cryptexFrameworksDirectories__block_invoke(uint64_t a1)
{
  id v11 = (id)objc_opt_new();
  v2 = [*(id *)(a1 + 32) cryptexOSDirectory];
  uint64_t v3 = [*(id *)(a1 + 32) systemFrameworksRootDirectory];
  uint64_t v4 = [v3 path];
  v5 = [v2 URLByAppendingPathComponent:v4 isDirectory:1];

  unsigned int v6 = [v5 URLByAppendingPathComponent:@"Frameworks" isDirectory:1];
  [v11 addObject:v6];

  v7 = [v5 URLByAppendingPathComponent:@"PrivateFrameworks" isDirectory:1];
  [v11 addObject:v7];

  uint64_t v8 = [v11 copy];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v8;
}

- (NSURL)systemFrameworksRootDirectory
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"System/Library" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)internalFrameworksRootDirectory
{
  v2 = [(MIGlobalConfiguration *)self internalRootDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Library" isDirectory:1];

  return (NSURL *)v3;
}

- (NSSet)allFrameworksDirectories
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MIGlobalConfiguration_allFrameworksDirectories__block_invoke;
  block[3] = &unk_1E62E6B68;
  block[4] = self;
  if (allFrameworksDirectories_onceToken != -1) {
    dispatch_once(&allFrameworksDirectories_onceToken, block);
  }
  return self->_allFrameworksDirectories;
}

void __49__MIGlobalConfiguration_allFrameworksDirectories__block_invoke(uint64_t a1)
{
  id v17 = (id)objc_opt_new();
  v2 = [*(id *)(a1 + 32) systemFrameworksRootDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Frameworks" isDirectory:1];
  [v17 addObject:v3];

  uint64_t v4 = [*(id *)(a1 + 32) systemFrameworksRootDirectory];
  v5 = [v4 URLByAppendingPathComponent:@"PrivateFrameworks" isDirectory:1];
  [v17 addObject:v5];

  if ([*(id *)(a1 + 32) hasInternalContent])
  {
    unsigned int v6 = [*(id *)(a1 + 32) internalRootDirectory];
    v7 = [v6 URLByAppendingPathComponent:@"Frameworks" isDirectory:1];
    [v17 addObject:v7];

    uint64_t v8 = [*(id *)(a1 + 32) internalRootDirectory];
    uint64_t v9 = [v8 URLByAppendingPathComponent:@"PrivateFrameworks" isDirectory:1];
    [v17 addObject:v9];

    uint64_t v10 = [*(id *)(a1 + 32) internalFrameworksRootDirectory];
    id v11 = [v10 URLByAppendingPathComponent:@"Frameworks" isDirectory:1];
    [v17 addObject:v11];

    id v12 = [*(id *)(a1 + 32) internalFrameworksRootDirectory];
    v13 = [v12 URLByAppendingPathComponent:@"PrivateFrameworks" isDirectory:1];
    [v17 addObject:v13];
  }
  uint64_t v14 = [v17 copy];
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

- (NSURL)systemExtensionKitExtensionsDirectory
{
  v2 = [(MIGlobalConfiguration *)self rootPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"System/Library/ExtensionKit/Extensions" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)internalExtensionKitExtensionsDirectory
{
  v2 = [(MIGlobalConfiguration *)self internalRootDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Library/ExtensionKit/Extensions" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)cryptexExtensionKitExtensionsDirectory
{
  v2 = [(MIGlobalConfiguration *)self cryptexOSDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"System/Library/ExtensionKit/Extensions" isDirectory:1];

  return (NSURL *)v3;
}

- (NSSet)builtInExtensionKitExtensionsDirectories
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MIGlobalConfiguration *)self systemExtensionKitExtensionsDirectory];
  [v3 addObject:v4];

  if ([(MIGlobalConfiguration *)self hasInternalContent])
  {
    v5 = [(MIGlobalConfiguration *)self internalExtensionKitExtensionsDirectory];
    [v3 addObject:v5];
  }
  unsigned int v6 = (void *)[v3 copy];

  return (NSSet *)v6;
}

- (NSSet)cryptexExtensionKitExtensionsDirectories
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(MIGlobalConfiguration *)self cryptexExtensionKitExtensionsDirectory];
  uint64_t v4 = [v2 setWithObject:v3];

  return (NSSet *)v4;
}

- (NSSet)allExtensionKitExtensionsDirectories
{
  uint64_t v3 = [(MIGlobalConfiguration *)self builtInExtensionKitExtensionsDirectories];
  uint64_t v4 = [(MIGlobalConfiguration *)self cryptexExtensionKitExtensionsDirectories];
  v5 = [v3 setByAddingObjectsFromSet:v4];

  return (NSSet *)v5;
}

- (NSURL)installdLibraryPath
{
  v2 = [(MIGlobalConfiguration *)self installdPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Library" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)dataDirectory
{
  v2 = [(MIGlobalConfiguration *)self installdLibraryPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"MobileInstallation" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)cachesDirectory
{
  v2 = [(MIGlobalConfiguration *)self installdLibraryPath];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Caches" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)backedUpStateDirectory
{
  v2 = [(MIGlobalConfiguration *)self dataDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"BackedUpState" isDirectory:1];

  return (NSURL *)v3;
}

- (NSSet)appBundleMetadataItemNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Manifest.plist", @"iTunesArtwork", @"iTunesMetadata.plist", @"GeoJSON", 0);
}

- (NSSet)dataContainerRootItemNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Documents", @"Library", @"tmp", @"StoreKit", 0);
}

- (NSSet)installationBlacklist
{
  if (installationBlacklist_onceToken != -1) {
    dispatch_once(&installationBlacklist_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)installationBlacklist_blacklist;
  return (NSSet *)v2;
}

uint64_t __46__MIGlobalConfiguration_installationBlacklist__block_invoke()
{
  installationBlacklist_blacklist = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.iOS6Updater", @"is.workflow.my.app", @"com.apple.mobileme.fmf1", @"com.apple.mobileme.fmip1", 0);
  return MEMORY[0x1F41817F8]();
}

- (NSSet)standardInfoMapInfoPlistKeys
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F1CFF8], *MEMORY[0x1E4F1D020], 0);
}

- (id)_bundleIDMapForBundlesInDirectory:(id)a3 withExtension:(id)a4 loadingAdditionalKeys:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  id v12 = [(MIGlobalConfiguration *)self standardInfoMapInfoPlistKeys];
  v13 = v12;
  if (v10)
  {
    uint64_t v14 = [v12 setByAddingObjectsFromSet:v10];

    v13 = (void *)v14;
  }
  uint64_t v15 = +[MIFileManager defaultManager];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __95__MIGlobalConfiguration__bundleIDMapForBundlesInDirectory_withExtension_loadingAdditionalKeys___block_invoke;
  v25[3] = &unk_1E62E7248;
  id v16 = v9;
  id v26 = v16;
  id v17 = v13;
  id v27 = v17;
  id v18 = v11;
  id v28 = v18;
  v19 = [v15 enumerateURLsForItemsInDirectoryAtURL:v8 ignoreSymlinks:1 withBlock:v25];

  if (!v19)
  {
    uint64_t v22 = [v18 copy];
    goto LABEL_8;
  }
  v20 = [v19 domain];
  if ([v20 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    uint64_t v21 = [v19 code];

    if (v21 == 2)
    {
      uint64_t v22 = objc_opt_new();
LABEL_8:
      v23 = (void *)v22;
      goto LABEL_14;
    }
  }
  else
  {
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  v23 = 0;
LABEL_14:

  return v23;
}

uint64_t __95__MIGlobalConfiguration__bundleIDMapForBundlesInDirectory_withExtension_loadingAdditionalKeys___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  unsigned int v6 = v5;
  if (a3 == 4)
  {
    v7 = [v5 pathExtension];
    if ([v7 isEqualToString:*(void *)(a1 + 32)])
    {
      id v8 = MILoadInfoPlist(v6, *(void **)(a1 + 40));
      id v9 = v8;
      if (v8)
      {
        id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
        objc_opt_class();
        id v11 = v10;
        if (objc_opt_isKindOfClass()) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }

        if (v12)
        {
          [v9 setObject:v6 forKeyedSubscript:@"com.apple.MobileInstallation.bundleURL"];
          v13 = (void *)[v9 copy];
          [*(id *)(a1 + 48) setObject:v13 forKeyedSubscript:v12];
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          MOLogWrite();
        }
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        MOLogWrite();
      }
    }
  }

  return 1;
}

- (id)_bundleIDMapForBundlesInDirectory:(id)a3 withExtension:(id)a4
{
  return [(MIGlobalConfiguration *)self _bundleIDMapForBundlesInDirectory:a3 withExtension:a4 loadingAdditionalKeys:0];
}

- (id)_bundleIDMapForAppsInDirectory:(id)a3 loadingAdditionalKeys:(id)a4
{
  return [(MIGlobalConfiguration *)self _bundleIDMapForBundlesInDirectory:a3 withExtension:@"app" loadingAdditionalKeys:a4];
}

- (id)_bundleIDMapForAppsInDirectory:(id)a3
{
  return [(MIGlobalConfiguration *)self _bundleIDMapForAppsInDirectory:a3 loadingAdditionalKeys:0];
}

- (NSSet)builtInApplicationBundleIDs
{
  uint64_t v3 = [(MIGlobalConfiguration *)self systemAppBundleIDToInfoMap];
  uint64_t v4 = [v3 allKeys];

  id v5 = [(MIGlobalConfiguration *)self internalAppBundleIDToInfoMap];
  unsigned int v6 = [v5 allKeys];

  v7 = objc_opt_new();
  [v7 addObjectsFromArray:v4];
  [v7 addObjectsFromArray:v6];
  id v8 = (void *)[v7 copy];

  return (NSSet *)v8;
}

- (NSDictionary)coreServicesAppBundleIDToInfoMap
{
  v2 = self;
  objc_sync_enter(v2);
  coreServicesAppBundleIDToInfoMap = v2->_coreServicesAppBundleIDToInfoMap;
  if (!coreServicesAppBundleIDToInfoMap)
  {
    uint64_t v4 = [(MIGlobalConfiguration *)v2 coreServicesDirectory];
    uint64_t v5 = [(MIGlobalConfiguration *)v2 _bundleIDMapForAppsInDirectory:v4];
    unsigned int v6 = v2->_coreServicesAppBundleIDToInfoMap;
    v2->_coreServicesAppBundleIDToInfoMap = (NSDictionary *)v5;

    coreServicesAppBundleIDToInfoMap = v2->_coreServicesAppBundleIDToInfoMap;
  }
  v7 = coreServicesAppBundleIDToInfoMap;
  objc_sync_exit(v2);

  return v7;
}

- (NSDictionary)systemAppBundleIDToInfoMap
{
  v2 = self;
  objc_sync_enter(v2);
  systemAppBundleIDToInfoMap = v2->_systemAppBundleIDToInfoMap;
  if (!systemAppBundleIDToInfoMap)
  {
    uint64_t v4 = [(MIGlobalConfiguration *)v2 systemAppsDirectory];
    uint64_t v5 = [(MIGlobalConfiguration *)v2 _bundleIDMapForAppsInDirectory:v4];
    unsigned int v6 = v2->_systemAppBundleIDToInfoMap;
    v2->_systemAppBundleIDToInfoMap = (NSDictionary *)v5;

    systemAppBundleIDToInfoMap = v2->_systemAppBundleIDToInfoMap;
  }
  v7 = systemAppBundleIDToInfoMap;
  objc_sync_exit(v2);

  return v7;
}

- (NSDictionary)stagedSystemAppBundleIDToInfoMap
{
  v2 = self;
  objc_sync_enter(v2);
  stagedSystemAppBundleIDToInfoMap = v2->_stagedSystemAppBundleIDToInfoMap;
  if (!stagedSystemAppBundleIDToInfoMap)
  {
    uint64_t v4 = [(MIGlobalConfiguration *)v2 stagedSystemAppsDirectory];
    uint64_t v5 = [(MIGlobalConfiguration *)v2 _bundleIDMapForAppsInDirectory:v4];
    unsigned int v6 = v2->_stagedSystemAppBundleIDToInfoMap;
    v2->_stagedSystemAppBundleIDToInfoMap = (NSDictionary *)v5;

    stagedSystemAppBundleIDToInfoMap = v2->_stagedSystemAppBundleIDToInfoMap;
  }
  v7 = stagedSystemAppBundleIDToInfoMap;
  objc_sync_exit(v2);

  return v7;
}

- (NSDictionary)systemAppPlaceholderBundleIDToInfoMap
{
  v2 = self;
  objc_sync_enter(v2);
  systemAppPlaceholderBundleIDToInfoMap = v2->_systemAppPlaceholderBundleIDToInfoMap;
  if (!systemAppPlaceholderBundleIDToInfoMap)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"UIRequiredDeviceCapabilities", @"UIDeviceFamily", @"LSRequiredFeatureFlags", @"LSEligibilityPredicatesValidAtEraseInstallDataMigration", @"LSEligibilityInstallPredicate", @"LSEligibilityUninstallPredicate", @"LSInstallByDefault", 0);
    uint64_t v5 = [(MIGlobalConfiguration *)v2 systemAppPlaceholdersDirectory];
    uint64_t v6 = [(MIGlobalConfiguration *)v2 _bundleIDMapForAppsInDirectory:v5 loadingAdditionalKeys:v4];
    v7 = v2->_systemAppPlaceholderBundleIDToInfoMap;
    v2->_systemAppPlaceholderBundleIDToInfoMap = (NSDictionary *)v6;

    systemAppPlaceholderBundleIDToInfoMap = v2->_systemAppPlaceholderBundleIDToInfoMap;
  }
  id v8 = systemAppPlaceholderBundleIDToInfoMap;
  objc_sync_exit(v2);

  return v8;
}

- (void)setSystemAppPlaceholderBundleIDToInfoMap:(id)a3
{
  uint64_t v4 = (NSDictionary *)a3;
  obj = self;
  objc_sync_enter(obj);
  systemAppPlaceholderBundleIDToInfoMap = obj->_systemAppPlaceholderBundleIDToInfoMap;
  obj->_systemAppPlaceholderBundleIDToInfoMap = v4;

  objc_sync_exit(obj);
}

- (NSDictionary)internalAppBundleIDToInfoMap
{
  v2 = self;
  objc_sync_enter(v2);
  internalAppBundleIDToInfoMap = v2->_internalAppBundleIDToInfoMap;
  if (!internalAppBundleIDToInfoMap)
  {
    uint64_t v4 = [(MIGlobalConfiguration *)v2 internalAppsDirectory];
    uint64_t v5 = [(MIGlobalConfiguration *)v2 _bundleIDMapForAppsInDirectory:v4];
    uint64_t v6 = v2->_internalAppBundleIDToInfoMap;
    v2->_internalAppBundleIDToInfoMap = (NSDictionary *)v5;

    internalAppBundleIDToInfoMap = v2->_internalAppBundleIDToInfoMap;
  }
  v7 = internalAppBundleIDToInfoMap;
  objc_sync_exit(v2);

  return v7;
}

- (NSSet)builtInFrameworkBundleIDs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  builtInFrameworkBundleIDs = v2->_builtInFrameworkBundleIDs;
  if (!builtInFrameworkBundleIDs)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [(MIGlobalConfiguration *)v2 allFrameworksDirectories];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = [(MIGlobalConfiguration *)v2 _bundleIDMapForBundlesInDirectory:*(void *)(*((void *)&v15 + 1) + 8 * i) withExtension:@"framework"];
          id v10 = [v9 allKeys];
          [v4 addObjectsFromArray:v10];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    uint64_t v11 = [v4 copy];
    id v12 = v2->_builtInFrameworkBundleIDs;
    v2->_builtInFrameworkBundleIDs = (NSSet *)v11;

    builtInFrameworkBundleIDs = v2->_builtInFrameworkBundleIDs;
  }
  v13 = builtInFrameworkBundleIDs;
  objc_sync_exit(v2);

  return v13;
}

- (NSSet)systemAppPlaceholderBundleIDs
{
  v2 = self;
  objc_sync_enter(v2);
  systemAppPlaceholderBundleIDs = v2->_systemAppPlaceholderBundleIDs;
  if (!systemAppPlaceholderBundleIDs)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = [(MIGlobalConfiguration *)v2 systemAppPlaceholderBundleIDToInfoMap];
    uint64_t v6 = [v5 allKeys];
    uint64_t v7 = [v4 setWithArray:v6];
    id v8 = v2->_systemAppPlaceholderBundleIDs;
    v2->_systemAppPlaceholderBundleIDs = (NSSet *)v7;

    systemAppPlaceholderBundleIDs = v2->_systemAppPlaceholderBundleIDs;
  }
  id v9 = systemAppPlaceholderBundleIDs;
  objc_sync_exit(v2);

  return v9;
}

- (NSSet)systemAppPlaceholderAppExtensionBundleIDs
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  systemAppPlaceholderAppExtensionBundleIDs = v2->_systemAppPlaceholderAppExtensionBundleIDs;
  if (!systemAppPlaceholderAppExtensionBundleIDs)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
    uint64_t v4 = [(MIGlobalConfiguration *)v2 systemAppPlaceholderBundleIDToInfoMap];
    uint64_t v5 = [v4 allValues];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = [*(id *)(*((void *)&v23 + 1) + 8 * i) objectForKeyedSubscript:@"com.apple.MobileInstallation.bundleURL"];
          id v10 = v9;
          if (v9)
          {
            uint64_t v11 = [v9 URLByAppendingPathComponent:@"PlugIns" isDirectory:1];
            id v12 = [(MIGlobalConfiguration *)v2 _bundleIDMapForBundlesInDirectory:v11 withExtension:@"appex"];
            if ([v12 count])
            {
              v13 = [v12 allKeys];
              [v22 addObjectsFromArray:v13];
            }
            uint64_t v14 = [v10 URLByAppendingPathComponent:@"Extensions" isDirectory:1];
            long long v15 = [(MIGlobalConfiguration *)v2 _bundleIDMapForBundlesInDirectory:v14 withExtension:@"appex"];

            if ([v15 count])
            {
              long long v16 = [v15 allKeys];
              [v22 addObjectsFromArray:v16];
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v6);
    }

    uint64_t v17 = [v22 copy];
    long long v18 = v2->_systemAppPlaceholderAppExtensionBundleIDs;
    v2->_systemAppPlaceholderAppExtensionBundleIDs = (NSSet *)v17;

    systemAppPlaceholderAppExtensionBundleIDs = v2->_systemAppPlaceholderAppExtensionBundleIDs;
  }
  v19 = systemAppPlaceholderAppExtensionBundleIDs;
  objc_sync_exit(v2);

  return v19;
}

- (NSSet)systemAppPlaceholderXPCServiceBundleIDs
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  systemAppPlaceholderXPCServiceBundleIDs = v2->_systemAppPlaceholderXPCServiceBundleIDs;
  if (!systemAppPlaceholderXPCServiceBundleIDs)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
    uint64_t v4 = v2;
    uint64_t v5 = [(MIGlobalConfiguration *)v2 systemAppPlaceholderBundleIDToInfoMap];
    uint64_t v6 = [v5 allValues];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = [*(id *)(*((void *)&v21 + 1) + 8 * i) objectForKeyedSubscript:@"com.apple.MobileInstallation.bundleURL"];
          id v12 = v11;
          if (v11)
          {
            v13 = [v11 URLByAppendingPathComponent:@"XPCServices" isDirectory:1];
            uint64_t v14 = [(MIGlobalConfiguration *)v4 _bundleIDMapForBundlesInDirectory:v13 withExtension:@"xpc"];
            if ([v14 count])
            {
              long long v15 = [v14 allKeys];
              [v20 addObjectsFromArray:v15];
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }

    uint64_t v16 = [v20 copy];
    uint64_t v17 = v4->_systemAppPlaceholderXPCServiceBundleIDs;
    v4->_systemAppPlaceholderXPCServiceBundleIDs = (NSSet *)v16;

    systemAppPlaceholderXPCServiceBundleIDs = v4->_systemAppPlaceholderXPCServiceBundleIDs;
    v2 = v4;
  }
  long long v18 = systemAppPlaceholderXPCServiceBundleIDs;
  objc_sync_exit(v2);

  return v18;
}

- (void)reScanSystemApps
{
  id obj = self;
  objc_sync_enter(obj);
  systemAppBundleIDToInfoMap = obj->_systemAppBundleIDToInfoMap;
  obj->_systemAppBundleIDToInfoMap = 0;

  systemAppPlaceholderBundleIDToInfoMap = obj->_systemAppPlaceholderBundleIDToInfoMap;
  obj->_systemAppPlaceholderBundleIDToInfoMap = 0;

  builtInFrameworkBundleIDs = obj->_builtInFrameworkBundleIDs;
  obj->_builtInFrameworkBundleIDs = 0;

  objc_sync_exit(obj);
}

- (void)reScanCoreServicesApps
{
  id obj = self;
  objc_sync_enter(obj);
  coreServicesAppBundleIDToInfoMap = obj->_coreServicesAppBundleIDToInfoMap;
  obj->_coreServicesAppBundleIDToInfoMap = 0;

  objc_sync_exit(obj);
}

- (void)reScanInternalApps
{
  id obj = self;
  objc_sync_enter(obj);
  internalAppBundleIDToInfoMap = obj->_internalAppBundleIDToInfoMap;
  obj->_internalAppBundleIDToInfoMap = 0;

  builtInFrameworkBundleIDs = obj->_builtInFrameworkBundleIDs;
  obj->_builtInFrameworkBundleIDs = 0;

  objc_sync_exit(obj);
}

- (NSString)alternateThinningModelIdentifier
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.itunesstored"];
  uint64_t v3 = [v2 stringForKey:@"ThinnedAppVariantID"];

  return (NSString *)v3;
}

- (NSURL)migrationPlistURL
{
  v2 = [(MIGlobalConfiguration *)self dataDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"MigrationInfo.plist" isDirectory:0];

  if (v3)
  {
    id v4 = v3;
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  return (NSURL *)v3;
}

- (NSURL)lastBuildInfoFileURL
{
  v2 = [(MIGlobalConfiguration *)self dataDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"LastBuildInfo.plist" isDirectory:0];

  if (v3)
  {
    id v4 = v3;
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  return (NSURL *)v3;
}

- (BOOL)_isInternalReleaseType
{
  if (_isInternalReleaseType_onceToken != -1) {
    dispatch_once(&_isInternalReleaseType_onceToken, &__block_literal_global_213);
  }
  return _isInternalReleaseType_isInternalReleaseType;
}

void __47__MIGlobalConfiguration__isInternalReleaseType__block_invoke()
{
  id v1 = (id)_CFCopySystemVersionDictionary();
  v0 = [v1 objectForKeyedSubscript:@"ReleaseType"];
  _isInternalReleaseType_isInternalReleaseType = [v0 isEqualToString:@"Internal"];
}

- (BOOL)allowsInternalSecurityPolicy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MIGlobalConfiguration_allowsInternalSecurityPolicy__block_invoke;
  block[3] = &unk_1E62E6B68;
  block[4] = self;
  if (allowsInternalSecurityPolicy_onceToken != -1) {
    dispatch_once(&allowsInternalSecurityPolicy_onceToken, block);
  }
  return allowsInternalSecurityPolicy_allowsInternalSecurityPolicy;
}

uint64_t __53__MIGlobalConfiguration_allowsInternalSecurityPolicy__block_invoke(uint64_t a1)
{
  uint64_t result = os_variant_allows_internal_security_policies();
  allowsInternalSecurityPolicy_allowsInternalSecurityPolicy = result;
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) _isInternalReleaseType];
    if (result)
    {
      uint64_t result = gLogHandle;
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        return MOLogWrite();
      }
    }
  }
  return result;
}

- (BOOL)hasInternalContent
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MIGlobalConfiguration_hasInternalContent__block_invoke;
  block[3] = &unk_1E62E6B68;
  block[4] = self;
  if (hasInternalContent_onceToken != -1) {
    dispatch_once(&hasInternalContent_onceToken, block);
  }
  return hasInternalContent_hasInternalContent;
}

uint64_t __43__MIGlobalConfiguration_hasInternalContent__block_invoke(uint64_t a1)
{
  uint64_t result = os_variant_has_internal_content();
  hasInternalContent_hasInternalContent = result;
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) _isInternalReleaseType];
    if (result)
    {
      uint64_t result = gLogHandle;
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        return MOLogWrite();
      }
    }
  }
  return result;
}

- (unint64_t)installdJetsamLimit
{
  return 78643200;
}

- (unint64_t)helperServiceJetsamLimit
{
  return 5242880;
}

- (NSString)primaryPersonaString
{
  if (primaryPersonaString_onceToken != -1) {
    dispatch_once(&primaryPersonaString_onceToken, &__block_literal_global_228);
  }
  v2 = (void *)primaryPersonaString_personalPersona;
  return (NSString *)v2;
}

void __45__MIGlobalConfiguration_primaryPersonaString__block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v0 = [getUMUserManagerClass_0() sharedManager];
  id v1 = [v0 listAllPersonaWithAttributes];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "isPersonalPersona", (void)v10))
        {
          uint64_t v8 = [v7 userPersonaUniqueString];
          uint64_t v9 = (void *)primaryPersonaString_personalPersona;
          primaryPersonaString_personalPersona = v8;

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (NSURL)testFileSentinelForSyncURL
{
  id v2 = [(MIGlobalConfiguration *)self dataDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"TestFileForSync" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)rootPath
{
  return self->_rootPath;
}

- (NSURL)installdPath
{
  return self->_installdPath;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unsigned)gid
{
  return self->_gid;
}

- (BOOL)isSharediPad
{
  return self->_isSharediPad;
}

- (NSURL)mobilePath
{
  return self->_mobilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobilePath, 0);
  objc_storeStrong((id *)&self->_installdPath, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_systemAppPlaceholderXPCServiceBundleIDs, 0);
  objc_storeStrong((id *)&self->_systemAppPlaceholderAppExtensionBundleIDs, 0);
  objc_storeStrong((id *)&self->_systemAppPlaceholderBundleIDs, 0);
  objc_storeStrong((id *)&self->_builtInFrameworkBundleIDs, 0);
  objc_storeStrong((id *)&self->_internalAppBundleIDToInfoMap, 0);
  objc_storeStrong((id *)&self->_systemAppPlaceholderBundleIDToInfoMap, 0);
  objc_storeStrong((id *)&self->_stagedSystemAppBundleIDToInfoMap, 0);
  objc_storeStrong((id *)&self->_systemAppBundleIDToInfoMap, 0);
  objc_storeStrong((id *)&self->_coreServicesAppBundleIDToInfoMap, 0);
  objc_storeStrong((id *)&self->_allFrameworksDirectories, 0);
  objc_storeStrong((id *)&self->_cryptexFrameworksDirectories, 0);
  objc_storeStrong((id *)&self->_helperLogDirectory, 0);
}

@end