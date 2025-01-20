@interface BDSSyncEngineSaltManager
- (BDSSyncEngineSaltManager)initWithDatabase:(id)a3 observer:(id)a4;
- (BDSSyncEngineSaltManagerObserver)observer;
- (BOOL)establishedSalt;
- (BOOL)isSaltRefreshInProgress;
- (CKDatabase)database;
- (NSData)currentSalt;
- (NSString)currentSaltVersionIdentifier;
- (NSString)establishedSaltVersionIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_wq_saltedAndHashedIDFromLocalID:(id)a3;
- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4;
- (void)_updatedReachability;
- (void)invalidateSalt;
- (void)refreshSalt:(id)a3;
- (void)refreshSaltIfNeeded:(id)a3;
- (void)setCurrentSalt:(id)a3;
- (void)setCurrentSaltVersionIdentifier:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setIsSaltRefreshInProgress:(BOOL)a3;
- (void)setObserver:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)wq_invalidateSalt;
- (void)wq_refreshSalt:(id)a3;
@end

@implementation BDSSyncEngineSaltManager

- (BDSSyncEngineSaltManager)initWithDatabase:(id)a3 observer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BDSSyncEngineSaltManager;
  v9 = [(BDSSyncEngineSaltManager *)&v26 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeWeak((id *)&v10->_observer, v8);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.BDSSyncEngineSaltManager.workQueue", v11);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v12;

    v21 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v14, v15, v16, v17, v18, v19, v20);
    objc_msgSend_addObserver_selector_name_object_(v21, v22, (uint64_t)v10, (uint64_t)sel__updatedReachability, @"kNetworkReachabilityChangedNotification", 0, v23, v24);
  }
  return v10;
}

- (NSString)establishedSaltVersionIdentifier
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_2360BEF5C;
  uint64_t v17 = sub_2360BEF6C;
  id v18 = 0;
  v9 = objc_msgSend_workQueue(self, a2, v2, v3, v4, v5, v6, v7);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2360BEF74;
  v12[3] = &unk_264CA0AA8;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(v9, v12);

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSString *)v10;
}

- (void)refreshSalt:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_t v12 = objc_msgSend_workQueue(self, v5, v6, v7, v8, v9, v10, v11);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360BF0B4;
  block[3] = &unk_264CA0AD0;
  objc_copyWeak(&v16, &location);
  id v15 = v4;
  id v13 = v4;
  dispatch_async(v12, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)refreshSaltIfNeeded:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_t v12 = objc_msgSend_workQueue(self, v5, v6, v7, v8, v9, v10, v11);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360BF1F8;
  block[3] = &unk_264CA0AD0;
  objc_copyWeak(&v16, &location);
  id v15 = v4;
  id v13 = v4;
  dispatch_async(v12, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)wq_refreshSalt:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isSaltRefreshInProgress(self, v5, v6, v7, v8, v9, v10, v11))
  {
    id v18 = BDSCloudKitLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2360BC000, v18, OS_LOG_TYPE_DEFAULT, "BDSSyncEngineSaltManager: Salt refresh already in progress. Ignoring -refreshSalt: call", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    objc_msgSend_setIsSaltRefreshInProgress_(self, v12, 1, v13, v14, v15, v16, v17);
    objc_msgSend_wq_invalidateSalt(self, v19, v20, v21, v22, v23, v24, v25);
    objc_super v26 = BDSCloudKitLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2360BC000, v26, OS_LOG_TYPE_DEFAULT, "BDSSyncEngineSaltManager: Establishing record salt", (uint8_t *)buf, 2u);
    }

    id v27 = objc_alloc(MEMORY[0x263EFD7E8]);
    id v18 = objc_msgSend_initWithRecordName_(v27, v28, @"recordIDSalt", v29, v30, v31, v32, v33);
    objc_initWeak(buf, self);
    v41 = objc_msgSend_database(self, v34, v35, v36, v37, v38, v39, v40);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = sub_2360BF4D8;
    v47[3] = &unk_264CA0B48;
    objc_copyWeak(&v49, buf);
    id v48 = v4;
    objc_msgSend_fetchRecordWithID_completionHandler_(v41, v42, (uint64_t)v18, (uint64_t)v47, v43, v44, v45, v46);

    objc_destroyWeak(&v49);
    objc_destroyWeak(buf);
  }
}

- (void)invalidateSalt
{
  objc_initWeak(&location, self);
  uint64_t v10 = objc_msgSend_workQueue(self, v3, v4, v5, v6, v7, v8, v9);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2360C027C;
  v11[3] = &unk_264CA0B70;
  objc_copyWeak(&v12, &location);
  dispatch_async(v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)wq_invalidateSalt
{
  uint64_t v3 = BDSCloudKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_2360BC000, v3, OS_LOG_TYPE_DEFAULT, "BDSSyncEngineSaltManager: Invalidate record salt", v16, 2u);
  }

  objc_msgSend_setCurrentSalt_(self, v4, 0, v5, v6, v7, v8, v9);
  objc_msgSend_setCurrentSaltVersionIdentifier_(self, v10, 0, v11, v12, v13, v14, v15);
}

- (BOOL)establishedSalt
{
  uint64_t v8 = self;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v9 = objc_msgSend_workQueue(self, a2, v2, v3, v4, v5, v6, v7);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2360C0418;
  v11[3] = &unk_264CA0AA8;
  void v11[4] = v8;
  v11[5] = &v12;
  dispatch_sync(v9, v11);

  LOBYTE(v8) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v8;
}

- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = 0;
  objc_super v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_2360BEF5C;
  uint64_t v29 = sub_2360BEF6C;
  id v30 = 0;
  char v15 = objc_msgSend_workQueue(self, v8, v9, v10, v11, v12, v13, v14);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2360C05D4;
  v20[3] = &unk_264CA0B98;
  id v21 = v7;
  uint64_t v22 = self;
  id v23 = v6;
  uint64_t v24 = &v25;
  id v16 = v6;
  id v17 = v7;
  dispatch_sync(v15, v20);

  id v18 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v18;
}

- (id)_wq_saltedAndHashedIDFromLocalID:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_workQueue(self, v5, v6, v7, v8, v9, v10, v11);
  dispatch_assert_queue_V2(v12);

  uint64_t v20 = objc_msgSend_currentSalt(self, v13, v14, v15, v16, v17, v18, v19);
  id v21 = v20;
  if (v20)
  {
    id v22 = v20;
    id v30 = (const void *)objc_msgSend_bytes(v22, v23, v24, v25, v26, v27, v28, v29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
    size_t v38 = objc_msgSend_length(v22, v31, v32, v33, v34, v35, v36, v37);
    CCHmacInit(&v64, 0, v30, v38);
    id v39 = v4;
    v47 = (const char *)objc_msgSend_UTF8String(v39, v40, v41, v42, v43, v44, v45, v46);
    size_t v48 = strlen(v47);
    CCHmacUpdate(&v64, v47, v48);
    macOut[0] = 0;
    macOut[1] = 0;
    int v66 = 0;
    CCHmacFinal(&v64, macOut);
    v54 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v49, (uint64_t)macOut, 20, v50, v51, v52, v53);
    v61 = objc_msgSend_base64EncodedStringWithOptions_(v54, v55, 0, v56, v57, v58, v59, v60);
  }
  else
  {
    v62 = BDSCloudKitLog();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_2361F6034();
    }

    v61 = 0;
  }

  return v61;
}

- (void)_updatedReachability
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int isOffline = objc_msgSend_isOffline(BDSReachability, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v10 = BDSCloudKitLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109120;
    v17[1] = isOffline ^ 1;
    _os_log_impl(&dword_2360BC000, v10, OS_LOG_TYPE_DEFAULT, "BDSSyncEngineSaltManager network reachability changed. Reachable: %{BOOL}d", (uint8_t *)v17, 8u);
  }

  if ((isOffline & 1) == 0) {
    objc_msgSend_refreshSaltIfNeeded_(self, v11, (uint64_t)&unk_26E971270, v12, v13, v14, v15, v16);
  }
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (BDSSyncEngineSaltManagerObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (BDSSyncEngineSaltManagerObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (NSData)currentSalt
{
  return self->_currentSalt;
}

- (void)setCurrentSalt:(id)a3
{
}

- (NSString)currentSaltVersionIdentifier
{
  return self->_currentSaltVersionIdentifier;
}

- (void)setCurrentSaltVersionIdentifier:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (BOOL)isSaltRefreshInProgress
{
  return self->_isSaltRefreshInProgress;
}

- (void)setIsSaltRefreshInProgress:(BOOL)a3
{
  self->_isSaltRefreshInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentSaltVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSalt, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_database, 0);
}

@end