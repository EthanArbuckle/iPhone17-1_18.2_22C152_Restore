@interface BRCDirectoryItem
- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4;
- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4;
- (BOOL)_insertRecursiveProperties;
- (BOOL)_markChildrenLostForDeadParent;
- (BOOL)_recomputeChildItemCount;
- (BOOL)_repopulateRecursivePropertiesIfNecessary;
- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4;
- (BOOL)_updateRecursiveProperties;
- (BOOL)changedAtRelativePath:(id)a3 scanPackage:(BOOL)a4;
- (BOOL)containsDirFault;
- (BOOL)containsFault;
- (BOOL)containsOverQuotaItems;
- (BOOL)containsPendingDeleteDocuments;
- (BOOL)containsPendingDownload;
- (BOOL)containsPendingUploadOrSyncUp;
- (BOOL)evictInTask:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)hasDeadChildren;
- (BOOL)hasLiveChildren;
- (BOOL)hasLostChildren;
- (BOOL)hasPendingLostChildren;
- (BOOL)hasShareIDAndIsOwnedByMe;
- (BOOL)isAppLibraryTrashFolder;
- (BOOL)isCrossZoneMoveTombstone;
- (BOOL)isDirectory;
- (BOOL)isDirectoryFault;
- (BOOL)isDirectoryWithPackageName;
- (BOOL)isShareableItem;
- (BOOL)isSharedByMeOrContainsSharedByMeItem;
- (BOOL)isSharedToMeOrContainsSharedToMeItem;
- (BOOL)markChildrenLost;
- (BOOL)possiblyContainsSharedItem;
- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7;
- (BOOL)updateFromFSAtPath:(id)a3 parentGlobalID:(id)a4;
- (BOOL)updateLocationAndMetaFromFSAtPath:(id)a3 parentGlobalID:(id)a4;
- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6;
- (id)_initWithLocalItem:(id)a3;
- (id)_initWithRelativePath:(id)a3 parentGlobalID:(id)a4;
- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4;
- (id)_serverChildItemCount;
- (id)_serverChildItemCountIncludingHiddenFiles;
- (id)asShareableItem;
- (id)childItemCount;
- (id)clientZonesChildrenNeedingSyncUpAreIn;
- (id)collaborationIdentifierIfComputable;
- (id)descriptionWithContext:(id)a3;
- (id)folderAppLibraryRootRecord;
- (id)folderRootStructureRecord;
- (id)serverQuotaUsage;
- (int64_t)mtime;
- (unint64_t)diffAgainstLocalItem:(id)a3;
- (unint64_t)diffAgainstServerItem:(id)a3;
- (void)_learnItemID:(id)a3 serverItem:(id)a4;
- (void)_markLostDirectoryAsAlmostDead;
- (void)_retryPostponedIfNeededForDiffs:(unint64_t)a3;
- (void)_updateRecursiveProperties;
- (void)asShareableItem;
- (void)isDirectory;
- (void)markNeedsDeleteForItemIDTransfer;
- (void)markRemovedFromFilesystemForServerEdit:(BOOL)a3;
- (void)prepareForSyncUpInZone:(id)a3;
- (void)setMtime:(int64_t)a3;
- (void)transformIntoFSRoot;
- (void)updateItemMetadataFromServerItem:(id)a3 appliedSharingPermission:(BOOL)a4;
@end

@implementation BRCDirectoryItem

- (BOOL)containsFault
{
  id v2 = [(PQLConnection *)self->super._db numberWithSQL:@"SELECT faults_count FROM item_recursive_properties WHERE item_rowid = %llu", self->super._dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)containsPendingDownload
{
  id v2 = [(PQLConnection *)self->super._db numberWithSQL:@"SELECT 1 FROM item_recursive_properties WHERE item_rowid = %llu AND (needs_download_count != 0 OR needs_dl_unstage_count != 0)", self->super._dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)updateFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_relocationCheck(self, v7))
  {
    if ([v6 type] == 3)
    {
      v8 = [v6 appLibrary];
      if (([v8 isiCloudDesktopAppLibrary] & 1) == 0)
      {
        v15 = brc_bread_crumbs();
        v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[BRCDirectoryItem(LegacyAdditions) updateFromFSAtPath:parentGlobalID:]();
        }
      }
      if (![(BRCLocalItem *)self isFSRoot])
      {
        v9 = [v8 fetchRootItem];
        if (v9)
        {
          v10 = brc_bread_crumbs();
          v11 = brc_default_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
            -[BRCDirectoryItem(LegacyAdditions) updateFromFSAtPath:parentGlobalID:]();
          }
        }
        [(BRCStatInfo *)self->super._st setType:4];
      }
      [v8 updateFromFSAtPath:v6];
    }
    else
    {
      if (![(BRCLocalItem *)self isFSRoot])
      {
LABEL_16:
        v17.receiver = self;
        v17.super_class = (Class)BRCDirectoryItem;
        BOOL v12 = [(BRCLocalItem *)&v17 updateFromFSAtPath:v6 parentGlobalID:v7];
        goto LABEL_17;
      }
      v8 = [(BRCLocalItem *)self appLibrary];
      [(BRCStatInfo *)self->super._st setType:0];
      if ([v8 isiCloudDesktopAppLibrary])
      {
        v13 = [v6 appLibrary];
        [v13 fsrootDidMoveToPath:v6];
      }
    }

    goto LABEL_16;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)updateLocationAndMetaFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_relocationCheck(self, v7))
  {
    v10.receiver = self;
    v10.super_class = (Class)BRCDirectoryItem;
    BOOL v8 = [(BRCLocalItem *)&v10 updateLocationAndMetaFromFSAtPath:v6 parentGlobalID:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_initWithRelativePath:(id)a3 parentGlobalID:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCDirectoryItem;
  id v7 = [(BRCLocalItem *)&v9 _initWithRelativePath:v6 parentGlobalID:a4];
  if (v7) {
    v7[25] = [v6 modificationTime];
  }

  return v7;
}

- (BOOL)hasLostChildren
{
  db = self->super._db;
  itemID = self->super._itemID;
  v4 = [(BRCClientZone *)self->super._clientZone dbRowID];
  id v5 = [(PQLConnection *)db numberWithSQL:@"SELECT 1 FROM client_items WHERE item_parent_id = %@    AND item_state IN (-1, -3)   AND item_parent_zone_rowid = %@ LIMIT 1", itemID, v4];

  LOBYTE(v4) = [v5 BOOLValue];
  return (char)v4;
}

- (BOOL)hasPendingLostChildren
{
  db = self->super._db;
  v4 = [(BRCClientZone *)self->super._clientZone dbRowID];
  id v5 = [(PQLConnection *)db numberWithSQL:@"SELECT 1 FROM mark_children_lost_progress WHERE zone_rowid = %@ AND item_parent_id = %@ LIMIT 1", v4, self->super._itemID];

  LOBYTE(db) = [v5 BOOLValue];
  return (char)db;
}

- (BOOL)markChildrenLost
{
  char v3 = [(BRCLocalItem *)self appLibrary];
  itemID = self->super._itemID;
  clientZone = self->super._clientZone;
  id v6 = [(BRCLocalItem *)self fileID];
  LOBYTE(itemID) = [v3 markChildrenLostForItemID:itemID inZone:clientZone fileID:v6];

  return (char)itemID;
}

- (BOOL)_markChildrenLostForDeadParent
{
  id v2 = self;
  char v3 = [(BRCLocalItem *)self appLibrary];
  LOBYTE(v2) = [v3 markChildrenLostForItemID:v2->super._itemID inZone:v2->super._clientZone fileID:0];

  return (char)v2;
}

- (void)_markLostDirectoryAsAlmostDead
{
  if (![(BRCLocalItem *)self isLost])
  {
    char v3 = brc_bread_crumbs();
    v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem(LegacyAdditions) _markLostDirectoryAsAlmostDead]();
    }
  }
  [(BRCLocalItem *)self _removeSharedSpotlightAttributesIfNecessary];
  [(BRCLocalStatInfo *)self->super._st _markAlmostDead];
  self->super._isUserVisible = 0;
}

- (void)markRemovedFromFilesystemForServerEdit:(BOOL)a3
{
  if (a3)
  {
    if ([(BRCLocalItem *)self isReserved])
    {
      [(BRCLocalItem *)self markLostWhenReplacedByItem:0];
      [(BRCLocalItem *)self moveAsideLocally];
      [(BRCDirectoryItem *)self _markLostDirectoryAsAlmostDead];
    }
    else
    {
      -[BRCLocalItem markRemovedFromFilesystemForServerEdit:](&v11, sel_markRemovedFromFilesystemForServerEdit_, 1, self, BRCDirectoryItem, v12.receiver, v12.super_class);
    }
    return;
  }
  if ([(BRCDirectoryItem *)self containsDirFault])
  {
    v4 = [(BRCStatInfo *)self->super._st ckInfo];
    if ([v4 hasDeletionChangeToken])
    {
LABEL_12:

      goto LABEL_13;
    }
    BOOL v5 = [(BRCLocalItem *)self isSharedToMeTopLevelItem];

    if (!v5)
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        [(BRCDirectoryItem(LegacyAdditions) *)(uint64_t)self markRemovedFromFilesystemForServerEdit:v7];
      }

      v4 = [(BRCServerZone *)self->super._serverZone changeState];
      BOOL v8 = [v4 changeToken];
      objc_super v9 = [v8 data];
      objc_super v10 = [(BRCStatInfo *)self->super._st ckInfo];
      [v10 setDeletionChangeToken:v9];

      goto LABEL_12;
    }
  }
LABEL_13:
  if ([(BRCDirectoryItem *)self hasPendingLostChildren]
    || [(BRCDirectoryItem *)self _markChildrenLostForDeadParent]
    || [(BRCDirectoryItem *)self hasLostChildren]
    || [(BRCLocalItem *)self isSharedToMeChildItem]
    && ![(BRCLocalItem *)self isAlmostDead])
  {
    [(BRCLocalItem *)self markLostClearGenerationID:1 backoffMode:2];
    [(BRCDirectoryItem *)self _markLostDirectoryAsAlmostDead];
  }
  else
  {
    -[BRCLocalItem markRemovedFromFilesystemForServerEdit:](&v12, sel_markRemovedFromFilesystemForServerEdit_, 0, v11.receiver, v11.super_class, self, BRCDirectoryItem);
  }
}

- (BOOL)changedAtRelativePath:(id)a3 scanPackage:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  memset(v14, 0, sizeof(v14));
  __brc_create_section(0, (uint64_t)"-[BRCDirectoryItem(LegacyAdditions) changedAtRelativePath:scanPackage:]", 196, v14);
  id v7 = brc_bread_crumbs();
  BOOL v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v16 = v14[0];
    __int16 v17 = 2112;
    v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx diffing item %@\nagainst %@%@", buf, 0x2Au);
  }

  if (([v6 isDocument] & 1) != 0 || objc_msgSend(v6, "isBRAlias"))
  {
    objc_super v9 = brc_bread_crumbs();
    objc_super v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCDirectoryItem(LegacyAdditions) changedAtRelativePath:scanPackage:]();
    }
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BRCDirectoryItem;
    if ([(BRCLocalItem *)&v13 changedAtRelativePath:v6 scanPackage:v4])
    {
      BOOL v11 = 1;
      goto LABEL_9;
    }
    objc_super v9 = brc_bread_crumbs();
    objc_super v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCDirectoryItem(LegacyAdditions) changedAtRelativePath:scanPackage:]();
    }
    BOOL v11 = 0;
  }

LABEL_9:
  __brc_leave_section(v14);

  return v11;
}

- (BOOL)evictInTask:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCDirectoryItem;
  BOOL v9 = [(BRCLocalItem *)&v17 evictInTask:v8 options:a4 error:a5];
  if (v9)
  {
    objc_super v10 = [[BRCTreeEnumerator alloc] initWithSession:self->super._session tracker:v8];
    itemID = self->super._itemID;
    objc_super v12 = [(BRCLocalItem *)self appLibrary];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__BRCDirectoryItem_LegacyAdditions__evictInTask_options_error___block_invoke;
    uint64_t v14[3] = &unk_1E6993AD8;
    id v15 = v8;
    unint64_t v16 = a4;
    [(BRCTreeEnumerator *)v10 enumerateBelow:itemID appLibrary:v12 recursively:1 handler:v14];
  }
  return v9;
}

uint64_t __63__BRCDirectoryItem_LegacyAdditions__evictInTask_options_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    if (v12) {
      goto LABEL_6;
    }
    goto LABEL_3;
  }
  v26 = brc_bread_crumbs();
  v27 = brc_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
    -[BRCDirectoryItem(LegacyAdditions) startDownloadInTask:options:etagIfLoser:stageFileName:error:]();
  }

  if (!v12)
  {
LABEL_3:
    id v15 = brc_bread_crumbs();
    unint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem(LegacyAdditions) startDownloadInTask:options:etagIfLoser:stageFileName:error:]();
    }
  }
LABEL_6:
  v35.receiver = self;
  v35.super_class = (Class)BRCDirectoryItem;
  BOOL v17 = [(BRCLocalItem *)&v35 startDownloadInTask:v12 options:a4 etagIfLoser:v13 stageFileName:v14 error:a7];
  if (v17)
  {
    v18 = [(BRCLocalItem *)self appLibrary];
    __int16 v19 = [v18 transferSyncContext];
    id v20 = [v19 downloadStream];

    if ((a4 & 8) != 0) {
      [v20 startSchedulingMultipleItemsInteractively];
    }
    __int16 v21 = [[BRCTreeEnumerator alloc] initWithSession:self->super._session tracker:v12];
    itemID = self->super._itemID;
    uint64_t v23 = [(BRCLocalItem *)self appLibrary];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __97__BRCDirectoryItem_LegacyAdditions__startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke;
    v31[3] = &unk_1E6993B00;
    id v32 = v12;
    unint64_t v34 = a4;
    id v33 = v14;
    [(BRCTreeEnumerator *)v21 enumerateBelow:itemID appLibrary:v23 recursively:1 handler:v31];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __97__BRCDirectoryItem_LegacyAdditions__startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke_2;
    v28[3] = &unk_1E6993B28;
    id v29 = v20;
    unint64_t v30 = a4;
    id v24 = v20;
    [(BRCTreeEnumerator *)v21 setCompletionHandler:v28];
  }
  return v17;
}

uint64_t __97__BRCDirectoryItem_LegacyAdditions__startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke(void *a1, void *a2)
{
  return 0;
}

uint64_t __97__BRCDirectoryItem_LegacyAdditions__startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke_2(uint64_t result)
{
  if ((*(unsigned char *)(result + 40) & 8) != 0) {
    return [*(id *)(result + 32) endSchedulingMultipleItemsInteractively];
  }
  return result;
}

- (id)folderRootStructureRecord
{
  if ([(BRCDirectoryItem *)self isDirectory])
  {
    char v3 = [(BRCLocalItem *)self itemID];
    BOOL v4 = objc_msgSend(v3, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", -[BRCStatInfo type](self->super._st, "type"), self->super._serverZone, 1);

    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"structure" recordID:v4];
  }
  else
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem(CKConversions) folderRootStructureRecord]();
    }

    BOOL v5 = 0;
  }
  return v5;
}

- (id)folderAppLibraryRootRecord
{
  char v3 = [(BRCLocalItem *)self clientZone];
  if (![v3 isPrivateZone]) {
    goto LABEL_6;
  }
  BOOL v4 = [(BRCLocalItem *)self appLibrary];
  if (([v4 wasMovedToCloudDocs] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  BOOL v5 = [(BRCLocalItem *)self appLibrary];
  char v6 = [v5 isCloudDocsAppLibrary];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1E4F1A2D8];
    id v8 = [(BRCLocalItem *)self appLibrary];
    BOOL v9 = [v8 mangledID];
    objc_super v10 = [(BRCLocalItem *)self structureRecordID];
    BOOL v11 = [v10 zoneID];
    id v12 = [v7 rootAppLibraryRecordForAppLibraryID:v9 zoneID:v11];

    goto LABEL_8;
  }
LABEL_7:
  id v13 = (void *)MEMORY[0x1E4F1A2D8];
  id v8 = [(BRCLocalItem *)self structureRecordID];
  BOOL v9 = [v8 zoneID];
  id v12 = [v13 rootDirectoryRecordForZoneID:v9];
LABEL_8:

  return v12;
}

- (BOOL)isDirectory
{
  unsigned int v2 = [(BRCStatInfo *)self->super._st type];
  if (v2 > 0xA || ((1 << v2) & 0x611) == 0)
  {
    BOOL v4 = brc_bread_crumbs();
    BOOL v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem isDirectory]();
    }
  }
  return 1;
}

- (BOOL)isDirectoryFault
{
  unsigned int v3 = [(BRCStatInfo *)self->super._st type];
  if (v3 > 0xA || ((1 << v3) & 0x611) == 0)
  {
    BOOL v5 = brc_bread_crumbs();
    char v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem isDirectory]();
    }
  }
  if (([(BRCStatInfo *)self->super._st type] - 9) < 2u) {
    return 1;
  }
  if (![(BRCLocalItem *)self isFSRoot]) {
    return 0;
  }
  id v8 = [(BRCLocalItem *)self appLibrary];
  BOOL v7 = ([v8 state] & 0x2000000) == 0;

  return v7;
}

- (BOOL)isDirectoryWithPackageName
{
  unsigned int v3 = [(BRCStatInfo *)self->super._st type];
  if (v3 > 0xA || ((1 << v3) & 0x611) == 0)
  {
    BOOL v5 = brc_bread_crumbs();
    char v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem isDirectory]();
    }
  }
  BOOL v7 = [(BRCLocalStatInfo *)self->super._st logicalNameWithoutLocalBounce];
  char v8 = objc_msgSend(v7, "br_isPackageRoot");

  return v8;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCDirectoryItem;
  unint64_t v5 = [(BRCLocalItem *)&v17 diffAgainstServerItem:v4];
  if ([(BRCDirectoryItem *)self isDirectoryWithPackageName])
  {
    char v6 = [(BRCLocalStatInfo *)self->super._st logicalName];
    BOOL v7 = [v4 st];
    char v8 = [v7 logicalName];
    char v9 = [v6 isEqualToString:v8] & ((v5 & 0x40) != 0);

    unint64_t v10 = v5 & 0xFFFFFFFFFFFFFFBFLL;
    if (v9) {
      v5 &= ~0x40uLL;
    }
  }
  else
  {
    unint64_t v10 = v5 & 0xFFFFFFFFFFFFFFBFLL;
  }
  if ([(BRCDirectoryItem *)self isDirectoryWithPackageName])
  {
    BOOL v11 = [(BRCLocalStatInfo *)self->super._st logicalNameWithoutLocalBounce];
    id v12 = [v4 st];
    id v13 = [v12 logicalName];
    if ([v11 isEqualToString:v13])
    {

      if ((v5 & 0x40) != 0) {
        unint64_t v5 = v10;
      }
    }
    else
    {
    }
  }
  int64_t v14 = [(BRCDirectoryItem *)self mtime];
  if (v14 == [v4 directoryMtime]) {
    unint64_t v15 = v5;
  }
  else {
    unint64_t v15 = v5 | 0x4000;
  }

  return v15;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRCDirectoryItem;
  return [(BRCLocalItem *)&v4 diffAgainstLocalItem:a3];
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  BOOL v3 = [(BRCLocalItem *)self isOwnedByMe];
  if (v3) {
    return (LOBYTE(self->super._sharingOptions) >> 2) & 1;
  }
  return v3;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCDirectoryItem;
  BOOL v11 = [(BRCLocalItem *)&v13 _initFromPQLResultSet:v10 session:a4 db:a5 error:a6];
  if (v11) {
    v11[25] = [v10 longLongAtIndex:41];
  }

  return v11;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCDirectoryItem;
  BOOL v7 = [(BRCLocalItem *)&v9 _initWithServerItem:v6 dbRowID:a4];
  if (v7) {
    v7[25] = [v6 directoryMtime];
  }

  return v7;
}

- (id)_initWithLocalItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCDirectoryItem;
  unint64_t v5 = [(BRCLocalItem *)&v8 _initWithLocalItem:v4];
  if (v5)
  {
    id v6 = [v4 asDirectory];
    v5[25] = v6[25];
  }
  return v5;
}

- (void)updateItemMetadataFromServerItem:(id)a3 appliedSharingPermission:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)BRCDirectoryItem;
  id v6 = a3;
  [(BRCLocalItem *)&v8 updateItemMetadataFromServerItem:v6 appliedSharingPermission:v4];
  int64_t v7 = objc_msgSend(v6, "directoryMtime", v8.receiver, v8.super_class);

  self->_mtime = v7;
}

- (void)_learnItemID:(id)a3 serverItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCDirectoryItem;
  [(BRCLocalItem *)&v14 _learnItemID:v6 serverItem:v7];
  if (v7)
  {
    objc_super v8 = [(BRCLocalItem *)self st];
    objc_super v9 = [v7 st];
    objc_msgSend(v8, "setType:", objc_msgSend(v9, "type"));

LABEL_8:
    goto LABEL_9;
  }
  if ([v6 isDocumentsFolder])
  {
    id v10 = [(BRCLocalItem *)self appLibrary];
    int v11 = [v10 state];

    id v12 = [(BRCLocalItem *)self st];
    objc_super v8 = v12;
    if ((v11 & 0x4000000) != 0) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 9;
    }
    [v12 setType:v13];
    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)isAppLibraryTrashFolder
{
  BOOL v3 = [(BRCLocalStatInfo *)self->super._st logicalName];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F59468]];

  if (!v4) {
    return 0;
  }
  unint64_t v5 = [(BRCLocalItem *)self appLibrary];
  int v6 = [v5 isCloudDocsAppLibrary];

  id v7 = [(BRCStatInfo *)self->super._st parentID];
  objc_super v8 = v7;
  if (v6) {
    char v9 = [v7 isNonDesktopRoot];
  }
  else {
    char v9 = [v7 isDocumentsFolder];
  }
  BOOL v10 = v9;

  return v10;
}

- (id)descriptionWithContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BRCDirectoryItem;
  int v4 = [(BRCLocalItem *)&v7 descriptionWithContext:a3];
  unint64_t v5 = (void *)[v4 mutableCopy];

  if (self->_childItemCount) {
    [v5 appendFormat:@" ch:%@", self->_childItemCount];
  }
  return v5;
}

- (BOOL)possiblyContainsSharedItem
{
  id v3 = [(BRCPQLConnection *)self->super._db fetch:@"SELECT shared_by_me_count | shared_to_me_count, dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu", self->super._dbRowID];
  if (![v3 next]) {
    goto LABEL_6;
  }
  if (([v3 BOOLAtIndex:0] & 1) == 0)
  {
    if ([v3 BOOLAtIndex:1])
    {
      db = self->super._db;
      itemID = self->super._itemID;
      objc_super v7 = [(BRCClientZone *)self->super._clientZone dbRowID];
      id v8 = [(PQLConnection *)db numberWithSQL:@"SELECT IFNULL(shared_children_count, 0) | IFNULL(shared_alias_count, 0) FROM server_items WHERE item_id = %@ AND zone_rowid = %@", itemID, v7];

      char v4 = [v8 BOOLValue];
      goto LABEL_7;
    }
LABEL_6:
    char v4 = 0;
    goto LABEL_7;
  }
  char v4 = 1;
LABEL_7:

  return v4;
}

- (BOOL)isSharedByMeOrContainsSharedByMeItem
{
  id v3 = [(BRCPQLConnection *)self->super._db fetch:@"SELECT shared_by_me_count, dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu", self->super._dbRowID];
  if (![v3 next]) {
    goto LABEL_6;
  }
  if (([v3 BOOLAtIndex:0] & 1) == 0)
  {
    if ([v3 BOOLAtIndex:1])
    {
      db = self->super._db;
      itemID = self->super._itemID;
      objc_super v7 = [(BRCClientZone *)self->super._clientZone dbRowID];
      id v8 = [(PQLConnection *)db numberWithSQL:@"SELECT shared_children_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@", itemID, v7];

      char v4 = [v8 BOOLValue];
      goto LABEL_7;
    }
LABEL_6:
    char v4 = 0;
    goto LABEL_7;
  }
  char v4 = 1;
LABEL_7:

  return v4;
}

- (BOOL)isSharedToMeOrContainsSharedToMeItem
{
  id v3 = [(BRCPQLConnection *)self->super._db fetch:@"SELECT shared_to_me_count, dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu", self->super._dbRowID];
  if (![v3 next]) {
    goto LABEL_6;
  }
  if (([v3 BOOLAtIndex:0] & 1) == 0)
  {
    if ([v3 BOOLAtIndex:1])
    {
      db = self->super._db;
      itemID = self->super._itemID;
      objc_super v7 = [(BRCClientZone *)self->super._clientZone dbRowID];
      id v8 = [(PQLConnection *)db numberWithSQL:@"SELECT shared_alias_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@", itemID, v7];

      char v4 = [v8 BOOLValue];
      goto LABEL_7;
    }
LABEL_6:
    char v4 = 0;
    goto LABEL_7;
  }
  char v4 = 1;
LABEL_7:

  return v4;
}

- (BOOL)containsOverQuotaItems
{
  id v2 = [(PQLConnection *)self->super._db numberWithSQL:@"SELECT over_quota_count FROM item_recursive_properties WHERE item_rowid = %llu", self->super._dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)containsDirFault
{
  if ([(BRCDirectoryItem *)self isDirectoryFault]) {
    return 1;
  }
  id v4 = [(PQLConnection *)self->super._db numberWithSQL:@"SELECT dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu", self->super._dbRowID];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)containsPendingUploadOrSyncUp
{
  id v2 = [(PQLConnection *)self->super._db numberWithSQL:@"SELECT 1 FROM item_recursive_properties WHERE item_rowid = %llu AND (needs_sync_up_count != 0 OR needs_upload_count != 0)", self->super._dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)containsPendingDeleteDocuments
{
  db = self->super._db;
  unint64_t dbRowID = self->super._dbRowID;
  id v4 = [(BRCClientZone *)self->super._clientZone dbRowID];
  id v5 = [(PQLConnection *)db numberWithSQL:@"WITH RECURSIVE pending_delete_children (item_id, item_type, needs_delete_doc_count) AS(    SELECT item_id, item_type, needs_delete_doc_count FROM item_recursive_properties      WHERE item_rowid = %llu AND needs_delete_doc_count != 0  UNION ALL     SELECT ip.item_id, ip.item_type, ip.needs_delete_doc_count FROM item_recursive_properties AS ip INNER JOIN pending_delete_children AS p WHERE ip.item_parent_id = p.item_id AND ip.zone_rowid = %@ AND ip.needs_delete_doc_count != 0) SELECT 1 FROM pending_delete_children AS pdc WHERE pdc.needs_delete_doc_count != 0 AND pdc.item_type IN (1, 2, 8) LIMIT 1", dbRowID, v4];

  LOBYTE(v4) = [v5 BOOLValue];
  return (char)v4;
}

- (void)transformIntoFSRoot
{
  self->super._st->super._type = 4;
}

- (BOOL)hasDeadChildren
{
  db = self->super._db;
  itemID = self->super._itemID;
  id v4 = [(BRCClientZone *)self->super._clientZone dbRowID];
  id v5 = [(PQLConnection *)db numberWithSQL:@"SELECT 1 FROM client_items WHERE item_parent_id = %@ AND item_state = 1 AND item_parent_zone_rowid = %@ LIMIT 1", itemID, v4];

  LOBYTE(v4) = [v5 BOOLValue];
  return (char)v4;
}

- (BOOL)hasLiveChildren
{
  char v3 = [(BRCClientZone *)self->super._clientZone db];
  itemID = self->super._itemID;
  id v5 = [(BRCClientZone *)self->super._clientZone dbRowID];
  int v6 = (void *)[v3 numberWithSQL:@"SELECT 1 FROM client_items WHERE item_parent_id = %@    AND item_state IN (0, -1)   AND item_parent_zone_rowid = %@ LIMIT 1", itemID, v5];

  LOBYTE(v5) = [v6 BOOLValue];
  return (char)v5;
}

- (id)_serverChildItemCountIncludingHiddenFiles
{
  clientZone = self->super._clientZone;
  itemID = self->super._itemID;
  id v4 = [(BRCLocalItem *)self db];
  id v5 = [(BRCClientZone *)clientZone serverChildCountWithParentID:itemID db:v4];

  return v5;
}

- (id)_serverChildItemCount
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BRCDirectoryItem *)self _serverChildItemCountIncludingHiddenFiles];
  if (v3)
  {
    id v4 = (void *)v3;
    clientZone = self->super._clientZone;
    itemID = self->super._itemID;
    objc_super v7 = [(BRCLocalItem *)self db];
    id v8 = [(BRCClientZone *)clientZone serverHiddenChildCountWithParentID:itemID db:v7];

    uint64_t v9 = [v4 longLongValue];
    uint64_t v10 = v9 - [v8 longLongValue];
    if (v10 < 0)
    {
      int v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v15 = 138413058;
        unint64_t v16 = v4;
        __int16 v17 = 2112;
        v18 = v8;
        __int16 v19 = 2112;
        id v20 = self;
        __int16 v21 = 2112;
        v22 = v11;
        _os_log_fault_impl(&dword_1D353B000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: server count %@ minus hidden count %@ is less than 0 for %@%@", (uint8_t *)&v15, 0x2Au);
      }

      uint64_t v10 = 0;
    }
    uint64_t v13 = [NSNumber numberWithLongLong:v10];
  }
  else
  {
    uint64_t v13 = 0;
  }
  return v13;
}

- (id)childItemCount
{
  if (!self->_childItemCount)
  {
    if ([(BRCDirectoryItem *)self isDirectoryFault])
    {
      uint64_t v3 = [(BRCDirectoryItem *)self _serverChildItemCount];
      childItemCount = self->_childItemCount;
      self->_childItemCount = v3;
    }
    else
    {
      clientZone = self->super._clientZone;
      itemID = self->super._itemID;
      childItemCount = [(BRCLocalItem *)self db];
      objc_super v7 = [(BRCClientZone *)clientZone clientChildCountWithParentID:itemID db:childItemCount];
      id v8 = self->_childItemCount;
      self->_childItemCount = v7;
    }
  }
  uint64_t v9 = self->_childItemCount;
  return v9;
}

- (id)serverQuotaUsage
{
  clientZone = self->super._clientZone;
  itemID = self->super._itemID;
  id v4 = [(BRCLocalItem *)self db];
  id v5 = [(BRCClientZone *)clientZone serverQuotaUsageWithParentID:itemID db:v4];

  return v5;
}

- (id)clientZonesChildrenNeedingSyncUpAreIn
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v20 = objc_opt_new();
  db = self->super._db;
  itemID = self->super._itemID;
  id v5 = [(BRCClientZone *)self->super._clientZone dbRowID];
  id v6 = [(BRCPQLConnection *)db fetch:@"SELECT DISTINCT zone_rowid FROM client_items WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@    AND item_localsyncupstate = 4   AND item_state IN (0, -1, 1)", itemID, v5];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [v6 enumerateObjectsOfClass:objc_opt_class()];
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v12 = [(BRCAccountSession *)self->super._session serverZoneByRowID:v11];
        uint64_t v13 = [v12 clientZone];
        if (v13)
        {
          [v20 addObject:v13];
        }
        else
        {
          objc_super v14 = brc_bread_crumbs();
          int v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v26 = v11;
            __int16 v27 = 2112;
            v28 = v14;
            _os_log_fault_impl(&dword_1D353B000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't find clientZone for zoneID %@%@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v8);
  }

  if ([v20 count]) {
    unint64_t v16 = v20;
  }
  else {
    unint64_t v16 = 0;
  }
  id v17 = v16;

  return v17;
}

- (void)_retryPostponedIfNeededForDiffs:(unint64_t)a3
{
  int v3 = a3;
  if ([(BRCLocalItem *)self isDead])
  {
    if ([(BRCLocalItem *)self isKnownByServerOrInFlight]) {
      return;
    }
  }
  else if ((v3 & 0x80000000) == 0)
  {
    if (![(BRCLocalItem *)self isOnDisk]) {
      return;
    }
    id v5 = [(BRCLocalItem *)self orig];
    char v6 = [v5 isOnDisk];

    if ((v6 & 1) != 0 || ![(BRCLocalItem *)self isKnownByServerOrInFlight]) {
      return;
    }
  }
  id v7 = [(BRCAccountSession *)self->super._session applyScheduler];
  [v7 didCreateMissingParentID:self->super._itemID zone:self->super._serverZone];
}

- (BOOL)_repopulateRecursivePropertiesIfNecessary
{
  db = self->super._db;
  itemID = self->super._itemID;
  id v5 = [(BRCClientZone *)self->super._clientZone dbRowID];
  id v6 = [(BRCPQLConnection *)db fetch:@"SELECT SUM(dir_faults_count), SUM(faults_count), SUM(needs_faulting_count), SUM(uploaded_size), SUM(needs_upload_size), SUM(uploaded_count), SUM(needs_upload_count), SUM(downloaded_size), SUM(needs_download_size), SUM(downloaded_count), SUM(needs_download_count), SUM(dl_unstaged_count), SUM(needs_dl_unstage_count), SUM(synced_up_count), SUM(needs_sync_up_count), SUM(over_quota_count), SUM(shared_by_me_count), SUM(shared_to_me_count), SUM(needs_delete_doc_count) FROM item_recursive_properties WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@", itemID, v5];

  if ([v6 next]) {
    BOOL v7 = -[BRCPQLConnection execute:](self->super._db, "execute:", @"UPDATE item_recursive_properties SET  dir_faults_count = %lld, faults_count = %lld, needs_faulting_count = %lld, uploaded_size = %lld, needs_upload_size = %lld, uploaded_count = %lld, needs_upload_count = %lld, downloaded_size = %lld, needs_download_size = %lld, downloaded_count = %lld, needs_download_count = %lld, dl_unstaged_count = %lld, needs_dl_unstage_count = %lld, synced_up_count = %lld, needs_sync_up_count = %lld, over_quota_count = %lld, shared_by_me_count = %lld, shared_to_me_count = %lld, needs_delete_doc_count = %lld  WHERE item_rowid = %llu ", [v6 unsignedLongLongAtIndex:0]+ -[BRCDirectoryItem isDirectoryFault](self, "isDirectoryFault"), objc_msgSend(v6, "unsignedLongLongAtIndex:", 1), objc_msgSend(v6, "unsignedLongLongAtIndex:", 2), objc_msgSend(v6, "unsignedLongLongAtIndex:", 3), objc_msgSend(v6, "unsignedLongLongAtIndex:", 4), objc_msgSend(v6, "unsignedLongLongAtIndex:", 5), objc_msgSend(v6, "unsignedLongLongAtIndex:", 6), objc_msgSend(v6, "unsignedLongLongAtIndex:", 7), objc_msgSend(v6, "unsignedLongLongAtIndex:", 8), objc_msgSend(v6, "unsignedLongLongAtIndex:", 9), objc_msgSend(v6, "unsignedLongLongAtIndex:", 10), objc_msgSend(v6, "unsignedLongLongAtIndex:", 11), objc_msgSend(v6, "unsignedLongLongAtIndex:", 12), objc_msgSend(v6, "unsignedLongLongAtIndex:", 13), objc_msgSend(v6, "unsignedLongLongAtIndex:", 14),
  }
           [v6 unsignedLongLongAtIndex:15],
           [v6 unsignedLongLongAtIndex:16]
         + [(BRCDirectoryItem *)self hasShareIDAndIsOwnedByMe],
           [v6 unsignedLongLongAtIndex:17]
         + [(BRCLocalItem *)self isSharedToMeTopLevelItem],
           [v6 unsignedLongLongAtIndex:18],
           self->super._dbRowID);
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)_insertRecursiveProperties
{
  int v3 = [(BRCStatInfo *)self->super._st parentID];
  if ([(BRCItemID *)self->super._itemID isDocumentsFolder]
    || ([(BRCLocalStatInfo *)self->super._st logicalName],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:*MEMORY[0x1E4F59468]],
        v4,
        v5))
  {

    int v3 = 0;
  }
  db = self->super._db;
  unint64_t dbRowID = self->super._dbRowID;
  itemID = self->super._itemID;
  int v9 = [(BRCStatInfo *)self->super._st type];
  uint64_t v10 = [(BRCClientZone *)self->super._clientZone dbRowID];
  LODWORD(db) = [(BRCPQLConnection *)db execute:@"INSERT OR REPLACE INTO item_recursive_properties (item_rowid, item_id, item_parent_id, item_type, zone_rowid, item_parent_zone_rowid) VALUES (%llu, %@, %@, %u, %@, %@)", dbRowID, itemID, v3, v9, v10, self->super._parentZoneRowID];

  if (db) {
    BOOL v11 = [(BRCDirectoryItem *)self _repopulateRecursivePropertiesIfNecessary];
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_updateRecursiveProperties
{
  int v3 = [(BRCStatInfo *)self->super._st type];
  id v4 = [(BRCLocalItem *)self->super._orig st];
  int v5 = [v4 type];

  if (v3 == v5)
  {
    BOOL v6 = 1;
    goto LABEL_17;
  }
  if (([(BRCStatInfo *)self->super._st type] - 9) <= 1u)
  {
    BOOL v7 = [(BRCLocalItem *)self->super._orig st];
    int v8 = [v7 type];

    if (!v8)
    {
      BOOL v11 = [(BRCPQLConnection *)self->super._db execute:@"UPDATE item_recursive_properties SET item_type = %d, dir_faults_count = dir_faults_count + 1 WHERE item_rowid = %llu", [(BRCStatInfo *)self->super._st type], self->super._dbRowID];
      goto LABEL_16;
    }
  }
  if (![(BRCStatInfo *)self->super._st type])
  {
    int v9 = [(BRCLocalItem *)self->super._orig st];
    unsigned int v10 = ([v9 type] - 9);

    if (v10 <= 1)
    {
      BOOL v11 = [(BRCPQLConnection *)self->super._db execute:@"UPDATE item_recursive_properties SET item_type = %d, dir_faults_count = dir_faults_count - 1 WHERE item_rowid = %llu", [(BRCStatInfo *)self->super._st type], self->super._dbRowID];
LABEL_16:
      BOOL v6 = v11;
      goto LABEL_17;
    }
  }
  BOOL v6 = [(BRCPQLConnection *)self->super._db execute:@"UPDATE item_recursive_properties SET item_type = %d WHERE item_rowid = %llu", [(BRCStatInfo *)self->super._st type], self->super._dbRowID];
  if ([(BRCStatInfo *)self->super._st type] == 4) {
    goto LABEL_17;
  }
  id v12 = [(BRCLocalItem *)self->super._orig st];
  if ([v12 type] != 4)
  {
    uint64_t v13 = [(BRCLocalItem *)self->super._orig st];
    int v14 = [v13 type];

    if (v14 == 10) {
      goto LABEL_17;
    }
    id v12 = brc_bread_crumbs();
    int v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem _updateRecursiveProperties]();
    }
  }
LABEL_17:
  int sharingOptions = self->super._sharingOptions;
  if ((([(BRCLocalItem *)self->super._orig sharingOptions] ^ sharingOptions) & 4) != 0)
  {
    if (([(BRCPQLConnection *)self->super._db isBatchSuspended] & 1) == 0)
    {
      long long v22 = brc_bread_crumbs();
      long long v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem createSyncUpJob].cold.7();
      }
    }
    if ((self->super._sharingOptions & 4) != 0)
    {
      if ([(BRCServerZone *)self->super._serverZone isSharedZone]) {
        id v20 = "shared_to_me_count = shared_to_me_count + 1";
      }
      else {
        id v20 = "shared_by_me_count = shared_by_me_count + 1";
      }
      __int16 v19 = [MEMORY[0x1E4FBA908] rawInjection:v20 length:43];
      if (!v6)
      {
        LOBYTE(v6) = 0;
        goto LABEL_31;
      }
    }
    else
    {
      id v17 = [(BRCLocalItem *)self->super._orig serverZone];
      if ([v17 isSharedZone]) {
        v18 = "shared_to_me_count = shared_to_me_count - 1";
      }
      else {
        v18 = "shared_by_me_count = shared_by_me_count - 1";
      }
      __int16 v19 = [MEMORY[0x1E4FBA908] rawInjection:v18 length:43];

      if (!v6) {
        goto LABEL_31;
      }
    }
    LOBYTE(v6) = [(BRCPQLConnection *)self->super._db execute:@"UPDATE item_recursive_properties SET %@ WHERE item_rowid = %llu", v19, self->super._dbRowID];
LABEL_31:
  }
  return v6;
}

- (BOOL)_recomputeChildItemCount
{
  db = self->super._db;
  id v4 = [(BRCLocalItem *)self itemID];
  int v5 = [(BRCClientZone *)self->super._clientZone dbRowID];
  LOBYTE(db) = [(BRCPQLConnection *)db execute:@"UPDATE client_items AS parent SET visible_child_count = (SELECT COUNT(*) FROM client_items AS child WHERE child.item_parent_id = parent.item_id AND child.item_parent_zone_rowid = parent.zone_rowid AND (child.item_user_visible = 1 OR (child.item_scope == 3 AND child.item_filename != \".Trash\"))) WHERE parent.item_id = %@ AND parent.zone_rowid = %@", v4, v5];

  return (char)db;
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  id v51 = a3;
  [(BRCDirectoryItem *)self _retryPostponedIfNeededForDiffs:0xFF007FF3FF7FFFLL];
  v50 = [(BRCClientZone *)self->super._clientZone dbRowID];
  int64_t mtime = self->_mtime;
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  unint64_t sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  unint64_t localDiffs = self->super._localDiffs;
  unint64_t notifsRank = self->super._notifsRank;
  uint64_t syncUpState = self->super._syncUpState;
  v42 = [(BRCLocalItem *)self appLibrary];
  v49 = [v42 dbRowID];
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  BOOL isUserVisible = self->super._isUserVisible;
  v48 = [(BRCStatInfo *)self->super._st ckInfo];
  int v30 = [(BRCStatInfo *)self->super._st state];
  int v29 = [(BRCStatInfo *)self->super._st type];
  int v27 = [(BRCStatInfo *)self->super._st mode];
  int64_t v26 = [(BRCStatInfo *)self->super._st birthtime];
  int64_t v25 = [(BRCStatInfo *)self->super._st lastUsedTime];
  int64_t v24 = [(BRCStatInfo *)self->super._st favoriteRank];
  v47 = [(BRCStatInfo *)self->super._st parentID];
  st = self->super._st;
  logicalName = (__CFString *)st->super._logicalName;
  if (!logicalName) {
    logicalName = &stru_1F2AC7720;
  }
  long long v23 = logicalName;
  BOOL v22 = [(BRCStatInfo *)st isHiddenExt];
  v46 = [(BRCStatInfo *)self->super._st finderTags];
  v45 = [(BRCStatInfo *)self->super._st xattrSignature];
  v44 = [(BRCStatInfo *)self->super._st trashPutBackPath];
  long long v21 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
  id v20 = [(BRCStatInfo *)self->super._st aliasTarget];
  __int16 v19 = [(BRCStatInfo *)self->super._st creatorRowID];
  v18 = [(BRCLocalStatInfo *)self->super._st documentID];
  BOOL v7 = [(BRCLocalStatInfo *)self->super._st fileID];
  int v8 = [(BRCLocalStatInfo *)self->super._st generationID];
  int v9 = [(BRCLocalStatInfo *)self->super._st physicalName];
  unsigned int v10 = [(BRCLocalStatInfo *)self->super._st processingStamp];
  BOOL v11 = [(BRCLocalStatInfo *)self->super._st stagedFileIDForDB];
  uint64_t v12 = [(BRCLocalStatInfo *)self->super._st stagedGenerationID];
  id v17 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
  unsigned int v13 = [(BRCLocalStatInfo *)self->super._st itemScope];
  unint64_t v16 = [(BRCLocalStatInfo *)self->super._st tmpBouncedNo];
  int v41 = objc_msgSend(v51, "execute:", @"INSERT INTO client_items(rowid, zone_rowid, version_mtime, visible_child_count, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno) VALUES(%lld, %@, %lld, 0, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %u, %@, %d, %@)", a4, v50, mtime, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v49, minimumSupportedOSRowID, isUserVisible, v48, v30,
          v29,
          v27,
          v26,
          v25,
          v24,
          v47,
          v23,
          v22,
          v46,
          v45,
          v44,
          v21,
          v20,
          v19,
          v18,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12,
          v17,
          v13,
          v16);

  BOOL v14 = v41
     && (v52.receiver = self,
         v52.super_class = (Class)BRCDirectoryItem,
         [(BRCLocalItem *)&v52 _insertInDB:v51 dbRowID:a4])
     && [(BRCDirectoryItem *)self _insertRecursiveProperties]
     && [(BRCDirectoryItem *)self _recomputeChildItemCount];

  return v14;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = v6;
  unint64_t v97 = a4;
  if ((a4 & 0x80000000) == 0) {
    goto LABEL_7;
  }
  if (([v6 isBatchSuspended] & 1) == 0)
  {
    v59 = self;
    v60 = brc_bread_crumbs();
    v61 = brc_default_log();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem _updateInDB:diffs:]();
    }

    self = v59;
  }
  itemID = self->super._itemID;
  int v9 = [(BRCClientZone *)self->super._clientZone dbRowID];
  uint64_t v10 = [(BRCLocalItem *)self->super._orig itemID];
  BOOL v11 = self;
  uint64_t v12 = (void *)v10;
  unsigned int v13 = v11;
  BOOL v14 = [(BRCClientZone *)v11->super._clientZone dbRowID];
  int v15 = [v7 execute:@"UPDATE client_items   SET item_parent_id = %@, item_parent_zone_rowid = %@ WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@", itemID, v9, v12, v14];

  uint64_t v16 = [v7 changes];
  if (v16 < 1)
  {
    self = v13;
    if (v15) {
      goto LABEL_7;
    }
LABEL_14:
    int v23 = 0;
    if ((a4 & 0x40000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  uint64_t v17 = v16;
  v18 = brc_bread_crumbs();
  __int16 v19 = brc_default_log();
  self = v13;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v57 = [(BRCLocalItem *)v13->super._orig itemID];
    v58 = v13->super._itemID;
    *(_DWORD *)buf = 134218754;
    uint64_t v108 = v17;
    __int16 v109 = 2112;
    v110 = v57;
    __int16 v111 = 2112;
    v112 = v58;
    __int16 v113 = 2112;
    v114 = v18;
    _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %llu items from parent %@ to %@%@", buf, 0x2Au);
  }
  if ((v15 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  if (![(BRCLocalItem *)self isAlmostDead])
  {
    int v23 = 1;
    if ((a4 & 0x40000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  id v20 = self;
  long long v21 = [(BRCLocalItem *)self orig];
  char v22 = [v21 isAlmostDead];

  if (v22)
  {
    int v23 = 1;
    self = v20;
    if ((a4 & 0x40000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  if (([v7 isBatchSuspended] & 1) == 0)
  {
    v62 = brc_bread_crumbs();
    v63 = brc_default_log();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem _updateInDB:diffs:]();
    }
  }
  int64_t v24 = [(BRCLocalItem *)v20 itemID];
  int64_t v25 = [(BRCClientZone *)v20->super._clientZone dbRowID];
  v96 = v7;
  int v94 = [v7 execute:@"DELETE FROM client_items WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@   AND item_state = -2", v24, v25];

  int64_t v26 = [(BRCClientZone *)v20->super._clientZone db];
  int v27 = [(BRCLocalItem *)v20 itemID];
  v28 = [(BRCClientZone *)v20->super._clientZone dbRowID];
  int v29 = (void *)[v26 fetch:@"SELECT si.rowid FROM server_items AS si INNER JOIN client_unapplied_table AS ap ON si.item_rank = ap.throttle_id WHERE si.item_parent_id = %@   AND si.zone_rowid = %@   AND si.item_type = 3   AND ap.throttle_state = 24", v27, v28];

  self = v20;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v92 = v29;
  id obj = [v29 enumerateObjectsOfClass:objc_opt_class()];
  uint64_t v30 = [obj countByEnumeratingWithState:&v102 objects:v106 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v103;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v103 != v32) {
          objc_enumerationMutation(obj);
        }
        unint64_t v34 = -[BRCClientZone serverItemByRowID:](self->super._clientZone, "serverItemByRowID:", [*(id *)(*((void *)&v102 + 1) + 8 * v33) longLongValue]);
        objc_super v35 = brc_bread_crumbs();
        brc_default_log();
        v37 = v36 = self;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v108 = (uint64_t)v34;
          __int16 v109 = 2112;
          v110 = v35;
          _os_log_debug_impl(&dword_1D353B000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] Inserting tombstone for alias %@ which is pending target%@", buf, 0x16u);
        }

        v38 = (void *)[v34 newLocalItemWithServerZone:v36->super._serverZone dbRowID:0];
        [v38 markDead];
        [v38 markForceNeedsSyncUp];
        [v38 saveToDB];

        ++v33;
        self = v36;
      }
      while (v31 != v33);
      uint64_t v31 = [obj countByEnumeratingWithState:&v102 objects:v106 count:16];
    }
    while (v31);
  }

  BOOL v7 = v96;
  int v23 = v94;
  if ((a4 & 0x40000000) != 0)
  {
LABEL_27:
    int sharingOptions = self->super._sharingOptions;
    if ((([(BRCLocalItem *)self->super._orig sharingOptions] ^ sharingOptions) & 0x7CLL) != 0) {
      [(BRCLocalItem *)self markLostClearGenerationID:0 backoffMode:0];
    }
  }
LABEL_29:
  [(BRCDirectoryItem *)self _retryPostponedIfNeededForDiffs:a4];
  char v40 = v23 ^ 1;
  if (a4 != 0x100000000) {
    char v40 = 1;
  }
  if (v40)
  {
    if (!v23) {
      goto LABEL_45;
    }
    id obja = [(BRCClientZone *)self->super._clientZone dbRowID];
    v84 = self->super._itemID;
    ownerKey = self->super._ownerKey;
    unint64_t v80 = self->super._sharingOptions;
    sideCarCKInfo = self->super._sideCarCKInfo;
    parentZoneRowID = self->super._parentZoneRowID;
    unint64_t localDiffs = self->super._localDiffs;
    unint64_t notifsRank = self->super._notifsRank;
    uint64_t syncUpState = self->super._syncUpState;
    v86 = [(BRCLocalItem *)self appLibrary];
    v98 = [v86 dbRowID];
    minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
    BOOL isUserVisible = self->super._isUserVisible;
    v95 = [(BRCStatInfo *)self->super._st ckInfo];
    int v75 = [(BRCStatInfo *)self->super._st state];
    int v73 = [(BRCStatInfo *)self->super._st type];
    int v72 = [(BRCStatInfo *)self->super._st mode];
    int64_t v71 = [(BRCStatInfo *)self->super._st birthtime];
    int64_t v70 = [(BRCStatInfo *)self->super._st lastUsedTime];
    int64_t v69 = [(BRCStatInfo *)self->super._st favoriteRank];
    v93 = [(BRCStatInfo *)self->super._st parentID];
    st = self->super._st;
    logicalName = (__CFString *)st->super._logicalName;
    if (!logicalName) {
      logicalName = &stru_1F2AC7720;
    }
    v68 = logicalName;
    BOOL v67 = [(BRCStatInfo *)st isHiddenExt];
    v91 = [(BRCStatInfo *)self->super._st finderTags];
    v90 = [(BRCStatInfo *)self->super._st xattrSignature];
    v89 = [(BRCStatInfo *)self->super._st trashPutBackPath];
    v88 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
    v87 = [(BRCStatInfo *)self->super._st aliasTarget];
    v66 = [(BRCStatInfo *)self->super._st creatorRowID];
    v65 = [(BRCLocalStatInfo *)self->super._st documentID];
    v64 = [(BRCLocalStatInfo *)self->super._st fileID];
    v46 = [(BRCLocalStatInfo *)self->super._st generationID];
    v47 = [(BRCLocalStatInfo *)self->super._st physicalName];
    v48 = [(BRCLocalStatInfo *)self->super._st processingStamp];
    v49 = [(BRCLocalStatInfo *)self->super._st stagedFileIDForDB];
    uint64_t v50 = [(BRCLocalStatInfo *)self->super._st stagedGenerationID];
    id v51 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
    v42 = self;
    unsigned int v52 = [(BRCLocalStatInfo *)self->super._st itemScope];
    v53 = [(BRCLocalStatInfo *)v42->super._st tmpBouncedNo];
    v85 = objc_msgSend(v7, "execute:", @"UPDATE client_items SET zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_doc_id = %@, item_file_id = %@, item_generation = %@, item_localname = %@, item_processing_stamp = %@, item_staged_file_id = %@, item_staged_generation = %u, item_bouncedname = %@, item_scope = %d, item_tmpbounceno = %@, version_int64_t mtime = %lld  WHERE rowid = %llu", obja, v84, ownerKey, v80, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v98, minimumSupportedOSRowID, isUserVisible, v95, v75, v73, v72,
            v71,
            v70,
            v69,
            v93,
            v68,
            v67,
            v91,
            v90,
            v89,
            v88,
            v87,
            v66,
            v65,
            v64,
            v46,
            v47,
            v48,
            v49,
            v50,
            v51,
            v52,
            v53,
            v42->_mtime,
            v42->super._dbRowID);

    a4 = v97;
    if (!v85) {
      goto LABEL_45;
    }
  }
  else
  {
    int v41 = [(BRCStatInfo *)self->super._st state];
    [(BRCLocalStatInfo *)self->super._st lostStamp];
    v43 = v42 = self;
    LOBYTE(v41) = [v7 execute:@"UPDATE client_items SET item_state = %d, item_processing_stamp = %@ WHERE rowid = %llu", v41, v43, v42->super._dbRowID];

    if ((v41 & 1) == 0) {
      goto LABEL_45;
    }
  }
  v101.receiver = v42;
  v101.super_class = (Class)BRCDirectoryItem;
  if (![(BRCLocalItem *)&v101 _updateInDB:v7 diffs:a4])
  {
LABEL_45:
    BOOL v55 = 0;
    goto LABEL_46;
  }
  BOOL v54 = [(BRCDirectoryItem *)v42 _updateRecursiveProperties];
  BOOL v55 = (a4 & 0x80000000) == 0 && v54;
  if ((a4 & 0x80000000) != 0 && v54) {
    BOOL v55 = [(BRCDirectoryItem *)v42 _recomputeChildItemCount];
  }
LABEL_46:

  return v55;
}

- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(BRCLocalItem *)self isSharedToMeTopLevelItem]
    || [(BRCLocalItem *)self isSharedToMeChildItem];
  itemID = self->super._itemID;
  int v9 = [(BRCClientZone *)self->super._clientZone dbRowID];
  int v10 = [v6 execute:@"DELETE FROM client_items WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@ AND item_state = -2", itemID, v9];

  if (self->_needsDeleteForItemIDTransfer)
  {
    if ([(BRCPQLConnection *)self->super._db isInTransaction])
    {
      if (!v10)
      {
LABEL_14:
        BOOL v14 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      int v15 = brc_bread_crumbs();
      uint64_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem markNeedsDeleteForItemIDTransfer]();
      }

      if ((v10 & 1) == 0) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    if (!v10) {
      goto LABEL_14;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke;
    v19[3] = &__block_descriptor_33_e48_v28__0__sqlite3_context__8i16___sqlite3_value_20l;
    BOOL v20 = v7;
    BOOL v11 = (void *)MEMORY[0x1D94389C0](v19);
    uint64_t v12 = self->super._itemID;
    unsigned int v13 = [(BRCClientZone *)self->super._clientZone dbRowID];
    LOBYTE(v12) = [v6 execute:@"UPDATE client_items SET item_parent_id = call_block(%@, item_state, app_library_rowid, zone_rowid, rowid), item_localname = call_block(%@) WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@", v11, &__block_literal_global_58, v12, v13];

    if ((v12 & 1) == 0) {
      goto LABEL_14;
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)BRCDirectoryItem;
  BOOL v14 = [(BRCLocalItem *)&v18 _deleteFromDB:v6 keepAliases:v4];
LABEL_15:

  return v14;
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  BOOL v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_2((uint64_t)a4, (uint64_t)v7, v8);
  }

  if (sqlite3_value_int(*a4) != 1)
  {
    BOOL v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_1();
    }
  }
  if (*(unsigned char *)(a1 + 32)) {
    char v9 = 5;
  }
  else {
    char v9 = 1;
  }
  uint64_t v10 = 2;
  if (!*(unsigned char *)(a1 + 32)) {
    uint64_t v10 = 1;
  }
  char v13 = v9;
  int v14 = sqlite3_value_int(a4[v10]);
  sqlite3_result_blob(a2, &v13, 5, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_117(uint64_t a1, sqlite3_context *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(out, 0, sizeof(out));
  memset(v3, 0, sizeof(v3));
  uuid_generate_random(out);
  uuid_unparse(out, v3);
  sqlite3_result_text(a2, v3, 36, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)prepareForSyncUpInZone:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BRCDirectoryItem;
  id v4 = a3;
  [(BRCLocalItem *)&v6 prepareForSyncUpInZone:v4];
  uint64_t v5 = objc_msgSend(v4, "clientZone", v6.receiver, v6.super_class);

  [v5 prepareDirectoryForSyncUp:self];
}

- (BOOL)isShareableItem
{
  if ((self->super._sharingOptions & 4) != 0)
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  if (![(BRCItemID *)self->super._itemID isDocumentsFolder])
  {
    id v4 = [(BRCLocalItem *)self clientZone];
    if ([v4 isCloudDocsZone])
    {
      uint64_t v5 = [(BRCLocalItem *)self st];
      objc_super v6 = [v5 parentID];
      if ([v6 isNonDesktopRoot])
      {
        BOOL v7 = [(BRCLocalStatInfo *)self->super._st logicalName];
        if ([v7 isEqualToString:*MEMORY[0x1E4F59430]])
        {

          LOBYTE(v3) = 0;
LABEL_12:

          return v3;
        }
        char v9 = [(BRCLocalStatInfo *)self->super._st logicalName];
        char v10 = [v9 isEqualToString:*MEMORY[0x1E4F59440]];

        if (v10) {
          goto LABEL_3;
        }
LABEL_11:
        id v4 = [(BRCLocalItem *)self appLibrary];
        uint64_t v5 = [v4 mangledID];
        objc_super v6 = +[BRCUserDefaults defaultsForMangledID:v5];
        int v3 = [v6 isBlacklistedFromFolderSharing] ^ 1;
        goto LABEL_12;
      }
    }
    goto LABEL_11;
  }
LABEL_3:
  LOBYTE(v3) = 0;
  return v3;
}

- (id)asShareableItem
{
  if ([(BRCDirectoryItem *)self isShareableItem])
  {
    int v3 = self;
  }
  else
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryItem asShareableItem]();
    }

    int v3 = 0;
  }
  return v3;
}

- (id)collaborationIdentifierIfComputable
{
  if ([(BRCDirectoryItem *)self isShareableItem])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    id v4 = [(BRCDirectoryItem *)self asShareableItem];
    uint64_t v5 = (void *)[v3 initShareIDWithShareableItem:v4];

    objc_super v6 = [(BRCLocalItem *)self session];
    BOOL v7 = [v6 cachedCurrentUserRecordNameIfExists];
    int v8 = objc_msgSend(v5, "brc_collaborationIdentifierWithCachedCurrentUserRecordName:", v7);
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

- (void)markNeedsDeleteForItemIDTransfer
{
  v3.receiver = self;
  v3.super_class = (Class)BRCDirectoryItem;
  [(BRCLocalItem *)&v3 markNeedsDeleteForItemIDTransfer];
  self->_needsDeleteForItemIDTransfer = 1;
}

- (BOOL)isCrossZoneMoveTombstone
{
  return 0;
}

- (int64_t)mtime
{
  return self->_mtime;
}

- (void)setMtime:(int64_t)a3
{
  self->_int64_t mtime = a3;
}

- (void).cxx_destruct
{
}

- (void)isDirectory
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: BRCItemTypeIsDirectory(_st.type)%@", v2, v3, v4, v5, v6);
}

- (void)_updateRecursiveProperties
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _st.type == BRC_ITEM_TYPE_FS_ROOT || _orig.st.type == BRC_ITEM_TYPE_FS_ROOT || _orig.st.type == BRC_ITEM_TYPE_DIRECTORY_SHARE_ACCEPT_FAULT%@", v2, v3, v4, v5, v6);
}

- (void)_updateInDB:diffs:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [db isBatchSuspended]%@", v2, v3, v4, v5, v6);
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: sqlite3_value_int(argv[0]) == BRC_ITEM_STATE_TOMBSTONE%@", v2, v3, v4, v5, v6);
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = sqlite3_value_int(*(sqlite3_value **)(a1 + 24));
  v6[0] = 67109378;
  v6[1] = v5;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] _deleteFromDB: Updating item parent id for item rowid: %d%@", (uint8_t *)v6, 0x12u);
}

- (void)asShareableItem
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: asShareableItem called on a non-shareable item%@", v2, v3, v4, v5, v6);
}

@end