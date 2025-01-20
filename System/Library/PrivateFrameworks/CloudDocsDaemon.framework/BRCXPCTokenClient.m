@interface BRCXPCTokenClient
- (NSString)description;
- (void)currentAccountCopyTokenWithBundleID:(id)a3 version:(id)a4 reply:(id)a5;
- (void)fetchContainerPathForCurrentPersonaWithReply:(id)a3;
- (void)fetchGroupContainerPathForCurrentPersonaForFPFS:(BOOL)a3 withReply:(id)a4;
- (void)fetchGroupContainerPathForCurrentPersonaWithReply:(id)a3;
- (void)getPrimaryiCloudAccountStatus:(id)a3;
- (void)prepareFileProvidersWithReply:(id)a3;
@end

@implementation BRCXPCTokenClient

- (void)currentAccountCopyTokenWithBundleID:(id)a3 version:(id)a4 reply:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(BRCXPCClient *)self session];
  v11 = [v10 accountHandler];

  if (v11)
  {
    v12 = 0;
    goto LABEL_3;
  }
  v30 = +[BRCAccountHandler currentiCloudAccount];
  if (objc_msgSend(v30, "br_isEnabledForCloudDocs"))
  {
    v31 = objc_msgSend(v30, "br_personaIdentifier");
    if ([v31 isEqualToString:@"__defaultPersonaID__"])
    {
    }
    else
    {
      objc_msgSend(v30, "br_personaIdentifier");
      id v36 = (id)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        int v37 = 0;
        goto LABEL_32;
      }
    }
    if (currentAccountCopyTokenWithBundleID_version_reply____personaOnceToken != -1) {
      dispatch_once(&currentAccountCopyTokenWithBundleID_version_reply____personaOnceToken, &__block_literal_global_266);
    }
    id v36 = (id)currentAccountCopyTokenWithBundleID_version_reply____personalPersona;
    int v37 = 1;
LABEL_32:
    v38 = [MEMORY[0x1E4FB36F8] sharedManager];
    v63 = [v38 currentPersona];

    *(void *)buf = 0;
    id v39 = [v63 userPersonaUniqueString];
    id v61 = v39;
    if (v39 == v36 || (objc_msgSend(v39, "isEqualToString:", v36, v39) & 1) != 0)
    {
      v40 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        id v65 = 0;
        uint64_t v48 = [v63 copyCurrentPersonaContextWithError:&v65];
        id v49 = v65;
        v50 = *(void **)buf;
        *(void *)buf = v48;

        if (v49)
        {
          v51 = brc_bread_crumbs();
          v52 = brc_default_log();
          if (os_log_type_enabled(v52, (os_log_type_t)0x90u)) {
            -[_BRCOperation completedWithResult:error:]();
          }
        }
        v40 = [v63 generateAndRestorePersonaContextWithPersonaUniqueString:v36];

        if (!v40) {
          goto LABEL_35;
        }
        v53 = brc_bread_crumbs();
        v54 = brc_default_log();
        if (os_log_type_enabled(v54, (os_log_type_t)0x90u))
        {
          v55 = objc_msgSend(v30, "br_personaIdentifier");
          ctx.ctx[0] = 138412802;
          *(void *)&ctx.ctx[1] = v55;
          LOWORD(ctx.ctx[3]) = 2112;
          *(void *)((char *)&ctx.ctx[3] + 2) = v40;
          HIWORD(ctx.ctx[5]) = 2112;
          *(void *)&ctx.ctx[6] = v53;
          _os_log_error_impl(&dword_1D353B000, v54, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", (uint8_t *)&ctx, 0x20u);
        }
      }
      else
      {
        if (!v37 || ([v63 isDataSeparatedPersona] & 1) != 0)
        {
          v59 = brc_bread_crumbs();
          v60 = brc_default_log();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
            __br_notify_register_dispatch_block_invoke_cold_3();
          }

          v40 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
          goto LABEL_35;
        }
        v53 = brc_bread_crumbs();
        v54 = brc_default_log();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
          __br_notify_register_dispatch_block_invoke_cold_4();
        }
        v40 = 0;
      }
    }
LABEL_35:
    v41 = +[BRCAccountsManager sharedManager];
    v11 = [v41 getOrCreateAccountHandlerForACAccount:v30];

    v12 = objc_msgSend(v30, "br_dsid");
    if ([v11 finishedLoading])
    {
      v42 = [v11 session];
      BOOL v43 = v42 == 0;

      if (v43)
      {
        v57 = brc_bread_crumbs();
        v58 = brc_default_log();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          ctx.ctx[0] = 138413058;
          *(void *)&ctx.ctx[1] = self;
          LOWORD(ctx.ctx[3]) = 2112;
          *(void *)((char *)&ctx.ctx[3] + 2) = 0;
          HIWORD(ctx.ctx[5]) = 2112;
          *(void *)&ctx.ctx[6] = 0;
          LOWORD(ctx.ctx[8]) = 2112;
          *(void *)((char *)&ctx.ctx[8] + 2) = v57;
          _os_log_impl(&dword_1D353B000, v58, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&ctx, 0x2Au);
        }

        (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
        _BRRestorePersona();

        goto LABEL_22;
      }
    }

    _BRRestorePersona();
LABEL_3:
    int v13 = [(BRCClientPrivilegesDescriptor *)self->super._clientPriviledgesDescriptor cloudEnabledStatusWithHasSession:1];
    v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v56 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_cloud_enabled_status_entries, 0);
      ctx.ctx[0] = 138412802;
      *(void *)&ctx.ctx[1] = self;
      LOWORD(ctx.ctx[3]) = 2112;
      *(void *)((char *)&ctx.ctx[3] + 2) = v56;
      HIWORD(ctx.ctx[5]) = 2112;
      *(void *)&ctx.ctx[6] = v14;
      _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: %@%@", (uint8_t *)&ctx, 0x20u);
    }
    if (v13 == 1 || v13 == 253)
    {
      v16 = [v11 ubiquityTokenSalt];
      v17 = [(BRCXPCClient *)self bundleID];
      if (v12
        || ([v11 session],
            v18 = objc_claimAutoreleasedReturnValue(),
            [v18 accountDSID],
            v12 = objc_claimAutoreleasedReturnValue(),
            v18,
            v12))
      {
        memset(&ctx, 0, sizeof(ctx));
        id v19 = v12;
        v20 = (const char *)[v19 UTF8String];
        size_t v21 = strlen(v20);
        CCHmacInit(&ctx, 0, v20, v21);
        v22 = (const char *)[v16 UTF8String];
        size_t v23 = strlen(v22);
        CCHmacUpdate(&ctx, v22, v23);
        CCHmacUpdate(&ctx, ":", 1uLL);
        uint64_t v24 = [v17 UTF8String];
        if (v24) {
          v25 = (const char *)v24;
        }
        else {
          v25 = "(null)";
        }
        size_t v26 = strlen(v25);
        CCHmacUpdate(&ctx, v25, v26);
        CCHmacFinal(&ctx, macOut);
        v27 = [MEMORY[0x1E4F1C9B8] dataWithBytes:macOut length:20];
        v28 = brc_bread_crumbs();
        v29 = brc_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          *(void *)&buf[4] = self;
          __int16 v67 = 2112;
          v68 = v27;
          __int16 v69 = 2112;
          uint64_t v70 = 0;
          __int16 v71 = 2112;
          v72 = v28;
          _os_log_impl(&dword_1D353B000, v29, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }

        (*((void (**)(id, void *, void))v9 + 2))(v9, v27, 0);
      }
      else
      {
        v44 = brc_bread_crumbs();
        v45 = brc_default_log();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
          -[BRCXPCTokenClient currentAccountCopyTokenWithBundleID:version:reply:]();
        }

        v46 = brc_bread_crumbs();
        v47 = brc_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          ctx.ctx[0] = 138413058;
          *(void *)&ctx.ctx[1] = self;
          LOWORD(ctx.ctx[3]) = 2112;
          *(void *)((char *)&ctx.ctx[3] + 2) = 0;
          HIWORD(ctx.ctx[5]) = 2112;
          *(void *)&ctx.ctx[6] = 0;
          LOWORD(ctx.ctx[8]) = 2112;
          *(void *)((char *)&ctx.ctx[8] + 2) = v46;
          _os_log_impl(&dword_1D353B000, v47, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&ctx, 0x2Au);
        }

        (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
      }
    }
    else
    {
      v32 = brc_bread_crumbs();
      v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        ctx.ctx[0] = 138413058;
        *(void *)&ctx.ctx[1] = self;
        LOWORD(ctx.ctx[3]) = 2112;
        *(void *)((char *)&ctx.ctx[3] + 2) = 0;
        HIWORD(ctx.ctx[5]) = 2112;
        *(void *)&ctx.ctx[6] = 0;
        LOWORD(ctx.ctx[8]) = 2112;
        *(void *)((char *)&ctx.ctx[8] + 2) = v32;
        _os_log_impl(&dword_1D353B000, v33, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&ctx, 0x2Au);
      }

      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
LABEL_22:
    v30 = v11;
    goto LABEL_23;
  }
  v34 = brc_bread_crumbs();
  v35 = brc_default_log();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    ctx.ctx[0] = 138413058;
    *(void *)&ctx.ctx[1] = self;
    LOWORD(ctx.ctx[3]) = 2112;
    *(void *)((char *)&ctx.ctx[3] + 2) = 0;
    HIWORD(ctx.ctx[5]) = 2112;
    *(void *)&ctx.ctx[6] = 0;
    LOWORD(ctx.ctx[8]) = 2112;
    *(void *)((char *)&ctx.ctx[8] + 2) = v34;
    _os_log_impl(&dword_1D353B000, v35, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&ctx, 0x2Au);
  }

  (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
LABEL_23:
}

- (NSString)description
{
  v5.receiver = self;
  v5.super_class = (Class)BRCXPCTokenClient;
  v2 = [(BRCXPCClient *)&v5 description];
  v3 = [v2 stringByAppendingString:@"<token-getter>"];

  return (NSString *)v3;
}

- (void)prepareFileProvidersWithReply:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v16, 0, sizeof(v16));
  __brc_create_section(1, (uint64_t)"-[BRCXPCTokenClient prepareFileProvidersWithReply:]", 1374, v16);
  objc_super v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v16[0];
    qos_class_t v8 = qos_class_self();
    id v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    v18 = (BRCXPCTokenClient *)v7;
    __int16 v19 = 2112;
    v20 = self;
    __int16 v21 = 2112;
    v22 = v9;
    __int16 v23 = 2080;
    uint64_t v24 = "-[BRCXPCTokenClient prepareFileProvidersWithReply:]";
    __int16 v25 = 2112;
    size_t v26 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__BRCXPCTokenClient_prepareFileProvidersWithReply___block_invoke;
  v14[3] = &unk_1E69957B0;
  v14[4] = self;
  id v10 = v4;
  id v15 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 0, v14);

  if (v11)
  {
    v12 = brc_bread_crumbs();
    int v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v18 = self;
      __int16 v19 = 2112;
      v20 = 0;
      __int16 v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  __brc_leave_section(v16);
}

void __51__BRCXPCTokenClient_prepareFileProvidersWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  objc_super v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__BRCXPCTokenClient_currentAccountCopyTokenWithBundleID_version_reply___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)currentAccountCopyTokenWithBundleID_version_reply____personalPersona;
  currentAccountCopyTokenWithBundleID_version_reply____personalPersona = v0;
}

- (void)getPrimaryiCloudAccountStatus:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  memset(v53, 0, sizeof(v53));
  __brc_create_section(1, (uint64_t)"-[BRCXPCTokenClient getPrimaryiCloudAccountStatus:]", 1458, v53);
  id v4 = brc_bread_crumbs();
  objc_super v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v53[0];
    qos_class_t v7 = qos_class_self();
    uint64_t v8 = BRCPrettyPrintEnumWithContext(v7, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    v57 = (BRCXPCTokenClient *)v6;
    __int16 v58 = 2112;
    v59 = self;
    __int16 v60 = 2112;
    id v61 = v8;
    __int16 v62 = 2080;
    v63 = "-[BRCXPCTokenClient getPrimaryiCloudAccountStatus:]";
    __int16 v64 = 2112;
    id v65 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __51__BRCXPCTokenClient_getPrimaryiCloudAccountStatus___block_invoke;
  v51[3] = &unk_1E69957B0;
  v51[4] = self;
  id v47 = v3;
  id v52 = v47;
  int v9 = _brc_ipc_check_logged_status(self, 0, v51);

  if (v9)
  {
    id v10 = +[BRCAccountHandler currentiCloudAccount];
    uint64_t v11 = [v10 isEnabledForDataclass:*MEMORY[0x1E4F17B38]];
    int v12 = objc_msgSend(v10, "br_isCloudDocsMigrationComplete");
    uint64_t v48 = v10;
    v45 = objc_msgSend(v10, "br_dsid");
    uint64_t v13 = +[BRCAccountsManager sharedManager];
    v14 = [v48 identifier];
    v46 = [v13 accountHandlerForACAccountID:v14];

    id v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCTokenClient getPrimaryiCloudAccountStatus:]();
    }

    if (v12)
    {
      v17 = [v46 session];
      v18 = [v17 dirPathForSyncedFolderType:1];

      __int16 v19 = [v18 stringByAppendingPathComponent:*MEMORY[0x1E4F59420]];

      if (v19)
      {
        v20 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v50 = 0;
        char v21 = [v20 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:0 error:&v50];
        v22 = (BRCXPCTokenClient *)v50;

        if (v21 & 1) != 0 || ([(BRCXPCTokenClient *)v22 br_isCocoaErrorCode:516])
        {
          uint64_t v23 = 1;
        }
        else
        {
          uint64_t v24 = brc_bread_crumbs();
          __int16 v25 = brc_default_log();
          if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            v57 = v19;
            __int16 v58 = 2112;
            v59 = v22;
            __int16 v60 = 2112;
            id v61 = v24;
            _os_log_error_impl(&dword_1D353B000, v25, (os_log_type_t)0x90u, "[ERROR] Can't create %@: %@%@", buf, 0x20u);
          }

          uint64_t v23 = 0;
        }
      }
      else
      {
        uint64_t v23 = 0;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
    size_t v26 = brc_bread_crumbs();
    uint64_t v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCTokenClient getPrimaryiCloudAccountStatus:]();
    }

    uint64_t v28 = BRGetMigrationStatusForDSID();
    v29 = [v46 loggedOutError];
    uint64_t v30 = objc_msgSend(v29, "br_isCloudDocsErrorCode:", 22);
    v44 = v29;
    v54[0] = *MEMORY[0x1E4F59240];
    v31 = [NSNumber numberWithChar:v28];
    v55[0] = v31;
    v54[1] = *MEMORY[0x1E4F59220];
    v32 = [NSNumber numberWithBool:v11];
    v55[1] = v32;
    v54[2] = *MEMORY[0x1E4F59208];
    v33 = [NSNumber numberWithBool:v23];
    v55[2] = v33;
    v54[3] = *MEMORY[0x1E4F59210];
    v34 = [NSNumber numberWithBool:v30];
    v55[3] = v34;
    v54[4] = *MEMORY[0x1E4F59230];
    v35 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v48, "br_isEnabledForDesktopSync"));
    v55[4] = v35;
    v54[5] = *MEMORY[0x1E4F59238];
    id v36 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v48, "br_isEnabledForDesktopSync"));
    v55[5] = v36;
    v54[6] = *MEMORY[0x1E4F59228];
    int v37 = NSNumber;
    v38 = [(BRCXPCClient *)self session];
    id v39 = [v37 numberWithInt:v38 != 0];
    v55[6] = v39;
    v54[7] = *MEMORY[0x1E4F59218];
    v40 = [NSNumber numberWithBool:0];
    v55[7] = v40;
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:8];

    brc_bread_crumbs();
    v42 = (char *)objc_claimAutoreleasedReturnValue();
    BOOL v43 = brc_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v57 = self;
      __int16 v58 = 2112;
      v59 = v41;
      __int16 v60 = 2112;
      id v61 = 0;
      __int16 v62 = 2112;
      v63 = v42;
      _os_log_impl(&dword_1D353B000, v43, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCTokenClient *, void))v47 + 2))(v47, v41, 0);
  }
  __brc_leave_section(v53);
}

void __51__BRCXPCTokenClient_getPrimaryiCloudAccountStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  objc_super v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchContainerPathForCurrentPersonaWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCTokenClient fetchContainerPathForCurrentPersonaWithReply:]", 1527, v18);
  objc_super v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    v20 = (BRCXPCTokenClient *)v7;
    __int16 v21 = 2112;
    v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2080;
    size_t v26 = "-[BRCXPCTokenClient fetchContainerPathForCurrentPersonaWithReply:]";
    __int16 v27 = 2112;
    uint64_t v28 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__BRCXPCTokenClient_fetchContainerPathForCurrentPersonaWithReply___block_invoke;
  uint64_t v16[3] = &unk_1E69957B0;
  v16[4] = self;
  id v10 = v4;
  id v17 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 0, v16);

  if (v11)
  {
    brc_bread_crumbs();
    id v12 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(NSString, "br_currentHomeDir");
      v14 = (BRCXPCTokenClient *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = 0;
      __int16 v25 = 2112;
      size_t v26 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v15 = objc_msgSend(NSString, "br_currentHomeDir");
    (*((void (**)(id, void *, void))v10 + 2))(v10, v15, 0);
  }
  __brc_leave_section(v18);
}

void __66__BRCXPCTokenClient_fetchContainerPathForCurrentPersonaWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  objc_super v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchGroupContainerPathForCurrentPersonaWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCTokenClient fetchGroupContainerPathForCurrentPersonaWithReply:]", 1536, v18);
  objc_super v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    v20 = (BRCXPCTokenClient *)v7;
    __int16 v21 = 2112;
    v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2080;
    size_t v26 = "-[BRCXPCTokenClient fetchGroupContainerPathForCurrentPersonaWithReply:]";
    __int16 v27 = 2112;
    uint64_t v28 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__BRCXPCTokenClient_fetchGroupContainerPathForCurrentPersonaWithReply___block_invoke;
  uint64_t v16[3] = &unk_1E69957B0;
  v16[4] = self;
  id v10 = v4;
  id v17 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 0, v16);

  if (v11)
  {
    brc_bread_crumbs();
    id v12 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(NSString, "br_personaGroupDir");
      v14 = (BRCXPCTokenClient *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = 0;
      __int16 v25 = 2112;
      size_t v26 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v15 = objc_msgSend(NSString, "br_personaGroupDir");
    (*((void (**)(id, void *, void))v10 + 2))(v10, v15, 0);
  }
  __brc_leave_section(v18);
}

void __71__BRCXPCTokenClient_fetchGroupContainerPathForCurrentPersonaWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  objc_super v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchGroupContainerPathForCurrentPersonaForFPFS:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(1, (uint64_t)"-[BRCXPCTokenClient fetchGroupContainerPathForCurrentPersonaForFPFS:withReply:]", 1545, v20);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v20[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    v22 = (BRCXPCTokenClient *)v9;
    __int16 v23 = 2112;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    size_t v26 = v11;
    __int16 v27 = 2080;
    uint64_t v28 = "-[BRCXPCTokenClient fetchGroupContainerPathForCurrentPersonaForFPFS:withReply:]";
    __int16 v29 = 2112;
    uint64_t v30 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__BRCXPCTokenClient_fetchGroupContainerPathForCurrentPersonaForFPFS_withReply___block_invoke;
  uint64_t v18[3] = &unk_1E69957B0;
  v18[4] = self;
  id v12 = v6;
  id v19 = v12;
  int v13 = _brc_ipc_check_logged_status(self, 0, v18);

  if (v13)
  {
    brc_bread_crumbs();
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(NSString, "br_personaGroupDirForFPFS:", v4);
      v16 = (BRCXPCTokenClient *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v22 = self;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      size_t v26 = 0;
      __int16 v27 = 2112;
      uint64_t v28 = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v17 = objc_msgSend(NSString, "br_personaGroupDirForFPFS:", v4);
    (*((void (**)(id, void *, void))v12 + 2))(v12, v17, 0);
  }
  __brc_leave_section(v20);
}

void __79__BRCXPCTokenClient_fetchGroupContainerPathForCurrentPersonaForFPFS_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = brc_bread_crumbs();
  objc_super v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)currentAccountCopyTokenWithBundleID:version:reply:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: should have an account dsid%@", v2, v3, v4, v5, v6);
}

- (void)getPrimaryiCloudAccountStatus:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] checking status for %@%@");
}

- (void)getPrimaryiCloudAccountStatus:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] account: %@%@");
}

@end