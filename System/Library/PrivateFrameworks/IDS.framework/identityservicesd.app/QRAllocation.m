@interface QRAllocation
- (BOOL)isJoinAllocation;
- (IDSQuickRelayAllocateMessage)request;
- (NSData)recipientPushToken;
- (NSMutableDictionary)pushTokenToQRSessionID;
- (NSMutableSet)responses;
- (NSString)requestIDStr;
- (NSString)sessionIDStr;
- (QRAllocation)initWithRequest:(id)a3;
- (QRAllocation)initWithResponse:(id)a3;
- (QRStreamInfo)streamInfo;
- (double)duration;
- (double)startTime;
- (id)connectReadyHandler;
- (id)getAllocation;
- (void)_allocationTimeout;
- (void)_purgeAllocation;
- (void)addAllocation:(id)a3;
- (void)cancelAllocationTimeoutTimer;
- (void)dealloc;
- (void)setConnectReadyHandler:(id)a3;
- (void)setDuration:(double)a3;
- (void)setIsJoinAllocation:(BOOL)a3;
- (void)setPurgeAtExpiration:(double)a3;
- (void)setPushTokenToQRSessionID:(id)a3;
- (void)setRecipientPushToken:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestIDStr:(id)a3;
- (void)setResponses:(id)a3;
- (void)setSessionIDStr:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setStreamInfo:(id)a3;
@end

@implementation QRAllocation

- (QRAllocation)initWithRequest:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)QRAllocation;
  v6 = [(QRAllocation *)&v38 init];
  v7 = v6;
  if (v5 && v6)
  {
    ids_monotonic_time();
    v7->_startTime = v8;
    objc_storeStrong((id *)&v7->_request, a3);
    uint64_t v9 = [v5 requestIDStr];
    requestIDStr = v7->_requestIDStr;
    v7->_requestIDStr = (NSString *)v9;

    v11 = [v5 IDSSessionID];
    BOOL v12 = [v11 length] == (id)16;

    if (v12)
    {
      id v13 = objc_alloc((Class)NSUUID);
      v14 = [v5 IDSSessionID];
      id v15 = objc_msgSend(v13, "initWithUUIDBytes:", -[NSString bytes](v14, "bytes"));
      uint64_t v16 = [v15 UUIDString];
      sessionIDStr = v7->_sessionIDStr;
      v7->_sessionIDStr = (NSString *)v16;
    }
    else
    {
      v18 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v5 IDSSessionID];
        id v20 = [v19 length];
        *(_DWORD *)buf = 134218240;
        id v40 = v20;
        __int16 v41 = 2048;
        uint64_t v42 = 16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Warning: [[request IDSSessionID] length]: %lu != sizeof(uuid_t): %lu", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v21 = [v5 IDSSessionID];
          id v34 = [v21 length];
          uint64_t v35 = 16;
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            v22 = objc_msgSend(v5, "IDSSessionID", v34, 16);
            id v34 = [v22 length];
            uint64_t v35 = 16;
            _IDSLogV();
          }
        }
      }
      v14 = v7->_sessionIDStr;
      v7->_sessionIDStr = 0;
    }

    if (!v7->_pushTokenToQRSessionID)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      pushTokenToQRSessionID = v7->_pushTokenToQRSessionID;
      v7->_pushTokenToQRSessionID = (NSMutableDictionary *)Mutable;
    }
    if (!v7->_responses)
    {
      v25 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      responses = v7->_responses;
      v7->_responses = v25;
    }
    -[QRAllocation setPurgeAtExpiration:](v7, "setPurgeAtExpiration:", 0.0, v34, v35);
    v27 = im_primary_queue();
    dispatch_source_t v28 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v27);
    timeoutTimer = v7->_timeoutTimer;
    v7->_timeoutTimer = (OS_dispatch_source *)v28;

    v30 = v7->_timeoutTimer;
    dispatch_time_t v31 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v30, v31, 0x45D964B800uLL, 0x5F5E100uLL);
    v32 = v7->_timeoutTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1002AE1B8;
    handler[3] = &unk_10097E4D0;
    v37 = v7;
    dispatch_source_set_event_handler(v32, handler);
    dispatch_resume((dispatch_object_t)v7->_timeoutTimer);
  }
  return v7;
}

- (QRAllocation)initWithResponse:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  v24.receiver = self;
  v24.super_class = (Class)QRAllocation;
  id v5 = [(QRAllocation *)&v24 init];
  v6 = v5;
  if (v4 && v5)
  {
    [(QRAllocation *)v5 startTime];
    if (v7 == 0.0)
    {
      double v11 = 0.0;
    }
    else
    {
      ids_monotonic_time();
      double v9 = v8;
      [(QRAllocation *)v6 startTime];
      double v11 = v9 - v10;
    }
    v6->_duration = v11;
    Value = (void *)kIDSQRAllocateKey_RequestID;
    if (kIDSQRAllocateKey_RequestID) {
      Value = (void *)CFDictionaryGetValue(v4, kIDSQRAllocateKey_RequestID);
    }
    objc_storeStrong((id *)&v6->_requestIDStr, Value);
    uint64_t v13 = [(__CFDictionary *)v4 objectForKey:kIDSQRAllocateKey_IDSSessionID];
    sessionIDStr = v6->_sessionIDStr;
    v6->_sessionIDStr = (NSString *)v13;

    pushTokenToQRSessionID = v6->_pushTokenToQRSessionID;
    v6->_pushTokenToQRSessionID = 0;

    if (!v6->_pushTokenToQRSessionID)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v17 = v6->_pushTokenToQRSessionID;
      v6->_pushTokenToQRSessionID = (NSMutableDictionary *)Mutable;
    }
    responses = v6->_responses;
    v6->_responses = 0;

    v19 = v6->_responses;
    if (!v19)
    {
      id v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v21 = v6->_responses;
      v6->_responses = v20;

      v19 = v6->_responses;
    }
    [(NSMutableSet *)v19 addObject:v4];
    if (kIDSQRAllocateKey_RelayExpiryTimestamp) {
      v22 = (void *)CFDictionaryGetValue(v4, kIDSQRAllocateKey_RelayExpiryTimestamp);
    }
    else {
      v22 = 0;
    }
    [v22 doubleValue];
    -[QRAllocation setPurgeAtExpiration:](v6, "setPurgeAtExpiration:");
  }

  return v6;
}

- (void)dealloc
{
  v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "QRAllocation destroyed", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  [(QRAllocation *)self cancelAllocationTimeoutTimer];
  request = self->_request;
  if (request)
  {
    id v5 = [(IDSQuickRelayAllocateMessage *)request recipients];
    unsigned int v6 = [v5 count];

    if (v6 > [(NSMutableSet *)self->_responses count])
    {
      id v7 = objc_alloc((Class)IDSQuickRelayMetric);
      double v8 = +[NSNumber numberWithInt:2];
      double v9 = [(IDSQuickRelayAllocateMessage *)self->_request provider];
      double v10 = [(IDSQuickRelayAllocateMessage *)self->_request allocateProtocolVersion];
      double v11 = [(IDSQuickRelayAllocateMessage *)self->_request appID];
      id v12 = [v7 initWithType:&off_1009D1B30 eventSubType:&off_1009D1B48 duration:0 resultCode:v8 providerType:v9 transportType:0 interfaceType:0 skeEnabled:0 isInitiator:&off_1009D1B60 protocolVersion:v10 retryCount:0 serviceName:v11 subServiceName:0 participantCount:0];

      uint64_t v13 = +[IDSCoreAnalyticsLogger defaultLogger];
      [v13 logMetric:v12];

      v14 = +[IDSAWDLogging sharedInstance];
      id v15 = +[NSNumber numberWithInt:2];
      uint64_t v16 = [(IDSQuickRelayAllocateMessage *)self->_request provider];
      v17 = [(IDSQuickRelayAllocateMessage *)self->_request allocateProtocolVersion];
      v18 = [(IDSQuickRelayAllocateMessage *)self->_request appID];
      [v14 IDSQuickRelayEventType:&off_1009D1B30 eventSubType:&off_1009D1B48 duration:0 resultCode:v15 providerType:v16 transportType:0 interfaceType:0 skeEnabled:0 isInitiator:&off_1009D1B60 protocolVersion:v17 retryCount:0 serviceName:v18 subServiceName:0 participantCount:0];

      v19 = [(IDSQuickRelayAllocateMessage *)self->_request IDSSessionID];
      id v20 = sub_1002AE7E0(v19);

      v21 = +[IDSDSessionController sharedInstance];
      v22 = [v21 sessionWithUniqueID:v20];

      if (v22)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        objc_super v24 = [(IDSQuickRelayAllocateMessage *)self->_request allocateProtocolVersion];
        [(__CFDictionary *)Mutable setObject:v24 forKeyedSubscript:IDSDSessionReportQRVersionKey];

        [(__CFDictionary *)Mutable setObject:&off_1009D1B48 forKeyedSubscript:IDSDSessionReportQREventSubTypeKey];
        v25 = +[NSNumber numberWithInt:2];
        [(__CFDictionary *)Mutable setObject:v25 forKeyedSubscript:IDSDSessionReportResultCodeKey];

        [v22 addQREventForRTCReport:Mutable];
      }
      else
      {
        v26 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Invalid session. Skip AWD report", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport();
            if (_IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
      }
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)QRAllocation;
  [(QRAllocation *)&v27 dealloc];
}

- (void)setPurgeAtExpiration:(double)a3
{
  IMTimeOfDay();
  double v6 = a3 + v5 * -1000.0;
  double v7 = v6 * 1000000.0;
  BOOL v8 = v6 < 120000.0;
  double v9 = 1.2e11;
  if (!v8) {
    double v9 = v7;
  }
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)v9);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  double v11 = im_primary_queue();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002AEAE4;
  v12[3] = &unk_100981000;
  objc_copyWeak(&v13, &location);
  dispatch_after(v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_purgeAllocation
{
  IMTimeOfDay();
  double v4 = v3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v35 = self;
  id obj = [(QRAllocation *)self responses];
  id v5 = 0;
  id v6 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v6)
  {
    double v7 = v4 * 1000.0;
    uint64_t v8 = *(void *)v41;
    double v9 = (const void *)kIDSQRAllocateKey_RelayExpiryTimestamp;
    dispatch_time_t v10 = (const void *)kIDSQRAllocateKey_RelaySessionID;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v12 = *(const __CFDictionary **)(*((void *)&v40 + 1) + 8 * i);
        if (v12) {
          BOOL v13 = v9 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (v13) {
          Value = 0;
        }
        else {
          Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(*((void *)&v40 + 1) + 8 * i), v9);
        }
        id v15 = Value;
        [v15 doubleValue];
        if (v7 > v16)
        {
          if (v12) {
            BOOL v17 = v10 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17) {
            v18 = 0;
          }
          else {
            v18 = (void *)CFDictionaryGetValue(v12, v10);
          }
          id v19 = v18;
          id v20 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v46 = v19;
            __int16 v47 = 2048;
            double v48 = v7;
            __int16 v49 = 2112;
            id v50 = v15;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "access token of allocation for QR session %@ expired (%f > %@). Discard it.", buf, 0x20u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v33 = v15;
              double v32 = v7;
              id v31 = v19;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v33 = v15;
                double v32 = v7;
                id v31 = v19;
                _IDSLogV();
              }
            }
          }
          if (!v5) {
            id v5 = objc_alloc_init((Class)NSMutableSet);
          }
          objc_msgSend(v5, "addObject:", v12, v31, *(void *)&v32, v33);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
    }
    while (v6);
  }

  if ([v5 count])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v21 = v5;
    id v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v37;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * (void)j);
          v26 = [(QRAllocation *)v35 responses];
          [v26 removeObject:v25];
        }
        id v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v22);
    }

    [v21 removeAllObjects];
  }
  objc_super v27 = [(QRAllocation *)v35 responses];
  BOOL v28 = [v27 count] == 0;

  if (v28)
  {
    v29 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "_purgeAllocation: Invalidate allocation", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    v30 = +[IDSQuickRelayAllocator sharedInstance];
    [v30 invalidateAllocation:v35];
  }
}

- (void)cancelAllocationTimeoutTimer
{
  if (self->_timeoutTimer)
  {
    double v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "allocation timeout timer cancelled", v5, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    dispatch_source_cancel((dispatch_source_t)self->_timeoutTimer);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
}

- (void)_allocationTimeout
{
  request = self->_request;
  if (request)
  {
    uint64_t v25 = [(IDSQuickRelayAllocateMessage *)request requestIDStr];
    double v4 = [(IDSQuickRelayAllocateMessage *)self->_request IDSSessionID];
    id v5 = sub_1002AE7E0(v4);

    id v6 = [(IDSQuickRelayAllocateMessage *)self->_request allocateType];
    double v7 = +[IDSUTunController sharedInstance];
    [v7 handleAllocateRequestFailureForDevice:v5 requestID:v25 errorCode:0];

    uint64_t v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "allocation timed out", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    double v9 = +[NSMutableDictionary dictionary];
    CFDictionarySetValue(v9, kIDSQRAllocateKey_ErrorCode, &off_1009D1B78);
    v35[0] = 0xAAAAAAAAAAAAAAAALL;
    v35[1] = 0xAAAAAAAAAAAAAAAALL;
    id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:v25];
    [v10 getUUIDBytes:v35];

    id v11 = +[NSData dataWithBytes:v35 length:16];
    if (v11)
    {
      CFDictionarySetValue(v9, kIDSQRAllocateKey_RequestID, v11);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071C978();
    }

    CFDictionaryRef v12 = [(IDSQuickRelayAllocateMessage *)self->_request appID];
    if (v12)
    {
      CFDictionarySetValue(v9, kIDSQRAllocateKey_AppID, v12);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071C8F0();
    }

    BOOL v13 = +[IMDeviceSupport sharedInstance];
    v14 = [v13 userAgentString];

    id v15 = v14;
    if (v15)
    {
      CFDictionarySetValue(v9, kIDSQRAllocateKey_UserAgent, v15);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071C868();
    }

    id v16 = v6;
    if (v16)
    {
      CFDictionarySetValue(v9, kIDSQRAllocateKey_AllocateType, v16);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071C7E0();
    }

    BOOL v17 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v30 = v5;
      __int16 v31 = 2112;
      double v32 = v25;
      __int16 v33 = 2112;
      id v34 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sending server message QR metrics allocation timeout report for session %@ requestID: %@, ua: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v23 = v25;
        id v24 = v15;
        id v22 = v5;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          uint64_t v23 = v25;
          id v24 = v15;
          id v22 = v5;
          _IDSLogV();
        }
      }
    }
    v18 = [[IDSServerMessage alloc] initWithPayload:v9 command:&off_1009D1B90];
    id v19 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002AF5E4;
    block[3] = &unk_10097E440;
    objc_super v27 = v18;
    id v28 = v5;
    id v20 = v5;
    id v21 = v18;
    dispatch_async(v19, block);
  }
  [(QRAllocation *)self cancelAllocationTimeoutTimer];
}

- (void)addAllocation:(id)a3
{
  id v4 = a3;
  selfAllocations = self->_selfAllocations;
  id v8 = v4;
  if (!selfAllocations)
  {
    id v6 = objc_alloc_init(QRSelfAllocationArray);
    double v7 = self->_selfAllocations;
    self->_selfAllocations = v6;

    id v4 = v8;
    selfAllocations = self->_selfAllocations;
  }
  [(QRSelfAllocationArray *)selfAllocations addAllocation:v4];
}

- (id)getAllocation
{
  selfAllocations = self->_selfAllocations;
  if (selfAllocations)
  {
    selfAllocations = [selfAllocations getAllocation];
  }

  return selfAllocations;
}

- (NSString)requestIDStr
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequestIDStr:(id)a3
{
}

- (NSString)sessionIDStr
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSessionIDStr:(id)a3
{
}

- (IDSQuickRelayAllocateMessage)request
{
  return (IDSQuickRelayAllocateMessage *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSMutableSet)responses
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResponses:(id)a3
{
}

- (NSMutableDictionary)pushTokenToQRSessionID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPushTokenToQRSessionID:(id)a3
{
}

- (NSData)recipientPushToken
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRecipientPushToken:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)connectReadyHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setConnectReadyHandler:(id)a3
{
}

- (BOOL)isJoinAllocation
{
  return self->_isJoinAllocation;
}

- (void)setIsJoinAllocation:(BOOL)a3
{
  self->_isJoinAlid location = a3;
}

- (QRStreamInfo)streamInfo
{
  return (QRStreamInfo *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStreamInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamInfo, 0);
  objc_storeStrong((id *)&self->_selfAllocations, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_connectReadyHandler, 0);
  objc_storeStrong((id *)&self->_recipientPushToken, 0);
  objc_storeStrong((id *)&self->_pushTokenToQRSessionID, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_sessionIDStr, 0);

  objc_storeStrong((id *)&self->_requestIDStr, 0);
}

@end