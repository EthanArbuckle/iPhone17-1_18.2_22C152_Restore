@interface BDSServiceProxy
- (BDSClientSideListener)clientSideListener;
- (BDSServiceProtocol)remoteObjectProxy;
- (BDSServiceProxy)init;
- (BDSServiceProxy)initWithConnectionDelegate:(id)a3;
- (BDSServiceProxyConnectionDelegate)connectionDelegate;
- (BOOL)connectionHealthy;
- (NSXPCConnection)connection;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)updateReadingNowWithCompletion:(id)a3;
- (id)updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:(BOOL)a3 completion:(id)a4;
- (id)updateWantToReadWithCompletion:(id)a3;
- (void)addStoreItem:(id)a3 completion:(id)a4;
- (void)addStoreItems:(id)a3 completion:(id)a4;
- (void)assetDetailForAssetID:(id)a3 completion:(id)a4;
- (void)assetDetailsForAssetIDs:(id)a3 completion:(id)a4;
- (void)assetReviewForAssetReviewID:(id)a3 completion:(id)a4;
- (void)assetReviewsForAssetReviewIDs:(id)a3 completion:(id)a4;
- (void)audiobookStoreEnabledWithCompletion:(id)a3;
- (void)bookWidgetReadingHistoryStateInfoWithCompletion:(id)a3;
- (void)clearSyncMetadata:(id)a3;
- (void)cloudSyncDiagnosticDetachWithCompletionHandler:(id)a3;
- (void)cloudSyncDiagnosticFindLocalIdDupesWithCompletionHandler:(id)a3;
- (void)cloudSyncDiagnosticInfoWithCompletionHandler:(id)a3;
- (void)collectionDetailForCollectionID:(id)a3 completion:(id)a4;
- (void)collectionDetailsForCollectionIDs:(id)a3 completion:(id)a4;
- (void)collectionMemberForCollectionMemberID:(id)a3 completion:(id)a4;
- (void)currentAssetDetailCloudSyncVersions:(id)a3;
- (void)currentCloudSyncVersions:(id)a3;
- (void)currentCollectionDetailCloudSyncVersions:(id)a3;
- (void)currentCollectionMemberCloudSyncVersions:(id)a3;
- (void)currentReadingNowDetailCloudSyncVersions:(id)a3;
- (void)dealloc;
- (void)deleteAssetDetailForAssetID:(id)a3 completion:(id)a4;
- (void)deleteAssetReviewForAssetReviewID:(id)a3 completion:(id)a4;
- (void)deleteAssetReviewForAssetReviewIDs:(id)a3 completion:(id)a4;
- (void)deleteCollectionDetailForCollectionID:(id)a3 completion:(id)a4;
- (void)deleteCollectionDetailForCollectionIDs:(id)a3 completion:(id)a4;
- (void)deleteCollectionMemberForCollectionMemberID:(id)a3 completion:(id)a4;
- (void)deleteCollectionMemberForCollectionMemberIDs:(id)a3 completion:(id)a4;
- (void)deleteEngagementDataForKey:(id)a3 completion:(id)a4;
- (void)deleteItemsWithStoreIDs:(id)a3 completion:(id)a4;
- (void)deleteReadingNowDetailForAssetID:(id)a3 completion:(id)a4;
- (void)deleteStoreItemWithStoreID:(id)a3 completion:(id)a4;
- (void)deleteStoreItemsWithStoreIDs:(id)a3 completion:(id)a4;
- (void)deleteUserDatumForKey:(id)a3 completion:(id)a4;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)engagementDataForKey:(id)a3 completion:(id)a4;
- (void)engagementDataIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5;
- (void)fetchAllHiddenItemStoreIDsWithCompletion:(id)a3;
- (void)fetchAssetDetailsForUnsyncedTastes:(id)a3;
- (void)fetchAssetDetailsIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)fetchAssetReviewsForUserID:(id)a3 includingDeleted:(BOOL)a4 completion:(id)a5;
- (void)fetchCollectionDetailsIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)fetchCollectionMembersInCollectionID:(id)a3 completion:(id)a4;
- (void)fetchCollectionMembersIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)fetchEngagementDatasIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)fetchFinishedAssetCountByYearWithCompletion:(id)a3;
- (void)fetchFinishedDatesByAssetIDForYear:(int64_t)a3 completion:(id)a4;
- (void)fetchMaxSortOrderInCollectionID:(id)a3 completion:(id)a4;
- (void)fetchMostRecentAudiobookWithCompletion:(id)a3;
- (void)fetchStoreItemsIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)fetchUserDataIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)forceFetchRemoteChanges:(id)a3;
- (void)formXPCConnection;
- (void)getAssetDetailChangesSince:(id)a3 completion:(id)a4;
- (void)getAssetReviewChangesSince:(id)a3 completion:(id)a4;
- (void)getBookWidgetDataWithLimit:(int64_t)a3 completion:(id)a4;
- (void)getBookWidgetInfoWithLimit:(int64_t)a3 completion:(id)a4;
- (void)getCollectionDetailChangesSince:(id)a3 completion:(id)a4;
- (void)getCollectionMemberChangesSince:(id)a3 completion:(id)a4;
- (void)getEngagementDataChangesSince:(id)a3 completion:(id)a4;
- (void)getReadingNowDetailChangesSince:(id)a3 completion:(id)a4;
- (void)getStoreItemChangesSince:(id)a3 completion:(id)a4;
- (void)getUserDataChangesSince:(id)a3 completion:(id)a4;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4;
- (void)mergeMovedReadingHistoryDataWithCompletionHandler:(id)a3;
- (void)monitorServiceNotificationsWithChangeToken:(id)a3 completion:(id)a4;
- (void)needsReadingNowAssetTypePopulation:(id)a3;
- (void)priceTrackingCtlAddTrackedItems:(id)a3 completion:(id)a4;
- (void)priceTrackingCtlGetStateWithCompletion:(id)a3;
- (void)priceTrackingCtlOverrideReferencePrices:(id)a3 completion:(id)a4;
- (void)priceTrackingCtlRefreshTrackedPricesIgnoringSchedule:(BOOL)a3 completion:(id)a4;
- (void)priceTrackingSetConfiguration:(id)a3 completion:(id)a4;
- (void)readingGoalsChangeBooksFinishedGoalTo:(int64_t)a3 withCompletion:(id)a4;
- (void)readingGoalsChangeDailyGoalTo:(double)a3 withCompletion:(id)a4;
- (void)readingGoalsClearDataWithCompletion:(id)a3;
- (void)readingGoalsClearLocalCachedDataWithCompletion:(id)a3;
- (void)readingGoalsStateInfoWithCompletion:(id)a3;
- (void)readingHistoryBackupWithName:(id)a3 completion:(id)a4;
- (void)readingHistoryClearDataWithCompletion:(id)a3;
- (void)readingHistoryClearDate:(id)a3 withCompletion:(id)a4;
- (void)readingHistoryClearDefaultsCachedDataWithCompletion:(id)a3;
- (void)readingHistoryClearTodayWithCompletion:(id)a3;
- (void)readingHistoryHandleSyncFileChangeWithSyncVersionInfo:(id)a3 updateInfo:(id)a4 completion:(id)a5;
- (void)readingHistoryIncrementWithDate:(id)a3 by:(int64_t)a4 withCompletion:(id)a5;
- (void)readingHistoryListBackupWithCompletion:(id)a3;
- (void)readingHistoryReadingHistoryStateInfoWithRangeStart:(id)a3 rangeEnd:(id)a4 currentTime:(id)a5 withCompletion:(id)a6;
- (void)readingHistoryRestoreWithName:(id)a3 completion:(id)a4;
- (void)readingHistoryServiceStatusInfoWithCompletion:(id)a3;
- (void)readingNowDetailsForAssetIDs:(id)a3 completion:(id)a4;
- (void)resetPurchasedTokenForStoreIDs:(id)a3 completion:(id)a4;
- (void)resetStaleJaliscoDatabaseWithCompletion:(id)a3;
- (void)resolvedAssetDetailForAssetID:(id)a3 completion:(id)a4;
- (void)resolvedUserDataValueForKey:(id)a3 completion:(id)a4;
- (void)scheduleRestart;
- (void)setAssetDetail:(id)a3 completion:(id)a4;
- (void)setAssetDetails:(id)a3 completion:(id)a4;
- (void)setAssetReview:(id)a3 completion:(id)a4;
- (void)setAssetReviews:(id)a3 completion:(id)a4;
- (void)setBookWidgetInfo:(id)a3 completion:(id)a4;
- (void)setClientSideListener:(id)a3;
- (void)setCloudSyncPaused:(BOOL)a3;
- (void)setCollectionDetail:(id)a3 completion:(id)a4;
- (void)setCollectionDetails:(id)a3 completion:(id)a4;
- (void)setCollectionMember:(id)a3 completion:(id)a4;
- (void)setCollectionMembers:(id)a3 completion:(id)a4;
- (void)setConnectionHealthy:(BOOL)a3;
- (void)setEnableCloudSync:(BOOL)a3 enableReadingNowSync:(BOOL)a4;
- (void)setEnableCollectionSync:(BOOL)a3;
- (void)setEnableSecureCloudSync:(BOOL)a3;
- (void)setEngagementData:(id)a3 completion:(id)a4;
- (void)setEngagementDatas:(id)a3 completion:(id)a4;
- (void)setItemHidden:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5;
- (void)setReadingNowDetails:(id)a3 completion:(id)a4;
- (void)setUserData:(id)a3 completion:(id)a4;
- (void)setUserDataValue:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setUserDatum:(id)a3 completion:(id)a4;
- (void)shutdown;
- (void)signalFetchChangesTransaction:(id)a3;
- (void)storeItemForStoreID:(id)a3 completion:(id)a4;
- (void)updateBitrateForItemWithAdamID:(id)a3 completion:(id)a4;
- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5;
- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5;
- (void)updatePolitely:(BOOL)a3 uiManager:(id)a4 reason:(int64_t)a5 completion:(id)a6;
- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)userDataValueForKey:(id)a3 completion:(id)a4;
- (void)userDatumForKey:(id)a3 completion:(id)a4;
- (void)userDatumIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5;
@end

@implementation BDSServiceProxy

- (BDSServiceProxy)init
{
  return (BDSServiceProxy *)objc_msgSend_initWithConnectionDelegate_(self, a2, 0, v2, v3, v4, v5, v6);
}

- (BDSServiceProxy)initWithConnectionDelegate:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BDSServiceProxy;
  uint64_t v5 = [(BDSServiceProxy *)&v25 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_connectionDelegate, v4);
    objc_initWeak(&location, v6);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("BDSService Notify Queue", v7);
    notifyQueue = v6->_notifyQueue;
    v6->_notifyQueue = (OS_dispatch_queue *)v8;

    v10 = v6->_notifyQueue;
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = sub_2360C114C;
    v22 = &unk_264CA0BF0;
    objc_copyWeak(&v23, &location);
    notify_register_dispatch("com.apple.iBooks.BookDataStoreService.Started", &v6->_notifyToken, v10, &v19);
    objc_msgSend_formXPCConnection(v6, v11, v12, v13, v14, v15, v16, v17, v19, v20, v21, v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)formXPCConnection
{
  uint64_t v147 = *MEMORY[0x263EF8340];
  uint64_t v3 = BDSCloudKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2360BC000, v3, OS_LOG_TYPE_INFO, "Starting up BDSServiceProxy.", buf, 2u);
  }

  id v4 = objc_alloc(MEMORY[0x263F08D68]);
  v10 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.iBooks.BookDataStoreService", 0, v6, v7, v8, v9);
  connection = self->_connection;
  self->_connection = v10;

  v18 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v12, (uint64_t)&unk_26E98DE90, v13, v14, v15, v16, v17);
  objc_msgSend_configureInterface_(BDSServiceProtocolInterface, v19, (uint64_t)v18, v20, v21, v22, v23, v24);
  objc_super v25 = objc_alloc_init(BDSClientSideListener);
  clientSideListener = self->_clientSideListener;
  self->_clientSideListener = v25;

  v34 = objc_msgSend_connectionDelegate(self, v27, v28, v29, v30, v31, v32, v33);
  objc_msgSend_setDelegate_(self->_clientSideListener, v35, (uint64_t)v34, v36, v37, v38, v39, v40);

  objc_msgSend_setRemoteObjectInterface_(self->_connection, v41, (uint64_t)v18, v42, v43, v44, v45, v46);
  v53 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v47, (uint64_t)&unk_26E98E4A0, v48, v49, v50, v51, v52);
  objc_msgSend_setExportedInterface_(self->_connection, v54, (uint64_t)v53, v55, v56, v57, v58, v59);

  objc_msgSend_setExportedObject_(self->_connection, v60, (uint64_t)self->_clientSideListener, v61, v62, v63, v64, v65);
  objc_initWeak(&location, self);
  objc_msgSend_setInterruptionHandler_(self->_connection, v66, (uint64_t)&unk_26E9712B0, v67, v68, v69, v70, v71);
  uint64_t v139 = MEMORY[0x263EF8330];
  uint64_t v140 = 3221225472;
  v141 = sub_2360C1540;
  v142 = &unk_264CA0B70;
  objc_copyWeak(&v143, &location);
  objc_msgSend_setInvalidationHandler_(self->_connection, v72, (uint64_t)&v139, v73, v74, v75, v76, v77);
  objc_msgSend_remoteObjectProxyWithErrorHandler_(self->_connection, v78, (uint64_t)&unk_26E9712D0, v79, v80, v81, v82, v83, v139, v140, v141, v142);
  v84 = (BDSServiceProtocol *)objc_claimAutoreleasedReturnValue();
  remoteObjectProxy = self->_remoteObjectProxy;
  self->_remoteObjectProxy = v84;

  objc_msgSend_setConnectionHealthy_(self, v86, self->_remoteObjectProxy != 0, v87, v88, v89, v90, v91);
  if (objc_msgSend_connectionHealthy(self, v92, v93, v94, v95, v96, v97, v98))
  {
    v106 = objc_msgSend_shared(MEMORY[0x263F2BA58], v99, v100, v101, v102, v103, v104, v105);
    int v114 = objc_msgSend_verboseLoggingEnabled(v106, v107, v108, v109, v110, v111, v112, v113);

    if (v114)
    {
      v122 = BDSCloudKitDevelopmentLog();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
      {
        v123 = self->_remoteObjectProxy;
        *(_DWORD *)buf = 138543362;
        v146 = v123;
        _os_log_impl(&dword_2360BC000, v122, OS_LOG_TYPE_DEFAULT, "\"\\\"Connection made to remote service with %{public}@\\\"\"", buf, 0xCu);
      }
    }
  }
  else
  {
    objc_msgSend_scheduleRestart(self, v99, v100, v101, v102, v103, v104, v105);
  }
  objc_msgSend_resume(self->_connection, v115, v116, v117, v118, v119, v120, v121);
  v131 = objc_msgSend_connectionDelegate(self, v124, v125, v126, v127, v128, v129, v130);
  objc_msgSend_serviceConnectionDidResume(v131, v132, v133, v134, v135, v136, v137, v138);

  objc_destroyWeak(&v143);
  objc_destroyWeak(&location);
}

- (void)scheduleRestart
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 60000000000);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_2360C16E8;
  v3[3] = &unk_264CA0B70;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  remoteObjectProxy = self->_remoteObjectProxy;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2360C185C;
  v15[3] = &unk_264CA0C18;
  id v16 = v4;
  id v6 = v4;
  uint64_t v13 = objc_msgSend_remoteObjectProxyWithErrorHandler_(remoteObjectProxy, v7, (uint64_t)v15, v8, v9, v10, v11, v12);

  return v13;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  remoteObjectProxy = self->_remoteObjectProxy;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2360C1998;
  v15[3] = &unk_264CA0C18;
  id v16 = v4;
  id v6 = v4;
  uint64_t v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(remoteObjectProxy, v7, (uint64_t)v15, v8, v9, v10, v11, v12);

  return v13;
}

- (void)dealloc
{
  objc_msgSend_shutdown(self, a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)BDSServiceProxy;
  [(BDSServiceProxy *)&v9 dealloc];
}

- (void)shutdown
{
  notify_cancel(self->_notifyToken);
  if (self->_connection)
  {
    uint64_t v3 = BDSCloudKitLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_2360BC000, v3, OS_LOG_TYPE_INFO, "[ServiceProxy]:  Shutting down service proxy.", v12, 2u);
    }

    clientSideListener = self->_clientSideListener;
    self->_clientSideListener = 0;

    objc_msgSend_invalidate(self->_connection, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)setEnableCollectionSync:(BOOL)a3
{
  BOOL v8 = a3;
  objc_msgSend_remoteObjectProxy(self, a2, a3, v3, v4, v5, v6, v7);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnableCollectionSync_(v15, v9, v8, v10, v11, v12, v13, v14);
}

- (void)setEnableCloudSync:(BOOL)a3 enableReadingNowSync:(BOOL)a4
{
  BOOL v8 = a4;
  BOOL v9 = a3;
  objc_msgSend_remoteObjectProxy(self, a2, a3, a4, v4, v5, v6, v7);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnableCloudSync_enableReadingNowSync_(v15, v10, v9, v8, v11, v12, v13, v14);
}

- (void)setEnableSecureCloudSync:(BOOL)a3
{
  BOOL v8 = a3;
  objc_msgSend_remoteObjectProxy(self, a2, a3, v3, v4, v5, v6, v7);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnableSecureCloudSync_(v15, v9, v8, v10, v11, v12, v13, v14);
}

- (void)setCloudSyncPaused:(BOOL)a3
{
  BOOL v8 = a3;
  objc_msgSend_remoteObjectProxy(self, a2, a3, v3, v4, v5, v6, v7);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCloudSyncPaused_(v15, v9, v8, v10, v11, v12, v13, v14);
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_2360C1D5C;
    v32[3] = &unk_264CA0C18;
    id v12 = v4;
    id v33 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v32, v14, v15, v16, v17, v18);
    objc_msgSend_dissociateCloudDataFromSyncWithCompletion_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v30 = (void (**)(void *, void, void *))_Block_copy(v4);
    if (v30)
    {
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v26, @"BDSErrorDomain", 1000, 0, v27, v28, v29);
      v30[2](v30, 0, v31);
    }
  }
}

- (void)signalFetchChangesTransaction:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11) & 1) == 0)
  {
    id v12 = BDSServiceLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2361F616C();
    }
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2360C1F10;
  aBlock[3] = &unk_264CA0C40;
  id v13 = v4;
  id v19 = v13;
  uint64_t v14 = _Block_copy(aBlock);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2360C1F74;
  v16[3] = &unk_264CA0C68;
  id v17 = v13;
  id v15 = v13;
  bds_dispatch_service(self, v16, v14);
}

- (void)assetDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C20B0;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_assetDetailForAssetID_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, 0, v33);
    }
  }
}

- (void)assetDetailsForAssetIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    id v15 = objc_opt_new();
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = sub_2360C23D4;
    v45[4] = sub_2360C23E4;
    id v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = sub_2360C23D4;
    v43[4] = sub_2360C23E4;
    id v44 = 0;
    dispatch_group_t v16 = dispatch_group_create();
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360C23EC;
    v37[3] = &unk_264CA0CE0;
    uint64_t v17 = v16;
    uint64_t v38 = v17;
    uint64_t v39 = self;
    v41 = v43;
    id v18 = v15;
    id v40 = v18;
    uint64_t v42 = v45;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v6, v19, 64, (uint64_t)v37, v20, v21, v22, v23);
    uint64_t v24 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2360C2654;
    block[3] = &unk_264CA0D08;
    id v33 = v18;
    id v34 = v7;
    id v35 = v45;
    uint64_t v36 = v43;
    id v25 = v18;
    dispatch_group_notify(v17, v24, block);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v45, 8);
  }
  else
  {
    uint64_t v30 = _Block_copy(v7);
    if (v30)
    {
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v26, @"BDSErrorDomain", 1000, 0, v27, v28, v29);
      (*((void (**)(void *, void, void, void *))v30 + 2))(v30, 0, 0, v31);
    }
  }
}

- (void)resolvedAssetDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C27F4;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_resolvedAssetDetailForAssetID_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, 0, v33);
    }
  }
}

- (void)currentAssetDetailCloudSyncVersions:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_2360C2950;
    v28[3] = &unk_264CA0C18;
    id v12 = v4;
    id v29 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v28, v14, v15, v16, v17, v18);
    objc_msgSend_currentAssetDetailCloudSyncVersions_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v26 = _Block_copy(v4);
    uint64_t v27 = v26;
    if (v26) {
      (*((void (**)(void *, void))v26 + 2))(v26, 0);
    }
  }
}

- (void)deleteAssetDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    if (v7) {
      uint64_t v15 = v7;
    }
    else {
      uint64_t v15 = &unk_26E9712F0;
    }
    uint64_t v16 = _Block_copy(v15);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C2AEC;
    v35[3] = &unk_264CA0C18;
    id v36 = v7;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_deleteAssetDetailForAssetID_completion_(v23, v24, (uint64_t)v6, (uint64_t)v16, v25, v26, v27, v28);
  }
  else
  {
    id v33 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v33)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v33[2](v33, 0, v34);
    }
  }
}

- (void)fetchAssetDetailsIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10, v11, v12, v13))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2360C2C84;
    v33[3] = &unk_264CA0C18;
    id v14 = v6;
    id v34 = v14;
    uint64_t v21 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v33, v16, v17, v18, v19, v20);
    objc_msgSend_fetchAssetDetailsIncludingDeleted_completion_(v21, v22, v4, (uint64_t)v14, v23, v24, v25, v26);
  }
  else
  {
    uint64_t v31 = _Block_copy(v6);
    if (v31)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v27, @"BDSErrorDomain", 1000, 0, v28, v29, v30);
      (*((void (**)(void *, void, void, void *))v31 + 2))(v31, 0, 0, v32);
    }
  }
}

- (void)getAssetDetailChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C2E34;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_getAssetDetailChangesSince_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = _Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      (*((void (**)(void *, void, void, void, void *, void))v32 + 2))(v32, 0, 0, 0, v33, 0);
    }
  }
}

- (void)setAssetDetail:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    if (v7) {
      id v15 = v7;
    }
    else {
      id v15 = &unk_26E971310;
    }
    uint64_t v16 = _Block_copy(v15);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C3000;
    v35[3] = &unk_264CA0C18;
    id v36 = v7;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_setAssetDetail_completion_(v23, v24, (uint64_t)v6, (uint64_t)v16, v25, v26, v27, v28);
  }
  else
  {
    id v33 = _Block_copy(v7);
    if (v33)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      (*((void (**)(void *, void, void, void *))v33 + 2))(v33, 0, 0, v34);
    }
  }
}

- (void)setAssetDetails:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = sub_2360C23D4;
    v53[4] = sub_2360C23E4;
    id v54 = 0;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    char v52 = 1;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    char v50 = 0;
    dispatch_group_t v15 = dispatch_group_create();
    uint64_t v23 = objc_msgSend_allKeys(v6, v16, v17, v18, v19, v20, v21, v22);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = sub_2360C3334;
    v42[3] = &unk_264CA0DC0;
    uint64_t v24 = v15;
    uint64_t v43 = v24;
    id v44 = v6;
    uint64_t v45 = self;
    id v46 = v53;
    v47 = v51;
    uint64_t v48 = v49;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v23, v25, 64, (uint64_t)v42, v26, v27, v28, v29);

    uint64_t v30 = dispatch_get_global_queue(2, 0);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360C35A4;
    v37[3] = &unk_264CA0DE8;
    id v38 = v7;
    uint64_t v39 = v51;
    id v40 = v49;
    v41 = v53;
    dispatch_group_notify(v24, v30, v37);

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);
  }
  else
  {
    id v35 = _Block_copy(v7);
    if (v35)
    {
      id v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"BDSErrorDomain", 1000, 0, v32, v33, v34);
      (*((void (**)(void *, void, void, void *))v35 + 2))(v35, 0, 0, v36);
    }
  }
}

- (void)fetchAssetDetailsForUnsyncedTastes:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_2360C3738;
    v32[3] = &unk_264CA0C18;
    id v12 = v4;
    id v33 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v32, v14, v15, v16, v17, v18);
    objc_msgSend_fetchAssetDetailsForUnsyncedTastes_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v30 = (void (**)(void *, void, void *))_Block_copy(v4);
    if (v30)
    {
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v26, @"BDSErrorDomain", 1000, 0, v27, v28, v29);
      v30[2](v30, 0, v31);
    }
  }
}

- (void)fetchFinishedDatesByAssetIDForYear:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10, v11, v12, v13))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2360C38CC;
    v33[3] = &unk_264CA0C18;
    id v14 = v6;
    id v34 = v14;
    uint64_t v21 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v33, v16, v17, v18, v19, v20);
    objc_msgSend_fetchFinishedDatesByAssetIDForYear_completion_(v21, v22, a3, (uint64_t)v14, v23, v24, v25, v26);
  }
  else
  {
    uint64_t v31 = (void (**)(void *, void, void *))_Block_copy(v6);
    if (v31)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v27, @"BDSErrorDomain", 1000, 0, v28, v29, v30);
      v31[2](v31, 0, v32);
    }
  }
}

- (void)fetchFinishedAssetCountByYearWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_2360C3A58;
    v32[3] = &unk_264CA0C18;
    id v12 = v4;
    id v33 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v32, v14, v15, v16, v17, v18);
    objc_msgSend_fetchFinishedAssetCountByYearWithCompletion_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v30 = (void (**)(void *, void, void *))_Block_copy(v4);
    if (v30)
    {
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v26, @"BDSErrorDomain", 1000, 0, v27, v28, v29);
      v30[2](v30, 0, v31);
    }
  }
}

- (void)readingNowDetailsForAssetIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    uint64_t v15 = objc_opt_new();
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = sub_2360C23D4;
    v45[4] = sub_2360C23E4;
    id v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = sub_2360C23D4;
    v43[4] = sub_2360C23E4;
    id v44 = 0;
    dispatch_group_t v16 = dispatch_group_create();
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360C3D7C;
    v37[3] = &unk_264CA0CE0;
    uint64_t v17 = v16;
    id v38 = v17;
    uint64_t v39 = self;
    v41 = v43;
    id v18 = v15;
    id v40 = v18;
    uint64_t v42 = v45;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v6, v19, 64, (uint64_t)v37, v20, v21, v22, v23);
    uint64_t v24 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2360C3FE4;
    block[3] = &unk_264CA0D08;
    id v33 = v18;
    id v34 = v7;
    id v35 = v45;
    id v36 = v43;
    id v25 = v18;
    dispatch_group_notify(v17, v24, block);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v45, 8);
  }
  else
  {
    uint64_t v30 = _Block_copy(v7);
    if (v30)
    {
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v26, @"BDSErrorDomain", 1000, 0, v27, v28, v29);
      (*((void (**)(void *, void, void, void *))v30 + 2))(v30, 0, 0, v31);
    }
  }
}

- (void)currentReadingNowDetailCloudSyncVersions:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_2360C4140;
    v28[3] = &unk_264CA0C18;
    id v12 = v4;
    id v29 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v28, v14, v15, v16, v17, v18);
    objc_msgSend_currentReadingNowDetailCloudSyncVersions_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v26 = _Block_copy(v4);
    uint64_t v27 = v26;
    if (v26) {
      (*((void (**)(void *, void))v26 + 2))(v26, 0);
    }
  }
}

- (void)deleteReadingNowDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    if (v7) {
      uint64_t v15 = v7;
    }
    else {
      uint64_t v15 = &unk_26E971330;
    }
    uint64_t v16 = _Block_copy(v15);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C42DC;
    v35[3] = &unk_264CA0C18;
    id v36 = v7;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_deleteReadingNowDetailForAssetID_completion_(v23, v24, (uint64_t)v6, (uint64_t)v16, v25, v26, v27, v28);
  }
  else
  {
    id v33 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v33)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v33[2](v33, 0, v34);
    }
  }
}

- (void)getReadingNowDetailChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C4488;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_getReadingNowDetailChangesSince_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = _Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      (*((void (**)(void *, void, void, void, void *, void))v32 + 2))(v32, 0, 0, 0, v33, 0);
    }
  }
}

- (void)setReadingNowDetails:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = sub_2360C23D4;
    v53[4] = sub_2360C23E4;
    id v54 = 0;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    char v52 = 1;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    char v50 = 0;
    dispatch_group_t v15 = dispatch_group_create();
    uint64_t v23 = objc_msgSend_allKeys(v6, v16, v17, v18, v19, v20, v21, v22);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = sub_2360C47C4;
    v42[3] = &unk_264CA0DC0;
    uint64_t v24 = v15;
    uint64_t v43 = v24;
    id v44 = v6;
    uint64_t v45 = self;
    id v46 = v53;
    v47 = v51;
    uint64_t v48 = v49;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v23, v25, 64, (uint64_t)v42, v26, v27, v28, v29);

    uint64_t v30 = dispatch_get_global_queue(2, 0);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360C4A34;
    v37[3] = &unk_264CA0DE8;
    id v38 = v7;
    uint64_t v39 = v51;
    id v40 = v49;
    v41 = v53;
    dispatch_group_notify(v24, v30, v37);

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);
  }
  else
  {
    id v35 = _Block_copy(v7);
    if (v35)
    {
      id v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"BDSErrorDomain", 1000, 0, v32, v33, v34);
      (*((void (**)(void *, void, void, void *))v35 + 2))(v35, 0, 0, v36);
    }
  }
}

- (void)needsReadingNowAssetTypePopulation:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_2360C4BC8;
    v32[3] = &unk_264CA0C18;
    id v12 = v4;
    id v33 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v32, v14, v15, v16, v17, v18);
    objc_msgSend_needsReadingNowAssetTypePopulation_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v30 = (void (**)(void *, void, void *))_Block_copy(v4);
    if (v30)
    {
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v26, @"BDSErrorDomain", 1000, 0, v27, v28, v29);
      v30[2](v30, 0, v31);
    }
  }
}

- (void)assetReviewForAssetReviewID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C4D68;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_assetReviewForAssetReviewID_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, 0, v33);
    }
  }
}

- (void)assetReviewsForAssetReviewIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    id v15 = objc_opt_new();
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = sub_2360C23D4;
    v45[4] = sub_2360C23E4;
    id v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = sub_2360C23D4;
    v43[4] = sub_2360C23E4;
    id v44 = 0;
    dispatch_group_t v16 = dispatch_group_create();
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360C508C;
    v37[3] = &unk_264CA0CE0;
    uint64_t v17 = v16;
    id v38 = v17;
    uint64_t v39 = self;
    v41 = v43;
    id v18 = v15;
    id v40 = v18;
    uint64_t v42 = v45;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v6, v19, 64, (uint64_t)v37, v20, v21, v22, v23);
    uint64_t v24 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2360C52F4;
    block[3] = &unk_264CA0D08;
    id v33 = v18;
    id v34 = v7;
    id v35 = v45;
    id v36 = v43;
    id v25 = v18;
    dispatch_group_notify(v17, v24, block);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v45, 8);
  }
  else
  {
    uint64_t v30 = _Block_copy(v7);
    if (v30)
    {
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v26, @"BDSErrorDomain", 1000, 0, v27, v28, v29);
      (*((void (**)(void *, void, void, void *))v30 + 2))(v30, 0, 0, v31);
    }
  }
}

- (void)deleteAssetReviewForAssetReviewID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    if (v7) {
      id v15 = v7;
    }
    else {
      id v15 = &unk_26E971350;
    }
    dispatch_group_t v16 = _Block_copy(v15);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C54B0;
    v35[3] = &unk_264CA0C18;
    id v36 = v7;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_deleteAssetReviewForAssetReviewID_completion_(v23, v24, (uint64_t)v6, (uint64_t)v16, v25, v26, v27, v28);
  }
  else
  {
    id v33 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v33)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v33[2](v33, 0, v34);
    }
  }
}

- (void)deleteAssetReviewForAssetReviewIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    if (v7) {
      id v15 = v7;
    }
    else {
      id v15 = &unk_26E971370;
    }
    dispatch_group_t v16 = _Block_copy(v15);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C566C;
    v35[3] = &unk_264CA0C18;
    id v36 = v7;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_deleteAssetReviewForAssetReviewIDs_completion_(v23, v24, (uint64_t)v6, (uint64_t)v16, v25, v26, v27, v28);
  }
  else
  {
    id v33 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v33)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v33[2](v33, 0, v34);
    }
  }
}

- (void)fetchAssetReviewsForUserID:(id)a3 includingDeleted:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13, v14, v15, v16))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C5820;
    v35[3] = &unk_264CA0C18;
    id v17 = v9;
    id v36 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v35, v19, v20, v21, v22, v23);
    objc_msgSend_fetchAssetReviewsForUserID_includingDeleted_completion_(v24, v25, (uint64_t)v8, v6, (uint64_t)v17, v26, v27, v28);
  }
  else
  {
    id v33 = _Block_copy(v9);
    if (v33)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      (*((void (**)(void *, void, void, void *))v33 + 2))(v33, 0, 0, v34);
    }
  }
}

- (void)getAssetReviewChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C59D0;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_getAssetReviewChangesSince_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = _Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      (*((void (**)(void *, void, void, void, void *, void))v32 + 2))(v32, 0, 0, 0, v33, 0);
    }
  }
}

- (void)setAssetReview:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    if (v7) {
      id v15 = v7;
    }
    else {
      id v15 = &unk_26E971390;
    }
    uint64_t v16 = _Block_copy(v15);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C5B9C;
    v35[3] = &unk_264CA0C18;
    id v36 = v7;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_setAssetReview_completion_(v23, v24, (uint64_t)v6, (uint64_t)v16, v25, v26, v27, v28);
  }
  else
  {
    id v33 = _Block_copy(v7);
    if (v33)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      (*((void (**)(void *, void, void, void *))v33 + 2))(v33, 0, 0, v34);
    }
  }
}

- (void)setAssetReviews:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = sub_2360C23D4;
    v53[4] = sub_2360C23E4;
    id v54 = 0;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    char v52 = 1;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    char v50 = 0;
    dispatch_group_t v15 = dispatch_group_create();
    uint64_t v23 = objc_msgSend_allKeys(v6, v16, v17, v18, v19, v20, v21, v22);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = sub_2360C5ED0;
    v42[3] = &unk_264CA0DC0;
    uint64_t v24 = v15;
    uint64_t v43 = v24;
    id v44 = v6;
    uint64_t v45 = self;
    id v46 = v53;
    v47 = v51;
    uint64_t v48 = v49;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v23, v25, 64, (uint64_t)v42, v26, v27, v28, v29);

    uint64_t v30 = dispatch_get_global_queue(2, 0);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360C6140;
    v37[3] = &unk_264CA0DE8;
    id v38 = v7;
    uint64_t v39 = v51;
    id v40 = v49;
    v41 = v53;
    dispatch_group_notify(v24, v30, v37);

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);
  }
  else
  {
    id v35 = _Block_copy(v7);
    if (v35)
    {
      id v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"BDSErrorDomain", 1000, 0, v32, v33, v34);
      (*((void (**)(void *, void, void, void *))v35 + 2))(v35, 0, 0, v36);
    }
  }
}

- (void)addStoreItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    if (v7) {
      dispatch_group_t v15 = v7;
    }
    else {
      dispatch_group_t v15 = &unk_26E9713B0;
    }
    uint64_t v16 = _Block_copy(v15);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C6308;
    v35[3] = &unk_264CA0C18;
    id v36 = v7;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_addStoreItem_completion_(v23, v24, (uint64_t)v6, (uint64_t)v16, v25, v26, v27, v28);
  }
  else
  {
    uint64_t v33 = _Block_copy(v7);
    if (v33)
    {
      uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      (*((void (**)(void *, void, void, void *))v33 + 2))(v33, 0, 0, v34);
    }
  }
}

- (void)addStoreItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = sub_2360C23D4;
    v53[4] = sub_2360C23E4;
    id v54 = 0;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    char v52 = 1;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    char v50 = 0;
    dispatch_group_t v15 = dispatch_group_create();
    uint64_t v23 = objc_msgSend_allKeys(v6, v16, v17, v18, v19, v20, v21, v22);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = sub_2360C663C;
    v42[3] = &unk_264CA0DC0;
    uint64_t v24 = v15;
    uint64_t v43 = v24;
    id v44 = v6;
    uint64_t v45 = self;
    id v46 = v53;
    v47 = v51;
    uint64_t v48 = v49;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v23, v25, 64, (uint64_t)v42, v26, v27, v28, v29);

    uint64_t v30 = dispatch_get_global_queue(2, 0);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360C68AC;
    v37[3] = &unk_264CA0DE8;
    id v38 = v7;
    uint64_t v39 = v51;
    id v40 = v49;
    v41 = v53;
    dispatch_group_notify(v24, v30, v37);

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);
  }
  else
  {
    id v35 = _Block_copy(v7);
    if (v35)
    {
      id v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"BDSErrorDomain", 1000, 0, v32, v33, v34);
      (*((void (**)(void *, void, void, void *))v35 + 2))(v35, 0, 0, v36);
    }
  }
}

- (void)deleteStoreItemWithStoreID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    if (v7) {
      dispatch_group_t v15 = v7;
    }
    else {
      dispatch_group_t v15 = &unk_26E9713D0;
    }
    uint64_t v16 = _Block_copy(v15);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C6A70;
    v35[3] = &unk_264CA0C18;
    id v36 = v7;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_deleteStoreItemWithStoreID_completion_(v23, v24, (uint64_t)v6, (uint64_t)v16, v25, v26, v27, v28);
  }
  else
  {
    uint64_t v33 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v33)
    {
      uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v33[2](v33, 0, v34);
    }
  }
}

- (void)deleteStoreItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    if (v7) {
      dispatch_group_t v15 = v7;
    }
    else {
      dispatch_group_t v15 = &unk_26E9713F0;
    }
    uint64_t v16 = _Block_copy(v15);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C6C2C;
    v35[3] = &unk_264CA0C18;
    id v36 = v7;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_deleteStoreItemsWithStoreIDs_completion_(v23, v24, (uint64_t)v6, (uint64_t)v16, v25, v26, v27, v28);
  }
  else
  {
    uint64_t v33 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v33)
    {
      uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v33[2](v33, 0, v34);
    }
  }
}

- (void)fetchStoreItemsIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10, v11, v12, v13))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2360C6DC4;
    v33[3] = &unk_264CA0C18;
    id v14 = v6;
    id v34 = v14;
    uint64_t v21 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v33, v16, v17, v18, v19, v20);
    objc_msgSend_fetchStoreItemsIncludingDeleted_completion_(v21, v22, v4, (uint64_t)v14, v23, v24, v25, v26);
  }
  else
  {
    uint64_t v31 = _Block_copy(v6);
    if (v31)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v27, @"BDSErrorDomain", 1000, 0, v28, v29, v30);
      (*((void (**)(void *, void, void, void *))v31 + 2))(v31, 0, 0, v32);
    }
  }
}

- (void)getStoreItemChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C6F74;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_getStoreItemChangesSince_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = _Block_copy(v7);
    if (v32)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      (*((void (**)(void *, void, void, void, void *, void))v32 + 2))(v32, 0, 0, 0, v33, 0);
    }
  }
}

- (void)storeItemForStoreID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C7120;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_storeItemForStoreID_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v32)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, 0, v33);
    }
  }
}

- (void)collectionDetailForCollectionID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C72C0;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_collectionDetailForCollectionID_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v32)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, 0, v33);
    }
  }
}

- (void)collectionDetailsForCollectionIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    id v15 = objc_opt_new();
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = sub_2360C23D4;
    v45[4] = sub_2360C23E4;
    id v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = sub_2360C23D4;
    v43[4] = sub_2360C23E4;
    id v44 = 0;
    dispatch_group_t v16 = dispatch_group_create();
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360C75E4;
    v37[3] = &unk_264CA0CE0;
    uint64_t v17 = v16;
    id v38 = v17;
    uint64_t v39 = self;
    v41 = v43;
    id v18 = v15;
    id v40 = v18;
    uint64_t v42 = v45;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v6, v19, 64, (uint64_t)v37, v20, v21, v22, v23);
    uint64_t v24 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2360C784C;
    block[3] = &unk_264CA0D08;
    id v33 = v18;
    id v34 = v7;
    id v35 = v45;
    id v36 = v43;
    id v25 = v18;
    dispatch_group_notify(v17, v24, block);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v45, 8);
  }
  else
  {
    uint64_t v30 = _Block_copy(v7);
    if (v30)
    {
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v26, @"BDSErrorDomain", 1000, 0, v27, v28, v29);
      (*((void (**)(void *, void, void, void *))v30 + 2))(v30, 0, 0, v31);
    }
  }
}

- (void)currentCollectionDetailCloudSyncVersions:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_2360C79A8;
    v28[3] = &unk_264CA0C18;
    id v12 = v4;
    id v29 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v28, v14, v15, v16, v17, v18);
    objc_msgSend_currentCollectionDetailCloudSyncVersions_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v26 = _Block_copy(v4);
    uint64_t v27 = v26;
    if (v26) {
      (*((void (**)(void *, void))v26 + 2))(v26, 0);
    }
  }
}

- (void)deleteCollectionDetailForCollectionID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v7) {
    id v7 = &unk_26E971410;
  }
  uint64_t v9 = _Block_copy(v7);
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13, v14, v15, v16))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C7B4C;
    v35[3] = &unk_264CA0C18;
    id v36 = v8;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_deleteCollectionDetailForCollectionID_completion_(v23, v24, (uint64_t)v6, (uint64_t)v9, v25, v26, v27, v28);
  }
  else
  {
    id v33 = (void (**)(void *, void, void *))_Block_copy(v8);
    if (v33)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v33[2](v33, 0, v34);
    }
  }
}

- (void)deleteCollectionDetailForCollectionIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v7) {
    id v7 = &unk_26E971430;
  }
  uint64_t v9 = _Block_copy(v7);
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13, v14, v15, v16))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C7D10;
    v35[3] = &unk_264CA0C18;
    id v36 = v8;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_deleteCollectionDetailForCollectionIDs_completion_(v23, v24, (uint64_t)v6, (uint64_t)v9, v25, v26, v27, v28);
  }
  else
  {
    id v33 = (void (**)(void *, void, void *))_Block_copy(v8);
    if (v33)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v33[2](v33, 0, v34);
    }
  }
}

- (void)fetchCollectionDetailsIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10, v11, v12, v13))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2360C7EA8;
    v33[3] = &unk_264CA0C18;
    id v14 = v6;
    id v34 = v14;
    uint64_t v21 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v33, v16, v17, v18, v19, v20);
    objc_msgSend_fetchCollectionDetailsIncludingDeleted_completion_(v21, v22, v4, (uint64_t)v14, v23, v24, v25, v26);
  }
  else
  {
    uint64_t v31 = _Block_copy(v6);
    if (v31)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v27, @"BDSErrorDomain", 1000, 0, v28, v29, v30);
      (*((void (**)(void *, void, void, void *))v31 + 2))(v31, 0, 0, v32);
    }
  }
}

- (void)getCollectionDetailChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C8058;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_getCollectionDetailChangesSince_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = _Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      (*((void (**)(void *, void, void, void, void *, void))v32 + 2))(v32, 0, 0, 0, v33, 0);
    }
  }
}

- (void)setCollectionDetail:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v7) {
    id v7 = &unk_26E971450;
  }
  uint64_t v9 = _Block_copy(v7);
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13, v14, v15, v16))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C822C;
    v35[3] = &unk_264CA0C18;
    id v36 = v8;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_setCollectionDetail_completion_(v23, v24, (uint64_t)v6, (uint64_t)v9, v25, v26, v27, v28);
  }
  else
  {
    id v33 = _Block_copy(v8);
    if (v33)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      (*((void (**)(void *, void, void, void *))v33 + 2))(v33, 0, 0, v34);
    }
  }
}

- (void)setCollectionDetails:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = sub_2360C23D4;
    v53[4] = sub_2360C23E4;
    id v54 = 0;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    char v52 = 1;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    char v50 = 0;
    dispatch_group_t v15 = dispatch_group_create();
    uint64_t v23 = objc_msgSend_allKeys(v6, v16, v17, v18, v19, v20, v21, v22);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = sub_2360C8560;
    v42[3] = &unk_264CA0DC0;
    uint64_t v24 = v15;
    uint64_t v43 = v24;
    id v44 = v6;
    uint64_t v45 = self;
    id v46 = v53;
    v47 = v51;
    uint64_t v48 = v49;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v23, v25, 64, (uint64_t)v42, v26, v27, v28, v29);

    uint64_t v30 = dispatch_get_global_queue(2, 0);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360C87D0;
    v37[3] = &unk_264CA0DE8;
    id v38 = v7;
    uint64_t v39 = v51;
    id v40 = v49;
    v41 = v53;
    dispatch_group_notify(v24, v30, v37);

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);
  }
  else
  {
    id v35 = _Block_copy(v7);
    if (v35)
    {
      id v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"BDSErrorDomain", 1000, 0, v32, v33, v34);
      (*((void (**)(void *, void, void, void *))v35 + 2))(v35, 0, 0, v36);
    }
  }
}

- (void)collectionMemberForCollectionMemberID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C8978;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_collectionMemberForCollectionMemberID_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v32)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, 0, v33);
    }
  }
}

- (void)currentCollectionMemberCloudSyncVersions:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_2360C8AD4;
    v28[3] = &unk_264CA0C18;
    id v12 = v4;
    id v29 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v28, v14, v15, v16, v17, v18);
    objc_msgSend_currentCollectionMemberCloudSyncVersions_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v26 = _Block_copy(v4);
    uint64_t v27 = v26;
    if (v26) {
      (*((void (**)(void *, void))v26 + 2))(v26, 0);
    }
  }
}

- (void)deleteCollectionMemberForCollectionMemberID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v7) {
    id v7 = &unk_26E971470;
  }
  uint64_t v9 = _Block_copy(v7);
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13, v14, v15, v16))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C8C78;
    v35[3] = &unk_264CA0C18;
    id v36 = v8;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_deleteCollectionMemberForCollectionMemberID_completion_(v23, v24, (uint64_t)v6, (uint64_t)v9, v25, v26, v27, v28);
  }
  else
  {
    uint64_t v33 = (void (**)(void *, void, void *))_Block_copy(v8);
    if (v33)
    {
      uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v33[2](v33, 0, v34);
    }
  }
}

- (void)deleteCollectionMemberForCollectionMemberIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v7) {
    id v7 = &unk_26E971490;
  }
  uint64_t v9 = _Block_copy(v7);
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13, v14, v15, v16))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C8E3C;
    v35[3] = &unk_264CA0C18;
    id v36 = v8;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_deleteCollectionMemberForCollectionMemberIDs_completion_(v23, v24, (uint64_t)v6, (uint64_t)v9, v25, v26, v27, v28);
  }
  else
  {
    uint64_t v33 = (void (**)(void *, void, void *))_Block_copy(v8);
    if (v33)
    {
      uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v33[2](v33, 0, v34);
    }
  }
}

- (void)fetchCollectionMembersIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10, v11, v12, v13))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2360C8FD4;
    v33[3] = &unk_264CA0C18;
    id v14 = v6;
    id v34 = v14;
    uint64_t v21 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v33, v16, v17, v18, v19, v20);
    objc_msgSend_fetchCollectionMembersIncludingDeleted_completion_(v21, v22, v4, (uint64_t)v14, v23, v24, v25, v26);
  }
  else
  {
    uint64_t v31 = _Block_copy(v6);
    if (v31)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v27, @"BDSErrorDomain", 1000, 0, v28, v29, v30);
      (*((void (**)(void *, void, void, void *))v31 + 2))(v31, 0, 0, v32);
    }
  }
}

- (void)fetchCollectionMembersInCollectionID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C917C;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_fetchCollectionMembersInCollectionID_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = _Block_copy(v7);
    if (v32)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      (*((void (**)(void *, void, void, void *))v32 + 2))(v32, 0, 0, v33);
    }
  }
}

- (void)getCollectionMemberChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C932C;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_getCollectionMemberChangesSince_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = _Block_copy(v7);
    if (v32)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      (*((void (**)(void *, void, void, void, void *, void))v32 + 2))(v32, 0, 0, 0, v33, 0);
    }
  }
}

- (void)setCollectionMember:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v7) {
    id v7 = &unk_26E9714B0;
  }
  uint64_t v9 = _Block_copy(v7);
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13, v14, v15, v16))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360C9500;
    v35[3] = &unk_264CA0C18;
    id v36 = v8;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_setCollectionMember_completion_(v23, v24, (uint64_t)v6, (uint64_t)v9, v25, v26, v27, v28);
  }
  else
  {
    uint64_t v33 = _Block_copy(v8);
    if (v33)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      (*((void (**)(void *, void, void, void *))v33 + 2))(v33, 0, 0, v34);
    }
  }
}

- (void)setCollectionMembers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = sub_2360C23D4;
    v53[4] = sub_2360C23E4;
    id v54 = 0;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    char v52 = 1;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    char v50 = 0;
    dispatch_group_t v15 = dispatch_group_create();
    uint64_t v23 = objc_msgSend_allKeys(v6, v16, v17, v18, v19, v20, v21, v22);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = sub_2360C9834;
    v42[3] = &unk_264CA0DC0;
    uint64_t v24 = v15;
    uint64_t v43 = v24;
    id v44 = v6;
    uint64_t v45 = self;
    id v46 = v53;
    v47 = v51;
    uint64_t v48 = v49;
    objc_msgSend_bds_traverseBatchesOfSize_block_(v23, v25, 64, (uint64_t)v42, v26, v27, v28, v29);

    uint64_t v30 = dispatch_get_global_queue(2, 0);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360C9AA4;
    v37[3] = &unk_264CA0DE8;
    id v38 = v7;
    uint64_t v39 = v51;
    id v40 = v49;
    v41 = v53;
    dispatch_group_notify(v24, v30, v37);

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);
  }
  else
  {
    id v35 = _Block_copy(v7);
    if (v35)
    {
      id v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"BDSErrorDomain", 1000, 0, v32, v33, v34);
      (*((void (**)(void *, void, void, void *))v35 + 2))(v35, 0, 0, v36);
    }
  }
}

- (void)fetchMaxSortOrderInCollectionID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360C9C4C;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_fetchMaxSortOrderInCollectionID_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v32)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, 0, v33);
    }
  }
}

- (void)fetchMostRecentAudiobookWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_2360C9DD8;
    v32[3] = &unk_264CA0C18;
    id v12 = v4;
    id v33 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v32, v14, v15, v16, v17, v18);
    objc_msgSend_fetchMostRecentAudiobookWithCompletion_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v30 = (void (**)(void *, void, void *))_Block_copy(v4);
    if (v30)
    {
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v26, @"BDSErrorDomain", 1000, 0, v27, v28, v29);
      v30[2](v30, 0, v31);
    }
  }
}

- (id)updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10, v11, v12, v13))
  {
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = sub_2360C9FA4;
    v47[3] = &unk_264CA0C18;
    id v14 = v6;
    id v48 = v14;
    uint64_t v21 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v47, v16, v17, v18, v19, v20);
    uint64_t v27 = objc_msgSend_updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful_completion_(v21, v22, v4, (uint64_t)v14, v23, v24, v25, v26);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void *))_Block_copy(v6);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, v33);
    }
    uint64_t v27 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x263F08AB8], v34, 1, v35, v36, v37, v38, v39);
    objc_msgSend_setTotalUnitCount_(v27, v40, 1, v41, v42, v43, v44, v45);
  }

  return v27;
}

- (id)updateWantToReadWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = sub_2360CA164;
    v46[3] = &unk_264CA0C18;
    id v12 = v4;
    id v47 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v46, v14, v15, v16, v17, v18);
    uint64_t v26 = objc_msgSend_updateWantToReadWithCompletion_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v31 = (void (**)(void *, void *))_Block_copy(v4);
    if (v31)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v27, @"BDSErrorDomain", 1000, 0, v28, v29, v30);
      v31[2](v31, v32);
    }
    uint64_t v26 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x263F08AB8], v33, 1, v34, v35, v36, v37, v38);
    objc_msgSend_setTotalUnitCount_(v26, v39, 1, v40, v41, v42, v43, v44);
  }

  return v26;
}

- (id)updateReadingNowWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = sub_2360CA324;
    v46[3] = &unk_264CA0C18;
    id v12 = v4;
    id v47 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v46, v14, v15, v16, v17, v18);
    uint64_t v26 = objc_msgSend_updateReadingNowWithCompletion_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v31 = (void (**)(void *, void *))_Block_copy(v4);
    if (v31)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v27, @"BDSErrorDomain", 1000, 0, v28, v29, v30);
      v31[2](v31, v32);
    }
    uint64_t v26 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x263F08AB8], v33, 1, v34, v35, v36, v37, v38);
    objc_msgSend_setTotalUnitCount_(v26, v39, 1, v40, v41, v42, v43, v44);
  }

  return v26;
}

- (void)updateBitrateForItemWithAdamID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CA4BC;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_updateBitrateForItemWithAdamID_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void *))_Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, v33);
    }
  }
}

- (void)audiobookStoreEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_2360CA644;
    v32[3] = &unk_264CA0C18;
    id v12 = v4;
    id v33 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v32, v14, v15, v16, v17, v18);
    objc_msgSend_audiobookStoreEnabledWithCompletion_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v30 = (void (**)(void *, void, void *))_Block_copy(v4);
    if (v30)
    {
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v26, @"BDSErrorDomain", 1000, 0, v27, v28, v29);
      v30[2](v30, 0, v31);
    }
  }
}

- (void)currentCloudSyncVersions:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_2360CA7BC;
    v28[3] = &unk_264CA0C18;
    id v12 = v4;
    id v29 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v28, v14, v15, v16, v17, v18);
    objc_msgSend_currentCloudSyncVersions_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v26 = _Block_copy(v4);
    uint64_t v27 = v26;
    if (v26) {
      (*((void (**)(void *, void))v26 + 2))(v26, 0);
    }
  }
}

- (void)setUserDatum:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CA940;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_setUserDatum_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = _Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      (*((void (**)(void *, void, void, void *))v32 + 2))(v32, 0, 0, v33);
    }
  }
}

- (void)setUserData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CAAE8;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_setUserData_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = _Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      (*((void (**)(void *, void, void, void *))v32 + 2))(v32, 0, 0, v33);
    }
  }
}

- (void)deleteUserDatumForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CAC8C;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_deleteUserDatumForKey_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, 0, v33);
    }
  }
}

- (void)userDatumForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CAE2C;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_userDatumForKey_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, 0, v33);
    }
  }
}

- (void)userDatumIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v33 = a4;
  id v8 = a5;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12, v13, v14, v15))
  {
    objc_msgSend_remoteObjectProxy(self, v16, v17, v18, v19, v20, v21, v22);
    uint64_t v23 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_userDatumIncludingDeleted_forKey_completion_(v23, v24, v6, (uint64_t)v33, (uint64_t)v8, v25, v26, v27);
  }
  else
  {
    uint64_t v23 = (void (**)(void, void, void))_Block_copy(v8);
    if (v23)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      ((void (**)(void, void, void *))v23)[2](v23, 0, v32);
    }
  }
}

- (void)fetchUserDataIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10, v11, v12, v13))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2360CB0AC;
    v33[3] = &unk_264CA0C18;
    id v14 = v6;
    id v34 = v14;
    uint64_t v21 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v33, v16, v17, v18, v19, v20);
    objc_msgSend_fetchUserDataIncludingDeleted_completion_(v21, v22, v4, (uint64_t)v14, v23, v24, v25, v26);
  }
  else
  {
    uint64_t v31 = _Block_copy(v6);
    if (v31)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v27, @"BDSErrorDomain", 1000, 0, v28, v29, v30);
      (*((void (**)(void *, void, void, void *))v31 + 2))(v31, 0, 0, v32);
    }
  }
}

- (void)getUserDataChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CB25C;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_getUserDataChangesSince_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = _Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      (*((void (**)(void *, void, void, void, void *, void))v32 + 2))(v32, 0, 0, 0, v33, 0);
    }
  }
}

- (void)resolvedUserDataValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CB408;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_resolvedUserDataValueForKey_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, 0, v33);
    }
  }
}

- (void)userDataValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CB5A8;
    v34[3] = &unk_264CA0C18;
    id v15 = v7;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v34, v17, v18, v19, v20, v21);
    objc_msgSend_userDataValueForKey_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v32 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v32)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v32[2](v32, 0, v33);
    }
  }
}

- (void)setUserDataValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend_connectionHealthy(self, v11, v12, v13, v14, v15, v16, v17))
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = sub_2360CB760;
    v36[3] = &unk_264CA0C18;
    id v18 = v10;
    id v37 = v18;
    uint64_t v25 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v19, (uint64_t)v36, v20, v21, v22, v23, v24);
    objc_msgSend_setUserDataValue_forKey_completion_(v25, v26, (uint64_t)v8, (uint64_t)v9, (uint64_t)v18, v27, v28, v29);
  }
  else
  {
    id v34 = (void (**)(void *, void *))_Block_copy(v10);
    if (v34)
    {
      id v35 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"BDSErrorDomain", 1000, 0, v31, v32, v33);
      v34[2](v34, v35);
    }
  }
}

- (void)deleteEngagementDataForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360CB920;
    v35[3] = &unk_264CA0C18;
    uint64_t v15 = (void (**)(void *, void, void *))v7;
    uint64_t v36 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v35, v17, v18, v19, v20, v21);
    objc_msgSend_deleteEngagementDataForKey_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);

    uint64_t v28 = v36;
  }
  else
  {
    uint64_t v29 = BDSServiceLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_2361F624C();
    }

    uint64_t v28 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v28)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"BDSErrorDomain", 1000, 0, v31, v32, v33);
      v28[2](v28, 0, v34);
    }
  }
}

- (void)engagementDataForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360CBB00;
    v35[3] = &unk_264CA0C18;
    uint64_t v15 = (void (**)(void *, void, void *))v7;
    uint64_t v36 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v35, v17, v18, v19, v20, v21);
    objc_msgSend_engagementDataForKey_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);

    uint64_t v28 = v36;
  }
  else
  {
    uint64_t v29 = BDSServiceLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_2361F62E8();
    }

    uint64_t v28 = (void (**)(void *, void, void *))_Block_copy(v7);
    if (v28)
    {
      id v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"BDSErrorDomain", 1000, 0, v31, v32, v33);
      v28[2](v28, 0, v34);
    }
  }
}

- (void)engagementDataIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13, v14, v15, v16))
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = sub_2360CBCF0;
    v36[3] = &unk_264CA0C18;
    uint64_t v17 = (void (**)(void *, void, void *))v9;
    id v37 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v36, v19, v20, v21, v22, v23);
    objc_msgSend_engagementDataIncludingDeleted_forKey_completion_(v24, v25, v6, (uint64_t)v8, (uint64_t)v17, v26, v27, v28);

    uint64_t v29 = v37;
  }
  else
  {
    uint64_t v30 = BDSServiceLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_2361F6384();
    }

    uint64_t v29 = (void (**)(void *, void, void *))_Block_copy(v9);
    if (v29)
    {
      id v35 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"BDSErrorDomain", 1000, 0, v32, v33, v34);
      v29[2](v29, 0, v35);
    }
  }
}

- (void)fetchEngagementDatasIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10, v11, v12, v13))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CBEC8;
    v34[3] = &unk_264CA0C18;
    id v14 = v6;
    id v35 = v14;
    uint64_t v21 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v34, v16, v17, v18, v19, v20);
    objc_msgSend_fetchEngagementDatasIncludingDeleted_completion_(v21, v22, v4, (uint64_t)v14, v23, v24, v25, v26);

    uint64_t v27 = v35;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F6420();
    }

    uint64_t v27 = _Block_copy(v6);
    if (v27)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      (*((void (**)(void *, void, void, void *))v27 + 2))(v27, 0, 0, v33);
    }
  }
}

- (void)getEngagementDataChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360CC0B8;
    v35[3] = &unk_264CA0C18;
    id v15 = v7;
    id v36 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v35, v17, v18, v19, v20, v21);
    objc_msgSend_getEngagementDataChangesSince_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);

    uint64_t v28 = v36;
  }
  else
  {
    uint64_t v29 = BDSServiceLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_2361F64BC();
    }

    uint64_t v28 = _Block_copy(v7);
    if (v28)
    {
      uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"BDSErrorDomain", 1000, 0, v31, v32, v33);
      (*((void (**)(void *, void, void, void, void *, void))v28 + 2))(v28, 0, 0, 0, v34, 0);
    }
  }
}

- (void)setEngagementDatas:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360CC2A8;
    v35[3] = &unk_264CA0C18;
    id v15 = v7;
    id v36 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v35, v17, v18, v19, v20, v21);
    objc_msgSend_setEngagementDatas_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);

    uint64_t v28 = v36;
  }
  else
  {
    uint64_t v29 = BDSServiceLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_2361F6558();
    }

    uint64_t v28 = _Block_copy(v7);
    if (v28)
    {
      uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"BDSErrorDomain", 1000, 0, v31, v32, v33);
      (*((void (**)(void *, void, void, void *))v28 + 2))(v28, 0, 0, v34);
    }
  }
}

- (void)setEngagementData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360CC490;
    v35[3] = &unk_264CA0C18;
    id v15 = v7;
    id v36 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v35, v17, v18, v19, v20, v21);
    objc_msgSend_setEngagementData_completion_(v22, v23, (uint64_t)v6, (uint64_t)v15, v24, v25, v26, v27);

    uint64_t v28 = v36;
  }
  else
  {
    uint64_t v29 = BDSServiceLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_2361F65F4();
    }

    uint64_t v28 = _Block_copy(v7);
    if (v28)
    {
      uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"BDSErrorDomain", 1000, 0, v31, v32, v33);
      (*((void (**)(void *, void, void, void *))v28 + 2))(v28, 0, 0, v34);
    }
  }
}

- (void)clearSyncMetadata:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2360CC65C;
    v33[3] = &unk_264CA0C18;
    uint64_t v12 = (void (**)(void *, void *))v4;
    uint64_t v34 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v33, v14, v15, v16, v17, v18);
    objc_msgSend_clearSyncMetadata_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);

    uint64_t v26 = v34;
  }
  else
  {
    uint64_t v27 = BDSServiceLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_2361F6690();
    }

    uint64_t v26 = (void (**)(void *, void *))_Block_copy(v4);
    if (v26)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v26[2](v26, v32);
    }
  }
}

- (void)forceFetchRemoteChanges:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2360CC820;
    v33[3] = &unk_264CA0C18;
    uint64_t v12 = (void (**)(void *, void *))v4;
    uint64_t v34 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v33, v14, v15, v16, v17, v18);
    objc_msgSend_forceFetchRemoteChanges_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);

    uint64_t v26 = v34;
  }
  else
  {
    uint64_t v27 = BDSServiceLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_2361F672C();
    }

    uint64_t v26 = (void (**)(void *, void *))_Block_copy(v4);
    if (v26)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v26[2](v26, v32);
    }
  }
}

- (void)cloudSyncDiagnosticDetachWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2360CC9E4;
    v33[3] = &unk_264CA0C18;
    uint64_t v12 = (void (**)(void *, void *))v4;
    uint64_t v34 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v33, v14, v15, v16, v17, v18);
    objc_msgSend_cloudSyncDiagnosticDetachWithCompletionHandler_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);

    uint64_t v26 = v34;
  }
  else
  {
    uint64_t v27 = BDSServiceLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_2361F67C8();
    }

    uint64_t v26 = (void (**)(void *, void *))_Block_copy(v4);
    if (v26)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v26[2](v26, v32);
    }
  }
}

- (void)cloudSyncDiagnosticFindLocalIdDupesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2360CCBA8;
    v33[3] = &unk_264CA0C18;
    uint64_t v12 = (void (**)(void *, void *))v4;
    uint64_t v34 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v33, v14, v15, v16, v17, v18);
    objc_msgSend_cloudSyncDiagnosticFindLocalIdDupesWithCompletionHandler_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);

    uint64_t v26 = v34;
  }
  else
  {
    uint64_t v27 = BDSServiceLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_2361F6864();
    }

    uint64_t v26 = (void (**)(void *, void *))_Block_copy(v4);
    if (v26)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v26[2](v26, v32);
    }
  }
}

- (void)cloudSyncDiagnosticInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = &unk_26E9714D0;
  }
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CCD80;
    v34[3] = &unk_264CA0C18;
    uint64_t v13 = v12;
    id v35 = v13;
    uint64_t v20 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v34, v15, v16, v17, v18, v19);
    objc_msgSend_cloudSyncDiagnosticInfoWithCompletionHandler_(v20, v21, (uint64_t)v13, v22, v23, v24, v25, v26);

    uint64_t v27 = v35;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F6900();
    }

    uint64_t v27 = (void (**)(void *, void, void *))_Block_copy(v12);
    if (v27)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v27[2](v27, 0, v33);
    }
  }
}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (v8) {
    uint64_t v16 = v8;
  }
  else {
    uint64_t v16 = &unk_26E9714F0;
  }
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12, v13, v14, v15))
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = sub_2360CCF7C;
    v36[3] = &unk_264CA0E30;
    BOOL v39 = v6;
    int64_t v38 = a4;
    uint64_t v17 = v16;
    id v37 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v36, v19, v20, v21, v22, v23);
    objc_msgSend_updatePolitely_reason_completionWithError_(v24, v25, v6, a4, (uint64_t)v17, v26, v27, v28);

    uint64_t v29 = v37;
  }
  else
  {
    uint64_t v30 = BDSServiceLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_2361F699C();
    }

    uint64_t v29 = (void (**)(void *, void, void *))_Block_copy(v16);
    if (v29)
    {
      id v35 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"BDSErrorDomain", 1000, 0, v32, v33, v34);
      v29[2](v29, 0, v35);
    }
  }
}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (v8) {
    uint64_t v16 = v8;
  }
  else {
    uint64_t v16 = &unk_26E971510;
  }
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12, v13, v14, v15))
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_2360CD14C;
    v32[3] = &unk_264CA0E30;
    BOOL v35 = v6;
    int64_t v34 = a4;
    id v17 = v16;
    id v33 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v32, v19, v20, v21, v22, v23);
    objc_msgSend_updatePolitely_reason_completion_(v24, v25, v6, a4, (uint64_t)v17, v26, v27, v28);

    uint64_t v29 = v33;
  }
  else
  {
    uint64_t v30 = BDSServiceLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_2361F699C();
    }

    uint64_t v31 = _Block_copy(v16);
    uint64_t v29 = v31;
    if (v31) {
      (*((void (**)(void *, void))v31 + 2))(v31, 0);
    }
  }
}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12, v13, v14, v15))
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_2360CD308;
    v31[3] = &unk_264CA0E30;
    BOOL v34 = v6;
    int64_t v33 = a4;
    id v16 = v8;
    id v32 = v16;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v31, v18, v19, v20, v21, v22);
    objc_msgSend_updateFamilyPolitely_reason_completion_(v23, v24, v6, a4, (uint64_t)v16, v25, v26, v27);

    uint64_t v28 = v32;
  }
  else
  {
    uint64_t v29 = BDSServiceLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_2361F6A38();
    }

    uint64_t v30 = _Block_copy(v8);
    uint64_t v28 = v30;
    if (v30) {
      (*((void (**)(void *, void))v30 + 2))(v30, 0);
    }
  }
}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12, v13, v14, v15))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360CD4F4;
    v35[3] = &unk_264CA0E30;
    BOOL v38 = v6;
    int64_t v37 = a4;
    id v16 = (void (**)(void *, void, void *))v8;
    id v36 = v16;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v35, v18, v19, v20, v21, v22);
    objc_msgSend_updateFamilyPolitely_reason_completionWithError_(v23, v24, v6, a4, (uint64_t)v16, v25, v26, v27);

    uint64_t v28 = v36;
  }
  else
  {
    uint64_t v29 = BDSServiceLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_2361F6A38();
    }

    uint64_t v28 = (void (**)(void *, void, void *))_Block_copy(v8);
    if (v28)
    {
      BOOL v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"BDSErrorDomain", 1000, 0, v31, v32, v33);
      v28[2](v28, 0, v34);
    }
  }
}

- (void)setItemHidden:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9) {
    id v17 = v9;
  }
  else {
    id v17 = &unk_26E971530;
  }
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13, v14, v15, v16))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CD6E0;
    v34[3] = &unk_264CA0E78;
    BOOL v37 = v6;
    id v18 = v8;
    id v35 = v18;
    id v19 = v17;
    id v36 = v19;
    uint64_t v26 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v20, (uint64_t)v34, v21, v22, v23, v24, v25);
    objc_msgSend_setItemHidden_forStoreID_completion_(v26, v27, v6, (uint64_t)v18, (uint64_t)v19, v28, v29, v30);

    uint64_t v31 = v35;
  }
  else
  {
    uint64_t v32 = BDSServiceLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_2361F6AD4();
    }

    uint64_t v33 = _Block_copy(v17);
    uint64_t v31 = v33;
    if (v33) {
      (*((void (**)(void *, void))v33 + 2))(v33, 0);
    }
  }
}

- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = &unk_26E971550;
  }
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    id v35 = sub_2360CD8BC;
    id v36 = &unk_264CA0EC0;
    id v16 = v6;
    id v37 = v16;
    id v17 = v15;
    id v38 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)&v33, v19, v20, v21, v22, v23);
    objc_msgSend_hideItemsWithStoreIDs_completion_(v24, v25, (uint64_t)v16, (uint64_t)v17, v26, v27, v28, v29, v33, v34, v35, v36);

    uint64_t v30 = v37;
  }
  else
  {
    uint64_t v31 = BDSServiceLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_2361F6B90();
    }

    uint64_t v32 = _Block_copy(v15);
    uint64_t v30 = v32;
    if (v32) {
      (*((void (**)(void *, void))v32 + 2))(v32, 0);
    }
  }
}

- (void)resetPurchasedTokenForStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = &unk_26E971570;
  }
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    id v35 = sub_2360CDA98;
    id v36 = &unk_264CA0EC0;
    id v16 = v6;
    id v37 = v16;
    id v17 = v15;
    id v38 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)&v33, v19, v20, v21, v22, v23);
    objc_msgSend_resetPurchasedTokenForStoreIDs_completion_(v24, v25, (uint64_t)v16, (uint64_t)v17, v26, v27, v28, v29, v33, v34, v35, v36);

    uint64_t v30 = v37;
  }
  else
  {
    uint64_t v31 = BDSServiceLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_2361F6C2C();
    }

    uint64_t v32 = _Block_copy(v15);
    uint64_t v30 = v32;
    if (v32) {
      (*((void (**)(void *, void))v32 + 2))(v32, 0);
    }
  }
}

- (void)deleteItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = &unk_26E971590;
  }
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    BOOL v39 = sub_2360CDCA0;
    uint64_t v40 = &unk_264CA0EC0;
    id v16 = (void (**)(void *, void *))v6;
    uint64_t v41 = v16;
    id v17 = v15;
    id v42 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)&v37, v19, v20, v21, v22, v23);
    objc_msgSend_deleteItemsWithStoreIDs_completion_(v24, v25, (uint64_t)v16, (uint64_t)v17, v26, v27, v28, v29, v37, v38, v39, v40);

    uint64_t v30 = v41;
  }
  else
  {
    uint64_t v31 = BDSServiceLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_2361F6B90();
    }

    uint64_t v30 = (void (**)(void *, void *))_Block_copy(v15);
    if (v30)
    {
      id v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v32, @"BDSErrorDomain", 1000, 0, v33, v34, v35);
      v30[2](v30, v36);
    }
  }
}

- (void)resetStaleJaliscoDatabaseWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = &unk_26E9715B0;
  }
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CDE78;
    v34[3] = &unk_264CA0C18;
    uint64_t v13 = v12;
    uint64_t v35 = v13;
    uint64_t v20 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v34, v15, v16, v17, v18, v19);
    objc_msgSend_resetStaleJaliscoDatabaseWithCompletion_(v20, v21, (uint64_t)v13, v22, v23, v24, v25, v26);

    uint64_t v27 = v35;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F6CC8();
    }

    uint64_t v27 = (void (**)(void *, void *))_Block_copy(v12);
    if (v27)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v27[2](v27, v33);
    }
  }
}

- (void)fetchAllHiddenItemStoreIDsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = &unk_26E9715D0;
  }
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CE050;
    v34[3] = &unk_264CA0C18;
    uint64_t v13 = v12;
    uint64_t v35 = v13;
    uint64_t v20 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v34, v15, v16, v17, v18, v19);
    objc_msgSend_fetchAllHiddenItemStoreIDsWithCompletion_(v20, v21, (uint64_t)v13, v22, v23, v24, v25, v26);

    uint64_t v27 = v35;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F6D64();
    }

    uint64_t v27 = (void (**)(void *, void, void *))_Block_copy(v12);
    if (v27)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v27[2](v27, 0, v33);
    }
  }
}

- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (v8) {
    uint64_t v16 = v8;
  }
  else {
    uint64_t v16 = &unk_26E9715F0;
  }
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12, v13, v14, v15))
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_2360CE21C;
    v32[3] = &unk_264CA0E30;
    BOOL v35 = v6;
    int64_t v34 = a4;
    id v17 = v16;
    id v33 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v32, v19, v20, v21, v22, v23);
    objc_msgSend_updatePolitelyAfterSignIn_reason_completion_(v24, v25, v6, a4, (uint64_t)v17, v26, v27, v28);

    uint64_t v29 = v33;
  }
  else
  {
    uint64_t v30 = BDSServiceLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_2361F6E00();
    }

    uint64_t v31 = _Block_copy(v16);
    uint64_t v29 = v31;
    if (v31) {
      (*((void (**)(void *, void))v31 + 2))(v31, 0);
    }
  }
}

- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (v8) {
    uint64_t v16 = v8;
  }
  else {
    uint64_t v16 = &unk_26E971610;
  }
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12, v13, v14, v15))
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_2360CE3E8;
    v32[3] = &unk_264CA0E30;
    BOOL v35 = v6;
    int64_t v34 = a4;
    id v17 = v16;
    id v33 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v32, v19, v20, v21, v22, v23);
    objc_msgSend_updatePolitelyAfterSignOut_reason_completion_(v24, v25, v6, a4, (uint64_t)v17, v26, v27, v28);

    uint64_t v29 = v33;
  }
  else
  {
    uint64_t v30 = BDSServiceLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_2361F6E9C();
    }

    uint64_t v31 = _Block_copy(v16);
    uint64_t v29 = v31;
    if (v31) {
      (*((void (**)(void *, void))v31 + 2))(v31, 0);
    }
  }
}

- (void)updatePolitely:(BOOL)a3 uiManager:(id)a4 reason:(int64_t)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v11) {
    uint64_t v19 = v11;
  }
  else {
    uint64_t v19 = &unk_26E971630;
  }
  if (objc_msgSend_connectionHealthy(self, v12, v13, v14, v15, v16, v17, v18))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360CE5C8;
    v34[3] = &unk_264CA0E30;
    BOOL v37 = v8;
    int64_t v36 = a5;
    id v20 = v19;
    id v35 = v20;
    uint64_t v27 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v21, (uint64_t)v34, v22, v23, v24, v25, v26);
    objc_msgSend_updatePolitely_uiManager_reason_completion_(v27, v28, v8, (uint64_t)v10, a5, (uint64_t)v20, v29, v30);

    uint64_t v31 = v35;
  }
  else
  {
    uint64_t v32 = BDSServiceLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_2361F6F38();
    }

    id v33 = _Block_copy(v19);
    uint64_t v31 = v33;
    if (v33) {
      (*((void (**)(void *, void))v33 + 2))(v33, 0);
    }
  }
}

- (void)monitorServiceNotificationsWithChangeToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = &unk_26E971650;
  }
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_2360CE810;
    aBlock[3] = &unk_264CA0C18;
    id v30 = v15;
    uint64_t v16 = _Block_copy(aBlock);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = sub_2360CE898;
    v26[3] = &unk_264CA0F08;
    id v27 = v6;
    id v28 = v16;
    id v17 = v16;
    bds_dispatch_service(self, v26, v17);

    uint64_t v18 = v30;
  }
  else
  {
    uint64_t v19 = BDSServiceLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_2361F6FD4();
    }

    uint64_t v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v20, @"BDSErrorDomain", 1000, 0, v21, v22, v23);
    uint64_t v24 = _Block_copy(v15);
    uint64_t v25 = v24;
    if (v24) {
      (*((void (**)(void *, void *))v24 + 2))(v24, v18);
    }
  }
}

- (void)setBookWidgetInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = &unk_26E971670;
  }
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    BOOL v39 = sub_2360CEA20;
    uint64_t v40 = &unk_264CA0EC0;
    uint64_t v16 = (void (**)(void *, void *))v6;
    uint64_t v41 = v16;
    id v17 = v15;
    id v42 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)&v37, v19, v20, v21, v22, v23);
    objc_msgSend_setBookWidgetInfo_completion_(v24, v25, (uint64_t)v16, (uint64_t)v17, v26, v27, v28, v29, v37, v38, v39, v40);

    id v30 = v41;
  }
  else
  {
    uint64_t v31 = BDSServiceLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_2361F7070();
    }

    id v30 = (void (**)(void *, void *))_Block_copy(v15);
    if (v30)
    {
      int64_t v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v32, @"BDSErrorDomain", 1000, 0, v33, v34, v35);
      v30[2](v30, v36);
    }
  }
}

- (void)getBookWidgetDataWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10, v11, v12, v13))
  {
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    int64_t v36 = sub_2360CEBF8;
    uint64_t v37 = &unk_264CA0F30;
    int64_t v39 = a3;
    uint64_t v14 = (void (**)(void *, void, void *))v6;
    uint64_t v38 = v14;
    uint64_t v21 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)&v34, v16, v17, v18, v19, v20);
    objc_msgSend_getBookWidgetDataWithLimit_completion_(v21, v22, a3, (uint64_t)v14, v23, v24, v25, v26, v34, v35, v36, v37);

    uint64_t v27 = v38;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F710C();
    }

    uint64_t v27 = (void (**)(void *, void, void *))_Block_copy(v6);
    if (v27)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v27[2](v27, 0, v33);
    }
  }
}

- (void)getBookWidgetInfoWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10, v11, v12, v13))
  {
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    int64_t v36 = sub_2360CEDD4;
    uint64_t v37 = &unk_264CA0F30;
    int64_t v39 = a3;
    uint64_t v14 = (void (**)(void *, void, void *))v6;
    uint64_t v38 = v14;
    uint64_t v21 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)&v34, v16, v17, v18, v19, v20);
    objc_msgSend_getBookWidgetInfoWithLimit_completion_(v21, v22, a3, (uint64_t)v14, v23, v24, v25, v26, v34, v35, v36, v37);

    uint64_t v27 = v38;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F71A8();
    }

    uint64_t v27 = (void (**)(void *, void, void *))_Block_copy(v6);
    if (v27)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v27[2](v27, 0, v33);
    }
  }
}

- (void)readingGoalsChangeBooksFinishedGoalTo:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  if (v6) {
    uint64_t v14 = v6;
  }
  else {
    uint64_t v14 = &unk_26E971690;
  }
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10, v11, v12, v13))
  {
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    uint64_t v33 = sub_2360CEF90;
    uint64_t v34 = &unk_264CA0F30;
    int64_t v36 = a3;
    id v15 = v14;
    id v35 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)&v31, v17, v18, v19, v20, v21);
    objc_msgSend_readingGoalsChangeBooksFinishedGoalTo_withCompletion_(v22, v23, a3, (uint64_t)v15, v24, v25, v26, v27, v31, v32, v33, v34);

    uint64_t v28 = v35;
  }
  else
  {
    uint64_t v29 = BDSServiceLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_2361F7244();
    }

    uint64_t v30 = _Block_copy(v14);
    uint64_t v28 = v30;
    if (v30) {
      (*((void (**)(void *, void))v30 + 2))(v30, 0);
    }
  }
}

- (void)readingGoalsChangeDailyGoalTo:(double)a3 withCompletion:(id)a4
{
  id v6 = a4;
  if (v6) {
    uint64_t v14 = v6;
  }
  else {
    uint64_t v14 = &unk_26E9716B0;
  }
  if (objc_msgSend_connectionHealthy(self, v7, v8, v9, v10, v11, v12, v13))
  {
    uint64_t v32 = MEMORY[0x263EF8330];
    uint64_t v33 = 3221225472;
    uint64_t v34 = sub_2360CF150;
    id v35 = &unk_264CA0F30;
    double v37 = a3;
    id v15 = v14;
    id v36 = v15;
    uint64_t v22 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)&v32, v17, v18, v19, v20, v21);
    objc_msgSend_readingGoalsChangeDailyGoalTo_withCompletion_(v22, v23, (uint64_t)v15, v24, v25, v26, v27, v28, a3, v32, v33, v34, v35);

    uint64_t v29 = v36;
  }
  else
  {
    uint64_t v30 = BDSServiceLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_2361F72E0();
    }

    uint64_t v31 = _Block_copy(v14);
    uint64_t v29 = v31;
    if (v31) {
      (*((void (**)(void *, void))v31 + 2))(v31, 0);
    }
  }
}

- (void)readingGoalsClearDataWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = &unk_26E9716D0;
  }
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_2360CF2FC;
    v30[3] = &unk_264CA0C18;
    id v13 = v12;
    id v31 = v13;
    uint64_t v20 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v30, v15, v16, v17, v18, v19);
    objc_msgSend_readingGoalsClearDataWithCompletion_(v20, v21, (uint64_t)v13, v22, v23, v24, v25, v26);

    uint64_t v27 = v31;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F737C();
    }

    uint64_t v29 = _Block_copy(v12);
    uint64_t v27 = v29;
    if (v29) {
      (*((void (**)(void *, void))v29 + 2))(v29, 0);
    }
  }
}

- (void)readingGoalsClearLocalCachedDataWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = &unk_26E9716F0;
  }
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_2360CF4A4;
    v30[3] = &unk_264CA0C18;
    id v13 = v12;
    id v31 = v13;
    uint64_t v20 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v30, v15, v16, v17, v18, v19);
    objc_msgSend_readingGoalsClearLocalCachedDataWithCompletion_(v20, v21, (uint64_t)v13, v22, v23, v24, v25, v26);

    uint64_t v27 = v31;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F7418();
    }

    uint64_t v29 = _Block_copy(v12);
    uint64_t v27 = v29;
    if (v29) {
      (*((void (**)(void *, void))v29 + 2))(v29, 0);
    }
  }
}

- (void)readingGoalsStateInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = &unk_26E971710;
  }
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_2360CF650;
    v30[3] = &unk_264CA0C18;
    id v13 = v12;
    id v31 = v13;
    uint64_t v20 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v30, v15, v16, v17, v18, v19);
    objc_msgSend_readingGoalsStateInfoWithCompletion_(v20, v21, (uint64_t)v13, v22, v23, v24, v25, v26);

    uint64_t v27 = v31;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F74B4();
    }

    uint64_t v29 = _Block_copy(v12);
    uint64_t v27 = v29;
    if (v29) {
      (*((void (**)(void *, void, void))v29 + 2))(v29, 0, 0);
    }
  }
}

- (void)readingHistoryClearDataWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = &unk_26E971730;
  }
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_2360CF7FC;
    v30[3] = &unk_264CA0C18;
    id v13 = v12;
    id v31 = v13;
    uint64_t v20 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v30, v15, v16, v17, v18, v19);
    objc_msgSend_readingHistoryClearDataWithCompletion_(v20, v21, (uint64_t)v13, v22, v23, v24, v25, v26);

    uint64_t v27 = v31;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F7550();
    }

    uint64_t v29 = _Block_copy(v12);
    uint64_t v27 = v29;
    if (v29) {
      (*((void (**)(void *, void))v29 + 2))(v29, 0);
    }
  }
}

- (void)readingHistoryClearDefaultsCachedDataWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = &unk_26E971750;
  }
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_2360CF9A4;
    v30[3] = &unk_264CA0C18;
    id v13 = v12;
    id v31 = v13;
    uint64_t v20 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v30, v15, v16, v17, v18, v19);
    objc_msgSend_readingHistoryClearDefaultsCachedDataWithCompletion_(v20, v21, (uint64_t)v13, v22, v23, v24, v25, v26);

    uint64_t v27 = v31;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F75EC();
    }

    uint64_t v29 = _Block_copy(v12);
    uint64_t v27 = v29;
    if (v29) {
      (*((void (**)(void *, void))v29 + 2))(v29, 0);
    }
  }
}

- (void)readingHistoryClearDate:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = &unk_26E971770;
  }
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_2360CFB60;
    v32[3] = &unk_264CA0C18;
    id v16 = v15;
    id v33 = v16;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v32, v18, v19, v20, v21, v22);
    objc_msgSend_readingHistoryClearDate_withCompletion_(v23, v24, (uint64_t)v6, (uint64_t)v16, v25, v26, v27, v28);

    uint64_t v29 = v33;
  }
  else
  {
    uint64_t v30 = BDSServiceLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_2361F7688();
    }

    id v31 = _Block_copy(v15);
    uint64_t v29 = v31;
    if (v31) {
      (*((void (**)(void *, void))v31 + 2))(v31, 0);
    }
  }
}

- (void)readingHistoryClearTodayWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = &unk_26E971790;
  }
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_2360CFD08;
    v30[3] = &unk_264CA0C18;
    id v13 = v12;
    id v31 = v13;
    uint64_t v20 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v30, v15, v16, v17, v18, v19);
    objc_msgSend_readingHistoryClearTodayWithCompletion_(v20, v21, (uint64_t)v13, v22, v23, v24, v25, v26);

    uint64_t v27 = v31;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F7724();
    }

    uint64_t v29 = _Block_copy(v12);
    uint64_t v27 = v29;
    if (v29) {
      (*((void (**)(void *, void))v29 + 2))(v29, 0);
    }
  }
}

- (void)readingHistoryHandleSyncFileChangeWithSyncVersionInfo:(id)a3 updateInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    uint64_t v18 = v10;
  }
  else {
    uint64_t v18 = &unk_26E9717B0;
  }
  if (objc_msgSend_connectionHealthy(self, v11, v12, v13, v14, v15, v16, v17))
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_2360CFF4C;
    aBlock[3] = &unk_264CA0C18;
    id v19 = v18;
    id v29 = v19;
    uint64_t v20 = _Block_copy(aBlock);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_2360CFFD4;
    v24[3] = &unk_264CA0F78;
    id v25 = v8;
    id v26 = v9;
    id v27 = v19;
    bds_dispatch_service(self, v24, v20);

    uint64_t v21 = v29;
  }
  else
  {
    uint64_t v22 = BDSServiceLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_2361F77C0();
    }

    uint64_t v23 = _Block_copy(v18);
    uint64_t v21 = v23;
    if (v23) {
      (*((void (**)(void *, void))v23 + 2))(v23, 0);
    }
  }
}

- (void)readingHistoryIncrementWithDate:(id)a3 by:(int64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9) {
    uint64_t v17 = v9;
  }
  else {
    uint64_t v17 = &unk_26E9717D0;
  }
  if (objc_msgSend_connectionHealthy(self, v10, v11, v12, v13, v14, v15, v16))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360D0140;
    v34[3] = &unk_264CA0FA0;
    id v18 = v8;
    id v35 = v18;
    int64_t v37 = a4;
    id v19 = v17;
    id v36 = v19;
    id v26 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v20, (uint64_t)v34, v21, v22, v23, v24, v25);
    objc_msgSend_readingHistoryIncrementWithDate_by_withCompletion_(v26, v27, (uint64_t)v18, a4, (uint64_t)v19, v28, v29, v30);

    id v31 = v35;
  }
  else
  {
    uint64_t v32 = BDSServiceLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_2361F785C();
    }

    id v33 = _Block_copy(v17);
    id v31 = v33;
    if (v33) {
      (*((void (**)(void *, void))v33 + 2))(v33, 0);
    }
  }
}

- (void)readingHistoryReadingHistoryStateInfoWithRangeStart:(id)a3 rangeEnd:(id)a4 currentTime:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13) {
    uint64_t v21 = v13;
  }
  else {
    uint64_t v21 = &unk_26E9717F0;
  }
  if (objc_msgSend_connectionHealthy(self, v14, v15, v16, v17, v18, v19, v20))
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = sub_2360D0334;
    v36[3] = &unk_264CA0C18;
    id v22 = v21;
    id v37 = v22;
    uint64_t v29 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v23, (uint64_t)v36, v24, v25, v26, v27, v28);
    objc_msgSend_readingHistoryReadingHistoryStateInfoWithRangeStart_rangeEnd_currentTime_withCompletion_(v29, v30, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v22, v31, v32);

    id v33 = v37;
  }
  else
  {
    uint64_t v34 = BDSServiceLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_2361F7928();
    }

    id v35 = _Block_copy(v21);
    id v33 = v35;
    if (v35) {
      (*((void (**)(void *, void, void))v35 + 2))(v35, 0, 0);
    }
  }
}

- (void)readingHistoryServiceStatusInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4) {
    id v12 = v4;
  }
  else {
    id v12 = &unk_26E971810;
  }
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360D0510;
    v34[3] = &unk_264CA0C18;
    id v13 = v12;
    id v35 = v13;
    uint64_t v20 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v34, v15, v16, v17, v18, v19);
    objc_msgSend_readingHistoryServiceStatusInfoWithCompletion_(v20, v21, (uint64_t)v13, v22, v23, v24, v25, v26);

    uint64_t v27 = v35;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F79C4();
    }

    uint64_t v27 = (void (**)(void *, void, void *))_Block_copy(v12);
    if (v27)
    {
      id v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v27[2](v27, 0, v33);
    }
  }
}

- (void)priceTrackingSetConfiguration:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8) {
    uint64_t v16 = v8;
  }
  else {
    uint64_t v16 = &unk_26E971830;
  }
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12, v13, v14, v15))
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360D071C;
    v37[3] = &unk_264CA0FA0;
    void v37[4] = self;
    SEL v39 = a2;
    id v17 = v16;
    id v38 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v37, v19, v20, v21, v22, v23);
    objc_msgSend_priceTrackingSetConfiguration_completion_(v24, v25, (uint64_t)v7, (uint64_t)v17, v26, v27, v28, v29);
  }
  else
  {
    uint64_t v30 = BDSServiceLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_2361F7A60();
    }

    id v35 = (void (**)(void *, void *))_Block_copy(v16);
    if (v35)
    {
      id v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"BDSErrorDomain", 1000, 0, v32, v33, v34);
      v35[2](v35, v36);
    }
  }
}

- (void)priceTrackingCtlRefreshTrackedPricesIgnoringSchedule:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = &unk_26E971850;
  }
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = sub_2360D0914;
    v36[3] = &unk_264CA0FA0;
    void v36[4] = self;
    SEL v38 = a2;
    id v16 = v15;
    id v37 = v16;
    uint64_t v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v36, v18, v19, v20, v21, v22);
    objc_msgSend_priceTrackingCtlRefreshTrackedPricesIgnoringSchedule_completion_(v23, v24, v4, (uint64_t)v16, v25, v26, v27, v28);
  }
  else
  {
    uint64_t v29 = BDSServiceLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_2361F7A60();
    }

    uint64_t v34 = (void (**)(void *, void *))_Block_copy(v15);
    if (v34)
    {
      id v35 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"BDSErrorDomain", 1000, 0, v31, v32, v33);
      v34[2](v34, v35);
    }
  }
}

- (void)priceTrackingCtlGetStateWithCompletion:(id)a3
{
  id v5 = a3;
  if (v5) {
    uint64_t v13 = v5;
  }
  else {
    uint64_t v13 = &unk_26E971870;
  }
  if (objc_msgSend_connectionHealthy(self, v6, v7, v8, v9, v10, v11, v12))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360D0B08;
    v35[3] = &unk_264CA0FA0;
    void v35[4] = self;
    SEL v37 = a2;
    id v14 = v13;
    id v36 = v14;
    uint64_t v21 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v15, (uint64_t)v35, v16, v17, v18, v19, v20);
    objc_msgSend_priceTrackingCtlGetStateWithCompletion_(v21, v22, (uint64_t)v14, v23, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F7A60();
    }

    uint64_t v33 = (void (**)(void *, void, void *))_Block_copy(v13);
    if (v33)
    {
      uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      v33[2](v33, 0, v34);
    }
  }
}

- (void)priceTrackingCtlAddTrackedItems:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8) {
    uint64_t v16 = v8;
  }
  else {
    uint64_t v16 = &unk_26E971890;
  }
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12, v13, v14, v15))
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360D0D18;
    v37[3] = &unk_264CA0FA0;
    void v37[4] = self;
    SEL v39 = a2;
    id v17 = v16;
    id v38 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v37, v19, v20, v21, v22, v23);
    objc_msgSend_priceTrackingCtlAddTrackedItems_completion_(v24, v25, (uint64_t)v7, (uint64_t)v17, v26, v27, v28, v29);
  }
  else
  {
    uint64_t v30 = BDSServiceLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_2361F7A60();
    }

    id v35 = (void (**)(void *, void *))_Block_copy(v16);
    if (v35)
    {
      id v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"BDSErrorDomain", 1000, 0, v32, v33, v34);
      v35[2](v35, v36);
    }
  }
}

- (void)priceTrackingCtlOverrideReferencePrices:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8) {
    uint64_t v16 = v8;
  }
  else {
    uint64_t v16 = &unk_26E9718B0;
  }
  if (objc_msgSend_connectionHealthy(self, v9, v10, v11, v12, v13, v14, v15))
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2360D0F24;
    v37[3] = &unk_264CA0FA0;
    void v37[4] = self;
    SEL v39 = a2;
    id v17 = v16;
    id v38 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)v37, v19, v20, v21, v22, v23);
    objc_msgSend_priceTrackingCtlOverrideReferencePrices_completion_(v24, v25, (uint64_t)v7, (uint64_t)v17, v26, v27, v28, v29);
  }
  else
  {
    uint64_t v30 = BDSServiceLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_2361F7A60();
    }

    id v35 = (void (**)(void *, void *))_Block_copy(v16);
    if (v35)
    {
      id v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v31, @"BDSErrorDomain", 1000, 0, v32, v33, v34);
      v35[2](v35, v36);
    }
  }
}

- (void)readingHistoryBackupWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = &unk_26E9718D0;
  }
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    SEL v39 = sub_2360D1130;
    uint64_t v40 = &unk_264CA0EC0;
    uint64_t v16 = (void (**)(void *, void, void *))v6;
    uint64_t v41 = v16;
    id v17 = v15;
    id v42 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)&v37, v19, v20, v21, v22, v23);
    objc_msgSend_readingHistoryBackupWithName_completion_(v24, v25, (uint64_t)v16, (uint64_t)v17, v26, v27, v28, v29, v37, v38, v39, v40);

    uint64_t v30 = v41;
  }
  else
  {
    uint64_t v31 = BDSServiceLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_2361F7BA4();
    }

    uint64_t v30 = (void (**)(void *, void, void *))_Block_copy(v15);
    if (v30)
    {
      id v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v32, @"BDSErrorDomain", 1000, 0, v33, v34, v35);
      v30[2](v30, 0, v36);
    }
  }
}

- (void)readingHistoryListBackupWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = &unk_26E9718F0;
  }
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_2360D1314;
    v34[3] = &unk_264CA0C18;
    id v13 = v12;
    id v35 = v13;
    uint64_t v20 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v34, v15, v16, v17, v18, v19);
    objc_msgSend_readingHistoryListBackupWithCompletion_(v20, v21, (uint64_t)v13, v22, v23, v24, v25, v26);

    uint64_t v27 = v35;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F7C40();
    }

    uint64_t v27 = _Block_copy(v12);
    if (v27)
    {
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"BDSErrorDomain", 1000, 0, v30, v31, v32);
      (*((void (**)(void *, void, void, void *))v27 + 2))(v27, 0, 0, v33);
    }
  }
}

- (void)readingHistoryRestoreWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = &unk_26E971910;
  }
  if (objc_msgSend_connectionHealthy(self, v8, v9, v10, v11, v12, v13, v14))
  {
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    SEL v39 = sub_2360D1524;
    uint64_t v40 = &unk_264CA0EC0;
    uint64_t v16 = (void (**)(void *, void, void *))v6;
    uint64_t v41 = v16;
    id v17 = v15;
    id v42 = v17;
    uint64_t v24 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v18, (uint64_t)&v37, v19, v20, v21, v22, v23);
    objc_msgSend_readingHistoryRestoreWithName_completion_(v24, v25, (uint64_t)v16, (uint64_t)v17, v26, v27, v28, v29, v37, v38, v39, v40);

    uint64_t v30 = v41;
  }
  else
  {
    uint64_t v31 = BDSServiceLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_2361F7CDC();
    }

    uint64_t v30 = (void (**)(void *, void, void *))_Block_copy(v15);
    if (v30)
    {
      id v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v32, @"BDSErrorDomain", 1000, 0, v33, v34, v35);
      v30[2](v30, 0, v36);
    }
  }
}

- (void)bookWidgetReadingHistoryStateInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = &unk_26E971930;
  }
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_2360D16D8;
    v30[3] = &unk_264CA0C18;
    id v13 = v12;
    id v31 = v13;
    uint64_t v20 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v14, (uint64_t)v30, v15, v16, v17, v18, v19);
    objc_msgSend_bookWidgetReadingHistoryStateInfoWithCompletion_(v20, v21, (uint64_t)v13, v22, v23, v24, v25, v26);

    uint64_t v27 = v31;
  }
  else
  {
    uint64_t v28 = BDSServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361F7D78();
    }

    uint64_t v29 = _Block_copy(v12);
    uint64_t v27 = v29;
    if (v29) {
      (*((void (**)(void *, void, void))v29 + 2))(v29, 0, 0);
    }
  }
}

- (void)mergeMovedReadingHistoryDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2360D18A4;
    v33[3] = &unk_264CA0C18;
    uint64_t v12 = (void (**)(void *, void, void *))v4;
    uint64_t v34 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v33, v14, v15, v16, v17, v18);
    objc_msgSend_mergeMovedReadingHistoryDataWithCompletionHandler_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);

    uint64_t v26 = v34;
  }
  else
  {
    uint64_t v27 = BDSServiceLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_2361F7E14();
    }

    uint64_t v26 = (void (**)(void *, void, void *))_Block_copy(v4);
    if (v26)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v26[2](v26, 0, v32);
    }
  }
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_connectionHealthy(self, v5, v6, v7, v8, v9, v10, v11))
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_2360D1A70;
    v33[3] = &unk_264CA0C18;
    uint64_t v12 = (void (**)(void *, void, void *))v4;
    uint64_t v34 = v12;
    uint64_t v19 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v33, v14, v15, v16, v17, v18);
    objc_msgSend_hasSaltChangedWithCompletion_(v19, v20, (uint64_t)v12, v21, v22, v23, v24, v25);

    uint64_t v26 = v34;
  }
  else
  {
    uint64_t v27 = BDSServiceLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_2361F7EB0();
    }

    uint64_t v26 = (void (**)(void *, void, void *))_Block_copy(v4);
    if (v26)
    {
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v28, @"BDSErrorDomain", 1000, 0, v29, v30, v31);
      v26[2](v26, 0, v32);
    }
  }
}

- (BDSServiceProtocol)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BDSServiceProxyConnectionDelegate)connectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  return (BDSServiceProxyConnectionDelegate *)WeakRetained;
}

- (BOOL)connectionHealthy
{
  return self->_connectionHealthy;
}

- (void)setConnectionHealthy:(BOOL)a3
{
  self->_connectionHealthy = a3;
}

- (BDSClientSideListener)clientSideListener
{
  return self->_clientSideListener;
}

- (void)setClientSideListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSideListener, 0);
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

@end