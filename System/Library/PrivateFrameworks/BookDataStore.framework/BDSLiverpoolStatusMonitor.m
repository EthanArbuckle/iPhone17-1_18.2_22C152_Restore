@interface BDSLiverpoolStatusMonitor
+ (id)makeOSStateHandler;
- (BCICloudIdentityToken)iCloudIdentityToken;
- (BDSICloudIdentityToken)currentICloudIdentityToken;
- (BDSICloudIdentityToken)lastArchivedICloudIdentityToken;
- (BDSICloudIdentityToken)lastArchivedNonNilICloudIdentityToken;
- (BDSLiverpoolStatusChangeObserving)coordinatingObserver;
- (BDSLiverpoolStatusMonitor)init;
- (BOOL)dq_isCloudKitEnabled;
- (BOOL)isCloudKitEnabled;
- (BOOL)lastArchivedNonNilICloudIdentityTokenWasNonNilAtColdLaunch;
- (BOOL)optedIn;
- (BOOL)optedInKnown;
- (NSHashTable)observers;
- (OS_dispatch_queue)containerQueue;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)notifyQueue;
- (id)description;
- (int)tccNotifyToken;
- (void)_notifyObserversWithCurrentToken:(id)a3 lastToken:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)dq_archiveCurrentICloudIdentityToken;
- (void)dq_refreshICloudAvailabilityStatus;
- (void)p_iCloudIdentityDidChange:(id)a3;
- (void)refreshICloudTokensAndUpdateWithOptedIn:(BOOL)a3;
- (void)registerCoordinatingObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)restartObserving;
- (void)setContainerQueue:(id)a3;
- (void)setCoordinatingObserver:(id)a3;
- (void)setCurrentICloudIdentityToken:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setLastArchivedICloudIdentityToken:(id)a3;
- (void)setLastArchivedNonNilICloudIdentityToken:(id)a3;
- (void)setLastArchivedNonNilICloudIdentityTokenWasNonNilAtColdLaunch:(BOOL)a3;
- (void)setNotifyQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOptedIn:(BOOL)a3;
- (void)setOptedInKnown:(BOOL)a3;
- (void)setTccNotifyToken:(int)a3;
- (void)updateWithOptedIn:(BOOL)a3;
@end

@implementation BDSLiverpoolStatusMonitor

- (BDSLiverpoolStatusMonitor)init
{
  v73.receiver = self;
  v73.super_class = (Class)BDSLiverpoolStatusMonitor;
  v8 = [(BDSLiverpoolStatusMonitor *)&v73 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_hashTableWithOptions_(MEMORY[0x263F088B0], v2, 517, v3, v4, v5, v6, v7);
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.iBooks.BDSLiverpoolStatusMonitor.dispatchQueue", 0);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.iBooks.BDSLiverpoolStatusMonitor.notifyQueue", 0);
    notifyQueue = v8->_notifyQueue;
    v8->_notifyQueue = (OS_dispatch_queue *)v13;

    v22 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v15, v16, v17, v18, v19, v20, v21);
    v8->_optedIn = objc_msgSend_isPrimaryAccountManagedAppleID(v22, v23, v24, v25, v26, v27, v28, v29);

    v37 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v30, v31, v32, v33, v34, v35, v36);
    v44 = objc_msgSend_valueForKey_(v37, v38, @"nonNilLiverpoolIdentityToken", v39, v40, v41, v42, v43);
    v8->_lastArchivedNonNilICloudIdentityTokenWasNonNilAtColdLaunch = v44 != 0;

    v45 = v8->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2360FE774;
    block[3] = &unk_264CA1428;
    v46 = v8;
    v72 = v46;
    dispatch_async(v45, block);
    int out_token = -1;
    objc_initWeak(&location, v46);
    v54 = (const char *)objc_msgSend_UTF8String(@"com.apple.tcc.access.changed", v47, v48, v49, v50, v51, v52, v53);
    v55 = MEMORY[0x263EF83A0];
    id v56 = MEMORY[0x263EF83A0];
    uint64_t v64 = MEMORY[0x263EF8330];
    uint64_t v65 = 3221225472;
    v66 = sub_2360FE77C;
    v67 = &unk_264CA0BF0;
    objc_copyWeak(&v68, &location);
    LODWORD(v54) = notify_register_dispatch(v54, &out_token, v55, &v64);

    if (v54) {
      objc_msgSend_setTccNotifyToken_(v46, v57, 0xFFFFFFFFLL, v58, v59, v60, v61, v62, v64, v65, v66, v67);
    }
    else {
      objc_msgSend_setTccNotifyToken_(v46, v57, out_token, v58, v59, v60, v61, v62, v64, v65, v66, v67);
    }
    objc_destroyWeak(&v68);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (void)updateWithOptedIn:(BOOL)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  int isCloudKitEnabled = objc_msgSend_isCloudKitEnabled(self, a2, a3, v3, v4, v5, v6, v7);
  int v25 = objc_msgSend_optedInKnown(self, v11, v12, v13, v14, v15, v16, v17);
  if (a3)
  {
    uint64_t isPrimaryAccountManagedAppleID = 1;
    objc_msgSend_setOptedIn_(self, v18, 1, v20, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v34 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v18, v19, v20, v21, v22, v23, v24);
    uint64_t isPrimaryAccountManagedAppleID = objc_msgSend_isPrimaryAccountManagedAppleID(v34, v35, v36, v37, v38, v39, v40, v41);

    objc_msgSend_setOptedIn_(self, v42, isPrimaryAccountManagedAppleID, v43, v44, v45, v46, v47);
  }
  if (((isCloudKitEnabled ^ objc_msgSend_isCloudKitEnabled(self, v27, v28, v29, v30, v31, v32, v33)) & v25) == 1) {
    objc_msgSend_p_iCloudIdentityDidChange_(self, v48, 0, v49, v50, v51, v52, v53);
  }
  objc_msgSend_refreshICloudTokensAndUpdateWithOptedIn_(self, v48, isPrimaryAccountManagedAppleID, v49, v50, v51, v52, v53);
  v54 = BDSCloudKitLog();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    if (objc_msgSend_isCloudKitEnabled(self, v55, v56, v57, v58, v59, v60, v61)) {
      v69 = @"YES";
    }
    else {
      v69 = @"NO";
    }
    if (objc_msgSend_optedIn(self, v62, v63, v64, v65, v66, v67, v68)) {
      v70 = @"YES";
    }
    else {
      v70 = @"NO";
    }
    int v71 = 138543618;
    v72 = v69;
    __int16 v73 = 2114;
    v74 = v70;
    _os_log_impl(&dword_2360BC000, v54, OS_LOG_TYPE_INFO, "BCLiverpoolStatusMonitor CloudKit=%{public}@ optedIn=%{public}@", (uint8_t *)&v71, 0x16u);
  }
}

- (void)refreshICloudTokensAndUpdateWithOptedIn:(BOOL)a3
{
  objc_msgSend_setOptedIn_(self, a2, a3, v3, v4, v5, v6, v7);
  uint64_t v17 = objc_msgSend_dispatchQueue(self, v10, v11, v12, v13, v14, v15, v16);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2360FE9D0;
  v18[3] = &unk_264CA1FB0;
  BOOL v19 = a3;
  v18[4] = self;
  dispatch_async(v17, v18);
}

- (void)dealloc
{
  uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3, v4, v5, v6, v7);
  objc_msgSend_removeObserver_(v9, v10, (uint64_t)self, v11, v12, v13, v14, v15);

  if (objc_msgSend_tccNotifyToken(self, v16, v17, v18, v19, v20, v21, v22) != -1)
  {
    int v30 = objc_msgSend_tccNotifyToken(self, v23, v24, v25, v26, v27, v28, v29);
    notify_cancel(v30);
  }
  v31.receiver = self;
  v31.super_class = (Class)BDSLiverpoolStatusMonitor;
  [(BDSLiverpoolStatusMonitor *)&v31 dealloc];
}

- (BCICloudIdentityToken)iCloudIdentityToken
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_2360FEC34;
  uint64_t v17 = sub_2360FEC44;
  id v18 = 0;
  uint64_t v9 = objc_msgSend_dispatchQueue(self, a2, v2, v3, v4, v5, v6, v7);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2360FEC4C;
  v12[3] = &unk_264CA0AA8;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(v9, v12);

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (BCICloudIdentityToken *)v10;
}

- (BOOL)dq_isCloudKitEnabled
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  int isSignedIntoICloud = objc_msgSend_isSignedIntoICloud(BDSSyncUserDefaults, a2, v2, v3, v4, v5, v6, v7);
  int isCloudKitSyncOptedIn = objc_msgSend_isCloudKitSyncOptedIn(BDSSyncUserDefaults, v10, v11, v12, v13, v14, v15, v16);
  id v18 = BDSCloudKitLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    if (isSignedIntoICloud) {
      uint64_t v34 = @"YES";
    }
    else {
      uint64_t v34 = @"NO";
    }
    if (isCloudKitSyncOptedIn) {
      uint64_t v35 = @"YES";
    }
    else {
      uint64_t v35 = @"NO";
    }
    int v37 = 138412802;
    if (objc_msgSend_optedIn(self, v19, v20, v21, v22, v23, v24, v25)) {
      uint64_t v36 = @"YES";
    }
    else {
      uint64_t v36 = @"NO";
    }
    uint64_t v38 = v34;
    __int16 v39 = 2112;
    uint64_t v40 = v35;
    __int16 v41 = 2112;
    uint64_t v42 = v36;
    _os_log_debug_impl(&dword_2360BC000, v18, OS_LOG_TYPE_DEBUG, "BDSLiverpoolStatusMonitor: dq_isCloudKitEnabled: signedIn = %@, cloudKit = %@, optedIn = %@", (uint8_t *)&v37, 0x20u);
  }

  if ((isSignedIntoICloud & isCloudKitSyncOptedIn) == 1) {
    return objc_msgSend_optedIn(self, v26, v27, v28, v29, v30, v31, v32);
  }
  else {
    return 0;
  }
}

- (BOOL)isCloudKitEnabled
{
  v8 = self;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v9 = objc_msgSend_dispatchQueue(self, a2, v2, v3, v4, v5, v6, v7);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2360FEEAC;
  v11[3] = &unk_264CA0AA8;
  v11[4] = v8;
  v11[5] = &v12;
  dispatch_sync(v9, v11);

  LOBYTE(v8) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v8;
}

- (void)setOptedIn:(BOOL)a3
{
  if (self->_optedIn != a3)
  {
    self->_optedIn = a3;
    self->_optedInKnown = 1;
  }
}

- (void)addObserver:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    uint64_t v12 = objc_msgSend_dispatchQueue(self, v4, v5, v6, v7, v8, v9, v10);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2360FEFB4;
    v13[3] = &unk_264CA1450;
    v13[4] = self;
    id v14 = v11;
    dispatch_async(v12, v13);
  }
}

- (void)removeObserver:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    uint64_t v12 = objc_msgSend_dispatchQueue(self, v4, v5, v6, v7, v8, v9, v10);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2360FF120;
    v13[3] = &unk_264CA1450;
    v13[4] = self;
    id v14 = v11;
    dispatch_async(v12, v13);
  }
}

- (void)registerCoordinatingObserver:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    uint64_t v12 = objc_msgSend_dispatchQueue(self, v4, v5, v6, v7, v8, v9, v10);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2360FF26C;
    v13[3] = &unk_264CA1450;
    v13[4] = self;
    id v14 = v11;
    dispatch_async(v12, v13);
  }
}

- (void)restartObserving
{
  uint64_t v9 = objc_msgSend_dispatchQueue(self, a2, v2, v3, v4, v5, v6, v7);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360FF2FC;
  block[3] = &unk_264CA1428;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)dq_archiveCurrentICloudIdentityToken
{
  uint64_t v9 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, v2, v3, v4, v5, v6, v7);
  uint64_t v17 = objc_msgSend_currentICloudIdentityToken(self, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v25 = objc_msgSend_token(v17, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_setObject_forKey_(v9, v26, (uint64_t)v25, @"liverpoolIdentityToken", v27, v28, v29, v30);

  uint64_t v38 = objc_msgSend_currentICloudIdentityToken(self, v31, v32, v33, v34, v35, v36, v37);
  if (v38)
  {
    uint64_t v46 = (void *)v38;
    int v47 = objc_msgSend_optedInKnown(self, v39, v40, v41, v42, v43, v44, v45);

    if (v47)
    {
      uint64_t v48 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v39, v40, v41, v42, v43, v44, v45);
      uint64_t v56 = objc_msgSend_currentICloudIdentityToken(self, v49, v50, v51, v52, v53, v54, v55);
      uint64_t v64 = objc_msgSend_token(v56, v57, v58, v59, v60, v61, v62, v63);
      objc_msgSend_setObject_forKey_(v48, v65, (uint64_t)v64, @"nonNilLiverpoolIdentityToken", v66, v67, v68, v69);
    }
  }
  objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v39, v40, v41, v42, v43, v44, v45);
  id v77 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synchronize(v77, v70, v71, v72, v73, v74, v75, v76);
}

- (void)p_iCloudIdentityDidChange:(id)a3
{
  uint64_t v9 = objc_msgSend_dispatchQueue(self, a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360FF668;
  block[3] = &unk_264CA1428;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)_notifyObserversWithCurrentToken:(id)a3 lastToken:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v6 = a4;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v14 = objc_msgSend_observers(self, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v56, (uint64_t)v60, 16, v16, v17, v18);
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v57;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v57 != v21) {
          objc_enumerationMutation(v14);
        }
        uint64_t v23 = *(void *)(*((void *)&v56 + 1) + 8 * v22);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v31 = objc_msgSend_notifyQueue(self, v24, v25, v26, v27, v28, v29, v30);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = sub_2360FFA20;
          block[3] = &unk_264CA1400;
          void block[4] = v23;
          id v54 = v48;
          id v55 = v6;
          dispatch_async(v31, block);
        }
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v24, (uint64_t)&v56, (uint64_t)v60, 16, v28, v29, v30);
    }
    while (v20);
  }

  __int16 v39 = objc_msgSend_coordinatingObserver(self, v32, v33, v34, v35, v36, v37, v38);
  if (v39 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v47 = objc_msgSend_notifyQueue(self, v40, v41, v42, v43, v44, v45, v46);
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = sub_2360FFA30;
    v49[3] = &unk_264CA1400;
    id v50 = v39;
    id v51 = v48;
    id v52 = v6;
    dispatch_async(v47, v49);
  }
}

- (void)dq_refreshICloudAvailabilityStatus
{
  objc_msgSend_tokenForCurrentIdentityIfCloudKitEnabled(BDSICloudIdentityToken, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v9 = (BDSICloudIdentityToken *)objc_claimAutoreleasedReturnValue();
  currentICloudIdentityToken = self->_currentICloudIdentityToken;
  self->_currentICloudIdentityToken = v9;

  uint64_t v11 = [BDSICloudIdentityToken alloc];
  uint64_t v19 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v12, v13, v14, v15, v16, v17, v18);
  uint64_t v26 = objc_msgSend_valueForKey_(v19, v20, @"liverpoolIdentityToken", v21, v22, v23, v24, v25);
  uint64_t v33 = (BDSICloudIdentityToken *)objc_msgSend_initFromArchive_(v11, v27, (uint64_t)v26, v28, v29, v30, v31, v32);
  lastArchivedICloudIdentityToken = self->_lastArchivedICloudIdentityToken;
  self->_lastArchivedICloudIdentityToken = v33;

  uint64_t v35 = [BDSICloudIdentityToken alloc];
  objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v36, v37, v38, v39, v40, v41, v42);
  id v58 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v49 = objc_msgSend_valueForKey_(v58, v43, @"nonNilLiverpoolIdentityToken", v44, v45, v46, v47, v48);
  long long v56 = (BDSICloudIdentityToken *)objc_msgSend_initFromArchive_(v35, v50, (uint64_t)v49, v51, v52, v53, v54, v55);
  lastArchivedNonNilICloudIdentityToken = self->_lastArchivedNonNilICloudIdentityToken;
  self->_lastArchivedNonNilICloudIdentityToken = v56;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  if (objc_msgSend_isCloudKitEnabled(self, v6, v7, v8, v9, v10, v11, v12)) {
    uint64_t v20 = @"YES";
  }
  else {
    uint64_t v20 = @"NO";
  }
  if (objc_msgSend_optedIn(self, v13, v14, v15, v16, v17, v18, v19)) {
    objc_msgSend_stringWithFormat_(v3, v21, @"<%@(%p) CloudKit=%@ optedIn=%@", v22, v23, v24, v25, v26, v5, self, v20, @"YES");
  }
  else {
  uint64_t v27 = objc_msgSend_stringWithFormat_(v3, v21, @"<%@(%p) CloudKit=%@ optedIn=%@", v22, v23, v24, v25, v26, v5, self, v20, @"NO");
  }

  return v27;
}

+ (id)makeOSStateHandler
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x270F9A6D0])(BDSSyncUserDefaults, sel_makeOSStateHandler);
}

- (BOOL)optedIn
{
  return self->_optedIn;
}

- (BDSICloudIdentityToken)lastArchivedICloudIdentityToken
{
  return self->_lastArchivedICloudIdentityToken;
}

- (void)setLastArchivedICloudIdentityToken:(id)a3
{
}

- (BDSICloudIdentityToken)lastArchivedNonNilICloudIdentityToken
{
  return self->_lastArchivedNonNilICloudIdentityToken;
}

- (void)setLastArchivedNonNilICloudIdentityToken:(id)a3
{
}

- (BDSICloudIdentityToken)currentICloudIdentityToken
{
  return self->_currentICloudIdentityToken;
}

- (void)setCurrentICloudIdentityToken:(id)a3
{
}

- (BOOL)optedInKnown
{
  return self->_optedInKnown;
}

- (void)setOptedInKnown:(BOOL)a3
{
  self->_optedInKnown = a3;
}

- (BOOL)lastArchivedNonNilICloudIdentityTokenWasNonNilAtColdLaunch
{
  return self->_lastArchivedNonNilICloudIdentityTokenWasNonNilAtColdLaunch;
}

- (void)setLastArchivedNonNilICloudIdentityTokenWasNonNilAtColdLaunch:(BOOL)a3
{
  self->_lastArchivedNonNilICloudIdentityTokenWasNonNilAtColdLaunch = a3;
}

- (int)tccNotifyToken
{
  return self->_tccNotifyToken;
}

- (void)setTccNotifyToken:(int)a3
{
  self->_tccNotifyToken = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)containerQueue
{
  return self->_containerQueue;
}

- (void)setContainerQueue:(id)a3
{
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BDSLiverpoolStatusChangeObserving)coordinatingObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinatingObserver);
  return (BDSLiverpoolStatusChangeObserving *)WeakRetained;
}

- (void)setCoordinatingObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinatingObserver);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_containerQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentICloudIdentityToken, 0);
  objc_storeStrong((id *)&self->_lastArchivedNonNilICloudIdentityToken, 0);
  objc_storeStrong((id *)&self->_lastArchivedICloudIdentityToken, 0);
}

@end