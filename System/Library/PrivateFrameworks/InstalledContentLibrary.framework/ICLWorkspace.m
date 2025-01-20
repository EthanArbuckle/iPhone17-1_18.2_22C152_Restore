@interface ICLWorkspace
+ (id)_connectionToInstallationDaemonWithError:(id *)a3;
+ (id)defaultWorkspace;
- (BOOL)enumerateBuiltInSystemContentWithBlock:(id)a3 error:(id *)a4;
- (BOOL)enumerateCryptexContentWithBlock:(id)a3 error:(id *)a4;
- (BOOL)triggerRegistrationForContainerizedContentWithOptions:(id)a3 withError:(id *)a4;
- (ICLWorkspace)init;
- (id)bundleIDsForContainerizedContentWithError:(id *)a3;
- (id)bundleRecordsForLaunchServicesWithWrapperURL:(id)a3 forBundleIdentifier:(id)a4 withError:(id *)a5;
- (id)bundleRecordsWithFrameworkURL:(id)a3 options:(id)a4 withError:(id *)a5;
- (id)containerizedAppBundleRecordsForIdentity:(id)a3 inDomain:(unint64_t)a4 options:(id)a5 withError:(id *)a6;
- (id)diskUsageForLaunchServicesWithBundleIDs:(id)a3 options:(id)a4 withError:(id *)a5;
- (id)infoForLaunchServicesWithWrapperURL:(id)a3 forBundleIdentifier:(id)a4 withError:(id *)a5;
- (void)triggerRegistrationForContainerizedContentWithOptions:(id)a3 completion:(id)a4;
- (void)triggerRegistrationForDiskImageContentWithOptions:(id)a3 completion:(id)a4;
@end

@implementation ICLWorkspace

- (ICLWorkspace)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICLWorkspace;
  return [(ICLWorkspace *)&v3 init];
}

+ (id)defaultWorkspace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__ICLWorkspace_defaultWorkspace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultWorkspace_onceToken != -1) {
    dispatch_once(&defaultWorkspace_onceToken, block);
  }
  v2 = (void *)defaultWorkspace_defaultInstance;
  return v2;
}

uint64_t __32__ICLWorkspace_defaultWorkspace__block_invoke()
{
  defaultWorkspace_defaultInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (BOOL)enumerateBuiltInSystemContentWithBlock:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v16 = 1;
  if ((container_invalidate_code_signing_cache() & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
    MOLogWrite();
  }
  v6 = [MILaunchServicesDatabaseGatherer alloc];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__ICLWorkspace_enumerateBuiltInSystemContentWithBlock_error___block_invoke;
  v14[3] = &unk_1E62E70A0;
  id v7 = v5;
  id v15 = v7;
  v8 = [(MILaunchServicesDatabaseGatherer *)v6 initWithOptions:2 enumerator:v14];
  id v13 = 0;
  BOOL v9 = [(MILaunchServicesDatabaseGatherer *)v8 performGatherWithError:&v13];
  id v10 = v13;
  v11 = v10;
  if (a4 && !v9) {
    *a4 = v10;
  }

  return v9;
}

void __61__ICLWorkspace_enumerateBuiltInSystemContentWithBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)bundleIDsForContainerizedContentWithError:(id *)a3
{
  v4 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ICLWorkspace_bundleIDsForContainerizedContentWithError___block_invoke;
  v9[3] = &unk_1E62E70C8;
  id v5 = v4;
  id v10 = v5;
  id v6 = +[MIMCMContainer enumerateContainersWithClass:1 forPersona:0 isTransient:0 identifiers:0 groupIdentifiers:0 usingBlock:v9];
  if (v6)
  {

    id v5 = 0;
  }
  if (a3 && !v5) {
    *a3 = v6;
  }
  id v7 = (void *)[v5 copy];

  return v7;
}

uint64_t __58__ICLWorkspace_bundleIDsForContainerizedContentWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [a2 identifier];
  [v2 addObject:v3];

  return 1;
}

+ (id)_connectionToInstallationDaemonWithError:(id *)a3
{
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mobile.installd" options:0];
  if (!v4)
  {
    _CreateAndLogError((uint64_t)"+[ICLWorkspace _connectionToInstallationDaemonWithError:]", 136, ICLWorkspaceErrorDomain[0], 2, 0, 0, @"Failed to create connection to %@", v5, @"com.apple.mobile.installd");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3) {
      goto LABEL_5;
    }
LABEL_7:
    id v10 = v10;
    id v6 = 0;
    *a3 = v10;
    goto LABEL_10;
  }
  id v6 = (void *)v4;
  id v7 = MobileInstallerProtocolInterface();
  [v6 setRemoteObjectInterface:v7];

  if (xpc_user_sessions_enabled())
  {
    if (xpc_user_sessions_get_foreground_uid() == -101)
    {
      v8 = ICLWorkspaceErrorDomain[0];
      xpc_strerror();
      _CreateAndLogError((uint64_t)"+[ICLWorkspace _connectionToInstallationDaemonWithError:]", 147, v8, 2, 0, 0, @"xpc_user_sessions_get_foreground_uid() failed with error %d - %s", v9, 0);
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      if (!a3)
      {
LABEL_5:
        id v6 = 0;
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    v11 = [v6 _xpcConnection];
    xpc_connection_set_target_user_session_uid();
  }
  [v6 resume];
  id v10 = 0;
LABEL_10:

  return v6;
}

- (void)triggerRegistrationForContainerizedContentWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v21 = 0;
  id v7 = [(id)objc_opt_class() _connectionToInstallationDaemonWithError:&v21];
  id v8 = v21;
  if (v7)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_completion___block_invoke;
    v18[3] = &unk_1E62E70F0;
    id v9 = v7;
    id v19 = v9;
    id v20 = v6;
    id v10 = (void *)MEMORY[0x1C1878AA0](v18);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __81__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_completion___block_invoke_2;
    uint64_t v16 = &unk_1E62E7118;
    id v17 = v10;
    id v11 = v10;
    v12 = [v9 remoteObjectProxyWithErrorHandler:&v13];
    objc_msgSend(v12, "triggerRegistrationForContainerizedContentForOptions:withCompletion:", v5, v11, v13, v14, v15, v16);
  }
  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

void __81__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __81__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)triggerRegistrationForContainerizedContentWithOptions:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v20 = 0;
  id v21 = (id *)&v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  id v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v6 = objc_opt_class();
  id v7 = v21;
  id obj = v21[5];
  id v8 = [v6 _connectionToInstallationDaemonWithError:&obj];
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_withError___block_invoke;
    v14[3] = &unk_1E62E7140;
    void v14[4] = &v20;
    id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_withError___block_invoke_2;
    v13[3] = &unk_1E62E7168;
    v13[4] = &v20;
    v13[5] = &v16;
    [v9 triggerRegistrationForContainerizedContentForOptions:v5 withCompletion:v13];

    [v8 invalidate];
  }
  int v10 = *((unsigned __int8 *)v17 + 24);
  if (a4 && !*((unsigned char *)v17 + 24))
  {
    *a4 = v21[5];
    int v10 = *((unsigned __int8 *)v17 + 24);
  }
  BOOL v11 = v10 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __80__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __80__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)triggerRegistrationForDiskImageContentWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v21 = 0;
  id v7 = [(id)objc_opt_class() _connectionToInstallationDaemonWithError:&v21];
  id v8 = v21;
  if (v7)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__ICLWorkspace_triggerRegistrationForDiskImageContentWithOptions_completion___block_invoke;
    v18[3] = &unk_1E62E70F0;
    id v9 = v7;
    id v19 = v9;
    id v20 = v6;
    int v10 = (void *)MEMORY[0x1C1878AA0](v18);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __77__ICLWorkspace_triggerRegistrationForDiskImageContentWithOptions_completion___block_invoke_2;
    uint64_t v16 = &unk_1E62E7118;
    id v17 = v10;
    id v11 = v10;
    v12 = [v9 remoteObjectProxyWithErrorHandler:&v13];
    objc_msgSend(v12, "triggerRegistrationForDiskImageContentForOptions:withCompletion:", v5, v11, v13, v14, v15, v16);
  }
  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

void __77__ICLWorkspace_triggerRegistrationForDiskImageContentWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __77__ICLWorkspace_triggerRegistrationForDiskImageContentWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)infoForLaunchServicesWithWrapperURL:(id)a3 forBundleIdentifier:(id)a4 withError:(id *)a5
{
  id v5 = [(ICLWorkspace *)self bundleRecordsForLaunchServicesWithWrapperURL:a3 forBundleIdentifier:a4 withError:a5];
  id v6 = +[ICLBundleRecord bundleRecordArrayToInfoDictionaryArray:v5];

  return v6;
}

- (id)bundleRecordsForLaunchServicesWithWrapperURL:(id)a3 forBundleIdentifier:(id)a4 withError:(id *)a5
{
  id v7 = _CreateAndLogError((uint64_t)"-[ICLWorkspace bundleRecordsForLaunchServicesWithWrapperURL:forBundleIdentifier:withError:]", 307, ICLWorkspaceErrorDomain[0], 4, 0, 0, @"%s is unavailable on this platform", v5, (uint64_t)"-[ICLWorkspace bundleRecordsForLaunchServicesWithWrapperURL:forBundleIdentifier:withError:]");
  id v8 = v7;
  if (a5) {
    *a5 = v7;
  }

  return 0;
}

- (BOOL)enumerateCryptexContentWithBlock:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [MILaunchServicesDatabaseGatherer alloc];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__ICLWorkspace_enumerateCryptexContentWithBlock_error___block_invoke;
  v14[3] = &unk_1E62E70A0;
  id v7 = v5;
  id v15 = v7;
  id v8 = [(MILaunchServicesDatabaseGatherer *)v6 initWithOptions:8 enumerator:v14];
  id v13 = 0;
  BOOL v9 = [(MILaunchServicesDatabaseGatherer *)v8 performGatherWithError:&v13];
  id v10 = v13;
  id v11 = v10;
  if (a4 && !v9) {
    *a4 = v10;
  }

  return v9;
}

void __55__ICLWorkspace_enumerateCryptexContentWithBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)bundleRecordsWithFrameworkURL:(id)a3 options:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = objc_opt_new();
  id v10 = objc_opt_new();
  objc_opt_class();
  id v11 = v7;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (!v12)
  {
    _CreateAndLogError((uint64_t)"-[ICLWorkspace bundleRecordsWithFrameworkURL:options:withError:]", 363, @"MIInstallerErrorDomain", 25, 0, 0, @"frameworkBundleURL parameter was not a valid URL", v13, (uint64_t)v29);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (v8)
  {
    objc_opt_class();
    id v14 = v8;
    id v15 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;

    if (!v15)
    {
      _CreateAndLogError((uint64_t)"-[ICLWorkspace bundleRecordsWithFrameworkURL:options:withError:]", 368, @"MIInstallerErrorDomain", 25, 0, 0, @"options parameter was not a dictionary", v17, (uint64_t)v29);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = 0;
      goto LABEL_21;
    }
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v29 = [v11 path];
    id v30 = v8;
    MOLogWrite();
  }
  id v40 = 0;
  +[MIBundle bundleForURL:error:](MIExecutableBundle, "bundleForURL:error:", v11, &v40, v29, v30);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v40;
  if (!v12)
  {
LABEL_19:
    id v15 = 0;
    goto LABEL_21;
  }
  uint64_t v18 = v10;
  id v19 = v9;
  v34 = a5;
  id v20 = +[MIGlobalConfiguration sharedInstance];
  id v21 = [v20 primaryPersonaString];
  id v39 = v16;
  id v15 = +[MILaunchServicesDatabaseGatherer entryForBundle:v12 inContainer:0 forPersona:v21 withError:&v39];
  id v33 = v39;

  if (v15)
  {
    uint64_t v22 = [v12 identifier];
    [v18 setObject:v15 forKeyedSubscript:v22];

    [v9 addObject:v15];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __64__ICLWorkspace_bundleRecordsWithFrameworkURL_options_withError___block_invoke;
    v36[3] = &unk_1E62E7190;
    id v37 = v18;
    id v31 = v9;
    id v38 = v31;
    v23 = (void *)MEMORY[0x1C1878AA0](v36);
    v24 = +[MIGlobalConfiguration sharedInstance];
    id v25 = [v24 primaryPersonaString];
    id v35 = v33;
    BOOL v32 = +[MILaunchServicesDatabaseGatherer enumerateAppExtensionsInBundle:v12 forPersona:v25 updatingAppExtensionParentID:0 ensureAppExtensionsAreExecutable:0 installProfiles:0 error:&v35 enumerator:v23];
    id v16 = v35;

    BOOL v9 = v19;
    id v10 = v18;

    a5 = v34;
    if (v32)
    {
      v26 = (void *)[v31 copy];
      if (!v34) {
        goto LABEL_24;
      }
      goto LABEL_22;
    }
LABEL_21:
    v26 = 0;
    if (!a5) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  v26 = 0;
  id v16 = v33;
  a5 = v34;
  id v10 = v18;
  if (!v34) {
    goto LABEL_24;
  }
LABEL_22:
  if (!v26) {
    *a5 = v16;
  }
LABEL_24:
  id v27 = v26;

  return v27;
}

void __64__ICLWorkspace_bundleRecordsWithFrameworkURL_options_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];

  if (v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12, v12);
      id v8 = [v7 bundleURL];
      BOOL v9 = [v8 path];
      id v10 = [v5 bundleURL];
      id v11 = [v10 path];
      MOLogWrite();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v12];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (id)containerizedAppBundleRecordsForIdentity:(id)a3 inDomain:(unint64_t)a4 options:(id)a5 withError:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__5;
  id v31 = __Block_byref_object_dispose__5;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  id v25 = __Block_byref_object_dispose__5;
  id v26 = 0;
  id v11 = objc_opt_class();
  id v12 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  uint64_t v13 = [v11 _connectionToInstallationDaemonWithError:&obj];
  objc_storeStrong(v12, obj);
  if (v13)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__ICLWorkspace_containerizedAppBundleRecordsForIdentity_inDomain_options_withError___block_invoke;
    v19[3] = &unk_1E62E7140;
    v19[4] = &v21;
    id v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v19];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __84__ICLWorkspace_containerizedAppBundleRecordsForIdentity_inDomain_options_withError___block_invoke_2;
    v18[3] = &unk_1E62E71B8;
    void v18[4] = &v21;
    v18[5] = &v27;
    [v14 fetchInfoForContainerizedAppWithIdentity:v9 inDomain:a4 options:v10 completion:v18];

    [v13 invalidate];
  }
  id v15 = (void *)v28[5];
  if (a6 && !v15)
  {
    *a6 = (id) v22[5];
    id v15 = (void *)v28[5];
  }
  id v16 = v15;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v16;
}

void __84__ICLWorkspace_containerizedAppBundleRecordsForIdentity_inDomain_options_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __84__ICLWorkspace_containerizedAppBundleRecordsForIdentity_inDomain_options_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *id v7 = v9;
}

- (id)diskUsageForLaunchServicesWithBundleIDs:(id)a3 options:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__5;
  id v32 = __Block_byref_object_dispose__5;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__5;
  id v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  if (v9)
  {
    id v10 = objc_opt_class();
    id v11 = (id *)(v23 + 5);
    id obj = (id)v23[5];
    id v12 = [v10 _connectionToInstallationDaemonWithError:&obj];
    objc_storeStrong(v11, obj);
    if (v12)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __74__ICLWorkspace_diskUsageForLaunchServicesWithBundleIDs_options_withError___block_invoke;
      v20[3] = &unk_1E62E7140;
      v20[4] = &v22;
      uint64_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v20];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = (uint64_t)__74__ICLWorkspace_diskUsageForLaunchServicesWithBundleIDs_options_withError___block_invoke_2;
      v19[3] = (uint64_t)&unk_1E62E71E0;
      v19[4] = (uint64_t)&v22;
      void v19[5] = (uint64_t)&v28;
      [v13 fetchDiskUsageForIdentifiers:v7 withOptions:v9 completion:v19];

      [v12 invalidate];
    }
  }
  else
  {
    uint64_t v14 = _CreateAndLogError((uint64_t)"-[ICLWorkspace diskUsageForLaunchServicesWithBundleIDs:options:withError:]", 453, @"MIInstallerErrorDomain", 25, 0, 0, @"options dictionary parameter was not specified", v8, v19[0]);
    id v15 = (void *)v23[5];
    v23[5] = v14;

    id v12 = 0;
  }
  id v16 = (void *)v29[5];
  if (a5 && !v16)
  {
    *a5 = (id) v23[5];
    id v16 = (void *)v29[5];
  }
  id v17 = v16;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v17;
}

void __74__ICLWorkspace_diskUsageForLaunchServicesWithBundleIDs_options_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __74__ICLWorkspace_diskUsageForLaunchServicesWithBundleIDs_options_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *id v7 = v9;
}

@end