@interface NSFileManager
@end

@implementation NSFileManager

uint64_t __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObjResult:0 error:a2];
}

id __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke_14(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v16 = 0;
  char v4 = [v2 writeToURL:v3 options:0 error:&v16];
  id v5 = v16;
  if ((v4 & 1) == 0)
  {
    v12 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]_block_invoke", 228);
    v13 = brc_default_log(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke_14_cold_2();
    }

    uint64_t v11 = objc_msgSend(v5, "br_underlyingPOSIXError");
    goto LABEL_9;
  }
  [*(id *)(a1 + 48) getCString:__s maxLength:765 encoding:4];
  v6 = (const char *)[*(id *)(a1 + 40) fileSystemRepresentation];
  size_t v7 = strlen(__s);
  if (setxattr(v6, "com.apple.icloud.itemName", __s, v7, 0, 1))
  {
    uint64_t v8 = *__error();
    v9 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]_block_invoke", 236);
    v10 = brc_default_log(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke_14_cold_1((uint64_t)v9, v8, v10);
    }

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v8);
LABEL_9:
    v14 = (void *)v11;
    goto LABEL_10;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

id __59__NSFileManager_BRAdditions__br_setPutBackInfoOnItemAtURL___block_invoke(uint64_t a1, int a2)
{
  char v4 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_setPutBackInfoOnItemAtURL:]_block_invoke", 314);
  id v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __59__NSFileManager_BRAdditions__br_setPutBackInfoOnItemAtURL___block_invoke_cold_1(a1, (uint64_t)v4, v5);
  }

  if ((brc_xattr_set_string(a2, "com.apple.trash.put-back.path#PS", *(void **)(a1 + 32)) & 0x80000000) != 0
    || (brc_xattr_set_string(a2, "com.apple.trash.put-back.icloud-parent-id#PS", *(void **)(a1 + 40)) & 0x80000000) != 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __67__NSFileManager_BRAdditions__br_trashItemAtURL_resultingURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if ([v12 count])
  {
    v6 = [v12 objectAtIndexedSubscript:0];
    uint64_t v7 = [v6 fileURL];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

uint64_t __67__NSFileManager_BRAdditions__br_trashItemAtURL_resultingURL_error___block_invoke_36(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

void __76__NSFileManager_BRAdditions__br_putBackTrashedItemAtURL_resultingURL_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackTrashedItemAtURL:resultingURL:error:]_block_invoke", 426);
    v6 = brc_default_log(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) path];
      uint64_t v8 = objc_msgSend(v7, "fp_obfuscatedPath");
      int v11 = 138412802;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to untrash item at %@ - %@%@", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v4;
}

id __61__NSFileManager_BRAdditions__br_setLastOpenDate_onItemAtURL___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) timeIntervalSince1970];
  uint64_t v3 = (uint64_t)v2;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  id v4 = objc_msgSend(*(id *)(a1 + 40), "br_physicalURL");
  id v5 = [v4 path];
  uint64_t v6 = objc_msgSend(v5, "br_fileSystemRepresentation");

  if (BRGetLastUsedDate(0xFFFFFFFFLL, v6, (uint64_t)&v19)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v19 <= v3;
  }
  if (!v7)
  {
    id v14 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_setLastOpenDate:onItemAtURL:]_block_invoke", 464);
    __int16 v15 = brc_default_log(1);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v12 = [*(id *)(a1 + 40) path];
    __int16 v13 = objc_msgSend(v12, "fp_obfuscatedPath");
    *(_DWORD *)buf = 138413058;
    v22 = v13;
    __int16 v23 = 2048;
    uint64_t v24 = v19;
    __int16 v25 = 2048;
    uint64_t v26 = v3;
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Ignoring setting last open date on %@ because it's going back in time from %ld to %ld%@", buf, 0x2Au);
    goto LABEL_11;
  }
  uint64_t v19 = v3;
  uint64_t v20 = 0;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "br_physicalURL", v3, 0);
  id v9 = [v8 path];
  int UsedDate = BRSetLastUsedDate(0xFFFFFFFFLL, objc_msgSend(v9, "br_fileSystemRepresentation"), (uint64_t)&v19);

  if ((UsedDate & 0x80000000) == 0)
  {
    id v14 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_setLastOpenDate:onItemAtURL:]_block_invoke", 479);
    __int16 v15 = brc_default_log(1);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
LABEL_12:
      uint64_t v17 = 0;
      goto LABEL_13;
    }
    int v11 = *(void **)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) path];
    __int16 v13 = objc_msgSend(v12, "fp_obfuscatedPath");
    *(_DWORD *)buf = 138412802;
    v22 = v11;
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v13;
    __int16 v25 = 2112;
    uint64_t v26 = (uint64_t)v14;
    _os_log_debug_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Set last used date %@ on %@%@", buf, 0x20u);
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
  id v14 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_setLastOpenDate:onItemAtURL:]_block_invoke", 476);
  __int16 v15 = brc_default_log(0);
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
    __61__NSFileManager_BRAdditions__br_setLastOpenDate_onItemAtURL___block_invoke_cold_1((uint64_t)v14, v15);
  }
LABEL_13:

  return v17;
}

id __61__NSFileManager_BRAdditions__br_setFavoriteRank_onItemAtURL___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) stringValue];
  int v4 = brc_xattr_set_string(a2, "com.apple.favorite-rank.number#PS", v3);

  if (v4 < 0)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke_14_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] failed to write xattr:  %{errno}d%@", (uint8_t *)v3, 0x12u);
}

void __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke_14_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] failed to writeToURL: %@%@");
}

void __59__NSFileManager_BRAdditions__br_setPutBackInfoOnItemAtURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] setting put back info path:%@ item:%@%@", (uint8_t *)&v5, 0x20u);
}

void __61__NSFileManager_BRAdditions__br_setLastOpenDate_onItemAtURL___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  v5[0] = 67109378;
  v5[1] = v4;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_19ED3F000, a2, (os_log_type_t)0x90u, "[ERROR] can't to set Spotlight last-used date xattrs %{errno}d%@", (uint8_t *)v5, 0x12u);
}

@end