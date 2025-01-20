@interface BRCXPCRegularIPCsClient
- (BOOL)_enumerateFoldersWithParent:(id)a3 depth:(unint64_t)a4 session:(id)a5 db:(id)a6 handler:(id)a7;
- (BOOL)_saveOrDeleteContainerMetadataRecordName:(id)a3 saveRecord:(BOOL)a4 error:(id *)a5;
- (id)_createBookmarkWithTarget:(id)a3 targetPath:(id)a4 parentPath:(id)a5 aliasName:(id)a6 error:(id *)a7;
- (id)_listBatchedFilesIngested:(id)a3 batchSize:(unsigned int)a4 error:(id *)a5;
- (id)_loggedInUserPropertyValuesForKeys:(id)a3 error:(id *)a4;
- (id)_removeSandboxedAttributes:(id)a3;
- (id)_sharingOperationItemFromLookup:(id)a3 url:(id)a4 allowDirectory:(BOOL)a5 error:(id *)a6;
- (void)_bumpLastUsedTimeOfSharedItem:(id)a3 clientZone:(id)a4;
- (void)_createSharingInfoForLocalItem:(id)a3 reply:(id)a4;
- (void)_gatherInformationForPath:(id)a3 session:(id)a4 reply:(id)a5;
- (void)_getPublishedURLForLocalItem:(id)a3 forStreaming:(BOOL)a4 requestedTTL:(unint64_t)a5 reply:(id)a6;
- (void)_getiWorkNeedsShareMigrateForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5;
- (void)_getiWorkPublishingBadgingStatusForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5;
- (void)_getiWorkPublishingInfoForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5;
- (void)_launchItemCountMismatchChecksForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5;
- (void)_presentAcceptDialogsWithMetadata:(id)a3 reply:(id)a4;
- (void)_readerThrottleBackoffForDocumentAtPath:(id)a3 session:(id)a4 containerID:(id)a5 reply:(id)a6;
- (void)_sendPausedFileListBatchToUpdater:(id)a3 fromRowID:(unint64_t)a4 batchSize:(unsigned int)a5 completion:(id)a6;
- (void)_setiWorkPublishingInfoForLocalItem:(id)a3 itemIdentifier:(id)a4 publish:(BOOL)a5 readonly:(BOOL)a6 reply:(id)a7;
- (void)_startDownloadItemsAtURLs:(id)a3 pos:(unint64_t)a4 options:(unint64_t)a5 error:(id)a6 reply:(id)a7;
- (void)_startOperation:(id)a3 toCopyParticipantTokenWithLocalItem:(id)a4 reply:(id)a5;
- (void)_startOperation:(id)a3 toCopySharingAccessTokenWithLocalItem:(id)a4 itemIdentifier:(id)a5 reply:(id)a6;
- (void)_startOperation:(id)a3 toCopySharingInfoWithLocalItem:(id)a4 reply:(id)a5;
- (void)_startOperation:(id)a3 toModifyRecordAccessWithLocalItem:(id)a4 allowAccess:(BOOL)a5 reply:(id)a6;
- (void)_startOperation:(id)a3 toPrepFolderForSharingWithLocalItem:(id)a4 reply:(id)a5;
- (void)_startOperation:(id)a3 toProcessSubitemsWithLocalItem:(id)a4 maxSubsharesFailures:(unint64_t)a5 processType:(unint64_t)a6 reply:(id)a7;
- (void)_t_extractMetadataForAllContainersWithReply:(id)a3;
- (void)_t_getEntitledContainerIDsForBundleID:(id)a3 reply:(id)a4;
- (void)_t_getEntitlementsForBundleID:(id)a3 reply:(id)a4;
- (void)_unregisterPrematurely;
- (void)backupDatabaseWithURLWrapper:(id)a3 reply:(id)a4;
- (void)boostFilePresenterAtURL:(id)a3 reply:(id)a4;
- (void)cancelTreeConsistencyCheckWithReply:(id)a3;
- (void)capabilityWhenTryingToReparentItemAtURL:(id)a3 toNewParent:(id)a4 reply:(id)a5;
- (void)checkIfItemIsShareableWithInode:(unint64_t)a3 reply:(id)a4;
- (void)checkinAskClientIfUsingUbiquity:(BOOL)a3;
- (void)computePurgeableSpaceForAllUrgenciesWithReply:(id)a3;
- (void)copyBulkShareIDsAtURLs:(id)a3 reply:(id)a4;
- (void)copyCollaborationIdentifierForFileObjectID:(id)a3 reply:(id)a4;
- (void)copyCollaborationIdentifierForItemAtURL:(id)a3 reply:(id)a4;
- (void)copyCurrentUserIdentifierWithReply:(id)a3;
- (void)copyCurrentUserNameAndDisplayHandleWithReply:(id)a3;
- (void)corruptDatabase:(id)a3;
- (void)createAccountWithACAccountID:(id)a3 dsid:(id)a4 reply:(id)a5;
- (void)createContainerWithID:(id)a3 ownerName:(id)a4 reply:(id)a5;
- (void)createSharingInfoForItemID:(id)a3 reply:(id)a4;
- (void)createSharingInfoForURL:(id)a3 reply:(id)a4;
- (void)currentNotifRankWithReply:(id)a3;
- (void)deleteAllContentsOfContainerID:(id)a3 onClient:(BOOL)a4 onServer:(BOOL)a5 wait:(BOOL)a6 reply:(id)a7;
- (void)didReceiveHandoffRequestForBundleID:(id)a3 reply:(id)a4;
- (void)dropSpotlightIndexWithReply:(id)a3;
- (void)dumpCoordinationInfoTo:(id)a3 reply:(id)a4;
- (void)dumpDatabaseTo:(id)a3 containerID:(id)a4 personaID:(id)a5 includeAllItems:(BOOL)a6 verbose:(BOOL)a7 reply:(id)a8;
- (void)dumpFPFSMigrationStatusTo:(id)a3 personaID:(id)a4 includeNonMigratedItems:(BOOL)a5 reply:(id)a6;
- (void)enumerateAllFoldersWithSortOrder:(unsigned __int8)a3 offset:(unint64_t)a4 limit:(unint64_t)a5 completion:(id)a6;
- (void)enumerateItemsInFolder:(id)a3 sortOrder:(unsigned __int8)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 completion:(id)a7;
- (void)enumerateWorkingSetChangesFromChangeToken:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)evictItemAtURL:(id)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)evictOldDocumentsWithReply:(id)a3;
- (void)fetchLatestVersionForFileAtURL:(id)a3 reply:(id)a4;
- (void)forceConflictForURL:(id)a3 bookmarkData:(id)a4 forcedEtag:(id)a5 reply:(id)a6;
- (void)forceSyncContainerID:(id)a3 reply:(id)a4;
- (void)forceSyncWithBarrierContainerID:(id)a3 timeout:(unint64_t)a4 reply:(id)a5;
- (void)forceSyncZoneHealthWithBarrierWithTimeout:(unint64_t)a3 reply:(id)a4;
- (void)gatherInformationForPath:(id)a3 reply:(id)a4;
- (void)getApplicationDocumentUsageInfoForBundleID:(id)a3 withReply:(id)a4;
- (void)getApplicationStatus:(id)a3;
- (void)getApplicationStatusForProcess:(id *)a3 reply:(id)a4;
- (void)getAttributeValues:(id)a3 forItemAtURL:(id)a4 reply:(id)a5;
- (void)getBackReferencingContainerIDsForURLs:(id)a3 reply:(id)a4;
- (void)getBookmarkDataForURL:(id)a3 onlyAllowItemKnowByServer:(BOOL)a4 allowAccessByBundleID:(id)a5 reply:(id)a6;
- (void)getContainerForMangledID:(id)a3 personaID:(id)a4 reply:(id)a5;
- (void)getContainerLastServerUpdateWithID:(id)a3 reply:(id)a4;
- (void)getContainerStatusWithID:(id)a3 reply:(id)a4;
- (void)getContainerURLForID:(id)a3 forProcess:(id *)a4 reply:(id)a5;
- (void)getContainerURLForID:(id)a3 recreateDocumentsIfNeeded:(BOOL)a4 reply:(id)a5;
- (void)getContainerURLForID:(id)a3 reply:(id)a4;
- (void)getContainersByID:(id)a3;
- (void)getContainersNeedingUpload:(id)a3;
- (void)getCreatorNameComponentsForURL:(id)a3 reply:(id)a4;
- (void)getEvictableSpaceWithReply:(id)a3;
- (void)getItemUpdateSenderWithReceiver:(id)a3 reply:(id)a4;
- (void)getLastSyncDateWithReply:(id)a3;
- (void)getLocalizedLastSyncWithReply:(id)a3;
- (void)getLoggedInUserPropertyValuesForKeys:(id)a3 reply:(id)a4;
- (void)getNonLocalVersionSenderWithReceiver:(id)a3 documentURL:(id)a4 includeCachedVersions:(BOOL)a5 reply:(id)a6;
- (void)getPausedFilesList:(id)a3 reply:(id)a4;
- (void)getPublishedURLForItemAtURL:(id)a3 forStreaming:(BOOL)a4 requestedTTL:(unint64_t)a5 reply:(id)a6;
- (void)getQueryItemForURL:(id)a3 reply:(id)a4;
- (void)getShareOptionsOfItemIdentifier:(id)a3 reply:(id)a4;
- (void)getSyncState:(unint64_t)a3 reply:(id)a4;
- (void)getTotalApplicationDocumentUsageWithReply:(id)a3;
- (void)getURLForItemIdentifier:(id)a3 reply:(id)a4;
- (void)getiWorkNeedsShareMigrateAtURL:(id)a3 reply:(id)a4;
- (void)getiWorkPublishingBadgingStatusAtURL:(id)a3 reply:(id)a4;
- (void)getiWorkPublishingInfoAtURL:(id)a3 reply:(id)a4;
- (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4;
- (void)hasOptimizeStorageWithReply:(id)a3;
- (void)healthStatusStringForContainer:(id)a3 reply:(id)a4;
- (void)iCloudDesktopSettingsChangedWithAttributes:(id)a3 reply:(id)a4;
- (void)iWorkForceSyncContainerID:(id)a3 ownedByMe:(BOOL)a4 reply:(id)a5;
- (void)invalidateAccountCacheWithReply:(id)a3;
- (void)jetsamCloudDocsAppsWithReply:(id)a3;
- (void)keepDataLocalOnSignOut:(BOOL)a3 reply:(id)a4;
- (void)launchSyncConsistencyChecksWithContainerIDs:(id)a3 reply:(id)a4;
- (void)listFilesIngested:(id)a3 reply:(id)a4;
- (void)logoutAccountWithACAccountID:(id)a3 reply:(id)a4;
- (void)lookupExcludedExtensionsForLogoutWithReply:(id)a3;
- (void)lookupExcludedFilenamesForLogoutWithReply:(id)a3;
- (void)lookupMinFileSizeForThumbnailTransferWithReply:(id)a3;
- (void)moveBRSecurityBookmarkAtURL:(id)a3 toURL:(id)a4 reply:(id)a5;
- (void)overwriteAccessTimeForItemAtURL:(id)a3 atime:(unint64_t)a4 reply:(id)a5;
- (void)pauseSyncConsistencyWithReply:(id)a3;
- (void)pauseSyncForFileAtURL:(id)a3 timeout:(double)a4 options:(int64_t)a5 reply:(id)a6;
- (void)performSelfCheck:(id)a3 reply:(id)a4;
- (void)presyncContainerWithID:(id)a3 reply:(id)a4;
- (void)printStatus:(id)a3 containerID:(id)a4 reply:(id)a5;
- (void)purgeAmount:(int64_t)a3 withUrgency:(int)a4 reply:(id)a5;
- (void)queryEligibleAccountDescriptorsWithReply:(id)a3;
- (void)queryPathsForPersona:(id)a3 reply:(id)a4;
- (void)queryTelemetryEnablementWithReply:(id)a3;
- (void)readerThrottleBackoffForDocumentAtPath:(id)a3 containerID:(id)a4 reply:(id)a5;
- (void)reclaimAmount:(int64_t)a3 withUrgency:(int)a4 reply:(id)a5;
- (void)refreshSharingStateForItemIdentifier:(id)a3 reply:(id)a4;
- (void)registerInitialSyncBarrierForID:(id)a3 reply:(id)a4;
- (void)removeItemFromDisk:(id)a3 reply:(id)a4;
- (void)resetBudgets:(id)a3 reply:(id)a4;
- (void)resolveBookmarkDataToURL:(id)a3 reply:(id)a4;
- (void)resolveConflictWithName:(id)a3 atURL:(id)a4 reply:(id)a5;
- (void)resolveFileObjectIDToURL:(id)a3 reply:(id)a4;
- (void)resolveFileObjectIDsToContentRecordIDsForThumbnails:(id)a3 reply:(id)a4;
- (void)resumeSyncConsistencyWithReply:(id)a3;
- (void)resumeSyncForFileAtURL:(id)a3 dropLocalChanges:(BOOL)a4 reply:(id)a5;
- (void)scheduleDeepScanForContainer:(id)a3 reply:(id)a4;
- (void)setEnhancedDrivePrivacyEnabled:(BOOL)a3 forContainer:(id)a4 onServer:(BOOL)a5 onClient:(BOOL)a6 reply:(id)a7;
- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 reply:(id)a6;
- (void)setStorageOpimizationEnabled:(BOOL)a3 reply:(id)a4;
- (void)setiWorkPublishingInfoAtURL:(id)a3 publish:(BOOL)a4 readonly:(BOOL)a5 reply:(id)a6;
- (void)setupInstanceWithDict:(id)a3 reply:(id)a4;
- (void)simulateHealthIssueWithContainer:(id)a3 status:(id)a4 reply:(id)a5;
- (void)startDownloadItemsAtURLs:(id)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toAcceptShareLink:(id)a4 skipAcceptDialogs:(BOOL)a5 reply:(id)a6;
- (void)startOperation:(id)a3 toCopyAvailableQuotaWithReply:(id)a4;
- (void)startOperation:(id)a3 toCopyDocumentURLForRecordID:(id)a4 syncIfNeeded:(BOOL)a5 reply:(id)a6;
- (void)startOperation:(id)a3 toCopyEtagAtURL:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopyParticipantTokenAtURL:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopyParticipantTokenWithItemID:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopyShareInfoAtURL:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopyShareURLForShare:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopySharingAccessToken:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopySharingAccessTokenOfItemID:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopySharingInfoAtURL:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopySharingInfoWithItemID:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopySharingWebAuthTokenForContainerID:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopyShortTokenAtURL:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopyShortTokenOfItemID:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toDownloadItemAtURL:(id)a4 readingOptions:(unint64_t)a5 wantsCurrentVersion:(BOOL)a6 reply:(id)a7;
- (void)startOperation:(id)a3 toEvictItemAtURL:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toLookupShareParticipants:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toModifyRecordAccessAtURL:(id)a4 allowAccess:(BOOL)a5 reply:(id)a6;
- (void)startOperation:(id)a3 toModifyRecordAccessWithItemID:(id)a4 allowAccess:(BOOL)a5 reply:(id)a6;
- (void)startOperation:(id)a3 toPrepFolderForSharingAt:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toPrepFolderForSharingWithItemID:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toProcessSubitemsAtURL:(id)a4 maxSubsharesFailures:(unint64_t)a5 processType:(unint64_t)a6 reply:(id)a7;
- (void)startOperation:(id)a3 toProcessSubitemsWithItemID:(id)a4 maxSubsharesFailures:(unint64_t)a5 processType:(unint64_t)a6 reply:(id)a7;
- (void)startOperation:(id)a3 toSaveSharingInfo:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toUnshareShare:(id)a4 forceDelete:(BOOL)a5 reply:(id)a6;
- (void)startOperation:(id)a3 toUploadAllFilesInContainer:(id)a4 reply:(id)a5;
- (void)thumbnailChangedForItemAtURL:(id)a3 reply:(id)a4;
- (void)trashItemAtURL:(id)a3 reply:(id)a4;
- (void)updateAccountDisplayName:(id)a3 reply:(id)a4;
- (void)updateContainerMetadataForID:(id)a3;
- (void)updateItemFromURL:(id)a3 reply:(id)a4;
- (void)updatePrivilegesDescriptor;
- (void)userVerifiedTermsWithReply:(id)a3;
- (void)validateCloudDocsSupported:(BOOL)a3 withReply:(id)a4;
- (void)verifyAccountLoaded:(id)a3;
- (void)waitForAccountToLoadWithReply:(id)a3;
- (void)waitForFileSystemChangeProcessingWithReply:(id)a3;
- (void)waitUntilIdle:(id)a3 timeout:(id)a4 reply:(id)a5;
- (void)zoneNameForContainer:(id)a3 reply:(id)a4;
@end

@implementation BRCXPCRegularIPCsClient

- (void)updateContainerMetadataForID:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v34, 0, sizeof(v34));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient updateContainerMetadataForID:]", 1671, v34);
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v34[0];
    qos_class_t v8 = qos_class_self();
    v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    v36 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v37 = 2112;
    v38 = self;
    __int16 v39 = 2112;
    v40 = v9;
    __int16 v41 = 2080;
    v42 = "-[BRCXPCRegularIPCsClient updateContainerMetadataForID:]";
    __int16 v43 = 2112;
    id v44 = v4;
    __int16 v45 = 2112;
    v46 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  if (v4) {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v4];
  }
  else {
    v10 = 0;
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke;
  v32[3] = &unk_1E69944C0;
  v32[4] = self;
  v11 = (BRCXPCRegularIPCsClient *)v4;
  v33 = v11;
  int v12 = _brc_ipc_check_applibrary_write_access(self, 1, v10, v32);

  if (v12)
  {
    if (v4
      && ([(BRCXPCClient *)self entitledAppLibraryIDs],
          v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 containsObject:v11],
          v13,
          (v14 & 1) != 0))
    {
      v15 = [(BRCXPCClient *)self bundleID];
      v16 = [(BRCXPCClient *)self session];
      v17 = [v16 appLibraryByID:v11];

      if (v17)
      {
        v18 = BRCBundleServiceConnection();
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke_297;
        v30[3] = &unk_1E69939E8;
        v19 = v18;
        v31 = v19;
        v20 = [v19 remoteObjectProxyWithErrorHandler:v30];
        v21 = [v17 containerMetadata];
        v22 = [v21 versionNumberForBundleIdentifier:v15];

        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke_2;
        v25[3] = &unk_1E699A688;
        v23 = v19;
        v26 = v23;
        v27 = v17;
        v28 = self;
        id v29 = v15;
        [v20 extractMetadataForContainerID:v11 bundleID:v29 minimumBundleVersion:v22 reply:v25];

        v24 = v31;
      }
      else
      {
        v23 = brc_bread_crumbs();
        v24 = brc_default_log();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
          -[BRCXPCRegularIPCsClient updateContainerMetadataForID:]();
        }
      }
    }
    else
    {
      v15 = brc_bread_crumbs();
      v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v36 = self;
        __int16 v37 = 2112;
        v38 = v11;
        __int16 v39 = 2112;
        v40 = v15;
        _os_log_fault_impl(&dword_1D353B000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ is not owning %@ and updating its metadata%@", buf, 0x20u);
      }
    }
  }
  __brc_leave_section(v34);
}

- (void)checkinAskClientIfUsingUbiquity:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  memset(v21, 0, sizeof(v21));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient checkinAskClientIfUsingUbiquity:]", 1571, v21);
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v21[0];
    qos_class_t v8 = qos_class_self();
    v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = v7;
    __int16 v25 = 2112;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v9;
    __int16 v29 = 2080;
    v30 = "-[BRCXPCRegularIPCsClient checkinAskClientIfUsingUbiquity:]";
    __int16 v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  if (_brc_ipc_check_logged_status(self, 0, &__block_literal_global_291))
  {
    [(BRCXPCClient *)self setIsUsingUbiquity:v3];
    if (v3)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v10 = [(BRCXPCClient *)self entitledAppLibraryIDs];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v18;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
            v15 = [(BRCXPCClient *)self session];
            v16 = [v15 appLibraryByID:v14];

            [v16 addClientUsingUbiquity:self];
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v11);
      }
    }
  }
  __brc_leave_section(v21);
}

- (void)getContainersByID:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainersByID:]", 2080, v24);
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v24[0];
    qos_class_t v8 = qos_class_self();
    v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    v26 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v27 = 2112;
    v28 = self;
    __int16 v29 = 2112;
    v30 = v9;
    __int16 v31 = 2080;
    v32 = "-[BRCXPCRegularIPCsClient getContainersByID:]";
    __int16 v33 = 2112;
    v34 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __45__BRCXPCRegularIPCsClient_getContainersByID___block_invoke;
  v22[3] = &unk_1E69957B0;
  v22[4] = self;
  id v10 = v4;
  id v23 = v10;
  int v11 = _brc_ipc_check_applibrary_proxy(self, 1, v22);

  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    uint64_t v13 = +[BRCDaemonContainerHelper sharedHelper];
    uint64_t v14 = [(BRCXPCClient *)self session];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __45__BRCXPCRegularIPCsClient_getContainersByID___block_invoke_338;
    v19[3] = &unk_1E6994010;
    id v15 = v13;
    id v20 = v15;
    v16 = v12;
    v21 = v16;
    [v14 enumerateAppLibraries:v19];

    brc_bread_crumbs();
    long long v17 = (char *)objc_claimAutoreleasedReturnValue();
    long long v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v26 = self;
      __int16 v27 = 2112;
      v28 = v16;
      __int16 v29 = 2112;
      v30 = 0;
      __int16 v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v10 + 2))(v10, v16, 0);
  }
  __brc_leave_section(v24);
}

- (void)startOperation:(id)a3 toCopyAvailableQuotaWithReply:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopyAvailableQuotaWithReply:]", 4248, v24);
  qos_class_t v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v24[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v10;
    __int16 v27 = 2112;
    v28 = self;
    __int16 v29 = 2112;
    v30 = v12;
    __int16 v31 = 2080;
    v32 = "-[BRCXPCRegularIPCsClient startOperation:toCopyAvailableQuotaWithReply:]";
    __int16 v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v14 = [v13 canFetchUserQuota];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__BRCXPCRegularIPCsClient_startOperation_toCopyAvailableQuotaWithReply___block_invoke;
  v22[3] = &unk_1E69957B0;
  v22[4] = self;
  id v15 = v7;
  id v23 = v15;
  char v16 = _brc_ipc_check_client_privilege(self, 1, v14, (uint64_t)"canFetchUserQuota", v22);

  if (v16)
  {
    long long v17 = [(BRCXPCClient *)self session];
    long long v18 = [[BRCFetchQuotaOperation alloc] initWithSession:v17];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__BRCXPCRegularIPCsClient_startOperation_toCopyAvailableQuotaWithReply___block_invoke_586;
    v20[3] = &unk_1E699ABB0;
    v20[4] = self;
    id v21 = v15;
    [(_BRCOperation *)v18 setFinishBlock:v20];
    long long v19 = objc_msgSend(MEMORY[0x1E4F1A218], "br_quotaUpdateXPC");
    [(_BRCOperation *)v18 setGroup:v19];

    [v17 addMiscOperation:v18];
    [(_BRCOperation *)v18 schedule];
  }
  __brc_leave_section(v24);
}

- (void)getContainerURLForID:(id)a3 recreateDocumentsIfNeeded:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainerURLForID:recreateDocumentsIfNeeded:reply:]", 1594, v26);
  uint64_t v10 = brc_bread_crumbs();
  qos_class_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v26[0];
    qos_class_t v13 = qos_class_self();
    char v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    v28 = (BRCXPCRegularIPCsClient *)v12;
    __int16 v29 = 2112;
    v30 = self;
    __int16 v31 = 2112;
    v32 = v14;
    __int16 v33 = 2080;
    v34 = "-[BRCXPCRegularIPCsClient getContainerURLForID:recreateDocumentsIfNeeded:reply:]";
    __int16 v35 = 2112;
    id v36 = v8;
    __int16 v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  if (v8) {
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v8];
  }
  else {
    id v15 = 0;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __80__BRCXPCRegularIPCsClient_getContainerURLForID_recreateDocumentsIfNeeded_reply___block_invoke;
  uint64_t v24[3] = &unk_1E69957B0;
  v24[4] = self;
  id v16 = v9;
  id v25 = v16;
  int v17 = _brc_ipc_check_applibrary_read_access(self, 1, v15, v24);

  if (v17)
  {
    int active_platform = dyld_get_active_platform();
    if ((active_platform & 0xFFFFFFFB) == 2 || active_platform == 1 || active_platform == 11)
    {
      if (!dyld_program_sdk_at_least())
      {
        if (!v15)
        {
          id v15 = [(BRCXPCClient *)self defaultMangledID];
          if (!v15) {
            goto LABEL_19;
          }
        }
LABEL_17:
        [(BRCXPCClient *)self _setupAppLibraryAndZoneWithID:v15 recreateDocumentsIfNeeded:v6 reply:v16];
        goto LABEL_22;
      }
    }
    else
    {
      syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
    }
    if (v8)
    {
      if (v15) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v19 = [(BRCXPCClient *)self defaultMangledID];

      id v15 = (void *)v19;
      if (v19) {
        goto LABEL_17;
      }
    }
LABEL_19:
    id v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"containerID", 0);
      *(_DWORD *)buf = 138413570;
      v28 = self;
      __int16 v29 = 2112;
      v30 = 0;
      __int16 v31 = 2112;
      v32 = 0;
      __int16 v33 = 2112;
      v34 = 0;
      __int16 v35 = 2112;
      id v36 = v22;
      __int16 v37 = 2112;
      v38 = v20;
      _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);
    }
    id v23 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"containerID", 0);
    (*((void (**)(id, void, void, void, void *))v16 + 2))(v16, 0, 0, 0, v23);

    id v15 = 0;
  }
LABEL_22:

  __brc_leave_section(v26);
}

void __72__BRCXPCRegularIPCsClient_startOperation_toCopyAvailableQuotaWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__BRCXPCRegularIPCsClient_getContainerURLForID_recreateDocumentsIfNeeded_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413570;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    long long v18 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v7, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __45__BRCXPCRegularIPCsClient_getContainersByID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getLocalizedLastSyncWithReply:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v44, 0, sizeof(v44));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getLocalizedLastSyncWithReply:]", 3521, v44);
  v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v44[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    v46 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v47 = 2112;
    v48 = self;
    __int16 v49 = 2112;
    v50 = v9;
    __int16 v51 = 2080;
    v52 = "-[BRCXPCRegularIPCsClient getLocalizedLastSyncWithReply:]";
    __int16 v53 = 2112;
    v54 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __57__BRCXPCRegularIPCsClient_getLocalizedLastSyncWithReply___block_invoke;
  v42[3] = &unk_1E69957B0;
  v42[4] = self;
  id v10 = v4;
  id v43 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 0, v42);

  if (v11)
  {
    id v12 = [(BRCXPCClient *)self session];
    __int16 v13 = [v12 serverState];
    uint64_t v14 = [v13 lastSyncDownDate];

    if (!v14)
    {
      brc_bread_crumbs();
      id v23 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v46 = self;
        __int16 v47 = 2112;
        v48 = 0;
        __int16 v49 = 2112;
        v50 = 0;
        __int16 v51 = 2112;
        v52 = v23;
        _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
      goto LABEL_15;
    }
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    [v15 timeIntervalSinceDate:v14];
    double v17 = v16;
    long long v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v19 = [v18 components:16 fromDate:v14 toDate:v15 options:0];
    id v20 = [MEMORY[0x1E4F1C9C8] date];
    [v18 rangeOfUnit:16 inUnit:512 forDate:v20];
    uint64_t v22 = v21;

    if (v17 < 60.0 || v17 < 3600.0) {
      goto LABEL_11;
    }
    [v14 timeIntervalSinceReferenceDate];
    double v30 = v29;
    __int16 v31 = [v18 startOfDayForDate:v15];
    [v31 timeIntervalSinceReferenceDate];
    BOOL v33 = v30 > v32;

    if (v33)
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v25 setTimeStyle:1];
      [v25 setDateStyle:0];
      v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      __int16 v35 = [v25 stringFromDate:v14];
      uint64_t v36 = _BRLocalizedStringWithFormat();
    }
    else
    {
      if ([v19 day] <= 1)
      {
LABEL_11:
        id v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        _BRLocalizedStringWithFormat();
        uint64_t v26 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
LABEL_12:

        brc_bread_crumbs();
        __int16 v27 = (char *)objc_claimAutoreleasedReturnValue();
        v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          v46 = self;
          __int16 v47 = 2112;
          v48 = v26;
          __int16 v49 = 2112;
          v50 = 0;
          __int16 v51 = 2112;
          v52 = v27;
          _os_log_impl(&dword_1D353B000, v28, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }

        (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v10 + 2))(v10, v26, 0);
LABEL_15:

        goto LABEL_16;
      }
      if ([v19 day] < v22)
      {
        id v25 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        __int16 v37 = (void *)MEMORY[0x1E4F28C10];
        v38 = [MEMORY[0x1E4F1CA20] currentLocale];
        v34 = [v37 dateFormatFromTemplate:@"EEEE" options:0 locale:v38];

        [v25 setDateFormat:v34];
        __int16 v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v39 = [v25 stringFromDate:v14];
        uint64_t v40 = _BRLocalizedStringWithFormat();
        __int16 v41 = (void *)v39;
        uint64_t v26 = (BRCXPCRegularIPCsClient *)v40;

        goto LABEL_20;
      }
      id v25 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v25 setTimeStyle:0];
      [v25 setDateStyle:2];
      v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      __int16 v35 = [v25 stringFromDate:v14];
      uint64_t v36 = _BRLocalizedStringWithFormat();
    }
    uint64_t v26 = (BRCXPCRegularIPCsClient *)v36;
LABEL_20:

    goto LABEL_12;
  }
LABEL_16:
  __brc_leave_section(v44);
}

- (BOOL)_enumerateFoldersWithParent:(id)a3 depth:(unint64_t)a4 session:(id)a5 db:(id)a6 handler:(id)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (unsigned int (**)(id, void *))a7;
  if (brc_task_tracker_is_cancelled(self->super._tracker))
  {
    LOBYTE(v16) = 0;
  }
  else
  {
    double v17 = +[BRCUserDefaults defaultsForMangledID:0];
    unint64_t v18 = [v17 maxFolderEnumerationDepth];

    if (v18 >= a4)
    {
      if (v12)
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v19 = [v12 appLibrary];
        id v20 = [v12 itemGlobalID];
        uint64_t v21 = [v19 enumerateUserVisibleChildrenDirectoriesOfItemGlobalID:v20 db:v14];

        id obj = v21;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v47 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          unint64_t v34 = a4 + 1;
          uint64_t v35 = *(void *)v37;
          do
          {
            uint64_t v24 = 0;
            do
            {
              if (*(void *)v37 != v35) {
                objc_enumerationMutation(obj);
              }
              id v25 = *(void **)(*((void *)&v36 + 1) + 8 * v24);
              uint64_t v26 = (void *)MEMORY[0x1D9438760]();
              if (([v25 isDirectory] & 1) == 0)
              {
                double v32 = brc_bread_crumbs();
                v28 = brc_default_log();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v46 = v32;
                  _os_log_fault_impl(&dword_1D353B000, v28, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: directoryItem.isDirectory%@", buf, 0xCu);
                }
              }
              __int16 v27 = +[BRCNotification notificationFromItem:v25];
              if (!v15[2](v15, v27))
              {

                LOBYTE(v16) = 0;
                goto LABEL_24;
              }
              BOOL v16 = [(BRCXPCRegularIPCsClient *)self _enumerateFoldersWithParent:v25 depth:v34 session:v13 db:v14 handler:v15];

              if (!v16) {
                goto LABEL_24;
              }
              ++v24;
            }
            while (v23 != v24);
            uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
            uint64_t v23 = v29;
            LOBYTE(v16) = 1;
          }
          while (v29);
        }
        else
        {
          LOBYTE(v16) = 1;
        }
LABEL_24:
        double v30 = (unsigned int (**)(id, void *))obj;
      }
      else
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __97__BRCXPCRegularIPCsClient_LegacyAdditions___enumerateFoldersWithParent_depth_session_db_handler___block_invoke;
        v40[3] = &unk_1E6999660;
        id v43 = v15;
        unint64_t v44 = a4;
        v40[4] = self;
        id v41 = v13;
        id v42 = v14;
        [v41 enumerateContainersWithDB:v42 handler:v40];

        LOBYTE(v16) = 1;
        double v30 = v43;
      }
    }
    else
    {
      LOBYTE(v16) = 1;
    }
  }

  return v16;
}

void __97__BRCXPCRegularIPCsClient_LegacyAdditions___enumerateFoldersWithParent_depth_session_db_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  if (v5) {
    [*(id *)(a1 + 32) _enumerateFoldersWithParent:v5 depth:*(void *)(a1 + 64) + 1 session:*(void *)(a1 + 40) db:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
  }
}

- (void)enumerateAllFoldersWithSortOrder:(unsigned __int8)a3 offset:(unint64_t)a4 limit:(unint64_t)a5 completion:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  memset(v35, 0, sizeof(v35));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) enumerateAllFoldersWithSortOrder:offset:limit:completion:]", 327, v35);
  id v10 = brc_bread_crumbs();
  int v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v35[0];
    qos_class_t v13 = qos_class_self();
    id v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    unint64_t v37 = v12;
    __int16 v38 = 2112;
    unint64_t v39 = (unint64_t)self;
    __int16 v40 = 2112;
    id v41 = v14;
    __int16 v42 = 2080;
    id v43 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) enumerateAllFoldersWithSortOrder:offset:limit:completion:]";
    __int16 v44 = 2112;
    __int16 v45 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __101__BRCXPCRegularIPCsClient_LegacyAdditions__enumerateAllFoldersWithSortOrder_offset_limit_completion___block_invoke;
  v33[3] = &unk_1E69957B0;
  v33[4] = self;
  id v15 = v9;
  id v34 = v15;
  int v16 = _brc_ipc_check_applibrary_proxy(self, 1, v33);

  if (v16)
  {
    double v17 = brc_bread_crumbs();
    unint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      unint64_t v37 = a4;
      __int16 v38 = 2048;
      unint64_t v39 = a5;
      __int16 v40 = 2112;
      id v41 = v17;
      _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] enumerating all folders offset:%lld limit:%lld%@", buf, 0x20u);
    }

    uint64_t v19 = [(BRCXPCClient *)self session];
    id v20 = [v19 readOnlyDB];
    tracker = self->super._tracker;
    uint64_t v22 = [v20 serialQueue];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __101__BRCXPCRegularIPCsClient_LegacyAdditions__enumerateAllFoldersWithSortOrder_offset_limit_completion___block_invoke_21;
    v27[3] = &unk_1E69996B0;
    v27[4] = self;
    id v23 = v19;
    id v28 = v23;
    id v24 = v20;
    id v29 = v24;
    unint64_t v31 = a4;
    unint64_t v32 = a5;
    id v30 = v15;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __101__BRCXPCRegularIPCsClient_LegacyAdditions__enumerateAllFoldersWithSortOrder_offset_limit_completion___block_invoke_24;
    v25[3] = &unk_1E6994600;
    void v25[4] = self;
    id v26 = v30;
    brc_task_tracker_async_with_logs(tracker, v22, v27, v25);
  }
  __brc_leave_section(v35);
}

void __101__BRCXPCRegularIPCsClient_LegacyAdditions__enumerateAllFoldersWithSortOrder_offset_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 1024;
    int v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    int v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %ull, %@)%@", (uint8_t *)&v7, 0x30u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __101__BRCXPCRegularIPCsClient_LegacyAdditions__enumerateAllFoldersWithSortOrder_offset_limit_completion___block_invoke_21(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__BRCXPCRegularIPCsClient_LegacyAdditions__enumerateAllFoldersWithSortOrder_offset_limit_completion___block_invoke_2;
  v11[3] = &unk_1E6999688;
  __int16 v13 = &v15;
  long long v14 = *(_OWORD *)(a1 + 64);
  id v6 = v2;
  id v12 = v6;
  [v3 _enumerateFoldersWithParent:0 depth:0 session:v4 db:v5 handler:v11];
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = v16[3];
    *(_DWORD *)buf = 138413314;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2048;
    uint64_t v24 = v10;
    __int16 v25 = 2112;
    uint64_t v26 = 0;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %llu, %@)%@", buf, 0x34u);
  }

  (*(void (**)(void, id, uint64_t, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v6, v16[3], 0);
  _Block_object_dispose(&v15, 8);
}

uint64_t __101__BRCXPCRegularIPCsClient_LegacyAdditions__enumerateAllFoldersWithSortOrder_offset_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(a1 + 48);
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v5 < v4) {
    goto LABEL_5;
  }
  if (v5 <= *(void *)(a1 + 56) + v4)
  {
    [*(id *)(a1 + 32) addObject:v3];
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
LABEL_5:
    uint64_t v6 = 1;
    goto LABEL_6;
  }
  uint64_t v6 = 0;
LABEL_6:

  return v6;
}

void __101__BRCXPCRegularIPCsClient_LegacyAdditions__enumerateAllFoldersWithSortOrder_offset_limit_completion___block_invoke_24(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413314;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %llu, %@)%@", (uint8_t *)&v8, 0x34u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0, 0, v7);
}

- (void)startDownloadItemsAtURLs:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  memset(v38, 0, sizeof(v38));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startDownloadItemsAtURLs:options:reply:]", 365, v38);
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v38[0];
    qos_class_t v13 = qos_class_self();
    __int16 v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v40 = v12;
    __int16 v41 = 2112;
    __int16 v42 = self;
    __int16 v43 = 2112;
    id v44 = v14;
    __int16 v45 = 2080;
    uint64_t v46 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startDownloadItemsAtURLs:options:reply:]";
    __int16 v47 = 2112;
    *(void *)uint64_t v48 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __83__BRCXPCRegularIPCsClient_LegacyAdditions__startDownloadItemsAtURLs_options_reply___block_invoke;
  v36[3] = &unk_1E69957B0;
  v36[4] = self;
  id v15 = v9;
  id v37 = v15;
  int v16 = _brc_ipc_check_logged_status(self, 1, v36);

  if (v16)
  {
    memset(v35, 0, sizeof(v35));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startDownloadItemsAtURLs:options:reply:]", 367, v35);
    uint64_t v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      unint64_t v28 = a4;
      uint64_t v19 = v35[0];
      qos_class_t v20 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v20, (uint64_t)&brc_qos_entries, 0);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      int v22 = [v8 count];
      uint64_t v23 = [v8 count];
      uint64_t v24 = "s";
      *(_DWORD *)buf = 134219522;
      uint64_t v40 = v19;
      __int16 v41 = 2112;
      if (v23 == 1) {
        uint64_t v24 = "";
      }
      __int16 v42 = self;
      __int16 v43 = 2112;
      id v44 = v21;
      __int16 v45 = 2080;
      uint64_t v46 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startDownloadItemsAtURLs:options:reply:]";
      __int16 v47 = 1024;
      *(_DWORD *)uint64_t v48 = v22;
      *(_WORD *)&v48[4] = 2080;
      *(void *)&v48[6] = v24;
      __int16 v49 = 2112;
      v50 = v17;
      _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s downloading %u URL%s%@", buf, 0x44u);

      a4 = v28;
    }

    tracker = self->super._tracker;
    uint64_t v26 = [(BRCXPCClient *)self session];
    __int16 v27 = [v26 clientTruthWorkloop];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __83__BRCXPCRegularIPCsClient_LegacyAdditions__startDownloadItemsAtURLs_options_reply___block_invoke_27;
    v31[3] = &unk_1E6995C20;
    v31[4] = self;
    id v32 = v8;
    unint64_t v34 = a4;
    id v33 = v15;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __83__BRCXPCRegularIPCsClient_LegacyAdditions__startDownloadItemsAtURLs_options_reply___block_invoke_2;
    v29[3] = &unk_1E6994600;
    v29[4] = self;
    id v30 = v33;
    brc_task_tracker_async_with_logs(tracker, v27, v31, v29);

    __brc_leave_section(v35);
  }
  __brc_leave_section(v38);
}

void __83__BRCXPCRegularIPCsClient_LegacyAdditions__startDownloadItemsAtURLs_options_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  unint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __83__BRCXPCRegularIPCsClient_LegacyAdditions__startDownloadItemsAtURLs_options_reply___block_invoke_27(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDownloadItemsAtURLs:*(void *)(a1 + 40) pos:0 options:*(void *)(a1 + 56) error:0 reply:*(void *)(a1 + 48)];
}

void __83__BRCXPCRegularIPCsClient_LegacyAdditions__startDownloadItemsAtURLs_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138412802;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

- (void)_startDownloadItemsAtURLs:(id)a3 pos:(unint64_t)a4 options:(unint64_t)a5 error:(id)a6 reply:(id)a7
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  unint64_t v31 = (void (**)(id, void *))a7;
  unint64_t v29 = a5;
  uint64_t v32 = BRCConvertDownloadOptionsToInternal(a5);
  uint64_t v46 = 0;
  __int16 v47 = &v46;
  uint64_t v48 = 0x3032000000;
  __int16 v49 = __Block_byref_object_copy__42;
  v50 = __Block_byref_object_dispose__42;
  id v14 = v13;
  uint64_t v15 = 0;
  id v30 = v14;
  id v51 = v14;
  do
  {
    if (a4 + v15 >= objc_msgSend(v12, "count", v29)) {
      break;
    }
    int v16 = (void *)MEMORY[0x1D9438760]();
    uint64_t v17 = self;
    objc_sync_enter(v17);
    char v18 = *((unsigned char *)&v17->super + 32);
    objc_sync_exit(v17);

    if ((v18 & 1) == 0)
    {
      uint64_t v19 = [v12 objectAtIndexedSubscript:a4 + v15];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __94__BRCXPCRegularIPCsClient_LegacyAdditions___startDownloadItemsAtURLs_pos_options_error_reply___block_invoke;
      v41[3] = &unk_1E69996D8;
      id v20 = v19;
      id v42 = v20;
      __int16 v43 = v17;
      id v44 = &v46;
      uint64_t v45 = v32;
      [(BRCXPCClient *)v17 accessLogicalOrPhysicalURL:v20 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v41];
    }
    if (v18) {
      goto LABEL_12;
    }
    ++v15;
  }
  while (v15 != 10);
  uint64_t v21 = a4 + v15;
  if (a4 + v15 >= [v12 count])
  {
    __int16 v25 = brc_bread_crumbs();
    uint64_t v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      __int16 v27 = objc_msgSend((id)v47[5], "brc_wrappedError");
      *(_DWORD *)buf = 138412802;
      __int16 v53 = self;
      __int16 v54 = 2112;
      uint64_t v55 = v27;
      __int16 v56 = 2112;
      v57 = v25;
      _os_log_impl(&dword_1D353B000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    unint64_t v28 = objc_msgSend((id)v47[5], "brc_wrappedError");
    v31[2](v31, v28);
  }
  else
  {
    tracker = self->super._tracker;
    uint64_t v23 = [(BRCXPCClient *)self session];
    uint64_t v24 = [v23 clientTruthWorkloop];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __94__BRCXPCRegularIPCsClient_LegacyAdditions___startDownloadItemsAtURLs_pos_options_error_reply___block_invoke_29;
    uint64_t v35[3] = &unk_1E6999700;
    v35[4] = self;
    uint64_t v39 = v21;
    unint64_t v40 = v29;
    id v36 = v12;
    __int16 v38 = &v46;
    id v37 = v31;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __94__BRCXPCRegularIPCsClient_LegacyAdditions___startDownloadItemsAtURLs_pos_options_error_reply___block_invoke_2;
    v33[3] = &unk_1E6994600;
    v33[4] = self;
    unint64_t v34 = v37;
    brc_task_tracker_async_with_logs(tracker, v24, v35, v33);
  }
LABEL_12:
  _Block_object_dispose(&v46, 8);
}

void __94__BRCXPCRegularIPCsClient_LegacyAdditions___startDownloadItemsAtURLs_pos_options_error_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) _startDownloadItemsAtURLs:pos:options:error:reply:]_block_invoke", 403, v25);
  int v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = v25[0];
    int v22 = [*(id *)(a1 + 32) path];
    *(_DWORD *)buf = 134218754;
    uint64_t v27 = v21;
    __int16 v28 = 2112;
    unint64_t v29 = v22;
    __int16 v30 = 2112;
    id v31 = v5;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx downloading '%@'\n     lookup: %@%@", buf, 0x2Au);
  }
  if (v5)
  {
    uint64_t v9 = [v5 faultedLocalItem];
    if (v9 || ([v5 byIDLocalItem], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ([v9 isShareAcceptationFault])
      {
        __int16 v10 = (void *)MEMORY[0x1E4F28C58];
        __int16 v11 = [*(id *)(a1 + 32) path];
        uint64_t v12 = objc_msgSend(v10, "brc_errorNoDocument:underlyingPOSIXError:", v11, 16);

        uint64_t v6 = v12;
      }
      else
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v14 = *(void *)(a1 + 56);
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
        id v24 = *(id *)(v15 + 40);
        [v9 startDownloadInTask:v13 options:v14 etagIfLoser:0 stageFileName:0 error:&v24];
        id v16 = v24;
        __int16 v11 = *(NSObject **)(v15 + 40);
        *(void *)(v15 + 40) = v16;
      }
    }
    else
    {
      uint64_t v17 = [v5 byPathRelpath];
      if ([v17 exists])
      {
        char v18 = [v5 byPathRelpath];
        char v19 = [v18 isFault];

        if ((v19 & 1) == 0)
        {
          uint64_t v9 = brc_bread_crumbs();
          __int16 v11 = brc_default_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            id v20 = [v5 byPathRelpath];
            __94__BRCXPCRegularIPCsClient_LegacyAdditions___startDownloadItemsAtURLs_pos_options_error_reply___block_invoke_cold_1(v20, (uint64_t)v9, buf, v11);
          }
          goto LABEL_9;
        }
      }
      else
      {
      }
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = [*(id *)(a1 + 32) path];
      objc_msgSend(v23, "brc_errorNoDocument:underlyingPOSIXError:", v9, 2);
      v6 = __int16 v11 = v6;
    }
LABEL_9:
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
  }
  __brc_leave_section(v25);
}

uint64_t __94__BRCXPCRegularIPCsClient_LegacyAdditions___startDownloadItemsAtURLs_pos_options_error_reply___block_invoke_29(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDownloadItemsAtURLs:*(void *)(a1 + 40) pos:*(void *)(a1 + 64) options:*(void *)(a1 + 72) error:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) reply:*(void *)(a1 + 48)];
}

void __94__BRCXPCRegularIPCsClient_LegacyAdditions___startDownloadItemsAtURLs_pos_options_error_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138412802;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

- (id)_sharingOperationItemFromLookup:(id)a3 url:(id)a4 allowDirectory:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  __int16 v11 = [v9 byIDLocalItem];
  if (v11 || ([v9 faultedLocalItem], (__int16 v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ([v11 isDocument] & 1) != 0 || v7 && (objc_msgSend(v11, "isDirectory"))
    {
      if ([v11 isKnownByServer] & 1) != 0 || (objc_msgSend(v11, "isShareAcceptationFault"))
      {
        if (![v11 isDirectory]) {
          goto LABEL_17;
        }
        __int16 v12 = [v11 clientZone];
        uint64_t v13 = [v11 itemID];
        uint64_t v14 = [v12 serverRankByItemID:v13];

        if (v14) {
          goto LABEL_17;
        }
      }
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      id v16 = [v10 path];
      uint64_t v17 = objc_msgSend(v15, "brc_errorNotInCloud:", v16);
    }
    else
    {
      char v18 = (void *)MEMORY[0x1E4F28C58];
      id v16 = [v10 path];
      uint64_t v17 = objc_msgSend(v18, "brc_errorNoDocument:underlyingPOSIXError:", v16, 2);
    }
    char v19 = (void *)v17;
  }
  else
  {
    id v20 = (void *)MEMORY[0x1E4F28C58];
    id v16 = [v10 path];
    char v19 = objc_msgSend(v20, "brc_errorNoDocument:underlyingPOSIXError:", v16, 2);
    __int16 v11 = 0;
  }

  if (!v19)
  {
LABEL_17:
    a6 = [v11 asShareableItem];
    char v19 = 0;
    goto LABEL_18;
  }
  if (a6)
  {
    objc_storeStrong(a6, v19);
    a6 = 0;
  }
LABEL_18:

  return a6;
}

- (void)startOperation:(id)a3 toCopyShareInfoAtURL:(id)a4 reply:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v38, 0, sizeof(v38));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyShareInfoAtURL:reply:]", 471, v38);
  __int16 v11 = brc_bread_crumbs();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v38[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v40 = v13;
    __int16 v41 = 2112;
    id v42 = self;
    __int16 v43 = 2112;
    id v44 = v15;
    __int16 v45 = 2080;
    uint64_t v46 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyShareInfoAtURL:reply:]";
    __int16 v47 = 2112;
    uint64_t v48 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingPrivateInterfaceEntitled];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __86__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyShareInfoAtURL_reply___block_invoke;
  v36[3] = &unk_1E69957B0;
  v36[4] = self;
  id v18 = v10;
  id v37 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingPrivateInterfaceEntitled", v36);

  if (v19)
  {
    brc_bread_crumbs();
    id v20 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [v9 path];
      uint64_t v29 = [v28 UTF8String];
      *(_DWORD *)buf = 136315394;
      uint64_t v40 = v29;
      __int16 v41 = 2112;
      id v42 = v20;
      _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Copying share info at %s%@", buf, 0x16u);
    }
    memset(v35, 0, sizeof(v35));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyShareInfoAtURL:reply:]", 500, v35);
    int v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v30 = v8;
      uint64_t v24 = v35[0];
      qos_class_t v25 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v25, (uint64_t)&brc_qos_entries, 0);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [v9 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v40 = v24;
      __int16 v41 = 2112;
      id v42 = self;
      __int16 v43 = 2112;
      id v44 = v26;
      __int16 v45 = 2080;
      uint64_t v46 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyShareInfoAtURL:reply:]";
      __int16 v47 = 2112;
      uint64_t v48 = v27;
      __int16 v49 = 2112;
      v50 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      id v8 = v30;
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __86__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyShareInfoAtURL_reply___block_invoke_31;
    v31[3] = &unk_1E6999750;
    v31[4] = self;
    id v34 = v18;
    id v32 = v9;
    id v33 = v8;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v32 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v31];

    __brc_leave_section(v35);
  }
  __brc_leave_section(v38);
}

void __86__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyShareInfoAtURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyShareInfoAtURL_reply___block_invoke_31(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413314;
      uint64_t v32 = v8;
      __int16 v33 = 2112;
      uint64_t v34 = 0;
      __int16 v35 = 2112;
      uint64_t v36 = 0;
      __int16 v37 = 2112;
      id v38 = v5;
      __int16 v39 = 2112;
      uint64_t v40 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v29 = 0;
    __int16 v9 = [*(id *)(a1 + 32) _sharingOperationItemFromLookup:a2 url:*(void *)(a1 + 40) allowDirectory:0 error:&v29];
    if (v9)
    {
      uint64_t v10 = [BRCSharingCopyShortTokenOperation alloc];
      __int16 v11 = [v9 asDocument];
      uint64_t v12 = [*(id *)(a1 + 32) session];
      __int16 v13 = [(BRCSharingCopyShortTokenOperation *)v10 initWithItem:v11 sessionContext:v12];

      id v14 = [BRCSharingCopyParticipantTokenOperation alloc];
      __int16 v15 = [v9 asDocument];
      id v16 = [*(id *)(a1 + 32) session];
      uint64_t v17 = [(BRCSharingCopyParticipantTokenOperation *)v14 initWithItem:v15 sessionContext:v16];

      v30[0] = v13;
      v30[1] = v17;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
      char v19 = [BRCAggregateOperation alloc];
      id v20 = [v9 serverZone];
      uint64_t v21 = [v20 metadataSyncContext];
      int v22 = [*(id *)(a1 + 32) session];
      uint64_t v23 = [(BRCAggregateOperation *)v19 initWithSyncContext:v21 sessionContext:v22 subOperations:v18];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __86__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyShareInfoAtURL_reply___block_invoke_36;
      v27[3] = &unk_1E6999728;
      v27[4] = *(void *)(a1 + 32);
      id v28 = *(id *)(a1 + 56);
      [(BRCAggregateOperation *)v23 setWrapperOperationCompletionHandler:v27];
      [*(id *)(a1 + 32) _startSharingOperationAfterAcceptation:v23 client:*(void *)(a1 + 48) item:v9];
    }
    else
    {
      uint64_t v24 = brc_bread_crumbs();
      qos_class_t v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138413314;
        uint64_t v32 = v26;
        __int16 v33 = 2112;
        uint64_t v34 = 0;
        __int16 v35 = 2112;
        uint64_t v36 = 0;
        __int16 v37 = 2112;
        id v38 = v29;
        __int16 v39 = 2112;
        uint64_t v40 = v24;
        _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __86__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyShareInfoAtURL_reply___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 objectForKeyedSubscript:&unk_1F2B27120];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"participantKey"];
  __int16 v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = [v5 objectForKeyedSubscript:&unk_1F2B27138];
    int v15 = 138413314;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v15, 0x34u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = [v5 objectForKeyedSubscript:&unk_1F2B27138];
  (*(void (**)(uint64_t, void *, void *, id))(v13 + 16))(v13, v14, v8, v6);
}

- (void)startOperation:(id)a3 toCopyShortTokenAtURL:(id)a4 reply:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v38, 0, sizeof(v38));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyShortTokenAtURL:reply:]", 507, v38);
  uint64_t v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v38[0];
    qos_class_t v14 = qos_class_self();
    int v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v40 = v13;
    __int16 v41 = 2112;
    id v42 = self;
    __int16 v43 = 2112;
    id v44 = v15;
    __int16 v45 = 2080;
    uint64_t v46 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyShortTokenAtURL:reply:]";
    __int16 v47 = 2112;
    uint64_t v48 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingPrivateInterfaceEntitled];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __87__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyShortTokenAtURL_reply___block_invoke;
  v36[3] = &unk_1E69957B0;
  v36[4] = self;
  id v18 = v10;
  id v37 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingPrivateInterfaceEntitled", v36);

  if (v19)
  {
    brc_bread_crumbs();
    id v20 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [v9 path];
      uint64_t v29 = [v28 UTF8String];
      *(_DWORD *)buf = 136315394;
      uint64_t v40 = v29;
      __int16 v41 = 2112;
      id v42 = v20;
      _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Copying short token at %s%@", buf, 0x16u);
    }
    memset(v35, 0, sizeof(v35));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyShortTokenAtURL:reply:]", 526, v35);
    id v22 = brc_bread_crumbs();
    __int16 v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v30 = v8;
      uint64_t v24 = v35[0];
      qos_class_t v25 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v25, (uint64_t)&brc_qos_entries, 0);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [v9 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v40 = v24;
      __int16 v41 = 2112;
      id v42 = self;
      __int16 v43 = 2112;
      id v44 = v26;
      __int16 v45 = 2080;
      uint64_t v46 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyShortTokenAtURL:reply:]";
      __int16 v47 = 2112;
      uint64_t v48 = v27;
      __int16 v49 = 2112;
      v50 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      id v8 = v30;
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __87__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyShortTokenAtURL_reply___block_invoke_44;
    v31[3] = &unk_1E6999750;
    v31[4] = self;
    id v34 = v18;
    id v32 = v9;
    id v33 = v8;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v32 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v31];

    __brc_leave_section(v35);
  }
  __brc_leave_section(v38);
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyShortTokenAtURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyShortTokenAtURL_reply___block_invoke_44(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      uint64_t v21 = v8;
      __int16 v22 = 2112;
      uint64_t v23 = 0;
      __int16 v24 = 2112;
      id v25 = v5;
      __int16 v26 = 2112;
      uint64_t v27 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v19 = 0;
    __int16 v9 = [*(id *)(a1 + 32) _sharingOperationItemFromLookup:a2 url:*(void *)(a1 + 40) allowDirectory:0 error:&v19];
    if (v9)
    {
      uint64_t v10 = [BRCSharingCopyShortTokenOperation alloc];
      __int16 v11 = [v9 asDocument];
      id v12 = [*(id *)(a1 + 32) session];
      __int16 v13 = [(BRCSharingCopyShortTokenOperation *)v10 initWithItem:v11 sessionContext:v12];

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __87__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyShortTokenAtURL_reply___block_invoke_45;
      v17[3] = &unk_1E6996730;
      v17[4] = *(void *)(a1 + 32);
      id v18 = *(id *)(a1 + 56);
      [(_BRCOperation *)v13 setFinishBlock:v17];
      [*(id *)(a1 + 32) _startSharingOperationAfterAcceptation:v13 client:*(void *)(a1 + 48) item:v9];
    }
    else
    {
      qos_class_t v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138413058;
        uint64_t v21 = v16;
        __int16 v22 = 2112;
        uint64_t v23 = 0;
        __int16 v24 = 2112;
        id v25 = v19;
        __int16 v26 = 2112;
        uint64_t v27 = v14;
        _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyShortTokenAtURL_reply___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
    int v13 = 138413058;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
}

- (void)startOperation:(id)a3 toCopyEtagAtURL:(id)a4 reply:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v37, 0, sizeof(v37));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyEtagAtURL:reply:]", 533, v37);
  uint64_t v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v37[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v39 = v13;
    __int16 v40 = 2112;
    __int16 v41 = self;
    __int16 v42 = 2112;
    id v43 = v15;
    __int16 v44 = 2080;
    __int16 v45 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyEtagAtURL:reply:]";
    __int16 v46 = 2112;
    __int16 v47 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingPrivateInterfaceEntitled];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __81__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyEtagAtURL_reply___block_invoke;
  uint64_t v35[3] = &unk_1E69957B0;
  v35[4] = self;
  id v18 = v10;
  id v36 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingPrivateInterfaceEntitled", v35);

  if (v19)
  {
    brc_bread_crumbs();
    id v20 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [v9 path];
      uint64_t v29 = [v28 UTF8String];
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = v29;
      __int16 v40 = 2112;
      __int16 v41 = v20;
      _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Copying etag at %s%@", buf, 0x16u);
    }
    memset(v34, 0, sizeof(v34));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyEtagAtURL:reply:]", 566, v34);
    __int16 v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v30 = v8;
      uint64_t v24 = v34[0];
      qos_class_t v25 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v25, (uint64_t)&brc_qos_entries, 0);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [v9 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v39 = v24;
      __int16 v40 = 2112;
      __int16 v41 = self;
      __int16 v42 = 2112;
      id v43 = v26;
      __int16 v44 = 2080;
      __int16 v45 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyEtagAtURL:reply:]";
      __int16 v46 = 2112;
      __int16 v47 = v27;
      __int16 v48 = 2112;
      __int16 v49 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      id v8 = v30;
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __81__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyEtagAtURL_reply___block_invoke_47;
    v31[3] = &unk_1E69997C8;
    v31[4] = self;
    id v33 = v18;
    id v32 = v9;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v32 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v31];

    __brc_leave_section(v34);
  }
  __brc_leave_section(v37);
}

void __81__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyEtagAtURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyEtagAtURL_reply___block_invoke_47(id *a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = a1[4];
      *(_DWORD *)buf = 138413058;
      id v36 = v9;
      __int16 v37 = 2112;
      uint64_t v38 = 0;
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      __int16 v42 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id v34 = 0;
    uint64_t v10 = [a1[4] _sharingOperationItemFromLookup:v5 url:a1[5] allowDirectory:0 error:&v34];
    __int16 v11 = v10;
    if (v10)
    {
      id v12 = [v10 clientZone];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __81__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyEtagAtURL_reply___block_invoke_48;
      v27[3] = &unk_1E6999778;
      id v28 = v5;
      id v13 = v12;
      id v29 = v13;
      id v14 = v11;
      id v15 = a1[4];
      id v30 = v14;
      id v31 = v15;
      id v33 = a1[6];
      id v32 = a1[5];
      id v16 = (void (**)(void))MEMORY[0x1D94389C0](v27);
      if ([v14 isShareAcceptationFault])
      {
        uint64_t v25 = MEMORY[0x1E4F143A8];
        id v26 = v16;
        char v17 = objc_msgSend(v14, "itemID", v25, 3221225472, __81__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyEtagAtURL_reply___block_invoke_49, &unk_1E69997A0);
        id v18 = [v14 st];
        uint64_t v19 = [v18 type];
        id v20 = [v14 serverZone];
        uint64_t v21 = [v17 structureRecordIDForItemType:v19 zone:v20 aliasTargetZoneIsShared:1];
        [v13 performBlock:&v25 whenLocatingCompletesForItemWithRecordID:v21];
      }
      else
      {
        v16[2](v16);
      }
    }
    else
    {
      __int16 v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = a1[4];
        *(_DWORD *)buf = 138413058;
        id v36 = v24;
        __int16 v37 = 2112;
        uint64_t v38 = 0;
        __int16 v39 = 2112;
        id v40 = v34;
        __int16 v41 = 2112;
        __int16 v42 = v22;
        _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }

      (*((void (**)(void))a1[6] + 2))();
    }
  }
}

void __81__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyEtagAtURL_reply___block_invoke_48(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 clientDB];
  [v3 assertOnQueue];

  uint64_t v4 = [*(id *)(a1 + 40) serverZone];
  id v5 = [*(id *)(a1 + 48) itemID];
  id v6 = [v4 itemByItemID:v5];

  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = [v6 latestVersion];
      __int16 v11 = [v10 ckInfo];
      id v12 = [v11 etag];
      int v25 = 138413058;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      id v28 = v12;
      __int16 v29 = 2112;
      id v30 = 0;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v25, 0x2Au);
    }
    uint64_t v13 = *(void *)(a1 + 72);
    id v14 = [v6 latestVersion];
    id v15 = [v14 ckInfo];
    id v16 = [v15 etag];
    (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v16, 0);
  }
  else
  {
    char v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *(void *)(a1 + 56);
      uint64_t v21 = [*(id *)(a1 + 64) path];
      __int16 v22 = objc_msgSend(v19, "brc_errorNoDocument:underlyingPOSIXError:", v21, 2);
      int v25 = 138413058;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      id v28 = 0;
      __int16 v29 = 2112;
      id v30 = v22;
      __int16 v31 = 2112;
      id v32 = v17;
      _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v25, 0x2Au);
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *(void *)(a1 + 72);
    id v14 = [*(id *)(a1 + 64) path];
    id v15 = objc_msgSend(v23, "brc_errorNoDocument:underlyingPOSIXError:", v14, 2);
    (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v15);
  }
}

uint64_t __81__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyEtagAtURL_reply___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startOperation:(id)a3 toCopySharingAccessToken:(id)a4 reply:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopySharingAccessToken:reply:]", 584, v24);
  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v24[0];
    qos_class_t v14 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = [v9 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    id v28 = self;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2080;
    id v32 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopySharingAccessToken:reply:]";
    __int16 v33 = 2112;
    id v34 = v16;
    __int16 v35 = 2112;
    id v36 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopySharingAccessToken_reply___block_invoke;
  v20[3] = &unk_1E6999750;
  v20[4] = self;
  id v17 = v10;
  id v23 = v17;
  id v18 = v9;
  id v21 = v18;
  id v19 = v8;
  id v22 = v19;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v18 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v20];

  __brc_leave_section(v24);
}

void __90__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopySharingAccessToken_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = objc_msgSend(v5, "brc_wrappedError");
      *(_DWORD *)buf = 138413314;
      uint64_t v21 = v8;
      __int16 v22 = 2112;
      uint64_t v23 = 0;
      __int16 v24 = 2112;
      uint64_t v25 = 0;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      __int16 v29 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@,%@)%@", buf, 0x34u);
    }
    uint64_t v10 = *(void *)(a1 + 56);
    __int16 v11 = objc_msgSend(v5, "brc_wrappedError");
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v11);
  }
  else
  {
    id v19 = 0;
    id v12 = [*(id *)(a1 + 32) _sharingOperationItemFromLookup:a2 url:*(void *)(a1 + 40) allowDirectory:0 error:&v19];
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 48);
      qos_class_t v14 = *(void **)(a1 + 32);
      id v15 = [*(id *)(a1 + 40) path];
      [v14 _startOperation:v13 toCopySharingAccessTokenWithLocalItem:v12 itemIdentifier:v15 reply:*(void *)(a1 + 56)];
    }
    else
    {
      id v16 = brc_bread_crumbs();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138413314;
        uint64_t v21 = v18;
        __int16 v22 = 2112;
        uint64_t v23 = 0;
        __int16 v24 = 2112;
        uint64_t v25 = 0;
        __int16 v26 = 2112;
        id v27 = v19;
        __int16 v28 = 2112;
        __int16 v29 = v16;
        _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

- (void)startOperation:(id)a3 toCopySharingInfoAtURL:(id)a4 reply:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v34, 0, sizeof(v34));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopySharingInfoAtURL:reply:]", 593, v34);
  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v34[0];
    qos_class_t v14 = qos_class_self();
    id v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v36 = v13;
    __int16 v37 = 2112;
    uint64_t v38 = self;
    __int16 v39 = 2112;
    id v40 = v15;
    __int16 v41 = 2080;
    __int16 v42 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopySharingInfoAtURL:reply:]";
    __int16 v43 = 2112;
    __int16 v44 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingProxyEntitled];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __88__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopySharingInfoAtURL_reply___block_invoke;
  v32[3] = &unk_1E69957B0;
  v32[4] = self;
  id v18 = v10;
  id v33 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingProxyEntitled", v32);

  if (v19)
  {
    memset(v31, 0, sizeof(v31));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopySharingInfoAtURL:reply:]", 608, v31);
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v26 = v8;
      uint64_t v22 = v31[0];
      qos_class_t v23 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v23, (uint64_t)&brc_qos_entries, 0);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = [v9 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v36 = v22;
      __int16 v37 = 2112;
      uint64_t v38 = self;
      __int16 v39 = 2112;
      id v40 = v24;
      __int16 v41 = 2080;
      __int16 v42 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopySharingInfoAtURL:reply:]";
      __int16 v43 = 2112;
      __int16 v44 = v25;
      __int16 v45 = 2112;
      __int16 v46 = v20;
      _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      id v8 = v26;
    }

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __88__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopySharingInfoAtURL_reply___block_invoke_52;
    v27[3] = &unk_1E6999750;
    void v27[4] = self;
    id v30 = v18;
    id v28 = v9;
    id v29 = v8;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v28 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v27];

    __brc_leave_section(v31);
  }
  __brc_leave_section(v34);
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopySharingInfoAtURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopySharingInfoAtURL_reply___block_invoke_52(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      __int16 v9 = objc_msgSend(v5, "brc_wrappedError");
      *(_DWORD *)buf = 138413314;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = 0;
      __int16 v25 = 2112;
      uint64_t v26 = 0;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }
    uint64_t v10 = *(void *)(a1 + 56);
    __int16 v11 = objc_msgSend(v5, "brc_wrappedError");
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v11);
  }
  else
  {
    id v20 = 0;
    uint64_t v12 = [*(id *)(a1 + 32) _sharingOperationItemFromLookup:a2 url:*(void *)(a1 + 40) allowDirectory:1 error:&v20];
    if (v12)
    {
      [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toCopySharingInfoWithLocalItem:v12 reply:*(void *)(a1 + 56)];
    }
    else
    {
      if (!v20)
      {
        id v16 = brc_bread_crumbs();
        uint64_t v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          __88__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopySharingInfoAtURL_reply___block_invoke_52_cold_1();
        }

        id v18 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Item not found (with unspecified error)");
        id v19 = v20;
        id v20 = v18;
      }
      __int16 v13 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138413314;
        uint64_t v22 = v15;
        __int16 v23 = 2112;
        uint64_t v24 = 0;
        __int16 v25 = 2112;
        uint64_t v26 = 0;
        __int16 v27 = 2112;
        id v28 = v20;
        __int16 v29 = 2112;
        id v30 = v13;
        _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

- (void)createSharingInfoForURL:(id)a3 reply:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v31, 0, sizeof(v31));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) createSharingInfoForURL:reply:]", 615, v31);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v31[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v33 = v10;
    __int16 v34 = 2112;
    __int16 v35 = self;
    __int16 v36 = 2112;
    id v37 = v12;
    __int16 v38 = 2080;
    __int16 v39 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) createSharingInfoForURL:reply:]";
    __int16 v40 = 2112;
    __int16 v41 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v13 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v14 = [v13 isSharingProxyEntitled];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __74__BRCXPCRegularIPCsClient_LegacyAdditions__createSharingInfoForURL_reply___block_invoke;
  v29[3] = &unk_1E69957B0;
  v29[4] = self;
  id v15 = v7;
  id v30 = v15;
  char v16 = _brc_ipc_check_client_privilege(self, 1, v14, (uint64_t)"isSharingProxyEntitled", v29);

  if (v16)
  {
    uint64_t v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient(LegacyAdditions) createSharingInfoForURL:reply:]();
    }

    memset(v28, 0, sizeof(v28));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) createSharingInfoForURL:reply:]", 629, v28);
    id v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = v28[0];
      qos_class_t v22 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v22, (uint64_t)&brc_qos_entries, 0);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = [v6 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v33 = v21;
      __int16 v34 = 2112;
      __int16 v35 = self;
      __int16 v36 = 2112;
      id v37 = v23;
      __int16 v38 = 2080;
      __int16 v39 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) createSharingInfoForURL:reply:]";
      __int16 v40 = 2112;
      __int16 v41 = v24;
      __int16 v42 = 2112;
      __int16 v43 = v19;
      _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__BRCXPCRegularIPCsClient_LegacyAdditions__createSharingInfoForURL_reply___block_invoke_56;
    uint64_t v25[3] = &unk_1E69997C8;
    void v25[4] = self;
    id v27 = v15;
    id v26 = v6;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v26 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v25];

    __brc_leave_section(v28);
  }
  __brc_leave_section(v31);
}

void __74__BRCXPCRegularIPCsClient_LegacyAdditions__createSharingInfoForURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74__BRCXPCRegularIPCsClient_LegacyAdditions__createSharingInfoForURL_reply___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
      int v22 = 138413058;
      uint64_t v23 = v9;
      __int16 v24 = 2112;
      uint64_t v25 = 0;
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 2112;
      __int16 v29 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v22, 0x2Au);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_msgSend(v6, "brc_wrappedError");
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
  else
  {
    id v12 = [v5 byIDLocalItem];
    if (v12 || ([v5 faultedLocalItem], (id v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [*(id *)(a1 + 32) _createSharingInfoForLocalItem:v12 reply:*(void *)(a1 + 48)];
    }
    else
    {
      __int16 v13 = brc_bread_crumbs();
      char v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v17 = [*(id *)(a1 + 40) path];
        id v18 = objc_msgSend(v15, "brc_errorItemNotFound:", v17);
        int v22 = 138413058;
        uint64_t v23 = v16;
        __int16 v24 = 2112;
        uint64_t v25 = 0;
        __int16 v26 = 2112;
        id v27 = v18;
        __int16 v28 = 2112;
        __int16 v29 = v13;
        _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v22, 0x2Au);
      }
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *(void *)(a1 + 48);
      id v12 = [*(id *)(a1 + 40) path];
      uint64_t v21 = objc_msgSend(v19, "brc_errorItemNotFound:", v12);
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);
    }
  }
}

- (void)startOperation:(id)a3 toModifyRecordAccessAtURL:(id)a4 allowAccess:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  memset(v42, 0, sizeof(v42));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toModifyRecordAccessAtURL:allowAccess:reply:]", 636, v42);
  __int16 v13 = brc_bread_crumbs();
  char v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v42[0];
    qos_class_t v16 = qos_class_self();
    uint64_t v17 = BRCPrettyPrintEnumWithContext(v16, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v44 = v15;
    __int16 v45 = 2112;
    __int16 v46 = self;
    __int16 v47 = 2112;
    id v48 = v17;
    __int16 v49 = 2080;
    uint64_t v50 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toModifyRecordAccessAtURL:allowAccess:reply:]";
    __int16 v51 = 2112;
    v52 = v13;
    _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v18 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v19 = [v18 isSharingProxyEntitled];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __103__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toModifyRecordAccessAtURL_allowAccess_reply___block_invoke;
  v40[3] = &unk_1E69957B0;
  v40[4] = self;
  id v20 = v12;
  id v41 = v20;
  char v21 = _brc_ipc_check_client_privilege(self, 1, v19, (uint64_t)"isSharingProxyEntitled", v40);

  if (v21)
  {
    int v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = [v11 path];
      uint64_t v31 = (void *)v30;
      id v32 = "disallow";
      *(_DWORD *)buf = 136315650;
      if (v7) {
        id v32 = "allow";
      }
      uint64_t v44 = (uint64_t)v32;
      __int16 v45 = 2112;
      __int16 v46 = (BRCXPCRegularIPCsClient *)v30;
      __int16 v47 = 2112;
      id v48 = v22;
      _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Modifying record access to %s at %@%@", buf, 0x20u);
    }
    memset(v39, 0, sizeof(v39));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toModifyRecordAccessAtURL:allowAccess:reply:]", 654, v39);
    __int16 v24 = brc_bread_crumbs();
    uint64_t v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v33 = v10;
      uint64_t v26 = v39[0];
      qos_class_t v27 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v27, (uint64_t)&brc_qos_entries, 0);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v29 = [v11 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v44 = v26;
      __int16 v45 = 2112;
      __int16 v46 = self;
      __int16 v47 = 2112;
      id v48 = v28;
      __int16 v49 = 2080;
      uint64_t v50 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toModifyRecordAccessAtURL:allowAccess:reply:]";
      __int16 v51 = 2112;
      v52 = v29;
      __int16 v53 = 2112;
      __int16 v54 = v24;
      _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      id v10 = v33;
    }

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __103__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toModifyRecordAccessAtURL_allowAccess_reply___block_invoke_59;
    uint64_t v34[3] = &unk_1E69997F0;
    v34[4] = self;
    id v37 = v20;
    id v35 = v11;
    id v36 = v10;
    BOOL v38 = v7;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v35 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v34];

    __brc_leave_section(v39);
  }
  __brc_leave_section(v42);
}

void __103__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toModifyRecordAccessAtURL_allowAccess_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    qos_class_t v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __103__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toModifyRecordAccessAtURL_allowAccess_reply___block_invoke_59(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413314;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      __int16 v22 = 2112;
      uint64_t v23 = 0;
      __int16 v24 = 2112;
      id v25 = v5;
      __int16 v26 = 2112;
      qos_class_t v27 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v17 = 0;
    __int16 v9 = [*(id *)(a1 + 32) _sharingOperationItemFromLookup:a2 url:*(void *)(a1 + 40) allowDirectory:0 error:&v17];
    if (v9)
    {
      [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toModifyRecordAccessWithLocalItem:v9 allowAccess:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 56)];
    }
    else
    {
      if (!v17)
      {
        __int16 v13 = brc_bread_crumbs();
        id v14 = brc_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          __88__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopySharingInfoAtURL_reply___block_invoke_52_cold_1();
        }

        __int16 v15 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Item not found (with unspecified error)");
        id v16 = v17;
        id v17 = v15;
      }
      uint64_t v10 = brc_bread_crumbs();
      __int16 v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138413314;
        uint64_t v19 = v12;
        __int16 v20 = 2112;
        uint64_t v21 = 0;
        __int16 v22 = 2112;
        uint64_t v23 = 0;
        __int16 v24 = 2112;
        id v25 = v17;
        __int16 v26 = 2112;
        qos_class_t v27 = v10;
        _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

- (void)startOperation:(id)a3 toCopyParticipantTokenAtURL:(id)a4 reply:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v38, 0, sizeof(v38));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyParticipantTokenAtURL:reply:]", 661, v38);
  __int16 v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v38[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v40 = v13;
    __int16 v41 = 2112;
    __int16 v42 = self;
    __int16 v43 = 2112;
    id v44 = v15;
    __int16 v45 = 2080;
    __int16 v46 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyParticipantTokenAtURL:reply:]";
    __int16 v47 = 2112;
    id v48 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingPrivateInterfaceEntitled];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __93__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyParticipantTokenAtURL_reply___block_invoke;
  v36[3] = &unk_1E69957B0;
  v36[4] = self;
  id v18 = v10;
  id v37 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingPrivateInterfaceEntitled", v36);

  if (v19)
  {
    brc_bread_crumbs();
    __int16 v20 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [v9 path];
      uint64_t v29 = [v28 UTF8String];
      *(_DWORD *)buf = 136315394;
      uint64_t v40 = v29;
      __int16 v41 = 2112;
      __int16 v42 = v20;
      _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Copying participant token at %s%@", buf, 0x16u);
    }
    memset(v35, 0, sizeof(v35));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyParticipantTokenAtURL:reply:]", 678, v35);
    __int16 v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v30 = v8;
      uint64_t v24 = v35[0];
      qos_class_t v25 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v25, (uint64_t)&brc_qos_entries, 0);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      qos_class_t v27 = [v9 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v40 = v24;
      __int16 v41 = 2112;
      __int16 v42 = self;
      __int16 v43 = 2112;
      id v44 = v26;
      __int16 v45 = 2080;
      __int16 v46 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toCopyParticipantTokenAtURL:reply:]";
      __int16 v47 = 2112;
      id v48 = v27;
      __int16 v49 = 2112;
      uint64_t v50 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      id v8 = v30;
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __93__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyParticipantTokenAtURL_reply___block_invoke_60;
    uint64_t v31[3] = &unk_1E6999750;
    v31[4] = self;
    id v34 = v18;
    id v32 = v9;
    id v33 = v8;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v32 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v31];

    __brc_leave_section(v35);
  }
  __brc_leave_section(v38);
}

void __93__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyParticipantTokenAtURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __93__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopyParticipantTokenAtURL_reply___block_invoke_60(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413314;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = 0;
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      __int16 v20 = 2112;
      id v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v13 = 0;
    __int16 v9 = [*(id *)(a1 + 32) _sharingOperationItemFromLookup:a2 url:*(void *)(a1 + 40) allowDirectory:0 error:&v13];
    if (v9)
    {
      [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toCopyParticipantTokenWithLocalItem:v9 reply:*(void *)(a1 + 56)];
    }
    else
    {
      uint64_t v10 = brc_bread_crumbs();
      __int16 v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138413314;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        uint64_t v17 = 0;
        __int16 v18 = 2112;
        uint64_t v19 = 0;
        __int16 v20 = 2112;
        id v21 = v13;
        __int16 v22 = 2112;
        uint64_t v23 = v10;
        _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

- (void)startOperation:(id)a3 toPrepFolderForSharingAt:(id)a4 reply:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v37, 0, sizeof(v37));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toPrepFolderForSharingAt:reply:]", 686, v37);
  __int16 v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v37[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v39 = v13;
    __int16 v40 = 2112;
    __int16 v41 = self;
    __int16 v42 = 2112;
    id v43 = v15;
    __int16 v44 = 2080;
    __int16 v45 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toPrepFolderForSharingAt:reply:]";
    __int16 v46 = 2112;
    __int16 v47 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingPrivateInterfaceEntitled];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __90__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toPrepFolderForSharingAt_reply___block_invoke;
  uint64_t v35[3] = &unk_1E69957B0;
  v35[4] = self;
  id v18 = v10;
  id v36 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingPrivateInterfaceEntitled", v35);

  if (v19)
  {
    brc_bread_crumbs();
    __int16 v20 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [v9 path];
      uint64_t v29 = [v28 UTF8String];
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = v29;
      __int16 v40 = 2112;
      __int16 v41 = v20;
      _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Prep folder at %s%@", buf, 0x16u);
    }
    memset(v34, 0, sizeof(v34));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toPrepFolderForSharingAt:reply:]", 696, v34);
    __int16 v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v30 = v8;
      uint64_t v24 = v34[0];
      qos_class_t v25 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v25, (uint64_t)&brc_qos_entries, 0);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      qos_class_t v27 = [v9 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v39 = v24;
      __int16 v40 = 2112;
      __int16 v41 = self;
      __int16 v42 = 2112;
      id v43 = v26;
      __int16 v44 = 2080;
      __int16 v45 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toPrepFolderForSharingAt:reply:]";
      __int16 v46 = 2112;
      __int16 v47 = v27;
      __int16 v48 = 2112;
      __int16 v49 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      id v8 = v30;
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __90__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toPrepFolderForSharingAt_reply___block_invoke_61;
    uint64_t v31[3] = &unk_1E69997C8;
    v31[4] = self;
    id v33 = v18;
    id v32 = v8;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v9 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v31];

    __brc_leave_section(v34);
  }
  __brc_leave_section(v37);
}

void __90__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toPrepFolderForSharingAt_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __90__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toPrepFolderForSharingAt_reply___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v10, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    __int16 v9 = [a2 byIDLocalItem];
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 40) toPrepFolderForSharingWithLocalItem:v9 reply:*(void *)(a1 + 48)];
  }
}

- (void)startOperation:(id)a3 toProcessSubitemsAtURL:(id)a4 maxSubsharesFailures:(unint64_t)a5 processType:(unint64_t)a6 reply:(id)a7
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  memset(v45, 0, sizeof(v45));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toProcessSubitemsAtURL:maxSubsharesFailures:processType:reply:]", 705, v45);
  id v13 = brc_bread_crumbs();
  __int16 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = v11;
    id v16 = v10;
    uint64_t v17 = v45[0];
    qos_class_t v18 = qos_class_self();
    char v19 = BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v47 = v17;
    __int16 v48 = 2112;
    __int16 v49 = self;
    __int16 v50 = 2112;
    id v51 = v19;
    __int16 v52 = 2080;
    __int16 v53 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toProcessSubitemsAtURL:maxSubsharesFailures:processType:reply:]";
    __int16 v54 = 2112;
    uint64_t v55 = v13;
    _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    id v10 = v16;
    id v11 = v15;
  }

  __int16 v20 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v21 = [v20 isFolderSharingProxyEntitled];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __121__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toProcessSubitemsAtURL_maxSubsharesFailures_processType_reply___block_invoke;
  v43[3] = &unk_1E69957B0;
  v43[4] = self;
  id v22 = v12;
  id v44 = v22;
  char v23 = _brc_ipc_check_client_privilege(self, 1, v21, (uint64_t)"isFolderSharingProxyEntitled", v43);

  if (v23)
  {
    brc_bread_crumbs();
    uint64_t v24 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    qos_class_t v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      id v32 = [v11 path];
      uint64_t v33 = [v32 UTF8String];
      *(_DWORD *)buf = 136315394;
      uint64_t v47 = v33;
      __int16 v48 = 2112;
      __int16 v49 = v24;
      _os_log_debug_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] Clean share subitems at %s%@", buf, 0x16u);
    }
    memset(v42, 0, sizeof(v42));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toProcessSubitemsAtURL:maxSubsharesFailures:processType:reply:]", 715, v42);
    id v26 = brc_bread_crumbs();
    qos_class_t v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v34 = v10;
      uint64_t v28 = v42[0];
      qos_class_t v29 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v29, (uint64_t)&brc_qos_entries, 0);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = [v11 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v47 = v28;
      __int16 v48 = 2112;
      __int16 v49 = self;
      __int16 v50 = 2112;
      id v51 = v30;
      __int16 v52 = 2080;
      __int16 v53 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toProcessSubitemsAtURL:maxSubsharesFailures:processType:reply:]";
      __int16 v54 = 2112;
      uint64_t v55 = v31;
      __int16 v56 = 2112;
      v57 = v26;
      _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      id v10 = v34;
    }

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __121__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toProcessSubitemsAtURL_maxSubsharesFailures_processType_reply___block_invoke_63;
    uint64_t v37[3] = &unk_1E6999818;
    v37[4] = self;
    id v39 = v22;
    id v38 = v10;
    unint64_t v40 = a5;
    unint64_t v41 = a6;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v11 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v37];

    __brc_leave_section(v42);
  }
  __brc_leave_section(v45);
}

void __121__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toProcessSubitemsAtURL_maxSubsharesFailures_processType_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __121__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toProcessSubitemsAtURL_maxSubsharesFailures_processType_reply___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v10, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    __int16 v9 = [a2 byIDLocalItem];
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 40) toProcessSubitemsWithLocalItem:v9 maxSubsharesFailures:*(void *)(a1 + 56) processType:*(void *)(a1 + 64) reply:*(void *)(a1 + 48)];
  }
}

- (id)_createBookmarkWithTarget:(id)a3 targetPath:(id)a4 parentPath:(id)a5 aliasName:(id)a6 error:(id *)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = brc_bread_crumbs();
  uint64_t v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v36 = v13;
    __int16 v37 = 2112;
    id v38 = v12;
    __int16 v39 = 2112;
    unint64_t v40 = v16;
    _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] creating bookmark with target %@ (%@)%@", buf, 0x20u);
  }

  qos_class_t v18 = [BRCBookmark alloc];
  char v19 = [v14 appLibrary];
  __int16 v20 = [(BRCXPCClient *)self session];
  char v21 = [(BRCBookmark *)v18 initWithTarget:v12 owningAppLibrary:v19 path:v13 session:v20];

  if ([(BRCBookmark *)v21 resolveWithError:a7]
    && ([(BRCBookmark *)v21 writeUnderParent:v14 name:v15 error:a7],
        (uint64_t v22 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v23 = (void *)v22;
    uint64_t v24 = [v14 appLibrary];
    qos_class_t v25 = [v24 db];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    void v30[2] = __108__BRCXPCRegularIPCsClient_LegacyAdditions___createBookmarkWithTarget_targetPath_parentPath_aliasName_error___block_invoke;
    v30[3] = &unk_1E6998A40;
    id v31 = v12;
    id v32 = self;
    id v33 = v13;
    id v26 = v23;
    id v34 = v26;
    [v25 groupInBatch:v30];

    qos_class_t v27 = v34;
    id v28 = v26;
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

void __108__BRCXPCRegularIPCsClient_LegacyAdditions___createBookmarkWithTarget_targetPath_parentPath_aliasName_error___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) session];
    id v3 = [v2 fsReader];
    [v3 fseventAtPath:*(void *)(a1 + 48) flags:0];
  }
  id v5 = [*(id *)(a1 + 40) session];
  uint64_t v4 = [v5 fsReader];
  [v4 fseventAtPath:*(void *)(a1 + 56) flags:0];
}

- (void)scheduleDeepScanForContainer:(id)a3 reply:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) scheduleDeepScanForContainer:reply:]", 755, v25);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v25[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    qos_class_t v29 = self;
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 2080;
    id v33 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) scheduleDeepScanForContainer:reply:]";
    __int16 v34 = 2112;
    id v35 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v13 = (void *)*MEMORY[0x1E4F59318];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __79__BRCXPCRegularIPCsClient_LegacyAdditions__scheduleDeepScanForContainer_reply___block_invoke;
  v23[3] = &unk_1E69957B0;
  v23[4] = self;
  id v14 = v7;
  id v24 = v14;
  LODWORD(v13) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v13, v23);

  if (v13)
  {
    id v15 = [(BRCXPCClient *)self session];
    uint64_t v16 = [v15 clientTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__BRCXPCRegularIPCsClient_LegacyAdditions__scheduleDeepScanForContainer_reply___block_invoke_66;
    block[3] = &unk_1E6993D18;
    id v19 = v6;
    id v20 = v15;
    char v21 = self;
    id v22 = v14;
    id v17 = v15;
    dispatch_async_and_wait(v16, block);
  }
  __brc_leave_section(v25);
}

void __79__BRCXPCRegularIPCsClient_LegacyAdditions__scheduleDeepScanForContainer_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79__BRCXPCRegularIPCsClient_LegacyAdditions__scheduleDeepScanForContainer_reply___block_invoke_66(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = objc_msgSend(*(id *)(a1 + 40), "appLibraries", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v7++) scheduleDeepScanWithReason:@"testing"];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }
    goto LABEL_11;
  }
  v2 = objc_msgSend(*(id *)(a1 + 40), "appLibraryByID:");
  if (v2)
  {
    id v3 = v2;
    [v2 scheduleDeepScanWithReason:@"testing"];
LABEL_11:

    uint64_t v8 = brc_bread_crumbs();
    __int16 v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      qos_class_t v25 = 0;
      __int16 v26 = 2112;
      uint64_t v27 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    return;
  }
  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", *(void *)(a1 + 32));
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    qos_class_t v25 = v14;
    __int16 v26 = 2112;
    uint64_t v27 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", *(void *)(a1 + 32));
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
}

- (void)moveBRSecurityBookmarkAtURL:(id)a3 toURL:(id)a4 reply:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) moveBRSecurityBookmarkAtURL:toURL:reply:]", 778, v25);
  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v25[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v27 = v13;
    __int16 v28 = 2112;
    qos_class_t v29 = self;
    __int16 v30 = 2112;
    id v31 = v15;
    __int16 v32 = 2080;
    id v33 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) moveBRSecurityBookmarkAtURL:toURL:reply:]";
    __int16 v34 = 2112;
    id v35 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__BRCXPCRegularIPCsClient_LegacyAdditions__moveBRSecurityBookmarkAtURL_toURL_reply___block_invoke;
  v23[3] = &unk_1E69957B0;
  v23[4] = self;
  id v16 = v10;
  id v24 = v16;
  int v17 = _brc_ipc_check_applibrary_proxy(self, 1, v23);

  if (v17)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __84__BRCXPCRegularIPCsClient_LegacyAdditions__moveBRSecurityBookmarkAtURL_toURL_reply___block_invoke_70;
    v18[3] = &unk_1E6999840;
    id v19 = v9;
    id v20 = v8;
    char v21 = self;
    id v22 = v16;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v20 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v18];
  }
  __brc_leave_section(v25);
}

void __84__BRCXPCRegularIPCsClient_LegacyAdditions__moveBRSecurityBookmarkAtURL_toURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__BRCXPCRegularIPCsClient_LegacyAdditions__moveBRSecurityBookmarkAtURL_toURL_reply___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unsigned int v47 = 0;
  int v7 = [v5 session];
  uint64_t v8 = [*(id *)(a1 + 32) path];
  __int16 v9 = [v8 stringByDeletingLastPathComponent];
  id v10 = [v7 resolvedOpenRelpathForPath:v9 mustExist:1 errcode:&v47];

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v47);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v40 = 0;
    __int16 v11 = 0;
LABEL_8:
    uint64_t v41 = 0;
    uint64_t v38 = 0;
    int v17 = 0;
    goto LABEL_9;
  }
  __int16 v11 = [v5 byIDLocalItem];
  if (([v11 isBRAlias] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"url", *(void *)(a1 + 40));
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v40 = 0;
    goto LABEL_8;
  }
  id v12 = *(void **)(a1 + 40);
  id v46 = v6;
  objc_msgSend(v12, "br_externalDocumentPropertiesWithError:", &v46);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v46;

  if (v13)
  {
    uint64_t v41 = v13;
    uint64_t v15 = objc_msgSend(*(id *)(a1 + 40), "br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:", v13);
    unint64_t v40 = v15;
    if (v15)
    {
      id v16 = [v15 path];
      int v17 = [v7 resolvedOpenRelpathForPath:v16 mustExist:0 errcode:&v47];
    }
    else
    {
      int v17 = 0;
    }
    id v22 = [v11 asBRAlias];
    uint64_t v23 = [v22 targetDocument];

    id v24 = *(void **)(a1 + 48);
    qos_class_t v25 = [*(id *)(a1 + 32) lastPathComponent];
    id v45 = v14;
    uint64_t v38 = v23;
    id v13 = [v24 _createBookmarkWithTarget:v23 targetPath:v17 parentPath:v10 aliasName:v25 error:&v45];
    id v18 = v45;

    if (!v13) {
      goto LABEL_11;
    }
    __int16 v26 = [v7 fileUnlinker];
    uint64_t v27 = [*(id *)(a1 + 40) path];
    char v28 = [v26 renameAndUnlinkInBackgroundItemAtPath:v27];

    if ((v28 & 1) == 0)
    {
      qos_class_t v29 = brc_bread_crumbs();
      __int16 v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [*(id *)(a1 + 40) path];
        *(_DWORD *)buf = 138412546;
        __int16 v49 = v31;
        __int16 v50 = 2112;
        *(void *)id v51 = v29;
        _os_log_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEFAULT, "[WARNING] can't unlink original item at %@%@", buf, 0x16u);
      }
    }
    __int16 v32 = [*(id *)(a1 + 40) path];
    id v33 = [v7 resolvedOpenRelpathForPath:v32 mustExist:0 errcode:&v47];

    if (v33)
    {
      __int16 v34 = [v10 appLibrary];
      id v35 = [v34 db];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __84__BRCXPCRegularIPCsClient_LegacyAdditions__moveBRSecurityBookmarkAtURL_toURL_reply___block_invoke_74;
      uint64_t v42[3] = &unk_1E6995AD0;
      id v43 = v7;
      id v13 = v33;
      id v44 = v13;
      [v35 groupInBatch:v42];

      id v6 = v43;
      goto LABEL_10;
    }
    brc_bread_crumbs();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v37 = [*(id *)(a1 + 40) path];
      *(_DWORD *)buf = 138412802;
      __int16 v49 = v37;
      __int16 v50 = 1024;
      *(_DWORD *)id v51 = v47;
      *(_WORD *)&v51[4] = 2112;
      *(void *)&v51[6] = v6;
      _os_log_impl(&dword_1D353B000, v36, OS_LOG_TYPE_DEFAULT, "[WARNING] can't find relpath for %@ %{errno}d%@", buf, 0x1Cu);
    }
LABEL_9:
    id v13 = 0;
LABEL_10:

LABEL_11:
    id v14 = v18;
    objc_msgSend(v10, "close", v38);
    goto LABEL_12;
  }
  unint64_t v40 = 0;
  uint64_t v41 = 0;
  int v17 = 0;
  objc_msgSend(v10, "close", 0);
LABEL_12:
  [v17 close];
  [v13 close];
  id v19 = brc_bread_crumbs();
  id v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    char v21 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    __int16 v49 = v21;
    __int16 v50 = 2112;
    *(void *)id v51 = v14;
    *(_WORD *)&v51[8] = 2112;
    *(void *)&v51[10] = v19;
    _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __84__BRCXPCRegularIPCsClient_LegacyAdditions__moveBRSecurityBookmarkAtURL_toURL_reply___block_invoke_74(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fsReader];
  [v2 fseventAtPath:*(void *)(a1 + 40) flags:0];
}

- (void)_readerThrottleBackoffForDocumentAtPath:(id)a3 session:(id)a4 containerID:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [v10 clientTruthWorkloop];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __110__BRCXPCRegularIPCsClient_LegacyAdditions___readerThrottleBackoffForDocumentAtPath_session_containerID_reply___block_invoke;
  v16[3] = &unk_1E6993D18;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async_and_wait(v12, v16);
}

void __110__BRCXPCRegularIPCsClient_LegacyAdditions___readerThrottleBackoffForDocumentAtPath_session_containerID_reply___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _auditedURLFromPath:*(void *)(a1 + 40)];
  id v3 = [[BRCURLToItemLookup alloc] initWithURL:v2 session:*(void *)(a1 + 48)];
  unsigned int v37 = 0;
  if ([(BRCURLToItemLookup *)v3 resolveParentAndKeepOpenMustExist:1 errcode:&v37])
  {
    uint64_t v4 = [(BRCURLToItemLookup *)v3 byIDLocalItem];
    [(BRCURLToItemLookup *)v3 closePaths];
    if (v4 && ([v4 isDocument] & 1) != 0)
    {
      id v5 = [*(id *)(a1 + 48) clientDB];
      id v6 = [v4 serverZone];
      int v7 = [v6 dbRowID];
      uint64_t v8 = (void *)[v5 fetch:@"SELECT throttle_state, next_retry_stamp FROM client_reader_throttle WHERE zone_rowid = %@ AND throttle_id = %lld", v7, objc_msgSend(v4, "dbRowID")];

      id v9 = [v5 lastError];

      if (v9)
      {
        id v10 = brc_bread_crumbs();
        id v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          id v13 = [v5 lastError];
          *(_DWORD *)buf = 138413058;
          uint64_t v39 = v12;
          __int16 v40 = 2048;
          double v41 = 0.0;
          __int16 v42 = 2112;
          id v43 = v13;
          __int16 v44 = 2112;
          id v45 = v10;
          _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%f, %@)%@", buf, 0x2Au);
        }
        uint64_t v14 = *(void *)(a1 + 56);
        id v15 = [v5 lastError];
        (*(void (**)(uint64_t, void *, double))(v14 + 16))(v14, v15, 0.0);
      }
      if ([v8 next])
      {
        brc_current_date_nsec();
        [v8 longLongAtIndex:1];
        brc_interval_from_nsec();
        double v17 = v16;
        id v18 = brc_bread_crumbs();
        id v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138413058;
          uint64_t v39 = v20;
          __int16 v40 = 2048;
          double v41 = v17;
          __int16 v42 = 2112;
          id v43 = 0;
          __int16 v44 = 2112;
          id v45 = v18;
          _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%f, %@)%@", buf, 0x2Au);
        }

        (*(void (**)(double))(*(void *)(a1 + 56) + 16))(v17);
      }
      else
      {
        id v31 = brc_bread_crumbs();
        __int16 v32 = brc_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = *(void *)(a1 + 32);
          __int16 v34 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
          *(_DWORD *)buf = 138413058;
          uint64_t v39 = v33;
          __int16 v40 = 2048;
          double v41 = 0.0;
          __int16 v42 = 2112;
          id v43 = v34;
          __int16 v44 = 2112;
          id v45 = v31;
          _os_log_impl(&dword_1D353B000, v32, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%f, %@)%@", buf, 0x2Au);
        }
        uint64_t v35 = *(void *)(a1 + 56);
        uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
        (*(void (**)(uint64_t, void *, double))(v35 + 16))(v35, v36, 0.0);
      }
    }
    else
    {
      __int16 v26 = brc_bread_crumbs();
      uint64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = *(void *)(a1 + 32);
        qos_class_t v29 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
        *(_DWORD *)buf = 138413058;
        uint64_t v39 = v28;
        __int16 v40 = 2048;
        double v41 = 0.0;
        __int16 v42 = 2112;
        id v43 = v29;
        __int16 v44 = 2112;
        id v45 = v26;
        _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%f, %@)%@", buf, 0x2Au);
      }
      uint64_t v30 = *(void *)(a1 + 56);
      id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      (*(void (**)(uint64_t, void *, double))(v30 + 16))(v30, v5, 0.0);
    }
  }
  else
  {
    char v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      id v24 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v37);
      *(_DWORD *)buf = 138413058;
      uint64_t v39 = v23;
      __int16 v40 = 2048;
      double v41 = 0.0;
      __int16 v42 = 2112;
      id v43 = v24;
      __int16 v44 = 2112;
      id v45 = v21;
      _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%f, %@)%@", buf, 0x2Au);
    }
    uint64_t v25 = *(void *)(a1 + 56);
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v37);
    (*(void (**)(uint64_t, void *, double))(v25 + 16))(v25, v4, 0.0);
  }
}

- (void)readerThrottleBackoffForDocumentAtPath:(id)a3 containerID:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) readerThrottleBackoffForDocumentAtPath:containerID:reply:]", 894, v27);
  id v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v27[0];
    qos_class_t v14 = qos_class_self();
    id v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    id v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    __int16 v34 = 2080;
    uint64_t v35 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) readerThrottleBackoffForDocumentAtPath:containerID:reply:]";
    __int16 v36 = 2112;
    unsigned int v37 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  double v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isAutomationEntitled];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __101__BRCXPCRegularIPCsClient_LegacyAdditions__readerThrottleBackoffForDocumentAtPath_containerID_reply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v18 = v10;
  id v26 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isAutomationEntitled", v25);

  if (v19)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __101__BRCXPCRegularIPCsClient_LegacyAdditions__readerThrottleBackoffForDocumentAtPath_containerID_reply___block_invoke_79;
    uint64_t v21[3] = &unk_1E6999868;
    v21[4] = self;
    id v24 = v18;
    id v22 = v8;
    id v23 = v9;
    uint64_t v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v22];
    [(BRCXPCClient *)self performBlock:v21 withSessionFromURL:v20];
  }
  __brc_leave_section(v27);
}

void __101__BRCXPCRegularIPCsClient_LegacyAdditions__readerThrottleBackoffForDocumentAtPath_containerID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%f, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(0.0);
}

void __101__BRCXPCRegularIPCsClient_LegacyAdditions__readerThrottleBackoffForDocumentAtPath_containerID_reply___block_invoke_79(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138413058;
      uint64_t v10 = v8;
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      double v16 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%f, %@)%@", (uint8_t *)&v9, 0x2Au);
    }

    (*(void (**)(double))(*(void *)(a1 + 56) + 16))(0.0);
  }
  else
  {
    [*(id *)(a1 + 32) _readerThrottleBackoffForDocumentAtPath:*(void *)(a1 + 40) session:a2 containerID:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
  }
}

- (void)getEvictableSpaceWithReply:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getEvictableSpaceWithReply:]", 910, v25);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v25[0];
    qos_class_t v8 = qos_class_self();
    int v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v27 = v7;
    __int16 v28 = 2112;
    uint64_t v29 = self;
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 2080;
    uint64_t v33 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getEvictableSpaceWithReply:]";
    __int16 v34 = 2112;
    uint64_t v35 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v10 = (void *)*MEMORY[0x1E4F59358];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__BRCXPCRegularIPCsClient_LegacyAdditions__getEvictableSpaceWithReply___block_invoke;
  v23[3] = &unk_1E69957B0;
  v23[4] = self;
  id v11 = v4;
  id v24 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v23);

  if (v10)
  {
    uint64_t v12 = +[BRCUserDefaults defaultsForMangledID:0];
    [v12 defaultTimeDeltaForEviction];
    uint64_t v14 = v13;
    __int16 v15 = [(BRCXPCClient *)self session];
    double v16 = [v15 readOnlyWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__BRCXPCRegularIPCsClient_LegacyAdditions__getEvictableSpaceWithReply___block_invoke_82;
    block[3] = &unk_1E6995C20;
    uint64_t v22 = v14;
    id v19 = v15;
    uint64_t v20 = self;
    id v21 = v11;
    id v17 = v15;
    dispatch_async(v16, block);
  }
  __brc_leave_section(v25);
}

void __71__BRCXPCRegularIPCsClient_LegacyAdditions__getEvictableSpaceWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%lu, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__BRCXPCRegularIPCsClient_LegacyAdditions__getEvictableSpaceWithReply___block_invoke_82(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 56);
  id v4 = [v2 expensiveReadOnlyDB];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__BRCXPCRegularIPCsClient_LegacyAdditions__getEvictableSpaceWithReply___block_invoke_2;
  v6[3] = &unk_1E6999890;
  id v5 = *(void **)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  [v2 computeTotalEvictableSizeWithAccessLowTimeDelta:v4 medTimeDelta:v6 highTimeDelta:v3 + 1.0 db:v3 + 1.0 reply:v3];
}

void __71__BRCXPCRegularIPCsClient_LegacyAdditions__getEvictableSpaceWithReply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138413058;
    uint64_t v12 = v10;
    __int16 v13 = 2048;
    uint64_t v14 = a4;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%llu, %@)%@", (uint8_t *)&v11, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startOperation:(id)a3 toEvictItemAtURL:(id)a4 reply:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toEvictItemAtURL:reply:]", 955, v24);
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v24[0];
    qos_class_t v14 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = [v9 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    __int16 v28 = self;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toEvictItemAtURL:reply:]";
    __int16 v33 = 2112;
    __int16 v34 = v16;
    __int16 v35 = 2112;
    uint64_t v36 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toEvictItemAtURL_reply___block_invoke;
  v20[3] = &unk_1E6999750;
  v20[4] = self;
  id v17 = v10;
  id v23 = v17;
  id v18 = v9;
  id v21 = v18;
  id v19 = v8;
  id v22 = v19;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v18 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v20];

  __brc_leave_section(v24);
}

void __82__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toEvictItemAtURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = objc_msgSend(v6, "brc_wrappedError");
      *(_DWORD *)buf = 138412802;
      uint64_t v34 = v9;
      __int16 v35 = 2112;
      uint64_t v36 = v10;
      __int16 v37 = 2112;
      uint64_t v38 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = v6;
LABEL_5:
    uint64_t v13 = objc_msgSend(v12, "brc_wrappedError");
    goto LABEL_6;
  }
  if (!v5)
  {
    id v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = objc_msgSend(0, "brc_wrappedError");
      *(_DWORD *)buf = 138412802;
      uint64_t v34 = v21;
      __int16 v35 = 2112;
      uint64_t v36 = v22;
      __int16 v37 = 2112;
      uint64_t v38 = v19;
      _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = 0;
    goto LABEL_5;
  }
  qos_class_t v14 = [v5 byIDLocalItem];
  if (v14 || ([v5 faultedLocalItem], (qos_class_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v15 = [BRCEvictItemOperation alloc];
    id v16 = [v5 session];
    id v17 = [(BRCEvictItemOperation *)v15 initWithSession:v16 url:*(void *)(a1 + 40)];

    [(_BRCFrameworkOperation *)v17 setRemoteClientProxy:*(void *)(a1 + 48)];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    __int16 v29 = __82__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toEvictItemAtURL_reply___block_invoke_85;
    id v30 = &unk_1E6996730;
    uint64_t v31 = *(void *)(a1 + 32);
    id v32 = *(id *)(a1 + 56);
    [(_BRCOperation *)v17 setFinishBlock:&v27];
    id v18 = objc_msgSend(v5, "session", v27, v28, v29, v30, v31);
    [v18 addMiscOperation:v17];

    [(_BRCOperation *)v17 schedule];
    goto LABEL_11;
  }
  id v23 = brc_bread_crumbs();
  id v24 = brc_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 2);
    *(_DWORD *)buf = 138412802;
    uint64_t v34 = v25;
    __int16 v35 = 2112;
    uint64_t v36 = v26;
    __int16 v37 = 2112;
    uint64_t v38 = v23;
    _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 2);
LABEL_6:
  qos_class_t v14 = (void *)v13;
  (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v13);
LABEL_11:
}

void __82__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toEvictItemAtURL_reply___block_invoke_85(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)overwriteAccessTimeForItemAtURL:(id)a3 atime:(unint64_t)a4 reply:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  memset(v31, 0, sizeof(v31));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) overwriteAccessTimeForItemAtURL:atime:reply:]", 1146, v31);
  __int16 v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v31[0];
    qos_class_t v13 = qos_class_self();
    uint64_t v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v33 = v12;
    __int16 v34 = 2112;
    __int16 v35 = self;
    __int16 v36 = 2112;
    id v37 = v14;
    __int16 v38 = 2080;
    uint64_t v39 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) overwriteAccessTimeForItemAtURL:atime:reply:]";
    __int16 v40 = 2112;
    double v41 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v15 = (void *)*MEMORY[0x1E4F59318];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __88__BRCXPCRegularIPCsClient_LegacyAdditions__overwriteAccessTimeForItemAtURL_atime_reply___block_invoke;
  v29[3] = &unk_1E69957B0;
  v29[4] = self;
  id v16 = v9;
  id v30 = v16;
  LODWORD(v15) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v15, v29);

  if (v15)
  {
    memset(v28, 0, sizeof(v28));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) overwriteAccessTimeForItemAtURL:atime:reply:]", 1172, v28);
    id v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      unint64_t v23 = a4;
      uint64_t v19 = v28[0];
      qos_class_t v20 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v20, (uint64_t)&brc_qos_entries, 0);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = [v8 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v33 = v19;
      __int16 v34 = 2112;
      __int16 v35 = self;
      __int16 v36 = 2112;
      id v37 = v21;
      __int16 v38 = 2080;
      uint64_t v39 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) overwriteAccessTimeForItemAtURL:atime:reply:]";
      __int16 v40 = 2112;
      double v41 = v22;
      __int16 v42 = 2112;
      id v43 = v17;
      _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      a4 = v23;
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __88__BRCXPCRegularIPCsClient_LegacyAdditions__overwriteAccessTimeForItemAtURL_atime_reply___block_invoke_86;
    uint64_t v24[3] = &unk_1E69998B8;
    v24[4] = self;
    id v26 = v16;
    id v25 = v8;
    unint64_t v27 = a4;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v25 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v24];

    __brc_leave_section(v28);
  }
  __brc_leave_section(v31);
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__overwriteAccessTimeForItemAtURL_atime_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__overwriteAccessTimeForItemAtURL_atime_reply___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = objc_msgSend(v6, "brc_wrappedError");
      *(_DWORD *)buf = 138412802;
      uint64_t v51 = v9;
      __int16 v52 = 2112;
      __int16 v53 = v10;
      __int16 v54 = 2112;
      uint64_t v55 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = objc_msgSend(v6, "brc_wrappedError");
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    goto LABEL_22;
  }
  if (v5)
  {
    uint64_t v12 = [v5 byIDLocalItem];
    if (v12 || ([v5 faultedLocalItem], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ([v12 isDocument])
      {
        uint64_t v13 = [*(id *)(a1 + 32) session];
        uint64_t v14 = [v13 diskReclaimer];
        id v15 = [v12 asDocument];
        char v16 = [v14 overwriteDocumentAccessTime:v15 atime:*(void *)(a1 + 56)];

        if (v16)
        {
          id v17 = brc_bread_crumbs();
          id v18 = brc_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412802;
            uint64_t v51 = v19;
            __int16 v52 = 2112;
            __int16 v53 = 0;
            __int16 v54 = 2112;
            uint64_t v55 = v17;
            _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
          }

          (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
          goto LABEL_22;
        }
        id v32 = brc_bread_crumbs();
        uint64_t v33 = brc_default_log();
        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
        uint64_t v35 = *MEMORY[0x1E4F592A8];
        if (v34)
        {
          __int16 v36 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v37 = *(void *)(a1 + 32);
          __int16 v38 = [*(id *)(a1 + 40) path];
          uint64_t v39 = objc_msgSend(v36, "br_errorWithDomain:code:description:", v35, 10, @"Couldn't modify access time of %@", v38);
          *(_DWORD *)buf = 138412802;
          uint64_t v51 = v37;
          __int16 v52 = 2112;
          __int16 v53 = v39;
          __int16 v54 = 2112;
          uint64_t v55 = v32;
          _os_log_impl(&dword_1D353B000, v33, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
        __int16 v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v30 = *(void *)(a1 + 48);
        uint64_t v31 = [*(id *)(a1 + 40) path];
        objc_msgSend(v40, "br_errorWithDomain:code:description:", v35, 10, @"Couldn't modify access time of %@", v31);
      }
      else
      {
        qos_class_t v20 = brc_bread_crumbs();
        id v21 = brc_default_log();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
        uint64_t v23 = *MEMORY[0x1E4F592A8];
        unint64_t v24 = 0x1E4F28000;
        if (v22)
        {
          id v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = *(void *)(a1 + 32);
          unint64_t v27 = [*(id *)(a1 + 40) path];
          uint64_t v28 = objc_msgSend(v25, "br_errorWithDomain:code:description:", v23, 10, @"%@ is not a document", v27);
          *(_DWORD *)buf = 138412802;
          uint64_t v51 = v26;
          __int16 v52 = 2112;
          __int16 v53 = v28;
          __int16 v54 = 2112;
          uint64_t v55 = v20;
          _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);

          unint64_t v24 = 0x1E4F28000uLL;
        }

        __int16 v29 = *(void **)(v24 + 3160);
        uint64_t v30 = *(void *)(a1 + 48);
        uint64_t v31 = [*(id *)(a1 + 40) path];
        objc_msgSend(v29, "br_errorWithDomain:code:description:", v23, 10, @"%@ is not a document", v31);
      double v41 = };
      (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v41);
    }
    else
    {
      __int16 v42 = brc_bread_crumbs();
      id v43 = brc_default_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        uint64_t v44 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v45 = *(void *)(a1 + 32);
        uint64_t v46 = [*(id *)(a1 + 40) path];
        unsigned int v47 = objc_msgSend(v44, "brc_errorItemNotFound:", v46);
        *(_DWORD *)buf = 138412802;
        uint64_t v51 = v45;
        __int16 v52 = 2112;
        __int16 v53 = v47;
        __int16 v54 = 2112;
        uint64_t v55 = v42;
        _os_log_impl(&dword_1D353B000, v43, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      __int16 v48 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = *(void *)(a1 + 48);
      uint64_t v12 = [*(id *)(a1 + 40) path];
      uint64_t v31 = objc_msgSend(v48, "brc_errorItemNotFound:", v12);
      (*(void (**)(uint64_t, void *))(v49 + 16))(v49, v31);
    }

LABEL_22:
  }
}

- (void)capabilityWhenTryingToReparentItemAtURL:(id)a3 toNewParent:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) capabilityWhenTryingToReparentItemAtURL:toNewParent:reply:]", 1188, v25);
  uint64_t v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v25[0];
    qos_class_t v14 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    char v16 = [v8 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v27 = v13;
    __int16 v28 = 2112;
    __int16 v29 = self;
    __int16 v30 = 2112;
    id v31 = v15;
    __int16 v32 = 2080;
    uint64_t v33 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) capabilityWhenTryingToReparentItemAtURL:toNewParent:reply:]";
    __int16 v34 = 2112;
    uint64_t v35 = v16;
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__BRCXPCRegularIPCsClient_LegacyAdditions__capabilityWhenTryingToReparentItemAtURL_toNewParent_reply___block_invoke;
  v20[3] = &unk_1E6999840;
  id v17 = v8;
  id v21 = v17;
  id v18 = v9;
  id v22 = v18;
  uint64_t v23 = self;
  id v19 = v10;
  id v24 = v19;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v17 accessKind:1 dbAccessKind:1 synchronouslyIfPossible:0 handler:v20];

  __brc_leave_section(v25);
}

void __102__BRCXPCRegularIPCsClient_LegacyAdditions__capabilityWhenTryingToReparentItemAtURL_toNewParent_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  memset(v29, 0, sizeof(v29));
  __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) capabilityWhenTryingToReparentItemAtURL:toNewParent:reply:]_block_invoke", 1178, v29);
  int v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = v29[0];
    uint64_t v26 = [*(id *)(a1 + 32) path];
    uint64_t v27 = [*(id *)(a1 + 40) path];
    *(_DWORD *)buf = 134218754;
    uint64_t v31 = v25;
    __int16 v32 = 2112;
    *(void *)uint64_t v33 = v26;
    *(_WORD *)&v33[8] = 2112;
    *(void *)&v33[10] = v27;
    *(_WORD *)&v33[18] = 2112;
    *(void *)&v33[20] = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx getting move status to reparent %@ to %@%@", buf, 0x2Au);
  }
  if (v6)
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = objc_msgSend(v6, "brc_wrappedError");
      *(_DWORD *)buf = 138413058;
      uint64_t v31 = v11;
      __int16 v32 = 1024;
      *(_DWORD *)uint64_t v33 = 1;
      *(_WORD *)&v33[4] = 2112;
      *(void *)&v33[6] = v12;
      *(_WORD *)&v33[14] = 2112;
      *(void *)&v33[16] = v9;
      _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }
    uint64_t v13 = *(void *)(a1 + 56);
    qos_class_t v14 = objc_msgSend(v6, "brc_wrappedError");
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, 1, v14);
  }
  else
  {
    qos_class_t v14 = +[BRCDaemonContainerHelper sharedHelper];
    uint64_t v15 = *(void *)(a1 + 40);
    char v16 = [v5 session];
    id v28 = 0;
    uint64_t v17 = objc_msgSend(v14, "br_capabilityToMoveFromLookup:toNewParent:session:error:", v5, v15, v16, &v28);
    id v18 = v28;

    id v19 = brc_bread_crumbs();
    qos_class_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(a1 + 48);
      id v22 = objc_msgSend(v18, "brc_wrappedError");
      *(_DWORD *)buf = 138413058;
      uint64_t v31 = v21;
      __int16 v32 = 1024;
      *(_DWORD *)uint64_t v33 = v17;
      *(_WORD *)&v33[4] = 2112;
      *(void *)&v33[6] = v22;
      *(_WORD *)&v33[14] = 2112;
      *(void *)&v33[16] = v19;
      _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }
    uint64_t v23 = *(void *)(a1 + 56);
    id v24 = objc_msgSend(v18, "brc_wrappedError");
    (*(void (**)(uint64_t, uint64_t, void *))(v23 + 16))(v23, v17, v24);
  }
  __brc_leave_section(v29);
}

- (void)boostFilePresenterAtURL:(id)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) boostFilePresenterAtURL:reply:]", 1205, v17);
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v17[0];
    qos_class_t v11 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v6 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2080;
    uint64_t v25 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) boostFilePresenterAtURL:reply:]";
    __int16 v26 = 2112;
    uint64_t v27 = v13;
    __int16 v28 = 2112;
    __int16 v29 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__BRCXPCRegularIPCsClient_LegacyAdditions__boostFilePresenterAtURL_reply___block_invoke;
  v15[3] = &unk_1E69998E0;
  v15[4] = self;
  id v14 = v7;
  id v16 = v14;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v6 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v15];

  __brc_leave_section(v17);
}

void __74__BRCXPCRegularIPCsClient_LegacyAdditions__boostFilePresenterAtURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
      int v20 = 138412802;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v20, 0x20u);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = objc_msgSend(v6, "brc_wrappedError");
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
  else
  {
    uint64_t v13 = [v5 byIDLocalItem];
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v5 faultedLocalItem];
    }
    id v12 = v15;

    id v16 = [v12 appLibrary];
    if (v16) {
      [*(id *)(a1 + 32) addAppLibrary:v16];
    }
    uint64_t v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      int v20 = 138412802;
      uint64_t v21 = v19;
      __int16 v22 = 2112;
      id v23 = 0;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v20, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getPublishedURLForItemAtURL:(id)a3 forStreaming:(BOOL)a4 requestedTTL:(unint64_t)a5 reply:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  void v30[2] = __104__BRCXPCRegularIPCsClient_LegacyAdditions__getPublishedURLForItemAtURL_forStreaming_requestedTTL_reply___block_invoke;
  v30[3] = &unk_1E6999908;
  id v12 = v10;
  id v31 = v12;
  __int16 v32 = self;
  id v13 = v11;
  id v33 = v13;
  id v14 = (void *)MEMORY[0x1D94389C0](v30);
  memset(v29, 0, sizeof(v29));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getPublishedURLForItemAtURL:forStreaming:requestedTTL:reply:]", 1244, v29);
  id v15 = brc_bread_crumbs();
  id v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v23 = v14;
    BOOL v24 = a4;
    unint64_t v17 = a5;
    uint64_t v18 = v29[0];
    qos_class_t v19 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v19, (uint64_t)&brc_qos_entries, 0);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v12 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v35 = v18;
    __int16 v36 = 2112;
    uint64_t v37 = self;
    __int16 v38 = 2112;
    id v39 = v20;
    __int16 v40 = 2080;
    double v41 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getPublishedURLForItemAtURL:forStreaming:requestedTTL:reply:]";
    __int16 v42 = 2112;
    id v43 = v21;
    __int16 v44 = 2112;
    uint64_t v45 = v15;
    _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

    a5 = v17;
    a4 = v24;
    id v14 = v23;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __104__BRCXPCRegularIPCsClient_LegacyAdditions__getPublishedURLForItemAtURL_forStreaming_requestedTTL_reply___block_invoke_98;
  uint64_t v25[3] = &unk_1E6999930;
  BOOL v28 = a4;
  void v25[4] = self;
  unint64_t v27 = a5;
  id v22 = v14;
  id v26 = v22;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v12 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v25];

  __brc_leave_section(v29);
}

void __104__BRCXPCRegularIPCsClient_LegacyAdditions__getPublishedURLForItemAtURL_forStreaming_requestedTTL_reply___block_invoke(uint64_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7 || !v8 || v9)
  {
    if (v9)
    {
      if ([v9 code] == 5)
      {
        id v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = a1[4];
        id v13 = [v10 userInfo];
        id v14 = [v13 objectForKey:*MEMORY[0x1E4F28A50]];
        uint64_t v15 = objc_msgSend(v11, "brc_errorNoDocumentAtURL:underlyingError:", v12, v14);

LABEL_10:
        id v10 = (void *)v15;
        goto LABEL_11;
      }
      if ([v10 code] == 7)
      {
        id v16 = (void *)MEMORY[0x1E4F28C58];
        unint64_t v17 = [(id)a1[4] path];
        uint64_t v15 = objc_msgSend(v16, "brc_errorNotInCloud:", v17);

        goto LABEL_10;
      }
    }
    else
    {
      id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 15, @"Publish failed but no error was set");
    }
LABEL_11:

    id v8 = 0;
    id v7 = 0;
  }
  uint64_t v18 = brc_bread_crumbs();
  qos_class_t v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = a1[5];
    uint64_t v21 = objc_msgSend(v10, "brc_wrappedError");
    int v24 = 138413314;
    uint64_t v25 = v20;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v21;
    __int16 v32 = 2112;
    id v33 = v18;
    _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v24, 0x34u);
  }
  uint64_t v22 = a1[6];
  id v23 = objc_msgSend(v10, "brc_wrappedError");
  (*(void (**)(uint64_t, id, id, void *))(v22 + 16))(v22, v7, v8, v23);
}

void __104__BRCXPCRegularIPCsClient_LegacyAdditions__getPublishedURLForItemAtURL_forStreaming_requestedTTL_reply___block_invoke_98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 byIDLocalItem];
    if (!v7)
    {
      id v7 = [v5 faultedLocalItem];
      if (!v7)
      {
        id v8 = brc_bread_crumbs();
        id v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __104__BRCXPCRegularIPCsClient_LegacyAdditions__getPublishedURLForItemAtURL_forStreaming_requestedTTL_reply___block_invoke_98_cold_1();
        }

        id v7 = 0;
      }
    }
    [*(id *)(a1 + 32) _getPublishedURLForLocalItem:v7 forStreaming:*(unsigned __int8 *)(a1 + 56) requestedTTL:*(void *)(a1 + 48) reply:*(void *)(a1 + 40)];
  }
  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getAttributeValues:(id)a3 forItemAtURL:(id)a4 reply:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getAttributeValues:forItemAtURL:reply:]", 1305, v24);
  id v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v24[0];
    qos_class_t v14 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = [v9 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    __int16 v28 = self;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getAttributeValues:forItemAtURL:reply:]";
    __int16 v33 = 2112;
    uint64_t v34 = v16;
    __int16 v35 = 2112;
    __int16 v36 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__BRCXPCRegularIPCsClient_LegacyAdditions__getAttributeValues_forItemAtURL_reply___block_invoke;
  v20[3] = &unk_1E6999840;
  void v20[4] = self;
  id v17 = v8;
  id v21 = v17;
  id v18 = v9;
  id v22 = v18;
  id v19 = v10;
  id v23 = v19;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v18 accessKind:1 dbAccessKind:1 synchronouslyIfPossible:0 handler:v20];

  __brc_leave_section(v24);
}

void __82__BRCXPCRegularIPCsClient_LegacyAdditions__getAttributeValues_forItemAtURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) _removeSandboxedAttributes:*(void *)(a1 + 40)];
    id v8 = objc_msgSend(*(id *)(a1 + 48), "brc_attributesValues:lookup:", v7, v5);

    id v9 = [*(id *)(a1 + 32) clientPriviledgesDescriptor];
    id v10 = [v9 applicationIdentifier];
    int v11 = [v10 isEqualToString:@"com.apple.finder"];

    if (v11)
    {
      uint64_t v12 = [v5 byIDLocalItem];
      uint64_t v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [v5 faultedLocalItem];
      }
      id v15 = v14;

      id v16 = [v5 relpath];
      if (!v15
        || ([v15 isZoneRoot] & 1) != 0
        || ([v15 isDead] & 1) != 0
        || ([v15 isReserved] & 1) != 0)
      {
        id v17 = 0;
      }
      else
      {
        id v17 = +[BRCNotification notificationFromItem:v15 relpath:v16];
        if ([v17 isDirectory])
        {
          uint64_t v24 = [v17 mtime];
          if (v24)
          {
            uint64_t v25 = (void *)v24;
            uint64_t v26 = [v17 mtime];
            uint64_t v30 = [v26 longLongValue];
            uint64_t v27 = [v16 modificationTime];

            if (v30 != v27)
            {
              __int16 v28 = *(void **)(a1 + 32);
              __int16 v29 = [v17 mtime];
              objc_msgSend(v28, "_updateDirectoryMtime:onDisk:", objc_msgSend(v29, "longValue"), v16);
            }
          }
        }
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  id v18 = brc_bread_crumbs();
  id v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = objc_msgSend(v6, "brc_wrappedError");
    *(_DWORD *)buf = 138413058;
    uint64_t v32 = v20;
    __int16 v33 = 2112;
    uint64_t v34 = v8;
    __int16 v35 = 2112;
    __int16 v36 = v21;
    __int16 v37 = 2112;
    __int16 v38 = v18;
    _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }
  uint64_t v22 = *(void *)(a1 + 56);
  id v23 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *))(v22 + 16))(v22, v8, v23);
}

- (void)getiWorkPublishingInfoAtURL:(id)a3 reply:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getiWorkPublishingInfoAtURL:reply:]", 1312, v27);
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v27[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    __int16 v31 = self;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getiWorkPublishingInfoAtURL:reply:]";
    __int16 v36 = 2112;
    __int16 v37 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = (void *)*MEMORY[0x1E4F592A0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __78__BRCXPCRegularIPCsClient_LegacyAdditions__getiWorkPublishingInfoAtURL_reply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v14 = v7;
  id v26 = v14;
  LODWORD(v13) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v13, v25);

  if (v13)
  {
    memset(v24, 0, sizeof(v24));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getiWorkPublishingInfoAtURL:reply:]", 1323, v24);
    id v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v24[0];
      qos_class_t v18 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v6 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v29 = v17;
      __int16 v30 = 2112;
      __int16 v31 = self;
      __int16 v32 = 2112;
      id v33 = v19;
      __int16 v34 = 2080;
      __int16 v35 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getiWorkPublishingInfoAtURL:reply:]";
      __int16 v36 = 2112;
      __int16 v37 = v20;
      __int16 v38 = 2112;
      uint64_t v39 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78__BRCXPCRegularIPCsClient_LegacyAdditions__getiWorkPublishingInfoAtURL_reply___block_invoke_102;
    uint64_t v21[3] = &unk_1E69997C8;
    v21[4] = self;
    id v23 = v14;
    id v22 = v6;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v22 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v21];

    __brc_leave_section(v24);
  }
  __brc_leave_section(v27);
}

void __78__BRCXPCRegularIPCsClient_LegacyAdditions__getiWorkPublishingInfoAtURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413570;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 1024;
    int v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    qos_class_t v18 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", (uint8_t *)&v7, 0x36u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __78__BRCXPCRegularIPCsClient_LegacyAdditions__getiWorkPublishingInfoAtURL_reply___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v16 = 138413570;
      uint64_t v17 = v9;
      __int16 v18 = 1024;
      int v19 = 0;
      __int16 v20 = 1024;
      int v21 = 0;
      __int16 v22 = 2112;
      uint64_t v23 = 0;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      uint64_t v27 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", (uint8_t *)&v16, 0x36u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v10 = [v5 byIDLocalItem];
    __int16 v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v5 faultedLocalItem];
    }
    __int16 v13 = v12;

    uint64_t v14 = *(void **)(a1 + 32);
    __int16 v15 = [*(id *)(a1 + 40) path];
    [v14 _getiWorkPublishingInfoForLocalItem:v13 itemIdentifier:v15 reply:*(void *)(a1 + 48)];
  }
}

- (void)setiWorkPublishingInfoAtURL:(id)a3 publish:(BOOL)a4 readonly:(BOOL)a5 reply:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  memset(v36, 0, sizeof(v36));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) setiWorkPublishingInfoAtURL:publish:readonly:reply:]", 1330, v36);
  id v12 = brc_bread_crumbs();
  __int16 v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = v10;
    BOOL v15 = a4;
    uint64_t v16 = v36[0];
    qos_class_t v17 = qos_class_self();
    __int16 v18 = BRCPrettyPrintEnumWithContext(v17, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v38 = v16;
    __int16 v39 = 2112;
    uint64_t v40 = self;
    __int16 v41 = 2112;
    id v42 = v18;
    __int16 v43 = 2080;
    __int16 v44 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) setiWorkPublishingInfoAtURL:publish:readonly:reply:]";
    __int16 v45 = 2112;
    uint64_t v46 = v12;
    _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    a4 = v15;
    id v10 = v14;
  }

  int v19 = (void *)*MEMORY[0x1E4F592A0];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __95__BRCXPCRegularIPCsClient_LegacyAdditions__setiWorkPublishingInfoAtURL_publish_readonly_reply___block_invoke;
  uint64_t v34[3] = &unk_1E69957B0;
  v34[4] = self;
  id v20 = v11;
  id v35 = v20;
  LODWORD(v19) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v19, v34);

  if (v19)
  {
    memset(v33, 0, sizeof(v33));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) setiWorkPublishingInfoAtURL:publish:readonly:reply:]", 1343, v33);
    int v21 = brc_bread_crumbs();
    __int16 v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      BOOL v27 = a4;
      uint64_t v23 = v33[0];
      qos_class_t v24 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v24, (uint64_t)&brc_qos_entries, 0);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v26 = [v10 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v38 = v23;
      __int16 v39 = 2112;
      uint64_t v40 = self;
      __int16 v41 = 2112;
      id v42 = v25;
      __int16 v43 = 2080;
      __int16 v44 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) setiWorkPublishingInfoAtURL:publish:readonly:reply:]";
      __int16 v45 = 2112;
      uint64_t v46 = v26;
      __int16 v47 = 2112;
      __int16 v48 = v21;
      _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      a4 = v27;
    }

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __95__BRCXPCRegularIPCsClient_LegacyAdditions__setiWorkPublishingInfoAtURL_publish_readonly_reply___block_invoke_103;
    uint64_t v28[3] = &unk_1E6999958;
    v28[4] = self;
    id v30 = v20;
    id v29 = v10;
    BOOL v31 = a4;
    BOOL v32 = a5;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v29 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v28];

    __brc_leave_section(v33);
  }
  __brc_leave_section(v36);
}

void __95__BRCXPCRegularIPCsClient_LegacyAdditions__setiWorkPublishingInfoAtURL_publish_readonly_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __95__BRCXPCRegularIPCsClient_LegacyAdditions__setiWorkPublishingInfoAtURL_publish_readonly_reply___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = objc_msgSend(v6, "brc_wrappedError");
      int v18 = 138412802;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      int v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v18, 0x20u);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_msgSend(v6, "brc_wrappedError");
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
  else
  {
    uint64_t v13 = [v5 byIDLocalItem];
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v5 faultedLocalItem];
    }
    id v12 = v15;

    uint64_t v16 = *(void **)(a1 + 32);
    qos_class_t v17 = [*(id *)(a1 + 40) path];
    [v16 _setiWorkPublishingInfoForLocalItem:v12 itemIdentifier:v17 publish:*(unsigned __int8 *)(a1 + 56) readonly:*(unsigned __int8 *)(a1 + 57) reply:*(void *)(a1 + 48)];
  }
}

- (void)getiWorkPublishingBadgingStatusAtURL:(id)a3 reply:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getiWorkPublishingBadgingStatusAtURL:reply:]", 1350, v27);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v27[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    BOOL v31 = self;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2080;
    id v35 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getiWorkPublishingBadgingStatusAtURL:reply:]";
    __int16 v36 = 2112;
    __int16 v37 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = (void *)*MEMORY[0x1E4F592A0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __87__BRCXPCRegularIPCsClient_LegacyAdditions__getiWorkPublishingBadgingStatusAtURL_reply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v14 = v7;
  id v26 = v14;
  LODWORD(v13) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v13, v25);

  if (v13)
  {
    memset(v24, 0, sizeof(v24));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getiWorkPublishingBadgingStatusAtURL:reply:]", 1361, v24);
    id v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v24[0];
      qos_class_t v18 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v20 = [v6 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v29 = v17;
      __int16 v30 = 2112;
      BOOL v31 = self;
      __int16 v32 = 2112;
      id v33 = v19;
      __int16 v34 = 2080;
      id v35 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getiWorkPublishingBadgingStatusAtURL:reply:]";
      __int16 v36 = 2112;
      __int16 v37 = v20;
      __int16 v38 = 2112;
      __int16 v39 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __87__BRCXPCRegularIPCsClient_LegacyAdditions__getiWorkPublishingBadgingStatusAtURL_reply___block_invoke_104;
    uint64_t v21[3] = &unk_1E69997C8;
    v21[4] = self;
    id v23 = v14;
    id v22 = v6;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v22 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v21];

    __brc_leave_section(v24);
  }
  __brc_leave_section(v27);
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__getiWorkPublishingBadgingStatusAtURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__getiWorkPublishingBadgingStatusAtURL_reply___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v16 = 138413058;
      uint64_t v17 = v9;
      __int16 v18 = 1024;
      int v19 = 0;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v16, 0x26u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v10 = [v5 byIDLocalItem];
    __int16 v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v5 faultedLocalItem];
    }
    __int16 v13 = v12;

    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = [*(id *)(a1 + 40) path];
    [v14 _getiWorkPublishingBadgingStatusForLocalItem:v13 itemIdentifier:v15 reply:*(void *)(a1 + 48)];
  }
}

- (void)getiWorkNeedsShareMigrateAtURL:(id)a3 reply:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getiWorkNeedsShareMigrateAtURL:reply:]", 1368, v27);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v27[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    BOOL v31 = self;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2080;
    id v35 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getiWorkNeedsShareMigrateAtURL:reply:]";
    __int16 v36 = 2112;
    __int16 v37 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v13 = (void *)*MEMORY[0x1E4F592A0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__BRCXPCRegularIPCsClient_LegacyAdditions__getiWorkNeedsShareMigrateAtURL_reply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v14 = v7;
  id v26 = v14;
  LODWORD(v13) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v13, v25);

  if (v13)
  {
    memset(v24, 0, sizeof(v24));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getiWorkNeedsShareMigrateAtURL:reply:]", 1379, v24);
    uint64_t v15 = brc_bread_crumbs();
    int v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v24[0];
      qos_class_t v18 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v20 = [v6 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v29 = v17;
      __int16 v30 = 2112;
      BOOL v31 = self;
      __int16 v32 = 2112;
      id v33 = v19;
      __int16 v34 = 2080;
      id v35 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getiWorkNeedsShareMigrateAtURL:reply:]";
      __int16 v36 = 2112;
      __int16 v37 = v20;
      __int16 v38 = 2112;
      __int16 v39 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __81__BRCXPCRegularIPCsClient_LegacyAdditions__getiWorkNeedsShareMigrateAtURL_reply___block_invoke_105;
    uint64_t v21[3] = &unk_1E69997C8;
    v21[4] = self;
    id v23 = v14;
    id v22 = v6;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v22 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v21];

    __brc_leave_section(v24);
  }
  __brc_leave_section(v27);
}

void __81__BRCXPCRegularIPCsClient_LegacyAdditions__getiWorkNeedsShareMigrateAtURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__BRCXPCRegularIPCsClient_LegacyAdditions__getiWorkNeedsShareMigrateAtURL_reply___block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v16 = 138413058;
      uint64_t v17 = v9;
      __int16 v18 = 1024;
      int v19 = 0;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v16, 0x26u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v10 = [v5 byIDLocalItem];
    __int16 v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v5 faultedLocalItem];
    }
    __int16 v13 = v12;

    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = [*(id *)(a1 + 40) path];
    [v14 _getiWorkNeedsShareMigrateForLocalItem:v13 itemIdentifier:v15 reply:*(void *)(a1 + 48)];
  }
}

- (void)getURLForItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v31, 0, sizeof(v31));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getURLForItemIdentifier:reply:]", 1386, v31);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v31[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v33 = v10;
    __int16 v34 = 2112;
    id v35 = self;
    __int16 v36 = 2112;
    __int16 v37 = v12;
    __int16 v38 = 2080;
    __int16 v39 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getURLForItemIdentifier:reply:]";
    __int16 v40 = 2112;
    id v41 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __74__BRCXPCRegularIPCsClient_LegacyAdditions__getURLForItemIdentifier_reply___block_invoke;
  uint64_t v29[3] = &unk_1E69957B0;
  v29[4] = self;
  id v13 = v7;
  id v30 = v13;
  int v14 = _brc_ipc_check_applibrary_proxy(self, 1, v29);

  if (v14)
  {
    memset(v28, 0, sizeof(v28));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getURLForItemIdentifier:reply:]", 1388, v28);
    uint64_t v15 = brc_bread_crumbs();
    int v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v28[0];
      qos_class_t v18 = qos_class_self();
      int v19 = BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      uint64_t v33 = v17;
      __int16 v34 = 2112;
      id v35 = self;
      __int16 v36 = 2112;
      __int16 v37 = v19;
      __int16 v38 = 2080;
      __int16 v39 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getURLForItemIdentifier:reply:]";
      __int16 v40 = 2112;
      id v41 = v6;
      __int16 v42 = 2112;
      __int16 v43 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s Getting url for %@%@", buf, 0x3Eu);
    }
    __int16 v20 = [(BRCXPCClient *)self session];
    id v21 = [v20 clientTruthWorkloop];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __74__BRCXPCRegularIPCsClient_LegacyAdditions__getURLForItemIdentifier_reply___block_invoke_106;
    v23[3] = &unk_1E6993D18;
    id v24 = v6;
    id v25 = v20;
    id v26 = self;
    id v27 = v13;
    id v22 = v20;
    dispatch_async(v21, v23);

    __brc_leave_section(v28);
  }
  __brc_leave_section(v31);
}

void __74__BRCXPCRegularIPCsClient_LegacyAdditions__getURLForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74__BRCXPCRegularIPCsClient_LegacyAdditions__getURLForItemIdentifier_reply___block_invoke_106(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F594D0] fileObjectIDWithString:a1[4]];
  int v3 = [v2 isDocumentID];
  id v4 = (void *)a1[5];
  if (v3)
  {
    id v5 = [v2 documentID];
    objc_msgSend(v4, "globalItemByDocumentID:", objc_msgSend(v5, "longLongValue"));
  }
  else
  {
    id v5 = [v2 folderID];
    objc_msgSend(v4, "globalItemByFileID:", objc_msgSend(v5, "longLongValue"));
  uint64_t v6 = };

  if (v6
    && (int v7 = [[BRCItemToPathLookup alloc] initWithItem:v6],
        [(BRCItemToPathLookup *)v7 coordinatedReadURL],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [(BRCItemToPathLookup *)v7 closePaths],
        v7,
        v8))
  {
    __int16 v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = a1[6];
      int v18 = 138413058;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = 0;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v18, 0x2Au);
    }

    id v12 = *(void (**)(void))(a1[7] + 16);
  }
  else
  {
    __int16 v13 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = a1[6];
      int v16 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", a1[4]);
      int v18 = 138413058;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      id v21 = 0;
      __int16 v22 = 2112;
      id v23 = v16;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v18, 0x2Au);
    }
    uint64_t v17 = a1[7];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", a1[4]);
    id v12 = *(void (**)(void))(v17 + 16);
  }
  v12();
}

- (void)getNonLocalVersionSenderWithReceiver:(id)a3 documentURL:(id)a4 includeCachedVersions:(BOOL)a5 reply:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  memset(v28, 0, sizeof(v28));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getNonLocalVersionSenderWithReceiver:documentURL:includeCachedVersions:reply:]", 1428, v28);
  __int16 v13 = brc_bread_crumbs();
  int v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v23 = v12;
    id v15 = v10;
    BOOL v16 = a5;
    uint64_t v17 = v28[0];
    qos_class_t v18 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v20 = [v11 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v30 = v17;
    __int16 v31 = 2112;
    __int16 v32 = self;
    __int16 v33 = 2112;
    id v34 = v19;
    __int16 v35 = 2080;
    __int16 v36 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getNonLocalVersionSenderWithReceiver:documentURL:includeCachedVersions:reply:]";
    __int16 v37 = 2112;
    __int16 v38 = v20;
    __int16 v39 = 2112;
    __int16 v40 = v13;
    _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

    a5 = v16;
    id v10 = v15;
    id v12 = v23;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __121__BRCXPCRegularIPCsClient_LegacyAdditions__getNonLocalVersionSenderWithReceiver_documentURL_includeCachedVersions_reply___block_invoke;
  uint64_t v24[3] = &unk_1E6999980;
  v24[4] = self;
  id v21 = v10;
  id v25 = v21;
  BOOL v27 = a5;
  id v22 = v12;
  id v26 = v22;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v11 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v24];

  __brc_leave_section(v28);
}

void __121__BRCXPCRegularIPCsClient_LegacyAdditions__getNonLocalVersionSenderWithReceiver_documentURL_includeCachedVersions_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v17 = v6;
    __int16 v9 = +[BRCNonLocalVersionsSender senderWithLookup:v5 client:v7 XPCReceiver:v8 error:&v17];
    id v10 = v17;

    [v9 setIncludeCachedVersions:*(unsigned __int8 *)(a1 + 56)];
    id v6 = v10;
  }
  else
  {
    __int16 v9 = 0;
  }
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = [v9 physicalURL];
    *(_DWORD *)buf = 138413314;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v14;
    __int16 v24 = 2112;
    id v25 = v6;
    __int16 v26 = 2112;
    BOOL v27 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
  }
  uint64_t v15 = *(void *)(a1 + 48);
  BOOL v16 = [v9 physicalURL];
  (*(void (**)(uint64_t, void *, void *, id))(v15 + 16))(v15, v9, v16, v6);
}

- (void)copyBulkShareIDsAtURLs:(id)a3 reply:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v49, 0, sizeof(v49));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) copyBulkShareIDsAtURLs:reply:]", 1435, v49);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v49[0];
    qos_class_t v11 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    id v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v51 = v12;
    *(_WORD *)__int16 v52 = 2080;
    *(void *)&v52[2] = "-[BRCXPCRegularIPCsClient(LegacyAdditions) copyBulkShareIDsAtURLs:reply:]";
    *(_WORD *)&v52[10] = 2112;
    *(void *)&v52[12] = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v14 = [v13 isSharingPrivateInterfaceEntitled];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __73__BRCXPCRegularIPCsClient_LegacyAdditions__copyBulkShareIDsAtURLs_reply___block_invoke;
  v47[3] = &unk_1E69957B0;
  v47[4] = self;
  id v15 = v7;
  id v48 = v15;
  char v16 = _brc_ipc_check_client_privilege(self, 1, v14, (uint64_t)"isSharingPrivateInterfaceEntitled", v47);

  if (v16)
  {
    id v17 = brc_bread_crumbs();
    qos_class_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient(LegacyAdditions) copyBulkShareIDsAtURLs:reply:]();
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v51 = __Block_byref_object_copy__42;
    *(void *)__int16 v52 = __Block_byref_object_dispose__42;
    *(void *)&v52[8] = 0;
    uint64_t v19 = objc_opt_new();
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    uint64_t v45[3] = __Block_byref_object_copy__42;
    v45[4] = __Block_byref_object_dispose__42;
    id v46 = v6;
    __int16 v20 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v21 = [v20 copyShareIDsBatchSize];

    __int16 v22 = [(BRCXPCClient *)self session];
    id v23 = [v22 clientTruthWorkloop];

    uint64_t v39 = 0;
    __int16 v40 = (id *)&v39;
    uint64_t v41 = 0x3042000000;
    __int16 v42 = __Block_byref_object_copy__111;
    __int16 v43 = __Block_byref_object_dispose__112;
    id v44 = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __73__BRCXPCRegularIPCsClient_LegacyAdditions__copyBulkShareIDsAtURLs_reply___block_invoke_113;
    uint64_t v31[3] = &unk_1E69999D0;
    __int16 v35 = v45;
    v31[4] = self;
    uint64_t v38 = v21;
    __int16 v36 = buf;
    id v24 = v19;
    id v32 = v24;
    id v25 = v23;
    id v33 = v25;
    __int16 v37 = &v39;
    id v26 = v15;
    id v34 = v26;
    BOOL v27 = (void *)MEMORY[0x1D94389C0](v31);
    objc_storeWeak(v40 + 5, v27);
    tracker = self->super._tracker;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __73__BRCXPCRegularIPCsClient_LegacyAdditions__copyBulkShareIDsAtURLs_reply___block_invoke_115;
    uint64_t v29[3] = &unk_1E6994600;
    v29[4] = self;
    id v30 = v26;
    brc_task_tracker_async_with_logs(tracker, v25, v27, v29);

    _Block_object_dispose(&v39, 8);
    objc_destroyWeak(&v44);

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(buf, 8);
  }
  __brc_leave_section(v49);
}

void __73__BRCXPCRegularIPCsClient_LegacyAdditions__copyBulkShareIDsAtURLs_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__BRCXPCRegularIPCsClient_LegacyAdditions__copyBulkShareIDsAtURLs_reply___block_invoke_113(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
  unint64_t v3 = *(void *)(a1 + 88);
  if (v2 < v3) {
    unint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
  }
  id v4 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "subarrayWithRange:", 0, v3);
  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "subarrayWithRange:", v3, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "count") - v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * v12);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __73__BRCXPCRegularIPCsClient_LegacyAdditions__copyBulkShareIDsAtURLs_reply___block_invoke_2;
        uint64_t v25[3] = &unk_1E69999A8;
        uint64_t v27 = *(void *)(a1 + 72);
        void v25[4] = v13;
        char v14 = *(void **)(a1 + 32);
        id v26 = *(id *)(a1 + 40);
        [v14 accessLogicalOrPhysicalURL:v13 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:1 handler:v25];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v10);
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 8);
    char v16 = *(void **)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__BRCXPCRegularIPCsClient_LegacyAdditions__copyBulkShareIDsAtURLs_reply___block_invoke_3;
    v23[3] = &unk_1E6994600;
    void v23[4] = *(void *)(a1 + 32);
    id v24 = *(id *)(a1 + 56);
    brc_task_tracker_async_with_logs(v15, v16, WeakRetained, v23);
  }
  else
  {
    qos_class_t v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138413058;
      uint64_t v33 = v20;
      __int16 v34 = 2112;
      uint64_t v35 = v21;
      __int16 v36 = 2112;
      uint64_t v37 = v22;
      __int16 v38 = 2112;
      uint64_t v39 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __73__BRCXPCRegularIPCsClient_LegacyAdditions__copyBulkShareIDsAtURLs_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v17 = a2;
  unint64_t v3 = [v17 byIDLocalItem];
  if (v3 || ([v17 faultedLocalItem], (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (![v3 isDocument] || objc_msgSend(v3, "isFinderBookmark"))
    {
      id v4 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v5 = [*(id *)(a1 + 32) path];
      uint64_t v6 = objc_msgSend(v4, "brc_errorNoDocument:underlyingPOSIXError:", v5, 21);
LABEL_6:
      int v7 = (void *)v6;
      uint64_t v8 = objc_msgSend(v4, "brc_addPartialError:forURL:toError:", v6, *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      goto LABEL_7;
    }
    if (([v3 isKnownByServer] & 1) == 0)
    {
      id v4 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v5 = [*(id *)(a1 + 32) path];
      uint64_t v6 = objc_msgSend(v4, "brc_errorNotInCloud:", v5);
      goto LABEL_6;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v12 = [v3 asShareableItem];
    uint64_t v5 = (void *)[v11 initShareIDWithShareableItem:v12];

    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    unint64_t v3 = [*(id *)(a1 + 32) path];
    uint64_t v5 = objc_msgSend(v13, "brc_errorNoDocument:underlyingPOSIXError:", v3, 2);
    uint64_t v14 = objc_msgSend(v13, "brc_addPartialError:forURL:toError:", v5, *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    char v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
LABEL_7:
}

void __73__BRCXPCRegularIPCsClient_LegacyAdditions__copyBulkShareIDsAtURLs_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = brc_bread_crumbs();
  unint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

void __73__BRCXPCRegularIPCsClient_LegacyAdditions__copyBulkShareIDsAtURLs_reply___block_invoke_115(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = brc_bread_crumbs();
  unint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)getCreatorNameComponentsForURL:(id)a3 reply:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getCreatorNameComponentsForURL:reply:]", 1490, v27);
  int v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v27[0];
    qos_class_t v11 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = [v6 path];
    uint64_t v14 = [v13 UTF8String];
    *(_DWORD *)buf = 134219266;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    long long v31 = self;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2080;
    uint64_t v35 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getCreatorNameComponentsForURL:reply:]";
    __int16 v36 = 2080;
    uint64_t v37 = v14;
    __int16 v38 = 2112;
    uint64_t v39 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s Getting creator name for %s%@", buf, 0x3Eu);
  }
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getCreatorNameComponentsForURL:reply:]", 1503, v26);
  uint64_t v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = v26[0];
    qos_class_t v18 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v6 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v29 = v17;
    __int16 v30 = 2112;
    long long v31 = self;
    __int16 v32 = 2112;
    id v33 = v19;
    __int16 v34 = 2080;
    uint64_t v35 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getCreatorNameComponentsForURL:reply:]";
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v20;
    __int16 v38 = 2112;
    uint64_t v39 = v15;
    _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__BRCXPCRegularIPCsClient_LegacyAdditions__getCreatorNameComponentsForURL_reply___block_invoke;
  v23[3] = &unk_1E69997C8;
  void v23[4] = self;
  id v21 = v7;
  id v25 = v21;
  id v22 = v6;
  id v24 = v22;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v22 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v23];

  __brc_leave_section(v26);
  __brc_leave_section(v27);
}

void __81__BRCXPCRegularIPCsClient_LegacyAdditions__getCreatorNameComponentsForURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v27 = 138413058;
      uint64_t v28 = v9;
      __int16 v29 = 2112;
      __int16 v30 = 0;
      __int16 v31 = 2112;
      id v32 = v6;
      __int16 v33 = 2112;
      __int16 v34 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v27, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v10 = [v5 byIDLocalItem];
    if (v10 || ([v5 faultedLocalItem], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      qos_class_t v11 = [v10 st];
      id v12 = [v11 creatorRowID];
      id v13 = [v10 db];
      uint64_t v14 = +[BRCAccountSession nameComponentsForKey:v12 db:v13];

      uint64_t v15 = brc_bread_crumbs();
      uint64_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v27 = 138413058;
        uint64_t v28 = v17;
        __int16 v29 = 2112;
        __int16 v30 = v14;
        __int16 v31 = 2112;
        id v32 = 0;
        __int16 v33 = 2112;
        __int16 v34 = v15;
        _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v27, 0x2Au);
      }

      qos_class_t v18 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      id v19 = brc_bread_crumbs();
      uint64_t v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *(void *)(a1 + 32);
        id v23 = [*(id *)(a1 + 40) path];
        id v24 = objc_msgSend(v21, "brc_errorItemNotFound:", v23);
        int v27 = 138413058;
        uint64_t v28 = v22;
        __int16 v29 = 2112;
        __int16 v30 = 0;
        __int16 v31 = 2112;
        id v32 = v24;
        __int16 v33 = 2112;
        __int16 v34 = v19;
        _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v27, 0x2Au);
      }
      id v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *(void *)(a1 + 48);
      uint64_t v10 = [*(id *)(a1 + 40) path];
      uint64_t v14 = objc_msgSend(v25, "brc_errorItemNotFound:", v10);
      qos_class_t v18 = *(void (**)(void))(v26 + 16);
    }
    v18();
  }
}

- (void)startOperation:(id)a3 toDownloadItemAtURL:(id)a4 readingOptions:(unint64_t)a5 wantsCurrentVersion:(BOOL)a6 reply:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  memset(v35, 0, sizeof(v35));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toDownloadItemAtURL:readingOptions:wantsCurrentVersion:reply:]", 1531, v35);
  uint64_t v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v26 = v14;
    id v17 = v13;
    id v18 = v12;
    unint64_t v19 = a5;
    BOOL v20 = a6;
    uint64_t v21 = v35[0];
    qos_class_t v22 = qos_class_self();
    id v23 = BRCPrettyPrintEnumWithContext(v22, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v37 = v21;
    __int16 v38 = 2112;
    uint64_t v39 = self;
    __int16 v40 = 2112;
    uint64_t v41 = v23;
    __int16 v42 = 2080;
    __int16 v43 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) startOperation:toDownloadItemAtURL:readingOptions:wantsCurrentVersion:reply:]";
    __int16 v44 = 2112;
    __int16 v45 = v15;
    _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    a6 = v20;
    a5 = v19;
    id v12 = v18;
    id v13 = v17;
    id v14 = v26;
  }

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __120__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toDownloadItemAtURL_readingOptions_wantsCurrentVersion_reply___block_invoke;
  uint64_t v33[3] = &unk_1E69957B0;
  v33[4] = self;
  id v24 = v14;
  id v34 = v24;
  int v25 = _brc_ipc_check_applibrary_proxy(self, 1, v33);

  if (v25)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __120__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toDownloadItemAtURL_readingOptions_wantsCurrentVersion_reply___block_invoke_117;
    uint64_t v27[3] = &unk_1E6999A20;
    void v27[4] = self;
    id v30 = v24;
    id v28 = v13;
    unint64_t v31 = a5;
    BOOL v32 = a6;
    id v29 = v12;
    [(BRCXPCClient *)self performBlock:v27 withSessionFromURL:v28];
  }
  __brc_leave_section(v35);
}

void __120__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toDownloadItemAtURL_readingOptions_wantsCurrentVersion_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __120__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toDownloadItemAtURL_readingOptions_wantsCurrentVersion_reply___block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      qos_class_t v22 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v10 = [[BRCFileProvidingRequestOperation alloc] initWithURL:*(void *)(a1 + 40) readingOptions:*(void *)(a1 + 64) client:*(void *)(a1 + 32) session:v5];
    [(BRCFileProvidingRequestOperation *)v10 setWantsCurrentVersion:*(unsigned __int8 *)(a1 + 72)];
    [(_BRCFrameworkOperation *)v10 setRemoteClientProxy:*(void *)(a1 + 48)];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __120__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toDownloadItemAtURL_readingOptions_wantsCurrentVersion_reply___block_invoke_119;
    id v14 = &unk_1E69999F8;
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(id *)(a1 + 56);
    [(BRCFileProvidingRequestOperation *)v10 addCompletionCallback:&v11];
    objc_msgSend(*(id *)(a1 + 32), "addOperation:", v10, v11, v12, v13, v14, v15);
  }
}

uint64_t __120__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toDownloadItemAtURL_readingOptions_wantsCurrentVersion_reply___block_invoke_119(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = objc_msgSend(v3, "brc_wrappedError");
    int v11 = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = objc_msgSend(v3, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  return 1;
}

- (void)evictItemAtURL:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  BOOL v8 = a4 == 4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) evictItemAtURL:options:reply:]", 1577, v22);
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    BOOL v18 = v8;
    uint64_t v13 = v22[0];
    qos_class_t v14 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = [v9 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v24 = v13;
    __int16 v25 = 2112;
    id v26 = self;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2080;
    id v30 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) evictItemAtURL:options:reply:]";
    __int16 v31 = 2112;
    BOOL v32 = v16;
    __int16 v33 = 2112;
    id v34 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

    BOOL v8 = v18;
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__BRCXPCRegularIPCsClient_LegacyAdditions__evictItemAtURL_options_reply___block_invoke;
  v19[3] = &unk_1E6999A48;
  void v19[4] = self;
  id v17 = v10;
  id v20 = v17;
  unint64_t v21 = a4;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v9 accessKind:2 * v8 dbAccessKind:0 synchronouslyIfPossible:0 handler:v19];

  __brc_leave_section(v22);
}

void __73__BRCXPCRegularIPCsClient_LegacyAdditions__evictItemAtURL_options_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    BOOL v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = a1[4];
      int v11 = objc_msgSend(v7, "brc_wrappedError");
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      qos_class_t v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
LABEL_9:
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v12 = [v5 byIDLocalItem];
    if (v12 || ([v5 faultedLocalItem], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v13 = *(void *)(a1[4] + 8);
      uint64_t v14 = a1[6];
      id v18 = 0;
      [v12 evictInTask:v13 options:v14 error:&v18];
      id v7 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = a1[4];
      int v11 = objc_msgSend(v7, "brc_wrappedError");
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      qos_class_t v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      goto LABEL_9;
    }
  }

  uint64_t v16 = a1[5];
  id v17 = objc_msgSend(v7, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
}

- (void)thumbnailChangedForItemAtURL:(id)a3 reply:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v19, 0, sizeof(v19));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) thumbnailChangedForItemAtURL:reply:]", 1597, v19);
  BOOL v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v19[0];
    qos_class_t v11 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v6 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    __int16 v23 = self;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2080;
    __int16 v27 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) thumbnailChangedForItemAtURL:reply:]";
    __int16 v28 = 2112;
    __int16 v29 = v13;
    __int16 v30 = 2112;
    __int16 v31 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__BRCXPCRegularIPCsClient_LegacyAdditions__thumbnailChangedForItemAtURL_reply___block_invoke;
  v16[3] = &unk_1E69997C8;
  v16[4] = self;
  id v14 = v7;
  id v18 = v14;
  id v15 = v6;
  id v17 = v15;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v15 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v16];

  __brc_leave_section(v19);
}

void __79__BRCXPCRegularIPCsClient_LegacyAdditions__thumbnailChangedForItemAtURL_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    BOOL v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = a1[4];
      qos_class_t v11 = objc_msgSend(v7, "brc_wrappedError");
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = v10;
      __int16 v28 = 2112;
      __int16 v29 = v11;
      __int16 v30 = 2112;
      __int16 v31 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v12 = a1[6];
    uint64_t v13 = objc_msgSend(v7, "brc_wrappedError");
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
  else
  {
    uint64_t v13 = [v5 relpath];
    if ([v13 exists]
      && ([v5 byIDLocalItem], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v15 = (void *)v14;
      uint64_t v16 = [v5 session];
      id v17 = [v16 fsReader];
      uint64_t v18 = a1[5];
      id v25 = 0;
      [v17 thumbnailChangedForItem:v15 relpath:v13 url:v18 error:&v25];
      id v7 = v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    __int16 v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = a1[4];
      __int16 v22 = objc_msgSend(v7, "brc_wrappedError");
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      __int16 v29 = v22;
      __int16 v30 = 2112;
      __int16 v31 = v19;
      _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v23 = a1[6];
    __int16 v24 = objc_msgSend(v7, "brc_wrappedError");
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);
  }
}

- (void)getQueryItemForURL:(id)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getQueryItemForURL:reply:]", 1643, v17);
  BOOL v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v17[0];
    qos_class_t v11 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v6 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2080;
    id v25 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getQueryItemForURL:reply:]";
    __int16 v26 = 2112;
    uint64_t v27 = v13;
    __int16 v28 = 2112;
    __int16 v29 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__BRCXPCRegularIPCsClient_LegacyAdditions__getQueryItemForURL_reply___block_invoke;
  v15[3] = &unk_1E69998E0;
  v15[4] = self;
  id v14 = v7;
  id v16 = v14;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v6 accessKind:1 dbAccessKind:1 synchronouslyIfPossible:0 handler:v15];

  __brc_leave_section(v17);
}

void __69__BRCXPCRegularIPCsClient_LegacyAdditions__getQueryItemForURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    BOOL v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      __int16 v38 = v10;
      __int16 v39 = 2112;
      __int16 v40 = 0;
      __int16 v41 = 2112;
      id v42 = v7;
      __int16 v43 = 2112;
      __int16 v44 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_27;
  }
  qos_class_t v11 = [v5 byIDLocalItem];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v5 faultedLocalItem];
  }
  id v14 = v13;

  id v15 = [v5 relpath];
  id v16 = brc_bread_crumbs();
  id v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    __69__BRCXPCRegularIPCsClient_LegacyAdditions__getQueryItemForURL_reply___block_invoke_cold_1();
  }

  if (!v14
    || ([v14 isZoneRoot] & 1) != 0
    || ([v14 isDead] & 1) != 0
    || ([v14 isReserved] & 1) != 0)
  {
    if (v15)
    {
      id v36 = 0;
      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F59518]) initWithRelPath:v15 error:&v36];
      id v7 = v36;
      if ([v14 isZoneRoot])
      {
        uint64_t v19 = (void *)MEMORY[0x1E4F59518];
        __int16 v20 = [v14 appLibrary];
        [v20 containerMetadata];
        v21 = uint64_t v35 = v15;
        __int16 v22 = [v14 clientZone];
        id v23 = [v22 dbRowID];
        uint64_t v24 = [v19 containerItemForContainer:v21 withRepresentativeItem:v18 zoneRowID:v23];

        id v15 = v35;
        uint64_t v18 = (void *)v24;
      }
      if ([v14 isZoneRoot])
      {
        id v25 = [v14 clientZone];
        int v26 = [v25 isCloudDocsZone];

        if (v26)
        {
          uint64_t v27 = [*(id *)(a1 + 32) session];
          __int16 v28 = [v27 fsUploader];
          __int16 v29 = [v28 quotaAvailableForOwner:*MEMORY[0x1E4F19C08]];

          [v18 setAttribute:v29 forKey:*MEMORY[0x1E4F596C0]];
        }
      }
      goto LABEL_22;
    }
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = +[BRCNotification notificationFromItem:v14 relpath:v15];
  }
  id v7 = 0;
LABEL_22:
  uint64_t v30 = brc_bread_crumbs();
  __int16 v31 = brc_default_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    __int16 v38 = v18;
    __int16 v39 = 2112;
    __int16 v40 = v14;
    __int16 v41 = 2112;
    id v42 = v15;
    __int16 v43 = 2112;
    __int16 v44 = v30;
    _os_log_debug_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] sending back: %@\n item: %@\n path: %@\n%@", buf, 0x2Au);
  }

  uint64_t v32 = brc_bread_crumbs();
  __int16 v33 = brc_default_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    id v34 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    __int16 v38 = v34;
    __int16 v39 = 2112;
    __int16 v40 = v18;
    __int16 v41 = 2112;
    id v42 = 0;
    __int16 v43 = 2112;
    __int16 v44 = v32;
    _os_log_impl(&dword_1D353B000, v33, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_27:
}

- (void)updateItemFromURL:(id)a3 reply:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v19, 0, sizeof(v19));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) updateItemFromURL:reply:]", 1716, v19);
  BOOL v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v19[0];
    qos_class_t v11 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = [v6 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    id v23 = self;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2080;
    uint64_t v27 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) updateItemFromURL:reply:]";
    __int16 v28 = 2112;
    __int16 v29 = v13;
    __int16 v30 = 2112;
    __int16 v31 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__BRCXPCRegularIPCsClient_LegacyAdditions__updateItemFromURL_reply___block_invoke;
  v16[3] = &unk_1E6999A70;
  v16[4] = self;
  id v14 = v6;
  id v17 = v14;
  id v15 = v7;
  id v18 = v15;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v14 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v16];

  __brc_leave_section(v19);
}

void __68__BRCXPCRegularIPCsClient_LegacyAdditions__updateItemFromURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    qos_class_t v11 = 0;
    goto LABEL_23;
  }
  id v7 = [(BRCURLToItemLookup *)v5 relpath];
  BOOL v8 = [v7 appLibrary];
  id v9 = [v8 appLibraryID];

  if ([*(id *)(a1 + 32) _isAppLibraryProxyEntitled])
  {
    char v10 = 1;
  }
  else if (v9)
  {
    id v12 = [*(id *)(a1 + 32) entitledAppLibraryIDs];
    char v10 = [v12 containsObject:v9];
  }
  else
  {
    char v10 = 0;
  }
  id v13 = [(BRCURLToItemLookup *)v5 db];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __68__BRCXPCRegularIPCsClient_LegacyAdditions__updateItemFromURL_reply___block_invoke_2;
  uint64_t v35[3] = &unk_1E6996308;
  id v36 = v5;
  id v14 = v5;
  [v13 groupInBatch:v35];

  id v15 = [BRCURLToItemLookup alloc];
  id v16 = [(BRCURLToItemLookup *)v14 url];
  id v17 = [(BRCURLToItemLookup *)v14 session];

  id v5 = [(BRCURLToItemLookup *)v15 initWithURL:v16 session:v17];
  if ((v10 & 1) == 0)
  {
    [(BRCURLToItemLookup *)v5 closePaths];
LABEL_21:
    uint64_t v27 = (uint64_t)v6;
    id v6 = v36;
    goto LABEL_22;
  }
  id v18 = 0;
  if (-[BRCURLToItemLookup resolveParentAndKeepOpenMustExist:errcode:](v5, "resolveParentAndKeepOpenMustExist:errcode:", 1, 0)&& ((-[BRCURLToItemLookup byIDLocalItem](v5, "byIDLocalItem"), (id v18 = objc_claimAutoreleasedReturnValue()) != 0)|| (-[BRCURLToItemLookup faultedLocalItem](v5, "faultedLocalItem"), (id v18 = objc_claimAutoreleasedReturnValue()) != 0))&& ([v18 isZoneRoot] & 1) == 0&& (objc_msgSend(v18, "isDead") & 1) == 0)
  {
    qos_class_t v11 = +[BRCNotification notificationGatheredFromItem:v18];
  }
  else
  {
    id v19 = objc_alloc(MEMORY[0x1E4F59518]);
    __int16 v20 = [(BRCURLToItemLookup *)v5 relpath];
    id v34 = v6;
    qos_class_t v11 = (void *)[v19 initWithRelPath:v20 error:&v34];
    id v21 = v34;

    id v6 = v21;
  }

  [(BRCURLToItemLookup *)v5 closePaths];
  if (!v11) {
    goto LABEL_21;
  }
  __int16 v22 = [(BRCURLToItemLookup *)v5 db];
  [v22 flushToMakeEditsVisibleToIPCReaders];

  id v23 = [v11 fileObjectID];

  if (v23) {
    goto LABEL_23;
  }
  __int16 v24 = brc_bread_crumbs();
  id v25 = brc_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
    __68__BRCXPCRegularIPCsClient_LegacyAdditions__updateItemFromURL_reply___block_invoke_cold_1();
  }

  __int16 v26 = (void *)MEMORY[0x1E4F28C58];
  id v9 = [*(id *)(a1 + 40) path];
  uint64_t v27 = objc_msgSend(v26, "brc_errorNoDocument:underlyingPOSIXError:", v9, 22);
LABEL_22:

  qos_class_t v11 = 0;
  id v6 = (id)v27;
LABEL_23:
  __int16 v28 = brc_bread_crumbs();
  __int16 v29 = brc_default_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = *(void *)(a1 + 32);
    __int16 v31 = objc_msgSend(v6, "brc_wrappedError");
    *(_DWORD *)buf = 138413058;
    uint64_t v38 = v30;
    __int16 v39 = 2112;
    __int16 v40 = v11;
    __int16 v41 = 2112;
    id v42 = v31;
    __int16 v43 = 2112;
    __int16 v44 = v28;
    _os_log_impl(&dword_1D353B000, v29, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }
  uint64_t v32 = *(void *)(a1 + 48);
  __int16 v33 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *))(v32 + 16))(v32, v11, v33);
}

void __68__BRCXPCRegularIPCsClient_LegacyAdditions__updateItemFromURL_reply___block_invoke_2(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) relpath];
  if (v7)
  {
    unint64_t v2 = [*(id *)(a1 + 32) session];
    id v3 = [v2 fsReader];
    [v3 fseventAtPath:v7 flags:0];
  }
  uint64_t v4 = [*(id *)(a1 + 32) faultedRelpath];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) session];
    id v6 = [v5 fsReader];
    [v6 fseventAtPath:v4 flags:0];
  }
}

- (void)resolveConflictWithName:(id)a3 atURL:(id)a4 reply:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__42;
  v54[4] = __Block_byref_object_dispose__42;
  id v55 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__42;
  v52[4] = __Block_byref_object_dispose__42;
  id v53 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__42;
  v50[4] = __Block_byref_object_dispose__42;
  id v51 = 0;
  uint64_t v46 = 0;
  __int16 v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v40 = 0;
  __int16 v41 = &v40;
  uint64_t v42 = 0x3032000000;
  __int16 v43 = __Block_byref_object_copy__42;
  __int16 v44 = __Block_byref_object_dispose__42;
  id v45 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __80__BRCXPCRegularIPCsClient_LegacyAdditions__resolveConflictWithName_atURL_reply___block_invoke;
  uint64_t v33[3] = &unk_1E6999A98;
  uint64_t v35 = &v40;
  id v36 = &v46;
  id v11 = v8;
  id v34 = v11;
  uint64_t v37 = v54;
  uint64_t v38 = v50;
  __int16 v39 = v52;
  [(BRCXPCClient *)self performBlock:v33 withSessionFromURL:v9];
  if (*((unsigned char *)v47 + 24))
  {
    memset(v32, 0, sizeof(v32));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) resolveConflictWithName:atURL:reply:]", 1751, v32);
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v24 = v10;
      uint64_t v14 = v32[0];
      qos_class_t v15 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v15, (uint64_t)&brc_qos_entries, 0);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = [v9 path];
      *(_DWORD *)buf = 134219266;
      v57 = (BRCXPCRegularIPCsClient *)v14;
      __int16 v58 = 2112;
      v59 = self;
      __int16 v60 = 2112;
      id v61 = v16;
      __int16 v62 = 2080;
      v63 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) resolveConflictWithName:atURL:reply:]";
      __int16 v64 = 2112;
      v65 = v17;
      __int16 v66 = 2112;
      v67 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      id v10 = v24;
    }

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __80__BRCXPCRegularIPCsClient_LegacyAdditions__resolveConflictWithName_atURL_reply___block_invoke_123;
    uint64_t v25[3] = &unk_1E6999AC0;
    id v26 = v9;
    uint64_t v30 = v50;
    __int16 v31 = v52;
    id v27 = v11;
    __int16 v28 = self;
    id v29 = v10;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v26 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v25];

    __brc_leave_section(v32);
  }
  else
  {
    id v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = (BRCXPCRegularIPCsClient *)v41[5];
      id v21 = v20;
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"url", v9);
        id v21 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412802;
      v57 = self;
      __int16 v58 = 2112;
      v59 = v21;
      __int16 v60 = 2112;
      id v61 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      if (!v20) {
    }
      }
    __int16 v22 = (void *)v41[5];
    id v23 = v22;
    if (!v22)
    {
      id v23 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"url", v9);
    }
    (*((void (**)(id, void *))v10 + 2))(v10, v23);
    if (!v22) {
  }
    }
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v54, 8);
}

void __80__BRCXPCRegularIPCsClient_LegacyAdditions__resolveConflictWithName_atURL_reply___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend(MEMORY[0x1E4F63BD8], "brc_parseAdditionFilename:mangledID:itemID:etag:session:", a1[4], *(void *)(a1[7] + 8) + 40, *(void *)(a1[8] + 8) + 40, *(void *)(a1[9] + 8) + 40, a2);
  }
}

void __80__BRCXPCRegularIPCsClient_LegacyAdditions__resolveConflictWithName_atURL_reply___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 byIDLocalItem];
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v16 = [*(id *)(a1 + 32) path];
      id v17 = *(void **)(a1 + 40);
      id v18 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      int v19 = 138413314;
      __int16 v20 = v16;
      __int16 v21 = 2112;
      id v22 = v17;
      __int16 v23 = 2112;
      id v24 = v18;
      __int16 v25 = 2112;
      id v26 = v7;
      __int16 v27 = 2112;
      __int16 v28 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Trying to resolve conflict at url=%@ name=%@ itemid=%@ item=%@%@", (uint8_t *)&v19, 0x34u);
    }
    id v10 = [v7 itemID];
    if ([v10 isEqualToItemID:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)]&& objc_msgSend(v7, "isDocument"))
    {
      char v11 = [v7 isFault];

      if ((v11 & 1) == 0)
      {
        id v12 = [v7 asDocument];
        [v12 appDidResolveConflictLoserWithEtag:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"url", *(void *)(a1 + 32));
    id v12 = v6;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  id v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    qos_class_t v15 = *(void **)(a1 + 48);
    int v19 = 138412802;
    __int16 v20 = v15;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v13;
    _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v19, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)forceConflictForURL:(id)a3 bookmarkData:(id)a4 forcedEtag:(id)a5 reply:(id)a6
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__42;
  v67[4] = __Block_byref_object_dispose__42;
  id v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__42;
  v65[4] = __Block_byref_object_dispose__42;
  id v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__42;
  v63[4] = __Block_byref_object_dispose__42;
  id v64 = 0;
  uint64_t v57 = 0;
  __int16 v58 = &v57;
  uint64_t v59 = 0x3032000000;
  __int16 v60 = __Block_byref_object_copy__42;
  id v61 = __Block_byref_object_dispose__42;
  id v62 = 0;
  uint64_t v53 = 0;
  __int16 v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  memset(v52, 0, sizeof(v52));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) forceConflictForURL:bookmarkData:forcedEtag:reply:]", 1764, v52);
  uint64_t v14 = brc_bread_crumbs();
  qos_class_t v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = v11;
    id v17 = v10;
    id v18 = v12;
    uint64_t v19 = v52[0];
    qos_class_t v20 = qos_class_self();
    __int16 v21 = BRCPrettyPrintEnumWithContext(v20, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    v70 = (BRCXPCRegularIPCsClient *)v19;
    __int16 v71 = 2112;
    v72 = self;
    __int16 v73 = 2112;
    id v74 = v21;
    __int16 v75 = 2080;
    v76 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) forceConflictForURL:bookmarkData:forcedEtag:reply:]";
    __int16 v77 = 2112;
    v78 = v14;
    _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    id v12 = v18;
    id v10 = v17;
    id v11 = v16;
  }

  id v22 = (void *)*MEMORY[0x1E4F59290];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __94__BRCXPCRegularIPCsClient_LegacyAdditions__forceConflictForURL_bookmarkData_forcedEtag_reply___block_invoke;
  v50[3] = &unk_1E69957B0;
  v50[4] = self;
  id v23 = v13;
  id v51 = v23;
  LODWORD(v22) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v22, v50);

  if (v22)
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __94__BRCXPCRegularIPCsClient_LegacyAdditions__forceConflictForURL_bookmarkData_forcedEtag_reply___block_invoke_124;
    v43[3] = &unk_1E6999A98;
    id v45 = &v57;
    uint64_t v46 = &v53;
    id v44 = v11;
    __int16 v47 = v65;
    uint64_t v48 = v63;
    char v49 = v67;
    [(BRCXPCClient *)self performBlock:v43 withSessionFromURL:v10];
    if (*((unsigned char *)v54 + 24))
    {
      memset(v42, 0, sizeof(v42));
      __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) forceConflictForURL:bookmarkData:forcedEtag:reply:]", 1805, v42);
      id v24 = brc_bread_crumbs();
      __int16 v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v33 = v12;
        id v34 = v11;
        uint64_t v26 = v42[0];
        qos_class_t v27 = qos_class_self();
        BRCPrettyPrintEnumWithContext(v27, (uint64_t)&brc_qos_entries, 0);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = [v10 path];
        *(_DWORD *)buf = 134219266;
        v70 = (BRCXPCRegularIPCsClient *)v26;
        __int16 v71 = 2112;
        v72 = self;
        __int16 v73 = 2112;
        id v74 = v28;
        __int16 v75 = 2080;
        v76 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) forceConflictForURL:bookmarkData:forcedEtag:reply:]";
        __int16 v77 = 2112;
        v78 = v29;
        __int16 v79 = 2112;
        v80 = v24;
        _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

        id v12 = v33;
        id v11 = v34;
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __94__BRCXPCRegularIPCsClient_LegacyAdditions__forceConflictForURL_bookmarkData_forcedEtag_reply___block_invoke_125;
      uint64_t v35[3] = &unk_1E6999AE8;
      id v36 = v10;
      uint64_t v40 = v63;
      __int16 v41 = v67;
      id v37 = v12;
      uint64_t v38 = self;
      id v39 = v23;
      [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v36 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v35];

      __brc_leave_section(v42);
    }
    else
    {
      uint64_t v30 = brc_bread_crumbs();
      __int16 v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = (BRCXPCRegularIPCsClient *)v58[5];
        *(_DWORD *)buf = 138412802;
        v70 = self;
        __int16 v71 = 2112;
        v72 = v32;
        __int16 v73 = 2112;
        id v74 = v30;
        _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }

      (*((void (**)(id, uint64_t))v23 + 2))(v23, v58[5]);
    }
  }
  __brc_leave_section(v52);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);

  _Block_object_dispose(v67, 8);
}

void __94__BRCXPCRegularIPCsClient_LegacyAdditions__forceConflictForURL_bookmarkData_forcedEtag_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __94__BRCXPCRegularIPCsClient_LegacyAdditions__forceConflictForURL_bookmarkData_forcedEtag_reply___block_invoke_124(void *a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    uint64_t v7 = *(void *)(a1[7] + 8) + 40;
    uint64_t v8 = *(void *)(a1[8] + 8) + 40;
    uint64_t v9 = *(void *)(a1[9] + 8) + 40;
    id v10 = (void *)a1[4];
    uint64_t v11 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v11 + 40);
    char v12 = [v10 parseBookmarkDataWithAccountSession:a2 docID:v7 itemID:v8 mangledID:v9 unsaltedBookmarkData:0 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v12;
  }
}

void __94__BRCXPCRegularIPCsClient_LegacyAdditions__forceConflictForURL_bookmarkData_forcedEtag_reply___block_invoke_125(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v7 = [v5 byIDLocalItem];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v5 faultedLocalItem];
    }
    id v10 = v9;

    if ([v10 isDocument])
    {
      if ([v10 isFault])
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F592A8];
        uint64_t v13 = [*(id *)(a1 + 32) path];
        objc_msgSend(v11, "br_errorWithDomain:code:description:", v12, 10, @"Item %@ isn't local at path", v13);
LABEL_14:
        id v6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      id v16 = [v10 itemID];
      if ([v16 isEqualToItemID:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)])
      {
        id v17 = [v10 appLibrary];
        id v18 = [v17 mangledID];
        char v19 = [v18 isEqualToMangledID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

        if (v19)
        {
          qos_class_t v20 = [v10 asDocument];
          [v20 forceiWorkConflictEtag:*(void *)(a1 + 40)];

          [v10 saveToDB];
          id v6 = 0;
          goto LABEL_15;
        }
      }
      else
      {
      }
      __int16 v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F592A8];
      uint64_t v13 = [*(id *)(a1 + 32) path];
      objc_msgSend(v21, "br_errorWithDomain:code:description:", v22, 10, @"Item %@ is stale at path", v13);
      goto LABEL_14;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    qos_class_t v15 = [*(id *)(a1 + 32) path];
    objc_msgSend(v14, "brc_errorItemNotFound:", v15);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
  }
  id v23 = brc_bread_crumbs();
  id v24 = brc_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v25;
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 2112;
    __int16 v31 = v23;
    _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)removeItemFromDisk:(id)a3 reply:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v19, 0, sizeof(v19));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) removeItemFromDisk:reply:]", 1824, v19);
  uint64_t v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v19[0];
    qos_class_t v11 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v6 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    id v23 = self;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2080;
    uint64_t v27 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) removeItemFromDisk:reply:]";
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2112;
    __int16 v31 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__BRCXPCRegularIPCsClient_LegacyAdditions__removeItemFromDisk_reply___block_invoke;
  v16[3] = &unk_1E69997C8;
  v16[4] = self;
  id v14 = v7;
  id v18 = v14;
  id v15 = v6;
  id v17 = v15;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v15 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v16];

  __brc_leave_section(v19);
}

void __69__BRCXPCRegularIPCsClient_LegacyAdditions__removeItemFromDisk_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      qos_class_t v11 = objc_msgSend(v7, "brc_wrappedError");
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v10;
      __int16 v29 = 2112;
      __int16 v30 = v11;
      __int16 v31 = 2112;
      uint64_t v32 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = objc_msgSend(v7, "brc_wrappedError");
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
  else
  {
    id v14 = [v5 session];
    id v15 = [v14 diskReclaimer];
    id v16 = [*(id *)(a1 + 40) path];
    char v17 = [v15 renameAndUnlinkInBackgroundItemAt:0xFFFFFFFFLL path:v16];

    if (v17)
    {
      id v18 = brc_bread_crumbs();
      char v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __69__BRCXPCRegularIPCsClient_LegacyAdditions__removeItemFromDisk_reply___block_invoke_cold_1();
      }

      qos_class_t v20 = [v5 session];
      uint64_t v21 = [v20 clientDB];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __69__BRCXPCRegularIPCsClient_LegacyAdditions__removeItemFromDisk_reply___block_invoke_132;
      uint64_t v25[3] = &unk_1E6996308;
      id v26 = v5;
      [v21 groupInBatch:v25];

      id v7 = 0;
    }
    else
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    }
    __int16 v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v24;
      __int16 v29 = 2112;
      __int16 v30 = v7;
      __int16 v31 = 2112;
      uint64_t v32 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __69__BRCXPCRegularIPCsClient_LegacyAdditions__removeItemFromDisk_reply___block_invoke_132(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) session];
  unint64_t v2 = [v4 fsReader];
  id v3 = [*(id *)(a1 + 32) byPathRelpath];
  [v2 fseventAtPath:v3 flags:0];
}

- (void)trashItemAtURL:(id)a3 reply:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v19, 0, sizeof(v19));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) trashItemAtURL:reply:]", 1895, v19);
  uint64_t v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v19[0];
    qos_class_t v11 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v6 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    id v23 = self;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2080;
    uint64_t v27 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) trashItemAtURL:reply:]";
    __int16 v28 = 2112;
    __int16 v29 = v13;
    __int16 v30 = 2112;
    __int16 v31 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__BRCXPCRegularIPCsClient_LegacyAdditions__trashItemAtURL_reply___block_invoke;
  v16[3] = &unk_1E69997C8;
  v16[4] = self;
  id v14 = v7;
  id v18 = v14;
  id v15 = v6;
  id v17 = v15;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v15 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v16];

  __brc_leave_section(v19);
}

void __65__BRCXPCRegularIPCsClient_LegacyAdditions__trashItemAtURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  char v56 = v4;
  if (v5)
  {
    id v6 = v5;
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
      *(_DWORD *)buf = 138413058;
      uint64_t v67 = v9;
      __int16 v68 = 2112;
      id v69 = 0;
      __int16 v70 = 2112;
      id v71 = v10;
      __int16 v72 = 2112;
      __int16 v73 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v59 = objc_msgSend(v6, "brc_wrappedError");
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v59);
  }
  else
  {
    uint64_t v59 = [v4 relpath];
    __int16 v54 = [v59 appLibrary];
    id v12 = +[BRCPathToItemLookup lookupForRelativePath:v59];
    uint64_t v55 = [v12 clientZone];

    if ([v55 isPrivateZone])
    {
      uint64_t v13 = [v54 containerMetadata];
      __int16 v60 = [v13 trashURL];
    }
    else
    {
      __int16 v60 = 0;
    }
    memset(v65, 0, sizeof(v65));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) trashItemAtURL:reply:]_block_invoke", 1846, v65);
    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v48 = v65[0];
      char v49 = *(void **)(a1 + 40);
      __int16 v50 = [v54 appLibraryID];
      *(_DWORD *)buf = 134219010;
      uint64_t v67 = v48;
      __int16 v68 = 2112;
      id v69 = v49;
      __int16 v70 = 2112;
      id v71 = v50;
      __int16 v72 = 2112;
      __int16 v73 = v60;
      __int16 v74 = 2112;
      __int16 v75 = v14;
      _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx trash item at %@ in %@ to %@%@", buf, 0x34u);
    }
    if (v60)
    {
      id v16 = objc_msgSend(*(id *)(a1 + 40), "br_logicalURL");
      __int16 v52 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v17 = [v16 lastPathComponent];
      id v63 = 0;
      uint64_t v64 = 0;
      __int16 v58 = objc_msgSend(v17, "br_stringByDeletingPathBounceNo:andPathExtension:", &v64, &v63);
      id v18 = v63;
      char v19 = [v56 session];
      uint64_t v53 = [v19 fsReader];

      if (!v64) {
        uint64_t v64 = 1;
      }
      id v62 = 0;
      char v20 = [v52 createDirectoryAtURL:v60 withIntermediateDirectories:1 attributes:0 error:&v62];
      id v51 = v62;
      if ((v20 & 1) == 0)
      {
        uint64_t v21 = brc_bread_crumbs();
        __int16 v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v60 path];
          *(_DWORD *)buf = 138412802;
          uint64_t v67 = (uint64_t)v23;
          __int16 v68 = 2112;
          id v69 = v51;
          __int16 v70 = 2112;
          id v71 = v21;
          _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] can't create %@: %@%@", buf, 0x20u);
        }
      }
      [v53 fseventOnURL:v60 dbFlags:16];
      __int16 v24 = 0;
      uint64_t v25 = *MEMORY[0x1E4F281F8];
      while (1)
      {
        __int16 v26 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v27 = [v60 URLByAppendingPathComponent:v17];
        id v61 = v24;
        char v28 = objc_msgSend(v26, "br_movePromisedItemAtURL:toURL:error:", v16, v27, &v61);
        id v6 = v61;

        if (v28) {
          break;
        }
        __int16 v29 = [v6 domain];
        if (![v29 isEqualToString:v25])
        {

LABEL_29:
          id v45 = brc_bread_crumbs();
          uint64_t v46 = brc_default_log();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            uint64_t v47 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138413058;
            uint64_t v67 = v47;
            __int16 v68 = 2112;
            id v69 = 0;
            __int16 v70 = 2112;
            id v71 = v6;
            __int16 v72 = 2112;
            __int16 v73 = v45;
            _os_log_impl(&dword_1D353B000, v46, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
          }

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          goto LABEL_32;
        }
        BOOL v30 = [v6 code] == 516;

        if (!v30) {
          goto LABEL_29;
        }
        ++v64;
        __int16 v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        uint64_t v32 = objc_msgSend(v58, "br_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v31, v18, 0);

        id v17 = (void *)v32;
        __int16 v24 = v6;
      }
      uint64_t v38 = [v60 URLByAppendingPathComponent:v17];
      id v39 = objc_msgSend(v38, "br_physicalURL");
      [v53 fseventOnURL:v39 dbFlags:0];

      uint64_t v40 = [v56 session];
      __int16 v41 = [v40 clientDB];
      [v41 flushToMakeEditsVisibleToIPCReaders];

      uint64_t v42 = brc_bread_crumbs();
      __int16 v43 = brc_default_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        uint64_t v44 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138413058;
        uint64_t v67 = v44;
        __int16 v68 = 2112;
        id v69 = v38;
        __int16 v70 = 2112;
        id v71 = 0;
        __int16 v72 = 2112;
        __int16 v73 = v42;
        _os_log_impl(&dword_1D353B000, v43, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_32:
    }
    else
    {
      uint64_t v33 = brc_bread_crumbs();
      id v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        uint64_t v35 = *(void *)(a1 + 32);
        id v36 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", *(void *)(a1 + 40));
        *(_DWORD *)buf = 138413058;
        uint64_t v67 = v35;
        __int16 v68 = 2112;
        id v69 = 0;
        __int16 v70 = 2112;
        id v71 = v36;
        __int16 v72 = 2112;
        __int16 v73 = v33;
        _os_log_impl(&dword_1D353B000, v34, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      uint64_t v37 = *(void *)(a1 + 48);
      id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", *(void *)(a1 + 40));
      (*(void (**)(uint64_t, void, void *))(v37 + 16))(v37, 0, v16);
      id v6 = 0;
    }

    __brc_leave_section(v65);
  }
}

- (void)listFilesIngested:(id)a3 reply:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v5 = a4;
  memset(v41, 0, sizeof(v41));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) listFilesIngested:reply:]", 1903, v41);
  id v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v41[0];
    qos_class_t v9 = qos_class_self();
    uint64_t v10 = BRCPrettyPrintEnumWithContext(v9, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v43 = (BRCXPCRegularIPCsClient *)v8;
    __int16 v44 = 2112;
    id v45 = self;
    __int16 v46 = 2112;
    *(void *)uint64_t v47 = v10;
    *(_WORD *)&v47[8] = 2080;
    *(void *)&v47[10] = "-[BRCXPCRegularIPCsClient(LegacyAdditions) listFilesIngested:reply:]";
    __int16 v48 = 2112;
    char v49 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v11 = (void *)*MEMORY[0x1E4F59318];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __68__BRCXPCRegularIPCsClient_LegacyAdditions__listFilesIngested_reply___block_invoke;
  uint64_t v39[3] = &unk_1E69957B0;
  v39[4] = self;
  id v34 = v5;
  id v40 = v34;
  int v12 = _brc_ipc_check_entitlement_and_logged_status(self, 1, v11, v39);

  if (v12)
  {
    uint64_t v13 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v14 = [v13 listFilesIngestedBatchSize];

    memset(v38, 0, sizeof(v38));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) listFilesIngested:reply:]", 1907, v38);
    id v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v32 = v38[0];
      uint64_t v33 = [v35 count];
      *(_DWORD *)buf = 134218754;
      __int16 v43 = (BRCXPCRegularIPCsClient *)v32;
      __int16 v44 = 2048;
      id v45 = (BRCXPCRegularIPCsClient *)v33;
      __int16 v46 = 1024;
      *(_DWORD *)uint64_t v47 = v14;
      *(_WORD *)&v47[4] = 2112;
      *(void *)&v47[6] = v15;
      _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx list ingested %lu fileIDs with batchSize: %u%@", buf, 0x26u);
    }

    uint64_t v17 = [v35 count];
    unint64_t v18 = v17;
    if (v17)
    {
      unint64_t v19 = 0;
      char v20 = (BRCXPCRegularIPCsClient *)MEMORY[0x1E4F1CBF0];
      unint64_t v21 = v17;
      while (1)
      {
        unint64_t v22 = v21 - v14;
        unint64_t v23 = v21 >= v14 ? v14 : v21;
        __int16 v24 = objc_msgSend(v35, "subarrayWithRange:", v19, v23, v34);
        id v37 = 0;
        uint64_t v25 = [(BRCXPCRegularIPCsClient *)self _listBatchedFilesIngested:v24 batchSize:v14 error:&v37];
        id v26 = v37;
        uint64_t v27 = [(BRCXPCRegularIPCsClient *)v20 arrayByAddingObjectsFromArray:v25];

        if (v26) {
          break;
        }

        v19 += v14;
        unint64_t v21 = v22;
        char v20 = v27;
        if (v19 >= v18) {
          goto LABEL_15;
        }
      }
      BOOL v30 = brc_bread_crumbs();
      __int16 v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        __int16 v43 = self;
        __int16 v44 = 2112;
        id v45 = 0;
        __int16 v46 = 2112;
        *(void *)uint64_t v47 = v26;
        *(_WORD *)&v47[8] = 2112;
        *(void *)&v47[10] = v30;
        _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }

      (*((void (**)(id, void, id))v34 + 2))(v34, 0, v26);
    }
    else
    {
      uint64_t v27 = (BRCXPCRegularIPCsClient *)MEMORY[0x1E4F1CBF0];
LABEL_15:
      char v28 = brc_bread_crumbs();
      __int16 v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        __int16 v43 = self;
        __int16 v44 = 2112;
        id v45 = v27;
        __int16 v46 = 2112;
        *(void *)uint64_t v47 = 0;
        *(_WORD *)&v47[8] = 2112;
        *(void *)&v47[10] = v28;
        _os_log_impl(&dword_1D353B000, v29, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }

      (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v34 + 2))(v34, v27, 0);
      id v26 = 0;
    }

    __brc_leave_section(v38);
  }
  __brc_leave_section(v41);
}

void __68__BRCXPCRegularIPCsClient_LegacyAdditions__listFilesIngested_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_listBatchedFilesIngested:(id)a3 batchSize:(unsigned int)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 count] > (unint64_t)a4)
  {
    unint64_t v21 = brc_bread_crumbs();
    unint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[BRCXPCRegularIPCsClient(LegacyAdditions) _listBatchedFilesIngested:batchSize:error:]();
    }
  }
  __int16 v9 = [v8 componentsJoinedByString:@", "];
  memset(v28, 0, sizeof(v28));
  __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) _listBatchedFilesIngested:batchSize:error:]", 1929, v28);
  brc_bread_crumbs();
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v28[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    BOOL v30 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx list ingested with batch fileIDs:(%@)%@", buf, 0x20u);
  }

  id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  BOOL v30 = __Block_byref_object_copy__42;
  __int16 v31 = __Block_byref_object_dispose__42;
  id v32 = 0;
  __int16 v13 = [(BRCXPCClient *)self session];
  uint64_t v14 = [v13 readOnlyWorkloop];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__BRCXPCRegularIPCsClient_LegacyAdditions___listBatchedFilesIngested_batchSize_error___block_invoke;
  v23[3] = &unk_1E6999B10;
  void v23[4] = self;
  id v15 = v9;
  unsigned int v27 = a4;
  id v24 = v15;
  id v26 = buf;
  id v16 = v12;
  id v25 = v16;
  dispatch_async_and_wait(v14, v23);

  uint64_t v17 = *(void **)(*(void *)&buf[8] + 40);
  if (v17) {
    *a5 = v17;
  }
  unint64_t v18 = v25;
  id v19 = v16;

  _Block_object_dispose(buf, 8);
  __brc_leave_section(v28);

  return v19;
}

void __86__BRCXPCRegularIPCsClient_LegacyAdditions___listBatchedFilesIngested_batchSize_error___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) session];
  id v10 = [v2 readOnlyDB];

  id v3 = objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", objc_msgSend(*(id *)(a1 + 40), "UTF8String"), objc_msgSend(*(id *)(a1 + 40), "length"));
  id v4 = (void *)[v10 fetch:@"SELECT item_file_id FROM client_items WHERE item_file_id IN (%@) LIMIT %u", v3, *(unsigned int *)(a1 + 64)];

  id v5 = [v10 lastError];

  if (v5)
  {
    uint64_t v6 = [v10 lastError];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else if ([v4 next])
  {
    do
    {
      __int16 v9 = [v4 objectOfClass:objc_opt_class() atIndex:0];
      [*(id *)(a1 + 48) addObject:v9];
    }
    while (([v4 next] & 1) != 0);
  }
}

- (void)pauseSyncForFileAtURL:(id)a3 timeout:(double)a4 options:(int64_t)a5 reply:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  memset(v31, 0, sizeof(v31));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) pauseSyncForFileAtURL:timeout:options:reply:]", 1961, v31);
  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v31[0];
    qos_class_t v14 = qos_class_self();
    id v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v33 = v13;
    __int16 v34 = 2112;
    id v35 = self;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 2080;
    id v39 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) pauseSyncForFileAtURL:timeout:options:reply:]";
    __int16 v40 = 2112;
    __int16 v41 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __88__BRCXPCRegularIPCsClient_LegacyAdditions__pauseSyncForFileAtURL_timeout_options_reply___block_invoke;
  uint64_t v29[3] = &unk_1E69957B0;
  v29[4] = self;
  id v16 = v10;
  id v30 = v16;
  int v17 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.internal.fileprovider.in-place-collaboration", v29);

  if (v17)
  {
    memset(v28, 0, sizeof(v28));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) pauseSyncForFileAtURL:timeout:options:reply:]", 1984, v28);
    unint64_t v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = v28[0];
      qos_class_t v21 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v21, (uint64_t)&brc_qos_entries, 0);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v23 = [v9 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v33 = v20;
      __int16 v34 = 2112;
      id v35 = self;
      __int16 v36 = 2112;
      id v37 = v22;
      __int16 v38 = 2080;
      id v39 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) pauseSyncForFileAtURL:timeout:options:reply:]";
      __int16 v40 = 2112;
      __int16 v41 = v23;
      __int16 v42 = 2112;
      __int16 v43 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __88__BRCXPCRegularIPCsClient_LegacyAdditions__pauseSyncForFileAtURL_timeout_options_reply___block_invoke_144;
    uint64_t v24[3] = &unk_1E69998B8;
    v24[4] = self;
    id v26 = v16;
    id v25 = v9;
    double v27 = a4;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v25 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v24];

    __brc_leave_section(v28);
  }
  __brc_leave_section(v31);
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__pauseSyncForFileAtURL_timeout_options_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__pauseSyncForFileAtURL_timeout_options_reply___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v13 = [v5 byIDLocalItem];
    qos_class_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v5 faultedLocalItem];
    }
    id v12 = v15;

    if ([v12 isDocument])
    {
      if ([v12 isShared])
      {
        id v16 = [v12 asDocument];
        double v17 = *(double *)(a1 + 56);
        unint64_t v18 = [*(id *)(a1 + 32) bundleID];
        id v42 = 0;
        char v19 = [v16 pauseFromSyncWithTimeout:v18 forBundleID:&v42 error:v17];
        id v20 = v42;

        if (v19)
        {
          qos_class_t v21 = brc_bread_crumbs();
          id v22 = brc_default_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            uint64_t v23 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412802;
            uint64_t v44 = v23;
            __int16 v45 = 2112;
            id v46 = 0;
            __int16 v47 = 2112;
            __int16 v48 = v21;
            _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
          }
        }
        else
        {
          qos_class_t v21 = brc_bread_crumbs();
          id v22 = brc_default_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            uint64_t v41 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412802;
            uint64_t v44 = v41;
            __int16 v45 = 2112;
            id v46 = v20;
            __int16 v47 = 2112;
            __int16 v48 = v21;
            _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
          }
        }

        id v24 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
        goto LABEL_21;
      }
      __int16 v34 = brc_bread_crumbs();
      id v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        __int16 v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v37 = *(void *)(a1 + 32);
        __int16 v38 = [*(id *)(a1 + 40) path];
        id v39 = objc_msgSend(v36, "brc_errorDocumentIsNotSharedAtIdentifier:", v38);
        *(_DWORD *)buf = 138412802;
        uint64_t v44 = v37;
        __int16 v45 = 2112;
        id v46 = v39;
        __int16 v47 = 2112;
        __int16 v48 = v34;
        _os_log_impl(&dword_1D353B000, v35, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      __int16 v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *(void *)(a1 + 48);
      id v16 = [*(id *)(a1 + 40) path];
      uint64_t v33 = objc_msgSend(v40, "brc_errorDocumentIsNotSharedAtIdentifier:", v16);
    }
    else
    {
      id v25 = brc_bread_crumbs();
      id v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        double v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = *(void *)(a1 + 32);
        __int16 v29 = [*(id *)(a1 + 40) path];
        id v30 = objc_msgSend(v27, "brc_errorNoDocument:underlyingPOSIXError:", v29, 2);
        *(_DWORD *)buf = 138412802;
        uint64_t v44 = v28;
        __int16 v45 = 2112;
        id v46 = v30;
        __int16 v47 = 2112;
        __int16 v48 = v25;
        _os_log_impl(&dword_1D353B000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      __int16 v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *(void *)(a1 + 48);
      id v16 = [*(id *)(a1 + 40) path];
      uint64_t v33 = objc_msgSend(v31, "brc_errorNoDocument:underlyingPOSIXError:", v16, 2);
    }
    id v20 = (id)v33;
    id v24 = *(void (**)(void))(v32 + 16);
LABEL_21:
    v24();

    goto LABEL_22;
  }
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = objc_msgSend(v6, "brc_wrappedError");
    *(_DWORD *)buf = 138412802;
    uint64_t v44 = v9;
    __int16 v45 = 2112;
    id v46 = v10;
    __int16 v47 = 2112;
    __int16 v48 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
LABEL_22:
}

- (void)resumeSyncForFileAtURL:(id)a3 dropLocalChanges:(BOOL)a4 reply:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  memset(v31, 0, sizeof(v31));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) resumeSyncForFileAtURL:dropLocalChanges:reply:]", 1991, v31);
  id v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v31[0];
    qos_class_t v13 = qos_class_self();
    qos_class_t v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v33 = v12;
    __int16 v34 = 2112;
    id v35 = self;
    __int16 v36 = 2112;
    id v37 = v14;
    __int16 v38 = 2080;
    id v39 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) resumeSyncForFileAtURL:dropLocalChanges:reply:]";
    __int16 v40 = 2112;
    uint64_t v41 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __90__BRCXPCRegularIPCsClient_LegacyAdditions__resumeSyncForFileAtURL_dropLocalChanges_reply___block_invoke;
  uint64_t v29[3] = &unk_1E69957B0;
  v29[4] = self;
  id v15 = v9;
  id v30 = v15;
  int v16 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.internal.fileprovider.in-place-collaboration", v29);

  if (v16)
  {
    memset(v28, 0, sizeof(v28));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) resumeSyncForFileAtURL:dropLocalChanges:reply:]", 2012, v28);
    double v17 = brc_bread_crumbs();
    unint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      BOOL v23 = a4;
      uint64_t v19 = v28[0];
      qos_class_t v20 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v20, (uint64_t)&brc_qos_entries, 0);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = [v8 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v33 = v19;
      __int16 v34 = 2112;
      id v35 = self;
      __int16 v36 = 2112;
      id v37 = v21;
      __int16 v38 = 2080;
      id v39 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) resumeSyncForFileAtURL:dropLocalChanges:reply:]";
      __int16 v40 = 2112;
      uint64_t v41 = v22;
      __int16 v42 = 2112;
      __int16 v43 = v17;
      _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

      a4 = v23;
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __90__BRCXPCRegularIPCsClient_LegacyAdditions__resumeSyncForFileAtURL_dropLocalChanges_reply___block_invoke_145;
    uint64_t v24[3] = &unk_1E6999B38;
    v24[4] = self;
    id v26 = v15;
    id v25 = v8;
    BOOL v27 = a4;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v25 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v24];

    __brc_leave_section(v28);
  }
  __brc_leave_section(v31);
}

void __90__BRCXPCRegularIPCsClient_LegacyAdditions__resumeSyncForFileAtURL_dropLocalChanges_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __90__BRCXPCRegularIPCsClient_LegacyAdditions__resumeSyncForFileAtURL_dropLocalChanges_reply___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = objc_msgSend(v6, "brc_wrappedError");
      *(_DWORD *)buf = 138412802;
      uint64_t v36 = v9;
      __int16 v37 = 2112;
      id v38 = v10;
      __int16 v39 = 2112;
      __int16 v40 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = objc_msgSend(v6, "brc_wrappedError");
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
  else
  {
    uint64_t v13 = [v5 byIDLocalItem];
    qos_class_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v5 faultedLocalItem];
    }
    uint64_t v12 = v15;

    if ([v12 isDocument])
    {
      int v16 = [v12 asDocument];
      double v17 = [*(id *)(a1 + 32) bundleID];
      uint64_t v18 = *(unsigned __int8 *)(a1 + 56);
      id v34 = 0;
      char v19 = [v16 resumeSyncForBundleID:v17 dropLocalChanges:v18 error:&v34];
      id v20 = v34;

      if (v19)
      {
        id v21 = brc_bread_crumbs();
        id v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412802;
          uint64_t v36 = v23;
          __int16 v37 = 2112;
          id v38 = 0;
          __int16 v39 = 2112;
          __int16 v40 = v21;
          _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
      }
      else
      {
        id v21 = brc_bread_crumbs();
        id v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412802;
          uint64_t v36 = v33;
          __int16 v37 = 2112;
          id v38 = v20;
          __int16 v39 = 2112;
          __int16 v40 = v21;
          _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
      }

      uint64_t v32 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      id v24 = brc_bread_crumbs();
      id v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v27 = *(void *)(a1 + 32);
        uint64_t v28 = [*(id *)(a1 + 40) path];
        __int16 v29 = objc_msgSend(v26, "brc_errorNoDocument:underlyingPOSIXError:", v28, 2);
        *(_DWORD *)buf = 138412802;
        uint64_t v36 = v27;
        __int16 v37 = 2112;
        id v38 = v29;
        __int16 v39 = 2112;
        __int16 v40 = v24;
        _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      id v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *(void *)(a1 + 48);
      int v16 = [*(id *)(a1 + 40) path];
      objc_msgSend(v30, "brc_errorNoDocument:underlyingPOSIXError:", v16, 2);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = *(void (**)(void))(v31 + 16);
    }
    v32();
  }
}

- (void)fetchLatestVersionForFileAtURL:(id)a3 reply:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) fetchLatestVersionForFileAtURL:reply:]", 2019, v27);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v27[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2080;
    id v35 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) fetchLatestVersionForFileAtURL:reply:]";
    __int16 v36 = 2112;
    __int16 v37 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__BRCXPCRegularIPCsClient_LegacyAdditions__fetchLatestVersionForFileAtURL_reply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v13 = v7;
  id v26 = v13;
  int v14 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.internal.fileprovider.in-place-collaboration", v25);

  if (v14)
  {
    memset(v24, 0, sizeof(v24));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) fetchLatestVersionForFileAtURL:reply:]", 2076, v24);
    id v15 = brc_bread_crumbs();
    int v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v24[0];
      qos_class_t v18 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v20 = [v6 path];
      *(_DWORD *)buf = 134219266;
      uint64_t v29 = v17;
      __int16 v30 = 2112;
      uint64_t v31 = self;
      __int16 v32 = 2112;
      id v33 = v19;
      __int16 v34 = 2080;
      id v35 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) fetchLatestVersionForFileAtURL:reply:]";
      __int16 v36 = 2112;
      __int16 v37 = v20;
      __int16 v38 = 2112;
      __int16 v39 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __81__BRCXPCRegularIPCsClient_LegacyAdditions__fetchLatestVersionForFileAtURL_reply___block_invoke_146;
    uint64_t v21[3] = &unk_1E69997C8;
    v21[4] = self;
    id v23 = v13;
    id v22 = v6;
    [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v22 accessKind:0 dbAccessKind:0 synchronouslyIfPossible:0 handler:v21];

    __brc_leave_section(v24);
  }
  __brc_leave_section(v27);
}

void __81__BRCXPCRegularIPCsClient_LegacyAdditions__fetchLatestVersionForFileAtURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__BRCXPCRegularIPCsClient_LegacyAdditions__fetchLatestVersionForFileAtURL_reply___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    __int16 v13 = [v5 byIDLocalItem];
    int v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v5 faultedLocalItem];
    }
    id v12 = v15;

    int v16 = [v12 clientZone];
    uint64_t v17 = [v12 itemID];
    qos_class_t v18 = [v12 db];
    id v19 = [v16 serverItemByItemID:v17 db:v18];

    if ([v12 isDocument])
    {
      if (v19)
      {
        id v20 = [v12 asDocument];
        if ([v20 isPausedFromSync])
        {
          v84 = v20;
          id v21 = NSString;
          id v22 = [MEMORY[0x1E4F29128] UUID];
          id v23 = [v22 UUIDString];
          id v24 = [v21 stringWithFormat:@"dl-latestVersion-%@", v23];

          id v25 = [v19 latestVersion];
          id v26 = [BRCDownloadVersion alloc];
          uint64_t v27 = [v12 asDocument];
          [v25 ckInfo];
          uint64_t v28 = v87 = v19;
          uint64_t v29 = [v28 etag];
          v86 = [(BRCDownloadVersion *)v26 initWithDocument:v27 stageID:v24 etag:v29 isLoser:0];

          __int16 v30 = [v87 itemID];
          uint64_t v31 = [v87 serverZone];
          __int16 v32 = [v31 zoneID];
          v85 = v25;
          id v33 = [v25 additionNameForItemID:v30 zoneID:v32];

          __int16 v34 = [(BRCDownloadVersion *)v86 storage];

          if (v34)
          {
            id v35 = [(BRCDownloadVersion *)v86 storage];
            uint64_t v36 = [v35 additionWithName:v33 inNameSpace:*MEMORY[0x1E4F63BB8] error:0];

            v82 = (void *)v36;
            if (v36)
            {
              __int16 v37 = v86;
              __int16 v38 = brc_bread_crumbs();
              __int16 v39 = brc_default_log();
              id v20 = v84;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
                __81__BRCXPCRegularIPCsClient_LegacyAdditions__fetchLatestVersionForFileAtURL_reply___block_invoke_146_cold_2();
              }

              uint64_t v40 = brc_bread_crumbs();
              uint64_t v41 = brc_default_log();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                uint64_t v42 = *(void *)(a1 + 32);
                *(_DWORD *)buf = 138413058;
                uint64_t v94 = v42;
                __int16 v95 = 2112;
                v96 = v33;
                __int16 v97 = 2112;
                v98 = 0;
                __int16 v99 = 2112;
                v100 = v40;
                _os_log_impl(&dword_1D353B000, v41, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
              }

              (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            }
            else
            {
              __int16 v74 = [BRCDownloadVersionsBatchOperation alloc];
              id v20 = v84;
              __int16 v75 = [v84 syncContextUsedForTransfers];
              uint64_t v76 = [(BRCDownloadVersionsBatchOperation *)v74 initWithSyncContext:v75 forNonLocalVersion:1];

              __int16 v77 = objc_msgSend(MEMORY[0x1E4F1A218], "br_fetchNonLocalVersions");
              [(_BRCOperation *)v76 setGroup:v77];

              v78 = [v12 session];
              __int16 v79 = [v78 stageRegistry];
              [v79 associateDownloadStageID:v24 withOperation:v76];

              __int16 v37 = v86;
              [(BRCDownloadVersionsBatchOperation *)v76 addDownload:v86];
              v88[0] = MEMORY[0x1E4F143A8];
              v88[1] = 3221225472;
              v88[2] = __81__BRCXPCRegularIPCsClient_LegacyAdditions__fetchLatestVersionForFileAtURL_reply___block_invoke_158;
              v88[3] = &unk_1E6999B60;
              id v80 = *(id *)(a1 + 40);
              uint64_t v81 = *(void *)(a1 + 32);
              id v89 = v80;
              uint64_t v90 = v81;
              id v92 = *(id *)(a1 + 48);
              id v91 = v33;
              [(BRCDownloadVersionsBatchOperation *)v76 setPerDownloadCompletionBlock:v88];
              [(_BRCOperation *)v76 schedule];
            }
            __int16 v73 = v82;
          }
          else
          {
            v83 = v33;
            id v66 = brc_bread_crumbs();
            uint64_t v67 = brc_default_log();
            if (os_log_type_enabled(v67, (os_log_type_t)0x90u)) {
              __81__BRCXPCRegularIPCsClient_LegacyAdditions__fetchLatestVersionForFileAtURL_reply___block_invoke_146_cold_1(a1);
            }

            __int16 v68 = brc_bread_crumbs();
            id v69 = brc_default_log();
            id v20 = v84;
            if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
            {
              uint64_t v70 = *(void *)(a1 + 32);
              id v71 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"storage", 0);
              *(_DWORD *)buf = 138413058;
              uint64_t v94 = v70;
              __int16 v95 = 2112;
              v96 = 0;
              __int16 v97 = 2112;
              v98 = v71;
              __int16 v99 = 2112;
              v100 = v68;
              _os_log_impl(&dword_1D353B000, v69, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
            }
            uint64_t v72 = *(void *)(a1 + 48);
            __int16 v73 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"storage", 0);
            (*(void (**)(uint64_t, void, void *))(v72 + 16))(v72, 0, v73);
            __int16 v37 = v86;
            id v33 = v83;
          }

          id v19 = v87;
        }
        else
        {
          id v61 = brc_bread_crumbs();
          id v62 = brc_default_log();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            uint64_t v63 = *(void *)(a1 + 32);
            uint64_t v64 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotPausedFromSync");
            *(_DWORD *)buf = 138413058;
            uint64_t v94 = v63;
            __int16 v95 = 2112;
            v96 = 0;
            __int16 v97 = 2112;
            v98 = v64;
            __int16 v99 = 2112;
            v100 = v61;
            _os_log_impl(&dword_1D353B000, v62, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
          }
          uint64_t v65 = *(void *)(a1 + 48);
          id v24 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotPausedFromSync");
          (*(void (**)(uint64_t, void, void *))(v65 + 16))(v65, 0, v24);
        }
        goto LABEL_25;
      }
      __int16 v54 = brc_bread_crumbs();
      uint64_t v55 = brc_default_log();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        char v56 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v57 = *(void *)(a1 + 32);
        __int16 v58 = [*(id *)(a1 + 40) path];
        uint64_t v59 = objc_msgSend(v56, "brc_errorNotInCloud:", v58);
        *(_DWORD *)buf = 138413058;
        uint64_t v94 = v57;
        __int16 v95 = 2112;
        v96 = 0;
        __int16 v97 = 2112;
        v98 = v59;
        __int16 v99 = 2112;
        v100 = v54;
        _os_log_impl(&dword_1D353B000, v55, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      __int16 v60 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *(void *)(a1 + 48);
      id v20 = [*(id *)(a1 + 40) path];
      uint64_t v53 = objc_msgSend(v60, "brc_errorNotInCloud:", v20);
    }
    else
    {
      __int16 v43 = brc_bread_crumbs();
      uint64_t v44 = brc_default_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        __int16 v45 = (void *)MEMORY[0x1E4F28C58];
        id v46 = v5;
        __int16 v47 = v19;
        uint64_t v48 = *(void *)(a1 + 32);
        uint64_t v49 = [*(id *)(a1 + 40) path];
        uint64_t v50 = objc_msgSend(v45, "brc_errorNoDocument:underlyingPOSIXError:", v49, 2);
        *(_DWORD *)buf = 138413058;
        uint64_t v94 = v48;
        id v19 = v47;
        id v5 = v46;
        __int16 v95 = 2112;
        v96 = 0;
        __int16 v97 = 2112;
        v98 = v50;
        __int16 v99 = 2112;
        v100 = v43;
        _os_log_impl(&dword_1D353B000, v44, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      id v51 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *(void *)(a1 + 48);
      id v20 = [*(id *)(a1 + 40) path];
      uint64_t v53 = objc_msgSend(v51, "brc_errorNoDocument:underlyingPOSIXError:", v20, 2);
    }
    id v24 = (void *)v53;
    (*(void (**)(uint64_t, void, uint64_t))(v52 + 16))(v52, 0, v53);
LABEL_25:

    goto LABEL_26;
  }
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
    *(_DWORD *)buf = 138413058;
    uint64_t v94 = v9;
    __int16 v95 = 2112;
    v96 = 0;
    __int16 v97 = 2112;
    v98 = v10;
    __int16 v99 = 2112;
    v100 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
LABEL_26:
}

void __81__BRCXPCRegularIPCsClient_LegacyAdditions__fetchLatestVersionForFileAtURL_reply___block_invoke_158(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      id v12 = [*(id *)(a1 + 32) path];
      __int16 v13 = objc_msgSend(v12, "fp_obfuscatedPath");
      int v14 = 138412802;
      id v15 = v13;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_1D353B000, v6, (os_log_type_t)0x90u, "[ERROR] failed downloading version to path '%@': %@%@", (uint8_t *)&v14, 0x20u);
    }
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void **)(a1 + 40);
      int v14 = 138413058;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = 0;
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v14, 0x2Au);
    }
  }
  else
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void **)(a1 + 40);
      uint64_t v11 = *(void **)(a1 + 48);
      int v14 = 138413058;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = 0;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v14, 0x2Au);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)copyCollaborationIdentifierForItemAtURL:(id)a3 reply:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) copyCollaborationIdentifierForItemAtURL:reply:]", 2092, v20);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v20[0];
    qos_class_t v11 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v13 = [v6 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2080;
    uint64_t v28 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) copyCollaborationIdentifierForItemAtURL:reply:]";
    __int16 v29 = 2112;
    __int16 v30 = v13;
    __int16 v31 = 2112;
    __int16 v32 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__BRCXPCRegularIPCsClient_LegacyAdditions__copyCollaborationIdentifierForItemAtURL_reply___block_invoke;
  v16[3] = &unk_1E6999A70;
  id v14 = v6;
  id v17 = v14;
  __int16 v18 = self;
  id v15 = v7;
  id v19 = v15;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v14 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v16];

  __brc_leave_section(v20);
}

void __90__BRCXPCRegularIPCsClient_LegacyAdditions__copyCollaborationIdentifierForItemAtURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 byIDLocalItem];
    if (!v7)
    {
      id v7 = [v5 faultedLocalItem];
      if (!v7)
      {
        uint64_t v8 = brc_bread_crumbs();
        uint64_t v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __104__BRCXPCRegularIPCsClient_LegacyAdditions__getPublishedURLForItemAtURL_forStreaming_requestedTTL_reply___block_invoke_98_cold_1();
        }

        uint64_t v10 = brc_bread_crumbs();
        qos_class_t v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v13 = *(void *)(a1 + 40);
          id v14 = [*(id *)(a1 + 32) path];
          id v15 = objc_msgSend(v12, "brc_errorItemNotFound:", v14);
          int v31 = 138413058;
          uint64_t v32 = v13;
          __int16 v33 = 2112;
          __int16 v34 = 0;
          __int16 v35 = 2112;
          id v36 = v15;
          __int16 v37 = 2112;
          __int16 v38 = v10;
          _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v31, 0x2Au);
        }
        uint64_t v16 = *(void *)(a1 + 48);
        id v17 = (void *)MEMORY[0x1E4F28C58];
        __int16 v18 = [*(id *)(a1 + 32) path];
        id v19 = objc_msgSend(v17, "brc_errorItemNotFound:", v18);
        (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v19);

        id v7 = 0;
      }
    }
    __int16 v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = *(void *)(a1 + 40);
      __int16 v23 = [v7 collaborationIdentifierIfComputable];
      int v31 = 138413058;
      uint64_t v32 = v22;
      __int16 v33 = 2112;
      __int16 v34 = v23;
      __int16 v35 = 2112;
      id v36 = 0;
      __int16 v37 = 2112;
      __int16 v38 = v20;
      _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v31, 0x2Au);
    }
    uint64_t v24 = *(void *)(a1 + 48);
    __int16 v25 = [v7 collaborationIdentifierIfComputable];
    (*(void (**)(uint64_t, void *, void))(v24 + 16))(v24, v25, 0);
  }
  else
  {
    id v26 = brc_bread_crumbs();
    __int16 v27 = brc_default_log();
    if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
      __90__BRCXPCRegularIPCsClient_LegacyAdditions__copyCollaborationIdentifierForItemAtURL_reply___block_invoke_cold_1(a1);
    }

    uint64_t v28 = brc_bread_crumbs();
    __int16 v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = *(void *)(a1 + 40);
      int v31 = 138413058;
      uint64_t v32 = v30;
      __int16 v33 = 2112;
      __int16 v34 = 0;
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      __int16 v38 = v28;
      _os_log_impl(&dword_1D353B000, v29, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v31, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_gatherInformationForPath:(id)a3 session:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  qos_class_t v11 = [(BRCXPCClient *)self _auditedURLFromPath:v8];
  id v12 = [[BRCURLToItemLookup alloc] initWithURL:v11 session:v9];
  uint64_t v13 = v12;
  int v29 = 22;
  if (v8
    && [(BRCURLToItemLookup *)v12 resolveParentAndKeepOpenMustExist:1 errcode:&v29])
  {
    tracker = self->super._tracker;
    id v15 = [v9 clientTruthWorkloop];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __84__BRCXPCRegularIPCsClient_LegacyAdditions___gatherInformationForPath_session_reply___block_invoke;
    uint64_t v24[3] = &unk_1E6993D18;
    id v25 = v8;
    id v26 = v13;
    __int16 v27 = self;
    id v28 = v10;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __84__BRCXPCRegularIPCsClient_LegacyAdditions___gatherInformationForPath_session_reply___block_invoke_178;
    uint64_t v20[3] = &unk_1E69946C8;
    id v21 = v26;
    uint64_t v22 = self;
    id v23 = v28;
    brc_task_tracker_async_with_logs(tracker, v15, v24, v20);

    uint64_t v16 = v25;
  }
  else
  {
    id v17 = brc_bread_crumbs();
    __int16 v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"path", v8);
      *(_DWORD *)buf = 138413058;
      int v31 = self;
      __int16 v32 = 2112;
      uint64_t v33 = 0;
      __int16 v34 = 2112;
      __int16 v35 = v19;
      __int16 v36 = 2112;
      __int16 v37 = v17;
      _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"path", v8);
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
  }
}

void __84__BRCXPCRegularIPCsClient_LegacyAdditions___gatherInformationForPath_session_reply___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)MEMORY[0x1D9438760]();
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __84__BRCXPCRegularIPCsClient_LegacyAdditions___gatherInformationForPath_session_reply___block_invoke_cold_1(a1);
  }

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [*(id *)(a1 + 40) relpath];
  int v7 = [v6 exists];

  id v8 = *(void **)(a1 + 40);
  if (v7)
  {
LABEL_8:
    id v12 = [v8 relpath];
    goto LABEL_9;
  }
  id v9 = [v8 faultedRelpath];
  int v10 = [v9 exists];

  qos_class_t v11 = *(void **)(a1 + 40);
  if (!v10)
  {
    uint64_t v13 = [v11 relpath];

    if (!v13) {
      goto LABEL_10;
    }
    id v8 = *(void **)(a1 + 40);
    goto LABEL_8;
  }
  id v12 = [v11 faultedRelpath];
LABEL_9:
  id v14 = v12;
  id v15 = [v12 description];
  [v5 setObject:v15 forKeyedSubscript:@"relpath"];

LABEL_10:
  uint64_t v16 = [*(id *)(a1 + 40) byIDLocalItem];

  id v17 = *(void **)(a1 + 40);
  if (v16)
  {
    __int16 v18 = [v17 byIDLocalItem];
  }
  else
  {
    id v19 = [v17 faultedLocalItem];

    if (!v19) {
      goto LABEL_15;
    }
    __int16 v18 = [*(id *)(a1 + 40) faultedLocalItem];
  }
  __int16 v20 = v18;
  id v21 = [v18 description];
  [v5 setObject:v21 forKeyedSubscript:@"local item"];

LABEL_15:
  uint64_t v22 = [*(id *)(a1 + 40) byIDServerItem];

  id v23 = *(void **)(a1 + 40);
  if (v22)
  {
    uint64_t v24 = [v23 byIDServerItem];
LABEL_19:
    id v26 = v24;
    __int16 v27 = [v24 description];
    [v5 setObject:v27 forKeyedSubscript:@"server item"];

    goto LABEL_20;
  }
  id v25 = [v23 faultedServerItem];

  if (v25)
  {
    uint64_t v24 = [*(id *)(a1 + 40) faultedServerItem];
    goto LABEL_19;
  }
LABEL_20:
  uint64_t v28 = [*(id *)(a1 + 40) byPathLocalItem];
  if (v28)
  {
    int v29 = (void *)v28;
    uint64_t v30 = [*(id *)(a1 + 40) byIDLocalItem];
    int v31 = [v30 itemID];
    __int16 v32 = [*(id *)(a1 + 40) byPathLocalItem];
    uint64_t v33 = [v32 itemID];
    char v34 = [v31 isEqualToItemID:v33];

    if ((v34 & 1) == 0)
    {
      __int16 v35 = [*(id *)(a1 + 40) byPathLocalItem];
      __int16 v36 = [v35 description];
      [v5 setObject:v36 forKeyedSubscript:@"local path match"];
    }
  }
  uint64_t v37 = [*(id *)(a1 + 40) byPathServerItem];
  if (v37)
  {
    uint64_t v38 = (void *)v37;
    uint64_t v39 = [*(id *)(a1 + 40) byIDServerItem];
    uint64_t v40 = [v39 itemID];
    uint64_t v41 = [*(id *)(a1 + 40) byPathServerItem];
    uint64_t v42 = [v41 itemID];
    char v43 = [v40 isEqualToItemID:v42];

    if ((v43 & 1) == 0)
    {
      uint64_t v44 = [*(id *)(a1 + 40) byPathServerItem];
      __int16 v45 = [v44 description];
      [v5 setObject:v45 forKeyedSubscript:@"server path match"];
    }
  }
  id v46 = brc_bread_crumbs();
  __int16 v47 = brc_default_log();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    uint64_t v48 = *(void *)(a1 + 48);
    int v49 = 138413058;
    uint64_t v50 = v48;
    __int16 v51 = 2112;
    id v52 = v5;
    __int16 v53 = 2112;
    uint64_t v54 = 0;
    __int16 v55 = 2112;
    char v56 = v46;
    _os_log_impl(&dword_1D353B000, v47, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v49, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 40) closePaths];
}

void __84__BRCXPCRegularIPCsClient_LegacyAdditions___gatherInformationForPath_session_reply___block_invoke_178(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) closePaths];
  unint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 48);
  int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)gatherInformationForPath:(id)a3 reply:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) gatherInformationForPath:reply:]", 2152, v22);
  uint64_t v9 = brc_bread_crumbs();
  __int16 v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v22[0];
    qos_class_t v12 = qos_class_self();
    uint64_t v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = v11;
    __int16 v25 = 2112;
    id v26 = self;
    __int16 v27 = 2112;
    uint64_t v28 = v13;
    __int16 v29 = 2080;
    uint64_t v30 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) gatherInformationForPath:reply:]";
    __int16 v31 = 2112;
    __int16 v32 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__BRCXPCRegularIPCsClient_LegacyAdditions__gatherInformationForPath_reply___block_invoke;
  uint64_t v20[3] = &unk_1E69957B0;
  void v20[4] = self;
  id v14 = v8;
  id v21 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v20);

  if (v15)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    id v19 = v14;
    id v18 = v7;
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", v18, v17, 3221225472, __75__BRCXPCRegularIPCsClient_LegacyAdditions__gatherInformationForPath_reply___block_invoke_179, &unk_1E6999B88, self);
    [(BRCXPCClient *)self performBlock:&v17 withSessionFromURL:v16];
  }
  __brc_leave_section(v22);
}

void __75__BRCXPCRegularIPCsClient_LegacyAdditions__gatherInformationForPath_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75__BRCXPCRegularIPCsClient_LegacyAdditions__gatherInformationForPath_reply___block_invoke_179(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138413058;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      uint64_t v12 = 0;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _gatherInformationForPath:*(void *)(a1 + 40) session:a2 reply:*(void *)(a1 + 48)];
  }
}

- (void)getBackReferencingContainerIDsForURLs:(id)a3 reply:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v6 = a4;
  memset(v46, 0, sizeof(v46));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getBackReferencingContainerIDsForURLs:reply:]", 2167, v46);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v46[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    int v49 = v11;
    __int16 v50 = 2080;
    __int16 v51 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getBackReferencingContainerIDsForURLs:reply:]";
    __int16 v52 = 2112;
    __int16 v53 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __88__BRCXPCRegularIPCsClient_LegacyAdditions__getBackReferencingContainerIDsForURLs_reply___block_invoke;
  uint64_t v44[3] = &unk_1E69957B0;
  v44[4] = self;
  id v22 = v6;
  id v45 = v22;
  int v12 = _brc_ipc_check_applibrary_proxy(self, 1, v44);

  if (v12)
  {
    uint64_t v24 = objc_opt_new();
    __int16 v13 = objc_opt_new();
    group = dispatch_group_create();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v23;
    uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v41 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          LOBYTE(v49) = 0;
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __88__BRCXPCRegularIPCsClient_LegacyAdditions__getBackReferencingContainerIDsForURLs_reply___block_invoke_180;
          uint64_t v36[3] = &unk_1E6999BB0;
          id v18 = v13;
          id v37 = v18;
          uint64_t v38 = v17;
          uint64_t v39 = buf;
          [(BRCXPCClient *)self performBlock:v36 withSessionFromURL:v17];
          if (!*(unsigned char *)(*(void *)&buf[8] + 24))
          {
            dispatch_group_enter(group);
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __88__BRCXPCRegularIPCsClient_LegacyAdditions__getBackReferencingContainerIDsForURLs_reply___block_invoke_2;
            uint64_t v32[3] = &unk_1E6999BD8;
            v32[4] = v17;
            id v33 = v18;
            id v34 = v24;
            __int16 v35 = group;
            [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v17 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v32];
          }
          _Block_object_dispose(buf, 8);
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v14);
    }

    queue = self->super._queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__BRCXPCRegularIPCsClient_LegacyAdditions__getBackReferencingContainerIDsForURLs_reply___block_invoke_3;
    block[3] = &unk_1E69958F0;
    id v28 = v13;
    __int16 v29 = self;
    id v30 = v24;
    id v31 = v22;
    id v20 = v24;
    id v21 = v13;
    dispatch_group_notify(group, queue, block);
  }
  __brc_leave_section(v46);
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__getBackReferencingContainerIDsForURLs_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__getBackReferencingContainerIDsForURLs_reply___block_invoke_180(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:*(void *)(a1 + 40)];
LABEL_3:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    return;
  }
  if (![a2 syncedFolderTypeForURL:*(void *)(a1 + 40)])
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", *(void *)(a1 + 40));
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

    goto LABEL_3;
  }
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__getBackReferencingContainerIDsForURLs_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  uint64_t v6 = [v18 byIDLocalItem];
  int v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v18 faultedLocalItem];
  }
  __int16 v9 = v8;

  if ([v9 isDocument])
  {
    uint64_t v10 = [v9 setOfAppLibraryIDsWithReverseAliases];
    uint64_t v11 = [v10 allObjects];
    id v12 = (void *)v11;
    __int16 v13 = (void *)MEMORY[0x1E4F1CBF0];
    if (v11) {
      __int16 v13 = (void *)v11;
    }
    id v14 = v13;
  }
  else if (v9)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = [*(id *)(a1 + 32) path];
    uint64_t v16 = objc_msgSend(v15, "brc_errorNoDocument:underlyingPOSIXError:", v10, 21);

    id v14 = 0;
    id v5 = (id)v16;
  }
  else
  {
    if (v5)
    {
      id v14 = 0;
      goto LABEL_11;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = [*(id *)(a1 + 32) path];
    objc_msgSend(v17, "brc_errorNoDocument:underlyingPOSIXError:", v10, 2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = 0;
  }

  if (v5)
  {
LABEL_11:
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];

    goto LABEL_13;
  }
  [*(id *)(a1 + 48) setObject:v14 forKeyedSubscript:*(void *)(a1 + 32)];
LABEL_13:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__getBackReferencingContainerIDsForURLs_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    if ([*(id *)(a1 + 32) count] == 1)
    {
      unint64_t v2 = brc_bread_crumbs();
      id v3 = brc_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        id v5 = [*(id *)(a1 + 32) allValues];
        uint64_t v6 = [v5 objectAtIndexedSubscript:0];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = 0;
        *(_WORD *)&buf[22] = 2112;
        id v31 = v6;
        LOWORD(v32) = 2112;
        *(void *)((char *)&v32 + 2) = v2;
        _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      uint64_t v7 = *(void *)(a1 + 56);
      id v8 = [*(id *)(a1 + 32) allValues];
      __int16 v9 = [v8 objectAtIndexedSubscript:0];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v9);
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v31 = __Block_byref_object_copy__42;
      *(void *)&long long v32 = __Block_byref_object_dispose__42;
      *((void *)&v32 + 1) = 0;
      id v14 = *(void **)(a1 + 32);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __88__BRCXPCRegularIPCsClient_LegacyAdditions__getBackReferencingContainerIDsForURLs_reply___block_invoke_181;
      uint64_t v21[3] = &unk_1E6999C00;
      v21[4] = buf;
      [v14 enumerateKeysAndObjectsUsingBlock:v21];
      if (!*(void *)(*(void *)&buf[8] + 40))
      {
        id v19 = brc_bread_crumbs();
        id v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          __88__BRCXPCRegularIPCsClient_LegacyAdditions__getBackReferencingContainerIDsForURLs_reply___block_invoke_3_cold_1();
        }
      }
      uint64_t v15 = brc_bread_crumbs();
      uint64_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)id v22 = 138413058;
        uint64_t v23 = v17;
        __int16 v24 = 2112;
        uint64_t v25 = 0;
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        __int16 v28 = 2112;
        __int16 v29 = v15;
        _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", v22, 0x2Au);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    uint64_t v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2112;
      id v31 = 0;
      LOWORD(v32) = 2112;
      *(void *)((char *)&v32 + 2) = v10;
      _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__getBackReferencingContainerIDsForURLs_reply___block_invoke_181(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_addPartialError:forURL:toError:", a3, a2, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)_sendPausedFileListBatchToUpdater:(id)a3 fromRowID:(unint64_t)a4 batchSize:(unsigned int)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v10 = a6;
  uint64_t v11 = [(BRCXPCClient *)self session];
  uint64_t v12 = [v11 clientDB];
  [v12 assertOnQueue];

  uint64_t v13 = [(BRCXPCClient *)self bundleID];
  id v14 = [(BRCXPCClient *)self session];
  uint64_t v15 = [(BRCXPCClient *)self session];
  uint64_t v16 = [v15 clientDB];
  uint64_t v17 = +[BRCDocumentItem nextPausedDocumentBatchEnumeratorWithBundleID:v13 fromRowID:a4 batchSize:v7 session:v14 db:v16];

  uint64_t v18 = dispatch_group_create();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v17;
  uint64_t v19 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  id v20 = &off_1D3887000;
  if (v19)
  {
    uint64_t v21 = v19;
    int v32 = v7;
    int v22 = 0;
    uint64_t v23 = *(void *)v45;
    do
    {
      int v33 = v22;
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        __int16 v26 = (void *)MEMORY[0x1D9438760]();
        a4 = [v25 dbRowID];
        uint64_t v27 = +[BRCItemToPathLookup lookupForItem:v25];
        __int16 v28 = [v27 coordinatedReadURL];
        if (v28)
        {
          dispatch_group_enter(v18);
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __109__BRCXPCRegularIPCsClient_LegacyAdditions___sendPausedFileListBatchToUpdater_fromRowID_batchSize_completion___block_invoke;
          uint64_t v42[3] = &unk_1E6993698;
          long long v43 = v18;
          [v35 updatePausedFileURL:v28 reply:v42];
        }
      }
      int v22 = v33 + v21;
      uint64_t v21 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v21);
    LODWORD(v7) = v32;
    id v20 = &off_1D3887000;
  }
  else
  {
    int v22 = 0;
  }

  queue = self->super._queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *((void *)v20 + 130);
  block[2] = __109__BRCXPCRegularIPCsClient_LegacyAdditions___sendPausedFileListBatchToUpdater_fromRowID_batchSize_completion___block_invoke_2;
  block[3] = &unk_1E6999C50;
  int v40 = v22;
  int v41 = v7;
  void block[4] = self;
  id v37 = v35;
  id v38 = v10;
  unint64_t v39 = a4;
  id v30 = v35;
  id v31 = v10;
  dispatch_group_notify(v18, queue, block);
}

void __109__BRCXPCRegularIPCsClient_LegacyAdditions___sendPausedFileListBatchToUpdater_fromRowID_batchSize_completion___block_invoke(uint64_t a1)
{
}

void __109__BRCXPCRegularIPCsClient_LegacyAdditions___sendPausedFileListBatchToUpdater_fromRowID_batchSize_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 64) >= *(_DWORD *)(a1 + 68))
  {
    uint64_t v5 = [*(id *)(a1 + 32) session];
    uint64_t v6 = [v5 clientTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__BRCXPCRegularIPCsClient_LegacyAdditions___sendPausedFileListBatchToUpdater_fromRowID_batchSize_completion___block_invoke_185;
    block[3] = &unk_1E6999C28;
    uint64_t v7 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v8 = v7;
    id v10 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    id v12 = v8;
    uint64_t v14 = v9;
    int v15 = *(_DWORD *)(a1 + 68);
    id v13 = v10;
    dispatch_async(v6, block);
  }
  else
  {
    unint64_t v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      __int16 v20 = 2112;
      uint64_t v21 = v2;
      _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __109__BRCXPCRegularIPCsClient_LegacyAdditions___sendPausedFileListBatchToUpdater_fromRowID_batchSize_completion___block_invoke_185(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendPausedFileListBatchToUpdater:*(void *)(a1 + 40) fromRowID:*(void *)(a1 + 56) batchSize:*(unsigned int *)(a1 + 64) completion:*(void *)(a1 + 48)];
}

- (void)getPausedFilesList:(id)a3 reply:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getPausedFilesList:reply:]", 2287, v22);
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v22[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = v10;
    __int16 v25 = 2112;
    __int16 v26 = self;
    __int16 v27 = 2112;
    __int16 v28 = v12;
    __int16 v29 = 2080;
    id v30 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getPausedFilesList:reply:]";
    __int16 v31 = 2112;
    int v32 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__BRCXPCRegularIPCsClient_LegacyAdditions__getPausedFilesList_reply___block_invoke;
  uint64_t v20[3] = &unk_1E69957B0;
  void v20[4] = self;
  id v13 = v7;
  id v21 = v13;
  int v14 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.internal.fileprovider.in-place-collaboration", v20);

  if (v14)
  {
    int v15 = [(BRCXPCClient *)self session];
    uint64_t v16 = [v15 clientTruthWorkloop];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__BRCXPCRegularIPCsClient_LegacyAdditions__getPausedFilesList_reply___block_invoke_186;
    uint64_t v17[3] = &unk_1E69946C8;
    v17[4] = self;
    id v18 = v6;
    id v19 = v13;
    dispatch_async(v16, v17);
  }
  __brc_leave_section(v22);
}

void __69__BRCXPCRegularIPCsClient_LegacyAdditions__getPausedFilesList_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __69__BRCXPCRegularIPCsClient_LegacyAdditions__getPausedFilesList_reply___block_invoke_186(void *a1)
{
  unint64_t v2 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v3 = [v2 iWorkFetchPausedFilesBatchSize];

  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  return [v4 _sendPausedFileListBatchToUpdater:v5 fromRowID:0 batchSize:v3 completion:v6];
}

- (void)waitForFileSystemChangeProcessingWithReply:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  memset(v38, 0, sizeof(v38));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) waitForFileSystemChangeProcessingWithReply:]", 2305, v38);
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v38[0];
    qos_class_t v9 = qos_class_self();
    id v10 = BRCPrettyPrintEnumWithContext(v9, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    int v40 = v10;
    __int16 v41 = 2080;
    long long v42 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) waitForFileSystemChangeProcessingWithReply:]";
    __int16 v43 = 2112;
    long long v44 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __87__BRCXPCRegularIPCsClient_LegacyAdditions__waitForFileSystemChangeProcessingWithReply___block_invoke;
  uint64_t v36[3] = &unk_1E69957B0;
  void v36[4] = self;
  id v11 = v5;
  id v37 = v11;
  int v12 = _brc_ipc_spi(self, 1, (uint64_t)a2, v36);

  if (v12)
  {
    memset(v35, 0, sizeof(v35));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) waitForFileSystemChangeProcessingWithReply:]", 2307, v35);
    uint64_t v13 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v35[0];
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      int v40 = v13;
      _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ asks us to wait for the fsevents to be processed%@", buf, 0x20u);
    }

    int v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient(LegacyAdditions) waitForFileSystemChangeProcessingWithReply:]();
    }

    uint64_t v17 = dispatch_semaphore_create(0);
    id v18 = [(BRCXPCClient *)self session];
    id v19 = [v18 fsEventsMonitorForSyncedFolderType:1];
    [v19 signalAfterCurrentFSEvent:v17];

    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    __int16 v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient(LegacyAdditions) waitForFileSystemChangeProcessingWithReply:]();
    }

    long long v33 = 0uLL;
    uint64_t v34 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) waitForFileSystemChangeProcessingWithReply:]", 2316, &v33);
    uint64_t v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient(LegacyAdditions) waitForFileSystemChangeProcessingWithReply:]();
    }

    *(_OWORD *)buf = v33;
    *(void *)&buf[16] = v34;
    uint64_t v24 = [v18 fsReader];
    __int16 v25 = [v24 lostScanGroup];
    queue = self->super._queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__BRCXPCRegularIPCsClient_LegacyAdditions__waitForFileSystemChangeProcessingWithReply___block_invoke_187;
    block[3] = &unk_1E69962E0;
    long long v31 = *(_OWORD *)buf;
    uint64_t v32 = *(void *)&buf[16];
    void block[4] = self;
    id v29 = v18;
    id v30 = v11;
    id v27 = v18;
    dispatch_group_notify(v25, queue, block);

    __brc_leave_section(v35);
  }
  __brc_leave_section(v38);
}

uint64_t __87__BRCXPCRegularIPCsClient_LegacyAdditions__waitForFileSystemChangeProcessingWithReply___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    qos_class_t v9 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply()%@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__waitForFileSystemChangeProcessingWithReply___block_invoke_187(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v11 = *(_OWORD *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 72);
  unint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __int16 v8 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v2;
    _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx lost scan is done, notifying client %@%@", buf, 0x20u);
  }

  uint64_t v4 = [*(id *)(a1 + 40) clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__BRCXPCRegularIPCsClient_LegacyAdditions__waitForFileSystemChangeProcessingWithReply___block_invoke_188;
  block[3] = &unk_1E6993698;
  id v10 = *(id *)(a1 + 40);
  dispatch_async_and_wait(v4, block);

  id v5 = brc_bread_crumbs();
  int v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply()%@", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __brc_leave_section((uint64_t *)&v11);
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__waitForFileSystemChangeProcessingWithReply___block_invoke_188(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) clientDB];
  [v1 flush];
}

- (void)resolveFileObjectIDToURL:(id)a3 reply:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) resolveFileObjectIDToURL:reply:]", 2332, v30);
  __int16 v8 = brc_bread_crumbs();
  qos_class_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v30[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v32 = v10;
    __int16 v33 = 2112;
    uint64_t v34 = self;
    __int16 v35 = 2112;
    __int16 v36 = v12;
    __int16 v37 = 2080;
    id v38 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) resolveFileObjectIDToURL:reply:]";
    __int16 v39 = 2112;
    int v40 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __75__BRCXPCRegularIPCsClient_LegacyAdditions__resolveFileObjectIDToURL_reply___block_invoke;
  uint64_t v28[3] = &unk_1E69957B0;
  v28[4] = self;
  id v13 = v7;
  id v29 = v13;
  int v14 = _brc_ipc_check_applibrary_proxy(self, 1, v28);

  if (v14)
  {
    __int16 v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient(LegacyAdditions) resolveFileObjectIDToURL:reply:]();
    }

    __int16 v17 = [(BRCXPCClient *)self session];
    tracker = self->super._tracker;
    uint64_t v19 = [v17 readOnlyWorkloop];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __75__BRCXPCRegularIPCsClient_LegacyAdditions__resolveFileObjectIDToURL_reply___block_invoke_189;
    v23[3] = &unk_1E6993D18;
    id v24 = v6;
    id v20 = v17;
    id v25 = v20;
    __int16 v26 = self;
    id v27 = v13;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__BRCXPCRegularIPCsClient_LegacyAdditions__resolveFileObjectIDToURL_reply___block_invoke_190;
    uint64_t v21[3] = &unk_1E6994600;
    v21[4] = self;
    id v22 = v27;
    brc_task_tracker_async_with_logs(tracker, v19, v23, v21);
  }
  __brc_leave_section(v30);
}

void __75__BRCXPCRegularIPCsClient_LegacyAdditions__resolveFileObjectIDToURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413826;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v7, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75__BRCXPCRegularIPCsClient_LegacyAdditions__resolveFileObjectIDToURL_reply___block_invoke_189(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  int v3 = [*(id *)(a1 + 32) isFolderOrAliasID];
  uint64_t v4 = *(void **)v2;
  id v5 = *(void **)(v2 + 8);
  if (v3)
  {
    uint64_t v6 = [v4 folderID];
    uint64_t v7 = [v6 unsignedLongLongValue];
    uint64_t v8 = [*(id *)(a1 + 40) readOnlyDB];
    [v5 globalItemByFileID:v7 db:v8];
  }
  else
  {
    uint64_t v6 = [v4 documentID];
    uint64_t v9 = [v6 unsignedIntValue];
    uint64_t v8 = [*(id *)(a1 + 40) readOnlyDB];
    [v5 globalItemByDocumentID:v9 db:v8];
  uint64_t v10 = };

  if (v10)
  {
    __int16 v11 = [[BRCItemToPathLookup alloc] initWithItem:v10];
    uint64_t v12 = [(BRCItemToPathLookup *)v11 byFileSystemID];
    __int16 v13 = [v10 st];
    uint64_t v14 = [v13 logicalName];
    __int16 v15 = [v12 logicalURLWithLogicalName:v14];

    if ([*(id *)(a1 + 48) isSandboxed])
    {
      uint64_t v16 = *MEMORY[0x1E4F14008];
      __int16 v17 = objc_msgSend(v15, "brc_issueSandboxExtensionOfClass:error:", *MEMORY[0x1E4F14008], 0);
      if ([v10 isFault])
      {
        id v18 = [v12 physicalURL];
        __int16 v19 = objc_msgSend(v18, "brc_issueSandboxExtensionOfClass:error:", v16, 0);
LABEL_16:
        id v30 = brc_bread_crumbs();
        long long v31 = brc_default_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = *(void *)(a1 + 48);
          int v33 = 138413826;
          uint64_t v34 = v32;
          __int16 v35 = 2112;
          __int16 v36 = v15;
          __int16 v37 = 2112;
          id v38 = v17;
          __int16 v39 = 2112;
          int v40 = v18;
          __int16 v41 = 2112;
          long long v42 = v19;
          __int16 v43 = 2112;
          long long v44 = 0;
          __int16 v45 = 2112;
          long long v46 = v30;
          _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v33, 0x48u);
        }

        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        goto LABEL_19;
      }
      id v18 = 0;
    }
    else
    {
      id v18 = 0;
      __int16 v17 = 0;
    }
    __int16 v19 = 0;
    goto LABEL_16;
  }
  id v20 = brc_bread_crumbs();
  uint64_t v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    __75__BRCXPCRegularIPCsClient_LegacyAdditions__resolveFileObjectIDToURL_reply___block_invoke_189_cold_1();
  }

  id v22 = brc_bread_crumbs();
  uint64_t v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = *(void *)(a1 + 48);
    id v25 = (void *)MEMORY[0x1E4F28C58];
    __int16 v26 = [*(id *)(a1 + 32) description];
    id v27 = objc_msgSend(v25, "brc_errorItemNotFound:", v26);
    int v33 = 138413826;
    uint64_t v34 = v24;
    __int16 v35 = 2112;
    __int16 v36 = 0;
    __int16 v37 = 2112;
    id v38 = 0;
    __int16 v39 = 2112;
    int v40 = 0;
    __int16 v41 = 2112;
    long long v42 = 0;
    __int16 v43 = 2112;
    long long v44 = v27;
    __int16 v45 = 2112;
    long long v46 = v22;
    _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v33, 0x48u);
  }
  uint64_t v28 = *(void *)(a1 + 56);
  id v29 = (void *)MEMORY[0x1E4F28C58];
  __int16 v15 = [*(id *)(a1 + 32) description];
  id v18 = objc_msgSend(v29, "brc_errorItemNotFound:", v15);
  (*(void (**)(uint64_t, void, void, void, void, void *))(v28 + 16))(v28, 0, 0, 0, 0, v18);
LABEL_19:
}

void __75__BRCXPCRegularIPCsClient_LegacyAdditions__resolveFileObjectIDToURL_reply___block_invoke_190(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = brc_bread_crumbs();
  int v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413826;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    __int16 v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v8, 0x48u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, 0, v7);
}

- (void)getBookmarkDataForURL:(id)a3 onlyAllowItemKnowByServer:(BOOL)a4 allowAccessByBundleID:(id)a5 reply:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  memset(v29, 0, sizeof(v29));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) getBookmarkDataForURL:onlyAllowItemKnowByServer:allowAccessByBundleID:reply:]", 2418, v29);
  uint64_t v13 = brc_bread_crumbs();
  __int16 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v23 = v12;
    BOOL v15 = a4;
    id v16 = v11;
    uint64_t v17 = v29[0];
    qos_class_t v18 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v20 = [v10 path];
    *(_DWORD *)buf = 134219266;
    uint64_t v31 = v17;
    __int16 v32 = 2112;
    int v33 = self;
    __int16 v34 = 2112;
    id v35 = v19;
    __int16 v36 = 2080;
    __int16 v37 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) getBookmarkDataForURL:onlyAllowItemKnowByServer:allowAccessByBundleID:reply:]";
    __int16 v38 = 2112;
    __int16 v39 = v20;
    __int16 v40 = 2112;
    __int16 v41 = v13;
    _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);

    id v11 = v16;
    a4 = v15;
    id v12 = v23;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __120__BRCXPCRegularIPCsClient_LegacyAdditions__getBookmarkDataForURL_onlyAllowItemKnowByServer_allowAccessByBundleID_reply___block_invoke;
  uint64_t v24[3] = &unk_1E6999980;
  BOOL v28 = a4;
  id v21 = v10;
  id v25 = v21;
  __int16 v26 = self;
  id v22 = v12;
  id v27 = v22;
  [(BRCXPCClient *)self accessLogicalOrPhysicalURL:v21 accessKind:1 dbAccessKind:0 synchronouslyIfPossible:0 handler:v24];

  __brc_leave_section(v29);
}

void __120__BRCXPCRegularIPCsClient_LegacyAdditions__getBookmarkDataForURL_onlyAllowItemKnowByServer_allowAccessByBundleID_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!v7)
  {
    id v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_30;
  }
  uint64_t v9 = [v7 byIDLocalItem];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v7 faultedLocalItem];
  }
  __int16 v14 = v11;

  if ([v14 isKnownByServer])
  {
    if (([v14 isFSRoot] & 1) == 0)
    {
      uint64_t v13 = [v14 bookmarkData];
      if ([v14 isDocument])
      {
        BOOL v15 = [v14 asDocument];
        id v16 = [v15 currentVersion];
        uint64_t v17 = [v16 ckInfo];
        id v12 = [v17 etag];
      }
      else
      {
        BOOL v15 = [v14 st];
        id v16 = [v15 ckInfo];
        id v12 = [v16 etag];
      }

      goto LABEL_29;
    }
LABEL_12:
    id v21 = [v7 relpath];
    if ((v21 || ([v7 byPathRelpath], (id v21 = objc_claimAutoreleasedReturnValue()) != 0))
      && ([v21 exists] & 1) != 0)
    {
      if ([v21 isDocument])
      {
        id v22 = NSString;
        id v23 = [v14 serverZone];
        uint64_t v24 = v23;
        if (!v23)
        {
          int v3 = +[BRCPathToItemLookup lookupForRelativePath:v21];
          uint64_t v4 = [v3 clientZone];
          uint64_t v24 = [v4 serverZone];
        }
        uint64_t v13 = [v22 bookmarkDataWithRelativePath:v21 serverZone:v24];
        if (!v23)
        {
        }
        goto LABEL_28;
      }
      __int16 v32 = (void *)MEMORY[0x1E4F28C58];
      BOOL v28 = [*(id *)(a1 + 32) path];
      id v29 = v32;
      id v30 = v28;
      uint64_t v31 = 21;
    }
    else
    {
      id v25 = brc_bread_crumbs();
      __int16 v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v40 = *(void *)(a1 + 32);
        int v41 = 138413058;
        uint64_t v42 = v40;
        __int16 v43 = 2112;
        long long v44 = v21;
        __int16 v45 = 2112;
        id v46 = v7;
        __int16 v47 = 2112;
        uint64_t v48 = v25;
        _os_log_debug_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] no local item for %@\n  path:   %@\n  lookup: %@\n%@", (uint8_t *)&v41, 0x2Au);
      }

      id v27 = (void *)MEMORY[0x1E4F28C58];
      BOOL v28 = [*(id *)(a1 + 32) path];
      id v29 = v27;
      id v30 = v28;
      uint64_t v31 = 2;
    }
    uint64_t v33 = objc_msgSend(v29, "brc_errorNoDocument:underlyingPOSIXError:", v30, v31);

    uint64_t v13 = 0;
    id v8 = (id)v33;
LABEL_28:

    id v12 = 0;
    goto LABEL_29;
  }
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_12;
  }
  qos_class_t v18 = (void *)MEMORY[0x1E4F28C58];
  id v19 = [*(id *)(a1 + 32) path];
  uint64_t v20 = objc_msgSend(v18, "brc_errorNotInCloud:", v19);

  id v12 = 0;
  uint64_t v13 = 0;
  id v8 = (id)v20;
LABEL_29:

LABEL_30:
  __int16 v34 = brc_bread_crumbs();
  id v35 = brc_default_log();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    uint64_t v36 = *(void *)(a1 + 40);
    __int16 v37 = objc_msgSend(v8, "brc_wrappedError");
    int v41 = 138413314;
    uint64_t v42 = v36;
    __int16 v43 = 2112;
    long long v44 = v13;
    __int16 v45 = 2112;
    id v46 = v12;
    __int16 v47 = 2112;
    uint64_t v48 = v37;
    __int16 v49 = 2112;
    __int16 v50 = v34;
    _os_log_impl(&dword_1D353B000, v35, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v41, 0x34u);
  }
  uint64_t v38 = *(void *)(a1 + 48);
  __int16 v39 = objc_msgSend(v8, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *, void *))(v38 + 16))(v38, v13, v12, v39);
}

- (void)refreshSharingStateForItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v33, 0, sizeof(v33));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) refreshSharingStateForItemIdentifier:reply:]", 2425, v33);
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v33[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v35 = v10;
    __int16 v36 = 2112;
    __int16 v37 = self;
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2080;
    int v41 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) refreshSharingStateForItemIdentifier:reply:]";
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke;
  uint64_t v31[3] = &unk_1E69957B0;
  v31[4] = self;
  id v13 = v7;
  id v32 = v13;
  int v14 = _brc_ipc_check_applibrary_proxy(self, 1, v31);

  if (v14)
  {
    memset(v30, 0, sizeof(v30));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) refreshSharingStateForItemIdentifier:reply:]", 2427, v30);
    BOOL v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v30[0];
      qos_class_t v18 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v6 UTF8String];
      *(_DWORD *)buf = 134219266;
      uint64_t v35 = v17;
      __int16 v36 = 2112;
      __int16 v37 = self;
      __int16 v38 = 2112;
      id v39 = v19;
      __int16 v40 = 2080;
      int v41 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) refreshSharingStateForItemIdentifier:reply:]";
      __int16 v42 = 2080;
      uint64_t v43 = v20;
      __int16 v44 = 2112;
      __int16 v45 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s Refreshing sharing state for %s%@", buf, 0x3Eu);
    }
    id v21 = [(BRCXPCClient *)self session];
    tracker = self->super._tracker;
    id v23 = [v21 clientTruthWorkloop];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_191;
    uint64_t v25[3] = &unk_1E6993D18;
    id v26 = v6;
    id v24 = v21;
    id v27 = v24;
    BOOL v28 = self;
    id v29 = v13;
    brc_task_tracker_async_with_logs(tracker, v23, v25, 0);

    __brc_leave_section(v30);
  }
  __brc_leave_section(v33);
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_191(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__42;
  __int16 v49 = __Block_byref_object_dispose__42;
  id v50 = 0;
  uint64_t v2 = [MEMORY[0x1E4F594D0] fileObjectIDWithString:*(void *)(a1 + 32)];
  id v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient(LegacyAdditions) resolveFileObjectIDToURL:reply:]();
  }

  if (v2)
  {
    if ([v2 isDocumentID])
    {
      id v5 = *(void **)(a1 + 40);
      uint64_t v6 = [v2 documentID];
      uint64_t v7 = objc_msgSend(v5, "globalItemByDocumentID:", objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_8;
    }
    if ([v2 isFolderOrAliasID])
    {
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v6 = [v2 folderID];
      uint64_t v7 = objc_msgSend(v8, "globalItemByFileID:", objc_msgSend(v6, "unsignedIntValue"));
LABEL_8:
      __int16 v9 = (void *)v46[5];
      v46[5] = v7;

      id v10 = (void *)v46[5];
      if (v10)
      {
        __int16 v11 = [v10 clientZone];
        id v12 = [(id)v46[5] itemID];
        uint64_t v13 = [v11 serverRankByItemID:v12];

        int v14 = [(id)v46[5] clientZone];
        [v14 scheduleSyncDownFirst];

        BOOL v15 = [BRCSharingCopyShareOperation alloc];
        uint64_t v16 = v46[5];
        uint64_t v17 = [*(id *)(a1 + 48) session];
        qos_class_t v18 = [(BRCSharingCopyShareOperation *)v15 initWithItem:v16 sessionContext:v17];

        [(_BRCFrameworkOperation *)v18 setIgnoreMissingRemoteClientProxy:1];
        id v19 = [(_BRCOperation *)v18 callbackQueue];
        uint64_t v20 = [*(id *)(a1 + 40) clientTruthWorkloop];
        dispatch_set_target_queue(v19, v20);

        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_196;
        v40[3] = &unk_1E6999CA0;
        uint64_t v43 = &v45;
        uint64_t v44 = v13;
        id v21 = *(void **)(a1 + 56);
        v40[4] = *(void *)(a1 + 48);
        id v42 = v21;
        id v41 = *(id *)(a1 + 40);
        [(_BRCOperation *)v18 setFinishBlock:v40];
        [(_BRCOperation *)v18 schedule];
      }
      else
      {
        id v29 = brc_bread_crumbs();
        id v30 = brc_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          __75__BRCXPCRegularIPCsClient_LegacyAdditions__resolveFileObjectIDToURL_reply___block_invoke_189_cold_1();
        }

        uint64_t v31 = brc_bread_crumbs();
        id v32 = brc_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = *(void *)(a1 + 48);
          __int16 v34 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v35 = [*(id *)(a1 + 32) description];
          __int16 v36 = objc_msgSend(v34, "brc_errorItemNotFound:", v35);
          *(_DWORD *)buf = 138412802;
          uint64_t v52 = v33;
          __int16 v53 = 2112;
          uint64_t v54 = v36;
          __int16 v55 = 2112;
          char v56 = v31;
          _os_log_impl(&dword_1D353B000, v32, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
        uint64_t v37 = *(void *)(a1 + 56);
        __int16 v38 = (void *)MEMORY[0x1E4F28C58];
        qos_class_t v18 = [*(id *)(a1 + 32) description];
        id v39 = objc_msgSend(v38, "brc_errorItemNotFound:", v18);
        (*(void (**)(uint64_t, void *))(v37 + 16))(v37, v39);
      }
      goto LABEL_20;
    }
  }
  id v22 = brc_bread_crumbs();
  id v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_191_cold_1();
  }

  id v24 = brc_bread_crumbs();
  id v25 = brc_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    uint64_t v26 = *(void *)(a1 + 48);
    id v27 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"itemIdentifier", *(void *)(a1 + 32));
    *(_DWORD *)buf = 138412802;
    uint64_t v52 = v26;
    __int16 v53 = 2112;
    uint64_t v54 = v27;
    __int16 v55 = 2112;
    char v56 = v24;
    _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }
  uint64_t v28 = *(void *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"itemIdentifier", *(void *)(a1 + 32));
  qos_class_t v18 = (BRCSharingCopyShareOperation *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BRCSharingCopyShareOperation *))(v28 + 16))(v28, v18);
LABEL_20:

  _Block_object_dispose(&v45, 8);
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v57 = brc_bread_crumbs();
      __int16 v58 = brc_default_log();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT)) {
        __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_196_cold_2();
      }
    }
  }
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) clientZone];
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) itemID];
  uint64_t v9 = [v7 serverRankByItemID:v8];

  if (*(void *)(a1 + 64) == v9)
  {
    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) clientZone];
    __int16 v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) itemID];
    uint64_t v12 = [v10 itemByItemID:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if ((objc_msgSend(v6, "brc_containsCloudKitErrorCode:", 11) & 1) != 0
      || objc_msgSend(v6, "brc_isCloudKitErrorImplyingZoneNeedsCreation"))
    {

      BOOL v15 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) clientZone];
      int v16 = [v15 isSharedZone];

      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      if (v16)
      {
        [*(id *)(v17 + 40) markForceRejected];
        qos_class_t v18 = brc_bread_crumbs();
        id v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *(BRCItemToPathLookup **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v63 = v20;
          __int16 v64 = 2112;
          uint64_t v65 = v18;
          _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] force deleting item with missing share in shared zone %@%@", buf, 0x16u);
        }
        goto LABEL_17;
      }
      objc_msgSend(*(id *)(v17 + 40), "setSharingOptions:", objc_msgSend(*(id *)(v17 + 40), "sharingOptions") & 0xFFFFFFFFFFFFFFB3);
      qos_class_t v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) itemID];
        *(_DWORD *)buf = 138412546;
        uint64_t v63 = v29;
        __int16 v64 = 2112;
        uint64_t v65 = v18;
        _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Clearing sharing options on missing share for %@%@", buf, 0x16u);
LABEL_16:
      }
    }
    else
    {
      if (v6) {
        goto LABEL_18;
      }
      qos_class_t v18 = [v5 objectForKeyedSubscript:@"share"];
      id v19 = [v5 objectForKeyedSubscript:@"rootURL"];
      uint64_t v61 = 0;
      if ([v18 deserializeSharingOptions:&v61 error:0])
      {
        uint64_t v36 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) sharingOptions];
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSharingOptions:v61 | (4 * (v19 == 0)) | v36 & 0xFFFFFFFFFFFFFF83];
        uint64_t v37 = brc_bread_crumbs();
        __int16 v38 = brc_default_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) sharingOptions];
          BRCPrettyPrintBitmap();
          id v39 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
          __int16 v40 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) itemID];
          *(_DWORD *)buf = 138412802;
          uint64_t v63 = v39;
          __int16 v64 = 2112;
          uint64_t v65 = v40;
          __int16 v66 = 2112;
          uint64_t v67 = v37;
          _os_log_impl(&dword_1D353B000, v38, OS_LOG_TYPE_DEFAULT, "[WARNING] Learning new sharing options %@ from refresh state for %@%@", buf, 0x20u);
        }
        int v41 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) sharingOptions];
        id v29 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) orig];
        if ((([(BRCItemToPathLookup *)v29 sharingOptions] ^ v41) & 0x20) != 0)
        {
          int v42 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isSharedToMeTopLevelItem];

          if (!v42) {
            goto LABEL_17;
          }
          uint64_t v43 = brc_bread_crumbs();
          uint64_t v44 = brc_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v60[0] = 114;
            uint64_t v45 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) st];
            if ([v45 mode]) {
              char v46 = 119;
            }
            else {
              char v46 = 45;
            }
            v60[1] = v46;
            uint64_t v47 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) st];
            if (([v47 mode] & 2) != 0) {
              char v48 = 120;
            }
            else {
              char v48 = 45;
            }
            v60[2] = v48;
            __int16 v49 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) st];
            v60[3] = ((char)(32 * [v49 mode]) >> 7) & 0x4C;
            v60[4] = 0;
            id v50 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) itemID];
            *(_DWORD *)buf = 136315650;
            uint64_t v63 = (BRCItemToPathLookup *)v60;
            __int16 v64 = 2112;
            uint64_t v65 = v50;
            __int16 v66 = 2112;
            uint64_t v67 = v43;
            _os_log_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Learning updated item mode %s from refresh state for %@%@", buf, 0x20u);
          }
          id v29 = [[BRCItemToPathLookup alloc] initWithItem:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
          uint64_t v51 = [(BRCItemToPathLookup *)v29 byFileSystemID];
          *(_DWORD *)buf = 0;
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_204;
          v59[3] = &unk_1E6999C78;
          v59[4] = *(void *)(a1 + 56);
          if (([v51 performOnOpenFileDescriptor:v59 error:buf] & 1) == 0)
          {
            uint64_t v52 = brc_bread_crumbs();
            __int16 v53 = brc_default_log();
            if (os_log_type_enabled(v53, (os_log_type_t)0x90u)) {
              __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_196_cold_1((int *)buf);
            }
          }
          if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isDocument])
          {
            uint64_t v54 = [*(id *)(a1 + 40) fsWriter];
            __int16 v55 = [(BRCItemToPathLookup *)v29 coordinatedReadURL];
            char v56 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) asDocument];
            [v54 applyLocalEditIfNecessaryToURL:v55 forItem:v56 serverItem:0 forDelete:0 error:0];
          }
          [(BRCItemToPathLookup *)v29 closePaths];
        }
        goto LABEL_16;
      }
    }
LABEL_17:

    id v6 = 0;
LABEL_18:
    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) diffAgainstOriginalItem])
    {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) saveToDBForServerEdit:1 keepAliases:0];
      id v30 = [*(id *)(a1 + 40) clientDB];
      [v30 flushToMakeEditsVisibleToIPCReaders];
    }
    uint64_t v31 = brc_bread_crumbs();
    id v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = *(BRCItemToPathLookup **)(a1 + 32);
      __int16 v34 = objc_msgSend(v6, "brc_wrappedError");
      *(_DWORD *)buf = 138412802;
      uint64_t v63 = v33;
      __int16 v64 = 2112;
      uint64_t v65 = v34;
      __int16 v66 = 2112;
      uint64_t v67 = v31;
      _os_log_impl(&dword_1D353B000, v32, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v27 = *(void *)(a1 + 48);
    uint64_t v28 = objc_msgSend(v6, "brc_wrappedError");
    goto LABEL_23;
  }
  brc_bread_crumbs();
  id v21 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
  id v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v63 = v21;
    _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Server zone was updated during refresh - avoiding races%@", buf, 0xCu);
  }

  id v23 = brc_bread_crumbs();
  id v24 = brc_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v25 = *(BRCItemToPathLookup **)(a1 + 32);
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemChanged");
    *(_DWORD *)buf = 138412802;
    uint64_t v63 = v25;
    __int16 v64 = 2112;
    uint64_t v65 = v26;
    __int16 v66 = 2112;
    uint64_t v67 = v23;
    _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }
  uint64_t v27 = *(void *)(a1 + 48);
  uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemChanged");
LABEL_23:
  uint64_t v35 = (void *)v28;
  (*(void (**)(uint64_t, uint64_t))(v27 + 16))(v27, v28);
}

uint64_t __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_204(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) st];
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isDocument])
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) asDocument];
    uint64_t v2 = [v6 currentVersion];
    mode_t v7 = +[BRCStageRegistry computeItemModeFromStatInfo:isPackage:](BRCStageRegistry, "computeItemModeFromStatInfo:isPackage:", v5, [v2 isPackage]);
  }
  else
  {
    mode_t v7 = +[BRCStageRegistry computeItemModeFromStatInfo:v5 isPackage:0];
  }

  if (fchmod(a2, v7)) {
    return *__error();
  }
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) st];
  int v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isDocument];
  if (v9)
  {
    uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) asDocument];
    id v10 = [v2 currentVersion];
  }
  else
  {
    id v10 = 0;
  }
  __int16 v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) clientZone];
  BOOL v12 = +[BRCStageRegistry applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:](BRCStageRegistry, "applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:", a2, v8, v10, v11, [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) sharingOptions]);

  if (v9)
  {
  }
  if (!v12) {
    return *__error();
  }
  else {
    return 0;
  }
}

- (void)checkIfItemIsShareableWithInode:(unint64_t)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient(LegacyAdditions) checkIfItemIsShareableWithInode:reply:]", 2855, v24);
  mode_t v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v24[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v9;
    __int16 v27 = 2112;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 2080;
    id v32 = "-[BRCXPCRegularIPCsClient(LegacyAdditions) checkIfItemIsShareableWithInode:reply:]";
    __int16 v33 = 2112;
    __int16 v34 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  BOOL v12 = (void *)*MEMORY[0x1E4F59328];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__BRCXPCRegularIPCsClient_LegacyAdditions__checkIfItemIsShareableWithInode_reply___block_invoke;
  uint64_t v22[3] = &unk_1E69957B0;
  uint8_t v22[4] = self;
  id v13 = v6;
  id v23 = v13;
  LODWORD(v12) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v12, v22);

  if (v12)
  {
    int v14 = [(BRCXPCClient *)self session];
    BOOL v15 = [v14 readOnlyWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__BRCXPCRegularIPCsClient_LegacyAdditions__checkIfItemIsShareableWithInode_reply___block_invoke_207;
    block[3] = &unk_1E6995C20;
    unint64_t v21 = a3;
    id v18 = v14;
    id v19 = self;
    id v20 = v13;
    id v16 = v14;
    dispatch_async(v15, block);
  }
  __brc_leave_section(v24);
}

void __82__BRCXPCRegularIPCsClient_LegacyAdditions__checkIfItemIsShareableWithInode_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __82__BRCXPCRegularIPCsClient_LegacyAdditions__checkIfItemIsShareableWithInode_reply___block_invoke_207(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[7];
  uint64_t v4 = [v2 readOnlyDB];
  id v5 = [v2 globalItemByFileID:v3 db:v4];

  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = a1[5];
    int v9 = 138413058;
    uint64_t v10 = v8;
    __int16 v11 = 1024;
    int v12 = [v5 isShareableItem];
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v9, 0x26u);
  }

  (*(void (**)(void, uint64_t, void))(a1[6] + 16))(a1[6], [v5 isShareableItem], 0);
}

void __59__BRCXPCRegularIPCsClient_checkinAskClientIfUsingUbiquity___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __59__BRCXPCRegularIPCsClient_checkinAskClientIfUsingUbiquity___block_invoke_cold_1();
  }
}

- (void)getContainerURLForID:(id)a3 reply:(id)a4
{
}

- (void)presyncContainerWithID:(id)a3 reply:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient presyncContainerWithID:reply:]", 1632, v20);
  uint64_t v8 = brc_bread_crumbs();
  int v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v20[0];
    qos_class_t v11 = qos_class_self();
    int v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v12;
    __int16 v27 = 2080;
    uint64_t v28 = "-[BRCXPCRegularIPCsClient presyncContainerWithID:reply:]";
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__BRCXPCRegularIPCsClient_presyncContainerWithID_reply___block_invoke;
  v18[3] = &unk_1E69957B0;
  void v18[4] = self;
  id v13 = v7;
  id v19 = v13;
  int v14 = _brc_ipc_check_applibrary_proxy(self, 1, v18);

  if (v14)
  {
    __int16 v15 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v6];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__BRCXPCRegularIPCsClient_presyncContainerWithID_reply___block_invoke_295;
    v16[3] = &unk_1E699A638;
    void v16[4] = self;
    id v17 = v13;
    [(BRCXPCClient *)self _setupAppLibraryAndZoneWithID:v15 recreateDocumentsIfNeeded:0 reply:v16];
  }
  __brc_leave_section(v20);
}

void __56__BRCXPCRegularIPCsClient_presyncContainerWithID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_msgSend(v3, "brc_wrappedError");
    int v10 = 138412802;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  int v9 = objc_msgSend(v3, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

void __56__BRCXPCRegularIPCsClient_presyncContainerWithID_reply___block_invoke_295(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = objc_msgSend(v6, "brc_wrappedError");
    int v13 = 138412802;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  __int16 v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
}

- (void)getContainerURLForID:(id)a3 forProcess:(id *)a4 reply:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  memset(v37, 0, sizeof(v37));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainerURLForID:forProcess:reply:]", 1647, v37);
  int v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v37[0];
    qos_class_t v13 = qos_class_self();
    uint64_t v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v14;
    __int16 v39 = 2080;
    __int16 v40 = "-[BRCXPCRegularIPCsClient getContainerURLForID:forProcess:reply:]";
    __int16 v41 = 2112;
    int v42 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __65__BRCXPCRegularIPCsClient_getContainerURLForID_forProcess_reply___block_invoke;
  uint64_t v35[3] = &unk_1E69957B0;
  void v35[4] = self;
  id v15 = v9;
  id v36 = v15;
  int v16 = _brc_ipc_check_applibrary_proxy(self, 1, v35);

  if (v16)
  {
    __int16 v17 = [BRCClientPrivilegesDescriptor alloc];
    long long v18 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a4->var0;
    *(_OWORD *)&buf[16] = v18;
    uint64_t v19 = [(BRCClientPrivilegesDescriptor *)v17 initWithAuditToken:buf];
    id v20 = [(BRCClientPrivilegesDescriptor *)v19 appLibraryIDs];
    BOOL v21 = v20 == 0;

    if (v21)
    {
      __int16 v25 = brc_bread_crumbs();
      uint64_t v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        __int16 v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = [(BRCClientPrivilegesDescriptor *)v19 applicationIdentifier];
        __int16 v29 = objc_msgSend(v27, "brc_errorNoAppLibraryForBundle:", v28);
        *(_DWORD *)buf = 138413570;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = 0;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&unsigned char buf[24] = 0;
        __int16 v39 = 2112;
        __int16 v40 = 0;
        __int16 v41 = 2112;
        int v42 = v29;
        __int16 v43 = 2112;
        uint64_t v44 = v25;
        _os_log_impl(&dword_1D353B000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);
      }
      id v30 = (void *)MEMORY[0x1E4F28C58];
      id v24 = [(BRCClientPrivilegesDescriptor *)v19 applicationIdentifier];
      uint64_t v31 = objc_msgSend(v30, "brc_errorNoAppLibraryForBundle:", v24);
      (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v31);
    }
    else
    {
      if (!v8)
      {
        id v8 = [(BRCClientPrivilegesDescriptor *)v19 defaultAppLibraryID];
      }
      uint64_t v22 = [(BRCClientPrivilegesDescriptor *)v19 appLibraryIDs];
      char v23 = [v22 containsObject:v8];

      if (v23)
      {
        id v24 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v8];
        [(BRCXPCClient *)self _setupAppLibraryAndZoneWithID:v24 recreateDocumentsIfNeeded:0 reply:v15];
      }
      else
      {
        id v32 = brc_bread_crumbs();
        __int16 v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          __int16 v34 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"containerID", v8);
          *(_DWORD *)buf = 138413570;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = 0;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&unsigned char buf[24] = 0;
          __int16 v39 = 2112;
          __int16 v40 = 0;
          __int16 v41 = 2112;
          int v42 = v34;
          __int16 v43 = 2112;
          uint64_t v44 = v32;
          _os_log_impl(&dword_1D353B000, v33, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);
        }
        id v24 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"containerID", v8);
        (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v24);
      }
    }
  }
  __brc_leave_section(v37);
}

void __65__BRCXPCRegularIPCsClient_getContainerURLForID_forProcess_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_msgSend(v3, "brc_wrappedError");
    int v10 = 138413570;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    BOOL v21 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v10, 0x3Eu);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = objc_msgSend(v3, "brc_wrappedError");
  (*(void (**)(uint64_t, void, void, void, void *))(v8 + 16))(v8, 0, 0, 0, v9);
}

void __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138413058;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ can't access %@: %@%@", (uint8_t *)&v8, 0x2Au);
  }
}

uint64_t __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke_297(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v7 = [*(id *)(a1 + 40) defaultClientZone];
  int v8 = [v7 activated];
  if (v5 && v8)
  {
    uint64_t v9 = *(void **)(*(void *)(a1 + 48) + 8);
    __int16 v10 = [*(id *)(a1 + 40) db];
    uint64_t v11 = [v10 serialQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke_3;
    v12[3] = &unk_1E699A660;
    id v13 = v7;
    id v14 = *(id *)(a1 + 40);
    id v15 = v5;
    id v16 = v6;
    id v17 = *(id *)(a1 + 56);
    brc_task_tracker_async_with_logs(v9, v11, v12, 0);
  }
}

void __56__BRCXPCRegularIPCsClient_updateContainerMetadataForID___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activated])
  {
    id v2 = [*(id *)(a1 + 40) containerMetadata];
    int v3 = [v2 isDocumentScopePublic];

    uint64_t v4 = [*(id *)(a1 + 40) containerMetadata];
    int v5 = [v4 updateMetadataWithExtractorProperties:*(void *)(a1 + 48) iconPaths:*(void *)(a1 + 56) bundleID:*(void *)(a1 + 64)];

    if (v5) {
      [*(id *)(a1 + 40) scheduleContainerMetadataSyncUp];
    }
    id v6 = [*(id *)(a1 + 40) containerMetadata];
    int v7 = [v6 isDocumentScopePublic];

    if (v3 != v7)
    {
      int v8 = *(void **)(a1 + 40);
      [v8 didUpdateDocumentScopePublic];
    }
  }
}

- (void)deleteAllContentsOfContainerID:(id)a3 onClient:(BOOL)a4 onServer:(BOOL)a5 wait:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  __int16 v53 = (BRCXPCRegularIPCsClient *)a3;
  id v10 = a7;
  uint64_t v11 = 2;
  if (v9) {
    uint64_t v11 = 3;
  }
  BOOL v55 = v8;
  if (v8) {
    uint64_t v11 = 4;
  }
  uint64_t v52 = v11;
  memset(v72, 0, sizeof(v72));
  __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient deleteAllContentsOfContainerID:onClient:onServer:wait:reply:]", 1753, v72);
  __int16 v12 = brc_bread_crumbs();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v76 = (BRCXPCRegularIPCsClient *)v72[0];
    __int16 v77 = 2112;
    v78 = v53;
    __int16 v79 = 2112;
    id v80 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx IPC-initiated reset for %@%@", buf, 0x20u);
  }

  memset(v71, 0, sizeof(v71));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient deleteAllContentsOfContainerID:onClient:onServer:wait:reply:]", 1757, v71);
  id v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = v71[0];
    qos_class_t v17 = qos_class_self();
    __int16 v18 = BRCPrettyPrintEnumWithContext(v17, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v76 = (BRCXPCRegularIPCsClient *)v16;
    __int16 v77 = 2112;
    v78 = self;
    __int16 v79 = 2112;
    id v80 = v18;
    __int16 v81 = 2080;
    v82 = "-[BRCXPCRegularIPCsClient deleteAllContentsOfContainerID:onClient:onServer:wait:reply:]";
    __int16 v83 = 2112;
    v84 = v14;
    _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __87__BRCXPCRegularIPCsClient_deleteAllContentsOfContainerID_onClient_onServer_wait_reply___block_invoke;
  v69[3] = &unk_1E69957B0;
  v69[4] = self;
  id v48 = v10;
  id v70 = v48;
  int v19 = _brc_ipc_check_applibrary_proxy(self, 1, v69);

  if (v19)
  {
    __int16 v20 = [(BRCXPCClient *)self session];
    id v68 = 0;
    BOOL v21 = [v20 clientZonesMatchingSearchString:v53 error:&v68];
    uint64_t v47 = (BRCXPCRegularIPCsClient *)v68;

    uint64_t v22 = objc_opt_new();
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id obj = v21;
    uint64_t v23 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v65;
      uint64_t v25 = *MEMORY[0x1E4F59418];
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v65 != v24) {
            objc_enumerationMutation(obj);
          }
          __int16 v27 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if ([v27 isCloudDocsZone]
            && ([(BRCXPCRegularIPCsClient *)v53 isEqualToString:v25] & 1) == 0)
          {
            brc_bread_crumbs();
            uint64_t v28 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
            __int16 v29 = brc_default_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v76 = v53;
              __int16 v77 = 2112;
              v78 = v28;
              _os_log_debug_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Not deleting container %@ which is moved to clouddocs%@", buf, 0x16u);
            }
          }
          else
          {
            [v22 addObject:v27];
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
      }
      while (v23);
    }

    if ([v22 count])
    {
      id v30 = dispatch_group_create();
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v49 = v22;
      uint64_t v31 = [v49 countByEnumeratingWithState:&v60 objects:v73 count:16];
      if (!v31) {
        goto LABEL_42;
      }
      uint64_t v32 = *(void *)v61;
      while (1)
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v61 != v32) {
            objc_enumerationMutation(v49);
          }
          __int16 v34 = *(BRCXPCRegularIPCsClient **)(*((void *)&v60 + 1) + 8 * j);
          if (v55 && [*(id *)(*((void *)&v60 + 1) + 8 * j) isSharedZone])
          {
            brc_bread_crumbs();
            uint64_t v35 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
            id v36 = brc_default_log();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v76 = v34;
              __int16 v77 = 2112;
              v78 = v35;
              _os_log_debug_impl(&dword_1D353B000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] We can't delete server zone for shared zone, skipping %@%@", buf, 0x16u);
            }

            goto LABEL_38;
          }
          uint64_t v37 = brc_bread_crumbs();
          __int16 v38 = brc_default_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          {
            uint64_t v43 = BRCPrettyPrintEnum();
            *(_DWORD *)buf = 136315650;
            uint64_t v76 = (BRCXPCRegularIPCsClient *)v43;
            __int16 v77 = 2112;
            v78 = v34;
            __int16 v79 = 2112;
            id v80 = v37;
            _os_log_fault_impl(&dword_1D353B000, v38, OS_LOG_TYPE_FAULT, "[CRIT] %s reset for %@%@", buf, 0x20u);
          }

          __int16 v39 = +[BRCEventsAnalytics sharedAnalytics];
          __int16 v40 = NSString;
          __int16 v41 = [(BRCXPCClient *)self bundleID];
          int v42 = [v40 stringWithFormat:@"ipc-%@", v41];
          [v39 registerAndSendNewContainerResetWithOutcome:v42];

          if (a6)
          {
            dispatch_group_enter(v30);
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __87__BRCXPCRegularIPCsClient_deleteAllContentsOfContainerID_onClient_onServer_wait_reply___block_invoke_304;
            v58[3] = &unk_1E6993698;
            uint64_t v59 = v30;
            [(BRCXPCRegularIPCsClient *)v34 scheduleReset:v52 completionHandler:v58];
            uint64_t v35 = (BRCXPCRegularIPCsClient *)v59;
LABEL_38:

            continue;
          }
          [(BRCXPCRegularIPCsClient *)v34 scheduleReset:v52];
        }
        uint64_t v31 = [v49 countByEnumeratingWithState:&v60 objects:v73 count:16];
        if (!v31)
        {
LABEL_42:

          queue = self->super._queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __87__BRCXPCRegularIPCsClient_deleteAllContentsOfContainerID_onClient_onServer_wait_reply___block_invoke_2;
          block[3] = &unk_1E6994600;
          void block[4] = self;
          id v57 = v48;
          dispatch_group_notify(v30, queue, block);

          goto LABEL_46;
        }
      }
    }
    uint64_t v45 = brc_bread_crumbs();
    char v46 = brc_default_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v76 = self;
      __int16 v77 = 2112;
      v78 = v47;
      __int16 v79 = 2112;
      id v80 = v45;
      _os_log_impl(&dword_1D353B000, v46, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *))v48 + 2))(v48, v47);
LABEL_46:
  }
  __brc_leave_section(v71);
  __brc_leave_section(v72);
}

void __87__BRCXPCRegularIPCsClient_deleteAllContentsOfContainerID_onClient_onServer_wait_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __87__BRCXPCRegularIPCsClient_deleteAllContentsOfContainerID_onClient_onServer_wait_reply___block_invoke_304(uint64_t a1)
{
}

uint64_t __87__BRCXPCRegularIPCsClient_deleteAllContentsOfContainerID_onClient_onServer_wait_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    __int16 v11 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)registerInitialSyncBarrierForID:(id)a3 reply:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient registerInitialSyncBarrierForID:reply:]", 1806, v25);
  __int16 v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v25[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v27 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v28 = 2112;
    __int16 v29 = self;
    __int16 v30 = 2112;
    uint64_t v31 = v12;
    __int16 v32 = 2080;
    __int16 v33 = "-[BRCXPCRegularIPCsClient registerInitialSyncBarrierForID:reply:]";
    __int16 v34 = 2112;
    uint64_t v35 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65__BRCXPCRegularIPCsClient_registerInitialSyncBarrierForID_reply___block_invoke;
  v23[3] = &unk_1E69957B0;
  void v23[4] = self;
  id v13 = v7;
  id v24 = v13;
  int v14 = _brc_ipc_check_applibraries_access(self, 1, v23);

  if (v14)
  {
    id v22 = 0;
    if (v6)
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v6];
    }
    else
    {
      uint64_t v15 = [(BRCXPCClient *)self defaultMangledID];
    }
    uint64_t v16 = (void *)v15;
    qos_class_t v17 = [(BRCXPCClient *)self _setupAppLibrary:v15 error:&v22];
    if (v17)
    {
      [(BRCXPCClient *)self addAppLibrary:v17];
      __int16 v18 = [(BRCXPCClient *)self description];
      [v17 notifyClient:v18 whenFaultingIsDone:v13];
    }
    else
    {
      int v19 = brc_bread_crumbs();
      __int16 v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v22, "brc_wrappedError");
        BOOL v21 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        __int16 v27 = self;
        __int16 v28 = 2112;
        __int16 v29 = v21;
        __int16 v30 = 2112;
        uint64_t v31 = v19;
        _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      __int16 v18 = objc_msgSend(v22, "brc_wrappedError");
      (*((void (**)(id, void *))v13 + 2))(v13, v18);
    }
  }
  __brc_leave_section(v25);
}

void __65__BRCXPCRegularIPCsClient_registerInitialSyncBarrierForID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_removeSandboxedAttributes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (![(BRCXPCClient *)self isSandboxed])
  {
    int v5 = v4;
    if (![(BRCXPCClient *)self hasPrivateSharingInterfaceEntitlement])
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
      int v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F1C7C8], *MEMORY[0x1E4F1C7C0], *MEMORY[0x1E4F1C7B8], 0);
      int v5 = v4;
      if ([v6 intersectsSet:v7])
      {
        [v6 minusSet:v7];
        uint64_t v8 = brc_bread_crumbs();
        __int16 v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v12 = v4;
          __int16 v13 = 2112;
          int v14 = v6;
          __int16 v15 = 2112;
          uint64_t v16 = v8;
          _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Stripping attributes request from %@ to %@%@", buf, 0x20u);
        }

        int v5 = [v6 allObjects];
      }
    }
  }

  return v5;
}

- (void)getItemUpdateSenderWithReceiver:(id)a3 reply:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v6 = a4;
  memset(v50, 0, sizeof(v50));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getItemUpdateSenderWithReceiver:reply:]", 1857, v50);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v50[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v53 = v9;
    __int16 v54 = 2112;
    BOOL v55 = self;
    __int16 v56 = 2112;
    uint64_t v57 = (uint64_t)v11;
    __int16 v58 = 2080;
    uint64_t v59 = "-[BRCXPCRegularIPCsClient getItemUpdateSenderWithReceiver:reply:]";
    __int16 v60 = 2112;
    long long v61 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __65__BRCXPCRegularIPCsClient_getItemUpdateSenderWithReceiver_reply___block_invoke;
  v48[3] = &unk_1E69957B0;
  v48[4] = self;
  id v33 = v6;
  id v49 = v33;
  int v12 = _brc_ipc_check_applibraries_access(self, 1, v48);

  if (v12)
  {
    __int16 v13 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient getItemUpdateSenderWithReceiver:reply:]();
    }

    __int16 v15 = [(BRCXPCClient *)self session];
    __int16 v32 = [v15 notificationManager];

    uint64_t v47 = 0;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v16 = [(BRCXPCClient *)self entitledAppLibraryIDs];
    uint64_t v17 = 0;
    uint64_t v18 = [v16 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v18)
    {
      id v38 = 0;
      uint64_t v39 = *(void *)v44;
      uint64_t v36 = *MEMORY[0x1E4F59678];
      uint64_t v35 = *MEMORY[0x1E4F59670];
      id obj = v16;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v44 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          BOOL v21 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v20];
          id v22 = [(BRCXPCClient *)self _setupAppLibrary:v21 error:&v47];
          if (v22)
          {
            [(BRCXPCClient *)self addAppLibrary:v22];
            uint64_t v23 = [v22 url];

            if ([(BRCXPCClient *)self canAccessPhysicalURL:v23])
            {
              uint64_t v24 = 0;
            }
            else
            {
              uint64_t v24 = [(BRCXPCClient *)self issueContainerExtensionForURL:v23 error:0];
            }
            uint64_t v26 = [v22 containerMetadata];
            __int16 v27 = [(BRCXPCClient *)self bundleID];
            uint64_t v25 = [v26 versionNumberForBundleIdentifier:v27];

            if (v24 | v25)
            {
              __int16 v28 = [MEMORY[0x1E4F1CA60] dictionary];
              __int16 v29 = v28;
              if (v24) {
                [v28 setObject:v24 forKeyedSubscript:v36];
              }
              if (v25) {
                [v29 setObject:v25 forKeyedSubscript:v35];
              }
              if (!v38) {
                id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              }
              __int16 v30 = [v22 appLibraryID];
              [v38 setObject:v29 forKeyedSubscript:v30];
            }
            uint64_t v17 = (void *)v23;
          }
          else
          {
            uint64_t v24 = brc_bread_crumbs();
            uint64_t v25 = brc_default_log();
            if (os_log_type_enabled((os_log_t)v25, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v53 = v20;
              __int16 v54 = 2112;
              BOOL v55 = v47;
              __int16 v56 = 2112;
              uint64_t v57 = v24;
              _os_log_error_impl(&dword_1D353B000, (os_log_t)v25, (os_log_type_t)0x90u, "[ERROR] can't setup container %@: %@%@", buf, 0x20u);
            }
          }
        }
        uint64_t v16 = obj;
        uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v18);
    }
    else
    {
      id v38 = 0;
    }

    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __65__BRCXPCRegularIPCsClient_getItemUpdateSenderWithReceiver_reply___block_invoke_307;
    v40[3] = &unk_1E699A6B0;
    v40[4] = self;
    id v31 = v38;
    id v41 = v31;
    id v42 = v33;
    [v32 getPipeWithXPCReceiver:v34 client:self reply:v40];
  }
  __brc_leave_section(v50);
}

void __65__BRCXPCRegularIPCsClient_getItemUpdateSenderWithReceiver_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__BRCXPCRegularIPCsClient_getItemUpdateSenderWithReceiver_reply___block_invoke_307(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138413314;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v8, 0x34u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)queryPathsForPersona:(id)a3 reply:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v23, 0, sizeof(v23));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient queryPathsForPersona:reply:]", 1913, v23);
  int v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v23[0];
    qos_class_t v11 = qos_class_self();
    __int16 v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v25 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v26 = 2112;
    __int16 v27 = self;
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2080;
    id v31 = "-[BRCXPCRegularIPCsClient queryPathsForPersona:reply:]";
    __int16 v32 = 2112;
    id v33 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __54__BRCXPCRegularIPCsClient_queryPathsForPersona_reply___block_invoke;
  uint64_t v21[3] = &unk_1E69957B0;
  v21[4] = self;
  id v13 = v7;
  id v22 = v13;
  int v14 = _brc_ipc_check_logged_status(self, 0, v21);

  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F594A0] cloudDocsHelper];
    id v20 = 0;
    __int16 v16 = [v15 queryPathsForPersona:v6 withError:&v20];
    id v17 = v20;
    brc_bread_crumbs();
    uint64_t v18 = (char *)objc_claimAutoreleasedReturnValue();
    int v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      __int16 v27 = v16;
      __int16 v28 = 2112;
      id v29 = v17;
      __int16 v30 = 2112;
      id v31 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, id))v13 + 2))(v13, v16, v17);
  }
  __brc_leave_section(v23);
}

void __54__BRCXPCRegularIPCsClient_queryPathsForPersona_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)queryEligibleAccountDescriptorsWithReply:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a3;
  int v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [MEMORY[0x1E4F59490] allEligibleAccountDescriptors];
    int v9 = 138413058;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    __int16 v16 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v8 = [MEMORY[0x1E4F59490] allEligibleAccountDescriptors];
  v4[2](v4, v8, 0);
}

- (void)getTotalApplicationDocumentUsageWithReply:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getTotalApplicationDocumentUsageWithReply:]", 1932, v24);
  int v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v24[0];
    qos_class_t v8 = qos_class_self();
    int v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v26 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v27 = 2112;
    __int16 v28 = self;
    __int16 v29 = 2112;
    __int16 v30 = v9;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCXPCRegularIPCsClient getTotalApplicationDocumentUsageWithReply:]";
    __int16 v33 = 2112;
    uint64_t v34 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v10 = (void *)*MEMORY[0x1E4F59298];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__BRCXPCRegularIPCsClient_getTotalApplicationDocumentUsageWithReply___block_invoke;
  uint64_t v22[3] = &unk_1E69957B0;
  uint8_t v22[4] = self;
  id v11 = v4;
  id v23 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v22);

  if (v10)
  {
    id v12 = objc_opt_new();
    __int16 v13 = [(BRCXPCClient *)self session];
    uint64_t v14 = [v13 readOnlyWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__BRCXPCRegularIPCsClient_getTotalApplicationDocumentUsageWithReply___block_invoke_311;
    block[3] = &unk_1E6993628;
    id v15 = v13;
    id v20 = v15;
    __int16 v16 = v12;
    BOOL v21 = v16;
    dispatch_async_and_wait(v14, block);

    brc_bread_crumbs();
    uint64_t v17 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v26 = self;
      __int16 v27 = 2112;
      __int16 v28 = v16;
      __int16 v29 = 2112;
      __int16 v30 = 0;
      __int16 v31 = 2112;
      __int16 v32 = v17;
      _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v11 + 2))(v11, v16, 0);
  }
  __brc_leave_section(v24);
}

void __69__BRCXPCRegularIPCsClient_getTotalApplicationDocumentUsageWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69__BRCXPCRegularIPCsClient_getTotalApplicationDocumentUsageWithReply___block_invoke_311(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [*(id *)(a1 + 32) appLibraries];
  uint64_t v26 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v4 = [v3 containerMetadata];
        v40[0] = @"Total Size";
        int v5 = NSNumber;
        uint64_t v34 = [*(id *)(v1 + 32) expensiveReadOnlyDB];
        __int16 v33 = objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v3, "documentSizeUsageWithDB:"));
        v41[0] = v33;
        v40[1] = @"Document Count";
        uint64_t v6 = NSNumber;
        __int16 v32 = [*(id *)(v1 + 32) expensiveReadOnlyDB];
        __int16 v31 = objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v3, "documentCountWithDB:"));
        v41[1] = v31;
        v40[2] = @"Applications";
        __int16 v30 = [v4 bundleIdentifiers];
        __int16 v29 = [v30 allObjects];
        uint64_t v7 = [v29 componentsJoinedByString:@", "];
        __int16 v28 = (void *)v7;
        if (!v7)
        {
          uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
          uint64_t v7 = (uint64_t)v24;
        }
        v41[2] = v7;
        v40[3] = @"Localized Name";
        uint64_t v8 = [v4 localizedName];
        __int16 v9 = v8;
        if (!v8)
        {
          id v23 = [MEMORY[0x1E4F1CA98] null];
          __int16 v9 = v23;
        }
        uint64_t v41[3] = v9;
        v40[4] = @"Documents URL";
        __int16 v27 = [v4 documentsURL];
        uint64_t v10 = [v27 path];
        __int16 v11 = v10;
        if (!v10)
        {
          id v22 = [MEMORY[0x1E4F1CA98] null];
          __int16 v11 = v22;
        }
        void v41[4] = v11;
        void v40[5] = @"Icons";
        uint64_t v35 = v4;
        id v12 = [v4 iconURLs];
        __int16 v13 = [v12 allKeys];
        uint64_t v14 = [v13 componentsJoinedByString:@", "];
        uint64_t v15 = v14;
        if (!v14)
        {
          BOOL v21 = [MEMORY[0x1E4F1CA98] null];
          uint64_t v15 = v21;
        }
        v41[5] = v15;
        __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:6];
        uint64_t v17 = v1;
        uint64_t v18 = *(void **)(v1 + 40);
        int v19 = [v3 appLibraryID];
        [v18 setObject:v16 forKeyedSubscript:v19];

        if (!v14) {
        if (!v10)
        }

        uint64_t v1 = v17;
        if (!v8) {

        }
        if (!v28) {
      }
        }
      uint64_t v26 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v26);
  }
}

- (void)getApplicationDocumentUsageInfoForBundleID:(id)a3 withReply:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (BRCXPCRegularIPCsClient *)a3;
  id v7 = a4;
  memset(v47, 0, sizeof(v47));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getApplicationDocumentUsageInfoForBundleID:withReply:]", 1983, v47);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v47[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v51 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v52 = 2112;
    uint64_t v53 = self;
    __int16 v54 = 2112;
    BOOL v55 = v12;
    __int16 v56 = 2080;
    uint64_t v57 = "-[BRCXPCRegularIPCsClient getApplicationDocumentUsageInfoForBundleID:withReply:]";
    __int16 v58 = 2112;
    uint64_t v59 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v13 = (void *)*MEMORY[0x1E4F59298];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __80__BRCXPCRegularIPCsClient_getApplicationDocumentUsageInfoForBundleID_withReply___block_invoke;
  uint64_t v45[3] = &unk_1E69957B0;
  v45[4] = self;
  id v14 = v7;
  id v46 = v14;
  LODWORD(v13) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v13, v45);

  if (v13)
  {
    memset(v44, 0, sizeof(v44));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient getApplicationDocumentUsageInfoForBundleID:withReply:]", 1985, v44);
    uint64_t v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v51 = (BRCXPCRegularIPCsClient *)v44[0];
      __int16 v52 = 2112;
      uint64_t v53 = v6;
      __int16 v54 = 2112;
      BOOL v55 = v15;
      _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx getting usage for %@%@", buf, 0x20u);
    }

    uint64_t v17 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v6 placeholder:0];
    if (v17)
    {
      uint64_t v18 = BREntitledContainerIdentifiersForProxy();
    }
    else
    {
      brc_bread_crumbs();
      int v19 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      id v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v51 = v6;
        __int16 v52 = 2112;
        uint64_t v53 = v19;
        _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] unable to find bundleID %@%@", buf, 0x16u);
      }

      uint64_t v18 = 0;
    }
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    uint64_t v36 = 0;
    long long v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    BOOL v21 = [(BRCXPCClient *)self session];
    if ([v18 count])
    {
      id v22 = [v21 clientTruthWorkloop];
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      __int16 v30 = __80__BRCXPCRegularIPCsClient_getApplicationDocumentUsageInfoForBundleID_withReply___block_invoke_335;
      __int16 v31 = &unk_1E699A6D8;
      id v32 = v18;
      id v33 = v21;
      uint64_t v34 = &v40;
      uint64_t v35 = &v36;
      dispatch_async_and_wait(v22, &v28);
    }
    v48[0] = *MEMORY[0x1E4F59260];
    id v23 = objc_msgSend(NSNumber, "numberWithBool:", *((unsigned __int8 *)v37 + 24), v28, v29, v30, v31);
    v48[1] = *MEMORY[0x1E4F59258];
    v49[0] = v23;
    uint64_t v24 = [NSNumber numberWithBool:*((unsigned __int8 *)v41 + 24)];
    v49[1] = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];

    brc_bread_crumbs();
    uint64_t v26 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v51 = self;
      __int16 v52 = 2112;
      uint64_t v53 = v25;
      __int16 v54 = 2112;
      BOOL v55 = 0;
      __int16 v56 = 2112;
      uint64_t v57 = v26;
      _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v14 + 2))(v14, v25, 0);
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);

    __brc_leave_section(v44);
  }
  __brc_leave_section(v47);
}

void __80__BRCXPCRegularIPCsClient_getApplicationDocumentUsageInfoForBundleID_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__BRCXPCRegularIPCsClient_getApplicationDocumentUsageInfoForBundleID_withReply___block_invoke_335(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = objc_msgSend(*(id *)(a1 + 40), "appLibraryByID:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        if (*(unsigned char *)(v9 + 24))
        {
          char v10 = 1;
        }
        else
        {
          char v10 = [v7 hasLocalChanges];
          uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        }
        *(unsigned char *)(v9 + 24) = v10;
        uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
        if (*(unsigned char *)(v11 + 24))
        {
          char v12 = 1;
        }
        else
        {
          char v12 = [v8 hasUbiquitousDocuments];
          uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
        }
        *(unsigned char *)(v11 + 24) = v12;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
          && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {

          goto LABEL_18;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

- (void)hasOptimizeStorageWithReply:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient hasOptimizeStorageWithReply:]", 2026, v18);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    uint64_t v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    *(void *)id v22 = self;
    *(_WORD *)&v22[8] = 2112;
    *(void *)&v22[10] = v9;
    *(_WORD *)&v22[18] = 2080;
    *(void *)&v22[20] = "-[BRCXPCRegularIPCsClient hasOptimizeStorageWithReply:]";
    __int16 v23 = 2112;
    uint64_t v24 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  char v10 = (void *)*MEMORY[0x1E4F59358];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__BRCXPCRegularIPCsClient_hasOptimizeStorageWithReply___block_invoke;
  v16[3] = &unk_1E69957B0;
  void v16[4] = self;
  id v11 = v4;
  id v17 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v16);

  if (v10)
  {
    char v12 = [(BRCXPCClient *)self session];
    uint64_t v13 = [v12 hasOptimizeStorageEnabled];

    long long v14 = brc_bread_crumbs();
    long long v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v20 = self;
      __int16 v21 = 1024;
      *(_DWORD *)id v22 = v13;
      *(_WORD *)&uint8_t v22[4] = 2112;
      *(void *)&v22[6] = 0;
      *(_WORD *)&v22[14] = 2112;
      *(void *)&v22[16] = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }

    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, v13, 0);
  }
  __brc_leave_section(v18);
}

void __55__BRCXPCRegularIPCsClient_hasOptimizeStorageWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    long long v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setStorageOpimizationEnabled:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  memset(v19, 0, sizeof(v19));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient setStorageOpimizationEnabled:reply:]", 2036, v19);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v19[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v21 = (BRCXPCRegularIPCsClient *)v9;
    __int16 v22 = 2112;
    __int16 v23 = self;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    __int16 v26 = 2080;
    __int16 v27 = "-[BRCXPCRegularIPCsClient setStorageOpimizationEnabled:reply:]";
    __int16 v28 = 2112;
    uint64_t v29 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v12 = (void *)*MEMORY[0x1E4F59358];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__BRCXPCRegularIPCsClient_setStorageOpimizationEnabled_reply___block_invoke;
  uint64_t v17[3] = &unk_1E69957B0;
  v17[4] = self;
  id v13 = v6;
  id v18 = v13;
  LODWORD(v12) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v12, v17);

  if (v12)
  {
    long long v14 = [(BRCXPCClient *)self session];
    [v14 setOptimizeStorageEnabled:v4 synchronous:0];

    uint64_t v15 = brc_bread_crumbs();
    long long v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v21 = self;
      __int16 v22 = 2112;
      __int16 v23 = 0;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
  __brc_leave_section(v19);
}

void __62__BRCXPCRegularIPCsClient_setStorageOpimizationEnabled_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)evictOldDocumentsWithReply:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient evictOldDocumentsWithReply:]", 2046, v25);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v25[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v27 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v28 = 2112;
    uint64_t v29 = self;
    __int16 v30 = 2112;
    __int16 v31 = v9;
    __int16 v32 = 2080;
    id v33 = "-[BRCXPCRegularIPCsClient evictOldDocumentsWithReply:]";
    __int16 v34 = 2112;
    uint64_t v35 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v10 = (void *)*MEMORY[0x1E4F59358];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __54__BRCXPCRegularIPCsClient_evictOldDocumentsWithReply___block_invoke;
  uint64_t v23[3] = &unk_1E69957B0;
  void v23[4] = self;
  id v11 = v4;
  id v24 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v23);

  if (v10)
  {
    id v12 = +[BRCUserDefaults defaultsForMangledID:0];
    [v12 defaultTimeDeltaForEviction];
    double v14 = v13;
    [v12 defaultOnDiskAccessTimeDefaultForEviction];
    double v16 = v15;
    id v17 = [(BRCXPCClient *)self session];
    id v18 = [v17 diskReclaimer];
    id v22 = 0;
    [v18 performOptimizeStorageWithTimeDelta:&v22 onDiskAccessTimeDelta:v14 error:v16];
    int v19 = (BRCXPCRegularIPCsClient *)v22;

    id v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v27 = self;
      __int16 v28 = 2112;
      uint64_t v29 = v19;
      __int16 v30 = 2112;
      __int16 v31 = v20;
      _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *))v11 + 2))(v11, v19);
  }
  __brc_leave_section(v25);
}

void __54__BRCXPCRegularIPCsClient_evictOldDocumentsWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)iCloudDesktopSettingsChangedWithAttributes:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void *))a4;
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  uint64_t v9 = *MEMORY[0x1E4F281F8];
  if (v8)
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
    int v12 = 138412802;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    double v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v12, 0x20u);
  }
  __int16 v11 = [MEMORY[0x1E4F28C58] errorWithDomain:v9 code:3328 userInfo:0];
  v5[2](v5, v11);
}

uint64_t __45__BRCXPCRegularIPCsClient_getContainersByID___block_invoke_338(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 containerMetadata];
  if (v4)
  {
    objc_msgSend(v4, "setIsCloudSyncTCCDisabled:", objc_msgSend(*(id *)(a1 + 32), "cloudSyncTCCDisabledForContainerMeta:", v4));
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v3 appLibraryID];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
  else
  {
    int v7 = brc_bread_crumbs();
    BOOL v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __45__BRCXPCRegularIPCsClient_getContainersByID___block_invoke_338_cold_1();
    }
  }
  return 1;
}

- (void)getContainerForMangledID:(id)a3 personaID:(id)a4 reply:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainerForMangledID:personaID:reply:]", 2118, v22);
  __int16 v11 = brc_bread_crumbs();
  int v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v22[0];
    qos_class_t v14 = qos_class_self();
    double v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = v13;
    __int16 v25 = 2112;
    __int16 v26 = self;
    __int16 v27 = 2112;
    __int16 v28 = v15;
    __int16 v29 = 2080;
    __int16 v30 = "-[BRCXPCRegularIPCsClient getContainerForMangledID:personaID:reply:]";
    __int16 v31 = 2112;
    __int16 v32 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__BRCXPCRegularIPCsClient_getContainerForMangledID_personaID_reply___block_invoke;
  uint64_t v20[3] = &unk_1E69957B0;
  void v20[4] = self;
  id v16 = v10;
  id v21 = v16;
  int v17 = _brc_ipc_check_logged_status(self, 0, v20);

  if (v17)
  {
    id v19 = v16;
    id v18 = v8;
    BRPerformWithPersonaAndError();
  }
  __brc_leave_section(v22);
}

void __68__BRCXPCRegularIPCsClient_getContainerForMangledID_personaID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__BRCXPCRegularIPCsClient_getContainerForMangledID_personaID_reply___block_invoke_340(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = a1[4];
      int v21 = 138413058;
      uint64_t v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = 0;
      __int16 v25 = 2112;
      id v26 = v3;
      __int16 v27 = 2112;
      __int16 v28 = v4;
      _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v21, 0x2Au);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    int v7 = +[BRCAccountsManager sharedManager];
    uint64_t v8 = [v7 accountHandlerForCurrentPersona];

    __int16 v9 = [v8 session];
    uint64_t v10 = v9;
    if (v9)
    {
      __int16 v11 = [v9 appLibraryByMangledID:a1[5]];
      id v12 = [v11 containerMetadataFilledWithTCCInfo];
      __int16 v13 = brc_bread_crumbs();
      qos_class_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = a1[4];
        int v21 = 138413058;
        uint64_t v22 = v15;
        __int16 v23 = 2112;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        id v26 = 0;
        __int16 v27 = 2112;
        __int16 v28 = v13;
        _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v21, 0x2Au);
      }

      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      id v16 = brc_bread_crumbs();
      int v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = a1[4];
        id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
        int v21 = 138413058;
        uint64_t v22 = v18;
        __int16 v23 = 2112;
        uint64_t v24 = 0;
        __int16 v25 = 2112;
        id v26 = v19;
        __int16 v27 = 2112;
        __int16 v28 = v16;
        _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v21, 0x2Au);
      }
      uint64_t v20 = a1[6];
      __int16 v11 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v11);
    }
  }
}

- (void)didReceiveHandoffRequestForBundleID:(id)a3 reply:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v31, 0, sizeof(v31));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient didReceiveHandoffRequestForBundleID:reply:]", 2151, v31);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v31[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v34 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v35 = 2112;
    uint64_t v36 = self;
    __int16 v37 = 2112;
    uint64_t v38 = v12;
    __int16 v39 = 2080;
    uint64_t v40 = "-[BRCXPCRegularIPCsClient didReceiveHandoffRequestForBundleID:reply:]";
    __int16 v41 = 2112;
    uint64_t v42 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__BRCXPCRegularIPCsClient_didReceiveHandoffRequestForBundleID_reply___block_invoke;
  uint64_t v29[3] = &unk_1E69957B0;
  v29[4] = self;
  id v13 = v7;
  id v30 = v13;
  int v14 = _brc_ipc_check_applibrary_proxy(self, 1, v29);

  if (v14)
  {
    uint64_t v15 = +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor];
    id v16 = [v15 containerIDsForApplicationIdentifier:v6];

    int v17 = [(BRCXPCClient *)self session];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v26;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = objc_msgSend(v17, "appLibraryByID:", *(void *)(*((void *)&v25 + 1) + 8 * v21), (void)v25);
          [v22 didReceiveHandoffRequest];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v32 count:16];
      }
      while (v19);
    }

    __int16 v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v34 = self;
      __int16 v35 = 2112;
      uint64_t v36 = 0;
      __int16 v37 = 2112;
      uint64_t v38 = v23;
      _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
  __brc_leave_section(v31);
}

void __69__BRCXPCRegularIPCsClient_didReceiveHandoffRequestForBundleID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_loggedInUserPropertyValuesForKeys:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v6 = [MEMORY[0x1E4F179C8] defaultStore];
  int v7 = objc_msgSend(v6, "br_accountForCurrentPersona");
  if (v7)
  {
    uint64_t v24 = a4;
    long long v25 = v6;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v26 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      uint64_t v12 = *MEMORY[0x1E4F59370];
      uint64_t v28 = *MEMORY[0x1E4F59380];
      uint64_t v27 = *MEMORY[0x1E4F59378];
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          int v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v14 isEqualToString:v12])
            {
              uint64_t v15 = objc_msgSend(v7, "br_firstName");
            }
            else if ([v14 isEqualToString:v28])
            {
              uint64_t v15 = objc_msgSend(v7, "br_lastName");
            }
            else
            {
              if (![v14 isEqualToString:v27])
              {
                if (v24)
                {
                  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorUnknownKey:", v14);
                  id *v24 = (id)objc_claimAutoreleasedReturnValue();
                }

                id v18 = 0;
                goto LABEL_31;
              }
              uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "br_isManagedAppleID"));
            }
            id v16 = (char *)v15;
            if (v15) {
              [v29 setObject:v15 forKeyedSubscript:v14];
            }
          }
          else
          {
            brc_bread_crumbs();
            id v16 = (char *)objc_claimAutoreleasedReturnValue();
            int v17 = brc_default_log();
            if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v36 = (const char *)v14;
              __int16 v37 = 2112;
              uint64_t v38 = v16;
              _os_log_error_impl(&dword_1D353B000, v17, (os_log_type_t)0x90u, "[ERROR] key: %@ is not of class NSString%@", buf, 0x16u);
            }
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v18 = v29;
LABEL_31:
    uint64_t v6 = v25;
    id v5 = v26;
  }
  else
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", @"account");
    if (v19)
    {
      uint64_t v20 = brc_bread_crumbs();
      uint64_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        __int16 v23 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v36 = "-[BRCXPCRegularIPCsClient _loggedInUserPropertyValuesForKeys:error:]";
        __int16 v37 = 2080;
        if (!a4) {
          __int16 v23 = "(ignored by caller)";
        }
        uint64_t v38 = v23;
        __int16 v39 = 2112;
        uint64_t v40 = v19;
        __int16 v41 = 2112;
        uint64_t v42 = v20;
        _os_log_error_impl(&dword_1D353B000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v19;
    }

    id v18 = 0;
  }

  return v18;
}

- (void)getLoggedInUserPropertyValuesForKeys:(id)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getLoggedInUserPropertyValuesForKeys:reply:]", 2204, v24);
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v24[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v26 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v27 = 2112;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2080;
    long long v32 = "-[BRCXPCRegularIPCsClient getLoggedInUserPropertyValuesForKeys:reply:]";
    __int16 v33 = 2112;
    __int16 v34 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v14 = [v13 isSharingPrivateInterfaceEntitled];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__BRCXPCRegularIPCsClient_getLoggedInUserPropertyValuesForKeys_reply___block_invoke;
  uint64_t v22[3] = &unk_1E69957B0;
  uint8_t v22[4] = self;
  id v15 = v7;
  id v23 = v15;
  char v16 = _brc_ipc_check_client_privilege(self, 1, v14, (uint64_t)"isSharingPrivateInterfaceEntitled", v22);

  if (v16)
  {
    id v21 = 0;
    int v17 = [(BRCXPCRegularIPCsClient *)self _loggedInUserPropertyValuesForKeys:v6 error:&v21];
    id v18 = v21;
    brc_bread_crumbs();
    uint64_t v19 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v26 = self;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      id v30 = v18;
      __int16 v31 = 2112;
      long long v32 = v19;
      _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, id))v15 + 2))(v15, v17, v18);
  }
  __brc_leave_section(v24);
}

void __70__BRCXPCRegularIPCsClient_getLoggedInUserPropertyValuesForKeys_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setupInstanceWithDict:(id)a3 reply:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient setupInstanceWithDict:reply:]", 2218, v17);
  __int16 v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v17[0];
    qos_class_t v12 = qos_class_self();
    __int16 v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    id v21 = self;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2080;
    long long v25 = "-[BRCXPCRegularIPCsClient setupInstanceWithDict:reply:]";
    __int16 v26 = 2112;
    __int16 v27 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__BRCXPCRegularIPCsClient_setupInstanceWithDict_reply___block_invoke;
  v15[3] = &unk_1E69957B0;
  v15[4] = self;
  id v14 = v8;
  id v16 = v14;
  _brc_ipc_spi(self, -1, (uint64_t)a2, v15);

  __brc_leave_section(v17);
}

void __55__BRCXPCRegularIPCsClient_setupInstanceWithDict_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetBudgets:(id)a3 reply:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient resetBudgets:reply:]", 2226, v26);
  __int16 v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v26[0];
    qos_class_t v12 = qos_class_self();
    __int16 v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v28 = v11;
    __int16 v29 = 2112;
    id v30 = self;
    __int16 v31 = 2112;
    long long v32 = v13;
    __int16 v33 = 2080;
    __int16 v34 = "-[BRCXPCRegularIPCsClient resetBudgets:reply:]";
    __int16 v35 = 2112;
    uint64_t v36 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __46__BRCXPCRegularIPCsClient_resetBudgets_reply___block_invoke;
  uint64_t v24[3] = &unk_1E69957B0;
  void v24[4] = self;
  id v14 = v8;
  id v25 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v24);

  if (v15)
  {
    id v16 = [(BRCXPCClient *)self session];
    int v17 = [v16 clientDB];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __46__BRCXPCRegularIPCsClient_resetBudgets_reply___block_invoke_347;
    uint64_t v19[3] = &unk_1E699A700;
    id v18 = v16;
    id v20 = v18;
    id v21 = v7;
    __int16 v22 = self;
    id v23 = v14;
    [v17 performWithFlags:5 action:v19];
  }
  __brc_leave_section(v26);
}

void __46__BRCXPCRegularIPCsClient_resetBudgets_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    qos_class_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __46__BRCXPCRegularIPCsClient_resetBudgets_reply___block_invoke_347(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [a2 forceBatchStart];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__BRCXPCRegularIPCsClient_resetBudgets_reply___block_invoke_2;
  v13[3] = &unk_1E6998A18;
  id v3 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  [v3 enumerateServerZones:v13];
  id v4 = *(void **)(a1 + 40);
  if (!v4 || [v4 containsObject:@"global"])
  {
    id v5 = [*(id *)(a1 + 32) containerScheduler];
    uint64_t v6 = [v5 syncUpBudget];
    [v6 clear];

    [*(id *)(a1 + 32) resetThrottles];
  }
  int v7 = [*(id *)(a1 + 32) containerScheduler];
  uint64_t v8 = [v7 syncScheduler];
  [v8 signal];

  __int16 v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = 0;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  return 1;
}

uint64_t __46__BRCXPCRegularIPCsClient_resetBudgets_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = *(void **)(a1 + 32);
  if (!v5
    || ([v3 zoneName],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 containsObject:v6],
        v6,
        v7))
  {
    uint64_t v8 = [v4 clientZone];
    [v8 resetSyncBudgetAndThrottle];
  }
  return 1;
}

- (void)performSelfCheck:(id)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  memset(v28, 0, sizeof(v28));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient performSelfCheck:reply:]", 2253, v28);
  __int16 v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v28[0];
    qos_class_t v12 = qos_class_self();
    uint64_t v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v30 = (BRCXPCRegularIPCsClient *)v11;
    __int16 v31 = 2112;
    *(void *)long long v32 = self;
    *(_WORD *)&v32[8] = 2112;
    *(void *)&v32[10] = v13;
    *(_WORD *)&v32[18] = 2080;
    *(void *)&v32[20] = "-[BRCXPCRegularIPCsClient performSelfCheck:reply:]";
    __int16 v33 = 2112;
    __int16 v34 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __50__BRCXPCRegularIPCsClient_performSelfCheck_reply___block_invoke;
  uint64_t v26[3] = &unk_1E69957B0;
  v26[4] = self;
  id v14 = v8;
  id v27 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v26);

  if (v15)
  {
    int v16 = dup([v7 fileDescriptor]);
    __int16 v17 = fdopen(v16, "a");
    if (v17)
    {
      uint64_t v18 = +[BRCDaemon daemon];
      uint64_t v19 = [v18 selfCheck:v17];

      fclose(v17);
      if (v19)
      {
        id v20 = 0;
      }
      else
      {
        id v20 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 1003, @"self check failed: broken invariant");
      }
      __int16 v24 = brc_bread_crumbs();
      id v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v30 = self;
        __int16 v31 = 1024;
        *(_DWORD *)long long v32 = v19;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = v20;
        *(_WORD *)&v32[14] = 2112;
        *(void *)&v32[16] = v24;
        _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_INFO, "[INFO] %@: reply(success=%d, %@)%@", buf, 0x26u);
      }

      (*((void (**)(id, uint64_t, void *))v14 + 2))(v14, v19, v20);
    }
    else
    {
      uint64_t v21 = brc_bread_crumbs();
      __int16 v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
        *(_DWORD *)buf = 138413058;
        id v30 = self;
        __int16 v31 = 1024;
        *(_DWORD *)long long v32 = 0;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = v23;
        *(_WORD *)&v32[14] = 2112;
        *(void *)&v32[16] = v21;
        _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(success=%d, %@)%@", buf, 0x26u);
      }
      id v20 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v20);
    }
  }
  __brc_leave_section(v28);
}

void __50__BRCXPCRegularIPCsClient_performSelfCheck_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)printStatus:(id)a3 containerID:(id)a4 reply:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  memset(v29, 0, sizeof(v29));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient printStatus:containerID:reply:]", 2271, v29);
  id v12 = brc_bread_crumbs();
  __int16 v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v29[0];
    qos_class_t v15 = qos_class_self();
    int v16 = BRCPrettyPrintEnumWithContext(v15, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v31 = v14;
    __int16 v32 = 2112;
    __int16 v33 = self;
    __int16 v34 = 2112;
    uint64_t v35 = v16;
    __int16 v36 = 2080;
    uint64_t v37 = "-[BRCXPCRegularIPCsClient printStatus:containerID:reply:]";
    __int16 v38 = 2112;
    __int16 v39 = v12;
    _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __57__BRCXPCRegularIPCsClient_printStatus_containerID_reply___block_invoke;
  uint64_t v27[3] = &unk_1E69957B0;
  void v27[4] = self;
  id v17 = v11;
  id v28 = v17;
  int v18 = _brc_ipc_spi(self, 1, (uint64_t)a2, v27);

  if (v18)
  {
    tracker = self->super._tracker;
    id v20 = dispatch_get_global_queue(0, 0);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __57__BRCXPCRegularIPCsClient_printStatus_containerID_reply___block_invoke_357;
    uint64_t v23[3] = &unk_1E6993D18;
    void v23[4] = self;
    id v24 = v9;
    id v25 = v10;
    id v26 = v17;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__BRCXPCRegularIPCsClient_printStatus_containerID_reply___block_invoke_358;
    uint64_t v21[3] = &unk_1E6994600;
    v21[4] = self;
    id v22 = v26;
    brc_task_tracker_async_with_logs(tracker, v20, v23, v21);
  }
  __brc_leave_section(v29);
}

void __57__BRCXPCRegularIPCsClient_printStatus_containerID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__BRCXPCRegularIPCsClient_printStatus_containerID_reply___block_invoke_357(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9438760]();
  id v3 = [*(id *)(a1 + 32) session];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v15 = 0;
  uint64_t v7 = [v3 dumpStatusToFileHandle:v4 zoneName:v5 tracker:v6 error:&v15];
  id v8 = v15;

  __int16 v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = objc_msgSend(v8, "brc_wrappedError");
    *(_DWORD *)buf = 138413058;
    uint64_t v17 = v11;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(success=%d, %@)%@", buf, 0x26u);
  }
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = objc_msgSend(v8, "brc_wrappedError");
  (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, v7, v14);
}

void __57__BRCXPCRegularIPCsClient_printStatus_containerID_reply___block_invoke_358(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v8, 0x26u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)dumpFPFSMigrationStatusTo:(id)a3 personaID:(id)a4 includeNonMigratedItems:(BOOL)a5 reply:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v11 = (__CFString *)a4;
  id v12 = a6;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient dumpFPFSMigrationStatusTo:personaID:includeNonMigratedItems:reply:]", 2291, v24);
  uint64_t v13 = brc_bread_crumbs();
  __int16 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v24[0];
    qos_class_t v16 = qos_class_self();
    uint64_t v17 = BRCPrettyPrintEnumWithContext(v16, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v15;
    __int16 v27 = 2112;
    id v28 = self;
    __int16 v29 = 2112;
    id v30 = v17;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCXPCRegularIPCsClient dumpFPFSMigrationStatusTo:personaID:includeNonMigratedItems:reply:]";
    __int16 v33 = 2112;
    __int16 v34 = v13;
    _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke;
  uint64_t v22[3] = &unk_1E69957B0;
  uint8_t v22[4] = self;
  id v18 = v12;
  id v23 = v18;
  int v19 = _brc_ipc_spi(self, 0, (uint64_t)a2, v22);

  if (v19)
  {
    if (!v11) {
      int v11 = @"__defaultPersonaID__";
    }
    id v21 = v18;
    id v20 = v10;
    BRPerformWithPersonaAndError();
  }
  __brc_leave_section(v24);
}

void __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    __int16 v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke_359(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      uint64_t v33 = v6;
      __int16 v34 = 1024;
      int v35 = 0;
      __int16 v36 = 2112;
      id v37 = v3;
      __int16 v38 = 2112;
      __int16 v39 = v4;
      _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v7 = +[BRCAccountsManager sharedManager];
    uint64_t v8 = [v7 accountHandlerForCurrentPersona];

    __int16 v9 = [v8 session];

    if (v9)
    {
      int v10 = *(void **)(*(void *)(a1 + 32) + 8);
      __int16 v11 = dispatch_get_global_queue(0, 0);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke_360;
      uint64_t v26[3] = &unk_1E699A728;
      id v27 = v8;
      id v12 = *(id *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 32);
      id v28 = v12;
      uint64_t v29 = v13;
      char v31 = *(unsigned char *)(a1 + 56);
      id v30 = *(id *)(a1 + 48);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke_361;
      uint64_t v24[3] = &unk_1E6994600;
      void v24[4] = *(void *)(a1 + 32);
      id v25 = *(id *)(a1 + 48);
      brc_task_tracker_async_with_logs(v10, v11, v26, v24);

      __int16 v14 = v27;
    }
    else
    {
      uint64_t v15 = brc_bread_crumbs();
      qos_class_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        id v18 = (void *)MEMORY[0x1E4F28C58];
        int v19 = [v8 loggedOutError];
        id v20 = objc_msgSend(v18, "brc_errorLoggedOutWithUnderlyingError:", v19);
        *(_DWORD *)buf = 138413058;
        uint64_t v33 = v17;
        __int16 v34 = 1024;
        int v35 = 0;
        __int16 v36 = 2112;
        id v37 = v20;
        __int16 v38 = 2112;
        __int16 v39 = v15;
        _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
      }
      uint64_t v21 = *(void *)(a1 + 48);
      __int16 v22 = (void *)MEMORY[0x1E4F28C58];
      __int16 v14 = [v8 loggedOutError];
      id v23 = objc_msgSend(v22, "brc_errorLoggedOutWithUnderlyingError:", v14);
      (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v23);
    }
  }
}

void __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke_360(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9438760]();
  id v3 = [*(id *)(a1 + 32) session];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
  id v15 = 0;
  uint64_t v7 = [v3 dumpFPFSMigrationStatusToFileHandle:v4 tracker:v5 includeNonMigratedItems:v6 error:&v15];
  id v8 = v15;

  __int16 v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_msgSend(v8, "brc_wrappedError");
    *(_DWORD *)buf = 138413058;
    uint64_t v17 = v11;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(success=%d, %@)%@", buf, 0x26u);
  }
  uint64_t v13 = *(void *)(a1 + 56);
  __int16 v14 = objc_msgSend(v8, "brc_wrappedError");
  (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, v7, v14);
}

void __93__BRCXPCRegularIPCsClient_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply___block_invoke_361(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v8, 0x26u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)dumpDatabaseTo:(id)a3 containerID:(id)a4 personaID:(id)a5 includeAllItems:(BOOL)a6 verbose:(BOOL)a7 reply:(id)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  __int16 v14 = (__CFString *)a5;
  id v15 = a8;
  memset(v31, 0, sizeof(v31));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient dumpDatabaseTo:containerID:personaID:includeAllItems:verbose:reply:]", 2329, v31);
  uint64_t v16 = brc_bread_crumbs();
  uint64_t v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = v13;
    id v19 = v12;
    uint64_t v20 = v31[0];
    qos_class_t v21 = qos_class_self();
    __int16 v22 = BRCPrettyPrintEnumWithContext(v21, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v33 = v20;
    __int16 v34 = 2112;
    int v35 = self;
    __int16 v36 = 2112;
    id v37 = v22;
    __int16 v38 = 2080;
    __int16 v39 = "-[BRCXPCRegularIPCsClient dumpDatabaseTo:containerID:personaID:includeAllItems:verbose:reply:]";
    __int16 v40 = 2112;
    __int16 v41 = v16;
    _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    id v12 = v19;
    id v13 = v18;
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke;
  uint64_t v29[3] = &unk_1E69957B0;
  v29[4] = self;
  id v23 = v15;
  id v30 = v23;
  int v24 = _brc_ipc_spi(self, 0, (uint64_t)a2, v29);

  if (v24)
  {
    if (!v14) {
      __int16 v14 = @"__defaultPersonaID__";
    }
    id v28 = v23;
    id v26 = v12;
    id v27 = v13;
    BRPerformWithPersonaAndError();
  }
  __brc_leave_section(v31);
}

void __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    __int16 v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_362(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    int v7 = +[BRCAccountsManager sharedManager];
    uint64_t v8 = [v7 accountHandlerForCurrentPersona];

    __int16 v9 = [v8 session];

    if (!v9)
    {
      id v19 = brc_bread_crumbs();
      uint64_t v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        __int16 v22 = (void *)MEMORY[0x1E4F28C58];
        id v23 = [v8 loggedOutError];
        int v24 = objc_msgSend(v22, "brc_errorLoggedOutWithUnderlyingError:", v23);
        *(_DWORD *)buf = 138413058;
        uint64_t v46 = v21;
        __int16 v47 = 1024;
        *(_DWORD *)id v48 = 0;
        *(_WORD *)&v48[4] = 2112;
        *(void *)&v48[6] = v24;
        *(_WORD *)&unsigned char v48[14] = 2112;
        *(void *)&v48[16] = v19;
        _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
      }
      uint64_t v25 = *(void *)(a1 + 56);
      id v26 = (void *)MEMORY[0x1E4F28C58];
      id v27 = [v8 loggedOutError];
      id v28 = objc_msgSend(v26, "brc_errorLoggedOutWithUnderlyingError:", v27);
      (*(void (**)(uint64_t, void, void *))(v25 + 16))(v25, 0, v28);

      goto LABEL_17;
    }
    memset(v44, 0, sizeof(v44));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient dumpDatabaseTo:containerID:personaID:includeAllItems:verbose:reply:]_block_invoke", 2348, v44);
    int v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = v44[0];
      uint64_t v13 = *(void *)(a1 + 32);
      qos_class_t v14 = qos_class_self();
      uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219010;
      uint64_t v46 = v12;
      __int16 v47 = 2112;
      *(void *)id v48 = v13;
      *(_WORD *)&v48[8] = 2112;
      *(void *)&v48[10] = v15;
      *(_WORD *)&v48[18] = 2080;
      *(void *)&v48[20] = "-[BRCXPCRegularIPCsClient dumpDatabaseTo:containerID:personaID:includeAllItems:verbose:reply:]_block_invoke";
      __int16 v49 = 2112;
      id v50 = v10;
      _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
    }
    uint64_t v16 = *(void **)(a1 + 32);
    uint64_t v17 = [v8 session];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_363;
    uint64_t v42[3] = &unk_1E69957B0;
    void v42[4] = *(void *)(a1 + 32);
    id v43 = *(id *)(a1 + 56);
    if (v16)
    {
      char v18 = _brc_ipc_check_logged_status(v16, 1, v42);

      if ((v18 & 1) == 0) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v29 = *(void **)(*(void *)(a1 + 32) + 8);
    id v30 = dispatch_get_global_queue(0, 0);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_364;
    uint64_t v35[3] = &unk_1E699A778;
    id v36 = v8;
    id v37 = *(id *)(a1 + 40);
    id v31 = *(id *)(a1 + 48);
    __int16 v41 = *(_WORD *)(a1 + 64);
    uint64_t v32 = *(void *)(a1 + 32);
    id v38 = v31;
    uint64_t v39 = v32;
    id v40 = *(id *)(a1 + 56);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_365;
    uint64_t v33[3] = &unk_1E6994600;
    void v33[4] = *(void *)(a1 + 32);
    id v34 = *(id *)(a1 + 56);
    brc_task_tracker_async_with_logs(v29, v30, v35, v33);

LABEL_16:
    __brc_leave_section(v44);
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v46 = v6;
    __int16 v47 = 1024;
    *(_DWORD *)id v48 = 0;
    *(_WORD *)&v48[4] = 2112;
    *(void *)&v48[6] = v3;
    *(_WORD *)&unsigned char v48[14] = 2112;
    *(void *)&v48[16] = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_18:
}

void __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_363(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_364(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9438760]();
  id v3 = [*(id *)(a1 + 32) session];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 73);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v17 = 0;
  uint64_t v9 = [v3 dumpDatabaseToFileHandle:v4 zoneName:v5 includeAllItems:v6 verbose:v7 tracker:v8 error:&v17];
  id v10 = v17;

  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 56);
    qos_class_t v14 = objc_msgSend(v10, "brc_wrappedError");
    *(_DWORD *)buf = 138413058;
    uint64_t v19 = v13;
    __int16 v20 = 1024;
    int v21 = v9;
    __int16 v22 = 2112;
    id v23 = v14;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(success=%d, %@)%@", buf, 0x26u);
  }
  uint64_t v15 = *(void *)(a1 + 64);
  uint64_t v16 = objc_msgSend(v10, "brc_wrappedError");
  (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, v9, v16);
}

void __94__BRCXPCRegularIPCsClient_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply___block_invoke_365(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v8, 0x26u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)backupDatabaseWithURLWrapper:(id)a3 reply:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  memset(v32, 0, sizeof(v32));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient backupDatabaseWithURLWrapper:reply:]", 2366, v32);
  uint64_t v9 = brc_bread_crumbs();
  __int16 v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v32[0];
    qos_class_t v12 = qos_class_self();
    uint64_t v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v34 = (BRCXPCRegularIPCsClient *)v11;
    __int16 v35 = 2112;
    id v36 = self;
    __int16 v37 = 2112;
    id v38 = v13;
    __int16 v39 = 2080;
    id v40 = "-[BRCXPCRegularIPCsClient backupDatabaseWithURLWrapper:reply:]";
    __int16 v41 = 2112;
    uint64_t v42 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  void v30[2] = __62__BRCXPCRegularIPCsClient_backupDatabaseWithURLWrapper_reply___block_invoke;
  uint64_t v30[3] = &unk_1E69957B0;
  void v30[4] = self;
  id v14 = v8;
  id v31 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v30);

  if (v15)
  {
    uint64_t v16 = [v7 url];
    id v17 = (void *)MEMORY[0x1E4F1CB10];
    char v18 = NSString;
    uint64_t v19 = [(BRCXPCClient *)self session];
    __int16 v20 = [v19 sessionDirPath];
    uint64_t v21 = [v18 stringWithFormat:@"%@/db", v20];
    __int16 v22 = [v17 fileURLWithPath:v21];

    id v23 = v16;
    __int16 v24 = +[BRCAccountSession sessionForBackingUpDatabasesAtURL:v22];
    id v29 = 0;
    LOBYTE(v21) = [v24 backupDatabaseToURL:v23 includeServer:1 doNotObfuscate:1 error:&v29];
    id v25 = v29;
    if (v21)
    {
      brc_bread_crumbs();
      uint64_t v26 = (char *)objc_claimAutoreleasedReturnValue();
      id v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v34 = self;
        __int16 v35 = 2112;
        id v36 = v23;
        __int16 v37 = 2112;
        id v38 = v25;
        __int16 v39 = 2112;
        id v40 = v26;
        _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      id v28 = v23;
    }
    else
    {
      brc_bread_crumbs();
      uint64_t v26 = (char *)objc_claimAutoreleasedReturnValue();
      id v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v34 = self;
        __int16 v35 = 2112;
        id v36 = 0;
        __int16 v37 = 2112;
        id v38 = v25;
        __int16 v39 = 2112;
        id v40 = v26;
        _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      id v28 = 0;
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, id))v14 + 2))(v14, v28, v25);
  }
  __brc_leave_section(v32);
}

void __62__BRCXPCRegularIPCsClient_backupDatabaseWithURLWrapper_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dumpCoordinationInfoTo:(id)a3 reply:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient dumpCoordinationInfoTo:reply:]", 2387, v25);
  __int16 v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v25[0];
    qos_class_t v12 = qos_class_self();
    __int16 v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v27 = v11;
    __int16 v28 = 2112;
    id v29 = self;
    __int16 v30 = 2112;
    id v31 = v13;
    __int16 v32 = 2080;
    uint64_t v33 = "-[BRCXPCRegularIPCsClient dumpCoordinationInfoTo:reply:]";
    __int16 v34 = 2112;
    __int16 v35 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__BRCXPCRegularIPCsClient_dumpCoordinationInfoTo_reply___block_invoke;
  uint64_t v23[3] = &unk_1E69957B0;
  void v23[4] = self;
  id v14 = v8;
  id v24 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v23);

  if (v15)
  {
    tracker = self->super._tracker;
    id v17 = dispatch_get_global_queue(0, 0);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__BRCXPCRegularIPCsClient_dumpCoordinationInfoTo_reply___block_invoke_370;
    uint64_t v20[3] = &unk_1E69946C8;
    void v20[4] = self;
    id v21 = v7;
    id v22 = v14;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__BRCXPCRegularIPCsClient_dumpCoordinationInfoTo_reply___block_invoke_371;
    uint64_t v18[3] = &unk_1E6994600;
    void v18[4] = self;
    id v19 = v22;
    brc_task_tracker_async_with_logs(tracker, v17, v20, v18);
  }
  __brc_leave_section(v25);
}

void __56__BRCXPCRegularIPCsClient_dumpCoordinationInfoTo_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__BRCXPCRegularIPCsClient_dumpCoordinationInfoTo_reply___block_invoke_370(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9438760]();
  id v3 = [*(id *)(a1 + 32) session];
  uint64_t v4 = *(void *)(a1 + 40);
  id v13 = 0;
  uint64_t v5 = [v3 dumpFileCoordinationInfoToFileHandle:v4 error:&v13];
  id v6 = v13;

  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = objc_msgSend(v6, "brc_wrappedError");
    *(_DWORD *)buf = 138413058;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(success=%d, %@)%@", buf, 0x26u);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, v5, v12);
}

void __56__BRCXPCRegularIPCsClient_dumpCoordinationInfoTo_reply___block_invoke_371(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = 0;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v8, 0x26u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)simulateHealthIssueWithContainer:(id)a3 status:(id)a4 reply:(id)a5
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v68 = (BRCXPCRegularIPCsClient *)a3;
  uint64_t v9 = (BRCXPCRegularIPCsClient *)a4;
  id v10 = a5;
  memset(v78, 0, sizeof(v78));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient simulateHealthIssueWithContainer:status:reply:]", 2403, v78);
  brc_bread_crumbs();
  int v11 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v78[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v81 = (BRCXPCRegularIPCsClient *)v13;
    __int16 v82 = 2112;
    __int16 v83 = self;
    __int16 v84 = 2112;
    uint64_t v85 = v15;
    __int16 v86 = 2080;
    v87 = "-[BRCXPCRegularIPCsClient simulateHealthIssueWithContainer:status:reply:]";
    __int16 v88 = 2112;
    id v89 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __73__BRCXPCRegularIPCsClient_simulateHealthIssueWithContainer_status_reply___block_invoke;
  v76[3] = &unk_1E69957B0;
  v76[4] = self;
  id v16 = v10;
  id v77 = v16;
  int v17 = _brc_ipc_spi(self, 1, (uint64_t)a2, v76);

  if (v17)
  {
    memset(v75, 0, sizeof(v75));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient simulateHealthIssueWithContainer:status:reply:]", 2407, v75);
    __int16 v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = v75[0];
      qos_class_t v21 = qos_class_self();
      uint64_t v22 = BRCPrettyPrintEnumWithContext(v21, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      __int16 v81 = (BRCXPCRegularIPCsClient *)v20;
      __int16 v82 = 2112;
      __int16 v83 = self;
      __int16 v84 = 2112;
      uint64_t v85 = v22;
      __int16 v86 = 2080;
      v87 = "-[BRCXPCRegularIPCsClient simulateHealthIssueWithContainer:status:reply:]";
      __int16 v88 = 2112;
      id v89 = v68;
      __int16 v90 = 2112;
      id v91 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    if (v68) {
      id v23 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v68];
    }
    else {
      id v23 = 0;
    }
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __73__BRCXPCRegularIPCsClient_simulateHealthIssueWithContainer_status_reply___block_invoke_372;
    v73[3] = &unk_1E69957B0;
    v73[4] = self;
    id v25 = v16;
    id v74 = v25;
    int v26 = _brc_ipc_check_applibrary_write_access(self, 1, v23, v73);

    if (!v26)
    {
      id v24 = v9;
LABEL_31:

      __brc_leave_section(v75);
      goto LABEL_32;
    }
    memset(v72, 0, sizeof(v72));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient simulateHealthIssueWithContainer:status:reply:]", 2408, v72);
    brc_bread_crumbs();
    uint64_t v27 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    __int16 v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v66 = v16;
      id v29 = v25;
      __int16 v30 = v23;
      uint64_t v31 = v72[0];
      qos_class_t v32 = qos_class_self();
      uint64_t v33 = BRCPrettyPrintEnumWithContext(v32, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219010;
      __int16 v81 = (BRCXPCRegularIPCsClient *)v31;
      __int16 v82 = 2112;
      __int16 v83 = self;
      __int16 v84 = 2112;
      uint64_t v85 = v33;
      __int16 v86 = 2080;
      v87 = "-[BRCXPCRegularIPCsClient simulateHealthIssueWithContainer:status:reply:]";
      __int16 v88 = 2112;
      id v89 = v27;
      _os_log_impl(&dword_1D353B000, v28, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s simulating health issue%@", buf, 0x34u);

      id v23 = v30;
      id v25 = v29;
      id v16 = v66;
    }

    __int16 v34 = brc_bread_crumbs();
    __int16 v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v81 = v68;
      __int16 v82 = 2112;
      __int16 v83 = v9;
      __int16 v84 = 2112;
      uint64_t v85 = v34;
      _os_log_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEFAULT, "[NOTICE] simulating health issue on %@: %@%@", buf, 0x20u);
    }

    long long v65 = [(BRCXPCClient *)self session];
    uint64_t v36 = [v65 appLibraryByID:v68];
    long long v67 = [v36 defaultClientZone];

    if (v67)
    {
      id v24 = [(BRCXPCRegularIPCsClient *)v9 lowercaseString];

      if ([(BRCXPCRegularIPCsClient *)v24 isEqualToString:@"healthy"])
      {
        id v37 = objc_alloc(MEMORY[0x1E4F1A2F8]);
        id v38 = [v67 zoneName];
        __int16 v39 = objc_msgSend(MEMORY[0x1E4F1A320], "brc_zoneHealthZoneID");
        id v40 = (void *)[v37 initWithRecordName:v38 zoneID:v39];

        __int16 v41 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"zoneState" recordID:v40];
        [v41 setObject:&unk_1F2B27150 forKeyedSubscript:@"state"];
        uint64_t v42 = NSNumber;
        uint64_t v43 = [MEMORY[0x1E4F1C9C8] date];
        [v43 timeIntervalSince1970];
        long long v45 = [v42 numberWithUnsignedLongLong:(unint64_t)v44];
        [v41 setObject:v45 forKeyedSubscript:@"updateTime"];

        [v41 setObject:&stru_1F2AC7720 forKeyedSubscript:@"clientInfo"];
        uint64_t v46 = [v67 zoneHealthState];
        __int16 v47 = [v46 ckInfo];
        [v47 setCKInfoFieldsInRecord:v41 includeCZMEtag:0];

        id v48 = objc_alloc(MEMORY[0x1E4F1A198]);
        __int16 v79 = v41;
        __int16 v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
        id v50 = (void *)[v48 initWithRecordsToSave:v49 recordIDsToDelete:0];

        uint64_t v51 = objc_msgSend(MEMORY[0x1E4F1A218], "br_zoneHealthSimulation");
        [v50 setGroup:v51];

        __int16 v52 = objc_opt_new();
        [v50 setConfiguration:v52];

        uint64_t v53 = [v50 configuration];
        [v53 setSourceApplicationBundleIdentifier:*MEMORY[0x1E4F59480]];

        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __73__BRCXPCRegularIPCsClient_simulateHealthIssueWithContainer_status_reply___block_invoke_387;
        v69[3] = &unk_1E6999F40;
        v69[4] = self;
        id v71 = v25;
        id v54 = v65;
        id v70 = v54;
        [v50 setModifyRecordsCompletionBlock:v69];
        BOOL v55 = [v54 syncContextProvider];
        __int16 v56 = [v55 zoneHealthSyncContext];
        [v56 addOperation:v50];

        uint64_t v9 = v24;
      }
      else
      {
        if ([(BRCXPCRegularIPCsClient *)v24 isEqualToString:@"partial"])
        {
          [v67 reportProblemWithType:6 recordName:@"root"];
          uint64_t v60 = brc_bread_crumbs();
          long long v61 = brc_default_log();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            __int16 v81 = self;
            __int16 v82 = 2112;
            __int16 v83 = 0;
            __int16 v84 = 2112;
            uint64_t v85 = v60;
            _os_log_impl(&dword_1D353B000, v61, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
          }

          (*((void (**)(id, void))v25 + 2))(v25, 0);
          goto LABEL_30;
        }
        uint64_t v62 = brc_bread_crumbs();
        long long v63 = brc_default_log();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"newStatus", v24);
          long long v64 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          __int16 v81 = self;
          __int16 v82 = 2112;
          __int16 v83 = v64;
          __int16 v84 = 2112;
          uint64_t v85 = v62;
          _os_log_impl(&dword_1D353B000, v63, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
        id v40 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"newStatus", v24);
        (*((void (**)(id, void *))v25 + 2))(v25, v40);
        uint64_t v9 = v24;
      }
    }
    else
    {
      uint64_t v57 = brc_bread_crumbs();
      __int16 v58 = brc_default_log();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v68);
        uint64_t v59 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        __int16 v81 = self;
        __int16 v82 = 2112;
        __int16 v83 = v59;
        __int16 v84 = 2112;
        uint64_t v85 = v57;
        _os_log_impl(&dword_1D353B000, v58, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      id v40 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v68);
      (*((void (**)(id, void *))v25 + 2))(v25, v40);
    }

    id v24 = v9;
LABEL_30:

    __brc_leave_section(v72);
    goto LABEL_31;
  }
  id v24 = v9;
LABEL_32:
  __brc_leave_section(v78);
}

void __73__BRCXPCRegularIPCsClient_simulateHealthIssueWithContainer_status_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__BRCXPCRegularIPCsClient_simulateHealthIssueWithContainer_status_reply___block_invoke_372(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__BRCXPCRegularIPCsClient_simulateHealthIssueWithContainer_status_reply___block_invoke_387(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = objc_msgSend(v5, "brc_wrappedError");
    int v13 = 138412802;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    __int16 v18 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  __int16 v11 = objc_msgSend(v5, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  __int16 v12 = [*(id *)(a1 + 40) containerScheduler];
  [v12 scheduleSyncDownForZoneHealthWithGroup:0];
}

- (void)healthStatusStringForContainer:(id)a3 reply:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  memset(v48, 0, sizeof(v48));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient healthStatusStringForContainer:reply:]", 2457, v48);
  __int16 v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v48[0];
    qos_class_t v12 = qos_class_self();
    int v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v50 = (BRCXPCRegularIPCsClient *)v11;
    __int16 v51 = 2112;
    __int16 v52 = self;
    __int16 v53 = 2112;
    id v54 = v13;
    __int16 v55 = 2080;
    __int16 v56 = "-[BRCXPCRegularIPCsClient healthStatusStringForContainer:reply:]";
    __int16 v57 = 2112;
    id v58 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __64__BRCXPCRegularIPCsClient_healthStatusStringForContainer_reply___block_invoke;
  uint64_t v46[3] = &unk_1E69957B0;
  v46[4] = self;
  id v14 = v8;
  id v47 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v46);

  if (v15)
  {
    memset(v45, 0, sizeof(v45));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient healthStatusStringForContainer:reply:]", 2461, v45);
    id v16 = brc_bread_crumbs();
    __int16 v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v45[0];
      qos_class_t v19 = qos_class_self();
      uint64_t v20 = BRCPrettyPrintEnumWithContext(v19, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      id v50 = (BRCXPCRegularIPCsClient *)v18;
      __int16 v51 = 2112;
      __int16 v52 = self;
      __int16 v53 = 2112;
      id v54 = v20;
      __int16 v55 = 2080;
      __int16 v56 = "-[BRCXPCRegularIPCsClient healthStatusStringForContainer:reply:]";
      __int16 v57 = 2112;
      id v58 = v7;
      __int16 v59 = 2112;
      uint64_t v60 = v16;
      _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    if (v7) {
      qos_class_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v7];
    }
    else {
      qos_class_t v21 = 0;
    }
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __64__BRCXPCRegularIPCsClient_healthStatusStringForContainer_reply___block_invoke_398;
    v43[3] = &unk_1E69957B0;
    void v43[4] = self;
    id v22 = v14;
    id v44 = v22;
    __int16 v41 = v21;
    int v23 = _brc_ipc_check_applibrary_read_access(self, 1, v21, v43);

    if (v23)
    {
      memset(v42, 0, sizeof(v42));
      __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient healthStatusStringForContainer:reply:]", 2463, v42);
      id v24 = brc_bread_crumbs();
      id v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = v42[0];
        qos_class_t v27 = qos_class_self();
        __int16 v28 = BRCPrettyPrintEnumWithContext(v27, (uint64_t)&brc_qos_entries, 0);
        *(_DWORD *)buf = 134219266;
        id v50 = (BRCXPCRegularIPCsClient *)v26;
        __int16 v51 = 2112;
        __int16 v52 = self;
        __int16 v53 = 2112;
        id v54 = v28;
        __int16 v55 = 2080;
        __int16 v56 = "-[BRCXPCRegularIPCsClient healthStatusStringForContainer:reply:]";
        __int16 v57 = 2112;
        id v58 = v7;
        __int16 v59 = 2112;
        uint64_t v60 = v24;
        _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s getting health status on %@%@", buf, 0x3Eu);
      }
      id v29 = [(BRCXPCClient *)self session];
      __int16 v30 = [v29 appLibraryByID:v7];
      uint64_t v31 = [v30 defaultClientZone];

      if (v31)
      {
        brc_bread_crumbs();
        qos_class_t v32 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          __int16 v34 = [v31 zoneHealthState];
          zoneHealthStateDescriptionForCode([v34 state]);
          __int16 v35 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          id v50 = self;
          __int16 v51 = 2112;
          __int16 v52 = v35;
          __int16 v53 = 2112;
          id v54 = 0;
          __int16 v55 = 2112;
          __int16 v56 = v32;
          _os_log_impl(&dword_1D353B000, v33, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }
        uint64_t v36 = [v31 zoneHealthState];
        id v37 = zoneHealthStateDescriptionForCode([v36 state]);
        (*((void (**)(id, void *, void))v22 + 2))(v22, v37, 0);
      }
      else
      {
        brc_bread_crumbs();
        id v38 = (char *)objc_claimAutoreleasedReturnValue();
        __int16 v39 = brc_default_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          id v40 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v7);
          *(_DWORD *)buf = 138413058;
          id v50 = self;
          __int16 v51 = 2112;
          __int16 v52 = 0;
          __int16 v53 = 2112;
          id v54 = v40;
          __int16 v55 = 2112;
          __int16 v56 = v38;
          _os_log_impl(&dword_1D353B000, v39, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }
        uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v7);
        (*((void (**)(id, void, void *))v22 + 2))(v22, 0, v36);
      }

      __brc_leave_section(v42);
    }

    __brc_leave_section(v45);
  }
  __brc_leave_section(v48);
}

void __64__BRCXPCRegularIPCsClient_healthStatusStringForContainer_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __64__BRCXPCRegularIPCsClient_healthStatusStringForContainer_reply___block_invoke_398(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)zoneNameForContainer:(id)a3 reply:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  memset(v43, 0, sizeof(v43));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient zoneNameForContainer:reply:]", 2478, v43);
  __int16 v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v43[0];
    qos_class_t v12 = qos_class_self();
    __int16 v13 = BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    long long v45 = (BRCXPCRegularIPCsClient *)v11;
    __int16 v46 = 2112;
    id v47 = self;
    __int16 v48 = 2112;
    __int16 v49 = v13;
    __int16 v50 = 2080;
    __int16 v51 = "-[BRCXPCRegularIPCsClient zoneNameForContainer:reply:]";
    __int16 v52 = 2112;
    id v53 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __54__BRCXPCRegularIPCsClient_zoneNameForContainer_reply___block_invoke;
  uint64_t v41[3] = &unk_1E69957B0;
  void v41[4] = self;
  id v14 = v8;
  id v42 = v14;
  int v15 = _brc_ipc_spi(self, 1, (uint64_t)a2, v41);

  if (v15)
  {
    memset(v40, 0, sizeof(v40));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient zoneNameForContainer:reply:]", 2482, v40);
    id v16 = brc_bread_crumbs();
    __int16 v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v40[0];
      qos_class_t v19 = qos_class_self();
      uint64_t v20 = BRCPrettyPrintEnumWithContext(v19, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219266;
      long long v45 = (BRCXPCRegularIPCsClient *)v18;
      __int16 v46 = 2112;
      id v47 = self;
      __int16 v48 = 2112;
      __int16 v49 = v20;
      __int16 v50 = 2080;
      __int16 v51 = "-[BRCXPCRegularIPCsClient zoneNameForContainer:reply:]";
      __int16 v52 = 2112;
      id v53 = v7;
      __int16 v54 = 2112;
      __int16 v55 = v16;
      _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
    }
    if (v7) {
      qos_class_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v7];
    }
    else {
      qos_class_t v21 = 0;
    }
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    uint64_t v36 = __54__BRCXPCRegularIPCsClient_zoneNameForContainer_reply___block_invoke_399;
    id v37 = &unk_1E69957B0;
    id v38 = self;
    id v22 = v14;
    id v39 = v22;
    int v23 = _brc_ipc_check_applibrary_read_access(self, 1, v21, &v34);

    if (v23)
    {
      id v24 = [(BRCXPCClient *)self session];
      id v25 = [v24 appLibraryByID:v7];
      uint64_t v26 = [v25 defaultClientZone];

      if (v26)
      {
        brc_bread_crumbs();
        qos_class_t v27 = (char *)objc_claimAutoreleasedReturnValue();
        __int16 v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = [v26 zoneName];
          *(_DWORD *)buf = 138413058;
          long long v45 = self;
          __int16 v46 = 2112;
          id v47 = v29;
          __int16 v48 = 2112;
          __int16 v49 = 0;
          __int16 v50 = 2112;
          __int16 v51 = v27;
          _os_log_impl(&dword_1D353B000, v28, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }
        __int16 v30 = [v26 zoneName];
        (*((void (**)(id, void *, void))v22 + 2))(v22, v30, 0);
      }
      else
      {
        brc_bread_crumbs();
        uint64_t v31 = (char *)objc_claimAutoreleasedReturnValue();
        qos_class_t v32 = brc_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v7);
          *(_DWORD *)buf = 138413058;
          long long v45 = self;
          __int16 v46 = 2112;
          id v47 = 0;
          __int16 v48 = 2112;
          __int16 v49 = v33;
          __int16 v50 = 2112;
          __int16 v51 = v31;
          _os_log_impl(&dword_1D353B000, v32, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }
        __int16 v30 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v7);
        (*((void (**)(id, void, void *))v22 + 2))(v22, 0, v30);
      }
    }
    __brc_leave_section(v40);
  }
  __brc_leave_section(v43);
}

void __54__BRCXPCRegularIPCsClient_zoneNameForContainer_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__BRCXPCRegularIPCsClient_zoneNameForContainer_reply___block_invoke_399(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)forceSyncZoneHealthWithBarrierWithTimeout:(unint64_t)a3 reply:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  memset(v53, 0, sizeof(v53));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient forceSyncZoneHealthWithBarrierWithTimeout:reply:]", 2497, v53);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v53[0];
    qos_class_t v10 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    __int16 v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v61 = v11;
    *(_WORD *)uint64_t v62 = 2080;
    *(void *)&v62[2] = "-[BRCXPCRegularIPCsClient forceSyncZoneHealthWithBarrierWithTimeout:reply:]";
    *(_WORD *)&v62[10] = 2112;
    *(void *)&v62[12] = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke;
  v51[3] = &unk_1E69957B0;
  v51[4] = self;
  id v12 = v6;
  id v52 = v12;
  int v13 = _brc_ipc_check_applibraries_access(self, 1, v51);

  if (v13)
  {
    memset(buf, 0, sizeof(buf));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient forceSyncZoneHealthWithBarrierWithTimeout:reply:]", 2499, buf);
    id v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient forceSyncZoneHealthWithBarrierWithTimeout:reply:]();
    }

    long long v49 = *(_OWORD *)buf;
    uint64_t v50 = *(void *)&buf[16];
    uint64_t v45 = 0;
    __int16 v46 = &v45;
    uint64_t v47 = 0x2020000000;
    char v48 = 0;
    id v16 = dispatch_group_create();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v61 = __Block_byref_object_copy__48;
    *(void *)uint64_t v62 = __Block_byref_object_dispose__48;
    *(void *)&v62[8] = 0;
    dispatch_group_enter(v16);
    __int16 v17 = [(BRCXPCClient *)self session];
    uint64_t v18 = [v17 containerScheduler];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_400;
    uint64_t v40[3] = &unk_1E6994B78;
    long long v43 = v49;
    uint64_t v44 = v50;
    id v42 = buf;
    qos_class_t v19 = v16;
    __int16 v41 = v19;
    [v18 notifyAfterNextZoneHealthSyncDown:v40];

    uint64_t v20 = [(BRCXPCClient *)self session];
    qos_class_t v21 = [v20 containerScheduler];
    [v21 scheduleSyncDownForZoneHealthWithGroup:0];

    queue = self->super._queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_401;
    block[3] = &unk_1E699A7C8;
    long long v38 = v49;
    uint64_t v39 = v50;
    void block[4] = self;
    uint64_t v36 = &v45;
    id v37 = buf;
    id v23 = v12;
    id v35 = v23;
    dispatch_group_notify(v19, queue, block);
    if (a3)
    {
      dispatch_time_t v24 = dispatch_time(0, 1000000000 * a3);
      if (dispatch_group_wait(v19, v24))
      {
        long long v32 = v49;
        uint64_t v33 = v50;
        id v25 = brc_bread_crumbs();
        uint64_t v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[BRCXPCRegularIPCsClient forceSyncZoneHealthWithBarrierWithTimeout:reply:]();
        }

        qos_class_t v27 = self;
        objc_sync_enter(v27);
        if (!*((unsigned char *)v46 + 24))
        {
          *((unsigned char *)v46 + 24) = 1;
          __int16 v28 = brc_bread_crumbs();
          id v29 = brc_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            __int16 v30 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 60, @"zone-health sync timed-out", v32, v33);
            *(_DWORD *)__int16 v54 = 138412802;
            __int16 v55 = v27;
            __int16 v56 = 2112;
            __int16 v57 = v30;
            __int16 v58 = 2112;
            __int16 v59 = v28;
            _os_log_impl(&dword_1D353B000, v29, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", v54, 0x20u);
          }
          uint64_t v31 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 60, @"zone-health sync timed-out");
          (*((void (**)(id, void *))v23 + 2))(v23, v31);
        }
        objc_sync_exit(v27);

        __brc_leave_section((uint64_t *)&v32);
      }
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v45, 8);
  }
  __brc_leave_section(v53);
}

void __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_400(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v11 = *(_OWORD *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_400_cold_2();
  }

  if (v3)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_400_cold_1();
    }

    uint64_t v8 = objc_msgSend(v3, "brc_wrappedError", v11, v12);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  __brc_leave_section((uint64_t *)&v11);
}

void __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_401(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v11 = *(_OWORD *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 80);
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_401_cold_1();
  }

  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v5 + 24))
  {
    *(unsigned char *)(v5 + 24) = 1;
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v10);
  }
  objc_sync_exit(v4);

  __brc_leave_section((uint64_t *)&v11);
}

- (void)forceSyncWithBarrierContainerID:(id)a3 timeout:(unint64_t)a4 reply:(id)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  memset(v79, 0, sizeof(v79));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient forceSyncWithBarrierContainerID:timeout:reply:]", 2544, v79);
  uint64_t v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v79[0];
    qos_class_t v12 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v12, (uint64_t)&brc_qos_entries, 0);
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    __int16 v88 = v13;
    *(_WORD *)id v89 = 2080;
    *(void *)&v89[2] = "-[BRCXPCRegularIPCsClient forceSyncWithBarrierContainerID:timeout:reply:]";
    *(_WORD *)&v89[10] = 2112;
    *(void *)&v89[12] = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke;
  v77[3] = &unk_1E69957B0;
  v77[4] = self;
  id v14 = v8;
  id v78 = v14;
  int v15 = _brc_ipc_check_applibraries_access(self, 1, v77);

  if (v15)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v88 = __Block_byref_object_copy__48;
    *(void *)id v89 = __Block_byref_object_dispose__48;
    *(void *)&v89[8] = 0;
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x3032000000;
    uint64_t v75[3] = __Block_byref_object_copy__48;
    v75[4] = __Block_byref_object_dispose__48;
    id v76 = 0;
    group = dispatch_group_create();
    uint64_t v16 = *MEMORY[0x1E4F59408];
    v86[0] = *MEMORY[0x1E4F59458];
    v86[1] = v16;
    uint64_t v17 = *MEMORY[0x1E4F596D8];
    v86[2] = *MEMORY[0x1E4F59480];
    v86[3] = v17;
    uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:4];
    int v18 = [v47 containsObject:v7];
    char v19 = v18;
    if (v18)
    {
      uint64_t v20 = brc_bread_crumbs();
      qos_class_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[BRCXPCRegularIPCsClient forceSyncWithBarrierContainerID:timeout:reply:]();
      }

      id v22 = v7;
      id v23 = 0;
    }
    else
    {
      if (v7)
      {
        uint64_t v24 = [objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v7];
      }
      else
      {
        uint64_t v24 = [(BRCXPCClient *)self defaultMangledID];
      }
      id v25 = (id)v24;
      id v23 = [(BRCXPCClient *)self _setupAppLibrary:v24 error:*(void *)&buf[8] + 40];
      if (!v23)
      {
        long long v43 = brc_bread_crumbs();
        uint64_t v44 = brc_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          uint64_t v45 = objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "brc_wrappedError");
          *(_DWORD *)__int16 v82 = 138412802;
          *(void *)&v82[4] = self;
          *(_WORD *)&v82[12] = 2112;
          *(void *)&v82[14] = v45;
          *(_WORD *)&v82[22] = 2112;
          id v83 = v43;
          _os_log_impl(&dword_1D353B000, v44, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", v82, 0x20u);
        }
        __int16 v46 = objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "brc_wrappedError");
        (*((void (**)(id, void *))v14 + 2))(v14, v46);

        id v23 = 0;
        goto LABEL_27;
      }
      [(BRCXPCClient *)self addAppLibrary:v23];
      uint64_t v26 = [v23 defaultClientZone];
      id v22 = [v26 zoneName];
    }
    memset(v80, 0, sizeof(v80));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient forceSyncWithBarrierContainerID:timeout:reply:]", 2578, v80);
    qos_class_t v27 = brc_bread_crumbs();
    __int16 v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int16 v82 = 134218754;
      *(void *)&v82[4] = *(void *)v80;
      *(_WORD *)&v82[12] = 2112;
      *(void *)&v82[14] = v7;
      *(_WORD *)&v82[22] = 2112;
      id v83 = v22;
      __int16 v84 = 2112;
      uint64_t v85 = v27;
      _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for next sync down for %@ -> %@%@", v82, 0x2Au);
    }

    long long v73 = *(_OWORD *)v80;
    uint64_t v74 = *(void *)&v80[16];
    if ((v19 & 1) == 0)
    {
      dispatch_group_enter(group);
      id v29 = [v23 defaultClientZone];
      __int16 v30 = [(BRCXPCClient *)self description];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_405;
      v67[3] = &unk_1E699A7F0;
      long long v71 = v73;
      uint64_t v72 = v74;
      id v68 = v22;
      id v70 = buf;
      id v69 = group;
      [v29 notifyClient:v30 afterNextSyncDown:v67];
    }
    dispatch_group_enter(group);
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_406;
    v61[3] = &unk_1E699A7F0;
    long long v65 = v73;
    uint64_t v66 = v74;
    id v31 = v22;
    id v62 = v31;
    long long v64 = v75;
    long long v32 = group;
    uint64_t v63 = v32;
    [(BRCXPCRegularIPCsClient *)self forceSyncContainerID:v31 reply:v61];
    *(void *)__int16 v82 = 0;
    *(void *)&v82[8] = v82;
    *(void *)&v82[16] = 0x2020000000;
    LOBYTE(v83) = 0;
    queue = self->super._queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_407;
    block[3] = &unk_1E699A818;
    long long v59 = v73;
    uint64_t v60 = v74;
    id v25 = v31;
    id v53 = v25;
    __int16 v54 = self;
    __int16 v56 = v82;
    __int16 v57 = buf;
    __int16 v58 = v75;
    id v34 = v14;
    id v55 = v34;
    dispatch_group_notify(v32, queue, block);
    if (a4)
    {
      dispatch_time_t v35 = dispatch_time(0, 1000000000 * a4);
      if (dispatch_group_wait(v32, v35))
      {
        long long v50 = v73;
        uint64_t v51 = v74;
        uint64_t v36 = brc_bread_crumbs();
        id v37 = brc_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)id v80 = 134218498;
          *(void *)&v80[4] = v50;
          *(_WORD *)&v80[12] = 2112;
          *(void *)&v80[14] = v25;
          *(_WORD *)&v80[22] = 2112;
          __int16 v81 = v36;
          _os_log_debug_impl(&dword_1D353B000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx timed-out: sync of %@%@", v80, 0x20u);
        }

        long long v38 = self;
        objc_sync_enter(v38);
        if (!*(unsigned char *)(*(void *)&v82[8] + 24))
        {
          *(unsigned char *)(*(void *)&v82[8] + 24) = 1;
          uint64_t v39 = brc_bread_crumbs();
          id v40 = brc_default_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            __int16 v41 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 60, @"sync-down timed out: %@", v7);
            *(_DWORD *)id v80 = 138412802;
            *(void *)&v80[4] = v38;
            *(_WORD *)&v80[12] = 2112;
            *(void *)&v80[14] = v41;
            *(_WORD *)&v80[22] = 2112;
            __int16 v81 = v39;
            _os_log_impl(&dword_1D353B000, v40, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", v80, 0x20u);
          }
          id v42 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 60, @"sync-down timed out: %@", v7);
          (*((void (**)(id, void *))v34 + 2))(v34, v42);
        }
        objc_sync_exit(v38);

        __brc_leave_section((uint64_t *)&v50);
      }
    }

    _Block_object_dispose(v82, 8);
LABEL_27:

    _Block_object_dispose(v75, 8);
    _Block_object_dispose(buf, 8);
  }
  __brc_leave_section(v79);
}

void __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    qos_class_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_405(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = *(_OWORD *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 72);
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    char v19 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished sync down for %@%@", buf, 0x20u);
  }

  if (v3)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_405_cold_1();
    }

    uint64_t v8 = objc_msgSend(v3, "brc_wrappedError");
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  __brc_leave_section((uint64_t *)&v12);
}

void __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_406(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = *(_OWORD *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 72);
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    char v19 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished scheduling sync for %@%@", buf, 0x20u);
  }

  if (v3)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_406_cold_1();
    }

    uint64_t v8 = objc_msgSend(v3, "brc_wrappedError");
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  __brc_leave_section((uint64_t *)&v12);
}

void __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_407(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v12 = *(_OWORD *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 96);
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    char v19 = v2;
    _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished all sync down tasks for %@%@", buf, 0x20u);
  }

  id v4 = *(id *)(a1 + 40);
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v5 + 24))
  {
    *(unsigned char *)(v5 + 24) = 1;
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      if (!v9) {
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      char v19 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (!v10) {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v10);
  }
  objc_sync_exit(v4);

  __brc_leave_section((uint64_t *)&v12);
}

- (void)forceSyncContainerID:(id)a3 reply:(id)a4
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v70 = a3;
  id v69 = (void (**)(id, void))a4;
  uint64_t v93 = 0;
  uint64_t v94 = &v93;
  uint64_t v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__48;
  __int16 v97 = __Block_byref_object_dispose__48;
  id v98 = 0;
  memset(v92, 0, sizeof(v92));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient forceSyncContainerID:reply:]", 2633, v92);
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v92[0];
    qos_class_t v9 = qos_class_self();
    uint64_t v10 = BRCPrettyPrintEnumWithContext(v9, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    v102 = (BRCXPCRegularIPCsClient *)v8;
    __int16 v103 = 2112;
    v104 = self;
    __int16 v105 = 2112;
    id v106 = v10;
    __int16 v107 = 2080;
    v108 = "-[BRCXPCRegularIPCsClient forceSyncContainerID:reply:]";
    __int16 v109 = 2112;
    v110 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke;
  v91[3] = &unk_1E6994678;
  v91[4] = &v93;
  _brc_ipc_check_applibraries_access(self, 1, v91);
  uint64_t v11 = (void *)v94[5];
  if (!v11) {
    goto LABEL_6;
  }
  if ((objc_msgSend(v11, "br_isCloudDocsErrorCode:", 16) & 1) == 0)
  {
    id v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
      goto LABEL_55;
    }
    goto LABEL_56;
  }
  if (![(BRCXPCClient *)self _hasPrivateIPCEntitlementForSelector:a2 error:0])
  {
    id v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
LABEL_55:
      id v62 = (BRCXPCRegularIPCsClient *)v94[5];
      *(_DWORD *)buf = 138412802;
      v102 = self;
      __int16 v103 = 2112;
      v104 = v62;
      __int16 v105 = 2112;
      id v106 = v23;
      _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
LABEL_56:

    v69[2](v69, v94[5]);
    goto LABEL_57;
  }
LABEL_6:
  memset(v90, 0, sizeof(v90));
  __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient forceSyncContainerID:reply:]", 2648, v90);
  brc_bread_crumbs();
  long long v12 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v102 = (BRCXPCRegularIPCsClient *)v90[0];
    __int16 v103 = 2112;
    v104 = self;
    __int16 v105 = 2112;
    id v106 = v70;
    __int16 v107 = 2112;
    v108 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: force syncing containers matching '%@'%@", buf, 0x2Au);
  }

  if (v70)
  {
    id v14 = [(id)*MEMORY[0x1E4F59458] lowercaseString];
    uint64_t v15 = [v70 lowercaseString];
    int v16 = [v14 containsString:v15];

    uint64_t v17 = [(id)*MEMORY[0x1E4F59408] lowercaseString];
    __int16 v18 = [v70 lowercaseString];
    int v68 = [v17 containsString:v18];

    char v19 = [(id)*MEMORY[0x1E4F59480] lowercaseString];
    uint64_t v20 = [v70 lowercaseString];
    int v67 = [v19 containsString:v20];

    qos_class_t v21 = [(id)*MEMORY[0x1E4F596D8] lowercaseString];
    id v22 = [v70 lowercaseString];
    int v66 = [v21 containsString:v22];
  }
  else
  {
    int v66 = 1;
    int v67 = 1;
    int v68 = 1;
    int v16 = 1;
  }
  [(BRCXPCClient *)self session];
  uint64_t v72 = v89 = 0;
  id v25 = [v72 appLibrariesMatchingSearchString:v70 error:&v89];
  uint64_t v26 = (BRCXPCRegularIPCsClient *)v89;
  long long v65 = v25;
  if (v25) {
    int v27 = 1;
  }
  else {
    int v27 = v16;
  }
  if ((v27 | v68 | v67 | v66))
  {
    __int16 v28 = objc_opt_new();
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v29 = v25;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v85 objects:v100 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v86 != v31) {
            objc_enumerationMutation(v29);
          }
          uint64_t v33 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          [(BRCXPCClient *)self addAppLibrary:v33];
          id v34 = [v33 defaultClientZone];
          [v28 addObject:v34];
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v85 objects:v100 count:16];
      }
      while (v30);
    }

    __int16 v84 = v26;
    long long v64 = [v72 clientZonesMatchingSearchString:v70 error:&v84];
    uint64_t v63 = v84;

    [v28 addObjectsFromArray:v64];
    if (v16)
    {
      brc_bread_crumbs();
      dispatch_time_t v35 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      uint64_t v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v102 = self;
        __int16 v103 = 2112;
        v104 = v35;
        _os_log_impl(&dword_1D353B000, v36, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: force syncing shared database%@", buf, 0x16u);
      }

      id v37 = [v72 containerScheduler];
      [v37 scheduleSyncDownForSharedDatabaseImmediately:1];
    }
    long long v38 = dispatch_group_create();
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id obj = v28;
    uint64_t v39 = [obj countByEnumeratingWithState:&v80 objects:v99 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v81 != v40) {
            objc_enumerationMutation(obj);
          }
          id v42 = *(void **)(*((void *)&v80 + 1) + 8 * j);
          long long v43 = brc_bread_crumbs();
          uint64_t v44 = brc_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v45 = [v42 mangledID];
            *(_DWORD *)buf = 138412802;
            v102 = self;
            __int16 v103 = 2112;
            v104 = v45;
            __int16 v105 = 2112;
            id v106 = v43;
            _os_log_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: force syncing %@%@", buf, 0x20u);
          }
          dispatch_group_enter(v38);
          tracker = self->super._tracker;
          uint64_t v47 = [v72 clientTruthWorkloop];
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke_411;
          uint64_t v78[3] = &unk_1E6993628;
          v78[4] = v42;
          __int16 v79 = v38;
          v76[0] = MEMORY[0x1E4F143A8];
          v76[1] = 3221225472;
          v76[2] = __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke_2;
          v76[3] = &unk_1E6993698;
          id v77 = v79;
          brc_task_tracker_async_with_logs(tracker, v47, v78, v76);
        }
        uint64_t v39 = [obj countByEnumeratingWithState:&v80 objects:v99 count:16];
      }
      while (v39);
    }

    if (v68)
    {
      brc_bread_crumbs();
      char v48 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      long long v49 = brc_default_log();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v102 = self;
        __int16 v103 = 2112;
        v104 = v48;
        _os_log_impl(&dword_1D353B000, v49, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: force syncing container metadata%@", buf, 0x16u);
      }

      long long v50 = [v72 containerScheduler];
      [v50 scheduleSyncDownForContainerMetadataWithGroup:0];
    }
    if (v67)
    {
      brc_bread_crumbs();
      uint64_t v51 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      id v52 = brc_default_log();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v102 = self;
        __int16 v103 = 2112;
        v104 = v51;
        _os_log_impl(&dword_1D353B000, v52, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: forcing syncing zone health%@", buf, 0x16u);
      }

      id v53 = [v72 containerScheduler];
      [v53 scheduleSyncDownForZoneHealthWithGroup:0];
    }
    if (v66)
    {
      brc_bread_crumbs();
      __int16 v54 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      id v55 = brc_default_log();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v102 = self;
        __int16 v103 = 2112;
        v104 = v54;
        _os_log_impl(&dword_1D353B000, v55, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: forcing syncing side car zone%@", buf, 0x16u);
      }

      __int16 v56 = [v72 containerScheduler];
      __int16 v57 = objc_msgSend(MEMORY[0x1E4F1A218], "br_syncDownPushTriggered");
      [v56 scheduleSyncDownForSideCarWithGroup:v57];
    }
    queue = self->super._queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke_412;
    block[3] = &unk_1E6994600;
    void block[4] = self;
    __int16 v75 = v69;
    dispatch_group_notify(v38, queue, block);

    uint64_t v26 = v63;
    long long v59 = v65;
  }
  else
  {
    uint64_t v60 = brc_bread_crumbs();
    uint64_t v61 = brc_default_log();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v102 = self;
      __int16 v103 = 2112;
      v104 = v26;
      __int16 v105 = 2112;
      id v106 = v60;
      _os_log_impl(&dword_1D353B000, v61, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    ((void (**)(id, BRCXPCRegularIPCsClient *))v69)[2](v69, v26);
    long long v59 = v65;
  }

  __brc_leave_section(v90);
LABEL_57:
  __brc_leave_section(v92);
  _Block_object_dispose(&v93, 8);
}

void __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke_411(uint64_t a1)
{
  [*(id *)(a1 + 32) resetSyncBudgetAndThrottle];
  [*(id *)(a1 + 32) clearStateBits:0x200000];
  [*(id *)(a1 + 32) scheduleSyncDown];
  id v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke_2(uint64_t a1)
{
}

uint64_t __54__BRCXPCRegularIPCsClient_forceSyncContainerID_reply___block_invoke_412(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)iWorkForceSyncContainerID:(id)a3 ownedByMe:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  memset(v39, 0, sizeof(v39));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient iWorkForceSyncContainerID:ownedByMe:reply:]", 2718, v39);
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v39[0];
    qos_class_t v13 = qos_class_self();
    id v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v41 = (BRCXPCRegularIPCsClient *)v12;
    __int16 v42 = 2112;
    long long v43 = self;
    __int16 v44 = 2112;
    id v45 = v14;
    __int16 v46 = 2080;
    *(void *)uint64_t v47 = "-[BRCXPCRegularIPCsClient iWorkForceSyncContainerID:ownedByMe:reply:]";
    *(_WORD *)&v47[8] = 2112;
    *(void *)&v47[10] = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v15 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v16 = [v15 isSharingPrivateInterfaceEntitled];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __69__BRCXPCRegularIPCsClient_iWorkForceSyncContainerID_ownedByMe_reply___block_invoke;
  uint64_t v37[3] = &unk_1E69957B0;
  v37[4] = self;
  id v17 = v9;
  id v38 = v17;
  char v18 = _brc_ipc_check_client_privilege(self, 1, v16, (uint64_t)"isSharingPrivateInterfaceEntitled", v37);

  if (v18)
  {
    memset(v36, 0, sizeof(v36));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient iWorkForceSyncContainerID:ownedByMe:reply:]", 2720, v36);
    char v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219010;
      __int16 v41 = (BRCXPCRegularIPCsClient *)v36[0];
      __int16 v42 = 2112;
      long long v43 = self;
      __int16 v44 = 2112;
      id v45 = v8;
      __int16 v46 = 1024;
      *(_DWORD *)uint64_t v47 = v6;
      *(_WORD *)&v47[4] = 2112;
      *(void *)&v47[6] = v19;
      _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: iWork force syncing containers matching '%@' ownedByMe:%d%@", buf, 0x30u);
    }

    qos_class_t v21 = [(BRCXPCClient *)self session];
    id v22 = v21;
    if (v6)
    {
      id v23 = [v21 appLibraryByID:v8];
      tracker = self->super._tracker;
      id v25 = [v22 clientTruthWorkloop];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __69__BRCXPCRegularIPCsClient_iWorkForceSyncContainerID_ownedByMe_reply___block_invoke_413;
      uint64_t v34[3] = &unk_1E6993698;
      id v26 = v23;
      id v35 = v26;
      brc_task_tracker_async_with_logs(tracker, v25, v34, 0);

      int v27 = brc_bread_crumbs();
      __int16 v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        if (v8)
        {
          id v29 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", 0);
          id v29 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138412802;
        __int16 v41 = self;
        __int16 v42 = 2112;
        long long v43 = v29;
        __int16 v44 = 2112;
        id v45 = v27;
        _os_log_impl(&dword_1D353B000, v28, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        if (!v8) {
      }
        }
      if (v8)
      {
        uint64_t v33 = 0;
      }
      else
      {
        uint64_t v33 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", 0);
      }
      (*((void (**)(id, void *))v17 + 2))(v17, v33);
      if (!v8) {
    }
      }
    else
    {
      uint64_t v30 = [v21 containerScheduler];
      [v30 scheduleSyncDownForSharedDatabaseImmediately:1];

      uint64_t v31 = brc_bread_crumbs();
      long long v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v41 = self;
        __int16 v42 = 2112;
        long long v43 = 0;
        __int16 v44 = 2112;
        id v45 = v31;
        _os_log_impl(&dword_1D353B000, v32, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }

      (*((void (**)(id, void))v17 + 2))(v17, 0);
    }

    __brc_leave_section(v36);
  }
  __brc_leave_section(v39);
}

void __69__BRCXPCRegularIPCsClient_iWorkForceSyncContainerID_ownedByMe_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69__BRCXPCRegularIPCsClient_iWorkForceSyncContainerID_ownedByMe_reply___block_invoke_413(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) defaultClientZone];
  [v1 scheduleSyncDown];
}

- (void)createContainerWithID:(id)a3 ownerName:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient createContainerWithID:ownerName:reply:]", 2740, v27);
  uint64_t v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v27[0];
    qos_class_t v15 = qos_class_self();
    char v16 = BRCPrettyPrintEnumWithContext(v15, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v29 = (BRCXPCRegularIPCsClient *)v14;
    __int16 v30 = 2112;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v16;
    __int16 v34 = 2080;
    id v35 = "-[BRCXPCRegularIPCsClient createContainerWithID:ownerName:reply:]";
    __int16 v36 = 2112;
    id v37 = v12;
    _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__BRCXPCRegularIPCsClient_createContainerWithID_ownerName_reply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v17 = v11;
  id v26 = v17;
  int v18 = _brc_ipc_spi(self, 1, (uint64_t)a2, v25);

  if (v18)
  {
    char v19 = [(BRCXPCClient *)self session];
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithZoneName:v9 ownerName:v10];
    if ([v20 isShared]) {
      id v21 = (id)[v19 getOrCreateSharedZones:v20];
    }
    else {
      id v22 = (id)[v19 getOrCreateAppLibraryAndPrivateZonesIfNecessary:v20];
    }
    id v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v29 = self;
      __int16 v30 = 2112;
      uint64_t v31 = 0;
      __int16 v32 = 2112;
      uint64_t v33 = v23;
      _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v17 + 2))(v17, 0);
  }
  __brc_leave_section(v27);
}

void __65__BRCXPCRegularIPCsClient_createContainerWithID_ownerName_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)computePurgeableSpaceForAllUrgenciesWithReply:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  memset(v23, 0, sizeof(v23));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient computePurgeableSpaceForAllUrgenciesWithReply:]", 2759, v23);
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v23[0];
    qos_class_t v9 = qos_class_self();
    id v10 = BRCPrettyPrintEnumWithContext(v9, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v25 = (BRCXPCRegularIPCsClient *)v8;
    __int16 v26 = 2112;
    int v27 = self;
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 2080;
    uint64_t v31 = "-[BRCXPCRegularIPCsClient computePurgeableSpaceForAllUrgenciesWithReply:]";
    __int16 v32 = 2112;
    uint64_t v33 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__BRCXPCRegularIPCsClient_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke;
  uint64_t v21[3] = &unk_1E69957B0;
  v21[4] = self;
  id v11 = v5;
  id v22 = v11;
  int v12 = _brc_ipc_spi(self, 1, (uint64_t)a2, v21);

  if (v12)
  {
    uint64_t v13 = [(BRCXPCClient *)self session];
    uint64_t v14 = [v13 diskReclaimer];

    if (v14)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __73__BRCXPCRegularIPCsClient_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_414;
      uint64_t v19[3] = &unk_1E699A840;
      void v19[4] = self;
      id v20 = v11;
      [v14 computePurgeableSpaceForAllUrgenciesWithReply:v19];
    }
    else
    {
      qos_class_t v15 = brc_bread_crumbs();
      char v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
        id v17 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        id v25 = self;
        __int16 v26 = 2112;
        int v27 = 0;
        __int16 v28 = 2112;
        id v29 = 0;
        __int16 v30 = 2112;
        uint64_t v31 = v17;
        __int16 v32 = 2112;
        uint64_t v33 = v15;
        _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
      }
      int v18 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
      (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v18);
    }
  }
  __brc_leave_section(v23);
}

void __73__BRCXPCRegularIPCsClient_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    char v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__BRCXPCRegularIPCsClient_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_414(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138413314;
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v13, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)purgeAmount:(int64_t)a3 withUrgency:(int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient purgeAmount:withUrgency:reply:]", 2777, v24);
  uint64_t v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v24[0];
    qos_class_t v13 = qos_class_self();
    uint64_t v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v26 = (BRCXPCRegularIPCsClient *)v12;
    __int16 v27 = 2112;
    __int16 v28 = self;
    __int16 v29 = 2112;
    __int16 v30 = v14;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCXPCRegularIPCsClient purgeAmount:withUrgency:reply:]";
    __int16 v33 = 2112;
    uint64_t v34 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __57__BRCXPCRegularIPCsClient_purgeAmount_withUrgency_reply___block_invoke;
  uint64_t v22[3] = &unk_1E69957B0;
  uint8_t v22[4] = self;
  id v15 = v9;
  id v23 = v15;
  int v16 = _brc_ipc_spi(self, 1, (uint64_t)a2, v22);

  if (v16)
  {
    __int16 v17 = [(BRCXPCClient *)self session];
    id v18 = [v17 diskReclaimer];

    uint64_t v19 = [v18 purgeSpace:a3 withUrgency:v5];
    id v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v26 = self;
      __int16 v27 = 2048;
      __int16 v28 = (BRCXPCRegularIPCsClient *)v19;
      __int16 v29 = 2112;
      __int16 v30 = v20;
      _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%lld)%@", buf, 0x20u);
    }

    (*((void (**)(id, uint64_t))v15 + 2))(v15, v19);
  }
  __brc_leave_section(v24);
}

uint64_t __57__BRCXPCRegularIPCsClient_purgeAmount_withUrgency_reply___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 1024;
    int v9 = 0;
    __int16 v10 = 2112;
    __int16 v11 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d)%@", (uint8_t *)&v6, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reclaimAmount:(int64_t)a3 withUrgency:(int)a4 reply:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient reclaimAmount:withUrgency:reply:]", 2787, v22);
  __int16 v8 = brc_bread_crumbs();
  int v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v22[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v25 = 2112;
    __int16 v26 = self;
    __int16 v27 = 2112;
    __int16 v28 = v12;
    __int16 v29 = 2080;
    __int16 v30 = "-[BRCXPCRegularIPCsClient reclaimAmount:withUrgency:reply:]";
    __int16 v31 = 2112;
    __int16 v32 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__BRCXPCRegularIPCsClient_reclaimAmount_withUrgency_reply___block_invoke;
  uint64_t v20[3] = &unk_1E69957B0;
  void v20[4] = self;
  id v13 = v7;
  id v21 = v13;
  int v14 = _brc_ipc_spi(self, 1, (uint64_t)a2, v20);

  if (v14)
  {
    id v15 = [(BRCXPCClient *)self session];
    int v16 = [v15 diskReclaimer];

    uint64_t v17 = [v16 periodicReclaimSpace];
    id v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = self;
      __int16 v25 = 2048;
      __int16 v26 = (BRCXPCRegularIPCsClient *)v17;
      __int16 v27 = 2112;
      __int16 v28 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%lld)%@", buf, 0x20u);
    }

    (*((void (**)(id, uint64_t))v13 + 2))(v13, v17);
  }
  __brc_leave_section(v22);
}

uint64_t __59__BRCXPCRegularIPCsClient_reclaimAmount_withUrgency_reply___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 1024;
    int v9 = 0;
    __int16 v10 = 2112;
    qos_class_t v11 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d)%@", (uint8_t *)&v6, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dropSpotlightIndexWithReply:(id)a3
{
}

- (void)launchSyncConsistencyChecksWithContainerIDs:(id)a3 reply:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v6 = a4;
  memset(v40, 0, sizeof(v40));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient launchSyncConsistencyChecksWithContainerIDs:reply:]", 2810, v40);
  uint64_t v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v40[0];
    qos_class_t v10 = qos_class_self();
    qos_class_t v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    long long v43 = (BRCXPCRegularIPCsClient *)v9;
    __int16 v44 = 2112;
    id v45 = self;
    __int16 v46 = 2112;
    uint64_t v47 = v11;
    __int16 v48 = 2080;
    long long v49 = "-[BRCXPCRegularIPCsClient launchSyncConsistencyChecksWithContainerIDs:reply:]";
    __int16 v50 = 2112;
    uint64_t v51 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v12 = (void *)*MEMORY[0x1E4F59318];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __77__BRCXPCRegularIPCsClient_launchSyncConsistencyChecksWithContainerIDs_reply___block_invoke;
  uint64_t v38[3] = &unk_1E69957B0;
  v38[4] = self;
  id v13 = v6;
  id v39 = v13;
  LODWORD(v12) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v12, v38);

  if (v12)
  {
    __int16 v30 = [(BRCXPCClient *)self session];
    int v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v31, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v15 = v31;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v35;
      while (2)
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * v18);
          id v20 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v19];
          id v21 = v20;
          if (!v20)
          {
            __int16 v26 = brc_bread_crumbs();
            __int16 v27 = brc_default_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v19);
              __int16 v28 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              long long v43 = self;
              __int16 v44 = 2112;
              id v45 = 0;
              __int16 v46 = 2112;
              uint64_t v47 = 0;
              __int16 v48 = 2112;
              long long v49 = v28;
              __int16 v50 = 2112;
              uint64_t v51 = v26;
              _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
            }
            __int16 v29 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v19);
            (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v29);

            goto LABEL_16;
          }
          id v22 = [v20 mangledIDString];
          [v14 addObject:v22];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v41 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v23 = [v30 applyScheduler];
    uint64_t v24 = [v23 hasActiveWorkGroup];
    dispatch_time_t v25 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v24, v25);

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __77__BRCXPCRegularIPCsClient_launchSyncConsistencyChecksWithContainerIDs_reply___block_invoke_418;
    uint64_t v32[3] = &unk_1E699A868;
    v32[4] = self;
    id v33 = v13;
    +[BRCSyncConsistencyReport generateReportWithSession:v30 mangledIDs:v14 completion:v32];

LABEL_16:
  }
  __brc_leave_section(v40);
}

void __77__BRCXPCRegularIPCsClient_launchSyncConsistencyChecksWithContainerIDs_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __77__BRCXPCRegularIPCsClient_launchSyncConsistencyChecksWithContainerIDs_reply___block_invoke_418(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [v3 telemetryErrorEvents];
  uint64_t v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [v3 telemetryWarningEvents];
  __int16 v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v10 = [v3 telemetryErrorEvents];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = [*(id *)(*((void *)&v32 + 1) + 8 * v14) data];
        [v6 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v47 count:16];
    }
    while (v12);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v16 = objc_msgSend(v3, "telemetryWarningEvents", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v28 + 1) + 8 * v20) data];
        [v9 addObject:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v46 count:16];
    }
    while (v18);
  }

  id v22 = brc_bread_crumbs();
  id v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = *(void *)(a1 + 32);
    dispatch_time_t v25 = [v3 lastError];
    *(_DWORD *)buf = 138413314;
    uint64_t v37 = v24;
    __int16 v38 = 2112;
    id v39 = v6;
    __int16 v40 = 2112;
    __int16 v41 = v9;
    __int16 v42 = 2112;
    long long v43 = v25;
    __int16 v44 = 2112;
    id v45 = v22;
    _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
  }
  uint64_t v26 = *(void *)(a1 + 40);
  __int16 v27 = [v3 lastError];
  (*(void (**)(uint64_t, void *, void *, void *))(v26 + 16))(v26, v6, v9, v27);
}

- (void)pauseSyncConsistencyWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient pauseSyncConsistencyWithReply:]", 2846, v18);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    id v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2080;
    uint64_t v26 = "-[BRCXPCRegularIPCsClient pauseSyncConsistencyWithReply:]";
    __int16 v27 = 2112;
    long long v28 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v10 = (void *)*MEMORY[0x1E4F59318];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__BRCXPCRegularIPCsClient_pauseSyncConsistencyWithReply___block_invoke;
  v16[3] = &unk_1E69957B0;
  void v16[4] = self;
  id v11 = v4;
  id v17 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v16);

  if (v10)
  {
    uint64_t v12 = BRDiskCheckerServiceConnection();
    uint64_t v13 = [v12 remoteObjectProxy];
    [v13 pauseTreeConsistencyCheck];

    uint64_t v14 = brc_bread_crumbs();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = self;
      __int16 v21 = 2112;
      id v22 = 0;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
  __brc_leave_section(v18);
}

void __57__BRCXPCRegularIPCsClient_pauseSyncConsistencyWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resumeSyncConsistencyWithReply:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v21, 0, sizeof(v21));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient resumeSyncConsistencyWithReply:]", 2858, v21);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v21[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v23 = v7;
    __int16 v24 = 2112;
    __int16 v25 = self;
    __int16 v26 = 2112;
    __int16 v27 = v9;
    __int16 v28 = 2080;
    uint64_t v29 = "-[BRCXPCRegularIPCsClient resumeSyncConsistencyWithReply:]";
    __int16 v30 = 2112;
    long long v31 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v10 = (void *)*MEMORY[0x1E4F59318];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__BRCXPCRegularIPCsClient_resumeSyncConsistencyWithReply___block_invoke;
  uint64_t v19[3] = &unk_1E69957B0;
  void v19[4] = self;
  id v11 = v4;
  id v20 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v19);

  if (v10)
  {
    uint64_t v12 = BRDiskCheckerServiceConnection();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__BRCXPCRegularIPCsClient_resumeSyncConsistencyWithReply___block_invoke_420;
    uint64_t v17[3] = &unk_1E69957B0;
    v17[4] = self;
    id v13 = v11;
    id v18 = v13;
    uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__BRCXPCRegularIPCsClient_resumeSyncConsistencyWithReply___block_invoke_421;
    v15[3] = &unk_1E69957B0;
    v15[4] = self;
    id v16 = v13;
    [v14 resumeTreeConsistencyCheckWithReply:v15];
  }
  __brc_leave_section(v21);
}

void __58__BRCXPCRegularIPCsClient_resumeSyncConsistencyWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__BRCXPCRegularIPCsClient_resumeSyncConsistencyWithReply___block_invoke_420(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__BRCXPCRegularIPCsClient_resumeSyncConsistencyWithReply___block_invoke_421(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancelTreeConsistencyCheckWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient cancelTreeConsistencyCheckWithReply:]", 2872, v18);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    id v22 = self;
    __int16 v23 = 2112;
    __int16 v24 = v9;
    __int16 v25 = 2080;
    __int16 v26 = "-[BRCXPCRegularIPCsClient cancelTreeConsistencyCheckWithReply:]";
    __int16 v27 = 2112;
    __int16 v28 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v10 = (void *)*MEMORY[0x1E4F59318];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__BRCXPCRegularIPCsClient_cancelTreeConsistencyCheckWithReply___block_invoke;
  v16[3] = &unk_1E69957B0;
  void v16[4] = self;
  id v11 = v4;
  id v17 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v16);

  if (v10)
  {
    uint64_t v12 = BRDiskCheckerServiceConnection();
    uint64_t v13 = [v12 remoteObjectProxy];
    [v13 cancelTreeConsistencyCheck];

    uint64_t v14 = brc_bread_crumbs();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = self;
      __int16 v21 = 2112;
      id v22 = 0;
      __int16 v23 = 2112;
      __int16 v24 = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
  __brc_leave_section(v18);
}

void __63__BRCXPCRegularIPCsClient_cancelTreeConsistencyCheckWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)waitForAccountToLoadWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[BRCAccountsManager sharedManager];
  uint64_t v6 = [v5 accountsLoadingBarrier];
  [v6 waitForBarrier];

  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient waitForAccountToLoadWithReply:]", 2904, v18);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v18[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v20 = (BRCXPCRegularIPCsClient *)v9;
    __int16 v21 = 2112;
    id v22 = self;
    __int16 v23 = 2112;
    __int16 v24 = v11;
    __int16 v25 = 2080;
    __int16 v26 = "-[BRCXPCRegularIPCsClient waitForAccountToLoadWithReply:]";
    __int16 v27 = 2112;
    __int16 v28 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__BRCXPCRegularIPCsClient_waitForAccountToLoadWithReply___block_invoke;
  v16[3] = &unk_1E69957B0;
  void v16[4] = self;
  id v12 = v4;
  id v17 = v12;
  int v13 = _brc_ipc_check_logged_status(self, 1, v16);

  if (v13)
  {
    uint64_t v14 = brc_bread_crumbs();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = self;
      __int16 v21 = 2112;
      id v22 = 0;
      __int16 v23 = 2112;
      __int16 v24 = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
  __brc_leave_section(v18);
}

void __57__BRCXPCRegularIPCsClient_waitForAccountToLoadWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)validateCloudDocsSupported:(BOOL)a3 withReply:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, id))a4;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient validateCloudDocsSupported:withReply:]", 2911, v15);
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v15[0];
    qos_class_t v9 = qos_class_self();
    id v10 = BRCPrettyPrintEnumWithContext(v9, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v17 = (BRCXPCRegularIPCsClient *)v8;
    __int16 v18 = 2112;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    __int16 v22 = 2080;
    __int16 v23 = "-[BRCXPCRegularIPCsClient validateCloudDocsSupported:withReply:]";
    __int16 v24 = 2112;
    __int16 v25 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v14 = 0;
  +[BRCSystemSupportAnalyzer isCloudDocsSupportedWithError:&v14];
  __int16 v11 = (BRCXPCRegularIPCsClient *)v14;
  id v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = self;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    __int16 v21 = v12;
    _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }

  v5[2](v5, v11);
  __brc_leave_section(v15);
}

- (void)createAccountWithACAccountID:(id)a3 dsid:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v32, 0, sizeof(v32));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient createAccountWithACAccountID:dsid:reply:]", 2952, v32);
  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v32[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    long long v34 = (BRCXPCRegularIPCsClient *)v13;
    __int16 v35 = 2112;
    long long v36 = self;
    __int16 v37 = 2112;
    __int16 v38 = v15;
    __int16 v39 = 2080;
    __int16 v40 = "-[BRCXPCRegularIPCsClient createAccountWithACAccountID:dsid:reply:]";
    __int16 v41 = 2112;
    __int16 v42 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  void v30[2] = __67__BRCXPCRegularIPCsClient_createAccountWithACAccountID_dsid_reply___block_invoke;
  uint64_t v30[3] = &unk_1E69957B0;
  void v30[4] = self;
  id v16 = v10;
  id v31 = v16;
  int v17 = _brc_ipc_check_account_access(self, -1, v30);

  if (v17)
  {
    __int16 v18 = +[BRCAccountsManager sharedManager];
    if ([v18 waitForInitialAccountLoadingSynchronouslyIfPossible])
    {
      uint64_t v19 = brc_bread_crumbs();
      __int16 v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[BRCXPCRegularIPCsClient createAccountWithACAccountID:dsid:reply:]();
      }

      if ((int)BRGetMigrationStatusForDSID() > 1)
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __67__BRCXPCRegularIPCsClient_createAccountWithACAccountID_dsid_reply___block_invoke_425;
        uint64_t v28[3] = &unk_1E699A890;
        v28[4] = self;
        id v29 = v16;
        [v18 createSessionWithACAccountID:v8 dsid:v9 completionHandler:v28];
      }
      else
      {
        __int16 v21 = brc_bread_crumbs();
        __int16 v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          -[BRCXPCRegularIPCsClient createAccountWithACAccountID:dsid:reply:]();
        }

        __int16 v23 = brc_bread_crumbs();
        __int16 v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"accountID", v9);
          __int16 v25 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          long long v34 = self;
          __int16 v35 = 2112;
          long long v36 = v25;
          __int16 v37 = 2112;
          __int16 v38 = v23;
          _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
        uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"accountID", v9);
        (*((void (**)(id, void *))v16 + 2))(v16, v26);
      }
    }
    else
    {
      __int16 v27 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorBuddyFlowNeedsToRun");
      (*((void (**)(id, void *))v16 + 2))(v16, v27);
    }
  }
  __brc_leave_section(v32);
}

void __67__BRCXPCRegularIPCsClient_createAccountWithACAccountID_dsid_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __67__BRCXPCRegularIPCsClient_createAccountWithACAccountID_dsid_reply___block_invoke_425(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
      __67__BRCXPCRegularIPCsClient_createAccountWithACAccountID_dsid_reply___block_invoke_425_cold_1();
    }
  }
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138412802;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_unregisterPrematurely
{
  id v2 = self;
  objc_sync_enter(v2);
  if (*((unsigned char *)&v2->super + 32)) {
    id v4 = 0;
  }
  else {
    id v4 = v2->super.__session;
  }
  session = v2->super.__session;
  v2->super.__session = 0;

  objc_sync_exit(v2);
  [(BRCAccountSession *)v4 unregisterClient:v2];
}

- (void)logoutAccountWithACAccountID:(id)a3 reply:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (BRCXPCRegularIPCsClient *)a3;
  id v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient logoutAccountWithACAccountID:reply:]", 3003, v27);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v27[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v29 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v30 = 2112;
    id v31 = self;
    __int16 v32 = 2112;
    long long v33 = v12;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient logoutAccountWithACAccountID:reply:]";
    __int16 v36 = 2112;
    __int16 v37 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __62__BRCXPCRegularIPCsClient_logoutAccountWithACAccountID_reply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v13 = v7;
  id v26 = v13;
  int v14 = _brc_ipc_check_account_access(self, 3, v25);

  if (v14)
  {
    [(BRCXPCRegularIPCsClient *)self _unregisterPrematurely];
    brc_bread_crumbs();
    __int16 v15 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v6;
      __int16 v30 = 2112;
      id v31 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] Requested to logout of account %@%@", buf, 0x16u);
    }

    uint64_t v17 = +[BRCAccountsManager sharedManager];
    char v18 = [v17 destroySessionWithACAccountID:v6];

    uint64_t v19 = brc_bread_crumbs();
    __int16 v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient logoutAccountWithACAccountID:reply:](v18);
    }

    __int16 v21 = brc_bread_crumbs();
    __int16 v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      if (v18)
      {
        __int16 v23 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 15, @"Failed to destroy account");
        __int16 v23 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412802;
      id v29 = self;
      __int16 v30 = 2112;
      id v31 = v23;
      __int16 v32 = 2112;
      long long v33 = v21;
      _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      if ((v18 & 1) == 0) {
    }
      }
    if (v18)
    {
      __int16 v24 = 0;
    }
    else
    {
      __int16 v24 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 15, @"Failed to destroy account");
    }
    (*((void (**)(id, void *))v13 + 2))(v13, v24);
    if ((v18 & 1) == 0) {
  }
    }
  __brc_leave_section(v27);
}

void __62__BRCXPCRegularIPCsClient_logoutAccountWithACAccountID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateAccountDisplayName:(id)a3 reply:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient updateAccountDisplayName:reply:]", 3025, v22);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v22[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = v10;
    __int16 v25 = 2112;
    id v26 = self;
    __int16 v27 = 2112;
    __int16 v28 = v12;
    __int16 v29 = 2080;
    __int16 v30 = "-[BRCXPCRegularIPCsClient updateAccountDisplayName:reply:]";
    __int16 v31 = 2112;
    __int16 v32 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__BRCXPCRegularIPCsClient_updateAccountDisplayName_reply___block_invoke;
  uint64_t v20[3] = &unk_1E69957B0;
  void v20[4] = self;
  id v13 = v7;
  id v21 = v13;
  int v14 = _brc_ipc_check_account_access(self, 1, v20);

  if (v14)
  {
    brc_bread_crumbs();
    __int16 v15 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = (uint64_t)v6;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] Requested to update display name of account %@%@", buf, 0x16u);
    }

    uint64_t v17 = +[BRCAccountsManager sharedManager];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__BRCXPCRegularIPCsClient_updateAccountDisplayName_reply___block_invoke_436;
    uint64_t v18[3] = &unk_1E69957B0;
    void v18[4] = self;
    id v19 = v13;
    [v17 updateAccountDisplayName:v6 completionHandler:v18];
  }
  __brc_leave_section(v22);
}

void __58__BRCXPCRegularIPCsClient_updateAccountDisplayName_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__BRCXPCRegularIPCsClient_updateAccountDisplayName_reply___block_invoke_436(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __58__BRCXPCRegularIPCsClient_updateAccountDisplayName_reply___block_invoke_436_cold_1();
    }
  }
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)userVerifiedTermsWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient userVerifiedTermsWithReply:]", 3040, v18);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    int v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    __int16 v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2080;
    id v26 = "-[BRCXPCRegularIPCsClient userVerifiedTermsWithReply:]";
    __int16 v27 = 2112;
    __int16 v28 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__BRCXPCRegularIPCsClient_userVerifiedTermsWithReply___block_invoke;
  v16[3] = &unk_1E69957B0;
  void v16[4] = self;
  id v10 = v4;
  id v17 = v10;
  int v11 = _brc_ipc_check_account_access(self, 1, v16);

  if (v11)
  {
    id v12 = [(BRCXPCClient *)self session];
    __int16 v13 = [v12 fsUploader];
    [v13 userVerifiedTerms];

    int v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v20 = self;
      __int16 v21 = 2112;
      __int16 v22 = 0;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  __brc_leave_section(v18);
}

void __54__BRCXPCRegularIPCsClient_userVerifiedTermsWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)invalidateAccountCacheWithReply:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient invalidateAccountCacheWithReply:]", 3058, v17);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v17[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v19 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v20 = 2112;
    __int16 v21 = self;
    __int16 v22 = 2112;
    __int16 v23 = v9;
    __int16 v24 = 2080;
    __int16 v25 = "-[BRCXPCRegularIPCsClient invalidateAccountCacheWithReply:]";
    __int16 v26 = 2112;
    __int16 v27 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__BRCXPCRegularIPCsClient_invalidateAccountCacheWithReply___block_invoke;
  uint64_t v15[3] = &unk_1E69957B0;
  v15[4] = self;
  id v10 = v4;
  id v16 = v10;
  int v11 = _brc_ipc_check_account_access(self, 0, v15);

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F179C8] defaultStore];
    [v12 invalidateAccountForPersonaCache];

    uint64_t v13 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = self;
      __int16 v20 = 2112;
      __int16 v21 = 0;
      __int16 v22 = 2112;
      __int16 v23 = v13;
      _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  __brc_leave_section(v17);
}

void __59__BRCXPCRegularIPCsClient_invalidateAccountCacheWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)jetsamCloudDocsAppsWithReply:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient jetsamCloudDocsAppsWithReply:]", 3069, v22);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v22[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v24 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v25 = 2112;
    __int16 v26 = self;
    __int16 v27 = 2112;
    uint64_t v28 = v9;
    __int16 v29 = 2080;
    __int16 v30 = "-[BRCXPCRegularIPCsClient jetsamCloudDocsAppsWithReply:]";
    __int16 v31 = 2112;
    __int16 v32 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __56__BRCXPCRegularIPCsClient_jetsamCloudDocsAppsWithReply___block_invoke;
  uint64_t v20[3] = &unk_1E69957B0;
  void v20[4] = self;
  id v10 = v4;
  id v21 = v10;
  int v11 = _brc_ipc_check_account_access(self, 0, v20);

  if (v11)
  {
    id v12 = [(BRCXPCClient *)self session];
    uint64_t v13 = [v12 accountHandler];
    int v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v16 = +[BRCAccountsManager sharedManager];
      id v15 = [v16 accountHandlerForCurrentPersona];
    }
    [v15 jetsamCloudDocsApps];
    id v17 = [MEMORY[0x1E4F179C8] defaultStore];
    [v17 invalidateAccountForPersonaCache];

    char v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v24 = self;
      __int16 v25 = 2112;
      __int16 v26 = 0;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  __brc_leave_section(v22);
}

void __56__BRCXPCRegularIPCsClient_jetsamCloudDocsAppsWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getContainersNeedingUpload:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainersNeedingUpload:]", 3082, v24);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v24[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    __int16 v30 = v9;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCXPCRegularIPCsClient getContainersNeedingUpload:]";
    __int16 v33 = 2112;
    __int16 v34 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke;
  uint64_t v22[3] = &unk_1E69957B0;
  uint8_t v22[4] = self;
  id v10 = v4;
  id v23 = v10;
  int v11 = _brc_ipc_check_account_access(self, 1, v22);

  if (v11)
  {
    id v12 = [(BRCXPCClient *)self session];
    tracker = self->super._tracker;
    int v14 = [v12 clientTruthWorkloop];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke_437;
    uint64_t v18[3] = &unk_1E69946C8;
    id v15 = v12;
    id v19 = v15;
    __int16 v20 = self;
    id v21 = v10;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke_438;
    v16[3] = &unk_1E6994600;
    void v16[4] = self;
    id v17 = v21;
    brc_task_tracker_async_with_logs(tracker, v14, v18, v16);
  }
  __brc_leave_section(v24);
}

void __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke_437(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v3 = (void *)a1[4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke_2;
  v8[3] = &unk_1E6994388;
  id v4 = v2;
  id v9 = v4;
  [v3 enumerateAppLibraries:v8];
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = a1[5];
    *(_DWORD *)buf = 138413058;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 defaultClientZone];
  char v5 = [v4 isSyncBlockedBecauseAppNotInstalled];

  if ((v5 & 1) == 0 && [v3 hasLocalChanges])
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v3 containerMetadata];
    [v6 addObject:v7];
  }
  return 1;
}

void __54__BRCXPCRegularIPCsClient_getContainersNeedingUpload___block_invoke_438(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 reply:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a6;
  memset(v32, 0, sizeof(v32));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient setMigrationStatus:forDSID:shouldUpdateAccount:reply:]", 3105, v32);
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v32[0];
    qos_class_t v13 = qos_class_self();
    __int16 v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v34 = (BRCXPCRegularIPCsClient *)v12;
    __int16 v35 = 2112;
    __int16 v36 = self;
    __int16 v37 = 2112;
    uint64_t v38 = v14;
    __int16 v39 = 2080;
    __int16 v40 = "-[BRCXPCRegularIPCsClient setMigrationStatus:forDSID:shouldUpdateAccount:reply:]";
    __int16 v41 = 2112;
    __int16 v42 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  void v30[2] = __80__BRCXPCRegularIPCsClient_setMigrationStatus_forDSID_shouldUpdateAccount_reply___block_invoke;
  uint64_t v30[3] = &unk_1E69957B0;
  void v30[4] = self;
  id v15 = v9;
  id v31 = v15;
  int v16 = _brc_ipc_check_account_access(self, 0, v30);

  if (v16)
  {
    id v17 = +[BRCAccountsManager sharedManager];
    uint64_t v18 = [MEMORY[0x1E4F179C8] defaultStore];
    id v19 = objc_msgSend(v18, "br_appleAccountWithPersonID:", v8);

    __int16 v20 = [v19 identifier];
    if (v20)
    {
      id v21 = objc_msgSend(v19, "br_personaIdentifier");
      id v29 = v15;
      id v26 = v17;
      id v27 = v19;
      id v28 = v8;
      BRPerformWithPersonaAndError();
    }
    else
    {
      __int16 v22 = brc_bread_crumbs();
      id v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
        __int16 v24 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        __int16 v34 = self;
        __int16 v35 = 2112;
        __int16 v36 = v24;
        __int16 v37 = 2112;
        uint64_t v38 = v22;
        _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      __int16 v25 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
      (*((void (**)(id, void *))v15 + 2))(v15, v25);
    }
  }
  __brc_leave_section(v32);
}

void __80__BRCXPCRegularIPCsClient_setMigrationStatus_forDSID_shouldUpdateAccount_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  char v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__BRCXPCRegularIPCsClient_setMigrationStatus_forDSID_shouldUpdateAccount_reply___block_invoke_439(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    char v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v6;
      __int16 v21 = 2112;
      id v22 = v3;
      __int16 v23 = 2112;
      __int16 v24 = v4;
      _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    int v7 = [*(id *)(a1 + 40) getOrCreateAccountHandlerForACAccount:*(void *)(a1 + 48)];
    if (v7)
    {
      uint64_t v8 = *(char *)(a1 + 72);
      uint64_t v9 = *(unsigned __int8 *)(a1 + 73);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80__BRCXPCRegularIPCsClient_setMigrationStatus_forDSID_shouldUpdateAccount_reply___block_invoke_440;
      uint64_t v17[3] = &unk_1E6994600;
      v17[4] = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 56);
      id v18 = *(id *)(a1 + 64);
      [v7 setMigrationStatus:v8 forDSID:v10 shouldUpdateAccount:v9 completion:v17];
    }
    else
    {
      __int16 v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        __int16 v14 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
        *(_DWORD *)buf = 138412802;
        uint64_t v20 = v13;
        __int16 v21 = 2112;
        id v22 = v14;
        __int16 v23 = 2112;
        __int16 v24 = v11;
        _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      uint64_t v15 = *(void *)(a1 + 64);
      int v16 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
    }
  }
}

uint64_t __80__BRCXPCRegularIPCsClient_setMigrationStatus_forDSID_shouldUpdateAccount_reply___block_invoke_440(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    __int16 v11 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getSyncState:(unint64_t)a3 reply:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  memset(v21, 0, sizeof(v21));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getSyncState:reply:]", 3135, v21);
  uint64_t v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v21[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v23 = v9;
    __int16 v24 = 2112;
    uint64_t v25 = self;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2080;
    id v29 = "-[BRCXPCRegularIPCsClient getSyncState:reply:]";
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__BRCXPCRegularIPCsClient_getSyncState_reply___block_invoke;
  uint64_t v19[3] = &unk_1E69957B0;
  void v19[4] = self;
  id v12 = v6;
  id v20 = v12;
  int v13 = _brc_ipc_check_entitlement_and_logged_status(self, 1, @"com.apple.fileprovider.acl-read", v19);

  if (v13)
  {
    __int16 v14 = [(BRCXPCClient *)self session];
    uint64_t v15 = [v14 readOnlyWorkloop];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46__BRCXPCRegularIPCsClient_getSyncState_reply___block_invoke_444;
    v16[3] = &unk_1E6997628;
    void v16[4] = self;
    unint64_t v18 = a3;
    id v17 = v12;
    dispatch_async(v15, v16);
  }
  __brc_leave_section(v21);
}

void __46__BRCXPCRegularIPCsClient_getSyncState_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  char v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2048;
    uint64_t v10 = 1;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    __int16 v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%lu, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __46__BRCXPCRegularIPCsClient_getSyncState_reply___block_invoke_444(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 readOnlyDB];

  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = v4 & 0xA;
  if ((v4 & 0xA) != 0)
  {
    if (v5 == 10)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4FBA908];
      int v7 = "(3, 4)";
      uint64_t v8 = 6;
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x1E4FBA908];
      if ((v4 & 8) != 0) {
        int v7 = "(3)";
      }
      else {
        int v7 = "(4)";
      }
      uint64_t v8 = 3;
    }
    __int16 v9 = [v6 rawInjection:v7 length:v8];
    uint64_t v10 = (void *)[v3 fetch:@"SELECT DISTINCT item_localsyncupstate,zone_rowid FROM client_items WHERE item_localsyncupstate IN %@       AND NOT item_id_is_documents(item_id)       AND item_scope = 2", v9];
    __int16 v11 = [v3 lastError];

    if (v11)
    {
      id v12 = brc_bread_crumbs();
      __int16 v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = [v3 lastError];
        *(_DWORD *)buf = 138413058;
        uint64_t v24 = v14;
        __int16 v25 = 2048;
        uint64_t v26 = 1;
        __int16 v27 = 2112;
        __int16 v28 = v15;
        __int16 v29 = 2112;
        __int16 v30 = v12;
        _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%lu, %@)%@", buf, 0x2Au);
      }
      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = [v3 lastError];
      (*(void (**)(uint64_t, uint64_t, void *))(v16 + 16))(v16, 1, v17);
    }
    uint64_t v5 = 0;
    if ([v10 next])
    {
      do
      {
        unsigned int v18 = [v10 unsignedIntAtIndex:0];
        uint64_t v19 = v5 | 8;
        if ((v18 & 3) == 0) {
          uint64_t v19 = v5;
        }
        uint64_t v5 = v19 | (v18 >> 1) & 2;
      }
      while (([v10 next] & 1) != 0);
    }
  }
  id v20 = brc_bread_crumbs();
  __int16 v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v24 = v22;
    __int16 v25 = 2048;
    uint64_t v26 = v5;
    __int16 v27 = 2112;
    __int16 v28 = 0;
    __int16 v29 = 2112;
    __int16 v30 = v20;
    _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%lu, %@)%@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resolveFileObjectIDsToContentRecordIDsForThumbnails:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v28, 0, sizeof(v28));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient resolveFileObjectIDsToContentRecordIDsForThumbnails:reply:]", 3233, v28);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v28[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v30 = v10;
    __int16 v31 = 2112;
    uint64_t v32 = self;
    __int16 v33 = 2112;
    __int16 v34 = v12;
    __int16 v35 = 2080;
    __int16 v36 = "-[BRCXPCRegularIPCsClient resolveFileObjectIDsToContentRecordIDsForThumbnails:reply:]";
    __int16 v37 = 2112;
    uint64_t v38 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __85__BRCXPCRegularIPCsClient_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply___block_invoke;
  uint64_t v26[3] = &unk_1E69957B0;
  void v26[4] = self;
  id v13 = v7;
  id v27 = v13;
  int v14 = _brc_ipc_check_applibrary_proxy(self, 1, v26);

  if (v14)
  {
    uint64_t v15 = [(BRCXPCClient *)self session];
    tracker = self->super._tracker;
    id v17 = [v15 readOnlyWorkloop];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __85__BRCXPCRegularIPCsClient_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply___block_invoke_452;
    uint64_t v21[3] = &unk_1E6993D18;
    id v22 = v6;
    id v18 = v15;
    id v23 = v18;
    uint64_t v24 = self;
    id v25 = v13;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__BRCXPCRegularIPCsClient_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply___block_invoke_453;
    uint64_t v19[3] = &unk_1E6994600;
    void v19[4] = self;
    id v20 = v25;
    brc_task_tracker_async_with_logs(tracker, v17, v21, v19);
  }
  __brc_leave_section(v28);
}

void __85__BRCXPCRegularIPCsClient_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138414082;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    uint64_t v18 = 0;
    __int16 v19 = 2112;
    id v20 = v3;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@, %@)%@", (uint8_t *)&v7, 0x52u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __85__BRCXPCRegularIPCsClient_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply___block_invoke_452(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  __int16 v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v3 = (void *)a1;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v49 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v9 type] != 2)
        {
          __int16 v17 = brc_bread_crumbs();
          uint64_t v18 = brc_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v34 = v17;
            _os_log_fault_impl(&dword_1D353B000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: asked the content record ID of a non-document%@", buf, 0xCu);
          }
          goto LABEL_12;
        }
        uint64_t v10 = (void *)v3[5];
        __int16 v11 = [v10 readOnlyDB];
        uint64_t v12 = [v10 itemByFileObjectID:v9 db:v11];
        __int16 v13 = [v12 asDocument];

        if (!v13)
        {
          __int16 v17 = brc_bread_crumbs();
          uint64_t v18 = brc_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v34 = v9;
            __int16 v35 = 2112;
            __int16 v36 = v17;
            _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] No document found for %@%@", buf, 0x16u);
          }
LABEL_12:

          [v2 addObject:v9];
          continue;
        }
        uint64_t v14 = [v13 currentVersion];
        uint64_t v15 = [v14 thumbnailSize];

        if (v15 < 1)
        {
          __int16 v19 = [v13 currentVersion];
          int v20 = [v19 isSmallAndMostRecentClientsGenerateThumbnails];

          if (v20) {
            __int16 v21 = v27;
          }
          else {
            __int16 v21 = v26;
          }
          [v21 addObject:v9];
        }
        else
        {
          uint64_t v16 = [v13 documentRecordID];
          [v28 setObject:v16 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v49 count:16];
    }
    while (v6);
  }

  id v22 = brc_bread_crumbs();
  uint64_t v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = (void *)v3[6];
    *(_DWORD *)buf = 138414082;
    __int16 v34 = v24;
    __int16 v35 = 2112;
    __int16 v36 = v28;
    __int16 v37 = 2112;
    uint64_t v38 = v27;
    __int16 v39 = 2112;
    id v40 = v26;
    __int16 v41 = 2112;
    id v42 = v2;
    __int16 v43 = 2112;
    __int16 v44 = v25;
    __int16 v45 = 2112;
    uint64_t v46 = 0;
    __int16 v47 = 2112;
    uint64_t v48 = v22;
    _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@, %@)%@", buf, 0x52u);
  }

  (*(void (**)(void))(v3[7] + 16))();
}

void __85__BRCXPCRegularIPCsClient_resolveFileObjectIDsToContentRecordIDsForThumbnails_reply___block_invoke_453(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138414082;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    uint64_t v19 = 0;
    __int16 v20 = 2112;
    __int16 v21 = v5;
    __int16 v22 = 2112;
    uint64_t v23 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@, %@)%@", (uint8_t *)&v8, 0x52u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, 0, 0, v7);
}

- (void)resolveBookmarkDataToURL:(id)a3 reply:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v45, 0, sizeof(v45));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient resolveBookmarkDataToURL:reply:]", 3287, v45);
  int v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v45[0];
    qos_class_t v11 = qos_class_self();
    __int16 v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v47 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v48 = 2112;
    long long v49 = self;
    __int16 v50 = 2112;
    id v51 = v12;
    __int16 v52 = 2080;
    id v53 = "-[BRCXPCRegularIPCsClient resolveBookmarkDataToURL:reply:]";
    __int16 v54 = 2112;
    id v55 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke;
  uint64_t v43[3] = &unk_1E69957B0;
  void v43[4] = self;
  id v13 = v7;
  id v44 = v13;
  int v14 = _brc_ipc_check_logged_status(self, 1, v43);

  if (v14)
  {
    uint64_t v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient resolveBookmarkDataToURL:reply:]();
    }

    id v41 = 0;
    id v42 = 0;
    __int16 v39 = 0;
    id v40 = 0;
    uint64_t v17 = [(BRCXPCClient *)self session];
    id v38 = 0;
    char v18 = [v6 parseBookmarkDataWithAccountSession:v17 docID:&v39 itemID:&v42 mangledID:&v41 unsaltedBookmarkData:&v40 error:&v38];
    id v19 = v38;
    if (v18)
    {
      __int16 v20 = brc_bread_crumbs();
      __int16 v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413314;
        __int16 v47 = v39;
        __int16 v48 = 2112;
        long long v49 = v42;
        __int16 v50 = 2112;
        id v51 = v41;
        __int16 v52 = 2112;
        id v53 = v40;
        __int16 v54 = 2112;
        id v55 = v20;
        _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] looking for docID:%@ itemID:%@ mangledID:%@ unsaltedBookmarkData:%@%@", buf, 0x34u);
      }

      tracker = self->super._tracker;
      uint64_t v23 = [v17 clientTruthWorkloop];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      void v30[2] = __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_454;
      uint64_t v30[3] = &unk_1E699A908;
      id v31 = v17;
      id v32 = v41;
      __int16 v33 = self;
      __int16 v34 = v42;
      id v37 = v13;
      __int16 v35 = v39;
      __int16 v36 = v40;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_462;
      uint64_t v28[3] = &unk_1E6994600;
      v28[4] = self;
      id v29 = v37;
      brc_task_tracker_async_with_logs(tracker, v23, v30, v28);

      uint64_t v24 = v31;
    }
    else
    {
      id v25 = brc_bread_crumbs();
      id v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = objc_msgSend(v19, "brc_wrappedError");
        *(_DWORD *)buf = 138413826;
        __int16 v47 = self;
        __int16 v48 = 2112;
        long long v49 = 0;
        __int16 v50 = 2112;
        id v51 = 0;
        __int16 v52 = 2112;
        id v53 = 0;
        __int16 v54 = 2112;
        id v55 = 0;
        __int16 v56 = 2112;
        __int16 v57 = v27;
        __int16 v58 = 2112;
        long long v59 = v25;
        _os_log_impl(&dword_1D353B000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", buf, 0x48u);
      }
      uint64_t v24 = objc_msgSend(v19, "brc_wrappedError");
      (*((void (**)(id, void, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, 0, v24);
    }
  }
  __brc_leave_section(v45);
}

void __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413826;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    __int16 v20 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v7, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_454(uint64_t a1)
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 40);
  uint64_t v61 = [*(id *)(a1 + 32) clientZoneByMangledID:*(void *)(a1 + 40)];
  uint64_t v86 = 0;
  long long v87 = &v86;
  uint64_t v88 = 0x3032000000;
  id v89 = __Block_byref_object_copy__48;
  uint64_t v90 = __Block_byref_object_dispose__48;
  if ([*v2 isPrivate])
  {
    id v3 = [*(id *)(a1 + 32) appLibraryByMangledID:*(void *)(a1 + 40)];
  }
  else
  {
    id v3 = 0;
  }
  id v91 = v3;
  uint64_t v80 = 0;
  long long v81 = &v80;
  uint64_t v82 = 0x3032000000;
  long long v83 = __Block_byref_object_copy__48;
  __int16 v84 = __Block_byref_object_dispose__48;
  id v85 = 0;
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_2;
  v74[3] = &unk_1E699A8E0;
  id v78 = &v86;
  int8x16_t v62 = *(int8x16_t *)(a1 + 40);
  id v4 = (id)v62.i64[0];
  int8x16_t v75 = vextq_s8(v62, v62, 8uLL);
  __int16 v79 = &v80;
  id v76 = *(id *)(a1 + 56);
  id v77 = *(id *)(a1 + 80);
  long long v59 = (void (**)(void, void, void, void))MEMORY[0x1D94389C0](v74);
  uint64_t v5 = [v61 itemByItemID:*(void *)(a1 + 56)];
  uint64_t v6 = (void *)v81[5];
  v81[5] = v5;

  int v7 = (void *)v81[5];
  if (v7
    || (objc_msgSend(v61, "itemByDocumentID:", objc_msgSend(*(id *)(a1 + 64), "unsignedIntValue")),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        __int16 v9 = (void *)v81[5],
        v81[5] = v8,
        v9,
        (int v7 = (void *)v81[5]) != 0))
  {
    uint64_t v10 = [v7 appLibrary];
    __int16 v11 = (void *)v87[5];
    v87[5] = v10;
  }
  if ([*(id *)(a1 + 48) _isAppLibraryProxyEntitled])
  {
    BOOL v12 = 1;
  }
  else if (v87[5])
  {
    __int16 v13 = [*(id *)(a1 + 48) entitledAppLibraryIDs];
    uint64_t v14 = brc_bread_crumbs();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v50 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v94 = v50;
      __int16 v95 = 2112;
      v96 = v13;
      __int16 v97 = 2112;
      uint64_t v98 = (uint64_t)v14;
      _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ has access to %@%@", buf, 0x20u);
    }

    uint64_t v16 = [(id)v87[5] appLibraryID];
    char v17 = [v13 containsObject:v16];

    if (v17)
    {
      int v18 = 1;
    }
    else
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v71 = 0u;
      long long v70 = 0u;
      __int16 v19 = v13;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v70 objects:v101 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v71;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v71 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = [*(id *)(a1 + 32) appLibraryByID:*(void *)(*((void *)&v70 + 1) + 8 * i)];
            uint64_t v24 = [v23 aliasByUnsaltedBookmarkData:*(void *)(a1 + 72)];

            if (v24)
            {
              int v18 = 1;
              goto LABEL_25;
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v70 objects:v101 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
      int v18 = 0;
LABEL_25:
    }
    id v25 = brc_bread_crumbs();
    id v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v51 = *(void *)(a1 + 48);
      uint64_t v52 = [(id)v87[5] logName];
      id v53 = (void *)v52;
      __int16 v54 = "has";
      *(_DWORD *)buf = 138413058;
      uint64_t v94 = v51;
      __int16 v95 = 2080;
      if (!v18) {
        __int16 v54 = "does not have";
      }
      v96 = v54;
      __int16 v97 = 2112;
      uint64_t v98 = v52;
      __int16 v99 = 2112;
      v100 = v25;
      _os_log_debug_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ %s access to %@%@", buf, 0x2Au);
    }
    BOOL v12 = v18 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  id v27 = [BRCItemToPathLookup alloc];
  __int16 v57 = [(BRCItemToPathLookup *)v27 initWithItem:v81[5]];
  uint64_t v63 = [(BRCItemToPathLookup *)v57 byFileSystemID];
  __int16 v28 = [(id)v81[5] st];
  id v29 = [v28 logicalName];
  __int16 v58 = [v63 logicalURLWithLogicalName:v29];

  if (v12)
  {
    char v30 = 1;
  }
  else if ([(id)v81[5] isDocument])
  {
    memset(v69, 0, sizeof(v69));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient resolveBookmarkDataToURL:reply:]_block_invoke", 3420, v69);
    id v31 = brc_bread_crumbs();
    id v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      id v55 = (const char *)v81[5];
      *(_DWORD *)buf = 134218498;
      uint64_t v94 = v69[0];
      __int16 v95 = 2112;
      v96 = v55;
      __int16 v97 = 2112;
      uint64_t v98 = (uint64_t)v31;
      _os_log_debug_impl(&dword_1D353B000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx looking for reverse aliases of %@%@", buf, 0x20u);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    __int16 v33 = [(id)v81[5] asDocument];
    id obj = [v33 reverseAliasEnumerator];

    uint64_t v34 = [obj countByEnumeratingWithState:&v65 objects:v92 count:16];
    if (v34)
    {
      char v56 = 0;
      uint64_t v35 = *(void *)v66;
LABEL_35:
      uint64_t v36 = 0;
      while (1)
      {
        if (*(void *)v66 != v35) {
          objc_enumerationMutation(obj);
        }
        id v37 = *(const char **)(*((void *)&v65 + 1) + 8 * v36);
        memset(v64, 0, sizeof(v64));
        __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient resolveBookmarkDataToURL:reply:]_block_invoke", 3422, v64);
        id v38 = brc_bread_crumbs();
        __int16 v39 = brc_default_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v94 = v64[0];
          __int16 v95 = 2112;
          v96 = v37;
          __int16 v97 = 2112;
          uint64_t v98 = (uint64_t)v38;
          _os_log_debug_impl(&dword_1D353B000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx testing access to %@%@", buf, 0x20u);
        }

        id v40 = [[BRCItemToPathLookup alloc] initWithItem:v37];
        id v41 = [(BRCItemToPathLookup *)v40 byFileSystemID];
        if (![v41 resolveMustExist:1 error:0]) {
          goto LABEL_45;
        }
        id v42 = *(void **)(a1 + 48);
        __int16 v43 = [v41 physicalURL];
        id v44 = [v43 path];
        LODWORD(v42) = objc_msgSend(v42, "canAccessPath:accessKind:", objc_msgSend(v44, "fileSystemRepresentation"), 0);

        if (v42)
        {
          __int16 v45 = brc_bread_crumbs();
          uint64_t v46 = brc_default_log();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v48 = v81[5];
            long long v49 = *(const char **)(a1 + 48);
            *(_DWORD *)buf = 138413058;
            uint64_t v94 = v48;
            __int16 v95 = 2112;
            v96 = v49;
            __int16 v97 = 2112;
            uint64_t v98 = (uint64_t)v41;
            __int16 v99 = 2112;
            v100 = v45;
            _os_log_debug_impl(&dword_1D353B000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] granting access to %@, because %@ has access to %@%@", buf, 0x2Au);
          }

          int v47 = 0;
          char v56 = 1;
        }
        else
        {
LABEL_45:
          int v47 = 1;
        }

        __brc_leave_section(v64);
        if (!v47) {
          break;
        }
        if (v34 == ++v36)
        {
          uint64_t v34 = [obj countByEnumeratingWithState:&v65 objects:v92 count:16];
          if (v34) {
            goto LABEL_35;
          }
          break;
        }
      }
    }
    else
    {
      char v56 = 0;
    }

    __brc_leave_section(v69);
    char v30 = v56;
  }
  else
  {
    char v30 = 0;
  }
  ((void (**)(void, void *, void *, void))v59)[2](v59, v58, v63, v30 & 1);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);
}

void __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, char a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if ((a4 & 1) == 0)
  {
    __int16 v9 = *(void **)(a1 + 32);
    id v10 = v7;
    if (!objc_msgSend(v9, "canAccessPath:accessKind:", objc_msgSend(v10, "fileSystemRepresentation"), 0))
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        char v17 = brc_bread_crumbs();
        int v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          int v37 = 138412546;
          uint64_t v38 = v19;
          __int16 v39 = 2112;
          id v40 = v17;
          _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] resolveBookmarkDataToURL denied for %@: not entitled%@", (uint8_t *)&v37, 0x16u);
        }

        uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorPermissionError:", @"Not Entitled");
        goto LABEL_18;
      }
LABEL_15:
      uint64_t v21 = brc_bread_crumbs();
      __int16 v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        int v37 = 138412546;
        uint64_t v38 = v23;
        __int16 v39 = 2112;
        id v40 = v21;
        _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find appLibrary for id %@%@", (uint8_t *)&v37, 0x16u);
      }

      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      id v25 = [*(id *)(a1 + 40) appLibraryOrZoneName];
      uint64_t v20 = objc_msgSend(v24, "brc_errorAppLibraryNotFound:", v25);

LABEL_18:
      uint64_t v16 = 0;
      uint64_t v14 = 0;
      __int16 v15 = 0;
      goto LABEL_19;
    }
    __int16 v11 = brc_bread_crumbs();
    BOOL v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = *(void *)(a1 + 32);
      int v37 = 138412802;
      uint64_t v38 = v36;
      __int16 v39 = 2112;
      id v40 = v10;
      __int16 v41 = 2112;
      id v42 = v11;
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Client %@ has access to %@%@", (uint8_t *)&v37, 0x20u);
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    goto LABEL_15;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v13 = *MEMORY[0x1E4F14008];
    uint64_t v14 = objc_msgSend(v7, "brc_issueSandboxExtensionOfClass:error:", *MEMORY[0x1E4F14008], 0);
    if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) isFault])
    {
      __int16 v15 = [v8 physicalURL];
      uint64_t v16 = objc_msgSend(v15, "brc_issueSandboxExtensionOfClass:error:", v13, 0);
      if (v7) {
        goto LABEL_26;
      }
      goto LABEL_30;
    }
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v14 = 0;
  }
  __int16 v15 = 0;
  if (v7) {
    goto LABEL_26;
  }
LABEL_30:
  id v32 = (void *)MEMORY[0x1E4F28C58];
  __int16 v33 = [*(id *)(a1 + 48) itemIDString];
  uint64_t v20 = objc_msgSend(v32, "brc_errorItemNotFound:", v33);

  if (v20)
  {
    uint64_t v34 = brc_bread_crumbs();
    uint64_t v35 = brc_default_log();
    if (os_log_type_enabled(v35, (os_log_type_t)0x90u)) {
      __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_2_cold_1((uint64_t)v20, (uint64_t)v34, v35);
    }
  }
LABEL_19:
  if (v20)
  {
    id v26 = brc_bread_crumbs();
    id v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = *(void *)(a1 + 32);
      int v37 = 138413826;
      uint64_t v38 = v28;
      __int16 v39 = 2112;
      id v40 = 0;
      __int16 v41 = 2112;
      id v42 = 0;
      __int16 v43 = 2112;
      id v44 = 0;
      __int16 v45 = 2112;
      uint64_t v46 = 0;
      __int16 v47 = 2112;
      uint64_t v48 = v20;
      __int16 v49 = 2112;
      uint64_t v50 = v26;
      _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v37, 0x48u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_29;
  }
LABEL_26:
  id v29 = brc_bread_crumbs();
  char v30 = brc_default_log();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = *(void *)(a1 + 32);
    int v37 = 138413826;
    uint64_t v38 = v31;
    __int16 v39 = 2112;
    id v40 = v7;
    __int16 v41 = 2112;
    id v42 = v14;
    __int16 v43 = 2112;
    id v44 = v15;
    __int16 v45 = 2112;
    uint64_t v46 = v16;
    __int16 v47 = 2112;
    uint64_t v48 = 0;
    __int16 v49 = 2112;
    uint64_t v50 = v29;
    _os_log_impl(&dword_1D353B000, v30, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v37, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_29:
}

void __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_462(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413826;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v8, 0x48u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, 0, v7);
}

- (void)getApplicationStatus:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getApplicationStatus:]", 3489, v17);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v17[0];
    qos_class_t v8 = qos_class_self();
    uint64_t v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v19 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v20 = 2112;
    *(void *)uint64_t v21 = self;
    *(_WORD *)&v21[8] = 2112;
    *(void *)&v21[10] = v9;
    *(_WORD *)&v21[18] = 2080;
    *(void *)&v21[20] = "-[BRCXPCRegularIPCsClient getApplicationStatus:]";
    __int16 v22 = 2112;
    uint64_t v23 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__BRCXPCRegularIPCsClient_getApplicationStatus___block_invoke;
  uint64_t v15[3] = &unk_1E69957B0;
  v15[4] = self;
  id v10 = v4;
  id v16 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 0, v15);

  if (v11)
  {
    __int16 v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = [(BRCXPCClient *)self cloudEnabledStatus];
      *(_DWORD *)buf = 138413058;
      uint64_t v19 = self;
      __int16 v20 = 1024;
      *(_DWORD *)uint64_t v21 = v14;
      *(_WORD *)&void v21[4] = 2112;
      *(void *)&v21[6] = 0;
      *(_WORD *)&v21[14] = 2112;
      *(void *)&v21[16] = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, [(BRCXPCClient *)self cloudEnabledStatus], 0);
  }
  __brc_leave_section(v17);
}

void __48__BRCXPCRegularIPCsClient_getApplicationStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getApplicationStatusForProcess:(id *)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  memset(v23, 0, sizeof(v23));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getApplicationStatusForProcess:reply:]", 3498, v23);
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v23[0];
    qos_class_t v10 = qos_class_self();
    __int16 v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v11;
    *(_WORD *)&unsigned char buf[32] = 2080;
    *(void *)&buf[34] = "-[BRCXPCRegularIPCsClient getApplicationStatusForProcess:reply:]";
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__BRCXPCRegularIPCsClient_getApplicationStatusForProcess_reply___block_invoke;
  uint64_t v21[3] = &unk_1E69957B0;
  void v21[4] = self;
  id v12 = v6;
  id v22 = v12;
  int v13 = _brc_ipc_check_applibrary_proxy(self, 0, v21);

  if (v13)
  {
    int v14 = [BRCClientPrivilegesDescriptor alloc];
    long long v15 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a3->var0;
    *(_OWORD *)&buf[16] = v15;
    id v16 = [(BRCClientPrivilegesDescriptor *)v14 initWithAuditToken:buf];
    uint64_t v17 = [(BRCXPCClient *)self session];
    uint64_t v18 = [(BRCClientPrivilegesDescriptor *)v16 cloudEnabledStatusWithHasSession:v17 != 0];

    uint64_t v19 = brc_bread_crumbs();
    __int16 v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v18;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = 0;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v19;
      _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }

    (*((void (**)(id, uint64_t, void))v12 + 2))(v12, v18, 0);
  }
  __brc_leave_section(v23);
}

void __64__BRCXPCRegularIPCsClient_getApplicationStatusForProcess_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getLastSyncDateWithReply:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getLastSyncDateWithReply:]", 3512, v22);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v22[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v25 = 2112;
    id v26 = self;
    __int16 v27 = 2112;
    uint64_t v28 = v9;
    __int16 v29 = 2080;
    char v30 = "-[BRCXPCRegularIPCsClient getLastSyncDateWithReply:]";
    __int16 v31 = 2112;
    id v32 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__BRCXPCRegularIPCsClient_getLastSyncDateWithReply___block_invoke;
  uint64_t v20[3] = &unk_1E69957B0;
  void v20[4] = self;
  id v10 = v4;
  id v21 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 0, v20);

  if (v11)
  {
    brc_bread_crumbs();
    id v12 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = [(BRCXPCClient *)self session];
      uint64_t v15 = [v14 serverState];
      id v16 = [v15 lastSyncDownDate];
      *(_DWORD *)buf = 138413058;
      uint64_t v24 = self;
      __int16 v25 = 2112;
      id v26 = v16;
      __int16 v27 = 2112;
      uint64_t v28 = 0;
      __int16 v29 = 2112;
      char v30 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v17 = [(BRCXPCClient *)self session];
    uint64_t v18 = [v17 serverState];
    uint64_t v19 = [v18 lastSyncDownDate];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v19, 0);
  }
  __brc_leave_section(v22);
}

void __52__BRCXPCRegularIPCsClient_getLastSyncDateWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__BRCXPCRegularIPCsClient_getLocalizedLastSyncWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    int v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getContainerStatusWithID:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainerStatusWithID:reply:]", 3578, v30);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v30[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    id v32 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v33 = 2112;
    *(void *)uint64_t v34 = self;
    *(_WORD *)&v34[8] = 2112;
    *(void *)&v34[10] = v12;
    *(_WORD *)&v34[18] = 2080;
    *(void *)&v34[20] = "-[BRCXPCRegularIPCsClient getContainerStatusWithID:reply:]";
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 2112;
    uint64_t v38 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  if (v6) {
    __int16 v13 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v6];
  }
  else {
    __int16 v13 = 0;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __58__BRCXPCRegularIPCsClient_getContainerStatusWithID_reply___block_invoke;
  uint64_t v28[3] = &unk_1E69957B0;
  v28[4] = self;
  id v14 = v7;
  id v29 = v14;
  int v15 = _brc_ipc_check_applibrary_read_access(self, 1, v13, v28);

  if (v15)
  {
    id v16 = [(BRCXPCClient *)self session];
    uint64_t v17 = [v16 appLibraryByID:v6];

    if (!v17)
    {
      uint64_t v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"containerID", v6);
        *(_DWORD *)buf = 138413058;
        id v32 = self;
        __int16 v33 = 1024;
        *(_DWORD *)uint64_t v34 = 0;
        *(_WORD *)&void v34[4] = 2112;
        *(void *)&v34[6] = v20;
        *(_WORD *)&v34[14] = 2112;
        *(void *)&v34[16] = v18;
        _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
      }
      id v21 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"containerID", v6);
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v21);
    }
    id v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [v17 defaultClientZone];
      int v25 = BRContainerStatusFromSyncState([v24 syncState]);
      *(_DWORD *)buf = 138413058;
      id v32 = self;
      __int16 v33 = 1024;
      *(_DWORD *)uint64_t v34 = v25;
      *(_WORD *)&void v34[4] = 2112;
      *(void *)&v34[6] = 0;
      *(_WORD *)&v34[14] = 2112;
      *(void *)&v34[16] = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }
    id v26 = [v17 defaultClientZone];
    uint64_t v27 = BRContainerStatusFromSyncState([v26 syncState]);
    (*((void (**)(id, uint64_t, void))v14 + 2))(v14, v27, 0);
  }
  __brc_leave_section(v30);
}

void __58__BRCXPCRegularIPCsClient_getContainerStatusWithID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getContainerLastServerUpdateWithID:(id)a3 reply:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v34, 0, sizeof(v34));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getContainerLastServerUpdateWithID:reply:]", 3592, v34);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v34[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219266;
    id v36 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v37 = 2112;
    *(void *)uint64_t v38 = self;
    *(_WORD *)&v38[8] = 2112;
    *(void *)&v38[10] = v12;
    *(_WORD *)&v38[18] = 2080;
    *(void *)&v38[20] = "-[BRCXPCRegularIPCsClient getContainerLastServerUpdateWithID:reply:]";
    __int16 v39 = 2112;
    id v40 = v6;
    __int16 v41 = 2112;
    id v42 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@%@", buf, 0x3Eu);
  }
  if (v6) {
    __int16 v13 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v6];
  }
  else {
    __int16 v13 = 0;
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __68__BRCXPCRegularIPCsClient_getContainerLastServerUpdateWithID_reply___block_invoke;
  uint64_t v32[3] = &unk_1E69957B0;
  v32[4] = self;
  id v14 = v7;
  id v33 = v14;
  int v15 = _brc_ipc_check_applibrary_read_access(self, 1, v13, v32);

  if (v15)
  {
    id v16 = [(BRCXPCClient *)self session];
    __int16 v31 = [v16 appLibraryByID:v6];

    if (!v31)
    {
      uint64_t v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"containerID", v6);
        *(_DWORD *)buf = 138413058;
        id v36 = self;
        __int16 v37 = 1024;
        *(_DWORD *)uint64_t v38 = 0;
        *(_WORD *)&v38[4] = 2112;
        *(void *)&v38[6] = v19;
        *(_WORD *)&v38[14] = 2112;
        *(void *)&v38[16] = v17;
        _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
      }
      __int16 v20 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"containerID", v6);
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v20);
    }
    id v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = [v31 defaultClientZone];
      uint64_t v24 = [v23 serverZone];
      int v25 = [v24 changeState];
      id v26 = [v25 lastSyncDownDate];
      *(_DWORD *)buf = 138413058;
      id v36 = self;
      __int16 v37 = 2112;
      *(void *)uint64_t v38 = v26;
      *(_WORD *)&v38[8] = 2112;
      *(void *)&v38[10] = 0;
      *(_WORD *)&v38[18] = 2112;
      *(void *)&v38[20] = v21;
      _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v27 = [v31 defaultClientZone];
    uint64_t v28 = [v27 serverZone];
    id v29 = [v28 changeState];
    char v30 = [v29 lastSyncDownDate];
    (*((void (**)(id, void *, void))v14 + 2))(v14, v30, 0);
  }
  __brc_leave_section(v34);
}

void __68__BRCXPCRegularIPCsClient_getContainerLastServerUpdateWithID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)currentNotifRankWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient currentNotifRankWithReply:]", 3608, v18);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    id v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2080;
    id v26 = "-[BRCXPCRegularIPCsClient currentNotifRankWithReply:]";
    __int16 v27 = 2112;
    uint64_t v28 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__BRCXPCRegularIPCsClient_currentNotifRankWithReply___block_invoke;
  v16[3] = &unk_1E69957B0;
  void v16[4] = self;
  id v10 = v4;
  id v17 = v10;
  int v11 = _brc_ipc_check_applibrary_proxy(self, 1, v16);

  if (v11)
  {
    id v12 = [(BRCXPCClient *)self session];
    __int16 v13 = [v12 notificationManager];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__BRCXPCRegularIPCsClient_currentNotifRankWithReply___block_invoke_491;
    v14[3] = &unk_1E699A930;
    v14[4] = self;
    id v15 = v10;
    [v13 fetchLastFlushedRankWithReply:v14];
  }
  __brc_leave_section(v18);
}

void __53__BRCXPCRegularIPCsClient_currentNotifRankWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%llu, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __53__BRCXPCRegularIPCsClient_currentNotifRankWithReply___block_invoke_491(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138413058;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%llu, %@)%@", (uint8_t *)&v8, 0x2Au);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateItemsInFolder:(id)a3 sortOrder:(unsigned __int8)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 completion:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  memset(v44, 0, sizeof(v44));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient enumerateItemsInFolder:sortOrder:offset:limit:completion:]", 3628, v44);
  uint64_t v13 = brc_bread_crumbs();
  __int16 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    unint64_t v15 = a5;
    unint64_t v16 = a6;
    uint64_t v17 = v44[0];
    qos_class_t v18 = qos_class_self();
    uint64_t v19 = BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v46 = v17;
    __int16 v47 = 2112;
    unint64_t v48 = (unint64_t)self;
    __int16 v49 = 2112;
    unint64_t v50 = (unint64_t)v19;
    __int16 v51 = 2080;
    uint64_t v52 = "-[BRCXPCRegularIPCsClient enumerateItemsInFolder:sortOrder:offset:limit:completion:]";
    __int16 v53 = 2112;
    __int16 v54 = v13;
    _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    a6 = v16;
    a5 = v15;
  }

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke;
  uint64_t v42[3] = &unk_1E69957B0;
  void v42[4] = self;
  id v20 = v12;
  id v43 = v20;
  int v21 = _brc_ipc_check_applibrary_proxy(self, 1, v42);

  if (v21)
  {
    brc_bread_crumbs();
    id v22 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v46 = (uint64_t)v11;
      __int16 v47 = 2048;
      unint64_t v48 = a5;
      __int16 v49 = 2048;
      unint64_t v50 = a6;
      __int16 v51 = 2112;
      uint64_t v52 = v22;
      _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] enumerating items in %@ offset:%lld limit:%lld%@", buf, 0x2Au);
    }

    uint64_t v24 = [(BRCXPCClient *)self session];
    __int16 v25 = [v24 readOnlyDB];
    tracker = self->super._tracker;
    __int16 v27 = [v24 readOnlyWorkloop];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_493;
    uint64_t v33[3] = &unk_1E699A980;
    id v34 = v11;
    unint64_t v39 = a5;
    id v28 = v24;
    id v35 = v28;
    id v29 = v25;
    id v36 = v29;
    __int16 v37 = self;
    unsigned __int8 v41 = a4;
    id v38 = v20;
    unint64_t v40 = a6;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_500;
    uint64_t v31[3] = &unk_1E6994600;
    v31[4] = self;
    id v32 = v38;
    brc_task_tracker_async_with_logs(tracker, v27, v33, v31);
  }
  __brc_leave_section(v44);
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413570;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 1024;
    int v12 = 0;
    __int16 v13 = 1024;
    int v14 = 0;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    qos_class_t v18 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %ull, %d, %@)%@", (uint8_t *)&v7, 0x36u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_493(uint64_t a1)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  id v3 = *(void **)(a1 + 32);
  if (!v3)
  {
    if (*(void *)(a1 + 72)) {
      goto LABEL_8;
    }
    id v32 = [*(id *)(a1 + 40) clientState];
    id v33 = [v32 objectForKeyedSubscript:@"lastQuotaFetchDate"];

    if (!v33) {
      goto LABEL_27;
    }
    id v34 = [MEMORY[0x1E4F1C9C8] date];
    [v34 timeIntervalSinceDate:v33];
    double v36 = v35;
    __int16 v37 = +[BRCUserDefaults defaultsForMangledID:0];
    [v37 minFetchQuotaInterval];
    double v39 = v38;

    if (v36 > v39)
    {
LABEL_27:
      unint64_t v40 = brc_bread_crumbs();
      unsigned __int8 v41 = brc_default_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_493_cold_3();
      }

      id v42 = [*(id *)(a1 + 40) fsUploader];
      [v42 forceScheduleQuotaFetchForOwner:*MEMORY[0x1E4F19C08]];
    }
    id v43 = *(void **)(a1 + 40);
    uint64_t v44 = *(void *)(a1 + 48);
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_497;
    v68[3] = &unk_1E699A958;
    id v69 = v2;
    [v43 enumerateContainersWithDB:v44 handler:v68];

    id v3 = *(void **)(a1 + 32);
    if (!v3)
    {
LABEL_8:
      id v16 = [*(id *)(a1 + 40) appLibraryByID:*MEMORY[0x1E4F59418]];
      __int16 v17 = brc_bread_crumbs();
      qos_class_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_493_cold_1();
      }

      uint64_t v19 = [v16 fetchRootItemInDB:*(void *)(a1 + 48)];

      goto LABEL_12;
    }
  }
  int v4 = [v3 isDocumentID];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  if (v4)
  {
    int v7 = objc_msgSend(v6, "globalItemByDocumentID:db:", objc_msgSend(v5, "rawID"), *(void *)(a1 + 48));
    uint64_t v8 = +[BRCNotification notificationFromItem:v7 relpath:0];
    __int16 v9 = [v8 asFileProviderItem];

    if (v9)
    {
      uint64_t v10 = brc_bread_crumbs();
      __int16 v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 56);
        long long v72 = v9;
        __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
        *(_DWORD *)buf = 138413570;
        uint64_t v74 = v12;
        __int16 v75 = 2112;
        id v76 = v13;
        __int16 v77 = 2048;
        uint64_t v78 = 0;
        __int16 v79 = 1024;
        BOOL v80 = 0;
        __int16 v81 = 2112;
        uint64_t v82 = 0;
        __int16 v83 = 2112;
        __int16 v84 = v10;
        _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %llu, %d, %@)%@", buf, 0x3Au);
      }
      uint64_t v14 = *(void *)(a1 + 64);
      long long v71 = v9;
      __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
      (*(void (**)(uint64_t, void *, void, void, void))(v14 + 16))(v14, v15, 0, 0, 0);

      goto LABEL_47;
    }

    goto LABEL_33;
  }
  id v20 = [v5 folderID];
  uint64_t v19 = objc_msgSend(v6, "globalItemByFileID:db:", objc_msgSend(v20, "unsignedLongLongValue"), *(void *)(a1 + 48));

  if (!v19)
  {
LABEL_33:
    __int16 v45 = brc_bread_crumbs();
    uint64_t v46 = brc_default_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
      __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_493_cold_2();
    }

    __int16 v47 = brc_bread_crumbs();
    unint64_t v48 = brc_default_log();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      uint64_t v49 = *(void *)(a1 + 56);
      unint64_t v50 = (void *)MEMORY[0x1E4F28C58];
      __int16 v51 = [*(id *)(a1 + 32) description];
      uint64_t v52 = objc_msgSend(v50, "brc_errorItemNotFound:", v51);
      *(_DWORD *)buf = 138413570;
      uint64_t v74 = v49;
      __int16 v75 = 2112;
      id v76 = 0;
      __int16 v77 = 2048;
      uint64_t v78 = 0;
      __int16 v79 = 1024;
      BOOL v80 = 0;
      __int16 v81 = 2112;
      uint64_t v82 = v52;
      __int16 v83 = 2112;
      __int16 v84 = v47;
      _os_log_impl(&dword_1D353B000, v48, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %llu, %d, %@)%@", buf, 0x3Au);
    }
    uint64_t v53 = *(void *)(a1 + 64);
    __int16 v54 = (void *)MEMORY[0x1E4F28C58];
    int v7 = [*(id *)(a1 + 32) description];
    uint64_t v55 = objc_msgSend(v54, "brc_errorItemNotFound:", v7);
    (*(void (**)(uint64_t, void, void, void, void *))(v53 + 16))(v53, 0, 0, 0, v55);

    goto LABEL_47;
  }
LABEL_12:
  uint64_t v21 = *(void *)(a1 + 72);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v22 = [v19 appLibrary];
  uint64_t v63 = v19;
  __int16 v23 = [v19 itemGlobalID];
  uint64_t v24 = [v22 enumerateUserVisibleChildrenOfItemGlobalID:v23 sortOrder:*(unsigned __int8 *)(a1 + 88) offset:*(void *)(a1 + 72) limit:*(void *)(a1 + 80) db:*(void *)(a1 + 48)];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v65 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = +[BRCNotification notificationFromItem:*(void *)(*((void *)&v64 + 1) + 8 * i)];
        char v30 = [v29 asFileProviderItem];

        if (v30) {
          [v2 addObject:v30];
        }
      }
      v21 += v26;
      uint64_t v26 = [v24 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v26);
  }

  if (v21 - *(void *)(a1 + 72) == *(void *)(a1 + 80))
  {
    BOOL v31 = 1;
    int v7 = v63;
  }
  else
  {
    int v7 = v63;
    if ([v63 isShareAcceptationFault])
    {
      uint64_t v21 = 0;
      BOOL v31 = 1;
    }
    else
    {
      char v56 = [v63 clientZone];
      __int16 v57 = [v63 itemID];
      int v58 = [v56 serverItemTypeByItemID:v57 db:*(void *)(a1 + 48)];

      uint64_t v21 = 0;
      BOOL v31 = v58 == 9 || v58 == -1;
    }
  }
  uint64_t v60 = brc_bread_crumbs();
  uint64_t v61 = brc_default_log();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    uint64_t v62 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138413570;
    uint64_t v74 = v62;
    __int16 v75 = 2112;
    id v76 = v2;
    __int16 v77 = 2048;
    uint64_t v78 = v21;
    __int16 v79 = 1024;
    BOOL v80 = v31;
    __int16 v81 = 2112;
    uint64_t v82 = 0;
    __int16 v83 = 2112;
    __int16 v84 = v60;
    _os_log_impl(&dword_1D353B000, v61, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %llu, %d, %@)%@", buf, 0x3Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_47:
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_497(uint64_t a1, void *a2)
{
  id v3 = [a2 asFileProviderItem];
  if (v3)
  {
    int v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_500(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413570;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 1024;
    int v15 = 0;
    __int16 v16 = 2112;
    __int16 v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %llu, %d, %@)%@", (uint8_t *)&v8, 0x3Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, v7);
}

- (void)enumerateWorkingSetChangesFromChangeToken:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  memset(v37, 0, sizeof(v37));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient enumerateWorkingSetChangesFromChangeToken:limit:completion:]", 3763, v37);
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v37[0];
    qos_class_t v13 = qos_class_self();
    __int16 v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v39 = v12;
    __int16 v40 = 2112;
    unsigned __int8 v41 = self;
    __int16 v42 = 2112;
    id v43 = v14;
    __int16 v44 = 2080;
    __int16 v45 = "-[BRCXPCRegularIPCsClient enumerateWorkingSetChangesFromChangeToken:limit:completion:]";
    __int16 v46 = 2112;
    __int16 v47 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke;
  uint64_t v35[3] = &unk_1E69957B0;
  void v35[4] = self;
  id v15 = v9;
  id v36 = v15;
  int v16 = _brc_ipc_check_applibrary_proxy(self, 1, v35);

  if (v16)
  {
    memset(v34, 0, sizeof(v34));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient enumerateWorkingSetChangesFromChangeToken:limit:completion:]", 3765, v34);
    __int16 v17 = brc_bread_crumbs();
    __int16 v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = v34[0];
      qos_class_t v20 = qos_class_self();
      uint64_t v21 = BRCPrettyPrintEnumWithContext(v20, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219010;
      uint64_t v39 = v19;
      __int16 v40 = 2112;
      unsigned __int8 v41 = self;
      __int16 v42 = 2112;
      id v43 = v21;
      __int16 v44 = 2080;
      __int16 v45 = "-[BRCXPCRegularIPCsClient enumerateWorkingSetChangesFromChangeToken:limit:completion:]";
      __int16 v46 = 2112;
      __int16 v47 = v17;
      _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s enumerating working set changes%@", buf, 0x34u);
    }
    id v22 = [(BRCXPCClient *)self session];
    tracker = self->super._tracker;
    uint64_t v24 = [v22 clientTruthWorkloop];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke_501;
    uint64_t v28[3] = &unk_1E6995BD0;
    id v25 = v22;
    id v29 = v25;
    unint64_t v33 = a4;
    id v30 = v8;
    BOOL v31 = self;
    id v32 = v15;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke_503;
    uint64_t v26[3] = &unk_1E6994600;
    void v26[4] = self;
    id v27 = v32;
    brc_task_tracker_async_with_logs(tracker, v24, v28, v26);

    __brc_leave_section(v34);
  }
  __brc_leave_section(v37);
}

void __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413570;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    __int16 v18 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v7, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke_501(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recentsEnumerator];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke_2;
  v6[3] = &unk_1E699A9A8;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  v6[4] = *(void *)(a1 + 48);
  id v7 = v4;
  [v2 enumerateChangesFromChangeToken:v3 limit:v5 completion:v6];
}

void __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = 138413570;
    uint64_t v17 = v15;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v16, 0x3Eu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__BRCXPCRegularIPCsClient_enumerateWorkingSetChangesFromChangeToken_limit_completion___block_invoke_503(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413570;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    id v19 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v8, 0x3Eu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, v7);
}

- (void)_getPublishedURLForLocalItem:(id)a3 forStreaming:(BOOL)a4 requestedTTL:(unint64_t)a5 reply:(id)a6
{
  BOOL v8 = a4;
  v52[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (([v10 isDocument] & 1) == 0)
  {
    __int16 v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = 2;
LABEL_6:
    uint64_t v20 = objc_msgSend(v18, "brc_errorNoDocument:underlyingPOSIXError:", 0, v19);
    goto LABEL_8;
  }
  __int16 v12 = [v10 asDocument];
  uint64_t v13 = [v12 currentVersion];
  __int16 v14 = [v13 ckInfo];

  if (v14)
  {
    uint64_t v15 = [v10 asDocument];
    __int16 v16 = [v15 currentVersion];
    int v17 = [v16 isPackage];

    if (!v17)
    {
      uint64_t v39 = [v10 serverZone];
      __int16 v22 = [v39 mangledID];
      id v21 = +[BRCUserDefaults defaultsForMangledID:v22];

      id v23 = [v10 asDocument];
      uint64_t v24 = [v23 documentRecordID];

      id v25 = objc_alloc(MEMORY[0x1E4F1A290]);
      __int16 v40 = (void *)v24;
      v52[0] = v24;
      __int16 v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
      id v27 = (void *)[v25 initWithRecordIDs:v26];

      uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1A218], "br_publishingRequest");
      [v27 setGroup:v28];

      unint64_t v50 = @"fileContent";
      id v29 = [v10 st];
      id v30 = [v29 logicalName];
      __int16 v51 = v30;
      BOOL v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      [v27 setFileNamesByAssetFieldNames:v31];

      if (!a5) {
        a5 = [v21 publishURLTimeout];
      }
      [v27 setRequestedTTL:a5];
      id v32 = [v27 configuration];
      [v32 setDiscretionaryNetworkBehavior:0];

      unint64_t v33 = [v27 configuration];
      [v33 setAutomaticallyRetryNetworkFailures:0];

      if (v8) {
        [v27 setURLOptions:1];
      }
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __88__BRCXPCRegularIPCsClient__getPublishedURLForLocalItem_forStreaming_requestedTTL_reply___block_invoke;
      uint64_t v47[3] = &unk_1E699A9D0;
      id v34 = v11;
      id v48 = v34;
      uint64_t v49 = v27;
      [v27 setAssetPublishedBlock:v47];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __88__BRCXPCRegularIPCsClient__getPublishedURLForLocalItem_forStreaming_requestedTTL_reply___block_invoke_2;
      uint64_t v44[3] = &unk_1E699A9F8;
      id v45 = v34;
      __int16 v46 = v27;
      [v27 setPublishAssetCompletionBlock:v44];
      tracker = self->super._tracker;
      queue = self->super._queue;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __88__BRCXPCRegularIPCsClient__getPublishedURLForLocalItem_forStreaming_requestedTTL_reply___block_invoke_3;
      uint64_t v41[3] = &unk_1E6993628;
      id v42 = v39;
      id v43 = v27;
      id v37 = v27;
      id v38 = v39;
      brc_task_tracker_async_with_logs(tracker, queue, v41, 0);

      goto LABEL_15;
    }
    __int16 v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = 21;
    goto LABEL_6;
  }
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", 0);
LABEL_8:
  id v21 = (void *)v20;
  if (v20)
  {
    (*((void (**)(id, void, void, uint64_t))v11 + 2))(v11, 0, 0, v20);
LABEL_15:
  }
}

uint64_t __88__BRCXPCRegularIPCsClient__getPublishedURLForLocalItem_forStreaming_requestedTTL_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a5;
  id v9 = a4;
  id v10 = [v9 downloadURL];
  id v11 = [v9 downloadURLExpiration];

  (*(void (**)(uint64_t, void *, void *, id))(v7 + 16))(v7, v10, v11, v8);
  [*(id *)(a1 + 40) setPublishAssetCompletionBlock:0];
  __int16 v12 = *(void **)(a1 + 40);
  return [v12 setAssetPublishedBlock:0];
}

uint64_t __88__BRCXPCRegularIPCsClient__getPublishedURLForLocalItem_forStreaming_requestedTTL_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [*(id *)(a1 + 40) setPublishAssetCompletionBlock:0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setAssetPublishedBlock:0];
}

void __88__BRCXPCRegularIPCsClient__getPublishedURLForLocalItem_forStreaming_requestedTTL_reply___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) metadataSyncContext];
  [v2 addOperation:*(void *)(a1 + 40)];
}

- (void)_getiWorkPublishingInfoForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    __int16 v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", v9);
      *(_DWORD *)buf = 138413570;
      id v38 = self;
      __int16 v39 = 1024;
      int v40 = 0;
      __int16 v41 = 1024;
      int v42 = 0;
      __int16 v43 = 2112;
      uint64_t v44 = 0;
      __int16 v45 = 2112;
      __int16 v46 = v20;
      __int16 v47 = 2112;
      id v48 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", buf, 0x36u);
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", v9);
    goto LABEL_18;
  }
  if (([v8 isDocument] & 1) == 0)
  {
    __int16 v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", v9, 21);
      *(_DWORD *)buf = 138413570;
      id v38 = self;
      __int16 v39 = 1024;
      int v40 = 0;
      __int16 v41 = 1024;
      int v42 = 0;
      __int16 v43 = 2112;
      uint64_t v44 = 0;
      __int16 v45 = 2112;
      __int16 v46 = v24;
      __int16 v47 = 2112;
      id v48 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", buf, 0x36u);
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", v9, 21);
    goto LABEL_18;
  }
  if (([v8 isKnownByServer] & 1) == 0)
  {
    id v25 = brc_bread_crumbs();
    __int16 v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", v9);
      *(_DWORD *)buf = 138413570;
      id v38 = self;
      __int16 v39 = 1024;
      int v40 = 0;
      __int16 v41 = 1024;
      int v42 = 0;
      __int16 v43 = 2112;
      uint64_t v44 = 0;
      __int16 v45 = 2112;
      __int16 v46 = v27;
      __int16 v47 = 2112;
      id v48 = v25;
      _os_log_impl(&dword_1D353B000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", buf, 0x36u);
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", v9);
    goto LABEL_18;
  }
  id v11 = [v8 st];
  char v12 = [v11 iWorkShareable];

  if ((v12 & 1) == 0)
  {
    uint64_t v28 = brc_bread_crumbs();
    id v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v9);
      *(_DWORD *)buf = 138413570;
      id v38 = self;
      __int16 v39 = 1024;
      int v40 = 0;
      __int16 v41 = 1024;
      int v42 = 0;
      __int16 v43 = 2112;
      uint64_t v44 = 0;
      __int16 v45 = 2112;
      __int16 v46 = v30;
      __int16 v47 = 2112;
      id v48 = v28;
      _os_log_impl(&dword_1D353B000, v29, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", buf, 0x36u);
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v9);
LABEL_18:
    __int16 v16 = (BRCFetchiWorkSharingInfoOperation *)v21;
    (*((void (**)(id, void, void, void, uint64_t))v10 + 2))(v10, 0, 0, 0, v21);
    goto LABEL_19;
  }
  uint64_t v13 = [BRCFetchiWorkSharingInfoOperation alloc];
  __int16 v14 = [v8 asDocument];
  uint64_t v15 = [(BRCXPCClient *)self session];
  __int16 v16 = [(BRCFetchiWorkSharingInfoOperation *)v13 initWithDocumentItem:v14 sessionContext:v15];

  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  unint64_t v33 = __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke;
  id v34 = &unk_1E699AA20;
  double v35 = self;
  id v36 = v10;
  [(_BRCOperation *)v16 setFinishBlock:&v31];
  int v17 = [(BRCXPCClient *)self session];
  [v17 addMiscOperation:v16];

  [(_BRCOperation *)v16 schedule];
LABEL_19:
}

void __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F19E00];
  id v7 = a2;
  id v8 = [v7 objectForKeyedSubscript:v6];
  char v9 = [v8 BOOLValue];

  id v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19DF8]];
  int v11 = [v10 BOOLValue];

  char v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19DF0]];
  uint64_t v13 = [v7 encryptedValues];

  __int16 v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F19E08]];

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v15 = brc_bread_crumbs();
      __int16 v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke_cold_3();
      }

      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: base token of unexpected class");

      id v5 = (id)v17;
    }
  }
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke_cold_2();
      }

      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: sharing key of unexpected class");

      id v5 = (id)v20;
    }
  }
  if (v5)
  {
    uint64_t v21 = brc_bread_crumbs();
    __int16 v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = objc_msgSend(v5, "brc_wrappedError");
      int v41 = 138413570;
      uint64_t v42 = v23;
      __int16 v43 = 1024;
      int v44 = 0;
      __int16 v45 = 1024;
      int v46 = 0;
      __int16 v47 = 2112;
      id v48 = 0;
      __int16 v49 = 2112;
      unint64_t v50 = v24;
      __int16 v51 = 2112;
      uint64_t v52 = v21;
      _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", (uint8_t *)&v41, 0x36u);
    }
    uint64_t v25 = *(void *)(a1 + 40);
    __int16 v26 = objc_msgSend(v5, "brc_wrappedError");
    (*(void (**)(uint64_t, void, void, void, void *))(v25 + 16))(v25, 0, 0, 0, v26);

LABEL_15:
    goto LABEL_26;
  }
  if (v9)
  {
    if ((v12 != 0) == (v14 != 0))
    {
      id v36 = [v14 base64EncodedStringWithOptions:0];
      id v5 = (id)[v36 mutableCopy];

      objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"+", @"-", 0, 0, objc_msgSend(v5, "length"));
      objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"/", @"_", 0, 0, objc_msgSend(v5, "length"));
      id v37 = [v12 stringByAppendingString:v5];
      id v38 = brc_bread_crumbs();
      __int16 v39 = brc_default_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        uint64_t v40 = *(void *)(a1 + 32);
        int v41 = 138413570;
        uint64_t v42 = v40;
        __int16 v43 = 1024;
        int v44 = 1;
        __int16 v45 = 1024;
        int v46 = v11;
        __int16 v47 = 2112;
        id v48 = v37;
        __int16 v49 = 2112;
        unint64_t v50 = 0;
        __int16 v51 = 2112;
        uint64_t v52 = v38;
        _os_log_impl(&dword_1D353B000, v39, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", (uint8_t *)&v41, 0x36u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_15;
    }
    id v27 = brc_bread_crumbs();
    uint64_t v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke_cold_1();
    }

    id v29 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: only got sharing key or base token, didn't get both");
    id v30 = brc_bread_crumbs();
    uint64_t v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = *(void *)(a1 + 32);
      int v41 = 138413570;
      uint64_t v42 = v32;
      __int16 v43 = 1024;
      int v44 = 0;
      __int16 v45 = 1024;
      int v46 = 0;
      __int16 v47 = 2112;
      id v48 = 0;
      __int16 v49 = 2112;
      unint64_t v50 = v29;
      __int16 v51 = 2112;
      uint64_t v52 = v30;
      _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", (uint8_t *)&v41, 0x36u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    unint64_t v33 = brc_bread_crumbs();
    id v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = *(void *)(a1 + 32);
      int v41 = 138413570;
      uint64_t v42 = v35;
      __int16 v43 = 1024;
      int v44 = 0;
      __int16 v45 = 1024;
      int v46 = 0;
      __int16 v47 = 2112;
      id v48 = 0;
      __int16 v49 = 2112;
      unint64_t v50 = 0;
      __int16 v51 = 2112;
      uint64_t v52 = v33;
      _os_log_impl(&dword_1D353B000, v34, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %@, %@)%@", (uint8_t *)&v41, 0x36u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
LABEL_26:
}

- (void)_setiWorkPublishingInfoForLocalItem:(id)a3 itemIdentifier:(id)a4 publish:(BOOL)a5 readonly:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  __int16 v14 = (void (**)(id, uint64_t))a7;
  if (!v12)
  {
    __int16 v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", v13);
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = self;
      __int16 v43 = 2112;
      int v44 = v24;
      __int16 v45 = 2112;
      int v46 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", v13);
    goto LABEL_18;
  }
  if (([v12 isDocument] & 1) == 0)
  {
    __int16 v26 = brc_bread_crumbs();
    id v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", v13, 21);
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = self;
      __int16 v43 = 2112;
      int v44 = v28;
      __int16 v45 = 2112;
      int v46 = v26;
      _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", v13, 21);
    goto LABEL_18;
  }
  if (([v12 isKnownByServer] & 1) == 0)
  {
    id v29 = brc_bread_crumbs();
    id v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", v13);
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = self;
      __int16 v43 = 2112;
      int v44 = v31;
      __int16 v45 = 2112;
      int v46 = v29;
      _os_log_impl(&dword_1D353B000, v30, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", v13);
    goto LABEL_18;
  }
  uint64_t v15 = [v12 st];
  char v16 = [v15 iWorkShareable];

  if ((v16 & 1) == 0)
  {
    uint64_t v32 = brc_bread_crumbs();
    unint64_t v33 = brc_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      id v34 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v13);
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = self;
      __int16 v43 = 2112;
      int v44 = v34;
      __int16 v45 = 2112;
      int v46 = v32;
      _os_log_impl(&dword_1D353B000, v33, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v13);
LABEL_18:
    uint64_t v20 = (BRCiWorkPublishingOperation *)v25;
    v14[2](v14, v25);
    goto LABEL_19;
  }
  uint64_t v17 = [BRCiWorkPublishingOperation alloc];
  __int16 v18 = [v12 asDocument];
  uint64_t v19 = [(BRCXPCClient *)self session];
  uint64_t v20 = [(BRCiWorkPublishingOperation *)v17 initWithDocumentItem:v18 sessionContext:v19 forPublish:v9 readonly:v8];

  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  id v37 = __101__BRCXPCRegularIPCsClient__setiWorkPublishingInfoForLocalItem_itemIdentifier_publish_readonly_reply___block_invoke;
  id v38 = &unk_1E6996730;
  __int16 v39 = self;
  uint64_t v40 = v14;
  [(_BRCOperation *)v20 setFinishBlock:&v35];
  uint64_t v21 = [(BRCXPCClient *)self session];
  [v21 addMiscOperation:v20];

  [(_BRCOperation *)v20 schedule];
LABEL_19:
}

void __101__BRCXPCRegularIPCsClient__setiWorkPublishingInfoForLocalItem_itemIdentifier_publish_readonly_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v8 = objc_msgSend(v4, "brc_wrappedError");
    int v11 = 138412802;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    __int16 v15 = 2112;
    char v16 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = objc_msgSend(v4, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

- (void)_getiWorkPublishingBadgingStatusForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  if (!v8)
  {
    __int16 v15 = brc_bread_crumbs();
    char v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", v9);
      int v29 = 138413058;
      id v30 = self;
      __int16 v31 = 1024;
      int v32 = 0;
      __int16 v33 = 2112;
      id v34 = v17;
      __int16 v35 = 2112;
      uint64_t v36 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v29, 0x26u);
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", v9);
    goto LABEL_20;
  }
  if (([v8 isDocument] & 1) == 0)
  {
    uint64_t v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", v9, 21);
      int v29 = 138413058;
      id v30 = self;
      __int16 v31 = 1024;
      int v32 = 0;
      __int16 v33 = 2112;
      id v34 = v21;
      __int16 v35 = 2112;
      uint64_t v36 = v19;
      _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v29, 0x26u);
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", v9, 21);
    goto LABEL_20;
  }
  if (([v8 isKnownByServer] & 1) == 0)
  {
    __int16 v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", v9);
      int v29 = 138413058;
      id v30 = self;
      __int16 v31 = 1024;
      int v32 = 0;
      __int16 v33 = 2112;
      id v34 = v24;
      __int16 v35 = 2112;
      uint64_t v36 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v29, 0x26u);
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", v9);
    goto LABEL_20;
  }
  int v11 = [v8 st];
  char v12 = [v11 iWorkShareable];

  if ((v12 & 1) == 0)
  {
    uint64_t v25 = brc_bread_crumbs();
    __int16 v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v9);
      int v29 = 138413058;
      id v30 = self;
      __int16 v31 = 1024;
      int v32 = 0;
      __int16 v33 = 2112;
      id v34 = v27;
      __int16 v35 = 2112;
      uint64_t v36 = v25;
      _os_log_impl(&dword_1D353B000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v29, 0x26u);
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v9);
LABEL_20:
    uint64_t v28 = (void *)v18;
    v10[2](v10, 0, v18);

    goto LABEL_21;
  }
  __int16 v13 = brc_bread_crumbs();
  __int16 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v29 = 138413058;
    id v30 = self;
    __int16 v31 = 1024;
    LOBYTE(v32) = [v8 sharingOptions] & 3;
    int v32 = v32;
    __int16 v33 = 2112;
    id v34 = 0;
    __int16 v35 = 2112;
    uint64_t v36 = v13;
    _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v29, 0x26u);
  }

  v10[2](v10, [v8 sharingOptions] & 3, 0);
LABEL_21:
}

- (void)_getiWorkNeedsShareMigrateForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  if (!v8)
  {
    char v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", v9);
      int v30 = 138413058;
      __int16 v31 = self;
      __int16 v32 = 1024;
      BOOL v33 = 0;
      __int16 v34 = 2112;
      __int16 v35 = v18;
      __int16 v36 = 2112;
      uint64_t v37 = v16;
      _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v30, 0x26u);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", v9);
    goto LABEL_20;
  }
  if (([v8 isDocument] & 1) == 0)
  {
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", v9, 21);
      int v30 = 138413058;
      __int16 v31 = self;
      __int16 v32 = 1024;
      BOOL v33 = 0;
      __int16 v34 = 2112;
      __int16 v35 = v22;
      __int16 v36 = 2112;
      uint64_t v37 = v20;
      _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v30, 0x26u);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", v9, 21);
    goto LABEL_20;
  }
  if (([v8 isKnownByServer] & 1) == 0)
  {
    uint64_t v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", v9);
      int v30 = 138413058;
      __int16 v31 = self;
      __int16 v32 = 1024;
      BOOL v33 = 0;
      __int16 v34 = 2112;
      __int16 v35 = v25;
      __int16 v36 = 2112;
      uint64_t v37 = v23;
      _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v30, 0x26u);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", v9);
    goto LABEL_20;
  }
  int v11 = [v8 st];
  char v12 = [v11 iWorkShareable];

  if ((v12 & 1) == 0)
  {
    __int16 v26 = brc_bread_crumbs();
    id v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v9);
      int v30 = 138413058;
      __int16 v31 = self;
      __int16 v32 = 1024;
      BOOL v33 = 0;
      __int16 v34 = 2112;
      __int16 v35 = v28;
      __int16 v36 = 2112;
      uint64_t v37 = v26;
      _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v30, 0x26u);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"path isn't iWork Shareable", v9);
LABEL_20:
    int v29 = (void *)v19;
    v10[2](v10, 0, v19);

    goto LABEL_21;
  }
  uint64_t v13 = [v8 sharingOptions] & 0x4D;
  __int16 v14 = brc_bread_crumbs();
  __int16 v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v30 = 138413058;
    __int16 v31 = self;
    __int16 v32 = 1024;
    BOOL v33 = v13 == 1;
    __int16 v34 = 2112;
    __int16 v35 = 0;
    __int16 v36 = 2112;
    uint64_t v37 = v14;
    _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v30, 0x26u);
  }

  ((void (**)(id, BOOL, uint64_t))v10)[2](v10, v13 == 1, 0);
LABEL_21:
}

- (void)_launchItemCountMismatchChecksForLocalItem:(id)a3 itemIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  if (!v8)
  {
    char v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", v9);
      *(_DWORD *)buf = 138413058;
      id v27 = self;
      __int16 v28 = 1024;
      int v29 = 0;
      __int16 v30 = 2112;
      __int16 v31 = v18;
      __int16 v32 = 2112;
      BOOL v33 = v16;
      _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", v9);
    goto LABEL_10;
  }
  if (([v8 isDirectory] & 1) == 0)
  {
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", v9, 20);
      *(_DWORD *)buf = 138413058;
      id v27 = self;
      __int16 v28 = 1024;
      int v29 = 0;
      __int16 v30 = 2112;
      __int16 v31 = v22;
      __int16 v32 = 2112;
      BOOL v33 = v20;
      _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", v9, 20);
LABEL_10:
    uint64_t v23 = (void *)v19;
    v10[2](v10, 0, v19);

    goto LABEL_11;
  }
  int v11 = [(BRCXPCClient *)self session];
  char v12 = [v11 applyScheduler];
  uint64_t v13 = [v12 hasActiveWorkGroup];
  dispatch_time_t v14 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v13, v14);

  __int16 v15 = [v8 asDirectory];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __91__BRCXPCRegularIPCsClient__launchItemCountMismatchChecksForLocalItem_itemIdentifier_reply___block_invoke;
  uint64_t v24[3] = &unk_1E699AA48;
  void v24[4] = self;
  uint64_t v25 = v10;
  +[BRCItemCountMismatchReport generateReportForSharedFolder:v15 qualityOfService:25 completionHandler:v24];

LABEL_11:
}

void __91__BRCXPCRegularIPCsClient__launchItemCountMismatchChecksForLocalItem_itemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      BOOL v7 = [v3 itemCountDifference] == 0;
      id v8 = [v3 lastError];
      int v19 = 138413058;
      uint64_t v20 = v6;
      __int16 v21 = 1024;
      BOOL v22 = v7;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      __int16 v26 = v4;
      _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v19, 0x26u);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    BOOL v10 = [v3 itemCountDifference] == 0;
    int v11 = [v3 lastError];
    (*(void (**)(uint64_t, BOOL, void *))(v9 + 16))(v9, v10, v11);
  }
  else
  {
    char v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    uint64_t v15 = *MEMORY[0x1E4F592A8];
    if (v14)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 9999, @"Failed generating mismatch report");
      int v19 = 138413058;
      uint64_t v20 = v16;
      __int16 v21 = 1024;
      BOOL v22 = 0;
      __int16 v23 = 2112;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      __int16 v26 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v19, 0x26u);
    }
    uint64_t v18 = *(void *)(a1 + 40);
    int v11 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", v15, 9999, @"Failed generating mismatch report");
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v11);
  }
}

- (void)_startOperation:(id)a3 toCopySharingAccessTokenWithLocalItem:(id)a4 itemIdentifier:(id)a5 reply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  BOOL v14 = [BRCSharingCopyAccessTokenOperation alloc];
  uint64_t v15 = [v10 asDocument];
  uint64_t v16 = [(BRCXPCClient *)self session];
  uint64_t v17 = [(BRCSharingCopyAccessTokenOperation *)v14 initWithItem:v15 sessionContext:v16];

  [(_BRCFrameworkOperation *)v17 setRemoteClientProxy:v13];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __102__BRCXPCRegularIPCsClient__startOperation_toCopySharingAccessTokenWithLocalItem_itemIdentifier_reply___block_invoke;
  __int16 v25 = &unk_1E699AA70;
  id v26 = v10;
  id v27 = v11;
  __int16 v28 = self;
  id v29 = v12;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  [(_BRCOperation *)v17 setFinishBlock:&v22];
  __int16 v21 = [(BRCXPCClient *)self session];
  [v21 addMiscOperation:v17];

  [(_BRCOperation *)v17 schedule];
}

void __102__BRCXPCRegularIPCsClient__startOperation_toCopySharingAccessTokenWithLocalItem_itemIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  if (objc_msgSend(v5, "br_isCloudDocsErrorCode:", 24))
  {
    BOOL v7 = [*(id *)(a1 + 32) clientZone];
    int v8 = [v7 isSharedZone];

    uint64_t v9 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorDocumentIsNoLongerSharedAtIdentifier:", v9);

      id v11 = [*(id *)(a1 + 48) session];
      id v12 = [v11 clientTruthWorkloop];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __102__BRCXPCRegularIPCsClient__startOperation_toCopySharingAccessTokenWithLocalItem_itemIdentifier_reply___block_invoke_2;
      block[3] = &unk_1E6993698;
      id v22 = *(id *)(a1 + 32);
      dispatch_async(v12, block);
    }
    else
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorDocumentIsNotSharedAtIdentifier:", v9);
    }
    id v5 = (id)v10;
  }
  id v13 = [v6 objectForKeyedSubscript:@"token"];
  BOOL v14 = [v6 objectForKeyedSubscript:@"ref_id"];

  uint64_t v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = *(void *)(a1 + 48);
    id v18 = objc_msgSend(v5, "brc_wrappedError");
    *(_DWORD *)buf = 138413314;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    __int16 v28 = v14;
    __int16 v29 = 2112;
    __int16 v30 = v18;
    __int16 v31 = 2112;
    __int16 v32 = v15;
    _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
  }
  uint64_t v19 = *(void *)(a1 + 56);
  id v20 = objc_msgSend(v5, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *, void *))(v19 + 16))(v19, v13, v14, v20);
}

void __102__BRCXPCRegularIPCsClient__startOperation_toCopySharingAccessTokenWithLocalItem_itemIdentifier_reply___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) clientZone];
  [v1 scheduleSyncDown];
}

- (void)_startOperation:(id)a3 toCopySharingInfoWithLocalItem:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient _startOperation:toCopySharingInfoWithLocalItem:reply:]();
  }

  id v13 = [BRCSharingCopyShareOperation alloc];
  BOOL v14 = [(BRCXPCClient *)self session];
  uint64_t v15 = [(BRCSharingCopyShareOperation *)v13 initWithItem:v8 sessionContext:v14];

  [(_BRCFrameworkOperation *)v15 setRemoteClientProxy:v10];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke;
  uint64_t v18[3] = &unk_1E6999F18;
  id v19 = v8;
  id v20 = self;
  id v21 = v9;
  id v16 = v9;
  id v17 = v8;
  [(_BRCOperation *)v15 setFinishBlock:v18];
  [(_BRCOperation *)v15 schedule];
}

void __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v36 = brc_bread_crumbs();
      uint64_t v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke_cold_2();
      }
    }
  }
  if ((objc_msgSend(v6, "brc_containsCloudKitErrorCode:", 11) & 1) != 0
    || objc_msgSend(v6, "brc_isCloudKitErrorImplyingZoneNeedsCreation"))
  {
    BOOL v7 = [*(id *)(a1 + 32) clientZone];
    int v8 = [v7 isSharedZone];

    if (v8)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorDocumentIsNoLongerSharedAtIdentifier:", 0);

      id v10 = [*(id *)(a1 + 40) session];
      id v11 = [v10 clientTruthWorkloop];
      uint64_t v38 = MEMORY[0x1E4F143A8];
      uint64_t v39 = 3221225472;
      uint64_t v40 = __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke_549;
      int v41 = &unk_1E6993698;
      id v42 = *(id *)(a1 + 32);
      id v12 = v11;
      id v13 = &v38;
      id v17 = (void *)MEMORY[0x1D9438760](v13, v14, v15, v16);
      long long v43 = 0uLL;
      uint64_t v44 = 0;
      __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v43);
      id v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = v43;
        label = dispatch_queue_get_label(v12);
        *(_DWORD *)block = 134218498;
        *(void *)&void block[4] = v34;
        *(_WORD *)&block[12] = 2080;
        *(void *)&block[14] = label;
        *(_WORD *)&block[22] = 2112;
        int v46 = v18;
        _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
      }

      *(_OWORD *)&v47[16] = v43;
      uint64_t v48 = v44;
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = __dispatch_async_with_logs_block_invoke_23;
      int v46 = &unk_1E6993710;
      id v20 = v12;
      *(void *)uint64_t v47 = v20;
      id v21 = v13;
      *(void *)&v47[8] = v21;
      dispatch_async(v20, block);

      id v6 = v42;
    }
    else
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorDocumentIsNotSharedAtIdentifier:", 0);
    }

    id v6 = (id)v9;
  }
  id v22 = objc_msgSend(v5, "objectForKeyedSubscript:", @"share", v38, v39, v40, v41);
  uint64_t v23 = [v5 objectForKeyedSubscript:@"rootURL"];
  uint64_t v24 = [v22 participants];
  unint64_t v25 = [v24 count];

  if (v25 >= 3)
  {
    id v26 = brc_bread_crumbs();
    __int16 v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke_cold_1(v22, (uint64_t)v26, v27);
    }
  }
  __int16 v28 = brc_bread_crumbs();
  __int16 v29 = brc_default_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = *(void *)(a1 + 40);
    __int16 v31 = objc_msgSend(v6, "brc_wrappedError");
    *(_DWORD *)block = 138413314;
    *(void *)&void block[4] = v30;
    *(_WORD *)&block[12] = 2112;
    *(void *)&block[14] = v22;
    *(_WORD *)&block[22] = 2112;
    int v46 = v23;
    *(_WORD *)uint64_t v47 = 2112;
    *(void *)&v47[2] = v31;
    *(_WORD *)&v47[10] = 2112;
    *(void *)&v47[12] = v28;
    _os_log_impl(&dword_1D353B000, v29, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", block, 0x34u);
  }
  uint64_t v32 = *(void *)(a1 + 48);
  uint64_t v33 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *, void *))(v32 + 16))(v32, v22, v23, v33);
}

void __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke_549(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) clientZone];
  [v1 scheduleSyncDown];
}

- (void)startOperation:(id)a3 toCopySharingInfoWithItemID:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopySharingInfoWithItemID:reply:]", 4045, v27);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v27[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    __int16 v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient startOperation:toCopySharingInfoWithItemID:reply:]";
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingProxyEntitled];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__BRCXPCRegularIPCsClient_startOperation_toCopySharingInfoWithItemID_reply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v18 = v10;
  id v26 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingProxyEntitled", v25);

  if (v19)
  {
    id v20 = [(BRCAccountSession *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__BRCXPCRegularIPCsClient_startOperation_toCopySharingInfoWithItemID_reply___block_invoke_559;
    block[3] = &unk_1E69958F0;
    void block[4] = self;
    id v22 = v9;
    id v24 = v18;
    id v23 = v8;
    dispatch_async_and_wait(v20, block);
  }
  __brc_leave_section(v27);
}

void __76__BRCXPCRegularIPCsClient_startOperation_toCopySharingInfoWithItemID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__BRCXPCRegularIPCsClient_startOperation_toCopySharingInfoWithItemID_reply___block_invoke_559(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x1E4F594D0] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4)
  {
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toCopySharingInfoWithLocalItem:v4 reply:*(void *)(a1 + 56)];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      int v11 = 138413314;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = 0;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v11, 0x34u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v10);
  }
}

- (void)startOperation:(id)a3 toCopySharingAccessTokenOfItemID:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopySharingAccessTokenOfItemID:reply:]", 4061, v27);
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v27[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    __int16 v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient startOperation:toCopySharingAccessTokenOfItemID:reply:]";
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingProxyEntitled];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__BRCXPCRegularIPCsClient_startOperation_toCopySharingAccessTokenOfItemID_reply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v18 = v10;
  id v26 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingProxyEntitled", v25);

  if (v19)
  {
    id v20 = [(BRCAccountSession *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__BRCXPCRegularIPCsClient_startOperation_toCopySharingAccessTokenOfItemID_reply___block_invoke_561;
    block[3] = &unk_1E69958F0;
    void block[4] = self;
    id v22 = v9;
    id v24 = v18;
    id v23 = v8;
    dispatch_async_and_wait(v20, block);
  }
  __brc_leave_section(v27);
}

void __81__BRCXPCRegularIPCsClient_startOperation_toCopySharingAccessTokenOfItemID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__BRCXPCRegularIPCsClient_startOperation_toCopySharingAccessTokenOfItemID_reply___block_invoke_561(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x1E4F594D0] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4 && ([v4 isDocument] & 1) != 0)
  {
    if ([v4 isKnownByServer] & 1) != 0 || (objc_msgSend(v4, "isShareAcceptationFault")) {
      goto LABEL_11;
    }
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", *(void *)(a1 + 40), 2);
  }
  uint64_t v6 = (void *)v5;
  if (!v5)
  {
LABEL_11:
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toCopySharingAccessTokenWithLocalItem:v4 itemIdentifier:*(void *)(a1 + 40) reply:*(void *)(a1 + 56)];
    goto LABEL_12;
  }
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138413314;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    char v19 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v10, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_12:
}

- (void)startOperation:(id)a3 toCopyShortTokenOfItemID:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopyShortTokenOfItemID:reply:]", 4085, v27);
  uint64_t v11 = brc_bread_crumbs();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v27[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    __int16 v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient startOperation:toCopyShortTokenOfItemID:reply:]";
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingProxyEntitled];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __73__BRCXPCRegularIPCsClient_startOperation_toCopyShortTokenOfItemID_reply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v18 = v10;
  id v26 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingProxyEntitled", v25);

  if (v19)
  {
    uint64_t v20 = [(BRCAccountSession *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__BRCXPCRegularIPCsClient_startOperation_toCopyShortTokenOfItemID_reply___block_invoke_562;
    block[3] = &unk_1E69958F0;
    void block[4] = self;
    id v22 = v9;
    id v24 = v18;
    id v23 = v8;
    dispatch_async_and_wait(v20, block);
  }
  __brc_leave_section(v27);
}

void __73__BRCXPCRegularIPCsClient_startOperation_toCopyShortTokenOfItemID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__BRCXPCRegularIPCsClient_startOperation_toCopyShortTokenOfItemID_reply___block_invoke_562(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x1E4F594D0] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4 && ([v4 isDocument] & 1) != 0)
  {
    if ([v4 isKnownByServer] & 1) != 0 || (objc_msgSend(v4, "isShareAcceptationFault")) {
      goto LABEL_11;
    }
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", *(void *)(a1 + 40), 2);
  }
  uint64_t v6 = (BRCSharingCopyShortTokenOperation *)v5;
  if (!v5)
  {
LABEL_11:
    uint64_t v10 = [BRCSharingCopyShortTokenOperation alloc];
    __int16 v11 = [v4 asDocument];
    id v12 = [*(id *)(a1 + 32) session];
    uint64_t v6 = [(BRCSharingCopyShortTokenOperation *)v10 initWithItem:v11 sessionContext:v12];

    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __73__BRCXPCRegularIPCsClient_startOperation_toCopyShortTokenOfItemID_reply___block_invoke_564;
    __int16 v16 = &unk_1E6996730;
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 56);
    [(_BRCOperation *)v6 setFinishBlock:&v13];
    objc_msgSend(*(id *)(a1 + 32), "_startSharingOperationAfterAcceptation:client:item:", v6, *(void *)(a1 + 48), v4, v13, v14, v15, v16, v17);

    goto LABEL_12;
  }
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = 0;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_12:
}

void __73__BRCXPCRegularIPCsClient_startOperation_toCopyShortTokenOfItemID_reply___block_invoke_564(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
    int v13 = 138413058;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
}

- (void)startOperation:(id)a3 toCopySharingWebAuthTokenForContainerID:(id)a4 reply:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v29, 0, sizeof(v29));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopySharingWebAuthTokenForContainerID:reply:]", 4113, v29);
  uint64_t v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v29[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v31 = v13;
    __int16 v32 = 2112;
    uint64_t v33 = self;
    __int16 v34 = 2112;
    __int16 v35 = v15;
    __int16 v36 = 2080;
    uint64_t v37 = "-[BRCXPCRegularIPCsClient startOperation:toCopySharingWebAuthTokenForContainerID:reply:]";
    __int16 v38 = 2112;
    uint64_t v39 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingPrivateInterfaceEntitled];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__BRCXPCRegularIPCsClient_startOperation_toCopySharingWebAuthTokenForContainerID_reply___block_invoke;
  uint64_t v27[3] = &unk_1E69957B0;
  void v27[4] = self;
  id v18 = v10;
  id v28 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingPrivateInterfaceEntitled", v27);

  if (v19)
  {
    uint64_t v20 = [(BRCXPCClient *)self session];
    uint64_t v21 = [BRCSharingCopyWebAuthTokenOperation alloc];
    uint64_t v22 = [v20 syncContextProvider];
    __int16 v23 = [v22 defaultSyncContext];
    id v24 = [(BRCSharingCopyWebAuthTokenOperation *)v21 initWithSyncContext:v23 ckContainerID:v9 sessionContext:v20];

    [(_BRCFrameworkOperation *)v24 setRemoteClientProxy:v8];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __88__BRCXPCRegularIPCsClient_startOperation_toCopySharingWebAuthTokenForContainerID_reply___block_invoke_566;
    uint64_t v25[3] = &unk_1E6996730;
    void v25[4] = self;
    id v26 = v18;
    [(_BRCOperation *)v24 setFinishBlock:v25];
    [v20 addMiscOperation:v24];
    [(_BRCOperation *)v24 schedule];
  }
  __brc_leave_section(v29);
}

void __88__BRCXPCRegularIPCsClient_startOperation_toCopySharingWebAuthTokenForContainerID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__BRCXPCRegularIPCsClient_startOperation_toCopySharingWebAuthTokenForContainerID_reply___block_invoke_566(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
    int v13 = 138413058;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
}

- (void)startOperation:(id)a3 toCopyDocumentURLForRecordID:(id)a4 syncIfNeeded:(BOOL)a5 reply:(id)a6
{
  BOOL v35 = a5;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  memset(v46, 0, sizeof(v46));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]", 4132, v46);
  id v12 = brc_bread_crumbs();
  int v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v46[0];
    qos_class_t v15 = qos_class_self();
    id v16 = BRCPrettyPrintEnumWithContext(v15, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v48 = v14;
    __int16 v49 = 2112;
    unint64_t v50 = self;
    __int16 v51 = 2112;
    uint64_t v52 = (uint64_t)v16;
    __int16 v53 = 2080;
    __int16 v54 = "-[BRCXPCRegularIPCsClient startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]";
    __int16 v55 = 2112;
    id v56 = v12;
    _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v17 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v18 = [v17 isSharingPrivateInterfaceEntitled];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke;
  uint64_t v44[3] = &unk_1E69957B0;
  void v44[4] = self;
  id v19 = v11;
  id v45 = v19;
  char v20 = _brc_ipc_check_client_privilege(self, 1, v18, (uint64_t)"isSharingPrivateInterfaceEntitled", v44);

  if (v20)
  {
    memset(v43, 0, sizeof(v43));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]", 4134, v43);
    uint64_t v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = v43[0];
      qos_class_t v24 = qos_class_self();
      uint64_t v25 = BRCPrettyPrintEnumWithContext(v24, (uint64_t)&brc_qos_entries, 0);
      id v26 = (void *)v25;
      uint64_t v27 = "No";
      *(_DWORD *)buf = 134219522;
      uint64_t v48 = v23;
      __int16 v49 = 2112;
      if (v35) {
        uint64_t v27 = "Yes";
      }
      unint64_t v50 = self;
      __int16 v51 = 2112;
      uint64_t v52 = v25;
      __int16 v53 = 2080;
      __int16 v54 = "-[BRCXPCRegularIPCsClient startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]";
      __int16 v55 = 2112;
      id v56 = v10;
      __int16 v57 = 2080;
      int v58 = v27;
      __int16 v59 = 2112;
      uint64_t v60 = v21;
      _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s looking up url for recordID %@ fetching from server:%s%@", buf, 0x48u);
    }
    id v28 = [(BRCXPCClient *)self session];
    uint64_t v29 = self->super._tracker;
    __int16 v30 = [(BRCXPCClient *)self session];
    uint64_t v31 = [v30 clientTruthWorkloop];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_569;
    uint64_t v36[3] = &unk_1E699AB88;
    void v36[4] = self;
    id v41 = v19;
    __int16 v32 = v29;
    uint64_t v37 = v32;
    id v33 = v31;
    id v38 = v33;
    id v39 = v10;
    id v34 = v28;
    id v40 = v34;
    BOOL v42 = v35;
    [v34 fetchUserRecordIDWithCompletionHandler:v36];

    __brc_leave_section(v43);
  }
  __brc_leave_section(v46);
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_569(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void **)(a1 + 48);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_570;
    v16[3] = &unk_1E699AB60;
    id v17 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 32);
    id v18 = v9;
    uint64_t v19 = v10;
    id v23 = *(id *)(a1 + 72);
    id v20 = v5;
    id v21 = *(id *)(a1 + 40);
    char v24 = *(unsigned char *)(a1 + 80);
    id v22 = *(id *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_582;
    v14[3] = &unk_1E6994600;
    v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 72);
    brc_task_tracker_async_with_logs(v7, v8, v16, v14);
  }
  else
  {
    __int16 v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      uint64_t v26 = v13;
      __int16 v27 = 2112;
      uint64_t v28 = 0;
      __int16 v29 = 2112;
      id v30 = v6;
      __int16 v31 = 2112;
      __int16 v32 = v11;
      _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_570(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  __int16 v32 = 0;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "brc_itemIDWithSession:error:", *(void *)(a1 + 40), &v32);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) zoneID];
    id v4 = [v3 ownerName];
    id v5 = [*(id *)(a1 + 56) recordName];
    int v6 = [v4 isEqualToString:v5];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1A320]);
      uint64_t v8 = [v3 zoneName];
      uint64_t v9 = [v7 initWithZoneName:v8 ownerName:*MEMORY[0x1E4F19C08]];

      id v3 = (void *)v9;
    }
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithRecordZoneID:v3];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v34 = __Block_byref_object_copy__48;
    *(void *)&long long v35 = __Block_byref_object_dispose__48;
    *((void *)&v35 + 1) = [*(id *)(a1 + 40) clientZoneByMangledID:v10];
    __int16 v11 = *(void **)(a1 + 64);
    id v12 = *(void **)(*(void *)(a1 + 48) + 16);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_571;
    uint64_t v21[3] = &unk_1E699AB38;
    id v30 = buf;
    char v31 = *(unsigned char *)(a1 + 88);
    id v13 = v10;
    id v22 = v13;
    id v23 = *(id *)(a1 + 40);
    id v24 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 48);
    id v25 = v14;
    uint64_t v26 = v15;
    id v29 = *(id *)(a1 + 80);
    id v27 = *(id *)(a1 + 32);
    id v28 = v2;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_581;
    uint64_t v19[3] = &unk_1E6994600;
    void v19[4] = *(void *)(a1 + 48);
    id v20 = *(id *)(a1 + 80);
    brc_task_tracker_async_with_logs(v11, v12, v21, v19);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2112;
      id v34 = v32;
      LOWORD(v35) = 2112;
      *(void *)((char *)&v35 + 2) = v16;
      _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_571(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) && *(unsigned char *)(a1 + 104))
  {
    int v2 = [*(id *)(a1 + 32) isShared];
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    if (v2)
    {
      uint64_t v5 = [v3 getOrCreateSharedZones:v4];
      uint64_t v6 = *(void *)(*(void *)(a1 + 96) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    else
    {
      id v7 = [v3 getOrCreateAppLibraryAndPrivateZonesIfNecessary:v4];
      uint64_t v8 = [v7 defaultClientZone];
      uint64_t v9 = *(void *)(*(void *)(a1 + 96) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
  __int16 v11 = *(void **)(a1 + 48);
  id v12 = *(void **)(a1 + 56);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_2;
  uint64_t v17[3] = &unk_1E699AB10;
  uint64_t v25 = *(void *)(a1 + 96);
  id v18 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 64);
  id v19 = v13;
  uint64_t v20 = v14;
  id v24 = *(id *)(a1 + 88);
  id v21 = *(id *)(a1 + 72);
  id v22 = *(id *)(a1 + 80);
  char v26 = *(unsigned char *)(a1 + 104);
  id v23 = *(id *)(a1 + 48);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_580;
  uint64_t v15[3] = &unk_1E6994600;
  v15[4] = *(void *)(a1 + 64);
  id v16 = *(id *)(a1 + 88);
  brc_task_tracker_async_with_logs(v11, v12, v17, v15);
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) clientZoneByMangledID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_572;
    uint64_t v36[3] = &unk_1E6997990;
    uint64_t v5 = *(void **)(a1 + 56);
    void v36[4] = *(void *)(a1 + 48);
    id v37 = v5;
    id v38 = *(id *)(a1 + 80);
    uint64_t v6 = (void (**)(void, void))MEMORY[0x1D94389C0](v36);
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) itemByItemID:*(void *)(a1 + 64)];
    uint64_t v8 = v7;
    if (*(unsigned char *)(a1 + 96) && ([v7 isOnDisk] & 1) == 0)
    {
      id v19 = *(void **)(a1 + 64);
      uint64_t v20 = objc_msgSend(*(id *)(a1 + 56), "brc_itemType");
      id v21 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) serverZone];
      id v22 = [v19 structureRecordIDForItemType:v20 zone:v21 aliasTargetZoneIsShared:1];

      id v23 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_577;
      uint64_t v28[3] = &unk_1E699AAE8;
      uint64_t v33 = v6;
      id v29 = *(id *)(a1 + 72);
      id v24 = *(id *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 88);
      id v30 = v24;
      uint64_t v35 = v25;
      id v26 = *(id *)(a1 + 64);
      uint64_t v27 = *(void *)(a1 + 48);
      id v31 = v26;
      uint64_t v32 = v27;
      id v34 = *(id *)(a1 + 80);
      [v23 performBlock:v28 whenItemWithRecordIDIsOnDisk:v22];
    }
    else
    {
      ((void (**)(void, void *))v6)[2](v6, v8);
    }
  }
  else
  {
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *(void *)(a1 + 48);
      id v13 = [*(id *)(a1 + 40) appLibraryOrZoneName];
      uint64_t v14 = objc_msgSend(v11, "brc_errorAppLibraryNotFound:", v13);
      *(_DWORD *)buf = 138413058;
      uint64_t v40 = v12;
      __int16 v41 = 2112;
      uint64_t v42 = 0;
      __int16 v43 = 2112;
      uint64_t v44 = v14;
      __int16 v45 = 2112;
      int v46 = v9;
      _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v15 = *(void *)(a1 + 80);
    id v16 = (void *)MEMORY[0x1E4F28C58];
    id v17 = [*(id *)(a1 + 40) appLibraryOrZoneName];
    id v18 = objc_msgSend(v16, "brc_errorAppLibraryNotFound:", v17);
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v18);
  }
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_572(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isOnDisk])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_573;
    uint64_t v19[3] = &unk_1E699AA98;
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    id v20 = v4;
    uint64_t v21 = v5;
    id v22 = *(id *)(a1 + 48);
    uint64_t v6 = (void (**)(void, void))MEMORY[0x1D94389C0](v19);
    id v7 = [[BRCItemToPathLookup alloc] initWithItem:v4];
    uint64_t v8 = [(BRCItemToPathLookup *)v7 coordinatedReadURL];
    ((void (**)(void, void *))v6)[2](v6, v8);

    uint64_t v9 = v20;
  }
  else
  {
    uint64_t v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = [*(id *)(a1 + 40) description];
      uint64_t v15 = objc_msgSend(v12, "brc_errorItemNotFound:", v14);
      *(_DWORD *)buf = 138413058;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = 0;
      __int16 v27 = 2112;
      id v28 = v15;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v9 = [*(id *)(a1 + 40) description];
    id v18 = objc_msgSend(v16, "brc_errorItemNotFound:", v9);
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);
  }
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_573(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v12 = 0;
    id v4 = [MEMORY[0x1E4F25D78] wrapperWithURL:v3 readonly:0 error:&v12];
    id v5 = v12;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = [*(id *)(a1 + 32) itemID];
    uint64_t v8 = [v7 description];
    objc_msgSend(v6, "brc_errorItemNotFound:", v8);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    id v4 = 0;
  }
  uint64_t v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_577(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) clientTruthWorkloop];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_2_578;
    v8[3] = &unk_1E699AAC0;
    uint64_t v11 = *(void *)(a1 + 80);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 64);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_3;
    v6[3] = &unk_1E6994600;
    v6[4] = *(void *)(a1 + 56);
    id v7 = *(id *)(a1 + 72);
    brc_task_tracker_async_with_logs(v3, v4, v8, v6);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v5();
  }
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_2_578(void *a1)
{
  id v2 = [*(id *)(*(void *)(a1[6] + 8) + 40) itemByItemID:a1[4]];
  (*(void (**)(void))(a1[5] + 16))();
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_580(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_581(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

void __90__BRCXPCRegularIPCsClient_startOperation_toCopyDocumentURLForRecordID_syncIfNeeded_reply___block_invoke_582(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    __int16 v15 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

void __72__BRCXPCRegularIPCsClient_startOperation_toCopyAvailableQuotaWithReply___block_invoke_586(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138413058;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    __int16 v17 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v10, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startOperation:(id)a3 toUploadAllFilesInContainer:(id)a4 reply:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v38, 0, sizeof(v38));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toUploadAllFilesInContainer:reply:]", 4266, v38);
  uint64_t v11 = brc_bread_crumbs();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v38[0];
    qos_class_t v14 = qos_class_self();
    id v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v41 = (BRCXPCRegularIPCsClient *)v13;
    __int16 v42 = 2112;
    __int16 v43 = self;
    __int16 v44 = 2112;
    __int16 v45 = v15;
    __int16 v46 = 2080;
    uint64_t v47 = "-[BRCXPCRegularIPCsClient startOperation:toUploadAllFilesInContainer:reply:]";
    __int16 v48 = 2112;
    __int16 v49 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __76__BRCXPCRegularIPCsClient_startOperation_toUploadAllFilesInContainer_reply___block_invoke;
  uint64_t v36[3] = &unk_1E69957B0;
  void v36[4] = self;
  id v16 = v10;
  id v37 = v16;
  int v17 = _brc_ipc_check_applibraries_access(self, 1, v36);

  if (v17)
  {
    uint64_t v18 = [(BRCXPCClient *)self session];
    if (v9)
    {
      __int16 v19 = [(BRCXPCClient *)self session];
      id v20 = [v19 appLibraryByID:v9];

      if (!v20)
      {
        __int16 v25 = brc_bread_crumbs();
        uint64_t v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v9);
          __int16 v27 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          __int16 v41 = self;
          __int16 v42 = 2112;
          __int16 v43 = v27;
          __int16 v44 = 2112;
          __int16 v45 = v25;
          _os_log_impl(&dword_1D353B000, v26, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v9);
        id v23 = (BRCUploadAllFilesTrackerOperation *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, BRCUploadAllFilesTrackerOperation *))v16 + 2))(v16, v23);
        goto LABEL_12;
      }
      [(BRCXPCClient *)self addAppLibrary:v20];
      uint64_t v21 = [BRCUploadAllFilesTrackerOperation alloc];
      id v39 = v20;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
      id v23 = [(BRCUploadAllFilesTrackerOperation *)v21 initWithSession:v18 appLibraries:v22];
    }
    else
    {
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __76__BRCXPCRegularIPCsClient_startOperation_toUploadAllFilesInContainer_reply___block_invoke_589;
      uint64_t v34[3] = &unk_1E6994010;
      void v34[4] = self;
      id v20 = v24;
      id v35 = v20;
      [v18 enumerateAppLibraries:v34];
      id v23 = [[BRCUploadAllFilesTrackerOperation alloc] initWithSession:v18 appLibraries:v20];
    }
    [(_BRCFrameworkOperation *)v23 setRemoteClientProxy:v8];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    id v30 = __76__BRCXPCRegularIPCsClient_startOperation_toUploadAllFilesInContainer_reply___block_invoke_2;
    uint64_t v31 = &unk_1E6996730;
    uint64_t v32 = self;
    id v33 = v16;
    [(_BRCOperation *)v23 setFinishBlock:&v28];
    objc_msgSend(v18, "addMiscOperation:", v23, v28, v29, v30, v31, v32);
    [(_BRCOperation *)v23 schedule];

LABEL_12:
  }
  __brc_leave_section(v38);
}

void __76__BRCXPCRegularIPCsClient_startOperation_toUploadAllFilesInContainer_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __76__BRCXPCRegularIPCsClient_startOperation_toUploadAllFilesInContainer_reply___block_invoke_589(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addAppLibrary:v4];
  [*(id *)(a1 + 40) addObject:v4];

  return 1;
}

void __76__BRCXPCRegularIPCsClient_startOperation_toUploadAllFilesInContainer_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)copyCurrentUserIdentifierWithReply:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BRCXPCClient *)self session];
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient copyCurrentUserIdentifierWithReply:]", 4304, v24);
  uint64_t v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v24[0];
    qos_class_t v9 = qos_class_self();
    __int16 v10 = BRCPrettyPrintEnumWithContext(v9, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v8;
    __int16 v27 = 2112;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2080;
    uint64_t v32 = "-[BRCXPCRegularIPCsClient copyCurrentUserIdentifierWithReply:]";
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v11 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v12 = [v11 isSharingPrivateInterfaceEntitled];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__BRCXPCRegularIPCsClient_copyCurrentUserIdentifierWithReply___block_invoke;
  uint64_t v22[3] = &unk_1E69957B0;
  uint8_t v22[4] = self;
  id v13 = v4;
  id v23 = v13;
  char v14 = _brc_ipc_check_client_privilege(self, 1, v12, (uint64_t)"isSharingPrivateInterfaceEntitled", v22);

  if (v14)
  {
    id v15 = [BRCSharingFetchUserRecordIDOperation alloc];
    id v16 = [v5 syncContextProvider];
    int v17 = [v16 defaultSyncContext];
    uint64_t v18 = [(BRCSharingFetchUserRecordIDOperation *)v15 initWithSyncContext:v17 sessionContext:v5];

    __int16 v19 = objc_msgSend(MEMORY[0x1E4F1A218], "br_fetchIdentityXPC");
    [(_BRCOperation *)v18 setGroup:v19];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__BRCXPCRegularIPCsClient_copyCurrentUserIdentifierWithReply___block_invoke_591;
    uint64_t v20[3] = &unk_1E699ABD8;
    void v20[4] = self;
    id v21 = v13;
    [(_BRCOperation *)v18 setFinishBlock:v20];
    [v5 addMiscOperation:v18];
    [(_BRCOperation *)v18 schedule];
  }
  __brc_leave_section(v24);
}

void __62__BRCXPCRegularIPCsClient_copyCurrentUserIdentifierWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__BRCXPCRegularIPCsClient_copyCurrentUserIdentifierWithReply___block_invoke_591(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v5 recordName];
    __int16 v11 = objc_msgSend(v6, "brc_wrappedError");
    int v15 = 138413058;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v15, 0x2Au);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  __int16 v13 = [v5 recordName];
  char v14 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v14);
}

- (void)copyCurrentUserNameAndDisplayHandleWithReply:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient copyCurrentUserNameAndDisplayHandleWithReply:]", 4323, v27);
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v27[0];
    qos_class_t v8 = qos_class_self();
    uint64_t v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v7;
    __int16 v30 = 2112;
    __int16 v31 = self;
    __int16 v32 = 2112;
    __int16 v33 = v9;
    __int16 v34 = 2080;
    uint64_t v35 = "-[BRCXPCRegularIPCsClient copyCurrentUserNameAndDisplayHandleWithReply:]";
    __int16 v36 = 2112;
    id v37 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v10 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v11 = [v10 isSharingProxyEntitled];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __72__BRCXPCRegularIPCsClient_copyCurrentUserNameAndDisplayHandleWithReply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v12 = v4;
  id v26 = v12;
  char v13 = _brc_ipc_check_client_privilege(self, 1, v11, (uint64_t)"isSharingProxyEntitled", v25);

  if (v13)
  {
    char v14 = [MEMORY[0x1E4FB36F8] sharedManager];
    int v15 = [v14 currentPersona];
    uint64_t v16 = objc_msgSend(v15, "br_personaID");

    __int16 v17 = [(BRCXPCClient *)self session];
    uint64_t v18 = [v17 syncContextProvider];
    __int16 v19 = [v18 defaultSyncContext];
    id v20 = [v19 ckContainer];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__BRCXPCRegularIPCsClient_copyCurrentUserNameAndDisplayHandleWithReply___block_invoke_592;
    uint64_t v22[3] = &unk_1E699AC28;
    uint8_t v22[4] = self;
    id v21 = v16;
    id v23 = v21;
    id v24 = v12;
    [v20 fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:v22];
  }
  __brc_leave_section(v27);
}

void __72__BRCXPCRegularIPCsClient_copyCurrentUserNameAndDisplayHandleWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413826;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = 0;
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v7, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__BRCXPCRegularIPCsClient_copyCurrentUserNameAndDisplayHandleWithReply___block_invoke_592(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) session];
  uint64_t v8 = [v7 syncContextProvider];
  __int16 v9 = [v8 defaultSyncContext];
  uint64_t v10 = [v9 ckContainer];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__BRCXPCRegularIPCsClient_copyCurrentUserNameAndDisplayHandleWithReply___block_invoke_2;
  v14[3] = &unk_1E699AC00;
  __int16 v11 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v5;
  id v16 = v6;
  id v17 = v11;
  id v18 = *(id *)(a1 + 48);
  id v12 = v6;
  id v13 = v5;
  [v10 fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:v14];
}

void __72__BRCXPCRegularIPCsClient_copyCurrentUserNameAndDisplayHandleWithReply___block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    uint64_t v13 = a1[7];
    uint64_t v14 = objc_msgSend(v7, "brc_wrappedError");
    int v21 = 138413826;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    __int16 v25 = 2112;
    uint64_t v26 = v12;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    uint64_t v30 = v13;
    __int16 v31 = 2112;
    __int16 v32 = v14;
    __int16 v33 = 2112;
    __int16 v34 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v21, 0x48u);
  }
  uint64_t v15 = a1[5];
  uint64_t v16 = a1[6];
  __int16 v19 = a1 + 7;
  uint64_t v17 = a1[7];
  uint64_t v18 = v19[1];
  id v20 = objc_msgSend(v7, "brc_wrappedError");
  (*(void (**)(uint64_t, uint64_t, uint64_t, id, uint64_t, void *))(v18 + 16))(v18, v15, v16, v6, v17, v20);
}

- (void)copyCollaborationIdentifierForFileObjectID:(id)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient copyCollaborationIdentifierForFileObjectID:reply:]", 4338, v24);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v24[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v26 = v10;
    __int16 v27 = 2112;
    id v28 = self;
    __int16 v29 = 2112;
    uint64_t v30 = v12;
    __int16 v31 = 2080;
    __int16 v32 = "-[BRCXPCRegularIPCsClient copyCollaborationIdentifierForFileObjectID:reply:]";
    __int16 v33 = 2112;
    __int16 v34 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v14 = [v13 isSharingProxyEntitled];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76__BRCXPCRegularIPCsClient_copyCollaborationIdentifierForFileObjectID_reply___block_invoke;
  uint64_t v22[3] = &unk_1E69957B0;
  uint8_t v22[4] = self;
  id v15 = v7;
  id v23 = v15;
  char v16 = _brc_ipc_check_client_privilege(self, 1, v14, (uint64_t)"isSharingProxyEntitled", v22);

  if (v16)
  {
    uint64_t v17 = [(BRCXPCClient *)self session];
    uint64_t v18 = [v17 clientTruthWorkloop];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__BRCXPCRegularIPCsClient_copyCollaborationIdentifierForFileObjectID_reply___block_invoke_594;
    uint64_t v19[3] = &unk_1E69946C8;
    void v19[4] = self;
    id v20 = v6;
    id v21 = v15;
    dispatch_async_and_wait(v18, v19);
  }
  __brc_leave_section(v24);
}

void __76__BRCXPCRegularIPCsClient_copyCollaborationIdentifierForFileObjectID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__BRCXPCRegularIPCsClient_copyCollaborationIdentifierForFileObjectID_reply___block_invoke_594(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 itemByFileObjectID:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __76__BRCXPCRegularIPCsClient_copyCollaborationIdentifierForFileObjectID_reply___block_invoke_594_cold_1();
    }

    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = [*(id *)(a1 + 40) description];
      __int16 v11 = objc_msgSend(v8, "brc_errorItemNotFound:", v10);
      int v22 = 138413058;
      uint64_t v23 = v9;
      __int16 v24 = 2112;
      __int16 v25 = 0;
      __int16 v26 = 2112;
      __int16 v27 = v11;
      __int16 v28 = 2112;
      __int16 v29 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v22, 0x2Au);
    }
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *(void *)(a1 + 48);
    char v14 = [*(id *)(a1 + 40) description];
    uint64_t v15 = objc_msgSend(v12, "brc_errorItemNotFound:", v14);
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v15);
  }
  char v16 = brc_bread_crumbs();
  uint64_t v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    __int16 v19 = [v3 collaborationIdentifierIfComputable];
    int v22 = 138413058;
    uint64_t v23 = v18;
    __int16 v24 = 2112;
    __int16 v25 = v19;
    __int16 v26 = 2112;
    __int16 v27 = 0;
    __int16 v28 = 2112;
    __int16 v29 = v16;
    _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v22, 0x2Au);
  }
  uint64_t v20 = *(void *)(a1 + 48);
  id v21 = [v3 collaborationIdentifierIfComputable];
  (*(void (**)(uint64_t, void *, void))(v20 + 16))(v20, v21, 0);
}

- (void)_createSharingInfoForLocalItem:(id)a3 reply:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient _createSharingInfoForLocalItem:reply:]();
  }

  if ([v6 isKnownByServer])
  {
    if (![v6 isDirectory]) {
      goto LABEL_29;
    }
    uint64_t v10 = [v6 appLibrary];
    __int16 v11 = [v10 mangledID];
    id v12 = +[BRCUserDefaults defaultsForMangledID:v11];
    char v13 = [v12 isBlacklistedFromFolderSharing];

    if ((v13 & 1) == 0)
    {
      id v25 = objc_alloc(MEMORY[0x1E4F1A2F8]);
      __int16 v26 = [v6 asShareableItem];
      __int16 v19 = (void *)[v25 initShareIDWithShareableItem:v26];

      __int16 v27 = [v6 asDirectory];
      __int16 v28 = [v27 folderRootStructureRecord];

      __int16 v29 = (void *)[objc_alloc(MEMORY[0x1E4F1A390]) initWithRootRecord:v28 shareID:v19];
      uint64_t v30 = [v6 st];
      __int16 v31 = [v30 logicalName];
      objc_msgSend(v29, "brc_updateWithLogicalName:isFolder:", v31, 1);

      __int16 v32 = [v6 serverZone];
      __int16 v33 = [v32 metadataSyncContext];
      __int16 v34 = [v33 ckContainerID];
      [v29 CKAssignToContainerWithID:v34];

      uint64_t v35 = brc_bread_crumbs();
      __int16 v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
LABEL_24:
        int v45 = 138413058;
        __int16 v46 = self;
        __int16 v47 = 2112;
        __int16 v48 = v29;
        __int16 v49 = 2112;
        uint64_t v50 = 0;
        __int16 v51 = 2112;
        uint64_t v52 = v35;
        _os_log_impl(&dword_1D353B000, v36, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v45, 0x2Au);
      }
    }
    else
    {
LABEL_29:
      if (![v6 isDocument] || objc_msgSend(v6, "isFinderBookmark"))
      {
        char v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          char v16 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", 0, 21);
          int v45 = 138413058;
          __int16 v46 = self;
          __int16 v47 = 2112;
          __int16 v48 = 0;
          __int16 v49 = 2112;
          uint64_t v50 = v16;
          __int16 v51 = 2112;
          uint64_t v52 = v14;
          _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v45, 0x2Au);
        }
        uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", 0, 21);
        goto LABEL_19;
      }
      id v37 = objc_alloc(MEMORY[0x1E4F1A2F8]);
      uint64_t v38 = [v6 asShareableItem];
      __int16 v19 = (void *)[v37 initShareIDWithShareableItem:v38];

      id v39 = [v6 asDocument];
      __int16 v28 = [v39 baseRecord];

      __int16 v29 = (void *)[objc_alloc(MEMORY[0x1E4F1A390]) initWithRootRecord:v28 shareID:v19];
      uint64_t v40 = [v6 st];
      __int16 v41 = [v40 logicalName];
      objc_msgSend(v29, "brc_updateWithLogicalName:isFolder:", v41, 0);

      __int16 v42 = [v6 serverZone];
      __int16 v43 = [v42 metadataSyncContext];
      __int16 v44 = [v43 ckContainerID];
      [v29 CKAssignToContainerWithID:v44];

      uint64_t v35 = brc_bread_crumbs();
      __int16 v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO)) {
        goto LABEL_24;
      }
    }

    v7[2](v7, v29, 0);
    goto LABEL_26;
  }
  if ([v6 isDocument])
  {
    uint64_t v18 = [v6 asDocument];
    __int16 v19 = [v18 uploadError];

    if (v19)
    {
      uint64_t v20 = brc_bread_crumbs();
      id v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v45 = 138413058;
        __int16 v46 = self;
        __int16 v47 = 2112;
        __int16 v48 = 0;
        __int16 v49 = 2112;
        uint64_t v50 = v19;
        __int16 v51 = 2112;
        uint64_t v52 = v20;
        _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v45, 0x2Au);
      }

      goto LABEL_20;
    }
  }
  int v22 = brc_bread_crumbs();
  uint64_t v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    __int16 v24 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", 0);
    int v45 = 138413058;
    __int16 v46 = self;
    __int16 v47 = 2112;
    __int16 v48 = 0;
    __int16 v49 = 2112;
    uint64_t v50 = v24;
    __int16 v51 = 2112;
    uint64_t v52 = v22;
    _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v45, 0x2Au);
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", 0);
LABEL_19:
  __int16 v19 = (void *)v17;
LABEL_20:
  ((void (**)(id, void *, void *))v7)[2](v7, 0, v19);
LABEL_26:
}

- (void)createSharingInfoForItemID:(id)a3 reply:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v23, 0, sizeof(v23));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient createSharingInfoForItemID:reply:]", 4390, v23);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v23[0];
    qos_class_t v11 = qos_class_self();
    id v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v25 = v10;
    __int16 v26 = 2112;
    __int16 v27 = self;
    __int16 v28 = 2112;
    __int16 v29 = v12;
    __int16 v30 = 2080;
    __int16 v31 = "-[BRCXPCRegularIPCsClient createSharingInfoForItemID:reply:]";
    __int16 v32 = 2112;
    __int16 v33 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  char v13 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v14 = [v13 isSharingProxyEntitled];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__BRCXPCRegularIPCsClient_createSharingInfoForItemID_reply___block_invoke;
  uint64_t v21[3] = &unk_1E69957B0;
  void v21[4] = self;
  id v15 = v7;
  id v22 = v15;
  char v16 = _brc_ipc_check_client_privilege(self, 1, v14, (uint64_t)"isSharingProxyEntitled", v21);

  if (v16)
  {
    uint64_t v17 = [(BRCAccountSession *)self->super.__session clientTruthWorkloop];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__BRCXPCRegularIPCsClient_createSharingInfoForItemID_reply___block_invoke_596;
    uint64_t v18[3] = &unk_1E69946C8;
    void v18[4] = self;
    id v19 = v6;
    id v20 = v15;
    dispatch_async_and_wait(v17, v18);
  }
  __brc_leave_section(v23);
}

void __60__BRCXPCRegularIPCsClient_createSharingInfoForItemID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    char v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__BRCXPCRegularIPCsClient_createSharingInfoForItemID_reply___block_invoke_596(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x1E4F594D0] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __60__BRCXPCRegularIPCsClient_createSharingInfoForItemID_reply___block_invoke_596_cold_1();
  }

  if (v4)
  {
    [*(id *)(a1 + 32) _createSharingInfoForLocalItem:v4 reply:*(void *)(a1 + 48)];
  }
  else
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      int v13 = 138413058;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v13, 0x2Au);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
}

- (void)_bumpLastUsedTimeOfSharedItem:(id)a3 clientZone:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a4 itemByItemID:v5];
  if (v6)
  {
    int v7 = [[BRCItemToPathLookup alloc] initWithItem:v6];
    uint64_t v8 = [(BRCItemToPathLookup *)v7 byFileSystemID];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 physicalURL];
      __int16 v15 = (BRCItemToPathLookup *)v5;
      FPUpdateLastUsedDate();

      uint64_t v11 = v15;
    }
    else
    {
      brc_bread_crumbs();
      uint64_t v11 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v6;
        __int16 v18 = 2112;
        __int16 v19 = v11;
        _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] can't resolve item to path lookup for %@%@", buf, 0x16u);
      }
    }
    [(BRCItemToPathLookup *)v7 closePaths];
  }
  else
  {
    int v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCXPCRegularIPCsClient _bumpLastUsedTimeOfSharedItem:clientZone:]();
    }

    brc_bread_crumbs();
    int v7 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      __int16 v19 = v7;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] can't find item with ID %@; last used date not bumped%@",
        buf,
        0x16u);
    }
  }
}

void __68__BRCXPCRegularIPCsClient__bumpLastUsedTimeOfSharedItem_clientZone___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      uint64_t v10 = a2;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl(&dword_1D353B000, v5, (os_log_type_t)0x90u, "[ERROR] can't bump last used date for %@; %@%@",
        (uint8_t *)&v7,
        0x20u);
    }
  }
  else
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __68__BRCXPCRegularIPCsClient__bumpLastUsedTimeOfSharedItem_clientZone___block_invoke_cold_1(a1);
    }
  }
}

- (void)startOperation:(id)a3 toSaveSharingInfo:(id)a4 reply:(id)a5
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v73 = a3;
  uint64_t v8 = (BRCXPCRegularIPCsClient *)a4;
  id v9 = a5;
  memset(v87, 0, sizeof(v87));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]", 4434, v87);
  uint64_t v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v87[0];
    qos_class_t v13 = qos_class_self();
    uint64_t v14 = BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v89 = (BRCXPCRegularIPCsClient *)v12;
    __int16 v90 = 2112;
    id v91 = self;
    __int16 v92 = 2112;
    uint64_t v93 = v14;
    __int16 v94 = 2080;
    __int16 v95 = "-[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]";
    __int16 v96 = 2112;
    __int16 v97 = v10;
    _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v15 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v16 = [v15 isSharingProxyEntitled];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke;
  v85[3] = &unk_1E69957B0;
  v85[4] = self;
  id v17 = v9;
  id v86 = v17;
  char v18 = _brc_ipc_check_client_privilege(self, 1, v16, (uint64_t)"isSharingProxyEntitled", v85);

  if ((v18 & 1) == 0) {
    goto LABEL_47;
  }
  if (!v8)
  {
    brc_bread_crumbs();
    uint64_t v35 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      id v37 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"share", 0);
      *(_DWORD *)buf = 138413058;
      id v89 = self;
      __int16 v90 = 2112;
      id v91 = 0;
      __int16 v92 = 2112;
      uint64_t v93 = v37;
      __int16 v94 = 2112;
      __int16 v95 = v35;
      _os_log_impl(&dword_1D353B000, v36, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v38 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"share", 0);
    (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v38);
    goto LABEL_46;
  }
  __int16 v19 = [(BRCXPCRegularIPCsClient *)v8 objectForKeyedSubscript:*MEMORY[0x1E4F19DD0]];
  int v20 = [v19 isEqual:*MEMORY[0x1E4F593B8]];

  if (v20)
  {
    memset(v84, 0, sizeof(v84));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]", 4445, v84);
    uint64_t v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = v84[0];
      qos_class_t v24 = qos_class_self();
      uint64_t v25 = BRCPrettyPrintEnumWithContext(v24, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219010;
      id v89 = (BRCXPCRegularIPCsClient *)v23;
      __int16 v90 = 2112;
      id v91 = self;
      __int16 v92 = 2112;
      uint64_t v93 = v25;
      __int16 v94 = 2080;
      __int16 v95 = "-[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]";
      __int16 v96 = 2112;
      __int16 v97 = v21;
      _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
    }
    __int16 v26 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
    char v27 = [v26 isFolderSharingProxyEntitled];
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke_599;
    v82[3] = &unk_1E69957B0;
    v82[4] = self;
    id v83 = v17;
    char v28 = _brc_ipc_check_client_privilege(self, 1, v27, (uint64_t)"isFolderSharingProxyEntitled", v82);

    __brc_leave_section(v84);
    if ((v28 & 1) == 0) {
      goto LABEL_47;
    }
  }
  if ([(BRCXPCRegularIPCsClient *)v8 publicPermission] != 1)
  {
LABEL_32:
    __int16 v46 = brc_bread_crumbs();
    __int16 v47 = brc_default_log();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]();
    }

    id v48 = objc_alloc(MEMORY[0x1E4F594E8]);
    __int16 v49 = [(BRCXPCRegularIPCsClient *)v8 recordID];
    uint64_t v50 = [v49 zoneID];
    uint64_t v38 = (void *)[v48 initWithRecordZoneID:v50];

    __int16 v51 = [(BRCXPCClient *)self session];
    uint64_t v52 = [v51 clientZoneByMangledID:v38];
    if (v52)
    {
      uint64_t v53 = [BRCSharingSaveShareOperation alloc];
      __int16 v54 = [v52 serverZone];
      __int16 v55 = [(BRCSharingSaveShareOperation *)v53 initWithShare:v8 zone:v54 sessionContext:v51];

      [(_BRCFrameworkOperation *)v55 setRemoteClientProxy:v73];
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke_602;
      v74[3] = &unk_1E699AC78;
      void v74[4] = self;
      id v77 = v17;
      id v56 = v8;
      __int16 v75 = v56;
      id v57 = v52;
      id v76 = v57;
      [(_BRCOperation *)v55 setFinishBlock:v74];
      if (v20)
      {
        int v58 = [v57 asPrivateClientZone];
        __int16 v59 = [(BRCXPCRegularIPCsClient *)v56 recordID];
        uint64_t v60 = objc_msgSend(v59, "brc_shareItemID");
        uint64_t v61 = [v58 pcsChainOperationForItemID:v60];

        if (v61)
        {
          uint64_t v62 = brc_bread_crumbs();
          uint64_t v63 = brc_default_log();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
            -[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]();
          }

          [(_BRCOperation *)v55 addDependency:v61];
        }
      }
      [v51 addMiscOperation:v55];
      [(_BRCOperation *)v55 schedule];
    }
    else
    {
      brc_bread_crumbs();
      long long v64 = (char *)objc_claimAutoreleasedReturnValue();
      long long v65 = brc_default_log();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        long long v66 = (void *)MEMORY[0x1E4F28C58];
        long long v67 = [v38 appLibraryOrZoneName];
        long long v68 = objc_msgSend(v66, "brc_errorAppLibraryNotFound:", v67);
        *(_DWORD *)buf = 138413058;
        id v89 = self;
        __int16 v90 = 2112;
        id v91 = 0;
        __int16 v92 = 2112;
        uint64_t v93 = v68;
        __int16 v94 = 2112;
        __int16 v95 = v64;
        _os_log_impl(&dword_1D353B000, v65, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
      id v69 = (void *)MEMORY[0x1E4F28C58];
      __int16 v55 = [v38 appLibraryOrZoneName];
      long long v70 = objc_msgSend(v69, "brc_errorAppLibraryNotFound:", v55);
      (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v70);
    }
LABEL_46:

    goto LABEL_47;
  }
  __int16 v29 = +[BRCUserDefaults defaultsForMangledID:0];
  if (![v29 deleteShareOnEmptySave])
  {
LABEL_31:

    goto LABEL_32;
  }
  __int16 v30 = [(BRCXPCRegularIPCsClient *)v8 participants];
  if ([v30 count])
  {
    __int16 v31 = [(BRCXPCRegularIPCsClient *)v8 participants];
    if ([v31 count] == 1)
    {
      __int16 v32 = [(BRCXPCRegularIPCsClient *)v8 participants];
      __int16 v33 = [v32 firstObject];
      if ([v33 isCurrentUser])
      {
        long long v72 = [(BRCXPCRegularIPCsClient *)v8 participants];
        uint64_t v34 = [v72 firstObject];
        BOOL v71 = [v34 role] == 1;

        if (!v71) {
          goto LABEL_32;
        }
        goto LABEL_20;
      }
    }
    goto LABEL_31;
  }

LABEL_20:
  id v39 = [(BRCXPCRegularIPCsClient *)v8 etag];

  if (v39)
  {
    brc_bread_crumbs();
    uint64_t v40 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
    __int16 v41 = brc_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v89 = v8;
      __int16 v90 = 2112;
      id v91 = v40;
      _os_log_impl(&dword_1D353B000, v41, OS_LOG_TYPE_DEFAULT, "[WARNING] Deleting share %@ because we're being asked to save a share with no participants%@", buf, 0x16u);
    }

    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke_600;
    uint64_t v78[3] = &unk_1E6995A80;
    __int16 v79 = v8;
    BOOL v80 = self;
    id v81 = v17;
    [(BRCXPCRegularIPCsClient *)self startOperation:v73 toUnshareShare:v79 forceDelete:1 reply:v78];

    uint64_t v38 = v79;
    goto LABEL_46;
  }
  __int16 v42 = brc_bread_crumbs();
  __int16 v43 = brc_default_log();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient startOperation:toSaveSharingInfo:reply:]();
  }

  brc_bread_crumbs();
  __int16 v44 = (char *)objc_claimAutoreleasedReturnValue();
  int v45 = brc_default_log();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v89 = self;
    __int16 v90 = 2112;
    id v91 = v8;
    __int16 v92 = 2112;
    uint64_t v93 = 0;
    __int16 v94 = 2112;
    __int16 v95 = v44;
    _os_log_impl(&dword_1D353B000, v45, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
  }

  (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v17 + 2))(v17, v8, 0);
LABEL_47:
  __brc_leave_section(v87);
}

void __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke_599(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke_600(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    [*(id *)(a1 + 32) setEtag:0];
    [*(id *)(a1 + 32) setKnownToServer:0];
  }
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138413058;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v8, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __66__BRCXPCRegularIPCsClient_startOperation_toSaveSharingInfo_reply___block_invoke_602(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      __int16 v10 = objc_msgSend(v6, "brc_wrappedError");
      int v17 = 138413058;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2112;
      qos_class_t v24 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v17, 0x2Au);
    }
    uint64_t v11 = *(void *)(a1 + 56);
    __int16 v12 = objc_msgSend(v6, "brc_wrappedError");
    (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 40) recordID];
    __int16 v12 = objc_msgSend(v13, "brc_shareItemID");

    [*(id *)(a1 + 32) _bumpLastUsedTimeOfSharedItem:v12 clientZone:*(void *)(a1 + 48)];
    __int16 v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 138413058;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = 0;
      __int16 v23 = 2112;
      qos_class_t v24 = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v17, 0x2Au);
    }

    (*(void (**)(void, id, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v5, 0);
  }
}

- (void)startOperation:(id)a3 toUnshareShare:(id)a4 forceDelete:(BOOL)a5 reply:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v10 = a4;
  id v11 = a6;
  memset(v67, 0, sizeof(v67));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toUnshareShare:forceDelete:reply:]", 4508, v67);
  __int16 v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v67[0];
    qos_class_t v15 = qos_class_self();
    uint64_t v16 = BRCPrettyPrintEnumWithContext(v15, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    id v69 = v16;
    __int16 v70 = 2080;
    BOOL v71 = "-[BRCXPCRegularIPCsClient startOperation:toUnshareShare:forceDelete:reply:]";
    __int16 v72 = 2112;
    id v73 = v12;
    _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  int v17 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v18 = [v17 isSharingProxyEntitled];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke;
  uint64_t v65[3] = &unk_1E69957B0;
  v65[4] = self;
  id v19 = v11;
  id v66 = v19;
  char v20 = _brc_ipc_check_client_privilege(self, 1, v18, (uint64_t)"isSharingProxyEntitled", v65);

  if (v20)
  {
    __int16 v21 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F19DD0]];
    int v22 = [v21 isEqual:*MEMORY[0x1E4F593B8]];

    if (!v22) {
      goto LABEL_8;
    }
    memset(v64, 0, sizeof(v64));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toUnshareShare:forceDelete:reply:]", 4513, v64);
    __int16 v23 = brc_bread_crumbs();
    qos_class_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = v64[0];
      qos_class_t v26 = qos_class_self();
      char v27 = BRCPrettyPrintEnumWithContext(v26, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      id v69 = v27;
      __int16 v70 = 2080;
      BOOL v71 = "-[BRCXPCRegularIPCsClient startOperation:toUnshareShare:forceDelete:reply:]";
      __int16 v72 = 2112;
      id v73 = v23;
      _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
    }
    char v28 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
    char v29 = [v28 isFolderSharingProxyEntitled];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke_603;
    v62[3] = &unk_1E69957B0;
    v62[4] = self;
    id v63 = v19;
    char v30 = _brc_ipc_check_client_privilege(self, 1, v29, (uint64_t)"isFolderSharingProxyEntitled", v62);

    __brc_leave_section(v64);
    if (v30)
    {
LABEL_8:
      __int16 v31 = brc_bread_crumbs();
      __int16 v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[BRCXPCRegularIPCsClient startOperation:toUnshareShare:forceDelete:reply:]();
      }

      __int16 v33 = [(BRCXPCClient *)self session];
      id v34 = objc_alloc(MEMORY[0x1E4F594E8]);
      uint64_t v35 = [v10 recordID];
      __int16 v36 = [v35 zoneID];
      id v37 = (void *)[v34 initWithRecordZoneID:v36];

      __int16 v54 = [v33 clientZoneByMangledID:v37];
      uint64_t v38 = [v54 serverZone];
      if (v38)
      {
        id v39 = +[BRCUserDefaults defaultsForMangledID:v37];
        int v40 = [v39 destroyiWorkShares];

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v69) = 1;
        if (!a5 && (([v38 isSharedZone] | v40) & 1) == 0)
        {
          __int16 v41 = [v10 recordID];
          __int16 v42 = objc_msgSend(v41, "brc_shareItemID");

          __int16 v43 = [v33 clientTruthWorkloop];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke_604;
          block[3] = &unk_1E6996D20;
          id v59 = v54;
          id v60 = v42;
          uint64_t v61 = buf;
          id v44 = v42;
          dispatch_async_and_wait(v43, block);
        }
        int v45 = [[BRCSharingDestroyShareOperation alloc] initWithShare:v10 zone:v38 sessionContext:v33];
        [(_BRCFrameworkOperation *)v45 setRemoteClientProxy:v55];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke_2;
        v56[3] = &unk_1E6996730;
        v56[4] = self;
        id v57 = v19;
        [(_BRCOperation *)v45 setFinishBlock:v56];
        [v33 addMiscOperation:v45];
        [(_BRCOperation *)v45 schedule];

        _Block_object_dispose(buf, 8);
      }
      else
      {
        __int16 v46 = brc_bread_crumbs();
        __int16 v47 = brc_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          id v48 = (void *)MEMORY[0x1E4F28C58];
          __int16 v49 = [v37 appLibraryOrZoneName];
          uint64_t v50 = objc_msgSend(v48, "brc_errorAppLibraryNotFound:", v49);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v50;
          *(_WORD *)&buf[22] = 2112;
          id v69 = v46;
          _os_log_impl(&dword_1D353B000, v47, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
        }
        __int16 v51 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v52 = [v37 appLibraryOrZoneName];
        uint64_t v53 = objc_msgSend(v51, "brc_errorAppLibraryNotFound:", v52);
        (*((void (**)(id, void *))v19 + 2))(v19, v53);
      }
    }
  }
  __brc_leave_section(v67);
}

void __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke_603(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke_604(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  id v2 = [v4 st];
  int v3 = [v2 iWorkShareable];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __75__BRCXPCRegularIPCsClient_startOperation_toUnshareShare_forceDelete_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = objc_msgSend(v4, "brc_wrappedError");
    int v11 = 138412802;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = objc_msgSend(v4, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

- (void)startOperation:(id)a3 toLookupShareParticipants:(id)a4 reply:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v28, 0, sizeof(v28));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toLookupShareParticipants:reply:]", 4554, v28);
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v28[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v30 = v13;
    __int16 v31 = 2112;
    __int16 v32 = self;
    __int16 v33 = 2112;
    id v34 = v15;
    __int16 v35 = 2080;
    __int16 v36 = "-[BRCXPCRegularIPCsClient startOperation:toLookupShareParticipants:reply:]";
    __int16 v37 = 2112;
    uint64_t v38 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingProxyEntitled];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__BRCXPCRegularIPCsClient_startOperation_toLookupShareParticipants_reply___block_invoke;
  uint64_t v26[3] = &unk_1E69957B0;
  void v26[4] = self;
  id v18 = v10;
  id v27 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 0, v17, (uint64_t)"isSharingProxyEntitled", v26);

  if (v19)
  {
    char v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient startOperation:toLookupShareParticipants:reply:]();
    }

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__BRCXPCRegularIPCsClient_startOperation_toLookupShareParticipants_reply___block_invoke_606;
    uint64_t v22[3] = &unk_1E699ACA0;
    uint8_t v22[4] = self;
    id v25 = v18;
    id v23 = v9;
    id v24 = v8;
    [(BRCXPCClient *)self performBlockWithAnySession:v22];
  }
  __brc_leave_section(v28);
}

void __74__BRCXPCRegularIPCsClient_startOperation_toLookupShareParticipants_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    qos_class_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74__BRCXPCRegularIPCsClient_startOperation_toLookupShareParticipants_reply___block_invoke_606(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [[BRCSharingLookupParticipantsOperation alloc] initWithUserIdentities:*(void *)(a1 + 40) session:v3];
    [(_BRCFrameworkOperation *)v4 setRemoteClientProxy:*(void *)(a1 + 48)];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __74__BRCXPCRegularIPCsClient_startOperation_toLookupShareParticipants_reply___block_invoke_608;
    __int16 v13 = &unk_1E6996730;
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 56);
    [(_BRCOperation *)v4 setFinishBlock:&v10];
    objc_msgSend(v3, "addMiscOperation:", v4, v10, v11, v12, v13, v14);
    [(_BRCOperation *)v4 schedule];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
      *(_DWORD *)buf = 138413058;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      __int16 v20 = 2112;
      __int16 v21 = v8;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
    id v4 = (BRCSharingLookupParticipantsOperation *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, BRCSharingLookupParticipantsOperation *))(v9 + 16))(v9, 0, v4);
  }
}

void __74__BRCXPCRegularIPCsClient_startOperation_toLookupShareParticipants_reply___block_invoke_608(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(v6, "brc_wrappedError");
    int v13 = 138413058;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    __int16 v19 = 2112;
    __int16 v20 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
}

- (void)_startOperation:(id)a3 toModifyRecordAccessWithLocalItem:(id)a4 allowAccess:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient _startOperation:toModifyRecordAccessWithLocalItem:allowAccess:reply:]();
  }

  if ([v11 isDocument])
  {
    __int16 v15 = [BRCSharingModifyAccessOperation alloc];
    id v16 = [v11 asDocument];
    __int16 v17 = [(BRCXPCClient *)self session];
    __int16 v18 = [(BRCSharingModifyAccessOperation *)v15 initWithItem:v16 allowAccess:v7 sessionContext:v17];

    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __95__BRCXPCRegularIPCsClient__startOperation_toModifyRecordAccessWithLocalItem_allowAccess_reply___block_invoke;
    id v25 = &unk_1E6999728;
    qos_class_t v26 = self;
    id v27 = v12;
    [(_BRCOperation *)v18 setFinishBlock:&v22];
    -[BRCXPCClient _startSharingOperationAfterAcceptation:client:item:](self, "_startSharingOperationAfterAcceptation:client:item:", v18, v10, v11, v22, v23, v24, v25, v26);
  }
  else
  {
    __int16 v19 = brc_bread_crumbs();
    __int16 v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotShareable");
      *(_DWORD *)buf = 138413314;
      char v29 = self;
      __int16 v30 = 2112;
      uint64_t v31 = 0;
      __int16 v32 = 2112;
      uint64_t v33 = 0;
      __int16 v34 = 2112;
      __int16 v35 = v21;
      __int16 v36 = 2112;
      __int16 v37 = v19;
      _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotShareable");
    __int16 v18 = (BRCSharingModifyAccessOperation *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, BRCSharingModifyAccessOperation *))v12 + 2))(v12, 0, 0, v18);
  }
}

void __95__BRCXPCRegularIPCsClient__startOperation_toModifyRecordAccessWithLocalItem_allowAccess_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [v5 objectForKeyedSubscript:@"accessToken"];
    id v11 = [v5 objectForKeyedSubscript:@"referenceIdentifier"];
    id v12 = objc_msgSend(v6, "brc_wrappedError");
    int v17 = 138413314;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    __int16 v20 = v10;
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    qos_class_t v26 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v17, 0x34u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = [v5 objectForKeyedSubscript:@"accessToken"];
  __int16 v15 = [v5 objectForKeyedSubscript:@"referenceIdentifier"];
  id v16 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *, void *))(v13 + 16))(v13, v14, v15, v16);
}

- (void)startOperation:(id)a3 toModifyRecordAccessWithItemID:(id)a4 allowAccess:(BOOL)a5 reply:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toModifyRecordAccessWithItemID:allowAccess:reply:]", 4590, v30);
  uint64_t v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v30[0];
    qos_class_t v16 = qos_class_self();
    int v17 = BRCPrettyPrintEnumWithContext(v16, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v32 = v15;
    __int16 v33 = 2112;
    __int16 v34 = self;
    __int16 v35 = 2112;
    __int16 v36 = v17;
    __int16 v37 = 2080;
    uint64_t v38 = "-[BRCXPCRegularIPCsClient startOperation:toModifyRecordAccessWithItemID:allowAccess:reply:]";
    __int16 v39 = 2112;
    int v40 = v13;
    _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v18 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v19 = [v18 isSharingProxyEntitled];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__BRCXPCRegularIPCsClient_startOperation_toModifyRecordAccessWithItemID_allowAccess_reply___block_invoke;
  uint64_t v28[3] = &unk_1E69957B0;
  void v28[4] = self;
  id v20 = v12;
  id v29 = v20;
  char v21 = _brc_ipc_check_client_privilege(self, 1, v19, (uint64_t)"isSharingProxyEntitled", v28);

  if (v21)
  {
    uint64_t v22 = [(BRCAccountSession *)self->super.__session clientTruthWorkloop];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __91__BRCXPCRegularIPCsClient_startOperation_toModifyRecordAccessWithItemID_allowAccess_reply___block_invoke_617;
    uint64_t v23[3] = &unk_1E699ACC8;
    void v23[4] = self;
    id v24 = v11;
    id v26 = v20;
    id v25 = v10;
    BOOL v27 = a5;
    dispatch_async_and_wait(v22, v23);
  }
  __brc_leave_section(v30);
}

void __91__BRCXPCRegularIPCsClient_startOperation_toModifyRecordAccessWithItemID_allowAccess_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    qos_class_t v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __91__BRCXPCRegularIPCsClient_startOperation_toModifyRecordAccessWithItemID_allowAccess_reply___block_invoke_617(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x1E4F594D0] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4)
  {
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toModifyRecordAccessWithLocalItem:v4 allowAccess:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 56)];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      int v11 = 138413314;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = 0;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v11, 0x34u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v10);
  }
}

- (void)_startOperation:(id)a3 toCopyParticipantTokenWithLocalItem:(id)a4 reply:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient _startOperation:toCopyParticipantTokenWithLocalItem:reply:]();
  }

  if (([v9 sharingOptions] & 0x48) != 0)
  {
    __int16 v13 = [BRCSharingCopyParticipantTokenOperation alloc];
    uint64_t v14 = [v9 asDocument];
    __int16 v15 = [(BRCXPCClient *)self session];
    uint64_t v16 = [(BRCSharingCopyParticipantTokenOperation *)v13 initWithItem:v14 sessionContext:v15];

    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __85__BRCXPCRegularIPCsClient__startOperation_toCopyParticipantTokenWithLocalItem_reply___block_invoke;
    __int16 v23 = &unk_1E6996730;
    id v24 = self;
    id v25 = v10;
    [(_BRCOperation *)v16 setFinishBlock:&v20];
    -[BRCXPCClient _startSharingOperationAfterAcceptation:client:item:](self, "_startSharingOperationAfterAcceptation:client:item:", v16, v8, v9, v20, v21, v22, v23, v24);
  }
  else
  {
    __int16 v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorDocumentIsNotSharedAtIdentifier:", 0);
      *(_DWORD *)buf = 138413314;
      BOOL v27 = self;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      __int16 v30 = 2112;
      uint64_t v31 = 0;
      __int16 v32 = 2112;
      __int16 v33 = v19;
      __int16 v34 = 2112;
      __int16 v35 = v17;
      _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorDocumentIsNotSharedAtIdentifier:", 0);
    uint64_t v16 = (BRCSharingCopyParticipantTokenOperation *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, BRCSharingCopyParticipantTokenOperation *))v10 + 2))(v10, 0, 0, v16);
  }
}

void __85__BRCXPCRegularIPCsClient__startOperation_toCopyParticipantTokenWithLocalItem_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"participantKey"];
  id v8 = [v6 objectForKeyedSubscript:@"baseToken"];

  id v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = objc_msgSend(v5, "brc_wrappedError");
    int v15 = 138413314;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v12;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v15, 0x34u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = objc_msgSend(v5, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *, void *))(v13 + 16))(v13, v7, v8, v14);
}

- (void)startOperation:(id)a3 toCopyParticipantTokenWithItemID:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopyParticipantTokenWithItemID:reply:]", 4626, v27);
  uint64_t v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v27[0];
    qos_class_t v14 = qos_class_self();
    int v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    __int16 v33 = v15;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient startOperation:toCopyParticipantTokenWithItemID:reply:]";
    __int16 v36 = 2112;
    __int16 v37 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingPrivateInterfaceEntitled];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__BRCXPCRegularIPCsClient_startOperation_toCopyParticipantTokenWithItemID_reply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v18 = v10;
  id v26 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingPrivateInterfaceEntitled", v25);

  if (v19)
  {
    uint64_t v20 = [(BRCAccountSession *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__BRCXPCRegularIPCsClient_startOperation_toCopyParticipantTokenWithItemID_reply___block_invoke_625;
    block[3] = &unk_1E69958F0;
    void block[4] = self;
    id v22 = v9;
    id v24 = v18;
    id v23 = v8;
    dispatch_async_and_wait(v20, block);
  }
  __brc_leave_section(v27);
}

void __81__BRCXPCRegularIPCsClient_startOperation_toCopyParticipantTokenWithItemID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__BRCXPCRegularIPCsClient_startOperation_toCopyParticipantTokenWithItemID_reply___block_invoke_625(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x1E4F594D0] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4)
  {
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toCopyParticipantTokenWithLocalItem:v4 reply:*(void *)(a1 + 56)];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      int v11 = 138413314;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = 0;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v11, 0x34u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v10);
  }
}

- (void)_startOperation:(id)a3 toPrepFolderForSharingWithLocalItem:(id)a4 reply:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v7 = a4;
  int v58 = (void (**)(id, void *))a5;
  uint64_t v65 = 0;
  id v66 = (double *)&v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceReferenceDate];
  uint64_t v10 = v9;

  uint64_t v68 = v10;
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient _startOperation:toPrepFolderForSharingWithLocalItem:reply:]();
  }

  id v57 = +[BRCEventsAnalytics sharedAnalytics];
  if (([v7 isDirectory] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", 0, 2);
    id v18 = (BRCSharingPCSChainFolderOperation *)objc_claimAutoreleasedReturnValue();
    id v23 = +[BRCUserDefaults defaultsForMangledID:0];
    int v24 = [v23 reportXPCErrorOnPCSChain];

    if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F1C9C8] date];
      [v25 timeIntervalSinceReferenceDate];
      double v27 = v26;
      double v28 = v66[3];

      uint64_t v29 = [v7 clientZone];
      __int16 v30 = [v29 mangledID];
      uint64_t v31 = [v7 clientZone];
      uint64_t v32 = [v31 enhancedDrivePrivacyEnabled];
      __int16 v33 = [v7 itemID];
      __int16 v34 = [v33 itemIDString];
      __int16 v35 = [(BRCXPCClient *)self session];
      __int16 v36 = [v35 analyticsReporter];
      [v57 registerAndSendNewFolderSharePCSChainingTime:MEMORY[0x1E4F1CC28] chainedRecordsCount:v30 zoneMangledID:v32 enhancedDrivePrivacyEnabled:v34 itemIDString:v18 error:v36 analyticsReporter:v27 - v28];
    }
    __int16 v37 = brc_bread_crumbs();
    uint64_t v38 = brc_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v70 = self;
      __int16 v71 = 2112;
      __int16 v72 = v18;
      __int16 v73 = 2112;
      uint64_t v74 = v37;
      _os_log_impl(&dword_1D353B000, v38, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  if (([v7 isKnownByServer] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotInCloud:", 0);
    id v18 = (BRCSharingPCSChainFolderOperation *)objc_claimAutoreleasedReturnValue();
    __int16 v39 = +[BRCUserDefaults defaultsForMangledID:0];
    int v40 = [v39 reportXPCErrorOnPCSChain];

    if (v40)
    {
      uint64_t v41 = [MEMORY[0x1E4F1C9C8] date];
      [v41 timeIntervalSinceReferenceDate];
      double v43 = v42;
      double v44 = v66[3];

      int v45 = [v7 clientZone];
      __int16 v46 = [v45 mangledID];
      __int16 v47 = [v7 clientZone];
      uint64_t v48 = [v47 enhancedDrivePrivacyEnabled];
      __int16 v49 = [v7 itemID];
      uint64_t v50 = [v49 itemIDString];
      __int16 v51 = [(BRCXPCClient *)self session];
      uint64_t v52 = [v51 analyticsReporter];
      [v57 registerAndSendNewFolderSharePCSChainingTime:MEMORY[0x1E4F1CC28] chainedRecordsCount:v46 zoneMangledID:v48 enhancedDrivePrivacyEnabled:v50 itemIDString:v18 error:v52 analyticsReporter:v43 - v44];
    }
    __int16 v37 = brc_bread_crumbs();
    uint64_t v38 = brc_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v70 = self;
      __int16 v71 = 2112;
      __int16 v72 = v18;
      __int16 v73 = 2112;
      uint64_t v74 = v37;
      _os_log_impl(&dword_1D353B000, v38, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
LABEL_16:

    v58[2](v58, v18);
    goto LABEL_17;
  }
  __int16 v13 = [BRCSharingPCSChainFolderOperation alloc];
  uint64_t v14 = [v7 asDirectory];
  __int16 v15 = [(BRCXPCClient *)self session];
  uint64_t v16 = [(BRCXPCClient *)self session];
  uint64_t v17 = [v16 syncUpScheduler];
  id v18 = [(BRCSharingPCSChainFolderOperation *)v13 initWithItem:v14 sessionContext:v15 syncUpCallback:v17];

  [(_BRCFrameworkOperation *)v18 setRemoteClientProxy:v55];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __85__BRCXPCRegularIPCsClient__startOperation_toPrepFolderForSharingWithLocalItem_reply___block_invoke;
  v59[3] = &unk_1E699ACF0;
  long long v64 = &v65;
  id v60 = v57;
  id v19 = v7;
  id v61 = v19;
  uint64_t v62 = self;
  id v63 = v58;
  [(_BRCOperation *)v18 setFinishBlock:v59];
  uint64_t v20 = [v19 clientZone];
  LOBYTE(v17) = [v20 isPrivateZone];

  if ((v17 & 1) == 0)
  {
    uint64_t v53 = brc_bread_crumbs();
    __int16 v54 = brc_default_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
      -[BRCXPCRegularIPCsClient _startOperation:toPrepFolderForSharingWithLocalItem:reply:]();
    }
  }
  uint64_t v21 = [v19 clientZone];
  id v22 = [v21 asPrivateClientZone];
  [v22 registerPCSChainingOperation:v18];

  [(_BRCOperation *)v18 schedule];
LABEL_17:

  _Block_object_dispose(&v65, 8);
}

void __85__BRCXPCRegularIPCsClient__startOperation_toPrepFolderForSharingWithLocalItem_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a2;
  id v7 = [v5 date];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8 - *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

  int v24 = *(void **)(a1 + 32);
  uint64_t v10 = [*(id *)(a1 + 40) clientZone];
  int v11 = [v10 mangledID];
  uint64_t v12 = [*(id *)(a1 + 40) clientZone];
  uint64_t v13 = [v12 enhancedDrivePrivacyEnabled];
  uint64_t v14 = [*(id *)(a1 + 40) itemID];
  __int16 v15 = [v14 itemIDString];
  uint64_t v16 = [*(id *)(a1 + 48) session];
  uint64_t v17 = [v16 analyticsReporter];
  [v24 registerAndSendNewFolderSharePCSChainingTime:v6 chainedRecordsCount:v11 zoneMangledID:v13 enhancedDrivePrivacyEnabled:v15 itemIDString:v25 error:v17 analyticsReporter:v9];

  id v18 = brc_bread_crumbs();
  id v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = objc_msgSend(v25, "brc_wrappedError");
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v20;
    __int16 v28 = 2112;
    uint64_t v29 = v21;
    __int16 v30 = 2112;
    uint64_t v31 = v18;
    _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }
  uint64_t v22 = *(void *)(a1 + 56);
  id v23 = objc_msgSend(v25, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);
}

- (void)startOperation:(id)a3 toPrepFolderForSharingWithItemID:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toPrepFolderForSharingWithItemID:reply:]", 4695, v27);
  int v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v27[0];
    qos_class_t v14 = qos_class_self();
    __int16 v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    __int16 v33 = v15;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRCXPCRegularIPCsClient startOperation:toPrepFolderForSharingWithItemID:reply:]";
    __int16 v36 = 2112;
    __int16 v37 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingPrivateInterfaceEntitled];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__BRCXPCRegularIPCsClient_startOperation_toPrepFolderForSharingWithItemID_reply___block_invoke;
  uint64_t v25[3] = &unk_1E69957B0;
  void v25[4] = self;
  id v18 = v10;
  id v26 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingPrivateInterfaceEntitled", v25);

  if (v19)
  {
    uint64_t v20 = [(BRCAccountSession *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__BRCXPCRegularIPCsClient_startOperation_toPrepFolderForSharingWithItemID_reply___block_invoke_627;
    block[3] = &unk_1E69958F0;
    void block[4] = self;
    id v22 = v9;
    id v24 = v18;
    id v23 = v8;
    dispatch_async_and_wait(v20, block);
  }
  __brc_leave_section(v27);
}

void __81__BRCXPCRegularIPCsClient_startOperation_toPrepFolderForSharingWithItemID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__BRCXPCRegularIPCsClient_startOperation_toPrepFolderForSharingWithItemID_reply___block_invoke_627(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x1E4F594D0] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4)
  {
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toPrepFolderForSharingWithLocalItem:v4 reply:*(void *)(a1 + 56)];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      qos_class_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

- (void)_startOperation:(id)a3 toProcessSubitemsWithLocalItem:(id)a4 maxSubsharesFailures:(unint64_t)a5 processType:(unint64_t)a6 reply:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  __int16 v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient _startOperation:toProcessSubitemsWithLocalItem:maxSubsharesFailures:processType:reply:]();
  }

  if ([v13 isDirectory])
  {
    uint64_t v17 = [BRCSharingProcessFolderSubitemsOperation alloc];
    id v18 = [v13 asDirectory];
    char v19 = [(BRCXPCClient *)self session];
    uint64_t v20 = [(BRCSharingProcessFolderSubitemsOperation *)v17 initWithItem:v18 sessionContext:v19 processType:a6 maxSubitemsToFail:a5];

    [(_BRCFrameworkOperation *)v20 setRemoteClientProxy:v12];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __113__BRCXPCRegularIPCsClient__startOperation_toProcessSubitemsWithLocalItem_maxSubsharesFailures_processType_reply___block_invoke;
    __int16 v28 = &unk_1E6996730;
    uint64_t v29 = self;
    id v30 = v14;
    [(_BRCOperation *)v20 setFinishBlock:&v25];
    uint64_t v21 = [(BRCXPCClient *)self session];
    [v21 addMiscOperation:v20];

    [(_BRCOperation *)v20 schedule];
  }
  else
  {
    id v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", 0, 2);
      *(_DWORD *)buf = 138412802;
      __int16 v32 = self;
      __int16 v33 = 2112;
      __int16 v34 = v24;
      __int16 v35 = 2112;
      __int16 v36 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNoDocument:underlyingPOSIXError:", 0, 2);
    uint64_t v20 = (BRCSharingProcessFolderSubitemsOperation *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, BRCSharingProcessFolderSubitemsOperation *))v14 + 2))(v14, v20);
  }
}

void __113__BRCXPCRegularIPCsClient__startOperation_toProcessSubitemsWithLocalItem_maxSubsharesFailures_processType_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = objc_msgSend(v4, "brc_wrappedError");
    int v11 = 138412802;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = objc_msgSend(v4, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

- (void)startOperation:(id)a3 toProcessSubitemsWithItemID:(id)a4 maxSubsharesFailures:(unint64_t)a5 processType:(unint64_t)a6 reply:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  memset(v38, 0, sizeof(v38));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toProcessSubitemsWithItemID:maxSubsharesFailures:processType:reply:]", 4732, v38);
  __int16 v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v29 = v14;
    id v17 = v13;
    id v18 = v12;
    unint64_t v19 = a5;
    unint64_t v20 = a6;
    uint64_t v21 = v38[0];
    qos_class_t v22 = qos_class_self();
    id v23 = BRCPrettyPrintEnumWithContext(v22, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v40 = v21;
    __int16 v41 = 2112;
    double v42 = self;
    __int16 v43 = 2112;
    double v44 = v23;
    __int16 v45 = 2080;
    __int16 v46 = "-[BRCXPCRegularIPCsClient startOperation:toProcessSubitemsWithItemID:maxSubsharesFailures:processType:reply:]";
    __int16 v47 = 2112;
    uint64_t v48 = v15;
    _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    a6 = v20;
    a5 = v19;
    id v12 = v18;
    id v13 = v17;
    id v14 = v29;
  }

  id v24 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v25 = [v24 isFolderSharingProxyEntitled];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __109__BRCXPCRegularIPCsClient_startOperation_toProcessSubitemsWithItemID_maxSubsharesFailures_processType_reply___block_invoke;
  uint64_t v36[3] = &unk_1E69957B0;
  void v36[4] = self;
  id v26 = v14;
  id v37 = v26;
  char v27 = _brc_ipc_check_client_privilege(self, 1, v25, (uint64_t)"isFolderSharingProxyEntitled", v36);

  if (v27)
  {
    __int16 v28 = [(BRCAccountSession *)self->super.__session clientTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__BRCXPCRegularIPCsClient_startOperation_toProcessSubitemsWithItemID_maxSubsharesFailures_processType_reply___block_invoke_629;
    block[3] = &unk_1E699AD18;
    void block[4] = self;
    id v31 = v13;
    id v33 = v26;
    id v32 = v12;
    unint64_t v34 = a5;
    unint64_t v35 = a6;
    dispatch_async_and_wait(v28, block);
  }
  __brc_leave_section(v38);
}

void __109__BRCXPCRegularIPCsClient_startOperation_toProcessSubitemsWithItemID_maxSubsharesFailures_processType_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __109__BRCXPCRegularIPCsClient_startOperation_toProcessSubitemsWithItemID_maxSubsharesFailures_processType_reply___block_invoke_629(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) session];
  id v3 = [MEMORY[0x1E4F594D0] fileObjectIDWithString:*(void *)(a1 + 40)];
  id v4 = [v2 itemByFileObjectID:v3];

  if (v4)
  {
    [*(id *)(a1 + 32) _startOperation:*(void *)(a1 + 48) toProcessSubitemsWithLocalItem:v4 maxSubsharesFailures:*(void *)(a1 + 64) processType:*(void *)(a1 + 72) reply:*(void *)(a1 + 56)];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemNotFound:", *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

- (void)startOperation:(id)a3 toAcceptShareLink:(id)a4 skipAcceptDialogs:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  memset(v45, 0, sizeof(v45));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toAcceptShareLink:skipAcceptDialogs:reply:]", 4749, v45);
  __int16 v13 = brc_bread_crumbs();
  id v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v45[0];
    qos_class_t v16 = qos_class_self();
    uint64_t v17 = BRCPrettyPrintEnumWithContext(v16, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v47 = (BRCXPCRegularIPCsClient *)v15;
    __int16 v48 = 2112;
    uint64_t v49 = self;
    __int16 v50 = 2112;
    __int16 v51 = v17;
    __int16 v52 = 2080;
    uint64_t v53 = "-[BRCXPCRegularIPCsClient startOperation:toAcceptShareLink:skipAcceptDialogs:reply:]";
    __int16 v54 = 2112;
    id v55 = v13;
    _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  id v18 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v19 = [v18 isSharingPrivateInterfaceEntitled];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __84__BRCXPCRegularIPCsClient_startOperation_toAcceptShareLink_skipAcceptDialogs_reply___block_invoke;
  uint64_t v43[3] = &unk_1E69957B0;
  void v43[4] = self;
  id v20 = v12;
  id v44 = v20;
  char v21 = _brc_ipc_check_client_privilege(self, 1, v19, (uint64_t)"isSharingPrivateInterfaceEntitled", v43);

  if (v21)
  {
    if (!v7) {
      goto LABEL_8;
    }
    memset(v42, 0, sizeof(v42));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toAcceptShareLink:skipAcceptDialogs:reply:]", 4754, v42);
    qos_class_t v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = v42[0];
      qos_class_t v25 = qos_class_self();
      id v26 = BRCPrettyPrintEnumWithContext(v25, (uint64_t)&brc_qos_entries, 0);
      *(_DWORD *)buf = 134219010;
      __int16 v47 = (BRCXPCRegularIPCsClient *)v24;
      __int16 v48 = 2112;
      uint64_t v49 = self;
      __int16 v50 = 2112;
      __int16 v51 = v26;
      __int16 v52 = 2080;
      uint64_t v53 = "-[BRCXPCRegularIPCsClient startOperation:toAcceptShareLink:skipAcceptDialogs:reply:]";
      __int16 v54 = 2112;
      id v55 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
    }
    char v27 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
    char v28 = [v27 isAutomationEntitled];
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    uint64_t v38 = __84__BRCXPCRegularIPCsClient_startOperation_toAcceptShareLink_skipAcceptDialogs_reply___block_invoke_631;
    __int16 v39 = &unk_1E69957B0;
    uint64_t v40 = self;
    id v41 = v20;
    char v29 = _brc_ipc_check_client_privilege(self, 1, v28, (uint64_t)"isAutomationEntitled", &v36);

    __brc_leave_section(v42);
    if (v29)
    {
LABEL_8:
      id v30 = +[BRCDaemon daemon];
      [v30 registerWaiterBlock:v20 forShareURL:v11];

      id v31 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      if (([v31 openURL:v11 withOptions:0] & 1) == 0)
      {
        brc_bread_crumbs();
        id v32 = (char *)objc_claimAutoreleasedReturnValue();
        id v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          unint64_t v34 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
          *(_DWORD *)buf = 138413058;
          __int16 v47 = self;
          __int16 v48 = 2112;
          uint64_t v49 = 0;
          __int16 v50 = 2112;
          __int16 v51 = v34;
          __int16 v52 = 2112;
          uint64_t v53 = v32;
          _os_log_impl(&dword_1D353B000, v33, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }
        unint64_t v35 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
        (*((void (**)(id, void, void *))v20 + 2))(v20, 0, v35);
      }
    }
  }
  __brc_leave_section(v45);
}

void __84__BRCXPCRegularIPCsClient_startOperation_toAcceptShareLink_skipAcceptDialogs_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__BRCXPCRegularIPCsClient_startOperation_toAcceptShareLink_skipAcceptDialogs_reply___block_invoke_631(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startOperation:(id)a3 toCopyShareURLForShare:(id)a4 reply:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v35, 0, sizeof(v35));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient startOperation:toCopyShareURLForShare:reply:]", 4792, v35);
  __int16 v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v35[0];
    qos_class_t v14 = qos_class_self();
    uint64_t v15 = BRCPrettyPrintEnumWithContext(v14, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v37 = v13;
    __int16 v38 = 2112;
    __int16 v39 = self;
    __int16 v40 = 2112;
    id v41 = v15;
    __int16 v42 = 2080;
    __int16 v43 = "-[BRCXPCRegularIPCsClient startOperation:toCopyShareURLForShare:reply:]";
    __int16 v44 = 2112;
    __int16 v45 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  qos_class_t v16 = [(BRCXPCClient *)self clientPriviledgesDescriptor];
  char v17 = [v16 isSharingProxyEntitled];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __71__BRCXPCRegularIPCsClient_startOperation_toCopyShareURLForShare_reply___block_invoke;
  uint64_t v33[3] = &unk_1E69957B0;
  void v33[4] = self;
  id v18 = v10;
  id v34 = v18;
  char v19 = _brc_ipc_check_client_privilege(self, 1, v17, (uint64_t)"isSharingProxyEntitled", v33);

  if (v19)
  {
    id v20 = brc_bread_crumbs();
    char v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCRegularIPCsClient startOperation:toCopyShareURLForShare:reply:]();
    }

    qos_class_t v22 = [(BRCXPCClient *)self session];
    id v23 = objc_alloc(MEMORY[0x1E4F594E8]);
    uint64_t v24 = [v9 recordID];
    qos_class_t v25 = [v24 zoneID];
    id v26 = (void *)[v23 initWithRecordZoneID:v25];

    char v27 = [v22 clientZoneByMangledID:v26];
    char v28 = [BRCSharingCopyShareURLOperation alloc];
    char v29 = [v27 serverZone];
    id v30 = [(BRCSharingCopyShareURLOperation *)v28 initWithShare:v9 zone:v29 sessionContext:v22];

    [(_BRCFrameworkOperation *)v30 setRemoteClientProxy:v8];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __71__BRCXPCRegularIPCsClient_startOperation_toCopyShareURLForShare_reply___block_invoke_634;
    uint64_t v31[3] = &unk_1E6996730;
    v31[4] = self;
    id v32 = v18;
    [(_BRCOperation *)v30 setFinishBlock:v31];
    [v22 addMiscOperation:v30];
    [(_BRCOperation *)v30 schedule];
  }
  __brc_leave_section(v35);
}

void __71__BRCXPCRegularIPCsClient_startOperation_toCopyShareURLForShare_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413314;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    qos_class_t v16 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v7, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__BRCXPCRegularIPCsClient_startOperation_toCopyShareURLForShare_reply___block_invoke_634(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v5 objectForKeyedSubscript:@"share"];
    __int16 v11 = [v5 objectForKeyedSubscript:@"url"];
    uint64_t v12 = objc_msgSend(v6, "brc_wrappedError");
    int v17 = 138413314;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    qos_class_t v22 = v11;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@)%@", (uint8_t *)&v17, 0x34u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = [v5 objectForKeyedSubscript:@"share"];
  __int16 v15 = [v5 objectForKeyedSubscript:@"url"];
  qos_class_t v16 = objc_msgSend(v6, "brc_wrappedError");
  (*(void (**)(uint64_t, void *, void *, void *))(v13 + 16))(v13, v14, v15, v16);
}

- (void)getShareOptionsOfItemIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v36, 0, sizeof(v36));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getShareOptionsOfItemIdentifier:reply:]", 4813, v36);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v36[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v38 = v10;
    __int16 v39 = 2112;
    __int16 v40 = self;
    __int16 v41 = 2112;
    id v42 = v12;
    __int16 v43 = 2080;
    __int16 v44 = "-[BRCXPCRegularIPCsClient getShareOptionsOfItemIdentifier:reply:]";
    __int16 v45 = 2112;
    uint64_t v46 = (uint64_t)v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke;
  uint64_t v34[3] = &unk_1E69957B0;
  void v34[4] = self;
  id v13 = v7;
  id v35 = v13;
  int v14 = _brc_ipc_check_applibrary_proxy(self, 1, v34);

  if (v14)
  {
    memset(v33, 0, sizeof(v33));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient getShareOptionsOfItemIdentifier:reply:]", 4815, v33);
    __int16 v15 = brc_bread_crumbs();
    qos_class_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v33[0];
      qos_class_t v18 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v18, (uint64_t)&brc_qos_entries, 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v6 UTF8String];
      *(_DWORD *)buf = 134219266;
      uint64_t v38 = v17;
      __int16 v39 = 2112;
      __int16 v40 = self;
      __int16 v41 = 2112;
      id v42 = v19;
      __int16 v43 = 2080;
      __int16 v44 = "-[BRCXPCRegularIPCsClient getShareOptionsOfItemIdentifier:reply:]";
      __int16 v45 = 2080;
      uint64_t v46 = v20;
      __int16 v47 = 2112;
      __int16 v48 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s Getting sharing options for %s%@", buf, 0x3Eu);
    }
    __int16 v21 = [(BRCXPCClient *)self session];
    tracker = self->super._tracker;
    __int16 v23 = [v21 clientDB];
    uint64_t v24 = [v23 serialQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_638;
    uint64_t v28[3] = &unk_1E6993D18;
    id v29 = v6;
    id v25 = v21;
    id v30 = v25;
    id v31 = self;
    id v32 = v13;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_642;
    uint64_t v26[3] = &unk_1E6994600;
    void v26[4] = self;
    id v27 = v32;
    brc_task_tracker_async_with_logs(tracker, v24, v28, v26);

    __brc_leave_section(v33);
  }
  __brc_leave_section(v36);
}

void __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413826;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 1024;
    int v12 = 0;
    __int16 v13 = 1024;
    int v14 = 0;
    __int16 v15 = 2112;
    uint64_t v16 = 0;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %d, %@, %@)%@", (uint8_t *)&v7, 0x3Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_638(void *a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F594D0] fileObjectIDWithString:a1[4]];
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCXPCRegularIPCsClient(LegacyAdditions) resolveFileObjectIDToURL:reply:]();
  }

  if (v2)
  {
    if ([v2 isDocumentID])
    {
      id v5 = (void *)a1[5];
      uint64_t v6 = [v2 documentID];
      uint64_t v7 = objc_msgSend(v5, "globalItemByDocumentID:", objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_8;
    }
    if ([v2 isFolderOrAliasID])
    {
      uint64_t v8 = (void *)a1[5];
      uint64_t v6 = [v2 folderID];
      uint64_t v7 = objc_msgSend(v8, "globalItemByFileID:", objc_msgSend(v6, "unsignedIntValue"));
LABEL_8:
      __int16 v9 = (void *)v7;

      if (v9)
      {
        char v10 = [v9 sharingOptions];
        uint64_t v11 = v10 & 0x48;
        int v12 = [v9 clientZone];
        int v13 = [v12 isPrivateZone];

        int v14 = 0;
        unint64_t v15 = v10 & 4;
        if ((v10 & 0x48) != 0 && (v10 & 4) == 0)
        {
          __int16 v44 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v9);
          __int16 v43 = objc_msgSend(v44, "brc_shareItemID");
          uint64_t v16 = [v9 clientZone];
          __int16 v17 = [v16 itemByItemID:v43];

          [v17 st];
          v19 = uint64_t v18 = v10 & 0x48;
          [v19 logicalName];
          v21 = int v20 = v13;
          int v14 = objc_msgSend(v21, "br_displayFilenameWithExtensionHidden:", 0);

          int v13 = v20;
          uint64_t v11 = v18;
          unint64_t v15 = 0;
        }
        qos_class_t v22 = brc_bread_crumbs();
        __int16 v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = a1[6];
          *(_DWORD *)buf = 138413826;
          uint64_t v46 = v24;
          __int16 v47 = 1024;
          BOOL v48 = v11 != 0;
          __int16 v49 = 1024;
          int v50 = v13;
          __int16 v51 = 1024;
          int v52 = v15 >> 2;
          __int16 v53 = 2112;
          __int16 v54 = v14;
          __int16 v55 = 2112;
          uint64_t v56 = 0;
          __int16 v57 = 2112;
          int v58 = v22;
          _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %d, %@, %@)%@", buf, 0x3Cu);
        }

        (*(void (**)(void))(a1[7] + 16))();
      }
      else
      {
        id v32 = brc_bread_crumbs();
        id v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_638_cold_2();
        }

        id v34 = brc_bread_crumbs();
        id v35 = brc_default_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          uint64_t v36 = a1[6];
          uint64_t v37 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v38 = [v2 description];
          __int16 v39 = objc_msgSend(v37, "brc_errorItemNotFound:", v38);
          *(_DWORD *)buf = 138413826;
          uint64_t v46 = v36;
          __int16 v47 = 1024;
          BOOL v48 = 0;
          __int16 v49 = 1024;
          int v50 = 0;
          __int16 v51 = 1024;
          int v52 = 0;
          __int16 v53 = 2112;
          __int16 v54 = 0;
          __int16 v55 = 2112;
          uint64_t v56 = v39;
          __int16 v57 = 2112;
          int v58 = v34;
          _os_log_impl(&dword_1D353B000, v35, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %d, %@, %@)%@", buf, 0x3Cu);
        }
        uint64_t v40 = a1[7];
        __int16 v41 = (void *)MEMORY[0x1E4F28C58];
        __int16 v9 = [v2 description];
        id v42 = objc_msgSend(v41, "brc_errorItemNotFound:", v9);
        (*(void (**)(uint64_t, void, void, void, void, void *))(v40 + 16))(v40, 0, 0, 0, 0, v42);
      }
      goto LABEL_25;
    }
  }
  id v25 = brc_bread_crumbs();
  id v26 = brc_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_191_cold_1();
  }

  id v27 = brc_bread_crumbs();
  char v28 = brc_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = a1[6];
    id v30 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"itemIdentifier", a1[4]);
    *(_DWORD *)buf = 138413826;
    uint64_t v46 = v29;
    __int16 v47 = 1024;
    BOOL v48 = 0;
    __int16 v49 = 1024;
    int v50 = 0;
    __int16 v51 = 1024;
    int v52 = 0;
    __int16 v53 = 2112;
    __int16 v54 = 0;
    __int16 v55 = 2112;
    uint64_t v56 = v30;
    __int16 v57 = 2112;
    int v58 = v27;
    _os_log_impl(&dword_1D353B000, v28, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %d, %@, %@)%@", buf, 0x3Cu);
  }
  uint64_t v31 = a1[7];
  __int16 v9 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"itemIdentifier", a1[4]);
  (*(void (**)(uint64_t, void, void, void, void, void *))(v31 + 16))(v31, 0, 0, 0, 0, v9);
LABEL_25:
}

void __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_642(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    int v8 = 138413826;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = 0;
    __int16 v12 = 1024;
    int v13 = 0;
    __int16 v14 = 1024;
    int v15 = 0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    __int16 v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %d, %d, %@, %@)%@", (uint8_t *)&v8, 0x3Cu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  (*(void (**)(uint64_t, void, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, 0, v7);
}

- (void)_presentAcceptDialogsWithMetadata:(id)a3 reply:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v27 = [(BRCXPCClient *)self session];
  memset(v32, 0, sizeof(v32));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient _presentAcceptDialogsWithMetadata:reply:]", 4872, v32);
  int v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v32[0];
    qos_class_t v11 = qos_class_self();
    __int16 v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v34 = (BRCXPCRegularIPCsClient *)v10;
    __int16 v35 = 2112;
    uint64_t v36 = self;
    __int16 v37 = 2112;
    uint64_t v38 = v12;
    __int16 v39 = 2080;
    uint64_t v40 = "-[BRCXPCRegularIPCsClient _presentAcceptDialogsWithMetadata:reply:]";
    __int16 v41 = 2112;
    id v42 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  void v30[2] = __67__BRCXPCRegularIPCsClient__presentAcceptDialogsWithMetadata_reply___block_invoke;
  uint64_t v30[3] = &unk_1E69957B0;
  void v30[4] = self;
  id v13 = v7;
  id v31 = v13;
  int v14 = _brc_ipc_check_logged_status(self, 0, v30);

  if (v14)
  {
    int v15 = [v6 share];
    __int16 v16 = [v15 URL];

    id v26 = objc_alloc_init(BRCUserNotification);
    uint64_t v17 = +[BRCUserActionsNavigator defaultNavigator];
    __int16 v18 = [[BRCSharingAcceptFlowOperation alloc] initWithShareMetadata:v6 client:self session:v27 userNotifier:v26 userActionsNavigator:v17];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __67__BRCXPCRegularIPCsClient__presentAcceptDialogsWithMetadata_reply___block_invoke_646;
    uint64_t v28[3] = &unk_1E6996730;
    void v28[4] = self;
    id v19 = v13;
    id v29 = v19;
    [(_BRCOperation *)v18 setFinishBlock:v28];
    __int16 v20 = +[BRCDaemon daemon];
    uint64_t v21 = [v20 registerShareAcceptOperation:v18 forURL:v16];

    if (v21 != v18)
    {
      uint64_t v22 = brc_bread_crumbs();
      __int16 v23 = brc_default_log();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
        -[BRCXPCRegularIPCsClient _presentAcceptDialogsWithMetadata:reply:]();
      }

      [(BRCSharingAcceptFlowOperation *)v21 moveDialogToFront];
      uint64_t v24 = brc_bread_crumbs();
      id v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v34 = self;
        __int16 v35 = 2112;
        uint64_t v36 = 0;
        __int16 v37 = 2112;
        uint64_t v38 = v24;
        _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }

      (*((void (**)(id, void))v19 + 2))(v19, 0);
    }
  }
  __brc_leave_section(v32);
}

void __67__BRCXPCRegularIPCsClient__presentAcceptDialogsWithMetadata_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __67__BRCXPCRegularIPCsClient__presentAcceptDialogsWithMetadata_reply___block_invoke_646(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    __int16 v11 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleCloudKitShareMetadata:(id)a3 completionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v28, 0, sizeof(v28));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient handleCloudKitShareMetadata:completionHandler:]", 4929, v28);
  __int16 v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v28[0];
    qos_class_t v11 = qos_class_self();
    uint64_t v12 = BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v30 = v10;
    __int16 v31 = 2112;
    id v32 = self;
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2080;
    uint64_t v36 = "-[BRCXPCRegularIPCsClient handleCloudKitShareMetadata:completionHandler:]";
    __int16 v37 = 2112;
    uint64_t v38 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __73__BRCXPCRegularIPCsClient_handleCloudKitShareMetadata_completionHandler___block_invoke;
  uint64_t v24[3] = &unk_1E6995A80;
  id v13 = v6;
  id v25 = v13;
  id v26 = self;
  id v14 = v7;
  id v27 = v14;
  int v15 = _brc_ipc_check_logged_status(self, 0, v24);

  if (v15)
  {
    memset(v23, 0, sizeof(v23));
    __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient handleCloudKitShareMetadata:completionHandler:]", 4931, v23);
    __int16 v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = v23[0];
      id v19 = [v13 share];
      __int16 v20 = [v19 URL];
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = v18;
      __int16 v31 = 2112;
      id v32 = v20;
      __int16 v33 = 2112;
      id v34 = v16;
      _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx handling share at %@%@", buf, 0x20u);
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__BRCXPCRegularIPCsClient_handleCloudKitShareMetadata_completionHandler___block_invoke_647;
    uint64_t v21[3] = &unk_1E69957B0;
    void v21[4] = self;
    id v22 = v14;
    [(BRCXPCRegularIPCsClient *)self presentAcceptDialogsForShareMetadata:v13 reply:v21];

    __brc_leave_section(v23);
  }
  __brc_leave_section(v28);
}

void __73__BRCXPCRegularIPCsClient_handleCloudKitShareMetadata_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    uint64_t v12 = a1[4];
    int v13 = 138412802;
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    _os_log_error_impl(&dword_1D353B000, v5, (os_log_type_t)0x90u, "[ERROR] can't handle share %@: %@%@", (uint8_t *)&v13, 0x20u);
  }

  id v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = a1[5];
    uint64_t v9 = objc_msgSend(v3, "brc_wrappedError");
    int v13 = 138412802;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = a1[6];
  qos_class_t v11 = objc_msgSend(v3, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
}

void __73__BRCXPCRegularIPCsClient_handleCloudKitShareMetadata_completionHandler___block_invoke_647(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v3;
      __int16 v14 = 2112;
      __int16 v15 = v4;
      _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] can't accept the share: %@%@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = objc_msgSend(v3, "brc_wrappedError");
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    __int16 v17 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  qos_class_t v11 = objc_msgSend(v3, "brc_wrappedError");
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
}

- (void)keepDataLocalOnSignOut:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  memset(v24, 0, sizeof(v24));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient keepDataLocalOnSignOut:reply:]", 4944, v24);
  id v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v24[0];
    qos_class_t v10 = qos_class_self();
    qos_class_t v11 = BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v26 = (BRCXPCRegularIPCsClient *)v9;
    __int16 v27 = 2112;
    char v28 = self;
    __int16 v29 = 2112;
    uint64_t v30 = v11;
    __int16 v31 = 2080;
    id v32 = "-[BRCXPCRegularIPCsClient keepDataLocalOnSignOut:reply:]";
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __56__BRCXPCRegularIPCsClient_keepDataLocalOnSignOut_reply___block_invoke;
  uint64_t v22[3] = &unk_1E69957B0;
  uint8_t v22[4] = self;
  id v12 = v6;
  id v23 = v12;
  int v13 = _brc_ipc_check_applibraries_access(self, 3, v22);

  if (v13)
  {
    __int16 v14 = +[BRCAccountsManager sharedManager];
    [v14 keepDataLocalOnSignOutForCurrentPersona:v4];
    __int16 v15 = [(BRCXPCClient *)self session];

    if (v15)
    {
      __int16 v16 = [(BRCXPCClient *)self session];
      __int16 v17 = [v16 clientTruthWorkloop];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__BRCXPCRegularIPCsClient_keepDataLocalOnSignOut_reply___block_invoke_648;
      block[3] = &unk_1E6996758;
      BOOL v21 = v4;
      void block[4] = self;
      dispatch_async_and_wait(v17, block);
    }
    uint64_t v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v26 = self;
      __int16 v27 = 2112;
      char v28 = 0;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
  __brc_leave_section(v24);
}

void __56__BRCXPCRegularIPCsClient_keepDataLocalOnSignOut_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__BRCXPCRegularIPCsClient_keepDataLocalOnSignOut_reply___block_invoke_648(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __56__BRCXPCRegularIPCsClient_keepDataLocalOnSignOut_reply___block_invoke_648_cold_1(a1);
  }

  BOOL v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) session];
  uint64_t v6 = [v5 clientState];
  [v6 setObject:v4 forKeyedSubscript:@"kBRCKeepDataLocalOnSignOutStatKey"];

  int v7 = [*(id *)(a1 + 32) session];
  uint64_t v8 = [v7 clientDB];
  [v8 forceBatchStart];
}

- (BOOL)_saveOrDeleteContainerMetadataRecordName:(id)a3 saveRecord:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  __int16 v27 = __Block_byref_object_copy__48;
  char v28 = __Block_byref_object_dispose__48;
  id v29 = 0;
  id v9 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v10 = objc_msgSend(MEMORY[0x1E4F1A320], "brc_containerMetadataZoneID");
  __int16 v11 = (void *)[v9 initWithRecordName:v8 zoneID:v10];

  if (v6)
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"AppContainer" recordID:v11];
    id v13 = objc_alloc(MEMORY[0x1E4F1A198]);
    v31[0] = v12;
    __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    __int16 v15 = (void *)[v13 initWithRecordsToSave:v14 recordIDsToDelete:0];
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1A198]);
    uint64_t v30 = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    __int16 v15 = (void *)[v16 initWithRecordsToSave:0 recordIDsToDelete:v12];
  }

  __int16 v17 = objc_msgSend(MEMORY[0x1E4F1A218], "br_testTrigger");
  [v15 setGroup:v17];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __85__BRCXPCRegularIPCsClient__saveOrDeleteContainerMetadataRecordName_saveRecord_error___block_invoke;
  uint64_t v23[3] = &unk_1E699AD40;
  void v23[4] = &v24;
  [v15 setModifyRecordsCompletionBlock:v23];
  uint64_t v18 = [(BRCXPCClient *)self session];
  uint64_t v19 = [v18 syncContextProvider];
  __int16 v20 = [v19 defaultSyncContext];
  [v20 addOperation:v15];

  [v15 waitUntilFinished];
  if (a5) {
    *a5 = (id) v25[5];
  }
  BOOL v21 = v25[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v21;
}

void __85__BRCXPCRegularIPCsClient__saveOrDeleteContainerMetadataRecordName_saveRecord_error___block_invoke(uint64_t a1, int a2, int a3, id obj)
{
}

- (void)setEnhancedDrivePrivacyEnabled:(BOOL)a3 forContainer:(id)a4 onServer:(BOOL)a5 onClient:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  memset(v64, 0, sizeof(v64));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient setEnhancedDrivePrivacyEnabled:forContainer:onServer:onClient:reply:]", 5000, v64);
  __int16 v14 = brc_bread_crumbs();
  __int16 v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v46 = v13;
    BOOL v16 = v9;
    BOOL v17 = a3;
    id v18 = v12;
    BOOL v19 = v8;
    uint64_t v20 = v64[0];
    qos_class_t v21 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v21, (uint64_t)&brc_qos_entries, 0);
    id v22 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    __int16 v72 = v22;
    *(_WORD *)__int16 v73 = 2080;
    *(void *)&v73[2] = "-[BRCXPCRegularIPCsClient setEnhancedDrivePrivacyEnabled:forContainer:onServer:onClient:reply:]";
    *(_WORD *)&v73[10] = 2112;
    *(void *)&v73[12] = v14;
    _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    BOOL v8 = v19;
    id v12 = v18;
    a3 = v17;
    BOOL v9 = v16;
    id v13 = v46;
  }

  id v23 = (void *)*MEMORY[0x1E4F59318];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke;
  v62[3] = &unk_1E69957B0;
  v62[4] = self;
  id v24 = v13;
  id v63 = v24;
  LODWORD(v23) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v23, v62);

  if (v23)
  {
    id v25 = +[BRCUserDefaults defaultsForMangledID:0];
    char v26 = [v25 supportsEnhancedDrivePrivacy];

    if ((v26 & 1) == 0)
    {
      brc_bread_crumbs();
      id v34 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      uint64_t v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorPermissionError:", @"Enhanced Drive Privacy Not Enabled");
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v36;
        *(_WORD *)&buf[22] = 2112;
        __int16 v72 = v34;
        _os_log_impl(&dword_1D353B000, v35, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
      }
      __int16 v27 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorPermissionError:", @"Enhanced Drive Privacy Not Enabled");
      (*((void (**)(id, void *))v24 + 2))(v24, v27);
      goto LABEL_29;
    }
    __int16 v27 = [(BRCXPCClient *)self session];
    char v28 = [v12 isEqualToString:@"all"];
    int v29 = [v12 isEqualToString:@"all-private"];
    if (v9)
    {
      char v45 = v28;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      __int16 v72 = __Block_byref_object_copy__48;
      *(void *)__int16 v73 = __Block_byref_object_dispose__48;
      *(void *)&v73[8] = 0;
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_664;
      v60[3] = &unk_1E699AD68;
      BOOL v61 = a3;
      v60[4] = self;
      unsigned char v60[5] = buf;
      __int16 v47 = (uint64_t (**)(void, void, void))MEMORY[0x1D94389C0](v60);
      if (v29)
      {
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_2;
        v57[3] = &unk_1E699AD90;
        BOOL v59 = a3;
        int v58 = v47;
        [v27 enumeratePrivateClientZones:v57];
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          uint64_t v30 = brc_bread_crumbs();
          __int16 v31 = brc_default_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            uint64_t v32 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)uint64_t v65 = 138412802;
            id v66 = self;
            __int16 v67 = 2112;
            uint64_t v68 = v32;
            __int16 v69 = 2112;
            __int16 v70 = v30;
            _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", v65, 0x20u);
          }

          (*((void (**)(id, void))v24 + 2))(v24, *(void *)(*(void *)&buf[8] + 40));
          __int16 v33 = v58;
LABEL_21:

          _Block_object_dispose(buf, 8);
LABEL_29:

          goto LABEL_30;
        }
        __int16 v33 = v58;
      }
      else
      {
        if (v28)
        {
          __int16 v33 = @"com.apple.lobodon.forced";
        }
        else
        {
          __int16 v33 = [v12 stringByAppendingString:@".lobodon.enabled"];
        }
        uint64_t v37 = *(void *)&buf[8];
        id obj = *(id *)(*(void *)&buf[8] + 40);
        char v38 = ((uint64_t (**)(void, __CFString *, id *))v47)[2](v47, v33, &obj);
        objc_storeStrong((id *)(v37 + 40), obj);
        if ((v38 & 1) == 0)
        {
          uint64_t v39 = brc_bread_crumbs();
          uint64_t v40 = brc_default_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            uint64_t v41 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)uint64_t v65 = 138412802;
            id v66 = self;
            __int16 v67 = 2112;
            uint64_t v68 = v41;
            __int16 v69 = 2112;
            __int16 v70 = v39;
            _os_log_impl(&dword_1D353B000, v40, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", v65, 0x20u);
          }

          (*((void (**)(id, void))v24 + 2))(v24, *(void *)(*(void *)&buf[8] + 40));
          goto LABEL_21;
        }
      }

      _Block_object_dispose(buf, 8);
      char v28 = v45;
    }
    if (v8)
    {
      id v42 = [v27 clientTruthWorkloop];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_673;
      block[3] = &unk_1E699AE00;
      BOOL v53 = a3;
      char v54 = v28;
      id v49 = v27;
      char v55 = v29;
      id v50 = v12;
      __int16 v51 = self;
      id v52 = v24;
      dispatch_async_and_wait(v42, block);
    }
    brc_bread_crumbs();
    uint64_t v43 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    __int16 v44 = brc_default_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2112;
      __int16 v72 = v43;
      _os_log_impl(&dword_1D353B000, v44, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v24 + 2))(v24, 0);
    goto LABEL_29;
  }
LABEL_30:
  __brc_leave_section(v64);
}

void __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_664(uint64_t a1, uint64_t a2, id *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) _saveOrDeleteContainerMetadataRecordName:a2 saveRecord:*(unsigned __int8 *)(a1 + 48) error:a3];
  if ((v5 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *a3);
  }
  return v5;
}

uint64_t __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned __int8 *)(a1 + 40) == [v3 enhancedDrivePrivacyEnabled])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v3 mangledID];
    int v7 = [v6 appLibraryOrZoneName];
    uint64_t v8 = [v7 stringByAppendingString:@".lobodon.enabled"];
    id v11 = 0;
    uint64_t v4 = (*(uint64_t (**)(uint64_t, void *, id *))(v5 + 16))(v5, v8, &v11);
    id v9 = v11;
  }
  return v4;
}

void __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_673(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_2_674;
  uint64_t v18[3] = &__block_descriptor_33_e23_v16__0__BRCClientZone_8l;
  char v19 = *(unsigned char *)(a1 + 64);
  id v2 = (void (**)(void, void))MEMORY[0x1D94389C0](v18);
  id v3 = v2;
  if (*(unsigned char *)(a1 + 65))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_3;
    v16[3] = &unk_1E699ADD8;
    BOOL v17 = v2;
    [v4 enumerateClientZones:v16];
    uint64_t v5 = v17;
LABEL_7:

    uint64_t v8 = [*(id *)(a1 + 32) clientDB];
    [v8 forceBatchStart];
    goto LABEL_8;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 66))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_4;
    v14[3] = &unk_1E699ADD8;
    __int16 v15 = v2;
    [v6 enumeratePrivateClientZones:v14];
    uint64_t v5 = v15;
    goto LABEL_7;
  }
  int v7 = [*(id *)(a1 + 32) appLibraryByID:*(void *)(a1 + 40)];
  uint64_t v5 = [v7 defaultClientZone];

  if (v5)
  {
    ((void (**)(void, void *))v3)[2](v3, v5);
    goto LABEL_7;
  }
  id v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", *(void *)(a1 + 40));
    *(_DWORD *)buf = 138412802;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
  }
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", *(void *)(a1 + 40));
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v8);
LABEL_8:
}

uint64_t __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_2_674(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return [a2 setStateBits:0x400000];
  }
  else {
    return [a2 clearStateBits:0x400000];
  }
}

uint64_t __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_3(uint64_t a1)
{
  return 1;
}

uint64_t __95__BRCXPCRegularIPCsClient_setEnhancedDrivePrivacyEnabled_forContainer_onServer_onClient_reply___block_invoke_4(uint64_t a1)
{
  return 1;
}

- (void)verifyAccountLoaded:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v16, 0, sizeof(v16));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient verifyAccountLoaded:]", 5080, v16);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v16[0];
    qos_class_t v8 = qos_class_self();
    id v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    id v18 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v19 = 2112;
    uint64_t v20 = self;
    __int16 v21 = 2112;
    __int16 v22 = v9;
    __int16 v23 = 2080;
    __int16 v24 = "-[BRCXPCRegularIPCsClient verifyAccountLoaded:]";
    __int16 v25 = 2112;
    uint64_t v26 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__BRCXPCRegularIPCsClient_verifyAccountLoaded___block_invoke;
  v14[3] = &unk_1E69957B0;
  void v14[4] = self;
  id v10 = v4;
  id v15 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 1, v14);

  if (v11)
  {
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = self;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  __brc_leave_section(v16);
}

void __47__BRCXPCRegularIPCsClient_verifyAccountLoaded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_t_getEntitlementsForBundleID:(id)a3 reply:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void))a4;
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412802;
    __int16 v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v8, 0x20u);
  }

  v5[2](v5, 0);
}

- (void)_t_getEntitledContainerIDsForBundleID:(id)a3 reply:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void))a4;
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412802;
    __int16 v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v8, 0x20u);
  }

  v5[2](v5, 0);
}

- (void)_t_extractMetadataForAllContainersWithReply:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v48, 0, sizeof(v48));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient _t_extractMetadataForAllContainersWithReply:]", 5989, v48);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v48[0];
    qos_class_t v8 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    __int16 v9 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    __int16 v57 = v9;
    *(_WORD *)int v58 = 2080;
    *(void *)&v58[2] = "-[BRCXPCRegularIPCsClient _t_extractMetadataForAllContainersWithReply:]";
    *(_WORD *)&v58[10] = 2112;
    *(void *)&v58[12] = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  __int16 v10 = (void *)*MEMORY[0x1E4F59318];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __71__BRCXPCRegularIPCsClient__t_extractMetadataForAllContainersWithReply___block_invoke;
  uint64_t v46[3] = &unk_1E69957B0;
  v46[4] = self;
  id v33 = v4;
  id v47 = v33;
  int v11 = _brc_ipc_check_entitlement_and_logged_status(self, 0, v10, v46);

  if (v11)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v57 = __Block_byref_object_copy__48;
    *(void *)int v58 = __Block_byref_object_dispose__48;
    *(void *)&v58[8] = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    __int16 v12 = [(BRCXPCClient *)self entitledAppLibraryIDs];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v55 count:16];
    if (v13)
    {
      uint64_t v35 = *(void *)v43;
      id obj = v12;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          BOOL v16 = [(BRCXPCClient *)self bundleID];
          BOOL v17 = [(BRCXPCClient *)self session];
          id v18 = [v17 appLibraryByID:v15];

          if (!v18)
          {
            char v28 = brc_bread_crumbs();
            int v29 = brc_default_log();
            if (os_log_type_enabled(v29, (os_log_type_t)0x90u)) {
              -[BRCXPCRegularIPCsClient updateContainerMetadataForID:]();
            }

LABEL_17:
            __int16 v12 = obj;
            goto LABEL_18;
          }
          __int16 v19 = BRCBundleServiceConnection();
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __71__BRCXPCRegularIPCsClient__t_extractMetadataForAllContainersWithReply___block_invoke_678;
          uint64_t v40[3] = &unk_1E69939E8;
          id v20 = v19;
          id v41 = v20;
          __int16 v21 = [v20 remoteObjectProxyWithErrorHandler:v40];
          __int16 v22 = [v18 containerMetadata];
          __int16 v23 = [v22 versionNumberForBundleIdentifier:v16];

          dispatch_group_t v24 = dispatch_group_create();
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __71__BRCXPCRegularIPCsClient__t_extractMetadataForAllContainersWithReply___block_invoke_2;
          uint64_t v36[3] = &unk_1E699AE28;
          void v36[4] = v15;
          uint64_t v39 = buf;
          id v25 = v20;
          id v37 = v25;
          uint64_t v26 = v24;
          char v38 = v26;
          [v21 extractMetadataForContainerID:v15 bundleID:v16 minimumBundleVersion:v23 reply:v36];
          dispatch_group_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
          BOOL v27 = *(void *)(*(void *)&buf[8] + 40) == 0;

          if (!v27) {
            goto LABEL_17;
          }
        }
        __int16 v12 = obj;
        uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v55 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    uint64_t v30 = brc_bread_crumbs();
    __int16 v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)id v49 = 138412802;
      id v50 = self;
      __int16 v51 = 2112;
      uint64_t v52 = v32;
      __int16 v53 = 2112;
      char v54 = v30;
      _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", v49, 0x20u);
    }

    (*((void (**)(id, void))v33 + 2))(v33, *(void *)(*(void *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
  }
  __brc_leave_section(v48);
}

void __71__BRCXPCRegularIPCsClient__t_extractMetadataForAllContainersWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __71__BRCXPCRegularIPCsClient__t_extractMetadataForAllContainersWithReply___block_invoke_678(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __71__BRCXPCRegularIPCsClient__t_extractMetadataForAllContainersWithReply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = brc_bread_crumbs();
    __int16 v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v16 = 138412802;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      __int16 v21 = v8;
      _os_log_error_impl(&dword_1D353B000, v9, (os_log_type_t)0x90u, "[ERROR] can't extract metadata for %@: %@%@", (uint8_t *)&v16, 0x20u);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = v7;
    __int16 v12 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }
  else
  {
    __int16 v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138412802;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      __int16 v21 = v12;
      _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] extracted metadata for %@: %@%@", (uint8_t *)&v16, 0x20u);
    }
  }
  [*(id *)(a1 + 40) invalidate];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)lookupExcludedFilenamesForLogoutWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient lookupExcludedFilenamesForLogoutWithReply:]", 6037, v18);
  uint64_t v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    uint64_t v22 = self;
    __int16 v23 = 2112;
    dispatch_group_t v24 = v9;
    __int16 v25 = 2080;
    uint64_t v26 = "-[BRCXPCRegularIPCsClient lookupExcludedFilenamesForLogoutWithReply:]";
    __int16 v27 = 2112;
    char v28 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__BRCXPCRegularIPCsClient_lookupExcludedFilenamesForLogoutWithReply___block_invoke;
  uint64_t v16[3] = &unk_1E69957B0;
  void v16[4] = self;
  id v10 = v4;
  id v17 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 1, v16);

  if (v11)
  {
    __int16 v12 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v13 = [v12 excludedFilenamesWorthWarningAtLogout];

    brc_bread_crumbs();
    uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      dispatch_group_t v24 = 0;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v10 + 2))(v10, v13, 0);
  }
  __brc_leave_section(v18);
}

void __69__BRCXPCRegularIPCsClient_lookupExcludedFilenamesForLogoutWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)lookupExcludedExtensionsForLogoutWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient lookupExcludedExtensionsForLogoutWithReply:]", 6047, v18);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    uint64_t v22 = self;
    __int16 v23 = 2112;
    dispatch_group_t v24 = v9;
    __int16 v25 = 2080;
    uint64_t v26 = "-[BRCXPCRegularIPCsClient lookupExcludedExtensionsForLogoutWithReply:]";
    __int16 v27 = 2112;
    char v28 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__BRCXPCRegularIPCsClient_lookupExcludedExtensionsForLogoutWithReply___block_invoke;
  uint64_t v16[3] = &unk_1E69957B0;
  void v16[4] = self;
  id v10 = v4;
  id v17 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 1, v16);

  if (v11)
  {
    id v12 = +[BRCUserDefaults defaultsForMangledID:0];
    __int16 v13 = [v12 excludedExtensionsWorthPreserving];

    brc_bread_crumbs();
    uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      dispatch_group_t v24 = 0;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCRegularIPCsClient *, void))v10 + 2))(v10, v13, 0);
  }
  __brc_leave_section(v18);
}

void __70__BRCXPCRegularIPCsClient_lookupExcludedExtensionsForLogoutWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)lookupMinFileSizeForThumbnailTransferWithReply:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v22, 0, sizeof(v22));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient lookupMinFileSizeForThumbnailTransferWithReply:]", 6057, v22);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v22[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    dispatch_group_t v24 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v25 = 2112;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    char v28 = v9;
    __int16 v29 = 2080;
    uint64_t v30 = "-[BRCXPCRegularIPCsClient lookupMinFileSizeForThumbnailTransferWithReply:]";
    __int16 v31 = 2112;
    uint64_t v32 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__BRCXPCRegularIPCsClient_lookupMinFileSizeForThumbnailTransferWithReply___block_invoke;
  uint64_t v20[3] = &unk_1E69957B0;
  void v20[4] = self;
  id v10 = v4;
  id v21 = v10;
  int v11 = _brc_ipc_check_logged_status(self, 1, v20);

  if (v11)
  {
    brc_bread_crumbs();
    id v12 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = NSNumber;
      uint64_t v15 = +[BRCUserDefaults defaultsForMangledID:0];
      objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v15, "minFileSizeForThumbnailTransfer"));
      int v16 = (BRCXPCRegularIPCsClient *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      dispatch_group_t v24 = self;
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      char v28 = 0;
      __int16 v29 = 2112;
      uint64_t v30 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v17 = NSNumber;
    __int16 v18 = +[BRCUserDefaults defaultsForMangledID:0];
    id v19 = objc_msgSend(v17, "numberWithLongLong:", objc_msgSend(v18, "minFileSizeForThumbnailTransfer"));
    (*((void (**)(id, void *, void))v10 + 2))(v10, v19, 0);
  }
  __brc_leave_section(v22);
}

void __74__BRCXPCRegularIPCsClient_lookupMinFileSizeForThumbnailTransferWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updatePrivilegesDescriptor
{
}

- (void)queryTelemetryEnablementWithReply:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient queryTelemetryEnablementWithReply:]", 6073, v18);
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v18[0];
    qos_class_t v9 = qos_class_self();
    uint64_t v10 = BRCPrettyPrintEnumWithContext(v9, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v20 = (BRCXPCRegularIPCsClient *)v8;
    __int16 v21 = 2112;
    *(void *)uint64_t v22 = self;
    *(_WORD *)&v22[8] = 2112;
    *(void *)&v22[10] = v10;
    *(_WORD *)&v22[18] = 2080;
    *(void *)&v22[20] = "-[BRCXPCRegularIPCsClient queryTelemetryEnablementWithReply:]";
    __int16 v23 = 2112;
    dispatch_group_t v24 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__BRCXPCRegularIPCsClient_queryTelemetryEnablementWithReply___block_invoke;
  uint64_t v16[3] = &unk_1E69957B0;
  void v16[4] = self;
  id v11 = v5;
  id v17 = v11;
  int v12 = _brc_ipc_spi(self, 1, (uint64_t)a2, v16);

  if (v12)
  {
    __int16 v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      BOOL v15 = +[BRCAnalyticsReporter isTelemetryReportingEnabled];
      *(_DWORD *)buf = 138413058;
      __int16 v20 = self;
      __int16 v21 = 1024;
      *(_DWORD *)uint64_t v22 = v15;
      *(_WORD *)&uint8_t v22[4] = 2112;
      *(void *)&v22[6] = 0;
      *(_WORD *)&v22[14] = 2112;
      *(void *)&v22[16] = v13;
      _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", buf, 0x26u);
    }

    (*((void (**)(id, BOOL, void))v11 + 2))(v11, +[BRCAnalyticsReporter isTelemetryReportingEnabled], 0);
  }
  __brc_leave_section(v18);
}

void __61__BRCXPCRegularIPCsClient_queryTelemetryEnablementWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%d, %@)%@", (uint8_t *)&v7, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)corruptDatabase:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient corruptDatabase:]", 6082, v18);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v18[0];
    qos_class_t v8 = qos_class_self();
    __int16 v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    __int16 v20 = (BRCXPCRegularIPCsClient *)v7;
    __int16 v21 = 2112;
    uint64_t v22 = self;
    __int16 v23 = 2112;
    dispatch_group_t v24 = v9;
    __int16 v25 = 2080;
    uint64_t v26 = "-[BRCXPCRegularIPCsClient corruptDatabase:]";
    __int16 v27 = 2112;
    char v28 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  int v10 = (void *)*MEMORY[0x1E4F59318];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __43__BRCXPCRegularIPCsClient_corruptDatabase___block_invoke;
  uint64_t v16[3] = &unk_1E69957B0;
  void v16[4] = self;
  id v11 = v4;
  id v17 = v11;
  LODWORD(v10) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v10, v16);

  if (v10)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F592A8] code:10000 userInfo:0];
    __int16 v13 = [(BRCXPCClient *)self session];
    [v13 dbBecameCorruptedWithDescription:@"Testing brctl reset corrupt-db" error:v12];

    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      __int16 v23 = 2112;
      dispatch_group_t v24 = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
  __brc_leave_section(v18);
}

void __43__BRCXPCRegularIPCsClient_corruptDatabase___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)waitUntilIdle:(id)a3 timeout:(id)a4 reply:(id)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v48 = a4;
  id v7 = a5;
  memset(v77, 0, sizeof(v77));
  __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient waitUntilIdle:timeout:reply:]", 6095, v77);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v77[0];
    qos_class_t v11 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v11, (uint64_t)&brc_qos_entries, 0);
    id v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    id v89 = v12;
    *(_WORD *)__int16 v90 = 2080;
    *(void *)&v90[2] = "-[BRCXPCRegularIPCsClient waitUntilIdle:timeout:reply:]";
    *(_WORD *)&v90[10] = 2112;
    *(void *)&v90[12] = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  uint64_t v13 = (void *)*MEMORY[0x1E4F59318];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __55__BRCXPCRegularIPCsClient_waitUntilIdle_timeout_reply___block_invoke;
  uint64_t v75[3] = &unk_1E69957B0;
  v75[4] = self;
  id v50 = v7;
  id v76 = v50;
  LODWORD(v13) = _brc_ipc_check_entitlement_and_logged_status(self, 1, v13, v75);

  if (v13)
  {
    memset(v74, 0, sizeof(v74));
    __brc_create_section(1, (uint64_t)"-[BRCXPCRegularIPCsClient waitUntilIdle:timeout:reply:]", 6099, v74);
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v74[0];
      qos_class_t v17 = qos_class_self();
      BRCPrettyPrintEnumWithContext(v17, (uint64_t)&brc_qos_entries, 0);
      __int16 v18 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      id v89 = v18;
      *(_WORD *)__int16 v90 = 2080;
      *(void *)&v90[2] = "-[BRCXPCRegularIPCsClient waitUntilIdle:timeout:reply:]";
      *(_WORD *)&v90[10] = 2112;
      *(void *)&v90[12] = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
    }
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __55__BRCXPCRegularIPCsClient_waitUntilIdle_timeout_reply___block_invoke_683;
    uint64_t v72[3] = &unk_1E69957B0;
    v72[4] = self;
    id v47 = v50;
    id v73 = v47;
    int v19 = _brc_ipc_check_applibraries_access(self, 1, v72);

    if (v19)
    {
      __int16 v20 = [(BRCXPCClient *)self session];
      id v71 = 0;
      id v46 = [v20 appLibrariesMatchingSearchString:v49 error:&v71];
      long long v45 = (uint64_t (*)(uint64_t, uint64_t))v71;

      uint64_t v52 = objc_opt_new();
      if (v46)
      {
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v21 = v46;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v87 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v68 != v23) {
                objc_enumerationMutation(v21);
              }
              __int16 v25 = [*(id *)(*((void *)&v67 + 1) + 8 * i) defaultClientZone];
              [v52 addObject:v25];
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v87 count:16];
          }
          while (v22);
        }

        uint64_t v26 = dispatch_group_create();
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        id v89 = __Block_byref_object_copy__48;
        *(void *)__int16 v90 = __Block_byref_object_dispose__48;
        *(void *)&v90[8] = 0;
        long long v63 = 0uLL;
        uint64_t v64 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCXPCRegularIPCsClient waitUntilIdle:timeout:reply:]", 6115, &v63);
        __int16 v27 = brc_bread_crumbs();
        char v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t v78 = 134218498;
          __int16 v79 = (BRCXPCRegularIPCsClient *)v63;
          __int16 v80 = 2112;
          id v81 = v52;
          __int16 v82 = 2112;
          id v83 = v27;
          _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for %@ to be idle%@", v78, 0x20u);
        }

        long long v65 = v63;
        uint64_t v66 = v64;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id obj = v52;
        uint64_t v29 = [obj countByEnumeratingWithState:&v59 objects:v86 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v60;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v60 != v30) {
                objc_enumerationMutation(obj);
              }
              uint64_t v32 = *(void **)(*((void *)&v59 + 1) + 8 * j);
              uint64_t v33 = [v32 defaultAppLibrary];
              [(BRCXPCClient *)self addAppLibrary:v33];

              dispatch_group_enter(v26);
              id v34 = [(BRCXPCClient *)self description];
              v54[0] = MEMORY[0x1E4F143A8];
              v54[1] = 3221225472;
              v54[2] = __55__BRCXPCRegularIPCsClient_waitUntilIdle_timeout_reply___block_invoke_684;
              v54[3] = &unk_1E699AE50;
              long long v57 = v65;
              uint64_t v58 = v66;
              uint64_t v56 = buf;
              uint8_t v54[4] = v32;
              char v55 = v26;
              [v32 notifyClient:v34 whenIdle:v54];
            }
            uint64_t v29 = [obj countByEnumeratingWithState:&v59 objects:v86 count:16];
          }
          while (v29);
        }

        if (v48) {
          dispatch_time_t v35 = dispatch_time(0, 1000000000 * [v48 unsignedLongLongValue]);
        }
        else {
          dispatch_time_t v35 = -1;
        }
        if (dispatch_group_wait(v26, v35))
        {
          char v38 = brc_bread_crumbs();
          uint64_t v39 = brc_default_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            uint64_t v40 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 60, @"Timed out while waiting for %@ to be idle.", obj);
            *(_DWORD *)uint64_t v78 = 138413058;
            __int16 v79 = self;
            __int16 v80 = 2112;
            id v81 = (void *)MEMORY[0x1E4F1CC28];
            __int16 v82 = 2112;
            id v83 = v40;
            __int16 v84 = 2112;
            uint64_t v85 = v38;
            _os_log_impl(&dword_1D353B000, v39, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", v78, 0x2Au);
          }
          id v41 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 60, @"Timed out while waiting for %@ to be idle.", obj);
          (*((void (**)(id, void, void *))v47 + 2))(v47, MEMORY[0x1E4F1CC28], v41);
        }
        else
        {
          long long v42 = brc_bread_crumbs();
          long long v43 = brc_default_log();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            long long v44 = *(void **)(*(void *)&buf[8] + 40);
            *(_DWORD *)uint64_t v78 = 138413058;
            __int16 v79 = self;
            __int16 v80 = 2112;
            id v81 = v44;
            __int16 v82 = 2112;
            id v83 = 0;
            __int16 v84 = 2112;
            uint64_t v85 = v42;
            _os_log_impl(&dword_1D353B000, v43, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", v78, 0x2Au);
          }

          (*((void (**)(id, void, void))v47 + 2))(v47, *(void *)(*(void *)&buf[8] + 40), 0);
        }
        _Block_object_dispose(buf, 8);
      }
      else
      {
        uint64_t v36 = brc_bread_crumbs();
        id v37 = brc_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = 0;
          *(_WORD *)&buf[22] = 2112;
          id v89 = v45;
          *(_WORD *)__int16 v90 = 2112;
          *(void *)&v90[2] = v36;
          _os_log_impl(&dword_1D353B000, v37, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }

        (*((void (**)(id, void, uint64_t (*)(uint64_t, uint64_t)))v47 + 2))(v47, 0, v45);
      }
    }
    __brc_leave_section(v74);
  }
  __brc_leave_section(v77);
}

void __55__BRCXPCRegularIPCsClient_waitUntilIdle_timeout_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __55__BRCXPCRegularIPCsClient_waitUntilIdle_timeout_reply___block_invoke_683(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138413058;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __55__BRCXPCRegularIPCsClient_waitUntilIdle_timeout_reply___block_invoke_684(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  long long v13 = *(_OWORD *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 72);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) BOOLValue];
    __int16 v11 = @"now";
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    if (v10) {
      __int16 v11 = @"already";
    }
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    __int16 v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@ is %@ idle%@", buf, 0x2Au);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  __brc_leave_section((uint64_t *)&v13);
}

void __94__BRCXPCRegularIPCsClient_LegacyAdditions___startDownloadItemsAtURLs_pos_options_error_reply___block_invoke_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ is on disk but we can't lookup in our db, we must not have scanned it yet%@", buf, 0x16u);
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__startOperation_toCopySharingInfoAtURL_reply___block_invoke_52_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Item not found (with unspecified error)%@", v2, v3, v4, v5, v6);
}

void __104__BRCXPCRegularIPCsClient_LegacyAdditions__getPublishedURLForItemAtURL_forStreaming_requestedTTL_reply___block_invoke_98_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] no local item for %@%@");
}

void __69__BRCXPCRegularIPCsClient_LegacyAdditions__getQueryItemForURL_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] lookup: %@%@");
}

void __68__BRCXPCRegularIPCsClient_LegacyAdditions__updateItemFromURL_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: we should always have a fileObjectID%@", v2, v3, v4, v5, v6);
}

void __69__BRCXPCRegularIPCsClient_LegacyAdditions__removeItemFromDisk_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] faking FS event after deletion at %@%@", (void)v3, DWORD2(v3));
}

void __81__BRCXPCRegularIPCsClient_LegacyAdditions__fetchLatestVersionForFileAtURL_reply___block_invoke_146_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) path];
  os_log_t v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v3, v4, "[ERROR] can't find document storage for path '%@'%@", v5, v6, v7, v8, v9);
}

void __81__BRCXPCRegularIPCsClient_LegacyAdditions__fetchLatestVersionForFileAtURL_reply___block_invoke_146_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Latest version already exists!%@", v2, v3, v4, v5, v6);
}

void __90__BRCXPCRegularIPCsClient_LegacyAdditions__copyCollaborationIdentifierForItemAtURL_reply___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] No lookup for url %@%@", (void)v3, DWORD2(v3));
}

void __84__BRCXPCRegularIPCsClient_LegacyAdditions___gatherInformationForPath_session_reply___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] gathering information at '%@'%@", (void)v3, DWORD2(v3));
}

void __88__BRCXPCRegularIPCsClient_LegacyAdditions__getBackReferencingContainerIDsForURLs_reply___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: partialError%@", v2, v3, v4, v5, v6);
}

void __75__BRCXPCRegularIPCsClient_LegacyAdditions__resolveFileObjectIDToURL_reply___block_invoke_189_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] couldn't find an item for fileObjectID=%@%@", (void)v3, DWORD2(v3));
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_191_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] invalid item identifier %@%@", (void)v3, DWORD2(v3));
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_196_cold_1(int *a1)
{
  strerror(*a1);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v1, v2, "[ERROR] Failed chmoding the shared-to-me item after refreshing sharing options - %s%@", v3, v4, v5, v6, v7);
}

void __87__BRCXPCRegularIPCsClient_LegacyAdditions__refreshSharingStateForItemIdentifier_reply___block_invoke_196_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: result == nil || [result isKindOfClass:[NSDictionary class]]%@", v2, v3, v4, v5, v6);
}

void __59__BRCXPCRegularIPCsClient_checkinAskClientIfUsingUbiquity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] %@%@");
}

- (void)updateContainerMetadataForID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] nonexistant container %@%@");
}

- (void)getItemUpdateSenderWithReceiver:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] receiver: %@%@");
}

void __45__BRCXPCRegularIPCsClient_getContainersByID___block_invoke_338_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] no metadata for %@%@");
}

- (void)forceSyncZoneHealthWithBarrierWithTimeout:reply:.cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┳%llx timed-out: zone health sync%@", (void)v3, DWORD2(v3));
}

- (void)forceSyncZoneHealthWithBarrierWithTimeout:reply:.cold.2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┣%llx waiting for zone health sync down%@", (void)v3, DWORD2(v3));
}

void __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_400_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] received an error while syncing down zone health: %@%@");
}

void __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_400_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┳%llx finished sync down zone health%@", (void)v3, DWORD2(v3));
}

void __75__BRCXPCRegularIPCsClient_forceSyncZoneHealthWithBarrierWithTimeout_reply___block_invoke_401_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┳%llx finished syncing zone health%@", (void)v3, DWORD2(v3));
}

- (void)forceSyncWithBarrierContainerID:timeout:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Requesting force sync on the special container %@ that doesn't have an app library.%@");
}

void __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_405_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] received an error while syncing container: %@%@");
}

void __73__BRCXPCRegularIPCsClient_forceSyncWithBarrierContainerID_timeout_reply___block_invoke_406_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] received an error while trigger sync for container: %@%@");
}

- (void)createAccountWithACAccountID:dsid:reply:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: asked to login to a non migrated account%@", v2, v3, v4, v5, v6);
}

- (void)createAccountWithACAccountID:dsid:reply:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] accountID: %@%@");
}

void __67__BRCXPCRegularIPCsClient_createAccountWithACAccountID_dsid_reply___block_invoke_425_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] can't create account: %@%@");
}

- (void)logoutAccountWithACAccountID:(char)a1 reply:.cold.1(char a1)
{
  os_log_t v1 = @"was successful";
  if ((a1 & 1) == 0) {
    os_log_t v1 = @"failed";
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v2, v3, "[DEBUG] Logout of account %@%@", (void)v4, DWORD2(v4));
}

void __58__BRCXPCRegularIPCsClient_updateAccountDisplayName_reply___block_invoke_436_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] can't update account: %@%@");
}

- (void)resolveBookmarkDataToURL:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] data: %@%@");
}

void __58__BRCXPCRegularIPCsClient_resolveBookmarkDataToURL_reply___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  long long v4 = "-[BRCXPCRegularIPCsClient resolveBookmarkDataToURL:reply:]_block_invoke";
  __int16 v5 = 2080;
  uint8_t v6 = "(passed to caller)";
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D353B000, log, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v3, 0x2Au);
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_493_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] enumerating children of %@%@");
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_493_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] couldn't find item for %@%@", (void)v3, DWORD2(v3));
}

void __84__BRCXPCRegularIPCsClient_enumerateItemsInFolder_sortOrder_offset_limit_completion___block_invoke_493_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] refetching quota%@", v2, v3, v4, v5, v6);
}

void __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: only got sharing key or base token, didn't get both%@", v2, v3, v4, v5, v6);
}

void __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: sharing key of unexpected class%@", v2, v3, v4, v5, v6);
}

void __84__BRCXPCRegularIPCsClient__getiWorkPublishingInfoForLocalItem_itemIdentifier_reply___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: base token of unexpected class%@", v2, v3, v4, v5, v6);
}

- (void)_startOperation:toCopySharingInfoWithLocalItem:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] starting operation to copy sharing info at %@%@");
}

void __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [a1 values];
  __int16 v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];
  uint64_t v8 = [a1 participants];
  int v9 = 138412802;
  uint64_t v10 = v7;
  __int16 v11 = 2048;
  uint64_t v12 = [v8 count];
  __int16 v13 = 2112;
  uint64_t v14 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Share %@ has %lu participants%@", (uint8_t *)&v9, 0x20u);
}

void __80__BRCXPCRegularIPCsClient__startOperation_toCopySharingInfoWithLocalItem_reply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: result == nil || [result isKindOfClass:[NSDictionary class]]%@", v2, v3, v4, v5, v6);
}

void __76__BRCXPCRegularIPCsClient_copyCollaborationIdentifierForFileObjectID_reply___block_invoke_594_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] no local item for %@%@", (void)v3, DWORD2(v3));
}

- (void)_createSharingInfoForLocalItem:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] creating sharing info for item %@%@");
}

void __60__BRCXPCRegularIPCsClient_createSharingInfoForItemID_reply___block_invoke_596_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Creating share for item %@%@");
}

- (void)_bumpLastUsedTimeOfSharedItem:clientZone:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: li%@", v2, v3, v4, v5, v6);
}

void __68__BRCXPCRegularIPCsClient__bumpLastUsedTimeOfSharedItem_clientZone___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] last used date bumped for %@%@", (void)v3, DWORD2(v3));
}

- (void)startOperation:toSaveSharingInfo:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Ignoring share save on empty share with no etag %@%@");
}

- (void)startOperation:toSaveSharingInfo:reply:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Adding %@ as a dependency on share save%@");
}

- (void)startOperation:toSaveSharingInfo:reply:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Saving share %@%@");
}

- (void)startOperation:toUnshareShare:forceDelete:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Destroying share info for share %@%@");
}

- (void)startOperation:toLookupShareParticipants:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Copying share participants for identities %@%@");
}

- (void)_startOperation:toModifyRecordAccessWithLocalItem:allowAccess:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] modifying record access at item %@%@");
}

- (void)_startOperation:toCopyParticipantTokenWithLocalItem:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] copying participant token on item %@%@");
}

- (void)_startOperation:toPrepFolderForSharingWithLocalItem:reply:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: item.clientZone.isPrivateZone%@", v2, v3, v4, v5, v6);
}

- (void)_startOperation:toPrepFolderForSharingWithLocalItem:reply:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] preparing folder for sharing at item %@%@");
}

- (void)_startOperation:toProcessSubitemsWithLocalItem:maxSubsharesFailures:processType:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] processing subitems at item %@%@");
}

- (void)startOperation:toCopyShareURLForShare:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] copying url for share %@%@");
}

void __65__BRCXPCRegularIPCsClient_getShareOptionsOfItemIdentifier_reply___block_invoke_638_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] couldn't find an item for fileObjectID=%@%@");
}

- (void)_presentAcceptDialogsWithMetadata:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] An accept operation is already running for %@%@");
}

void __56__BRCXPCRegularIPCsClient_keepDataLocalOnSignOut_reply___block_invoke_648_cold_1(uint64_t a1)
{
  os_log_t v1 = "YES";
  if (!*(unsigned char *)(a1 + 40)) {
    os_log_t v1 = "NO";
  }
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v2, v3, "[DEBUG] Should keep data local on sign out [%s]%@", (void)v4, DWORD2(v4));
}

@end