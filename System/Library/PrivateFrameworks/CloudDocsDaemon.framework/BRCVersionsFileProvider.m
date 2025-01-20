@interface BRCVersionsFileProvider
- (BRCVersionsFileProvider)initWithVolume:(id)a3 personaIdentifier:(id)a4;
- (id)_fileReactorID;
- (id)_physicalURLForURL:(id)a3;
- (void)_cancelProvidingItemAtURL:(id)a3 toReaderWithID:(id)a4;
- (void)_provideItemAtURL:(id)a3 toReaderWithID:(id)a4 completionHandler:(id)a5;
- (void)dumpToContext:(id)a3;
- (void)resume;
@end

@implementation BRCVersionsFileProvider

- (BRCVersionsFileProvider)initWithVolume:(id)a3 personaIdentifier:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  int v9 = [v8 isIgnoringOwnership];
  v10 = (void *)MEMORY[0x1E4F1CB10];
  v11 = [v8 mountPath];

  if (v9)
  {
    v22[0] = v11;
    v22[1] = @".DocumentRevisions-V100/AllUIDs";
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v13 = [v10 fileURLWithPathComponents:v12];
  }
  else
  {
    v21[0] = v11;
    v21[1] = @".DocumentRevisions-V100/PerUID";
    v12 = [NSNumber numberWithUnsignedInt:getuid()];
    v14 = [v12 stringValue];
    v21[2] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    v13 = [v10 fileURLWithPathComponents:v15];
  }
  v20.receiver = self;
  v20.super_class = (Class)BRCVersionsFileProvider;
  v16 = [(BRCFileProvider *)&v20 initWithURL:v13 name:@"versions"];
  if (v16)
  {
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    operationsByName = v16->_operationsByName;
    v16->_operationsByName = v17;

    objc_storeStrong((id *)&v16->_personaIdentifier, a4);
  }

  return v16;
}

- (void)resume
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] FPFS flag disabled, bird will handle coordination on the Genstore for version download%@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)BRCVersionsFileProvider;
  [(BRCFileProvider *)&v5 resume];
}

- (void)dumpToContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCVersionsFileProvider;
  [(BRCFileProvider *)&v10 dumpToContext:v4];
  objc_super v5 = self;
  objc_sync_enter(v5);
  if ([(NSMutableDictionary *)v5->_operationsByName count])
  {
    [v4 writeLineWithFormat:@"coordinated readers"];
    [v4 writeLineWithFormat:@"-----------------------------------------------------"];
    operationsByName = v5->_operationsByName;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__BRCVersionsFileProvider_dumpToContext___block_invoke;
    v8[3] = &unk_1E6995BF8;
    id v7 = v4;
    id v9 = v7;
    [(NSMutableDictionary *)operationsByName enumerateKeysAndObjectsUsingBlock:v8];
    [v7 writeLineWithFormat:&stru_1F2AC7720];
  }
  objc_sync_exit(v5);
}

uint64_t __41__BRCVersionsFileProvider_dumpToContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"  + %@", a2];
}

- (id)_fileReactorID
{
  return @"com.apple.bird.versions";
}

- (id)_physicalURLForURL:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSString *)self->_personaIdentifier isEqualToString:@"__defaultPersonaID__"]
    || (objc_super v5 = self->_personaIdentifier) == 0)
  {
    if (_physicalURLForURL____personaOnceToken != -1) {
      dispatch_once(&_physicalURLForURL____personaOnceToken, &__block_literal_global_35);
    }
    v6 = (NSString *)(id)_physicalURLForURL____personalPersona;
    int v7 = 1;
  }
  else
  {
    v6 = v5;
    int v7 = 0;
  }
  uint64_t v8 = [MEMORY[0x1E4FB36F8] sharedManager];
  v51 = [v8 currentPersona];

  id v61 = 0;
  id v9 = [v51 userPersonaUniqueString];
  objc_super v10 = v9;
  if (v9 == v6 || [(NSString *)v9 isEqualToString:v6])
  {
    v11 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v60 = 0;
    v28 = (void *)[v51 copyCurrentPersonaContextWithError:&v60];
    id v29 = v60;
    id v30 = v61;
    id v61 = v28;

    if (v29)
    {
      v31 = brc_bread_crumbs();
      v32 = brc_default_log();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u)) {
        -[_BRCOperation completedWithResult:error:]();
      }
    }
    v11 = [v51 generateAndRestorePersonaContextWithPersonaUniqueString:v6];

    if (v11)
    {
      brc_bread_crumbs();
      v33 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      v34 = brc_default_log();
      if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
      {
        personaIdentifier = self->_personaIdentifier;
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = personaIdentifier;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        v63 = v33;
        _os_log_error_impl(&dword_1D353B000, v34, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_50:
    }
  }
  else
  {
    if (v7 && ([v51 isDataSeparatedPersona] & 1) == 0)
    {
      brc_bread_crumbs();
      v33 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
      v11 = 0;
      goto LABEL_50;
    }
    v38 = brc_bread_crumbs();
    v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      __br_notify_register_dispatch_block_invoke_cold_3();
    }

    v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_10:
  id v58 = 0;
  id v59 = 0;
  v12 = [v4 pathComponents];
  id v57 = 0;
  memset(v56, 0, sizeof(v56));
  __brc_create_section(0, (uint64_t)"-[BRCVersionsFileProvider _physicalURLForURL:]", 103, v56);
  brc_bread_crumbs();
  v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v40 = v11;
    uint64_t v41 = v56[0];
    v42 = [v4 path];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v41;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v42;
    *(_WORD *)&buf[22] = 2112;
    v63 = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx physical URL request for '%@'%@", buf, 0x20u);

    v11 = v40;
  }

  if ((unint64_t)[v12 count] > 1)
  {
    v19 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 2);
    v18 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
    uint64_t v20 = *MEMORY[0x1E4F63BB8];
    if ([v19 isEqualToString:*MEMORY[0x1E4F63BB8]])
    {
      if (objc_msgSend(MEMORY[0x1E4F63BD8], "brc_parseAdditionFilename:mangledID:itemID:etag:session:", v18, &v58, &v57, &v59, self->super._session))
      {
        v21 = self->super._session;
        v49 = v21;
        if (!v21)
        {
          uint64_t v43 = brc_bread_crumbs();
          v44 = brc_default_log();
          id v50 = (id)v43;
          if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
          {
            [v4 path];
            objc_claimAutoreleasedReturnValue();
            -[BRCVersionsFileProvider _physicalURLForURL:]();
          }

          id v17 = 0;
          goto LABEL_59;
        }
        id v50 = [(BRCAccountSession *)v21 clientZoneByMangledID:v58];
        if (!v50)
        {
          v45 = brc_bread_crumbs();
          v46 = brc_default_log();
          if (os_log_type_enabled(v46, (os_log_type_t)0x90u))
          {
            [v4 path];
            objc_claimAutoreleasedReturnValue();
            -[BRCVersionsFileProvider _physicalURLForURL:]();
          }

          id v17 = v4;
          goto LABEL_59;
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v63 = __Block_byref_object_copy__32;
        v64 = __Block_byref_object_dispose__32;
        id v65 = 0;
        v22 = [(BRCAccountSession *)v49 clientDB];
        v23 = [v22 serialQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __46__BRCVersionsFileProvider__physicalURLForURL___block_invoke_38;
        block[3] = &unk_1E6996D20;
        id v50 = v50;
        id v53 = v50;
        id v54 = v57;
        v55 = buf;
        dispatch_sync(v23, block);

        v24 = *(void **)(*(void *)&buf[8] + 40);
        if (v24)
        {
          v25 = [v24 additionWithName:v18 inNameSpace:v20 error:0];

          if (!v25)
          {
            v47 = [(BRCAccountSession *)v49 stageRegistry];
            id v17 = [v47 nonLocalFaultURLForAdditionName:v18];

            goto LABEL_58;
          }
          v26 = brc_bread_crumbs();
          v27 = brc_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            -[BRCVersionsFileProvider _physicalURLForURL:].cold.5();
          }
        }
        else
        {
          v26 = brc_bread_crumbs();
          v27 = brc_default_log();
          if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
          {
            [v4 path];
            objc_claimAutoreleasedReturnValue();
            -[BRCVersionsFileProvider _physicalURLForURL:].cold.4();
          }
        }

        id v17 = v4;
LABEL_58:

        _Block_object_dispose(buf, 8);
LABEL_59:

        goto LABEL_60;
      }
      v36 = brc_bread_crumbs();
      v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        [v4 path];
        objc_claimAutoreleasedReturnValue();
        -[BRCVersionsFileProvider _physicalURLForURL:].cold.6();
      }
    }
    else
    {
      v36 = brc_bread_crumbs();
      v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        -[BRCVersionsFileProvider _physicalURLForURL:].cold.7();
      }
    }

    id v17 = v4;
    goto LABEL_60;
  }
  v15 = brc_bread_crumbs();
  v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    -[BRCVersionsFileProvider _physicalURLForURL:]();
  }

  id v17 = v4;
  v18 = 0;
  v19 = 0;
LABEL_60:
  __brc_leave_section(v56);

  _BRRestorePersona();
  return v17;
}

void __46__BRCVersionsFileProvider__physicalURLForURL___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)_physicalURLForURL____personalPersona;
  _physicalURLForURL____personalPersona = v0;
}

void __46__BRCVersionsFileProvider__physicalURLForURL___block_invoke_38(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  id v2 = [[BRCItemToPathLookup alloc] initWithItem:v9];
  v3 = [(BRCItemToPathLookup *)v2 byFileSystemID];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F63BE8] manager];
    objc_super v5 = [v3 physicalURL];
    uint64_t v6 = [v4 permanentStorageForItemAtURL:v5 allocateIfNone:0 error:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  [(BRCItemToPathLookup *)v2 closePaths];
}

- (void)_provideItemAtURL:(id)a3 toReaderWithID:(id)a4 completionHandler:(id)a5
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v93 = a3;
  id v90 = a4;
  uint64_t v8 = (void (**)(id, void *))a5;
  if ([(NSString *)self->_personaIdentifier isEqualToString:@"__defaultPersonaID__"]
    || (id v9 = self->_personaIdentifier) == 0)
  {
    if (_provideItemAtURL_toReaderWithID_completionHandler____personaOnceToken != -1) {
      dispatch_once(&_provideItemAtURL_toReaderWithID_completionHandler____personaOnceToken, &__block_literal_global_42);
    }
    objc_super v10 = (NSString *)(id)_provideItemAtURL_toReaderWithID_completionHandler____personalPersona;
    int v11 = 1;
  }
  else
  {
    objc_super v10 = v9;
    int v11 = 0;
  }
  v12 = [MEMORY[0x1E4FB36F8] sharedManager];
  v94 = [v12 currentPersona];

  id v110 = 0;
  v13 = [v94 userPersonaUniqueString];
  v14 = v13;
  if (v13 == v10 || [(NSString *)v13 isEqualToString:v10]) {
    goto LABEL_9;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v109 = 0;
    v37 = (void *)[v94 copyCurrentPersonaContextWithError:&v109];
    id v38 = v109;
    id v39 = v110;
    id v110 = v37;

    if (v38)
    {
      v40 = brc_bread_crumbs();
      uint64_t v41 = brc_default_log();
      if (os_log_type_enabled(v41, (os_log_type_t)0x90u)) {
        -[_BRCOperation completedWithResult:error:]();
      }
    }
    v91 = [v94 generateAndRestorePersonaContextWithPersonaUniqueString:v10];

    if (!v91)
    {
LABEL_9:
      v91 = 0;
      goto LABEL_10;
    }
    brc_bread_crumbs();
    v42 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    uint64_t v43 = brc_default_log();
    if (os_log_type_enabled(v43, (os_log_type_t)0x90u))
    {
      personaIdentifier = self->_personaIdentifier;
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = personaIdentifier;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v91;
      *(_WORD *)&buf[22] = 2112;
      v121 = v42;
      _os_log_error_impl(&dword_1D353B000, v43, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
    }
    goto LABEL_51;
  }
  if (v11 && ([v94 isDataSeparatedPersona] & 1) == 0)
  {
    brc_bread_crumbs();
    v42 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    uint64_t v43 = brc_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      __br_notify_register_dispatch_block_invoke_cold_4();
    }
    v91 = 0;
LABEL_51:

    goto LABEL_10;
  }
  v47 = brc_bread_crumbs();
  v48 = brc_default_log();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
    __br_notify_register_dispatch_block_invoke_cold_3();
  }

  v91 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
LABEL_10:
  id v108 = 0;
  v15 = [v93 pathComponents];
  id v106 = 0;
  id v107 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v121 = __Block_byref_object_copy__32;
  v122 = __Block_byref_object_dispose__32;
  id v123 = 0;
  memset(v105, 0, sizeof(v105));
  __brc_create_section(0, (uint64_t)"-[BRCVersionsFileProvider _provideItemAtURL:toReaderWithID:completionHandler:]", 175, v105);
  v16 = brc_bread_crumbs();
  id v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v49 = v105[0];
    id v50 = [v93 path];
    v51 = +[BRCFileProvider prettyNameForFilePresenterID:v90];
    *(_DWORD *)v113 = 134218754;
    *(void *)&v113[4] = v49;
    __int16 v114 = 2112;
    v115 = v50;
    __int16 v116 = 2112;
    v117 = v51;
    __int16 v118 = 2112;
    v119 = v16;
    _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx coordinated read request for '%@' (%@)%@", v113, 0x2Au);
  }
  if ((unint64_t)[v15 count] > 1)
  {
    uint64_t v20 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 2);
    v92 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 1);
    uint64_t v21 = *MEMORY[0x1E4F63BB8];
    if ([v20 isEqualToString:*MEMORY[0x1E4F63BB8]])
    {
      if (objc_msgSend(MEMORY[0x1E4F63BD8], "brc_parseAdditionFilename:mangledID:itemID:etag:session:", v92, &v107, &v106, &v108, self->super._session))
      {
        v88 = self->super._session;
        if (!v88)
        {
          v52 = brc_bread_crumbs();
          id v53 = brc_default_log();
          if (os_log_type_enabled(v53, (os_log_type_t)0x90u))
          {
            id v73 = +[BRCFileProvider prettyNameForFilePresenterID:v90];
            v74 = [v93 path];
            *(_DWORD *)v113 = 138412802;
            *(void *)&v113[4] = v73;
            __int16 v114 = 2112;
            v115 = v74;
            __int16 v116 = 2112;
            v117 = v52;
            _os_log_error_impl(&dword_1D353B000, v53, (os_log_type_t)0x90u, "[ERROR] Logged out: can't grant coordination to reader %@\nat path '%@'%@", v113, 0x20u);
          }
          v27 = +[BRCAccountsManager sharedManager];
          v89 = [(BRCDownloadVersionsBatchOperation *)v27 accountHandlerForCurrentPersona];
          id v30 = [v89 loggedOutError];
          if (!v30)
          {
            id v54 = (void *)MEMORY[0x1E4F28C58];
            v55 = [v89 loggedOutError];
            id v30 = objc_msgSend(v54, "brc_errorLoggedOutWithUnderlyingError:", v55);
          }
          v8[2](v8, v30);
          goto LABEL_73;
        }
        v22 = NSString;
        v23 = [MEMORY[0x1E4F29128] UUID];
        v24 = [v23 UUIDString];
        v89 = [v22 stringWithFormat:@"dl-version-%@", v24];

        v25 = self;
        objc_sync_enter(v25);
        uint64_t v26 = [(NSMutableDictionary *)v25->_operationsByName objectForKeyedSubscript:v92];
        objc_sync_exit(v25);
        p_isa = (id *)&v25->super.super.isa;

        v27 = (BRCDownloadVersionsBatchOperation *)v26;
        if (v26)
        {
          v28 = brc_bread_crumbs();
          id v29 = brc_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[BRCVersionsFileProvider _provideItemAtURL:toReaderWithID:completionHandler:].cold.5();
          }

          id v30 = 0;
          v31 = 0;
LABEL_23:
          [(BRCDownloadVersionsBatchOperation *)v27 addReaderID:v90 completionHandler:v8];
          v32 = [(BRCAccountSession *)self->super._session stageRegistry];
          [v32 associateDownloadStageID:v89 withOperation:v27];

          if (v30)
          {
            uint64_t v33 = *MEMORY[0x1E4F28858];
            uint64_t v34 = *MEMORY[0x1E4F28890];
            v111[0] = *MEMORY[0x1E4F28868];
            v111[1] = v34;
            v112[0] = v33;
            v112[1] = v93;
            v111[2] = *MEMORY[0x1E4F288A8];
            v112[2] = v31;
            v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:3];
            v35 = [[BRCProgress alloc] initWithParent:0 userInfo:v86];
            -[BRCProgress setTotalUnitCount:](v35, "setTotalUnitCount:", [v30 unsignedLongLongValue]);
            [(BRCProgress *)v35 setKind:*MEMORY[0x1E4F28898]];
            [(BRCProgress *)v35 setCancellable:0];
            [*(id *)(*(void *)&buf[8] + 40) setProgress:v35];
            [(BRCDownloadVersionsBatchOperation *)v27 addDownload:*(void *)(*(void *)&buf[8] + 40)];
            v95[0] = MEMORY[0x1E4F143A8];
            v95[1] = 3221225472;
            v95[2] = __78__BRCVersionsFileProvider__provideItemAtURL_toReaderWithID_completionHandler___block_invoke_62;
            v95[3] = &unk_1E6998650;
            v95[4] = p_isa;
            id v96 = v92;
            id v97 = v93;
            id v36 = v31;
            id v98 = v36;
            [(BRCDownloadVersionsBatchOperation *)v27 setPerDownloadCompletionBlock:v95];
            [(_BRCOperation *)v27 schedule];

LABEL_71:
            v31 = v36;
          }
LABEL_72:

LABEL_73:
          goto LABEL_74;
        }
        v86 = [(BRCAccountSession *)v88 clientZoneByMangledID:v107];
        if ([v107 isShared])
        {
          v56 = [v86 serverZone];
          id v57 = [v56 asSharedZone];
          v84 = [v57 transferSyncContext];
        }
        else
        {
          v56 = [(BRCAccountSession *)v88 appLibraryByMangledID:v107];
          v84 = [v56 transferSyncContext];
        }

        if (!v84)
        {
          v71 = brc_bread_crumbs();
          v72 = brc_default_log();
          if (os_log_type_enabled(v72, (os_log_type_t)0x90u))
          {
            id v77 = v107;
            v78 = [v93 path];
            *(_DWORD *)v113 = 138412802;
            *(void *)&v113[4] = v77;
            __int16 v114 = 2112;
            v115 = v78;
            __int16 v116 = 2112;
            v117 = v71;
            _os_log_error_impl(&dword_1D353B000, v72, (os_log_type_t)0x90u, "[ERROR] can't find sync context for mangled ID '%@', path '%@'%@", v113, 0x20u);
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"container", v93);
          v35 = (BRCProgress *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, v35);
          v27 = 0;
          id v30 = 0;
          id v36 = 0;
          goto LABEL_71;
        }
        id v58 = [(BRCAccountSession *)v88 clientDB];
        id v59 = [v58 serialQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __78__BRCVersionsFileProvider__provideItemAtURL_toReaderWithID_completionHandler___block_invoke_53;
        block[3] = &unk_1E6998628;
        id v83 = v86;
        id v100 = v83;
        id v101 = v106;
        v104 = buf;
        id v102 = v89;
        id v103 = v108;
        dispatch_sync(v59, block);

        id v60 = *(void **)(*(void *)&buf[8] + 40);
        if (!v60
          || ([v60 storage],
              id v61 = objc_claimAutoreleasedReturnValue(),
              BOOL v62 = v61 == 0,
              v61,
              v62))
        {
          v68 = brc_bread_crumbs();
          v69 = brc_default_log();
          if (os_log_type_enabled(v69, (os_log_type_t)0x90u))
          {
            [v93 path];
            objc_claimAutoreleasedReturnValue();
            -[BRCVersionsFileProvider _physicalURLForURL:].cold.4();
          }

          objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"item", v93);
          v70 = (id *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, v70);
          v27 = 0;
          id v30 = 0;
          uint64_t v87 = 0;
          int v67 = 1;
          goto LABEL_65;
        }
        v63 = [*(id *)(*(void *)&buf[8] + 40) storage];
        v64 = [v63 additionWithName:v92 inNameSpace:v21 error:0];

        if (v64)
        {
          id v65 = brc_bread_crumbs();
          uint64_t v66 = brc_default_log();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
            -[BRCVersionsFileProvider _physicalURLForURL:].cold.5();
          }

          v8[2](v8, 0);
          v27 = 0;
          id v30 = 0;
          uint64_t v87 = 0;
          int v67 = 1;
LABEL_66:

          v31 = (void *)v87;
          if (v67) {
            goto LABEL_72;
          }
          goto LABEL_23;
        }
        v70 = p_isa;
        objc_sync_enter(v70);
        v27 = [p_isa[7] objectForKeyedSubscript:v92];
        if (v27)
        {
          id v30 = 0;
          uint64_t v87 = 0;
        }
        else
        {
          *(void *)v113 = 0;
          v75 = [(BRCAccountSession *)v88 stageRegistry];
          uint64_t v87 = [v75 nonLocalFaultURLForAdditionName:v92];

          cf = (void *)_CFURLCopyPropertiesOfPromiseAtURL();
          if (!cf)
          {
            v79 = *(void **)v113;
            v8[2](v8, *(void **)v113);

            v27 = 0;
            id v30 = 0;
            int v67 = 1;
            goto LABEL_81;
          }
          v27 = [[BRCDownloadVersionsBatchOperation alloc] initWithSyncContext:v84 forNonLocalVersion:1];
          v76 = objc_msgSend(MEMORY[0x1E4F1A218], "br_fetchNonLocalVersions");
          [(_BRCOperation *)v27 setGroup:v76];

          [p_isa[7] setObject:v27 forKeyedSubscript:v92];
          id v30 = [cf objectForKey:*MEMORY[0x1E4F1C5F8]];
          if (!v30)
          {
            v81 = brc_bread_crumbs();
            v80 = brc_default_log();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT)) {
              -[BRCGlobalProgress _cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:]();
            }
          }
          CFRelease(cf);
        }
        int v67 = 0;
LABEL_81:
        objc_sync_exit(v70);
LABEL_65:

        goto LABEL_66;
      }
      v45 = brc_bread_crumbs();
      v46 = brc_default_log();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        [v93 path];
        objc_claimAutoreleasedReturnValue();
        -[BRCVersionsFileProvider _physicalURLForURL:].cold.6();
      }
    }
    else
    {
      v45 = brc_bread_crumbs();
      v46 = brc_default_log();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
        -[BRCVersionsFileProvider _physicalURLForURL:].cold.7();
      }
    }

    v8[2](v8, 0);
    goto LABEL_74;
  }
  v18 = brc_bread_crumbs();
  v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
    -[BRCVersionsFileProvider _physicalURLForURL:]();
  }

  v8[2](v8, 0);
  v92 = 0;
  uint64_t v20 = 0;
LABEL_74:
  __brc_leave_section(v105);

  _Block_object_dispose(buf, 8);
  _BRRestorePersona();
}

void __78__BRCVersionsFileProvider__provideItemAtURL_toReaderWithID_completionHandler___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)_provideItemAtURL_toReaderWithID_completionHandler____personalPersona;
  _provideItemAtURL_toReaderWithID_completionHandler____personalPersona = v0;
}

void __78__BRCVersionsFileProvider__provideItemAtURL_toReaderWithID_completionHandler___block_invoke_53(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  if ([v7 isDocument])
  {
    id v2 = [BRCDownloadVersion alloc];
    v3 = [v7 asDocument];
    uint64_t v4 = [(BRCDownloadVersion *)v2 initWithDocument:v3 stageID:*(void *)(a1 + 48) etag:*(void *)(a1 + 56) isLoser:0];
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void __78__BRCVersionsFileProvider__provideItemAtURL_toReaderWithID_completionHandler___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:*(void *)(a1 + 40)];
  objc_sync_exit(v7);

  if (v6)
  {
    uint64_t v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      int v11 = [*(id *)(a1 + 48) path];
      int v12 = 138412802;
      v13 = v11;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_error_impl(&dword_1D353B000, v9, (os_log_type_t)0x90u, "[ERROR] failed downloading version to path '%@': %@%@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    objc_super v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v10 removeItemAtURL:*(void *)(a1 + 56) error:0];
  }
}

- (void)_cancelProvidingItemAtURL:(id)a3 toReaderWithID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  operationsByName = v7->_operationsByName;
  id v9 = [v11 lastPathComponent];
  objc_super v10 = [(NSMutableDictionary *)operationsByName objectForKeyedSubscript:v9];

  objc_sync_exit(v7);
  [v10 cancelReaderID:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_operationsByName, 0);
}

- (void)_physicalURLForURL:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: What's this path???%@", v2, v3, v4, v5, v6);
}

- (void)_physicalURLForURL:.cold.2()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_12(&dword_1D353B000, "[ERROR] Logged out: can't compute physical URL for '%@'%@", v4, v5);
}

- (void)_physicalURLForURL:.cold.3()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_12(&dword_1D353B000, "[ERROR] can't find container for path '%@'%@", v4, v5);
}

- (void)_physicalURLForURL:.cold.4()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_12(&dword_1D353B000, "[ERROR] can't find live item for path '%@'%@", v4, v5);
}

- (void)_physicalURLForURL:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Version already local, we're good!%@", v2, v3, v4, v5, v6);
}

- (void)_physicalURLForURL:.cold.6()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7(v1, v2, v3, 5.778e-34);
  _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] can't parse version path '%@', probably not an iCloud version, allow it%@", v4, 0x16u);
}

- (void)_physicalURLForURL:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Not in the %@ namespace, not for us%@");
}

- (void)_provideItemAtURL:toReaderWithID:completionHandler:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Found a download operation already pending, piggy back on it%@", v2, v3, v4, v5, v6);
}

@end