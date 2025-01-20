@interface BRCServerChangesApplyUtil
+ (BOOL)checkEarlyExitsPriorToApplying:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 session:(id)a8 isDeleteOfShareRoot:(BOOL)a9 diffs:(unint64_t)a10 clientZone:(id)a11;
+ (BOOL)deletingShareRoot:(id)a3 localItem:(id)a4;
+ (BOOL)handleApplyChangesForUnliveServerItem:(id)a3 isDeleteOfShareRoot:(BOOL)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 session:(id)a8;
+ (BOOL)handleEtagsChangesOnly:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 diffs:(unint64_t *)a8 needsSave:(BOOL *)a9;
+ (BOOL)handleNonRevivedItemIfNecessary:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 hasInitialScanItemTypeMismatch:(BOOL *)a8;
+ (BOOL)shouldForceApplyContentForItem:(id)a3;
@end

@implementation BRCServerChangesApplyUtil

+ (BOOL)shouldForceApplyContentForItem:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 isFault]) {
    goto LABEL_23;
  }
  v4 = [v3 st];
  v5 = [v4 stagedFileID];

  if (!v5) {
    goto LABEL_23;
  }
  v6 = [v3 parentClientZone];
  v7 = [v6 itemIDsBlockedFromSyncForCZMProcessing];
  v8 = [v3 itemGlobalID];
  if (![v7 containsObject:v8])
  {
    v9 = [v3 clientZone];
    v10 = [v9 parentsOfCZMFaults];
    v11 = [v3 itemID];
    v12 = [v10 objectForKeyedSubscript:v11];
    if (v12)
    {

      goto LABEL_6;
    }
    v14 = [v3 clientZone];
    v15 = [v14 parentsOfCZMFaults];
    v41 = [v3 st];
    v39 = [v41 parentID];
    v16 = objc_msgSend(v15, "objectForKeyedSubscript:");
    if (v16)
    {
      [v3 parentClientZone];
      v17 = v37 = v15;
      [v3 clientZone];
      v18 = v38 = v14;
      char v40 = [v17 isEqualToClientZone:v18];

      v14 = v38;
      v15 = v37;
    }
    else
    {
      char v40 = 0;
    }

    if (v40) {
      goto LABEL_7;
    }
    v19 = [v3 clientZone];
    v20 = [v19 parentsOfCZMFaults];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      v22 = [v3 clientZone];
      v23 = [v22 parentsOfCZMFaults];
      v42 = [v23 allKeys];

      [v3 setOfParentIDs];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v44;
        while (2)
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v44 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            v30 = [v29 zoneRowID];
            v31 = [v3 clientZone];
            v32 = [v31 dbRowID];
            int v33 = objc_msgSend(v30, "br_isEqualToNumber:", v32);

            if (v33)
            {
              v34 = [v29 itemID];
              char v35 = [v42 containsObject:v34];

              if (v35)
              {

                goto LABEL_7;
              }
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v26) {
            continue;
          }
          break;
        }
      }
    }
LABEL_23:
    BOOL v13 = 0;
    goto LABEL_24;
  }
LABEL_6:

LABEL_7:
  BOOL v13 = 1;
LABEL_24:

  return v13;
}

+ (BOOL)checkEarlyExitsPriorToApplying:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 session:(id)a8 isDeleteOfShareRoot:(BOOL)a9 diffs:(unint64_t)a10 clientZone:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a11;
  LOBYTE(v25) = a9;
  if (+[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:](BRCServerChangesApplyUtil_Private, "localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:", v16, v17, a5, v18, v21, v19, v25, v20)|| +[BRCServerChangesApplyUtil_Private serverItemDeadWithNoLiveLocalItem:v16 si:v17 rank:a5 scheduler:v18 clientZone:v21 zone:v19]
    || +[BRCServerChangesApplyUtil_Private serverItemWouldBeParentedToDeadFolder:v16 si:v17 rank:a5 scheduler:v18 zone:v19 diffs:a10])
  {
    BOOL v22 = 1;
  }
  else
  {
    id v24 = [v17 parentItemIDOnFS];
    BOOL v22 = +[BRCServerChangesApplyUtil_Private appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:](BRCServerChangesApplyUtil_Private, "appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:", v16, v19, a5, v24, v18, v20)|| +[BRCServerChangesApplyUtil_Private itemUndergoingCZMToAnotherZone:v16 si:v17 clientZone:v21 rank:a5 scheduler:v18 zone:v19];
  }
  return v22;
}

+ (BOOL)handleApplyChangesForUnliveServerItem:(id)a3 isDeleteOfShareRoot:(BOOL)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 session:(id)a8
{
  BOOL v12 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = brc_bread_crumbs();
  id v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v38 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v43 = v13;
    __int16 v44 = 2112;
    if (v12) {
      v38 = @"YES";
    }
    long long v45 = v38;
    __int16 v46 = 2112;
    v47 = v17;
    _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] handleApplyChangesForUnliveServerItem for %@\ndelete share root: %@%@", buf, 0x20u);
  }

  if ([v13 isFSRoot])
  {
    id v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:]();
    }

    [v13 markItemForgottenByServer];
    [v13 markForceNeedsSyncUp];
    id v21 = [v15 dbRowID];
    [v14 setState:0 forRank:a5 zoneRowID:v21];

    BOOL v22 = 1;
    [v13 saveToDBForServerEdit:1 keepAliases:0];
  }
  else if ([v13 isDirectory] {
         && ([v13 asDirectory],
  }
             v23 = objc_claimAutoreleasedReturnValue(),
             int v24 = [v23 hasLiveChildren],
             v23,
             v24))
  {
    uint64_t v25 = brc_bread_crumbs();
    uint64_t v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      +[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:]();
    }

    if (v12)
    {
      int64_t v39 = a5;
      uint64_t v27 = [v13 db];
      v28 = [v13 itemID];
      v29 = [v13 clientZone];
      v30 = [v29 dbRowID];
      v31 = (void *)[v27 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_stat_ckinfo IS NULL AND item_parent_id = %@ AND zone_rowid = %@", v28, v30];

      if ([v31 next])
      {
        do
        {
          v32 = (void *)MEMORY[0x1D9438760]();
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke;
          v40[3] = &unk_1E6994120;
          id v41 = v16;
          int v33 = [v31 object:v40];
          brc_bread_crumbs();
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
          char v35 = brc_default_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v43 = v13;
            __int16 v44 = 2112;
            long long v45 = v34;
            _os_log_debug_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Marking item unknown to server %@ as rejected%@", buf, 0x16u);
          }

          [v33 markForceRejected];
          [v33 saveToDB];
        }
        while (([v31 next] & 1) != 0);
      }

      a5 = v39;
    }
    v36 = [v15 dbRowID];
    [v14 setState:25 forRank:a5 zoneRowID:v36];

    BOOL v22 = 1;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

id __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  v6 = [v4 clientDB];
  v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

+ (BOOL)deletingShareRoot:(id)a3 localItem:(id)a4
{
  id v5 = a4;
  int v6 = [a3 isDead];
  if (a3 && !v6) {
    goto LABEL_8;
  }
  if ([v5 isSharedToMeTopLevelItem])
  {
    char v7 = 1;
    goto LABEL_9;
  }
  if (![v5 isSharedToMeChildItem])
  {
LABEL_8:
    char v7 = 0;
    goto LABEL_9;
  }
  v8 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v5);
  v9 = objc_msgSend(v8, "brc_shareItemID");
  v10 = [v5 clientZone];
  v11 = [v10 serverItemByItemID:v9];

  if (v11) {
    char v7 = [v11 isDead];
  }
  else {
    char v7 = 1;
  }

LABEL_9:
  return v7;
}

+ (BOOL)handleNonRevivedItemIfNecessary:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 hasInitialScanItemTypeMismatch:(BOOL *)a8
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!a3)
  {
    if (a8) {
      *a8 = 0;
    }
    id v17 = [v13 parentItemIDOnFS];
    id v18 = [v13 clientZone];
    id v19 = [v13 st];
    id v20 = [v19 logicalName];
    id v21 = [v18 itemByParentID:v17 andLogicalName:v20];

    if (![v21 isFromInitialScan]) {
      goto LABEL_40;
    }
    BOOL v22 = brc_bread_crumbs();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v41 = v21;
      __int16 v42 = 2112;
      id v43 = v13;
      __int16 v44 = 2112;
      long long v45 = v22;
      _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Found a freshly scanned item from an initial scan that path matches: %@ for server item: %@%@", buf, 0x20u);
    }

    int v24 = [v21 clientZone];
    uint64_t v25 = [v13 clientZone];
    if (![v24 isEqualToClientZone:v25]) {
      goto LABEL_35;
    }
    if [v21 isFSRoot] && (objc_msgSend(v13, "isDirectory")) {
      goto LABEL_22;
    }
    int64_t v39 = [v21 st];
    unsigned int v26 = [v39 type];
    v38 = [v13 st];
    unsigned int v27 = [v38 type];
    if (v26 != v27)
    {
      if (v26 > 0xA) {
        goto LABEL_34;
      }
      if (((1 << v26) & 0x611) == 0)
      {
        if (((1 << v26) & 0x106) != 0)
        {
LABEL_15:
          if (v27 > 8 || ((1 << v27) & 0x106) == 0)
          {
            if (v26 != 6) {
              goto LABEL_34;
            }
            goto LABEL_29;
          }
          goto LABEL_21;
        }
        if (v26 == 6)
        {
LABEL_29:
          unsigned int v34 = v27;

          if (v34 != 6)
          {
LABEL_36:
            char v35 = brc_bread_crumbs();
            v36 = brc_default_log();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
              +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:]();
            }

            if (a8)
            {
              BOOL v16 = 0;
              *a8 = 1;
LABEL_41:

              goto LABEL_42;
            }
LABEL_40:
            BOOL v16 = 0;
            goto LABEL_41;
          }
LABEL_23:
          v28 = brc_bread_crumbs();
          v29 = brc_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:]();
          }

          v30 = [v13 itemID];
          [v21 learnItemID:v30 serverItem:v13 path:0 markLost:1];

          [v21 saveToDBForServerEdit:1 keepAliases:0];
          v31 = brc_bread_crumbs();
          v32 = brc_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:]();
          }

          int v33 = [v15 dbRowID];
          [v14 setState:22 forRank:a5 zoneRowID:v33];

          BOOL v16 = 1;
          goto LABEL_41;
        }
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      if (v27 > 0xA || ((1 << v27) & 0x611) == 0)
      {
        if (v26 - 1 < 2) {
          goto LABEL_15;
        }
        if (v26 == 6) {
          goto LABEL_29;
        }
        if (v26 == 8) {
          goto LABEL_15;
        }
        goto LABEL_34;
      }
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  BOOL v16 = 0;
LABEL_42:

  return v16;
}

+ (BOOL)handleEtagsChangesOnly:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 diffs:(unint64_t *)a8 needsSave:(BOOL *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  if (!v14 || ([v14 isReserved] & 1) != 0) {
    goto LABEL_9;
  }
  unint64_t v18 = *a8;
  if ((*a8 & 0x7FFF) == 1)
  {
    id v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[BRCServerChangesApplyUtil handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:]();
    }

    [v14 updateStructuralCKInfoFromServerItem:v15];
    *a9 = 1;
    unint64_t v18 = *a8 & 0xFFFFFFFFFFFFFFFELL;
    *a8 = v18;
  }
  if (v18 || ([v14 isDocument] & 1) != 0)
  {
LABEL_9:
    BOOL v21 = 0;
  }
  else
  {
    v23 = brc_bread_crumbs();
    int v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[BRCServerChangesApplyUtil handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:]();
    }

    uint64_t v25 = [v17 dbRowID];
    [v16 setState:0 forRank:a5 zoneRowID:v25];

    BOOL v21 = 1;
    if (a9) {
      [v14 saveToDBForServerEdit:1 keepAliases:0];
    }
  }

  return v21;
}

+ (void)handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] the fs root was remotely deleted, we need to recreate it and reupload it%@", v2, v3, v4, v5, v6);
}

+ (void)handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:.cold.2()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (live child)%@");
}

+ (void)handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Suspending rank since freshly scanned means either same content or conflict: %@%@");
}

+ (void)handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Item type matches with the server item type%@", v2, v3, v4, v5, v6);
}

+ (void)handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Item type does not match with the server item type%@", v2, v3, v4, v5, v6);
}

+ (void)handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Remove rank for item with no real changes: %@%@");
}

+ (void)handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Accepting Structural Etag update for %@%@");
}

@end