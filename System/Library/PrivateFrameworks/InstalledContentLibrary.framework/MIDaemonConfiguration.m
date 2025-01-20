@interface MIDaemonConfiguration
+ (id)sharedInstance;
- (BOOL)allowPatchWithoutSinf;
- (BOOL)codeSigningEnforcementIsDisabled;
- (BOOL)deviceHasPersonas;
- (BOOL)haveUpdatedAppExtensionDataContainersWithParentID;
- (BOOL)localSigningIsUnrestricted;
- (BOOL)requireEligibilityChecksForAppsInDevelopment;
- (BOOL)skipDeviceFamilyCheck;
- (BOOL)skipThinningCheck;
- (BOOL)wasErroneousContainerCleanupDone;
- (MIDaemonConfiguration)init;
- (NSURL)currentUserCachesDirectory;
- (NSURL)currentUserDataDirectory;
- (NSURL)currentUserJournalStorageBaseURL;
- (NSURL)currentUserLaunchServicesOperationLookAsideStorageBaseURL;
- (NSURL)currentUserLaunchServicesOperationStorageBaseURL;
- (NSURL)daemonUserDataLibraryDirectory;
- (NSURL)journalStorageBaseURL;
- (NSURL)launchServicesOperationLookAsideStorageBaseURL;
- (NSURL)launchServicesOperationStorageBaseURL;
- (NSURL)stagingRootForSystemContent;
- (NSURL)stagingRootForUserContent;
- (id)builtInApplicationBundleIDs;
- (id)stagingRootForDevice:(int)a3 url:(id)a4 identifier:(unint64_t *)a5 error:(id *)a6;
- (id)stagingRootForIdentifier:(unint64_t)a3;
- (id)stagingRootForURL:(id)a3 identifier:(unint64_t *)a4 error:(id *)a5;
- (int64_t)nSimultaneousInstallations;
- (unint64_t)estimatedAvailableMemoryForValidation;
- (unsigned)installQOSOverride;
- (void)init;
- (void)setErroneousContainerCleanupDone:(BOOL)a3;
- (void)setHaveUpdatedAppExtensionDataContainersWithParentID:(BOOL)a3;
@end

@implementation MIDaemonConfiguration

- (MIDaemonConfiguration)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)MIDaemonConfiguration;
  v2 = [(MIGlobalConfiguration *)&v18 init];
  if (!v2) {
    return v2;
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobile.installation"];
  v4 = [v3 stringForKey:@"InstallQOSOverride"];
  v5 = v4;
  if (!v4 || ([v4 isEqualToString:@"unspecified"] & 1) != 0) {
    goto LABEL_4;
  }
  if ([v5 isEqualToString:@"interactive"])
  {
    v2->_installQOSOverride = 33;
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if ([v5 isEqualToString:@"initiated"])
  {
    v2->_installQOSOverride = 25;
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if ([v5 isEqualToString:@"default"])
  {
    v2->_installQOSOverride = 21;
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if ([v5 isEqualToString:@"utility"])
  {
    v2->_installQOSOverride = 17;
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if ([v5 isEqualToString:@"background"])
  {
    v2->_installQOSOverride = 9;
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_25;
    }
LABEL_24:
    MOLogWrite();
    goto LABEL_25;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v14 = v5;
    MOLogWrite();
  }
LABEL_4:
  v2->_installQOSOverride = 0;
LABEL_25:
  if (objc_msgSend(v3, "BOOLForKey:", @"SkipDeviceFamilyCheck", v14))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
    char v6 = 1;
  }
  else
  {
    char v6 = 0;
  }
  v2->_skipDeviceFamilyCheck = v6;
  if ([v3 BOOLForKey:@"SkipThinningCheck"])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
    char v7 = 1;
  }
  else
  {
    char v7 = 0;
  }
  v2->_skipThinningCheck = v7;
  if ([v3 BOOLForKey:@"AllowPatchInstallationWithoutSinf"])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
  }
  v2->_allowPatchWithoutSinf = v8;
  v2->_nSimultaneousInstallations = 5;
  uint64_t v9 = [v3 integerForKey:@"SimultaneousInstallsNumber"];
  if (v9 >= 1)
  {
    int64_t v10 = v9;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      uint64_t v15 = v9;
      MOLogWrite();
    }
    v2->_nSimultaneousInstallations = v10;
  }
  v2->_requireEligibilityChecksForAppsInDevelopment = objc_msgSend(v3, "BOOLForKey:", @"RequireEligibilityForInDevelopmentApps", v15);
  v17.receiver = v2;
  v17.super_class = (Class)MIDaemonConfiguration;
  id v11 = [(MIGlobalConfiguration *)&v17 installdJetsamLimit];
  if ((unint64_t)v11 <= 0xC00000) {
    [(MIDaemonConfiguration *)&v16 init];
  }
  v2->_estimatedAvailableMemoryForValidation = (unint64_t)v11 - 12582912;
  if ([(MIGlobalConfiguration *)v2 isSharediPad] || (MGGetBoolAnswer() & 1) != 0) {
    char v12 = 0;
  }
  else {
    char v12 = os_variant_uses_ephemeral_storage() ^ 1;
  }
  v2->_deviceHasPersonas = v12;

  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MIDaemonConfiguration_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_daemonConfigOnceToken != -1) {
    dispatch_once(&sharedInstance_daemonConfigOnceToken, block);
  }
  v2 = (void *)sharedInstance_daemonConfigInstance;
  return v2;
}

uint64_t __39__MIDaemonConfiguration_sharedInstance__block_invoke()
{
  sharedInstance_daemonConfigInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (NSURL)daemonUserDataLibraryDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke;
  block[3] = &unk_1E62E6B68;
  block[4] = self;
  if (daemonUserDataLibraryDirectory_onceToken != -1) {
    dispatch_once(&daemonUserDataLibraryDirectory_onceToken, block);
  }
  return self->_daemonUserDataLibraryDirectory;
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = container_query_create();
  if (v2)
  {
    container_query_set_class();
    xpc_object_t v3 = xpc_string_create("com.apple.installd");
    container_query_set_identifiers();

    container_query_set_persona_unique_string();
    container_query_operation_set_flags();
    uint64_t single_result = container_query_get_single_result();
    if (!single_result) {
      __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_2(v2, &v15, v16);
    }
    uint64_t v5 = single_result;
    uint64_t path = container_get_path();
    if (!path) {
      __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_3(v5, &v15, v16);
    }
    uint64_t v7 = path;
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
      MOLogWrite();
    }
    char v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithFileSystemRepresentation:v7 isDirectory:1 relativeToURL:0];
    uint64_t v9 = [v8 URLByAppendingPathComponent:@"Library" isDirectory:1];

    uint64_t v10 = container_copy_sandbox_token();
    if (v10)
    {
      id v11 = (void *)v10;
      if (sandbox_extension_consume() < 0)
      {
        int v12 = *__error();
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_5(v12);
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          strerror(v12);
LABEL_29:
          MOLogWrite();
        }
      }
      else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        goto LABEL_29;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_4();
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }
      id v11 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_1();
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    id v11 = 0;
    uint64_t v9 = 0;
  }
  container_query_free();
  free(v11);
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 160);
  *(void *)(v13 + 160) = v9;
}

- (NSURL)currentUserDataDirectory
{
  uint64_t v2 = [(MIDaemonConfiguration *)self daemonUserDataLibraryDirectory];
  xpc_object_t v3 = [v2 URLByAppendingPathComponent:@"MobileInstallation" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)currentUserCachesDirectory
{
  uint64_t v2 = [(MIDaemonConfiguration *)self daemonUserDataLibraryDirectory];
  xpc_object_t v3 = [v2 URLByAppendingPathComponent:@"Caches" isDirectory:1];

  return (NSURL *)v3;
}

- (BOOL)codeSigningEnforcementIsDisabled
{
  BOOL v3 = [(MIGlobalConfiguration *)self allowsInternalSecurityPolicy];
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MIDaemonConfiguration_codeSigningEnforcementIsDisabled__block_invoke;
    block[3] = &unk_1E62E6B68;
    block[4] = self;
    if (codeSigningEnforcementIsDisabled_onceToken != -1) {
      dispatch_once(&codeSigningEnforcementIsDisabled_onceToken, block);
    }
    LOBYTE(v3) = self->_codeSigningEnforcementIsDisabled;
  }
  return v3;
}

void __57__MIDaemonConfiguration_codeSigningEnforcementIsDisabled__block_invoke(uint64_t a1)
{
  char v8 = 0;
  uint64_t v2 = +[MITestManager sharedInstance];
  id v7 = 0;
  int v3 = [v2 isRunningInTestMode:&v8 outError:&v7];
  id v4 = v7;

  if (v3)
  {
    if (v8)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
        MOLogWrite();
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 144) = 0;
      goto LABEL_25;
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    MOLogWrite();
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobile.installation"];
  if ([v5 BOOLForKey:@"FakeCodeSigningNotDisabled"])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 144) = 0;
  }
  else
  {
    int bootarg_state = amfi_interface_query_bootarg_state();
    if (bootarg_state)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        strerror(bootarg_state);
        MOLogWrite();
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 144) = 0;
    }
    if (*(unsigned char *)(*(void *)(a1 + 32) + 144) && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)) {
      MOLogWrite();
    }
  }

LABEL_25:
}

- (BOOL)localSigningIsUnrestricted
{
  BOOL v3 = [(MIGlobalConfiguration *)self allowsInternalSecurityPolicy];
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__MIDaemonConfiguration_localSigningIsUnrestricted__block_invoke;
    block[3] = &unk_1E62E6B68;
    block[4] = self;
    if (localSigningIsUnrestricted_onceToken != -1) {
      dispatch_once(&localSigningIsUnrestricted_onceToken, block);
    }
    LOBYTE(v3) = self->_localSigningIsUnrestricted;
  }
  return v3;
}

uint64_t __51__MIDaemonConfiguration_localSigningIsUnrestricted__block_invoke(uint64_t a1)
{
  uint64_t result = amfi_interface_query_bootarg_state();
  if (result)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      strerror(result);
      uint64_t result = MOLogWrite();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 145) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 145) = 0;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 145))
  {
    uint64_t result = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      return MOLogWrite();
    }
  }
  return result;
}

- (BOOL)wasErroneousContainerCleanupDone
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobile.installation"];
  char v3 = [v2 BOOLForKey:@"ErroneousContainerCleanupDone"];

  return v3;
}

- (void)setErroneousContainerCleanupDone:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobile.installation"];
  [v4 setBool:v3 forKey:@"ErroneousContainerCleanupDone"];
}

- (BOOL)haveUpdatedAppExtensionDataContainersWithParentID
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobile.installation"];
  BOOL v3 = [v2 integerForKey:@"ExtensionDataContainerParentIDUpdateVersion"] == 1;

  return v3;
}

- (void)setHaveUpdatedAppExtensionDataContainersWithParentID:(BOOL)a3
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobile.installation"];
  [v3 setObject:&unk_1F170FA28 forKey:@"ExtensionDataContainerParentIDUpdateVersion"];
}

- (id)builtInApplicationBundleIDs
{
  v8.receiver = self;
  v8.super_class = (Class)MIDaemonConfiguration;
  uint64_t v2 = [(MIGlobalConfiguration *)&v8 builtInApplicationBundleIDs];
  id v3 = MIDiskImageManagerProxy();
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 diskImageAppBundleIDs];
    uint64_t v6 = [v2 setByAddingObjectsFromSet:v5];

    uint64_t v2 = (void *)v6;
  }

  return v2;
}

- (NSURL)journalStorageBaseURL
{
  uint64_t v2 = [(MIGlobalConfiguration *)self dataDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"Journal" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)currentUserJournalStorageBaseURL
{
  uint64_t v2 = [(MIDaemonConfiguration *)self currentUserDataDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"Journal" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)launchServicesOperationStorageBaseURL
{
  uint64_t v2 = [(MIGlobalConfiguration *)self dataDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"LaunchServicesOperations" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)launchServicesOperationLookAsideStorageBaseURL
{
  uint64_t v2 = [(MIGlobalConfiguration *)self dataDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"ReconcilingLSOperations" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)currentUserLaunchServicesOperationStorageBaseURL
{
  uint64_t v2 = [(MIDaemonConfiguration *)self currentUserDataDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"LaunchServicesOperations" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)currentUserLaunchServicesOperationLookAsideStorageBaseURL
{
  uint64_t v2 = [(MIDaemonConfiguration *)self currentUserDataDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"ReconcilingLSOperations" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)stagingRootForSystemContent
{
  uint64_t v2 = [(MIGlobalConfiguration *)self cachesDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"com.apple.mobile.installd.staging" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)stagingRootForUserContent
{
  if ([(MIGlobalConfiguration *)self hasEAPFSVolumeSplit])
  {
    id v3 = [(MIDaemonConfiguration *)self currentUserCachesDirectory];
    id v4 = [v3 URLByAppendingPathComponent:@"com.apple.mobile.installd.staging" isDirectory:1];
  }
  else
  {
    id v4 = [(MIDaemonConfiguration *)self stagingRootForSystemContent];
  }
  return (NSURL *)v4;
}

- (id)stagingRootForDevice:(int)a3 url:(id)a4 identifier:(unint64_t *)a5 error:(id *)a6
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  uint64_t v37 = 0;
  v38 = (id *)&v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  id v42 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  id v11 = +[MIFileManager defaultManager];
  int v12 = [(MIDaemonConfiguration *)self stagingRootForSystemContent];
  if ([(MIGlobalConfiguration *)self hasEAPFSVolumeSplit])
  {
    uint64_t v13 = [(MIDaemonConfiguration *)self stagingRootForUserContent];
    v45[0] = v12;
    v45[1] = v13;
    v46[0] = &unk_1F170FA40;
    v46[1] = &unk_1F170FA58;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  }
  else
  {
    v43 = v12;
    v44 = &unk_1F170FA40;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__MIDaemonConfiguration_stagingRootForDevice_url_identifier_error___block_invoke;
  v21[3] = &unk_1E62E6EB8;
  id v15 = v11;
  id v22 = v15;
  v23 = &v27;
  int v26 = a3;
  v24 = &v37;
  v25 = &v33;
  [v14 enumerateKeysAndObjectsUsingBlock:v21];
  uint64_t v16 = v38;
  id v17 = v38[5];
  if (v17)
  {
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if (v28[5])
  {
    id v17 = 0;
    goto LABEL_10;
  }
  uint64_t v20 = [v10 path];
  if (([v20 hasPrefix:@"/private/var/PersonaVolumes/"] & 1) != 0
    || [v20 hasPrefix:@"/var/PersonaVolumes/"])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) > 4) {
LABEL_25:
    }
      MOLogWrite();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      -[MIDaemonConfiguration stagingRootForDevice:url:identifier:error:]((uint64_t)v20);
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      goto LABEL_25;
    }
  }
  objc_storeStrong(v38 + 5, v12);
  v34[3] = 1;

  uint64_t v16 = v38;
  id v17 = v38[5];
  if (!a5) {
    goto LABEL_10;
  }
LABEL_6:
  if (v17)
  {
    *a5 = v34[3];
    id v17 = v16[5];
  }
LABEL_10:
  if (a6 && !v17)
  {
    *a6 = (id) v28[5];
    id v17 = v38[5];
  }
  id v18 = v17;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v18;
}

void __67__MIDaemonConfiguration_stagingRootForDevice_url_identifier_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = *(void **)(a1 + 32);
  id v14 = 0;
  int v11 = [v10 deviceForURLOrFirstAvailableParent:v8 error:&v14];
  id v12 = v14;
  id v13 = v14;
  if (v11 == -1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v12);
    goto LABEL_5;
  }
  if (*(_DWORD *)(a1 + 64) == v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v9 unsignedIntegerValue];
LABEL_5:
    *a4 = 1;
  }
}

- (id)stagingRootForURL:(id)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = +[MIFileManager defaultManager];
  id v17 = 0;
  uint64_t v10 = [v9 deviceForURLOrFirstAvailableParent:v8 error:&v17];
  id v11 = v17;
  id v12 = v11;
  if (v10 == -1)
  {
    id v13 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v16 = v11;
    id v13 = [(MIDaemonConfiguration *)self stagingRootForDevice:v10 url:v8 identifier:a4 error:&v16];
    id v14 = v16;

    id v12 = v14;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if (!v13) {
    *a5 = v12;
  }
LABEL_7:

  return v13;
}

- (id)stagingRootForIdentifier:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v3 = [(MIDaemonConfiguration *)self stagingRootForSystemContent];
  }
  else if (a3 == 2)
  {
    id v3 = [(MIDaemonConfiguration *)self stagingRootForUserContent];
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    id v3 = 0;
  }
  return v3;
}

- (unsigned)installQOSOverride
{
  return self->_installQOSOverride;
}

- (BOOL)skipDeviceFamilyCheck
{
  return self->_skipDeviceFamilyCheck;
}

- (BOOL)skipThinningCheck
{
  return self->_skipThinningCheck;
}

- (BOOL)allowPatchWithoutSinf
{
  return self->_allowPatchWithoutSinf;
}

- (int64_t)nSimultaneousInstallations
{
  return self->_nSimultaneousInstallations;
}

- (BOOL)deviceHasPersonas
{
  return self->_deviceHasPersonas;
}

- (BOOL)requireEligibilityChecksForAppsInDevelopment
{
  return self->_requireEligibilityChecksForAppsInDevelopment;
}

- (unint64_t)estimatedAvailableMemoryForValidation
{
  return self->_estimatedAvailableMemoryForValidation;
}

- (void).cxx_destruct
{
}

- (void)init
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136315138;
  v1 = "_DaemonUserDataLibraryDirectory";
  _os_log_fault_impl(&dword_1BCA62000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s: Failed to create container query", (uint8_t *)&v0, 0xCu);
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_2(uint64_t a1, void *a2, _OWORD *a3)
{
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_0_0();
  _os_crash_msg();
  __break(1u);
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_3(uint64_t a1, void *a2, _OWORD *a3)
{
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_0_0();
  _os_crash_msg();
  __break(1u);
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136315138;
  v1 = "_DaemonUserDataLibraryDirectory";
  _os_log_fault_impl(&dword_1BCA62000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s: container_copy_sandbox_token returned NULL!", (uint8_t *)&v0, 0xCu);
}

void __55__MIDaemonConfiguration_daemonUserDataLibraryDirectory__block_invoke_cold_5(int a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 136315650;
  uint64_t v2 = "_DaemonUserDataLibraryDirectory";
  __int16 v3 = 1024;
  int v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = strerror(a1);
  _os_log_fault_impl(&dword_1BCA62000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s: Failed to consume daemon container sandbox token: %d (%s)", (uint8_t *)&v1, 0x1Cu);
}

- (void)stagingRootForDevice:(uint64_t)a1 url:identifier:error:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  uint64_t v2 = "-[MIDaemonConfiguration stagingRootForDevice:url:identifier:error:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_fault_impl(&dword_1BCA62000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s: Defaulting to system staging root because we could not determine the best one for %@", (uint8_t *)&v1, 0x16u);
}

@end