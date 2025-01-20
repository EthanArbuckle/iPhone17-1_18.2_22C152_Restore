@interface BRCServerZone
- (BOOL)_markItemDeadForRecordID:(id)a3;
- (BOOL)_markShareIDDead:(id)a3;
- (BOOL)_recoverFromCorruptShareOptionsWithItemType:(char)a3 itemID:(id)a4 parentID:(id)a5 sharingOptions:(unint64_t)a6;
- (BOOL)_saveDeletedRecordIDs:(id)a3;
- (BOOL)_saveEditedAliasRecord:(id)a3 zonesNeedingAllocRanks:(id)a4 error:(id *)a5;
- (BOOL)_saveEditedContentRecords:(id)a3 zonesNeedingAllocRanks:(id)a4;
- (BOOL)_saveEditedDirOrDocStructureRecord:(id)a3 error:(id *)a4;
- (BOOL)_saveEditedDocumentContentRecord:(id)a3 error:(id *)a4;
- (BOOL)_saveEditedFinderBookmarkRecord:(id)a3 error:(id *)a4;
- (BOOL)_saveEditedRecord:(id)a3 zonesNeedingAllocRanks:(id)a4 error:(id *)a5;
- (BOOL)_saveEditedShareRecord:(id)a3 error:(id *)a4;
- (BOOL)_saveEditedShareRecords:(id)a3 deletedShareRecordIDs:(id)a4 zonesNeedingAllocRanks:(id)a5;
- (BOOL)_saveEditedStructureRecords:(id)a3 zonesNeedingAllocRanks:(id)a4;
- (BOOL)_saveEditedSymlinkRecord:(id)a3 error:(id *)a4;
- (BOOL)_saveItemID:(id)a3 stat:(id)a4 serverMetrics:(id)a5 record:(id)a6 error:(id *)a7;
- (BOOL)_saveItemID:(id)a3 stat:(id)a4 serverMetrics:(id)a5 record:(id)a6 origName:(id)a7 base:(id)a8 no:(id)a9 ext:(id)a10;
- (BOOL)_saveItemID:(id)a3 version:(id)a4 record:(id)a5 contentBoundaryKey:(id)a6 iWorkSharingOptions:(unint64_t)a7;
- (BOOL)_savePendingChangesDeletedRecordIDsIgnoringRecordIDs:(id)a3 pendingChangeStream:(id)a4;
- (BOOL)_savePendingChangesEditedContentRecordsIgnoringRecordIDs:(id)a3 zonesNeedingAllocRanks:(id)a4 pendingChangeStream:(id)a5;
- (BOOL)_savePendingChangesEditedStructureRecordsIgnoringRecordIDs:(id)a3 zonesNeedingAllocRanks:(id)a4 pendingChangeStream:(id)a5;
- (BOOL)_savePendingChangesSharesIgnoringRecordIDs:(id)a3 zonesNeedingAllocRanks:(id)a4 pendingChangeStream:(id)a5;
- (BOOL)_verifyChildbasehashSaltKeysForItemID:(id)a3 saltInfo:(id)a4 record:(id)a5;
- (BOOL)allocateRanksWhenCaughtUp:(BOOL)a3;
- (BOOL)dumpStatusToContext:(id)a3 error:(id *)a4;
- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5;
- (BOOL)hasFetchedRecentsAndFavorites;
- (BOOL)hasFetchedServerZoneState;
- (BOOL)isCloudDocsZone;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivateZone;
- (BOOL)isSharedZone;
- (BOOL)needsSave;
- (BOOL)resetServerTruth;
- (BOOL)resetServerTruthAndDestroyZone:(BOOL)a3;
- (BOOL)saveQueryRecords:(id)a3 zonesNeedingAllocRanks:(id)a4 error:(id *)a5;
- (BOOL)setStateBits:(unsigned int)a3;
- (BOOL)shouldRecreateServerZoneAfterError:(id)a3;
- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4;
- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4;
- (BRCAccountSession)session;
- (BRCClientZone)clientZone;
- (BRCPQLConnection)db;
- (BRCServerChangeState)changeState;
- (BRCServerZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6;
- (BRCSyncContext)metadataSyncContext;
- (BRCSyncContext)metadataSyncContextIfExists;
- (BRCZoneRowID)dbRowID;
- (BRMangledID)mangledID;
- (CKRecordZoneID)zoneID;
- (NSMutableDictionary)plist;
- (NSString)description;
- (NSString)ownerName;
- (NSString)zoneName;
- (id)asPrivateZone;
- (id)asSharedZone;
- (id)deleteAllContentsOperation;
- (id)descriptionWithContext:(id)a3;
- (id)directDirectoryChildItemIDsOfParentEnumerator:(id)a3;
- (id)failedListItemIDs;
- (id)itemByItemID:(id)a3;
- (id)itemByItemID:(id)a3 db:(id)a4;
- (id)itemsEnumeratorWithDB:(id)a3;
- (id)jobsDescription;
- (id)matchingJobsWhereSQLClause;
- (unint64_t)didListDirectoryChangesWithResults:(id)a3 pendingFetchChanges:(id)a4;
- (unint64_t)didSyncDownRequestID:(unint64_t)a3 serverChangeToken:(id)a4 editedRecords:(id)a5 deletedRecordIDs:(id)a6 deletedShareRecordIDs:(id)a7 allocRankZones:(id *)a8 caughtUp:(BOOL)a9 pendingChanges:(id)a10;
- (unint64_t)hash;
- (unsigned)state;
- (unsigned)zoneCreationState;
- (void)_collectTombstoneForRank:(unint64_t)a3;
- (void)_recomputeMinLastUsedTime;
- (void)_reportCantSaveProblem:(id)a3 record:(id)a4;
- (void)activateWithClientZone:(id)a3 offline:(BOOL)a4;
- (void)addForegroundClient:(id)a3;
- (void)asPrivateZone;
- (void)asSharedZone;
- (void)checkIfFinishedFullSync;
- (void)clearStateBits:(unsigned int)a3;
- (void)collectTombstoneRanks:(id)a3;
- (void)deactivateFromClientZone;
- (void)deleteAllContentsOnServerWithCompletionBlock:(id)a3;
- (void)failedListingDirectoryChanges:(id)a3 serverTruthCallback:(id)a4 clientTruthCallback:(id)a5 folderItemID:(id)a6;
- (void)forceMoveToCloudDocs;
- (void)handleMovedZoneNames:(id)a3;
- (void)removeForegroundClient:(id)a3;
- (void)scheduleMoveToCloudDocs;
- (void)setDbRowID:(id)a3;
- (void)setNeedsSave:(BOOL)a3;
- (void)setSession:(id)a3;
@end

@implementation BRCServerZone

- (void)scheduleMoveToCloudDocs
{
  v3 = [(BRCServerZone *)self session];
  v4 = [v3 resetQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__BRCServerZone_BRCZoneMigration__scheduleMoveToCloudDocs__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async(v4, block);
}

void __58__BRCServerZone_BRCZoneMigration__scheduleMoveToCloudDocs__block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v2 = [*(id *)(a1 + 32) db];
  v3 = [v2 serialQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__BRCServerZone_BRCZoneMigration__scheduleMoveToCloudDocs__block_invoke_2;
  v4[3] = &unk_1E6995448;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = &v5;
  dispatch_sync(v3, v4);

  if (*((unsigned char *)v6 + 24)) {
    [*(id *)(a1 + 32) forceMoveToCloudDocs];
  }
  _Block_object_dispose(&v5, 8);
}

void __58__BRCServerZone_BRCZoneMigration__scheduleMoveToCloudDocs__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCloudDocsZone])
  {
    v2 = brc_bread_crumbs();
    v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __58__BRCServerZone_BRCZoneMigration__scheduleMoveToCloudDocs__block_invoke_2_cold_1();
    }

    goto LABEL_9;
  }
  if (([*(id *)(a1 + 32) state] & 2) != 0)
  {
LABEL_9:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    return;
  }
  [*(id *)(a1 + 32) setStateBits:2];
  [*(id *)(a1 + 32) resetServerTruth];
  id v4 = [*(id *)(a1 + 32) db];
  [v4 flush];
}

- (BOOL)isSharedZone
{
  return 0;
}

- (BOOL)isPrivateZone
{
  return 0;
}

- (id)asPrivateZone
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCServerZone asPrivateZone]();
  }

  return 0;
}

- (id)asSharedZone
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCServerZone asSharedZone]();
  }

  return 0;
}

- (BRCSyncContext)metadataSyncContext
{
  metadataSyncContext = self->_metadataSyncContext;
  if (!metadataSyncContext)
  {
    id v4 = [(BRCAccountSession *)self->_session syncContextProvider];
    uint64_t v5 = [(BRCServerZone *)self mangledID];
    v6 = [v4 metadataSyncContextForMangledID:v5];
    uint64_t v7 = self->_metadataSyncContext;
    self->_metadataSyncContext = v6;

    metadataSyncContext = self->_metadataSyncContext;
  }
  return metadataSyncContext;
}

- (BRCSyncContext)metadataSyncContextIfExists
{
  return self->_metadataSyncContext;
}

- (NSString)ownerName
{
  return (NSString *)(id)*MEMORY[0x1E4F19C08];
}

- (CKRecordZoneID)zoneID
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A320]);
  zoneName = self->_zoneName;
  uint64_t v5 = [(BRCServerZone *)self ownerName];
  v6 = (void *)[v3 initWithZoneName:zoneName ownerName:v5];

  return (CKRecordZoneID *)v6;
}

- (BRMangledID)mangledID
{
  id v3 = objc_alloc(MEMORY[0x1E4F594E8]);
  id v4 = [(BRCServerZone *)self zoneName];
  uint64_t v5 = [(BRCServerZone *)self ownerName];
  v6 = (void *)[v3 initWithZoneName:v4 ownerName:v5];

  return (BRMangledID *)v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_zoneName hash];
  id v4 = [(BRCServerZone *)self ownerName];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BRCServerZone *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      if ([(NSString *)self->_zoneName isEqualToString:v5->_zoneName])
      {
        v6 = [(BRCServerZone *)self ownerName];
        uint64_t v7 = [(BRCServerZone *)v5 ownerName];
        char v8 = [v6 isEqualToString:v7];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(BRCServerZone *)self changeState];
    v6 = [v5 descriptionWithContext:v4];
  }
  else
  {
    uint64_t v7 = NSString;
    unint64_t v5 = [(BRCServerZone *)self mangledID];
    dbRowID = self->_dbRowID;
    v9 = [(BRCServerZone *)self changeState];
    v10 = [v9 descriptionWithContext:0];
    v6 = [v7 stringWithFormat:@"<%@[%@] %@>", v5, dbRowID, v10];
  }
  return v6;
}

- (NSString)description
{
  return (NSString *)[(BRCServerZone *)self descriptionWithContext:0];
}

- (NSMutableDictionary)plist
{
  NSUInteger v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
  id v4 = [(BRCServerZone *)self changeState];
  unint64_t v5 = [NSNumber numberWithUnsignedInt:self->_state];
  [v3 setObject:v5 forKeyedSubscript:@"state"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "clientRequestID"));
  [v3 setObject:v6 forKeyedSubscript:@"clientRequestID"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "lastSyncDownStatus"));
  [v3 setObject:v7 forKeyedSubscript:@"lastSyncStatus"];

  char v8 = [v4 lastSyncDownDate];

  if (v8)
  {
    v9 = [v4 lastSyncDownDate];
    [v3 setObject:v9 forKeyedSubscript:@"lastSyncDownDate"];
  }
  v10 = [v4 changeToken];

  if (v10)
  {
    v11 = [v4 changeToken];
    [v3 setObject:v11 forKeyedSubscript:@"changeToken"];
  }
  return (NSMutableDictionary *)v3;
}

- (BRCServerZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)BRCServerZone;
  v14 = [(BRCServerZone *)&v30 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_session, a6);
    uint64_t v16 = [v13 serverDB];
    db = v15->_db;
    v15->_db = (BRCPQLConnection *)v16;

    objc_storeStrong((id *)&v15->_dbRowID, a4);
    uint64_t v18 = [v10 appLibraryOrZoneName];
    zoneName = v15->_zoneName;
    v15->_zoneName = (NSString *)v18;

    v20 = objc_alloc_init(BRCServerChangeState);
    changeState = v15->_changeState;
    v15->_changeState = v20;

    uint64_t v22 = objc_opt_new();
    failedListDirectoryOperations = v15->_failedListDirectoryOperations;
    v15->_failedListDirectoryOperations = (NSMutableDictionary *)v22;

    if (v12)
    {
      v24 = [v12 objectForKeyedSubscript:@"state"];
      v15->_state = [v24 unsignedIntValue];

      v25 = [v12 objectForKeyedSubscript:@"lastSyncDownDate"];
      [(BRCServerChangeState *)v15->_changeState setLastSyncDownDate:v25];

      v26 = [v12 objectForKeyedSubscript:@"lastSyncStatus"];
      -[BRCServerChangeState setLastSyncDownStatus:](v15->_changeState, "setLastSyncDownStatus:", [v26 unsignedIntegerValue]);

      v27 = [v12 objectForKeyedSubscript:@"changeToken"];
      [(BRCServerChangeState *)v15->_changeState setChangeToken:v27];

      v28 = [v12 objectForKeyedSubscript:@"clientRequestID"];
      -[BRCServerChangeState setClientRequestID:](v15->_changeState, "setClientRequestID:", [v28 unsignedLongLongValue]);
    }
  }

  return v15;
}

- (void)activateWithClientZone:(id)a3 offline:(BOOL)a4
{
}

- (void)deactivateFromClientZone
{
  clientZone = self->_clientZone;
  self->_clientZone = 0;
}

- (BOOL)_verifyChildbasehashSaltKeysForItemID:(id)a3 saltInfo:(id)a4 record:(id)a5
{
  return 1;
}

- (BOOL)_saveItemID:(id)a3 stat:(id)a4 serverMetrics:(id)a5 record:(id)a6 origName:(id)a7 base:(id)a8 no:(id)a9 ext:(id)a10
{
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  v17 = a4;
  id v170 = a5;
  id v18 = a6;
  id v172 = a7;
  id v174 = a8;
  v19 = v18;
  id v169 = a9;
  id v173 = a10;
  session = self->_session;
  v21 = [v18 recordID];
  uint64_t v22 = [v21 zoneID];
  v23 = [v22 ownerName];
  uint64_t v24 = [(BRCAccountSession *)session userKeyForOwnerName:v23 db:self->_db];

  v171 = (void *)v24;
  if (v24)
  {
    id v166 = v16;
    v163 = v17;
    v164 = v19;
    if ([(BRCServerZone *)self isSharedZone])
    {
      v25 = v16;
      v26 = v170;
LABEL_38:
      uint64_t v177 = 0;
      if ([(BRCServerZone *)self isSharedZone]
        && ([v17 parentID],
            v58 = objc_claimAutoreleasedReturnValue(),
            char v59 = [v58 isSharedZoneRoot],
            v58,
            (v59 & 1) == 0))
      {
        db = self->_db;
        v62 = [(BRCServerZone *)self dbRowID];
        id v63 = [(BRCPQLConnection *)db fetch:@"SELECT item_favoriterank, item_lastusedtime, item_finder_tags, item_side_car_ckinfo FROM server_items WHERE item_id = %@ AND zone_rowid = %@", v25, v62];

        int v64 = [v63 next];
        if (v64)
        {
          objc_msgSend(v17, "setFavoriteRank:", objc_msgSend(v63, "longLongAtIndex:", 0));
          objc_msgSend(v17, "setLastUsedTime:", objc_msgSend(v63, "longLongAtIndex:", 1));
          v65 = [v63 dataAtIndex:2];
          [v17 setFinderTags:v65];

          v168 = [v63 objectOfClass:objc_opt_class() atIndex:3];
          id v66 = v63;
        }
        else
        {
          v67 = [(BRCServerZone *)self asSharedZone];
          v68 = [v25 sideCarRecordNameWithZone:v67];

          id v66 = [(BRCPQLConnection *)self->_db fetch:@"SELECT item_favoriterank, item_lastusedtime, item_finder_tags, item_side_car_ckinfo FROM side_car_lookahead WHERE record_name = %@", v68];
          if ([v66 next])
          {
            objc_msgSend(v17, "setFavoriteRank:", objc_msgSend(v66, "longLongAtIndex:", 0));
            objc_msgSend(v17, "setLastUsedTime:", objc_msgSend(v66, "longLongAtIndex:", 1));
            v69 = [v66 dataAtIndex:2];
            [v17 setFinderTags:v69];

            v168 = [v66 objectOfClass:objc_opt_class() atIndex:3];
            [(BRCPQLConnection *)self->_db execute:@"DELETE FROM side_car_lookahead WHERE record_name = %@", v68];
          }
          else
          {
            v168 = 0;
          }
        }
        char v60 = v64 ^ 1;
      }
      else
      {
        v168 = 0;
        char v60 = 0;
      }
      unsigned int v70 = [v17 type];
      uint64_t v71 = -1;
      if (v70 <= 0xA && ((1 << v70) & 0x611) != 0)
      {
        [v19 deserializeFolderSharingOptions:&v177];
        if (([(BRCServerZone *)self state] & 4) != 0)
        {
          [v17 setType:0];
        }
        else
        {
          id v72 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT item_type FROM server_items WHERE item_id = %@ AND zone_rowid = %@", v25, self->_dbRowID];
          v73 = v72;
          if (v72)
          {
            objc_msgSend(v17, "setType:", (char)objc_msgSend(v72, "longLongValue"));
            unsigned int v117 = [v17 type];
            if (v117 > 0xA || ((1 << v117) & 0x611) == 0)
            {
              v118 = v26;
              v119 = self;
              v120 = v118;
              v121 = brc_bread_crumbs();
              v122 = brc_default_log();
              if (os_log_type_enabled(v122, OS_LOG_TYPE_FAULT)) {
                -[BRCServerZone _saveItemID:stat:serverMetrics:record:origName:base:no:ext:].cold.4();
              }

              v123 = v120;
              self = v119;
              v26 = v123;
            }
          }
          else
          {
            v74 = [(BRCServerZone *)self mangledID];
            v75 = +[BRCUserDefaults defaultsForMangledID:v74];
            int v76 = [v75 forceDeltaInitialSync];

            if (v76) {
              uint64_t v77 = 0;
            }
            else {
              uint64_t v77 = 9;
            }
            [v17 setType:v77];
            char v60 = 1;
          }
        }
        uint64_t v71 = -5;
      }
      v78 = [v19 parent];

      if (v78)
      {
        unsigned int v79 = [v17 type];
        uint64_t v165 = 2;
        if (v79 > 0xA || ((1 << v79) & 0x611) == 0) {
          goto LABEL_71;
        }
        if (([v19 hasChainPCS] & 1) == 0)
        {
          v80 = brc_bread_crumbs();
          v81 = brc_default_log();
          if (os_log_type_enabled(v81, (os_log_type_t)0x90u)) {
            -[BRCServerZone _saveItemID:stat:serverMetrics:record:origName:base:no:ext:]();
          }

          v82 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __76__BRCServerZone__saveItemID_stat_serverMetrics_record_origName_base_no_ext___block_invoke;
          block[3] = &unk_1E6993628;
          block[4] = self;
          id v176 = v25;
          dispatch_async(v82, block);
        }
        uint64_t v83 = 2;
      }
      else if ([v19 hasChainPCS])
      {
        uint64_t v83 = 4;
      }
      else
      {
        uint64_t v83 = 1;
      }
      uint64_t v165 = v83;
LABEL_71:
      v162 = self;
      if (v60) {
        goto LABEL_72;
      }
      uint64_t v152 = v177;
      v154 = self->_db;
      v150 = [v17 ckInfo];
      int v148 = [v17 state];
      int v146 = [v17 type];
      int v144 = [v17 mode];
      uint64_t v142 = [v17 birthtime];
      uint64_t v140 = [v17 lastUsedTime];
      uint64_t v138 = [v17 favoriteRank];
      v161 = [v17 parentID];
      v99 = (__CFString *)v17[7];
      if (!v99) {
        v99 = &stru_1F2AC7720;
      }
      v136 = v99;
      unsigned int v134 = [v17 isHiddenExt];
      v159 = [v17 finderTags];
      v156 = [v17 xattrSignature];
      v130 = [v17 trashPutBackPath];
      v132 = [v17 trashPutBackParentID];
      v100 = [v17 aliasTarget];
      v126 = [v17 creatorRowID];
      v101 = [v26 quotaUsed];
      v102 = [v26 recursiveChildCount];
      v103 = [v26 sharedByMeRecursiveCount];
      [v26 sharedAliasRecursiveCount];
      v104 = uint64_t v128 = v71;
      v105 = [v26 childCount];
      BOOL v106 = -[BRCPQLConnection execute:](v154, "execute:", @"UPDATE server_items SET   item_rank = NULL, item_depth = 0, item_origname = %@, pcs_state = %d, item_sharing_options = (%lu | (item_sharing_options & %lu)), item_side_car_ckinfo = %@, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, quota_used = %@, recursive_child_count = %@, shared_children_count = %@, shared_alias_count = %@, child_count = %@ WHERE item_id = %@ AND zone_rowid = %@", v172, v165, v152, v128, v168, v150, v148, v146, v144, v142, v140, v138, v161, v136, v134, v159,
               v156,
               v130,
               v132,
               v100,
               v126,
               v101,
               v102,
               v103,
               v104,
               v105,
               v25,
               self->_dbRowID);

      if (!v106)
      {
        BOOL v29 = 0;
        v25 = v166;
        v26 = v170;
        v17 = v163;
        v19 = v164;
        goto LABEL_94;
      }
      v25 = v166;
      v26 = v170;
      v17 = v163;
      if (![(BRCPQLConnection *)self->_db changes])
      {
LABEL_72:
        v84 = v26;
        if (([v25 isDocumentsFolder] & 1) == 0
          && [(NSArray *)self->_directoriesCreatedLastSyncUp containsObject:v25]
          && [v17 type] == 9)
        {
          v85 = brc_bread_crumbs();
          v86 = brc_default_log();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
          {
            v87 = [v25 debugItemIDString];
            *(_DWORD *)buf = 138412546;
            id v179 = v87;
            __int16 v180 = 2112;
            id v181 = v85;
            _os_log_impl(&dword_1D353B000, v86, OS_LOG_TYPE_DEFAULT, "[NOTICE] Promoting %@ to be a normal directory because it was created from our own sync up%@", buf, 0x16u);
          }
          [v17 setType:0];
        }
        uint64_t v151 = v177;
        v153 = self->_db;
        v149 = [v17 ckInfo];
        int v147 = [v17 state];
        int v145 = [v17 type];
        int v143 = [v17 mode];
        uint64_t v141 = [v17 birthtime];
        uint64_t v139 = [v17 lastUsedTime];
        uint64_t v137 = [v17 favoriteRank];
        v160 = [v17 parentID];
        v88 = (__CFString *)v17[7];
        if (!v88) {
          v88 = &stru_1F2AC7720;
        }
        v135 = v88;
        unsigned int v133 = [v17 isHiddenExt];
        v158 = [v17 finderTags];
        v155 = [v17 xattrSignature];
        v131 = [v17 trashPutBackPath];
        v89 = [v17 trashPutBackParentID];
        v90 = [v17 aliasTarget];
        v91 = [v17 creatorRowID];
        dbRowID = self->_dbRowID;
        v92 = [v84 quotaUsed];
        v129 = [v84 recursiveChildCount];
        v93 = [v84 sharedByMeRecursiveCount];
        [v84 sharedAliasRecursiveCount];
        v95 = v94 = v84;
        v96 = [v84 childCount];
        BOOL v97 = -[BRCPQLConnection execute:](v153, "execute:", @"INSERT INTO server_items(item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_rank, item_origname, pcs_state, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, zone_rowid, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count) VALUES(%@, %@, %ld, %@, NULL, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@)", v166, v171, v151, v168, v172, v165, v149, v147, v145, v143, v141, v139, v137, v160, v135, v133,
                v158,
                v155,
                v131,
                v89,
                v90,
                v91,
                dbRowID,
                v92,
                v129,
                v93,
                v95,
                v96);

        v98 = v94;
        v17 = v163;

        self = v162;
        v26 = v98;

        v25 = v166;
        if (!v97)
        {
          BOOL v29 = 0;
          v19 = v164;
LABEL_94:

          goto LABEL_95;
        }
      }
      v19 = v164;
      if ([(BRCPQLConnection *)self->_db changes] != 1)
      {
        v115 = brc_bread_crumbs();
        v116 = brc_default_log();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_FAULT)) {
          -[BRCServerZone _saveItemID:stat:serverMetrics:record:origName:base:no:ext:]();
        }
      }
      unsigned int v107 = [v17 type];
      if (v107 <= 0xA
        && ((1 << v107) & 0x611) != 0
        && ([v164 modificationDate],
            v108 = objc_claimAutoreleasedReturnValue(),
            [v108 timeIntervalSince1970],
            uint64_t v110 = (uint64_t)v109,
            v108,
            ![(BRCPQLConnection *)self->_db execute:@"UPDATE server_items SET  version_mtime = %lld  WHERE item_id = %@ AND zone_rowid = %@", v110, v25, self->_dbRowID]))
      {
        BOOL v29 = 0;
      }
      else
      {
        if ([(BRCPQLConnection *)self->_db changes] != 1)
        {
          v124 = brc_bread_crumbs();
          v125 = brc_default_log();
          if (os_log_type_enabled(v125, OS_LOG_TYPE_FAULT)) {
            -[BRCServerZone _saveItemID:stat:serverMetrics:record:origName:base:no:ext:]();
          }
        }
        BOOL v29 = 1;
      }
      goto LABEL_94;
    }
    objc_super v30 = self->_db;
    v31 = [v17 parentID];
    v32 = [v17 logicalName];
    v25 = v16;
    id v33 = [(PQLConnection *)v30 itemIDWithSQL:@"SELECT item_id FROM server_items  WHERE item_id != %@ AND item_parent_id = %@ AND item_filename = %@ AND +zone_rowid = %@", v16, v31, v32, self->_dbRowID];

    if (!v33)
    {
      v26 = v170;
LABEL_37:

      v19 = v164;
      goto LABEL_38;
    }
    v34 = self->_db;
    v35 = [v17 parentID];
    id v36 = [(BRCPQLConnection *)v34 fetch:@"SELECT item_origname, item_filename FROM server_items  WHERE item_id = %@ AND item_parent_id = %@ AND +zone_rowid = %@", v16, v35, self->_dbRowID];

    if ([v36 next])
    {
      v37 = [v36 stringAtIndex:0];
      v38 = [v17 logicalName];
      int v39 = [v37 isEqualToString:v38];

      if (v39)
      {
        v40 = brc_bread_crumbs();
        v41 = brc_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          id v179 = v16;
          __int16 v180 = 2112;
          id v181 = v33;
          __int16 v182 = 2112;
          v183 = v40;
          _os_log_debug_impl(&dword_1D353B000, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] Keeping bounce of %@ even though it clashes with %@%@", buf, 0x20u);
        }

        v167 = v36;
        v42 = [v36 stringAtIndex:1];
        [v17 setLogicalName:v42];
        v43 = v172;
        id v172 = v37;
        v26 = v170;
        goto LABEL_34;
      }
    }
    unint64_t v44 = [v169 integerValue];
    if (v44 <= 1) {
      uint64_t v45 = 1;
    }
    else {
      uint64_t v45 = v44;
    }
    uint64_t v46 = v45 + 1;
    if (v45 == -1)
    {
      v25 = v16;
      v26 = v170;
LABEL_36:

      goto LABEL_37;
    }
    v167 = v36;
    while (1)
    {
      v47 = NSString;
      v48 = [NSNumber numberWithUnsignedInteger:v46];
      v49 = [v48 stringValue];
      v42 = objc_msgSend(v47, "br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v174, v49, v173, 0);

      if (![(BRCPQLConnection *)self->_db execute:@"UPDATE OR IGNORE server_items SET  item_rank = NULL, item_depth = 0, item_filename = %@, item_origname = IFNULL(item_origname, item_filename) WHERE zone_rowid = %@ AND item_id = %@", v42, self->_dbRowID, v33])
      {
        v50 = brc_bread_crumbs();
        v51 = brc_default_log();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        {
          v157 = [(BRCPQLConnection *)self->_db lastError];
          v55 = [v157 localizedDescription];
          *(_DWORD *)buf = 138412546;
          id v179 = v55;
          __int16 v180 = 2112;
          id v181 = v50;
          _os_log_fault_impl(&dword_1D353B000, v51, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: got a SQL Error: %@%@", buf, 0x16u);
        }
      }
      if ([(BRCPQLConnection *)self->_db changes]) {
        break;
      }
      v52 = brc_bread_crumbs();
      v53 = brc_default_log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v179 = v33;
        __int16 v180 = 2112;
        id v181 = v42;
        __int16 v182 = 2112;
        v183 = v52;
        _os_log_debug_impl(&dword_1D353B000, v53, OS_LOG_TYPE_DEBUG, "[DEBUG] Not bouncing %@ to %@ because that's not a unique filename%@", buf, 0x20u);
      }

      if (__CFADD__(v46++, 1))
      {
        v26 = v170;
        v25 = v16;
        goto LABEL_35;
      }
    }
    v43 = brc_bread_crumbs();
    v56 = brc_default_log();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = [v17 logicalName];
      *(_DWORD *)buf = 138413314;
      id v179 = v33;
      __int16 v180 = 2112;
      id v181 = v57;
      __int16 v182 = 2112;
      v183 = v42;
      __int16 v184 = 2112;
      id v185 = v16;
      __int16 v186 = 2112;
      v187 = v43;
      _os_log_impl(&dword_1D353B000, v56, OS_LOG_TYPE_DEFAULT, "[WARNING] Bounced itemID %@ from \"%@\" to \"%@\" because it clashes with %@%@", buf, 0x34u);
    }
    v25 = v16;
    v26 = v170;
LABEL_34:

LABEL_35:
    id v36 = v167;
    goto LABEL_36;
  }
  v27 = brc_bread_crumbs();
  v28 = brc_default_log();
  v25 = v16;
  if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
  {
    v112 = [v19 recordID];
    v113 = [v112 zoneID];
    v114 = [v113 ownerName];
    *(_DWORD *)buf = 138412802;
    id v179 = v16;
    __int16 v180 = 2112;
    id v181 = v114;
    __int16 v182 = 2112;
    v183 = v27;
    _os_log_error_impl(&dword_1D353B000, v28, (os_log_type_t)0x90u, "[ERROR] can't save %@: missing ownerKey for ownerName \"%@\"%@", buf, 0x20u);
  }
  BOOL v29 = 0;
  v26 = v170;
LABEL_95:

  return v29;
}

void __76__BRCServerZone__saveItemID_stat_serverMetrics_record_origName_base_no_ext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) mangledID];
  NSUInteger v3 = [*(id *)(a1 + 32) clientZone];
  uint64_t v4 = [v3 enhancedDrivePrivacyEnabled];
  unint64_t v5 = [*(id *)(a1 + 40) itemIDString];
  id v7 = +[AppTelemetryTimeSeriesEvent newChainedDirectoryMissingChainPCSEventWithZoneMangledID:v2 enhancedDrivePrivacyEnabled:v4 itemIDString:v5];

  v6 = [*(id *)(*(void *)(a1 + 32) + 16) analyticsReporter];
  [v6 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v7];
}

- (BOOL)_saveItemID:(id)a3 stat:(id)a4 serverMetrics:(id)a5 record:(id)a6 error:(id *)a7
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v11 = (id *)a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v80 = 0;
  id v81 = 0;
  id v79 = 0;
  v15 = [v12 logicalName];
  char v16 = objc_msgSend(v15, "br_nameIsRepresentableOnHFS");

  v17 = 0;
  id v18 = 0;
  if ((v16 & 1) == 0)
  {
    id v78 = 0;
    char v19 = [v14 deserializeFilename:0 basename:&v81 bounceno:&v79 extension:&v80 userInfo:0 error:&v78];
    v17 = (char *)v78;
    if ((v19 & 1) == 0)
    {
      brc_bread_crumbs();
      v41 = (id *)objc_claimAutoreleasedReturnValue();
      v42 = brc_default_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v83 = v17;
        __int16 v84 = 2112;
        v85 = (const char *)v14;
        __int16 v86 = 2112;
        v87 = v41;
        _os_log_fault_impl(&dword_1D353B000, v42, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't deserialize filename: %@ of %@%@", buf, 0x20u);
      }

      if (!a7)
      {
        id v18 = 0;
        goto LABEL_58;
      }
      v43 = v17;
      v17 = v43;
      id v18 = 0;
      goto LABEL_49;
    }
    v74 = a7;
    id v20 = v13;
    id v18 = [v12 logicalName];
    v21 = NSString;
    id v22 = v81;
    v23 = [v79 stringValue];
    uint64_t v24 = objc_msgSend(v21, "br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v22, v23, v80, 0);
    [v12 setLogicalName:v24];

    v25 = brc_bread_crumbs();
    v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [v12 logicalName];
      v28 = [v14 lastModifiedUserRecordID];
      *(_DWORD *)buf = 138413314;
      uint64_t v83 = v27;
      __int16 v84 = 2112;
      v85 = v18;
      __int16 v86 = 2112;
      v87 = v11;
      __int16 v88 = 2112;
      v89 = v28;
      __int16 v90 = 2112;
      v91 = v25;
      _os_log_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] changing filename to \"%@\" because \"%@\" is unrepresentable (item ID: %@, last editor: %@)%@", buf, 0x34u);
    }
    id v13 = v20;
    a7 = v74;
  }
  BOOL v29 = [v12 logicalName];
  int v30 = objc_msgSend(v29, "br_isSideFaultName");

  v31 = [v12 logicalName];
  int v32 = objc_msgSend(v31, "br_isExcludedWithMaximumDepth:", 1);

  if ((v30 & 1) == 0 && !v32)
  {
    id v33 = self;
    goto LABEL_35;
  }
  if (!v18)
  {
    id v18 = [v12 logicalName];
  }
  v34 = objc_msgSend(NSString, "br_emptyFilenameAlternativeName");
  id v35 = v81;
  id v81 = v34;

  id v36 = v79;
  id v79 = 0;

  v37 = [v12 logicalName];
  objc_msgSend(v37, "br_pathExtension");
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  int v39 = v80;
  v80 = v38;

  v75 = v11;
  if (v80)
  {
    v40 = objc_msgSend(v81, "stringByAppendingPathExtension:");
    [v12 setLogicalName:v40];
  }
  else
  {
    [v12 setLogicalName:v81];
  }
  id v44 = v13;
  uint64_t v45 = [v12 logicalName];
  if (objc_msgSend(v45, "br_isSideFaultName"))
  {
  }
  else
  {
    uint64_t v46 = [v12 logicalName];
    int v47 = objc_msgSend(v46, "br_isExcludedWithMaximumDepth:", 1);

    if (!v47) {
      goto LABEL_28;
    }
  }
  if [v12 type] == 1 && (objc_msgSend(v18, "br_isPackageRoot")) {
    v48 = @"pkg";
  }
  else {
    v48 = 0;
  }
  v49 = v80;
  v80 = v48;

  if (v80)
  {
    v50 = objc_msgSend(v81, "stringByAppendingPathExtension:");
    [v12 setLogicalName:v50];
  }
  else
  {
    [v12 setLogicalName:v81];
  }
LABEL_28:
  v51 = brc_bread_crumbs();
  v52 = brc_default_log();
  if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
  {
    unsigned int v70 = [v12 logicalName];
    uint64_t v71 = "an excluded";
    *(_DWORD *)buf = 138413058;
    uint64_t v83 = v70;
    __int16 v84 = 2112;
    if (v30) {
      uint64_t v71 = "a side fault";
    }
    v85 = v18;
    __int16 v86 = 2080;
    v87 = (id *)v71;
    __int16 v88 = 2112;
    v89 = v51;
    _os_log_error_impl(&dword_1D353B000, v52, (os_log_type_t)0x90u, "[ERROR] changing filename to \"%@\" because \"%@\" is %s name%@", buf, 0x2Au);
  }
  v53 = [v12 logicalName];
  if (objc_msgSend(v53, "br_isSideFaultName"))
  {

    id v13 = v44;
    id v33 = self;
  }
  else
  {
    v54 = [v12 logicalName];
    int v55 = objc_msgSend(v54, "br_isExcludedWithMaximumDepth:", 1);

    id v13 = v44;
    id v33 = self;
    if (!v55)
    {
      id v11 = v75;
      goto LABEL_35;
    }
  }
  v56 = brc_bread_crumbs();
  v57 = brc_default_log();
  id v11 = v75;
  if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
    -[BRCServerZone _saveItemID:stat:serverMetrics:record:error:]();
  }

LABEL_35:
  if (!v81)
  {
    uint64_t v77 = v17;
    int v58 = [v14 deserializeFilename:0 basename:&v81 bounceno:&v79 extension:&v80 userInfo:0 error:&v77];
    char v59 = v77;

    if (!v58)
    {
      brc_bread_crumbs();
      v62 = (id *)objc_claimAutoreleasedReturnValue();
      id v63 = brc_default_log();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v83 = v59;
        __int16 v84 = 2112;
        v85 = (const char *)v14;
        __int16 v86 = 2112;
        v87 = v62;
        _os_log_fault_impl(&dword_1D353B000, v63, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't deserialize filename: %@ of %@%@", buf, 0x20u);
      }

      if (!a7)
      {
        v17 = v59;
        goto LABEL_58;
      }
      v43 = v59;
      v17 = v43;
      goto LABEL_49;
    }
    v17 = v59;
    id v33 = self;
  }
  if (-[BRCServerZone _saveItemID:stat:serverMetrics:record:origName:base:no:ext:](v33, "_saveItemID:stat:serverMetrics:record:origName:base:no:ext:", v11, v12, v13, v14, v18, v79, v80))
  {
    if ([(BRCPQLConnection *)v33->_db changes])
    {
      LOBYTE(a7) = 1;
    }
    else
    {
      id v65 = v14;
      id v66 = a7;
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"no record to update: %@", v11);
      a7 = (id *)objc_claimAutoreleasedReturnValue();
      if (a7)
      {
        v67 = brc_bread_crumbs();
        v68 = brc_default_log();
        if (os_log_type_enabled(v68, (os_log_type_t)0x90u))
        {
          v73 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          uint64_t v83 = "-[BRCServerZone _saveItemID:stat:serverMetrics:record:error:]";
          __int16 v84 = 2080;
          if (!v66) {
            v73 = "(ignored by caller)";
          }
          v85 = v73;
          __int16 v86 = 2112;
          v87 = a7;
          __int16 v88 = 2112;
          v89 = v67;
          _os_log_error_impl(&dword_1D353B000, v68, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (v66) {
        *id v66 = a7;
      }

      LOBYTE(a7) = 0;
      id v14 = v65;
    }
    goto LABEL_58;
  }
  brc_bread_crumbs();
  char v60 = (id *)objc_claimAutoreleasedReturnValue();
  v61 = brc_default_log();
  if (os_log_type_enabled(v61, (os_log_type_t)0x90u))
  {
    id v72 = [(BRCPQLConnection *)v33->_db lastError];
    *(_DWORD *)buf = 138412802;
    uint64_t v83 = (const char *)v11;
    __int16 v84 = 2112;
    v85 = v72;
    __int16 v86 = 2112;
    v87 = v60;
    _os_log_error_impl(&dword_1D353B000, v61, (os_log_type_t)0x90u, "[ERROR] Failed to update record (%@): %@%@", buf, 0x20u);

    id v33 = self;
  }

  if (a7)
  {
    v43 = [(BRCPQLConnection *)v33->_db lastError];
LABEL_49:
    int v64 = a7;
    LOBYTE(a7) = 0;
    *int v64 = v43;
  }
LABEL_58:

  return (char)a7;
}

- (BOOL)_saveItemID:(id)a3 version:(id)a4 record:(id)a5 contentBoundaryKey:(id)a6 iWorkSharingOptions:(unint64_t)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v26 = a5;
  db = self->_db;
  id v33 = [v11 originalPOSIXName];
  int v32 = [v11 ckInfo];
  uint64_t v31 = [v11 mtime];
  uint64_t v30 = [v11 size];
  uint64_t v29 = [v11 thumbnailSize];
  v28 = [v11 thumbnailSignature];
  id v12 = [v11 contentSignature];
  id v13 = [v11 xattrSignature];
  id v14 = [v11 editedSinceShared];
  v15 = [v11 lastEditorDeviceOrUserRowID];
  char v16 = [v11 conflictLoserEtags];
  v17 = [v11 quarantineInfo];
  id v27 = v10;
  LOBYTE(v10) = [(BRCPQLConnection *)db execute:@"UPDATE server_items    SET item_rank = NULL, item_depth = 0, item_sharing_options = (%lu | (item_sharing_options & %lu)), version_name = %@, version_ckinfo = %@, version_mtime = %lld, version_size = %lld, version_thumb_size = %lld, version_thumb_signature = %@, version_content_signature = %@, version_xattr_signature = %@, version_edited_since_shared = %@, version_device = %@, version_conflict_loser_etags = %@, version_quarantine_info = %@  WHERE item_id = %@ AND zone_rowid = %@", a7, -8, v33, v32, v31, v30, v29, v28, v12, v13, v14, v15, v16, v17, v10, self->_dbRowID];

  if ((v10 & 1) == 0)
  {
    v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
    {
      id v20 = v26;
      uint64_t v24 = [v26 debugDescription];
      v25 = [(BRCPQLConnection *)self->_db lastError];
      *(_DWORD *)buf = 138412802;
      v37 = v24;
      __int16 v38 = 2112;
      id v39 = v25;
      __int16 v40 = 2112;
      v41 = v21;
      _os_log_error_impl(&dword_1D353B000, v22, (os_log_type_t)0x90u, "[ERROR] failed saving document %@: %@%@", buf, 0x20u);

      BOOL v18 = 0;
      char v19 = v27;
    }
    else
    {
      BOOL v18 = 0;
      id v20 = v26;
      char v19 = v27;
    }
LABEL_11:

    goto LABEL_12;
  }
  if ([(BRCPQLConnection *)self->_db changes] != 1)
  {
    id v20 = v26;
    char v19 = v27;
    if (([(BRCServerZone *)self state] & 4) != 0 || [(BRCPQLConnection *)self->_db changes])
    {
      v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v37 = v27;
        __int16 v38 = 2112;
        id v39 = v11;
        __int16 v40 = 2112;
        v41 = v21;
        _os_log_fault_impl(&dword_1D353B000, v22, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: document without a structure:\n    i:%@ %@\n\n   this typically indicates either of two problems:\n    - either we failed processing the last sync down and we\n       failed inserting the structure record,\n    - or the server forgot to send us a structure record.%@", buf, 0x20u);
      }
      BOOL v18 = 0;
    }
    else
    {
      v21 = brc_bread_crumbs();
      BOOL v18 = 1;
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v37 = v27;
        __int16 v38 = 2112;
        id v39 = v11;
        __int16 v40 = 2112;
        v41 = v21;
        _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Document without a structure record but we haven't completed full sync.  Dropping the record on the floor for now i:%@ %@%@", buf, 0x20u);
      }
    }
    goto LABEL_11;
  }
  BOOL v18 = 1;
  id v20 = v26;
  char v19 = v27;
LABEL_12:

  return v18;
}

- (BOOL)_saveEditedDirOrDocStructureRecord:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id location = 0;
  id v7 = [v6 recordID];
  char v8 = objc_msgSend(v7, "brc_itemIDWithSession:error:", self->_session, &location);

  id v23 = 0;
  id v24 = 0;
  v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BRCServerZone _saveEditedDirOrDocStructureRecord:error:]();
  }

  if (!v8)
  {
    id v14 = location;
    if (v14)
    {
      v15 = brc_bread_crumbs();
      char v16 = brc_default_log();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v27 = "-[BRCServerZone _saveEditedDirOrDocStructureRecord:error:]";
        __int16 v28 = 2080;
        if (!a4) {
          v21 = "(ignored by caller)";
        }
        id v29 = (id)v21;
        __int16 v30 = 2112;
        id v31 = v14;
        __int16 v32 = 2112;
        id v33 = v15;
        _os_log_error_impl(&dword_1D353B000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v14;
    }

    goto LABEL_16;
  }
  session = self->_session;
  id obj = location;
  char v12 = [v6 deserializeStatInfo:&v24 serverMetrics:&v23 itemID:v8 session:session error:&obj];
  objc_storeStrong(&location, obj);
  if ((v12 & 1) == 0)
  {
    v17 = brc_bread_crumbs();
    BOOL v18 = brc_default_log();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      id v20 = [v6 debugDescription];
      *(_DWORD *)buf = 138412802;
      id v27 = v20;
      __int16 v28 = 2112;
      id v29 = location;
      __int16 v30 = 2112;
      id v31 = v17;
      _os_log_error_impl(&dword_1D353B000, v18, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);
    }
    if (a4)
    {
      BOOL v13 = 0;
      *a4 = location;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v13 = 0;
    goto LABEL_17;
  }
  BOOL v13 = [(BRCServerZone *)self _saveItemID:v8 stat:v24 serverMetrics:v23 record:v6 error:a4];
LABEL_17:

  return v13;
}

- (BOOL)_saveEditedDocumentContentRecord:(id)a3 error:(id *)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id location = 0;
  id v7 = [v6 recordID];
  char v8 = objc_msgSend(v7, "brc_itemIDWithSession:error:", self->_session, &location);

  if ([(BRCServerZone *)self isSharedZone])
  {
    v9 = [v6 share];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  id v11 = brc_bread_crumbs();
  char v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRCServerZone _saveEditedDocumentContentRecord:error:]();
  }

  if (!v8)
  {
    id v33 = location;
    if (v33)
    {
      uint64_t v34 = brc_bread_crumbs();
      id v35 = brc_default_log();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        uint64_t v46 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v79 = "-[BRCServerZone _saveEditedDocumentContentRecord:error:]";
        __int16 v80 = 2080;
        if (!a4) {
          uint64_t v46 = "(ignored by caller)";
        }
        id v81 = (id)v46;
        __int16 v82 = 2112;
        id v83 = v33;
        __int16 v84 = 2112;
        v85 = v34;
        _os_log_error_impl(&dword_1D353B000, v35, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v33;
    }

    id v17 = 0;
    id v18 = 0;
    id v16 = 0;
    goto LABEL_38;
  }
  id v76 = 0;
  if (v10) {
    BOOL v13 = &v75;
  }
  else {
    BOOL v13 = 0;
  }
  if (v10) {
    id v75 = 0;
  }
  id v74 = 0;
  id v14 = [(BRCServerZone *)self clientZone];
  id obj = location;
  char v15 = [v6 deserializeVersion:&v76 fakeStatInfo:v13 contentBoundaryKey:&v74 clientZone:v14 error:&obj];
  id v16 = v76;
  id v17 = 0;
  if (v10) {
    id v17 = v75;
  }
  id v18 = v74;
  objc_storeStrong(&location, obj);

  if (v15)
  {
    if (v10
      && ![(BRCServerZone *)self _saveItemID:v8 stat:v17 serverMetrics:0 record:v6 error:a4])
    {
      goto LABEL_38;
    }
    id v71 = location;
    uint64_t v72 = 0;
    char v19 = [v6 deserializeiWorkSharingOptions:&v72 error:&v71];
    objc_storeStrong(&location, v71);
    if (v19)
    {
      id v20 = [v6 creatorUserRecordID];
      id v63 = [v20 recordName];

      v21 = [(BRCAccountSession *)self->_session cachedCurrentUserRecordName];
      id v70 = 0;
      id v22 = objc_msgSend(v6, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v21, &v70);
      id v64 = v70;

      if (v22)
      {
        if (([v63 isEqualToString:v22] & 1) == 0)
        {
          id v23 = [v16 editedSinceShared];
          char v24 = [v23 BOOLValue];

          if ((v24 & 1) == 0)
          {
            v25 = v22;
            id v26 = brc_bread_crumbs();
            id v27 = brc_default_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
              -[BRCServerZone _saveEditedDocumentContentRecord:error:]();
            }

            [v16 setEditedSinceShared:MEMORY[0x1E4F1CC38]];
            id v22 = v25;
          }
        }
      }
      if ([v22 isEqualToString:*MEMORY[0x1E4F19C08]])
      {
        __int16 v28 = [v16 lastEditorDeviceName];
        uint64_t v29 = [v28 rangeOfString:@":_"];
        session = self->_session;
        id v31 = v22;
        if (v29 == 64)
        {
          __int16 v32 = [(BRCAccountSession *)session createUserKeyForOwnerName:v22];
          [v16 setLastEditorRowID:v32];
        }
        else
        {
          __int16 v32 = [(BRCAccountSession *)session createDeviceKeyForNameInServerDB:v28];
          [v16 setLastEditorDeviceRowID:v32];
        }

        id v22 = v31;
        goto LABEL_54;
      }
      v41 = [(BRCAccountSession *)self->_session createUserKeyForOwnerName:v22];
      [v16 setLastEditorRowID:v41];

      if (!v64)
      {
        __int16 v28 = 0;
LABEL_54:
        v50 = v63;
        goto LABEL_55;
      }
      uint64_t v42 = [(BRCAccountSession *)self->_session serverDB];
      v61 = v22;
      v43 = +[BRCAccountSession userIdentityForName:v22 db:v42];
      id v44 = v43;
      if (v43) {
        uint64_t v45 = v43;
      }
      else {
        uint64_t v45 = objc_alloc_init(BRFieldUserIdentity);
      }
      __int16 v28 = v45;

      uint64_t v47 = [v28 nameComponents];
      if (v47)
      {
        v48 = (void *)v47;
        v49 = [v28 nameComponents];
        if (objc_msgSend(v49, "br_shouldOverwriteExistingName"))
        {
          char v60 = objc_msgSend(v64, "br_shouldOverwriteExistingName");

          if ((v60 & 1) == 0) {
            goto LABEL_53;
          }
        }
        else
        {
        }
        id v22 = v61;
        v50 = v63;
LABEL_55:

        if ([v16 isPackage])
        {
          id v68 = location;
          id v69 = 0;
          char v51 = [v6 deserializeFilename:0 basename:0 bounceno:0 extension:&v69 userInfo:0 error:&v68];
          objc_storeStrong(&location, v68);
          if ((v51 & 1) == 0)
          {
            v54 = brc_bread_crumbs();
            int v55 = brc_default_log();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v79 = (const char *)location;
              __int16 v80 = 2112;
              id v81 = v6;
              __int16 v82 = 2112;
              id v83 = v54;
              _os_log_fault_impl(&dword_1D353B000, v55, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't deserialize extension: %@ of %@%@", buf, 0x20u);
            }

            if (a4) {
              *a4 = location;
            }

            BOOL v39 = 0;
            goto LABEL_73;
          }
          v52 = [v6 objectForKeyedSubscript:@"ignorePkgExtension"];
          objc_opt_class();
          v62 = v22;
          if (objc_opt_isKindOfClass()) {
            int v53 = [v52 BOOLValue];
          }
          else {
            int v53 = 0;
          }
          if (v69)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && ((objc_msgSend(v69, "brc_isForcedPackageExtension") | v53) & 1) == 0)
            {
              v56 = brc_bread_crumbs();
              v57 = brc_default_log();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
                -[BRCServerZone _saveEditedDocumentContentRecord:error:]();
              }

              objc_msgSend(NSString, "brc_addForcedPackageExtension:", v69);
            }
          }

          id v22 = v62;
        }
        int v58 = [(BRCAccountSession *)self->_session analyticsReporter];
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __56__BRCServerZone__saveEditedDocumentContentRecord_error___block_invoke;
        v65[3] = &unk_1E6996C08;
        id v59 = v6;
        id v66 = v59;
        v67 = self;
        [v58 lookupFSEventToSyncUpEventByItemID:v8 accessor:v65];

        BOOL v39 = [(BRCServerZone *)self _saveItemID:v8 version:v16 record:v59 contentBoundaryKey:v18 iWorkSharingOptions:v72];
LABEL_73:

        goto LABEL_39;
      }
LABEL_53:
      [v28 setNameComponents:v64];
      id v22 = v61;
      [(BRCPQLConnection *)self->_db execute:@"UPDATE users SET user_plist = %@ WHERE user_name = %@", v28, v61];
      goto LABEL_54;
    }
    id v36 = brc_bread_crumbs();
    v37 = brc_default_log();
    if (!os_log_type_enabled(v37, (os_log_type_t)0x90u)) {
      goto LABEL_36;
    }
    __int16 v38 = [v6 debugDescription];
    *(_DWORD *)buf = 138412802;
    id v79 = v38;
    __int16 v80 = 2112;
    id v81 = location;
    __int16 v82 = 2112;
    id v83 = v36;
  }
  else
  {
    id v36 = brc_bread_crumbs();
    v37 = brc_default_log();
    if (!os_log_type_enabled(v37, (os_log_type_t)0x90u)) {
      goto LABEL_36;
    }
    __int16 v38 = [v6 debugDescription];
    *(_DWORD *)buf = 138412802;
    id v79 = v38;
    __int16 v80 = 2112;
    id v81 = location;
    __int16 v82 = 2112;
    id v83 = v36;
  }
  _os_log_error_impl(&dword_1D353B000, v37, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);

LABEL_36:
  if (!a4)
  {
LABEL_38:
    BOOL v39 = 0;
    goto LABEL_39;
  }
  BOOL v39 = 0;
  *a4 = location;
LABEL_39:

  return v39;
}

void __56__BRCServerZone__saveEditedDocumentContentRecord_error___block_invoke(uint64_t a1, void *a2)
{
  NSUInteger v3 = *(void **)(a1 + 32);
  id v4 = a2;
  unint64_t v5 = [v3 modificationDate];
  [v4 setEndTime:v5];

  id v6 = [*(id *)(*(void *)(a1 + 40) + 16) analyticsReporter];
  [v6 submitEventMetric:v4];
}

- (BOOL)_saveEditedSymlinkRecord:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id location = 0;
  id v7 = [v6 recordID];
  char v8 = objc_msgSend(v7, "brc_itemIDWithSession:error:", self->_session, &location);

  id v34 = 0;
  v9 = brc_bread_crumbs();
  BOOL v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BRCServerZone _saveEditedSymlinkRecord:error:]();
  }

  if (!v8)
  {
    id v15 = location;
    if (v15)
    {
      id v16 = brc_bread_crumbs();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        id v27 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v37 = "-[BRCServerZone _saveEditedSymlinkRecord:error:]";
        __int16 v38 = 2080;
        if (!a4) {
          id v27 = "(ignored by caller)";
        }
        id v39 = (id)v27;
        __int16 v40 = 2112;
        id v41 = v15;
        __int16 v42 = 2112;
        v43 = v16;
        _os_log_error_impl(&dword_1D353B000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v15;
    }

    goto LABEL_19;
  }
  session = self->_session;
  id obj = location;
  char v12 = [v6 deserializeStatInfo:&v34 serverMetrics:0 itemID:v8 session:session error:&obj];
  objc_storeStrong(&location, obj);
  if (v12)
  {
    if ([(BRCServerZone *)self _saveItemID:v8 stat:v34 serverMetrics:0 record:v6 error:a4])
    {
      id v31 = location;
      id v32 = 0;
      char v13 = [v6 deserializeSymlinkTarget:&v32 error:&v31];
      objc_storeStrong(&location, v31);
      if (v13)
      {
        if ([(BRCPQLConnection *)self->_db execute:@"UPDATE server_items    SET version_name = %@  WHERE item_id = %@ AND zone_rowid = %@", v32, v8, self->_dbRowID])
        {
          BOOL v14 = 1;
LABEL_31:

          goto LABEL_20;
        }
        char v24 = brc_bread_crumbs();
        v25 = brc_default_log();
        if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
        {
          uint64_t v29 = [v6 debugDescription];
          __int16 v30 = [(BRCPQLConnection *)self->_db lastError];
          *(_DWORD *)buf = 138412802;
          v37 = v29;
          __int16 v38 = 2112;
          id v39 = v30;
          __int16 v40 = 2112;
          id v41 = v24;
          _os_log_error_impl(&dword_1D353B000, v25, (os_log_type_t)0x90u, "[ERROR] failed saving symlink %@: %@%@", buf, 0x20u);
        }
        if (a4)
        {
          id v23 = [(BRCPQLConnection *)self->_db lastError];
          goto LABEL_29;
        }
      }
      else
      {
        v21 = brc_bread_crumbs();
        id v22 = brc_default_log();
        if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
        {
          __int16 v28 = [v6 debugDescription];
          *(_DWORD *)buf = 138412802;
          v37 = v28;
          __int16 v38 = 2112;
          id v39 = location;
          __int16 v40 = 2112;
          id v41 = v21;
          _os_log_error_impl(&dword_1D353B000, v22, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);
        }
        if (a4)
        {
          id v23 = location;
LABEL_29:
          BOOL v14 = 0;
          *a4 = v23;
          goto LABEL_31;
        }
      }
      BOOL v14 = 0;
      goto LABEL_31;
    }
    goto LABEL_19;
  }
  id v18 = brc_bread_crumbs();
  char v19 = brc_default_log();
  if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
  {
    id v26 = [v6 debugDescription];
    *(_DWORD *)buf = 138412802;
    v37 = v26;
    __int16 v38 = 2112;
    id v39 = location;
    __int16 v40 = 2112;
    id v41 = v18;
    _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);
  }
  if (!a4)
  {
LABEL_19:
    BOOL v14 = 0;
    goto LABEL_20;
  }
  BOOL v14 = 0;
  *a4 = location;
LABEL_20:

  return v14;
}

- (BOOL)_saveEditedFinderBookmarkRecord:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 recordID];
  char v8 = objc_msgSend(v7, "brc_itemIDWithSession:", self->_session);

  id v32 = 0;
  v9 = brc_bread_crumbs();
  BOOL v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BRCServerZone _saveEditedFinderBookmarkRecord:error:]();
  }

  session = self->_session;
  id v31 = 0;
  char v12 = [v6 deserializeStatInfo:&v32 serverMetrics:0 itemID:v8 session:session error:&v31];
  id v13 = v31;
  if (v12)
  {
    if ([(BRCServerZone *)self _saveItemID:v8 stat:v32 serverMetrics:0 record:v6 error:a4])
    {
      id v29 = 0;
      id v30 = 0;
      clientZone = self->_clientZone;
      id v28 = v13;
      char v15 = [v6 deserializeVersion:&v30 fakeStatInfo:0 contentBoundaryKey:&v29 clientZone:clientZone error:&v28];
      id v16 = v30;
      id v17 = v29;
      id v18 = v28;

      if (v15)
      {
        BOOL v19 = [(BRCServerZone *)self _saveItemID:v8 version:v16 record:v6 contentBoundaryKey:v17 iWorkSharingOptions:0];
LABEL_18:
        id v13 = v18;
        goto LABEL_19;
      }
      id v23 = brc_bread_crumbs();
      char v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        id v27 = [v6 debugDescription];
        *(_DWORD *)buf = 138412802;
        id v34 = v27;
        __int16 v35 = 2112;
        id v36 = v18;
        __int16 v37 = 2112;
        __int16 v38 = v23;
        _os_log_error_impl(&dword_1D353B000, v24, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);
      }
      if (!a4)
      {
        BOOL v19 = 0;
        goto LABEL_18;
      }
      id v22 = v18;
      id v13 = v22;
      goto LABEL_11;
    }
LABEL_12:
    id v17 = 0;
    id v16 = 0;
    BOOL v19 = 0;
    goto LABEL_19;
  }
  id v20 = brc_bread_crumbs();
  v21 = brc_default_log();
  if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
  {
    id v26 = [v6 debugDescription];
    *(_DWORD *)buf = 138412802;
    id v34 = v26;
    __int16 v35 = 2112;
    id v36 = v13;
    __int16 v37 = 2112;
    __int16 v38 = v20;
    _os_log_error_impl(&dword_1D353B000, v21, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);
  }
  if (!a4) {
    goto LABEL_12;
  }
  id v22 = v13;
  id v13 = v22;
  id v17 = 0;
  id v16 = 0;
LABEL_11:
  BOOL v19 = 0;
  *a4 = v22;
LABEL_19:

  return v19;
}

- (BOOL)_saveEditedAliasRecord:(id)a3 zonesNeedingAllocRanks:(id)a4 error:(id *)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  session = self->_session;
  id v11 = [v8 recordID];
  char v12 = [v11 zoneID];
  id v13 = [v12 ownerName];
  uint64_t v14 = [(BRCAccountSession *)session userKeyForOwnerName:v13 db:self->_db];

  uint64_t v72 = (void *)v14;
  if (v14)
  {
    id location = 0;
    char v15 = [v8 recordID];
    id v16 = objc_msgSend(v15, "brc_itemIDWithSession:error:", self->_session, &location);

    id v74 = 0;
    id v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[BRCServerZone _saveEditedAliasRecord:zonesNeedingAllocRanks:error:]();
    }

    if (v16)
    {
      id v73 = location;
      char v19 = [v8 deserializeAliasInfo:&v74 serverZone:self error:&v73];
      objc_storeStrong(&location, v73);
      if (v19)
      {
        int v58 = a5;
        id v71 = v9;
        dbRowID = self->_dbRowID;
        db = self->_db;
        id v66 = [v8 parent];
        id v65 = [v74 ckInfo];
        int v69 = [v74 state];
        int v64 = [v74 type];
        int v63 = [v74 mode];
        uint64_t v62 = [v74 birthtime];
        uint64_t v61 = [v74 lastUsedTime];
        uint64_t v60 = [v74 favoriteRank];
        id v20 = [v74 parentID];
        if (v74[7]) {
          v21 = v74[7];
        }
        else {
          v21 = &stru_1F2AC7720;
        }
        unsigned int v22 = [v74 isHiddenExt];
        id v59 = [v74 finderTags];
        id v23 = [v74 xattrSignature];
        char v24 = [v74 trashPutBackPath];
        v25 = [v74 trashPutBackParentID];
        id v26 = [v74 aliasTarget];
        uint64_t v27 = [v74 creatorRowID];
        id v28 = v16;
        id v29 = (void *)v27;
        uint64_t v57 = v69;
        id v70 = v28;
        uint64_t v30 = 1;
        if (v66) {
          uint64_t v30 = 2;
        }
        BOOL v31 = -[BRCPQLConnection execute:](db, "execute:", @"INSERT OR REPLACE INTO server_items(zone_rowid, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_rank, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator) VALUES(%@, %d, %@, %@, %ld, %@, NULL, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@)", dbRowID, v30, v28, v72, 0, 0, v65, v57, v64, v63, v62, v61, v60, v20, v21, v22,
                v59,
                v23,
                v24,
                v25,
                v26,
                v27);

        if (v31)
        {
          id v32 = [v74 _aliasTargetMangledID];
          id v33 = [(BRCAccountSession *)self->_session clientZoneByMangledID:v32];
          id v16 = v70;
          id v9 = v71;
          if ([v33 isSharedZone])
          {
            id v34 = self->_db;
            __int16 v35 = [v74 _aliasTargetItemID];
            id v36 = [v33 dbRowID];
            [(BRCPQLConnection *)v34 execute:@"UPDATE server_items SET item_rank = NULL WHERE item_id = %@ AND zone_rowid = %@", v35, v36];

            if ([(BRCPQLConnection *)self->_db changes])
            {
              __int16 v37 = brc_bread_crumbs();
              __int16 v38 = brc_default_log();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                v56 = [v74 _aliasTargetItemID];
                *(_DWORD *)buf = 138412802;
                uint64_t v77 = v56;
                __int16 v78 = 2112;
                id v79 = v70;
                __int16 v80 = 2112;
                id v81 = v37;
                _os_log_debug_impl(&dword_1D353B000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] Requesting a new item rank for target %@ of %@%@", buf, 0x20u);
              }
              uint64_t v39 = [v33 serverZone];
              [v71 addObject:v39];
            }
          }

          BOOL v40 = 1;
          goto LABEL_37;
        }
        v49 = brc_bread_crumbs();
        v50 = brc_default_log();
        id v9 = v71;
        if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
        {
          v54 = [v8 debugDescription];
          int v55 = [(BRCPQLConnection *)self->_db lastError];
          *(_DWORD *)buf = 138412802;
          uint64_t v77 = v54;
          __int16 v78 = 2112;
          id v79 = v55;
          __int16 v80 = 2112;
          id v81 = v49;
          _os_log_error_impl(&dword_1D353B000, v50, (os_log_type_t)0x90u, "[ERROR] failed saving alias %@: %@%@", buf, 0x20u);
        }
        id v16 = v70;
        a5 = v58;
        if (v58)
        {
          id v48 = [(BRCPQLConnection *)self->_db lastError];
          goto LABEL_35;
        }
      }
      else
      {
        uint64_t v46 = brc_bread_crumbs();
        uint64_t v47 = brc_default_log();
        if (os_log_type_enabled(v47, (os_log_type_t)0x90u))
        {
          v52 = [v8 debugDescription];
          *(_DWORD *)buf = 138412802;
          uint64_t v77 = v52;
          __int16 v78 = 2112;
          id v79 = location;
          __int16 v80 = 2112;
          id v81 = v46;
          _os_log_error_impl(&dword_1D353B000, v47, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);
        }
        if (a5)
        {
          id v48 = location;
LABEL_35:
          BOOL v40 = 0;
          *a5 = v48;
LABEL_37:

          goto LABEL_38;
        }
      }
    }
    else
    {
      id v43 = location;
      if (v43)
      {
        uint64_t v44 = brc_bread_crumbs();
        uint64_t v45 = brc_default_log();
        if (os_log_type_enabled(v45, (os_log_type_t)0x90u))
        {
          int v53 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          uint64_t v77 = "-[BRCServerZone _saveEditedAliasRecord:zonesNeedingAllocRanks:error:]";
          __int16 v78 = 2080;
          if (!a5) {
            int v53 = "(ignored by caller)";
          }
          id v79 = (id)v53;
          __int16 v80 = 2112;
          id v81 = v43;
          __int16 v82 = 2112;
          id v83 = v44;
          _os_log_error_impl(&dword_1D353B000, v45, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a5) {
        *a5 = v43;
      }
    }
    BOOL v40 = 0;
    goto LABEL_37;
  }
  id v41 = brc_bread_crumbs();
  __int16 v42 = brc_default_log();
  if (os_log_type_enabled(v42, (os_log_type_t)0x90u)) {
    -[BRCServerZone _saveEditedAliasRecord:zonesNeedingAllocRanks:error:](v8, (uint64_t)v41, v42);
  }

  BOOL v40 = 0;
LABEL_38:

  return v40;
}

- (BOOL)_saveEditedShareRecord:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v38 = 0;
  id v7 = [v6 recordID];
  id v8 = objc_msgSend(v7, "brc_shareItemID");

  id v9 = brc_bread_crumbs();
  BOOL v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BRCServerZone _saveEditedShareRecord:error:].cold.4();
  }

  BOOL v11 = [(BRCServerZone *)self isSharedZone];
  char v12 = [v6 currentUserParticipant];
  uint64_t v13 = [v12 role];

  if (v11)
  {
    if (v13 != 1) {
      goto LABEL_9;
    }
    uint64_t v14 = brc_bread_crumbs();
    char v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCServerZone _saveEditedShareRecord:error:]();
    }
  }
  else
  {
    if (v13 == 1) {
      goto LABEL_9;
    }
    uint64_t v14 = brc_bread_crumbs();
    char v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCServerZone _saveEditedShareRecord:error:]();
    }
  }

LABEL_9:
  [(BRCAccountSession *)self->_session learnParticipantIdentitiesForShare:v6 forceUpdate:0];
  if (!v8)
  {
    char v24 = brc_bread_crumbs();
    v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v40 = v24;
      _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring unknown itemID on share%@", buf, 0xCu);
    }

    id v17 = 0;
    goto LABEL_22;
  }
  id v37 = 0;
  char v16 = [v6 deserializeSharingOptions:&v38 error:&v37];
  id v17 = v37;
  if ((v16 & 1) == 0)
  {
    uint64_t v27 = brc_bread_crumbs();
    id v28 = brc_default_log();
    if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
      id v33 = [v6 debugDescription];
      *(_DWORD *)buf = 138412802;
      BOOL v40 = v33;
      __int16 v41 = 2112;
      id v42 = v17;
      __int16 v43 = 2112;
      uint64_t v44 = v27;
      _os_log_error_impl(&dword_1D353B000, v28, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);
    }
    if (a4)
    {
      id v29 = v17;
      id v17 = v29;
LABEL_31:
      BOOL v26 = 0;
      *a4 = v29;
      goto LABEL_33;
    }
LABEL_32:
    BOOL v26 = 0;
    goto LABEL_33;
  }
  uint64_t v18 = -2;
  if ((v38 & 0x20) == 0) {
    uint64_t v18 = -1;
  }
  if (![(BRCPQLConnection *)self->_db execute:@"UPDATE server_items    SET item_rank = NULL, item_sharing_options = (%lu | (item_sharing_options & %lu)),         item_mode = (%ld | (item_mode & %lu)), item_depth = 0  WHERE item_id = %@ AND zone_rowid = %@", v38, 7, ((unint64_t)(v38 & 0x20) >> 5) ^ 1, v18, v8, self->_dbRowID])
  {
    uint64_t v30 = brc_bread_crumbs();
    BOOL v31 = brc_default_log();
    if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
    {
      id v34 = [v6 debugDescription];
      __int16 v35 = [(BRCPQLConnection *)self->_db lastError];
      *(_DWORD *)buf = 138412802;
      BOOL v40 = v34;
      __int16 v41 = 2112;
      id v42 = v35;
      __int16 v43 = 2112;
      uint64_t v44 = v30;
      _os_log_error_impl(&dword_1D353B000, v31, (os_log_type_t)0x90u, "[ERROR] failed saving document %@: %@%@", buf, 0x20u);
    }
    if (a4)
    {
      id v29 = [(BRCPQLConnection *)self->_db lastError];
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ([(BRCPQLConnection *)self->_db changes] != 1)
  {
    char v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
      -[BRCServerZone _saveEditedShareRecord:error:]();
    }

    if ([(BRCServerZone *)self isPrivateZone])
    {
      v21 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
      unsigned int v22 = [v6 recordID];
      id v23 = [v22 recordName];
      [v21 reportProblemWithType:10 recordName:v23];
    }
  }
LABEL_22:
  BOOL v26 = 1;
LABEL_33:

  return v26;
}

- (BOOL)_saveEditedRecord:(id)a3 zonesNeedingAllocRanks:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [v8 recordID];
  BOOL v11 = [v10 recordName];

  char v12 = [v8 recordType];
  uint64_t v13 = [v8 recordID];
  int v14 = objc_msgSend(v13, "brc_isZoneRootRecordID");

  if (v14)
  {
    char v15 = brc_bread_crumbs();
    char v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  id v17 = [v8 recordID];
  int v18 = objc_msgSend(v17, "brc_isAppLibraryRootRecordID");

  if (v18)
  {
    char v15 = brc_bread_crumbs();
    char v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
LABEL_6:
    }
      -[BRCServerZone _saveEditedRecord:zonesNeedingAllocRanks:error:]();
LABEL_7:

LABEL_8:
    BOOL v19 = 0;
    goto LABEL_21;
  }
  if ([v12 isEqualToString:@"structure"])
  {
    if ([v11 hasPrefix:@"directory/"]
      || [v11 hasPrefix:@"documentStructure/"])
    {
      BOOL v20 = [(BRCServerZone *)self _saveEditedDirOrDocStructureRecord:v8 error:a5];
    }
    else if ([v11 hasPrefix:@"alias/"] {
           || [v11 hasPrefix:@"shareAlias/"])
    }
    {
      BOOL v20 = [(BRCServerZone *)self _saveEditedAliasRecord:v8 zonesNeedingAllocRanks:v9 error:a5];
    }
    else if ([v11 hasPrefix:@"symlink/"])
    {
      BOOL v20 = [(BRCServerZone *)self _saveEditedSymlinkRecord:v8 error:a5];
    }
    else
    {
      if (![v11 hasPrefix:@"finderBookmark/"])
      {
        v25 = brc_bread_crumbs();
        BOOL v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
          -[BRCServerZone _saveEditedRecord:zonesNeedingAllocRanks:error:]();
        }

        uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: structure record which isn't a directory or document");
        if (v27)
        {
          id v28 = brc_bread_crumbs();
          id v29 = brc_default_log();
          if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
          {
            uint64_t v30 = "(passed to caller)";
            int v31 = 136315906;
            id v32 = "-[BRCServerZone _saveEditedRecord:zonesNeedingAllocRanks:error:]";
            __int16 v33 = 2080;
            if (!a5) {
              uint64_t v30 = "(ignored by caller)";
            }
            id v34 = v30;
            __int16 v35 = 2112;
            id v36 = v27;
            __int16 v37 = 2112;
            uint64_t v38 = v28;
            _os_log_error_impl(&dword_1D353B000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v31, 0x2Au);
          }
        }
        if (a5) {
          *a5 = v27;
        }

        goto LABEL_8;
      }
      BOOL v20 = [(BRCServerZone *)self _saveEditedFinderBookmarkRecord:v8 error:a5];
    }
LABEL_20:
    BOOL v19 = v20;
    goto LABEL_21;
  }
  if ([v12 isEqualToString:@"content"])
  {
    BOOL v20 = [(BRCServerZone *)self _saveEditedDocumentContentRecord:v8 error:a5];
    goto LABEL_20;
  }
  if ([v12 isEqualToString:*MEMORY[0x1E4F19D78]])
  {
    BOOL v20 = [(BRCServerZone *)self _saveEditedShareRecord:v8 error:a5];
    goto LABEL_20;
  }
  brc_bread_crumbs();
  unsigned int v22 = (char *)objc_claimAutoreleasedReturnValue();
  id v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    char v24 = [v8 recordType];
    int v31 = 138412546;
    id v32 = v24;
    __int16 v33 = 2112;
    id v34 = v22;
    _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Consistent state but unknown record type (recordType: %@).%@", (uint8_t *)&v31, 0x16u);
  }
  BOOL v19 = 1;
LABEL_21:

  return v19;
}

- (BOOL)_markShareIDDead:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = objc_msgSend(v4, "brc_shareItemID");
  BOOL v6 = [(BRCPQLConnection *)self->_db execute:@"UPDATE server_items AS si   SET item_sharing_options = ((item_sharing_options & %ld) | IFNULL((SELECT (pi.item_sharing_options & %ld) FROM server_items AS pi WHERE si.item_parent_id = pi.item_id AND si.zone_rowid = pi.zone_rowid), 0)) WHERE si.zone_rowid = %@ AND si.item_id = %@", 7, 120, self->_dbRowID, v5];
  if (v6)
  {
    if ([(BRCPQLConnection *)self->_db changes])
    {
      id v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[BRCServerZone _markShareIDDead:]();
      }
    }
    else
    {
      id v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v12 = v4;
        __int16 v13 = 2112;
        int v14 = v7;
        _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] deleted shareID %@ was for already dead item%@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      BOOL v10 = [(BRCPQLConnection *)self->_db lastError];
      *(_DWORD *)buf = 138412802;
      id v12 = v5;
      __int16 v13 = 2112;
      int v14 = v10;
      __int16 v15 = 2112;
      char v16 = v7;
      _os_log_error_impl(&dword_1D353B000, v8, (os_log_type_t)0x90u, "[ERROR] failed saving tombstone share %@: %@%@", buf, 0x20u);
    }
  }

  return v6;
}

- (BOOL)_markItemDeadForRecordID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = objc_msgSend(v4, "brc_itemIDWithSession:", self->_session);
  if (v5)
  {
    session = self->_session;
    id v7 = [v4 zoneID];
    id v8 = [v7 ownerName];
    id v9 = [(BRCAccountSession *)session userKeyForOwnerName:v8 db:self->_db];

    if (v9)
    {
      BOOL v10 = [(BRCClientZone *)self->_clientZone rootItemID];
      db = self->_db;
      id v12 = [v5 itemIDString];
      char v13 = [(BRCPQLConnection *)db execute:@"UPDATE server_items SET item_state = 1, item_filename = %@, item_rank = NULL, item_depth = 0, item_parent_id = %@ WHERE zone_rowid = %@ AND item_id = %@", v12, v10, self->_dbRowID, v5];

      if (v13)
      {
        if ([(BRCPQLConnection *)self->_db changes])
        {
          int v14 = brc_bread_crumbs();
          __int16 v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            -[BRCServerZone _markItemDeadForRecordID:]();
          }
        }
        else
        {
          int v14 = brc_bread_crumbs();
          __int16 v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            -[BRCServerZone _markItemDeadForRecordID:]();
          }
        }
      }
      else
      {
        int v14 = brc_bread_crumbs();
        __int16 v15 = brc_default_log();
        if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
        {
          char v16 = [(BRCPQLConnection *)self->_db lastError];
          *(_DWORD *)buf = 138412802;
          v21 = v5;
          __int16 v22 = 2112;
          id v23 = v16;
          __int16 v24 = 2112;
          v25 = v14;
          _os_log_error_impl(&dword_1D353B000, v15, (os_log_type_t)0x90u, "[ERROR] failed saving tombstone %@: %@%@", buf, 0x20u);
        }
      }
    }
    else
    {
      BOOL v10 = brc_bread_crumbs();
      int v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        int v18 = [v4 zoneID];
        BOOL v19 = [v18 ownerName];
        *(_DWORD *)buf = 138412802;
        v21 = v5;
        __int16 v22 = 2112;
        id v23 = v19;
        __int16 v24 = 2112;
        v25 = v10;
        _os_log_error_impl(&dword_1D353B000, v14, (os_log_type_t)0x90u, "[ERROR] can't save %@: missing ownerKey for ownerName \"%@\"%@", buf, 0x20u);
      }
      char v13 = 0;
    }
  }
  else
  {
    id v9 = brc_bread_crumbs();
    BOOL v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCServerZone _markItemDeadForRecordID:]();
    }
    char v13 = 1;
  }

  return v13;
}

- (BOOL)_savePendingChangesEditedStructureRecordsIgnoringRecordIDs:(id)a3 zonesNeedingAllocRanks:(id)a4 pendingChangeStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __119__BRCServerZone__savePendingChangesEditedStructureRecordsIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke;
    v12[3] = &unk_1E6996C30;
    id v13 = v8;
    int v14 = self;
    id v15 = v9;
    char v10 = [a5 enumerateRecordsOfType:1 block:v12];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

uint64_t __119__BRCServerZone__savePendingChangesEditedStructureRecordsIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v11 = 0;
    uint64_t v6 = [v7 _saveEditedRecord:v5 zonesNeedingAllocRanks:v8 error:&v11];
    id v9 = v11;
    if ((v6 & 1) == 0) {
      [*(id *)(a1 + 40) _reportCantSaveProblem:v9 record:v5];
    }
  }
  return v6;
}

- (BOOL)_savePendingChangesEditedContentRecordsIgnoringRecordIDs:(id)a3 zonesNeedingAllocRanks:(id)a4 pendingChangeStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __117__BRCServerZone__savePendingChangesEditedContentRecordsIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke;
    v12[3] = &unk_1E6996C30;
    id v13 = v8;
    int v14 = self;
    id v15 = v9;
    char v10 = [a5 enumerateRecordsOfType:2 block:v12];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

uint64_t __117__BRCServerZone__savePendingChangesEditedContentRecordsIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v11 = 0;
    uint64_t v6 = [v7 _saveEditedRecord:v5 zonesNeedingAllocRanks:v8 error:&v11];
    id v9 = v11;
    if ((v6 & 1) == 0) {
      [*(id *)(a1 + 40) _reportCantSaveProblem:v9 record:v5];
    }
  }
  return v6;
}

- (BOOL)_savePendingChangesDeletedRecordIDsIgnoringRecordIDs:(id)a3 pendingChangeStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__BRCServerZone__savePendingChangesDeletedRecordIDsIgnoringRecordIDs_pendingChangeStream___block_invoke;
    v14[3] = &unk_1E6996C58;
    id v8 = v6;
    id v15 = v8;
    char v16 = self;
    if ([v7 enumerateRecordsOfType:-1 block:v14])
    {
      if ([(BRCServerZone *)self isSharedZone])
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __90__BRCServerZone__savePendingChangesDeletedRecordIDsIgnoringRecordIDs_pendingChangeStream___block_invoke_2;
        v11[3] = &unk_1E6996C58;
        id v12 = v8;
        id v13 = self;
        char v9 = [v7 enumerateRecordsOfType:-2 block:v11];
      }
      else
      {
        char v9 = 1;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

uint64_t __90__BRCServerZone__savePendingChangesDeletedRecordIDsIgnoringRecordIDs_pendingChangeStream___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) != 0
    || ([*(id *)(a1 + 40) _markItemDeadForRecordID:v3] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [*(id *)(*(void *)(a1 + 40) + 48) asPrivateClientZone];
    id v6 = [v3 recordName];
    [v5 reportProblemWithType:5 recordName:v6];

    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __90__BRCServerZone__savePendingChangesDeletedRecordIDsIgnoringRecordIDs_pendingChangeStream___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) != 0
    || ([*(id *)(a1 + 40) _markItemDeadForRecordID:v3] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [*(id *)(*(void *)(a1 + 40) + 48) asPrivateClientZone];
    id v6 = [v3 recordName];
    [v5 reportProblemWithType:5 recordName:v6];

    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_savePendingChangesSharesIgnoringRecordIDs:(id)a3 zonesNeedingAllocRanks:(id)a4 pendingChangeStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __103__BRCServerZone__savePendingChangesSharesIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke;
    v17[3] = &unk_1E6996C30;
    id v11 = v8;
    id v18 = v11;
    BOOL v19 = self;
    id v20 = v9;
    if ([v10 enumerateRecordsOfType:3 block:v17])
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __103__BRCServerZone__savePendingChangesSharesIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke_2;
      v14[3] = &unk_1E6996C58;
      id v15 = v11;
      char v16 = self;
      char v12 = [v10 enumerateRecordsOfType:-3 block:v14];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

uint64_t __103__BRCServerZone__savePendingChangesSharesIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v11 = 0;
    uint64_t v6 = [v7 _saveEditedRecord:v5 zonesNeedingAllocRanks:v8 error:&v11];
    id v9 = v11;
    if ((v6 & 1) == 0) {
      [*(id *)(a1 + 40) _reportCantSaveProblem:v9 record:v5];
    }
  }
  return v6;
}

uint64_t __103__BRCServerZone__savePendingChangesSharesIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) != 0
    || ([*(id *)(a1 + 40) _markShareIDDead:v3] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [*(id *)(*(void *)(a1 + 40) + 48) asPrivateClientZone];
    uint64_t v6 = [v3 recordName];
    [v5 reportProblemWithType:5 recordName:v6];

    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_saveEditedStructureRecords:(id)a3 zonesNeedingAllocRanks:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v24 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    uint64_t v10 = *MEMORY[0x1E4F19D78];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        char v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x1D9438760]();
        int v14 = [v12 recordType];
        char v15 = [v14 isEqualToString:@"content"];

        if ((v15 & 1) == 0)
        {
          char v16 = [v12 recordType];
          char v17 = [v16 isEqualToString:v10];

          if ((v17 & 1) == 0)
          {
            id v25 = 0;
            BOOL v18 = [(BRCServerZone *)self _saveEditedRecord:v12 zonesNeedingAllocRanks:v24 error:&v25];
            id v19 = v25;
            id v20 = v19;
            if (!v18)
            {
              [(BRCServerZone *)self _reportCantSaveProblem:v19 record:v12];

              BOOL v21 = 0;
              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v21 = 1;
LABEL_14:

  return v21;
}

- (BOOL)_saveDeletedRecordIDs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      uint64_t v10 = (void *)MEMORY[0x1D9438760](v5);
      id v11 = objc_msgSend(v9, "recordName", (void)v17);
      if (![v11 hasPrefix:@"documentContent/"]) {
        break;
      }
      BOOL v12 = [(BRCServerZone *)self isSharedZone];

      if (v12) {
        goto LABEL_10;
      }
LABEL_11:
      if (v6 == ++v8)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v6 = v5;
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }

LABEL_10:
    if (![(BRCServerZone *)self _markItemDeadForRecordID:v9])
    {
      int v14 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
      char v15 = [v9 recordName];
      [v14 reportProblemWithType:5 recordName:v15];

      BOOL v13 = 0;
      goto LABEL_15;
    }
    goto LABEL_11;
  }
LABEL_13:
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (void)_reportCantSaveProblem:(id)a3 record:(id)a4
{
  id v12 = a3;
  uint64_t v6 = [a4 recordID];
  uint64_t v7 = [v6 recordName];

  uint64_t v8 = [v12 domain];
  if ([v8 isEqualToString:*MEMORY[0x1E4F59368]])
  {
    uint64_t v9 = [v12 code];

    if (v9 == 1005) {
      uint64_t v10 = 11;
    }
    else {
      uint64_t v10 = 5;
    }
  }
  else
  {

    uint64_t v10 = 5;
  }
  id v11 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
  [v11 reportProblemWithType:v10 recordName:v7];
}

- (BOOL)_saveEditedContentRecords:(id)a3 zonesNeedingAllocRanks:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v21 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        BOOL v13 = (void *)MEMORY[0x1D9438760]();
        int v14 = [v12 recordType];
        int v15 = [v14 isEqualToString:@"content"];

        if (v15)
        {
          id v22 = v9;
          BOOL v16 = [(BRCServerZone *)self _saveEditedRecord:v12 zonesNeedingAllocRanks:v21 error:&v22];
          id v17 = v22;

          if (!v16)
          {
            [(BRCServerZone *)self _reportCantSaveProblem:v17 record:v12];
            BOOL v18 = 0;
            goto LABEL_14;
          }
          uint64_t v9 = v17;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    BOOL v18 = 1;
    id v17 = v9;
  }
  else
  {
    id v17 = 0;
    BOOL v18 = 1;
  }
LABEL_14:

  return v18;
}

- (BOOL)_saveEditedShareRecords:(id)a3 deletedShareRecordIDs:(id)a4 zonesNeedingAllocRanks:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v32 = a4;
  id v33 = a5;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    uint64_t v13 = *MEMORY[0x1E4F19D78];
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        int v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        BOOL v16 = (void *)MEMORY[0x1D9438760]();
        id v17 = [v15 recordType];
        int v18 = [v17 isEqualToString:v13];

        if (v18)
        {
          id v38 = 0;
          BOOL v19 = [(BRCServerZone *)self _saveEditedRecord:v15 zonesNeedingAllocRanks:v33 error:&v38];
          id v20 = v38;
          id v21 = v20;
          if (!v19)
          {
            [(BRCServerZone *)self _reportCantSaveProblem:v20 record:v15];
            id v23 = v9;
            id v22 = v32;
LABEL_22:

            BOOL v29 = 0;
            goto LABEL_23;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v22 = v32;
  id v23 = v32;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v35;
    while (2)
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        BOOL v16 = (void *)MEMORY[0x1D9438760]();
        if (![(BRCServerZone *)self _markShareIDDead:v28])
        {
          id v21 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
          uint64_t v30 = [v28 recordName];
          [v21 reportProblemWithType:5 recordName:v30];

          goto LABEL_22;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v43 count:16];
      BOOL v29 = 1;
      if (v25) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v29 = 1;
  }
LABEL_23:

  return v29;
}

- (BOOL)_recoverFromCorruptShareOptionsWithItemType:(char)a3 itemID:(id)a4 parentID:(id)a5 sharingOptions:(unint64_t)a6
{
  uint64_t v8 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if ([(BRCServerZone *)self isPrivateZone])
  {
    if (v8 <= 8 && ((1 << v8) & 0x106) != 0)
    {
      uint64_t v12 = @"documentContent/";
    }
    else
    {
      uint64_t v12 = +[BRCItemID structureRecordPrefixForItemType:v8 targetZoneShared:0];
    }
    uint64_t v13 = v12;
    int v14 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
    int v15 = [v10 itemIDString];
    BOOL v16 = [(__CFString *)v13 stringByAppendingString:v15];
    [v14 reportProblemWithType:13 recordName:v16];
  }
  if ([v11 isSharedZoneRoot] && -[BRCServerZone isSharedZone](self, "isSharedZone"))
  {
    unint64_t v17 = a6 | 4;
    int v18 = brc_bread_crumbs();
    BOOL v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCServerZone _recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:]();
    }
  }
  else
  {
    if ([(BRCServerZone *)self isSharedZone])
    {
      id v20 = brc_bread_crumbs();
      id v21 = brc_default_log();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
        -[BRCServerZone _recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:]();
      }
      goto LABEL_21;
    }
    unint64_t v17 = a6 & 0xFFFFFFFFFFFFFF83;
    int v18 = brc_bread_crumbs();
    BOOL v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCServerZone _recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:].cold.4();
    }
  }

  if (![(BRCPQLConnection *)self->_db execute:@"UPDATE server_items SET item_sharing_options = %ld WHERE item_id = %@ AND zone_rowid = %@", v17, v10, self->_dbRowID])
  {
    id v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
      -[BRCServerZone _recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:]();
    }
LABEL_21:
    BOOL v22 = 0;
    goto LABEL_22;
  }
  id v20 = brc_bread_crumbs();
  BOOL v22 = 1;
  id v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v10;
    __int16 v26 = 2112;
    long long v27 = v20;
    _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Recovered sharing options on %@ by setting ck share options to null%@", buf, 0x16u);
  }
LABEL_22:

  return v22;
}

- (void)_recomputeMinLastUsedTime
{
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v4 = [v3 numberOfGreedyRecentlyUsedItems];

  if (v4)
  {
    id v5 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT item_lastusedtime FROM server_items ORDER BY item_lastusedtime DESC LIMIT 1 OFFSET %lld", v4];
    uint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    uint64_t v6 = -1;
  }
  uint64_t v7 = [(BRCAccountSession *)self->_session serverState];
  uint64_t v8 = [v7 minLastUsedTime];

  if (v8 != v6)
  {
    id v9 = [(BRCAccountSession *)self->_session serverState];
    [v9 setMinLastUsedTime:v6];

    id v10 = [(BRCAccountSession *)self->_session serverState];
    [v10 saveToDB:self->_db];
  }
}

- (BOOL)allocateRanksWhenCaughtUp:(BOOL)a3
{
  BOOL v109 = a3;
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  [(BRCServerZone *)self _recomputeMinLastUsedTime];
  uint64_t v4 = [(BRCServerZone *)self mangledID];
  id v5 = +[BRCUserDefaults defaultsForMangledID:v4];
  uint64_t v6 = [v5 maxSyncPathDepth];

  uint64_t v7 = [(BRCAccountSession *)self->_session serverState];
  uint64_t v107 = [v7 nextRank];

  unsigned int v108 = [(BRCServerZone *)self state];
  if ((v108 & 4) != 0)
  {
    uint64_t v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCServerZone allocateRanksWhenCaughtUp:]();
    }

    BOOL v109 = 1;
  }
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v98 = "NO";
    if (v109) {
      v99 = "YES";
    }
    else {
      v99 = "NO";
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v116 = (uint64_t)v99;
    if ((v108 & 4) != 0) {
      v98 = "YES";
    }
    __int16 v117 = 2080;
    *(void *)v118 = v98;
    *(_WORD *)&v118[8] = 2112;
    *(void *)&v118[10] = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] caughtUp [%s] fullSync [%s]%@", buf, 0x20u);
  }

  if ((v108 & 4) != 0)
  {
    uint64_t v12 = "";
    uint64_t v13 = 0;
  }
  else if (v109)
  {
    uint64_t v12 = " AND item_depth >= -1";
    uint64_t v13 = 21;
  }
  else
  {
    uint64_t v12 = " AND item_depth >= 0";
    uint64_t v13 = 20;
  }
  BOOL v106 = [MEMORY[0x1E4FBA908] rawInjection:v12 length:v13];
  id v14 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid, item_id, item_parent_id, item_state, item_type, version_ckinfo, item_favoriterank, item_lastusedtime, item_finder_tags IS NOT NULL, item_sharing_options   FROM server_items  WHERE zone_rowid = %@ AND item_rank IS NULL%@", self->_dbRowID, v106];
  if ([v14 next])
  {
    int v15 = (v108 >> 2) & 1;
    int v102 = v15 | v109;
    int v105 = v15 & v109;
    BOOL v16 = &off_1E6992000;
    uint64_t v103 = v6;
    uint64_t v104 = v6;
    do
    {
      uint64_t v17 = MEMORY[0x1D9438760]();
      uint64_t v111 = [v14 unsignedLongLongAtIndex:0];
      v112 = [v14 objectOfClass:objc_opt_class() atIndex:1];
      int v18 = [v14 objectOfClass:objc_opt_class() atIndex:2];
      int v19 = [v14 charAtIndex:3];
      uint64_t v20 = [v14 charAtIndex:4];
      uint64_t v21 = [v14 integerAtIndex:9];
      context = (void *)v17;
      if (v19 == 1)
      {
        if (![(BRCServerZone *)self isSharedZone])
        {
          uint64_t v28 = v112;
          id v29 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT 1 FROM server_items WHERE zone_rowid = %@ AND item_parent_id = %@ AND item_state = 0 LIMIT 1", self->_dbRowID, v112];
          if ([v29 BOOLValue])
          {
            uint64_t v30 = brc_bread_crumbs();
            uint64_t v31 = brc_default_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v116 = (uint64_t)v112;
              __int16 v117 = 2112;
              *(void *)v118 = v30;
              _os_log_debug_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Server killed %@ but it still has live children%@", buf, 0x16u);
            }

            if (v109)
            {
              id v32 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT COUNT(*) FROM server_items WHERE zone_rowid = %@ AND item_parent_id = %@ AND item_state = 0", self->_dbRowID, v112];

              id v33 = brc_bread_crumbs();
              long long v34 = brc_default_log();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
              {
                uint64_t v80 = [v112 UTF8String];
                int v81 = [v32 intValue];
                *(_DWORD *)buf = 136315650;
                uint64_t v116 = v80;
                uint64_t v28 = v112;
                __int16 v117 = 1024;
                *(_DWORD *)v118 = v81;
                *(_WORD *)&v118[4] = 2112;
                *(void *)&v118[6] = v33;
                _os_log_fault_impl(&dword_1D353B000, v34, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Server killed %s but it still has %d live children%@", buf, 0x1Cu);
              }

              long long v35 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
              long long v36 = [v28 itemIDString];
              long long v37 = [@"directory/" stringByAppendingString:v36];
              [v35 reportProblemWithType:3 recordName:v37];
            }
            else
            {
              long long v35 = brc_bread_crumbs();
              long long v36 = brc_default_log();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                int v82 = [v29 intValue];
                *(_DWORD *)buf = 138412802;
                uint64_t v116 = (uint64_t)v112;
                __int16 v117 = 1024;
                *(_DWORD *)v118 = v82;
                *(_WORD *)&v118[4] = 2112;
                *(void *)&v118[6] = v35;
                _os_log_debug_impl(&dword_1D353B000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] State inconsistent because %@ has %d live children%@", buf, 0x1Cu);
              }
              id v32 = v29;
            }

            id v39 = 0;
            uint64_t v23 = -1;
            id v29 = v32;
            goto LABEL_66;
          }
          id v39 = 0;
          uint64_t v23 = 0x7FFFFFFFLL;
LABEL_67:

          goto LABEL_68;
        }
        id v22 = 0;
        uint64_t v23 = 0x7FFFFFFFLL;
      }
      else
      {
        uint64_t v24 = v21;
        if (v20 == 1)
        {
          id v25 = [v14 dataAtIndex:5];

          if (!v25)
          {
            if (v105)
            {
              uint64_t v46 = brc_bread_crumbs();
              uint64_t v47 = brc_default_log();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v116 = (uint64_t)v112;
                __int16 v117 = 2112;
                *(void *)v118 = v46;
                _os_log_fault_impl(&dword_1D353B000, v47, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: State inconsistent because %@ is a document with no version%@", buf, 0x16u);
              }

              id v48 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
              v49 = [v16[301] structureRecordPrefixForItemType:1 targetZoneShared:0];
              v50 = [v112 itemIDString];
              char v51 = [v49 stringByAppendingString:v50];
              [v48 reportProblemWithType:4 recordName:v51];

LABEL_47:
            }
            else
            {
              id v48 = brc_bread_crumbs();
              v49 = brc_default_log();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              {
                v50 = [v112 itemIDString];
                *(_DWORD *)buf = 138412546;
                uint64_t v116 = (uint64_t)v50;
                __int16 v117 = 2112;
                *(void *)v118 = v48;
                _os_log_debug_impl(&dword_1D353B000, v49, OS_LOG_TYPE_DEBUG, "[DEBUG] We haven't received a content record on %@ yet, delaying for now%@", buf, 0x16u);
                goto LABEL_47;
              }
            }

            [(BRCPQLConnection *)self->_db execute:@"UPDATE server_items SET item_type = 9, item_rank = NULL WHERE item_id = %@ AND zone_rowid = %@ AND item_type = 0", v18, self->_dbRowID];
            if (![(BRCPQLConnection *)self->_db changes])
            {
              id v22 = 0;
              uint64_t v23 = -3;
              goto LABEL_69;
            }
            brc_bread_crumbs();
            id v29 = (id)objc_claimAutoreleasedReturnValue();
            long long v35 = brc_default_log();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v116 = (uint64_t)v18;
              __int16 v117 = 2112;
              *(void *)v118 = v29;
              _os_log_debug_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %@ to be a directory fault because it has a new unapplied item%@", buf, 0x16u);
            }
            id v39 = 0;
            uint64_t v23 = -3;
LABEL_66:

            goto LABEL_67;
          }
        }
        if (([v18 isNonDesktopRoot] & 1) == 0)
        {
          id v22 = [(BRCPQLConnection *)self->_db fetchWithSlowStatementRadar:@"<rdar://problem/37451020>", @"WITH RECURSIVE item_parents (item_id, item_state, item_type, depth) AS(    SELECT item_id, item_state, item_type, 0       FROM server_items      WHERE zone_rowid = %@ AND item_id = %@  UNION ALL     SELECT p.item_parent_id, c.item_state, c.item_type, c.depth + 1       FROM server_items AS p INNER JOIN item_parents AS c USING (item_id)      WHERE p.zone_rowid = %@      LIMIT %u) SELECT item_state, depth, item_type FROM item_parents WHERE item_id_is_root(item_id) OR item_type = 4", self->_dbRowID, v18, self->_dbRowID, v6 sql];
          if ([v22 next])
          {
            unsigned int v38 = [v22 charAtIndex:2];
            if (v38 <= 0xA && ((1 << v38) & 0x611) != 0)
            {
              if (v19 || ![v22 unsignedIntegerAtIndex:0])
              {
                uint64_t v23 = [v22 unsignedIntegerAtIndex:1];
              }
              else
              {
                if (v109)
                {
                  uint64_t v61 = brc_bread_crumbs();
                  uint64_t v62 = brc_default_log();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
                  {
                    uint64_t v84 = [v112 UTF8String];
                    uint64_t v85 = [v18 UTF8String];
                    *(_DWORD *)buf = 136315650;
                    uint64_t v116 = v84;
                    __int16 v117 = 2080;
                    *(void *)v118 = v85;
                    *(_WORD *)&v118[8] = 2112;
                    *(void *)&v118[10] = v61;
                    _os_log_fault_impl(&dword_1D353B000, v62, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Server sent live item %s parented to dead item %s%@", buf, 0x20u);
                  }

                  int v63 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
                  int v64 = +[BRCItemID structureRecordPrefixForItemType:v20 targetZoneShared:0];
                  id v65 = [v112 itemIDString];
                  id v66 = [v64 stringByAppendingString:v65];
                  [v63 reportProblemWithType:1 recordName:v66];

                  BOOL v16 = &off_1E6992000;
                  uint64_t v23 = -1;
                  goto LABEL_82;
                }
                id v75 = brc_bread_crumbs();
                id v76 = brc_default_log();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  uint64_t v116 = (uint64_t)v112;
                  __int16 v117 = 2112;
                  *(void *)v118 = v18;
                  *(_WORD *)&v118[8] = 2112;
                  *(void *)&v118[10] = v75;
                  _os_log_impl(&dword_1D353B000, v76, OS_LOG_TYPE_DEFAULT, "[WARNING] Server sent us live item %@ parented to dead item %@ but we haven't completed full sync. Delaying apply%@", buf, 0x20u);
                }

                uint64_t v23 = -1;
              }
LABEL_96:
              if ((v24 & 0x48) == 0 || (v24 & 4) != 0 || v23 < 0) {
                goto LABEL_69;
              }
              id v39 = [(BRCPQLConnection *)self->_db fetch:@"WITH RECURSIVE item_parents (item_parent_id, item_sharing_options) AS(    SELECT item_parent_id, item_sharing_options       FROM server_items      WHERE zone_rowid = %@ AND item_id = %@  UNION ALL     SELECT p.item_parent_id, p.item_sharing_options       FROM server_items AS p INNER JOIN item_parents AS c      WHERE p.zone_rowid = %@        AND c.item_parent_id = p.item_id      LIMIT %u) SELECT 1 FROM item_parents WHERE (item_sharing_options & 4) != 0", self->_dbRowID, v18, self->_dbRowID, v103];

              if (([v39 next] & 1) == 0)
              {
                if (!v102)
                {
                  brc_bread_crumbs();
                  id v29 = (id)objc_claimAutoreleasedReturnValue();
                  long long v35 = brc_default_log();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412802;
                    uint64_t v116 = (uint64_t)v112;
                    __int16 v117 = 2112;
                    *(void *)v118 = v18;
                    *(_WORD *)&v118[8] = 2112;
                    *(void *)&v118[10] = v29;
                    _os_log_debug_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Server sent us an item %@ which we couldn't locate share for, but we aren't caught up yet (parented to %@)%@", buf, 0x20u);
                  }
                  goto LABEL_51;
                }
                v101 = brc_bread_crumbs();
                id v79 = brc_default_log();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  uint64_t v116 = (uint64_t)v112;
                  __int16 v117 = 2112;
                  *(void *)v118 = v18;
                  *(_WORD *)&v118[8] = 2112;
                  *(void *)&v118[10] = v101;
                  _os_log_fault_impl(&dword_1D353B000, v79, OS_LOG_TYPE_FAULT, "[CRIT] Server sent us an item %@ which has non-root share options but isn't parented to a share (parented to %@)%@", buf, 0x20u);
                }

                if (![(BRCServerZone *)self _recoverFromCorruptShareOptionsWithItemType:v20 itemID:v112 parentID:v18 sharingOptions:v24])
                {
                  brc_bread_crumbs();
                  id v29 = (id)objc_claimAutoreleasedReturnValue();
                  long long v35 = brc_default_log();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    uint64_t v116 = (uint64_t)v112;
                    __int16 v117 = 2112;
                    *(void *)v118 = v18;
                    *(_WORD *)&v118[8] = 2112;
                    *(void *)&v118[10] = v29;
                    _os_log_fault_impl(&dword_1D353B000, v35, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Server sent us an item %@ which has non-root share options but isn't parented to a share (parented to %@)%@", buf, 0x20u);
                  }
LABEL_51:
                  uint64_t v23 = -4;
                  goto LABEL_66;
                }
              }
LABEL_68:
              id v22 = v39;
              goto LABEL_69;
            }
            v67 = brc_bread_crumbs();
            id v68 = brc_default_log();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v116 = (uint64_t)v112;
              __int16 v117 = 2112;
              *(void *)v118 = v18;
              *(_WORD *)&v118[8] = 2112;
              *(void *)&v118[10] = v67;
              _os_log_fault_impl(&dword_1D353B000, v68, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Server sent item %@ which is parented to a non-directory %@%@", buf, 0x20u);
            }

            int v69 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
            id v70 = +[BRCItemID structureRecordPrefixForItemType:v20 targetZoneShared:0];
            id v71 = [v112 itemIDString];
            uint64_t v72 = [v70 stringByAppendingString:v71];
            [v69 reportProblemWithType:8 recordName:v72];

            BOOL v16 = &off_1E6992000;
            uint64_t v23 = -5;
LABEL_82:
            uint64_t v6 = v104;
            goto LABEL_96;
          }
          if ((v108 & 4) != 0)
          {
            long long v40 = brc_bread_crumbs();
            long long v41 = brc_default_log();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            {
              uint64_t v83 = [v112 UTF8String];
              *(_DWORD *)buf = 136315394;
              uint64_t v116 = v83;
              __int16 v117 = 2112;
              *(void *)v118 = v40;
              _os_log_fault_impl(&dword_1D353B000, v41, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Server sent item %s which isn't a descendant of 'root'%@", buf, 0x16u);
            }

            long long v42 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
            __int16 v43 = [v16[301] structureRecordPrefixForItemType:v20 targetZoneShared:0];
            uint64_t v44 = [v112 itemIDString];
            uint64_t v45 = [v43 stringByAppendingString:v44];
            [v42 reportProblemWithType:2 recordName:v45];

            BOOL v16 = &off_1E6992000;
            uint64_t v23 = -2;
            goto LABEL_82;
          }
          v52 = brc_bread_crumbs();
          int v53 = brc_default_log();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v116 = (uint64_t)v112;
            __int16 v117 = 2112;
            *(void *)v118 = v18;
            *(_WORD *)&v118[8] = 2112;
            *(void *)&v118[10] = v52;
            _os_log_debug_impl(&dword_1D353B000, v53, OS_LOG_TYPE_DEBUG, "[DEBUG] Found orphan when we haven't completed initial sync item [%@] parent [%@].  Delaying apply for now%@", buf, 0x20u);
          }

          unint64_t v54 = [v14 unsignedLongLongAtIndex:7];
          if ([v14 unsignedLongLongAtIndex:6])
          {
            int v55 = brc_bread_crumbs();
            v56 = brc_default_log();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v116 = (uint64_t)v55;
              uint64_t v57 = v56;
              int v58 = "[DEBUG] Orphan has favorite rank so fetching parent chain%@";
              goto LABEL_93;
            }
LABEL_94:

            uint64_t v77 = [(BRCClientZone *)self->_clientZone db];
            __int16 v78 = [v77 serialQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __43__BRCServerZone_allocateRanksWhenCaughtUp___block_invoke;
            block[3] = &unk_1E6993628;
            block[4] = self;
            id v114 = v18;
            dispatch_async(v78, block);

LABEL_95:
            uint64_t v23 = -2;
            BOOL v16 = &off_1E6992000;
            goto LABEL_96;
          }
          id v73 = [(BRCAccountSession *)self->_session serverState];
          unint64_t v74 = [v73 minLastUsedTime];

          if (v54 && v54 >= v74)
          {
            int v55 = brc_bread_crumbs();
            v56 = brc_default_log();
            if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_94;
            }
            *(_DWORD *)buf = 138412290;
            uint64_t v116 = (uint64_t)v55;
            uint64_t v57 = v56;
            int v58 = "[DEBUG] Orphan is recent, so fetching parent chain%@";
          }
          else
          {
            if (![v14 BOOLAtIndex:8]) {
              goto LABEL_95;
            }
            int v55 = brc_bread_crumbs();
            v56 = brc_default_log();
            if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_94;
            }
            *(_DWORD *)buf = 138412290;
            uint64_t v116 = (uint64_t)v55;
            uint64_t v57 = v56;
            int v58 = "[DEBUG] Orphan has finder tags so fetching parent chain%@";
          }
LABEL_93:
          _os_log_debug_impl(&dword_1D353B000, v57, OS_LOG_TYPE_DEBUG, v58, buf, 0xCu);
          goto LABEL_94;
        }
        uint64_t v23 = 0;
        id v22 = 0;
        if ((v24 & 0x48) == 0 || (v24 & 4) != 0) {
          goto LABEL_69;
        }
        __int16 v26 = brc_bread_crumbs();
        long long v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v116 = (uint64_t)v112;
          __int16 v117 = 2112;
          *(void *)v118 = v26;
          _os_log_fault_impl(&dword_1D353B000, v27, OS_LOG_TYPE_FAULT, "[CRIT] Server sent us an item %@ which has non-root share options but should be a root share%@", buf, 0x16u);
        }

        if (![(BRCClientZone *)self->_clientZone isPrivateZone]
          || ![(BRCServerZone *)self _recoverFromCorruptShareOptionsWithItemType:v20 itemID:v112 parentID:v18 sharingOptions:v24])
        {
          brc_bread_crumbs();
          id v29 = (id)objc_claimAutoreleasedReturnValue();
          long long v35 = brc_default_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v116 = (uint64_t)v112;
            __int16 v117 = 2112;
            *(void *)v118 = v29;
            _os_log_fault_impl(&dword_1D353B000, v35, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Server sent us an item %@ which has non-root share options but should be a root share%@", buf, 0x16u);
          }
          id v39 = 0;
          goto LABEL_51;
        }
        uint64_t v23 = 0;
        id v22 = 0;
      }
LABEL_69:
      id v59 = brc_bread_crumbs();
      uint64_t v60 = brc_default_log();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v116 = v111;
        __int16 v117 = 2048;
        *(void *)v118 = v23;
        *(_WORD *)&v118[8] = 2112;
        *(void *)&v118[10] = v59;
        _os_log_debug_impl(&dword_1D353B000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] Setting rowid [%lld] item_depth [%lld]%@", buf, 0x20u);
      }

      [(BRCPQLConnection *)self->_db execute:@"UPDATE server_items SET item_depth = %lld WHERE rowid = %lld", v23, v111];
    }
    while (([v14 next] & 1) != 0);
  }
  id v86 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid   FROM server_items  WHERE zone_rowid = %@ AND item_rank IS NULL AND item_depth >= 0 ORDER BY item_depth ASC", self->_dbRowID];

  uint64_t v87 = v107;
  if ([v86 next])
  {
    uint64_t v88 = v107;
    do
    {
      uint64_t v89 = [v86 unsignedLongLongAtIndex:0];
      __int16 v90 = brc_bread_crumbs();
      v91 = brc_default_log();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v116 = v89;
        __int16 v117 = 2048;
        *(void *)v118 = v88;
        *(_WORD *)&v118[8] = 2112;
        *(void *)&v118[10] = v90;
        _os_log_debug_impl(&dword_1D353B000, v91, OS_LOG_TYPE_DEBUG, "[DEBUG] Setting rowid [%lld] rank to [%lld]%@", buf, 0x20u);
      }

      uint64_t v87 = v88 + 1;
      [(BRCPQLConnection *)self->_db execute:@"UPDATE server_items SET item_rank = %lld WHERE rowid = %lld", v88++, v89];
    }
    while (([v86 next] & 1) != 0);
  }
  uint64_t v92 = brc_bread_crumbs();
  v93 = brc_default_log();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
  {
    v100 = [(BRCServerZone *)self mangledID];
    *(_DWORD *)buf = 138413058;
    uint64_t v116 = (uint64_t)v100;
    __int16 v117 = 2048;
    *(void *)v118 = v107;
    *(_WORD *)&v118[8] = 2048;
    *(void *)&v118[10] = v87;
    __int16 v119 = 2112;
    v120 = v92;
    _os_log_debug_impl(&dword_1D353B000, v93, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Allocated ranks [%lld, %lld]%@", buf, 0x2Au);
  }
  v94 = [(BRCAccountSession *)self->_session serverState];
  [v94 setNextRank:v87];

  v95 = [(BRCAccountSession *)self->_session serverState];
  v96 = [(BRCAccountSession *)self->_session serverDB];
  [v95 saveToDB:v96];

  return 1;
}

id __43__BRCServerZone_allocateRanksWhenCaughtUp___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 48) fetchParentChainIfNecessaryWithParentItemID:*(void *)(a1 + 40) isUserWaiting:0];
}

- (void)checkIfFinishedFullSync
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] %@ has no more directory faults so it is now full sync%@");
}

- (void)handleMovedZoneNames:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v32;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x1D9438760]();
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithZoneName:v10 ownerName:0];
        uint64_t v13 = [(BRCAccountSession *)self->_session getOrCreateAppLibraryAndPrivateZonesIfNecessary:v12];

        if (!v13) {
          break;
        }

        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v38 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v14 = v10;

      if (!v14) {
        goto LABEL_15;
      }
      int v15 = brc_bread_crumbs();
      BOOL v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        [(BRCServerZone *)v14 handleMovedZoneNames:v16];
      }
    }
    else
    {
LABEL_10:

LABEL_15:
      id v14 = (id)objc_opt_new();
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v17 = v5;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v28;
        uint64_t v21 = *MEMORY[0x1E4F59418];
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if ([v23 isEqualToString:v21])
            {
              uint64_t v24 = brc_bread_crumbs();
              id v25 = brc_default_log();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v36 = v24;
                _os_log_fault_impl(&dword_1D353B000, v25, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't CZM the clouddocs zone%@", buf, 0xCu);
              }
            }
            else
            {
              uint64_t v24 = [(BRCAccountSession *)self->_session privateServerZoneByID:v23];
              if (v24) {
                [v14 addObject:v24];
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v37 count:16];
        }
        while (v19);
      }

      [(BRCAccountSession *)self->_session scheduleZoneMovesToCloudDocs:v14];
    }
    id v4 = v26;
  }
}

- (unint64_t)didSyncDownRequestID:(unint64_t)a3 serverChangeToken:(id)a4 editedRecords:(id)a5 deletedRecordIDs:(id)a6 deletedShareRecordIDs:(id)a7 allocRankZones:(id *)a8 caughtUp:(BOOL)a9 pendingChanges:(id)a10
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v44 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a10;
  uint64_t v19 = self->_session;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v48 = _os_activity_create(&dword_1D353B000, "server-zone/did-sync-down", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v48, &state);
  memset(v64, 0, sizeof(v64));
  __brc_create_section(0, (uint64_t)"-[BRCServerZone didSyncDownRequestID:serverChangeToken:editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:]", 1674, v64);
  uint64_t v20 = brc_bread_crumbs();
  uint64_t v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v37 = v64[0];
    uint64_t v47 = [v15 count];
    uint64_t v38 = [v16 count];
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = v37;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v47;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t))v38;
    LOWORD(v73) = 2112;
    *(void *)((char *)&v73 + 2) = v20;
    _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx saving sync-down batch (edits:%ld deletions:%ld)%@", buf, 0x2Au);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v72 = __Block_byref_object_copy__19;
  *(void *)&long long v73 = __Block_byref_object_dispose__19;
  if (a9) {
    id v22 = v18;
  }
  else {
    id v22 = 0;
  }
  *((void *)&v73 + 1) = v22;
  uint64_t v23 = [(NSMutableDictionary *)self->_failedListDirectoryOperations allValues];
  [(NSMutableDictionary *)self->_failedListDirectoryOperations removeAllObjects];
  if (!a9 && [v23 count])
  {
    abc_report_panic_with_signature();
    [NSString stringWithFormat:@"We have failed streams even though we aren't caught up? Crashing to prevent state corruption"];
    objc_claimAutoreleasedReturnValue();
    uint64_t v39 = brc_bread_crumbs();
    long long v40 = brc_default_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    {
      long long v41 = brc_append_system_info_to_message();
      -[BRCServerZone didSyncDownRequestID:serverChangeToken:editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:](v41, (uint64_t)v39, v70, v40);
    }

    brc_append_system_info_to_message();
    long long v42 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[BRCServerZone didSyncDownRequestID:serverChangeToken:editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCServerZone.m", 1681, v42);
  }
  db = self->_db;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke;
  v50[3] = &unk_1E6996C80;
  id v45 = v16;
  id v51 = v45;
  id v46 = v15;
  id v52 = v46;
  int v53 = self;
  unint64_t v61 = a3;
  id v25 = v23;
  id v54 = v25;
  id v26 = v17;
  id v55 = v26;
  uint64_t v62 = a8;
  BOOL v63 = a9;
  id v27 = v18;
  id v56 = v27;
  id v59 = buf;
  uint64_t v60 = &v66;
  long long v28 = v19;
  uint64_t v57 = v28;
  id v29 = v44;
  id v58 = v29;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_201;
  v49[3] = &unk_1E6996CA8;
  v49[4] = buf;
  [(BRCPQLConnection *)db performWithFlags:9 action:v50 whenFlushed:v49];
  if (v67[3])
  {
    long long v30 = (void *)MEMORY[0x1E4F594A8];
    long long v31 = [(BRCServerZone *)self mangledID];
    uint64_t v32 = *MEMORY[0x1E4F592D8];
    long long v33 = [(BRCServerChangeState *)self->_changeState lastSyncDownDate];
    long long v34 = v33;
    if (!v33)
    {
      long long v34 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    objc_msgSend(v30, "postContainerStatusChangeNotificationWithID:key:value:", v31, v32, v34, a8);
    if (!v33) {

    }
    unint64_t v35 = v67[3];
  }
  else
  {
    unint64_t v35 = 0;
  }

  _Block_object_dispose(buf, 8);
  __brc_leave_section(v64);
  os_activity_scope_leave(&state);

  _Block_object_dispose(&v66, 8);
  return v35;
}

uint64_t __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) count] && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 40) count];
      uint64_t v7 = [*(id *)(a1 + 32) count];
      uint64_t v8 = [*(id *)(a1 + 48) mangledID];
      *(_DWORD *)buf = 134218754;
      uint64_t v140 = v6;
      __int16 v141 = 2048;
      uint64_t v142 = v7;
      __int16 v143 = 2112;
      int v144 = v8;
      __int16 v145 = 2112;
      int v146 = v4;
      _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] received %lu edited items and %lu deleted items from the cloud for %@\n%@", buf, 0x2Au);
    }
  }
  else
  {
    if ([*(id *)(a1 + 32) count])
    {
      id v4 = brc_bread_crumbs();
      id v5 = brc_default_log();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      uint64_t v9 = [*(id *)(a1 + 32) count];
      id v10 = [*(id *)(a1 + 48) mangledID];
      *(_DWORD *)buf = 134218498;
      uint64_t v140 = v9;
      __int16 v141 = 2112;
      uint64_t v142 = (uint64_t)v10;
      __int16 v143 = 2112;
      int v144 = v4;
      id v11 = "[NOTICE] received %lu deleted items from the cloud for %@\n%@";
    }
    else
    {
      id v4 = brc_bread_crumbs();
      id v5 = brc_default_log();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      uint64_t v12 = [*(id *)(a1 + 40) count];
      id v10 = [*(id *)(a1 + 48) mangledID];
      *(_DWORD *)buf = 134218498;
      uint64_t v140 = v12;
      __int16 v141 = 2112;
      uint64_t v142 = (uint64_t)v10;
      __int16 v143 = 2112;
      int v144 = v4;
      id v11 = "[NOTICE] received %lu edited items from the cloud for %@\n%@";
    }
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEFAULT, v11, buf, 0x20u);
  }
LABEL_11:

  uint64_t v13 = (id *)(a1 + 48);
  unint64_t v14 = *(void *)(a1 + 112);
  if (v14 < [*(id *)(*(void *)(a1 + 48) + 8) clientRequestID])
  {
    v112 = brc_bread_crumbs();
    v113 = brc_default_log();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_FAULT)) {
      __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_5();
    }
  }
  uint64_t v119 = a1;
  if ([*(id *)(a1 + 56) count])
  {
    id v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [*(id *)(a1 + 56) count];
      *(_DWORD *)buf = 134218242;
      uint64_t v140 = v17;
      __int16 v141 = 2112;
      uint64_t v142 = (uint64_t)v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Saving %lu failed directory list operations first%@", buf, 0x16u);
    }

    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v18 = *(id *)(a1 + 56);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v130 objects:v138 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v131;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v131 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v130 + 1) + 8 * i);
          uint64_t v24 = [v23 pendingChangesStream];
          [*v13 _savePendingChangesEditedStructureRecordsIgnoringRecordIDs:0 zonesNeedingAllocRanks:0 pendingChangeStream:v24];
          [*v13 _savePendingChangesEditedContentRecordsIgnoringRecordIDs:0 zonesNeedingAllocRanks:0 pendingChangeStream:v24];
          [*v13 _savePendingChangesSharesIgnoringRecordIDs:0 zonesNeedingAllocRanks:0 pendingChangeStream:v24];
          uint64_t v25 = [v23 serverTruthCallback];
          if (v25)
          {
            id v26 = (void *)v25;
            id v27 = [v24 lastError];

            if (!v27)
            {
              long long v28 = [v23 serverTruthCallback];
              v28[2]();
            }
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v130 objects:v138 count:16];
      }
      while (v20);
    }

    a1 = v119;
  }
  v118 = v3;
  uint64_t v121 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 32)];
  v120 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 64)];
  id v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", *(void *)(a1 + 48), 0);
  long long v30 = *(id **)(a1 + 120);
  if (v30) {
    objc_storeStrong(v30, v29);
  }
  __int16 v117 = v29;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v31 = [*(id *)(a1 + 40) objectEnumerator];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v126 objects:v137 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v127;
    uint64_t v35 = *MEMORY[0x1E4F19D78];
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v127 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v37 = *(void **)(*((void *)&v126 + 1) + 8 * j);
        uint64_t v38 = [v37 recordType];
        int v39 = [v38 isEqualToString:v35];

        long long v40 = [v37 recordID];
        if (v39)
        {
          [v120 addObject:v40];
        }
        else
        {
          [v121 addObject:v40];

          long long v40 = [v37 recordType];
          if (([v40 isEqualToString:@"content"] & 1) == 0)
          {
            long long v41 = [v37 recordType];
            char v42 = [v41 isEqualToString:@"structure"];

            if (v42) {
              continue;
            }
            long long v40 = brc_bread_crumbs();
            __int16 v43 = brc_default_log();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v140 = (uint64_t)v40;
              _os_log_fault_impl(&dword_1D353B000, v43, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [record.recordType isEqualToString:kBRRecordTypeContent] || [record.recordType isEqualToString:kBRRecordTypeStructure]%@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v126 objects:v137 count:16];
    }
    while (v33);
  }

  int v44 = *(unsigned __int8 *)(v119 + 128);
  char v45 = [*(id *)(v119 + 48) state];
  if (!v44)
  {
    uint64_t v47 = v117;
    id v46 = v118;
    if ((v45 & 4) != 0)
    {
      unint64_t v61 = brc_bread_crumbs();
      uint64_t v62 = brc_default_log();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
        __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_4();
      }

      [*v13 clearStateBits:4];
    }
    goto LABEL_60;
  }
  uint64_t v47 = v117;
  id v46 = v118;
  if ((v45 & 4) != 0 || ([*v13 state] & 0x20) == 0 && !objc_msgSend(*v13, "isSharedZone"))
  {
LABEL_60:
    uint64_t v63 = [*((id *)*v13 + 6) directoryItemIDsCreatedLastSyncUp];
    int v64 = (void *)*((void *)*v13 + 10);
    *((void *)*v13 + 10) = v63;

    goto LABEL_61;
  }
  id v48 = brc_bread_crumbs();
  v49 = brc_default_log();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    id v50 = *v13;
    *(_DWORD *)buf = 138412546;
    uint64_t v140 = (uint64_t)v50;
    __int16 v141 = 2112;
    uint64_t v142 = (uint64_t)v48;
    _os_log_impl(&dword_1D353B000, v49, OS_LOG_TYPE_DEFAULT, "[WARNING] Promoting %@ to full sync because we have completed full sync before and now we're caught up again%@", buf, 0x16u);
  }

  [*v13 setStateBits:4];
  id v51 = [*v13 mangledID];
  id v52 = +[BRCUserDefaults defaultsForMangledID:v51];
  uint64_t v53 = [v52 dbMigrationBatchSize];

  id v54 = 0;
  do
  {
    id v55 = [*v13 dbRowID];
    int v56 = [v118 execute:@"UPDATE server_items SET item_type = 0 WHERE item_type = 9 AND zone_rowid = %@ LIMIT %lld", v55, v53];

    v54 += [v118 changes];
  }
  while (v56 && [v118 changes] >= v53);
  uint64_t v57 = brc_bread_crumbs();
  id v58 = brc_default_log();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    id v109 = *v13;
    *(_DWORD *)buf = 134218498;
    uint64_t v140 = (uint64_t)v54;
    __int16 v141 = 2112;
    uint64_t v142 = (uint64_t)v109;
    __int16 v143 = 2112;
    int v144 = v57;
    _os_log_debug_impl(&dword_1D353B000, v58, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %llu items to be normal directories in %@%@", buf, 0x20u);
  }

  uint64_t v59 = [*((id *)*v13 + 6) directoryItemIDsCreatedLastSyncUp];
  uint64_t v60 = (void *)*((void *)*v13 + 10);
  *((void *)*v13 + 10) = v59;

  if ((v56 & 1) == 0) {
    goto LABEL_89;
  }
LABEL_61:
  if (![*(id *)(v119 + 48) _savePendingChangesEditedStructureRecordsIgnoringRecordIDs:v121 zonesNeedingAllocRanks:v47 pendingChangeStream:*(void *)(v119 + 72)])goto LABEL_89; {
  if (![*(id *)(v119 + 48) _savePendingChangesDeletedRecordIDsIgnoringRecordIDs:v121 pendingChangeStream:*(void *)(v119 + 72)])goto LABEL_89;
  }
  id v65 = *(void **)(v119 + 48);
  uint64_t v66 = [*(id *)(v119 + 40) objectEnumerator];
  LODWORD(v65) = [v65 _saveEditedStructureRecords:v66 zonesNeedingAllocRanks:v47];

  if (!v65
    || ![*(id *)(v119 + 48) _saveDeletedRecordIDs:*(void *)(v119 + 32)]
    || ![*(id *)(v119 + 48) _savePendingChangesEditedContentRecordsIgnoringRecordIDs:v121 zonesNeedingAllocRanks:v47 pendingChangeStream:*(void *)(v119 + 72)]|| (v67 = *(void **)(v119 + 48), objc_msgSend(*(id *)(v119 + 40), "objectEnumerator"), uint64_t v68 = objc_claimAutoreleasedReturnValue(), LODWORD(v67) = objc_msgSend(v67, "_saveEditedContentRecords:zonesNeedingAllocRanks:", v68, v47), v68, !v67)|| (objc_msgSend(*(id *)(v119 + 48), "_savePendingChangesSharesIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:", v120, v47, *(void *)(v119 + 72)) & 1) == 0)
  {
LABEL_89:
    v98 = (void *)*((void *)*v13 + 10);
    *((void *)*v13 + 10) = 0;

    goto LABEL_90;
  }
  uint64_t v69 = *(void **)(v119 + 48);
  id v70 = [*(id *)(v119 + 40) objectEnumerator];
  LOBYTE(v69) = [v69 _saveEditedShareRecords:v70 deletedShareRecordIDs:*(void *)(v119 + 64) zonesNeedingAllocRanks:v47];

  uint64_t v71 = *(void *)(v119 + 48);
  uint64_t v72 = *(void **)(v71 + 80);
  *(void *)(v71 + 80) = 0;

  if (v69)
  {
    long long v73 = brc_bread_crumbs();
    uint64_t v74 = brc_default_log();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v114 = *(void *)(v119 + 48);
      uint64_t v115 = *(void *)(v119 + 112);
      uint64_t v116 = prettyPrintServerChangeToken(*(void **)(v119 + 88), 0);
      *(_DWORD *)buf = 138413058;
      uint64_t v140 = v114;
      __int16 v141 = 2048;
      uint64_t v142 = v115;
      __int16 v143 = 2112;
      int v144 = v116;
      __int16 v145 = 2112;
      int v146 = v73;
      _os_log_debug_impl(&dword_1D353B000, v74, OS_LOG_TYPE_DEBUG, "[DEBUG] updating %@\nwith requestID:%llu token:%@%@", buf, 0x2Au);
    }
    id v75 = brc_bread_crumbs();
    id v76 = brc_default_log();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
      __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_2();
    }

    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v77 = v47;
    uint64_t v78 = [v77 countByEnumeratingWithState:&v122 objects:v136 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = *(void *)v123;
      while (2)
      {
        for (uint64_t k = 0; k != v79; ++k)
        {
          if (*(void *)v123 != v80) {
            objc_enumerationMutation(v77);
          }
          int v82 = *(void **)(*((void *)&v122 + 1) + 8 * k);
          if (*(unsigned char *)(v119 + 128))
          {
            uint64_t v83 = [*(id *)(*((void *)&v122 + 1) + 8 * k) dbRowID];
            char v84 = objc_msgSend(v82, "allocateRanksWhenCaughtUp:", objc_msgSend(v83, "br_isEqualToNumber:", *((void *)*v13 + 5)));

            if ((v84 & 1) == 0) {
              goto LABEL_101;
            }
          }
          else if (([*(id *)(*((void *)&v122 + 1) + 8 * k) allocateRanksWhenCaughtUp:0] & 1) == 0)
          {
LABEL_101:
            [*(id *)(*(void *)(*(void *)(v119 + 96) + 8) + 40) destroyDatabase];
            uint64_t v110 = *(void *)(*(void *)(v119 + 96) + 8);
            uint64_t v111 = *(void **)(v110 + 40);
            *(void *)(v110 + 40) = 0;

            uint64_t v104 = 0;
            goto LABEL_99;
          }
        }
        uint64_t v79 = [v77 countByEnumeratingWithState:&v122 objects:v136 count:16];
        if (v79) {
          continue;
        }
        break;
      }
    }

    [*(id *)(v119 + 48) checkIfFinishedFullSync];
    uint64_t v85 = [*(id *)(v119 + 48) changeState];
    [v85 updateWithServerChangeToken:*(void *)(v119 + 88) clientRequestID:*(void *)(v119 + 112) caughtUp:*(unsigned __int8 *)(v119 + 128)];

    id v86 = [*(id *)(v119 + 48) changeState];
    uint64_t v87 = [v86 lastSyncDownDate];
    uint64_t v88 = [*(id *)(v119 + 80) serverState];
    [v88 setLastSyncDownDate:v87];

    uint64_t v89 = [MEMORY[0x1E4F28C40] defaultCenter];
    uint64_t v90 = *MEMORY[0x1E4F592F0];
    uint64_t v134 = *MEMORY[0x1E4F593C0];
    v91 = [*(id *)(v119 + 48) changeState];
    uint64_t v92 = [v91 lastSyncDownDate];
    v135 = v92;
    v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
    [v89 postNotificationName:v90 object:0 userInfo:v93];

    v94 = [*(id *)(v119 + 80) serverState];
    v95 = [*(id *)(v119 + 48) db];
    [v94 saveToDB:v95];

    if ([*(id *)(v119 + 80) saveServerZoneToDB:*(void *)(v119 + 48)])
    {
      v96 = [*(id *)(v119 + 80) serverState];
      *(void *)(*(void *)(*(void *)(v119 + 104) + 8) + 24) = [v96 nextRank];

      objc_storeStrong((id *)(*(void *)(*(void *)(v119 + 96) + 8) + 40), *(id *)(v119 + 72));
      if (!*(void *)(*(void *)(*(void *)(v119 + 96) + 8) + 40))
      {
        uint64_t v104 = 1;
        goto LABEL_100;
      }
      brc_bread_crumbs();
      id v77 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v97 = brc_default_log();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG)) {
        __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_1();
      }

      goto LABEL_94;
    }
LABEL_98:
    [*(id *)(*(void *)(*(void *)(v119 + 96) + 8) + 40) destroyDatabase];
    uint64_t v104 = 0;
    uint64_t v107 = *(void *)(*(void *)(v119 + 96) + 8);
    id v77 = *(id *)(v107 + 40);
    *(void *)(v107 + 40) = 0;
    goto LABEL_99;
  }
LABEL_90:
  v99 = [*(id *)(*(void *)(*(void *)(v119 + 96) + 8) + 40) lastError];

  if (!v99)
  {
    int v105 = brc_bread_crumbs();
    BOOL v106 = brc_default_log();
    if (os_log_type_enabled(v106, (os_log_type_t)0x90u)) {
      __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_3(v46, (uint64_t)v105, v106);
    }

    goto LABEL_98;
  }
  v100 = brc_bread_crumbs();
  v101 = brc_default_log();
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v140 = (uint64_t)v100;
    _os_log_impl(&dword_1D353B000, v101, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed enumerating the changes stream but don't broken structure%@", buf, 0xCu);
  }

  [*(id *)(*(void *)(*(void *)(v119 + 96) + 8) + 40) destroyDatabase];
  uint64_t v102 = *(void *)(*(void *)(v119 + 96) + 8);
  uint64_t v103 = *(void **)(v102 + 40);
  *(void *)(v102 + 40) = 0;

  id v77 = [*(id *)(v119 + 80) serverState];
  *(void *)(*(void *)(*(void *)(v119 + 104) + 8) + 24) = [v77 nextRank];
LABEL_94:
  uint64_t v104 = 1;
LABEL_99:

LABEL_100:
  return v104;
}

void __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_201(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) destroyDatabase];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (unint64_t)didListDirectoryChangesWithResults:(id)a3 pendingFetchChanges:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([(BRCPQLConnection *)self->_db isInTransaction] & 1) == 0)
  {
    uint64_t v33 = brc_bread_crumbs();
    uint64_t v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem markNeedsDeleteForItemIDTransfer]();
    }
  }
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = [*(id *)(*((void *)&v39 + 1) + 8 * v13) recordID];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v11);
  }

  id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", self, 0);
  if (![(BRCServerZone *)self _savePendingChangesEditedStructureRecordsIgnoringRecordIDs:v8 zonesNeedingAllocRanks:v15 pendingChangeStream:v7])goto LABEL_16; {
  if (![(BRCServerZone *)self _savePendingChangesDeletedRecordIDsIgnoringRecordIDs:v8 pendingChangeStream:v7])goto LABEL_16;
  }
  id v16 = [v9 objectEnumerator];
  BOOL v17 = [(BRCServerZone *)self _saveEditedStructureRecords:v16 zonesNeedingAllocRanks:v15];

  if (!v17) {
    goto LABEL_16;
  }
  if (-[BRCServerZone _savePendingChangesEditedContentRecordsIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:](self, "_savePendingChangesEditedContentRecordsIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:", v8, v15, v7)&& ([v9 objectEnumerator], id v18 = objc_claimAutoreleasedReturnValue(), v19 = -[BRCServerZone _saveEditedContentRecords:zonesNeedingAllocRanks:](self, "_saveEditedContentRecords:zonesNeedingAllocRanks:", v18, v15), v18, v19)&& -[BRCServerZone _savePendingChangesSharesIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:](self, "_savePendingChangesSharesIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:", v8, v15,
         v7))
  {
    uint64_t v20 = [v9 objectEnumerator];
    int v21 = [(BRCServerZone *)self _saveEditedShareRecords:v20 deletedShareRecordIDs:0 zonesNeedingAllocRanks:v15];
  }
  else
  {
LABEL_16:
    int v21 = 0;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v22 = v15;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v36;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v22);
        }
        if (v21) {
          int v21 = [*(id *)(*((void *)&v35 + 1) + 8 * v26) allocateRanksWhenCaughtUp:0];
        }
        else {
          int v21 = 0;
        }
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v24);
  }

  id v27 = brc_bread_crumbs();
  long long v28 = brc_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[BRCServerZone didListDirectoryChangesWithResults:pendingFetchChanges:]();
  }

  id v29 = [(BRCAccountSession *)self->_session serverState];
  uint64_t v30 = [v29 nextRank];

  if (v21 && ([(BRCServerZone *)self checkIfFinishedFullSync], v30))
  {
    if ([(BRCAccountSession *)self->_session saveServerZoneToDB:self]) {
      unint64_t v31 = v30;
    }
    else {
      unint64_t v31 = 0;
    }
  }
  else
  {
    unint64_t v31 = 0;
  }

  return v31;
}

- (void)failedListingDirectoryChanges:(id)a3 serverTruthCallback:(id)a4 clientTruthCallback:(id)a5 folderItemID:(id)a6
{
  failedListDirectoryOperations = self->_failedListDirectoryOperations;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(NSMutableDictionary *)failedListDirectoryOperations objectForKeyedSubscript:v11];

  if (v15)
  {
    BOOL v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCServerZone failedListingDirectoryChanges:serverTruthCallback:clientTruthCallback:folderItemID:]();
    }
  }
  id v16 = [[BRCFailedListSaveObject alloc] initWithPendingChangesStream:v14 serverTruthCallback:v13 clientTruthCallback:v12];

  [(NSMutableDictionary *)self->_failedListDirectoryOperations setObject:v16 forKeyedSubscript:v11];
}

- (id)failedListItemIDs
{
  return (id)[(NSMutableDictionary *)self->_failedListDirectoryOperations allKeys];
}

- (void)_collectTombstoneForRank:(unint64_t)a3
{
  id v4 = [(PQLConnection *)self->_db itemIDWithSQL:@"SELECT item_id FROM server_items WHERE zone_rowid = %@ AND item_rank = %lld AND item_state = 1", self->_dbRowID, a3];
  if (v4)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCServerZone _collectTombstoneForRank:]();
    }

    if ([(BRCServerZone *)self isPrivateZone])
    {
      db = self->_db;
      uint64_t v8 = [(BRCServerZone *)self clientZone];
      id v9 = [v8 rootItemID];
      [(BRCPQLConnection *)db execute:@"UPDATE server_items SET item_parent_id = %@ WHERE zone_rowid = %@ AND item_parent_id = %@", v9, self->_dbRowID, v4];
    }
    [(BRCPQLConnection *)self->_db execute:@"DELETE FROM server_items WHERE zone_rowid = %@ AND item_id = %@", self->_dbRowID, v4];
  }
}

- (void)collectTombstoneRanks:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCPQLConnection *)self->_db serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__BRCServerZone_collectTombstoneRanks___block_invoke;
  v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __39__BRCServerZone_collectTombstoneRanks___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 48) activated])
  {
    memset(v13, 0, sizeof(v13));
    __brc_create_section(0, (uint64_t)"-[BRCServerZone collectTombstoneRanks:]_block_invoke", 1918, v13);
    uint64_t v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = v13[0];
      uint64_t v8 = [*(id *)(a1 + 40) count];
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)buf = 134218754;
      uint64_t v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      int v21 = v2;
      _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Starting to GC %ld server tombstones in %@%@", buf, 0x2Au);
    }

    id v4 = *(void **)(*(void *)(a1 + 32) + 24);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__BRCServerZone_collectTombstoneRanks___block_invoke_214;
    v10[3] = &unk_1E6993A88;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v11 = v5;
    uint64_t v12 = v6;
    [v4 groupInTransaction:v10];
    [*(id *)(*(void *)(a1 + 32) + 48) didGCTombstoneRanks:*(void *)(a1 + 40)];

    __brc_leave_section(v13);
  }
}

uint64_t __39__BRCServerZone_collectTombstoneRanks___block_invoke_214(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__BRCServerZone_collectTombstoneRanks___block_invoke_2;
  v3[3] = &unk_1E6996CD0;
  os_log_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  [v1 enumerateIndexesUsingBlock:v3];
  return 1;
}

uint64_t __39__BRCServerZone_collectTombstoneRanks___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _collectTombstoneForRank:a2];
}

- (BOOL)resetServerTruthAndDestroyZone:(BOOL)a3
{
  id v4 = self;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v5 = v4->_dbRowID;
  db = v4->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__BRCServerZone_resetServerTruthAndDestroyZone___block_invoke;
  v9[3] = &unk_1E6996CF8;
  v9[4] = v4;
  uint64_t v10 = v5;
  BOOL v11 = a3;
  uint64_t v7 = v5;
  LOBYTE(v4) = [(BRCPQLConnection *)db performWithFlags:26 action:v9];

  return (char)v4;
}

uint64_t __48__BRCServerZone_resetServerTruthAndDestroyZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) mangledID];
  id v5 = +[BRCUserDefaults defaultsForMangledID:v4];
  uint64_t v6 = [v5 dbMigrationBatchSize];

  while (([v3 execute:@"DELETE FROM server_items WHERE zone_rowid = %@ LIMIT %lld", *(void *)(a1 + 40), v6] & 1) != 0)
  {
    if ([v3 changes] < v6)
    {
      if (*(unsigned char *)(a1 + 48))
      {
        uint64_t v7 = brc_bread_crumbs();
        uint64_t v8 = brc_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __48__BRCServerZone_resetServerTruthAndDestroyZone___block_invoke_cold_2();
        }

        uint64_t v9 = [v3 execute:@"DELETE FROM server_zones WHERE rowid = %@", *(void *)(a1 + 40)];
      }
      else
      {
        [*(id *)(*(void *)(a1 + 32) + 8) forgetChangeTokens];
        [*(id *)(*(void *)(a1 + 32) + 8) forgetClientRequestID];
        [*(id *)(a1 + 32) clearStateBits:60];
        id v13 = brc_bread_crumbs();
        id v14 = brc_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          __48__BRCServerZone_resetServerTruthAndDestroyZone___block_invoke_cold_1();
        }

        uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "saveServerZoneToDB:");
      }
      uint64_t v12 = v9;
      goto LABEL_15;
    }
  }
  uint64_t v10 = brc_bread_crumbs();
  BOOL v11 = brc_default_log();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = [v3 lastError];
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = v16;
    __int16 v20 = 2112;
    int v21 = v17;
    __int16 v22 = 2112;
    uint64_t v23 = v10;
    _os_log_error_impl(&dword_1D353B000, v11, (os_log_type_t)0x90u, "[ERROR] failed purging zone %@ - %@%@", buf, 0x20u);
  }
  uint64_t v12 = 0;
LABEL_15:

  return v12;
}

- (BOOL)resetServerTruth
{
  return [(BRCServerZone *)self resetServerTruthAndDestroyZone:0];
}

- (void)deleteAllContentsOnServerWithCompletionBlock:(id)a3
{
  id v3 = a3;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[BRCServerZone deleteAllContentsOnServerWithCompletionBlock:]();
  }

  uint64_t v6 = dispatch_get_global_queue(0, 0);
  dispatch_async(v6, v3);
}

- (id)deleteAllContentsOperation
{
  return 0;
}

- (BOOL)shouldRecreateServerZoneAfterError:(id)a3
{
  id v4 = a3;
  if ([(BRCServerZone *)self isPrivateZone]
    && ![(BRCServerZone *)self hasFetchedServerZoneState])
  {
    char v5 = objc_msgSend(v4, "brc_isCloudKitErrorImplyingZoneNeedsCreation");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)hasFetchedServerZoneState
{
  id v2 = [(BRCServerZone *)self changeState];
  objc_sync_enter(v2);
  id v3 = [v2 changeToken];
  BOOL v4 = v3 != 0;

  objc_sync_exit(v2);
  return v4;
}

- (void)forceMoveToCloudDocs
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !appLibrary.wasMovedToCloudDocs%@", v2, v3, v4, v5, v6);
}

void __37__BRCServerZone_forceMoveToCloudDocs__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) db];
  uint64_t v3 = [v2 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__BRCServerZone_forceMoveToCloudDocs__block_invoke_2;
  block[3] = &unk_1E6996D20;
  id v7 = *(id *)(a1 + 40);
  long long v8 = *(_OWORD *)(a1 + 48);
  dispatch_sync(v3, block);

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 48) + 24) serialQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__BRCServerZone_forceMoveToCloudDocs__block_invoke_3;
    v5[3] = &unk_1E6993698;
    v5[4] = *(void *)(a1 + 48);
    dispatch_sync(v4, v5);
  }
}

void __37__BRCServerZone_forceMoveToCloudDocs__block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = [*(id *)(a1[5] + 16) cloudDocsClientZone];
  LOBYTE(v2) = [v2 _crossZoneMoveDocumentsToZone:v3];

  if ((v2 & 1) == 0) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

uint64_t __37__BRCServerZone_forceMoveToCloudDocs__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetServerTruthAndDestroyZone:1];
}

- (BOOL)saveQueryRecords:(id)a3 zonesNeedingAllocRanks:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    BOOL v14 = 1;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        BOOL v14 = v14
           && -[BRCServerZone _saveEditedRecord:zonesNeedingAllocRanks:error:](self, "_saveEditedRecord:zonesNeedingAllocRanks:error:", *(void *)(*((void *)&v17 + 1) + 8 * i), v9, a5, (void)v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)setStateBits:(unsigned int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  uint64_t state = self->_state;
  unsigned int v6 = a3 | 0x38;
  if ((a3 & 4) == 0) {
    unsigned int v6 = a3;
  }
  unsigned int v7 = state | v6;
  self->_uint64_t state = v7;
  int v8 = v7 ^ state;
  if (v7 != state)
  {
    [(BRCServerZone *)self setNeedsSave:1];
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = [(BRCServerZone *)self mangledID];
      long long v17 = BRCPrettyPrintBitmapWithContext(state, (uint64_t)&server_zone_state_entries, 0);
      long long v18 = BRCPrettyPrintBitmapWithContext(self->_state, (uint64_t)&server_zone_state_entries, 0);
      *(_DWORD *)buf = 138413058;
      int v21 = v16;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      uint64_t v25 = v18;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ server state changed, %@ -> %@%@", buf, 0x2Au);
    }
    if ((v8 & 0x18) != 0 && (~self->_state & 0x18) == 0)
    {
      uint64_t v11 = [(BRCClientZone *)self->_clientZone db];
      uint64_t v12 = [v11 serialQueue];

      if (v12)
      {
        uint64_t v13 = [(BRCClientZone *)self->_clientZone db];
        BOOL v14 = [v13 serialQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __30__BRCServerZone_setStateBits___block_invoke;
        block[3] = &unk_1E6993698;
        void block[4] = self;
        dispatch_async(v14, block);
      }
    }
  }
  return v8 != 0;
}

void __30__BRCServerZone_setStateBits___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isPrivateZone]
    && ([*(id *)(*(void *)(a1 + 32) + 48) isSyncBlocked] & 1) == 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "asPrivateClientZone", 0);
    uint64_t v3 = [v2 appLibraries];

    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          int v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          [v8 fetchPristineness];
          [v8 scheduleFullLibraryContentsFetch];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
  id v9 = [*(id *)(*(void *)(a1 + 32) + 16) fsUploader];
  [v9 rescheduleJobsPendingRecentsAndFavoritesFetchInZone:*(void *)(a1 + 32)];

  id v10 = [*(id *)(*(void *)(a1 + 32) + 16) fsDownloader];
  [v10 rescheduleJobsPendingRecentsAndFavoritesFetchInZone:*(void *)(a1 + 32)];
}

- (void)clearStateBits:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  uint64_t state = self->_state;
  self->_uint64_t state = state & ~a3;
  if ((state & a3) != 0)
  {
    [(BRCServerZone *)self setNeedsSave:1];
    uint64_t v6 = brc_bread_crumbs();
    unsigned int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = [(BRCServerZone *)self mangledID];
      id v9 = BRCPrettyPrintBitmapWithContext(state, (uint64_t)&server_zone_state_entries, 0);
      id v10 = BRCPrettyPrintBitmapWithContext(self->_state, (uint64_t)&server_zone_state_entries, 0);
      int v11 = 138413058;
      long long v12 = v8;
      __int16 v13 = 2112;
      long long v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      long long v18 = v6;
      _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ server state changed, %@ -> %@%@", (uint8_t *)&v11, 0x2Au);
    }
  }
}

- (BOOL)hasFetchedRecentsAndFavorites
{
  return (~self->_state & 0x18) == 0;
}

- (unsigned)zoneCreationState
{
  if (![(BRCClientZone *)self->_clientZone hasCompletedInitialSyncDownOnce]) {
    return 0;
  }
  uint64_t v3 = [(BRCServerZone *)self changeState];
  uint64_t v4 = [v3 changeToken];
  if (v4) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = 2;
  }

  return v5;
}

- (BOOL)isCloudDocsZone
{
  uint64_t v2 = [(BRCServerZone *)self clientZone];
  char v3 = [v2 isCloudDocsZone];

  return v3;
}

- (void)addForegroundClient:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCServerZone *)self metadataSyncContext];
  [v5 addForegroundClient:v4];
}

- (void)removeForegroundClient:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCServerZone *)self metadataSyncContext];
  [v5 removeForegroundClient:v4];
}

- (id)itemByItemID:(id)a3 db:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__BRCServerZone_itemByItemID_db___block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  id v4 = (void *)[a4 fetchObject:v6, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@", a3, self->_dbRowID sql];
  return v4;
}

id __33__BRCServerZone_itemByItemID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) newServerItemFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)itemByItemID:(id)a3
{
  return [(BRCServerZone *)self itemByItemID:a3 db:self->_db];
}

- (id)itemsEnumeratorWithDB:(id)a3
{
  id v4 = (void *)[a3 fetch:@"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE zone_rowid = %@", self->_dbRowID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__BRCServerZone_itemsEnumeratorWithDB___block_invoke;
  v7[3] = &unk_1E6994120;
  v7[4] = self;
  id v5 = [v4 enumerateObjects:v7];

  return v5;
}

id __39__BRCServerZone_itemsEnumeratorWithDB___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) newServerItemFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)directDirectoryChildItemIDsOfParentEnumerator:(id)a3
{
  id v3 = [(BRCPQLConnection *)self->_db fetch:@"SELECT item_id FROM server_items WHERE zone_rowid = %@   AND item_parent_id = %@   AND item_type = 0", self->_dbRowID, a3];
  id v4 = [v3 enumerateObjectsOfClass:objc_opt_class()];

  return v4;
}

- (BOOL)dumpStatusToContext:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v40 = 0;
  long long v41 = &v40;
  uint64_t v42 = 0x2050000000;
  uint64_t v43 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 1;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  long long v35 = __Block_byref_object_copy__19;
  long long v36 = __Block_byref_object_dispose__19;
  id v37 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __43__BRCServerZone_dumpStatusToContext_error___block_invoke;
  v24[3] = &unk_1E6996D98;
  id v29 = v38;
  id v8 = v6;
  id v25 = v8;
  __int16 v26 = self;
  id v9 = v7;
  id v27 = v9;
  id v28 = 0;
  uint64_t v30 = &v32;
  unint64_t v31 = &v40;
  v41[3] = (uint64_t)v24;
  if (a4) {
    *a4 = (id) v33[5];
  }
  if ([(BRCServerZone *)self isPrivateZone])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = [(BRCServerZone *)self clientZone];
    int v11 = [v10 asPrivateClientZone];
    long long v12 = [v11 appLibraries];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = v41[3];
          __int16 v17 = [*(id *)(*((void *)&v20 + 1) + 8 * i) rootItemID];
          LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *, void, __CFString *, id *))(v16 + 16))(v16, v17, 0, @"/", a4);

          if ((v16 & 1) == 0)
          {
            BOOL v18 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v44 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v18 = 1;
LABEL_15:
  }
  else
  {
    BOOL v18 = 1;
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v40, 8);

  return v18;
}

uint64_t __43__BRCServerZone_dumpStatusToContext_error___block_invoke(uint64_t a1, void *a2, int a3, void *a4, uint64_t a5)
{
  id v7 = a2;
  id v8 = a4;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 1;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __43__BRCServerZone_dumpStatusToContext_error___block_invoke_2;
  v40[3] = &unk_1E6996D70;
  uint64_t v43 = *(void *)(a1 + 64);
  id v41 = *(id *)(a1 + 32);
  int v44 = v45;
  id v36 = v8;
  id v42 = v36;
  long long v38 = (void (**)(void))MEMORY[0x1D94389C0](v40);
  id v9 = [*(id *)(a1 + 32) db];
  id v10 = (void *)[v9 fetch:@"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count, rowid      FROM server_items    WHERE zone_rowid = %@ AND item_parent_id = %@ ORDER BY item_filename", *(void *)(*(void *)(a1 + 40) + 40), v7];
  uint64_t v34 = v7;

  do
  {
    int v11 = [v10 next];
    if (!v11) {
      break;
    }
    long long v12 = (void *)MEMORY[0x1D9438760]();
    if ([*(id *)(a1 + 32) isCancelled])
    {
      int v13 = 1;
    }
    else
    {
      uint64_t v14 = [v10 integerAtIndex:41];
      if ([*(id *)(a1 + 48) containsIndex:v14])
      {
        v38[2]();
        [*(id *)(a1 + 32) pushIndentation];
        __int16 v15 = *(void **)(a1 + 32);
        uint64_t v16 = [v10 objectOfClass:objc_opt_class() atIndex:4];
        __int16 v17 = +[BRCDumpContext stringFromItemID:v16 context:*(void *)(a1 + 32)];
        [v15 writeLineWithFormat:@"ERROR: item ID %@ seen twice", v17];

        [*(id *)(a1 + 32) popIndentation];
        int v13 = 2;
      }
      else
      {
        [*(id *)(a1 + 48) addIndex:v14];
        BOOL v18 = *(void **)(*(void *)(a1 + 40) + 16);
        uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
        id obj = *(id *)(v19 + 40);
        long long v20 = (void *)[v18 newServerItemFromPQLResultSet:v10 error:&obj];
        objc_storeStrong((id *)(v19 + 40), obj);
        if (v20)
        {
          long long v21 = [*(id *)(*(void *)(a1 + 40) + 16) applyScheduler];
          long long v22 = [v21 descriptionForServerItem:v20 context:*(void *)(a1 + 32)];

          if (v22)
          {
            v38[2]();
            [*(id *)(a1 + 32) pushIndentation];
            long long v23 = *(void **)(a1 + 32);
            __int16 v24 = [v20 descriptionWithContext:v23];
            [v23 writeLineWithFormat:@"%@", v24];

            [*(id *)(a1 + 32) writeLineWithFormat:@"> apply{%@}", v22];
            [*(id *)(a1 + 32) popIndentation];
          }
          int v25 = [v20 isDirectory] ^ 1;
          if (a3 > 99) {
            LOBYTE(v25) = 1;
          }
          if (v25) {
            goto LABEL_15;
          }
          __int16 v26 = *(void **)(a1 + 56);
          id v27 = [v20 itemID];
          LOBYTE(v26) = [v26 containsObject:v27];

          if (v26) {
            goto LABEL_15;
          }
          uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
          long long v35 = [v20 itemID];
          id v29 = [v20 st];
          uint64_t v30 = [v29 displayName];
          unint64_t v31 = [v36 stringByAppendingPathComponent:v30];
          LODWORD(v28) = (*(uint64_t (**)(uint64_t, void *, void, void *, uint64_t))(v28 + 16))(v28, v35, (a3 + 1), v31, a5);

          if (v28) {
LABEL_15:
          }
            int v13 = 0;
          else {
            int v13 = 1;
          }
        }
        else
        {
          int v13 = 1;
        }
      }
    }
  }
  while ((v13 | 2) == 2);

  _Block_object_dispose(v45, 8);
  return v11 ^ 1u;
}

uint64_t __43__BRCServerZone_dumpStatusToContext_error___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    [*(id *)(result + 32) writeLineWithFormat:@"Needs Apply Changes:"];
    result = [*(id *)(v1 + 32) writeLineWithFormat:@"-------------------"];
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24))
  {
    result = [*(id *)(v1 + 32) writeLineWithFormat:@"Under %@", *(void *)(v1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5
{
  BOOL v47 = a4;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v72 = 0;
  long long v73 = &v72;
  uint64_t v74 = 0x3032000000;
  id v75 = __Block_byref_object_copy__19;
  id v76 = __Block_byref_object_dispose__19;
  id v77 = 0;
  id v9 = [(BRCServerZone *)self descriptionWithContext:v7];
  [v7 writeLineWithFormat:@"server items (%@)", v9];

  [v7 writeLineWithFormat:@"============"];
  uint64_t v68 = 0;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x2050000000;
  uint64_t v71 = 0;
  uint64_t v64 = 0;
  id v65 = &v64;
  uint64_t v66 = 0x2020000000;
  int v67 = 0;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __59__BRCServerZone_dumpTablesToContext_includeAllItems_error___block_invoke;
  v56[3] = &unk_1E6996DC0;
  id v10 = v7;
  id v57 = v10;
  id v58 = self;
  uint64_t v60 = &v64;
  BOOL v63 = v47;
  id v46 = v8;
  id v59 = v46;
  unint64_t v61 = &v72;
  uint64_t v62 = &v68;
  v69[3] = (uint64_t)v56;
  int v11 = [(BRCServerZone *)self clientZone];
  int v12 = [v11 isPrivateZone];

  if (v12)
  {
    int v13 = [(BRCServerZone *)self clientZone];
    uint64_t v14 = [v13 asPrivateClientZone];
    __int16 v15 = [v14 appLibraries];
    unint64_t v16 = [v15 count];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    __int16 v17 = [(BRCServerZone *)self clientZone];
    BOOL v18 = [v17 asPrivateClientZone];
    id obj = [v18 appLibraries];

    uint64_t v19 = [obj countByEnumeratingWithState:&v52 objects:v78 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v53;
      char v21 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v53 != v20) {
            objc_enumerationMutation(obj);
          }
          long long v23 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          if (v16 >= 2)
          {
            if ((v21 & 1) == 0) {
              [v10 writeLineWithFormat:&stru_1F2AC7720];
            }
            __int16 v24 = [v23 logName];
            int v25 = [v23 dbRowID];
            [v10 writeLineWithFormat:@"----------------------%@[%@]----------------------", v24, v25];

            char v21 = 0;
          }
          *((_DWORD *)v65 + 6) = 0;
          uint64_t v26 = v69[3];
          id v27 = [v23 rootItemID];
          (*(void (**)(uint64_t, void *, void, id *))(v26 + 16))(v26, v27, 0, a5);

          if ([v10 isCancelled])
          {
            BOOL v41 = 0;
            goto LABEL_33;
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v52 objects:v78 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
  }
  [v10 writeLineWithFormat:&stru_1F2AC7720];
  uint64_t v28 = [v10 db];
  id obj = (id)[v28 numberWithSQL:@"SELECT COUNT(*) FROM server_items WHERE zone_rowid = %@", self->_dbRowID];

  uint64_t v29 = [obj unsignedIntegerValue];
  if (v29 == [v46 count])
  {
    uint64_t v30 = 0;
  }
  else
  {
    if (![(BRCServerZone *)self isSharedZone]) {
      [v10 writeLineWithFormat:@"ORPHANED ITEMS:"];
    }
    unint64_t v31 = [v10 db];
    dbRowID = self->_dbRowID;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __59__BRCServerZone_dumpTablesToContext_includeAllItems_error___block_invoke_2;
    v50[3] = &unk_1E6994080;
    id v51 = (BRCPendingChangesStream *)v46;
    uint64_t v33 = (void *)MEMORY[0x1D94389C0](v50);
    uint64_t v30 = (void *)[v31 fetch:@"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE zone_rowid = %@ AND call_block(%@, rowid)", dbRowID, v33];

    *((_DWORD *)v65 + 6) = 0;
    while ([v30 next])
    {
      uint64_t v34 = (void *)MEMORY[0x1D9438760]();
      session = self->_session;
      id v36 = (id *)(v73 + 5);
      id v49 = (id)v73[5];
      id v37 = [(BRCAccountSession *)session newServerItemFromPQLResultSet:v30 error:&v49];
      objc_storeStrong(v36, v49);
      ++*((_DWORD *)v65 + 6);
      int v38 = objc_msgSend(v10, "shouldKeepDumpingWithItemCount:includeAllItems:");
      char v39 = v38;
      if (v38)
      {
        uint64_t v40 = [v37 descriptionWithContext:v10];
        [v10 writeLineWithFormat:@"%@%@", v40, &stru_1F2AC7720];
      }
      if ((v39 & 1) == 0)
      {
        BOOL v41 = 0;
        id v42 = v51;
        goto LABEL_32;
      }
    }
    [v10 writeLineWithFormat:&stru_1F2AC7720];
  }
  id v42 = [[BRCPendingChangesStream alloc] initWithServerZone:self];
  BOOL v43 = [(BRCPendingChangesStream *)v42 dumpTablesToContext:v10 includeAllItems:v47 error:a5];
  BOOL v41 = v43;
  if (a5) {
    BOOL v44 = v43;
  }
  else {
    BOOL v44 = 0;
  }
  if (v44) {
    *a5 = (id) v73[5];
  }
LABEL_32:

LABEL_33:
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

  return v41;
}

uint64_t __59__BRCServerZone_dumpTablesToContext_includeAllItems_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = [*(id *)(a1 + 32) db];
  id v9 = (void *)[v8 fetch:@"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count, rowid      FROM server_items    WHERE zone_rowid = %@ AND item_parent_id = %@", *(void *)(*(void *)(a1 + 40) + 40), v7];

  if ([v9 next])
  {
    uint64_t v37 = a4;
    id v34 = v7;
    long long v35 = v9;
    unsigned int v36 = a3 + 1;
    id v10 = &off_1E6992000;
    int v11 = &off_1E6992000;
    int v12 = "";
    uint64_t v38 = a3;
    uint64_t v39 = a3;
    while (1)
    {
      int v13 = (void *)MEMORY[0x1D9438760]();
      uint64_t v14 = [v9 integerAtIndex:41];
      __int16 v15 = *(void **)(a1 + 32);
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (!objc_msgSend(v15, "shouldKeepDumpingWithItemCount:includeAllItems:")) {
        break;
      }
      context = v13;
      if ([*(id *)(a1 + 48) containsIndex:v14])
      {
        unint64_t v16 = *(void **)(a1 + 32);
        __int16 v17 = v10[274];
        BOOL v18 = [v9 objectOfClass:objc_opt_class() atIndex:4];
        uint64_t v19 = [v17 stringFromItemID:v18 context:*(void *)(a1 + 32)];
        [v16 writeLineWithFormat:@"%*sERROR: item ID %@ seen twice", a3, v12, v19];
      }
      else
      {
        [*(id *)(a1 + 48) addIndex:v14];
        uint64_t v20 = *(void **)(*(void *)(a1 + 40) + 16);
        uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
        id obj = *(id *)(v21 + 40);
        BOOL v18 = (void *)[v20 newServerItemFromPQLResultSet:v9 error:&obj];
        objc_storeStrong((id *)(v21 + 40), obj);
        if (!v18) {
          goto LABEL_17;
        }
        long long v22 = *(void **)(a1 + 32);
        long long v23 = [v18 descriptionWithContext:v22];
        [v22 writeLineWithFormat:@"%*s%@%@", v39, v12, v23, &stru_1F2AC7720];

        __int16 v24 = [*(id *)(*(void *)(a1 + 40) + 16) applyScheduler];
        uint64_t v19 = [v24 descriptionForServerItem:v18 context:*(void *)(a1 + 32)];

        if (v19) {
          [*(id *)(a1 + 32) writeLineWithFormat:@"%*s> apply{%@}", v38, v12, v19];
        }
        int v25 = [v18 isDirectory];
        if ((int)a3 <= 99 && v25)
        {
          uint64_t v26 = a3;
          id v27 = v12;
          uint64_t v28 = v11;
          uint64_t v29 = v10;
          uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
          unint64_t v31 = [v18 itemID];
          LOBYTE(v30) = (*(uint64_t (**)(uint64_t, void *, void, uint64_t))(v30 + 16))(v30, v31, v36, v37);

          if ((v30 & 1) == 0)
          {

            id v9 = v35;
LABEL_17:

            int v13 = context;
            break;
          }
          id v10 = v29;
          int v11 = v28;
          int v12 = v27;
          a3 = v26;
          id v9 = v35;
        }
      }

      if (([v9 next] & 1) == 0)
      {
        uint64_t v32 = 1;
        goto LABEL_19;
      }
    }
    uint64_t v32 = 0;
LABEL_19:
    id v7 = v34;
  }
  else
  {
    uint64_t v32 = 1;
  }

  return v32;
}

void __59__BRCServerZone_dumpTablesToContext_includeAllItems_error___block_invoke_2(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  if (a3 != 1)
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __59__BRCServerZone_dumpTablesToContext_includeAllItems_error___block_invoke_2_cold_1();
    }
  }
  int v7 = [*(id *)(a1 + 32) containsIndex:sqlite3_value_int64(*a4)];
  sqlite3_result_int64(a2, v7 ^ 1u);
}

- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  abc_report_panic_with_signature();
  [NSString stringWithFormat:@"you must override this"];
  objc_claimAutoreleasedReturnValue();
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = brc_append_system_info_to_message();
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    int v12 = v5;
    _os_log_fault_impl(&dword_1D353B000, v6, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v9, 0x16u);
  }
  brc_append_system_info_to_message();
  id v8 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCServerZone validateStructureLoggingToFile:db:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCServerZone.m", 2429, v8);
}

- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  abc_report_panic_with_signature();
  [NSString stringWithFormat:@"you must override this"];
  objc_claimAutoreleasedReturnValue();
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = brc_append_system_info_to_message();
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    int v12 = v5;
    _os_log_fault_impl(&dword_1D353B000, v6, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v9, 0x16u);
  }
  brc_append_system_info_to_message();
  id v8 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCServerZone validateItemsLoggingToFile:db:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCServerZone.m", 2434, v8);
}

- (BRCZoneRowID)dbRowID
{
  return self->_dbRowID;
}

- (void)setDbRowID:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (BRCServerChangeState)changeState
{
  return (BRCServerChangeState *)objc_getProperty(self, a2, 8, 1);
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (void)setNeedsSave:(BOOL)a3
{
  self->_needsSave = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoriesCreatedLastSyncUp, 0);
  objc_storeStrong((id *)&self->_failedListDirectoryOperations, 0);
  objc_storeStrong((id *)&self->_metadataSyncContext, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_dbRowID, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_changeState, 0);
}

- (id)jobsDescription
{
  uint64_t v2 = NSString;
  id v3 = [(BRCServerZone *)self dbRowID];
  id v4 = [v2 stringWithFormat:@"z:%@", v3];

  return v4;
}

- (id)matchingJobsWhereSQLClause
{
  uint64_t v2 = (void *)MEMORY[0x1E4FBA8F8];
  id v3 = [(BRCServerZone *)self dbRowID];
  id v4 = [v2 formatInjection:@"zone_rowid = %@", v3];

  return v4;
}

void __58__BRCServerZone_BRCZoneMigration__scheduleMoveToCloudDocs__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: can't czm move clouddocs zone%@", v2, v3, v4, v5, v6);
}

- (void)asPrivateZone
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: This is not a private zone%@", v2, v3, v4, v5, v6);
}

- (void)asSharedZone
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: This is not a shared zone%@", v2, v3, v4, v5, v6);
}

- (void)_saveItemID:stat:serverMetrics:record:origName:base:no:ext:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _db.changes == 1%@", v2, v3, v4, v5, v6);
}

- (void)_saveItemID:stat:serverMetrics:record:origName:base:no:ext:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] PCS chained directory doesn't have chain PCS! %@%@");
}

- (void)_saveItemID:stat:serverMetrics:record:origName:base:no:ext:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: BRCItemTypeIsDirectory(st.type)%@", v2, v3, v4, v5, v6);
}

- (void)_saveItemID:stat:serverMetrics:record:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !(st.logicalName.br_isSideFaultName || [st.logicalName br_isExcludedWithMaximumDepth:1])%@", v2, v3, v4, v5, v6);
}

- (void)_saveEditedDirOrDocStructureRecord:error:.cold.1()
{
  OUTLINED_FUNCTION_8_4();
  uint64_t v1 = [v0 parent];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_11_0(&dword_1D353B000, v2, v3, "[DEBUG] saving consistent structure record (%@) to db %@%@", v4, v5, v6, v7, v8);
}

- (void)_saveEditedDocumentContentRecord:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Adding %@ to the list of force package extensions (according to CKRecord)%@");
}

- (void)_saveEditedDocumentContentRecord:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Marking %@ as edited since shared because the modifier name is different%@");
}

- (void)_saveEditedDocumentContentRecord:error:.cold.3()
{
  OUTLINED_FUNCTION_8_4();
  os_log_t v1 = [v0 parent];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_11_0(&dword_1D353B000, v2, v3, "[DEBUG] saving consistent document record (%@) to db %@%@", v4, v5, v6, v7, v8);
}

- (void)_saveEditedSymlinkRecord:error:.cold.1()
{
  OUTLINED_FUNCTION_8_4();
  os_log_t v1 = [v0 parent];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_11_0(&dword_1D353B000, v2, v3, "[DEBUG] saving consistent symlink structure record (%@) to db %@%@", v4, v5, v6, v7, v8);
}

- (void)_saveEditedFinderBookmarkRecord:error:.cold.1()
{
  OUTLINED_FUNCTION_8_4();
  os_log_t v1 = [v0 parent];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_11_0(&dword_1D353B000, v2, v3, "[DEBUG] saving consistent finder bookmark structure record (%@) to db %@%@", v4, v5, v6, v7, v8);
}

- (void)_saveEditedAliasRecord:(void *)a1 zonesNeedingAllocRanks:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 recordID];
  uint64_t v7 = [a1 recordID];
  uint8_t v8 = [v7 zoneID];
  int v9 = [v8 ownerName];
  int v10 = 138412802;
  __int16 v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v9;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_error_impl(&dword_1D353B000, a3, (os_log_type_t)0x90u, "[ERROR] can't save %@: missing ownerKey for ownerName \"%@\"%@", (uint8_t *)&v10, 0x20u);
}

- (void)_saveEditedAliasRecord:zonesNeedingAllocRanks:error:.cold.2()
{
  OUTLINED_FUNCTION_8_4();
  os_log_t v1 = [v0 parent];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_11_0(&dword_1D353B000, v2, v3, "[DEBUG] saving consistent alias structure record (%@) to db %@%@", v4, v5, v6, v7, v8);
}

- (void)_saveEditedShareRecord:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] share without root record:\n    i:%@\n\n   this typically indicates either of two problems:\n    - either we failed processing the last sync down and we\n       failed inserting the shared record,\n    - or the server forgot to send it to us.%@");
}

- (void)_saveEditedShareRecord:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: share.currentUserParticipant.role != CKShareParticipantRoleOwner%@", v2, v3, v4, v5, v6);
}

- (void)_saveEditedShareRecord:error:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: share.currentUserParticipant.role == CKShareParticipantRoleOwner%@", v2, v3, v4, v5, v6);
}

- (void)_saveEditedShareRecord:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] saving consistent share record to db %@%@");
}

- (void)_saveEditedRecord:zonesNeedingAllocRanks:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Can't save zone root record %@%@");
}

- (void)_saveEditedRecord:zonesNeedingAllocRanks:error:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: structure record which isn't a directory or document%@", v2, v3, v4, v5, v6);
}

- (void)_markShareIDDead:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] marked shareID dead %@%@");
}

- (void)_markItemDeadForRecordID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Couldn't decode itemID from recordID %@%@");
}

- (void)_markItemDeadForRecordID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Not inserting tombstone entry for %@ because we don't have a server item already.  Let's go through rejected code path for perf.%@");
}

- (void)_markItemDeadForRecordID:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] saving consistent record delete to db %@%@");
}

- (void)_recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Failed to recover sharing options on %@%@");
}

- (void)_recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] Fixing up sharing options to have shareID for something that looks like a shared zone root for %@%@");
}

- (void)_recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Can't recover share options on shared zone child item %@%@");
}

- (void)_recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] Stripping share options for something that doesn't seem to need them %@%@");
}

- (void)allocateRanksWhenCaughtUp:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Forcing caught up state because we completed full sync so we must have synced down an unrelated zone%@", v2, v3, v4, v5, v6);
}

- (void)handleMovedZoneNames:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 UTF8String];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1D353B000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't create app library and zones for zone named: %s%@", v4, 0x16u);
}

- (void)didSyncDownRequestID:(uint8_t *)buf serverChangeToken:(os_log_t)log editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", buf, 0x16u);
}

void __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Delta sync successfully alloced rank so allowing finished changes stream to be destroyed%@", v2, v3, v4, v5, v6);
}

void __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Allocating ranks for %@%@");
}

void __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 lastError];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1D353B000, a3, (os_log_type_t)0x90u, "[ERROR] something went wrong while saving to the db: %@%@", v5, 0x16u);
}

void __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] %@ is no longer full sync because of a large delta sync operation%@");
}

void __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: requestID >= self->_changeState.clientRequestID%@", v2, v3, v4, v5, v6);
}

- (void)didListDirectoryChangesWithResults:pendingFetchChanges:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Listed directory changes in zones %@%@");
}

- (void)failedListingDirectoryChanges:serverTruthCallback:clientTruthCallback:folderItemID:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _failedListDirectoryOperations[itemID] == nil%@", v2, v3, v4, v5, v6);
}

- (void)_collectTombstoneForRank:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Removing applied tombstone: %@%@");
}

void __48__BRCServerZone_resetServerTruthAndDestroyZone___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Finished resetting server truth%@", v2, v3, v4, v5, v6);
}

void __48__BRCServerZone_resetServerTruthAndDestroyZone___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Finishing destroying server truth%@", v2, v3, v4, v5, v6);
}

- (void)deleteAllContentsOnServerWithCompletionBlock:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: attempted delete all content on an unsupported zone type: %@%@");
}

void __59__BRCServerZone_dumpTablesToContext_includeAllItems_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: argc == 1%@", v2, v3, v4, v5, v6);
}

@end