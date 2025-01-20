@interface BCCloudKitController
+ (BCCloudKitController)sharedInstance;
+ (id)databaseFolderURLForConfiguration:(id)a3;
+ (id)instanceForCKNotification:(id)a3;
+ (id)p_createDatabaseArchiveDirectoryForConfiguration:(id)a3;
+ (id)p_privateDatabaseArchiveURLForConfiguration:(id)a3;
+ (id)secureSharedInstance;
+ (void)deleteCloudDataWithCompletion:(id)a3;
+ (void)registerForSecureNotifications;
- (BCCloudKitController)initWithConfiguration:(id)a3;
- (BCCloudKitDatabaseController)privateCloudDatabaseController;
- (BCCloudKitTransactionManager)transactionManager;
- (BCContainerConfiguration)configuration;
- (BOOL)didChangeContainer;
- (BOOL)enableCloudSync;
- (BOOL)gettingAccountInfo;
- (BOOL)serviceMode;
- (BUCoalescingCallBlock)coalescedAttachment;
- (BUCoalescingCallBlock)coalescedChangeAttachment;
- (CKContainer)container;
- (NSMutableArray)pendingGetAccountInfoCompletionBlocks;
- (NSMutableArray)pendingRequestUpdateAttachmentCompletionBlocks;
- (NSString)currentUserIDName;
- (OS_dispatch_queue)accessQueue;
- (int64_t)currentStatus;
- (void)_attachOrSignalFetchChangesTransaction:(id)a3 reason:(id)a4;
- (void)_reestablishSyncEngineSalt;
- (void)_reestablishSyncEngineSaltIfNeeded;
- (void)_updateAccountCacheWithCompletionBlock:(id)a3;
- (void)applicationDidBecomeActive;
- (void)aq_flushPendingGetAccountInfoCompletionBlocksWithWillRetryUpdateAttachment:(BOOL)a3;
- (void)aq_requestUpdateAttachment;
- (void)aq_requestUpdateAttachmentWithCompletion:(id)a3;
- (void)aq_setGettingAccountInfo:(BOOL)a3 willRetryUpdateAttachment:(BOOL)a4;
- (void)attachOrSignalFetchChangesTransaction:(id)a3 reason:(id)a4;
- (void)handleRemoteCKNotification:(id)a3;
- (void)handleRemoteNotification:(id)a3;
- (void)p_accountChanged:(id)a3;
- (void)p_accountReallyChangedWithCompletion:(id)a3;
- (void)p_flushPendingRequestUpdateAttachmentCompletionBlocks;
- (void)p_flushPendingRequestUpdateAttachmentCompletionBlocksWithAttached:(BOOL)a3 reachable:(BOOL)a4;
- (void)p_getAccountInfo;
- (void)p_getAccountInfoWithCompletion:(id)a3;
- (void)p_getNecessaryAccountInfoFromContainer:(id)a3 completion:(id)a4;
- (void)p_identityChanged:(id)a3;
- (void)p_testAccountChanged:(id)a3;
- (void)p_updateAttachment;
- (void)requestUpdateAttachmentWithCompletion:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setCoalescedAttachment:(id)a3;
- (void)setCoalescedChangeAttachment:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentStatus:(int64_t)a3;
- (void)setCurrentUserIDName:(id)a3;
- (void)setDidChangeContainer:(BOOL)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setEnableCloudSync:(BOOL)a3 serviceMode:(BOOL)a4;
- (void)setGettingAccountInfo:(BOOL)a3;
- (void)setPrivateCloudDatabaseController:(id)a3;
- (void)setServiceMode:(BOOL)a3;
- (void)setTransactionManager:(id)a3;
@end

@implementation BCCloudKitController

+ (BCCloudKitController)sharedInstance
{
  if (qword_26AD77620 != -1) {
    dispatch_once(&qword_26AD77620, &unk_26E971E50);
  }
  v2 = (void *)qword_26AD77638;
  return (BCCloudKitController *)v2;
}

+ (id)secureSharedInstance
{
  if (qword_268854B68 != -1) {
    dispatch_once(&qword_268854B68, &unk_26E971E70);
  }
  v2 = (void *)qword_268854B60;
  return v2;
}

+ (void)registerForSecureNotifications
{
  v3 = BDSCloudKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2360BC000, v3, OS_LOG_TYPE_DEFAULT, "BCCloudKitController - registerForSecureNotifications", buf, 2u);
  }

  v11 = objc_msgSend_configuration(BCCloudKitSecureConfiguration, v4, v5, v6, v7, v8, v9, v10);
  v12 = [BCCloudKitDatabaseController alloc];
  v19 = objc_msgSend_p_privateDatabaseArchiveURLForConfiguration_(a1, v13, (uint64_t)v11, v14, v15, v16, v17, v18);
  v25 = objc_msgSend_initWithConfiguration_archiveURL_(v12, v20, (uint64_t)v11, (uint64_t)v19, v21, v22, v23, v24);

  if ((objc_msgSend_hasSubscription(v25, v26, v27, v28, v29, v30, v31, v32) & 1) == 0)
  {
    objc_msgSend_queueIdentifier(v11, v33, v34, v35, v36, v37, v38, v39);
    id v40 = objc_claimAutoreleasedReturnValue();
    v48 = (const char *)objc_msgSend_UTF8String(v40, v41, v42, v43, v44, v45, v46, v47);
    v49 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v50 = dispatch_queue_create(v48, v49);

    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = sub_236109C5C;
    v52[3] = &unk_264CA2240;
    id v53 = v11;
    dispatch_queue_t v54 = v50;
    id v56 = a1;
    id v55 = v25;
    v51 = v50;
    dispatch_async(v51, v52);
  }
}

+ (id)instanceForCKNotification:(id)a3
{
  uint64_t v8 = objc_msgSend_containerIdentifier(a3, a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  uint64_t v16 = objc_msgSend_sharedInstance(BCCloudKitController, v9, v10, v11, v12, v13, v14, v15);
  uint64_t v24 = objc_msgSend_configuration(BCCloudKitSecureConfiguration, v17, v18, v19, v20, v21, v22, v23);
  uint64_t v32 = objc_msgSend_configuration(v16, v25, v26, v27, v28, v29, v30, v31);
  id v40 = objc_msgSend_containerIdentifier(v32, v33, v34, v35, v36, v37, v38, v39);
  int isEqualToString = objc_msgSend_isEqualToString_(v8, v41, (uint64_t)v40, v42, v43, v44, v45, v46);

  if (isEqualToString)
  {
    id v55 = v16;
LABEL_5:
    v71 = v55;
    goto LABEL_7;
  }
  id v56 = objc_msgSend_containerIdentifier(v24, v48, v49, v50, v51, v52, v53, v54);
  int v63 = objc_msgSend_isEqualToString_(v8, v57, (uint64_t)v56, v58, v59, v60, v61, v62);

  if (v63)
  {
    objc_msgSend_sharedManager(BDSSecureManager, v64, v65, v66, v67, v68, v69, v70);
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v71 = 0;
LABEL_7:

  return v71;
}

- (BCCloudKitController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v135.receiver = self;
  v135.super_class = (Class)BCCloudKitController;
  uint64_t v5 = [(BCCloudKitController *)&v135 init];
  uint64_t v12 = v5;
  if (v5)
  {
    objc_msgSend_setConfiguration_(v5, v6, (uint64_t)v4, v7, v8, v9, v10, v11);
    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingGetAccountInfoCompletionBlocks = v12->_pendingGetAccountInfoCompletionBlocks;
    v12->_pendingGetAccountInfoCompletionBlocks = v13;

    uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingRequestUpdateAttachmentCompletionBlocks = v12->_pendingRequestUpdateAttachmentCompletionBlocks;
    v12->_pendingRequestUpdateAttachmentCompletionBlocks = v15;

    v12->_currentStatus = 0;
    objc_msgSend_queueIdentifier(v4, v17, v18, v19, v20, v21, v22, v23);
    id v24 = objc_claimAutoreleasedReturnValue();
    uint64_t v32 = (const char *)objc_msgSend_UTF8String(v24, v25, v26, v27, v28, v29, v30, v31);
    v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v34 = dispatch_queue_create(v32, v33);

    objc_storeStrong((id *)&v12->_accessQueue, v34);
    uint64_t v42 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v35, v36, v37, v38, v39, v40, v41);
    uint64_t v50 = objc_msgSend_defaultCenter(MEMORY[0x263F087C8], v43, v44, v45, v46, v47, v48, v49);
    objc_msgSend_addObserver_selector_name_object_(v50, v51, (uint64_t)v12, (uint64_t)sel_p_testAccountChanged_, @"com.apple.BDSService.BCCloudAccountChanged", 0, v52, v53);

    objc_msgSend_addObserver_selector_name_object_(v42, v54, (uint64_t)v12, (uint64_t)sel_p_accountChanged_, *MEMORY[0x263EFD478], 0, v55, v56);
    objc_msgSend_addObserver_selector_name_object_(v42, v57, (uint64_t)v12, (uint64_t)sel_p_identityChanged_, *MEMORY[0x263EFD4B8], 0, v58, v59);
    uint64_t v60 = [BCCloudKitDatabaseController alloc];
    uint64_t v61 = objc_opt_class();
    uint64_t v68 = objc_msgSend_p_privateDatabaseArchiveURLForConfiguration_(v61, v62, (uint64_t)v4, v63, v64, v65, v66, v67);
    uint64_t v74 = objc_msgSend_initWithConfiguration_archiveURL_(v60, v69, (uint64_t)v4, (uint64_t)v68, v70, v71, v72, v73);
    privateCloudDatabaseController = v12->_privateCloudDatabaseController;
    v12->_privateCloudDatabaseController = (BCCloudKitDatabaseController *)v74;

    v76 = v12->_privateCloudDatabaseController;
    v84 = objc_msgSend_containerIdentifier(v4, v77, v78, v79, v80, v81, v82, v83);
    uint64_t v92 = objc_msgSend_serviceMode(v12, v85, v86, v87, v88, v89, v90, v91);
    v133[0] = MEMORY[0x263EF8330];
    v133[1] = 3221225472;
    v133[2] = sub_23610A7D4;
    v133[3] = &unk_264CA2268;
    v93 = v12;
    v134 = v93;
    objc_msgSend_willAttachToContainer_serviceMode_completion_(v76, v94, (uint64_t)v84, v92, (uint64_t)v133, v95, v96, v97);

    objc_initWeak(&location, v93);
    id v98 = objc_alloc(MEMORY[0x263F2BA50]);
    v130[0] = MEMORY[0x263EF8330];
    v130[1] = 3221225472;
    v130[2] = sub_23610A7E0;
    v130[3] = &unk_264CA1608;
    objc_copyWeak(&v131, &location);
    uint64_t v102 = objc_msgSend_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_(v98, v99, (uint64_t)v130, 10, @"_coalescedAttachment in BCCloudKitController", (uint64_t)&unk_26E971EB0, v100, v101);
    v103 = v93[7];
    v93[7] = (void *)v102;

    objc_msgSend_setCoalescingDelay_(v93[7], v104, v105, v106, v107, v108, v109, v110, 2.0);
    id v111 = objc_alloc(MEMORY[0x263F2BA50]);
    uint64_t v125 = MEMORY[0x263EF8330];
    uint64_t v126 = 3221225472;
    v127 = sub_23610AA50;
    v128 = &unk_264CA1608;
    objc_copyWeak(&v129, &location);
    uint64_t v115 = objc_msgSend_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_(v111, v112, (uint64_t)&v125, 45, @"_coalescedChangeAttachment in BCCloudKitController", (uint64_t)&unk_26E971ED0, v113, v114);
    v116 = v93[8];
    v93[8] = (void *)v115;

    objc_msgSend_setCoalescingDelay_(v93[8], v117, v118, v119, v120, v121, v122, v123, 5.0, v125, v126, v127, v128);
    objc_destroyWeak(&v129);
    objc_destroyWeak(&v131);
    objc_destroyWeak(&location);
  }
  return v12;
}

- (void)setEnableCloudSync:(BOOL)a3 serviceMode:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v7 = BDSCloudKitLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend_configuration(self, v8, v9, v10, v11, v12, v13, v14);
    uint64_t v23 = objc_msgSend_containerIdentifier(v15, v16, v17, v18, v19, v20, v21, v22);
    id v24 = (void *)v23;
    v25 = @"NO";
    if (v5) {
      uint64_t v26 = @"YES";
    }
    else {
      uint64_t v26 = @"NO";
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v39 = v23;
    uint64_t v41 = v26;
    __int16 v40 = 2114;
    if (v4) {
      v25 = @"YES";
    }
    __int16 v42 = 2114;
    uint64_t v43 = v25;
    _os_log_impl(&dword_2360BC000, v7, OS_LOG_TYPE_DEFAULT, "BCCloudKitController (%{public}@) #enableCloudSync setEnableCloudSync %{public}@ serviceMode:%{public}@", buf, 0x20u);
  }
  dispatch_queue_t v34 = objc_msgSend_accessQueue(self, v27, v28, v29, v30, v31, v32, v33);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_23610AF88;
  v35[3] = &unk_264CA2290;
  v35[4] = self;
  BOOL v36 = v4;
  BOOL v37 = v5;
  dispatch_async(v34, v35);
}

- (void)requestUpdateAttachmentWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_accessQueue(self, v5, v6, v7, v8, v9, v10, v11);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_23610B0A8;
  v14[3] = &unk_264CA17F0;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async(v12, v14);
}

- (void)aq_requestUpdateAttachment
{
}

- (void)aq_requestUpdateAttachmentWithCompletion:(id)a3
{
  if (a3)
  {
    id v9 = a3;
    uint64_t v17 = objc_msgSend_pendingRequestUpdateAttachmentCompletionBlocks(self, v10, v11, v12, v13, v14, v15, v16);
    uint64_t v18 = _Block_copy(v9);

    objc_msgSend_addObject_(v17, v19, (uint64_t)v18, v20, v21, v22, v23, v24);
  }
  objc_msgSend_coalescedAttachment(self, a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalWithCompletion_(v31, v25, (uint64_t)&unk_26E971EF0, v26, v27, v28, v29, v30);
}

- (void)p_flushPendingRequestUpdateAttachmentCompletionBlocks
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v3 = BDSCloudKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = objc_msgSend_configuration(self, v4, v5, v6, v7, v8, v9, v10);
    uint64_t v19 = objc_msgSend_containerIdentifier(v11, v12, v13, v14, v15, v16, v17, v18);
    *(_DWORD *)buf = 138543362;
    BOOL v37 = v19;
    _os_log_impl(&dword_2360BC000, v3, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - p_flushPendingRequestUpdateAttachmentCompletionBlocks", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v27 = objc_msgSend_privateCloudDatabaseController(self, v20, v21, v22, v23, v24, v25, v26);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_23610B2F0;
  v34[3] = &unk_264CA22E0;
  objc_copyWeak(&v35, (id *)buf);
  v34[4] = self;
  objc_msgSend_getAttached_(v27, v28, (uint64_t)v34, v29, v30, v31, v32, v33);

  objc_destroyWeak(&v35);
  objc_destroyWeak((id *)buf);
}

- (void)p_flushPendingRequestUpdateAttachmentCompletionBlocksWithAttached:(BOOL)a3 reachable:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v121 = *MEMORY[0x263EF8340];
  uint64_t v7 = BDSCloudKitLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = objc_msgSend_configuration(self, v8, v9, v10, v11, v12, v13, v14);
    uint64_t v23 = objc_msgSend_containerIdentifier(v15, v16, v17, v18, v19, v20, v21, v22);
    *(_DWORD *)buf = 138543874;
    v116 = v23;
    __int16 v117 = 2048;
    uint64_t v118 = v5;
    __int16 v119 = 2048;
    BOOL v120 = v4;
    _os_log_impl(&dword_2360BC000, v7, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - p_flushPendingRequestUpdateAttachmentCompletionBlocksWithAttached:%lu reachable:%lu", buf, 0x20u);
  }
  uint64_t v31 = objc_msgSend_accessQueue(self, v24, v25, v26, v27, v28, v29, v30);
  dispatch_assert_queue_V2(v31);

  uint64_t v39 = objc_msgSend_pendingRequestUpdateAttachmentCompletionBlocks(self, v32, v33, v34, v35, v36, v37, v38);
  uint64_t v47 = objc_msgSend_copy(v39, v40, v41, v42, v43, v44, v45, v46);

  uint64_t v55 = objc_msgSend_pendingRequestUpdateAttachmentCompletionBlocks(self, v48, v49, v50, v51, v52, v53, v54);
  objc_msgSend_removeAllObjects(v55, v56, v57, v58, v59, v60, v61, v62);

  if (objc_msgSend_count(v47, v63, v64, v65, v66, v67, v68, v69))
  {
    uint64_t v70 = BDSCloudKitLog();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v78 = objc_msgSend_configuration(self, v71, v72, v73, v74, v75, v76, v77);
      uint64_t v86 = objc_msgSend_containerIdentifier(v78, v79, v80, v81, v82, v83, v84, v85);
      uint64_t v94 = objc_msgSend_count(v47, v87, v88, v89, v90, v91, v92, v93);
      *(_DWORD *)buf = 138543618;
      v116 = v86;
      __int16 v117 = 2048;
      uint64_t v118 = v94;
      _os_log_impl(&dword_2360BC000, v70, OS_LOG_TYPE_DEFAULT, "BCCloudKitController (%{public}@) - Calling %lu requestUpdateAttachment completion block(s)", buf, 0x16u);
    }
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v95 = v47;
    uint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v96, (uint64_t)&v110, (uint64_t)v114, 16, v97, v98, v99);
    if (v100)
    {
      uint64_t v101 = v100;
      uint64_t v102 = *(void *)v111;
      do
      {
        uint64_t v103 = 0;
        do
        {
          if (*(void *)v111 != v102) {
            objc_enumerationMutation(v95);
          }
          v104 = _Block_copy(*(const void **)(*((void *)&v110 + 1) + 8 * v103));
          uint64_t v105 = v104;
          if (v104) {
            (*((void (**)(void *, BOOL, BOOL))v104 + 2))(v104, v5, v4);
          }

          ++v103;
        }
        while (v101 != v103);
        uint64_t v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v106, (uint64_t)&v110, (uint64_t)v114, 16, v107, v108, v109);
      }
      while (v101);
    }
  }
}

- (void)p_updateAttachment
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  uint64_t v3 = BDSCloudKitSyncLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend_configuration(self, v4, v5, v6, v7, v8, v9, v10);
    uint64_t v19 = objc_msgSend_containerIdentifier(v11, v12, v13, v14, v15, v16, v17, v18);
    *(_DWORD *)buf = 138543362;
    uint64_t v38 = v19;
    _os_log_impl(&dword_2360BC000, v3, OS_LOG_TYPE_DEFAULT, "BCCloudKitController (%{public}@) - p_updateAttachment", buf, 0xCu);
  }
  uint64_t v27 = objc_msgSend_privateCloudDatabaseController(self, v20, v21, v22, v23, v24, v25, v26);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_23610B898;
  v34[3] = &unk_264CA22E0;
  objc_copyWeak(&v35, &location);
  v34[4] = self;
  objc_msgSend_getAttached_(v27, v28, (uint64_t)v34, v29, v30, v31, v32, v33);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_sharedInstance(BCCloudKitController, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v20 = objc_msgSend_configuration(v12, v13, v14, v15, v16, v17, v18, v19);
  uint64_t v27 = objc_msgSend_databaseFolderURLForConfiguration_(a1, v21, (uint64_t)v20, v22, v23, v24, v25, v26);

  id v35 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v28, v29, v30, v31, v32, v33, v34);
  id v81 = 0;
  objc_msgSend_removeItemAtURL_error_(v35, v36, (uint64_t)v27, (uint64_t)&v81, v37, v38, v39, v40);
  id v41 = v81;

  uint64_t v49 = objc_msgSend_secureSharedInstance(BCCloudKitController, v42, v43, v44, v45, v46, v47, v48);
  uint64_t v57 = objc_msgSend_configuration(v49, v50, v51, v52, v53, v54, v55, v56);
  uint64_t v64 = objc_msgSend_databaseFolderURLForConfiguration_(a1, v58, (uint64_t)v57, v59, v60, v61, v62, v63);

  uint64_t v72 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v65, v66, v67, v68, v69, v70, v71);
  id v80 = v41;
  objc_msgSend_removeItemAtURL_error_(v72, v73, (uint64_t)v64, (uint64_t)&v80, v74, v75, v76, v77);
  id v78 = v80;

  uint64_t v79 = (void (**)(void *, BOOL, id))_Block_copy(v4);
  if (v79) {
    v79[2](v79, v78 == 0, v78);
  }
}

+ (id)databaseFolderURLForConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v11 = objc_msgSend_applicationDocumentsDirectory(BDSApplication, v4, v5, v6, v7, v8, v9, v10);
  uint64_t v19 = objc_msgSend_dbArchiveFolderName(v3, v12, v13, v14, v15, v16, v17, v18);

  uint64_t v26 = objc_msgSend_stringByAppendingPathComponent_(v11, v20, (uint64_t)v19, v21, v22, v23, v24, v25);

  if (v26)
  {
    id v27 = objc_alloc(NSURL);
    isDirectory = objc_msgSend_initFileURLWithPath_isDirectory_(v27, v28, (uint64_t)v26, 1, v29, v30, v31, v32);
  }
  else
  {
    isDirectory = 0;
  }

  return isDirectory;
}

+ (id)p_createDatabaseArchiveDirectoryForConfiguration:(id)a3
{
  uint64_t v15 = objc_msgSend_databaseFolderURLForConfiguration_(a1, a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (v15)
  {
    uint64_t v16 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9, v10, v11, v12, v13, v14);
    int DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v16, v17, (uint64_t)v15, 1, 0, 0, v18, v19);

    id v21 = 0;
    if (DirectoryAtURL_withIntermediateDirectories_attributes_error) {
      id v21 = v15;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

+ (id)p_privateDatabaseArchiveURLForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v18 = objc_msgSend_p_createDatabaseArchiveDirectoryForConfiguration_(a1, v5, (uint64_t)v4, v6, v7, v8, v9, v10);
  if (v18)
  {
    uint64_t v19 = objc_msgSend_dbArchiveFilename(v4, v11, v12, v13, v14, v15, v16, v17);
    id v27 = objc_msgSend_dbArchiveExtension(v4, v20, v21, v22, v23, v24, v25, v26);
    uint64_t v34 = objc_msgSend_stringByAppendingPathExtension_(v19, v28, (uint64_t)v27, v29, v30, v31, v32, v33);

    id v41 = objc_msgSend_URLByAppendingPathComponent_(v18, v35, (uint64_t)v34, v36, v37, v38, v39, v40);
  }
  else
  {
    id v41 = 0;
  }

  return v41;
}

- (void)p_getNecessaryAccountInfoFromContainer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = objc_msgSend_configuration(self, v8, v9, v10, v11, v12, v13, v14);
  char v23 = objc_msgSend_requiresDeviceToDeviceEncryption(v15, v16, v17, v18, v19, v20, v21, v22);

  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_23610C3A0;
  v32[3] = &unk_264CA2380;
  char v35 = v23;
  id v33 = v6;
  id v34 = v7;
  id v24 = v7;
  id v25 = v6;
  objc_msgSend_accountStatusWithCompletionHandler_(v25, v26, (uint64_t)v32, v27, v28, v29, v30, v31);
}

- (void)p_getAccountInfo
{
  objc_msgSend_p_getAccountInfoWithCompletion_(self, a2, 0, v2, v3, v4, v5, v6);
}

- (void)p_getAccountInfoWithCompletion:(id)a3
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_accessQueue(self, v5, v6, v7, v8, v9, v10, v11);
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = BDSCloudKitLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = objc_msgSend_configuration(self, v14, v15, v16, v17, v18, v19, v20);
    uint64_t v29 = objc_msgSend_containerIdentifier(v21, v22, v23, v24, v25, v26, v27, v28);
    *(_DWORD *)buf = 138543362;
    objc_super v135 = v29;
    _os_log_impl(&dword_2360BC000, v13, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - p_getAccountInfo", buf, 0xCu);
  }
  if (v4)
  {
    uint64_t v37 = objc_msgSend_pendingGetAccountInfoCompletionBlocks(self, v30, v31, v32, v33, v34, v35, v36);
    uint64_t v38 = _Block_copy(v4);
    objc_msgSend_addObject_(v37, v39, (uint64_t)v38, v40, v41, v42, v43, v44);
  }
  if ((objc_msgSend_gettingAccountInfo(self, v30, v31, v32, v33, v34, v35, v36) & 1) == 0)
  {
    objc_msgSend_setGettingAccountInfo_(self, v45, 1, v46, v47, v48, v49, v50);
    uint64_t v51 = BDSCloudKitSyncLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      uint64_t v59 = objc_msgSend_configuration(self, v52, v53, v54, v55, v56, v57, v58);
      uint64_t v67 = objc_msgSend_containerIdentifier(v59, v60, v61, v62, v63, v64, v65, v66);
      *(_DWORD *)buf = 138543362;
      objc_super v135 = v67;
      _os_log_impl(&dword_2360BC000, v51, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - getAccountInfo self.gettingAccountInfo=YES", buf, 0xCu);
    }
    uint64_t v68 = (void *)MEMORY[0x263EFD610];
    uint64_t v76 = objc_msgSend_configuration(self, v69, v70, v71, v72, v73, v74, v75);
    uint64_t v84 = objc_msgSend_containerIdentifier(v76, v77, v78, v79, v80, v81, v82, v83);
    uint64_t v91 = objc_msgSend_containerWithIdentifier_(v68, v85, (uint64_t)v84, v86, v87, v88, v89, v90);

    uint64_t v99 = objc_msgSend_configuration(self, v92, v93, v94, v95, v96, v97, v98);
    uint64_t v107 = objc_msgSend_appBundleIdentifier(v99, v100, v101, v102, v103, v104, v105, v106);
    objc_msgSend_setSourceApplicationBundleIdentifier_(v91, v108, (uint64_t)v107, v109, v110, v111, v112, v113);

    objc_msgSend_setContainer_(self, v114, (uint64_t)v91, v115, v116, v117, v118, v119);
    if (v91)
    {
      objc_initWeak((id *)buf, self);
      v131[0] = MEMORY[0x263EF8330];
      v131[1] = 3221225472;
      v131[2] = sub_23610C830;
      v131[3] = &unk_264CA23F8;
      objc_copyWeak(&v133, (id *)buf);
      id v132 = v91;
      objc_msgSend_p_getNecessaryAccountInfoFromContainer_completion_(self, v126, (uint64_t)v132, (uint64_t)v131, v127, v128, v129, v130);

      objc_destroyWeak(&v133);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      objc_msgSend_setGettingAccountInfo_(self, v120, 0, v121, v122, v123, v124, v125);
    }
  }
}

- (void)setGettingAccountInfo:(BOOL)a3
{
  self->_gettingAccountInfo = a3;
  if (!a3)
  {
    uint64_t v9 = objc_msgSend_accessQueue(self, a2, a3, v3, v4, v5, v6, v7);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23610D224;
    block[3] = &unk_264CA1428;
    block[4] = self;
    dispatch_async(v9, block);
  }
}

- (void)aq_setGettingAccountInfo:(BOOL)a3 willRetryUpdateAttachment:(BOOL)a4
{
  BOOL v8 = a4;
  uint64_t v11 = objc_msgSend_accessQueue(self, a2, a3, a4, v4, v5, v6, v7);
  dispatch_assert_queue_V2(v11);

  self->_gettingAccountInfo = a3;
  if (!a3)
  {
    MEMORY[0x270F9A6D0](self, sel_aq_flushPendingGetAccountInfoCompletionBlocksWithWillRetryUpdateAttachment_, v8, v12, v13, v14, v15, v16);
  }
}

- (void)aq_flushPendingGetAccountInfoCompletionBlocksWithWillRetryUpdateAttachment:(BOOL)a3
{
  BOOL v8 = a3;
  uint64_t v99 = *MEMORY[0x263EF8340];
  uint64_t v10 = objc_msgSend_accessQueue(self, a2, a3, v3, v4, v5, v6, v7);
  dispatch_assert_queue_V2(v10);

  uint64_t v18 = objc_msgSend_pendingGetAccountInfoCompletionBlocks(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = objc_msgSend_copy(v18, v19, v20, v21, v22, v23, v24, v25);

  uint64_t v34 = objc_msgSend_pendingGetAccountInfoCompletionBlocks(self, v27, v28, v29, v30, v31, v32, v33);
  objc_msgSend_removeAllObjects(v34, v35, v36, v37, v38, v39, v40, v41);

  if (objc_msgSend_count(v26, v42, v43, v44, v45, v46, v47, v48))
  {
    uint64_t v49 = BDSCloudKitLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v57 = objc_msgSend_configuration(self, v50, v51, v52, v53, v54, v55, v56);
      uint64_t v65 = objc_msgSend_containerIdentifier(v57, v58, v59, v60, v61, v62, v63, v64);
      *(_DWORD *)buf = 138543874;
      uint64_t v94 = v65;
      __int16 v95 = 2048;
      uint64_t v96 = objc_msgSend_count(v26, v66, v67, v68, v69, v70, v71, v72);
      __int16 v97 = 1024;
      BOOL v98 = v8;
      _os_log_impl(&dword_2360BC000, v49, OS_LOG_TYPE_DEFAULT, "BCCloudKitController (%{public}@) - Calling %lu getAccountInfo completion block(s), willRetryUpdateAttachment: %d", buf, 0x1Cu);
    }
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v73 = v26;
    uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v88, (uint64_t)v92, 16, v75, v76, v77);
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = *(void *)v89;
      do
      {
        uint64_t v81 = 0;
        do
        {
          if (*(void *)v89 != v80) {
            objc_enumerationMutation(v73);
          }
          uint64_t v82 = _Block_copy(*(const void **)(*((void *)&v88 + 1) + 8 * v81));
          uint64_t v83 = v82;
          if (v82) {
            (*((void (**)(void *, BOOL))v82 + 2))(v82, v8);
          }

          ++v81;
        }
        while (v79 != v81);
        uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v84, (uint64_t)&v88, (uint64_t)v92, 16, v85, v86, v87);
      }
      while (v79);
    }
  }
}

- (void)applicationDidBecomeActive
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v3 = BDSCloudKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = objc_msgSend_configuration(self, v4, v5, v6, v7, v8, v9, v10);
    uint64_t v19 = objc_msgSend_containerIdentifier(v11, v12, v13, v14, v15, v16, v17, v18);
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v19;
    _os_log_impl(&dword_2360BC000, v3, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - applicationDidBecomeActive", buf, 0xCu);
  }
  uint64_t v27 = objc_msgSend_accessQueue(self, v20, v21, v22, v23, v24, v25, v26);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23610D5E0;
  block[3] = &unk_264CA1428;
  block[4] = self;
  dispatch_async(v27, block);
}

- (void)handleRemoteNotification:(id)a3
{
  objc_msgSend_notificationFromRemoteNotificationDictionary_(MEMORY[0x263EFD760], a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleRemoteCKNotification_(self, v9, (uint64_t)v15, v10, v11, v12, v13, v14);
}

- (void)handleRemoteCKNotification:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = BDSCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_msgSend_container(self, v6, v7, v8, v9, v10, v11, v12);
    uint64_t v21 = objc_msgSend_containerIdentifier(v13, v14, v15, v16, v17, v18, v19, v20);
    int v43 = 138543362;
    uint64_t v44 = v21;
    _os_log_impl(&dword_2360BC000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) handleRemoteNotification:", (uint8_t *)&v43, 0xCu);
  }
  uint64_t v29 = objc_msgSend_subscriptionID(v4, v22, v23, v24, v25, v26, v27, v28);

  uint64_t v37 = objc_msgSend_copy(v29, v30, v31, v32, v33, v34, v35, v36);
  objc_msgSend__attachOrSignalFetchChangesTransaction_reason_(self, v38, (uint64_t)v37, @"handleRemoteNotification", v39, v40, v41, v42);
}

- (void)_attachOrSignalFetchChangesTransaction:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v15 = objc_msgSend_privateCloudDatabaseController(self, v8, v9, v10, v11, v12, v13, v14);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_23610D95C;
  v34[3] = &unk_264CA2420;
  objc_copyWeak(&v37, &location);
  id v16 = v6;
  id v35 = v16;
  id v17 = v7;
  id v36 = v17;
  objc_msgSend_getAttached_(v15, v18, (uint64_t)v34, v19, v20, v21, v22, v23);

  uint64_t v31 = objc_msgSend_accessQueue(self, v24, v25, v26, v27, v28, v29, v30);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23610DB64;
  block[3] = &unk_264CA0B70;
  objc_copyWeak(&v33, &location);
  dispatch_async(v31, block);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

- (void)attachOrSignalFetchChangesTransaction:(id)a3 reason:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  uint64_t v14 = objc_msgSend_privateCloudDatabaseController(self, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v22 = objc_msgSend_subscriptionID(v14, v15, v16, v17, v18, v19, v20, v21);
  int isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)v35, v24, v25, v26, v27, v28);

  if (isEqualToString) {
    objc_msgSend__attachOrSignalFetchChangesTransaction_reason_(self, v30, (uint64_t)v35, (uint64_t)v6, v31, v32, v33, v34);
  }
}

- (void)_updateAccountCacheWithCompletionBlock:(id)a3
{
  id v4 = a3;
  BDSCloudKitSyncLog();
  uint64_t v5 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG)) {
    sub_2361FB96C(self, v5, v6, v7, v8, v9, v10, v11);
  }

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  objc_initWeak(&location, self);
  uint64_t v19 = objc_msgSend_accessQueue(self, v12, v13, v14, v15, v16, v17, v18);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23610DDB4;
  block[3] = &unk_264CA24E8;
  objc_copyWeak(&v24, &location);
  id v22 = v4;
  uint64_t v23 = v26;
  void block[4] = self;
  id v20 = v4;
  dispatch_async(v19, block);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(v26, 8);
}

- (void)p_testAccountChanged:(id)a3
{
  uint64_t v9 = objc_msgSend_shared(MEMORY[0x263F2BA58], a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  int v17 = objc_msgSend_verboseLoggingEnabled(v9, v10, v11, v12, v13, v14, v15, v16);

  uint64_t v18 = BDSCloudKitLog();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
  if (v17)
  {
    if (v19) {
      sub_2361FBDB0(self, (const char *)v18, v20, v21, v22, v23, v24, v25);
    }
  }
  else if (v19)
  {
    sub_2361FBE4C(self, (const char *)v18, v20, v21, v22, v23, v24, v25);
  }

  uint64_t v33 = objc_msgSend_shared(MEMORY[0x263F2BA58], v26, v27, v28, v29, v30, v31, v32);
  int v41 = objc_msgSend_verboseLoggingEnabled(v33, v34, v35, v36, v37, v38, v39, v40);

  if (v41)
  {
    uint64_t v42 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v64 = 0;
      _os_log_impl(&dword_2360BC000, v42, OS_LOG_TYPE_DEFAULT, "\"\\\"p_testAccountChanged CloudkitLogging Enabled!\\\"\"", v64, 2u);
    }
  }
  BDSCloudKitLog();
  int v43 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR)) {
    sub_2361FBD14(self, v43, v44, v45, v46, v47, v48, v49);
  }

  uint64_t v57 = objc_msgSend_coalescedChangeAttachment(self, v50, v51, v52, v53, v54, v55, v56);
  objc_msgSend_signalWithCompletion_(v57, v58, (uint64_t)&unk_26E971F10, v59, v60, v61, v62, v63);
}

- (void)p_accountChanged:(id)a3
{
  uint64_t v4 = (char *)a3;
  uint64_t v5 = BDSCloudKitSyncLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_2361FBEE8(self, v4, (uint64_t)v5, v6, v7, v8, v9, v10);
  }

  uint64_t v18 = objc_msgSend_coalescedChangeAttachment(self, v11, v12, v13, v14, v15, v16, v17);
  objc_msgSend_signalWithCompletion_(v18, v19, (uint64_t)&unk_26E971F30, v20, v21, v22, v23, v24);
}

- (void)p_accountReallyChangedWithCompletion:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = BDSCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_msgSend_configuration(self, v6, v7, v8, v9, v10, v11, v12);
    uint64_t v21 = objc_msgSend_containerIdentifier(v13, v14, v15, v16, v17, v18, v19, v20);
    uint64_t v29 = objc_msgSend_currentUserIDName(self, v22, v23, v24, v25, v26, v27, v28);
    *(_DWORD *)buf = 138543874;
    uint64_t v68 = v21;
    __int16 v69 = 2112;
    uint64_t v70 = v29;
    __int16 v71 = 2048;
    uint64_t v72 = objc_msgSend_currentStatus(self, v30, v31, v32, v33, v34, v35, v36);
    _os_log_impl(&dword_2360BC000, v5, OS_LOG_TYPE_DEFAULT, "p_accountChanged (%{public}@) account=%@ status=%ld", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v37 = (void *)MEMORY[0x263F087E8];
  uint64_t v65 = *MEMORY[0x263F08320];
  uint64_t v66 = @"Account changed";
  uint64_t v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)&v66, (uint64_t)&v65, 1, v39, v40, v41);
  uint64_t v47 = objc_msgSend_errorWithDomain_code_userInfo_(v37, v43, @"BDSCloudKitClientError", 2001, (uint64_t)v42, v44, v45, v46);

  uint64_t v55 = objc_msgSend_privateCloudDatabaseController(self, v48, v49, v50, v51, v52, v53, v54);
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = sub_23610EC00;
  v62[3] = &unk_264CA0AD0;
  objc_copyWeak(&v64, (id *)buf);
  id v56 = v4;
  id v63 = v56;
  objc_msgSend_detachWithError_completion_(v55, v57, (uint64_t)v47, (uint64_t)v62, v58, v59, v60, v61);

  objc_destroyWeak(&v64);
  objc_destroyWeak((id *)buf);
}

- (void)p_identityChanged:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = BDSCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_msgSend_configuration(self, v6, v7, v8, v9, v10, v11, v12);
    uint64_t v21 = objc_msgSend_containerIdentifier(v13, v14, v15, v16, v17, v18, v19, v20);
    *(_DWORD *)buf = 138543362;
    int v43 = v21;
    _os_log_impl(&dword_2360BC000, v5, OS_LOG_TYPE_DEFAULT, "p_identityChanged (%{public}@)", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v22, @"BDSCloudKitClientError", 2005, 0, v23, v24, v25);
  uint64_t v34 = objc_msgSend_privateCloudDatabaseController(self, v27, v28, v29, v30, v31, v32, v33);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = sub_23610EF38;
  v40[3] = &unk_264CA1598;
  objc_copyWeak(&v41, (id *)buf);
  v40[4] = self;
  objc_msgSend_detachWithError_completion_(v34, v35, (uint64_t)v26, (uint64_t)v40, v36, v37, v38, v39);

  objc_destroyWeak(&v41);
  objc_destroyWeak((id *)buf);
}

- (void)_reestablishSyncEngineSalt
{
  objc_msgSend_shared(_TtC13BookDataStore13BDSSyncEngine, a2, v2, v3, v4, v5, v6, v7);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reestablishSalt(v15, v8, v9, v10, v11, v12, v13, v14);
}

- (void)_reestablishSyncEngineSaltIfNeeded
{
  objc_msgSend_shared(_TtC13BookDataStore13BDSSyncEngine, a2, v2, v3, v4, v5, v6, v7);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reestablishSaltIfNeeded(v15, v8, v9, v10, v11, v12, v13, v14);
}

- (BCCloudKitTransactionManager)transactionManager
{
  return self->_transactionManager;
}

- (void)setTransactionManager:(id)a3
{
}

- (BCCloudKitDatabaseController)privateCloudDatabaseController
{
  return (BCCloudKitDatabaseController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrivateCloudDatabaseController:(id)a3
{
}

- (BOOL)didChangeContainer
{
  return self->_didChangeContainer;
}

- (void)setDidChangeContainer:(BOOL)a3
{
  self->_didChangeContainer = a3;
}

- (BCContainerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (BOOL)gettingAccountInfo
{
  return self->_gettingAccountInfo;
}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  self->_enableCloudSync = a3;
}

- (BOOL)serviceMode
{
  return self->_serviceMode;
}

- (void)setServiceMode:(BOOL)a3
{
  self->_serviceMode = a3;
}

- (BUCoalescingCallBlock)coalescedAttachment
{
  return self->_coalescedAttachment;
}

- (void)setCoalescedAttachment:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedChangeAttachment
{
  return self->_coalescedChangeAttachment;
}

- (void)setCoalescedChangeAttachment:(id)a3
{
}

- (NSMutableArray)pendingGetAccountInfoCompletionBlocks
{
  return self->_pendingGetAccountInfoCompletionBlocks;
}

- (NSMutableArray)pendingRequestUpdateAttachmentCompletionBlocks
{
  return self->_pendingRequestUpdateAttachmentCompletionBlocks;
}

- (NSString)currentUserIDName
{
  return self->_currentUserIDName;
}

- (void)setCurrentUserIDName:(id)a3
{
}

- (int64_t)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(int64_t)a3
{
  self->_currentStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserIDName, 0);
  objc_storeStrong((id *)&self->_pendingRequestUpdateAttachmentCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pendingGetAccountInfoCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_coalescedChangeAttachment, 0);
  objc_storeStrong((id *)&self->_coalescedAttachment, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_privateCloudDatabaseController, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
}

@end