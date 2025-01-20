@interface NSString(BRCPathAdditions)
+ (__CFString)ubiquityTokenSaltFilename;
+ (id)br_currentMobileDocumentsDirWithRefreshCache:()BRCPathAdditions;
+ (id)brc_currentCachesDir;
+ (id)brc_locateUbiquityTokenSaltInOldAccountPath:()BRCPathAdditions;
+ (uint64_t)br_currentMobileDocumentsDir;
+ (uint64_t)brc_accountIDPathForAccountPath:()BRCPathAdditions;
@end

@implementation NSString(BRCPathAdditions)

+ (id)brc_currentCachesDir
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (brc_currentCachesDir_once != -1) {
    dispatch_once(&brc_currentCachesDir_once, &__block_literal_global_25);
  }
  id v2 = (id)brc_currentCachesDir_pathByPersonaID;
  objc_sync_enter(v2);
  char v10 = 0;
  v3 = objc_msgSend(a1, "br_currentPersonaIDWithIsDataSeparated:", &v10);
  v4 = [(id)brc_currentCachesDir_pathByPersonaID objectForKeyedSubscript:v3];
  if (!v4)
  {
    if (v10)
    {
      v5 = objc_msgSend(a1, "br_currentHomeDir");
      v4 = [v5 stringByAppendingPathComponent:@"Library/Caches/com.apple.bird"];

      if (v4)
      {
LABEL_6:
        v6 = objc_msgSend(v4, "br_realpath");
        [(id)brc_currentCachesDir_pathByPersonaID setObject:v6 forKeyedSubscript:v3];
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v4 = objc_msgSend(@"com.apple.bird", "br_pathRelativeToDirectory:", 13);
      if (v4) {
        goto LABEL_6;
      }
    }
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] No path for Caches directory%@", buf, 0xCu);
    }

    goto LABEL_11;
  }
LABEL_12:
  id v8 = v4;

  objc_sync_exit(v2);

  return v8;
}

+ (uint64_t)brc_accountIDPathForAccountPath:()BRCPathAdditions
{
  return [a3 stringByAppendingPathComponent:@"account.1"];
}

+ (__CFString)ubiquityTokenSaltFilename
{
  return @"MobileHost.txt";
}

+ (id)brc_locateUbiquityTokenSaltInOldAccountPath:()BRCPathAdditions
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v9 = 0;
    goto LABEL_25;
  }
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v4 contentsOfDirectoryAtPath:v3 error:0];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
  v9 = v6;
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v10 = v7;
  v11 = 0;
  uint64_t v12 = *(void *)v29;
  *(void *)&long long v8 = 138412546;
  long long v27 = v8;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v29 != v12) {
        objc_enumerationMutation(v6);
      }
      v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      v15 = objc_msgSend(v14, "brc_stringByDeletingPathExtension", v27, (void)v28);
      int v16 = _br_parseUUIDString();

      if (v16)
      {
        v17 = brc_bread_crumbs();
        v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v27;
          id v33 = v14;
          __int16 v34 = 2112;
          v35 = v17;
          _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Located ubiquity salt path by the duck test - %@%@", buf, 0x16u);
        }

        uint64_t v19 = [v3 stringByAppendingPathComponent:v14];

        v11 = (void *)v19;
      }
    }
    uint64_t v10 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
  }
  while (v10);

  if (!v11) {
    goto LABEL_21;
  }
  v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v21 = [v20 fileExistsAtPath:v11];

  if ((v21 & 1) == 0)
  {
    v9 = [v3 stringByAppendingPathComponent:@"UnknownHost.txt"];

    v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v23 = [v22 fileExistsAtPath:v9];

    if (v23)
    {
      if (v9) {
        goto LABEL_24;
      }
LABEL_21:
      v24 = brc_bread_crumbs();
      v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v33 = v3;
        __int16 v34 = 2112;
        v35 = v24;
        _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't locate ubiquity salt path in %@%@", buf, 0x16u);
      }

      v9 = 0;
      goto LABEL_24;
    }
LABEL_20:

    goto LABEL_21;
  }
  v9 = v11;
LABEL_24:

LABEL_25:

  return v9;
}

+ (uint64_t)br_currentMobileDocumentsDir
{
  return objc_msgSend(a1, "br_currentMobileDocumentsDirWithRefreshCache:", 0);
}

+ (id)br_currentMobileDocumentsDirWithRefreshCache:()BRCPathAdditions
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (br_currentMobileDocumentsDirWithRefreshCache__once != -1) {
    dispatch_once(&br_currentMobileDocumentsDirWithRefreshCache__once, &__block_literal_global_18);
  }
  id v5 = (id)br_currentMobileDocumentsDirWithRefreshCache__pathByPersonaID;
  objc_sync_enter(v5);
  char v31 = 0;
  objc_msgSend(a1, "br_currentPersonaIDWithIsDataSeparated:", &v31);
  id v6 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  if (a3) {
    [(id)br_currentMobileDocumentsDirWithRefreshCache__pathByPersonaID removeObjectForKey:v6];
  }
  uint64_t v7 = [(id)br_currentMobileDocumentsDirWithRefreshCache__pathByPersonaID objectForKeyedSubscript:v6];
  if (!v7)
  {
    if (MEMORY[0x1D9437680]())
    {
      long long v8 = objc_msgSend(MEMORY[0x1E4F594D8], "br_getProviderDomainIDForCurrentPersona");
      if (v8)
      {
        id v30 = 0;
        v9 = [MEMORY[0x1E4F25D68] providerDomainWithID:v8 cachePolicy:0 error:&v30];
        id v10 = v30;
      }
      else
      {
        v9 = 0;
        id v10 = 0;
      }
      v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2112;
        id v33 = v6;
        LOWORD(v34) = 2112;
        *(void *)((char *)&v34 + 2) = v11;
        _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Getting root item for provider domain ID: %@. Found domain: %@. Current persona: %@%@", buf, 0x2Au);
      }

      if (v9)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        id v33 = __Block_byref_object_copy__21;
        *(void *)&long long v34 = __Block_byref_object_dispose__21;
        *((void *)&v34 + 1) = 0;
        uint64_t v13 = [v9 storageURLs];
        BOOL v14 = [v13 count] == 0;

        if (v14)
        {
          v20 = dispatch_group_create();
          dispatch_group_enter(v20);
          char v21 = [MEMORY[0x1E4F25D38] defaultManager];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __75__NSString_BRCPathAdditions__br_currentMobileDocumentsDirWithRefreshCache___block_invoke_22;
          v27[3] = &unk_1E6996E30;
          long long v29 = buf;
          v18 = v20;
          long long v28 = v18;
          [v21 fetchRootItemForProviderDomain:v9 completionHandler:v27];

          dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
          uint64_t v19 = v28;
        }
        else
        {
          v15 = [v9 storageURLs];
          uint64_t v16 = [v15 objectAtIndexedSubscript:0];
          v17 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v16;

          v18 = brc_bread_crumbs();
          uint64_t v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            +[NSString(BRCPathAdditions) br_currentMobileDocumentsDirWithRefreshCache:v19];
          }
        }

        v22 = *(void **)(*(void *)&buf[8] + 40);
        if (v22)
        {
          uint64_t v7 = [v22 path];
        }
        else
        {
          uint64_t v7 = 0;
        }
        _Block_object_dispose(buf, 8);
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = +[BRCStringAdditions _br_currentMobileDocumentsDirForLegacy];
    }
    if (v7)
    {
      int v23 = objc_msgSend(v7, "br_realpath");
      [(id)br_currentMobileDocumentsDirWithRefreshCache__pathByPersonaID setObject:v23 forKeyedSubscript:v6];
    }
    else
    {
      int v23 = brc_bread_crumbs();
      v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v23;
        _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] No path for Mobile Documents directory%@", buf, 0xCu);
      }
    }
  }
  id v25 = v7;

  objc_sync_exit(v5);

  return v25;
}

+ (void)br_currentMobileDocumentsDirWithRefreshCache:()BRCPathAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Getting root URL from storage URLs: %@%@", (uint8_t *)&v4, 0x16u);
}

@end