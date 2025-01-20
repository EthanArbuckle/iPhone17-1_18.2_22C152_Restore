@interface NSString
@end

@implementation NSString

void __50__NSString_BRCPathAdditions__brc_currentCachesDir__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)brc_currentCachesDir_pathByPersonaID;
  brc_currentCachesDir_pathByPersonaID = v0;
}

void __75__NSString_BRCPathAdditions__br_currentMobileDocumentsDirWithRefreshCache___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)br_currentMobileDocumentsDirWithRefreshCache__pathByPersonaID;
  br_currentMobileDocumentsDirWithRefreshCache__pathByPersonaID = v0;
}

void __75__NSString_BRCPathAdditions__br_currentMobileDocumentsDirWithRefreshCache___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] fetchRootItemForProviderDomain failed with error: %@%@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = [v5 fileURL];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __75__NSString_BRCPathAdditions__br_currentMobileDocumentsDirWithRefreshCache___block_invoke_22_cold_1(v5, (uint64_t)v7, v8);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __81__NSString_BRCPackageAdditions__brc_loadForcedPackageExtensionsForCurrentPersona__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_loadedPersonaIDs;
  _loadedPersonaIDs = v0;

  uint64_t v2 = objc_opt_new();
  v3 = (void *)_unifiedForcedPackageExtensions;
  _unifiedForcedPackageExtensions = v2;
}

void __75__NSString_BRCPathAdditions__br_currentMobileDocumentsDirWithRefreshCache___block_invoke_22_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 fileURL];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Root URL %@%@", (uint8_t *)&v6, 0x16u);
}

@end