@interface _LSDModifyClient
- (BOOL)_canRegisterOrUnregisterURL:(id)a3 withOptions:(unsigned int)a4;
- (BOOL)canRegisterContainer;
- (BOOL)canUnregisterWithOptions:(unsigned int)a3;
- (BOOL)clientHasMIEntitlement:(id)a3;
- (BOOL)clientIsEntitledForPostInstallationOperations;
- (void)forceSaveForTestingWithCompletion:(id)a3;
- (void)garbageCollectDatabaseWithCompletionHandler:(id)a3;
- (void)installApplication:(id)a3 atURL:(id)a4 withOptions:(id)a5 installType:(unint64_t)a6 reply:(id)a7;
- (void)performPostInstallationRegistration:(id)a3 personaUniqueStrings:(id)a4 operationUUID:(id)a5 reply:(id)a6;
- (void)performPostUninstallationUnregistrationOfBundleID:(id)a3 operationUUID:(id)a4 unregisterType:(unsigned int)a5 precondition:(id)a6 reply:(id)a7;
- (void)performShimmedInstallOfArtifact:(id)a3 options:(id)a4 completion:(id)a5;
- (void)performShimmedUninstallOfApplicationWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
- (void)performUpdateOfPersonasOfBundleIDs:(id)a3 toPersonaUniqueStrings:(id)a4 operationUUID:(id)a5 reply:(id)a6;
- (void)rebuildApplicationDatabasesForSystem:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5 completionHandler:(id)a6;
- (void)refreshContentInFrameworkAtURL:(id)a3 reply:(id)a4;
- (void)registerContainerURL:(id)a3 completionHandler:(id)a4;
- (void)registerExtensionPoint:(id)a3 platform:(unsigned int)a4 declaringURL:(id)a5 withInfo:(id)a6 completionHandler:(id)a7;
- (void)registerItemInfo:(id)a3 alias:(id)a4 diskImageAlias:(id)a5 bundleURL:(id)a6 installationPlist:(id)a7 completionHandler:(id)a8;
- (void)relaxApplicationTypeRequirements:(BOOL)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeAllHandlerPrefsForBundleID:(id)a3 completionHandler:(id)a4;
- (void)removeAllHandlersWithCompletionHandler:(id)a3;
- (void)removeHandlerForContentType:(id)a3 roles:(unsigned int)a4 completionHandler:(id)a5;
- (void)removeHandlerForURLScheme:(id)a3 completionHandler:(id)a4;
- (void)resetServerStoreWithCompletionHandler:(id)a3;
- (void)setDatabaseIsSeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)setHandler:(id)a3 version:(LSVersionNumber *)a4 forURLScheme:(id)a5 completionHandler:(id)a6;
- (void)setHandler:(id)a3 version:(LSVersionNumber *)a4 roles:(unsigned int)a5 forContentType:(id)a6 completionHandler:(id)a7;
- (void)setPreferenceValue:(id)a3 forKey:(id)a4 forApplicationAtURL:(id)a5 completionHandler:(id)a6;
- (void)setPreferenceValueForCallingApplication:(id)a3 forKey:(id)a4 completionHandler:(id)a5;
- (void)setPreferredAppMarketplaces:(id)a3 completion:(id)a4;
- (void)setUpdateAvailabilities:(id)a3 completionHandler:(id)a4;
- (void)synchronizeWithMobileInstallation;
- (void)uninstallApplication:(id)a3 withOptions:(id)a4 uninstallType:(unint64_t)a5 reply:(id)a6;
- (void)unregisterApplicationAtURL:(id)a3 reply:(id)a4;
- (void)unregisterApplicationsAtMountPoint:(id)a3 operationUUID:(id)a4 reply:(id)a5;
- (void)unregisterBundleUnit:(unsigned int)a3 options:(unsigned int)a4 completionHandler:(id)a5;
- (void)unregisterExtensionPoint:(id)a3 platform:(unsigned int)a4 withVersion:(id)a5 parentBundleUnit:(unsigned int)a6 completionHandler:(id)a7;
- (void)updateContainerUnit:(unsigned int)a3 completionHandler:(id)a4;
- (void)updateRecordForApp:(id)a3 withSINF:(id)a4 iTunesMetadata:(id)a5 placeholderMetadata:(id)a6 sendNotification:(int)a7 operationUUID:(id)a8 returnSaveToken:(BOOL)a9 completionHandler:(id)a10;
- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4;
@end

@implementation _LSDModifyClient

- (BOOL)_canRegisterOrUnregisterURL:(id)a3 withOptions:(unsigned int)a4
{
  char v4 = a4;
  id v6 = a3;
  if ((v4 & 0x10) != 0)
  {
    if ([(id)__LSDefaultsGetSharedInstance() isSystemServer]) {
      BOOL v7 = [(_LSDModifyClient *)self clientHasMIEntitlement:@"InstallForLaunchServices"];
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)canUnregisterWithOptions:(unsigned int)a3
{
  return [(_LSDModifyClient *)self _canRegisterOrUnregisterURL:0 withOptions:*(void *)&a3];
}

- (BOOL)canRegisterContainer
{
  return [(_LSDModifyClient *)self _canRegisterOrUnregisterURL:0 withOptions:0];
}

- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_LSDModifyClient;
  [(_LSDClient *)&v8 willHandleInvocation:v6 isReply:v4];
  BOOL v7 = _LSDatabaseGetSeedingGroup();
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)setDatabaseIsSeeded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = _LSDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = [(_LSDClient *)self XPCConnection];
    *(_DWORD *)buf = 67109376;
    BOOL v15 = v4;
    __int16 v16 = 1024;
    int v17 = [v8 processIdentifier];
    _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "setting database seeded: %d from pid %d", buf, 0xEu);
  }
  v9 = _LSServer_DatabaseExecutionContext();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58___LSDModifyClient_setDatabaseIsSeeded_completionHandler___block_invoke;
  v11[3] = &unk_1E522ECB0;
  BOOL v13 = v4;
  id v10 = v6;
  id v12 = v10;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v9, v11);
}

- (void)registerItemInfo:(id)a3 alias:(id)a4 diskImageAlias:(id)a5 bundleURL:(id)a6 installationPlist:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  MEMORY[0x185310450]();
  v20 = _LSServer_GetIOQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104___LSDModifyClient_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler___block_invoke;
  block[3] = &unk_1E522ECD8;
  id v33 = v16;
  id v34 = v19;
  id v28 = v14;
  v29 = self;
  id v30 = v17;
  id v31 = v15;
  id v32 = v18;
  id v21 = v16;
  id v22 = v18;
  id v23 = v15;
  id v24 = v17;
  id v25 = v19;
  id v26 = v14;
  dispatch_async(v20, block);
}

- (void)unregisterBundleUnit:(unsigned int)a3 options:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient unregisterBundleUnit:options:completionHandler:]");
  if (a3)
  {
    if ([(_LSDModifyClient *)self canUnregisterWithOptions:v5])
    {
      v9 = _LSDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(_LSDClient *)self XPCConnection];
        *(_DWORD *)buf = 134218496;
        uint64_t v25 = (int)[v10 processIdentifier];
        __int16 v26 = 2048;
        uint64_t v27 = a3;
        __int16 v28 = 2048;
        uint64_t v29 = v5;
        _os_log_impl(&dword_182959000, v9, OS_LOG_TYPE_DEFAULT, "client %lu will unregister unit %llx options %llx", buf, 0x20u);
      }
      _LSDatabaseSentinelIncrement();
      v11 = (void *)MEMORY[0x18530F950](v8);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __67___LSDModifyClient_unregisterBundleUnit_options_completionHandler___block_invoke;
      v20[3] = &unk_1E522BD40;
      id v12 = v11;
      id v21 = v12;
      BOOL v13 = (void *)MEMORY[0x18530F950](v20);

      id v14 = _LSServer_DatabaseExecutionContext();
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __67___LSDModifyClient_unregisterBundleUnit_options_completionHandler___block_invoke_2;
      v16[3] = &unk_1E522ED00;
      unsigned int v18 = a3;
      int v19 = v5;
      id v8 = v13;
      id v17 = v8;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v14, v16);

      id v15 = v21;
    }
    else
    {
      uint64_t v30 = *MEMORY[0x1E4F28228];
      v31[0] = @"May not unregister bundle";
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      id v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient unregisterBundleUnit:options:completionHandler:]", 538, v12);
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v15);
    }
  }
  else
  {
    uint64_t v22 = *MEMORY[0x1E4F28228];
    id v23 = @"invalid bundleInit for unregistering";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient unregisterBundleUnit:options:completionHandler:]", 598, v12);
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v15);
  }
}

- (void)registerContainerURL:(id)a3 completionHandler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient registerContainerURL:completionHandler:]");
  if (v6 && [v6 isFileURL])
  {
    if ([(_LSDModifyClient *)self canRegisterContainer])
    {
      MEMORY[0x185310450]();
      id v8 = _LSServer_GetIOQueue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59___LSDModifyClient_registerContainerURL_completionHandler___block_invoke;
      block[3] = &unk_1E522C3B0;
      id v13 = v6;
      id v14 = v7;
      dispatch_async(v8, block);

      v9 = v13;
    }
    else
    {
      uint64_t v17 = *MEMORY[0x1E4F28228];
      v18[0] = @"May not register container";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      v11 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient registerContainerURL:completionHandler:]", 609, v9);
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
  else
  {
    uint64_t v15 = *MEMORY[0x1E4F28228];
    id v16 = @"invalid containerURL";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient registerContainerURL:completionHandler:]", 631, v9);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)updateContainerUnit:(unsigned int)a3 completionHandler:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient updateContainerUnit:completionHandler:]");
  if (a3)
  {
    if ([(_LSDModifyClient *)self canRegisterContainer])
    {
      _LSServer_DatabaseExecutionContext();
      id v7 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __58___LSDModifyClient_updateContainerUnit_completionHandler___block_invoke;
      v11[3] = &unk_1E522ED28;
      unsigned int v13 = a3;
      id v12 = v6;
      -[LSDBExecutionContext syncRead:](v7, v11);

      id v8 = v12;
    }
    else
    {
      uint64_t v16 = *MEMORY[0x1E4F28228];
      v17[0] = @"May not update container registation";
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      id v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient updateContainerUnit:completionHandler:]", 643, v8);
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
    }
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F28228];
    uint64_t v15 = @"invalid container Unit";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v9 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient updateContainerUnit:completionHandler:]", 672, v8);
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v9);
  }
}

- (void)registerExtensionPoint:(id)a3 platform:(unsigned int)a4 declaringURL:(id)a5 withInfo:(id)a6 completionHandler:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient registerExtensionPoint:platform:declaringURL:withInfo:completionHandler:]");
  int v15 = 0;
  if (v11 && v13)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    int v15 = _LSIsDictionaryWithKeysAndValuesOfClasses(v13, v16, 0);
  }
  uint64_t v17 = _LSExtensionsLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = "-[_LSDModifyClient registerExtensionPoint:platform:declaringURL:withInfo:completionHandler:]";
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 1024;
    unsigned int v34 = a4;
    __int16 v35 = 2112;
    id v36 = v12;
    __int16 v37 = 2112;
    id v38 = v13;
    _os_log_debug_impl(&dword_182959000, v17, OS_LOG_TYPE_DEBUG, "%s Registering extension point with identifier '%@' platform: %d url '%@' SDK Dictionary: %@", buf, 0x30u);
  }

  if (v15)
  {
    unsigned int v18 = _LSServer_DatabaseExecutionContext();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __92___LSDModifyClient_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler___block_invoke;
    v21[3] = &unk_1E522ED50;
    id v22 = v11;
    unsigned int v26 = a4;
    id v23 = v13;
    id v24 = v12;
    id v25 = v14;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v18, v21);

    int v19 = v22;
  }
  else
  {
    uint64_t v27 = *MEMORY[0x1E4F28228];
    __int16 v28 = @"invalid extensionPoint SDK dictionary";
    int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v20 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient registerExtensionPoint:platform:declaringURL:withInfo:completionHandler:]", 701, v19);
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v20);
  }
}

- (void)unregisterExtensionPoint:(id)a3 platform:(unsigned int)a4 withVersion:(id)a5 parentBundleUnit:(unsigned int)a6 completionHandler:(id)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient unregisterExtensionPoint:platform:withVersion:parentBundleUnit:co"
                                    "mpletionHandler:]");
  if (v11)
  {
    id v14 = _LSServer_DatabaseExecutionContext();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __101___LSDModifyClient_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler___block_invoke;
    v17[3] = &unk_1E522ED78;
    id v18 = v11;
    unsigned int v21 = a4;
    unsigned int v22 = a6;
    id v19 = v12;
    id v20 = v13;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v14, v17);

    int v15 = v18;
  }
  else
  {
    uint64_t v23 = *MEMORY[0x1E4F28228];
    v24[0] = @"invalid extensionPoint identifier";
    int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v16 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient unregisterExtensionPoint:platform:withVersion:parentBundleUnit:completionHandler:]", 720, v15);
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v16);
  }
}

- (void)setHandler:(id)a3 version:(LSVersionNumber *)a4 roles:(unsigned int)a5 forContentType:(id)a6 completionHandler:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient setHandler:version:roles:forContentType:completionHandler:]");
  if (v12 && v13)
  {
    int v15 = _LSServer_DatabaseExecutionContext();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78___LSDModifyClient_setHandler_version_roles_forContentType_completionHandler___block_invoke;
    v21[3] = &unk_1E522EDC8;
    id v22 = v13;
    uint64_t v23 = self;
    id v24 = v12;
    long long v16 = *(_OWORD *)&a4->_opaque[16];
    long long v27 = *(_OWORD *)a4->_opaque;
    long long v28 = v16;
    unsigned int v26 = a5;
    id v25 = v14;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v15, v21);

    uint64_t v17 = v22;
  }
  else
  {
    uint64_t v19 = *MEMORY[0x1E4F28228];
    id v20 = @"bad inputs";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v18 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient setHandler:version:roles:forContentType:completionHandler:]", 792, v17);
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v18);
  }
}

- (void)removeHandlerForContentType:(id)a3 roles:(unsigned int)a4 completionHandler:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient removeHandlerForContentType:roles:completionHandler:]");
  if (v8)
  {
    id v10 = _LSServer_DatabaseExecutionContext();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72___LSDModifyClient_removeHandlerForContentType_roles_completionHandler___block_invoke;
    v13[3] = &unk_1E522EE18;
    id v14 = v8;
    int v15 = self;
    unsigned int v17 = a4;
    id v16 = v9;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v10, v13);

    id v11 = v14;
  }
  else
  {
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = @"contentType";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v12 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient removeHandlerForContentType:roles:completionHandler:]", 828, v11);
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v12);
  }
}

- (void)setHandler:(id)a3 version:(LSVersionNumber *)a4 forURLScheme:(id)a5 completionHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient setHandler:version:forURLScheme:completionHandler:]");
  if (v10 && v11)
  {
    id v13 = _LSServer_DatabaseExecutionContext();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __70___LSDModifyClient_setHandler_version_forURLScheme_completionHandler___block_invoke;
    v19[3] = &unk_1E522EE68;
    id v20 = v11;
    unsigned int v21 = self;
    id v22 = v10;
    long long v14 = *(_OWORD *)&a4->_opaque[16];
    long long v24 = *(_OWORD *)a4->_opaque;
    long long v25 = v14;
    id v23 = v12;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v13, v19);

    int v15 = v20;
  }
  else
  {
    uint64_t v17 = *MEMORY[0x1E4F28228];
    uint64_t v18 = @"bad inputs";
    int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v16 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient setHandler:version:forURLScheme:completionHandler:]", 865, v15);
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v16);
  }
}

- (void)removeHandlerForURLScheme:(id)a3 completionHandler:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient removeHandlerForURLScheme:completionHandler:]");
  if (v6)
  {
    id v8 = _LSServer_DatabaseExecutionContext();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64___LSDModifyClient_removeHandlerForURLScheme_completionHandler___block_invoke;
    v11[3] = &unk_1E522D300;
    id v12 = v6;
    id v13 = self;
    id v14 = v7;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v8, v11);

    id v9 = v12;
  }
  else
  {
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"scheme";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient removeHandlerForURLScheme:completionHandler:]", 893, v9);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)removeAllHandlersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient removeAllHandlersWithCompletionHandler:]");
  uint64_t v5 = _LSServer_DatabaseExecutionContext();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59___LSDModifyClient_removeAllHandlersWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E522E790;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v5, v7);
}

- (void)removeAllHandlerPrefsForBundleID:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (v6)
  {
    id v8 = [(_LSDClient *)self XPCConnection];
    id v9 = [v8 _xpcConnection];
    id v15 = 0;
    int v10 = _LSCanModifyDefaultHandler(@"*", @"*", v9, (uint64_t)&v15);
    id v11 = v15;

    if (!v10)
    {
      v7[2](v7, 0, v11);
      goto LABEL_8;
    }
    _LSHandlerPrefRemoveAllWithBundleID(v6, v7);
    id v12 = _LSDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(_LSDClient *)self XPCConnection];
      int v14 = [v13 processIdentifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "pid %ld removed handlers for %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F28228];
    uint64_t v17 = @"bundleID";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v12 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient removeAllHandlerPrefsForBundleID:completionHandler:]", 940, v11);
    v7[2](v7, 0, v12);
  }

LABEL_8:
}

- (void)relaxApplicationTypeRequirements:(BOOL)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ([(id)__LSDefaultsGetSharedInstance() isAppleInternal])
  {
    int v10 = [(_LSDClient *)self XPCConnection];
    id v11 = [v10 _xpcConnection];
    int v12 = _LSCheckEntitlementForXPCConnection(v11, @"com.apple.private.launchservices.canChangeEntitlementRequirementsForDefaultApplications");

    if (v12)
    {
      id v13 = _LSServer_DatabaseExecutionContext();
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __91___LSDModifyClient_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler___block_invoke;
      v17[3] = &unk_1E522EF30;
      id v18 = v8;
      BOOL v20 = a3;
      id v19 = v9;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v13, v17);

      int v14 = v18;
    }
    else
    {
      uint64_t v21 = *MEMORY[0x1E4F28228];
      uint64_t v22 = @"process may not modify the requirements for default applications";
      int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v16 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient relaxApplicationTypeRequirements:forBundleIdentifier:completionHandler:]", 951, v14);
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v16);
    }
  }
  else
  {
    uint64_t v23 = *MEMORY[0x1E4F28228];
    v24[0] = @"This functionality is not available on this device.";
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 78, (uint64_t)"-[_LSDModifyClient relaxApplicationTypeRequirements:forBundleIdentifier:completionHandler:]", 948, v14);
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v15);
  }
}

- (void)resetServerStoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient resetServerStoreWithCompletionHandler:]");
  uint64_t v5 = _LSServer_DatabaseExecutionContext();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58___LSDModifyClient_resetServerStoreWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E522E790;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v5, v7);
}

- (BOOL)clientHasMIEntitlement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_LSDClient *)self XPCConnection];
  id v6 = [v5 _xpcConnection];
  BOOL v7 = _LSCheckMIAllowedSPIForXPCConnection(v6, v4) != 0;

  return v7;
}

- (void)updateRecordForApp:(id)a3 withSINF:(id)a4 iTunesMetadata:(id)a5 placeholderMetadata:(id)a6 sendNotification:(int)a7 operationUUID:(id)a8 returnSaveToken:(BOOL)a9 completionHandler:(id)a10
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v35 = a4;
  id v17 = a5;
  id v18 = a6;
  id v33 = a8;
  id v19 = a10;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:se"
                                    "ndNotification:operationUUID:returnSaveToken:completionHandler:]");
  int v20 = v16 != 0;
  if (v16 && v35)
  {
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", objc_opt_class(), v33);
    int v20 = _LSIsDictionaryWithKeysAndValuesOfClasses(v35, v21, 0);
  }
  if (v17 && v20)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    int v20 = _LSIsDictionaryWithKeysAndValuesOfClasses(v17, v22, 0);
  }
  if (v18 && v20)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    char v24 = _LSIsDictionaryWithKeysAndValuesOfClasses(v18, v23, 0);

    if ((v24 & 1) == 0)
    {
LABEL_10:
      uint64_t v45 = *MEMORY[0x1E4F28228];
      v46 = @"invalid metadata, cannot update bundle record";
      objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1, v33);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:returnSaveToken:completionHandler:]", 1079, v25);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, id))v19 + 2))(v19, 0, 0, v26);
      goto LABEL_29;
    }
  }
  else if (!v20)
  {
    goto LABEL_10;
  }
  if ([(_LSDModifyClient *)self clientIsEntitledForPostInstallationOperations])
  {
    id v25 = v35;
    id v26 = v17;
LABEL_21:
    long long v27 = v18;
    goto LABEL_23;
  }
  if ([(_LSDModifyClient *)self clientHasMIEntitlement:@"UpdateSinfForLaunchServices"])
  {
    id v25 = v35;
  }
  else
  {
    id v25 = 0;
  }
  if ([(_LSDModifyClient *)self clientHasMIEntitlement:@"UpdateiTunesMetadataForLaunchServices"])
  {
    id v26 = v17;
  }
  else
  {
    id v26 = 0;
  }
  if ([(_LSDModifyClient *)self clientHasMIEntitlement:@"UpdatePlaceholderMetadata"]) {
    goto LABEL_21;
  }
  long long v27 = 0;
LABEL_23:
  id v28 = v27;
  uint64_t v29 = v28;
  if (v26 || v25 || v28)
  {
    id v32 = _LSServer_DatabaseExecutionContext();
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __148___LSDModifyClient_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler___block_invoke;
    v36[3] = &unk_1E522EF80;
    id v37 = v16;
    id v38 = v25;
    id v39 = v26;
    id v40 = v29;
    BOOL v44 = a9;
    id v41 = v34;
    int v43 = a7;
    id v42 = v19;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v32, v36);

    uint64_t v30 = v37;
  }
  else
  {
    uint64_t v47 = *MEMORY[0x1E4F28228];
    v48[0] = @"UpdateSinfForLaunchServices/UpdateiTunesMetadataForLaunchServices/UpdatePlaceholderMetadata";
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    __int16 v31 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:returnSaveToken:completionHandler:]", 1075, v30);
    (*((void (**)(id, void, void, void *))v19 + 2))(v19, 0, 0, v31);
  }
LABEL_29:
}

- (void)synchronizeWithMobileInstallation
{
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient synchronizeWithMobileInstallation]");
  MEMORY[0x185310450]();
  v3 = _LSServer_GetIOQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___LSDModifyClient_synchronizeWithMobileInstallation__block_invoke;
  block[3] = &unk_1E522D3E8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)rebuildApplicationDatabasesForSystem:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  v34[11] = *MEMORY[0x1E4F143B8];
  int v10 = (void (**)(id, void, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]");
  MEMORY[0x185310450]();
  id v11 = [(_LSDClient *)self XPCConnection];
  int v12 = [v11 _xpcConnection];
  int v13 = _LSCheckEntitlementForXPCConnection(v12, @"com.apple.lsapplicationworkspace.rebuildappdatabases");

  if (!v13)
  {
    id v19 = _LSDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v28 = [(_LSDClient *)self XPCConnection];
      *(_DWORD *)buf = 67109120;
      int v31 = [v28 processIdentifier];
      _os_log_error_impl(&dword_182959000, v19, OS_LOG_TYPE_ERROR, "Unentitled request to RebuildApplicationDatabases by pid %d", buf, 8u);
    }
    uint64_t v20 = -54;
    goto LABEL_19;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&-[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]::rebuildMutex);
  int v14 = pthread_self();
  int v29 = pthread_getname_np(v14, (char *)buf, 0x100uLL);
  id v15 = [(_LSDClient *)self XPCConnection];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = [v15 processIdentifier];
  while (proc_pidinfo(v17, 3, 0, buffer, 136) == 136)
  {
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s(%d)", v34, v17);
    [v16 addObject:v18];

    uint64_t v17 = v33;
    if (v33 <= 1) {
      goto LABEL_12;
    }
  }
  __error();
  uint64_t v21 = _LSDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]();
  }

LABEL_12:
  uint64_t v22 = [v16 reverseObjectEnumerator];
  uint64_t v23 = [v22 allObjects];
  char v24 = [v23 componentsJoinedByString:@"->"];

  if ([v24 length]) {
    pthread_setname_np((const char *)[v24 UTF8String]);
  }

  int v25 = _LSServer_RebuildApplicationDatabases(v8, v7, v6, 0, 1);
  if (!v29) {
    pthread_setname_np((const char *)buf);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&-[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]::rebuildMutex);
  if (!v25)
  {
    uint64_t v20 = -10810;
LABEL_19:
    long long v27 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v20, (uint64_t)"-[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]", 1156, 0);
    v10[2](v10, 0, v27);

    goto LABEL_20;
  }
  uint64_t v26 = ((uint64_t (*)(id, uint64_t, void))v10[2])(v10, 1, 0);
LABEL_20:
  MEMORY[0x185310460](v26);
}

- (void)installApplication:(id)a3 atURL:(id)a4 withOptions:(id)a5 installType:(unint64_t)a6 reply:(id)a7
{
  BOOL v8 = (void (**)(id, void, void *))a7;
  BOOL v7 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[_LSDModifyClient installApplication:atURL:withOptions:installType:reply:]", 1168, 0);
  v8[2](v8, 0, v7);
}

- (void)uninstallApplication:(id)a3 withOptions:(id)a4 uninstallType:(unint64_t)a5 reply:(id)a6
{
  BOOL v7 = (void (**)(id, void, void *))a6;
  BOOL v6 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[_LSDModifyClient uninstallApplication:withOptions:uninstallType:reply:]", 1176, 0);
  v7[2](v7, 0, v6);
}

- (void)unregisterApplicationsAtMountPoint:(id)a3 operationUUID:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = (void *)os_transaction_create();
  _LSDatabaseSentinelIncrement();
  id v11 = _LSServer_DatabaseExecutionContext();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke;
  v16[3] = &unk_1E522EFF8;
  id v12 = v7;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v20 = v14;
  id v15 = v10;
  id v19 = v15;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v11, v16);
}

- (void)unregisterApplicationAtURL:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)os_transaction_create();
  _LSDatabaseSentinelIncrement();
  id v8 = _LSServer_DatabaseExecutionContext();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53___LSDModifyClient_unregisterApplicationAtURL_reply___block_invoke;
  v12[3] = &unk_1E522F020;
  id v9 = v5;
  id v13 = v9;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v14 = v11;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v8, v12);
}

- (void)refreshContentInFrameworkAtURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _LSServer_GetIOQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___LSDModifyClient_refreshContentInFrameworkAtURL_reply___block_invoke;
  block[3] = &unk_1E522C040;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)setUpdateAvailabilities:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = objc_opt_class();
  id v9 = objc_opt_class();
  if ((_LSIsDictionaryWithKeysAndValuesOfClass(v6, v8, v9) & 1) == 0)
  {
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = @"valuesByBundleID";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v14 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient setUpdateAvailabilities:completionHandler:]", 1356, v13);
    v7[2](v7, 0, v14);
LABEL_9:

    goto LABEL_10;
  }
  id v10 = [(_LSDClient *)self XPCConnection];
  id v11 = [v10 _xpcConnection];
  int v12 = _LSCheckEntitlementForXPCConnection(v11, @"com.apple.private.launchservices.canchangeupdateavailability");

  if (!v12)
  {
    if (@"com.apple.private.launchservices.canchangeupdateavailability") {
      id v15 = @"com.apple.private.launchservices.canchangeupdateavailability";
    }
    else {
      id v15 = @"unknown entitlement";
    }
    uint64_t v16 = *MEMORY[0x1E4F28228];
    id v17 = v15;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v14 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient setUpdateAvailabilities:completionHandler:]", 1359, v13);
    v7[2](v7, 0, v14);
    goto LABEL_9;
  }
  +[LSApplicationRecord setUpdateAvailabilityForApplicationsWithBundleIdentifiers:v6 completionHandler:v7];
LABEL_10:
}

- (void)garbageCollectDatabaseWithCompletionHandler:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient garbageCollectDatabaseWithCompletionHandler:]");
  id v5 = [(_LSDClient *)self XPCConnection];
  id v6 = [v5 _xpcConnection];
  int v7 = _LSCheckEntitlementForXPCConnection(v6, @"com.apple.private.coreservices.canforcedatabasegc");

  if (v7)
  {
    id v8 = _LSServer_DatabaseExecutionContext();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64___LSDModifyClient_garbageCollectDatabaseWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E522D260;
    id v13 = v4;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v8, v12);

    id v9 = v13;
  }
  else
  {
    if (@"com.apple.private.coreservices.canforcedatabasegc") {
      id v10 = @"com.apple.private.coreservices.canforcedatabasegc";
    }
    else {
      id v10 = @"unknown entitlement";
    }
    uint64_t v14 = *MEMORY[0x1E4F28228];
    v15[0] = v10;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v11 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient garbageCollectDatabaseWithCompletionHandler:]", 1406, v9);
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
  }
}

- (void)setPreferenceValue:(id)a3 forKey:(id)a4 forApplicationAtURL:(id)a5 completionHandler:(id)a6
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, uint64_t))a6;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  int v43 = __Block_byref_object_copy__23;
  BOOL v44 = __Block_byref_object_dispose__23;
  id v45 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v14 = [(_LSDClient *)self XPCConnection];
  id v15 = v14;
  if (v14)
  {
    [v14 auditToken];
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
  }

  char v37 = 0;
  _LSIsAuditTokenSandboxed((uint64_t)&v38, &v37, 0);
  if (v11 && v12 && ([v12 isFileURL] & 1) != 0)
  {
    if (v37
      && !_LSCheckEntitlementForAuditToken((uint64_t)&v38, @"com.apple.private.launchservices.canmodifypreferences"))
    {
      if (@"com.apple.private.launchservices.canmodifypreferences") {
        int v25 = @"com.apple.private.launchservices.canmodifypreferences";
      }
      else {
        int v25 = @"unknown entitlement";
      }
      uint64_t v50 = *MEMORY[0x1E4F28228];
      v51 = v25;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      uint64_t v26 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient setPreferenceValue:forKey:forApplicationAtURL:completionHandler:]", 1428, v18);
      long long v27 = (void *)v41[5];
      v41[5] = v26;
    }
    else if (+[FSNode canReadMetadataOfURL:v12 fromSandboxWithAuditToken:&v38])
    {
      uint64_t v16 = [FSNode alloc];
      id v17 = (id *)(v41 + 5);
      id obj = (id)v41[5];
      uint64_t v18 = [(FSNode *)v16 initWithURL:v12 flags:1 error:&obj];
      objc_storeStrong(v17, obj);
      if (v18)
      {
        _LSServer_DatabaseExecutionContext();
        id v19 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __84___LSDModifyClient_setPreferenceValue_forKey_forApplicationAtURL_completionHandler___block_invoke;
        v34[3] = &unk_1E522BB38;
        id v20 = v18;
        id v35 = v20;
        -[LSDBExecutionContext syncRead:](v19, v34);

        uint64_t v21 = _LSServer_GetIOQueue();
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __84___LSDModifyClient_setPreferenceValue_forKey_forApplicationAtURL_completionHandler___block_invoke_284;
        v28[3] = &unk_1E522F048;
        id v32 = &v46;
        id v29 = v11;
        uint64_t v18 = v20;
        uint64_t v30 = v18;
        id v31 = v10;
        int v33 = &v40;
        dispatch_sync(v21, v28);
      }
    }
    else
    {
      uint64_t v24 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient setPreferenceValue:forKey:forApplicationAtURL:completionHandler:]", 1432, 0);
      uint64_t v18 = (FSNode *)v41[5];
      v41[5] = v24;
    }
  }
  else
  {
    uint64_t v52 = *MEMORY[0x1E4F28228];
    v53[0] = @"bad inputs";
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    uint64_t v22 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient setPreferenceValue:forKey:forApplicationAtURL:completionHandler:]", 1422, v18);
    uint64_t v23 = (void *)v41[5];
    v41[5] = v22;
  }
  v13[2](v13, *((unsigned __int8 *)v47 + 24), v41[5]);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

- (void)setPreferenceValueForCallingApplication:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (LaunchServices::PrefsStorage *)a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  uint64_t v36 = 0;
  char v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  int v33 = __Block_byref_object_copy__23;
  unsigned int v34 = __Block_byref_object_dispose__23;
  id v35 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = [(_LSDClient *)self XPCConnection];
  id v12 = v11;
  if (v11)
  {
    [v11 auditToken];
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
  }

  if (!v9 || (LaunchServices::PrefsStorage::preferenceKeyMayBeSelfSet(v9, v13) & 1) == 0)
  {
    uint64_t v40 = *MEMORY[0x1E4F28228];
    v41[0] = @"prefKey";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    uint64_t v20 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient setPreferenceValueForCallingApplication:forKey:completionHandler:]", 1470, v14);
LABEL_10:
    id v17 = (FSNode *)v31[5];
    v31[5] = v20;
    goto LABEL_11;
  }
  uint64_t v14 = (void *)_LSCopyBundleURLForAuditToken(&v28, 0);
  if (!v14)
  {
    uint64_t v20 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -600, (uint64_t)"-[_LSDModifyClient setPreferenceValueForCallingApplication:forKey:completionHandler:]", 1492, 0);
    goto LABEL_10;
  }
  id v15 = [FSNode alloc];
  uint64_t v16 = (id *)(v31 + 5);
  id obj = (id)v31[5];
  id v17 = [(FSNode *)v15 initWithURL:v14 flags:0 error:&obj];
  objc_storeStrong(v16, obj);
  if (v17)
  {
    _LSServer_DatabaseExecutionContext();
    uint64_t v18 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke;
    v21[3] = &unk_1E522F070;
    id v19 = v17;
    uint64_t v22 = v19;
    int v25 = &v36;
    uint64_t v23 = v9;
    id v24 = v8;
    uint64_t v26 = &v30;
    -[LSDBExecutionContext syncRead:](v18, v21);

    id v17 = v19;
  }
LABEL_11:

  v10[2](v10, *((unsigned __int8 *)v37 + 24), v31[5]);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
}

- (void)performShimmedInstallOfArtifact:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_LSDClient *)self XPCConnection];
  id v16 = 0;
  int v12 = _LSValidateEntitlementsOfConnectionForVanillaInstall(v11, v9, &v16);
  id v13 = v16;

  if (v12)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71___LSDModifyClient_performShimmedInstallOfArtifact_options_completion___block_invoke;
    v14[3] = &unk_1E522BD18;
    id v15 = v10;
    _LSInvokeMIForShimmedInstall(v8, v9, v14);
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
  }
}

- (void)performShimmedUninstallOfApplicationWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_LSDClient *)self XPCConnection];
  id v16 = 0;
  BOOL v12 = _LSValidateEntitlementsOfConnectionForUninstall(v11, (uint64_t)v9, &v16);
  id v13 = v16;

  if (v12)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90___LSDModifyClient_performShimmedUninstallOfApplicationWithIdentifier_options_completion___block_invoke;
    v14[3] = &unk_1E522BD18;
    id v15 = v10;
    _LSInvokeMIForShimmedUninstall(v8, v9, v14);
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
  }
}

- (BOOL)clientIsEntitledForPostInstallationOperations
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [(_LSDClient *)self XPCConnection];
  v3 = [v2 _xpcConnection];

  if (_LSCheckEntitlementForXPCConnectionQuiet(v3, @"com.apple.private.coreservices.can-register-install-results")|| _LSCheckEntitlementForXPCConnectionQuiet(v3, @"com.apple.private.installcoordinationd.daemon")|| _LSCheckEntitlementForXPCConnectionQuiet(v3, @"com.apple.private.coreservices.lsaw"))
  {
    BOOL v4 = 1;
  }
  else
  {
    id v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t pid = xpc_connection_get_pid(v3);
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "Connection from process %llu is not entitled for post installation modifications to the database", (uint8_t *)&v7, 0xCu);
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (void)performPostInstallationRegistration:(id)a3 personaUniqueStrings:(id)a4 operationUUID:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![(_LSDModifyClient *)self clientIsEntitledForPostInstallationOperations])
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient performPostInstallationRegistration:personaUniqueStrings:operationUUID:reply:]", 1591, 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v17);
    goto LABEL_10;
  }
  if (!v11)
  {
    id v17 = 0;
    id v16 = 0;
    goto LABEL_9;
  }
  uint64_t v14 = +[_LSPersonaDatabase sharedInstance]();
  id v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  id v27 = 0;
  id v16 = -[_LSPersonaDatabase personasWithAttributesForPersonaUniqueStrings:error:]((uint64_t)v14, v15, &v27);
  id v17 = v27;

  if (v16)
  {
LABEL_9:
    RegisterInstallResultsLock = (os_unfair_lock_s *)_LSDatabaseGetRegisterInstallResultsLock();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke;
    v21[3] = &unk_1E522F0C0;
    id v22 = v10;
    id v26 = v13;
    id v23 = v12;
    id v24 = self;
    id v25 = v16;
    id v20 = v16;
    _LSDoWithLock(RegisterInstallResultsLock, v21);

    goto LABEL_10;
  }
  uint64_t v18 = _LSDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[_LSDRebuildClient performRebuildRegistration:personaUniqueStrings:reply:]((uint64_t)v11, (uint64_t)v17, v18);
  }

  (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v17);
LABEL_10:
}

- (void)performPostUninstallationUnregistrationOfBundleID:(id)a3 operationUUID:(id)a4 unregisterType:(unsigned int)a5 precondition:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([(_LSDModifyClient *)self clientIsEntitledForPostInstallationOperations])
  {
    RegisterInstallResultsLock = (os_unfair_lock_s *)_LSDatabaseGetRegisterInstallResultsLock();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __118___LSDModifyClient_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply___block_invoke;
    v18[3] = &unk_1E522F110;
    id v23 = v15;
    id v19 = v13;
    id v20 = v12;
    unsigned int v24 = a5;
    id v21 = v14;
    id v22 = self;
    _LSDoWithLock(RegisterInstallResultsLock, v18);
  }
  else
  {
    id v17 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient performPostUninstallationUnregistrationOfBundleID:operationUUID:unregisterType:precondition:reply:]", 1616, 0);
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v17);
  }
}

- (void)performUpdateOfPersonasOfBundleIDs:(id)a3 toPersonaUniqueStrings:(id)a4 operationUUID:(id)a5 reply:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, uint64_t))a6;
  if ([(_LSDModifyClient *)self clientIsEntitledForPostInstallationOperations])
  {
    uint64_t v36 = 0;
    char v37 = &v36;
    uint64_t v38 = 0x3032000000;
    char v39 = __Block_byref_object_copy__23;
    uint64_t v40 = __Block_byref_object_dispose__23;
    id v41 = 0;
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    int v33 = __Block_byref_object_copy__23;
    unsigned int v34 = __Block_byref_object_dispose__23;
    id v35 = 0;
    id v14 = +[_LSPersonaDatabase sharedInstance]();
    id v15 = (id *)(v31 + 5);
    id obj = (id)v31[5];
    id v16 = -[_LSPersonaDatabase personasWithAttributesForPersonaUniqueStrings:error:]((uint64_t)v14, v11, &obj);
    objc_storeStrong(v15, obj);

    if (v16)
    {
      id v17 = _LSInstallLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [(_LSDClient *)self XPCConnection];
        int v19 = [v18 processIdentifier];
        *(_DWORD *)buf = 138412802;
        int v43 = v16;
        __int16 v44 = 2112;
        id v45 = v10;
        __int16 v46 = 2048;
        uint64_t v47 = v19;
        _os_log_impl(&dword_182959000, v17, OS_LOG_TYPE_DEFAULT, "attempting to set personas %@ for bundleIDs %@ from pid %ld", buf, 0x20u);
      }
      id v20 = _LSServer_DatabaseExecutionContext();
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __98___LSDModifyClient_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply___block_invoke;
      v23[3] = &unk_1E522F138;
      unsigned int v24 = v10;
      id v27 = &v30;
      id v25 = v16;
      long long v28 = &v36;
      id v26 = v12;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v20, v23);

      id v21 = v24;
    }
    else
    {
      id v21 = _LSInstallLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[_LSDModifyClient performUpdateOfPersonasOfBundleIDs:toPersonaUniqueStrings:operationUUID:reply:]();
      }
    }

    v13[2](v13, v37[5], v31[5]);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    id v22 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient performUpdateOfPersonasOfBundleIDs:toPersonaUniqueStrings:operationUUID:reply:]", 1816, 0);
    v13[2](v13, 0, (uint64_t)v22);
  }
}

- (void)forceSaveForTestingWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[_LSDModifyClient clientIsEntitledForPostInstallationOperations](self, "clientIsEntitledForPostInstallationOperations")|| (-[_LSDClient XPCConnection](self, "XPCConnection"), v5 = objc_claimAutoreleasedReturnValue(), [v5 _xpcConnection], id v6 = objc_claimAutoreleasedReturnValue(), v7 = _LSCheckEntitlementForXPCConnection(v6, @"com.apple.private.coreservices.can-force-database-save-for-testing"), v6, v5, v7))
  {
    id v8 = _LSServer_DatabaseExecutionContext();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54___LSDModifyClient_forceSaveForTestingWithCompletion___block_invoke;
    v10[3] = &unk_1E522D260;
    id v11 = v4;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v8, v10);
  }
  else
  {
    uint64_t v9 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient forceSaveForTestingWithCompletion:]", 1828, 0);
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }
}

- (void)setPreferredAppMarketplaces:(id)a3 completion:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = [(_LSDClient *)self XPCConnection];
  int v9 = _LSCheckEntitlementForNSXPCConnection(v8, @"com.apple.private.coreservices.appmarketplace.write");

  if (v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59___LSDModifyClient_setPreferredAppMarketplaces_completion___block_invoke;
    v14[3] = &unk_1E522F160;
    id v15 = v6;
    id v10 = +[LSMarketplacesPreferences modifyPreferencesWithBlock:v14];
    v7[2](v7, v10);

    id v11 = v15;
  }
  else
  {
    if (@"com.apple.private.coreservices.appmarketplace.write") {
      id v12 = @"com.apple.private.coreservices.appmarketplace.write";
    }
    else {
      id v12 = @"unknown entitlement";
    }
    uint64_t v16 = *MEMORY[0x1E4F28228];
    v17[0] = v12;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v13 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient setPreferredAppMarketplaces:completion:]", 1841, v11);
    v7[2](v7, v13);
  }
}

- (void)rebuildApplicationDatabasesForSystem:internal:user:completionHandler:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_182959000, v1, OS_LOG_TYPE_ERROR, "proc_pidinfo(PROC_PIDTBSDINFO) failed for %ld: %{darwin.errno}d", v2, 0x12u);
}

- (void)performUpdateOfPersonasOfBundleIDs:toPersonaUniqueStrings:operationUUID:reply:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0_8(&dword_182959000, v0, v1, "could not get personas from persona unique strings: %@", v2);
}

@end