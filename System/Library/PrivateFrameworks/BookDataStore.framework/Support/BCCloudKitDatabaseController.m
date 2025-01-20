@interface BCCloudKitDatabaseController
+ (id)decodeRecordFromSystemFields:(id)a3;
+ (id)encodeRecordSystemFields:(id)a3;
+ (void)startInternetConnectionReachabilityNotifier;
- (BCCloudKitConfiguration)configuration;
- (BCCloudKitDatabaseController)initWithConfiguration:(id)a3 archiveURL:(id)a4;
- (BOOL)attachedToContainer;
- (BOOL)establishedSalt;
- (BOOL)fetchRecordZoneChangesSuccess;
- (BOOL)hasSubscription;
- (BOOL)serverFetchPostponed;
- (BUCoalescingCallBlock)coalescedArchive;
- (BUCoalescingCallBlock)coalescedZoneFetch;
- (CKContainer)container;
- (CKDatabase)database;
- (CKRecordID)userRecordID;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)desiredRecordZoneIDs;
- (NSData)recordIDSalt;
- (NSMapTable)zoneObservers;
- (NSMutableDictionary)observers;
- (NSMutableDictionary)recordZones;
- (NSMutableDictionary)tokenStores;
- (NSMutableSet)changedRecordZoneIDs;
- (NSString)containerIdentifier;
- (NSString)subscriptionID;
- (NSURL)archiveURL;
- (OS_dispatch_queue)accessQueue;
- (double)backOffInterval;
- (id)appBundleIdentifier;
- (id)diagnosticDatabaseInfo;
- (id)p_archiveToData;
- (id)p_unarchiveFromData:(id)a3;
- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4;
- (id)saltedAndHashedIDFromLocalID:(id)a3;
- (void)_deleteRecordZonesWithIDs:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)addObserver:(id)a3 recordType:(id)a4;
- (void)addObserver:(id)a3 zoneID:(id)a4;
- (void)attachToZones:(id)a3 completion:(id)a4;
- (void)connectUserTo:(id)a3 container:(id)a4 updateSubscription:(BOOL)a5 completion:(id)a6 subscriptionCompletion:(id)a7;
- (void)detach;
- (void)detachWithError:(id)a3 completion:(id)a4;
- (void)fetchChangesWithCompletion:(id)a3;
- (void)fetchRecordForRecordID:(id)a3 completion:(id)a4;
- (void)getAttached:(id)a3;
- (void)invalidateSalt;
- (void)p_createRecordIDSaltWithCompletion:(id)a3;
- (void)p_createRecordZones:(id)a3 completionHandler:(id)a4;
- (void)p_fetchDatabaseChanges:(id)a3;
- (void)p_fetchRecordZoneChanges:(id)a3 optionsByRecordZoneID:(id)a4 completionHandler:(id)a5;
- (void)p_fetchRecordZoneChangesForRecordZoneIDs:(id)a3 completionHandler:(id)a4;
- (void)p_fetchZoneChanges:(id)a3;
- (void)p_informObserversOfAttachmentChange;
- (void)p_informObserversOfCompletedFetchOfZone:(id)a3;
- (void)p_informObserversOfRecordsChanged:(id)a3;
- (void)p_informObserversOfRecordsChanged:(id)a3 forRecordType:(id)a4;
- (void)p_informObserversOfSaltVersionIdentifierChanged:(id)a3 forZones:(id)a4 completion:(id)a5;
- (void)p_internetReachabilityChanged:(id)a3;
- (void)p_scheduleArchiveWithCompletion:(id)a3;
- (void)p_subscribeWithCompletion:(id)a3;
- (void)p_unarchive;
- (void)p_unsubscribeToContainer:(id)a3;
- (void)p_updateRetryParametersFromFetchZoneChangesOperationError:(id)a3;
- (void)recordZoneWithName:(id)a3 completionHandler:(id)a4;
- (void)registerServerChangeTokenStore:(id)a3 forZoneID:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 recordType:(id)a4;
- (void)setAccessQueue:(id)a3;
- (void)setArchiveURL:(id)a3;
- (void)setAttachedToContainer:(BOOL)a3;
- (void)setBackOffInterval:(double)a3;
- (void)setChangedRecordZoneIDs:(id)a3;
- (void)setCoalescedArchive:(id)a3;
- (void)setCoalescedZoneFetch:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContainer:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setDesiredRecordZoneIDs:(id)a3;
- (void)setFetchRecordZoneChangesSuccess:(BOOL)a3;
- (void)setHasSubscription:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setRecordIDSalt:(id)a3;
- (void)setRecordZones:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setServerFetchPostponed:(BOOL)a3;
- (void)setTokenStores:(id)a3;
- (void)setUserRecordID:(id)a3;
- (void)setZoneObservers:(id)a3;
- (void)unregisterServerChangeTokenStore:(id)a3;
- (void)willAttachToContainer:(id)a3 serviceMode:(BOOL)a4 completion:(id)a5;
- (void)zonesDeletedOrReset:(id)a3 completion:(id)a4;
- (void)zonesTemporarilyUnreadableWithError:(id)a3 completion:(id)a4;
- (void)zonesUnreadableDueToMissingD2DEncryptionIdentity:(id)a3 completion:(id)a4;
@end

@implementation BCCloudKitDatabaseController

- (BOOL)establishedSalt
{
  v2 = [(BCCloudKitDatabaseController *)self recordIDSalt];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSData)recordIDSalt
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (BCCloudKitDatabaseController)initWithConfiguration:(id)a3 archiveURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)BCCloudKitDatabaseController;
  v9 = [(BCCloudKitDatabaseController *)&v40 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_archiveURL, a4);
    uint64_t v11 = objc_opt_new();
    observers = v10->_observers;
    v10->_observers = (NSMutableDictionary *)v11;

    uint64_t v13 = +[NSMapTable strongToWeakObjectsMapTable];
    zoneObservers = v10->_zoneObservers;
    v10->_zoneObservers = (NSMapTable *)v13;

    v10->_zoneObserversLock._os_unfair_lock_opaque = 0;
    uint64_t v15 = objc_opt_new();
    tokenStores = v10->_tokenStores;
    v10->_tokenStores = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    changedRecordZoneIDs = v10->_changedRecordZoneIDs;
    v10->_changedRecordZoneIDs = (NSMutableSet *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.iBooks.CloudKitDatabaseController", v19);

    objc_storeStrong((id *)&v10->_accessQueue, v20);
    accessQueue = v10->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022144;
    block[3] = &unk_10025F700;
    v22 = v10;
    v39 = v22;
    dispatch_sync(accessQueue, block);
    v23 = +[NSNotificationCenter defaultCenter];
    v24 = +[BDSReachability sharedReachabilityForInternetConnection];
    [v23 addObserver:v22 selector:"p_internetReachabilityChanged:" name:@"kNetworkReachabilityChangedNotification" object:v24];

    objc_initWeak(&location, v22);
    id v25 = objc_alloc((Class)BUCoalescingCallBlock);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10002214C;
    v34[3] = &unk_1002602A0;
    objc_copyWeak(&v36, &location);
    id v35 = v8;
    id v26 = [v25 initWithNotifyBlock:v34 notifyTimeout:10 blockDescription:@"_coalescedArchive in BCCloudKitDatabaseController" notifyTimeoutBlock:&stru_1002602C0];
    id v27 = v22[8];
    v22[8] = v26;

    [v22[8] setCoalescingDelay:1.0];
    id v28 = objc_alloc((Class)BUCoalescingCallBlock);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10002243C;
    v32[3] = &unk_10025FC90;
    objc_copyWeak(&v33, &location);
    id v29 = [v28 initWithNotifyBlock:v32 notifyTimeout:10 blockDescription:@"_coalescedZoneFetch in BCCloudKitDatabaseController" notifyTimeoutBlock:&stru_100260308];
    id v30 = v22[18];
    v22[18] = v29;

    [v22[18] setCoalescingDelay:2.0];
    objc_destroyWeak(&v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  return v10;
}

- (NSString)subscriptionID
{
  v2 = [(BCCloudKitDatabaseController *)self configuration];
  BOOL v3 = [v2 dbSubscriptionID];

  return (NSString *)v3;
}

- (id)appBundleIdentifier
{
  v2 = [(BCCloudKitDatabaseController *)self configuration];
  BOOL v3 = [v2 appBundleIdentifier];

  return v3;
}

- (void)fetchChangesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_1000083A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(BCCloudKitDatabaseController *)self containerIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - fetchChangesWithCompletion:", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v7 = [(BCCloudKitDatabaseController *)self accessQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022BE8;
  v9[3] = &unk_10025FE98;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)fetchRecordForRecordID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(BCCloudKitDatabaseController *)self accessQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002320C;
  v11[3] = &unk_100260278;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)willAttachToContainer:(id)a3 serviceMode:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BCCloudKitDatabaseController *)self accessQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100023520;
  v13[3] = &unk_1002603C8;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

- (void)connectUserTo:(id)a3 container:(id)a4 updateSubscription:(BOOL)a5 completion:(id)a6 subscriptionCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  BOOL v16 = sub_1000083A0();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [v13 containerIdentifier];
    *(_DWORD *)buf = 138543362;
    id v29 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - connectUserTo:container:updateSubscription:completion:", buf, 0xCu);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100023944;
  v22[3] = &unk_100260438;
  v22[4] = self;
  id v23 = v13;
  BOOL v27 = a5;
  id v24 = v12;
  id v25 = v15;
  id v26 = v14;
  id v18 = v14;
  id v19 = v15;
  id v20 = v12;
  id v21 = v13;
  [v21 fetchUserRecordIDWithCompletionHandler:v22];
}

- (void)attachToZones:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_t v8 = _os_activity_create((void *)&_mh_execute_header, "BCCloudKitDatabaseController/attachToZones-cloud", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  id v9 = [(BCCloudKitDatabaseController *)self containerIdentifier];
  unsigned __int8 v10 = [v9 containsString:@"cloudData"];

  if ((v10 & 1) == 0)
  {
    os_activity_t v11 = _os_activity_create((void *)&_mh_execute_header, "BCCloudKitDatabaseController/attachToZones-secureData", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_t v8 = v11;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023DF0;
  block[3] = &unk_100260500;
  id v15 = v6;
  id v16 = v7;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  os_activity_apply(v8, block);
}

- (void)detach
{
}

- (void)detachWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_t v8 = [(BCCloudKitDatabaseController *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024D44;
  block[3] = &unk_100260528;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)getAttached:(id)a3
{
  id v4 = a3;
  v5 = [(BCCloudKitDatabaseController *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100024F2C;
  v7[3] = &unk_10025FA48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)recordZoneWithName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(BCCloudKitDatabaseController *)self database];

    if (v8)
    {
      id v9 = [(BCCloudKitDatabaseController *)self accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000250B0;
      block[3] = &unk_100260550;
      id v11 = v6;
      id v12 = self;
      id v13 = v7;
      dispatch_async(v9, block);
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (id)saltedAndHashedIDFromLocalID:(id)a3
{
  id v4 = a3;
  v5 = [(BCCloudKitDatabaseController *)self recordIDSalt];
  id v6 = v5;
  if (v5)
  {
    memset(&v14, 0, sizeof(v14));
    id v7 = v5;
    CCHmacInit(&v14, 0, objc_msgSend(v7, "bytes", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0),
      (size_t)[v7 length]);
    id v8 = (const char *)[v4 UTF8String];
    size_t v9 = strlen(v8);
    CCHmacUpdate(&v14, v8, v9);
    macOut[0] = 0;
    macOut[1] = 0;
    int v16 = 0;
    CCHmacFinal(&v14, macOut);
    id v10 = +[NSData dataWithBytes:macOut length:20];
    id v11 = [v10 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v12 = sub_1000083A0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001E5850();
    }

    id v11 = 0;
  }

  return v11;
}

- (void)invalidateSalt
{
}

- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = [(BCCloudKitDatabaseController *)self saltedAndHashedIDFromLocalID:v7];
  if (!v8) {
    goto LABEL_6;
  }
  size_t v9 = (void *)v8;
  CFStringRef v10 = @"-";
  if (v6) {
    CFStringRef v10 = v6;
  }
  id v11 = +[NSString stringWithFormat:@"%@.%@", v10, v8];

  if (!v11)
  {
LABEL_6:
    id v12 = sub_1000083A0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001E58B8();
    }

    id v11 = 0;
  }

  return v11;
}

- (void)p_unsubscribeToContainer:(id)a3
{
  id v4 = a3;
  v5 = [v4 privateCloudDatabase];
  if (v5)
  {
    objc_initWeak(&location, self);
    id v6 = objc_alloc((Class)CKModifySubscriptionsOperation);
    id v7 = [(BCCloudKitDatabaseController *)self subscriptionID];
    id v15 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v15 count:1];
    id v9 = [v6 initWithSubscriptionsToSave:0 subscriptionIDsToDelete:v8];

    CFStringRef v10 = +[CKOperationConfiguration bds_defaultConfiguration];
    [v10 setContainer:v4];
    [v9 setConfiguration:v10];
    [v9 setDatabase:v5];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002562C;
    v11[3] = &unk_100260578;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    [v9 setModifySubscriptionsCompletionBlock:v11];
    [v5 addOperation:v9];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)p_subscribeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1000083A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(BCCloudKitDatabaseController *)self containerIdentifier];
    *(_DWORD *)buf = 138543362;
    v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "p_subscribeWithCompletion (%{public}@)", buf, 0xCu);
  }
  if ([(BCCloudKitDatabaseController *)self hasSubscription]
    || ([(BCCloudKitDatabaseController *)self database],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = v8 == 0,
        v8,
        v9))
  {
    id v24 = objc_retainBlock(v4);
    id v13 = v24;
    if (v24) {
      (*((void (**)(id))v24 + 2))(v24);
    }
  }
  else
  {
    CFStringRef v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Attempting CKModifySubscriptionsOperation", buf, 2u);
    }

    id v11 = objc_alloc((Class)CKDatabaseSubscription);
    id v12 = [(BCCloudKitDatabaseController *)self subscriptionID];
    id v13 = [v11 initWithSubscriptionID:v12];

    id v14 = objc_alloc_init((Class)CKNotificationInfo);
    [v14 setShouldSendContentAvailable:1];
    [v13 setNotificationInfo:v14];
    objc_initWeak(&location, self);
    id v15 = objc_alloc((Class)CKModifySubscriptionsOperation);
    id v35 = v13;
    int v16 = +[NSArray arrayWithObjects:&v35 count:1];
    id v17 = [v15 initWithSubscriptionsToSave:v16 subscriptionIDsToDelete:0];

    id v18 = +[CKOperationConfiguration bds_defaultConfiguration];
    id v19 = [(BCCloudKitDatabaseController *)self container];
    [v18 setContainer:v19];

    [v17 setConfiguration:v18];
    id v20 = [(BCCloudKitDatabaseController *)self database];
    [v17 setDatabase:v20];

    id v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    BOOL v27 = sub_100025BB8;
    id v28 = &unk_1002605A0;
    objc_copyWeak(&v31, &location);
    id v29 = self;
    id v30 = v4;
    [v17 setModifySubscriptionsCompletionBlock:&v25];
    id v21 = sub_1000083A0();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = objc_msgSend(v17, "operationID", v25, v26, v27, v28, v29);
      sub_1001E5920((uint64_t)v17, v22, buf, v21);
    }

    id v23 = [(BCCloudKitDatabaseController *)self database];
    [v23 addOperation:v17];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

- (void)p_fetchDatabaseChanges:(id)a3
{
  id v4 = a3;
  v5 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1000083A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(BCCloudKitDatabaseController *)self containerIdentifier];
    uint64_t v8 = [(BCCloudKitDatabaseController *)self serverChangeToken];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@)- Adding fetch database changes, serverChangeToken: %{public}@", buf, 0x16u);
  }
  BOOL v9 = [(BCCloudKitDatabaseController *)self database];
  if (v9)
  {
    id v10 = objc_alloc((Class)CKFetchDatabaseChangesOperation);
    id v11 = [(BCCloudKitDatabaseController *)self serverChangeToken];
    id v12 = [v10 initWithPreviousServerChangeToken:v11];

    [v12 setFetchAllChanges:1];
    id v13 = +[CKOperationConfiguration bds_defaultConfiguration];
    id v14 = [(BCCloudKitDatabaseController *)self container];
    [v13 setContainer:v14];

    [v12 setConfiguration:v13];
    id v15 = [(BCCloudKitDatabaseController *)self database];
    [v12 setDatabase:v15];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    objc_super v40 = sub_100026494;
    v41 = sub_1000264A4;
    id v42 = objc_alloc_init((Class)NSMutableOrderedSet);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000264AC;
    v34[3] = &unk_1002605C8;
    void v34[4] = self;
    v34[5] = buf;
    [v12 setRecordZoneWithIDWasDeletedBlock:v34];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10002664C;
    v33[3] = &unk_1002605C8;
    v33[4] = self;
    v33[5] = buf;
    [v12 setRecordZoneWithIDWasPurgedBlock:v33];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000267EC;
    v32[3] = &unk_1002605C8;
    void v32[4] = self;
    v32[5] = buf;
    [v12 setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock:v32];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10002698C;
    v31[3] = &unk_100260610;
    v31[4] = self;
    [v12 setChangeTokenUpdatedBlock:v31];
    int v16 = [(BCCloudKitDatabaseController *)self configuration];
    id v17 = [v16 serviceZones];
    id v18 = +[NSSet setWithArray:v17];

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100026B6C;
    v29[3] = &unk_100260658;
    v29[4] = self;
    id v19 = v18;
    id v30 = v19;
    [v12 setRecordZoneWithIDChangedBlock:v29];
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    id v24 = sub_100026DA4;
    id v25 = &unk_1002606A8;
    id v28 = buf;
    uint64_t v26 = self;
    id v27 = v4;
    [v12 setFetchDatabaseChangesCompletionBlock:&v22];
    id v20 = sub_1000083A0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [(BCCloudKitDatabaseController *)self containerIdentifier];
      *(_DWORD *)id v35 = 138543618;
      id v36 = v21;
      __int16 v37 = 2112;
      id v38 = v12;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@)- Adding fetch database changes %@", v35, 0x16u);
    }
    [v9 addOperation:v12];

    _Block_object_dispose(buf, 8);
    goto LABEL_9;
  }
  id v12 = objc_retainBlock(v4);
  if (v12)
  {
    id v13 = +[NSError errorWithDomain:@"BDSErrorDomain" code:1004 userInfo:0];
    (*((void (**)(id, void *))v12 + 2))(v12, v13);
LABEL_9:
  }
}

- (void)p_createRecordZones:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v8);

  BOOL v9 = [(BCCloudKitDatabaseController *)self database];
  id v10 = sub_1000083A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(BCCloudKitDatabaseController *)self containerIdentifier];
    id v12 = v6;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100030300;
    id v29 = &unk_100260BC0;
    id v30 = objc_alloc_init((Class)NSMutableArray);
    id v13 = v30;
    [v12 enumerateObjectsUsingBlock:buf];
    id v14 = [v13 componentsJoinedByString:@","];

    id v15 = [(BCCloudKitDatabaseController *)self database];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2114;
    id v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[BCCloudKitDatabaseController (%@)] 2. p_createRecordZones:%@ database:%{public}@", buf, 0x20u);
  }
  if ([v6 count] && v9)
  {
    id v16 = [objc_alloc((Class)CKFetchRecordZonesOperation) initWithRecordZoneIDs:v6];
    id v17 = +[CKOperationConfiguration bds_defaultConfiguration];
    id v18 = [(BCCloudKitDatabaseController *)self container];
    [v17 setContainer:v18];
    [v16 setConfiguration:v17];
    [v16 setDatabase:v9];
    objc_initWeak((id *)buf, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000275CC;
    v22[3] = &unk_1002607C0;
    objc_copyWeak(&v27, (id *)buf);
    id v26 = v7;
    id v23 = v6;
    id v19 = v18;
    id v24 = v19;
    id v20 = v9;
    id v25 = v20;
    [v16 setFetchRecordZonesCompletionBlock:v22];
    [v20 addOperation:v16];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v21 = objc_retainBlock(v7);
    id v16 = v21;
    if (v21) {
      (*((void (**)(id, void))v21 + 2))(v21, 0);
    }
  }
}

- (void)p_createRecordIDSaltWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1000083A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(BCCloudKitDatabaseController *)self containerIdentifier];
    uint64_t v8 = [(BCCloudKitDatabaseController *)self database];
    *(_DWORD *)buf = 138543618;
    id v16 = v7;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Establishing record salt, database:%{public}@", buf, 0x16u);
  }
  id v9 = [objc_alloc((Class)CKRecordID) initWithRecordName:@"recordIDSalt"];
  objc_initWeak((id *)buf, self);
  id v10 = [(BCCloudKitDatabaseController *)self database];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100028D84;
  v12[3] = &unk_100260810;
  objc_copyWeak(&v14, (id *)buf);
  v12[4] = self;
  id v11 = v4;
  id v13 = v11;
  [v10 fetchRecordWithID:v9 completionHandler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)p_fetchZoneChanges:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  if ([(BCCloudKitDatabaseController *)self serverFetchPostponed])
  {
    id v6 = sub_1000083A0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "fetch zone changes attempted while postponing such fetches.  Nil error, but this operation will be attempted again after the back-off period.", buf, 2u);
    }

    v4[2](v4, 0);
  }
  else
  {
    id v7 = +[NSMutableArray array];
    uint64_t v8 = +[NSMutableArray array];
    id v9 = [(BCCloudKitDatabaseController *)self tokenStores];
    id v10 = [v9 allKeys];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100029CC4;
    v18[3] = &unk_100260838;
    v18[4] = self;
    id v19 = v7;
    id v11 = v8;
    id v20 = v11;
    id v12 = v7;
    [v10 enumerateObjectsUsingBlock:v18];

    id v13 = [v12 copy];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100029DBC;
    v15[3] = &unk_1002604B0;
    v15[4] = self;
    id v16 = v11;
    __int16 v17 = v4;
    id v14 = v11;
    [(BCCloudKitDatabaseController *)self p_fetchRecordZoneChangesForRecordZoneIDs:v13 completionHandler:v15];
  }
}

- (void)p_fetchRecordZoneChangesForRecordZoneIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 count];
  id v10 = sub_1000083A0();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      id v12 = [(BCCloudKitDatabaseController *)self containerIdentifier];
      *(_DWORD *)buf = 138543618;
      id v35 = v12;
      __int16 v36 = 2114;
      id v37 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@)- fetching record zone changes for recordZoneIDs:%{public}@", buf, 0x16u);
    }
    id v13 = [(BCCloudKitDatabaseController *)self recordZones];
    [(BCCloudKitDatabaseController *)self desiredRecordZoneIDs];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10002A2F4;
    v31[3] = &unk_100260860;
    id v32 = v13;
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v33;
    id v15 = v13;
    [v6 enumerateObjectsUsingBlock:v31];
    id v16 = objc_opt_new();
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10002A3B0;
    v28[3] = &unk_100260838;
    v28[4] = self;
    dispatch_group_t v29 = dispatch_group_create();
    id v17 = v16;
    id v30 = v17;
    id v18 = v29;
    [v6 enumerateObjectsUsingBlock:v28];
    id v19 = [(BCCloudKitDatabaseController *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002A630;
    block[3] = &unk_1002604D8;
    id v24 = v17;
    id v25 = self;
    id v26 = v6;
    id v27 = v7;
    id v20 = v17;
    dispatch_group_notify(v18, v19, block);
  }
  else
  {
    if (v11)
    {
      id v21 = [(BCCloudKitDatabaseController *)self containerIdentifier];
      *(_DWORD *)buf = 138543362;
      id v35 = v21;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@)- No record zone changes to fetch", buf, 0xCu);
    }
    self->_fetchRecordZoneChangesSuccess = 1;
    id v22 = objc_retainBlock(v7);
    id v15 = v22;
    if (v22) {
      (*((void (**)(id, void))v22 + 2))(v22, 0);
    }
  }
}

- (void)p_updateRetryParametersFromFetchZoneChangesOperationError:(id)a3
{
  id v15 = a3;
  id v4 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [v15 domain];
  unsigned int v6 = [v5 isEqualToString:CKErrorDomain];

  double v7 = 5.0;
  if (!v6) {
    goto LABEL_7;
  }
  objc_opt_class();
  uint64_t v8 = [v15 userInfo];
  id v9 = [v8 objectForKeyedSubscript:CKErrorRetryAfterKey];
  id v10 = BUDynamicCast();
  [v10 doubleValue];
  double v7 = v11;

  if (v7 > 0.0)
  {
LABEL_7:
    [(BCCloudKitDatabaseController *)self setBackOffInterval:v7];
    goto LABEL_8;
  }
  unint64_t v12 = (unint64_t)[v15 code];
  if (v12 <= 0x17 && ((1 << v12) & 0x8000C0) != 0)
  {
    [(BCCloudKitDatabaseController *)self backOffInterval];
    double v7 = 5.0;
    if (v13 >= 5.0)
    {
      [(BCCloudKitDatabaseController *)self backOffInterval];
      double v7 = v14 + v14;
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (void)p_fetchRecordZoneChanges:(id)a3 optionsByRecordZoneID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v10 = a5;
  double v11 = sub_1000083A0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = [(BCCloudKitDatabaseController *)self containerIdentifier];
    id v13 = v8;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = sub_100030300;
    v52 = (uint64_t (*)(uint64_t, uint64_t))&unk_100260BC0;
    *(void *)&long long v53 = objc_alloc_init((Class)NSMutableArray);
    id v14 = (id)v53;
    [v13 enumerateObjectsUsingBlock:buf];
    id v15 = [v14 componentsJoinedByString:@","];

    id v16 = [(BCCloudKitDatabaseController *)self database];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2114;
    v52 = v9;
    LOWORD(v53) = 2048;
    *(void *)((char *)&v53 + 2) = v16;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@) p_fetchRecordZoneChanges recordZoneIDs:%{public}@, optionsByRecordZoneID:%{public}@ self.database=%p", buf, 0x2Au);
  }
  id v17 = [(BCCloudKitDatabaseController *)self database];
  if (v17)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v52 = sub_100026494;
    *(void *)&long long v53 = sub_1000264A4;
    *((void *)&v53 + 1) = objc_opt_new();
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = sub_100026494;
    v45[4] = sub_1000264A4;
    id v46 = objc_alloc_init((Class)NSMutableOrderedSet);
    id v18 = [objc_alloc((Class)CKFetchRecordZoneChangesOperation) initWithRecordZoneIDs:v8 configurationsByRecordZoneID:v9];
    [v18 setFetchAllChanges:1];
    id v19 = +[CKOperationConfiguration bds_defaultConfiguration];
    id v20 = [(BCCloudKitDatabaseController *)self container];
    [v19 setContainer:v20];

    [v19 setQualityOfService:17];
    [v19 setDiscretionaryNetworkBehavior:0];
    [v19 setAutomaticallyRetryNetworkFailures:0];
    [v18 setConfiguration:v19];
    id v21 = [(BCCloudKitDatabaseController *)self database];
    [v18 setDatabase:v21];

    objc_initWeak(&location, self);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10002B100;
    v43[3] = &unk_1002608D8;
    v43[4] = self;
    v43[5] = buf;
    [v18 setRecordChangedBlock:v43];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10002B360;
    v42[3] = &unk_100260900;
    v42[4] = self;
    [v18 setRecordWithIDWasDeletedBlock:v42];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10002B5C0;
    v39[3] = &unk_100260950;
    v39[4] = self;
    id v22 = v8;
    id v40 = v22;
    v41 = buf;
    [v18 setRecordZoneChangeTokensUpdatedBlock:v39];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10002B884;
    v35[3] = &unk_1002609C0;
    uint8_t v35[4] = self;
    id v23 = v22;
    id v36 = v23;
    id v37 = v45;
    id v38 = buf;
    [v18 setRecordZoneFetchCompletionBlock:v35];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10002BFD4;
    v29[3] = &unk_100260A80;
    v29[4] = self;
    objc_copyWeak(&v34, &location);
    id v32 = v45;
    id v30 = v23;
    id v33 = buf;
    id v31 = v10;
    [v18 setFetchRecordZoneChangesCompletionBlock:v29];
    id v24 = sub_1000083A0();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [(BCCloudKitDatabaseController *)self containerIdentifier];
      *(_DWORD *)v47 = 138543618;
      v48 = v25;
      __int16 v49 = 2112;
      id v50 = v18;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@) p_fetchRecordZoneChanges Adding fetchRecordZoneChangesOperation=%@", v47, 0x16u);
    }
    id v26 = [(BCCloudKitDatabaseController *)self database];
    [v26 addOperation:v18];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v27 = (void (**)(id, void *))objc_retainBlock(v10);
    if (v27)
    {
      id v28 = +[NSError errorWithDomain:@"BDSErrorDomain" code:1004 userInfo:0];
      v27[2](v27, v28);
    }
  }
}

- (void)p_internetReachabilityChanged:(id)a3
{
  id v4 = [(BCCloudKitDatabaseController *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CA6C;
  block[3] = &unk_10025F700;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)p_informObserversOfAttachmentChange
{
  BOOL v3 = sub_1000083A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(BCCloudKitDatabaseController *)self containerIdentifier];
    unsigned int v5 = [(BCCloudKitDatabaseController *)self attachedToContainer];
    CFStringRef v6 = @"NO";
    if (v5) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    id v32 = v4;
    __int16 v33 = 2112;
    CFStringRef v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - p_informObserversOfAttachmentChange. Attached to container: %@", buf, 0x16u);
  }
  double v7 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v7);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(BCCloudKitDatabaseController *)self observers];
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v11);
        id v13 = [(BCCloudKitDatabaseController *)self observers];
        id v14 = [v13 objectForKeyedSubscript:v12];

        if ([v14 count])
        {
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v22;
            do
            {
              id v19 = 0;
              do
              {
                if (*(void *)v22 != v18) {
                  objc_enumerationMutation(v15);
                }
                objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v19), "databaseController:attachmentChanged:", self, -[BCCloudKitDatabaseController attachedToContainer](self, "attachedToContainer"));
                id v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              id v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v17);
          }
        }
        double v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }
}

- (void)p_informObserversOfRecordsChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000083A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    CFStringRef v6 = [(BCCloudKitDatabaseController *)self containerIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - p_informObserversOfRecordsChanged.", buf, 0xCu);
  }
  double v7 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v7);

  if ([v4 count])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002D098;
    v8[3] = &unk_100260AA8;
    v8[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

- (void)p_informObserversOfSaltVersionIdentifierChanged:(id)a3 forZones:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002D280;
  v15[3] = &unk_1002604D8;
  p_zoneObserversLock = &self->_zoneObserversLock;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  os_unfair_lock_lock(p_zoneObserversLock);
  sub_10002D280((id *)v15);
  os_unfair_lock_unlock(p_zoneObserversLock);
}

- (void)p_informObserversOfRecordsChanged:(id)a3 forRecordType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1000083A0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(BCCloudKitDatabaseController *)self containerIdentifier];
    *(_DWORD *)buf = 138543874;
    long long v27 = v10;
    __int16 v28 = 2050;
    id v29 = [v6 count];
    __int16 v30 = 2114;
    id v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@) - p_informObserversOfRecordsChanged: changedRecords.count=%{public}lu recordType=%{public}@", buf, 0x20u);
  }
  if ([v6 count])
  {
    double v11 = [(BCCloudKitDatabaseController *)self observers];
    id v12 = [v11 objectForKeyedSubscript:v7];

    if ([v12 count])
    {
      id v20 = v7;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v13 = v12;
      id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v22;
        do
        {
          id v17 = 0;
          do
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v17);
            id v19 = [objc_alloc((Class)NSArray) initWithArray:v6 copyItems:1];
            [v18 databaseController:self recordsChanged:v19];

            id v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v15);
      }

      id v7 = v20;
    }
  }
}

- (void)p_informObserversOfCompletedFetchOfZone:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1000083A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(BCCloudKitDatabaseController *)self containerIdentifier];
    *(_DWORD *)buf = 138543618;
    id v32 = v7;
    __int16 v33 = 2114;
    id v34 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - p_informObserversOfCompletedFetchOfZone zoneName=%{public}@", buf, 0x16u);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(BCCloudKitDatabaseController *)self observers];
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v11);
        id v13 = [(BCCloudKitDatabaseController *)self observers];
        id v14 = [v13 objectForKeyedSubscript:v12];

        if ([v14 count])
        {
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v22;
            do
            {
              id v19 = 0;
              do
              {
                if (*(void *)v22 != v18) {
                  objc_enumerationMutation(v15);
                }
                [*(id *)(*((void *)&v21 + 1) + 8 * (void)v19) databaseController:self fetchedAllRecordsInZone:v4];
                id v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              id v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v17);
          }
        }
        double v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }
}

- (void)p_scheduleArchiveWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(BCCloudKitDatabaseController *)self coalescedArchive];
  [v6 signalWithCompletion:v4];
}

- (void)p_unarchive
{
  BOOL v3 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v7 = [(BCCloudKitDatabaseController *)self archiveURL];
  if (v7)
  {
    id v4 = [objc_alloc((Class)NSData) initWithContentsOfURL:v7];
    if (v4)
    {
      unsigned int v5 = v4;
      id v6 = [(BCCloudKitDatabaseController *)self p_unarchiveFromData:v4];
    }
  }
}

- (id)p_archiveToData
{
  BOOL v3 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  if (v4)
  {
    if ([(BCCloudKitDatabaseController *)self hasSubscription]) {
      [v4 encodeInteger:1 forKey:@"hasUpdatedSubscription"];
    }
    unsigned int v5 = [(BCCloudKitDatabaseController *)self serverChangeToken];
    if (v5) {
      [v4 encodeObject:v5 forKey:@"serverChangeToken"];
    }

    id v6 = [(BCCloudKitDatabaseController *)self changedRecordZoneIDs];
    id v7 = [v6 count];

    if (v7)
    {
      id v8 = [(BCCloudKitDatabaseController *)self changedRecordZoneIDs];
      [v4 encodeObject:v8 forKey:@"changedRecordZoneIDs"];
    }
    id v9 = [(BCCloudKitDatabaseController *)self containerIdentifier];
    id v10 = [v9 length];

    if (v10)
    {
      double v11 = [(BCCloudKitDatabaseController *)self containerIdentifier];
      [v4 encodeObject:v11 forKey:@"containerIdentifier"];
    }
    uint64_t v12 = [(BCCloudKitDatabaseController *)self userRecordID];

    if (v12)
    {
      id v13 = [(BCCloudKitDatabaseController *)self userRecordID];
      [v4 encodeObject:v13 forKey:@"userRecordID"];
    }
    [v4 finishEncoding];
    id v14 = [v4 encodedData];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)p_unarchiveFromData:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v16 = 0;
    id v6 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v4 error:&v16];
    id v7 = v16;
    if (v7)
    {
      id v8 = sub_1000083A0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1001E5C60();
      }
    }
    else
    {
      -[BCCloudKitDatabaseController setHasSubscription:](self, "setHasSubscription:", [v6 decodeIntegerForKey:@"hasUpdatedSubscription"] == (id)1);
      id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"serverChangeToken"];
      [(BCCloudKitDatabaseController *)self setServerChangeToken:v9];

      uint64_t v10 = objc_opt_class();
      double v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
      id v8 = [v6 decodeObjectOfClasses:v11 forKey:@"changedRecordZoneIDs"];

      if (v8)
      {
        [(BCCloudKitDatabaseController *)self setChangedRecordZoneIDs:v8];
      }
      else
      {
        uint64_t v12 = objc_opt_new();
        [(BCCloudKitDatabaseController *)self setChangedRecordZoneIDs:v12];
      }
      id v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"containerIdentifier"];
      [(BCCloudKitDatabaseController *)self setContainerIdentifier:v13];

      id v14 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"userRecordID"];
      [(BCCloudKitDatabaseController *)self setUserRecordID:v14];

      [v6 finishDecoding];
    }
  }
  return 0;
}

+ (id)encodeRecordSystemFields:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v3 encodeSystemFieldsWithCoder:v4];

  [v4 finishEncoding];
  unsigned int v5 = [v4 encodedData];

  return v5;
}

+ (id)decodeRecordFromSystemFields:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v3 error:&v9];

  id v5 = v9;
  if (v5)
  {
    id v6 = sub_1000083A0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001E5C60();
    }

    id v7 = 0;
  }
  else
  {
    id v7 = [objc_alloc((Class)CKRecord) initWithCoder:v4];
    [v4 finishDecoding];
  }

  return v7;
}

+ (void)startInternetConnectionReachabilityNotifier
{
  id v2 = +[BDSReachability sharedReachabilityForInternetConnection];
  [v2 startNotifier];
}

- (void)_deleteRecordZonesWithIDs:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(BCCloudKitDatabaseController *)self accessQueue];
  dispatch_assert_queue_V2(v10);

  double v11 = sub_1000083A0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleting zone: (%{public}@)", buf, 0xCu);
  }

  if (self->_container)
  {
    id v12 = [objc_alloc((Class)CKModifyRecordZonesOperation) initWithRecordZonesToSave:0 recordZoneIDsToDelete:v8];
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_10002E564;
    uint64_t v18 = &unk_100260AF8;
    id v19 = v8;
    id v20 = v9;
    [v12 setModifyRecordZonesCompletionBlock:&v15];
    objc_msgSend(v12, "setQualityOfService:", a4, v15, v16, v17, v18);
    id v13 = [(CKContainer *)self->_container privateCloudDatabase];
    [v13 addOperation:v12];

    id v14 = v19;
LABEL_7:

    goto LABEL_8;
  }
  id v12 = objc_retainBlock(v9);
  if (v12)
  {
    id v14 = +[NSError errorWithDomain:CKErrorDomain code:5 userInfo:0];
    (*((void (**)(id, void *))v12 + 2))(v12, v14);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)zonesUnreadableDueToMissingD2DEncryptionIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000083A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1001E5D44(self);
  }

  id v9 = [(BCCloudKitDatabaseController *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E724;
  block[3] = &unk_100260528;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)zonesTemporarilyUnreadableWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000083A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1001E5DD4(self);
  }

  id v9 = [(BCCloudKitDatabaseController *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EADC;
  block[3] = &unk_100260528;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)zonesDeletedOrReset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000083A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(BCCloudKitDatabaseController *)self containerIdentifier];
    *(_DWORD *)buf = 138543618;
    id v15 = v9;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@) - zonesDeletedOrReset: %{public}@", buf, 0x16u);
  }
  id v10 = [(BCCloudKitDatabaseController *)self accessQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002ED20;
  v12[3] = &unk_10025FF28;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(v10, v12);
}

- (void)addObserver:(id)a3 recordType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && [v7 length])
  {
    id v9 = [(BCCloudKitDatabaseController *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002EF1C;
    block[3] = &unk_10025F770;
    void block[4] = self;
    id v12 = v8;
    id v13 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E5E64();
    }
  }
}

- (void)removeObserver:(id)a3 recordType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && [v7 length])
  {
    id v9 = [(BCCloudKitDatabaseController *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002F124;
    block[3] = &unk_10025F770;
    void block[4] = self;
    id v12 = v8;
    id v13 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E5E64();
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BCCloudKitDatabaseController *)self accessQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002F364;
    v14[3] = &unk_10025F988;
    v14[4] = self;
    id v15 = v4;
    dispatch_async(v5, v14);
  }
  else
  {
    id v6 = sub_1000083A0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001E5FAC(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)addObserver:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002F5A0;
  v11[3] = &unk_10025F770;
  p_zoneObserversLock = &self->_zoneObserversLock;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  os_unfair_lock_lock(p_zoneObserversLock);
  sub_10002F5A0((uint64_t)v11);
  os_unfair_lock_unlock(p_zoneObserversLock);
}

- (void)registerServerChangeTokenStore:(id)a3 forZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    objc_initWeak(&location, self);
    id v9 = [(BCCloudKitDatabaseController *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002F814;
    block[3] = &unk_100260B70;
    objc_copyWeak(&v15, &location);
    id v12 = v8;
    id v13 = v6;
    id v14 = self;
    dispatch_async(v9, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E608C();
    }
  }
}

- (void)unregisterServerChangeTokenStore:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = [(BCCloudKitDatabaseController *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002FCA8;
    block[3] = &unk_10025F9F8;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = sub_1000083A0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001E6164(v6);
    }
  }
}

- (id)diagnosticDatabaseInfo
{
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100026494;
  long long v23 = sub_1000264A4;
  id v24 = 0;
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = [(BCCloudKitDatabaseController *)self accessQueue];
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100030004;
  id v14 = &unk_100260B98;
  id v17 = &v25;
  uint64_t v18 = &v19;
  id v15 = self;
  id v5 = v3;
  __int16 v16 = v5;
  dispatch_async(v4, &v11);

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = [BDSCloudSyncDiagnosticDatabaseInfo alloc];
  int v7 = *((unsigned __int8 *)v26 + 24);
  BOOL v8 = [(BCCloudKitDatabaseController *)self establishedSalt];
  id v9 = [(BDSCloudSyncDiagnosticDatabaseInfo *)v6 initWithAttached:v7 != 0 establishedSalt:v8 container:v20[5]];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v9;
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (BOOL)hasSubscription
{
  return self->_hasSubscription;
}

- (void)setHasSubscription:(BOOL)a3
{
  self->_hasSubscription = a3;
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (void)setArchiveURL:(id)a3
{
}

- (NSArray)desiredRecordZoneIDs
{
  return self->_desiredRecordZoneIDs;
}

- (void)setDesiredRecordZoneIDs:(id)a3
{
}

- (NSMutableSet)changedRecordZoneIDs
{
  return self->_changedRecordZoneIDs;
}

- (void)setChangedRecordZoneIDs:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedArchive
{
  return self->_coalescedArchive;
}

- (void)setCoalescedArchive:(id)a3
{
}

- (BCCloudKitConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (CKRecordID)userRecordID
{
  return self->_userRecordID;
}

- (void)setUserRecordID:(id)a3
{
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
}

- (void)setRecordIDSalt:(id)a3
{
}

- (NSMutableDictionary)recordZones
{
  return self->_recordZones;
}

- (void)setRecordZones:(id)a3
{
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMapTable)zoneObservers
{
  return self->_zoneObservers;
}

- (void)setZoneObservers:(id)a3
{
}

- (NSMutableDictionary)tokenStores
{
  return self->_tokenStores;
}

- (void)setTokenStores:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedZoneFetch
{
  return self->_coalescedZoneFetch;
}

- (void)setCoalescedZoneFetch:(id)a3
{
}

- (BOOL)attachedToContainer
{
  return self->_attachedToContainer;
}

- (void)setAttachedToContainer:(BOOL)a3
{
  self->_attachedToContainer = a3;
}

- (double)backOffInterval
{
  return self->_backOffInterval;
}

- (void)setBackOffInterval:(double)a3
{
  self->_backOffInterval = a3;
}

- (BOOL)serverFetchPostponed
{
  return self->_serverFetchPostponed;
}

- (void)setServerFetchPostponed:(BOOL)a3
{
  self->_serverFetchPostponed = a3;
}

- (BOOL)fetchRecordZoneChangesSuccess
{
  return self->_fetchRecordZoneChangesSuccess;
}

- (void)setFetchRecordZoneChangesSuccess:(BOOL)a3
{
  self->_fetchRecordZoneChangesSuccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedZoneFetch, 0);
  objc_storeStrong((id *)&self->_tokenStores, 0);
  objc_storeStrong((id *)&self->_zoneObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_recordZones, 0);
  objc_storeStrong((id *)&self->_recordIDSalt, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_coalescedArchive, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_changedRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_desiredRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end