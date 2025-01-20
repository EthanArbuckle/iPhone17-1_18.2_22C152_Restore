void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void BRGetCloudDocsRootURL(void *a1)
{
  v3 = a1;
  v1 = +[BRDaemonConnection mobileDocumentsURL];
  if (v1)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 2);
  }
  v3[2](v3, v1, v2);
}

id __LBCopyUbiquityAccountToken_block_invoke_2()
{
  return +[BRDaemonConnection mobileDocumentsURL];
}

void _preComputeURLSForPersona(char a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = ___preComputeURLSForPersona_block_invoke;
  v14 = &unk_1E59AF928;
  char v16 = a1;
  id v6 = v5;
  id v15 = v6;
  v7 = (void (**)(void, void))MEMORY[0x19F3C48D0](&v11);
  id v8 = (id)g_accountTokenDidChangeObserverForPersona;
  objc_sync_enter(v8);
  v9 = objc_msgSend((id)g_accountTokenDidChangeObserverForPersona, "objectForKeyedSubscript:", v6, v11, v12, v13, v14);

  if (!v9)
  {
    v10 = [[BRAccountTokenWillChangeObserver alloc] initWithPersonaID:v6];
    [(id)g_accountTokenDidChangeObserverForPersona setObject:v10 forKeyedSubscript:v6];
  }
  objc_sync_exit(v8);

  if (a3) {
    BRPerformWithPersonaAndError(v6, v7);
  }
  else {
    v7[2](v7, 0);
  }
}

void sub_19ED41B78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL LBCopyUbiquityAccountToken(uint64_t *a1, void *a2)
{
  id v7 = 0;
  v4 = +[BRAccount currentCachedLoggedInAccountWithError:&v7];
  id v5 = v7;
  if (LBCopyUbiquityAccountToken_once != -1) {
    dispatch_once(&LBCopyUbiquityAccountToken_once, &__block_literal_global_21);
  }
  *a1 = [v4 perAppAccountIdentifier];
  if (a2 && v5) {
    *a2 = v5;
  }

  return v5 == 0;
}

void sub_19ED42360(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double brc_monotonic_time_diff_to_interval(uint64_t a1)
{
  if (brc_monotonic_time_diff_to_interval_onceToken != -1) {
    dispatch_once(&brc_monotonic_time_diff_to_interval_onceToken, &__block_literal_global_4);
  }
  return (double)((unint64_t)brc_monotonic_time_diff_to_interval_info
                * a1
                / *(unsigned int *)algn_1EB46618C)
       / 1000000000.0;
}

void ___preComputeURLSForPersona_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40)
    && (+[BRContainerCache isPersonalProvider]
     || +[BRContainerCache isManagedProvider]))
  {
    v4 = (void *)MEMORY[0x1E4F1CB10];
    id v5 = objc_msgSend(NSString, "br_currentHomeDir");
    id v6 = [v4 fileURLWithPath:v5 isDirectory:1];

    id v7 = brc_bread_crumbs((uint64_t)"_preComputeURLSForPersona_block_invoke", 339);
    id v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      ___preComputeURLSForPersona_block_invoke_cold_2();
    }

    BOOL v9 = v6 != 0;
    if (v6)
    {
      v10 = 0;
      id v11 = 0;
      uint64_t v12 = 0;
LABEL_10:
      [(id)g_homeDirectoryURLForPersona setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];
      id v15 = brc_bread_crumbs((uint64_t)"_preComputeURLSForPersona_block_invoke", 360);
      char v16 = brc_default_log(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = *(void *)(a1 + 32);
        v26 = [v6 path];
        *(_DWORD *)buf = 138412802;
        uint64_t v37 = v30;
        __int16 v38 = 2112;
        v39 = v26;
        __int16 v40 = 2112;
        v41 = v15;
        _os_log_debug_impl(&dword_19ED3F000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] homeDirectory for persona %@: %@%@", buf, 0x20u);
      }
      v17 = [v6 URLByAppendingPathComponent:@"Library/Application Support/CloudDocs" isDirectory:1];
      [(id)g_cloudDocsAppSupportURLForPersona setObject:v17 forKeyedSubscript:*(void *)(a1 + 32)];
      v18 = brc_bread_crumbs((uint64_t)"_preComputeURLSForPersona_block_invoke", 364);
      v19 = brc_default_log(1);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = *(void *)(a1 + 32);
        v31 = [v17 path];
        *(_DWORD *)buf = 138412802;
        uint64_t v37 = v28;
        __int16 v38 = 2112;
        v39 = v31;
        __int16 v40 = 2112;
        v41 = v18;
        _os_log_debug_impl(&dword_19ED3F000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] cloudDocsAppSupport for persona %@: %@%@", buf, 0x20u);
      }
      v20 = [v6 URLByAppendingPathComponent:@"Library/Caches/com.apple.bird" isDirectory:1];

      [(id)g_cloudDocsCachesURLForPersona setObject:v20 forKeyedSubscript:*(void *)(a1 + 32)];
      v21 = brc_bread_crumbs((uint64_t)"_preComputeURLSForPersona_block_invoke", 368);
      v22 = brc_default_log(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v29 = *(void *)(a1 + 32);
        v32 = [v20 path];
        *(_DWORD *)buf = 138412802;
        uint64_t v37 = v29;
        __int16 v38 = 2112;
        v39 = v32;
        __int16 v40 = 2112;
        v41 = v21;
        _os_log_debug_impl(&dword_19ED3F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] cloudDocsCaches for persona %@: %@%@", buf, 0x20u);
      }
      if (!v9)
      {
        [(id)g_mobileDocumentsURLForPersona setObject:v10 forKeyedSubscript:*(void *)(a1 + 32)];
        v23 = brc_bread_crumbs((uint64_t)"_preComputeURLSForPersona_block_invoke", 380);
        v24 = brc_default_log(1);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v33 = *(void *)(a1 + 32);
          v27 = [v10 path];
          *(_DWORD *)buf = 138412802;
          uint64_t v37 = v33;
          __int16 v38 = 2112;
          v39 = v27;
          __int16 v40 = 2112;
          v41 = v23;
          _os_log_debug_impl(&dword_19ED3F000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] mobileDocuments for persona %@: %@%@", buf, 0x20u);
        }
        if (v10)
        {
          v35 = v10;
          v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
          [(id)g_syncedRootURLsForPersona setObject:v25 forKeyedSubscript:*(void *)(a1 + 32)];
        }
        else
        {
          [(id)g_syncedRootURLsForPersona setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:*(void *)(a1 + 32)];
        }
      }
      goto LABEL_24;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  v13 = +[BRCloudDocsHelperProvider cloudDocsHelper];
  uint64_t v14 = *(void *)(a1 + 32);
  id v34 = 0;
  uint64_t v12 = [v13 queryPathsForPersona:v14 withError:&v34];
  id v11 = v34;
  id v6 = [v12 objectForKeyedSubscript:@"home"];
  v10 = [v12 objectForKeyedSubscript:@"Mobile Documents"];

  if (v6) {
    goto LABEL_10;
  }
  id v6 = brc_bread_crumbs((uint64_t)"_preComputeURLSForPersona_block_invoke", 353);
  v20 = brc_default_log(1);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    ___preComputeURLSForPersona_block_invoke_cold_1();
  }
LABEL_24:
}

void sub_19ED42D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t brc_notify_set_state_and_post(int a1, uint64_t a2, char *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = brc_bread_crumbs((uint64_t)"brc_notify_set_state_and_post", 46);
  id v7 = brc_default_log(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315906;
    *(void *)id v15 = a3;
    *(_WORD *)&v15[8] = 1024;
    *(_DWORD *)&v15[10] = a1;
    __int16 v16 = 2048;
    uint64_t v17 = a2;
    __int16 v18 = 2112;
    *(void *)v19 = v6;
    _os_log_debug_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] notifying '%s' on token %d with state %llu%@", (uint8_t *)&v14, 0x26u);
  }

  if (a1 == -1) {
    return 2;
  }
  uint64_t v8 = notify_set_state(a1, a2);
  if (!v8) {
    return brc_notify_post(a3);
  }
  uint64_t v9 = v8;
  v10 = brc_bread_crumbs((uint64_t)"brc_notify_set_state_and_post", 54);
  id v11 = brc_default_log(0);
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    v13 = brc_prettyprint_notify_status(v9);
    int v14 = 67110402;
    *(_DWORD *)id v15 = a1;
    *(_WORD *)&v15[4] = 2048;
    *(void *)&v15[6] = a2;
    __int16 v16 = 2080;
    uint64_t v17 = (uint64_t)v13;
    __int16 v18 = 1024;
    *(_DWORD *)v19 = v9;
    *(_WORD *)&v19[4] = 2080;
    *(void *)&v19[6] = a3;
    __int16 v20 = 2112;
    v21 = v10;
    _os_log_error_impl(&dword_19ED3F000, v11, (os_log_type_t)0x90u, "[ERROR] notify_set_state(%d, %llu) failed with %s (%d) for '%s'%@", (uint8_t *)&v14, 0x36u);
  }

  return v9;
}

__CFString *brc_bread_crumbs(uint64_t a1, uint64_t a2)
{
  if (os_variant_has_internal_content()) {
    v4 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" [Bread Crumb: %s %lu | %s]", a1, a2, dispatch_queue_get_label(0));
  }
  else {
    v4 = &stru_1EF11DA20;
  }

  return v4;
}

uint64_t brc_notify_post(char *name)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!name)
  {
    id v6 = brc_bread_crumbs((uint64_t)"brc_notify_post", 35);
    id v7 = brc_default_log(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      brc_notify_post_cold_1((uint64_t)v6, v7);
    }
  }
  uint64_t v2 = notify_post(name);
  if (v2)
  {
    id v3 = brc_bread_crumbs((uint64_t)"brc_notify_post", 39);
    v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    {
      int v8 = 136315906;
      uint64_t v9 = name;
      __int16 v10 = 2080;
      id v11 = brc_prettyprint_notify_status(v2);
      __int16 v12 = 1024;
      int v13 = v2;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl(&dword_19ED3F000, v4, (os_log_type_t)0x90u, "[ERROR] notify_post(%s) failed with %s (%d)%@", (uint8_t *)&v8, 0x26u);
    }
  }
  return v2;
}

id brc_default_log(int a1)
{
  int v2 = *__error();
  id v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  v4 = [v3 currentPersona];

  int v5 = [v4 isDataSeparatedPersona];
  if (a1)
  {
    if (+[BRContainerCache isPersonalProvider])
    {
      if (!v5) {
        goto LABEL_7;
      }
      id v6 = brc_bread_crumbs((uint64_t)"brc_default_log", 51);
      id v7 = brc_default_log(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        brc_default_log_cold_1();
      }
    }
    else
    {
      if ((!+[BRContainerCache isManagedProvider] | v5)) {
        goto LABEL_7;
      }
      id v6 = brc_bread_crumbs((uint64_t)"brc_default_log", 53);
      id v7 = brc_default_log(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        brc_default_log_cold_2();
      }
    }
  }
LABEL_7:
  if (brc_default_log_once != -1) {
    dispatch_once(&brc_default_log_once, &__block_literal_global_7);
  }
  int v8 = __error();
  uint64_t v9 = &brc_default_log_loggerEnterprise;
  *int v8 = v2;
  if (!v5) {
    uint64_t v9 = &brc_default_log_loggerPersonal;
  }
  id v10 = (id)*v9;

  return v10;
}

void BRCSetupGenericOperations(void *a1, void *a2)
{
  __int16 v20 = a1;
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F29280]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F29280]);
  [v4 setProtocol:&unk_1EF135A48];
  [v5 setProtocol:&unk_1EF135998];
  id v6 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  __int16 v12 = objc_msgSend(v6, "arrayWithObjects:", v7, v8, v9, v10, v11, getCKShareClass(), 0);
  [v4 setInterface:v5 forSelector:sel_setRemoteOperationProxy_userInfo_ argumentIndex:0 ofReply:0];
  int v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
  [v4 setClasses:v13 forSelector:sel_setRemoteOperationProxy_userInfo_ argumentIndex:1 ofReply:0];

  __int16 v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
  [v4 setClasses:v14 forSelector:sel_progressCallbackWithTopic_userInfo_ argumentIndex:1 ofReply:0];

  unsigned int outCount = 0;
  id v15 = protocol_copyMethodDescriptionList(v20, 1, 1, &outCount);
  uint64_t v16 = v15;
  if (outCount)
  {
    unint64_t v17 = 0;
    p_name = &v15->name;
    do
    {
      Name = sel_getName(*p_name);
      if (!strncmp(Name, "startOperation:", 0xFuLL)) {
        [v3 setInterface:v4 forSelector:*p_name argumentIndex:0 ofReply:0];
      }
      ++v17;
      p_name += 2;
    }
    while (v17 < outCount);
  }
  free(v16);
}

id CKShareFunction()
{
  return (id)classCKShare;
}

Class initCKShare()
{
  CloudKitLibrary_0();
  Class result = objc_getClass("CKShare");
  classCKShare = (uint64_t)result;
  getCKShareClass = (uint64_t (*)())CKShareFunction;
  return result;
}

void __BRCXPCInterface_block_invoke()
{
  v182[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_opt_new();
  v1 = (void *)BRCXPCInterface_iface;
  BRCXPCInterface_iface = v0;

  int v2 = FPIsCloudDocsWithFPFSEnabled();
  id v3 = (void **)&protocolRef_BRProtocolFPFS;
  id v4 = &protocolRef_BRProtocolLegacy;
  if (v2) {
    id v4 = &protocolRef_BRProtocolFPFS;
  }
  [(id)BRCXPCInterface_iface setProtocol:*v4];
  v182[0] = objc_opt_class();
  v182[1] = objc_opt_class();
  v182[2] = objc_opt_class();
  v182[3] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v182 count:4];
  id v6 = (void *)BRCXPCInterface_iface;
  uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  [v6 setClasses:v7 forSelector:sel_setupInstanceWithDict_reply_ argumentIndex:0 ofReply:0];

  if ((FPIsCloudDocsWithFPFSEnabled() & 1) == 0)
  {
    BRCSetupGenericOperations(&unk_1EF1563F8, (void *)BRCXPCInterface_iface);
    id v3 = (void **)&protocolRef_BRShareOperationLegacyProtocol;
  }
  BRCSetupGenericOperations(*v3, (void *)BRCXPCInterface_iface);
  BRCSetupGenericOperations(&unk_1EF1512E8, (void *)BRCXPCInterface_iface);
  BRCSetupGenericOperations(&unk_1EF14FF00, (void *)BRCXPCInterface_iface);
  v181[0] = objc_opt_class();
  v181[1] = objc_opt_class();
  v181[2] = objc_opt_class();
  v181[3] = objc_opt_class();
  v181[4] = objc_opt_class();
  v181[5] = objc_opt_class();
  v181[6] = objc_opt_class();
  v181[7] = objc_opt_class();
  v181[8] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v181 count:9];

  uint64_t v9 = objc_opt_new();
  [v9 setProtocol:&unk_1EF138628];
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  [v9 setClasses:v10 forSelector:sel_receiveUpdates_logicalExtensions_physicalExtensions_reply_ argumentIndex:0 ofReply:0];

  v180[0] = objc_opt_class();
  v180[1] = objc_opt_class();
  v180[2] = objc_opt_class();
  v180[3] = objc_opt_class();
  v180[4] = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:5];

  __int16 v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  [v9 setClasses:v12 forSelector:sel_receiveUpdates_logicalExtensions_physicalExtensions_reply_ argumentIndex:1 ofReply:0];

  int v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  [v9 setClasses:v13 forSelector:sel_receiveUpdates_logicalExtensions_physicalExtensions_reply_ argumentIndex:2 ofReply:0];

  v179[0] = objc_opt_class();
  v179[1] = objc_opt_class();
  v179[2] = objc_opt_class();
  v179[3] = objc_opt_class();
  v179[4] = objc_opt_class();
  __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v179 count:5];

  id v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
  [v9 setClasses:v15 forSelector:sel_receiveProgressUpdates_reply_ argumentIndex:0 ofReply:0];

  v168 = v9;
  [(id)BRCXPCInterface_iface setInterface:v9 forSelector:sel_getItemUpdateSenderWithReceiver_reply_ argumentIndex:0 ofReply:0];
  v178[0] = objc_opt_class();
  v178[1] = objc_opt_class();
  v178[2] = objc_opt_class();
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:3];

  unint64_t v17 = (void *)BRCXPCInterface_iface;
  __int16 v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
  [v17 setClasses:v18 forSelector:sel_getItemUpdateSenderWithReceiver_reply_ argumentIndex:1 ofReply:1];

  v19 = objc_opt_new();
  int v21 = BRIsFPFSEnabled(v19, v20);
  uint64_t v22 = &protocolRef_BRItemNotificationSending;
  if (!v21) {
    uint64_t v22 = &protocolRef_BRItemNotificationSendingLegacy;
  }
  [v19 setProtocol:*v22];
  v167 = v19;
  [(id)BRCXPCInterface_iface setInterface:v19 forSelector:sel_getItemUpdateSenderWithReceiver_reply_ argumentIndex:0 ofReply:1];
  int v23 = FPIsCloudDocsWithFPFSEnabled();
  v24 = &selRef_getAttributeValues_forItemIdentifier_reply_;
  if (!v23) {
    v24 = &selRef_getAttributeValues_forItemAtURL_reply_;
  }
  v25 = *v24;
  v177[0] = objc_opt_class();
  v177[1] = objc_opt_class();
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:2];

  v27 = (void *)BRCXPCInterface_iface;
  uint64_t v28 = [MEMORY[0x1E4F1CAD0] setWithArray:v26];
  [v27 setClasses:v28 forSelector:v25 argumentIndex:0 ofReply:0];

  v176[0] = objc_opt_class();
  v176[1] = objc_opt_class();
  v176[2] = objc_opt_class();
  v176[3] = objc_opt_class();
  v176[4] = objc_opt_class();
  v176[5] = objc_opt_class();
  v176[6] = objc_opt_class();
  Class CKRecordIDClass = getCKRecordIDClass();
  if (!CKRecordIDClass) {
    Class CKRecordIDClass = (Class)objc_opt_class();
  }
  v176[7] = CKRecordIDClass;
  uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v176 count:8];

  v31 = (void *)BRCXPCInterface_iface;
  v161 = (void *)v30;
  v32 = [MEMORY[0x1E4F1CAD0] setWithArray:v30];
  [v31 setClasses:v32 forSelector:v25 argumentIndex:0 ofReply:1];

  uint64_t v33 = +[BRContainer classesForDecoding];
  v175[0] = objc_opt_class();
  v175[1] = objc_opt_class();
  id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:2];
  uint64_t v35 = [(id)v33 setByAddingObjectsFromArray:v34];

  [(id)BRCXPCInterface_iface setClasses:v35 forSelector:sel_getContainersNeedingUpload_ argumentIndex:0 ofReply:1];
  v166 = (void *)v35;
  [(id)BRCXPCInterface_iface setClasses:v35 forSelector:sel_getContainersByID_ argumentIndex:0 ofReply:1];
  LOBYTE(v33) = FPIsCloudDocsWithFPFSEnabled();
  v36 = (void *)MEMORY[0x1E4F1CAD0];
  Class v37 = getCKRecordIDClass();
  uint64_t v38 = (uint64_t)v37;
  if (v33)
  {
    if (!v37) {
      uint64_t v38 = objc_opt_class();
    }
    v39 = objc_msgSend(v36, "setWithObjects:", v38, 0);
    [(id)BRCXPCInterface_iface setClasses:v39 forSelector:sel_copyShareIDForItemIdentifier_reply_ argumentIndex:0 ofReply:1];
    __int16 v40 = (void *)MEMORY[0x1E4F1CAD0];
    v174[0] = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    if (!v41) {
      uint64_t v41 = objc_opt_class();
    }
    v174[1] = v41;
    uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v174 count:2];
    v43 = [v40 setWithArray:v42];

    [(id)BRCXPCInterface_iface setClasses:v43 forSelector:sel_listNonLocalVersionsWithItemIdentifier_reply_ argumentIndex:0 ofReply:1];
    unint64_t v44 = 0x1E4F1C000;
  }
  else
  {
    if (!v37) {
      uint64_t v38 = objc_opt_class();
    }
    Class CKRecordZoneIDClass = getCKRecordZoneIDClass();
    if (!CKRecordZoneIDClass) {
      Class CKRecordZoneIDClass = (Class)objc_opt_class();
    }
    uint64_t v46 = objc_opt_class();
    uint64_t v47 = objc_opt_class();
    uint64_t v48 = objc_opt_class();
    v39 = objc_msgSend(v36, "setWithObjects:", v38, CKRecordZoneIDClass, v46, v47, v48, objc_opt_class(), 0);
    [(id)BRCXPCInterface_iface setClasses:v39 forSelector:sel_copyBulkShareIDsAtURLs_reply_ argumentIndex:0 ofReply:1];
    v49 = (void *)BRCXPCInterface_iface;
    unint64_t v44 = 0x1E4F1C000uLL;
    v50 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v51 = objc_opt_class();
    uint64_t v159 = objc_opt_class();
    v43 = objc_msgSend(v50, "setWithObjects:", v51, v159, objc_opt_class(), 0);
    [v49 setClasses:v43 forSelector:sel_copyBulkShareIDsAtURLs_reply_ argumentIndex:0 ofReply:0];
  }

  v52 = *(void **)(v44 + 2768);
  v173[0] = objc_opt_class();
  v173[1] = objc_opt_class();
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v173 count:2];
  uint64_t v54 = [v52 setWithArray:v53];

  v55 = *(void **)(v44 + 2768);
  v172[0] = objc_opt_class();
  v172[1] = objc_opt_class();
  Class v56 = getCKRecordIDClass();
  if (!v56) {
    Class v56 = (Class)objc_opt_class();
  }
  v172[2] = v56;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:3];
  uint64_t v58 = [v55 setWithArray:v57];

  v59 = *(void **)(v44 + 2768);
  v171[0] = objc_opt_class();
  v171[1] = objc_opt_class();
  v171[2] = objc_opt_class();
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v171 count:3];
  uint64_t v61 = [v59 setWithArray:v60];

  [(id)BRCXPCInterface_iface setClasses:v54 forSelector:sel_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply_ argumentIndex:0 ofReply:0];
  v164 = (void *)v58;
  [(id)BRCXPCInterface_iface setClasses:v58 forSelector:sel_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply_ argumentIndex:0 ofReply:1];
  [(id)BRCXPCInterface_iface setClasses:v54 forSelector:sel_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply_ argumentIndex:1 ofReply:1];
  [(id)BRCXPCInterface_iface setClasses:v54 forSelector:sel_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply_ argumentIndex:2 ofReply:1];
  v165 = (void *)v54;
  [(id)BRCXPCInterface_iface setClasses:v54 forSelector:sel_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply_ argumentIndex:3 ofReply:1];
  v163 = (void *)v61;
  [(id)BRCXPCInterface_iface setClasses:v61 forSelector:sel_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply_ argumentIndex:4 ofReply:1];
  v62 = (void *)BRCXPCInterface_iface;
  v63 = *(void **)(v44 + 2768);
  Class CKUserIdentityLookupInfoClass = getCKUserIdentityLookupInfoClass();
  if (!CKUserIdentityLookupInfoClass) {
    Class CKUserIdentityLookupInfoClass = (Class)objc_opt_class();
  }
  uint64_t v65 = objc_opt_class();
  v66 = objc_msgSend(v63, "setWithObjects:", CKUserIdentityLookupInfoClass, v65, objc_opt_class(), 0);
  [v62 setClasses:v66 forSelector:sel_startOperation_toLookupShareParticipants_reply_ argumentIndex:1 ofReply:0];

  v67 = (void *)BRCXPCInterface_iface;
  v68 = *(void **)(v44 + 2768);
  Class CKShareParticipantClass = getCKShareParticipantClass();
  if (!CKShareParticipantClass) {
    Class CKShareParticipantClass = (Class)objc_opt_class();
  }
  uint64_t v70 = objc_opt_class();
  v71 = objc_msgSend(v68, "setWithObjects:", CKShareParticipantClass, v70, objc_opt_class(), 0);
  [v67 setClasses:v71 forSelector:sel_startOperation_toLookupShareParticipants_reply_ argumentIndex:0 ofReply:1];

  v170[0] = objc_opt_class();
  v170[1] = objc_opt_class();
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:2];

  v73 = (void *)BRCXPCInterface_iface;
  v74 = [*(id *)(v44 + 2768) setWithArray:v72];
  [v73 setClasses:v74 forSelector:sel_getLoggedInUserPropertyValuesForKeys_reply_ argumentIndex:0 ofReply:0];

  v169[0] = objc_opt_class();
  v169[1] = objc_opt_class();
  v169[2] = objc_opt_class();
  uint64_t v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:3];

  v76 = (void *)BRCXPCInterface_iface;
  v162 = (void *)v75;
  v77 = [*(id *)(v44 + 2768) setWithArray:v75];
  [v76 setClasses:v77 forSelector:sel_getLoggedInUserPropertyValuesForKeys_reply_ argumentIndex:0 ofReply:1];

  v78 = (void *)BRCXPCInterface_iface;
  v79 = *(void **)(v44 + 2768);
  uint64_t v80 = objc_opt_class();
  uint64_t v81 = objc_opt_class();
  v82 = objc_msgSend(v79, "setWithObjects:", v80, v81, objc_opt_class(), 0);
  [v78 setClasses:v82 forSelector:sel_queryEligibleAccountDescriptorsWithReply_ argumentIndex:0 ofReply:1];

  v83 = (void *)BRCXPCInterface_iface;
  v84 = *(void **)(v44 + 2768);
  uint64_t v85 = objc_opt_class();
  uint64_t v86 = objc_opt_class();
  v87 = objc_msgSend(v84, "setWithObjects:", v85, v86, objc_opt_class(), 0);
  [v83 setClasses:v87 forSelector:sel_queryPathsForPersona_reply_ argumentIndex:0 ofReply:1];

  v88 = (void *)BRCXPCInterface_iface;
  v89 = *(void **)(v44 + 2768);
  uint64_t v90 = objc_opt_class();
  uint64_t v91 = objc_opt_class();
  v92 = objc_msgSend(v89, "setWithObjects:", v90, v91, objc_opt_class(), 0);
  [v88 setClasses:v92 forSelector:sel_enumerateWorkingSetChangesFromChangeToken_limit_completion_ argumentIndex:0 ofReply:1];

  v93 = (void *)BRCXPCInterface_iface;
  v94 = *(void **)(v44 + 2768);
  uint64_t v95 = objc_opt_class();
  v96 = objc_msgSend(v94, "setWithObjects:", v95, objc_opt_class(), 0);
  [v93 setClasses:v96 forSelector:sel_enumerateWorkingSetChangesFromChangeToken_limit_completion_ argumentIndex:1 ofReply:1];

  v97 = (void *)BRCXPCInterface_iface;
  v98 = *(void **)(v44 + 2768);
  uint64_t v99 = objc_opt_class();
  uint64_t v100 = objc_opt_class();
  v101 = objc_msgSend(v98, "setWithObjects:", v99, v100, objc_opt_class(), 0);
  [v97 setClasses:v101 forSelector:sel_enumerateItemsInFolder_sortOrder_offset_limit_completion_ argumentIndex:0 ofReply:1];

  int v102 = FPIsCloudDocsWithFPFSEnabled();
  v103 = (void *)BRCXPCInterface_iface;
  if (v102)
  {
    [(id)BRCXPCInterface_iface setClass:objc_opt_class() forSelector:sel_createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler_ argumentIndex:0 ofReply:0];
    v104 = (void *)BRCXPCInterface_iface;
    v105 = *(void **)(v44 + 2768);
    uint64_t v106 = objc_opt_class();
    uint64_t v107 = objc_opt_class();
    v108 = objc_msgSend(v105, "setWithObjects:", v106, v107, objc_opt_class(), 0);
    [v104 setClasses:v108 forSelector:sel_createItemBasedOnTemplate_fields_contents_options_additionalItemAttributes_completionHandler_ argumentIndex:1 ofReply:1];

    [(id)BRCXPCInterface_iface setClass:objc_opt_class() forSelector:sel_modifyItem_baseVersion_changedFields_contents_options_additionalAttrs_completionHandler_ argumentIndex:0 ofReply:0];
    v109 = (void *)BRCXPCInterface_iface;
    v110 = *(void **)(v44 + 2768);
    uint64_t v111 = objc_opt_class();
    uint64_t v112 = objc_opt_class();
    v113 = objc_msgSend(v110, "setWithObjects:", v111, v112, objc_opt_class(), 0);
    [v109 setClasses:v113 forSelector:sel_modifyItem_baseVersion_changedFields_contents_options_additionalAttrs_completionHandler_ argumentIndex:1 ofReply:1];

    v114 = (void *)BRCXPCInterface_iface;
    v115 = *(void **)(v44 + 2768);
    uint64_t v116 = objc_opt_class();
    uint64_t v117 = objc_opt_class();
    v118 = objc_msgSend(v115, "setWithObjects:", v116, v117, objc_opt_class(), 0);
    [v114 setClasses:v118 forSelector:sel_deleteItemWithIdentifier_baseVersion_options_completionHandler_ argumentIndex:0 ofReply:1];

    v119 = (void *)BRCXPCInterface_iface;
    v120 = *(void **)(v44 + 2768);
    uint64_t v121 = objc_opt_class();
    uint64_t v122 = objc_opt_class();
    uint64_t v123 = objc_opt_class();
    v124 = objc_msgSend(v120, "setWithObjects:", v121, v122, v123, objc_opt_class(), 0);
    [v119 setClasses:v124 forSelector:sel_startDownloadFileObject_options_etagIfLoser_reply_ argumentIndex:0 ofReply:1];

    v125 = (void *)BRCXPCInterface_iface;
    v126 = *(void **)(v44 + 2768);
    uint64_t v127 = objc_opt_class();
    uint64_t v128 = objc_opt_class();
    v129 = objc_msgSend(v126, "setWithObjects:", v127, v128, objc_opt_class(), 0);
    [v125 setClasses:v129 forSelector:sel_enumerateTrashItemsFromRank_limit_completion_ argumentIndex:0 ofReply:1];

    v130 = (void *)BRCXPCInterface_iface;
    v131 = *(void **)(v44 + 2768);
    uint64_t v132 = objc_opt_class();
    uint64_t v133 = objc_opt_class();
    v134 = objc_msgSend(v131, "setWithObjects:", v132, v133, objc_opt_class(), 0);
    [v130 setClasses:v134 forSelector:sel_getQueryItemForBRFileObjectID_reply_ argumentIndex:0 ofReply:1];

    v135 = objc_opt_new();
    [v135 setProtocol:&unk_1EF1564B8];
    [(id)BRCXPCInterface_iface setInterface:v135 forSelector:sel_validateConnectionDomainWithDomainIdentifier_databaseID_backChannel_reply_ argumentIndex:2 ofReply:0];
  }
  else
  {
    v136 = *(void **)(v44 + 2768);
    uint64_t v137 = objc_opt_class();
    uint64_t v138 = objc_opt_class();
    v139 = objc_msgSend(v136, "setWithObjects:", v137, v138, objc_opt_class(), 0);
    [v103 setClasses:v139 forSelector:sel_enumerateAllFoldersWithSortOrder_offset_limit_completion_ argumentIndex:0 ofReply:1];

    v135 = objc_opt_new();
    [v135 setProtocol:&unk_1EF13B2F0];
    [(id)BRCXPCInterface_iface setInterface:v135 forSelector:sel_getPausedFilesList_reply_ argumentIndex:0 ofReply:0];
    v140 = (void *)BRCXPCInterface_iface;
    v141 = *(void **)(v44 + 2768);
    uint64_t v142 = objc_opt_class();
    uint64_t v143 = objc_opt_class();
    v144 = objc_msgSend(v141, "setWithObjects:", v142, v143, objc_opt_class(), 0);
    [v140 setClasses:v144 forSelector:sel_getBackReferencingContainerIDsForURLs_reply_ argumentIndex:0 ofReply:0];

    v160 = (void *)BRCXPCInterface_iface;
    v145 = *(void **)(v44 + 2768);
    uint64_t v146 = objc_opt_class();
    unint64_t v147 = v44;
    uint64_t v148 = objc_opt_class();
    uint64_t v149 = objc_opt_class();
    uint64_t v150 = objc_opt_class();
    uint64_t v151 = objc_opt_class();
    v152 = objc_msgSend(v145, "setWithObjects:", v146, v148, v149, v150, v151, objc_opt_class(), 0);
    [v160 setClasses:v152 forSelector:sel_getBackReferencingContainerIDsForURLs_reply_ argumentIndex:0 ofReply:1];

    v153 = (void *)BRCXPCInterface_iface;
    v154 = *(void **)(v147 + 2768);
    uint64_t v155 = objc_opt_class();
    v156 = objc_msgSend(v154, "setWithObjects:", v155, objc_opt_class(), 0);
    [v153 setClasses:v156 forSelector:sel_startDownloadItemsAtURLs_options_reply_ argumentIndex:0 ofReply:0];

    v157 = objc_opt_new();
    [v157 setProtocol:&unk_1EF137DA0];
    [(id)BRCXPCInterface_iface setInterface:v157 forSelector:sel_getNonLocalVersionSenderWithReceiver_documentURL_includeCachedVersions_reply_ argumentIndex:0 ofReply:0];
    v158 = objc_opt_new();
    [v158 setProtocol:&unk_1EF156518];
    [(id)BRCXPCInterface_iface setInterface:v158 forSelector:sel_getNonLocalVersionSenderWithReceiver_documentURL_includeCachedVersions_reply_ argumentIndex:0 ofReply:1];
  }
}

id CKRecordIDFunction()
{
  return (id)classCKRecordID;
}

Class initCKUserIdentityLookupInfo()
{
  CloudKitLibrary_0();
  Class result = objc_getClass("CKUserIdentityLookupInfo");
  classCKUserIdentityLookupInfo = (uint64_t)result;
  getClass CKUserIdentityLookupInfoClass = (uint64_t (*)())CKUserIdentityLookupInfoFunction;
  return result;
}

Class initCKShareParticipant()
{
  CloudKitLibrary_0();
  Class result = objc_getClass("CKShareParticipant");
  classCKShareParticipant = (uint64_t)result;
  getClass CKShareParticipantClass = (uint64_t (*)())CKShareParticipantFunction;
  return result;
}

void *CloudKitLibrary()
{
  Class result = (void *)CloudKitLibrary_frameworkLibrary;
  if (!CloudKitLibrary_frameworkLibrary)
  {
    Class result = dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 2);
    CloudKitLibrary_frameworkLibrary = (uint64_t)result;
    if (!result) {
      CloudKitLibrary_cold_1();
    }
  }
  return result;
}

void CloudKitLibrary_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!CloudKitLibrary_frameworkLibrary_1)
  {
    CloudKitLibrary_frameworkLibrary_1 = (uint64_t)dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 2);
    if (!CloudKitLibrary_frameworkLibrary_1)
    {
      uint64_t v0 = brc_bread_crumbs((uint64_t)"CloudKitLibrary", 37);
      v1 = brc_default_log(1);
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        int v2 = 136315394;
        id v3 = dlerror();
        __int16 v4 = 2112;
        id v5 = v0;
        _os_log_impl(&dword_19ED3F000, v1, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't open CloudKit : %s%@", (uint8_t *)&v2, 0x16u);
      }
    }
  }
}

Class initCKRecordID()
{
  CloudKitLibrary_0();
  Class result = objc_getClass("CKRecordID");
  classCKRecordID = (uint64_t)result;
  getClass CKRecordIDClass = (uint64_t (*)())CKRecordIDFunction;
  return result;
}

void sub_19ED44F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __brc_monotonic_time_diff_to_interval_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&brc_monotonic_time_diff_to_interval_info);
}

void sub_19ED46014(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id BRCXPCTokenInterface()
{
  if (BRCXPCTokenInterface_once != -1) {
    dispatch_once(&BRCXPCTokenInterface_once, &__block_literal_global_527);
  }
  uint64_t v0 = (void *)BRCXPCTokenInterface_iface;

  return v0;
}

id BRCXPCInterface()
{
  if (BRCXPCInterface_once != -1) {
    dispatch_once(&BRCXPCInterface_once, &__block_literal_global_16);
  }
  uint64_t v0 = (void *)BRCXPCInterface_iface;

  return v0;
}

uint64_t ____brc_create_section_block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = __brc_create_section_lastSectionID + 1;
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v2 = *(void *)(v1 + 24);
  if (*(unsigned char *)(result + 40) != ((v2 & 1) == 0))
  {
    *(void *)(v1 + 24) = v2 + 1;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  __brc_create_section_lastSectionID = v2;
  return result;
}

id BRCopyDisplayNameForContainerAtURL(void *a1, uint64_t a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  __int16 v4 = (void *)MEMORY[0x19F3C4670]();
  id v5 = objc_msgSend(a1, "br_containerIDIfIsDocumentsContainerURL");
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_25;
  }
  if ([v5 isEqualToString:@"com.apple.CloudDocs"])
  {
    uint64_t v7 = +[BRContainer localizedNameForDefaultCloudDocsContainer];
    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"com.apple.Desktop"])
  {
    uint64_t v7 = +[BRContainer localizedNameForDesktopContainer];
    goto LABEL_8;
  }
  if (![v6 isEqualToString:@"com.apple.Documents"])
  {
    uint64_t v10 = [[BRMangledID alloc] initWithAppLibraryName:v6];
    uint64_t v11 = +[BRContainerCache containerCache];
    __int16 v12 = [v11 containerByID:v10];

    if (v12)
    {
      if (a2)
      {
        v18[0] = a2;
        int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      }
      else
      {
        int v13 = 0;
      }
      id v15 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      int v16 = [v13 isEqualToArray:v15];

      if (v16)
      {
      }
      else if (v13)
      {
        uint64_t v8 = [v12 localizedNameWithPreferredLanguages:v13];

        goto LABEL_24;
      }
      uint64_t v8 = [v12 localizedName];
    }
    else
    {
      uint64_t v14 = [v6 rangeOfString:@"." options:4];
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = 0;
      }
      else
      {
        uint64_t v8 = [v6 substringFromIndex:v14 + 1];
      }
      if (![v8 length])
      {

        uint64_t v8 = 0;
      }
    }
LABEL_24:

    if (v8) {
      goto LABEL_9;
    }
LABEL_25:
    id v9 = 0;
    goto LABEL_26;
  }
  uint64_t v7 = +[BRContainer localizedNameForDocumentsContainer];
LABEL_8:
  uint64_t v8 = (void *)v7;
  if (!v7) {
    goto LABEL_25;
  }
LABEL_9:
  id v9 = v8;

LABEL_26:
  return v9;
}

id _BRLocalizedStringWithFormat(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = (objc_class *)NSString;
  id v12 = a3;
  id v13 = a2;
  id v14 = a1;
  id v15 = [v11 alloc];
  int v16 = _BRLocalizedString(v14, v13, v12);

  unint64_t v17 = [MEMORY[0x1E4F1CA20] currentLocale];
  __int16 v18 = (void *)[v15 initWithFormat:v16 locale:v17 arguments:&a9];

  return v18;
}

__CFString *_BRLocalizedString(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v5)
  {
    id v13 = brc_bread_crumbs((uint64_t)"_BRLocalizedString", 33);
    id v14 = brc_default_log(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      _BRLocalizedString_cold_1((uint64_t)v13, v14);
    }
  }
  uint64_t v8 = [v7 localizedStringForKey:v5 value:@"BRC_LOCALIZED_STRING_UNAVAILABLE" table:v6];
  if (v8 == @"BRC_LOCALIZED_STRING_UNAVAILABLE")
  {
    id v9 = brc_bread_crumbs((uint64_t)"_BRLocalizedString", 39);
    uint64_t v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      id v12 = [v7 bundlePath];
      int v15 = 138413058;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      _os_log_fault_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Could not find localized string value for key \"%@\" in %@ at %@%@", (uint8_t *)&v15, 0x2Au);
    }
  }

  return v8;
}

void LBGetMobileContainerForID(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __LBGetMobileContainerForID_block_invoke;
  v9[3] = &unk_1E59AEB00;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  BRGetProcessMobileContainerForID(a1, 0, v9);
}

void BRGetProcessMobileContainerForID(void *a1, _OWORD *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3C4670]();
  memset(v39, 0, sizeof(v39));
  __brc_create_section(0, (uint64_t)"BRGetProcessMobileContainerForID", 345, v39);
  id v8 = brc_bread_crumbs((uint64_t)"BRGetProcessMobileContainerForID", 345);
  id v9 = brc_default_log(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v39[0];
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "BRGetProcessMobileContainerForID";
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v5;
    __int16 v41 = 2048;
    uint64_t v42 = a2;
    __int16 v43 = 2112;
    unint64_t v44 = v8;
    _os_log_debug_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s: container:%@ audit-token:%p%@", buf, 0x34u);
  }

  +[BRAccount startAccountTokenChangeObserverIfNeeded];
  if (_BRLoadUbiquityEntitlements_once == -1)
  {
    if (a2) {
      goto LABEL_5;
    }
LABEL_14:
    if ((_xpc_runtime_is_app_sandboxed() & 1) == 0)
    {
      if ([v5 isEqualToString:@"com.apple.CloudDocs"])
      {
        uint64_t v20 = [MEMORY[0x1E4FB36F8] sharedManager];
        __int16 v21 = [v20 currentPersona];
        char v22 = [v21 isDataSeparatedPersona];

        if ((v22 & 1) == 0)
        {
          v24 = +[BRDaemonConnection mobileDocumentsURL];
          v25 = [[BRMangledID alloc] initWithAppLibraryName:@"com.apple.CloudDocs"];
          v26 = [(BRMangledID *)v25 mangledIDString];
          v27 = [v24 URLByAppendingPathComponent:v26 isDirectory:1];

          v6[2](v6, v27, 0);
          goto LABEL_21;
        }
      }
    }
    if (currentProcessIsContainerProxy || currentProcessUbiquityContainerEntitlements) {
      goto LABEL_6;
    }
LABEL_19:
    uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BRCloudDocsErrorDomain" code:1 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v23);

    goto LABEL_21;
  }
  dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_208);
  if (!a2) {
    goto LABEL_14;
  }
LABEL_5:
  if (!currentProcessIsContainerProxy) {
    goto LABEL_19;
  }
LABEL_6:
  memset(buf, 0, 24);
  __brc_create_section(0, (uint64_t)"BRGetProcessMobileContainerForID", 374, buf);
  id v10 = brc_bread_crumbs((uint64_t)"BRGetProcessMobileContainerForID", 374);
  id v11 = brc_default_log(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    BRGetProcessMobileContainerForID_cold_1();
  }

  long long v37 = *(_OWORD *)buf;
  uint64_t v38 = *(void *)&buf[16];
  id v12 = +[BRDaemonConnection defaultConnection];
  id v13 = (void *)[v12 newSyncProxy];

  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  uint64_t v30 = __BRGetProcessMobileContainerForID_block_invoke;
  v31 = &unk_1E59ADB28;
  long long v34 = v37;
  uint64_t v35 = v38;
  id v14 = v13;
  id v32 = v14;
  id v15 = v5;
  id v33 = v15;
  v36 = a2;
  id v16 = (void *)MEMORY[0x19F3C48D0](&v28);
  if (a2)
  {
    long long v17 = a2[1];
    *(_OWORD *)buf = *a2;
    *(_OWORD *)&buf[16] = v17;
    objc_msgSend(v14, "getContainerURLForID:forProcess:reply:", v15, buf, v16, v28, v29, v30, v31, v32);
  }
  else
  {
    objc_msgSend(v14, "getContainerURLForID:reply:", v15, v16, v28, v29, v30, v31, v32);
  }
  id v18 = [v14 result];
  __int16 v19 = [v14 error];
  ((void (**)(id, void *, void *))v6)[2](v6, v18, v19);

LABEL_21:
  __brc_leave_section((uint64_t)v39);
}

void sub_19ED46C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void __brc_create_section(char a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  if (__brc_create_section_once != -1) {
    dispatch_once(&__brc_create_section_once, &__block_literal_global_1);
  }
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ____brc_create_section_block_invoke_2;
  v8[3] = &unk_1E59AD5F8;
  v8[4] = &v10;
  char v9 = a1;
  dispatch_sync((dispatch_queue_t)__brc_create_section_queue, v8);
  a4[1] = a2;
  a4[2] = 0;
  *a4 = v11[3];
  *((_DWORD *)a4 + 4) = a3;
  _Block_object_dispose(&v10, 8);
}

void sub_19ED46F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __LBGetMobileContainerForID_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LBGetMobileContainerForID_block_invoke_2;
  block[3] = &unk_1E59ADE48;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __BRGetProcessMobileContainerForID_block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v34 = *(_OWORD *)(a1 + 48);
  uint64_t v35 = *(void *)(a1 + 64);
  id v13 = brc_bread_crumbs((uint64_t)"BRGetProcessMobileContainerForID_block_invoke", 379);
  id v14 = brc_default_log(1);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v25 = [v9 path];
    *(_DWORD *)buf = 134218754;
    id v37 = (id)v34;
    __int16 v38 = 2112;
    *(void *)v39 = v25;
    *(_WORD *)&v39[8] = 2112;
    *(void *)&v39[10] = v12;
    __int16 v40 = 2112;
    __int16 v41 = v13;
    _os_log_debug_impl(&dword_19ED3F000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx container url:'%@' %@%@", buf, 0x2Au);
  }
  if (v10)
  {
    id v15 = v10;
    [v15 bytes];
    if (sandbox_extension_consume() < 0)
    {
      int v16 = *__error();
      long long v17 = brc_bread_crumbs((uint64_t)"BRGetProcessMobileContainerForID_block_invoke", 382);
      id v18 = brc_default_log(0);
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        id v37 = v15;
        __int16 v38 = 1024;
        *(_DWORD *)v39 = v16;
        *(_WORD *)&v39[4] = 2112;
        *(void *)&v39[6] = v17;
        _os_log_error_impl(&dword_19ED3F000, v18, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
      }

      *__error() = v16;
    }
  }
  [*(id *)(a1 + 32) setObjResult:v9 error:v12];
  uint64_t v19 = *(void *)(a1 + 72);
  id v20 = *(id *)(a1 + 40);
  id v21 = v11;
  if (!v19)
  {
    if (BRCurrentProcessIsOwningContainerWithID(v20))
    {
      char v22 = [MEMORY[0x1E4F28B50] mainBundle];
      BOOL v23 = +[BRContainer versionOfBundle:v22 changedFromVersion:v21];

      if (v23)
      {
        if (v20)
        {
          id v24 = v20;
        }
        else
        {
          id v24 = [(id)currentProcessUbiquityContainerEntitlements objectAtIndexedSubscript:0];
          if (!v24) {
            goto LABEL_23;
          }
        }
        if (_RefreshContainerMetadataIfNecessary_onceToken != -1) {
          dispatch_once(&_RefreshContainerMetadataIfNecessary_onceToken, &__block_literal_global_225);
        }
        id v26 = (id)_RefreshContainerMetadataIfNecessary_updateContainerMetadataDateByContainerID;
        objc_sync_enter(v26);
        v27 = [(id)_RefreshContainerMetadataIfNecessary_updateContainerMetadataDateByContainerID objectForKeyedSubscript:v24];
        uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v29 = v28;
        if (v27 && ([v28 timeIntervalSinceDate:v27], v30 < 10.0))
        {
          id v33 = brc_bread_crumbs((uint64_t)"_RefreshContainerMetadataIfNecessary", 328);
          v31 = brc_default_log(1);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            __BRGetProcessMobileContainerForID_block_invoke_cold_1();
          }

          objc_sync_exit(v26);
        }
        else
        {
          [(id)_RefreshContainerMetadataIfNecessary_updateContainerMetadataDateByContainerID setObject:v29 forKeyedSubscript:v24];

          objc_sync_exit(v26);
          id v32 = +[BRDaemonConnection defaultConnection];
          id v26 = [v32 remoteObjectProxy];

          [v26 updateContainerMetadataForID:v24];
        }
      }
    }
  }
LABEL_23:

  __brc_leave_section((uint64_t)&v34);
}

void sub_19ED47490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  objc_sync_exit(v11);
  __brc_leave_section((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void __brc_leave_section(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = *(void *)a1;
    if (*(void *)a1)
    {
      uint64_t v2 = brc_bread_crumbs(*(void *)(a1 + 8), *(int *)(a1 + 16));
      uint64_t v3 = brc_default_log(1);
      __int16 v4 = v3;
      if (v1)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          __brc_leave_section_cold_1((uint64_t)v2, v1, v4);
        }
      }
      else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v5 = 134218242;
        uint64_t v6 = v1;
        __int16 v7 = 2112;
        id v8 = v2;
        _os_log_impl(&dword_19ED3F000, v4, OS_LOG_TYPE_INFO, "[INFO] ┗%llx %@", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

uint64_t BRCurrentProcessIsOwningContainerWithID(void *a1)
{
  id v1 = a1;
  if (_BRLoadUbiquityEntitlements_once != -1) {
    dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_208);
  }
  if (!v1)
  {
    if (![(id)currentProcessUbiquityContainerEntitlements count]) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v2 = 1;
    goto LABEL_8;
  }
  if ([(id)currentProcessUbiquityContainerEntitlements containsObject:v1]) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v2 = 0;
LABEL_8:

  return v2;
}

void sub_19ED47F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void BRPerformWithPersonaAndError(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  __int16 v4 = a2;
  if ([v3 isEqualToString:@"__defaultPersonaID__"]) {
    int v5 = 0;
  }
  else {
    int v5 = v3;
  }
  id v6 = v5;
  id v7 = v3;
  if (!v6)
  {
    if (BRPerformWithPersonaAndError___personaOnceToken != -1) {
      dispatch_once(&BRPerformWithPersonaAndError___personaOnceToken, &__block_literal_global_12);
    }
    id v7 = (id)BRPerformWithPersonaAndError___personalPersona;
  }
  id v8 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v9 = [v8 currentPersona];

  char v22 = 0;
  id v10 = [v9 userPersonaUniqueString];
  id v11 = v10;
  if (v10 == v7 || ([v10 isEqualToString:v7] & 1) != 0)
  {
    id v12 = 0;
    id v13 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v21 = 0;
    id v12 = (void *)[v9 copyCurrentPersonaContextWithError:&v21];
    id v14 = v21;
    char v22 = v12;
    if (v14)
    {
      id v15 = brc_bread_crumbs((uint64_t)"BRPerformWithPersonaAndError", 33);
      int v16 = brc_default_log(0);
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
        BRPerformWithPersonaAndError_cold_1((uint64_t)v14, (uint64_t)v15, v16);
      }
    }
    id v13 = [v9 generateAndRestorePersonaContextWithPersonaUniqueString:v7];

    if (v13)
    {
      long long v17 = brc_bread_crumbs((uint64_t)"BRPerformWithPersonaAndError", 33);
      id v18 = brc_default_log(0);
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        id v24 = v3;
        __int16 v25 = 2112;
        id v26 = v13;
        __int16 v27 = 2112;
        uint64_t v28 = v17;
        _os_log_error_impl(&dword_19ED3F000, v18, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_28:
    }
  }
  else
  {
    if (!v6 && ([v9 isDataSeparatedPersona] & 1) == 0)
    {
      long long v17 = brc_bread_crumbs((uint64_t)"BRPerformWithPersonaAndError", 33);
      id v18 = brc_default_log(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        BRPerformWithPersonaAndError_cold_3((uint64_t)v17, v18);
      }
      id v12 = 0;
      id v13 = 0;
      goto LABEL_28;
    }
    uint64_t v19 = brc_bread_crumbs((uint64_t)"BRPerformWithPersonaAndError", 33);
    id v20 = brc_default_log(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      BRPerformWithPersonaAndError_cold_2((uint64_t)v19, v20);
    }

    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    id v12 = 0;
  }
LABEL_11:
  v4[2](v4, v13);

  _BRRestorePersona(&v22);
}

void sub_19ED48280(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void _BRRestorePersona(void *a1)
{
  if (*a1)
  {
    uint64_t v2 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v4 = [v2 currentPersona];

    id v3 = (id)[v4 restorePersonaWithSavedPersonaContext:*a1];
  }
}

uint64_t __BRIsCurrentProcessHasAccessToGroupContainers_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [v3 containsObject:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

id BREntitledApplicationIdentifier(void *a1)
{
  id v1 = [a1 objectForKey:@"application-identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = BRAppIdentifierFromTeamAppTuple(v1);
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t BRIsEntitledForAnyiCloudService(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKey:@"com.apple.developer.icloud-services"];
  if (!v2)
  {
    uint64_t v4 = [v1 objectForKey:@"com.apple.developer.ubiquity-kvstore-identifier"];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v3 = 0;
      char isKindOfClass = 1;
    }
    else
    {
      id v3 = [v1 objectForKey:@"com.apple.developer.ubiquity-container-identifiers"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
      {
        id v6 = [v3 objectAtIndexedSubscript:0];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
      else
      {
        char isKindOfClass = 0;
      }
    }
    goto LABEL_13;
  }
  id v3 = (void *)v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    uint64_t v4 = [v3 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
LABEL_13:

    goto LABEL_14;
  }
  char isKindOfClass = 0;
LABEL_14:

  return isKindOfClass & 1;
}

id BREntitledContainerIdentifiers(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F22460] propertyListWithDictionary:a1];
  uint64_t v2 = BREntitledContainerIdentifiersForPropertyList(v1);

  return v2;
}

id BREntitledContainerIdentifiersForPropertyList(void *a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 objectForKey:@"application-identifier" ofClass:objc_opt_class()];
  id v3 = v2;
  if (!v2)
  {
    uint64_t v4 = 0;
LABEL_9:
    id v7 = 0;
LABEL_19:
    id v12 = 0;
    goto LABEL_20;
  }
  uint64_t v4 = BRAppIdentifierFromTeamAppTuple(v2);

  if (!v4)
  {
    id v3 = 0;
    goto LABEL_9;
  }
  int v5 = [v1 objectForKey:@"com.apple.developer.icloud-services" ofClass:objc_opt_class()];
  id v3 = v5;
  if (v5)
  {
    if ([v5 containsObject:@"CloudDocuments"])
    {
      uint64_t v6 = objc_opt_class();
      id v7 = [v1 objectForKey:@"com.apple.developer.icloud-container-identifiers" ofClass:v6 valuesOfClass:objc_opt_class()];
      if (!v7)
      {
        id v8 = [@"iCloud." stringByAppendingString:v4];
        v20[0] = v8;
        id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    id v7 = [v1 objectForKey:@"com.apple.developer.ubiquity-container-identifiers" ofClass:v9 valuesOfClass:objc_opt_class()];
  }
  if (![v7 count]) {
    goto LABEL_19;
  }
  if (([v7 containsObject:@"com.apple.CloudDocs"] & 1) != 0
    || ([v7 containsObject:@"com.apple.Desktop"] & 1) != 0
    || [v7 containsObject:@"com.apple.Documents"])
  {
    id v10 = brc_bread_crumbs((uint64_t)"BREntitledContainerIdentifiersForPropertyList", 1103);
    id v11 = brc_default_log(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      id v15 = v4;
      __int16 v16 = 2112;
      long long v17 = v3;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_19ED3F000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ has prohibited identifiers in its list of entitled container identifiers: %@%@", (uint8_t *)&v14, 0x20u);
    }

    goto LABEL_19;
  }
  id v7 = v7;
  id v12 = v7;
LABEL_20:

  return v12;
}

id BRAppIdentifierFromTeamAppTuple(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 hasPrefix:@"com.apple."])
  {
    id v2 = v1;
  }
  else if ((unint64_t)[v1 length] > 0xA)
  {
    MEMORY[0x1F4188790]();
    objc_msgSend(v1, "getCharacters:range:", v14, 0, 10);
    for (uint64_t i = 0; i != 20; i += 2)
    {
      int v6 = *(unsigned __int16 *)&v14[i];
      if ((v6 - 65) >= 0x1A && (v6 - 48) >= 0xA)
      {
        id v8 = brc_bread_crumbs((uint64_t)"BRAppIdentifierFromTeamAppTuple", 1032);
        uint64_t v9 = brc_default_log(1);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 138412546;
        id v16 = v1;
        __int16 v17 = 2112;
        __int16 v18 = v8;
        id v10 = "[WARNING] team prefix must only contain characters in [0-9,A-Z] (%@)%@";
        id v11 = v9;
        uint32_t v12 = 22;
        goto LABEL_19;
      }
    }
    if ([v1 characterAtIndex:10] == 46)
    {
      id v2 = [v1 substringFromIndex:11];
      goto LABEL_21;
    }
    id v8 = brc_bread_crumbs((uint64_t)"BRAppIdentifierFromTeamAppTuple", 1037);
    uint64_t v9 = brc_default_log(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      id v10 = "[WARNING] team prefix must be followed by a dot.%@";
      id v11 = v9;
      uint32_t v12 = 12;
LABEL_19:
      _os_log_impl(&dword_19ED3F000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
LABEL_20:

    id v2 = 0;
  }
  else
  {
    id v3 = brc_bread_crumbs((uint64_t)"BRAppIdentifierFromTeamAppTuple", 1022);
    uint64_t v4 = brc_default_log(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v1;
      __int16 v17 = 2112;
      __int16 v18 = v3;
      _os_log_impl(&dword_19ED3F000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] can't extract application ID from '%@'%@", buf, 0x16u);
    }

    id v2 = 0;
  }
LABEL_21:

  return v2;
}

uint64_t BRCopyEntitlementsForSelf()
{
  uint64_t v0 = (void *)xpc_copy_entitlements_for_self();
  if (v0)
  {
    id v1 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v2 = [v1 mutableCopy];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t BRCopyEntitlementsForAuditToken()
{
  uint64_t v0 = (void *)xpc_copy_entitlement_for_token();
  if (v0)
  {
    id v1 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v2 = [v1 mutableCopy];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t __LBGetMobileContainerForID_block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __brc_default_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.clouddocs", "default personal");
  id v1 = (void *)brc_default_log_loggerPersonal;
  brc_default_log_loggerPersonal = (uint64_t)v0;

  brc_default_log_loggerEnterprise = (uint64_t)os_log_create("com.apple.clouddocs", "default enterprise");

  return MEMORY[0x1F41817F8]();
}

uint64_t __BRCXPCTokenInterface_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)BRCXPCTokenInterface_iface;
  BRCXPCTokenInterface_iface = v0;

  uint64_t v2 = (void *)BRCXPCTokenInterface_iface;

  return [v2 setProtocol:&unk_1EF156578];
}

BOOL BRCurrentProcessHasUbiquityContainer()
{
  if (_BRLoadUbiquityEntitlements_once != -1) {
    dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_208);
  }
  if (currentProcessUbiquityContainerEntitlements) {
    BOOL v0 = 0;
  }
  else {
    BOOL v0 = currentProcessIsContainerProxy == 0;
  }
  return !v0;
}

void __LBCopyUbiquityAccountToken_block_invoke()
{
  BOOL v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  queue = dispatch_queue_create("com.apple.clouddocs.roots-cache-queue", v1);

  dispatch_async(queue, &__block_literal_global_16_0);
}

uint64_t brc_notify_get_state(int a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1 == -1) {
    return 2;
  }
  uint64_t state = notify_get_state(a1, a2);
  if (state)
  {
    int v6 = brc_bread_crumbs((uint64_t)"brc_notify_get_state", 69);
    id v7 = brc_default_log(0);
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      v9[0] = 67110146;
      v9[1] = a1;
      __int16 v10 = 2080;
      id v11 = brc_prettyprint_notify_status(state);
      __int16 v12 = 1024;
      int v13 = state;
      __int16 v14 = 2080;
      uint64_t v15 = a3;
      __int16 v16 = 2112;
      __int16 v17 = v6;
      _os_log_error_impl(&dword_19ED3F000, v7, (os_log_type_t)0x90u, "[ERROR] notify_get_state(%d) failed with %s (%d) for '%s'%@", (uint8_t *)v9, 0x2Cu);
    }
  }
  return state;
}

void sub_19ED4A6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *BRAccountTokenChangedNotification()
{
  return @"com.apple.librarian.account-token-changed";
}

void ____brc_create_section_block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  BOOL v0 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("create-log-section", v0);

  uint64_t v2 = (void *)__brc_create_section_queue;
  __brc_create_section_queue = (uint64_t)v1;
}

void sub_19ED4B208(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED4BA84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED4C2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED4C540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, (os_log_type_t)0x90u, a4, (uint8_t *)va, 0x16u);
}

br_pacer *br_pacer_create(const char *a1, void *a2, double a3)
{
  id v5 = a2;
  int v6 = objc_alloc_init(br_pacer);
  v6->min_fire_interval = a3;
  if (v5)
  {
    id v7 = (OS_dispatch_queue *)v5;
    queue = v6->queue;
    v6->queue = v7;
  }
  else
  {
    queue = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(queue, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(a1, v9);

    id v11 = v6->queue;
    v6->queue = (OS_dispatch_queue *)v10;
  }
  _br_pacer_create_source(v6);

  return v6;
}

void _br_pacer_create_source(void *a1)
{
  dispatch_queue_t v1 = a1;
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, v1[3]);
  dispatch_object_t v3 = v1[1];
  v1[1] = v2;

  dispatch_object_t v4 = v1[1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___br_pacer_create_source_block_invoke;
  v12[3] = &unk_1E59AD3B0;
  id v5 = v1;
  int v13 = v5;
  int v6 = v4;
  id v7 = v12;
  id v8 = v7;
  uint64_t v9 = v7;
  if (brc_block_remember_persona)
  {
    uint64_t v9 = brc_block_remember_persona(v7);
  }
  dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v9);
  dispatch_source_set_event_handler(v6, v10);

  unsigned __int8 v11 = atomic_load(v5 + 56);
  if (v11) {
    dispatch_resume(v1[1]);
  }
}

void br_pacer_set_event_handler(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  dispatch_object_t v4 = v3;
  if (brc_block_remember_persona)
  {
    uint64_t v5 = brc_block_remember_persona(v3);

    dispatch_object_t v4 = (void *)v5;
  }
  uint64_t v6 = MEMORY[0x19F3C48D0](v4);
  id v7 = (void *)v8[4];
  v8[4] = v6;
}

void br_pacer_pretend_event_handler_fired(void *a1)
{
  dispatch_queue_t v1 = a1;
  if (v1)
  {
    v1[5] = CFAbsoluteTimeGetCurrent();
    dispatch_source_t v2 = v1;
    objc_sync_enter(v2);
    dispatch_source_cancel(v2[1]);
    dispatch_source_t v3 = v2[1];
    v2[1] = 0;

    _br_pacer_create_source(v2);
    objc_sync_exit(v2);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"br_pacer_pretend_event_handler_fired", 177);
    dispatch_source_t v2 = (dispatch_source_t *)objc_claimAutoreleasedReturnValue();
    dispatch_object_t v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      br_pacer_pretend_event_handler_fired_cold_1((uint64_t)v2, v4);
    }
  }
}

void sub_19ED4CB44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

intptr_t br_pacer_test_cancel(uint64_t a1)
{
  return dispatch_source_testcancel(*(dispatch_source_t *)(a1 + 8));
}

void br_pacer_cancel(void *a1)
{
  obj = a1;
  objc_sync_enter(obj);
  dispatch_queue_t v1 = obj[1];
  if (v1)
  {
    dispatch_source_cancel(v1);
    dispatch_activate(obj[1]);
  }
  dispatch_source_t v2 = obj[2];
  if (v2)
  {
    dispatch_source_cancel(v2);
    dispatch_activate(obj[2]);
  }
  objc_sync_exit(obj);
}

void br_pacer_signal(void *a1)
{
  obj = a1;
  objc_sync_enter(obj);
  dispatch_source_merge_data(obj[1], 1uLL);
  objc_sync_exit(obj);
}

void br_pacer_resume(unsigned __int8 *a1)
{
  atomic_store(1u, a1 + 56);
  obj = a1;
  objc_sync_enter(obj);
  dispatch_resume(obj[1]);
  objc_sync_exit(obj);
}

void br_pacer_suspend(void *a1)
{
  obj = a1;
  objc_sync_enter(obj);
  dispatch_suspend(obj[1]);
  objc_sync_exit(obj);
}

void br_pacer_signal_at_most_after_min_interval(void *a1)
{
  obj = a1;
  objc_sync_enter(obj);
  if (!*((void *)obj + 2)) {
    schedule_fire_after_delay(obj, obj[6]);
  }
  objc_sync_exit(obj);
}

void sub_19ED4CD4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void schedule_fire_after_delay(void *a1, double a2)
{
  dispatch_source_t v3 = a1;
  objc_sync_enter(v3);
  if (v3[2])
  {
    dispatch_assert_queue_V2(v3[3]);
    dispatch_source_cancel(v3[2]);
    dispatch_source_t v4 = v3[2];
    v3[2] = 0;
  }
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3[3]);
  dispatch_source_t v6 = v3[2];
  v3[2] = v5;

  dispatch_source_t v7 = v3[2];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __schedule_fire_after_delay_block_invoke;
  v17[3] = &unk_1E59AD3B0;
  id v8 = v3;
  uint64_t v18 = v8;
  uint64_t v9 = v7;
  dispatch_block_t v10 = v17;
  unsigned __int8 v11 = v9;
  __int16 v12 = v10;
  int v13 = v12;
  __int16 v14 = v12;
  if (brc_block_remember_persona)
  {
    __int16 v14 = brc_block_remember_persona(v12);
  }
  dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v14);
  dispatch_source_set_event_handler(v11, v15);

  dispatch_time_t v16 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
  dispatch_source_set_timer(v3[2], v16, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(a2 * 1000000000.0));
  dispatch_resume(v3[2]);

  objc_sync_exit(v8);
}

void sub_19ED4CF1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ___br_pacer_create_source_block_invoke(uint64_t a1)
{
  dispatch_queue_t v1 = (dispatch_queue_t *)*(id *)(a1 + 32);
  dispatch_assert_queue_V2(v1[3]);
  dispatch_source_t v7 = v1;
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = v7[5];
  if (v3 == 0.0 || (v4 = Current - v3, double v5 = v7[6], v4 >= v5))
  {
  }
  else
  {
    double v6 = v5 - v4;

    if (v6 > 0.0)
    {
      schedule_fire_after_delay(v7, v6);
      goto LABEL_7;
    }
  }
  fire(v7);
LABEL_7:
}

void fire(void *a1)
{
  dispatch_source_t v2 = a1;
  dispatch_assert_queue_V2(v2[3]);
  *((CFAbsoluteTime *)v2 + 5) = CFAbsoluteTimeGetCurrent();
  if (v2[4])
  {
    dispatch_queue_t v1 = (void *)MEMORY[0x19F3C4670]();
    ((void (*)(void))v2[4][2].isa)();
  }
}

void __schedule_fire_after_delay_block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 24));
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16));
  fire(*(void **)(a1 + 32));
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  objc_sync_exit(obj);
}

uint64_t BRServerInfoRecordInfoReadFrom(uint64_t a1, uint64_t a2)
{
  double v3 = (int *)MEMORY[0x1E4F940E8];
  double v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    dispatch_source_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_35;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_35;
        case 3u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16;
          goto LABEL_35;
        case 4u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 72) |= 1u;
          break;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_35;
        case 6u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 48;
          goto LABEL_35;
        case 7u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_35;
        case 8u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 64;
LABEL_35:
          id v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
        *(void *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0) {
          goto LABEL_39;
        }
        v20 += 7;
        BOOL v14 = v21++ >= 9;
        if (v14)
        {
          uint64_t v22 = 0;
          goto LABEL_41;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v22 = 0;
      }
LABEL_41:
      *(void *)(a1 + 8) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

const char *brc_prettyprint_notify_status(int a1)
{
  int v1 = a1 - 1;
  uint64_t result = "'invalid_name'";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "'invalid_token'";
      break;
    case 2:
      uint64_t result = "'invalid_port'";
      break;
    case 3:
      uint64_t result = "'invalid_file'";
      break;
    case 4:
      uint64_t result = "'invalid_signal'";
      break;
    case 5:
      uint64_t result = "'invalid_request'";
      break;
    case 6:
      uint64_t result = "'not_authorized'";
      break;
    default:
      if ("'invalid_name'" == 1000000) {
        uint64_t result = "'failed'";
      }
      else {
        uint64_t result = "unknown status";
      }
      break;
  }
  return result;
}

uint64_t brc_notify_register_check(const char *a1, int *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = notify_register_check(a1, a2);
  if (v3)
  {
    double v4 = brc_bread_crumbs((uint64_t)"brc_notify_register_check", 79);
    double v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      int v7 = 136315906;
      char v8 = a1;
      __int16 v9 = 2080;
      unint64_t v10 = brc_prettyprint_notify_status(v3);
      __int16 v11 = 1024;
      int v12 = v3;
      __int16 v13 = 2112;
      BOOL v14 = v4;
      _os_log_error_impl(&dword_19ED3F000, v5, (os_log_type_t)0x90u, "[ERROR] notify_register_check(%s) failed with %s (%d)%@", (uint8_t *)&v7, 0x26u);
    }
  }
  return v3;
}

void sub_19ED4E34C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_19ED4E8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _BRRestorePersona(va);
  _Unwind_Resume(a1);
}

void sub_19ED4EDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19ED4F540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19ED4FAFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18)
{
}

void sub_19ED50150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19ED506A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19ED50B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19ED51630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_19ED517A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void BRPerformWithAccountDescriptor(void *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __BRPerformWithAccountDescriptor_block_invoke;
  v5[3] = &unk_1E59AD510;
  id v6 = v3;
  id v4 = v3;
  BRPerformWithAccountDescriptorAndError(a1, v5);
}

void BRPerformWithAccountDescriptorAndError(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 personaIdentifier];
  BRPerformWithPersonaAndError(v4, v3);
}

uint64_t __BRPerformWithAccountDescriptor_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __br_notify_register_dispatch_block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (BRPreserveUploadedDataXattrKey_block_invoke___personaOnceToken != -1) {
      dispatch_once(&BRPreserveUploadedDataXattrKey_block_invoke___personaOnceToken, &__block_literal_global_214);
    }
    id v3 = (id)BRPreserveUploadedDataXattrKey_block_invoke___personalPersona;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  double v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v6 = [v5 currentPersona];

  id v25 = 0;
  id v7 = [v6 userPersonaUniqueString];
  char v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0) {
    goto LABEL_9;
  }
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      unsigned int v21 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      uint64_t v22 = brc_default_log(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.5();
      }
    }
    else
    {
      uint64_t v17 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      uint64_t v18 = brc_default_log(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.4();
      }

      BOOL v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      if (v14) {
        goto LABEL_25;
      }
    }
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  id v24 = 0;
  __int16 v9 = (void *)[v6 copyCurrentPersonaContextWithError:&v24];
  id v10 = v24;
  id v11 = v25;
  id v25 = v9;

  if (v10)
  {
    int v12 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
    __int16 v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
      -[BRAccount containerWithPendingChanges]();
    }
  }
  BOOL v14 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

  if (!v14) {
    goto LABEL_9;
  }
  uint64_t v15 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
  dispatch_time_t v16 = brc_default_log(0);
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    uint64_t v29 = v14;
    __int16 v30 = 2112;
    v31 = v15;
    _os_log_error_impl(&dword_19ED3F000, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  uint64_t v19 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 136);
  char v20 = brc_default_log(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    __br_notify_register_dispatch_block_invoke_cold_1(a1);
  }

LABEL_10:
  _BRRestorePersona(&v25);
}

void sub_19ED529A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_2()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  int v1 = (void *)BRPreserveUploadedDataXattrKey_block_invoke___personalPersona;
  BRPreserveUploadedDataXattrKey_block_invoke___personalPersona = v0;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, (os_log_type_t)0x90u, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id _getCloudDocsAppSupportURL()
{
  unsigned int v0 = 0;
  do
  {
    int v1 = +[BRDaemonConnection cloudDocsAppSupportURL];
    if (v1) {
      BOOL v2 = 1;
    }
    else {
      BOOL v2 = v0 >= 2;
    }
    ++v0;
  }
  while (!v2);

  return v1;
}

void sub_19ED541BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED546B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED5508C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void __dispatch_async_with_logs_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  BOOL v2 = brc_bread_crumbs((uint64_t)"dispatch_async_with_logs_block_invoke", 264);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32));
    *(_DWORD *)buf = 134218498;
    uint64_t v8 = v5;
    __int16 v9 = 2080;
    id v10 = label;
    __int16 v11 = 2112;
    int v12 = v2;
    _os_log_debug_impl(&dword_19ED3F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx continuing on %s%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __brc_leave_section((uint64_t)&v5);
}

void sub_19ED55520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_19ED563B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void _reportPosixWriteError(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v10 = (void *)MEMORY[0x1E4F28C58];
  id v11 = a2;
  int v12 = objc_msgSend(v10, "br_errorFromErrno");
  uint64_t v13 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];

  if (a1)
  {
    uint64_t v14 = *MEMORY[0x1E4F1D140];
    v26[0] = *MEMORY[0x1E4F28A50];
    v26[1] = v14;
    v27[0] = v12;
    v27[1] = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    *a1 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:v15];
  }
  dispatch_time_t v16 = brc_bread_crumbs((uint64_t)"_reportPosixWriteError", 84);
  uint64_t v17 = brc_default_log(0);
  if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v19 = v13;
    __int16 v20 = 2080;
    unsigned int v21 = strerror([v12 code]);
    __int16 v22 = 1024;
    int v23 = [v12 code];
    __int16 v24 = 2112;
    id v25 = v16;
    _os_log_error_impl(&dword_19ED3F000, v17, (os_log_type_t)0x90u, "[ERROR] %@: %s(%d)%@", buf, 0x26u);
  }
}

uint64_t brc_xattr_set_string(int fd, char *name, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (([a3 getCString:__s maxLength:1024 encoding:4] & 1) == 0)
    {
      long long v5 = brc_bread_crumbs((uint64_t)"brc_xattr_set_string", 44);
      uint64_t v6 = brc_default_log(0);
      if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
        brc_xattr_set_string_cold_1();
      }
    }
    size_t v7 = strlen(__s);
    return fsetxattr(fd, name, __s, v7 + 1, 0, 0);
  }
  else
  {
    return fremovexattr(fd, name, 0);
  }
}

id brc_xattr_get_fs_string(const char *a1, const char *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  ssize_t v2 = getxattr(a1, a2, value, 0x2FDuLL, 0, 1);
  if (v2 < 0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    value[v2 - 1] = 0;
    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v4 = [v3 stringWithFileSystemRepresentation:value length:strlen(value)];
  }

  return v4;
}

void sub_19ED57610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 176), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED57B2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

id OSVersion()
{
  if (OSVersion_pred != -1) {
    dispatch_once(&OSVersion_pred, &__block_literal_global_3);
  }
  unsigned int v0 = (void *)OSVersion_OSVersion;

  return v0;
}

void __OSVersion_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(void *)uint64_t v6 = 0x4100000001;
  size_t v5 = 20;
  if (sysctl(v6, 2u, v7, &v5, 0, 0) < 0)
  {
    int v2 = *__error();
    id v3 = brc_bread_crumbs((uint64_t)"OSVersion_block_invoke", 24);
    uint64_t v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      __OSVersion_block_invoke_cold_1((uint64_t)v3, v2, v4);
    }

    *__error() = v2;
  }
  else
  {
    v7[19] = 0;
    uint64_t v0 = [[NSString alloc] initWithUTF8String:v7];
    int v1 = (void *)OSVersion_OSVersion;
    OSVersion_OSVersion = v0;
  }
}

__CFString *BRVersion()
{
  return @"3097.60.161";
}

__CFString *BRPlatform()
{
  return @"ios";
}

void BRTelemetryReportShareInvitation(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = v13;
  if (v9) {
    [v13 setValue:v9 forKey:@"access"];
  }
  if (v10) {
    [v14 setValue:v10 forKey:@"transport"];
  }
  if (v11)
  {
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    [v15 timeIntervalSinceDate:v11];
    double v17 = v16;

    uint64_t v18 = [NSNumber numberWithDouble:v17];
    [v14 setValue:v18 forKey:@"timeTakenToSaveShare"];
  }
  else
  {
    double v17 = -1.0;
  }
  uint64_t v19 = @"unknown";
  __int16 v20 = @"none";
  switch(a4)
  {
    case 0:
      goto LABEL_13;
    case 1:
      goto LABEL_12;
    case 2:
      __int16 v20 = @"readOnly";
      goto LABEL_12;
    case 3:
      __int16 v20 = @"readWrite";
      goto LABEL_12;
    default:
      __int16 v20 = @"unknown";
LABEL_12:
      [v14 setValue:v20 forKey:@"permission"];
      uint64_t v19 = v20;
LABEL_13:
      if (v12)
      {
        unsigned int v21 = NSString;
        __int16 v22 = [v12 domain];
        int v23 = [v21 stringWithFormat:@"%@.%ld", v22, objc_msgSend(v12, "code")];

        [v14 setValue:v23 forKey:@"error"];
      }
      __int16 v24 = brc_bread_crumbs((uint64_t)"BRTelemetryReportShareInvitation", 74);
      id v25 = brc_default_log(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413570;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v10;
        __int16 v30 = 2112;
        v31 = v19;
        __int16 v32 = 2048;
        double v33 = v17;
        __int16 v34 = 2112;
        id v35 = v12;
        __int16 v36 = 2112;
        id v37 = v24;
        _os_log_debug_impl(&dword_19ED3F000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] BRTelemetry sending new share invitation report with access = %@, transport = %@, permission = %@, duration = %f, error = %@%@", buf, 0x3Eu);
      }

      BRTelemetrySendEventToCoreAnalytics(@"com.apple.clouddocsUI.shareInvitation", v14);
      return;
  }
}

void BRTelemetrySendEventToCoreAnalytics(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  AnalyticsIsEventUsed();
  uint64_t v6 = v3;
  id v5 = v3;
  AnalyticsSendEventLazy();
}

void BRTelemetryReportAddPeopleDisplayed(void *a1)
{
  id v1 = a1;
  int v2 = objc_opt_new();
  id v3 = v2;
  if (v1) {
    [v2 setValue:v1 forKey:@"access"];
  }
  id v4 = brc_bread_crumbs((uint64_t)"BRTelemetryReportAddPeopleDisplayed", 83);
  id v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    BRTelemetryReportAddPeopleDisplayed_cold_1((uint64_t)v1, (uint64_t)v4, v5);
  }

  BRTelemetrySendEventToCoreAnalytics(@"com.apple.clouddocsUI.addPeopleDisplayed", v3);
}

void BRTelemetryReportSettingUpiCloudDriveDisplay(void *a1)
{
  id v1 = a1;
  int v2 = objc_opt_new();
  if (v1)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:v1];
    double v5 = v4;

    uint64_t v6 = [NSNumber numberWithDouble:v5];
    [v2 setValue:v6 forKey:@"duration"];

    uint64_t v7 = *(void *)&v5;
  }
  else
  {
    uint64_t v7 = 0xBFF0000000000000;
  }
  uint64_t v8 = brc_bread_crumbs((uint64_t)"BRTelemetryReportSettingUpiCloudDriveDisplay", 94);
  id v9 = brc_default_log(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    BRTelemetryReportSettingUpiCloudDriveDisplay_cold_1((uint64_t)v8, v7, v9);
  }

  BRTelemetrySendEventToCoreAnalytics(@"com.apple.clouddocsUI.settingUpiCloudDrive", v2);
}

id __BRTelemetrySendEventToCoreAnalytics_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

__darwin_time_t brc_current_date_nsec()
{
  v1.tv_sec = 0;
  *(void *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return 1000000000 * v1.tv_sec + 1000 * v1.tv_usec;
}

double brc_interval_from_nsec(uint64_t a1)
{
  return (double)a1 / 1000000000.0;
}

uint64_t brc_interval_to_nsec(double a1)
{
  return (uint64_t)(a1 * 1000000000.0);
}

BOOL brc_is_before_deadline(unint64_t a1, unint64_t a2)
{
  return a1 <= a2;
}

id br_shareCopyWithAttributesStripped(void *a1)
{
  timeval v1 = (void *)[a1 copy];
  br_setShareAssociatedURL(v1, 0);

  return v1;
}

void br_setShareAssociatedURL(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  double v5 = v4;
  if (v3)
  {
    if (v4)
    {
      id v14 = 0;
      uint64_t v6 = [MEMORY[0x1E4F25D80] wrapperWithURL:v4 readonly:1 error:&v14];
      id v7 = v14;
      if (v6)
      {
        id v13 = v7;
        uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v13];
        id v9 = v13;

        if (v8)
        {
          [v3 setTrackChanges:0];
          [v3 setValue:v8 forKey:@"BRAssociatedURLWrapperDataKey"];
          [v3 setTrackChanges:1];
        }
        else
        {
          id v11 = brc_bread_crumbs((uint64_t)"br_setShareAssociatedURL", 154);
          id v12 = brc_default_log(0);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            double v16 = v6;
            __int16 v17 = 2112;
            id v18 = v9;
            __int16 v19 = 2112;
            __int16 v20 = v11;
            _os_log_fault_impl(&dword_19ED3F000, v12, OS_LOG_TYPE_FAULT, "[CRIT] failed to encode wrapper %@: %@%@", buf, 0x20u);
          }
        }
        id v7 = v9;
      }
      else
      {
        uint64_t v8 = brc_bread_crumbs((uint64_t)"br_setShareAssociatedURL", 149);
        id v10 = brc_default_log(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          double v16 = v5;
          __int16 v17 = 2112;
          id v18 = v7;
          __int16 v19 = 2112;
          __int16 v20 = v8;
          _os_log_fault_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_FAULT, "[CRIT] failed to create wrapper for URL %@: %@%@", buf, 0x20u);
        }
      }
    }
    else
    {
      [v3 setTrackChanges:0];
      [v3 setValue:0 forKey:@"BRAssociatedURLWrapperDataKey"];
      [v3 setTrackChanges:1];
    }
  }
}

id br_shareAssociatedURL(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int v2 = v1;
  if (v1
    && ([v1 valueForKey:@"BRAssociatedURLWrapperDataKey"],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (void *)v3;
    id v11 = 0;
    double v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v11];
    id v6 = v11;
    if (!v5)
    {
      id v7 = brc_bread_crumbs((uint64_t)"br_shareAssociatedURL", 176);
      uint64_t v8 = brc_default_log(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v13 = v4;
        __int16 v14 = 2112;
        uint64_t v15 = v2;
        __int16 v16 = 2112;
        __int16 v17 = v7;
        _os_log_fault_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_FAULT, "[CRIT] failed to unarchive url wrapper %@ from share %@%@", buf, 0x20u);
      }
    }
    id v9 = [v5 url];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t BRShareProcessShouldUseDirectConnection()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];

  if ([v1 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];
  }

  return v2;
}

id initCKErrorDomain()
{
  uint64_t v0 = CloudKitLibrary();
  id v1 = (id *)dlsym(v0, "CKErrorDomain");
  if (!v1) {
    initCKErrorDomain_cold_1();
  }
  objc_storeStrong((id *)&constantCKErrorDomain, *v1);
  getCKErrorDomain = (uint64_t (*)())CKErrorDomainFunction;
  uint64_t v2 = (void *)constantCKErrorDomain;

  return v2;
}

id CKErrorDomainFunction()
{
  return (id)constantCKErrorDomain;
}

id initCKPartialErrorsByItemIDKey()
{
  uint64_t v0 = CloudKitLibrary();
  id v1 = (id *)dlsym(v0, "CKPartialErrorsByItemIDKey");
  if (!v1) {
    initCKPartialErrorsByItemIDKey_cold_1();
  }
  objc_storeStrong((id *)&constantCKPartialErrorsByItemIDKey, *v1);
  getCKPartialErrorsByItemIDKey = (uint64_t (*)())CKPartialErrorsByItemIDKeyFunction;
  uint64_t v2 = (void *)constantCKPartialErrorsByItemIDKey;

  return v2;
}

id CKPartialErrorsByItemIDKeyFunction()
{
  return (id)constantCKPartialErrorsByItemIDKey;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, (os_log_type_t)0x90u, a4, &a9, 0xCu);
}

__CFString *BRFileCoordinatorReadingOptionsPrettyPrint(uint64_t a1)
{
  return BRCPrettyPrintBitmap(a1, brc_file_coordination_reading_options);
}

id _fetchSynchronousAutomaticErrorProxyFromURL(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000;
  __int16 v19 = __Block_byref_object_copy__2;
  __int16 v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___fetchSynchronousAutomaticErrorProxyFromURL_block_invoke;
  v12[3] = &unk_1E59ADAB0;
  uint64_t v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  _fetchServiceAutomaticErrorProxyFromURL(v5, v8, v9, 1, v12);
  uint64_t v10 = [(id)v17[5] synchronousRemoteObjectProxy];

  _Block_object_dispose(&v16, 8);

  return v10;
}

void sub_19ED604B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _fetchServiceAutomaticErrorProxyFromURL(void *a1, void *a2, void *a3, int a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  char v13 = [v9 startAccessingSecurityScopedResource];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = ___fetchServiceAutomaticErrorProxyFromURL_block_invoke;
  v21[3] = &unk_1E59ADB00;
  char v26 = v13;
  id v14 = v9;
  id v22 = v14;
  id v23 = v10;
  char v27 = a4;
  id v24 = v11;
  id v25 = v12;
  uint64_t v15 = (void *)MEMORY[0x1E4F28CB8];
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  __int16 v19 = [v15 defaultManager];
  __int16 v20 = v19;
  if (a4) {
    [v19 synchronouslyGetFileProviderServicesForItemAtURL:v14 completionHandler:v21];
  }
  else {
    [v19 getFileProviderServicesForItemAtURL:v14 completionHandler:v21];
  }
}

void ___fetchSynchronousAutomaticErrorProxyFromURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v14)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = v14;
    id v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"broken %@ proxy", *(void *)(a1 + 32)];
    id v9 = [BRXPCAutomaticErrorProxy alloc];
    id v10 = [*(id *)(a1 + 40) protocol];
    uint64_t v11 = [(FPXPCAutomaticErrorProxy *)v9 initWithConnection:0 protocol:v10 orError:v5 name:v8 requestPid:0];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    char v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

void ___fetchServiceAutomaticErrorProxyFromURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (v7)
    {
      int v8 = *(unsigned __int8 *)(a1 + 65);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      char v27 = ___fetchServiceAutomaticErrorProxyFromURL_block_invoke_8;
      __int16 v28 = &unk_1E59ADAD8;
      id v29 = *(id *)(a1 + 40);
      id v32 = *(id *)(a1 + 56);
      id v9 = v7;
      id v30 = v9;
      id v31 = *(id *)(a1 + 48);
      char v33 = *(unsigned char *)(a1 + 65);
      if (v8)
      {
        *(void *)buf = 0;
        id v10 = [v9 fetchFileProviderConnectionAndReturnError:buf];
        uint64_t v11 = *(id *)buf;
        v27((uint64_t)v26, v10, v11);
      }
      else
      {
        uint64_t v11 = v26;
        [v9 getFileProviderConnectionWithCompletionHandler:v11];
      }

      id v24 = v29;
    }
    else
    {
      __int16 v19 = brc_bread_crumbs((uint64_t)"_fetchServiceAutomaticErrorProxyFromURL_block_invoke", 76);
      __int16 v20 = brc_default_log(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(a1 + 40);
        id v22 = [*(id *)(a1 + 32) path];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v21;
        __int16 v35 = 2112;
        id v36 = v22;
        __int16 v37 = 2112;
        id v38 = v5;
        __int16 v39 = 2112;
        __int16 v40 = v19;
        _os_log_impl(&dword_19ED3F000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find service named %@ on %@ in %@%@", buf, 0x2Au);
      }
      uint64_t v23 = *(void *)(a1 + 56);
      id v24 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoBRItemService");
      (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v24);
    }
  }
  else
  {
    if (objc_msgSend(v6, "br_isFileProviderErrorCode:", -1005))
    {
      uint64_t v12 = [v6 userInfo];
      char v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F25C28]];

      if (v13)
      {
        id v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = [*(id *)(a1 + 32) path];
        uint64_t v16 = objc_msgSend(v14, "brc_errorNotInCloud:", v15);

        id v6 = (id)v16;
      }
    }
    id v17 = brc_bread_crumbs((uint64_t)"_fetchServiceAutomaticErrorProxyFromURL_block_invoke", 70);
    id v18 = brc_default_log(0);
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      id v25 = [*(id *)(a1 + 32) path];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v25;
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      id v38 = v17;
      _os_log_error_impl(&dword_19ED3F000, v18, (os_log_type_t)0x90u, "[ERROR] Can't find services for %@: %@%@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void ___fetchServiceAutomaticErrorProxyFromURL_block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs((uint64_t)"_fetchServiceAutomaticErrorProxyFromURL_block_invoke", 85);
    int v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      __int16 v20 = v7;
      _os_log_error_impl(&dword_19ED3F000, v8, (os_log_type_t)0x90u, "[ERROR] Can't get connection for %@: %@%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v9 = [[BRXPCAutomaticErrorProxy alloc] initWithConnection:v5 service:*(void *)(a1 + 40) interface:*(void *)(a1 + 48)];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___fetchServiceAutomaticErrorProxyFromURL_block_invoke_9;
    block[3] = &unk_1E59AD3B0;
    id v14 = *(id *)(a1 + 32);
    if (_block_invoke_onceToken != -1) {
      dispatch_once(&_block_invoke_onceToken, block);
    }
    [v5 _setQueue:_block_invoke_queue];
    [v5 resume];
    uint64_t v10 = *(void *)(a1 + 56);
    if (*(unsigned char *)(a1 + 64)) {
      [(FPXPCAutomaticErrorProxy *)v9 synchronousRemoteObjectProxy];
    }
    else {
    uint64_t v11 = [(FPXPCAutomaticErrorProxy *)v9 remoteObjectProxy];
    }
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
  }
}

void ___fetchServiceAutomaticErrorProxyFromURL_block_invoke_9(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) stringByAppendingString:@"-queue"];
  id v1 = (const char *)[v6 UTF8String];
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(v2, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create(v1, v3);

  id v5 = (void *)_block_invoke_queue;
  _block_invoke_queue = (uint64_t)v4;
}

__CFString *BRLogsAbsolutePath()
{
  return @"/var/log/com.apple.clouddocs.asl";
}

uint64_t BRPostAccountTokenChangedNotification()
{
  uint64_t v0 = (char *)[@"com.apple.librarian.account-token-changed" UTF8String];

  return brc_notify_post(v0);
}

id _BRPromiseURLCombine(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v7)
  {
    if (v8) {
      MEMORY[0x19F3C3D20](v7, v8);
    }
    if (v9 && v10) {
      MEMORY[0x19F3C3D20](v9, v10);
    }
    _CFURLPromiseSetPhysicalURL();
  }

  return v7;
}

void BRCurrentProcessIsNotAppSandboxed()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  abc_report_panic_with_signature(@"BRCurrentProcessIsNotAppSandboxed is not supported on iOS");
  uint64_t v0 = [NSString stringWithFormat:@"BRCurrentProcessIsNotAppSandboxed is not supported on iOS"];
  id v1 = brc_bread_crumbs((uint64_t)"BRCurrentProcessIsNotAppSandboxed", 236);
  uint64_t v2 = brc_default_log(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    uint64_t v3 = brc_append_system_info_to_message(v0);
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    id v8 = v1;
    _os_log_fault_impl(&dword_19ED3F000, v2, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v5, 0x16u);
  }
  brc_append_system_info_to_message(v0);
  dispatch_queue_t v4 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("BRCurrentProcessIsNotAppSandboxed", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/CloudDocs.m", 236, v4);
}

void BRCurrentProcessIsNotAppSandboxedAndHasContainers()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  abc_report_panic_with_signature(@"BRCurrentProcessIsNotAppSandboxedAndHasContainers is not supported on iOS");
  uint64_t v0 = [NSString stringWithFormat:@"BRCurrentProcessIsNotAppSandboxedAndHasContainers is not supported on iOS"];
  id v1 = brc_bread_crumbs((uint64_t)"BRCurrentProcessIsNotAppSandboxedAndHasContainers", 242);
  uint64_t v2 = brc_default_log(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    uint64_t v3 = brc_append_system_info_to_message(v0);
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    id v8 = v1;
    _os_log_fault_impl(&dword_19ED3F000, v2, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v5, 0x16u);
  }
  brc_append_system_info_to_message(v0);
  dispatch_queue_t v4 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("BRCurrentProcessIsNotAppSandboxedAndHasContainers", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/CloudDocs.m", 242, v4);
}

uint64_t BRCurrentProcessIsContainerProxy()
{
  if (_BRLoadUbiquityEntitlements_once != -1) {
    dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_208);
  }
  return currentProcessIsContainerProxy;
}

uint64_t BRCurrentProcessHasAccessToCloudDocsGroupContainers()
{
  if (_BRLoadUbiquityEntitlements_once != -1) {
    dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_208);
  }
  return currentProcessHasAccessToGroupContainers;
}

id BRCopyUbiquityContainerIdentifiersForCurrentProcess()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"BRCopyUbiquityContainerIdentifiersForCurrentProcess", 273, v15);
  uint64_t v0 = brc_bread_crumbs((uint64_t)"BRCopyUbiquityContainerIdentifiersForCurrentProcess", 273);
  id v1 = brc_default_log(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    BRCopyUbiquityContainerIdentifiersForCurrentProcess_cold_2();
  }

  if (_BRLoadUbiquityEntitlements_once != -1) {
    dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_208);
  }
  if (currentProcessUbiquityContainerEntitlements)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = (id)currentProcessUbiquityContainerEntitlements;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v3);
          }
          __int16 v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ((objc_msgSend(v7, "hasSuffix:", @".*", (void)v11) & 1) == 0) {
            [v2 addObject:v7];
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v2 = 0;
  }
  id v8 = brc_bread_crumbs((uint64_t)"BRCopyUbiquityContainerIdentifiersForCurrentProcess", 292);
  uint64_t v9 = brc_default_log(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    BRCopyUbiquityContainerIdentifiersForCurrentProcess_cold_1();
  }

  __brc_leave_section((uint64_t)v15);

  return v2;
}

void sub_19ED61A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t BRForceSyncOnAllContainers(void *a1)
{
  id v2 = +[BRDaemonConnection defaultConnection];
  id v3 = (void *)[v2 newSyncProxy];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __BRForceSyncOnAllContainers_block_invoke;
  v8[3] = &unk_1E59AD448;
  id v4 = v3;
  id v9 = v4;
  [v4 forceSyncContainerID:0 reply:v8];
  uint64_t v5 = [v4 result];
  uint64_t v6 = [v5 BOOLValue];

  if (a1 && (v6 & 1) == 0)
  {
    *a1 = [v4 error];
  }

  return v6;
}

uint64_t __BRForceSyncOnAllContainers_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 == 0 error:a2];
}

uint64_t BRiWorkSyncContainer(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = +[BRDaemonConnection defaultConnection];
  __int16 v7 = (void *)[v6 newSyncProxy];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __BRiWorkSyncContainer_block_invoke;
  v12[3] = &unk_1E59AD448;
  id v8 = v7;
  id v13 = v8;
  [v8 iWorkForceSyncContainerID:v5 ownedByMe:a2 reply:v12];

  id v9 = [v8 result];
  uint64_t v10 = [v9 BOOLValue];

  if (a3 && (v10 & 1) == 0)
  {
    *a3 = [v8 error];
  }

  return v10;
}

uint64_t __BRiWorkSyncContainer_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 == 0 error:a2];
}

void BRGetURLForPublishedItem(void *a1, void *a2)
{
}

void BRGetURLForPublishedItemWithOptions(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x19F3C4670]();
  if (objc_msgSend(v7, "br_isInSyncedLocation"))
  {
    long long v28 = 0uLL;
    uint64_t v29 = 0;
    __brc_create_section(0, (uint64_t)"BRGetURLForPublishedItemWithOptions", 457, &v28);
    uint64_t v10 = brc_bread_crumbs((uint64_t)"BRGetURLForPublishedItemWithOptions", 457);
    long long v11 = brc_default_log(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      BRGetProcessMobileContainerForID_cold_1();
    }

    long long v30 = v28;
    uint64_t v31 = v29;
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __BRGetURLForPublishedItemWithOptions_block_invoke;
      v22[3] = &unk_1E59ADB78;
      long long v24 = v30;
      uint64_t v25 = v31;
      long long v12 = &v23;
      id v13 = v8;
      char v27 = a2;
      id v23 = v13;
      uint64_t v26 = a3;
      objc_msgSend(v7, "_br_fetchItemServiceSyncProxy:", v22);
    }
    else
    {
      uint64_t v15 = +[BRDaemonConnection defaultConnection];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __BRGetURLForPublishedItemWithOptions_block_invoke_2;
      v18[3] = &unk_1E59ADBA0;
      long long v20 = v30;
      uint64_t v21 = v31;
      long long v12 = &v19;
      id v16 = v8;
      id v19 = v16;
      uint64_t v17 = [v15 remoteObjectProxyWithErrorHandler:v18];

      [v17 getPublishedURLForItemAtURL:v7 forStreaming:a2 requestedTTL:a3 reply:v16];
    }
  }
  else
  {
    long long v14 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v7);
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v14);
  }
}

void __BRGetURLForPublishedItemWithOptions_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    long long v13 = *(_OWORD *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 56);
    id v7 = brc_bread_crumbs((uint64_t)"BRGetURLForPublishedItemWithOptions_block_invoke", 462);
    id v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      long long v20 = v7;
      _os_log_debug_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx failed getting Item Service failed: %@%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    __brc_leave_section((uint64_t)&v13);
  }
  else
  {
    uint64_t v9 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 64);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __BRGetURLForPublishedItemWithOptions_block_invoke_25;
    v11[3] = &unk_1E59ADB50;
    id v12 = *(id *)(a1 + 32);
    [v5 getPublishedURLForStreaming:v9 requestedTTL:v10 reply:v11];
  }
}

void sub_19ED62158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __BRGetURLForPublishedItemWithOptions_block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __BRGetURLForPublishedItemWithOptions_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  id v4 = brc_bread_crumbs((uint64_t)"BRGetURLForPublishedItemWithOptions_block_invoke_2", 473);
  id v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    long long v13 = v4;
    _os_log_debug_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx getting container failed: %@%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  __brc_leave_section((uint64_t)&v6);
}

void sub_19ED622BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void BRRegisterInitialSyncHandlerForContainer(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)MEMORY[0x19F3C4670]();
  memset(v10, 0, sizeof(v10));
  __brc_create_section(0, (uint64_t)"BRRegisterInitialSyncHandlerForContainer", 485, v10);
  long long v6 = brc_bread_crumbs((uint64_t)"BRRegisterInitialSyncHandlerForContainer", 485);
  uint64_t v7 = brc_default_log(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v12 = v10[0];
    __int16 v13 = 2080;
    uint64_t v14 = "BRRegisterInitialSyncHandlerForContainer";
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s: container:%@%@", buf, 0x2Au);
  }

  if (_BRLoadUbiquityEntitlements_once != -1) {
    dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_208);
  }
  if (currentProcessUbiquityContainerEntitlements)
  {
    id v8 = +[BRDaemonConnection defaultConnection];
    uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:v4];

    [v9 registerInitialSyncBarrierForID:v3 reply:v4];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BRCloudDocsErrorDomain" code:1 userInfo:0];
    v4[2](v4, v9);
  }

  __brc_leave_section((uint64_t)v10);
}

void sub_19ED624E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void BREvictItemAtURL(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = 0;
    char v6 = [v5 evictUbiquitousItemAtURL:v3 error:&v10];
    id v7 = v10;

    if ((v6 & 1) == 0)
    {
      id v8 = brc_bread_crumbs((uint64_t)"BREvictItemAtURL", 505);
      uint64_t v9 = brc_default_log(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v12 = v3;
        __int16 v13 = 2112;
        id v14 = v7;
        __int16 v15 = 2112;
        id v16 = v8;
        _os_log_debug_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed evicting url %@ - %@%@", buf, 0x20u);
      }
    }
    v4[2](v4, v7);
  }
  else
  {
    BREvictItemAtURLWithOptions(v3, 1, v4);
  }
}

void BREvictItemAtURLWithOptions(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  char v6 = a3;
  id v7 = (void *)MEMORY[0x19F3C4670]();
  if (objc_msgSend(v5, "br_isInSyncedLocation"))
  {
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      if ((a2 & 4) != 0)
      {
        id v8 = brc_bread_crumbs((uint64_t)"BREvictItemAtURLWithOptions", 523);
        uint64_t v9 = brc_default_log(1);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          id v14 = v8;
          _os_log_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] We shouldn't be evicting thumbnails in FPFS - only content%@", (uint8_t *)&v13, 0xCu);
        }
      }
      BREvictItemAtURL(v5, v6);
    }
    else
    {
      id v11 = +[BRDaemonConnection defaultConnection];
      id v12 = [v11 remoteObjectProxyWithErrorHandler:v6];

      [v12 evictItemAtURL:v5 options:a2 reply:v6];
    }
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v5);
    v6[2](v6, v10);
  }
}

void BRSynchronousEvictItemAtURLWithOptions(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  char v6 = a3;
  id v7 = (void *)MEMORY[0x19F3C4670]();
  if (objc_msgSend(v5, "br_isInSyncedLocation"))
  {
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      id v8 = brc_bread_crumbs((uint64_t)"BRSynchronousEvictItemAtURLWithOptions", 542);
      uint64_t v9 = brc_default_log(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        BRSynchronousEvictItemAtURLWithOptions_cold_1();
      }

      id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_evictItemAtURL_options_reply_);
      v6[2](v6, 0, v10);
    }
    else
    {
      id v11 = +[BRDaemonConnection defaultConnection];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __BRSynchronousEvictItemAtURLWithOptions_block_invoke;
      v16[3] = &unk_1E59AD510;
      id v12 = v6;
      id v17 = v12;
      int v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v16];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __BRSynchronousEvictItemAtURLWithOptions_block_invoke_2;
      v14[3] = &unk_1E59AD510;
      uint64_t v15 = v12;
      [v13 evictItemAtURL:v5 options:a2 reply:v14];
    }
  }
  else
  {
    v6[2](v6, 0, 0);
  }
}

uint64_t __BRSynchronousEvictItemAtURLWithOptions_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __BRSynchronousEvictItemAtURLWithOptions_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void BRThumbnailChangedAtURL(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)MEMORY[0x19F3C4670]();
  if (objc_msgSend(v3, "br_isInSyncedLocation"))
  {
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      char v6 = brc_bread_crumbs((uint64_t)"BRThumbnailChangedAtURL", 564);
      id v7 = brc_default_log(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        BRThumbnailChangedAtURL_cold_1();
      }

      id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_thumbnailChangedForItemAtURL_reply_);
      v4[2](v4, v8);
    }
    else
    {
      uint64_t v9 = +[BRDaemonConnection defaultConnection];
      id v10 = [v9 remoteObjectProxyWithErrorHandler:v4];

      [v10 thumbnailChangedForItemAtURL:v3 reply:v4];
    }
  }
  else
  {
    v4[2](v4, 0);
  }
}

void BRStartDownloadForItemsWithOptions(void *a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  char v6 = a3;
  id v7 = (void *)MEMORY[0x19F3C4670]();
  if ((objc_msgSend(v5, "br_any_of:", &__block_literal_global_6) & 1) == 0)
  {
    if ([v5 count])
    {
      uint64_t v27 = 0;
      uint64_t v8 = +[BRAccount currentCachedLoggedInAccountWithError:&v27];
      id v16 = (void *)MEMORY[0x1E4F28C58];
      if (v8 | v27)
      {
        id v17 = [v5 objectAtIndexedSubscript:0];
        long long v20 = objc_msgSend(v16, "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v17);
        v6[2](v6, v20);
      }
      else
      {
        id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
        v6[2](v6, v17);
      }
    }
    else
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"urls", v5);
      v6[2](v6, (void *)v8);
    }
LABEL_21:

    goto LABEL_22;
  }
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
          id v22 = 0;
          [(id)v8 startDownloadingUbiquitousItemAtURL:v14 error:&v22];
          id v15 = v22;
          if (v15)
          {
            uint64_t v21 = v15;
            v6[2](v6, v15);

            goto LABEL_21;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v6[2](v6, 0);
    goto LABEL_21;
  }
  id v18 = +[BRDaemonConnection defaultConnection];
  uint64_t v19 = [v18 remoteObjectProxyWithErrorHandler:v6];

  [v19 startDownloadItemsAtURLs:v5 options:a2 reply:v6];
LABEL_22:
}

uint64_t __BRStartDownloadForItemsWithOptions_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "br_isInSyncedLocation");
}

void BRStartDownloadForItems(void *a1, void *a2)
{
}

void BRDumpDatabaseToFileHandle(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)MEMORY[0x19F3C4670]();
  char v6 = +[BRDaemonConnection defaultConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __BRDumpDatabaseToFileHandle_block_invoke;
  v11[3] = &unk_1E59AD510;
  id v7 = v4;
  id v12 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v11];

  id v9 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v10 = objc_msgSend(v9, "br_currentPersonaID");

  [v8 dumpDatabaseTo:v3 containerID:0 personaID:v10 includeAllItems:0 verbose:0 reply:v7];
}

uint64_t __BRDumpDatabaseToFileHandle_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t BRRemoveItemAtURL(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_removeItemFromDisk_reply_);
    if (v4)
    {
      id v5 = brc_bread_crumbs((uint64_t)"BRRemoveItemAtURL", 635);
      char v6 = brc_default_log(0);
      if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      {
        id v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v22 = "BRRemoveItemAtURL";
        __int16 v23 = 2080;
        if (!a2) {
          id v17 = "(ignored by caller)";
        }
        long long v24 = v17;
        __int16 v25 = 2112;
        long long v26 = v4;
        __int16 v27 = 2112;
        long long v28 = v5;
        _os_log_error_impl(&dword_19ED3F000, v6, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a2) {
      *a2 = v4;
    }

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x19F3C4670]();
    id v9 = +[BRDaemonConnection defaultConnection];
    uint64_t v10 = (void *)[v9 newLegacySyncProxy];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __BRRemoveItemAtURL_block_invoke;
    v19[3] = &unk_1E59AD448;
    id v11 = v10;
    id v20 = v11;
    [v11 removeItemFromDisk:v3 reply:v19];
    id v12 = [v11 result];
    uint64_t v7 = [v12 BOOLValue];

    uint64_t v13 = [v11 error];
    if (v13)
    {
      uint64_t v14 = brc_bread_crumbs((uint64_t)"BRRemoveItemAtURL", 646);
      id v15 = brc_default_log(0);
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        id v18 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v22 = "BRRemoveItemAtURL";
        __int16 v23 = 2080;
        if (!a2) {
          id v18 = "(ignored by caller)";
        }
        long long v24 = v18;
        __int16 v25 = 2112;
        long long v26 = v13;
        __int16 v27 = 2112;
        long long v28 = v14;
        _os_log_error_impl(&dword_19ED3F000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a2) {
      *a2 = v13;
    }
  }

  return v7;
}

uint64_t __BRRemoveItemAtURL_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 == 0 error:a2];
}

id BRGetAttributeValuesForItem(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!objc_msgSend(v5, "br_isInSyncedLocation"))
  {
    id v14 = 0;
    goto LABEL_39;
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = *MEMORY[0x1E4F285B8];
  if (([v6 containsObject:*MEMORY[0x1E4F285B8]] & 1) != 0
    || [v6 containsObject:*MEMORY[0x1E4F1C730]])
  {
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    uint64_t v10 = objc_msgSend(v5, "br_cloudDocsContainer");
    if (v10)
    {
      if ([v6 containsObject:v8])
      {
        [v9 removeObject:v8];
        id v11 = [v10 identifier];
        [v7 setObject:v11 forKey:v8];
      }
      uint64_t v12 = *MEMORY[0x1E4F1C730];
      if ([v6 containsObject:*MEMORY[0x1E4F1C730]])
      {
        [v9 removeObject:v12];
        uint64_t v13 = [v10 localizedName];
        [v7 setObject:v13 forKey:v12];
      }
    }
  }
  else
  {
    id v9 = v6;
  }
  uint64_t v15 = *MEMORY[0x1E4F1C690];
  if ([v9 containsObject:*MEMORY[0x1E4F1C690]])
  {
    id v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:v9];
    [v6 removeObject:v15];

    if (([v5 checkPromisedItemIsReachableAndReturnError:0] & 1) == 0)
    {
      id v16 = [v5 lastPathComponent];
      id v17 = objc_msgSend(v16, "br_sideFaultName");

      id v18 = [v5 URLByDeletingLastPathComponent];
      uint64_t v19 = [v18 URLByAppendingPathComponent:v17];

      if (([v19 checkResourceIsReachableAndReturnError:0] & 1) == 0)
      {
        __int16 v25 = brc_bread_crumbs((uint64_t)"BRGetAttributeValuesForItem", 720);
        long long v26 = brc_default_log(1);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          BRGetAttributeValuesForItem_cold_2();
        }

        goto LABEL_27;
      }
    }
    id v20 = objc_msgSend(v5, "br_pathRelativeToMobileDocuments");
    id v17 = v20;
    if (v20) {
      id v21 = v20;
    }

    int v22 = objc_msgSend(v17, "br_isExcludedWithMaximumDepth:", 60);
    if (v22)
    {
      __int16 v23 = brc_bread_crumbs((uint64_t)"BRGetAttributeValuesForItem", 730);
      long long v24 = brc_default_log(1);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        BRGetAttributeValuesForItem_cold_1();
      }
    }
    uint64_t v19 = [NSNumber numberWithInt:v22 ^ 1u];
    [v7 setObject:v19 forKey:v15];
LABEL_27:

    goto LABEL_28;
  }
  id v6 = v9;
LABEL_28:
  if ([v6 count])
  {
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x3032000000;
    uint64_t v48 = __Block_byref_object_copy__3;
    v49 = __Block_byref_object_dispose__3;
    id v50 = 0;
    uint64_t v39 = 0;
    __int16 v40 = &v39;
    uint64_t v41 = 0x3032000000;
    uint64_t v42 = __Block_byref_object_copy__3;
    __int16 v43 = __Block_byref_object_dispose__3;
    id v44 = 0;
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      objc_msgSend(v5, "_br_itemServiceSyncProxy");
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __BRGetAttributeValuesForItem_block_invoke;
      v38[3] = &unk_1E59ADBE8;
      v38[4] = &v39;
      v38[5] = &v45;
      [v27 getAttributeValues:v6 reply:v38];
    }
    else
    {
      long long v28 = +[BRDaemonConnection defaultConnection];
      uint64_t v29 = (void *)[v28 newLegacySyncProxy];

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __BRGetAttributeValuesForItem_block_invoke_2;
      v36[3] = &unk_1E59ADC10;
      id v27 = v29;
      id v37 = v27;
      [v27 getAttributeValues:v6 forItemAtURL:v5 reply:v36];
      uint64_t v30 = [v27 result];
      uint64_t v31 = (void *)v40[5];
      v40[5] = v30;

      uint64_t v32 = [v27 error];
      char v33 = (void *)v46[5];
      v46[5] = v32;
    }
    [v7 addEntriesFromDictionary:v40[5]];
    __int16 v34 = (void *)v46[5];
    if (v34)
    {
      id v14 = 0;
      if (a3) {
        *a3 = v34;
      }
    }
    else
    {
      id v14 = v7;
    }
    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    id v14 = v7;
  }

LABEL_39:

  return v14;
}

void sub_19ED63868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void __BRGetAttributeValuesForItem_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __BRGetAttributeValuesForItem_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

id BRGetAttributeValueForItem(void *a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v14[0] = v5;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a1;
  uint64_t v8 = [v6 arrayWithObjects:v14 count:1];
  id v13 = 0;
  uint64_t v9 = BRGetAttributeValuesForItem(v7, v8, &v13);

  uint64_t v10 = (uint64_t)v13;
  uint64_t v11 = [v9 objectForKey:v5];
  if (!(v11 | v10))
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1002 userInfo:0];
  }
  if (a3 && v10) {
    *a3 = (id) v10;
  }

  return (id)v11;
}

void BRGetTotalApplicationDocumentUsage(void *a1)
{
  id v1 = a1;
  id v2 = +[BRDaemonConnection defaultConnection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __BRGetTotalApplicationDocumentUsage_block_invoke;
  v5[3] = &unk_1E59AD510;
  id v6 = v1;
  id v3 = v1;
  id v4 = [v2 remoteObjectProxyWithErrorHandler:v5];

  [v4 getTotalApplicationDocumentUsageWithReply:v3];
}

uint64_t __BRGetTotalApplicationDocumentUsage_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void BRGetApplicationDocumentUsageInformation(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[BRDaemonConnection defaultConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __BRGetApplicationDocumentUsageInformation_block_invoke;
  v8[3] = &unk_1E59AD510;
  id v9 = v3;
  id v6 = v3;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];

  [v7 getApplicationDocumentUsageInfoForBundleID:v4 withReply:v6];
}

uint64_t __BRGetApplicationDocumentUsageInformation_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t _BRFaultCopyPropertiesOfFaultAtURL()
{
  return _CFURLCopyPropertiesOfPromiseAtURL();
}

uint64_t _BRCopyResourcePropertyForKey()
{
  return MEMORY[0x1F40D9370]();
}

uint64_t _BRSetResourcePropertyForKey()
{
  return MEMORY[0x1F40D9388]();
}

id BRPushTopicGetContainerID(void *a1)
{
  id v1 = a1;
  id v2 = [@"com.apple.icloud-container." stringByAppendingString:@"clouddocs."];
  if ([v1 rangeOfString:v2])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v1 substringFromIndex:v3];
  }

  return v4;
}

id BRAddNetworkReachabilityObserverWithCallbackQueue(void *a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    id v5 = objc_msgSend(@"BRNotificationServerAvailabilityChanges", "br_libnotifyPerUserNotificationName");
    uint64_t v37 = 0;
    id v38 = (int *)&v37;
    uint64_t v39 = 0x2020000000;
    int v40 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __BRAddNetworkReachabilityObserverWithCallbackQueue_block_invoke;
    v33[3] = &unk_1E59ADC48;
    id v36 = &v37;
    id v6 = v5;
    id v34 = v6;
    id v35 = v4;
    id v7 = (void *)MEMORY[0x19F3C48D0](v33);
    id v8 = v6;
    id v9 = (const char *)[v8 UTF8String];
    uint64_t v10 = v38;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __BRAddNetworkReachabilityObserverWithCallbackQueue_block_invoke_2;
    v30[3] = &unk_1E59ADC70;
    uint64_t v32 = &v37;
    id v11 = v7;
    id v31 = v11;
    uint64_t v12 = v3;
    id v13 = v30;
    id v14 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v15 = objc_msgSend(v14, "br_currentPersonaID");

    *(void *)handler = MEMORY[0x1E4F143A8];
    *(void *)&handler[8] = 3221225472;
    *(void *)&handler[16] = __br_notify_register_dispatch_block_invoke_0;
    uint64_t v42 = &unk_1E59AD580;
    id v16 = v15;
    id v43 = v16;
    uint64_t v45 = v9;
    id v17 = v13;
    id v44 = v17;
    uint32_t v18 = notify_register_dispatch(v9, v10 + 6, v12, handler);

    if (v18)
    {
      uint64_t v19 = brc_bread_crumbs((uint64_t)"BRAddNetworkReachabilityObserverWithCallbackQueue", 881);
      id v20 = brc_default_log(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)handler = 67109378;
        *(_DWORD *)&handler[4] = v18;
        *(_WORD *)&handler[8] = 2112;
        *(void *)&handler[10] = v19;
        _os_log_impl(&dword_19ED3F000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't add observer: error code %d%@", handler, 0x12u);
      }
    }
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    id v27 = __BRAddNetworkReachabilityObserverWithCallbackQueue_block_invoke_54;
    long long v28 = &unk_1E59ADC98;
    id v21 = v11;
    id v29 = v21;
    dispatch_async(v12, &v25);
    int v22 = objc_msgSend(NSNumber, "numberWithInt:", v38[6], v25, v26, v27, v28);

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRAddNetworkReachabilityObserverWithCallbackQueue", 858);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v23 = brc_default_log(1);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)handler = 138412290;
      *(void *)&handler[4] = v8;
      _os_log_impl(&dword_19ED3F000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't add observer: no block specified%@", handler, 0xCu);
    }

    int v22 = 0;
  }

  return v22;
}

void sub_19ED64104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t BRNotificationNameForServerAvailabilityChanges()
{
  return objc_msgSend(@"BRNotificationServerAvailabilityChanges", "br_libnotifyPerUserNotificationName");
}

uint64_t __BRAddNetworkReachabilityObserverWithCallbackQueue_block_invoke(uint64_t a1)
{
  uint64_t v3 = 1;
  brc_notify_get_state(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), &v3, [*(id *)(a1 + 32) UTF8String]);
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3 != 0);
}

uint64_t __BRAddNetworkReachabilityObserverWithCallbackQueue_block_invoke_2(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) == a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __BRAddNetworkReachabilityObserverWithCallbackQueue_block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id BRAddNetworkReachabilityObserver(void *a1)
{
  id v2 = dispatch_get_global_queue(9, 0);
  uint64_t v3 = BRAddNetworkReachabilityObserverWithCallbackQueue(v2, a1);

  return v3;
}

void BRRemoveNetworkReachabilityObserver(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    id v4 = brc_bread_crumbs((uint64_t)"BRRemoveNetworkReachabilityObserver", 899);
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      *(void *)id v11 = v4;
      id v6 = "[WARNING] Can't remove observer: given observer is nil%@";
      id v7 = v5;
      uint32_t v8 = 12;
      goto LABEL_8;
    }
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = brc_bread_crumbs((uint64_t)"BRRemoveNetworkReachabilityObserver", 903);
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      *(void *)id v11 = objc_opt_class();
      *(_WORD *)&v11[8] = 2112;
      *(void *)&v11[10] = v4;
      id v9 = *(id *)v11;
      _os_log_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't remove observer: unexpected kind of class (expected: NSNumber, actual: %@)%@", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_11;
  }
  uint32_t v2 = notify_cancel([v1 intValue]);
  if (v2)
  {
    uint32_t v3 = v2;
    id v4 = brc_bread_crumbs((uint64_t)"BRRemoveNetworkReachabilityObserver", 911);
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109378;
      *(_DWORD *)id v11 = v3;
      *(_WORD *)&void v11[4] = 2112;
      *(void *)&v11[6] = v4;
      id v6 = "[WARNING] Can't remove observer: error code %d%@";
      id v7 = v5;
      uint32_t v8 = 18;
LABEL_8:
      _os_log_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
LABEL_12:
}

id BREntitledContainerIdentifiersForProxy(void *a1)
{
  id v1 = [a1 entitlements];
  uint32_t v2 = BREntitledContainerIdentifiers((uint64_t)v1);

  return v2;
}

BOOL BRSyncedDocumentIDForDocumentAtURL(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"fileURL", 0);
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      id v16 = brc_bread_crumbs((uint64_t)"BRSyncedDocumentIDForDocumentAtURL", 1207);
      id v17 = brc_default_log(0);
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        int v22 = "(passed to caller)";
        *(_DWORD *)v49 = 136315906;
        *(void *)&v49[4] = "BRSyncedDocumentIDForDocumentAtURL";
        *(_WORD *)&v49[12] = 2080;
        if (!a4) {
          int v22 = "(ignored by caller)";
        }
        *(void *)&v49[14] = v22;
        *(_WORD *)&v49[22] = 2112;
        id v50 = v15;
        LOWORD(v51) = 2112;
        *(void *)((char *)&v51 + 2) = v16;
        _os_log_error_impl(&dword_19ED3F000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v49, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v15;
    }
    goto LABEL_19;
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"syncedDocumentID", 0);
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      uint32_t v18 = brc_bread_crumbs((uint64_t)"BRSyncedDocumentIDForDocumentAtURL", 1211);
      uint64_t v19 = brc_default_log(0);
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        __int16 v23 = "(passed to caller)";
        *(_DWORD *)v49 = 136315906;
        *(void *)&v49[4] = "BRSyncedDocumentIDForDocumentAtURL";
        *(_WORD *)&v49[12] = 2080;
        if (!a4) {
          __int16 v23 = "(ignored by caller)";
        }
        *(void *)&v49[14] = v23;
        *(_WORD *)&v49[22] = 2112;
        id v50 = v15;
        LOWORD(v51) = 2112;
        *(void *)((char *)&v51 + 2) = v18;
        _os_log_error_impl(&dword_19ED3F000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v49, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v15;
    }
LABEL_19:

    BOOL v11 = 0;
    goto LABEL_23;
  }
  *(void *)v49 = 0;
  *(void *)&v49[8] = v49;
  *(void *)&v49[16] = 0x3032000000;
  id v50 = __Block_byref_object_copy__3;
  *(void *)&long long v51 = __Block_byref_object_dispose__3;
  *((void *)&v51 + 1) = 0;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__3;
  uint64_t v39 = __Block_byref_object_dispose__3;
  id v40 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__3;
  char v33 = __Block_byref_object_dispose__3;
  id v34 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __BRSyncedDocumentIDForDocumentAtURL_block_invoke;
  v24[3] = &unk_1E59ADCE0;
  uint64_t v26 = v49;
  id v27 = &v35;
  long long v28 = &v29;
  id v9 = v8;
  uint64_t v25 = v9;
  objc_msgSend(v7, "br_bookmarkableStringWithEtag:completion:", a3 != 0, v24);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  int v10 = (void *)v30[5];
  BOOL v11 = v10 == 0;
  if (v10)
  {
    id v12 = v10;
    id v13 = brc_bread_crumbs((uint64_t)"BRSyncedDocumentIDForDocumentAtURL", 1235);
    id v14 = brc_default_log(0);
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      id v21 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      uint64_t v42 = "BRSyncedDocumentIDForDocumentAtURL";
      __int16 v43 = 2080;
      if (!a4) {
        id v21 = "(ignored by caller)";
      }
      id v44 = v21;
      __int16 v45 = 2112;
      id v46 = v12;
      __int16 v47 = 2112;
      uint64_t v48 = v13;
      _os_log_error_impl(&dword_19ED3F000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    if (a4) {
      *a4 = v12;
    }
  }
  else
  {
    *a2 = *(id *)(*(void *)&v49[8] + 40);
    if (a3) {
      *a3 = (id) v36[5];
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(v49, 8);
LABEL_23:

  return v11;
}

void sub_19ED64988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

void __BRSyncedDocumentIDForDocumentAtURL_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v18 = v7;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL BRLocateDocumentForSyncedDocumentID(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v14 = 0;
    *a2 = (id)BRCopyDocumentURLForUbiquitousBookmarkData(a1, &v14);
    id v5 = v14;
    if (v14)
    {
      id v6 = brc_bread_crumbs((uint64_t)"BRLocateDocumentForSyncedDocumentID", 1248);
      id v7 = brc_default_log(0);
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      {
        uint64_t v12 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = "BRLocateDocumentForSyncedDocumentID";
        __int16 v17 = 2080;
        if (!a3) {
          uint64_t v12 = "(ignored by caller)";
        }
        id v18 = v12;
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2112;
        int v22 = v6;
        _os_log_error_impl(&dword_19ED3F000, v7, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a3) {
      *a3 = v5;
    }

    return *a2 != 0;
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"fileURL", 0);
    if (v9)
    {
      uint64_t v10 = brc_bread_crumbs((uint64_t)"BRLocateDocumentForSyncedDocumentID", 1243);
      uint64_t v11 = brc_default_log(0);
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        uint64_t v13 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = "BRLocateDocumentForSyncedDocumentID";
        __int16 v17 = 2080;
        if (!a3) {
          uint64_t v13 = "(ignored by caller)";
        }
        id v18 = v13;
        __int16 v19 = 2112;
        id v20 = v9;
        __int16 v21 = 2112;
        int v22 = v10;
        _os_log_error_impl(&dword_19ED3F000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a3) {
      *a3 = v9;
    }

    return 0;
  }
}

uint64_t BRPrepareDocumentForForcedConflict(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (!FPIsCloudDocsWithFPFSEnabled())
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"fileURL", 0);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        __int16 v21 = brc_bread_crumbs((uint64_t)"BRPrepareDocumentForForcedConflict", 1262);
        int v22 = brc_default_log(0);
        if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
        {
          uint64_t v29 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          id v36 = "BRPrepareDocumentForForcedConflict";
          __int16 v37 = 2080;
          if (!a4) {
            uint64_t v29 = "(ignored by caller)";
          }
          id v38 = v29;
          __int16 v39 = 2112;
          id v40 = v10;
          __int16 v41 = 2112;
          uint64_t v42 = v21;
          _os_log_error_impl(&dword_19ED3F000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a4) {
        goto LABEL_6;
      }
LABEL_20:
      uint64_t v13 = 0;
      goto LABEL_32;
    }
    id v10 = [v8 componentsSeparatedByString:@"/"];
    if ([v10 count] == 2)
    {
      if (v9)
      {
        id v14 = +[BRDaemonConnection defaultConnection];
        uint64_t v15 = (void *)[v14 newLegacySyncProxy];

        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __BRPrepareDocumentForForcedConflict_block_invoke;
        v33[3] = &unk_1E59AD448;
        id v16 = v15;
        id v34 = v16;
        [v16 forceConflictForURL:v7 bookmarkData:v8 forcedEtag:v9 reply:v33];
        __int16 v17 = [v16 result];
        uint64_t v13 = [v17 BOOLValue];

        id v18 = [v16 error];
        if (v18)
        {
          __int16 v19 = brc_bread_crumbs((uint64_t)"BRPrepareDocumentForForcedConflict", 1281);
          id v20 = brc_default_log(0);
          if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
          {
            uint64_t v31 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            id v36 = "BRPrepareDocumentForForcedConflict";
            __int16 v37 = 2080;
            if (!a4) {
              uint64_t v31 = "(ignored by caller)";
            }
            id v38 = v31;
            __int16 v39 = 2112;
            id v40 = v18;
            __int16 v41 = 2112;
            uint64_t v42 = v19;
            _os_log_error_impl(&dword_19ED3F000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }
        }
        if (a4) {
          *a4 = v18;
        }

        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"syncedChangeTag", 0);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        uint64_t v25 = brc_bread_crumbs((uint64_t)"BRPrepareDocumentForForcedConflict", 1271);
        uint64_t v26 = brc_default_log(0);
        if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        {
          uint64_t v32 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          id v36 = "BRPrepareDocumentForForcedConflict";
          __int16 v37 = 2080;
          if (!a4) {
            uint64_t v32 = "(ignored by caller)";
          }
          id v38 = v32;
          __int16 v39 = 2112;
          id v40 = v16;
          __int16 v41 = 2112;
          uint64_t v42 = v25;
          _os_log_error_impl(&dword_19ED3F000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (!a4) {
        goto LABEL_30;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"syncedDocumentID", 0);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        uint64_t v23 = brc_bread_crumbs((uint64_t)"BRPrepareDocumentForForcedConflict", 1267);
        long long v24 = brc_default_log(0);
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
        {
          uint64_t v30 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          id v36 = "BRPrepareDocumentForForcedConflict";
          __int16 v37 = 2080;
          if (!a4) {
            uint64_t v30 = "(ignored by caller)";
          }
          id v38 = v30;
          __int16 v39 = 2112;
          id v40 = v16;
          __int16 v41 = 2112;
          uint64_t v42 = v23;
          _os_log_error_impl(&dword_19ED3F000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (!a4)
      {
LABEL_30:
        uint64_t v13 = 0;
        goto LABEL_31;
      }
    }
    id v16 = v16;
    uint64_t v13 = 0;
    *a4 = v16;
LABEL_31:

    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_forceConflictForURL_bookmarkData_forcedEtag_reply_);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    uint64_t v11 = brc_bread_crumbs((uint64_t)"BRPrepareDocumentForForcedConflict", 1257);
    uint64_t v12 = brc_default_log(0);
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      long long v28 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      id v36 = "BRPrepareDocumentForForcedConflict";
      __int16 v37 = 2080;
      if (!a4) {
        long long v28 = "(ignored by caller)";
      }
      id v38 = v28;
      __int16 v39 = 2112;
      id v40 = v10;
      __int16 v41 = 2112;
      uint64_t v42 = v11;
      _os_log_error_impl(&dword_19ED3F000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (!a4) {
    goto LABEL_20;
  }
LABEL_6:
  id v10 = v10;
  uint64_t v13 = 0;
  *a4 = v10;
LABEL_32:

  return v13;
}

uint64_t __BRPrepareDocumentForForcedConflict_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 == 0 error:a2];
}

void BRiWorkSharingSetSharingState(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v10 && v11)
  {
    if (v9)
    {
      if (FPIsCloudDocsWithFPFSEnabled())
      {
        uint64_t v13 = objc_msgSend(v9, "_br_itemServiceSyncProxy");
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __BRiWorkSharingSetSharingState_block_invoke_2;
        v28[3] = &unk_1E59ADD30;
        id v29 = v9;
        uint64_t v30 = v10;
        id v31 = v12;
        [v13 setiWorkPublishingInfo:a2 readonly:a3 reply:v28];
      }
      else
      {
        __int16 v17 = +[BRDaemonConnection defaultConnection];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __BRiWorkSharingSetSharingState_block_invoke_2_93;
        v25[3] = &unk_1E59ADD58;
        id v18 = v10;
        uint64_t v26 = v18;
        id v19 = v12;
        id v27 = v19;
        id v20 = [v17 remoteObjectProxyWithErrorHandler:v25];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __BRiWorkSharingSetSharingState_block_invoke_4;
        v21[3] = &unk_1E59ADD30;
        id v22 = v9;
        uint64_t v23 = v18;
        id v24 = v19;
        [v20 setiWorkPublishingInfoAtURL:v22 publish:a2 readonly:a3 reply:v21];

        uint64_t v13 = v26;
      }
    }
    else
    {
      uint64_t v15 = brc_bread_crumbs((uint64_t)"BRiWorkSharingSetSharingState", 1293);
      id v16 = brc_default_log(0);
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
        BRiWorkSharingSetSharingState_cold_1();
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __BRiWorkSharingSetSharingState_block_invoke;
      block[3] = &unk_1E59ADC98;
      id v33 = v12;
      dispatch_async(v10, block);
      uint64_t v13 = v33;
    }
  }
  else
  {
    uint64_t v13 = brc_bread_crumbs((uint64_t)"BRiWorkSharingSetSharingState", 1289);
    id v14 = brc_default_log(0);
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
      BRiWorkSharingSetSharingState_cold_2();
    }
  }
}

void __BRiWorkSharingSetSharingState_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"fileURL", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __BRiWorkSharingSetSharingState_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs((uint64_t)"BRiWorkSharingSetSharingState_block_invoke_2", 1304);
    id v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl(&dword_19ED3F000, v5, (os_log_type_t)0x90u, "[ERROR] Failed publishing document at %@ - %@%@", buf, 0x20u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __BRiWorkSharingSetSharingState_block_invoke_92;
  void v10[3] = &unk_1E59ADD08;
  id v6 = *(NSObject **)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v7;
  id v8 = v3;
  dispatch_async(v6, v10);
}

uint64_t __BRiWorkSharingSetSharingState_block_invoke_92(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __BRiWorkSharingSetSharingState_block_invoke_2_93(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __BRiWorkSharingSetSharingState_block_invoke_3;
  v7[3] = &unk_1E59ADD08;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __BRiWorkSharingSetSharingState_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __BRiWorkSharingSetSharingState_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs((uint64_t)"BRiWorkSharingSetSharingState_block_invoke_4", 1318);
    id v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl(&dword_19ED3F000, v5, (os_log_type_t)0x90u, "[ERROR] Failed publishing document at %@ - %@%@", buf, 0x20u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __BRiWorkSharingSetSharingState_block_invoke_94;
  void v10[3] = &unk_1E59ADD08;
  id v6 = *(NSObject **)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v7;
  id v8 = v3;
  dispatch_async(v6, v10);
}

uint64_t __BRiWorkSharingSetSharingState_block_invoke_94(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

BOOL BRiWorkSharingGetBadgingSharingState(void *a1, unsigned char *a2, BOOL *a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  if (v7)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v44 = __Block_byref_object_copy__3;
    *(void *)&long long v45 = __Block_byref_object_dispose__3;
    *((void *)&v45 + 1) = 0;
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__3;
    id v33 = __Block_byref_object_dispose__3;
    id v34 = 0;
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      objc_msgSend(v7, "_br_itemServiceSyncProxy");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __BRiWorkSharingGetBadgingSharingState_block_invoke;
      v28[3] = &unk_1E59ADD80;
      void v28[4] = buf;
      v28[5] = &v29;
      [v8 getiWorkPublishingBadgingStatus:v28];
    }
    else
    {
      uint64_t v13 = +[BRDaemonConnection defaultConnection];
      uint64_t v14 = (void *)[v13 newLegacySyncProxy];

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      void v26[2] = __BRiWorkSharingGetBadgingSharingState_block_invoke_2;
      v26[3] = &unk_1E59ADDA8;
      id v8 = v14;
      id v27 = v8;
      [v8 getiWorkPublishingBadgingStatusAtURL:v7 reply:v26];
      uint64_t v15 = [v8 result];
      id v16 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v15;

      uint64_t v17 = [v8 error];
      id v18 = (void *)v30[5];
      v30[5] = v17;
    }
    uint64_t v19 = *(void **)(*(void *)&buf[8] + 40);
    BOOL v12 = v19 != 0;
    if (v19)
    {
      if (a2) {
        *a2 = [v19 intValue] & 1;
      }
      if (a3) {
        *a3 = ([*(id *)(*(void *)&buf[8] + 40) intValue] & 2) != 0;
      }
    }
    else
    {
      id v20 = (id)v30[5];
      if (v20)
      {
        __int16 v21 = brc_bread_crumbs((uint64_t)"BRiWorkSharingGetBadgingSharingState", 1355);
        id v22 = brc_default_log(0);
        if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
        {
          uint64_t v25 = "(passed to caller)";
          *(_DWORD *)uint64_t v35 = 136315906;
          id v36 = "BRiWorkSharingGetBadgingSharingState";
          __int16 v37 = 2080;
          if (!a4) {
            uint64_t v25 = "(ignored by caller)";
          }
          id v38 = v25;
          __int16 v39 = 2112;
          id v40 = v20;
          __int16 v41 = 2112;
          uint64_t v42 = v21;
          _os_log_error_impl(&dword_19ED3F000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v35, 0x2Au);
        }
      }
      if (a4) {
        *a4 = v20;
      }
    }
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"fileURL", 0);
    uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      id v10 = brc_bread_crumbs((uint64_t)"BRiWorkSharingGetBadgingSharingState", 1333);
      id v11 = brc_default_log(0);
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        id v24 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "BRiWorkSharingGetBadgingSharingState";
        *(_WORD *)&unsigned char buf[12] = 2080;
        if (!a4) {
          id v24 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2112;
        id v44 = v9;
        LOWORD(v45) = 2112;
        *(void *)((char *)&v45 + 2) = v10;
        _os_log_error_impl(&dword_19ED3F000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v9;
    }

    BOOL v12 = 0;
  }

  return v12;
}

void sub_19ED65EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Unwind_Resume(a1);
}

void __BRiWorkSharingGetBadgingSharingState_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [NSNumber numberWithInt:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

void __BRiWorkSharingGetBadgingSharingState_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithInt:a2];
  [v4 setObjResult:v7 error:v6];
}

BOOL BRiWorkSharingGetNeedsMigrateAtURL(void *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (v3)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    *(void *)id v36 = 0;
    *(void *)&v36[8] = v36;
    *(void *)&v36[16] = 0x3032000000;
    __int16 v37 = __Block_byref_object_copy__3;
    *(void *)&long long v38 = __Block_byref_object_dispose__3;
    *((void *)&v38 + 1) = 0;
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      objc_msgSend(v3, "_br_itemServiceSyncProxy");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __BRiWorkSharingGetNeedsMigrateAtURL_block_invoke;
      v23[3] = &unk_1E59ADDD0;
      v23[4] = &v24;
      v23[5] = v36;
      [v4 getiWorkNeedsShareMigrate:v23];
    }
    else
    {
      uint64_t v9 = +[BRDaemonConnection defaultConnection];
      id v10 = (void *)[v9 newLegacySyncProxy];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __BRiWorkSharingGetNeedsMigrateAtURL_block_invoke_2;
      v21[3] = &unk_1E59AD498;
      id v4 = v10;
      id v22 = v4;
      [v4 getiWorkNeedsShareMigrateAtURL:v3 reply:v21];
      id v11 = [v4 result];
      char v12 = [v11 BOOLValue];
      *((unsigned char *)v25 + 24) = v12;

      uint64_t v13 = [v4 error];
      uint64_t v14 = *(void **)(*(void *)&v36[8] + 40);
      *(void *)(*(void *)&v36[8] + 40) = v13;
    }
    id v15 = *(id *)(*(void *)&v36[8] + 40);
    if (v15)
    {
      id v16 = brc_bread_crumbs((uint64_t)"BRiWorkSharingGetNeedsMigrateAtURL", 1395);
      uint64_t v17 = brc_default_log(0);
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        uint64_t v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v29 = "BRiWorkSharingGetNeedsMigrateAtURL";
        __int16 v30 = 2080;
        if (!a2) {
          uint64_t v19 = "(ignored by caller)";
        }
        uint64_t v31 = v19;
        __int16 v32 = 2112;
        id v33 = v15;
        __int16 v34 = 2112;
        uint64_t v35 = v16;
        _os_log_error_impl(&dword_19ED3F000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a2) {
      *a2 = v15;
    }

    BOOL v8 = *((unsigned char *)v25 + 24) != 0;
    _Block_object_dispose(v36, 8);

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"fileURL", 0);
    id v5 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      id v6 = brc_bread_crumbs((uint64_t)"BRiWorkSharingGetNeedsMigrateAtURL", 1372);
      id v7 = brc_default_log(0);
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      {
        id v20 = "(passed to caller)";
        *(_DWORD *)id v36 = 136315906;
        *(void *)&void v36[4] = "BRiWorkSharingGetNeedsMigrateAtURL";
        *(_WORD *)&v36[12] = 2080;
        if (!a2) {
          id v20 = "(ignored by caller)";
        }
        *(void *)&v36[14] = v20;
        *(_WORD *)&v36[22] = 2112;
        __int16 v37 = v5;
        LOWORD(v38) = 2112;
        *(void *)((char *)&v38 + 2) = v6;
        _os_log_error_impl(&dword_19ED3F000, v7, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v36, 0x2Au);
      }
    }
    if (a2) {
      *a2 = v5;
    }

    BOOL v8 = 0;
  }

  return v8;
}

void sub_19ED6641C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __BRiWorkSharingGetNeedsMigrateAtURL_block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

uint64_t __BRiWorkSharingGetNeedsMigrateAtURL_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 error:a3];
}

void BRiWorkSharingGetFullSharingInfo(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  BOOL v8 = v7;
  if (v6 && v7)
  {
    if (v5)
    {
      if (FPIsCloudDocsWithFPFSEnabled())
      {
        uint64_t v9 = objc_msgSend(v5, "_br_itemServiceSyncProxy");
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke_2;
        v23[3] = &unk_1E59ADE20;
        uint64_t v24 = v6;
        id v25 = v8;
        [v9 getiWorkPublishingInfo:v23];
      }
      else
      {
        uint64_t v13 = +[BRDaemonConnection defaultConnection];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        void v20[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke_4;
        v20[3] = &unk_1E59ADD58;
        uint64_t v14 = v6;
        __int16 v21 = v14;
        id v15 = v8;
        id v22 = v15;
        id v16 = [v13 remoteObjectProxyWithErrorHandler:v20];

        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke_6;
        v17[3] = &unk_1E59ADE20;
        id v18 = v14;
        id v19 = v15;
        [v16 getiWorkPublishingInfoAtURL:v5 reply:v17];

        uint64_t v9 = v21;
      }
    }
    else
    {
      id v11 = brc_bread_crumbs((uint64_t)"BRiWorkSharingGetFullSharingInfo", 1410);
      char v12 = brc_default_log(0);
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
        BRiWorkSharingSetSharingState_cold_1();
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke;
      block[3] = &unk_1E59ADC98;
      id v27 = v8;
      dispatch_async(v6, block);
      uint64_t v9 = v27;
    }
  }
  else
  {
    uint64_t v9 = brc_bread_crumbs((uint64_t)"BRiWorkSharingGetFullSharingInfo", 1405);
    id v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
      BRiWorkSharingSetSharingState_cold_2();
    }
  }
}

void __BRiWorkSharingGetFullSharingInfo_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"fileURL", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, v2);
}

void __BRiWorkSharingGetFullSharingInfo_block_invoke_2(uint64_t a1, char a2, char a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke_3;
  void v15[3] = &unk_1E59ADDF8;
  id v11 = *(NSObject **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v17 = v10;
  id v18 = v12;
  char v19 = a2;
  char v20 = a3;
  id v16 = v9;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

uint64_t __BRiWorkSharingGetFullSharingInfo_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __BRiWorkSharingGetFullSharingInfo_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke_5;
  v7[3] = &unk_1E59ADD08;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __BRiWorkSharingGetFullSharingInfo_block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

void __BRiWorkSharingGetFullSharingInfo_block_invoke_6(uint64_t a1, char a2, char a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke_7;
  void v15[3] = &unk_1E59ADDF8;
  id v11 = *(NSObject **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v17 = v10;
  id v18 = v12;
  char v19 = a2;
  char v20 = a3;
  id v16 = v9;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

uint64_t __BRiWorkSharingGetFullSharingInfo_block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void BRSharingCopyCurrentUserIdentifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 && v4)
  {
    id v6 = +[BRDaemonConnection defaultConnection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __BRSharingCopyCurrentUserIdentifier_block_invoke;
    void v15[3] = &unk_1E59ADD58;
    id v7 = v3;
    id v16 = v7;
    id v8 = v5;
    id v17 = v8;
    id v9 = [v6 remoteObjectProxyWithErrorHandler:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __BRSharingCopyCurrentUserIdentifier_block_invoke_3;
    v12[3] = &unk_1E59ADE70;
    id v13 = v7;
    id v14 = v8;
    [v9 copyCurrentUserIdentifierWithReply:v12];

    id v10 = v16;
  }
  else
  {
    id v10 = brc_bread_crumbs((uint64_t)"BRSharingCopyCurrentUserIdentifier", 1444);
    id v11 = brc_default_log(0);
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
      BRSharingCopyCurrentUserIdentifier_cold_1();
    }
  }
}

void __BRSharingCopyCurrentUserIdentifier_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __BRSharingCopyCurrentUserIdentifier_block_invoke_2;
  v7[3] = &unk_1E59ADD08;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __BRSharingCopyCurrentUserIdentifier_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __BRSharingCopyCurrentUserIdentifier_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __BRSharingCopyCurrentUserIdentifier_block_invoke_4;
  block[3] = &unk_1E59ADE48;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __BRSharingCopyCurrentUserIdentifier_block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void BRSharingCopyCurrentUserNameAndDisplayHandle(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 && v4)
  {
    id v6 = +[BRDaemonConnection defaultConnection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke;
    void v15[3] = &unk_1E59ADD58;
    id v7 = v3;
    id v16 = v7;
    id v8 = v5;
    id v17 = v8;
    id v9 = [v6 remoteObjectProxyWithErrorHandler:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke_3;
    v12[3] = &unk_1E59ADEC0;
    id v13 = v7;
    id v14 = v8;
    [v9 copyCurrentUserNameAndDisplayHandleWithReply:v12];

    id v10 = v16;
  }
  else
  {
    id v10 = brc_bread_crumbs((uint64_t)"BRSharingCopyCurrentUserNameAndDisplayHandle", 1462);
    id v11 = brc_default_log(0);
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
      BRSharingCopyCurrentUserIdentifier_cold_1();
    }
  }
}

void __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke_2;
  v7[3] = &unk_1E59ADD08;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke_4;
  v17[3] = &unk_1E59ADE98;
  id v12 = *(NSObject **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v21 = v13;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(v12, v17);
}

uint64_t __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void BRSharingCopyCurrentUserNameAndDisplayHandleForURL(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    id v5 = objc_opt_new();
    id v6 = [(BRShareOperation *)[BRShareCopyCurrentUserNameAndDisplayHandleOperation alloc] initWithURL:v3];
    [(BRShareCopyCurrentUserNameAndDisplayHandleOperation *)v6 setShareUserNameCompletionBlock:v4];
    [v5 addOperation:v6];
  }
  else
  {
    id v5 = brc_bread_crumbs((uint64_t)"BRSharingCopyCurrentUserNameAndDisplayHandleForURL", 1480);
    brc_default_log(0);
    id v6 = (BRShareCopyCurrentUserNameAndDisplayHandleOperation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super.super.super.super, (os_log_type_t)0x90u)) {
      BRSharingCopyCurrentUserNameAndDisplayHandleForURL_cold_1();
    }
  }
}

id BRSharingCreateShareForItemAtURL(void *a1, BRShareCreateShareOperation **a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (v3)
  {
    id v4 = [(BRShareOperation *)[BRShareCreateShareOperation alloc] initWithURL:v3];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v34 = __Block_byref_object_copy__3;
    *(void *)&long long v35 = __Block_byref_object_dispose__3;
    *((void *)&v35 + 1) = 0;
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    id v21 = __Block_byref_object_copy__3;
    id v22 = __Block_byref_object_dispose__3;
    id v23 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __BRSharingCreateShareForItemAtURL_block_invoke;
    v17[3] = &unk_1E59ADEE8;
    void v17[4] = buf;
    v17[5] = &v18;
    [(BRShareCreateShareOperation *)v4 setShareCreateCompletionBlock:v17];
    id v5 = objc_opt_new();
    __int16 v32 = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [v5 addOperations:v6 waitUntilFinished:1];

    id v7 = *(void **)(*(void *)&buf[8] + 40);
    if (!v7)
    {
      id v8 = (id)v19[5];
      if (v8)
      {
        id v9 = brc_bread_crumbs((uint64_t)"BRSharingCreateShareForItemAtURL", 1512);
        id v10 = brc_default_log(0);
        if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
        {
          id v16 = "(passed to caller)";
          *(_DWORD *)uint64_t v24 = 136315906;
          id v25 = "BRSharingCreateShareForItemAtURL";
          __int16 v26 = 2080;
          if (!a2) {
            id v16 = "(ignored by caller)";
          }
          id v27 = v16;
          __int16 v28 = 2112;
          id v29 = v8;
          __int16 v30 = 2112;
          uint64_t v31 = v9;
          _os_log_error_impl(&dword_19ED3F000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v24, 0x2Au);
        }
      }
      if (a2) {
        *a2 = (BRShareCreateShareOperation *)v8;
      }

      id v7 = *(void **)(*(void *)&buf[8] + 40);
    }
    id v11 = v7;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"fileURL", 0);
    id v4 = (BRShareCreateShareOperation *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      id v12 = brc_bread_crumbs((uint64_t)"BRSharingCreateShareForItemAtURL", 1494);
      id v13 = brc_default_log(0);
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      {
        id v15 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "BRSharingCreateShareForItemAtURL";
        *(_WORD *)&unsigned char buf[12] = 2080;
        if (!a2) {
          id v15 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        __int16 v34 = (uint64_t (*)(uint64_t, uint64_t))v4;
        LOWORD(v35) = 2112;
        *(void *)((char *)&v35 + 2) = v12;
        _os_log_error_impl(&dword_19ED3F000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a2)
    {
      id v4 = v4;
      id v11 = 0;
      *a2 = v4;
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

void sub_19ED6768C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 144), 8);
  _Unwind_Resume(a1);
}

void __BRSharingCreateShareForItemAtURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id BRSharingCreateShareForItemWithIdentifier(void *a1, BRShareCreateShareOperation **a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (v3)
  {
    id v4 = [(BRShareOperation *)[BRShareCreateShareOperation alloc] initWithItemIdentifier:v3];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v34 = __Block_byref_object_copy__3;
    *(void *)&long long v35 = __Block_byref_object_dispose__3;
    *((void *)&v35 + 1) = 0;
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    id v21 = __Block_byref_object_copy__3;
    id v22 = __Block_byref_object_dispose__3;
    id v23 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __BRSharingCreateShareForItemWithIdentifier_block_invoke;
    v17[3] = &unk_1E59ADEE8;
    void v17[4] = buf;
    v17[5] = &v18;
    [(BRShareCreateShareOperation *)v4 setShareCreateCompletionBlock:v17];
    id v5 = objc_opt_new();
    __int16 v32 = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [v5 addOperations:v6 waitUntilFinished:1];

    uint64_t v7 = *(void **)(*(void *)&buf[8] + 40);
    if (!v7)
    {
      id v8 = (id)v19[5];
      if (v8)
      {
        uint64_t v9 = brc_bread_crumbs((uint64_t)"BRSharingCreateShareForItemWithIdentifier", 1540);
        id v10 = brc_default_log(0);
        if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
        {
          id v16 = "(passed to caller)";
          *(_DWORD *)uint64_t v24 = 136315906;
          id v25 = "BRSharingCreateShareForItemWithIdentifier";
          __int16 v26 = 2080;
          if (!a2) {
            id v16 = "(ignored by caller)";
          }
          id v27 = v16;
          __int16 v28 = 2112;
          id v29 = v8;
          __int16 v30 = 2112;
          uint64_t v31 = v9;
          _os_log_error_impl(&dword_19ED3F000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v24, 0x2Au);
        }
      }
      if (a2) {
        *a2 = (BRShareCreateShareOperation *)v8;
      }

      uint64_t v7 = *(void **)(*(void *)&buf[8] + 40);
    }
    id v11 = v7;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"itemID", 0);
    id v4 = (BRShareCreateShareOperation *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      id v12 = brc_bread_crumbs((uint64_t)"BRSharingCreateShareForItemWithIdentifier", 1522);
      id v13 = brc_default_log(0);
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      {
        id v15 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "BRSharingCreateShareForItemWithIdentifier";
        *(_WORD *)&unsigned char buf[12] = 2080;
        if (!a2) {
          id v15 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        __int16 v34 = (uint64_t (*)(uint64_t, uint64_t))v4;
        LOWORD(v35) = 2112;
        *(void *)((char *)&v35 + 2) = v12;
        _os_log_error_impl(&dword_19ED3F000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a2)
    {
      id v4 = v4;
      id v11 = 0;
      *a2 = v4;
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

void sub_19ED67B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 144), 8);
  _Unwind_Resume(a1);
}

void __BRSharingCreateShareForItemWithIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void BRSharingBulkCopyShareID(void *a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v21 = v5;
  uint64_t v20 = v7;
  if (v6 && (id v8 = v7) != 0)
  {
    if ([v5 count])
    {
      if (FPIsCloudDocsWithFPFSEnabled())
      {
        v40[0] = 0;
        v40[1] = v40;
        v40[2] = 0x3032000000;
        v40[3] = __Block_byref_object_copy__3;
        v40[4] = __Block_byref_object_dispose__3;
        id v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
        v38[0] = 0;
        v38[1] = v38;
        v38[2] = 0x3032000000;
        v38[3] = __Block_byref_object_copy__3;
        v38[4] = __Block_byref_object_dispose__3;
        id v39 = 0;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id obj = v5;
        uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v35 != v10) {
                objc_enumerationMutation(obj);
              }
              id v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              id v13 = objc_msgSend(v12, "_br_itemServiceSyncProxy", v20);
              v33[0] = MEMORY[0x1E4F143A8];
              v33[1] = 3221225472;
              v33[2] = __BRSharingBulkCopyShareID_block_invoke_2;
              v33[3] = &unk_1E59ADF10;
              void v33[4] = v12;
              v33[5] = v38;
              v33[6] = v40;
              [v13 copyShareIDWithReply:v33];
            }
            uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
          }
          while (v9);
        }

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __BRSharingBulkCopyShareID_block_invoke_3;
        block[3] = &unk_1E59ADF38;
        id v30 = v20;
        uint64_t v31 = v40;
        __int16 v32 = v38;
        dispatch_async(v6, block);

        _Block_object_dispose(v38, 8);
        _Block_object_dispose(v40, 8);
      }
      else
      {
        id v16 = +[BRDaemonConnection defaultConnection];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        void v26[2] = __BRSharingBulkCopyShareID_block_invoke_4;
        v26[3] = &unk_1E59ADD58;
        id v17 = v6;
        id v27 = v17;
        id v18 = v20;
        id v28 = v18;
        id v19 = [v16 remoteObjectProxyWithErrorHandler:v26];

        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __BRSharingBulkCopyShareID_block_invoke_6;
        v23[3] = &unk_1E59ADF60;
        uint64_t v24 = v17;
        id v25 = v18;
        [v19 copyBulkShareIDsAtURLs:v21 reply:v23];
      }
    }
    else
    {
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __BRSharingBulkCopyShareID_block_invoke;
      v42[3] = &unk_1E59ADD08;
      id v44 = v8;
      id v43 = v5;
      dispatch_async(v6, v42);
    }
  }
  else
  {
    id v14 = brc_bread_crumbs((uint64_t)"BRSharingBulkCopyShareID", 1550);
    id v15 = brc_default_log(0);
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
      BRSharingCopyCurrentUserIdentifier_cold_1();
    }
  }
}

void sub_19ED680CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void __BRSharingBulkCopyShareID_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"fileURLs", *(void *)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __BRSharingBulkCopyShareID_block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_addPartialError:forURL:toError:", a3, a1[4], *(void *)(*(void *)(a1[5] + 8) + 40));
    uint64_t v5 = *(void *)(a1[5] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v8 = a1[4];
    uint64_t v9 = 0;
  }
  else
  {
    id v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v8 = a1[4];
    uint64_t v9 = a2;
  }

  return [v7 setObject:v9 forKeyedSubscript:v8];
}

uint64_t __BRSharingBulkCopyShareID_block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

void __BRSharingBulkCopyShareID_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __BRSharingBulkCopyShareID_block_invoke_5;
  v7[3] = &unk_1E59ADD08;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __BRSharingBulkCopyShareID_block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __BRSharingBulkCopyShareID_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __BRSharingBulkCopyShareID_block_invoke_7;
  block[3] = &unk_1E59ADE48;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __BRSharingBulkCopyShareID_block_invoke_7(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t BRIsProcessForcingUbiquity()
{
  return 0;
}

void BRDaemonConnectionInvalidate()
{
  uint64_t v0 = +[BRDaemonConnection defaultConnection];
  [v0 invalidate];

  id v1 = +[BRDaemonConnection secondaryConnection];
  [v1 invalidate];
}

uint64_t BRGetMigrationStatusForDSID(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = (void *)MEMORY[0x19F3C4670]();
  if (v1)
  {
    id v3 = [@"icloud-drive.account-migration-status." stringByAppendingString:v1];
    Boolean keyExistsAndHasValidFormat = 0;
    if (!CFPreferencesAppSynchronize((CFStringRef)BRDefaultsDomain))
    {
      uint64_t v4 = brc_bread_crumbs((uint64_t)"BRGetMigrationStatusForDSID", 1665);
      id v5 = brc_default_log(1);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v11 = BRDefaultsDomain;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to synchronize user defaults for %@%@", buf, 0x16u);
      }
    }
    char AppIntegerValue = CFPreferencesGetAppIntegerValue(v3, (CFStringRef)BRDefaultsDomain, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      char v7 = AppIntegerValue;
      if ((AppIntegerValue + 1) < 3)
      {
LABEL_14:

        goto LABEL_15;
      }
      if ((AppIntegerValue - 2) < 2)
      {
        char v7 = 2;
        goto LABEL_14;
      }
      if (AppIntegerValue == 4)
      {
        char v7 = 3;
        goto LABEL_14;
      }
    }
    char v7 = 0;
    goto LABEL_14;
  }
  char v7 = -1;
LABEL_15:

  return v7;
}

uint64_t BRSetMigrationStatusForDSID(void *a1, uint64_t a2)
{
  return BRSetMigrationStatusForDSIDAndUpdateAccount(a1, a2, 1);
}

uint64_t BRSetMigrationStatusForDSIDAndUpdateAccount(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if ((int)BRGetMigrationStatusForDSID(v5) >= (int)a2)
  {
    uint64_t v12 = 1;
  }
  else
  {
    memset(v20, 0, sizeof(v20));
    __brc_create_section(0, (uint64_t)"BRSetMigrationStatusForDSIDAndUpdateAccount", 1688, v20);
    id v6 = brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDAndUpdateAccount", 1688);
    char v7 = brc_default_log(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      *(void *)id v22 = v20[0];
      *(_WORD *)&v22[8] = 1024;
      *(_DWORD *)&v22[10] = a2;
      __int16 v23 = 2112;
      id v24 = v5;
      __int16 v25 = 2112;
      __int16 v26 = v6;
      _os_log_debug_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx setting migration status %d for %@%@", buf, 0x26u);
    }

    id v8 = +[BRDaemonConnection secondaryConnection];
    id v9 = (void *)[v8 newSyncProxy];

    objc_initWeak(&location, v9);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __BRSetMigrationStatusForDSIDAndUpdateAccount_block_invoke;
    v17[3] = &unk_1E59AD4C0;
    objc_copyWeak(&v18, &location);
    [v9 setMigrationStatus:a2 forDSID:v5 shouldUpdateAccount:a3 reply:v17];
    id v10 = [v9 result];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      id v13 = brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDAndUpdateAccount", 1696);
      uint64_t v14 = brc_default_log(0);
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        id v16 = [v9 error];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)id v22 = a2;
        *(_WORD *)&void v22[4] = 2112;
        *(void *)&v22[6] = v5;
        __int16 v23 = 2112;
        id v24 = v16;
        __int16 v25 = 2112;
        __int16 v26 = v13;
        _os_log_error_impl(&dword_19ED3F000, v14, (os_log_type_t)0x90u, "[ERROR] can't set migration status %d for %@: %@%@", buf, 0x26u);
      }
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = 1;
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    __brc_leave_section((uint64_t)v20);
  }

  return v12;
}

void sub_19ED688B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, char a16)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  __brc_leave_section((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void __BRSetMigrationStatusForDSIDAndUpdateAccount_block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setBoolResult:1 error:v3];
}

void BRUnsetMigrationStatusForDSIDInPref(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"BRUnsetMigrationStatusForDSIDInPref", 1705, v9);
  id v2 = brc_bread_crumbs((uint64_t)"BRUnsetMigrationStatusForDSIDInPref", 1705);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v11 = v9[0];
    __int16 v12 = 2112;
    id v13 = v1;
    __int16 v14 = 2112;
    id v15 = v2;
    _os_log_debug_impl(&dword_19ED3F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx deleting migration status for dsid %@%@", buf, 0x20u);
  }

  if (v1)
  {
    uint64_t v4 = brc_bread_crumbs((uint64_t)"BRUnsetMigrationStatusForDSIDInPref", 1709);
    id v5 = brc_default_log(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = (uint64_t)v1;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] removing migration status for %@%@", buf, 0x16u);
    }

    id v6 = [@"icloud-drive.account-migration-status." stringByAppendingString:v1];
    CFPreferencesSetAppValue(v6, 0, (CFStringRef)BRDefaultsDomain);
    if (!CFPreferencesAppSynchronize((CFStringRef)BRDefaultsDomain))
    {
      char v7 = brc_bread_crumbs((uint64_t)"BRUnsetMigrationStatusForDSIDInPref", 1714);
      id v8 = brc_default_log(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v11 = BRDefaultsDomain;
        __int16 v12 = 2112;
        id v13 = v7;
        _os_log_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to delete user defaults for %@%@", buf, 0x16u);
      }
    }
  }
  __brc_leave_section((uint64_t)v9);
}

void sub_19ED68BC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t BRSetMigrationStatusForDSIDInPref(void *a1, unsigned int a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2 != 1)
  {
    if (!v3)
    {
      id v21 = brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1728);
      id v22 = brc_default_log(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        BRSetMigrationStatusForDSIDInPref_cold_3();
      }

      id v5 = brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1730);
      id v6 = brc_default_log(0);
      if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
        BRSetMigrationStatusForDSIDInPref_cold_2();
      }
      goto LABEL_4;
    }
    id v8 = (void *)MEMORY[0x19F3C4670]();
    id v9 = [@"icloud-drive.account-migration-status." stringByAppendingString:v4];
    if (a2 == 3) {
      unsigned int v10 = 4;
    }
    else {
      unsigned int v10 = 0;
    }
    if (a2 + 1 >= 4) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = a2;
    }
    __int16 v12 = [NSNumber numberWithChar:v11];
    int v13 = BRGetMigrationStatusForDSID(v4);
    if (v13 == a2)
    {
      __int16 v14 = brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1740);
      id v15 = brc_default_log(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)id v24 = a2;
        *(_WORD *)&uint8_t v24[4] = 2112;
        *(void *)&v24[6] = v4;
        *(_WORD *)&v24[14] = 2112;
        *(void *)&v24[16] = v14;
        _os_log_debug_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] not setting status to %d for %@ because that's the current value of the default%@", buf, 0x1Cu);
      }
    }
    else
    {
      if (v13 <= (int)a2)
      {
        id v18 = brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1746);
        id v19 = brc_default_log(1);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)id v24 = v4;
          *(_WORD *)&v24[8] = 1024;
          *(_DWORD *)&v24[10] = a2;
          *(_WORD *)&v24[14] = 2112;
          *(void *)&v24[16] = v18;
          _os_log_impl(&dword_19ED3F000, v19, OS_LOG_TYPE_DEFAULT, "[NOTICE] migration update for %@; status is now %d%@",
            buf,
            0x1Cu);
        }

        id v20 = [v4 description];
        syslog(5, "migration update for %s; status is now %d", (const char *)[v20 UTF8String], a2);

        CFPreferencesSetAppValue(v9, v12, (CFStringRef)BRDefaultsDomain);
        if (CFPreferencesAppSynchronize((CFStringRef)BRDefaultsDomain))
        {
          uint64_t v7 = 1;
          goto LABEL_20;
        }
        __int16 v14 = brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1752);
        uint64_t v7 = 1;
        id v15 = brc_default_log(1);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)id v24 = BRDefaultsDomain;
          *(_WORD *)&v24[8] = 2112;
          *(void *)&v24[10] = v14;
          _os_log_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to synchronize user defaults for %@%@", buf, 0x16u);
        }
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      int v16 = v13;
      __int16 v14 = brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1743);
      id v15 = brc_default_log(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)id v24 = a2;
        *(_WORD *)&uint8_t v24[4] = 2112;
        *(void *)&v24[6] = v4;
        *(_WORD *)&v24[14] = 1024;
        *(_DWORD *)&v24[16] = v16;
        *(_WORD *)&v24[20] = 2112;
        *(void *)&v24[22] = v14;
        _os_log_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] not setting status to %d for %@, because it's going backward (old:%d)%@", buf, 0x22u);
      }
    }
    uint64_t v7 = 0;
    goto LABEL_19;
  }
  id v5 = brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1723);
  id v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    BRSetMigrationStatusForDSIDInPref_cold_1();
  }
LABEL_4:

  uint64_t v7 = 0;
LABEL_21:

  return v7;
}

id BRPrimaryiCloudAccountCopyStatus(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"BRPrimaryiCloudAccountCopyStatus", 1770, v20);
  id v2 = brc_bread_crumbs((uint64_t)"BRPrimaryiCloudAccountCopyStatus", 1770);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    BRPrimaryiCloudAccountCopyStatus_cold_3();
  }

  id v4 = [[BRDaemonConnection alloc] initUsingUserLocalDaemonTokenService];
  id v5 = (void *)[v4 newSyncTokenProxy];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __BRPrimaryiCloudAccountCopyStatus_block_invoke;
  id v18 = &unk_1E59ADFC8;
  id v6 = v5;
  id v19 = v6;
  [v6 getPrimaryiCloudAccountStatus:&v15];
  uint64_t v7 = objc_msgSend(v6, "result", v15, v16, v17, v18);
  id v8 = brc_bread_crumbs((uint64_t)"BRPrimaryiCloudAccountCopyStatus", 1778);
  id v9 = brc_default_log(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    BRPrimaryiCloudAccountCopyStatus_cold_2();
  }

  unsigned int v10 = [v6 error];

  if (v10)
  {
    uint64_t v11 = brc_bread_crumbs((uint64_t)"BRPrimaryiCloudAccountCopyStatus", 1780);
    __int16 v12 = brc_default_log(0);
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      int v13 = [v6 error];
      BRPrimaryiCloudAccountCopyStatus_cold_1(v13, (uint64_t)v11, buf, v12);
    }

    if (a1)
    {
      *a1 = [v6 error];
    }
  }
  [v4 invalidate];

  __brc_leave_section((uint64_t)v20);

  return v7;
}

void sub_19ED692B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __BRPrimaryiCloudAccountCopyStatus_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

uint64_t BRGetCloudEnabledStatusForAuditToken(_OWORD *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = +[BRDaemonConnection secondaryConnection];
  id v5 = (void *)[v4 newSyncProxy];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __BRGetCloudEnabledStatusForAuditToken_block_invoke;
  void v15[3] = &unk_1E59ADFF0;
  id v6 = v5;
  id v16 = v6;
  long long v7 = a1[1];
  *(_OWORD *)buf = *a1;
  *(_OWORD *)&buf[16] = v7;
  [v6 getApplicationStatusForProcess:buf reply:v15];
  id v8 = [v6 result];
  id v9 = [v6 error];
  if (v9)
  {
    unsigned int v10 = brc_bread_crumbs((uint64_t)"BRGetCloudEnabledStatusForAuditToken", 1811);
    uint64_t v11 = brc_default_log(0);
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      __int16 v14 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "BRGetCloudEnabledStatusForAuditToken";
      *(_WORD *)&unsigned char buf[12] = 2080;
      if (!a2) {
        __int16 v14 = "(ignored by caller)";
      }
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&uint8_t buf[24] = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_error_impl(&dword_19ED3F000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a2) {
    *a2 = v9;
  }

  uint64_t v12 = [v8 charValue];
  return v12;
}

void __BRGetCloudEnabledStatusForAuditToken_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithChar:a2];
  [v4 setObjResult:v7 error:v6];
}

uint64_t BRGetCloudEnabledStatus(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = +[BRDaemonConnection secondaryConnection];
  id v3 = (void *)[v2 newSyncProxy];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __BRGetCloudEnabledStatus_block_invoke;
  v12[3] = &unk_1E59ADFF0;
  id v4 = v3;
  id v13 = v4;
  [v4 getApplicationStatus:v12];
  id v5 = [v4 result];
  id v6 = [v4 error];
  if (v6)
  {
    id v7 = brc_bread_crumbs((uint64_t)"BRGetCloudEnabledStatus", 1823);
    id v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      uint64_t v11 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = "BRGetCloudEnabledStatus";
      __int16 v16 = 2080;
      if (!a1) {
        uint64_t v11 = "(ignored by caller)";
      }
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_error_impl(&dword_19ED3F000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a1) {
    *a1 = v6;
  }

  uint64_t v9 = [v5 charValue];
  return v9;
}

void __BRGetCloudEnabledStatus_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithChar:a2];
  [v4 setObjResult:v7 error:v6];
}

uint64_t BRCloudDocsCanBeEnabledForCurrentUser()
{
  memset(v4, 0, sizeof(v4));
  __brc_create_section(0, (uint64_t)"BRCloudDocsCanBeEnabledForCurrentUser", 1897, v4);
  uint64_t v0 = brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledForCurrentUser", 1897);
  id v1 = brc_default_log(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    BRCloudDocsCanBeEnabledForCurrentUser_cold_1();
  }

  if (BRCloudDocsCanBeEnabledForCurrentUser_onceToken != -1) {
    dispatch_once(&BRCloudDocsCanBeEnabledForCurrentUser_onceToken, &__block_literal_global_142);
  }
  uint64_t v2 = BRCloudDocsCanBeEnabledForCurrentUser_canBeEnabled;
  __brc_leave_section((uint64_t)v4);
  return v2;
}

void sub_19ED698C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke()
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_msgSend(NSString, "br_currentHomeDir");
  id v1 = v0;
  if (v0)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
    id v3 = objc_msgSend(v0, "br_realpath");
    id v4 = [v2 fileURLWithPath:v3];
  }
  else
  {
    id v4 = 0;
  }

  id v5 = v4;
  id v6 = brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledStateForURL", 1840);
  id v7 = brc_default_log(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_4();
  }

  if (!v5)
  {
    uint64_t v9 = brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledStateForURL", 1843);
    unsigned int v10 = brc_default_log(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_2();
    }
    id v11 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = *MEMORY[0x1E4F1C960];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:*MEMORY[0x1E4F1C960]];
  id v29 = 0;
  unsigned int v10 = [v5 resourceValuesForKeys:v9 error:&v29];
  id v11 = v29;
  if (!v10)
  {
    unsigned int v10 = brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledStateForURL", 1855);
    __int16 v18 = brc_default_log(0);
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      __int16 v23 = [v5 path];
      *(_DWORD *)buf = 138413058;
      uint64_t v31 = v23;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v11;
      __int16 v36 = 2112;
      long long v37 = v10;
      _os_log_error_impl(&dword_19ED3F000, v18, (os_log_type_t)0x90u, "[ERROR] failed to get %@ resource values for keys %@: %@%@", buf, 0x2Au);
    }
LABEL_19:
    id v15 = 0;
    uint64_t v12 = 0;
    uint64_t v17 = -1;
    goto LABEL_24;
  }
  uint64_t v12 = [v10 objectForKeyedSubscript:v8];
  if (!v12)
  {
    uint64_t v25 = brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledStateForURL", 1868);
    __int16 v26 = brc_default_log(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_3();
    }
  }
  id v28 = 0;
  uint64_t v13 = *MEMORY[0x1E4F1C858];
  id v27 = 0;
  char v14 = [v12 getResourceValue:&v28 forKey:v13 error:&v27];
  id v15 = v28;
  id v16 = v27;

  if (v14)
  {
    if ([v15 BOOLValue]) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = -1;
    }
  }
  else
  {
    id v19 = brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledStateForURL", 1872);
    __int16 v20 = brc_default_log(0);
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      id v24 = [v12 path];
      *(_DWORD *)buf = 138412802;
      uint64_t v31 = v24;
      __int16 v32 = 2112;
      id v33 = v16;
      __int16 v34 = 2112;
      id v35 = v19;
      _os_log_error_impl(&dword_19ED3F000, v20, (os_log_type_t)0x90u, "[ERROR] can't find if volume %@ is local: %@%@", buf, 0x20u);
    }
    uint64_t v17 = -1;
  }
  id v11 = v16;
LABEL_24:

  id v21 = brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledStateForURL", 1882);
  uint64_t v22 = brc_default_log(1);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_1((uint64_t)v21, v17, v22);
  }

  BRCloudDocsCanBeEnabledForCurrentUser_canBeEnabled = v17;
}

uint64_t BRHandoffDidReceiveApplicationContinuity(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = +[BRDaemonConnection defaultConnection];
  id v5 = (void *)[v4 newSyncProxy];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __BRHandoffDidReceiveApplicationContinuity_block_invoke;
  void v10[3] = &unk_1E59AD448;
  id v6 = v5;
  id v11 = v6;
  [v6 didReceiveHandoffRequestForBundleID:v3 reply:v10];

  id v7 = [v6 result];
  uint64_t v8 = [v7 BOOLValue];

  if (a2 && (v8 & 1) == 0)
  {
    *a2 = [v6 error];
  }

  return v8;
}

uint64_t __BRHandoffDidReceiveApplicationContinuity_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:1 error:a2];
}

id BRLoggedInUserAccountProperties(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = +[BRDaemonConnection defaultConnection];
  id v5 = (void *)[v4 newSyncProxy];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __BRLoggedInUserAccountProperties_block_invoke;
  void v9[3] = &unk_1E59ADFC8;
  id v6 = v5;
  id v10 = v6;
  [v6 getLoggedInUserPropertyValuesForKeys:v3 reply:v9];

  id v7 = [v6 result];
  if (a2)
  {
    *a2 = [v6 error];
  }

  return v7;
}

uint64_t __BRLoggedInUserAccountProperties_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

BOOL BRCopyLoggedInUserFirstAndLastName(void *a1, void *a2, void *a3)
{
  _DWORD v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"BRLoggedInUserFirstNameKey";
  v9[1] = @"BRLoggedInUserLastNameKey";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = BRLoggedInUserAccountProperties(v6, a3);

  if (a1)
  {
    *a1 = [v7 objectForKeyedSubscript:@"BRLoggedInUserFirstNameKey"];
  }
  if (a2)
  {
    *a2 = [v7 objectForKeyedSubscript:@"BRLoggedInUserLastNameKey"];
  }

  return v7 != 0;
}

BOOL BRLoggedInUserHasManagedAppleID(unsigned char *a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = @"BRLoggedInUserHasManagedAppleIDKey";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v5 = BRLoggedInUserAccountProperties(v4, a2);

  if (a1)
  {
    id v6 = [v5 objectForKeyedSubscript:@"BRLoggedInUserHasManagedAppleIDKey"];
    *a1 = [v6 BOOLValue];
  }
  return v5 != 0;
}

id BRGetLastSyncDateWithError(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[BRDaemonConnection secondaryConnection];
  id v3 = (void *)[v2 newSyncProxy];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __BRGetLastSyncDateWithError_block_invoke;
  v11[3] = &unk_1E59AE018;
  id v4 = v3;
  id v12 = v4;
  [v4 getLastSyncDateWithReply:v11];
  id v5 = [v4 result];
  id v6 = [v4 error];
  if (v6)
  {
    id v7 = brc_bread_crumbs((uint64_t)"BRGetLastSyncDateWithError", 2028);
    uint64_t v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      id v10 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      char v14 = "BRGetLastSyncDateWithError";
      __int16 v15 = 2080;
      if (!a1) {
        id v10 = "(ignored by caller)";
      }
      id v16 = v10;
      __int16 v17 = 2112;
      __int16 v18 = v6;
      __int16 v19 = 2112;
      __int16 v20 = v7;
      _os_log_error_impl(&dword_19ED3F000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a1) {
    *a1 = v6;
  }

  return v5;
}

uint64_t __BRGetLastSyncDateWithError_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

id BRGetLocalizedLastSyncWithError(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[BRDaemonConnection secondaryConnection];
  id v3 = (void *)[v2 newSyncProxy];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __BRGetLocalizedLastSyncWithError_block_invoke;
  v11[3] = &unk_1E59AD910;
  id v4 = v3;
  id v12 = v4;
  [v4 getLocalizedLastSyncWithReply:v11];
  id v5 = [v4 result];
  id v6 = [v4 error];
  if (v6)
  {
    id v7 = brc_bread_crumbs((uint64_t)"BRGetLocalizedLastSyncWithError", 2041);
    uint64_t v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      id v10 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      char v14 = "BRGetLocalizedLastSyncWithError";
      __int16 v15 = 2080;
      if (!a1) {
        id v10 = "(ignored by caller)";
      }
      id v16 = v10;
      __int16 v17 = 2112;
      __int16 v18 = v6;
      __int16 v19 = 2112;
      __int16 v20 = v7;
      _os_log_error_impl(&dword_19ED3F000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a1) {
    *a1 = v6;
  }

  return v5;
}

uint64_t __BRGetLocalizedLastSyncWithError_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

uint64_t BRAllowDocumentSharing()
{
  return 1;
}

uint64_t BRAllowFolderSharing()
{
  return 1;
}

id getSharingServiceInterface()
{
  if (getSharingServiceInterface_onceToken != -1) {
    dispatch_once(&getSharingServiceInterface_onceToken, &__block_literal_global_148);
  }
  uint64_t v0 = (void *)getSharingServiceInterface_interface;

  return v0;
}

uint64_t __getSharingServiceInterface_block_invoke()
{
  getSharingServiceInterface_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF156338];

  return MEMORY[0x1F41817F8]();
}

uint64_t BRIsDefaultDomain(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 identifier];
    if (v3)
    {
      id v4 = [v2 identifier];
      uint64_t v5 = [v4 isEqualToString:*MEMORY[0x1E4F25BF8]];
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

void __br_notify_register_dispatch_block_invoke_0(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (ICDErrorRetryAfterKey_block_invoke___personaOnceToken != -1) {
      dispatch_once(&ICDErrorRetryAfterKey_block_invoke___personaOnceToken, &__block_literal_global_231);
    }
    id v3 = (id)ICDErrorRetryAfterKey_block_invoke___personalPersona;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  uint64_t v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v6 = [v5 currentPersona];

  id v25 = 0;
  id v7 = [v6 userPersonaUniqueString];
  uint64_t v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0) {
    goto LABEL_9;
  }
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      uint64_t v21 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      uint64_t v22 = brc_default_log(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.5();
      }
    }
    else
    {
      __int16 v17 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      __int16 v18 = brc_default_log(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.4();
      }

      char v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      if (v14) {
        goto LABEL_25;
      }
    }
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  id v24 = 0;
  uint64_t v9 = (void *)[v6 copyCurrentPersonaContextWithError:&v24];
  id v10 = v24;
  id v11 = v25;
  id v25 = v9;

  if (v10)
  {
    id v12 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
    uint64_t v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
      __br_notify_register_dispatch_block_invoke_cold_2();
    }
  }
  char v14 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

  if (!v14) {
    goto LABEL_9;
  }
  __int16 v15 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
  id v16 = brc_default_log(0);
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2112;
    uint64_t v31 = v15;
    _os_log_error_impl(&dword_19ED3F000, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  __int16 v19 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 136);
  __int16 v20 = brc_default_log(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    __br_notify_register_dispatch_block_invoke_cold_1(a1);
  }

LABEL_10:
  _BRRestorePersona(&v25);
}

void sub_19ED6AB80(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_2_0()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  id v1 = (void *)ICDErrorRetryAfterKey_block_invoke___personalPersona;
  ICDErrorRetryAfterKey_block_invoke___personalPersona = v0;
}

void OUTLINED_FUNCTION_7_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

id brc_trace_log()
{
  int v0 = *__error();
  uint64_t v1 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v2 = [v1 currentPersona];
  int v3 = [v2 isDataSeparatedPersona];

  if (+[BRContainerCache isPersonalProvider])
  {
    if (!v3) {
      goto LABEL_6;
    }
    uint64_t v4 = brc_bread_crumbs((uint64_t)"brc_trace_log", 75);
    uint64_t v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      brc_default_log_cold_1();
    }
  }
  else
  {
    if ((!+[BRContainerCache isManagedProvider] | v3)) {
      goto LABEL_6;
    }
    uint64_t v4 = brc_bread_crumbs((uint64_t)"brc_trace_log", 77);
    uint64_t v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      brc_default_log_cold_2();
    }
  }

LABEL_6:
  if (brc_trace_log_once != -1) {
    dispatch_once(&brc_trace_log_once, &__block_literal_global_12);
  }
  *__error() = v0;
  id v6 = &brc_trace_log_loggerEnterprise;
  if (!v3) {
    id v6 = &brc_trace_log_loggerPersonal;
  }
  id v7 = (void *)*v6;

  return v7;
}

uint64_t __brc_trace_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.clouddocs", "trace personal");
  uint64_t v1 = (void *)brc_trace_log_loggerPersonal;
  brc_trace_log_loggerPersonal = (uint64_t)v0;

  brc_trace_log_loggerEnterprise = (uint64_t)os_log_create("com.apple.clouddocs", "trace enterprise");

  return MEMORY[0x1F41817F8]();
}

id brc_notifications_log()
{
  int v0 = *__error();
  uint64_t v1 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v2 = [v1 currentPersona];
  int v3 = [v2 isDataSeparatedPersona];

  if (+[BRContainerCache isPersonalProvider])
  {
    if (!v3) {
      goto LABEL_6;
    }
    uint64_t v4 = brc_bread_crumbs((uint64_t)"brc_notifications_log", 97);
    uint64_t v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      brc_default_log_cold_1();
    }
  }
  else
  {
    if ((!+[BRContainerCache isManagedProvider] | v3)) {
      goto LABEL_6;
    }
    uint64_t v4 = brc_bread_crumbs((uint64_t)"brc_notifications_log", 99);
    uint64_t v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      brc_default_log_cold_2();
    }
  }

LABEL_6:
  if (brc_notifications_log_once != -1) {
    dispatch_once(&brc_notifications_log_once, &__block_literal_global_16);
  }
  *__error() = v0;
  id v6 = &brc_notifications_log_loggerEnterprise;
  if (!v3) {
    id v6 = &brc_notifications_log_loggerPersonal;
  }
  id v7 = (void *)*v6;

  return v7;
}

uint64_t __brc_notifications_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.clouddocs", "notifications personal");
  uint64_t v1 = (void *)brc_notifications_log_loggerPersonal;
  brc_notifications_log_loggerPersonal = (uint64_t)v0;

  brc_notifications_log_loggerEnterprise = (uint64_t)os_log_create("com.apple.clouddocs", "notifications enterprise");

  return MEMORY[0x1F41817F8]();
}

uint64_t _brc_log_is_internal_install()
{
  if (_brc_log_is_internal_install_once != -1) {
    dispatch_once(&_brc_log_is_internal_install_once, &__block_literal_global_20);
  }
  return _brc_log_is_internal_install_isAppleInternalInstall;
}

uint64_t ___brc_log_is_internal_install_block_invoke()
{
  os_log_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    uint64_t v1 = v0;
    BOOL v2 = CFEqual(v0, @"Internal") != 0;
    CFRelease(v1);
  }
  else
  {
    BOOL v2 = 0;
  }
  uint64_t result = access("/AppleInternal", 0);
  _brc_log_is_internal_install_isAppleInternalInstall = v2;
  return result;
}

uint64_t _brc_create_simulate_crash_message()
{
  if (_brc_log_is_internal_install_once != -1) {
    dispatch_once(&_brc_log_is_internal_install_once, &__block_literal_global_20);
  }
  return 0;
}

void _brc_assert_failure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = MEMORY[0x1F4188790]();
  int v11 = v10;
  uint64_t v13 = v12;
  __int16 v15 = v14;
  uint64_t v16 = v9;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v18 = v17;
  __int16 v19 = signal(6, 0);
  MEMORY[0x19F3C4670](v19);
  brc_backtrace_detailed_snprint(v31, 0x2000, 3);
  __int16 v20 = (void *)[[NSString alloc] initWithFormat:v18 arguments:&a9];
  uint64_t v21 = brc_bread_crumbs((uint64_t)v15, v11);
  uint64_t v22 = brc_default_log(0);
  if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v24 = v16;
    __int16 v25 = 2112;
    __int16 v26 = v20;
    __int16 v27 = 2080;
    __int16 v28 = v31;
    __int16 v29 = 2112;
    __int16 v30 = v21;
    _os_log_error_impl(&dword_19ED3F000, v22, (os_log_type_t)0x90u, "[ERROR] %s%@\n%s%@", buf, 0x2Au);
  }

  __assert_rtn(v15, v13, v11, (const char *)[v20 UTF8String]);
}

void abc_report_assert_with_signature(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    time_t v4 = time(0);
    unint64_t v5 = atomic_load((unint64_t *)a1);
    if ((uint64_t)(v4 - v5) < 3600)
    {
      if (atomic_fetch_add((atomic_ullong *volatile)(a1 + 8), 1uLL) > 5) {
        goto LABEL_17;
      }
    }
    else
    {
      atomic_store(1uLL, (unint64_t *)(a1 + 8));
    }
    atomic_store(v4, (unint64_t *)a1);
  }
  id v6 = signature_from_format_and_subtype(v3);
  if (_brc_log_is_internal_install_once != -1) {
    dispatch_once(&_brc_log_is_internal_install_once, &__block_literal_global_20);
  }
  if (_brc_log_is_internal_install_isAppleInternalInstall) {
    brc_backtrace();
  }
  else {
  id v7 = brc_backtrace_non_detailed_but_fast();
  }
  uint64_t v8 = get_sd_reporter();
  uint64_t v13 = @"backtrace";
  v14[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  char v10 = [v8 snapshotWithSignature:v6 duration:v9 event:0 payload:&__block_literal_global_37_0 reply:15.0];

  if (v10)
  {
    int v11 = brc_bread_crumbs((uint64_t)"abc_report_assert_with_signature", 242);
    id v12 = brc_default_log(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      abc_report_assert_with_signature_cold_1();
    }
  }
  else
  {
    int v11 = brc_bread_crumbs((uint64_t)"abc_report_assert_with_signature", 240);
    id v12 = brc_default_log(0);
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
      abc_report_assert_with_signature_cold_2();
    }
  }

LABEL_17:
}

id signature_from_format_and_subtype(void *a1)
{
  id v1 = a1;
  if ((unint64_t)[v1 length] >= 0x65)
  {
    BOOL v2 = objc_msgSend(NSString, "stringWithFormat:", @":0x%lx", objc_msgSend(v1, "hash"));
    id v3 = objc_msgSend(v1, "substringToIndex:", 100 - objc_msgSend(v2, "length"));
    uint64_t v4 = [v3 stringByAppendingString:v2];

    id v1 = (id)v4;
  }
  unint64_t v5 = get_sd_reporter();
  id v6 = [v5 signatureWithDomain:@"Application" type:@"Functional" subType:@"AssertionFailed" detectedProcess:@"bird" triggerThresholdValues:0];

  [v6 setObject:v1 forKeyedSubscript:*MEMORY[0x1E4FA8CB8]];

  return v6;
}

id get_sd_reporter()
{
  if (get_sd_reporter_onceToken != -1) {
    dispatch_once(&get_sd_reporter_onceToken, &__block_literal_global_74);
  }
  os_log_t v0 = (void *)get_sd_reporter__diagnosticReporter;

  return v0;
}

void __abc_report_assert_with_signature_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = brc_bread_crumbs((uint64_t)"abc_report_assert_with_signature_block_invoke", 238);
  uint64_t v4 = brc_default_log(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __abc_report_assert_with_signature_block_invoke_cold_1();
  }
}

void abc_report_panic_with_signature(void *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = signature_from_format_and_subtype(v1);
  id v3 = brc_backtrace();
  uint64_t v4 = get_sd_reporter();
  uint64_t v9 = @"backtrace";
  v10[0] = v3;
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  char v6 = [v4 snapshotWithSignature:v2 duration:v5 event:0 payload:0 reply:1.0];

  if (v6)
  {
    id v7 = brc_bread_crumbs((uint64_t)"abc_report_panic_with_signature", 255);
    uint64_t v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      abc_report_panic_with_signature_cold_1();
    }
  }
  else
  {
    id v7 = brc_bread_crumbs((uint64_t)"abc_report_panic_with_signature", 253);
    uint64_t v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      abc_report_panic_with_signature_cold_2();
    }
  }
}

__CFString *BRCPrettyPrintBitmap(uint64_t a1, void *a2)
{
  uint64_t v4 = [MEMORY[0x1E4F28E78] stringWithCapacity:255];
  uint64_t v5 = a2[1];
  if (v5)
  {
    char v6 = a2;
    do
    {
      uint64_t v8 = *v6;
      v6 += 2;
      uint64_t v7 = v8;
      if ((v8 & ~a1) == 0 && (v7 || a1 == 0))
      {
        objc_msgSend(v4, "appendFormat:", @"%s|", v5);
        a1 ^= v7;
      }
      uint64_t v5 = a2[3];
      a2 = v6;
    }
    while (v5);
  }
  if (a1)
  {
    objc_msgSend(v4, "appendFormat:", @"0x%llx", a1);
LABEL_15:
    char v10 = v4;
    goto LABEL_16;
  }
  if ([v4 length])
  {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    goto LABEL_15;
  }
  char v10 = &stru_1EF11DA20;
LABEL_16:

  return v10;
}

const char *BRCPrettyPrintEnum(uint64_t a1, void *a2)
{
  uint64_t result = (const char *)a2[1];
  if (!result) {
    return "<unknown>";
  }
  if (*a2 != a1)
  {
    uint64_t v4 = a2 + 3;
    uint64_t result = "<unknown>";
    while (1)
    {
      uint64_t v5 = *v4;
      if (!*v4) {
        break;
      }
      uint64_t v6 = *(v4 - 1);
      v4 += 2;
      if (v6 == a1) {
        return (const char *)v5;
      }
    }
  }
  return result;
}

id brc_append_system_info_to_message(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v1 = [MEMORY[0x1E4F28E78] stringWithString:a1];
  [v1 appendString:@"\n\n"];
  id v2 = v1;
  v38.rlim_cur = 0;
  v38.rlim_max = 0;
  id v3 = NSString;
  uint64_t v4 = [@" LIMITS " stringByPaddingToLength:80 withString:@"-" startingAtIndex:0];
  uint64_t v5 = [v3 stringWithFormat:@"\n%@\n\n", v4];

  [v2 appendString:v5];
  for (uint64_t i = 0; i != 8; ++i)
  {
    int v7 = getrlimit(dword_19EDD67D8[i], &v38);
    uint64_t v8 = off_1E59AE090[i];
    if (v7)
    {
      uint64_t v9 = __error();
      objc_msgSend(v2, "appendFormat:", @"%s(%s)\n", v8, strerror(*v9));
    }
    else
    {
      objc_msgSend(v2, "appendFormat:", @"%s\t\t\t", off_1E59AE090[i]);
      if (v38.rlim_cur == 0x7FFFFFFFFFFFFFFFLL) {
        [v2 appendString:@"    infinity"];
      }
      else {
        objc_msgSend(v2, "appendFormat:", @"%12llu", v38.rlim_cur);
      }
      if (v38.rlim_max == 0x7FFFFFFFFFFFFFFFLL) {
        [v2 appendString:@"    infinity"];
      }
      else {
        objc_msgSend(v2, "appendFormat:", @"%12llu", v38.rlim_max);
      }
      [v2 appendString:@"\n"];
    }
  }

  char v10 = NSHomeDirectory();
  int v11 = [v10 stringByAppendingPathComponent:@"Library/Mobile Documents"];
  id v12 = v2;
  uint64_t v13 = NSString;
  char v14 = [NSString stringWithFormat:@" DISK  (%@)", v11];
  __int16 v15 = [v14 stringByPaddingToLength:80 withString:@"-" startingAtIndex:0];
  uint64_t v16 = [v13 stringWithFormat:@"\n%@\n\n", v15];

  id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v37 = 0;
  id v18 = [v17 attributesOfFileSystemForPath:v11 error:&v37];
  id v19 = v37;

  [v12 appendString:v16];
  if (v18)
  {
    id v29 = v19;
    __int16 v30 = v16;
    uint64_t v31 = v11;
    uint64_t v32 = v10;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:&v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v20);
          }
          __int16 v25 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          __int16 v26 = [v25 stringByPaddingToLength:21 withString:@" " startingAtIndex:0];
          __int16 v27 = [v20 objectForKeyedSubscript:v25];
          [v12 appendFormat:@"%@\t%12llu\n", v26, objc_msgSend(v27, "unsignedLongLongValue")];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:&v38 count:16];
      }
      while (v22);
    }

    int v11 = v31;
    char v10 = v32;
    id v19 = v29;
    uint64_t v16 = v30;
  }
  else
  {
    [v12 appendFormat:@"%@\n", v19];
  }

  return v12;
}

id BRLocalizedFileSizeDescription(uint64_t a1)
{
  if (a1 < 0)
  {
    id v2 = NSLocalizedFileSizeDescription();
    id v1 = [@"-" stringByAppendingString:v2];
  }
  else
  {
    id v1 = NSLocalizedFileSizeDescription();
  }

  return v1;
}

id BRLocalizedFileSizeDescriptionWithExactCount(uint64_t a1)
{
  if (a1 < 1000)
  {
    uint64_t v4 = BRLocalizedFileSizeDescription(a1);
  }
  else
  {
    id v2 = NSString;
    id v3 = BRLocalizedFileSizeDescription(a1);
    uint64_t v4 = [v2 stringWithFormat:@"%@ (%lld)", v3, a1];
  }

  return v4;
}

uint64_t __get_sd_reporter_block_invoke()
{
  get_sd_reporter__diagnosticReporter = (uint64_t)objc_alloc_init(MEMORY[0x1E4FA8AF0]);

  return MEMORY[0x1F41817F8]();
}

uint64_t BRMakeiWorkSharingOptions(int a1, int a2)
{
  if (a2) {
    unsigned int v2 = 3;
  }
  else {
    unsigned int v2 = 1;
  }
  if (a1) {
    return v2;
  }
  else {
    return 0;
  }
}

void sub_19ED6C508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_19ED6C714(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t offsetOfPackageRootFilenameInPath(void *a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if ([v3 length])
  {
    id v43 = v3;
    id v44 = a2;
    uint64_t v4 = &v50;
    uint64_t v5 = v51;
    uint64_t v6 = (unsigned char *)[v3 fileSystemRepresentation];
    char v50 = 47;
    uint64_t v7 = __strlcpy_chk();
    uint64_t v42 = v6;
    if ((unint64_t)(v7 + 2) >= 0x400)
    {
      size_t v8 = v7 + 1;
      uint64_t v4 = (char *)malloc_type_malloc(v7 + 2, 0xF93F926CuLL);
      char *v4 = 47;
      uint64_t v5 = v4 + 1;
      memcpy(v4 + 1, v6, v8);
    }
    uint64_t v9 = "/";
    __stringp = v5;
    unint64_t v10 = 0x1E4F29000uLL;
    uint64_t v45 = *MEMORY[0x1E4F1C658];
    int v11 = "key";
    uint64_t v46 = v4;
    do
    {
      id v12 = strsep(&__stringp, v9);
      *(v12 - 1) = 47;
      uint64_t v13 = extensionInFilename(v12);
      if (v13)
      {
        char v14 = v13;
        __int16 v15 = [*(id *)(v10 + 24) stringWithUTF8String:v13];
        if ((objc_msgSend(v15, "brc_isBlacklistedPackageExtension") & 1) == 0)
        {
          if ((objc_msgSend(v15, "brc_isForcedPackageExtension") & 1) != 0
            || !strcasecmp(v14, v11)
            || !strcasecmp(v14, "key-tef")
            || !strcasecmp(v14, "pages")
            || !strcasecmp(v14, "pages-tef")
            || !strcasecmp(v14, "numbers")
            || !strcasecmp(v14, "numbers-tef")
            || !strcasecmp(v14, "band")
            || !strcasecmp(v14, "rtfd")
            || !strcasecmp(v14, "app")
            || !strcasecmp(v14, "bundle")
            || !strcasecmp(v14, "pkg")
            || !strcasecmp(v14, "logarchive"))
          {
            goto LABEL_44;
          }
          int explicit = atomic_load_explicit(packageRootFilenameInPath_root_fd, memory_order_acquire);
          if (explicit < 0)
          {
            unsigned int v17 = open(v9, 33028);
            if ((v17 & 0x80000000) == 0)
            {
              int v18 = atomic_exchange(packageRootFilenameInPath_root_fd, v17);
              if ((v18 & 0x80000000) == 0) {
                close(v18);
              }
            }
            int explicit = atomic_load_explicit(packageRootFilenameInPath_root_fd, memory_order_acquire);
          }
          if ((fcntl(explicit, 52, v12 - 1) & 0x80000000) == 0)
          {
            unint64_t v33 = v10;
            long long v34 = brc_bread_crumbs((uint64_t)"packageRootFilenameInPath", 412);
            long long v35 = brc_default_log(1);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
              offsetOfPackageRootFilenameInPath_cold_1();
            }

            unint64_t v10 = v33;
            long long v36 = *(void **)(v33 + 24);
            uint64_t v24 = [v36 stringWithUTF8String:v14];
            objc_msgSend(v36, "brc_addForcedPackageExtension:", v24);
            goto LABEL_43;
          }
          id v19 = v9;
          id v20 = v11;
          uint64_t v21 = (void *)MEMORY[0x1E4F1CB10];
          unint64_t v22 = v10;
          uint64_t v23 = [*(id *)(v10 + 24) stringWithUTF8String:v4];
          uint64_t v24 = [v21 fileURLWithPath:v23];

          id v47 = 0;
          id v48 = 0;
          char v25 = [v24 getResourceValue:&v48 forKey:v45 error:&v47];
          id v26 = v48;
          id v27 = v47;
          __int16 v28 = v27;
          if (v25)
          {
            if ([v26 BOOLValue])
            {
              id v37 = *(void **)(v22 + 24);
              rlimit v38 = [v37 stringWithUTF8String:v14];
              objc_msgSend(v37, "brc_addForcedPackageExtension:", v38);

              unint64_t v10 = v22;
LABEL_43:

              uint64_t v4 = v46;
LABEL_44:

              size_t v39 = strlen(v12);
              uint64_t v40 = &v12[v39] - (v4 + 1);
              if (v44)
              {
                *(_WORD *)&v12[v39] = 47;
                objc_msgSend(*(id *)(v10 + 24), "br_pathWithFileSystemRepresentation:");
                *id v44 = (id)objc_claimAutoreleasedReturnValue();
              }
              if (v42[v40] == 47) {
                uint64_t v32 = v40 + 1;
              }
              else {
                uint64_t v32 = v40;
              }
              goto LABEL_49;
            }
          }
          else if ((objc_msgSend(v27, "br_isCocoaErrorCode:", 260) & 1) == 0)
          {
            id v29 = brc_bread_crumbs((uint64_t)"packageRootFilenameInPath", 424);
            __int16 v30 = brc_default_log(1);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v31 = [v24 path];
              *(_DWORD *)buf = 138412802;
              v53 = v31;
              __int16 v54 = 2112;
              v55 = v28;
              __int16 v56 = 2112;
              v57 = v29;
              _os_log_impl(&dword_19ED3F000, v30, OS_LOG_TYPE_DEFAULT, "[WARNING] can't get whether %@ is a package: %@%@", buf, 0x20u);
            }
          }

          unint64_t v10 = v22;
          int v11 = v20;
          uint64_t v9 = v19;
          uint64_t v4 = v46;
        }
      }
    }
    while (__stringp);
    if (v44) {
      *id v44 = 0;
    }
    uint64_t v32 = -1;
LABEL_49:
    id v3 = v43;
    if (v4 != &v50) {
      free(v4);
    }
  }
  else
  {
    uint64_t v32 = -1;
  }

  return v32;
}

void sub_19ED6E0F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, long long a10, uint64_t a11)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(exception_object);
    uint64_t v13 = [v12 name];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F1C3C8]];

    if (v14)
    {
      __int16 v15 = brc_bread_crumbs((uint64_t)"-[NSString(BRPathAdditions) _br_safeFileSystemRepresentationWithDefaultValue:]", 600);
      uint64_t v16 = brc_default_log(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v17 = [v12 reason];
        a9 = 138412802;
        WORD2(a10) = 2112;
        *(void *)((char *)&a10 + 6) = v17;
        HIWORD(a10) = 2112;
        a11 = (uint64_t)v15;
        _os_log_debug_impl(&dword_19ED3F000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Could not convert %@ to fileSystemRepresentation for reason: %@ --> use bad filename alternative name instead%@", (uint8_t *)&a9, 0x20u);
      }
      [v11 UTF8String];

      objc_end_catch();
      JUMPOUT(0x19ED6E0BCLL);
    }
    int v18 = brc_bread_crumbs((uint64_t)"-[NSString(BRPathAdditions) _br_safeFileSystemRepresentationWithDefaultValue:]", 603);
    id v19 = brc_default_log(1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[NSString(BRPathAdditions) _br_safeFileSystemRepresentationWithDefaultValue:]();
    }

    objc_exception_throw(v12);
  }
  _Unwind_Resume(exception_object);
}

void sub_19ED6F32C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getHomeDirectoryForUser(uid_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
LABEL_14:
    int v11 = 0;
    goto LABEL_15;
  }
  if (sysconf(71) == -1)
  {
    int v8 = *__error();
    uint64_t v9 = brc_bread_crumbs((uint64_t)"getHomeDirectoryForUser", 1076);
    unint64_t v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
      getHomeDirectoryForUser_cold_1(v8);
    }

    goto LABEL_14;
  }
  uint64_t v2 = MEMORY[0x1F4188790]();
  memset(&v15, 0, sizeof(v15));
  int v14 = 0;
  if (getpwuid_r(a1, &v15, (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v3, &v14)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v14 == 0;
  }
  if (v4)
  {
    int v5 = *__error();
    uint64_t v6 = brc_bread_crumbs((uint64_t)"getHomeDirectoryForUser", 1084);
    uint64_t v7 = brc_default_log(0);
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
      getHomeDirectoryForUser_cold_2(v5);
    }

    int v11 = 0;
  }
  else
  {
    int v11 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v15.pw_dir);
  }
LABEL_15:

  return v11;
}

uint64_t _br_parseUUIDString(void *a1, unsigned __int8 *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a1 getCString:__s maxLength:256 encoding:4];
  if (result) {
    return strlen(__s) == 36 && uuid_parse(__s, a2) == 0;
  }
  return result;
}

uint64_t __fileSystemSizeForDirectoryAtPath_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = brc_bread_crumbs((uint64_t)"fileSystemSizeForDirectoryAtPath_block_invoke", 230);
  int v8 = brc_default_log(0);
  if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138413058;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    int v18 = v7;
    _os_log_error_impl(&dword_19ED3F000, v8, (os_log_type_t)0x90u, "[ERROR] error enumerating %@: error %@ at %@%@", (uint8_t *)&v11, 0x2Au);
  }

  return 1;
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_7_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_8_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x1Cu);
}

void sub_19ED70144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id BRNotifyNameForForegroundChangeWithContainerID(void *a1)
{
  id v1 = [a1 stringByAppendingString:@".foreground"];
  uint64_t v2 = objc_msgSend(v1, "br_libnotifyPerUserNotificationName");

  return v2;
}

uint64_t BRNotifyNameForAccountDidUpgradeToCloudDriveNotification()
{
  return objc_msgSend(@"CloudDocs.AccountDidUpgradeToCloudDrive", "br_libnotifyPerUserNotificationName");
}

uint64_t BRNotifyNameForAccountDidStartUsingUbiquityNotification()
{
  return objc_msgSend(@"CloudDocs.AccountUseUbiquity", "br_libnotifyPerUserNotificationName");
}

void sub_19ED70A28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED70CB8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED71140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  objc_sync_exit(v24);
  __brc_leave_section((uint64_t)&a24);
  _Unwind_Resume(a1);
}

id notifyNameWithPrefixedContainerID(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"com.apple.clouddocs."])
  {
    uint64_t v2 = [v1 substringFromIndex:objc_msgSend(@"com.apple.clouddocs.", "length")];
  }
  else
  {
    size_t v3 = brc_bread_crumbs((uint64_t)"BRUnprefixedContainerID", 39);
    uint64_t v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      notifyNameWithPrefixedContainerID_cold_1();
    }

    uint64_t v2 = 0;
  }

  id v5 = BRNotifyNameForForegroundChangeWithContainerID(v2);

  return v5;
}

void sub_19ED71494(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED715EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_1(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (_block_invoke___personaOnceToken != -1) {
      dispatch_once(&_block_invoke___personaOnceToken, &__block_literal_global_11);
    }
    id v3 = (id)_block_invoke___personalPersona;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v6 = [v5 currentPersona];

  id v25 = 0;
  id v7 = [v6 userPersonaUniqueString];
  int v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0) {
    goto LABEL_9;
  }
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      uint64_t v21 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      unint64_t v22 = brc_default_log(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
    }
    else
    {
      __int16 v17 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      int v18 = brc_default_log(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_3();
      }

      id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      if (v14) {
        goto LABEL_25;
      }
    }
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  id v24 = 0;
  uint64_t v9 = (void *)[v6 copyCurrentPersonaContextWithError:&v24];
  id v10 = v24;
  id v11 = v25;
  id v25 = v9;

  if (v10)
  {
    uint64_t v12 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
    __int16 v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
      __br_notify_register_dispatch_block_invoke_cold_2();
    }
  }
  id v14 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

  if (!v14) {
    goto LABEL_9;
  }
  __int16 v15 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
  id v16 = brc_default_log(0);
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2112;
    uint64_t v31 = v15;
    _os_log_error_impl(&dword_19ED3F000, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  uint64_t v19 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 136);
  id v20 = brc_default_log(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    __br_notify_register_dispatch_block_invoke_cold_1_0(a1, (uint64_t)v19, v20);
  }

LABEL_10:
  _BRRestorePersona(&v25);
}

void sub_19ED71B20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_2_1()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  id v1 = (void *)_block_invoke___personalPersona;
  _block_invoke___personalPersona = v0;
}

void sub_19ED7244C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED72738(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED72B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

id BRGetFileNameFromServerInfoBlob(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  int v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
  if (v4)
  {
    id v5 = [[BRServerInfoRecordInfo alloc] initWithData:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = NSString;
      int v8 = [(BRServerInfoRecordInfo *)v5 zoneName];
      uint64_t v9 = [v6 recordID];
      id v10 = [v9 lastPathComponent];
      id v11 = [v7 stringWithFormat:@"%@/%@/BRGetFileNameFromServerInfoBlob", v8, v10];

      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "br_documentURLFromBookmarkableString:error:", v11, a2);
      __int16 v13 = [v12 lastPathComponent];

      goto LABEL_16;
    }
    id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"serverInfoBase64Blob", v3);
    if (v16)
    {
      __int16 v17 = brc_bread_crumbs((uint64_t)"BRGetFileNameFromServerInfoBlob", 33);
      int v18 = brc_default_log(0);
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        uint64_t v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = "BRGetFileNameFromServerInfoBlob";
        __int16 v24 = 2080;
        if (!a2) {
          uint64_t v21 = "(ignored by caller)";
        }
        id v25 = v21;
        __int16 v26 = 2112;
        id v27 = v16;
        __int16 v28 = 2112;
        id v29 = v17;
        _os_log_error_impl(&dword_19ED3F000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a2) {
      *a2 = v16;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"serverInfoBase64Blob", v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      id v14 = brc_bread_crumbs((uint64_t)"BRGetFileNameFromServerInfoBlob", 28);
      __int16 v15 = brc_default_log(0);
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        id v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = "BRGetFileNameFromServerInfoBlob";
        __int16 v24 = 2080;
        if (!a2) {
          id v20 = "(ignored by caller)";
        }
        id v25 = v20;
        __int16 v26 = 2112;
        id v27 = v6;
        __int16 v28 = 2112;
        id v29 = v14;
        _os_log_error_impl(&dword_19ED3F000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a2)
    {
      id v6 = v6;
      __int16 v13 = 0;
      *a2 = v6;
      goto LABEL_16;
    }
  }
  __int16 v13 = 0;
LABEL_16:

  return v13;
}

void __BRPerformWithPersonaAndError_block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  id v1 = (void *)BRPerformWithPersonaAndError___personalPersona;
  BRPerformWithPersonaAndError___personalPersona = v0;
}

void BRPerformWithPersonaAndErrorForURLIfAble(void *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  int v4 = a2;
  if (+[BRAccountDescriptor mightHaveDataSeparatedAccountDescriptor])
  {
    id v5 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
    if (objc_msgSend(v3, "_br_isInLocalHomeDirectoryUnderPersona:needsPersonaSwitch:", v5, 0)
      || [v5 isEqualToString:@"__defaultPersonaID__"]
      && (objc_msgSend(v3, "br_mightBeOnDataSeparatedVolume") & 1) == 0)
    {
      v4[2](v4, v5, 1, 1, 0);
    }
    else
    {
      id v6 = +[BRAccountDescriptor allLoggedInAccountDescriptors];
      if ((unint64_t)[v6 count] > 1
        || ([v6 firstObject],
            id v7 = objc_claimAutoreleasedReturnValue(),
            int v8 = [v7 isDataSeparated],
            v7,
            v8))
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v20 = v6;
        id v9 = v6;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v24;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              __int16 v15 = [v14 personaIdentifier];
              char v16 = [v5 isEqualToString:v15];

              if ((v16 & 1) == 0)
              {
                __int16 v17 = [v14 personaIdentifier];
                int v18 = objc_msgSend(v3, "_br_isInLocalHomeDirectoryUnderPersona:needsPersonaSwitch:", v17, 1);

                if (v18)
                {
                  v21[0] = MEMORY[0x1E4F143A8];
                  v21[1] = 3221225472;
                  v21[2] = __BRPerformWithPersonaAndErrorForURLIfAble_block_invoke;
                  v21[3] = &unk_1E59AE270;
                  void v21[4] = v14;
                  unint64_t v22 = v4;
                  BRPerformWithAccountDescriptorAndError(v14, v21);

                  id v6 = v20;
                  goto LABEL_22;
                }
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v19 = 1;
        id v6 = v20;
      }
      else
      {
        uint64_t v19 = 0;
      }
      v4[2](v4, v5, v19, 0, 0);
LABEL_22:
    }
  }
  else
  {
    v4[2](v4, @"__defaultPersonaID__", 0, 0, 0);
  }
}

void __BRPerformWithPersonaAndErrorForURLIfAble_block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 personaIdentifier];
  (*(void (**)(uint64_t, id, uint64_t, uint64_t, id))(v2 + 16))(v2, v5, 1, 1, v4);
}

uint64_t BRCurrentPersonaIsDataSeparated()
{
  uint64_t v0 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v1 = [v0 currentPersona];
  uint64_t v2 = [v1 isDataSeparatedPersona];

  return v2;
}

uint64_t BRCurrentPersonaIdentifierLoggingString()
{
  uint64_t v0 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v1 = [v0 currentPersona];

  uint64_t v2 = [v1 userPersonaUniqueString];
  if ([v1 isDataSeparatedPersona]) {
    id v3 = @"-enterprise";
  }
  else {
    id v3 = @"-personal";
  }
  id v4 = [v2 stringByAppendingString:v3];

  id v5 = v4;
  uint64_t v6 = [v5 UTF8String];

  return v6;
}

uint64_t BRCurrentPersonaMatchesID(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v3 = objc_msgSend(v2, "br_currentPersonaID");

  uint64_t v4 = [v3 isEqualToString:v1];
  if ((v4 & 1) == 0)
  {
    id v5 = brc_bread_crumbs((uint64_t)"BRCurrentPersonaMatchesID", 109);
    uint64_t v6 = brc_default_log(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412802;
      id v9 = v3;
      __int16 v10 = 2112;
      id v11 = v1;
      __int16 v12 = 2112;
      __int16 v13 = v5;
      _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] current persona (%@) and persona (%@) don't match%@", (uint8_t *)&v8, 0x20u);
    }
  }
  return v4;
}

id BRPersonaSpecificName(void *a1, uint64_t a2)
{
  id v3 = NSString;
  id v4 = a1;
  id v5 = [v3 stringWithFormat:@"-%@", a2];
  uint64_t v6 = [v4 stringByAppendingString:v5];

  return v6;
}

id initCKCurrentUserDefaultName()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)CloudKitLibrary_frameworkLibrary_0;
  if (!CloudKitLibrary_frameworkLibrary_0)
  {
    uint64_t v0 = dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 2);
    CloudKitLibrary_frameworkLibrary_0 = (uint64_t)v0;
    if (!v0)
    {
      id v1 = brc_bread_crumbs((uint64_t)"CloudKitLibrary", 17);
      uint64_t v2 = brc_default_log(1);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315394;
        id v7 = dlerror();
        __int16 v8 = 2112;
        id v9 = v1;
        _os_log_impl(&dword_19ED3F000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't open CloudKit : %s%@", (uint8_t *)&v6, 0x16u);
      }

      uint64_t v0 = (void *)CloudKitLibrary_frameworkLibrary_0;
    }
  }
  id v3 = (id *)dlsym(v0, "CKCurrentUserDefaultName");
  if (!v3) {
    initCKCurrentUserDefaultName_cold_1();
  }
  objc_storeStrong((id *)&constantCKCurrentUserDefaultName, *v3);
  getCKCurrentUserDefaultName = (uint64_t (*)())CKCurrentUserDefaultNameFunction;
  id v4 = (void *)constantCKCurrentUserDefaultName;

  return v4;
}

id CKCurrentUserDefaultNameFunction()
{
  return (id)constantCKCurrentUserDefaultName;
}

void BRFetchCollaborationIdentifierForItemWithIdentifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ((FPIsCloudDocsWithFPFSEnabled() & 1) == 0)
  {
    __int16 v12 = brc_bread_crumbs((uint64_t)"BRFetchCollaborationIdentifierForItemWithIdentifier", 23);
    __int16 v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      BRFetchCollaborationIdentifierForItemWithIdentifier_cold_2((uint64_t)v12, v13);
    }
  }
  id v5 = brc_bread_crumbs((uint64_t)"BRFetchCollaborationIdentifierForItemWithIdentifier", 24);
  int v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    BRFetchCollaborationIdentifierForItemWithIdentifier_cold_1();
  }

  id v7 = +[BRDaemonConnection defaultConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __BRFetchCollaborationIdentifierForItemWithIdentifier_block_invoke;
  v16[3] = &unk_1E59AD510;
  id v8 = v4;
  id v17 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v16];

  uint64_t v10 = +[BRFileObjectID fileObjectIDWithString:v3];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __BRFetchCollaborationIdentifierForItemWithIdentifier_block_invoke_2;
  v14[3] = &unk_1E59AE298;
  id v15 = v8;
  id v11 = v8;
  [v9 copyCollaborationIdentifierForFileObjectID:v10 reply:v14];
}

uint64_t __BRFetchCollaborationIdentifierForItemWithIdentifier_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __BRFetchCollaborationIdentifierForItemWithIdentifier_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void BRFetchCollaborationIdentifierForItemAtURL(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    id v11 = brc_bread_crumbs((uint64_t)"BRFetchCollaborationIdentifierForItemAtURL", 36);
    __int16 v12 = brc_default_log(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      BRFetchCollaborationIdentifierForItemAtURL_cold_2((uint64_t)v11, v12);
    }
  }
  id v5 = brc_bread_crumbs((uint64_t)"BRFetchCollaborationIdentifierForItemAtURL", 37);
  int v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    BRFetchCollaborationIdentifierForItemAtURL_cold_1(v3, (uint64_t)v5, v6);
  }

  id v7 = +[BRDaemonConnection defaultConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __BRFetchCollaborationIdentifierForItemAtURL_block_invoke;
  void v15[3] = &unk_1E59AD510;
  id v8 = v4;
  id v16 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __BRFetchCollaborationIdentifierForItemAtURL_block_invoke_2;
  v13[3] = &unk_1E59AE298;
  id v14 = v8;
  id v10 = v8;
  [v9 copyCollaborationIdentifierForItemAtURL:v3 reply:v13];
}

uint64_t __BRFetchCollaborationIdentifierForItemAtURL_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __BRFetchCollaborationIdentifierForItemAtURL_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void BRFetchCKShareForItemAtURL(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__4;
  void v16[4] = __Block_byref_object_dispose__4;
  id v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  void v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__4;
  void v14[4] = __Block_byref_object_dispose__4;
  id v15 = 0;
  int v6 = brc_bread_crumbs((uint64_t)"BRFetchCKShareForItemAtURL", 53);
  id v7 = brc_default_log(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    BRFetchCKShareForItemAtURL_cold_1();
  }

  id v8 = [[BRShareCopyOperation alloc] initWithURL:v3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __BRFetchCKShareForItemAtURL_block_invoke;
  void v10[3] = &unk_1E59AE2C0;
  __int16 v12 = v14;
  __int16 v13 = v16;
  id v9 = v4;
  id v11 = v9;
  [(BRShareCopyOperation *)v8 setRootShareCopyCompletionBlock:v10];
  [v5 addOperation:v8];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
}

void sub_19ED75A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void __BRFetchCKShareForItemAtURL_block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    id v11 = brc_bread_crumbs((uint64_t)"BRFetchCKShareForItemAtURL_block_invoke", 63);
    __int16 v12 = brc_default_log(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = *(void *)(*(void *)(a1[6] + 8) + 40);
      int v18 = 138412802;
      uint64_t v19 = v17;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      long long v23 = v11;
      _os_log_debug_impl(&dword_19ED3F000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched existing share %@, root share URL is %@%@", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    __int16 v13 = brc_bread_crumbs((uint64_t)"BRFetchCKShareForItemAtURL_block_invoke", 59);
    id v14 = brc_default_log(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __BRFetchCKShareForItemAtURL_block_invoke_cold_1();
    }

    uint64_t v15 = *(void *)(a1[5] + 8);
    id v16 = v10;
    id v11 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v16;
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void sub_19ED75F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19ED761D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED76B40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED76F44(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19ED77C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_19ED78B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED79090(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED79724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void dispatch_async_with_logs(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)MEMORY[0x19F3C4670]();
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v17);
  int v6 = brc_bread_crumbs((uint64_t)"dispatch_async_with_logs", 262);
  id v7 = brc_default_log(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = v17;
    label = dispatch_queue_get_label(v3);
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = label;
    *(_WORD *)&buf[22] = 2112;
    __int16 v20 = v6;
    _os_log_debug_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", buf, 0x20u);
  }

  *(void *)&buf[16] = v18;
  *(_OWORD *)buf = v17;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __dispatch_async_with_logs_block_invoke_0;
  v12[3] = &unk_1E59AD670;
  long long v15 = v17;
  uint64_t v16 = v18;
  id v8 = v3;
  __int16 v13 = v8;
  id v9 = v4;
  id v14 = v9;
  dispatch_async(v8, v12);
}

void sub_19ED79D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED7A238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_3(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (_block_invoke_2___personaOnceToken != -1) {
      dispatch_once(&_block_invoke_2___personaOnceToken, &__block_literal_global_174);
    }
    id v3 = (id)_block_invoke_2___personalPersona;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  int v6 = [v5 currentPersona];

  id v25 = 0;
  id v7 = [v6 userPersonaUniqueString];
  id v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0) {
    goto LABEL_9;
  }
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      uint64_t v21 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      __int16 v22 = brc_default_log(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.5();
      }
    }
    else
    {
      long long v17 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      uint64_t v18 = brc_default_log(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.4();
      }

      id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      if (v14) {
        goto LABEL_25;
      }
    }
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  id v24 = 0;
  id v9 = (void *)[v6 copyCurrentPersonaContextWithError:&v24];
  id v10 = v24;
  id v11 = v25;
  id v25 = v9;

  if (v10)
  {
    __int16 v12 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
    __int16 v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
      -[BRAccount containerWithPendingChanges]();
    }
  }
  id v14 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

  if (!v14) {
    goto LABEL_9;
  }
  long long v15 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
  uint64_t v16 = brc_default_log(0);
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2112;
    uint64_t v31 = v15;
    _os_log_error_impl(&dword_19ED3F000, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  uint64_t v19 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 136);
  __int16 v20 = brc_default_log(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    __br_notify_register_dispatch_block_invoke_cold_1_1();
  }

LABEL_10:
  _BRRestorePersona(&v25);
}

void sub_19ED7A800(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_2_2()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  id v1 = (void *)_block_invoke_2___personalPersona;
  _block_invoke_2___personalPersona = v0;
}

void __dispatch_async_with_logs_block_invoke_0(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  id v2 = brc_bread_crumbs((uint64_t)"dispatch_async_with_logs_block_invoke", 264);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32));
    *(_DWORD *)buf = 134218498;
    uint64_t v8 = v5;
    __int16 v9 = 2080;
    id v10 = label;
    __int16 v11 = 2112;
    __int16 v12 = v2;
    _os_log_debug_impl(&dword_19ED3F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx continuing on %s%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __brc_leave_section((uint64_t)&v5);
}

void sub_19ED7A9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

__CFString *BRQueryItemFieldsPrettyPrint(unsigned int a1)
{
  if (a1 == 0xFFFF)
  {
    id v2 = @"all";
  }
  else
  {
    BRCPrettyPrintBitmap(a1, br_notifs_fields_entries);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id _getContentTypeValue(void *a1, char a2)
{
  id v3 = a1;
  if ([v3 isDirectory])
  {
    int v4 = (id *)MEMORY[0x1E4F443C8];
LABEL_7:
    PreferredIdentifierForTag = [*v4 identifier];
    goto LABEL_8;
  }
  if ([v3 isFinderBookmark])
  {
    int v4 = (id *)MEMORY[0x1E4F44308];
    goto LABEL_7;
  }
  uint64_t v5 = [v3 isSymlink];
  if (v5)
  {
    int v4 = (id *)MEMORY[0x1E4F444D8];
    goto LABEL_7;
  }
  if (BRIsFPFSEnabled(v5, v6) && (a2 & 1) == 0)
  {
    if ([v3 isPackage])
    {
      int v4 = (id *)MEMORY[0x1E4F44468];
    }
    else
    {
      [v3 isDocument];
      int v4 = (id *)MEMORY[0x1E4F44378];
    }
    goto LABEL_7;
  }
  if ([v3 isPackage])
  {
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F22680];
  }
  else
  {
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F22608];
    if ([v3 isDocument]) {
      CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F22590];
    }
  }
  id v10 = [v3 logicalName];
  uint64_t v11 = objc_msgSend(v10, "br_pathExtension");
  __int16 v12 = (void *)v11;
  uint64_t v13 = &stru_1EF11DA20;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  id v14 = v13;

  if ([(__CFString *)v14 rangeOfString:@"."] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(__CFString *)v14 isEqualToString:@"tar.gz"])
    {
      long long v15 = @"tgz";
    }
    else
    {
      long long v15 = [(__CFString *)v14 pathExtension];
    }

    id v14 = v15;
  }
  PreferredIdentifierForTag = (void *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v14, v9);

LABEL_8:

  return PreferredIdentifierForTag;
}

uint64_t _getIsDownloading(void *a1)
{
  id v1 = a1;
  if ([v1 isNetworkOffline]) {
    goto LABEL_4;
  }
  int v2 = objc_msgSend(v1, "br_downloadStatus");
  if (!v2)
  {
    uint64_t v3 = 0;
    goto LABEL_9;
  }
  if (v2 == 3)
  {
LABEL_4:
    uint64_t v3 = MEMORY[0x1E4F1CC28];
  }
  else
  {
    int v4 = [v1 isDownloadRequested];
    int v5 = [v4 BOOLValue];

    uint64_t v3 = MEMORY[0x1E4F1CC28];
    if (v5)
    {
      uint64_t v6 = [v1 attributeForKey:@"dlErr"];

      if (!v6) {
        uint64_t v3 = MEMORY[0x1E4F1CC38];
      }
    }
  }
LABEL_9:

  return v3;
}

uint64_t _getIsUploading(void *a1)
{
  id v1 = a1;
  char v2 = [v1 isNetworkOffline];
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  if ((v2 & 1) == 0)
  {
    int v4 = objc_msgSend(v1, "br_uploadStatus");
    if ((v4 - 1) < 2)
    {
      id v7 = [v1 attributeForKey:@"ulErr"];

      if (!v7) {
        uint64_t v3 = MEMORY[0x1E4F1CC38];
      }
    }
    else
    {
      if (!v4)
      {
LABEL_8:
        uint64_t v3 = 0;
        goto LABEL_11;
      }
      if (v4 != 3)
      {
        int v5 = brc_bread_crumbs((uint64_t)"_getIsUploading", 402);
        uint64_t v6 = brc_default_log(0);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          __25__BRQueryItem_initialize__block_invoke_18_cold_1();
        }

        goto LABEL_8;
      }
    }
  }
LABEL_11:

  return v3;
}

void sub_19ED7BFDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED7C8FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED7C9C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED7CA68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED7D398(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED7DA0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED7DB9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED7E014(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED7F3A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED7F660(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED7F858(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED808CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED80974(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED80AD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED80E8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED818A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8198C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED81AF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED81CCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED82618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED827A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED82944(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t BRGetLastUsedDate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return softLink_SIGetLastUsedDate(a1, a2, a3);
}

uint64_t BRSetLastUsedDate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return softLink_SISetLastUsedDate(a1, a2, a3);
}

uint64_t BRActivityDump(uint64_t a1, uint64_t a2)
{
  return softLink_SIActivityDump(a1, a2);
}

uint64_t init_SIGetLastUsedDate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = MobileSpotlightIndexLibrary();
  id v7 = (uint64_t (*)())dlsym(v6, "_SIGetLastUsedDate");
  softLink_SIGetLastUsedDate = v7;
  if (!v7)
  {
    CFStringRef v9 = brc_bread_crumbs((uint64_t)"init_SIGetLastUsedDate", 22);
    id v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      init_SIGetLastUsedDate_cold_1();
    }

    __assert_rtn("init_SIGetLastUsedDate", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/SpotlightIndex_SoftLinking.m", 22, "Can't find _SIGetLastUsedDate in MobileSpotlightIndex framework");
  }

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, a3);
}

void *MobileSpotlightIndexLibrary()
{
  uint64_t result = (void *)MobileSpotlightIndexLibrary_frameworkLibrary;
  if (!MobileSpotlightIndexLibrary_frameworkLibrary)
  {
    uint64_t result = dlopen("/System/Library/PrivateFrameworks/MobileSpotlightIndex.framework/MobileSpotlightIndex", 2);
    MobileSpotlightIndexLibrary_frameworkLibrary = (uint64_t)result;
    if (!result) {
      MobileSpotlightIndexLibrary_cold_1();
    }
  }
  return result;
}

uint64_t init_SISetLastUsedDate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = MobileSpotlightIndexLibrary();
  id v7 = (uint64_t (*)())dlsym(v6, "_SISetLastUsedDate");
  softLink_SISetLastUsedDate = v7;
  if (!v7)
  {
    CFStringRef v9 = brc_bread_crumbs((uint64_t)"init_SISetLastUsedDate", 23);
    id v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      init_SISetLastUsedDate_cold_1();
    }

    __assert_rtn("init_SISetLastUsedDate", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/SpotlightIndex_SoftLinking.m", 23, "Can't find _SISetLastUsedDate in MobileSpotlightIndex framework");
  }

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, a3);
}

uint64_t init_SIActivityDump(uint64_t a1, uint64_t a2)
{
  int v4 = MobileSpotlightIndexLibrary();
  int v5 = (uint64_t (*)())dlsym(v4, "_SIActivityDump");
  softLink_SIActivityDump = v5;
  if (!v5)
  {
    id v7 = brc_bread_crumbs((uint64_t)"init_SIActivityDump", 24);
    uint64_t v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      init_SIActivityDump_cold_1();
    }

    __assert_rtn("init_SIActivityDump", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/SpotlightIndex_SoftLinking.m", 24, "Can't find _SIActivityDump in MobileSpotlightIndex framework");
  }

  return ((uint64_t (*)(uint64_t, uint64_t))v5)(a1, a2);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id BRCXPCBRItemServiceProtocolInterface()
{
  if (BRCXPCBRItemServiceProtocolInterface_once != -1) {
    dispatch_once(&BRCXPCBRItemServiceProtocolInterface_once, &__block_literal_global_539);
  }
  uint64_t v0 = (void *)BRCXPCBRItemServiceProtocolInterface_iface;

  return v0;
}

void __BRCXPCBRItemServiceProtocolInterface_block_invoke()
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    uint64_t v0 = objc_opt_new();
    id v1 = (void *)BRCXPCBRItemServiceProtocolInterface_iface;
    BRCXPCBRItemServiceProtocolInterface_iface = v0;

    [(id)BRCXPCBRItemServiceProtocolInterface_iface setProtocol:&unk_1EF1565D8];
    BRCSetupGenericOperations(&unk_1EF1565D8, (void *)BRCXPCBRItemServiceProtocolInterface_iface);
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    char v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    uint64_t v3 = (void *)BRCXPCBRItemServiceProtocolInterface_iface;
    int v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
    [v3 setClasses:v4 forSelector:sel_getAttributeValues_reply_ argumentIndex:0 ofReply:0];

    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    _DWORD v9[2] = objc_opt_class();
    void v9[3] = objc_opt_class();
    void v9[4] = objc_opt_class();
    v9[5] = objc_opt_class();
    v9[6] = objc_opt_class();
    Class CKRecordIDClass = getCKRecordIDClass();
    if (!CKRecordIDClass) {
      Class CKRecordIDClass = (Class)objc_opt_class();
    }
    v9[7] = CKRecordIDClass;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:8];

    id v7 = (void *)BRCXPCBRItemServiceProtocolInterface_iface;
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    [v7 setClasses:v8 forSelector:sel_getAttributeValues_reply_ argumentIndex:0 ofReply:1];
  }
  else
  {
    uint64_t v6 = brc_bread_crumbs((uint64_t)"BRCXPCBRItemServiceProtocolInterface_block_invoke", 549);
    uint64_t v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __BRCXPCBRItemServiceProtocolInterface_block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
}

id BRCXPCICDFileProviderClientSideCollaborationProtocolInterface()
{
  if (BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_once != -1) {
    dispatch_once(&BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_once, &__block_literal_global_573);
  }
  uint64_t v0 = (void *)BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_iface;

  return v0;
}

void __BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_block_invoke()
{
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    uint64_t v0 = objc_opt_new();
    id v1 = (void *)BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_iface;
    BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_iface = v0;

    [(id)BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_iface setProtocol:&unk_1EF156638];
    char v2 = (void *)BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_iface;
    BRCSetupGenericOperations(&unk_1EF156638, v2);
  }
  else
  {
    uint64_t v3 = brc_bread_crumbs((uint64_t)"BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_block_invoke", 569);
    int v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
}

id BRCXPCSharingOperationInterface()
{
  if (BRCXPCSharingOperationInterface_once != -1) {
    dispatch_once(&BRCXPCSharingOperationInterface_once, &__block_literal_global_587);
  }
  uint64_t v0 = (void *)BRCXPCSharingOperationInterface_iface;

  return v0;
}

void __BRCXPCSharingOperationInterface_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)BRCXPCSharingOperationInterface_iface;
  BRCXPCSharingOperationInterface_iface = v0;

  if (FPIsCloudDocsWithFPFSEnabled()) {
    char v2 = (void **)&protocolRef_BRShareOperationFPFSProtocol;
  }
  else {
    char v2 = (void **)&protocolRef_BRShareOperationLegacyProtocol;
  }
  [(id)BRCXPCSharingOperationInterface_iface setProtocol:*v2];
  BRCSetupGenericOperations(*v2, (void *)BRCXPCSharingOperationInterface_iface);
  uint64_t v3 = (void *)BRCXPCSharingOperationInterface_iface;

  BRCSetupGenericOperations(&unk_1EF14FF00, v3);
}

Class initCKRecordZoneID()
{
  CloudKitLibrary_0();
  Class result = objc_getClass("CKRecordZoneID");
  classCKRecordZoneID = (uint64_t)result;
  getClass CKRecordZoneIDClass = (uint64_t (*)())CKRecordZoneIDFunction;
  return result;
}

id CKRecordZoneIDFunction()
{
  return (id)classCKRecordZoneID;
}

id CKUserIdentityLookupInfoFunction()
{
  return (id)classCKUserIdentityLookupInfo;
}

id CKShareParticipantFunction()
{
  return (id)classCKShareParticipant;
}

NSObject *BRCopyBundleIdentifierForURLInContainer(NSObject *a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _CFURLPromiseCopyPhysicalURL();
  uint64_t v3 = (const void *)v2;
  if (v2) {
    int v4 = v2;
  }
  else {
    int v4 = a1;
  }
  if (![v4 br_isInSyncedLocation])
  {
    long long v17 = 0;
    goto LABEL_33;
  }
  memset(v36, 0, sizeof(v36));
  __brc_create_section(0, (uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 41, v36);
  int v5 = brc_bread_crumbs((uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 41);
  uint64_t v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    rlimit v38 = v36[0];
    __int16 v39 = 2080;
    uint64_t v40 = "_BRCopyBundleIdentifierForURLInContainer";
    __int16 v41 = 2112;
    uint64_t v42 = v4;
    __int16 v43 = 2112;
    id v44 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s %@%@", buf, 0x2Au);
  }

  id v7 = (void *)MEMORY[0x19F3C4670]();
  uint64_t v8 = v4;
  [v8 br_addPhysicalProperty];
  id v35 = 0;
  uint64_t v9 = *MEMORY[0x1E4F1C628];
  id v34 = 0;
  char v10 = [v8 getPromisedItemResourceValue:&v35 forKey:v9 error:&v34];
  id v11 = v35;
  __int16 v12 = (char *)v34;
  if ((v10 & 1) == 0)
  {
    long long v15 = brc_bread_crumbs((uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 84);
    uint64_t v18 = brc_default_log(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v8 path];
      *(_DWORD *)buf = 138412802;
      rlimit v38 = v19;
      __int16 v39 = 2112;
      uint64_t v40 = v12;
      __int16 v41 = 2112;
      uint64_t v42 = v15;
      _os_log_impl(&dword_19ED3F000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to get NSURLIsDirectoryKey on '%@': %@%@", buf, 0x20u);
    }
    long long v17 = 0;
    goto LABEL_32;
  }
  if ([v11 BOOLValue])
  {
    id v33 = 0;
    uint64_t v13 = *MEMORY[0x1E4F1C658];
    uint64_t v32 = v12;
    char v14 = [v8 getPromisedItemResourceValue:&v33 forKey:v13 error:&v32];
    long long v15 = v33;
    uint64_t v16 = v32;

    if ((v14 & 1) == 0)
    {
      uint64_t v18 = brc_bread_crumbs((uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 91);
      __int16 v22 = brc_default_log(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v26 = [v8 path];
        *(_DWORD *)buf = 138412802;
        rlimit v38 = v26;
        __int16 v39 = 2112;
        uint64_t v40 = v16;
        __int16 v41 = 2112;
        uint64_t v42 = v18;
        _os_log_impl(&dword_19ED3F000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to get NSURLIsPackageKey on dir at '%@': %@%@", buf, 0x20u);
      }
      goto LABEL_29;
    }
    if (([v15 BOOLValue] & 1) == 0)
    {
      uint64_t v18 = brc_bread_crumbs((uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 95);
      __int16 v22 = brc_default_log(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = [v8 path];
        BRCopyBundleIdentifierForURLInContainer_cold_1(v27, (uint64_t)v18, buf, v22);
      }
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v16 = v12;
  }
  long long v15 = [v8 br_cloudDocsContainer];
  __int16 v20 = [v15 identifier];
  int v21 = [v20 isEqualToString:@"com.apple.CloudDocs"];

  if (v21)
  {
    uint64_t v18 = brc_bread_crumbs((uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 104);
    __int16 v22 = brc_default_log(1);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v29 = [v15 identifier];
      __int16 v30 = [v8 path];
      *(_DWORD *)buf = 138412802;
      rlimit v38 = v29;
      __int16 v39 = 2112;
      uint64_t v40 = v30;
      __int16 v41 = 2112;
      uint64_t v42 = v18;
      _os_log_debug_impl(&dword_19ED3F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] path in container %@ at '%@'%@", buf, 0x20u);
    }
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v23 = [v15 bundleIdentifiers];
  uint64_t v18 = [v23 anyObject];

  if (v18)
  {
    id v24 = brc_bread_crumbs((uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 161);
    id v25 = brc_default_log(1);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = [v8 path];
      *(_DWORD *)buf = 138413058;
      rlimit v38 = v18;
      __int16 v39 = 2112;
      uint64_t v40 = v31;
      __int16 v41 = 2112;
      uint64_t v42 = v15;
      __int16 v43 = 2112;
      id v44 = v24;
      _os_log_debug_impl(&dword_19ED3F000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] bundle %@ can open '%@' in container %@%@", buf, 0x2Au);
    }
    uint64_t v18 = v18;
    long long v17 = v18;
    goto LABEL_31;
  }
LABEL_30:
  long long v17 = 0;
LABEL_31:
  __int16 v12 = (char *)v16;
LABEL_32:

  __brc_leave_section((uint64_t)v36);
LABEL_33:
  if (v3) {
    CFRelease(v3);
  }
  return v17;
}

void sub_19ED86B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

NSObject *BRIsURLInCloudDocsContainer(NSObject *result, NSObject **a2)
{
  if (result)
  {
    uint64_t v3 = BRCopyBundleIdentifierForURLInContainer(result);
    *a2 = v3;
    return (v3 != 0);
  }
  return result;
}

uint64_t BRCopyUbiquitousBookmarkDataForDocumentAtURL(void *a1, uint64_t a2)
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  int v4 = (void *)MEMORY[0x19F3C4670]();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __BRCopyUbiquitousBookmarkDataForDocumentAtURL_block_invoke;
  void v9[3] = &unk_1E59AE8E0;
  id v11 = &v13;
  uint64_t v12 = a2;
  uint64_t v6 = v5;
  char v10 = v6;
  objc_msgSend(a1, "br_bookmarkableStringWithEtag:completion:", 0, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v7 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v7;
}

void sub_19ED86D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __BRCopyUbiquitousBookmarkDataForDocumentAtURL_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = v6;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  if (v7 && *(void *)(a1 + 48)) {
    **(void **)(a1 + 48) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t BRCopyDocumentURLForUbiquitousBookmarkData(uint64_t a1, void *a2)
{
  int v4 = (void *)MEMORY[0x19F3C4670]();
  id v9 = 0;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "br_documentURLFromBookmarkableString:error:", a1, &v9);
  id v6 = v9;
  id v7 = v6;
  if (a2 && v6) {
    *a2 = v6;
  }

  return v5;
}

uint64_t BRIsURLExternalDocumentReference(void *a1)
{
  return objc_msgSend(a1, "br_isExternalDocumentReference");
}

uint64_t BRCopyResolvedURLForExternalDocumentReferenceAtURL(void *a1, void *a2)
{
  int v4 = (void *)MEMORY[0x19F3C4670]();
  id v9 = 0;
  uint64_t v5 = objc_msgSend(a1, "br_URLByResolvingExternalDocumentReferenceWithError:", &v9);
  id v6 = v9;
  id v7 = v6;
  if (a2 && !v5) {
    *a2 = v6;
  }

  return v5;
}

uint64_t BRCopyRepresentedFileNameForFaultFileURL(void *a1)
{
  if (!_CFURLIsItemPromiseAtURL()) {
    return 0;
  }
  uint64_t v2 = _CFURLCopyLogicalNameOfPromiseAtURL();
  if (!v2)
  {
    uint64_t v3 = (void *)MEMORY[0x19F3C4670]();
    int v4 = [a1 lastPathComponent];
    uint64_t v5 = v4;
    if (v4 && (unint64_t)[(__CFString *)v4 length] >= 9)
    {
      CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      v8.length = [(__CFString *)v5 length] - 8;
      v8.id location = 1;
      uint64_t v2 = (uint64_t)CFStringCreateWithSubstring(v6, v5, v8);
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  return v2;
}

uint64_t BRIsURLInMobileDocuments(void *a1)
{
  return objc_msgSend(a1, "br_isInSyncedLocation");
}

uint64_t BRTrashExternalDocumentReference(void *a1, void *a2, uint64_t a3, CFErrorRef *a4)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (BRTrashExternalDocumentReference_onceToken != -1) {
    dispatch_once(&BRTrashExternalDocumentReference_onceToken, &__block_literal_global_17);
  }
  id v7 = (void *)MEMORY[0x19F3C4670]();
  CFRange v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = [a2 path];
  memset(v41, 0, sizeof(v41));
  __brc_create_section(0, (uint64_t)"BRTrashExternalDocumentReference", 335, v41);
  char v10 = brc_bread_crumbs((uint64_t)"BRTrashExternalDocumentReference", 335);
  id v11 = brc_default_log(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v43 = v41[0];
    __int16 v44 = 2080;
    uint64_t v45 = "BRTrashExternalDocumentReference";
    __int16 v46 = 2112;
    id v47 = v9;
    __int16 v48 = 2112;
    v49 = v10;
    _os_log_debug_impl(&dword_19ED3F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s: %@%@", buf, 0x2Au);
  }

  id v40 = 0;
  uint64_t v12 = *MEMORY[0x1E4F1C610];
  id v39 = 0;
  char v13 = [a1 getResourceValue:&v40 forKey:v12 error:&v39];
  id v14 = v40;
  CFErrorRef v15 = (CFErrorRef)v39;
  if (v13)
  {
    if ([v14 BOOLValue])
    {
      id v38 = 0;
      uint64_t v16 = *MEMORY[0x1E4F1C6E8];
      id v37 = 0;
      char v17 = [a1 getResourceValue:&v38 forKey:v16 error:&v37];
      id v32 = v38;

      CFErrorRef v18 = (CFErrorRef)v37;
      if (v17)
      {
        if ([v32 hasPrefix:@"."]
          && ([v32 hasSuffix:@".alias"] & 1) != 0)
        {
          if (!v9)
          {
            a2 = objc_msgSend(a1, "br_URLByResolvingExternalDocumentReferenceWithError:", 0);
            id v9 = [a2 path];
          }
          if (!objc_msgSend(v9, "containsString:", BRTrashExternalDocumentReference_sharedDocsContainerPartialPath, v32))goto LABEL_33; {
          uint64_t v19 = brc_bread_crumbs((uint64_t)"BRTrashExternalDocumentReference", 363);
          }
          __int16 v20 = brc_default_log(1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            BRTrashExternalDocumentReference_cold_2();
          }

          CFErrorRef v36 = v18;
          char v21 = [v8 removeItemAtPath:v9 error:&v36];
          __int16 v22 = v36;

          if (v21)
          {
            CFErrorRef v18 = v22;
LABEL_33:
            CFErrorRef v34 = v18;
            char v27 = [v8 removeItemAtURL:a1 error:&v34];
            CFErrorRef v15 = v34;

            if (v27)
            {
              uint64_t v24 = 1;
LABEL_35:
              id v14 = v32;
              goto LABEL_27;
            }
            __int16 v28 = brc_bread_crumbs((uint64_t)"BRTrashExternalDocumentReference", 373);
            id v29 = brc_default_log(1);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              BRTrashExternalDocumentReference_cold_1();
            }

            CFErrorRef v33 = v15;
            char v30 = BRRemoveItemAtURL(a1, &v33);
            uint64_t v31 = v33;

            if (v30)
            {
              uint64_t v24 = 1;
LABEL_45:
              id v14 = v32;
              CFErrorRef v15 = v31;
              goto LABEL_27;
            }
            if (!a4)
            {
              uint64_t v24 = 0;
              goto LABEL_45;
            }
            CFErrorRef v15 = v31;
            goto LABEL_24;
          }
          id v35 = v22;
          char v26 = BRRemoveItemAtURL(a2, &v35);
          CFErrorRef v15 = v35;

          if (v26)
          {
            CFErrorRef v18 = v15;
            goto LABEL_33;
          }
          if (!a4)
          {
            uint64_t v24 = 0;
            goto LABEL_35;
          }
LABEL_24:
          id v14 = v32;
          goto LABEL_25;
        }
        if (a4)
        {
          CFErrorRef v23 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 259, 0);
          id v14 = v32;
          CFErrorRef v15 = v18;
          goto LABEL_26;
        }
      }
      else if (a4)
      {
        CFErrorRef v15 = v18;
        goto LABEL_24;
      }
      uint64_t v24 = 0;
      id v14 = v32;
      CFErrorRef v15 = v18;
      goto LABEL_27;
    }
    if (a4)
    {
      CFErrorRef v23 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 259, 0);
LABEL_26:
      uint64_t v24 = 0;
      *a4 = v23;
      goto LABEL_27;
    }
  }
  else if (a4)
  {
LABEL_25:
    CFErrorRef v23 = v15;
    CFErrorRef v15 = v23;
    goto LABEL_26;
  }
  uint64_t v24 = 0;
LABEL_27:
  __brc_leave_section((uint64_t)v41);

  return v24;
}

void sub_19ED8747C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __BRTrashExternalDocumentReference_block_invoke()
{
  BRTrashExternalDocumentReference_sharedDocsContainerPartialPath = [NSString stringWithFormat:@"/Mobile Documents/%@/", @"com~apple~SharedDocs"];

  return MEMORY[0x1F41817F8]();
}

void sub_19ED87694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSDBuildInfoClass_block_invoke(uint64_t a1)
{
  if (!SeedingLibraryCore_frameworkLibrary) {
    SeedingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("SDBuildInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSDBuildInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SeedingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SeedingLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_19ED8A4C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8A594(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8A5FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8A8FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8A9D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8ABE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19ED8AD08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8ADDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8AEB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8AF78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8B06C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8B1E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8B460(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8B534(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED8BC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __brc_leave_section((uint64_t)&a66);
  _Unwind_Resume(a1);
}

void sub_19ED8BE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19ED8C510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
}

void sub_19ED8C8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED8CC44(_Unwind_Exception *a1)
{
  __brc_leave_section(v1 - 64);
  _Unwind_Resume(a1);
}

void sub_19ED8CD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __dispatch_group_async_with_logs_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v2 = brc_bread_crumbs((uint64_t)"dispatch_group_async_with_logs_block_invoke", 295);
  uint64_t v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32));
    *(_DWORD *)buf = 134218498;
    uint64_t v8 = v5;
    __int16 v9 = 2080;
    char v10 = label;
    __int16 v11 = 2112;
    uint64_t v12 = v2;
    _os_log_debug_impl(&dword_19ED3F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx continuing on %s%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __brc_leave_section((uint64_t)&v5);
}

void sub_19ED8D1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_19ED8D438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19ED8DA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t LBItemCopyLastEditorPeerNameForURL()
{
  return 0;
}

uint64_t LBRevisionCopyForURL()
{
  return 0;
}

uint64_t LBRevisionHasUnsavedConflictForURL()
{
  return 0;
}

uint64_t LBRevisionMarkSavedForURL()
{
  return 1;
}

uint64_t LBRevisionRestoreForURL()
{
  return 1;
}

void LBDeleteItemAtURL(uint64_t a1, NSObject *a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LBDeleteItemAtURL_block_invoke;
  block[3] = &unk_1E59ADC98;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(a2, block);
}

uint64_t __LBDeleteItemAtURL_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void LBEvictItemAtURL(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __LBEvictItemAtURL_block_invoke;
  void v9[3] = &unk_1E59ADD58;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  BREvictItemAtURL(a1, v9);
}

void __LBEvictItemAtURL_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __LBEvictItemAtURL_block_invoke_2;
  v7[3] = &unk_1E59ADD08;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __LBEvictItemAtURL_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void LBStartSyncForItem(uint64_t a1, void *a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v8[0] = a1;
    id v7 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v7 = 0;
  }
  LBStartDownloadForItems(v7, v5, v6);
}

void LBStartDownloadForItems(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int active_platform = dyld_get_active_platform();
  if ((active_platform & 0xFFFFFFFB) == 2 || active_platform == 11 || active_platform == 1)
  {
    unsigned int v8 = dyld_program_sdk_at_least();
  }
  else
  {
    syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
    unsigned int v8 = 1;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __LBStartDownloadForItems_block_invoke;
  v12[3] = &unk_1E59ADD58;
  uint64_t v9 = v8;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  BRStartDownloadForItemsWithOptions(a1, v9, v12);
}

void __LBStartDownloadForItems_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __LBStartDownloadForItems_block_invoke_2;
  v7[3] = &unk_1E59ADD08;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __LBStartDownloadForItems_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void LBSetSyncEnabledForItem(uint64_t a1, char a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (a1 && a3)
  {
    uint64_t v12 = dispatch_get_global_queue(0, 0);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __LBSetSyncEnabledForItem_block_invoke_2;
    v14[3] = &unk_1E59AEAD8;
    char v19 = a2;
    uint64_t v17 = a1;
    uint64_t v18 = a3;
    id v13 = (id *)&v15;
    CFErrorRef v15 = v9;
    id v16 = v11;
    dispatch_async(v12, v14);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __LBSetSyncEnabledForItem_block_invoke;
    block[3] = &unk_1E59ADC98;
    id v13 = &v21;
    id v21 = v10;
    dispatch_async(v9, block);
  }
}

void __LBSetSyncEnabledForItem_block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __LBSetSyncEnabledForItem_block_invoke_2(uint64_t a1)
{
  BOOL v2 = *(unsigned char *)(a1 + 64) != 0;
  id v3 = *(void **)(a1 + 56);
  id v4 = *(id *)(a1 + 48);
  id v5 = v3;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ((v2 ^ [v6 isUbiquitousItemAtURL:v4]))
  {
    id v25 = 0;
    uint64_t v7 = *MEMORY[0x1E4F1C5C0];
    id v24 = 0;
    char v8 = [v4 getResourceValue:&v25 forKey:v7 error:&v24];
    id v9 = v25;
    id v10 = v24;
    id v11 = v10;
    if (v8)
    {
      if (([v9 isEqual:*MEMORY[0x1E4F1C5B8]] & 1) == 0
        && ([v9 isEqual:*MEMORY[0x1E4F1C5D0]] & 1) == 0)
      {
        uint64_t v12 = _NSErrorWithFilePathErrnoAndVariant();
        goto LABEL_13;
      }
      if ([v5 checkResourceIsReachableAndReturnError:0])
      {
        uint64_t v12 = _NSErrorWithFilePathAndErrno();
LABEL_13:
        id v13 = (void *)v12;
        goto LABEL_14;
      }
      id v23 = v11;
      char v15 = [v6 moveItemAtURL:v4 toURL:v5 error:&v23];
      id v16 = v23;

      if (v15)
      {
        id v13 = 0;
        id v11 = v16;
        goto LABEL_14;
      }
      id v14 = v16;
    }
    else
    {
      id v14 = v10;
    }
    id v13 = v14;
    id v11 = v14;
  }
  else
  {
    id v13 = _NSErrorWithFilePathErrnoAndVariant();
    id v11 = 0;
    id v9 = 0;
  }
LABEL_14:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LBSetSyncEnabledForItem_block_invoke_3;
  block[3] = &unk_1E59ADD08;
  uint64_t v17 = *(NSObject **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  id v21 = v13;
  id v22 = v18;
  id v19 = v13;
  dispatch_async(v17, block);
}

uint64_t __LBSetSyncEnabledForItem_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void LBIsSyncEnabledForItem(void *a1, uint64_t a2, void *a3)
{
  id v4 = (void *)*MEMORY[0x1E4F1C690];
  id v8 = 0;
  id v5 = a3;
  id v6 = BRGetAttributeValueForItem(a1, v4, &v8);
  id v7 = v8;
  v5[2](v5, [v6 BOOLValue], v7);
}

void LBGetURLForPublishedItem(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __LBGetURLForPublishedItem_block_invoke;
  void v9[3] = &unk_1E59AEB28;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  BRGetURLForPublishedItem(a1, v9);
}

void __LBGetURLForPublishedItem_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __LBGetURLForPublishedItem_block_invoke_2;
  void v15[3] = &unk_1E59ADE98;
  id v10 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v10, v15);
}

uint64_t __LBGetURLForPublishedItem_block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void LBCalculateSpaceReclaimableByEviction(NSObject *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LBCalculateSpaceReclaimableByEviction_block_invoke;
  block[3] = &unk_1E59ADC98;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(a1, block);
}

uint64_t __LBCalculateSpaceReclaimableByEviction_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void LBEvictItemsToReclaimSpace(uint64_t a1, NSObject *a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LBEvictItemsToReclaimSpace_block_invoke;
  block[3] = &unk_1E59ADC98;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(a2, block);
}

uint64_t __LBEvictItemsToReclaimSpace_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void LBEvictItemsToReclaimSpaceWithUrgency(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LBEvictItemsToReclaimSpaceWithUrgency_block_invoke;
  block[3] = &unk_1E59ADC98;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(a3, block);
}

uint64_t __LBEvictItemsToReclaimSpaceWithUrgency_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void LBGetTotalApplicationDocumentUsage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __LBGetTotalApplicationDocumentUsage_block_invoke;
  v7[3] = &unk_1E59ADF60;
  id v8 = v3;
  id v9 = v4;
  id v5 = v4;
  id v6 = v3;
  BRGetTotalApplicationDocumentUsage(v7);
}

void __LBGetTotalApplicationDocumentUsage_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LBGetTotalApplicationDocumentUsage_block_invoke_2;
  block[3] = &unk_1E59ADE48;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __LBGetTotalApplicationDocumentUsage_block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void LBNoteConfigurationProfileUpdate(NSObject *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LBNoteConfigurationProfileUpdate_block_invoke;
  block[3] = &unk_1E59ADC98;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(a1, block);
}

uint64_t __LBNoteConfigurationProfileUpdate_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void LBGetApplicationDocumentUsageInformation(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __LBGetApplicationDocumentUsageInformation_block_invoke;
  void v9[3] = &unk_1E59ADF60;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  BRGetApplicationDocumentUsageInformation(a1, v9);
}

void __LBGetApplicationDocumentUsageInformation_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LBGetApplicationDocumentUsageInformation_block_invoke_2;
  block[3] = &unk_1E59ADE48;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __LBGetApplicationDocumentUsageInformation_block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t LBRefreshUbiquityAccountToken()
{
  BOOL v0 = +[BRAccount refreshCurrentLoggedInAccount];
  uint64_t v1 = +[BRAccount currentCachedLoggedInAccountWithError:0];
  BOOL v2 = [v1 perAppAccountIdentifier];
  if (v0 || ([(id)LBRefreshUbiquityAccountToken_lastReturnedAccountToken isEqualToData:v2] & 1) == 0)
  {
    objc_storeStrong((id *)&LBRefreshUbiquityAccountToken_lastReturnedAccountToken, v2);
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void LBRegisterInitialSyncHandlerForURL(uint64_t a1, NSObject *a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LBRegisterInitialSyncHandlerForURL_block_invoke;
  block[3] = &unk_1E59ADC98;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(a2, block);
}

uint64_t __LBRegisterInitialSyncHandlerForURL_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void LBNoteAccountUpdate(NSObject *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LBNoteAccountUpdate_block_invoke;
  block[3] = &unk_1E59ADC98;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(a1, block);
}

uint64_t __LBNoteAccountUpdate_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_19ED8F6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED9028C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x16u);
}

void sub_19ED9164C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED91A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED91C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED92F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19ED933CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED93518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED939F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED93B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED93D94(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19ED93E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED94054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED942E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED94570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED95294(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED95E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19ED964A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19ED97524(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id fileProgressSubscribeQueue()
{
  if (fileProgressSubscribeQueue_onceToken != -1) {
    dispatch_once(&fileProgressSubscribeQueue_onceToken, &__block_literal_global_24);
  }
  BOOL v0 = (void *)fileProgressSubscribeQueue_fileProgressSubscribeQueue;

  return v0;
}

void sub_19ED97D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __fileProgressSubscribeQueue_block_invoke()
{
  BOOL v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.clouddocs.file-progresss-registration", v0);

  BOOL v2 = (void *)fileProgressSubscribeQueue_fileProgressSubscribeQueue;
  fileProgressSubscribeQueue_fileProgressSubscribeQueue = (uint64_t)v1;
}

void sub_19ED9896C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t _mkstempWrapper(void *a1, void *a2, void *a3, _DWORD *a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a3;
  int v11 = open((const char *)[a2 fileSystemRepresentation], 33028);
  if (v11 < 0)
  {
    uint64_t v13 = 0xFFFFFFFFLL;
    goto LABEL_14;
  }
  int v12 = v11;
  if ((__pthread_fchdir() & 0x80000000) == 0)
  {
    if ([v10 getFileSystemRepresentation:__s maxLength:1024])
    {
      uint64_t v13 = mkstemp(__s);
      if ((v13 & 0x80000000) == 0)
      {
        if (a5)
        {
          *a5 = [v9 stringWithFileSystemRepresentation:__s length:strlen(__s)];
          if (a4) {
            goto LABEL_7;
          }
        }
        else
        {
          unlink(__s);
          if (a4)
          {
LABEL_7:
            *a4 = v13;
            if (!v12) {
              goto LABEL_14;
            }
            goto LABEL_13;
          }
        }
        close(v13);
        if (!v12) {
          goto LABEL_14;
        }
LABEL_13:
        close(v12);
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    *__error() = 63;
  }
  uint64_t v13 = 0xFFFFFFFFLL;
LABEL_12:
  if (v12) {
    goto LABEL_13;
  }
LABEL_14:

  return v13;
}

void sub_19ED996AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void less_exit_handler()
{
  int v0 = 0;
  while (waitpid(-1, &v0, 1) > 0)
    ;
  exit(0);
}

uint64_t brc_backtrace_snprint(char *a1, size_t a2)
{
  v12[24] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t result = backtrace(v12, 24);
  if (result)
  {
    uint64_t v5 = 0;
    uint64_t v6 = result;
    do
    {
      memset(&v11, 0, sizeof(v11));
      if (v5)
      {
        if (dladdr(v12[v5], &v11))
        {
          dli_sname = v11.dli_sname;
          id v8 = rindex(v11.dli_fname, 47);
          dli_fname = v11.dli_fname;
          if (v8) {
            dli_fname = v8 + 1;
          }
        }
        else
        {
          dli_sname = "";
          dli_fname = "";
        }
        uint64_t result = snprintf(a1, a2, "frame %d: %lld %s in %s\n", v5, v12[v5], dli_sname, dli_fname);
        BOOL v10 = a2 > (int)result;
        a2 -= (int)result;
        if (!v10) {
          return result;
        }
        a1 += (int)result;
      }
      ++v5;
    }
    while (v6 != v5);
  }
  return result;
}

id brc_backtrace()
{
  MEMORY[0x1F4188790]();
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  brc_backtrace_snprint(v2, 0x2000uLL);
  int v0 = [NSString stringWithUTF8String:v2];

  return v0;
}

id brc_backtrace_non_detailed_but_fast()
{
  MEMORY[0x1F4188790]();
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  brc_backtrace_snprint(v2, 0x2000uLL);
  int v0 = [NSString stringWithUTF8String:v2];

  return v0;
}

void brc_backtrace_exception_snprint(char *a1, size_t a2, void *a3)
{
  id v6 = [a3 callStackSymbols];
  id v5 = [v6 description];
  snprintf(a1, a2, "%s", (const char *)[v5 UTF8String]);
}

void sub_19ED9B868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED9B938(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED9BA78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED9BBB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED9BCF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED9C0B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED9C1F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED9C328(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED9C460(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED9C598(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED9C6F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED9C7C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ED9D1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED9D924(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19ED9DA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED9DC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19ED9FD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EDA0190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BRContainer *BRContainerIfDirectoryInHomeURLIsSynced(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1 URLByAppendingPathComponent:a2];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 path];
    ssize_t v9 = getxattr((const char *)[v8 fileSystemRepresentation], (const char *)objc_msgSend(@"com.apple.icloud.desktop", "UTF8String"), 0, 0, 0, 0);

    if ((v9 & 0x8000000000000000) == 0)
    {
      BOOL v10 = [[BRContainer alloc] initWithDocsOrDesktopContainerID:v5];
      goto LABEL_10;
    }
    if (*__error() != 93 && *__error() != 2)
    {
      Dl_info v11 = brc_bread_crumbs((uint64_t)"BRContainerIfDirectoryInHomeURLIsSynced", 1406);
      int v12 = brc_default_log(0);
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
        BRContainerIfDirectoryInHomeURLIsSynced_cold_1(v7, (uint64_t)v11, v12);
      }
    }
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

void sub_19EDA10DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19EDA1780(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDA184C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDA1B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EDA1E10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDA248C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDA3BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  _Block_object_dispose((const void *)(v60 - 160), 8);
  __brc_leave_section((uint64_t)&a60);
  _Unwind_Resume(a1);
}

void sub_19EDA4584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_19EDA59DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __brc_leave_section((uint64_t)&a68);
  _Unwind_Resume(a1);
}

void sub_19EDA71D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, id *a14, id *a15)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak((id *)(v16 - 184));
  _Unwind_Resume(a1);
}

void sub_19EDA72F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDA73D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDA7720(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDA786C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDA7A3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDA7DF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19EDA7F14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDA8128(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDA8288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_19EDA844C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDA84F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19EDA878C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDA897C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDA8E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDA947C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19EDA98A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __brc_block_perform_once_and_set_block_invoke(uint64_t result)
{
  dispatch_queue_t v1 = *(unsigned char **)(result + 40);
  if (!*v1)
  {
    unsigned char *v1 = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t initCGImageSourceCreateWithURL(uint64_t a1, uint64_t a2)
{
  id v4 = ImageIOLibrary();
  id v5 = (uint64_t (*)())dlsym(v4, "CGImageSourceCreateWithURL");
  softLinkCGImageSourceCreateWithURL = v5;
  if (!v5)
  {
    id v7 = brc_bread_crumbs((uint64_t)"initCGImageSourceCreateWithURL", 58);
    id v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      initCGImageSourceCreateWithURL_cold_1();
    }

    __assert_rtn("initCGImageSourceCreateWithURL", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 58, "Can't find CGImageSourceCreateWithURL in ImageIO framework");
  }

  return ((uint64_t (*)(uint64_t, uint64_t))v5)(a1, a2);
}

void *ImageIOLibrary()
{
  uint64_t result = (void *)ImageIOLibrary_frameworkLibrary;
  if (!ImageIOLibrary_frameworkLibrary)
  {
    uint64_t result = dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 2);
    ImageIOLibrary_frameworkLibrary = (uint64_t)result;
    if (!result) {
      ImageIOLibrary_cold_1();
    }
  }
  return result;
}

id initkCGImageSourceShouldCache()
{
  int v0 = ImageIOLibrary();
  dispatch_queue_t v1 = (id *)dlsym(v0, "kCGImageSourceShouldCache");
  if (!v1) {
    initkCGImageSourceShouldCache_cold_1();
  }
  objc_storeStrong((id *)&constantkCGImageSourceShouldCache, *v1);
  getkCGImageSourceShouldCache = (uint64_t (*)())kCGImageSourceShouldCacheFunction;
  BOOL v2 = (void *)constantkCGImageSourceShouldCache;

  return v2;
}

id kCGImageSourceShouldCacheFunction()
{
  return (id)constantkCGImageSourceShouldCache;
}

id initkCGImageSourceSkipMetadata()
{
  int v0 = ImageIOLibrary();
  dispatch_queue_t v1 = (id *)dlsym(v0, "kCGImageSourceSkipMetadata");
  if (!v1) {
    initkCGImageSourceSkipMetadata_cold_1();
  }
  objc_storeStrong((id *)&constantkCGImageSourceSkipMetadata, *v1);
  getkCGImageSourceSkipMetadata = (uint64_t (*)())kCGImageSourceSkipMetadataFunction;
  BOOL v2 = (void *)constantkCGImageSourceSkipMetadata;

  return v2;
}

id kCGImageSourceSkipMetadataFunction()
{
  return (id)constantkCGImageSourceSkipMetadata;
}

uint64_t initCGImageSourceCreateImageAtIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = ImageIOLibrary();
  id v7 = (uint64_t (*)())dlsym(v6, "CGImageSourceCreateImageAtIndex");
  softLinkCGImageSourceCreateImageAtIndex = v7;
  if (!v7)
  {
    uint64_t v9 = brc_bread_crumbs((uint64_t)"initCGImageSourceCreateImageAtIndex", 59);
    uint64_t v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      initCGImageSourceCreateImageAtIndex_cold_1();
    }

    __assert_rtn("initCGImageSourceCreateImageAtIndex", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 59, "Can't find CGImageSourceCreateImageAtIndex in ImageIO framework");
  }

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, a3);
}

uint64_t initCGImageGetWidth(uint64_t a1)
{
  BOOL v2 = ImageIOLibrary();
  uint64_t v3 = (uint64_t (*)())dlsym(v2, "CGImageGetWidth");
  softLinkCGImageGetWidth = v3;
  if (!v3)
  {
    id v5 = brc_bread_crumbs((uint64_t)"initCGImageGetWidth", 60);
    id v6 = brc_default_log(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      initCGImageGetWidth_cold_1();
    }

    __assert_rtn("initCGImageGetWidth", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 60, "Can't find CGImageGetWidth in ImageIO framework");
  }

  return ((uint64_t (*)(uint64_t))v3)(a1);
}

Class initUIImage()
{
  UIKitLibrary();
  Class Class = objc_getClass("UIImage");
  classUIImage = (uint64_t)Class;
  if (!Class) {
    initUIImage_cold_1();
  }
  getUIImageClass Class = (uint64_t (*)())UIImageFunction;

  return Class;
}

void *UIKitLibrary()
{
  uint64_t result = (void *)UIKitLibrary_frameworkLibrary;
  if (!UIKitLibrary_frameworkLibrary)
  {
    uint64_t result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
    UIKitLibrary_frameworkLibrary = (uint64_t)result;
    if (!result) {
      UIKitLibrary_cold_1();
    }
  }
  return result;
}

id UIImageFunction()
{
  return (id)classUIImage;
}

uint64_t initUIGraphicsBeginImageContextWithOptions(uint64_t a1, double a2, double a3, double a4)
{
  id v8 = UIKitLibrary();
  uint64_t v9 = (uint64_t (*)())dlsym(v8, "UIGraphicsBeginImageContextWithOptions");
  softLinkUIGraphicsBeginImageContextWithOptions = v9;
  if (!v9)
  {
    uint64_t v14 = brc_bread_crumbs((uint64_t)"initUIGraphicsBeginImageContextWithOptions", 81);
    uint64_t v15 = brc_default_log(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      initUIGraphicsBeginImageContextWithOptions_cold_1();
    }

    __assert_rtn("initUIGraphicsBeginImageContextWithOptions", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 81, "Can't find UIGraphicsBeginImageContextWithOptions in UIKit framework");
  }
  v10.n128_f64[0] = a2;
  v11.n128_f64[0] = a3;
  v12.n128_f64[0] = a4;

  return ((uint64_t (*)(uint64_t, __n128, __n128, __n128))v9)(a1, v10, v11, v12);
}

uint64_t initCGContextClipToMask(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  __n128 v12 = (void *)CoreGraphicsLibrary_frameworkLibrary;
  if (!CoreGraphicsLibrary_frameworkLibrary)
  {
    __n128 v12 = dlopen("/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics", 2);
    CoreGraphicsLibrary_frameworkLibrary = (uint64_t)v12;
    if (!v12) {
      initCGContextClipToMask_cold_1();
    }
  }
  uint64_t v13 = (uint64_t (*)())dlsym(v12, "CGContextClipToMask");
  softLinkCGContextClipToMask = v13;
  if (!v13)
  {
    id v19 = brc_bread_crumbs((uint64_t)"initCGContextClipToMask", 69);
    __int16 v20 = brc_default_log(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      initCGContextClipToMask_cold_2();
    }

    __assert_rtn("initCGContextClipToMask", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 69, "Can't find CGContextClipToMask in CoreGraphics framework");
  }
  v14.n128_f64[0] = a3;
  v15.n128_f64[0] = a4;
  v16.n128_f64[0] = a5;
  v17.n128_f64[0] = a6;

  return ((uint64_t (*)(uint64_t, uint64_t, __n128, __n128, __n128, __n128))v13)(a1, a2, v14, v15, v16, v17);
}

uint64_t initUIGraphicsGetCurrentContext()
{
  int v0 = UIKitLibrary();
  dispatch_queue_t v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsGetCurrentContext");
  softLinkUIGraphicsGetCurrentContext = v1;
  if (!v1)
  {
    uint64_t v3 = brc_bread_crumbs((uint64_t)"initUIGraphicsGetCurrentContext", 80);
    id v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      initUIGraphicsGetCurrentContext_cold_1();
    }

    __assert_rtn("initUIGraphicsGetCurrentContext", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 80, "Can't find UIGraphicsGetCurrentContext in UIKit framework");
  }

  return v1();
}

uint64_t initUIGraphicsGetImageFromCurrentImageContext()
{
  int v0 = UIKitLibrary();
  dispatch_queue_t v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsGetImageFromCurrentImageContext");
  softLinkUIGraphicsGetImageFromCurrentImageContext = v1;
  if (!v1)
  {
    uint64_t v3 = brc_bread_crumbs((uint64_t)"initUIGraphicsGetImageFromCurrentImageContext", 82);
    id v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      initUIGraphicsGetImageFromCurrentImageContext_cold_1();
    }

    __assert_rtn("initUIGraphicsGetImageFromCurrentImageContext", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 82, "Can't find UIGraphicsGetImageFromCurrentImageContext in UIKit framework");
  }

  return v1();
}

uint64_t initUIGraphicsEndImageContext()
{
  int v0 = UIKitLibrary();
  dispatch_queue_t v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsEndImageContext");
  softLinkUIGraphicsEndImageContext = v1;
  if (!v1)
  {
    uint64_t v3 = brc_bread_crumbs((uint64_t)"initUIGraphicsEndImageContext", 83);
    id v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      initUIGraphicsEndImageContext_cold_1();
    }

    __assert_rtn("initUIGraphicsEndImageContext", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 83, "Can't find UIGraphicsEndImageContext in UIKit framework");
  }

  return v1();
}

id initUIImagePNGRepresentation(void *a1)
{
  id v1 = a1;
  BOOL v2 = UIKitLibrary();
  uint64_t v3 = (uint64_t (*)())dlsym(v2, "UIImagePNGRepresentation");
  softLinkUIImagePNGRepresentation = v3;
  if (!v3)
  {
    id v6 = brc_bread_crumbs((uint64_t)"initUIImagePNGRepresentation", 79);
    id v7 = brc_default_log(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      initUIImagePNGRepresentation_cold_1();
    }

    __assert_rtn("initUIImagePNGRepresentation", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 79, "Can't find UIImagePNGRepresentation in UIKit framework");
  }
  id v4 = ((void (*)(id))v3)(v1);

  return v4;
}

void __br_notify_register_dispatch_block_invoke_4(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (softLinkUIImagePNGRepresentation_block_invoke___personaOnceToken != -1) {
      dispatch_once(&softLinkUIImagePNGRepresentation_block_invoke___personaOnceToken, &__block_literal_global_708);
    }
    id v3 = (id)softLinkUIImagePNGRepresentation_block_invoke___personalPersona;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v6 = [v5 currentPersona];

  id v25 = 0;
  id v7 = [v6 userPersonaUniqueString];
  id v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0) {
    goto LABEL_9;
  }
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      id v21 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      id v22 = brc_default_log(1);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.5();
      }
    }
    else
    {
      __n128 v17 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      uint64_t v18 = brc_default_log(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.4();
      }

      __n128 v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      if (v14) {
        goto LABEL_25;
      }
    }
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  id v24 = 0;
  uint64_t v9 = (void *)[v6 copyCurrentPersonaContextWithError:&v24];
  id v10 = v24;
  id v11 = v25;
  id v25 = v9;

  if (v10)
  {
    __n128 v12 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
    uint64_t v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
      -[BRContainerCache _accountWillChange]((uint64_t)v10);
    }
  }
  __n128 v14 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

  if (!v14) {
    goto LABEL_9;
  }
  __n128 v15 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
  __n128 v16 = brc_default_log(0);
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2112;
    uint64_t v31 = v15;
    _os_log_error_impl(&dword_19ED3F000, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  id v19 = brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 136);
  __int16 v20 = brc_default_log(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    __br_notify_register_dispatch_block_invoke_cold_1_2(a1);
  }

LABEL_10:
  _BRRestorePersona(&v25);
}

void sub_19EDAA7AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_2_3()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  id v1 = (void *)softLinkUIImagePNGRepresentation_block_invoke___personalPersona;
  softLinkUIImagePNGRepresentation_block_invoke___personalPersona = v0;
}

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, v9, OS_LOG_TYPE_DEFAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_11(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_19EDABB6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19EDABFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19EDAC55C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDAC7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_sync_exit(v9);
  __brc_leave_section((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_19EDAD360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDAD7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDADD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDAEAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDAF190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,id location)
{
}

void sub_19EDAF9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDAFF48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL MLEqualCallback(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_19EDB0C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDB1A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDB2028(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDB21E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDB2438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDB2718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDB2A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id initUIApplicationWillResignActiveNotification()
{
  uint64_t v0 = UIKitLibrary_0();
  uint64_t v1 = (id *)dlsym(v0, "UIApplicationWillResignActiveNotification");
  if (!v1) {
    initUIApplicationWillResignActiveNotification_cold_1();
  }
  objc_storeStrong((id *)&constantUIApplicationWillResignActiveNotification, *v1);
  getUIApplicationWillResignActiveNotification = (uint64_t (*)())UIApplicationWillResignActiveNotificationFunction;
  id v2 = (void *)constantUIApplicationWillResignActiveNotification;

  return v2;
}

void *UIKitLibrary_0()
{
  uint64_t result = (void *)UIKitLibrary_frameworkLibrary_0;
  if (!UIKitLibrary_frameworkLibrary_0)
  {
    uint64_t result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
    UIKitLibrary_frameworkLibrary_0 = (uint64_t)result;
    if (!result) {
      UIKitLibrary_cold_1_0();
    }
  }
  return result;
}

id UIApplicationWillResignActiveNotificationFunction()
{
  return (id)constantUIApplicationWillResignActiveNotification;
}

id initUIApplicationDidBecomeActiveNotification()
{
  uint64_t v0 = UIKitLibrary_0();
  uint64_t v1 = (id *)dlsym(v0, "UIApplicationDidBecomeActiveNotification");
  if (!v1) {
    initUIApplicationDidBecomeActiveNotification_cold_1();
  }
  objc_storeStrong((id *)&constantUIApplicationDidBecomeActiveNotification, *v1);
  getUIApplicationDidBecomeActiveNotification = (uint64_t (*)())UIApplicationDidBecomeActiveNotificationFunction;
  id v2 = (void *)constantUIApplicationDidBecomeActiveNotification;

  return v2;
}

id UIApplicationDidBecomeActiveNotificationFunction()
{
  return (id)constantUIApplicationDidBecomeActiveNotification;
}

const char *extensionInFilename(char *a1)
{
  return _extensionInFilename(a1, 0);
}

const char *_extensionInFilename(char *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  int v4 = strrchr(a1, 46);
  id v5 = 0;
  if (v4 && v4 != a1)
  {
    id v5 = v4 + 1;
    if (strlen(v4 + 1) > 0x32) {
      return 0;
    }
    if (!a2 && (!strcmp(v5, "gz") || !strcmp(v5, "bz2") || !strcmp(v5, "Z") || !strcmp(v5, "xz")))
    {
      uint64_t v10 = strdup(a1);
      v5[~(unint64_t)a1 + (void)v10] = 0;
      uint64_t v11 = _extensionInFilename();
      if (v11) {
        id v5 = &a1[v11 - (void)v10];
      }
      free(v10);
    }
    else
    {
      char v7 = 0;
      for (uint64_t i = v5; ; ++i)
      {
        int v9 = *(unsigned __int8 *)i;
        if (!*i) {
          break;
        }
        if (v9 == 32 || v9 == 47) {
          return 0;
        }
        v7 |= (v9 - 58) < 0xFFFFFFF6;
      }
      if ((v7 & 1) == 0) {
        return 0;
      }
    }
  }
  return v5;
}

void sub_19EDB6E50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDB720C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19EDBAAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19EDBD1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 160), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_19EDBE964(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDBE9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19EDBEB5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDBECC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19EDBF9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t BRContainerIconCKAssetKeyForName(uint64_t a1)
{
  return [@"icon" stringByAppendingString:a1];
}

id BRContainerIconNameForCKAssetKey(void *a1)
{
  id v1 = a1;
  id v2 = [v1 substringToIndex:4];
  char v3 = [v2 isEqualToString:@"icon"];

  if ((v3 & 1) == 0)
  {
    id v6 = brc_bread_crumbs((uint64_t)"BRContainerIconNameForCKAssetKey", 31);
    char v7 = brc_default_log(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      BRContainerIconNameForCKAssetKey_cold_1((uint64_t)v6, v7);
    }
  }
  int v4 = [v1 substringFromIndex:4];

  return v4;
}

id BRContainerIconNameForSizeAndScale(double a1, double a2, double a3)
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  v20[0] = @"iOS";
  v20[1] = @"OSX";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = [NSString stringWithFormat:@"%dx%d_%@", (int)(a1 * a3), (int)(a2 * a3), *(void *)(*((void *)&v15 + 1) + 8 * v10)];
      __n128 v12 = _BRContainerIconSupportedNames();
      char v13 = [v12 containsObject:v11];

      if (v13) {
        break;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v11 = 0;
  }

  return v11;
}

id _BRContainerIconSupportedNames()
{
  if (_BRContainerIconSupportedNames_once != -1) {
    dispatch_once(&_BRContainerIconSupportedNames_once, &__block_literal_global_14);
  }
  uint64_t v0 = (void *)_BRContainerIconSupportedNames_iconNames;

  return v0;
}

double BRContainerIconSizeForName(void *a1)
{
  __endptr = 0;
  uint64_t v1 = strtoll((const char *)[a1 UTF8String], &__endptr, 0);
  if (__endptr && *__endptr == 120)
  {
    uint64_t v2 = v1;
    id v6 = 0;
    strtoll(__endptr + 1, &v6, 0);
    if (v6 && *v6 == 95) {
      return (double)v2;
    }
    int v4 = brc_bread_crumbs((uint64_t)"BRContainerIconSizeForName", 89);
    id v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      BRContainerIconSizeForName_cold_1();
    }
  }
  else
  {
    int v4 = brc_bread_crumbs((uint64_t)"BRContainerIconSizeForName", 84);
    id v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      BRContainerIconSizeForName_cold_1();
    }
  }

  return 0.0;
}

double BRContainerIconScaleForName(void *a1)
{
  uint64_t v1 = strchr((char *)[a1 UTF8String], 64);
  if (v1) {
    return (double)strtoll(v1 + 1, 0, 0);
  }
  else {
    return 1.0;
  }
}

id BRContainerIconCKAssetKeys()
{
  if (BRContainerIconCKAssetKeys_once != -1) {
    dispatch_once(&BRContainerIconCKAssetKeys_once, &__block_literal_global_34);
  }
  uint64_t v0 = (void *)BRContainerIconCKAssetKeys_iconKeys;

  return v0;
}

void __BRContainerIconCKAssetKeys_block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = _BRContainerIconSupportedNames();
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v0, "count"));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(@"icon", "stringByAppendingString:", *(void *)(*((void *)&v9 + 1) + 8 * v6), (void)v9);
        [v1 addObject:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t v8 = (void *)BRContainerIconCKAssetKeys_iconKeys;
  BRContainerIconCKAssetKeys_iconKeys = (uint64_t)v1;
}

void sub_19EDC08D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x12u);
}

void br_pacer_pretend_event_handler_fired_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: nil pacer fired%@", (uint8_t *)&v2, 0xCu);
}

void brc_notify_post_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: name%@", (uint8_t *)&v2, 0xCu);
}

void __br_notify_register_dispatch_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 48);
  int v3 = 136315394;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_19ED3F000, v2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to adopt persona for notification %s%@", (uint8_t *)&v3, 0x16u);
}

void __brc_leave_section_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┗%llx %@", (uint8_t *)&v3, 0x16u);
}

void brc_xattr_set_string_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] can't set xattr \"%s\" [value is too long]%@");
}

void _BRLocalizedString_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: key != nil%@", (uint8_t *)&v2, 0xCu);
}

void __OSVersion_block_invoke_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_19ED3F000, log, (os_log_type_t)0x90u, "[ERROR] sysctl(kern.osversion) failed %{errno}d%@", (uint8_t *)v3, 0x12u);
}

void BRTelemetryReportAddPeopleDisplayed_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_6(&dword_19ED3F000, a2, a3, "[DEBUG] BRTelemetry sending new Add People display with access = %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void BRTelemetryReportSettingUpiCloudDriveDisplay_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_6(&dword_19ED3F000, a2, a3, "[DEBUG] BRTelemetry sending new Setting Up iCloud Drive display with duration = %f%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void initCKErrorDomain_cold_1()
{
}

void CloudKitLibrary_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = brc_bread_crumbs((uint64_t)"CloudKitLibrary", 22);
  os_log_t v1 = brc_default_log(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    uint64_t v3 = dlerror();
    __int16 v4 = 2112;
    uint64_t v5 = v0;
    _os_log_impl(&dword_19ED3F000, v1, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't open CloudKit : %s%@", (uint8_t *)&v2, 0x16u);
  }

  __assert_rtn("CloudKitLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/operations/BRShareOperations.m", 22, "Can't open CloudKit");
}

void initCKPartialErrorsByItemIDKey_cold_1()
{
}

void BRCopyUbiquityContainerIdentifiersForCurrentProcess_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] current process containers: %@%@");
}

void BRCopyUbiquityContainerIdentifiersForCurrentProcess_cold_2()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_9_0(&dword_19ED3F000, v0, v1, "[DEBUG] ┏%llx %s%@");
}

void BRGetProcessMobileContainerForID_cold_1()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] ┣%llx calling bird%@", (void)v3, DWORD2(v3));
}

void __BRGetProcessMobileContainerForID_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] We've refreshed the container metadata in the last 10 seconds, ignoring the request%@", v2, v3, v4, v5, v6);
}

void BRSynchronousEvictItemAtURLWithOptions_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] BRSynchronousEvictItemAtURLWithOptions is deprecated in FPFS%@", v2, v3, v4, v5, v6);
}

void BRThumbnailChangedAtURL_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] BRThumbnailChangedAtURL is deprecated in FPFS%@", v2, v3, v4, v5, v6);
}

void BRGetAttributeValuesForItem_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] not ubiquitous because %@ is excluded%@");
}

void BRGetAttributeValuesForItem_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] not ubiquitous because %@ isn't reachable%@");
}

void BRiWorkSharingSetSharingState_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_0(&dword_19ED3F000, v0, v1, "[ERROR] no file URL provided%@", v2, v3, v4, v5, v6);
}

void BRiWorkSharingSetSharingState_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_0(&dword_19ED3F000, v0, v1, "[ERROR] Need a completion block and queue%@", v2, v3, v4, v5, v6);
}

void BRSharingCopyCurrentUserIdentifier_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_0(&dword_19ED3F000, v0, v1, "[ERROR] No completion handler or queue provided%@", v2, v3, v4, v5, v6);
}

void BRSharingCopyCurrentUserNameAndDisplayHandleForURL_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_0(&dword_19ED3F000, v0, v1, "[ERROR] No completion handler provided%@", v2, v3, v4, v5, v6);
}

void BRSetMigrationStatusForDSIDInPref_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] ignoring status refused on iOS%@", v2, v3, v4, v5, v6);
}

void BRSetMigrationStatusForDSIDInPref_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_0(&dword_19ED3F000, v0, v1, "[ERROR] BRSetMigrationStatusForDSIDInPref called with nil dsid%@", v2, v3, v4, v5, v6);
}

void BRSetMigrationStatusForDSIDInPref_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: dsid%@", v2, v3, v4, v5, v6);
}

void BRPrimaryiCloudAccountCopyStatus_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_19ED3F000, log, (os_log_type_t)0x90u, "[ERROR] unable to get primary account status; %@%@",
    buf,
    0x16u);
}

void BRPrimaryiCloudAccountCopyStatus_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] account status: %@%@");
}

void BRPrimaryiCloudAccountCopyStatus_cold_3()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] ┏%llx getting primary iCloudAccount Status%@", (void)v3, DWORD2(v3));
}

void BRCloudDocsCanBeEnabledForCurrentUser_cold_1()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_9_0(&dword_19ED3F000, v0, v1, "[DEBUG] ┏%llx %s%@");
}

void __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_6(&dword_19ED3F000, a2, a3, "[DEBUG] returning %ld%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] no home%@", v2, v3, v4, v5, v6);
}

void __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: volumeURL%@", v2, v3, v4, v5, v6);
}

void __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] getting CloudDocsCanBeEnabledState for url: %@%@");
}

void __br_notify_register_dispatch_block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_19ED3F000, v0, (os_log_type_t)0x90u, "[ERROR] won't restore persona: %@%@", v1, 0x16u);
}

void brc_default_log_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: !isDataSeparated%@", v2, v3, v4, v5, v6);
}

void brc_default_log_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: isDataSeparated%@", v2, v3, v4, v5, v6);
}

void abc_report_assert_with_signature_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] Sent snapshot for signature %@%@");
}

void abc_report_assert_with_signature_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] Failed to send snapshot for signature %@%@");
}

void __abc_report_assert_with_signature_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] got response from diagnosticReporter - %@%@");
}

void abc_report_panic_with_signature_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] Sent panic snapshot for signature %@%@");
}

void abc_report_panic_with_signature_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] Failed to send panic snapshot for signature %@%@");
}

void offsetOfPackageRootFilenameInPath_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] Adding %s to the list of force package extensions (according to F_PATHPKG)%@");
}

void getHomeDirectoryForUser_cold_1(int a1)
{
  strerror(a1);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_2(&dword_19ED3F000, v1, v2, "[ERROR] can't get home dir path size %s (%d)%@", v3, v4, v5, v6, v7);
}

void getHomeDirectoryForUser_cold_2(int a1)
{
  strerror(a1);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_2(&dword_19ED3F000, v1, v2, "[ERROR] can't get home dir path %s (%d)%@", v3, v4, v5, v6, v7);
}

void notifyNameWithPrefixedContainerID_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: should be prefixed (%@)%@");
}

void __br_notify_register_dispatch_block_invoke_cold_1_0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315394;
  *(void *)&v3[4] = *(void *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, a2, a3, "[CRIT] UNREACHABLE: Failed to adopt persona for notification %s%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __br_notify_register_dispatch_block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_19ED3F000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", v1, 0xCu);
}

void __br_notify_register_dispatch_block_invoke_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_19ED3F000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", v1, 0xCu);
}

void BRPerformWithPersonaAndError_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19ED3F000, log, (os_log_type_t)0x90u, "[ERROR] won't restore persona: %@%@", (uint8_t *)&v3, 0x16u);
}

void BRPerformWithPersonaAndError_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", (uint8_t *)&v2, 0xCu);
}

void BRPerformWithPersonaAndError_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", (uint8_t *)&v2, 0xCu);
}

void initCKCurrentUserDefaultName_cold_1()
{
}

void BRFetchCollaborationIdentifierForItemWithIdentifier_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] group activity sharing item with %@%@");
}

void BRFetchCollaborationIdentifierForItemWithIdentifier_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: FPIsCloudDocsWithFPFSEnabled()%@", (uint8_t *)&v2, 0xCu);
}

void BRFetchCollaborationIdentifierForItemAtURL_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  __int16 v5 = [a1 path];
  uint64_t v6 = objc_msgSend(v5, "fp_obfuscatedPath");
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_19ED3F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] group activity sharing item at %@%@", (uint8_t *)&v7, 0x16u);
}

void BRFetchCollaborationIdentifierForItemAtURL_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !FPIsCloudDocsWithFPFSEnabled()%@", (uint8_t *)&v2, 0xCu);
}

void BRFetchCKShareForItemAtURL_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] group activity getting share at %@%@");
}

void __BRFetchCKShareForItemAtURL_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] file is not shared, error: %@%@");
}

void __br_notify_register_dispatch_block_invoke_cold_1_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_19ED3F000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to adopt persona for notification %s%@", v1, 0x16u);
}

void init_SIGetLastUsedDate_cold_1()
{
  dlerror();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_19ED3F000, v0, v1, "[CRIT] Can't find _SIGetLastUsedDate in MobileSpotlightIndex framework :%s%@", v2, v3, v4, v5, v6);
}

void MobileSpotlightIndexLibrary_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = brc_bread_crumbs((uint64_t)"MobileSpotlightIndexLibrary", 21);
  uint64_t v1 = brc_default_log(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    uint64_t v3 = dlerror();
    __int16 v4 = 2112;
    uint64_t v5 = v0;
    _os_log_impl(&dword_19ED3F000, v1, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't open MobileSpotlightIndex : %s%@", (uint8_t *)&v2, 0x16u);
  }

  __assert_rtn("MobileSpotlightIndexLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/SpotlightIndex_SoftLinking.m", 21, "Can't open MobileSpotlightIndex");
}

void init_SISetLastUsedDate_cold_1()
{
  dlerror();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_19ED3F000, v0, v1, "[CRIT] Can't find _SISetLastUsedDate in MobileSpotlightIndex framework :%s%@", v2, v3, v4, v5, v6);
}

void init_SIActivityDump_cold_1()
{
  dlerror();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_19ED3F000, v0, v1, "[CRIT] Can't find _SIActivityDump in MobileSpotlightIndex framework :%s%@", v2, v3, v4, v5, v6);
}

void __BRCXPCBRItemServiceProtocolInterface_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Using item service protocol from legacy%@", (uint8_t *)&v2, 0xCu);
}

void __BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Using client side collaboration service protocol from legacy%@", (uint8_t *)&v2, 0xCu);
}

void BRCopyBundleIdentifierForURLInContainer_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] non-package directory at '%@'%@", buf, 0x16u);
}

void BRTrashExternalDocumentReference_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] deleting alias at %@%@");
}

void BRTrashExternalDocumentReference_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] target path is within the sharedDocs container, deleting target at %@%@");
}

void BRContainerIfDirectoryInHomeURLIsSynced_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 path];
  int v6 = *__error();
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 1024;
  int v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_19ED3F000, a3, (os_log_type_t)0x90u, "[ERROR] can't get xattr on %@: %{errno}d%@", (uint8_t *)&v7, 0x1Cu);
}

void initCGImageSourceCreateWithURL_cold_1()
{
  OUTLINED_FUNCTION_8_3();
  dlerror();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_19ED3F000, v0, v1, "[CRIT] Can't find CGImageSourceCreateWithURL in ImageIO framework :%s%@", v2, v3, v4, v5, v6);
}

void ImageIOLibrary_cold_1()
{
  uint64_t v0 = brc_bread_crumbs((uint64_t)"ImageIOLibrary", 56);
  uint64_t v1 = brc_default_log(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    dlerror();
    OUTLINED_FUNCTION_9_1(&dword_19ED3F000, v2, v3, "[WARNING] Can't open ImageIO : %s%@", v4, v5, v6, v7, 2u);
  }

  __assert_rtn("ImageIOLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 56, "Can't open ImageIO");
}

void initkCGImageSourceShouldCache_cold_1()
{
}

void initkCGImageSourceSkipMetadata_cold_1()
{
}

void initCGImageSourceCreateImageAtIndex_cold_1()
{
  OUTLINED_FUNCTION_8_3();
  dlerror();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_19ED3F000, v0, v1, "[CRIT] Can't find CGImageSourceCreateImageAtIndex in ImageIO framework :%s%@", v2, v3, v4, v5, v6);
}

void initCGImageGetWidth_cold_1()
{
  OUTLINED_FUNCTION_8_3();
  dlerror();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_19ED3F000, v0, v1, "[CRIT] Can't find CGImageGetWidth in ImageIO framework :%s%@", v2, v3, v4, v5, v6);
}

void initUIImage_cold_1()
{
}

void UIKitLibrary_cold_1()
{
  uint64_t v0 = brc_bread_crumbs((uint64_t)"UIKitLibrary", 75);
  uint64_t v1 = brc_default_log(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    dlerror();
    OUTLINED_FUNCTION_9_1(&dword_19ED3F000, v2, v3, "[WARNING] Can't open UIKit : %s%@", v4, v5, v6, v7, 2u);
  }

  __assert_rtn("UIKitLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 75, "Can't open UIKit");
}

void initUIGraphicsBeginImageContextWithOptions_cold_1()
{
  OUTLINED_FUNCTION_8_3();
  dlerror();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_19ED3F000, v0, v1, "[CRIT] Can't find UIGraphicsBeginImageContextWithOptions in UIKit framework :%s%@", v2, v3, v4, v5, v6);
}

void initCGContextClipToMask_cold_1()
{
  uint64_t v0 = brc_bread_crumbs((uint64_t)"CoreGraphicsLibrary", 67);
  uint64_t v1 = brc_default_log(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    dlerror();
    OUTLINED_FUNCTION_9_1(&dword_19ED3F000, v2, v3, "[WARNING] Can't open CoreGraphics : %s%@", v4, v5, v6, v7, 2u);
  }

  __assert_rtn("CoreGraphicsLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 67, "Can't open CoreGraphics");
}

void initCGContextClipToMask_cold_2()
{
  OUTLINED_FUNCTION_8_3();
  dlerror();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_19ED3F000, v0, v1, "[CRIT] Can't find CGContextClipToMask in CoreGraphics framework :%s%@", v2, v3, v4, v5, v6);
}

void initUIGraphicsGetCurrentContext_cold_1()
{
  OUTLINED_FUNCTION_8_3();
  dlerror();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_19ED3F000, v0, v1, "[CRIT] Can't find UIGraphicsGetCurrentContext in UIKit framework :%s%@", v2, v3, v4, v5, v6);
}

void initUIGraphicsGetImageFromCurrentImageContext_cold_1()
{
  OUTLINED_FUNCTION_8_3();
  dlerror();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_19ED3F000, v0, v1, "[CRIT] Can't find UIGraphicsGetImageFromCurrentImageContext in UIKit framework :%s%@", v2, v3, v4, v5, v6);
}

void initUIGraphicsEndImageContext_cold_1()
{
  OUTLINED_FUNCTION_8_3();
  dlerror();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_19ED3F000, v0, v1, "[CRIT] Can't find UIGraphicsEndImageContext in UIKit framework :%s%@", v2, v3, v4, v5, v6);
}

void initUIImagePNGRepresentation_cold_1()
{
  OUTLINED_FUNCTION_8_3();
  dlerror();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_19ED3F000, v0, v1, "[CRIT] Can't find UIImagePNGRepresentation in UIKit framework :%s%@", v2, v3, v4, v5, v6);
}

void __br_notify_register_dispatch_block_invoke_cold_1_2(uint64_t a1)
{
  LODWORD(v3) = 136315394;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 48);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, v1, v2, "[CRIT] UNREACHABLE: Failed to adopt persona for notification %s%@", (void)v3, DWORD2(v3));
}

void initUIApplicationWillResignActiveNotification_cold_1()
{
}

void UIKitLibrary_cold_1_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = brc_bread_crumbs((uint64_t)"UIKitLibrary", 43);
  uint64_t v1 = brc_default_log(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    long long v3 = dlerror();
    __int16 v4 = 2112;
    uint64_t v5 = v0;
    _os_log_impl(&dword_19ED3F000, v1, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't open UIKit : %s%@", (uint8_t *)&v2, 0x16u);
  }

  __assert_rtn("UIKitLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/notifs/BRQuery.m", 43, "Can't open UIKit");
}

void initUIApplicationDidBecomeActiveNotification_cold_1()
{
}

void ___preComputeURLSForPersona_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_19ED3F000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Cannot get home directory%@", v1, 0xCu);
}

void ___preComputeURLSForPersona_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] Running in a ICD File Provider, optimizing flow for URL cache based on home directory. Home Directory: %@%@");
}

void BRContainerIconNameForCKAssetKey_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [[assetKey substringToIndex:4] isEqualToString:@\"icon\"]%@", (uint8_t *)&v2, 0xCu);
}

void BRContainerIconSizeForName_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: invalid key '%s'%@");
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1F4113888]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9710](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1F40D7448](bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1F40D74D0](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourcesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7500](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

uint64_t FPGetTagsDataForTags()
{
  return MEMORY[0x1F40E0AF8]();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return MEMORY[0x1F40E0B28]();
}

uint64_t GSLibraryResolveDocumentId2()
{
  return MEMORY[0x1F411BB40]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1F40E7168]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE60](inTagClass, inTag, inConformingToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFStringCompareForHFS()
{
  return MEMORY[0x1F40D9118]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1F40D91E8]();
}

uint64_t _CFURLCStringIsPromiseName()
{
  return MEMORY[0x1F40D91F8]();
}

uint64_t _CFURLCopyLogicalNameOfPromiseAtURL()
{
  return MEMORY[0x1F40D9258]();
}

uint64_t _CFURLCopyLogicalURLOfPromiseAtURL()
{
  return MEMORY[0x1F40D9260]();
}

uint64_t _CFURLCopyPromiseURLOfLogicalURL()
{
  return MEMORY[0x1F40D9278]();
}

uint64_t _CFURLCopyPropertiesOfPromiseAtURL()
{
  return MEMORY[0x1F40D9280]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1F40D92B0]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x1F40D9350]();
}

uint64_t _CFURLIsPromiseName()
{
  return MEMORY[0x1F40D9358]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1F40D9368]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x1F40D9380]();
}

uint64_t _CFURLSetPermanentResourcePropertyForKey()
{
  return MEMORY[0x1F40D93A8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _NSErrorWithFilePathAndErrno()
{
  return MEMORY[0x1F40E7338]();
}

uint64_t _NSErrorWithFilePathErrnoAndVariant()
{
  return MEMORY[0x1F40E7340]();
}

uint64_t _UTTypeCopyPedigreeSet()
{
  return MEMORY[0x1F40DEF00]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __pthread_fchdir()
{
  return MEMORY[0x1F40C9C70]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _xpc_runtime_is_app_sandboxed()
{
  return MEMORY[0x1F40CA1D8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

int atexit_b(void *a1)
{
  return MEMORY[0x1F40CA490](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1F4181578](cls, name, imp, types);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1F40CB580]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCF8](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1F40CBE00](*(void *)&a1, *(void *)&a2);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1F40CBE10]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

int execlp(const char *__file, const char *__arg0, ...)
{
  return MEMORY[0x1F40CBFB8](__file, __arg0);
}

void exit(int a1)
{
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x1F40CC020](*(void *)&a1, *(void *)&a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1F40CC070](*(void *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC0E0](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC108](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

pid_t fork(void)
{
  return MEMORY[0x1F40CC1C8]();
}

uint64_t fpfs_path_is_safe_save_temp_file_ext()
{
  return MEMORY[0x1F40E0D18]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1F40CC240](*(void *)&fd, name, *(void *)&options);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC2A8](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1F40CC2B0](a1, a2, a3, a4);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1F40CC2C8](*(void *)&a1, a2, a3, *(void *)&a4);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

int getiopolicy_np(int a1, int a2)
{
  return MEMORY[0x1F40CC418](*(void *)&a1, *(void *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1F40CC4F0](*(void *)&a1, a2, a3, a4, a5);
}

int getrlimit(int a1, rlimit *a2)
{
  return MEMORY[0x1F40CC500](*(void *)&a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1F40CC690](*(void *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1F40CC6B0](*(void *)&a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1F40CC728](*(void *)&a1, *(void *)&a2);
}

uint64_t kpersona_find_by_type()
{
  return MEMORY[0x1F40CC730]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1F4181618](m);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1F40F3938](path);
}

BOOL nw_path_has_dns(nw_path_t path)
{
  return MEMORY[0x1F40F3948](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1F40F39A8]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1F4181A60](a1);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1F4181A90](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

void perror(const char *a1)
{
}

int pipe(int a1[2])
{
  return MEMORY[0x1F40CD760](a1);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1F40CD7A0](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return MEMORY[0x1F40CD7B0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1F40CD7B8](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1F40CD7C0](a1);
}

int posix_spawnp(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1F40CD808](a1, a2, a3, a4, __argv, __envp);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB18](a1);
}

int putenv(char *a1)
{
  return MEMORY[0x1F40CDBB0](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1F40CDD70](a1, a2, *(void *)&a3);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1F40CDD88](a1, *(void *)&a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1F40CDDD8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CDF78](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return MEMORY[0x1F40CDFD0](a1, a2, *(void *)&a3, a4);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1F40CE140](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1F40CE238](__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2C0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

void uuid_generate(uuid_t out)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE690](a1, a2, a3);
}

uint64_t voucher_process_can_use_arbitrary_personas()
{
  return MEMORY[0x1F40CE768]();
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1F40CE7C8](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1F40CED38]();
}

uint64_t xpc_copy_entitlements_for_self()
{
  return MEMORY[0x1F40CED50]();
}