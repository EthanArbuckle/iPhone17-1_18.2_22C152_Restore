@interface CKDAccountDataSecurityObserver
+ (id)sharedWalrusController;
- (BOOL)accountSupportsManatee:(id)a3;
- (BOOL)isManateeAvailableForAccount:(id)a3 isSecondaryAccount:(BOOL)a4 error:(id *)a5;
- (BOOL)isWalrusEnabledForAccount:(id)a3 allowBlockingFetch:(BOOL)a4;
- (BOOL)isWalrusEnabledForAccount:(id)a3 isSecondaryAccount:(BOOL)a4 allowBlockingFetch:(BOOL)a5 error:(id *)a6;
- (CKDAccountDataSecurityObserver)initWithDeviceContext:(id)a3;
- (CKDLogicalDeviceContext)deviceContext;
- (NSError)lastCDPErrorForManateeStatus;
- (NSError)lastCDPErrorForWalrusStatus;
- (NSObject)walrusStatusChangeObserver;
- (OS_dispatch_queue)statusQueue;
- (int64_t)_fetchManateeAvailability:(id *)a3;
- (int64_t)cachedWalrusStatusForLoggedInAccount;
- (int64_t)manateeAvailableForLoggedInAccount;
- (void)_lockedFetchAndUpdateManateeAvailability;
- (void)_lockedSetManateeAvailableForLoggedInAccount:(int64_t)a3;
- (void)dealloc;
- (void)handleManateeStatusUpdateNotificationWithAvailability:(id)a3;
- (void)handleWalrusStateChanged;
- (void)manateeStatusForAccount:(id)a3 isSecondaryAccount:(BOOL)a4 completionHandler:(id)a5;
- (void)postClouddWalrusUpdateNotification;
- (void)setCachedWalrusStatusForLoggedInAccount:(int64_t)a3;
- (void)setDeviceContext:(id)a3;
- (void)setLastCDPErrorForManateeStatus:(id)a3;
- (void)setLastCDPErrorForWalrusStatus:(id)a3;
- (void)setStatusQueue:(id)a3;
- (void)setWalrusStatusChangeObserver:(id)a3;
- (void)walrusStatusForAccount:(id)a3 isSecondaryAccount:(BOOL)a4 checkCache:(BOOL)a5 allowFetch:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation CKDAccountDataSecurityObserver

- (BOOL)isWalrusEnabledForAccount:(id)a3 allowBlockingFetch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (objc_msgSend_isPrimaryAccount(v6, v7, v8))
  {
    char error = objc_msgSend_isWalrusEnabledForAccount_isSecondaryAccount_allowBlockingFetch_error_(self, v9, (uint64_t)v6, 0, v4, 0);
  }
  else
  {
    v12 = objc_msgSend_deviceContext(self, v9, v10);
    v15 = objc_msgSend_testDeviceReference(v12, v13, v14);
    BOOL v16 = v15 == 0;

    char error = objc_msgSend_isWalrusEnabledForAccount_isSecondaryAccount_allowBlockingFetch_error_(self, v17, (uint64_t)v6, v16, v4, 0);
  }
  BOOL v18 = error;

  return v18;
}

- (BOOL)isWalrusEnabledForAccount:(id)a3 isSecondaryAccount:(BOOL)a4 allowBlockingFetch:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  v13 = objc_msgSend_statusQueue(self, v11, v12);
  dispatch_assert_queue_not_V2(v13);

  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1C504B680;
  v27 = sub_1C504B690;
  id v28 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4D0B2B4;
  v19[3] = &unk_1E64F8DF0;
  v21 = &v29;
  v22 = &v23;
  v15 = v14;
  v20 = v15;
  objc_msgSend_walrusStatusForAccount_isSecondaryAccount_checkCache_allowFetch_completionHandler_(self, v16, (uint64_t)v10, v8, 1, v7, v19);
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  if (a6) {
    *a6 = (id) v24[5];
  }
  BOOL v17 = v30[3] == 1;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

- (void)walrusStatusForAccount:(id)a3 isSecondaryAccount:(BOOL)a4 checkCache:(BOOL)a5 allowFetch:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  BOOL v16 = (void (**)(id, uint64_t, void))a7;
  if (v9 || v8)
  {
    if (v10) {
      goto LABEL_4;
    }
LABEL_7:
    v19 = objc_msgSend_deviceContext(self, v14, v15);
    if ((objc_msgSend_isLiveDevice(v19, v20, v21) & 1) == 0)
    {
      if (v16)
      {
        v36 = objc_msgSend_testDevice(v19, v22, v23);
        v39 = objc_msgSend_daemonAccount(v36, v37, v38);
        if (objc_msgSend_walrusEnabled(v39, v40, v41)) {
          uint64_t v42 = 1;
        }
        else {
          uint64_t v42 = 2;
        }
        v16[2](v16, v42, 0);
      }
      goto LABEL_38;
    }
    v24 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v22, v23);
    int v27 = objc_msgSend_fakeWalrusOverride(v24, v25, v26);

    if (!v27)
    {
      unint64_t v43 = objc_msgSend_cachedWalrusStatusForLoggedInAccount(self, v28, v29);
      objc_msgSend_lastCDPErrorForWalrusStatus(self, v44, v45);
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v43) {
        BOOL v47 = 0;
      }
      else {
        BOOL v47 = v8;
      }
      if (!v9 || v47)
      {
        objc_initWeak((id *)location, self);
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v49 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_DEBUG, "Fetching walrus state from CoreCDP", buf, 2u);
        }
        v50 = objc_opt_class();
        v53 = objc_msgSend_sharedWalrusController(v50, v51, v52);
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = sub_1C504BB10;
        v60[3] = &unk_1E64F8DC8;
        objc_copyWeak(&v62, (id *)location);
        v60[4] = self;
        v61 = v16;
        objc_msgSend_walrusStatusWithCompletion_(v53, v54, (uint64_t)v60);

        objc_destroyWeak(&v62);
        objc_destroyWeak((id *)location);
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v48 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          if (v43 > 2) {
            v56 = @"unknown";
          }
          else {
            v56 = off_1E64F8E10[v43];
          }
          *(_DWORD *)location = 138543874;
          *(void *)&location[4] = v56;
          if (v46) {
            v57 = @" Error: ";
          }
          else {
            v57 = &stru_1F2044F30;
          }
          if (v46) {
            v58 = v46;
          }
          else {
            v58 = &stru_1F2044F30;
          }
          __int16 v65 = 2114;
          v66 = v57;
          __int16 v67 = 2112;
          v68 = v58;
          v59 = v48;
          _os_log_debug_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_DEBUG, "Returning cached walrus status originally retrieved from CoreCDP: walrus is %{public}@.%{public}@%@", location, 0x20u);
        }
        if (v16) {
          ((void (**)(id, uint64_t, __CFString *))v16)[2](v16, v43, v46);
        }
      }

      goto LABEL_38;
    }
    v30 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v28, v29);
    int v33 = objc_msgSend_fakeWalrusEnabled(v30, v31, v32);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v34 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v55 = @"NO";
      if (v33) {
        v55 = @"YES";
      }
      *(_DWORD *)location = 138412290;
      *(void *)&location[4] = v55;
      _os_log_debug_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_DEBUG, "Returning fake walrus enabled value from behavior option: %@", location, 0xCu);
      if (!v16) {
        goto LABEL_38;
      }
    }
    else if (!v16)
    {
LABEL_38:

      goto LABEL_39;
    }
    if (v33) {
      uint64_t v35 = 1;
    }
    else {
      uint64_t v35 = 2;
    }
    v16[2](v16, v35, 0);
    goto LABEL_38;
  }
  BOOL v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CKDAccountDataSecurityObserver.m", 601, @"checkCache and allowFetch cannot both be NO");

  if (!v10) {
    goto LABEL_7;
  }
LABEL_4:
  if (v16) {
    v16[2](v16, 0, 0);
  }
LABEL_39:
}

- (OS_dispatch_queue)statusQueue
{
  return self->_statusQueue;
}

- (CKDLogicalDeviceContext)deviceContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceContext);
  return (CKDLogicalDeviceContext *)WeakRetained;
}

- (CKDAccountDataSecurityObserver)initWithDeviceContext:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKDAccountDataSecurityObserver;
  v5 = [(CKDAccountDataSecurityObserver *)&v28 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_deviceContext, v4);
    v6->_manateeAvailableForLoggedInAccount = -1;
    v6->_cachedWalrusStatusForLoggedInAccount = 0;
    BOOL v7 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.cloudkit.account.manateeStatusQueue", v7);
    statusQueue = v6->_statusQueue;
    v6->_statusQueue = (OS_dispatch_queue *)v8;

    uint64_t v12 = objc_msgSend_currentProcess(CKDDaemonProcess, v10, v11);
    uint64_t v15 = objc_msgSend_processType(v12, v13, v14);

    if (v15 != 1)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_1C504A708, @"com.apple.security.octagon.trust-status-change", 0, (CFNotificationSuspensionBehavior)1025);
      objc_initWeak(&location, v6);
      v19 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v17, v18);
      uint64_t v20 = *MEMORY[0x1E4F5B2D8];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_1C504A7B4;
      v25[3] = &unk_1E64F0D00;
      objc_copyWeak(&v26, &location);
      uint64_t v22 = objc_msgSend_addObserverForName_object_queue_usingBlock_(v19, v21, v20, 0, 0, v25);
      walrusStatusChangeObserver = v6->_walrusStatusChangeObserver;
      v6->_walrusStatusChangeObserver = v22;

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }

  return v6;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.security.octagon.trust-status-change", 0);
  if (self->_walrusStatusChangeObserver)
  {
    id v6 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v4, v5);
    objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self->_walrusStatusChangeObserver, *MEMORY[0x1E4F5B2D8], 0);

    walrusStatusChangeObserver = self->_walrusStatusChangeObserver;
    self->_walrusStatusChangeObserver = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CKDAccountDataSecurityObserver;
  [(CKDAccountDataSecurityObserver *)&v9 dealloc];
}

- (void)_lockedSetManateeAvailableForLoggedInAccount:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_statusQueue(self, a2, a3);
  dispatch_assert_queue_barrier(v5);

  int64_t manateeAvailableForLoggedInAccount = self->_manateeAvailableForLoggedInAccount;
  if (manateeAvailableForLoggedInAccount != -1 && manateeAvailableForLoggedInAccount != a3)
  {
    BOOL v10 = objc_msgSend_sharedNotifier(CKDAccountNotifier, v6, v7);
    objc_msgSend_postAccountChangedNotificationToClients(v10, v11, v12);
  }
  self->_int64_t manateeAvailableForLoggedInAccount = a3;
}

- (int64_t)_fetchManateeAvailability:(id *)a3
{
  id v4 = objc_msgSend_contextForPrimaryAccount(MEMORY[0x1E4F5B2E0], a2, (uint64_t)a3);
  id v5 = objc_alloc(MEMORY[0x1E4F5B2F0]);
  uint64_t v7 = objc_msgSend_initWithContext_(v5, v6, (uint64_t)v4);
  id v20 = 0;
  char isManateeAvailable = objc_msgSend_isManateeAvailable_(v7, v8, (uint64_t)&v20);
  id v10 = v20;

  if (a3) {
    *a3 = v10;
  }
  if ((isManateeAvailable & 1) == 0)
  {
    uint64_t v14 = objc_msgSend_domain(v10, v11, v12);
    if (objc_msgSend_isEqualToString_(v14, v15, *MEMORY[0x1E4F5B2D0]))
    {
      uint64_t v18 = objc_msgSend_code(v10, v16, v17);

      if (v18 == -5311)
      {
        int64_t v13 = -1;
        goto LABEL_10;
      }
    }
    else
    {
    }
    int64_t v13 = 0;
    goto LABEL_10;
  }
  int64_t v13 = 1;
LABEL_10:

  return v13;
}

- (void)handleManateeStatusUpdateNotificationWithAvailability:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_deviceContext(self, v5, v6);
  int isLiveDevice = objc_msgSend_isLiveDevice(v7, v8, v9);

  if (isLiveDevice)
  {
    int64_t v13 = objc_msgSend_statusQueue(self, v11, v12);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1C504AAD4;
    v14[3] = &unk_1E64F0948;
    id v15 = v4;
    BOOL v16 = self;
    dispatch_barrier_async(v13, v14);
  }
}

- (void)_lockedFetchAndUpdateManateeAvailability
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_statusQueue(self, a2, v2);
  dispatch_assert_queue_barrier(v4);

  if (objc_msgSend_manateeAvailableForLoggedInAccount(self, v5, v6) == -1)
  {
    id v26 = 0;
    uint64_t ManateeAvailability = objc_msgSend__fetchManateeAvailability_(self, v7, (uint64_t)&v26);
    id v9 = v26;
    objc_msgSend__lockedSetManateeAvailableForLoggedInAccount_(self, v10, ManateeAvailability);
    objc_msgSend_setLastCDPErrorForManateeStatus_(self, v11, (uint64_t)v9);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v12 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      int64_t v13 = v12;
      if (objc_msgSend_manateeAvailableForLoggedInAccount(self, v14, v15) == 1) {
        uint64_t v18 = &stru_1F2044F30;
      }
      else {
        uint64_t v18 = @" not";
      }
      uint64_t v21 = objc_msgSend_lastCDPErrorForManateeStatus(self, v16, v17);
      if (v21) {
        uint64_t v22 = @"Error: ";
      }
      else {
        uint64_t v22 = &stru_1F2044F30;
      }
      uint64_t v23 = objc_msgSend_lastCDPErrorForManateeStatus(self, v19, v20);
      v24 = (void *)v23;
      *(_DWORD *)buf = 138543874;
      if (v23) {
        uint64_t v25 = (__CFString *)v23;
      }
      else {
        uint64_t v25 = &stru_1F2044F30;
      }
      objc_super v28 = v18;
      __int16 v29 = 2114;
      v30 = v22;
      __int16 v31 = 2112;
      uint64_t v32 = v25;
      _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "CoreCDP reports that manatee is%{public}@ available for the logged in account.%{public}@%@", buf, 0x20u);
    }
  }
}

- (void)manateeStatusForAccount:(id)a3 isSecondaryAccount:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, void))a5;
  uint64_t v12 = objc_msgSend_deviceContext(self, v10, v11);
  if ((objc_msgSend_isLiveDevice(v12, v13, v14) & 1) == 0)
  {
    if (!v9) {
      goto LABEL_30;
    }
    v39 = objc_msgSend_testDevice(v12, v15, v16);
    if (objc_msgSend_deviceToDeviceEncryptionEnabled(v39, v40, v41)
      && (objc_msgSend_daemonAccount(v39, v42, v43),
          v44 = objc_claimAutoreleasedReturnValue(),
          char v47 = objc_msgSend_deviceToDeviceEncryptionSupportedByAccount(v44, v45, v46),
          v44,
          (v47 & 1) != 0))
    {
      uint64_t v48 = 1;
    }
    else
    {
      v49 = objc_msgSend_deviceID(v39, v42, v43);
      int v51 = objc_msgSend_containsString_(v49, v50, @"captainmanatee");

      if (v51)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v52 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          v63 = v52;
          objc_msgSend_deviceID(v39, v64, v65);
          v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v69 = objc_msgSend_daemonAccount(v39, v67, v68);
          objc_msgSend_accountID(v69, v70, v71);
          v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v90 = v66;
          __int16 v91 = 2112;
          v92 = v72;
          _os_log_debug_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_DEBUG, "Device should have manatee enabled but doesn't. DeviceID: %@ AccountID: %@", buf, 0x16u);
        }
      }
      uint64_t v48 = 0;
    }
    v9[2](v9, v48, 0);
    goto LABEL_22;
  }
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v17 = objc_msgSend_altDSID(v8, v15, v16);
  if (!objc_msgSend_length(v17, v18, v19))
  {

    goto LABEL_24;
  }
  uint64_t v22 = objc_msgSend_accountID(v8, v20, v21);
  uint64_t v25 = objc_msgSend_length(v22, v23, v24);

  if (!v25)
  {
LABEL_24:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v53 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v53, OS_LOG_TYPE_DEBUG, "No account altDSID or accountID available for manatee status, returning manatee disabled", buf, 2u);
    }
    goto LABEL_28;
  }
  objc_super v28 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v26, v27);
  int v31 = objc_msgSend_fakeManateeOverride(v28, v29, v30);

  if (!v31)
  {
    if (!v6)
    {
      if (objc_msgSend_manateeAvailableForLoggedInAccount(self, v32, v33) == -1)
      {
        id v62 = objc_msgSend_statusQueue(self, v54, v55);
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = sub_1C504B43C;
        v87[3] = &unk_1E64F0E18;
        v87[4] = self;
        v88 = v9;
        dispatch_barrier_async(v62, v87);

        goto LABEL_30;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v56 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v74 = v56;
        if (objc_msgSend_manateeAvailableForLoggedInAccount(self, v75, v76) == 1) {
          v79 = &stru_1F2044F30;
        }
        else {
          v79 = @" not";
        }
        v82 = objc_msgSend_lastCDPErrorForManateeStatus(self, v77, v78);
        if (v82) {
          v83 = @"Error: ";
        }
        else {
          v83 = &stru_1F2044F30;
        }
        uint64_t v84 = objc_msgSend_lastCDPErrorForManateeStatus(self, v80, v81);
        v85 = (void *)v84;
        *(_DWORD *)buf = 138543874;
        if (v84) {
          v86 = (__CFString *)v84;
        }
        else {
          v86 = &stru_1F2044F30;
        }
        v90 = v79;
        __int16 v91 = 2114;
        v92 = v83;
        __int16 v93 = 2112;
        v94 = v86;
        _os_log_debug_impl(&dword_1C4CFF000, v74, OS_LOG_TYPE_DEBUG, "Returning cached manatee availability originally retrieved from CoreCDP: manatee is%{public}@ available.%{public}@%@", buf, 0x20u);

        if (!v9) {
          goto LABEL_30;
        }
      }
      else if (!v9)
      {
        goto LABEL_30;
      }
      BOOL v59 = objc_msgSend_manateeAvailableForLoggedInAccount(self, v57, v58) == 1;
      v39 = objc_msgSend_lastCDPErrorForManateeStatus(self, v60, v61);
      ((void (**)(id, uint64_t, void *))v9)[2](v9, v59, v39);
LABEL_22:

      goto LABEL_30;
    }
LABEL_28:
    if (v9) {
      v9[2](v9, 0, 0);
    }
    goto LABEL_30;
  }
  v34 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v32, v33);
  uint64_t v37 = objc_msgSend_fakeManateeEnabled(v34, v35, v36);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v38 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v73 = @"NO";
    if (v37) {
      v73 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v90 = v73;
    _os_log_debug_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_DEBUG, "Manatee override behavior option is set. Returning manatee enabled value from behavior option: %@", buf, 0xCu);
    if (v9) {
      goto LABEL_10;
    }
  }
  else if (v9)
  {
LABEL_10:
    v9[2](v9, v37, 0);
  }
LABEL_30:
}

- (BOOL)isManateeAvailableForAccount:(id)a3 isSecondaryAccount:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v11 = objc_msgSend_statusQueue(self, v9, v10);
  dispatch_assert_queue_not_V2(v11);

  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  uint64_t v27 = 0;
  objc_super v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_1C504B680;
  uint64_t v25 = sub_1C504B690;
  id v26 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C504B698;
  v17[3] = &unk_1E64F3E90;
  uint64_t v19 = &v27;
  uint64_t v20 = &v21;
  int64_t v13 = v12;
  uint64_t v18 = v13;
  objc_msgSend_manateeStatusForAccount_isSecondaryAccount_completionHandler_(self, v14, (uint64_t)v8, v6, v17);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = (id) v22[5];
  }
  char v15 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

- (BOOL)accountSupportsManatee:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_deviceContext(self, v5, v6);
  if (objc_msgSend_isLiveDevice(v7, v8, v9))
  {
    dispatch_semaphore_t v12 = objc_msgSend_dsid(v4, v10, v11);

    if (!v12)
    {
      char v21 = 0;
      goto LABEL_7;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F93E70]);
    uint64_t v16 = objc_msgSend_dsid(v4, v14, v15);
    uint64_t v18 = objc_msgSend_initWithDSID_(v13, v17, (uint64_t)v16);

    char v21 = objc_msgSend_accountStatus(v18, v19, v20) == 1;
  }
  else
  {
    uint64_t v18 = objc_msgSend_testDevice(v7, v10, v11);
    uint64_t v24 = objc_msgSend_daemonAccount(v18, v22, v23);
    char v21 = objc_msgSend_deviceToDeviceEncryptionSupportedByAccount(v24, v25, v26);
  }
LABEL_7:

  return v21;
}

+ (id)sharedWalrusController
{
  if (qword_1EBBD0178 != -1) {
    dispatch_once(&qword_1EBBD0178, &unk_1F2044DB0);
  }
  uint64_t v2 = (void *)qword_1EBBD0170;
  return v2;
}

- (void)handleWalrusStateChanged
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "Walrus state may have changed. Fetching new state from CoreCDP", v5, 2u);
  }
  objc_msgSend_walrusStatusForAccount_isSecondaryAccount_checkCache_allowFetch_completionHandler_(self, v4, 0, 0, 0, 1, 0);
}

- (void)setCachedWalrusStatusForLoggedInAccount:(int64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EBBCDF78);
  if (self->_cachedWalrusStatusForLoggedInAccount == a3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EBBCDF78);
  }
  else
  {
    self->_cachedWalrusStatusForLoggedInAccount = a3;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EBBCDF78);
    objc_msgSend_sharedNotifier(CKDAccountNotifier, v5, v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postAccountChangedNotificationToClients(v9, v7, v8);
  }
}

- (int64_t)cachedWalrusStatusForLoggedInAccount
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EBBCDF78);
  int64_t cachedWalrusStatusForLoggedInAccount = self->_cachedWalrusStatusForLoggedInAccount;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EBBCDF78);
  return cachedWalrusStatusForLoggedInAccount;
}

- (void)setLastCDPErrorForWalrusStatus:(id)a3
{
  id v4 = (NSError *)a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EBBCDF78);
  lastCDPErrorForWalrusStatus = self->_lastCDPErrorForWalrusStatus;
  self->_lastCDPErrorForWalrusStatus = v4;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EBBCDF78);
}

- (NSError)lastCDPErrorForWalrusStatus
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EBBCDF78);
  v3 = self->_lastCDPErrorForWalrusStatus;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EBBCDF78);
  return v3;
}

- (void)postClouddWalrusUpdateNotification
{
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v5, v4, @"CDPWalrusStateChangeNotification", self);
}

- (void)setStatusQueue:(id)a3
{
}

- (int64_t)manateeAvailableForLoggedInAccount
{
  return self->_manateeAvailableForLoggedInAccount;
}

- (NSError)lastCDPErrorForManateeStatus
{
  return self->_lastCDPErrorForManateeStatus;
}

- (void)setLastCDPErrorForManateeStatus:(id)a3
{
}

- (NSObject)walrusStatusChangeObserver
{
  return self->_walrusStatusChangeObserver;
}

- (void)setWalrusStatusChangeObserver:(id)a3
{
}

- (void)setDeviceContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceContext);
  objc_storeStrong((id *)&self->_walrusStatusChangeObserver, 0);
  objc_storeStrong((id *)&self->_lastCDPErrorForManateeStatus, 0);
  objc_storeStrong((id *)&self->_statusQueue, 0);
  objc_storeStrong((id *)&self->_lastCDPErrorForWalrusStatus, 0);
}

@end