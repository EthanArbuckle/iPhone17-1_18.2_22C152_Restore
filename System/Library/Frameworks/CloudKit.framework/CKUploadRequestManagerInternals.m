@interface CKUploadRequestManagerInternals
- (BOOL)canPerformFunction:(int64_t)a3;
- (BOOL)hasRegisteredActivity;
- (BOOL)ignoringSystemConditions;
- (BOOL)isRepairRecordActionable:(id)a3;
- (CKAssetRepairScheduler)repairProcessor;
- (CKContainer)container;
- (CKContainer)repairContainer;
- (CKSchedulerActivity)observedRepairActivity;
- (CKSyncEngine)repairZoneSyncEngine;
- (CKUploadRequestConfiguration)repairContainerOverrides;
- (CKUploadRequestManagerInternals)initWithContainer:(id)a3 repairContainerOverrides:(id)a4;
- (CKUploadRequestManagerInternals)initWithContainer:(id)a3 repairContainerOverrides:(id)a4 ignoringSystemConditions:(BOOL)a5;
- (CKUploadRequestManagerResponseActionThrottler)responseActionThrottler;
- (CKUploadRequestManagerStateMachine)stateMachine;
- (CKUploadRequestPersistentStore)database;
- (NSMutableDictionary)callbackForOverridePoint;
- (NSObject)accountChangeObserver;
- (NSString)activityIdentifierForSchedulingRepairs;
- (NSString)assignedMachServiceName;
- (NSString)cachesDirectory;
- (NSString)deviceID;
- (NSString)machServiceName;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)stateMachineQueue;
- (OS_dispatch_queue)stateQueue;
- (__SCNetworkReachability)reachability;
- (double)assetRepairSchedulerDefaultSuspensionTime;
- (double)cancelledErrorRetryTime;
- (double)notificationDebouncePeriod;
- (double)recurringFetchPeriod;
- (double)retryableErrorMaxRetryCount;
- (double)retryableErrorRetryTime;
- (double)tryAgainLaterRetryTime;
- (id)assetRequestCallback;
- (id)createDatabase;
- (id)createStateMachine;
- (id)nextRepairDateForDate:(id)a3;
- (id)packageRequestCallback;
- (id)repairActivityHandler;
- (id)repairZoneID;
- (id)repairableAssetsForDate:(id)a3;
- (id)scheduledAccountStatusCheck;
- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4;
- (int)fetchAllToken;
- (int64_t)assetRepairSchedulerRepairBatchCountLimit;
- (int64_t)assetRepairSchedulerRepairRetryCount;
- (void)assetRepairScheduler:(id)a3 completedRepairWithMetadata:(id)a4 error:(id)a5;
- (void)assetRepairScheduler:(id)a3 completedRequestWithMetadata:(id)a4 result:(int64_t)a5;
- (void)assetRepairSchedulerAllRequestsComplete:(id)a3;
- (void)cancelScheduledEvent;
- (void)checkAccountID;
- (void)checkAccountStatus;
- (void)checkNetworkReachability;
- (void)closeSyncEngine;
- (void)commonInitWithContainer:(id)a3 repairContainerOverrides:(id)a4;
- (void)dealloc;
- (void)dispatchAsyncOnStateQueue:(id)a3;
- (void)dispatchEvent:(int64_t)a3;
- (void)dispatchEvent:(int64_t)a3 synchronously:(BOOL)a4;
- (void)fetchRepairContainerMetadata;
- (void)fetchServerChanges:(id)a3;
- (void)finishSchedulerCallbackWithDeferral:(BOOL)a3;
- (void)invokeCallbackForOverridePoint:(int64_t)a3 withError:(id)a4 onCallbackQueue:(BOOL)a5;
- (void)manuallyTriggerUploadRequests;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openSyncEngine;
- (void)performRepairs;
- (void)registerForAccountNotifications;
- (void)registerForFetchAllNotifications;
- (void)registerForNetworkReachability;
- (void)registerForRepairScheduler;
- (void)respondToStateMachineAction:(int64_t)a3 isRetry:(BOOL)a4;
- (void)respondToStateMachineChangeState:(int64_t)a3 enter:(BOOL)a4;
- (void)scheduleNextSync;
- (void)scheduleOrInvokeRepairsNow;
- (void)scheduleRecordRepair:(id)a3 withDelay:(double)a4 increasingCount:(BOOL)a5;
- (void)scheduleRecurringFetch;
- (void)scheduleRepairsWithDelay:(double)a3;
- (void)setAccountChangeObserver:(id)a3;
- (void)setAssetRepairSchedulerDefaultSuspensionTime:(double)a3;
- (void)setAssetRepairSchedulerRepairBatchCountLimit:(int64_t)a3;
- (void)setAssetRepairSchedulerRepairRetryCount:(int64_t)a3;
- (void)setAssetRequestCallback:(id)a3;
- (void)setAssignedMachServiceName:(id)a3;
- (void)setCachesDirectory:(id)a3;
- (void)setCallback:(id)a3 forOverridePoint:(int64_t)a4;
- (void)setCallbackForOverridePoint:(id)a3;
- (void)setCancelledErrorRetryTime:(double)a3;
- (void)setDatabase:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setFetchAllToken:(int)a3;
- (void)setHasRegisteredActivity:(BOOL)a3;
- (void)setMachServiceName:(id)a3;
- (void)setNotificationDebouncePeriod:(double)a3;
- (void)setObservedRepairActivity:(id)a3;
- (void)setPackageRequestCallback:(id)a3;
- (void)setReachability:(__SCNetworkReachability *)a3;
- (void)setRecurringFetchPeriod:(double)a3;
- (void)setRepairActivityHandler:(id)a3;
- (void)setRepairProcessor:(id)a3;
- (void)setRepairZoneSyncEngine:(id)a3;
- (void)setRetryableErrorMaxRetryCount:(double)a3;
- (void)setRetryableErrorRetryTime:(double)a3;
- (void)setScheduledAccountStatusCheck:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setTryAgainLaterRetryTime:(double)a3;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4;
- (void)unregisterFromAccountNotifications;
- (void)unregisterFromFetchAllNotifications;
- (void)unregisterFromNetworkReachability;
@end

@implementation CKUploadRequestManagerInternals

- (double)recurringFetchPeriod
{
  double result = self->_recurringFetchPeriod;
  if (result == -1.0) {
    return 604800.0;
  }
  return result;
}

- (double)tryAgainLaterRetryTime
{
  double result = self->_tryAgainLaterRetryTime;
  if (result == -1.0) {
    return 604800.0;
  }
  return result;
}

- (double)retryableErrorRetryTime
{
  double result = self->_retryableErrorRetryTime;
  if (result == -1.0) {
    return 259200.0;
  }
  return result;
}

- (double)cancelledErrorRetryTime
{
  double result = self->_cancelledErrorRetryTime;
  if (result == -1.0) {
    return 86400.0;
  }
  return result;
}

- (double)retryableErrorMaxRetryCount
{
  double result = self->_retryableErrorMaxRetryCount;
  if (result == -1.0) {
    return 10.0;
  }
  return result;
}

- (double)notificationDebouncePeriod
{
  double result = self->_notificationDebouncePeriod;
  if (result == -1.0) {
    return 0.2;
  }
  return result;
}

- (CKUploadRequestManagerInternals)initWithContainer:(id)a3 repairContainerOverrides:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKUploadRequestManagerInternals;
  v8 = [(CKUploadRequestManagerInternals *)&v12 init];
  v10 = v8;
  if (v8) {
    objc_msgSend_commonInitWithContainer_repairContainerOverrides_(v8, v9, (uint64_t)v6, (uint64_t)v7);
  }

  return v10;
}

- (CKUploadRequestManagerInternals)initWithContainer:(id)a3 repairContainerOverrides:(id)a4 ignoringSystemConditions:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKUploadRequestManagerInternals;
  v10 = [(CKUploadRequestManagerInternals *)&v14 init];
  objc_super v12 = v10;
  if (v10)
  {
    v10->_ignoringSystemConditions = a5;
    objc_msgSend_commonInitWithContainer_repairContainerOverrides_(v10, v11, (uint64_t)v8, (uint64_t)v9);
  }

  return v12;
}

- (void)commonInitWithContainer:(id)a3 repairContainerOverrides:(id)a4
{
  id v117 = a3;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_recurringFetchPeriod = _Q0;
  *(_OWORD *)&self->_retryableErrorRetryTime = _Q0;
  *(_OWORD *)&self->_retryableErrorMaxRetryCount = _Q0;
  self->_assetRepairSchedulerRepairBatchCountLimit = -1;
  self->_assetRepairSchedulerDefaultSuspensionTime = -1.0;
  self->_assetRepairSchedulerRepairRetryCount = -1;
  if (__sTestOverridesAvailable)
  {
    id v11 = a4;
    id v12 = objc_alloc((Class)sub_18B0725AC());
    v16 = objc_msgSend_containerID(v117, v13, v14, v15);
    v20 = objc_msgSend_options(v117, v17, v18, v19);
    v24 = objc_msgSend_options(v117, v21, v22, v23);
    v28 = objc_msgSend_testDeviceReferenceProtocol(v24, v25, v26, v27);
    v30 = (CKContainer *)objc_msgSend_initWithContainerID_options_testDeviceReferenceProtocol_(v12, v29, (uint64_t)v16, (uint64_t)v20, v28);
  }
  else
  {
    id v31 = a4;
    v32 = [CKContainer alloc];
    v16 = objc_msgSend_containerID(v117, v33, v34, v35);
    v20 = objc_msgSend_options(v117, v36, v37, v38);
    v30 = (CKContainer *)objc_msgSend_initWithContainerID_options_(v32, v39, (uint64_t)v16, (uint64_t)v20);
  }

  container = self->_container;
  self->_container = v30;
  v41 = v30;

  objc_msgSend_createRepairContainerFromContainer_withOverrides_(CKAssetRepairOperationUtilities, v42, (uint64_t)v117, (uint64_t)a4);
  v43 = (CKContainer *)objc_claimAutoreleasedReturnValue();
  repairContainer = self->_repairContainer;
  self->_repairContainer = v43;

  v48 = (CKUploadRequestConfiguration *)objc_msgSend_copy(a4, v45, v46, v47);
  repairContainerOverrides = self->_repairContainerOverrides;
  self->_repairContainerOverrides = v48;

  v50 = NSString;
  v54 = objc_msgSend_containerID(v117, v51, v52, v53);
  v58 = objc_msgSend_containerIdentifier(v54, v55, v56, v57);
  objc_msgSend_stringWithFormat_(v50, v59, @"%@.%@", v60, @"com.apple.cloudkit.uploadrequest.statemachine", v58);
  id v61 = objc_claimAutoreleasedReturnValue();
  v65 = (const char *)objc_msgSend_UTF8String(v61, v62, v63, v64);
  v66 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v67 = (OS_dispatch_queue *)dispatch_queue_create(v65, v66);
  p_stateMachineQueue = &self->_stateMachineQueue;
  stateMachineQueue = self->_stateMachineQueue;
  self->_stateMachineQueue = v67;

  v70 = NSString;
  v74 = objc_msgSend_containerID(v117, v71, v72, v73);
  v78 = objc_msgSend_containerIdentifier(v74, v75, v76, v77);
  objc_msgSend_stringWithFormat_(v70, v79, @"%@.%@", v80, @"com.apple.cloudkit.uploadrequest.state", v78);
  id v81 = objc_claimAutoreleasedReturnValue();
  v85 = (const char *)objc_msgSend_UTF8String(v81, v82, v83, v84);
  v86 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v87 = (OS_dispatch_queue *)dispatch_queue_create(v85, v86);
  p_stateQueue = &self->_stateQueue;
  stateQueue = self->_stateQueue;
  self->_stateQueue = v87;

  v90 = NSString;
  v94 = objc_msgSend_containerID(v117, v91, v92, v93);
  v98 = objc_msgSend_containerIdentifier(v94, v95, v96, v97);
  objc_msgSend_stringWithFormat_(v90, v99, @"%@.%@", v100, @"com.apple.cloudkit.uploadrequest.callback", v98);
  id v101 = objc_claimAutoreleasedReturnValue();
  v105 = (const char *)objc_msgSend_UTF8String(v101, v102, v103, v104);
  v106 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v107 = dispatch_queue_create(v105, v106);
  callbackQueue = self->_callbackQueue;
  p_callbackQueue = (dispatch_queue_t *)&self->_callbackQueue;
  dispatch_queue_t *p_callbackQueue = v107;

  dispatch_queue_set_specific((dispatch_queue_t)*p_stateMachineQueue, p_stateMachineQueue, (void *)1, 0);
  dispatch_queue_set_specific((dispatch_queue_t)*p_stateQueue, p_stateQueue, (void *)1, 0);
  dispatch_queue_set_specific(*p_callbackQueue, p_callbackQueue, (void *)1, 0);
  uint64_t v110 = objc_opt_new();
  v111 = *(p_callbackQueue - 3);
  *(p_callbackQueue - 3) = (dispatch_queue_t)v110;

  v114 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v112, (uint64_t)&unk_1ED845F28, v113);
  objc_msgSend_setActionsToThrottle_(*(p_callbackQueue - 3), v115, (uint64_t)v114, v116);
}

- (void)dealloc
{
  reachability = self->_reachability;
  if (reachability)
  {
    CFRelease(reachability);
    self->_reachability = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKUploadRequestManagerInternals;
  [(CKUploadRequestManagerInternals *)&v4 dealloc];
}

- (NSString)activityIdentifierForSchedulingRepairs
{
  v5 = objc_msgSend_container(self, a2, v2, v3);
  id v8 = objc_msgSend_activityIdentifierForSchedulingRepairsInContainer_(CKUploadRequestManager, v6, (uint64_t)v5, v7);

  if (objc_msgSend_ignoringSystemConditions(self, v9, v10, v11))
  {
    uint64_t v14 = objc_msgSend_identifierWithImmediateInvocationForIdentifier_(CKScheduler, v12, (uint64_t)v8, v13);

    id v8 = (void *)v14;
  }

  return (NSString *)v8;
}

- (NSString)machServiceName
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_machServiceName;
  objc_sync_exit(v2);

  return v3;
}

- (void)setMachServiceName:(id)a3
{
  id v27 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  if ((objc_msgSend_isEqualToString_(v4->_machServiceName, v5, (uint64_t)v27, v6) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend_assignedMachServiceName(v4, v7, v8, v9);
    if (v13)
    {
      uint64_t v14 = objc_msgSend_assignedMachServiceName(v4, v10, v11, v12);
      char isEqualToString = objc_msgSend_isEqualToString_(v27, v15, (uint64_t)v14, v16);

      if ((isEqualToString & 1) == 0)
      {
        v20 = [CKException alloc];
        v24 = objc_msgSend_assignedMachServiceName(v4, v21, v22, v23);
        id v26 = (id)objc_msgSend_initWithCode_format_(v20, v25, 12, @"Cannot assign new machServiceName %@ when previous port %@ is still being used", v27, v24);

        objc_exception_throw(v26);
      }
    }
    uint64_t v18 = objc_msgSend_copy(v27, v10, v11, v12);
    machServiceName = v4->_machServiceName;
    v4->_machServiceName = (NSString *)v18;
  }
  objc_sync_exit(v4);
}

- (id)repairZoneID
{
  objc_super v4 = objc_msgSend_repairContainerOverrides(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_repairZoneID(v4, v5, v6, v7);
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    uint64_t v11 = [CKRecordZoneID alloc];
    id v10 = (id)objc_msgSend_initWithZoneName_ownerName_(v11, v12, @"RepairZone", @"__defaultOwner__");
  }
  uint64_t v13 = v10;

  return v13;
}

- (void)setRepairActivityHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_stateQueue(self, v5, v6, v7);
  dispatch_assert_queue_V2(v8);

  if (self->_repairActivityHandler != v4)
  {
    uint64_t v9 = _Block_copy(v4);
    id repairActivityHandler = self->_repairActivityHandler;
    self->_id repairActivityHandler = v9;

    if (v4)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v11 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
      {
        __int16 v15 = 0;
        uint64_t v12 = "Setting handler when entering repair activity";
        uint64_t v13 = (uint8_t *)&v15;
LABEL_12:
        _os_log_debug_impl(&dword_18AF10000, v11, OS_LOG_TYPE_DEBUG, v12, v13, 2u);
      }
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v11 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
      {
        __int16 v14 = 0;
        uint64_t v12 = "Clearing handler when exiting repair activity";
        uint64_t v13 = (uint8_t *)&v14;
        goto LABEL_12;
      }
    }
  }
}

- (CKUploadRequestManagerStateMachine)stateMachine
{
  v5 = objc_msgSend_stateMachineQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  stateMachine = self->_stateMachine;
  if (!stateMachine)
  {
    objc_msgSend_createStateMachine(self, v6, v7, v8);
    id v10 = (CKUploadRequestManagerStateMachine *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = self->_stateMachine;
    self->_stateMachine = v10;

    objc_msgSend_start(self->_stateMachine, v12, v13, v14);
    stateMachine = self->_stateMachine;
  }

  return stateMachine;
}

- (void)setStateMachine:(id)a3
{
  uint64_t v11 = (CKUploadRequestManagerStateMachine *)a3;
  uint64_t v8 = objc_msgSend_stateMachineQueue(self, v5, v6, v7);
  dispatch_assert_queue_V2(v8);

  stateMachine = self->_stateMachine;
  p_stateMachine = &self->_stateMachine;
  if (stateMachine != v11) {
    objc_storeStrong((id *)p_stateMachine, a3);
  }
}

- (id)createDatabase
{
  v5 = objc_msgSend_container(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_containerIdentifier(v5, v6, v7, v8);

  id v10 = NSString;
  uint64_t v14 = objc_msgSend_CKSafeStringForPathComponent(v9, v11, v12, v13);
  v17 = objc_msgSend_stringWithFormat_(v10, v15, @"com.apple.cloudkit.uploadrequest.%@.cache", v16, v14);

  uint64_t v18 = [CKUploadRequestPersistentStore alloc];
  uint64_t v19 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v23 = objc_msgSend_cachesDirectory(self, v20, v21, v22);
  id v26 = objc_msgSend_stringByAppendingPathComponent_(v23, v24, (uint64_t)v17, v25);
  v28 = objc_msgSend_fileURLWithPath_isDirectory_(v19, v27, (uint64_t)v26, 0);
  id v31 = objc_msgSend_initWithDatabaseURL_(v18, v29, (uint64_t)v28, v30);

  return v31;
}

- (void)setReachability:(__SCNetworkReachability *)a3
{
  reachability = self->_reachability;
  if (reachability != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      reachability = self->_reachability;
    }
    self->_reachability = a3;
    if (reachability)
    {
      CFRelease(reachability);
    }
  }
}

- (void)fetchServerChanges:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_stateQueue(self, v5, v6, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B09387C;
  v11[3] = &unk_1E5460058;
  p_stateQueue = &self->_stateQueue;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  ck_call_or_dispatch_sync_if_not_key(v8, p_stateQueue, v11);
}

- (void)manuallyTriggerUploadRequests
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_18B093B80;
  v3[3] = &unk_1E5460350;
  v3[4] = self;
  objc_msgSend_fetchServerChanges_(self, a2, (uint64_t)v3, v2);
}

- (void)dispatchEvent:(int64_t)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    uint64_t v7 = (void (*)(void *, void *))MEMORY[0x1E4F147E8];
  }
  else {
    uint64_t v7 = (void (*)(void *, void *))MEMORY[0x1E4F14768];
  }
  uint64_t v8 = objc_msgSend_stateQueue(self, a2, a3, a4);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B093C70;
  v13[3] = &unk_1E5463198;
  v13[4] = self;
  v13[5] = a3;
  v7(v8, v13);

  if (v4)
  {
    id v12 = objc_msgSend_stateQueue(self, v9, v10, v11);
    dispatch_sync(v12, &unk_1ED7EF138);
  }
}

- (void)dispatchAsyncOnStateQueue:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_stateQueue(self, v5, v6, v7);
  dispatch_async(v8, v4);
}

- (void)setCallback:(id)a3 forOverridePoint:(int64_t)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_stateQueue(self, v7, v8, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B093DAC;
  v12[3] = &unk_1E54631C0;
  id v13 = v6;
  int64_t v14 = a4;
  v12[4] = self;
  id v11 = v6;
  ck_call_or_dispatch_sync_if_not_key(v10, &self->_stateQueue, v12);
}

- (void)invokeCallbackForOverridePoint:(int64_t)a3 withError:(id)a4 onCallbackQueue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_18AF13D54;
  id v26 = sub_18AF138D0;
  id v27 = 0;
  id v12 = objc_msgSend_stateQueue(self, v9, v10, v11);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_18B094030;
  v21[3] = &unk_1E54631E8;
  v21[4] = self;
  v21[5] = &v22;
  v21[6] = a3;
  ck_call_or_dispatch_sync_if_not_key(v12, &self->_stateQueue, v21);

  uint64_t v16 = v23[5];
  if (v16)
  {
    if (v5)
    {
      v17 = objc_msgSend_callbackQueue(self, v13, v14, v15);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_18B0940BC;
      block[3] = &unk_1E5460080;
      v20 = &v22;
      id v19 = v8;
      dispatch_async(v17, block);
    }
    else
    {
      (*(void (**)(uint64_t, id))(v16 + 16))(v16, v8);
    }
  }
  _Block_object_dispose(&v22, 8);
}

- (BOOL)ignoringSystemConditions
{
  return self->_ignoringSystemConditions;
}

- (void)setRecurringFetchPeriod:(double)a3
{
  self->_recurringFetchPeriod = a3;
}

- (void)setTryAgainLaterRetryTime:(double)a3
{
  self->_tryAgainLaterRetryTime = a3;
}

- (void)setRetryableErrorRetryTime:(double)a3
{
  self->_retryableErrorRetryTime = a3;
}

- (void)setCancelledErrorRetryTime:(double)a3
{
  self->_cancelledErrorRetryTime = a3;
}

- (void)setRetryableErrorMaxRetryCount:(double)a3
{
  self->_retryableErrorMaxRetryCount = a3;
}

- (void)setNotificationDebouncePeriod:(double)a3
{
  self->_notificationDebouncePeriod = a3;
}

- (int64_t)assetRepairSchedulerRepairBatchCountLimit
{
  return self->_assetRepairSchedulerRepairBatchCountLimit;
}

- (void)setAssetRepairSchedulerRepairBatchCountLimit:(int64_t)a3
{
  self->_assetRepairSchedulerRepairBatchCountLimit = a3;
}

- (double)assetRepairSchedulerDefaultSuspensionTime
{
  return self->_assetRepairSchedulerDefaultSuspensionTime;
}

- (void)setAssetRepairSchedulerDefaultSuspensionTime:(double)a3
{
  self->_assetRepairSchedulerDefaultSuspensionTime = a3;
}

- (int64_t)assetRepairSchedulerRepairRetryCount
{
  return self->_assetRepairSchedulerRepairRetryCount;
}

- (void)setAssetRepairSchedulerRepairRetryCount:(int64_t)a3
{
  self->_assetRepairSchedulerRepairRetryCount = a3;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKContainer)repairContainer
{
  return self->_repairContainer;
}

- (CKUploadRequestConfiguration)repairContainerOverrides
{
  return self->_repairContainerOverrides;
}

- (CKSyncEngine)repairZoneSyncEngine
{
  return self->_repairZoneSyncEngine;
}

- (void)setRepairZoneSyncEngine:(id)a3
{
}

- (NSString)assignedMachServiceName
{
  return self->_assignedMachServiceName;
}

- (void)setAssignedMachServiceName:(id)a3
{
}

- (BOOL)hasRegisteredActivity
{
  return self->_hasRegisteredActivity;
}

- (void)setHasRegisteredActivity:(BOOL)a3
{
  self->_hasRegisteredActivity = a3;
}

- (CKAssetRepairScheduler)repairProcessor
{
  return self->_repairProcessor;
}

- (void)setRepairProcessor:(id)a3
{
}

- (CKUploadRequestPersistentStore)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)cachesDirectory
{
  return self->_cachesDirectory;
}

- (void)setCachesDirectory:(id)a3
{
}

- (__SCNetworkReachability)reachability
{
  return self->_reachability;
}

- (NSObject)accountChangeObserver
{
  return self->_accountChangeObserver;
}

- (void)setAccountChangeObserver:(id)a3
{
}

- (id)scheduledAccountStatusCheck
{
  return self->_scheduledAccountStatusCheck;
}

- (void)setScheduledAccountStatusCheck:(id)a3
{
}

- (int)fetchAllToken
{
  return self->_fetchAllToken;
}

- (void)setFetchAllToken:(int)a3
{
  self->_fetchAllToken = a3;
}

- (id)repairActivityHandler
{
  return self->_repairActivityHandler;
}

- (CKSchedulerActivity)observedRepairActivity
{
  return self->_observedRepairActivity;
}

- (void)setObservedRepairActivity:(id)a3
{
}

- (CKUploadRequestManagerResponseActionThrottler)responseActionThrottler
{
  return self->_responseActionThrottler;
}

- (OS_dispatch_queue)stateMachineQueue
{
  return self->_stateMachineQueue;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (NSMutableDictionary)callbackForOverridePoint
{
  return self->_callbackForOverridePoint;
}

- (void)setCallbackForOverridePoint:(id)a3
{
}

- (id)assetRequestCallback
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setAssetRequestCallback:(id)a3
{
}

- (id)packageRequestCallback
{
  return objc_getProperty(self, a2, 264, 1);
}

- (void)setPackageRequestCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_packageRequestCallback, 0);
  objc_storeStrong(&self->_assetRequestCallback, 0);
  objc_storeStrong((id *)&self->_callbackForOverridePoint, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_stateMachineQueue, 0);
  objc_storeStrong((id *)&self->_responseActionThrottler, 0);
  objc_storeStrong((id *)&self->_observedRepairActivity, 0);
  objc_storeStrong(&self->_repairActivityHandler, 0);
  objc_storeStrong(&self->_scheduledAccountStatusCheck, 0);
  objc_storeStrong((id *)&self->_accountChangeObserver, 0);
  objc_storeStrong((id *)&self->_cachesDirectory, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_repairProcessor, 0);
  objc_storeStrong((id *)&self->_assignedMachServiceName, 0);
  objc_storeStrong((id *)&self->_repairZoneSyncEngine, 0);
  objc_storeStrong((id *)&self->_repairContainerOverrides, 0);
  objc_storeStrong((id *)&self->_repairContainer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);

  objc_storeStrong((id *)&self->_stateMachine, 0);
}

- (void)assetRepairScheduler:(id)a3 completedRequestWithMetadata:(id)a4 result:(int64_t)a5
{
  if (a5 == 2)
  {
    uint64_t v7 = objc_msgSend_repairZoneRecordID(a4, a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_tryAgainLaterRetryTime(self, v8, v9, v10);
    objc_msgSend_scheduleRecordRepair_withDelay_increasingCount_(self, v11, (uint64_t)v7, 0);

    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v12, @"CKInternalErrorDomain", 10003, @"Repair deferred by caller");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = objc_msgSend_CKClientSuitableError(v18, v13, v14, v15);
    objc_msgSend_invokeCallbackForOverridePoint_withError_onCallbackQueue_(self, v17, 4, (uint64_t)v16, 1);
  }
}

- (void)assetRepairScheduler:(id)a3 completedRepairWithMetadata:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v12 = objc_msgSend_stateQueue(self, v9, v10, v11);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B094570;
  v16[3] = &unk_1E54614E0;
  p_stateQueue = &self->_stateQueue;
  v16[4] = self;
  id v17 = v8;
  id v18 = v7;
  id v14 = v7;
  id v15 = v8;
  ck_call_or_dispatch_sync_if_not_key(v12, p_stateQueue, v16);
}

- (void)assetRepairSchedulerAllRequestsComplete:(id)a3
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, (uint64_t)a3, v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_18B094BEC;
  v6[3] = &unk_1E5460350;
  v6[4] = self;
  ck_call_or_dispatch_sync_if_not_key(v5, &self->_stateQueue, v6);
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_18AF10000, "client/data-repair-record-was-changed", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend_invokeCallbackForOverridePoint_withError_onCallbackQueue_(self, v9, 3, 0, 1);
  id v13 = objc_msgSend_stateQueue(self, v10, v11, v12);
  p_stateQueue = &self->_stateQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B094D34;
  v16[3] = &unk_1E5461F80;
  v16[4] = self;
  id v15 = v7;
  id v17 = v15;
  ck_call_or_dispatch_sync_if_not_key(v13, p_stateQueue, v16);

  os_activity_scope_leave(&state);
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_18AF10000, "client/data-repair-record-was-deleted", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  id v15 = objc_msgSend_stateQueue(self, v12, v13, v14);
  p_stateQueue = &self->_stateQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_18B09516C;
  v18[3] = &unk_1E5461F80;
  v18[4] = self;
  id v17 = v9;
  id v19 = v17;
  ck_call_or_dispatch_sync_if_not_key(v15, p_stateQueue, v18);

  os_activity_scope_leave(&state);
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  id v5 = a4;
  id v9 = objc_msgSend_stateQueue(self, v6, v7, v8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B0953E4;
  v12[3] = &unk_1E5461F80;
  p_stateQueue = &self->_stateQueue;
  v12[4] = self;
  id v13 = v5;
  id v11 = v5;
  ck_call_or_dispatch_sync_if_not_key(v9, p_stateQueue, v12);
}

- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_18AF10000, "client/data-repair-zone-was-changed", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v12 = objc_msgSend_stateQueue(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B095670;
  v14[3] = &unk_1E5461F80;
  id v13 = v7;
  id v15 = v13;
  uint64_t v16 = self;
  ck_call_or_dispatch_sync_if_not_key(v12, &self->_stateQueue, v14);

  os_activity_scope_leave(&state);
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_18AF10000, "client/data-repair-zone-was-deleted", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v12 = objc_msgSend_stateQueue(self, v9, v10, v11);
  p_stateQueue = &self->_stateQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B09588C;
  v15[3] = &unk_1E5461F80;
  v15[4] = self;
  id v14 = v7;
  id v16 = v14;
  ck_call_or_dispatch_sync_if_not_key(v12, p_stateQueue, v15);

  os_activity_scope_leave(&state);
}

- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_18AF10000, "client/data-repair-zone-was-purged", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v12 = objc_msgSend_stateQueue(self, v9, v10, v11);
  p_stateQueue = &self->_stateQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B095BB4;
  v15[3] = &unk_1E5461F80;
  v15[4] = self;
  id v14 = v7;
  id v16 = v14;
  ck_call_or_dispatch_sync_if_not_key(v12, p_stateQueue, v15);

  os_activity_scope_leave(&state);
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  return 0;
}

- (BOOL)isRepairRecordActionable:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v8 = objc_msgSend_stateQueue(self, v5, v6, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B095EDC;
  v11[3] = &unk_1E5463210;
  id v9 = v4;
  id v13 = self;
  id v14 = &v15;
  id v12 = v9;
  ck_call_or_dispatch_sync_if_not_key(v8, &self->_stateQueue, v11);

  LOBYTE(self) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)self;
}

- (void)scheduleRepairsWithDelay:(double)a3
{
  id v5 = _os_activity_create(&dword_18AF10000, "client/data-repair-schedule-repairs", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v9 = objc_msgSend_stateQueue(self, v6, v7, v8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B096488;
  v10[3] = &unk_1E5463198;
  v10[4] = self;
  *(double *)&v10[5] = a3;
  ck_call_or_dispatch_sync_if_not_key(v9, &self->_stateQueue, v10);

  os_activity_scope_leave(&state);
}

- (void)scheduleOrInvokeRepairsNow
{
  id v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_18B0967C4;
  v6[3] = &unk_1E5460350;
  v6[4] = self;
  ck_call_or_dispatch_sync_if_not_key(v5, &self->_stateQueue, v6);
}

- (void)scheduleRecordRepair:(id)a3 withDelay:(double)a4 increasingCount:(BOOL)a5
{
  id v8 = a3;
  id v12 = objc_msgSend_stateQueue(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B096980;
  v14[3] = &unk_1E5463238;
  void v14[4] = self;
  id v15 = v8;
  double v16 = a4;
  BOOL v17 = a5;
  id v13 = v8;
  ck_call_or_dispatch_sync_if_not_key(v12, &self->_stateQueue, v14);
}

- (id)repairableAssetsForDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v9 = objc_msgSend_stateQueue(self, v6, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B096CD8;
  v16[3] = &unk_1E54614E0;
  p_stateQueue = &self->_stateQueue;
  v16[4] = self;
  id v17 = v4;
  id v11 = v5;
  id v18 = v11;
  id v12 = v4;
  ck_call_or_dispatch_sync_if_not_key(v9, p_stateQueue, v16);

  id v13 = v18;
  id v14 = v11;

  return v14;
}

- (id)nextRepairDateForDate:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_18B0970F0;
  v20 = sub_18B097100;
  id v21 = 0;
  uint64_t v8 = objc_msgSend_stateQueue(self, v5, v6, v7);
  p_stateQueue = &self->_stateQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B097108;
  v13[3] = &unk_1E54628B8;
  v13[4] = self;
  id v10 = v4;
  id v14 = v10;
  id v15 = &v16;
  ck_call_or_dispatch_sync_if_not_key(v8, p_stateQueue, v13);

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (void)performRepairs
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/data-repair-perform-repairs", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  uint64_t v7 = objc_msgSend_stateQueue(self, v4, v5, v6);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B0972A4;
  v8[3] = &unk_1E5460350;
  v8[4] = self;
  ck_call_or_dispatch_sync_if_not_key(v7, &self->_stateQueue, v8);

  os_activity_scope_leave(&state);
}

- (id)createStateMachine
{
  objc_initWeak(&location, self);
  uint64_t v2 = [CKUploadRequestManagerStateMachine alloc];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B0977BC;
  v15[3] = &unk_1E5463288;
  objc_copyWeak(&v16, &location);
  uint64_t v5 = objc_msgSend_initWithActionHandler_(v2, v3, (uint64_t)v15, v4);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B097858;
  v13[3] = &unk_1E54632B0;
  objc_copyWeak(&v14, &location);
  objc_msgSend_setEnterStateHandler_(v5, v6, (uint64_t)v13, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B0978AC;
  v11[3] = &unk_1E54632B0;
  objc_copyWeak(&v12, &location);
  objc_msgSend_setExitStateHandler_(v5, v8, (uint64_t)v11, v9);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v5;
}

- (void)respondToStateMachineAction:(int64_t)a3 isRetry:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = objc_msgSend_stateMachineQueue(self, a2, a3, a4);
  dispatch_assert_queue_V2(v7);

  id v11 = objc_msgSend_responseActionThrottler(self, v8, v9, v10);
  objc_msgSend_gateResponseAction_isRetry_(v11, v12, a3, v4);

  id v16 = objc_msgSend_stateQueue(self, v13, v14, v15);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_18B0979D0;
  v17[3] = &unk_1E5463198;
  v17[4] = self;
  v17[5] = a3;
  dispatch_async(v16, v17);
}

- (void)respondToStateMachineChangeState:(int64_t)a3 enter:(BOOL)a4
{
  uint64_t v7 = objc_msgSend_stateMachineQueue(self, a2, a3, a4);
  dispatch_assert_queue_V2(v7);

  id v11 = objc_msgSend_stateQueue(self, v8, v9, v10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B098600;
  block[3] = &unk_1E5463300;
  BOOL v13 = a4;
  void block[4] = self;
  block[5] = a3;
  dispatch_async(v11, block);
}

- (void)dispatchEvent:(int64_t)a3
{
  uint64_t v6 = objc_msgSend_stateQueue(self, a2, a3, v3);
  dispatch_assert_queue_V2(v6);

  uint64_t v10 = objc_msgSend_stateMachineQueue(self, v7, v8, v9);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B0986D0;
  v11[3] = &unk_1E5463198;
  void v11[4] = self;
  void v11[5] = a3;
  dispatch_sync(v10, v11);
}

- (BOOL)canPerformFunction:(int64_t)a3
{
  int64_t v4 = a3;
  uint64_t v6 = objc_msgSend_stateQueue(self, a2, a3, v3);
  dispatch_assert_queue_V2(v6);

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v10 = objc_msgSend_stateMachineQueue(self, v7, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B09881C;
  block[3] = &unk_1E54631E8;
  void block[4] = self;
  block[5] = &v13;
  void block[6] = v4;
  dispatch_sync(v10, block);

  LOBYTE(v4) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v4;
}

- (void)registerForRepairScheduler
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/data-repair-scheduler-callback", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  uint64_t v7 = objc_msgSend_stateQueue(self, v4, v5, v6);
  dispatch_assert_queue_V2(v7);

  objc_initWeak(&location, self);
  if ((objc_msgSend_hasRegisteredActivity(self, v8, v9, v10) & 1) == 0)
  {
    objc_msgSend_setHasRegisteredActivity_(self, v11, 1, v12);
    char v16 = objc_msgSend_sharedScheduler(CKScheduler, v13, v14, v15);
    v20 = objc_msgSend_activityIdentifierForSchedulingRepairs(self, v17, v18, v19);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_18B0989F8;
    v22[3] = &unk_1E5463350;
    objc_copyWeak(&v23, &location);
    objc_msgSend_registerActivityIdentifier_handler_(v16, v21, (uint64_t)v20, (uint64_t)v22);

    objc_destroyWeak(&v23);
  }
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
}

- (void)finishSchedulerCallbackWithDeferral:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_stateQueue(self, a2, a3, v3);
  dispatch_assert_queue_V2(v6);

  uint64_t v10 = objc_msgSend_repairActivityHandler(self, v7, v8, v9);

  if (v10)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v11 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
    {
      id v27 = @"Finished";
      if (v4) {
        id v27 = @"Deferred";
      }
      int v28 = 138543362;
      v29 = v27;
      _os_log_debug_impl(&dword_18AF10000, v11, OS_LOG_TYPE_DEBUG, "Invoking persisted repair handler with %{public}@ result", (uint8_t *)&v28, 0xCu);
    }
    uint64_t v15 = objc_msgSend_observedRepairActivity(self, v12, v13, v14);
    char v16 = NSStringFromSelector(sel_shouldDefer);
    objc_msgSend_removeObserver_forKeyPath_context_(v15, v17, (uint64_t)self, (uint64_t)v16, qword_1E91287E0);

    objc_msgSend_setObservedRepairActivity_(self, v18, 0, v19);
    objc_msgSend_repairActivityHandler(self, v20, v21, v22);
    id v23 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRepairActivityHandler_(self, v24, 0, v25);
    if (v4) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = 1;
    }
    v23[2](v23, v26);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a4;
  uint64_t v12 = v8;
  if ((void *)qword_1E91287E0 == a6)
  {
    char shouldDefer = objc_msgSend_shouldDefer(v8, v9, v10, v11);
    id v17 = objc_msgSend_stateQueue(self, v14, v15, v16);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_18B098FCC;
    v18[3] = &unk_1E5463378;
    v18[4] = self;
    id v19 = v12;
    char v20 = shouldDefer;
    ck_call_or_dispatch_async_if_not_key(v17, &self->_stateQueue, v18);
  }
}

- (void)cancelScheduledEvent
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  uint64_t v9 = objc_msgSend_sharedScheduler(CKScheduler, v6, v7, v8);
  uint64_t v13 = objc_msgSend_activityIdentifierForSchedulingRepairs(self, v10, v11, v12);
  objc_msgSend_unregisterActivityIdentifier_(v9, v14, (uint64_t)v13, v15);

  MEMORY[0x1F4181798](self, sel_registerForRepairScheduler, v16, v17);
}

- (void)openSyncEngine
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  uint64_t v9 = objc_msgSend_repairZoneSyncEngine(self, v6, v7, v8);

  if (!v9)
  {
    objc_msgSend_machServiceName(self, v10, v11, v12);
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAssignedMachServiceName_(self, v13, (uint64_t)v49, v14);
    uint64_t v15 = [CKSyncEngineConfiguration alloc];
    id v19 = objc_msgSend_repairContainer(self, v16, v17, v18);
    id v23 = objc_msgSend_privateCloudDatabase(v19, v20, v21, v22);
    id v27 = objc_msgSend_database(self, v24, v25, v26);
    id v31 = objc_msgSend_syncEngineMetadata(v27, v28, v29, v30);
    v33 = objc_msgSend_initWithDatabase_dataSource_metadata_(v15, v32, (uint64_t)v23, (uint64_t)self, v31);

    objc_msgSend_setApsMachServiceName_(v33, v34, (uint64_t)v49, v35);
    if (__sTestOverridesAvailable)
    {
      xpc_object_t v38 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v38, (const char *)*MEMORY[0x1E4F14170], 5);
      objc_msgSend_setXpcActivityCriteriaOverrides_(v33, v39, (uint64_t)v38, v40);
    }
    objc_msgSend_setUseUniqueActivityIdentifiers_(v33, v36, 0, v37);
    objc_msgSend_setAutomaticSyncingEnabled_(v33, v41, 1, v42);
    v43 = [CKSyncEngine alloc];
    uint64_t v46 = objc_msgSend_initWithConfiguration_(v43, v44, (uint64_t)v33, v45);
    objc_msgSend_setRepairZoneSyncEngine_(self, v47, (uint64_t)v46, v48);
  }
}

- (void)closeSyncEngine
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  objc_msgSend_setRepairZoneSyncEngine_(self, v6, 0, v7);

  objc_msgSend_setAssignedMachServiceName_(self, v8, 0, v9);
}

- (void)fetchRepairContainerMetadata
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  uint64_t v12 = objc_msgSend_deviceID(self, v6, v7, v8);
  if (v12
    && (objc_msgSend_cachesDirectory(self, v9, v10, v11),
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    objc_msgSend_dispatchEvent_(self, v9, 4, v11);
  }
  else
  {
    uint64_t v14 = objc_msgSend_repairContainer(self, v9, v10, v11);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_18B099474;
    v17[3] = &unk_1E54633A0;
    objc_copyWeak(&v18, &location);
    objc_msgSend_fetchCurrentDeviceIDWithCompletionHandler_(v14, v15, (uint64_t)v17, v16);

    objc_destroyWeak(&v18);
  }
  objc_destroyWeak(&location);
}

- (void)registerForNetworkReachability
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  if (!objc_msgSend_reachability(self, v6, v7, v8))
  {
    uint64_t v12 = (const char *)objc_msgSend_UTF8String(@"https://gateway.icloud.com", v9, v10, v11);
    uint64_t v13 = SCNetworkReachabilityCreateWithName(0, v12);
    v20.version = 0;
    memset(&v20.retain, 0, 24);
    v20.info = self;
    SCNetworkReachabilitySetCallback(v13, (SCNetworkReachabilityCallBack)sub_18B099A30, &v20);
    uint64_t v17 = objc_msgSend_stateQueue(self, v14, v15, v16);
    SCNetworkReachabilitySetDispatchQueue(v13, v17);

    objc_msgSend_setReachability_(self, v18, (uint64_t)v13, v19);
    if (v13) {
      CFRelease(v13);
    }
  }
}

- (void)unregisterFromNetworkReachability
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend_reachability(self, v6, v7, v8))
  {
    uint64_t v12 = (const __SCNetworkReachability *)objc_msgSend_reachability(self, v9, v10, v11);
    SCNetworkReachabilitySetDispatchQueue(v12, 0);
    uint64_t v16 = (const __SCNetworkReachability *)objc_msgSend_reachability(self, v13, v14, v15);
    SCNetworkReachabilitySetCallback(v16, 0, 0);
    objc_msgSend_setReachability_(self, v17, 0, v18);
  }
}

- (void)checkNetworkReachability
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  SCNetworkReachabilityFlags flags = 0;
  uint64_t v9 = (const char *)objc_msgSend_UTF8String(@"https://gateway.icloud.com", v6, v7, v8);
  uint64_t v10 = SCNetworkReachabilityCreateWithName(0, v9);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = SCNetworkReachabilityGetFlags(v10, &flags);
    sub_18B099A30(v12, flags, self);
    CFRelease(v11);
  }
  else
  {
    sub_18B099A30(0, 0, self);
  }
}

- (void)registerForAccountNotifications
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/data-repair-account-notification", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  uint64_t v7 = objc_msgSend_stateQueue(self, v4, v5, v6);
  dispatch_assert_queue_V2(v7);

  objc_msgSend_notificationDebouncePeriod(self, v8, v9, v10);
  uint64_t v12 = v11;
  objc_initWeak(&location, self);
  uint64_t v16 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v13, v14, v15);
  uint64_t v17 = CKAccountChangedNotificationName();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_18B099D70;
  v22[3] = &unk_1E5463418;
  objc_copyWeak(v23, &location);
  v23[1] = v12;
  uint64_t v19 = objc_msgSend_addObserverForName_object_queue_usingBlock_(v16, v18, (uint64_t)v17, 0, 0, v22);
  objc_msgSend_setAccountChangeObserver_(self, v20, (uint64_t)v19, v21);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
}

- (void)unregisterFromAccountNotifications
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v6, v7, v8);
  uint64_t v13 = objc_msgSend_accountChangeObserver(self, v10, v11, v12);
  uint64_t v14 = CKAccountChangedNotificationName();
  objc_msgSend_removeObserver_name_object_(v9, v15, (uint64_t)v13, (uint64_t)v14, 0);

  objc_msgSend_setAccountChangeObserver_(self, v16, 0, v17);
  uint64_t v21 = objc_msgSend_scheduledAccountStatusCheck(self, v18, v19, v20);

  if (v21)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v22 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v29 = 0;
      _os_log_debug_impl(&dword_18AF10000, v22, OS_LOG_TYPE_DEBUG, "Cancelling enqueued account check", v29, 2u);
    }
    uint64_t v26 = objc_msgSend_scheduledAccountStatusCheck(self, v23, v24, v25);
    dispatch_block_cancel(v26);

    objc_msgSend_setScheduledAccountStatusCheck_(self, v27, 0, v28);
  }
}

- (void)checkAccountStatus
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  uint64_t v9 = objc_msgSend_repairContainer(self, v6, v7, v8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B09A300;
  v12[3] = &unk_1E5463468;
  objc_copyWeak(&v13, &location);
  objc_msgSend_accountStatusWithCompletionHandler_(v9, v10, (uint64_t)v12, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)checkAccountID
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  uint64_t v9 = objc_msgSend_repairContainer(self, v6, v7, v8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B09A620;
  v12[3] = &unk_1E54634B8;
  objc_copyWeak(&v13, &location);
  void v12[4] = self;
  objc_msgSend_fetchUserRecordIDWithCompletionHandler_(v9, v10, (uint64_t)v12, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)registerForFetchAllNotifications
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  if (objc_msgSend_fetchAllToken(self, v6, v7, v8))
  {
    int AllToken = objc_msgSend_fetchAllToken(self, v9, v10, v11);
    notify_cancel(AllToken);
    objc_msgSend_setFetchAllToken_(self, v13, 0xFFFFFFFFLL, v14);
  }
  int out_token = -1;
  objc_msgSend_uploadRequestFetchAllNotificationName(CKContainer, v9, v10, v11);
  id v15 = objc_claimAutoreleasedReturnValue();
  uint64_t v19 = (const char *)objc_msgSend_UTF8String(v15, v16, v17, v18);
  id v23 = objc_msgSend_stateQueue(self, v20, v21, v22);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_18B09AB70;
  handler[3] = &unk_1E5460FE8;
  objc_copyWeak(&v27, &location);
  LODWORD(v19) = notify_register_dispatch(v19, &out_token, v23, handler);

  if (v19) {
    objc_msgSend_setFetchAllToken_(self, v24, 0xFFFFFFFFLL, v25);
  }
  else {
    objc_msgSend_setFetchAllToken_(self, v24, out_token, v25);
  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)unregisterFromFetchAllNotifications
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend_fetchAllToken(self, v6, v7, v8))
  {
    int AllToken = objc_msgSend_fetchAllToken(self, v9, v10, v11);
    notify_cancel(AllToken);
    objc_msgSend_setFetchAllToken_(self, v13, 0xFFFFFFFFLL, v14);
  }
}

- (void)scheduleRecurringFetch
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  uint64_t v9 = objc_msgSend_database(self, v6, v7, v8);
  id v13 = objc_msgSend_lastFetchDate(v9, v10, v11, v12);

  objc_msgSend_recurringFetchPeriod(self, v14, v15, v16);
  double v21 = v20;
  if (v13)
  {
    uint64_t v22 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v17, v18, v19);
    objc_msgSend_timeIntervalSinceDate_(v22, v23, (uint64_t)v13, v24);
    if (v28 >= v21)
    {
      v41 = objc_msgSend_database(self, v25, v26, v27);
      objc_msgSend_setLastFetchDate_(v41, v42, (uint64_t)v22, v43);

      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v44 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_INFO))
      {
        LOWORD(v49) = 0;
        _os_log_impl(&dword_18AF10000, v44, OS_LOG_TYPE_INFO, "Fetching upload requests on schedule", (uint8_t *)&v49, 2u);
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
      }
      uint64_t v45 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
      {
        int v49 = 138543362;
        v50 = v22;
        _os_log_debug_impl(&dword_18AF10000, v45, OS_LOG_TYPE_DEBUG, "Setting last fetch date to %{public}@", (uint8_t *)&v49, 0xCu);
      }
      objc_msgSend_dispatchEvent_(self, v46, 14, v47);
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v29 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
      {
        int v49 = 138543362;
        v50 = v13;
        _os_log_debug_impl(&dword_18AF10000, v29, OS_LOG_TYPE_DEBUG, "Last fetch was on %{public}@, so no need to fetch yet", (uint8_t *)&v49, 0xCu);
      }
    }
  }
  else
  {
    uint32_t v30 = arc4random_uniform(0x401u);
    uint64_t v22 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v31, v32, v33, v21 * ((double)v30 * 0.0009765625));
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v34 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
    {
      int v49 = 138543362;
      v50 = v22;
      _os_log_debug_impl(&dword_18AF10000, v34, OS_LOG_TYPE_DEBUG, "Initializing last fetch date to %{public}@", (uint8_t *)&v49, 0xCu);
    }
    xpc_object_t v38 = objc_msgSend_database(self, v35, v36, v37);
    objc_msgSend_setLastFetchDate_(v38, v39, (uint64_t)v22, v40);
  }
  objc_msgSend_invokeCallbackForOverridePoint_withError_onCallbackQueue_(self, v48, 2, 0, 1);
}

- (void)scheduleNextSync
{
  uint64_t v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  uint64_t v9 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v6, v7, v8);
  uint64_t v12 = objc_msgSend_nextRepairDateForDate_(self, v10, (uint64_t)v9, v11);
  uint64_t v15 = v12;
  if (v12)
  {
    if (objc_msgSend_compare_(v12, v13, (uint64_t)v9, v14) == 1)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v16 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AF10000, v16, OS_LOG_TYPE_INFO, "Scheduling next upload requests at a future date", buf, 2u);
      }
      objc_msgSend_timeIntervalSinceDate_(v15, v17, (uint64_t)v9, v18);
      objc_msgSend_scheduleRepairsWithDelay_(self, v19, v20, v21);
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v23 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v28 = 0;
        _os_log_impl(&dword_18AF10000, v23, OS_LOG_TYPE_INFO, "Scheduling next upload requests right away", v28, 2u);
      }
      objc_msgSend_scheduleOrInvokeRepairsNow(self, v24, v25, v26);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v22 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_18AF10000, v22, OS_LOG_TYPE_INFO, "Attempted to schedule next upload request, but nothing to do", v27, 2u);
    }
  }
}

@end