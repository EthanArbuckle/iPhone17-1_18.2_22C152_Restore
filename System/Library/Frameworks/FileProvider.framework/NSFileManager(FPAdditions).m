@interface NSFileManager(FPAdditions)
- (id)fp_putBackURLForTrashedItemAtURL:()FPAdditions error:;
- (id)fp_trashURLForItemAtURL:()FPAdditions error:;
- (uint64_t)fp_trashItemAtURL:()FPAdditions resultingItemURL:error:;
- (void)fp_createPathIfNeeded:()FPAdditions;
- (void)fp_setPutBackInfoOnItemAtURL:()FPAdditions;
@end

@implementation NSFileManager(FPAdditions)

- (uint64_t)fp_trashItemAtURL:()FPAdditions resultingItemURL:error:
{
  id v7 = a3;
  v8 = +[FPDaemonConnection synchronousSharedConnectionProxy];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__18;
  v22 = __Block_byref_object_dispose__18;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__NSFileManager_FPAdditions__fp_trashItemAtURL_resultingItemURL_error___block_invoke;
  v11[3] = &unk_1E5AF4998;
  v11[4] = &v24;
  v11[5] = &v18;
  v11[6] = &v12;
  [v8 trashItemAtURL:v7 completionHandler:v11];
  if (a4) {
    *a4 = (id) v19[5];
  }
  if (a5) {
    *a5 = (id) v13[5];
  }
  uint64_t v9 = *((unsigned __int8 *)v25 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v9;
}

- (void)fp_createPathIfNeeded:()FPAdditions
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t section = __fp_create_section();
  v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(NSFileManager(FPAdditions) *)&section fp_createPathIfNeeded:v4];
  }

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v45 = 0;
  char v6 = [v5 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v45];
  id v7 = v45;
  id v8 = v7;
  if (v6 & 1) != 0 || (objc_msgSend(v7, "fp_isCocoaErrorCode:", 516))
  {
    id v44 = v8;
    uint64_t v9 = [v5 attributesOfItemAtPath:v3 error:&v44];
    id v10 = v44;

    BOOL v11 = v10 == 0;
    if (v10)
    {
      uint64_t v12 = fp_current_or_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        [v3 fileSystemRepresentation];
        objc_msgSend(v10, "fp_prettyDescription");
        objc_claimAutoreleasedReturnValue();
        -[NSFileManager(FPAdditions) fp_createPathIfNeeded:].cold.5();
      }
    }
    v13 = [v9 fileOwnerAccountName];
    uint64_t v14 = NSUserName();
    char v15 = [v13 isEqual:v14];

    if ((v15 & 1) == 0)
    {
      v16 = fp_current_or_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        id v17 = [v9 fileOwnerAccountName];
        NSUserName();
        objc_claimAutoreleasedReturnValue();
        -[NSFileManager(FPAdditions) fp_createPathIfNeeded:].cold.4();
      }

      BOOL v11 = 0;
    }
    if (([v9 filePosixPermissions] & 0x180) == 0)
    {
      uint64_t v18 = fp_current_or_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        int v42 = aPcDBLSW[(unsigned __int16)[v9 filePosixPermissions] >> 12];
        if (([v9 filePosixPermissions] & 0x100) != 0) {
          int v28 = 114;
        }
        else {
          int v28 = 45;
        }
        int v41 = v28;
        if (([v9 filePosixPermissions] & 0x80) != 0) {
          int v29 = 119;
        }
        else {
          int v29 = 45;
        }
        HIDWORD(v39) = v29;
        if (([v9 filePosixPermissions] & 0x40) != 0) {
          int v30 = 120;
        }
        else {
          int v30 = 45;
        }
        LODWORD(v39) = v30;
        if ((objc_msgSend(v9, "filePosixPermissions", v39) & 0x20) != 0) {
          int v31 = 114;
        }
        else {
          int v31 = 45;
        }
        if (([v9 filePosixPermissions] & 0x10) != 0) {
          int v32 = 119;
        }
        else {
          int v32 = 45;
        }
        if (([v9 filePosixPermissions] & 8) != 0) {
          int v33 = 120;
        }
        else {
          int v33 = 45;
        }
        if (([v9 filePosixPermissions] & 4) != 0) {
          int v34 = 114;
        }
        else {
          int v34 = 45;
        }
        char v35 = [v9 filePosixPermissions];
        char v36 = [v9 filePosixPermissions];
        *(_DWORD *)buf = 67111424;
        if ((v35 & 2) != 0) {
          int v37 = 119;
        }
        else {
          int v37 = 45;
        }
        int v50 = v42;
        __int16 v51 = 1024;
        if (v36) {
          int v38 = 120;
        }
        else {
          int v38 = 45;
        }
        int v52 = v41;
        __int16 v53 = 1024;
        int v54 = HIDWORD(v40);
        __int16 v55 = 1024;
        int v56 = v40;
        __int16 v57 = 1024;
        int v58 = v31;
        __int16 v59 = 1024;
        int v60 = v32;
        __int16 v61 = 1024;
        int v62 = v33;
        __int16 v63 = 1024;
        int v64 = v34;
        __int16 v65 = 1024;
        int v66 = v37;
        __int16 v67 = 1024;
        int v68 = v38;
        _os_log_fault_impl(&dword_1A33AE000, v18, OS_LOG_TYPE_FAULT, "[CRIT] created directory doesn't have read/write access for owner (permission: %c%c%c%c%c%c%c%c%c%c)", buf, 0x3Eu);
      }

      BOOL v11 = 0;
    }
    uint64_t v19 = *MEMORY[0x1E4F28370];
    uint64_t v20 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28370]];
    uint64_t v21 = *MEMORY[0x1E4F28358];
    char v22 = [v20 isEqualToString:*MEMORY[0x1E4F28358]];

    if (v22)
    {
      id v8 = v10;
    }
    else
    {
      uint64_t v47 = v19;
      uint64_t v48 = v21;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      id v43 = v10;
      char v24 = [v5 setAttributes:v23 ofItemAtPath:v3 error:&v43];
      id v8 = v43;

      if ((v24 & 1) == 0)
      {
        v25 = fp_current_or_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v8, "fp_prettyDescription");
          objc_claimAutoreleasedReturnValue();
          -[NSFileManager(FPAdditions) fp_createPathIfNeeded:]();
        }
      }
    }

    if (v11)
    {
      uint64_t v26 = fp_current_or_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[NSFileManager(FPAdditions) fp_createPathIfNeeded:](v26);
      }
      goto LABEL_30;
    }
  }
  else
  {
    char v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v8, "fp_prettyDescription");
      objc_claimAutoreleasedReturnValue();
      -[NSFileManager(FPAdditions) fp_createPathIfNeeded:].cold.6();
    }
  }
  uint64_t v26 = fp_current_or_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[NSFileManager(FPAdditions) fp_createPathIfNeeded:]((uint64_t)v3, v26);
  }
LABEL_30:

  __fp_leave_section_Debug((uint64_t)&section);
}

- (id)fp_trashURLForItemAtURL:()FPAdditions error:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  +[FPFrameworkOverridesIterator allOverrides];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)v17;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v6);
      }
      id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        id v15 = 0;
        BOOL v11 = [v10 FPTrashURLForItemAtURL:v5 error:&v15];
        id v12 = v15;
        v13 = v12;
        if (v12)
        {
          id v7 = 0;
          if (a4) {
            *a4 = v12;
          }
        }
        else
        {
          if (!v11) {
            continue;
          }
          id v7 = v11;
        }

        goto LABEL_16;
      }
    }
    id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_16:

  return v7;
}

- (id)fp_putBackURLForTrashedItemAtURL:()FPAdditions error:
{
  id v5 = a3;
  id v6 = +[FPDaemonConnection synchronousSharedConnectionProxy];
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__18;
  uint64_t v20 = __Block_byref_object_dispose__18;
  id v21 = 0;
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__18;
  uint64_t v14 = __Block_byref_object_dispose__18;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__NSFileManager_FPAdditions__fp_putBackURLForTrashedItemAtURL_error___block_invoke;
  v9[3] = &unk_1E5AF49C0;
  v9[4] = &v16;
  v9[5] = &v10;
  [v6 putBackURLForTrashedItemAtURL:v5 completionHandler:v9];
  if (a4) {
    *a4 = (id) v11[5];
  }
  id v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

- (void)fp_setPutBackInfoOnItemAtURL:()FPAdditions
{
  id v3 = a3;
  v4 = +[FPDaemonConnection synchronousSharedConnectionProxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__NSFileManager_FPAdditions__fp_setPutBackInfoOnItemAtURL___block_invoke;
  v6[3] = &unk_1E5AF1240;
  id v7 = v3;
  id v5 = v3;
  [v4 setPutBackInfoOnItemAtURL:v5 completionHandler:v6];
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] permissions checked", v1, 2u);
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Errors where encountered while setting up %@ as expected. You may experience troubles.", (uint8_t *)&v2, 0xCu);
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.3()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_10_1(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_2_5(&dword_1A33AE000, "[CRIT] can't protect directory at '%@': %@", v4, v5);
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.4()
{
  OUTLINED_FUNCTION_21();
  uint64_t v2 = (void *)v1;
  OUTLINED_FUNCTION_10_1(v1, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_2_5(&dword_1A33AE000, "[CRIT] created directory has a wrong owner (value: %@, expected: %@)", v5, v6);
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.5()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_10_1(v1, v2, v3, 4.8151e-34);
  OUTLINED_FUNCTION_2_5(&dword_1A33AE000, "[CRIT] can't retrieve attributes of item at '%s': %@", v4, v5);
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.6()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_10_1(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_2_5(&dword_1A33AE000, "[CRIT] can't create directory at '%@': %@", v4, v5);
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.7(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx creating '%@'", (uint8_t *)&v4, 0x16u);
}

@end