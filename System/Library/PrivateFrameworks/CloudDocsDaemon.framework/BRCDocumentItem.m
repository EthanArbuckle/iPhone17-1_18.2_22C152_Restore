@interface BRCDocumentItem
+ (BOOL)isDocumentAutomaticallyEvictableWithExtension:(id)a3;
+ (BOOL)isDocumentAutomaticallyEvictableWithName:(id)a3;
+ (BOOL)shouldDocumentBeGreedyWithName:(id)a3;
+ (id)anyReverseAliasInAppLibrary:(id)a3 toRelativePath:(id)a4;
+ (id)anyReverseAliasWithUnsaltedBookmarkData:(id)a3 inAppLibrary:(id)a4;
+ (id)nextPausedDocumentBatchEnumeratorWithBundleID:(id)a3 fromRowID:(unint64_t)a4 batchSize:(unsigned int)a5 session:(id)a6 db:(id)a7;
+ (id)reverseAliasEnumeratorWithRelativePath:(id)a3;
+ (id)reverseAliasEnumeratorWithUnsaltedBookmarkData:(id)a3 session:(id)a4;
+ (void)autoResumeSyncPausedDocumentsOnTimeoutWithSession:(id)a3;
- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4;
- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4;
- (BOOL)_isInterestingUpdateForNotifs;
- (BOOL)_needsSyncBubbleRecomputeForError:(id)a3 origError:(id)a4;
- (BOOL)_nukePackageItemsFromDB:(id)a3;
- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4;
- (BOOL)changedAtRelativePath:(id)a3 scanPackage:(BOOL)a4;
- (BOOL)contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:(BOOL)a3;
- (BOOL)evictInTask:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)hasLocalContent;
- (BOOL)hasShareIDAndIsOwnedByMe;
- (BOOL)hasValidCKInfo;
- (BOOL)isAutomaticallyEvictable;
- (BOOL)isCrossZoneMoveTombstone;
- (BOOL)isDocument;
- (BOOL)isDocumentBeingCopiedToNewZone;
- (BOOL)isDownloadRequested;
- (BOOL)isDownloadRequestedForThumbnail;
- (BOOL)isEvictable;
- (BOOL)isFault;
- (BOOL)isPackage;
- (BOOL)isPausedFromSync;
- (BOOL)isResumingSync;
- (BOOL)isShareableItem;
- (BOOL)isVisibleIniCloudDrive;
- (BOOL)markLatestSyncRequestAcknowledgedInZone:(id)a3;
- (BOOL)pauseFromSyncWithTimeout:(double)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)resumeSyncForBundleID:(id)a3 dropLocalChanges:(BOOL)a4 error:(id *)a5;
- (BOOL)shouldAutomaticallyDownloadThumbnail;
- (BOOL)shouldBeGreedy;
- (BOOL)shouldHaveThumbnail;
- (BOOL)shouldTransferThumbnail;
- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7;
- (BOOL)supportsServerSideAssetCopies;
- (BOOL)updateFromFSAtPath:(id)a3 parentGlobalID:(id)a4;
- (BOOL)updateLocationAndMetaFromFSAtPath:(id)a3 parentGlobalID:(id)a4;
- (BOOL)updateXattrInfoFromPath:(id)a3 error:(id *)a4;
- (BOOL)validateLoggingToFile:(__sFILE *)a3;
- (BRCDesiredVersion)desiredVersion;
- (BRCGenerationID)generationIDForUpload;
- (BRCLocalVersion)currentVersion;
- (NSData)liveThumbnailSignature;
- (NSDictionary)conflictLoserState;
- (NSError)uploadError;
- (NSNumber)fileIDForUpload;
- (NSNumber)syncPausedExpireTS;
- (NSSet)liveConflictLoserEtags;
- (NSSet)resolvedConflictLoserEtags;
- (id)_filenameOverrideForPath:(id)a3;
- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6;
- (id)_initWithLocalItem:(id)a3;
- (id)_initWithRelativePath:(id)a3 parentGlobalID:(id)a4;
- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4;
- (id)aliasItemID;
- (id)anyReverseAliasInAppLibrary:(id)a3;
- (id)baseRecord;
- (id)baseRecordClearAllFields:(BOOL)a3;
- (id)collaborationIdentifierIfComputable;
- (id)descriptionWithContext:(id)a3;
- (id)documentRecordID;
- (id)reverseAliasEnumerator;
- (id)setOfAppLibraryIDsWithReverseAliases;
- (id)syncContextUsedForTransfers;
- (int)updateDesiredVersionWithServerItem:(id)a3 diffs:(unint64_t)a4 options:(unsigned int)a5 needsSave:(BOOL *)a6;
- (int)updateDesiredVersionWithServerItem:(id)a3 options:(unsigned int)a4 needsSave:(BOOL *)a5;
- (unint64_t)diffAgainstLocalItem:(id)a3;
- (unint64_t)diffAgainstServerItem:(id)a3;
- (unsigned)downloadStatus;
- (unsigned)queryItemStatus;
- (void)_insertTombstoneForPreviousZoneGlobalID;
- (void)_markAsDeadTombstoneWithPreviousGlobalID;
- (void)_updateLiveConflictLoserFromFSAtPath:(id)a3;
- (void)_updateReadThrottleIfNeededForRowID:(unint64_t)a3 forCreation:(BOOL)a4;
- (void)_updateRecursivePropertiesInDB:(id)a3 dbRowID:(unint64_t)a4 diffs:(unint64_t)a5;
- (void)_updateUploadJobIfNeededWithDiffs:(unint64_t)a3;
- (void)addResolvedConflictLoserEtag:(id)a3;
- (void)appDidResolveConflictLoserWithEtag:(id)a3;
- (void)clearDesiredVersion;
- (void)clearFromStage;
- (void)clearVersionSignatures:(unint64_t)a3 isPackage:(BOOL)a4;
- (void)forceVersionConflictByClearkingCKInfo;
- (void)forceiWorkConflictEtag:(id)a3;
- (void)forceiWorkSharingInfoResend;
- (void)handleUnknownItemError;
- (void)isPackage;
- (void)learnItemID:(id)a3 serverItem:(id)a4 path:(id)a5 markLost:(BOOL)a6;
- (void)learnThumbnailSignatureFromLiveVersion:(id)a3;
- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:(id)a3 path:(id)a4;
- (void)markDead;
- (void)markForceNeedsSyncUp;
- (void)markForceUpload;
- (void)markItemForgottenByServer;
- (void)markLatestSyncRequestRejectedInZone:(id)a3;
- (void)markLiveFromStageWithPath:(id)a3;
- (void)markNeedsReading;
- (void)markNeedsUploadOrSyncingUp;
- (void)markOverQuotaWithError:(id)a3;
- (void)markUploadedWithRecord:(id)a3;
- (void)removeLiveConflictLoserEtag:(id)a3;
- (void)resumeSyncComplete;
- (void)setLiveConflictLoserEtags:(id)a3;
- (void)setLiveThumbnailSignature:(id)a3;
- (void)shouldBeGreedy;
- (void)stageFaultForCreation:(BOOL)a3 name:(id)a4 size:(id)a5 isPackage:(BOOL)a6;
- (void)stageFaultForCreation:(BOOL)a3 serverItem:(id)a4;
- (void)updateContentsCKInfoAndDeviceIDFromServerItem:(id)a3;
- (void)updateVersionMetadataFromServerItem:(id)a3 preventVersionDiffs:(BOOL)a4;
@end

@implementation BRCDocumentItem

- (NSData)liveThumbnailSignature
{
  return self->_liveThumbnailSignature;
}

- (void)setLiveThumbnailSignature:(id)a3
{
}

- (BOOL)shouldAutomaticallyDownloadThumbnail
{
  return self->_shouldAutomaticallyDownloadThumbnail;
}

- (NSSet)liveConflictLoserEtags
{
  return (NSSet *)self->_liveConflictLoserEtags;
}

- (void)setLiveConflictLoserEtags:(id)a3
{
  v4 = (NSMutableSet *)[a3 mutableCopy];
  liveConflictLoserEtags = self->_liveConflictLoserEtags;
  self->_liveConflictLoserEtags = v4;
}

- (BOOL)isFault
{
  unsigned int v2 = [(BRCStatInfo *)self->super._st type];
  return (v2 < 9) & (0x184u >> v2);
}

- (BOOL)isDownloadRequested
{
  if (!self->_desiredVersion) {
    return ![(BRCDocumentItem *)self isFault];
  }
  desiredVersion = self->_desiredVersion;
  return [(BRCDesiredVersion *)desiredVersion wantsContent];
}

- (BOOL)isDownloadRequestedForThumbnail
{
  if (!self->_desiredVersion) {
    return ![(BRCDocumentItem *)self isFault];
  }
  desiredVersion = self->_desiredVersion;
  return [(BRCDesiredVersion *)desiredVersion wantsContentForThumbnail];
}

- (BRCDesiredVersion)desiredVersion
{
  return self->_desiredVersion;
}

- (NSNumber)syncPausedExpireTS
{
  return self->_syncPausedExpireTS;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BRCDocumentItem;
  id v11 = [(BRCLocalItem *)&v35 _initFromPQLResultSet:v10 session:a4 db:a5 error:a6];
  if (v11)
  {
    id v12 = [[BRCLocalVersion alloc] initFromResultSet:v10 pos:39];
    v13 = (void *)*((void *)v11 + 25);
    *((void *)v11 + 25) = v12;

    if ([*((id *)v11 + 9) isExecutable]
      && ([v11 isDead] & 1) == 0
      && [*((id *)v11 + 25) isPackage])
    {
      *(unsigned char *)(*((void *)v11 + 9) + 26) &= ~2u;
    }
    uint64_t v14 = [v10 unarchivedObjectOfClass:objc_opt_class() atIndex:55];
    v15 = (void *)*((void *)v11 + 31);
    *((void *)v11 + 31) = v14;

    if (_allowedClassesForEtags_once != -1) {
      dispatch_once(&_allowedClassesForEtags_once, &__block_literal_global_176);
    }
    id v16 = (id)_allowedClassesForEtags_allowedClasses;
    v17 = [v10 unarchivedObjectOfClasses:v16 atIndex:56];

    if (!v17
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v18 = [v17 objectForKeyedSubscript:@"l"];
      uint64_t v19 = [v18 mutableCopy];
      v20 = (void *)*((void *)v11 + 28);
      *((void *)v11 + 28) = v19;

      v21 = [v17 objectForKeyedSubscript:@"r"];
      uint64_t v22 = [v21 mutableCopy];
      v23 = (void *)*((void *)v11 + 26);
      *((void *)v11 + 26) = v22;
    }
    else
    {
      v32 = brc_bread_crumbs();
      v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem(LegacyAdditions) _initFromPQLResultSet:session:db:error:]();
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v24 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v34 = [v17 mutableCopy];
      v23 = (void *)*((void *)v11 + 28);
      *((void *)v11 + 28) = v34;
      v21 = v17;
      v17 = 0;
    }
    v24 = v17;

    v17 = v21;
LABEL_13:

    uint64_t v25 = [v10 dataAtIndex:57];
    v26 = (void *)*((void *)v11 + 32);
    *((void *)v11 + 32) = v25;

    *((unsigned char *)v11 + 216) = [v10 BOOLAtIndex:58];
    uint64_t v27 = [v10 stringAtIndex:59];
    v28 = (void *)*((void *)v11 + 29);
    *((void *)v11 + 29) = v27;

    uint64_t v29 = [v10 numberAtIndex:60];
    v30 = (void *)*((void *)v11 + 30);
    *((void *)v11 + 30) = v29;
  }
  return v11;
}

- (void)_updateLiveConflictLoserFromFSAtPath:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  v23 = [(BRCLocalItem *)self itemID];
  memset(v31, 0, sizeof(v31));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem(LegacyAdditions) _updateLiveConflictLoserFromFSAtPath:]", 199, v31);
  brc_bread_crumbs();
  v4 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v33 = v31[0];
    __int16 v34 = 2112;
    id v35 = v21;
    __int16 v36 = 2112;
    v37 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx reading live conflict losers from %@%@", buf, 0x20u);
  }

  v6 = [MEMORY[0x1E4F63BE8] manager];
  v7 = [v21 physicalURL];
  id v30 = 0;
  v20 = [v6 permanentStorageForItemAtURL:v7 allocateIfNone:0 error:&v30];
  id v19 = v30;

  if (v20)
  {
    v8 = [v20 enumeratorForAdditionsInNameSpace:*MEMORY[0x1E4F63BD0] withOptions:0 withoutOptions:0 ordering:0];
    uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v9 = v8;
    uint64_t v10 = [(BRCDocumentItem *)v9 countByEnumeratingWithState:&v26 objects:v40 count:16];
    if (!v10) {
      goto LABEL_19;
    }
    uint64_t v11 = *(void *)v27;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v24 = 0;
        id v25 = 0;
        if (objc_msgSend(v13, "brc_parseMangledID:itemID:etag:session:", 0, &v25, &v24, self->super._session))
        {
          if ([v25 isEqualToItemID:v23])
          {
            [v22 addObject:v24];
            goto LABEL_17;
          }
          uint64_t v14 = brc_bread_crumbs();
          v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413058;
            uint64_t v33 = (uint64_t)v23;
            __int16 v34 = 2112;
            id v35 = v13;
            __int16 v36 = 2112;
            v37 = self;
            __int16 v38 = 2112;
            v39 = v14;
            _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] invalid itemID %@ (for %@ in %@)%@", buf, 0x2Au);
          }
        }
        else
        {
          uint64_t v14 = brc_bread_crumbs();
          v15 = brc_default_log();
          if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v33 = (uint64_t)v13;
            __int16 v34 = 2112;
            id v35 = v14;
            _os_log_error_impl(&dword_1D353B000, v15, (os_log_type_t)0x90u, "[ERROR] invalid addition name for %@%@", buf, 0x16u);
          }
        }

LABEL_17:
      }
      uint64_t v10 = [(BRCDocumentItem *)v9 countByEnumeratingWithState:&v26 objects:v40 count:16];
      if (!v10)
      {
LABEL_19:

        id v16 = (NSMutableSet *)[v22 count];
        if (v16) {
          id v16 = v22;
        }
        liveConflictLoserEtags = self->_liveConflictLoserEtags;
        self->_liveConflictLoserEtags = v16;

        v18 = v22;
        goto LABEL_24;
      }
    }
  }
  brc_bread_crumbs();
  v9 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
  v18 = brc_default_log();
  if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v33 = (uint64_t)v21;
    __int16 v34 = 2112;
    id v35 = v19;
    __int16 v36 = 2112;
    v37 = v9;
    _os_log_error_impl(&dword_1D353B000, v18, (os_log_type_t)0x90u, "[ERROR] can't get permanent storage of %@: %@%@", buf, 0x20u);
  }
LABEL_24:

  __brc_leave_section(v31);
}

- (void)learnItemID:(id)a3 serverItem:(id)a4 path:(id)a5 markLost:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  memset(v23, 0, sizeof(v23));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem(LegacyAdditions) learnItemID:serverItem:path:markLost:]", 242, v23);
  v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v25 = v23[0];
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2112;
    long long v29 = self;
    __int16 v30 = 2112;
    v31 = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx learning itemID %@ for %@%@", buf, 0x2Au);
  }

  v22.receiver = self;
  v22.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v22 learnItemID:v10 serverItem:v11 path:v12 markLost:v6];
  if (([(BRCLocalItem *)self needsSyncUp] || [(BRCLocalItem *)self needsUpload])
    && [(BRCLocalItem *)self isOnDisk]
    && ![(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone])
  {
    [(BRCDocumentItem *)self markNeedsReading];
  }
  v15 = [v11 latestVersion];
  id v16 = [v15 editedSinceShared];
  int v17 = [v16 BOOLValue];

  if (v17)
  {
    [(BRCVersion *)self->_currentVersion setEditedSinceShared:MEMORY[0x1E4F1CC38]];
    v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[BRCDocumentItem(LegacyAdditions) learnItemID:serverItem:path:markLost:]();
    }
  }
  if (v12
    || (v20 = [[BRCItemToPathLookup alloc] initWithItem:self],
        [(BRCItemToPathLookup *)v20 byFileSystemID],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        [(BRCItemToPathLookup *)v20 closePaths],
        v20,
        v12))
  {
    [(BRCDocumentItem *)self _updateLiveConflictLoserFromFSAtPath:v12];
  }
  id v21 = [(BRCAccountSession *)self->super._session applyScheduler];
  [v21 rescheduleMissingTargetAliasesWithTarget:self];

  __brc_leave_section(v23);
}

- (BOOL)updateFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  currentVersion = self->_currentVersion;
  if (currentVersion)
  {
    -[BRCLocalVersion _clearSignatures:isPackage:](currentVersion, "_clearSignatures:isPackage:", 3, [v6 isPackageRoot]);
  }
  else
  {
    v9 = -[BRCLocalVersion initForPackage:]([BRCLocalVersion alloc], "initForPackage:", [v6 isPackageRoot]);
    id v10 = self->_currentVersion;
    self->_currentVersion = v9;
  }
  id v11 = self->_currentVersion;
  id v12 = [(BRCDocumentItem *)self _filenameOverrideForPath:v6];
  [(BRCLocalVersion *)v11 updateFromFSAtPath:v6 filenameOverride:v12];

  if ([(BRCLocalItem *)self isShared] && ([(BRCLocalItem *)self sharingOptions] & 4) != 0) {
    [(BRCLocalItem *)self setOrRemoveSpotlightAttributeAt:v6];
  }
  v15.receiver = self;
  v15.super_class = (Class)BRCDocumentItem;
  BOOL v13 = [(BRCLocalItem *)&v15 updateFromFSAtPath:v6 parentGlobalID:v7];

  return v13;
}

- (BOOL)updateLocationAndMetaFromFSAtPath:(id)a3 parentGlobalID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isFault] & 1) == 0)
  {
    if ([(BRCDocumentItem *)self isFault])
    {
      v8 = brc_bread_crumbs();
      v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BRCDocumentItem(LegacyAdditions) updateLocationAndMetaFromFSAtPath:parentGlobalID:]();
      }

      currentVersion = self->_currentVersion;
      self->_currentVersion = 0;

      [(BRCDocumentItem *)self markNeedsReading];
    }
    id v11 = self->_currentVersion;
    if (!v11)
    {
      id v12 = -[BRCLocalVersion initForPackage:]([BRCLocalVersion alloc], "initForPackage:", [v6 isPackageRoot]);
      BOOL v13 = self->_currentVersion;
      self->_currentVersion = v12;

      id v11 = self->_currentVersion;
    }
    unint64_t v14 = (self->super._sharingOptions >> 2) & 1;
    objc_super v15 = [(BRCDocumentItem *)self _filenameOverrideForPath:v6];
    [(BRCLocalVersion *)v11 updateLocationAndMetaFromFSAtPath:v6 updateFilename:v14 filenameOverride:v15];
  }
  v18.receiver = self;
  v18.super_class = (Class)BRCDocumentItem;
  BOOL v16 = [(BRCLocalItem *)&v18 updateLocationAndMetaFromFSAtPath:v6 parentGlobalID:v7];

  return v16;
}

- (BOOL)changedAtRelativePath:(id)a3 scanPackage:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isInPackage])
  {
    id v7 = [v6 pathOfPackageRoot];
  }
  else
  {
    id v7 = v6;
  }
  v8 = v7;
  BOOL v9 = [(BRCLocalItem *)self fromReadOnlyDB];
  memset(v40, 0, sizeof(v40));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem(LegacyAdditions) changedAtRelativePath:scanPackage:]", 310, v40);
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v42 = v40[0];
    __int16 v43 = 2112;
    v44 = self;
    __int16 v45 = 2112;
    id v46 = v6;
    __int16 v47 = 2112;
    v48 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx diffing item %@\nagainst %@%@", buf, 0x2Au);
  }

  if (([v8 isDocument] & 1) == 0)
  {
    BOOL v13 = brc_bread_crumbs();
    unint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCDocumentItem(LegacyAdditions) changedAtRelativePath:scanPackage:]();
    }
    goto LABEL_11;
  }
  v39.receiver = self;
  v39.super_class = (Class)BRCDocumentItem;
  if (![(BRCLocalItem *)&v39 changedAtRelativePath:v8 scanPackage:v4])
  {
    if ([(BRCDocumentItem *)self isFault])
    {
LABEL_13:
      BOOL v13 = brc_bread_crumbs();
      unint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[BRCDocumentItem(LegacyAdditions) changedAtRelativePath:scanPackage:]();
      }
      BOOL v12 = 0;
      goto LABEL_16;
    }
    if (([v8 isUnixDir] & 1) != 0
      || (uint64_t v16 = [v8 size], v16 == -[BRCVersion size](self->_currentVersion, "size"))
      || v9 && (uint64_t v34 = [v8 size], v34 == -[BRCVersion size](self->_desiredVersion, "size")))
    {
      int v17 = [(BRCDocumentItem *)self currentVersion];
      uint64_t v18 = [v17 mtime];
      char v19 = v18 == [v8 modificationTime] || v9;
      if (v19)
      {
      }
      else
      {
        int64_t v20 = [(BRCVersion *)self->_desiredVersion mtime];
        LODWORD(v20) = v20 == [v8 modificationTime];

        if (v20)
        {
          BOOL v13 = brc_bread_crumbs();
          unint64_t v14 = brc_default_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            id v21 = [(BRCDocumentItem *)self currentVersion];
            uint64_t v22 = [v21 mtime];
            uint64_t v23 = [v8 modificationTime];
            *(_DWORD *)buf = 134218498;
            uint64_t v42 = v22;
            __int16 v43 = 2048;
            v44 = (BRCDocumentItem *)v23;
            __int16 v45 = 2112;
            id v46 = v13;
            _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] mtime changed from %llu to %llu%@", buf, 0x20u);
          }
          goto LABEL_11;
        }
      }
      id v24 = [v8 generationID];
      uint64_t v25 = [(BRCLocalStatInfo *)self->super._st generationID];
      __int16 v26 = [(BRCVersion *)self->_currentVersion contentSignature];
      int v27 = [v24 isEqualToGenerationID:v25 orSignature:v26];
      char v28 = v27;
      if (((v27 | !v9) & 1) == 0)
      {
        long long v29 = [v8 generationID];
        char v28 = objc_msgSend(v29, "isEqualToFSGenerationID:", -[BRCLocalStatInfo stagedGenerationID](self->super._st, "stagedGenerationID"));
      }
      if (v28)
      {
        if (v4 && (([v8 isPackageRoot] ^ 1 | v9) & 1) == 0)
        {
          __int16 v30 = [(BRCLocalStatInfo *)self->super._st documentID];
          BOOL v31 = v30 == 0;

          if (v31)
          {
            v37 = brc_bread_crumbs();
            __int16 v38 = brc_default_log();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
              -[BRCDocumentItem(LegacyAdditions) changedAtRelativePath:scanPackage:]();
            }
          }
          if (+[BRCPackageItem packageChangedAtRelativePath:v6])
          {
            goto LABEL_8;
          }
        }
        goto LABEL_13;
      }
      BOOL v13 = brc_bread_crumbs();
      unint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = [(BRCLocalStatInfo *)self->super._st generationID];
        uint64_t v33 = [v8 generationID];
        *(_DWORD *)buf = 138412802;
        uint64_t v42 = (uint64_t)v32;
        __int16 v43 = 2112;
        v44 = v33;
        __int16 v45 = 2112;
        id v46 = v13;
        _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] generationID (%@) doesn't match (%@)%@", buf, 0x20u);
      }
    }
    else
    {
      BOOL v13 = brc_bread_crumbs();
      unint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int64_t v35 = [(BRCVersion *)self->_currentVersion size];
        uint64_t v36 = [v6 size];
        *(_DWORD *)buf = 134218754;
        uint64_t v42 = v35;
        __int16 v43 = 2048;
        v44 = (BRCDocumentItem *)v36;
        __int16 v45 = 2112;
        id v46 = v6;
        __int16 v47 = 2112;
        v48 = v13;
        _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] size changed from %llu to %llu at %@%@", buf, 0x2Au);
      }
    }
LABEL_11:
    BOOL v12 = 1;
LABEL_16:

    goto LABEL_17;
  }
LABEL_8:
  BOOL v12 = 1;
LABEL_17:
  __brc_leave_section(v40);

  return v12;
}

- (id)_filenameOverrideForPath:(id)a3
{
  id v4 = a3;
  v5 = [(BRCLocalItem *)self st];
  id v6 = [v5 rawBouncedLogicalName];
  id v7 = [v4 filename];

  if ([v6 isEqualToString:v7])
  {
    v8 = [(BRCLocalItem *)self st];
    BOOL v9 = [v8 logicalNameWithoutLocalBounce];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_initWithRelativePath:(id)a3 parentGlobalID:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BRCDocumentItem;
  id v7 = [(BRCLocalItem *)&v26 _initWithRelativePath:v6 parentGlobalID:a4];
  if (v7)
  {
    id v8 = -[BRCLocalVersion initForPackage:]([BRCLocalVersion alloc], "initForPackage:", [v6 isPackageRoot]);
    BOOL v9 = (void *)v7[25];
    v7[25] = v8;

    id v10 = (void *)v7[25];
    id v11 = [v7 _filenameOverrideForPath:v6];
    [v10 updateFromFSAtPath:v6 filenameOverride:v11];

    [v7 _updateLiveConflictLoserFromFSAtPath:v6];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    BOOL v12 = +[BRCDocumentItem reverseAliasEnumeratorWithRelativePath:](BRCDocumentItem, "reverseAliasEnumeratorWithRelativePath:", v6, 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * v16++) updateOnDiskWithAliasTarget:v7 forServerEdit:0];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }

    uint64_t v17 = [v6 itemSyncPausedByBundleID];
    uint64_t v18 = (void *)v7[29];
    v7[29] = v17;

    uint64_t v19 = [v6 itemSyncPausedExpireTS];
    int64_t v20 = (void *)v7[30];
    v7[30] = v19;
  }
  return v7;
}

- (BOOL)updateXattrInfoFromPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!self->_currentVersion)
  {
    id v7 = -[BRCLocalVersion initForPackage:]([BRCLocalVersion alloc], "initForPackage:", [v6 isPackageRoot]);
    currentVersion = self->_currentVersion;
    self->_currentVersion = v7;

    BOOL v9 = self->_currentVersion;
    id v10 = [(BRCDocumentItem *)self _filenameOverrideForPath:v6];
    [(BRCLocalVersion *)v9 updateFromFSAtPath:v6 filenameOverride:v10];
  }
  v13.receiver = self;
  v13.super_class = (Class)BRCDocumentItem;
  BOOL v11 = [(BRCLocalItem *)&v13 updateXattrInfoFromPath:v6 error:a4];

  return v11;
}

+ (id)reverseAliasEnumeratorWithRelativePath:(id)a3
{
  id v3 = a3;
  id v4 = +[BRCPathToItemLookup lookupForRelativePath:v3];
  v5 = [v4 clientZone];
  id v6 = [v5 serverZone];

  id v7 = NSString;
  id v8 = [v6 mangledID];
  BOOL v9 = [v7 unsaltedBookmarkDataWithRelativePath:v3 serverZoneMangledID:v8];

  id v10 = [v3 session];

  BOOL v11 = +[BRCDocumentItem reverseAliasEnumeratorWithUnsaltedBookmarkData:v9 session:v10];

  return v11;
}

+ (id)anyReverseAliasInAppLibrary:(id)a3 toRelativePath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BRCPathToItemLookup lookupForRelativePath:v5];
  id v8 = [v7 clientZone];
  BOOL v9 = [v8 serverZone];

  id v10 = NSString;
  BOOL v11 = [v9 mangledID];
  BOOL v12 = [v10 unsaltedBookmarkDataWithRelativePath:v5 serverZoneMangledID:v11];

  objc_super v13 = +[BRCDocumentItem anyReverseAliasWithUnsaltedBookmarkData:v12 inAppLibrary:v6];

  return v13;
}

- (BOOL)evictInTask:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v64.receiver = self;
  v64.super_class = (Class)BRCDocumentItem;
  if ([(BRCLocalItem *)&v64 evictInTask:v8 options:a4 error:a5])
  {
    BOOL v9 = self->_desiredVersion;
    memset(v63, 0, sizeof(v63));
    __brc_create_section(0, (uint64_t)"-[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]", 420, v63);
    id v10 = brc_bread_crumbs();
    BOOL v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      clientZone = self->super._clientZone;
      *(_DWORD *)buf = 134218754;
      v68 = (const char *)v63[0];
      __int16 v69 = 2112;
      v70 = self;
      __int16 v71 = 2112;
      v72 = clientZone;
      __int16 v73 = 2112;
      v74 = v10;
      _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx evicting client item %@\nin %@%@", buf, 0x2Au);
    }

    if ([(BRCDocumentItem *)self isEvictable])
    {
      if (((a4 | (4 * a4)) & 4) != 0 && self->_shouldAutomaticallyDownloadThumbnail)
      {
        self->_shouldAutomaticallyDownloadThumbnail = 0;
        liveThumbnailSignature = self->_liveThumbnailSignature;
        self->_liveThumbnailSignature = 0;

        [(BRCLocalItem *)self saveToDB];
      }
      if ((a4 & 1) == 0) {
        goto LABEL_42;
      }
      BOOL v13 = [(BRCDocumentItem *)self isFault];
      if (v9) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = v13;
      }
      if (v14)
      {
        uint64_t v15 = brc_bread_crumbs();
        uint64_t v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]();
        }
LABEL_41:

LABEL_42:
        BOOL v17 = 1;
        goto LABEL_43;
      }
      if (v9 && ![(BRCDesiredVersion *)v9 wantsContent])
      {
        uint64_t v15 = brc_bread_crumbs();
        uint64_t v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:].cold.7();
        }
        goto LABEL_41;
      }
      if ([(BRCLocalItem *)self isOnDisk])
      {
        id v21 = [(BRCLocalItem *)self appLibrary];
        int v22 = [v21 hasUbiquityClientsConnected];

        if (v22)
        {
          long long v23 = brc_bread_crumbs();
          long long v24 = brc_default_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]();
          }

          goto LABEL_23;
        }
        BOOL v31 = [(BRCLocalItem *)self fileID];
        uint64_t v32 = [v31 unsignedLongLongValue];

        if (!v32)
        {
          v60 = brc_bread_crumbs();
          v61 = brc_default_log();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
            -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:].cold.5();
          }
        }
        uint64_t v33 = [(BRCAccountSession *)self->super._session volume];
        int v34 = BRCIsFileIDLocked([v33 deviceID], v32);

        if (!v34)
        {
          if ([(BRCDocumentItem *)self isFault]) {
            goto LABEL_68;
          }
          v40 = [(BRCAccountSession *)self->super._session notificationManager];
          uint64_t v41 = [(BRCLocalItem *)self st];
          uint64_t v42 = [v41 documentID];
          int v43 = [v40 hasWatcherForDocumentID:v42];

          if (!v43)
          {
LABEL_68:
            v53 = [(BRCAccountSession *)self->super._session downloadTrackers];
            v54 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
            [v53 document:self didCompleteDownloadWithError:v54];

            v55 = [(BRCLocalItem *)self appLibrary];
            v56 = [v55 db];
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __62__BRCDocumentItem_LegacyAdditions__evictInTask_options_error___block_invoke;
            v62[3] = &unk_1E6996308;
            v62[4] = self;
            [v56 groupInBatch:v62];

            goto LABEL_42;
          }
          v44 = brc_bread_crumbs();
          __int16 v45 = brc_default_log();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
            -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:].cold.4();
          }

          id v46 = [[BRCItemToPathLookup alloc] initWithItem:self];
          __int16 v47 = [(BRCItemToPathLookup *)v46 coordinatedReadURL];
          v48 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v65 = *MEMORY[0x1E4F289D0];
          v66 = v47;
          uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
          v50 = [v48 errorWithDomain:*MEMORY[0x1E4F281F8] code:255 userInfo:v49];

          if (v50)
          {
            v51 = brc_bread_crumbs();
            v52 = brc_default_log();
            if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
            {
              v59 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v68 = "-[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]";
              __int16 v69 = 2080;
              if (!a5) {
                v59 = "(ignored by caller)";
              }
              v70 = (BRCDocumentItem *)v59;
              __int16 v71 = 2112;
              v72 = v50;
              __int16 v73 = 2112;
              v74 = v51;
              _os_log_error_impl(&dword_1D353B000, v52, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }
          }
          if (a5) {
            *a5 = v50;
          }

LABEL_23:
          BOOL v17 = 0;
LABEL_43:
          __brc_leave_section(v63);

          goto LABEL_44;
        }
        int64_t v35 = brc_bread_crumbs();
        uint64_t v36 = brc_default_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]();
        }

        objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F281F8], 255, @"file is flocked");
        uint64_t v18 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v37 = brc_bread_crumbs();
          __int16 v38 = brc_default_log();
          if (os_log_type_enabled(v38, (os_log_type_t)0x90u))
          {
            v58 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            v68 = "-[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]";
            __int16 v69 = 2080;
            if (!a5) {
              v58 = "(ignored by caller)";
            }
            v70 = (BRCDocumentItem *)v58;
            __int16 v71 = 2112;
            v72 = v18;
            __int16 v73 = 2112;
            v74 = v37;
            _os_log_error_impl(&dword_1D353B000, v38, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }
        }
        if (a5) {
          *a5 = v18;
        }
      }
      else
      {
        objc_super v26 = brc_bread_crumbs();
        int v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:].cold.6();
        }

        objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 14, @"Item %@ is not on disk", self);
        uint64_t v18 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          uint64_t v28 = brc_bread_crumbs();
          long long v29 = brc_default_log();
          if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
          {
            v57 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            v68 = "-[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]";
            __int16 v69 = 2080;
            if (!a5) {
              v57 = "(ignored by caller)";
            }
            v70 = (BRCDocumentItem *)v57;
            __int16 v71 = 2112;
            v72 = v18;
            __int16 v73 = 2112;
            v74 = v28;
            _os_log_error_impl(&dword_1D353B000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }
        }
        if (a5) {
          *a5 = v18;
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", 0);
      uint64_t v18 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        uint64_t v19 = brc_bread_crumbs();
        int64_t v20 = brc_default_log();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        {
          objc_super v39 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v68 = "-[BRCDocumentItem(LegacyAdditions) evictInTask:options:error:]";
          __int16 v69 = 2080;
          if (!a5) {
            objc_super v39 = "(ignored by caller)";
          }
          v70 = (BRCDocumentItem *)v39;
          __int16 v71 = 2112;
          v72 = v18;
          __int16 v73 = 2112;
          v74 = v19;
          _os_log_error_impl(&dword_1D353B000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a5) {
        *a5 = v18;
      }
    }

    goto LABEL_23;
  }
  BOOL v17 = 0;
LABEL_44:

  return v17;
}

void __62__BRCDocumentItem_LegacyAdditions__evictInTask_options_error___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 24) serverItemByItemID:*(void *)(*(void *)(a1 + 32) + 48)];
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [*(id *)(a1 + 32) appLibrary];
    int v7 = 138412802;
    id v8 = v2;
    __int16 v9 = 2112;
    id v10 = v6;
    __int16 v11 = 2112;
    BOOL v12 = v3;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] evicting server item %@\nin %@%@", (uint8_t *)&v7, 0x20u);
  }
  LOBYTE(v7) = 0;
  if (v2)
  {
    [*(id *)(a1 + 32) updateDesiredVersionWithServerItem:v2 options:1 needsSave:&v7];
    id v5 = [*(id *)(*(void *)(a1 + 32) + 8) applyScheduler];
    [v5 resetBackoffForServerItem:v2];

    if ((_BYTE)v7) {
      [*(id *)(a1 + 32) saveToDB];
    }
  }
}

- (void)markLiveFromStageWithPath:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v23 markLiveFromStageWithPath:a3];
  if (self->_desiredVersion)
  {
    id v4 = [(BRCClientZone *)self->super._clientZone session];
    id v5 = [v4 fsDownloader];
    [v5 makeContentLive:self];

    id v6 = [(BRCLocalVersion *)self->_currentVersion uploadError];
    int v7 = [(BRCVersion *)self->_currentVersion editedSinceShared];
    char v8 = [v7 BOOLValue];

    if ((v8 & 1) == 0)
    {
      if ([(BRCLocalItem *)self isSharedToMe] || [(BRCLocalItem *)self isSharedByMe])
      {
        __int16 v9 = [(BRCVersion *)self->_currentVersion ckInfo];
        uint64_t v10 = [v9 etag];
        if (v10)
        {
          __int16 v11 = (void *)v10;
          unint64_t v12 = [(BRCVersion *)self->_currentVersion diffAgainst:self->_desiredVersion] & 0x1A0000;

          if (v12)
          {
            uint64_t v13 = brc_bread_crumbs();
            BOOL v14 = brc_default_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
              -[BRCDocumentItem(LegacyAdditions) markLiveFromStageWithPath:]();
            }

            goto LABEL_10;
          }
        }
        else
        {
        }
      }
      uint64_t v18 = [[BRCLocalVersion alloc] initWithVersion:self->_desiredVersion];
      currentVersion = self->_currentVersion;
      self->_currentVersion = v18;

      goto LABEL_16;
    }
LABEL_10:
    uint64_t v15 = [[BRCLocalVersion alloc] initWithVersion:self->_desiredVersion];
    uint64_t v16 = self->_currentVersion;
    self->_currentVersion = v15;

    [(BRCVersion *)self->_currentVersion setEditedSinceShared:MEMORY[0x1E4F1CC38]];
LABEL_16:
    if (objc_msgSend(v6, "br_isCloudDocsErrorCode:", 43)) {
      [(BRCLocalVersion *)self->_currentVersion setUploadError:v6];
    }
    BOOL v20 = [(BRCDocumentItem *)self isFault];
    if (v20 != [(BRCDesiredVersion *)self->_desiredVersion isFault])
    {
      id v21 = brc_bread_crumbs();
      int v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem(LegacyAdditions) markLiveFromStageWithPath:]();
      }
    }
    if ([(BRCDocumentItem *)self isFault]) {
      [(BRCDesiredVersion *)self->_desiredVersion markLiveAsFault];
    }
    goto LABEL_21;
  }
  id v6 = brc_bread_crumbs();
  BOOL v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[BRCDocumentItem(LegacyAdditions) markLiveFromStageWithPath:]();
  }

LABEL_21:
}

- (void)stageFaultForCreation:(BOOL)a3 name:(id)a4 size:(id)a5 isPackage:(BOOL)a6
{
  BOOL v7 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  if (v9)
  {
    if (v7) {
      __int16 v11 = &v20;
    }
    else {
      __int16 v11 = 0;
    }
    Properties = _CFURLPromiseCreateProperties();
    uint64_t v13 = [(BRCAccountSession *)self->super._session stageRegistry];
    BOOL v14 = [(BRCLocalItem *)self appLibrary];
    id v19 = 0;
    char v15 = [v13 makeSideFaultInStageGatherFileID:&v21 generationID:(char *)&v20 + 4 documentID:v11 properties:Properties inAppLibrary:v14 forCreation:v7 error:&v19];
    id v16 = v19;

    if (v15)
    {
      if (v7) {
        [(BRCLocalItem *)self markStagedWithFileID:v21 generationID:HIDWORD(v20) documentID:v20];
      }
      else {
        [(BRCLocalItem *)self markStagedWithFileID:v21 generationID:HIDWORD(v20)];
      }
    }
    else
    {
      BOOL v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        -[BRCDocumentItem(LegacyAdditions) stageFaultForCreation:name:size:isPackage:]();
      }
    }
  }
  else
  {
    brc_bread_crumbs();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    Properties = brc_default_log();
    if (os_log_type_enabled(Properties, (os_log_type_t)0x90u)) {
      -[BRCDocumentItem(LegacyAdditions) stageFaultForCreation:name:size:isPackage:]();
    }
  }
}

- (void)stageFaultForCreation:(BOOL)a3 serverItem:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v11 = [(BRCLocalItem *)self computedDestinationFilenameFromServerItem:v6];
  BOOL v7 = NSNumber;
  char v8 = [v6 latestVersion];
  id v9 = objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v8, "size"));
  id v10 = [v6 latestVersion];

  -[BRCDocumentItem stageFaultForCreation:name:size:isPackage:](self, "stageFaultForCreation:name:size:isPackage:", v4, v11, v9, [v10 isPackage]);
}

- (int)updateDesiredVersionWithServerItem:(id)a3 options:(unsigned int)a4 needsSave:(BOOL *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  LODWORD(a5) = [(BRCDocumentItem *)self updateDesiredVersionWithServerItem:v8 diffs:[(BRCDocumentItem *)self diffAgainstServerItem:v8] options:v6 needsSave:a5];

  return (int)a5;
}

- (int)updateDesiredVersionWithServerItem:(id)a3 diffs:(unint64_t)a4 options:(unsigned int)a5 needsSave:(BOOL *)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v159 = a3;
  v154 = [(BRCAccountSession *)self->super._session fsDownloader];
  v158 = [v159 latestVersion];
  uint64_t v161 = 0;
  BOOL v157 = [(BRCLocalItem *)self isReserved];
  BOOL v8 = [(BRCDocumentItem *)self isPausedFromSync];
  v156 = [(BRCAccountSession *)self->super._session applyScheduler];
  if (v157) {
    int v9 = 1;
  }
  else {
    int v9 = 2;
  }
  unsigned int v152 = v9;
  if (!v6)
  {
    v142 = brc_bread_crumbs();
    v143 = brc_default_log();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:]4();
    }
  }
  memset(v160, 0, sizeof(v160));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:]", 621, v160);
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v110 = v160[0];
    BRCPrettyPrintBitmap();
    id v111 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    uint64_t v163 = v110;
    __int16 v164 = 2112;
    uint64_t v165 = (uint64_t)v111;
    __int16 v166 = 2112;
    id v167 = v159;
    __int16 v168 = 2112;
    v169 = self;
    __int16 v170 = 2112;
    uint64_t v171 = (uint64_t)v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx requesting to stage %@\n  server: %@\n   local: %@%@", buf, 0x34u);
  }
  if ((v6 & 4) != 0 && [v158 isSmallAndMostRecentClientsGenerateThumbnails])
  {
    unint64_t v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:]3();
    }

    uint64_t v6 = v6 & 0xFFFFFFF9 | 2;
  }
  if (v157 || v8)
  {
    unsigned int v151 = 0;
  }
  else
  {
    BOOL v14 = [v158 thumbnailSignature];
    if (v14)
    {
      liveThumbnailSignature = self->_liveThumbnailSignature;
      id v16 = [v158 thumbnailSignature];
      LODWORD(liveThumbnailSignature) = [(NSData *)liveThumbnailSignature isEqualToData:v16];

      unsigned int v151 = (liveThumbnailSignature ^ 1) & (v6 >> 2);
    }
    else
    {
      unsigned int v151 = 0;
    }
  }
  if ((v6 & 3) == 0)
  {
    desiredVersion = self->_desiredVersion;
    if (desiredVersion) {
      uint64_t v6 = [(BRCDesiredVersion *)desiredVersion options] & 3 | v6;
    }
    if ((v6 & 3) == 0)
    {
      if (![(BRCDocumentItem *)self isFault])
      {
        uint64_t v6 = v6 | 2;
        if (!v8) {
          goto LABEL_30;
        }
        goto LABEL_25;
      }
      uint64_t v6 = v6 | 1;
    }
  }
  if (!v8) {
    goto LABEL_30;
  }
LABEL_25:
  if ((v6 & 2) == 0 || [(BRCDocumentItem *)self isFault])
  {
    uint64_t v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:]2();
    }
  }
LABEL_30:
  if (v158)
  {
    uint64_t v20 = 67043328;
    if (v8) {
      uint64_t v20 = 0x40000;
    }
    int v150 = v20 & a4;
    char v21 = (v20 & a4 & 0x180000) != 0 || v157;
    if (v21) {
      goto LABEL_37;
    }
    if (v6)
    {
      if (![(BRCDocumentItem *)self isFault])
      {
LABEL_37:
        int v22 = 0;
        goto LABEL_38;
      }
      v80 = [(BRCLocalStatInfo *)self->super._st logicalNameWithoutLocalBounce];
      v81 = [v159 st];
      v82 = [v81 logicalName];
      if ([v80 isEqualToString:v82])
      {
        int v22 = 1;
      }
      else
      {
        v112 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
        v113 = [v159 st];
        v114 = [v113 logicalName];
        int v22 = [v112 isEqualToString:v114];
      }
    }
    else if ((v6 & 2) != 0)
    {
      int v22 = ![(BRCDocumentItem *)self isFault];
    }
    else
    {
      if ((v6 & 4) == 0)
      {
        v146 = brc_bread_crumbs();
        v147 = brc_default_log();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_FAULT)) {
          -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:]0();
        }
      }
      int v22 = 1;
    }
LABEL_38:
    unint64_t v23 = [(BRCVersion *)self->_desiredVersion diffAgainst:v158];
    if (v157)
    {
LABEL_39:
      int v24 = 0;
      goto LABEL_40;
    }
    int v24 = 0;
    v58 = self->_desiredVersion;
    if (v58 && (v23 & 0x180000) == 0)
    {
      if (v6)
      {
        if (![(BRCDesiredVersion *)v58 isFault]) {
          goto LABEL_39;
        }
        v102 = [(BRCDesiredVersion *)self->_desiredVersion serverName];
        v103 = [v159 st];
        v104 = [v103 logicalName];
        int v24 = [v102 isEqualToString:v104];
      }
      else if ((v6 & 2) != 0)
      {
        int v24 = ![(BRCDesiredVersion *)v58 isFault];
      }
      else
      {
        if ((v6 & 4) == 0)
        {
          v148 = brc_bread_crumbs();
          v149 = brc_default_log();
          if (os_log_type_enabled(v149, OS_LOG_TYPE_FAULT)) {
            -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:]0();
          }
        }
        int v24 = 1;
      }
    }
LABEL_40:
    if (v22)
    {
      long long v25 = brc_bread_crumbs();
      objc_super v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        int v27 = BRCItemFieldsPrettyPrint();
        -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.6(v27);
      }

      uint64_t v28 = [(BRCLocalStatInfo *)self->super._st stagedFileID];

      if (v28)
      {
        [(BRCDocumentItem *)self clearFromStage];
        *a6 = 1;
      }
      long long v29 = self->_desiredVersion;
      if (v29 && ![(BRCDesiredVersion *)v29 isFault]) {
        [v154 cancelAndCleanupItemDownload:self kind:0];
      }
      if ((v150 & 0x33B0000) == 0x10000)
      {
        [(BRCDocumentItem *)self updateContentsCKInfoAndDeviceIDFromServerItem:v159];
        *a6 = 1;
      }
      unint64_t sharingOptions = self->super._sharingOptions;
      char v31 = [v159 sharingOptions] ^ sharingOptions;
      if ((v31 & 0x20) != 0)
      {
        uint64_t v32 = brc_bread_crumbs();
        uint64_t v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v163 = (uint64_t)v32;
          _os_log_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEFAULT, "[WARNING] Force apply because we need to update the permissions%@", buf, 0xCu);
        }
      }
      int v34 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
      int64_t v35 = [v159 st];
      uint64_t v36 = [v35 logicalName];
      int v37 = [v34 isEqualToString:v36];

      if (v37)
      {
        __int16 v38 = brc_bread_crumbs();
        objc_super v39 = brc_default_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.5();
        }

        st = self->super._st;
        uint64_t v41 = [v159 st];
        uint64_t v42 = [v41 logicalName];
        int v43 = [(BRCLocalStatInfo *)self->super._st physicalName];
        v44 = [v159 st];
        __int16 v45 = [v44 logicalName];
        [(BRCLocalStatInfo *)st setFilename:v42 forcePhysicalName:v43 forceBouncedLogicalName:0 serverName:v45];

        int v46 = a4 & 0xFFFFFFBF;
      }
      else
      {
        int v46 = a4;
      }
      uint64_t v90 = v31 & 0x20;
      LODWORD(a4) = v46;
      if ((((v150 & 0x33A0000 | (unint64_t)(v46 & 0x7FFF) | v90) == 0) & ~v151) == 0)
      {
        v91 = brc_bread_crumbs();
        v92 = brc_default_log();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        {
          BRCItemFieldsPrettyPrint();
          id v136 = (id)objc_claimAutoreleasedReturnValue();
          BRCItemFieldsPrettyPrint();
          id v137 = (id)objc_claimAutoreleasedReturnValue();
          BRCItemFieldsPrettyPrint();
          id v138 = (id)objc_claimAutoreleasedReturnValue();
          v139 = v138;
          *(_DWORD *)buf = 138413570;
          v140 = "yes";
          uint64_t v163 = (uint64_t)v136;
          __int16 v164 = 2112;
          if (v90) {
            v141 = "yes";
          }
          else {
            v141 = "no";
          }
          uint64_t v165 = (uint64_t)v137;
          if (!v151) {
            v140 = "no";
          }
          __int16 v166 = 2112;
          id v167 = v138;
          __int16 v168 = 2080;
          v169 = (BRCDocumentItem *)v141;
          __int16 v170 = 2080;
          uint64_t v171 = (uint64_t)v140;
          __int16 v172 = 2112;
          v173 = v91;
          _os_log_debug_impl(&dword_1D353B000, v92, OS_LOG_TYPE_DEBUG, "[DEBUG] Proceeding with apply changes for metadata only update\ndiff w/ current: %@ / %@\ndiff w/ server-item: %@\nneeds permission for sharing update: %s\nneeds thumbnail: %s\n%@", buf, 0x3Eu);
        }
        v93 = [BRCDesiredVersion alloc];
        if (v8)
        {
          currentVersion = self->_currentVersion;
          v95 = [v159 st];
          v96 = [v95 logicalName];
          v97 = [(BRCDesiredVersion *)v93 initWithServerVersion:currentVersion serverName:v96];
          v98 = self->_desiredVersion;
          self->_desiredVersion = v97;

          v99 = [v158 originalPOSIXName];
          v100 = (void *)[v99 copy];
          [(BRCVersion *)self->_desiredVersion setOriginalPOSIXName:v100];
        }
        else
        {
          v99 = [v159 st];
          v100 = [v99 logicalName];
          v108 = [(BRCDesiredVersion *)v93 initWithServerVersion:v158 serverName:v100];
          v109 = self->_desiredVersion;
          self->_desiredVersion = v108;
        }
        [(BRCDesiredVersion *)self->_desiredVersion setOptions:v6];
        [(BRCLocalItem *)self markStagedWithFileID:0 generationID:0];
        uint64_t v56 = 1;
        *a6 = 1;
        goto LABEL_133;
      }
      v101 = self->_desiredVersion;
      if (v101)
      {
        self->_desiredVersion = 0;

        *a6 = 1;
      }
      if ((v150 & 0x800000) == 0)
      {
        uint64_t v56 = 0;
        goto LABEL_133;
      }
      v107 = [v158 conflictLoserEtags];
      [(BRCVersion *)self->_currentVersion setConflictLoserEtags:v107];

      uint64_t v56 = 0;
    }
    else
    {
      if (v24)
      {
        v59 = [(BRCLocalStatInfo *)self->super._st stagedFileID];
        uint64_t v60 = [v59 unsignedLongLongValue];

        v61 = brc_bread_crumbs();
        v62 = brc_default_log();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          v63 = BRCItemFieldsPrettyPrint();
          -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.8(v63);
        }

        unsigned int v64 = [(BRCDesiredVersion *)self->_desiredVersion options];
        uint64_t v65 = ((v64 ^ v6) << 20) & 0x400000 | ((((v64 ^ v6) >> 1) & 1) << 23);
        v66 = self->_desiredVersion;
        if (v23 | v65)
        {
          v67 = [(BRCVersion *)v66 ckInfo];
          v68 = [v67 etag];

          __int16 v69 = [v159 latestVersion];
          v70 = [v69 ckInfo];
          __int16 v71 = [v70 etag];

          v72 = [BRCDesiredVersion alloc];
          __int16 v73 = [v159 st];
          v74 = [v73 logicalName];
          uint64_t v75 = [(BRCDesiredVersion *)v72 initWithServerVersion:v158 serverName:v74];
          v76 = self->_desiredVersion;
          self->_desiredVersion = v75;

          [(BRCDesiredVersion *)self->_desiredVersion setOptions:v6];
          v77 = self->_desiredVersion;
          if (v77)
          {
            char v78 = [(BRCDesiredVersion *)v77 isFault];
            char v79 = (v23 & 0x10000) != 0 ? v78 : 1;
            if ((v79 & 1) == 0)
            {
              if (v60) {
                [v154 updateContentDownloadForMetaOnlyChange:self fromEtag:v68 toEtag:v71];
              }
              else {
                [v154 cancelAndCleanupItemDownload:self kind:0];
              }
            }
          }
          *a6 = 1;
        }
        else if ([(BRCDesiredVersion *)v66 options] != v6)
        {
          [(BRCDesiredVersion *)self->_desiredVersion setOptions:v6];
          *a6 = 1;
        }
        if (v60)
        {
          v115 = [(BRCAccountSession *)self->super._session stageRegistry];
          int v116 = [v115 didFlushStagedFileID:v60];

          if (v116)
          {
            v117 = brc_bread_crumbs();
            v118 = brc_default_log();
            if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG)) {
              -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.7();
            }

            uint64_t v56 = 1;
LABEL_133:
            if ((a4 & 0xF0000000) != 0)
            {
              v119 = brc_bread_crumbs();
              v120 = brc_default_log();
              if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
              {
                v121 = BRCItemFieldsPrettyPrint();
                -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.4(v121);
              }

              [(BRCLocalItem *)self updateItemMetadataFromServerItem:v159 appliedSharingPermission:0];
              *a6 = 1;
            }
            if ([(BRCDesiredVersion *)self->_desiredVersion wantsContent])
            {
              if (![(BRCDesiredVersion *)self->_desiredVersion isFault])
              {
                v122 = [(BRCLocalItem *)self st];
                v123 = [v122 stagedFileID];
                BOOL v124 = v123 == 0;

                if (v124)
                {
                  if (v56) {
                    uint64_t v56 = v56;
                  }
                  else {
                    uint64_t v56 = 23;
                  }
                  [v154 scheduleContentDownloadForItem:self serverItem:v159 options:v6 etagIfLoser:0 stageFileName:0 error:0];
                }
              }
            }
            if (v157)
            {
              if ((v6 & 2) == 0)
              {
LABEL_146:
                if (v56 == 23)
                {
                  v144 = brc_bread_crumbs();
                  v145 = brc_default_log();
                  if (os_log_type_enabled(v145, OS_LOG_TYPE_FAULT)) {
                    -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:]();
                  }

                  uint64_t v56 = 23;
                  goto LABEL_166;
                }
              }
            }
            else
            {
              if (v151) {
                [v154 scheduleThumbnailDownloadForItem:self serverItem:v159 applySchedulerState:(char *)&v161 + 4];
              }
              else {
                [v154 cancelAndCleanupItemDownload:self kind:1];
              }
              if ((v6 & 2) != 0)
              {
                [v154 scheduleLosersDownloadForItem:self serverItem:v159 purgeStaleEntries:0 applySchedulerState:&v161];
              }
              else if ((v6 & 1) != 0 && [v154 shouldScheduleLosersEvictionForItem:self])
              {
                LODWORD(v161) = 1;
              }
              if (v56 == 1
                || (HIDWORD(v161) != 1 ? (BOOL v125 = v56 == 0) : (BOOL v125 = 1),
                    !v125 ? (unsigned int v126 = v56) : (unsigned int v126 = HIDWORD(v161)),
                    v126 == 1))
              {
                uint64_t v56 = 1;
                goto LABEL_166;
              }
              if (v161 == 1 || v126 == 0) {
                uint64_t v56 = v161;
              }
              else {
                uint64_t v56 = v126;
              }
              if ((v6 & 2) == 0) {
                goto LABEL_146;
              }
            }
            if (!v56)
            {
              [v156 setState:0 andApplyKind:v152 forServerItem:v159 localItem:self];
LABEL_167:
              v127 = brc_bread_crumbs();
              v128 = brc_default_log();
              if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v131 = [v159 rank];
                uint64_t v132 = BRCPrettyPrintEnum();
                BRCPrettyPrintBitmap();
                id v133 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v134 = BRCPrettyPrintEnum();
                uint64_t v135 = BRCPrettyPrintEnum();
                *(_DWORD *)buf = 134219266;
                uint64_t v163 = v131;
                __int16 v164 = 2080;
                uint64_t v165 = v132;
                __int16 v166 = 2112;
                id v167 = v133;
                __int16 v168 = 2080;
                v169 = (BRCDocumentItem *)v134;
                __int16 v170 = 2080;
                uint64_t v171 = v135;
                __int16 v172 = 2112;
                v173 = v127;
                _os_log_debug_impl(&dword_1D353B000, v128, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: state:%s options:%@ (thumbnail:%s losers:%s)%@", buf, 0x3Eu);
              }
              goto LABEL_170;
            }
LABEL_166:
            [v156 createApplyJobFromServerItem:v159 localItem:0 state:v56 kind:v152];
            goto LABEL_167;
          }
        }
        else
        {
          if ((v6 & 1) == 0)
          {
            uint64_t v56 = 23;
            goto LABEL_133;
          }
          [(BRCDocumentItem *)self stageFaultForCreation:v157 serverItem:v159];
          *a6 = 1;
        }
        uint64_t v56 = 20;
        goto LABEL_133;
      }
      v83 = self->_desiredVersion;
      if (v83 && ![(BRCDesiredVersion *)v83 isFault]) {
        [v154 cancelAndCleanupItemDownload:self kind:0];
      }
      v84 = [(BRCLocalStatInfo *)self->super._st stagedFileID];

      if (v84) {
        [(BRCDocumentItem *)self clearFromStage];
      }
      v85 = [BRCDesiredVersion alloc];
      v86 = [v159 st];
      v87 = [v86 logicalName];
      v88 = [(BRCDesiredVersion *)v85 initWithServerVersion:v158 serverName:v87];
      v89 = self->_desiredVersion;
      self->_desiredVersion = v88;

      [(BRCDesiredVersion *)self->_desiredVersion setOptions:v6];
      if (v6)
      {
        [(BRCDocumentItem *)self stageFaultForCreation:v157 serverItem:v159];
        uint64_t v56 = 20;
      }
      else
      {
        uint64_t v56 = 23;
      }
      if (v157)
      {
        v105 = brc_bread_crumbs();
        v106 = brc_default_log();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG)) {
          -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:].cold.9();
        }

        uint64_t v56 = 1;
      }
    }
    *a6 = 1;
    goto LABEL_133;
  }
  __int16 v47 = brc_bread_crumbs();
  v48 = brc_default_log();
  if (os_log_type_enabled(v48, (os_log_type_t)0x90u)) {
    -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:]();
  }

  uint64_t v49 = +[BRCEventsAnalytics sharedAnalytics];
  [v49 registerAndSendNewApplyFailureWithOutcome:@"missing-version"];

  v50 = [(BRCClientZone *)self->super._clientZone asPrivateClientZone];
  itemID = self->super._itemID;
  v52 = [v159 serverZone];
  v53 = [v52 zoneID];
  v54 = [(BRCItemID *)itemID contentsRecordIDInZoneID:v53];
  v55 = [v54 recordName];
  [v50 reportProblemWithType:4 recordName:v55];

  uint64_t v56 = brc_bread_crumbs();
  v57 = brc_default_log();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
    -[BRCDocumentItem(LegacyAdditions) updateDesiredVersionWithServerItem:diffs:options:needsSave:]();
  }

  LODWORD(v56) = 28;
  [v156 setState:28 andApplyKind:v152 forServerItem:v159 localItem:self];
LABEL_170:
  __brc_leave_section(v160);

  return v56;
}

- (void)clearDesiredVersion
{
  id v3 = brc_bread_crumbs();
  BOOL v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCDocumentItem(LegacyAdditions) clearDesiredVersion]();
  }

  if (![(BRCDesiredVersion *)self->_desiredVersion isFault])
  {
    id v5 = [(BRCAccountSession *)self->super._session fsDownloader];
    [v5 cancelAndCleanupItemDownload:self kind:0];
  }
  desiredVersion = self->_desiredVersion;
  self->_desiredVersion = 0;
}

- (id)setOfAppLibraryIDsWithReverseAliases
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  db = self->super._db;
  BOOL v4 = [(BRCLocalItem *)self unsaltedBookmarkData];
  id v5 = [(BRCPQLConnection *)db fetch:@"SELECT app_library_rowid FROM client_items WHERE item_alias_target = %@ AND item_type = 3", v4];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v16 = v5;
  uint64_t v6 = [v5 enumerateObjectsOfClass:objc_opt_class()];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (!v9) {
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        }
        uint64_t v13 = [(BRCAccountSession *)self->super._session appLibraryByRowID:v12];
        BOOL v14 = [v13 appLibraryID];
        [v9 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)anyReverseAliasWithUnsaltedBookmarkData:(id)a3 inAppLibrary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 session];
  uint64_t v8 = [v7 clientDB];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__BRCDocumentItem_LegacyAdditions__anyReverseAliasWithUnsaltedBookmarkData_inAppLibrary___block_invoke;
  v13[3] = &unk_1E6994120;
  id v14 = v7;
  id v9 = v7;
  uint64_t v10 = [v5 dbRowID];

  id v11 = (void *)[v8 fetchObject:v13, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_alias_target = %@ AND item_type = 3 AND app_library_rowid = %@", v6, v10 sql];
  return v11;
}

id __89__BRCDocumentItem_LegacyAdditions__anyReverseAliasWithUnsaltedBookmarkData_inAppLibrary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  uint64_t v8 = [v7 asBRAlias];

  return v8;
}

+ (id)reverseAliasEnumeratorWithUnsaltedBookmarkData:(id)a3 session:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 clientDB];
  uint64_t v8 = (void *)[v7 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_alias_target = %@ AND item_type = 3 AND item_state != 1", v6];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__BRCDocumentItem_LegacyAdditions__reverseAliasEnumeratorWithUnsaltedBookmarkData_session___block_invoke;
  v13[3] = &unk_1E6994148;
  id v14 = v5;
  id v15 = v7;
  id v9 = v7;
  id v10 = v5;
  id v11 = [v8 enumerateObjects:v13];

  return v11;
}

id __91__BRCDocumentItem_LegacyAdditions__reverseAliasEnumeratorWithUnsaltedBookmarkData_session___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (id)reverseAliasEnumerator
{
  id v3 = [(BRCLocalItem *)self unsaltedBookmarkData];
  BOOL v4 = +[BRCDocumentItem reverseAliasEnumeratorWithUnsaltedBookmarkData:v3 session:self->super._session];

  return v4;
}

- (id)anyReverseAliasInAppLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCLocalItem *)self unsaltedBookmarkData];
  id v6 = +[BRCDocumentItem anyReverseAliasWithUnsaltedBookmarkData:v5 inAppLibrary:v4];

  return v6;
}

- (void)clearFromStage
{
  id v3 = [(BRCAccountSession *)self->super._session fsDownloader];
  [v3 cancelAndCleanupItemDownload:self kind:0];

  v4.receiver = self;
  v4.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v4 clearFromStage];
}

- (BOOL)isPausedFromSync
{
  return self->_syncPausedByBundleID != 0;
}

- (BOOL)isResumingSync
{
  id v2 = [(PQLConnection *)self->super._db numberWithSQL:@"SELECT version_block_sync_until_resuming FROM client_items WHERE rowid = %llu", self->super._dbRowID];
  BOOL v3 = [v2 integerValue] != 0;

  return v3;
}

- (void)resumeSyncComplete
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(BRCPQLConnection *)self->super._db execute:@"UPDATE client_items SET version_block_sync_until_resuming = NULL WHERE rowid = %llu", self->super._dbRowID];
  objc_super v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = "with failure";
    *(_DWORD *)buf = 136315650;
    if (v3) {
      id v6 = "successfully";
    }
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] Resume sync completed %s for item %@%@", buf, 0x20u);
  }
}

- (BOOL)pauseFromSyncWithTimeout:(double)a3 forBundleID:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if ([(BRCDocumentItem *)self isFault])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorDocumentEvicted");
    id v10 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
    if (!v10) {
      goto LABEL_29;
    }
    __int16 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (!os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
      goto LABEL_28;
    }
    uint64_t v13 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    uint64_t v32 = "-[BRCDocumentItem(LegacyAdditions) pauseFromSyncWithTimeout:forBundleID:error:]";
    __int16 v33 = 2080;
    if (!a5) {
      uint64_t v13 = "(ignored by caller)";
    }
    goto LABEL_27;
  }
  if (self->_syncPausedByBundleID && (objc_msgSend(v9, "isEqualToString:") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemAlreadyPausedFromSyncByBundleID:", self->_syncPausedByBundleID);
    id v10 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
    if (!v10) {
      goto LABEL_29;
    }
    __int16 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (!os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
      goto LABEL_28;
    }
    uint64_t v13 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    uint64_t v32 = "-[BRCDocumentItem(LegacyAdditions) pauseFromSyncWithTimeout:forBundleID:error:]";
    __int16 v33 = 2080;
    if (!a5) {
      uint64_t v13 = "(ignored by caller)";
    }
    goto LABEL_27;
  }
  if (a3 <= 0.0
    || (+[BRCUserDefaults defaultsForMangledID:0],
        id v14 = objc_claimAutoreleasedReturnValue(),
        [v14 maxPauseFileTimeout],
        double v16 = v15,
        v14,
        v16 < a3))
  {
    long long v17 = (void *)MEMORY[0x1E4F28C58];
    long long v18 = [NSNumber numberWithDouble:a3];
    objc_msgSend(v17, "brc_errorInvalidParameter:value:", @"timestamp", v18);
    id v10 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();

    if (!v10) {
      goto LABEL_29;
    }
    __int16 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (!os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
      goto LABEL_28;
    }
    uint64_t v13 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    uint64_t v32 = "-[BRCDocumentItem(LegacyAdditions) pauseFromSyncWithTimeout:forBundleID:error:]";
    __int16 v33 = 2080;
    if (!a5) {
      uint64_t v13 = "(ignored by caller)";
    }
    goto LABEL_27;
  }
  uint64_t v19 = brc_interval_to_nsec();
  uint64_t v20 = brc_current_date_nsec() + v19;
  if ([(BRCPQLConnection *)self->super._db execute:@"UPDATE client_items SET version_block_sync_until_bundle_id = %@, version_block_sync_until_timestamp = %llu, version_block_sync_until_resuming = NULL WHERE rowid = %llu", v9, v20, self->super._dbRowID])
  {
    objc_storeStrong((id *)&self->_syncPausedByBundleID, a4);
    char v21 = [NSNumber numberWithLongLong:v20];
    syncPausedExpireTS = self->_syncPausedExpireTS;
    self->_syncPausedExpireTS = v21;

    unint64_t v23 = [[BRCItemToPathLookup alloc] initWithItem:self];
    int v24 = [(BRCItemToPathLookup *)v23 byFileSystemID];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __79__BRCDocumentItem_LegacyAdditions__pauseFromSyncWithTimeout_forBundleID_error___block_invoke;
    v28[3] = &unk_1E6993E30;
    long long v29 = v23;
    __int16 v30 = self;
    id v10 = v23;
    [v24 performOnOpenFileDescriptor:v28 error:0];

    [(BRCItemToPathLookup *)v10 closePaths];
    long long v25 = [(BRCAccountSession *)self->super._session autoResumeSyncTimerScheduler];
    [v25 reschedule];

    BOOL v26 = 1;
    goto LABEL_32;
  }
  id v10 = [(BRCPQLConnection *)self->super._db lastError];
  if (v10)
  {
    __int16 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (!os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v13 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    uint64_t v32 = "-[BRCDocumentItem(LegacyAdditions) pauseFromSyncWithTimeout:forBundleID:error:]";
    __int16 v33 = 2080;
    if (!a5) {
      uint64_t v13 = "(ignored by caller)";
    }
LABEL_27:
    int v34 = v13;
    __int16 v35 = 2112;
    uint64_t v36 = v10;
    __int16 v37 = 2112;
    __int16 v38 = v11;
    _os_log_error_impl(&dword_1D353B000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_28;
  }
LABEL_29:
  if (a5)
  {
    id v10 = v10;
    BOOL v26 = 0;
    *a5 = v10;
  }
  else
  {
    BOOL v26 = 0;
  }
LABEL_32:

  return v26;
}

uint64_t __79__BRCDocumentItem_LegacyAdditions__pauseFromSyncWithTimeout_forBundleID_error___block_invoke(uint64_t a1, int a2)
{
  objc_super v4 = NSString;
  id v5 = [*(id *)(a1 + 32) byFileSystemID];
  id v6 = [v5 physicalURL];
  uint64_t v7 = objc_msgSend(v4, "stringWithUTF8String:", objc_msgSend(v6, "fileSystemRepresentation"));

  BRCSetXattrValueForKeyOnFD(a2, v7, @"com.apple.clouddocs.private.item-sync-paused-by-bundle-id#N", *(void **)(*(void *)(a1 + 40) + 232));
  uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 240) stringValue];
  BRCSetXattrValueForKeyOnFD(a2, v7, @"com.apple.clouddocs.private.item-sync-paused-expire-timestamp#N", v8);

  return 0;
}

- (BOOL)resumeSyncForBundleID:(id)a3 dropLocalChanges:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (self->_syncPausedByBundleID)
  {
    if (!v8 || (objc_msgSend(v8, "isEqualToString:") & 1) != 0)
    {
      BOOL v10 = (self->super._localDiffs & 0x3FB0000) != 0;
      BOOL v11 = (self->super._localDiffs & 0x3FB0000) != 0 && v6;
      db = self->super._db;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __81__BRCDocumentItem_LegacyAdditions__resumeSyncForBundleID_dropLocalChanges_error___block_invoke;
      uint64_t v31[3] = &unk_1E6993C00;
      BOOL v32 = v11;
      v31[4] = self;
      char v13 = [(BRCPQLConnection *)db groupInTransaction:v31];
      if (v13)
      {
        id v14 = brc_bread_crumbs();
        double v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          BRCItemFieldsPrettyPrint();
          double v16 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          int v34 = v16;
          __int16 v35 = 1024;
          *(_DWORD *)uint64_t v36 = v11;
          *(_WORD *)&v36[4] = 2112;
          *(void *)&v36[6] = v14;
          _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] resumeSyncForBundleID: document local diffs: %@, trigger resuming: %d%@", buf, 0x1Cu);
        }
        long long v17 = self->super._db;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __81__BRCDocumentItem_LegacyAdditions__resumeSyncForBundleID_dropLocalChanges_error___block_invoke_98;
        v28[3] = &unk_1E6996330;
        BOOL v29 = v6;
        BOOL v30 = v10;
        void v28[4] = self;
        [(BRCPQLConnection *)v17 groupInBatch:v28];
        if (v9)
        {
          long long v18 = [(BRCAccountSession *)self->super._session autoResumeSyncTimerScheduler];
          [v18 reschedule];
        }
      }
      else
      {
        unint64_t v23 = [(BRCPQLConnection *)self->super._db lastError];
        if (v23)
        {
          int v24 = brc_bread_crumbs();
          long long v25 = brc_default_log();
          if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
          {
            int v27 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            int v34 = "-[BRCDocumentItem(LegacyAdditions) resumeSyncForBundleID:dropLocalChanges:error:]";
            __int16 v35 = 2080;
            if (!a5) {
              int v27 = "(ignored by caller)";
            }
            *(void *)uint64_t v36 = v27;
            *(_WORD *)&v36[8] = 2112;
            *(void *)&v36[10] = v23;
            __int16 v37 = 2112;
            __int16 v38 = v24;
            _os_log_error_impl(&dword_1D353B000, v25, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }
        }
        if (a5) {
          *a5 = v23;
        }
      }
      goto LABEL_29;
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemAlreadyPausedFromSyncByBundleID:", self->_syncPausedByBundleID);
    if (v19)
    {
      uint64_t v20 = brc_bread_crumbs();
      char v21 = brc_default_log();
      if (!os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
        goto LABEL_25;
      }
      uint64_t v22 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      int v34 = "-[BRCDocumentItem(LegacyAdditions) resumeSyncForBundleID:dropLocalChanges:error:]";
      __int16 v35 = 2080;
      if (!a5) {
        uint64_t v22 = "(ignored by caller)";
      }
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotPausedFromSync");
    if (v19)
    {
      uint64_t v20 = brc_bread_crumbs();
      char v21 = brc_default_log();
      if (!os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v22 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      int v34 = "-[BRCDocumentItem(LegacyAdditions) resumeSyncForBundleID:dropLocalChanges:error:]";
      __int16 v35 = 2080;
      if (!a5) {
        uint64_t v22 = "(ignored by caller)";
      }
LABEL_35:
      *(void *)uint64_t v36 = v22;
      *(_WORD *)&v36[8] = 2112;
      *(void *)&v36[10] = v19;
      __int16 v37 = 2112;
      __int16 v38 = v20;
      _os_log_error_impl(&dword_1D353B000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      goto LABEL_25;
    }
  }
LABEL_26:
  if (a5) {
    *a5 = v19;
  }

  char v13 = 0;
LABEL_29:

  return v13;
}

uint64_t __81__BRCDocumentItem_LegacyAdditions__resumeSyncForBundleID_dropLocalChanges_error___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v3 = "1";
  }
  else {
    BOOL v3 = "NULL";
  }
  uint64_t v4 = [a2 execute:@"UPDATE client_items SET version_block_sync_until_bundle_id = NULL, version_block_sync_until_timestamp = NULL, version_block_sync_until_resuming = %s WHERE rowid = %llu", v3, *(void *)(*(void *)(a1 + 32) + 120)];
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void **)(v5 + 232);
    *(void *)(v5 + 232) = 0;

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 240);
    *(void *)(v7 + 240) = 0;

    id v9 = [[BRCItemToPathLookup alloc] initWithItem:*(void *)(a1 + 32)];
    BOOL v10 = [(BRCItemToPathLookup *)v9 byFileSystemID];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__BRCDocumentItem_LegacyAdditions__resumeSyncForBundleID_dropLocalChanges_error___block_invoke_2;
    v14[3] = &unk_1E6993E30;
    uint64_t v11 = *(void *)(a1 + 32);
    double v15 = v9;
    uint64_t v16 = v11;
    uint64_t v12 = v9;
    [v10 performOnOpenFileDescriptor:v14 error:0];

    [(BRCItemToPathLookup *)v12 closePaths];
  }
  return v4;
}

uint64_t __81__BRCDocumentItem_LegacyAdditions__resumeSyncForBundleID_dropLocalChanges_error___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4 = NSString;
  uint64_t v5 = [*(id *)(a1 + 32) byFileSystemID];
  id v6 = [v5 physicalURL];
  uint64_t v7 = objc_msgSend(v4, "stringWithUTF8String:", objc_msgSend(v6, "fileSystemRepresentation"));

  BRCSetXattrValueForKeyOnFD(a2, v7, @"com.apple.clouddocs.private.item-sync-paused-by-bundle-id#N", *(void **)(*(void *)(a1 + 40) + 232));
  id v8 = [*(id *)(*(void *)(a1 + 40) + 240) stringValue];
  BRCSetXattrValueForKeyOnFD(a2, v7, @"com.apple.clouddocs.private.item-sync-paused-expire-timestamp#N", v8);

  return 0;
}

void __81__BRCDocumentItem_LegacyAdditions__resumeSyncForBundleID_dropLocalChanges_error___block_invoke_98(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 41))
    {
      *(void *)(*(void *)(a1 + 32) + 96) = 0;
      *(_DWORD *)(*(void *)(a1 + 32) + 80) = 0;
      [*(id *)(a1 + 32) saveToDB];
    }
    BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 24) serverItemByItemID:*(void *)(*(void *)(a1 + 32) + 48)];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) applyScheduler];
    [v4 createApplyJobFromServerItem:v3 localItem:*(void *)(a1 + 32) state:1 kind:2];
  }
  else
  {
    BOOL v3 = [[BRCItemToPathLookup alloc] initWithItem:*(void *)(a1 + 32)];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) fsReader];
    uint64_t v5 = [(BRCItemToPathLookup *)v3 byFileSystemID];
    [v4 fseventAtPath:v5 flags:0];
  }
}

+ (id)nextPausedDocumentBatchEnumeratorWithBundleID:(id)a3 fromRowID:(unint64_t)a4 batchSize:(unsigned int)a5 session:(id)a6 db:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v11 = a6;
  id v12 = a7;
  char v13 = (void *)[v12 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE rowid > %llu   AND version_block_sync_until_bundle_id = %@ ORDER BY rowid ASC LIMIT %u", a4, a3, v8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__BRCDocumentItem_LegacyAdditions__nextPausedDocumentBatchEnumeratorWithBundleID_fromRowID_batchSize_session_db___block_invoke;
  v18[3] = &unk_1E6994148;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  uint64_t v16 = [v13 enumerateObjects:v18];

  return v16;
}

id __113__BRCDocumentItem_LegacyAdditions__nextPausedDocumentBatchEnumeratorWithBundleID_fromRowID_batchSize_session_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

+ (void)autoResumeSyncPausedDocumentsOnTimeoutWithSession:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[BRCDocumentItem(LegacyAdditions) autoResumeSyncPausedDocumentsOnTimeoutWithSession:]();
  }

  id v6 = (void *)v3[18];
  uint64_t v7 = brc_current_date_nsec();
  uint64_t v8 = +[BRCUserDefaults defaultsForMangledID:0];
  id v9 = (void *)[v6 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE version_block_sync_until_timestamp IS NOT NULL AND version_block_sync_until_timestamp < %llu ORDER BY rowid ASC LIMIT %u", v7, objc_msgSend(v8, "autoResumeSyncBatchSize")];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__BRCDocumentItem_LegacyAdditions__autoResumeSyncPausedDocumentsOnTimeoutWithSession___block_invoke;
  uint64_t v23[3] = &unk_1E6994120;
  BOOL v10 = v3;
  id v24 = v10;
  [v9 enumerateObjects:v23];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
        long long v17 = (void *)MEMORY[0x1D9438760]();
        uint64_t v18 = 0;
        [v16 resumeSyncForBundleID:0 dropLocalChanges:0 error:&v18];
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v13);
  }
}

id __86__BRCDocumentItem_LegacyAdditions__autoResumeSyncPausedDocumentsOnTimeoutWithSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(*(void *)(a1 + 32) + 144) error:a3];
  return v3;
}

- (void)learnThumbnailSignatureFromLiveVersion:(id)a3
{
  uint64_t v4 = [a3 thumbnailSignature];
  liveThumbnailSignature = self->_liveThumbnailSignature;
  self->_liveThumbnailSignature = v4;
}

- (void)removeLiveConflictLoserEtag:(id)a3
{
  [(NSMutableSet *)self->_liveConflictLoserEtags removeObject:a3];
  if (![(NSMutableSet *)self->_liveConflictLoserEtags count])
  {
    liveConflictLoserEtags = self->_liveConflictLoserEtags;
    self->_liveConflictLoserEtags = 0;
  }
}

- (NSNumber)fileIDForUpload
{
  return [(BRCLocalStatInfo *)self->super._st fileID];
}

- (BRCGenerationID)generationIDForUpload
{
  return [(BRCLocalStatInfo *)self->super._st generationID];
}

- (id)aliasItemID
{
  if ([(BRCLocalItem *)self isSharedToMeTopLevelItem])
  {
    BOOL v3 = [(BRCLocalItem *)self asSharedToMeTopLevelItem];
    uint64_t v4 = [v3 sharedAliasItemID];
  }
  else
  {
    BOOL v3 = [(BRCLocalItem *)self appLibrary];
    if ([v3 wasMovedToCloudDocs])
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v5 = [BRCItemID alloc];
      id v6 = [(BRCItemID *)self->super._itemID itemIDString];
      uint64_t v4 = [(BRCItemID *)v5 initWithAliasUUID:v6];
    }
  }

  return v4;
}

- (NSError)uploadError
{
  BOOL v3 = [(BRCLocalItem *)self syncUpError];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(BRCDocumentItem *)self currentVersion];
    id v5 = [v6 uploadError];
  }
  return (NSError *)v5;
}

- (BOOL)isPackage
{
  if (![(BRCLocalItem *)self isFinderBookmark])
  {
    unsigned int v3 = [(BRCStatInfo *)self->super._st type];
    if (v3 > 8 || ((1 << v3) & 0x106) == 0)
    {
      id v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem isPackage]();
      }
    }
  }
  return [(BRCVersion *)self->_currentVersion isPackage];
}

- (BOOL)isDocument
{
  if (![(BRCLocalItem *)self isFinderBookmark])
  {
    unsigned int v3 = [(BRCStatInfo *)self->super._st type];
    if (v3 > 8 || ((1 << v3) & 0x106) == 0)
    {
      id v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem isPackage]();
      }
    }
  }
  return 1;
}

- (BOOL)isShareableItem
{
  return 1;
}

- (id)collaborationIdentifierIfComputable
{
  if ([(BRCDocumentItem *)self isShareableItem])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v4 = [(BRCDocumentItem *)self asShareableItem];
    id v5 = (void *)[v3 initShareIDWithShareableItem:v4];

    id v6 = [(BRCLocalItem *)self session];
    uint64_t v7 = [v6 cachedCurrentUserRecordNameIfExists];
    uint64_t v8 = objc_msgSend(v5, "brc_collaborationIdentifierWithCachedCurrentUserRecordName:", v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (BOOL)hasLocalContent
{
  if (![(BRCStatInfo *)self->super._st state] || [(BRCStatInfo *)self->super._st state] == -1) {
    return ![(BRCDocumentItem *)self isFault];
  }
  else {
    return 0;
  }
}

- (BOOL)isDocumentBeingCopiedToNewZone
{
  id v2 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isCrossZoneMoveTombstone
{
  BOOL v3 = [(BRCLocalItem *)self->super._orig asDocument];
  if (![(BRCLocalItem *)self isDead]
    || [(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone]
    || ([v3 isDead] & 1) != 0
    || ![v3 isDocumentBeingCopiedToNewZone])
  {
    char v7 = 0;
  }
  else
  {
    uint64_t v4 = [(BRCLocalItem *)self itemGlobalID];
    id v5 = [v3 currentVersion];
    id v6 = [v5 previousItemGlobalID];
    char v7 = [v4 isEqualToItemGlobalID:v6];
  }
  return v7;
}

- (BOOL)isEvictable
{
  BOOL v3 = [(BRCLocalItem *)self appLibrary];
  uint64_t v4 = [v3 mangledID];
  id v5 = +[BRCUserDefaults defaultsForMangledID:v4];

  id v6 = [(BRCLocalStatInfo *)self->super._st logicalName];
  char v7 = objc_msgSend(v6, "br_pathExtension");
  uint64_t v8 = [v7 lowercaseString];
  id v9 = (void *)v8;
  BOOL v10 = &stru_1F2AC7720;
  if (v8) {
    BOOL v10 = (__CFString *)v8;
  }
  id v11 = v10;

  uint64_t v12 = [v5 nonEvictableExtensions];
  char v13 = [v12 containsObject:v11];

  if ((v13 & 1) != 0 || ![(BRCLocalItem *)self isIdleOrRejected]) {
    LOBYTE(v14) = 0;
  }
  else {
    BOOL v14 = ![(BRCDocumentItem *)self isPausedFromSync];
  }

  return v14;
}

+ (BOOL)isDocumentAutomaticallyEvictableWithExtension:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[BRCUserDefaults defaultsForMangledID:0];
  id v5 = [v4 nonEvictableExtensions];
  if (![v5 containsObject:v3])
  {
    id v6 = [v4 nonAutoEvictableExtensions];
    char v7 = [v6 containsObject:v3];

    if (v7) {
      goto LABEL_4;
    }
    id v9 = +[BRCUTITypeCache defaultCache];
    BOOL v10 = [v9 UTIForExtension:v3];

    if (!v10)
    {
      BOOL v8 = 1;
LABEL_27:

      goto LABEL_28;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = [v4 autoEvictableUTIs];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
LABEL_8:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        if (UTTypeConformsTo(v10, *(CFStringRef *)(*((void *)&v25 + 1) + 8 * v15))) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v13) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = objc_msgSend(v4, "nonAutoEvictableUTIs", 0);
      uint64_t v16 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v11);
            }
            if (UTTypeConformsTo(v10, *(CFStringRef *)(*((void *)&v21 + 1) + 8 * i)))
            {
              BOOL v8 = 0;
              goto LABEL_26;
            }
          }
          uint64_t v17 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          BOOL v8 = 1;
          if (v17) {
            continue;
          }
          goto LABEL_26;
        }
      }
    }
    BOOL v8 = 1;
LABEL_26:

    goto LABEL_27;
  }

LABEL_4:
  BOOL v8 = 0;
LABEL_28:

  return v8;
}

+ (BOOL)isDocumentAutomaticallyEvictableWithName:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "br_pathExtension");
  id v5 = [v4 lowercaseString];

  LOBYTE(a1) = [a1 isDocumentAutomaticallyEvictableWithExtension:v5];
  return (char)a1;
}

- (BOOL)isAutomaticallyEvictable
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![(BRCDocumentItem *)self isEvictable]) {
    return 0;
  }
  if (![(BRCDocumentItem *)self hasLocalContent]) {
    return 0;
  }
  if (self->_shouldAutomaticallyDownloadThumbnail)
  {
    id v3 = [(BRCDocumentItem *)self currentVersion];
    char v4 = [v3 isSmallAndMostRecentClientsGenerateThumbnails];

    if (v4) {
      return 0;
    }
  }
  id v5 = objc_opt_class();
  id v6 = [(BRCLocalStatInfo *)self->super._st logicalName];
  LODWORD(v5) = [v5 isDocumentAutomaticallyEvictableWithName:v6];

  if (!v5) {
    return 0;
  }
  char v7 = [(BRCLocalItem *)self appLibrary];
  BOOL v8 = [v7 mangledID];
  id v9 = +[BRCUserDefaults defaultsForMangledID:v8];

  BOOL v10 = [v9 nonEvictablePathComponents];
  if ([v10 count])
  {
    id v11 = [(BRCLocalStatInfo *)self->super._st fileID];
    uint64_t v12 = [v11 unsignedLongLongValue];

    uint64_t v13 = [[BRCRelativePath alloc] initWithFileID:v12 session:self->super._session];
    if ([(BRCRelativePath *)v13 resolveMustExist:1 error:0])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v14 = [(BRCRelativePath *)v13 pathRelativeToRoot];
      uint64_t v15 = [v14 pathComponents];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v15);
            }
            if ([v10 containsObject:*(void *)(*((void *)&v24 + 1) + 8 * i)])
            {

              BOOL v22 = 0;
              goto LABEL_25;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
    }
  }
  uint64_t v20 = [v9 minAutomaticallyEvictableFilesize];
  desiredVersion = self->_desiredVersion;
  BOOL v22 = desiredVersion && [(BRCVersion *)desiredVersion size] >= v20
     || [(BRCVersion *)self->_currentVersion size] >= v20;
LABEL_25:

  return v22;
}

- (BOOL)isVisibleIniCloudDrive
{
  if ([(BRCLocalItem *)self isInDocumentScope])
  {
    if ([(BRCClientZone *)self->super._clientZone isSharedZone])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      char v4 = [(BRCClientZone *)self->super._clientZone asPrivateClientZone];
      id v5 = [v4 defaultAppLibrary];

      id v6 = [v5 containerMetadata];
      if ([v6 isDocumentScopePublic]) {
        int v3 = [v6 isCloudSyncTCCDisabled] ^ 1;
      }
      else {
        LOBYTE(v3) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  BOOL v3 = [(BRCLocalItem *)self isOwnedByMe];
  if (v3) {
    return (LOBYTE(self->super._sharingOptions) >> 2) & 1;
  }
  return v3;
}

+ (BOOL)shouldDocumentBeGreedyWithName:(id)a3
{
  BOOL v3 = objc_msgSend(a3, "br_pathExtension");
  char v4 = [v3 lowercaseString];

  id v5 = +[BRCUserDefaults defaultsForMangledID:0];
  id v6 = [v5 nonEvictableExtensions];
  if ([v6 containsObject:v4])
  {
    char v7 = 1;
  }
  else
  {
    BOOL v8 = [v5 shouldBeGreedyExtensions];
    char v7 = [v8 containsObject:v4];
  }
  return v7;
}

- (BOOL)shouldBeGreedy
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(BRCLocalItem *)self session];
  char v4 = [v3 hasOptimizeStorageEnabled];

  id v5 = [(BRCLocalItem *)self appLibrary];
  id v6 = v5;
  if ((v4 & 1) == 0)
  {
    char v11 = [v5 isGreedy];

    if (v11)
    {
      id v9 = brc_bread_crumbs();
      BOOL v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[BRCDocumentItem shouldBeGreedy]();
      }
      goto LABEL_11;
    }
    uint64_t v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCDocumentItem shouldBeGreedy].cold.4();
    }

    return 0;
  }
  char v7 = [v5 appLibraryID];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F59398]];

  if (v8)
  {
    id v9 = brc_bread_crumbs();
    BOOL v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCDocumentItem shouldBeGreedy]();
    }
LABEL_11:

    return 1;
  }
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = [(BRCLocalStatInfo *)self->super._st logicalName];
  LODWORD(v12) = [v12 shouldDocumentBeGreedyWithName:v13];

  if (v12)
  {
    id v9 = brc_bread_crumbs();
    BOOL v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCDocumentItem shouldBeGreedy]();
    }
    goto LABEL_11;
  }
  uint64_t v17 = [(BRCLocalItem *)self appLibrary];
  uint64_t v18 = [v17 mangledID];
  long long v19 = +[BRCUserDefaults defaultsForMangledID:v18];
  [v19 maximumDocumentAgeToBeGreedy];
  double v21 = v20;

  BOOL v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v21];
  [v22 timeIntervalSince1970];
  uint64_t v24 = (uint64_t)v23;

  long long v25 = [(BRCDocumentItem *)self currentVersion];
  uint64_t v26 = [v25 mtime];

  if (v26 < v24)
  {
    long long v27 = brc_bread_crumbs();
    long long v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = [(BRCDocumentItem *)self currentVersion];
      int v32 = 134218498;
      uint64_t v33 = [v31 mtime];
      __int16 v34 = 2048;
      uint64_t v35 = (uint64_t)(v21 / 86400.0);
      __int16 v36 = 2112;
      __int16 v37 = v27;
      _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] don't be greedy because document is too old (mtime: %lld; max age: %lld days)%@",
        (uint8_t *)&v32,
        0x20u);
    }
    return 0;
  }
  uint64_t v29 = [(BRCLocalItem *)self appLibrary];
  char v30 = [v29 isGreedy];

  return v30;
}

- (BOOL)shouldHaveThumbnail
{
  BOOL v3 = [(BRCLocalItem *)self st];
  char v4 = [v3 logicalName];
  id v5 = objc_msgSend(v4, "br_pathExtension");
  uint64_t v6 = [v5 lowercaseString];
  char v7 = (void *)v6;
  int v8 = &stru_1F2AC7720;
  if (v6) {
    int v8 = (__CFString *)v6;
  }
  id v9 = v8;

  uint64_t v10 = [(BRCLocalItem *)self appLibrary];
  char v11 = [(id)v10 mangledID];
  uint64_t v12 = +[BRCUserDefaults defaultsForMangledID:v11];
  uint64_t v13 = [v12 blacklistedThumbnailExtensions];

  LOBYTE(v10) = [v13 containsObject:v9];
  BOOL v14 = (v10 & 1) == 0 && [(BRCLocalItem *)self isInDocumentScope];

  return v14;
}

- (BOOL)shouldTransferThumbnail
{
  if ([(BRCLocalItem *)self isFinderBookmark]
    || [(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone]
    || ![(BRCDocumentItem *)self shouldHaveThumbnail])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    BOOL v3 = [(BRCDocumentItem *)self currentVersion];
    int v4 = [v3 isSmallAndMostRecentClientsGenerateThumbnails] ^ 1;
  }
  return v4;
}

- (unsigned)queryItemStatus
{
  if ([(BRCLocalItem *)self isDead]) {
    return 1;
  }
  unsigned int result = [(BRCDocumentItem *)self isFault];
  if (result)
  {
    if ([(BRCDesiredVersion *)self->_desiredVersion wantsContent]) {
      return 2;
    }
    else {
      return 3;
    }
  }
  return result;
}

- (unsigned)downloadStatus
{
  if ([(BRCLocalItem *)self isReserved] || [(BRCDocumentItem *)self isFault]) {
    return 1;
  }
  if ([(BRCDesiredVersion *)self->_desiredVersion wantsContent]) {
    return 2;
  }
  return 3;
}

- (BOOL)_isInterestingUpdateForNotifs
{
  BOOL v3 = self->super._orig;
  int v4 = [(BRCLocalItem *)v3 currentVersion];
  id v5 = [v4 uploadError];
  if (v5)
  {
  }
  else
  {
    char v11 = [(BRCLocalVersion *)self->_currentVersion uploadError];

    if (v11)
    {
LABEL_8:
      char v10 = 1;
      goto LABEL_9;
    }
  }
  int v6 = [(BRCLocalItem *)v3 queryItemStatus];
  if (v6 != [(BRCDocumentItem *)self queryItemStatus]) {
    goto LABEL_8;
  }
  int v7 = [(BRCLocalItem *)v3 downloadStatus];
  if (v7 != [(BRCDocumentItem *)self downloadStatus]) {
    goto LABEL_8;
  }
  int v8 = [(BRCLocalItem *)v3 uploadStatus];
  if (v8 != [(BRCLocalItem *)self uploadStatus]) {
    goto LABEL_8;
  }
  BOOL v9 = [(NSMutableSet *)self->_liveConflictLoserEtags count] == 0;
  char v10 = v9 ^ ([(BRCClientZone *)v3[1]._clientZone count] == 0);
LABEL_9:

  return v10;
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BRCDocumentItem;
  id v5 = [(BRCLocalItem *)&v29 descriptionWithContext:v4];
  if (self->_syncPausedByBundleID)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v6 setDateStyle:1];
    [v6 setTimeStyle:2];
    syncPausedByBundleID = self->_syncPausedByBundleID;
    int v8 = (void *)MEMORY[0x1E4F1C9C8];
    [(NSNumber *)self->_syncPausedExpireTS longLongValue];
    brc_interval_from_nsec();
    BOOL v9 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
    char v10 = [v6 stringFromDate:v9];
    [v5 appendFormat:@" paused:{bundle:%@, till:%@}", syncPausedByBundleID, v10];
  }
  currentVersion = self->_currentVersion;
  if (currentVersion)
  {
    uint64_t v12 = [(BRCLocalVersion *)currentVersion descriptionWithContext:v4];
    [v5 appendFormat:@" ct{%@}", v12];
  }
  if ([(BRCDesiredVersion *)self->_desiredVersion wantsContent]
    || [(BRCDesiredVersion *)self->_desiredVersion wantsThumbnail])
  {
    uint64_t v13 = +[BRCDumpContext highlightedString:@"downloading{" type:7 context:v4];
    [v5 appendFormat:@" %@", v13];

    if ([(BRCDesiredVersion *)self->_desiredVersion wantsContent])
    {
      [v5 appendString:@"content"];
      if ([(BRCDesiredVersion *)self->_desiredVersion wantsThumbnail]) {
        [v5 appendString:@"+"];
      }
    }
    if ([(BRCDesiredVersion *)self->_desiredVersion wantsThumbnail]) {
      [v5 appendString:@"thumbnail"];
    }
    BOOL v14 = [(BRCDesiredVersion *)self->_desiredVersion downloadError];

    if (v14)
    {
      uint64_t v15 = [(BRCDesiredVersion *)self->_desiredVersion downloadError];
      uint64_t v16 = [v15 description];
      uint64_t v17 = +[BRCDumpContext highlightedString:v16 type:3 context:v4];
      [v5 appendFormat:@" (%@)", v17];
    }
    uint64_t v18 = [(BRCVersion *)self->_desiredVersion ckInfo];
    long long v19 = [v18 etag];
    [v5 appendFormat:@"}:%@", v19];
  }
  if ([(BRCDesiredVersion *)self->_desiredVersion isFault])
  {
    double v20 = +[BRCDumpContext highlightedString:@"faulting" type:7 context:v4];
    [v5 appendFormat:@" %@", v20];
  }
  if (self->_shouldAutomaticallyDownloadThumbnail || self->_liveThumbnailSignature)
  {
    [v5 appendFormat:@" thumb{"];
    if (self->_shouldAutomaticallyDownloadThumbnail) {
      [v5 appendString:@"greedy"];
    }
    liveThumbnailSignature = self->_liveThumbnailSignature;
    if (liveThumbnailSignature)
    {
      if (self->_shouldAutomaticallyDownloadThumbnail) {
        BOOL v22 = " ";
      }
      else {
        BOOL v22 = "";
      }
      if ([(NSData *)liveThumbnailSignature brc_signatureIsPendingPlaceHolder])
      {
        [v5 appendFormat:@"%ssig:%@", v22, @"<pending>"];
      }
      else
      {
        double v23 = [(NSData *)self->_liveThumbnailSignature brc_hexadecimalString];
        [v5 appendFormat:@"%ssig:%@", v22, v23];
      }
    }
    [v5 appendFormat:@"}"];
  }
  if ([(NSMutableSet *)self->_liveConflictLoserEtags count])
  {
    uint64_t v24 = [(NSMutableSet *)self->_liveConflictLoserEtags allObjects];
    long long v25 = [v24 componentsJoinedByString:@", "];
    [v5 appendFormat:@" live-losers:{%@}", v25];
  }
  if ([(NSMutableSet *)self->_resolvedConflictLoserEtags count])
  {
    uint64_t v26 = [(NSMutableSet *)self->_resolvedConflictLoserEtags allObjects];
    long long v27 = [v26 componentsJoinedByString:@", "];
    [v5 appendFormat:@" resolved-losers:{%@}", v27];
  }
  return v5;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BRCDocumentItem;
  id v7 = [(BRCLocalItem *)&v20 _initWithServerItem:v6 dbRowID:a4];
  if (v7)
  {
    int v8 = [v6 latestVersion];

    if (v8)
    {
      if (([v6 isDocument] & 1) == 0)
      {
        uint64_t v18 = brc_bread_crumbs();
        long long v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          -[BRCDocumentItem _initWithServerItem:dbRowID:]();
        }
      }
      BOOL v9 = [BRCLocalVersion alloc];
      char v10 = [v6 latestVersion];
      uint64_t v11 = [(BRCLocalVersion *)v9 initWithVersion:v10];
      uint64_t v12 = (void *)*((void *)v7 + 25);
      *((void *)v7 + 25) = v11;

      uint64_t v13 = [*((id *)v7 + 25) copy];
      uint64_t v14 = *((void *)v7 + 11);
      uint64_t v15 = *(void **)(v14 + 200);
      *(void *)(v14 + 200) = v13;
    }
    else
    {
      uint64_t v15 = brc_bread_crumbs();
      uint64_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem _initWithServerItem:dbRowID:]();
      }
    }
  }

  return v7;
}

- (id)_initWithLocalItem:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BRCDocumentItem;
  id v5 = [(BRCLocalItem *)&v16 _initWithLocalItem:v4];
  if (v5)
  {
    uint64_t v6 = [v4 asDocument];
    uint64_t v7 = [*(id *)(v6 + 200) copy];
    int v8 = (void *)*((void *)v5 + 25);
    *((void *)v5 + 25) = v7;

    uint64_t v9 = [*(id *)(v6 + 248) copy];
    char v10 = (void *)*((void *)v5 + 31);
    *((void *)v5 + 31) = v9;

    *((unsigned char *)v5 + 216) = *(unsigned char *)(v6 + 216);
    objc_storeStrong((id *)v5 + 32, *(id *)(v6 + 256));
    uint64_t v11 = [*(id *)(v6 + 224) mutableCopy];
    uint64_t v12 = (void *)*((void *)v5 + 28);
    *((void *)v5 + 28) = v11;

    uint64_t v13 = [*(id *)(v6 + 208) mutableCopy];
    uint64_t v14 = (void *)*((void *)v5 + 26);
    *((void *)v5 + 26) = v13;
  }
  return v5;
}

- (BOOL)hasValidCKInfo
{
  BOOL v3 = [(BRCLocalItem *)self isTopLevelSharedItem];
  uint64_t v4 = [(BRCVersion *)self->_currentVersion ckInfo];
  id v5 = (void *)v4;
  if (v3)
  {
    BOOL v6 = v4 != 0;
  }
  else if (v4)
  {
    uint64_t v7 = [(BRCStatInfo *)self->super._st ckInfo];
    BOOL v6 = v7 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRCDocumentItem;
  unint64_t v5 = [(BRCLocalItem *)&v19 diffAgainstServerItem:v4];
  if (v4 && ([v4 isDocument] & 1) == 0)
  {
    uint64_t v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem diffAgainstServerItem:]();
    }
  }
  if ([v4 isDocument])
  {
    if (self->_currentVersion)
    {
      BOOL v6 = [v4 latestVersion];

      if (v6)
      {
        uint64_t v7 = [v4 latestVersion];
        v5 |= [(BRCVersion *)self->_currentVersion diffAgainst:v7];
        if ([(BRCClientZone *)self->super._clientZone isSharedZone]) {
          v5 &= ~0x1000000uLL;
        }
        if ((v5 & 0x2000000) != 0)
        {
          int v8 = [(BRCVersion *)self->_currentVersion editedSinceShared];
          if ([v8 BOOLValue])
          {
            uint64_t v9 = [v7 editedSinceShared];
            int v10 = [v9 BOOLValue];

            if (!v10) {
              v5 &= ~0x2000000uLL;
            }
          }
          else
          {
          }
        }

        if ((v5 & 0x800000) != 0) {
          goto LABEL_20;
        }
LABEL_18:
        resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
        uint64_t v14 = [v4 latestVersion];
        uint64_t v15 = [v14 conflictLoserEtags];
        LODWORD(resolvedConflictLoserEtags) = [(NSMutableSet *)resolvedConflictLoserEtags intersectsSet:v15];

        if (resolvedConflictLoserEtags) {
          v5 |= 0x800000uLL;
        }
        goto LABEL_20;
      }
      currentVersion = self->_currentVersion;
    }
    else
    {
      currentVersion = 0;
    }
    uint64_t v12 = [v4 latestVersion];

    if (currentVersion != v12) {
      v5 |= 0x3FF0000uLL;
    }
    if ((v5 & 0x800000) == 0) {
      goto LABEL_18;
    }
  }
LABEL_20:

  return v5;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BRCDocumentItem;
  unint64_t v5 = [(BRCLocalItem *)&v37 diffAgainstLocalItem:v4];
  if (v4 && ([v4 isDocument] & 1) == 0)
  {
    uint64_t v35 = brc_bread_crumbs();
    __int16 v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem diffAgainstServerItem:]();
    }
  }
  if ([v4 isDocument])
  {
    BOOL v6 = [v4 asDocument];
    uint64_t v7 = v6;
    if (self->_currentVersion)
    {
      int v8 = [v6 currentVersion];

      currentVersion = self->_currentVersion;
      if (v8)
      {
        uint64_t v10 = [(BRCLocalVersion *)currentVersion diffAgainstLocalVersion:v7[25]] | v5;
        if ((v10 & 0x10000000000000) != 0) {
          goto LABEL_20;
        }
LABEL_13:
        uint64_t v11 = [(BRCVersion *)self->_desiredVersion ckInfo];
        uint64_t v12 = [v7 desiredVersion];
        uint64_t v13 = [v12 ckInfo];
        id v14 = v11;
        id v15 = v13;
        objc_super v16 = v15;
        if (v14 == v15)
        {
          int v17 = 0;
        }
        else if (v15)
        {
          int v17 = [v14 isEqual:v15] ^ 1;
        }
        else
        {
          int v17 = 1;
        }

        if (v17) {
          v10 |= 0x10000000000000uLL;
        }
LABEL_20:
        if ((v10 & 0x800000) == 0)
        {
          resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
          objc_super v19 = [v7 resolvedConflictLoserEtags];
          objc_super v20 = resolvedConflictLoserEtags;
          double v21 = v19;
          BOOL v22 = v21;
          if (v20 == v21) {
            int v23 = 0;
          }
          else {
            int v23 = v21 ? [(NSMutableSet *)v20 isEqual:v21] ^ 1 : 1;
          }

          if (v23) {
            v10 |= 0x800000uLL;
          }
        }
        if ([(BRCClientZone *)self->super._clientZone isSharedZone]) {
          unint64_t v5 = v10 & 0xFFFFFFFFFEFFFFFFLL;
        }
        else {
          unint64_t v5 = v10;
        }
        if ([(BRCLocalItem *)self isSharedToMeTopLevelItem]) {
          v5 &= ~0x40000uLL;
        }
        if ((v5 & 0x200000000000000) == 0)
        {
          uint64_t v24 = (void *)v7[29];
          long long v25 = self->_syncPausedByBundleID;
          uint64_t v26 = v24;
          if (v25 == v26)
          {
          }
          else
          {
            long long v27 = v26;
            if (!v26)
            {

              goto LABEL_46;
            }
            char v28 = [(NSString *)v25 isEqual:v26];

            if ((v28 & 1) == 0)
            {
LABEL_46:
              v5 |= 0x200000000000000uLL;
              if ((v5 & 0x200000000000000) != 0) {
                goto LABEL_50;
              }
LABEL_40:
              objc_super v29 = (void *)v7[30];
              char v30 = self->_syncPausedExpireTS;
              uint64_t v31 = v29;
              if (v30 == v31)
              {
              }
              else
              {
                int v32 = v31;
                if (v31)
                {
                  char v33 = [(NSNumber *)v30 isEqual:v31];

                  if (v33) {
                    goto LABEL_50;
                  }
                }
                else
                {
                }
                v5 |= 0x200000000000000uLL;
              }
LABEL_50:

              goto LABEL_51;
            }
          }
        }
        if ((v5 & 0x200000000000000) != 0) {
          goto LABEL_50;
        }
        goto LABEL_40;
      }
    }
    else
    {
      currentVersion = 0;
    }
    if (currentVersion == (BRCLocalVersion *)v7[25]) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v5 | 0x7000003FF0000;
    }
    if ((v10 & 0x10000000000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_13;
  }
LABEL_51:

  return v5;
}

- (BOOL)validateLoggingToFile:(__sFILE *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BRCDocumentItem;
  unsigned int v5 = -[BRCLocalItem validateLoggingToFile:](&v8, sel_validateLoggingToFile_);
  currentVersion = self->_currentVersion;
  if (currentVersion)
  {
    if (v5) {
      LOBYTE(v5) = [(BRCVersion *)currentVersion check:self->super._itemID logToFile:a3];
    }
  }
  else if (![(BRCLocalItem *)self isDead])
  {
    fprintf(a3, "item %s is a live document without a version\n", [(BRCItemID *)self->super._itemID UTF8String]);
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)clearVersionSignatures:(unint64_t)a3 isPackage:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone]) {
    [(BRCLocalVersion *)self->_currentVersion setUploadedAssets:0];
  }
  if (![(BRCDocumentItem *)self isFault])
  {
    uint64_t v7 = brc_bread_crumbs();
    objc_super v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCDocumentItem clearVersionSignatures:isPackage:]();
    }

    [(BRCLocalVersion *)self->_currentVersion _clearSignatures:a3 isPackage:v4];
  }
}

- (id)syncContextUsedForTransfers
{
  serverZone = self->super._serverZone;
  BOOL v3 = [(BRCLocalItem *)self appLibrary];
  BOOL v4 = +[BRCSyncContext transferContextForServerZone:serverZone appLibrary:v3];

  return v4;
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [v4 latestVersion];
  BOOL v6 = [v5 ckInfo];

  uint64_t v7 = brc_bread_crumbs();
  objc_super v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [v6 etag];
    int v22 = 138412802;
    int v23 = v13;
    __int16 v24 = 2112;
    id v25 = v4;
    __int16 v26 = 2112;
    long long v27 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] updating ct-etag:%@ from server item: %@%@", (uint8_t *)&v22, 0x20u);
  }
  if (!v4)
  {
    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:]();
    }
  }
  if (([v4 isDocument] & 1) == 0)
  {
    objc_super v16 = brc_bread_crumbs();
    int v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:]();
    }
  }
  if ([(BRCDocumentItem *)self isDocument])
  {
    if (v6) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
  uint64_t v18 = brc_bread_crumbs();
  objc_super v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
    -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:]();
  }

  if (!v6)
  {
LABEL_19:
    objc_super v20 = brc_bread_crumbs();
    double v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:]();
    }
  }
LABEL_7:
  if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone])
  {
    uint64_t v9 = [(BRCVersion *)self->_currentVersion ckInfo];
    uint64_t v10 = [v9 etagBeforeCrossZoneMove];
    [v6 setEtagBeforeCrossZoneMove:v10];
  }
  [(BRCVersion *)self->_currentVersion setCkInfo:v6];
  uint64_t v11 = [v4 latestVersion];
  uint64_t v12 = [v11 lastEditorDeviceOrUserRowID];
  [(BRCVersion *)self->_currentVersion setLastEditorDeviceOrUserRowID:v12];
}

- (void)updateVersionMetadataFromServerItem:(id)a3 preventVersionDiffs:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([v6 isDocument] & 1) == 0)
  {
    uint64_t v31 = brc_bread_crumbs();
    int v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:]();
    }
  }
  uint64_t v7 = [v6 latestVersion];

  if (!v7)
  {
    char v33 = brc_bread_crumbs();
    __int16 v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem updateVersionMetadataFromServerItem:preventVersionDiffs:]();
    }
  }
  BOOL v8 = [(BRCDocumentItem *)self isPausedFromSync];
  uint64_t v9 = [v6 latestVersion];
  uint64_t v10 = [v9 diffAgainst:self->_currentVersion];

  if ((v10 & 0x100000) != 0 && !v8 && ![(BRCDocumentItem *)self isResumingSync])
  {
    objc_super v19 = brc_bread_crumbs();
    isa = brc_default_log();
    if (os_log_type_enabled(isa, OS_LOG_TYPE_DEFAULT))
    {
      double v21 = [v6 latestVersion];
      currentVersion = self->_currentVersion;
      int v35 = 134218754;
      uint64_t v36 = v10;
      __int16 v37 = 2112;
      uint64_t v38 = v21;
      __int16 v39 = 2112;
      v40 = currentVersion;
      __int16 v41 = 2112;
      uint64_t v42 = v19;
      _os_log_impl(&dword_1D353B000, isa, OS_LOG_TYPE_DEFAULT, "[WARNING] We think this is a meta only update but it isn't (%llu)!\n latest-version: %@\n current-verions: %@%@", (uint8_t *)&v35, 0x2Au);
    }
    goto LABEL_28;
  }
  uint64_t v11 = [(BRCVersion *)self->_currentVersion editedSinceShared];
  char v12 = [v11 BOOLValue];

  if (v12)
  {
    BOOL v13 = 1;
    goto LABEL_19;
  }
  if ([(BRCLocalItem *)self isSharedToMe] || [(BRCLocalItem *)self isSharedByMe])
  {
    id v14 = [(BRCVersion *)self->_currentVersion ckInfo];
    uint64_t v15 = [v14 etag];
    BOOL v13 = v15 != 0;
    if (!v15)
    {
LABEL_15:

      goto LABEL_19;
    }
    objc_super v16 = (void *)v15;
    unint64_t v17 = [(BRCDocumentItem *)self diffAgainstServerItem:v6] & 0x1A0000;

    if (v17)
    {
      id v14 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BRCDocumentItem updateVersionMetadataFromServerItem:preventVersionDiffs:]();
      }

      goto LABEL_15;
    }
  }
  BOOL v13 = 0;
LABEL_19:
  objc_super v19 = [(BRCLocalVersion *)self->_currentVersion uploadError];
  if (v8)
  {
    int v23 = [v6 latestVersion];
    __int16 v24 = [v23 originalPOSIXName];
    id v25 = (void *)[v24 copy];
    [(BRCVersion *)self->_currentVersion setOriginalPOSIXName:v25];
  }
  else
  {
    __int16 v26 = [BRCLocalVersion alloc];
    int v23 = [v6 latestVersion];
    long long v27 = [(BRCLocalVersion *)v26 initWithServerVersion:v23];
    __int16 v24 = self->_currentVersion;
    self->_currentVersion = v27;
  }

  if (v13) {
    [(BRCVersion *)self->_currentVersion setEditedSinceShared:MEMORY[0x1E4F1CC38]];
  }
  if (objc_msgSend(v19, "br_isCloudDocsErrorCode:", 43)) {
    [(BRCLocalVersion *)self->_currentVersion setUploadError:v19];
  }
  if (v4)
  {
    uint64_t v28 = self->_currentVersion;
    orig = self->super._orig;
    char v30 = v28;
    isa = orig[1].super.isa;
    orig[1].super.isa = (Class)v30;
LABEL_28:
  }
}

- (void)markItemForgottenByServer
{
  v3.receiver = self;
  v3.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v3 markItemForgottenByServer];
  [(BRCVersion *)self->_currentVersion setCkInfo:0];
}

- (void)forceiWorkConflictEtag:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412802;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    BOOL v13 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] forcing iwork conflict etag on %@ to be %@%@", (uint8_t *)&v8, 0x20u);
  }

  [(BRCDocumentItem *)self markNeedsReading];
  uint64_t v7 = [(BRCVersion *)self->_currentVersion ckInfo];
  [v7 setEtag:v4];

  self->super._localDiffs |= 0x4000000000000000uLL;
}

- (void)forceVersionConflictByClearkingCKInfo
{
}

- (void)forceiWorkSharingInfoResend
{
  self->super._localDiffs |= 0x800000000000000uLL;
  [(BRCDocumentItem *)self markNeedsReading];
}

- (void)appDidResolveConflictLoserWithEtag:(id)a3
{
  id v4 = a3;
  int v5 = [(BRCPQLConnection *)self->super._db isBatchSuspended];
  db = self->super._db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke;
  v9[3] = &unk_1E6993A88;
  if (v5) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 20;
  }
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(BRCPQLConnection *)db performWithFlags:v7 action:v9];
}

uint64_t __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke(uint64_t a1)
{
  id v2 = (void *)(a1 + 40);
  [*(id *)(a1 + 32) removeLiveConflictLoserEtag:*(void *)(a1 + 40)];
  objc_super v3 = [*(id *)(*(v2 - 1) + 200) conflictLoserEtags];
  int v4 = [v3 containsObject:*v2];

  if (v4)
  {
    int v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) addResolvedConflictLoserEtag:*(void *)(a1 + 40)];
    if (([*(id *)(a1 + 32) needsReading] & 1) == 0) {
      [*(id *)(a1 + 32) markNeedsReading];
    }
  }
  else
  {
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_2();
    }
  }
  return [*(id *)(a1 + 32) saveToDB];
}

- (void)markDead
{
  v10.receiver = self;
  v10.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v10 markDead];
  if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone]) {
    [(BRCDocumentItem *)self _insertTombstoneForPreviousZoneGlobalID];
  }
  objc_super v3 = [[BRCLocalVersion alloc] initForPackage:[(BRCVersion *)self->_currentVersion isPackage]];
  int v4 = [(BRCVersion *)self->_currentVersion originalPOSIXName];
  [(BRCVersion *)v3 setOriginalPOSIXName:v4];

  int v5 = [(BRCVersion *)self->_currentVersion ckInfo];
  [(BRCVersion *)v3 setCkInfo:v5];

  currentVersion = self->_currentVersion;
  self->_currentVersion = v3;
  uint64_t v7 = v3;

  liveConflictLoserEtags = self->_liveConflictLoserEtags;
  self->_liveConflictLoserEtags = 0;

  uint64_t v9 = [(BRCAccountSession *)self->super._session fsDownloader];

  [v9 cancelAndCleanupItemDownloads:self];
}

- (void)markNeedsReading
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isOnDisk%@", v2, v3, v4, v5, v6);
}

- (void)markLatestSyncRequestRejectedInZone:(id)a3
{
  id v4 = a3;
  unint64_t localDiffs = self->super._localDiffs;
  if (([(BRCLocalItem *)self metadataSyncUpMask:0] & localDiffs) == 0) {
    [(BRCLocalVersion *)self->_currentVersion setUploadedAssets:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v10 markLatestSyncRequestRejectedInZone:v4];
  if (self->super._syncUpState != 1) {
    [(BRCDocumentItem *)self markForceUpload];
  }
  if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone])
  {
    uint8_t v6 = [(BRCClientZone *)self->super._clientZone dbRowID];
    int v7 = objc_msgSend(v4, "br_isEqualToNumber:", v6);

    if (v7)
    {
      id v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BRCDocumentItem markLatestSyncRequestRejectedInZone:]();
      }

      [(BRCDocumentItem *)self _insertTombstoneForPreviousZoneGlobalID];
    }
  }
}

- (BOOL)markLatestSyncRequestAcknowledgedInZone:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCDocumentItem;
  BOOL v5 = [(BRCLocalItem *)&v12 markLatestSyncRequestAcknowledgedInZone:v4];
  if (v5)
  {
    if (([(BRCLocalItem *)self localDiffs] & 0x800000) == 0)
    {
      resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
      self->_resolvedConflictLoserEtags = 0;
    }
    if ((self->super._localDiffs & 0x1FE0000) == 0
      || [(BRCDocumentItem *)self isPausedFromSync] && (self->super._localDiffs & 0x40000) == 0)
    {
      [(BRCLocalVersion *)self->_currentVersion setUploadedAssets:0];
    }
    if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone])
    {
      int v7 = [(BRCClientZone *)self->super._clientZone dbRowID];
      int v8 = objc_msgSend(v4, "br_isEqualToNumber:", v7);

      if (v8)
      {
        uint64_t v9 = brc_bread_crumbs();
        objc_super v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[BRCDocumentItem markLatestSyncRequestRejectedInZone:]();
        }

        [(BRCDocumentItem *)self _insertTombstoneForPreviousZoneGlobalID];
      }
    }
  }

  return v5;
}

- (void)handleUnknownItemError
{
  [(BRCVersion *)self->_currentVersion setCkInfo:0];
  v3.receiver = self;
  v3.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v3 handleUnknownItemError];
}

- (void)markForceUpload
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: trying to force upload of a fault%@", v2, v3, v4, v5, v6);
}

- (void)markForceNeedsSyncUp
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem markForceNeedsSyncUp]", 1213, v8);
  uint64_t v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = v8[0];
    uint8_t v6 = [(BRCLocalItem *)self itemID];
    *(_DWORD *)buf = 134218498;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    objc_super v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v3;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx marking force needs-syncup: %@%@", buf, 0x20u);
  }
  if ([(BRCDocumentItem *)self isFault])
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCDocumentItem;
    [(BRCLocalItem *)&v7 markForceNeedsSyncUp];
  }
  else
  {
    [(BRCDocumentItem *)self markNeedsReading];
  }
  __brc_leave_section(v8);
}

- (void)markUploadedWithRecord:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v50, 0, sizeof(v50));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem markUploadedWithRecord:]", 1231, v50);
  uint64_t v5 = brc_bread_crumbs();
  uint8_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = v50[0];
    int v32 = [(BRCLocalItem *)self itemID];
    *(_DWORD *)buf = 134218498;
    v52 = (BRCDocumentItem *)v31;
    __int16 v53 = 2112;
    int64_t v54 = (int64_t)v32;
    __int16 v55 = 2112;
    uint64_t v56 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx marking uploaded %@%@", buf, 0x20u);
  }
  if (self->super._syncUpState == 3)
  {
    if (!v4)
    {
      int v35 = brc_bread_crumbs();
      uint64_t v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem markUploadedWithRecord:]0();
      }
    }
    BOOL v7 = [(BRCLocalItem *)self isFinderBookmark];
    int v8 = kBRRecordKeyFinderBookmarkContent;
    if (!v7) {
      int v8 = kBRRecordKeyFileContent;
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:*v8];
    uint64_t v49 = [v4 objectForKeyedSubscript:@"pkgSignature"];
    uint64_t v10 = [v4 objectForKeyedSubscript:@"thumb1024"];
    if (v9)
    {
      __int16 v11 = [v9 signature];
    }
    else
    {
      __int16 v11 = v49;
    }
    objc_super v12 = v11;
    __int16 v13 = [v10 signature];
    if (v9)
    {
      if (self->_currentVersion)
      {
        if ([v9 isRereferencedAssetUpload]) {
          goto LABEL_14;
        }
        uint64_t v14 = [v9 size];
        if (v14 == [(BRCVersion *)self->_currentVersion size]) {
          goto LABEL_14;
        }
        long long v27 = brc_bread_crumbs();
        uint64_t v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          uint64_t v33 = [v9 size];
          int64_t v34 = [(BRCVersion *)self->_currentVersion size];
          *(_DWORD *)buf = 134218498;
          v52 = (BRCDocumentItem *)v33;
          __int16 v53 = 2048;
          int64_t v54 = v34;
          __int16 v55 = 2112;
          uint64_t v56 = v27;
          _os_log_fault_impl(&dword_1D353B000, v28, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: CK disagrees on the item size: %lld != %lld%@", buf, 0x20u);
        }
      }
      else
      {
        long long v27 = brc_bread_crumbs();
        uint64_t v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          objc_super v29 = [(BRCLocalItem *)self itemID];
          -[BRCDocumentItem markUploadedWithRecord:](v29, (uint64_t)v27, (uint64_t)buf, v28);
        }
      }

      [(BRCDocumentItem *)self markNeedsReading];
LABEL_37:

      char v30 = v49;
      goto LABEL_38;
    }
LABEL_14:
    uint64_t v15 = brc_bread_crumbs();
    objc_super v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v52 = self;
      __int16 v53 = 2112;
      int64_t v54 = (int64_t)v12;
      __int16 v55 = 2112;
      uint64_t v56 = v15;
      _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] marking uploaded %@, signature:%@%@", buf, 0x20u);
    }

    if ((v9 != 0) == (v49 != 0))
    {
      __int16 v37 = brc_bread_crumbs();
      uint64_t v38 = brc_default_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem markUploadedWithRecord:].cold.9();
      }
    }
    if (!v12)
    {
      __int16 v39 = brc_bread_crumbs();
      v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem markUploadedWithRecord:].cold.8();
      }
    }
    if (!self->_currentVersion)
    {
      __int16 v41 = brc_bread_crumbs();
      uint64_t v42 = brc_default_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem markUploadedWithRecord:].cold.7();
      }
    }
    unint64_t v17 = [(BRCLocalStatInfo *)self->super._st documentID];
    BOOL v18 = v17 == 0;

    if (v18)
    {
      uint64_t v43 = brc_bread_crumbs();
      v44 = brc_default_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem markUploadedWithRecord:].cold.6();
      }
    }
    objc_super v19 = [(BRCVersion *)self->_currentVersion contentSignature];
    if ((objc_msgSend(v19, "brc_signatureIsPendingPlaceHolder") & 1) == 0)
    {
      BOOL v20 = [(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone];

      if (v20)
      {
LABEL_23:
        double v21 = [(BRCVersion *)self->_currentVersion thumbnailSignature];
        if ((objc_msgSend(v21, "brc_signatureIsPendingPlaceHolder") & 1) == 0)
        {
          BOOL v22 = [(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone];

          if (v22) {
            goto LABEL_26;
          }
          double v21 = brc_bread_crumbs();
          v48 = brc_default_log();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
            -[BRCDocumentItem markUploadedWithRecord:].cold.4();
          }
        }
LABEL_26:
        int v23 = [(BRCLocalVersion *)self->_currentVersion uploadedAssets];
        BOOL v24 = v23 == 0;

        if (!v24)
        {
          __int16 v45 = brc_bread_crumbs();
          int v46 = brc_default_log();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
            -[BRCDocumentItem markUploadedWithRecord:]();
          }
        }
        [(BRCLocalVersion *)self->_currentVersion setUploadError:0];
        [(BRCVersion *)self->_currentVersion setContentSignature:v12];
        [(BRCLocalVersion *)self->_currentVersion setUploadedAssets:v4];
        [(BRCVersion *)self->_currentVersion setThumbnailSignature:v13];
        -[BRCVersion setThumbnailSize:](self->_currentVersion, "setThumbnailSize:", [v10 size]);
        objc_storeStrong((id *)&self->_liveThumbnailSignature, v13);
        [(BRCLocalItem *)self _markNeedsSyncingUp];
        if (![(BRCLocalItem *)self needsSyncUp]) {
          [(BRCLocalVersion *)self->_currentVersion setUploadedAssets:0];
        }
        id v25 = brc_bread_crumbs();
        __int16 v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[BRCDocumentItem markUploadedWithRecord:]();
        }

        goto LABEL_37;
      }
      objc_super v19 = brc_bread_crumbs();
      __int16 v47 = brc_default_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem markUploadedWithRecord:].cold.5();
      }
    }
    goto LABEL_23;
  }
  uint64_t v9 = brc_bread_crumbs();
  char v30 = brc_default_log();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
    -[BRCDocumentItem markUploadedWithRecord:]1();
  }
LABEL_38:

  __brc_leave_section(v50);
}

- (void)markNeedsUploadOrSyncingUp
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.needsUpload%@", v2, v3, v4, v5, v6);
}

- (void)markOverQuotaWithError:(id)a3
{
  currentVersion = self->_currentVersion;
  id v5 = a3;
  [(BRCLocalVersion *)currentVersion _clearSignatures:3 isPackage:[(BRCVersion *)currentVersion isPackage]];
  self->super._syncUpState = 3;
  [(BRCLocalVersion *)self->_currentVersion setUploadError:v5];
}

- (void)_markAsDeadTombstoneWithPreviousGlobalID
{
  uint64_t v3 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
  [(BRCLocalVersion *)self->_currentVersion setPreviousItemGlobalID:0];
  uint64_t v4 = [(BRCVersion *)self->_currentVersion ckInfo];
  [v4 revertEtagsForOldZoneTombstone];

  v5.receiver = self;
  v5.super_class = (Class)BRCDocumentItem;
  [(BRCLocalItem *)&v5 _markAsDeadTombstoneWithPreviousGlobalID:v3];
}

- (void)_insertTombstoneForPreviousZoneGlobalID
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (([(BRCPQLConnection *)self->super._db isBatchSuspended] & 1) == 0)
  {
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  uint64_t v3 = (void *)[(BRCDocumentItem *)self copy];
  [v3 _markAsDeadTombstoneWithPreviousGlobalID];
  [v3 markNeedsUploadOrSyncingUp];
  uint64_t v4 = [v3 clientZone];
  objc_super v5 = [v3 itemID];
  int v6 = [v4 existsByItemID:v5];

  if (v6)
  {
    BOOL v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v3 itemGlobalID];
      int v16 = 138412546;
      unint64_t v17 = v9;
      __int16 v18 = 2112;
      objc_super v19 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Not inserting dead tombstone because the item was already revived for %@%@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    [v3 saveToDB];
  }
  uint64_t v10 = [(BRCAccountSession *)self->super._session applyScheduler];
  __int16 v11 = [v3 serverZone];
  [v10 rescheduleSuspendedJobsMatching:v11 inState:17];

  [(BRCLocalVersion *)self->_currentVersion setPreviousItemGlobalID:0];
  objc_super v12 = [(BRCStatInfo *)self->super._st ckInfo];
  [v12 clearCrossZoneMoveEtag];

  __int16 v13 = [(BRCVersion *)self->_currentVersion ckInfo];
  [v13 clearCrossZoneMoveEtag];
}

- (BOOL)supportsServerSideAssetCopies
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t localDiffs = self->super._localDiffs;
  if ((localDiffs & 0x180000) == 0)
  {
    uint64_t v4 = [(BRCVersion *)self->_currentVersion contentSignature];
    char v5 = objc_msgSend(v4, "brc_signatureIsValid");

    if (v5)
    {
      int v6 = [(BRCClientZone *)self->super._clientZone mangledID];
      BOOL v7 = +[BRCUserDefaults defaultsForMangledID:v6];

      LOBYTE(v6) = [v7 supportsServerSideAssetCopies];
      return (char)v6;
    }
    unint64_t localDiffs = self->super._localDiffs;
  }
  uint64_t v9 = [(BRCVersion *)self->_currentVersion contentSignature];

  uint64_t v10 = [(BRCVersion *)self->_currentVersion contentSignature];
  uint64_t v11 = objc_msgSend(v10, "brc_signatureIsValid");

  objc_super v12 = brc_bread_crumbs();
  __int16 v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    BOOL v14 = v9 != 0;
    uint64_t v15 = [NSNumber numberWithBool:(localDiffs & 0x180000) != 0];
    int v16 = [NSNumber numberWithBool:v14];
    unint64_t v17 = [NSNumber numberWithBool:v11];
    int v18 = 138413314;
    objc_super v19 = v15;
    __int16 v20 = 2112;
    double v21 = v16;
    __int16 v22 = 2112;
    int v23 = v17;
    __int16 v24 = 2112;
    id v25 = self;
    __int16 v26 = 2112;
    long long v27 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] skip supportsServerSideAssetCopies: has local diffs [%@], content signature [%@] valid [%@] --> NO\n item: %@%@", (uint8_t *)&v18, 0x34u);
  }
  return 0;
}

- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:(id)a3 path:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v54 = a4;
  if (!v6)
  {
    v48 = brc_bread_crumbs();
    uint64_t v49 = brc_default_log();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem markCrossZoneMovedForServerAssetCopyWithParentItem:path:]();
    }
  }
  if (![(BRCDocumentItem *)self supportsServerSideAssetCopies])
  {
    v50 = brc_bread_crumbs();
    v51 = brc_default_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem markCrossZoneMovedForServerAssetCopyWithParentItem:path:]();
    }
  }
  uint64_t v53 = [(BRCLocalItem *)self itemGlobalID];
  BOOL v7 = [v6 itemGlobalID];
  session = self->super._session;
  uint64_t v9 = [v7 zoneRowID];
  uint64_t v10 = [(BRCAccountSession *)session serverZoneByRowID:v9];
  uint64_t v11 = [v10 clientZone];

  objc_super v12 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
  __int16 v13 = [v7 itemID];
  [(BRCStatInfo *)self->super._st setParentID:v13];

  v52 = v7;
  BOOL v14 = [v7 zoneRowID];
  parentZoneRowID = self->super._parentZoneRowID;
  self->super._parentZoneRowID = v14;

  objc_storeStrong((id *)&self->super._clientZone, v11);
  self->super._serverZone = (BRCServerZone *)(id)[v11 serverZone];
  self->super._orig->_syncUpState = 0;
  __int16 v55 = v6;
  if (v12)
  {
    int v16 = [v12 zoneRowID];
    unint64_t v17 = [v11 dbRowID];
    int v18 = objc_msgSend(v16, "br_isEqualToNumber:", v17);

    if (v18)
    {
      objc_super v19 = [v12 itemID];
      __int16 v20 = [v11 serverItemByItemID:v19];

      double v21 = brc_bread_crumbs();
      __int16 v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v57 = self;
        __int16 v58 = 2112;
        id v59 = v20;
        __int16 v60 = 2112;
        v61 = v21;
        _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Item moved back into its original zone %@ si: %@%@", buf, 0x20u);
      }

      [(BRCLocalVersion *)self->_currentVersion setPreviousItemGlobalID:0];
      int v23 = [(BRCAccountSession *)self->super._session syncUpScheduler];
      uint64_t v24 = [v23 inFlightDiffsForItem:self];

      if (v24)
      {
        brc_bread_crumbs();
        id v25 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
        __int16 v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v57 = v25;
          _os_log_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] Item has in-flight diffs in the current zone. We need to be sure to insert a tombstone%@", buf, 0xCu);
        }

        long long v27 = (void *)[(BRCDocumentItem *)self copy];
        uint64_t v28 = [v27 currentVersion];
        objc_super v29 = [v28 ckInfo];
        [v29 clearCrossZoneMoveEtag];

        char v30 = [v27 st];
        uint64_t v31 = [v30 ckInfo];
        [v31 clearCrossZoneMoveEtag];

        int v32 = [(BRCLocalItem *)self->super._orig itemGlobalID];
        [v27 _restorePreviousGlobalID:v32];

        [v27 markDead];
        [v27 markNeedsUploadOrSyncingUp];
      }
      else
      {
        long long v27 = 0;
      }
      v44 = [(BRCStatInfo *)self->super._st ckInfo];
      [v44 revertEtagsForOldZoneTombstone];

      __int16 v45 = [(BRCVersion *)self->_currentVersion ckInfo];
      [v45 revertEtagsForOldZoneTombstone];

      int v46 = [v12 itemID];
      int v35 = v54;
      [(BRCDocumentItem *)self learnItemID:v46 serverItem:v20 path:v54 markLost:0];

      [(BRCDocumentItem *)self markNeedsUploadOrSyncingUp];
      uint64_t v43 = v27;
      uint64_t v36 = (void *)v53;
      if (!v24) {
        goto LABEL_21;
      }
LABEL_20:
      [(BRCLocalItem *)self saveToDB];
      [v27 saveToDB];
      uint64_t v43 = v27;
      goto LABEL_21;
    }
    uint64_t v38 = brc_bread_crumbs();
    __int16 v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v57 = self;
      __int16 v58 = 2112;
      id v59 = v38;
      _os_log_impl(&dword_1D353B000, v39, OS_LOG_TYPE_DEFAULT, "[WARNING] Item already has a previous zone so ignore the existing zone for %@%@", buf, 0x16u);
    }

    uint64_t v36 = (void *)v53;
    int v35 = v54;
  }
  else
  {
    uint64_t v33 = brc_bread_crumbs();
    int64_t v34 = brc_default_log();
    int v35 = v54;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v57 = self;
      __int16 v58 = 2112;
      id v59 = v11;
      __int16 v60 = 2112;
      v61 = v33;
      _os_log_impl(&dword_1D353B000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ moved into new zone which supports server side asset copies %@%@", buf, 0x20u);
    }

    uint64_t v36 = (void *)v53;
    [(BRCLocalVersion *)self->_currentVersion setPreviousItemGlobalID:v53];
    __int16 v37 = [(BRCStatInfo *)self->super._st ckInfo];
    [v37 markCrossZoneMoved];

    uint64_t v38 = [(BRCVersion *)self->_currentVersion ckInfo];
    [v38 markCrossZoneMoved];
  }

  v40 = objc_opt_new();
  [(BRCDocumentItem *)self learnItemID:v40 serverItem:0 path:v35 markLost:0];

  self->super._unint64_t sharingOptions = [v6 sharingOptions] & 0x78;
  __int16 v41 = brc_bread_crumbs();
  uint64_t v42 = brc_default_log();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    BRCPrettyPrintBitmap();
    __int16 v47 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    uint64_t v57 = v47;
    __int16 v58 = 2112;
    id v59 = v6;
    __int16 v60 = 2112;
    v61 = v41;
    _os_log_debug_impl(&dword_1D353B000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] learning sharing options %@ from parent %@%@", buf, 0x20u);
  }
  [(BRCDocumentItem *)self markNeedsUploadOrSyncingUp];
  long long v27 = 0;
  uint64_t v43 = 0;
  if (!v12) {
    goto LABEL_20;
  }
LABEL_21:
}

- (BOOL)contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:(BOOL)a3
{
  if ([(BRCDocumentItem *)self isPausedFromSync])
  {
    int v5 = 0x40000;
    if (a3) {
      return 1;
    }
  }
  else
  {
    BOOL v6 = [(BRCDocumentItem *)self isResumingSync];
    int v5 = 67043328;
    if (v6) {
      int v5 = 0x40000;
    }
    if (a3) {
      return 1;
    }
  }
  unint64_t localDiffs = self->super._localDiffs;
  if ((v5 & localDiffs & 0x800000) == 0 && (v5 & localDiffs & 0x100000) == 0)
  {
    uint64_t v10 = [(BRCVersion *)self->_currentVersion ckInfo];
    uint64_t v11 = [v10 etag];
    BOOL v8 = v11 == 0;

    return v8;
  }
  return 1;
}

- (NSDictionary)conflictLoserState
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableSet *)self->_liveConflictLoserEtags count];
  uint64_t v4 = (void *)[(NSMutableSet *)self->_resolvedConflictLoserEtags count];
  if (!v3)
  {
    if (!v4) {
      goto LABEL_9;
    }
    resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
    __int16 v13 = @"r";
    BOOL v14 = resolvedConflictLoserEtags;
    BOOL v7 = (void *)MEMORY[0x1E4F1C9E8];
    p_liveConflictLoserEtags = &v14;
    uint64_t v9 = &v13;
    goto LABEL_7;
  }
  if (!v4)
  {
    uint64_t v15 = @"l";
    liveConflictLoserEtags = self->_liveConflictLoserEtags;
    BOOL v7 = (void *)MEMORY[0x1E4F1C9E8];
    p_liveConflictLoserEtags = &liveConflictLoserEtags;
    uint64_t v9 = &v15;
LABEL_7:
    uint64_t v10 = 1;
    goto LABEL_8;
  }
  int v5 = self->_liveConflictLoserEtags;
  v17[0] = @"l";
  v17[1] = @"r";
  BOOL v6 = self->_resolvedConflictLoserEtags;
  v18[0] = v5;
  v18[1] = v6;
  BOOL v7 = (void *)MEMORY[0x1E4F1C9E8];
  p_liveConflictLoserEtags = (NSMutableSet **)v18;
  uint64_t v9 = (__CFString **)v17;
  uint64_t v10 = 2;
LABEL_8:
  uint64_t v4 = [v7 dictionaryWithObjects:p_liveConflictLoserEtags forKeys:v9 count:v10];
LABEL_9:
  return (NSDictionary *)v4;
}

- (void)addResolvedConflictLoserEtag:(id)a3
{
  resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
  if (resolvedConflictLoserEtags)
  {
    uint64_t v9 = (NSMutableSet *)a3;
    [(NSMutableSet *)resolvedConflictLoserEtags addObject:v9];
    uint64_t v4 = v9;
  }
  else
  {
    BOOL v6 = (objc_class *)MEMORY[0x1E4F1CA80];
    id v7 = a3;
    BOOL v8 = (NSMutableSet *)objc_msgSend([v6 alloc], "initWithObjects:", v7, 0);

    uint64_t v4 = self->_resolvedConflictLoserEtags;
    self->_resolvedConflictLoserEtags = v8;
  }
}

- (void)_updateUploadJobIfNeededWithDiffs:(unint64_t)a3
{
  if (self->super._syncUpState == 3
    && ([(BRCLocalVersion *)self->_currentVersion shouldRecreateUploadJobGivenDiffs:a3]|| (clientZone = self->super._clientZone, [(BRCLocalItem *)self->super._orig clientZone], BOOL v6 = objc_claimAutoreleasedReturnValue(), LOBYTE(clientZone) = [(BRCClientZone *)clientZone isEqualToClientZone:v6], v6, (clientZone & 1) == 0)))
  {
    id v7 = [(BRCAccountSession *)self->super._session fsUploader];
    [v7 cancelAndCleanupItemUpload:self];
  }
  else if ((a3 & 0x20000000000000) == 0)
  {
    return;
  }
  memset(v23, 0, sizeof(v23));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:]", 1668, v23);
  BOOL v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:]();
  }

  if (([(BRCPQLConnection *)self->super._db isBatchSuspended] & 1) == 0)
  {
    objc_super v19 = brc_bread_crumbs();
    __int16 v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCLocalItem createSyncUpJob].cold.7();
    }
  }
  uint64_t v10 = [(BRCAccountSession *)self->super._session syncUpScheduler];
  uint64_t v11 = [(BRCLocalItem *)self serverZone];
  objc_super v12 = [v11 dbRowID];
  int v13 = [v10 isItemInSyncUpAndInFlight:self inZone:v12];

  unsigned int syncUpState = self->super._syncUpState;
  if (syncUpState == 3)
  {
    BOOL v16 = [(BRCDocumentItem *)self isFault];
    BOOL v17 = [(BRCLocalItem *)self isDead];
    if (v17 || !v16) {
      BOOL v18 = !v17;
    }
    else {
      BOOL v18 = [(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone];
    }
    if (!v18)
    {
      double v21 = brc_bread_crumbs();
      __int16 v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:]();
      }
    }
    [(BRCAccountSession *)self->super._session fsUploader];
    if (v13) {
      uint64_t v15 = {;
    }
      [v15 setState:31 forItem:self];
    }
    else {
      uint64_t v15 = {;
    }
      [v15 uploadItem:self];
    }
  }
  else if (syncUpState == 4)
  {
    uint64_t v15 = [(BRCAccountSession *)self->super._session fsUploader];
    [v15 setState:31 forItem:self];
  }
  else
  {
    uint64_t v15 = [(BRCAccountSession *)self->super._session fsUploader];
    [v15 cancelAndCleanupItemUpload:self];
  }

  __brc_leave_section(v23);
}

- (void)_updateReadThrottleIfNeededForRowID:(unint64_t)a3 forCreation:(BOOL)a4
{
  if (self->super._syncUpState == 2)
  {
    if ([(BRCLocalItem *)self isLost]) {
      uint64_t v5 = 10;
    }
    else {
      uint64_t v5 = 1;
    }
    BOOL v6 = [(BRCAccountSession(LegacyAdditions) *)self->super._session fsReader];
    [v6 createReadingJobForItem:self state:v5];

    if (([(BRCPQLConnection *)self->super._db isBatchSuspended] & 1) == 0)
    {
      id v7 = brc_bread_crumbs();
      BOOL v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalItem createSyncUpJob].cold.7();
      }
    }
  }
  else
  {
    id v9 = [(BRCAccountSession(LegacyAdditions) *)self->super._session fsReader];
    [v9 setState:0 forItem:self];
  }
}

- (BOOL)_nukePackageItemsFromDB:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(BRCLocalItem *)self orig];
  BOOL v6 = [v5 st];
  id v7 = [v6 documentID];

  if (v7)
  {
    if (![v4 execute:@"DELETE FROM client_pkg_items WHERE item_doc_id = %@", v7])
    {
      BOOL v10 = 0;
      goto LABEL_9;
    }
    if ([v4 changes] >= 1)
    {
      BOOL v8 = brc_bread_crumbs();
      id v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = [v4 changes];
        int v13 = [(BRCLocalItem *)self st];
        BOOL v14 = [v13 documentID];
        *(_DWORD *)buf = 134218498;
        uint64_t v18 = v12;
        __int16 v19 = 2112;
        __int16 v20 = v14;
        __int16 v21 = 2112;
        __int16 v22 = v8;
        _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %lld items in pkg [%@]%@", buf, 0x20u);
      }
      if (([(BRCPQLConnection *)self->super._db isBatchSuspended] & 1) == 0)
      {
        uint64_t v15 = brc_bread_crumbs();
        BOOL v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[BRCLocalItem createSyncUpJob].cold.7();
        }
      }
    }
  }
  BOOL v10 = 1;
LABEL_9:

  return v10;
}

- (void)_updateRecursivePropertiesInDB:(id)a3 dbRowID:(unint64_t)a4 diffs:(unint64_t)a5
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (([v8 isBatchSuspended] & 1) == 0)
  {
    __int16 v60 = brc_bread_crumbs();
    v61 = brc_default_log();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
      -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:].cold.4();
    }
  }
  id v9 = [(BRCLocalItem *)self->super._orig asDocument];
  if ([(BRCLocalItem *)self isReserved])
  {
    if (![(BRCLocalItem *)self->super._orig isReserved])
    {
      BOOL v10 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:]();
      }

      objc_msgSend(v8, "execute:", @"DELETE FROM item_recursive_properties WHERE item_rowid = %llu ", a4);
    }
  }
  else
  {
    if ((self->super._sharingOptions & 4) != 0
      || ([(BRCLocalItem *)self->super._orig sharingOptions] & 4) != 0)
    {
      unsigned int v12 = 1073741826;
    }
    else
    {
      unsigned int v12 = 2;
    }
    if (((v12 | 0x32004000000000) & a5) != 0
      || ([(BRCLocalItem *)self->super._orig clientZone],
          int v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 isEqualToClientZone:self->super._clientZone],
          v13,
          (v14 & 1) == 0))
    {
      BOOL v73 = [(BRCDocumentItem *)self isFault];
      if ([(BRCDesiredVersion *)self->_desiredVersion isFault]) {
        uint64_t v72 = [(BRCDocumentItem *)self isFault] ^ 1;
      }
      else {
        uint64_t v72 = 0;
      }
      unint64_t v77 = a4;
      if ([(BRCLocalItem *)self needsUpload])
      {
        uint64_t v15 = [(BRCDocumentItem *)self currentVersion];
        uint64_t v80 = [v15 size];

        uint64_t v75 = 1;
      }
      else
      {
        uint64_t v75 = 0;
        uint64_t v80 = 0;
      }
      char v78 = v9;
      if ([(BRCDesiredVersion *)self->_desiredVersion wantsContent]
        && ([(BRCLocalStatInfo *)self->super._st stagedFileID],
            BOOL v16 = objc_claimAutoreleasedReturnValue(),
            v16,
            !v16))
      {
        int64_t v79 = [(BRCVersion *)self->_desiredVersion size];
        uint64_t v17 = 1;
      }
      else
      {
        uint64_t v17 = 0;
        int64_t v79 = 0;
      }
      uint64_t v18 = [(BRCLocalStatInfo *)self->super._st stagedFileID];

      if (v18) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = v17;
      }
      uint64_t v71 = v19;
      BOOL v20 = [(BRCLocalItem *)self needsSyncUp];
      __int16 v21 = [(BRCLocalItem *)self->super._orig st];
      __int16 v22 = [v21 stagedFileID];
      uint64_t v23 = [(BRCLocalStatInfo *)self->super._st stagedFileID];

      if (v22 == v23
        || ([(BRCLocalItem *)self->super._orig st],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            [v24 stagedFileID],
            id v25 = objc_claimAutoreleasedReturnValue(),
            v25,
            v24,
            v25))
      {
        uint64_t v26 = 0;
      }
      else
      {
        long long v27 = [v78 desiredVersion];
        uint64_t v26 = [v27 size];
      }
      uint64_t v28 = [(BRCLocalItem *)self->super._orig st];
      uint64_t v29 = [v28 stagedFileID];
      if (v29)
      {
        char v30 = (void *)v29;
        uint64_t v31 = [(BRCLocalItem *)self st];
        int v32 = [v31 stagedFileID];
        BOOL v70 = v32 == 0;
      }
      else
      {

        BOOL v70 = 0;
      }
      BOOL v33 = [(BRCLocalItem *)self->super._orig needsUpload];
      if (v33 != [(BRCLocalItem *)self needsUpload]
        && [(BRCLocalItem *)self->super._orig needsUpload]
        && [(BRCLocalItem *)self needsSyncUp])
      {
        int64_t v34 = [v78 currentVersion];
        uint64_t v35 = [v34 size];
      }
      else
      {
        uint64_t v35 = 0;
      }
      BOOL v36 = [(BRCLocalItem *)self->super._orig needsSyncUp];
      if (v36 == [(BRCLocalItem *)self needsSyncUp]) {
        uint64_t v69 = 0;
      }
      else {
        uint64_t v69 = [(BRCLocalItem *)self->super._orig needsSyncUp];
      }
      BOOL v37 = v73;
      BOOL v74 = v20;
      uint64_t v38 = [(BRCDocumentItem *)self uploadError];
      unsigned int v39 = objc_msgSend(v38, "brc_isCloudKitOutOfQuota");

      uint64_t v40 = v39;
      if ((self->super._sharingOptions & 4) != 0)
      {
        BOOL v41 = [(BRCServerZone *)self->super._serverZone isSharedZone];
        BOOL v65 = !v41;
        BOOL v64 = v41;
      }
      else
      {
        BOOL v64 = 0;
        BOOL v65 = 0;
      }
      BOOL v62 = [(BRCLocalItem *)self isAlmostDead];
      BOOL v68 = v35 != 0;
      uint64_t v42 = v75;
      if (v80) {
        uint64_t v42 = 1;
      }
      uint64_t v66 = v35;
      uint64_t v67 = v42;
      uint64_t v76 = v26;
      BOOL v43 = v26 != 0;
      v44 = brc_bread_crumbs();
      __int16 v45 = brc_default_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        itemID = self->super._itemID;
        *(_DWORD *)buf = 138416386;
        v82 = itemID;
        __int16 v83 = 2048;
        uint64_t v84 = v72;
        __int16 v85 = 2048;
        BOOL v86 = v37;
        __int16 v87 = 2048;
        uint64_t v88 = v39;
        __int16 v89 = 2048;
        uint64_t v90 = v67;
        __int16 v91 = 2048;
        uint64_t v92 = v80;
        __int16 v93 = 2048;
        BOOL v94 = v68;
        __int16 v95 = 2048;
        uint64_t v96 = v66;
        __int16 v97 = 2048;
        BOOL v98 = v79 != 0;
        __int16 v99 = 2048;
        int64_t v100 = v79;
        __int16 v101 = 2048;
        BOOL v102 = v26 != 0;
        __int16 v103 = 2048;
        uint64_t v104 = v26;
        __int16 v105 = 2048;
        uint64_t v106 = v71;
        __int16 v107 = 2048;
        BOOL v108 = v70;
        __int16 v109 = 2048;
        BOOL v110 = v74;
        __int16 v111 = 2048;
        uint64_t v112 = v69;
        __int16 v113 = 2112;
        v114 = v44;
        _os_log_debug_impl(&dword_1D353B000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] updating recursive properties starting from document %@:\n fault:    {needs:%lld done:%lld}\n quota:    %lld\n upload:   {needs:(count:%lld size:%lld) done:(count:%lld size:%lld)}\n download: {needs:(count:%lld size:%lld) done:(count:%lld size:%lld)}\n unstage:  {needs:%lld done:%lld}\n sync-up:  {needs:%lld done:%lld}\n%@", buf, 0xACu);
      }
      BOOL v63 = v37;

      int v46 = [(BRCStatInfo *)self->super._st type];
      if (v46 == 8 || v46 == 2) {
        int v48 = 1;
      }
      else {
        int v48 = v46;
      }
      if (v48 == 7) {
        int v49 = 6;
      }
      else {
        int v49 = v48;
      }
      v50 = [(BRCStatInfo *)self->super._st parentID];
      v51 = self->super._itemID;
      v52 = [(BRCClientZone *)self->super._clientZone dbRowID];
      uint64_t v53 = [(BRCLocalItem *)self parentClientZone];
      id v54 = [v53 dbRowID];
      LOBYTE(v51) = [v8 execute:@"INSERT OR IGNORE INTO item_recursive_properties (item_rowid, item_parent_id, item_id, zone_rowid, item_type, item_parent_zone_rowid) VALUES  (%lld, %@, %@, %@, %d, %@)", v77, v50, v51, v52, v49, v54];

      if (v51)
      {
        id v9 = v78;
        if ((objc_msgSend(v8, "execute:", @"UPDATE item_recursive_properties SET  dir_faults_count = %lld, faults_count = %lld, needs_faulting_count = %lld, uploaded_size = %lld, needs_upload_size = %lld, uploaded_count = %lld, needs_upload_count = %lld, downloaded_size = %lld, needs_download_size = %lld, downloaded_count = %lld, needs_download_count = %lld, dl_unstaged_count = %lld, needs_dl_unstage_count = %lld, synced_up_count = %lld, needs_sync_up_count = %lld, over_quota_count = %lld, shared_by_me_count = %lld, shared_to_me_count = %lld, needs_delete_doc_count = %lld  WHERE item_rowid = %llu ", 0, v63, v72, v66, v80, v68, v67, v76, v79, v43, v79 != 0, v70, v71, v69, v74, v40,
                v65,
                v64,
                v62,
                v77) & 1) == 0)
        {
          __int16 v55 = brc_bread_crumbs();
          uint64_t v56 = brc_default_log();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
            -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:]();
          }
        }
      }
      else
      {
        uint64_t v57 = brc_bread_crumbs();
        __int16 v58 = brc_default_log();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT)) {
          -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:]();
        }

        id v9 = v78;
      }
    }
  }
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  id v58 = a3;
  BOOL v74 = [(BRCClientZone *)self->super._clientZone dbRowID];
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  unint64_t sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  unint64_t localDiffs = self->super._localDiffs;
  unint64_t notifsRank = self->super._notifsRank;
  uint64_t syncUpState = self->super._syncUpState;
  uint64_t v56 = [(BRCLocalItem *)self appLibrary];
  BOOL v73 = [v56 dbRowID];
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  BOOL isUserVisible = self->super._isUserVisible;
  v61 = [(BRCStatInfo *)self->super._st ckInfo];
  int v43 = [(BRCStatInfo *)self->super._st state];
  int v44 = [(BRCStatInfo *)self->super._st type];
  int v42 = [(BRCStatInfo *)self->super._st mode];
  int64_t v40 = [(BRCStatInfo *)self->super._st birthtime];
  int64_t v41 = [(BRCStatInfo *)self->super._st lastUsedTime];
  int64_t v39 = [(BRCStatInfo *)self->super._st favoriteRank];
  uint64_t v72 = [(BRCStatInfo *)self->super._st parentID];
  st = self->super._st;
  logicalName = (__CFString *)st->super._logicalName;
  if (!logicalName) {
    logicalName = &stru_1F2AC7720;
  }
  BOOL v37 = logicalName;
  BOOL v38 = [(BRCStatInfo *)st isHiddenExt];
  id v59 = [(BRCStatInfo *)self->super._st finderTags];
  BOOL v70 = [(BRCStatInfo *)self->super._st xattrSignature];
  uint64_t v71 = [(BRCStatInfo *)self->super._st trashPutBackPath];
  uint64_t v69 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
  BOOL v68 = [(BRCStatInfo *)self->super._st aliasTarget];
  uint64_t v67 = [(BRCStatInfo *)self->super._st creatorRowID];
  uint64_t v66 = [(BRCLocalStatInfo *)self->super._st documentID];
  __int16 v60 = [(BRCLocalStatInfo *)self->super._st fileID];
  BOOL v65 = [(BRCLocalStatInfo *)self->super._st generationID];
  BOOL v64 = [(BRCLocalStatInfo *)self->super._st physicalName];
  BOOL v63 = [(BRCLocalStatInfo *)self->super._st processingStamp];
  BOOL v62 = [(BRCLocalStatInfo *)self->super._st stagedFileIDForDB];
  uint64_t v32 = [(BRCLocalStatInfo *)self->super._st stagedGenerationID];
  BOOL v36 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
  unsigned int v31 = [(BRCLocalStatInfo *)self->super._st itemScope];
  uint64_t v35 = [(BRCLocalStatInfo *)self->super._st tmpBouncedNo];
  int64_t v34 = [(BRCVersion *)self->_currentVersion originalPOSIXName];
  BOOL v33 = [(BRCVersion *)self->_currentVersion ckInfo];
  int64_t v25 = [(BRCVersion *)self->_currentVersion mtime];
  int64_t v24 = [(BRCVersion *)self->_currentVersion size];
  int64_t v23 = [(BRCVersion *)self->_currentVersion thumbnailSize];
  BOOL v20 = [(BRCVersion *)self->_currentVersion thumbnailSignature];
  uint64_t v19 = [(BRCVersion *)self->_currentVersion contentSignature];
  char v30 = [(BRCVersion *)self->_currentVersion xattrSignature];
  uint64_t v29 = [(BRCVersion *)self->_currentVersion editedSinceShared];
  long long v27 = [(BRCVersion *)self->_currentVersion lastEditorDeviceOrUserRowID];
  __int16 v22 = [(BRCVersion *)self->_currentVersion conflictLoserEtags];
  __int16 v21 = [(BRCVersion *)self->_currentVersion quarantineInfo];
  uint64_t v18 = [(BRCLocalVersion *)self->_currentVersion uploadedAssets];
  uint64_t v17 = [(BRCLocalVersion *)self->_currentVersion uploadError];
  uint64_t v28 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
  BOOL v16 = [v28 itemID];
  uint64_t v26 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
  uint64_t v15 = [v26 zoneRowID];
  desiredVersion = self->_desiredVersion;
  char v14 = [(BRCDocumentItem *)self conflictLoserState];
  int v13 = [(BRCDocumentItem *)self liveThumbnailSignature];
  int v55 = objc_msgSend(v58, "execute:", @"INSERT INTO client_items(rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp) VALUES(%lld, %@, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %u, %@, %d, %@, %@, %@, %lld, %lld, %lld, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %d, %@, %@)", a4, v74, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v73, minimumSupportedOSRowID, isUserVisible, v61, v43, v44,
          v42,
          v40,
          v41,
          v39,
          v72,
          v37,
          v38,
          v59,
          v70,
          v71,
          v69,
          v68,
          v67,
          v66,
          v60,
          v65,
          v64,
          v63,
          v62,
          v32,
          v36,
          v31,
          v35,
          v34,
          v33,
          v25,
          v24,
          v23,
          v20,
          v19,
          v30,
          v29,
          v27,
          v22,
          v21,
          v18,
          v17,
          v16,
          v15,
          desiredVersion,
          v14,
          v13,
          [(BRCDocumentItem *)self shouldAutomaticallyDownloadThumbnail],
          self->_syncPausedByBundleID);

  if (v55)
  {
    v75.receiver = self;
    v75.super_class = (Class)BRCDocumentItem;
    id v8 = v58;
    if ([(BRCLocalItem *)&v75 _insertInDB:v58 dbRowID:a4]
      && ([(BRCAccountSession *)self->super._session diskReclaimer],
          id v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 documentWasCreated:self],
          v9,
          v10))
    {
      BOOL v11 = 1;
      [(BRCDocumentItem *)self _updateReadThrottleIfNeededForRowID:a4 forCreation:1];
      [(BRCDocumentItem *)self _updateRecursivePropertiesInDB:v58 dbRowID:a4 diffs:0xFF007FF3FF7FFFLL];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
    id v8 = v58;
  }

  return v11;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v141 = a3;
  if (![(BRCDocumentItem *)self isFault])
  {
    if ([(BRCLocalItem *)self->super._orig isFault])
    {
      uint64_t v5 = [(BRCLocalItem *)self st];
      BOOL v6 = [v5 documentID];
      if (v6)
      {

LABEL_6:
        id v8 = [(BRCLocalItem *)self->super._orig st];
        id v9 = [v8 documentID];

        if (!v9)
        {
          v82 = brc_bread_crumbs();
          __int16 v83 = brc_default_log();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
            -[BRCDocumentItem _updateInDB:diffs:]();
          }
        }
        int v10 = 1;
LABEL_9:
        if ([(BRCLocalItem *)self->super._orig isDocument])
        {
          BOOL v11 = [(BRCLocalItem *)self->super._orig asDocument];
        }
        else
        {
          BOOL v11 = 0;
        }
        unsigned int v12 = [v11 desiredVersion];
        if (v12)
        {
          desiredVersion = self->_desiredVersion;

          if (desiredVersion)
          {
            if (!v10)
            {
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
            int64_t v79 = [(BRCDocumentItem *)self currentVersion];
            uint64_t v80 = [v11 desiredVersion];
            char v81 = [v79 isEtagEqual:v80];

            if ((v81 & 1) == 0) {
              goto LABEL_16;
            }
          }
        }
        else if ((v10 & 1) == 0)
        {
          goto LABEL_16;
        }
        char v14 = [(BRCAccountSession *)self->super._session downloadTrackers];
        [v14 document:self didCompleteDownloadWithError:0];

        goto LABEL_16;
      }
      BOOL v7 = [(BRCLocalItem *)self isDead];

      if (v7) {
        goto LABEL_6;
      }
    }
    int v10 = 0;
    goto LABEL_9;
  }
LABEL_17:
  if ((a4 & 0x100000000) != 0 && [(BRCLocalItem *)self isDead]) {
    [(BRCDocumentItem *)self _nukePackageItemsFromDB:v141];
  }
  if ([(BRCDocumentItem *)self isDocumentBeingCopiedToNewZone]
    || [(BRCLocalItem *)self->super._orig isDocumentBeingCopiedToNewZone])
  {
    clientZone = self->super._clientZone;
    BOOL v16 = [(BRCLocalItem *)self->super._orig clientZone];
    LOBYTE(clientZone) = [(BRCClientZone *)clientZone isEqualToClientZone:v16];

    if ((clientZone & 1) == 0)
    {
      uint64_t v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BRCDocumentItem _updateInDB:diffs:]();
      }

      uint64_t v19 = [BRCItemDBRowIDAndZoneJobIdentifier alloc];
      unint64_t dbRowID = self->super._dbRowID;
      __int16 v21 = [(BRCLocalItem *)self->super._orig clientZone];
      __int16 v22 = [v21 dbRowID];
      int64_t v23 = [(BRCItemDBRowIDAndZoneJobIdentifier *)v19 initWithItemDBRowID:dbRowID zoneRowID:v22];

      int64_t v24 = [(BRCAccountSession(LegacyAdditions) *)self->super._session fsReader];
      [v24 deleteJobsMatching:v23];

      int64_t v25 = [(BRCAccountSession *)self->super._session fsDownloader];
      [v25 deleteJobsMatching:v23];

      uint64_t v26 = [(BRCAccountSession *)self->super._session fsUploader];
      [v26 deleteJobsMatching:v23];
    }
  }
  [(BRCDocumentItem *)self _updateUploadJobIfNeededWithDiffs:a4];
  if ((a4 & 0x2010000) != 0)
  {
    long long v27 = [(BRCVersion *)self->_currentVersion conflictLoserEtags];
    uint64_t v28 = [v27 count];

    if (v28)
    {
      uint64_t v29 = [(BRCAccountSession *)self->super._session fsDownloader];
      [v29 rescheduleJobsPendingWinnerForItem:self];
    }
  }
  if (a4 != 0x100000000)
  {
    v140 = [(BRCClientZone *)self->super._clientZone dbRowID];
    itemID = self->super._itemID;
    ownerKey = self->super._ownerKey;
    unint64_t sharingOptions = self->super._sharingOptions;
    sideCarCKInfo = self->super._sideCarCKInfo;
    parentZoneRowID = self->super._parentZoneRowID;
    unint64_t localDiffs = self->super._localDiffs;
    unint64_t notifsRank = self->super._notifsRank;
    uint64_t syncUpState = self->super._syncUpState;
    v121 = [(BRCLocalItem *)self appLibrary];
    v139 = [v121 dbRowID];
    minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
    BOOL isUserVisible = self->super._isUserVisible;
    id v138 = [(BRCStatInfo *)self->super._st ckInfo];
    int v109 = [(BRCStatInfo *)self->super._st state];
    int v107 = [(BRCStatInfo *)self->super._st type];
    int v108 = [(BRCStatInfo *)self->super._st mode];
    int64_t v106 = [(BRCStatInfo *)self->super._st birthtime];
    int64_t v105 = [(BRCStatInfo *)self->super._st lastUsedTime];
    int64_t v104 = [(BRCStatInfo *)self->super._st favoriteRank];
    unsigned int v126 = [(BRCStatInfo *)self->super._st parentID];
    st = self->super._st;
    logicalName = (__CFString *)st->super._logicalName;
    if (!logicalName) {
      logicalName = &stru_1F2AC7720;
    }
    __int16 v103 = logicalName;
    BOOL v102 = [(BRCStatInfo *)st isHiddenExt];
    id v136 = [(BRCStatInfo *)self->super._st finderTags];
    id v137 = [(BRCStatInfo *)self->super._st xattrSignature];
    uint64_t v135 = [(BRCStatInfo *)self->super._st trashPutBackPath];
    uint64_t v134 = [(BRCStatInfo *)self->super._st trashPutBackParentID];
    id v133 = [(BRCStatInfo *)self->super._st aliasTarget];
    uint64_t v132 = [(BRCStatInfo *)self->super._st creatorRowID];
    uint64_t v131 = [(BRCLocalStatInfo *)self->super._st documentID];
    v130 = [(BRCLocalStatInfo *)self->super._st fileID];
    v129 = [(BRCLocalStatInfo *)self->super._st generationID];
    v128 = [(BRCLocalStatInfo *)self->super._st physicalName];
    v127 = [(BRCLocalStatInfo *)self->super._st processingStamp];
    BOOL v125 = [(BRCLocalStatInfo *)self->super._st stagedFileIDForDB];
    uint64_t v100 = [(BRCLocalStatInfo *)self->super._st stagedGenerationID];
    BOOL v124 = [(BRCLocalStatInfo *)self->super._st rawBouncedLogicalName];
    unsigned int v98 = [(BRCLocalStatInfo *)self->super._st itemScope];
    v122 = [(BRCLocalStatInfo *)self->super._st tmpBouncedNo];
    v123 = [(BRCVersion *)self->_currentVersion originalPOSIXName];
    __int16 v101 = [(BRCVersion *)self->_currentVersion ckInfo];
    int64_t v93 = [(BRCVersion *)self->_currentVersion mtime];
    int64_t v91 = [(BRCVersion *)self->_currentVersion size];
    int64_t v90 = [(BRCVersion *)self->_currentVersion thumbnailSize];
    __int16 v89 = [(BRCVersion *)self->_currentVersion thumbnailSignature];
    __int16 v99 = [(BRCVersion *)self->_currentVersion contentSignature];
    __int16 v97 = [(BRCVersion *)self->_currentVersion xattrSignature];
    uint64_t v96 = [(BRCVersion *)self->_currentVersion editedSinceShared];
    __int16 v95 = [(BRCVersion *)self->_currentVersion lastEditorDeviceOrUserRowID];
    uint64_t v88 = [(BRCVersion *)self->_currentVersion conflictLoserEtags];
    __int16 v87 = [(BRCVersion *)self->_currentVersion quarantineInfo];
    BOOL v86 = [(BRCLocalVersion *)self->_currentVersion uploadedAssets];
    int64_t v34 = [(BRCLocalVersion *)self->_currentVersion uploadError];
    BOOL v94 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
    uint64_t v35 = [v94 itemID];
    uint64_t v92 = [(BRCLocalVersion *)self->_currentVersion previousItemGlobalID];
    uint64_t v84 = [v92 zoneRowID];
    BOOL v36 = self->_desiredVersion;
    __int16 v85 = [(BRCDocumentItem *)self conflictLoserState];
    BOOL v37 = [(BRCDocumentItem *)self liveThumbnailSignature];
    int v120 = objc_msgSend(v141, "execute:", @"UPDATE client_items SET  zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_doc_id = %@, item_file_id = %@, item_generation = %@, item_localname = %@, item_processing_stamp = %@, item_staged_file_id = %@, item_staged_generation = %u, item_bouncedname = %@, item_scope = %d, item_tmpbounceno = %@, version_name = %@, version_ckinfo = %@, version_mtime = %lld, version_size = %lld, version_thumb_size = %lld, version_thumb_signature = %@, version_content_signature = %@, version_xattr_signature = %@, version_edited_since_shared = %@, version_device = %@, version_conflict_loser_etags = %@, version_quarantine_info = %@, version_uploaded_assets = %@, version_upload_error = %@, version_old_zone_item_id = %@, version_old_zone_rowid = %@, desired_version = %@, item_live_conflict_loser_etags = %@, item_thumb_live_signature = %@, item_thumb_greedy = %d, version_block_sync_until_bundle_id = %@, version_block_sync_until_timestamp = %@  WHERE rowid = %llu", v140, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v139, minimumSupportedOSRowID, isUserVisible, v138, v109, v107, v108,
             v106,
             v105,
             v104,
             v126,
             v103,
             v102,
             v136,
             v137,
             v135,
             v134,
             v133,
             v132,
             v131,
             v130,
             v129,
             v128,
             v127,
             v125,
             v100,
             v124,
             v98,
             v122,
             v123,
             v101,
             v93,
             v91,
             v90,
             v89,
             v99,
             v97,
             v96,
             v95,
             v88,
             v87,
             v86,
             v34,
             v35,
             v84,
             v36,
             v85,
             v37,
             [(BRCDocumentItem *)self shouldAutomaticallyDownloadThumbnail],
             self->_syncPausedByBundleID,
             self->_syncPausedExpireTS);

    if (!v120) {
      goto LABEL_76;
    }
LABEL_35:
    if ([(BRCLocalItem *)self isInTrashScope]
      && ![(BRCLocalItem *)self->super._orig isInTrashScope])
    {
      long long v151 = 0u;
      long long v150 = 0u;
      long long v149 = 0u;
      long long v148 = 0u;
      __int16 v47 = [(BRCLocalItem *)self->super._orig asDocument];
      int v42 = [v47 reverseAliasEnumerator];

      uint64_t v48 = [v42 countByEnumeratingWithState:&v148 objects:v159 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v149;
        do
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v149 != v50) {
              objc_enumerationMutation(v42);
            }
            [*(id *)(*((void *)&v148 + 1) + 8 * i) targetMovedToTrashOrDeleted];
          }
          uint64_t v49 = [v42 countByEnumeratingWithState:&v148 objects:v159 count:16];
        }
        while (v49);
      }
    }
    else
    {
      if ((a4 & 0x80000000) == 0)
      {
        if ((a4 & 1) == 0
          || ([(BRCLocalItem *)self->super._orig st],
              BOOL v38 = objc_claimAutoreleasedReturnValue(),
              [v38 ckInfo],
              int64_t v39 = objc_claimAutoreleasedReturnValue(),
              v39,
              v38,
              v39))
        {
          int v40 = 1;
          goto LABEL_63;
        }
      }
      long long v147 = 0u;
      long long v146 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      int64_t v41 = [(BRCLocalItem *)self->super._orig asDocument];
      int v42 = [v41 reverseAliasEnumerator];

      uint64_t v43 = [v42 countByEnumeratingWithState:&v144 objects:v158 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v145;
        LOBYTE(v40) = 1;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v145 != v45) {
              objc_enumerationMutation(v42);
            }
            if (v40) {
              int v40 = [*(id *)(*((void *)&v144 + 1) + 8 * j) updateOnDiskWithAliasTarget:self forServerEdit:1];
            }
            else {
              int v40 = 0;
            }
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v144 objects:v158 count:16];
        }
        while (v44);
        goto LABEL_62;
      }
    }
    int v40 = 1;
LABEL_62:

LABEL_63:
    if ((a4 & 0x40000000000000) != 0)
    {
      v52 = [(BRCLocalItem *)self appLibrary];
      uint64_t v53 = [(BRCDocumentItem *)self anyReverseAliasInAppLibrary:v52];
      [v53 targetMovedToThisAppLibrary];
    }
    if (!v40) {
      goto LABEL_76;
    }
    id v54 = [(BRCAccountSession *)self->super._session diskReclaimer];
    [v54 documentWasUpdated:self diffs:a4];

    int v55 = [(BRCDesiredVersion *)self->_desiredVersion downloadError];

    if (v55)
    {
      uint64_t v56 = [(BRCAccountSession *)self->super._session downloadTrackers];
      uint64_t v57 = [(BRCDesiredVersion *)self->_desiredVersion downloadError];
      [v56 document:self didCompleteDownloadWithError:v57];
    }
    [(BRCDocumentItem *)self _updateRecursivePropertiesInDB:v141 dbRowID:self->super._dbRowID diffs:a4];
    if ((a4 & 0x80000000) != 0
      || [(BRCLocalItem *)self->super._orig isReserved] && ![(BRCLocalItem *)self isReserved])
    {
      id v58 = [(BRCAccountSession *)self->super._session applyScheduler];
      id v59 = [(BRCLocalItem *)self unsaltedBookmarkData];
      __int16 v60 = (void *)[v141 fetch:@"SELECT zone_rowid, item_rank FROM server_items WHERE item_alias_target = %@ AND item_type = 3", v59];

      if ([v60 next])
      {
        do
        {
          v61 = [v60 numberAtIndex:0];
          BOOL v62 = [(BRCAccountSession *)self->super._session serverZoneByRowID:v61];
          uint64_t v63 = [v60 longLongAtIndex:1];
          BOOL v64 = brc_bread_crumbs();
          BOOL v65 = brc_default_log();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v66 = [v62 zoneName];
            *(_DWORD *)buf = 134218498;
            uint64_t v153 = v63;
            __int16 v154 = 2112;
            v155 = v66;
            __int16 v156 = 2112;
            BOOL v157 = v64;
            _os_log_debug_impl(&dword_1D353B000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: Rescheduling reverse-alias in %@%@", buf, 0x20u);
          }
          [v58 setState:1 andApplyKind:1 forRank:v63 zoneRowID:v61];
        }
        while (([v60 next] & 1) != 0);
      }
    }
    [(BRCDocumentItem *)self _updateReadThrottleIfNeededForRowID:self->super._dbRowID forCreation:0];
    BOOL v68 = [(BRCLocalItem *)self session];
    uint64_t v69 = [v68 globalProgress];
    [v69 didUpdateDocument:self];

    BOOL v70 = [(BRCLocalVersion *)self->_currentVersion uploadError];
    uint64_t v71 = [(BRCLocalItem *)self->super._orig asDocument];
    uint64_t v72 = [v71 currentVersion];
    BOOL v73 = [v72 uploadError];
    BOOL v74 = [(BRCDocumentItem *)self _needsSyncBubbleRecomputeForError:v70 origError:v73];

    if (v74) {
      [(BRCClientZone *)self->super._clientZone recomputeAllItemsDidUploadState];
    }
    if ([(BRCDocumentItem *)self isPackage] && [(BRCDocumentItem *)self isFault])
    {
      orig = self->super._orig;
      if (!orig)
      {
LABEL_89:
        v143.receiver = self;
        v143.super_class = (Class)BRCDocumentItem;
        BOOL v67 = [(BRCLocalItem *)&v143 _updateInDB:v141 diffs:a4];
        goto LABEL_90;
      }
      if (![(BRCLocalItem *)orig isFault]) {
        [(BRCDocumentItem *)self _nukePackageItemsFromDB:v141];
      }
    }
    uint64_t v76 = self->super._orig;
    if (v76 && ![(BRCLocalItem *)v76 isOnDisk] && [(BRCLocalItem *)self isOnDisk])
    {
      unint64_t v77 = [(BRCAccountSession *)self->super._session applyScheduler];
      [v77 rescheduleMissingTargetAliasesWithTarget:self];
    }
    goto LABEL_89;
  }
  int v30 = [(BRCStatInfo *)self->super._st state];
  unsigned int v31 = [(BRCLocalStatInfo *)self->super._st lostStamp];
  LOBYTE(v30) = [v141 execute:@"UPDATE client_items SET item_state = %d, item_processing_stamp = %@ WHERE rowid = %llu", v30, v31, self->super._dbRowID];

  if (v30) {
    goto LABEL_35;
  }
LABEL_76:
  BOOL v67 = 0;
LABEL_90:

  return v67;
}

- (BOOL)_needsSyncBubbleRecomputeForError:(id)a3 origError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5
    || (objc_msgSend(v5, "brc_isEverRetriable") & 1) != 0
    || v6 && (objc_msgSend(v6, "brc_isEverRetriable") & 1) == 0)
  {
    id v8 = +[BRCAccountsManager sharedManager];
    [v8 retrySyncBubbleLaterIfNeededWithError:v5];

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4
{
  uint64_t v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(BRCLocalItem *)self->super._orig isFault])
  {
    BOOL v7 = [(BRCAccountSession *)self->super._session downloadTrackers];
    [v7 document:self didCompleteDownloadWithError:0];
  }
  if (![(BRCDocumentItem *)self _nukePackageItemsFromDB:v6]) {
    goto LABEL_25;
  }
  if (!self->super._dbRowID)
  {
    BOOL v35 = 1;
    goto LABEL_27;
  }
  if ((v4 & 1) == 0)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v8 = [(BRCDocumentItem *)self reverseAliasEnumerator];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v41 + 1) + 8 * i) targetMovedToTrashOrDeleted];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v10);
    }
  }
  int v13 = [(BRCAccountSession *)self->super._session diskReclaimer];
  int v14 = [v13 documentWasDeleted:self];

  if (v14)
  {
    uint64_t v15 = [(BRCLocalItem *)self session];
    BOOL v16 = [v15 globalProgress];
    [v16 didDeleteDocument:self];

    uint64_t v17 = [(BRCLocalItem *)self clientZone];
    uint64_t v18 = [(BRCLocalItem *)self itemID];
    uint64_t v19 = [v17 popOnDiskBlockForItemID:v18];

    if (v19) {
      v19[2](v19, 0);
    }
    BOOL v20 = [(BRCLocalItem *)self clientZone];
    __int16 v21 = [(BRCLocalItem *)self itemID];
    uint64_t v22 = [v20 popDownloadedBlockForItemID:v21];

    if (v22) {
      (*(void (**)(uint64_t, BRCDocumentItem *))(v22 + 16))(v22, self);
    }
    int64_t v39 = (void *)v22;
    if ([(BRCLocalItem *)self->super._orig isDocumentBeingCopiedToNewZone])
    {
      BOOL v37 = [(BRCLocalItem *)self clientZone];
      int64_t v23 = [v37 dbRowID];
      [(BRCLocalItem *)self->super._orig asDocument];
      int64_t v24 = v38 = v4;
      int64_t v25 = [v24 currentVersion];
      [v25 previousItemGlobalID];
      long long v27 = v26 = v19;
      uint64_t v28 = [v27 zoneRowID];
      char v29 = objc_msgSend(v23, "br_isEqualToNumber:", v28);

      uint64_t v19 = v26;
      uint64_t v4 = v38;

      if ((v29 & 1) == 0)
      {
        int v30 = brc_bread_crumbs();
        unsigned int v31 = brc_default_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int v46 = v30;
          _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Deleted item was copied from another zone, insert tombstone in the old zone%@", buf, 0xCu);
        }

        uint64_t v32 = [(BRCLocalItem *)self->super._orig asDocument];
        [v32 _insertTombstoneForPreviousZoneGlobalID];
      }
    }
    BOOL v33 = [(BRCAccountSession *)self->super._session fsDownloader];
    [v33 deleteDownloadingJobForItem:self];

    int64_t v34 = [(BRCAccountSession *)self->super._session fsUploader];
    [v34 deleteUploadingJobForItem:self];

    v40.receiver = self;
    v40.super_class = (Class)BRCDocumentItem;
    BOOL v35 = [(BRCLocalItem *)&v40 _deleteFromDB:v6 keepAliases:v4];
  }
  else
  {
LABEL_25:
    BOOL v35 = 0;
  }
LABEL_27:

  return v35;
}

- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)BRCDocumentItem;
  BOOL v15 = [(BRCLocalItem *)&v31 startDownloadInTask:v12 options:a4 etagIfLoser:v13 stageFileName:v14 error:a7];
  if (v15)
  {
    BOOL v16 = self->_desiredVersion;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    char v30 = 0;
    if ((a4 & 4) != 0)
    {
      if (!self->_shouldAutomaticallyDownloadThumbnail)
      {
        self->_shouldAutomaticallyDownloadThumbnail = 1;
        char v30 = 1;
      }
    }
    else
    {
      if (![(BRCDocumentItem *)self isFault])
      {
        BOOL v17 = [(BRCLocalItem *)self isReserved];
        char v18 = v16 || v17;
        if ((v18 & 1) == 0)
        {
          int64_t v24 = brc_bread_crumbs();
          int64_t v25 = brc_default_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            -[BRCDocumentItem startDownloadInTask:options:etagIfLoser:stageFileName:error:]();
          }
          goto LABEL_21;
        }
      }
      uint64_t v19 = [(BRCDesiredVersion *)v16 downloadError];
      if (!v19
        && [(BRCDesiredVersion *)v16 wantsContent]
        && [(BRCDesiredVersion *)v16 userInitiated])
      {
        BOOL v20 = [(BRCLocalItem *)self st];
        __int16 v21 = [v20 stagedFileID];
        if (v21)
        {

          goto LABEL_23;
        }
        uint64_t v26 = [(BRCAccountSession *)self->super._session fsDownloader];
        int v27 = [v26 isDownloadingItem:self];

        if (v27)
        {
LABEL_23:
          int64_t v24 = brc_bread_crumbs();
          int64_t v25 = brc_default_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            -[BRCDocumentItem startDownloadInTask:options:etagIfLoser:stageFileName:error:]();
          }
LABEL_21:

          goto LABEL_17;
        }
      }
      else
      {
      }
    }
    db = self->super._db;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __79__BRCDocumentItem_startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke;
    v28[3] = &unk_1E69968D0;
    void v28[4] = self;
    void v28[5] = v29;
    v28[6] = a4;
    [(BRCPQLConnection *)db groupInBatch:v28];
LABEL_17:
    _Block_object_dispose(v29, 8);
  }
  return v15;
}

void __79__BRCDocumentItem_startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) serverItemByItemID:*(void *)(*(void *)(a1 + 32) + 48)];
  if (v2)
  {
    id v3 = *(id *)(*(void *)(a1 + 32) + 248);
    uint64_t v4 = [v3 downloadError];

    if (v4)
    {
      id v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __79__BRCDocumentItem_startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke_cold_1();
      }

      [v3 setDownloadError:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    uint64_t v7 = *(void *)(a1 + 48);
    if ((v7 & 0x10) != 0) {
      int v8 = 18;
    }
    else {
      int v8 = 2;
    }
    if ((v7 & 4) != 0) {
      int v8 = 4;
    }
    uint64_t v9 = *(unsigned char **)(a1 + 32);
    if (v9[216]) {
      int v10 = v8 | 4;
    }
    else {
      int v10 = v8;
    }
    objc_msgSend(*(id *)(a1 + 32), "updateDesiredVersionWithServerItem:options:needsSave:", v2, *(_DWORD *)(a1 + 48) & 8 | objc_msgSend(v9, "isReserved") | v10, *(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 8) applyScheduler];
    [v11 resetBackoffForServerItem:v2];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) saveToDB];
  }
}

- (BRCLocalVersion)currentVersion
{
  return self->_currentVersion;
}

- (NSSet)resolvedConflictLoserEtags
{
  return &self->_resolvedConflictLoserEtags->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveThumbnailSignature, 0);
  objc_storeStrong((id *)&self->_desiredVersion, 0);
  objc_storeStrong((id *)&self->_syncPausedExpireTS, 0);
  objc_storeStrong((id *)&self->_syncPausedByBundleID, 0);
  objc_storeStrong((id *)&self->_liveConflictLoserEtags, 0);
  objc_storeStrong((id *)&self->_resolvedConflictLoserEtags, 0);
  objc_storeStrong((id *)&self->_currentVersion, 0);
}

- (id)documentRecordID
{
  itemID = self->super._itemID;
  id v3 = [(BRCServerZone *)self->super._serverZone zoneID];
  uint64_t v4 = [(BRCItemID *)itemID contentsRecordIDInZoneID:v3];

  return v4;
}

- (id)baseRecord
{
  return [(BRCDocumentItem *)self baseRecordClearAllFields:0];
}

- (id)baseRecordClearAllFields:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(BRCLocalItem *)self isFinderBookmark];
  id v6 = @"content";
  if (v5) {
    id v6 = @"structure";
  }
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F1A2D8];
  int v8 = v6;
  id v9 = [v7 alloc];
  int v10 = [(BRCDocumentItem *)self documentRecordID];
  uint64_t v11 = (void *)[v9 initWithRecordType:v8 recordID:v10];

  if (v3)
  {
    [v11 setObject:0 forKeyedSubscript:@"fileContent"];
    [v11 setObject:0 forKeyedSubscript:@"bookmarkContent"];
    [v11 setObject:0 forKeyedSubscript:@"pkgSignature"];
    [v11 setObject:0 forKeyedSubscript:@"pkgContent"];
    [v11 setObject:0 forKeyedSubscript:@"pkgXattrs"];
    [v11 setObject:0 forKeyedSubscript:@"pkgManifest"];
    [v11 setObject:0 forKeyedSubscript:@"pkgSignature"];
    [v11 setObject:0 forKeyedSubscript:@"thumb1024"];
    [v11 setObject:0 forKeyedSubscript:@"thumbQLMetadata"];
  }
  return v11;
}

- (void)isPackage
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isFinderBookmark || BRCItemTypeIsDocument(_st.type)%@", v2, v3, v4, v5, v6);
}

- (void)shouldBeGreedy
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] don't be greedy because the app library is not greedy, even though optimize storage is disabled%@", v2, v3, v4, v5, v6);
}

- (void)_initWithServerItem:dbRowID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: document without a version:\n    %@\n\n   this typically indicates either of two problems:\n    - either we failed processing the last sync down and we\n      saved the structure record but not the contents record,\n    - or the server forgot to send us a contents record.%@", v1);
}

- (void)_initWithServerItem:dbRowID:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: item.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)diffAgainstServerItem:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !info || info.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)clearVersionSignatures:isPackage:.cold.1()
{
  OUTLINED_FUNCTION_8();
  v0 = BRCPrettyPrintBitmap();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Clearing signatures: %@%@", v3, v4, v5, v6, v7);
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: serverItem.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)updateVersionMetadataFromServerItem:preventVersionDiffs:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Marking %@ as edited since shared because the item differs in edit mask%@");
}

- (void)updateVersionMetadataFromServerItem:preventVersionDiffs:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: serverItem.latestVersion%@", v2, v3, v4, v5, v6);
}

void __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] removing conflict loser with etag %@%@");
}

void __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] there is no conflict loser with etag %@%@");
}

- (void)markLatestSyncRequestRejectedInZone:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Clearing prev zone rowID and inserting tombstone for item which finished syncing to the new zone%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, a4, a3, "[CRIT] UNREACHABLE: no version on uploaded document %@%@", (uint8_t *)a3);
}

- (void)markUploadedWithRecord:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] item is now uploaded: %@%@");
}

- (void)markUploadedWithRecord:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _currentVersion.uploadedAssets == nil%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _currentVersion.thumbnailSignature.brc_signatureIsPendingPlaceHolder || self.isDocumentBeingCopiedToNewZone%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _currentVersion.contentSignature.brc_signatureIsPendingPlaceHolder || self.isDocumentBeingCopiedToNewZone%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _st.documentID%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.7()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _currentVersion%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.8()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: signature%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.9()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: (fileAsset && !pkgSignature) || (!fileAsset && pkgSignature)%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.10()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: record%@", v2, v3, v4, v5, v6);
}

- (void)markUploadedWithRecord:.cold.11()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] API MISUSE: state isn't needs-upload%@", v2, v3, v4, v5, v6);
}

- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:path:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.supportsServerSideAssetCopies%@", v2, v3, v4, v5, v6);
}

- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:path:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: parentItem%@", v2, v3, v4, v5, v6);
}

- (void)_updateUploadJobIfNeededWithDiffs:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !self.isDead && (!isFault || self.isDocumentBeingCopiedToNewZone)%@", v2, v3, v4, v5, v6);
}

- (void)_updateUploadJobIfNeededWithDiffs:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx updating upload jobs%@");
}

- (void)_updateRecursivePropertiesInDB:dbRowID:diffs:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Clearing recursive properties on item becoming reserved%@", v2, v3, v4, v5, v6);
}

- (void)_updateRecursivePropertiesInDB:dbRowID:diffs:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, v0, v3, "[CRIT] UNREACHABLE: can't update recursive properties: %@%@", v4);
}

- (void)_updateRecursivePropertiesInDB:dbRowID:diffs:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: db.isBatchSuspended%@", v2, v3, v4, v5, v6);
}

- (void)_updateInDB:diffs:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Updating zone info for a CZM item and deleting old zone jobs%@", v2, v3, v4, v5, v6);
}

- (void)_updateInDB:diffs:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _orig.st.documentID%@", v2, v3, v4, v5, v6);
}

- (void)startDownloadInTask:options:etagIfLoser:stageFileName:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] nothing to do because download is already scheduled and there is no error%@", v2, v3, v4, v5, v6);
}

- (void)startDownloadInTask:options:etagIfLoser:stageFileName:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] nothing to do because this document is already live and has no desired version%@", v2, v3, v4, v5, v6);
}

void __79__BRCDocumentItem_startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 downloadError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] clearing download error %@ since a download was explicitely requested%@", v4, v5, v6, v7, v8);
}

@end