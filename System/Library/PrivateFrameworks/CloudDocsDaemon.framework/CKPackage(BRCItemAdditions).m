@interface CKPackage(BRCItemAdditions)
+ (uint64_t)anchorExistsForArchiverInfo:()BRCItemAdditions;
+ (void)destroyAnchorAndPackageAnchoredAtURL:()BRCItemAdditions;
- (uint64_t)anchorAtURL:()BRCItemAdditions error:;
@end

@implementation CKPackage(BRCItemAdditions)

+ (void)destroyAnchorAndPackageAnchoredAtURL:()BRCItemAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[CKPackage(BRCItemAdditions) destroyAnchorAndPackageAnchoredAtURL:]();
  }

  if ([v3 checkResourceIsReachableAndReturnError:0])
  {
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3];
    v7 = [v6 objectForKeyedSubscript:@"databaseBasePath"];
    v8 = [v6 objectForKeyedSubscript:@"uuid"];
    v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138413058;
      id v13 = v3;
      __int16 v14 = 2112;
      v15 = v7;
      __int16 v16 = 2112;
      v17 = v8;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Destroying anchor %@, databaseBasePath: %@, UUID: %@%@", (uint8_t *)&v12, 0x2Au);
    }

    if (v7) {
      [MEMORY[0x1E4F1A250] destroyClientPackageWithDatabaseBasePath:v7 UUID:v8];
    }
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v11 removeItemAtURL:v3 error:0];
  }
}

+ (uint64_t)anchorExistsForArchiverInfo:()BRCItemAdditions
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithData:v4 encoding:4];

  v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  uint64_t v7 = [v6 checkResourceIsReachableAndReturnError:0];

  return v7;
}

- (uint64_t)anchorAtURL:()BRCItemAdditions error:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = brc_bread_crumbs();
  v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v19 = [a1 UUID];
    uint64_t v20 = [a1 rootDatabasePath];
    *(_DWORD *)buf = 138413058;
    v24 = v19;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    v28 = v20;
    __int16 v29 = 2112;
    v30 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Anchoring %@ at %@ (db at %@)%@", buf, 0x2Au);
  }
  [(id)objc_opt_class() destroyAnchorAndPackageAnchoredAtURL:v6];
  v9 = objc_msgSend(a1, "UUID", @"uuid");
  v21[1] = @"databaseBasePath";
  v22[0] = v9;
  v10 = [a1 rootDatabasePath];
  v22[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  int v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:100 options:0 error:a4];
  id v13 = v12;
  if (v12)
  {
    if (![v12 writeToURL:v6 options:1 error:a4])
    {
      uint64_t v16 = 0;
      goto LABEL_11;
    }
    __int16 v14 = [v6 absoluteString];
    v15 = [v14 dataUsingEncoding:4];

    uint64_t v16 = [a1 setArchiverInfo:v15 error:a4];
  }
  else
  {
    v15 = brc_bread_crumbs();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
      -[CKPackage(BRCItemAdditions) anchorAtURL:error:]();
    }

    uint64_t v16 = 0;
  }

LABEL_11:
  return v16;
}

+ (void)destroyAnchorAndPackageAnchoredAtURL:()BRCItemAdditions .cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Destroying anchor %@%@", v1, 0x16u);
}

- (void)anchorAtURL:()BRCItemAdditions error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Unable to serialize property list - %@%@", v1, 0x16u);
}

@end