@interface BRCSymlinkItem
- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4;
- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4;
- (BOOL)isSymLink;
- (NSString)symlinkTarget;
- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6;
- (id)_initWithLocalItem:(id)a3;
- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4;
- (id)descriptionWithContext:(id)a3;
- (unint64_t)diffAgainstLocalItem:(id)a3;
- (unint64_t)diffAgainstServerItem:(id)a3;
- (void)readTargetFromRelativePathAndSyncUp:(id)a3;
- (void)updateSymlinkTarget:(id)a3;
@end

@implementation BRCSymlinkItem

- (void)readTargetFromRelativePathAndSyncUp:(id)a3
{
  id v4 = a3;
  p_symlinkTarget = &self->_symlinkTarget;
  symlinkTarget = self->_symlinkTarget;
  v7 = [v4 symlinkContent];
  v8 = symlinkTarget;
  v9 = v7;
  if (v8 == v9)
  {
  }
  else
  {
    v10 = v9;
    if (!v9)
    {

LABEL_10:
      uint64_t v14 = [v4 symlinkContent];
      v15 = *p_symlinkTarget;
      *p_symlinkTarget = (NSString *)v14;

      v16 = brc_bread_crumbs();
      v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        [(BRCSymlinkItem(LegacyAdditions) *)(uint64_t *)&self->_symlinkTarget readTargetFromRelativePathAndSyncUp:v17];
      }

      [(BRCLocalItem *)self markNeedsUploadOrSyncingUp];
      goto LABEL_13;
    }
    char v11 = [(NSString *)v8 isEqual:v9];

    if ((v11 & 1) == 0) {
      goto LABEL_10;
    }
  }
  v12 = brc_bread_crumbs();
  v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[BRCSymlinkItem(LegacyAdditions) readTargetFromRelativePathAndSyncUp:]((uint64_t)v12, v13);
  }

LABEL_13:
}

- (BOOL)isSymLink
{
  return 1;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCSymlinkItem;
  v7 = [(BRCLocalItem *)&v11 _initWithServerItem:v6 dbRowID:a4];
  if (v7)
  {
    uint64_t v8 = [v6 symlinkTarget];
    v9 = (void *)v7[25];
    v7[25] = v8;
  }
  return v7;
}

- (id)_initWithLocalItem:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCSymlinkItem;
  v5 = [(BRCLocalItem *)&v10 _initWithLocalItem:v4];
  if (v5)
  {
    id v6 = [v4 asSymlink];
    uint64_t v7 = [v6 symlinkTarget];
    uint64_t v8 = (void *)v5[25];
    v5[25] = v7;
  }
  return v5;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCSymlinkItem;
  objc_super v11 = [(BRCLocalItem *)&v15 _initFromPQLResultSet:v10 session:a4 db:a5 error:a6];
  if (v11)
  {
    uint64_t v12 = [v10 objectOfClass:objc_opt_class() atIndex:39];
    v13 = (void *)v11[25];
    v11[25] = v12;
  }
  return v11;
}

- (id)descriptionWithContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BRCSymlinkItem;
  id v4 = [(BRCLocalItem *)&v7 descriptionWithContext:a3];
  v5 = [(NSString *)self->_symlinkTarget fp_obfuscatedPath];
  [v4 appendFormat:@" target:'%@'", v5];

  return v4;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCSymlinkItem;
  unint64_t v5 = [(BRCLocalItem *)&v15 diffAgainstServerItem:v4];
  if (v4 && ([v4 isSymLink] & 1) == 0)
  {
    v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCSymlinkItem diffAgainstServerItem:]((uint64_t)v13, v14);
    }
  }
  if ([v4 isSymLink] && (v5 & 0x2000) == 0)
  {
    symlinkTarget = self->_symlinkTarget;
    objc_super v7 = [v4 symlinkTarget];
    uint64_t v8 = symlinkTarget;
    v9 = v7;
    id v10 = v9;
    if (v8 == v9)
    {
      int v11 = 0;
    }
    else if (v9)
    {
      int v11 = [(NSString *)v8 isEqual:v9] ^ 1;
    }
    else
    {
      int v11 = 1;
    }

    if (v11) {
      v5 |= 0x2000uLL;
    }
  }

  return v5;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCSymlinkItem;
  unint64_t v5 = [(BRCLocalItem *)&v17 diffAgainstLocalItem:v4];
  if (v4 && ([v4 isSymLink] & 1) == 0)
  {
    objc_super v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCSymlinkItem diffAgainstServerItem:]((uint64_t)v15, v16);
    }
  }
  if ([v4 isSymLink])
  {
    id v6 = [v4 asSymlink];
    objc_super v7 = v6;
    if ((v5 & 0x2000) == 0)
    {
      symlinkTarget = self->_symlinkTarget;
      v9 = [v6 symlinkTarget];
      id v10 = symlinkTarget;
      int v11 = v9;
      uint64_t v12 = v11;
      if (v10 == v11)
      {
        int v13 = 0;
      }
      else if (v11)
      {
        int v13 = [(NSString *)v10 isEqual:v11] ^ 1;
      }
      else
      {
        int v13 = 1;
      }

      if (v13) {
        v5 |= 0x2000uLL;
      }
    }
  }
  else
  {
    v5 |= 0x2000uLL;
  }

  return v5;
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  id v51 = a3;
  v50 = [(BRCClientZone *)self->super._clientZone dbRowID];
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  unint64_t sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  unint64_t localDiffs = self->super._localDiffs;
  unint64_t notifsRank = self->super._notifsRank;
  uint64_t syncUpState = self->super._syncUpState;
  v41 = [(BRCLocalItem *)self appLibrary];
  v49 = [v41 dbRowID];
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  BOOL isUserVisible = self->super._isUserVisible;
  v47 = [(BRCStatInfo *)self->super._st ckInfo];
  int v30 = [(BRCStatInfo *)self->super._st state];
  int v29 = [(BRCStatInfo *)self->super._st type];
  int v27 = [(BRCStatInfo *)self->super._st mode];
  int64_t v28 = [(BRCStatInfo *)self->super._st birthtime];
  int64_t v26 = [(BRCStatInfo *)self->super._st lastUsedTime];
  int64_t v25 = [(BRCStatInfo *)self->super._st favoriteRank];
  v48 = [(BRCStatInfo *)self->super._st parentID];
  st = self->super._st;
  logicalName = (__CFString *)st->super._logicalName;
  if (!logicalName) {
    logicalName = &stru_1F2AC7720;
  }
  v24 = logicalName;
  BOOL v22 = [(BRCStatInfo *)st isHiddenExt];
  v45 = [(BRCStatInfo *)self->super._st finderTags];
  v46 = [(BRCStatInfo *)self->super._st xattrSignature];
  v43 = [(BRCStatInfo *)self->super._st trashPutBackPath];
  v44 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
  v23 = [(BRCStatInfo *)self->super._st aliasTarget];
  v20 = [(BRCStatInfo *)self->super._st creatorRowID];
  v19 = [(BRCLocalStatInfo *)self->super._st documentID];
  objc_super v7 = [(BRCLocalStatInfo *)self->super._st fileID];
  uint64_t v8 = [(BRCLocalStatInfo *)self->super._st generationID];
  v9 = [(BRCLocalStatInfo *)self->super._st physicalName];
  id v10 = [(BRCLocalStatInfo *)self->super._st processingStamp];
  int v11 = [(BRCLocalStatInfo *)self->super._st stagedFileIDForDB];
  uint64_t v12 = [(BRCLocalStatInfo *)self->super._st stagedGenerationID];
  int v13 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
  unsigned int v14 = [(BRCLocalStatInfo *)self->super._st itemScope];
  v18 = [(BRCLocalStatInfo *)self->super._st tmpBouncedNo];
  objc_super v17 = [(BRCSymlinkItem *)self symlinkTarget];
  int v40 = objc_msgSend(v51, "execute:", @"INSERT INTO client_items(rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name) VALUES(%lld, %@, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %u, %@, %d, %@, %@)", a4, v50, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v49, minimumSupportedOSRowID, isUserVisible, v47, v30, v29,
          v27,
          v28,
          v26,
          v25,
          v48,
          v24,
          v22,
          v45,
          v46,
          v43,
          v44,
          v23,
          v20,
          v19,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12,
          v13,
          v14,
          v18,
          v17);

  if (v40)
  {
    v52.receiver = self;
    v52.super_class = (Class)BRCSymlinkItem;
    BOOL v15 = [(BRCLocalItem *)&v52 _insertInDB:v51 dbRowID:a4];
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  id v51 = a3;
  v50 = [(BRCClientZone *)self->super._clientZone dbRowID];
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  unint64_t sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  unint64_t localDiffs = self->super._localDiffs;
  unint64_t notifsRank = self->super._notifsRank;
  uint64_t syncUpState = self->super._syncUpState;
  v43 = [(BRCLocalItem *)self appLibrary];
  v47 = [v43 dbRowID];
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  BOOL isUserVisible = self->super._isUserVisible;
  v49 = [(BRCStatInfo *)self->super._st ckInfo];
  int v31 = [(BRCStatInfo *)self->super._st state];
  int v32 = [(BRCStatInfo *)self->super._st type];
  int v30 = [(BRCStatInfo *)self->super._st mode];
  int64_t v29 = [(BRCStatInfo *)self->super._st birthtime];
  int64_t v28 = [(BRCStatInfo *)self->super._st lastUsedTime];
  int64_t v27 = [(BRCStatInfo *)self->super._st favoriteRank];
  v48 = [(BRCStatInfo *)self->super._st parentID];
  st = self->super._st;
  logicalName = (__CFString *)st->super._logicalName;
  if (!logicalName) {
    logicalName = &stru_1F2AC7720;
  }
  int64_t v25 = logicalName;
  BOOL v23 = [(BRCStatInfo *)st isHiddenExt];
  v46 = [(BRCStatInfo *)self->super._st finderTags];
  v45 = [(BRCStatInfo *)self->super._st xattrSignature];
  v44 = [(BRCStatInfo *)self->super._st trashPutBackPath];
  int64_t v26 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
  v24 = [(BRCStatInfo *)self->super._st aliasTarget];
  v21 = [(BRCStatInfo *)self->super._st creatorRowID];
  v20 = [(BRCLocalStatInfo *)self->super._st documentID];
  objc_super v7 = [(BRCLocalStatInfo *)self->super._st fileID];
  uint64_t v8 = [(BRCLocalStatInfo *)self->super._st generationID];
  v9 = [(BRCLocalStatInfo *)self->super._st physicalName];
  id v10 = [(BRCLocalStatInfo *)self->super._st processingStamp];
  int v11 = [(BRCLocalStatInfo *)self->super._st stagedFileIDForDB];
  uint64_t v12 = [(BRCLocalStatInfo *)self->super._st stagedGenerationID];
  v19 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
  unsigned int v13 = [(BRCLocalStatInfo *)self->super._st itemScope];
  v18 = [(BRCLocalStatInfo *)self->super._st tmpBouncedNo];
  objc_super v17 = [(BRCSymlinkItem *)self symlinkTarget];
  int v42 = objc_msgSend(v51, "execute:", @"UPDATE client_items SET  zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_doc_id = %@, item_file_id = %@, item_generation = %@, item_localname = %@, item_processing_stamp = %@, item_staged_file_id = %@, item_staged_generation = %u, item_bouncedname = %@, item_scope = %d, item_tmpbounceno = %@, version_name = %@  WHERE rowid = %llu", v50, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v47, minimumSupportedOSRowID, isUserVisible, v49, v31, v32, v30,
          v29,
          v28,
          v27,
          v48,
          v25,
          v23,
          v46,
          v45,
          v44,
          v26,
          v24,
          v21,
          v20,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12,
          v19,
          v13,
          v18,
          v17,
          self->super._dbRowID);

  if (v42)
  {
    v52.receiver = self;
    v52.super_class = (Class)BRCSymlinkItem;
    BOOL v14 = [(BRCLocalItem *)&v52 _updateInDB:v51 diffs:a4];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)updateSymlinkTarget:(id)a3
{
}

- (NSString)symlinkTarget
{
  return self->_symlinkTarget;
}

- (void).cxx_destruct
{
}

- (void)diffAgainstServerItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !info || info.isSymLink%@", (uint8_t *)&v2, 0xCu);
}

@end