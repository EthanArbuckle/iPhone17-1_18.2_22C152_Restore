@interface NSFileProviderManager
@end

@implementation NSFileProviderManager

uint64_t __75__NSFileProviderManager_BRAdditions__br_sharedProviderManagerWithDomainID___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)br_sharedProviderManagerWithDomainID__sharedNSFileProviderManagers;
  br_sharedProviderManagerWithDomainID__sharedNSFileProviderManagers = v0;

  uint64_t result = BRIsFPFSEnabled(v2, v3);
  if ((result & 1) == 0)
  {
    br_sharedProviderManagerWithDomainID__defaultSharedProvider = [objc_alloc(MEMORY[0x1E4F25DE8]) _initWithProviderIdentifier:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

uint64_t __77__NSFileProviderManager_BRAdditions__br_getFPDomainWithIdentifier_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __73__NSFileProviderManager_BRAdditions__br_getFPDomainForAccount_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"dsid"];
  if ([v5 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v6 = 1;
  }
  else
  {
    v7 = [v3 identifier];
    uint64_t v6 = [v7 containsString:*(void *)(a1 + 40)];
  }
  return v6;
}

BOOL __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v4 = [MEMORY[0x1E4F25CD8] synchronousSharedConnectionProxy];
  v5 = [*(id *)(a1 + 32) providerIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke_2;
  v12[3] = &unk_1E59AD360;
  v12[4] = *(void *)(a1 + 40);
  v12[5] = &v13;
  [v4 getDomainsForProviderIdentifier:v5 completionHandler:v12];

  id v6 = (id)v14[5];
  if (v6)
  {
    v7 = brc_bread_crumbs((uint64_t)"-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]_block_invoke", 201);
    v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v11 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v20 = "-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]_block_invoke";
      __int16 v21 = 2080;
      if (!a2) {
        v11 = "(ignored by caller)";
      }
      v22 = v11;
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 2112;
      v26 = v7;
      _os_log_error_impl(&dword_19ED3F000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a2) {
    *a2 = v6;
  }

  BOOL v9 = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v9)
  {
    uint64_t v15 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v16 = a3;
LABEL_10:
    objc_storeStrong(v15, v16);
    goto LABEL_11;
  }
  if (!objc_msgSend(v9, "fp_isFileProviderError:", -2001))
  {
    v17 = brc_bread_crumbs((uint64_t)"-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]_block_invoke", 194);
    id v18 = brc_default_log(0);
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
      __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke_2_cold_2();
    }

    uint64_t v15 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v16 = a4;
    goto LABEL_10;
  }
  v11 = brc_bread_crumbs((uint64_t)"-[NSFileProviderManager(BRAdditions) br_getFPDomainsWithError:]_block_invoke_2", 191);
  v12 = brc_default_log(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke_2_cold_1((uint64_t)v11, v12);
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = MEMORY[0x1E4F1CBF0];

LABEL_11:
}

void __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] existing domains failed with provider not found%@", (uint8_t *)&v2, 0xCu);
}

void __63__NSFileProviderManager_BRAdditions__br_getFPDomainsWithError___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] couldn't get existing domains: %@%@");
}

@end