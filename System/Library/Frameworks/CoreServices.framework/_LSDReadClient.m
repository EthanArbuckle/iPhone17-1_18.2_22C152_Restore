@interface _LSDReadClient
- (void)getAllUserActivityTypesAndDomainNamesWithCompletionHandler:(id)a3;
- (void)getApplicationCategoryIdentifiersSetWithCompletionHandler:(id)a3;
- (void)getBoundIconInfoForDocumentProxy:(id)a3 completionHandler:(id)a4;
- (void)getBundleProxyForCurrentProcessWithCompletionHandler:(id)a3;
- (void)getBundleRecordForCoreTypesWithCompletionHandler:(id)a3;
- (void)getBundleRecordForCurrentProcessWithCompletionHandler:(id)a3;
- (void)getCurrentApplicationDefaultInfoForCategory:(unint64_t)a3 completion:(id)a4;
- (void)getDiskUsage:(id)a3 completionHandler:(id)a4;
- (void)getEligibilityAnswerForDomain:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)getExtensionPointRecordForCurrentProcessWithCompletionHandler:(id)a3;
- (void)getExtensionPointRecordWithIdentifier:(id)a3 platform:(unsigned int)a4 completionHandler:(id)a5;
- (void)getHasEverChangedPreferredAppForCategory:(unint64_t)a3 completion:(id)a4;
- (void)getKernelPackageExtensionsWithCompletionHandler:(id)a3;
- (void)getKnowledgeUUIDAndSequenceNumberWithCompletionHandler:(id)a3;
- (void)getPreferencesWithCompletionHandler:(id)a3;
- (void)getPreferredAppMarketplacesWithCompletion:(id)a3;
- (void)getRedactedAppexRecordForSystemAppexWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 completionHandler:(id)a7;
- (void)getRelatedTypesOfTypeWithIdentifier:(id)a3 maximumDegreeOfSeparation:(int64_t)a4 completionHandler:(id)a5;
- (void)getResourceValuesForKeys:(id)a3 mimic:(id)a4 preferredLocalizations:(id)a5 completionHandler:(id)a6;
- (void)getServerStatusWithCompletionHandler:(id)a3;
- (void)getServerStoreNonBlockingWithCompletionHandler:(id)a3;
- (void)getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler:(id)a3;
- (void)getSettingsStoreConfigurationWithCompletionHandler:(id)a3;
- (void)getSystemContentStoreWithCompletionHandler:(id)a3;
- (void)getSystemModeWithCompletionHandler:(id)a3;
- (void)getTypeRecordForImportedTypeWithIdentifier:(id)a3 conformingToIdentifier:(id)a4 completionHandler:(id)a5;
- (void)getTypeRecordWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4 completionHandler:(id)a5;
- (void)getTypeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5 completionHandler:(id)a6;
- (void)getTypeRecordsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getTypeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5 completionHandler:(id)a6;
- (void)getWhetherTypeIdentifier:(id)a3 conformsToTypeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4;
- (void)mapBundleIdentifiers:(id)a3 orMachOUUIDs:(id)a4 completionHandler:(id)a5;
- (void)mapPlugInBundleIdentifiersToContainingBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)resolveQueries:(id)a3 legacySPI:(BOOL)a4 completionHandler:(id)a5;
- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4;
@end

@implementation _LSDReadClient

- (void)getBundleRecordForCurrentProcessWithCompletionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, id))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getBundleRecordForCurrentProcessWithCompletionHandler:]");
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = [(_LSDClient *)self XPCConnection];
  v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }

  v20[0] = v21;
  v20[1] = v22;
  id v19 = 0;
  v7 = +[LSBundleRecord bundleRecordForAuditToken:v20 error:&v19];
  id v8 = v19;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 applicationExtensionRecords];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_msgSend(v13, "_resolveAllProperties", (void)v15);
          v14 = [v13 extensionPointRecord];
          [v14 _resolveAllProperties];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v10);
    }
  }
  v4[2](v4, v7, v8);
}

- (void)getSystemContentStoreWithCompletionHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void *, void))a3;
  v5 = [(_LSDClient *)self XPCConnection];
  v6 = [v5 _xpcConnection];
  int MayMapDatabase = _LSXPCConnectionMayMapDatabase(v6);

  if (MayMapDatabase)
  {
    id v15 = 0;
    id v8 = _LSDatabaseCreateSystemContentDatabaseFromPersistentStore(&v15);
    id v9 = v15;
    if (v8)
    {
      uint64_t v10 = v8[1];
      uint64_t v11 = _LSDatabaseGetNode((uint64_t)v8);
      v4[2](v4, v10, v11, 0);
    }
    else
    {
      v12 = _LSDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = [(_LSDClient *)self XPCConnection];
        int v14 = [v13 processIdentifier];
        *(_DWORD *)buf = 67109378;
        int v19 = v14;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_error_impl(&dword_182959000, v12, OS_LOG_TYPE_ERROR, "could not fetch system content store for %d: %@", buf, 0x12u);
      }
      ((void (**)(id, uint64_t, void *, id))v4)[2](v4, 0, 0, v9);
    }
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F28228];
    long long v17 = @"process may not map database";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v8 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDReadClient getSystemContentStoreWithCompletionHandler:]", 996, v9);
    ((void (**)(id, uint64_t, void *, void *))v4)[2](v4, 0, 0, v8);
  }
}

- (void)getTypeRecordWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v7 = (void (**)(id, void *))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordWithIdentifier:allowUndeclared:completionHandler:]");
  if (v9)
  {
    if (v6) {
      +[UTTypeRecord typeRecordWithPotentiallyUndeclaredIdentifier:](UTTypeRecord, "typeRecordWithPotentiallyUndeclaredIdentifier:");
    }
    else {
    id v8 = +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:");
    }
  }
  else
  {
    id v8 = 0;
  }
  v7[2](v7, v8);
}

- (void)getResourceValuesForKeys:(id)a3 mimic:(id)a4 preferredLocalizations:(id)a5 completionHandler:(id)a6
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void *, void *, id))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getResourceValuesForKeys:mimic:preferredLocalizations:completionHandler:]");
  if (!v9) {
    goto LABEL_13;
  }
  v13 = _LSURLPropertyProviderAllKeys();
  int v14 = [v9 isSubsetOfSet:v13] ^ 1;
  if (!v10) {
    LOBYTE(v14) = 1;
  }
  if ((v14 & 1) != 0 || ([v10 URL], (id v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_13;
  }
  uint64_t v16 = [v10 URL];
  int v17 = [v16 isFileURL];

  if (!v17)
  {
LABEL_13:
    uint64_t v37 = *MEMORY[0x1E4F28228];
    v38[0] = @"invalid input parameters";
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDReadClient getResourceValuesForKeys:mimic:preferredLocalizations:completionHandler:]", 769, v23);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 0;
    goto LABEL_14;
  }
  long long v18 = objc_opt_class();
  int v19 = _LSIsSetWithValuesOfClass(v9, v18);
  char v20 = v19 ^ 1;
  if (!v11) {
    char v20 = 1;
  }
  if ((v20 & 1) == 0)
  {
    id v21 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    char v22 = _LSIsArrayWithValuesOfClasses(v11, v21);

    if (v22) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  if (!v19) {
    goto LABEL_13;
  }
LABEL_17:
  id v36 = 0;
  v27 = _LSResolveRemoteURLPropertiesWithMimic(v10, v11, v9, (uint64_t)&v36);
  id v24 = v36;
  if (!v27)
  {
    v25 = 0;
    v26 = 0;
    goto LABEL_15;
  }
  v28 = (void *)[v9 mutableCopy];
  v29 = (void *)MEMORY[0x1E4F1CAD0];
  v30 = [v27 allKeys];
  v31 = [v29 setWithArray:v30];
  [v28 minusSet:v31];

  id v23 = v28;
  if (_LSURLPropertiesNeedReplacement(v27))
  {
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v27, "count"));
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __90___LSDReadClient_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler___block_invoke;
    v34[3] = &unk_1E522DB20;
    id v33 = v32;
    id v35 = v33;
    [v27 enumerateKeysAndObjectsUsingBlock:v34];
    v25 = (void *)[v33 copy];
  }
  else
  {
    v25 = v27;
  }
  v26 = v23;
LABEL_14:

LABEL_15:
  v12[2](v12, v25, v26, v24);
}

- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_LSDReadClient;
  [(_LSDClient *)&v7 willHandleInvocation:v6 isReply:v4];
  if (!v4
    && (char *)[v6 selector] != sel_getServerStatusWithCompletionHandler_
    && (char *)[v6 selector] != sel_getServerStoreNonBlockingWithCompletionHandler_)
  {
    __LAUNCH_SERVICES_IS_WAITING_FOR_THE_DATABASE_TO_FINISH_SEEDING__();
  }
}

- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    [v5 invoke];
  }
  else
  {
    _LSServer_DatabaseExecutionContext();
    objc_super v7 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50___LSDReadClient_invokeServiceInvocation_isReply___block_invoke;
    v8[3] = &unk_1E522BB38;
    id v9 = v6;
    -[LSDBExecutionContext syncRead:](v7, v8);
  }
}

- (void)getPreferredAppMarketplacesWithCompletion:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void *, id))a3;
  id v5 = [(_LSDClient *)self XPCConnection];
  int v6 = _LSCheckEntitlementForNSXPCConnection(v5, @"com.apple.private.coreservices.appmarketplace.read");

  if (v6)
  {
    id v11 = 0;
    objc_super v7 = +[LSMarketplacesPreferences currentPreferencesWithError:&v11];
    id v8 = v11;
    id v9 = [v7 preferredMarketplaces];
    v4[2](v4, v9, v8);
  }
  else
  {
    if (@"com.apple.private.coreservices.appmarketplace.read") {
      id v10 = @"com.apple.private.coreservices.appmarketplace.read";
    }
    else {
      id v10 = @"unknown entitlement";
    }
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13[0] = v10;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_super v7 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDReadClient getPreferredAppMarketplacesWithCompletion:]", 1072, v8);
    v4[2](v4, 0, v7);
  }
}

- (void)getServerStoreNonBlockingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unsigned int SessionStatus = _LSDatabaseGetSessionStatus();
  if ((SessionStatus & 0x80) != 0)
  {
    objc_super v7 = +[LSDatabaseBlockingFetchServer sharedInstance];
    uint64_t v8 = (SessionStatus >> 10) & 1;
    [v7 setBlockingIsForManualRebuild:v8];

    id v9 = +[LSDatabaseBlockingFetchServer sharedInstance];
    id v10 = [v9 getEndpoint];
    (*((void (**)(id, void, void, void *, uint64_t, void))v4 + 2))(v4, 0, 0, v10, v8, 0);
  }
  else
  {
    int v6 = [(_LSDClient *)self XPCConnection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65___LSDReadClient_getServerStoreNonBlockingWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E522E5C8;
    id v12 = v4;
    _LSServer_GetServerStoreForConnectionWithCompletionHandler(v6, v11);
  }
}

- (void)getSystemModeWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void *, void))a3;
  +[LSApplicationRestrictionsManager sharedInstance]();
  v3 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  id v4 = -[LSApplicationRestrictionsManager systemMode](v3);

  v5[2](v5, v4, 0);
}

- (void)getServerStatusWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getServerStatusWithCompletionHandler:]");
  uint64_t SessionStatus = _LSDatabaseGetSessionStatus();
  v4[2](v4, SessionStatus);
}

- (void)getKernelPackageExtensionsWithCompletionHandler:(id)a3
{
  int v6 = (void (**)(id, const void *, void))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getKernelPackageExtensionsWithCompletionHandler:]");
  CFArrayRef v3 = _LSCopyKernelPackageExtensionsAsLSD();
  CFArrayRef v4 = v3;
  if (v3 && CFArrayGetCount(v3) >= 1)
  {
    v6[2](v6, v4, 0);
  }
  else
  {
    id v5 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10817, (uint64_t)"-[_LSDReadClient getKernelPackageExtensionsWithCompletionHandler:]", 394, 0);
    ((void (**)(id, const void *, void *))v6)[2](v6, 0, v5);

    if (!v4) {
      goto LABEL_6;
    }
  }
  CFRelease(v4);
LABEL_6:
}

- (void)getDiskUsage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getDiskUsage:completionHandler:]");
  MEMORY[0x185310450]();
  uint64_t v8 = +[_LSDiskUsage _serverQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___LSDReadClient_getDiskUsage_completionHandler___block_invoke;
  block[3] = &unk_1E522C040;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)getKnowledgeUUIDAndSequenceNumberWithCompletionHandler:(id)a3
{
  CFArrayRef v4 = (void (**)(id, id, id))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getKnowledgeUUIDAndSequenceNumberWithCompletionHandler:]");
  id v5 = +[LSApplicationWorkspace defaultWorkspace];
  id v12 = 0;
  id v13 = 0;
  [v5 getKnowledgeUUID:&v13 andSequenceNumber:&v12];
  id v6 = v13;
  id v7 = v12;

  uint64_t v8 = [(_LSDClient *)self XPCConnection];
  id v9 = [v8 _xpcConnection];
  int MayMapDatabase = _LSXPCConnectionMayMapDatabase(v9);

  if (!MayMapDatabase)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29128], "_LS_nullUUID");

    id v6 = (id)v11;
  }
  v4[2](v4, v6, v7);
}

- (void)resolveQueries:(id)a3 legacySPI:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *, id))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient resolveQueries:legacySPI:completionHandler:]");
  id v10 = objc_opt_class();
  if (!_LSIsSetWithValuesOfClass(v8, v10))
  {
    uint64_t v28 = *MEMORY[0x1E4F28228];
    v29 = @"invalid input parameters";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v22 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDReadClient resolveQueries:legacySPI:completionHandler:]", 492, v11);
    goto LABEL_14;
  }
  uint64_t v11 = +[_LSQueryContext defaultContext];
  if (v6)
  {
    id v12 = [(_LSDClient *)self XPCConnection];
    id v13 = [v12 _xpcConnection];
    unsigned int v14 = _LSIsXPCConnectionPlatformBinary(v13);

    if (v14)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = v8;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v25;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * v18++) setLegacy:1];
          }
          while (v16 != v18);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v30 count:16];
        }
        while (v16);
      }

      goto LABEL_12;
    }
    uint64_t v22 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDReadClient resolveQueries:legacySPI:completionHandler:]", 468, 0);
LABEL_14:
    id v21 = (id)v22;
    char v20 = 0;
    goto LABEL_15;
  }
LABEL_12:
  int v19 = [(_LSDClient *)self XPCConnection];
  id v23 = 0;
  char v20 = [v11 _resolveQueries:v8 XPCConnection:v19 error:&v23];
  id v21 = v23;

LABEL_15:
  v9[2](v9, v20, v21);
}

- (void)getBundleProxyForCurrentProcessWithCompletionHandler:(id)a3
{
  CFArrayRef v4 = (void (**)(id, void *, id))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getBundleProxyForCurrentProcessWithCompletionHandler:]");
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(_LSDClient *)self XPCConnection];
  BOOL v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }

  v12[0] = v13;
  v12[1] = v14;
  id v11 = 0;
  id v7 = +[LSBundleRecord bundleRecordForAuditToken:v12 error:&v11];
  id v8 = v11;
  if (v7)
  {
    id v9 = [v7 compatibilityObject];
    if (!v9)
    {
      uint64_t v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10810, (uint64_t)"-[_LSDReadClient getBundleProxyForCurrentProcessWithCompletionHandler:]", 531, 0);

      id v9 = 0;
      id v8 = (id)v10;
    }
  }
  else
  {
    id v9 = 0;
  }

  v4[2](v4, v9, v8);
}

- (void)getBundleRecordForCoreTypesWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getBundleRecordForCoreTypesWithCompletionHandler:]");
  CFArrayRef v3 = +[LSBundleRecord coreTypesBundleRecord];
  CFArrayRef v4 = [v3 _realRecord];

  v5[2](v5, v4);
}

- (void)getExtensionPointRecordWithIdentifier:(id)a3 platform:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = (void (**)(id, LSExtensionPointRecord *, id))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getExtensionPointRecordWithIdentifier:platform:completionHandler:]");
  id v11 = 0;
  id v9 = [[LSExtensionPointRecord alloc] initWithIdentifier:v7 platform:v6 error:&v11];
  id v10 = v11;
  v8[2](v8, v9, v10);
}

- (void)getExtensionPointRecordForCurrentProcessWithCompletionHandler:(id)a3
{
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getExtensionPointRecordForCurrentProcessWithCompletionHandler:]");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80___LSDReadClient_getExtensionPointRecordForCurrentProcessWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E522F270;
  id v5 = v4;
  id v7 = v5;
  [(_LSDReadClient *)self getBundleRecordForCurrentProcessWithCompletionHandler:v6];
}

- (void)getTypeRecordsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, void *))a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordsWithIdentifiers:completionHandler:]");
  if (v8 && (uint64_t v6 = objc_opt_class(), _LSIsSetWithValuesOfClass(v8, v6)))
  {
    id v7 = +[UTTypeRecord typeRecordsWithIdentifiers:v8];
  }
  else
  {
    id v7 = 0;
  }
  v5[2](v5, v7);
}

- (void)getTypeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5 completionHandler:(id)a6
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordWithTag:ofClass:conformingToIdentifier:completionHandler:]");
  id v12 = 0;
  if (v13 && v9)
  {
    id v12 = +[UTTypeRecord typeRecordWithTag:v13 ofClass:v9 conformingToIdentifier:v10];
  }
  v11[2](v11, v12);
}

- (void)getTypeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5 completionHandler:(id)a6
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordsWithTag:ofClass:conformingToIdentifier:completionHandler:]");
  id v12 = 0;
  if (v13 && v9)
  {
    id v12 = +[UTTypeRecord typeRecordsWithTag:v13 ofClass:v9 conformingToIdentifier:v10];
  }
  v11[2](v11, v12);
}

- (void)getTypeRecordForImportedTypeWithIdentifier:(id)a3 conformingToIdentifier:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, void *))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordForImportedTypeWithIdentifier:conformingToIdentifier:c"
                                    "ompletionHandler:]");
  if (v10)
  {
    id v9 = +[UTTypeRecord typeRecordForImportedTypeWithIdentifier:v10 conformingToIdentifier:v7];
  }
  else
  {
    id v9 = 0;
  }
  v8[2](v8, v9);
}

- (void)getRelatedTypesOfTypeWithIdentifier:(id)a3 maximumDegreeOfSeparation:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, id, id))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getRelatedTypesOfTypeWithIdentifier:maximumDegreeOfSeparation:completionHandler:]");
  id v9 = +[UTTypeRecord typeRecordWithIdentifier:v7];
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __98___LSDReadClient_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler___block_invoke;
    v14[3] = &unk_1E522F298;
    id v12 = v10;
    id v15 = v12;
    id v13 = v11;
    id v16 = v13;
    [v9 _enumerateRelatedTypesWithMaximumDegreeOfSeparation:a4 block:v14];
    v8[2](v8, v12, v13);
  }
  else
  {
    v8[2](v8, 0, 0);
  }
}

- (void)getWhetherTypeIdentifier:(id)a3 conformsToTypeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, BOOL))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getWhetherTypeIdentifier:conformsToTypeIdentifier:completionHandler:]");
  BOOL v9 = 0;
  if (v10 && v7) {
    BOOL v9 = +[UTTypeRecord _typeIdentifier:v10 conformsToTypeIdentifier:v7];
  }
  v8[2](v8, v9);
}

- (void)getBoundIconInfoForDocumentProxy:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (IconServicesLibrary(void)::frameworkLibrary
    || (IconServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
  {
    _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getBoundIconInfoForDocumentProxy:completionHandler:]");
    if (v6)
    {
      id v8 = [v6 URL];
      if (!v8) {
        goto LABEL_11;
      }
      BOOL v9 = [(_LSDClient *)self XPCConnection];
      id v10 = v9;
      if (v9)
      {
        [v9 auditToken];
      }
      else
      {
        long long v16 = 0u;
        long long v17 = 0u;
      }

      if (!+[FSNode canReadURL:v8 fromSandboxWithAuditToken:&v16])
      {
        long long v14 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDReadClient getBoundIconInfoForDocumentProxy:completionHandler:]", 692, 0);
        v7[2](v7, 0, v14);
      }
      else
      {
LABEL_11:
        long long v14 = objc_msgSend(v6, "_boundIconInfo", v16, v17);
        if (v14)
        {
          ((void (**)(id, void *, void *))v7)[2](v7, v14, 0);
        }
        else
        {
          id v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"-[_LSDReadClient getBoundIconInfoForDocumentProxy:completionHandler:]", 688, 0);
          v7[2](v7, 0, v15);
        }
      }
    }
    else
    {
      uint64_t v18 = *MEMORY[0x1E4F28228];
      v19[0] = @"documentProxy";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v12 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDReadClient getBoundIconInfoForDocumentProxy:completionHandler:]", 696, v11);
      v7[2](v7, 0, v12);
    }
  }
  else
  {
    id v13 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[_LSDReadClient getBoundIconInfoForDocumentProxy:completionHandler:]", 699, 0);
    v7[2](v7, 0, v13);
  }
}

- (void)getAllUserActivityTypesAndDomainNamesWithCompletionHandler:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getAllUserActivityTypesAndDomainNamesWithCompletionHandler:]");
  id v5 = [(_LSDClient *)self XPCConnection];
  id v6 = [v5 _xpcConnection];
  int MayMapDatabase = _LSXPCConnectionMayMapDatabase(v6);

  if (MayMapDatabase)
  {
    CFTypeRef cf = 0;
    CFTypeRef v15 = 0;
    int v8 = _LSCopyClaimedActivityIdentifiersAndDomains(&v15, &cf);
    if (v8)
    {
      BOOL v9 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v8, (uint64_t)"-[_LSDReadClient getAllUserActivityTypesAndDomainNamesWithCompletionHandler:]", 718, 0);
      (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v9);
    }
    else
    {
      CFTypeRef v12 = cf;
      id v13 = (void (*)(id, void *, CFTypeRef, void))*((void *)v4 + 2);
      BOOL v9 = (id)v15;
      v13(v4, v9, v12, 0);
    }

    if (cf) {
      CFRelease(cf);
    }
    if (v15) {
      CFRelease(v15);
    }
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F28228];
    v17[0] = @"process may not map database";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v11 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDReadClient getAllUserActivityTypesAndDomainNamesWithCompletionHandler:]", 722, v10);
    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v11);
  }
}

- (void)mapBundleIdentifiers:(id)a3 orMachOUUIDs:(id)a4 completionHandler:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v37 = a4;
  id v36 = (void (**)(id, void *, void *, id))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient mapBundleIdentifiers:orMachOUUIDs:completionHandler:]");
  int v8 = [(_LSDClient *)self XPCConnection];
  BOOL v9 = [v8 _xpcConnection];
  int v10 = _LSCheckEntitlementForXPCConnection(v9, @"com.apple.private.coreservices.canmapbundleidtouuid");

  if (!v10)
  {
    uint64_t v65 = *MEMORY[0x1E4F28228];
    v66 = @"Caller is not allowed to map bundleIDs/UUIDs, required entitlement missing";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDReadClient mapBundleIdentifiers:orMachOUUIDs:completionHandler:]", 870, v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
    long long v27 = 0;
    uint64_t v28 = 0;
    goto LABEL_32;
  }
  if (v38)
  {
    id v11 = objc_opt_class();
    int v12 = _LSIsSetWithValuesOfClass(v38, v11);
  }
  else
  {
    int v12 = 1;
  }
  if (v37 && v12)
  {
    CFTypeRef v15 = objc_opt_class();
    int v12 = _LSIsSetWithValuesOfClass(v37, v15);
  }
  if (!v12)
  {
    uint64_t v67 = *MEMORY[0x1E4F28228];
    v68 = @"invalid input parameters";
    long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDReadClient mapBundleIdentifiers:orMachOUUIDs:completionHandler:]", 866, v26);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  id v64 = 0;
  id v62 = 0;
  v61 = 0;
  char v63 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  long long v17 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v61, v16, 0);

  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    int v19 = [MEMORY[0x1E4F1CA48] array];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke;
    v56[3] = &unk_1E522F2C0;
    v60 = v17;
    id v57 = v37;
    id v35 = v18;
    id v58 = v35;
    id v34 = v19;
    id v59 = v34;
    char v20 = (void *)MEMORY[0x18530F950](v56);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_2;
    v53[3] = &unk_1E522F310;
    v55 = v17;
    id v21 = v20;
    id v54 = v21;
    v40 = (void *)MEMORY[0x18530F950](v53);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_4;
    v50[3] = &unk_1E522F338;
    v52 = v17;
    id v33 = v21;
    id v51 = v33;
    v41 = (void *)MEMORY[0x18530F950](v50);
    if (v38)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v22 = v38;
      id obj = v22;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v69 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v47 != v24) {
              objc_enumerationMutation(obj);
            }
            _LSDatabaseGetStringForCFString(*v17, *(const __CFString **)(*((void *)&v46 + 1) + 8 * i), 0);
            id v45 = v41;
            _LSDatabaseEnumeratingBindingMap();
            id v44 = v40;
            _LSDatabaseEnumeratingBindingMap();
          }
          id v22 = obj;
          uint64_t v23 = [obj countByEnumeratingWithState:&v46 objects:v69 count:16];
        }
        while (v23);
      }
    }
    else
    {
      id v43 = v41;
      _CSStoreEnumerateUnits();
      id v42 = v40;
      _CSStoreEnumerateUnits();

      id v22 = v43;
    }

    id v14 = 0;
  }
  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v29 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v61, v29, 0);

    if (v30) {
      id v14 = 0;
    }
    else {
      id v14 = v64;
    }
    id v34 = 0;
    id v35 = 0;
  }
  if (v61 && v63) {
    _LSContextDestroy(v61);
  }
  id v31 = v62;
  id v62 = 0;
  v61 = 0;

  char v63 = 0;
  id v32 = v64;
  id v64 = 0;

  long long v27 = v34;
  uint64_t v28 = v35;
LABEL_32:
  v36[2](v36, v28, v27, v14);
}

- (void)mapPlugInBundleIdentifiersToContainingBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  uint64_t v23 = (void (**)(id, void *, id))a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient mapPlugInBundleIdentifiersToContainingBundleIdentifiers:completionHandler:]");
  id v6 = [(_LSDClient *)self XPCConnection];
  id v7 = [v6 _xpcConnection];
  LODWORD(self) = _LSCheckEntitlementForXPCConnection(v7, @"com.apple.private.coreservices.canmapbundleidtouuid");

  if (!self)
  {
    uint64_t v35 = *MEMORY[0x1E4F28228];
    id v36 = @"Caller is not allowed to map pluginIDs/bundleIDs, required entitlement missing";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDReadClient mapPlugInBundleIdentifiersToContainingBundleIdentifiers:completionHandler:]", 923, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
    long long v17 = 0;
    goto LABEL_22;
  }
  int v8 = objc_opt_class();
  if (!_LSIsSetWithValuesOfClass(v22, v8))
  {
    uint64_t v37 = *MEMORY[0x1E4F28228];
    id v38 = @"invalid input parameters";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDReadClient mapPlugInBundleIdentifiersToContainingBundleIdentifiers:completionHandler:]", 919, v16);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  id v34 = 0;
  id v31 = 0;
  id v32 = 0;
  char v33 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  BOOL v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  int v10 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v31, v9, 0);

  if (v10)
  {
    long long v25 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v22;
    uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          _LSDatabaseGetStringForCFString(*v10, *(const __CFString **)(*((void *)&v27 + 1) + 8 * i), 0);
          id v26 = v25;
          _LSDatabaseEnumeratingBindingMap();
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v11);
    }

    goto LABEL_17;
  }
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v18 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v31, v18, 0);

  if (v19)
  {
    long long v25 = 0;
LABEL_17:
    id v15 = 0;
    goto LABEL_18;
  }
  id v15 = v34;
  long long v25 = 0;
LABEL_18:
  if (v31 && v33) {
    _LSContextDestroy(v31);
  }
  id v20 = v32;
  id v31 = 0;
  id v32 = 0;

  char v33 = 0;
  id v21 = v34;
  id v34 = 0;

  long long v17 = v25;
LABEL_22:
  v23[2](v23, v17, v15);
}

- (void)getPreferencesWithCompletionHandler:(id)a3
{
  int v8 = (LaunchServices::PrefsStorage *)a3;
  Shared = (LaunchServices::PrefsStorage *)LaunchServices::PrefsStorage::GetShared(v8);
  uint64_t v4 = LaunchServices::PrefsStorage::getAllPreferences(Shared);
  id v5 = (void *)v4;
  id v6 = (void *)MEMORY[0x1E4F1CC08];
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  (*((void (**)(LaunchServices::PrefsStorage *, id, void))v8 + 2))(v8, v7, 0);
}

- (void)getSettingsStoreConfigurationWithCompletionHandler:(id)a3
{
  CFArrayRef v3 = (void (**)(id, void *, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [MEMORY[0x1E4F29268] currentConnection];
  id v5 = v4;
  if (v4)
  {
    [v4 auditToken];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }

  id v6 = +[LSSettingsStore sharedInstance];
  v9[0] = v10;
  v9[1] = v11;
  id v7 = [v6 settingsStoreConfigurationForProcessWithAuditToken:v9];

  if (v7)
  {
    v3[2](v3, v7, 0);
  }
  else
  {
    int v8 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDReadClient getSettingsStoreConfigurationWithCompletionHandler:]", 944, 0);
    ((void (**)(id, void *, void *))v3)[2](v3, 0, v8);
  }
}

- (void)getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *, void *))a3;
  id v5 = [(_LSDClient *)self XPCConnection];
  id v6 = [v5 _xpcConnection];
  int MayMapDatabase = _LSXPCConnectionMayMapDatabase(v6);

  if (MayMapDatabase)
  {
    if ([(id)__LSDefaultsGetSharedInstance() isSystemServer])
    {
      int v8 = _LSDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = [(_LSDClient *)self XPCConnection];
        v13[0] = 67109120;
        v13[1] = [v12 processIdentifier];
        _os_log_error_impl(&dword_182959000, v8, OS_LOG_TYPE_ERROR, "Warning: process %d asking for session langauges from the root lsd. It will only get a backstop result.", (uint8_t *)v13, 8u);
      }
    }
    BOOL v9 = 0;
    long long v10 = [(id)__LSDefaultsGetSharedInstance() preferredLocalizations];
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F28228];
    v15[0] = @"process is not entitled to get language list";
    long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    BOOL v9 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDReadClient getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler:]", 970, v11);

    long long v10 = 0;
  }
  v4[2](v4, v10, v9);
}

- (void)getApplicationCategoryIdentifiersSetWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void))a3;
  CFArrayRef v3 = _LSGetValidApplicationCategoryTypeSet();
  v4[2](v4, v3, 0);
}

- (void)getRedactedAppexRecordForSystemAppexWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 completionHandler:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, id, id))a7;
  id v33 = 0;
  long long v30 = 0;
  id v31 = 0;
  char v32 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  id v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v30, v15, 0);

  if (v16)
  {
    id v29 = 0;
    LOBYTE(v28) = 0;
    id v17 = [[LSApplicationExtensionRecord alloc] _initWithUUID:v11 node:v12 bundleIdentifier:v13 platform:v8 context:v16 requireValid:1 allowRedacted:v28 error:&v29];
    id v18 = v29;
    if ([v17 eligibleForRedaction])
    {
      id v19 = v17;
      id v20 = [v19 extensionPointRecord];
      [v20 _resolveAllProperties];

      id v21 = [v19 containingBundleRecord];
      [v21 _resolveAllProperties];

      id v22 = [v19 containingBundleRecord];
      [v22 redact];

      uint64_t v23 = [v19 containingBundleRecord];
      [v23 detach];

      [v19 _resolveAllProperties];
      [v19 redact];
      [v19 detach];
    }
    else
    {
      uint64_t v25 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"-[_LSDReadClient getRedactedAppexRecordForSystemAppexWithUUID:node:bundleIdentifier:platform:completionHandler:]", 1027, 0);

      id v19 = 0;
      id v18 = (id)v25;
    }
  }
  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v24 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    id v19 = (id)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v30, v24, 0);

    if (v19)
    {
      id v18 = 0;
      id v19 = 0;
    }
    else
    {
      id v18 = v33;
    }
  }
  v14[2](v14, v19, v18);
  if (v30 && v32) {
    _LSContextDestroy(v30);
  }
  id v26 = v31;
  long long v30 = 0;
  id v31 = 0;

  char v32 = 0;
  id v27 = v33;
  id v33 = 0;
}

- (void)getEligibilityAnswerForDomain:(unint64_t)a3 withCompletionHandler:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, void *))a4;
  if ((_LSServer_AcquiesceToDeputizationForDomain(a3) & 1) == 0)
  {
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Can't ask to evaluate domain %llu", a3);
    uint64_t v24 = *MEMORY[0x1E4F28228];
    v25[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    BOOL v9 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDReadClient getEligibilityAnswerForDomain:withCompletionHandler:]", 1041, v8);
    v6[2](v6, 0, v9);
  }
  long long v10 = [(_LSDClient *)self XPCConnection];
  id v11 = [v10 _xpcConnection];
  BOOL v12 = _LSXPCConnectionMayMapDatabase(v11) == 0;

  if (v12)
  {
    uint64_t v22 = *MEMORY[0x1E4F28228];
    id v20 = @"com.apple.private.coreservices.canmaplsdatabase";
    if (!@"com.apple.private.coreservices.canmaplsdatabase") {
      id v20 = @"unknown entitlement";
    }
    uint64_t v23 = v20;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v19 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDReadClient getEligibilityAnswerForDomain:withCompletionHandler:]", 1047, v18);
    v6[2](v6, 0, v19);
  }
  else
  {
    uint64_t v14 = LaunchServices::EligibilityCache::shared(v13);
    id v21 = 0;
    unint64_t v15 = LaunchServices::EligibilityCache::cachedAnswerForDomain(v14, a3, &v21);
    char v17 = v16;
    id v18 = v21;
    if (!v17)
    {
      v6[2](v6, 0, v18);
      goto LABEL_11;
    }
    id v19 = [NSNumber numberWithUnsignedLongLong:v15];
    ((void (**)(id, void *, void *))v6)[2](v6, v19, 0);
  }

LABEL_11:
}

- (void)getHasEverChangedPreferredAppForCategory:(unint64_t)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = [(_LSDClient *)self XPCConnection];
  uint64_t v8 = [v7 _xpcConnection];
  int MayMapDatabase = _LSXPCConnectionMayMapDatabase(v8);

  if (MayMapDatabase)
  {
    long long v10 = [NSNumber numberWithBool:_LSServer_HasPreferenceEverBeenSetForDefaultAppCategory(a3)];
    v6[2](v6, v10, 0);
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F28228];
    id v11 = @"com.apple.private.coreservices.canmaplsdatabase";
    if (!@"com.apple.private.coreservices.canmaplsdatabase") {
      id v11 = @"unknown entitlement";
    }
    v15[0] = v11;
    BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v13 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDReadClient getHasEverChangedPreferredAppForCategory:completion:]", 1057, v12);
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v13);
  }
}

- (void)getCurrentApplicationDefaultInfoForCategory:(unint64_t)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, id))a4;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [(_LSDClient *)self XPCConnection];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 auditToken];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }

  v23[0] = v24;
  v23[1] = v25;
  id v22 = 0;
  BOOL v9 = +[LSBundleRecord bundleRecordForAuditToken:v23 error:&v22];
  long long v10 = (LSDefaultApplicationQueryBackend *)v22;
  id v11 = _LSDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = [(_LSDClient *)self XPCConnection];
    int v13 = [v12 processIdentifier];
    *(_DWORD *)buf = 134218240;
    uint64_t v31 = v13;
    __int16 v32 = 2048;
    unint64_t v33 = a3;
    _os_log_impl(&dword_182959000, v11, OS_LOG_TYPE_DEFAULT, "pid %ld getting app default info for category %lu", buf, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v9;
    uint64_t v15 = [v14 supportedDefaultAppCategories];
    if ((LSDefaultAppCategoryMaskForCategory(a3) & v15) != 0)
    {
      char v16 = [LSDefaultApplicationQueryBackend alloc];
      char v17 = objc_alloc_init(LSDefaultApplicationQueryServerDatastore);
      id v18 = objc_alloc_init(LSDefaultApplicationQueryDatabaseDefaultAppEvaluator);
      id v19 = [(LSDefaultApplicationQueryBackend *)v16 initWithDatastore:v17 defaultAppEvaluator:v18];

      id v20 = [(LSDefaultApplicationQueryBackend *)v19 refreshQueryResultForApplication:v14 category:a3];
    }
    else
    {
      uint64_t v28 = *MEMORY[0x1E4F28228];
      id v29 = @"App not a candidate for this category, so will never be the default";
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      uint64_t v21 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDReadClient getCurrentApplicationDefaultInfoForCategory:completion:]", 1103, v19);

      id v20 = 0;
      long long v10 = (LSDefaultApplicationQueryBackend *)v21;
    }
    goto LABEL_13;
  }
  if (v9)
  {
    uint64_t v26 = *MEMORY[0x1E4F28228];
    id v27 = @"process is not an app";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDReadClient getCurrentApplicationDefaultInfoForCategory:completion:]", 1107, v14);
    id v20 = 0;
    id v19 = v10;
    long long v10 = (LSDefaultApplicationQueryBackend *)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  id v20 = 0;
LABEL_14:
  v6[2](v6, v20, v10);
}

@end