@interface BRCDaemonContainerHelper
+ (id)sharedHelper;
- (BOOL)canFetchAllContainersByID;
- (BOOL)cloudSyncTCCDisabledForContainerMeta:(id)a3;
- (id)_init;
- (id)fetchAllContainersByIDWithError:(id *)a3;
- (id)fetchContainerForMangledID:(id)a3 personaID:(id)a4;
- (id)itemIDForURL:(id)a3 error:(id *)a4;
- (unsigned)br_capabilityToMoveFromLocalItem:(id)a3 toNewParent:(id)a4 session:(id)a5 error:(id *)a6;
- (unsigned)br_capabilityToMoveFromLookup:(id)a3 toNewParent:(id)a4 session:(id)a5 error:(id *)a6;
- (unsigned)br_capabilityToMoveFromURL:(id)a3 toNewParent:(id)a4 error:(id *)a5;
- (void)_computeTCCEnabledDisabledBundleIdentifiers;
- (void)dealloc;
@end

@implementation BRCDaemonContainerHelper

+ (id)sharedHelper
{
  if (sharedHelper_onceToken != -1) {
    dispatch_once(&sharedHelper_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedHelper_instance;
  return v2;
}

void __40__BRCDaemonContainerHelper_sharedHelper__block_invoke()
{
  id v0 = [[BRCDaemonContainerHelper alloc] _init];
  v1 = (void *)sharedHelper_instance;
  sharedHelper_instance = (uint64_t)v0;
}

- (id)_init
{
  v21.receiver = self;
  v21.super_class = (Class)BRCDaemonContainerHelper;
  v2 = [(BRCDaemonContainerHelper *)&v21 init];
  v3 = v2;
  if (v2)
  {
    [(BRCDaemonContainerHelper *)v2 _computeTCCEnabledDisabledBundleIdentifiers];
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.CloudDocs.BRCDaemonContainerHelper.TCCchanges", v5);

    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = v3->_queue;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __33__BRCDaemonContainerHelper__init__block_invoke;
    v19 = &unk_1E6993FE8;
    v20 = v3;
    v9 = &v16;
    v10 = (void *)MEMORY[0x1E4FB36F8];
    v11 = v8;
    v12 = objc_msgSend(v10, "sharedManager", v16, v17, v18, v19);
    v13 = objc_msgSend(v12, "br_currentPersonaID");

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __br_notify_register_dispatch_block_invoke;
    handler[3] = &unk_1E6994038;
    v24 = v9;
    v25 = "com.apple.tcc.access.changed";
    id v23 = v13;
    id v14 = v13;
    notify_register_dispatch("com.apple.tcc.access.changed", &v3->_TCCAccessChangedNotificationToken, v11, handler);
  }
  return v3;
}

_DWORD *__33__BRCDaemonContainerHelper__init__block_invoke(uint64_t a1, int a2)
{
  result = *(_DWORD **)(a1 + 32);
  if (result[6] == a2) {
    return (_DWORD *)[result _computeTCCEnabledDisabledBundleIdentifiers];
  }
  return result;
}

- (void)_computeTCCEnabledDisabledBundleIdentifiers
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] About to compute the enabled and disabled bundle IDs via TCC%@", v2, v3, v4, v5, v6);
}

- (BOOL)canFetchAllContainersByID
{
  return 1;
}

- (id)fetchAllContainersByIDWithError:(id *)a3
{
  uint64_t v4 = +[BRCAccountsManager sharedManager];
  uint64_t v5 = [v4 accountHandlerForCurrentPersona];
  uint8_t v6 = [v5 session];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__BRCDaemonContainerHelper_fetchAllContainersByIDWithError___block_invoke;
  v12[3] = &unk_1E6994010;
  v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  [v6 enumerateAppLibraries:v12];
  v9 = v13;
  id v10 = v8;

  return v10;
}

uint64_t __60__BRCDaemonContainerHelper_fetchAllContainersByIDWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 containerMetadata];
  if (v4)
  {
    objc_msgSend(v4, "setIsCloudSyncTCCDisabled:", objc_msgSend(*(id *)(a1 + 32), "cloudSyncTCCDisabledForContainerMeta:", v4));
    uint64_t v5 = *(void **)(a1 + 40);
    uint8_t v6 = [v3 appLibraryID];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
  else
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __60__BRCDaemonContainerHelper_fetchAllContainersByIDWithError___block_invoke_cold_1();
    }
  }
  return 1;
}

- (id)fetchContainerForMangledID:(id)a3 personaID:(id)a4
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[BRCAccountsManager sharedManager];
    uint8_t v6 = [v5 accountHandlerForCurrentPersona];
    id v7 = [v6 session];

    if (v7)
    {
      id v8 = [v7 appLibraryByMangledID:v4];
      v9 = [v8 containerMetadataFilledWithTCCInfo];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)cloudSyncTCCDisabledForContainerMeta:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F59418]];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 bundleIdentifiers];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      v9 = self;
      objc_sync_enter(v9);
      id v10 = (void *)[(NSSet *)v9->_knownBundleIDs copy];
      v11 = (void *)[(NSSet *)v9->_disabledBundleIDs copy];
      objc_sync_exit(v9);

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v12 = objc_msgSend(v4, "bundleIdentifiers", 0);
      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        char v14 = 0;
        uint64_t v15 = *(void *)v20;
        while (2)
        {
          for (i = 0; i != v13; i = ((char *)i + 1))
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            if ([v10 containsObject:v17])
            {
              if (([v11 containsObject:v17] & 1) == 0)
              {
                LOBYTE(v13) = 0;
                goto LABEL_19;
              }
              char v14 = 1;
            }
          }
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v13) {
            continue;
          }
          break;
        }

        if ((v14 & 1) == 0)
        {
          LOBYTE(v13) = 0;
          goto LABEL_20;
        }
        v12 = brc_bread_crumbs();
        id v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          [(BRCDaemonContainerHelper *)v4 cloudSyncTCCDisabledForContainerMeta:v13];
        }

        LOBYTE(v13) = 1;
      }
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
  }
  LOBYTE(v13) = 0;
LABEL_21:

  return (char)v13;
}

- (unsigned)br_capabilityToMoveFromLocalItem:(id)a3 toNewParent:(id)a4 session:(id)a5 error:(id *)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 isDirectory])
  {
    id v10 = [v8 clientZone];
    v11 = [v9 clientZone];
    if ([v8 isSharedToMeChildItem]
      && ([v8 sharingOptions] & 0x20) != 0
      && [v8 isKnownByServer])
    {
      brc_bread_crumbs();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v62 = 138412546;
        v63 = (const char *)v8;
        __int16 v64 = 2112;
        v65 = v12;
        char v14 = "[WARNING] Can't edit a readonly share for %@%@";
LABEL_35:
        _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v62, 0x16u);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
    if ([v9 isSharedToMe] && (objc_msgSend(v9, "sharingOptions") & 0x20) != 0)
    {
      brc_bread_crumbs();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v62 = 138412546;
        v63 = (const char *)v9;
        __int16 v64 = 2112;
        v65 = v12;
        char v14 = "[WARNING] Can't add a file to a readonly share with parent %@%@";
        goto LABEL_35;
      }
LABEL_36:
      unsigned __int16 v17 = 512;
      goto LABEL_37;
    }
    if ([v8 isSharedToMeTopLevelItem] && objc_msgSend(v9, "isInTrashScope"))
    {
      brc_bread_crumbs();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v62 = 138412546;
        v63 = (const char *)v8;
        __int16 v64 = 2112;
        v65 = v12;
        _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Error trying to move shared top item %@ into trash%@", (uint8_t *)&v62, 0x16u);
      }
      unsigned __int16 v17 = 8;
      goto LABEL_37;
    }
    if ([v8 isSharedToMeTopLevelItem]
      && (([v9 isSharedByMe] & 1) != 0 || objc_msgSend(v9, "isSharedToMe")))
    {
      brc_bread_crumbs();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      id v13 = brc_default_log();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:
        unsigned __int16 v17 = 2;
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      int v62 = 138412546;
      v63 = (const char *)v8;
      __int16 v64 = 2112;
      v65 = v12;
      v18 = "[WARNING] Error trying to move shared top item %@ into a shared item%@";
      long long v19 = v13;
      uint32_t v20 = 22;
LABEL_25:
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v62, v20);
      goto LABEL_26;
    }
    if ([v10 isEqualToClientZone:v11])
    {
      if ([v8 hasShareIDAndIsOwnedByMe])
      {
        if (([v9 isOwnedByMe] & 1) == 0)
        {
          v56 = brc_bread_crumbs();
          v57 = brc_default_log();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
            -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:]();
          }
        }
        if ([v9 isSharedByMe])
        {
          brc_bread_crumbs();
          v12 = (char *)objc_claimAutoreleasedReturnValue();
          id v13 = brc_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v62 = 138412802;
            v63 = (const char *)v8;
            __int16 v64 = 2112;
            v65 = (const char *)v9;
            __int16 v66 = 2112;
            v67 = v12;
            long long v21 = "[WARNING] Error trying to move shared top item %@ into another shared item %@%@";
LABEL_110:
            _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v62, 0x20u);
            goto LABEL_111;
          }
          goto LABEL_111;
        }
        goto LABEL_85;
      }
      if ([v8 isOwnedByMe])
      {
        if (![v8 isSharedByMe])
        {
          if ([v9 isSharedByMe])
          {
            brc_bread_crumbs();
            v12 = (char *)objc_claimAutoreleasedReturnValue();
            id v13 = brc_default_log();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              int v62 = 138412802;
              v63 = (const char *)v8;
              __int16 v64 = 2112;
              v65 = (const char *)v9;
              __int16 v66 = 2112;
              v67 = v12;
              long long v21 = "[WARNING] Moving item %@ into a share with parent %@%@";
              goto LABEL_110;
            }
LABEL_111:
            unsigned __int16 v17 = 128;
            goto LABEL_37;
          }
LABEL_85:
          if ([v8 isDirectory]
            && ([v8 isSharedByMe] & 1) == 0
            && ([v8 isSharedToMe] & 1) == 0)
          {
            if (([v9 isSharedToMe] & 1) != 0 || objc_msgSend(v9, "isSharedByMe"))
            {
              v45 = [v8 asDirectory];
              int v46 = [v45 possiblyContainsSharedItem];

              if (v46)
              {
                brc_bread_crumbs();
                v12 = (char *)objc_claimAutoreleasedReturnValue();
                id v13 = brc_default_log();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                {
                  int v62 = 138412802;
                  v63 = (const char *)v8;
                  __int16 v64 = 2112;
                  v65 = (const char *)v9;
                  __int16 v66 = 2112;
                  v67 = v12;
                  _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving item with a shared child %@ into a share with parent %@%@", (uint8_t *)&v62, 0x20u);
                }
                unsigned __int16 v17 = 1024;
                goto LABEL_37;
              }
            }
            if ([v9 isInTrashScope])
            {
              v54 = [v8 asDirectory];
              int v55 = [v54 possiblyContainsSharedItem];

              if (v55)
              {
                brc_bread_crumbs();
                v12 = (char *)objc_claimAutoreleasedReturnValue();
                id v13 = brc_default_log();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                {
                  int v62 = 138412802;
                  v63 = (const char *)v8;
                  __int16 v64 = 2112;
                  v65 = (const char *)v9;
                  __int16 v66 = 2112;
                  v67 = v12;
                  _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving an item with a shared child %@ into trash at parent %@%@", (uint8_t *)&v62, 0x20u);
                }
                unsigned __int16 v17 = 2048;
                goto LABEL_37;
              }
            }
          }
          unsigned __int16 v17 = 64;
          goto LABEL_38;
        }
        if (([v9 isOwnedByMe] & 1) == 0)
        {
          v60 = brc_bread_crumbs();
          v61 = brc_default_log();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
            -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:]();
          }
        }
        if (([v9 isSharedByMe] & 1) == 0)
        {
          brc_bread_crumbs();
          v12 = (char *)objc_claimAutoreleasedReturnValue();
          id v13 = brc_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v62 = 138412802;
            v63 = (const char *)v8;
            __int16 v64 = 2112;
            v65 = (const char *)v9;
            __int16 v66 = 2112;
            v67 = v12;
            long long v21 = "[WARNING] Moving item %@ out of the share to new parent %@%@";
            goto LABEL_110;
          }
          goto LABEL_111;
        }
        objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v8);
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        id v13 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v9);
        if (!v13
          || ([v12 recordName],
              id v23 = objc_claimAutoreleasedReturnValue(),
              [v13 recordName],
              uint64_t v24 = objc_claimAutoreleasedReturnValue(),
              char v25 = [v23 isEqualToString:v24],
              v24,
              v23,
              (v25 & 1) == 0))
        {
          brc_bread_crumbs();
          v26 = (char *)objc_claimAutoreleasedReturnValue();
          v27 = brc_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            int v62 = 138412802;
            v63 = (const char *)v8;
            __int16 v64 = 2112;
            v65 = (const char *)v9;
            __int16 v66 = 2112;
            v67 = v26;
            _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving item %@ into a different share with parent %@%@", (uint8_t *)&v62, 0x20u);
          }

          goto LABEL_111;
        }
      }
      else
      {
        if ([v9 isOwnedByMe])
        {
          v58 = brc_bread_crumbs();
          v59 = brc_default_log();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
            -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.4();
          }
        }
        objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v8);
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        id v13 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v9);
        if (!v13
          || ([v12 recordName],
              v35 = objc_claimAutoreleasedReturnValue(),
              [v13 recordName],
              v36 = objc_claimAutoreleasedReturnValue(),
              char v37 = [v35 isEqualToString:v36],
              v36,
              v35,
              (v37 & 1) == 0))
        {
          if (![v8 isDocument]) {
            goto LABEL_78;
          }
          v39 = [v8 appLibrary];
          v40 = [v39 mangledID];
          v41 = +[BRCUserDefaults defaultsForMangledID:v40];
          int v42 = [v41 supportsServerSideAssetCopies];

          if (v42)
          {
            brc_bread_crumbs();
            v43 = (char *)objc_claimAutoreleasedReturnValue();
            v44 = brc_default_log();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
              -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:]();
            }
            unsigned __int16 v17 = 64;
          }
          else
          {
LABEL_78:
            brc_bread_crumbs();
            v43 = (char *)objc_claimAutoreleasedReturnValue();
            v44 = brc_default_log();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              int v62 = 138412802;
              v63 = (const char *)v8;
              __int16 v64 = 2112;
              v65 = (const char *)v9;
              __int16 v66 = 2112;
              v67 = v43;
              _os_log_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving item %@ into another shared item %@%@", (uint8_t *)&v62, 0x20u);
            }
            unsigned __int16 v17 = 128;
          }

          goto LABEL_37;
        }
      }

      goto LABEL_85;
    }
    if ([v8 isSharedToMeTopLevelItem])
    {
      if ([v11 isSharedZone])
      {
        brc_bread_crumbs();
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        id v13 = brc_default_log();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        int v62 = 138412802;
        v63 = (const char *)v8;
        __int16 v64 = 2112;
        v65 = (const char *)v9;
        __int16 v66 = 2112;
        v67 = v12;
        v18 = "[WARNING] Error trying to move shared top item %@ into another shared item %@%@";
        long long v19 = v13;
        uint32_t v20 = 32;
        goto LABEL_25;
      }
      v32 = [v8 appLibrary];
      v33 = [v32 defaultClientZone];
      int v34 = [v33 isEqualToClientZone:v11];

      if (v34)
      {
        brc_bread_crumbs();
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        id v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.5();
        }
LABEL_65:
        unsigned __int16 v17 = 64;
        goto LABEL_37;
      }
      brc_bread_crumbs();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v62 = 138412546;
        v63 = (const char *)v8;
        __int16 v64 = 2112;
        v65 = v12;
        v47 = "[WARNING] Top level shared item %@ moved across zone boundaries.  Allowing it%@";
        v48 = v13;
        uint32_t v49 = 22;
        goto LABEL_100;
      }
    }
    else
    {
      if (([v10 isSharedZone] & 1) != 0 || objc_msgSend(v11, "isSharedZone"))
      {
        if (![v8 isDocument]) {
          goto LABEL_59;
        }
        v28 = [v8 appLibrary];
        v29 = [v28 mangledID];
        v30 = +[BRCUserDefaults defaultsForMangledID:v29];
        int v31 = [v30 supportsServerSideAssetCopies];

        if (!v31)
        {
LABEL_59:
          brc_bread_crumbs();
          v12 = (char *)objc_claimAutoreleasedReturnValue();
          id v13 = brc_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v62 = 138412802;
            v63 = (const char *)v8;
            __int16 v64 = 2112;
            v65 = (const char *)v9;
            __int16 v66 = 2112;
            v67 = v12;
            _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] We need to download item %@ which is moving in or out of a shared zone to parent %@%@", (uint8_t *)&v62, 0x20u);
          }
          unsigned __int16 v17 = 16;
          goto LABEL_37;
        }
        brc_bread_crumbs();
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        id v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.6();
        }
        goto LABEL_65;
      }
      if (![v8 hasShareIDAndIsOwnedByMe]
        || ([v8 sharingOptions] & 0x48) == 0)
      {
        if (![v8 isDocument]) {
          goto LABEL_106;
        }
        v50 = [v8 appLibrary];
        v51 = [v50 mangledID];
        v52 = +[BRCUserDefaults defaultsForMangledID:v51];
        int v53 = [v52 supportsServerSideAssetCopies];

        if (!v53)
        {
LABEL_106:
          brc_bread_crumbs();
          v12 = (char *)objc_claimAutoreleasedReturnValue();
          id v13 = brc_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v62 = 138412802;
            v63 = (const char *)v8;
            __int16 v64 = 2112;
            v65 = (const char *)v9;
            __int16 v66 = 2112;
            v67 = v12;
            unsigned __int16 v17 = 32;
            _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] We need to download item %@ which is crossing zone boundaries to %@%@", (uint8_t *)&v62, 0x20u);
          }
          else
          {
            unsigned __int16 v17 = 32;
          }
          goto LABEL_37;
        }
        brc_bread_crumbs();
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        id v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.7();
        }
        goto LABEL_65;
      }
      brc_bread_crumbs();
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v62 = 138412290;
        v63 = v12;
        v47 = "[WARNING] Warning for move of shared item across zones%@";
        v48 = v13;
        uint32_t v49 = 12;
LABEL_100:
        _os_log_impl(&dword_1D353B000, v48, OS_LOG_TYPE_DEFAULT, v47, (uint8_t *)&v62, v49);
      }
    }
    unsigned __int16 v17 = 256;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 20);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    uint64_t v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v38 = "(passed to caller)";
      int v62 = 136315906;
      v63 = "-[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:]";
      __int16 v64 = 2080;
      if (!a6) {
        v38 = "(ignored by caller)";
      }
      v65 = v38;
      __int16 v66 = 2112;
      v67 = (char *)v10;
      __int16 v68 = 2112;
      v69 = v15;
      _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v62, 0x2Au);
    }
  }
  if (a6)
  {
    id v10 = v10;
    *a6 = v10;
  }
  unsigned __int16 v17 = 4;
LABEL_39:

  return v17;
}

- (unsigned)br_capabilityToMoveFromLookup:(id)a3 toNewParent:(id)a4 session:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      uint64_t v15 = brc_bread_crumbs();
      uint64_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v35 = "(passed to caller)";
        int v38 = 136315906;
        v39 = "-[BRCDaemonContainerHelper br_capabilityToMoveFromLookup:toNewParent:session:error:]";
        __int16 v40 = 2080;
        if (!a6) {
          v35 = "(ignored by caller)";
        }
        v41 = v35;
        __int16 v42 = 2112;
        id v43 = v13;
        __int16 v44 = 2112;
        v45 = v15;
        _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v38, 0x2Au);
      }
    }
    if (a6)
    {
      id v13 = v13;
      *a6 = v13;
    }
    goto LABEL_23;
  }
  id v13 = [v10 byIDLocalItem];
  if (!v13)
  {
    id v13 = [v10 faultedLocalItem];
    if (!v13)
    {
      id v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = [v10 url];
      char v25 = [v24 path];
      v26 = objc_msgSend(v23, "brc_errorItemNotFound:", v25);

      if (v26)
      {
        v27 = brc_bread_crumbs();
        v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v36 = "(passed to caller)";
          int v38 = 136315906;
          v39 = "-[BRCDaemonContainerHelper br_capabilityToMoveFromLookup:toNewParent:session:error:]";
          __int16 v40 = 2080;
          if (!a6) {
            v36 = "(ignored by caller)";
          }
          v41 = v36;
          __int16 v42 = 2112;
          id v43 = v26;
          __int16 v44 = 2112;
          v45 = v27;
          _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v38, 0x2Au);
        }
      }
      if (a6) {
        *a6 = v26;
      }

      id v13 = 0;
LABEL_23:
      unsigned __int16 v20 = 1;
      goto LABEL_24;
    }
  }
  if (![v12 syncedFolderTypeForURL:v11])
  {
LABEL_16:
    unsigned __int16 v20 = 8;
    goto LABEL_24;
  }
  char v14 = [v11 path];
  if (objc_msgSend(v14, "br_isExcludedWithMaximumDepth:", 1024))
  {

    goto LABEL_16;
  }
  char v17 = objc_msgSend(v11, "br_isInSyncedLocation");

  if ((v17 & 1) == 0) {
    goto LABEL_16;
  }
  v18 = [BRCURLToItemLookup alloc];
  long long v19 = [v10 db];
  unsigned __int16 v20 = 1;
  long long v21 = [(BRCURLToItemLookup *)v18 initWithURL:v11 allowAppLibraryRoot:1 session:v12 db:v19];

  if ([(BRCURLToItemLookup *)v21 resolveAndKeepOpenWithError:a6])
  {
    long long v22 = [(BRCURLToItemLookup *)v21 byIDLocalItem];
    [(BRCURLToItemLookup *)v21 closePaths];
    if (v22)
    {
      unsigned __int16 v20 = [(BRCDaemonContainerHelper *)self br_capabilityToMoveFromLocalItem:v13 toNewParent:v22 session:v12 error:a6];
    }
    else
    {
      v30 = (void *)MEMORY[0x1E4F28C58];
      int v31 = [v11 path];
      v32 = objc_msgSend(v30, "brc_errorItemNotFound:", v31);

      if (v32)
      {
        v33 = brc_bread_crumbs();
        int v34 = brc_default_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          char v37 = "(passed to caller)";
          int v38 = 136315906;
          v39 = "-[BRCDaemonContainerHelper br_capabilityToMoveFromLookup:toNewParent:session:error:]";
          __int16 v40 = 2080;
          if (!a6) {
            char v37 = "(ignored by caller)";
          }
          v41 = v37;
          __int16 v42 = 2112;
          id v43 = v32;
          __int16 v44 = 2112;
          v45 = v33;
          _os_log_debug_impl(&dword_1D353B000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v38, 0x2Au);
        }
      }
      if (a6) {
        *a6 = v32;
      }

      unsigned __int16 v20 = 1;
    }
  }
LABEL_24:

  return v20;
}

- (unsigned)br_capabilityToMoveFromURL:(id)a3 toNewParent:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[BRCAccountsManager sharedManager];
  id v11 = [v10 accountHandlerForCurrentPersona];
  id v12 = [v11 session];

  id v13 = [[BRCURLToItemLookup alloc] initWithURL:v9 allowAppLibraryRoot:0 session:v12];
  if ([(BRCURLToItemLookup *)v13 resolveAndKeepOpenWithError:a5]) {
    unsigned __int16 v14 = [(BRCDaemonContainerHelper *)self br_capabilityToMoveFromLookup:v13 toNewParent:v8 session:v12 error:a5];
  }
  else {
    unsigned __int16 v14 = 1;
  }
  [(BRCURLToItemLookup *)v13 closePaths];

  return v14;
}

- (id)itemIDForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v6 = +[BRCAccountsManager sharedManager];
  id v7 = [v6 accountHandlerForCurrentPersona];
  id v8 = [v7 session];

  id v9 = [[BRCURLToItemLookup alloc] initWithURL:v5 allowAppLibraryRoot:0 session:v8];
  if ([(BRCURLToItemLookup *)v9 resolveAndKeepOpenWithError:a4])
  {
    id v10 = [(BRCURLToItemLookup *)v9 byIDLocalItem];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [(BRCURLToItemLookup *)v9 faultedLocalItem];
    }
    unsigned __int16 v14 = v12;

    uint64_t v15 = [v14 itemID];
    id v13 = [v15 itemIDString];

    [(BRCURLToItemLookup *)v9 closePaths];
  }
  else
  {
    [(BRCURLToItemLookup *)v9 closePaths];
    id v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  int TCCAccessChangedNotificationToken = self->_TCCAccessChangedNotificationToken;
  if (TCCAccessChangedNotificationToken != -1) {
    notify_cancel(TCCAccessChangedNotificationToken);
  }
  knownBundleIDs = self->_knownBundleIDs;
  self->_knownBundleIDs = 0;

  disabledBundleIDs = self->_disabledBundleIDs;
  self->_disabledBundleIDs = 0;

  v6.receiver = self;
  v6.super_class = (Class)BRCDaemonContainerHelper;
  [(BRCDaemonContainerHelper *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_knownBundleIDs, 0);
  objc_storeStrong((id *)&self->_disabledBundleIDs, 0);
}

void __60__BRCDaemonContainerHelper_fetchAllContainersByIDWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] no metadata for %@%@");
}

- (void)cloudSyncTCCDisabledForContainerMeta:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 identifier];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ is disabled by TCC%@", (uint8_t *)&v6, 0x16u);
}

- (void)br_capabilityToMoveFromLocalItem:toNewParent:session:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: parent.isOwnedByMe%@", v2, v3, v4, v5, v6);
}

- (void)br_capabilityToMoveFromLocalItem:toNewParent:session:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Allowing server-side asset copy for subitem moving %@%@");
}

- (void)br_capabilityToMoveFromLocalItem:toNewParent:session:error:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !parent.isOwnedByMe%@", v2, v3, v4, v5, v6);
}

- (void)br_capabilityToMoveFromLocalItem:toNewParent:session:error:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Allowing move of top level folder share item %@%@");
}

- (void)br_capabilityToMoveFromLocalItem:toNewParent:session:error:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Allowing server-side asset copy for shared folder transfer for %@%@");
}

- (void)br_capabilityToMoveFromLocalItem:toNewParent:session:error:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Allowing server-side asset copy for %@%@");
}

@end