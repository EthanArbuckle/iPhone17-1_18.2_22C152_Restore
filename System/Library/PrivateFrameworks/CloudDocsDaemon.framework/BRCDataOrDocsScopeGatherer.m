@interface BRCDataOrDocsScopeGatherer
- (BRCDataOrDocsScopeGatherer)initWithNotificationPipe:(id)a3 appLibraries:(id)a4 startingRank:(unint64_t)a5 maxRank:(unint64_t)a6 withDeadItems:(BOOL)a7 gatherReply:(id)a8;
- (BRCItemGlobalID)gatheredChildrenItemGlobalID;
- (id)_popGatherReply;
- (void)dealloc;
- (void)done;
- (void)gatherWithBatchSize:(int64_t)a3 completion:(id)a4;
- (void)invalidate;
- (void)setGatheredChildrenItemGlobalID:(id)a3;
@end

@implementation BRCDataOrDocsScopeGatherer

- (BRCDataOrDocsScopeGatherer)initWithNotificationPipe:(id)a3 appLibraries:(id)a4 startingRank:(unint64_t)a5 maxRank:(unint64_t)a6 withDeadItems:(BOOL)a7 gatherReply:(id)a8
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v14 = (id *)a3;
  id v15 = a4;
  id v16 = a8;
  v39.receiver = self;
  v39.super_class = (Class)BRCDataOrDocsScopeGatherer;
  v17 = [(BRCDataOrDocsScopeGatherer *)&v39 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_pipe, v14);
    v19 = [v14 queue];
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __115__BRCDataOrDocsScopeGatherer_initWithNotificationPipe_appLibraries_startingRank_maxRank_withDeadItems_gatherReply___block_invoke;
    v36 = &unk_1E69957B0;
    id v20 = v19;
    id v37 = v20;
    id v38 = v16;
    uint64_t v21 = MEMORY[0x1D94389C0](&v33);
    id gatherReply = v18->_gatherReply;
    v18->_id gatherReply = (id)v21;

    v23 = objc_msgSend(v14, "manager", v33, v34, v35, v36);
    uint64_t v24 = [v23 session];
    session = v18->_session;
    v18->_session = (BRCAccountSession *)v24;

    v18->_gatheringRankMin = a5;
    v18->_gatheringRankMax = a6;
    uint64_t v26 = [v15 mutableCopy];
    gatheringAppLibraries = v18->_gatheringAppLibraries;
    v18->_gatheringAppLibraries = (NSMutableArray *)v26;

    objc_storeStrong((id *)&v18->_gatheringNamePrefix, v14[20]);
    v18->_includesDeadItems = a7;
    v18->_invalidated = 0;
    v28 = brc_bread_crumbs();
    v29 = brc_notifications_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v41 = v14;
      __int16 v42 = 2048;
      unint64_t v43 = a5;
      __int16 v44 = 2048;
      unint64_t v45 = a6;
      __int16 v46 = 2112;
      v47 = v28;
      _os_log_debug_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEBUG, "[NOTIF] %@: gathering from %lld to %lld%@", buf, 0x2Au);
    }

    if (v18->_gatheringNamePrefix)
    {
      v30 = brc_bread_crumbs();
      v31 = brc_notifications_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[BRCDataOrDocsScopeGatherer initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:]();
      }
    }
  }

  return v18;
}

void __115__BRCDataOrDocsScopeGatherer_initWithNotificationPipe_appLibraries_startingRank_maxRank_withDeadItems_gatherReply___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  uint64_t v5 = *(void *)(a1 + 40);
  objc_msgSend(v4, "brc_wrappedError");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

- (void)gatherWithBatchSize:(int64_t)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v25 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipe);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v24 = (void *)a3;
    v8 = [WeakRetained manager];
    uint64_t v26 = [v8 session];

    v9 = [v26 readOnlyDB];
    objc_initWeak(&location, self);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke;
    v34[3] = &unk_1E69957D8;
    objc_copyWeak(&v36, &location);
    id v10 = v25;
    id v35 = v10;
    v11 = (void *)MEMORY[0x1D94389C0](v34);
    v12 = [v9 serialQueue];
    if (v12)
    {
      v13 = [v26 personaIdentifier];
      if (v13)
      {
        v14 = [v26 personaIdentifier];
        id v15 = [MEMORY[0x1E4FB36F8] sharedManager];
        id v16 = objc_msgSend(v15, "br_currentPersonaID");
        char v17 = [v14 isEqualToString:v16];

        if ((v17 & 1) == 0) {
          goto LABEL_5;
        }
      }
      else
      {
      }
      v22 = [v9 serialQueue];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2;
      v27[3] = &unk_1E6995828;
      objc_copyWeak(v31, &location);
      v31[1] = v24;
      id v29 = v11;
      v28 = v9;
      id v30 = v10;
      id v23 = v11;
      dispatch_async(v22, v27);

      objc_destroyWeak(v31);
LABEL_12:

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
      goto LABEL_13;
    }
LABEL_5:
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v39 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't gather anymore because the personaID is incorrect or db has no serial queue%@", buf, 0xCu);
    }

    id v20 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_15;
    block[3] = &unk_1E6995800;
    id v33 = v11;
    id v21 = v11;
    dispatch_async(v20, block);

    goto LABEL_12;
  }
  uint64_t v26 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v39 = v26;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Notification pipe got deallocated. Nothing to do%@", buf, 0xCu);
  }
LABEL_13:
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v3 = brc_bread_crumbs();
    id v4 = brc_notifications_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_cold_1();
    }
  }
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v68 = (uint64_t)objc_loadWeakRetained(WeakRetained + 1);
    if (v68)
    {
      unint64_t v66 = *(void *)(a1 + 64);
      if ((v66 & 0x8000000000000000) != 0)
      {
        v58 = brc_bread_crumbs();
        v59 = brc_default_log();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
          __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_6();
        }
      }
      if ([v2[3] count])
      {
        v69 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v66];
        v65 = [v2[3] lastObject];
        if (!v65)
        {
          v60 = brc_bread_crumbs();
          v61 = brc_default_log();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
            __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_5();
          }
        }
        v3 = (char *)v2[6];
        if (v3 + 1 > v2[4]) {
          id v4 = v3 + 1;
        }
        else {
          id v4 = v2[4];
        }
        memset(v80, 0, sizeof(v80));
        __brc_create_section(0, (uint64_t)"-[BRCDataOrDocsScopeGatherer gatherWithBatchSize:completion:]_block_invoke", 200, v80);
        uint64_t v5 = brc_bread_crumbs();
        id v6 = brc_notifications_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v50 = v80[0];
          v51 = [v65 logName];
          v52 = BRCPrettyPrintBitmap();
          *(_DWORD *)buf = 134219266;
          uint64_t v86 = v50;
          __int16 v87 = 2048;
          unint64_t v88 = (unint64_t)v4;
          __int16 v89 = 2112;
          v90 = v51;
          __int16 v91 = 2048;
          unint64_t v92 = v66;
          __int16 v93 = 2112;
          v94 = v52;
          __int16 v95 = 2112;
          v96 = v5;
          _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx Looking for item with ranks >= %lld in %@ (%ld kind %@)%@", buf, 0x3Eu);
        }
        unsigned int v7 = *(_DWORD *)(v68 + 152);
        if (v7)
        {
          v8 = v2[10];
          if (!v8)
          {
            v11 = 0;
            v64 = 0;
            int v22 = 1;
            goto LABEL_36;
          }
          if ((*(_WORD *)(v68 + 156) & 2) != 0)
          {
            id v49 = [v65 itemsEnumeratorChildOf:v2[10] withDeadItems:*((unsigned __int8 *)v2 + 72) rankMin:v4 rankMax:v2[5] count:v66 db:*(void *)(a1 + 32)];
            if (!v49)
            {
              v53 = brc_bread_crumbs();
              v54 = brc_default_log();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
                __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_3();
              }

              v55 = [(id)v68 queue];
              v78[0] = MEMORY[0x1E4F143A8];
              v78[1] = 3221225472;
              v78[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_19;
              v78[3] = &unk_1E6995800;
              id v79 = *(id *)(a1 + 40);
              dispatch_async(v55, v78);

              id v23 = 0;
              v64 = 0;
              goto LABEL_79;
            }
            v11 = v49;
            int v63 = 0;
            v64 = v49;
LABEL_37:

            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            id v23 = v11;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v73 objects:v83 count:16];
            if (v24)
            {
              uint64_t v25 = *(void *)v74;
              do
              {
                uint64_t v26 = 0;
                do
                {
                  if (*(void *)v74 != v25) {
                    objc_enumerationMutation(v23);
                  }
                  v27 = *(void **)(*((void *)&v73 + 1) + 8 * v26);
                  v28 = (void *)MEMORY[0x1D9438760]();
                  v2[6] = (id)[v27 notifsRank];
                  if (![v27 isZoneRoot])
                  {
                    if ([v27 isReserved])
                    {
                      id v36 = brc_bread_crumbs();
                      id v37 = brc_default_log();
                      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        uint64_t v86 = (uint64_t)v36;
                        _os_log_fault_impl(&dword_1D353B000, v37, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !item.isReserved%@", buf, 0xCu);
                      }
                    }
                    v31 = +[BRCNotification notificationGatheredFromItem:v27];
                    id v29 = v31;
                    if (*((unsigned char *)v2 + 72) || ![v31 isDead])
                    {
                      [v69 addObject:v29];
                      id v30 = brc_bread_crumbs();
                      v32 = brc_notifications_log();
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412802;
                        uint64_t v86 = (uint64_t)v2;
                        __int16 v87 = 2112;
                        unint64_t v88 = (unint64_t)v29;
                        __int16 v89 = 2112;
                        v90 = v30;
                        id v33 = v32;
                        uint64_t v34 = "[NOTIF] %@: queued gathered notification %@%@";
                        uint32_t v35 = 32;
LABEL_55:
                        _os_log_debug_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEBUG, v34, buf, v35);
                      }
                    }
                    else
                    {
                      id v30 = brc_bread_crumbs();
                      v32 = brc_notifications_log();
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        uint64_t v86 = (uint64_t)v29;
                        __int16 v87 = 2112;
                        unint64_t v88 = (unint64_t)v30;
                        id v33 = v32;
                        uint64_t v34 = "[NOTIF] Ignoring dead update %@%@";
                        uint32_t v35 = 22;
                        goto LABEL_55;
                      }
                    }

                    goto LABEL_52;
                  }
                  id v29 = brc_bread_crumbs();
                  id v30 = brc_notifications_log();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v86 = (uint64_t)v27;
                    __int16 v87 = 2112;
                    unint64_t v88 = (unint64_t)v29;
                    _os_log_debug_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEBUG, "[NOTIF] Ignoring zone root item %@%@", buf, 0x16u);
                  }
LABEL_52:

                  ++v26;
                }
                while (v24 != v26);
                uint64_t v38 = [v23 countByEnumeratingWithState:&v73 objects:v83 count:16];
                uint64_t v24 = v38;
              }
              while (v38);
            }

            if (v64) {
              char v39 = v63;
            }
            else {
              char v39 = 1;
            }
            if (v39)
            {
              if (v63)
              {
LABEL_65:
                [v2[3] removeLastObject];
                v2[6] = 0;
                char v40 = 1;
LABEL_68:
                if (![v69 count])
                {
                  if ((v40 & 1) == 0)
                  {
                    unint64_t v43 = brc_bread_crumbs();
                    __int16 v44 = brc_default_log();
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v45 = [v64 rowNumber];
                      *(_DWORD *)buf = 134218498;
                      uint64_t v86 = v45;
                      __int16 v87 = 2048;
                      unint64_t v88 = v66;
                      __int16 v89 = 2112;
                      v90 = v43;
                      _os_log_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Strange... No updates received and phase isn't done %lu vs %ld%@", buf, 0x20u);
                    }
                  }
                  [v2 gatherWithBatchSize:v66 completion:*(void *)(a1 + 48)];
                  goto LABEL_80;
                }
                v41 = [(id)v68 queue];
                __int16 v42 = v70;
                v70[0] = MEMORY[0x1E4F143A8];
                v70[1] = 3221225472;
                v70[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_25;
                v70[3] = &unk_1E69946C8;
                v70[4] = v69;
                id v71 = (id)v68;
                id v72 = *(id *)(a1 + 40);
                dispatch_async(v41, v70);

                goto LABEL_78;
              }
            }
            else if ([v64 rowNumber] < v66)
            {
              goto LABEL_65;
            }
            char v40 = 0;
            goto LABEL_68;
          }
          uint64_t v9 = [v2[8] itemByItemGlobalID:v8 db:*(void *)(a1 + 32)];
          id v10 = v9;
          if (v9)
          {
            uint64_t v84 = v9;
            v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
            v64 = 0;
          }
          else
          {
            v64 = 0;
            v11 = (void *)MEMORY[0x1E4F1CBF0];
          }
        }
        else
        {
          unsigned int v17 = (v7 >> 7) & 1;
          if ((v7 & 8) != 0)
          {
            unsigned int v18 = 1;
          }
          else
          {
            unsigned int v17 = 0;
            unsigned int v18 = 0;
          }
          if ((v7 & 6) != 0) {
            uint64_t v19 = v17;
          }
          else {
            uint64_t v19 = 0;
          }
          if ((v7 & 6) != 0) {
            uint64_t v20 = v18;
          }
          else {
            uint64_t v20 = 1;
          }
          BYTE3(v62) = (*(_DWORD *)(v68 + 152) & 0x40) != 0;
          BYTE2(v62) = (*(_DWORD *)(v68 + 152) & 0x20) != 0;
          BYTE1(v62) = (*(_DWORD *)(v68 + 152) & 4) != 0;
          LOBYTE(v62) = (*(_DWORD *)(v68 + 152) & 2) != 0;
          objc_msgSend(v65, "itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:", v4, v2[5], v2[7], *((unsigned __int8 *)v2 + 72), v20, v19, v62, v66, *(void *)(a1 + 32));
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            __int16 v46 = brc_bread_crumbs();
            v47 = brc_default_log();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
              __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_3();
            }

            uint64_t v48 = [(id)v68 queue];
            __int16 v42 = v77;
            v77[0] = MEMORY[0x1E4F143A8];
            v77[1] = 3221225472;
            v77[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_21;
            v77[3] = &unk_1E6995800;
            v77[4] = *(id *)(a1 + 40);
            dispatch_async(v48, v77);

            id v23 = 0;
            v64 = 0;
LABEL_78:
            v8 = v42[4];
LABEL_79:

LABEL_80:
            __brc_leave_section(v80);

            v13 = v69;
            goto LABEL_81;
          }
          v11 = v21;
          v8 = brc_bread_crumbs();
          id v10 = brc_notifications_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            int v56 = *((unsigned __int8 *)v2 + 72);
            *(_DWORD *)buf = 134218498;
            if (v56) {
              v57 = "yes";
            }
            else {
              v57 = "no";
            }
            uint64_t v86 = (uint64_t)v11;
            __int16 v87 = 2080;
            unint64_t v88 = (unint64_t)v57;
            __int16 v89 = 2112;
            v90 = v8;
            _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[NOTIF] Creating enumertor %p including dead items: %s%@", buf, 0x20u);
          }
          v64 = v11;
        }

        int v22 = v7 & 1;
LABEL_36:
        int v63 = v22;
        goto LABEL_37;
      }
      id v15 = [(id)v68 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_17;
      block[3] = &unk_1E69952C0;
      id v16 = *(id *)(a1 + 40);
      void block[4] = v2;
      id v82 = v16;
      dispatch_async(v15, block);

      v13 = v82;
    }
    else
    {
      v13 = brc_bread_crumbs();
      v14 = brc_notifications_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_2();
      }
    }
  }
  else
  {
    uint64_t v68 = brc_bread_crumbs();
    v12 = brc_notifications_log();
    v13 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_cold_1();
      v13 = v12;
    }
  }
LABEL_81:
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_17(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 done];
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_25(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D9438760](v3);
        objc_msgSend(*(id *)(a1 + 40), "addNotification:asDead:", v7, 0, (void)v10);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_popGatherReply
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)MEMORY[0x1D94389C0](v2->_gatherReply);
  id gatherReply = v2->_gatherReply;
  v2->_id gatherReply = 0;

  uint64_t v5 = (void *)MEMORY[0x1D94389C0](v3);
  objc_sync_exit(v2);

  return v5;
}

- (void)done
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[NOTIF] %@: gather phase ends%@");
}

void __34__BRCDataOrDocsScopeGatherer_done__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__BRCDataOrDocsScopeGatherer_done__block_invoke_2;
  v2[3] = &unk_1E6995800;
  os_log_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 addDequeueCallback:v2];
}

uint64_t __34__BRCDataOrDocsScopeGatherer_done__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] %@: EINTR: client gather phase was invalidated%@");
}

void __40__BRCDataOrDocsScopeGatherer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 4);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)dealloc
{
  [(BRCDataOrDocsScopeGatherer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BRCDataOrDocsScopeGatherer;
  [(BRCDataOrDocsScopeGatherer *)&v3 dealloc];
}

- (BRCItemGlobalID)gatheredChildrenItemGlobalID
{
  return self->_gatheredChildrenItemGlobalID;
}

- (void)setGatheredChildrenItemGlobalID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatheredChildrenItemGlobalID, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_gatheringNamePrefix, 0);
  objc_storeStrong((id *)&self->_gatheringAppLibraries, 0);
  objc_storeStrong(&self->_gatherReply, 0);
  objc_destroyWeak((id *)&self->_pipe);
}

- (void)initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:.cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[NOTIF] matching prefix: %@%@", (void)v3, DWORD2(v3));
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[NOTIF] Self got deallocated. Nothing to do%@", v2, v3, v4, v5, v6);
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[NOTIF] Notification pipe got deallocated. Nothing to do%@", v2, v3, v4, v5, v6);
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: No gathered items enumerator - bailing out%@", v2, v3, v4, v5, v6);
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: appLibrary%@", v2, v3, v4, v5, v6);
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: count >= 0%@", v2, v3, v4, v5, v6);
}

@end