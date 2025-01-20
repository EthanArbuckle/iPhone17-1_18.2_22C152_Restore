@interface LSDModifyClient
@end

@implementation LSDModifyClient

uint64_t __58___LSDModifyClient_setDatabaseIsSeeded_completionHandler___block_invoke(uint64_t a1)
{
  _LSServer_SetDatabaseIsSeeded(*(unsigned __int8 *)(a1 + 40));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t __104___LSDModifyClient_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler___block_invoke(uint64_t a1)
{
  v44[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if ([*(id *)(a1 + 40) canRegisterURL:*(void *)(a1 + 48) withOptions:*(unsigned int *)(v2 + 16)])
    {
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      int v42 = 0;
      v3 = (void *)[*(id *)(a1 + 32) mutableCopy];
      id v4 = *(id *)(a1 + 48);
      id v5 = *(id *)(a1 + 56);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = *(void **)(a1 + 64);
      }
      else {
        v6 = 0;
      }
      v17 = v6;
      CFTypeRef cf = 0;
      v18 = _LSCreateRegistrationData(0, v3, v4, v17, (const __CFArray **)&cf);
      MEMORY[0x185310450](v18);
      v19 = _LSServer_DatabaseExecutionContext();
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3321888768;
      v27[2] = __104___LSDModifyClient_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler___block_invoke_2;
      v27[3] = &unk_1ECB17780;
      v37 = v41;
      id v20 = v3;
      id v28 = v20;
      id v21 = v5;
      id v29 = v21;
      v22 = v18;
      v30 = v22;
      v23 = v17;
      v31 = v23;
      id v24 = v4;
      uint64_t v25 = *(void *)(a1 + 40);
      id v32 = v24;
      uint64_t v33 = v25;
      id v34 = *(id *)(a1 + 72);
      id v36 = *(id *)(a1 + 80);
      char v39 = 0;
      id v35 = *(id *)(a1 + 32);
      CFTypeRef v38 = cf;
      if (cf) {
        CFRetain(cf);
      }
      -[LSDBExecutionContext performAsyncWrite:]((uint64_t)v19, v27);

      if (v38) {
        CFRelease(v38);
      }
      CFTypeRef v38 = 0;

      if (cf) {
        CFRelease(cf);
      }

      _Block_object_dispose(v41, 8);
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 80);
      v16 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10819, (uint64_t)"-[_LSDModifyClient registerItemInfo:alias:diskImageAlias:bundleURL:installationPlist:completionHandler:]_block_invoke", 415, 0);
      (*(void (**)(uint64_t, void, void, void, void, void *))(v15 + 16))(v15, 0, 0, 0, 0, v16);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v43 = *MEMORY[0x1E4F28228];
    v44[0] = @"invalid LSRegistrationInfo";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    v9 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient registerItemInfo:alias:diskImageAlias:bundleURL:installationPlist:completionHandler:]_block_invoke", 412, v8);
    (*(void (**)(uint64_t, void, void, void, void, void *))(v7 + 16))(v7, 0, 0, 0, 0, v9);
  }
  return MEMORY[0x185310460](v10, v11, v12, v13, v14);
}

void __104___LSDModifyClient_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  CFTypeRef cf = 0;
  uint64_t v27 = 0;
  char v25 = 0;
  int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
  if (v7) {
    goto LABEL_2;
  }
  v18 = *(void **)(a1 + 32);
  v19 = *(void **)(a1 + 40);
  id v20 = *(void **)(a1 + 48);
  CFDictionaryRef v21 = *(const __CFDictionary **)(a1 + 56);
  CFTypeRef cf = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = _LSServer_RegisterItemInfo(v18, v19, v20, v21, (int *)&v27, (uint64_t)&v27 + 4, &v25, &cf);
  if (cf)
  {
    v22 = +[_LSCanOpenURLManager sharedManager];
    [v22 resetSchemeQueryLimitForApplicationWithIdentifier:cf];
  }
  int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
  if (!v7)
  {
    _LSArmSaveTimer(5);
    int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
LABEL_20:
    if (!v7)
    {
      v8 = 0;
      goto LABEL_3;
    }
LABEL_2:
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v7, (uint64_t)"-[_LSDModifyClient registerItemInfo:alias:diskImageAlias:bundleURL:installationPlist:completionHandler:]_block_invoke", 499, 0);
    v8 = (_DWORD *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v9 = (unsigned int *)&v27 + 1;
    if (!*(unsigned char *)(a1 + 120)) {
      v9 = (unsigned int *)&v27;
    }
    uint64_t v10 = *v9;
    uint64_t v11 = _LSDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 64) filePathURL];
      uint64_t v13 = *(int *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
      uint64_t v14 = *(unsigned int *)(*(void *)(a1 + 88) + 28);
      uint64_t v15 = [*(id *)(a1 + 72) XPCConnection];
      int v16 = [v15 processIdentifier];
      *(_DWORD *)buf = 138413314;
      id v29 = v12;
      __int16 v30 = 2048;
      uint64_t v31 = v13;
      __int16 v32 = 2048;
      uint64_t v33 = v14;
      __int16 v34 = 2048;
      uint64_t v35 = v10;
      __int16 v36 = 1024;
      int v37 = v16;
      _os_log_impl(&dword_182959000, v11, OS_LOG_TYPE_DEFAULT, "registered %@ (status %ld, old id 0x%llx) as unit 0x%llx on behalf of pid %d", buf, 0x30u);
    }
    uint64_t v17 = (*(uint64_t (**)(void, BOOL, uint64_t, void, BOOL, _DWORD *))(*(void *)(a1 + 96) + 16))(*(void *)(a1 + 96), *(_DWORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) == 0, v10, *(void *)(a1 + 112), v25 != 0, v8);
    MEMORY[0x185310460](v17);
    goto LABEL_8;
  }
  if (v7 != -10675) {
    goto LABEL_20;
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 16) & 2) != 0)
  {
    int v7 = -10675;
    goto LABEL_2;
  }
  v23 = _LSInstallLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = *(void **)(a1 + 64);
    *(_DWORD *)buf = 138412290;
    id v29 = v24;
    _os_log_impl(&dword_182959000, v23, OS_LOG_TYPE_DEFAULT, "Retrying registration of %@ with trusted bit", buf, 0xCu);
  }

  v8 = (_DWORD *)[*(id *)(a1 + 32) mutableCopy];
  v8[4] |= 2u;
  [*(id *)(a1 + 72) registerItemInfo:v8 alias:*(void *)(a1 + 40) diskImageAlias:*(void *)(a1 + 80) bundleURL:*(void *)(a1 + 64) installationPlist:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 96)];
LABEL_8:

  if (cf) {
    CFRelease(cf);
  }
}

void __67___LSDModifyClient_unregisterBundleUnit_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _LSDatabaseSentinelDecrement();
}

void __67___LSDModifyClient_unregisterBundleUnit_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v20 = 0;
  uint64_t v17 = 0;
  id v18 = 0;
  char v19 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  int v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = (_LSDatabase **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v17, v7, 0);

  if (!v8)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v17, v13, 0);

    if (v14) {
      id v11 = 0;
    }
    else {
      id v11 = v20;
    }
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v11);
    goto LABEL_9;
  }
  int v9 = _LSUnregisterBundle(v8, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
  uint64_t v10 = *(void *)(a1 + 32);
  if (v9)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v9, (uint64_t)"-[_LSDModifyClient unregisterBundleUnit:options:completionHandler:]_block_invoke_2", 589, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v11);
LABEL_9:

    goto LABEL_10;
  }
  (*(void (**)(uint64_t, uint64_t, void))(v10 + 16))(v10, 1, 0);
LABEL_10:
  if (v17 && v19) {
    _LSContextDestroy(v17);
  }
  id v15 = v18;
  uint64_t v17 = 0;
  id v18 = 0;

  char v19 = 0;
  id v16 = v20;
  id v20 = 0;
}

void __59___LSDModifyClient_registerContainerURL_completionHandler___block_invoke(uint64_t a1)
{
  id v5 = 0;
  int v2 = FSNodeCreateWithURL(*(void *)(a1 + 32), 1, &v5);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v2, (uint64_t)"-[_LSDModifyClient registerContainerURL:completionHandler:]_block_invoke", 623, 0);
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
  else
  {
    _LSContainerAddWithNode(0, v5, 0, *(void **)(a1 + 40));
  }
  MEMORY[0x185310460]();
}

void __58___LSDModifyClient_updateContainerUnit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v21 = 0;
  id v18 = 0;
  id v19 = 0;
  char v20 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  int v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v18, v7, 0);

  if (v8)
  {
    int v9 = _LSUpdateContainerState(*v8, *(unsigned int *)(a1 + 40), (uint64_t)v17);
    uint64_t v10 = *(void *)(a1 + 32);
    if (v9)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v9, (uint64_t)"-[_LSDModifyClient updateContainerUnit:completionHandler:]_block_invoke", 660, 0);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v11);
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v17 length:20];
      (*(void (**)(uint64_t, id, void))(v10 + 16))(v10, v11, 0);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v18, v13, 0);

    if (v14) {
      id v11 = 0;
    }
    else {
      id v11 = v21;
    }
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v11);
  }

  if (v18 && v20) {
    _LSContextDestroy(v18);
  }
  id v15 = v19;
  id v18 = 0;
  id v19 = 0;

  char v20 = 0;
  id v16 = v21;
  id v21 = 0;
}

void __92___LSDModifyClient_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = _LSRegisterExtensionPoint(0, 0, *(__CFString **)(a1 + 32), *(unsigned int *)(a1 + 64), *(const __CFDictionary **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 56);
  if (v2)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v2, (uint64_t)"-[_LSDModifyClient registerExtensionPoint:platform:declaringURL:withInfo:completionHandler:]_block_invoke", 697, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  else
  {
    id v4 = *(void (**)(uint64_t, uint64_t, void))(v3 + 16);
    v4(v3, 1, 0);
  }
}

void __101___LSDModifyClient_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = _LSUnregisterExtensionPoint(0, *(const __CFString **)(a1 + 32), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(__CFString **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v2, (uint64_t)"-[_LSDModifyClient unregisterExtensionPoint:platform:withVersion:parentBundleUnit:completionHandler:]_block_invoke", 716, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  else
  {
    id v4 = *(void (**)(uint64_t, uint64_t, void))(v3 + 16);
    v4(v3, 1, 0);
  }
}

void __78___LSDModifyClient_setHandler_version_roles_forContentType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v9 = -10822;
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) XPCConnection];
  id v4 = [v3 _xpcConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78___LSDModifyClient_setHandler_version_roles_forContentType_completionHandler___block_invoke_2;
  v10[3] = &unk_1E522EDA0;
  id v11 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  long long v15 = *(_OWORD *)(a1 + 68);
  long long v16 = *(_OWORD *)(a1 + 84);
  uint64_t v6 = *(void *)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v6;
  int v14 = *(_DWORD *)(a1 + 64);
  _LSIfCanModifyDefaultHandler(0, v2, &v9, v4, v10);

  uint64_t v7 = *(void *)(a1 + 56);
  if (v9)
  {
    v8 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v9, (uint64_t)"-[_LSDModifyClient setHandler:version:roles:forContentType:completionHandler:]_block_invoke", 787, 0);
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, 1, 0);
  }
}

uint64_t __78___LSDModifyClient_setHandler_version_roles_forContentType_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t DefaultAppCategoryForTypeIdentifier = getDefaultAppCategoryForTypeIdentifier(*(NSString **)(a1 + 32));
  if (v3 && (uint64_t v4 = DefaultAppCategoryForTypeIdentifier, _os_feature_enabled_impl()))
  {
    id v5 = *(void **)(a1 + 40);
    long long v6 = *(_OWORD *)(a1 + 76);
    v38[0] = *(_OWORD *)(a1 + 60);
    v38[1] = v6;
    uint64_t v7 = _LSServer_LSSetDefaultAppByTypeIdentifier(v4, v5, v38);
    v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [*(id *)(a1 + 48) XPCConnection];
      int v10 = [v9 processIdentifier];
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      uint64_t v26 = v10;
      __int16 v27 = 2114;
      uint64_t v28 = v11;
      __int16 v29 = 2048;
      uint64_t v30 = v4;
      __int16 v31 = 2048;
      uint64_t v32 = (int)v7;
      _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "pid %ld setting handler for content type %{public}@ set default app category %lu -> %ld", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v12 = *(unsigned int *)(a1 + 56);
    uint64_t v13 = *(LSContext **)(a1 + 32);
    CFStringRef v14 = *(const __CFString **)(a1 + 40);
    long long v15 = *(_OWORD *)(a1 + 76);
    v37[0] = *(_OWORD *)(a1 + 60);
    v37[1] = v15;
    uint64_t v7 = _LSServer_SetContentTypeHandler(v13, v12, v14, v37);
    v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [*(id *)(a1 + 48) XPCConnection];
      int v17 = [v16 processIdentifier];
      uint64_t v18 = *(unsigned int *)(a1 + 56);
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      long long v21 = *(_OWORD *)(a1 + 76);
      v24[0] = *(_OWORD *)(a1 + 60);
      v24[1] = v21;
      v22 = _LSVersionNumberGetStringRepresentation(v24);
      *(_DWORD *)buf = 134219266;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      uint64_t v28 = v20;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      __int16 v31 = 2112;
      uint64_t v32 = v19;
      __int16 v33 = 2112;
      __int16 v34 = v22;
      __int16 v35 = 2048;
      uint64_t v36 = (int)v7;
      _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "pid %ld setting handler for content type %{public}@ roles %lx to %@ v %@ -> %ld", buf, 0x3Eu);
    }
  }

  return v7;
}

void __72___LSDModifyClient_removeHandlerForContentType_roles_completionHandler___block_invoke(uint64_t a1)
{
  int v13 = -10822;
  int v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) XPCConnection];
  uint64_t v4 = [v3 _xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72___LSDModifyClient_removeHandlerForContentType_roles_completionHandler___block_invoke_2;
  v9[3] = &unk_1E522EDF0;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  int v12 = *(_DWORD *)(a1 + 56);
  _LSIfCanModifyDefaultHandler(0, v2, &v13, v4, v9);

  uint64_t v7 = *(void *)(a1 + 48);
  if (v13)
  {
    v8 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v13, (uint64_t)"-[_LSDModifyClient removeHandlerForContentType:roles:completionHandler:]_block_invoke", 823, 0);
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
  else
  {
    (*(void (**)(void, uint64_t, void))(v7 + 16))(*(void *)(a1 + 48), 1, 0);
  }
}

uint64_t __72___LSDModifyClient_removeHandlerForContentType_roles_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t DefaultAppCategoryForTypeIdentifier = getDefaultAppCategoryForTypeIdentifier(*(NSString **)(a1 + 32));
  if (v3 && (uint64_t v4 = DefaultAppCategoryForTypeIdentifier, _os_feature_enabled_impl()))
  {
    uint64_t v5 = _LSServer_LSRemoveDefaultApp(v4);
    uint64_t v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 40) XPCConnection];
      int v13 = 134218496;
      uint64_t v14 = (int)[v7 processIdentifier];
      __int16 v15 = 2048;
      uint64_t v16 = v4;
      __int16 v17 = 2048;
      uint64_t v18 = (int)v5;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "pid %ld removing default app for category %lu -> %ld", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    uint64_t v5 = _LSServer_RemoveContentTypeHandler(*(const __CFString **)(a1 + 32), *(unsigned int *)(a1 + 48));
    uint64_t v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [*(id *)(a1 + 40) XPCConnection];
      int v9 = [v8 processIdentifier];
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(unsigned int *)(a1 + 48);
      int v13 = 134218754;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      __int16 v17 = 2048;
      uint64_t v18 = v11;
      __int16 v19 = 2048;
      uint64_t v20 = (int)v5;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "pid %ld removing content type handler for %{public}@ roles %lx -> %ld", (uint8_t *)&v13, 0x2Au);
    }
  }

  return v5;
}

void __70___LSDModifyClient_setHandler_version_forURLScheme_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v10 = -10822;
  int v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) XPCConnection];
  uint64_t v4 = [v3 _xpcConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70___LSDModifyClient_setHandler_version_forURLScheme_completionHandler___block_invoke_2;
  v11[3] = &unk_1E522EE40;
  id v12 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 64);
  long long v16 = v6;
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v7;
  _LSIfCanModifyDefaultHandler(v2, 0, &v10, v4, v11);

  uint64_t v8 = *(void *)(a1 + 56);
  if (v10)
  {
    int v9 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v10, (uint64_t)"-[_LSDModifyClient setHandler:version:forURLScheme:completionHandler:]_block_invoke", 860, 0);
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 1, 0);
  }
}

uint64_t __70___LSDModifyClient_setHandler_version_forURLScheme_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  InfoForPreferenceSet = LSDefaultAppCategoryGetInfoForPreferenceSet(0, *(void **)(a1 + 32));
  if (InfoForPreferenceSet && (uint64_t v3 = *InfoForPreferenceSet, _os_feature_enabled_impl()))
  {
    uint64_t v4 = *(void **)(a1 + 40);
    long long v5 = *(_OWORD *)(a1 + 72);
    v33[0] = *(_OWORD *)(a1 + 56);
    v33[1] = v5;
    uint64_t v6 = _LSServer_LSSetDefaultAppByTypeIdentifier(v3, v4, v33);
    uint64_t v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 48) XPCConnection];
      int v9 = [v8 processIdentifier];
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      uint64_t v25 = v10;
      __int16 v26 = 2048;
      uint64_t v27 = v3;
      __int16 v28 = 2048;
      __int16 v29 = (void *)(int)v6;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "pid %ld setting handler for scheme %{public}@ set default app category %lu -> %ld ", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v11 = *(__CFString **)(a1 + 32);
    CFStringRef v12 = *(const __CFString **)(a1 + 40);
    long long v13 = *(_OWORD *)(a1 + 72);
    v32[0] = *(_OWORD *)(a1 + 56);
    v32[1] = v13;
    uint64_t v6 = _LSServer_SetSchemeHandler(v11, v12, v32);
    uint64_t v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [*(id *)(a1 + 48) XPCConnection];
      int v15 = [v14 processIdentifier];
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      long long v18 = *(_OWORD *)(a1 + 72);
      v21[0] = *(_OWORD *)(a1 + 56);
      v21[1] = v18;
      __int16 v19 = _LSVersionNumberGetStringRepresentation(v21);
      *(_DWORD *)buf = 134219010;
      uint64_t v23 = v15;
      __int16 v24 = 2114;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      __int16 v29 = v19;
      __int16 v30 = 2048;
      uint64_t v31 = (int)v6;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "pid %ld setting handler for scheme %{public}@ to %@ v %@: %ld", buf, 0x34u);
    }
  }

  return v6;
}

void __64___LSDModifyClient_removeHandlerForURLScheme_completionHandler___block_invoke(uint64_t a1)
{
  int v12 = -10822;
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) XPCConnection];
  uint64_t v4 = [v3 _xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64___LSDModifyClient_removeHandlerForURLScheme_completionHandler___block_invoke_2;
  v9[3] = &unk_1E522EE90;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  _LSIfCanModifyDefaultHandler(v2, 0, &v12, v4, v9);

  uint64_t v7 = *(void *)(a1 + 48);
  if (v12)
  {
    uint64_t v8 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v12, (uint64_t)"-[_LSDModifyClient removeHandlerForURLScheme:completionHandler:]_block_invoke", 887, 0);
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
  else
  {
    (*(void (**)(void, uint64_t, void))(v7 + 16))(*(void *)(a1 + 48), 1, 0);
  }
}

uint64_t __64___LSDModifyClient_removeHandlerForURLScheme_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _LSServer_RemoveSchemeHandler(*(const __CFString **)(a1 + 32));
  uint64_t v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 40) XPCConnection];
    int v5 = [v4 processIdentifier];
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 134218498;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = (int)v2;
    _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "pid %ld removing handler for scheme %{public}@: %ld", (uint8_t *)&v8, 0x20u);
  }
  return v2;
}

void __59___LSDModifyClient_removeAllHandlersWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__23;
  __int16 v12 = __Block_byref_object_dispose__23;
  id v13 = 0;
  int v7 = -10822;
  uint64_t v2 = [*(id *)(a1 + 32) XPCConnection];
  uint64_t v3 = [v2 _xpcConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59___LSDModifyClient_removeAllHandlersWithCompletionHandler___block_invoke_230;
  v6[3] = &unk_1E522EEB8;
  v6[5] = &v14;
  v6[6] = &v8;
  v6[4] = *(void *)(a1 + 32);
  _LSIfCanModifyDefaultHandler(@"*", @"*", &v7, v3, v6);

  if (!*((unsigned char *)v15 + 24) && !v9[5])
  {
    uint64_t v4 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v7, (uint64_t)"-[_LSDModifyClient removeAllHandlersWithCompletionHandler:]_block_invoke", 914, 0);
    int v5 = (void *)v9[5];
    v9[5] = v4;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

uint64_t __59___LSDModifyClient_removeAllHandlersWithCompletionHandler___block_invoke_230(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v2 + 40);
  BOOL v3 = _LSServer_RemoveAllHandlers(&obj);
  objc_storeStrong((id *)(v2 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = _LSGetOSStatusFromNSError(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  int v5 = _LSDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(a1 + 32) XPCConnection];
    int v7 = [v6 processIdentifier];
    *(_DWORD *)buf = 134218240;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = (int)v4;
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "pid %ld removing ALL handlers: %ld", buf, 0x16u);
  }
  return v4;
}

void __91___LSDModifyClient_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__23;
  uint64_t v14 = __Block_byref_object_dispose__23;
  id v15 = 0;
  uint64_t v2 = [LSApplicationRecord alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = (id *)(v11 + 5);
  id obj = (id)v11[5];
  int v5 = [(LSApplicationRecord *)v2 initWithBundleIdentifier:v3 allowPlaceholder:0 error:&obj];
  objc_storeStrong(v4, obj);
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91___LSDModifyClient_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler___block_invoke_2;
    v7[3] = &unk_1E522EEE0;
    char v8 = *(unsigned char *)(a1 + 48);
    v7[4] = v16;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __91___LSDModifyClient_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler___block_invoke_3;
    v6[3] = &unk_1E522EF08;
    v6[4] = &v10;
    [(LSRecord *)v5 _ifAttached:v7 else:v6];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(v16, 8);
}

void __91___LSDModifyClient_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  _LSBundleSetLegacySpecialApplicationTypes(*a2, a4, *(unsigned __int8 *)(a1 + 40), 1);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  _LSDatabaseCommit((uint64_t)*a2);

  _LSArmSaveTimer(1);
}

void __91___LSDModifyClient_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F28228];
  v7[0] = @"Unable to access the specified record in the LS database for an unknown reason. Please file a bug report.";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v3 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10810, (uint64_t)"-[_LSDModifyClient relaxApplicationTypeRequirements:forBundleIdentifier:completionHandler:]_block_invoke_3", 966, v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __58___LSDModifyClient_resetServerStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) XPCConnection];
  uint64_t v2 = [v6 _xpcConnection];
  int v3 = _LSCheckEntitlementForXPCConnection(v2, @"com.apple.private.coreservices.canresetserverstore");

  if (v3)
  {
    _LSResetServer();
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient resetServerStoreWithCompletionHandler:]_block_invoke", 993, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __148___LSDModifyClient_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__23;
  __int16 v26 = __Block_byref_object_dispose__23;
  id v27 = 0;
  int updated = _LSServer_UpdateDatabaseWithInfo(*(void **)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), 0, a6, a7, a8);
  if (updated)
  {
    uint64_t v10 = *(void *)(a1 + 72);
    uint64_t v11 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], updated, (uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:returnSaveToken:completionHandler:]_block_invoke_2", 1070, 0);
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v11);
  }
  else
  {
    if (*(unsigned char *)(a1 + 84))
    {
      uint64_t v12 = [[_LSDModificationPendingSaveToken alloc] initWithUUID:*(void *)(a1 + 64)];
      uint64_t v13 = (void *)v23[5];
      v23[5] = (uint64_t)v12;

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __148___LSDModifyClient_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler___block_invoke_2;
      v19[3] = &unk_1E522EF58;
      id v20 = *(id *)(a1 + 32);
      uint64_t v21 = &v22;
      uint64_t v14 = (void *)MEMORY[0x18530F950](v19);
    }
    else
    {
      uint64_t v14 = 0;
    }
    _LSArmSaveTimerWithObserver(5, v14);
    if (*(_DWORD *)(a1 + 80))
    {
      id v15 = +[LSApplicationProxy applicationProxyForIdentifier:*(void *)(a1 + 32) placeholder:1];
      if (v15)
      {
        uint64_t v16 = +[_LSInstallProgressService sharedInstance];
        uint64_t v17 = *(unsigned int *)(a1 + 80);
        v28[0] = v15;
        long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
        [v16 sendNotification:v17 forAppProxies:v18 Plugins:0 completion:0];
      }
    }

    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), 1, v23[5], 0);
  }
  _Block_object_dispose(&v22, 8);
}

void __148___LSDModifyClient_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler___block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = _LSInstallLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v12 = 138412802;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "Save after update app record for bundle %@ attempted: %d save error: %@", (uint8_t *)&v12, 0x1Cu);
  }

  id v9 = v6;
  uint64_t v10 = v9;
  if ((a2 & 1) == 0)
  {
    uint64_t v11 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 89, (uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:returnSaveToken:completionHandler:]_block_invoke", 1039, 0);

    uint64_t v10 = (void *)v11;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) saveDidHappen:v10 == 0 error:v10];
}

uint64_t __53___LSDModifyClient_synchronizeWithMobileInstallation__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _LSDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = [*(id *)(a1 + 32) XPCConnection];
    v5[0] = 67109120;
    v5[1] = [v4 processIdentifier];
    _os_log_error_impl(&dword_182959000, v2, OS_LOG_TYPE_ERROR, "Request to synchronize with MobileInstallation made by pid %d", (uint8_t *)v5, 8u);
  }
  _LSServer_SyncWithMobileInstallation(0);
  return MEMORY[0x185310460]();
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v43 = a2;
  id v44 = a3;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__23;
  v74 = __Block_byref_object_dispose__23;
  id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (*(void *)(a1 + 32))
  {
    id v5 = 0;
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient unregisterApplicationsAtMountPoint:operationUUID:reply:]_block_invoke", 1192, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v69 = 0;
  v66 = 0;
  id v67 = 0;
  char v68 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = a1;
  v46 = (id *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v66, v6, 0);

  uint64_t v7 = a1;
  if (!*(void *)(a1 + 32) || !v46) {
    goto LABEL_28;
  }
  int v65 = 0;
  uint64_t v8 = [FSNode alloc];
  uint64_t v9 = *(void *)(a1 + 32);
  id v64 = v5;
  v45 = [(FSNode *)v8 initWithURL:v9 flags:8 error:&v64];
  v41 = v64;

  if (!v45)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    __int16 v19 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v66, v19, 0);

    if (v20) {
      id v5 = 0;
    }
    else {
      id v5 = v69;
    }
    id v17 = v41;
    goto LABEL_23;
  }
  v63 = v41;
  _LSContainerFindOrRegisterWithNode(v46, v45, 0, &v65, 0, 0, &v63);
  uint64_t v10 = v63;

  int v42 = v10;
  if (v10)
  {
    uint64_t v11 = _LSDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = [*(id *)(a1 + 32) absoluteString];
      __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_4(v12, (uint64_t)v84, v11);
    }
  }
  uint64_t v13 = +[FSNode rootVolumeNode];
  if ([(FSNode *)v45 isEqual:v13]) {
    goto LABEL_16;
  }
  __int16 v14 = +[FSNode systemDataVolumeNode];
  if ([(FSNode *)v45 isEqual:v14])
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  int v15 = +[FSNode prebootVolumeNode];
  if ([(FSNode *)v45 isEqual:v15])
  {

    goto LABEL_15;
  }
  __int16 v28 = +[FSNode userDataVolumeNode];
  BOOL v29 = [(FSNode *)v45 isEqual:v28];

  if (v29)
  {
LABEL_17:
    uint64_t v82 = *MEMORY[0x1E4F28228];
    v83 = @"Mount point was root/nil";
    __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -46, (uint64_t)"-[_LSDModifyClient unregisterApplicationsAtMountPoint:operationUUID:reply:]_block_invoke", 1211, v16);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    id v17 = _LSDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [*(id *)(a1 + 32) absoluteString];
      __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_2(v18, (uint64_t)buf, v17);
    }
    goto LABEL_23;
  }
  if (v65)
  {
    uint64_t v56 = MEMORY[0x1E4F143A8];
    uint64_t v57 = 3221225472;
    v58 = __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_270;
    v59 = &unk_1E522EFA8;
    int v62 = v65;
    v60 = &v70;
    v61 = v46;
    _CSStoreEnumerateUnits();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = (id)v71[5];
    uint64_t v30 = [obj countByEnumeratingWithState:&v52 objects:v81 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v53 != v31) {
            objc_enumerationMutation(obj);
          }
          __int16 v33 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          uint64_t v34 = +[_LSInstallProgressService sharedInstance];
          __int16 v35 = [v33 appState];
          int v36 = [v35 isPlaceholder];
          v80 = v33;
          int v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
          if (v36) {
            uint64_t v38 = 9;
          }
          else {
            uint64_t v38 = 8;
          }
          [v34 sendNotification:v38 forAppProxies:v37 Plugins:0 completion:0];
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v52 objects:v81 count:16];
      }
      while (v30);
    }

    _LSContainerRemove((uint64_t *)v46, v65);
    if (!v42)
    {
      id v5 = 0;
      p_super = &v45->super;
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v39 = _LSDefaultLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = [*(id *)(v47 + 32) absoluteString];
      __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_3(v40, (uint64_t)v42, buf, v39);
    }

    id v5 = v42;
LABEL_24:
    p_super = _LSDefaultLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [*(id *)(v47 + 32) absoluteString];
      __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_1(v22, (uint64_t)v76, p_super);
    }
    goto LABEL_26;
  }
  uint64_t v77 = *MEMORY[0x1E4F28228];
  v78 = @"Container could not be resolved";
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[_LSDModifyClient unregisterApplicationsAtMountPoint:operationUUID:reply:]_block_invoke", 1234, v17);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
  if (v5) {
    goto LABEL_24;
  }
LABEL_27:
  uint64_t v7 = v47;
LABEL_28:
  if (v5)
  {
    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v24 = [[_LSDModificationPendingSaveToken alloc] initWithUUID:*(void *)(v7 + 40)];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_275;
    v49[3] = &unk_1E522EFD0;
    id v50 = *(id *)(v7 + 32);
    uint64_t v23 = v24;
    v51 = v23;
    uint64_t v25 = (void *)MEMORY[0x18530F950](v49);
    _LSArmSaveTimerWithObserver(1, v25);

    uint64_t v7 = v47;
  }
  _LSDatabaseSentinelDecrement();
  if (!v23) {
    _LSDatabaseSentinelFlush();
  }
  (*(void (**)(void))(*(void *)(v7 + 56) + 16))();

  if (v66 && v68) {
    _LSContextDestroy(v66);
  }
  id v26 = v67;
  v66 = 0;
  id v67 = 0;

  char v68 = 0;
  id v27 = v69;
  id v69 = 0;

  _Block_object_dispose(&v70, 8);
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4) == *(_DWORD *)(a1 + 48))
  {
    id v4 = +[LSApplicationProxy applicationProxyWithBundleUnitID:a2 withContext:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:");
  }
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_275(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = _LSInstallLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [*(id *)(a1 + 32) absoluteString];
    int v12 = 138412802;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "Save after unregistering mount point: %@ attempted: %d error: %@", (uint8_t *)&v12, 0x1Cu);
  }
  id v9 = v6;
  uint64_t v10 = v9;
  if ((a2 & 1) == 0)
  {
    uint64_t v11 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 89, (uint64_t)"-[_LSDModifyClient unregisterApplicationsAtMountPoint:operationUUID:reply:]_block_invoke", 1256, 0);

    uint64_t v10 = (void *)v11;
  }
  [*(id *)(a1 + 40) saveDidHappen:v10 == 0 error:v10];
}

void __53___LSDModifyClient_unregisterApplicationAtURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v19 = 0;
  uint64_t v20 = 0;
  unsigned int v18 = 0;
  uint64_t v17 = 0;
  if (*(void *)(a1 + 32))
  {
    int v7 = _LSContextInit(&v20);
    if (!v7)
    {
      int v7 = FSNodeCreateWithURL(*(void *)(a1 + 32), 0, &v19);
      if (!v7)
      {
        int v7 = _LSBundleFindWithNode((uint64_t)&v20, v19, &v18, &v17);
        if (!v7)
        {
          if (*(_DWORD *)(v17 + 12))
          {
            uint64_t v8 = (void *)_CSStringCopyCFString();
            if (v8)
            {
              __int16 v16 = +[LSApplicationProxy applicationProxyWithBundleUnitID:v18 withContext:&v20];
              int v7 = _LSUnregisterAppWithBundleIDUsingContext(v8, 0, (_LSDatabase **)&v20, 0);
              BOOL v9 = v7 == 0;
              uint64_t v10 = +[_LSInstallProgressService sharedInstance];
              uint64_t v11 = [v16 appState];
              int v12 = [v11 isPlaceholder];
              v21[0] = v16;
              uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
              if (v12) {
                uint64_t v14 = 9;
              }
              else {
                uint64_t v14 = 8;
              }
              [v10 sendNotification:v14 forAppProxies:v13 Plugins:0 completion:0];

              CFRelease(v8);
              goto LABEL_13;
            }
          }
          int v7 = 0;
        }
      }
      BOOL v9 = 0;
LABEL_13:
      _LSContextDestroy(&v20);
      goto LABEL_14;
    }
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = 0;
    int v7 = -50;
  }
LABEL_14:
  _LSDatabaseSentinelDecrement();
  if (!v9) {
    _LSDatabaseSentinelFlush();
  }
  if (v7)
  {
    int v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], v7, (uint64_t)"-[_LSDModifyClient unregisterApplicationAtURL:reply:]_block_invoke", 1328, 0);
  }
  else
  {
    int v15 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __57___LSDModifyClient_refreshContentInFrameworkAtURL_reply___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) XPCConnection];
  int v3 = [v2 _xpcConnection];
  int v4 = _LSCheckEntitlementForXPCConnection(v3, @"com.apple.lsapplicationworkspace.rebuildappdatabases");

  if (v4)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57___LSDModifyClient_refreshContentInFrameworkAtURL_reply___block_invoke_2;
    v13[3] = &unk_1E522BD18;
    id v5 = *(void **)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    _LSServer_RefreshContentInFrameworkAtURL(v5, v13);
    id v6 = v14;
  }
  else
  {
    int v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = [*(id *)(a1 + 32) XPCConnection];
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v11;
      __int16 v19 = 1024;
      int v20 = [v12 processIdentifier];
      _os_log_error_impl(&dword_182959000, v7, OS_LOG_TYPE_ERROR, "Unentitled request to refresh plugins in framework %@ by pid %d", buf, 0x12u);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    if (@"com.apple.lsapplicationworkspace.rebuildappdatabases") {
      BOOL v9 = @"com.apple.lsapplicationworkspace.rebuildappdatabases";
    }
    else {
      BOOL v9 = @"unknown entitlement";
    }
    uint64_t v15 = *MEMORY[0x1E4F28228];
    __int16 v16 = v9;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[_LSDModifyClient refreshContentInFrameworkAtURL:reply:]_block_invoke", 1345, v6);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);
  }
}

uint64_t __57___LSDModifyClient_refreshContentInFrameworkAtURL_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64___LSDModifyClient_garbageCollectDatabaseWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v18 = 0;
  uint64_t v15 = 0;
  id v16 = 0;
  char v17 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  int v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v15, v7, 0);

  if (v8)
  {
    if (_CSStoreGarbageCollect()) {
      _LSArmSaveTimer(1);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v15, v10, 0);

    if (v11) {
      id v12 = 0;
    }
    else {
      id v12 = v18;
    }
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v12);
  }
  if (v15 && v17) {
    _LSContextDestroy(v15);
  }
  id v13 = v16;
  uint64_t v15 = 0;
  id v16 = 0;

  char v17 = 0;
  id v14 = v18;
  id v18 = 0;
}

void __84___LSDModifyClient_setPreferenceValue_forKey_forApplicationAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v19 = 0;
  id v16 = 0;
  id v17 = 0;
  char v18 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  int v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v16, v7, 0);

  if (v8)
  {
    id v9 = (id)[*(id *)(a1 + 32) bundleIdentifierWithContext:v8 error:0];
  }
  else
  {
    uint64_t v10 = _LSDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      id v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v16, v13, 0);

      if (v14) {
        id v15 = 0;
      }
      else {
        id v15 = v19;
      }
      *(_DWORD *)buf = 138543362;
      id v21 = v15;
      _os_log_error_impl(&dword_182959000, v10, OS_LOG_TYPE_ERROR, "Unexpected error talking to LS database while setting preference value: %{public}@", buf, 0xCu);
    }
  }
  if (v16 && v18) {
    _LSContextDestroy(v16);
  }
  id v11 = v17;
  id v16 = 0;
  id v17 = 0;

  char v18 = 0;
  id v12 = v19;
  id v19 = 0;
}

void __84___LSDModifyClient_setPreferenceValue_forKey_forApplicationAtURL_completionHandler___block_invoke_284(LaunchServices::PrefsStorage *a1)
{
  uint64_t Shared = LaunchServices::PrefsStorage::GetShared(a1);
  int v3 = (void *)*((void *)a1 + 4);
  int v4 = (void *)*((void *)a1 + 5);
  id v5 = (void *)*((void *)a1 + 6);
  uint64_t v6 = *(void *)(*((void *)a1 + 8) + 8);
  id obj = *(id *)(v6 + 40);
  BOOL v7 = LaunchServices::PrefsStorage::setValueForNode(Shared, v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(*((void *)a1 + 7) + 8) + 24) = v7;
}

void __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v32 = 0;
  BOOL v29 = 0;
  id v30 = 0;
  char v31 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  BOOL v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v29, v7, 0);

  if (!v8)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    id v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v29, v16, 0);

    if (v17) {
      id v18 = 0;
    }
    else {
      id v18 = v32;
    }
    uint64_t v23 = _LSDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke_cold_1((uint64_t)v18, v23);
    }

    uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v22 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v18;
    goto LABEL_13;
  }
  int v28 = 0;
  id v9 = (LaunchServices::PrefsStorage *)_LSBundleFindWithNode(v8, *(void **)(a1 + 32), &v28, 0);
  if (!v28)
  {
    id v19 = _LSDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke_cold_2();
    }

    uint64_t v20 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -600, (uint64_t)"-[_LSDModifyClient setPreferenceValueForCallingApplication:forKey:completionHandler:]_block_invoke", 1482, 0);
    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
LABEL_13:

    goto LABEL_14;
  }
  uint64_t Shared = LaunchServices::PrefsStorage::GetShared(v9);
  id v12 = *(void **)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v13 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v14 + 40);
  BOOL v15 = LaunchServices::PrefsStorage::setValueForNode(Shared, v11, v12, v13, &obj);
  objc_storeStrong((id *)(v14 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15;
LABEL_14:
  if (v29 && v31) {
    _LSContextDestroy(v29);
  }
  id v25 = v30;
  BOOL v29 = 0;
  id v30 = 0;

  char v31 = 0;
  id v26 = v32;
  id v32 = 0;
}

uint64_t __71___LSDModifyClient_performShimmedInstallOfArtifact_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

uint64_t __90___LSDModifyClient_performShimmedUninstallOfApplicationWithIdentifier_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

void __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _LSGetCollapsedMIDictionaryForAppAndContentsDictionaries(*(void **)(a1 + 32));
  if ([v2 count] == 1)
  {
    int v3 = _LSDatabaseGetInstallingGroup();
    dispatch_group_enter(v3);

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke_2;
    v20[3] = &unk_1E522F098;
    id v21 = *(id *)(a1 + 64);
    int v4 = (void *)MEMORY[0x18530F950](v20);
    id v5 = [v2 allValues];
    id v6 = [v5 firstObject];

    BOOL v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
    uint64_t v8 = _LSInstallLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = [*(id *)(a1 + 48) XPCConnection];
      int v11 = [v10 processIdentifier];
      *(_DWORD *)buf = 138412802;
      id v25 = v7;
      __int16 v26 = 2112;
      uint64_t v27 = v9;
      __int16 v28 = 1024;
      int v29 = v11;
      _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "Post installation registration: request to register %@, operation %@, from pid %d", buf, 0x1Cu);
    }
    id v12 = [LSMIResultRegistrant alloc];
    id v13 = objc_alloc_init(LSMIRegistrantServerStrategy);
    uint64_t v14 = [(LSMIResultRegistrant *)v12 initWithContext:v13 operationUUID:*(void *)(a1 + 40) itemInfoDict:v6 personas:*(void *)(a1 + 56)];

    [(LSMIResultRegistrant *)v14 runWithCompletion:v4];
    BOOL v15 = v21;
  }
  else
  {
    id v16 = _LSInstallLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke_cold_1(v16);
    }

    objc_msgSend(NSString, "stringWithFormat:", @"%zu items were provided to be registered; exactly 1 must be specified",
    BOOL v15 = [v2 count]);
    uint64_t v17 = *(void *)(a1 + 64);
    uint64_t v22 = *MEMORY[0x1E4F28228];
    uint64_t v23 = v15;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v19 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDModifyClient performPostInstallationRegistration:personaUniqueStrings:operationUUID:reply:]_block_invoke", 1581, v18);
    (*(void (**)(uint64_t, void, void, void *))(v17 + 16))(v17, 0, 0, v19);
  }
}

void __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _LSDatabaseGetInstallingGroup();
  dispatch_group_leave(v9);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __118___LSDModifyClient_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _LSDatabaseGetInstallingGroup();
  dispatch_group_enter(v2);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __118___LSDModifyClient_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply___block_invoke_2;
  v13[3] = &unk_1E522F0E8;
  id v14 = *(id *)(a1 + 64);
  int v3 = (void *)MEMORY[0x18530F950](v13);
  int v4 = [LSMIResultUnregistrant alloc];
  id v5 = objc_alloc_init(LSMIRegistrantServerStrategy);
  id v6 = [(LSMIResultUnregistrant *)v4 initWithContext:v5 operationUUID:*(void *)(a1 + 32) bundleIdentifier:*(void *)(a1 + 40) precondition:*(void *)(a1 + 48) type:*(unsigned int *)(a1 + 72)];

  id v7 = _LSInstallLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(unsigned int *)(a1 + 72);
    int v11 = [*(id *)(a1 + 56) XPCConnection];
    int v12 = [v11 processIdentifier];
    *(_DWORD *)buf = 138413058;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    __int16 v21 = 1024;
    int v22 = v12;
    _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "Post uninstallation unregistration: request to unregister %@, operation %@, type %lx from pid %d", buf, 0x26u);
  }
  [(LSMIResultUnregistrant *)v6 runWithCompletion:v3];
}

void __118___LSDModifyClient_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = _LSDatabaseGetInstallingGroup();
  dispatch_group_leave(v6);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __98___LSDModifyClient_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v100 = a2;
  id v101 = a3;
  id v124 = 0;
  v121 = 0;
  id v122 = 0;
  char v123 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  int v4 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v111 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v121, v4, 0);

  if (!v111)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    id v50 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v51 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v121, v50, 0);

    if (v51) {
      id v52 = 0;
    }
    else {
      id v52 = v124;
    }
    uint64_t v96 = *(void *)(*(void *)(a1 + 56) + 8);
    v97 = *(void **)(v96 + 40);
    *(void *)(v96 + 40) = v52;

    goto LABEL_104;
  }
  id v5 = [*(id *)(a1 + 32) objectEnumerator];
  uint64_t v103 = a1 + 56;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  id v8 = v5;
  v118 = 0;
  v119 = 0;
  v117 = 0;
  char v120 = 1;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v132 objects:buf count:16];
  v104 = (id *)(v6 + 40);
  v106 = v7;
  if (!v9)
  {
LABEL_49:
    id v49 = obj;
    goto LABEL_56;
  }
  uint64_t v10 = *(void *)v133;
LABEL_4:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v133 != v10) {
      objc_enumerationMutation(obj);
    }
    int v12 = *(void **)(*((void *)&v132 + 1) + 8 * v11);
    unsigned int v128 = 0;
    *(_OWORD *)__p = kLSVersionNumberNull;
    long long v140 = *(_OWORD *)algn_182AF9270;
    id v127 = 0;
    BOOL v13 = _LSBundleFindWithInfoAndNo_IOFilter((uint64_t)v111, 0, v12, 0, __p, 2, 128, 0, 0, &v128, 0, &v127);
    id v14 = v127;
    if (v13)
    {
      id v15 = v12;
      id v16 = v15;
      unsigned int v17 = v128;
      uint64_t v18 = v118;
      if (v118 >= (unsigned int *)v119)
      {
        uint64_t v20 = v117;
        uint64_t v21 = ((char *)v118 - (char *)v117) >> 4;
        unint64_t v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 60) {
          abort();
        }
        uint64_t v23 = v119 - (char *)v117;
        if ((v119 - (char *)v117) >> 3 > v22) {
          unint64_t v22 = v23 >> 3;
        }
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v24 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v24 = v22;
        }
        v131 = (void **)&v119;
        if (v24)
        {
          id v25 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>((uint64_t)&v119, v24);
          uint64_t v20 = v117;
          uint64_t v18 = v118;
        }
        else
        {
          id v25 = 0;
        }
        __int16 v26 = &v25[16 * v21];
        *(void *)__int16 v26 = v16;
        *((_DWORD *)v26 + 2) = v17;
        if (v18 == v20)
        {
          __int16 v28 = &v25[16 * v21];
        }
        else
        {
          uint64_t v27 = v18;
          __int16 v28 = &v25[16 * v21];
          do
          {
            uint64_t v29 = *((void *)v27 - 2);
            v27 -= 4;
            *(void *)uint64_t v27 = 0;
            *((void *)v28 - 2) = v29;
            v28 -= 16;
            *((_DWORD *)v28 + 2) = v27[2];
          }
          while (v27 != v20);
        }
        __int16 v19 = (unsigned int *)(v26 + 16);
        v117 = (unsigned int *)v28;
        v118 = (unsigned int *)(v26 + 16);
        uint64_t v30 = v119;
        v119 = &v25[16 * v24];
        v129.__end_cap_.__value_ = v18;
        v130 = v30;
        v129.__begin_ = v20;
        v129.__end_ = v20;
        std::__split_buffer<std::tuple<NSString * {__strong},unsigned int>>::~__split_buffer((uint64_t)&v129);
      }
      else
      {
        *(void *)v118 = v15;
        v18[2] = v17;
        __int16 v19 = v18 + 4;
      }
      v118 = v19;
    }
    unsigned int v126 = 0;
    memset(v138, 0, sizeof(v138));
    id v125 = v14;
    BOOL v31 = _LSBundleFindWithInfoAndNo_IOFilter((uint64_t)v111, 0, v12, 0, v138, 2, 1152, 0, 0, &v126, 0, &v125);
    id v32 = v125;

    if (v31)
    {
      id v33 = v12;
      id v34 = v33;
      unsigned int v35 = v126;
      int v36 = v118;
      if (v118 >= (unsigned int *)v119)
      {
        uint64_t v38 = v117;
        uint64_t v39 = ((char *)v118 - (char *)v117) >> 4;
        unint64_t v40 = v39 + 1;
        if ((unint64_t)(v39 + 1) >> 60) {
          abort();
        }
        uint64_t v41 = v119 - (char *)v117;
        if ((v119 - (char *)v117) >> 3 > v40) {
          unint64_t v40 = v41 >> 3;
        }
        if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v42 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v42 = v40;
        }
        v131 = (void **)&v119;
        if (v42)
        {
          id v43 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>((uint64_t)&v119, v42);
          uint64_t v38 = v117;
          int v36 = v118;
        }
        else
        {
          id v43 = 0;
        }
        id v44 = &v43[16 * v39];
        *(void *)id v44 = v34;
        *((_DWORD *)v44 + 2) = v35;
        if (v36 == v38)
        {
          v46 = &v43[16 * v39];
        }
        else
        {
          v45 = v36;
          v46 = &v43[16 * v39];
          do
          {
            uint64_t v47 = *((void *)v45 - 2);
            v45 -= 4;
            *(void *)v45 = 0;
            *((void *)v46 - 2) = v47;
            v46 -= 16;
            *((_DWORD *)v46 + 2) = v45[2];
          }
          while (v45 != v38);
        }
        int v37 = (unsigned int *)(v44 + 16);
        v117 = (unsigned int *)v46;
        v118 = (unsigned int *)(v44 + 16);
        v48 = v119;
        v119 = &v43[16 * v42];
        v129.__end_cap_.__value_ = v36;
        v130 = v48;
        v129.__begin_ = v38;
        v129.__end_ = v38;
        std::__split_buffer<std::tuple<NSString * {__strong},unsigned int>>::~__split_buffer((uint64_t)&v129);
      }
      else
      {
        *(void *)v118 = v33;
        v36[2] = v35;
        int v37 = v36 + 4;
      }
      v118 = v37;
      goto LABEL_47;
    }
    if (!v13) {
      break;
    }
LABEL_47:

    if (++v11 == v9)
    {
      uint64_t v9 = [obj countByEnumeratingWithState:&v132 objects:buf count:16];
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }
  long long v53 = [NSString stringWithFormat:@"No known bundle for %@", v12];
  uint64_t v136 = *MEMORY[0x1E4F28228];
  v137 = v53;
  long long v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
  long long v55 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"getAffectedBundleInfoForIdentifiers", 1672, v54);

  if (!v55) {
    goto LABEL_57;
  }
  if (v120)
  {
    v129.__begin_ = (std::vector<unsigned int>::pointer)&v117;
    std::vector<std::tuple<NSString * {__strong},unsigned int>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v129);
    char v120 = 0;
  }
  id v49 = v55;
  v106 = v49;
LABEL_56:

LABEL_57:
  objc_storeStrong(v104, v106);

  if (v120)
  {
    v102 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    __p[0] = 0;
    __p[1] = 0;
    *(void *)&long long v140 = 0;
    uint64_t v56 = v117;
    if (v117 == v118)
    {
      char v105 = 1;
    }
    else
    {
      uint64_t v57 = v118;
      char v105 = 1;
      do
      {
        id v58 = *(id *)v56;
        uint64_t v59 = v56[2];
        v60 = (void *)MEMORY[0x18530F680]();
        uint64_t v61 = _LSBundleGet(*v111, v59);
        if (v61)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x4812000000;
          v142 = __Block_byref_object_copy__339;
          v143 = __Block_byref_object_dispose__340;
          v144 = &unk_182B5933F;
          v146 = 0;
          uint64_t v147 = 0;
          v145 = 0;
          *(void *)&long long v132 = MEMORY[0x1E4F143A8];
          *((void *)&v132 + 1) = 3221225472;
          *(void *)&long long v133 = ___ZL23pluginsUnitIDsForBundleP9LSContextPK12LSBundleData_block_invoke;
          *((void *)&v133 + 1) = &unk_1E522F188;
          *(void *)&long long v134 = buf;
          _CSArrayEnumerateAllValues();
          std::vector<LSBundleClass>::vector(&v129, (const std::vector<unsigned int> *)(*(void *)&buf[8] + 48));
          _Block_object_dispose(buf, 8);
          if (v145)
          {
            v146 = v145;
            operator delete(v145);
          }
          std::vector<unsigned int>::__insert_with_size[abi:nn180100]<std::__wrap_iter<unsigned int *>,std::__wrap_iter<unsigned int *>>((std::vector<unsigned int> *)__p, (uint64_t)__p[1], (char *)v129.__begin_, (char *)v129.__end_, v129.__end_ - v129.__begin_);
          int v62 = +[LSApplicationExtensionRecord appexRecordsForUnitIDsWithContext:v111 unitIDs:&v129];
          v63 = +[_LSInstallProgressService sharedInstance];
          [v63 detachAndSendNotification:@"com.apple.LaunchServices.pluginswillberemoved" forApplicationExtensionRecords:v62];

          id v64 = [[LSBundleRecordUpdater alloc] initWithDatabase:*v111 bundleUnit:v59 bundleData:v61];
          uint64_t v65 = *(void *)(a1 + 40);
          uint64_t v66 = *(void *)(*(void *)(a1 + 56) + 8);
          id v116 = *(id *)(v66 + 40);
          LODWORD(v63) = [(LSBundleRecordUpdater *)v64 parsePersonas:v65 error:&v116];
          objc_storeStrong((id *)(v66 + 40), v116);
          if (v63
            && (uint64_t v67 = *(void *)(*(void *)v103 + 8),
                id v115 = *(id *)(v67 + 40),
                BOOL v68 = [(LSBundleRecordUpdater *)v64 updateBundleRecord:&v115],
                objc_storeStrong((id *)(v67 + 40), v115),
                v68))
          {
            [v102 addObject:v58];
            id v69 = +[_LSInstallProgressService sharedInstance];
            [v69 detachAndSendNotification:@"com.apple.LaunchServices.pluginsunregistered" forApplicationExtensionRecords:v62];
          }
          else
          {
            id v69 = _LSInstallLog();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              v71 = *(__n128 (**)(__n128 *, __n128 *))(*(void *)(*(void *)v103 + 8) + 40);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v58;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v59;
              *(_WORD *)&buf[22] = 2112;
              v142 = v71;
              _os_log_error_impl(&dword_182959000, v69, OS_LOG_TYPE_ERROR, "could not update personas for %@ (bundle unit %llx): %@", buf, 0x20u);
            }
            char v105 = 0;
          }

          if (v129.__begin_)
          {
            v129.__end_ = v129.__begin_;
            operator delete(v129.__begin_);
          }
        }
        else
        {
          uint64_t v70 = _LSRegistrationLog();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v59;
            _os_log_fault_impl(&dword_182959000, v70, OS_LOG_TYPE_FAULT, "Bundle unit %llx went missing after we just enumerated it!", buf, 0xCu);
          }
        }

        v56 += 4;
      }
      while (v56 != v57);
    }
    uint64_t v72 = [v102 allObjects];
    id obja = (id)[v72 mutableCopy];

    v73 = obja;
    while ([v73 count])
    {
      v108 = (void *)MEMORY[0x18530F680]();
      unint64_t v74 = [obja count];
      if (v74 >= 0xA) {
        uint64_t v75 = 10;
      }
      else {
        uint64_t v75 = v74;
      }
      v76 = objc_msgSend(obja, "subarrayWithRange:", 0, v75);
      v129.__begin_ = (std::vector<unsigned int>::pointer)MEMORY[0x1E4F143A8];
      v129.__end_ = (std::vector<unsigned int>::pointer)3221225472;
      v129.__end_cap_.__value_ = (unsigned int *)___ZL45sendPersonaChangedNotificationsForIdentifiersP9LSContextP5NSSetIP8NSStringE_block_invoke;
      v130 = (char *)&__block_descriptor_40_e38___LSApplicationProxy_16__0__NSString_8l;
      v131 = v111;
      id v77 = v76;
      v78 = &v129;
      v79 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v77, "count"));
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      id v80 = v77;
      uint64_t v81 = [v80 countByEnumeratingWithState:&v132 objects:buf count:16];
      if (v81)
      {
        uint64_t v82 = *(void *)v133;
        do
        {
          for (uint64_t i = 0; i != v81; ++i)
          {
            if (*(void *)v133 != v82) {
              objc_enumerationMutation(v80);
            }
            v84 = ((void (*)(std::vector<unsigned int> *, void))v129.__end_cap_.__value_)(v78, *(void *)(*((void *)&v132 + 1) + 8 * i));
            [v79 addObject:v84];
          }
          uint64_t v81 = [v80 countByEnumeratingWithState:&v132 objects:buf count:16];
        }
        while (v81);
      }

      uint64_t v85 = +[_LSInstallProgressService sharedInstance];
      [v85 sendNotification:14 forAppProxies:v79 Plugins:1 completion:0];

      objc_msgSend(obja, "removeObjectsInRange:", 0, v75);
      v73 = obja;
    }

    v86 = (void *)MEMORY[0x18530F680]();
    v87 = +[LSApplicationExtensionRecord appexRecordsForUnitIDsWithContext:v111 unitIDs:__p];
    v88 = +[_LSInstallProgressService sharedInstance];
    [v88 detachAndSendNotification:@"com.apple.LaunchServices.pluginsregistered" forApplicationExtensionRecords:v87];

    if (v105)
    {
      v89 = [[_LSDModificationPendingSaveToken alloc] initWithUUID:*(void *)(a1 + 48)];
      uint64_t v90 = *(void *)(*(void *)(a1 + 64) + 8);
      v91 = *(void **)(v90 + 40);
      *(void *)(v90 + 40) = v89;

      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __98___LSDModifyClient_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply___block_invoke_309;
      v112[3] = &unk_1E522EF58;
      id v92 = *(id *)(a1 + 32);
      uint64_t v93 = *(void *)(a1 + 64);
      id v113 = v92;
      uint64_t v114 = v93;
      _LSArmSaveTimerWithObserver(1, v112);
    }
    else if ([v102 count])
    {
      v94 = _LSInstallLog();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v95 = [v102 count];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v95;
        _os_log_impl(&dword_182959000, v94, OS_LOG_TYPE_DEFAULT, "Not all persona updates were successful, but %zu were, so arming save timer", buf, 0xCu);
      }

      _LSArmSaveTimer(1);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    v102 = _LSInstallLog();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      __98___LSDModifyClient_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply___block_invoke_cold_1();
    }
  }

  if (v120)
  {
    *(void *)buf = &v117;
    std::vector<std::tuple<NSString * {__strong},unsigned int>>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  }
LABEL_104:
  if (v121 && v123) {
    _LSContextDestroy(v121);
  }
  id v98 = v122;
  v121 = 0;
  id v122 = 0;

  char v123 = 0;
  id v99 = v124;
  id v124 = 0;
}

void __98___LSDModifyClient_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply___block_invoke_309(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = _LSInstallLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v12 = 138412802;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "Save after update personas for bundles %@ attempted: %d save error: %@", (uint8_t *)&v12, 0x1Cu);
  }

  id v9 = v6;
  uint64_t v10 = v9;
  if ((a2 & 1) == 0)
  {
    uint64_t v11 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 89, (uint64_t)"-[_LSDModifyClient performUpdateOfPersonasOfBundleIDs:toPersonaUniqueStrings:operationUUID:reply:]_block_invoke", 1788, 0);

    uint64_t v10 = (void *)v11;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) saveDidHappen:v10 == 0 error:v10];
}

uint64_t __54___LSDModifyClient_forceSaveForTestingWithCompletion___block_invoke(uint64_t a1)
{
  _LSSaveImmediately(3);
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t __59___LSDModifyClient_setPreferredAppMarketplaces_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPreferredMarketplaces:*(void *)(a1 + 32)];
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_8(&dword_182959000, a3, (uint64_t)a3, "Couldn't create node for mount point: %@ ", (uint8_t *)a2);
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_8(&dword_182959000, a3, (uint64_t)a3, "Tried to deregister root / nil mount point: %@", (uint8_t *)a2);
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_3(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Failed to deregister applications at mount point: %@ error: %@", buf, 0x16u);
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_8(&dword_182959000, a3, (uint64_t)a3, "Mount point: %@ could not be resolved", (uint8_t *)a2);
}

void __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  int v3 = "-[_LSDModifyClient setPreferenceValueForCallingApplication:forKey:completionHandler:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "could not get database in %{public}s: %@", (uint8_t *)&v2, 0x16u);
}

void __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0_8(&dword_182959000, v0, v1, "self-setting preference value: could not find record for %@ in the database", v2);
}

void __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "wrong number of items provided for registration, rejecting", v1, 2u);
}

void __98___LSDModifyClient_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0_8(&dword_182959000, v0, v1, "could not get affected bundle info for persona change: %@", v2);
}

@end