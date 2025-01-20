@interface BRCAliasItem
+ (id)targetReferenceWithItemID:(id)a3 targetZone:(id)a4 isFolderShare:(BOOL)a5;
+ (void)fillStructureRecord:(id)a3 inZone:(id)a4 itemID:(id)a5 ckInfo:(id)a6 parentID:(id)a7 targetItemID:(id)a8 targetZone:(id)a9 diffs:(unint64_t)a10 isFolderShare:(BOOL)a11 beingDeadInServerTruth:(BOOL)a12 shouldPCSChainStatus:(unsigned __int8)a13;
- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4;
- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4;
- (BOOL)changedAtRelativePath:(id)a3 scanPackage:(BOOL)a4;
- (BOOL)evictInTask:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)isBRAlias;
- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7;
- (BOOL)updateOnDiskWithAliasTarget:(id)a3 forServerEdit:(BOOL)a4;
- (BOOL)updateXattrInfoFromPath:(id)a3 error:(id *)a4;
- (BRCAppLibrary)targetAppLibrary;
- (BRCClientZone)targetClientZone;
- (BRCItemID)targetItemID;
- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 stageID:(id)a4 shouldPCSChainStatus:(unsigned __int8)a5;
- (id)targetDocument;
- (void)_removeAliasAndMarkDead;
- (void)isBRAlias;
- (void)learnTarget:(id)a3;
- (void)markLatestSyncRequestRejectedInZone:(id)a3;
- (void)markNeedsUploadOrSyncingUp;
- (void)markNeedsUploadOrSyncingUpWithAliasTarget:(id)a3;
- (void)rewriteOrDeleteAliasOnDiskWithTarget:(id)a3;
- (void)targetMovedToThisAppLibrary;
- (void)targetMovedToTrashOrDeleted;
@end

@implementation BRCAliasItem

- (BOOL)isBRAlias
{
  if ([(BRCStatInfo *)self->super._st type] != 3)
  {
    v3 = brc_bread_crumbs();
    v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      [(BRCAliasItem *)(uint64_t)v3 isBRAlias];
    }
  }
  return 1;
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  id v49 = a3;
  v47 = [(BRCServerZone *)self->super._serverZone dbRowID];
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  unint64_t sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  unint64_t localDiffs = self->super._localDiffs;
  unint64_t notifsRank = self->super._notifsRank;
  uint64_t syncUpState = self->super._syncUpState;
  v39 = [(BRCLocalItem *)self appLibrary];
  v46 = [v39 dbRowID];
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  BOOL isUserVisible = self->super._isUserVisible;
  v48 = [(BRCStatInfo *)self->super._st ckInfo];
  int v27 = [(BRCStatInfo *)self->super._st state];
  int v26 = [(BRCStatInfo *)self->super._st type];
  int v25 = [(BRCStatInfo *)self->super._st mode];
  int64_t v23 = [(BRCStatInfo *)self->super._st birthtime];
  int64_t v18 = [(BRCStatInfo *)self->super._st lastUsedTime];
  int64_t v24 = [(BRCStatInfo *)self->super._st favoriteRank];
  v45 = [(BRCStatInfo *)self->super._st parentID];
  st = self->super._st;
  logicalName = (__CFString *)st->super._logicalName;
  if (!logicalName) {
    logicalName = &stru_1F2AC7720;
  }
  v22 = logicalName;
  BOOL v21 = [(BRCStatInfo *)st isHiddenExt];
  v7 = [(BRCStatInfo *)self->super._st finderTags];
  v44 = [(BRCStatInfo *)self->super._st xattrSignature];
  v43 = [(BRCStatInfo *)self->super._st trashPutBackPath];
  v42 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
  v41 = [(BRCStatInfo *)self->super._st aliasTarget];
  v40 = [(BRCStatInfo *)self->super._st creatorRowID];
  v20 = [(BRCLocalStatInfo *)self->super._st documentID];
  v19 = [(BRCLocalStatInfo *)self->super._st fileID];
  v8 = [(BRCLocalStatInfo *)self->super._st generationID];
  v9 = [(BRCLocalStatInfo *)self->super._st physicalName];
  v10 = [(BRCLocalStatInfo *)self->super._st processingStamp];
  v11 = [(BRCLocalStatInfo *)self->super._st stagedFileIDForDB];
  uint64_t v12 = [(BRCLocalStatInfo *)self->super._st stagedGenerationID];
  v13 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
  unsigned int v14 = [(BRCLocalStatInfo *)self->super._st itemScope];
  v15 = [(BRCLocalStatInfo *)self->super._st tmpBouncedNo];
  if (objc_msgSend(v49, "execute:", @"INSERT INTO client_items(rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno) VALUES(%lld, %@, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %u, %@, %d, %@)", a4, v47, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v46, minimumSupportedOSRowID, isUserVisible, v48, v27, v26,
                       v25,
                       v23,
                       v18,
                       v24,
                       v45,
                       v22,
                       v21,
                       v7,
                       v44,
                       v43,
                       v42,
                       v41,
                       v40,
                       v20,
                       v19,
                       v8,
                       v9,
                       v10,
                       v11,
                       v12,
                       v13,
                       v14,
                       v15))
  {
    v50.receiver = self;
    v50.super_class = (Class)BRCAliasItem;
    BOOL v16 = [(BRCLocalItem *)&v50 _insertInDB:v49 dbRowID:a4];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  id v49 = a3;
  v47 = [(BRCClientZone *)self->super._clientZone dbRowID];
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  unint64_t sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  unint64_t localDiffs = self->super._localDiffs;
  unint64_t notifsRank = self->super._notifsRank;
  uint64_t syncUpState = self->super._syncUpState;
  v41 = [(BRCLocalItem *)self appLibrary];
  v5 = [v41 dbRowID];
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  BOOL isUserVisible = self->super._isUserVisible;
  v48 = [(BRCStatInfo *)self->super._st ckInfo];
  int v6 = [(BRCStatInfo *)self->super._st state];
  int v30 = [(BRCStatInfo *)self->super._st type];
  int v29 = [(BRCStatInfo *)self->super._st mode];
  int64_t v28 = [(BRCStatInfo *)self->super._st birthtime];
  int64_t v27 = [(BRCStatInfo *)self->super._st lastUsedTime];
  int64_t v26 = [(BRCStatInfo *)self->super._st favoriteRank];
  v7 = [(BRCStatInfo *)self->super._st parentID];
  st = self->super._st;
  logicalName = (__CFString *)st->super._logicalName;
  if (!logicalName) {
    logicalName = &stru_1F2AC7720;
  }
  int v25 = logicalName;
  BOOL v24 = [(BRCStatInfo *)st isHiddenExt];
  v46 = [(BRCStatInfo *)self->super._st finderTags];
  v45 = [(BRCStatInfo *)self->super._st xattrSignature];
  v44 = [(BRCStatInfo *)self->super._st trashPutBackPath];
  v43 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
  v42 = [(BRCStatInfo *)self->super._st aliasTarget];
  int64_t v23 = [(BRCStatInfo *)self->super._st creatorRowID];
  v22 = [(BRCLocalStatInfo *)self->super._st documentID];
  BOOL v21 = [(BRCLocalStatInfo *)self->super._st fileID];
  v20 = [(BRCLocalStatInfo *)self->super._st generationID];
  v19 = [(BRCLocalStatInfo *)self->super._st physicalName];
  v10 = [(BRCLocalStatInfo *)self->super._st processingStamp];
  v11 = [(BRCLocalStatInfo *)self->super._st stagedFileIDForDB];
  uint64_t v12 = [(BRCLocalStatInfo *)self->super._st stagedGenerationID];
  v13 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
  unsigned int v14 = [(BRCLocalStatInfo *)self->super._st itemScope];
  v15 = [(BRCLocalStatInfo *)self->super._st tmpBouncedNo];
  if (objc_msgSend(v49, "execute:", @"UPDATE client_items SET  zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_doc_id = %@, item_file_id = %@, item_generation = %@, item_localname = %@, item_processing_stamp = %@, item_staged_file_id = %@, item_staged_generation = %u, item_bouncedname = %@, item_scope = %d, item_tmpbounceno = %@  WHERE rowid = %llu", v47, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v5, minimumSupportedOSRowID, isUserVisible, v48, v6, v30, v29,
                       v28,
                       v27,
                       v26,
                       v7,
                       v25,
                       v24,
                       v46,
                       v45,
                       v44,
                       v43,
                       v42,
                       v23,
                       v22,
                       v21,
                       v20,
                       v19,
                       v10,
                       v11,
                       v12,
                       v13,
                       v14,
                       v15,
                       self->super._dbRowID))
  {
    v50.receiver = self;
    v50.super_class = (Class)BRCAliasItem;
    BOOL v16 = [(BRCLocalItem *)&v50 _updateInDB:v49 diffs:a4];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BRCClientZone)targetClientZone
{
  session = self->super._session;
  v3 = [(BRCStatInfo *)self->super._st _aliasTargetMangledID];
  v4 = [(BRCAccountSession *)session clientZoneByMangledID:v3];

  return (BRCClientZone *)v4;
}

- (BRCItemID)targetItemID
{
  return (BRCItemID *)[(BRCStatInfo *)self->super._st _aliasTargetItemID];
}

- (void)markNeedsUploadOrSyncingUp
{
}

- (void)markNeedsUploadOrSyncingUpWithAliasTarget:(id)a3
{
  id v4 = a3;
  if (-[BRCLocalItem isDead](self, "isDead") || ([v4 isKnownByServer] & 1) != 0) {
    [(BRCLocalItem *)self _markNeedsSyncingUp];
  }
  else {
    self->super._uint64_t syncUpState = 3;
  }
}

- (void)markLatestSyncRequestRejectedInZone:(id)a3
{
  self->super._unint64_t localDiffs = 0;
  id v4 = a3;
  v5 = brc_bread_crumbs();
  int v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCAliasItem markLatestSyncRequestRejectedInZone:]((uint64_t)v5, v6);
  }

  v7.receiver = self;
  v7.super_class = (Class)BRCAliasItem;
  [(BRCLocalItem *)&v7 markLatestSyncRequestRejectedInZone:v4];
}

- (BOOL)updateXattrInfoFromPath:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)changedAtRelativePath:(id)a3 scanPackage:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCAliasItem(LegacyAdditions) changedAtRelativePath:scanPackage:]", 28, v15);
  objc_super v7 = brc_bread_crumbs();
  v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v17 = v15[0];
    __int16 v18 = 2112;
    v19 = self;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    int64_t v23 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx diffing item %@\nagainst %@%@", buf, 0x2Au);
  }

  char v9 = [v6 isBRAlias];
  if ((v9 & 1) == 0)
  {
    v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCAliasItem(LegacyAdditions) changedAtRelativePath:scanPackage:]();
    }
    goto LABEL_10;
  }
  v14.receiver = self;
  v14.super_class = (Class)BRCAliasItem;
  if (![(BRCLocalItem *)&v14 changedAtRelativePath:v6 scanPackage:v4])
  {
    v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCAliasItem(LegacyAdditions) changedAtRelativePath:scanPackage:]();
    }
LABEL_10:

    char v10 = v9 ^ 1;
    goto LABEL_11;
  }
  char v10 = 1;
LABEL_11:
  __brc_leave_section(v15);

  return v10;
}

- (BRCAppLibrary)targetAppLibrary
{
  session = self->super._session;
  v3 = [(BRCStatInfo *)self->super._st _aliasTargetMangledID];
  BOOL v4 = [(BRCAccountSession *)session appLibraryByMangledID:v3];

  return (BRCAppLibrary *)v4;
}

- (void)learnTarget:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v10, 0, sizeof(v10));
  __brc_create_section(0, (uint64_t)"-[BRCAliasItem(LegacyAdditions) learnTarget:]", 49, v10);
  v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v12 = v10[0];
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    BOOL v16 = self;
    __int16 v17 = 2112;
    __int16 v18 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx learning target %@ for %@%@", buf, 0x2Au);
  }

  objc_super v7 = [(BRCLocalItem *)self appLibrary];
  v8 = [v4 appLibrary];
  if (v7 == v8)
  {
    char v9 = [v4 isSharedToMe];

    if (v9) {
      goto LABEL_6;
    }
    objc_super v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCAliasItem(LegacyAdditions) learnTarget:]();
    }
  }

LABEL_6:
  [(BRCStatInfo *)self->super._st _updateAliasTarget:v4];
  __brc_leave_section(v10);
}

- (void)rewriteOrDeleteAliasOnDiskWithTarget:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 appLibrary];
  id v6 = [v5 db];
  [v6 assertOnQueue];

  int v35 = 0;
  objc_super v7 = [(BRCLocalStatInfo *)self->super._st fileID];
  v8 = (BRCRelativePath *)[v7 unsignedLongLongValue];

  memset(v34, 0, sizeof(v34));
  __brc_create_section(0, (uint64_t)"-[BRCAliasItem(LegacyAdditions) rewriteOrDeleteAliasOnDiskWithTarget:]", 64, v34);
  char v9 = brc_bread_crumbs();
  char v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v37 = v34[0];
    __int16 v38 = 2112;
    *(void *)v39 = self;
    *(_WORD *)&v39[8] = 2112;
    *(void *)&v39[10] = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx rewriting alias on disk: %@%@", buf, 0x20u);
  }

  if (v8) {
    v8 = [[BRCRelativePath alloc] initWithFileID:v8 session:self->super._session];
  }
  if (![(BRCRelativePath *)v8 resolveMustExist:0 error:&v35])
  {
    id v14 = brc_bread_crumbs();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v37 = (uint64_t)v8;
      __int16 v38 = 1024;
      *(_DWORD *)v39 = v35;
      *(_WORD *)&v39[4] = 2112;
      *(void *)&v39[6] = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] can't resolve %@ %{errno}d%@", buf, 0x1Cu);
    }

    goto LABEL_11;
  }
  v11 = [(BRCRelativePath *)v8 appLibrary];
  uint64_t v12 = [v4 appLibrary];
  int v13 = [v11 isEqualToAppLibrary:v12];

  if (v13)
  {
    [(BRCAliasItem *)self targetMovedToThisAppLibrary];
    goto LABEL_12;
  }
  BOOL v16 = [[BRCRelativePath alloc] initWithFileID:[(BRCRelativePath *)v8 parentFileID] session:self->super._session];
  __int16 v17 = [BRCBookmark alloc];
  __int16 v18 = [(BRCRelativePath *)v8 appLibrary];
  uint64_t v19 = [(BRCLocalItem *)self session];
  __int16 v20 = [(BRCBookmark *)v17 initWithTarget:v4 owningAppLibrary:v18 path:0 session:v19];

  id v33 = 0;
  LOBYTE(v19) = [(BRCBookmark *)v20 resolveWithError:&v33];
  id v21 = v33;
  if (v19)
  {
    if ([(BRCRelativePath *)v16 resolveAndKeepOpenMustExist:1 error:&v35])
    {
      __int16 v22 = [(BRCRelativePath *)v8 filename];
      id v32 = v21;
      int64_t v23 = [(BRCBookmark *)v20 writeUnderParent:v16 name:v22 error:&v32];
      id v24 = v32;

      BOOL v25 = v23 != 0;
      if (v23)
      {
        [(BRCLocalItem *)self updateFromFSAtPath:v23];
      }
      else
      {
        int v30 = brc_bread_crumbs();
        v31 = brc_default_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v37 = (uint64_t)v24;
          __int16 v38 = 2112;
          *(void *)v39 = v30;
          _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] can't write bookmark %@%@", buf, 0x16u);
        }
      }
      [(BRCRelativePath *)v16 close];
    }
    else
    {
      int64_t v28 = brc_bread_crumbs();
      int v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v37 = (uint64_t)v16;
        __int16 v38 = 1024;
        *(_DWORD *)v39 = v35;
        *(_WORD *)&v39[4] = 2112;
        *(void *)&v39[6] = v28;
        _os_log_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] can't resolve parent %@ %{errno}d%@", buf, 0x1Cu);
      }

      int64_t v23 = 0;
      BOOL v25 = 0;
      id v24 = v21;
    }

    id v21 = v24;
  }
  else
  {
    int64_t v26 = brc_bread_crumbs();
    int64_t v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v37 = (uint64_t)v21;
      __int16 v38 = 2112;
      *(void *)v39 = v4;
      *(_WORD *)&v39[8] = 2112;
      *(void *)&v39[10] = v26;
      _os_log_debug_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Grabbing the bookmark data fails with: %@\nMarking the target lost: %@%@", buf, 0x20u);
    }

    [v4 markLostClearGenerationID:0 backoffMode:1];
    BOOL v25 = 0;
  }
  [(BRCRelativePath *)v8 close];

  if (!v25) {
LABEL_11:
  }
    [(BRCLocalItem *)self markLostClearGenerationID:0 backoffMode:1];
LABEL_12:
  __brc_leave_section(v34);
}

- (BOOL)updateOnDiskWithAliasTarget:(id)a3 forServerEdit:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = self->super._itemID;
  v8 = [v6 aliasItemID];
  memset(v30, 0, sizeof(v30));
  __brc_create_section(0, (uint64_t)"-[BRCAliasItem(LegacyAdditions) updateOnDiskWithAliasTarget:forServerEdit:]", 117, v30);
  char v9 = brc_bread_crumbs();
  char v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = v30[0];
    int v29 = [(BRCClientZone *)self->super._clientZone mangledID];
    *(_DWORD *)buf = 134219010;
    uint64_t v32 = v28;
    __int16 v33 = 2112;
    v34 = v7;
    __int16 v35 = 2112;
    v36 = v29;
    __int16 v37 = 2112;
    id v38 = v6;
    __int16 v39 = 2112;
    uint64_t v40 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Updating alias %@ in %@ with new target: %@%@", buf, 0x34u);
  }
  if ([v8 isEqualToItemID:v7]) {
    goto LABEL_18;
  }
  v11 = [(BRCLocalStatInfo *)self->super._st fileID];
  uint64_t v12 = (BRCRelativePath *)[v11 unsignedLongLongValue];

  if (v12) {
    uint64_t v12 = [[BRCRelativePath alloc] initWithFileID:v12 session:self->super._session];
  }
  if (!v8)
  {
LABEL_17:
    [(BRCAliasItem *)self learnTarget:v6];
    [(BRCAliasItem *)self rewriteOrDeleteAliasOnDiskWithTarget:v6];

LABEL_18:
    [(BRCAliasItem *)self markNeedsUploadOrSyncingUpWithAliasTarget:v6];
    char v24 = [(BRCLocalItem *)self saveToDBForServerEdit:v4 keepAliases:0];
    goto LABEL_19;
  }
  int v13 = [(BRCClientZone *)self->super._clientZone itemByItemID:v8];
  id v14 = v13;
  if (!v13)
  {
    __int16 v22 = [(BRCLocalItem *)self appLibrary];
    char v23 = [v22 wasMovedToCloudDocs];

    if ((v23 & 1) == 0) {
      [(BRCLocalItem *)self learnItemID:v8 serverItem:0 path:0 markLost:0];
    }
    goto LABEL_17;
  }
  __int16 v15 = [v13 st];
  BOOL v16 = [v15 fileID];
  __int16 v17 = (BRCRelativePath *)[v16 unsignedLongLongValue];

  if (v17) {
    __int16 v17 = [[BRCRelativePath alloc] initWithFileID:v17 session:self->super._session];
  }
  __int16 v18 = [(BRCClientZone *)self->super._clientZone asPrivateClientZone];
  uint64_t v19 = [v18 resolveClashOfAlias:self atPath:v12 withAlias:v14 atPath:v17];

  if (v19 == v17)
  {
    char v24 = 1;
  }
  else
  {
    if ([(BRCRelativePath *)v19 exists])
    {
      __int16 v20 = brc_bread_crumbs();
      id v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[BRCAliasItem(LegacyAdditions) updateOnDiskWithAliasTarget:forServerEdit:]();
      }

      [(BRCLocalItem *)self updateFromFSAtPath:v17];
    }
    else
    {
      int64_t v26 = brc_bread_crumbs();
      int64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[BRCAliasItem(LegacyAdditions) updateOnDiskWithAliasTarget:forServerEdit:]();
      }
    }
    [v14 markLostClearGenerationID:0 backoffMode:1];
    char v24 = [v14 saveToDB];
  }

LABEL_19:
  __brc_leave_section(v30);

  return v24;
}

- (void)_removeAliasAndMarkDead
{
  v3 = [(BRCLocalStatInfo *)self->super._st fileID];
  BOOL v4 = (BRCRelativePath *)[v3 unsignedLongLongValue];

  if (v4)
  {
    BOOL v4 = [[BRCRelativePath alloc] initWithFileID:v4 session:self->super._session];
    if ([(BRCRelativePath *)v4 resolveMustExist:1 error:0])
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __56__BRCAliasItem_LegacyAdditions___removeAliasAndMarkDead__block_invoke;
      v5[3] = &unk_1E6994A60;
      v5[4] = self;
      [(BRCRelativePath *)v4 performOnOpenParentFileDescriptor:v5 error:0];
    }
  }
  [(BRCLocalItem *)self markDead];
  [(BRCAliasItem *)self markNeedsUploadOrSyncingUp];
  [(BRCLocalItem *)self saveToDBForServerEdit:1 keepAliases:0];
}

uint64_t __56__BRCAliasItem_LegacyAdditions___removeAliasAndMarkDead__block_invoke(uint64_t a1, int a2)
{
  v3 = [*(id *)(a1 + 32) st];
  BOOL v4 = [v3 filename];
  BRCUnlinkAt(a2, v4, 0);

  return 0;
}

- (void)targetMovedToTrashOrDeleted
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRCAliasItem(LegacyAdditions) targetMovedToTrashOrDeleted]", 187, v8);
  v3 = brc_bread_crumbs();
  BOOL v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    itemID = self->super._itemID;
    uint64_t v6 = v8[0];
    objc_super v7 = [(BRCClientZone *)self->super._clientZone mangledID];
    *(_DWORD *)buf = 134218754;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = itemID;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    BOOL v16 = v3;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Deleting alias %@ in %@ because target is dead%@", buf, 0x2Au);
  }
  [(BRCAliasItem *)self _removeAliasAndMarkDead];
  __brc_leave_section(v8);
}

- (void)targetMovedToThisAppLibrary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRCAliasItem(LegacyAdditions) targetMovedToThisAppLibrary]", 194, v8);
  v3 = brc_bread_crumbs();
  BOOL v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    itemID = self->super._itemID;
    uint64_t v6 = v8[0];
    objc_super v7 = [(BRCClientZone *)self->super._clientZone mangledID];
    *(_DWORD *)buf = 134218754;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = itemID;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    BOOL v16 = v3;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Deleting alias %@ in %@ because target moved to this app library%@", buf, 0x2Au);
  }
  [(BRCAliasItem *)self _removeAliasAndMarkDead];
  __brc_leave_section(v8);
}

- (id)targetDocument
{
  v3 = [(BRCAliasItem *)self targetItemID];
  BOOL v4 = [(BRCAliasItem *)self targetClientZone];
  v5 = [v4 itemByItemID:v3];
  uint64_t v6 = [v5 asDocument];

  return v6;
}

- (BOOL)evictInTask:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCAliasItem;
  if ([(BRCLocalItem *)&v12 evictInTask:v8 options:a4 error:a5])
  {
    char v9 = [(BRCAliasItem *)self targetDocument];
    char v10 = [v9 evictInTask:v8 options:a4 error:a5];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BRCAliasItem;
  if ([(BRCLocalItem *)&v18 startDownloadInTask:v12 options:a4 etagIfLoser:v13 stageFileName:v14 error:a7])
  {
    __int16 v15 = [(BRCAliasItem *)self targetDocument];
    char v16 = [v15 startDownloadInTask:v12 options:a4 etagIfLoser:v13 stageFileName:v14 error:a7];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

+ (id)targetReferenceWithItemID:(id)a3 targetZone:(id)a4 isFolderShare:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  char v9 = [v8 zoneID];
  if (a5)
  {
    char v10 = @"directory/";
  }
  else
  {
    int v11 = [v8 isSharedZone];
    char v10 = @"documentStructure/";
    if (v11) {
      char v10 = @"documentContent/";
    }
  }
  id v12 = v10;
  id v13 = [v7 itemIDString];
  id v14 = [(__CFString *)v12 stringByAppendingString:v13];

  __int16 v15 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v14 zoneID:v9];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v15 action:0];

  return v16;
}

+ (void)fillStructureRecord:(id)a3 inZone:(id)a4 itemID:(id)a5 ckInfo:(id)a6 parentID:(id)a7 targetItemID:(id)a8 targetZone:(id)a9 diffs:(unint64_t)a10 isFolderShare:(BOOL)a11 beingDeadInServerTruth:(BOOL)a12 shouldPCSChainStatus:(unsigned __int8)a13
{
  id v33 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  if (a12)
  {
    BOOL v24 = 1;
  }
  else
  {
    BOOL v25 = [v20 etag];
    BOOL v24 = v25 == 0;
  }
  if ((a13 & 0x2C) != 0 || (a10 & 0x20) != 0 || v24)
  {
    int64_t v26 = [v21 validatingDirectoryReferenceInZone:v18];
    [v33 setObject:v26 forKeyedSubscript:@"parent"];

    if ((a13 & 0x3C) != 0)
    {
      int64_t v27 = [v21 pcsChainParentReferenceInZone:v18];
      [v33 setParent:v27];
    }
  }
  if (v24)
  {
    if ([v23 isPrivateZone]) {
      uint64_t v28 = v22;
    }
    else {
      uint64_t v28 = v19;
    }
    int v29 = [v28 itemIDString];
    int v30 = objc_msgSend(v29, "brc_SHA256");
    [v33 setObject:v30 forKeyedSubscript:@"basehash"];

    v31 = [a1 targetReferenceWithItemID:v22 targetZone:v23 isFolderShare:a11];
    [v33 setObject:v31 forKeyedSubscript:@"target"];
  }
  if (!a12) {
    [v33 serializeSystemFields:v20];
  }
}

- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 stageID:(id)a4 shouldPCSChainStatus:(unsigned __int8)a5
{
  uint64_t v6 = [(BRCLocalItem *)self baseStructureRecord];
  id v7 = objc_opt_class();
  serverZone = self->super._serverZone;
  itemID = self->super._itemID;
  char v10 = [(BRCStatInfo *)self->super._st ckInfo];
  int v11 = [(BRCStatInfo *)self->super._st parentID];
  id v12 = [(BRCAliasItem *)self targetItemID];
  id v13 = [(BRCAliasItem *)self targetClientZone];
  id v14 = [v13 serverZone];
  BYTE2(v16) = a5;
  BYTE1(v16) = a3;
  LOBYTE(v16) = 0;
  objc_msgSend(v7, "fillStructureRecord:inZone:itemID:ckInfo:parentID:targetItemID:targetZone:diffs:isFolderShare:beingDeadInServerTruth:shouldPCSChainStatus:", v6, serverZone, itemID, v10, v11, v12, v14, self->super._localDiffs | -[BRCLocalItem diffAgainstOriginalItem](self, "diffAgainstOriginalItem"), v16);

  return v6;
}

- (void)isBRAlias
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _st.type == BRC_ITEM_TYPE_ALIAS%@", (uint8_t *)&v2, 0xCu);
}

- (void)markLatestSyncRequestRejectedInZone:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Forcing rejection of alias item%@", (uint8_t *)&v2, 0xCu);
}

@end