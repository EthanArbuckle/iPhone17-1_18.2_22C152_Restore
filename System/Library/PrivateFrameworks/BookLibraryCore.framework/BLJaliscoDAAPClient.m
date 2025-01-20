@interface BLJaliscoDAAPClient
+ (BOOL)isSupported;
+ (BOOL)workaround_18397698;
+ (id)sharedClient;
+ (void)initialize;
+ (void)preWarmSync;
- (BLImageManager)imageManagerDelegate;
- (BLJaliscoDAAPClient)init;
- (BLJaliscoDAAPClientDelegate)delegate;
- (BOOL)isGDPRPrivacyAcknowledgementRequired;
- (BOOL)isInitiallyLoadingJalisco;
- (BOOL)resetPoliteTimers;
- (BOOL)storeAuthenticationRequired;
- (NSManagedObjectContext)moc;
- (NSMutableDictionary)swqDSIDToDAAPServer;
- (NSMutableSet)purchaseDAAPSyncsInFlight;
- (NSPersistentHistoryToken)currentJaliscoHistoryToken;
- (OS_dispatch_queue)dsidQueue;
- (id)_allPurchaseDAAPServers;
- (id)_currentPurchaseDAAPServers;
- (id)_dsids;
- (id)_familyPurchaseDAAPServers;
- (id)_fetchItemsForNeedsImport:(BOOL)a3;
- (id)_fetchRequestForNotInStoreAccountIDs:(id)a3;
- (id)_newPurchaseDAAPServerWithDSID:(id)a3;
- (id)fetchAllBookletIDsWithParentStoreIDs:(id)a3;
- (id)fetchItemsForStoreIDs:(id)a3;
- (id)fetchRequestForAllStoreIDs:(id)a3;
- (id)fetchRequestForAllStoreIDsWithNonEmptyPurchasedToken:(id)a3;
- (id)fetchRequestForBookletItems:(id)a3;
- (id)fetchRequestForBuyParameters:(id)a3;
- (id)fetchRequestForHiddenItems;
- (id)fetchRequestForStoreID:(id)a3;
- (id)fetchRequestForStoreIDIncludingHidden:(id)a3;
- (id)fetchRequestForStoreIDs:(id)a3;
- (id)newManagedObjectContext;
- (id)newManagedObjectContextWithPrivateQueueConcurrency;
- (id)persistentStoreCoordinator;
- (id)predicateForBookletItems:(BOOL)a3;
- (id)predicateForItems:(BOOL)a3;
- (id)resetJaliscoStatusHandler;
- (unint64_t)currentServerGeneration;
- (unint64_t)pendingUpdateGeneration;
- (void)_addPurchaseServerForCurrentUser;
- (void)_processFamilyCircleAdded:(id)a3 removed:(id)a4 unchanged:(id)a5 completion:(id)a6;
- (void)_resetPurchaseDAAPServersWithQueue:(id)a3;
- (void)_sendCompletionHandlersWithSuccess:(BOOL)a3 generation:(unint64_t)a4;
- (void)_startObservingNotifications;
- (void)_stopObservingNotifications;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)dealloc;
- (void)deleteItemsWithStoreIDs:(id)a3 completion:(id)a4;
- (void)fetchAllHiddenItemStoreIDsWithCompletion:(id)a3;
- (void)fetchItemsForBuyParameters:(id)a3 completion:(id)a4;
- (void)fetchItemsForStoreIDs:(id)a3 completion:(id)a4;
- (void)forceJaliscoArtworkUpdateWithCompletion:(id)a3;
- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4;
- (void)jaliscoArtworkTimebombed;
- (void)purchaseServerHandleClientExpired;
- (void)purchaseServerRequestGDPRPrivacyAcknowledgementRequired;
- (void)purchaseServerRequestITunesAuthentication;
- (void)refreshSignInStatus;
- (void)refreshStoreWithCompletion:(id)a3;
- (void)resetPurchasedTokenForStoreIDs:(id)a3 completion:(id)a4;
- (void)resetStaleJaliscoDatabaseWithCompletion:(id)a3;
- (void)setCurrentServerGeneration:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDsidQueue:(id)a3;
- (void)setImageManagerDelegate:(id)a3;
- (void)setIsGDPRPrivacyAcknowledgementRequired:(BOOL)a3;
- (void)setItemHidden:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5;
- (void)setMoc:(id)a3;
- (void)setPendingUpdateGeneration:(unint64_t)a3;
- (void)setPurchaseDAAPSyncsInFlight:(id)a3;
- (void)setResetJaliscoStatusHandler:(id)a3;
- (void)setStoreAuthenticationRequired:(BOOL)a3;
- (void)setSwqDSIDToDAAPServer:(id)a3;
- (void)storeIDsWithNonEmptyPurchasedToken:(id)a3 completion:(id)a4;
- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5;
- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5;
- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
@end

@implementation BLJaliscoDAAPClient

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v5 = objc_msgSend_dictionary(NSDictionary, v2, v3, v4);
    objc_msgSend_setObject_forKey_(v13, v6, (uint64_t)v5, @"kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary");

    v10 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v7, v8, v9);
    objc_msgSend_registerDefaults_(v10, v11, (uint64_t)v13, v12);
  }
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)sharedClient
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AB3FF38);
  if (!qword_26AB3FFA0)
  {
    v2 = objc_alloc_init(BLJaliscoDAAPClient);
    uint64_t v3 = (void *)qword_26AB3FFA0;
    qword_26AB3FFA0 = (uint64_t)v2;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AB3FF38);
  uint64_t v4 = (void *)qword_26AB3FFA0;

  return v4;
}

- (BLJaliscoDAAPClient)init
{
  v49.receiver = self;
  v49.super_class = (Class)BLJaliscoDAAPClient;
  v5 = [(BLJaliscoDAAPClient *)&v49 init];
  if (!v5) {
    goto LABEL_6;
  }
  v6 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v2, v3, v4);
  v10 = objc_msgSend_activeStoreAccount(v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_ams_DSID(v10, v11, v12, v13);
  v15 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v14;

  v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v17 = dispatch_queue_create("Jalisco_DAAP_Server_Worker_Queue", v16);
  v18 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v17;

  v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v21 = dispatch_queue_create("Jalisco_DAAP_DSID_Queue", v20);
  v22 = (void *)*((void *)v5 + 14);
  *((void *)v5 + 14) = v21;

  *(_OWORD *)(v5 + 88) = xmmword_21E040AB0;
  *((void *)v5 + 6) = 0;
  uint64_t v23 = objc_opt_new();
  v24 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v23;

  uint64_t v25 = objc_opt_new();
  v26 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v25;

  v5[68] = 0;
  v5[60] = 0;
  uint64_t v27 = objc_opt_new();
  v28 = (void *)*((void *)v5 + 15);
  *((void *)v5 + 15) = v27;

  uint64_t v29 = objc_opt_new();
  v30 = (void *)*((void *)v5 + 16);
  *((void *)v5 + 16) = v29;

  *((_DWORD *)v5 + 16) = 0;
  *((_DWORD *)v5 + 14) = 0;
  uint64_t v33 = *((void *)v5 + 1);
  if (v33)
  {
    v34 = objc_msgSend__newPurchaseDAAPServerWithDSID_(v5, v31, v33, v32);
    objc_msgSend_setObject_forKeyedSubscript_(*((void **)v5 + 15), v35, (uint64_t)v34, *((void *)v5 + 1));

    ++*((void *)v5 + 11);
  }
  v36 = objc_msgSend_sharedSource(BLJaliscoServerSource, v31, v33, v32);

  if (v36)
  {
    uint64_t v40 = objc_msgSend_newManagedObjectContextWithPrivateQueueConcurrency(v5, v37, v38, v39);
    v41 = (void *)*((void *)v5 + 17);
    *((void *)v5 + 17) = v40;

    objc_msgSend__startObservingNotifications(v5, v42, v43, v44);
LABEL_6:
    v45 = v5;
    goto LABEL_10;
  }
  v46 = BLJaliscoLog();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v48 = 0;
    _os_log_impl(&dword_21DFE3000, v46, OS_LOG_TYPE_ERROR, "Unable to initialize BLJaliscoDAAPClient", v48, 2u);
  }

  v45 = 0;
LABEL_10:

  return v45;
}

- (void)dealloc
{
  objc_msgSend__stopObservingNotifications(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)BLJaliscoDAAPClient;
  [(BLJaliscoDAAPClient *)&v5 dealloc];
}

- (void)_startObservingNotifications
{
  objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], a2, v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_accountTypes_(v6, v5, (uint64_t)self, 1);
}

- (void)_stopObservingNotifications
{
  objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], a2, v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_accountTypes_(v6, v5, (uint64_t)self, 1);
}

- (NSPersistentHistoryToken)currentJaliscoHistoryToken
{
  uint64_t v4 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, v2, v3);
  uint64_t v8 = objc_msgSend_currentJaliscoHistoryToken(v4, v5, v6, v7);

  return (NSPersistentHistoryToken *)v8;
}

- (void)setIsGDPRPrivacyAcknowledgementRequired:(BOOL)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_21E01B2B0;
  v4[3] = &unk_26448BEA8;
  p_isGDPRPrivacyAcknowledgementLock = &self->_isGDPRPrivacyAcknowledgementLock;
  v4[4] = self;
  BOOL v5 = a3;
  os_unfair_lock_lock(&self->_isGDPRPrivacyAcknowledgementLock);
  sub_21E01B2B0((uint64_t)v4);
  os_unfair_lock_unlock(p_isGDPRPrivacyAcknowledgementLock);
}

- (BOOL)isGDPRPrivacyAcknowledgementRequired
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  p_isGDPRPrivacyAcknowledgementLock = &self->_isGDPRPrivacyAcknowledgementLock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  uint64_t v6 = sub_21E01B3A8;
  uint64_t v7 = &unk_26448BED0;
  uint64_t v8 = self;
  uint64_t v9 = &v10;
  uint64_t v3 = v5;
  os_unfair_lock_lock(p_isGDPRPrivacyAcknowledgementLock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_isGDPRPrivacyAcknowledgementLock);

  LOBYTE(p_isGDPRPrivacyAcknowledgementLock) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_isGDPRPrivacyAcknowledgementLock;
}

- (void)setStoreAuthenticationRequired:(BOOL)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_21E01B44C;
  v4[3] = &unk_26448BEA8;
  p_authenticationLock = &self->_authenticationLock;
  v4[4] = self;
  BOOL v5 = a3;
  os_unfair_lock_lock(&self->_authenticationLock);
  sub_21E01B44C((uint64_t)v4);
  os_unfair_lock_unlock(p_authenticationLock);
}

- (BOOL)storeAuthenticationRequired
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  p_authenticationLock = &self->_authenticationLock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  uint64_t v6 = sub_21E01B544;
  uint64_t v7 = &unk_26448BED0;
  uint64_t v8 = self;
  uint64_t v9 = &v10;
  uint64_t v3 = v5;
  os_unfair_lock_lock(p_authenticationLock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_authenticationLock);

  LOBYTE(p_authenticationLock) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_authenticationLock;
}

- (void)refreshSignInStatus
{
  serverWorkerQueue = self->_serverWorkerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E01B5CC;
  block[3] = &unk_26448B708;
  block[4] = self;
  dispatch_async(serverWorkerQueue, block);
}

- (void)jaliscoArtworkTimebombed
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_timebombRetries > 2)
  {
    uint64_t v4 = BLJaliscoLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      unint64_t timebombRetries = self->_timebombRetries;
      *(_DWORD *)buf = 134217984;
      unint64_t v8 = timebombRetries;
      _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_DEBUG, "ARTWORK: Ignoring timebomb on its %lu try.", buf, 0xCu);
    }
  }
  else
  {
    serverWorkerQueue = self->_serverWorkerQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E01B6FC;
    block[3] = &unk_26448B708;
    block[4] = self;
    dispatch_async(serverWorkerQueue, block);
  }
  ++self->_timebombRetries;
}

- (void)forceJaliscoArtworkUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  serverWorkerQueue = self->_serverWorkerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E01B88C;
  v7[3] = &unk_26448BEF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serverWorkerQueue, v7);
}

- (void)fetchItemsForStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  moc = self->_moc;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_21E01BB08;
  v13[3] = &unk_26448BF48;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_msgSend_performBlock_(moc, v11, (uint64_t)v13, v12);
}

- (id)fetchItemsForStoreIDs:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  moc = self->_moc;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21E01BD70;
  v14[3] = &unk_26448BF70;
  id v15 = v4;
  v16 = self;
  id v7 = v5;
  id v17 = v7;
  id v8 = v4;
  objc_msgSend_performBlockAndWait_(moc, v9, (uint64_t)v14, v10);
  v11 = v17;
  id v12 = v7;

  return v12;
}

- (id)fetchAllBookletIDsWithParentStoreIDs:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  moc = self->_moc;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21E01BFC0;
  v15[3] = &unk_26448BF70;
  id v16 = v4;
  id v17 = self;
  id v18 = v5;
  id v7 = v5;
  id v8 = v4;
  objc_msgSend_performBlockAndWait_(moc, v9, (uint64_t)v15, v10);
  char v13 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v11, (uint64_t)v7, v12);

  return v13;
}

- (void)fetchItemsForBuyParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  moc = self->_moc;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_21E01C1E0;
  v13[3] = &unk_26448BF48;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_msgSend_performBlock_(moc, v11, (uint64_t)v13, v12);
}

- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serverWorkerQueue = self->_serverWorkerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E01C434;
  block[3] = &unk_26448BF48;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serverWorkerQueue, block);
}

- (void)fetchAllHiddenItemStoreIDsWithCompletion:(id)a3
{
  id v4 = a3;
  moc = self->_moc;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E01C684;
  v9[3] = &unk_26448BEF8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  objc_msgSend_performBlock_(moc, v7, (uint64_t)v9, v8);
}

- (void)setItemHidden:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v41 = a5;
  id v12 = objc_msgSend_newManagedObjectContext(self, v9, v10, v11);
  id v15 = objc_msgSend_fetchRequestForStoreIDIncludingHidden_(self, v13, (uint64_t)v8, v14);
  id v47 = 0;
  id v17 = objc_msgSend_executeFetchRequest_error_(v12, v16, (uint64_t)v15, (uint64_t)&v47);
  id v40 = v47;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v18 = v17;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v43, (uint64_t)v50, 16);
  if (v20)
  {
    uint64_t v23 = v20;
    uint64_t v24 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v44 != v24) {
          objc_enumerationMutation(v18);
        }
        v26 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v27 = objc_msgSend_numberWithBool_(NSNumber, v21, v6, v22, v40);
        objc_msgSend_setIsHidden_(v26, v28, (uint64_t)v27, v29);
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v43, (uint64_t)v50, 16);
    }
    while (v23);
  }

  if (objc_msgSend_hasChanges(v12, v30, v31, v32))
  {
    id v42 = 0;
    LODWORD(v35) = objc_msgSend_save_(v12, v33, (uint64_t)&v42, v34);
    id v36 = v42;
    if (v36) {
      uint64_t v35 = v35;
    }
    else {
      uint64_t v35 = 1;
    }
    if ((v35 & 1) == 0)
    {
      v37 = BLJaliscoLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v36;
        _os_log_impl(&dword_21DFE3000, v37, OS_LOG_TYPE_ERROR, "Set items hidden: Moc Save Error:  %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v35 = 1;
  }
  uint64_t v38 = MEMORY[0x223C1EDC0](v41);
  uint64_t v39 = (void *)v38;
  if (v38) {
    (*(void (**)(uint64_t, uint64_t))(v38 + 16))(v38, v35);
  }
}

- (void)resetPurchasedTokenForStoreIDs:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_newManagedObjectContext(self, v8, v9, v10);
  uint64_t v14 = objc_msgSend_fetchRequestForAllStoreIDs_(self, v12, (uint64_t)v6, v13);
  id v41 = 0;
  id v16 = objc_msgSend_executeFetchRequest_error_(v11, v15, (uint64_t)v14, (uint64_t)&v41);
  id v17 = v41;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v18 = v16;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v37, (uint64_t)v44, 16);
  if (v20)
  {
    uint64_t v23 = v20;
    uint64_t v24 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend_setPurchasedTokenCode_(*(void **)(*((void *)&v37 + 1) + 8 * i), v21, @"0", v22);
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v37, (uint64_t)v44, 16);
    }
    while (v23);
  }

  if (objc_msgSend_hasChanges(v11, v26, v27, v28))
  {
    id v36 = 0;
    LODWORD(v31) = objc_msgSend_save_(v11, v29, (uint64_t)&v36, v30);
    id v32 = v36;
    if (v32) {
      uint64_t v31 = v31;
    }
    else {
      uint64_t v31 = 1;
    }
    if ((v31 & 1) == 0)
    {
      uint64_t v33 = BLJaliscoLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v32;
        _os_log_impl(&dword_21DFE3000, v33, OS_LOG_TYPE_ERROR, "Reset purchase token: Moc Save Error:  %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v31 = 1;
  }
  uint64_t v34 = MEMORY[0x223C1EDC0](v7);
  uint64_t v35 = (void *)v34;
  if (v34) {
    (*(void (**)(uint64_t, uint64_t))(v34 + 16))(v34, v31);
  }
}

- (void)storeIDsWithNonEmptyPurchasedToken:(id)a3 completion:(id)a4
{
  v42[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v11 = objc_msgSend_newManagedObjectContext(self, v8, v9, v10);
  uint64_t v14 = objc_msgSend_fetchRequestForAllStoreIDsWithNonEmptyPurchasedToken_(self, v12, (uint64_t)v7, v13);

  v42[0] = @"storeID";
  id v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v15, (uint64_t)v42, 1);
  objc_msgSend_setPropertiesToFetch_(v14, v17, (uint64_t)v16, v18);

  objc_msgSend_setResultType_(v14, v19, 2, v20);
  id v39 = 0;
  uint64_t v22 = objc_msgSend_executeFetchRequest_error_(v11, v21, (uint64_t)v14, (uint64_t)&v39);
  id v25 = v39;
  if (v25)
  {
    v26 = BLJaliscoLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v25;
      _os_log_impl(&dword_21DFE3000, v26, OS_LOG_TYPE_ERROR, "Non-empty purchase token storeIDs: Moc Fetch Error:  %@", buf, 0xCu);
    }
  }
  uint64_t v27 = objc_msgSend_valueForKey_(v22, v23, @"storeID", v24);
  uint64_t v31 = objc_msgSend_bu_arrayByRemovingNSNulls(v27, v28, v29, v30);
  id v32 = (void *)v31;
  uint64_t v33 = (void *)MEMORY[0x263EFFA68];
  if (v31) {
    uint64_t v33 = (void *)v31;
  }
  id v34 = v33;

  long long v37 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v35, (uint64_t)v34, v36);

  long long v38 = (void (**)(void, void, void))MEMORY[0x223C1EDC0](v6);
  if (v38) {
    ((void (**)(void, void *, BOOL))v38)[2](v38, v37, v25 == 0);
  }
}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E01CF5C;
  v11[3] = &unk_26448BFC0;
  v11[4] = self;
  id v12 = v8;
  id v9 = v8;
  objc_msgSend_updatePolitely_reason_completion_(self, v10, v6, a4, v11);
}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  serverWorkerQueue = self->_serverWorkerQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E01D1EC;
  v11[3] = &unk_26448C0D8;
  v11[4] = self;
  id v12 = v8;
  BOOL v14 = a3;
  int64_t v13 = a4;
  id v10 = v8;
  dispatch_async(serverWorkerQueue, v11);
}

- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  *(void *)&v34[5] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = BLJaliscoLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v34[0] = v6;
    LOWORD(v34[1]) = 2048;
    *(void *)((char *)&v34[1] + 2) = a4;
    _os_log_impl(&dword_21DFE3000, v9, OS_LOG_TYPE_DEFAULT, "updatePolitelyAfterSignOut politely:%{BOOL}d reason:%ld", buf, 0x12u);
  }

  dsidQueue = self->_dsidQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E01E49C;
  block[3] = &unk_26448B708;
  block[4] = self;
  dispatch_sync(dsidQueue, block);
  BOOL v14 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v11, v12, v13);
  uint64_t v18 = objc_msgSend_activeStoreAccount(v14, v15, v16, v17);
  objc_msgSend_ams_DSID(v18, v19, v20, v21);
  uint64_t v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  currentAccountNumber = self->_currentAccountNumber;
  self->_currentAccountNumber = v22;

  objc_msgSend__resetPurchaseDAAPServersWithQueue_(self, v24, (uint64_t)self->_serverWorkerQueue, v25);
  objc_msgSend__addPurchaseServerForCurrentUser(self, v26, v27, v28);
  uint64_t v29 = BLJaliscoLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = self->_currentAccountNumber;
    *(_DWORD *)buf = 138412290;
    *(void *)id v34 = v30;
    _os_log_impl(&dword_21DFE3000, v29, OS_LOG_TYPE_DEFAULT, "updatePolitelyAfterSignOut Triggering updatePolitely now for %@", buf, 0xCu);
  }

  objc_msgSend_updatePolitely_reason_completion_(self, v31, v6, a4, v8);
}

- (id)_newPurchaseDAAPServerWithDSID:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_sharedPrivacyInfo(BLPrivacyInfo, v5, v6, v7);
  id v9 = [BLPurchaseDAAPServer alloc];
  uint64_t v11 = objc_msgSend_initWithDSID_delegate_privacyInfo_(v9, v10, (uint64_t)v4, (uint64_t)self, v8);

  return v11;
}

- (void)_addPurchaseServerForCurrentUser
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  currentAccountNumber = self->_currentAccountNumber;
  id v4 = BLJaliscoLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (currentAccountNumber)
  {
    if (v5)
    {
      uint64_t v6 = self->_currentAccountNumber;
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_DEFAULT, "_addPurchaseServerForCurrentUser dsid:%@", buf, 0xCu);
    }

    dsidQueue = self->_dsidQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E01E694;
    block[3] = &unk_26448B708;
    block[4] = self;
    dispatch_sync(dsidQueue, block);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_DEFAULT, "_addPurchaseServerForCurrentUser no current account", buf, 2u);
    }
  }
}

- (void)refreshStoreWithCompletion:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedSource(BLJaliscoServerSource, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_refreshStoreWithCompletion_(v9, v7, (uint64_t)v3, v8);
}

- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = BLJaliscoLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v33[0] = 67109376;
    v33[1] = v6;
    __int16 v34 = 2048;
    int64_t v35 = a4;
    _os_log_impl(&dword_21DFE3000, v9, OS_LOG_TYPE_DEFAULT, "updatePolitelyAfterSignIn politely:%{BOOL}d reason:%ld", (uint8_t *)v33, 0x12u);
  }

  uint64_t v13 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v10, v11, v12);
  uint64_t v17 = objc_msgSend_activeStoreAccount(v13, v14, v15, v16);
  objc_msgSend_ams_DSID(v17, v18, v19, v20);
  uint64_t v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  currentAccountNumber = self->_currentAccountNumber;
  self->_currentAccountNumber = v21;

  objc_msgSend__addPurchaseServerForCurrentUser(self, v23, v24, v25);
  objc_msgSend__resetPurchaseDAAPServersWithQueue_(self, v26, (uint64_t)self->_serverWorkerQueue, v27);
  objc_msgSend_resetPoliteTimers(self, v28, v29, v30);
  uint64_t v31 = BLJaliscoLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v33[0]) = 0;
    _os_log_impl(&dword_21DFE3000, v31, OS_LOG_TYPE_DEFAULT, "updatePolitelyAfterSignIn Triggering updatePolitely now", (uint8_t *)v33, 2u);
  }

  objc_msgSend_updatePolitely_reason_completion_(self, v32, v6, a4, v8);
}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E01EAC4;
  v11[3] = &unk_26448BFC0;
  v11[4] = self;
  id v12 = v8;
  id v9 = v8;
  objc_msgSend_updateFamilyPolitely_reason_completion_(self, v10, v6, a4, v11);
}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_21E01EF40;
  v25[3] = &unk_26448C150;
  v25[4] = self;
  id v9 = v8;
  id v26 = v9;
  int64_t v27 = a4;
  BOOL v28 = v6;
  id v10 = (void *)MEMORY[0x223C1EDC0](v25);
  uint64_t v11 = BLJaliscoLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v6;
    _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_DEFAULT, "Starting jalisco family purchase update (politely: %d)", (uint8_t *)&buf, 8u);
  }

  LOBYTE(buf) = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", (Boolean *)&buf);
  if ((_BYTE)buf && AppBooleanValue)
  {
    uint64_t v13 = BLJaliscoLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21DFE3000, v13, OS_LOG_TYPE_DEFAULT, "Skipping update family due to store demo mode.", (uint8_t *)&buf, 2u);
    }

    uint64_t v14 = MEMORY[0x223C1EDC0](v9);
    uint64_t v15 = (void *)v14;
    if (v14) {
      (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, 1);
    }
  }
  else
  {
    objc_initWeak(&buf, self);
    uint64_t v19 = objc_msgSend_sharedInstance(BLFamilyCircleController, v16, v17, v18);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_21E01FA1C;
    v22[3] = &unk_26448C178;
    objc_copyWeak(&v24, &buf);
    id v23 = v10;
    objc_msgSend_refreshWithCompletion_(v19, v20, (uint64_t)v22, v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&buf);
  }
}

- (id)fetchRequestForStoreID:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_sharedSource(BLJaliscoServerSource, v5, v6, v7);
  uint64_t v11 = objc_msgSend_setWithObject_(MEMORY[0x263EFFA08], v9, (uint64_t)v4, v10);

  uint64_t v15 = objc_msgSend__dsids(self, v12, v13, v14);
  uint64_t v17 = objc_msgSend_fetchRequestForStoreIDs_dsids_(v8, v16, (uint64_t)v11, (uint64_t)v15);

  return v17;
}

- (id)fetchRequestForStoreIDIncludingHidden:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_sharedSource(BLJaliscoServerSource, v5, v6, v7);
  uint64_t v11 = objc_msgSend_setWithObject_(MEMORY[0x263EFFA08], v9, (uint64_t)v4, v10);

  uint64_t v15 = objc_msgSend__dsids(self, v12, v13, v14);
  uint64_t v17 = objc_msgSend_fetchRequestForAllStoreIDs_dsids_(v8, v16, (uint64_t)v11, (uint64_t)v15);

  return v17;
}

- (id)fetchRequestForStoreIDs:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_sharedSource(BLJaliscoServerSource, v5, v6, v7);
  id v12 = objc_msgSend__dsids(self, v9, v10, v11);
  uint64_t v14 = objc_msgSend_fetchRequestForStoreIDs_dsids_(v8, v13, (uint64_t)v4, (uint64_t)v12);

  return v14;
}

- (id)fetchRequestForAllStoreIDs:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_sharedSource(BLJaliscoServerSource, v5, v6, v7);
  id v12 = objc_msgSend__dsids(self, v9, v10, v11);
  uint64_t v14 = objc_msgSend_fetchRequestForAllStoreIDs_dsids_(v8, v13, (uint64_t)v4, (uint64_t)v12);

  return v14;
}

- (id)fetchRequestForAllStoreIDsWithNonEmptyPurchasedToken:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_sharedSource(BLJaliscoServerSource, v5, v6, v7);
  id v12 = objc_msgSend__dsids(self, v9, v10, v11);
  uint64_t v14 = objc_msgSend_fetchRequestForAllStoreIDsWithNonEmptyPurchasedToken_dsids_(v8, v13, (uint64_t)v4, (uint64_t)v12);

  return v14;
}

- (id)fetchRequestForBuyParameters:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedSource(BLJaliscoServerSource, v4, v5, v6);
  uint64_t v10 = objc_msgSend_fetchRequestForBuyParameters_(v7, v8, (uint64_t)v3, v9);

  return v10;
}

- (id)fetchRequestForBookletItems:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedSource(BLJaliscoServerSource, v4, v5, v6);
  uint64_t v10 = objc_msgSend_fetchRequestForBookletItemsForStoreIDs_(v7, v8, (uint64_t)v3, v9);

  return v10;
}

- (id)fetchRequestForHiddenItems
{
  uint64_t v5 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, v2, v3);
  uint64_t v9 = objc_msgSend__dsids(self, v6, v7, v8);
  id v12 = objc_msgSend_fetchRequestForHiddenItemsWithAccountIDs_(v5, v10, (uint64_t)v9, v11);

  return v12;
}

- (id)predicateForItems:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, a3, v3);
  uint64_t v10 = objc_msgSend__dsids(self, v7, v8, v9);
  id v12 = objc_msgSend_predicateForItems_dsids_(v6, v11, v4, (uint64_t)v10);

  return v12;
}

- (id)predicateForBookletItems:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, a3, v3);
  uint64_t v10 = objc_msgSend__dsids(self, v7, v8, v9);
  id v12 = objc_msgSend_predicateForBookletItems_dsids_(v6, v11, v4, (uint64_t)v10);

  return v12;
}

- (id)newManagedObjectContext
{
  BOOL v4 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, v2, v3);
  uint64_t v8 = objc_msgSend_newManagedObjectContext(v4, v5, v6, v7);

  return v8;
}

- (id)newManagedObjectContextWithPrivateQueueConcurrency
{
  BOOL v4 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, v2, v3);
  uint64_t v8 = objc_msgSend_newManagedObjectContextWithPrivateQueueConcurrency(v4, v5, v6, v7);

  return v8;
}

- (id)persistentStoreCoordinator
{
  BOOL v4 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, v2, v3);
  uint64_t v8 = objc_msgSend_persistentStoreCoordinator(v4, v5, v6, v7);

  return v8;
}

- (BOOL)resetPoliteTimers
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v4 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, v2, v3);
  uint64_t v5 = BLJaliscoLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_msgSend_valueForKey_(v4, v6, @"kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary", v7);
    int v20 = 138412290;
    uint64_t v21 = v8;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "Resetting polite timers ... clearing old dictionary:%@", (uint8_t *)&v20, 0xCu);
  }
  id v12 = objc_msgSend_dictionary(NSDictionary, v9, v10, v11);
  objc_msgSend_setObject_forKey_(v4, v13, (uint64_t)v12, @"kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary");

  char v17 = objc_msgSend_synchronize(v4, v14, v15, v16);
  if ((v17 & 1) == 0)
  {
    uint64_t v18 = BLJaliscoLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_21DFE3000, v18, OS_LOG_TYPE_ERROR, "ERROR: Could not reset polite timer.", (uint8_t *)&v20, 2u);
    }
  }
  return v17;
}

- (void)deleteItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = BLJaliscoLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "deleteItemsWithStoreIDs storeIDs:%@", buf, 0xCu);
  }

  moc = self->_moc;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21E02039C;
  v14[3] = &unk_26448BF48;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  objc_msgSend_performBlockAndWait_(moc, v12, (uint64_t)v14, v13);
}

- (id)_fetchItemsForNeedsImport:(BOOL)a3
{
  uint64_t v5 = objc_opt_new();
  moc = self->_moc;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_21E0207E4;
  v13[3] = &unk_26448C1A0;
  BOOL v15 = a3;
  v13[4] = self;
  id v7 = v5;
  id v14 = v7;
  objc_msgSend_performBlockAndWait_(moc, v8, (uint64_t)v13, v9);
  id v10 = v14;
  id v11 = v7;

  return v11;
}

- (id)_allPurchaseDAAPServers
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_21E01B9A4;
  uint64_t v13 = sub_21E01B9B4;
  id v14 = 0;
  uint64_t v5 = objc_msgSend_dsidQueue(self, a2, v2, v3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_21E020A5C;
  v8[3] = &unk_26448BED0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_currentPurchaseDAAPServers
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_21E01B9A4;
  uint64_t v13 = sub_21E01B9B4;
  id v14 = 0;
  uint64_t v5 = objc_msgSend_dsidQueue(self, a2, v2, v3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_21E020BE0;
  v8[3] = &unk_26448B920;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_familyPurchaseDAAPServers
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = sub_21E01B9A4;
  id v16 = sub_21E01B9B4;
  id v17 = 0;
  uint64_t v5 = objc_msgSend_dsidQueue(self, a2, v2, v3);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E020DC0;
  v11[3] = &unk_26448BED0;
  v11[4] = self;
  void v11[5] = &v12;
  dispatch_sync(v5, v11);

  uint64_t v9 = objc_msgSend_copy((void *)v13[5], v6, v7, v8);
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)_dsids
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_21E01B9A4;
  uint64_t v13 = sub_21E01B9B4;
  id v14 = 0;
  uint64_t v5 = objc_msgSend_dsidQueue(self, a2, v2, v3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_21E020FBC;
  v8[3] = &unk_26448BED0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_fetchRequestForNotInStoreAccountIDs:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedSource(BLJaliscoServerSource, v4, v5, v6);
  id v10 = objc_msgSend_fetchRequestForNotInStoreAccountIDs_(v7, v8, (uint64_t)v3, v9);

  return v10;
}

- (void)_processFamilyCircleAdded:(id)a3 removed:(id)a4 unchanged:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dsidQueue = self->_dsidQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E0211EC;
  block[3] = &unk_26448C218;
  id v20 = v10;
  id v21 = v12;
  uint64_t v22 = self;
  id v23 = v11;
  id v24 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(dsidQueue, block);
}

- (void)_sendCompletionHandlersWithSuccess:(BOOL)a3 generation:(unint64_t)a4
{
  serverWorkerQueue = self->_serverWorkerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E021B80;
  block[3] = &unk_26448C268;
  void block[4] = self;
  void block[5] = a4;
  BOOL v6 = a3;
  dispatch_async(serverWorkerQueue, block);
}

- (void)_resetPurchaseDAAPServersWithQueue:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend__allPurchaseDAAPServers(self, v5, v6, v7);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_resetWithQueue_(*(void **)(*((void *)&v16 + 1) + 8 * v15++), v11, (uint64_t)v4, v12);
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v13);
  }
}

+ (void)preWarmSync
{
}

+ (BOOL)workaround_18397698
{
  id v4 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, v2, v3);
  char v8 = objc_msgSend_workaround_18397698(v4, v5, v6, v7);

  return v8;
}

- (void)purchaseServerHandleClientExpired
{
  objc_msgSend_delegate(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientDetectedPurchaseServerClientExpired_(v7, v5, (uint64_t)self, v6);
}

- (void)purchaseServerRequestGDPRPrivacyAcknowledgementRequired
{
  objc_msgSend_setIsGDPRPrivacyAcknowledgementRequired_(self, a2, 1, v2);
}

- (void)purchaseServerRequestITunesAuthentication
{
  objc_msgSend_setStoreAuthenticationRequired_(self, a2, 1, v2);
}

- (void)resetStaleJaliscoDatabaseWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v7 = objc_msgSend_sharedSource(BLJaliscoServerSource, v4, v5, v6);
  id v19 = 0;
  char v10 = objc_msgSend_truncateDatabaseError_(v7, v8, (uint64_t)&v19, v9);
  id v11 = v19;

  uint64_t v12 = BLJaliscoLog();
  uint64_t v13 = v12;
  if (v10)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)id buf = 0;
    uint64_t v14 = "Account Changed. Truncated jalisco database";
    uint64_t v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    uint32_t v17 = 2;
  }
  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)id buf = 138412290;
    id v21 = v11;
    uint64_t v14 = "Could not truncate database. error:  %@";
    uint64_t v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 12;
  }
  _os_log_impl(&dword_21DFE3000, v15, v16, v14, buf, v17);
LABEL_7:

  long long v18 = (void (**)(void, void))MEMORY[0x223C1EDC0](v3);
  if (v18) {
    ((void (**)(void, id))v18)[2](v18, v11);
  }
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  if (!a4) {
    return;
  }
  uint64_t v6 = BLJaliscoLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    currentAccountNumber = self->_currentAccountNumber;
    id v11 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v7, v8, v9);
    uint64_t v15 = objc_msgSend_activeStoreAccount(v11, v12, v13, v14);
    id v19 = objc_msgSend_ams_DSID(v15, v16, v17, v18);
    *(_DWORD *)id buf = 134218499;
    unint64_t v63 = a4;
    __int16 v64 = 2113;
    v65 = currentAccountNumber;
    __int16 v66 = 2113;
    v67 = v19;
    _os_log_impl(&dword_21DFE3000, v6, OS_LOG_TYPE_DEFAULT, "Account Changed. Resetting and refreshing... with reason %lu. Updating accountNumber from old:%{private}@ to new:%{private}@", buf, 0x20u);
  }
  id v23 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v20, v21, v22);
  int64_t v27 = objc_msgSend_activeStoreAccount(v23, v24, v25, v26);
  objc_msgSend_ams_DSID(v27, v28, v29, v30);
  uint64_t v31 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  id v32 = self->_currentAccountNumber;
  self->_currentAccountNumber = v31;

  unint64_t v35 = a4 - 101;
  if (a4 - 101 > 1)
  {
    if (a4 != 100 || !self->_currentAccountNumber) {
      goto LABEL_12;
    }
    dsidQueue = self->_dsidQueue;
    uint64_t v52 = MEMORY[0x263EF8330];
    uint64_t v53 = 3221225472;
    v54 = sub_21E02243C;
    v55 = &unk_26448B708;
    v56 = self;
    long long v38 = &v52;
  }
  else
  {
    uint64_t v36 = BLJaliscoLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_21DFE3000, v36, OS_LOG_TYPE_DEFAULT, "Jalisco account stale .. removeAllObjects", buf, 2u);
    }

    dsidQueue = self->_dsidQueue;
    uint64_t v57 = MEMORY[0x263EF8330];
    uint64_t v58 = 3221225472;
    v59 = sub_21E0223F8;
    v60 = &unk_26448B708;
    v61 = self;
    long long v38 = &v57;
  }
  dispatch_sync(dsidQueue, v38);
LABEL_12:
  objc_msgSend__resetPurchaseDAAPServersWithQueue_(self, v33, (uint64_t)self->_serverWorkerQueue, v34, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61);
  uint64_t v45 = objc_msgSend_delegate(self, v39, v40, v41);
  if (v35 > 1)
  {
    id v49 = BLJaliscoLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_21DFE3000, v49, OS_LOG_TYPE_DEFAULT, "Triggering clientDetectedStoreChange", buf, 2u);
    }

    objc_msgSend_clientDetectedStoreChange_(v45, v50, (uint64_t)self, v51);
  }
  else
  {
    objc_msgSend_resetPoliteTimers(self, v42, v43, v44);
    long long v46 = BLJaliscoLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_21DFE3000, v46, OS_LOG_TYPE_DEFAULT, "Triggering clientDetectedStoreChangeAndAccountChange", buf, 2u);
    }

    objc_msgSend_clientDetectedStoreChangeAndAccountChange_(v45, v47, (uint64_t)self, v48);
  }
}

- (BOOL)isInitiallyLoadingJalisco
{
  return self->_initiallyLoadingJalisco;
}

- (BLJaliscoDAAPClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BLJaliscoDAAPClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BLImageManager)imageManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageManagerDelegate);

  return (BLImageManager *)WeakRetained;
}

- (void)setImageManagerDelegate:(id)a3
{
}

- (unint64_t)currentServerGeneration
{
  return self->_currentServerGeneration;
}

- (void)setCurrentServerGeneration:(unint64_t)a3
{
  self->_currentServerGeneration = a3;
}

- (unint64_t)pendingUpdateGeneration
{
  return self->_pendingUpdateGeneration;
}

- (void)setPendingUpdateGeneration:(unint64_t)a3
{
  self->_pendingUpdateGeneration = a3;
}

- (id)resetJaliscoStatusHandler
{
  return self->_resetJaliscoStatusHandler;
}

- (void)setResetJaliscoStatusHandler:(id)a3
{
}

- (OS_dispatch_queue)dsidQueue
{
  return self->_dsidQueue;
}

- (void)setDsidQueue:(id)a3
{
}

- (NSMutableDictionary)swqDSIDToDAAPServer
{
  return self->_swqDSIDToDAAPServer;
}

- (void)setSwqDSIDToDAAPServer:(id)a3
{
}

- (NSMutableSet)purchaseDAAPSyncsInFlight
{
  return self->_purchaseDAAPSyncsInFlight;
}

- (void)setPurchaseDAAPSyncsInFlight:(id)a3
{
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_purchaseDAAPSyncsInFlight, 0);
  objc_storeStrong((id *)&self->_swqDSIDToDAAPServer, 0);
  objc_storeStrong((id *)&self->_dsidQueue, 0);
  objc_storeStrong(&self->_resetJaliscoStatusHandler, 0);
  objc_destroyWeak((id *)&self->_imageManagerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverWorkerQueue, 0);
  objc_storeStrong((id *)&self->_familyCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);

  objc_storeStrong((id *)&self->_currentAccountNumber, 0);
}

@end