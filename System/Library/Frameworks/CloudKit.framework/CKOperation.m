@interface CKOperation
+ (BOOL)_wireUpAssetContentForOperation:(id)a3 inRecord:(id)a4 checkSignatures:(BOOL)a5 outError:(id *)a6;
+ (Class)operationClass;
+ (Class)operationInfoClass;
+ (NSString)operationIDPrefix;
+ (SEL)daemonCallbackCompletionSelector;
+ (SEL)daemonInvocationSelector;
+ (id)assetInfoForOperation:(id)a3 recordID:(id)a4 recordKey:(id)a5 arrayIndex:(int64_t)a6;
+ (id)operationDaemonCallbackProtocol;
+ (id)requestOriginatorStringRepresentation:(unint64_t)a3;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
+ (void)setOperationIDPrefix:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)_BOOLForUnitTestOverride:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)_ckRaiseInGeneratedCallbackImplementation;
- (BOOL)allowsCellularAccess;
- (BOOL)canDropItemResultsEarly;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isFinishingOnCallbackQueue;
- (BOOL)isLongLived;
- (BOOL)isOutstandingOperation;
- (BOOL)preferAnonymousRequests;
- (BOOL)queueHasStarted;
- (BOOL)transitionToExecuting;
- (BOOL)transitionToFinished;
- (BOOL)usesBackgroundSession;
- (CKContainer)container;
- (CKEventMetric)operationMetric;
- (CKLogicalDeviceContext)deviceContext;
- (CKOperation)init;
- (CKOperationCallbackProxy)clientOperationCallbackProxy;
- (CKOperationConfiguration)configuration;
- (CKOperationConfiguration)convenienceOperationConfiguration;
- (CKOperationConfiguration)resolvedConfiguration;
- (CKOperationGroup)convenienceOperationGroup;
- (CKOperationGroup)group;
- (CKOperationID)operationID;
- (CKOperationInfo)operationInfo;
- (CKOperationMMCSRequestOptions)MMCSRequestOptions;
- (CKOperationMetrics)metrics;
- (CKTestResultOverlayBox)appliedOverlayProtocol;
- (NSDictionary)additionalRequestHTTPHeaders;
- (NSError)error;
- (NSMutableDictionary)lifecycleCallbacks;
- (NSString)description;
- (NSTimeInterval)timeoutIntervalForRequest;
- (NSTimeInterval)timeoutIntervalForResource;
- (OS_dispatch_queue)callbackQueue;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)CKShortDescriptionRedact:(BOOL)a3;
- (id)_createPlaceholderOperation;
- (id)activityCreate;
- (id)applicationBundleIdentifierForContainerAccess;
- (id)ckShortDescription;
- (id)containerID;
- (id)operationGroupName;
- (id)requestCompletedBlock;
- (id)resolvedConfigurationIfNotNil;
- (id)unitTestOverrides;
- (id)zoneIDsToZoneNamesString:(id)a3;
- (int64_t)qualityOfService;
- (void)_adoptPersonaIfNecessary;
- (void)_cancelDaemonOperation;
- (void)_finishDiscretionaryOperation;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleBGSystemTaskExpiration:(id)a3;
- (void)_handleRemoteProxyFailureWithError:(id)a3;
- (void)_performErrorRateMitigation;
- (void)addUnitTestOverrides:(id)a3;
- (void)applyConvenienceConfiguration:(id)a3;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)cancelWithUnderlyingError:(id)a3;
- (void)cancelWithUnderlyingError:(id)a3 message:(id)a4;
- (void)configureConvenience:(id)a3;
- (void)dealloc;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)finishWithError:(id)a3;
- (void)handleDaemonOperationWillStartWithClassName:(id)a3 isTopLevelDaemonOperation:(BOOL)a4 replyBlock:(id)a5;
- (void)handleDaemonRequestWillReceiveWithClassName:(id)a3 testRequestProperties:(id)a4 replyBlock:(id)a5;
- (void)handleDaemonRequestWillSendWithClassName:(id)a3 testRequestProperties:(id)a4 replyBlock:(id)a5;
- (void)handleDidStart:(id)a3;
- (void)handleDiscretionaryOperationShouldStart:(BOOL)a3 nonDiscretionary:(BOOL)a4 error:(id)a5;
- (void)handleDiscretionaryOperationShouldSuspend;
- (void)handleFinishWithAssetDownloadStagingInfo:(id)a3 reply:(id)a4;
- (void)handleLongLivedOperationDidPersist;
- (void)handleOperationDidCompleteWithMetrics:(id)a3 error:(id)a4;
- (void)handleRequestDidComplete:(id)a3;
- (void)handleSystemDidImposeInfo:(id)a3;
- (void)handleWillStart:(id)a3;
- (void)longLivedOperationWasPersistedBlock;
- (void)main;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openFileWithOpenInfo:(id)a3 reply:(id)a4;
- (void)performCKOperation;
- (void)setAdditionalRequestHTTPHeaders:(id)a3;
- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess;
- (void)setAppliedOverlayProtocol:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCanDropItemResultsEarly:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setConfiguration:(CKOperationConfiguration *)configuration;
- (void)setContainer:(CKContainer *)container;
- (void)setConvenienceOperationConfiguration:(id)a3;
- (void)setConvenienceOperationGroup:(id)a3;
- (void)setError:(id)a3;
- (void)setGroup:(CKOperationGroup *)group;
- (void)setIsFinished:(BOOL)a3;
- (void)setIsOutstandingOperation:(BOOL)a3;
- (void)setLifecycleCallbacks:(id)a3;
- (void)setLongLived:(BOOL)longLived;
- (void)setLongLivedOperationWasPersistedBlock:(void *)longLivedOperationWasPersistedBlock;
- (void)setMMCSRequestOptions:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setOperationID:(id)a3;
- (void)setPreferAnonymousRequests:(BOOL)a3;
- (void)setQoSFromSwiftTaskPriority;
- (void)setQualityOfService:(int64_t)a3;
- (void)setQueueHasStarted:(BOOL)a3;
- (void)setRequestCompletedBlock:(id)a3;
- (void)setTimeoutIntervalForRequest:(NSTimeInterval)timeoutIntervalForRequest;
- (void)setTimeoutIntervalForResource:(NSTimeInterval)timeoutIntervalForResource;
- (void)setUsesBackgroundSession:(BOOL)a3;
- (void)set_ckRaiseInGeneratedCallbackImplementation:(BOOL)a3;
- (void)setupBGSystemTaskExpirationHandler;
- (void)start;
- (void)validateXPCActivityCriteria:(id)a3;
- (void)withContainerScopedDaemon:(id)a3;
@end

@implementation CKOperation

- (void)setQoSFromSwiftTaskPriority
{
  v2 = self;
  sub_18B000FA0();
}

- (CKOperation)init
{
  uint64_t v4 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(self, v5, v4, v6))
  {
    v53 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v53, v54, (uint64_t)a2, (uint64_t)self, @"CKOperation.m", 207, @"You must use a concrete subclass of CKOperation");
  }
  uint64_t v10 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(self, v11, v10, v12))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v13 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AF10000, v13, OS_LOG_TYPE_FAULT, "You must use a concrete subclass of CKDatabaseOperation. This will be a hard error in the future", buf, 2u);
    }
  }
  v55.receiver = self;
  v55.super_class = (Class)CKOperation;
  v14 = [(CKOperation *)&v55 init];
  if (v14)
  {
    if (__sTestOverridesAvailable
      && (v15 = objc_opt_class(),
          objc_msgSend_operationIDPrefix(v15, v16, v17, v18),
          v19 = objc_claimAutoreleasedReturnValue(),
          v19,
          v19))
    {
      id v20 = [NSString alloc];
      v21 = objc_opt_class();
      v25 = objc_msgSend_operationIDPrefix(v21, v22, v23, v24);
      v26 = CKShortRandomID();
      uint64_t v29 = objc_msgSend_initWithFormat_(v20, v27, @"%@-%@", v28, v25, v26);
      operationID = v14->_operationID;
      v14->_operationID = (NSString *)v29;
    }
    else
    {
      uint64_t v31 = CKShortRandomID();
      v25 = v14->_operationID;
      v14->_operationID = (NSString *)v31;
    }

    v32 = objc_opt_new();
    objc_msgSend_setConfiguration_(v14, v33, (uint64_t)v32, v34);

    v35 = [CKSignpost alloc];
    uint64_t v38 = objc_msgSend_initWithLog_(v35, v36, ck_log_facility_op, v37);
    signpost = v14->_signpost;
    v14->_signpost = (CKSignpost *)v38;

    v40 = [CKEventMetric alloc];
    v43 = (CKEventMetric *)objc_msgSend_initWithEventName_(v40, v41, @"CKOperationDuration", v42);
    objc_msgSend_setIsCKInternalMetric_(v43, v44, 1, v45);
    operationMetric = v14->_operationMetric;
    v14->_operationMetric = v43;
    v47 = v43;

    v14->_duetPreClearedMode = 0;
    v14->_discretionaryWhenBackgroundedState = 0;
    v14->_systemScheduler = 0;
    uint64_t v48 = objc_opt_new();
    lifecycleCallbacks = v14->_lifecycleCallbacks;
    v14->_lifecycleCallbacks = (NSMutableDictionary *)v48;

    objc_msgSend_setCompletionBlock_(v14, v50, 0, v51);
  }
  return v14;
}

- (void)dealloc
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
  {
    dispatch_activate(callbackQueue);
    objc_msgSend_setQueueHasStarted_(self, v7, 1, v8);
  }
  if (self->_xpcActivityEligibilityChangedHandler)
  {
    xpc_activity_remove_eligibility_changed_handler();
    self->_xpcActivityEligibilityChangedHandler = 0;
  }
  uint64_t v9 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v13 = objc_msgSend_systemTask(v9, v10, v11, v12);

  if (v13)
  {
    uint64_t v17 = objc_msgSend_resolvedConfiguration(self, v14, v15, v16);
    v21 = objc_msgSend_systemTask(v17, v18, v19, v20);
    v22 = NSStringFromSelector(sel_state);
    objc_msgSend_removeObserver_forKeyPath_context_(v21, v23, (uint64_t)self, (uint64_t)v22, qword_1E9128CD0);
  }
  if (objc_msgSend_isExecuting(self, v14, v15, v16))
  {
    v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v24, v25, v26);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, (uint64_t)self, @"CKOperation.m", 261, @"Operation was deallocated before it finished");
  }
  v29.receiver = self;
  v29.super_class = (Class)CKOperation;
  [(CKOperation *)&v29 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  v14 = v10;
  if ((void *)qword_1E9128CD0 == a6)
  {
    if ((objc_msgSend_eligibleToRun(v10, v11, v12, v13) & 1) == 0) {
      objc_msgSend__handleBGSystemTaskExpiration_(self, v15, (uint64_t)v14, v16);
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CKOperation;
    [(CKOperation *)&v17 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (OS_dispatch_queue)callbackQueue
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  callbackQueue = v2->_callbackQueue;
  if (!callbackQueue)
  {
    uint64_t v6 = objc_msgSend_stringWithFormat_(NSString, v3, @"com.apple.cloudkit.operation-%@.callback", v4, v2->_operationID);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v8 = dispatch_queue_attr_make_initially_inactive(v7);

    uint64_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UNSPECIFIED, 0);

    uint64_t v13 = (const char *)objc_msgSend_UTF8String(v6, v10, v11, v12);
    dispatch_queue_t v14 = dispatch_queue_create(v13, v9);
    uint64_t v15 = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_set_specific((dispatch_queue_t)v2->_callbackQueue, kCKOperationCallbackQueueName, (void *)1, 0);
    callbackQueue = v2->_callbackQueue;
  }
  uint64_t v16 = callbackQueue;
  objc_sync_exit(v2);

  return v16;
}

- (void)setCallbackQueue:(id)a3
{
  uint64_t v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  callbackQueue = obj->_callbackQueue;
  if (callbackQueue)
  {
    dispatch_activate(callbackQueue);
    dispatch_queue_set_specific((dispatch_queue_t)obj->_callbackQueue, kCKOperationCallbackQueueName, 0, 0);
    uint64_t v6 = obj;
    v7 = obj->_callbackQueue;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = obj;
  }
  v6->_callbackQueue = v4;
  uint64_t v8 = v4;

  dispatch_queue_set_specific((dispatch_queue_t)obj->_callbackQueue, kCKOperationCallbackQueueName, (void *)1, 0);
  objc_sync_exit(obj);
}

- (void)setLongLivedOperationWasPersistedBlock:(void *)longLivedOperationWasPersistedBlock
{
  id v7 = longLivedOperationWasPersistedBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B0D75DC;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_longLivedOperationWasPersistedBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_longLivedOperationWasPersistedBlock;
    self->_longLivedOperationWasPersistedBlock = v11;
LABEL_9:
  }
}

- (void)longLivedOperationWasPersistedBlock
{
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13E7C;
    uint64_t v16 = sub_18AF13910;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0D77D0;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    uint64_t v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v8 = _Block_copy(self->_longLivedOperationWasPersistedBlock);
  }

  return v8;
}

- (void)setRequestCompletedBlock:(id)a3
{
  id v7 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B0D7958;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id requestCompletedBlock = v15;
    goto LABEL_9;
  }
  if (self->_requestCompletedBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id requestCompletedBlock = self->_requestCompletedBlock;
    self->_id requestCompletedBlock = v11;
LABEL_9:
  }
}

- (id)requestCompletedBlock
{
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13E7C;
    uint64_t v16 = sub_18AF13910;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0D7B4C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    uint64_t v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v8 = _Block_copy(self->_requestCompletedBlock);
  }

  return v8;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "CKOperation/?", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

- (void)_adoptPersonaIfNecessary
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_configuration(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_container(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_implementation(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_personaIdentifier(v13, v14, v15, v16);

  v21 = objc_msgSend_configuration(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_container(v21, v22, v23, v24);
  objc_super v29 = objc_msgSend_implementation(v25, v26, v27, v28);
  int isPersonaOverrideSet = objc_msgSend_isPersonaOverrideSet(v29, v30, v31, v32);

  uint64_t v37 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v34, v35, v36);
  v41 = objc_msgSend_currentPersona(v37, v38, v39, v40);

  uint64_t v45 = objc_msgSend_userPersonaUniqueString(v41, v42, v43, v44);
  v49 = (__CFString *)v45;
  if (isPersonaOverrideSet)
  {
    if (v45 | v17 && (objc_msgSend_isEqualToString_((void *)v45, v46, v17, v48) & 1) == 0)
    {
      v53 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v50, v51, v52);
      v57 = objc_msgSend_currentPersona(v53, v54, v55, v56);
      v60 = objc_msgSend_generateAndRestorePersonaContextWithPersonaUniqueString_(v57, v58, v17, v59);

      v64 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v61, v62, v63);
      v68 = objc_msgSend_currentPersona(v64, v65, v66, v67);
      v72 = objc_msgSend_userPersonaUniqueString(v68, v69, v70, v71);

      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v73 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v110 = v73;
        objc_msgSend_operationID(self, v74, v75, v76);
        v80 = v111 = v72;
        v81 = v60;
        if (v17) {
          v82 = @"adopting persona ";
        }
        else {
          v82 = @"dropping persona";
        }
        if (v17) {
          v83 = (__CFString *)v17;
        }
        else {
          v83 = &stru_1ED7F5C98;
        }
        v84 = objc_msgSend_configuration(self, v77, v78, v79);
        v88 = objc_msgSend_container(v84, v85, v86, v87);
        v92 = objc_msgSend_implementation(v88, v89, v90, v91);
        *(_DWORD *)buf = 138544898;
        v113 = v80;
        __int16 v114 = 2114;
        v115 = v82;
        v60 = v81;
        __int16 v116 = 2114;
        v117 = v83;
        __int16 v118 = 2114;
        v119 = v92;
        __int16 v120 = 2114;
        v121 = v81;
        __int16 v122 = 2112;
        v123 = v49;
        __int16 v124 = 2112;
        v125 = v111;
        _os_log_impl(&dword_18AF10000, v110, OS_LOG_TYPE_INFO, "Operation %{public}@ %{public}@%{public}@ from the associated container %{public}@. Error: %{public}@. Persona: %@ -> %@", buf, 0x48u);

        v72 = v111;
      }

      goto LABEL_15;
    }
  }
  else if (objc_msgSend_isDataSeparatedPersona(v41, v46, v47, v48))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v93 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v94 = v93;
      v60 = objc_msgSend_configuration(self, v95, v96, v97);
      v101 = objc_msgSend_container(v60, v98, v99, v100);
      v105 = objc_msgSend_implementation(v101, v102, v103, v104);
      objc_msgSend_operationID(self, v106, v107, v108);
      v109 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v113 = v105;
      __int16 v114 = 2114;
      v115 = v109;
      __int16 v116 = 2112;
      v117 = v49;
      _os_log_error_impl(&dword_18AF10000, v94, OS_LOG_TYPE_ERROR, "No effective persona associated with the container %{public}@ for the current operation %{public}@ but adopter is currently on one: %@.", buf, 0x20u);

LABEL_15:
    }
  }
}

- (void)start
{
  uint64_t v5 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, v2, v3);
  uint64_t v9 = objc_msgSend_operationMetric(self, v6, v7, v8);
  objc_msgSend_setStartTime_(v9, v10, (uint64_t)v5, v11);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18B0D931C;
  aBlock[3] = &unk_1E5460350;
  aBlock[4] = self;
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v16 = v12;
  if (__sTestOverridesAvailable)
  {
    uint64_t v17 = objc_msgSend_invokeOperationWillStartCallback(self, v13, v14, v15);
    objc_msgSend_setOperationWillStartCallback_(self, v18, 0, v19);
    objc_msgSend_takeActionOnOperation_proceedBlock_(v17, v20, (uint64_t)self, (uint64_t)v16);
  }
  else
  {
    (*((void (**)(void *))v12 + 2))(v12);
  }
}

- (void)validateXPCActivityCriteria:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  BOOL v4 = xpc_dictionary_get_BOOL(a3, (const char *)*MEMORY[0x1E4F14330]);
  uint64_t v8 = objc_msgSend_configuration(self, v5, v6, v7);
  int v12 = objc_msgSend_allowsExpensiveNetworkAccess(v8, v9, v10, v11);

  if (v4)
  {
    if (v12)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v13 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
      {
        uint64_t v14 = v13;
        uint64_t v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        uint64_t v18 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v17, 1, 0, 0);
        v22 = objc_msgSend_CKPropertiesStyleString(v18, v19, v20, v21);
        uint64_t v24 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v23, 0, 1, 0);
        uint64_t v28 = objc_msgSend_CKPropertiesStyleString(v24, v25, v26, v27);
        int v40 = 138544130;
        v41 = v16;
        __int16 v42 = 2048;
        uint64_t v43 = self;
        __int16 v44 = 2114;
        uint64_t v45 = v22;
        __int16 v46 = 2112;
        uint64_t v47 = v28;
        objc_super v29 = "BUG IN CLIENT OF CLOUDKIT: Operation configuration does not match XPC Activity Criteria. \n"
              " XPC Activity Criteria has disabled allows expensive network access. \n"
              " Operation Criteria has enabled allows expensive network access. \n"
              "<%{public}@: %p; %{public}@, %@>";
LABEL_13:
        _os_log_fault_impl(&dword_18AF10000, v14, OS_LOG_TYPE_FAULT, v29, (uint8_t *)&v40, 0x2Au);
      }
    }
  }
  else if ((v12 & 1) == 0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v30 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = v30;
      uint64_t v31 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v31);
      uint64_t v18 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v32, 1, 0, 0);
      v22 = objc_msgSend_CKPropertiesStyleString(v18, v33, v34, v35);
      uint64_t v24 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v36, 0, 1, 0);
      uint64_t v28 = objc_msgSend_CKPropertiesStyleString(v24, v37, v38, v39);
      int v40 = 138544130;
      v41 = v16;
      __int16 v42 = 2048;
      uint64_t v43 = self;
      __int16 v44 = 2114;
      uint64_t v45 = v22;
      __int16 v46 = 2112;
      uint64_t v47 = v28;
      objc_super v29 = "BUG IN CLIENT OF CLOUDKIT: Operation configuration does not match XPC Activity Criteria. \n"
            " XPC Activity Criteria has enabled allows expensive network access. \n"
            " Operation Criteria has disabled allows expensive network access. \n"
            "<%{public}@: %p; %{public}@, %@>";
      goto LABEL_13;
    }
  }
}

- (void)performCKOperation
{
  if (__sTestOverridesAvailable)
  {
    objc_msgSend_overlayTestResults(self, a2, v2, v3);
    uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6, v7);
    objc_msgSend_postNotificationName_object_(v8, v9, @"CKWillPerformOperation", (uint64_t)self);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B0D9B40;
  v10[3] = &unk_1E5461300;
  v10[4] = self;
  objc_msgSend_withContainerScopedDaemon_(self, a2, (uint64_t)v10, v3);
}

+ (SEL)daemonInvocationSelector
{
  uint64_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v9, (uint64_t)a2, (uint64_t)a1, @"CKOperation.m", 554, @"daemonInvocationSelector should be overridden by %@", v8);

  return a2;
}

- (BOOL)hasCKOperationCallbacksSet
{
  BOOL v4 = objc_msgSend_completionBlock(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v6 = objc_msgSend_configuration(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_container(v6, v7, v8, v9);

  if (!v10)
  {
    if (a3)
    {
      uint64_t v43 = (objc_class *)objc_opt_class();
      __int16 v44 = NSStringFromClass(v43);
      uint64_t v48 = objc_msgSend_operationID(self, v45, v46, v47);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v49, @"CKErrorDomain", 12, @"%@ %@ cannot run because it has no CKContainer. Set a container using CKOperationConfiguration.", v44, v48);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  uint64_t v14 = objc_msgSend_configuration(self, v11, v12, v13);
  int isLongLived = objc_msgSend_isLongLived(v14, v15, v16, v17);

  if (isLongLived)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v20 = objc_opt_class();
    uint64_t v23 = objc_msgSend_bundleForClass_(v19, v21, v20, v22);
    uint64_t v24 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v25 = objc_opt_class();
    uint64_t v28 = objc_msgSend_bundleForClass_(v24, v26, v25, v27);
    char isEqual = objc_msgSend_isEqual_(v23, v29, (uint64_t)v28, v30);

    if ((isEqual & 1) == 0)
    {
      if (!a3) {
        return 0;
      }
      v50 = (objc_class *)objc_opt_class();
      uint64_t v51 = NSStringFromClass(v50);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v52, @"CKErrorDomain", 12, @"Subclasses of CKOperations may not be run as long-lived operations: %@", v51);
      goto LABEL_11;
    }
    uint64_t v35 = objc_msgSend_resolvedConfiguration(self, v32, v33, v34);
    uint64_t v39 = objc_msgSend_assetDownloadStagingManager(v35, v36, v37, v38);

    if (v39)
    {
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v40, @"CKErrorDomain", 12, @"Long-lived operations may not use assetDownloadStagingManager.");
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        BOOL result = 0;
        *a3 = v41;
        return result;
      }
      return 0;
    }
    if (CKCurrentProcessIsDaemon())
    {
      uint64_t v56 = objc_msgSend_configuration(self, v53, v54, v55);
      v60 = objc_msgSend_container(v56, v57, v58, v59);
      uint64_t v51 = objc_msgSend_containerID(v60, v61, v62, v63);

      if (!objc_msgSend_isAppleInternal(v51, v64, v65, v66)
        || (unint64_t v70 = objc_msgSend_specialContainerType(v51, v67, v68, v69), v70 <= 0x1B) && ((1 << v70) & 0xA201C00) != 0)
      {

        return 1;
      }
      if (!a3) {
        goto LABEL_12;
      }
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v71, @"CKErrorDomain", 12, @"CKOperations from daemons must not be run as long-lived operations (59154510).\nMore information about scheduling in CloudKit can be found internally at https://cloudkit.apple.com/API/CKNative/Guides/Scheduling.html.\nUse xpc_activity_t to schedule your daemon to run at an appropriate time for this CKOperation. Set your xpc_activity_t on -[CKOperationConfiguration xpcActivity]. See the header documentation for CKOperationConfiguration's xpcActivity in CKOperation_Private.h for more details.");
LABEL_11:
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

      return 0;
    }
  }
  return 1;
}

- (id)_createPlaceholderOperation
{
  uint64_t v3 = [CKPlaceholderOperation alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B0DA248;
  v9[3] = &unk_1E5460350;
  v9[4] = self;
  id v4 = sub_18B0D644C(v3, self, v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B0DA6A8;
  v8[3] = &unk_1E5460350;
  v8[4] = self;
  objc_msgSend_setCompletionBlock_(v4, v5, (uint64_t)v8, v6);

  return v4;
}

- (void)main
{
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isOutstandingOperation(self, a2, v2, v3)
    && (objc_msgSend_hasCKOperationCallbacksSet(self, v7, v8, v9) & 1) == 0
    && (objc_msgSend_isCancelled(self, v7, v10, v9) & 1) == 0)
  {
    v170 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v7, @"CKErrorDomain", 12, @"You must set some callbacks on this long-lived operation before running it.");
    v171 = [CKException alloc];
    uint64_t v175 = objc_msgSend_code(v170, v172, v173, v174);
    v179 = objc_msgSend_localizedDescription(v170, v176, v177, v178);
    id v181 = (id)objc_msgSend_initWithCode_format_(v171, v180, v175, @"%@", v179);

    objc_exception_throw(v181);
  }
  id v184 = 0;
  char ShouldRun = objc_msgSend_CKOperationShouldRun_(self, v7, (uint64_t)&v184, v9);
  id v15 = v184;
  if ((ShouldRun & 1) == 0)
  {
    objc_msgSend_finishWithError_(self, v12, (uint64_t)v15, v14);
    goto LABEL_31;
  }
  uint64_t v16 = objc_msgSend_clientOperationCallbackProxy(self, v12, v13, v14);
  objc_msgSend_activate(v16, v17, v18, v19);

  int IsDaemon = CKCurrentProcessIsDaemon();
  if (__sTestOverridesAvailable) {
    char v24 = IsDaemon;
  }
  else {
    char v24 = 1;
  }
  if (__sTestOverridesAvailable) {
    int v25 = 1;
  }
  else {
    int v25 = IsDaemon;
  }
  if ((v24 & 1) == 0) {
    int v25 = objc_msgSend_allowCKDiscretionarydUseFromApp(self, v21, v22, v23);
  }
  uint64_t v26 = objc_msgSend_resolvedConfiguration(self, v21, v22, v23);
  if ((objc_msgSend_discretionarySchedulingForEntireOperation(v26, v27, v28, v29) & v25) != 1
    || self && self->_duetPreClearedMode)
  {

    int v36 = objc_msgSend_usesBackgroundSession(self, v33, v34, v35);
LABEL_17:
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v37 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      id v41 = v37;
      __int16 v42 = (objc_class *)objc_opt_class();
      uint64_t v43 = NSStringFromClass(v42);
      uint64_t v47 = objc_msgSend_ckShortDescription(self, v44, v45, v46);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v43;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      __int16 v186 = 2114;
      v187 = v47;
      _os_log_impl(&dword_18AF10000, v41, OS_LOG_TYPE_INFO, "Operation <%{public}@: %p; %{public}@> enqueuing on container throttle queue",
        buf,
        0x20u);
    }
    v49 = objc_msgSend__createPlaceholderOperation(self, v38, v39, v40);
    if (self) {
      objc_setProperty_atomic(self, v48, v49, 448);
    }

    v53 = objc_msgSend_configuration(self, v50, v51, v52);
    uint64_t v59 = objc_msgSend_container(v53, v54, v55, v56);
    if (v36)
    {
      if (self)
      {
        id Property = objc_getProperty(self, v57, 448, 1);
        objc_msgSend_addPreparedOperationToBackgroundThrottlingOperationQueue_(v59, v61, (uint64_t)Property, v62);
      }
      else
      {
        objc_msgSend_addPreparedOperationToBackgroundThrottlingOperationQueue_(v59, v57, 0, v58);
      }
    }
    else if (self)
    {
      id v63 = objc_getProperty(self, v57, 448, 1);
      objc_msgSend_addPreparedOperationToThrottlingOperationQueue_(v59, v64, (uint64_t)v63, v65);
    }
    else
    {
      objc_msgSend_addPreparedOperationToThrottlingOperationQueue_(v59, v57, 0, v58);
    }

    uint64_t v69 = objc_msgSend_configuration(self, v66, v67, v68);
    v73 = objc_msgSend_container(v69, v70, v71, v72);
    BOOL v74 = v73 == 0;

    if (v74)
    {
      v164 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v75, v76, v77);
      v168 = objc_msgSend_operationID(self, v165, v166, v167);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v164, v169, (uint64_t)a2, (uint64_t)self, @"CKOperation.m", 727, @"No container found to run operation %@", v168);
    }
    goto LABEL_31;
  }
  uint64_t v78 = objc_msgSend_resolvedConfiguration(self, v30, v31, v32);
  uint64_t v85 = objc_msgSend_discretionaryNetworkBehavior(v78, v79, v80, v81);
  if (v85
    || (objc_msgSend_resolvedConfiguration(self, v82, v83, v84),
        id v4 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_automaticallyRetryNetworkFailures(v4, v86, v87, v88)))
  {
    BOOL v89 = v85 == 0;
    uint64_t v90 = objc_msgSend_resolvedConfiguration(self, v82, v83, v84);
    int isLongLived = objc_msgSend_isLongLived(v90, v91, v92, v93);

    int v95 = isLongLived ^ 1;
    if (!v89) {
      goto LABEL_38;
    }
  }
  else
  {
    int v95 = 0;
  }

LABEL_38:
  int v36 = objc_msgSend_usesBackgroundSession(self, v96, v97, v98);
  if (!v95) {
    goto LABEL_17;
  }
  if (self)
  {
    self->_scheduledDiscretionaryOperation = 1;
    self->_systemScheduler = 2;
  }
  uint64_t v99 = _os_activity_create(&dword_18AF10000, "internal/queue-discretionary", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  os_activity_scope_enter(v99, (os_activity_scope_state_t)buf);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v100 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v183 = 0;
    _os_log_debug_impl(&dword_18AF10000, v100, OS_LOG_TYPE_DEBUG, "Queuing discretionary operation.", v183, 2u);
  }
  v182[0] = MEMORY[0x1E4F143A8];
  v182[1] = 3221225472;
  v182[2] = sub_18B0DAEE0;
  v182[3] = &unk_1E5460240;
  v182[4] = self;
  v101 = sub_18B0DAFAC(self, v182);
  uint64_t v108 = objc_msgSend_operationID(self, v102, v103, v104);
  if (self)
  {
    v109 = objc_msgSend_resolvedConfiguration(self, v105, v106, v107);
    v110 = objc_alloc_init(CKDiscretionaryOptions);
    __int16 v114 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v109, v111, v112, v113);
    objc_msgSend_setApplicationBundleIdentifierOverride_(v110, v115, (uint64_t)v114, v116);

    __int16 v120 = objc_msgSend__sourceApplicationSecondaryIdentifier(v109, v117, v118, v119);
    objc_msgSend_setSecondarySourceApplicationBundleId_(v110, v121, (uint64_t)v120, v122);

    objc_msgSend_timeoutIntervalForResource(v109, v123, v124, v125);
    if (v129 < 1.0) {
      double v129 = 604800.0;
    }
    objc_msgSend_setTimeoutIntervalForResource_(v110, v126, v127, v128, v129);
    uint64_t v133 = objc_msgSend_allowsCellularAccess(v109, v130, v131, v132);
    objc_msgSend_setAllowsCellularAccess_(v110, v134, v133, v135);
    uint64_t v139 = objc_msgSend_allowsExpensiveNetworkAccess(v109, v136, v137, v138);
    objc_msgSend_setAllowsExpensiveNetworkAccess_(v110, v140, v139, v141);
    uint64_t v145 = objc_msgSend_discretionaryNetworkBehavior(v109, v142, v143, v144);
    objc_msgSend_setDiscretionaryNetworkBehavior_(v110, v146, v145, v147);
    v151 = objc_msgSend_deviceContext(self, v148, v149, v150);
    uint64_t v155 = objc_msgSend_useLiveServer(v151, v152, v153, v154);
    objc_msgSend_setRequiresNetworkAccess_(v110, v156, v155, v157);
  }
  else
  {
    v110 = 0;
  }
  v158 = objc_msgSend_clientOperationCallbackProxy(self, v105, v106, v107);
  v162 = objc_msgSend_endpoint(v158, v159, v160, v161);
  objc_msgSend_queueOperationID_options_clientOperationCallbackProxyEndpoint_withBlock_(v101, v163, (uint64_t)v108, (uint64_t)v110, v162, &unk_1ED7EF258);

  os_activity_scope_leave((os_activity_scope_state_t)buf);
LABEL_31:
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_18B0DB63C;
    v7[3] = &unk_1E5464138;
    BOOL v5 = &v9;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)CKOperation;
    [(CKOperation *)&v6 setCompletionBlock:v7];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0DB5E8;
    v11[3] = &unk_1E54610B0;
    BOOL v5 = &v12;
    objc_copyWeak(&v12, &location);
    v10.receiver = self;
    v10.super_class = (Class)CKOperation;
    [(CKOperation *)&v10 setCompletionBlock:v11];
  }
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)fillOutOperationInfo:(id)a3
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend_resolvedConfiguration(self, v5, v6, v7);
  objc_msgSend_setResolvedConfiguration_(v4, v9, (uint64_t)v8, v10);
  uint64_t v17 = objc_msgSend_group(self, v11, v12, v13);
  if (v17)
  {
    objc_msgSend_setGroup_(v4, v14, (uint64_t)v17, v16);
  }
  else
  {
    uint64_t v18 = objc_msgSend_convenienceOperationGroup(self, v14, v15, v16);
    objc_msgSend_setGroup_(v4, v19, (uint64_t)v18, v20);
  }
  char v24 = objc_msgSend_operationID(self, v21, v22, v23);
  objc_msgSend_setOperationID_(v4, v25, (uint64_t)v24, v26);

  uint64_t v31 = objc_msgSend_name(self, v27, v28, v29);
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v30, v31, 128);
  }

  uint64_t v35 = objc_msgSend_queuePriority(self, v32, v33, v34);
  objc_msgSend_setClientQueuePriority_(v4, v36, v35, v37);
  if (self)
  {
    objc_msgSend_setDuetPreClearedMode_(v4, v38, self->_duetPreClearedMode, v39);
    objc_msgSend_setDiscretionaryWhenBackgroundedState_(v4, v40, self->_discretionaryWhenBackgroundedState, v41);
    objc_msgSend_setSystemScheduler_(v4, v42, self->_systemScheduler, v43);
    objc_msgSend_setXpcActivityIdentifier_(v4, v44, (uint64_t)self->_xpcActivityIdentifier, v45);
  }
  else
  {
    objc_msgSend_setDuetPreClearedMode_(v4, v38, 0, v39);
    objc_msgSend_setDiscretionaryWhenBackgroundedState_(v4, v144, 0, v145);
    objc_msgSend_setSystemScheduler_(v4, v146, 0, v147);
    objc_msgSend_setXpcActivityIdentifier_(v4, v148, 0, v149);
  }
  uint64_t v46 = objc_opt_class();
  v50 = (objc_class *)objc_msgSend_operationClass(v46, v47, v48, v49);
  uint64_t v51 = NSStringFromClass(v50);
  objc_msgSend_setCkOperationClassName_(v4, v52, (uint64_t)v51, v53);

  v57 = objc_msgSend_clientOperationCallbackProxy(self, v54, v55, v56);
  v61 = objc_msgSend_endpoint(v57, v58, v59, v60);
  objc_msgSend_setCallbackProxyEndpoint_(v4, v62, (uint64_t)v61, v63);

  char isOutstandingOperation = objc_msgSend_isOutstandingOperation(self, v64, v65, v66);
  if (v4) {
    v4[8] = isOutstandingOperation;
  }
  uint64_t v71 = objc_msgSend_MMCSRequestOptions(self, v68, v69, v70);
  objc_msgSend_setMMCSRequestOptions_(v4, v72, (uint64_t)v71, v73);

  uint64_t v77 = objc_msgSend_requestOriginator(v8, v74, v75, v76);
  objc_msgSend_setRequestOriginator_(v4, v78, v77, v79);
  uint64_t v83 = objc_msgSend_requestCompletedBlock(self, v80, v81, v82);

  if (v4 && v83) {
    v4[11] = 1;
  }
  v151 = v8;
  uint64_t v87 = objc_msgSend_assetDownloadStagingManager(v8, v84, v85, v86);

  if (v87) {
    objc_msgSend_setUsesAssetDownloadStagingManager_(v4, v88, 1, v89);
  }
  objc_msgSend_classForObject_(CKObjCClass, v88, (uint64_t)v4, v89);
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  uint64_t v150 = v155 = 0u;
  uint64_t v93 = objc_msgSend_properties(v150, v90, v91, v92);
  uint64_t v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v94, (uint64_t)&v152, (uint64_t)v162, 16);
  if (v95)
  {
    uint64_t v99 = v95;
    uint64_t v100 = *(void *)v153;
    do
    {
      uint64_t v101 = 0;
      do
      {
        if (*(void *)v153 != v100) {
          objc_enumerationMutation(v93);
        }
        v102 = *(void **)(*((void *)&v152 + 1) + 8 * v101);
        uint64_t v103 = objc_msgSend_type(v102, v96, v97, v98);
        if (v103)
        {
          uint64_t v104 = v103[1];

          if (v104 != 15) {
            goto LABEL_24;
          }
          v105 = sub_18B1239E0(v102, v4);
          v109 = objc_msgSend_configuration(self, v106, v107, v108);
          uint64_t v113 = objc_msgSend_container(v109, v110, v111, v112);
          v117 = objc_msgSend_containerID(v113, v114, v115, v116);
          objc_msgSend_CKAssignToContainerWithID_(v105, v118, (uint64_t)v117, v119);
        }
        else
        {
          v105 = 0;
        }

LABEL_24:
        ++v101;
      }
      while (v99 != v101);
      uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v96, (uint64_t)&v152, (uint64_t)v162, 16);
      uint64_t v99 = v120;
    }
    while (v120);
  }

  uint64_t v124 = objc_msgSend_qualityOfService(v4, v121, v122, v123);
  uint64_t v128 = v151;
  if ((v124 == 33 || v124 == 25) && objc_msgSend_discretionaryNetworkBehavior(v4, v125, v126, v127))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    double v129 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      v130 = v129;
      uint64_t v134 = objc_msgSend_qualityOfService(v4, v131, v132, v133);
      uint64_t v138 = CKStringForQOS(v134, v135, v136, v137);
      unint64_t v142 = objc_msgSend_discretionaryNetworkBehavior(v4, v139, v140, v141);
      uint64_t v143 = CKStringForDiscretionaryNetworkBehavior(v142);
      *(_DWORD *)buf = 138412802;
      uint64_t v157 = self;
      __int16 v158 = 2114;
      v159 = v138;
      __int16 v160 = 2114;
      uint64_t v161 = v143;
      _os_log_fault_impl(&dword_18AF10000, v130, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF CLOUDKIT: Operation %@ requesting to use CPU QualityOfService %{public}@ with %{public}@ networking behavior.\n Will override in cloudd with the following behavior:\n   operation.qualityOfService = Utility.\nAll other operation configurations will remain the same.", buf, 0x20u);

      uint64_t v128 = v151;
    }
  }
  if (__sTestOverridesAvailable) {
    objc_msgSend_addTestInfoToOperationInfo_(self, v125, (uint64_t)v4, v127);
  }
}

- (void)fillFromOperationInfo:(id)a3
{
  uint64_t v51 = a3;
  uint64_t v7 = objc_msgSend_resolvedConfiguration(v51, v4, v5, v6);
  objc_msgSend_setConfiguration_(self, v8, (uint64_t)v7, v9);

  uint64_t v13 = objc_msgSend_group(v51, v10, v11, v12);
  objc_msgSend_setGroup_(self, v14, (uint64_t)v13, v15);

  uint64_t v19 = objc_msgSend_operationID(v51, v16, v17, v18);
  objc_msgSend_setOperationID_(self, v20, (uint64_t)v19, v21);

  if (v51) {
    uint64_t v22 = (void *)v51[16];
  }
  else {
    uint64_t v22 = 0;
  }
  id v23 = v22;
  objc_msgSend_setName_(self, v24, (uint64_t)v23, v25);

  objc_msgSend_setIsOutstandingOperation_(self, v26, 1, v27);
  uint64_t v31 = objc_msgSend_clientQueuePriority(v51, v28, v29, v30);
  objc_msgSend_setQueuePriority_(self, v32, v31, v33);
  unint64_t v37 = objc_msgSend_duetPreClearedMode(v51, v34, v35, v36);
  if (self)
  {
    self->_duetPreClearedMode = v37;
    self->_discretionaryWhenBackgroundedState = objc_msgSend_discretionaryWhenBackgroundedState(v51, v38, v39, v40);
    self->_systemScheduler = objc_msgSend_systemScheduler(v51, v41, v42, v43);
  }
  else
  {
    objc_msgSend_discretionaryWhenBackgroundedState(v51, v38, v39, v40);
    objc_msgSend_systemScheduler(v51, v48, v49, v50);
  }
  uint64_t v47 = objc_msgSend_xpcActivityIdentifier(v51, v44, v45, v46);
  sub_18B0D91F4((uint64_t)self, v47);
}

+ (Class)operationInfoClass
{
  if ((id)objc_opt_class() == a1) {
    goto LABEL_5;
  }
  Superclass = (objc_class *)a1;
  while (1)
  {
    id v8 = NSStringFromClass(Superclass);
    objc_msgSend_stringByAppendingString_(v8, v9, @"Info", v10);
    uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    Class v12 = NSClassFromString(v11);

    uint64_t v13 = objc_opt_class();
    if (objc_msgSend_isSubclassOfClass_(v12, v14, v13, v15)) {
      break;
    }
    Superclass = class_getSuperclass(Superclass);
    if (Superclass == (objc_class *)objc_opt_class()) {
      goto LABEL_5;
    }
  }
  if (!v12)
  {
LABEL_5:
    uint64_t v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v4, v5, v6);
    uint64_t v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v19, (uint64_t)a2, (uint64_t)a1, @"CKOperation.m", 838, @"CKOperation subclass lacked an operation info class: %@", v18);

    Class v12 = 0;
  }

  return v12;
}

+ (Class)operationClass
{
  id v4 = a1;
  uint64_t v5 = objc_msgSend_superclass(a1, a2, v2, v3);
  if (v5 != objc_opt_class())
  {
    do
    {
      uint64_t v9 = objc_msgSend_superclass(v4, v6, v7, v8);
      if (v9 == objc_opt_class()) {
        break;
      }
      id v4 = objc_msgSend_superclass(v4, v10, v11, v12);
      uint64_t v16 = objc_msgSend_superclass(v4, v13, v14, v15);
    }
    while (v16 != objc_opt_class());
  }

  return (Class)v4;
}

- (CKOperationInfo)operationInfo
{
  uint64_t v3 = objc_opt_class();
  id v7 = objc_alloc_init((Class)objc_msgSend_operationInfoClass(v3, v4, v5, v6));
  objc_msgSend_fillOutOperationInfo_(self, v8, (uint64_t)v7, v9);

  return (CKOperationInfo *)v7;
}

- (CKOperationCallbackProxy)clientOperationCallbackProxy
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_clientOperationCallbackProxy)
  {
    uint64_t v3 = [CKOperationCallbackProxy alloc];
    id v4 = objc_opt_class();
    uint64_t v8 = objc_msgSend_operationDaemonCallbackProtocol(v4, v5, v6, v7);
    uint64_t v10 = objc_msgSend_initWithOperation_callbackProtocol_(v3, v9, (uint64_t)v2, (uint64_t)v8);
    clientOperationCallbackProxy = v2->_clientOperationCallbackProxy;
    v2->_clientOperationCallbackProxy = (CKOperationCallbackProxy *)v10;
  }
  objc_sync_exit(v2);

  uint64_t v12 = v2->_clientOperationCallbackProxy;

  return v12;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v3 = a3;
  id v4 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v3, v5, (uint64_t)v4, (uint64_t)sel_handleOperationDidCompleteWithMetrics_error_, 1, 0);

  CKErrorUserInfoClasses();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v3, v6, (uint64_t)v7, (uint64_t)sel_handleDiscretionaryOperationShouldStart_nonDiscretionary_error_, 2, 0);
}

+ (id)operationDaemonCallbackProtocol
{
  if ((id)objc_opt_class() == a1)
  {
LABEL_5:
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v4, v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)a1, @"CKOperation.m", 911, @"Couldn't find Callbacks protocol for class %@", a1);

    uint64_t v12 = 0;
  }
  else
  {
    Superclass = (objc_class *)a1;
    while (1)
    {
      uint64_t v8 = NSStringFromClass(Superclass);
      objc_msgSend_stringByAppendingString_(v8, v9, @"Callbacks", v10);
      uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = NSProtocolFromString(v11);

      if (v12) {
        break;
      }
      Superclass = class_getSuperclass(Superclass);
      if (Superclass == (objc_class *)objc_opt_class()) {
        goto LABEL_5;
      }
    }
  }

  return v12;
}

+ (SEL)daemonCallbackCompletionSelector
{
  return sel_handleOperationDidCompleteWithMetrics_error_;
}

- (void)cancelWithUnderlyingError:(id)a3
{
}

- (void)cancelWithUnderlyingError:(id)a3 message:(id)a4
{
  id v17 = a3;
  id v9 = a4;
  if (!v9)
  {
    uint64_t v10 = NSString;
    uint64_t v11 = objc_msgSend_operationID(self, v6, v7, v8);
    objc_msgSend_stringWithFormat_(v10, v12, @"Operation %@ was cancelled with an error", v13, v11);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(CKPrettyError, v6, @"CKErrorDomain", 20, 0, v17, 0, 0, v9);
  objc_msgSend_cancelWithError_(self, v15, (uint64_t)v14, v16);
}

- (void)cancelWithError:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v7 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v7;
    uint64_t v15 = objc_msgSend_operationID(self, v12, v13, v14);
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v15;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_18AF10000, v11, OS_LOG_TYPE_INFO, "Warn: Cancelling operation %{public}@ with error %@", buf, 0x16u);
  }
  if (!v6)
  {
    uint64_t v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, @"CKOperation.m", 935, @"Cancel error must not be nil.");
  }
  id v16 = v6;
  if (self)
  {
    id v17 = self;
    objc_sync_enter(v17);
    objc_storeStrong((id *)&v17->_cancelError, a3);
    objc_sync_exit(v17);
  }
  v25.receiver = self;
  v25.super_class = (Class)CKOperation;
  [(CKOperation *)&v25 cancel];
  uint64_t v21 = objc_msgSend_callbackQueue(self, v18, v19, v20);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B0DC5AC;
  block[3] = &unk_1E5460350;
  block[4] = self;
  dispatch_async(v21, block);
}

- (void)_cancelDaemonOperation
{
  uint64_t v5 = objc_msgSend_configuration(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_container(v5, v6, v7, v8);
  v10[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B0DCA08;
  v11[3] = &unk_1E5460240;
  void v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B0DCB58;
  v10[3] = &unk_1E5461300;
  sub_18B03D47C(v9, v11, v10);
}

- (void)_finishDiscretionaryOperation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self && self->_scheduledDiscretionaryOperation)
  {
    uint64_t v3 = _os_activity_create(&dword_18AF10000, "internal/finish-discretionary", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v4 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = objc_msgSend_operationID(self, v5, v6, v7);
      *(_DWORD *)buf = 138412290;
      char v24 = v19;
      _os_log_debug_impl(&dword_18AF10000, v4, OS_LOG_TYPE_DEBUG, "Finishing discretionary operation %@", buf, 0xCu);
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_18B0DCF20;
    v21[3] = &unk_1E5460240;
    v21[4] = self;
    uint64_t v8 = sub_18B0DAFAC(self, v21);
    uint64_t v12 = objc_msgSend_operationID(self, v9, v10, v11);
    objc_msgSend_finishOperationID_(v8, v13, (uint64_t)v12, v14);

    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v15 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = objc_msgSend_operationID(self, v16, v17, v18);
      *(_DWORD *)buf = 138412290;
      char v24 = v20;
      _os_log_debug_impl(&dword_18AF10000, v15, OS_LOG_TYPE_DEBUG, "Finished discretionary operation %@", buf, 0xCu);
    }
    os_activity_scope_leave(&state);
  }
}

- (void)cancel
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v3 = sub_18B0D7CD0(self);
  os_activity_scope_enter(v3, &state);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v4 = (id)ck_log_facility_ck;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_msgSend_operationID(self, v5, v6, v7);
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v8;
    _os_log_impl(&dword_18AF10000, v4, OS_LOG_TYPE_INFO, "Adopter cancelled operation %@", buf, 0xCu);
  }
  uint64_t v12 = objc_msgSend_operationID(self, v9, v10, v11);
  uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v13, @"CKErrorDomain", 20, 0, @"Operation %@ was cancelled", v12);
  objc_msgSend_cancelWithError_(self, v15, (uint64_t)v14, v16);

  os_activity_scope_leave(&state);
}

- (BOOL)isFinished
{
  LOBYTE(self) = self->_executionState == 2;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB27A118);
  return (char)self;
}

- (BOOL)isExecuting
{
  LOBYTE(self) = self->_executionState == 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB27A118);
  return (char)self;
}

- (BOOL)transitionToExecuting
{
  BOOL v3 = CKOperationExecutionStateTransitionToExecuting(self, &self->_executionState);
  if (v3)
  {
    if (self)
    {
      id v4 = CKGetGlobalQueue(17);
      uint64_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);

      objc_initWeak(&location, self);
      uint64_t v9 = objc_msgSend_sharedOptions(CKBehaviorOptions, v6, v7, v8);
      double v10 = sub_18B0D4504((uint64_t)v9);

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_18B0DD260;
      v19[3] = &unk_1E5464160;
      objc_copyWeak(v20, &location);
      v20[1] = *(id *)&v10;
      uint64_t v11 = v19;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = sub_18B0E370C;
      handler[3] = &unk_1E5462200;
      id v23 = v11;
      dispatch_source_set_event_handler(v5, handler);

      dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      dispatch_source_set_timer(v5, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      uint64_t v13 = self;
      objc_sync_enter(v13);
      timeoutSource = v13->_timeoutSource;
      v13->_timeoutSource = (OS_dispatch_source *)v5;
      uint64_t v15 = v5;

      objc_sync_exit(v13);
      dispatch_resume(v15);

      objc_destroyWeak(v20);
      objc_destroyWeak(&location);
    }
    uint64_t v16 = (OS_os_transaction *)os_transaction_create();
    executingTransaction = self->_executingTransaction;
    self->_executingTransaction = v16;
  }
  return v3;
}

- (BOOL)transitionToFinished
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  BOOL v3 = CKOperationExecutionStateTransitionToFinished(self, &self->_executionState);
  if (v3)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v4 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = objc_msgSend_operationID(self, v5, v6, v7);
      uint64_t v15 = objc_msgSend_error(self, v9, v10, v11);
      uint64_t v16 = &stru_1ED7F5C98;
      if (v15) {
        uint64_t v17 = @" with error: ";
      }
      else {
        uint64_t v17 = &stru_1ED7F5C98;
      }
      uint64_t v18 = objc_msgSend_error(self, v12, v13, v14);
      uint64_t v22 = (void *)v18;
      if (v18) {
        id v23 = (__CFString *)v18;
      }
      else {
        id v23 = &stru_1ED7F5C98;
      }
      uint64_t v27 = objc_msgSend_error(self, v19, v20, v21);
      if (v27)
      {
        uint64_t v39 = objc_msgSend_error(self, v24, v25, v26);
        objc_msgSend_CKClientSuitableError(v39, v28, v29, v30);
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544130;
      uint64_t v41 = v8;
      __int16 v42 = 2112;
      uint64_t v43 = v17;
      __int16 v44 = 2114;
      uint64_t v45 = v23;
      __int16 v46 = 2112;
      uint64_t v47 = v16;
      _os_log_impl(&dword_18AF10000, v4, OS_LOG_TYPE_INFO, "Operation %{public}@ finished%@%{public}@%@", buf, 0x2Au);
      if (v27)
      {
      }
    }

    sub_18B0DD1D4(self);
    executingTransaction = self->_executingTransaction;
    self->_executingTransaction = 0;

    uint64_t v35 = objc_msgSend_callbackQueue(self, v32, v33, v34);
    dispatch_activate(v35);

    objc_msgSend_setQueueHasStarted_(self, v36, 1, v37);
  }
  return v3;
}

- (void)setIsFinished:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, @"CKOperation.m", 1058, @"Operations cannot be set to not finished");
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v6 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    uint64_t v10 = v6;
    uint64_t v11 = NSStringFromSelector(a2);
    dispatch_time_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    int v16 = 138412546;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    _os_log_fault_impl(&dword_18AF10000, v10, OS_LOG_TYPE_FAULT, "Shenanigans! Should not call %@ on %@. Call -transitionToFinished instead.", (uint8_t *)&v16, 0x16u);
  }
  objc_msgSend_transitionToFinished(self, v7, v8, v9);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = objc_msgSend_initWithCapacity_(v8, v9, 5, v10);
  uint64_t v15 = objc_msgSend_configuration(self, v12, v13, v14);
  uint64_t v22 = objc_msgSend_group(self, v16, v17, v18);
  if (v6)
  {
    id v23 = objc_msgSend_operationID(self, v19, v20, v21);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v24, @"operationID", (uint64_t)v23);

    uint64_t v27 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v25, 3, v26);
    if (objc_msgSend_isExecuting(self, v28, v29, v30)) {
      objc_msgSend_addObject_(v27, v31, @"executing", v33);
    }
    if (objc_msgSend_isFinished(self, v31, v32, v33)) {
      objc_msgSend_addObject_(v27, v34, @"finished", v36);
    }
    if (objc_msgSend_isCancelled(self, v34, v35, v36)) {
      objc_msgSend_addObject_(v27, v37, @"cancelled", v39);
    }
    if (objc_msgSend_isLongLived(v15, v37, v38, v39)) {
      objc_msgSend_addObject_(v27, v40, @"long-lived", v42);
    }
    if (objc_msgSend_isOutstandingOperation(self, v40, v41, v42)) {
      objc_msgSend_addObject_(v27, v43, @"outstanding", v45);
    }
    if (objc_msgSend_count(v27, v43, v44, v45))
    {
      uint64_t v49 = objc_msgSend_componentsJoinedByString_(v27, v46, @"|", v48);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v50, @"stateFlags", (uint64_t)v49);
    }
    uint64_t v51 = objc_msgSend_qualityOfService(self, v46, v47, v48);
    uint64_t v55 = CKStringForQOS(v51, v52, v53, v54);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v56, @"qos", (uint64_t)v55);

    if (v22)
    {
      uint64_t v58 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v22, v57, 1, v5, 1);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v59, @"operationGroup", (uint64_t)v58);
    }
  }
  if (v5)
  {
    uint64_t v63 = objc_msgSend_metrics(self, v19, v20, v21);
    if (v63) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v60, @"metrics", (uint64_t)v63);
    }
    if (__sTestOverridesAvailable)
    {
      v64 = objc_msgSend_unitTestOverrides(self, v60, v61, v62);
      if (objc_msgSend_count(v64, v65, v66, v67)) {
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v68, @"unitTestOverrides", (uint64_t)v64);
      }
    }
  }
  uint64_t v72 = objc_msgSend_resolvedConfigurationIfNotNil(self, v19, v20, v21);
  if (!v72)
  {
    uint64_t v73 = v15;
    if (!v15) {
      uint64_t v73 = objc_opt_new();
    }
    BOOL v74 = objc_msgSend_defaultConfiguration(v22, v69, v70, v71);
    uint64_t v72 = objc_msgSend_resolveAgainstGenericConfiguration_(v73, v75, (uint64_t)v74, v76);

    if (!v15) {
  }
    }
  uint64_t v77 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v72, v69, v6, v5, 1);
  if (objc_msgSend_count(v77, v78, v79, v80)) {
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v81, @"resolvedConfig", (uint64_t)v77);
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKOperation *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)ckShortDescription
{
  return (id)objc_msgSend_CKShortDescriptionRedact_(self, a2, 0, v2);
}

- (id)CKShortDescriptionRedact:(BOOL)a3
{
  id v4 = NSString;
  BOOL v5 = objc_msgSend_operationID(self, a2, a3, v3);
  id v8 = objc_msgSend_stringWithFormat_(v4, v6, @"operationID=%@", v7, v5);

  return v8;
}

- (id)zoneIDsToZoneNamesString:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v8 = v3;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v39, (uint64_t)v43, 16);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = objc_msgSend_zoneName(v14, v15, v16, v17, (void)v39);
            uint64_t v22 = objc_msgSend_length(v18, v19, v20, v21);

            if (v22)
            {
              uint64_t v25 = objc_msgSend_zoneName(v14, v15, v23, v24);
              objc_msgSend_addObject_(v7, v26, (uint64_t)v25, v27);
            }
          }
        }
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v15, (uint64_t)&v39, (uint64_t)v43, 16);
      }
      while (v11);
    }

    uint64_t v31 = objc_msgSend_allObjects(v7, v28, v29, v30);
    uint64_t v34 = objc_msgSend_sortedArrayUsingSelector_(v31, v32, (uint64_t)sel_localizedCaseInsensitiveCompare_, v33);

    uint64_t v37 = objc_msgSend_componentsJoinedByString_(v34, v35, @",", v36);
  }
  else
  {
    uint64_t v37 = 0;
  }

  return v37;
}

- (void)configureConvenience:(id)a3
{
  id v127 = a3;
  objc_msgSend_setQueuePriority_(self, v4, -4, v5);
  if (!CKCurrentProcessLinkChecke0fc00bd437646efa0e6635c2beaaea9())
  {
    objc_msgSend_setQualityOfService_(self, v6, 17, v8);
    goto LABEL_9;
  }
  uint64_t v9 = objc_msgSend_configuration(v127, v6, v7, v8);
  int hasQualityOfService = objc_msgSend_hasQualityOfService(v9, v10, v11, v12);

  if (hasQualityOfService)
  {
    uint64_t v17 = objc_msgSend_configuration(v127, v14, v15, v16);
    uint64_t v21 = objc_msgSend_qualityOfService(v17, v18, v19, v20);
    objc_msgSend_setQualityOfService_(self, v22, v21, v23);
LABEL_7:

    goto LABEL_9;
  }
  uint64_t v27 = objc_msgSend_group(v127, v14, v15, v16);
  uint64_t v31 = objc_msgSend_defaultConfiguration(v27, v28, v29, v30);
  int v35 = objc_msgSend_hasQualityOfService(v31, v32, v33, v34);

  if (v35)
  {
    uint64_t v17 = objc_msgSend_group(v127, v36, v37, v38);
    long long v42 = objc_msgSend_defaultConfiguration(v17, v39, v40, v41);
    uint64_t v46 = objc_msgSend_qualityOfService(v42, v43, v44, v45);
    objc_msgSend_setQualityOfService_(self, v47, v46, v48);

    goto LABEL_7;
  }
  objc_msgSend_setQoSFromSwiftTaskPriority(self, v36, v37, v38);
LABEL_9:
  uint64_t v49 = objc_msgSend_configuration(self, v24, v25, v26);
  if ((objc_msgSend_hasDiscretionaryNetworkBehavior(v49, v50, v51, v52) & 1) == 0)
  {
    uint64_t v56 = objc_msgSend_group(self, v53, v54, v55);
    uint64_t v60 = objc_msgSend_defaultConfiguration(v56, v57, v58, v59);
    if ((objc_msgSend_hasDiscretionaryNetworkBehavior(v60, v61, v62, v63) & 1) == 0)
    {
      if (v127)
      {
        uint64_t v67 = objc_msgSend_configuration(v127, v64, v65, v66);
        if (objc_msgSend_hasDiscretionaryNetworkBehavior(v67, v68, v69, v70))
        {

          goto LABEL_14;
        }
        uint64_t v77 = objc_msgSend_group(v127, v71, v72, v73);
        uint64_t v81 = objc_msgSend_defaultConfiguration(v77, v78, v79, v80);
        char hasDiscretionaryNetworkBehavior = objc_msgSend_hasDiscretionaryNetworkBehavior(v81, v82, v83, v84);

        if (hasDiscretionaryNetworkBehavior) {
          goto LABEL_19;
        }
      }
      else
      {
      }
      uint64_t v49 = objc_msgSend_configuration(self, v74, v75, v76);
      objc_msgSend_setDiscretionaryNetworkBehavior_(v49, v86, 0, v87);
      goto LABEL_18;
    }
LABEL_14:
  }
LABEL_18:

LABEL_19:
  uint64_t v88 = objc_msgSend_configuration(self, v74, v75, v76);
  if ((objc_msgSend_hasAutomaticallyRetryNetworkFailures(v88, v89, v90, v91) & 1) == 0)
  {
    uint64_t v95 = objc_msgSend_group(self, v92, v93, v94);
    uint64_t v99 = objc_msgSend_defaultConfiguration(v95, v96, v97, v98);
    if ((objc_msgSend_hasAutomaticallyRetryNetworkFailures(v99, v100, v101, v102) & 1) == 0)
    {
      if (v127)
      {
        uint64_t v106 = objc_msgSend_configuration(v127, v103, v104, v105);
        if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v106, v107, v108, v109))
        {

          goto LABEL_24;
        }
        uint64_t v116 = objc_msgSend_group(v127, v110, v111, v112);
        uint64_t v120 = objc_msgSend_defaultConfiguration(v116, v117, v118, v119);
        char hasAutomaticallyRetryNetworkFailures = objc_msgSend_hasAutomaticallyRetryNetworkFailures(v120, v121, v122, v123);

        if (hasAutomaticallyRetryNetworkFailures) {
          goto LABEL_29;
        }
      }
      else
      {
      }
      uint64_t v88 = objc_msgSend_configuration(self, v113, v114, v115);
      objc_msgSend_setAutomaticallyRetryNetworkFailures_(v88, v125, 0, v126);
      goto LABEL_28;
    }
LABEL_24:
  }
LABEL_28:

LABEL_29:
}

- (void)withContainerScopedDaemon:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v8 = objc_msgSend_configuration(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_container(v8, v9, v10, v11);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B0DE4FC;
  v16[3] = &unk_1E5464188;
  v16[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B0DE57C;
  v14[3] = &unk_1E5464110;
  objc_copyWeak(&v15, &location);
  objc_msgSend_getContainerScopedDaemonProxyWithRetryHandler_errorHandler_daemonProxyHandler_(v12, v13, (uint64_t)v16, (uint64_t)v14, v4);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (BOOL)usesBackgroundSession
{
  uint64_t v5 = objc_msgSend_configuration(self, a2, v2, v3);
  char v9 = objc_msgSend_automaticallyRetryNetworkFailures(v5, v6, v7, v8);

  uint64_t v13 = objc_msgSend_configuration(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_discretionaryNetworkBehavior(v13, v14, v15, v16);

  if (v17) {
    BOOL result = 1;
  }
  else {
    BOOL result = v9;
  }
  self->_usesBackgroundSession = result;
  return result;
}

+ (void)setOperationIDPrefix:(id)a3
{
  id v4 = a3;
  id obj = a1;
  objc_sync_enter(obj);
  uint64_t v5 = (void *)qword_1E912FDF0;
  qword_1E912FDF0 = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (NSString)operationIDPrefix
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)qword_1E912FDF0;
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)handleWillStart:(id)a3
{
  id v9 = a3;
  uint64_t v7 = objc_msgSend_callbackQueue(self, v4, v5, v6);
  dispatch_assert_queue_V2(v7);

  if (self && !self->_remoteOperationState) {
    self->_remoteOperationState = 1;
  }
  uint64_t v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
    uint64_t v8 = v9;
  }
}

- (void)handleDidStart:(id)a3
{
  id v9 = a3;
  uint64_t v7 = objc_msgSend_callbackQueue(self, v4, v5, v6);
  dispatch_assert_queue_V2(v7);

  if (self && self->_remoteOperationState <= 1u) {
    self->_remoteOperationState = 2;
  }
  uint64_t v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
    uint64_t v8 = v9;
  }
}

- (void)handleLongLivedOperationDidPersist
{
  uint64_t v5 = objc_msgSend_callbackQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  id v9 = objc_msgSend_longLivedOperationWasPersistedBlock(self, v6, v7, v8);

  if (v9)
  {
    objc_msgSend_longLivedOperationWasPersistedBlock(self, v10, v11, v12);
    uint64_t v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v13[2]();
  }
}

- (void)handleSystemDidImposeInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_callbackQueue(self, v5, v6, v7);
  dispatch_assert_queue_V2(v8);

  objc_msgSend_group(self, v9, v10, v11);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSystemImposedInfo_(v14, v12, (uint64_t)v4, v13);
}

- (void)handleRequestDidComplete:(id)a3
{
  id v16 = a3;
  uint64_t v7 = objc_msgSend_callbackQueue(self, v4, v5, v6);
  dispatch_assert_queue_V2(v7);

  uint64_t v11 = objc_msgSend_requestCompletedBlock(self, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_requestCompletedBlock(self, v12, v13, v14);
    uint64_t v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v15)[2](v15, v16);
  }
}

- (void)openFileWithOpenInfo:(id)a3 reply:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_assetDownloadStagingInfo(v27, v7, v8, v9);

  if (v10)
  {
    uint64_t v14 = objc_msgSend_resolvedConfiguration(self, v11, v12, v13);
    uint64_t v18 = objc_msgSend_assetDownloadStagingManager(v14, v15, v16, v17);
    objc_msgSend_setAssetDownloadStagingManager_(v27, v19, (uint64_t)v18, v20);
  }
  uint64_t v21 = objc_msgSend_deviceContext(self, v11, v12, v13);
  uint64_t v25 = objc_msgSend_deviceScopedStateManager(v21, v22, v23, v24);
  objc_msgSend_openFileWithOpenInfo_reply_(v25, v26, (uint64_t)v27, (uint64_t)v6);
}

- (void)handleFinishWithAssetDownloadStagingInfo:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(id, id, id, id))a4;
  id v7 = a3;
  uint64_t v11 = objc_msgSend_callbackQueue(self, v8, v9, v10);
  dispatch_assert_queue_V2(v11);

  uint64_t v15 = objc_msgSend_resolvedConfiguration(self, v12, v13, v14);
  uint64_t v19 = objc_msgSend_assetDownloadStagingManager(v15, v16, v17, v18);
  id v27 = 0;
  id v28 = 0;
  id v26 = 0;
  char v21 = objc_msgSend_finishWithAssetDownloadStagingInfo_fileURL_fileHandle_error_(v19, v20, (uint64_t)v7, (uint64_t)&v28, &v27, &v26);

  id v22 = v28;
  id v23 = v27;
  id v24 = v26;

  if ((v21 & 1) == 0)
  {

    if (!v24)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v25, @"CKInternalErrorDomain", 1000, @"Unknown error invoking finishWithAssetDownloadStagingInfo.");
      id v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v22 = 0;
    id v23 = 0;
  }
  v6[2](v6, v22, v23, v24);
}

- (void)handleDiscretionaryOperationShouldStart:(BOOL)a3 nonDiscretionary:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  uint64_t v13 = objc_msgSend_callbackQueue(self, v10, v11, v12);
  dispatch_assert_queue_V2(v13);

  if (self)
  {
    if (self->_startedDiscretionaryOperation)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v17 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v107 = v9;
        _os_log_debug_impl(&dword_18AF10000, v17, OS_LOG_TYPE_DEBUG, "Ignoring duplicate call to start with error %@", buf, 0xCu);
      }
      goto LABEL_52;
    }
    self->_startedDiscretionaryOperation = 1;
  }
  if (__sTestOverridesAvailable)
  {
    id v18 = (id)objc_msgSend_invokeOperationMeetsDiscretionaryCriteriaCallback(self, v14, v15, v16);
    objc_msgSend_setOperationMeetsDiscretionaryCriteriaCallback_(self, v19, 0, v20);
  }
  id v24 = v9;
  if (__sTestOverridesAvailable && objc_msgSend_forceCKDiscretionarydFailure(self, v21, v22, v23))
  {

    id v24 = 0;
    objc_msgSend_domain(0, v25, v26, v27);
  }
  else
  {
    if (v6)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v28 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v95 = v28;
        uint64_t v99 = objc_msgSend_operationID(self, v96, v97, v98);
        *(_DWORD *)buf = 138412290;
        id v107 = v99;
        _os_log_debug_impl(&dword_18AF10000, v95, OS_LOG_TYPE_DEBUG, "Discretionary operation %@ started", buf, 0xCu);
      }
      uint64_t v32 = objc_msgSend_operationMetric(self, v29, v30, v31);
      int v35 = objc_msgSend_numberWithBool_(NSNumber, v33, v5, v34);
      objc_msgSend_setObject_forKeyedSubscript_(v32, v36, (uint64_t)v35, @"ckdiscretionaryd_nonDiscretionary");

      uint64_t v40 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v37, v38, v39);
      objc_msgSend_setObject_forKeyedSubscript_(v32, v41, (uint64_t)v40, @"ckdiscretionaryd_startTime");

      if (self)
      {
        uint64_t v42 = 2;
        if (v5) {
          uint64_t v42 = 3;
        }
        *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CKOperation__operationID[v42]) = (Class)1;
      }

      goto LABEL_41;
    }
    objc_msgSend_domain(v24, v21, v22, v23);
  uint64_t v46 = };
  if (objc_msgSend_isEqualToString_(v46, v47, *MEMORY[0x1E4F281F8], v48))
  {
    uint64_t v52 = objc_msgSend_code(v24, v49, v50, v51);

    if (v52 == 4099)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v56 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v107 = v24;
        _os_log_impl(&dword_18AF10000, v56, OS_LOG_TYPE_INFO, "ckdiscretionaryd failed to schedule with error %@, falling back to per-task scheduling.", buf, 0xCu);
      }
      if (self) {
        self->_systemScheduler = 0;
      }
      goto LABEL_41;
    }
  }
  else
  {
  }
  if (!v24)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v53, @"CKInternalErrorDomain", 1000, @"Error scheduling discretionary task.");
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v57 = objc_msgSend_CKClientSuitableError(v24, v53, v54, v55);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v58 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v107 = v57;
    _os_log_error_impl(&dword_18AF10000, v58, OS_LOG_TYPE_ERROR, "ckdiscretionaryd failed to schedule with error %@.", buf, 0xCu);
    if (!self) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  if (self) {
LABEL_39:
  }
    self->_failedToScheduleDiscretionaryOperation = 1;
LABEL_40:
  objc_msgSend_finishWithError_(self, v59, (uint64_t)v57, v60);

LABEL_41:
  uint64_t v61 = objc_msgSend_configuration(self, v43, v44, v45);
  uint64_t v65 = objc_msgSend_container(v61, v62, v63, v64);

  if (!v65)
  {
    uint64_t v100 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v66, v67, v68);
    uint64_t v104 = objc_msgSend_operationID(self, v101, v102, v103);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v100, v105, (uint64_t)a2, (uint64_t)self, @"CKOperation.m", 1396, @"No container found to run operation %@", v104);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v69 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    uint64_t v73 = v69;
    BOOL v74 = (objc_class *)objc_opt_class();
    uint64_t v75 = NSStringFromClass(v74);
    uint64_t v79 = objc_msgSend_ckShortDescription(self, v76, v77, v78);
    *(_DWORD *)buf = 138543874;
    id v107 = v75;
    __int16 v108 = 2048;
    uint64_t v109 = self;
    __int16 v110 = 2114;
    uint64_t v111 = v79;
    _os_log_impl(&dword_18AF10000, v73, OS_LOG_TYPE_INFO, "Operation <%{public}@: %p; %{public}@> enqueuing on container throttle queue",
      buf,
      0x20u);
  }
  uint64_t v81 = objc_msgSend__createPlaceholderOperation(self, v70, v71, v72);
  if (self) {
    objc_setProperty_atomic(self, v80, v81, 448);
  }

  uint64_t v85 = objc_msgSend_configuration(self, v82, v83, v84);
  uint64_t v91 = objc_msgSend_container(v85, v86, v87, v88);
  if (self)
  {
    id Property = objc_getProperty(self, v89, 448, 1);
    objc_msgSend_addPreparedOperationToDiscretionaryThrottlingOperationQueue_(v91, v93, (uint64_t)Property, v94);
  }
  else
  {
    objc_msgSend_addPreparedOperationToDiscretionaryThrottlingOperationQueue_(v91, v89, 0, v90);
  }

LABEL_52:
}

- (void)handleDiscretionaryOperationShouldSuspend
{
  BOOL v5 = objc_msgSend_callbackQueue(self, a2, v2, v3);
  dispatch_assert_queue_V2(v5);

  if (self) {
    self->_isDiscretionarySuspended = 1;
  }
  objc_msgSend__cancelDaemonOperation(self, v6, v7, v8);
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v9, @"CKErrorDomain", 4, @"System conditions no longer appropriate.");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  sub_18B0DC68C(self, v10);
}

- (void)handleDaemonOperationWillStartWithClassName:(id)a3 isTopLevelDaemonOperation:(BOOL)a4 replyBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v11 = (void (**)(id, void *, void))a5;
  if (__sTestOverridesAvailable)
  {
    if (v6) {
      objc_msgSend_invokeDaemonOperationWillStartCallback_(self, v9, (uint64_t)v8, v10);
    }
    else {
    uint64_t v14 = objc_msgSend_invokeDaemonChildOperationWillStartCallback_(self, v9, (uint64_t)v8, v10);
    }
    v11[2](v11, v14, 0);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v12 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = v12;
      uint64_t v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      char v21 = objc_msgSend_ckShortDescription(self, v18, v19, v20);
      int v22 = 138544130;
      uint64_t v23 = v17;
      __int16 v24 = 2048;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_error_impl(&dword_18AF10000, v15, OS_LOG_TYPE_ERROR, "Operation <%{public}@: %p; %{public}@> unexpectedly asked about a daemon operation while not testing: %@",
        (uint8_t *)&v22,
        0x2Au);
    }
    uint64_t v14 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v13, @"CKInternalErrorDomain", 1000, @"Did not expect to be asked about a daemon operation while not testing");
    ((void (**)(id, void *, void *))v11)[2](v11, 0, v14);
  }
}

- (void)handleDaemonRequestWillSendWithClassName:(id)a3 testRequestProperties:(id)a4 replyBlock:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (__sTestOverridesAvailable)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_18B0DF830;
    v23[3] = &unk_1E54641B0;
    id v24 = v10;
    objc_msgSend_handleURLRequestWillSendCallback_testRequestProperties_proceedBlock_(self, v12, (uint64_t)v8, (uint64_t)v9, v23);
    uint64_t v13 = v24;
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v14 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v14;
      uint64_t v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      int v22 = objc_msgSend_ckShortDescription(self, v19, v20, v21);
      *(_DWORD *)buf = 138544130;
      __int16 v26 = v18;
      __int16 v27 = 2048;
      __int16 v28 = self;
      __int16 v29 = 2114;
      uint64_t v30 = v22;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_error_impl(&dword_18AF10000, v16, OS_LOG_TYPE_ERROR, "Operation <%{public}@: %p; %{public}@> unexpectedly asked about a daemon request while not testing: %@",
        buf,
        0x2Au);
    }
    uint64_t v13 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v15, @"CKInternalErrorDomain", 1000, @"Did not expect to be asked about a daemon url request while not testing");
    ((void (**)(void, void, void *))v11)[2](v11, 0, v13);
  }
}

- (void)handleDaemonRequestWillReceiveWithClassName:(id)a3 testRequestProperties:(id)a4 replyBlock:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (__sTestOverridesAvailable)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_18B0DFA7C;
    v23[3] = &unk_1E54641B0;
    id v24 = v10;
    objc_msgSend_handleURLRequestWillReceiveCallback_testRequestProperties_proceedBlock_(self, v12, (uint64_t)v8, (uint64_t)v9, v23);
    uint64_t v13 = v24;
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v14 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v14;
      uint64_t v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      int v22 = objc_msgSend_ckShortDescription(self, v19, v20, v21);
      *(_DWORD *)buf = 138544130;
      __int16 v26 = v18;
      __int16 v27 = 2048;
      __int16 v28 = self;
      __int16 v29 = 2114;
      uint64_t v30 = v22;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_error_impl(&dword_18AF10000, v16, OS_LOG_TYPE_ERROR, "Operation <%{public}@: %p; %{public}@> unexpectedly asked about a daemon request while not testing: %@",
        buf,
        0x2Au);
    }
    uint64_t v13 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v15, @"CKInternalErrorDomain", 1000, @"Did not expect to be asked about a daemon url request while not testing");
    ((void (**)(void, void, void *))v11)[2](v11, 0, v13);
  }
}

- (void)handleOperationDidCompleteWithMetrics:(id)a3 error:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_callbackQueue(self, v8, v9, v10);
  dispatch_assert_queue_V2(v11);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v12 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = v12;
    uint64_t v19 = objc_msgSend_operationID(self, v16, v17, v18);
    int v20 = 138543874;
    uint64_t v21 = v19;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_debug_impl(&dword_18AF10000, v15, OS_LOG_TYPE_DEBUG, "Received completion callback for operation %{public}@ with metrics %@ error %@", (uint8_t *)&v20, 0x20u);
  }
  objc_msgSend_setMetrics_(self, v13, (uint64_t)v6, v14);
  sub_18B0DC68C(self, v7);
}

- (void)_handleRemoteProxyFailureWithError:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  BOOL v5 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = v5;
    uint64_t v15 = objc_msgSend_operationID(self, v12, v13, v14);
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_error_impl(&dword_18AF10000, v11, OS_LOG_TYPE_ERROR, "Got a connection error for operation %{public}@: %@", buf, 0x16u);
  }
  uint64_t v9 = objc_msgSend_callbackQueue(self, v6, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B0DFD88;
  v16[3] = &unk_1E5461F80;
  v16[4] = self;
  id v17 = v4;
  id v10 = v4;
  dispatch_async(v9, v16);
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_callbackQueue(self, v5, v6, v7);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B0DFED4;
  v10[3] = &unk_1E5461F80;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)_performErrorRateMitigation
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&stru_1EB279A0C);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v3, v4, v5);
  *(double *)&uint64_t v7 = v6;
  if (byte_1EB279A08)
  {
    double v8 = v6 - *(double *)&qword_1EB279A20;
    qword_1EB279A20 = *(void *)&v6;
    if (v8 >= 20.0)
    {
      byte_1EB279A08 = 0;
      *(_OWORD *)&qword_1EB279A10 = 0u;
      *(_OWORD *)&qword_1EB279A30 = 0u;
      *(_OWORD *)&qword_1EB279A20 = 0u;
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      __int16 v20 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AF10000, v20, OS_LOG_TYPE_INFO, "Error rate mitigation deactivated. CloudKit will no longer slow failing operations.", buf, 2u);
      }
    }
    else
    {
      double v9 = v8 - *(double *)&qword_1EB279A38;
      double v10 = (v8 - *(double *)&qword_1EB279A38) * 0.1 + *(double *)&qword_1EB279A30 * 0.9;
      double v11 = 10.0 - v10;
      if (10.0 - v10 <= 10.0) {
        double v12 = 10.0 - v10;
      }
      else {
        double v12 = 10.0;
      }
      *(double *)&qword_1EB279A30 = (v8 - *(double *)&qword_1EB279A38) * 0.1 + *(double *)&qword_1EB279A30 * 0.9;
      qword_1EB279A38 = *(void *)&v12;
      if (*(double *)&v7 - *(double *)&qword_1EB279A10 < 60.0) {
        *(double *)&qword_1EB279A38 = v12
      }
                                    * ((erf((*(double *)&v7 - *(double *)&qword_1EB279A10) / 60.0 * 4.0 + -2.0) + 1.0)
                                     * 0.5);
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v13 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219008;
        uint64_t v66 = *(void *)&v11;
        __int16 v67 = 2048;
        uint64_t v68 = qword_1EB279A38;
        __int16 v69 = 2048;
        double v70 = v8;
        __int16 v71 = 2048;
        double v72 = v9;
        __int16 v73 = 2048;
        uint64_t v74 = qword_1EB279A30;
        uint64_t v14 = "mitigation: rawDelay = %f, delay = %f, errorGap = %f, errorTime = %f, errorInterval = %f";
        uint64_t v15 = v13;
        uint32_t v16 = 52;
LABEL_32:
        _os_log_debug_impl(&dword_18AF10000, v15, OS_LOG_TYPE_DEBUG, v14, buf, v16);
      }
    }
  }
  else
  {
    double v17 = v6 - *(double *)&qword_1EB279A18;
    if (*(double *)&v7 - *(double *)&qword_1EB279A18 <= 10.0)
    {
      if ((unint64_t)++qword_1EB279A28 >= 6)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v21 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v66 = qword_1EB279A28;
          __int16 v67 = 2048;
          uint64_t v68 = 10;
          uint64_t v14 = "Approaching error rate limiting trigger: count = %llu, trigger = %llu";
          uint64_t v15 = v21;
          uint32_t v16 = 22;
          goto LABEL_32;
        }
      }
    }
    else if (v17 < 20.0 && (unint64_t)qword_1EB279A28 >= 0xB)
    {
      byte_1EB279A08 = 1;
      *(double *)&qword_1EB279A30 = v17 / (double)(unint64_t)qword_1EB279A28;
      qword_1EB279A18 = v7;
      qword_1EB279A20 = v7;
      qword_1EB279A10 = v7;
      qword_1EB279A28 = 1;
      qword_1EB279A38 = 0;
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v22 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AF10000, v22, OS_LOG_TYPE_ERROR, "Error rate mitigation activated due to high rate of failing operations. CloudKit will slow failing operations.", buf, 2u);
      }
    }
    else
    {
      if ((unint64_t)qword_1EB279A28 >= 6)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v19 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_18AF10000, v19, OS_LOG_TYPE_DEBUG, "Error rate limiting trigger not reached. Resetting error count.", buf, 2u);
        }
      }
      qword_1EB279A28 = 1;
      qword_1EB279A18 = v7;
    }
  }
  os_unfair_lock_unlock(&stru_1EB279A0C);
  if (*(double *)&qword_1EB279A38 > 0.0)
  {
    id v23 = CKDescriptionForTimeInterval(*(double *)&qword_1EB279A38);
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    __int16 v24 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v66 = (uint64_t)v23;
      __int16 v67 = 2114;
      uint64_t v68 = (uint64_t)self;
      _os_log_impl(&dword_18AF10000, v24, OS_LOG_TYPE_INFO, "CloudKit is applying an error rate mitigation delay of %{public}@ to operation %{public}@.", buf, 0x16u);
    }
    objc_msgSend_sleepForTimeInterval_(MEMORY[0x1E4F29060], v25, v26, v27, *(double *)&qword_1EB279A38);
    __int16 v31 = objc_msgSend_error(self, v28, v29, v30);
    int v35 = objc_msgSend_domain(v31, v32, v33, v34);
    uint64_t v39 = objc_msgSend_code(v31, v36, v37, v38);
    uint64_t v43 = objc_msgSend_userInfo(v31, v40, v41, v42);
    uint64_t v47 = objc_msgSend_mutableCopy(v43, v44, v45, v46);

    if (!v47)
    {
      id v50 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v47 = objc_msgSend_initWithCapacity_(v50, v51, 1, v52);
    }
    uint64_t v53 = objc_msgSend_stringWithFormat_(NSString, v48, @"This operation was delayed by %@ due to high rate of operation errors.", v49, v23);
    objc_msgSend_setObject_forKey_(v47, v54, (uint64_t)v53, @"CKErrorMitigationMessageKey");
    if (byte_1E912FED0)
    {
      uint64_t v58 = objc_msgSend_numberWithDouble_(NSNumber, v55, v56, v57, *(double *)&qword_1EB279A38);
      objc_msgSend_setObject_forKey_(v47, v59, (uint64_t)v58, @"CKErrorMitigationDelaySeconds");
    }
    id v60 = objc_alloc((Class)objc_opt_class());
    uint64_t v62 = objc_msgSend_initWithDomain_code_userInfo_(v60, v61, (uint64_t)v35, v39, v47);
    objc_msgSend_setError_(self, v63, (uint64_t)v62, v64);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v433 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v9 = objc_msgSend_callbackQueue(self, v6, v7, v8);
  dispatch_assert_queue_V2(v9);

  if (objc_msgSend_isFinished(self, v10, v11, v12))
  {
    v415 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v15);
    v419 = objc_msgSend_operationID(self, v416, v417, v418);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v415, v420, (uint64_t)a2, (uint64_t)self, @"CKOperation.m", 1667, @"Operation %@ was already marked as finished", v419);
  }
  objc_msgSend_setLongLivedOperationWasPersistedBlock_(self, v13, 0, v15);
  objc_msgSend_setRequestCompletedBlock_(self, v16, 0, v17);
  uint64_t v21 = objc_msgSend_error(self, v18, v19, v20);
  __int16 v24 = (__CFString *)v21;
  if (v5 && !v21)
  {
    objc_msgSend_setError_(self, v22, (uint64_t)v5, v23);
    __int16 v24 = (__CFString *)v5;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v25 = (void *)ck_log_facility_op;
  if (os_log_type_enabled((os_log_t)ck_log_facility_op, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = v25;
    uint64_t v30 = (objc_class *)objc_opt_class();
    __int16 v31 = NSStringFromClass(v30);
    uint64_t v33 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v32, 1, 0, 0);
    uint64_t v37 = objc_msgSend_CKPropertiesStyleString(v33, v34, v35, v36);
    uint64_t v39 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v38, 0, 1, 0);
    uint64_t v43 = objc_msgSend_CKPropertiesStyleString(v39, v40, v41, v42);
    uint64_t v44 = (void *)v43;
    *(_DWORD *)buf = 138544642;
    uint64_t v45 = @" with error: ";
    v422 = v31;
    uint64_t v46 = &stru_1ED7F5C98;
    __int16 v423 = 2048;
    if (!v24) {
      uint64_t v45 = &stru_1ED7F5C98;
    }
    v424 = self;
    if (v24) {
      uint64_t v46 = v24;
    }
    __int16 v425 = 2114;
    v426 = v37;
    __int16 v427 = 2112;
    uint64_t v428 = v43;
    __int16 v429 = 2114;
    v430 = v45;
    __int16 v431 = 2114;
    v432 = v46;
    _os_log_impl(&dword_18AF10000, v29, OS_LOG_TYPE_DEFAULT, "Finished operation <%{public}@: %p; %{public}@, %@> %{public}@%{public}@",
      buf,
      0x3Eu);
  }
  if (self->_xpcActivityEligibilityChangedHandler)
  {
    xpc_activity_remove_eligibility_changed_handler();
    self->_xpcActivityEligibilityChangedHandler = 0;
  }
  if (v24)
  {
    if (!__sTestOverridesAvailable
      || (objc_msgSend_unitTestOverrides(self, v26, v27, v28),
          uint64_t v47 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectForKeyedSubscript_(v47, v48, @"doErrorRateMitigationInUnitTests", v49),
          id v50 = objc_claimAutoreleasedReturnValue(),
          int v54 = objc_msgSend_BOOLValue(v50, v51, v52, v53),
          v50,
          v47,
          v54))
    {
      objc_msgSend__performErrorRateMitigation(self, v26, v27, v28);
    }
  }
  objc_msgSend_transitionToFinished(self, v26, v27, v28);
  uint64_t v58 = objc_msgSend_clientOperationCallbackProxy(self, v55, v56, v57);
  objc_msgSend_invalidate(v58, v59, v60, v61);

  if ((objc_msgSend_isOutstandingOperation(self, v62, v63, v64) & 1) != 0
    || (objc_msgSend_configuration(self, v65, v66, v67),
        uint64_t v68 = objc_claimAutoreleasedReturnValue(),
        int isLongLived = objc_msgSend_isLongLived(v68, v69, v70, v71),
        v68,
        isLongLived))
  {
    if (__sTestOverridesAvailable) {
      uint64_t v73 = objc_msgSend_allowResumingCompletedLongLivedOperations(self, v65, v66, v67);
    }
    else {
      uint64_t v73 = 0;
    }
    uint64_t v74 = objc_msgSend_deviceContext(self, v65, v66, v67);
    uint64_t v78 = objc_msgSend_deviceScopedStateManager(v74, v75, v76, v77);
    uint64_t v82 = objc_msgSend_operationID(self, v79, v80, v81);
    objc_msgSend_registerLongLivedOperationWithIDAsCompleted_allowResumingCompletedLongLivedOperations_(v78, v83, (uint64_t)v82, v73);
  }
  uint64_t v84 = objc_msgSend_operationMetric(self, v65, v66, v67);
  uint64_t v88 = objc_msgSend_metrics(self, v85, v86, v87);
  uint64_t v92 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v89, v90, v91);
  objc_msgSend_setEndTime_(v84, v93, (uint64_t)v92, v94);

  uint64_t v97 = objc_msgSend_numberWithBool_(NSNumber, v95, v24 != 0, v96);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v98, (uint64_t)v97, @"finishedWithError");

  uint64_t v102 = objc_msgSend_CKClientSuitableError(v24, v99, v100, v101);
  uint64_t v103 = CKErrorChainStringFromError(v102);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v104, (uint64_t)v103, @"finishedWithErrorChain");

  uint64_t v105 = NSNumber;
  uint64_t isCancelled = objc_msgSend_isCancelled(self, v106, v107, v108);
  uint64_t v112 = objc_msgSend_numberWithBool_(v105, v110, isCancelled, v111);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v113, (uint64_t)v112, @"wasCancelled");

  uint64_t v117 = objc_msgSend_qualityOfService(self, v114, v115, v116);
  v121 = CKStringForQOS(v117, v118, v119, v120);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v122, (uint64_t)v121, @"qualityOfService");

  uint64_t v123 = NSNumber;
  id v127 = objc_msgSend_resolvedConfiguration(self, v124, v125, v126);
  uint64_t v131 = objc_msgSend_isLongLived(v127, v128, v129, v130);
  uint64_t v134 = objc_msgSend_numberWithBool_(v123, v132, v131, v133);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v135, (uint64_t)v134, @"isLongLived");

  unint64_t systemScheduler = self->_systemScheduler;
  if (systemScheduler > 3) {
    objc_msgSend_setObject_forKeyedSubscript_(v84, v136, @"xpcActivity", @"systemScheduler");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v84, v136, (uint64_t)off_1E54641D0[systemScheduler], @"systemScheduler");
  }
  uint64_t v141 = NSNumber;
  unint64_t v142 = objc_msgSend_cloudKitMetrics(v88, v138, v139, v140);
  uint64_t v146 = objc_msgSend_bytesUploaded(v142, v143, v144, v145);
  uint64_t v149 = objc_msgSend_numberWithUnsignedInteger_(v141, v147, v146, v148);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v150, (uint64_t)v149, @"bytesUploaded");

  v151 = NSNumber;
  long long v155 = objc_msgSend_cloudKitMetrics(v88, v152, v153, v154);
  uint64_t v159 = objc_msgSend_bytesDownloaded(v155, v156, v157, v158);
  v162 = objc_msgSend_numberWithUnsignedInteger_(v151, v160, v159, v161);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v163, (uint64_t)v162, @"bytesDownloaded");

  v164 = NSNumber;
  v168 = objc_msgSend_MMCSMetrics(v88, v165, v166, v167);
  uint64_t v172 = objc_msgSend_bytesUploaded(v168, v169, v170, v171);
  uint64_t v175 = objc_msgSend_numberWithUnsignedInteger_(v164, v173, v172, v174);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v176, (uint64_t)v175, @"mmcsBytesUploaded");

  uint64_t v177 = NSNumber;
  id v181 = objc_msgSend_MMCSMetrics(v88, v178, v179, v180);
  uint64_t v185 = objc_msgSend_bytesDownloaded(v181, v182, v183, v184);
  uint64_t v188 = objc_msgSend_numberWithUnsignedInteger_(v177, v186, v185, v187);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v189, (uint64_t)v188, @"mmcsBytesDownloaded");

  v193 = objc_msgSend_MMCSMetrics(v88, v190, v191, v192);
  uint64_t v197 = objc_msgSend_bytesFulfilledLocally(v193, v194, v195, v196);

  v200 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v198, v197, v199);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v201, (uint64_t)v200, @"bytesFulfilledLocally");

  v202 = NSNumber;
  v206 = objc_msgSend_MMCSMetrics(v88, v203, v204, v205);
  uint64_t v210 = objc_msgSend_bytesFulfilledByPeers(v206, v207, v208, v209);
  v213 = objc_msgSend_numberWithUnsignedLongLong_(v202, v211, v210, v212);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v214, (uint64_t)v213, @"bytesFulfilledByPeers");

  v215 = NSNumber;
  v219 = objc_msgSend_MMCSMetrics(v88, v216, v217, v218);
  uint64_t v223 = objc_msgSend_bytesResumed(v219, v220, v221, v222);
  v226 = objc_msgSend_numberWithUnsignedLongLong_(v215, v224, v223 + v197, v225);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v227, (uint64_t)v226, @"bytesFulfilled");

  v228 = NSNumber;
  v232 = objc_msgSend_cloudKitMetrics(v88, v229, v230, v231);
  uint64_t v236 = objc_msgSend_walrusEnabled(v232, v233, v234, v235);
  v239 = objc_msgSend_numberWithBool_(v228, v237, v236, v238);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v240, (uint64_t)v239, @"adpEnabled");

  v241 = NSNumber;
  v245 = objc_msgSend_cloudKitMetrics(v88, v242, v243, v244);
  uint64_t v249 = objc_msgSend_zoneishKeysRolled(v245, v246, v247, v248);
  v252 = objc_msgSend_numberWithUnsignedInteger_(v241, v250, v249, v251);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v253, (uint64_t)v252, @"zoneishKeysRolled");

  v254 = NSNumber;
  v258 = objc_msgSend_cloudKitMetrics(v88, v255, v256, v257);
  uint64_t v262 = objc_msgSend_perRecordKeysRolled(v258, v259, v260, v261);
  v265 = objc_msgSend_numberWithUnsignedInteger_(v254, v263, v262, v264);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v266, (uint64_t)v265, @"perRecordKeysRolled");

  v267 = NSNumber;
  v271 = objc_msgSend_cloudKitMetrics(v88, v268, v269, v270);
  uint64_t v275 = objc_msgSend_zoneKeysRolled(v271, v272, v273, v274);
  v278 = objc_msgSend_numberWithUnsignedInteger_(v267, v276, v275, v277);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v279, (uint64_t)v278, @"zoneKeysRolled");

  v280 = NSNumber;
  v284 = objc_msgSend_cloudKitMetrics(v88, v281, v282, v283);
  uint64_t v288 = objc_msgSend_shareKeysRolled(v284, v285, v286, v287);
  v291 = objc_msgSend_numberWithUnsignedInteger_(v280, v289, v288, v290);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v292, (uint64_t)v291, @"shareKeysRolled");

  v293 = NSNumber;
  v297 = objc_msgSend_cloudKitMetrics(v88, v294, v295, v296);
  uint64_t v301 = objc_msgSend_keyRollsSkippedBySizeCheck(v297, v298, v299, v300);
  v304 = objc_msgSend_numberWithUnsignedInteger_(v293, v302, v301, v303);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v305, (uint64_t)v304, @"keyRollsSkippedBySizeCheck");

  v309 = objc_msgSend_resolvedConfiguration(self, v306, v307, v308);
  uint64_t v313 = objc_msgSend_requestOriginator(v309, v310, v311, v312);
  v316 = objc_msgSend_requestOriginatorStringRepresentation_(CKOperation, v314, v313, v315);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v317, (uint64_t)v316, @"requestOriginator");

  v318 = NSNumber;
  v322 = objc_msgSend_cloudKitMetrics(v88, v319, v320, v321);
  uint64_t v326 = objc_msgSend_zoneKeysRemoved(v322, v323, v324, v325);
  v329 = objc_msgSend_numberWithUnsignedInteger_(v318, v327, v326, v328);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v330, (uint64_t)v329, @"zoneKeysRemoved");

  v331 = NSNumber;
  v335 = objc_msgSend_cloudKitMetrics(v88, v332, v333, v334);
  uint64_t v339 = objc_msgSend_zoneishKeysRemoved(v335, v336, v337, v338);
  v342 = objc_msgSend_numberWithUnsignedInteger_(v331, v340, v339, v341);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v343, (uint64_t)v342, @"zoneishKeysRemoved");

  v344 = NSNumber;
  v348 = objc_msgSend_cloudKitMetrics(v88, v345, v346, v347);
  uint64_t v352 = objc_msgSend_recordKeysRemoved(v348, v349, v350, v351);
  v355 = objc_msgSend_numberWithUnsignedInteger_(v344, v353, v352, v354);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v356, (uint64_t)v355, @"recordKeysRemoved");

  v357 = NSNumber;
  v361 = objc_msgSend_cloudKitMetrics(v88, v358, v359, v360);
  uint64_t v365 = objc_msgSend_keysNotRemoved(v361, v362, v363, v364);
  v368 = objc_msgSend_numberWithUnsignedInteger_(v357, v366, v365, v367);
  objc_msgSend_setObject_forKeyedSubscript_(v84, v369, (uint64_t)v368, @"keysNotRemoved");

  if (objc_msgSend_code(v24, v370, v371, v372) == 7)
  {
    v376 = objc_msgSend_domain(v24, v373, v374, v375);
    int isEqualToString = objc_msgSend_isEqualToString_(v376, v377, @"CKErrorDomain", v378);

    if (isEqualToString)
    {
      v381 = objc_msgSend_userInfo(v24, v373, v380, v375);
      v384 = objc_msgSend_objectForKey_(v381, v382, *MEMORY[0x1E4F28A50], v383);
      if (objc_msgSend_code(v384, v385, v386, v387) == 2009)
      {
        v391 = objc_msgSend_domain(v384, v388, v389, v390);
        int v394 = objc_msgSend_isEqualToString_(v391, v392, @"CKInternalErrorDomain", v393);

        if (v394)
        {
          v398 = objc_msgSend_userInfo(v384, v395, v396, v397);
          v402 = objc_msgSend_objectForKey_(v398, v399, @"ThrottleLabel", v400);
          if (v402) {
            objc_msgSend_setObject_forKeyedSubscript_(v84, v401, (uint64_t)v402, @"throttleLabel");
          }
        }
      }
    }
  }
  objc_msgSend_associateWithCompletedOperation_(v84, v373, (uint64_t)self, v375);
  v406 = objc_msgSend_configuration(self, v403, v404, v405);
  v410 = objc_msgSend_container(v406, v407, v408, v409);
  objc_msgSend_submitEventMetric_(v410, v411, (uint64_t)v84, v412);

  objc_msgSend_ckSignpostEndWithError_(self, v413, (uint64_t)v24, v414);
}

- (CKOperationConfiguration)resolvedConfiguration
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  resolvedConfiguration = v2->_resolvedConfiguration;
  if (!resolvedConfiguration)
  {
    double v10 = objc_msgSend_configuration(v2, v3, v4, v5);
    if (!v10) {
      double v10 = objc_opt_new();
    }
    uint64_t v11 = objc_msgSend_group(v2, v7, v8, v9);
    uint64_t v15 = objc_msgSend_defaultConfiguration(v11, v12, v13, v14);
    objc_msgSend_resolveAgainstGenericConfiguration_(v10, v16, (uint64_t)v15, v17);
    uint64_t v18 = (CKOperationConfiguration *)objc_claimAutoreleasedReturnValue();

    id v25 = objc_msgSend_convenienceOperationConfiguration(v2, v19, v20, v21);
    if (v25)
    {
      uint64_t v26 = objc_msgSend_resolveAgainstGenericConfiguration_(v18, v22, (uint64_t)v25, v24);

      uint64_t v18 = (CKOperationConfiguration *)v26;
    }
    uint64_t v27 = objc_msgSend_group(v2, v22, v23, v24);

    if (!v27)
    {
      __int16 v31 = objc_msgSend_convenienceOperationGroup(v2, v28, v29, v30);
      objc_msgSend_setGroup_(v2, v32, (uint64_t)v31, v33);
      uint64_t v37 = objc_msgSend_defaultConfiguration(v31, v34, v35, v36);
      uint64_t v40 = objc_msgSend_resolveAgainstGenericConfiguration_(v18, v38, (uint64_t)v37, v39);

      uint64_t v18 = (CKOperationConfiguration *)v40;
    }
    if (CKMainBundleIsAppleExecutable())
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v41 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        LOWORD(v83) = 0;
        _os_log_impl(&dword_18AF10000, v41, OS_LOG_TYPE_INFO, "Operation is running within an Apple executable. Setting CKOperationDiscretionaryNetworkBehaviorNonDiscretionary and automaticallyRetryNetworkFailures to false", (uint8_t *)&v83, 2u);
      }
      if (objc_msgSend_hasDiscretionaryNetworkBehavior(v18, v42, v43, v44))
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v47 = (id)ck_log_facility_ck;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          uint64_t v51 = objc_msgSend_discretionaryNetworkBehavior(v18, v48, v49, v50);
          int v83 = 134217984;
          uint64_t v84 = v51;
          _os_log_impl(&dword_18AF10000, v47, OS_LOG_TYPE_INFO, "Operation has existing discretionaryNetworkBehavior value of: %lu", (uint8_t *)&v83, 0xCu);
        }
      }
      else
      {
        objc_msgSend_setDiscretionaryNetworkBehavior_(v18, v45, 0, v46);
      }
      if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v18, v52, v53, v54))
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v68 = (id)ck_log_facility_ck;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          int v72 = objc_msgSend_automaticallyRetryNetworkFailures(v18, v69, v70, v71);
          int v83 = 67109120;
          LODWORD(v84) = v72;
          _os_log_impl(&dword_18AF10000, v68, OS_LOG_TYPE_INFO, "Operation has existing automaticallyRetryNetworkFailures value of: %d", (uint8_t *)&v83, 8u);
        }

        goto LABEL_41;
      }
      goto LABEL_35;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v55 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      LOWORD(v83) = 0;
      _os_log_impl(&dword_18AF10000, v55, OS_LOG_TYPE_INFO, "Checking operation QoS for discretionaryNetworkBehavior configuration.", (uint8_t *)&v83, 2u);
    }
    if ((objc_msgSend_hasDiscretionaryNetworkBehavior(v18, v56, v57, v58) & 1) == 0)
    {
      uint64_t v62 = objc_msgSend_qualityOfService(v18, v59, v60, v61);
      if (v62 > 16)
      {
        uint64_t v65 = 0;
        if (v62 == 33 || v62 == 25) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
      if (v62 != 9)
      {
LABEL_38:
        uint64_t v65 = 1;
LABEL_39:
        objc_msgSend_setDiscretionaryNetworkBehavior_(v18, v63, v65, v64);
        goto LABEL_40;
      }
      objc_msgSend_setDiscretionaryNetworkBehavior_(v18, v63, 2, v64);
    }
LABEL_40:
    if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v18, v59, v60, v61)) {
      goto LABEL_41;
    }
    uint64_t v79 = objc_msgSend_qualityOfService(v18, v73, v74, v75);
    if (v79 != 33 && v79 != 25)
    {
      if (v79 == -1)
      {
        uint64_t v80 = CKCurrentProcessLinkCheck92e3e8f8ec1a906754afb22d87eb36301b4f6760() ^ 1;
        objc_msgSend_setAutomaticallyRetryNetworkFailures_(v18, v81, v80, v82);
      }
      else
      {
        objc_msgSend_setAutomaticallyRetryNetworkFailures_(v18, v66, 1, v67);
      }
      goto LABEL_41;
    }
LABEL_35:
    objc_msgSend_setAutomaticallyRetryNetworkFailures_(v18, v66, 0, v67);
LABEL_41:
    uint64_t v76 = v2->_resolvedConfiguration;
    v2->_resolvedConfiguration = v18;

    resolvedConfiguration = v2->_resolvedConfiguration;
  }
  uint64_t v77 = resolvedConfiguration;
  objc_sync_exit(v2);

  return v77;
}

- (id)resolvedConfigurationIfNotNil
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_resolvedConfiguration;
  objc_sync_exit(v2);

  return v3;
}

- (void)setQualityOfService:(int64_t)a3
{
  double v6 = objc_msgSend_configuration(self, a2, a3, v3);
  objc_msgSend_setQualityOfService_(v6, v7, a3, v8);

  objc_msgSend_qualityOfService(self, v9, v10, v11);
}

- (int64_t)qualityOfService
{
  v28.receiver = self;
  v28.super_class = (Class)CKOperation;
  id v3 = [(CKOperation *)&v28 qualityOfService];
  uint64_t v7 = objc_msgSend_configuration(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_group(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_defaultConfiguration(v11, v12, v13, v14);

  char hasQualityOfService = objc_msgSend_hasQualityOfService(v7, v16, v17, v18);
  uint64_t v23 = v7;
  if ((hasQualityOfService & 1) != 0
    || (v24 = objc_msgSend_hasQualityOfService(v15, v19, v20, v21), uint64_t v23 = v15, v25 = (int64_t)v3, v24))
  {
    int64_t v25 = objc_msgSend_qualityOfService(v23, v19, v20, v21);
  }
  if (v25 == -1) {
    int64_t v25 = objc_msgSend_qualityOfService(v7, v19, v20, v21);
  }
  if ((id)v25 != v3)
  {
    v27.receiver = self;
    v27.super_class = (Class)CKOperation;
    [(CKOperation *)&v27 setQualityOfService:v25];
  }

  return v25;
}

- (CKOperationConfiguration)configuration
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_configuration;
  objc_sync_exit(v2);

  return v3;
}

- (void)setConfiguration:(CKOperationConfiguration *)configuration
{
  uint64_t v17 = configuration;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (!v17) {
    uint64_t v17 = (CKOperationConfiguration *)objc_opt_new();
  }
  uint64_t v8 = objc_msgSend_unitTestOverrides(v4->_configuration, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v17, v9, v10, v11);
  uint64_t v13 = v4->_configuration;
  v4->_configuration = (CKOperationConfiguration *)v12;

  if (v8) {
    objc_msgSend_addUnitTestOverrides_(v4->_configuration, v14, (uint64_t)v8, v16);
  }
  objc_msgSend_qualityOfService(v4, v14, v15, v16);

  objc_sync_exit(v4);
}

- (CKOperationGroup)group
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_group;
  objc_sync_exit(v2);

  return v3;
}

- (void)setGroup:(CKOperationGroup *)group
{
  uint64_t v9 = group;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_group, group);
  objc_msgSend_qualityOfService(v5, v6, v7, v8);
  objc_sync_exit(v5);
}

- (CKOperationID)operationID
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_operationID;
  objc_sync_exit(v2);

  return v3;
}

- (void)setOperationID:(id)a3
{
  uint64_t v10 = (NSString *)a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_operationID != v10)
  {
    uint64_t v8 = objc_msgSend_copy(v10, v5, v6, v7);
    operationID = v4->_operationID;
    v4->_operationID = (NSString *)v8;
  }
  objc_sync_exit(v4);
}

- (id)containerID
{
  uint64_t v4 = objc_msgSend_configuration(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_container(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_containerID(v8, v9, v10, v11);

  return v12;
}

- (CKLogicalDeviceContext)deviceContext
{
  uint64_t v4 = objc_msgSend_configuration(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_container(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_deviceContext(v8, v9, v10, v11);

  return (CKLogicalDeviceContext *)v12;
}

- (id)unitTestOverrides
{
  uint64_t v5 = objc_msgSend_resolvedConfigurationIfNotNil(self, a2, v2, v3);
  uint64_t v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_unitTestOverrides(v5, v6, v7, v8);
  }
  else
  {
    uint64_t v11 = objc_msgSend_group(self, v6, v7, v8);
    uint64_t v15 = objc_msgSend_defaultConfiguration(v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_unitTestOverrides(v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_mutableCopy(v19, v20, v21, v22);
    int v24 = v23;
    if (v23) {
      id v25 = v23;
    }
    else {
      id v25 = (id)objc_opt_new();
    }
    uint64_t v10 = v25;

    uint64_t v29 = objc_msgSend_configuration(self, v26, v27, v28);
    uint64_t v33 = objc_msgSend_unitTestOverrides(v29, v30, v31, v32);
    objc_msgSend_addEntriesFromDictionary_(v10, v34, (uint64_t)v33, v35);
  }

  return v10;
}

- (void)addUnitTestOverrides:(id)a3
{
  id v4 = a3;
  objc_msgSend_configuration(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addUnitTestOverrides_(v10, v8, (uint64_t)v4, v9);
}

- (BOOL)_BOOLForUnitTestOverride:(id)a3 defaultValue:(BOOL)a4
{
  id v6 = a3;
  id v10 = objc_msgSend_unitTestOverrides(self, v7, v8, v9);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6, v12);

  if (v13) {
    a4 = objc_msgSend_BOOLValue(v13, v14, v15, v16);
  }

  return a4;
}

- (id)applicationBundleIdentifierForContainerAccess
{
  uint64_t v5 = objc_msgSend_operationInfo(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v5, v6, v7, v8);

  if (!v9)
  {
    uint64_t v13 = objc_msgSend_configuration(self, v10, v11, v12);
    uint64_t v17 = objc_msgSend_container(v13, v14, v15, v16);
    uint64_t v9 = objc_msgSend_primaryIdentifier(v17, v18, v19, v20);
  }

  return v9;
}

- (id)operationGroupName
{
  id v4 = objc_msgSend_group(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_name(v4, v5, v6, v7);

  return v8;
}

- (void)applyConvenienceConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_configuration(v4, v5, v6, v7);
  objc_msgSend_setConvenienceOperationConfiguration_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_group(v4, v11, v12, v13);
  objc_msgSend_setConvenienceOperationGroup_(self, v15, (uint64_t)v14, v16);

  objc_msgSend_convenienceCallbacks(v4, v17, v18, v19);
  id v65 = (id)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    uint64_t v23 = objc_msgSend_operationWillStartCallback(self, v20, v21, v22);

    if (!v23)
    {
      uint64_t v27 = objc_msgSend_operationWillStartCallback(v65, v24, v25, v26);
      objc_msgSend_setOperationWillStartCallback_(self, v28, (uint64_t)v27, v29);
    }
    uint64_t v30 = objc_msgSend_operationMeetsDiscretionaryCriteriaCallback(self, v24, v25, v26);

    if (!v30)
    {
      uint64_t v34 = objc_msgSend_operationMeetsDiscretionaryCriteriaCallback(v65, v31, v32, v33);
      objc_msgSend_setOperationMeetsDiscretionaryCriteriaCallback_(self, v35, (uint64_t)v34, v36);
    }
    uint64_t v37 = objc_msgSend_daemonOperationWillStartCallback(self, v31, v32, v33);

    if (!v37)
    {
      uint64_t v41 = objc_msgSend_daemonOperationWillStartCallback(v65, v38, v39, v40);
      objc_msgSend_setDaemonOperationWillStartCallback_(self, v42, (uint64_t)v41, v43);
    }
    uint64_t v44 = objc_msgSend_placeholderOperationFinishedCallback(self, v38, v39, v40);

    if (!v44)
    {
      uint64_t v48 = objc_msgSend_placeholderOperationFinishedCallback(v65, v45, v46, v47);
      objc_msgSend_setPlaceholderOperationFinishedCallback_(self, v49, (uint64_t)v48, v50);
    }
    uint64_t v51 = objc_msgSend_daemonChildOperationWillStartCallback(self, v45, v46, v47);

    if (!v51)
    {
      uint64_t v55 = objc_msgSend_daemonChildOperationWillStartCallback(v65, v52, v53, v54);
      objc_msgSend_setDaemonChildOperationWillStartCallback_(self, v56, (uint64_t)v55, v57);
    }
    uint64_t v58 = objc_msgSend_daemonOperationDidCancelCallback(self, v52, v53, v54);

    if (!v58)
    {
      uint64_t v62 = objc_msgSend_daemonOperationDidCancelCallback(v65, v59, v60, v61);
      objc_msgSend_setDaemonOperationDidCancelCallback_(self, v63, (uint64_t)v62, v64);
    }
  }
}

+ (id)requestOriginatorStringRepresentation:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"Unknown";
  }
  else {
    return off_1E54641F0[a3 - 1];
  }
}

- (void)setupBGSystemTaskExpirationHandler
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_systemTask(v6, v7, v8, v9);

  if (!v10) {
    goto LABEL_21;
  }
  if (!sub_18B123D70())
  {
    uint64_t v48 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, (uint64_t)self, @"CKOperation.m", 2055, @"Trying to set a BGSystemTask on an operation, but BGSystemTaskScheduler doesn't exist");
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v14 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v14;
    uint64_t v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    uint64_t v21 = objc_msgSend_ckShortDescription(self, v18, v19, v20);
    int v50 = 138544130;
    uint64_t v51 = v17;
    __int16 v52 = 2048;
    uint64_t v53 = self;
    __int16 v54 = 2114;
    uint64_t v55 = v21;
    __int16 v56 = 2112;
    uint64_t v57 = v10;
    _os_log_impl(&dword_18AF10000, v15, OS_LOG_TYPE_INFO, "Found system task for operation <%{public}@: %p; %{public}@>: %@",
      (uint8_t *)&v50,
      0x2Au);
  }
  if (self) {
    self->_unint64_t systemScheduler = 3;
  }
  id v22 = sub_18B123D70();
  uint64_t v26 = objc_msgSend_sharedScheduler(v22, v23, v24, v25);
  uint64_t v30 = objc_msgSend_identifier(v10, v27, v28, v29);
  uint64_t v33 = objc_msgSend_taskRequestForIdentifier_(v26, v31, (uint64_t)v30, v32);

  if (v33
    && ((objc_msgSend_dataBudgeted(v33, v34, v35, v36) & 1) != 0 || objc_msgSend_priority(v33, v37, v38, v39) == 1))
  {
    if (self)
    {
      unint64_t v40 = 1;
LABEL_17:
      self->_duetPreClearedMode = v40;
    }
  }
  else if (self)
  {
    unint64_t v40 = 2;
    goto LABEL_17;
  }
  uint64_t v41 = NSStringFromSelector(sel_state);
  objc_msgSend_addObserver_forKeyPath_options_context_(v10, v42, (uint64_t)self, (uint64_t)v41, 0, qword_1E9128CD0);

  if ((objc_msgSend_eligibleToRun(v10, v43, v44, v45) & 1) == 0) {
    objc_msgSend__handleBGSystemTaskExpiration_(self, v46, (uint64_t)v10, v47);
  }

LABEL_21:
}

- (void)_handleBGSystemTaskExpiration:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v5 = sub_18B0D7CD0(self);
  os_activity_scope_enter(v5, &state);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v6 = (id)ck_log_facility_ck;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = objc_msgSend_operationID(self, v7, v8, v9);
    *(_DWORD *)buf = 138543362;
    uint64_t v41 = v10;
    _os_log_impl(&dword_18AF10000, v6, OS_LOG_TYPE_INFO, "System task expired for operation %{public}@", buf, 0xCu);
  }
  if ((objc_msgSend_isCancelled(self, v11, v12, v13) & 1) == 0
    && objc_msgSend_isExecuting(self, v14, v15, v16))
  {
    uint64_t v20 = objc_msgSend_operationMetric(self, v17, v18, v19);
    objc_msgSend_setObject_forKeyedSubscript_(v20, v21, MEMORY[0x1E4F1CC38], @"systemTask_expired");

    uint64_t v25 = objc_msgSend_identifier(v4, v22, v23, v24);
    uint64_t v27 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, @"CKErrorDomain", 132, @"System task was deferred (%@)", v25);

    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v28 = (id)ck_log_facility_op;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = objc_msgSend_operationID(self, v29, v30, v31);
      uint64_t v36 = objc_msgSend_identifier(v4, v33, v34, v35);
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v32;
      __int16 v42 = 2112;
      uint64_t v43 = v36;
      _os_log_impl(&dword_18AF10000, v28, OS_LOG_TYPE_DEFAULT, "Cancelling operation %{public}@ because system task was deferred (%@)", buf, 0x16u);
    }
    objc_msgSend_cancelWithError_(self, v37, (uint64_t)v27, v38);
  }
  os_activity_scope_leave(&state);
}

- (CKContainer)container
{
  id v4 = objc_msgSend_configuration(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_container(v4, v5, v6, v7);

  return (CKContainer *)v8;
}

- (void)setContainer:(CKContainer *)container
{
  id v4 = container;
  objc_msgSend_configuration(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContainer_(v10, v8, (uint64_t)v4, v9);
}

- (BOOL)allowsCellularAccess
{
  id v4 = objc_msgSend_configuration(self, a2, v2, v3);
  char v8 = objc_msgSend_allowsCellularAccess(v4, v5, v6, v7);

  return v8;
}

- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess
{
  BOOL v4 = allowsCellularAccess;
  objc_msgSend_configuration(self, a2, allowsCellularAccess, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAllowsCellularAccess_(v7, v5, v4, v6);
}

- (BOOL)isLongLived
{
  BOOL v4 = objc_msgSend_configuration(self, a2, v2, v3);
  char isLongLived = objc_msgSend_isLongLived(v4, v5, v6, v7);

  return isLongLived;
}

- (void)setLongLived:(BOOL)longLived
{
  BOOL v4 = longLived;
  objc_msgSend_configuration(self, a2, longLived, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLongLived_(v7, v5, v4, v6);
}

- (NSTimeInterval)timeoutIntervalForRequest
{
  BOOL v4 = objc_msgSend_configuration(self, a2, v2, v3);
  objc_msgSend_timeoutIntervalForRequest(v4, v5, v6, v7);
  double v9 = v8;

  return v9;
}

- (void)setTimeoutIntervalForRequest:(NSTimeInterval)timeoutIntervalForRequest
{
  objc_msgSend_configuration(self, a2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeoutIntervalForRequest_(v9, v6, v7, v8, timeoutIntervalForRequest);
}

- (NSTimeInterval)timeoutIntervalForResource
{
  uint64_t v4 = objc_msgSend_configuration(self, a2, v2, v3);
  objc_msgSend_timeoutIntervalForResource(v4, v5, v6, v7);
  double v9 = v8;

  return v9;
}

- (void)setTimeoutIntervalForResource:(NSTimeInterval)timeoutIntervalForResource
{
  objc_msgSend_configuration(self, a2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeoutIntervalForResource_(v9, v6, v7, v8, timeoutIntervalForResource);
}

- (BOOL)preferAnonymousRequests
{
  uint64_t v4 = objc_msgSend_configuration(self, a2, v2, v3);
  char v8 = objc_msgSend_preferAnonymousRequests(v4, v5, v6, v7);

  return v8;
}

- (void)setPreferAnonymousRequests:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend_configuration(self, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreferAnonymousRequests_(v7, v5, v4, v6);
}

- (NSDictionary)additionalRequestHTTPHeaders
{
  BOOL v4 = objc_msgSend_configuration(self, a2, v2, v3);
  char v8 = objc_msgSend_additionalRequestHTTPHeaders(v4, v5, v6, v7);

  return (NSDictionary *)v8;
}

- (void)setAdditionalRequestHTTPHeaders:(id)a3
{
  id v4 = a3;
  objc_msgSend_configuration(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdditionalRequestHTTPHeaders_(v10, v8, (uint64_t)v4, v9);
}

- (CKOperationMetrics)metrics
{
  return (CKOperationMetrics *)objc_getProperty(self, a2, 360, 1);
}

- (void)setMetrics:(id)a3
{
}

- (void)setUsesBackgroundSession:(BOOL)a3
{
  self->_usesBackgroundSession = a3;
}

- (NSMutableDictionary)lifecycleCallbacks
{
  return self->_lifecycleCallbacks;
}

- (void)setLifecycleCallbacks:(id)a3
{
}

- (BOOL)isOutstandingOperation
{
  return self->_isOutstandingOperation;
}

- (void)setIsOutstandingOperation:(BOOL)a3
{
  self->_char isOutstandingOperation = a3;
}

- (CKOperationConfiguration)convenienceOperationConfiguration
{
  return (CKOperationConfiguration *)objc_getProperty(self, a2, 424, 1);
}

- (void)setConvenienceOperationConfiguration:(id)a3
{
}

- (CKOperationGroup)convenienceOperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 432, 1);
}

- (void)setConvenienceOperationGroup:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isFinishingOnCallbackQueue
{
  return self->_isFinishingOnCallbackQueue;
}

- (BOOL)canDropItemResultsEarly
{
  return self->_canDropItemResultsEarly;
}

- (void)setCanDropItemResultsEarly:(BOOL)a3
{
  self->_canDropItemResultsEarly = a3;
}

- (CKEventMetric)operationMetric
{
  return self->_operationMetric;
}

- (BOOL)queueHasStarted
{
  return self->_queueHasStarted;
}

- (void)setQueueHasStarted:(BOOL)a3
{
  self->_queueHasStarted = a3;
}

- (BOOL)_ckRaiseInGeneratedCallbackImplementation
{
  return self->__ckRaiseInGeneratedCallbackImplementation;
}

- (void)set_ckRaiseInGeneratedCallbackImplementation:(BOOL)a3
{
  self->__ckRaiseInGeneratedCallbackImplementation = a3;
}

- (CKOperationMMCSRequestOptions)MMCSRequestOptions
{
  return self->_MMCSRequestOptions;
}

- (void)setMMCSRequestOptions:(id)a3
{
}

- (CKTestResultOverlayBox)appliedOverlayProtocol
{
  return self->_appliedOverlayProtocol;
}

- (void)setAppliedOverlayProtocol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_signpostIntervalState, 0);
  objc_storeStrong((id *)&self->_signpost, 0);
  objc_storeStrong((id *)&self->_clientVoucher, 0);
  objc_storeStrong((id *)&self->_appliedOverlayProtocol, 0);
  objc_storeStrong((id *)&self->_MMCSRequestOptions, 0);
  objc_storeStrong((id *)&self->_operationMetric, 0);
  objc_storeStrong((id *)&self->_placeholderOperation, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_convenienceOperationGroup, 0);
  objc_storeStrong((id *)&self->_convenienceOperationConfiguration, 0);
  objc_storeStrong((id *)&self->_lifecycleCallbacks, 0);
  objc_storeStrong((id *)&self->_xpcActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_timeoutSource, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong(&self->_requestCompletedBlock, 0);
  objc_storeStrong(&self->_longLivedOperationWasPersistedBlock, 0);
  objc_storeStrong((id *)&self->_cancelError, 0);
  objc_storeStrong((id *)&self->_resolvedConfiguration, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_clientOperationCallbackProxy, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);

  objc_storeStrong((id *)&self->_executingTransaction, 0);
}

+ (id)assetInfoForOperation:(id)a3 recordID:(id)a4 recordKey:(id)a5 arrayIndex:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v14 = a5;
  if (v10)
  {
    uint64_t v15 = objc_msgSend_assetInfoByArrayIndexByRecordKeyByRecordID(v9, v11, v12, v13);
    uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)v10, v17);

    if (!v18)
    {
      uint64_t v18 = objc_opt_new();
      uint64_t v24 = objc_msgSend_assetInfoByArrayIndexByRecordKeyByRecordID(v9, v21, v22, v23);
      objc_msgSend_setObject_forKeyedSubscript_(v24, v25, (uint64_t)v18, (uint64_t)v10);
    }
    uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v14, v20);
    if (!v28)
    {
      uint64_t v28 = objc_opt_new();
      objc_msgSend_setObject_forKeyedSubscript_(v18, v29, (uint64_t)v28, (uint64_t)v14);
    }
    uint64_t v30 = objc_msgSend_numberWithInteger_(NSNumber, v26, a6, v27);
    uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v28, v31, (uint64_t)v30, v32);

    if (!v33)
    {
      uint64_t v33 = objc_opt_new();
      uint64_t v36 = objc_msgSend_numberWithInteger_(NSNumber, v34, a6, v35);
      objc_msgSend_setObject_forKeyedSubscript_(v28, v37, (uint64_t)v33, (uint64_t)v36);
    }
  }
  else
  {
    uint64_t v33 = 0;
  }

  return v33;
}

+ (BOOL)_wireUpAssetContentForOperation:(id)a3 inRecord:(id)a4 checkSignatures:(BOOL)a5 outError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = sub_18AF1431C;
  uint64_t v38 = sub_18AF13A1C;
  id v39 = 0;
  id v14 = objc_msgSend_assetInfoByArrayIndexByRecordKeyByRecordID(v9, v11, v12, v13);
  uint64_t v18 = objc_msgSend_recordID(v10, v15, v16, v17);
  uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v14, v19, (uint64_t)v18, v20);

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_18B1A1B64;
  v29[3] = &unk_1E54661B8;
  id v22 = v10;
  id v30 = v22;
  BOOL v33 = a5;
  id v23 = v9;
  id v31 = v23;
  uint64_t v32 = &v34;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v21, v24, (uint64_t)v29, v25);
  uint64_t v26 = (void *)v35[5];
  if (a6 && v26)
  {
    *a6 = v26;
    uint64_t v26 = (void *)v35[5];
  }
  BOOL v27 = v26 == 0;

  _Block_object_dispose(&v34, 8);
  return v27;
}

@end