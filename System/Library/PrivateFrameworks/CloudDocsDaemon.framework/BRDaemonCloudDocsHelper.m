@interface BRDaemonCloudDocsHelper
- (id)queryPathsForPersona:(id)a3 withError:(id *)a4;
@end

@implementation BRDaemonCloudDocsHelper

- (id)queryPathsForPersona:(id)a3 withError:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__30;
  v18 = __Block_byref_object_dispose__30;
  id v19 = 0;
  id v6 = (id)objc_opt_new();
  BRPerformWithPersonaAndError();
  v7 = (void *)v15[5];
  if (v7)
  {
    id v8 = v7;
    v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      v13 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v21 = "-[BRDaemonCloudDocsHelper queryPathsForPersona:withError:]";
      __int16 v22 = 2080;
      if (!a4) {
        v13 = "(ignored by caller)";
      }
      v23 = v13;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      v27 = v9;
      _os_log_error_impl(&dword_1D353B000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    if (a4) {
      *a4 = v8;
    }

    id v11 = 0;
  }
  else
  {
    id v11 = v6;
  }

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __58__BRDaemonCloudDocsHelper_queryPathsForPersona_withError___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    id v5 = objc_msgSend(NSString, "br_currentHomeDir");
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F59450]];

      v7 = +[BRCAccountsManager sharedManager];
      id v8 = [v7 accountHandlerForCurrentPersona];
      v9 = [v8 session];

      if ([v9 isOpen])
      {
        v10 = [v9 rootForSyncedFolderType:1];
        id v11 = [v10 physicalURL];

        if (v11) {
          [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F59410]];
        }
      }
      else
      {
        uint64_t v16 = brc_bread_crumbs();
        v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          __58__BRDaemonCloudDocsHelper_queryPathsForPersona_withError___block_invoke_cold_2((uint64_t)v9, (uint64_t)v16, v17);
        }
      }
    }
    else
    {
      v12 = brc_bread_crumbs();
      v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        __58__BRDaemonCloudDocsHelper_queryPathsForPersona_withError___block_invoke_cold_1((uint64_t)v12, v13);
      }

      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: No home directory");
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      v7 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
}

void __58__BRDaemonCloudDocsHelper_queryPathsForPersona_withError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No home directory%@", (uint8_t *)&v2, 0xCu);
}

void __58__BRDaemonCloudDocsHelper_queryPathsForPersona_withError___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Session %@ is not open. We can't get the mobile document path%@", (uint8_t *)&v3, 0x16u);
}

@end