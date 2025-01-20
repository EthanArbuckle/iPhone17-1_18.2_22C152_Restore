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

- (BCCloudKitDatabaseController)initWithConfiguration:(id)a3 archiveURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v84.receiver = self;
  v84.super_class = (Class)BCCloudKitDatabaseController;
  v9 = [(BCCloudKitDatabaseController *)&v84 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_archiveURL, a4);
    uint64_t v11 = objc_opt_new();
    observers = v10->_observers;
    v10->_observers = (NSMutableDictionary *)v11;

    uint64_t v20 = objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x263F08968], v13, v14, v15, v16, v17, v18, v19);
    zoneObservers = v10->_zoneObservers;
    v10->_zoneObservers = (NSMapTable *)v20;

    v10->_zoneObserversLock._os_unfair_lock_opaque = 0;
    uint64_t v22 = objc_opt_new();
    tokenStores = v10->_tokenStores;
    v10->_tokenStores = (NSMutableDictionary *)v22;

    uint64_t v24 = objc_opt_new();
    changedRecordZoneIDs = v10->_changedRecordZoneIDs;
    v10->_changedRecordZoneIDs = (NSMutableSet *)v24;

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.iBooks.CloudKitDatabaseController", v26);

    objc_storeStrong((id *)&v10->_accessQueue, v27);
    accessQueue = v10->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2360EEBFC;
    block[3] = &unk_264CA1428;
    v29 = v10;
    v83 = v29;
    dispatch_sync(accessQueue, block);
    v37 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v30, v31, v32, v33, v34, v35, v36);
    v45 = objc_msgSend_sharedReachabilityForInternetConnection(BDSReachability, v38, v39, v40, v41, v42, v43, v44);
    objc_msgSend_addObserver_selector_name_object_(v37, v46, (uint64_t)v29, (uint64_t)sel_p_internetReachabilityChanged_, @"kNetworkReachabilityChangedNotification", (uint64_t)v45, v47, v48);

    objc_initWeak(&location, v29);
    id v49 = objc_alloc(MEMORY[0x263F2BA50]);
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = sub_2360EEC04;
    v78[3] = &unk_264CA16B0;
    objc_copyWeak(&v80, &location);
    id v79 = v8;
    uint64_t v53 = objc_msgSend_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_(v49, v50, (uint64_t)v78, 10, @"_coalescedArchive in BCCloudKitDatabaseController", (uint64_t)&unk_26E971C90, v51, v52);
    v54 = v29[8];
    v29[8] = (void *)v53;

    objc_msgSend_setCoalescingDelay_(v29[8], v55, v56, v57, v58, v59, v60, v61, 1.0);
    id v62 = objc_alloc(MEMORY[0x263F2BA50]);
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = sub_2360EEEF4;
    v76[3] = &unk_264CA1608;
    objc_copyWeak(&v77, &location);
    uint64_t v66 = objc_msgSend_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_(v62, v63, (uint64_t)v76, 10, @"_coalescedZoneFetch in BCCloudKitDatabaseController", (uint64_t)&unk_26E971CB0, v64, v65);
    v67 = v29[18];
    v29[18] = (void *)v66;

    objc_msgSend_setCoalescingDelay_(v29[18], v68, v69, v70, v71, v72, v73, v74, 2.0);
    objc_destroyWeak(&v77);

    objc_destroyWeak(&v80);
    objc_destroyWeak(&location);
  }
  return v10;
}

- (NSString)subscriptionID
{
  id v8 = objc_msgSend_configuration(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v16 = objc_msgSend_dbSubscriptionID(v8, v9, v10, v11, v12, v13, v14, v15);

  return (NSString *)v16;
}

- (id)appBundleIdentifier
{
  id v8 = objc_msgSend_configuration(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v16 = objc_msgSend_appBundleIdentifier(v8, v9, v10, v11, v12, v13, v14, v15);

  return v16;
}

- (void)fetchChangesWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = BDSCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = objc_msgSend_containerIdentifier(self, v6, v7, v8, v9, v10, v11, v12);
    *(_DWORD *)buf = 138543362;
    dispatch_queue_t v27 = v13;
    _os_log_impl(&dword_2360BC000, v5, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - fetchChangesWithCompletion:", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v21 = objc_msgSend_accessQueue(self, v14, v15, v16, v17, v18, v19, v20);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_2360EF6A0;
  v23[3] = &unk_264CA0AD0;
  objc_copyWeak(&v25, (id *)buf);
  id v24 = v4;
  id v22 = v4;
  dispatch_async(v21, v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (void)fetchRecordForRecordID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v15 = objc_msgSend_accessQueue(self, v8, v9, v10, v11, v12, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2360EFCC4;
  v18[3] = &unk_264CA1688;
  objc_copyWeak(&v21, &location);
  id v19 = v6;
  id v20 = v7;
  id v16 = v7;
  id v17 = v6;
  dispatch_async(v15, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)willAttachToContainer:(id)a3 serviceMode:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v17 = objc_msgSend_accessQueue(self, v10, v11, v12, v13, v14, v15, v16);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2360EFFD8;
  v20[3] = &unk_264CA1778;
  v20[4] = self;
  id v21 = v8;
  BOOL v23 = a4;
  id v22 = v9;
  id v18 = v9;
  id v19 = v8;
  dispatch_sync(v17, v20);
}

- (void)connectUserTo:(id)a3 container:(id)a4 updateSubscription:(BOOL)a5 completion:(id)a6 subscriptionCompletion:(id)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = BDSCloudKitLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v24 = objc_msgSend_containerIdentifier(v13, v17, v18, v19, v20, v21, v22, v23);
    *(_DWORD *)buf = 138543362;
    uint64_t v42 = v24;
    _os_log_impl(&dword_2360BC000, v16, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - connectUserTo:container:updateSubscription:completion:", buf, 0xCu);
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_2360F03FC;
  v35[3] = &unk_264CA17C8;
  v35[4] = self;
  id v36 = v13;
  BOOL v40 = a5;
  id v37 = v12;
  id v38 = v15;
  id v39 = v14;
  id v25 = v14;
  id v26 = v15;
  id v27 = v12;
  id v28 = v13;
  objc_msgSend_fetchUserRecordIDWithCompletionHandler_(v28, v29, (uint64_t)v35, v30, v31, v32, v33, v34);
}

- (void)attachToZones:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_activity_t v8 = _os_activity_create(&dword_2360BC000, "BCCloudKitDatabaseController/attachToZones-cloud", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
  uint64_t v16 = objc_msgSend_containerIdentifier(self, v9, v10, v11, v12, v13, v14, v15);
  char v23 = objc_msgSend_containsString_(v16, v17, @"cloudData", v18, v19, v20, v21, v22);

  if ((v23 & 1) == 0)
  {
    os_activity_t v24 = _os_activity_create(&dword_2360BC000, "BCCloudKitDatabaseController/attachToZones-secureData", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_t v8 = v24;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360F08A8;
  block[3] = &unk_264CA1868;
  id v28 = v6;
  id v29 = v7;
  void block[4] = self;
  id v25 = v6;
  id v26 = v7;
  os_activity_apply(v8, block);
}

- (void)detach
{
  objc_msgSend_detachWithError_completion_(self, a2, 0, 0, v2, v3, v4, v5);
}

- (void)detachWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_accessQueue(self, v8, v9, v10, v11, v12, v13, v14);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360F17FC;
  block[3] = &unk_264CA1890;
  void block[4] = self;
  id v19 = v6;
  id v20 = v7;
  id v16 = v7;
  id v17 = v6;
  dispatch_async(v15, block);
}

- (void)getAttached:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_accessQueue(self, v5, v6, v7, v8, v9, v10, v11);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2360F19E4;
  v14[3] = &unk_264CA18B8;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async(v12, v14);
}

- (void)recordZoneWithName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v14 = a4;
  if (v14)
  {
    id v15 = objc_msgSend_database(self, v7, v8, v9, v10, v11, v12, v13);

    if (v15)
    {
      char v23 = objc_msgSend_accessQueue(self, v16, v17, v18, v19, v20, v21, v22);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_2360F1B68;
      block[3] = &unk_264CA18E0;
      id v25 = v6;
      id v26 = self;
      id v27 = v14;
      dispatch_async(v23, block);
    }
    else
    {
      (*((void (**)(id, void))v14 + 2))(v14, 0);
    }
  }
}

- (id)saltedAndHashedIDFromLocalID:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_recordIDSalt(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
    uint64_t v22 = (const void *)objc_msgSend_bytes(v14, v15, v16, v17, v18, v19, v20, v21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
                          0,
                          0,
                          0,
                          0);
    size_t v30 = objc_msgSend_length(v14, v23, v24, v25, v26, v27, v28, v29);
    CCHmacInit(&v56, 0, v22, v30);
    id v31 = v4;
    id v39 = (const char *)objc_msgSend_UTF8String(v31, v32, v33, v34, v35, v36, v37, v38);
    size_t v40 = strlen(v39);
    CCHmacUpdate(&v56, v39, v40);
    macOut[0] = 0;
    macOut[1] = 0;
    int v58 = 0;
    CCHmacFinal(&v56, macOut);
    v46 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v41, (uint64_t)macOut, 20, v42, v43, v44, v45);
    uint64_t v53 = objc_msgSend_base64EncodedStringWithOptions_(v46, v47, 0, v48, v49, v50, v51, v52);
  }
  else
  {
    v54 = BDSCloudKitLog();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      sub_2361FA14C();
    }

    uint64_t v53 = 0;
  }

  return v53;
}

- (BOOL)establishedSalt
{
  uint64_t v8 = objc_msgSend_recordIDSalt(self, a2, v2, v3, v4, v5, v6, v7);
  BOOL v9 = v8 != 0;

  return v9;
}

- (void)invalidateSalt
{
  objc_msgSend_setRecordIDSalt_(self, a2, 0, v2, v3, v4, v5, v6);
}

- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4
{
  uint64_t v6 = (__CFString *)a3;
  id v13 = a4;
  if (!v13) {
    goto LABEL_6;
  }
  uint64_t v14 = objc_msgSend_saltedAndHashedIDFromLocalID_(self, v7, (uint64_t)v13, v8, v9, v10, v11, v12);
  if (!v14) {
    goto LABEL_6;
  }
  uint64_t v21 = (void *)v14;
  uint64_t v22 = @"-";
  if (v6) {
    uint64_t v22 = v6;
  }
  char v23 = objc_msgSend_stringWithFormat_(NSString, v15, @"%@.%@", v16, v17, v18, v19, v20, v22, v14);

  if (!v23)
  {
LABEL_6:
    uint64_t v24 = BDSCloudKitLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_2361FA1B4();
    }

    char v23 = 0;
  }

  return v23;
}

- (void)p_unsubscribeToContainer:(id)a3
{
  v76[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_privateCloudDatabase(v4, v5, v6, v7, v8, v9, v10, v11);
  if (v12)
  {
    objc_initWeak(&location, self);
    id v13 = objc_alloc(MEMORY[0x263EFD750]);
    uint64_t v21 = objc_msgSend_subscriptionID(self, v14, v15, v16, v17, v18, v19, v20);
    v76[0] = v21;
    uint64_t v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v22, (uint64_t)v76, 1, v23, v24, v25, v26);
    uint64_t v33 = objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(v13, v28, 0, (uint64_t)v27, v29, v30, v31, v32);

    uint64_t v41 = objc_msgSend_bds_defaultConfiguration(MEMORY[0x263EFD778], v34, v35, v36, v37, v38, v39, v40);
    objc_msgSend_setContainer_(v41, v42, (uint64_t)v4, v43, v44, v45, v46, v47);
    objc_msgSend_setConfiguration_(v33, v48, (uint64_t)v41, v49, v50, v51, v52, v53);
    objc_msgSend_setDatabase_(v33, v54, (uint64_t)v12, v55, v56, v57, v58, v59);
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = sub_2360F2118;
    v72[3] = &unk_264CA1908;
    objc_copyWeak(&v74, &location);
    id v73 = v4;
    objc_msgSend_setModifySubscriptionsCompletionBlock_(v33, v60, (uint64_t)v72, v61, v62, v63, v64, v65);
    objc_msgSend_addOperation_(v12, v66, (uint64_t)v33, v67, v68, v69, v70, v71);

    objc_destroyWeak(&v74);
    objc_destroyWeak(&location);
  }
}

- (void)p_subscribeWithCompletion:(id)a3
{
  v163[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_accessQueue(self, v5, v6, v7, v8, v9, v10, v11);
  dispatch_assert_queue_V2(v12);

  id v13 = BDSCloudKitLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = objc_msgSend_containerIdentifier(self, v14, v15, v16, v17, v18, v19, v20);
    *(_DWORD *)buf = 138543362;
    v162 = v21;
    _os_log_impl(&dword_2360BC000, v13, OS_LOG_TYPE_INFO, "p_subscribeWithCompletion (%{public}@)", buf, 0xCu);
  }
  if ((objc_msgSend_hasSubscription(self, v22, v23, v24, v25, v26, v27, v28) & 1) != 0
    || (objc_msgSend_database(self, v29, v30, v31, v32, v33, v34, v35),
        uint64_t v36 = objc_claimAutoreleasedReturnValue(),
        BOOL v37 = v36 == 0,
        v36,
        v37))
  {
    v152 = _Block_copy(v4);
    v54 = v152;
    if (v152) {
      (*((void (**)(void *))v152 + 2))(v152);
    }
  }
  else
  {
    uint64_t v38 = BDSCloudKitLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2360BC000, v38, OS_LOG_TYPE_INFO, "Attempting CKModifySubscriptionsOperation", buf, 2u);
    }

    id v39 = objc_alloc(MEMORY[0x263EFD650]);
    uint64_t v47 = objc_msgSend_subscriptionID(self, v40, v41, v42, v43, v44, v45, v46);
    v54 = objc_msgSend_initWithSubscriptionID_(v39, v48, (uint64_t)v47, v49, v50, v51, v52, v53);

    id v55 = objc_alloc_init(MEMORY[0x263EFD768]);
    objc_msgSend_setShouldSendContentAvailable_(v55, v56, 1, v57, v58, v59, v60, v61);
    objc_msgSend_setNotificationInfo_(v54, v62, (uint64_t)v55, v63, v64, v65, v66, v67);
    objc_initWeak(&location, self);
    id v68 = objc_alloc(MEMORY[0x263EFD750]);
    v163[0] = v54;
    id v74 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v69, (uint64_t)v163, 1, v70, v71, v72, v73);
    id v80 = objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(v68, v75, (uint64_t)v74, 0, v76, v77, v78, v79);

    v88 = objc_msgSend_bds_defaultConfiguration(MEMORY[0x263EFD778], v81, v82, v83, v84, v85, v86, v87);
    v96 = objc_msgSend_container(self, v89, v90, v91, v92, v93, v94, v95);
    objc_msgSend_setContainer_(v88, v97, (uint64_t)v96, v98, v99, v100, v101, v102);

    objc_msgSend_setConfiguration_(v80, v103, (uint64_t)v88, v104, v105, v106, v107, v108);
    v116 = objc_msgSend_database(self, v109, v110, v111, v112, v113, v114, v115);
    objc_msgSend_setDatabase_(v80, v117, (uint64_t)v116, v118, v119, v120, v121, v122);

    uint64_t v153 = MEMORY[0x263EF8330];
    uint64_t v154 = 3221225472;
    v155 = sub_2360F26A4;
    v156 = &unk_264CA1930;
    objc_copyWeak(&v159, &location);
    v157 = self;
    id v158 = v4;
    objc_msgSend_setModifySubscriptionsCompletionBlock_(v80, v123, (uint64_t)&v153, v124, v125, v126, v127, v128);
    v129 = BDSCloudKitLog();
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
    {
      v137 = objc_msgSend_operationID(v80, v130, v131, v132, v133, v134, v135, v136, v153, v154, v155, v156, v157);
      sub_2361FA21C((uint64_t)v80, v137, buf, v129);
    }

    v145 = objc_msgSend_database(self, v138, v139, v140, v141, v142, v143, v144);
    objc_msgSend_addOperation_(v145, v146, (uint64_t)v80, v147, v148, v149, v150, v151);

    objc_destroyWeak(&v159);
    objc_destroyWeak(&location);
  }
}

- (void)p_fetchDatabaseChanges:(id)a3
{
  uint64_t v203 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_accessQueue(self, v5, v6, v7, v8, v9, v10, v11);
  dispatch_assert_queue_V2(v12);

  id v13 = BDSCloudKitLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = objc_msgSend_containerIdentifier(self, v14, v15, v16, v17, v18, v19, v20);
    uint64_t v29 = objc_msgSend_serverChangeToken(self, v22, v23, v24, v25, v26, v27, v28);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v29;
    _os_log_impl(&dword_2360BC000, v13, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@)- Adding fetch database changes, serverChangeToken: %{public}@", buf, 0x16u);
  }
  BOOL v37 = objc_msgSend_database(self, v30, v31, v32, v33, v34, v35, v36);
  if (v37)
  {
    id v38 = objc_alloc(MEMORY[0x263EFD698]);
    uint64_t v46 = objc_msgSend_serverChangeToken(self, v39, v40, v41, v42, v43, v44, v45);
    uint64_t v53 = (void (**)(void, void))objc_msgSend_initWithPreviousServerChangeToken_(v38, v47, (uint64_t)v46, v48, v49, v50, v51, v52);

    objc_msgSend_setFetchAllChanges_(v53, v54, 1, v55, v56, v57, v58, v59);
    uint64_t v67 = objc_msgSend_bds_defaultConfiguration(MEMORY[0x263EFD778], v60, v61, v62, v63, v64, v65, v66);
    v75 = objc_msgSend_container(self, v68, v69, v70, v71, v72, v73, v74);
    objc_msgSend_setContainer_(v67, v76, (uint64_t)v75, v77, v78, v79, v80, v81);

    objc_msgSend_setConfiguration_(v53, v82, (uint64_t)v67, v83, v84, v85, v86, v87);
    uint64_t v95 = objc_msgSend_database(self, v88, v89, v90, v91, v92, v93, v94);
    objc_msgSend_setDatabase_(v53, v96, (uint64_t)v95, v97, v98, v99, v100, v101);

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v200 = sub_2360F2F80;
    v201 = sub_2360F2F90;
    id v202 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    v194[0] = MEMORY[0x263EF8330];
    v194[1] = 3221225472;
    v194[2] = sub_2360F2F98;
    v194[3] = &unk_264CA1958;
    v194[4] = self;
    v194[5] = buf;
    objc_msgSend_setRecordZoneWithIDWasDeletedBlock_(v53, v102, (uint64_t)v194, v103, v104, v105, v106, v107);
    v193[0] = MEMORY[0x263EF8330];
    v193[1] = 3221225472;
    v193[2] = sub_2360F3138;
    v193[3] = &unk_264CA1958;
    v193[4] = self;
    v193[5] = buf;
    objc_msgSend_setRecordZoneWithIDWasPurgedBlock_(v53, v108, (uint64_t)v193, v109, v110, v111, v112, v113);
    v192[0] = MEMORY[0x263EF8330];
    v192[1] = 3221225472;
    v192[2] = sub_2360F32D8;
    v192[3] = &unk_264CA1958;
    v192[4] = self;
    v192[5] = buf;
    objc_msgSend_setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_(v53, v114, (uint64_t)v192, v115, v116, v117, v118, v119);
    v191[0] = MEMORY[0x263EF8330];
    v191[1] = 3221225472;
    v191[2] = sub_2360F3478;
    v191[3] = &unk_264CA1980;
    v191[4] = self;
    objc_msgSend_setChangeTokenUpdatedBlock_(v53, v120, (uint64_t)v191, v121, v122, v123, v124, v125);
    uint64_t v126 = (void *)MEMORY[0x263EFFA08];
    uint64_t v134 = objc_msgSend_configuration(self, v127, v128, v129, v130, v131, v132, v133);
    uint64_t v142 = objc_msgSend_appZones(v134, v135, v136, v137, v138, v139, v140, v141);
    uint64_t v149 = objc_msgSend_setWithArray_(v126, v143, (uint64_t)v142, v144, v145, v146, v147, v148);

    v189[0] = MEMORY[0x263EF8330];
    v189[1] = 3221225472;
    v189[2] = sub_2360F3658;
    v189[3] = &unk_264CA19A8;
    v189[4] = self;
    id v150 = v149;
    id v190 = v150;
    objc_msgSend_setRecordZoneWithIDChangedBlock_(v53, v151, (uint64_t)v189, v152, v153, v154, v155, v156);
    uint64_t v182 = MEMORY[0x263EF8330];
    uint64_t v183 = 3221225472;
    v184 = sub_2360F3890;
    v185 = &unk_264CA19F8;
    v188 = buf;
    v186 = self;
    id v187 = v4;
    objc_msgSend_setFetchDatabaseChangesCompletionBlock_(v53, v157, (uint64_t)&v182, v158, v159, v160, v161, v162);
    v163 = BDSCloudKitLog();
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
    {
      v171 = objc_msgSend_containerIdentifier(self, v164, v165, v166, v167, v168, v169, v170, v182, v183, v184, v185, v186);
      *(_DWORD *)v195 = 138543618;
      v196 = v171;
      __int16 v197 = 2112;
      v198 = v53;
      _os_log_impl(&dword_2360BC000, v163, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@)- Adding fetch database changes %@", v195, 0x16u);
    }
    objc_msgSend_addOperation_(v37, v172, (uint64_t)v53, v173, v174, v175, v176, v177);

    _Block_object_dispose(buf, 8);
    goto LABEL_9;
  }
  uint64_t v53 = (void (**)(void, void))_Block_copy(v4);
  if (v53)
  {
    uint64_t v67 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v178, @"BDSErrorDomain", 1004, 0, v179, v180, v181);
    ((void (**)(void, void *))v53)[2](v53, v67);
LABEL_9:
  }
}

- (void)p_createRecordZones:(id)a3 completionHandler:(id)a4
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_accessQueue(self, v8, v9, v10, v11, v12, v13, v14);
  dispatch_assert_queue_V2(v15);

  uint64_t v23 = objc_msgSend_database(self, v16, v17, v18, v19, v20, v21, v22);
  uint64_t v24 = BDSCloudKitLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = objc_msgSend_containerIdentifier(self, v25, v26, v27, v28, v29, v30, v31);
    uint64_t v33 = (objc_class *)MEMORY[0x263EFF980];
    id v34 = v6;
    id v35 = objc_alloc_init(v33);
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_2360FCDF8;
    uint64_t v129 = &unk_264CA1ED0;
    id v130 = v35;
    id v36 = v35;
    objc_msgSend_enumerateObjectsUsingBlock_(v34, v37, (uint64_t)buf, v38, v39, v40, v41, v42);
    uint64_t v49 = objc_msgSend_componentsJoinedByString_(v36, v43, @",", v44, v45, v46, v47, v48);

    uint64_t v57 = objc_msgSend_database(self, v50, v51, v52, v53, v54, v55, v56);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v32;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v49;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v129 = v57;
    _os_log_impl(&dword_2360BC000, v24, OS_LOG_TYPE_DEFAULT, "[BCCloudKitDatabaseController (%@)] 2. p_createRecordZones:%@ database:%{public}@", buf, 0x20u);
  }
  if (objc_msgSend_count(v6, v58, v59, v60, v61, v62, v63, v64) && v23)
  {
    id v65 = objc_alloc(MEMORY[0x263EFD6D0]);
    uint64_t v72 = objc_msgSend_initWithRecordZoneIDs_(v65, v66, (uint64_t)v6, v67, v68, v69, v70, v71);
    uint64_t v80 = objc_msgSend_bds_defaultConfiguration(MEMORY[0x263EFD778], v73, v74, v75, v76, v77, v78, v79);
    v88 = objc_msgSend_container(self, v81, v82, v83, v84, v85, v86, v87);
    objc_msgSend_setContainer_(v80, v89, (uint64_t)v88, v90, v91, v92, v93, v94);
    objc_msgSend_setConfiguration_(v72, v95, (uint64_t)v80, v96, v97, v98, v99, v100);
    objc_msgSend_setDatabase_(v72, v101, (uint64_t)v23, v102, v103, v104, v105, v106);
    objc_initWeak((id *)buf, self);
    v122[0] = MEMORY[0x263EF8330];
    v122[1] = 3221225472;
    v122[2] = sub_2360F40B8;
    v122[3] = &unk_264CA1B10;
    objc_copyWeak(&v127, (id *)buf);
    id v126 = v7;
    id v123 = v6;
    id v107 = v88;
    id v124 = v107;
    id v108 = v23;
    id v125 = v108;
    objc_msgSend_setFetchRecordZonesCompletionBlock_(v72, v109, (uint64_t)v122, v110, v111, v112, v113, v114);
    objc_msgSend_addOperation_(v108, v115, (uint64_t)v72, v116, v117, v118, v119, v120);

    objc_destroyWeak(&v127);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v121 = _Block_copy(v7);
    uint64_t v72 = v121;
    if (v121) {
      (*((void (**)(void *, void))v121 + 2))(v121, 0);
    }
  }
}

- (void)p_createRecordIDSaltWithCompletion:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_accessQueue(self, v5, v6, v7, v8, v9, v10, v11);
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = BDSCloudKitLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = objc_msgSend_containerIdentifier(self, v14, v15, v16, v17, v18, v19, v20);
    uint64_t v29 = objc_msgSend_database(self, v22, v23, v24, v25, v26, v27, v28);
    *(_DWORD *)buf = 138543618;
    uint64_t v56 = v21;
    __int16 v57 = 2114;
    uint64_t v58 = v29;
    _os_log_impl(&dword_2360BC000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) Establishing record salt, database:%{public}@", buf, 0x16u);
  }
  id v30 = objc_alloc(MEMORY[0x263EFD7E8]);
  BOOL v37 = objc_msgSend_initWithRecordName_(v30, v31, @"recordIDSalt", v32, v33, v34, v35, v36);
  objc_initWeak((id *)buf, self);
  uint64_t v45 = objc_msgSend_database(self, v38, v39, v40, v41, v42, v43, v44);
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = sub_2360F5870;
  v52[3] = &unk_264CA1B60;
  objc_copyWeak(&v54, (id *)buf);
  v52[4] = self;
  id v46 = v4;
  id v53 = v46;
  objc_msgSend_fetchRecordWithID_completionHandler_(v45, v47, (uint64_t)v37, (uint64_t)v52, v48, v49, v50, v51);

  objc_destroyWeak(&v54);
  objc_destroyWeak((id *)buf);
}

- (void)p_fetchZoneChanges:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v12 = objc_msgSend_accessQueue(self, v5, v6, v7, v8, v9, v10, v11);
  dispatch_assert_queue_V2(v12);

  if (objc_msgSend_serverFetchPostponed(self, v13, v14, v15, v16, v17, v18, v19))
  {
    uint64_t v27 = BDSCloudKitLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2360BC000, v27, OS_LOG_TYPE_DEFAULT, "fetch zone changes attempted while postponing such fetches.  Nil error, but this operation will be attempted again after the back-off period.", buf, 2u);
    }

    v4[2](v4, 0);
  }
  else
  {
    uint64_t v28 = objc_msgSend_array(MEMORY[0x263EFF980], v20, v21, v22, v23, v24, v25, v26);
    uint64_t v36 = objc_msgSend_array(MEMORY[0x263EFF980], v29, v30, v31, v32, v33, v34, v35);
    uint64_t v44 = objc_msgSend_tokenStores(self, v37, v38, v39, v40, v41, v42, v43);
    uint64_t v52 = objc_msgSend_allKeys(v44, v45, v46, v47, v48, v49, v50, v51);
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = sub_2360F67B0;
    v78[3] = &unk_264CA1B88;
    void v78[4] = self;
    id v79 = v28;
    id v53 = v36;
    id v80 = v53;
    id v54 = v28;
    objc_msgSend_enumerateObjectsUsingBlock_(v52, v55, (uint64_t)v78, v56, v57, v58, v59, v60);

    uint64_t v68 = objc_msgSend_copy(v54, v61, v62, v63, v64, v65, v66, v67);
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = sub_2360F68A8;
    v75[3] = &unk_264CA1840;
    v75[4] = self;
    id v76 = v53;
    uint64_t v77 = v4;
    id v69 = v53;
    objc_msgSend_p_fetchRecordZoneChangesForRecordZoneIDs_completionHandler_(self, v70, (uint64_t)v68, (uint64_t)v75, v71, v72, v73, v74);
  }
}

- (void)p_fetchRecordZoneChangesForRecordZoneIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_accessQueue(self, v8, v9, v10, v11, v12, v13, v14);
  dispatch_assert_queue_V2(v15);

  uint64_t v23 = objc_msgSend_count(v6, v16, v17, v18, v19, v20, v21, v22);
  uint64_t v24 = BDSCloudKitLog();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v25)
    {
      uint64_t v33 = objc_msgSend_containerIdentifier(self, v26, v27, v28, v29, v30, v31, v32);
      *(_DWORD *)buf = 138543618;
      uint64_t v91 = v33;
      __int16 v92 = 2114;
      id v93 = v6;
      _os_log_impl(&dword_2360BC000, v24, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@)- fetching record zone changes for recordZoneIDs:%{public}@", buf, 0x16u);
    }
    uint64_t v41 = objc_msgSend_recordZones(self, v34, v35, v36, v37, v38, v39, v40);
    uint64_t v49 = objc_msgSend_desiredRecordZoneIDs(self, v42, v43, v44, v45, v46, v47, v48);
    v87[0] = MEMORY[0x263EF8330];
    v87[1] = 3221225472;
    v87[2] = sub_2360F6DE0;
    v87[3] = &unk_264CA1BB0;
    id v88 = v41;
    id v89 = v49;
    id v50 = v49;
    id v51 = v41;
    objc_msgSend_enumerateObjectsUsingBlock_(v6, v52, (uint64_t)v87, v53, v54, v55, v56, v57);
    uint64_t v58 = objc_opt_new();
    dispatch_group_t v59 = dispatch_group_create();
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 3221225472;
    v84[2] = sub_2360F6E9C;
    v84[3] = &unk_264CA1B88;
    v84[4] = self;
    dispatch_group_t v85 = v59;
    id v60 = v58;
    id v86 = v60;
    uint64_t v61 = v59;
    objc_msgSend_enumerateObjectsUsingBlock_(v6, v62, (uint64_t)v84, v63, v64, v65, v66, v67);
    uint64_t v75 = objc_msgSend_accessQueue(self, v68, v69, v70, v71, v72, v73, v74);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2360F711C;
    block[3] = &unk_264CA1100;
    id v80 = v60;
    uint64_t v81 = self;
    id v82 = v6;
    id v83 = v7;
    id v76 = v60;
    dispatch_group_notify(v61, v75, block);
  }
  else
  {
    if (v25)
    {
      uint64_t v77 = objc_msgSend_containerIdentifier(self, v26, v27, v28, v29, v30, v31, v32);
      *(_DWORD *)buf = 138543362;
      uint64_t v91 = v77;
      _os_log_impl(&dword_2360BC000, v24, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@)- No record zone changes to fetch", buf, 0xCu);
    }
    self->_fetchRecordZoneChangesSuccess = 1;
    uint64_t v78 = _Block_copy(v7);
    id v51 = v78;
    if (v78) {
      (*((void (**)(void *, void))v78 + 2))(v78, 0);
    }
  }
}

- (void)p_updateRetryParametersFromFetchZoneChangesOperationError:(id)a3
{
  id v69 = a3;
  uint64_t v11 = objc_msgSend_accessQueue(self, v4, v5, v6, v7, v8, v9, v10);
  dispatch_assert_queue_V2(v11);

  uint64_t v19 = objc_msgSend_domain(v69, v12, v13, v14, v15, v16, v17, v18);
  int isEqualToString = objc_msgSend_isEqualToString_(v19, v20, *MEMORY[0x263EFD498], v21, v22, v23, v24, v25);

  double v34 = 5.0;
  if (!isEqualToString) {
    goto LABEL_7;
  }
  objc_opt_class();
  uint64_t v42 = objc_msgSend_userInfo(v69, v35, v36, v37, v38, v39, v40, v41);
  uint64_t v49 = objc_msgSend_objectForKeyedSubscript_(v42, v43, *MEMORY[0x263EFD4A0], v44, v45, v46, v47, v48);
  id v50 = BUDynamicCast();
  objc_msgSend_doubleValue(v50, v51, v52, v53, v54, v55, v56, v57);
  double v34 = v58;

  if (v34 > 0.0)
  {
LABEL_7:
    objc_msgSend_setBackOffInterval_(self, v27, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_8;
  }
  unint64_t v59 = objc_msgSend_code(v69, v27, v28, v29, v30, v31, v32, v33);
  if (v59 <= 0x17 && ((1 << v59) & 0x8000C0) != 0)
  {
    objc_msgSend_backOffInterval(self, v60, v61, v62, v63, v64, v65, v66);
    double v34 = 5.0;
    if (v67 >= 5.0)
    {
      objc_msgSend_backOffInterval(self, v27, v28, v29, v30, v31, v32, v33);
      double v34 = v68 + v68;
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (void)p_fetchRecordZoneChanges:(id)a3 optionsByRecordZoneID:(id)a4 completionHandler:(id)a5
{
  uint64_t v212 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v10 = a5;
  uint64_t v11 = BDSCloudKitLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = objc_msgSend_containerIdentifier(self, v12, v13, v14, v15, v16, v17, v18);
    uint64_t v20 = (objc_class *)MEMORY[0x263EFF980];
    id v21 = v8;
    id v22 = objc_alloc_init(v20);
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = sub_2360FCDF8;
    v210 = (uint64_t (*)(uint64_t, uint64_t))&unk_264CA1ED0;
    *(void *)&long long v211 = v22;
    id v23 = v22;
    objc_msgSend_enumerateObjectsUsingBlock_(v21, v24, (uint64_t)buf, v25, v26, v27, v28, v29);
    uint64_t v36 = objc_msgSend_componentsJoinedByString_(v23, v30, @",", v31, v32, v33, v34, v35);

    uint64_t v44 = objc_msgSend_database(self, v37, v38, v39, v40, v41, v42, v43);
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v36;
    *(_WORD *)&buf[22] = 2114;
    v210 = v9;
    LOWORD(v211) = 2048;
    *(void *)((char *)&v211 + 2) = v44;
    _os_log_impl(&dword_2360BC000, v11, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@) p_fetchRecordZoneChanges recordZoneIDs:%{public}@, optionsByRecordZoneID:%{public}@ self.database=%p", buf, 0x2Au);
  }
  uint64_t v52 = objc_msgSend_database(self, v45, v46, v47, v48, v49, v50, v51);
  if (v52)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v210 = sub_2360F2F80;
    *(void *)&long long v211 = sub_2360F2F90;
    *((void *)&v211 + 1) = objc_opt_new();
    v203[0] = 0;
    v203[1] = v203;
    v203[2] = 0x3032000000;
    v203[3] = sub_2360F2F80;
    v203[4] = sub_2360F2F90;
    id v204 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    id v53 = objc_alloc(MEMORY[0x263EFD6B8]);
    unint64_t v59 = objc_msgSend_initWithRecordZoneIDs_configurationsByRecordZoneID_(v53, v54, (uint64_t)v8, (uint64_t)v9, v55, v56, v57, v58);
    objc_msgSend_setFetchAllChanges_(v59, v60, 1, v61, v62, v63, v64, v65);
    uint64_t v73 = objc_msgSend_bds_defaultConfiguration(MEMORY[0x263EFD778], v66, v67, v68, v69, v70, v71, v72);
    uint64_t v81 = objc_msgSend_container(self, v74, v75, v76, v77, v78, v79, v80);
    objc_msgSend_setContainer_(v73, v82, (uint64_t)v81, v83, v84, v85, v86, v87);

    objc_msgSend_setQualityOfService_(v73, v88, 17, v89, v90, v91, v92, v93);
    objc_msgSend_setDiscretionaryNetworkBehavior_(v73, v94, 0, v95, v96, v97, v98, v99);
    objc_msgSend_setAutomaticallyRetryNetworkFailures_(v73, v100, 0, v101, v102, v103, v104, v105);
    objc_msgSend_setConfiguration_(v59, v106, (uint64_t)v73, v107, v108, v109, v110, v111);
    uint64_t v119 = objc_msgSend_database(self, v112, v113, v114, v115, v116, v117, v118);
    objc_msgSend_setDatabase_(v59, v120, (uint64_t)v119, v121, v122, v123, v124, v125);

    objc_initWeak(&location, self);
    v201[0] = MEMORY[0x263EF8330];
    v201[1] = 3221225472;
    v201[2] = sub_2360F7BEC;
    v201[3] = &unk_264CA1C28;
    v201[4] = self;
    v201[5] = buf;
    objc_msgSend_setRecordChangedBlock_(v59, v126, (uint64_t)v201, v127, v128, v129, v130, v131);
    v200[0] = MEMORY[0x263EF8330];
    v200[1] = 3221225472;
    v200[2] = sub_2360F7E4C;
    v200[3] = &unk_264CA1C50;
    v200[4] = self;
    objc_msgSend_setRecordWithIDWasDeletedBlock_(v59, v132, (uint64_t)v200, v133, v134, v135, v136, v137);
    v197[0] = MEMORY[0x263EF8330];
    v197[1] = 3221225472;
    v197[2] = sub_2360F80AC;
    v197[3] = &unk_264CA1CA0;
    v197[4] = self;
    id v138 = v8;
    id v198 = v138;
    v199 = buf;
    objc_msgSend_setRecordZoneChangeTokensUpdatedBlock_(v59, v139, (uint64_t)v197, v140, v141, v142, v143, v144);
    v193[0] = MEMORY[0x263EF8330];
    v193[1] = 3221225472;
    v193[2] = sub_2360F8370;
    v193[3] = &unk_264CA1CF0;
    v193[4] = self;
    id v145 = v138;
    id v194 = v145;
    v195 = v203;
    v196 = buf;
    objc_msgSend_setRecordZoneFetchCompletionBlock_(v59, v146, (uint64_t)v193, v147, v148, v149, v150, v151);
    v187[0] = MEMORY[0x263EF8330];
    v187[1] = 3221225472;
    v187[2] = sub_2360F8AC0;
    v187[3] = &unk_264CA1D90;
    v187[4] = self;
    objc_copyWeak(&v192, &location);
    id v190 = v203;
    id v188 = v145;
    v191 = buf;
    id v189 = v10;
    objc_msgSend_setFetchRecordZoneChangesCompletionBlock_(v59, v152, (uint64_t)v187, v153, v154, v155, v156, v157);
    uint64_t v158 = BDSCloudKitLog();
    if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v166 = objc_msgSend_containerIdentifier(self, v159, v160, v161, v162, v163, v164, v165);
      *(_DWORD *)v205 = 138543618;
      v206 = v166;
      __int16 v207 = 2112;
      v208 = v59;
      _os_log_impl(&dword_2360BC000, v158, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@) p_fetchRecordZoneChanges Adding fetchRecordZoneChangesOperation=%@", v205, 0x16u);
    }
    uint64_t v174 = objc_msgSend_database(self, v167, v168, v169, v170, v171, v172, v173);
    objc_msgSend_addOperation_(v174, v175, (uint64_t)v59, v176, v177, v178, v179, v180);

    objc_destroyWeak(&v192);
    objc_destroyWeak(&location);

    _Block_object_dispose(v203, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v185 = (void (**)(void *, void *))_Block_copy(v10);
    if (v185)
    {
      v186 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v181, @"BDSErrorDomain", 1004, 0, v182, v183, v184);
      v185[2](v185, v186);
    }
  }
}

- (void)p_internetReachabilityChanged:(id)a3
{
  uint64_t v9 = objc_msgSend_accessQueue(self, a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360F9558;
  block[3] = &unk_264CA1428;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)p_informObserversOfAttachmentChange
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  uint64_t v3 = BDSCloudKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = objc_msgSend_containerIdentifier(self, v4, v5, v6, v7, v8, v9, v10);
    int v19 = objc_msgSend_attachedToContainer(self, v12, v13, v14, v15, v16, v17, v18);
    uint64_t v20 = @"NO";
    if (v19) {
      uint64_t v20 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v102 = v11;
    __int16 v103 = 2112;
    uint64_t v104 = v20;
    _os_log_impl(&dword_2360BC000, v3, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - p_informObserversOfAttachmentChange. Attached to container: %@", buf, 0x16u);
  }
  uint64_t v28 = objc_msgSend_accessQueue(self, v21, v22, v23, v24, v25, v26, v27);
  dispatch_assert_queue_V2(v28);

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  objc_msgSend_observers(self, v29, v30, v31, v32, v33, v34, v35);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v95, (uint64_t)v100, 16, v37, v38, v39);
  if (v40)
  {
    uint64_t v48 = v40;
    uint64_t v49 = *(void *)v96;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v96 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = *(void *)(*((void *)&v95 + 1) + 8 * v50);
        uint64_t v52 = objc_msgSend_observers(self, v41, v42, v43, v44, v45, v46, v47);
        unint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v52, v53, v51, v54, v55, v56, v57, v58);

        if (objc_msgSend_count(v59, v60, v61, v62, v63, v64, v65, v66))
        {
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          id v67 = v59;
          uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v91, (uint64_t)v99, 16, v69, v70, v71);
          if (v72)
          {
            uint64_t v80 = v72;
            uint64_t v81 = *(void *)v92;
            do
            {
              uint64_t v82 = 0;
              do
              {
                if (*(void *)v92 != v81) {
                  objc_enumerationMutation(v67);
                }
                uint64_t v83 = *(void **)(*((void *)&v91 + 1) + 8 * v82);
                uint64_t v84 = objc_msgSend_attachedToContainer(self, v73, v74, v75, v76, v77, v78, v79);
                objc_msgSend_databaseController_attachmentChanged_(v83, v85, (uint64_t)self, v84, v86, v87, v88, v89);
                ++v82;
              }
              while (v80 != v82);
              uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v73, (uint64_t)&v91, (uint64_t)v99, 16, v77, v78, v79);
            }
            while (v80);
          }
        }
        ++v50;
      }
      while (v50 != v48);
      uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v95, (uint64_t)v100, 16, v45, v46, v47);
    }
    while (v48);
  }
}

- (void)p_informObserversOfRecordsChanged:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = BDSCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = objc_msgSend_containerIdentifier(self, v6, v7, v8, v9, v10, v11, v12);
    *(_DWORD *)buf = 138543362;
    uint64_t v37 = v13;
    _os_log_impl(&dword_2360BC000, v5, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - p_informObserversOfRecordsChanged.", buf, 0xCu);
  }
  id v21 = objc_msgSend_accessQueue(self, v14, v15, v16, v17, v18, v19, v20);
  dispatch_assert_queue_V2(v21);

  if (objc_msgSend_count(v4, v22, v23, v24, v25, v26, v27, v28))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2360F9B84;
    v35[3] = &unk_264CA1DB8;
    v35[4] = self;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v29, (uint64_t)v35, v30, v31, v32, v33, v34);
  }
}

- (void)p_informObserversOfSaltVersionIdentifierChanged:(id)a3 forZones:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2360F9D6C;
  v15[3] = &unk_264CA1100;
  p_zoneObserversLock = &self->_zoneObserversLock;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  os_unfair_lock_lock(p_zoneObserversLock);
  sub_2360F9D6C((void **)v15);
  os_unfair_lock_unlock(p_zoneObserversLock);
}

- (void)p_informObserversOfRecordsChanged:(id)a3 forRecordType:(id)a4
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_accessQueue(self, v8, v9, v10, v11, v12, v13, v14);
  dispatch_assert_queue_V2(v15);

  id v16 = BDSCloudKitLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = objc_msgSend_containerIdentifier(self, v17, v18, v19, v20, v21, v22, v23);
    *(_DWORD *)buf = 138543874;
    long long v94 = v24;
    __int16 v95 = 2050;
    uint64_t v96 = objc_msgSend_count(v6, v25, v26, v27, v28, v29, v30, v31);
    __int16 v97 = 2114;
    id v98 = v7;
    _os_log_impl(&dword_2360BC000, v16, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@) - p_informObserversOfRecordsChanged: changedRecords.count=%{public}lu recordType=%{public}@", buf, 0x20u);
  }
  if (objc_msgSend_count(v6, v32, v33, v34, v35, v36, v37, v38))
  {
    uint64_t v46 = objc_msgSend_observers(self, v39, v40, v41, v42, v43, v44, v45);
    id v53 = objc_msgSend_objectForKeyedSubscript_(v46, v47, (uint64_t)v7, v48, v49, v50, v51, v52);

    if (objc_msgSend_count(v53, v54, v55, v56, v57, v58, v59, v60))
    {
      id v87 = v7;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v61 = v53;
      uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v62, (uint64_t)&v88, (uint64_t)v92, 16, v63, v64, v65);
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v89;
        do
        {
          uint64_t v69 = 0;
          do
          {
            if (*(void *)v89 != v68) {
              objc_enumerationMutation(v61);
            }
            uint64_t v70 = *(void **)(*((void *)&v88 + 1) + 8 * v69);
            id v71 = objc_alloc(MEMORY[0x263EFF8C0]);
            uint64_t v77 = objc_msgSend_initWithArray_copyItems_(v71, v72, (uint64_t)v6, 1, v73, v74, v75, v76);
            objc_msgSend_databaseController_recordsChanged_(v70, v78, (uint64_t)self, (uint64_t)v77, v79, v80, v81, v82);

            ++v69;
          }
          while (v67 != v69);
          uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v83, (uint64_t)&v88, (uint64_t)v92, 16, v84, v85, v86);
        }
        while (v67);
      }

      id v7 = v87;
    }
  }
}

- (void)p_informObserversOfCompletedFetchOfZone:(id)a3
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_accessQueue(self, v5, v6, v7, v8, v9, v10, v11);
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = BDSCloudKitLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = objc_msgSend_containerIdentifier(self, v14, v15, v16, v17, v18, v19, v20);
    *(_DWORD *)buf = 138543618;
    uint64_t v86 = v21;
    __int16 v87 = 2114;
    id v88 = v4;
    _os_log_impl(&dword_2360BC000, v13, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - p_informObserversOfCompletedFetchOfZone zoneName=%{public}@", buf, 0x16u);
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  objc_msgSend_observers(self, v22, v23, v24, v25, v26, v27, v28);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v79, (uint64_t)v84, 16, v30, v31, v32);
  if (v33)
  {
    uint64_t v41 = v33;
    uint64_t v42 = *(void *)v80;
    do
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v80 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = *(void *)(*((void *)&v79 + 1) + 8 * v43);
        uint64_t v45 = objc_msgSend_observers(self, v34, v35, v36, v37, v38, v39, v40);
        uint64_t v52 = objc_msgSend_objectForKeyedSubscript_(v45, v46, v44, v47, v48, v49, v50, v51);

        if (objc_msgSend_count(v52, v53, v54, v55, v56, v57, v58, v59))
        {
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v60 = v52;
          uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v75, (uint64_t)v83, 16, v62, v63, v64);
          if (v65)
          {
            uint64_t v71 = v65;
            uint64_t v72 = *(void *)v76;
            do
            {
              uint64_t v73 = 0;
              do
              {
                if (*(void *)v76 != v72) {
                  objc_enumerationMutation(v60);
                }
                objc_msgSend_databaseController_fetchedAllRecordsInZone_(*(void **)(*((void *)&v75 + 1) + 8 * v73++), v66, (uint64_t)self, (uint64_t)v4, v67, v68, v69, v70);
              }
              while (v71 != v73);
              uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v66, (uint64_t)&v75, (uint64_t)v83, 16, v68, v69, v70);
            }
            while (v71);
          }
        }
        ++v43;
      }
      while (v43 != v41);
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v79, (uint64_t)v84, 16, v38, v39, v40);
    }
    while (v41);
  }
}

- (void)p_scheduleArchiveWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_accessQueue(self, v5, v6, v7, v8, v9, v10, v11);
  dispatch_assert_queue_V2(v12);

  objc_msgSend_coalescedArchive(self, v13, v14, v15, v16, v17, v18, v19);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalWithCompletion_(v26, v20, (uint64_t)v4, v21, v22, v23, v24, v25);
}

- (void)p_unarchive
{
  uint64_t v9 = objc_msgSend_accessQueue(self, a2, v2, v3, v4, v5, v6, v7);
  dispatch_assert_queue_V2(v9);

  objc_msgSend_archiveURL(self, v10, v11, v12, v13, v14, v15, v16);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    id v17 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v24 = objc_msgSend_initWithContentsOfURL_(v17, v18, (uint64_t)v33, v19, v20, v21, v22, v23);
    if (v24)
    {
      uint64_t v31 = (void *)v24;
      id v32 = (id)objc_msgSend_p_unarchiveFromData_(self, v25, v24, v26, v27, v28, v29, v30);
    }
  }
}

- (id)p_archiveToData
{
  uint64_t v9 = objc_msgSend_accessQueue(self, a2, v2, v3, v4, v5, v6, v7);
  dispatch_assert_queue_V2(v9);

  id v10 = objc_alloc(MEMORY[0x263F08910]);
  inited = objc_msgSend_initRequiringSecureCoding_(v10, v11, 1, v12, v13, v14, v15, v16);
  if (inited)
  {
    if (objc_msgSend_hasSubscription(self, v17, v18, v19, v20, v21, v22, v23)) {
      objc_msgSend_encodeInteger_forKey_(inited, v25, 1, @"hasUpdatedSubscription", v28, v29, v30, v31);
    }
    uint64_t v37 = objc_msgSend_serverChangeToken(self, v25, v26, v27, v28, v29, v30, v31);
    if (v37) {
      objc_msgSend_encodeObject_forKey_(inited, v32, (uint64_t)v37, @"serverChangeToken", v33, v34, v35, v36);
    }

    uint64_t v45 = objc_msgSend_changedRecordZoneIDs(self, v38, v39, v40, v41, v42, v43, v44);
    uint64_t v53 = objc_msgSend_count(v45, v46, v47, v48, v49, v50, v51, v52);

    if (v53)
    {
      id v61 = objc_msgSend_changedRecordZoneIDs(self, v54, v55, v56, v57, v58, v59, v60);
      objc_msgSend_encodeObject_forKey_(inited, v62, (uint64_t)v61, @"changedRecordZoneIDs", v63, v64, v65, v66);
    }
    uint64_t v67 = objc_msgSend_containerIdentifier(self, v54, v55, v56, v57, v58, v59, v60);
    uint64_t v75 = objc_msgSend_length(v67, v68, v69, v70, v71, v72, v73, v74);

    if (v75)
    {
      uint64_t v83 = objc_msgSend_containerIdentifier(self, v76, v77, v78, v79, v80, v81, v82);
      objc_msgSend_encodeObject_forKey_(inited, v84, (uint64_t)v83, @"containerIdentifier", v85, v86, v87, v88);
    }
    uint64_t v89 = objc_msgSend_userRecordID(self, v76, v77, v78, v79, v80, v81, v82);

    if (v89)
    {
      __int16 v97 = objc_msgSend_userRecordID(self, v90, v91, v92, v93, v94, v95, v96);
      objc_msgSend_encodeObject_forKey_(inited, v98, (uint64_t)v97, @"userRecordID", v99, v100, v101, v102);
    }
    objc_msgSend_finishEncoding(inited, v90, v91, v92, v93, v94, v95, v96);
    uint64_t v110 = objc_msgSend_encodedData(inited, v103, v104, v105, v106, v107, v108, v109);
  }
  else
  {
    uint64_t v110 = 0;
  }

  return v110;
}

- (id)p_unarchiveFromData:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_accessQueue(self, v5, v6, v7, v8, v9, v10, v11);
  dispatch_assert_queue_V2(v12);

  if (v4)
  {
    id v13 = objc_alloc(MEMORY[0x263F08928]);
    id v110 = 0;
    uint64_t v19 = objc_msgSend_initForReadingFromData_error_(v13, v14, (uint64_t)v4, (uint64_t)&v110, v15, v16, v17, v18);
    id v26 = v110;
    if (v26)
    {
      uint64_t v27 = BDSCloudKitLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_2361FA55C();
      }
    }
    else
    {
      BOOL v28 = objc_msgSend_decodeIntegerForKey_(v19, v20, @"hasUpdatedSubscription", v21, v22, v23, v24, v25) == 1;
      objc_msgSend_setHasSubscription_(self, v29, v28, v30, v31, v32, v33, v34);
      uint64_t v35 = objc_opt_class();
      uint64_t v41 = objc_msgSend_decodeObjectOfClass_forKey_(v19, v36, v35, @"serverChangeToken", v37, v38, v39, v40);
      objc_msgSend_setServerChangeToken_(self, v42, (uint64_t)v41, v43, v44, v45, v46, v47);

      uint64_t v48 = (void *)MEMORY[0x263EFFA08];
      uint64_t v49 = objc_opt_class();
      uint64_t v50 = objc_opt_class();
      uint64_t v57 = objc_msgSend_setWithObjects_(v48, v51, v49, v52, v53, v54, v55, v56, v50, 0);
      uint64_t v27 = objc_msgSend_decodeObjectOfClasses_forKey_(v19, v58, (uint64_t)v57, @"changedRecordZoneIDs", v59, v60, v61, v62);

      if (v27)
      {
        objc_msgSend_setChangedRecordZoneIDs_(self, v63, (uint64_t)v27, v64, v65, v66, v67, v68);
      }
      else
      {
        uint64_t v69 = objc_opt_new();
        objc_msgSend_setChangedRecordZoneIDs_(self, v70, (uint64_t)v69, v71, v72, v73, v74, v75);
      }
      uint64_t v76 = objc_opt_class();
      uint64_t v82 = objc_msgSend_decodeObjectOfClass_forKey_(v19, v77, v76, @"containerIdentifier", v78, v79, v80, v81);
      objc_msgSend_setContainerIdentifier_(self, v83, (uint64_t)v82, v84, v85, v86, v87, v88);

      uint64_t v89 = objc_opt_class();
      uint64_t v95 = objc_msgSend_decodeObjectOfClass_forKey_(v19, v90, v89, @"userRecordID", v91, v92, v93, v94);
      objc_msgSend_setUserRecordID_(self, v96, (uint64_t)v95, v97, v98, v99, v100, v101);

      objc_msgSend_finishDecoding(v19, v102, v103, v104, v105, v106, v107, v108);
    }
  }
  return 0;
}

+ (id)encodeRecordSystemFields:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F08910];
  id v4 = a3;
  id v5 = [v3 alloc];
  inited = objc_msgSend_initRequiringSecureCoding_(v5, v6, 1, v7, v8, v9, v10, v11);
  objc_msgSend_encodeSystemFieldsWithCoder_(v4, v13, (uint64_t)inited, v14, v15, v16, v17, v18);

  objc_msgSend_finishEncoding(inited, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v33 = objc_msgSend_encodedData(inited, v26, v27, v28, v29, v30, v31, v32);

  return v33;
}

+ (id)decodeRecordFromSystemFields:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F08928];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v30 = 0;
  uint64_t v11 = objc_msgSend_initForReadingFromData_error_(v5, v6, (uint64_t)v4, (uint64_t)&v30, v7, v8, v9, v10);

  id v12 = v30;
  if (v12)
  {
    id v13 = BDSCloudKitLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_2361FA55C();
    }

    uint64_t v14 = 0;
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x263EFD7C8]);
    uint64_t v14 = objc_msgSend_initWithCoder_(v15, v16, (uint64_t)v11, v17, v18, v19, v20, v21);
    objc_msgSend_finishDecoding(v11, v22, v23, v24, v25, v26, v27, v28);
  }

  return v14;
}

+ (void)startInternetConnectionReachabilityNotifier
{
  objc_msgSend_sharedReachabilityForInternetConnection(BDSReachability, a2, v2, v3, v4, v5, v6, v7);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startNotifier(v15, v8, v9, v10, v11, v12, v13, v14);
}

- (void)_deleteRecordZonesWithIDs:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v17 = objc_msgSend_accessQueue(self, v10, v11, v12, v13, v14, v15, v16);
  dispatch_assert_queue_V2(v17);

  uint64_t v18 = BDSCloudKitLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v64 = v8;
    _os_log_impl(&dword_2360BC000, v18, OS_LOG_TYPE_INFO, "Deleting zone: (%{public}@)", buf, 0xCu);
  }

  if (self->_container)
  {
    id v19 = objc_alloc(MEMORY[0x263EFD740]);
    uint64_t v25 = (void (**)(void, void))objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(v19, v20, 0, (uint64_t)v8, v21, v22, v23, v24);
    uint64_t v57 = MEMORY[0x263EF8330];
    uint64_t v58 = 3221225472;
    uint64_t v59 = sub_2360FB050;
    uint64_t v60 = &unk_264CA1E08;
    id v61 = v8;
    id v62 = v9;
    objc_msgSend_setModifyRecordZonesCompletionBlock_(v25, v26, (uint64_t)&v57, v27, v28, v29, v30, v31);
    objc_msgSend_setQualityOfService_(v25, v32, a4, v33, v34, v35, v36, v37, v57, v58, v59, v60);
    uint64_t v45 = objc_msgSend_privateCloudDatabase(self->_container, v38, v39, v40, v41, v42, v43, v44);
    objc_msgSend_addOperation_(v45, v46, (uint64_t)v25, v47, v48, v49, v50, v51);

    uint64_t v52 = v61;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v25 = (void (**)(void, void))_Block_copy(v9);
  if (v25)
  {
    uint64_t v52 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v53, *MEMORY[0x263EFD498], 5, 0, v54, v55, v56);
    ((void (**)(void, void *))v25)[2](v25, v52);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)zonesUnreadableDueToMissingD2DEncryptionIdentity:(id)a3 completion:(id)a4
{
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  id v8 = BDSCloudKitLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_2361FA640(self, v6, (uint64_t)v8, v9, v10, v11, v12, v13);
  }

  uint64_t v21 = objc_msgSend_accessQueue(self, v14, v15, v16, v17, v18, v19, v20);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360FB210;
  block[3] = &unk_264CA1890;
  void block[4] = self;
  uint64_t v25 = v6;
  id v26 = v7;
  id v22 = v7;
  uint64_t v23 = v6;
  dispatch_async(v21, block);
}

- (void)zonesTemporarilyUnreadableWithError:(id)a3 completion:(id)a4
{
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  id v8 = BDSCloudKitLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_2361FA6D0(self, v6, (uint64_t)v8, v9, v10, v11, v12, v13);
  }

  uint64_t v21 = objc_msgSend_accessQueue(self, v14, v15, v16, v17, v18, v19, v20);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360FB5C8;
  block[3] = &unk_264CA1890;
  void block[4] = self;
  uint64_t v25 = v6;
  id v26 = v7;
  id v22 = v7;
  uint64_t v23 = v6;
  dispatch_async(v21, block);
}

- (void)zonesDeletedOrReset:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = BDSCloudKitLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_msgSend_containerIdentifier(self, v9, v10, v11, v12, v13, v14, v15);
    *(_DWORD *)buf = 138543618;
    uint64_t v29 = v16;
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_impl(&dword_2360BC000, v8, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@) - zonesDeletedOrReset: %{public}@", buf, 0x16u);
  }
  uint64_t v24 = objc_msgSend_accessQueue(self, v17, v18, v19, v20, v21, v22, v23);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2360FB80C;
  v26[3] = &unk_264CA17F0;
  v26[4] = self;
  id v27 = v7;
  id v25 = v7;
  dispatch_async(v24, v26);
}

- (void)addObserver:(id)a3 recordType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = v7;
  if (v6 && objc_msgSend_length(v7, v8, v9, v10, v11, v12, v13, v14))
  {
    uint64_t v23 = objc_msgSend_accessQueue(self, v16, v17, v18, v19, v20, v21, v22);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2360FBA08;
    block[3] = &unk_264CA1400;
    void block[4] = self;
    id v26 = v15;
    id v27 = v6;
    dispatch_async(v23, block);
  }
  else
  {
    uint64_t v24 = BDSCloudKitLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_2361FA760();
    }
  }
}

- (void)removeObserver:(id)a3 recordType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = v7;
  if (v6 && objc_msgSend_length(v7, v8, v9, v10, v11, v12, v13, v14))
  {
    uint64_t v23 = objc_msgSend_accessQueue(self, v16, v17, v18, v19, v20, v21, v22);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2360FBC10;
    block[3] = &unk_264CA1400;
    void block[4] = self;
    id v26 = v15;
    id v27 = v6;
    dispatch_async(v23, block);
  }
  else
  {
    uint64_t v24 = BDSCloudKitLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_2361FA760();
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    uint64_t v12 = objc_msgSend_accessQueue(self, v4, v5, v6, v7, v8, v9, v10);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_2360FBE50;
    v21[3] = &unk_264CA1450;
    v21[4] = self;
    id v22 = v11;
    dispatch_async(v12, v21);
  }
  else
  {
    uint64_t v13 = BDSCloudKitLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_2361FA8A8(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)addObserver:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2360FC08C;
  v11[3] = &unk_264CA1400;
  p_zoneObserversLock = &self->_zoneObserversLock;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  os_unfair_lock_lock(p_zoneObserversLock);
  ((void (*)(void *))sub_2360FC08C)(v11);
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
    uint64_t v16 = objc_msgSend_accessQueue(self, v9, v10, v11, v12, v13, v14, v15);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2360FC300;
    block[3] = &unk_264CA1E80;
    objc_copyWeak(&v22, &location);
    id v19 = v8;
    id v20 = v6;
    uint64_t v21 = self;
    dispatch_async(v16, block);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v17 = BDSCloudKitLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_2361FA988();
    }
  }
}

- (void)unregisterServerChangeTokenStore:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    uint64_t v12 = objc_msgSend_accessQueue(self, v5, v6, v7, v8, v9, v10, v11);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2360FC794;
    block[3] = &unk_264CA1598;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    dispatch_async(v12, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v13 = BDSCloudKitLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_2361FAA60(v13);
    }
  }
}

- (id)diagnosticDatabaseInfo
{
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = sub_2360F2F80;
  uint64_t v41 = sub_2360F2F90;
  id v42 = 0;
  uint64_t v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  uint64_t v11 = objc_msgSend_accessQueue(self, v4, v5, v6, v7, v8, v9, v10);
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  id v31 = sub_2360FCAF0;
  uint64_t v32 = &unk_264CA1EA8;
  uint64_t v35 = &v43;
  uint64_t v36 = &v37;
  uint64_t v33 = self;
  uint64_t v12 = v3;
  uint64_t v34 = v12;
  dispatch_async(v11, &v29);

  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v13 = [BDSCloudSyncDiagnosticDatabaseInfo alloc];
  int v14 = *((unsigned __int8 *)v44 + 24);
  uint64_t v22 = objc_msgSend_establishedSalt(self, v15, v16, v17, v18, v19, v20, v21, v29, v30, v31, v32, v33);
  id v27 = objc_msgSend_initWithAttached_establishedSalt_container_(v13, v23, v14 != 0, v22, v38[5], v24, v25, v26);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
  return v27;
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

- (NSData)recordIDSalt
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
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