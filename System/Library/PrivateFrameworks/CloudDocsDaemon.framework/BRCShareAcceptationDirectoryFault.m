@interface BRCShareAcceptationDirectoryFault
- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4;
- (BOOL)isShareAcceptationFault;
- (BRCShareAcceptationDirectoryFault)initWithFilename:(id)a3 itemID:(id)a4 parentIDWhenSubitem:(id)a5 appLibrary:(id)a6 clientZone:(id)a7 sharingOptions:(unint64_t)a8;
- (void)deleteShareAcceptationFault;
- (void)markLiveFromStageAsShareAcceptationFault;
- (void)markNeedsTransformIntoNormalFault;
- (void)stageShareAcceptationFaultWithName:(id)a3;
@end

@implementation BRCShareAcceptationDirectoryFault

- (BRCShareAcceptationDirectoryFault)initWithFilename:(id)a3 itemID:(id)a4 parentIDWhenSubitem:(id)a5 appLibrary:(id)a6 clientZone:(id)a7 sharingOptions:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v39.receiver = self;
  v39.super_class = (Class)BRCShareAcceptationDirectoryFault;
  v19 = [(BRCShareAcceptationDirectoryFault *)&v39 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->super.super._itemID, a4);
    v21 = [[BRCLocalStatInfo alloc] initAsShareAcceptFaultWithName:v14 mode:(a8 & 0x20) == 0 isDirectory:1];
    st = v20->super.super._st;
    v20->super.super._st = v21;

    id v38 = v15;
    if (v16)
    {
      id v23 = v16;
      uint64_t v37 = 0;
    }
    else
    {
      id v23 = [v17 documentsFolderItemID];
      uint64_t v37 = 4;
    }
    [(BRCStatInfo *)v20->super.super._st setParentID:v23];
    v24 = [v17 defaultClientZone];
    uint64_t v25 = [v24 dbRowID];
    parentZoneRowID = v20->super.super._parentZoneRowID;
    v20->super.super._parentZoneRowID = (BRCZoneRowID *)v25;

    [(BRCLocalItem *)v20 setAppLibrary:v17];
    objc_storeStrong((id *)&v20->super.super._clientZone, a7);
    v20->super.super._serverZone = (BRCServerZone *)[(BRCClientZone *)v20->super.super._clientZone serverZone];
    uint64_t v27 = [(BRCClientZone *)v20->super.super._clientZone db];
    db = v20->super.super._db;
    v20->super.super._db = (BRCPQLConnection *)v27;

    v29 = (BRCAccountSession *)(id)[v17 session];
    v20->super.super._session = v29;
    v30 = [v18 ownerName];
    v31 = [(BRCAccountSession *)v20->super.super._session clientDB];
    uint64_t v32 = [(BRCAccountSession *)v29 userKeyForOwnerName:v30 db:v31];
    ownerKey = v20->super.super._ownerKey;
    v20->super.super._ownerKey = (BRCUserRowID *)v32;

    [(BRCStatInfo *)v20->super.super._st setBirthtime:time(0)];
    [(BRCLocalStatInfo *)v20->super.super._st setItemScope:2];
    [(BRCStatInfo *)v20->super.super._st setState:4294967294];
    [(BRCStatInfo *)v20->super.super._st setHiddenExt:1];
    v34 = [MEMORY[0x1E4F1C9C8] date];
    [v34 timeIntervalSince1970];
    [(BRCStatInfo *)v20->super.super._st setLastUsedTime:(uint64_t)v35];

    [(BRCDirectoryItem *)v20 setMtime:[(BRCStatInfo *)v20->super.super._st lastUsedTime]];
    v20->super.super._sharingOptions = v37 | a8;
    v20->super.super._isUserVisible = 1;

    id v15 = v38;
  }

  return v20;
}

- (BOOL)isShareAcceptationFault
{
  return 1;
}

- (void)markLiveFromStageAsShareAcceptationFault
{
  v3 = [(BRCLocalStatInfo *)self->super.super._st stagedFileID];
  uint64_t v4 = [v3 unsignedLongLongValue];
  v5 = [(BRCLocalStatInfo *)self->super.super._st fileID];
  -[BRCLocalItem applyMetadataOnFileID:liveFD:sharingOptions:](self, "applyMetadataOnFileID:liveFD:sharingOptions:", v4, [v5 unsignedLongLongValue], -[BRCLocalItem sharingOptions](self, "sharingOptions"));

  st = self->super.super._st;
  [(BRCLocalStatInfo *)st _markLiveFromStageAsType:10];
}

- (void)stageShareAcceptationFaultWithName:(id)a3
{
  uint64_t v11 = 0;
  unsigned int v10 = 0;
  uint64_t v4 = [(BRCAccountSession *)self->super.super._session stageRegistry];
  id v9 = 0;
  char v5 = [v4 makeDirectoryInStageGatherFileID:&v11 generationID:&v10 error:&v9];
  id v6 = v9;

  if (v5)
  {
    [(BRCLocalItem *)self markStagedWithFileID:v11 generationID:v10];
  }
  else
  {
    v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      -[BRCShareAcceptationDirectoryFault stageShareAcceptationFaultWithName:]();
    }
  }
}

- (void)deleteShareAcceptationFault
{
  if ([(BRCShareAcceptationDirectoryFault *)self isShareAcceptationFault])
  {
    v7 = [[BRCItemToPathLookup alloc] initWithItem:self];
    v3 = [(BRCItemToPathLookup *)v7 byFileSystemID];
    if ([v3 isFault])
    {
      uint64_t v4 = [(BRCAccountSession *)self->super.super._session diskReclaimer];
      [v4 renameAndUnlinkInBackgroundItemAtRelpath:v3];
    }
    [(BRCItemToPathLookup *)v7 closePaths];
    [(BRCLocalItem *)self markDead];
    [(BRCLocalItem *)self saveToDB];
  }
  else
  {
    char v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCShareAcceptationDocumentFault deleteShareAcceptationFault]();
    }
  }
}

- (void)markNeedsTransformIntoNormalFault
{
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCShareAcceptationDirectoryFault;
  unsigned int v7 = [(BRCDirectoryItem *)&v14 _updateInDB:v6 diffs:a4];
  int v8 = [(BRCStatInfo *)self->super.super._st type];
  if (v8 == 9) {
    char v9 = 0;
  }
  else {
    char v9 = v7;
  }
  if (v8 == 9 && v7 != 0)
  {
    itemID = self->super.super._itemID;
    v12 = [(BRCClientZone *)self->super.super._clientZone dbRowID];
    char v9 = [v6 execute:@"UPDATE client_items SET item_type = 9 WHERE item_id = %@ AND zone_rowid = %@ AND item_type = 10", itemID, v12];
  }
  return v9;
}

- (void)stageShareAcceptationFaultWithName:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to create directory in stage %@%@", v1, 0x16u);
}

@end