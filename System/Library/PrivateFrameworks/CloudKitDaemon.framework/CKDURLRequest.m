@interface CKDURLRequest
- (BOOL)_onLifecycleQueue;
- (BOOL)allowAutomaticRedirects;
- (BOOL)allowsAnonymousAccount;
- (BOOL)allowsAuthedAccount;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)allowsPowerNapScheduling;
- (BOOL)didFetchNilAuthToken;
- (BOOL)didReceiveResponseBodyData;
- (BOOL)didRetryAuth;
- (BOOL)expectDelayBeforeRequestBegins;
- (BOOL)expectsResponseBody;
- (BOOL)expectsSingleObject;
- (BOOL)handlesAnonymousCKUserIDPropagation;
- (BOOL)hasRequestBody;
- (BOOL)haveCachedPartitionType;
- (BOOL)haveCachedServerType;
- (BOOL)includeContainerServerInfo;
- (BOOL)isCancelled;
- (BOOL)isErrorInducerRequest;
- (BOOL)isFinished;
- (BOOL)isFullZoneRequest;
- (BOOL)isHandlingAuthRetry;
- (BOOL)isWaitingOnAuthRenew;
- (BOOL)markAsFinished;
- (BOOL)needsAuthRetry;
- (BOOL)parsingStandaloneMessage;
- (BOOL)performOnLifecycleQueueIfNotFinished:(id)a3;
- (BOOL)preferAnonymousRequests;
- (BOOL)requestGETPreAuth;
- (BOOL)requiresAppPartitionURL;
- (BOOL)requiresCKAnonymousSignature;
- (BOOL)requiresCKAnonymousUserIDs;
- (BOOL)requiresConfiguration;
- (BOOL)requiresDeviceID;
- (BOOL)requiresTokenRegistration;
- (BOOL)requiresUserPartitionURL;
- (BOOL)resolvedAutomaticallyRetryNetworkFailures;
- (BOOL)sendRequestAnonymously;
- (BOOL)shouldCompressBody;
- (BOOL)usesBackgroundSession;
- (BOOL)usesCloudKitAuthToken;
- (BOOL)usesiCloudAuthToken;
- (BOOL)validate:(id *)a3;
- (BOOL)wantsProtocolTranslator;
- (C2NetworkingDelegate)c2NetworkingDelegate;
- (C2RequestOptions)requestOptions;
- (CKDContainer)container;
- (CKDOperation)operation;
- (CKDOperationMetrics)metrics;
- (CKDProtobufStreamWriter)streamWriter;
- (CKDProtocolTranslator)translator;
- (CKDResponseBodyParser)responseBodyParser;
- (CKDURLRequest)initWithOperation:(id)a3;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (CKSignpost)signpost;
- (CKTapToRadarRequest)serverProvidedTapToRadarRequest;
- (CKTestRequestProperties)testRequestProperties;
- (Class)expectedResponseClass;
- (Class)requestMessageClass;
- (NSArray)requestOperationClasses;
- (NSArray)requestOperations;
- (NSDate)dateRequestWentOut;
- (NSDictionary)additionalHeaderValues;
- (NSDictionary)clientProvidedAdditionalHeaderValues;
- (NSDictionary)fakeResponseOperationResultByItemID;
- (NSDictionary)responseHeaders;
- (NSDictionary)timingData;
- (NSDictionary)unitTestOverrides;
- (NSError)error;
- (NSError)lastRetryAuthError;
- (NSHTTPURLResponse)response;
- (NSInputStream)requestBodyStream;
- (NSMutableDictionary)countsByRequestOperationType;
- (NSMutableSet)responseObjectUUIDs;
- (NSNumber)operationGroupQuantity;
- (NSString)acceptContentType;
- (NSString)applicationBundleIdentifierForContainerAccess;
- (NSString)applicationBundleIdentifierForNetworkAttribution;
- (NSString)authPromptReason;
- (NSString)cloudKitAuthToken;
- (NSString)description;
- (NSString)deviceID;
- (NSString)httpMethod;
- (NSString)iCloudAuthToken;
- (NSString)operationGroupID;
- (NSString)operationGroupName;
- (NSString)operationID;
- (NSString)operationIDForProtobuf;
- (NSString)path;
- (NSString)protobufOperationName;
- (NSString)requestContentType;
- (NSString)requestUUID;
- (NSString)serverProvidedAutoBugCaptureReason;
- (NSString)sourceApplicationSecondaryIdentifier;
- (NSURL)url;
- (NSURLRequest)request;
- (NSURLSession)urlSession;
- (NSURLSessionDataTask)urlSessionTask;
- (OS_dispatch_queue)lifecycleQueue;
- (OS_voucher)voucher;
- (double)timeoutIntervalForRequest;
- (double)timeoutIntervalForResource;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)_CFNetworkTaskIdentifierString;
- (id)_parseErrorDictionaryForJson:(id)a3;
- (id)_protobufObjectParsedBlock;
- (id)_wrapErrorIfNecessary:(id)a3;
- (id)ckShortDescription;
- (id)completionBlock;
- (id)createAssetAuthorizeGetRequestOptionsHeaderInfoWithKey:(id)a3 value:(id)a4;
- (id)defaultParserForContentType:(id)a3;
- (id)generateRequestOperations;
- (id)operationRequestWithType:(int)a3;
- (id)privacyProxyFailClosedOverride;
- (id)recordIDs:(id)a3 filteredByZones:(id)a4;
- (id)recordIDsUsedInZones:(id)a3;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationCountsByOperationType;
- (id)requestProgressBlock;
- (id)responseProgressBlock;
- (id)returnVerificationKeyAndSignatureForRequestOperation:(id)a3 dataToBeSigned:(id)a4 error:(id *)a5;
- (id)statusReportWithIndent:(unint64_t)a3;
- (id)traceHeaderValues;
- (id)zoneIDsToLock;
- (int)isolationLevel;
- (int)operationType;
- (int)requestOriginator;
- (int64_t)_handleServerProtobufResult:(id)a3 rawData:(id)a4;
- (int64_t)cachedPartitionType;
- (int64_t)cachedServerType;
- (int64_t)databaseScope;
- (int64_t)partitionType;
- (int64_t)qualityOfService;
- (int64_t)responseStatusCode;
- (int64_t)serverType;
- (unint64_t)duetPreClearedMode;
- (unint64_t)networkServiceType;
- (unint64_t)numDownloadedElements;
- (unint64_t)resolvedDiscretionaryNetworkBehavior;
- (void)URLSession:(id)a3 _taskIsWaitingForConnection:(id)a4;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_acquireZoneGates;
- (void)_authTokenWithCompletionHandler:(id)a3;
- (void)_fetchContainerScopedUserID;
- (void)_fetchDeviceID;
- (void)_fetchServerCertificatesIfNeeded;
- (void)_finalizeRequestOperations:(id)a3 request:(id)a4;
- (void)_finishOnLifecycleQueueWithError:(id)a3;
- (void)_handleAuthFailure;
- (void)_handlePlistResult:(id)a3;
- (void)_handleServerJSONResult:(id)a3;
- (void)_loadRequest:(id)a3;
- (void)_performRequest;
- (void)_performWillSendTestCallback;
- (void)_prepareAuthTokens;
- (void)_prepareCloudKitAuthToken;
- (void)_registerPushTokens;
- (void)_registerRequestOperationTypesForOperations:(id)a3;
- (void)_renewAuthTokenWithCompletionHandler:(id)a3;
- (void)_setupConfiguration;
- (void)_setupPrivateDatabaseURL;
- (void)_setupPublicDatabaseURL;
- (void)_tearDownStreamWriter;
- (void)_triggerAutoBugCaptureWithErrorPayload:(id)a3;
- (void)_validateAccountAccess;
- (void)cancel;
- (void)dealloc;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)finishWithError:(id)a3;
- (void)invokeCompletionBlock;
- (void)performASyncOnLifecycleQueueIfNotFinished:(id)a3;
- (void)performASyncOnLifecycleQueueIfNotFinished:(id)a3 fallbackBlock:(id)a4;
- (void)performRequest;
- (void)prepareRequestOperationsForRequest:(id)a3;
- (void)prepareRequestWithCompletion:(id)a3;
- (void)requestDidParse509CertObject:(id)a3;
- (void)requestDidParseJSONObject:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)requestDidParsePlaintextObject:(id)a3;
- (void)requestDidParsePlistObject:(id)a3;
- (void)requestDidParseProtobufObject:(id)a3 completionHandler:(id)a4;
- (void)retryRequest;
- (void)setAllowAutomaticRedirects:(BOOL)a3;
- (void)setC2NetworkingDelegate:(id)a3;
- (void)setCachedPartitionType:(int64_t)a3;
- (void)setCachedServerType:(int64_t)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setClientProvidedAdditionalHeaderValues:(id)a3;
- (void)setCloudKitAuthToken:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCountsByRequestOperationType:(id)a3;
- (void)setDateRequestWentOut:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setDidFetchNilAuthToken:(BOOL)a3;
- (void)setDidReceiveResponseBodyData:(BOOL)a3;
- (void)setDidRetryAuth:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setFakeResponseOperationResultByItemID:(id)a3;
- (void)setHaveCachedPartitionType:(BOOL)a3;
- (void)setHaveCachedServerType:(BOOL)a3;
- (void)setICloudAuthToken:(id)a3;
- (void)setIsHandlingAuthRetry:(BOOL)a3;
- (void)setIsWaitingOnAuthRenew:(BOOL)a3;
- (void)setLastRetryAuthError:(id)a3;
- (void)setLifecycleQueue:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setNeedsAuthRetry:(BOOL)a3;
- (void)setNumDownloadedElements:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setRequestOptions:(id)a3;
- (void)setRequestProgressBlock:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResponseBodyParser:(id)a3;
- (void)setResponseObjectUUIDs:(id)a3;
- (void)setResponseProgressBlock:(id)a3;
- (void)setServerProvidedAutoBugCaptureReason:(id)a3;
- (void)setServerProvidedTapToRadarRequest:(id)a3;
- (void)setTimingData:(id)a3;
- (void)setTranslator:(id)a3;
- (void)setUnitTestOverrides:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)setUrlSessionTask:(id)a3;
- (void)setVoucher:(id)a3;
- (void)tearDownResources;
- (void)tearDownResourcesAndReleaseTheZoneLocks:(BOOL)a3;
- (void)updateShareIDCacheWithDeletedRecordID:(id)a3;
- (void)updateShareIDCacheWithDeletedZoneID:(id)a3;
- (void)updateShareIDCacheWithRecord:(id)a3;
- (void)validateAnonymousUserIDPropagation;
@end

@implementation CKDURLRequest

- (CKDURLRequest)initWithOperation:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)CKDURLRequest;
  v5 = [(CKDURLRequest *)&v44 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_operation, v4);
    uint64_t v9 = objc_msgSend_container(v4, v7, v8);
    container = v6->_container;
    v6->_container = (CKDContainer *)v9;

    v6->_responseStatusCode = -1;
    v6->_allowAutomaticRedirects = 1;
    uint64_t v11 = CKCreateGUID();
    requestUUID = v6->_requestUUID;
    v6->_requestUUID = (NSString *)v11;

    uint64_t v13 = objc_opt_new();
    metrics = v6->_metrics;
    v6->_metrics = (CKDOperationMetrics *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    responseObjectUUIDs = v6->_responseObjectUUIDs;
    v6->_responseObjectUUIDs = v15;

    v19 = objc_msgSend_operationInfo(v4, v17, v18);
    uint64_t v22 = objc_msgSend_requestOriginator(v19, v20, v21);
    if ((unint64_t)(v22 - 1) >= 5) {
      int v23 = 1;
    }
    else {
      int v23 = v22 + 1;
    }
    v6->_requestOriginator = v23;

    id v24 = objc_alloc(MEMORY[0x1E4F1A3C0]);
    uint64_t v26 = objc_msgSend_initWithLog_(v24, v25, *MEMORY[0x1E4F1A530]);
    signpost = v6->_signpost;
    v6->_signpost = (CKSignpost *)v26;

    if (*MEMORY[0x1E4F1A4E0])
    {
      v30 = objc_msgSend_unitTestOverrides(v4, v28, v29);
      uint64_t v32 = objc_msgSend_objectForKey_(v30, v31, @"HTTPResponseBodyOverride");
      fakeResponseData = v6->_fakeResponseData;
      v6->_fakeResponseData = (NSData *)v32;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v34 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v35 = v34;
      v36 = (objc_class *)objc_opt_class();
      v37 = NSStringFromClass(v36);
      v39 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v6, v38, 1, 0, 0);
      v42 = objc_msgSend_CKPropertiesStyleString(v39, v40, v41);
      *(_DWORD *)buf = 138543874;
      v46 = v37;
      __int16 v47 = 2048;
      v48 = v6;
      __int16 v49 = 2114;
      v50 = v42;
      _os_log_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_INFO, "<%{public}@: %p; %{public}@> Request Initializing",
        buf,
        0x20u);
    }
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1C8789E70]();
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v5 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
  {
    v15 = v5;
    uint64_t v18 = objc_msgSend_requestUUID(self, v16, v17);
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v18;
    _os_log_debug_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"dealloc\"", buf, 0xCu);
  }
  objc_msgSend__tearDownStreamWriter(self, v6, v7);
  if ((objc_msgSend_isFinished(self, v8, v9) & 1) == 0 && self->_didSendRequest)
  {
    uint64_t v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v29, (uint64_t)a2, self, @"CKDURLRequest.m", 315, @"<%@ %p>: Requests must be finished before deallocation", v28, self);
  }
  v12 = objc_msgSend_urlSessionTask(self, v10, v11);

  if (v12)
  {
    v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
    v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    id v24 = objc_msgSend_urlSessionTask(self, v22, v23);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v25, (uint64_t)a2, self, @"CKDURLRequest.m", 316, @"<%@ %p>: The URL session data task should be nil: %p", v21, self, v24);
  }
  v30.receiver = self;
  v30.super_class = (Class)CKDURLRequest;
  [(CKDURLRequest *)&v30 dealloc];
}

- (BOOL)_onLifecycleQueue
{
  v3 = objc_msgSend_lifecycleQueue(self, a2, v2);
  BOOL v4 = dispatch_get_specific(v3) != 0;

  return v4;
}

- (OS_dispatch_queue)lifecycleQueue
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_lifecycleQueue)
  {
    objc_msgSend_stringWithFormat_(NSString, v3, @"%s.%p", "com.apple.cloudkit.urlrequestlifecycle", v2);
    id v4 = objc_claimAutoreleasedReturnValue();
    uint64_t v7 = (const char *)objc_msgSend_UTF8String(v4, v5, v6);
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_msgSend_qualityOfService(v2, v9, v10);
    dispatch_qos_class_t v11 = CKQoSClassFromNSQualityOfService();
    v12 = dispatch_queue_attr_make_with_qos_class(v8, v11, 0);
    dispatch_queue_t v13 = dispatch_queue_create(v7, v12);
    lifecycleQueue = v2->_lifecycleQueue;
    v2->_lifecycleQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_set_specific((dispatch_queue_t)v2->_lifecycleQueue, v2->_lifecycleQueue, (void *)1, 0);
  }
  objc_sync_exit(v2);

  v15 = v2->_lifecycleQueue;
  return v15;
}

- (id)ckShortDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_requestUUID(self, v6, v7);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v3, v9, @"<%@: %p %@>", v5, self, v8);

  return v10;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
  dispatch_queue_t v13 = objc_msgSend_initWithCapacity_(v9, v10, 7);
  if (v7)
  {
    uint64_t v14 = objc_msgSend_requestUUID(self, v11, v12);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v15, @"UUID", v14);
  }
  if (v6)
  {
    v16 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v11, 2);
    if (objc_msgSend_isFinished(self, v17, v18)) {
      objc_msgSend_addObject_(v16, v19, @"finished");
    }
    if (objc_msgSend_isCancelled(self, v19, v20)) {
      objc_msgSend_addObject_(v16, v21, @"cancelled");
    }
    if (objc_msgSend_count(v16, v21, v22))
    {
      v25 = objc_msgSend_componentsJoinedByString_(v16, v23, @"|");
      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v26, @"stateFlags", v25);
    }
    v27 = objc_msgSend_urlSessionTask(self, v23, v24);
    objc_super v30 = v27;
    if (v27)
    {
      v31 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v32 = objc_msgSend_taskIdentifier(v27, v28, v29);
      v34 = objc_msgSend_numberWithUnsignedInteger_(v31, v33, v32);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v35, @"dataTaskID", v34);

      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v36, @"dataTask", v30);
    }
    v37 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v28, 2);
    if (objc_msgSend_usesBackgroundSession(self, v38, v39)) {
      objc_msgSend_addObject_(v37, v40, @"background");
    }
    else {
      objc_msgSend_addObject_(v37, v40, @"foreground");
    }
    if (objc_msgSend_allowsCellularAccess(self, v41, v42)) {
      objc_msgSend_addObject_(v37, v43, @"allows-cellular");
    }
    else {
      objc_msgSend_addObject_(v37, v43, @"deny-cellular");
    }
    if (objc_msgSend_allowsExpensiveNetworkAccess(self, v44, v45)) {
      objc_msgSend_addObject_(v37, v46, @"allows-expensive");
    }
    else {
      objc_msgSend_addObject_(v37, v46, @"deny-expensive");
    }
    v48 = objc_msgSend_componentsJoinedByString_(v37, v47, @"|");
    objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v49, @"flags", v48);

    v52 = objc_msgSend_error(self, v50, v51);
    v55 = v52;
    if (v52)
    {
      if (a5)
      {
        v56 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v52, v53, 1, 1, 1);
        objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v57, @"error", v56);
      }
      else
      {
        objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v53, @"error", v52);
      }
    }
    v60 = objc_msgSend_request(self, v53, v54);
    if (v60) {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v58, @"request", v60);
    }
    if (objc_msgSend_isErrorInducerRequest(self, v58, v59)) {
      objc_msgSend_addObject_(v37, v61, @"errorInducer");
    }
  }
  return v13;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDURLRequest *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (BOOL)isErrorInducerRequest
{
  if (!*MEMORY[0x1E4F1A4E0]) {
    return 0;
  }
  v3 = objc_msgSend_container(self, a2, v2);
  BOOL v6 = objc_msgSend_deviceID(v3, v4, v5);
  char hasPrefix = objc_msgSend_hasPrefix_(v6, v7, @"__error_inducer__");

  return hasPrefix;
}

- (NSString)httpMethod
{
  return (NSString *)@"POST";
}

- (id)generateRequestOperations
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, @"CKDURLRequest.m", 433, @"To be overridden by subclass");

  return 0;
}

- (id)returnVerificationKeyAndSignatureForRequestOperation:(id)a3 dataToBeSigned:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSArray)requestOperations
{
  if (!objc_msgSend_count(self->_requestOperations, a2, v2))
  {
    objc_msgSend_generateRequestOperations(self, v4, v5);
    BOOL v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    requestOperations = self->_requestOperations;
    self->_requestOperations = v6;
  }
  uint64_t v8 = self->_requestOperations;
  return v8;
}

- (NSInputStream)requestBodyStream
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_requestOperations(self, a2, v2);
  if (!objc_msgSend_count(v4, v5, v6))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v37 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = v37;
      uint64_t v42 = objc_msgSend_requestUUID(self, v40, v41);
      *(_DWORD *)buf = 138543362;
      v57 = v42;
      _os_log_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Not returning a request body stream because there are no items to stream\"", buf, 0xCu);
    }
    id v9 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v38, *MEMORY[0x1E4F19DD8], 2005, @"there is no operation associated with this request");
    objc_msgSend_finishWithError_(self, v43, (uint64_t)v9);
    goto LABEL_13;
  }
  id v9 = objc_msgSend_container(self, v7, v8);
  uint64_t v12 = objc_msgSend_serverConfig(v9, v10, v11);
  v15 = objc_msgSend_containerID(v9, v13, v14);
  unint64_t v17 = objc_msgSend_maxBatchSize_(v12, v16, (uint64_t)v15);

  if (objc_msgSend_count(v4, v18, v19) > v17)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v22 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v22;
      v28 = objc_msgSend_requestUUID(self, v26, v27);
      *(_DWORD *)buf = 138543874;
      v57 = v28;
      __int16 v58 = 2048;
      uint64_t v59 = objc_msgSend_count(v4, v29, v30);
      __int16 v60 = 2048;
      unint64_t v61 = v17;
      _os_log_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"This request has too many operations: %lu/%lu\"", buf, 0x20u);
    }
    v31 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v32 = *MEMORY[0x1E4F19DD8];
    uint64_t v33 = objc_msgSend_count(v4, v23, v24);
    v35 = objc_msgSend_errorWithDomain_code_format_(v31, v34, v32, 1020, @"Your request contains %ld items which is more than the maximum number of items in a single request (%ld)", v33, v17);
    objc_msgSend_finishWithError_(self, v36, (uint64_t)v35);

LABEL_13:
    objc_super v44 = 0;
    goto LABEL_15;
  }
  objc_msgSend__tearDownStreamWriter(self, v20, v21);
  objc_msgSend__registerRequestOperationTypesForOperations_(self, v45, (uint64_t)v4);
  v48 = objc_msgSend_streamWriter(self, v46, v47);
  objc_msgSend_setStreamedObjects_(v48, v49, (uint64_t)v4);

  v52 = objc_msgSend_streamWriter(self, v50, v51);
  objc_super v44 = objc_msgSend_open(v52, v53, v54);

LABEL_15:
  return (NSInputStream *)v44;
}

- (void)prepareRequestOperationsForRequest:(id)a3
{
  uint64_t v225 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_container(self, v6, v7);
  uint64_t v11 = objc_msgSend_operation(self, v9, v10);
  uint64_t v14 = objc_msgSend_databaseScope(self, v12, v13);
  if (v14 == 3)
  {
    unint64_t v17 = objc_msgSend_sharedManager(CKDDeviceCapabilityManager, v15, v16);
    objc_msgSend_recordShareUsageForRequest_container_(v17, v19, (uint64_t)self, v8);
  }
  else
  {
    if (v14 != 2) {
      goto LABEL_6;
    }
    unint64_t v17 = objc_msgSend_sharedManager(CKDDeviceCapabilityManager, v15, v16);
    objc_msgSend_recordZoneUsageForOperation_container_(v17, v18, (uint64_t)v11, v8);
  }

LABEL_6:
  objc_msgSend_requestOperations(self, v15, v16);
  uint64_t v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = objc_msgSend_containerID(v8, v21, v22);
  uint64_t v26 = objc_msgSend_containerIdentifier(v23, v24, v25);

  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v29 = v11;
    uint64_t v30 = objc_msgSend_unitTestOverrides(self, v27, v28);
    uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v30, v31, @"FakeContainerIdentifier");

    if (v32)
    {
      id v33 = v32;

      uint64_t v26 = v33;
    }

    uint64_t v11 = v29;
  }
  v34 = objc_msgSend_firstObject(v20, v27, v28);
  v37 = v34;
  if (v34)
  {
    SEL v213 = a2;
    v40 = objc_msgSend_header(v34, v35, v36);
    if (!v40)
    {
      v40 = objc_opt_new();
      objc_msgSend_setHeader_(v37, v41, (uint64_t)v40);
    }
    v217 = v37;
    objc_super v44 = objc_msgSend_applicationBundleIdentifierForContainerAccess(self, v38, v39);
    if (v44)
    {
      objc_msgSend_setApplicationBundle_(v40, v42, (uint64_t)v44);
    }
    else
    {
      uint64_t v45 = objc_msgSend_applicationBundleIdentifierForContainerAccess(v8, v42, v43);
      objc_msgSend_setApplicationBundle_(v40, v46, (uint64_t)v45);
    }
    __int16 v49 = objc_msgSend_applicationVersion(v8, v47, v48);
    objc_msgSend_setApplicationVersion_(v40, v50, (uint64_t)v49);

    if (objc_msgSend_includeContainerServerInfo(self, v51, v52))
    {
      objc_msgSend_setApplicationContainer_(v40, v53, (uint64_t)v26);
      v57 = objc_msgSend_containerID(v8, v55, v56);
      if (objc_msgSend_environment(v57, v58, v59) == 1) {
        objc_msgSend_setApplicationContainerEnvironment_(v40, v60, 1);
      }
      else {
        objc_msgSend_setApplicationContainerEnvironment_(v40, v60, 2);
      }
    }
    unint64_t v61 = objc_msgSend_databaseScope(self, v53, v54);
    id v216 = v5;
    v214 = v26;
    if (v61 > 4) {
      objc_msgSend_setTargetDatabase_(v40, v62, 1);
    }
    else {
      objc_msgSend_setTargetDatabase_(v40, v62, dword_1C50804F8[v61]);
    }
    v63 = CKProductType();
    objc_msgSend_setDeviceHardwareVersion_(v40, v64, (uint64_t)v63);

    v65 = CKProductVersion();
    objc_msgSend_setDeviceSoftwareVersion_(v40, v66, (uint64_t)v65);

    long long v222 = 0u;
    long long v223 = 0u;
    long long v220 = 0u;
    long long v221 = 0u;
    v215 = v11;
    v69 = objc_msgSend_deviceContext(v11, v67, v68);
    v72 = objc_msgSend_throttleManager(v69, v70, v71);
    v75 = objc_msgSend_allThrottles(v72, v73, v74);

    uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v220, v224, 16);
    if (v77)
    {
      uint64_t v80 = v77;
      uint64_t v81 = *(void *)v221;
      do
      {
        for (uint64_t i = 0; i != v80; ++i)
        {
          if (*(void *)v221 != v81) {
            objc_enumerationMutation(v75);
          }
          v83 = *(void **)(*((void *)&v220 + 1) + 8 * i);
          if (objc_msgSend_isServerThrottle(v83, v78, v79))
          {
            v86 = objc_msgSend_label(v83, v78, v79);
            if (v86)
            {
              v87 = objc_msgSend_label(v83, v84, v85);
              objc_msgSend_addActiveThrottlingLabel_(v40, v88, (uint64_t)v87);
            }
          }
        }
        uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v78, (uint64_t)&v220, v224, 16);
      }
      while (v80);
    }

    if ((objc_msgSend_sendRequestAnonymously(self, v89, v90) & 1) == 0)
    {
      v93 = objc_msgSend_hardwareID(v8, v91, v92);
      objc_msgSend_setDeviceHardwareID_(v40, v94, (uint64_t)v93);

      v97 = objc_msgSend_deviceID(v8, v95, v96);
      if (objc_msgSend_length(v97, v98, v99))
      {
        v102 = objc_msgSend_CKDPIdentifier_Device(v97, v100, v101);
        objc_msgSend_setDeviceIdentifier_(v40, v103, (uint64_t)v102);
      }
      v104 = CKDeviceUDID();
      objc_msgSend_setDeviceUDID_(v40, v105, (uint64_t)v104);

      v106 = CKDeviceSerialNumber();
      objc_msgSend_setDeviceSerialNumber_(v40, v107, (uint64_t)v106);

      v110 = objc_msgSend_deviceName(v8, v108, v109);
      objc_msgSend_setDeviceAssignedName_(v40, v111, (uint64_t)v110);
    }
    uint64_t v112 = objc_msgSend_isolationLevel(self, v91, v92);
    objc_msgSend_setIsolationLevel_(v40, v113, v112);
    uint64_t v116 = objc_msgSend_requestOriginator(self, v114, v115);
    objc_msgSend_setRequestOriginator_(v40, v117, v116);
    v120 = objc_msgSend_operationGroupName(self, v118, v119);

    if (v120)
    {
      v123 = objc_msgSend_operationGroupName(self, v121, v122);
      objc_msgSend_setOperationGroupName_(v40, v124, (uint64_t)v123);
    }
    v125 = objc_msgSend_operationGroupQuantity(self, v121, v122);

    if (v125)
    {
      v128 = objc_msgSend_operationGroupQuantity(self, v126, v127);
      uint64_t v131 = objc_msgSend_unsignedLongLongValue(v128, v129, v130);
      objc_msgSend_setOperationGroupQuantity_(v40, v132, v131);
    }
    v133 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v134 = objc_opt_class();
    v136 = objc_msgSend_bundleForClass_(v133, v135, v134);
    v139 = objc_msgSend_infoDictionary(v136, v137, v138);
    v141 = objc_msgSend_objectForKeyedSubscript_(v139, v140, *MEMORY[0x1E4F1CFF8]);
    objc_msgSend_setDeviceLibraryName_(v40, v142, (uint64_t)v141);

    v144 = objc_msgSend_objectForKeyedSubscript_(v139, v143, *MEMORY[0x1E4F1CC70]);
    objc_msgSend_setDeviceLibraryVersion_(v40, v145, (uint64_t)v144);

    v148 = objc_msgSend_request(v217, v146, v147);
    int v151 = objc_msgSend_type(v148, v149, v150);

    uint64_t v11 = v215;
    if (v151 > 299)
    {
      if (v151 != 800 && v151 != 300) {
        goto LABEL_50;
      }
    }
    else if (v151 != 210 && v151 != 220)
    {
      goto LABEL_50;
    }
    v154 = objc_opt_new();
    objc_msgSend_setLocale_(v40, v155, (uint64_t)v154);

    v158 = objc_msgSend_languageCode(v8, v156, v157);
    v161 = objc_msgSend_locale(v40, v159, v160);
    objc_msgSend_setLanguageCode_(v161, v162, (uint64_t)v158);

    v165 = objc_msgSend_regionCode(v8, v163, v164);
    v168 = objc_msgSend_locale(v40, v166, v167);
    objc_msgSend_setRegionCode_(v168, v169, (uint64_t)v165);

LABEL_50:
    if (!v8)
    {
      v211 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v152, v153);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v211, v212, (uint64_t)v213, self, @"CKDURLRequest.m", 574, @"Expected non-nil container");
    }
    v170 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v152, v153);
    uint64_t isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v170, v171, v172);
    objc_msgSend_setDeviceSoftwareIsAppleInternal_(v40, v174, isAppleInternalInstall);

    v177 = objc_msgSend_protocolVersion(CKDMMCS, v175, v176);
    objc_msgSend_setMmcsProtocolVersion_(v40, v178, (uint64_t)v177);

    v181 = objc_msgSend_operationInfo(v215, v179, v180);
    uint64_t HasValidatedEntitlements = objc_msgSend_clientHasValidatedEntitlements(v181, v182, v183);
    objc_msgSend_setEntitlementsValidated_(v40, v185, HasValidatedEntitlements);

    if (objc_msgSend_requestGETPreAuth(self, v186, v187))
    {
      v188 = objc_opt_new();
      objc_msgSend_setAssetAuthorizeGetRequestOptions_(v40, v189, (uint64_t)v188);

      uint64_t RequestOptions = MMCSICloudAuthGetRequestOptions();
      v193 = objc_msgSend_assetAuthorizeGetRequestOptions(v40, v191, v192);
      objc_msgSend_setContentRequestAuthorizeGetOptions_(v193, v194, RequestOptions);

      v195 = objc_opt_new();
      v198 = objc_msgSend_assetAuthorizeGetRequestOptions(v40, v196, v197);
      objc_msgSend_setContentRequestHeaders_(v198, v199, (uint64_t)v195);

      v202 = objc_msgSend_protocolHeaders(CKDMMCS, v200, v201);
      v218[0] = MEMORY[0x1E4F143A8];
      v218[1] = 3221225472;
      v218[2] = sub_1C4DB0430;
      v218[3] = &unk_1E64F2518;
      v218[4] = self;
      id v219 = v40;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v202, v203, (uint64_t)v218);
    }
    id v5 = v216;
    v37 = v217;
    uint64_t v26 = v214;
  }
  v204 = objc_msgSend_lastObject(v20, v35, v36);
  v207 = objc_msgSend_request(v204, v205, v206);
  objc_msgSend_setLast_(v207, v208, 1);

  objc_msgSend__finalizeRequestOperations_request_(self, v209, (uint64_t)v20, v5);
  requestOperations = self->_requestOperations;
  self->_requestOperations = v20;
}

- (void)updateShareIDCacheWithRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    BOOL v7 = objc_msgSend_databaseScope(self, v5, v6) == 3;
    id v4 = v14;
    if (v7)
    {
      uint64_t v10 = objc_msgSend_container(self, v8, v9);
      uint64_t v12 = objc_msgSend_cacheForContainer_(CKDShareIDCache, v11, (uint64_t)v10);

      objc_msgSend_addRecord_(v12, v13, (uint64_t)v14);
      id v4 = v14;
    }
  }
}

- (void)updateShareIDCacheWithDeletedRecordID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    BOOL v7 = objc_msgSend_databaseScope(self, v5, v6) == 3;
    id v4 = v14;
    if (v7)
    {
      uint64_t v10 = objc_msgSend_container(self, v8, v9);
      uint64_t v12 = objc_msgSend_cacheForContainer_(CKDShareIDCache, v11, (uint64_t)v10);

      objc_msgSend_removeRecordID_(v12, v13, (uint64_t)v14);
      id v4 = v14;
    }
  }
}

- (void)updateShareIDCacheWithDeletedZoneID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    BOOL v7 = objc_msgSend_databaseScope(self, v5, v6) == 3;
    id v4 = v14;
    if (v7)
    {
      uint64_t v10 = objc_msgSend_container(self, v8, v9);
      uint64_t v12 = objc_msgSend_cacheForContainer_(CKDShareIDCache, v11, (uint64_t)v10);

      objc_msgSend_removeZone_(v12, v13, (uint64_t)v14);
      id v4 = v14;
    }
  }
}

- (id)recordIDsUsedInZones:(id)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (BOOL)isFullZoneRequest
{
  return 0;
}

- (id)recordIDs:(id)a3 filteredByZones:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v21, v25, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unint64_t v17 = objc_msgSend_zoneID(v16, v11, v12, (void)v21);
        int v19 = objc_msgSend_containsObject_(v6, v18, (uint64_t)v17);

        if (v19) {
          objc_msgSend_addObject_(v7, v11, (uint64_t)v16);
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v21, v25, 16);
    }
    while (v13);
  }

  return v7;
}

- (void)_finalizeRequestOperations:(id)a3 request:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v65 = a4;
  if (objc_msgSend_requiresCKAnonymousUserIDs(self, v7, v8)
    && objc_msgSend_requiresCKAnonymousSignature(self, v9, v10))
  {
    v63 = objc_msgSend_uncompressedDataForStreamedObjects_(CKDProtobufStreamWriter, v11, (uint64_t)v6);
    v64 = objc_opt_new();
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    obuint64_t j = v6;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v72, v83, 16);
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = *(void *)v73;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v73 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v72 + 1) + 8 * i);
          id v71 = 0;
          int v19 = objc_msgSend_returnVerificationKeyAndSignatureForRequestOperation_dataToBeSigned_error_(self, v14, v18, v63, &v71);
          id v20 = v71;
          if (v20) {
            BOOL v23 = 1;
          }
          else {
            BOOL v23 = v19 == 0;
          }
          if (v23)
          {
            v50 = v20;
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v51 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              uint64_t v59 = v51;
              uint64_t v62 = objc_msgSend_requestUUID(self, v60, v61);
              *(_DWORD *)buf = 138543618;
              uint64_t v80 = v62;
              __int16 v81 = 2114;
              v82 = v50;
              _os_log_error_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_ERROR, "Failed to generate signature for A2A request %{public}@: %{public}@", buf, 0x16u);
            }
            v53 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v54 = *MEMORY[0x1E4F19DD8];
            if (v50)
            {
              uint64_t v77 = *MEMORY[0x1E4F28A50];
              v78 = v50;
              v55 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v52, (uint64_t)&v78, &v77, 1);
              objc_msgSend_errorWithDomain_code_userInfo_(v53, v56, v54, 5002, v55);
            }
            else
            {
              v55 = 0;
              objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v52, v54, 5002, 0);
            v57 = };
            objc_msgSend_finishWithError_(self, v58, (uint64_t)v57);

            if (v50) {
            goto LABEL_34;
            }
          }
          long long v24 = objc_msgSend_v1(v19, v21, v22);
          uint64_t v27 = objc_msgSend_v2(v19, v25, v26);
          uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v64, v28, (uint64_t)v24);

          if (!v29) {
            objc_msgSend_setObject_forKeyedSubscript_(v64, v30, (uint64_t)v27, v24);
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v72, v83, 16);
        if (v15) {
          continue;
        }
        break;
      }
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    obuint64_t j = v64;
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v67, v76, 16);
    if (v32)
    {
      uint64_t v34 = v32;
      uint64_t v35 = 0;
      uint64_t v36 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v68 != v36) {
            objc_enumerationMutation(obj);
          }
          v38 = *(void **)(*((void *)&v67 + 1) + 8 * j);
          uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(obj, v33, (uint64_t)v38);
          v40 = NSString;
          uint64_t v42 = objc_msgSend_base64EncodedStringWithOptions_(v38, v41, 0);
          objc_super v44 = objc_msgSend_base64EncodedStringWithOptions_(v39, v43, 0);
          v46 = objc_msgSend_stringWithFormat_(v40, v45, @"key=\"%@\",signature=\"%@\"", v42, v44);

          uint64_t v48 = objc_msgSend_stringWithFormat_(NSString, v47, @"X-CloudKit-A2A-Share-Auth%lu", v35 + j);
          objc_msgSend_setValue_forHTTPHeaderField_(v65, v49, (uint64_t)v46, v48);
        }
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v67, v76, 16);
        v35 += j;
      }
      while (v34);
    }
LABEL_34:
  }
}

- (id)requestOperationCountsByOperationType
{
  v3 = objc_msgSend_countsByRequestOperationType(self, a2, v2);
  id v6 = objc_msgSend_copy(v3, v4, v5);

  return v6;
}

- (void)_registerRequestOperationTypesForOperations:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  objc_msgSend_setCountsByRequestOperationType_(self, v6, (uint64_t)v5);

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v45, v49, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v46;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v45 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend_countsByRequestOperationType(self, v9, v10);
        uint64_t v16 = (void *)MEMORY[0x1E4F28ED0];
        int v19 = objc_msgSend_request(v14, v17, v18);
        uint64_t v22 = objc_msgSend_type(v19, v20, v21);
        long long v24 = objc_msgSend_numberWithInt_(v16, v23, v22);
        uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v15, v25, (uint64_t)v24);

        if (v26)
        {
          uint64_t v29 = (void *)MEMORY[0x1E4F28ED0];
          uint64_t v30 = objc_msgSend_integerValue(v26, v27, v28);
          uint64_t v32 = objc_msgSend_numberWithInteger_(v29, v31, v30 + 1);
        }
        else
        {
          uint64_t v32 = &unk_1F20AC678;
        }
        id v33 = objc_msgSend_countsByRequestOperationType(self, v27, v28);
        uint64_t v34 = (void *)MEMORY[0x1E4F28ED0];
        v37 = objc_msgSend_request(v14, v35, v36);
        uint64_t v40 = objc_msgSend_type(v37, v38, v39);
        uint64_t v42 = objc_msgSend_numberWithInt_(v34, v41, v40);
        objc_msgSend_setObject_forKeyedSubscript_(v33, v43, (uint64_t)v32, v42);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v45, v49, 16);
    }
    while (v11);
  }
}

- (BOOL)hasRequestBody
{
  return 1;
}

- (BOOL)expectsResponseBody
{
  return 1;
}

- (void)_authTokenWithCompletionHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v6 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v6;
    uint64_t v12 = objc_msgSend_requestUUID(self, v10, v11);
    int v29 = 138543362;
    uint64_t v30 = v12;
    _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "req: %{public}@, \"Fetching auth token\"", (uint8_t *)&v29, 0xCu);
  }
  int v13 = objc_msgSend_usesiCloudAuthToken(self, v7, v8);
  if (v13 == objc_msgSend_usesCloudKitAuthToken(self, v14, v15))
  {
    uint64_t v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, @"CKDURLRequest.m", 702, @"You can't set both usesiCloudAuthToken and usesCloudKitAuthToken to the same value");
  }
  uint64_t v18 = objc_msgSend_container(self, v16, v17);
  int v21 = objc_msgSend_usesCloudKitAuthToken(self, v19, v20);
  long long v24 = objc_msgSend_account(v18, v22, v23);
  uint64_t v26 = v24;
  if (v21) {
    objc_msgSend_cloudKitAuthTokenWithContainer_completionHandler_(v24, v25, (uint64_t)v18, v5);
  }
  else {
    objc_msgSend_iCloudAuthTokenWithContainer_completionHandler_(v24, v25, (uint64_t)v18, v5);
  }
}

- (void)_renewAuthTokenWithCompletionHandler:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_msgSend_setIsWaitingOnAuthRenew_(self, v6, 1);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  BOOL v7 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v7;
    int v13 = objc_msgSend_requestUUID(self, v11, v12);
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    uint64_t v17 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v16, 1, 0, 0);
    uint64_t v20 = objc_msgSend_CKPropertiesStyleString(v17, v18, v19);
    uint64_t v22 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v21, 0, 1, 0);
    uint64_t v25 = objc_msgSend_CKPropertiesStyleString(v22, v23, v24);
    *(_DWORD *)buf = 138544386;
    long long v67 = v13;
    __int16 v68 = 2114;
    long long v69 = v15;
    __int16 v70 = 2048;
    id v71 = self;
    __int16 v72 = 2114;
    long long v73 = v20;
    __int16 v74 = 2112;
    long long v75 = v25;
    _os_log_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Preparing auth token for request \" \"<%{public}@: %p; %{public}@, %@>\"",
      buf,
      0x34u);
  }
  int v26 = objc_msgSend_usesiCloudAuthToken(self, v8, v9);
  if (v26 == objc_msgSend_usesCloudKitAuthToken(self, v27, v28))
  {
    __int16 v58 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v29, v30);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v58, v59, (uint64_t)a2, self, @"CKDURLRequest.m", 717, @"You can't set both usesiCloudAuthToken and usesCloudKitAuthToken to the same value");
  }
  objc_initWeak((id *)buf, self);
  uint64_t v60 = MEMORY[0x1E4F143A8];
  uint64_t v61 = 3221225472;
  uint64_t v62 = sub_1C4DB148C;
  v63 = &unk_1E64F2540;
  objc_copyWeak(&v65, (id *)buf);
  id v31 = v5;
  id v64 = v31;
  uint64_t v32 = _Block_copy(&v60);
  uint64_t v35 = objc_msgSend_container(self, v33, v34, v60, v61, v62, v63);
  if (objc_msgSend_usesCloudKitAuthToken(self, v36, v37))
  {
    uint64_t v40 = objc_msgSend_account(v35, v38, v39);
    uint64_t v43 = objc_msgSend_authPromptReason(self, v41, v42);
    long long v46 = objc_msgSend_cloudKitAuthToken(self, v44, v45);
    objc_msgSend_renewCloudKitAuthTokenWithReason_shouldForce_container_failedToken_completionHandler_(v40, v47, (uint64_t)v43, 0, v35, v46, v32);
  }
  if (objc_msgSend_usesiCloudAuthToken(self, v38, v39))
  {
    uint64_t v50 = objc_msgSend_account(v35, v48, v49);
    v53 = objc_msgSend_authPromptReason(self, v51, v52);
    uint64_t v56 = objc_msgSend_iCloudAuthToken(self, v54, v55);
    objc_msgSend_renewiCloudAuthTokenWithReason_shouldForce_container_failedToken_completionHandler_(v50, v57, (uint64_t)v53, 0, v35, v56, v32);
  }
  objc_destroyWeak(&v65);
  objc_destroyWeak((id *)buf);
}

- (void)_handleAuthFailure
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v4 = (os_log_t *)MEMORY[0x1E4F1A530];
  id v5 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v5;
    uint64_t v11 = objc_msgSend_requestUUID(self, v9, v10);
    *(_DWORD *)buf = 138543362;
    uint64_t v43 = v11;
    _os_log_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Handling authentication failure\"", buf, 0xCu);
  }
  objc_msgSend_invalidateCachedAccountInfo(MEMORY[0x1E4F19E20], v6, v7);
  if (objc_msgSend_isCancelled(self, v12, v13))
  {
    if (*v3 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v16 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = v16;
      int v21 = objc_msgSend_requestUUID(self, v19, v20);
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v21;
      _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Auth failed but this request is already finished\"", buf, 0xCu);
    }
    objc_msgSend_finishWithError_(self, v17, 0);
  }
  else if (objc_msgSend_didRetryAuth(self, v14, v15))
  {
    if (*v3 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v23 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = v23;
      uint64_t v39 = objc_msgSend_requestUUID(self, v37, v38);
      *(_DWORD *)buf = 138543618;
      uint64_t v43 = v39;
      __int16 v44 = 2112;
      uint64_t v45 = self;
      _os_log_error_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Our token auth is bad and we've already retried it. Giving up on request %@\"", buf, 0x16u);
    }
    uint64_t v28 = objc_msgSend_lastRetryAuthError(self, v24, v25);
    if (!v28)
    {
      uint64_t v28 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v26, *MEMORY[0x1E4F19DD8], 2011, @"Couldn't get an authentication token");
    }
    int v29 = objc_msgSend_container(self, v26, v27);
    id v31 = objc_msgSend_possiblyWrappedAuthTokenErrorGivenError_(v29, v30, (uint64_t)v28);

    objc_msgSend_finishWithError_(self, v32, (uint64_t)v31);
  }
  else
  {
    objc_msgSend_setDidRetryAuth_(self, v22, 1);
    objc_msgSend_setIsHandlingAuthRetry_(self, v33, 1);
    objc_msgSend_tearDownResourcesAndReleaseTheZoneLocks_(self, v34, 0);
    objc_initWeak((id *)buf, self);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = sub_1C4DB18B8;
    v40[3] = &unk_1E64F2568;
    objc_copyWeak(&v41, (id *)buf);
    objc_msgSend__renewAuthTokenWithCompletionHandler_(self, v35, (uint64_t)v40);
    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);
  }
}

- (void)retryRequest
{
  objc_msgSend_container(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v5, v4, (uint64_t)self);
}

- (int64_t)_handleServerProtobufResult:(id)a3 rawData:(id)a4
{
  uint64_t v240 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_operation(self, v6, v7);
  uint64_t v11 = objc_msgSend_container(self, v9, v10);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v5;
    uint64_t v15 = objc_msgSend_header(v12, v13, v14);
    uint64_t v18 = objc_msgSend_throttleConfigs(v15, v16, v17);

    if (objc_msgSend_count(v18, v19, v20))
    {
      long long v223 = self;
      id v228 = v12;
      os_log_t v23 = v8;
      uint64_t v24 = objc_msgSend_deviceContext(v8, v21, v22);
      uint64_t v27 = objc_msgSend_throttleManager(v24, v25, v26);

      long long v233 = 0u;
      long long v234 = 0u;
      long long v231 = 0u;
      long long v232 = 0u;
      uint64_t v28 = v18;
      id v29 = v18;
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v231, v239, 16);
      if (v31)
      {
        uint64_t v33 = v31;
        uint64_t v34 = *(void *)v232;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v232 != v34) {
              objc_enumerationMutation(v29);
            }
            uint64_t v37 = objc_msgSend_throttleFromPThrottlingConfig_(CKDThrottleManager, v32, *(void *)(*((void *)&v231 + 1) + 8 * i));
            if (v37) {
              objc_msgSend_addThrottle_(v27, v36, (uint64_t)v37);
            }
          }
          uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v231, v239, 16);
        }
        while (v33);
      }

      uint64_t v8 = v23;
      id v12 = v228;
      uint64_t v18 = v28;
      self = v223;
    }
    sub_1C4DAF60C(self, v21, v22);
    uint64_t v40 = objc_msgSend_response(v12, v38, v39);
    if (objc_msgSend_hasOperationUUID(v40, v41, v42))
    {
    }
    else
    {
      char v48 = objc_msgSend_requiresCKAnonymousUserIDs(self, v43, v44);

      if ((v48 & 1) == 0)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v88 = (void *)*MEMORY[0x1E4F1A530];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_FAULT))
        {
          v125 = v88;
          v128 = objc_msgSend_requestUUID(self, v126, v127);
          *(_DWORD *)buf = 138543618;
          v236 = v128;
          __int16 v237 = 2112;
          v238[0] = v12;
          _os_log_fault_impl(&dword_1C4CFF000, v125, OS_LOG_TYPE_FAULT, "req: %{public}@, \"Parsed a response object with no operationUUID.  Result %@\"", buf, 0x16u);
        }
        v91 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v92 = *MEMORY[0x1E4F19DD8];
        uint64_t v51 = objc_msgSend_result(v12, v89, v90);
        v93 = sub_1C4E940D0(self, v51);
        v95 = objc_msgSend_errorWithDomain_code_userInfo_(v91, v94, v92, 1005, v93);
        objc_msgSend_finishWithError_(self, v96, (uint64_t)v95);

        goto LABEL_34;
      }
    }
    if (!objc_msgSend_hasResult(v12, v45, v46)) {
      goto LABEL_28;
    }
    uint64_t v51 = objc_msgSend_result(v12, v49, v50);
    if (!objc_msgSend_hasCode(v51, v52, v53))
    {
LABEL_45:
      int64_t v47 = 0;
      goto LABEL_91;
    }
    uint64_t v56 = objc_msgSend_result(v12, v54, v55);
    int v59 = objc_msgSend_code(v56, v57, v58);

    if (v59 != 3)
    {
LABEL_28:
      int64_t v47 = 0;
LABEL_92:

      goto LABEL_93;
    }
    uint64_t v62 = objc_msgSend_result(v12, v60, v61);
    uint64_t v51 = objc_msgSend_error(v62, v63, v64);

    if (objc_msgSend_hasClientError(v51, v65, v66))
    {
      long long v69 = objc_msgSend_clientError(v51, v67, v68);
      int hasType = objc_msgSend_hasType(v69, v70, v71);

      if (hasType)
      {
        long long v73 = objc_msgSend_clientError(v51, v67, v68);
        int v76 = objc_msgSend_type(v73, v74, v75);

        switch(v76)
        {
          case 2:
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v79 = (void *)*MEMORY[0x1E4F1A530];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
            {
              v82 = v79;
              uint64_t v85 = objc_msgSend_requestUUID(self, v83, v84);
              *(_DWORD *)buf = 138543362;
              v236 = v85;
              _os_log_impl(&dword_1C4CFF000, v82, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Expired app config\"", buf, 0xCu);
            }
            v86 = objc_msgSend_sharedManager(CKDServerConfigurationManager, v80, v81);
            objc_msgSend_expireConfigurationForContainer_(v86, v87, (uint64_t)v11);
            goto LABEL_76;
          case 3:
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v155 = (void *)*MEMORY[0x1E4F1A530];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
            {
              v158 = v155;
              v161 = objc_msgSend_requestUUID(self, v159, v160);
              *(_DWORD *)buf = 138543362;
              v236 = v161;
              _os_log_impl(&dword_1C4CFF000, v158, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Expired global config\"", buf, 0xCu);
            }
            v86 = objc_msgSend_sharedManager(CKDServerConfigurationManager, v156, v157);
            objc_msgSend_expireGlobalConfiguration(v86, v162, v163);
LABEL_76:

            objc_msgSend_fetchConfigurationForOperation_withCompletionHandler_(v11, v164, (uint64_t)v8, 0);
            goto LABEL_90;
          case 4:
            v165 = (void *)MEMORY[0x1E4F1A550];
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v166 = (void *)*MEMORY[0x1E4F1A530];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
            {
              v212 = v166;
              v215 = objc_msgSend_requestUUID(self, v213, v214);
              *(_DWORD *)buf = 138543362;
              v236 = v215;
              _os_log_error_impl(&dword_1C4CFF000, v212, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Syntax error in request\"", buf, 0xCu);
            }
            v169 = objc_msgSend_errorDescription(v51, v167, v168);
            uint64_t v172 = objc_msgSend_lowercaseString(v169, v170, v171);

            if (objc_msgSend_hasPrefix_(v172, v173, @"no operations present"))
            {
              if (*v165 != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              v230 = v172;
              v174 = (void *)*MEMORY[0x1E4F1A530];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
              {
                v218 = v174;
                long long v221 = objc_msgSend_requestUUID(self, v219, v220);
                *(_DWORD *)buf = 138543362;
                v236 = v221;
                _os_log_error_impl(&dword_1C4CFF000, v218, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Server could not find any request operations in this request. Giving up.\"", buf, 0xCu);
              }
              uint64_t v225 = (void *)MEMORY[0x1E4F28C58];
              v227 = objc_msgSend_result(v12, v175, v176, *MEMORY[0x1E4F19DD8]);
              uint64_t v177 = sub_1C4E94D98(v227);
              uint64_t v180 = objc_msgSend_result(v12, v178, v179);
              v181 = sub_1C4E940D0(self, v180);
              uint64_t v183 = objc_msgSend_errorWithDomain_code_userInfo_(v225, v182, v222, v177, v181);
              objc_msgSend_finishWithError_(self, v184, (uint64_t)v183);

              int64_t v47 = 2;
              uint64_t v172 = v230;
            }
            else
            {
              int64_t v47 = 1;
            }

            goto LABEL_91;
          case 5:
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v185 = (void *)*MEMORY[0x1E4F1A530];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR)) {
              goto LABEL_90;
            }
            uint64_t v115 = v185;
            v118 = objc_msgSend_requestUUID(self, v216, v217);
            *(_DWORD *)buf = 138543362;
            v236 = v118;
            uint64_t v119 = "req: %{public}@, \"Forbidden resource in request\"";
            goto LABEL_56;
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
            goto LABEL_67;
          case 11:
            goto LABEL_95;
          case 12:
            uint64_t v187 = objc_msgSend_containerScopedUserID(v11, v77, v78);

            if (v187)
            {
LABEL_95:
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              v189 = (void *)*MEMORY[0x1E4F1A530];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
              {
                v208 = v189;
                v211 = objc_msgSend_requestUUID(self, v209, v210);
                *(_DWORD *)buf = 138543362;
                v236 = v211;
                _os_log_error_impl(&dword_1C4CFF000, v208, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Our auth token is bad and we should feel bad.\"", buf, 0xCu);
              }
              objc_msgSend__handleAuthFailure(self, v190, v191);
            }
            else
            {
              uint64_t v192 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v188, *MEMORY[0x1E4F19DD8], 2011, @"Authentication required");
              v194 = objc_msgSend_possiblyWrappedAuthTokenErrorGivenError_(v11, v193, (uint64_t)v192);

              objc_msgSend_finishWithError_(self, v195, (uint64_t)v194);
            }
            goto LABEL_34;
          default:
            if (v76 == 89)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              uint64_t v138 = (void *)*MEMORY[0x1E4F1A530];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
              {
                v139 = v138;
                v142 = objc_msgSend_requestUUID(self, v140, v141);
                *(_DWORD *)buf = 138543362;
                v236 = v142;
                v143 = "req: %{public}@, \"Server could not verify the anonymous-to-server signatures supplied. Giving up.\"";
                v144 = v139;
                uint32_t v145 = 12;
                goto LABEL_104;
              }
              goto LABEL_61;
            }
LABEL_67:
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v146 = (void *)*MEMORY[0x1E4F1A530];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
            {
              uint64_t v115 = v146;
              v118 = objc_msgSend_requestUUID(self, v147, v148);
              int v151 = objc_msgSend_clientError(v51, v149, v150);
              int v154 = objc_msgSend_type(v151, v152, v153);
              *(_DWORD *)buf = 138543874;
              v236 = v118;
              __int16 v237 = 1024;
              LODWORD(v238[0]) = v154;
              WORD2(v238[0]) = 2112;
              *(void *)((char *)v238 + 6) = v51;
              _os_log_error_impl(&dword_1C4CFF000, v115, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Received error %d from the server: %@\"", buf, 0x1Cu);

              goto LABEL_57;
            }
            break;
        }
        goto LABEL_90;
      }
    }
    if (objc_msgSend_hasServerError(v51, v67, v68))
    {
      uint64_t v99 = objc_msgSend_serverError(v51, v97, v98);
      int v102 = objc_msgSend_hasType(v99, v100, v101);

      if (v102)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v103 = (void *)*MEMORY[0x1E4F1A530];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
        {
          v196 = v103;
          v199 = objc_msgSend_requestUUID(self, v197, v198);
          v202 = objc_msgSend_serverError(v51, v200, v201);
          int v205 = objc_msgSend_type(v202, v203, v204);
          *(_DWORD *)buf = 138543874;
          v236 = v199;
          __int16 v237 = 1024;
          LODWORD(v238[0]) = v205;
          WORD2(v238[0]) = 2112;
          *(void *)((char *)v238 + 6) = v51;
          _os_log_error_impl(&dword_1C4CFF000, v196, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Received error %d from the server: %@\"", buf, 0x1Cu);
        }
        v106 = objc_msgSend_serverError(v51, v104, v105);
        unsigned int v109 = objc_msgSend_type(v106, v107, v108);

        if (v109 > 9)
        {
LABEL_44:
          if (v109 - 200001 >= 5) {
            goto LABEL_45;
          }
          goto LABEL_61;
        }
        if (((1 << v109) & 0x3D6) == 0)
        {
          if (v109 != 3) {
            goto LABEL_44;
          }
LABEL_90:
          int64_t v47 = 1;
          goto LABEL_91;
        }
LABEL_61:
        v226 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v224 = *MEMORY[0x1E4F19DD8];
        v229 = objc_msgSend_result(v12, v110, v111);
        uint64_t v130 = sub_1C4E94D98(v229);
        v133 = objc_msgSend_result(v12, v131, v132);
        uint64_t v134 = sub_1C4E940D0(self, v133);
        v136 = objc_msgSend_errorWithDomain_code_userInfo_(v226, v135, v224, v130, v134);
        objc_msgSend_finishWithError_(self, v137, (uint64_t)v136);

LABEL_34:
        int64_t v47 = 2;
LABEL_91:

        goto LABEL_92;
      }
    }
    if (objc_msgSend_hasExtensionError(v51, v97, v98))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v114 = (void *)*MEMORY[0x1E4F1A530];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR)) {
        goto LABEL_90;
      }
      uint64_t v115 = v114;
      v118 = objc_msgSend_requestUUID(self, v116, v117);
      *(_DWORD *)buf = 138543362;
      v236 = v118;
      uint64_t v119 = "req: %{public}@, \"Plugin error in request\"";
    }
    else
    {
      int hasAuxiliaryError = objc_msgSend_hasAuxiliaryError(v51, v112, v113);
      v121 = (void *)*MEMORY[0x1E4F1A548];
      if (!hasAuxiliaryError)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v121);
        }
        v129 = (void *)*MEMORY[0x1E4F1A530];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
        {
          v139 = v129;
          v142 = objc_msgSend_requestUUID(self, v206, v207);
          *(_DWORD *)buf = 138543618;
          v236 = v142;
          __int16 v237 = 2112;
          v238[0] = v51;
          v143 = "req: %{public}@, \"Received unknown error from the server: %@\"";
          v144 = v139;
          uint32_t v145 = 22;
LABEL_104:
          _os_log_error_impl(&dword_1C4CFF000, v144, OS_LOG_TYPE_ERROR, v143, buf, v145);
        }
        goto LABEL_61;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v121);
      }
      uint64_t v122 = (void *)*MEMORY[0x1E4F1A530];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR)) {
        goto LABEL_90;
      }
      uint64_t v115 = v122;
      v118 = objc_msgSend_requestUUID(self, v123, v124);
      *(_DWORD *)buf = 138543362;
      v236 = v118;
      uint64_t v119 = "req: %{public}@, \"Auxiliary error in request\"";
    }
LABEL_56:
    _os_log_error_impl(&dword_1C4CFF000, v115, OS_LOG_TYPE_ERROR, v119, buf, 0xCu);
LABEL_57:

    goto LABEL_90;
  }
  int64_t v47 = 0;
LABEL_93:

  return v47;
}

- (id)_protobufObjectParsedBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4DB2D4C;
  v4[3] = &unk_1E64F25B8;
  objc_copyWeak(&v5, &location);
  uint64_t v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)_handleServerJSONResult:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v9 = objc_msgSend_objectForKey_(v5, v6, @"throttleConfigs");
    if (v9)
    {
      uint64_t v10 = objc_msgSend_operation(self, v7, v8);
      uint64_t v13 = objc_msgSend_deviceContext(v10, v11, v12);
      os_log_t v16 = objc_msgSend_throttleManager(v13, v14, v15);

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      uint64_t v54 = v9;
      id v17 = v9;
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v55, v65, 16);
      if (v19)
      {
        uint64_t v21 = v19;
        uint64_t v22 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v56 != v22) {
              objc_enumerationMutation(v17);
            }
            uint64_t v25 = objc_msgSend_throttleFromServerJSONDictionary_(CKDThrottleManager, v20, *(void *)(*((void *)&v55 + 1) + 8 * i));
            if (v25) {
              objc_msgSend_addThrottle_(v16, v24, (uint64_t)v25);
            }
          }
          uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v55, v65, 16);
        }
        while (v21);
      }

      uint64_t v9 = v54;
    }
    sub_1C4DAF60C(self, v7, v8);
    uint64_t v28 = objc_msgSend_response(self, v26, v27);
    uint64_t v31 = objc_msgSend_statusCode(v28, v29, v30);

    if ((unint64_t)(v31 - 200) >= 0x64)
    {
      uint64_t v42 = objc_msgSend__parseErrorDictionaryForJson_(self, v32, (uint64_t)v5);
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v43 = (void *)*MEMORY[0x1E4F1A530];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v46 = v43;
        uint64_t v49 = objc_msgSend_requestUUID(self, v47, v48);
        *(_DWORD *)buf = 138543874;
        uint64_t v60 = v49;
        __int16 v61 = 2048;
        uint64_t v62 = v31;
        __int16 v63 = 2112;
        uint64_t v64 = v42;
        _os_log_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Warn: request failed with http status %ld: %@\"", buf, 0x20u);
      }
      if (v31 == 401) {
        objc_msgSend__handleAuthFailure(self, v44, v45);
      }
      else {
        objc_msgSend_finishWithError_(self, v44, (uint64_t)v42);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v33 = (void *)*MEMORY[0x1E4F1A530];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v50 = v33;
        uint64_t v53 = objc_msgSend_requestUUID(self, v51, v52);
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v53;
        _os_log_debug_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Successfully parsed JSON object\"", buf, 0xCu);
      }
      objc_msgSend_requestDidParseJSONObject_(self, v34, (uint64_t)v5);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v35 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = v35;
      uint64_t v40 = objc_msgSend_requestUUID(self, v38, v39);
      *(_DWORD *)buf = 138543618;
      uint64_t v60 = v40;
      __int16 v61 = 2112;
      uint64_t v62 = (uint64_t)v4;
      _os_log_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Warn: Cannot handle JSON response: %@\"", buf, 0x16u);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v36, *MEMORY[0x1E4F19DD8], 1005, @"Cannot handle JSON response: %@", v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v41, (uint64_t)v5);
  }
}

- (id)_parseErrorDictionaryForJson:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend_objectForKey_(v4, v5, @"type");
  uint64_t v8 = objc_msgSend_objectForKey_(v4, v7, @"title");

  uint64_t v9 = objc_opt_new();
  uint64_t v12 = objc_msgSend_requestUUID(self, v10, v11);

  if (v12)
  {
    uint64_t v15 = objc_msgSend_requestUUID(self, v13, v14);
    objc_msgSend_setObject_forKeyedSubscript_(v9, v16, (uint64_t)v15, *MEMORY[0x1E4F19DA0]);
  }
  id v17 = objc_msgSend_operation(self, v13, v14);
  uint64_t v20 = objc_msgSend_topmostParentOperation(v17, v18, v19);
  os_log_t v23 = objc_msgSend_operationID(v20, v21, v22);

  if (v23) {
    objc_msgSend_setObject_forKeyedSubscript_(v9, v24, (uint64_t)v23, *MEMORY[0x1E4F19C50]);
  }
  uint64_t v26 = objc_msgSend_container(self, v24, v25);
  id v29 = objc_msgSend_containerID(v26, v27, v28);

  if (v29)
  {
    uint64_t v32 = objc_msgSend_containerIdentifier(v29, v30, v31);
    objc_msgSend_setObject_forKeyedSubscript_(v9, v33, (uint64_t)v32, *MEMORY[0x1E4F19BF8]);
  }
  if (!objc_msgSend_length(v6, v30, v31)
    || !objc_msgSend_hasPrefix_(v6, v34, @"/errors/ck/"))
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v34, *MEMORY[0x1E4F19DD8], 1000, v9);
    goto LABEL_246;
  }
  uint64_t v36 = objc_msgSend_length(@"/errors/ck/", v34, v35);
  uint64_t v38 = objc_msgSend_substringFromIndex_(v6, v37, v36);

  uint64_t v40 = objc_msgSend_componentsSeparatedByString_(v38, v39, @"/");
  if (objc_msgSend_count(v40, v41, v42) == 2)
  {
    uint64_t v44 = objc_msgSend_objectAtIndexedSubscript_(v40, v43, 0);
    if (objc_msgSend_isEqualToString_(v44, v45, @"client"))
    {

      goto LABEL_14;
    }
    uint64_t v48 = objc_msgSend_objectAtIndexedSubscript_(v40, v46, 0);
    int isEqualToString = objc_msgSend_isEqualToString_(v48, v49, @"server");

    if (isEqualToString)
    {
LABEL_14:
      uint64_t v51 = objc_msgSend_objectAtIndexedSubscript_(v40, v47, 0);
      int v53 = objc_msgSend_isEqualToString_(v51, v52, @"client");

      if (v53)
      {
        int v55 = 1;
        objc_msgSend_objectAtIndexedSubscript_(v40, v54, 1);
        id v56 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v56, v57, @"unknown") & 1) == 0)
        {
          if (objc_msgSend_isEqualToString_(v56, v58, @"expiredAppConfig"))
          {
            int v55 = 2;
          }
          else if (objc_msgSend_isEqualToString_(v56, v59, @"expiredGlobalConfig"))
          {
            int v55 = 3;
          }
          else if (objc_msgSend_isEqualToString_(v56, v71, @"badSyntax"))
          {
            int v55 = 4;
          }
          else if (objc_msgSend_isEqualToString_(v56, v73, @"forbidden"))
          {
            int v55 = 5;
          }
          else if (objc_msgSend_isEqualToString_(v56, v75, @"throttled"))
          {
            int v55 = 6;
          }
          else if (objc_msgSend_isEqualToString_(v56, v77, @"refused"))
          {
            int v55 = 7;
          }
          else if (objc_msgSend_isEqualToString_(v56, v79, @"notSupported"))
          {
            int v55 = 8;
          }
          else if (objc_msgSend_isEqualToString_(v56, v81, @"exists"))
          {
            int v55 = 9;
          }
          else if (objc_msgSend_isEqualToString_(v56, v83, @"requestAlreadyProcessed"))
          {
            int v55 = 10;
          }
          else if (objc_msgSend_isEqualToString_(v56, v86, @"badAuthToken"))
          {
            int v55 = 11;
          }
          else if (objc_msgSend_isEqualToString_(v56, v87, @"needsAuthentication"))
          {
            int v55 = 12;
          }
          else if (objc_msgSend_isEqualToString_(v56, v89, @"mescalSignatureMissing"))
          {
            int v55 = 13;
          }
          else if (objc_msgSend_isEqualToString_(v56, v91, @"invalidMescalSignature"))
          {
            int v55 = 14;
          }
          else if (objc_msgSend_isEqualToString_(v56, v93, @"opLockFailure"))
          {
            int v55 = 15;
          }
          else if (objc_msgSend_isEqualToString_(v56, v94, @"atomicFailure"))
          {
            int v55 = 16;
          }
          else if (objc_msgSend_isEqualToString_(v56, v95, @"resetNeeded"))
          {
            int v55 = 17;
          }
          else if (objc_msgSend_isEqualToString_(v56, v96, @"fieldsPerTypeLimitExceeded"))
          {
            int v55 = 18;
          }
          else if (objc_msgSend_isEqualToString_(v56, v97, @"typeBusy"))
          {
            int v55 = 19;
          }
          else if (objc_msgSend_isEqualToString_(v56, v98, @"numRecordTypesLimitExceeded"))
          {
            int v55 = 20;
          }
          else if (objc_msgSend_isEqualToString_(v56, v99, @"invalidContainer"))
          {
            int v55 = 21;
          }
          else if (objc_msgSend_isEqualToString_(v56, v100, @"invalidRecordTypeName"))
          {
            int v55 = 22;
          }
          else if (objc_msgSend_isEqualToString_(v56, v101, @"invalidFieldName"))
          {
            int v55 = 23;
          }
          else if (objc_msgSend_isEqualToString_(v56, v102, @"invalidFieldValue"))
          {
            int v55 = 24;
          }
          else if (objc_msgSend_isEqualToString_(v56, v103, @"invalidIdentifier"))
          {
            int v55 = 25;
          }
          else if (objc_msgSend_isEqualToString_(v56, v104, @"fieldNotQueryable"))
          {
            int v55 = 26;
          }
          else if (objc_msgSend_isEqualToString_(v56, v105, @"fieldNotSortable"))
          {
            int v55 = 27;
          }
          else if (objc_msgSend_isEqualToString_(v56, v106, @"queryFilterLimitExceeded"))
          {
            int v55 = 28;
          }
          else if (objc_msgSend_isEqualToString_(v56, v107, @"queryFilterValuesLimitExceeded"))
          {
            int v55 = 29;
          }
          else if (objc_msgSend_isEqualToString_(v56, v108, @"membershipQueryLimitExceeded"))
          {
            int v55 = 30;
          }
          else if (objc_msgSend_isEqualToString_(v56, v109, @"notificationAdditionalFieldLimitExceeded"))
          {
            int v55 = 31;
          }
          else if (objc_msgSend_isEqualToString_(v56, v110, @"notificationAdditionalFieldInvalidType"))
          {
            int v55 = 32;
          }
          else if (objc_msgSend_isEqualToString_(v56, v111, @"subscriptionLimitExceeded"))
          {
            int v55 = 33;
          }
          else if (objc_msgSend_isEqualToString_(v56, v112, @"uniqueTriggerLimitExceeded"))
          {
            int v55 = 34;
          }
          else if (objc_msgSend_isEqualToString_(v56, v113, @"triggerSubscriptionBindingTypeMismatch"))
          {
            int v55 = 35;
          }
          else if (objc_msgSend_isEqualToString_(v56, v114, @"zoneSizeLimitExceeded"))
          {
            int v55 = 36;
          }
          else if (objc_msgSend_isEqualToString_(v56, v115, @"zoneCountLimitExceeded"))
          {
            int v55 = 37;
          }
          else if (objc_msgSend_isEqualToString_(v56, v116, @"uniqueFieldFailure"))
          {
            int v55 = 38;
          }
          else if (objc_msgSend_isEqualToString_(v56, v117, @"validatingReferenceError"))
          {
            int v55 = 39;
          }
          else if (objc_msgSend_isEqualToString_(v56, v118, @"fullResetNeeded"))
          {
            int v55 = 40;
          }
          else if (objc_msgSend_isEqualToString_(v56, v119, @"alreadyShared"))
          {
            int v55 = 41;
          }
          else if (objc_msgSend_isEqualToString_(v56, v120, @"emailOutOfNetwork"))
          {
            int v55 = 42;
          }
          else if (objc_msgSend_isEqualToString_(v56, v121, @"duplicateSubscription"))
          {
            int v55 = 43;
          }
          else if (objc_msgSend_isEqualToString_(v56, v122, @"expiredPutReceipt"))
          {
            int v55 = 46;
          }
          else if (objc_msgSend_isEqualToString_(v56, v123, @"quotaExceeded"))
          {
            int v55 = 47;
          }
          else if (objc_msgSend_isEqualToString_(v56, v124, @"zoneNotFound"))
          {
            int v55 = 48;
          }
          else if (objc_msgSend_isEqualToString_(v56, v125, @"invalidBundleId"))
          {
            int v55 = 49;
          }
          else if (objc_msgSend_isEqualToString_(v56, v126, @"unsupportedDevice"))
          {
            int v55 = 50;
          }
          else if (objc_msgSend_isEqualToString_(v56, v127, @"blocklisted"))
          {
            int v55 = 51;
          }
          else if (objc_msgSend_isEqualToString_(v56, v128, @"recordProtectionInfoTagMismatch"))
          {
            int v55 = 52;
          }
          else if (objc_msgSend_isEqualToString_(v56, v129, @"zoneProtectionInfoTagMismatch"))
          {
            int v55 = 53;
          }
          else if (objc_msgSend_isEqualToString_(v56, v130, @"assetSizeLimitExceeded"))
          {
            int v55 = 54;
          }
          else if (objc_msgSend_isEqualToString_(v56, v131, @"batchOperationLimitExceeded"))
          {
            int v55 = 55;
          }
          else if (objc_msgSend_isEqualToString_(v56, v132, @"requestSizeLimitExceeded"))
          {
            int v55 = 56;
          }
          else if (objc_msgSend_isEqualToString_(v56, v133, @"recordSizeLimitExceeded"))
          {
            int v55 = 57;
          }
          else if (objc_msgSend_isEqualToString_(v56, v134, @"databaseCommitSizeExceeded"))
          {
            int v55 = 58;
          }
          else if (objc_msgSend_isEqualToString_(v56, v135, @"userDeletedDataForZone"))
          {
            int v55 = 59;
          }
          else if (objc_msgSend_isEqualToString_(v56, v136, @"staleRecordUpdate"))
          {
            int v55 = 60;
          }
          else if (objc_msgSend_isEqualToString_(v56, v137, @"shareParticipantLimitExceeded"))
          {
            int v55 = 61;
          }
          else if (objc_msgSend_isEqualToString_(v56, v138, @"shareParticipantError"))
          {
            int v55 = 62;
          }
          else if (objc_msgSend_isEqualToString_(v56, v139, @"pcsChainingError"))
          {
            int v55 = 64;
          }
          else if (objc_msgSend_isEqualToString_(v56, v140, @"hierarchyAlreadyHasShare"))
          {
            int v55 = 65;
          }
          else if (objc_msgSend_isEqualToString_(v56, v141, @"u13Restricted"))
          {
            int v55 = 66;
          }
          else if (objc_msgSend_isEqualToString_(v56, v142, @"managedAppleIdRestricted"))
          {
            int v55 = 67;
          }
          else if (objc_msgSend_isEqualToString_(v56, v143, @"shareParticipantContactError"))
          {
            int v55 = 68;
          }
          else if (objc_msgSend_isEqualToString_(v56, v144, @"recordArchived"))
          {
            int v55 = 69;
          }
          else if (objc_msgSend_isEqualToString_(v56, v145, @"databaseAccessDenied"))
          {
            int v55 = 70;
          }
          else if (objc_msgSend_isEqualToString_(v56, v146, @"parentHierarchyDepthLimitExceeded"))
          {
            int v55 = 71;
          }
          else if (objc_msgSend_isEqualToString_(v56, v147, @"zonePcsUserIdentityUnknown"))
          {
            int v55 = 72;
          }
          else if (objc_msgSend_isEqualToString_(v56, v148, @"managedAppleIdBackupBlocked"))
          {
            int v55 = 73;
          }
          else if (objc_msgSend_isEqualToString_(v56, v149, @"outOfNetworkUsersUnsupported"))
          {
            int v55 = 75;
          }
          else if (objc_msgSend_isEqualToString_(v56, v150, @"gameAssignmentNotFound"))
          {
            int v55 = 76;
          }
          else if (objc_msgSend_isEqualToString_(v56, v151, @"queryBeginsWithValueLengthLimitExceeded"))
          {
            int v55 = 77;
          }
          else if (objc_msgSend_isEqualToString_(v56, v152, @"userResetEncryptedData"))
          {
            int v55 = 78;
          }
          else if (objc_msgSend_isEqualToString_(v56, v153, @"mergeableValueNotFound"))
          {
            int v55 = 79;
          }
          else if (objc_msgSend_isEqualToString_(v56, v154, @"invalidPublicKey"))
          {
            int v55 = 80;
          }
          else if (objc_msgSend_isEqualToString_(v56, v155, @"mergeableDeltaSizeLimitExceeded"))
          {
            int v55 = 81;
          }
          else if (objc_msgSend_isEqualToString_(v56, v156, @"mergeableDeltaNotFound"))
          {
            int v55 = 82;
          }
          else if (objc_msgSend_isEqualToString_(v56, v157, @"mergeableDeltaInvalid"))
          {
            int v55 = 83;
          }
          else if (objc_msgSend_isEqualToString_(v56, v158, @"mergeableValueCompactionRequired"))
          {
            int v55 = 84;
          }
          else if (objc_msgSend_isEqualToString_(v56, v159, @"unprovisionedICloudAccount"))
          {
            int v55 = 85;
          }
          else if (objc_msgSend_isEqualToString_(v56, v160, @"purgedICloudAccount"))
          {
            int v55 = 86;
          }
          else if (objc_msgSend_isEqualToString_(v56, v161, @"invalidDsidForICloudAccount"))
          {
            int v55 = 87;
          }
          else if (objc_msgSend_isEqualToString_(v56, v162, @"shareRegionUnsupported"))
          {
            int v55 = 88;
          }
          else if (objc_msgSend_isEqualToString_(v56, v163, @"a2aSignatureValidationError"))
          {
            int v55 = 89;
          }
          else if (objc_msgSend_isEqualToString_(v56, v164, @"participantIdMismatch"))
          {
            int v55 = 90;
          }
          else if (objc_msgSend_isEqualToString_(v56, v165, @"groupKitSignatureValidationError"))
          {
            int v55 = 94;
          }
          else if (objc_msgSend_isEqualToString_(v56, v166, @"shareRequestAccessError"))
          {
            int v55 = 95;
          }
          else if (objc_msgSend_isEqualToString_(v56, v167, @"shareRequestAccessLimitExceeded"))
          {
            int v55 = 96;
          }
          else if (objc_msgSend_isEqualToString_(v56, v168, @"shareRequestAccessShareAcceptRequired"))
          {
            int v55 = 97;
          }
          else if (objc_msgSend_isEqualToString_(v56, v169, @"shareBlockedUserCanNotBeParticipant"))
          {
            int v55 = 98;
          }
          else if (objc_msgSend_isEqualToString_(v56, v170, @"shareBlockedLimitExceeded"))
          {
            int v55 = 100;
          }
          else if (objc_msgSend_isEqualToString_(v56, v171, @"zoneAncestryOpLockFailure"))
          {
            int v55 = 101;
          }
          else if (objc_msgSend_isEqualToString_(v56, v172, @"invalidTimestamp"))
          {
            int v55 = 102;
          }
          else if (objc_msgSend_isEqualToString_(v56, v173, @"invalidSignature"))
          {
            int v55 = 103;
          }
          else if (objc_msgSend_isEqualToString_(v56, v174, @"unsupportedSigningIdentity"))
          {
            int v55 = 104;
          }
          else if (objc_msgSend_isEqualToString_(v56, v175, @"invalidSignedBlob"))
          {
            int v55 = 105;
          }
          else if (objc_msgSend_isEqualToString_(v56, v176, @"unsupportedVersion"))
          {
            int v55 = 106;
          }
          else
          {
            int v55 = 1;
          }
        }

        uint64_t v92 = sub_1C4E949E8(v55);
      }
      else
      {
        __int16 v61 = objc_msgSend_objectAtIndexedSubscript_(v40, v54, 0);
        int v63 = objc_msgSend_isEqualToString_(v61, v62, @"server");

        if (!v63)
        {
          uint64_t v60 = 1000;
LABEL_242:
          if (objc_msgSend_length(v8, v64, v65))
          {
            objc_msgSend_setObject_forKeyedSubscript_(v9, v177, (uint64_t)v8, *MEMORY[0x1E4F28568]);
            objc_msgSend_setObject_forKeyedSubscript_(v9, v179, (uint64_t)v8, *MEMORY[0x1E4F19C68]);
          }
          uint64_t v180 = objc_msgSend_response(self, v177, v178);
          CKAddResponseHeaderValuesToUserInfoDictionary();

          goto LABEL_245;
        }
        int v66 = 1;
        objc_msgSend_objectAtIndexedSubscript_(v40, v64, 1);
        id v67 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v67, v68, @"unknown") & 1) == 0)
        {
          if (objc_msgSend_isEqualToString_(v67, v69, @"overloaded"))
          {
            int v66 = 2;
          }
          else if (objc_msgSend_isEqualToString_(v67, v70, @"notFound"))
          {
            int v66 = 3;
          }
          else if (objc_msgSend_isEqualToString_(v67, v72, @"containerUnavailable"))
          {
            int v66 = 4;
          }
          else if (objc_msgSend_isEqualToString_(v67, v74, @"mescalSignatureParseError"))
          {
            int v66 = 6;
          }
          else if (objc_msgSend_isEqualToString_(v67, v76, @"zoneBusy"))
          {
            int v66 = 7;
          }
          else if (objc_msgSend_isEqualToString_(v67, v78, @"zoneUnavailable"))
          {
            int v66 = 8;
          }
          else if (objc_msgSend_isEqualToString_(v67, v80, @"transactionTimeout"))
          {
            int v66 = 9;
          }
          else
          {
            int v66 = 200001;
            if ((objc_msgSend_isEqualToString_(v67, v82, @"partitionLookupFailed") & 1) == 0)
            {
              if (objc_msgSend_isEqualToString_(v67, v84, @"timeoutOnInternalBackends"))
              {
                int v66 = 200002;
              }
              else if (objc_msgSend_isEqualToString_(v67, v85, @"solrError"))
              {
                int v66 = 200003;
              }
              else if (objc_msgSend_isEqualToString_(v67, v88, @"userAssignmentLocked"))
              {
                int v66 = 200004;
              }
              else if (objc_msgSend_isEqualToString_(v67, v90, @"quotaServiceUnavailable"))
              {
                int v66 = 200005;
              }
              else
              {
                int v66 = 1;
              }
            }
          }
        }

        uint64_t v92 = sub_1C4E94904(v66);
      }
      uint64_t v60 = v92;
      goto LABEL_242;
    }
  }
  uint64_t v60 = 1000;
LABEL_245:

  id v6 = v38;
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v181, *MEMORY[0x1E4F19DD8], v60, v9);
  v182 = LABEL_246:;

  return v182;
}

- (void)_handlePlistResult:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = (void *)*MEMORY[0x1E4F1A548];
  if (isKindOfClass)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v6);
    }
    uint64_t v7 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = v7;
      id v17 = objc_msgSend_requestUUID(self, v15, v16);
      int v18 = 138543362;
      uint64_t v19 = v17;
      _os_log_debug_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Successfully parsed plist object\"", (uint8_t *)&v18, 0xCu);
    }
    objc_msgSend_requestDidParsePlistObject_(self, v8, (uint64_t)v4);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v6);
    }
    uint64_t v9 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      uint64_t v13 = objc_msgSend_requestUUID(self, v11, v12);
      int v18 = 138543618;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Warn: Failed to handle plist response: %@\"", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (id)defaultParserForContentType:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend_length(v4, v5, v6))
  {
    id v17 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend_rangeOfString_options_(v4, v7, *MEMORY[0x1E4F1A5B0], 1) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_rangeOfString_options_(v4, v8, @"application/x-protobuf", 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend_rangeOfString_options_(v4, v9, @"application/json", 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend_rangeOfString_options_(v4, v10, @"text/xml", 1) == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend_rangeOfString_options_(v4, v11, @"application/x-apple-plist", 1) == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend_rangeOfString_options_(v4, v12, @"application/xml", 1) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend_rangeOfString_options_(v4, v13, @"text/plain", 1) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend_rangeOfString_options_(v4, v14, @"application/x-x509-ca-cert", 1) == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v17 = 0;
            goto LABEL_19;
          }
          v86 = [CKDPlaintextResponseBodyParser alloc];
          uint64_t v89 = objc_msgSend_qualityOfService(self, v87, v88);
          id v17 = objc_msgSend_initWithQoS_(v86, v90, v89);
          v96[0] = MEMORY[0x1E4F143A8];
          v96[1] = 3221225472;
          v96[2] = sub_1C4DB537C;
          v96[3] = &unk_1E64F2608;
          v96[4] = self;
          objc_msgSend_setObjectParsedBlock_(v17, v91, (uint64_t)v96);
          uint64_t v35 = objc_msgSend_shared(CKDTrafficLogger, v92, v93);
          uint64_t v38 = objc_msgSend_requestUUID(self, v94, v95);
          uint64_t v85 = &unk_1F2042F50;
        }
        else
        {
          __int16 v74 = [CKDPlaintextResponseBodyParser alloc];
          uint64_t v77 = objc_msgSend_qualityOfService(self, v75, v76);
          id v17 = objc_msgSend_initWithQoS_(v74, v78, v77);
          v97[0] = MEMORY[0x1E4F143A8];
          v97[1] = 3221225472;
          v97[2] = sub_1C4DB52AC;
          v97[3] = &unk_1E64F2608;
          v97[4] = self;
          objc_msgSend_setObjectParsedBlock_(v17, v79, (uint64_t)v97);
          uint64_t v35 = objc_msgSend_shared(CKDTrafficLogger, v80, v81);
          uint64_t v38 = objc_msgSend_requestUUID(self, v82, v83);
          uint64_t v85 = &unk_1F2042F30;
        }
        objc_msgSend_logResponseConfigurationWithRequestUUID_format_messageClass_completionHandler_(v35, v84, (uint64_t)v38, 3, 0, v85);
      }
      else
      {
        int v55 = [CKDPlistResponseBodyParser alloc];
        uint64_t v58 = objc_msgSend_qualityOfService(self, v56, v57);
        id v17 = objc_msgSend_initWithQoS_(v55, v59, v58);
        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = sub_1C4DB51DC;
        v98[3] = &unk_1E64F25E0;
        v98[4] = self;
        objc_msgSend_setObjectParsedBlock_(v17, v60, (uint64_t)v98);
        uint64_t v35 = objc_msgSend_shared(CKDTrafficLogger, v61, v62);
        uint64_t v38 = objc_msgSend_requestUUID(self, v63, v64);
        objc_msgSend_logResponseConfigurationWithRequestUUID_format_messageClass_completionHandler_(v35, v65, (uint64_t)v38, 2, 0, &unk_1F2042F10);
      }
    }
    else
    {
      uint64_t v44 = [CKDJSONResponseBodyParser alloc];
      uint64_t v47 = objc_msgSend_qualityOfService(self, v45, v46);
      id v17 = objc_msgSend_initWithQoS_(v44, v48, v47);
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = sub_1C4DB510C;
      v99[3] = &unk_1E64F25E0;
      v99[4] = self;
      objc_msgSend_setObjectParsedBlock_(v17, v49, (uint64_t)v99);
      uint64_t v35 = objc_msgSend_shared(CKDTrafficLogger, v50, v51);
      uint64_t v38 = objc_msgSend_requestUUID(self, v52, v53);
      objc_msgSend_logResponseConfigurationWithRequestUUID_format_messageClass_completionHandler_(v35, v54, (uint64_t)v38, 1, 0, &unk_1F2042EF0);
    }
  }
  else
  {
    int v18 = [CKDProtobufResponseBodyParser alloc];
    uint64_t v21 = objc_msgSend_qualityOfService(self, v19, v20);
    uint64_t v24 = objc_msgSend_expectedResponseClass(self, v22, v23);
    uint64_t v27 = objc_msgSend_parsingStandaloneMessage(self, v25, v26);
    id v17 = objc_msgSend_initWithQoS_messageClass_parsingStandaloneMessage_(v18, v28, v21, v24, v27);
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = sub_1C4DB4FA4;
    v100[3] = &unk_1E64F25E0;
    v100[4] = self;
    objc_msgSend_setObjectParsedBlock_(v17, v29, (uint64_t)v100);
    if (objc_msgSend_parsingStandaloneMessage(self, v30, v31)) {
      uint64_t v34 = 4;
    }
    else {
      uint64_t v34 = 0;
    }
    uint64_t v35 = objc_msgSend_shared(CKDTrafficLogger, v32, v33);
    uint64_t v38 = objc_msgSend_requestUUID(self, v36, v37);
    id v41 = (objc_class *)objc_msgSend_expectedResponseClass(self, v39, v40);
    uint64_t v42 = NSStringFromClass(v41);
    objc_msgSend_logResponseConfigurationWithRequestUUID_format_messageClass_completionHandler_(v35, v43, (uint64_t)v38, v34, v42, &unk_1F2042ED0);
  }
LABEL_19:
  if (*MEMORY[0x1E4F1A4E0])
  {
    int v66 = objc_msgSend_unitTestOverrides(self, v15, v16);
    uint64_t v68 = objc_msgSend_objectForKeyedSubscript_(v66, v67, @"TestRepeatedParseResults");
    uint64_t v71 = objc_msgSend_BOOLValue(v68, v69, v70);
    objc_msgSend_setTestRepeatedParseResults_(v17, v72, v71);
  }
LABEL_21:

  return v17;
}

- (NSDictionary)additionalHeaderValues
{
  return 0;
}

- (id)traceHeaderValues
{
  uint64_t v2 = objc_opt_new();
  id v5 = objc_msgSend_sharedMonitor(CKDSystemAvailabilityMonitor, v3, v4);
  char v8 = objc_msgSend_availabilityState(v5, v6, v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v2, v9, @"true", 0x1F204D3F0);
    uint64_t v10 = CKDeviceClass();
    int isEqualToString = objc_msgSend_isEqualToString_(v10, v11, @"AudioAccessory");

    if (isEqualToString) {
      objc_msgSend_setObject_forKeyedSubscript_(v2, v13, @"true", 8355370000);
    }
  }
  if ((CKIsBundleIDForeground(@"com.apple.HDSViewService") & 1) != 0
    || (objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v14, v15),
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        int isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v16, v17, v18),
        v16,
        isAppleInternalInstall)
    && (int)CKPIDForProcessNamed() >= 1)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v2, v14, @"true", 8355370000);
  }
  return v2;
}

- (BOOL)expectsSingleObject
{
  return 0;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, @"CKDURLRequest.m", 1239, @"To be overridden by subclass");

  char v8 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v9 = *MEMORY[0x1E4F19C40];
  return (id)objc_msgSend_errorWithDomain_code_format_(v8, v7, v9, 12, @"To be overridden by subclass");
}

- (void)requestDidParseProtobufObject:(id)a3 completionHandler:(id)a4
{
  char v8 = (void (**)(id, void *))a4;
  uint64_t v7 = objc_msgSend_requestDidParseProtobufObject_(self, v6, (uint64_t)a3);
  if (v8) {
    v8[2](v8, v7);
  }
}

- (void)requestDidParseJSONObject:(id)a3
{
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], a2, *MEMORY[0x1E4F19DD8], 1005, @"Received a json payload that we weren't expecting: %@", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishWithError_(self, v4, (uint64_t)v5);
}

- (void)requestDidParsePlistObject:(id)a3
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, @"CKDURLRequest.m", 1256, @"To be overridden by subclass");
}

- (void)requestDidParsePlaintextObject:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v5 = *MEMORY[0x1E4F19DD8];
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = [v6 alloc];
  id v13 = (id)objc_msgSend_initWithData_encoding_(v8, v9, (uint64_t)v7, 4);

  uint64_t v11 = objc_msgSend_errorWithDomain_code_format_(v4, v10, v5, 1005, @"Received a plaintext response that we weren't expecting: %@", v13);
  objc_msgSend__finishOnLifecycleQueueWithError_(self, v12, (uint64_t)v11);
}

- (void)requestDidParse509CertObject:(id)a3
{
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], a2, *MEMORY[0x1E4F19DD8], 1005, @"Received a 509 cert response that we weren't expecting: %@", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__finishOnLifecycleQueueWithError_(self, v4, (uint64_t)v5);
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v41 = a3;
  id v6 = objc_msgSend_result(v41, v4, v5);
  uint64_t v9 = objc_msgSend_error(v6, v7, v8);
  if (objc_msgSend_hasExtensionError(v9, v10, v11))
  {
    uint64_t v14 = objc_msgSend_result(v41, v12, v13);
    id v17 = objc_msgSend_error(v14, v15, v16);
    uint64_t v20 = objc_msgSend_extensionError(v17, v18, v19);
    int hasTypeCode = objc_msgSend_hasTypeCode(v20, v21, v22);

    uint64_t v26 = v41;
    if (hasTypeCode)
    {
      uint64_t v27 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v28 = *MEMORY[0x1E4F19DD8];
      id v29 = objc_msgSend_result(v41, v24, v25);
      uint64_t v30 = sub_1C4E940D0(self, v29);
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_format_(v27, v31, v28, 6000, v30, @"Plugin-Specific Error");
      goto LABEL_6;
    }
  }
  else
  {

    uint64_t v26 = v41;
  }
  uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v34 = *MEMORY[0x1E4F19DD8];
  id v29 = objc_msgSend_result(v26, v24, v25);
  uint64_t v35 = sub_1C4E94D98(v29);
  uint64_t v30 = objc_msgSend_result(v41, v36, v37);
  uint64_t v38 = sub_1C4E940D0(self, v30);
  uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(v33, v39, v34, v35, v38);

LABEL_6:
  objc_msgSend__finishOnLifecycleQueueWithError_(self, v40, (uint64_t)v32);
}

- (BOOL)validate:(id *)a3
{
  return 1;
}

- (int64_t)serverType
{
  v3 = self;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (self->_haveCachedServerType) {
    return self->_cachedServerType;
  }
  uint64_t v5 = objc_msgSend_requestOperationClasses(self, a2, v2);
  if (objc_msgSend_count(v5, v6, v7))
  {
    Object = objc_msgSend_firstObject(v5, v8, v9);
    uint64_t v13 = objc_msgSend_options(Object, v11, v12);
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"serverType");

    if ((unint64_t)objc_msgSend_count(v5, v16, v17) >= 2)
    {
      uint64_t v46 = v3;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v45 = v5;
      id v20 = v5;
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v50, v62, 16);
      if (v22)
      {
        uint64_t v25 = v22;
        uint64_t v26 = *(void *)v51;
        uint64_t v27 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v51 != v26) {
              objc_enumerationMutation(v20);
            }
            id v29 = *(void **)(*((void *)&v50 + 1) + 8 * v28);
            uint64_t v30 = objc_msgSend_options(v29, v23, v24);
            uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v30, v31, @"serverType");

            if ((objc_msgSend_isEqualToString_(v32, v33, (uint64_t)v15) & 1) == 0)
            {
              if (*v27 != -1) {
                dispatch_once(v27, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              uint64_t v34 = (void *)*MEMORY[0x1E4F1A530];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
              {
                log = v34;
                uint64_t v47 = objc_msgSend_requestUUID(v46, v35, v36);
                uint64_t v48 = objc_msgSend_requestOperationClasses(v46, v37, v38);
                id v41 = objc_msgSend_firstObject(v48, v39, v40);
                *(_DWORD *)buf = 138544130;
                int v55 = v47;
                __int16 v56 = 2112;
                uint64_t v57 = v46;
                __int16 v58 = 2114;
                int v59 = v41;
                __int16 v60 = 2114;
                __int16 v61 = v29;
                id v42 = v41;
                _os_log_error_impl(&dword_1C4CFF000, log, OS_LOG_TYPE_ERROR, "req: %{public}@, \"%@ attempted to send request %{public}@ along with %{public}@, but they hit different servers\"", buf, 0x2Au);

                uint64_t v27 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
              }
            }

            ++v28;
          }
          while (v25 != v28);
          uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v50, v62, 16);
        }
        while (v25);
      }

      v3 = v46;
      uint64_t v5 = v45;
    }
    int64_t v4 = 5;
    if (objc_msgSend_length(v15, v18, v19))
    {
      unsigned int v43 = sub_1C4E95134(v15);
      if (v43 >= 4) {
        int64_t v4 = 5;
      }
      else {
        int64_t v4 = v43;
      }
    }
  }
  else
  {
    int64_t v4 = 5;
  }
  v3->_cachedServerType = v4;
  v3->_haveCachedServerType = 1;

  return v4;
}

- (int64_t)partitionType
{
  v3 = self;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (!self->_haveCachedPartitionType)
  {
    uint64_t v5 = objc_msgSend_requestOperationClasses(self, a2, v2);
    if (!objc_msgSend_count(v5, v6, v7))
    {
      int64_t v4 = 3;
LABEL_30:
      v3->_cachedPartitionType = v4;
      v3->_haveCachedPartitionType = 1;

      return v4;
    }
    Object = objc_msgSend_firstObject(v5, v8, v9);
    uint64_t v13 = objc_msgSend_options(Object, v11, v12);
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"partitionType");

    if ((unint64_t)objc_msgSend_count(v5, v16, v17) >= 2)
    {
      uint64_t v49 = v3;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v48 = v5;
      id v20 = v5;
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v53, v65, 16);
      if (v22)
      {
        uint64_t v25 = v22;
        uint64_t v26 = *(void *)v54;
        uint64_t v27 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v54 != v26) {
              objc_enumerationMutation(v20);
            }
            id v29 = *(void **)(*((void *)&v53 + 1) + 8 * v28);
            uint64_t v30 = objc_msgSend_options(v29, v23, v24);
            uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v30, v31, @"partitionType");

            if ((objc_msgSend_isEqualToString_(v32, v33, (uint64_t)v15) & 1) == 0)
            {
              if (*v27 != -1) {
                dispatch_once(v27, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              uint64_t v34 = (void *)*MEMORY[0x1E4F1A530];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
              {
                log = v34;
                long long v50 = objc_msgSend_requestUUID(v49, v35, v36);
                long long v51 = objc_msgSend_requestOperationClasses(v49, v37, v38);
                id v41 = objc_msgSend_firstObject(v51, v39, v40);
                *(_DWORD *)buf = 138544130;
                __int16 v58 = v50;
                __int16 v59 = 2112;
                __int16 v60 = v49;
                __int16 v61 = 2114;
                uint64_t v62 = v41;
                __int16 v63 = 2114;
                uint64_t v64 = v29;
                id v42 = v41;
                _os_log_error_impl(&dword_1C4CFF000, log, OS_LOG_TYPE_ERROR, "req: %{public}@, \"%@ attempted to send request %{public}@ along with %{public}@, but they hit different partitions\"", buf, 0x2Au);

                uint64_t v27 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
              }
            }

            ++v28;
          }
          while (v25 != v28);
          uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v53, v65, 16);
        }
        while (v25);
      }

      v3 = v49;
      uint64_t v5 = v48;
    }
    if (!objc_msgSend_length(v15, v18, v19)) {
      goto LABEL_24;
    }
    int v43 = sub_1C4E95300(v15);
    uint64_t v46 = objc_msgSend_databaseScope(v3, v44, v45);
    switch(v43)
    {
      case 0:
        int64_t v4 = 1;
        break;
      case 2:
        if (v46 == 1) {
          int64_t v4 = 2;
        }
        else {
          int64_t v4 = 1;
        }
        break;
      case 1:
        int64_t v4 = 2;
        break;
      default:
LABEL_24:
        int64_t v4 = 3;
        break;
    }

    goto LABEL_30;
  }
  return self->_cachedPartitionType;
}

- (NSURL)url
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_serverType(self, a2, v2) == 5)
  {
    uint64_t v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CKDURLRequest.m", 1352, @"If you set a server type of CKServerTypeOther, you must provide your own url");

    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = objc_msgSend_container(self, v5, v6);
    uint64_t v13 = objc_msgSend_serverType(self, v11, v12);
    uint64_t v16 = objc_msgSend_partitionType(self, v14, v15);
    uint64_t v18 = objc_msgSend_baseURLForServerType_partitionType_(v10, v17, v13, v16);

    if (v18)
    {
      uint64_t v21 = objc_msgSend_path(self, v19, v20);
      uint64_t v9 = objc_msgSend_URLByAppendingPathComponent_(v18, v22, (uint64_t)v21);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v23 = (void *)*MEMORY[0x1E4F1A530];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = v23;
        uint64_t v28 = objc_msgSend_requestUUID(self, v26, v27);
        uint64_t v31 = objc_msgSend_serverType(self, v29, v30);
        uint64_t v34 = objc_msgSend_partitionType(self, v32, v33);
        uint64_t v37 = objc_msgSend_container(self, v35, v36);
        int v38 = 138544130;
        uint64_t v39 = v28;
        __int16 v40 = 2048;
        uint64_t v41 = v31;
        __int16 v42 = 2048;
        uint64_t v43 = v34;
        __int16 v44 = 2112;
        uint64_t v45 = v37;
        _os_log_error_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't determine base URL for server type %ld partition type %ld off container %@\"", (uint8_t *)&v38, 0x2Au);
      }
      uint64_t v9 = 0;
    }
  }
  return (NSURL *)v9;
}

- (Class)expectedResponseClass
{
  return (Class)objc_opt_class();
}

- (int)operationType
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v4 = objc_msgSend_operation(self, a2, v2);
  uint64_t v7 = v4;
  if (v4)
  {
    int v8 = objc_msgSend_operationType(v4, v5, v6);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = v9;
      uint64_t v12 = NSStringFromSelector(a2);
      uint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      int v15 = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      uint64_t v18 = v14;
      _os_log_fault_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_FAULT, "%{public}@ called on %{public}@ but no operation is set", (uint8_t *)&v15, 0x16u);
    }
    int v8 = 0;
  }

  return v8;
}

- (Class)requestMessageClass
{
  return (Class)objc_opt_class();
}

- (NSArray)requestOperationClasses
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
  uint64_t v6 = NSStringFromSelector(a2);
  uint64_t v7 = (objc_class *)objc_opt_class();
  int v8 = NSStringFromClass(v7);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v9, (uint64_t)a2, self, @"CKDURLRequest.m", 1386, @"%@ should be overwritten by the subclass (%@)", v6, v8);

  return 0;
}

- (NSString)path
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_requestOperationClasses(self, a2, v2);
  if (objc_msgSend_count(v3, v4, v5))
  {
    Object = objc_msgSend_firstObject(v3, v6, v7);
    uint64_t v11 = objc_msgSend_options(Object, v9, v10);
    objc_msgSend_objectForKeyedSubscript_(v11, v12, @"endpoint");
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend_count(v3, v14, v15) >= 2)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v16 = v3;
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v29, v33, 16);
      if (v18)
      {
        uint64_t v21 = v18;
        uint64_t v22 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v30 != v22) {
              objc_enumerationMutation(v16);
            }
            uint64_t v24 = objc_msgSend_options(*(void **)(*((void *)&v29 + 1) + 8 * i), v19, v20, (void)v29);
            uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v24, v25, @"endpoint");

            if ((objc_msgSend_isEqualToString_(v26, v27, (uint64_t)v13) & 1) == 0)
            {

              uint64_t v13 = @"/api/client/batch";
              goto LABEL_14;
            }
          }
          uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v29, v33, 16);
          if (v21) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return (NSString *)v13;
}

- (BOOL)shouldCompressBody
{
  v3 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  char v6 = objc_msgSend_compressRequests(v3, v4, v5);

  return v6;
}

- (NSString)acceptContentType
{
  return (NSString *)@"application/x-protobuf";
}

- (NSString)protobufOperationName
{
  return (NSString *)@"RequestOperation";
}

- (BOOL)parsingStandaloneMessage
{
  return 0;
}

- (NSString)requestContentType
{
  int64_t v4 = objc_msgSend_url(self, a2, v2);
  uint64_t v9 = objc_msgSend_port(v4, v5, v6);
  if (v9)
  {
    uint64_t v10 = NSString;
    uint64_t v11 = objc_msgSend_url(self, v7, v8);
    uint64_t v14 = objc_msgSend_port(v11, v12, v13);
    objc_msgSend_stringWithFormat_(v10, v15, @":%@", v14);
    id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = &stru_1F2044F30;
  }

  __int16 v17 = NSString;
  uint64_t v20 = objc_msgSend_url(self, v18, v19);
  uint64_t v23 = objc_msgSend_scheme(v20, v21, v22);
  uint64_t v26 = objc_msgSend_url(self, v24, v25);
  long long v29 = objc_msgSend_host(v26, v27, v28);
  long long v32 = objc_msgSend_protobufOperationName(self, v30, v31);
  objc_msgSend_stringWithFormat_(v17, v33, @"%@; desc=\"%@://%@%@/static/protobuf/CloudDB/CloudDBClient.desc\"; messageType=%@; delimited=true",
    @"application/x-protobuf",
    v23,
    v29,
    v16,
  uint64_t v34 = v32);

  return (NSString *)v34;
}

- (id)operationRequestWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int64_t v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  objc_msgSend_setRequest_(v4, v6, (uint64_t)v5);

  uint64_t v7 = CKCreateGUID();
  uint64_t v10 = objc_msgSend_request(v4, v8, v9);
  objc_msgSend_setOperationUUID_(v10, v11, (uint64_t)v7);

  uint64_t v14 = objc_msgSend_request(v4, v12, v13);
  objc_msgSend_setType_(v14, v15, v3);

  return v4;
}

- (BOOL)requestGETPreAuth
{
  return 0;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1A360]);
  objc_msgSend_fillOutEquivalencyPropertiesBuilder_(self, v4, (uint64_t)v3);
  uint64_t v7 = objc_msgSend_properties(v3, v5, v6);

  return (CKRoughlyEquivalentProperties *)v7;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v7, (uint64_t)v6, @"super.className");

  uint64_t v8 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v11 = objc_msgSend_databaseScope(self, v9, v10);
  uint64_t v13 = objc_msgSend_numberWithInteger_(v8, v12, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"super.databaseScope");

  __int16 v17 = objc_msgSend_container(self, v15, v16);
  uint64_t v20 = objc_msgSend_containerScopedUserID(v17, v18, v19);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v21, (uint64_t)v20, @"super.csuid");

  objc_msgSend_container(self, v22, v23);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = objc_msgSend_containerID(v28, v24, v25);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v27, (uint64_t)v26, @"super.containerID");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v8 = a3;
  uint64_t v6 = objc_msgSend_databaseScope(self, v4, v5);
  objc_msgSend_setDatabaseScope_(v8, v7, v6);
}

- (CKDOperation)operation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  if (!WeakRetained)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v4 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_FAULT))
    {
      uint64_t v6 = v4;
      uint64_t v9 = objc_msgSend_requestUUID(self, v7, v8);
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_fault_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_FAULT, "req: %{public}@, \"CKDURLRequest with no owning operation\"", (uint8_t *)&v10, 0xCu);
    }
  }
  return (CKDOperation *)WeakRetained;
}

- (int64_t)qualityOfService
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  int64_t v6 = objc_msgSend_qualityOfService(v3, v4, v5);

  return v6;
}

- (BOOL)allowsCellularAccess
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_allowsCellularAccess(v3, v4, v5);

  return v6;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_allowsExpensiveNetworkAccess(v3, v4, v5);

  return v6;
}

- (NSString)applicationBundleIdentifierForContainerAccess
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_applicationBundleIdentifierForContainerAccess(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)applicationBundleIdentifierForNetworkAttribution
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_applicationBundleIdentifierForNetworkAttribution(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_sourceApplicationSecondaryIdentifier(v3, v4, v5);

  return (NSString *)v6;
}

- (id)privacyProxyFailClosedOverride
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_privacyProxyFailClosedOverride(v3, v4, v5);

  return v6;
}

- (NSString)authPromptReason
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_authPromptReason(v3, v4, v5);

  return (NSString *)v6;
}

- (BOOL)usesBackgroundSession
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_usesBackgroundSession(v3, v4, v5);

  return v6;
}

- (BOOL)expectDelayBeforeRequestBegins
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_expectDelayBeforeRequestBegins(v3, v4, v5);

  return v6;
}

- (BOOL)resolvedAutomaticallyRetryNetworkFailures
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(v3, v4, v5);

  return v6;
}

- (unint64_t)resolvedDiscretionaryNetworkBehavior
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  unint64_t v6 = objc_msgSend_resolvedDiscretionaryNetworkBehavior(v3, v4, v5);

  return v6;
}

- (unint64_t)duetPreClearedMode
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  unint64_t v6 = objc_msgSend_duetPreClearedMode(v3, v4, v5);

  return v6;
}

- (BOOL)preferAnonymousRequests
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_preferAnonymousRequests(v3, v4, v5);

  return v6;
}

- (NSString)operationGroupID
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_operationGroupID(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)operationGroupName
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_operationGroupName(v3, v4, v5);

  return (NSString *)v6;
}

- (NSNumber)operationGroupQuantity
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_operationGroupQuantityNumber(v3, v4, v5);

  return (NSNumber *)v6;
}

- (NSString)operationID
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_operationID(v3, v4, v5);

  return (NSString *)v6;
}

- (unint64_t)networkServiceType
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  unint64_t v6 = objc_msgSend_networkServiceType(v3, v4, v5);

  return v6;
}

- (BOOL)allowsPowerNapScheduling
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  char v6 = objc_msgSend_allowsPowerNapScheduling(v3, v4, v5);

  return v6;
}

- (void)validateAnonymousUserIDPropagation
{
  char v5 = objc_msgSend_handlesAnonymousCKUserIDPropagation(self, a2, v2);
  if (objc_msgSend_requiresCKAnonymousUserIDs(self, v6, v7) && (v5 & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    int v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v12, (uint64_t)a2, self, @"CKDURLRequest.m", 1502, @"%@ must propagate anonymous userIDs, then override this and return YES", v11);
  }
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 0;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  id v4 = objc_msgSend_operation(self, a2, v2);
  uint64_t v7 = objc_msgSend_container(v4, v5, v6);
  int v10 = objc_msgSend_options(v7, v8, v9);
  if (objc_msgSend_useAnonymousToServerShareParticipants(v10, v11, v12)) {
    BOOL v15 = objc_msgSend_databaseScope(self, v13, v14) == 3;
  }
  else {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)requiresCKAnonymousSignature
{
  return 0;
}

- (NSString)operationIDForProtobuf
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  uint64_t v6 = objc_msgSend_topmostParentOperation(v3, v4, v5);
  uint64_t v9 = objc_msgSend_operationID(v6, v7, v8);

  return (NSString *)v9;
}

- (int64_t)databaseScope
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  if (objc_opt_respondsToSelector()) {
    int64_t v6 = objc_msgSend_databaseScope(v3, v4, v5);
  }
  else {
    int64_t v6 = 2;
  }

  return v6;
}

- (double)timeoutIntervalForRequest
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  objc_msgSend_timeoutIntervalForRequest(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (double)timeoutIntervalForResource
{
  id v3 = objc_msgSend_operation(self, a2, v2);
  objc_msgSend_timeoutIntervalForResource(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (CKDProtobufStreamWriter)streamWriter
{
  streamWriter = self->_streamWriter;
  if (!streamWriter)
  {
    id v4 = [CKDProtobufStreamWriter alloc];
    uint64_t shouldCompressBody = objc_msgSend_shouldCompressBody(self, v5, v6);
    uint64_t v9 = (CKDProtobufStreamWriter *)objc_msgSend_initWithCompression_(v4, v8, shouldCompressBody);
    int v10 = self->_streamWriter;
    self->_streamWriter = v9;

    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1C4DB74C8;
    v13[3] = &unk_1E64F2630;
    objc_copyWeak(&v14, &location);
    objc_msgSend_setLogRequestObjectBlock_(self->_streamWriter, v11, (uint64_t)v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    streamWriter = self->_streamWriter;
  }
  return streamWriter;
}

- (BOOL)requiresAppPartitionURL
{
  return objc_msgSend_partitionType(self, a2, v2) == 2;
}

- (BOOL)requiresUserPartitionURL
{
  return objc_msgSend_partitionType(self, a2, v2) == 1;
}

- (BOOL)requiresConfiguration
{
  return 1;
}

- (BOOL)requiresDeviceID
{
  return 1;
}

- (BOOL)requiresTokenRegistration
{
  return objc_msgSend_partitionType(self, a2, v2) != 3;
}

- (BOOL)includeContainerServerInfo
{
  return 1;
}

- (BOOL)allowsAuthedAccount
{
  return 1;
}

- (BOOL)usesCloudKitAuthToken
{
  return 1;
}

- (BOOL)usesiCloudAuthToken
{
  return 0;
}

- (BOOL)allowsAnonymousAccount
{
  return 0;
}

- (BOOL)sendRequestAnonymously
{
  if (objc_msgSend_allowsAnonymousAccount(self, a2, v2)
    && (objc_msgSend_preferAnonymousRequests(self, v4, v5) & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend_requiresCKAnonymousUserIDs(self, v4, v5);
}

- (id)zoneIDsToLock
{
  return 0;
}

- (CKTestRequestProperties)testRequestProperties
{
  id v4 = objc_msgSend_lifecycleQueue(self, a2, v2);
  dispatch_assert_queue_V2(v4);

  if (*MEMORY[0x1E4F1A4E0] && !self->_testRequestProperties)
  {
    double v7 = objc_msgSend_equivalencyProperties(self, v5, v6);
    id v8 = objc_alloc(NSClassFromString(&cfstr_Cktestrequestp.isa));
    int v10 = (CKTestRequestProperties *)objc_msgSend_initWithEquivalencyProperties_(v8, v9, (uint64_t)v7);
    objc_msgSend_fillOutRequestProperties_(self, v11, (uint64_t)v10);
    testRequestProperties = self->_testRequestProperties;
    self->_testRequestProperties = v10;
  }
  id v13 = self->_testRequestProperties;
  return v13;
}

- (BOOL)wantsProtocolTranslator
{
  return (unint64_t)objc_msgSend_serverType(self, a2, v2) < 4;
}

- (void)performRequest
{
  id v3 = _os_activity_create(&dword_1C4CFF000, "url-request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4DB77E0;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  os_activity_apply(v3, block);
  osActivity = self->_osActivity;
  self->_osActivity = (OS_os_activity *)v3;
}

- (void)_validateAccountAccess
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4DB7B50;
  v2[3] = &unk_1E64F05C8;
  v2[4] = self;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_setupPublicDatabaseURL
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4DB8164;
  v2[3] = &unk_1E64F1998;
  v2[4] = self;
  void v2[5] = a2;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_setupPrivateDatabaseURL
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4DB8430;
  v2[3] = &unk_1E64F1998;
  v2[4] = self;
  void v2[5] = a2;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_setupConfiguration
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4DB87B0;
  v2[3] = &unk_1E64F1998;
  v2[4] = self;
  void v2[5] = a2;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_fetchContainerScopedUserID
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4DB8A6C;
  v2[3] = &unk_1E64F1998;
  v2[4] = self;
  void v2[5] = a2;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_fetchServerCertificatesIfNeeded
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4DB91A8;
  v2[3] = &unk_1E64F05C8;
  v2[4] = self;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_fetchDeviceID
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4DB96C8;
  v2[3] = &unk_1E64F1998;
  v2[4] = self;
  void v2[5] = a2;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_registerPushTokens
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4DB9928;
  v2[3] = &unk_1E64F1998;
  v2[4] = self;
  void v2[5] = a2;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_performWillSendTestCallback
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4DBA1AC;
  v2[3] = &unk_1E64F05C8;
  v2[4] = self;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_acquireZoneGates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4DBA6B8;
  v2[3] = &unk_1E64F05C8;
  v2[4] = self;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_prepareAuthTokens
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4DBA9E8;
  v2[3] = &unk_1E64F05C8;
  v2[4] = self;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_prepareCloudKitAuthToken
{
  int v5 = objc_msgSend_usesiCloudAuthToken(self, a2, v2);
  if (v5 == objc_msgSend_usesCloudKitAuthToken(self, v6, v7))
  {
    __int16 v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CKDURLRequest.m", 1964, @"You can't set both usesiCloudAuthToken and usesCloudKitAuthToken to the same value");
  }
  int v10 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_1C4DBAD5C;
  v26[4] = sub_1C4DBAD6C;
  id v27 = 0;
  objc_initWeak(&location, self);
  if ((objc_msgSend_sendRequestAnonymously(self, v11, v12) & 1) == 0)
  {
    dispatch_group_enter(v10);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1C4DBAD74;
    v21[3] = &unk_1E64F2740;
    v21[4] = self;
    objc_copyWeak(&v24, &location);
    uint64_t v23 = v26;
    uint64_t v22 = v10;
    objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, v15, (uint64_t)v21);

    objc_destroyWeak(&v24);
  }
  uint64_t v16 = objc_msgSend_lifecycleQueue(self, v13, v14);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4DBB784;
  block[3] = &unk_1E64F2768;
  objc_copyWeak(&v20, &location);
  block[4] = v26;
  dispatch_group_notify(v10, v16, block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(v26, 8);
}

- (void)prepareRequestWithCompletion:(id)a3
{
}

- (void)_performRequest
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1C4DBBB18;
  v2[3] = &unk_1E64F05C8;
  v2[4] = self;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (C2RequestOptions)requestOptions
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  requestOptions = v2->_requestOptions;
  if (!requestOptions)
  {
    id v4 = (C2RequestOptions *)objc_alloc_init(MEMORY[0x1E4F50D78]);
    int v5 = v2->_requestOptions;
    v2->_requestOptions = v4;

    id v8 = objc_msgSend_container(v2, v6, v7);
    uint64_t v11 = objc_msgSend_containerID(v8, v9, v10);
    uint64_t v14 = objc_msgSend_c2ContainerType(v11, v12, v13);
    objc_msgSend_setContainerType_(v2->_requestOptions, v15, v14);

    uint64_t v16 = NSString;
    uint64_t v17 = objc_opt_class();
    id v20 = objc_msgSend_requestUUID(v2, v18, v19);
    uint64_t v22 = objc_msgSend_stringWithFormat_(v16, v21, @"%@ requestUUID:%@", v17, v20);
    objc_msgSend_setIdentifier_(v2->_requestOptions, v23, (uint64_t)v22);

    uint64_t v26 = objc_msgSend_qualityOfService(v2, v24, v25);
    objc_msgSend_setQualityOfService_(v2->_requestOptions, v27, v26);
    long long v30 = objc_msgSend_sharedURLSessionPool(CKDURLSessionPool, v28, v29);
    LODWORD(v22) = objc_msgSend_backgroundSessionConnectionPoolLimit(v30, v31, v32);

    if (v22)
    {
      uint64_t v35 = objc_msgSend_backgroundSessionConnectionPoolName(CKDURLSessionPool, v33, v34);
      objc_msgSend_setOutOfProcessPoolName_(v2->_requestOptions, v36, (uint64_t)v35);
    }
    uint64_t v37 = objc_msgSend_allowsCellularAccess(v2, v33, v34);
    objc_msgSend_setAllowsCellularAccess_(v2->_requestOptions, v38, v37);
    uint64_t v41 = objc_msgSend_allowsExpensiveNetworkAccess(v2, v39, v40);
    objc_msgSend_set_allowsExpensiveAccess_(v2->_requestOptions, v42, v41);
    uint64_t v45 = objc_msgSend_allowsPowerNapScheduling(v2, v43, v44);
    objc_msgSend_set_allowsPowerNapScheduling_(v2->_requestOptions, v46, v45);
    objc_msgSend_timeoutIntervalForRequest(v2, v47, v48);
    objc_msgSend_set_timeoutIntervalForRequest_(v2->_requestOptions, v49, v50);
    objc_msgSend_timeoutIntervalForResource(v2, v51, v52);
    objc_msgSend_set_timeoutIntervalForResource_(v2->_requestOptions, v53, v54);
    uint64_t v57 = objc_msgSend_applicationBundleIdentifierForNetworkAttribution(v2, v55, v56);
    objc_msgSend_set_sourceApplicationBundleIdentifier_(v2->_requestOptions, v58, (uint64_t)v57);

    __int16 v61 = objc_msgSend_sourceApplicationSecondaryIdentifier(v2, v59, v60);
    objc_msgSend_set_sourceApplicationSecondaryIdentifier_(v2->_requestOptions, v62, (uint64_t)v61);

    uint64_t v65 = objc_msgSend_privacyProxyFailClosedOverride(v2, v63, v64);
    objc_msgSend_setPrivacyProxyFailClosedOverride_(v2->_requestOptions, v66, (uint64_t)v65);

    if ((objc_msgSend_sendRequestAnonymously(v2, v67, v68) & 1) == 0) {
      objc_msgSend_set_appleIDContextSessionIdentifier_(v2->_requestOptions, v69, @"com.apple.cloudkit");
    }
    objc_msgSend_setTlsPinning_(v2->_requestOptions, v69, 1);
    objc_msgSend_setAllowRouting_(v2->_requestOptions, v70, 1);
    long long v73 = objc_msgSend_container(v2, v71, v72);
    uint64_t v76 = objc_msgSend_serverConfig(v73, v74, v75);
    uint64_t v79 = objc_msgSend_container(v2, v77, v78);
    v82 = objc_msgSend_containerID(v79, v80, v81);
    uint64_t v84 = objc_msgSend_allowExpiredDNSBehavior_(v76, v83, (uint64_t)v82);
    objc_msgSend_setAllowExpiredDNSBehavior_(v2->_requestOptions, v85, v84);

    unint64_t v89 = objc_msgSend_resolvedDiscretionaryNetworkBehavior(v2, v86, v87);
    if (v89 <= 2) {
      objc_msgSend_setDiscretionaryNetworkBehavior_(v2->_requestOptions, v88, v89);
    }
    unint64_t v91 = objc_msgSend_duetPreClearedMode(v2, v88, v89);
    if (v91 <= 2) {
      objc_msgSend_setDuetPreClearedMode_(v2->_requestOptions, v90, v91);
    }
    uint64_t v92 = objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(v2, v90, v91);
    objc_msgSend_set_allowsRetryForBackgroundDataTasks_(v2->_requestOptions, v93, v92);
    uint64_t v95 = objc_msgSend_metricOptionsForNetworkRequest_(MEMORY[0x1E4F50D50], v94, (uint64_t)v2);
    objc_msgSend_setMetricOptions_(v2->_requestOptions, v96, (uint64_t)v95);

    uint64_t v99 = objc_msgSend_container(v2, v97, v98);
    int v102 = objc_msgSend_deviceContext(v99, v100, v101);
    uint64_t v105 = objc_msgSend_testServer(v102, v103, v104);

    if (v105 && (objc_msgSend_useLiveServer(v105, v106, v107) & 1) == 0)
    {
      uint64_t v110 = objc_msgSend_networkingDelegate(v105, v108, v109);
      c2NetworkingDelegate = v2->_c2NetworkingDelegate;
      v2->_c2NetworkingDelegate = (C2NetworkingDelegate *)v110;

      objc_msgSend_setNetworkingDelegate_(v2->_requestOptions, v112, (uint64_t)v2->_c2NetworkingDelegate);
    }

    requestOptions = v2->_requestOptions;
  }
  uint64_t v113 = requestOptions;
  objc_sync_exit(v2);

  return v113;
}

- (void)setRequestOptions:(id)a3
{
  id v4 = (C2RequestOptions *)a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  requestOptions = obj->_requestOptions;
  obj->_requestOptions = v4;

  objc_sync_exit(obj);
}

- (void)_loadRequest:(id)a3
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4DBD094;
  v8[3] = &unk_1E64F19C0;
  id v9 = v5;
  SEL v10 = a2;
  v8[4] = self;
  id v6 = v5;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, v7, (uint64_t)v8);
}

- (void)cancel
{
  id v4 = objc_msgSend_lifecycleQueue(self, a2, v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4DBD858;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  if (objc_msgSend__onLifecycleQueue(self, v5, v6))
  {
    objc_msgSend__finishOnLifecycleQueueWithError_(self, v7, (uint64_t)v4);
  }
  else
  {
    id v9 = objc_msgSend_lifecycleQueue(self, v7, v8);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1C4DBDB0C;
    v10[3] = &unk_1E64F0948;
    v10[4] = self;
    id v11 = v4;
    dispatch_sync(v9, v10);
  }
}

- (id)_wrapErrorIfNecessary:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_9;
  }
  id v5 = v3;
  uint64_t v8 = objc_msgSend_domain(v5, v6, v7);
  if (!objc_msgSend_isEqualToString_(v8, v9, *MEMORY[0x1E4F28798]))
  {

    goto LABEL_9;
  }
  if (objc_msgSend_code(v5, v10, v11) == 100)
  {
  }
  else
  {
    uint64_t v16 = objc_msgSend_code(v5, v12, v13);

    if (v16 != 6) {
      goto LABEL_9;
    }
  }
  uint64_t v17 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v18 = *MEMORY[0x1E4F19DD8];
  uint64_t v31 = *MEMORY[0x1E4F19C60];
  uint64_t v19 = (void *)MEMORY[0x1E4F28ED0];
  id v20 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v14, v15);
  uint64_t v23 = objc_msgSend_defaultRetryAfter(v20, v21, v22);
  uint64_t v25 = objc_msgSend_numberWithInt_(v19, v24, v23);
  v32[0] = v25;
  id v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v26, (uint64_t)v32, &v31, 1);
  uint64_t v29 = objc_msgSend_errorWithDomain_code_userInfo_format_(v17, v28, v18, 1013, v27, @"Received a networking protocol error. Please try again");

  id v5 = (id)v29;
LABEL_9:

  return v5;
}

- (void)_finishOnLifecycleQueueWithError:(id)a3
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_lifecycleQueue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  objc_msgSend__wrapErrorIfNecessary_(self, v8, (uint64_t)v4);
  id v9 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();

  SEL v10 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v11 = (os_log_t *)MEMORY[0x1E4F1A530];
  uint64_t v12 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v12;
    objc_msgSend_requestUUID(self, v16, v17);
    uint64_t v18 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    uint64_t v148 = v18;
    __int16 v149 = 2112;
    uint64_t v150 = v9;
    _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Finishing with error %@\"", buf, 0x16u);
  }
  uint64_t v19 = objc_msgSend_serverProvidedAutoBugCaptureReason(self, v13, v14);

  if (v19) {
    objc_msgSend__triggerAutoBugCaptureWithErrorPayload_(self, v20, (uint64_t)v9);
  }
  uint64_t v22 = objc_msgSend_serverProvidedTapToRadarRequest(self, v20, v21);
  if (v22)
  {
    uint64_t v25 = (void *)v22;
    uint64_t v26 = objc_msgSend_currentProcess(CKDDaemonProcess, v23, v24);
    uint64_t v29 = objc_msgSend_processType(v26, v27, v28);

    if (!v29)
    {
      long long v30 = objc_msgSend_sharedManager(MEMORY[0x1E4F1A450], v23, v24);
      uint64_t v33 = objc_msgSend_serverProvidedTapToRadarRequest(self, v31, v32);
      objc_msgSend_triggerTapToRadarWithRequest_(v30, v34, (uint64_t)v33);
    }
  }
  if (objc_msgSend_markAsFinished(self, v23, v24))
  {
    if (objc_msgSend_isCancelled(self, v35, v36))
    {
      uint64_t v39 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v40 = *MEMORY[0x1E4F19DD8];
      uint64_t v41 = objc_msgSend_requestUUID(self, v37, v38);
      uint64_t v43 = objc_msgSend_errorWithDomain_code_format_(v39, v42, v40, 1, @"Request %@ was cancelled", v41);

      id v9 = (CKDURLRequest *)v43;
    }
    if (*v10 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v44 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
    {
      v140 = v44;
      objc_msgSend_requestUUID(self, v141, v142);
      v143 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v144, v145);
      v146 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      uint64_t v148 = v143;
      __int16 v149 = 2114;
      uint64_t v150 = v146;
      __int16 v151 = 2112;
      v152 = v9;
      _os_log_debug_impl(&dword_1C4CFF000, v140, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Will finish request %{public}@ with error %@\"", buf, 0x20u);
    }
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], v45, (uint64_t)self, sel_performRequest, 0);
    uint64_t v48 = objc_msgSend_shared(CKDTrafficLogger, v46, v47);
    long long v51 = objc_msgSend_requestUUID(self, v49, v50);
    objc_msgSend_finishRequestLogWithRequestUUID_completionHandler_(v48, v52, (uint64_t)v51, &unk_1F2042FD0);

    objc_msgSend_setError_(self, v53, (uint64_t)v9);
    uint64_t v54 = self;
    uint64_t v57 = objc_msgSend_operation(v54, v55, v56);
    uint64_t v60 = objc_msgSend_dateRequestWentOut(v54, v58, v59);

    if (v60)
    {
      __int16 v63 = objc_msgSend_metrics(v54, v61, v62);
      uint64_t v66 = objc_msgSend_metrics(v54, v64, v65);
      long long v69 = objc_msgSend_dateRequestWentOut(v54, v67, v68);
      uint64_t v72 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v70, v71);
      uint64_t v75 = objc_msgSend_dateRequestWentOut(v54, v73, v74);
      objc_msgSend_timeIntervalSinceDate_(v72, v76, (uint64_t)v75);
      started = objc_msgSend_newRangeWithOperationState_startDate_duration_(v66, v77, 1, v69);
      objc_msgSend_addRange_(v63, v79, (uint64_t)started);

      uint64_t v11 = (os_log_t *)MEMORY[0x1E4F1A530];
    }
    uint64_t v80 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v61, v62);
    uint64_t v83 = objc_msgSend_metrics(v54, v81, v82);
    v86 = objc_msgSend_startDate(v83, v84, v85);
    objc_msgSend_timeIntervalSinceDate_(v80, v87, (uint64_t)v86);
    double v89 = v88;
    uint64_t v92 = objc_msgSend_metrics(v54, v90, v91);
    objc_msgSend_setDuration_(v92, v93, v94, v89);

    v97 = objc_msgSend_metrics(v54, v95, v96);
    v100 = objc_msgSend_timingData(v54, v98, v99);
    objc_msgSend_request_didFinishWithMetrics_w3cNavigationTiming_(v57, v101, (uint64_t)v54, v97, v100);

    objc_msgSend_invokeCompletionBlock(v54, v102, v103);
    objc_msgSend_setRequestProgressBlock_(v54, v104, 0);
    objc_msgSend_setResponseProgressBlock_(v54, v105, 0);
    uint64_t v108 = objc_msgSend_dateRequestWentOut(v54, v106, v107);
    if (v108) {
      BOOL v109 = !v54->_didFinishLoading;
    }
    else {
      BOOL v109 = 0;
    }

    objc_msgSend_tearDownResourcesAndReleaseTheZoneLocks_(v54, v118, v109);
    objc_msgSend_setDateRequestWentOut_(v54, v119, 0);
    if (*v10 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v120 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      v123 = v120;
      objc_msgSend_requestUUID(v54, v124, v125);
      v126 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      uint64_t v148 = v126;
      __int16 v149 = 2112;
      uint64_t v150 = v54;
      __int16 v151 = 2112;
      v152 = v9;
      _os_log_impl(&dword_1C4CFF000, v123, OS_LOG_TYPE_INFO, "req: %{public}@, \"Did finish request %@ with error %@\"", buf, 0x20u);
    }
    uint64_t v127 = objc_msgSend_signpost(v54, v121, v122);

    if (v127)
    {
      uint64_t v130 = objc_msgSend_signpost(v54, v128, v129);
      v133 = objc_msgSend_log(v130, v131, v132);

      v136 = objc_msgSend_signpost(v54, v134, v135);
      os_signpost_id_t v139 = objc_msgSend_identifier(v136, v137, v138);

      if (v139 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v133))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v148 = v9;
        _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v133, OS_SIGNPOST_INTERVAL_END, v139, "CKDURLRequest", "Error=%{signpost.description:attribute}@ ", buf, 0xCu);
      }
    }
  }
  else
  {
    if (*v10 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v110 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v111 = v110;
      objc_msgSend_requestUUID(self, v112, v113);
      v114 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v115, v116);
      uint64_t v117 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v148 = v114;
      __int16 v149 = 2114;
      uint64_t v150 = v117;
      _os_log_impl(&dword_1C4CFF000, v111, OS_LOG_TYPE_INFO, "req: %{public}@, \"Warn: request %{public}@ was already marked as finished\"", buf, 0x16u);
    }
  }
}

- (void)invokeCompletionBlock
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_completionBlock(self, a2, v2);

  if (v4)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v5 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
    {
      SEL v10 = v5;
      uint64_t v13 = objc_msgSend_requestUUID(self, v11, v12);
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_debug_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Calling completion block\"", (uint8_t *)&v14, 0xCu);
    }
    objc_msgSend_completionBlock(self, v6, v7);
    uint64_t v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

    objc_msgSend_setCompletionBlock_(self, v9, 0);
  }
}

- (void)_triggerAutoBugCaptureWithErrorPayload:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_container(self, v5, v6);
  SEL v10 = objc_msgSend_containerID(v7, v8, v9);
  uint64_t v13 = objc_msgSend_containerIdentifier(v10, v11, v12);

  uint64_t v16 = objc_msgSend_serverProvidedAutoBugCaptureReason(self, v14, v15);
  objc_opt_class();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v17);
  if (qword_1EA3D1028 && (objc_msgSend_timeIntervalSinceNow((void *)qword_1EA3D1028, v18, v19), v20 > -10.0))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v21 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v66 = objc_msgSend_container(self, v22, v23);
      long long v69 = objc_msgSend_processName(v66, v67, v68);
      *(_DWORD *)buf = 138544130;
      uint64_t v71 = v16;
      __int16 v72 = 2114;
      long long v73 = v69;
      __int16 v74 = 2114;
      uint64_t v75 = v13;
      __int16 v76 = 2114;
      id v77 = v4;
      _os_log_error_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_ERROR, "Too many server triggered ABCs. Logging locally: %{public}@. proc: %{public}@. containerID: %{public}@. error: %{public}@.", buf, 0x2Au);
    }
    objc_sync_exit(v17);
  }
  else
  {
    uint64_t v24 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v18, v19);
    uint64_t v25 = (void *)qword_1EA3D1028;
    qword_1EA3D1028 = v24;

    objc_sync_exit(v17);
    if (objc_msgSend_length(v13, v26, v27))
    {
      uint64_t v30 = objc_msgSend_stringWithFormat_(NSString, v28, @"%@: %@", v13, v16);

      uint64_t v16 = (void *)v30;
    }
    if ((unint64_t)objc_msgSend_length(v16, v28, v29) >= 0x65)
    {
      uint64_t v33 = NSString;
      uint64_t v34 = objc_msgSend_hash(v16, v31, v32);
      uint64_t v36 = objc_msgSend_stringWithFormat_(v33, v35, @":0x%lx", v34);
      uint64_t v39 = objc_msgSend_length(v36, v37, v38);
      uint64_t v41 = objc_msgSend_substringToIndex_(v16, v40, 100 - v39);
      uint64_t v43 = objc_msgSend_stringByAppendingString_(v41, v42, (uint64_t)v36);

      uint64_t v16 = (void *)v43;
    }
    id v17 = objc_alloc_init(MEMORY[0x1E4FA8AF0]);
    uint64_t v46 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v44, v45);
    uint64_t v49 = objc_msgSend_processName(v46, v47, v48);
    long long v51 = objc_msgSend_signatureWithDomain_type_subType_detectedProcess_triggerThresholdValues_(v17, v50, @"CloudKit", @"Functional", @"ServerTriggered", v49, 0);

    objc_msgSend_setObject_forKeyedSubscript_(v51, v52, (uint64_t)v16, *MEMORY[0x1E4FA8CB8]);
    long long v55 = objc_msgSend_container(self, v53, v54);
    __int16 v58 = objc_msgSend_processName(v55, v56, v57);
    objc_msgSend_setObject_forKeyedSubscript_(v51, v59, (uint64_t)v58, *MEMORY[0x1E4FA8C98]);

    objc_msgSend_setObject_forKeyedSubscript_(v51, v60, (uint64_t)v13, @"ckContainerID");
    char v62 = objc_msgSend_snapshotWithSignature_duration_event_payload_reply_(v17, v61, (uint64_t)v51, 0, 0, &unk_1F2042FF0, 15.0);
    __int16 v63 = (void *)*MEMORY[0x1E4F1A548];
    if (v62)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v63);
      }
      uint64_t v64 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v71 = v16;
        _os_log_debug_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_DEBUG, "Diagnostic Reporter took a snapshot for signature %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v63);
      }
      uint64_t v65 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v71 = v16;
        _os_log_error_impl(&dword_1C4CFF000, v65, OS_LOG_TYPE_ERROR, "Diagnostic Reporter failed to take snapshot for signature %{public}@", buf, 0xCu);
      }
    }
  }
}

- (BOOL)isFinished
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL finished = v2->_finished;
  objc_sync_exit(v2);

  return finished;
}

- (BOOL)markAsFinished
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v3 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v3;
    SEL v10 = objc_msgSend_requestUUID(self, v8, v9);
    int v11 = 138543362;
    uint64_t v12 = v10;
    _os_log_debug_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Marking as finished\"", (uint8_t *)&v11, 0xCu);
  }
  id v4 = self;
  objc_sync_enter(v4);
  BOOL v5 = !v4->_finished;
  v4->_BOOL finished = 1;
  objc_sync_exit(v4);

  return v5;
}

- (void)_tearDownStreamWriter
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = v2->_streamWriter;
  if (v6)
  {
    streamWriter = v2->_streamWriter;
    v2->_streamWriter = 0;

    objc_sync_exit(v2);
    objc_msgSend_tearDown(v6, v4, v5);
  }
  else
  {
    objc_sync_exit(v2);
  }
}

- (void)tearDownResources
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v3 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
  {
    id v17 = v3;
    double v20 = objc_msgSend_requestUUID(self, v18, v19);
    int v21 = 138543362;
    uint64_t v22 = v20;
    _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"tearDownResources\"", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v6 = objc_msgSend_urlSessionTask(self, v4, v5);
  objc_msgSend_cancel(v6, v7, v8);

  objc_msgSend_setUrlSessionTask_(self, v9, 0);
  objc_msgSend__tearDownStreamWriter(self, v10, v11);
  responseBodyParser = self->_responseBodyParser;
  self->_responseBodyParser = 0;

  requestOperations = self->_requestOperations;
  self->_requestOperations = 0;

  objc_msgSend_setResponse_(self, v14, 0);
  objc_msgSend_setRequest_(self, v15, 0);
  objc_msgSend_setRequestOptions_(self, v16, 0);
}

- (void)tearDownResourcesAndReleaseTheZoneLocks:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v5 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = v5;
    uint64_t v18 = objc_msgSend_requestUUID(self, v16, v17);
    int v19 = 138543362;
    double v20 = v18;
    _os_log_debug_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"tearDownResourcesAndReleaseTheZoneLocks\"", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v8 = objc_msgSend_container(self, v6, v7);
  uint64_t v11 = objc_msgSend_gatekeeper(v8, v9, v10);
  objc_msgSend_relinquishLocksForWaiter_deferRelinquish_(v11, v12, (uint64_t)self, v3);

  objc_msgSend_tearDownResources(self, v13, v14);
}

- (BOOL)performOnLifecycleQueueIfNotFinished:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  objc_initWeak(&location, self);
  uint64_t v7 = objc_msgSend_lifecycleQueue(self, v5, v6);
  dispatch_assert_queue_not_V2(v7);

  uint64_t v10 = objc_msgSend_lifecycleQueue(self, v8, v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4DBF0D8;
  v13[3] = &unk_1E64F27D8;
  objc_copyWeak(&v16, &location);
  id v14 = v4;
  uint64_t v15 = &v18;
  id v11 = v4;
  dispatch_sync(v10, v13);

  LOBYTE(v10) = *((unsigned char *)v19 + 24);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);
  return (char)v10;
}

- (void)performASyncOnLifecycleQueueIfNotFinished:(id)a3 fallbackBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v10 = objc_msgSend_lifecycleQueue(self, v8, v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4DBF3A4;
  v13[3] = &unk_1E64F2800;
  objc_copyWeak(&v16, &location);
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)performASyncOnLifecycleQueueIfNotFinished:(id)a3
{
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v17 = objc_msgSend_signpost(self, v15, v16);

  if (v17)
  {
    uint64_t v20 = objc_msgSend_signpost(self, v18, v19);
    uint64_t v23 = objc_msgSend_log(v20, v21, v22);

    uint64_t v26 = objc_msgSend_signpost(self, v24, v25);
    os_signpost_id_t v29 = objc_msgSend_identifier(v26, v27, v28);

    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v23, OS_SIGNPOST_EVENT, v29, "CKDURLRequest", "Performing HTTP redirection", buf, 2u);
    }
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_1C4DBF738;
  v35[3] = &unk_1E64F2828;
  id v36 = v11;
  uint64_t v37 = self;
  id v30 = v14;
  id v40 = v30;
  id v38 = v12;
  id v31 = v13;
  id v39 = v31;
  id v32 = v12;
  id v33 = v11;
  if ((objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, v34, (uint64_t)v35) & 1) == 0) {
    (*((void (**)(id, id))v30 + 2))(v30, v31);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1C4DBFE88;
  v20[3] = &unk_1E64F1B98;
  id v21 = v10;
  uint64_t v22 = self;
  id v23 = v9;
  id v24 = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4DC0844;
  v16[3] = &unk_1E64F0FA0;
  id v17 = v21;
  uint64_t v18 = self;
  id v19 = v24;
  id v12 = v24;
  id v13 = v21;
  id v14 = v9;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_fallbackBlock_(self, v15, (uint64_t)v20, v16);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v11 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v15 = objc_msgSend_requestUUID(self, v13, v14);
    *(_DWORD *)buf = 138543618;
    id v31 = v15;
    __int16 v32 = 2048;
    uint64_t v33 = objc_msgSend_length(v10, v16, v17);
    _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"URLSession:dataTask:didReceiveData: %ld bytes\"", buf, 0x16u);
  }
  uint64_t v18 = dispatch_group_create();
  dispatch_group_enter(v18);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4DC0B84;
  v28[3] = &unk_1E64F05C8;
  os_signpost_id_t v29 = v18;
  id v19 = v18;
  objc_msgSend_URLSession_dataTask__didReceiveData_completionHandler_(self, v20, (uint64_t)v8, v9, v10, v28);
  objc_msgSend_timeoutIntervalForResource(self, v21, v22);
  double v24 = v23 * 1000000000.0;
  BOOL v25 = v23 <= 0.0;
  double v26 = 1.84467441e19;
  if (!v25) {
    double v26 = v24;
  }
  dispatch_time_t v27 = dispatch_time(0, (uint64_t)v26);
  dispatch_group_wait(v19, v27);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4DC0C70;
  v16[3] = &unk_1E64F1B98;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  id v12 = v11;
  id v13 = v9;
  id v14 = v10;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_fallbackBlock_(self, v15, (uint64_t)v16, v12);
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4DC148C;
  v17[3] = &unk_1E64F0FA0;
  v17[4] = self;
  id v9 = v7;
  id v18 = v9;
  id v10 = v8;
  id v19 = v10;
  if ((objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, v11, (uint64_t)v17) & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v12 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      uint64_t v16 = objc_msgSend_requestUUID(self, v14, v15);
      *(_DWORD *)buf = 138543362;
      id v21 = v16;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Asked for a new body stream while already cancelled.  Soldiering on without a request body\"", buf, 0xCu);
    }
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v11 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4DC188C;
  v14[3] = &unk_1E64F2878;
  int64_t v16 = a5;
  int64_t v17 = a6;
  int64_t v18 = a7;
  v14[4] = self;
  id v15 = v11;
  id v12 = v11;
  objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, v13, (uint64_t)v14);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4DC1CBC;
  v12[3] = &unk_1E64F0120;
  v12[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v9 = v7;
  id v10 = v8;
  objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, v11, (uint64_t)v12);
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4DC3060;
  v18[3] = &unk_1E64F0FA0;
  v18[4] = self;
  id v10 = v8;
  id v19 = v10;
  id v11 = v9;
  id v20 = v11;
  if ((objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, v12, (uint64_t)v18) & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v13 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v13;
      int64_t v17 = objc_msgSend_requestUUID(self, v15, v16);
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v17;
      _os_log_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Cancelling request on established connection due to cancelled CKDURLRequest\"", buf, 0xCu);
    }
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

- (void)URLSession:(id)a3 _taskIsWaitingForConnection:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4DC3660;
  v4[3] = &unk_1E64F05C8;
  void v4[4] = self;
  objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v4, a4);
}

- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4DC3874;
  v5[3] = &unk_1E64F1DB8;
  BOOL v6 = a5;
  v5[4] = self;
  objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v5, a4);
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v6 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4DC3B54;
  v9[3] = &unk_1E64F0948;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, v8, (uint64_t)v9);
}

- (NSDictionary)responseHeaders
{
  BOOL v3 = objc_msgSend_response(self, a2, v2);
  id v6 = objc_msgSend_allHeaderFields(v3, v4, v5);

  return (NSDictionary *)v6;
}

- (int)isolationLevel
{
  return 1;
}

- (id)_CFNetworkTaskIdentifierString
{
  BOOL v3 = NSString;
  id v4 = objc_msgSend_urlSessionTask(self, a2, v2);
  id v6 = objc_msgSend_stringWithFormat_(v3, v5, @"%@", v4);

  return v6;
}

- (id)statusReportWithIndent:(unint64_t)a3
{
  id v4 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v5 = CKTabIndentAtDepth();
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v10 = objc_msgSend_requestUUID(self, v8, v9);
  id v12 = objc_msgSend_stringWithFormat_(v4, v11, @"%s<%@ %@ ", v5, v7, v10);

  id v14 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v13, 2);
  if (objc_msgSend_isFinished(self, v15, v16)) {
    objc_msgSend_addObject_(v14, v17, @"finished");
  }
  if (objc_msgSend_isCancelled(self, v17, v18)) {
    objc_msgSend_addObject_(v14, v19, @"cancelled");
  }
  if (objc_msgSend_count(v14, v19, v20))
  {
    uint64_t v23 = objc_msgSend_componentsJoinedByString_(v14, v21, @"|");
    objc_msgSend_appendFormat_(v12, v24, @"stateFlags=%@ ", v23);
  }
  if (objc_msgSend_isWaitingOnAuthRenew(self, v21, v22)) {
    objc_msgSend_appendString_(v12, v25, @"(waiting on auth)");
  }
  os_signpost_id_t v29 = objc_msgSend_urlSessionTask(self, v25, v26);
  if (v29)
  {
    id v30 = objc_msgSend__CFNetworkTaskIdentifierString(self, v27, v28);
    objc_msgSend_appendFormat_(v12, v31, @"CFNetwork task: %@ ", v30);
  }
  objc_msgSend_appendString_(v12, v27, @">\n");

  return v12;
}

- (id)createAssetAuthorizeGetRequestOptionsHeaderInfoWithKey:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  objc_msgSend_setHeaderKey_(v7, v8, (uint64_t)v6);

  objc_msgSend_setHeaderValue_(v7, v9, (uint64_t)v5);
  return v7;
}

- (CKDContainer)container
{
  return self->_container;
}

- (CKDResponseBodyParser)responseBodyParser
{
  return self->_responseBodyParser;
}

- (void)setResponseBodyParser:(id)a3
{
}

- (int64_t)responseStatusCode
{
  return self->_responseStatusCode;
}

- (id)requestProgressBlock
{
  return self->_requestProgressBlock;
}

- (void)setRequestProgressBlock:(id)a3
{
}

- (id)responseProgressBlock
{
  return self->_responseProgressBlock;
}

- (void)setResponseProgressBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (BOOL)allowAutomaticRedirects
{
  return self->_allowAutomaticRedirects;
}

- (void)setAllowAutomaticRedirects:(BOOL)a3
{
  self->_allowAutomaticRedirects = a3;
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (CKDProtocolTranslator)translator
{
  return self->_translator;
}

- (void)setTranslator:(id)a3
{
}

- (NSDictionary)unitTestOverrides
{
  return self->_unitTestOverrides;
}

- (void)setUnitTestOverrides:(id)a3
{
}

- (NSDictionary)clientProvidedAdditionalHeaderValues
{
  return self->_clientProvidedAdditionalHeaderValues;
}

- (void)setClientProvidedAdditionalHeaderValues:(id)a3
{
}

- (int)requestOriginator
{
  return self->_requestOriginator;
}

- (NSDictionary)fakeResponseOperationResultByItemID
{
  return self->_fakeResponseOperationResultByItemID;
}

- (void)setFakeResponseOperationResultByItemID:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 200, 1);
}

- (void)setError:(id)a3
{
}

- (BOOL)needsAuthRetry
{
  return self->_needsAuthRetry;
}

- (void)setNeedsAuthRetry:(BOOL)a3
{
  self->_needsAuthRetry = a3;
}

- (BOOL)isWaitingOnAuthRenew
{
  return self->_isWaitingOnAuthRenew;
}

- (void)setIsWaitingOnAuthRenew:(BOOL)a3
{
  self->_isWaitingOnAuthRenew = a3;
}

- (BOOL)isHandlingAuthRetry
{
  return self->_isHandlingAuthRetry;
}

- (void)setIsHandlingAuthRetry:(BOOL)a3
{
  self->_isHandlingAuthRetry = a3;
}

- (void)setLifecycleQueue:(id)a3
{
}

- (NSURLSessionDataTask)urlSessionTask
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 216, 1);
}

- (void)setUrlSessionTask:(id)a3
{
}

- (C2NetworkingDelegate)c2NetworkingDelegate
{
  return self->_c2NetworkingDelegate;
}

- (void)setC2NetworkingDelegate:(id)a3
{
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSHTTPURLResponse)response
{
  return (NSHTTPURLResponse *)objc_getProperty(self, a2, 240, 1);
}

- (void)setResponse:(id)a3
{
}

- (NSURLSession)urlSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 248, 1);
}

- (void)setUrlSession:(id)a3
{
}

- (NSMutableSet)responseObjectUUIDs
{
  return self->_responseObjectUUIDs;
}

- (void)setResponseObjectUUIDs:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (unint64_t)numDownloadedElements
{
  return self->_numDownloadedElements;
}

- (void)setNumDownloadedElements:(unint64_t)a3
{
  self->_numDownloadedElements = a3;
}

- (BOOL)didRetryAuth
{
  return self->_didRetryAuth;
}

- (void)setDidRetryAuth:(BOOL)a3
{
  self->_didRetryAuth = a3;
}

- (NSError)lastRetryAuthError
{
  return self->_lastRetryAuthError;
}

- (void)setLastRetryAuthError:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)haveCachedServerType
{
  return self->_haveCachedServerType;
}

- (void)setHaveCachedServerType:(BOOL)a3
{
  self->_haveCachedServerType = a3;
}

- (BOOL)haveCachedPartitionType
{
  return self->_haveCachedPartitionType;
}

- (void)setHaveCachedPartitionType:(BOOL)a3
{
  self->_haveCachedPartitionType = a3;
}

- (int64_t)cachedServerType
{
  return self->_cachedServerType;
}

- (void)setCachedServerType:(int64_t)a3
{
  self->_cachedServerType = a3;
}

- (int64_t)cachedPartitionType
{
  return self->_cachedPartitionType;
}

- (void)setCachedPartitionType:(int64_t)a3
{
  self->_cachedPartitionType = a3;
}

- (NSDate)dateRequestWentOut
{
  return (NSDate *)objc_getProperty(self, a2, 304, 1);
}

- (void)setDateRequestWentOut:(id)a3
{
}

- (CKDOperationMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (NSDictionary)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
}

- (OS_voucher)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
}

- (NSString)cloudKitAuthToken
{
  return self->_cloudKitAuthToken;
}

- (void)setCloudKitAuthToken:(id)a3
{
}

- (NSString)iCloudAuthToken
{
  return self->_iCloudAuthToken;
}

- (void)setICloudAuthToken:(id)a3
{
}

- (BOOL)didReceiveResponseBodyData
{
  return self->_didReceiveResponseBodyData;
}

- (void)setDidReceiveResponseBodyData:(BOOL)a3
{
  self->_didReceiveResponseBodyData = a3;
}

- (NSString)serverProvidedAutoBugCaptureReason
{
  return self->_serverProvidedAutoBugCaptureReason;
}

- (void)setServerProvidedAutoBugCaptureReason:(id)a3
{
}

- (CKTapToRadarRequest)serverProvidedTapToRadarRequest
{
  return self->_serverProvidedTapToRadarRequest;
}

- (void)setServerProvidedTapToRadarRequest:(id)a3
{
}

- (NSMutableDictionary)countsByRequestOperationType
{
  return self->_countsByRequestOperationType;
}

- (void)setCountsByRequestOperationType:(id)a3
{
}

- (CKSignpost)signpost
{
  return self->_signpost;
}

- (BOOL)didFetchNilAuthToken
{
  return self->_didFetchNilAuthToken;
}

- (void)setDidFetchNilAuthToken:(BOOL)a3
{
  self->_didFetchNilAuthToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpost, 0);
  objc_storeStrong((id *)&self->_countsByRequestOperationType, 0);
  objc_storeStrong((id *)&self->_serverProvidedTapToRadarRequest, 0);
  objc_storeStrong((id *)&self->_serverProvidedAutoBugCaptureReason, 0);
  objc_storeStrong((id *)&self->_iCloudAuthToken, 0);
  objc_storeStrong((id *)&self->_cloudKitAuthToken, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_dateRequestWentOut, 0);
  objc_storeStrong((id *)&self->_lastRetryAuthError, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_responseObjectUUIDs, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_c2NetworkingDelegate, 0);
  objc_storeStrong((id *)&self->_urlSessionTask, 0);
  objc_storeStrong((id *)&self->_lifecycleQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fakeResponseOperationResultByItemID, 0);
  objc_storeStrong((id *)&self->_clientProvidedAdditionalHeaderValues, 0);
  objc_storeStrong((id *)&self->_unitTestOverrides, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_testRequestProperties, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_requestOperations, 0);
  objc_storeStrong((id *)&self->_transmissionActivity, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_storeStrong((id *)&self->_streamWriter, 0);
  objc_storeStrong((id *)&self->_fakeResponseData, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_responseProgressBlock, 0);
  objc_storeStrong(&self->_requestProgressBlock, 0);
  objc_storeStrong((id *)&self->_responseBodyParser, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end