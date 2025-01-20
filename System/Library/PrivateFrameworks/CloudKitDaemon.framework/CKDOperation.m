@interface CKDOperation
+ (id)_globalOperationCallbackQueueForQOS:(int64_t)a3;
+ (id)nameForState:(unint64_t)a3;
+ (int64_t)isPredominatelyDownload;
- (BOOL)_checkAppVersion;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)allowsPowerNapScheduling;
- (BOOL)automaticallyRetryNetworkFailures;
- (BOOL)checkAndClearUnitTestOverrides:(id)a3;
- (BOOL)didAttemptDugongKeyRoll;
- (BOOL)endContainerAccess;
- (BOOL)expectDelayBeforeRequestBegins;
- (BOOL)finishWithAssetDownloadStagingInfo:(id)a3 fileURL:(id *)a4 fileHandle:(id *)a5 error:(id *)a6;
- (BOOL)isCloudKitSupportOperation;
- (BOOL)isConcurrent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isLongLived;
- (BOOL)isLongLivedCallbackRelayOperation;
- (BOOL)isNetworkingBehaviorEquivalentForOperation:(id)a3;
- (BOOL)isOperationType:(int)a3;
- (BOOL)isTopLevelDaemonOperation;
- (BOOL)isWaitingOnPCS;
- (BOOL)makeStateTransition;
- (BOOL)preferAnonymousRequests;
- (BOOL)resolvedAutomaticallyRetryNetworkFailures;
- (BOOL)shouldCheckAppVersion;
- (BOOL)skipSettingUnitTestOverrides;
- (BOOL)supportsDeviceThrottling;
- (BOOL)useClearAssetEncryption;
- (BOOL)useEncryption;
- (BOOL)usesBackgroundSession;
- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4;
- (CKDContainer)container;
- (CKDLogicalDeviceContext)deviceContext;
- (CKDOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDOperation)parentOperation;
- (CKDOperation)topmostParentOperation;
- (CKDOperationCallbackProxy)clientOperationCallbackProxy;
- (CKDURLRequest)request;
- (CKOperationInfo)operationInfo;
- (CKOperationMMCSRequestOptions)MMCSRequestOptions;
- (CKOperationMetrics)operationMetrics;
- (CKSignpost)signpost;
- (NSDate)metricExecuteStartDate;
- (NSDate)startDate;
- (NSDictionary)unitTestOverrides;
- (NSError)error;
- (NSMutableArray)childOperations;
- (NSMutableArray)finishedChildOperationIDs;
- (NSMutableArray)requestUUIDs;
- (NSNumber)cacheDeleteAvailableSpaceClass;
- (NSNumber)operationGroupQuantityNumber;
- (NSNumber)privacyProxyFailClosedOverride;
- (NSString)applicationBundleIdentifierForContainerAccess;
- (NSString)applicationBundleIdentifierForNetworkAttribution;
- (NSString)authPromptReason;
- (NSString)description;
- (NSString)operationGroupID;
- (NSString)operationGroupName;
- (NSString)operationID;
- (NSString)sourceApplicationSecondaryIdentifier;
- (OS_dispatch_group)childOperationsGroup;
- (OS_dispatch_group)stateTransitionGroup;
- (OS_dispatch_queue)callbackQueue;
- (OS_os_activity)osActivity;
- (OS_os_transaction)transaction;
- (UMUserSyncTask)userSyncTask;
- (double)timeoutIntervalForRequest;
- (double)timeoutIntervalForResource;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)CKStatusReportLogGroups;
- (id)CKStatusReportProperties;
- (id)_startDateString;
- (id)_stateFlags;
- (id)activityCreate;
- (id)additionalRequestHTTPHeaders;
- (id)analyticsPayload;
- (id)baseOperationAndErrorInfoCoreAnalyticsPayloadWithError:(id)a3;
- (id)ckShortDescription;
- (id)containerID;
- (id)createConcurrentQueue;
- (id)createInactiveConcurrentQueue;
- (id)createInactiveSerialQueue;
- (id)createSerialQueue;
- (id)dugongKeyRollAnalyticsPayloadWithError:(id)a3;
- (id)openFileWithOpenInfo:(id)a3 error:(id *)a4;
- (id)requestCompletedBlock;
- (id)statusReportWithIndent:(unint64_t)a3;
- (id)zoneIDsUsed;
- (int)operationType;
- (int)pcsWaitCount;
- (int64_t)clientQueuePriority;
- (unint64_t)discretionaryNetworkBehavior;
- (unint64_t)discretionaryWhenBackgroundedState;
- (unint64_t)duetPreClearedMode;
- (unint64_t)hash;
- (unint64_t)networkServiceType;
- (unint64_t)resolvedDiscretionaryNetworkBehavior;
- (unint64_t)state;
- (unint64_t)systemScheduler;
- (unsigned)QOSClass;
- (void)_continueOperationStart;
- (void)_determineNetworkServiceType;
- (void)_ensureOperationGroup;
- (void)_finishInternalOnCallbackQueueWithError:(id)a3;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_registerAttemptForOperation;
- (void)beginUserSyncTask;
- (void)cancel;
- (void)combineMetricsWithOperation:(id)a3;
- (void)configureQualityOfServiceFromOperationInfo:(id)a3;
- (void)configureRequest:(id)a3;
- (void)dealloc;
- (void)fetchContainerScopedUserID:(id)a3;
- (void)finishWithError:(id)a3;
- (void)main;
- (void)makeStateTransition:(BOOL)a3;
- (void)noteOperationDidFinishWaitingOnPCS;
- (void)noteOperationWillWaitOnPCS;
- (void)pushStatisticsTo:(id)a3;
- (void)request:(id)a3 didFinishWithMetrics:(id)a4 w3cNavigationTiming:(id)a5;
- (void)sendCoreAnalyticsEventOperationFinished;
- (void)setCallbackQueue:(id)a3;
- (void)setChildOperationsGroup:(id)a3;
- (void)setClientOperationCallbackProxy:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDidAttemptDugongKeyRoll:(BOOL)a3;
- (void)setEndContainerAccess:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setMetricExecuteStartDate:(id)a3;
- (void)setParentOperation:(id)a3;
- (void)setPcsWaitCount:(int)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRequest:(id)a3;
- (void)setRequestCompletedBlock:(id)a3;
- (void)setSkipSettingUnitTestOverrides:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateTransitionGroup:(id)a3;
- (void)setUseClearAssetEncryption:(BOOL)a3;
- (void)setUseEncryption:(BOOL)a3;
- (void)setUserSyncTask:(id)a3;
- (void)spawnAndRunOperationOfClass:(Class)a3 operationInfo:(id)a4 operationConfigurationBlock:(id)a5;
- (void)spawnAndRunOperationOfClass:(Class)a3 operationInfo:(id)a4 spawnQueue:(id)a5 container:(id)a6 operationConfigurationBlock:(id)a7;
- (void)spawnAndRunOperationOfClass:(Class)a3 operationInfo:(id)a4 spawnQueue:(id)a5 operationConfigurationBlock:(id)a6;
- (void)start;
- (void)transitionToExecuting;
- (void)transitionToFinished;
- (void)updateCloudKitMetrics:(id)a3;
- (void)updateMMCSMetrics:(id)a3;
@end

@implementation CKDOperation

- (CKDOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v10 = a4;
  if (!v7)
  {
    v105 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v105, v106, (uint64_t)a2, self, @"CKDOperation.m", 190, @"Expected non-nil operationInfo");
  }
  v107.receiver = self;
  v107.super_class = (Class)CKDOperation;
  v11 = [(CKDOperation *)&v107 init];
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    v13 = (void *)*((void *)v11 + 41);
    *((void *)v11 + 41) = v12;

    id v14 = [NSString alloc];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v19 = objc_msgSend_operationID(v7, v17, v18);
    v21 = objc_msgSend_initWithFormat_(v14, v20, @"com.apple.cloudkit.%@.%@", v16, v19);

    v24 = objc_msgSend_parentOperation(v7, v22, v23);
    objc_storeWeak((id *)v11 + 40, v24);

    objc_storeStrong((id *)v11 + 42, a4);
    uint64_t v25 = objc_opt_new();
    v26 = (void *)*((void *)v11 + 48);
    *((void *)v11 + 48) = v25;

    uint64_t v27 = objc_opt_new();
    v28 = (void *)*((void *)v11 + 49);
    *((void *)v11 + 49) = v27;

    uint64_t v29 = objc_opt_new();
    v30 = (void *)*((void *)v11 + 50);
    *((void *)v11 + 50) = v29;

    *((void *)v11 + 34) = 1;
    dispatch_group_t v31 = dispatch_group_create();
    v32 = (void *)*((void *)v11 + 47);
    *((void *)v11 + 47) = v31;

    dispatch_group_t v33 = dispatch_group_create();
    v34 = (void *)*((void *)v11 + 51);
    *((void *)v11 + 51) = v33;

    objc_msgSend_UTF8String(v21, v35, v36);
    uint64_t v37 = os_transaction_create();
    v38 = (void *)*((void *)v11 + 53);
    *((void *)v11 + 53) = v37;

    id v39 = objc_alloc(MEMORY[0x1E4F1A3C0]);
    v40 = (os_log_t *)MEMORY[0x1E4F1A520];
    uint64_t v42 = objc_msgSend_initWithLog_(v39, v41, *MEMORY[0x1E4F1A520]);
    v43 = (void *)*((void *)v11 + 54);
    *((void *)v11 + 54) = v42;

    objc_msgSend__ensureOperationGroup(v11, v44, v45);
    if (!v7)
    {
      id v7 = (id)objc_opt_new();
      objc_msgSend_setRequestOriginator_(v7, v48, 1);
    }
    if (!objc_msgSend_requestOriginator(v7, v46, v47)) {
      objc_msgSend_setRequestOriginator_(v7, v49, 1);
    }
    objc_storeStrong((id *)v11 + 46, v7);
    objc_msgSend_configureQualityOfServiceFromOperationInfo_(v11, v50, (uint64_t)v7);
    v53 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v51, v52);
    if (objc_msgSend_useEncryption(v53, v54, v55))
    {
      v58 = objc_msgSend_options(v10, v56, v57);
      v11[292] = objc_msgSend_bypassPCSEncryption(v58, v59, v60) ^ 1;
    }
    else
    {
      v11[292] = 0;
    }

    v61 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_msgSend_qualityOfService(v11, v62, v63);
    dispatch_qos_class_t v64 = CKQoSClassFromNSQualityOfService();
    v65 = dispatch_queue_attr_make_with_qos_class(v61, v64, 0);

    v66 = dispatch_queue_attr_make_initially_inactive(v65);

    v69 = (const char *)objc_msgSend_UTF8String(v21, v67, v68);
    dispatch_queue_t v70 = dispatch_queue_create(v69, v66);
    v71 = (dispatch_object_t *)(v11 + 344);
    v72 = (void *)*((void *)v11 + 43);
    *((void *)v11 + 43) = v70;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v11 + 43), v11 + 344, (void *)1, 0);
    if ((objc_msgSend_isCloudKitSupportOperation(v11, v73, v74) & 1) == 0)
    {
      v77 = *v71;
      uint64_t v78 = objc_msgSend_qualityOfService(v11, v75, v76);
      v80 = objc_msgSend__globalOperationCallbackQueueForQOS_(CKDOperation, v79, v78);
      dispatch_set_target_queue(v77, v80);
    }
    dispatch_activate(*v71);
    v81 = [CKDOperationCallbackProxy alloc];
    v84 = objc_msgSend_callbackProxyEndpoint(v7, v82, v83);
    uint64_t v86 = objc_msgSend_initWithEndpoint_(v81, v85, (uint64_t)v84);
    v87 = (void *)*((void *)v11 + 39);
    *((void *)v11 + 39) = v86;

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v88 = *v40;
    if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEFAULT))
    {
      v89 = v88;
      int v92 = objc_msgSend_usesBackgroundSession(v11, v90, v91);
      int v95 = objc_msgSend_allowsCellularAccess(v11, v93, v94);
      int v98 = objc_msgSend_allowsExpensiveNetworkAccess(v11, v96, v97);
      int v101 = objc_msgSend_qualityOfService(v11, v99, v100);
      *(_DWORD *)buf = 134219008;
      id v109 = v10;
      __int16 v110 = 1024;
      int v111 = v92;
      __int16 v112 = 1024;
      int v113 = v95;
      __int16 v114 = 1024;
      int v115 = v98;
      __int16 v116 = 1024;
      int v117 = v101;
      _os_log_impl(&dword_1C4CFF000, v89, OS_LOG_TYPE_DEFAULT, "Initialized with container %p. Background: %d, cellular: %d, expensive: %d, QOS: 0x%x", buf, 0x24u);
    }
    uint64_t v102 = objc_opt_new();
    v103 = (void *)*((void *)v11 + 32);
    *((void *)v11 + 32) = v102;
  }
  return (CKDOperation *)v11;
}

- (OS_os_activity)osActivity
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_osActivity)
  {
    uint64_t v5 = objc_msgSend_activityCreate(v2, v3, v4);
    osActivity = v2->_osActivity;
    v2->_osActivity = (OS_os_activity *)v5;
  }
  objc_sync_exit(v2);

  id v7 = v2->_osActivity;
  return v7;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/?", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_ensureOperationGroup
{
  objc_msgSend_topmostParentOperation(self, a2, v2);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_operationInfo(v15, v3, v4);
  v8 = objc_msgSend_group(v5, v6, v7);

  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1A218]);
    objc_msgSend_setName_(v9, v10, @"EphemeralGroup");
    v13 = objc_msgSend_operationInfo(v15, v11, v12);
    objc_msgSend_setGroup_(v13, v14, (uint64_t)v9);
  }
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  intptr_t v6 = dispatch_group_wait(v5, 0);

  if (v6)
  {
    id v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    uint64_t v12 = objc_msgSend_operationID(self, v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v13, (uint64_t)a2, self, @"CKDOperation.m", 268, @"Operation %@ tried to dealloc with outstanding entries in the state transition group", v12);
  }
  v16 = self->_transaction;
  if (*MEMORY[0x1E4F1A4E0])
  {
    v17 = objc_msgSend_deviceContext(self, v14, v15);
    v20 = objc_msgSend_testServer(v17, v18, v19);

    if (v20 && (objc_msgSend_useLiveServer(v20, v21, v22) & 1) == 0)
    {
      dispatch_time_t v23 = dispatch_time(0, 60000000000);
      v24 = CKGetGlobalQueue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = nullsub_6;
      block[3] = &unk_1E64F05C8;
      v35 = v16;
      dispatch_after(v23, v24, block);
    }
  }
  if (objc_msgSend_endContainerAccess(self, v14, v15))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v25 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_ERROR, "Operation deallocated while holding container content access", buf, 2u);
    }
    v28 = objc_msgSend_container(self, v26, v27);
    objc_msgSend_endContentAccess(v28, v29, v30);

    objc_msgSend_setEndContainerAccess_(self, v31, 0);
  }

  v32.receiver = self;
  v32.super_class = (Class)CKDOperation;
  [(CKDOperation *)&v32 dealloc];
}

- (id)createSerialQueue
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_qos_class_t v6 = objc_msgSend_QOSClass(self, v4, v5);
  uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v3, v6, 0);

  uint64_t v8 = NSString;
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  uint64_t v12 = objc_msgSend_stringWithFormat_(v8, v11, @"com.apple.cloudkit.%@", v10);

  id v13 = v12;
  v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
  dispatch_queue_t v17 = dispatch_queue_create(v16, v7);

  return v17;
}

- (id)createInactiveSerialQueue
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_qos_class_t v6 = objc_msgSend_QOSClass(self, v4, v5);
  uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v3, v6, 0);

  uint64_t v8 = dispatch_queue_attr_make_initially_inactive(v7);

  id v9 = NSString;
  id v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  id v13 = objc_msgSend_stringWithFormat_(v9, v12, @"com.apple.cloudkit.%@", v11);

  id v14 = v13;
  dispatch_queue_t v17 = (const char *)objc_msgSend_UTF8String(v14, v15, v16);
  dispatch_queue_t v18 = dispatch_queue_create(v17, v8);

  return v18;
}

- (id)createConcurrentQueue
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_qos_class_t v6 = objc_msgSend_QOSClass(self, v4, v5);
  uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v3, v6, 0);

  uint64_t v8 = NSString;
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  uint64_t v12 = objc_msgSend_stringWithFormat_(v8, v11, @"com.apple.cloudkit.%@", v10);

  id v13 = v12;
  uint64_t v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
  dispatch_queue_t v17 = dispatch_queue_create(v16, v7);

  return v17;
}

- (id)createInactiveConcurrentQueue
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_qos_class_t v6 = objc_msgSend_QOSClass(self, v4, v5);
  uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v3, v6, 0);

  uint64_t v8 = dispatch_queue_attr_make_initially_inactive(v7);

  id v9 = NSString;
  id v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  id v13 = objc_msgSend_stringWithFormat_(v9, v12, @"com.apple.cloudkit.%@", v11);

  id v14 = v13;
  dispatch_queue_t v17 = (const char *)objc_msgSend_UTF8String(v14, v15, v16);
  dispatch_queue_t v18 = dispatch_queue_create(v17, v8);

  return v18;
}

- (BOOL)allowsCellularAccess
{
  uint64_t v4 = objc_msgSend_operationInfo(self, a2, v2);
  if (objc_msgSend_allowsCellularAccess(v4, v5, v6))
  {
    id v9 = objc_msgSend_container(self, v7, v8);
    char v12 = objc_msgSend_allowsCellularAccess(v9, v10, v11);
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  uint64_t v4 = objc_msgSend_operationInfo(self, a2, v2);
  if (objc_msgSend_allowsExpensiveNetworkAccess(v4, v5, v6))
  {
    id v9 = objc_msgSend_container(self, v7, v8);
    char v12 = objc_msgSend_allowsExpensiveNetworkAccess(v9, v10, v11);
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)preferAnonymousRequests
{
  uint64_t v4 = objc_msgSend_operationInfo(self, a2, v2);
  if (objc_msgSend_preferAnonymousRequests(v4, v5, v6))
  {
    char v9 = 1;
  }
  else
  {
    id v10 = objc_msgSend_container(self, v7, v8);
    char v9 = objc_msgSend_preferAnonymousRequests(v10, v11, v12);
  }
  return v9;
}

- (NSString)applicationBundleIdentifierForContainerAccess
{
  uint64_t v4 = objc_msgSend_operationInfo(self, a2, v2);
  uint64_t v7 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v5, v6);

  if (!v7)
  {
    id v10 = objc_msgSend_container(self, v8, v9);
    uint64_t v7 = objc_msgSend_applicationBundleIdentifierForContainerAccess(v10, v11, v12);
  }
  return (NSString *)v7;
}

- (NSString)applicationBundleIdentifierForNetworkAttribution
{
  uint64_t v4 = objc_msgSend_operationInfo(self, a2, v2);
  uint64_t v7 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v4, v5, v6);

  if (!v7)
  {
    id v10 = objc_msgSend_container(self, v8, v9);
    uint64_t v7 = objc_msgSend_applicationBundleIdentifierForNetworkAttribution(v10, v11, v12);
  }
  return (NSString *)v7;
}

- (BOOL)allowsPowerNapScheduling
{
  v3 = objc_msgSend_container(self, a2, v2);
  uint64_t v6 = objc_msgSend_entitlements(v3, v4, v5);
  char hasDarkWakeNetworkReachabilityEnabledEntitlement = objc_msgSend_hasDarkWakeNetworkReachabilityEnabledEntitlement(v6, v7, v8);

  return hasDarkWakeNetworkReachabilityEnabledEntitlement;
}

- (BOOL)resolvedAutomaticallyRetryNetworkFailures
{
  if (objc_msgSend_systemScheduler(self, a2, v2) == 1) {
    return 0;
  }
  return objc_msgSend_automaticallyRetryNetworkFailures(self, v4, v5);
}

- (unint64_t)resolvedDiscretionaryNetworkBehavior
{
  if (objc_msgSend_duetPreClearedMode(self, a2, v2)) {
    return 2;
  }
  if (objc_msgSend_discretionaryWhenBackgroundedState(self, v4, v5) == 1) {
    return 0;
  }
  return objc_msgSend_discretionaryNetworkBehavior(self, v7, v8);
}

- (id)containerID
{
  v3 = objc_msgSend_container(self, a2, v2);
  uint64_t v6 = objc_msgSend_containerID(v3, v4, v5);

  return v6;
}

- (NSString)operationID
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  uint64_t v6 = objc_msgSend_operationID(v3, v4, v5);

  return (NSString *)v6;
}

- (int64_t)clientQueuePriority
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  int64_t v6 = objc_msgSend_clientQueuePriority(v3, v4, v5);

  return v6;
}

- (BOOL)isLongLived
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  char isLongLived = objc_msgSend_isLongLived(v3, v4, v5);

  return isLongLived;
}

- (CKOperationMMCSRequestOptions)MMCSRequestOptions
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  int64_t v6 = objc_msgSend_MMCSRequestOptions(v3, v4, v5);

  return (CKOperationMMCSRequestOptions *)v6;
}

- (NSDictionary)unitTestOverrides
{
  if (!*MEMORY[0x1E4F1A4E0])
  {
    id v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CKDOperation.m", 382, @"Only suitable for testing");
  }
  uint64_t v4 = objc_msgSend_operationInfo(self, a2, v2);
  uint64_t v7 = objc_msgSend_resolvedConfiguration(v4, v5, v6);
  id v10 = objc_msgSend_unitTestOverrides(v7, v8, v9);

  return (NSDictionary *)v10;
}

- (BOOL)checkAndClearUnitTestOverrides:(id)a3
{
  id v7 = a3;
  if (!*MEMORY[0x1E4F1A4E0])
  {
    v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, @"CKDOperation.m", 386, @"Only suitable for testing");
  }
  uint64_t v8 = objc_msgSend_operationInfo(self, v5, v6);
  uint64_t v11 = objc_msgSend_resolvedConfiguration(v8, v9, v10);
  id v14 = objc_msgSend_unitTestOverrides(v11, v12, v13);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v7);
  BOOL v17 = v16 != 0;

  v20 = objc_msgSend_operationInfo(self, v18, v19);
  dispatch_time_t v23 = objc_msgSend_resolvedConfiguration(v20, v21, v22);
  objc_msgSend_removeUnitTestOverride_(v23, v24, (uint64_t)v7);

  return v17;
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  uint64_t v6 = objc_msgSend_sourceApplicationSecondaryIdentifier(v3, v4, v5);

  return (NSString *)v6;
}

- (NSNumber)privacyProxyFailClosedOverride
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  uint64_t v6 = objc_msgSend_privacyProxyFailClosedOverride(v3, v4, v5);

  return (NSNumber *)v6;
}

- (NSString)authPromptReason
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  uint64_t v6 = objc_msgSend_authPromptReason(v3, v4, v5);

  return (NSString *)v6;
}

- (BOOL)automaticallyRetryNetworkFailures
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  char v6 = objc_msgSend_automaticallyRetryNetworkFailures(v3, v4, v5);

  return v6;
}

- (unint64_t)discretionaryNetworkBehavior
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  unint64_t v6 = objc_msgSend_discretionaryNetworkBehavior(v3, v4, v5);

  return v6;
}

- (unint64_t)duetPreClearedMode
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  unint64_t v6 = objc_msgSend_duetPreClearedMode(v3, v4, v5);

  return v6;
}

- (unint64_t)discretionaryWhenBackgroundedState
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  unint64_t v6 = objc_msgSend_discretionaryWhenBackgroundedState(v3, v4, v5);

  return v6;
}

- (unint64_t)systemScheduler
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  unint64_t v6 = objc_msgSend_systemScheduler(v3, v4, v5);

  return v6;
}

- (double)timeoutIntervalForRequest
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  objc_msgSend_timeoutIntervalForRequest(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (double)timeoutIntervalForResource
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  objc_msgSend_timeoutIntervalForResource(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (id)additionalRequestHTTPHeaders
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  double v6 = objc_msgSend_additionalRequestHTTPHeaders(v3, v4, v5);

  return v6;
}

- (BOOL)isCloudKitSupportOperation
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  char isCloudKitSupportOperation = objc_msgSend_isCloudKitSupportOperation(v3, v4, v5);

  return isCloudKitSupportOperation;
}

- (NSNumber)cacheDeleteAvailableSpaceClass
{
  v3 = objc_msgSend_operationInfo(self, a2, v2);
  double v6 = objc_msgSend_cacheDeleteAvailableSpaceClass(v3, v4, v5);

  return (NSNumber *)v6;
}

- (NSString)operationGroupID
{
  v3 = objc_msgSend_topmostParentOperation(self, a2, v2);
  double v6 = objc_msgSend_operationInfo(v3, v4, v5);
  uint64_t v9 = objc_msgSend_group(v6, v7, v8);
  uint64_t v12 = objc_msgSend_operationGroupID(v9, v10, v11);

  return (NSString *)v12;
}

- (NSString)operationGroupName
{
  v3 = objc_msgSend_topmostParentOperation(self, a2, v2);
  double v6 = objc_msgSend_operationInfo(v3, v4, v5);
  uint64_t v9 = objc_msgSend_group(v6, v7, v8);
  uint64_t v12 = objc_msgSend_name(v9, v10, v11);

  return (NSString *)v12;
}

- (NSNumber)operationGroupQuantityNumber
{
  v3 = objc_msgSend_topmostParentOperation(self, a2, v2);
  double v6 = objc_msgSend_operationInfo(v3, v4, v5);
  uint64_t v9 = objc_msgSend_group(v6, v7, v8);
  uint64_t v12 = objc_msgSend_quantityNumber(v9, v10, v11);

  return (NSNumber *)v12;
}

- (id)_stateFlags
{
  uint64_t v4 = NSString;
  if (objc_msgSend_isExecuting(self, a2, v2)) {
    double v7 = @"R";
  }
  else {
    double v7 = &stru_1F2044F30;
  }
  if (objc_msgSend_isCancelled(self, v5, v6)) {
    uint64_t v10 = @"X";
  }
  else {
    uint64_t v10 = &stru_1F2044F30;
  }
  if (objc_msgSend_usesBackgroundSession(self, v8, v9)) {
    uint64_t v13 = @"B";
  }
  else {
    uint64_t v13 = &stru_1F2044F30;
  }
  if (objc_msgSend_allowsCellularAccess(self, v11, v12)) {
    uint64_t v16 = @"C";
  }
  else {
    uint64_t v16 = &stru_1F2044F30;
  }
  if (objc_msgSend_allowsExpensiveNetworkAccess(self, v14, v15)) {
    uint64_t v19 = @"E";
  }
  else {
    uint64_t v19 = &stru_1F2044F30;
  }
  if (objc_msgSend_isLongLived(self, v17, v18)) {
    uint64_t v22 = @"L";
  }
  else {
    uint64_t v22 = &stru_1F2044F30;
  }
  int isWaitingOnPCS = objc_msgSend_isWaitingOnPCS(self, v20, v21);
  uint64_t v25 = @"P";
  if (!isWaitingOnPCS) {
    uint64_t v25 = &stru_1F2044F30;
  }
  return (id)objc_msgSend_stringWithFormat_(v4, v24, @"(%@%@%@%@%@%@%@) ", v7, v10, v13, v16, v19, v22, v25);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v11 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E4F1CA60], a2, 10);
  BOOL v224 = v7;
  if (v7)
  {
    unsigned int v223 = v5;
    uint64_t v12 = objc_msgSend_operationID(self, v9, v10);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v13, @"operationID", v12);

    uint64_t v16 = objc_msgSend_state(self, v14, v15);
    if (v16 != 1)
    {
      uint64_t v18 = v16;
      uint64_t v19 = objc_opt_class();
      uint64_t v21 = objc_msgSend_nameForState_(v19, v20, v18);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v22, @"state", v21);
    }
    dispatch_time_t v23 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v17, 3);
    if (objc_msgSend_isExecuting(self, v24, v25)) {
      objc_msgSend_addObject_(v23, v26, @"executing");
    }
    if (objc_msgSend_isFinished(self, v26, v27)) {
      objc_msgSend_addObject_(v23, v28, @"finished");
    }
    if (objc_msgSend_isCancelled(self, v28, v29)) {
      objc_msgSend_addObject_(v23, v30, @"cancelled");
    }
    if (objc_msgSend_count(v23, v30, v31))
    {
      v34 = objc_msgSend_componentsJoinedByString_(v23, v32, @"|");
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v35, @"stateFlags", v34);
    }
    objc_msgSend_qualityOfService(self, v32, v33);
    uint64_t v36 = CKStringForQOS();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v37, @"qos", v36);

    v40 = objc_msgSend_requestUUIDs(self, v38, v39);
    objc_sync_enter(v40);
    v43 = objc_msgSend_requestUUIDs(self, v41, v42);
    uint64_t v46 = objc_msgSend_count(v43, v44, v45);

    if (v46)
    {
      v49 = NSString;
      v50 = objc_msgSend_requestUUIDs(self, v47, v48);
      uint64_t v52 = objc_msgSend_componentsJoinedByString_(v50, v51, @", ");
      v54 = objc_msgSend_stringWithFormat_(v49, v53, @"[%@]", v52);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v55, @"requestIDs", v54);
    }
    objc_sync_exit(v40);

    uint64_t v57 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v56, 3);
    if (objc_msgSend_usesBackgroundSession(self, v58, v59)) {
      objc_msgSend_addObject_(v57, v60, @"background");
    }
    if (objc_msgSend_allowsCellularAccess(self, v60, v61)) {
      objc_msgSend_addObject_(v57, v62, @"allows-cellular");
    }
    if (objc_msgSend_allowsExpensiveNetworkAccess(self, v62, v63)) {
      objc_msgSend_addObject_(v57, v64, @"allows-expensive");
    }
    if (objc_msgSend_isLongLived(self, v64, v65)) {
      objc_msgSend_addObject_(v57, v66, @"long-lived");
    }
    if (objc_msgSend_count(v57, v66, v67))
    {
      dispatch_queue_t v70 = objc_msgSend_componentsJoinedByString_(v57, v68, @"|");
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v71, @"flags", v70);
    }
    v72 = (void *)MEMORY[0x1E4F28ED0];
    v73 = objc_msgSend_startDate(self, v68, v69);
    objc_msgSend_timeIntervalSinceNow(v73, v74, v75);
    v79 = objc_msgSend_numberWithDouble_(v72, v77, v78, -v76);
    v81 = objc_msgSend_CKRoundedToMaximumDecimalPlaces_(v79, v80, 3);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v82, @"runningFor", v81);

    v85 = objc_msgSend_finishedChildOperationIDs(self, v83, v84);
    objc_sync_enter(v85);
    os_log_t v88 = objc_msgSend_finishedChildOperationIDs(self, v86, v87);
    uint64_t v91 = objc_msgSend_count(v88, v89, v90);

    if (v91)
    {
      uint64_t v94 = NSString;
      int v95 = objc_msgSend_finishedChildOperationIDs(self, v92, v93);
      uint64_t v97 = objc_msgSend_componentsJoinedByString_(v95, v96, @", ");
      v99 = objc_msgSend_stringWithFormat_(v94, v98, @"[%@]", v97);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v100, @"finishedChildOpIDs", v99);
    }
    objc_sync_exit(v85);

    v103 = objc_msgSend_childOperations(self, v101, v102);
    objc_sync_enter(v103);
    v106 = objc_msgSend_childOperations(self, v104, v105);
    id v109 = objc_msgSend_copy(v106, v107, v108);

    objc_sync_exit(v103);
    if (objc_msgSend_count(v109, v110, v111))
    {
      __int16 v114 = objc_msgSend_CKMap_(v109, v112, (uint64_t)&unk_1F2042C50);
      int v115 = NSString;
      int v117 = objc_msgSend_componentsJoinedByString_(v114, v116, @", ");
      v119 = objc_msgSend_stringWithFormat_(v115, v118, @"[%@]", v117);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v120, @"childOps", v119);
    }
    v123 = objc_msgSend_operationGroupID(self, v112, v113);
    if (v123) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v121, @"operationGroupID", v123);
    }
    v124 = objc_msgSend_operationGroupName(self, v121, v122);
    v127 = v124;
    if (v124)
    {
      if ((unint64_t)objc_msgSend_length(v124, v125, v126) <= 0x80)
      {
        id v129 = v127;
      }
      else
      {
        objc_msgSend_substringToIndex_(v127, v128, 128);
        id v129 = (id)objc_claimAutoreleasedReturnValue();
      }
      v132 = v129;
      v133 = NSString;
      unint64_t v134 = objc_msgSend_length(v127, v130, v131);
      v136 = &stru_1F2044F30;
      if (v134 > 0x80) {
        v136 = @"...";
      }
      v137 = objc_msgSend_stringWithFormat_(v133, v135, @"%@%@", v132, v136);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v138, @"operationGroupName", v137);
    }
    v140 = objc_msgSend_operationGroupQuantityNumber(self, v125, v126);
    if (v140) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v139, @"operationGroupQuantityNumber", v140);
    }

    uint64_t v5 = v223;
  }
  if (v6)
  {
    v141 = objc_msgSend_container(self, v9, v10);
    v144 = objc_msgSend_account(v141, v142, v143);
    v147 = objc_msgSend_accountID(v144, v145, v146);

    if (v147) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v148, @"currentAccountID", v147);
    }
    v150 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v148, v149);
    v153 = objc_msgSend_currentPersona(v150, v151, v152);

    if (v153)
    {
      v156 = objc_msgSend_userPersonaUniqueString(v153, v154, v155);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v157, @"currentPersona", v156);
    }
    else
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v154, @"currentPersona", @"nilPersonaValue");
    }
    v160 = objc_msgSend_operationInfo(self, v158, v159);
    v163 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v160, v161, v162);

    if (v163)
    {
      v166 = objc_msgSend_operationInfo(self, v164, v165);
      v169 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v166, v167, v168);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v170, @"applicationBundleIdentifierOverrideForContainerAccess", v169);
    }
    v171 = objc_msgSend_operationInfo(self, v164, v165);
    v174 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v171, v172, v173);

    if (v174)
    {
      v177 = objc_msgSend_operationInfo(self, v175, v176);
      v180 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v177, v178, v179);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v181, @"applicationBundleIdentifierOverrideForNetworkAttribution", v180);
    }
    v182 = objc_msgSend_sourceApplicationSecondaryIdentifier(self, v175, v176);

    if (v182)
    {
      v185 = objc_msgSend_sourceApplicationSecondaryIdentifier(self, v183, v184);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v186, @"applicationSecondaryID", v185);
    }
    v187 = objc_msgSend_privacyProxyFailClosedOverride(self, v183, v184);

    if (v187)
    {
      v190 = objc_msgSend_privacyProxyFailClosedOverride(self, v188, v189);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v191, @"privacyProxyFailClosedOverride", v190);
    }
    v192 = objc_msgSend_containerID(v141, v188, v189);
    v195 = v192;
    if (v192)
    {
      v196 = objc_msgSend_containerIdentifier(v192, v193, v194);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v197, @"containerID", v196);
    }
    v198 = objc_msgSend_request(self, v193, v194);

    if (v198)
    {
      v201 = objc_msgSend_request(self, v199, v200);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v202, @"request", v201);
    }
    os_unfair_recursive_lock_lock_with_options();
    MMCSMetrics = self->_MMCSMetrics;
    if (MMCSMetrics)
    {
      v205 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(MMCSMetrics, v203, v224, 1, v5);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v206, @"MMCSMetrics", v205);
    }
    os_unfair_recursive_lock_unlock();
    if (*MEMORY[0x1E4F1A4E0])
    {
      v209 = objc_msgSend_unitTestOverrides(self, v207, v208);
      v212 = objc_msgSend_allKeys(v209, v210, v211);
      uint64_t v215 = objc_msgSend_count(v212, v213, v214);

      if (v215)
      {
        v218 = objc_msgSend_unitTestOverrides(self, v216, v217);
        v220 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v218, v219, v224, 1, v5);
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v221, @"unitTestOverrides", v220);
      }
    }
  }
  return v11;
}

- (id)ckShortDescription
{
  uint64_t v4 = NSString;
  uint64_t v5 = objc_msgSend_operationID(self, a2, v2);
  uint64_t v8 = objc_msgSend__stateFlags(self, v6, v7);
  uint64_t v9 = objc_opt_class();
  uint64_t v12 = objc_msgSend_state(self, v10, v11);
  id v14 = objc_msgSend_nameForState_(v9, v13, v12);
  objc_msgSend_qualityOfService(self, v15, v16);
  BOOL v17 = CKStringForQOS();
  uint64_t v19 = objc_msgSend_stringWithFormat_(v4, v18, @"%@ %@ State: %@, QoS: %@", v5, v8, v14, v17);

  return v19;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDOperation *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (unint64_t)hash
{
  v3 = objc_msgSend_operationID(self, a2, v2);
  unint64_t v6 = objc_msgSend_hash(v3, v4, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    id v7 = v4;
    uint64_t v10 = objc_msgSend_operationID(self, v8, v9);
    uint64_t v13 = objc_msgSend_operationID(v7, v11, v12);

    char isEqualToString = objc_msgSend_isEqualToString_(v10, v14, (uint64_t)v13);
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (CKDOperation)parentOperation
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_parentOperation);
  objc_sync_exit(v2);

  return (CKDOperation *)WeakRetained;
}

- (void)setParentOperation:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_parentOperation);

  if (WeakRetained != v4)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v7 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134218240;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      id v11 = v4;
      _os_log_debug_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_DEBUG, "Setting parent operation of %p to %p", (uint8_t *)&v8, 0x16u);
    }
    objc_storeWeak((id *)&v5->_parentOperation, v4);
  }
  objc_sync_exit(v5);
}

- (void)combineMetricsWithOperation:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend_addCKSpecificMetricsFromMetrics_(self->_cloudKitMetrics, v5, *((void *)v4 + 32));
  id v7 = *((id *)v4 + 33);
  if (v7)
  {
    if (!self->_MMCSMetrics)
    {
      int v8 = (CKDOperationMetrics *)objc_opt_new();
      MMCSMetrics = self->_MMCSMetrics;
      self->_MMCSMetrics = v8;
    }
    v24[0] = v7;
    __int16 v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v24, 1);
    MMCSOperationMetricCombineMetrics();
  }
  os_unfair_recursive_lock_unlock();
  uint64_t v13 = objc_msgSend_requestUUIDs(v4, v11, v12);
  objc_sync_enter(v13);
  uint64_t v16 = objc_msgSend_requestUUIDs(self, v14, v15);
  objc_sync_enter(v16);
  uint64_t v19 = objc_msgSend_requestUUIDs(self, v17, v18);
  uint64_t v22 = objc_msgSend_requestUUIDs(v4, v20, v21);
  objc_msgSend_addObjectsFromArray_(v19, v23, (uint64_t)v22);

  objc_sync_exit(v16);
  objc_sync_exit(v13);
}

- (void)spawnAndRunOperationOfClass:(Class)a3 operationInfo:(id)a4 spawnQueue:(id)a5 container:(id)a6 operationConfigurationBlock:(id)a7
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v83 = a5;
  id v13 = a6;
  id v14 = (void (**)(id, void *))a7;
  BOOL v17 = objc_msgSend_operationInfo(self, v15, v16);
  objc_msgSend_takeValuesFromParentOperationInfo_(v12, v18, (uint64_t)v17);

  objc_msgSend_setParentOperation_(v12, v19, (uint64_t)self);
  id v20 = [a3 alloc];
  uint64_t v22 = objc_msgSend_initWithOperationInfo_container_(v20, v21, (uint64_t)v12, v13);
  uint64_t v25 = objc_msgSend_useEncryption(self, v23, v24);
  objc_msgSend_setUseEncryption_(v22, v26, v25);
  if (v14) {
    v14[2](v14, v22);
  }
  uint64_t v27 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v28 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v29 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = v29;
    v34 = objc_msgSend_operationID(v22, v32, v33);
    uint64_t v37 = objc_msgSend_operationID(self, v35, v36);
    *(_DWORD *)buf = 138543618;
    uint64_t v87 = v34;
    __int16 v88 = 2114;
    v89 = v37;
    _os_log_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_INFO, "Adding child operation %{public}@ to parent operation %{public}@", buf, 0x16u);
  }
  objc_msgSend_setParentOperation_(v22, v30, (uint64_t)self);
  v40 = objc_msgSend_requestCompletedBlock(self, v38, v39);
  objc_msgSend_setRequestCompletedBlock_(v22, v41, (uint64_t)v40);

  if (v83)
  {
    objc_msgSend_addOperation_(v83, v42, (uint64_t)v22);
  }
  else if (!v13 {
         || (objc_msgSend_operationQueue(v13, v42, v43),
  }
             v44 = objc_claimAutoreleasedReturnValue(),
             BOOL v45 = v44 == 0,
             v44,
             v45))
  {
    if (*v27 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v72 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEBUG))
    {
      double v76 = v72;
      v79 = objc_msgSend_operationID(v22, v77, v78);
      v82 = objc_msgSend_operationID(self, v80, v81);
      *(_DWORD *)buf = 138543618;
      uint64_t v87 = v79;
      __int16 v88 = 2114;
      v89 = v82;
      _os_log_debug_impl(&dword_1C4CFF000, v76, OS_LOG_TYPE_DEBUG, "Child operation %{public}@ was added to parent %{public}@ but the parent has no container or operation queue to run that operation on", buf, 0x16u);
    }
    uint64_t v74 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v73, *MEMORY[0x1E4F19DD8], 1, @"Can't run a child operation on an orphaned parent operation");
    objc_msgSend_finishWithError_(v22, v75, (uint64_t)v74);
  }
  else
  {
    uint64_t v46 = (void *)MEMORY[0x1E4F28B48];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = sub_1C4D893A0;
    v84[3] = &unk_1E64F0948;
    v84[4] = self;
    id v47 = v22;
    id v85 = v47;
    v49 = objc_msgSend_blockOperationWithBlock_(v46, v48, (uint64_t)v84);
    uint64_t v52 = objc_msgSend_childOperationsGroup(self, v50, v51);
    dispatch_group_enter(v52);

    uint64_t v55 = objc_msgSend_childOperations(self, v53, v54);
    objc_sync_enter(v55);
    v58 = objc_msgSend_childOperations(self, v56, v57);
    objc_msgSend_addObject_(v58, v59, (uint64_t)v47);

    objc_sync_exit(v55);
    if (objc_msgSend_isCancelled(self, v60, v61)) {
      objc_msgSend_cancel(v47, v62, v63);
    }
    objc_msgSend_addDependency_(v49, v62, (uint64_t)v47);
    v66 = objc_msgSend_cleanupOperationQueue(v13, v64, v65);
    objc_msgSend_addOperation_(v66, v67, (uint64_t)v49);

    dispatch_queue_t v70 = objc_msgSend_operationQueue(v13, v68, v69);
    objc_msgSend_addOperation_(v70, v71, (uint64_t)v47);
  }
}

- (void)spawnAndRunOperationOfClass:(Class)a3 operationInfo:(id)a4 spawnQueue:(id)a5 operationConfigurationBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  objc_msgSend_container(self, v13, v14);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(self, v15, (uint64_t)a3, v12, v11, v16, v10);
}

- (void)spawnAndRunOperationOfClass:(Class)a3 operationInfo:(id)a4 operationConfigurationBlock:(id)a5
{
}

- (CKDOperation)topmostParentOperation
{
  uint64_t v2 = self;
  uint64_t v5 = objc_msgSend_parentOperation(v2, v3, v4);
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    do
    {
      id v7 = v6;

      unint64_t v6 = objc_msgSend_parentOperation(v7, v8, v9);

      uint64_t v2 = v7;
    }
    while (v6);
  }
  else
  {
    id v7 = v2;
  }
  return v7;
}

+ (id)_globalOperationCallbackQueueForQOS:(int64_t)a3
{
  if (qword_1EBBCDF38 != -1) {
    dispatch_once(&qword_1EBBCDF38, &unk_1F2042C70);
  }
  uint64_t v4 = (void **)&qword_1EBBCDF50;
  uint64_t v5 = &qword_1EBBCDF40;
  unint64_t v6 = &qword_1EBBCDF48;
  id v7 = &qword_1EBBCDF58;
  if (a3 <= 16) {
    id v7 = &qword_1EBBCDF60;
  }
  if (a3 <= 24) {
    unint64_t v6 = v7;
  }
  if (a3 <= 32) {
    uint64_t v5 = v6;
  }
  if (a3 != -1) {
    uint64_t v4 = (void **)v5;
  }
  int v8 = *v4;
  return v8;
}

- (void)_continueOperationStart
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isCancelled(self, a2, v2))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    unint64_t v6 = *MEMORY[0x1E4F1A520];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A520], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_DEFAULT, "Operation was cancelled before it could start", buf, 2u);
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v10 = *MEMORY[0x1E4F19DD8];
    id v11 = objc_msgSend_operationID(self, v7, v8);
    id v13 = objc_msgSend_errorWithDomain_code_format_(v9, v12, v10, 1, @"Operation %@ was cancelled", v11);

    objc_msgSend_finishWithError_(self, v14, (uint64_t)v13);
  }
  else
  {
    objc_msgSend__registerAttemptForOperation(self, v4, v5);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v15 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = v15;
      uint64_t v21 = objc_msgSend_operationID(self, v19, v20);
      *(_DWORD *)buf = 138543362;
      dispatch_time_t v23 = v21;
      _os_log_debug_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_DEBUG, "Invoking main for operation %{public}@", buf, 0xCu);
    }
    objc_msgSend_main(self, v16, v17);
  }
}

- (void)_registerAttemptForOperation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isLongLived(self, a2, v2)
    && (objc_msgSend_isLongLivedCallbackRelayOperation(self, v4, v5) & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    unint64_t v6 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = v6;
      uint64_t v20 = objc_msgSend_operationID(self, v18, v19);
      int v21 = 138543362;
      uint64_t v22 = v20;
      _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "Notifying operation info cache of an attempt for long-lived operation %{public}@", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v9 = objc_msgSend_deviceContext(self, v7, v8);
    id v12 = objc_msgSend_operationInfoCache(v9, v10, v11);
    uint64_t v15 = objc_msgSend_operationID(self, v13, v14);
    objc_msgSend_registerAttemptForOperationWithID_(v12, v16, (uint64_t)v15);
  }
}

- (BOOL)_checkAppVersion
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "Checking application version", buf, 2u);
  }
  unint64_t v6 = objc_msgSend_sharedManager(CKDServerConfigurationManager, v4, v5);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4D89C78;
  v9[3] = &unk_1E64F1CC8;
  v9[4] = self;
  objc_msgSend_configurationForOperation_completionHandler_(v6, v7, (uint64_t)self, v9);

  return 1;
}

- (unint64_t)networkServiceType
{
  objc_msgSend_topmostParentOperation(self, a2, v2);
  uint64_t v4 = (CKDOperation *)objc_claimAutoreleasedReturnValue();
  id v7 = v4;
  if (v4 == self)
  {
    uint64_t v9 = objc_msgSend_operationInfo(self, v5, v6);
    id v12 = objc_msgSend_group(v9, v10, v11);

    if (v12)
    {
      id v13 = objc_opt_new();
      uint64_t v16 = objc_msgSend_allowsCellularAccess(self, v14, v15);
      objc_msgSend_setAllowsCellularAccess_(v13, v17, v16);
      objc_msgSend_setIsUplink_(v13, v18, 1);
      uint64_t v20 = objc_msgSend_resolvedNetworkServiceTypeForConfig_(v12, v19, (uint64_t)v13);
      objc_msgSend_setIsUplink_(v13, v21, 0);
      uint64_t v23 = objc_msgSend_resolvedNetworkServiceTypeForConfig_(v12, v22, (uint64_t)v13);
      uint64_t v24 = objc_opt_class();
      uint64_t isPredominatelyDownload = objc_msgSend_isPredominatelyDownload(v24, v25, v26);
      if (v20) {
        unint64_t v28 = v20;
      }
      else {
        unint64_t v28 = v23;
      }
      if (isPredominatelyDownload == 1) {
        unint64_t v28 = v23;
      }
      if (isPredominatelyDownload) {
        unint64_t v8 = v28;
      }
      else {
        unint64_t v8 = v20;
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = objc_msgSend_networkServiceType(v4, v5, v6);
  }

  return v8;
}

- (void)_determineNetworkServiceType
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_operationInfo(self, a2, v2);
  id v7 = objc_msgSend_group(v4, v5, v6);

  uint64_t v10 = objc_msgSend_expectedSendSize(v7, v8, v9);
  uint64_t v13 = objc_msgSend_expectedReceiveSize(v7, v11, v12);
  if (v10 | v13)
  {
    uint64_t v16 = v13;
    uint64_t v74 = 0;
    uint64_t v75 = &v74;
    uint64_t v76 = 0x2020000000;
    char v77 = 0;
    uint64_t v17 = objc_msgSend_systemImposedInfo(v7, v14, v15);
    if (!v17) {
      *((unsigned char *)v75 + 24) = 1;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v18 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_DEBUG, "Determining Network Service Types", buf, 2u);
    }
    uint64_t v19 = objc_opt_new();
    uint64_t v22 = objc_msgSend_expectedSendSize(v7, v20, v21);
    objc_msgSend_setExpectedSendSize_(v19, v23, v22);
    uint64_t v26 = objc_msgSend_expectedReceiveSize(v7, v24, v25);
    objc_msgSend_setExpectedReceiveSize_(v19, v27, v26);
    unint64_t v28 = objc_opt_new();
    uint64_t v31 = objc_msgSend_networkServiceTypePerConfig(v17, v29, v30);
    objc_msgSend_setNetworkServiceTypePerConfig_(v19, v32, (uint64_t)v28);
    uint64_t v33 = objc_opt_new();
    BOOL v34 = v10 != 0;
    uint64_t v66 = MEMORY[0x1E4F143A8];
    uint64_t v67 = 3221225472;
    uint64_t v68 = sub_1C4D8A500;
    uint64_t v69 = &unk_1E64F1CF0;
    dispatch_queue_t v70 = self;
    id v35 = v31;
    id v71 = v35;
    v73 = &v74;
    id v36 = v28;
    id v72 = v36;
    v38 = (void (**)(void *, void *, uint64_t))_Block_copy(&v66);
    if (v34)
    {
      objc_msgSend_setIsUplink_(v33, v37, 1, v66, v67, v68, v69, v70, v71);
      objc_msgSend_setAllowsCellularAccess_(v33, v39, 1);
      uint64_t v42 = objc_msgSend_approximateSendBytes(v7, v40, v41);
      v38[2](v38, v33, v42);
      objc_msgSend_setAllowsCellularAccess_(v33, v43, 0);
      uint64_t v46 = objc_msgSend_approximateSendBytes(v7, v44, v45);
      v38[2](v38, v33, v46);
    }
    if (v16)
    {
      objc_msgSend_setIsUplink_(v33, v37, 0);
      objc_msgSend_setAllowsCellularAccess_(v33, v47, 1);
      uint64_t v50 = objc_msgSend_approximateReceiveBytes(v7, v48, v49);
      v38[2](v38, v33, v50);
      objc_msgSend_setAllowsCellularAccess_(v33, v51, 0);
      uint64_t v54 = objc_msgSend_approximateReceiveBytes(v7, v52, v53);
      v38[2](v38, v33, v54);
    }
    if (*((unsigned char *)v75 + 24))
    {
      objc_msgSend_setSystemImposedInfo_(v7, v37, (uint64_t)v19);
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v55 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_networkServiceType(self, v56, v57);
        dispatch_qos_class_t v64 = CKStringForNetworkServiceType();
        *(_DWORD *)buf = 138543362;
        v79 = v64;
        _os_log_debug_impl(&dword_1C4CFF000, v55, OS_LOG_TYPE_DEBUG, "Determined Network Service Type %{public}@", buf, 0xCu);
      }
      uint64_t v60 = objc_msgSend_clientOperationCallbackProxy(self, v58, v59);
      objc_msgSend_handleSystemDidImposeInfo_(v60, v61, (uint64_t)v19);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v60 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_networkServiceType(self, v62, v63);
        uint64_t v65 = CKStringForNetworkServiceType();
        *(_DWORD *)buf = 138543362;
        v79 = v65;
        _os_log_debug_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_DEBUG, "Using pre-determined Network Service Type %{public}@", buf, 0xCu);
      }
    }

    _Block_object_dispose(&v74, 8);
  }
  objc_msgSend__continueOperationStart(self, v14, v15, v66, v67, v68, v69, v70);
}

+ (int64_t)isPredominatelyDownload
{
  return 1;
}

- (BOOL)supportsDeviceThrottling
{
  return 1;
}

- (void)start
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v4 = objc_msgSend_osActivity(self, a2, v2);
  os_activity_scope_enter(v4, &state);

  id v7 = objc_msgSend_signpost(self, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_signpost(self, v8, v9);
    uint64_t v13 = objc_msgSend_log(v10, v11, v12);

    uint64_t v16 = objc_msgSend_signpost(self, v14, v15);
    os_signpost_id_t v19 = objc_msgSend_identifier(v16, v17, v18);

    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      uint64_t v20 = objc_opt_class();
      objc_msgSend_operationID(self, v21, v22);
      uint64_t v23 = (CKDOperation *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = objc_msgSend_containerID(self, v24, v25);
      uint64_t v29 = objc_msgSend_container(self, v27, v28);
      objc_super v32 = objc_msgSend_applicationBundleID(v29, v30, v31);
      objc_msgSend_qualityOfService(self, v33, v34);
      id v35 = CKStringForQOS();
      *(_DWORD *)buf = 138544386;
      uint64_t v152 = v20;
      __int16 v153 = 2112;
      v154 = v23;
      __int16 v155 = 2112;
      id v156 = v26;
      __int16 v157 = 2112;
      v158 = v32;
      __int16 v159 = 2114;
      v160 = v35;
      _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v19, "CKDOperation", "Type=%{signpost.description:attribute,public}@ ID=%{signpost.description:attribute}@ ContainerID=%{signpost.description:attribute}@ BundleID=%{signpost.description:attribute}@ QoS=%{signpost.description:attribute,public}@ ", buf, 0x34u);
    }
  }
  objc_msgSend_hash(self, v8, v9);
  kdebug_trace();
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v36 = (id)*MEMORY[0x1E4F1A520];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v39, 1, 0, 0);
    objc_msgSend_CKPropertiesStyleString(v40, v41, v42);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v45 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v44, 0, 1, 0);
    uint64_t v48 = objc_msgSend_CKPropertiesStyleString(v45, v46, v47);
    *(_DWORD *)buf = 138544130;
    uint64_t v152 = (uint64_t)v38;
    __int16 v153 = 2048;
    v154 = self;
    __int16 v155 = 2114;
    id v156 = v43;
    __int16 v157 = 2112;
    v158 = v48;
    _os_log_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEFAULT, "Starting <%{public}@: %p; %{public}@, %@>", buf, 0x2Au);
  }
  uint64_t v51 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v49, v50);
  objc_msgSend_setMetricExecuteStartDate_(self, v52, (uint64_t)v51);

  v149[0] = MEMORY[0x1E4F143A8];
  v149[1] = 3221225472;
  v149[2] = sub_1C4D8B0B8;
  v149[3] = &unk_1E64F1D18;
  v149[4] = self;
  objc_msgSend_updateCloudKitMetrics_(self, v53, (uint64_t)v149);
  uint64_t v54 = self;
  objc_sync_enter(v54);
  uint64_t v57 = objc_msgSend_container(v54, v55, v56);
  char v60 = objc_msgSend_beginContentAccess(v57, v58, v59);

  if (v60)
  {
    objc_msgSend_setEndContainerAccess_(v54, v61, 1);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v62 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v62, OS_LOG_TYPE_ERROR, "Failed to begin container content access", buf, 2u);
    }
  }
  objc_sync_exit(v54);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4D8B22C;
  aBlock[3] = &unk_1E64F1D40;
  aBlock[4] = v54;
  uint64_t v63 = (uint64_t (**)(void))_Block_copy(aBlock);
  if ((((uint64_t (*)(void))v63[2])() & 1) == 0)
  {
    if ((objc_msgSend_isExecuting(v54, v64, v65) & 1) != 0 || objc_msgSend_isFinished(v54, v66, v67))
    {
      uint64_t v68 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v69 = objc_msgSend_operationID(v54, v66, v67);
      objc_msgSend_raise_format_(v68, v70, *MEMORY[0x1E4F1C3C8], @"You can't restart an executing or finished CKOperation: %@", v69);
    }
    id v71 = (unsigned char *)MEMORY[0x1E4F1A4E0];
    if (*MEMORY[0x1E4F1A4E0])
    {
      id v72 = objc_msgSend_unitTestOverrides(v54, v66, v67);
      uint64_t v76 = objc_msgSend_objectForKeyedSubscript_(v72, v73, @"ForceTimingIssueAroundProxySetupQueue");
      if (v76)
      {
        int isLongLivedCallbackRelayOperation = objc_msgSend_isLongLivedCallbackRelayOperation(v54, v74, v75);

        if (isLongLivedCallbackRelayOperation) {
          sleep(2u);
        }
      }
      else
      {
      }
    }
    objc_msgSend_transitionToExecuting(v54, v66, v67);
    if ((v63[2](v63) & 1) == 0)
    {
      if (objc_msgSend_supportsDeviceThrottling(v54, v78, v79))
      {
        v82 = objc_msgSend_deviceContext(v54, v80, v81);
        id v85 = objc_msgSend_throttleManager(v82, v83, v84);
        id v147 = 0;
        uint64_t v87 = objc_msgSend_enforcedThrottleForCriteria_willSendRequest_outThrottleError_(v85, v86, (uint64_t)v54, 1, &v147);
        id v88 = v147;

        if (v87)
        {
          if (objc_msgSend_canTestInClientProcess(v87, v80, v81))
          {
            uint64_t v91 = objc_msgSend_container(v54, v89, v90);
            uint64_t v94 = objc_msgSend_logicalDeviceScopedClientProxy(v91, v92, v93);

            objc_msgSend_setHasBeenThrottled_(v94, v95, 1);
            objc_msgSend_addThrottle_(v94, v96, (uint64_t)v87);
          }
          uint64_t v97 = objc_msgSend_CKClientSuitableError(v88, v89, v90);
          objc_msgSend_finishWithError_(v54, v98, (uint64_t)v97);
LABEL_50:

          goto LABEL_51;
        }
      }
      else
      {
        id v88 = 0;
      }
      if (*v71
        && (objc_msgSend_skipSettingUnitTestOverrides(v54, v80, v81) & 1) == 0
        && objc_msgSend_useEncryption(v54, v99, v100))
      {
        v103 = objc_msgSend_unitTestOverrides(v54, v101, v102);
        uint64_t v106 = objc_msgSend_count(v103, v104, v105);

        objc_msgSend_container(v54, v107, v108);
        if (v106) {
          id v109 = {;
        }
          objc_msgSend_pcsManager(v109, v110, v111);
        }
        else {
          id v109 = {;
        }
          objc_msgSend_pcsManagerIfExists(v109, v112, v113);
        __int16 v114 = };

        int v117 = objc_msgSend_unitTestOverrides(v54, v115, v116);
        objc_msgSend_addEntriesForUnitTestOverrides_(v114, v118, (uint64_t)v117);
      }
      uint64_t v87 = dispatch_group_create();
      uint64_t v97 = objc_msgSend_clientOperationCallbackProxy(v54, v119, v120);
      v146[0] = MEMORY[0x1E4F143A8];
      v146[1] = 3221225472;
      v146[2] = sub_1C4D8B4A8;
      v146[3] = &unk_1E64F05C8;
      v146[4] = v54;
      v121 = _Block_copy(v146);
      uint64_t v122 = v121;
      if (v97)
      {
        dispatch_group_enter(v87);
        v144[0] = MEMORY[0x1E4F143A8];
        v144[1] = 3221225472;
        v144[2] = sub_1C4D8B694;
        v144[3] = &unk_1E64F08D0;
        v123 = v87;
        v145 = v123;
        objc_msgSend_handleDidStart_(v97, v124, (uint64_t)v144);

        if (*v71)
        {
          v127 = objc_msgSend_operationInfo(v54, v125, v126);
          int v130 = objc_msgSend_wantsDaemonOperationCallbacks(v127, v128, v129);

          if (v130)
          {
            dispatch_group_enter(v123);
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v131 = (id)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
            {
              v141 = objc_msgSend_operationID(v54, v132, v133);
              *(_DWORD *)buf = 138543362;
              uint64_t v152 = (uint64_t)v141;
              _os_log_debug_impl(&dword_1C4CFF000, v131, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out to client about lifecycle transition", buf, 0xCu);
            }
            unint64_t v134 = (objc_class *)objc_opt_class();
            v135 = NSStringFromClass(v134);
            uint64_t isTopLevelDaemonOperation = objc_msgSend_isTopLevelDaemonOperation(v54, v136, v137);
            v142[0] = MEMORY[0x1E4F143A8];
            v142[1] = 3221225472;
            v142[2] = sub_1C4D8B69C;
            v142[3] = &unk_1E64F1D68;
            v142[4] = v54;
            uint64_t v143 = v123;
            objc_msgSend_handleDaemonOperationWillStartWithClassName_isTopLevelDaemonOperation_replyBlock_(v97, v139, (uint64_t)v135, isTopLevelDaemonOperation, v142);
          }
        }
        v140 = objc_msgSend_callbackQueue(v54, v125, v126);
        dispatch_group_notify(v123, v140, v122);
      }
      else
      {
        (*((void (**)(void *))v121 + 2))(v121);
      }

      goto LABEL_50;
    }
  }
LABEL_51:

  os_activity_scope_leave(&state);
}

- (void)main
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v4 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_fault_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_FAULT, "main was called on CKDOperation", v9, 2u);
  }
  id v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CKDOperation.m", 1065, @"Must be called on subclass");
}

- (void)_finishInternalOnCallbackQueueWithError:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  uint64_t v10 = objc_msgSend_signpost(self, v8, v9);

  if (v10)
  {
    uint64_t v13 = objc_msgSend_signpost(self, v11, v12);
    uint64_t v16 = objc_msgSend_log(v13, v14, v15);

    os_signpost_id_t v19 = objc_msgSend_signpost(self, v17, v18);
    os_signpost_id_t v22 = objc_msgSend_identifier(v19, v20, v21);

    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v4;
      _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v16, OS_SIGNPOST_EVENT, v22, "CKDOperation", "Finishing with error: %@", buf, 0xCu);
    }
  }
  uint64_t v23 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
  uint64_t v24 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v25 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v26 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (v4)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v24);
    }
    uint64_t v27 = *MEMORY[0x1E4F1A520];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A520], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_DEFAULT, "Operation is finishing on callback queue with an error", buf, 2u);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v24);
    }
    uint64_t v30 = *v26;
    if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_DEBUG, "Operation is finishing on callback queue with no error", buf, 2u);
    }
  }
  if (objc_msgSend_isExecuting(self, v28, v29)) {
    goto LABEL_19;
  }
  if (*v25 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], *v23);
  }
  os_log_t v33 = *v26;
  if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v49 = v33;
    uint64_t v52 = objc_msgSend_operationID(self, v50, v51);
    *(_DWORD *)buf = 138543362;
    id v54 = v52;
    _os_log_debug_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_DEBUG, "The operation %{public}@ didn't start or is already finished", buf, 0xCu);

    if (v4) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
    if (v4) {
      goto LABEL_23;
    }
  }
  if (objc_msgSend_isCancelled(self, v31, v32))
  {
    uint64_t v34 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v35 = *MEMORY[0x1E4F19DD8];
    id v36 = objc_msgSend_operationID(self, v31, v32);
    objc_msgSend_errorWithDomain_code_format_(v34, v37, v35, 1, @"Operation %@ was cancelled", v36);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
LABEL_23:
  id v38 = objc_msgSend_error(self, v31, v32);

  if (!v38) {
    objc_msgSend_setError_(self, v39, (uint64_t)v4);
  }
  if ((objc_msgSend_isFinished(self, v39, v40) & 1) == 0)
  {
    v44 = objc_msgSend_error(self, v41, v42);
    objc_msgSend__finishOnCallbackQueueWithError_(self, v48, (uint64_t)v44);
    goto LABEL_31;
  }
  if (*v25 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], *v23);
  }
  os_log_t v43 = *v26;
  if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEBUG))
  {
    v44 = v43;
    uint64_t v47 = objc_msgSend_operationID(self, v45, v46);
    *(_DWORD *)buf = 138543362;
    id v54 = v47;
    _os_log_debug_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_DEBUG, "Ignoring _finishInternalOnCallbackQueue invocation on already-finished operation %{public}@", buf, 0xCu);

LABEL_31:
  }
}

- (void)finishWithError:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = dispatch_group_create();
  unint64_t v8 = objc_msgSend_childOperations(self, v6, v7);
  objc_sync_enter(v8);
  uint64_t v11 = objc_msgSend_childOperations(self, v9, v10);
  uint64_t v14 = objc_msgSend_count(v11, v12, v13);

  objc_sync_exit(v8);
  uint64_t v15 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v16 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (v14)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v17 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
    {
      id v54 = v17;
      uint64_t v57 = objc_msgSend_operationID(self, v55, v56);
      *(_DWORD *)buf = 134218242;
      uint64_t v78 = v14;
      __int16 v79 = 2114;
      uint64_t v80 = v57;
      _os_log_debug_impl(&dword_1C4CFF000, v54, OS_LOG_TYPE_DEBUG, "Waiting for all (%lu) child operations to finish for operation %{public}@", buf, 0x16u);
    }
  }
  dispatch_group_enter(v5);
  uint64_t v20 = objc_msgSend_childOperationsGroup(self, v18, v19);
  uint64_t v23 = objc_msgSend_callbackQueue(self, v21, v22);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D8C2F8;
  block[3] = &unk_1E64F19C0;
  uint64_t v76 = v14;
  void block[4] = self;
  uint64_t v24 = v5;
  uint64_t v75 = v24;
  dispatch_group_notify(v20, v23, block);

  uint64_t v27 = objc_msgSend_stateTransitionGroup(self, v25, v26);
  intptr_t v28 = dispatch_group_wait(v27, 0);

  if (v28)
  {
    if (*v15 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v29 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
    {
      v58 = v29;
      uint64_t v61 = objc_msgSend_operationID(self, v59, v60);
      *(_DWORD *)buf = 138543362;
      uint64_t v78 = (uint64_t)v61;
      _os_log_debug_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_DEBUG, "Operation %{public}@ is waiting for its state transition lock holders to finish before it can complete", buf, 0xCu);
    }
  }
  BOOL v30 = v28 != 0;
  dispatch_group_enter(v24);
  os_log_t v33 = objc_msgSend_stateTransitionGroup(self, v31, v32);
  id v36 = objc_msgSend_callbackQueue(self, v34, v35);
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = sub_1C4D8C41C;
  v71[3] = &unk_1E64F1D90;
  BOOL v73 = v30;
  v71[4] = self;
  uint64_t v37 = v24;
  id v72 = v37;
  dispatch_group_notify(v33, v36, v71);

  uint64_t v40 = objc_msgSend_clientOperationCallbackProxy(self, v38, v39);

  if (v40)
  {
    if (*v15 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v43 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
    {
      v62 = v43;
      uint64_t v65 = objc_msgSend_operationID(self, v63, v64);
      *(_DWORD *)buf = 138543362;
      uint64_t v78 = (uint64_t)v65;
      _os_log_debug_impl(&dword_1C4CFF000, v62, OS_LOG_TYPE_DEBUG, "Waiting for all client callbacks to finish for operation %{public}@", buf, 0xCu);
    }
    dispatch_group_enter(v37);
    uint64_t v46 = objc_msgSend_operationID(self, v44, v45);
    uint64_t v49 = objc_msgSend_clientOperationCallbackProxy(self, v47, v48);
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = sub_1C4D8C530;
    v68[3] = &unk_1E64F0948;
    id v69 = v46;
    dispatch_queue_t v70 = v37;
    id v50 = v46;
    objc_msgSend_addBarrierBlock_(v49, v51, (uint64_t)v68);
  }
  uint64_t v52 = objc_msgSend_callbackQueue(self, v41, v42);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = sub_1C4D8C614;
  v66[3] = &unk_1E64F0948;
  v66[4] = self;
  id v67 = v4;
  id v53 = v4;
  dispatch_group_notify(v37, v52, v66);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  v127 = (__CFString *)a3;
  uint64_t v7 = objc_msgSend_callbackQueue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend_isFinished(self, v8, v9))
  {
    uint64_t v118 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    v121 = objc_msgSend_operationID(self, v119, v120);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v118, v122, (uint64_t)a2, self, @"CKDOperation.m", 1145, @"Operation %@ was already marked as finished", v121);
  }
  uint64_t v12 = objc_msgSend_signpost(self, v10, v11);

  if (v12)
  {
    uint64_t v15 = objc_msgSend_signpost(self, v13, v14);
    uint64_t v18 = objc_msgSend_log(v15, v16, v17);

    uint64_t v21 = objc_msgSend_signpost(self, v19, v20);
    os_signpost_id_t v24 = objc_msgSend_identifier(v21, v22, v23);

    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v18, OS_SIGNPOST_INTERVAL_END, v24, "CKDOperation", "", buf, 2u);
    }
  }
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = sub_1C4D8CC3C;
  v128[3] = &unk_1E64F1D18;
  v128[4] = self;
  objc_msgSend_updateCloudKitMetrics_(self, v13, (uint64_t)v128);
  if (objc_msgSend_isEnabled(CKDPowerLogger, v25, v26))
  {
    int v29 = objc_msgSend_isTopLevelDaemonOperation(self, v27, v28) ^ 1;
    if (v127) {
      LOBYTE(v29) = 1;
    }
    if ((v29 & 1) == 0)
    {
      BOOL v30 = (objc_class *)objc_opt_class();
      uint64_t v31 = NSStringFromClass(v30);
      uint64_t v123 = CKDaemonOperationTypeForClass(v31);

      os_unfair_recursive_lock_lock_with_options();
      uint64_t v32 = [CKDOperationCombinedMetrics alloc];
      v125 = objc_msgSend_initWithCloudKitMetrics_andMMCSMetrics_(v32, v33, (uint64_t)self->_cloudKitMetrics, self->_MMCSMetrics);
      os_unfair_recursive_lock_unlock();
      id v36 = objc_msgSend_topmostParentOperation(self, v34, v35);
      uint64_t v126 = objc_msgSend_operationInfo(v36, v37, v38);

      uint64_t v41 = objc_msgSend_group(v126, v39, v40);
      v124 = objc_msgSend_sharedLogger(CKDPowerLogger, v42, v43);
      uint64_t v46 = objc_msgSend_operationID(self, v44, v45);
      uint64_t v49 = objc_msgSend_operationGroupID(v41, v47, v48);
      uint64_t v52 = objc_msgSend_name(v41, v50, v51);
      uint64_t v55 = objc_msgSend_quantity(v41, v53, v54);
      uint64_t v58 = objc_msgSend_qualityOfService(self, v56, v57);
      uint64_t v61 = objc_msgSend_xpcActivityIdentifier(v126, v59, v60);
      uint64_t v64 = objc_msgSend_container(self, v62, v63);
      id v67 = objc_msgSend_appContainerTuple(v64, v65, v66);
      objc_msgSend_logOperationCombinedMetrics_forOperationID_operationType_operationGroupID_operationGroupName_operationGroupQuantity_operationQualityOfService_xpcActivityIdentifier_appContainerTuple_(v124, v68, (uint64_t)v125, v46, v123, v49, v52, v55, v58, v61, v67);
    }
  }
  objc_msgSend_sendCoreAnalyticsEventOperationFinished(self, v27, v28);
  id v71 = objc_msgSend_userSyncTask(self, v69, v70);

  if (v71)
  {
    uint64_t v74 = objc_msgSend_userSyncTask(self, v72, v73);
    objc_msgSend_end(v74, v75, v76);
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  char v77 = (void *)*MEMORY[0x1E4F1A520];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A520], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v78 = v77;
    __int16 v79 = (objc_class *)objc_opt_class();
    uint64_t v80 = NSStringFromClass(v79);
    v82 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v81, 1, 0, 0);
    id v85 = objc_msgSend_CKPropertiesStyleString(v82, v83, v84);
    uint64_t v87 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v86, 0, 1, 0);
    uint64_t v90 = objc_msgSend_CKPropertiesStyleString(v87, v88, v89);
    uint64_t v93 = objc_msgSend_operationMetrics(self, v91, v92);
    uint64_t v94 = (void *)v93;
    int v95 = @" with error: ";
    *(_DWORD *)buf = 138544898;
    v96 = &stru_1F2044F30;
    int v130 = v80;
    __int16 v131 = 2048;
    if (v127) {
      v96 = v127;
    }
    else {
      int v95 = &stru_1F2044F30;
    }
    v132 = self;
    __int16 v133 = 2114;
    unint64_t v134 = v85;
    __int16 v135 = 2112;
    v136 = v90;
    __int16 v137 = 2112;
    uint64_t v138 = v93;
    __int16 v139 = 2114;
    v140 = v95;
    __int16 v141 = 2112;
    v142 = v96;
    _os_log_impl(&dword_1C4CFF000, v78, OS_LOG_TYPE_DEFAULT, "Finished operation <%{public}@: %p; %{public}@, %@> metrics=%@%{public}@%@",
      buf,
      0x48u);
  }
  uint64_t v97 = self;
  objc_sync_enter(v97);
  request = v97->_request;
  v97->_request = 0;

  if (objc_msgSend_endContainerAccess(v97, v99, v100))
  {
    v103 = objc_msgSend_container(v97, v101, v102);
    objc_msgSend_endContentAccess(v103, v104, v105);

    objc_msgSend_setEndContainerAccess_(v97, v106, 0);
  }
  objc_sync_exit(v97);

  id v109 = objc_msgSend_childOperations(v97, v107, v108);
  objc_sync_enter(v109);
  __int16 v112 = objc_msgSend_childOperations(v97, v110, v111);
  objc_msgSend_removeAllObjects(v112, v113, v114);

  objc_sync_exit(v109);
  objc_msgSend_setState_(v97, v115, 0xFFFFFFFFLL);
  objc_msgSend_transitionToFinished(v97, v116, v117);
}

- (BOOL)isTopLevelDaemonOperation
{
  uint64_t v6 = objc_msgSend_parentOperation(self, a2, v2);
  if (v6) {
    LOBYTE(v7) = 0;
  }
  else {
    int v7 = objc_msgSend_isLongLivedCallbackRelayOperation(self, v4, v5) ^ 1;
  }

  return v7;
}

- (void)cancel
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v4 = objc_msgSend_osActivity(self, a2, v2);
  os_activity_scope_enter(v4, &state);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v5 = (id)*MEMORY[0x1E4F1A520];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_msgSend_ckShortDescription(self, v8, v9);
    *(_DWORD *)buf = 138543874;
    id v37 = v7;
    __int16 v38 = 2048;
    uint64_t v39 = self;
    __int16 v40 = 2114;
    uint64_t v41 = v10;
    _os_log_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling operation <%{public}@: %p; %{public}@>",
      buf,
      0x20u);
  }
  objc_msgSend_setQueuePriority_(self, v11, 8);
  v33.receiver = self;
  v33.super_class = (Class)CKDOperation;
  [(CKDOperation *)&v33 cancel];
  uint64_t v14 = objc_msgSend_request(self, v12, v13);
  objc_msgSend_cancel(v14, v15, v16);

  uint64_t v19 = objc_msgSend_childOperations(self, v17, v18);
  objc_sync_enter(v19);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v22 = objc_msgSend_childOperations(self, v20, v21, 0);
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v29, v35, 16);
  if (v26)
  {
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend_cancel(*(void **)(*((void *)&v29 + 1) + 8 * i), v24, v25);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v24, (uint64_t)&v29, v35, 16);
    }
    while (v26);
  }

  objc_sync_exit(v19);
  os_activity_scope_leave(&state);
}

- (unint64_t)state
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  obj = self;
  objc_sync_enter(obj);
  uint64_t state = obj->_state;
  if (state == a3)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_uint64_t state = a3;
    objc_sync_exit(obj);

    id v7 = objc_msgSend_signpost(obj, v5, v6);

    if (v7)
    {
      uint64_t v10 = objc_msgSend_signpost(obj, v8, v9);
      uint64_t v13 = objc_msgSend_log(v10, v11, v12);

      uint64_t v16 = objc_msgSend_signpost(obj, v14, v15);
      os_signpost_id_t v19 = objc_msgSend_identifier(v16, v17, v18);

      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        uint64_t v20 = objc_opt_class();
        uint64_t v22 = objc_msgSend_nameForState_(v20, v21, a3);
        *(_DWORD *)buf = 138543362;
        id v36 = v22;
        _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v13, OS_SIGNPOST_EVENT, v19, "CKDOperation", "%{public}@", buf, 0xCu);
      }
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v23 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      os_signpost_id_t v24 = v23;
      uint64_t v27 = objc_msgSend_operationID(obj, v25, v26);
      uint64_t v28 = objc_opt_class();
      long long v30 = objc_msgSend_nameForState_(v28, v29, state);
      long long v31 = objc_opt_class();
      objc_super v33 = objc_msgSend_nameForState_(v31, v32, a3);
      *(_DWORD *)buf = 138543874;
      id v36 = v27;
      __int16 v37 = 2114;
      __int16 v38 = v30;
      __int16 v39 = 2114;
      __int16 v40 = v33;
      _os_log_debug_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_DEBUG, "Operation %{public}@ transitioned from state [%{public}@] to state [%{public}@]", buf, 0x20u);
    }
  }
}

- (BOOL)makeStateTransition
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v4 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_fault_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_FAULT, "makeStateTransition was called on CKDOperation", v10, 2u);
  }
  id v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CKDOperation.m", 1261, @"Must be called on subclass");

  return 0;
}

- (void)makeStateTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(self, a2, a3) != 0xFFFFFFFFLL)
  {
    int isCancelled = objc_msgSend_isCancelled(self, v6, v7);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v9 = (void *)*MEMORY[0x1E4F1A520];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A520], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v9;
      uint64_t v15 = objc_msgSend_operationID(self, v13, v14);
      uint64_t v16 = objc_opt_class();
      uint64_t v19 = objc_msgSend_state(self, v17, v18);
      uint64_t v21 = objc_msgSend_nameForState_(v16, v20, v19);
      os_signpost_id_t v24 = objc_msgSend_error(self, v22, v23);
      *(_DWORD *)buf = 138544386;
      uint64_t v47 = v15;
      __int16 v48 = 2114;
      uint64_t v49 = v21;
      __int16 v50 = 1024;
      BOOL v51 = v3;
      __int16 v52 = 1024;
      int v53 = isCancelled;
      __int16 v54 = 2114;
      uint64_t v55 = v24;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEFAULT, "Operation %{public}@ is transitioning from state [%{public}@], stop:%d, cancelled:%d, error:%{public}@", buf, 0x2Cu);
    }
    if (((isCancelled | v3) & 1) != 0
      || (objc_msgSend_error(self, v10, v11), uint64_t v25 = objc_claimAutoreleasedReturnValue(), v25, v25))
    {
      objc_msgSend_setState_(self, v10, 0xFFFFFFFFLL);
      if (isCancelled)
      {
        long long v29 = 0;
        objc_msgSend_finishWithError_(self, v27, 0);
      }
      else
      {
        long long v29 = objc_msgSend_error(self, v27, v28);
        objc_msgSend_finishWithError_(self, v30, (uint64_t)v29);
      }
    }
    else
    {
      if (objc_msgSend_isFinished(self, v10, v26))
      {
        uint64_t v42 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v31, v32);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, self, @"CKDOperation.m", 1281, @"Operation %@ is marked as finished", self);
      }
      objc_super v33 = (void *)MEMORY[0x1C8789E70]();
      char v36 = objc_msgSend_makeStateTransition(self, v34, v35) ^ 1;
      long long v29 = objc_msgSend_stateTransitionGroup(self, v37, v38);
      objc_msgSend_qualityOfService(self, v39, v40);
      uint64_t v41 = CKGetGlobalQueue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4D8D6D8;
      block[3] = &unk_1E64F1DB8;
      void block[4] = self;
      char v45 = v36;
      dispatch_group_notify(v29, v41, block);
    }
  }
}

+ (id)nameForState:(unint64_t)a3
{
  BOOL v3 = @"Unknown";
  if (a3 == 0xFFFFFFFF) {
    BOOL v3 = @"Complete";
  }
  if (a3 == 1) {
    return @"Not Started";
  }
  else {
    return v3;
  }
}

- (void)beginUserSyncTask
{
  objc_msgSend_currentProcess(CKDDaemonProcess, a2, v2);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_processType(v29, v4, v5))
  {
    unint64_t v8 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v6, v7);
    int isSharedIPad = objc_msgSend_isSharedIPad(v8, v9, v10);

    if (!isSharedIPad) {
      return;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4FB3728];
    uint64_t v15 = objc_msgSend_operationID(self, v12, v13);
    uint64_t v18 = objc_msgSend_container(self, v16, v17);
    uint64_t v21 = objc_msgSend_applicationBundleID(v18, v19, v20);
    uint64_t v23 = objc_msgSend_taskWithName_reason_forBundleID_(v14, v22, (uint64_t)v15, @"CloudKit client work", v21);
    objc_msgSend_setUserSyncTask_(self, v24, (uint64_t)v23);

    objc_msgSend_userSyncTask(self, v25, v26);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_begin(v29, v27, v28);
  }
}

- (void)noteOperationWillWaitOnPCS
{
}

- (void)noteOperationDidFinishWaitingOnPCS
{
}

- (BOOL)isWaitingOnPCS
{
  signed int v2 = atomic_load((unsigned int *)&self->_pcsWaitCount);
  return v2 > 0;
}

- (void)fetchContainerScopedUserID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  uint64_t v7 = objc_msgSend_container(self, v5, v6);
  uint64_t v10 = objc_msgSend_containerScopedUserID(v7, v8, v9);
  if (v10)
  {

    goto LABEL_4;
  }
  uint64_t v13 = objc_msgSend_databaseScope(self, v11, v12);

  if (v13 == 1)
  {
LABEL_4:
    if (v4) {
      v4[2](v4, 0);
    }
    goto LABEL_11;
  }
  objc_initWeak(&location, self);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v14 = (id)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = objc_msgSend_operationID(self, v15, v16);
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v21;
    _os_log_debug_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_DEBUG, "Fetching container scoped user identifier for operation %{public}@", buf, 0xCu);
  }
  uint64_t v19 = objc_msgSend_container(self, v17, v18);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1C4D8DACC;
  v22[3] = &unk_1E64F1DE0;
  objc_copyWeak(&v24, &location);
  uint64_t v23 = v4;
  objc_msgSend_fetchImportantUserIDsForOperation_withCompletionHandler_(v19, v20, (uint64_t)self, v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_11:
}

- (CKDLogicalDeviceContext)deviceContext
{
  BOOL v3 = objc_msgSend_container(self, a2, v2);
  uint64_t v6 = objc_msgSend_deviceContext(v3, v4, v5);

  return (CKDLogicalDeviceContext *)v6;
}

- (BOOL)isFinished
{
  return MEMORY[0x1F40D63D8](&self->_executionState, a2);
}

- (BOOL)isExecuting
{
  return MEMORY[0x1F40D63D0](&self->_executionState, a2);
}

- (void)transitionToExecuting
{
}

- (void)transitionToFinished
{
}

- (BOOL)shouldCheckAppVersion
{
  return 1;
}

- (unsigned)QOSClass
{
  objc_msgSend_qualityOfService(self, a2, v2);
  return CKQoSClassFromNSQualityOfService();
}

- (void)configureQualityOfServiceFromOperationInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_qualityOfService(v4, v5, v6);
  if (v7 == -1) {
    uint64_t v8 = 17;
  }
  else {
    uint64_t v8 = v7;
  }
  int v9 = CKQualityOfServiceOrdering();
  if (v9 > (int)CKQualityOfServiceOrdering() && objc_msgSend_discretionaryNetworkBehavior(v4, v10, v11))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      uint64_t v14 = self;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Operation %@ was assigned QoS greater than Utility but it has discretionary networking behavior. Demoting operation QoS to Utility.", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v8 = 17;
  }
  objc_msgSend_setQualityOfService_(self, v10, v8);
}

- (void)setQualityOfService:(int64_t)a3
{
  int v5 = CKQualityOfServiceOrdering();
  if (v5 > (int)CKQualityOfServiceOrdering() && objc_msgSend_discretionaryNetworkBehavior(self, v6, v7))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v8 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_FAULT, "A CKDOperation was assigned a QoS greater than Utility but its discretionaryNetworkingBehavior is not set nonDiscretionary. A high QoS operation may end up gated on the network.", buf, 2u);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)CKDOperation;
  [(CKDOperation *)&v9 setQualityOfService:a3];
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)usesBackgroundSession
{
  char v4 = objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(self, a2, v2);
  uint64_t v7 = objc_msgSend_resolvedDiscretionaryNetworkBehavior(self, v5, v6);
  if (objc_msgSend_duetPreClearedMode(self, v8, v9) | v7) {
    return 1;
  }
  else {
    return v4;
  }
}

- (BOOL)expectDelayBeforeRequestBegins
{
  uint64_t v4 = objc_msgSend_duetPreClearedMode(self, a2, v2);
  BOOL result = objc_msgSend_usesBackgroundSession(self, v5, v6);
  if (v4) {
    return 0;
  }
  return result;
}

- (CKDOperationCallbackProxy)clientOperationCallbackProxy
{
  objc_msgSend_topmostParentOperation(self, a2, v2);
  BOOL v3 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (CKDOperationCallbackProxy *)v3[39];

  return v4;
}

- (void)setClientOperationCallbackProxy:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_topmostParentOperation(self, v5, v6);
  uint64_t v7 = (void *)v8[39];
  v8[39] = v4;
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1C4D8E1E4;
    v7[3] = &unk_1E64F0768;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)CKDOperation;
    [(CKDOperation *)&v6 setCompletionBlock:v7];

    objc_destroyWeak(&v9);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKDOperation;
    [(CKDOperation *)&v5 setCompletionBlock:0];
  }
  objc_destroyWeak(&location);
}

- (id)openFileWithOpenInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = sub_1C4D8E61C;
  uint64_t v43 = sub_1C4D8E62C;
  id v44 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  char v36 = sub_1C4D8E61C;
  __int16 v37 = sub_1C4D8E62C;
  id v38 = 0;
  uint64_t v10 = objc_msgSend_clientOperationCallbackProxy(self, v7, v8);
  if (v10)
  {
    uint64_t v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    uint64_t v12 = (void *)MEMORY[0x1C8789E70]();
    voucher_copy_without_importance();
    voucher_adopt();
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    uint64_t v28 = sub_1C4D8E634;
    id v29 = &unk_1E64F1E08;
    long long v31 = &v33;
    uint64_t v32 = &v39;
    int v13 = v11;
    long long v30 = v13;
    objc_msgSend_openFileWithOpenInfo_reply_(v10, v14, (uint64_t)v6, &v26);

    dispatch_time_t v15 = dispatch_time(0, 150000000000);
    if (dispatch_group_wait(v13, v15))
    {
      uint64_t v17 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v16, *MEMORY[0x1E4F19DD8], 1000, @"Daemon timed out waiting for adopter process to open file %@", v6, v26, v27, v28, v29);
      uint64_t v18 = (void *)v40[5];
      v40[5] = v17;

      if (a4) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v22 = (void *)v34[5];
      if (v22)
      {
        id v19 = v22;
        goto LABEL_14;
      }
      if (!v40[5])
      {
        uint64_t v23 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v16, *MEMORY[0x1E4F19DD8], 1000, @"Adopter failed to open file %@", v6, v26, v27, v28, v29);
        id v24 = (void *)v40[5];
        v40[5] = v23;
      }
      if (a4)
      {
LABEL_4:
        id v19 = 0;
        *a4 = (id) v40[5];
LABEL_14:

        goto LABEL_15;
      }
    }
    id v19 = 0;
    goto LABEL_14;
  }
  uint64_t v20 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v9, *MEMORY[0x1E4F19DD8], 1000, @"nil clientOperationCallbackProxy");
  uint64_t v21 = (void *)v40[5];
  v40[5] = v20;

  id v19 = 0;
  if (a4) {
    *a4 = (id) v40[5];
  }
LABEL_15:

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v19;
}

- (BOOL)finishWithAssetDownloadStagingInfo:(id)a3 fileURL:(id *)a4 fileHandle:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v47 = 0;
  __int16 v48 = &v47;
  uint64_t v49 = 0x3032000000;
  __int16 v50 = sub_1C4D8E61C;
  BOOL v51 = sub_1C4D8E62C;
  id v52 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = sub_1C4D8E61C;
  char v45 = sub_1C4D8E62C;
  id v46 = 0;
  uint64_t v35 = 0;
  char v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = sub_1C4D8E61C;
  uint64_t v39 = sub_1C4D8E62C;
  id v40 = 0;
  uint64_t v14 = objc_msgSend_clientOperationCallbackProxy(self, v11, v12);
  if (v14)
  {
    dispatch_time_t v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    uint64_t v16 = (void *)MEMORY[0x1C8789E70]();
    voucher_copy_without_importance();
    voucher_adopt();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1C4D8EA80;
    v30[3] = &unk_1E64F1E30;
    uint64_t v32 = &v41;
    uint64_t v33 = &v35;
    uint64_t v34 = &v47;
    uint64_t v17 = v15;
    long long v31 = v17;
    objc_msgSend_handleFinishWithAssetDownloadStagingInfo_reply_(v14, v18, (uint64_t)v10, v30);

    dispatch_time_t v19 = dispatch_time(0, 150000000000);
    if (dispatch_group_wait(v17, v19))
    {
      uint64_t v21 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v20, *MEMORY[0x1E4F19DD8], 1000, @"Daemon timed out waiting for adopter process to finish file %@", v10);
      uint64_t v22 = (void *)v48[5];
      v48[5] = v21;

      if (a6)
      {
LABEL_4:
        BOOL v23 = 0;
        *a6 = (id) v48[5];
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v26 = (void *)v42[5];
      if (v26)
      {
        if (a4) {
          *a4 = v26;
        }
        if (a5) {
          *a5 = (id) v36[5];
        }
        BOOL v23 = v42[5] != 0;
        goto LABEL_18;
      }
      if (!v48[5])
      {
        uint64_t v27 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v20, *MEMORY[0x1E4F19DD8], 1000, @"Adopter failed to finish file %@", v10);
        uint64_t v28 = (void *)v48[5];
        v48[5] = v27;
      }
      if (a6) {
        goto LABEL_4;
      }
    }
    BOOL v23 = 0;
    goto LABEL_18;
  }
  uint64_t v24 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v13, *MEMORY[0x1E4F19DD8], 1000, @"nil clientOperationCallbackProxy");
  uint64_t v25 = (void *)v48[5];
  v48[5] = v24;

  BOOL v23 = 0;
  if (a6) {
    *a6 = (id) v48[5];
  }
LABEL_19:

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v23;
}

- (CKDURLRequest)request
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_request;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRequest:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (CKDOperation *)a3;
  id v6 = self;
  objc_sync_enter(v6);
  if (objc_msgSend_isEqual_(v5, v7, (uint64_t)v6->_request))
  {
    objc_sync_exit(v6);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = (id)*MEMORY[0x1E4F1A520];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(v6, v14, v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(v6->_request, v17, v18);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(v5, v20, v21);
      uint64_t v22 = (CKDOperation *)objc_claimAutoreleasedReturnValue();
      int v46 = 138544386;
      id v47 = v13;
      __int16 v48 = 2048;
      uint64_t v49 = v6;
      __int16 v50 = 2114;
      id v51 = v16;
      __int16 v52 = 2114;
      id v53 = v19;
      __int16 v54 = 2114;
      uint64_t v55 = v22;
      _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEFAULT, "Operation <%{public}@: %p; %{public}@>, setting current request from %{public}@ to %{public}@",
        (uint8_t *)&v46,
        0x34u);
    }
    objc_storeStrong((id *)&v6->_request, a3);
    objc_sync_exit(v6);

    if (v5)
    {
      objc_msgSend_configureRequest_(v6, v8, (uint64_t)v5);
      if (*v10 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      BOOL v23 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = v23;
        char v36 = (objc_class *)objc_opt_class();
        uint64_t v37 = NSStringFromClass(v36);
        id v40 = objc_msgSend_ckShortDescription(v5, v38, v39);
        uint64_t v41 = (objc_class *)objc_opt_class();
        uint64_t v42 = NSStringFromClass(v41);
        char v45 = objc_msgSend_ckShortDescription(v6, v43, v44);
        int v46 = 138544642;
        id v47 = v37;
        __int16 v48 = 2048;
        uint64_t v49 = v5;
        __int16 v50 = 2114;
        id v51 = v40;
        __int16 v52 = 2114;
        id v53 = v42;
        __int16 v54 = 2048;
        uint64_t v55 = v6;
        __int16 v56 = 2114;
        uint64_t v57 = v45;
        _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Configured request <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@>",
          (uint8_t *)&v46,
          0x3Eu);
      }
    }
  }
  uint64_t v24 = objc_msgSend_additionalRequestHTTPHeaders(v6, v8, v9);
  objc_msgSend_setClientProvidedAdditionalHeaderValues_(v5, v25, (uint64_t)v24);

  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v28 = objc_msgSend_unitTestOverrides(v6, v26, v27);
    objc_msgSend_setUnitTestOverrides_(v5, v29, (uint64_t)v28);
  }
  if (objc_msgSend_isCancelled(v6, v26, v27))
  {
    uint64_t v32 = objc_msgSend_request(v6, v30, v31);
    objc_msgSend_cancel(v32, v33, v34);
  }
}

- (void)configureRequest:(id)a3
{
  id v15 = a3;
  id v6 = objc_msgSend_requestUUIDs(self, v4, v5);
  objc_sync_enter(v6);
  uint64_t v9 = objc_msgSend_requestUUIDs(self, v7, v8);
  uint64_t v12 = objc_msgSend_requestUUID(v15, v10, v11);
  objc_msgSend_addObject_(v9, v13, (uint64_t)v12);

  objc_sync_exit(v6);
  objc_msgSend_updateCloudKitMetrics_(self, v14, (uint64_t)&unk_1F2042C90);
}

- (void)request:(id)a3 didFinishWithMetrics:(id)a4 w3cNavigationTiming:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v15 = objc_msgSend_requestUUID(v8, v11, v12);
  if (v9)
  {
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = sub_1C4D8F5E4;
    v127[3] = &unk_1E64F1E78;
    id v128 = v9;
    id v129 = v15;
    id v130 = v8;
    objc_msgSend_updateCloudKitMetrics_(self, v16, (uint64_t)v127);
  }
  uint64_t v17 = objc_msgSend_requestCompletedBlock(self, v13, v14);

  uint64_t v20 = (unsigned char *)MEMORY[0x1E4F1A4E0];
  if (v17)
  {
    uint64_t v21 = objc_msgSend_responseHeaders(v8, v18, v19);
    uint64_t v24 = objc_msgSend_container(self, v22, v23);
    uint64_t v27 = objc_msgSend_options(v24, v25, v26);
    char v30 = objc_msgSend_captureResponseHTTPHeaders(v27, v28, v29);

    id v126 = v9;
    if ((v30 & 1) == 0)
    {

      uint64_t v21 = 0;
    }
    id v31 = objc_alloc(MEMORY[0x1E4F1A350]);
    uint64_t v32 = v15;
    uint64_t v33 = (uint64_t)v15;
    id v34 = v10;
    char v36 = objc_msgSend_initWithRequestUUID_responseHTTPHeaders_w3cTiming_(v31, v35, v33, v21, v10);
    uint64_t v37 = (objc_class *)objc_opt_class();
    id v38 = NSStringFromClass(v37);
    objc_msgSend_setOperationClassName_(v36, v39, (uint64_t)v38);

    uint64_t v42 = v20;
    if (*v20)
    {
      uint64_t v43 = objc_msgSend_container(self, v40, v41);
      int v46 = objc_msgSend_options(v43, v44, v45);
      int v49 = objc_msgSend_returnRequestOperationProto(v46, v47, v48);

      if (v49)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v52 = objc_msgSend_requestOperations(v8, v50, v51);
          objc_msgSend_setRequestOperations_(v36, v53, (uint64_t)v52);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v54 = objc_msgSend_requestOperations(v8, v40, v41);
          objc_msgSend_setRequestOperations_(v36, v55, (uint64_t)v54);
        }
      }
    }
    objc_msgSend_requestCompletedBlock(self, v40, v41);
    __int16 v56 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v56)[2](v56, v36);

    uint64_t v20 = v42;
    id v10 = v34;
    id v15 = v32;
    id v9 = v126;
  }
  uint64_t v57 = objc_msgSend_error(v8, v18, v19);
  uint64_t v60 = v57;
  if (v57)
  {
    uint64_t v61 = objc_msgSend_domain(v57, v58, v59);
    if (objc_msgSend_isEqualToString_(v61, v62, *MEMORY[0x1E4F19DD8]))
    {
    }
    else
    {
      id v67 = objc_msgSend_domain(v60, v63, v64);
      int isEqualToString = objc_msgSend_isEqualToString_(v67, v68, *MEMORY[0x1E4F19C40]);

      if (!isEqualToString) {
        goto LABEL_33;
      }
    }
    id v72 = objc_msgSend_userInfo(v60, v65, v66);
    if (!*v20
      || (objc_msgSend_unitTestOverrides(self, v70, v71),
          uint64_t v73 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectForKeyedSubscript_(v73, v74, @"AllowThrottling"),
          uint64_t v75 = objc_claimAutoreleasedReturnValue(),
          int v78 = objc_msgSend_BOOLValue(v75, v76, v77),
          v75,
          v73,
          v78))
    {
      __int16 v79 = objc_msgSend_objectForKey_(v72, v70, *MEMORY[0x1E4F19DE0]);
      uint64_t v82 = objc_msgSend_integerValue(v79, v80, v81);

      if (v82 == 503 || v82 == 429)
      {
        id v85 = objc_msgSend_deviceContext(self, v83, v84);
        id v88 = objc_msgSend_throttleManager(v85, v86, v87);

        uint64_t v90 = objc_msgSend_enforcedThrottleForCriteria_willSendRequest_outThrottleError_(v88, v89, (uint64_t)self, 0, 0);

        if (!v90)
        {
          uint64_t v92 = objc_msgSend_objectForKeyedSubscript_(v72, v91, *MEMORY[0x1E4F19C60]);
          v125 = v92;
          if (v92)
          {
            uint64_t v95 = objc_msgSend_unsignedLongValue(v92, v93, v94);
          }
          else
          {
            v96 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v93, v94);
            uint64_t v123 = (int)objc_msgSend_defaultRetryAfter(v96, v97, v98);

            uint64_t v95 = v123;
          }
          if (v95 >= 1)
          {
            uint64_t v124 = v95;
            id v121 = objc_alloc_init(MEMORY[0x1E4F1A460]);
            int v101 = objc_msgSend_containerID(self, v99, v100);
            v119 = objc_msgSend_containerIdentifier(v101, v102, v103);

            uint64_t v120 = objc_msgSend_operationType(self, v104, v105);
            uint64_t v122 = objc_msgSend_stringWithFormat_(NSString, v106, @"Device throttle: container=%@, type=%d", v119, v120);
            objc_msgSend_setLabel_(v121, v107, (uint64_t)v122);
            objc_msgSend_setContainerIdentifier_(v121, v108, (uint64_t)v119);
            __int16 v110 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v109, v120);
            objc_msgSend_setOperationType_(v121, v111, (uint64_t)v110);

            uint64_t v114 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v112, v113, (double)v124);
            objc_msgSend_setExpirationDate_(v121, v115, (uint64_t)v114);

            if (v82 == 503) {
              uint64_t v117 = &unk_1F20AC5B8;
            }
            else {
              uint64_t v117 = &unk_1F20AC5D0;
            }
            objc_msgSend_setErrorCode_(v121, v116, (uint64_t)v117);
            objc_msgSend_addThrottle_(v88, v118, (uint64_t)v121);
          }
        }
      }
    }
  }
LABEL_33:
}

- (CKOperationMetrics)operationMetrics
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = objc_alloc(MEMORY[0x1E4F1A170]);
  uint64_t v5 = objc_msgSend_initWithMMCSOperationMetric_(v3, v4, (uint64_t)self->_cloudKitMetrics);
  if (self->_MMCSMetrics)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1A170]);
    id v8 = objc_msgSend_initWithMMCSOperationMetric_(v6, v7, (uint64_t)self->_MMCSMetrics);
  }
  else
  {
    id v8 = 0;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1A238]);
  uint64_t v11 = objc_msgSend_initWithCloudKitMetrics_MMCSMetrics_(v9, v10, (uint64_t)v5, v8);
  os_unfair_recursive_lock_unlock();

  return (CKOperationMetrics *)v11;
}

- (void)updateCloudKitMetrics:(id)a3
{
  id v4 = (void (**)(id, CKDOperationMetrics *))a3;
  os_unfair_recursive_lock_lock_with_options();
  v4[2](v4, self->_cloudKitMetrics);

  os_unfair_recursive_lock_unlock();
}

- (void)updateMMCSMetrics:(id)a3
{
  uint64_t v7 = (void (**)(id, CKDOperationMetrics *))a3;
  os_unfair_recursive_lock_lock_with_options();
  MMCSMetrics = self->_MMCSMetrics;
  if (!MMCSMetrics)
  {
    uint64_t v5 = (CKDOperationMetrics *)objc_opt_new();
    id v6 = self->_MMCSMetrics;
    self->_MMCSMetrics = v5;

    MMCSMetrics = self->_MMCSMetrics;
  }
  v7[2](v7, MMCSMetrics);
  os_unfair_recursive_lock_unlock();
}

- (id)_startDateString
{
  if (qword_1EBBCDF70 != -1) {
    dispatch_once(&qword_1EBBCDF70, &unk_1F2042CB0);
  }
  uint64_t v3 = *MEMORY[0x1E4F1A678];
  objc_msgSend_objectForKey_((void *)qword_1EBBCDF68, a2, *MEMORY[0x1E4F1A678]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    objc_msgSend_setTimeStyle_(v6, v7, 3);
    objc_msgSend_setDateStyle_(v6, v8, 1);
    objc_msgSend_setObject_forKey_((void *)qword_1EBBCDF68, v9, (uint64_t)v6, v3);
  }
  id v10 = objc_msgSend_startDate(self, v4, v5);

  if (v10)
  {
    id v13 = objc_msgSend_startDate(self, v11, v12);
    objc_msgSend_stringFromDate_(v6, v14, (uint64_t)v13);
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = @"(unknown)";
  }

  return v15;
}

- (id)CKStatusReportProperties
{
  id v4 = objc_msgSend_parentOperation(self, a2, v2);
  uint64_t v7 = objc_msgSend_container(self, v5, v6);
  id v8 = objc_opt_new();
  unint64_t v11 = objc_msgSend_state(self, v9, v10);
  if (v11 >= 2)
  {
    uint64_t v14 = v11;
    id v15 = NSString;
    id v16 = objc_opt_class();
    uint64_t v18 = objc_msgSend_nameForState_(v16, v17, v14);
    uint64_t v20 = objc_msgSend_stringWithFormat_(v15, v19, @"state: %@", v18);
    objc_msgSend_addObject_(v8, v21, (uint64_t)v20);
  }
  if (v4)
  {
    uint64_t v22 = NSString;
    uint64_t v23 = objc_msgSend_operationID(v4, v12, v13);
    uint64_t v25 = objc_msgSend_stringWithFormat_(v22, v24, @"parent: %@", v23);
    objc_msgSend_addObject_(v8, v26, (uint64_t)v25);
  }
  if (v7)
  {
    uint64_t v27 = objc_msgSend_stringWithFormat_(NSString, v12, @"container: %p", v7);
    objc_msgSend_addObject_(v8, v28, (uint64_t)v27);
  }
  return v8;
}

- (id)CKStatusReportLogGroups
{
  return 0;
}

- (id)statusReportWithIndent:(unint64_t)a3
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v5 = CKTabIndentAtDepth();
  __int16 v159 = self;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v10 = objc_msgSend_operationID(self, v8, v9);
  uint64_t v12 = objc_msgSend_stringWithFormat_(v4, v11, @"%s<%@ %@ ", v5, v7, v10);

  id v15 = objc_msgSend__stateFlags(self, v13, v14);
  objc_msgSend_appendFormat_(v12, v16, @"%@", v15);

  objc_msgSend_qualityOfService(self, v17, v18);
  uint64_t v19 = CKStringForQOS();
  objc_msgSend_appendFormat_(v12, v20, @"QoS %@ ", v19);

  uint64_t v23 = objc_msgSend_startDate(self, v21, v22);
  objc_msgSend_timeIntervalSinceNow(v23, v24, v25);

  id v156 = CKDescriptionForTimeInterval();
  uint64_t v28 = objc_msgSend__startDateString(self, v26, v27);
  objc_msgSend_appendFormat_(v12, v29, @"running for %@ (started %@) ", v156, v28);

  v158 = objc_msgSend_CKStatusReportProperties(self, v30, v31);
  if (objc_msgSend_count(v158, v32, v33))
  {
    uint64_t v35 = objc_msgSend_componentsJoinedByString_(v158, v34, @", ");
    objc_msgSend_appendFormat_(v12, v36, @"%@ ", v35);
  }
  objc_msgSend_appendString_(v12, v34, @">\n");
  uint64_t v39 = objc_msgSend_childOperations(self, v37, v38);
  objc_sync_enter(v39);
  uint64_t v42 = objc_msgSend_childOperations(self, v40, v41);
  uint64_t v45 = objc_msgSend_copy(v42, v43, v44);

  objc_sync_exit(v39);
  if (objc_msgSend_count(v45, v46, v47))
  {
    uint64_t v50 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v51, @"%sRunning Child Operations: {\n", v50);
    long long v174 = 0u;
    long long v175 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    __int16 v52 = v45;
    id v53 = v45;
    uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v172, v178, 16);
    if (v56)
    {
      uint64_t v57 = *(void *)v173;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v173 != v57) {
            objc_enumerationMutation(v53);
          }
          uint64_t v59 = objc_msgSend_statusReportWithIndent_(*(void **)(*((void *)&v172 + 1) + 8 * i), v55, a3 + 1);
          objc_msgSend_appendFormat_(v12, v60, @"%@", v59);
        }
        uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v55, (uint64_t)&v172, v178, 16);
      }
      while (v56);
    }

    uint64_t v61 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v62, @"%s}\n", v61);
    uint64_t v45 = v52;
  }
  __int16 v155 = v45;
  __int16 v157 = objc_msgSend_request(v159, v48, v49);
  if (v157)
  {
    uint64_t v65 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v66, @"%sRequest: {\n", v65);
    uint64_t v68 = objc_msgSend_statusReportWithIndent_(v157, v67, a3 + 1);
    objc_msgSend_appendFormat_(v12, v69, @"%@", v68);

    uint64_t v70 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v71, @"%s}\n", v70);
  }
  uint64_t v162 = objc_msgSend_CKStatusReportLogGroups(v159, v63, v64);
  if (objc_msgSend_count(v162, v72, v73))
  {
    long long v170 = 0u;
    long long v171 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    objc_msgSend_allKeys(v162, v74, v75);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v76, (uint64_t)&v168, v177, 16);
    if (v78)
    {
      uint64_t v161 = *(void *)v169;
      do
      {
        for (uint64_t j = 0; j != v78; ++j)
        {
          if (*(void *)v169 != v161) {
            objc_enumerationMutation(obj);
          }
          uint64_t v80 = *(void *)(*((void *)&v168 + 1) + 8 * j);
          uint64_t v81 = objc_msgSend_objectForKeyedSubscript_(v162, v77, v80);
          uint64_t v82 = CKTabIndentAtDepth();
          objc_msgSend_appendFormat_(v12, v83, @"%s%@: {\n", v82, v80);
          long long v166 = 0u;
          long long v167 = 0u;
          long long v164 = 0u;
          long long v165 = 0u;
          id v84 = v81;
          uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v164, v176, 16);
          if (v86)
          {
            uint64_t v87 = *(void *)v165;
            do
            {
              for (uint64_t k = 0; k != v86; ++k)
              {
                if (*(void *)v165 != v87) {
                  objc_enumerationMutation(v84);
                }
                uint64_t v89 = *(void *)(*((void *)&v164 + 1) + 8 * k);
                uint64_t v90 = CKTabIndentAtDepth();
                objc_msgSend_appendFormat_(v12, v91, @"%s%@\n", v90, v89);
              }
              uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v92, (uint64_t)&v164, v176, 16);
            }
            while (v86);
          }

          uint64_t v93 = CKTabIndentAtDepth();
          objc_msgSend_appendFormat_(v12, v94, @"%s}\n", v93);
        }
        uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v77, (uint64_t)&v168, v177, 16);
      }
      while (v78);
    }
  }
  uint64_t v95 = objc_msgSend_requestUUIDs(v159, v74, v75);
  objc_sync_enter(v95);
  uint64_t v98 = objc_msgSend_requestUUIDs(v159, v96, v97);
  uint64_t v101 = objc_msgSend_count(v98, v99, v100);

  if (v101)
  {
    uint64_t v102 = CKTabIndentAtDepth();
    uint64_t v105 = objc_msgSend_requestUUIDs(v159, v103, v104);
    uint64_t v108 = objc_msgSend_count(v105, v106, v107);
    uint64_t v111 = objc_msgSend_requestUUIDs(v159, v109, v110);
    uint64_t v113 = objc_msgSend_componentsJoinedByString_(v111, v112, @", ");
    objc_msgSend_appendFormat_(v12, v114, @"%s%lu Previous Requests: [%@]\n", v102, v108, v113);
  }
  objc_sync_exit(v95);

  uint64_t v117 = objc_msgSend_finishedChildOperationIDs(v159, v115, v116);
  objc_sync_enter(v117);
  uint64_t v120 = objc_msgSend_finishedChildOperationIDs(v159, v118, v119);
  uint64_t v123 = objc_msgSend_count(v120, v121, v122);

  if (v123)
  {
    uint64_t v124 = CKTabIndentAtDepth();
    v127 = objc_msgSend_finishedChildOperationIDs(v159, v125, v126);
    uint64_t v130 = objc_msgSend_count(v127, v128, v129);
    __int16 v133 = objc_msgSend_finishedChildOperationIDs(v159, v131, v132);
    __int16 v135 = objc_msgSend_componentsJoinedByString_(v133, v134, @", ");
    objc_msgSend_appendFormat_(v12, v136, @"%s%lu Finished Child Operations: [%@]\n", v124, v130, v135);
  }
  objc_sync_exit(v117);

  os_unfair_recursive_lock_lock_with_options();
  uint64_t v137 = CKTabIndentAtDepth();
  objc_msgSend_appendFormat_(v12, v138, @"%sCloudKit metrics: {\n", v137);
  uint64_t v139 = CKTabIndentAtDepth();
  objc_msgSend_appendFormat_(v12, v140, @"%s%@\n", v139, v159->_cloudKitMetrics);
  uint64_t v141 = CKTabIndentAtDepth();
  objc_msgSend_appendFormat_(v12, v142, @"%s}\n", v141);
  if (v159->_MMCSMetrics)
  {
    uint64_t v143 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v144, @"%sMMCS metrics: {\n", v143);
    uint64_t v145 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v146, @"%s%@\n", v145, v159->_MMCSMetrics);
    uint64_t v147 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v148, @"%s}\n", v147);
  }
  os_unfair_recursive_lock_unlock();
  v151 = objc_msgSend_error(v159, v149, v150);
  if (v151)
  {
    uint64_t v152 = CKTabIndentAtDepth();
    objc_msgSend_appendFormat_(v12, v153, @"%sError: %@\n", v152, v151);
  }

  return v12;
}

- (BOOL)isNetworkingBehaviorEquivalentForOperation:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_operationInfo(self, v5, v6);
  int v10 = objc_msgSend_allowsCellularAccess(v7, v8, v9);
  uint64_t v13 = objc_msgSend_operationInfo(v4, v11, v12);
  int v16 = objc_msgSend_allowsCellularAccess(v13, v14, v15);

  if (v10 != v16) {
    goto LABEL_10;
  }
  uint64_t v19 = objc_msgSend_operationInfo(self, v17, v18);
  int v22 = objc_msgSend_allowsExpensiveNetworkAccess(v19, v20, v21);
  uint64_t v25 = objc_msgSend_operationInfo(v4, v23, v24);
  int v28 = objc_msgSend_allowsExpensiveNetworkAccess(v25, v26, v27);

  if (v22 != v28) {
    goto LABEL_10;
  }
  int v31 = objc_msgSend_usesBackgroundSession(self, v29, v30);
  if (v31 != objc_msgSend_usesBackgroundSession(v4, v32, v33)) {
    goto LABEL_10;
  }
  int v36 = objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(self, v34, v35);
  if (v36 != objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(v4, v37, v38)) {
    goto LABEL_10;
  }
  uint64_t v41 = objc_msgSend_resolvedDiscretionaryNetworkBehavior(self, v39, v40);
  if (v41 != objc_msgSend_resolvedDiscretionaryNetworkBehavior(v4, v42, v43)) {
    goto LABEL_10;
  }
  uint64_t v46 = objc_msgSend_duetPreClearedMode(self, v44, v45);
  if (v46 != objc_msgSend_duetPreClearedMode(v4, v47, v48)) {
    goto LABEL_10;
  }
  uint64_t v51 = objc_msgSend_applicationBundleIdentifierForNetworkAttribution(self, v49, v50);
  __int16 v54 = objc_msgSend_applicationBundleIdentifierForNetworkAttribution(v4, v52, v53);
  int v55 = CKObjectsAreBothNilOrEqual();

  if (!v55) {
    goto LABEL_10;
  }
  uint64_t v58 = objc_msgSend_sourceApplicationSecondaryIdentifier(self, v56, v57);
  uint64_t v61 = objc_msgSend_sourceApplicationSecondaryIdentifier(v4, v59, v60);
  int v62 = CKObjectsAreBothNilOrEqual();

  if (v62)
  {
    uint64_t v65 = objc_msgSend_privacyProxyFailClosedOverride(self, v63, v64);
    uint64_t v68 = objc_msgSend_privacyProxyFailClosedOverride(v4, v66, v67);
    char v69 = CKObjectsAreBothNilOrEqual();
  }
  else
  {
LABEL_10:
    char v69 = 0;
  }

  return v69;
}

- (void)sendCoreAnalyticsEventOperationFinished
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_didAttemptDugongKeyRoll(self, a2, v2))
  {
    uint64_t v6 = objc_msgSend_error(self, v4, v5);

    if (v6)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v7 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = v7;
        uint64_t v24 = objc_msgSend_operationID(self, v22, v23);
        int v25 = 138543618;
        uint64_t v26 = v24;
        __int16 v27 = 2114;
        uint64_t v28 = 0x1F2058370;
        _os_log_debug_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_DEBUG, "Operation %{public}@ sending CoreAnalytics event %{public}@", (uint8_t *)&v25, 0x16u);
      }
      int v10 = objc_msgSend_error(self, v8, v9);
      uint64_t v12 = objc_msgSend_dugongKeyRollAnalyticsPayloadWithError_(self, v11, (uint64_t)v10);

      AnalyticsSendEvent();
    }
  }
  if (objc_msgSend_isTopLevelDaemonOperation(self, v4, v5))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = v13;
      uint64_t v20 = objc_msgSend_operationID(self, v18, v19);
      int v25 = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2114;
      uint64_t v28 = 0x1F2058350;
      _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "Operation %{public}@ sending CoreAnalytics event %{public}@", (uint8_t *)&v25, 0x16u);
    }
    int v16 = objc_msgSend_analyticsPayload(self, v14, v15);
    AnalyticsSendEvent();
  }
}

- (id)baseOperationAndErrorInfoCoreAnalyticsPayloadWithError:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_container(self, v5, v6);
  int v10 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v8, v9);
  uint64_t v13 = objc_msgSend_containerID(v7, v11, v12);
  int v16 = objc_msgSend_containerIdentifier(v13, v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v17, (uint64_t)v16, 0x1F2047230);

  uint64_t v18 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v21 = objc_msgSend_containerID(v7, v19, v20);
  uint64_t v24 = objc_msgSend_environment(v21, v22, v23);
  uint64_t v26 = objc_msgSend_numberWithInteger_(v18, v25, v24);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v27, (uint64_t)v26, 0x1F2044FF0);

  uint64_t v30 = objc_msgSend_containerID(v7, v28, v29);
  objc_msgSend_environment(v30, v31, v32);
  uint64_t v33 = CKContainerEnvironmentString();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v34, (uint64_t)v33, 0x1F2058390);

  uint64_t v35 = (objc_class *)objc_opt_class();
  int v36 = NSStringFromClass(v35);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v37, (uint64_t)v36, 0x1F20583B0);

  uint64_t v38 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v41 = objc_msgSend_qualityOfService(self, v39, v40);
  uint64_t v43 = objc_msgSend_numberWithInteger_(v38, v42, v41);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v44, (uint64_t)v43, 0x1F20583D0);

  objc_msgSend_qualityOfService(self, v45, v46);
  uint64_t v47 = CKStringForQOS();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v48, (uint64_t)v47, 0x1F20583F0);

  uint64_t v51 = objc_msgSend_applicationBundleID(v7, v49, v50);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v52, (uint64_t)v51, 0x1F2058410);

  int v55 = objc_msgSend_operationInfo(self, v53, v54);
  uint64_t v58 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v55, v56, v57);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v59, (uint64_t)v58, 0x1F20478B0);

  int v62 = objc_msgSend_operationInfo(self, v60, v61);
  uint64_t v65 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v62, v63, v64);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v66, (uint64_t)v65, 0x1F20478D0);

  char v69 = objc_msgSend_operationGroupQuantityNumber(self, v67, v68);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v70, (uint64_t)v69, 0x1F20509F0);

  uint64_t v73 = objc_msgSend_operationGroupName(self, v71, v72);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v74, (uint64_t)v73, 0x1F20477F0);

  uint64_t v77 = objc_msgSend_operationInfo(self, v75, v76);
  uint64_t v80 = objc_msgSend_requestOriginator(v77, v78, v79);
  if ((unint64_t)(v80 - 1) > 4) {
    uint64_t v81 = @"unknown";
  }
  else {
    uint64_t v81 = (__CFString *)*((void *)&off_1E64F1E98 + v80 - 1);
  }

  objc_msgSend_setObject_forKeyedSubscript_(v10, v82, (uint64_t)v81, 0x1F2050AF0);
  if (v4)
  {
    id v85 = objc_msgSend_CKClientSuitableError(v4, v83, v84);
    uint64_t v86 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v89 = objc_msgSend_code(v85, v87, v88);
    uint64_t v91 = objc_msgSend_numberWithInteger_(v86, v90, v89);
    objc_msgSend_setObject_forKeyedSubscript_(v10, v92, (uint64_t)v91, 0x1F2058430);

    uint64_t v93 = CKErrorChainStringFromError();
    objc_msgSend_setObject_forKeyedSubscript_(v10, v94, (uint64_t)v93, 0x1F2058450);

    uint64_t v98 = objc_msgSend_CKStringForWellKnownCKErrors(v85, v95, v96);
    if (v98) {
      objc_msgSend_setObject_forKeyedSubscript_(v10, v97, (uint64_t)v98, 0x1F2058470);
    }
  }
  return v10;
}

- (id)dugongKeyRollAnalyticsPayloadWithError:(id)a3
{
  id v4 = a3;
  uint64_t v7 = v4;
  if (v4)
  {
    id v8 = v4;
  }
  else
  {
    objc_msgSend_error(self, v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v10 = v8;
  unint64_t v11 = objc_msgSend_baseOperationAndErrorInfoCoreAnalyticsPayloadWithError_(self, v9, (uint64_t)v8);

  return v11;
}

- (id)analyticsPayload
{
  id v4 = objc_msgSend_error(self, a2, v2);
  uint64_t v6 = objc_msgSend_baseOperationAndErrorInfoCoreAnalyticsPayloadWithError_(self, v5, (uint64_t)v4);

  os_unfair_recursive_lock_lock_with_options();
  uint64_t v7 = (void *)MEMORY[0x1E4F28ED0];
  objc_msgSend_duration(self->_cloudKitMetrics, v8, v9);
  uint64_t v12 = objc_msgSend_numberWithDouble_(v7, v10, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v13, (uint64_t)v12, 0x1F20542F0);

  uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
  objc_msgSend_queueing(self->_cloudKitMetrics, v15, v16);
  uint64_t v19 = objc_msgSend_numberWithDouble_(v14, v17, v18);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v20, (uint64_t)v19, 0x1F2058490);

  uint64_t v21 = (void *)MEMORY[0x1E4F28ED0];
  objc_msgSend_executing(self->_cloudKitMetrics, v22, v23);
  uint64_t v26 = objc_msgSend_numberWithDouble_(v21, v24, v25);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v27, (uint64_t)v26, 0x1F20584B0);

  uint64_t v28 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v31 = objc_msgSend_bytesUploaded(self->_cloudKitMetrics, v29, v30);
  uint64_t v33 = objc_msgSend_numberWithUnsignedInteger_(v28, v32, v31);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v34, (uint64_t)v33, 0x1F2054310);

  uint64_t v35 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v38 = objc_msgSend_bytesDownloaded(self->_cloudKitMetrics, v36, v37);
  uint64_t v40 = objc_msgSend_numberWithUnsignedInteger_(v35, v39, v38);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v41, (uint64_t)v40, 0x1F2054330);

  uint64_t v42 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v45 = objc_msgSend_connections(self->_cloudKitMetrics, v43, v44);
  uint64_t v47 = objc_msgSend_numberWithUnsignedInteger_(v42, v46, v45);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v48, (uint64_t)v47, 0x1F2054350);

  uint64_t v49 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v52 = objc_msgSend_connectionsCreated(self->_cloudKitMetrics, v50, v51);
  uint64_t v54 = objc_msgSend_numberWithUnsignedInteger_(v49, v53, v52);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v55, (uint64_t)v54, 0x1F2054370);

  MMCSMetrics = self->_MMCSMetrics;
  if (MMCSMetrics)
  {
    uint64_t v59 = (void *)MEMORY[0x1E4F28ED0];
    objc_msgSend_duration(MMCSMetrics, v56, v57);
    int v62 = objc_msgSend_numberWithDouble_(v59, v60, v61);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v63, (uint64_t)v62, 0x1F20544D0);

    uint64_t v64 = (void *)MEMORY[0x1E4F28ED0];
    objc_msgSend_queueing(self->_MMCSMetrics, v65, v66);
    char v69 = objc_msgSend_numberWithDouble_(v64, v67, v68);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v70, (uint64_t)v69, 0x1F20584D0);

    uint64_t v71 = (void *)MEMORY[0x1E4F28ED0];
    objc_msgSend_executing(self->_MMCSMetrics, v72, v73);
    uint64_t v76 = objc_msgSend_numberWithDouble_(v71, v74, v75);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v77, (uint64_t)v76, 0x1F20584F0);

    uint64_t v78 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v81 = objc_msgSend_bytesUploaded(self->_MMCSMetrics, v79, v80);
    id v83 = objc_msgSend_numberWithUnsignedInteger_(v78, v82, v81);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v84, (uint64_t)v83, 0x1F20544F0);

    id v85 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v88 = objc_msgSend_bytesDownloaded(self->_MMCSMetrics, v86, v87);
    uint64_t v90 = objc_msgSend_numberWithUnsignedInteger_(v85, v89, v88);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v91, (uint64_t)v90, 0x1F2054510);

    uint64_t v92 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v95 = objc_msgSend_connections(self->_MMCSMetrics, v93, v94);
    uint64_t v97 = objc_msgSend_numberWithUnsignedInteger_(v92, v96, v95);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v98, (uint64_t)v97, 0x1F2054530);

    v99 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v102 = objc_msgSend_connectionsCreated(self->_MMCSMetrics, v100, v101);
    uint64_t v104 = objc_msgSend_numberWithUnsignedInteger_(v99, v103, v102);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v105, (uint64_t)v104, 0x1F2054550);
  }
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (int)operationType
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
  {
    uint64_t v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    int v9 = 138543618;
    int v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_fault_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_FAULT, "Operation class %{public}@ does not implement %{public}@", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

- (BOOL)isOperationType:(int)a3
{
  return objc_msgSend_operationType(self, a2, *(uint64_t *)&a3) == a3;
}

- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4
{
  uint64_t hasValidatedEntitlements = objc_msgSend_hasValidatedEntitlements(a3, a2, (uint64_t)a3, a4);
  id v8 = objc_msgSend_operationInfo(self, v6, v7);
  objc_msgSend_setClientHasValidatedEntitlements_(v8, v9, hasValidatedEntitlements);

  return 1;
}

- (void)pushStatisticsTo:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend_addOperation_cloudKitMetrics_MMCSMetrics_(v4, v5, (uint64_t)self, self->_cloudKitMetrics, self->_MMCSMetrics);

  os_unfair_recursive_lock_unlock();
}

- (id)zoneIDsUsed
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = objc_msgSend_relevantZoneIDs(self, v3, v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (CKDContainer)container
{
  return (CKDContainer *)objc_getProperty(self, a2, 336, 1);
}

- (BOOL)useEncryption
{
  return self->_useEncryption;
}

- (void)setUseEncryption:(BOOL)a3
{
  self->_useEncryption = a3;
}

- (BOOL)useClearAssetEncryption
{
  return self->_useClearAssetEncryption;
}

- (void)setUseClearAssetEncryption:(BOOL)a3
{
  self->_useClearAssetEncryption = a3;
}

- (BOOL)isLongLivedCallbackRelayOperation
{
  return self->_isLongLivedCallbackRelayOperation;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 352, 1);
}

- (void)setError:(id)a3
{
}

- (id)requestCompletedBlock
{
  return self->_requestCompletedBlock;
}

- (void)setRequestCompletedBlock:(id)a3
{
}

- (CKOperationInfo)operationInfo
{
  return self->_operationInfo;
}

- (OS_dispatch_group)stateTransitionGroup
{
  return self->_stateTransitionGroup;
}

- (void)setStateTransitionGroup:(id)a3
{
}

- (NSMutableArray)requestUUIDs
{
  return self->_requestUUIDs;
}

- (NSMutableArray)childOperations
{
  return self->_childOperations;
}

- (NSMutableArray)finishedChildOperationIDs
{
  return self->_finishedChildOperationIDs;
}

- (OS_dispatch_group)childOperationsGroup
{
  return self->_childOperationsGroup;
}

- (void)setChildOperationsGroup:(id)a3
{
}

- (UMUserSyncTask)userSyncTask
{
  return self->_userSyncTask;
}

- (void)setUserSyncTask:(id)a3
{
}

- (int)pcsWaitCount
{
  return atomic_load((unsigned int *)&self->_pcsWaitCount);
}

- (void)setPcsWaitCount:(int)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (CKSignpost)signpost
{
  return self->_signpost;
}

- (BOOL)endContainerAccess
{
  return self->_endContainerAccess;
}

- (void)setEndContainerAccess:(BOOL)a3
{
  self->_endContainerAccess = a3;
}

- (NSDate)metricExecuteStartDate
{
  return self->_metricExecuteStartDate;
}

- (void)setMetricExecuteStartDate:(id)a3
{
}

- (BOOL)didAttemptDugongKeyRoll
{
  return self->_didAttemptDugongKeyRoll;
}

- (void)setDidAttemptDugongKeyRoll:(BOOL)a3
{
  self->_didAttemptDugongKeyRoll = a3;
}

- (BOOL)skipSettingUnitTestOverrides
{
  return self->_skipSettingUnitTestOverrides;
}

- (void)setSkipSettingUnitTestOverrides:(BOOL)a3
{
  self->_skipSettingUnitTestOverrides = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricExecuteStartDate, 0);
  objc_storeStrong((id *)&self->_signpost, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_userSyncTask, 0);
  objc_storeStrong((id *)&self->_childOperationsGroup, 0);
  objc_storeStrong((id *)&self->_finishedChildOperationIDs, 0);
  objc_storeStrong((id *)&self->_childOperations, 0);
  objc_storeStrong((id *)&self->_requestUUIDs, 0);
  objc_storeStrong((id *)&self->_stateTransitionGroup, 0);
  objc_storeStrong((id *)&self->_operationInfo, 0);
  objc_storeStrong(&self->_requestCompletedBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_destroyWeak((id *)&self->_parentOperation);
  objc_storeStrong((id *)&self->_clientOperationCallbackProxy, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_storeStrong((id *)&self->_MMCSMetrics, 0);
  objc_storeStrong((id *)&self->_cloudKitMetrics, 0);
}

@end