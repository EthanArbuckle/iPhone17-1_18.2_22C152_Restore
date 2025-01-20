@interface CKDPCSKeySyncManager
+ (id)sharedManager;
- (CKDPCSKeySyncManager)init;
- (NSMutableDictionary)keySyncTrackerByServiceNameByAccount;
- (OS_dispatch_queue)keySyncQueue;
- (id)_on_queue_createSyncTrackerForAccount:(id)a3 requestorOperationID:(id)a4 service:(id)a5 manatee:(BOOL)a6 testOverrideProvider:(id)a7;
- (id)_on_queue_getKeySyncTrackerByServicenameForAccount:(id)a3;
- (id)_on_queue_syncTrackerForAccount:(id)a3 requestorOperationID:(id)a4 service:(id)a5 manatee:(BOOL)a6 testOverrideProvider:(id)a7;
- (id)createSyncTrackerForAccount:(id)a3 requestorOperationID:(id)a4 service:(id)a5 manatee:(BOOL)a6 testOverrideProvider:(id)a7;
- (id)syncTrackerForAccount:(id)a3 requestorOperationID:(id)a4 service:(id)a5 manatee:(BOOL)a6 testOverrideProvider:(id)a7;
- (void)_on_queue_performKeySyncWithSyncTracker:(id)a3 testableSyncConfig:(unint64_t)a4 shouldThrottle:(BOOL)a5 testOverrideProvider:(id)a6 requestorOperationID:(id)a7 completionHandler:(id)a8;
- (void)getKeySyncEligibilityForService:(id)a3 isManatee:(BOOL)a4 account:(id)a5 lastModifiedDate:(id)a6 testOverrideProvider:(id)a7 completionHandler:(id)a8;
- (void)performKeySyncWithSyncTracker:(id)a3 testableSyncConfig:(unint64_t)a4 shouldThrottle:(BOOL)a5 testOverrideProvider:(id)a6 requestorOperationID:(id)a7 completionHandler:(id)a8;
- (void)setKeySyncQueue:(id)a3;
- (void)setKeySyncTrackerByServiceNameByAccount:(id)a3;
- (void)setRacedWithGuitarfishRepairCallbackOnAllOutstandingHandlersWithCompletion:(id)a3;
- (void)syncUserKeysForService:(id)a3 context:(id)a4 bundleID:(id)a5 serviceIsManatee:(BOOL)a6 account:(id)a7 shouldThrottle:(BOOL)a8 testOverrideProvider:(id)a9 requestorOperationID:(id)a10 completionHandler:(id)a11;
@end

@implementation CKDPCSKeySyncManager

+ (id)sharedManager
{
  if (qword_1EBBCFD20 != -1) {
    dispatch_once(&qword_1EBBCFD20, &unk_1F2043990);
  }
  v2 = (void *)qword_1EBBCFD18;
  return v2;
}

- (CKDPCSKeySyncManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)CKDPCSKeySyncManager;
  v2 = [(CKDPCSKeySyncManager *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    keySyncTrackerByServiceNameByAccount = v2->_keySyncTrackerByServiceNameByAccount;
    v2->_keySyncTrackerByServiceNameByAccount = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cloudkit.keySyncQueue", v5);
    keySyncQueue = v2->_keySyncQueue;
    v2->_keySyncQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (id)_on_queue_getKeySyncTrackerByServicenameForAccount:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v5, v6);
  v10 = objc_msgSend_dsid(v4, v8, v9);
  v12 = objc_msgSend_objectForKeyedSubscript_(v7, v11, (uint64_t)v10);

  if (!v12)
  {
    v15 = objc_opt_new();
    v18 = objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v16, v17);
    v21 = objc_msgSend_dsid(v4, v19, v20);
    objc_msgSend_setObject_forKeyedSubscript_(v18, v22, (uint64_t)v15, v21);
  }
  v23 = objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v13, v14);
  v26 = objc_msgSend_dsid(v4, v24, v25);
  v28 = objc_msgSend_objectForKeyedSubscript_(v23, v27, (uint64_t)v26);

  return v28;
}

- (id)_on_queue_createSyncTrackerForAccount:(id)a3 requestorOperationID:(id)a4 service:(id)a5 manatee:(BOOL)a6 testOverrideProvider:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = objc_alloc_init(CKDPCSKeySyncTracker);
  objc_msgSend_setServiceName_(v16, v17, (uint64_t)v14);
  objc_msgSend_setManatee_(v16, v18, v8);
  v21 = objc_msgSend_dsid(v12, v19, v20);
  objc_msgSend_setAccountDsid_(v16, v22, (uint64_t)v21);

  objc_msgSend_setRequestorOperationID_(v16, v23, (uint64_t)v13);
  v26 = objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v24, v25);
  objc_sync_enter(v26);
  v28 = objc_msgSend__on_queue_getKeySyncTrackerByServicenameForAccount_(self, v27, (uint64_t)v12);
  objc_msgSend_setObject_forKeyedSubscript_(v28, v29, (uint64_t)v16, v14);

  objc_sync_exit(v26);
  return v16;
}

- (id)createSyncTrackerForAccount:(id)a3 requestorOperationID:(id)a4 service:(id)a5 manatee:(BOOL)a6 testOverrideProvider:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v18 = objc_msgSend_keySyncQueue(self, v16, v17);
  dispatch_assert_queue_V2(v18);

  uint64_t v20 = objc_msgSend__on_queue_createSyncTrackerForAccount_requestorOperationID_service_manatee_testOverrideProvider_(self, v19, (uint64_t)v15, v14, v13, v7, v12);

  return v20;
}

- (id)_on_queue_syncTrackerForAccount:(id)a3 requestorOperationID:(id)a4 service:(id)a5 manatee:(BOOL)a6 testOverrideProvider:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v18 = objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v16, v17);
  objc_sync_enter(v18);
  uint64_t v20 = objc_msgSend__on_queue_getKeySyncTrackerByServicenameForAccount_(self, v19, (uint64_t)v12);
  v22 = objc_msgSend_objectForKeyedSubscript_(v20, v21, (uint64_t)v14);
  uint64_t v25 = objc_msgSend_state(v22, v23, v24);
  if (!v22 || v25 == 3)
  {
    uint64_t v27 = objc_msgSend__on_queue_createSyncTrackerForAccount_requestorOperationID_service_manatee_testOverrideProvider_(self, v26, (uint64_t)v12, v13, v14, v8, v15);

    v22 = (void *)v27;
  }

  objc_sync_exit(v18);
  return v22;
}

- (id)syncTrackerForAccount:(id)a3 requestorOperationID:(id)a4 service:(id)a5 manatee:(BOOL)a6 testOverrideProvider:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v18 = objc_msgSend_keySyncQueue(self, v16, v17);
  dispatch_assert_queue_V2(v18);

  uint64_t v20 = objc_msgSend__on_queue_syncTrackerForAccount_requestorOperationID_service_manatee_testOverrideProvider_(self, v19, (uint64_t)v15, v14, v13, v7, v12);

  return v20;
}

- (void)_on_queue_performKeySyncWithSyncTracker:(id)a3 testableSyncConfig:(unint64_t)a4 shouldThrottle:(BOOL)a5 testOverrideProvider:(id)a6 requestorOperationID:(id)a7 completionHandler:(id)a8
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  SEL v77 = a2;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v18 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    v19 = v18;
    v22 = objc_msgSend_serviceName(v14, v20, v21);
    uint64_t v25 = objc_msgSend_accountDsid(v14, v23, v24);
    v28 = objc_msgSend_requestorOperationID(v14, v26, v27);
    *(_DWORD *)buf = 138543874;
    uint64_t v89 = (uint64_t)v22;
    __int16 v90 = 2112;
    v91 = v25;
    __int16 v92 = 2114;
    v93 = v28;
    _os_log_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_INFO, "Starting user key sync for service: %{public}@, account dsid %@, operation %{public}@", buf, 0x20u);
  }
  dispatch_group_t v29 = dispatch_group_create();
  objc_msgSend_setSyncGroup_(v14, v30, (uint64_t)v29);

  v33 = objc_msgSend_syncGroup(v14, v31, v32);
  dispatch_group_enter(v33);

  v36 = objc_msgSend_keySyncQueue(self, v34, v35);
  v78 = v17;
  v79 = v16;
  objc_msgSend_waitOnSyncWithQueue_waiterOperationID_handler_(v14, v37, (uint64_t)v36, v16, v17);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4EA5278;
  aBlock[3] = &unk_1E64F4A70;
  aBlock[4] = self;
  id v38 = v14;
  id v85 = v38;
  v39 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = sub_1C4EA5704;
  v80[3] = &unk_1E64F4A98;
  id v40 = v38;
  id v81 = v40;
  v82 = self;
  id v41 = v15;
  id v83 = v41;
  v42 = _Block_copy(v80);
  v86[0] = *MEMORY[0x1E4F94048];
  v45 = objc_msgSend_serviceName(v40, v43, v44);
  v87[0] = v45;
  v86[1] = *MEMORY[0x1E4F94018];
  v48 = objc_msgSend_accountDsid(v40, v46, v47);
  v87[1] = v48;
  v86[2] = *MEMORY[0x1E4F94030];
  v49 = _Block_copy(v42);
  v87[2] = v49;
  v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v50, (uint64_t)v87, v86, 3);

  v54 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v52, v53);
  v57 = objc_msgSend_currentPersona(v54, v55, v56);
  uint64_t v60 = objc_msgSend_userPersonaUniqueString(v57, v58, v59);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v61 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v89 = v60;
    _os_log_impl(&dword_1C4CFF000, v61, OS_LOG_TYPE_INFO, "Starting user key sync on current persona %@", buf, 0xCu);
  }
  if (*MEMORY[0x1E4F1A4E0])
  {
    v64 = objc_msgSend__pcsTestOverrideForKey_(v41, v62, @"ExpectedPersonaIdentifier");
    if (v64
      && (v67 = v64,
          objc_msgSend_CKNilIfEmpty(v64, v65, v66),
          uint64_t v68 = objc_claimAutoreleasedReturnValue(),
          v67,
          v68 | v60))
    {
      if ((objc_msgSend_isEqualToString_((void *)v68, v69, v60) & 1) == 0)
      {
        v75 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v70, v71);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v75, v76, (uint64_t)v77, self, @"CKDPCSKeySyncManager.m", 248, @"Expected persona identifier to match");
      }
    }
    else
    {
      uint64_t v68 = 0;
    }
  }
  switch(a4)
  {
    case 0uLL:
      PCSSyncKeyRegistryWithOptions();
      break;
    case 1uLL:
      v39[2](v39, 1, 0);
      goto LABEL_25;
    case 2uLL:
      if (objc_msgSend_isManatee(v40, v62, v63)) {
        uint64_t v73 = 5009;
      }
      else {
        uint64_t v73 = 5000;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v72, *MEMORY[0x1E4F19DD8], v73, @"Underlying user key sync error");
      goto LABEL_24;
    case 3uLL:
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v62, *MEMORY[0x1E4F19DD8], 228, @"Fake DBR account key sync failure");
      v74 = LABEL_24:;
      ((void (**)(void *, uint64_t, void *))v39)[2](v39, 0, v74);

LABEL_25:
      (*((void (**)(void *, void))v42 + 2))(v42, 0);
      break;
    default:
      break;
  }
}

- (void)performKeySyncWithSyncTracker:(id)a3 testableSyncConfig:(unint64_t)a4 shouldThrottle:(BOOL)a5 testOverrideProvider:(id)a6 requestorOperationID:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a5;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v21 = a3;
  v19 = objc_msgSend_keySyncQueue(self, v17, v18);
  dispatch_assert_queue_V2(v19);

  objc_msgSend__on_queue_performKeySyncWithSyncTracker_testableSyncConfig_shouldThrottle_testOverrideProvider_requestorOperationID_completionHandler_(self, v20, (uint64_t)v21, a4, v10, v16, v15, v14);
}

- (void)getKeySyncEligibilityForService:(id)a3 isManatee:(BOOL)a4 account:(id)a5 lastModifiedDate:(id)a6 testOverrideProvider:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v19 = a8;
  if (*MEMORY[0x1E4F1A4E0]
    && objc_msgSend__checkAndClearPCSTestOverrideForKey_(v16, v17, @"ResetKeySyncState"))
  {
    uint64_t v20 = objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v17, v18);
    objc_sync_enter(v20);
    v23 = objc_msgSend_keySyncTrackerByServiceNameByAccount(self, v21, v22);
    objc_msgSend_removeAllObjects(v23, v24, v25);

    objc_sync_exit(v20);
  }
  v26 = objc_msgSend_dsid(v14, v17, v18);

  if (v26)
  {
    dispatch_group_t v29 = objc_msgSend_keySyncQueue(self, v27, v28);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4EA5CF8;
    block[3] = &unk_1E64F0D78;
    block[4] = self;
    id v32 = v14;
    id v33 = v13;
    id v34 = v15;
    id v35 = v19;
    dispatch_async(v29, block);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v30 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_INFO, "No account DSID, so we can't start user key sync", buf, 2u);
    }
    if (v19) {
      (*((void (**)(id, void))v19 + 2))(v19, 0);
    }
  }
}

- (void)syncUserKeysForService:(id)a3 context:(id)a4 bundleID:(id)a5 serviceIsManatee:(BOOL)a6 account:(id)a7 shouldThrottle:(BOOL)a8 testOverrideProvider:(id)a9 requestorOperationID:(id)a10 completionHandler:(id)a11
{
  BOOL v73 = a8;
  BOOL v12 = a6;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v75 = a4;
  id v76 = a5;
  id v17 = a7;
  id v18 = a9;
  id v77 = a10;
  id v21 = a11;
  if (!v16)
  {
    v67 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v67, v68, (uint64_t)a2, self, @"CKDPCSKeySyncManager.m", 334, @"Must provide a service name to syncUserKeys");
  }
  v78 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v19, v20);
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x2020000000;
  v94[3] = 0;
  uint64_t v24 = objc_msgSend_accountType(v17, v22, v23);
  BOOL v72 = v24 == 0;
  uint64_t v27 = objc_msgSend_dsid(v17, v25, v26);
  BOOL v28 = v27 == 0;

  if (!v28)
  {
    v31 = objc_msgSend_sharedNotifier(CKDPCSNotifier, v29, v30);
    unsigned int v35 = objc_msgSend_serviceNeedsDBRReauthentication_(v31, v32, (uint64_t)v16);
    if (!(v12 | v35) && objc_msgSend_hasOutstandingServicesNeedingDBRReauthentication(v31, v33, v34))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v36 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v97 = v16;
        _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Stingray service %@ requested key sync while other outstanding services require DBR re-auth. Adding service to services needing DBR re-auth.", buf, 0xCu);
      }
      id v95 = v16;
      id v38 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)&v95, 1);
      objc_msgSend_addServicesNeedingDBRReauthentication_(v31, v39, (uint64_t)v38);

      goto LABEL_12;
    }
    if (v35)
    {
LABEL_12:
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v33, *MEMORY[0x1E4F19DD8], 10006, @"Service blocked from performing key sync due to DBR account re-auth needed. Direct user to settings to re-auth their account.");
      id v40 = (CKDPCSKeySyncCoreAnalytics *)objc_claimAutoreleasedReturnValue();
      if (v21) {
        (*((void (**)(id, void, CKDPCSKeySyncCoreAnalytics *, void))v21 + 2))(v21, 0, v40, 0);
      }
      goto LABEL_32;
    }
    id v41 = objc_alloc_init(CKDPCSKeySyncCoreAnalytics);
    objc_msgSend_setServiceName_(v41, v42, (uint64_t)v16);
    uint64_t v44 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v43, v12);
    objc_msgSend_setIsManatee_(v41, v45, (uint64_t)v44);

    uint64_t v47 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v46, v73);
    objc_msgSend_setShouldThrottle_(v41, v48, (uint64_t)v47);

    objc_msgSend_setThrottledDurationSec_(v41, v49, (uint64_t)&unk_1F20AC6A8);
    objc_msgSend_setContext_(v41, v50, (uint64_t)v75);
    objc_msgSend_setBundleID_(v41, v51, (uint64_t)v76);
    if (*MEMORY[0x1E4F1A4E0])
    {
      char v54 = objc_msgSend__checkPCSTestOverrideForKey_(v18, v52, @"AllowThrottlingWithUnitTestAccount");
      if (v24) {
        char v56 = v54;
      }
      else {
        char v56 = 1;
      }
      BOOL v72 = v56;
      v57 = objc_msgSend__pcsTestOverrideForKey_(v18, v55, @"ResetKeySyncState");
      HIDWORD(v69) = objc_msgSend_BOOLValue(v57, v58, v59);

      int v61 = objc_msgSend__checkAndClearPCSTestOverrideForKey_(v18, v60, @"ForceKeySyncFailure");
      if (objc_msgSend_isEqualToString_(v16, v62, @"com.apple.reminders")
        && objc_msgSend__checkAndClearPCSTestOverrideForKey_(v18, v63, @"ForceKeySyncFailureForReminders"))
      {
        int v61 = 1;
      }
      LODWORD(v69) = v61 != 0;
      if (objc_msgSend__checkAndClearPCSTestOverrideForKey_(v18, v63, @"FakeDBRAccountNeedsReauthenticationPCSError"))
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v64 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_DEBUG, "Faking DBR account needs re-authentication error from PCS", buf, 2u);
        }
        char v65 = 1;
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v69 = 0;
    }
    char v65 = 0;
LABEL_31:
    uint64_t v66 = objc_msgSend_keySyncQueue(self, v52, v53, v69);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4EA6590;
    block[3] = &unk_1E64F4AE8;
    char v88 = v71;
    block[4] = self;
    v80 = v41;
    v87 = v94;
    id v81 = v78;
    BOOL v89 = v12;
    id v86 = v21;
    id v82 = v17;
    id v83 = v77;
    id v84 = v16;
    id v85 = v18;
    BOOL v90 = v73;
    BOOL v91 = v72;
    char v92 = v70;
    char v93 = v65;
    id v40 = v41;
    dispatch_async(v66, block);

LABEL_32:
    goto LABEL_33;
  }
  v31 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v29, *MEMORY[0x1E4F19DD8], 1002, @"No account DSID, so we can't start user key sync");
  if (v21) {
    (*((void (**)(id, void, void *, void))v21 + 2))(v21, 0, v31, 0);
  }
LABEL_33:

  _Block_object_dispose(v94, 8);
}

- (void)setRacedWithGuitarfishRepairCallbackOnAllOutstandingHandlersWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v7 = objc_msgSend_keySyncQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4EA6E34;
  v9[3] = &unk_1E64F0E18;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (NSMutableDictionary)keySyncTrackerByServiceNameByAccount
{
  return self->_keySyncTrackerByServiceNameByAccount;
}

- (void)setKeySyncTrackerByServiceNameByAccount:(id)a3
{
}

- (OS_dispatch_queue)keySyncQueue
{
  return self->_keySyncQueue;
}

- (void)setKeySyncQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySyncQueue, 0);
  objc_storeStrong((id *)&self->_keySyncTrackerByServiceNameByAccount, 0);
}

@end