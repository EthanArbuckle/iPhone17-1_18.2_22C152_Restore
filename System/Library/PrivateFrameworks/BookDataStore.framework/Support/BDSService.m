@interface BDSService
- (BCCloudAssetManager)assetManager;
- (BCCloudCollectionsManager)cloudCollectionsManager;
- (BDSBookWidgetDataUpdater)widgetDataUpdater;
- (BDSBookWidgetInfoManager)widgetInfoManager;
- (BDSClientConnectionServiceProtocol)clientConnectionService;
- (BDSCloudSyncDiagnosticService)cloudSyncDiagnosticService;
- (BDSJaliscoDAAPServiceImpl)jaliscoDAAPService;
- (BDSNBController)nanoBooksController;
- (BDSNotificationForwarder)notificationForwarder;
- (BDSPriceTracker)priceTracker;
- (BDSReadingGoalsService)readingGoalsService;
- (BDSReadingHistoryCommandLineServiceSupport)readingHistoryCommandLineService;
- (BDSReadingHistoryServiceSupport)readingHistoryService;
- (BDSService)initWithClientConnectionService:(id)a3;
- (BDSUbiquityManager)ubiquityManager;
- (BDSWidgetCenterManager)widgetCenterManager;
- (BOOL)paused;
- (BUOSStateHandler)syncServiceStateHandler;
- (_TtC14bookdatastored25CloudSecureManagerService)secureManager;
- (id)_newWidgetMOC;
- (id)_stateForLog;
- (id)makeOSStateHandler;
- (id)updateReadingNowWithCompletion:(id)a3;
- (id)updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:(BOOL)a3 completion:(id)a4;
- (id)updateWantToReadWithCompletion:(id)a3;
- (void)_BCCloudCollectionMemberManagerChanged:(id)a3;
- (void)_BCCloudReadingNowDetailManagerChanged:(id)a3;
- (void)_setupWidget;
- (void)_setupWidgetDataUpdater:(id)a3;
- (void)_updateEnableSync;
- (void)addStoreIDtoWantToReadList:(id)a3 withCompletion:(id)a4;
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
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
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
- (void)setAssetDetail:(id)a3 completion:(id)a4;
- (void)setAssetDetails:(id)a3 completion:(id)a4;
- (void)setAssetManager:(id)a3;
- (void)setAssetReview:(id)a3 completion:(id)a4;
- (void)setAssetReviews:(id)a3 completion:(id)a4;
- (void)setBookWidgetInfo:(id)a3 completion:(id)a4;
- (void)setClientConnectionService:(id)a3;
- (void)setCloudCollectionsManager:(id)a3;
- (void)setCloudSyncDiagnosticService:(id)a3;
- (void)setCloudSyncPaused:(BOOL)a3;
- (void)setCollectionDetail:(id)a3 completion:(id)a4;
- (void)setCollectionDetails:(id)a3 completion:(id)a4;
- (void)setCollectionMember:(id)a3 completion:(id)a4;
- (void)setCollectionMembers:(id)a3 completion:(id)a4;
- (void)setEnableCloudSync:(BOOL)a3 enableReadingNowSync:(BOOL)a4;
- (void)setEnableCollectionSync:(BOOL)a3;
- (void)setEnableSecureCloudSync:(BOOL)a3;
- (void)setEngagementData:(id)a3 completion:(id)a4;
- (void)setEngagementDatas:(id)a3 completion:(id)a4;
- (void)setItemHidden:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5;
- (void)setJaliscoDAAPService:(id)a3;
- (void)setNanoBooksController:(id)a3;
- (void)setNotificationForwarder:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPriceTracker:(id)a3;
- (void)setReadingGoalsService:(id)a3;
- (void)setReadingHistoryCommandLineService:(id)a3;
- (void)setReadingHistoryService:(id)a3;
- (void)setReadingNowDetails:(id)a3 completion:(id)a4;
- (void)setSecureManager:(id)a3;
- (void)setSyncServiceStateHandler:(id)a3;
- (void)setUbiquityManager:(id)a3;
- (void)setUserData:(id)a3 completion:(id)a4;
- (void)setUserDataValue:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setUserDatum:(id)a3 completion:(id)a4;
- (void)setWidgetCenterManager:(id)a3;
- (void)setWidgetDataUpdater:(id)a3;
- (void)setWidgetInfoManager:(id)a3;
- (void)signalFetchChangesTransaction:(id)a3;
- (void)storeItemForStoreID:(id)a3 completion:(id)a4;
- (void)updateBitrateForItemWithAdamID:(id)a3 completion:(id)a4;
- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5;
- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5;
- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)userDataValueForKey:(id)a3 completion:(id)a4;
- (void)userDatumForKey:(id)a3 completion:(id)a4;
- (void)userDatumIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5;
@end

@implementation BDSService

- (void)userDatumForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self secureManager];
  v8 = [v9 userDataManager];
  [v8 userDatumForKey:v7 completion:v6];
}

- (_TtC14bookdatastored25CloudSecureManagerService)secureManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secureManager);
  return (_TtC14bookdatastored25CloudSecureManagerService *)WeakRetained;
}

- (void)monitorServiceNotificationsWithChangeToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSXPCConnection currentConnection];
  id v9 = [(BDSService *)self clientConnectionService];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004A1C;
  v11[3] = &unk_100260D48;
  id v12 = v6;
  id v10 = v6;
  [v9 monitorServiceNotificationsWithConnection:v8 changeToken:v7 completion:v11];
}

- (void)getCollectionMemberChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  v8 = [v9 collectionMemberManager];
  [v8 getCollectionMemberChangesSince:v7 completion:v6];
}

- (void)getCollectionDetailChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(BDSService *)self cloudCollectionsManager];
  id v9 = [v8 collectionDetailManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A370;
  v11[3] = &unk_100260D20;
  id v12 = v6;
  id v10 = v6;
  [v9 getCollectionDetailChangesSince:v7 completion:v11];
}

- (void)getAssetDetailChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  v8 = [v9 assetDetailManager];
  [v8 getAssetDetailChangesSince:v7 completion:v6];
}

- (void)currentReadingNowDetailCloudSyncVersions:(id)a3
{
  id v4 = a3;
  id v6 = [(BDSService *)self assetManager];
  v5 = [v6 readingNowDetailManager];
  [v5 currentReadingNowDetailCloudSyncVersions:v4];
}

- (void)currentCollectionMemberCloudSyncVersions:(id)a3
{
  id v4 = a3;
  id v6 = [(BDSService *)self cloudCollectionsManager];
  v5 = [v6 collectionMemberManager];
  [v5 currentCollectionMemberCloudSyncVersions:v4];
}

- (void)currentCollectionDetailCloudSyncVersions:(id)a3
{
  id v4 = a3;
  id v6 = [(BDSService *)self cloudCollectionsManager];
  v5 = [v6 collectionDetailManager];
  [v5 currentCollectionDetailCloudSyncVersions:v4];
}

- (void)currentAssetDetailCloudSyncVersions:(id)a3
{
  id v4 = a3;
  id v6 = [(BDSService *)self assetManager];
  v5 = [v6 assetDetailManager];
  [v5 currentAssetDetailCloudSyncVersions:v4];
}

- (BCCloudCollectionsManager)cloudCollectionsManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudCollectionsManager);
  return (BCCloudCollectionsManager *)WeakRetained;
}

- (BDSClientConnectionServiceProtocol)clientConnectionService
{
  return self->_clientConnectionService;
}

- (BCCloudAssetManager)assetManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetManager);
  return (BCCloudAssetManager *)WeakRetained;
}

- (BDSService)initWithClientConnectionService:(id)a3
{
  id v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BDSService;
  id v6 = [(BDSService *)&v45 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientConnectionService, a3);
    v7->_authenticatorsLock._os_unfair_lock_opaque = 0;
    v8 = +[BUAccountsProvider sharedProvider];
    [v8 observeTCCAccessChangeNotificationIfNeeded];

    id v9 = +[BCCloudKitController sharedInstance];
    id v10 = +[BCCloudKitController secureSharedInstance];
    v11 = +[BCCloudAssetManager sharedService];
    objc_storeWeak((id *)&v7->_assetManager, v11);

    id v12 = +[BCCloudCollectionsManager sharedService];
    objc_storeWeak((id *)&v7->_cloudCollectionsManager, v12);

    v13 = +[CloudSecureManagerService sharedManager];
    objc_storeWeak((id *)&v7->_secureManager, v13);

    v14 = [BDSNBController alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v7->_assetManager);
    v16 = [WeakRetained assetDataSource];
    v17 = [(BDSNBController *)v14 initWithCloudDataSource:v16];
    nanoBooksController = v7->_nanoBooksController;
    v7->_nanoBooksController = v17;

    uint64_t v19 = +[BDSJaliscoDAAPServiceImpl sharedClient];
    jaliscoDAAPService = v7->_jaliscoDAAPService;
    v7->_jaliscoDAAPService = (BDSJaliscoDAAPServiceImpl *)v19;

    v21 = [(BDSService *)v7 jaliscoDAAPService];

    if (!v21)
    {
      v22 = sub_1000063E8();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1001E6330();
      }
    }
    [(BDSService *)v7 _setupWidget];
    v23 = objc_alloc_init(BDSOSTransactionProvider);
    if (!v7->_widgetDataUpdater)
    {
      id v24 = [(BDSService *)v7 _newWidgetMOC];
      [(BDSService *)v7 _setupWidgetDataUpdater:v24];
    }
    v25 = [[BDSBookWidgetReadingHistoryManager alloc] initWithBookWidgetDataUpdater:v7->_widgetDataUpdater transactionProvider:v23];
    v26 = objc_alloc_init(BDSNotificationForwarder);
    notificationForwarder = v7->_notificationForwarder;
    v7->_notificationForwarder = v26;

    v28 = objc_alloc_init(BDSReadingGoalsService);
    readingGoalsService = v7->_readingGoalsService;
    v7->_readingGoalsService = v28;

    v30 = [[BDSReadingHistoryServiceManager alloc] initWithReadingGoalsService:v7->_readingGoalsService transactionProvider:v23 viewStateChangeHandler:v25];
    objc_storeStrong((id *)&v7->_readingHistoryCommandLineService, v30);
    readingHistoryService = v7->_readingHistoryService;
    v7->_readingHistoryService = (BDSReadingHistoryServiceSupport *)v30;

    v32 = +[BDSAppGroupContainer documentsURL];
    v33 = [v32 URLByAppendingPathComponent:@"BDSService-PriceTracking" isDirectory:1];

    v34 = [v33 URLByAppendingPathComponent:@"data.json" isDirectory:0];
    v35 = [[BDSPriceTracker alloc] initWithPersistenceURL:v34];
    priceTracker = v7->_priceTracker;
    v7->_priceTracker = v35;

    +[BDSXPCEventRelay start];
    v37 = +[NSNotificationCenter defaultCenter];
    [v37 addObserver:v7 selector:"tccAccessChanged:" name:@"BDSTCCAccessChangedNotification" object:0];

    v38 = +[NSDistributedNotificationCenter defaultCenter];
    [v38 addObserver:v7 selector:"enableSyncChanged:" name:@"BKUbiquitousFinishedOptInFlow" object:0];

    [(BDSService *)v7 _updateEnableSync];
    v39 = +[MCProfileConnection sharedConnection];
    [v39 addObserver:v7];

    v40 = +[NSDistributedNotificationCenter defaultCenter];
    [v40 addObserver:v7 selector:"_BCCloudReadingNowDetailManagerChanged:" name:@"BCCloudReadingNowDetailManagerChanged" object:0];

    v41 = +[NSDistributedNotificationCenter defaultCenter];
    [v41 addObserver:v7 selector:"_BCCloudCollectionMemberManagerChanged:" name:@"BCCloudCollectionMemberManagerChanged" object:0];

    uint64_t v42 = [(BDSService *)v7 makeOSStateHandler];
    syncServiceStateHandler = v7->_syncServiceStateHandler;
    v7->_syncServiceStateHandler = (BUOSStateHandler *)v42;
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[MCProfileConnection sharedConnection];
  [v3 removeObserver:self];

  id v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"BCCloudReadingNowDetailManagerChanged" object:0];

  id v5 = +[NSDistributedNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"BCCloudCollectionMemberManagerChanged" object:0];

  v6.receiver = self;
  v6.super_class = (Class)BDSService;
  [(BDSService *)&v6 dealloc];
}

- (void)_BCCloudReadingNowDetailManagerChanged:(id)a3
{
  v3 = sub_10000CEB0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BCCloudReadingNowManagerChanged notification received", v7, 2u);
  }

  id v4 = [sub_100072178() sharedManager];
  if ([v4 isReadingNowEnabled])
  {
    id v5 = +[BDSNBPinningManager sharedManager];
    id v6 = [v5 updateReadingNowWithCompletion:&stru_100260CB8];
  }
}

- (void)_BCCloudCollectionMemberManagerChanged:(id)a3
{
  v3 = sub_10000CEB0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BCCloudCollectionMemberManagerChanged notification received", v7, 2u);
  }

  id v4 = [sub_100072178() sharedManager];
  if ([v4 isWantToReadEnabled])
  {
    id v5 = +[BDSNBPinningManager sharedManager];
    id v6 = [v5 updateWantToReadWithCompletion:&stru_100260CD8];
  }
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  id v4 = sub_10000CEB0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "profileConnectionDidReceiveRestrictionChangedNotification received", v7, 2u);
  }

  id v5 = +[BDSNBPinningManager sharedManager];
  id v6 = [v5 updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:1 completion:&stru_100260CF8];
}

- (void)_updateEnableSync
{
  unsigned int v3 = +[BDSSyncUserDefaults isSignedIntoICloud];
  unsigned int v4 = +[BDSSyncUserDefaults isGlobalICloudDriveSyncOptedIn];
  unsigned int v5 = +[BDSSyncUserDefaults isCloudKitSyncOptedIn];
  uint64_t v6 = v3 & ~[(BDSService *)self paused] & v5;
  id v7 = sub_1000083A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if ([(BDSService *)self paused]) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    if (v3) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    *(_DWORD *)v28 = 138544386;
    *(void *)&v28[4] = v8;
    if (v4) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    *(_WORD *)&v28[12] = 2114;
    *(void *)&v28[14] = v9;
    if (v5) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    *(_WORD *)&v28[22] = 2114;
    if (v6) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    CFStringRef v29 = v10;
    __int16 v30 = 2114;
    CFStringRef v31 = v11;
    __int16 v32 = 2114;
    CFStringRef v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "BDSService Paused=%{public}@ SignedIn=%{public}@ GlobalICloudDrive=%{public}@ CloudKit=%{public}@  isCloudKitEnabled=%{public}@", v28, 0x34u);
  }

  objc_opt_class();
  v13 = +[BDSUserPreferencesSync objectFromGroupPreferencesForKey:@"BKLibrary.ReadingNow"];
  v14 = BUDynamicCast();

  if (!v14)
  {
    unsigned int v15 = 1;
    if (v6) {
      goto LABEL_20;
    }
LABEL_25:
    uint64_t v18 = 0;
    goto LABEL_26;
  }
  unsigned int v15 = [v14 BOOLValue];
  if (!v6) {
    goto LABEL_25;
  }
LABEL_20:
  v16 = +[BUAccountsProvider sharedProvider];
  unsigned int v17 = [v16 isPrimaryAccountManagedAppleID];
  if (v15) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v17;
  }

LABEL_26:
  uint64_t v19 = [(BDSService *)self assetManager];
  [v19 setEnableCloudSync:v6 enableReadingNowSync:v18];

  v20 = sub_1000083A0();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    if (v6) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    if (v18) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    *(_DWORD *)v28 = 138543618;
    *(void *)&v28[4] = v21;
    *(_WORD *)&v28[12] = 2114;
    *(void *)&v28[14] = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "BDSService enabling assetSync: %{public}@ readingNow Sync: %{public}@", v28, 0x16u);
  }

  uint64_t v23 = +[BDSSyncUserDefaults isICloudDriveSyncOptedIn] & v4;
  id v24 = [(BDSService *)self ubiquityManager];
  [v24 setEnableUbiquityObserving:v23];

  v25 = [(BDSService *)self readingHistoryService];
  [v25 setEnableCloudSync:v6];

  v26 = +[BCCloudKitController sharedInstance];
  [v26 setEnableCloudSync:v6 serviceMode:1];

  v27 = +[BCCloudKitController secureSharedInstance];
  [v27 setEnableCloudSync:v6 serviceMode:1];
}

- (void)setEnableCollectionSync:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BDSService *)self cloudCollectionsManager];
  [v4 setEnableCloudSync:v3];
}

- (void)setEnableCloudSync:(BOOL)a3 enableReadingNowSync:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(BDSService *)self assetManager];
  [v6 setEnableCloudSync:v5 enableReadingNowSync:v4];
}

- (void)setEnableSecureCloudSync:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BDSService *)self secureManager];
  [v4 setEnableCloudSync:v3];
}

- (void)setCloudSyncPaused:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BDSService *)self paused] != a3)
  {
    [(BDSService *)self setPaused:v3];
    BOOL v5 = sub_1000083A0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "setCloudSyncPaused: %@", (uint8_t *)&v7, 0xCu);
    }

    [(BDSService *)self _updateEnableSync];
  }
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BDSService *)self assetManager];
  [v5 dissociateCloudDataFromSyncWithCompletion:v4];

  id v6 = [(BDSService *)self cloudCollectionsManager];
  [v6 dissociateCloudDataFromSyncWithCompletion:v4];
}

- (void)signalFetchChangesTransaction:(id)a3
{
  id v3 = a3;
  id v4 = +[BCCloudKitController sharedInstance];
  [v4 attachOrSignalFetchChangesTransaction:v3 reason:@"XPC call"];

  id v5 = +[BCCloudKitController secureSharedInstance];
  [v5 attachOrSignalFetchChangesTransaction:v3 reason:@"XPC call"];
}

- (void)assetDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  CFStringRef v8 = [v9 assetDetailManager];
  [v8 assetDetailForAssetID:v7 completion:v6];
}

- (void)assetDetailsForAssetIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  CFStringRef v8 = [v9 assetDetailManager];
  [v8 assetDetailsForAssetIDs:v7 completion:v6];
}

- (void)resolvedAssetDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  CFStringRef v8 = [v9 assetDetailManager];
  [v8 resolvedAssetDetailForAssetID:v7 completion:v6];
}

- (void)deleteAssetDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  CFStringRef v8 = [v9 assetDetailManager];
  [v8 deleteAssetDetailForAssetID:v7 completion:v6];
}

- (void)fetchAssetDetailsIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(BDSService *)self assetManager];
  id v7 = [v8 assetDetailManager];
  [v7 fetchAssetDetailsIncludingDeleted:v4 completion:v6];
}

- (void)setAssetDetail:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 assetDetailManager];
  [v8 setAssetDetail:v7 completion:v6];
}

- (void)setAssetDetails:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 assetDetailManager];
  [v8 setAssetDetails:v7 completion:v6];
}

- (void)fetchAssetDetailsForUnsyncedTastes:(id)a3
{
  id v4 = a3;
  id v6 = [(BDSService *)self assetManager];
  id v5 = [v6 assetDetailManager];
  [v5 fetchAssetDetailsForUnsyncedTastes:v4];
}

- (void)fetchFinishedDatesByAssetIDForYear:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = [(BDSService *)self assetManager];
  id v7 = [v8 assetDetailManager];
  [v7 fetchFinishedDatesByAssetIDForYear:a3 completion:v6];
}

- (void)fetchFinishedAssetCountByYearWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(BDSService *)self assetManager];
  id v5 = [v6 assetDetailManager];
  [v5 fetchFinishedAssetCountByYearWithCompletion:v4];
}

- (void)readingNowDetailsForAssetIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 readingNowDetailManager];
  [v8 readingNowDetailsForAssetIDs:v7 completion:v6];
}

- (void)deleteReadingNowDetailForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 readingNowDetailManager];
  [v8 deleteReadingNowDetailForAssetID:v7 completion:v6];
}

- (void)getReadingNowDetailChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 readingNowDetailManager];
  [v8 getReadingNowDetailChangesSince:v7 completion:v6];
}

- (void)setReadingNowDetails:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 readingNowDetailManager];
  [v8 setReadingNowDetails:v7 completion:v6];
}

- (void)needsReadingNowAssetTypePopulation:(id)a3
{
  id v4 = a3;
  id v6 = [(BDSService *)self assetManager];
  id v5 = [v6 readingNowDetailManager];
  [v5 needsReadingNowAssetTypePopulation:v4];
}

- (void)assetReviewForAssetReviewID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 assetReviewManager];
  [v8 assetReviewForAssetReviewID:v7 completion:v6];
}

- (void)assetReviewsForAssetReviewIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 assetReviewManager];
  [v8 assetReviewsForAssetReviewIDs:v7 completion:v6];
}

- (void)deleteAssetReviewForAssetReviewID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 assetReviewManager];
  [v8 deleteAssetReviewForAssetReviewID:v7 completion:v6];
}

- (void)deleteAssetReviewForAssetReviewIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 assetReviewManager];
  [v8 deleteAssetReviewForAssetReviewIDs:v7 completion:v6];
}

- (void)fetchAssetReviewsForUserID:(id)a3 includingDeleted:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v11 = [(BDSService *)self assetManager];
  CFStringRef v10 = [v11 assetReviewManager];
  [v10 fetchAssetReviewsForUserID:v9 includingDeleted:v5 completion:v8];
}

- (void)getAssetReviewChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 assetReviewManager];
  [v8 getAssetReviewChangesSince:v7 completion:v6];
}

- (void)setAssetReview:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 assetReviewManager];
  [v8 setAssetReview:v7 completion:v6];
}

- (void)setAssetReviews:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 assetReviewManager];
  [v8 setAssetReviews:v7 completion:v6];
}

- (void)addStoreItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 storeAssetManager];
  [v8 addStoreItem:v7 completion:v6];
}

- (void)addStoreItems:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 storeAssetManager];
  [v8 addStoreItems:v7 completion:v6];
}

- (void)deleteStoreItemWithStoreID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 storeAssetManager];
  [v8 deleteStoreItemWithStoreID:v7 completion:v6];
}

- (void)deleteStoreItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 storeAssetManager];
  [v8 deleteStoreItemsWithStoreIDs:v7 completion:v6];
}

- (void)fetchStoreItemsIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(BDSService *)self assetManager];
  id v7 = [v8 storeAssetManager];
  [v7 fetchStoreItemsIncludingDeleted:v4 completion:v6];
}

- (void)getStoreItemChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 storeAssetManager];
  [v8 getStoreItemChangesSince:v7 completion:v6];
}

- (void)storeItemForStoreID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self assetManager];
  id v8 = [v9 storeAssetManager];
  [v8 storeItemForStoreID:v7 completion:v6];
}

- (void)collectionDetailForCollectionID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionDetailManager];
  [v8 collectionDetailForCollectionID:v7 completion:v6];
}

- (void)collectionDetailsForCollectionIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionDetailManager];
  [v8 collectionDetailsForCollectionIDs:v7 completion:v6];
}

- (void)deleteCollectionDetailForCollectionID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionDetailManager];
  [v8 deleteCollectionDetailForCollectionID:v7 completion:v6];
}

- (void)deleteCollectionDetailForCollectionIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionDetailManager];
  [v8 deleteCollectionDetailForCollectionIDs:v7 completion:v6];
}

- (void)fetchCollectionDetailsIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(BDSService *)self cloudCollectionsManager];
  id v7 = [v8 collectionDetailManager];
  [v7 fetchCollectionDetailsIncludingDeleted:v4 completion:v6];
}

- (void)setCollectionDetail:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionDetailManager];
  [v8 setCollectionDetail:v7 completion:v6];
}

- (void)setCollectionDetails:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionDetailManager];
  [v8 setCollectionDetails:v7 completion:v6];
}

- (void)collectionMemberForCollectionMemberID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionMemberManager];
  [v8 collectionMemberForCollectionMemberID:v7 completion:v6];
}

- (void)deleteCollectionMemberForCollectionMemberID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionMemberManager];
  [v8 deleteCollectionMemberForCollectionMemberID:v7 completion:v6];
}

- (void)deleteCollectionMemberForCollectionMemberIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionMemberManager];
  [v8 deleteCollectionMemberForCollectionMemberIDs:v7 completion:v6];
}

- (void)fetchCollectionMembersIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(BDSService *)self cloudCollectionsManager];
  id v7 = [v8 collectionMemberManager];
  [v7 fetchCollectionMembersIncludingDeleted:v4 completion:v6];
}

- (void)fetchCollectionMembersInCollectionID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionMemberManager];
  [v8 fetchCollectionMembersInCollectionID:v7 completion:v6];
}

- (void)setCollectionMember:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionMemberManager];
  [v8 setCollectionMember:v7 completion:v6];
}

- (void)setCollectionMembers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionMemberManager];
  [v8 setCollectionMembers:v7 completion:v6];
}

- (void)fetchMaxSortOrderInCollectionID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self cloudCollectionsManager];
  id v8 = [v9 collectionMemberManager];
  [v8 fetchMaxSortOrderInCollectionID:v7 completion:v6];
}

- (void)fetchMostRecentAudiobookWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[BDSNBPinningManager sharedManager];
  [v4 fetchMostRecentAudiobookWithCompletion:v3];
}

- (id)updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[BDSNBPinningManager sharedManager];
  id v7 = [v6 updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:v4 completion:v5];

  return v7;
}

- (id)updateWantToReadWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[BDSNBPinningManager sharedManager];
  id v5 = [v4 updateWantToReadWithCompletion:v3];

  return v5;
}

- (id)updateReadingNowWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[BDSNBPinningManager sharedManager];
  id v5 = [v4 updateReadingNowWithCompletion:v3];

  return v5;
}

- (void)updateBitrateForItemWithAdamID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[BDSOSTransaction alloc] initWithTransactionName:"updateBitrateForItemWithAdamID"];
  id v8 = +[BDSNBPinningManager sharedManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100033E50;
  v11[3] = &unk_10025F748;
  CFStringRef v12 = v7;
  id v9 = v7;
  [v8 updateBitrateForItemWithAdamID:v6 completion:v11];

  CFStringRef v10 = (void (**)(id, void))objc_retainBlock(v5);
  if (v10) {
    v10[2](v10, 0);
  }
}

- (void)audiobookStoreEnabledWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[BDSNBPinningManager sharedManager];
  [v4 audiobookStoreEnabledWithCompletion:v3];
}

- (void)currentCloudSyncVersions:(id)a3
{
  id v4 = a3;
  id v6 = [(BDSService *)self secureManager];
  id v5 = [v6 userDataManager];
  [v5 currentCloudSyncVersions:v4];
}

- (void)setUserDatum:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self secureManager];
  id v8 = [v9 userDataManager];
  [v8 setUserDatum:v7 completion:v6];
}

- (void)setUserData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self secureManager];
  id v8 = [v9 userDataManager];
  [v8 setUserData:v7 completion:v6];
}

- (void)deleteUserDatumForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self secureManager];
  id v8 = [v9 userDataManager];
  [v8 deleteUserDatumForKey:v7 completion:v6];
}

- (void)userDatumIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v11 = [(BDSService *)self secureManager];
  CFStringRef v10 = [v11 userDataManager];
  [v10 userDatumIncludingDeleted:v6 forKey:v9 completion:v8];
}

- (void)fetchUserDataIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(BDSService *)self secureManager];
  id v7 = [v8 userDataManager];
  [v7 fetchUserDataIncludingDeleted:v4 completion:v6];
}

- (void)getUserDataChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self secureManager];
  id v8 = [v9 userDataManager];
  [v8 getUserDataChangesSince:v7 completion:v6];
}

- (void)resolvedUserDataValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self secureManager];
  id v8 = [v9 userDataManager];
  [v8 resolvedUserDataValueForKey:v7 completion:v6];
}

- (void)userDataValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self secureManager];
  id v8 = [v9 userDataManager];
  [v8 userDataValueForKey:v7 completion:v6];
}

- (void)setUserDataValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(BDSService *)self secureManager];
  id v11 = [v12 userDataManager];
  [v11 setUserDataValue:v10 forKey:v9 completion:v8];
}

- (void)deleteEngagementDataForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self secureManager];
  id v8 = [v9 engagementManager];
  [v8 deleteEngagementDataForKey:v7 completion:v6];
}

- (void)engagementDataForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self secureManager];
  id v8 = [v9 engagementManager];
  [v8 engagementDataForKey:v7 completion:v6];
}

- (void)engagementDataIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v11 = [(BDSService *)self secureManager];
  id v10 = [v11 engagementManager];
  [v10 engagementDataIncludingDeleted:v6 forKey:v9 completion:v8];
}

- (void)fetchEngagementDatasIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(BDSService *)self secureManager];
  id v7 = [v8 engagementManager];
  [v7 fetchEngagementDatasIncludingDeleted:v4 completion:v6];
}

- (void)getEngagementDataChangesSince:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self secureManager];
  id v8 = [v9 engagementManager];
  [v8 getEngagementDataChangesSince:v7 completion:v6];
}

- (void)setEngagementDatas:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self secureManager];
  id v8 = [v9 engagementManager];
  [v8 setEngagementDatas:v7 completion:v6];
}

- (void)setEngagementData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BDSService *)self secureManager];
  id v8 = [v9 engagementManager];
  [v8 setEngagementData:v7 completion:v6];
}

- (BDSCloudSyncDiagnosticService)cloudSyncDiagnosticService
{
  cloudSyncDiagnosticService = self->_cloudSyncDiagnosticService;
  if (!cloudSyncDiagnosticService)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = [(BDSService *)self assetManager];
    [v4 addObject:v5];

    id v6 = [(BDSService *)self cloudCollectionsManager];
    [v4 addObject:v6];

    id v7 = [BDSCloudSyncDiagnosticService alloc];
    id v8 = +[BCCloudKitController sharedInstance];
    id v9 = [(BDSCloudSyncDiagnosticService *)v7 initWithCloudKitController:v8 entityServiceProviders:v4];
    id v10 = self->_cloudSyncDiagnosticService;
    self->_cloudSyncDiagnosticService = v9;

    cloudSyncDiagnosticService = self->_cloudSyncDiagnosticService;
  }
  return cloudSyncDiagnosticService;
}

- (void)clearSyncMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self cloudSyncDiagnosticService];
  id v7 = [v5 clearSyncMetadata];

  id v6 = (void (**)(id, id))objc_retainBlock(v4);
  if (v7)
  {
    if (v6) {
      v6[2](v6, v7);
    }
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)forceFetchRemoteChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self cloudSyncDiagnosticService];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100034A30;
  v7[3] = &unk_100260D48;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchRemoteChangesWithCompletionHandler:v7];
}

- (void)cloudSyncDiagnosticDetachWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self cloudSyncDiagnosticService];
  [v5 detachWithCompletionHandler:v4];
}

- (void)cloudSyncDiagnosticFindLocalIdDupesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self cloudSyncDiagnosticService];
  [v5 findLocalIdDupesWithCompletionHandler:v4];
}

- (void)cloudSyncDiagnosticInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self cloudSyncDiagnosticService];
  [v5 diagnosticInfoWithCompletionHandler:v4];
}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(BDSService *)self jaliscoDAAPService];

  if (v9)
  {
    id v14 = [(BDSService *)self jaliscoDAAPService];
    [v14 updatePolitely:v6 reason:a4 completionWithError:v8];
  }
  else
  {
    id v10 = sub_1000063E8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E6364();
    }

    id v11 = (void (**)(id, void, void *))objc_retainBlock(v8);
    if (v11)
    {
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      CFStringRef v16 = @"BDSService has no jalisco client";
      id v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      v13 = +[NSError errorWithDomain:@"BDSErrorDomain" code:1000 userInfo:v12];
      v11[2](v11, 0, v13);
    }
  }
}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(BDSService *)self jaliscoDAAPService];

  if (v9)
  {
    id v12 = [(BDSService *)self jaliscoDAAPService];
    [v12 updatePolitely:v6 reason:a4 completion:v8];
  }
  else
  {
    id v10 = sub_1000063E8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E6364();
    }

    id v11 = (void (**)(id, void))objc_retainBlock(v8);
    if (v11) {
      v11[2](v11, 0);
    }
  }
}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(BDSService *)self jaliscoDAAPService];

  if (v9)
  {
    id v12 = [(BDSService *)self jaliscoDAAPService];
    [v12 updateFamilyPolitely:v6 reason:a4 completion:v8];
  }
  else
  {
    id v10 = sub_1000063E8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E6398();
    }

    id v11 = (void (**)(id, void))objc_retainBlock(v8);
    if (v11) {
      v11[2](v11, 0);
    }
  }
}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(BDSService *)self jaliscoDAAPService];

  if (v9)
  {
    id v14 = [(BDSService *)self jaliscoDAAPService];
    [v14 updateFamilyPolitely:v6 reason:a4 completionWithError:v8];
  }
  else
  {
    id v10 = sub_1000063E8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E6398();
    }

    id v11 = (void (**)(id, void, void *))objc_retainBlock(v8);
    if (v11)
    {
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      CFStringRef v16 = @"BDSService has no jalisco client";
      id v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      v13 = +[NSError errorWithDomain:@"BDSErrorDomain" code:1000 userInfo:v12];
      v11[2](v11, 0, v13);
    }
  }
}

- (void)setItemHidden:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(BDSService *)self jaliscoDAAPService];

  if (v10)
  {
    id v11 = [(BDSService *)self jaliscoDAAPService];
    [v11 setItemHidden:v6 forStoreID:v8 completion:v9];
  }
  else
  {
    id v12 = sub_1000063E8();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001E63CC();
    }

    v13 = (void (**)(id, void))objc_retainBlock(v9);
    if (v13) {
      v13[2](v13, 0);
    }
  }
}

- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BDSService *)self jaliscoDAAPService];

  if (v8)
  {
    id v9 = [(BDSService *)self jaliscoDAAPService];
    [v9 hideItemsWithStoreIDs:v6 completion:v7];
  }
  else
  {
    id v10 = sub_1000063E8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E6400();
    }

    id v9 = (void (**)(void, void))objc_retainBlock(v7);
    if (v9) {
      v9[2](v9, 0);
    }
  }
}

- (void)fetchAllHiddenItemStoreIDsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self jaliscoDAAPService];

  if (v5)
  {
    id v10 = [(BDSService *)self jaliscoDAAPService];
    [v10 fetchAllHiddenItemStoreIDsWithCompletion:v4];
  }
  else
  {
    id v6 = sub_1000063E8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001E6434();
    }

    id v7 = (void (**)(id, void, void *))objc_retainBlock(v4);
    if (v7)
    {
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      CFStringRef v12 = @"BDSService has no jalisco client";
      id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      id v9 = +[NSError errorWithDomain:@"BDSErrorDomain" code:1000 userInfo:v8];
      v7[2](v7, 0, v9);
    }
  }
}

- (void)resetPurchasedTokenForStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BDSService *)self jaliscoDAAPService];

  if (v8)
  {
    id v9 = [(BDSService *)self jaliscoDAAPService];
    [v9 resetPurchasedTokenForStoreIDs:v6 completion:v7];
  }
  else
  {
    id v10 = sub_1000063E8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E6468();
    }

    id v9 = (void (**)(void, void))objc_retainBlock(v7);
    if (v9) {
      v9[2](v9, 0);
    }
  }
}

- (void)deleteItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BDSService *)self jaliscoDAAPService];
  [v8 deleteItemsWithStoreIDs:v7 completion:v6];
}

- (void)resetStaleJaliscoDatabaseWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self jaliscoDAAPService];

  if (v5)
  {
    id v10 = [(BDSService *)self jaliscoDAAPService];
    [v10 resetStaleJaliscoDatabaseWithCompletion:v4];
  }
  else
  {
    id v6 = sub_1000063E8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001E649C();
    }

    id v7 = (void (**)(id, void *))objc_retainBlock(v4);
    if (v7)
    {
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      CFStringRef v12 = @"BDSService has no jalisco client";
      id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      id v9 = +[NSError errorWithDomain:@"BDSErrorDomain" code:1000 userInfo:v8];
      v7[2](v7, v9);
    }
  }
}

- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(BDSService *)self jaliscoDAAPService];

  if (v9)
  {
    id v12 = [(BDSService *)self jaliscoDAAPService];
    [v12 updatePolitelyAfterSignIn:v6 reason:a4 completion:v8];
  }
  else
  {
    id v10 = sub_1000063E8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E64D0();
    }

    NSErrorUserInfoKey v11 = (void (**)(id, void))objc_retainBlock(v8);
    if (v11) {
      v11[2](v11, 0);
    }
  }
}

- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(BDSService *)self jaliscoDAAPService];

  if (v9)
  {
    id v12 = [(BDSService *)self jaliscoDAAPService];
    [v12 updatePolitelyAfterSignOut:v6 reason:a4 completion:v8];
  }
  else
  {
    id v10 = sub_1000063E8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E6504();
    }

    NSErrorUserInfoKey v11 = (void (**)(id, void))objc_retainBlock(v8);
    if (v11) {
      v11[2](v11, 0);
    }
  }
}

- (void)getBookWidgetDataWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(BDSService *)self widgetDataUpdater];
  id v8 = [v7 currentWidgetDatas];

  id v9 = [v8 count];
  if ((unint64_t)v9 >= a3) {
    int64_t v10 = a3;
  }
  else {
    int64_t v10 = (int64_t)v9;
  }
  NSErrorUserInfoKey v11 = objc_msgSend(v8, "subarrayWithRange:", 0, v10);
  id v12 = sub_1000063E8();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    NSErrorUserInfoKey v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Returning widget data: %@", (uint8_t *)&v14, 0xCu);
  }

  v13 = (void (**)(id, void *, void))objc_retainBlock(v6);
  if (v13) {
    v13[2](v13, v11, 0);
  }
}

- (void)getBookWidgetInfoWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(BDSService *)self widgetInfoManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100035B90;
  v9[3] = &unk_100260D70;
  id v10 = v6;
  id v8 = v6;
  [v7 getInfosWithLimit:a3 completionHandler:v9];
}

- (void)readingGoalsChangeBooksFinishedGoalTo:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(BDSService *)self readingGoalsService];
  [v7 changeBooksFinishedGoalTo:a3 completionHandler:v6];
}

- (void)readingGoalsChangeDailyGoalTo:(double)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(BDSService *)self readingGoalsService];
  [v7 changeDailyGoalTo:v6 completionHandler:a3];
}

- (void)readingGoalsClearDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self readingGoalsService];
  [v5 clearDataWithCompletionHandler:v4];
}

- (void)readingGoalsClearLocalCachedDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self readingGoalsService];
  [v5 clearLocalCachedDataWithCompletionHandler:v4];
}

- (void)readingGoalsStateInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self readingGoalsService];
  [v5 stateInfoWithCompletionHandler:v4];
}

- (void)readingHistoryClearDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self readingHistoryCommandLineService];
  [v5 clearDataWithCompletionHandler:v4];
}

- (void)readingHistoryClearDefaultsCachedDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self readingHistoryService];
  [v5 clearDefaultsCachedDataWithCompletionHandler:v4];
}

- (void)readingHistoryClearDate:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BDSService *)self readingHistoryCommandLineService];
  [v8 clearDate:v7 completionHandler:v6];
}

- (void)readingHistoryClearTodayWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self readingHistoryCommandLineService];
  [v5 clearTodayWithCompletionHandler:v4];
}

- (void)readingHistoryReadingHistoryStateInfoWithRangeStart:(id)a3 rangeEnd:(id)a4 currentTime:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(BDSService *)self readingHistoryCommandLineService];
  [v14 readingHistoryStateInfoWithRangeStart:v13 rangeEnd:v12 currentTime:v11 completionHandler:v10];
}

- (void)readingHistoryHandleSyncFileChangeWithSyncVersionInfo:(id)a3 updateInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BDSService *)self readingHistoryService];
  [v11 handleSyncFileChangeWithSyncVersionInfo:v10 updateInfo:v9 completionHandler:v8];
}

- (void)readingHistoryIncrementWithDate:(id)a3 by:(int64_t)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(BDSService *)self readingHistoryCommandLineService];
  [v10 incrementWithDate:v9 by:a4 completionHandler:v8];
}

- (void)readingHistoryServiceStatusInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self readingHistoryCommandLineService];
  id v7 = [v5 serviceStatusInfo];

  id v6 = (void (**)(id, id, void))objc_retainBlock(v4);
  if (v6) {
    v6[2](v6, v7, 0);
  }
}

- (void)priceTrackingSetConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(BDSService *)self priceTracker];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003638C;
  v10[3] = &unk_100260358;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 setConfiguration:v6 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)priceTrackingCtlRefreshTrackedPricesIgnoringSchedule:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(BDSService *)self priceTracker];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000364E8;
  v8[3] = &unk_100260330;
  id v9 = v5;
  id v7 = v5;
  objc_msgSend(v6, "bdsdctl_updateTrackedPricesIgnoringScheduleForAllItemsWithCompletionHandler:", v8);
}

- (void)priceTrackingCtlGetStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self priceTracker];
  objc_msgSend(v5, "bdsctl_getStateWithCompletion:", v4);
}

- (void)priceTrackingCtlAddTrackedItems:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mutableCopy];
  sub_100036608((uint64_t)self, v7, v6);
}

- (void)priceTrackingCtlOverrideReferencePrices:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BDSService *)self priceTracker];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100036C70;
  v10[3] = &unk_100260330;
  id v11 = v6;
  id v9 = v6;
  objc_msgSend(v8, "bdsctl_updateReferencePrices:completion:", v7, v10);
}

- (void)readingHistoryBackupWithName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BDSService *)self readingHistoryCommandLineService];
  [v8 backupWithName:v7 completionHandler:v6];
}

- (void)readingHistoryListBackupWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self readingHistoryCommandLineService];
  [v5 listBackupWithCompletionHandler:v4];
}

- (void)readingHistoryRestoreWithName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BDSService *)self readingHistoryCommandLineService];
  [v8 restoreWithName:v7 completionHandler:v6];
}

- (void)bookWidgetReadingHistoryStateInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self readingHistoryService];
  [v5 bookWidgetReadingHistoryStateInfoWithCompletionHandler:v4];
}

- (void)addStoreIDtoWantToReadList:(id)a3 withCompletion:(id)a4
{
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v3 = sub_1000083A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "hasSaltChangedWithCompletion should not be called", v4, 2u);
  }
}

- (id)_newWidgetMOC
{
  id v3 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  [v3 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  [v3 setAutomaticallyMergesChangesFromParent:1];
  p_assetManager = &self->_assetManager;
  id WeakRetained = objc_loadWeakRetained((id *)p_assetManager);
  id v6 = [WeakRetained assetDataSource];
  id v7 = [v6 managedObjectContext];

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_assetManager);
    id v9 = [v8 assetDataSource];
    id v10 = [v9 managedObjectContext];
    [v3 setParentContext:v10];

    id v11 = v3;
  }
  else
  {
    id v12 = sub_10000D068();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001E6538();
    }

    id v11 = 0;
  }

  return v11;
}

- (void)_setupWidgetDataUpdater:(id)a3
{
  id v8 = a3;
  if (!self->_widgetCenterManager)
  {
    id v4 = +[BDSWidgetCenterManager sharedInstance];
    widgetCenterManager = self->_widgetCenterManager;
    self->_widgetCenterManager = v4;
  }
  id v6 = [[BDSBookWidgetDataUpdater alloc] initWithWidgetCenterManager:self->_widgetCenterManager managedObjectContext:v8];
  widgetDataUpdater = self->_widgetDataUpdater;
  self->_widgetDataUpdater = v6;

  [(BDSBookWidgetDataUpdater *)self->_widgetDataUpdater resume];
}

- (void)_setupWidget
{
  id v3 = sub_10000D068();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up Books widget...", (uint8_t *)&v20, 2u);
  }

  id v4 = [(BDSService *)self _newWidgetMOC];
  if (v4)
  {
    [(BDSService *)self _setupWidgetDataUpdater:v4];
    id v5 = objc_alloc_init(BDSUbiquityManager);
    ubiquityManager = self->_ubiquityManager;
    self->_ubiquityManager = v5;

    id v7 = [BDSBookWidgetInfoManager alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_assetManager);
    id v9 = [WeakRetained assetDetailManager];
    id v10 = objc_loadWeakRetained((id *)&self->_assetManager);
    id v11 = [v10 readingNowDetailManager];
    id v12 = [(BDSBookWidgetInfoManager *)v7 initWithMOC:v4 assetDetailManager:v9 readingNowDetailManager:v11 ubiquityManager:self->_ubiquityManager];
    widgetInfoManager = self->_widgetInfoManager;
    self->_widgetInfoManager = v12;

    id v14 = BUProtocolCast();
    objc_opt_class();
    id v15 = objc_loadWeakRetained((id *)&self->_assetManager);
    CFStringRef v16 = [v15 readingNowDetailManager];
    unsigned int v17 = BUDynamicCast();
    [v17 setDataMonitor:v14];

    uint64_t v18 = sub_10000D068();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [(BDSService *)self widgetInfoManager];
      int v20 = 138412290;
      CFStringRef v21 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Creating widgetInfomanager:  %@", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)setBookWidgetInfo:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BDSService *)self widgetInfoManager];
  [v8 setBookWidgetInfo:v7 completion:v6];
}

- (void)mergeMovedReadingHistoryDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSService *)self readingHistoryService];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003740C;
  v7[3] = &unk_100260DE0;
  id v8 = v4;
  id v6 = v4;
  [v5 mergeMovedReadingHistoryDataWithCompletionHandler:v7];
}

- (id)makeOSStateHandler
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003751C;
  v4[3] = &unk_100260E08;
  v4[4] = self;
  id v2 = [objc_alloc((Class)BUOSStateHandler) initWithTitle:@"BDSService" block:v4];
  return v2;
}

- (id)_stateForLog
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(BDSService *)self cloudSyncDiagnosticService];
  id v5 = [v4 stateForLog];
  [v3 setObject:v5 forKeyedSubscript:@"cloudSyncDiagnostic"];

  return v3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (void)setAssetManager:(id)a3
{
}

- (void)setCloudCollectionsManager:(id)a3
{
}

- (void)setClientConnectionService:(id)a3
{
}

- (BUOSStateHandler)syncServiceStateHandler
{
  return self->_syncServiceStateHandler;
}

- (void)setSyncServiceStateHandler:(id)a3
{
}

- (void)setSecureManager:(id)a3
{
}

- (BDSNBController)nanoBooksController
{
  return self->_nanoBooksController;
}

- (void)setNanoBooksController:(id)a3
{
}

- (BDSJaliscoDAAPServiceImpl)jaliscoDAAPService
{
  return self->_jaliscoDAAPService;
}

- (void)setJaliscoDAAPService:(id)a3
{
}

- (void)setCloudSyncDiagnosticService:(id)a3
{
}

- (BDSNotificationForwarder)notificationForwarder
{
  return self->_notificationForwarder;
}

- (void)setNotificationForwarder:(id)a3
{
}

- (BDSReadingGoalsService)readingGoalsService
{
  return self->_readingGoalsService;
}

- (void)setReadingGoalsService:(id)a3
{
}

- (BDSReadingHistoryCommandLineServiceSupport)readingHistoryCommandLineService
{
  return self->_readingHistoryCommandLineService;
}

- (void)setReadingHistoryCommandLineService:(id)a3
{
}

- (BDSReadingHistoryServiceSupport)readingHistoryService
{
  return self->_readingHistoryService;
}

- (void)setReadingHistoryService:(id)a3
{
}

- (BDSPriceTracker)priceTracker
{
  return self->_priceTracker;
}

- (void)setPriceTracker:(id)a3
{
}

- (BDSBookWidgetDataUpdater)widgetDataUpdater
{
  return self->_widgetDataUpdater;
}

- (void)setWidgetDataUpdater:(id)a3
{
}

- (BDSBookWidgetInfoManager)widgetInfoManager
{
  return self->_widgetInfoManager;
}

- (void)setWidgetInfoManager:(id)a3
{
}

- (BDSWidgetCenterManager)widgetCenterManager
{
  return self->_widgetCenterManager;
}

- (void)setWidgetCenterManager:(id)a3
{
}

- (BDSUbiquityManager)ubiquityManager
{
  return self->_ubiquityManager;
}

- (void)setUbiquityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquityManager, 0);
  objc_storeStrong((id *)&self->_widgetCenterManager, 0);
  objc_storeStrong((id *)&self->_widgetInfoManager, 0);
  objc_storeStrong((id *)&self->_widgetDataUpdater, 0);
  objc_storeStrong((id *)&self->_priceTracker, 0);
  objc_storeStrong((id *)&self->_readingHistoryService, 0);
  objc_storeStrong((id *)&self->_readingHistoryCommandLineService, 0);
  objc_storeStrong((id *)&self->_readingGoalsService, 0);
  objc_storeStrong((id *)&self->_notificationForwarder, 0);
  objc_storeStrong((id *)&self->_cloudSyncDiagnosticService, 0);
  objc_storeStrong((id *)&self->_jaliscoDAAPService, 0);
  objc_storeStrong((id *)&self->_nanoBooksController, 0);
  objc_destroyWeak((id *)&self->_secureManager);
  objc_storeStrong((id *)&self->_syncServiceStateHandler, 0);
  objc_storeStrong((id *)&self->_clientConnectionService, 0);
  objc_destroyWeak((id *)&self->_cloudCollectionsManager);
  objc_destroyWeak((id *)&self->_assetManager);
}

@end