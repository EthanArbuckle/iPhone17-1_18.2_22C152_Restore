@interface LSServer
@end

@implementation LSServer

void ___LSServer_RefreshContentInFrameworkAtURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v24 = a2;
  id v25 = a3;
  uint64_t v26 = a1;
  int v5 = _LSUnregisterPluginsInDirectory(*(const __CFURL **)(a1 + 32));
  if (v5)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v5, (uint64_t)"_LSServer_RefreshContentInFrameworkAtURL_block_invoke", 470, 0);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    oslog = _LSInstallLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
      ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_cold_2();
    }
  }
  else
  {
    oslog = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v39 = 0;
    id v40 = 0;
    int inited = _LSContextInitReturningError(&v40, &v39);
    id v27 = v39;
    if (inited)
    {
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3254779904;
      v35 = ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_2;
      v36 = &unk_1ECB17850;
      v38 = v40;
      v37 = oslog;
      _CSStoreEnumerateUnits();
      int v7 = _LSExtensionPointUnregisterUnderFrameworkURL(v40, *(void **)(a1 + 32));
      if (v7)
      {
        uint64_t v8 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v7, (uint64_t)"_LSServer_RefreshContentInFrameworkAtURL_block_invoke", 454, 0);

        id v27 = (id)v8;
      }

      v9 = v38;
    }
    else
    {
      v9 = _LSInstallLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_cold_1();
      }
    }

    if (!v27)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v43, 16, v24, v25);
      if (v11)
      {
        uint64_t v12 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v10);
            }
            v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v15 = [v14 objectForKey:@"ApplicationType"];
            if ([v15 isEqualToString:@"Framework"])
            {
              v16 = (objc_class *)MEMORY[0x1E4F1CB10];
              id v17 = v14;
              id v18 = [v16 alloc];
              v19 = [v17 objectForKey:@"Path"];

              CFURLRef v20 = (const __CFURL *)[v18 initFileURLWithPath:v19 isDirectory:1];
              CFDictionaryRef v21 = CFBundleCopyInfoDictionaryForURL(v20);
              CFDictionaryRef v22 = v21;
              if (v21)
              {
                v23 = [(__CFDictionary *)v21 objectForKeyedSubscript:@"NSExtensionSDK"];
                v41[0] = MEMORY[0x1E4F143A8];
                v41[1] = 3221225472;
                v41[2] = ___registerExtensionPointsFromMIFrameworkDictionary_block_invoke;
                v41[3] = &unk_1E522CF50;
                CFURLRef v42 = v20;
                [v23 enumerateKeysAndObjectsUsingBlock:v41];
              }
            }
            else if ([v15 isEqualToString:@"PluginKitPlugin"])
            {
              _registerMIPluginDictionary(v14, oslog);
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v43 count:16];
        }
        while (v11);
      }
    }
  }

  (*(void (**)(void))(*(void *)(v26 + 48) + 16))();
}

void ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)(a3 + 168) & 4) != 0)
  {
    id v4 = (id)_CSStringCopyCFString();
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void ___LSServer_LSEnumerateAndRegisterAllCryptexContent_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _LSServer_DatabaseExecutionContext();
  id v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  -[LSDBExecutionContext assertNotActiveForThisThread](v4);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___LSServer_LSEnumerateAndRegisterAllCryptexContent_block_invoke_2;
  v8[3] = &unk_1E522C240;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v7 = v3;
  -[LSRebuildStatisticsGatherer performCryptexContentScan:](v6, v8);
}

void ___LSServer_LSEnumerateAndRegisterAllCryptexContent_block_invoke_2(uint64_t a1)
{
  v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "calling into InstalledContentLibrary to register cryptex content", v3, 2u);
  }

  _LSServer_LSEnumerateAndRegisterAllCryptexContentWithContext(*(void **)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2;
  v5[3] = &unk_1E522CD18;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  +[LSDatabaseRebuildContext withStatsGatherer:runWithRebuildContext:]((uint64_t)LSDatabaseRebuildContext, v3, v5);
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _LSServer_DatabaseExecutionContext();
  uint64_t v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  -[LSDBExecutionContext assertNotActiveForThisThread](v4);

  uint64_t v5 = _LSInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "calling into InstalledContentLibrary to register all content", buf, 2u);
  }

  *(void *)buf = 0;
  v39[0] = buf;
  v39[1] = 0x2020000000;
  char v40 = 1;
  uint64_t v6 = *(void *)(a1 + 32);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_924;
  v35[3] = &unk_1E522C240;
  v37 = buf;
  id v7 = v3;
  id v36 = v7;
  -[LSRebuildStatisticsGatherer performSystemContentScan:](v6, v35);
  uint64_t v8 = _LSInstallLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v31 = 0;
    _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "finished enumerating system content.", v31, 2u);
  }

  *(void *)long long v31 = 0;
  long long v32 = v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v9 = *(void *)(a1 + 32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_928;
  v30[3] = &unk_1E522C608;
  v30[4] = v31;
  -[LSRebuildStatisticsGatherer performSystemContentSave:](v9, v30);
  uint64_t v10 = *(void *)(a1 + 32);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_930;
  v28[3] = &unk_1E522C268;
  id v11 = v7;
  id v29 = v11;
  -[LSRebuildStatisticsGatherer performCryptexContentScan:](v10, v28);
  uint64_t v12 = _LSInstallLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v25 = 0;
    _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "Performing upcall to register containerized content.", v25, 2u);
  }

  *(void *)id v25 = 0;
  v26[0] = v25;
  v26[1] = 0x2020000000;
  char v27 = 1;
  v13 = _LSInstallLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v24 = 0;
    _os_log_impl(&dword_182959000, v13, OS_LOG_TYPE_DEFAULT, "finished enumerating system content. Performing upcall to register containerized content", v24, 2u);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_931;
  v21[3] = &unk_1E522C240;
  v23 = v25;
  id v15 = v11;
  id v22 = v15;
  -[LSRebuildStatisticsGatherer performContainerizedContentScan:](v14, v21);
  uint64_t v16 = -[LSDatabaseRebuildContext finishAndArmSaveTimer]((id *)v15);
  id v17 = (void *)v16;
  if (*(unsigned char *)(v26[0] + 24) && *(unsigned char *)(v39[0] + 24))
  {
    char v18 = 1;
  }
  else
  {
    if (v16)
    {
      v19 = _LSInstallLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_cold_2();
      }
    }
    CFURLRef v20 = _LSInstallLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_cold_1((uint64_t)v39, (uint64_t)v26, v20);
    }

    char v18 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v18;

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(buf, 8);
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_924(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F6F5A0] defaultWorkspace];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_926;
  v7[3] = &unk_1E522CD40;
  id v8 = *(id *)(a1 + 32);
  id v6 = 0;
  char v3 = [v2 enumerateBuiltInSystemContentWithBlock:v7 error:&v6];
  id v4 = v6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = _LSInstallLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_924_cold_1();
    }

    -[LSDatabaseRebuildContext noteRebuildError:](*(void *)(a1 + 32), v4);
  }
}

uint64_t ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_926(uint64_t a1, void *a2)
{
  return 1;
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_928(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__4;
  void v7[4] = __Block_byref_object_dispose__4;
  id v8 = 0;
  _LSServer_DatabaseExecutionContext();
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_929;
  v6[3] = &unk_1E522CD68;
  uint64_t v3 = *(void *)(a1 + 32);
  v6[4] = v7;
  v6[5] = v3;
  -[LSDBExecutionContext syncRead:](v2, v6);

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v4 = _LSInstallLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(id)__LSDefaultsGetSharedInstance() systemContentDatabaseStoreFileURL];
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Saved system content database to %@", buf, 0xCu);
    }
  }
  else
  {
    id v4 = _LSInstallLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_928_cold_1();
    }
  }

  _Block_object_dispose(v7, 8);
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_929(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v7 + 40);
  id v13 = 0;
  int inited = _LSContextInitReturningError(&v13, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (inited)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = *(id *)(v9 + 40);
    BOOL v10 = _LSDatabaseSaveSystemContentDatabase(v13, &v11);
    objc_storeStrong((id *)(v9 + 40), v11);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  }
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_930(uint64_t a1)
{
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_931(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F6F590]) initWithTargetUID:_CFGetEUID()];
  id v4 = [MEMORY[0x1E4F6F5A0] defaultWorkspace];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_933;
  v7[3] = &unk_1E522CD90;
  id v5 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v8 = v5;
  dispatch_semaphore_t v9 = v2;
  id v6 = v2;
  [v4 triggerRegistrationForContainerizedContentWithOptions:v3 completion:v7];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_933(uint64_t *a1, void *a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    -[LSDatabaseRebuildContext noteRebuildError:](a1[4], a2);
  }
  uint64_t v3 = a1[5];

  return dispatch_semaphore_signal(v3);
}

void ___LSServer_RebuildApplicationDatabases_block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = _LSDatabaseGetSeedingGroup();
  dispatch_group_enter(v2);

  uint64_t v3 = _LSServer_CopyLocalDatabase(0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(unsigned char *)(a1 + 56)
    || (uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) == 0
    || (-[_LSDatabase isSeeded](v6) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ___LSServer_RebuildApplicationDatabases_block_invoke_2;
    v12[3] = &unk_1E522CDE0;
    id v13 = *(id *)(a1 + 32);
    enumeratePlaceholderAndInstalledApplicationRecords(v12);
    uint64_t v7 = +[_LSInstallProgressService sharedInstance];
    id v8 = allAppexRecords();
    [v7 detachAndSendNotification:@"com.apple.LaunchServices.pluginswillberemoved" forApplicationExtensionRecords:v8];

    _LSResetServer();
    uint64_t v9 = _LSServer_CopyLocalDatabase(0);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    _LSDatabaseSessionSetSeedingInProgress(1);
    _LSDatabaseSessionSetSeedingDueToManualRebuild(*(unsigned char *)(a1 + 57) != 0);
  }
}

void ___LSServer_RebuildApplicationDatabases_block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 compatibilityObject];
  uint64_t v3 = +[_LSBundleIdentifierAndType createRepresentingProxy:](_LSBundleIdentifierAndType, "createRepresentingProxy:");
  if (v3) {
    [*(id *)(a1 + 32) setObject:v4 forKey:v3];
  }
}

void ___LSServer_RebuildApplicationDatabases_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v35 = a2;
  id v34 = a3;
  _LSDatabaseSessionSetSeedingDueToManualRebuild(0);
  _LSDatabaseSessionSetSeedingInProgress(0);
  -[_LSDatabase setSeeded:](*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), 1);
  -[_LSDatabase setSeedingComplete:](*(_LSDatabase **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(unsigned char *)(a1 + 80) != 0);
  _LSSaveImmediately(1);
  context = (void *)MEMORY[0x18530F680]();
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = +[_LSInstallProgressService sharedInstance];
  uint64_t v7 = allAppexRecords();
  [v6 detachAndSendNotification:@"com.apple.LaunchServices.pluginsregistered" forApplicationExtensionRecords:v7];

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = ___LSServer_RebuildApplicationDatabases_block_invoke_4;
  v48[3] = &unk_1E522CE30;
  id v8 = v5;
  id v49 = v8;
  id v50 = *(id *)(a1 + 32);
  id v51 = *(id *)(a1 + 40);
  id v52 = *(id *)(a1 + 48);
  enumeratePlaceholderAndInstalledApplicationRecords(v48);
  if ([*(id *)(a1 + 40) count])
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v45;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v45 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = (id)[*(id *)(*((void *)&v44 + 1) + 8 * v13++) plugInKitPlugins];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v11);
    }

    id v15 = +[_LSInstallProgressService sharedInstance];
    [v15 sendNotification:7 forAppProxies:*(void *)(a1 + 40) Plugins:0 completion:0];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v41;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v40 + 1) + 8 * v20);
        if (v21 && ([v8 containsObject:*(void *)(*((void *)&v40 + 1) + 8 * v20)] & 1) == 0)
        {
          id v22 = [*(id *)(a1 + 32) objectForKey:v21];
          [*(id *)(a1 + 56) addObject:v22];
          v23 = *(void **)(a1 + 64);
          id v24 = [v22 bundleIdentifier];
          [v23 addObject:v24];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v18);
  }

  if ([*(id *)(a1 + 56) count])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v25 = *(id *)(a1 + 56);
    uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v53 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v37;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = (id)[*(id *)(*((void *)&v36 + 1) + 8 * v29++) plugInKitPlugins];
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v53 count:16];
      }
      while (v27);
    }

    long long v31 = +[_LSInstallProgressService sharedInstance];
    [v31 sendNotification:8 forAppProxies:*(void *)(a1 + 56) Plugins:0 completion:0];
  }
  long long v32 = +[_LSInstallProgressService sharedInstance];
  [v32 sendDatabaseRebuiltNotification];
}

void ___LSServer_RebuildApplicationDatabases_block_invoke_4(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[_LSBundleIdentifierAndType createRepresentingRecord:v3];
  [*(id *)(a1 + 32) addObject:v4];
  id v5 = [*(id *)(a1 + 40) objectForKey:v4];
  uint64_t v6 = v5;
  if (!v5)
  {
LABEL_5:
    id v8 = *(void **)(a1 + 48);
    id v9 = [v3 compatibilityObject];
    [v8 addObject:v9];

    uint64_t v10 = *(void **)(a1 + 56);
    uint64_t v11 = [v3 bundleIdentifier];
    [v10 addObject:v11];

    goto LABEL_6;
  }
  int v7 = [v5 bundleModTime];
  if (v7 != [v3 _bundleModTime])
  {
    if ([v3 isPlaceholder] && (objc_msgSend(v6, "isPlaceholder") & 1) == 0)
    {
      uint64_t v12 = +[_LSInstallProgressService sharedInstance];
      uint64_t v13 = [v3 compatibilityObject];
      v15[0] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [v12 sendNotification:1 forAppProxies:v14 Plugins:0 completion:0];

      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:
}

void ___LSServer_SyncWithMobileInstallation_block_invoke(uint64_t a1)
{
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__4;
  v20[4] = __Block_byref_object_dispose__4;
  id v21 = [MEMORY[0x1E4F1CA80] set];
  id v3 = [(id)__LSDefaultsGetSharedInstance() dbRecoveryFileURL];
  _LSDatabaseCreateRecoveryFile(v3);

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  id v4 = _LSInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Will begin MobileInstallation item enumeration now", buf, 2u);
  }

  if (!MobileInstallationLibrary_frameworkLibrary)
  {
    MobileInstallationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MobileInstallation.framework/MobileInstallation", 2);
    if (!MobileInstallationLibrary_frameworkLibrary)
    {
      uint64_t v10 = _LSInstallLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        ___LSServer_SyncWithMobileInstallation_block_invoke_cold_1();
      }

      uint64_t v6 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 78, (uint64_t)"_LSServer_SyncWithMobileInstallation_block_invoke", 6168, 0);
      if (v6)
      {
        int v7 = 0;
        goto LABEL_7;
      }
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_2;
  v13[3] = &unk_1E522CEF8;
  v14[1] = &v16;
  v14[2] = v20;
  v14[0] = *(id *)(a1 + 32);
  v1 = (id *)v14;
  id v5 = (id)((uint64_t (*)(void *, void *))softLinkMobileInstallationEnumerateAllInstalledItemDictionaries[0])(0, v13);
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 1;
LABEL_7:
    *((unsigned char *)v17 + 24) = 0;
    goto LABEL_11;
  }
  if (*((unsigned char *)v17 + 24))
  {
    id v8 = _LSServer_DatabaseExecutionContext();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_5;
    v12[3] = &unk_1E522CED0;
    void v12[4] = v20;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v8, v12);
  }
  uint64_t v6 = 0;
  int v7 = 1;
LABEL_11:
  id v9 = _LSServer_DatabaseExecutionContext();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_6;
  v11[3] = &unk_1E522CED0;
  v11[4] = &v16;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v9, v11);

  _LSDatabaseClearSyncInterrupted();
  MEMORY[0x185310460]();
  atomic_fetch_and((atomic_uchar *volatile)&sMISyncFlag, 0x7Fu);
  if (v7) {

  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  int v7 = [v5 objectForKey:@"ApplicationType"];
  id v8 = [v5 objectForKey:*MEMORY[0x1E4F1CFF8]];
  if (([v7 isEqualToString:@"User"] & 1) != 0
    || ([v7 isEqualToString:@"System"] & 1) != 0
    || [v7 isEqualToString:@"VPNPlugin"])
  {
    id v37 = v6;
    id v9 = [v5 objectForKey:@"IsPlaceholder"];
    uint64_t v10 = [v9 BOOLValue];

    uint64_t v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v12 = [[_LSEnumeratedBundleInfo alloc] initWithBundleID:v8 isPlaceholder:v10];
    [v11 addObject:v12];

    id v13 = objc_alloc(MEMORY[0x1E4F1CB10]);
    id v14 = [v5 objectForKey:@"Path"];
    id v15 = (void *)[v13 initFileURLWithPath:v14 isDirectory:1];

    uint64_t v16 = [v5 objectForKey:@"ParallelPlaceholderPath"];
    if (v16) {
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v16 isDirectory:1];
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = a1[4];
    if (v18)
    {
      if (v15) {
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v15);
      }
      if (v17) {
        (*(void (**)(void))(a1[4] + 16))();
      }
    }
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__996;
    v62 = __Block_byref_object_dispose__997;
    id v63 = 0;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__996;
    uint64_t v56 = __Block_byref_object_dispose__997;
    id v57 = 0;
    _LSServer_DatabaseExecutionContext();
    char v19 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_998;
    v45[3] = &unk_1E522CE80;
    id v46 = v5;
    id v49 = &v58;
    id v20 = v15;
    id v47 = v20;
    id v21 = v17;
    uint64_t v22 = a1[6];
    id v48 = v21;
    uint64_t v50 = v22;
    id v51 = &v52;
    -[LSDBExecutionContext syncRead:](v19, v45);

    if (v59[5] || v53[5])
    {
      v23 = _LSServer_DatabaseExecutionContext();
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_2_999;
      v44[3] = &unk_1E522CD68;
      v44[4] = &v58;
      v44[5] = &v52;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v23, v44);
    }
    _Block_object_dispose(&v52, 8);

    _Block_object_dispose(&v58, 8);
    id v6 = v37;
  }
  else if (([v7 isEqualToString:@"CoreServices"] & 1) != 0 {
         || [v7 isEqualToString:@"Internal"])
  }
  {
    id v24 = *(void **)(*(void *)(a1[6] + 8) + 40);
    id v25 = [[_LSEnumeratedBundleInfo alloc] initWithBundleID:v8 isPlaceholder:0];
    [v24 addObject:v25];

    id v26 = objc_alloc(MEMORY[0x1E4F1CB10]);
    uint64_t v27 = [v5 objectForKey:@"Path"];
    uint64_t v28 = (void *)[v26 initFileURLWithPath:v27 isDirectory:1];

    uint64_t v29 = a1[4];
    if (v29 && v28) {
      (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v28);
    }
  }
  else if ([v7 isEqualToString:@"PluginKitPlugin"])
  {
    id v30 = objc_alloc(MEMORY[0x1E4F1CB10]);
    long long v31 = [v5 objectForKey:@"Path"];
    long long v32 = (void *)[v30 initFileURLWithPath:v31 isDirectory:1];

    uint64_t v33 = a1[4];
    if (v33 && v32) {
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v32);
    }
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__996;
    v62 = __Block_byref_object_dispose__997;
    id v63 = 0;
    _LSServer_DatabaseExecutionContext();
    id v34 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    void v39[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_3;
    v39[3] = &unk_1E522CEA8;
    long long v43 = &v58;
    id v40 = v8;
    id v35 = v32;
    id v41 = v35;
    id v42 = v5;
    -[LSDBExecutionContext syncRead:](v34, v39);

    if (v59[5])
    {
      long long v36 = _LSServer_DatabaseExecutionContext();
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_4;
      v38[3] = &unk_1E522CED0;
      v38[4] = &v58;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v36, v38);
    }
    _Block_object_dispose(&v58, 8);
  }
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_998(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v19 = 0;
  if (!_LSContextInit(&v19))
  {
    int v7 = (void *)MEMORY[0x18530F680]();
    id v8 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F1CFF8]];
    uint64_t v9 = _getBlockToUpdateBundleRecordFromMIAndNotifyIfChanged((uint64_t *)&v19, v8, *(void **)(a1 + 40), *(void **)(a1 + 32));
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (*(void *)(a1 + 48))
    {
      uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v13 = [[_LSEnumeratedBundleInfo alloc] initWithBundleID:v8 isPlaceholder:1];
      [v12 addObject:v13];

      id v14 = (void *)[*(id *)(a1 + 32) mutableCopy];
      [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsPlaceholder"];
      id v15 = [*(id *)(a1 + 48) path];
      [v14 setObject:v15 forKeyedSubscript:@"Path"];

      [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsParallelPlaceholder"];
      uint64_t v16 = _getBlockToUpdateBundleRecordFromMIAndNotifyIfChanged((uint64_t *)&v19, v8, *(void **)(a1 + 48), v14);
      uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
    _LSContextDestroy(&v19);
  }
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_2_999(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v27 = 0;
  if (!_LSContextInit(&v27))
  {
    context = (void *)MEMORY[0x18530F680]();
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    id v9 = *(id *)(a1 + 32);
    id v10 = v7;
    id v11 = v8;
    uint64_t v12 = _LSDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "Checking if %@ needs to be registered at %@", buf, 0x16u);
    }

    int v29 = 0;
    id v13 = [[FSNode alloc] initWithURL:v10 flags:0 error:0];
    if (v13)
    {
      uint64_t v14 = _LSPluginFindWithInfo(v27, 0, 0, 0, v13, &v29, 0);
      if (v14)
      {
        *(void *)buf = 0;
        id v28 = 0;
        BOOL v15 = -[FSNode getContentModificationDate:error:](v13, "getContentModificationDate:error:", buf, &v28, context);
        id v16 = v28;
        if (v15)
        {
          if (*(_DWORD *)(v14 + 24) >= (int)*(double *)buf)
          {
            uint64_t v22 = 0;
LABEL_21:
            uint64_t v23 = MEMORY[0x18530F950](v22);

            uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
            id v25 = *(void **)(v24 + 40);
            *(void *)(v24 + 40) = v23;

            _LSContextDestroy(&v27);
            goto LABEL_22;
          }
          int v17 = 1;
        }
        else
        {
          char v19 = _LSDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            ___LSServer_SyncWithMobileInstallation_block_invoke_3_cold_2((uint64_t)v9);
          }

          int v17 = 0;
        }
LABEL_16:
        id v20 = _LSDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = @"missing";
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          if (v17) {
            id v21 = @"stale";
          }
          *(void *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2112;
          long long v31 = v21;
          _os_log_impl(&dword_182959000, v20, OS_LOG_TYPE_DEFAULT, "Registering %@ (%@) because its record is %@", buf, 0x20u);
        }

        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = ___getBlockToUpdatePluginRecordFromMIAndNotifyIfChanged_block_invoke;
        long long v31 = (__CFString *)&unk_1E522CF78;
        id v32 = v10;
        id v33 = v9;
        id v34 = v11;
        uint64_t v22 = (void *)MEMORY[0x18530F950](buf);

        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v18 = _LSDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        ___LSServer_SyncWithMobileInstallation_block_invoke_3_cold_1();
      }
    }
    int v17 = 0;
    id v16 = 0;
    goto LABEL_16;
  }
LABEL_22:
}

uint64_t ___LSServer_SyncWithMobileInstallation_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v31 = a2;
  id v32 = a3;
  id v33 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v47 = 0;
  id v48 = (void **)&v47;
  uint64_t v49 = 0x3812000000;
  uint64_t v50 = __Block_byref_object_copy__1174;
  id v51 = __Block_byref_object_dispose__1175;
  uint64_t v52 = 256;
  id v53 = 0;
  if (!_LSContextInit(&v53))
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    id v42 = ___uninstallMIBundlesNotInSet_block_invoke;
    long long v43 = &unk_1E522D0D0;
    id v46 = &v47;
    id v44 = v33;
    id v45 = v5;
    _CSStoreEnumerateUnits();
    _LSContextDestroy(v48 + 6);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v59 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v37;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * v12);
        unsigned int v35 = 0;
        if (v13)
        {
          int v14 = *(unsigned __int8 *)(v13 + 24);
          id v15 = *(id *)(v13 + 16);
          if (v14) {
            unsigned int v16 = 1;
          }
          else {
            unsigned int v16 = 2;
          }
        }
        else
        {
          id v15 = 0;
          unsigned int v16 = 2;
        }
        BOOL v17 = _LSUnregisterAppWithBundleID(0, v15, v16, (int *)&v35, v6, v7, v8, v9) == 0;

        if (v17)
        {
          uint64_t v18 = _LSDefaultLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            if (v13)
            {
              id v22 = *(id *)(v13 + 16);
              id v23 = v22;
              if (*(unsigned char *)(v13 + 24)) {
                uint64_t v24 = @" (placeholder)";
              }
              else {
                uint64_t v24 = &stru_1ECB1A570;
              }
            }
            else
            {
              id v23 = 0;
              uint64_t v24 = &stru_1ECB1A570;
            }
            *(_DWORD *)buf = 138412546;
            id v56 = v23;
            __int16 v57 = 2112;
            uint64_t v58 = v24;
            _os_log_impl(&dword_182959000, v18, OS_LOG_TYPE_DEFAULT, "Unregistered %@%@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v18 = _LSDefaultLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            if (v13)
            {
              id v19 = *(id *)(v13 + 16);
              id v20 = v19;
              if (*(unsigned char *)(v13 + 24)) {
                id v21 = @" (placeholder)";
              }
              else {
                id v21 = &stru_1ECB1A570;
              }
            }
            else
            {
              id v20 = 0;
              id v21 = &stru_1ECB1A570;
            }
            *(_DWORD *)buf = 138412546;
            id v56 = v20;
            __int16 v57 = 2112;
            uint64_t v58 = v21;
            _os_log_error_impl(&dword_182959000, v18, OS_LOG_TYPE_ERROR, "Failed to unregister %@%@", buf, 0x16u);
          }
        }

        id v25 = +[_LSInstallProgressService sharedInstance];
        if (v13) {
          id v26 = *(void **)(v13 + 8);
        }
        else {
          id v26 = 0;
        }
        uint64_t v27 = v35;
        id v28 = v26;
        id v54 = v28;
        int v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
        [v25 sendNotification:v27 forAppProxies:v29 Plugins:0 completion:0];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v59 count:16];
      uint64_t v10 = v30;
    }
    while (v30);
  }

  _Block_object_dispose(&v47, 8);
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "MobileInstallation reported PartialResultsReturned = YES, setting incomplete seed flag", buf, 2u);
    }

    uint64_t v9 = 0;
    if (!_LSContextInit((id *)&v9)) {
      -[_LSDatabase setSeedingComplete:](v9, *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 0);
    }
  }
  _LSSaveImmediately(1);
  uint64_t v8 = [(id)__LSDefaultsGetSharedInstance() dbRecoveryFileURL];
  _LSDatabaseDeleteRecoveryFile(v8);
}

void ___LSServer_ExecuteSyncWithQuiescedInstallationActivity_block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = _LSDatabaseGetInstallingGroup();
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  id v3 = (void *)MEMORY[0x18530F680]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___LSServer_LSEnumerateAndRegisterAllCryptexContentWithContext_block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

void ___LSServer_DisplayRemovedAppPrompt_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v52 = v5;
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    id v56 = *(id *)(a1 + 32);
    id v55 = v6;
    id v53 = v7;
    uint64_t v9 = _LSDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v56;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v55;
      *(_WORD *)&buf[22] = 2048;
      v67 = v8;
      _os_log_impl(&dword_182959000, v9, OS_LOG_TYPE_DEFAULT, "Showing removed app prompt for %@ (%@), restore source %ld", buf, 0x20u);
    }

    id v54 = _LSGetAppRemovalPromptStringForKey(&cfstr_Restore_1.isa, &cfstr_AppRemovalProm.isa);
    if (v8 == (void *)1)
    {
      id v10 = v53;
      int v11 = [v55 isEqual:@"com.apple.AppStore"];
      BOOL v12 = v11 == 0;
      if (v11) {
        uint64_t v13 = @"“App Store” was deleted and needs to be restored.";
      }
      else {
        uint64_t v13 = @"“App Store” was deleted and needs to be restored before you can download this app.";
      }
      if (v12) {
        int v14 = @"APP_REMOVAL_PROMPT_DETAIL_APP_STORE_DELETED";
      }
      else {
        int v14 = @"APP_REMOVAL_PROMPT_DETAIL_APP_STORE_DELETED_SELF";
      }
      id v15 = _LSGetAppRemovalPromptStringForKey(&v13->isa, &v14->isa);
      if (![(id)__LSDefaultsGetSharedInstance() isAppleInternal]
        || (_os_feature_enabled_impl() & 1) != 0)
      {
        unsigned int v16 = v15;
        goto LABEL_17;
      }
      uint64_t v18 = [v15 stringByAppendingString:@"\n\n[Apple Internal Engineering Note]\nFeature flags configuration indicates 135298349 is not complete. Therefore you will be brought to Settings instead of automatically kicking off the restore."];
    }
    else
    {
      id v10 = v56;
      id v15 = _LSGetAppRemovalPromptStringForKey(&cfstr_ToContinueDown.isa, &cfstr_AppRemovalProm_2.isa);
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", v15, v10);
    }
    unsigned int v16 = (void *)v18;

LABEL_17:
    id v19 = objc_msgSend(NSString, "stringWithFormat:", v54, v10);
    CFOptionFlags v20 = *MEMORY[0x1E4F1D9A8];
    responseFlags[0] = *MEMORY[0x1E4F1D990];
    responseFlags[1] = v20;
    *(void *)buf = v19;
    *(void *)&uint8_t buf[8] = v16;
    responseFlags[2] = *MEMORY[0x1E4F1D9B8];
    responseFlags[3] = (CFOptionFlags)@"SBUserNotificationDontDismissOnUnlock";
    *(void *)&uint8_t buf[16] = MEMORY[0x1E4F1CC28];
    v67 = (void *)MEMORY[0x1E4F1CC38];
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:responseFlags count:4];
    id v22 = _LSGetAppRemovalPromptStringForKey(&cfstr_Cancel.isa, &cfstr_CancelButton.isa);
    if (v8 == (void *)1)
    {
      id v23 = _LSGetAppRemovalPromptStringForKey(&cfstr_RestoreNow.isa, &cfstr_RestoreAppButt.isa);
      uint64_t v24 = (void *)[v21 mutableCopy];
      uint64_t v25 = *MEMORY[0x1E4F1D9D0];
      uint64_t v61 = *MEMORY[0x1E4F1D9E0];
      uint64_t v62 = v25;
      id v63 = v23;
      v64 = v22;
      id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v61 count:2];
      [v24 addEntriesFromDictionary:v26];
    }
    else
    {
      if (v8) {
        goto LABEL_22;
      }
      id v23 = _LSGetAppRemovalPromptStringForKey(&cfstr_ShowInAppStore.isa, &cfstr_ShowInStoreBut.isa);
      uint64_t v24 = (void *)[v21 mutableCopy];
      uint64_t v27 = *MEMORY[0x1E4F1D9D0];
      uint64_t v61 = *MEMORY[0x1E4F1D9E0];
      uint64_t v62 = v27;
      id v63 = v23;
      v64 = v22;
      id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v61 count:2];
      [v24 addEntriesFromDictionary:v26];
    }

    id v21 = v24;
LABEL_22:
    SInt32 error = -1;
    CFUserNotificationRef v28 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, &error, (CFDictionaryRef)v21);
    CFUserNotificationRef v29 = v28;
    if (v28)
    {
      if (!error)
      {
        id v33 = (__CFUserNotification *)CFRetain(v28);
        id v32 = 0;
        char v34 = 0;
LABEL_27:

        if ((v34 & 1) == 0) {
          CFRelease(v29);
        }

        id v35 = v32;
        if (!v33)
        {
          (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_39:

          BOOL v17 = v52;
          goto LABEL_40;
        }
        long long v36 = *(void **)(a1 + 72);
        uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        id v38 = *(id *)(a1 + 56);
        long long v39 = v36;
        responseFlags[0] = 0;
        id v57 = v35;
        _LSServer_DatabaseExecutionContext();
        uint64_t v40 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
        -[LSDBExecutionContext assertNotActiveForThisThread](v40);

        SInt32 v41 = CFUserNotificationReceiveResponse(v33, 0.0, responseFlags);
        if (v41)
        {
          id v63 = (void *)*MEMORY[0x1E4F28228];
          *(void *)buf = @"CFUserNotificationReceiveResponse() failed.";
          id v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v63 count:1];
          long long v43 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F285A8], v41, (uint64_t)"_LSDisplayRemovedAppPrompt", 320, v42);
          v39[2](v39, 0, v43);
        }
        else
        {
          if ((responseFlags[0] & 3) != 0)
          {
            id v44 = _LSDefaultLog();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              *(void *)&uint8_t buf[4] = v38;
              _os_log_impl(&dword_182959000, v44, OS_LOG_TYPE_DEFAULT, "User cancelled restoring system app %{private}@", buf, 0xCu);
            }

            v39[2](v39, 1, 0);
            goto LABEL_38;
          }
          if (v37 == 1)
          {
            if (_os_feature_enabled_impl())
            {
              uint64_t v50 = [MEMORY[0x1E4F1CB10] URLWithString:@"appstore-ui://restoreAppStore"];
              uint64_t v49 = @"com.apple.ios.StoreKitUIService";
            }
            else
            {
              uint64_t v50 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.AppInstallation/#ADRestoreAppStore"];
              uint64_t v49 = @"com.apple.Preferences";
            }
            id v48 = (void *)v50;
          }
          else
          {
            if (v37) {
              goto LABEL_38;
            }
            id v45 = objc_alloc_init(MEMORY[0x1E4F29088]);
            [v45 setScheme:@"itms-apps"];
            [v45 setHost:&stru_1ECB1A570];
            id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v47 = [MEMORY[0x1E4F290C8] queryItemWithName:@"bundleIdentifier" value:v38];
            [v46 addObject:v47];

            [v45 setQueryItems:v46];
            id v48 = [v45 URL];

            uint64_t v49 = @"com.apple.AppStore";
          }
          if (!v48) {
            goto LABEL_38;
          }
          _LSServer_DatabaseExecutionContext();
          id v51 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&uint8_t buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = ___ZL26_LSDisplayRemovedAppPromptP20__CFUserNotificationP8NSStringP5NSURL18LSAppRestoreSourceU13block_pointerFvbP7NSErrorE_block_invoke;
          v67 = &unk_1E522D300;
          v68 = v49;
          id v69 = v48;
          v70 = v39;
          id v42 = v48;
          -[LSDBExecutionContext syncRead:](v51, buf);

          long long v43 = v68;
        }

LABEL_38:
        CFRelease(v33);
        id v35 = v57;
        goto LABEL_39;
      }
      CFRelease(v28);
    }
    uint64_t v30 = error;
    uint64_t v59 = *MEMORY[0x1E4F28228];
    uint64_t v60 = @"CFUserNotificationCreate() failed.";
    id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F285A8], v30, (uint64_t)"_LSCreateRemovedAppPrompt", 241, v31);
    id v32 = (id)objc_claimAutoreleasedReturnValue();

    CFUserNotificationRef v29 = 0;
    id v33 = 0;
    char v34 = 1;
    goto LABEL_27;
  }
  BOOL v17 = v5;
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_40:
}

void ___LSServer_BeginProvidingVisualizationArchives_block_invoke()
{
  dispatch_semaphore_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.lsd.internal.store-visualizations", v2);
  v1 = (void *)_LSServer_BeginProvidingVisualizationArchives::visualizationQueue;
  _LSServer_BeginProvidingVisualizationArchives::visualizationQueue = (uint64_t)v0;
}

id ___LSServer_BeginProvidingVisualizationArchives_block_invoke_2()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__50;
  uint64_t v8 = __Block_byref_object_dispose__51;
  id v9 = 0;
  _LSServer_DatabaseExecutionContext();
  dispatch_queue_t v0 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___LSServer_BeginProvidingVisualizationArchives_block_invoke_52;
  v3[3] = &unk_1E522E6A0;
  v3[4] = &v4;
  -[LSDBExecutionContext syncRead:](v0, v3);

  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

void ___LSServer_BeginProvidingVisualizationArchives_block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v18 = 0;
  id v15 = 0;
  id v16 = 0;
  char v17 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (uint64_t *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v15, v6, 0);

  if (v7)
  {
    MutableCopy = (const void *)CSStoreCreateMutableCopy();
    if (MutableCopy)
    {
      id v9 = _LSDatabaseGetNode(*v7);
      uint64_t SessionKey = _LSDatabaseGetSessionKey(*v7);
      int v11 = _LSDatabaseCreateWithAccessContext(v9, SessionKey, MutableCopy, 0, 0);

      if (v11)
      {
        int v14 = v11;
        _LSContextCreateVisualizer((uint64_t)&v14);
      }

      CFRelease(MutableCopy);
    }
  }
  if (v15 && v17) {
    _LSContextDestroy(v15);
  }
  id v12 = v16;
  id v15 = 0;
  id v16 = 0;

  char v17 = 0;
  id v13 = v18;
  id v18 = 0;
}

void ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = _LSDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke_cold_1(v2);
  }

  _LSServer_RebuildApplicationDatabases(1, 1, 1, 1, 0);
  id v3 = _LSServer_DatabaseExecutionContext();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke_2;
  v4[3] = &unk_1E522BB38;
  id v5 = *(id *)(a1 + 32);
  -[LSDBExecutionContext syncWrite:]((uint64_t)v3, v4);
}

void ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke_2()
{
}

void ___LSServer_PerformOpenOperation_block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "LaunchServices: [Perform] not launching application - result = %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  MEMORY[0x185310460](v7);
}

void ___LSServer_PerformOpenOperation_block_invoke_74(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v58 = *(id *)(a1 + 32);
  dispatch_semaphore_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  id v5 = [v4 objectForKeyedSubscript:getFBSOpenApplicationOptionKeyPayloadURL()];
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 isEqual:v3])
    {
      id v57 = (void *)[v4 mutableCopy];
      [v57 removeObjectForKey:getFBSOpenApplicationOptionKeyPayloadURL()];

      char v7 = 0;
      id v8 = 0;
      goto LABEL_9;
    }
    id v9 = _LSDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ___LSServer_PerformOpenOperation_block_invoke_74_cold_1();
    }

    id v74 = (id)*MEMORY[0x1E4F28228];
    *(void *)&long long buf = @"FBSOpenApplicationOptionKeyPayloadURL did not match input URL, making the open request ambiguous";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v74 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"_LSOpenOperationMassageOpenOptionsOrFail", 217, v10);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    char v7 = 1;
  }
  else
  {
    char v7 = 0;
    id v8 = 0;
  }
  id v57 = v4;
LABEL_9:

  id v11 = v8;
  if (v7)
  {
    id v12 = v11;
    goto LABEL_54;
  }
  id v55 = v11;
  id v13 = *(void **)(a1 + 40);
  int v14 = *(unsigned __int8 *)(a1 + 136);
  id v15 = *(id *)(a1 + 56);
  id v16 = v13;
  long long v17 = *(_OWORD *)(a1 + 120);
  long long buf = *(_OWORD *)(a1 + 104);
  long long v76 = v17;
  id v56 = v16;
  if (![v16 isFileURL])
  {
    id v21 = 0;
    id v19 = 0;
    int v23 = 1;
    id v54 = v58;
LABEL_48:
    id v36 = v55;
    goto LABEL_50;
  }
  id v18 = [v56 path];
  id v19 = [v18 lastPathComponent];

  CFOptionFlags v20 = +[LSDocumentProxy documentProxyForURL:v56 isContentManaged:v14 != 0 sourceAuditToken:&buf];
  id v74 = 0;
  id v52 = v20;
  id v53 = [v20 applicationsAvailableForOpeningWithStyle:2 limit:-1 XPCConnection:v15 error:&v74];
  id v21 = v74;
  if (v58 && [v58 length])
  {
    +[LSApplicationProxy applicationProxyForIdentifier:v58];
    id v22 = v54 = v58;
  }
  else
  {
    if (!v53 || ![v53 count])
    {
      id v22 = 0;
      id v54 = v58;
      goto LABEL_24;
    }
    uint64_t v24 = [v53 objectAtIndex:0];
    id v54 = [v24 bundleIdentifier];
    id v22 = v24;
  }
  if (v53 && v22 && ([v53 containsObject:v22] & 1) != 0)
  {
    char v25 = 1;
    goto LABEL_41;
  }
LABEL_24:
  id v26 = [v19 pathExtension];
  id v51 = v26;
  if (v26 && (objc_msgSend(v26, "isEqualToString:", @"zip", v26) & 1) != 0)
  {
    uint64_t v27 = [v19 stringByDeletingPathExtension];
    CFUserNotificationRef v28 = [v27 pathExtension];
    BOOL v29 = [v28 length] == 0;

    if (!v29)
    {
      id v30 = v27;

      id v19 = v30;
      id v31 = +[LSDocumentProxy documentProxyForName:v30 type:0 MIMEType:0 isContentManaged:v14 != 0 sourceAuditToken:&buf];

      id v73 = v21;
      id v52 = v31;
      id v32 = [v31 applicationsAvailableForOpeningWithStyle:2 limit:-1 XPCConnection:v15 error:&v73];
      id v33 = v73;

      id v21 = v33;
      id v53 = v32;
      if (v22 || !v32)
      {
        if (!v32) {
          goto LABEL_38;
        }
      }
      else if ([v32 count])
      {
        char v34 = [v32 objectAtIndex:0];
        id v54 = [v34 bundleIdentifier];
        id v22 = v34;
      }
      else
      {
        id v22 = 0;
      }
      if ([v53 containsObject:v22])
      {
        char v25 = 1;
LABEL_39:
        uint64_t v27 = v19;
        goto LABEL_40;
      }
LABEL_38:
      char v25 = 0;
      goto LABEL_39;
    }
    char v25 = 0;
  }
  else
  {
    char v25 = 0;
    uint64_t v27 = 0;
  }
LABEL_40:

LABEL_41:
  if (v21) {
    char v35 = 1;
  }
  else {
    char v35 = v25;
  }
  if ((v35 & 1) == 0)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"_LSIsRequestValid", 740, 0);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v25)
  {
    int v23 = 1;
    goto LABEL_48;
  }
  id v36 = v21;
  int v23 = 0;
  id v21 = v36;
LABEL_50:

  id v37 = v54;
  id v12 = v36;

  if (v23)
  {
    id v38 = *(void **)(a1 + 40);
    long long v39 = *(void **)(a1 + 56);
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3321888768;
    uint64_t v60 = ___LSServer_PerformOpenOperation_block_invoke_2;
    uint64_t v61 = &unk_1ECB17748;
    id v69 = *(id *)(a1 + 96);
    id v62 = *(id *)(a1 + 40);
    id v63 = *(id *)(a1 + 64);
    id v40 = v37;
    id v64 = v40;
    BOOL v72 = v58 != 0;
    id v65 = *(id *)(a1 + 72);
    id v66 = *(id *)(a1 + 80);
    id v70 = v57;
    char v71 = 1;
    id v67 = *(id *)(a1 + 88);
    id v68 = *(id *)(a1 + 56);
    id v41 = v38;
    id v42 = v70;
    id v43 = v39;
    id v44 = v59;
    id v45 = v44;
    id v58 = v40;
    if (v40)
    {
      ((void (*)(void *, void))v60)(v44, 0);
LABEL_67:

      if (v71) {
      goto LABEL_70;
      }
    }
    uint64_t v47 = objc_opt_class();
    uint64_t v48 = [v42 objectForKey:@"NoOverrides"];
    uint64_t v49 = (void *)v48;
    if (v47 && v48)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        uint64_t v49 = 0;
        goto LABEL_65;
      }
    }
    else if (!v48)
    {
      goto LABEL_65;
    }
    if (objc_msgSend(v49, "BOOLValue", v51))
    {
      ((void (*)(void *, void))v60)(v45, 0);
LABEL_66:

      goto LABEL_67;
    }
LABEL_65:
    uint64_t v50 = +[LSAppLink _dispatchQueue];
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    *(void *)&long long v76 = ___ZL19_LSTryUniversalLinkP5NSURLP8NSStringP12NSDictionaryIS2_P11objc_objectEP15NSXPCConnectionU13block_pointerFvbE_block_invoke;
    *((void *)&v76 + 1) = &unk_1E522FEC0;
    id v77 = v41;
    id v78 = v43;
    id v79 = v42;
    id v80 = v45;
    dispatch_async(v50, &buf);

    goto LABEL_66;
  }
  id v58 = v37;
LABEL_54:
  id v46 = _LSDefaultLog();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_182959000, v46, OS_LOG_TYPE_DEFAULT, "Invalid LSOpenOperation request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  if ((v7 & 1) == 0) {
LABEL_70:
  }
}

void ___LSServer_PerformOpenOperation_block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  if (a2)
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 88) + 16);
    v10();
  }
  else if (*(unsigned char *)(a1 + 104))
  {
    _LSOpenOperationPerform(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 112), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 96), *(void **)(a1 + 72), *(void **)(a1 + 80), *(void **)(a1 + 88));
  }
  else
  {
    std::__throw_bad_optional_access[abi:nn180100]();
    _LSOpenOperationPerform(v11, v12, v13, v14, v15, v16, v17, v18, a9, a10);
  }
}

void ___LSServer_OpenUserActivity_block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  if (v2 || *(void *)(a1 + 40))
  {
    id v3 = *(void **)(a1 + 48);
    if (v3)
    {
      if (*(void *)(a1 + 56))
      {
        id v4 = *(void **)(a1 + 40);
        unint64_t v5 = v2;
        unint64_t v6 = v4;
        id v7 = v3;
        if (UIKitLibrary(void)::frameworkLibrary
          || (UIKitLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2)) != 0)
        {
          if (!(v5 | v6))
          {
            uint64_t v23 = *MEMORY[0x1E4F28228];
            v24[0] = @"invalid input parameters";
            id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
            int v14 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"_LSGetBSActionForUserActivity", 1294, v13);

            goto LABEL_21;
          }
          id v8 = [MEMORY[0x1E4F1CA60] dictionary];
          id v9 = v8;
          if (v8)
          {
            if (v6)
            {
              [v8 setObject:v6 forKeyedSubscript:&unk_1ECB43948];
            }
            else
            {
              id v16 = [(id)v5 UUIDString];
              [v9 setObject:v16 forKeyedSubscript:&unk_1ECB43960];
            }
            [v9 setObject:v7 forKeyedSubscript:&unk_1ECB43978];
            [v9 setObject:v7 forKeyedSubscript:&unk_1ECB43990];
            long long v17 = [MEMORY[0x1E4F1C9C8] date];
            [v9 setObject:v17 forKeyedSubscript:&unk_1ECB439A8];

            id v12 = (void *)[objc_alloc((Class)getUIActivityContinuationActionClass()) initWithSettings:v9];
            if (v12)
            {

              char v18 = 0;
              id v19 = 0;
              goto LABEL_22;
            }
            int v14 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10810, (uint64_t)"_LSGetBSActionForUserActivity", 1286, 0);

LABEL_21:
            id v19 = v14;

            id v12 = 0;
            char v18 = 1;
LABEL_22:

            id v11 = v19;
            if (v18)
            {
              uint64_t v20 = *(void *)(a1 + 96);
              if (v20) {
                (*(void (**)(uint64_t, void, id))(v20 + 16))(v20, 0, v11);
              }
            }
            else
            {
              _LSServer_OpenApplicationCommon(*(void **)(a1 + 56), v12, *(unsigned __int8 *)(a1 + 104), *(void **)(a1 + 64), *(void **)(a1 + 72), *(void **)(a1 + 80), 5uLL, *(void **)(a1 + 88), *(void **)(a1 + 96));
            }
            goto LABEL_26;
          }
          uint64_t v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -41, (uint64_t)"_LSGetBSActionForUserActivity", 1290, 0);
        }
        else
        {
          uint64_t v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"_LSGetBSActionForUserActivity", 1298, 0);
        }
        int v14 = (void *)v15;
        goto LABEL_21;
      }
    }
  }
  uint64_t v10 = *(void *)(a1 + 96);
  if (!v10) {
    return;
  }
  uint64_t v21 = *MEMORY[0x1E4F28228];
  id v22 = @"invalid input parameters";
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v12 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"_LSServer_OpenUserActivity_block_invoke", 324, v11);
  (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v12);
LABEL_26:
}

void ___LSServer_GetIOQueue_block_invoke()
{
  dispatch_semaphore_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.lsd.registrationIO", v2);
  id v1 = (void *)_LSServer_GetIOQueue::result;
  _LSServer_GetIOQueue::result = (uint64_t)v0;
}

void ___LSServer_GetAsyncWorkQueue_block_invoke()
{
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    dispatch_semaphore_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v0 = dispatch_queue_create("com.apple.lsd.server.asyncwork", v2);
    id v1 = (void *)_LSServer_GetAsyncWorkQueue::result;
    _LSServer_GetAsyncWorkQueue::result = (uint64_t)v0;
  }
}

void ___LSServer_RegisterItemInfo_block_invoke(uint64_t a1)
{
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  name = [*(id *)(a1 + 32) name];
  CFDictionaryRef v3 = [*(id *)(a1 + 32) userInfo];
  CFNotificationCenterPostNotification(DistributedCenter, name, 0, v3, 1u);
}

void ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "couldn't connect to database when refreshing plugins: %@", v2, v3, v4, v5, v6);
}

void ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "couldn't remove stale framework bundles: %@", v2, v3, v4, v5, v6);
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = *(unsigned char *)(*(void *)a1 + 24) == 0;
  BOOL v4 = *(unsigned char *)(*(void *)a2 + 24) == 0;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  BOOL v7 = v4;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "ICL error, enumerating system (%d) or other (%d) content", (uint8_t *)v5, 0xEu);
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "failed to enumerate: %@", v2, v3, v4, v5, v6);
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_924_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "error enumerating system content! %@", v2, v3, v4, v5, v6);
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_928_cold_1()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_4_0(&dword_182959000, v0, v1, "could not write out system content database! %@", v2, v3, v4, v5, v6);
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19(&dword_182959000, v0, v1, "MobileInstallation framework is not available! Enumeration will fail.", v2, v3, v4, v5, v6);
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_3_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  __int16 v2 = 2114;
  uint64_t v3 = 0;
  _os_log_error_impl(&dword_182959000, v0, OS_LOG_TYPE_ERROR, "Couldn't determine if record for %{private}@ needed to be updated, failed to create FSNode for %{private}@: %{public}@", v1, 0x20u);
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_3_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138478083;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v1, v2, "Couldn't get mod date for bundle %{private}@, so forcing update: %{public}@", (void)v3, DWORD2(v3));
}

void ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Local database is invalid, rebuilding.", v1, 2u);
}

void ___LSServer_PerformOpenOperation_block_invoke_74_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Caller specified open of URL %@ but also specified URL %@ in launch options, which are not the same URL!");
}

@end