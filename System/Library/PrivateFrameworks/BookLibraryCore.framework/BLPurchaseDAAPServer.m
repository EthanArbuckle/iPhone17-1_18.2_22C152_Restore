@interface BLPurchaseDAAPServer
+ (id)_clientIdentifier;
+ (id)sharedSession;
- (BLPrivacyInfo)privacyInfo;
- (BLPurchaseDAAPServer)initWithDSID:(id)a3 delegate:(id)a4 privacyInfo:(id)a5;
- (BLPurchaseDAAPServerDelegate)delegate;
- (BOOL)_canMakeDAAPRequest;
- (BOOL)_isGDPRPrivacyAcknowledgementRequired;
- (BOOL)_saveInMoc:(id)a3 error:(id *)a4;
- (BOOL)_updatePersistentServerRevision:(id)a3 database:(id)a4 items:(id)a5 error:(id *)a6;
- (BOOL)isPrimaryAccount;
- (BOOL)isServerSetup;
- (BOOL)isServerSetupPending;
- (NSNumber)bagDatabaseID;
- (NSNumber)dsid;
- (NSNumber)sessionID;
- (id)_dataForArtRequest:(BOOL)a3;
- (id)_dataForHideItemsRequestWithStoreIDs:(id)a3;
- (id)_dataForItemsRequestWithLocalVersion:(id)a3 serverVersion:(id)a4 tokenPairs:(id)a5;
- (id)_localServerDatabaseRevisionInMoc:(id)a3;
- (id)_newDefaultAuthenticateOptions;
- (id)_processResponse:(id)a3;
- (id)_updatePersistentDatabase:(id)a3 server:(id)a4 moc:(id)a5 error:(id *)a6;
- (id)_updatePersistentItems:(id)a3 moc:(id)a4 database:(id)a5 error:(id *)a6;
- (id)_updatePersistentServerRevision:(id)a3 moc:(id)a4 error:(id *)a5;
- (id)additionalAudiobookInfoKeys;
- (id)bookletKeys;
- (id)daapMetaDataFilterString;
- (id)daapQueryFilterString;
- (void)_configureWithReason:(int64_t)a3 completion:(id)a4;
- (void)_fetchDatabaseWithReason:(int64_t)a3 localServerRevision:(id)a4 latestVersion:(id)a5 completionHandler:(id)a6;
- (void)_fetchDatabaseWithRequest:(id)a3 completionHandler:(id)a4;
- (void)_fetchItemsWithLocalVersion:(id)a3 serverVersion:(id)a4 reason:(int64_t)a5 tokenPairs:(id)a6 completionHandler:(id)a7;
- (void)_loginWithReason:(int64_t)a3 completion:(id)a4;
- (void)_loginWithRequest:(id)a3 completion:(id)a4;
- (void)_pollLatestRevisionWithReason:(int64_t)a3 completion:(id)a4;
- (void)_preProcessResponse:(id)a3 error:(id)a4 responseBlock:(id)a5;
- (void)_sendHandlers:(id)a3 success:(BOOL)a4;
- (void)_sendSetupConfigurationHandlersWithSuccess:(BOOL)a3;
- (void)_setSessionID:(id)a3;
- (void)_shouldMakeRequest:(id)a3;
- (void)_updateVersionAfterHideRequest:(id)a3;
- (void)appRefreshesOnLaunchWithCompletionHandler:(id)a3;
- (void)contextDidSave:(id)a3;
- (void)databaseIDWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)fetchAllItemsPolitely:(BOOL)a3 reason:(int64_t)a4 queue:(id)a5 completion:(id)a6;
- (void)forcedRefreshFrequencyWithCompletionHandler:(id)a3;
- (void)handleClientExpired;
- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4;
- (void)pollingFrequencyWithCompletionHandler:(id)a3;
- (void)resetWithQueue:(id)a3;
- (void)serverParametersWithCompletionHandler:(id)a3;
- (void)setBagDatabaseID:(id)a3;
- (void)setDAAPReconnectToTimeIntervalSinceNow:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDsid:(id)a3;
- (void)setIsServerSetup:(BOOL)a3;
- (void)setIsServerSetupPending:(BOOL)a3;
- (void)setPrivacyInfo:(id)a3;
- (void)setupWithReason:(int64_t)a3 queue:(id)a4 completion:(id)a5;
- (void)timeIntervalFromDAAPBagKey:(id)a3 completion:(id)a4;
- (void)updateItemImageURLsIgnoringCache:(BOOL)a3 completion:(id)a4;
- (void)valueForDAAPBagKey:(id)a3 completion:(id)a4;
@end

@implementation BLPurchaseDAAPServer

+ (id)sharedSession
{
  if (qword_26AB3FF90 != -1) {
    dispatch_once(&qword_26AB3FF90, &unk_26CED3F30);
  }
  v2 = (void *)qword_26AB3FF88;

  return v2;
}

+ (id)_clientIdentifier
{
  return @"com.apple.iBooks";
}

- (void)valueForDAAPBagKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E026288;
  v12[3] = &unk_26448C4D0;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  objc_msgSend_serverParametersWithCompletionHandler_(self, v10, (uint64_t)v12, v11);
}

- (void)timeIntervalFromDAAPBagKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E02643C;
  v9[3] = &unk_26448C4F8;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend_valueForDAAPBagKey_completion_(self, v8, (uint64_t)a3, (uint64_t)v9);
}

- (void)appRefreshesOnLaunchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E026584;
  v7[3] = &unk_26448C4F8;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_valueForDAAPBagKey_completion_(self, v6, @"update-on-app-focus-enabled", (uint64_t)v7);
}

- (void)pollingFrequencyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E0266D4;
  v7[3] = &unk_26448C520;
  void v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_timeIntervalFromDAAPBagKey_completion_(self, v6, @"update-polling-frequency-seconds", (uint64_t)v7);
}

- (void)databaseIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E0267B4;
  v7[3] = &unk_26448C4F8;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_valueForDAAPBagKey_completion_(self, v6, @"database-id", (uint64_t)v7);
}

- (void)forcedRefreshFrequencyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E0268F8;
  v7[3] = &unk_26448C548;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_timeIntervalFromDAAPBagKey_completion_(self, v6, @"forced-refresh-frequency-minutes", (uint64_t)v7);
}

- (void)resetWithQueue:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E026984;
  block[3] = &unk_26448C570;
  block[4] = self;
  dispatch_async((dispatch_queue_t)a3, block);
}

- (void)serverParametersWithCompletionHandler:(id)a3
{
  id v7 = a3;
  bag = self->_bag;
  if (!bag)
  {
    objc_msgSend_defaultBag(MEMORY[0x263F2BA48], v4, v5, v6);
    id v9 = (BUBag *)objc_claimAutoreleasedReturnValue();
    id v10 = self->_bag;
    self->_bag = v9;

    bag = self->_bag;
  }
  uint64_t v11 = objc_msgSend_purchaseDAAP(bag, v4, v5, v6);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21E026AD0;
  v15[3] = &unk_26448C598;
  id v12 = v7;
  id v16 = v12;
  objc_msgSend_valueWithCompletion_(v11, v13, (uint64_t)v15, v14);
}

- (id)_dataForArtRequest:(BOOL)a3
{
  v121[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, a3, v3);
  v104 = objc_msgSend_newManagedObjectContext(v5, v6, v7, v8);

  id v12 = objc_msgSend_sharedSource(BLJaliscoServerSource, v9, v10, v11);
  id v16 = objc_msgSend_dsid(self, v13, v14, v15);
  v121[0] = v16;
  v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v17, (uint64_t)v121, 1);
  v105 = objc_msgSend_itemsFetchRequestForDSIDs_(v12, v19, (uint64_t)v18, v20);

  v120[0] = @"storeID";
  v120[1] = @"cloudID";
  v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v21, (uint64_t)v120, 2);
  objc_msgSend_setPropertiesToFetch_(v105, v23, (uint64_t)v22, v24);

  id v115 = 0;
  v26 = objc_msgSend_executeFetchRequest_error_(v104, v25, (uint64_t)v105, (uint64_t)&v115);
  v101 = v26;
  id v102 = v115;
  if (v26)
  {
    v106 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF980], v27, (uint64_t)v26, v28, v26);
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v29 = v26;
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v111, (uint64_t)v119, 16);
    if (v34)
    {
      uint64_t v35 = *(void *)v112;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v112 != v35) {
            objc_enumerationMutation(v29);
          }
          v37 = *(void **)(*((void *)&v111 + 1) + 8 * i);
          v41 = objc_msgSend_storeID(v37, v31, v32, v33);
          if (!a3)
          {
            v42 = objc_msgSend_sharedClient(BLJaliscoDAAPClient, v38, v39, v40);
            v46 = objc_msgSend_imageManagerDelegate(v42, v43, v44, v45);
            int v49 = objc_msgSend_imageExistsForStoreID_(v46, v47, (uint64_t)v41, v48);

            if (v49) {
              objc_msgSend_removeObject_(v106, v50, (uint64_t)v37, v51);
            }
          }
        }
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v31, (uint64_t)&v111, (uint64_t)v119, 16);
      }
      while (v34);
    }

    if (objc_msgSend_count(v106, v52, v53, v54))
    {
      int v58 = objc_msgSend_count(v106, v55, v56, v57);
      v62 = objc_msgSend_date(MEMORY[0x263EFF910], v59, v60, v61);
      objc_msgSend_timeIntervalSince1970(v62, v63, v64, v65);
      double v67 = v66;

      v68 = objc_alloc_init(BLDAAPBuffer);
      uint64_t v69 = (16 * v58);
      objc_msgSend_appendHeader_size_(v68, v70, 1634026049, (v69 + 32));
      objc_msgSend_appendUInt32_withCode_(v68, v71, v67, 1836282979);
      v75 = objc_msgSend_sessionID(self, v72, v73, v74);
      uint64_t v79 = objc_msgSend_unsignedIntValue(v75, v76, v77, v78);
      objc_msgSend_appendUInt32_withCode_(v68, v80, v79, 1835821412);

      objc_msgSend_appendHeader_size_(v68, v81, 1835623521, v69);
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      v82 = v106;
      uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v83, (uint64_t)&v107, (uint64_t)v118, 16);
      if (v87)
      {
        uint64_t v88 = *(void *)v108;
        do
        {
          for (uint64_t j = 0; j != v87; ++j)
          {
            if (*(void *)v108 != v88) {
              objc_enumerationMutation(v82);
            }
            v90 = objc_msgSend_cloudID(*(void **)(*((void *)&v107 + 1) + 8 * j), v84, v85, v86);
            uint64_t v94 = objc_msgSend_unsignedLongLongValue(v90, v91, v92, v93);

            objc_msgSend_appendUInt64_withCode_(v68, v95, v94, 1835625572);
          }
          uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v84, (uint64_t)&v107, (uint64_t)v118, 16);
        }
        while (v87);
      }

      v99 = objc_msgSend_data(v68, v96, v97, v98);

      goto LABEL_25;
    }
  }
  v82 = BLJaliscoLog();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v117 = v102;
    _os_log_impl(&dword_21DFE3000, v82, OS_LOG_TYPE_ERROR, "Art Request: Couldn't find items to refresh artwork with.  %@", buf, 0xCu);
  }
  v99 = 0;
LABEL_25:

  return v99;
}

- (void)updateItemImageURLsIgnoringCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = BLJaliscoLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = objc_msgSend_dsid(self, v8, v9, v10);
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = v4;
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEBUG, "Art Request: updateItemImageURLsIgnoringCache %d dsid:%@", (uint8_t *)&buf, 0x12u);
  }
  objc_initWeak(&buf, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21E027350;
  v15[3] = &unk_26448C638;
  void v15[4] = self;
  id v12 = v6;
  id v16 = v12;
  BOOL v18 = v4;
  objc_copyWeak(&v17, &buf);
  objc_msgSend__shouldMakeRequest_(self, v13, (uint64_t)v15, v14);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&buf);
}

- (id)_dataForHideItemsRequestWithStoreIDs:(id)a3
{
  v106[1] = *MEMORY[0x263EF8340];
  id v97 = a3;
  uint64_t v7 = objc_msgSend_sharedSource(BLJaliscoServerSource, v4, v5, v6);
  uint64_t v98 = objc_msgSend_newManagedObjectContext(v7, v8, v9, v10);

  uint64_t v14 = objc_msgSend_sharedSource(BLJaliscoServerSource, v11, v12, v13);
  BOOL v18 = objc_msgSend_dsid(self, v15, v16, v17);
  v106[0] = v18;
  __int16 v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, (uint64_t)v106, 1);
  uint64_t v22 = objc_msgSend_fetchRequestForStoreIDs_dsids_(v14, v21, (uint64_t)v97, (uint64_t)v20);

  v105 = @"cloudID";
  uint64_t v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v23, (uint64_t)&v105, 1);
  objc_msgSend_setPropertiesToFetch_(v22, v25, (uint64_t)v24, v26);

  id v103 = 0;
  uint64_t v28 = objc_msgSend_executeFetchRequest_error_(v98, v27, (uint64_t)v22, (uint64_t)&v103);
  id v96 = v103;
  if (objc_msgSend_count(v28, v29, v30, v31))
  {
    uint64_t v35 = objc_msgSend_sharedSource(BLJaliscoServerSource, v32, v33, v34);
    uint64_t v39 = objc_msgSend_newManagedObjectContext(v35, v36, v37, v38);

    v42 = objc_msgSend__localServerDatabaseRevisionInMoc_(self, v40, (uint64_t)v39, v41);

    int v46 = objc_msgSend_count(v28, v43, v44, v45);
    v50 = objc_msgSend_date(MEMORY[0x263EFF910], v47, v48, v49);
    objc_msgSend_timeIntervalSince1970(v50, v51, v52, v53);
    double v55 = v54;

    uint64_t v56 = objc_alloc_init(BLDAAPBuffer);
    uint64_t v57 = (16 * v46);
    objc_msgSend_appendHeader_size_(v56, v58, 1835360882, (v57 + 65));
    objc_msgSend_appendUInt32_withCode_(v56, v59, v55, 1836282979);
    v63 = objc_msgSend_sessionID(self, v60, v61, v62);
    uint64_t v67 = objc_msgSend_unsignedIntValue(v63, v64, v65, v66);
    objc_msgSend_appendUInt32_withCode_(v56, v68, v67, 1835821412);

    uint64_t v72 = objc_msgSend_unsignedIntValue(v42, v69, v70, v71);
    objc_msgSend_appendUInt32_withCode_(v56, v73, v72, 1836413810);
    objc_msgSend_appendUInt8_withCode_(v56, v74, 2, 1835625316);
    objc_msgSend_appendHeader_size_(v56, v75, 1835623521, v57);
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v76 = v28;
    uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v77, (uint64_t)&v99, (uint64_t)v104, 16);
    if (v81)
    {
      uint64_t v82 = *(void *)v100;
      do
      {
        for (uint64_t i = 0; i != v81; ++i)
        {
          if (*(void *)v100 != v82) {
            objc_enumerationMutation(v76);
          }
          v84 = objc_msgSend_cloudID(*(void **)(*((void *)&v99 + 1) + 8 * i), v78, v79, v80);
          uint64_t v88 = objc_msgSend_unsignedLongLongValue(v84, v85, v86, v87);

          objc_msgSend_appendUInt64_withCode_(v56, v89, v88, 1835625572);
        }
        uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v78, (uint64_t)&v99, (uint64_t)v104, 16);
      }
      while (v81);
    }

    objc_msgSend_appendUInt32_withCode_(v56, v90, 0x400000, 1634028907);
    uint64_t v94 = objc_msgSend_data(v56, v91, v92, v93);
  }
  else
  {
    uint64_t v94 = 0;
  }

  return v94;
}

- (void)_updateVersionAfterHideRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_objectForKey_(a3, a2, @"dmap.serverrevision", v3);
  uint64_t v9 = objc_msgSend_sharedSource(BLJaliscoServerSource, v6, v7, v8);
  uint64_t v13 = objc_msgSend_newManagedObjectContext(v9, v10, v11, v12);

  if (!v5)
  {
    uint64_t v17 = BLJaliscoLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_21DFE3000, v17, OS_LOG_TYPE_ERROR, "No server version returned in kDMAPEditCommandBulkResponseCode", buf, 2u);
    }
    goto LABEL_8;
  }
  id v19 = 0;
  id v15 = (id)objc_msgSend__updatePersistentServerRevision_moc_error_(self, v14, (uint64_t)v5, (uint64_t)v13, &v19);
  uint64_t v16 = v19;
  if (v16)
  {
    uint64_t v17 = v16;
    BOOL v18 = BLJaliscoLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      v21 = v17;
      _os_log_impl(&dword_21DFE3000, v18, OS_LOG_TYPE_ERROR, "Error saving server version after hiding.  %@", buf, 0xCu);
    }

LABEL_8:
  }
}

- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = BLJaliscoLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend_dsid(self, v9, v10, v11);
    *(_DWORD *)id buf = 138412546;
    uint64_t v22 = v12;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "HideItems: dsid:%@ storeIDS:%@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_21E02891C;
  v17[3] = &unk_26448C6B0;
  v17[4] = self;
  id v13 = v7;
  id v19 = v13;
  id v14 = v6;
  id v18 = v14;
  objc_copyWeak(&v20, (id *)buf);
  objc_msgSend__shouldMakeRequest_(self, v15, (uint64_t)v17, v16);
  objc_destroyWeak(&v20);

  objc_destroyWeak((id *)buf);
}

- (void)setupWithReason:(int64_t)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E0295A8;
  v12[3] = &unk_26448C778;
  id v14 = v9;
  int64_t v15 = a3;
  void v12[4] = self;
  id v13 = v8;
  uint64_t v10 = v8;
  id v11 = v9;
  dispatch_async(v10, v12);
}

- (void)fetchAllItemsPolitely:(BOOL)a3 reason:(int64_t)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = BLJaliscoLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_msgSend_dsid(self, v13, v14, v15);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_21DFE3000, v12, OS_LOG_TYPE_DEFAULT, "Fetching purchase history for %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  int64_t v26 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E029CA4;
  block[3] = &unk_26448C980;
  block[4] = self;
  id v20 = v10;
  BOOL v23 = a3;
  id v21 = v11;
  p_long long buf = &buf;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v18, block);

  _Block_object_dispose(&buf, 8);
}

- (BLPurchaseDAAPServer)initWithDSID:(id)a3 delegate:(id)a4 privacyInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)BLPurchaseDAAPServer;
  uint64_t v12 = [(BLPurchaseDAAPServer *)&v36 init];
  if (v12)
  {
    id v13 = objc_alloc_init(BKPurchaseDAAPBackoff);
    backoff = v12->_backoff;
    v12->_backoff = v13;

    uint64_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("DAAP_Server_Update_Queue", v15);
    updateItemsQueue = v12->_updateItemsQueue;
    v12->_updateItemsQueue = (OS_dispatch_queue *)v16;

    id v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("DAAP_Server_Backoff_Queue", v18);
    backoffQueue = v12->_backoffQueue;
    v12->_backoffQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v12->_dsid, a3);
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v12->_privacyInfo, a5);
    id v24 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v21, v22, v23);
    uint64_t v28 = objc_msgSend_activeStoreAccount(v24, v25, v26, v27);
    uint64_t v32 = objc_msgSend_ams_DSID(v28, v29, v30, v31);
    v12->_primaryAccount = objc_msgSend_isEqualToNumber_(v32, v33, (uint64_t)v9, v34);
  }
  return v12;
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  backoff = self->_backoff;
  self->_backoff = 0;

  updateItemsQueue = self->_updateItemsQueue;
  if (updateItemsQueue)
  {
    self->_updateItemsQueue = 0;
  }
  backoffQueue = self->_backoffQueue;
  if (backoffQueue)
  {
    self->_backoffQueue = 0;
  }
  bag = self->_bag;
  self->_bag = 0;

  DAAPReconnectAt = self->_DAAPReconnectAt;
  self->_DAAPReconnectAt = 0;

  setupCompletionHandlers = self->_setupCompletionHandlers;
  self->_setupCompletionHandlers = 0;

  v14.receiver = self;
  v14.super_class = (Class)BLPurchaseDAAPServer;
  [(BLPurchaseDAAPServer *)&v14 dealloc];
}

- (void)contextDidSave:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)MEMORY[0x263F089F8];
  id v21 = v3;
  id v8 = objc_msgSend_object(v3, v5, v6, v7);
  uint64_t v12 = objc_msgSend_userInfo(v21, v9, v10, v11);
  objc_super v14 = objc_msgSend_notificationWithName_object_userInfo_(v4, v13, @"kJaliscoDAAPClientMOCDidSaveNotification", (uint64_t)v8, v12);

  id v18 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v15, v16, v17);
  objc_msgSend_postNotification_(v18, v19, (uint64_t)v14, v20);
}

- (BOOL)_saveInMoc:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v7, v8, v9);
  uint64_t v11 = *MEMORY[0x263EFF040];
  objc_msgSend_addObserver_selector_name_object_(v10, v12, (uint64_t)self, (uint64_t)sel_contextDidSave_, *MEMORY[0x263EFF040], v6);

  LOBYTE(a4) = objc_msgSend_save_(v6, v13, (uint64_t)a4, v14);
  id v18 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v15, v16, v17);
  objc_msgSend_removeObserver_name_object_(v18, v19, (uint64_t)self, v11, v6);

  return (char)a4;
}

- (id)_localServerDatabaseRevisionInMoc:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v5, v6, v7);
  int isUserSignedInToiTunes = objc_msgSend_isUserSignedInToiTunes(v8, v9, v10, v11);

  if (isUserSignedInToiTunes)
  {
    uint64_t v16 = objc_msgSend_sharedSource(BLJaliscoServerSource, v13, v14, v15);
    uint64_t v20 = objc_msgSend_dsid(self, v17, v18, v19);
    id v45 = 0;
    uint64_t v22 = objc_msgSend_serverInfoForDSID_fromManagedObjectContext_error_(v16, v21, (uint64_t)v20, (uint64_t)v4, &v45);
    id v23 = v45;

    if (v22)
    {
      uint64_t v27 = objc_msgSend_databaseVersion(v22, v24, v25, v26);
      uint64_t v28 = NSNumber;
      uint64_t v32 = objc_msgSend_unsignedLongLongValue(v27, v29, v30, v31);
      uint64_t v35 = objc_msgSend_numberWithUnsignedLongLong_(v28, v33, v32, v34);

      goto LABEL_10;
    }
    if (v23)
    {
      objc_super v36 = BLJaliscoLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = objc_msgSend_dsid(self, v37, v38, v39);
        *(_DWORD *)long long buf = 138412290;
        v47 = v40;
        _os_log_impl(&dword_21DFE3000, v36, OS_LOG_TYPE_ERROR, "Error fetching local info for %@", buf, 0xCu);
      }
      objc_msgSend_logRecursively(v23, v41, v42, v43);
    }
  }
  uint64_t v35 = objc_msgSend_numberWithInt_(NSNumber, v13, 0, v15);
LABEL_10:

  return v35;
}

- (BOOL)_updatePersistentServerRevision:(id)a3 database:(id)a4 items:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_21E02C4E4;
  v25[4] = sub_21E02C4F4;
  id v26 = v10;
  updateItemsQueue = self->_updateItemsQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_21E02C4FC;
  v18[3] = &unk_26448C9A8;
  id v19 = v12;
  uint64_t v20 = self;
  id v23 = &v27;
  id v24 = a6;
  id v21 = v11;
  uint64_t v22 = v25;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_sync(updateItemsQueue, v18);
  LOBYTE(v11) = *((unsigned char *)v28 + 24);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);
  return (char)v11;
}

- (id)_updatePersistentServerRevision:(id)a3 moc:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v13 = objc_msgSend_dsid(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_sharedSource(BLJaliscoServerSource, v14, v15, v16);
  id v39 = 0;
  id v19 = objc_msgSend_serverInfoForDSID_fromManagedObjectContext_error_(v17, v18, (uint64_t)v13, (uint64_t)v9, &v39);
  id v20 = v39;

  if (v19) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = v20 == 0;
  }
  if (v24)
  {
    if (!v19)
    {
      uint64_t v25 = [BLJaliscoServerInfo alloc];
      inited = objc_msgSend_initIntoManagedObjectContext_(v25, v26, (uint64_t)v9, v27);
      uint64_t v32 = objc_msgSend_stringValue(v13, v29, v30, v31);
      objc_msgSend_setUserUID_(inited, v33, (uint64_t)v32, v34);

      id v19 = inited;
    }
    uint64_t v35 = objc_msgSend_stringValue(v8, v21, v22, v23);
    objc_msgSend_setDatabaseVersion_(v19, v36, (uint64_t)v35, v37);
  }
  else
  {
    id v19 = 0;
    if (a5) {
      *a5 = v20;
    }
  }

  return v19;
}

- (id)_updatePersistentDatabase:(id)a3 server:(id)a4 moc:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v16 = objc_msgSend_sharedSource(BLJaliscoServerSource, v13, v14, v15);
  id v20 = objc_msgSend_dsid(self, v17, v18, v19);
  id v21 = NSNumber;
  uint64_t v25 = objc_msgSend_itemID(v10, v22, v23, v24);
  uint64_t v28 = objc_msgSend_numberWithUnsignedLongLong_(v21, v26, v25, v27);
  id v52 = 0;
  inited = objc_msgSend_serverDatabaseForDSID_withIdentifier_fromManagedObjectContext_error_(v16, v29, (uint64_t)v20, (uint64_t)v28, v12, &v52);
  id v31 = v52;

  if (inited || !v31)
  {
    if (!inited)
    {
      uint64_t v32 = [BLJaliscoServerDatabase alloc];
      inited = objc_msgSend_initIntoManagedObjectContext_(v32, v33, (uint64_t)v12, v34);
      objc_msgSend_setServer_(inited, v35, (uint64_t)v11, v36);
      uint64_t v37 = NSNumber;
      uint64_t v41 = objc_msgSend_itemID(v10, v38, v39, v40);
      uint64_t v44 = objc_msgSend_numberWithUnsignedLongLong_(v37, v42, v41, v43);
      uint64_t v48 = objc_msgSend_stringValue(v44, v45, v46, v47);
      objc_msgSend_setIdentifier_(inited, v49, (uint64_t)v48, v50);
    }
  }
  else
  {
    inited = 0;
    if (a6) {
      *a6 = v31;
    }
  }

  return inited;
}

- (id)_updatePersistentItems:(id)a3 moc:(id)a4 database:(id)a5 error:(id *)a6
{
  v380[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v353 = a4;
  v339 = v9;
  id v340 = a5;
  if (v9)
  {
    v341 = objc_msgSend_objectForKey_(v9, v10, @"dmap.listing", v11);
    v338 = objc_msgSend_objectForKey_(v9, v12, @"dmap.deletedidlisting", v13);
    uint64_t v17 = objc_msgSend_sharedSource(BLJaliscoServerSource, v14, v15, v16);
    id v21 = objc_msgSend_dsid(self, v18, v19, v20);
    v380[0] = v21;
    uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v22, (uint64_t)v380, 1);
    id v26 = objc_msgSend_allItemsFetchRequestForDSIDs_(v17, v24, (uint64_t)v23, v25);
    id v373 = 0;
    v346 = objc_msgSend_executeFetchRequest_error_(v353, v27, (uint64_t)v26, (uint64_t)&v373);
    id v337 = v373;

    if (v346)
    {
      id v31 = (void *)MEMORY[0x263EFF9C0];
      uint64_t v32 = objc_msgSend_count(v341, v28, v29, v30);
      v342 = objc_msgSend_setWithCapacity_(v31, v33, v32, v34);
      long long v371 = 0u;
      long long v372 = 0u;
      long long v369 = 0u;
      long long v370 = 0u;
      obuint64_t j = v341;
      uint64_t v345 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v369, (uint64_t)v379, 16);
      if (!v345) {
        goto LABEL_55;
      }
      uint64_t v344 = *(void *)v370;
      while (1)
      {
        for (uint64_t i = 0; i != v345; ++i)
        {
          if (*(void *)v370 != v344) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = *(void **)(*((void *)&v369 + 1) + 8 * i);
          uint64_t v39 = objc_msgSend_objectForKey_(v38, v36, @"com.apple.itunes.itms-songid", v37);
          uint64_t v40 = (void *)MEMORY[0x263F08A98];
          v347 = v39;
          uint64_t v44 = objc_msgSend_stringValue(v39, v41, v42, v43);
          v351 = objc_msgSend_predicateWithFormat_(v40, v45, @"storeID = %@", v46, v44, v337);

          uint64_t v49 = objc_msgSend_filteredArrayUsingPredicate_(v346, v47, (uint64_t)v351, v48);
          inited = objc_msgSend_lastObject(v49, v50, v51, v52);

          uint64_t v57 = inited;
          if (!inited)
          {
            uint64_t v85 = [BLJaliscoServerItem alloc];
            inited = objc_msgSend_initIntoManagedObjectContext_(v85, v86, (uint64_t)v353, v87);
            v90 = objc_msgSend_objectForKey_(v38, v88, @"com.apple.itunes.cloud-artwork-token", v89);
            objc_msgSend_setArtworkTokenCode_(inited, v91, (uint64_t)v90, v92);

            uint64_t v64 = objc_msgSend_objectForKey_(v38, v93, @"com.apple.itunes.cloud-artwork-url", v94);
            objc_msgSend_setArtworkURLString_(inited, v95, (uint64_t)v64, v96);
            goto LABEL_17;
          }
          uint64_t v61 = objc_msgSend_artworkTokenCode(inited, v54, v55, v56);
          if (v61)
          {
            uint64_t v62 = objc_msgSend_artworkURLString(inited, v58, v59, v60);
            BOOL v63 = v62 == 0;

            if (!v63)
            {
              uint64_t v64 = objc_msgSend_objectForKey_(v38, v58, @"com.apple.itunes.cloud-artwork-token", v60);
              uint64_t v70 = objc_msgSend_objectForKey_(v38, v65, @"com.apple.itunes.cloud-artwork-url", v66);
              if (v70)
              {
                if (v64)
                {
                  uint64_t v71 = objc_msgSend_artworkTokenCode(inited, v67, v68, v69);
                  char isEqualToString = objc_msgSend_isEqualToString_(v71, v72, (uint64_t)v64, v73);

                  if ((isEqualToString & 1) == 0)
                  {
                    uint64_t v77 = objc_msgSend_objectForKey_(v38, v75, @"com.apple.itunes.cloud-artwork-token", v76);
                    objc_msgSend_setArtworkTokenCode_(inited, v78, (uint64_t)v77, v79);

                    uint64_t v82 = objc_msgSend_objectForKey_(v38, v80, @"com.apple.itunes.cloud-artwork-url", v81);
                    objc_msgSend_setArtworkURLString_(inited, v83, (uint64_t)v82, v84);
                  }
                }
              }

LABEL_17:
            }
            uint64_t v57 = inited;
          }
          v348 = objc_msgSend_objectForKey_(v38, v58, @"com.apple.itunes.extended-media-kind", v60);
          v356 = v57;
          uint64_t v103 = objc_msgSend_unsignedIntegerValue(v348, v97, v98, v99);
          if (v103 == 8 && (objc_msgSend_isPrimaryAccount(self, v100, v101, v102) & 1) == 0) {
            objc_msgSend_bl_setNumberIfDifferent_value_(v57, v100, @"needsImport", MEMORY[0x263EFFA88]);
          }
          v104 = objc_msgSend_numberWithBool_(NSNumber, v100, v103 == 8, v102);
          objc_msgSend_bl_setNumberIfDifferent_value_(v57, v105, @"isAudiobook", (uint64_t)v104);

          long long v108 = objc_msgSend_objectForKey_(v38, v106, @"com.apple.itunes.itms-songid", v107);
          long long v112 = objc_msgSend_stringValue(v108, v109, v110, v111);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v113, @"storeID", (uint64_t)v112);

          long long v114 = NSNumber;
          uint64_t v118 = objc_msgSend_itemID(v38, v115, v116, v117);
          v121 = objc_msgSend_numberWithUnsignedLongLong_(v114, v119, v118, v120);
          v125 = objc_msgSend_stringValue(v121, v122, v123, v124);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v126, @"cloudID", (uint64_t)v125);

          v129 = objc_msgSend_objectForKey_(v38, v127, @"com.apple.itunes.display-publication-version", v128);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v130, @"displayVersion", (uint64_t)v129);

          v133 = objc_msgSend_objectForKey_(v38, v131, @"daap.songdisabled", v132);
          objc_msgSend_bl_setNumberIfDifferent_value_(v57, v134, @"isDisabled", (uint64_t)v133);

          v137 = objc_msgSend_objectForKey_(v38, v135, @"daap.songcontentrating", v136);
          objc_msgSend_bl_setNumberIfDifferent_value_(v57, v138, @"isExplicit", (uint64_t)v137);

          v141 = objc_msgSend_objectForKey_(v38, v139, @"dmap.itemhidden", v140);
          objc_msgSend_bl_setNumberIfDifferent_value_(v57, v142, @"isHidden", (uint64_t)v141);

          v145 = objc_msgSend_objectForKey_(v38, v143, @"com.apple.itunes.cloud-purchased-token", v144);
          v149 = objc_msgSend_stringValue(v145, v146, v147, v148);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v150, @"purchasedTokenCode", (uint64_t)v149);

          v153 = objc_msgSend_objectForKey_(v38, v151, @"dmap.longitemid", v152);
          objc_msgSend_bl_setNumberIfDifferent_value_(v57, v154, @"purchaseHistoryID", (uint64_t)v153);

          v157 = objc_msgSend_objectForKey_(v38, v155, @"daap.songartist", v156);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v158, @"artist", (uint64_t)v157);

          v161 = objc_msgSend_objectForKey_(v38, v159, @"daap.sortartist", v160);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v162, @"sortedAuthor", (uint64_t)v161);

          v165 = objc_msgSend_objectForKey_(v38, v163, @"daap.songgenre", v164);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v166, @"genre", (uint64_t)v165);

          v170 = objc_msgSend_name(v38, v167, v168, v169);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v171, @"title", (uint64_t)v170);

          v174 = objc_msgSend_objectForKey_(v38, v172, @"daap.sortname", v173);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v175, @"sortedTitle", (uint64_t)v174);

          v178 = objc_msgSend_objectForKey_(v38, v176, @"daap.songdatepurchased", v177);
          objc_msgSend_bl_setDateIfDifferent_value_(v57, v179, @"purchasedAt", (uint64_t)v178);

          v182 = objc_msgSend_objectForKey_(v38, v180, @"com.apple.itunes.item-flavor-listing", v181);
          v354 = objc_msgSend_lastObject(v182, v183, v184, v185);

          v188 = objc_msgSend_objectForKey_(v354, v186, @"com.apple.itunes.item-redownload-param-2", v187);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v189, @"storeDownloadParameters", (uint64_t)v188);

          v192 = objc_msgSend_objectForKey_(v354, v190, @"daap.songformat", v191);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v193, @"fileExtension", (uint64_t)v192);

          v196 = objc_msgSend_objectForKey_(v38, v194, @"com.apple.itunes.preorder-expected-date", v195);
          objc_msgSend_bl_setDateIfDifferent_value_(v57, v197, @"expectedDate", (uint64_t)v196);

          v200 = objc_msgSend_objectForKey_(v38, v198, @"com.apple.itunes.chapter-metadata-url", v199);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v201, @"chapterMetadataURLString", (uint64_t)v200);

          v204 = objc_msgSend_objectForKey_(v38, v202, @"com.apple.itunes.store.hls-playback-url", v203);
          objc_msgSend_bl_setStringIfDifferent_value_(v57, v205, @"hlsPlaylistURLString", (uint64_t)v204);

          v209 = objc_msgSend_dsid(self, v206, v207, v208);
          objc_msgSend_bl_setNumberIfDifferent_value_(v57, v210, @"storeAccountID", (uint64_t)v209);

          v349 = objc_msgSend_objectForKey_(v38, v211, @"booklets", v212);
          v216 = objc_msgSend_booklets(v57, v213, v214, v215);
          v220 = objc_msgSend_allObjects(v216, v217, v218, v219);

          long long v367 = 0u;
          long long v368 = 0u;
          long long v365 = 0u;
          long long v366 = 0u;
          id v355 = v349;
          uint64_t v224 = objc_msgSend_countByEnumeratingWithState_objects_count_(v355, v221, (uint64_t)&v365, (uint64_t)v378, 16);
          if (v224)
          {
            uint64_t v225 = *(void *)v366;
            do
            {
              for (uint64_t j = 0; j != v224; ++j)
              {
                if (*(void *)v366 != v225) {
                  objc_enumerationMutation(v355);
                }
                v227 = *(void **)(*((void *)&v365 + 1) + 8 * j);
                v228 = objc_msgSend_objectForKey_(v227, v222, @"com.apple.itunes.store.booklet-item-store-id", v223);
                v232 = objc_msgSend_stringValue(v228, v229, v230, v231);

                v235 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v233, @"storeID == %@", v234, v232);
                v238 = objc_msgSend_filteredArrayUsingPredicate_(v220, v236, (uint64_t)v235, v237);
                v242 = objc_msgSend_lastObject(v238, v239, v240, v241);

                if (!v242)
                {
                  v244 = [BLJaliscoServerBookletItem alloc];
                  v242 = objc_msgSend_initIntoManagedObjectContext_(v244, v245, (uint64_t)v353, v246);
                }
                objc_msgSend_bl_setStringIfDifferent_value_(v242, v243, @"storeID", (uint64_t)v232);
                v249 = objc_msgSend_objectForKey_(v227, v247, @"com.apple.itunes.store.booklet-item-name", v248);
                objc_msgSend_bl_setStringIfDifferent_value_(v242, v250, @"title", (uint64_t)v249);

                v253 = objc_msgSend_objectForKey_(v227, v251, @"com.apple.itunes.store.booklet-item-redownload-param", v252);
                objc_msgSend_bl_setStringIfDifferent_value_(v242, v254, @"storeDownloadParameters", (uint64_t)v253);

                v257 = objc_msgSend_objectForKey_(v227, v255, @"com.apple.itunes.store.booklet-item-size", v256);
                objc_msgSend_bl_setNumberIfDifferent_value_(v242, v258, @"size", (uint64_t)v257);

                objc_msgSend_setParentItem_(v242, v259, (uint64_t)v356, v260);
              }
              uint64_t v224 = objc_msgSend_countByEnumeratingWithState_objects_count_(v355, v222, (uint64_t)&v365, (uint64_t)v378, 16);
            }
            while (v224);
          }

          id v261 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          long long v363 = 0u;
          long long v364 = 0u;
          long long v361 = 0u;
          long long v362 = 0u;
          v265 = objc_msgSend_additionalAudiobookInfoKeys(self, v262, v263, v264);
          uint64_t v269 = objc_msgSend_countByEnumeratingWithState_objects_count_(v265, v266, (uint64_t)&v361, (uint64_t)v377, 16);
          if (v269)
          {
            uint64_t v270 = *(void *)v362;
            do
            {
              for (uint64_t k = 0; k != v269; ++k)
              {
                if (*(void *)v362 != v270) {
                  objc_enumerationMutation(v265);
                }
                v272 = *(void **)(*((void *)&v361 + 1) + 8 * k);
                v273 = objc_msgSend_objectForKey_(v38, v267, (uint64_t)v272, v268);
                if (objc_msgSend_isEqualToString_(v272, v274, @"daap.songtime", v275))
                {
                  uint64_t v278 = objc_msgSend_objectForKey_(v354, v276, @"daap.songtime", v277);

                  v273 = (void *)v278;
                }
                if (v273) {
                  objc_msgSend_setObject_forKey_(v261, v276, (uint64_t)v273, (uint64_t)v272);
                }
              }
              uint64_t v269 = objc_msgSend_countByEnumeratingWithState_objects_count_(v265, v267, (uint64_t)&v361, (uint64_t)v377, 16);
            }
            while (v269);
          }

          if (objc_msgSend_count(v261, v279, v280, v281))
          {
            v285 = objc_msgSend_copy(v261, v282, v283, v284);
            objc_msgSend_bl_setDictionaryIfDifferent_value_(v356, v286, @"additionalAudiobookInfo", (uint64_t)v285);
          }
          v287 = BLJaliscoLog();
          if (os_log_type_enabled(v287, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            v376 = v356;
            _os_log_impl(&dword_21DFE3000, v287, OS_LOG_TYPE_DEBUG, "[BLPurchaseDAAPServer] Setup item:%@", buf, 0xCu);
          }

          v291 = objc_msgSend_purchasedTokenCode(v356, v288, v289, v290);
          if (objc_msgSend_length(v291, v292, v293, v294))
          {
            v298 = objc_msgSend_storeID(v356, v295, v296, v297);
            BOOL v302 = objc_msgSend_length(v298, v299, v300, v301) == 0;

            if (!v302)
            {
              objc_msgSend_addObject_(v342, v303, (uint64_t)v356, v304);
              goto LABEL_53;
            }
          }
          else
          {
          }
          v305 = BLJaliscoLog();
          if (os_log_type_enabled(v305, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v376 = v356;
            _os_log_impl(&dword_21DFE3000, v305, OS_LOG_TYPE_ERROR, "ERROR: No token/adam id for %@", buf, 0xCu);
          }

LABEL_53:
        }
        uint64_t v345 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v369, (uint64_t)v379, 16);
        if (!v345)
        {
LABEL_55:

          objc_msgSend_addItems_(v340, v306, (uint64_t)v342, v307);
          v308 = BLJaliscoLog();
          if (os_log_type_enabled(v308, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            v376 = v342;
            _os_log_impl(&dword_21DFE3000, v308, OS_LOG_TYPE_DEFAULT, "[BLPurchaseDAAPServer] Adding items to db:%@ ", buf, 0xCu);
          }

          if (objc_msgSend_count(v338, v309, v310, v311))
          {
            v315 = (void *)MEMORY[0x263F08A98];
            v316 = objc_msgSend_valueForKey_(v338, v312, @"stringValue", v314);
            v319 = objc_msgSend_predicateWithFormat_(v315, v317, @"cloudID IN %@", v318, v316, v337);

            objc_msgSend_filteredArrayUsingPredicate_(v346, v320, (uint64_t)v319, v321);
            long long v359 = 0u;
            long long v360 = 0u;
            long long v357 = 0u;
            long long v358 = 0u;
            id v322 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v327 = objc_msgSend_countByEnumeratingWithState_objects_count_(v322, v323, (uint64_t)&v357, (uint64_t)v374, 16);
            if (v327)
            {
              uint64_t v328 = *(void *)v358;
              do
              {
                for (uint64_t m = 0; m != v327; ++m)
                {
                  if (*(void *)v358 != v328) {
                    objc_enumerationMutation(v322);
                  }
                  v330 = *(void **)(*((void *)&v357 + 1) + 8 * m);
                  v331 = objc_msgSend_managedObjectContext(v330, v324, v325, v326);
                  objc_msgSend_deleteObject_(v331, v332, (uint64_t)v330, v333);
                }
                uint64_t v327 = objc_msgSend_countByEnumeratingWithState_objects_count_(v322, v324, (uint64_t)&v357, (uint64_t)v374, 16);
              }
              while (v327);
            }
          }
          v334 = objc_msgSend_items(v340, v312, v313, v314);

          goto LABEL_74;
        }
      }
    }
    v334 = 0;
    if (a6) {
      *a6 = v337;
    }
LABEL_74:
  }
  else
  {
    if (a6)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v10, @"com.apple.ibooks.jalisco.updating", 400, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v335 = BLJaliscoLog();
    v341 = v335;
    if (os_log_type_enabled(v335, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v335, OS_LOG_TYPE_ERROR, "NO UPDATE - daap items missing", buf, 2u);
    }
    v334 = 0;
  }

  return v334;
}

- (void)_sendHandlers:(id)a3 success:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v10, (uint64_t)v14, 16);
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v9, (uint64_t)&v10, (uint64_t)v14, 16);
    }
    while (v6);
  }
}

- (void)_sendSetupConfigurationHandlersWithSuccess:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend_setIsServerSetupPending_(self, a2, 0, v3);
  objc_msgSend_setIsServerSetup_(self, v6, v4, v7);
  setupCompletionHandlers = self->_setupCompletionHandlers;
  if (setupCompletionHandlers)
  {
    objc_msgSend__sendHandlers_success_(self, v8, (uint64_t)setupCompletionHandlers, v4);
    long long v10 = self->_setupCompletionHandlers;
    self->_setupCompletionHandlers = 0;
  }
}

- (BOOL)_isGDPRPrivacyAcknowledgementRequired
{
  uint64_t v7 = objc_msgSend_privacyInfo(self, a2, v2, v3);
  if (!v7)
  {
    uint64_t v8 = BLJaliscoLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "Privacy info is nil.", buf, 2u);
    }
  }
  int isGDPRPrivacyAcknowledgementRequired = objc_msgSend_isGDPRPrivacyAcknowledgementRequired(v7, v4, v5, v6);
  if (isGDPRPrivacyAcknowledgementRequired)
  {
    long long v10 = BLJaliscoLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v12 = 0;
      _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_ERROR, "Ignoring request due to user has not accepted Books GDPR.", v12, 2u);
    }
  }
  return isGDPRPrivacyAcknowledgementRequired;
}

- (void)_shouldMakeRequest:(id)a3
{
  id v4 = a3;
  backoffQueue = self->_backoffQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E02E31C;
  v7[3] = &unk_26448C9D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(backoffQueue, v7);
}

- (void)_preProcessResponse:(id)a3 error:(id)a4 responseBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  backoffQueue = self->_backoffQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21E02E608;
  v15[3] = &unk_26448C9F8;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(backoffQueue, v15);
}

- (id)_newDefaultAuthenticateOptions
{
  uint64_t v2 = objc_opt_new();
  objc_msgSend_setAuthenticationType_(v2, v3, 1, v4);
  objc_msgSend_setDebugReason_(v2, v5, @"Books jalisco purchase", v6);
  return v2;
}

- (id)_processResponse:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_decodeData_(BLPurchaseDAAPParser, v5, (uint64_t)v4, v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = objc_msgSend_objectForKey_(v7, v8, @"dmap.status", v9);
    if (objc_msgSend_unsignedIntValue(v10, v11, v12, v13) == 200)
    {
      id v17 = v7;
    }
    else
    {
      if (objc_msgSend_unsignedIntValue(v10, v14, v15, v16) == 952)
      {
        uint64_t v20 = objc_msgSend_objectForKey_(v7, v18, @"com.apple.itunes.reconnect-interval", v19);
        objc_msgSend_doubleValue(v20, v21, v22, v23);
        objc_msgSend_setDAAPReconnectToTimeIntervalSinceNow_(self, v24, v25, v26);
        uint64_t v27 = BLJaliscoLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          int v30 = 138412290;
          id v31 = v20;
          _os_log_impl(&dword_21DFE3000, v27, OS_LOG_TYPE_INFO, "DAAP reconnect %@", (uint8_t *)&v30, 0xCu);
        }
      }
      else
      {
        uint64_t v28 = BLJaliscoLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          int v30 = 138412290;
          id v31 = v7;
          _os_log_impl(&dword_21DFE3000, v28, OS_LOG_TYPE_ERROR, "Unrecognized DAAP Response: %@", (uint8_t *)&v30, 0xCu);
        }
      }
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)handleClientExpired
{
  int v4 = 0;
  atomic_compare_exchange_strong_explicit(dword_267D25408, (unsigned int *)&v4, 1u, memory_order_relaxed, memory_order_relaxed);
  if (!v4)
  {
    self->_clientExpired = 1;
    objc_msgSend_delegate(self, a2, v2, v3);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_purchaseServerHandleClientExpired(v8, v5, v6, v7);
  }
}

- (BOOL)_canMakeDAAPRequest
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_clientExpired) {
    return 0;
  }
  DAAPReconnectAt = self->_DAAPReconnectAt;
  if (DAAPReconnectAt)
  {
    uint64_t v7 = objc_msgSend_date(MEMORY[0x263EFF910], a2, v2, v3);
    uint64_t v10 = objc_msgSend_compare_(DAAPReconnectAt, v8, (uint64_t)v7, v9);

    if (v10 != -1)
    {
      long long v11 = BLJaliscoLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = self->_DAAPReconnectAt;
        int v14 = 138412290;
        uint64_t v15 = v12;
        _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_DEBUG, "Throttling request until %@", (uint8_t *)&v14, 0xCu);
      }

      return 0;
    }
    uint64_t v13 = self->_DAAPReconnectAt;
    self->_DAAPReconnectAt = 0;
  }
  return 1;
}

- (void)setDAAPReconnectToTimeIntervalSinceNow:(double)a3
{
  id v5 = objc_alloc(MEMORY[0x263EFF910]);
  self->_DAAPReconnectAt = (NSDate *)objc_msgSend_initWithTimeIntervalSinceNow_(v5, v6, v7, v8, a3);

  MEMORY[0x270F9A758]();
}

- (void)_configureWithReason:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_21E02F3D8;
  v10[3] = &unk_26448CA70;
  long long v11 = @"Server-info:";
  uint64_t v12 = self;
  id v13 = v6;
  int64_t v14 = a3;
  id v7 = v6;
  objc_msgSend__shouldMakeRequest_(self, v8, (uint64_t)v10, v9);
}

- (void)_loginWithReason:(int64_t)a3 completion:(id)a4
{
  id v14 = a4;
  id v6 = [BLDAAPLoginRequest alloc];
  uint64_t v10 = objc_msgSend_dsid(self, v7, v8, v9);
  uint64_t v12 = objc_msgSend_initWithDSID_reason_(v6, v11, (uint64_t)v10, a3);

  objc_msgSend__loginWithRequest_completion_(self, v13, (uint64_t)v12, (uint64_t)v14);
}

- (void)_loginWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E02FC14;
  v12[3] = &unk_26448CA98;
  id v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  objc_msgSend__shouldMakeRequest_(self, v10, (uint64_t)v12, v11);
}

- (void)_pollLatestRevisionWithReason:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_21E030280;
  v10[3] = &unk_26448CB10;
  void v10[4] = self;
  id v11 = v6;
  int64_t v12 = a3;
  id v7 = v6;
  objc_msgSend__shouldMakeRequest_(self, v8, (uint64_t)v10, v9);
}

- (void)_fetchDatabaseWithReason:(int64_t)a3 localServerRevision:(id)a4 latestVersion:(id)a5 completionHandler:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [BLDAAPDatabasesRequest alloc];
  id v17 = objc_msgSend_dsid(self, v14, v15, v16);
  id v21 = objc_msgSend_sessionID(self, v18, v19, v20);
  uint64_t v23 = objc_msgSend_initWithDSID_reason_sessionID_revisionNumber_delta_(v13, v22, (uint64_t)v17, a3, v21, v11, v10);

  if (v23)
  {
    objc_msgSend__fetchDatabaseWithRequest_completionHandler_(self, v24, (uint64_t)v23, (uint64_t)v12);
  }
  else
  {
    uint64_t v25 = BLJaliscoLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend_dsid(self, v26, v27, v28);
      uint64_t v33 = objc_msgSend_sessionID(self, v30, v31, v32);
      int v36 = 138413314;
      uint64_t v37 = v29;
      __int16 v38 = 2048;
      int64_t v39 = a3;
      __int16 v40 = 2114;
      uint64_t v41 = v33;
      __int16 v42 = 2114;
      id v43 = v11;
      __int16 v44 = 2114;
      id v45 = v10;
      _os_log_impl(&dword_21DFE3000, v25, OS_LOG_TYPE_ERROR, "DAAP DB Fetch: Missing a parameter type. dsid:(%@) reason:(%ld) sessionID: %{public}@ revisionNumber:%{public}@ delta:%{public}@", (uint8_t *)&v36, 0x34u);
    }
    uint64_t v34 = MEMORY[0x223C1EDC0](v12);
    uint64_t v35 = (void *)v34;
    if (v34) {
      (*(void (**)(uint64_t, void, void))(v34 + 16))(v34, 0, 0);
    }
  }
}

- (void)_fetchDatabaseWithRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_21E030E28;
    v14[3] = &unk_26448CB88;
    uint64_t v15 = @"DB Fetch:";
    id v18 = v7;
    id v16 = v6;
    id v17 = self;
    objc_msgSend__shouldMakeRequest_(self, v9, (uint64_t)v14, v10);

    id v11 = v15;
  }
  else
  {
    id v12 = BLJaliscoLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v20 = @"DB Fetch:";
      _os_log_impl(&dword_21DFE3000, v12, OS_LOG_TYPE_ERROR, "%@ No server revision or databaseRequest to fetch databases from.", buf, 0xCu);
    }

    uint64_t v13 = MEMORY[0x223C1EDC0](v8);
    id v11 = (void *)v13;
    if (v13) {
      (*(void (**)(uint64_t, void, void))(v13 + 16))(v13, 0, 0);
    }
  }
}

- (id)daapQueryFilterString
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_set(MEMORY[0x263EFF9C0], a2, v2, v3);
  if (objc_msgSend_isPrimaryAccount(self, v6, v7, v8)) {
    objc_msgSend_addObject_(v5, v9, (uint64_t)&unk_26CEE4078, v10);
  }
  objc_msgSend_addObject_(v5, v9, (uint64_t)&unk_26CEE4090, v10);
  id v12 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(@"com.apple.itunes.extended-media-kind", v11, @"-", @"\\-");
  uint64_t v13 = (void *)MEMORY[0x263EFF980];
  uint64_t v17 = objc_msgSend_count(v5, v14, v15, v16);
  uint64_t v20 = objc_msgSend_arrayWithCapacity_(v13, v18, v17, v19);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v21 = v5;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v26)
  {
    uint64_t v27 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v21);
        }
        uint64_t v29 = NSString;
        uint64_t v30 = objc_msgSend_intValue(*(void **)(*((void *)&v43 + 1) + 8 * i), v23, v24, v25);
        uint64_t v33 = objc_msgSend_stringWithFormat_(v29, v31, @"'%@:%d'", v32, v12, v30, (void)v43);
        objc_msgSend_addObject_(v20, v34, (uint64_t)v33, v35);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v43, (uint64_t)v47, 16);
    }
    while (v26);
  }

  __int16 v38 = objc_msgSend_componentsJoinedByString_(v20, v36, @",", v37);
  uint64_t v41 = objc_msgSend_stringWithFormat_(NSString, v39, @"(%@)", v40, v38);

  return v41;
}

- (id)daapMetaDataFilterString
{
  id v5 = objc_msgSend_additionalAudiobookInfoKeys(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_arrayByAddingObjectsFromArray_(&unk_26CEE40B8, v6, (uint64_t)v5, v7);

  id v12 = objc_msgSend_bookletKeys(self, v9, v10, v11);
  uint64_t v15 = objc_msgSend_arrayByAddingObjectsFromArray_(v8, v13, (uint64_t)v12, v14);

  id v18 = objc_msgSend_componentsJoinedByString_(v15, v16, @",", v17);

  return v18;
}

- (id)additionalAudiobookInfoKeys
{
  return &unk_26CEE40D0;
}

- (id)bookletKeys
{
  return &unk_26CEE40E8;
}

- (id)_dataForItemsRequestWithLocalVersion:(id)a3 serverVersion:(id)a4 tokenPairs:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v14 = v7;
  id v15 = a5;
  id v9 = v15;
  id v10 = v7;
  id v11 = v8;
  id v12 = ICDAAPUtilitiesCreateDataForContainer();

  return v12;
}

- (void)_fetchItemsWithLocalVersion:(id)a3 serverVersion:(id)a4 reason:(int64_t)a5 tokenPairs:(id)a6 completionHandler:(id)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = BLJaliscoLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_msgSend_dsid(self, v17, v18, v19);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v40 = v20;
    __int16 v41 = 2112;
    id v42 = v13;
    __int16 v43 = 2048;
    int64_t v44 = a5;
    _os_log_impl(&dword_21DFE3000, v16, OS_LOG_TYPE_DEFAULT, "[BLPurchaseDAAPServer] _fetchItemsWithLocalVersion dsid:%@ serverVersion:%@ reason:%ld", buf, 0x20u);
  }
  if (!v12
    || (objc_msgSend_bagDatabaseID(self, v21, v22, v23),
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        BOOL v25 = v24 == 0,
        v24,
        v25))
  {
    uint64_t v29 = BLJaliscoLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v29, OS_LOG_TYPE_ERROR, "No database to fetch items with.", buf, 2u);
    }

    uint64_t v30 = MEMORY[0x223C1EDC0](v15);
    uint64_t v28 = (void *)v30;
    if (v30) {
      (*(void (**)(uint64_t, void, void))(v30 + 16))(v30, 0, 0);
    }
  }
  else
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_21E032078;
    v31[3] = &unk_26448CCA0;
    uint64_t v32 = @"Fetch items";
    id v37 = v15;
    uint64_t v33 = self;
    id v34 = v12;
    id v35 = v13;
    id v36 = v14;
    int64_t v38 = a5;
    objc_msgSend__shouldMakeRequest_(self, v26, (uint64_t)v31, v27);

    uint64_t v28 = v32;
  }
}

- (BOOL)isServerSetup
{
  return self->_isServerSetup;
}

- (void)setIsServerSetup:(BOOL)a3
{
  self->_isServerSetup = a3;
}

- (BOOL)isServerSetupPending
{
  return self->_isServerSetupPending;
}

- (void)setIsServerSetupPending:(BOOL)a3
{
  self->_isServerSetupPending = a3;
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)_setSessionID:(id)a3
{
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (BOOL)isPrimaryAccount
{
  return self->_primaryAccount;
}

- (NSNumber)bagDatabaseID
{
  return self->_bagDatabaseID;
}

- (void)setBagDatabaseID:(id)a3
{
}

- (BLPurchaseDAAPServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BLPurchaseDAAPServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BLPrivacyInfo)privacyInfo
{
  return self->_privacyInfo;
}

- (void)setPrivacyInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bagDatabaseID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_backoffQueue, 0);
  objc_storeStrong((id *)&self->_updateItemsQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_backoff, 0);
  objc_storeStrong((id *)&self->_setupCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_DAAPReconnectAt, 0);

  objc_storeStrong((id *)&self->_lastPolledAt, 0);
}

@end