@interface AAFAnalyticsTransportInProcessRTC
+ (id)analyticsTransportRTCWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5;
- (AAFAnalyticsTransportInProcessRTC)initWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5;
- (BOOL)_sendMessageWithCategory:(id)a3 payload:(id)a4 error:(id *)a5;
- (NSDictionary)sessionInfo;
- (NSDictionary)userInfo;
- (NSMutableArray)eventQueue;
- (NSNumber)clientType;
- (NSString)clientBundleId;
- (NSString)clientName;
- (NSString)debugDescription;
- (RTCReporting)rtcReportingSession;
- (id)_createPayloadWith:(id)a3;
- (unint64_t)sessionGracePeriod;
- (unint64_t)sessionState;
- (void)configureReportingSessionWithCompletion:(id)a3;
- (void)dealloc;
- (void)sendEvent:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setRtcReportingSession:(id)a3;
- (void)setSessionGracePeriod:(unint64_t)a3;
- (void)setSessionInfo:(id)a3;
- (void)setSessionState:(unint64_t)a3;
@end

@implementation AAFAnalyticsTransportInProcessRTC

- (AAFAnalyticsTransportInProcessRTC)initWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v71.receiver = self;
  v71.super_class = (Class)AAFAnalyticsTransportInProcessRTC;
  v12 = [(AAFAnalyticsTransportInProcessRTC *)&v71 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_59;
  }
  id v69 = v9;
  objc_storeStrong((id *)&v12->_clientType, a3);
  objc_storeStrong((id *)&v13->_clientBundleId, a4);
  objc_storeStrong((id *)&v13->_clientName, a5);
  v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  sessionInfo = v13->_sessionInfo;
  v13->_sessionInfo = v14;

  v16 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  userInfo = v13->_userInfo;
  v13->_userInfo = v16;

  v18 = (void *)[(NSDictionary *)v13->_sessionInfo mutableCopy];
  clientType = v13->_clientType;
  if (RTCReportingLibraryCore())
  {
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x2020000000;
    v20 = (void *)getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr;
    uint64_t v80 = getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr;
    if (!getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr)
    {
      uint64_t v72 = MEMORY[0x1E4F143A8];
      uint64_t v73 = 3221225472;
      v74 = __getkRTCReportingSessionInfoClientTypeSymbolLoc_block_invoke;
      v75 = &unk_1E6CFA9C0;
      v76 = &v77;
      v21 = (void *)RTCReportingLibrary();
      v22 = dlsym(v21, "kRTCReportingSessionInfoClientType");
      *(void *)(v76[1] + 24) = v22;
      getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr = *(void *)(v76[1] + 24);
      v20 = (void *)v78[3];
    }
    _Block_object_dispose(&v77, 8);
    if (!v20)
    {
      -[AAFAnalyticsTransportInProcessRTC initWithClientType:clientBundleId:clientName:]();
      goto LABEL_61;
    }
    [v18 setObject:clientType forKeyedSubscript:*v20];
  }
  else
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
    [v18 setObject:clientType forKeyedSubscript:v23];
  }
  if (RTCReportingLibraryCore())
  {
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x2020000000;
    v24 = (void *)getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr;
    uint64_t v80 = getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr;
    if (!getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr)
    {
      uint64_t v72 = MEMORY[0x1E4F143A8];
      uint64_t v73 = 3221225472;
      v74 = __getkRTCReportingSessionInfoClientVersionSymbolLoc_block_invoke;
      v75 = &unk_1E6CFA9C0;
      v76 = &v77;
      v25 = (void *)RTCReportingLibrary();
      v26 = dlsym(v25, "kRTCReportingSessionInfoClientVersion");
      *(void *)(v76[1] + 24) = v26;
      getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr = *(void *)(v76[1] + 24);
      v24 = (void *)v78[3];
    }
    _Block_object_dispose(&v77, 8);
    if (v24)
    {
      [v18 setObject:&unk_1F3940710 forKeyedSubscript:*v24];
      goto LABEL_14;
    }
LABEL_61:
    -[AAFAnalyticsTransportInProcessRTC initWithClientType:clientBundleId:clientName:]();
    goto LABEL_62;
  }
  v27 = [MEMORY[0x1E4F1CA98] null];
  [v18 setObject:&unk_1F3940710 forKeyedSubscript:v27];

LABEL_14:
  if (RTCReportingLibraryCore())
  {
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x2020000000;
    v28 = (void *)getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr;
    uint64_t v80 = getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr;
    if (!getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr)
    {
      uint64_t v72 = MEMORY[0x1E4F143A8];
      uint64_t v73 = 3221225472;
      v74 = __getkRTCReportingSessionInfoSessionIDSymbolLoc_block_invoke;
      v75 = &unk_1E6CFA9C0;
      v76 = &v77;
      v29 = (void *)RTCReportingLibrary();
      v30 = dlsym(v29, "kRTCReportingSessionInfoSessionID");
      *(void *)(v76[1] + 24) = v30;
      getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr = *(void *)(v76[1] + 24);
      v28 = (void *)v78[3];
    }
    _Block_object_dispose(&v77, 8);
    if (v28)
    {
      [v18 setObject:&unk_1F3940710 forKeyedSubscript:*v28];
      goto LABEL_20;
    }
LABEL_62:
    -[AAFAnalyticsTransportInProcessRTC initWithClientType:clientBundleId:clientName:]();
    goto LABEL_63;
  }
  v31 = [MEMORY[0x1E4F1CA98] null];
  [v18 setObject:&unk_1F3940710 forKeyedSubscript:v31];

LABEL_20:
  if (RTCReportingLibraryCore())
  {
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x2020000000;
    v32 = (void *)getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr;
    uint64_t v80 = getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr;
    if (!getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr)
    {
      uint64_t v72 = MEMORY[0x1E4F143A8];
      uint64_t v73 = 3221225472;
      v74 = __getkRTCReportingSessionInfoBatchEventSymbolLoc_block_invoke;
      v75 = &unk_1E6CFA9C0;
      v76 = &v77;
      v33 = (void *)RTCReportingLibrary();
      v34 = dlsym(v33, "kRTCReportingSessionInfoBatchEvent");
      *(void *)(v76[1] + 24) = v34;
      getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr = *(void *)(v76[1] + 24);
      v32 = (void *)v78[3];
    }
    _Block_object_dispose(&v77, 8);
    if (v32)
    {
      [v18 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*v32];
      goto LABEL_26;
    }
LABEL_63:
    -[AAFAnalyticsTransportInProcessRTC initWithClientType:clientBundleId:clientName:]();
    goto LABEL_64;
  }
  v35 = [MEMORY[0x1E4F1CA98] null];
  [v18 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v35];

LABEL_26:
  clientBundleId = v13->_clientBundleId;
  if (!RTCReportingLibraryCore())
  {
    v40 = [MEMORY[0x1E4F1CA98] null];
    [v18 setObject:clientBundleId forKeyedSubscript:v40];

    goto LABEL_32;
  }
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  v37 = (void *)getkRTCReportingSessionInfoClientBundleIDSymbolLoc_ptr;
  uint64_t v80 = getkRTCReportingSessionInfoClientBundleIDSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoClientBundleIDSymbolLoc_ptr)
  {
    uint64_t v72 = MEMORY[0x1E4F143A8];
    uint64_t v73 = 3221225472;
    v74 = __getkRTCReportingSessionInfoClientBundleIDSymbolLoc_block_invoke;
    v75 = &unk_1E6CFA9C0;
    v76 = &v77;
    v38 = (void *)RTCReportingLibrary();
    v39 = dlsym(v38, "kRTCReportingSessionInfoClientBundleID");
    *(void *)(v76[1] + 24) = v39;
    getkRTCReportingSessionInfoClientBundleIDSymbolLoc_ptr = *(void *)(v76[1] + 24);
    v37 = (void *)v78[3];
  }
  _Block_object_dispose(&v77, 8);
  if (!v37)
  {
LABEL_64:
    -[AAFAnalyticsTransportInProcessRTC initWithClientType:clientBundleId:clientName:]();
    goto LABEL_65;
  }
  [v18 setObject:clientBundleId forKeyedSubscript:*v37];
LABEL_32:
  if (+[AFUtilities isInternalBuild])
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"realTimeEvents", @"com.apple.aaafoundation", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      if (AppBooleanValue)
      {
        if (RTCReportingLibraryCore())
        {
          uint64_t v77 = 0;
          v78 = &v77;
          uint64_t v79 = 0x2020000000;
          v42 = (void *)getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr;
          uint64_t v80 = getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr;
          if (!getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr)
          {
            uint64_t v72 = MEMORY[0x1E4F143A8];
            uint64_t v73 = 3221225472;
            v74 = __getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_block_invoke;
            v75 = &unk_1E6CFA9C0;
            v76 = &v77;
            v43 = (void *)RTCReportingLibrary();
            v44 = dlsym(v43, "kRTCReportingSessionInfoContainsRealtimeEvents");
            *(void *)(v76[1] + 24) = v44;
            getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr = *(void *)(v76[1] + 24);
            v42 = (void *)v78[3];
          }
          _Block_object_dispose(&v77, 8);
          if (!v42)
          {
LABEL_67:
            v68 = (_Unwind_Exception *)-[AAFAnalyticsTransportInProcessRTC initWithClientType:clientBundleId:clientName:]();
            _Block_object_dispose(&v77, 8);
            _Unwind_Resume(v68);
          }
          [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v42];
        }
        else
        {
          v45 = [MEMORY[0x1E4F1CA98] null];
          [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v45];
        }
      }
    }
  }
  uint64_t v46 = [v18 copy];
  v47 = v13->_sessionInfo;
  v13->_sessionInfo = (NSDictionary *)v46;

  v48 = (void *)[(NSDictionary *)v13->_userInfo mutableCopy];
  if (RTCReportingLibraryCore())
  {
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x2020000000;
    v49 = (void *)getkRTCReportingUserInfoServiceNameSymbolLoc_ptr;
    uint64_t v80 = getkRTCReportingUserInfoServiceNameSymbolLoc_ptr;
    if (!getkRTCReportingUserInfoServiceNameSymbolLoc_ptr)
    {
      uint64_t v72 = MEMORY[0x1E4F143A8];
      uint64_t v73 = 3221225472;
      v74 = __getkRTCReportingUserInfoServiceNameSymbolLoc_block_invoke;
      v75 = &unk_1E6CFA9C0;
      v76 = &v77;
      v50 = (void *)RTCReportingLibrary();
      v51 = dlsym(v50, "kRTCReportingUserInfoServiceName");
      *(void *)(v76[1] + 24) = v51;
      getkRTCReportingUserInfoServiceNameSymbolLoc_ptr = *(void *)(v76[1] + 24);
      v49 = (void *)v78[3];
    }
    _Block_object_dispose(&v77, 8);
    if (v49)
    {
      [v48 setObject:@"default" forKeyedSubscript:*v49];
      goto LABEL_47;
    }
LABEL_65:
    -[AAFAnalyticsTransportInProcessRTC initWithClientType:clientBundleId:clientName:]();
LABEL_66:
    -[AAFAnalyticsTransportInProcessRTC initWithClientType:clientBundleId:clientName:]();
    goto LABEL_67;
  }
  v52 = [MEMORY[0x1E4F1CA98] null];
  [v48 setObject:@"default" forKeyedSubscript:v52];

LABEL_47:
  clientName = v13->_clientName;
  if (!RTCReportingLibraryCore())
  {
    v57 = [MEMORY[0x1E4F1CA98] null];
    [v48 setObject:clientName forKeyedSubscript:v57];

    goto LABEL_53;
  }
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  v54 = (void *)getkRTCReportingUserInfoClientNameSymbolLoc_ptr;
  uint64_t v80 = getkRTCReportingUserInfoClientNameSymbolLoc_ptr;
  if (!getkRTCReportingUserInfoClientNameSymbolLoc_ptr)
  {
    uint64_t v72 = MEMORY[0x1E4F143A8];
    uint64_t v73 = 3221225472;
    v74 = __getkRTCReportingUserInfoClientNameSymbolLoc_block_invoke;
    v75 = &unk_1E6CFA9C0;
    v76 = &v77;
    v55 = (void *)RTCReportingLibrary();
    v56 = dlsym(v55, "kRTCReportingUserInfoClientName");
    *(void *)(v76[1] + 24) = v56;
    getkRTCReportingUserInfoClientNameSymbolLoc_ptr = *(void *)(v76[1] + 24);
    v54 = (void *)v78[3];
  }
  _Block_object_dispose(&v77, 8);
  if (!v54) {
    goto LABEL_66;
  }
  [v48 setObject:clientName forKeyedSubscript:*v54];
LABEL_53:
  uint64_t v58 = [v48 copy];
  v59 = v13->_userInfo;
  v13->_userInfo = (NSDictionary *)v58;

  *(_OWORD *)&v13->_sessionState = xmmword_1DD948F20;
  uint64_t v60 = [MEMORY[0x1E4F1CA48] array];
  eventQueue = v13->_eventQueue;
  v13->_eventQueue = (NSMutableArray *)v60;

  id v9 = v69;
  if (RTCReportingLibraryCore())
  {
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x2050000000;
    v62 = (void *)getRTCReportingClass_softClass;
    uint64_t v80 = getRTCReportingClass_softClass;
    if (!getRTCReportingClass_softClass)
    {
      uint64_t v72 = MEMORY[0x1E4F143A8];
      uint64_t v73 = 3221225472;
      v74 = __getRTCReportingClass_block_invoke;
      v75 = &unk_1E6CFA9C0;
      v76 = &v77;
      RTCReportingLibraryCore();
      Class Class = objc_getClass("RTCReporting");
      *(void *)(v76[1] + 24) = Class;
      getRTCReportingClass_softClass Class = *(void *)(v76[1] + 24);
      v62 = (void *)v78[3];
    }
    v64 = v62;
    _Block_object_dispose(&v77, 8);
  }
  else
  {
    v64 = 0;
  }
  uint64_t v65 = [[v64 alloc] initWithSessionInfo:v13->_sessionInfo userInfo:v13->_userInfo frameworksToCheck:0];
  rtcReportingSession = v13->_rtcReportingSession;
  v13->_rtcReportingSession = (RTCReporting *)v65;

LABEL_59:
  return v13;
}

- (id)_createPayloadWith:(id)a3
{
  id v3 = a3;
  v4 = [v3 reportData];
  v5 = (void *)[v4 mutableCopy];

  v6 = [v3 eventName];

  if (v6)
  {
    v7 = [v3 eventName];
    [v5 setObject:v7 forKeyedSubscript:@"eventName"];
  }
  return v5;
}

- (void)configureReportingSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(AAFAnalyticsTransportInProcessRTC *)self rtcReportingSession];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__AAFAnalyticsTransportInProcessRTC_configureReportingSessionWithCompletion___block_invoke;
  v7[3] = &unk_1E6CFAA08;
  id v8 = v4;
  id v6 = v4;
  [v5 startConfigurationWithCompletionHandler:v7];
}

uint64_t __77__AAFAnalyticsTransportInProcessRTC_configureReportingSessionWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_sendMessageWithCategory:(id)a3 payload:(id)a4 error:(id *)a5
{
  rtcReportingSession = self->_rtcReportingSession;
  id v8 = a4;
  LOBYTE(a5) = -[RTCReporting sendMessageWithCategory:type:payload:error:](rtcReportingSession, "sendMessageWithCategory:type:payload:error:", (unsigned __int16)[a3 unsignedIntValue], 0, v8, a5);

  return (char)a5;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 eventCategory];

  if (v5)
  {
    id v6 = [(AAFAnalyticsTransportInProcessRTC *)self _createPayloadWith:v4];
    v7 = [v4 eventCategory];
    id v12 = 0;
    BOOL v8 = [(AAFAnalyticsTransportInProcessRTC *)self _sendMessageWithCategory:v7 payload:v6 error:&v12];
    id v9 = v12;

    id v10 = _AAFLogSystem();
    id v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[AAFAnalyticsTransportInProcessRTC sendEvent:]((uint64_t)self, v11);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      [(AAFAnalyticsTransportInProcessRTC *)(uint64_t)self sendEvent:v11];
    }
  }
  else
  {
    id v6 = _AAFLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AAFAnalyticsTransportInProcessRTC sendEvent:](v4, v6);
    }
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DD937000, a2, OS_LOG_TYPE_DEBUG, "%@ deallocated", (uint8_t *)&v2, 0xCu);
}

- (NSString)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(AAFAnalyticsTransportInProcessRTC *)self clientType];
  id v6 = [(AAFAnalyticsTransportInProcessRTC *)self clientBundleId];
  v7 = [(AAFAnalyticsTransportInProcessRTC *)self clientName];
  BOOL v8 = [(AAFAnalyticsTransportInProcessRTC *)self sessionInfo];
  id v9 = [(AAFAnalyticsTransportInProcessRTC *)self userInfo];
  id v10 = [v3 stringWithFormat:@"<%@: %p> ClientType: [%@], ClientBundleId: [%@], ClientName: [%@], SessionInfo: %@, UserInfo: %@", v4, self, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

+ (id)analyticsTransportRTCWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8 && v9 && v10)
  {
    id v12 = (void *)[objc_alloc((Class)a1) initWithClientType:v8 clientBundleId:v9 clientName:v10];
  }
  else
  {
    v13 = _AAFLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[AAFAnalyticsTransportInProcessRTC analyticsTransportRTCWithClientType:clientBundleId:clientName:](v13);
    }

    id v12 = 0;
  }

  return v12;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(unint64_t)a3
{
  self->_sessionState = a3;
}

- (unint64_t)sessionGracePeriod
{
  return self->_sessionGracePeriod;
}

- (void)setSessionGracePeriod:(unint64_t)a3
{
  self->_sessionGracePeriod = a3;
}

- (NSNumber)clientType
{
  return self->_clientType;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSDictionary)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
}

- (RTCReporting)rtcReportingSession
{
  return self->_rtcReportingSession;
}

- (void)setRtcReportingSession:(id)a3
{
}

- (NSMutableArray)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_rtcReportingSession, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientType, 0);
}

- (uint64_t)initWithClientType:clientBundleId:clientName:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[AAFAnalyticsTransportInProcessRTC sendEvent:](v0);
}

- (void)sendEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 eventName];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DD937000, a2, OS_LOG_TYPE_ERROR, "Error sending report for event (%@). RTC event needs a category.", (uint8_t *)&v4, 0xCu);
}

- (void)sendEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_0_2();
  uint64_t v7 = a1;
  id v5 = v4;
  _os_log_debug_impl(&dword_1DD937000, a2, OS_LOG_TYPE_DEBUG, "<%@: %p> RTCReporting send success!", v6, 0x16u);
}

- (void)sendEvent:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_0_2();
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  uint64_t v11 = a2;
  id v7 = v6;
  _os_log_error_impl(&dword_1DD937000, a3, OS_LOG_TYPE_ERROR, "<%@: %p> RTCReporting send failed with error: %{public}@", v8, 0x20u);
}

+ (void)analyticsTransportRTCWithClientType:(os_log_t)log clientBundleId:clientName:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD937000, log, OS_LOG_TYPE_ERROR, "Failed to initialize AAFAnalyticsTransportRTC. Please check if all required parameters are provided.", v1, 2u);
}

@end