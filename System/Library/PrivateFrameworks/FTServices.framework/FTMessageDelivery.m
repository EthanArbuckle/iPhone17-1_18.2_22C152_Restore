@interface FTMessageDelivery
+ (Class)APNSMessageDeliveryClass;
+ (Class)HTTPMessageDeliveryClass;
+ (id)_errorForTDMessageDeliveryStatus:(int64_t)a3 userInfo:(id)a4;
+ (id)alloc;
+ (id)createAPSConnection;
- (BOOL)_sendMessageAsynchronously:(id)a3 error:(id *)a4;
- (BOOL)bagDisablesVMTraffic;
- (BOOL)busy;
- (BOOL)disallowRetry;
- (BOOL)hasQueuedItems;
- (BOOL)isTrafficDisabledOnVMForMessage:(id)a3;
- (BOOL)logToRegistration;
- (BOOL)retryInAirplaneMode;
- (BOOL)sendMessage:(id)a3;
- (FTMessageDelivery)init;
- (FTMessageDelivery)initWithAPSConnection:(id)a3;
- (FTMessageDeliveryAPSConnection)connection;
- (IDSBAASigner)baaSigner;
- (IDSBaseMessage)currentMessage;
- (NSArray)queuedMessages;
- (NSHashTable)observerMap;
- (NSNumber)protocolVersion;
- (NSString)userAgent;
- (id)_queue;
- (int64_t)maxLargeMessageSize;
- (int64_t)maxMessageSize;
- (unint64_t)maxConcurrentMessages;
- (void)_clearRetryTimer;
- (void)_correctServerTimestampForDriftOnMessage:(id)a3 currentDate:(id)a4;
- (void)_informDelegateAboutMessage:(id)a3 error:(id)a4 result:(id)a5 resultCode:(int64_t)a6 interface:(unint64_t)a7;
- (void)_retryTimerHit:(id)a3;
- (void)_setRetryTimer:(double)a3;
- (void)_signMessage:(id)a3 useDataSignatures:(BOOL)a4 body:(id)a5 queryString:(id)a6 completion:(id)a7;
- (void)addRequestObserver:(id)a3;
- (void)dealloc;
- (void)networkStateChanged;
- (void)setDisallowRetry:(BOOL)a3;
- (void)setLogToRegistration:(BOOL)a3;
- (void)setMaxConcurrentMessages:(unint64_t)a3;
- (void)setRetryInAirplaneMode:(BOOL)a3;
- (void)setUserAgent:(id)a3;
- (void)signDataWithPushIdentity:(id)a3 serverTimestamp:(id)a4 withCompletion:(id)a5;
@end

@implementation FTMessageDelivery

- (FTMessageDeliveryAPSConnection)connection
{
  return (FTMessageDeliveryAPSConnection *)objc_getProperty(self, a2, 64, 1);
}

+ (Class)HTTPMessageDeliveryClass
{
  return (Class)objc_opt_class();
}

+ (Class)APNSMessageDeliveryClass
{
  return (Class)objc_opt_class();
}

+ (id)alloc
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    return [FTMessageDelivery_HTTP alloc];
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___FTMessageDelivery;
    return objc_msgSendSuper2(&v5, sel_alloc);
  }
}

+ (id)createAPSConnection
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  IMGetConferenceSettings();
  id v2 = 0;
  uint64_t v3 = (objc_class *)MEMORY[0x1AD0D4F50](@"APSConnection", @"ApplePushService");
  id v4 = *(id *)MEMORY[0x1AD0D4F60]("APSConnectionOverrideNamedDelegatePort", @"ApplePushService");
  id v5 = [v3 alloc];
  v6 = im_primary_queue();
  v8 = objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(v5, v7, (uint64_t)v2, v4, v6);

  v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v16 = v8;
    __int16 v17 = 1024;
    int v18 = objc_msgSend_messageSize(v8, v10, v11);
    __int16 v19 = 2112;
    id v20 = v2;
    _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "Created APSConnection: %p  (Max size: %d  Environment: %@)", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    objc_msgSend_messageSize(v8, v12, v13);
    _IDSLogV();
  }

  return v8;
}

- (FTMessageDelivery)initWithAPSConnection:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTMessageDelivery;
  id v5 = [(FTMessageDelivery *)&v26 init];
  v6 = v5;
  if (v5)
  {
    v5->_maxConcurrentMessages = 1;
    v7 = objc_alloc_init(FTMessageQueue);
    queue = v6->_queue;
    v6->_queue = v7;

    objc_msgSend_setDelegate_(v6->_queue, v9, (uint64_t)v6);
    if (v4)
    {
      v10 = (FTMessageDeliveryAPSConnection *)v4;
    }
    else
    {
      uint64_t v11 = objc_opt_class();
      objc_msgSend_createAPSConnection(v11, v12, v13);
      v10 = (FTMessageDeliveryAPSConnection *)objc_claimAutoreleasedReturnValue();
    }
    connection = v6->_connection;
    v6->_connection = v10;

    v15 = (objc_class *)MEMORY[0x1AD0D4F50](@"IDSBAASigner", @"IDS");
    if (v15)
    {
      id v18 = [v15 alloc];
      __int16 v19 = im_primary_queue();
      uint64_t v21 = objc_msgSend_initWithQueue_(v18, v20, (uint64_t)v19);
      baaSigner = v6->_baaSigner;
      v6->_baaSigner = (IDSBAASigner *)v21;
    }
    v23 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v16, v17);
    objc_msgSend_addObserver_selector_name_object_(v23, v24, (uint64_t)v6, sel_networkStateChanged, *MEMORY[0x1E4F6C210], 0);
  }
  return v6;
}

- (FTMessageDelivery)init
{
  return (FTMessageDelivery *)objc_msgSend_initWithAPSConnection_(self, a2, 0);
}

- (void)dealloc
{
  id v4 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, 0, 0);

  objc_msgSend__clearRetryTimer(self, v6, v7);
  objc_msgSend_setDelegate_(self->_queue, v8, 0);
  objc_msgSend_removeAllMessages(self->_queue, v9, v10);
  objc_msgSend_removeAllObjects(self->_observerMap, v11, v12);
  v13.receiver = self;
  v13.super_class = (Class)FTMessageDelivery;
  [(FTMessageDelivery *)&v13 dealloc];
}

- (void)addRequestObserver:(id)a3
{
  id v4 = (const char *)a3;
  observerMap = self->_observerMap;
  v9 = (char *)v4;
  if (!observerMap)
  {
    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v4, v5);
    uint64_t v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_observerMap;
    self->_observerMap = v7;

    id v4 = v9;
    observerMap = self->_observerMap;
  }
  objc_msgSend_addObject_(observerMap, v4, (uint64_t)v4);
}

- (NSNumber)protocolVersion
{
  return 0;
}

+ (id)_errorForTDMessageDeliveryStatus:(int64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    if (a3 == 1) {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v5, @"FTMessageDeliveryNoResultCodeError", 1, v6);
    }
    else {
    a3 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v5, (uint64_t)FTErrorDomain, a3, v6);
    }
  }

  return (id)a3;
}

- (void)_informDelegateAboutMessage:(id)a3 error:(id)a4 result:(id)a5 resultCode:(int64_t)a6 interface:(unint64_t)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v39 = v14;
  if (v13)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    id v18 = objc_msgSend_domain(v13, v15, v16);
    uint64_t v21 = objc_msgSend_code(v13, v19, v20);
    v38 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v22, (uint64_t)v18, v21, 0);
  }
  else
  {
    v38 = objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v15, a6, v14);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v23 = self->_observerMap;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v40, v44, 16);
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v23);
        }
        v29 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v32 = objc_msgSend_copy(v12, v30, v31);
          objc_msgSend_completedRequest_resultCode_interface_(v29, v33, (uint64_t)v32, a6, a7);
        }
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v30, (uint64_t)&v40, v44, 16);
    }
    while (v26);
  }

  uint64_t v36 = objc_msgSend_completionBlock(v12, v34, v35);
  v37 = (void *)v36;
  if (v36) {
    (*(void (**)(uint64_t, id, void *, int64_t, void *))(v36 + 16))(v36, v12, v38, a6, v39);
  }
}

- (BOOL)_sendMessageAsynchronously:(id)a3 error:(id *)a4
{
  return 1;
}

- (NSArray)queuedMessages
{
  return (NSArray *)objc_msgSend_messages(self->_queue, a2, v2);
}

- (IDSBaseMessage)currentMessage
{
  return (IDSBaseMessage *)objc_msgSend_topMessage(self->_queue, a2, v2);
}

- (BOOL)busy
{
  return 0;
}

- (BOOL)hasQueuedItems
{
  return objc_msgSend_count(self->_queue, a2, v2) > 0;
}

- (id)_queue
{
  return self->_queue;
}

- (BOOL)sendMessage:(id)a3
{
  return 0;
}

- (void)_retryTimerHit:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_invalidate(self->_timer, v5, v6);
  timer = self->_timer;
  self->_timer = 0;

  v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, "Should retry!", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if (IMShouldLog()) {
      IMLogString();
    }
  }
  if (objc_msgSend_logToRegistration(self, v9, v10))
  {
    id v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v13, OS_LOG_TYPE_DEFAULT, "...Should retry", buf, 2u);
    }
  }
  id v14 = objc_msgSend_topMessage(self->_queue, v11, v12);
  uint64_t v17 = v14;
  if (v14)
  {
    id v18 = objc_msgSend_retryCount(v14, v15, v16);
    uint64_t v21 = objc_msgSend_integerValue(v18, v19, v20);

    v23 = objc_msgSend_numberWithInteger_(NSNumber, v22, v21 + 1);
    objc_msgSend_setRetryCount_(v17, v24, (uint64_t)v23);

    id v36 = 0;
    LOBYTE(v21) = objc_msgSend__sendMessageAsynchronously_error_(self, v25, (uint64_t)v17, &v36);
    uint64_t v26 = v36;
    if ((v21 & 1) == 0)
    {
      uint64_t v27 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v26;
        _os_log_impl(&dword_1A7BC0000, v27, OS_LOG_TYPE_ERROR, "Failed retrying message: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        uint64_t v35 = v26;
        _IDSLogTransport();
      }
      if (objc_msgSend_logToRegistration(self, v28, v29, v35))
      {
        v32 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v30, v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7BC0000, v32, OS_LOG_TYPE_DEFAULT, "...Failed retrying", buf, 2u);
        }
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  if (objc_msgSend_logToRegistration(self, v15, v16))
  {
    uint64_t v26 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v33, v34);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v26, OS_LOG_TYPE_DEFAULT, "No message to retry -- returning", buf, 2u);
    }
    goto LABEL_25;
  }
LABEL_26:
}

- (void)_clearRetryTimer
{
  objc_msgSend_invalidate(self->_timer, a2, v2);
  timer = self->_timer;
  self->_timer = 0;
}

- (void)_setRetryTimer:(double)a3
{
  objc_msgSend__clearRetryTimer(self, a2, v3);
  id v6 = objc_alloc(MEMORY[0x1E4F6C3F0]);
  self->_timer = (IMTimer *)objc_msgSend_initWithTimeInterval_name_shouldWake_target_selector_userInfo_(v6, v7, @"com.apple.imagent.http-delivery", 1, self, sel__retryTimerHit_, 0, a3);

  MEMORY[0x1F41817F8]();
}

- (int64_t)maxMessageSize
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)maxLargeMessageSize
{
  return ((uint64_t (*)(FTMessageDelivery *, char *))MEMORY[0x1F4181798])(self, sel_maxMessageSize);
}

- (void)networkStateChanged
{
  uint64_t v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1A7BC0000, v2, OS_LOG_TYPE_DEFAULT, "Network state changed", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_correctServerTimestampForDriftOnMessage:(id)a3 currentDate:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v9 = objc_msgSend_serverTimestamp(v5, v7, v8);
  uint64_t v12 = v9;
  if (v9)
  {
    id v13 = v9;
  }
  else
  {
    objc_msgSend_ftMessageDeliveryServerTimestamp(MEMORY[0x1E4F6C408], v10, v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v14 = v13;

  uint64_t v17 = objc_msgSend_serverTimestampReceivedDate(v5, v15, v16);
  uint64_t v20 = v17;
  if (v17)
  {
    id v21 = v17;
  }
  else
  {
    objc_msgSend_ftMessageDeliveryServerTimestampReceivedDate(MEMORY[0x1E4F6C408], v18, v19);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  if (v14)
  {
    objc_msgSend_timeIntervalSince1970(v6, v23, v24);
    double v26 = v25;
    objc_msgSend_doubleValue(v22, v27, v28);
    double v32 = v26 - v31;
    if (v26 - v31 > 0.0)
    {
      double v33 = v31;
      objc_msgSend_doubleValue(v14, v29, v30);
      double v35 = v34 / 1000.0;
      double v36 = v32 + v34 / 1000.0;
      uint64_t v39 = objc_msgSend_numberWithDouble_(NSNumber, v37, v38, v36 * 1000.0);
      objc_msgSend_setServerTimestamp_(v5, v40, (uint64_t)v39);

      long long v43 = objc_msgSend_numberWithDouble_(NSNumber, v41, v42, v26);
      objc_msgSend_setServerTimestampReceivedDate_(v5, v44, (uint64_t)v43);

      v47 = objc_msgSend_nonce(MEMORY[0x1E4F6C3B8], v45, v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v50 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v48, v49, v33);
        v53 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v51, v52, v35);
        v56 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v54, v55, v36);
        int v57 = 138413058;
        v58 = v50;
        __int16 v59 = 2048;
        double v60 = v32;
        __int16 v61 = 2112;
        v62 = v53;
        __int16 v63 = 2112;
        v64 = v56;
        _os_log_impl(&dword_1A7BC0000, v47, OS_LOG_TYPE_DEFAULT, "Timestamp received %@, delta %f servertimestamp %@ newServerTimestamp %@", (uint8_t *)&v57, 0x2Au);
      }
    }
  }
}

- (void)_signMessage:(id)a3 useDataSignatures:(BOOL)a4 body:(id)a5 queryString:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (objc_msgSend_wantsBodySignature(v12, v16, v17)) {
    id v18 = v13;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;
  if (objc_msgSend_wantsBAASigning(v12, v20, v21)) {
    v22 = v13;
  }
  else {
    v22 = 0;
  }
  id v71 = v22;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v26 = objc_msgSend_bagKey(v12, v24, v25);
  uint64_t v29 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v27, v28);
  objc_msgSend__correctServerTimestampForDriftOnMessage_currentDate_(self, v30, (uint64_t)v12, v29);

  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = sub_1A7BC7D90;
  v84[3] = &unk_1E5D1AC48;
  v84[4] = self;
  id v31 = v12;
  id v85 = v31;
  BOOL v91 = a4;
  id v32 = v26;
  id v86 = v32;
  id v72 = v14;
  id v87 = v72;
  id v33 = v19;
  id v88 = v33;
  id v34 = v23;
  id v89 = v34;
  id v70 = v15;
  id v90 = v70;
  double v35 = (void (**)(void))MEMORY[0x1AD0D56D0](v84);
  uint64_t v38 = objc_msgSend_signingSession(v31, v36, v37);
  if (v38
    && (long long v41 = (void *)v38,
        objc_msgSend_signingSession(v31, v39, v40),
        uint64_t v42 = objc_claimAutoreleasedReturnValue(),
        int isInitializedForSigning = objc_msgSend_isInitializedForSigning(v42, v43, v44),
        v42,
        v41,
        isInitializedForSigning))
  {
    if (objc_msgSend_wantsBodySigningOnly(v31, v39, v40))
    {
      v48 = objc_msgSend_serverTimestamp(v31, v46, v47);
      id v83 = 0;
      _FTGenerateDigestForSigningFromPayload(2, v33, v48, 0, &v83);
      id v49 = v83;
    }
    else
    {
      v48 = objc_msgSend_pushToken(v31, v46, v47);
      __int16 v59 = objc_msgSend_serverTimestamp(v31, v57, v58);
      id v82 = 0;
      _FTGenerateDigestForSigningFromComponents(2, v32, v72, v48, v33, v59, 0, &v82);
      id v49 = v82;
    }
    v56 = v71;

    id v60 = objc_alloc(MEMORY[0x1E4F6B3D8]);
    __int16 v63 = objc_msgSend_serverTimestamp(v31, v61, v62);
    uint64_t v65 = objc_msgSend_initWithSHA256Digest_requestBody_serverTimestamp_(v60, v64, (uint64_t)v49, v33, v63);

    v68 = objc_msgSend_signingSession(v31, v66, v67);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = sub_1A7BC8BF0;
    v78[3] = &unk_1E5D1AC70;
    id v79 = v31;
    id v80 = v34;
    v81 = v35;
    objc_msgSend_headersBySigningData_completion_(v68, v69, (uint64_t)v65, v78);
  }
  else if (objc_msgSend_wantsBAASigning(v31, v39, v40) && _os_feature_enabled_impl())
  {
    uint64_t v52 = objc_msgSend_baaSigner(self, v50, v51);
    uint64_t v55 = objc_msgSend_queue(v52, v53, v54);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A7BC8E84;
    block[3] = &unk_1E5D1AC98;
    block[4] = self;
    v56 = v71;
    id v74 = v71;
    id v75 = v31;
    id v76 = v34;
    v77 = v35;
    dispatch_async(v55, block);
  }
  else
  {
    v35[2](v35);
    v56 = v71;
  }
}

- (void)signDataWithPushIdentity:(id)a3 serverTimestamp:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v12 = a5;
  if (qword_1E97394D8 != -1) {
    dispatch_once(&qword_1E97394D8, &unk_1EFE07800);
  }
  if (qword_1E97394D0)
  {
    id v13 = objc_alloc_init((Class)qword_1E97394D0);
    objc_msgSend_setData_(v13, v14, (uint64_t)v8);
    objc_msgSend_setTime_(v13, v15, (uint64_t)v9);
    connection = self->_connection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1A7BC9274;
    v18[3] = &unk_1E5D1AD08;
    id v19 = v12;
    objc_msgSend_signDataWithDeviceIdentity_withCompletion_(connection, v17, (uint64_t)v13, v18);
  }
  else
  {
    id v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_1A7BFDC70(v13);
    }
  }
}

- (BOOL)bagDisablesVMTraffic
{
  uint64_t v2 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, 0);
  id v4 = objc_msgSend_objectForKey_(v2, v3, @"VM-traffic-disabled-version");
  BOOL v7 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (int)objc_msgSend_intValue(v4, v5, v6) > 0;

  return v7;
}

- (BOOL)isTrafficDisabledOnVMForMessage:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl()
    && objc_msgSend_isIDSMessage(v4, v5, v6)
    && IDSIsVirtualMachine())
  {
    char v9 = objc_msgSend_bagDisablesVMTraffic(self, v7, v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (BOOL)logToRegistration
{
  return self->_logToRegistration;
}

- (void)setLogToRegistration:(BOOL)a3
{
  self->_logToRegistration = a3;
}

- (unint64_t)maxConcurrentMessages
{
  return self->_maxConcurrentMessages;
}

- (void)setMaxConcurrentMessages:(unint64_t)a3
{
  self->_maxConcurrentMessages = a3;
}

- (BOOL)retryInAirplaneMode
{
  return self->_retryInAirplaneMode;
}

- (void)setRetryInAirplaneMode:(BOOL)a3
{
  self->_retryInAirplaneMode = a3;
}

- (BOOL)disallowRetry
{
  return self->_disallowRetry;
}

- (void)setDisallowRetry:(BOOL)a3
{
  self->_disallowRetry = a3;
}

- (IDSBAASigner)baaSigner
{
  return (IDSBAASigner *)objc_getProperty(self, a2, 72, 1);
}

- (NSHashTable)observerMap
{
  return (NSHashTable *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerMap, 0);
  objc_storeStrong((id *)&self->_baaSigner, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end