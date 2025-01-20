@interface BRCLocalItem
+ (BOOL)computeUserVisibleStatusOfLiveItemWithParentVisible:(BOOL)a3 parentIsNonDesktopRoot:(BOOL)a4 parentScope:(unsigned __int8)a5 itemFilename:(id)a6 parentFilename:(id)a7 appLibrary:(id)a8;
+ (id)newItemWithPath:(id)a3 parentGlobalID:(id)a4;
- (BOOL)_checkForSharedToMeItemInTrashWithPath:(id)a3;
- (BOOL)_checkZoneUpdateFromFSAtPath:(id)a3 parentGlobalID:(id)a4;
- (BOOL)_computedUserVisibleStatusAtPath:(id)a3;
- (BOOL)_contentXattrsHaveChangedAtRelativeAPath:(id)a3;
- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4;
- (BOOL)_hasFieldChangesNotDiffed;
- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4;
- (BOOL)_isIndexable;
- (BOOL)_isInterestingUpdateForNotifs;
- (BOOL)_isInterestingUpdateForNotifsWithDiffs:(unint64_t)a3;
- (BOOL)_isReadonlyShareChild;
- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4;
- (BOOL)changedAtRelativePath:(id)a3 scanPackage:(BOOL)a4;
- (BOOL)checkIsInDocumentsScopeWithParent:(id)a3;
- (BOOL)evictInTask:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)forceNeedsSyncUpWithoutDiffs;
- (BOOL)fromReadOnlyDB;
- (BOOL)hasShareIDAndIsOwnedByMe;
- (BOOL)hasValidCKInfo;
- (BOOL)isAlmostDead;
- (BOOL)isBRAlias;
- (BOOL)isChildSharedItem;
- (BOOL)isCrossZoneMoveTombstone;
- (BOOL)isDead;
- (BOOL)isDeadOrMissingInServerTruth;
- (BOOL)isDirectory;
- (BOOL)isDirectoryFault;
- (BOOL)isDirectoryWithPackageName;
- (BOOL)isDocument;
- (BOOL)isDocumentBeingCopiedToNewZone;
- (BOOL)isFSRoot;
- (BOOL)isFault;
- (BOOL)isFinderBookmark;
- (BOOL)isFromInitialScan;
- (BOOL)isIWorkItem;
- (BOOL)isIdleOrRejected;
- (BOOL)isInDataScope;
- (BOOL)isInDocumentOrTrashScope;
- (BOOL)isInDocumentScope;
- (BOOL)isInTrashScope;
- (BOOL)isKnownByServer;
- (BOOL)isKnownByServerOrInFlight;
- (BOOL)isLive;
- (BOOL)isLost;
- (BOOL)isNewToServer:(BOOL *)a3;
- (BOOL)isOnDisk;
- (BOOL)isOwnedByMe;
- (BOOL)isPackage;
- (BOOL)isReadAndUploaded;
- (BOOL)isRejected;
- (BOOL)isReserved;
- (BOOL)isShareAcceptationFault;
- (BOOL)isShareableItem;
- (BOOL)isShared;
- (BOOL)isSharedByMe;
- (BOOL)isSharedToMe;
- (BOOL)isSharedToMeChildItem;
- (BOOL)isSharedToMeTopLevelItem;
- (BOOL)isSymLink;
- (BOOL)isTopLevelSharedItem;
- (BOOL)isUserVisible;
- (BOOL)isZoneRoot;
- (BOOL)learnStagedInfoFromDownloadStageID:(id)a3 error:(id *)a4;
- (BOOL)markLatestSyncRequestAcknowledgedInZone:(id)a3;
- (BOOL)needsInsert;
- (BOOL)needsOSUpgradeToSyncUp;
- (BOOL)needsReading;
- (BOOL)needsSyncUp;
- (BOOL)needsUpload;
- (BOOL)physicalNameNeedsRename;
- (BOOL)requiresShareAlias;
- (BOOL)saveToDB;
- (BOOL)saveToDBAndValidateLocalDiffs;
- (BOOL)saveToDBForServerEdit:(BOOL)a3 keepAliases:(BOOL)a4;
- (BOOL)shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:(BOOL)a3;
- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7;
- (BOOL)updateFromFSAtPath:(id)a3 parentGlobalID:(id)a4;
- (BOOL)updateLocationAndMetaFromFSAtPath:(id)a3 parentGlobalID:(id)a4;
- (BOOL)updateXattrInfoFromPath:(id)a3 error:(id *)a4;
- (BOOL)validateLoggingToFile:(__sFILE *)a3;
- (BRCAccountSession)session;
- (BRCAliasItem)asBRAlias;
- (BRCAppLibrary)appLibrary;
- (BRCClientZone)clientZone;
- (BRCClientZone)parentClientZone;
- (BRCDirectoryItem)asDirectory;
- (BRCDocumentItem)asDocument;
- (BRCFSRooted)asFSRoot;
- (BRCFinderBookmarkItem)asFinderBookmark;
- (BRCItemGlobalID)itemGlobalID;
- (BRCItemID)itemID;
- (BRCItemID)serverPathMatchItemID;
- (BRCLocalItem)orig;
- (BRCLocalStatInfo)st;
- (BRCPQLConnection)db;
- (BRCServerZone)serverZone;
- (BRCShareAcceptationFault)asShareAcceptationFault;
- (BRCSharedToMeTopLevel)asSharedToMeTopLevelItem;
- (BRCSymlinkItem)asSymlink;
- (BRCTopLevelShareable)asShareableItem;
- (BRCUserRowID)ownerKey;
- (BRFileObjectID)fileObjectID;
- (BRFileObjectID)parentFileObjectID;
- (NSDictionary)extendedAttributes;
- (NSError)syncUpError;
- (NSMutableSet)setOfAppLibraryIDsWithReverseAliases;
- (NSNumber)fileID;
- (NSNumber)parentFileID;
- (NSString)appLibraryID;
- (NSString)bookmarkData;
- (NSString)collaborationIdentifierIfComputable;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)digestDescription;
- (NSString)extension;
- (NSString)logicalName;
- (NSString)path;
- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6;
- (id)_initWithLocalItem:(id)a3;
- (id)_initWithRelativePath:(id)a3 parentGlobalID:(id)a4;
- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4;
- (id)_syncZoneRowIDs;
- (id)baseSideCarRecord;
- (id)baseStructureRecord;
- (id)computedDestinationFilenameFromServerItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithContext:(id)a3;
- (id)fetchParentFileIDs;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6;
- (id)itemParentGlobalID;
- (id)jobsDescription;
- (id)matchingJobsWhereSQLClause;
- (id)osNameNeededToSyncUp;
- (id)parentItemIDInZone;
- (id)parentItemOnFS;
- (id)setOfParentIDs;
- (id)sharedAliasItemID;
- (id)sideCarInfo;
- (id)sideCarRecordID;
- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 shouldPCSChainStatus:(unsigned __int8)a4 inZone:(id)a5;
- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 stageID:(id)a4 shouldPCSChainStatus:(unsigned __int8)a5 saltGetter:(id)a6 childBasehashSaltGetter:(id)a7;
- (id)structureRecordID;
- (id)structureRecordIDInZone:(id)a3;
- (id)unsaltedBookmarkData;
- (unint64_t)dbRowID;
- (unint64_t)diffAgainstLocalItem:(id)a3;
- (unint64_t)diffAgainstOriginalItem;
- (unint64_t)diffAgainstServerAliasItem:(id)a3;
- (unint64_t)diffAgainstServerItem:(id)a3;
- (unint64_t)localDiffs;
- (unint64_t)maskForDiffsToSyncUpForZone:(id)a3 sideCarZone:(BOOL)a4 whenClearing:(BOOL)a5;
- (unint64_t)metadataSyncUpMask:(BOOL)a3;
- (unint64_t)notifsRank;
- (unint64_t)sharingOptions;
- (unsigned)itemScope;
- (unsigned)syncUpState;
- (unsigned)uploadStatus;
- (void)_ascendItemHierarchyWithBlock:(id)a3;
- (void)_cheapCheckSavingItem;
- (void)_fixSpotlightAttributeIfNecessaryAtPath:(id)a3;
- (void)_learnItemID:(id)a3 serverItem:(id)a4;
- (void)_markAsDeadTombstoneWithPreviousGlobalID:(id)a3;
- (void)_markLostWhenReplacedByItem:(id)a3 backoffMode:(unsigned __int8)a4;
- (void)_markNeedsSyncingUp;
- (void)_refreshAppLibraryFromParent;
- (void)_restorePreviousGlobalID:(id)a3;
- (void)_sendNotificationIfNeededWithDiffs:(unint64_t)a3 regather:(BOOL)a4;
- (void)_setOrRemoveSmartFolderSpotlightAttributeAt:(id)a3;
- (void)_updateAppLibraryPristineStatesAfterCreationOrUpdate;
- (void)_updateAppLibraryPristineStatesAfterMarkingDead;
- (void)_updatePropagatedInfoFromFSAtPath:(id)a3;
- (void)_updateSharedZoneBoostingWithDiffs:(unint64_t)a3;
- (void)_updateSyncUpSchedulerWithDiffs:(unint64_t)a3;
- (void)applyMetadataOnFileID:(unint64_t)a3 liveFD:(unint64_t)a4 sharingOptions:(unint64_t)a5;
- (void)asBRAlias;
- (void)asDirectory;
- (void)asDocument;
- (void)asFSRoot;
- (void)asFinderBookmark;
- (void)asShareAcceptationFault;
- (void)asShareableItem;
- (void)asSharedToMeTopLevelItem;
- (void)asSymlink;
- (void)beginBounceAndSaveToDBWithBounceNumber:(unint64_t)a3;
- (void)bouncePhysicalNameToRepresentableName;
- (void)bounceReservedItemWithBounceNumber:(unint64_t)a3;
- (void)bounceSourceItemWithServerLogicalName:(id)a3 bounceNumber:(unint64_t)a4;
- (void)clearFromStage;
- (void)createSyncUpJob;
- (void)fileObjectID;
- (void)fixupStagedItemAtStartup;
- (void)forceNeedsSyncUpWithoutDiffs;
- (void)handleUnknownItemError;
- (void)inheritOSUpgradeNeededFromItem:(id)a3;
- (void)insertTombstoneAliasRecordInZone:(id)a3;
- (void)isReadAndUploaded;
- (void)learnItemID:(id)a3 serverItem:(id)a4 path:(id)a5 markLost:(BOOL)a6;
- (void)markBounceFailed;
- (void)markBounceFinished;
- (void)markDead;
- (void)markForceNeedsSyncUp;
- (void)markForceNotify;
- (void)markForceRejected;
- (void)markFound;
- (void)markItemForgottenByServer;
- (void)markLatestSyncRequestFailedInZone:(id)a3;
- (void)markLatestSyncRequestRejectedInZone:(id)a3;
- (void)markLiveFromStageWithPath:(id)a3;
- (void)markLostClearGenerationID:(BOOL)a3 backoffMode:(unsigned __int8)a4;
- (void)markLostWhenReplacedByItem:(id)a3;
- (void)markLostWithoutBackoff;
- (void)markMetadataLive;
- (void)markNeedsDeleteForItemIDTransfer;
- (void)markNeedsDeleteForRescheduleOfItem:(id)a3;
- (void)markNeedsDeleteWhenAlreadyDeadInServerTruth;
- (void)markNeedsOSUpgradeToSyncUpWithName:(id)a3;
- (void)markNeedsUploadOrSyncingUp;
- (void)markRejectedItemRemotelyRevived;
- (void)markRemovedFromFilesystemForServerEdit:(BOOL)a3;
- (void)markRenamedUsingServerItem:(id)a3 toRelpath:(id)a4 logicalName:(id)a5 filename:(id)a6 origLogicalNameBeforeBounce:(id)a7 forContentApplyOnly:(BOOL)a8;
- (void)markReserved;
- (void)markStagedWithFileID:(unint64_t)a3 generationID:(unsigned int)a4;
- (void)markStagedWithFileID:(unint64_t)a3 generationID:(unsigned int)a4 documentID:(unsigned int)a5;
- (void)moveAsideLocally;
- (void)parentItemIDInZone;
- (void)parentItemOnFS;
- (void)prepareForSyncUpInZone:(id)a3;
- (void)prepareForSyncUpSideCarZone;
- (void)resetWhileKeepingClientItemsAndWantsUnlink:(BOOL)a3;
- (void)scanParentDirectory;
- (void)scheduleSyncDownForOOBModifyRecordsAck;
- (void)serializeStructuralPluginHints:(id)a3;
- (void)setAppLibrary:(id)a3;
- (void)setSharingOptions:(unint64_t)a3;
- (void)sideCarInfo;
- (void)triggerNotificationIfNeeded;
- (void)updateFromFSAtPath:(id)a3;
- (void)updateItemMetadataFromServerItem:(id)a3 appliedSharingPermission:(BOOL)a4;
- (void)updateParentZoneRowID:(id)a3;
- (void)updateStatMetadataFromServerItem:(id)a3;
- (void)updateStructuralCKInfoFromServerItem:(id)a3;
- (void)wasMarkedDead;
@end

@implementation BRCLocalItem

- (NSString)bookmarkData
{
  v3 = NSString;
  v4 = [(BRCItemID *)self->_itemID itemIDString];
  v5 = [v3 bookmarkDataWithItemResolutionString:v4 serverZone:self->_serverZone];

  return (NSString *)v5;
}

- (NSMutableSet)setOfAppLibraryIDsWithReverseAliases
{
  return 0;
}

- (BOOL)isReserved
{
  return [(BRCStatInfo *)self->_st state] == -2;
}

- (BOOL)isFault
{
  return 0;
}

- (BOOL)physicalNameNeedsRename
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(BRCLocalItem *)self isDirectoryWithPackageName])
  {
    v3 = [(BRCStatInfo *)self->_st representableName];
    v4 = [(BRCLocalStatInfo *)self->_st physicalName];
    char v5 = [v3 isEqualToString:v4];

    if (v5) {
      return 0;
    }
  }
  if ([(BRCLocalItem *)self isFault]) {
    return 0;
  }
  v6 = [(BRCLocalStatInfo *)self->_st physicalName];

  if (!v6) {
    return 0;
  }
  uint64_t v16 = 0;
  v7 = [(BRCLocalStatInfo *)self->_st physicalName];
  v8 = objc_msgSend(v7, "br_stringByDeletingPathBounceNo:", &v16);

  v9 = [(BRCLocalStatInfo *)self->_st logicalName];
  v10 = objc_msgSend(v9, "br_stringByDeletingPathBounceNo:", &v16);

  char v11 = [v8 isEqualToString:v10];
  if ((v11 & 1) == 0)
  {
    v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v18 = v8;
      __int16 v19 = 2112;
      v20 = v10;
      __int16 v21 = 2112;
      v22 = v12;
      _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Needs rename because local name %@ differs from real name %@%@", buf, 0x20u);
    }
  }
  char v14 = v11 ^ 1;

  return v14;
}

- (BOOL)updateXattrInfoFromPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(BRCServerZone *)self->_serverZone mangledID];
  v8 = +[BRCUserDefaults defaultsForMangledID:v7];
  uint64_t v9 = [v8 maxXattrBlobSize];

  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  if (v9)
  {
    v10 = [(BRCAccountSession *)self->_session stageRegistry];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke;
    v14[3] = &unk_1E6993E08;
    uint64_t v16 = &v18;
    uint64_t v17 = v9;
    v14[4] = self;
    id v11 = v10;
    id v15 = v11;
    char v12 = [v6 performOnOpenFileDescriptor:v14 error:0];
    if (a4) {
      *a4 = (id) v19[5];
    }
  }
  else
  {
    char v12 = 1;
  }
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v68 = 0;
  id v69 = 0;
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = a1 + 48;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  BOOL v7 = +[BRFieldXattrBlob loadXattrsFromFD:a2 structuralBlob:&v69 contentBlob:&v68 localBlob:0 withMaximumSize:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    v8 = [*(id *)(a1 + 32) st];
    if (v8)
    {
      if (![v69 length])
      {
        id v15 = v8[10];
        v8[10] = 0;

        id v11 = v8[11];
        v8[11] = 0;
LABEL_11:

        if ([*(id *)(a1 + 32) isDocument])
        {
          uint64_t v16 = [*(id *)(a1 + 32) asDocument];
          uint64_t v17 = [v16 currentVersion];
          if (v17)
          {
            if ([v68 length])
            {
              uint64_t v18 = objc_msgSend(v68, "brc_signature");
              id v19 = v17[8];
              v17[8] = (id)v18;

              objc_storeStrong(v17 + 9, v68);
              [*(id *)(a1 + 40) saveXattrBlob:v68 forSignature:v17[8] error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
              brc_bread_crumbs();
              id v20 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v21 = brc_default_log();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                v63 = objc_msgSend(v17[8], "brc_hexadecimalString");
                uint64_t v64 = *(void *)(*(void *)(*(void *)v5 + 8) + 40);
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v63;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v64;
                __int16 v71 = 2112;
                id v72 = v20;
                _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] content xattr signature: %@ error:%@%@", buf, 0x20u);
              }
            }
            else
            {
              id v22 = v17[8];
              v17[8] = 0;

              id v20 = v17[9];
              v17[9] = 0;
            }
          }
          else
          {
            brc_bread_crumbs();
            id v20 = (id)objc_claimAutoreleasedReturnValue();
            v65 = brc_default_log();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT)) {
              __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke_cold_1();
            }
          }
        }
        id v23 = [*(id *)(a1 + 32) clientZone];
        int v24 = [v23 isPrivateZone];

        if (!v24) {
          goto LABEL_37;
        }
        v25 = brc_string_from_xattr(a2, "com.apple.trash.put-back.path#PS");
        v26 = [*(id *)(a1 + 32) st];
        [v26 setTrashPutBackPath:v25];

        v27 = brc_string_from_xattr(a2, "com.apple.trash.put-back.icloud-parent-id#PS");
        v28 = [v27 pathComponents];
        v29 = [*(id *)(a1 + 32) parentClientZone];
        int v30 = [v29 isPrivateZone];

        v31 = [*(id *)(a1 + 32) parentClientZone];
        v32 = v31;
        if (v30)
        {
          v33 = [v31 asPrivateClientZone];
          uint64_t v34 = [v33 defaultAppLibrary];

          uint64_t v35 = 0;
        }
        else
        {
          uint64_t v35 = [v31 asSharedClientZone];
          uint64_t v34 = 0;
        }

        if ((unint64_t)[v28 count] < 2)
        {
          if ([v28 count] != 1) {
            goto LABEL_33;
          }
          uint64_t v43 = [v28 objectAtIndexedSubscript:0];
          v38 = v27;
        }
        else
        {
          id v36 = objc_alloc(MEMORY[0x1E4F594E8]);
          v37 = [v28 objectAtIndexedSubscript:0];
          v38 = (void *)[v36 initWithMangledString:v37];

          if (v38)
          {
            int v39 = [v38 isShared];
            v40 = *(void **)(*(void *)(a1 + 32) + 8);
            if (v39)
            {
              uint64_t v41 = [v40 sharedClientZoneByMangledID:v38];
              v42 = (void *)v35;
              uint64_t v35 = v41;
            }
            else
            {
              uint64_t v44 = [v40 appLibraryByMangledID:v38];
              v42 = (void *)v34;
              uint64_t v34 = v44;
            }
          }
          uint64_t v43 = [v28 objectAtIndexedSubscript:1];
        }
        v27 = (void *)v43;
LABEL_33:
        if (v27 && v34 | v35)
        {
          v45 = [BRCItemID alloc];
          v66 = [(id)v34 dbRowID];
          v46 = [(id)v35 dbRowID];
          v47 = [(BRCItemID *)v45 initWithString:v27 libraryRowID:v66 sharedZoneRowID:v46];
          [*(id *)(a1 + 32) st];
          uint64_t v48 = v35;
          v50 = uint64_t v49 = v34;
          [v50 setTrashPutBackParentID:v47];

          uint64_t v34 = v49;
          uint64_t v35 = v48;
        }
LABEL_37:
        if (([*(id *)(a1 + 32) isFault] & 1) == 0)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          MEMORY[0x1D9437640](a2, 0, buf);
          uint64_t v51 = *(void *)buf;
          v52 = [*(id *)(a1 + 32) st];
          [v52 setLastUsedTime:v51];
        }
        v53 = [*(id *)(a1 + 32) st];
        uint64_t v54 = [v53 lastUsedTime];

        if (!v54)
        {
          v55 = brc_string_from_xattr(a2, "com.apple.last-used.time#PS");
          uint64_t v56 = [v55 longLongValue];
          v57 = [*(id *)(a1 + 32) st];
          [v57 setLastUsedTime:v56];
        }
        v13 = brc_string_from_xattr(a2, "com.apple.favorite-rank.number#PS");
        uint64_t v58 = [v13 longLongValue];
        v59 = [*(id *)(a1 + 32) st];
        [v59 setFavoriteRank:v58];

        uint64_t v14 = 0;
        goto LABEL_42;
      }
      uint64_t v9 = objc_msgSend(v69, "brc_signature");
      id v10 = v8[10];
      v8[10] = (id)v9;

      objc_storeStrong(v8 + 11, v69);
      [*(id *)(a1 + 40) saveXattrBlob:v69 forSignature:v8[10] error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
      brc_bread_crumbs();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      char v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v61 = objc_msgSend(v8[10], "brc_hexadecimalString");
        uint64_t v62 = *(void *)(*(void *)(*(void *)v5 + 8) + 40);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v61;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v62;
        __int16 v71 = 2112;
        id v72 = v11;
        _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] structural xattr signature: %@ error:%@%@", buf, 0x20u);
      }
    }
    else
    {
      brc_bread_crumbs();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      char v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke_cold_2();
      }
    }

    goto LABEL_11;
  }
  brc_bread_crumbs();
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  v13 = brc_default_log();
  if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
    __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke_cold_3();
  }
  uint64_t v14 = 0xFFFFFFFFLL;
LABEL_42:

  return v14;
}

- (BOOL)_isReadonlyShareChild
{
  return ([(BRCLocalItem *)self sharingOptions] & 0x24) == 32;
}

- (void)_fixSpotlightAttributeIfNecessaryAtPath:(id)a3
{
  id v7 = a3;
  unint64_t sharingOptions = self->_sharingOptions;
  if (sharingOptions != [(BRCLocalItem *)self->_orig sharingOptions]
    && [(BRCLocalItem *)self isOnDisk])
  {
    uint64_t v5 = (uint64_t)v7;
    if (v7)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = +[BRCItemToPathLookup lookupForItem:self];
      uint64_t v5 = [v6 byFileSystemID];
    }
    id v7 = (id)v5;
    [(BRCLocalItem *)self setOrRemoveSpotlightAttributeAt:v5];
    [v6 closePaths];
  }
}

- (BOOL)_checkZoneUpdateFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_6;
  }
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    session = self->_session;
    uint64_t v9 = [v7 zoneRowID];
    id v10 = [(BRCAccountSession *)session serverZoneByRowID:v9];
    char v11 = [v10 isPrivateZone];

    if (v11) {
      goto LABEL_6;
    }
  }
  parentZoneRowID = self->_parentZoneRowID;
  v13 = [v7 zoneRowID];
  if ([(BRCZoneRowID *)parentZoneRowID br_isEqualToNumber:v13])
  {

LABEL_6:
    BOOL v14 = 1;
    goto LABEL_7;
  }
  if ([(BRCLocalItem *)self isDocumentBeingCopiedToNewZone])
  {
    uint64_t v16 = [(BRCLocalItem *)self asDocument];
    uint64_t v17 = [v16 currentVersion];
    uint64_t v18 = [v17 previousItemGlobalID];
    id v19 = [v18 zoneRowID];
    id v20 = [v7 zoneRowID];
    char v21 = objc_msgSend(v19, "br_isEqualToNumber:", v20);

    if (v21) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v22 = brc_bread_crumbs();
  id v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    int v24 = 138412802;
    v25 = self;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    v29 = v22;
    _os_log_fault_impl(&dword_1D353B000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: You can't cross move %@ to %@%@", (uint8_t *)&v24, 0x20u);
  }

  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)_checkForSharedToMeItemInTrashWithPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem]
    && [v4 itemScope] == 3)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Deleting shared to me top level item in the trash%@", buf, 0xCu);
    }

    id v7 = [(BRCAccountSession *)self->_session fileUnlinker];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __72__BRCLocalItem_LegacyAdditions___checkForSharedToMeItemInTrashWithPath___block_invoke;
    BOOL v14 = &unk_1E6993E30;
    id v15 = v7;
    id v16 = v4;
    id v8 = v7;
    [v16 performOnOpenParentFileDescriptor:&v11 error:0];
    -[BRCLocalItem markRemovedFromFilesystemForServerEdit:](self, "markRemovedFromFilesystemForServerEdit:", 0, v11, v12, v13, v14);

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __72__BRCLocalItem_LegacyAdditions___checkForSharedToMeItemInTrashWithPath___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) filename];
  [v3 renameAndUnlinkInBackgroundItemAt:a2 path:v4];

  return 0;
}

- (BOOL)updateLocationAndMetaFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(BRCLocalItem *)self _checkZoneUpdateFromFSAtPath:v6 parentGlobalID:v7])
  {
    BOOL v8 = 0;
    goto LABEL_46;
  }
  if (![(BRCLocalItem *)self _checkForSharedToMeItemInTrashWithPath:v6])
  {
    if (!v7) {
      goto LABEL_10;
    }
    BOOL v9 = [v7 zoneRowID];
    id v10 = [(BRCClientZone *)self->_clientZone dbRowID];
    if ((objc_msgSend(v9, "br_isEqualToNumber:", v10) & 1) == 0)
    {
      uint64_t v11 = [v7 zoneRowID];
      if (!objc_msgSend(v11, "br_isEqualToNumber:", self->_parentZoneRowID))
      {
        BOOL v48 = [(BRCLocalItem *)self isSharedToMeTopLevelItem];

        if (!v48)
        {
          brc_bread_crumbs();
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v49 = brc_default_log();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
            -[BRCLocalItem(LegacyAdditions) updateLocationAndMetaFromFSAtPath:parentGlobalID:]();
          }

          BOOL v8 = 0;
          goto LABEL_45;
        }
LABEL_10:
        if ([(BRCLocalItem *)self isFault]
          && ([v6 isFault] & 1) == 0
          && ([(BRCLocalItem *)self fileID],
              uint64_t v12 = objc_claimAutoreleasedReturnValue(),
              uint64_t v13 = [v12 unsignedLongLongValue],
              uint64_t v14 = [v6 fileID],
              v12,
              v13 == v14))
        {
          id v15 = brc_bread_crumbs();
          id v16 = brc_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            v55 = self;
            __int16 v56 = 2112;
            id v57 = v6;
            __int16 v58 = 2112;
            v59 = v15;
            _os_log_fault_impl(&dword_1D353B000, v16, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Found a fault that was renamed to a file\n%@\n%@%@", buf, 0x20u);
          }

          BRCUnlinkFileID([v6 deviceID], objc_msgSend(v6, "fileID"));
          id v17 = [(BRCClientZone *)self->_clientZone serverItemByItemID:self->_itemID];
          [(BRCLocalItem *)self markNeedsDeleteForRescheduleOfItem:v17];
        }
        else
        {
          st = self->_st;
          itemID = self->_itemID;
          if ([(BRCLocalItem *)self isFault]) {
            BOOL v20 = [(BRCLocalItem *)self isPackage];
          }
          else {
            BOOL v20 = 0;
          }
          [(BRCLocalStatInfo *)st updateLocationAndMetaFromFSAtPath:v6 itemID:itemID parentGlobalID:v7 isPackageFault:v20 readonlyShareChild:[(BRCLocalItem *)self _isReadonlyShareChild]];
          objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "parentFileID"));
          char v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          parentFileID = self->_parentFileID;
          self->_parentFileID = v21;

          BOOL v23 = [(BRCLocalItem *)self isSharedToMeTopLevelItem];
          if (v7 && v23)
          {
            int v24 = [(BRCLocalItem *)self asSharedToMeTopLevelItem];
            v25 = [v7 zoneRowID];
            [v24 updateParentZoneRowID:v25];
          }
          [(BRCLocalItem *)self _updatePropagatedInfoFromFSAtPath:v6];
          if ([v6 exists])
          {
            id v53 = 0;
            BOOL v26 = [(BRCLocalItem *)self updateXattrInfoFromPath:v6 error:&v53];
            id v17 = v53;
            if (!v26)
            {
              id v27 = brc_bread_crumbs();
              __int16 v28 = brc_default_log();
              if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
                -[BRCLocalItem(LegacyAdditions) updateLocationAndMetaFromFSAtPath:parentGlobalID:]();
              }
            }
          }
          else
          {
            id v17 = 0;
          }
          if ([(BRCLocalItem *)self isSharedToMe] && [(BRCLocalItem *)self isDocument])
          {
            v29 = [(BRCLocalItem *)self asDocument];
            uint64_t v30 = [v29 currentVersion];
            [v30 setQuarantineInfo:0];
          }
          unint64_t v31 = [(BRCLocalItem *)self diffAgainstOriginalItem];
          v32 = [(BRCAppLibrary *)self->_appLibrary mangledID];
          v33 = +[BRCUserDefaults defaultsForMangledID:v32];

          if (([v33 fieldsToMoveOutOfTrashMask] & v31) != 0
            && ![(BRCLocalItem *)self isInTrashScope])
          {
            uint64_t v34 = [(BRCClientZone *)self->_clientZone serverItemByItemID:self->_itemID];
            uint64_t v35 = [v34 parentItemIDOnFS];
            if (v35)
            {
              id v36 = [(BRCStatInfo *)self->_st parentID];
              char v37 = [v36 isEqualToItemID:v35];

              if ((v37 & 1) == 0)
              {
                id v51 = v17;
                v38 = [v34 parentZoneOnFS];
                int v39 = [v38 clientZone];
                v40 = [v39 itemByItemID:v35];

                v52 = v40;
                if ([v40 isInTrashScope])
                {
                  uint64_t v41 = brc_bread_crumbs();
                  v42 = brc_default_log();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v55 = self;
                    __int16 v56 = 2112;
                    id v57 = v41;
                    _os_log_impl(&dword_1D353B000, v42, OS_LOG_TYPE_DEFAULT, "[WARNING] Mtime changed when trying to trash an item. Forcing sync up of parentID for %@%@", buf, 0x16u);
                  }

                  self->_localDiffs |= 0x7FFFuLL;
                  uint64_t v43 = [v34 st];
                  uint64_t v44 = [v43 ckInfo];
                  [(BRCStatInfo *)self->_st setCkInfo:v44];
                }
                id v17 = v51;
              }
            }
          }
          v45 = brc_bread_crumbs();
          v46 = brc_default_log();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            v50 = BRCItemFieldsPrettyPrint();
            *(_DWORD *)buf = 138412802;
            v55 = self;
            __int16 v56 = 2112;
            id v57 = v50;
            __int16 v58 = 2112;
            v59 = v45;
            _os_log_debug_impl(&dword_1D353B000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] updated item location: %@\ndiffs:(%@)%@", buf, 0x20u);
          }
        }
        BOOL v8 = 1;
LABEL_45:

        goto LABEL_46;
      }
    }
    goto LABEL_10;
  }
  BOOL v8 = 1;
LABEL_46:

  return v8;
}

- (void)learnItemID:(id)a3 serverItem:(id)a4 path:(id)a5 markLost:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  [(BRCLocalItem *)self _learnItemID:v10 serverItem:a4];
  if (v6) {
    [(BRCLocalItem *)self markLostClearGenerationID:0 backoffMode:0];
  }
  [(BRCLocalItem *)self _fixSpotlightAttributeIfNecessaryAtPath:v11];
  uint64_t v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v10;
    __int16 v16 = 2112;
    id v17 = self;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] learned itemID %@ for %@%@", (uint8_t *)&v14, 0x20u);
  }
}

- (BOOL)updateFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(BRCLocalItem *)self _checkZoneUpdateFromFSAtPath:v6 parentGlobalID:v7];
  if (v8
    && ![(BRCLocalItem *)self _checkForSharedToMeItemInTrashWithPath:v6])
  {
    st = self->_st;
    itemID = self->_itemID;
    if ([(BRCLocalItem *)self isFault]) {
      BOOL v11 = [(BRCLocalItem *)self isPackage];
    }
    else {
      BOOL v11 = 0;
    }
    [(BRCLocalStatInfo *)st updateFromFSAtPath:v6 itemID:itemID parentGlobalID:v7 isPackageFault:v11 readonlyShareChild:[(BRCLocalItem *)self _isReadonlyShareChild]];
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "parentFileID"));
    uint64_t v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    parentFileID = self->_parentFileID;
    self->_parentFileID = v12;

    BOOL v14 = [(BRCLocalItem *)self isSharedToMeTopLevelItem];
    if (v7 && v14)
    {
      id v15 = [(BRCLocalItem *)self asSharedToMeTopLevelItem];
      __int16 v16 = [v7 zoneRowID];
      [v15 updateParentZoneRowID:v16];
    }
    [(BRCLocalItem *)self _updatePropagatedInfoFromFSAtPath:v6];
    if ([v6 exists])
    {
      id v24 = 0;
      BOOL v17 = [(BRCLocalItem *)self updateXattrInfoFromPath:v6 error:&v24];
      id v18 = v24;
      if (!v17)
      {
        uint64_t v19 = brc_bread_crumbs();
        uint64_t v20 = brc_default_log();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
          -[BRCLocalItem(LegacyAdditions) updateFromFSAtPath:parentGlobalID:]();
        }
      }
    }
    else
    {
      id v18 = 0;
    }
    char v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(LegacyAdditions) updateFromFSAtPath:parentGlobalID:]();
    }
  }
  return v8;
}

+ (id)newItemWithPath:(id)a3 parentGlobalID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 type] - 5 > 1)
  {
    BOOL v8 = brc_bread_crumbs();
    BOOL v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[BRCLocalItem(LegacyAdditions) newItemWithPath:parentGlobalID:]();
    }

    id v10 = 0;
  }
  else
  {
    if ([v5 isSymLink])
    {
      id v7 = BRCSymlinkItem;
    }
    else if ([v5 isBRAlias])
    {
      id v7 = BRCAliasItem;
    }
    else if ([v5 isFinderAlias])
    {
      id v7 = BRCFinderBookmarkItem;
    }
    else if ([v5 isDocument])
    {
      id v7 = BRCDocumentItem;
    }
    else
    {
      id v7 = BRCDirectoryItem;
    }
    id v10 = (void *)[[v7 alloc] _initWithRelativePath:v5 parentGlobalID:v6];
  }

  return v10;
}

- (id)_initWithRelativePath:(id)a3 parentGlobalID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v68.receiver = self;
  v68.super_class = (Class)BRCLocalItem;
  BOOL v8 = [(BRCLocalItem *)&v68 init];
  if (!v8) {
    goto LABEL_36;
  }
  BOOL v9 = [v6 appLibrary];
  uint64_t v10 = [v9 db];
  db = v8->_db;
  v8->_db = (BRCPQLConnection *)v10;

  uint64_t v12 = [v6 appLibrary];
  appLibrary = v8->_appLibrary;
  v8->_appLibrary = (BRCAppLibrary *)v12;

  v65 = [v6 sharedItemBookmark];
  id v67 = 0;
  if (([(BRCAppLibrary *)v8->_appLibrary state] & 0x800) == 0
    || ([v6 session],
        BOOL v14 = objc_claimAutoreleasedReturnValue(),
        p_itemID = &v8->_itemID,
        char v16 = [v65 parseBookmarkDataWithAccountSession:v14 docID:0 itemID:&v8->_itemID mangledID:&v67 unsaltedBookmarkData:0 error:0], v14, (v16 & 1) == 0))
  {
    v33 = objc_alloc_init(BRCItemID);
    itemID = v8->_itemID;
    v8->_itemID = v33;

    uint64_t v35 = +[BRCPathToItemLookup lookupForRelativePath:v6];
    uint64_t v36 = [v35 clientZone];
    clientZone = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v36;

    v38 = [(BRCLocalItem *)v8 appLibrary];
    __int16 v39 = [v38 state];

    if ((v39 & 0x800) != 0) {
      v8->_localDiffs |= 0x8000000000000000;
    }
LABEL_24:
    v8->_serverZone = (BRCServerZone *)[(BRCClientZone *)v8->_clientZone serverZone];
    uint64_t v48 = [v7 zoneRowID];
    parentZoneRowID = v8->_parentZoneRowID;
    v8->_parentZoneRowID = (BRCZoneRowID *)v48;

    if (!v8->_appLibrary)
    {
      uint64_t v62 = brc_bread_crumbs();
      v63 = brc_default_log();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem(LegacyAdditions) _initWithRelativePath:parentGlobalID:]();
      }
    }
    v8->_session = (BRCAccountSession *)(id)[v6 session];
    if ([(BRCServerZone *)v8->_serverZone isPrivateZone])
    {
      ownerKey = v8->_ownerKey;
      v8->_ownerKey = (BRCUserRowID *)&unk_1F2B26D48;
    }
    else
    {
      session = v8->_session;
      ownerKey = [(BRCServerZone *)v8->_serverZone asSharedZone];
      v52 = [ownerKey ownerName];
      uint64_t v53 = [(BRCAccountSession *)session userKeyForOwnerName:v52 db:v8->_db];
      uint64_t v54 = v8->_ownerKey;
      v8->_ownerKey = (BRCUserRowID *)v53;
    }
    v55 = [[BRCLocalStatInfo alloc] initWithRelativePath:v6 itemID:v8->_itemID parentGlobalID:v7];
    st = v8->_st;
    v8->_st = v55;

    if ([v6 exists])
    {
      id v66 = 0;
      BOOL v57 = [(BRCLocalItem *)v8 updateXattrInfoFromPath:v6 error:&v66];
      id v43 = v66;
      if (!v57)
      {
        __int16 v58 = brc_bread_crumbs();
        v59 = brc_default_log();
        if (os_log_type_enabled(v59, (os_log_type_t)0x90u)) {
          -[BRCLocalItem(LegacyAdditions) _initWithRelativePath:parentGlobalID:]();
        }

        int v42 = 0;
        BOOL v8 = 0;
        goto LABEL_35;
      }
    }
    else
    {
      id v43 = 0;
    }
    [(BRCLocalItem *)v8 _updatePropagatedInfoFromFSAtPath:v6];
    [(BRCLocalItem *)v8 setOrRemoveSpotlightAttributeAt:v6];
    int v42 = 1;
    goto LABEL_35;
  }
  BOOL v17 = brc_bread_crumbs();
  id v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[BRCLocalItem(LegacyAdditions) _initWithRelativePath:parentGlobalID:].cold.5();
  }

  uint64_t v19 = [v6 session];
  uint64_t v20 = [v19 clientZoneByMangledID:v67];
  char v21 = v8->_clientZone;
  v8->_clientZone = (BRCClientZone *)v20;

  id v22 = v8->_clientZone;
  if (v22)
  {
    BOOL v23 = [(BRCClientZone *)v22 itemByItemID:*p_itemID];
    id v24 = v23;
    if (v23)
    {
      v8->_unint64_t sharingOptions = [v23 sharingOptions];
      if ([v24 isOnDisk])
      {
        uint64_t v64 = brc_bread_crumbs();
        v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem(LegacyAdditions) _initWithRelativePath:parentGlobalID:].cold.4();
        }

        BOOL v26 = objc_alloc_init(BRCItemID);
        id v27 = *p_itemID;
        *p_itemID = v26;

        __int16 v28 = +[BRCPathToItemLookup lookupForRelativePath:v6];
        uint64_t v29 = [v28 clientZone];
        uint64_t v30 = v8->_clientZone;
        v8->_clientZone = (BRCClientZone *)v29;

        unint64_t v31 = [(BRCLocalItem *)v8 appLibrary];
        __int16 v32 = [v31 state];

        if ((v32 & 0x800) != 0) {
          v8->_localDiffs |= 0x8000000000000000;
        }
      }
      else
      {
        v47 = [(BRCClientZone *)v8->_clientZone serverItemByItemID:*p_itemID];
        [v24 markNeedsDeleteForRescheduleOfItem:v47];

        [v24 saveToDB];
      }
    }
    else
    {
      uint64_t v44 = [(BRCClientZone *)v8->_clientZone serverItemByItemID:*p_itemID];
      v45 = v44;
      if (v44) {
        uint64_t v46 = [v44 sharingOptions];
      }
      else {
        uint64_t v46 = 68;
      }
      v8->_unint64_t sharingOptions = v46;
    }
    goto LABEL_24;
  }
  v40 = brc_bread_crumbs();
  uint64_t v41 = brc_default_log();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem(LegacyAdditions) _initWithRelativePath:parentGlobalID:]();
  }

  int v42 = 0;
  id v43 = 0;
LABEL_35:

  if (!v42)
  {
    uint64_t v60 = 0;
    goto LABEL_38;
  }
LABEL_36:
  BOOL v8 = v8;
  uint64_t v60 = v8;
LABEL_38:

  return v60;
}

- (void)scanParentDirectory
{
  v3 = [(BRCLocalItem *)self st];
  id v4 = [v3 parentID];
  int v5 = [v4 isNonDesktopRoot];

  if (v5)
  {
    id v6 = [(BRCLocalItem *)self appLibrary];
    [v6 scheduleDeepScanWithReason:@"eexist at root"];
  }
  else
  {
    id v6 = [(BRCLocalItem *)self parentItemOnFS];
    [v6 markLostClearGenerationID:1 backoffMode:1];
    [v6 saveToDB];
  }
}

- (id)fetchParentFileIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke;
  v7[3] = &unk_1E6993E58;
  id v4 = v3;
  id v8 = v4;
  BOOL v9 = self;
  [(BRCLocalItem *)self _ascendItemHierarchyWithBlock:v7];
  id v5 = v4;

  return v5;
}

uint64_t __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if ([*(id *)(a1 + 32) containsObject:v6])
    {
      id v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke_cold_2();
      }

      BOOL v9 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
        __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke_cold_1();
      }

      uint64_t v11 = 0;
      goto LABEL_14;
    }
    [*(id *)(a1 + 32) insertObject:v6 atIndex:0];
  }
  uint64_t v12 = [v5 itemID];
  int v13 = [v12 isNonDesktopRoot];

  if (v13)
  {
    BOOL v14 = *(void **)(*(void *)(a1 + 40) + 8);
    id v15 = [v5 itemID];
    char v16 = [v15 appLibraryRowID];
    BOOL v17 = [v14 appLibraryByRowID:v16];

    id v18 = [v17 fileID];
    if (v18) {
      [*(id *)(a1 + 32) insertObject:v18 atIndex:0];
    }
  }
  uint64_t v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)_contentXattrsHaveChangedAtRelativeAPath:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v5 = [(BRCServerZone *)self->_serverZone mangledID];
  id v6 = +[BRCUserDefaults defaultsForMangledID:v5];
  uint64_t v7 = [v6 maxXattrBlobSize];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__BRCLocalItem_LegacyAdditions___contentXattrsHaveChangedAtRelativeAPath___block_invoke;
  v9[3] = &unk_1E6993E80;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = v7;
  [v4 performOnOpenFileDescriptor:v9 error:0];
  LOBYTE(self) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)self;
}

uint64_t __74__BRCLocalItem_LegacyAdditions___contentXattrsHaveChangedAtRelativeAPath___block_invoke(uint64_t a1, uint64_t a2)
{
  id v19 = 0;
  if ([*(id *)(a1 + 32) isDocument]) {
    id v4 = &v19;
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  id v18 = 0;
  BOOL v6 = +[BRFieldXattrBlob loadXattrsFromFD:a2 structuralBlob:0 contentBlob:v4 localBlob:0 withMaximumSize:v5 error:&v18];
  id v7 = v18;
  if (!v6)
  {
    brc_bread_crumbs();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __74__BRCLocalItem_LegacyAdditions___contentXattrsHaveChangedAtRelativeAPath___block_invoke_cold_1();
    }
    uint64_t v16 = 0xFFFFFFFFLL;
    goto LABEL_18;
  }
  if ([*(id *)(a1 + 32) isDocument])
  {
    id v8 = [*(id *)(a1 + 32) asDocument];
    BOOL v9 = [v8 currentVersion];
    uint64_t v10 = objc_msgSend(v19, "brc_signature");
    uint64_t v11 = (void *)v9[8];
    id v12 = v10;
    id v13 = v11;
    if (v12 == v13)
    {
    }
    else
    {
      BOOL v14 = v13;
      if (v13)
      {
        char v15 = [v12 isEqual:v13];

        if (v15) {
          goto LABEL_17;
        }
      }
      else
      {
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
LABEL_17:

    uint64_t v16 = 0;
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v16 = 0;
LABEL_19:

  return v16;
}

- (BOOL)changedAtRelativePath:(id)a3 scanPackage:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(BRCLocalStatInfo *)self->_st fileID];
  uint64_t v8 = [v7 unsignedLongLongValue];

  BOOL v9 = [(BRCLocalItem *)self fromReadOnlyDB];
  BOOL v10 = v9;
  if (v4 && v9)
  {
    id v27 = brc_bread_crumbs();
    __int16 v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(LegacyAdditions) changedAtRelativePath:scanPackage:].cold.4();
    }
  }
  if ([(BRCLocalItem *)self needsReading])
  {
    uint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(LegacyAdditions) changedAtRelativePath:scanPackage:]();
    }
    goto LABEL_20;
  }
  if (!v8
    || ([(BRCLocalStatInfo *)self->_st generationID],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    uint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(LegacyAdditions) changedAtRelativePath:scanPackage:]();
    }
    goto LABEL_20;
  }
  if (([v6 exists] & 1) == 0)
  {
    uint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(LegacyAdditions) changedAtRelativePath:scanPackage:]();
    }
    goto LABEL_20;
  }
  uint64_t v14 = [v6 fileID];
  if (v8 != v14 && v10)
  {
    uint64_t v16 = [(BRCLocalStatInfo *)self->_st stagedFileID];
    uint64_t v17 = [v16 unsignedLongLongValue];
    uint64_t v18 = [v6 fileID];

    if (v17 != v18) {
      goto LABEL_14;
    }
  }
  else if (v8 != v14)
  {
LABEL_14:
    uint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v29 = 134218498;
      uint64_t v30 = (BRCLocalItem *)v8;
      __int16 v31 = 2048;
      uint64_t v32 = [v6 fileID];
      __int16 v33 = 2112;
      uint64_t v34 = v11;
      id v19 = "[DEBUG] fileID (%llu) doesn't match (%llu)%@";
LABEL_28:
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&v29, 0x20u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  id v22 = [(BRCLocalStatInfo *)self->_st generationID];
  if (objc_msgSend(v22, "isEqualToFSGenerationID:", objc_msgSend(v6, "fsGenerationID")))
  {

    goto LABEL_25;
  }
  if (!v10)
  {

    goto LABEL_34;
  }
  unsigned int v23 = [(BRCLocalStatInfo *)self->_st stagedGenerationID];
  int v24 = [v6 fsGenerationID];

  if (v23 != v24)
  {
LABEL_34:
    uint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v25 = [(BRCLocalStatInfo *)self->_st generationID];
      BOOL v26 = [v6 generationID];
      int v29 = 138412802;
      uint64_t v30 = v25;
      __int16 v31 = 2112;
      uint64_t v32 = (uint64_t)v26;
      __int16 v33 = 2112;
      uint64_t v34 = v11;
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] genID (%@) doesn't match (%@)%@", (uint8_t *)&v29, 0x20u);
    }
    goto LABEL_20;
  }
LABEL_25:
  if (![(BRCLocalItem *)self _contentXattrsHaveChangedAtRelativeAPath:v6])
  {
    BOOL v20 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 138412802;
    uint64_t v30 = self;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v6;
    __int16 v33 = 2112;
    uint64_t v34 = v11;
    id v19 = "[DEBUG] xatts signatures don't match between %@ and %@%@";
    goto LABEL_28;
  }
LABEL_20:

  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (void)updateFromFSAtPath:(id)a3
{
}

- (BOOL)evictInTask:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  memset(v32, 0, sizeof(v32));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem(LegacyAdditions) evictInTask:options:error:]", 1115, v32);
  uint64_t v8 = brc_bread_crumbs();
  BOOL v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = v32[0];
    id v27 = [(BRCLocalItem *)self appLibrary];
    __int16 v28 = [v27 logName];
    int v29 = [(BRCLocalItem *)self itemID];
    uint64_t v30 = BRCPrettyPrintBitmap();
    *(_DWORD *)buf = 134219010;
    uint64_t v34 = (const char *)v26;
    __int16 v35 = 2112;
    uint64_t v36 = v28;
    __int16 v37 = 2112;
    id v38 = v29;
    __int16 v39 = 2112;
    v40 = v30;
    __int16 v41 = 2112;
    int v42 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx request to evict client item %@:%@ with options %@%@", buf, 0x34u);
  }
  if ([(BRCLocalItem *)self isDead])
  {
    brc_bread_crumbs();
    BOOL v10 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(BRCLocalItem *)self itemID];
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = v12;
      __int16 v35 = 2112;
      uint64_t v36 = v10;
      _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring eviction request for %@ because item is dead%@", buf, 0x16u);
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = [(BRCLocalItem *)self itemID];
    char v15 = [v14 itemIDString];
    objc_msgSend(v13, "brc_errorItemNotFound:", v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    if (!v16) {
      goto LABEL_15;
    }
    uint64_t v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (!os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
      goto LABEL_14;
    }
    __int16 v31 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    uint64_t v34 = "-[BRCLocalItem(LegacyAdditions) evictInTask:options:error:]";
    __int16 v35 = 2080;
    if (!a5) {
      __int16 v31 = "(ignored by caller)";
    }
    goto LABEL_25;
  }
  id v19 = [(BRCLocalItem *)self appLibrary];
  int v20 = [v19 hasUbiquityClientsConnected];

  if (!v20)
  {
    BOOL v24 = 1;
    goto LABEL_19;
  }
  brc_bread_crumbs();
  char v21 = (char *)objc_claimAutoreleasedReturnValue();
  id v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v23 = [(BRCLocalItem *)self itemID];
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v23;
    __int16 v35 = 2112;
    uint64_t v36 = v21;
    _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring eviction request for %@ because app library is used by a ubiquity client%@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorCompatibilityIssue");
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    uint64_t v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (!os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
LABEL_14:

      goto LABEL_15;
    }
    __int16 v31 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    uint64_t v34 = "-[BRCLocalItem(LegacyAdditions) evictInTask:options:error:]";
    __int16 v35 = 2080;
    if (!a5) {
      __int16 v31 = "(ignored by caller)";
    }
LABEL_25:
    uint64_t v36 = v31;
    __int16 v37 = 2112;
    id v38 = v16;
    __int16 v39 = 2112;
    v40 = v17;
    _os_log_error_impl(&dword_1D353B000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_14;
  }
LABEL_15:
  if (a5)
  {
    id v16 = v16;
    *a5 = v16;
  }

  BOOL v24 = 0;
LABEL_19:
  __brc_leave_section(v32);

  return v24;
}

- (void)markReserved
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(BRCLocalItem *)self isFSRoot])
  {
    id v3 = brc_bread_crumbs();
    BOOL v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412546;
      id v6 = self;
      __int16 v7 = 2112;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't reserve an fsroot %@%@", (uint8_t *)&v5, 0x16u);
    }
  }
  else
  {
    [(BRCLocalStatInfo *)self->_st _markReserved];
    id v3 = brc_bread_crumbs();
    BOOL v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(LegacyAdditions) markReserved]();
    }
  }
}

- (void)fixupStagedItemAtStartup
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  memset(v45, 0, sizeof(v45));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup]", 1148, v45);
  id v3 = brc_bread_crumbs();
  BOOL v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v45[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&unsigned char buf[22] = 2112;
    *(void *)&buf[24] = v3;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx fixing up staged item %@%@", buf, 0x20u);
  }

  unsigned int v44 = 0;
  int v5 = [(BRCLocalItem *)self st];
  id v6 = [v5 fileID];
  uint64_t v7 = [v6 unsignedLongLongValue];

  uint64_t v8 = [(BRCAccountSession *)self->_session stageRegistry];
  uint64_t v9 = [(BRCLocalItem *)self st];
  BOOL v10 = [v9 stagedFileID];
  uint64_t v11 = [v10 unsignedLongLongValue];

  id v12 = [(BRCLocalItem *)self st];
  int v13 = [v12 stagedGenerationID];

  if (([v8 existsInStage:v11 generationID:&v44] & 1) == 0)
  {
    if (![v8 existsInOldVersionStageOrGraveyard:v11])
    {
      uint64_t v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup].cold.6();
      }

      if ([v8 existsInStage:v7 generationID:&v44])
      {
        memset(buf, 0, 24);
        __brc_create_section(0, (uint64_t)"-[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup]", 1190, buf);
        int v20 = brc_bread_crumbs();
        char v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup].cold.5();
        }

        id v22 = [(BRCLocalItem *)self itemID];
        [v8 moveFromStageToGraveyard:v7 forItemID:v22];

        __brc_leave_section((uint64_t *)buf);
      }
      unsigned int v23 = [[BRCRelativePath alloc] initWithFileID:v11 session:self->_session];
      int v43 = 0;
      if ([(BRCRelativePath *)v23 resolveMustExist:1 error:&v43])
      {
        BOOL v24 = [(BRCLocalItem *)self st];
        objc_msgSend(v24, "setItemScope:", -[BRCRelativePath itemScope](v23, "itemScope"));
      }
      else
      {
        BOOL v24 = brc_bread_crumbs();
        uint64_t v30 = brc_default_log();
        if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v23;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v43;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v24;
          _os_log_error_impl(&dword_1D353B000, v30, (os_log_type_t)0x90u, "[ERROR] Can't resolve path %@ %{errno}d%@", buf, 0x1Cu);
        }
      }
      [(BRCLocalItem *)self markLiveFromStageWithPath:v23];
      [(BRCLocalItem *)self markLostClearGenerationID:0 backoffMode:1];
      __int16 v31 = [(BRCAccountSession *)self->_session serverZoneByRowID:self->_parentZoneRowID];
      uint64_t v32 = [v31 clientZone];
      __int16 v33 = [(BRCLocalItem *)self st];
      uint64_t v34 = [v33 parentID];
      __int16 v35 = [(BRCLocalItem *)self st];
      uint64_t v36 = [v35 logicalName];
      __int16 v37 = [v32 itemByParentID:v34 andLogicalName:v36];

      if (v37)
      {
        id v38 = [v37 itemID];
        __int16 v39 = [(BRCLocalItem *)self itemID];
        char v40 = [v38 isEqualToItemID:v39];

        if ((v40 & 1) == 0)
        {
          __int16 v41 = brc_bread_crumbs();
          int v42 = brc_default_log();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v37;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v41;
            _os_log_impl(&dword_1D353B000, v42, OS_LOG_TYPE_DEFAULT, "[WARNING] We have a conflicting item %@ which needs to get bounced away%@", buf, 0x16u);
          }

          [v37 markLostWhenReplacedByItem:self];
          [v37 saveToDB];
        }
      }

      goto LABEL_39;
    }
    id v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup].cold.4();
    }
    goto LABEL_15;
  }
  if (v44 != v13)
  {
    if (v44 || [(BRCStatInfo *)self->_st type])
    {
      id v16 = brc_bread_crumbs();
      uint64_t v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v44;
        *(_WORD *)&unsigned char buf[22] = 2112;
        *(void *)&buf[24] = v16;
        _os_log_fault_impl(&dword_1D353B000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item %@ was edited in stage (generationID = %lu)%@", buf, 0x20u);
      }
    }
    else
    {
      id v16 = brc_bread_crumbs();
      uint64_t v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v16;
        _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Clearning staged item with zero generationID for item %@%@", buf, 0x16u);
      }
    }
LABEL_15:

    [(BRCLocalItem *)self clearFromStage];
    goto LABEL_39;
  }
  if ([(BRCLocalItem *)self isReserved])
  {
    uint64_t v14 = brc_bread_crumbs();
    char v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup]();
    }
LABEL_43:

    goto LABEL_40;
  }
  if (([v8 existsInOldVersionStageOrGraveyard:v7] & 1) == 0)
  {
    uint64_t v14 = brc_bread_crumbs();
    char v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup]();
    }
    goto LABEL_43;
  }
  v25 = brc_bread_crumbs();
  uint64_t v26 = brc_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[BRCLocalItem(LegacyAdditions) fixupStagedItemAtStartup]();
  }

  if ([(BRCLocalItem *)self isDocument])
  {
    id v27 = [(BRCLocalItem *)self st];
    __int16 v28 = [v27 documentID];
    uint64_t v29 = [v28 unsignedIntValue];

    [v8 transferDocumentID:v29 fromOldVersionStage:v7 toStage:v11];
  }
  [(BRCLocalItem *)self markReserved];
LABEL_39:
  [(BRCLocalItem *)self saveToDB];
LABEL_40:

  __brc_leave_section(v45);
}

- (void)_markLostWhenReplacedByItem:(id)a3 backoffMode:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(BRCLocalItem *)self isDead])
  {
    if (!v6
      || ([(BRCLocalItem *)self itemID],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v6 itemID],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v7 isEqualToItemID:v8],
          v8,
          v7,
          (v9 & 1) == 0))
    {
      st = self->_st;
      uint64_t v11 = [(BRCLocalItem *)self appLibrary];
      [(BRCLocalStatInfo *)st _markLostAddingBackoffWithMode:v4 appLibrary:v11];

      if (v6)
      {
        id v12 = [(BRCStatInfo *)self->_st parentID];
        int v13 = [v6 st];
        uint64_t v14 = [v13 parentID];
        int v15 = [v12 isEqualToItemID:v14];

        if (v15)
        {
          if (-[BRCLocalItem isFault](self, "isFault") && [v6 isFault])
          {
            id v16 = [(BRCLocalStatInfo *)self->_st logicalName];
            uint64_t v17 = [v6 st];
            uint64_t v18 = [v17 logicalName];
            int v19 = [v16 isEqualToString:v18];
          }
          else
          {
            int v19 = 0;
          }
          int v20 = [(BRCLocalStatInfo *)self->_st filename];
          char v21 = [v6 st];
          id v22 = [v21 filename];
          char v23 = [v20 isEqualToString:v22];

          if ((v23 & 1) != 0 || v19) {
            [(BRCLocalItem *)self moveAsideLocally];
          }
        }
        BOOL v24 = [(BRCLocalStatInfo *)self->_st fileID];
        v25 = [v6 st];
        uint64_t v26 = [v25 fileID];
        int v27 = [v24 isEqual:v26];

        if (v27)
        {
          [(BRCLocalStatInfo *)self->_st _clearFileID];
          if ([(BRCLocalItem *)self isDocument])
          {
            __int16 v28 = [(BRCLocalItem *)self asDocument];
            [v28 markNeedsReading];
          }
        }
      }
      uint64_t v29 = brc_bread_crumbs();
      uint64_t v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        [(BRCLocalItem *)self diffAgainstOriginalItem];
        __int16 v31 = BRCItemFieldsPrettyPrint();
        int v32 = 138413058;
        __int16 v33 = self;
        __int16 v34 = 1024;
        int v35 = v4;
        __int16 v36 = 2112;
        __int16 v37 = v31;
        __int16 v38 = 2112;
        __int16 v39 = v29;
        _os_log_debug_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] item marked lost: %@\nbackoff mode:%d diffs:(%@)%@", (uint8_t *)&v32, 0x26u);
      }
    }
  }
}

- (void)markFound
{
}

- (void)markLostWhenReplacedByItem:(id)a3
{
}

- (void)markLostClearGenerationID:(BOOL)a3 backoffMode:(unsigned __int8)a4
{
  BOOL v4 = a3;
  [(BRCLocalItem *)self _markLostWhenReplacedByItem:0 backoffMode:a4];
  if (v4)
  {
    st = self->_st;
    [(BRCLocalStatInfo *)st _clearGenerationID];
  }
}

- (void)markLostWithoutBackoff
{
}

- (void)markLiveFromStageWithPath:(id)a3
{
  id v4 = a3;
  if ([(BRCLocalItem *)self isFSRoot])
  {
    int v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(LegacyAdditions) markLiveFromStageWithPath:]();
    }
  }
  else
  {
    uint64_t v7 = [v4 appLibrary];

    if (v7)
    {
      uint64_t v8 = [v4 appLibrary];
      appLibrary = self->_appLibrary;
      self->_appLibrary = v8;
    }
    st = self->_st;
    if ([(BRCLocalItem *)self isDocument])
    {
      uint64_t v11 = [(BRCLocalItem *)self asDocument];
      id v12 = [v11 desiredVersion];
      -[BRCLocalStatInfo _markLiveFromStageAsFault:](st, "_markLiveFromStageAsFault:", [v12 isFault]);
    }
    else
    {
      [(BRCLocalStatInfo *)st _markLiveFromStageAsFault:0];
    }
    int v13 = [(BRCLocalItem *)self orig];
    int v14 = [v13 isReserved];

    if (v14) {
      [(BRCLocalItem *)self _updatePropagatedInfoFromFSAtPath:v4];
    }
  }
}

- (void)_setOrRemoveSmartFolderSpotlightAttributeAt:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(BRCLocalItem *)self isShared] && ([(BRCLocalItem *)self sharingOptions] & 4) != 0) {
    int v5 = ![(BRCLocalItem *)self isDocumentBeingCopiedToNewZone];
  }
  else {
    int v5 = 0;
  }
  id v6 = [v4 physicalURL];
  int v7 = BRCSetSharedSpotlightAttributeAtURL();

  if (v5 == v7) {
    goto LABEL_16;
  }
  if (v5)
  {
    if ([(BRCServerZone *)self->_serverZone isPrivateZone])
    {
      uint64_t v8 = 0;
    }
    else
    {
      int v13 = +[BRCAccountSession userIdentityForKey:self->_ownerKey db:self->_db];
      int v14 = [v13 nameComponentsAcceptUnknownUser:1];
      uint64_t v8 = objc_msgSend(v14, "br_formattedName");
    }
    int v15 = [v4 physicalURL];
    [(BRCServerZone *)self->_serverZone isPrivateZone];
    char v16 = BRCSetSharedSpotlightAttributeAtURL();

    if ((v16 & 1) == 0) {
      goto LABEL_14;
    }
  }
  else
  {
    char v9 = [v4 physicalURL];
    char v10 = BRCSetSharedSpotlightAttributeAtURL();

    if ((v10 & 1) == 0)
    {
LABEL_14:
      int v17 = *__error();
      uint64_t v18 = brc_bread_crumbs();
      int v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        if (v5) {
          BOOL v24 = "set";
        }
        else {
          BOOL v24 = "remove";
        }
        v25 = [v4 physicalURL];
        uint64_t v26 = [v25 path];
        int v27 = objc_msgSend(v26, "fp_obfuscatedPath");
        int v28 = 136315906;
        uint64_t v29 = v24;
        __int16 v30 = 2112;
        __int16 v31 = v27;
        __int16 v32 = 1024;
        LODWORD(v33[0]) = v17;
        WORD2(v33[0]) = 2112;
        *(void *)((char *)v33 + 6) = v18;
        _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] Failed to %s the spotlight attribute at %@ %{errno}d%@", (uint8_t *)&v28, 0x26u);
      }
      *__error() = v17;
      goto LABEL_16;
    }
  }
  uint64_t v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v5) {
      int v20 = "set";
    }
    else {
      int v20 = "remove";
    }
    char v21 = [v4 physicalURL];
    id v22 = [v21 path];
    char v23 = objc_msgSend(v22, "fp_obfuscatedPath");
    int v28 = 136315650;
    uint64_t v29 = v20;
    __int16 v30 = 2112;
    __int16 v31 = v23;
    __int16 v32 = 2112;
    v33[0] = v11;
    _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %s the spotlight attribute at %@%@", (uint8_t *)&v28, 0x20u);
  }
LABEL_16:
}

- (BOOL)_computedUserVisibleStatusAtPath:(id)a3
{
  id v4 = a3;
  if (![(BRCLocalItem *)self isReserved] && ![(BRCLocalItem *)self isDead])
  {
    if (![(BRCLocalItem *)self isDocument]) {
      goto LABEL_8;
    }
    int v7 = [(BRCLocalItem *)self asDocument];
    uint64_t v8 = [v7 st];
    char v9 = [v8 documentID];
    uint64_t v10 = [v9 unsignedLongLongValue];

    if (!v10)
    {
      int v20 = brc_bread_crumbs();
      char v21 = brc_default_log();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
        -[BRCLocalItem(LegacyAdditions) _computedUserVisibleStatusAtPath:]();
      }
    }
    else
    {
LABEL_8:
      if (![v4 exists] || (objc_msgSend(v4, "isHiddenFile") & 1) == 0)
      {
        uint64_t v11 = [v4 absolutePath];
        id v12 = [v11 stringByDeletingLastPathComponent];
        int v13 = [v12 lastPathComponent];

        BOOL v14 = [v4 itemScope] == 2;
        int v15 = [(BRCStatInfo *)self->_st parentID];
        uint64_t v16 = [v15 isNonDesktopRoot];
        uint64_t v17 = [v4 itemScope];
        uint64_t v18 = [(BRCLocalStatInfo *)self->_st logicalName];
        int v19 = [(BRCLocalItem *)self appLibrary];
        BOOL v5 = +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:v14 parentIsNonDesktopRoot:v16 parentScope:v17 itemFilename:v18 parentFilename:v13 appLibrary:v19];

        goto LABEL_4;
      }
    }
  }
  BOOL v5 = 0;
LABEL_4:

  return v5;
}

- (void)_updatePropagatedInfoFromFSAtPath:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 appLibrary];
  appLibrary = self->_appLibrary;
  self->_appLibrary = v5;

  if (!self->_appLibrary)
  {
    int v27 = brc_bread_crumbs();
    int v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(LegacyAdditions) _initWithRelativePath:parentGlobalID:]();
    }
  }
  -[BRCLocalStatInfo setItemScope:](self->_st, "setItemScope:", [v4 itemScope]);
  self->_isUserVisible = [(BRCLocalItem *)self _computedUserVisibleStatusAtPath:v4];
  if (![(BRCLocalItem *)self isSharedToMeTopLevelItem]
    && ![(BRCLocalItem *)self isFSRoot]
    && ![(BRCLocalItem *)self hasShareIDAndIsOwnedByMe])
  {
    int v7 = [(BRCClientZone *)self->_clientZone db];
    uint64_t v8 = [(BRCStatInfo *)self->_st parentID];
    char v9 = (void *)[v7 fetch:@"SELECT item_sharing_options FROM client_items WHERE item_id = %@ AND zone_rowid = %@", v8, self->_parentZoneRowID];

    if (![v9 next]) {
      goto LABEL_26;
    }
    int v10 = [v9 unsignedLongAtIndex:0];
    uint64_t v11 = v10 & 0x78;
    if ((self->_sharingOptions & 0x7C) == v11) {
      goto LABEL_26;
    }
    int v12 = v10;
    int v13 = brc_bread_crumbs();
    BOOL v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __int16 v31 = BRCPrettyPrintBitmap();
      BRCPrettyPrintBitmap();
      *(_DWORD *)buf = 138412802;
      int v35 = v31;
      v37 = __int16 v36 = 2112;
      uint64_t v26 = (void *)v37;
      __int16 v38 = 2112;
      __int16 v39 = v13;
      _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] learning new sharing options %@ for %@%@", buf, 0x20u);
    }
    unint64_t sharingOptions = self->_sharingOptions;
    if ((sharingOptions & 4) != 0)
    {
      uint64_t v29 = brc_bread_crumbs();
      __int16 v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem(LegacyAdditions) _updatePropagatedInfoFromFSAtPath:]();
      }

      unint64_t sharingOptions = self->_sharingOptions;
    }
    self->_unint64_t sharingOptions = sharingOptions & 0xFFFFFFFFFFFFFF83 | v11;
    if ((([(BRCLocalItem *)self->_orig sharingOptions] ^ v12) & 0x20) == 0) {
      goto LABEL_26;
    }
    uint64_t v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(LegacyAdditions) _updatePropagatedInfoFromFSAtPath:]();
    }

    unsigned __int16 v18 = +[BRCStageRegistry computeItemModeFromStatInfo:self->_st isPackage:[(BRCLocalItem *)self isPackage]];
    *(_DWORD *)buf = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __67__BRCLocalItem_LegacyAdditions___updatePropagatedInfoFromFSAtPath___block_invoke;
    uint64_t v32[3] = &unk_1E6993EA8;
    unsigned __int16 v33 = v18;
    v32[4] = self;
    if (([v4 performOnOpenFileDescriptor:v32 error:buf] & 1) == 0)
    {
      int v19 = brc_bread_crumbs();
      int v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
        -[BRCLocalItem(LegacyAdditions) _updatePropagatedInfoFromFSAtPath:]();
      }
    }
    if ([(BRCLocalItem *)self needsInsert] || (self->_sharingOptions & 0x20) != 0) {
      goto LABEL_26;
    }
    BOOL v21 = [(BRCLocalItem *)self isDocument];
    BOOL v22 = [(BRCLocalItem *)self isKnownByServer];
    if (v21)
    {
      if (v22)
      {
        char v23 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsWriter];
        BOOL v24 = [v4 physicalURL];
        v25 = [(BRCLocalItem *)self asDocument];
        [v23 applyLocalEditIfNecessaryToURL:v24 forItem:v25 serverItem:0 forDelete:0 error:0];
      }
      else
      {
        char v23 = [(BRCLocalItem *)self asDocument];
        [v23 markForceUpload];
      }
    }
    else
    {
      if (v22)
      {
LABEL_26:

        goto LABEL_27;
      }
      char v23 = [(BRCAccountSession *)self->_session syncUpScheduler];
      [v23 rescheduleSuspendedJobsMatching:self inState:52];
    }

    goto LABEL_26;
  }
LABEL_27:
}

uint64_t __67__BRCLocalItem_LegacyAdditions___updatePropagatedInfoFromFSAtPath___block_invoke(uint64_t a1, uint64_t a2)
{
  if (fchmod(a2, *(_WORD *)(a1 + 40))) {
    return *__error();
  }
  BOOL v5 = [*(id *)(a1 + 32) st];
  int v6 = [*(id *)(a1 + 32) isDocument];
  if (v6)
  {
    v2 = [*(id *)(a1 + 32) asDocument];
    int v7 = [v2 currentVersion];
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v8 = [*(id *)(a1 + 32) clientZone];
  BOOL v9 = +[BRCStageRegistry applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:](BRCStageRegistry, "applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:", a2, v5, v7, v8, [*(id *)(a1 + 32) sharingOptions]);

  if (v6)
  {
  }
  if (!v9) {
    return *__error();
  }
  else {
    return 0;
  }
}

- (void)markRenamedUsingServerItem:(id)a3 toRelpath:(id)a4 logicalName:(id)a5 filename:(id)a6 origLogicalNameBeforeBounce:(id)a7 forContentApplyOnly:(BOOL)a8
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v34 = a6;
  id v35 = a7;
  memset(v36, 0, sizeof(v36));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem(LegacyAdditions) markRenamedUsingServerItem:toRelpath:logicalName:filename:origLogicalNameBeforeBounce:forContentApplyOnly:]", 1493, v36);
  uint64_t v17 = brc_bread_crumbs();
  unsigned __int16 v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = v36[0];
    unsigned __int16 v33 = [v14 parentItemIDOnFS];
    *(_DWORD *)buf = 134219010;
    uint64_t v38 = v32;
    __int16 v39 = 2112;
    id v40 = v14;
    __int16 v41 = 2112;
    id v42 = v15;
    __int16 v43 = 2112;
    unsigned int v44 = v33;
    __int16 v45 = 2112;
    uint64_t v46 = v17;
    _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx marking renamed from server item\n  server: %@\n  relpath: %@\n  parentID: %@\n%@", buf, 0x34u);
  }
  if (!a8)
  {
    st = self->_st;
    int v20 = [v14 parentItemIDOnFS];
    [(BRCLocalStatInfo *)st _setParentID:v20];

    BOOL v21 = [v14 parentZoneOnFS];
    BOOL v22 = [v21 dbRowID];
    parentZoneRowID = self->_parentZoneRowID;
    self->_parentZoneRowID = v22;
  }
  if (v15)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "parentFileID"));
    BOOL v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    parentFileID = self->_parentFileID;
    self->_parentFileID = v24;

    [(BRCLocalItem *)self _updatePropagatedInfoFromFSAtPath:v15];
  }
  if ([(BRCStatInfo *)self->_st type] != 3)
  {
    uint64_t v26 = self->_st;
    if (v34) {
      id v27 = v34;
    }
    else {
      id v27 = v16;
    }
    if (v35) {
      id v28 = v35;
    }
    else {
      id v28 = v16;
    }
    if (v35) {
      id v29 = v16;
    }
    else {
      id v29 = 0;
    }
    __int16 v30 = [v14 st];
    __int16 v31 = [v30 logicalName];
    [(BRCLocalStatInfo *)v26 setFilename:v28 forcePhysicalName:v27 forceBouncedLogicalName:v29 serverName:v31];

    if (![(BRCLocalItem *)self isReserved] && ![(BRCLocalItem *)self isFault]) {
      [(BRCLocalItem *)self markLostClearGenerationID:0 backoffMode:0];
    }
  }
  __brc_leave_section(v36);
}

- (void)applyMetadataOnFileID:(unint64_t)a3 liveFD:(unint64_t)a4 sharingOptions:(unint64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v9 = [(BRCAccountSession *)self->_session stageRegistry];
  if (!a3)
  {
    id v28 = brc_bread_crumbs();
    id v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(LegacyAdditions) applyMetadataOnFileID:liveFD:sharingOptions:]();
    }
  }
  uint64_t v10 = BRCOpenByID([v9 deviceID], a3, 2129924);
  if ((v10 & 0x80000000) != 0)
  {
    int v18 = *__error();
    int v19 = brc_bread_crumbs();
    int v20 = brc_default_log();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 134218754;
      unint64_t v31 = a3;
      __int16 v32 = 2048;
      *(void *)unsigned __int16 v33 = a4;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = v18;
      __int16 v34 = 2112;
      id v35 = v19;
      _os_log_error_impl(&dword_1D353B000, v20, (os_log_type_t)0x90u, "[ERROR] can't open %lld to set metadata for %lld %{errno}d%@", buf, 0x26u);
    }

    BOOL v21 = 0;
    *__error() = v18;
  }
  else
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0xFFFFFFFFLL;
    if (a4
      && a4 != a3
      && ([(BRCAccountSession *)self->_session volume],
          int v13 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = BRCOpenByID([v13 deviceID], a4, 2129924),
          v13,
          (v12 & 0x80000000) != 0))
    {
      int v22 = *__error();
      char v23 = brc_bread_crumbs();
      BOOL v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 134218498;
        unint64_t v31 = a4;
        __int16 v32 = 1024;
        *(_DWORD *)unsigned __int16 v33 = v22;
        *(_WORD *)&v33[4] = 2112;
        *(void *)&v33[6] = v23;
        _os_log_error_impl(&dword_1D353B000, v24, (os_log_type_t)0x90u, "[ERROR] can't open live path %lld to set metadata %{errno}d%@", buf, 0x1Cu);
      }

      *__error() = v22;
      close(v11);
      BOOL v21 = 0;
    }
    else
    {
      if ([(BRCLocalItem *)self isDocument])
      {
        id v14 = [(BRCLocalItem *)self asDocument];
        id v15 = [v14 desiredVersion];
        id v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = [v14 currentVersion];
        }
        BOOL v21 = v17;
      }
      else
      {
        BOOL v21 = 0;
      }
      itemID = self->_itemID;
      uint64_t v26 = [(BRCLocalItem *)self clientZone];
      id v27 = [(BRCLocalItem *)self st];
      [v9 applyMetadataOnFileDescriptor:v11 liveFileDescriptor:v12 itemID:itemID clientZone:v26 statInfo:v27 version:v21 sharingOptions:a5];

      close(v11);
      if ((v12 & 0x80000000) == 0) {
        close(v12);
      }
    }
  }
}

- (void)beginBounceAndSaveToDBWithBounceNumber:(unint64_t)a3
{
  [(BRCLocalStatInfo *)self->_st _generatedBouncedLogicalFilenameWithBounceNumber:a3];
  if ([(BRCLocalItem *)self isFault])
  {
    id v4 = [(BRCLocalItem *)self asDocument];
    BOOL v5 = [v4 st];
    int v6 = [v5 logicalName];
    int v7 = NSNumber;
    uint64_t v8 = [v4 currentVersion];
    BOOL v9 = objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v8, "size"));
    objc_msgSend(v4, "stageFaultForCreation:name:size:isPackage:", 0, v6, v9, objc_msgSend(v4, "isPackage"));
  }
  [(BRCLocalItem *)self saveToDB];
  db = self->_db;
  [(BRCPQLConnection *)db flush];
}

- (void)markBounceFinished
{
  [(BRCLocalStatInfo *)self->_st _migrateTmpBouncedNameToLocalName];
  if ([(BRCLocalItem *)self isFault]) {
    [(BRCLocalStatInfo *)self->_st _markLiveFromStageAsFault:1];
  }
  [(BRCLocalItem *)self markLostClearGenerationID:0 backoffMode:0];
}

- (void)markBounceFailed
{
  [(BRCLocalStatInfo *)self->_st _clearTmpBouncedNumber];
  if ([(BRCLocalItem *)self isFault])
  {
    st = self->_st;
    [(BRCLocalStatInfo *)st _markClearedFromStage];
  }
}

- (void)bounceReservedItemWithBounceNumber:(unint64_t)a3
{
  if (![(BRCLocalItem *)self isReserved])
  {
    BOOL v5 = brc_bread_crumbs();
    int v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(LegacyAdditions) bounceReservedItemWithBounceNumber:]();
    }
  }
  [(BRCLocalStatInfo *)self->_st _generatedBouncedLogicalFilenameWithBounceNumber:a3];
  [(BRCLocalStatInfo *)self->_st _migrateTmpBouncedNameToLocalName];
}

- (void)bouncePhysicalNameToRepresentableName
{
}

- (void)bounceSourceItemWithServerLogicalName:(id)a3 bounceNumber:(unint64_t)a4
{
  id v6 = a3;
  if (!v6 || !a4)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(LegacyAdditions) bounceSourceItemWithServerLogicalName:bounceNumber:]();
    }
  }
  [(BRCStatInfo *)self->_st setLogicalName:v6];
  [(BRCLocalStatInfo *)self->_st _generatedBouncedLogicalFilenameWithBounceNumber:a4];
  [(BRCLocalStatInfo *)self->_st _migrateTmpBouncedNameToLocalName];
}

- (void)clearFromStage
{
  id v3 = [(BRCLocalStatInfo *)self->_st stagedFileID];

  if (!v3)
  {
    id v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(LegacyAdditions) clearFromStage]();
    }
  }
  id v4 = [(BRCAccountSession *)self->_session stageRegistry];
  BOOL v5 = [(BRCLocalStatInfo *)self->_st stagedFileID];
  objc_msgSend(v4, "moveFromStageToGraveyard:forItemID:", objc_msgSend(v5, "longLongValue"), self->_itemID);

  [(BRCLocalStatInfo *)self->_st _markClearedFromStage];
}

- (void)markMetadataLive
{
}

- (void)markStagedWithFileID:(unint64_t)a3 generationID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  st = self->_st;
  id v6 = [NSNumber numberWithUnsignedLongLong:a3];
  [(BRCLocalStatInfo *)st _markStagedWithFileID:v6 generationID:v4 documentID:0];
}

- (void)markStagedWithFileID:(unint64_t)a3 generationID:(unsigned int)a4 documentID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  st = self->_st;
  id v9 = [NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v8 = [NSNumber numberWithUnsignedInt:v5];
  [(BRCLocalStatInfo *)st _markStagedWithFileID:v9 generationID:v6 documentID:v8];
}

- (BOOL)learnStagedInfoFromDownloadStageID:(id)a3 error:(id *)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  session = self->_session;
  id v7 = a3;
  uint64_t v8 = [(BRCAccountSession *)session stageRegistry];
  if ([(BRCLocalItem *)self isReserved]) {
    id v9 = &v14;
  }
  else {
    id v9 = 0;
  }
  uint64_t v10 = [(BRCLocalItem *)self appLibrary];
  int v11 = [v8 rememberStagedDownloadWithID:v7 gatherFileID:&v13 generationID:(char *)&v14 + 4 documentID:v9 appLibrary:v10 error:a4];

  if (v11)
  {
    if ([(BRCLocalItem *)self isReserved]) {
      [(BRCLocalItem *)self markStagedWithFileID:v13 generationID:HIDWORD(v14) documentID:v14];
    }
    else {
      [(BRCLocalItem *)self markStagedWithFileID:v13 generationID:HIDWORD(v14)];
    }
  }
  return v11;
}

- (unint64_t)diffAgainstServerAliasItem:(id)a3
{
  id v4 = a3;
  if (![(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    id v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:]();
    }
  }
  uint64_t v5 = [(BRCLocalItem *)self st];
  uint64_t v6 = [v4 st];

  unint64_t v7 = [v5 diffAgainst:v6];
  return v7;
}

- (id)sharedAliasItemID
{
  if (![(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    unint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:]();
    }
  }
  itemID = self->_itemID;
  id v4 = [(BRCServerZone *)self->_serverZone ownerName];
  uint64_t v5 = [(BRCItemID *)itemID derivedAliasItemIDWithOwnerName:v4];

  return v5;
}

- (id)structureRecordIDInZone:(id)a3
{
  id v4 = a3;
  if (![(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    uint64_t v10 = brc_bread_crumbs();
    int v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:]();
    }
  }
  uint64_t v5 = [(BRCAccountSession *)self->_session serverAliasItemForSharedItem:self inZone:v4];
  uint64_t v6 = [v5 itemID];
  unint64_t v7 = [v5 st];
  uint64_t v8 = objc_msgSend(v6, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", objc_msgSend(v7, "type"), v4, 1);

  return v8;
}

- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 shouldPCSChainStatus:(unsigned __int8)a4 inZone:(id)a5
{
  id v6 = a5;
  if (![(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    __int16 v58 = brc_bread_crumbs();
    v59 = brc_default_log();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:]();
    }
  }
  if (![(BRCServerZone *)self->_serverZone isSharedZone])
  {
    uint64_t v60 = brc_bread_crumbs();
    v61 = brc_default_log();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:]();
    }
  }
  if (([v6 isPrivateZone] & 1) == 0)
  {
    uint64_t v62 = brc_bread_crumbs();
    v63 = brc_default_log();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:]();
    }
  }
  unint64_t v7 = [(BRCAccountSession *)self->_session serverAliasItemForSharedItem:self inZone:v6];
  uint64_t v8 = [v7 itemID];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(BRCLocalItem *)self sharedAliasItemID];
  }
  v70 = v10;

  unint64_t v11 = [(BRCLocalItem *)self diffAgainstOriginalItem];
  unint64_t localDiffs = self->_localDiffs;
  id v69 = v7;
  if (v7)
  {
    uint64_t v13 = [(BRCStatInfo *)self->_st ckInfo];

    if (v13)
    {
      int v66 = 1;
      goto LABEL_17;
    }
  }
  uint64_t v14 = [(BRCServerZone *)self->_serverZone zoneName];
  uint64_t v15 = *MEMORY[0x1E4F59418];
  char v16 = [v14 isEqualToString:*MEMORY[0x1E4F59418]];

  if (v16)
  {
    int v66 = 0;
    goto LABEL_17;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F594E8]);
  int v18 = [(BRCServerZone *)self->_serverZone ownerName];
  int v19 = (void *)[v17 initWithZoneName:v15 ownerName:v18];

  int v20 = NSString;
  BOOL v21 = [(BRCItemID *)self->_itemID itemIDString];
  int v22 = [v20 unsaltedBookmarkDataWithItemResolutionString:v21 serverZoneMangledID:v19];

  char v23 = [v6 clientZone];
  BOOL v24 = [v23 asPrivateClientZone];
  v25 = [v24 serverAliasByUnsaltedBookmarkData:v22];

  if (!v25)
  {

    int v66 = 0;
    unint64_t v7 = v69;
LABEL_17:
    unint64_t v32 = localDiffs | v11;
    uint64_t v67 = [v70 structureRecordIDForItemType:3 zone:v6 aliasTargetZoneIsShared:1];
    id v29 = (id)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"structure" recordID:v67];
    unsigned __int16 v33 = [(BRCStatInfo *)self->_st ckInfo];
    __int16 v34 = [(BRCStatInfo *)self->_st parentID];
    itemID = self->_itemID;
    serverZone = self->_serverZone;
    BYTE2(v65) = a4;
    BYTE1(v65) = v7 == 0;
    LOBYTE(v65) = [(BRCLocalItem *)self isDirectory];
    +[BRCAliasItem fillStructureRecord:inZone:itemID:ckInfo:parentID:targetItemID:targetZone:diffs:isFolderShare:beingDeadInServerTruth:shouldPCSChainStatus:](BRCAliasItem, "fillStructureRecord:inZone:itemID:ckInfo:parentID:targetItemID:targetZone:diffs:isFolderShare:beingDeadInServerTruth:shouldPCSChainStatus:", v29, v6, v70, v33, v34, itemID, serverZone, v32, v65);

    if (!v66 || (v32 & 0x800) != 0)
    {
      uint64_t v37 = [(BRCLocalItem *)self st];
      objc_msgSend(v29, "setLastUsedTime:", objc_msgSend(v37, "lastUsedTime"));
    }
    if ((v32 & 0x1000) != 0) {
      char v38 = 0;
    }
    else {
      char v38 = v66;
    }
    id v28 = v69;
    if ((v38 & 1) == 0)
    {
      __int16 v39 = [(BRCLocalItem *)self st];
      if ([v39 favoriteRank])
      {
        id v40 = NSNumber;
        __int16 v41 = [(BRCLocalItem *)self st];
        id v42 = objc_msgSend(v40, "numberWithLongLong:", objc_msgSend(v41, "favoriteRank"));
        [v29 setObject:v42 forKeyedSubscript:@"favoriteRank"];
      }
      else
      {
        [v29 setObject:0 forKeyedSubscript:@"favoriteRank"];
      }
    }
    if ((v32 & 0x40) != 0)
    {
      __int16 v43 = [(BRCLocalItem *)self appLibrary];
      if ([v43 isCloudDocsAppLibrary])
      {
        unsigned int v44 = [(BRCLocalItem *)self clientZone];
        if ([v44 isCloudDocsZone])
        {
          __int16 v45 = [(BRCLocalItem *)self parentItemIDInZone];
          uint64_t v46 = [v45 isNonDesktopRoot];

          id v28 = v69;
        }
        else
        {
          uint64_t v46 = 0;
        }
      }
      else
      {
        uint64_t v46 = 0;
      }
      BOOL v47 = v28 == 0;

      uint64_t v48 = [(BRCLocalItem *)self parentItemIDInZone];
      char v49 = [v48 isDocumentsFolder];

      v50 = [(BRCLocalItem *)self st];
      id v51 = [v50 logicalName];
      LOBYTE(v64) = v49;
      id v28 = v69;
      [v29 serializeFilename:v51 forCreation:v47 setExtension:1 inSharedAlias:1 basehashSaltIfNotShareAlias:0 parentIDIsCloudDocsRoot:v46 parentIDIsDocumentsFolder:v64];
    }
    if ((v32 & 0x200) != 0) {
      char v52 = 0;
    }
    else {
      char v52 = v66;
    }
    if ((v52 & 1) == 0)
    {
      uint64_t v53 = [(BRCLocalItem *)self st];
      uint64_t v54 = [v53 finderTags];
      [v29 serializeFinderTags:v54 forCreation:v28 == 0];
    }
    [(BRCLocalItem *)self serializeStructuralPluginHints:v29];
    v55 = [(BRCLocalItem *)self session];
    int v56 = [v29 validateEnhancedDrivePrivacyFieldsWithSession:v55 error:0];

    if (v56)
    {
      id v29 = v29;
      unint64_t v31 = v29;
    }
    else
    {
      unint64_t v31 = 0;
    }
    __int16 v30 = (void *)v67;
    goto LABEL_45;
  }
  uint64_t v26 = brc_bread_crumbs();
  id v27 = brc_default_log();
  id v28 = v69;
  if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
    -[BRCLocalItem(BRCSharedToMeTopLevel) structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:]();
  }

  id v29 = 0;
  __int16 v30 = 0;
  unint64_t v31 = 0;
LABEL_45:

  return v31;
}

- (void)insertTombstoneAliasRecordInZone:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->_session serverAliasItemForSharedItem:self inZone:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 serverZone];

    uint64_t v8 = [v7 clientZone];
    id v9 = [v6 itemID];
    id v10 = [v8 itemByItemID:v9];
    unint64_t v11 = [v10 asBRAlias];

    if ([v11 isDead])
    {
      uint64_t v12 = brc_bread_crumbs();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:]();
      }
    }
    else
    {
      if (v11)
      {
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:].cold.4();
        }
      }
      else
      {
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:]();
        }
      }

      char v16 = [(BRCLocalItem *)self db];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __72__BRCLocalItem_BRCSharedToMeTopLevel__insertTombstoneAliasRecordInZone___block_invoke;
      v17[3] = &unk_1E6993FC0;
      int v18 = v6;
      id v7 = v7;
      id v19 = v7;
      int v20 = self;
      [v16 groupInBatch:v17];

      uint64_t v12 = v18;
    }
  }
  else
  {
    unint64_t v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:]();
    }
    id v7 = v4;
  }
}

void __72__BRCLocalItem_BRCSharedToMeTopLevel__insertTombstoneAliasRecordInZone___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) newLocalItemWithServerZone:*(void *)(a1 + 40) dbRowID:0];
  id v6 = [v2 asBRAlias];

  id v3 = [*(id *)(*(void *)(a1 + 48) + 72) ckInfo];
  id v4 = [v6 st];
  [v4 setCkInfo:v3];

  uint64_t v5 = [v6 st];
  [v5 setItemScope:2];

  [v6 saveToDB];
  [v6 markDead];
  [v6 markNeedsUploadOrSyncingUpWithAliasTarget:*(void *)(a1 + 48)];
  [v6 saveToDB];
}

- (void)updateParentZoneRowID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(BRCPQLConnection *)self->_db isBatchSuspended])
  {
    if (v5) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v8 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:]();
    }
    goto LABEL_17;
  }
  uint64_t v15 = brc_bread_crumbs();
  char v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:].cold.4();
  }

  if (!v5) {
    goto LABEL_15;
  }
LABEL_3:
  if (([(BRCZoneRowID *)self->_parentZoneRowID br_isEqualToNumber:v5] & 1) == 0)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      int v20 = self;
      __int16 v21 = 2112;
      int v22 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Parent zone updated on %@, clearing ckinfo and inserting dead item%@", (uint8_t *)&v19, 0x16u);
    }

    uint64_t v8 = [(BRCAccountSession *)self->_session serverZoneByRowID:self->_parentZoneRowID];
    [(BRCLocalItem *)self insertTombstoneAliasRecordInZone:v8];
    id v9 = [(BRCAccountSession *)self->_session serverZoneByRowID:v5];
    id v10 = [v9 clientZone];

    unint64_t v11 = [(BRCAccountSession *)self->_session localAliasForSharedItem:self inZone:v10];
    uint64_t v12 = v11;
    if (v11)
    {
      if (([v11 isDead] & 1) == 0)
      {
        id v17 = brc_bread_crumbs();
        int v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:]();
        }
      }
      uint64_t v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:]();
      }

      [v12 markNeedsDeleteForRescheduleOfItem:0];
      [v12 saveToDB];
    }
    objc_storeStrong((id *)&self->_parentZoneRowID, a3);
    [(BRCStatInfo *)self->_st setCkInfo:0];

LABEL_17:
  }
}

- (BOOL)requiresShareAlias
{
  if ([(BRCStatInfo *)self->_st favoriteRank]
    || [(BRCStatInfo *)self->_st lastUsedTime]
    || ([(BRCStatInfo *)self->_st finderTags],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 length],
        v3,
        v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    session = self->_session;
    uint64_t v8 = [(BRCLocalItem *)self clientZone];
    id v9 = [v8 asSharedClientZone];
    id v10 = [(BRCLocalItem *)self st];
    unint64_t v11 = [v10 logicalName];
    uint64_t v12 = objc_msgSend(v11, "br_pathExtension");
    uint64_t v13 = [v12 lowercaseString];
    uint64_t v14 = [(BRCAccountSession *)session fallbackAppLibraryForClientZone:v9 extension:v13];

    uint64_t v15 = [(BRCStatInfo *)self->_st parentID];
    char v16 = [v14 documentsFolderItemID];
    int v5 = [v15 isEqualToItemID:v16] ^ 1;
  }
  return v5;
}

- (BRCAliasItem)asBRAlias
{
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asBRAlias]();
  }

  return 0;
}

- (BRCDirectoryItem)asDirectory
{
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asDirectory]();
  }

  return 0;
}

- (BRCDocumentItem)asDocument
{
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asDocument]();
  }

  return 0;
}

- (BOOL)isShareableItem
{
  return 0;
}

- (BRCTopLevelShareable)asShareableItem
{
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asShareableItem]();
  }

  return 0;
}

- (BRCFSRooted)asFSRoot
{
  if ([(BRCLocalItem *)self isDirectory] && [(BRCLocalItem *)self isFSRoot])
  {
    id v3 = self;
  }
  else
  {
    uint64_t v4 = brc_bread_crumbs();
    int v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem asFSRoot]();
    }

    id v3 = 0;
  }
  return (BRCFSRooted *)v3;
}

- (BRCSymlinkItem)asSymlink
{
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asSymlink]();
  }

  return 0;
}

- (BRCFinderBookmarkItem)asFinderBookmark
{
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asFinderBookmark]();
  }

  return 0;
}

- (BRCShareAcceptationFault)asShareAcceptationFault
{
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem asShareAcceptationFault]();
  }

  return 0;
}

- (NSString)path
{
  if (self->_resolvedPath)
  {
    id v3 = self->_path;
  }
  else
  {
    uint64_t v4 = [[BRCItemToPathLookup alloc] initWithItem:self];
    int v5 = [(BRCItemToPathLookup *)v4 byFileSystemID];
    id v6 = [v5 pathRelativeToRoot];
    path = self->_path;
    self->_path = v6;

    uint64_t v8 = [(NSString *)self->_path rangeOfString:@"/"];
    if (v9)
    {
      id v10 = [(NSString *)self->_path substringFromIndex:v8 + v9];
      unint64_t v11 = self->_path;
      self->_path = v10;
    }
    [(BRCItemToPathLookup *)v4 closePaths];
    self->_resolvedPath = 1;
    id v3 = self->_path;
  }
  return v3;
}

- (NSString)logicalName
{
  return (NSString *)[(BRCLocalStatInfo *)self->_st logicalName];
}

- (NSString)extension
{
  v2 = [(BRCLocalItem *)self logicalName];
  id v3 = objc_msgSend(v2, "br_pathExtension");

  return (NSString *)v3;
}

- (NSString)appLibraryID
{
  v2 = [(BRCLocalItem *)self appLibrary];
  id v3 = [v2 appLibraryID];

  return (NSString *)v3;
}

- (BOOL)needsInsert
{
  return self->_dbRowID == 0;
}

- (BOOL)isFromInitialScan
{
  if ((self->_localDiffs & 0x8000000000000000) != 0) {
    return ![(BRCLocalItem *)self isKnownByServerOrInFlight];
  }
  else {
    return 0;
  }
}

- (BOOL)checkIsInDocumentsScopeWithParent:(id)a3
{
  id v4 = a3;
  isInDocumentScope = self->_isInDocumentScope;
  if (!isInDocumentScope)
  {
    id v7 = [(BRCLocalItem *)self appLibrary];
    if ([v7 includesDataScope])
    {
      char v8 = [v4 isFSRoot];
      uint64_t v9 = (NSNumber *)MEMORY[0x1E4F1CC28];
      if (v8)
      {
        char v6 = 0;
      }
      else
      {
        uint64_t v12 = [(BRCStatInfo *)self->_st parentID];
        char v13 = [v12 isDocumentsFolder];

        uint64_t v14 = (NSNumber *)MEMORY[0x1E4F1CC38];
        if ((v13 & 1) == 0)
        {
          if (v4)
          {
            if ([v4 checkIsInDocumentsScopeWithParent:0]) {
              uint64_t v15 = v14;
            }
            else {
              uint64_t v15 = v9;
            }
            char v16 = v15;
          }
          else
          {
            id v17 = [(BRCLocalItem *)self clientZone];
            char v18 = [v17 isSharedZone];

            char v16 = (NSNumber *)MEMORY[0x1E4F1CC38];
            if ((v18 & 1) == 0)
            {
              session = self->_session;
              uint64_t v26 = [(BRCLocalItem *)self itemGlobalID];
              int v19 = [BRCItemGlobalID alloc];
              id v28 = [v7 defaultClientZone];
              int v20 = [v28 dbRowID];
              __int16 v21 = [v7 dbRowID];
              int v22 = +[BRCItemID documentsItemIDWithAppLibraryRowID:v21];
              uint64_t v23 = [(BRCItemGlobalID *)v19 initWithZoneRowID:v20 itemID:v22];
              BOOL v24 = [(BRCAccountSession *)session globalID:v26 isStrictChildOfGlobalID:v23];

              if (!v24) {
                char v16 = v9;
              }
            }
          }
          v25 = self->_isInDocumentScope;
          self->_isInDocumentScope = v16;

          isInDocumentScope = self->_isInDocumentScope;
          goto LABEL_2;
        }
        char v6 = 1;
        uint64_t v9 = (NSNumber *)MEMORY[0x1E4F1CC38];
      }
    }
    else
    {
      char v6 = 1;
      uint64_t v9 = (NSNumber *)MEMORY[0x1E4F1CC38];
    }
    id v10 = self->_isInDocumentScope;
    self->_isInDocumentScope = v9;

    goto LABEL_8;
  }
LABEL_2:
  char v6 = [(NSNumber *)isInDocumentScope BOOLValue];
LABEL_8:

  return v6;
}

- (BOOL)isInDocumentScope
{
  return [(BRCLocalStatInfo *)self->_st itemScope] == 2;
}

- (BOOL)isInDocumentOrTrashScope
{
  if ([(BRCLocalItem *)self isInDocumentScope]) {
    return 1;
  }
  return [(BRCLocalItem *)self isInTrashScope];
}

- (BOOL)isInDataScope
{
  return [(BRCLocalStatInfo *)self->_st itemScope] == 1;
}

- (BOOL)isInTrashScope
{
  return [(BRCLocalStatInfo *)self->_st itemScope] == 3;
}

- (unsigned)itemScope
{
  return [(BRCLocalStatInfo *)self->_st itemScope];
}

- (NSNumber)parentFileID
{
  parentFileID = self->_parentFileID;
  if (!parentFileID)
  {
    id v4 = [(BRCLocalItem *)self parentItemOnFS];
    int v5 = [v4 fileID];
    char v6 = self->_parentFileID;
    self->_parentFileID = v5;

    parentFileID = self->_parentFileID;
  }
  id v7 = parentFileID;
  return v7;
}

- (BRFileObjectID)fileObjectID
{
  v2 = [(BRCLocalItem *)self st];
  unsigned int v3 = [v2 type];
  if (v3 > 0xA)
  {
    id v7 = brc_bread_crumbs();
    char v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem fileObjectID]();
    }
  }
  else if (((1 << v3) & 0x639) != 0)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F594E0]);
    int v5 = [v2 fileID];
    uint64_t v6 = objc_msgSend(v4, "initWithFileID:", objc_msgSend(v5, "unsignedLongLongValue"));
    goto LABEL_8;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F594C8]);
  int v5 = [v2 documentID];
  uint64_t v6 = objc_msgSend(v9, "initWithDocID:", objc_msgSend(v5, "unsignedIntValue"));
LABEL_8:
  id v10 = (void *)v6;

  return (BRFileObjectID *)v10;
}

- (BRFileObjectID)parentFileObjectID
{
  id v3 = objc_alloc(MEMORY[0x1E4F594E0]);
  id v4 = [(BRCLocalItem *)self parentFileID];
  int v5 = objc_msgSend(v3, "initWithFileID:", objc_msgSend(v4, "unsignedLongLongValue"));

  return (BRFileObjectID *)v5;
}

- (NSNumber)fileID
{
  return [(BRCLocalStatInfo *)self->_st fileID];
}

- (void)_refreshAppLibraryFromParent
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: hierarchy too deep to compute the app library root of %@%@");
}

- (BRCAppLibrary)appLibrary
{
  appLibrary = self->_appLibrary;
  if (!appLibrary)
  {
    [(BRCLocalItem *)self _refreshAppLibraryFromParent];
    appLibrary = self->_appLibrary;
  }
  id v4 = appLibrary;
  return v4;
}

- (BRCClientZone)parentClientZone
{
  v2 = [(BRCAccountSession *)self->_session serverZoneByRowID:self->_parentZoneRowID];
  id v3 = [v2 clientZone];

  return (BRCClientZone *)v3;
}

- (BOOL)isKnownByServer
{
  if ([(BRCLocalItem *)self hasValidCKInfo]) {
    return 1;
  }
  knownByServer = self->_knownByServer;
  if (!knownByServer)
  {
    itemID = self->_itemID;
    db = self->_db;
    id v7 = [(BRCClientZone *)self->_clientZone dbRowID];
    char v8 = [(PQLConnection *)db numberWithSQL:@"SELECT 1 FROM server_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1", itemID, v7];
    id v9 = self->_knownByServer;
    self->_knownByServer = v8;

    knownByServer = self->_knownByServer;
    if (!knownByServer)
    {
      self->_knownByServer = (NSNumber *)MEMORY[0x1E4F1CC28];

      knownByServer = self->_knownByServer;
    }
  }
  return [(NSNumber *)knownByServer BOOLValue];
}

- (BOOL)isKnownByServerOrInFlight
{
  id v3 = [(BRCAccountSession *)self->_session syncUpScheduler];
  char v4 = [v3 isItemInSyncUpAndInFlight:self];

  if (v4) {
    return 1;
  }
  return [(BRCLocalItem *)self isKnownByServer];
}

- (BOOL)isDeadOrMissingInServerTruth
{
  itemID = self->_itemID;
  db = self->_db;
  char v4 = [(BRCClientZone *)self->_clientZone dbRowID];
  id v5 = [(PQLConnection *)db numberWithSQL:@"SELECT 1 FROM server_items WHERE item_id = %@ AND item_state = 0 AND zone_rowid = %@ LIMIT 1", itemID, v4];
  LOBYTE(itemID) = [v5 BOOLValue] ^ 1;

  return (char)itemID;
}

- (BRCItemID)serverPathMatchItemID
{
  id serverPathMatchID = self->_serverPathMatchID;
  if (!serverPathMatchID)
  {
    db = self->_db;
    itemID = self->_itemID;
    uint64_t v6 = [(BRCStatInfo *)self->_st parentID];
    id v7 = [(BRCLocalStatInfo *)self->_st logicalName];
    char v8 = [(BRCClientZone *)self->_clientZone dbRowID];
    id v9 = [(PQLConnection *)db itemIDWithSQL:@"SELECT item_id FROM server_items WHERE item_id != %@ AND item_parent_id = %@ AND item_filename = %@ AND +zone_rowid = %@", itemID, v6, v7, v8];
    id v10 = self->_serverPathMatchID;
    self->_id serverPathMatchID = v9;

    id serverPathMatchID = self->_serverPathMatchID;
    if (!serverPathMatchID)
    {
      unint64_t v11 = [MEMORY[0x1E4F1CA98] null];
      id v12 = self->_serverPathMatchID;
      self->_id serverPathMatchID = v11;

      id serverPathMatchID = self->_serverPathMatchID;
    }
  }
  id v13 = [MEMORY[0x1E4F1CA98] null];

  if (serverPathMatchID == v13) {
    id v14 = 0;
  }
  else {
    id v14 = self->_serverPathMatchID;
  }
  return (BRCItemID *)v14;
}

- (BOOL)isNewToServer:(BOOL *)a3
{
  id v5 = [(BRCLocalItem *)self st];
  uint64_t v6 = [v5 ckInfo];
  id v7 = [v6 etag];

  if (v7)
  {
    BOOL result = [(BRCLocalItem *)self isDeadOrMissingInServerTruth];
    if (!a3) {
      return result;
    }
  }
  else
  {
    BOOL result = 1;
    if (!a3) {
      return result;
    }
  }
  *a3 = v7 == 0;
  return result;
}

- (BOOL)isLive
{
  return [(BRCStatInfo *)self->_st state] == 0;
}

- (BOOL)isDead
{
  return [(BRCStatInfo *)self->_st state] == 1;
}

- (BOOL)isAlmostDead
{
  int v3 = [(BRCStatInfo *)self->_st state];
  if (v3 != 1) {
    LOBYTE(v3) = [(BRCStatInfo *)self->_st state] == -3;
  }
  return v3;
}

- (BOOL)isLost
{
  return [(BRCStatInfo *)self->_st state] == -1 || [(BRCStatInfo *)self->_st state] == -3;
}

- (BOOL)isOnDisk
{
  return ![(BRCStatInfo *)self->_st state] || [(BRCStatInfo *)self->_st state] == -1;
}

- (BOOL)isBRAlias
{
  return 0;
}

- (BOOL)isDirectory
{
  return 0;
}

- (BOOL)isDirectoryFault
{
  return 0;
}

- (BOOL)isDirectoryWithPackageName
{
  return 0;
}

- (BOOL)isPackage
{
  return 0;
}

- (BOOL)isDocument
{
  return 0;
}

- (BOOL)isZoneRoot
{
  return 0;
}

- (BOOL)isFSRoot
{
  return [(BRCStatInfo *)self->_st type] == 4;
}

- (BOOL)isSymLink
{
  return 0;
}

- (BOOL)isFinderBookmark
{
  return 0;
}

- (BOOL)isShareAcceptationFault
{
  return 0;
}

- (BOOL)isSharedToMe
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem]) {
    return 1;
  }
  return [(BRCLocalItem *)self isSharedToMeChildItem];
}

- (BOOL)isSharedToMeTopLevelItem
{
  BOOL v3 = [(BRCClientZone *)self->_clientZone isSharedZone];
  if (v3) {
    return (LOBYTE(self->_sharingOptions) >> 2) & 1;
  }
  return v3;
}

- (BOOL)isSharedToMeChildItem
{
  BOOL v3 = [(BRCClientZone *)self->_clientZone isSharedZone];
  if (v3) {
    LOBYTE(v3) = (self->_sharingOptions & 4) == 0;
  }
  return v3;
}

- (BRCSharedToMeTopLevel)asSharedToMeTopLevelItem
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    BOOL v3 = self;
  }
  else
  {
    char v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem asSharedToMeTopLevelItem]();
    }

    BOOL v3 = 0;
  }
  return (BRCSharedToMeTopLevel *)v3;
}

- (BOOL)isOwnedByMe
{
  return ![(BRCClientZone *)self->_clientZone isSharedZone];
}

- (BOOL)isSharedByMe
{
  BOOL v3 = [(BRCLocalItem *)self isOwnedByMe];
  if (v3)
  {
    LOBYTE(v3) = [(BRCLocalItem *)self isShared];
  }
  return v3;
}

- (BOOL)isShared
{
  return (self->_sharingOptions & 0x48) != 0;
}

- (BOOL)isTopLevelSharedItem
{
  return (self->_sharingOptions & 4) != 0 && [(BRCLocalItem *)self isShared];
}

- (BOOL)isChildSharedItem
{
  return (self->_sharingOptions & 4) == 0 && [(BRCLocalItem *)self isShared];
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  return 0;
}

- (NSString)collaborationIdentifierIfComputable
{
  return 0;
}

- (BOOL)isDocumentBeingCopiedToNewZone
{
  return 0;
}

- (BOOL)isCrossZoneMoveTombstone
{
  return 0;
}

- (BOOL)shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:(BOOL)a3
{
  if (a3)
  {
    BOOL v3 = +[BRCUserDefaults defaultsForMangledID:0];
    char v4 = [v3 supportsEnhancedDrivePrivacy];

    return v4;
  }
  else
  {
    clientZone = self->_clientZone;
    return [(BRCClientZone *)clientZone enhancedDrivePrivacyEnabled];
  }
}

- (void)inheritOSUpgradeNeededFromItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v4 = (id *)a3;
  if (!v4[13])
  {
    id v10 = brc_bread_crumbs();
    unint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem inheritOSUpgradeNeededFromItem:]();
    }
  }
  p_minimumSupportedOSRowID = &self->_minimumSupportedOSRowID;
  if (self->_minimumSupportedOSRowID)
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem inheritOSUpgradeNeededFromItem:]();
    }
  }
  uint64_t v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    char v8 = [(BRCLocalItem *)self itemID];
    id v9 = v4[13];
    int v14 = 138412802;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    int v19 = v6;
    _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: inheriting %@ minimum supported OS%@", (uint8_t *)&v14, 0x20u);
  }
  objc_storeStrong((id *)p_minimumSupportedOSRowID, v4[13]);
}

- (BOOL)needsOSUpgradeToSyncUp
{
  return self->_minimumSupportedOSRowID != 0;
}

- (id)osNameNeededToSyncUp
{
  if (self->_minimumSupportedOSRowID) {
    id v2 = [(BRCPQLConnection *)self->_db fetchObjectOfClass:objc_opt_class(), @"SELECT name FROM os_names WHERE rowid = %@", self->_minimumSupportedOSRowID sql];
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)markNeedsOSUpgradeToSyncUpWithName:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    __int16 v16 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ needs %@ to sync-up%@", buf, 0x20u);
  }

  if (![(BRCPQLConnection *)self->_db execute:@"INSERT OR IGNORE INTO os_names (name) VALUES (%@)", v4])
  {
    id v7 = brc_bread_crumbs();
    char v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem markNeedsOSUpgradeToSyncUpWithName:]();
    }
  }
  id v9 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT rowid FROM os_names WHERE name = %@", v4];
  minimumSupportedOSRowID = self->_minimumSupportedOSRowID;
  self->_minimumSupportedOSRowID = v9;
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
  objc_msgSend(v5, "appendFormat:", @"r:%lld ", self->_dbRowID);
  if (v4)
  {
    uint64_t v6 = +[BRCDumpContext stringFromItemID:self->_itemID context:v4];
    [v5 appendFormat:@"i:%@ ", v6];
  }
  else
  {
    uint64_t v6 = [(BRCClientZone *)self->_clientZone mangledID];
    id v7 = [(BRCItemID *)self->_itemID debugItemIDString];
    [v5 appendFormat:@"i:%@:%@ ", v6, v7];
  }
  char v8 = [(BRCAppLibrary *)self->_appLibrary dbRowID];
  [v5 appendFormat:@"al:%@ ", v8];

  if ([(BRCUserRowID *)self->_ownerKey BOOLValue]) {
    [v5 appendFormat:@"o:%@ ", self->_ownerKey];
  }
  if (self->_localDiffs)
  {
    id v9 = BRCItemFieldsPrettyPrint();
    [v5 appendFormat:@"ld{%@} ", v9];
  }
  id v10 = BRCPrettyPrintEnumWithContext(self->_syncUpState, (uint64_t)&brc_sync_up_state_pretty_entries, v4);
  [v5 appendFormat:@"up:%@", v10];

  if (self->_minimumSupportedOSRowID)
  {
    unint64_t v11 = +[BRCDumpContext highlightedString:@"needs-os-upgrade" type:3 context:v4];
    [v5 appendFormat:@" %@:%@", v11, self->_minimumSupportedOSRowID];
  }
  objc_msgSend(v5, "appendFormat:", @" uv:%d", self->_isUserVisible);
  if ([(BRCLocalItem *)self isDirectory])
  {
    id v12 = [(BRCLocalItem *)self asDirectory];
    objc_msgSend(v5, "appendFormat:", @" mt:%lld", objc_msgSend(v12, "mtime"));
  }
  parentZoneRowID = self->_parentZoneRowID;
  id v14 = [(BRCClientZone *)self->_clientZone dbRowID];
  LOBYTE(parentZoneRowID) = [(BRCZoneRowID *)parentZoneRowID br_isEqualToNumber:v14];

  if ((parentZoneRowID & 1) == 0) {
    [v5 appendFormat:@" pzone:%@", self->_parentZoneRowID];
  }
  sideCarCKInfo = self->_sideCarCKInfo;
  if (sideCarCKInfo)
  {
    __int16 v16 = [(BRFieldCKInfo *)sideCarCKInfo etag];
    [v5 appendFormat:@" ppm:%@", v16];
  }
  uint64_t v17 = [(BRCLocalStatInfo *)self->_st descriptionWithContext:v4 origName:0];
  [v5 appendFormat:@" st{%@", v17];

  if (self->_parentFileID) {
    [v5 appendFormat:@" pino:%@", self->_parentFileID];
  }
  [v5 appendString:@"}"];
  if (self->_sharingOptions)
  {
    __int16 v18 = BRCPrettyPrintBitmap();
    [v5 appendFormat:@" sharing-options:{%@}", v18];
  }
  return v5;
}

- (NSString)description
{
  return (NSString *)[(BRCLocalItem *)self descriptionWithContext:0];
}

- (NSString)debugDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  itemID = self->_itemID;
  uint64_t v6 = [(BRCLocalStatInfo *)self->_st filename];
  id v7 = [v3 stringWithFormat:@"<%@:%p {ID : %@; name : %@}>", v4, self, itemID, v6];

  return (NSString *)v7;
}

- (NSString)digestDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = [(BRCLocalStatInfo *)self->_st filename];
  id v5 = [v3 stringWithFormat:@"\"%@\" id:%@", v4, self->_itemID];

  return (NSString *)v5;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BRCLocalItem;
  id v7 = [(BRCLocalItem *)&v31 init];
  char v8 = v7;
  if (v7)
  {
    v7->_dbRowID = a4;
    uint64_t v9 = [v6 itemID];
    itemID = v8->_itemID;
    v8->_itemID = (BRCItemID *)v9;

    uint64_t v11 = [v6 ownerKey];
    ownerKey = v8->_ownerKey;
    v8->_ownerKey = (BRCUserRowID *)v11;

    __int16 v13 = [v6 sideCarInfo];
    uint64_t v14 = [v13 ckInfo];
    sideCarCKInfo = v8->_sideCarCKInfo;
    v8->_sideCarCKInfo = (BRFieldCKInfo *)v14;

    v8->_unint64_t sharingOptions = [v6 sharingOptions];
    v8->_serverZone = (BRCServerZone *)(id)[v6 serverZone];
    uint64_t v16 = [v6 clientZone];
    clientZone = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v16;

    uint64_t v18 = [(BRCClientZone *)v8->_clientZone db];
    db = v8->_db;
    v8->_db = (BRCPQLConnection *)v18;

    v8->_session = (BRCAccountSession *)(id)[v6 session];
    uint64_t v20 = [BRCLocalStatInfo alloc];
    __int16 v21 = [v6 st];
    uint64_t v22 = [(BRCStatInfo *)v20 initWithStatInfo:v21];
    st = v8->_st;
    v8->_st = (BRCLocalStatInfo *)v22;

    BOOL v24 = [v6 parentItemIDOnFS];
    [(BRCStatInfo *)v8->_st setParentID:v24];

    v25 = [v6 parentZoneOnFS];
    uint64_t v26 = [v25 dbRowID];
    parentZoneRowID = v8->_parentZoneRowID;
    v8->_parentZoneRowID = (BRCZoneRowID *)v26;

    uint64_t v28 = [(BRCLocalItem *)v8 copy];
    orig = v8->_orig;
    v8->_orig = (BRCLocalItem *)v28;
  }
  return v8;
}

- (id)_initWithLocalItem:(id)a3
{
  uint64_t v4 = (id *)a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCLocalItem;
  id v5 = [(BRCLocalItem *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_clientZone, v4[3]);
    objc_storeStrong((id *)&v6->_db, v4[4]);
    objc_storeStrong((id *)&v6->_sideCarCKInfo, v4[20]);
    objc_storeStrong((id *)&v6->_appLibrary, v4[5]);
    v6->_serverZone = (BRCServerZone *)v4[2];
    v6->_session = (BRCAccountSession *)v4[1];
    v6->_dbRowID = (unint64_t)v4[15];
    objc_storeStrong((id *)&v6->_itemID, v4[6]);
    objc_storeStrong((id *)&v6->_parentFileID, v4[19]);
    uint64_t v7 = [v4[9] copy];
    st = v6->_st;
    v6->_st = (BRCLocalStatInfo *)v7;

    objc_storeStrong((id *)&v6->_parentZoneRowID, v4[7]);
    v6->_syncUpState = *((_DWORD *)v4 + 20);
    objc_storeStrong((id *)&v6->_ownerKey, v4[8]);
    v6->_unint64_t sharingOptions = (unint64_t)v4[17];
    objc_storeStrong((id *)&v6->_orig, v4[11]);
    v6->_unint64_t localDiffs = (unint64_t)v4[12];
    objc_storeStrong((id *)&v6->_parentZoneRowID, v4[7]);
    objc_storeStrong((id *)&v6->_minimumSupportedOSRowID, v4[13]);
    v6->_isUserVisible = *((unsigned char *)v4 + 112);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 _initWithLocalItem:self];
}

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    -[BRCLocalItem initFromPQLResultSet:error:]();
  }

  return 0;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v9 = a3;
  objc_super v10 = (BRCAccountSession *)a4;
  id v11 = a5;
  v35.receiver = self;
  v35.super_class = (Class)BRCLocalItem;
  id v12 = [(BRCLocalItem *)&v35 init];
  __int16 v13 = v12;
  if (v12)
  {
    v12->_session = v10;
    v12->_dbRowID = [v9 unsignedLongAtIndex:0];
    uint64_t v14 = [v9 numberAtIndex:1];
    v13->_serverZone = (BRCServerZone *)[(BRCAccountSession *)v10 serverZoneByRowID:v14];

    uint64_t v15 = [(BRCServerZone *)v13->_serverZone clientZone];
    clientZone = v13->_clientZone;
    v13->_clientZone = (BRCClientZone *)v15;

    objc_storeStrong((id *)&v13->_db, a5);
    uint64_t v17 = [v9 objectOfClass:objc_opt_class() atIndex:2];
    itemID = v13->_itemID;
    v13->_itemID = (BRCItemID *)v17;

    uint64_t v19 = [v9 numberAtIndex:3];
    ownerKey = v13->_ownerKey;
    v13->_ownerKey = (BRCUserRowID *)v19;

    v13->_unint64_t sharingOptions = [v9 integerAtIndex:4];
    uint64_t v21 = [v9 objectOfClass:objc_opt_class() atIndex:5];
    sideCarCKInfo = v13->_sideCarCKInfo;
    v13->_sideCarCKInfo = (BRFieldCKInfo *)v21;

    uint64_t v23 = [v9 numberAtIndex:6];
    parentZoneRowID = v13->_parentZoneRowID;
    v13->_parentZoneRowID = (BRCZoneRowID *)v23;

    v13->_syncUpState = [v9 unsignedIntAtIndex:7];
    v13->_unint64_t localDiffs = [v9 unsignedLongLongAtIndex:8];
    v13->_notifsRank = [v9 longLongAtIndex:9];
    v25 = [v9 numberAtIndex:10];
    uint64_t v26 = [v9 numberAtIndex:11];
    minimumSupportedOSRowID = v13->_minimumSupportedOSRowID;
    v13->_minimumSupportedOSRowID = (NSNumber *)v26;

    v13->_isUserVisible = [v9 BOOLAtIndex:12];
    uint64_t v28 = [[BRCLocalStatInfo alloc] initFromResultSet:v9 pos:13];
    st = v13->_st;
    v13->_st = v28;

    if (v25)
    {
      uint64_t v30 = [(BRCAccountSession *)v10 appLibraryByRowID:v25];
      appLibrary = v13->_appLibrary;
      v13->_appLibrary = (BRCAppLibrary *)v30;
    }
    else
    {
      if ([(BRCLocalItem *)v13 isReserved]) {
        goto LABEL_6;
      }
      uint64_t v34 = brc_bread_crumbs();
      unsigned __int16 v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem _initFromPQLResultSet:session:db:error:]();
      }

      appLibrary = (void *)v34;
    }

LABEL_6:
  }

  return v13;
}

- (id)initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v6 = [(BRCLocalItem *)self _initFromPQLResultSet:a3 session:a4 db:a5 error:a6];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 copy];
    id v9 = (void *)v7[11];
    v7[11] = v8;
  }
  return v7;
}

- (BOOL)validateLoggingToFile:(__sFILE *)a3
{
  return [(BRCStatInfo *)self->_st check:self->_itemID logToFile:a3];
}

- (BRCItemGlobalID)itemGlobalID
{
  BOOL v3 = [BRCItemGlobalID alloc];
  uint64_t v4 = [(BRCClientZone *)self->_clientZone dbRowID];
  id v5 = [(BRCItemGlobalID *)v3 initWithZoneRowID:v4 itemID:self->_itemID];

  return v5;
}

- (id)itemParentGlobalID
{
  BOOL v3 = [BRCItemGlobalID alloc];
  uint64_t v4 = [(BRCLocalItem *)self parentClientZone];
  id v5 = [v4 dbRowID];
  id v6 = [(BRCStatInfo *)self->_st parentID];
  uint64_t v7 = [(BRCItemGlobalID *)v3 initWithZoneRowID:v5 itemID:v6];

  return v7;
}

- (id)sideCarInfo
{
  if ([(BRCLocalItem *)self isSharedToMeChildItem])
  {
    BOOL v3 = objc_alloc_init(BRCSideCarInfo);
    [(BRCSideCarInfo *)v3 setLastUsedTime:[(BRCStatInfo *)self->_st lastUsedTime]];
    [(BRCSideCarInfo *)v3 setFavoriteRank:[(BRCStatInfo *)self->_st favoriteRank]];
    uint64_t v4 = [(BRCStatInfo *)self->_st finderTags];
    [(BRCSideCarInfo *)v3 setFinderTags:v4];

    [(BRCSideCarInfo *)v3 setCkInfo:self->_sideCarCKInfo];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem sideCarInfo]();
    }

    BOOL v3 = 0;
  }
  return v3;
}

- (id)parentItemIDInZone
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(BRCLocalItem *)self itemID];
  int v4 = [v3 isNonDesktopRoot];

  if (v4)
  {
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem parentItemIDInZone]();
    }
  }
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    id v5 = [BRCItemID alloc];
    id v6 = [(BRCServerZone *)self->_serverZone dbRowID];
    id v7 = [(BRCItemID *)v5 _initAsZoneRootWithZoneRowID:v6];

    if (v7) {
      goto LABEL_4;
    }
LABEL_9:
    objc_super v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem parentItemIDInZone]();
    }

    goto LABEL_18;
  }
  id v7 = [(BRCStatInfo *)self->_st parentID];
  if (!v7) {
    goto LABEL_9;
  }
LABEL_4:
  if ([v7 isNonDesktopRoot]
    || (unsigned int v8 = [(BRCClientZone *)self->_clientZone itemTypeByItemID:v7 db:self->_db], v8 <= 0xA)
    && ((1 << v8) & 0x611) != 0)
  {
    id v9 = v7;
    goto LABEL_19;
  }
  if (v8 == 255)
  {
    id v12 = brc_bread_crumbs();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = [(BRCItemID *)self->_itemID debugItemIDString];
      uint64_t v15 = [v7 debugItemIDString];
      clientZone = self->_clientZone;
      int v22 = 138413058;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      v25 = v15;
      __int16 v26 = 2112;
      id v27 = clientZone;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_fault_impl(&dword_1D353B000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: orphan detected %@ under parent %@ in %@%@", (uint8_t *)&v22, 0x2Au);
    }
  }
  else
  {
    id v12 = brc_bread_crumbs();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      uint64_t v18 = [v7 debugItemIDString];
      BRCPrettyPrintEnumWithContext((int)v8, (uint64_t)&brc_item_type_pretty_entries, 0);
      uint64_t v19 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
      int v22 = 138413058;
      uint64_t v23 = self;
      __int16 v24 = 2112;
      v25 = v18;
      __int16 v26 = 2112;
      id v27 = v19;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_fault_impl(&dword_1D353B000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item parented to a document: %@ parented to %@ type %@%@", (uint8_t *)&v22, 0x2Au);
    }
  }

LABEL_18:
  id v9 = 0;
LABEL_19:

  return v9;
}

- (id)parentItemOnFS
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(BRCLocalItem *)self isFSRoot])
  {
    BOOL v3 = brc_bread_crumbs();
    int v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem parentItemOnFS]();
    }
    id v5 = 0;
  }
  else
  {
    id v6 = [(BRCClientZone *)self->_clientZone parentsOfCZMFaults];
    id v7 = [v6 objectForKeyedSubscript:self->_itemID];

    if (v7 && ![(BRCPQLConnection *)self->_db isReadonly])
    {
      objc_super v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        itemID = self->_itemID;
        int v24 = 138412802;
        v25 = v7;
        __int16 v26 = 2112;
        id v27 = itemID;
        __int16 v28 = 2112;
        id v29 = v10;
        _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Using parent %@ for %@ because it's in the CZM fault list%@", (uint8_t *)&v24, 0x20u);
      }

      BOOL v3 = [(BRCLocalItem *)v7 itemID];
      session = self->_session;
      __int16 v13 = [(BRCLocalItem *)v7 zoneRowID];
      int v4 = [(BRCAccountSession *)session serverZoneByRowID:v13];
    }
    else
    {
      BOOL v3 = [(BRCStatInfo *)self->_st parentID];
      if (!v3)
      {
        unsigned int v8 = brc_bread_crumbs();
        id v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem parentItemOnFS]();
        }
      }
      int v4 = [(BRCAccountSession *)self->_session serverZoneByRowID:self->_parentZoneRowID];
    }
    uint64_t v14 = [v4 clientZone];
    uint64_t v15 = [v14 itemByItemID:v3 db:self->_db];

    if (!v15)
    {
      uint64_t v16 = brc_bread_crumbs();
      uint64_t v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        uint64_t v21 = [(BRCItemID *)self->_itemID debugItemIDString];
        int v22 = [v3 debugItemIDString];
        int v24 = 138413058;
        v25 = v21;
        __int16 v26 = 2112;
        id v27 = v22;
        __int16 v28 = 2112;
        id v29 = v4;
        __int16 v30 = 2112;
        objc_super v31 = v16;
        _os_log_fault_impl(&dword_1D353B000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: orphan detected %@ under parent %@ in %@%@", (uint8_t *)&v24, 0x2Au);
      }
    }
    if ([(BRCItemID *)v15 isDocument])
    {
      uint64_t v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        int v24 = 138412802;
        v25 = self;
        __int16 v26 = 2112;
        id v27 = v15;
        __int16 v28 = 2112;
        id v29 = v18;
        _os_log_fault_impl(&dword_1D353B000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item parented to a document: %@ parented to %@%@", (uint8_t *)&v24, 0x20u);
      }

      uint64_t v15 = 0;
    }
    id v5 = [(BRCItemID *)v15 asDirectory];
  }
  return v5;
}

- (void)_updateAppLibraryPristineStatesAfterMarkingDead
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] remove documents folder%@", v2, v3, v4, v5, v6);
}

- (void)_updateAppLibraryPristineStatesAfterCreationOrUpdate
{
  if (![(BRCLocalItem *)self isFSRoot] && [(BRCLocalItem *)self isLive])
  {
    uint64_t v3 = [(BRCLocalItem *)self appLibrary];
    if (v3)
    {
      id v10 = v3;
      uint64_t v4 = [(BRCLocalItem *)self appLibrary];
      uint64_t v5 = [v4 dbRowID];
      uint8_t v6 = +[BRCItemID documentsItemIDWithAppLibraryRowID:v5];

      id v7 = [(BRCStatInfo *)self->_st parentID];
      LODWORD(v5) = [v7 isEqualToItemID:v6];

      if (v5)
      {
        [v10 didCreateDocumentScopedItem];
      }
      else if (![(BRCItemID *)self->_itemID isEqualToItemID:v6])
      {
        unsigned int v8 = [(BRCStatInfo *)self->_st parentID];
        int v9 = [v8 isNonDesktopRoot];

        if (v9) {
          [v10 didCreateDataScopedItem];
        }
      }

      uint64_t v3 = v10;
    }
  }
}

- (unint64_t)metadataSyncUpMask:(BOOL)a3
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem]) {
    unint64_t v5 = 33430122;
  }
  else {
    unint64_t v5 = 33439742;
  }
  if (!a3)
  {
    if ([(BRCLocalItem *)self isDocument])
    {
      uint8_t v6 = [(BRCLocalItem *)self asDocument];
      int v7 = [v6 isPausedFromSync];

      if (v7) {
        v5 &= 0x43FFEuLL;
      }
    }
  }
  unsigned int v8 = [(BRCClientZone *)self->_clientZone mangledID];
  int v9 = +[BRCUserDefaults defaultsForMangledID:v8];
  int v10 = [v9 stripBirthtimeFromSyncUpMaskOnDocuments];

  if (v10)
  {
    id v11 = [(BRCLocalItem *)self itemID];
    int v12 = [v11 isDocumentsFolder];

    if (v12) {
      return v5 & 0x1FE3FEE;
    }
  }
  return v5;
}

- (unint64_t)maskForDiffsToSyncUpForZone:(id)a3 sideCarZone:(BOOL)a4 whenClearing:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  unint64_t v8 = 0xFCFF00FFF3FF7FFFLL;
  id v9 = a3;
  if ([(BRCLocalItem *)self isDocument])
  {
    int v10 = [(BRCLocalItem *)self asDocument];
    int v11 = [v10 isPausedFromSync];

    if (v11) {
      unint64_t v8 = 0xFCFF00FFF0047FFFLL;
    }
  }
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    char v12 = [v9 isPrivateZone];
    unint64_t v13 = v8 & 0xFCFF00FFF2FB0002;
    if (v5) {
      unint64_t v13 = v8 & 0xFCFF00FFF3FF0002;
    }
    if (v12) {
      unint64_t v14 = 32765;
    }
    else {
      unint64_t v14 = v13;
    }
  }
  else
  {
    BOOL v15 = [(BRCLocalItem *)self isSharedToMeChildItem];
    unint64_t v16 = v8 & 0xFCFF00FFF3FF65FFLL;
    if (v6) {
      unint64_t v16 = 6656;
    }
    if (v15) {
      unint64_t v14 = v16;
    }
    else {
      unint64_t v14 = v8;
    }
  }

  return v14;
}

- (void)createSyncUpJob
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _db.isBatchSuspended%@", v2, v3, v4, v5, v6);
}

- (id)unsaltedBookmarkData
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(BRCItemID *)self->_itemID itemIDString];
  uint64_t v5 = [(BRCServerZone *)self->_serverZone mangledID];
  uint8_t v6 = [v3 unsaltedBookmarkDataWithItemResolutionString:v4 serverZoneMangledID:v5];

  return v6;
}

- (id)_syncZoneRowIDs
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    uint64_t v3 = [(BRCLocalItem *)self clientZone];
    uint64_t v4 = [v3 dbRowID];
    v17[0] = v4;
    uint64_t v5 = [(BRCLocalItem *)self parentClientZone];
    uint8_t v6 = [v5 dbRowID];
    v17[1] = v6;
    int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  }
  else
  {
    BOOL v8 = [(BRCLocalItem *)self isSharedToMeChildItem];
    uint64_t v3 = [(BRCLocalItem *)self clientZone];
    uint64_t v9 = [v3 dbRowID];
    uint64_t v4 = (void *)v9;
    if (v8)
    {
      uint64_t v15 = v9;
      unint64_t v16 = &unk_1F2B26EB0;
      int v10 = (void *)MEMORY[0x1E4F1C978];
      int v11 = &v15;
      uint64_t v12 = 2;
    }
    else
    {
      uint64_t v14 = v9;
      int v10 = (void *)MEMORY[0x1E4F1C978];
      int v11 = &v14;
      uint64_t v12 = 1;
    }
    int v7 = objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v14, v15, v16);
  }

  return v7;
}

- (void)_updateSyncUpSchedulerWithDiffs:(unint64_t)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0x20000000000000) == 0
    && (![(BRCLocalItem *)self isSharedToMe] || self->_syncUpState != 4))
  {
    clientZone = self->_clientZone;
    uint64_t v5 = [(BRCLocalItem *)self->_orig clientZone];
    LOBYTE(clientZone) = [(BRCClientZone *)clientZone isEqualToClientZone:v5];

    if (clientZone)
    {
      if ([(BRCLocalItem *)self->_orig syncUpState] == 4 && self->_syncUpState != 4)
      {
        uint8_t v6 = brc_bread_crumbs();
        int v7 = brc_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:]();
        }

        goto LABEL_40;
      }
      return;
    }
  }
  BOOL v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:]();
  }

  unsigned int syncUpState = self->_syncUpState;
  if (!syncUpState)
  {
    uint8_t v6 = [(BRCAccountSession *)self->_session syncUpScheduler];
    [v6 deleteSyncUpJobsForItem:self];
    goto LABEL_40;
  }
  if (syncUpState == 4)
  {
    [(BRCLocalItem *)self createSyncUpJob];
    return;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v11 = [(BRCLocalItem *)self _syncZoneRowIDs];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (!v12)
  {
    char v15 = 0;
    goto LABEL_35;
  }
  uint64_t v14 = v12;
  char v15 = 0;
  uint64_t v16 = *(void *)v32;
  *(void *)&long long v13 = 138412290;
  long long v30 = v13;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v32 != v16) {
        objc_enumerationMutation(v11);
      }
      uint64_t v18 = *(BRCLocalItem **)(*((void *)&v31 + 1) + 8 * v17);
      uint64_t v19 = [(BRCAccountSession *)self->_session syncUpScheduler];
      char v20 = [v19 isItemInSyncUpAndInFlight:self inZone:v18];

      if (v20)
      {
        brc_bread_crumbs();
        uint64_t v21 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
        char v15 = 1;
        int v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v36 = v18;
          __int16 v37 = 2112;
          char v38 = v21;
          _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Not finishing sync up because item is in-flight in %@%@", buf, 0x16u);
        }
LABEL_24:

        goto LABEL_28;
      }
      uint64_t v23 = brc_bread_crumbs();
      int v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v36 = self;
        __int16 v37 = 2112;
        char v38 = v18;
        __int16 v39 = 2112;
        id v40 = v23;
        _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Finishing sync up for %@ in %@%@", buf, 0x20u);
      }

      v25 = [(BRCAccountSession *)self->_session syncUpScheduler];
      uint64_t v26 = [v25 finishSyncUpForItem:self inZone:v18 success:1];

      if (v26)
      {
        brc_bread_crumbs();
        uint64_t v21 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
        int v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v30;
          uint64_t v36 = v21;
          _os_log_fault_impl(&dword_1D353B000, v22, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: syncUpDiffs == 0%@", buf, 0xCu);
        }
        goto LABEL_24;
      }
LABEL_28:
      ++v17;
    }
    while (v14 != v17);
    uint64_t v27 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
    uint64_t v14 = v27;
  }
  while (v27);
LABEL_35:

  if (self->_syncUpState == 3 && (v15 & 1) == 0)
  {
    __int16 v28 = brc_bread_crumbs();
    id v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:]();
    }

    uint8_t v6 = [(BRCAccountSession *)self->_session fsUploader];
    [v6 rescheduleSuspendedJobsMatching:self inState:31];
LABEL_40:
  }
}

- (void)_updateSharedZoneBoostingWithDiffs:(unint64_t)a3
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    if ((a3 & 0x40000000000000) != 0
      && [(BRCLocalItem *)self isOnDisk]
      && [(BRCLocalItem *)self->_orig isOnDisk])
    {
      uint64_t v5 = [(BRCLocalItem *)self->_orig appLibrary];
      uint8_t v6 = [(BRCServerZone *)self->_serverZone asSharedZone];
      [v5 _removeTargetSharedServerZoneIfNecessary:v6];

      appLibrary = self->_appLibrary;
      BOOL v8 = [(BRCLocalItem *)self asSharedToMeTopLevelItem];
      [(BRCAppLibrary *)appLibrary _addTargetSharedServerZoneForSharedItem:v8];
    }
    if ([(BRCLocalItem *)self isOnDisk]
      && (![(BRCLocalItem *)self->_orig isOnDisk] || [(BRCLocalItem *)self->_orig needsInsert]))
    {
      uint64_t v9 = self->_appLibrary;
      id v13 = [(BRCLocalItem *)self asSharedToMeTopLevelItem];
      [(BRCAppLibrary *)v9 _addTargetSharedServerZoneForSharedItem:v13];
    }
    else
    {
      if (![(BRCLocalItem *)self->_orig isOnDisk] || [(BRCLocalItem *)self isOnDisk]) {
        return;
      }
      uint64_t v12 = self->_appLibrary;
      id v13 = [(BRCServerZone *)self->_serverZone asSharedZone];
      [(BRCAppLibrary *)v12 _removeTargetSharedServerZoneIfNecessary:v13];
    }
  }
  else
  {
    if (![(BRCLocalItem *)self->_orig isSharedToMeTopLevelItem]) {
      return;
    }
    int v10 = self->_appLibrary;
    id v13 = [(BRCLocalItem *)self->_orig serverZone];
    int v11 = [v13 asSharedZone];
    [(BRCAppLibrary *)v10 _removeTargetSharedServerZoneIfNecessary:v11];
  }
}

- (void)wasMarkedDead
{
  id v6 = [(BRCAccountSession *)self->_session applyScheduler];
  itemID = self->_itemID;
  uint64_t v4 = [(BRCLocalItem *)self->_orig st];
  uint64_t v5 = [v4 parentID];
  [v6 didReparentOrKillItemID:itemID parentItemID:v5 zone:self->_serverZone];

  [(BRCLocalItem *)self _updateAppLibraryPristineStatesAfterMarkingDead];
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  if (![(BRCLocalItem *)self isReserved] && !self->_appLibrary)
  {
    int v7 = brc_bread_crumbs();
    BOOL v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem _insertInDB:dbRowID:]();
    }
  }
  self->_dbRowID = a4;
  [(BRCLocalItem *)self _updateAppLibraryPristineStatesAfterCreationOrUpdate];
  [(BRCLocalItem *)self _updateSyncUpSchedulerWithDiffs:0xFCFF00FFF3FF7FFFLL];
  [(BRCLocalItem *)self _updateSharedZoneBoostingWithDiffs:0];
  return 1;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  clientZone = self->_clientZone;
  int v7 = [(BRCLocalItem *)self->_orig clientZone];
  LOBYTE(clientZone) = [(BRCClientZone *)clientZone isEqualToClientZone:v7];

  if ((clientZone & 1) == 0)
  {
    BOOL v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem _updateInDB:diffs:]();
    }

    int v10 = [(BRCLocalItem *)self itemID];
    int v11 = [(BRCLocalItem *)self orig];
    uint64_t v12 = [v11 itemID];
    int v13 = [v10 isEqualToItemID:v12];

    if (v13)
    {
      __int16 v39 = brc_bread_crumbs();
      id v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem _updateInDB:diffs:]();
      }
    }
    uint64_t v14 = [(BRCStatInfo *)self->_st ckInfo];
    uint64_t v15 = [v14 etag];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = [(BRCLocalItem *)self->_orig st];
      uint64_t v18 = [v17 ckInfo];
      uint64_t v19 = [v18 etagBeforeCrossZoneMove];
      char v20 = [(BRCStatInfo *)self->_st ckInfo];
      uint64_t v21 = [v20 etag];
      if ([v19 isEqualToString:v21])
      {
      }
      else
      {
        BOOL v22 = [(BRCLocalItem *)self isDirectory];

        if (v22)
        {
LABEL_13:
          uint64_t v23 = [BRCItemDBRowIDAndZoneJobIdentifier alloc];
          unint64_t dbRowID = self->_dbRowID;
          v25 = [(BRCLocalItem *)self->_orig clientZone];
          uint64_t v26 = [v25 dbRowID];
          uint64_t v27 = [(BRCItemDBRowIDAndZoneJobIdentifier *)v23 initWithItemDBRowID:dbRowID zoneRowID:v26];

          __int16 v28 = [(BRCAccountSession *)self->_session syncUpScheduler];
          [v28 deleteJobsMatching:v27];

          goto LABEL_14;
        }
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem _updateInDB:diffs:]();
        }
      }
    }
    goto LABEL_13;
  }
LABEL_14:
  if (![(BRCLocalItem *)self->_orig isDead] && [(BRCLocalItem *)self isDead]) {
    [(BRCLocalItem *)self wasMarkedDead];
  }
  if ((a4 & 0x20) != 0)
  {
    id v29 = [(BRCAccountSession *)self->_session applyScheduler];
    itemID = self->_itemID;
    long long v31 = [(BRCLocalItem *)self->_orig st];
    long long v32 = [v31 parentID];
    [v29 didReparentOrKillItemID:itemID parentItemID:v32 zone:self->_serverZone];
  }
  if (![(BRCLocalItem *)self->_orig isRejected] && [(BRCLocalItem *)self isRejected])
  {
    long long v33 = [(BRCAccountSession *)self->_session applyScheduler];
    [v33 createApplyJobFromServerItem:0 localItem:self state:1 kind:0];
  }
  if ([(BRCLocalItem *)self isIdleOrRejected])
  {
    if (![(BRCLocalItem *)self->_orig isIdleOrRejected])
    {
      int64_t v34 = [(BRCClientZone *)self->_clientZone serverRankByItemID:self->_itemID];
      if (v34)
      {
        int64_t v35 = v34;
        uint64_t v36 = [(BRCAccountSession *)self->_session applyScheduler];
        __int16 v37 = [(BRCServerZone *)self->_serverZone dbRowID];
        [v36 rescheduleItemRank:v35 zoneRowID:v37 matchingState:22];
      }
    }
  }
  [(BRCLocalItem *)self _updateSharedZoneBoostingWithDiffs:a4];
  [(BRCLocalItem *)self _updateSyncUpSchedulerWithDiffs:a4];
  [(BRCLocalItem *)self _updateAppLibraryPristineStatesAfterCreationOrUpdate];
  return 1;
}

- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (self->_dbRowID)
  {
    if (!objc_msgSend(v5, "execute:", @"DELETE FROM client_items WHERE rowid = %lld", self->_dbRowID))
    {
      BOOL v15 = 0;
      goto LABEL_11;
    }
    if (![(BRCLocalItem *)self->_orig isDead]) {
      [(BRCLocalItem *)self wasMarkedDead];
    }
    int v7 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
    [v7 deleteReadingJobForItem:self];

    BOOL v8 = [(BRCAccountSession *)self->_session fsDownloader];
    [v8 deleteDownloadingJobForItem:self];

    uint64_t v9 = [(BRCAccountSession *)self->_session fsUploader];
    [v9 deleteUploadingJobForItem:self];

    int v10 = [(BRCAccountSession *)self->_session syncUpScheduler];
    [v10 deleteSyncUpJobsForItem:self];

    if (![(BRCLocalItem *)self isIdleOrRejected])
    {
      int64_t v11 = [(BRCClientZone *)self->_clientZone serverRankByItemID:self->_itemID];
      if (v11)
      {
        int64_t v12 = v11;
        int v13 = [(BRCAccountSession *)self->_session applyScheduler];
        uint64_t v14 = [(BRCServerZone *)self->_serverZone dbRowID];
        [v13 rescheduleItemRank:v12 zoneRowID:v14 matchingState:22];
      }
    }
    [(BRCLocalItem *)self _updateSharedZoneBoostingWithDiffs:0];
    self->_unint64_t dbRowID = 0;
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)_isInterestingUpdateForNotifs
{
  return 0;
}

- (BOOL)_isInterestingUpdateForNotifsWithDiffs:(unint64_t)a3
{
  if (self->_forceNotif) {
    goto LABEL_2;
  }
  if ([(BRCLocalItem *)self isOnDisk] || (BOOL v3 = [(BRCLocalItem *)self->_orig isOnDisk]))
  {
    if ([(BRCLocalItem *)self needsInsert] && [(BRCLocalItem *)self isDead]) {
      goto LABEL_21;
    }
    BOOL v6 = [(BRCLocalItem *)self needsInsert];
    LOBYTE(v3) = 1;
    if ((a3 & 0x80000000) == 0 && !v6)
    {
      if ([(BRCLocalItem *)self isLost])
      {
        BOOL v7 = [(BRCLocalItem *)self isOnDisk];
        if ((a3 & 0x80001040000060) == 0 && v7) {
          goto LABEL_21;
        }
      }
      if ([(BRCLocalItem *)self->_orig isReserved] && [(BRCLocalItem *)self isDead]) {
        goto LABEL_21;
      }
      if ((a3 & 0x100000000) != 0)
      {
        if ([(BRCLocalItem *)self->_orig isReserved]) {
          goto LABEL_2;
        }
      }
      else if ([(BRCLocalItem *)self isDead])
      {
LABEL_21:
        LOBYTE(v3) = 0;
        return v3;
      }
      if ([(BRCLocalItem *)self isDirectory] && [(BRCLocalItem *)self->_orig isAlmostDead]) {
        goto LABEL_21;
      }
      if ((a3 & 0xF8001FF04A5A60) == 0)
      {
        BOOL v8 = [(BRCLocalItem *)self orig];
        int v9 = [v8 needsOSUpgradeToSyncUp];
        int v10 = [(BRCLocalItem *)self needsOSUpgradeToSyncUp];

        if (v9 == v10)
        {
          LOBYTE(v3) = [(BRCLocalItem *)self _isInterestingUpdateForNotifs];
          return v3;
        }
      }
LABEL_2:
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_ascendItemHierarchyWithBlock:(id)a3
{
  BOOL v15 = (uint64_t (**)(id, BRCItemGlobalID *, void *))a3;
  uint64_t v4 = [(BRCLocalItem *)self appLibrary];
  id v5 = [v4 mangledID];
  BOOL v6 = +[BRCUserDefaults defaultsForMangledID:v5];
  uint64_t v7 = [v6 maxSyncPathDepth];

  db = self->_db;
  int v9 = [(BRCStatInfo *)self->_st parentID];
  id v10 = [(BRCPQLConnection *)db fetch:@" WITH RECURSIVE item_parents (item_id, zone_rowid, item_file_id) AS(    SELECT item_parent_id, item_parent_zone_rowid, item_file_id FROM client_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid, li.item_file_id FROM client_items AS li  INNER JOIN item_parents AS p USING (item_id, zone_rowid)      LIMIT %u) SELECT item_file_id, item_id, zone_rowid FROM item_parents", v9, self->_parentZoneRowID, v7];

  if ([v10 next])
  {
    while (1)
    {
      int64_t v11 = [v10 objectOfClass:objc_opt_class() atIndex:0];
      int64_t v12 = [v10 objectOfClass:objc_opt_class() atIndex:1];
      int v13 = [v10 objectOfClass:objc_opt_class() atIndex:2];
      uint64_t v14 = [[BRCItemGlobalID alloc] initWithZoneRowID:v13 itemID:v12];
      if ((v15[2](v15, v14, v11) & 1) == 0) {
        break;
      }

      if (![v10 next]) {
        goto LABEL_6;
      }
    }
    [v10 close];
  }
LABEL_6:
}

- (id)setOfParentIDs
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(BRCLocalItem *)self itemGlobalID];
  id v5 = objc_msgSend(v3, "initWithObjects:", v4, 0);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__BRCLocalItem_setOfParentIDs__block_invoke;
  v8[3] = &unk_1E6996690;
  id v6 = v5;
  id v9 = v6;
  [(BRCLocalItem *)self _ascendItemHierarchyWithBlock:v8];

  return v6;
}

uint64_t __30__BRCLocalItem_setOfParentIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) containsObject:v3];
  if (v4)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __30__BRCLocalItem_setOfParentIDs__block_invoke_cold_2();
    }

    uint64_t v7 = brc_bread_crumbs();
    BOOL v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return v4 ^ 1u;
}

- (BOOL)hasValidCKInfo
{
  uint64_t v2 = [(BRCStatInfo *)self->_st ckInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isIWorkItem
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(BRCLocalStatInfo *)self->_st filename];
  int v4 = objc_msgSend(v3, "br_pathExtension");

  id v5 = [(BRCClientZone *)self->_clientZone mangledID];
  id v6 = +[BRCUserDefaults defaultsForMangledID:v5];
  uint64_t v7 = [v6 iworkShareableExtensions];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(v4, "isEqualToString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)_sendNotificationIfNeededWithDiffs:(unint64_t)a3 regather:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(BRCAccountSession *)self->_session notificationManager];
  if ([(BRCLocalItem *)self isBRAlias])
  {
    id v8 = [(BRCLocalItem *)self appLibrary];
    if ([v8 hasActiveAliasQueries])
    {
    }
    else
    {
      BOOL v9 = [(BRCLocalItem *)self isDead];

      if (!v9) {
        goto LABEL_38;
      }
    }
  }
  if (![(BRCLocalItem *)self isZoneRoot]
    && ([(BRCLocalItem *)self isOnDisk] || [(BRCLocalItem *)self->_orig isOnDisk]))
  {
    if ([v7 hasActiveAliasWatchers])
    {
      uint64_t v10 = [(BRCLocalItem *)self setOfAppLibraryIDsWithReverseAliases];
    }
    else
    {
      uint64_t v10 = 0;
    }
    int64_t v11 = [(BRCLocalItem *)self itemID];
    char v12 = [v11 isDocumentsFolder];

    if (v10) {
      goto LABEL_16;
    }
    long long v13 = [(BRCLocalItem *)self appLibrary];
    if ([v13 hasActiveQueries])
    {
LABEL_15:

      goto LABEL_16;
    }
    long long v14 = [(BRCLocalItem *)self orig];
    long long v15 = [v14 appLibrary];
    if ([v15 hasActiveQueries])
    {

      goto LABEL_15;
    }
    if (![(BRCLocalItem *)self isOnDisk])
    {
      uint64_t v23 = [(BRCLocalItem *)self orig];
      v12 |= [v23 isOnDisk];
    }
    if (v12)
    {
LABEL_16:
      if (v4)
      {
        uint64_t v16 = +[BRCNotification notificationGatheredFromItem:self];
      }
      else
      {
        BOOL v17 = [(BRCLocalItem *)self isBRAlias];
        uint64_t v18 = [BRCNotification alloc];
        uint64_t v19 = v18;
        if (v17)
        {
          char v20 = [(BRCLocalItem *)self asBRAlias];
          uint64_t v21 = [(BRCNotification *)v19 initWithAliasItem:v20 itemDiffs:a3];

          goto LABEL_22;
        }
        uint64_t v16 = [(BRCNotification *)v18 initWithLocalItem:self itemDiffs:a3];
      }
      uint64_t v21 = (BRCNotification *)v16;
LABEL_22:
      if ([(BRCNotification *)v21 isDead]) {
        goto LABEL_32;
      }
      if (!v10)
      {
        BOOL v22 = [(BRCLocalItem *)self appLibrary];
        if ([v22 hasActiveRecursiveQueries])
        {
        }
        else
        {
          int v24 = [(BRCLocalItem *)self orig];
          v25 = [v24 appLibrary];
          int v26 = [v25 hasActiveRecursiveQueries];

          if (!v26) {
            goto LABEL_32;
          }
        }
      }
      uint64_t v27 = [(BRCLocalItem *)self setOfParentIDs];
      [(BRCNotification *)v21 setParentGlobalIDs:v27];

LABEL_32:
      if ([v7 hasActiveAliasWatchers])
      {
        [(BRCNotification *)v21 setAppLibraryIDsWithReverseAliases:v10];
        if ([(BRCLocalItem *)self isDocument])
        {
          __int16 v28 = [(BRCLocalItem *)self asDocument];
          id v29 = [v28 unsaltedBookmarkData];
          [(BRCNotification *)v21 setUnsaltedBookmarkData:v29];
        }
      }
      long long v30 = brc_bread_crumbs();
      long long v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        int v32 = 138412802;
        long long v33 = v21;
        __int16 v34 = 2048;
        unint64_t v35 = [(BRCLocalItem *)self notifsRank];
        __int16 v36 = 2112;
        __int16 v37 = v30;
        _os_log_debug_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Queueing notification %@ for rank: %lld%@", (uint8_t *)&v32, 0x20u);
      }

      [v7 queueUpdate:v21];
    }
  }
LABEL_38:
}

- (void)triggerNotificationIfNeeded
{
  if (![(BRCLocalItem *)self isDead])
  {
    [(BRCLocalItem *)self _sendNotificationIfNeededWithDiffs:0 regather:1];
  }
}

- (void)markForceNotify
{
  self->_forceNotif = 1;
}

- (NSError)syncUpError
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(BRCClientZone *)self->_clientZone isSyncBlockedBecauseOSNeedsUpgrade])
  {
    uint64_t v3 = [(BRCClientZone *)self->_clientZone osNameRequiredToSync];
LABEL_5:
    BOOL v4 = (void *)v3;
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = _BRLocalizedStringWithFormat();

    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F281F8];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = v6;
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v10 = [v7 errorWithDomain:v8 code:3328 userInfo:v9];

    id v11 = v10;
    goto LABEL_7;
  }
  if ([(BRCLocalItem *)self needsOSUpgradeToSyncUp])
  {
    uint64_t v3 = [(BRCLocalItem *)self osNameNeededToSyncUp];
    goto LABEL_5;
  }
  id v11 = 0;
LABEL_7:
  return (NSError *)v11;
}

- (BOOL)fromReadOnlyDB
{
  db = self->_db;
  uint64_t v3 = [(BRCAccountSession *)self->_session readOnlyDB];
  LOBYTE(db) = db == v3;

  return (char)db;
}

- (unsigned)uploadStatus
{
  if ([(BRCLocalItem *)self isIdleOrRejected]) {
    return 3;
  }
  uint64_t v3 = [(BRCLocalItem *)self itemID];
  char v4 = [v3 isDocumentsFolder];

  if (v4) {
    return 3;
  }
  if ([(BRCLocalItem *)self syncUpState] == 4)
  {
    unsigned __int16 v5 = 2;
    if (![(BRCLocalItem *)self isDeadOrMissingInServerTruth])
    {
      unint64_t localDiffs = self->_localDiffs;
      uint64_t v8 = [(BRCAccountSession *)self->_session syncUpScheduler];
      uint64_t v9 = [v8 inFlightDiffsForItem:self] | localDiffs;

      if ((v9 & 0xEFFFFFFFFFFFF7FFLL) != 0) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
  else if ([(BRCLocalItem *)self isDocument])
  {
    return 1;
  }
  else
  {
    return 2;
  }
  return v5;
}

- (BOOL)_hasFieldChangesNotDiffed
{
  unint64_t localDiffs = self->_localDiffs;
  if (localDiffs != [(BRCLocalItem *)self->_orig localDiffs]) {
    return 1;
  }
  int v4 = [(BRCStatInfo *)self->_st type];
  unsigned __int16 v5 = [(BRCLocalItem *)self->_orig st];
  int v6 = [v5 type];

  if (v4 != v6) {
    return 1;
  }
  uint64_t v7 = [(BRCLocalStatInfo *)self->_st processingStamp];
  uint64_t v8 = [(BRCLocalItem *)self->_orig st];
  uint64_t v9 = [v8 processingStamp];

  if (v7 != v9) {
    return 1;
  }
  unint64_t notifsRank = self->_notifsRank;
  return notifsRank != [(BRCLocalItem *)self->_orig notifsRank];
}

- (void)_learnItemID:(id)a3 serverItem:(id)a4
{
  id v17 = a3;
  id v7 = a4;
  knownByServer = self->_knownByServer;
  self->_knownByServer = 0;

  self->_localDiffs &= ~0x8000000000000000;
  objc_storeStrong((id *)&self->_itemID, a3);
  self->_unint64_t sharingOptions = [v7 sharingOptions];
  uint64_t v9 = [v7 ownerKey];

  if (v9)
  {
    uint64_t v10 = [v7 ownerKey];
    ownerKey = self->_ownerKey;
    self->_ownerKey = v10;
  }
  char v12 = [v7 st];
  uint64_t v13 = [v12 creatorRowID];

  if (v13)
  {
    long long v14 = [v7 st];
    long long v15 = [v14 creatorRowID];
    [(BRCStatInfo *)self->_st setCreatorRowID:v15];
  }
  uint64_t v16 = [(BRCAccountSession *)self->_session applyScheduler];
  [v16 rescheduleSuspendedJobsMatching:self->_serverZone inState:22];
}

- (void)_restorePreviousGlobalID:(id)a3
{
  id v4 = a3;
  self->_unint64_t dbRowID = 0;
  session = self->_session;
  int v6 = [v4 zoneRowID];
  self->_serverZone = (BRCServerZone *)[(BRCAccountSession *)session serverZoneByRowID:v6];

  id v7 = [(BRCServerZone *)self->_serverZone clientZone];
  clientZone = self->_clientZone;
  self->_clientZone = v7;

  uint64_t v9 = self->_clientZone;
  uint64_t v10 = [v4 itemID];
  id v11 = [(BRCClientZone *)v9 serverItemByItemID:v10];

  char v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[BRCLocalItem _restorePreviousGlobalID:]();
  }

  if ([v11 isLive]
    && ([v11 isSharedToMeTopLevelItem] & 1) == 0
    && (long long v14 = self->_clientZone,
        [v11 parentItemIDOnServer],
        long long v15 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v14) = [(BRCClientZone *)v14 existsByItemID:v15],
        v15,
        v14))
  {
    uint64_t v16 = [v11 parentItemIDOnServer];
    [(BRCStatInfo *)self->_st setParentID:v16];

    id v17 = [(BRCClientZone *)self->_clientZone dbRowID];
    parentZoneRowID = self->_parentZoneRowID;
    self->_parentZoneRowID = v17;
  }
  else
  {
    if ([(BRCClientZone *)self->_clientZone isPrivateZone])
    {
      parentZoneRowID = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
      uint64_t v19 = [parentZoneRowID dbRowID];
      char v20 = self->_parentZoneRowID;
      self->_parentZoneRowID = v19;

      uint64_t v21 = [parentZoneRowID defaultAppLibrary];
      BOOL v22 = [v21 rootItemID];
      [(BRCStatInfo *)self->_st setParentID:v22];
    }
    else
    {
      uint64_t v23 = [(BRCLocalItem *)self appLibrary];
      int v24 = [v23 defaultClientZone];
      v25 = [v24 dbRowID];
      int v26 = self->_parentZoneRowID;
      self->_parentZoneRowID = v25;

      parentZoneRowID = [(BRCLocalItem *)self appLibrary];
      uint64_t v21 = [parentZoneRowID rootItemID];
      [(BRCStatInfo *)self->_st setParentID:v21];
    }
  }
  uint64_t v27 = [v4 itemID];
  [(BRCLocalItem *)self learnItemID:v27 serverItem:v11 path:0 markLost:0];

  [(BRCLocalItem *)self markMetadataLive];
}

- (void)_markAsDeadTombstoneWithPreviousGlobalID:(id)a3
{
  st = self->_st;
  id v5 = a3;
  [(BRCLocalStatInfo *)st _markClearedFromStage];
  [(BRCLocalItem *)self markDead];
  [(BRCLocalItem *)self _restorePreviousGlobalID:v5];

  int v6 = [(BRCStatInfo *)self->_st ckInfo];
  [v6 revertEtagsForOldZoneTombstone];

  self->_unsigned int syncUpState = 4;
}

- (void)_cheapCheckSavingItem
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.asDocument.desiredVersion%@", v2, v3, v4, v5, v6);
}

- (BOOL)saveToDBAndValidateLocalDiffs
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BRCLocalItem *)self orig];
  uint64_t v4 = [v3 localDiffs];

  BOOL v5 = [(BRCLocalItem *)self saveToDB];
  if (([(BRCLocalItem *)self localDiffs] | v4) != v4)
  {
    uint8_t v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = BRCItemFieldsPrettyPrint();
      int v10 = 138412546;
      id v11 = v9;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_fault_impl(&dword_1D353B000, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Item got saved before sync up and a new local diff bit was added: %@%@", (uint8_t *)&v10, 0x16u);
    }
  }
  return v5;
}

- (BOOL)saveToDB
{
  return [(BRCLocalItem *)self saveToDBForServerEdit:0 keepAliases:0];
}

- (BOOL)saveToDBForServerEdit:(BOOL)a3 keepAliases:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  p_session = &self->_session;
  uint64_t v8 = [(BRCAccountSession *)self->_session clientDB];
  [v8 assertOnQueue];

  uint64_t v9 = *p_session;
  memset(v29, 0, sizeof(v29));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem saveToDBForServerEdit:keepAliases:]", 2384, v29);
  int v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v31 = v29[0];
    __int16 v32 = 2112;
    long long v33 = self;
    __int16 v34 = 1024;
    BOOL v35 = v5;
    __int16 v36 = 2112;
    __int16 v37 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Saving item %@, serverUpdate = %d%@", buf, 0x26u);
  }

  orig = self->_orig;
  if (orig && !self->_syncUpState)
  {
    unsigned int v21 = [(BRCLocalItem *)orig syncUpState];
    if (v21) {
      char v13 = 1;
    }
    else {
      char v13 = v5;
    }
    if (v21 && !v5)
    {
      BOOL v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[BRCLocalItem saveToDBForServerEdit:keepAliases:]();
      }

      char v13 = 1;
    }
  }
  else
  {
    char v13 = v5;
  }
  if (!self->_forceDeletedAlready)
  {
    id v17 = [(BRCLocalStatInfo *)self->_st rawBouncedLogicalName];
    if (v17)
    {
      uint64_t v18 = [(BRCLocalStatInfo *)self->_st physicalName];
      if (!v18)
      {
        uint64_t v24 = [(BRCLocalItem *)self isDead];

        if (v24) {
          goto LABEL_13;
        }
        id v17 = brc_bread_crumbs();
        uint64_t v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem saveToDBForServerEdit:keepAliases:]();
        }
      }
    }
LABEL_13:
    db = self->_db;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke;
    v25[3] = &unk_1E69966B8;
    v25[4] = self;
    char v27 = v13;
    int v26 = v9;
    BOOL v28 = a4;
    char v16 = [(BRCPQLConnection *)db groupInTransaction:v25];

    goto LABEL_14;
  }
  uint64_t v14 = brc_bread_crumbs();
  long long v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[BRCLocalItem saveToDBForServerEdit:keepAliases:]();
  }

  char v16 = 1;
LABEL_14:
  __brc_leave_section(v29);

  return v16;
}

uint64_t __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 32) diffAgainstOriginalItem];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 96);
  if ([*(id *)(a1 + 32) isDirectory])
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v7 = [*v4 asDirectory];
      uint64_t v8 = [v7 mtime];
      uint64_t v9 = [*v4 orig];
      [v9 asDirectory];
      id v11 = v10 = v6;
      BOOL v12 = v8 != [v11 mtime];

      uint64_t v6 = v10;
      if (v12) {
        v5 |= 0x4000uLL;
      }
    }
  }
  if ((v5 & 0x100000000) != 0
    && [*((id *)*v4 + 11) isLost]
    && ([*v4 isLost] & 1) == 0)
  {
    int v13 = [*v4 isDead] ^ 1;
  }
  else
  {
    int v13 = 0;
  }
  if ([*v4 isDead])
  {
    if (*((unsigned char *)*v4 + 185))
    {
      uint64_t v14 = brc_bread_crumbs();
      char v15 = 1;
      char v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_15();
      }
LABEL_25:

      goto LABEL_26;
    }
    id v17 = [*((id *)*v4 + 9) processingStamp];

    if (v17)
    {
      uint64_t v14 = brc_bread_crumbs();
      char v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_14();
      }
      char v15 = 0;
      goto LABEL_25;
    }
    if ([*v4 isIdleOrRejected])
    {
      uint64_t v14 = brc_bread_crumbs();
      char v15 = 1;
      char v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_12();
      }
      goto LABEL_25;
    }
    if (([*v4 isKnownByServerOrInFlight] & 1) == 0)
    {
      uint64_t v14 = brc_bread_crumbs();
      char v15 = 1;
      char v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_13();
      }
      goto LABEL_25;
    }
  }
  char v15 = 0;
LABEL_26:
  int v18 = [*v4 isLost];
  if ((v5 & 0x40000000000000) != 0 && v18)
  {
    uint64_t v19 = brc_bread_crumbs();
    char v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_11();
    }

    [*v4 markLostWithoutBackoff];
  }
  if (*((void *)*v4 + 13))
  {
    unsigned int v21 = [*v4 orig];
    uint64_t v22 = v21[13];

    if (v22)
    {
      uint64_t v23 = brc_bread_crumbs();
      uint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_10();
      }

      if (v13 && ([*v4 isIdleOrRejected] & 1) == 0)
      {
        v25 = brc_bread_crumbs();
        int v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_9();
        }
        goto LABEL_42;
      }
      if ((v5 & 0x3FF7FFF) != 0)
      {
        v25 = brc_bread_crumbs();
        int v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_8();
        }
LABEL_42:

        v5 |= 0x8000000000000uLL;
        char v27 = (void *)*((void *)*v4 + 13);
        *((void *)*v4 + 13) = 0;

        [*((id *)*v4 + 3) scheduleSyncUp];
      }
    }
  }
  if (([*v4 isCrossZoneMoveTombstone] & 1) == 0
    && [*v4 _isInterestingUpdateForNotifsWithDiffs:v5])
  {
    BOOL v28 = +[BRCPersistedState loadFromClientStateInSession:*(void *)(a1 + 40)];
    *(void *)(*(void *)(a1 + 32) + 128) = [v28 allocateNotifRank];

    id v29 = [*(id *)(a1 + 32) clientZone];
    if (([v29 isSharedZone] & 1) == 0)
    {
      char v30 = [*((id *)*v4 + 11) isFSRoot];

      if (v30)
      {
LABEL_49:
        int v113 = 1;
        goto LABEL_51;
      }
      id v29 = [*((id *)*v4 + 11) parentFileID];
    }

    goto LABEL_49;
  }
  int v113 = 0;
LABEL_51:
  int v114 = v13;
  if (*(unsigned char *)(a1 + 48)) {
    goto LABEL_67;
  }
  int v31 = [*v4 isSharedToMeChildItem];
  if ((v5 & 0x40) != 0)
  {
    if (v31)
    {
      uint64_t v32 = [*((id *)*v4 + 20) etag];
      if (v32)
      {
        long long v33 = (void *)v32;
        char v111 = v15;
        id v112 = v3;
        __int16 v34 = [*((id *)*v4 + 9) logicalName];
        BOOL v35 = objc_msgSend(v34, "br_pathExtension");
        __int16 v36 = [*((id *)*v4 + 11) st];
        __int16 v37 = [v36 logicalName];
        uint64_t v38 = objc_msgSend(v37, "br_pathExtension");
        if (v35 == (void *)v38)
        {
        }
        else
        {
          __int16 v39 = (void *)v38;
          uint64_t v105 = v6;
          [*((id *)*v4 + 9) logicalName];
          id v40 = v110 = v33;
          objc_msgSend(v40, "br_pathExtension");
          __int16 v41 = v109 = v35;
          [*((id *)*v4 + 11) st];
          uint64_t v42 = v108 = v36;
          __int16 v43 = [v42 logicalName];
          objc_msgSend(v43, "br_pathExtension");
          unsigned int v44 = v107 = v34;
          char v106 = [v41 isEqualToString:v44];

          if ((v106 & 1) == 0)
          {
            __int16 v45 = brc_bread_crumbs();
            uint64_t v46 = brc_default_log();
            id v3 = v112;
            uint64_t v6 = v105;
            char v15 = v111;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
              __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_7();
            }

            if ([*((id *)*v4 + 9) favoriteRank])
            {
              v5 |= 0x1000uLL;
            }
            else if ([*((id *)*v4 + 9) lastUsedTime])
            {
              v5 |= 0x800uLL;
            }
            goto LABEL_66;
          }
          id v3 = v112;
          uint64_t v6 = v105;
        }
        char v15 = v111;
      }
    }
  }
LABEL_66:
  *((void *)*v4 + 12) |= [*v4 metadataSyncUpMask:1] & v5;
LABEL_67:
  id v47 = *v4;
  if (v15)
  {
    int v48 = [v47 _deleteFromDB:v3 keepAliases:*(unsigned __int8 *)(a1 + 49)];
    char v49 = [*(id *)(*(void *)(a1 + 32) + 72) fileID];
    uint64_t v50 = [v49 unsignedLongLongValue];
    id v51 = "Deleted from DB";
    goto LABEL_89;
  }
  if ([v47 needsInsert])
  {
    char v52 = +[BRCPersistedState loadFromClientStateInSession:*(void *)(a1 + 40)];
    uint64_t v53 = [v52 allocateItemRowID];

    if ([*(id *)(a1 + 32) isSharedToMeChildItem])
    {
      uint64_t v54 = [*((id *)*v4 + 1) containerScheduler];
      v55 = [v54 sideCarSyncPersistedState];
      int v56 = [v55 lastSyncDownDate];

      if (!v56)
      {
        BOOL v57 = brc_bread_crumbs();
        __int16 v58 = brc_default_log();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
          __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_5();
        }

        v59 = [*((id *)*v4 + 1) containerScheduler];
        uint64_t v60 = objc_msgSend(MEMORY[0x1E4F1A218], "br_syncDownInitial");
        [v59 scheduleSyncDownForSideCarWithGroup:v60];
      }
    }
    v61 = brc_bread_crumbs();
    uint64_t v62 = brc_default_log();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
      __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_4((uint64_t)v61, v53, v62);
    }

    int v48 = [*v4 _insertInDB:v3 dbRowID:v53];
    id v51 = "Inserted into DB";
    if ((v5 & 0x400000000) == 0)
    {
LABEL_78:
      if ((v48 & 1) == 0) {
        goto LABEL_93;
      }
LABEL_99:
      [*v4 _cheapCheckSavingItem];
      if (v114)
      {
        uint64_t v73 = [*v4 appLibrary];
        id v74 = *v4;
        v75 = [*v4 orig];
        v76 = [v75 appLibrary];
        if (v76)
        {
          [v73 didFindLostItem:v74 oldAppLibrary:v76];
        }
        else
        {
          v77 = [*v4 appLibrary];
          [v73 didFindLostItem:v74 oldAppLibrary:v77];
        }
      }
      v78 = brc_bread_crumbs();
      v79 = brc_default_log();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        BRCItemFieldsPrettyPrint();
        id v91 = (id)objc_claimAutoreleasedReturnValue();
        v92 = v91;
        int v93 = *(unsigned __int8 *)(a1 + 48);
        *(_DWORD *)buf = 136316162;
        v116 = v51;
        if (v113) {
          v94 = "YES";
        }
        else {
          v94 = "NO";
        }
        __int16 v117 = 2112;
        if (v93) {
          v95 = "YES";
        }
        else {
          v95 = "NO";
        }
        id v118 = v91;
        __int16 v119 = 2080;
        v120 = v94;
        __int16 v121 = 2080;
        v122 = v95;
        __int16 v123 = 2112;
        v124 = v78;
        _os_log_debug_impl(&dword_1D353B000, v79, OS_LOG_TYPE_DEBUG, "[DEBUG] %s. changedFields:%@ sendNotif:%s serverUpdate:%s%@", buf, 0x34u);
      }
      if (v113)
      {
        [*v4 _sendNotificationIfNeededWithDiffs:v5 regather:0];
        v80 = *((id *)*v4 + 11);
        BOOL v81 = (([v80 isAlmostDead] & 1) != 0 || (objc_msgSend(*v4, "isAlmostDead") & 1) == 0)
           && (([v80 isDead] & 1) != 0 || (objc_msgSend(*v4, "isDead") & 1) == 0)
           && (!v80 || !v80[112] || *((unsigned char *)*v4 + 112) != 0);
        int v82 = [*v4 _isIndexable];
        if (!v81 && v82)
        {
          v83 = [v80 fileObjectID];
          if (v83)
          {
            v84 = [*((id *)*v4 + 1) recentsEnumerator];
            uint64_t v85 = *((void *)*v4 + 16);
            if ([*v4 isAlmostDead]) {
              uint64_t v86 = 0;
            }
            else {
              uint64_t v86 = [*v4 isDead] ^ 1;
            }
            [v84 dropItemWithFileObjectID:v83 notifRank:v85 itemIsLive:v86];
          }
          else
          {
            if (([v80 isDead] & 1) != 0
              || ([v80 isAlmostDead] & 1) != 0
              || [v80 isReserved])
            {
              v84 = brc_bread_crumbs();
              v87 = brc_default_log();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG)) {
                __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_1(v4);
              }
            }
            else
            {
              v84 = brc_bread_crumbs();
              v87 = brc_default_log();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT)) {
                __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_2();
              }
            }
          }
        }
      }
      uint64_t v88 = [*v4 copy];
      v70 = (void *)*((void *)*v4 + 11);
      *((void *)*v4 + 11) = v88;
      uint64_t v72 = 1;
      goto LABEL_131;
    }
  }
  else
  {
    if (!v5 && ![*v4 _hasFieldChangesNotDiffed])
    {
      id v51 = "Ignored";
      goto LABEL_99;
    }
    if ([*v4 isSharedToMeTopLevelItem] && (*((_WORD *)*v4 + 48) & 0x1A69) != 0)
    {
      v63 = [*v4 parentClientZone];
      if ([v63 isPrivateZone] && (uint64_t v64 = *v4, (*((_WORD *)*v4 + 48) & 0x1A60) == 0))
      {
        v98 = (void *)v64[1];
        v99 = [*v4 parentClientZone];
        [v99 serverZone];
        v101 = uint64_t v100 = v6;
        v102 = [v98 serverAliasItemForSharedItem:v64 inZone:v101];

        uint64_t v6 = v100;
        if (!v102)
        {
          v103 = brc_bread_crumbs();
          v104 = brc_default_log();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG)) {
            __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_6();
          }

          *((void *)*v4 + 12) &= 0xFFFFFFFFFFFF8002;
        }
      }
      else
      {
      }
    }
    int v48 = [*v4 _updateInDB:v3 diffs:v5];
    id v51 = "Saved into DB";
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_78;
    }
  }
  char v49 = [*((id *)*v4 + 11) st];
  uint64_t v65 = [v49 fileID];
  uint64_t v50 = [v65 unsignedLongLongValue];

LABEL_89:
  if (!v50)
  {
    if (!v48) {
      goto LABEL_93;
    }
    goto LABEL_99;
  }
  int v66 = [*(id *)(a1 + 40) stageRegistry];
  uint64_t v67 = [NSNumber numberWithUnsignedLongLong:v50];
  [v66 forgetWatchedLockedFileID:v67];

  if (v48) {
    goto LABEL_99;
  }
LABEL_93:
  *((void *)*v4 + 12) = v6;
  brc_bread_crumbs();
  objc_super v68 = (char *)objc_claimAutoreleasedReturnValue();
  id v69 = brc_default_log();
  if (os_log_type_enabled(v69, (os_log_type_t)0x90u))
  {
    v96 = [*v4 itemID];
    v97 = [v3 lastError];
    *(_DWORD *)buf = 138412802;
    v116 = v96;
    __int16 v117 = 2112;
    id v118 = v97;
    __int16 v119 = 2112;
    v120 = v68;
    _os_log_error_impl(&dword_1D353B000, v69, (os_log_type_t)0x90u, "[ERROR] failed to save item %@ to DB: %@%@", buf, 0x20u);
  }
  v70 = brc_bread_crumbs();
  __int16 v71 = brc_default_log();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT)) {
    __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_3();
  }

  uint64_t v72 = 0;
LABEL_131:

  v89 = *v4;
  if (*((unsigned char *)*v4 + 185))
  {
    v89[186] = v72;
    v89 = *v4;
  }
  v89[187] = 0;

  return v72;
}

- (BOOL)_isIndexable
{
  if ([(BRCLocalItem *)self isDocument]) {
    return 1;
  }
  return [(BRCLocalItem *)self isDirectory];
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    if ([(BRCLocalItem *)self isDocument]) {
      unint64_t v32 = 4093607935;
    }
    else {
      unint64_t v32 = 4026564607;
    }
    goto LABEL_30;
  }
  itemID = self->_itemID;
  id v7 = [v4 itemID];
  uint64_t v8 = itemID;
  uint64_t v9 = v7;
  if (v8 == v9)
  {
  }
  else
  {
    uint64_t v10 = v9;
    if (!v9)
    {

LABEL_9:
      uint64_t v12 = 0x80000000;
      goto LABEL_10;
    }
    BOOL v11 = [(BRCItemID *)v8 isEqual:v9];

    if (!v11) {
      goto LABEL_9;
    }
  }
  uint64_t v12 = 0;
LABEL_10:
  ownerKey = self->_ownerKey;
  uint64_t v14 = [v5 ownerKey];
  char v15 = ownerKey;
  char v16 = v14;
  id v17 = v16;
  if (v15 == v16)
  {
    int v18 = 0;
  }
  else if (v16)
  {
    int v18 = [(BRCUserRowID *)v15 isEqual:v16] ^ 1;
  }
  else
  {
    int v18 = 1;
  }

  if (v18) {
    uint64_t v19 = v12 | 0x20000000;
  }
  else {
    uint64_t v19 = v12;
  }
  unint64_t sharingOptions = self->_sharingOptions;
  if (sharingOptions == [v5 sharingOptions]) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v19 | 0x40000000;
  }
  sideCarCKInfo = self->_sideCarCKInfo;
  uint64_t v23 = [v5 sideCarInfo];
  uint64_t v24 = [v23 ckInfo];
  v25 = sideCarCKInfo;
  int v26 = v24;
  char v27 = v26;
  if (v25 == v26)
  {
    int v28 = 0;
  }
  else if (v26)
  {
    int v28 = ![(BRFieldCKInfo *)v25 isEqual:v26];
  }
  else
  {
    int v28 = 1;
  }

  if (v28) {
    uint64_t v29 = v21 | 0x100000000000000;
  }
  else {
    uint64_t v29 = v21;
  }
  st = self->_st;
  int v31 = [v5 st];
  unint64_t v32 = [(BRCStatInfo *)st diffAgainst:v31] | v29;

LABEL_30:
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem]
    && [v5 isSharedToMeTopLevelItem])
  {
    unint64_t v33 = v32 & 0xFFFFFFFFFFFFFFDFLL;
    __int16 v34 = [(BRCAccountSession *)self->_session serverAliasItemForSharedItem:self db:self->_db];
    if (v34)
    {
      BOOL v35 = [(BRCLocalItem *)self asSharedToMeTopLevelItem];
      uint64_t v36 = [v35 diffAgainstServerAliasItem:v34] & 0x20;
    }
    else
    {
      __int16 v37 = [(BRCLocalItem *)self st];
      uint64_t v38 = [v37 parentID];
      __int16 v39 = [(BRCAppLibrary *)self->_appLibrary documentsFolderItemID];
      int v40 = [v38 isEqualToItemID:v39];

      if (v40) {
        uint64_t v36 = 0;
      }
      else {
        uint64_t v36 = 32;
      }
    }
    unint64_t v32 = v36 | v33;
  }
  return v32;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    unint64_t v38 = 0xFF007FF3FF7FFFLL;
    goto LABEL_51;
  }
  uint64_t v6 = (void *)v4[6];
  id v7 = self->_itemID;
  uint64_t v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  uint64_t v9 = v8;
  if (v8)
  {
    BOOL v10 = [(BRCItemID *)v7 isEqual:v8];

    if (!v10) {
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v11 = 0;
    goto LABEL_10;
  }

LABEL_9:
  uint64_t v11 = 0x80000000;
LABEL_10:
  uint64_t v12 = (void *)v5[8];
  int v13 = self->_ownerKey;
  uint64_t v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_17;
  }
  char v15 = v14;
  if (!v14)
  {

    goto LABEL_16;
  }
  char v16 = [(BRCUserRowID *)v13 isEqual:v14];

  if ((v16 & 1) == 0) {
LABEL_16:
  }
    v11 |= 0x20000000uLL;
LABEL_17:
  if (self->_sharingOptions == v5[17]) {
    uint64_t v17 = v11;
  }
  else {
    uint64_t v17 = v11 | 0x40000000;
  }
  if (self->_syncUpState != *((_DWORD *)v5 + 20)) {
    v17 |= 0x20000000000000uLL;
  }
  if (self->_isUserVisible == *((unsigned __int8 *)v5 + 112)) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = v17 | 0x80000000000000;
  }
  if ((v18 & 0x40000000000000) == 0)
  {
    uint64_t v19 = [(BRCLocalItem *)self appLibrary];
    char v20 = [v19 dbRowID];
    uint64_t v21 = [v5 appLibrary];
    uint64_t v22 = [v21 dbRowID];
    id v23 = v20;
    id v24 = v22;
    v25 = v24;
    if (v23 == v24) {
      int v26 = 0;
    }
    else {
      int v26 = v24 ? [v23 isEqual:v24] ^ 1 : 1;
    }

    if (v26) {
      v18 |= 0x40000000000000uLL;
    }
  }
  if ((v18 & 0x8000000000000) == 0)
  {
    char v27 = (void *)v5[13];
    int v28 = self->_minimumSupportedOSRowID;
    uint64_t v29 = v27;
    if (v28 == v29)
    {

      goto LABEL_41;
    }
    char v30 = v29;
    if (v29)
    {
      char v31 = [(NSNumber *)v28 isEqual:v29];

      if (v31) {
        goto LABEL_41;
      }
    }
    else
    {
    }
    v18 |= 0x8000000000000uLL;
  }
LABEL_41:
  unint64_t v32 = (void *)v5[20];
  unint64_t v33 = self->_sideCarCKInfo;
  __int16 v34 = v32;
  if (v33 == v34)
  {
  }
  else
  {
    BOOL v35 = v34;
    if (v34)
    {
      BOOL v36 = [(BRFieldCKInfo *)v33 isEqual:v34];

      if (v36) {
        goto LABEL_48;
      }
    }
    else
    {
    }
    v18 |= 0x100000000000000uLL;
  }
LABEL_48:
  unint64_t v37 = [(BRCLocalStatInfo *)self->_st diffAgainstLocalInfo:v5[9]];
  unint64_t v38 = v37 | v18;
  if (((v37 | v18) & 8) != 0
    && ![(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    v38 &= ~8uLL;
  }
LABEL_51:

  return v38;
}

- (unint64_t)diffAgainstOriginalItem
{
  if (self->_orig) {
    return -[BRCLocalItem diffAgainstLocalItem:](self, "diffAgainstLocalItem:");
  }
  else {
    return 0xFF007FF3FF7FFFLL;
  }
}

+ (BOOL)computeUserVisibleStatusOfLiveItemWithParentVisible:(BOOL)a3 parentIsNonDesktopRoot:(BOOL)a4 parentScope:(unsigned __int8)a5 itemFilename:(id)a6 parentFilename:(id)a7 appLibrary:(id)a8
{
  int v10 = a5;
  BOOL v11 = a4;
  int v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  if (([v15 supportsSpotlightIndexing] & 1) == 0)
  {
    if ([v15 isCloudDocsAppLibrary])
    {
      uint64_t v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:]();
      }
    }
    goto LABEL_12;
  }
  if (v10 == 1 && v11 && ([v13 isEqualToString:*MEMORY[0x1E4F59400]] & 1) != 0) {
    goto LABEL_10;
  }
  if (v10 == 1 && v12)
  {
    uint64_t v19 = brc_bread_crumbs();
    char v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:]();
    }
  }
  if ([v13 hasPrefix:@"."])
  {
LABEL_12:
    LOBYTE(v12) = 0;
    goto LABEL_13;
  }
  if (v10 == 2 && v11)
  {
LABEL_10:
    LOBYTE(v12) = 1;
    goto LABEL_13;
  }
  if (v10 == 3) {
    LOBYTE(v12) = [v14 isEqualToString:*MEMORY[0x1E4F59468]];
  }
LABEL_13:

  return v12;
}

- (NSDictionary)extendedAttributes
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__16;
  uint64_t v18 = __Block_byref_object_dispose__16;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__BRCLocalItem_extendedAttributes__block_invoke;
  v13[3] = &unk_1E69966E0;
  v13[4] = &v14;
  id v3 = (void (**)(void, void))MEMORY[0x1D94389C0](v13);
  st = self->_st;
  uint64_t v5 = [(BRCAccountSession *)self->_session stageRegistry];
  uint64_t v6 = [(BRCStatInfo *)st lazyXattrWithStageRegistry:v5];
  ((void (**)(void, void *))v3)[2](v3, v6);

  if ([(BRCLocalItem *)self isDocument])
  {
    id v7 = [(BRCLocalItem *)self asDocument];
    uint64_t v8 = [v7 currentVersion];
    uint64_t v9 = [(BRCAccountSession *)self->_session stageRegistry];
    int v10 = [v8 lazyXattrWithStageRegistry:v9];
    ((void (**)(void, void *))v3)[2](v3, v10);
  }
  if ([(id)v15[5] count]) {
    id v11 = (id)v15[5];
  }
  else {
    id v11 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return (NSDictionary *)v11;
}

void __34__BRCLocalItem_extendedAttributes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [[BRFieldXattrBlob alloc] initWithData:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [(BRFieldXattrBlob *)v4 xattrs];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 value];
          int v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          id v13 = [v10 name];
          [v12 setObject:v11 forKeyedSubscript:v13];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)markForceNeedsSyncUp
{
  self->_localDiffs |= 0x3FFEuLL;
  [(BRCLocalItem *)self _markNeedsSyncingUp];
}

- (void)markForceRejected
{
  self->_unsigned int syncUpState = 1;
}

- (void)markRejectedItemRemotelyRevived
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _syncUpState == BRC_SUS_REJECTED%@", v2, v3, v4, v5, v6);
}

- (BOOL)forceNeedsSyncUpWithoutDiffs
{
  BOOL v3 = [(BRCLocalItem *)self hasShareIDAndIsOwnedByMe];
  if (v3)
  {
    if (([(BRCLocalItem *)self sharingOptions] & 0x48) != 0)
    {
      BOOL v3 = [(BRCLocalItem *)self isInTrashScope];
      if (v3)
      {
        uint64_t v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          -[BRCLocalItem forceNeedsSyncUpWithoutDiffs]();
        }

        LOBYTE(v3) = 1;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_markNeedsSyncingUp
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Ignoring sync up request on item needing OOB_SYNC_ACK with no field changes%@", v2, v3, v4, v5, v6);
}

- (void)markNeedsUploadOrSyncingUp
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(BRCLocalItem *)self isRejected])
  {
LABEL_17:
    [(BRCLocalItem *)self _markNeedsSyncingUp];
    return;
  }
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    uint64_t v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      long long v15 = self;
      __int16 v16 = 2112;
      long long v17 = v3;
      _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Not forcing sync up of share-to-me top level item %@%@", (uint8_t *)&v14, 0x16u);
    }

    self->_unint64_t localDiffs = 0;
    return;
  }
  if (![(BRCLocalItem *)self isSharedToMeChildItem])
  {
LABEL_13:
    unint64_t v11 = self->_localDiffs | [(BRCLocalItem *)self diffAgainstOriginalItem];
    if ((v11 & [(BRCLocalItem *)self metadataSyncUpMask:0]) != 0)
    {
      int v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        long long v15 = self;
        __int16 v16 = 2112;
        long long v17 = v12;
        _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejected item %@ has meaningful local diffs.  Forcing re-sync of all fields%@", (uint8_t *)&v14, 0x16u);
      }

      self->_unint64_t localDiffs = 0xFF007FF3FF7FFFLL;
    }
    goto LABEL_17;
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", self);
  uint8_t v6 = objc_msgSend(v5, "brc_shareItemID");
  uint64_t v7 = [(BRCClientZone *)self->_clientZone serverItemByItemID:v6];
  uint64_t v8 = v7;
  if (v7 && ![v7 isDead])
  {

    goto LABEL_13;
  }
  uint64_t v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    long long v15 = self;
    __int16 v16 = 2112;
    long long v17 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Not forcing sync up of share-to-me child item with a dead root share %@%@", (uint8_t *)&v14, 0x16u);
  }

  self->_unint64_t localDiffs = 0;
}

- (void)scheduleSyncDownForOOBModifyRecordsAck
{
  self->_localDiffs |= 0x1000000000000000uLL;
  [(BRCClientZone *)self->_clientZone scheduleSyncDownForOOBModifyRecordsAck];
}

- (void)prepareForSyncUpSideCarZone
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isReadAndUploaded || self.isKnownByServerOrInFlight%@", v2, v3, v4, v5, v6);
}

- (void)prepareForSyncUpInZone:(id)a3
{
  id v4 = a3;
  if (([(BRCPQLConnection *)self->_db isBatchSuspended] & 1) == 0)
  {
    int v10 = brc_bread_crumbs();
    unint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  if (![(BRCLocalItem *)self isReadAndUploaded]
    && ![(BRCLocalItem *)self isKnownByServerOrInFlight])
  {
    int v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem prepareForSyncUpSideCarZone]();
    }
  }
  unint64_t v5 = [(BRCLocalItem *)self maskForDiffsToSyncUpForZone:v4 sideCarZone:0 whenClearing:1];
  unint64_t localDiffs = self->_localDiffs;
  self->_unint64_t localDiffs = localDiffs & ~v5;
  if ([v4 isPrivateZone]
    && [(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    self->_localDiffs &= 0xFFFFFFFFFFFF8000;
  }
  unint64_t v7 = localDiffs & v5;
  uint64_t v8 = [(BRCAccountSession *)self->_session syncUpScheduler];
  uint64_t v9 = [v4 dbRowID];
  [v8 prepareItemForSyncUp:self inFlightDiffs:v7 inZone:v9];
}

- (void)markLatestSyncRequestFailedInZone:(id)a3
{
  id v4 = a3;
  if (([(BRCPQLConnection *)self->_db isBatchSuspended] & 1) == 0)
  {
    int v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  unint64_t v5 = [(BRCAccountSession *)self->_session syncUpScheduler];
  uint64_t v6 = [v5 finishSyncUpForItem:self inZone:v4 success:0];

  unsigned int syncUpState = self->_syncUpState;
  if (syncUpState >= 2)
  {
    self->_localDiffs |= v6;
    if (syncUpState == 4)
    {
      [(BRCLocalItem *)self createSyncUpJob];
      int v8 = objc_msgSend(v4, "br_isEqualToNumber:", &unk_1F2B26EB0);
      session = self->_session;
      if (v8)
      {
        int v10 = [(BRCAccountSession *)session containerScheduler];
        [v10 scheduleSyncUpForSideCar];
      }
      else
      {
        int v10 = [(BRCAccountSession *)session serverZoneByRowID:v4];
        unint64_t v11 = [v10 clientZone];
        [v11 scheduleSyncUp];
      }
    }
  }
}

- (void)markLatestSyncRequestRejectedInZone:(id)a3
{
  db = self->_db;
  id v5 = a3;
  if (([(BRCPQLConnection *)db isBatchSuspended] & 1) == 0)
  {
    int v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  uint64_t v6 = [(BRCAccountSession *)self->_session syncUpScheduler];
  [v6 finishSyncUpForItem:self inZone:v5 success:1];

  if ([(BRCItemID *)self->_itemID isDocumentsFolder])
  {
    unint64_t v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem markLatestSyncRequestRejectedInZone:]();
    }

    [(BRCAppLibrary *)self->_appLibrary clearStateBits:0x4000000];
LABEL_10:
    self->_unint64_t localDiffs = 0xFF007FF3FF7FFFLL;
    [(BRCLocalItem *)self createSyncUpJob];
    return;
  }
  unint64_t localDiffs = self->_localDiffs;
  if (([(BRCLocalItem *)self metadataSyncUpMask:0] & localDiffs) != 0)
  {
    int v10 = brc_bread_crumbs();
    unint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem markLatestSyncRequestRejectedInZone:]();
    }

    goto LABEL_10;
  }
  self->_unsigned int syncUpState = 1;
}

- (BOOL)markLatestSyncRequestAcknowledgedInZone:(id)a3
{
  db = self->_db;
  id v5 = a3;
  if (([(BRCPQLConnection *)db isBatchSuspended] & 1) == 0)
  {
    char v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  uint64_t v6 = [(BRCAccountSession *)self->_session syncUpScheduler];
  [v6 finishSyncUpForItem:self inZone:v5 success:1];

  unint64_t v7 = [(BRCAccountSession *)self->_session syncUpScheduler];
  int v8 = [v7 isItemPendingSyncUp:self];

  if (v8)
  {
    uint64_t v9 = brc_bread_crumbs();
    int v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:]();
    }

    if ([(BRCLocalItem *)self isSharedToMeChildItem])
    {
      unint64_t v11 = [(BRCAccountSession *)self->_session containerScheduler];
      [v11 scheduleSyncUpForSideCar];
LABEL_16:
    }
  }
  else
  {
    unint64_t localDiffs = self->_localDiffs;
    if ((([(BRCLocalItem *)self metadataSyncUpMask:0] | 0x1000000000000000) & localDiffs) != 0)
    {
      unsigned int syncUpState = self->_syncUpState;
      if (syncUpState == 4)
      {
        int v14 = brc_bread_crumbs();
        long long v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:]();
        }

        [(BRCLocalItem *)self createSyncUpJob];
      }
      else if (!syncUpState)
      {
        uint64_t v22 = brc_bread_crumbs();
        id v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:]();
        }
      }
    }
    else
    {
      self->_unsigned int syncUpState = 0;
    }
    __int16 v16 = [(BRCLocalItem *)self appLibrary];
    int v17 = [v16 shouldEvictUploadedItems];

    if (v17)
    {
      unint64_t v11 = [(BRCLocalItem *)self appLibrary];
      uint64_t v18 = [v11 tracker];
      [(BRCLocalItem *)self evictInTask:v18 options:5 error:0];

      goto LABEL_16;
    }
  }
  return v8 ^ 1;
}

- (void)resetWhileKeepingClientItemsAndWantsUnlink:(BOOL)a3
{
  self->_orig->_unsigned int syncUpState = 0;
  [(BRCLocalItem *)self markItemForgottenByServer];
  self->_localDiffs |= 0x400000000000000uLL;
}

- (void)markItemForgottenByServer
{
  knownByServer = self->_knownByServer;
  self->_knownByServer = 0;

  st = self->_st;
  [(BRCStatInfo *)st setCkInfo:0];
}

- (void)handleUnknownItemError
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BRCStatInfo *)self->_st ckInfo];
  if (v3 || ![(BRCLocalItem *)self isSharedToMeChildItem])
  {

    goto LABEL_8;
  }
  id v4 = [(BRCClientZone *)self->_clientZone mangledID];
  id v5 = +[BRCUserDefaults defaultsForMangledID:v4];
  int v6 = [v5 changeItemIDOnUnknownItem];

  if (!v6)
  {
LABEL_8:
    [(BRCLocalItem *)self markItemForgottenByServer];
    goto LABEL_9;
  }
  unint64_t v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    int v12 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Unknown item must need an itemID change%@", (uint8_t *)&v11, 0xCu);
  }

  unint64_t sharingOptions = self->_sharingOptions;
  int v10 = objc_alloc_init(BRCItemID);
  [(BRCLocalItem *)self learnItemID:v10 serverItem:0 path:0 markLost:0];

  self->_unint64_t sharingOptions = sharingOptions;
  self->_localDiffs |= 0x8000000000000000;
LABEL_9:
  [(BRCClientZone *)self->_clientZone scheduleSyncDownFirst];
}

- (void)markDead
{
  uint64_t v3 = [(BRCLocalStatInfo *)self->_st stagedFileID];

  if (v3) {
    [(BRCLocalItem *)self clearFromStage];
  }
  BOOL v4 = [(BRCLocalItem *)self isSharedToMeTopLevelItem];
  st = self->_st;
  if (v4)
  {
    int v6 = [(BRCAppLibrary *)self->_appLibrary documentsFolderItemID];
    [(BRCLocalStatInfo *)st _markDeadAsSharedTopLevelItemWithDocumentsItemID:v6];
  }
  else
  {
    [(BRCLocalStatInfo *)self->_st _markDead];
  }
  [(BRCLocalStatInfo *)self->_st _moveItemAsideWithUUIDString];
  self->_isUserVisible = 0;
}

- (void)markNeedsDeleteForRescheduleOfItem:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(BRCAccountSession *)self->_session applyScheduler];
  if (![(BRCLocalItem *)self isDead]) {
    [(BRCLocalItem *)self markDead];
  }
  self->_forceDelete = 1;
  if (v5) {
    [v4 createApplyJobFromServerItem:v5 localItem:0 state:1 kind:1];
  }
}

- (void)markNeedsDeleteWhenAlreadyDeadInServerTruth
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isDead && self.isDeadOrMissingInServerTruth%@", v2, v3, v4, v5, v6);
}

- (void)markNeedsDeleteForItemIDTransfer
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isDead%@", v2, v3, v4, v5, v6);
}

- (void)moveAsideLocally
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _st.state == BRC_ITEM_STATE_TOMBSTONE || _st.state == BRC_ITEM_STATE_LOST || _st.state == BRC_ITEM_STATE_LOST_ZOMBIE%@", v2, v3, v4, v5, v6);
}

- (void)markRemovedFromFilesystemForServerEdit:(BOOL)a3
{
  [(BRCLocalItem *)self markDead];
  if (!a3)
  {
    if ([(BRCLocalItem *)self isSharedToMeChildItem]
      && [(BRCLocalItem *)self isKnownByServer])
    {
      clientZone = self->_clientZone;
      uint8_t v6 = [(BRCLocalItem *)self parentItemIDInZone];
      unint64_t v7 = [(BRCClientZone *)clientZone itemByItemID:v6];

      if (([v7 isLost] & 1) == 0)
      {
        int v8 = [v7 db];
        uint64_t v9 = [v7 itemID];
        int v10 = [v7 clientZone];
        int v11 = [v10 dbRowID];
        int v12 = (void *)[v8 numberWithSQL:@"SELECT 1 FROM client_items WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@ AND item_state = 0", v9, v11];

        if ([v12 BOOLValue])
        {
          uint64_t v13 = brc_bread_crumbs();
          int v14 = brc_default_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            -[BRCLocalItem markRemovedFromFilesystemForServerEdit:]();
          }

          [v7 markLostClearGenerationID:0 backoffMode:1];
          [v7 saveToDB];
        }
      }
    }
    [(BRCLocalItem *)self markNeedsUploadOrSyncingUp];
  }
}

- (void)updateStatMetadataFromServerItem:(id)a3
{
  st = self->_st;
  id v4 = [a3 st];
  [(BRCLocalStatInfo *)st _updateStatMeta:v4];
}

- (void)updateItemMetadataFromServerItem:(id)a3 appliedSharingPermission:(BOOL)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if (!a4
    && (int sharingOptions = self->_sharingOptions,
        (([v6 sharingOptions] ^ sharingOptions) & 0x20) != 0))
  {
    unint64_t v9 = [v7 sharingOptions] ^ 0x20;
  }
  else
  {
    unint64_t v9 = [v7 sharingOptions];
  }
  self->_int sharingOptions = v9;
  if ((v9 & 4) == 0)
  {
    parentZoneRowID = self->_parentZoneRowID;
    int v11 = [(BRCClientZone *)self->_clientZone dbRowID];
    LODWORD(parentZoneRowID) = [(BRCZoneRowID *)parentZoneRowID br_isEqualToNumber:v11];

    if (parentZoneRowID)
    {
      int v12 = brc_bread_crumbs();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[BRCLocalItem updateItemMetadataFromServerItem:appliedSharingPermission:]();
      }

      int v14 = [(BRCClientZone *)self->_clientZone db];
      long long v15 = [v7 parentItemIDOnFS];
      __int16 v16 = [(BRCClientZone *)self->_clientZone dbRowID];
      int v17 = (void *)[v14 numberWithSQL:@"SELECT item_sharing_options FROM client_items WHERE item_id = %@ AND zone_rowid = %@", v15, v16];

      self->_int sharingOptions = self->_sharingOptions & 0xFFFFFFFFFFFFFF83 | [v17 longLongValue] & 0x78;
    }
  }
  uint64_t v18 = [v7 ownerKey];
  ownerKey = self->_ownerKey;
  self->_ownerKey = v18;

  [(BRCLocalItem *)self _fixSpotlightAttributeIfNecessaryAtPath:0];
}

- (id)computedDestinationFilenameFromServerItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 st];
  id v6 = [v5 logicalName];
  unint64_t v7 = [(BRCLocalItem *)self st];
  int v8 = [v7 logicalNameWithoutLocalBounce];
  if ([v6 isEqualToString:v8])
  {
    unint64_t v9 = [v4 parentItemIDOnFS];
    int v10 = [(BRCLocalItem *)self st];
    int v11 = [v10 parentID];
    int v12 = [v9 isEqualToItemID:v11];

    if (v12)
    {
      uint64_t v13 = [(BRCLocalItem *)self st];
      uint64_t v14 = [v13 logicalName];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v13 = [v4 st];
  uint64_t v14 = [v13 representableName];
LABEL_6:
  long long v15 = (void *)v14;

  return v15;
}

- (void)updateStructuralCKInfoFromServerItem:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 st];
  id v6 = [v5 ckInfo];

  unint64_t v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = [v6 etag];
    int v23 = 138412802;
    id v24 = v18;
    __int16 v25 = 2112;
    id v26 = v4;
    __int16 v27 = 2112;
    int v28 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] updating st-etag:%@ from server item: %@%@", (uint8_t *)&v23, 0x20u);
  }
  if (!v4)
  {
    uint64_t v19 = brc_bread_crumbs();
    char v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:]();
    }
  }
  if (([v4 isSharedToMeTopLevelItem] & 1) == 0 && !v6)
  {
    uint64_t v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:]();
    }
  }
  if ([(BRCLocalItem *)self isDocumentBeingCopiedToNewZone])
  {
    unint64_t v9 = [(BRCStatInfo *)self->_st ckInfo];
    int v10 = [v9 etagBeforeCrossZoneMove];
    [v6 setEtagBeforeCrossZoneMove:v10];
  }
  [(BRCLocalStatInfo *)self->_st _setCKInfo:v6];
  int v11 = [v4 st];
  int v12 = [v11 creatorRowID];
  [(BRCStatInfo *)self->_st setCreatorRowID:v12];

  if ([(BRCLocalItem *)self isSharedToMeChildItem])
  {
    uint64_t v13 = [v4 sideCarInfo];
    uint64_t v14 = [v13 ckInfo];
    sideCarCKInfo = self->_sideCarCKInfo;
    self->_sideCarCKInfo = v14;

    __int16 v16 = brc_bread_crumbs();
    int v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:]();
    }
  }
}

- (BOOL)needsReading
{
  return self->_syncUpState == 2;
}

- (BOOL)needsUpload
{
  return self->_syncUpState == 3;
}

- (BOOL)needsSyncUp
{
  return self->_syncUpState == 4;
}

- (BOOL)isReadAndUploaded
{
  unsigned int syncUpState = self->_syncUpState;
  if (syncUpState >= 5)
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem isReadAndUploaded]();
    }

    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x13u >> syncUpState) & 1;
  }
  return v3;
}

- (BOOL)isIdleOrRejected
{
  return self->_syncUpState < 2;
}

- (BOOL)isRejected
{
  return self->_syncUpState == 1;
}

- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7
{
  int v10 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  memset(v37, 0, sizeof(v37));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:]", 3446, v37);
  long long v15 = brc_bread_crumbs();
  __int16 v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = v37[0];
    BOOL v36 = [(BRCLocalItem *)self appLibrary];
    BOOL v35 = [v36 logName];
    uint64_t v29 = [(BRCLocalItem *)self itemID];
    uint64_t v30 = BRCPrettyPrintBitmap();
    *(_DWORD *)buf = 134219010;
    __int16 v39 = (const char *)v28;
    __int16 v40 = 2112;
    __int16 v41 = v35;
    __int16 v42 = 2112;
    __int16 v43 = v29;
    __int16 v44 = 2112;
    __int16 v34 = (void *)v30;
    uint64_t v45 = v30;
    __int16 v46 = 2112;
    id v47 = v15;
    _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx request to download client item %@:%@ with options %@%@", buf, 0x34u);
  }
  if ((~v10 & 9) == 0)
  {
    unint64_t v32 = brc_bread_crumbs();
    unint64_t v33 = brc_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:]();
    }
  }
  BOOL v17 = [(BRCLocalItem *)self isDead];
  if (v17)
  {
    brc_bread_crumbs();
    uint64_t v18 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      char v20 = [(BRCLocalItem *)self itemID];
      *(_DWORD *)buf = 138412546;
      __int16 v39 = v20;
      __int16 v40 = 2112;
      __int16 v41 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring download request for %@ because item is dead%@", buf, 0x16u);
    }
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = [(BRCLocalItem *)self itemID];
    int v23 = [v22 itemIDString];
    id v24 = objc_msgSend(v21, "brc_errorItemNotFound:", v23);

    if (v24)
    {
      __int16 v25 = brc_bread_crumbs();
      id v26 = brc_default_log();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        char v31 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        __int16 v39 = "-[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:]";
        __int16 v40 = 2080;
        if (!a7) {
          char v31 = "(ignored by caller)";
        }
        __int16 v41 = v31;
        __int16 v42 = 2112;
        __int16 v43 = v24;
        __int16 v44 = 2112;
        uint64_t v45 = (uint64_t)v25;
        _os_log_error_impl(&dword_1D353B000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a7) {
      *a7 = v24;
    }
  }
  __brc_leave_section(v37);

  return !v17;
}

- (unint64_t)dbRowID
{
  return self->_dbRowID;
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (BRCUserRowID)ownerKey
{
  return self->_ownerKey;
}

- (BRCLocalStatInfo)st
{
  return self->_st;
}

- (unsigned)syncUpState
{
  return self->_syncUpState;
}

- (BRCLocalItem)orig
{
  return self->_orig;
}

- (unint64_t)localDiffs
{
  return self->_localDiffs;
}

- (unint64_t)notifsRank
{
  return self->_notifsRank;
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (unint64_t)sharingOptions
{
  return self->_sharingOptions;
}

- (void)setSharingOptions:(unint64_t)a3
{
  self->_int sharingOptions = a3;
}

- (void)setAppLibrary:(id)a3
{
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)isUserVisible
{
  return self->_isUserVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_serverPathMatchID, 0);
  objc_storeStrong((id *)&self->_isInDocumentScope, 0);
  objc_storeStrong((id *)&self->_sideCarCKInfo, 0);
  objc_storeStrong((id *)&self->_parentFileID, 0);
  objc_storeStrong((id *)&self->_knownByServer, 0);
  objc_storeStrong((id *)&self->_minimumSupportedOSRowID, 0);
  objc_storeStrong((id *)&self->_orig, 0);
  objc_storeStrong((id *)&self->_st, 0);
  objc_storeStrong((id *)&self->_ownerKey, 0);
  objc_storeStrong((id *)&self->_parentZoneRowID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (id)baseStructureRecord
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    BOOL v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(CKConversions) baseStructureRecord]();
    }

    uint64_t v5 = 0;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    unint64_t v7 = [(BRCLocalItem *)self structureRecordID];
    uint64_t v5 = (void *)[v6 initWithRecordType:@"structure" recordID:v7];
  }
  return v5;
}

- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 stageID:(id)a4 shouldPCSChainStatus:(unsigned __int8)a5 saltGetter:(id)a6 childBasehashSaltGetter:(id)a7
{
  uint64_t v9 = a5;
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    brc_bread_crumbs();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(CKConversions) baseStructureRecord]();
    }
  }
  else
  {
    id v15 = [(BRCLocalItem *)self baseStructureRecord];
    unint64_t localDiffs = self->_localDiffs;
    id v23 = 0;
    char v18 = [v15 serializeStatInfo:self diffs:localDiffs stageID:v12 deadInServerTruth:v10 shouldPCSChainStatus:v9 basehashSaltGetter:v13 childBasehashSaltGetter:v14 error:&v23];
    __int16 v16 = v23;
    if (v18)
    {
      [(BRCLocalItem *)self serializeStructuralPluginHints:v15];
      id v15 = v15;
      uint64_t v19 = v15;
      goto LABEL_10;
    }
    char v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalItem(CKConversions) structureRecordBeingDeadInServerTruth:stageID:shouldPCSChainStatus:saltGetter:childBasehashSaltGetter:]();
    }
  }
  uint64_t v19 = 0;
LABEL_10:

  return v19;
}

- (id)sideCarRecordID
{
  if ([(BRCLocalItem *)self isSharedToMeChildItem])
  {
    BOOL v3 = [(BRCLocalItem *)self itemID];
    id v4 = [(BRCLocalItem *)self serverZone];
    uint64_t v5 = [v4 asSharedZone];
    id v6 = [v3 sideCarRecordIDWithZone:v5];
  }
  else
  {
    unint64_t v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(CKConversions) sideCarRecordID]();
    }

    id v6 = 0;
  }
  return v6;
}

- (id)baseSideCarRecord
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  id v4 = [(BRCLocalItem *)self sideCarRecordID];
  uint64_t v5 = (void *)[v3 initWithRecordType:@"perParticipantMetadata" recordID:v4];

  return v5;
}

- (void)serializeStructuralPluginHints:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(BRCLocalItem *)self isFromInitialScan];
  id v6 = [(BRCLocalItem *)self serverPathMatchItemID];
  if (v6)
  {
    unint64_t v7 = [(BRCClientZone *)self->_clientZone itemByItemID:v6];
    int v8 = v7;
    if (!v7 || [(BRCLocalItem *)v7 isReserved]) {
      goto LABEL_4;
    }
    if (![(BRCLocalItem *)v8 isDead] && [(BRCLocalItem *)v8 isFault])
    {
      int v11 = [(BRCLocalItem *)v8 st];
      id v12 = [v11 parentID];
      id v13 = [(BRCStatInfo *)self->_st parentID];
      if ([v12 isEqualToItemID:v13])
      {
        [(BRCLocalItem *)v8 st];
        id v14 = v30 = v11;
        id v15 = [v14 logicalName];
        __int16 v16 = [(BRCLocalStatInfo *)self->_st logicalName];
        char v29 = [v15 isEqualToString:v16];

        if (v29)
        {
LABEL_4:
          uint64_t v9 = 0;
          BOOL v10 = 0;
          goto LABEL_25;
        }
      }
      else
      {
      }
    }
    BOOL v17 = [(BRCLocalItem *)v8 structureRecordID];
    char v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v32 = self;
      __int16 v33 = 2112;
      __int16 v34 = v8;
      __int16 v35 = 2112;
      BOOL v36 = v18;
      _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] path match info for %@ is %@%@", buf, 0x20u);
    }

    BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v17 action:0];
    char v20 = [(BRCLocalItem *)v8 st];
    uint64_t v21 = [v20 ckInfo];
    uint64_t v9 = [v21 etag];

    if (v9)
    {
      if (v10)
      {
LABEL_24:

LABEL_25:
        if (!v5) {
          goto LABEL_26;
        }
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v22 = brc_bread_crumbs();
      id v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        unint64_t v32 = v8;
        __int16 v33 = 2112;
        __int16 v34 = self;
        __int16 v35 = 2112;
        BOOL v36 = v22;
        _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] we have no etag for %@\npath matching: %@%@", buf, 0x20u);
      }

      if (v10) {
        goto LABEL_24;
      }
    }
    id v24 = brc_bread_crumbs();
    __int16 v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v32 = v8;
      __int16 v33 = 2112;
      __int16 v34 = self;
      __int16 v35 = 2112;
      BOOL v36 = v24;
      _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] we have no reference for %@\npath matching: %@%@", buf, 0x20u);
    }

    goto LABEL_24;
  }
  uint64_t v9 = 0;
  BOOL v10 = 0;
  if (!v5)
  {
LABEL_26:
    if (!v10 || !v9) {
      goto LABEL_37;
    }
  }
LABEL_28:
  id v26 = [v4 pluginFields];
  if (v26)
  {
    __int16 v27 = [v4 pluginFields];
    uint64_t v28 = (void *)[v27 mutableCopy];
  }
  else
  {
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  }

  if (v5) {
    [v28 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"br_initialItem"];
  }
  if (v10 && v9)
  {
    [v28 setObject:v10 forKeyedSubscript:@"br_pathMatchID"];
    [v28 setObject:v9 forKeyedSubscript:@"br_pathMatchEtag"];
  }
  [v4 setPluginFields:v28];

LABEL_37:
}

- (id)structureRecordID
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    id v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem(CKConversions) structureRecordID]();
    }

    BOOL v5 = 0;
  }
  else
  {
    id v6 = [(BRCLocalItem *)self itemID];
    uint64_t v7 = [(BRCStatInfo *)self->_st type];
    serverZone = self->_serverZone;
    if ([(BRCLocalItem *)self isBRAlias])
    {
      uint64_t v9 = [(BRCLocalItem *)self asBRAlias];
      BOOL v10 = [v9 targetClientZone];
      BOOL v5 = objc_msgSend(v6, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", v7, serverZone, objc_msgSend(v10, "isSharedZone"));
    }
    else
    {
      BOOL v5 = [v6 structureRecordIDForItemType:v7 zone:serverZone aliasTargetZoneIsShared:1];
    }
  }
  return v5;
}

- (id)jobsDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"r:%lld", -[BRCLocalItem dbRowID](self, "dbRowID"));
}

- (id)matchingJobsWhereSQLClause
{
  return (id)objc_msgSend(MEMORY[0x1E4FBA8F8], "formatInjection:", @"throttle_id = %lld", -[BRCLocalItem dbRowID](self, "dbRowID"));
}

void __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: cv%@", v2, v3, v4, v5, v6);
}

void __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: st%@", v2, v3, v4, v5, v6);
}

void __63__BRCLocalItem_LegacyAdditions__updateXattrInfoFromPath_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)(v0 + 8) + 40);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] unable to load the xattrs: %@%@", (void)v3, DWORD2(v3));
}

void __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Encountered circular parenting chain%@", v1, 0xCu);
}

void __51__BRCLocalItem_LegacyAdditions__fetchParentFileIDs__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Circular parenting chain%@", v2, v3, v4, v5, v6);
}

void __74__BRCLocalItem_LegacyAdditions___contentXattrsHaveChangedAtRelativeAPath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] unable to load the xattrs: %@%@");
}

- (void)asBRAlias
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: -asBRAlias called on a non alias%@", v2, v3, v4, v5, v6);
}

- (void)asDirectory
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: -asDirectory called on a non directory%@", v2, v3, v4, v5, v6);
}

- (void)asDocument
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: -asDocument called on a non document%@", v2, v3, v4, v5, v6);
}

- (void)asShareableItem
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: -asShareableItem called on a non shareable item%@", v2, v3, v4, v5, v6);
}

- (void)asFSRoot
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: -asFSRoot called on a non root%@", v2, v3, v4, v5, v6);
}

- (void)asSymlink
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: -asSymlink called on a non symlink%@", v2, v3, v4, v5, v6);
}

- (void)asFinderBookmark
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: -asFinderBookmark called on a non symlink%@", v2, v3, v4, v5, v6);
}

- (void)asShareAcceptationFault
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: -asShareAcceptationFault called on a non fault%@", v2, v3, v4, v5, v6);
}

- (void)fileObjectID
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: unknown item type%@", v2, v3, v4, v5, v6);
}

- (void)asSharedToMeTopLevelItem
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Asked to get the top-level item of a non shared top level item: %@%@");
}

- (void)inheritOSUpgradeNeededFromItem:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_minimumSupportedOSRowID%@", v2, v3, v4, v5, v6);
}

- (void)inheritOSUpgradeNeededFromItem:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: parentItem->_minimumSupportedOSRowID%@", v2, v3, v4, v5, v6);
}

- (void)markNeedsOSUpgradeToSyncUpWithName:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: can't add the OS NAME%@", v2, v3, v4, v5, v6);
}

- (void)initFromPQLResultSet:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Local items must be initialized with initFromPQLResultSet:container:error:%@", v2, v3, v4, v5, v6);
}

- (void)_initFromPQLResultSet:session:db:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isReserved%@", v2, v3, v4, v5, v6);
}

- (void)sideCarInfo
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Asked for side car info on an item that doesn't have side cars%@", v2, v3, v4, v5, v6);
}

- (void)parentItemIDInZone
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !self.itemID.isNonDesktopRoot%@", v2, v3, v4, v5, v6);
}

- (void)parentItemOnFS
{
  uint64_t v0 = [0 debugItemIDString];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: item without parentID under parent %@%@", v3, v4, v5, v6, v7);
}

- (void)_updateSyncUpSchedulerWithDiffs:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Rescheduling upload for %@%@");
}

- (void)_updateSyncUpSchedulerWithDiffs:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Detected sync up state change%@", v2, v3, v4, v5, v6);
}

- (void)_updateSyncUpSchedulerWithDiffs:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Didn't detect the local sync up state change for %@%@");
}

- (void)_insertInDB:dbRowID:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isReserved || _appLibrary%@", v2, v3, v4, v5, v6);
}

- (void)_updateInDB:diffs:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _st.ckInfo.etag == nil || [_orig.st.ckInfo.etagBeforeCrossZoneMove isEqualToString:_st.ckInfo.etag] || self.isDirectory%@", v2, v3, v4, v5, v6);
}

- (void)_updateInDB:diffs:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ![self.itemID isEqualToItemID:self.orig.itemID]%@", v2, v3, v4, v5, v6);
}

- (void)_updateInDB:diffs:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Deleting old zone sync up job for a CZM item: %@%@");
}

void __30__BRCLocalItem_setOfParentIDs__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Circular parenting chain%@", v2, v3, v4, v5, v6);
}

- (void)_restorePreviousGlobalID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Existing server item %@%@");
}

- (void)saveToDBForServerEdit:keepAliases:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: if we have a bounced logical name we should always have a physical name for %@%@");
}

- (void)saveToDBForServerEdit:keepAliases:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Item is already force-deleted, skipping save%@", v2, v3, v4, v5, v6);
}

- (void)saveToDBForServerEdit:keepAliases:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] overwriting serverUpdate to YES because the item is moving to IDLE%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] not dropping already reserved/dead/almost dead item from the working set %@%@", (void)v3, DWORD2(v3));
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: there should be a fileObjectID for %@%@");
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_8();
  os_log_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1D353B000, v2, v3, "[CRIT] UNREACHABLE: saving items should really always work: %@%@", v4, v5, v6, v7, v8);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_1D353B000, a2, a3, "[DEBUG] Inserting item with rowid = %llu%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] We received our first shared to me child item, schedulding side car sync%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] we don't have a corresponding alias item, and the diffs do not require alias creation, dropping the diffs%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Forcing sync up of side car zone when item changed path extension%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_8()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] this item changed significantly%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_9()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] item went out of lost state%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_10()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] item with a minimum supported OS just changed, checking if we need to reattempt upload%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_11()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Telling new app library about lost state%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_12()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Deleting tombstone because it's synced up%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_13()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Deleting tombstone because it's no known to server%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_14()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Not deleting until we send the delete to children%@", v2, v3, v4, v5, v6);
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_15()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Force deletion has been asked, comply%@", v2, v3, v4, v5, v6);
}

+ (void)computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: parentScope != BRC_ITEM_SCOPE_DATA || !parentVisible%@", v2, v3, v4, v5, v6);
}

+ (void)computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !appLibrary.isCloudDocsAppLibrary%@", v2, v3, v4, v5, v6);
}

- (void)forceNeedsSyncUpWithoutDiffs
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Forcing sync up of shared item in the trash %@%@");
}

- (void)markLatestSyncRequestRejectedInZone:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Rejected item %@ is documents folder.  Force syncing on all%@");
}

- (void)markLatestSyncRequestRejectedInZone:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Rejected item %@ has meaningful local diffs.  Forcing sync on all%@");
}

- (void)markLatestSyncRequestAcknowledgedInZone:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 itemID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] we are still syncing %@%@", v4);
}

- (void)markLatestSyncRequestAcknowledgedInZone:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v1 = BRCItemFieldsPrettyPrint();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v2, "[DEBUG] we still have diffs to send: %@%@", v3);
}

- (void)markLatestSyncRequestAcknowledgedInZone:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _syncUpState != BRC_SUS_IDLE%@", v2, v3, v4, v5, v6);
}

- (void)markRemovedFromFilesystemForServerEdit:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Shared to me child item was removed so bumping lost throttle on its parent%@", v2, v3, v4, v5, v6);
}

- (void)updateItemMetadataFromServerItem:appliedSharingPermission:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Learning parent sharing options because there is no shareID on this item%@", v2, v3, v4, v5, v6);
}

- (void)updateStructuralCKInfoFromServerItem:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*v1 etag];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] Also updating side car ckinfo:%@%@", v4);
}

- (void)updateStructuralCKInfoFromServerItem:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ckInfo%@", v2, v3, v4, v5, v6);
}

- (void)updateStructuralCKInfoFromServerItem:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: serverItem%@", v2, v3, v4, v5, v6);
}

- (void)isReadAndUploaded
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: invalid sync up state%@", v2, v3, v4, v5, v6);
}

- (void)startDownloadInTask:options:etagIfLoser:stageFileName:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: (options & BRCDownloadDiscretionary) == 0 || (options & BRCDownloadUserInitiated) == 0%@", v2, v3, v4, v5, v6);
}

@end