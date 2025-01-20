@interface WRMClient
- (BOOL)setupServiceConnection;
- (WRMClient)init;
- (WRMClient)initWithDelegate:(id)a3;
- (WRMClientDelegate)delegate;
- (int)getWRMSubscribeVersion;
- (int)mediaControlInfoVersion;
- (void)dealloc;
- (void)dumpReport:(id)a3;
- (void)processNotificationList:(id)a3;
- (void)processWRMCoexMetrics:(id)a3 isAlertedMode:(BOOL)a4;
- (void)releaseServiceConnection;
- (void)reportImmediateMetric:(int)a3 value:(unint64_t)a4;
- (void)reportMetricsFaceTimeCalling:(id *)a3;
- (void)reportMetricsWifiCalling:(id *)a3;
- (void)requestNotificationFaceTimeCalling;
- (void)sendProcessInfoWithProcessID:(unint64_t)a3;
- (void)sendReport:(id)a3;
- (void)sendStatusUpdateFaceTimeCalling:(id *)a3;
- (void)sendStatusUpdateInfoFaceTimeCalling:(id)a3;
- (void)sendSubscriptionInfoFaceTimeCalling;
- (void)sendUnsubscriptionInfoFaceTimeCalling;
- (void)setConfiguration:(id *)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaControlInfoVersion:(int)a3;
- (void)setPreWarmState:(BOOL)a3;
- (void)setRSSIThresholdEnabled:(BOOL)a3;
- (void)startWRMClientWithMode:(int)a3 metricsConfig:(id)a4;
- (void)stopWRMClient;
- (void)updateMetricsConfig:(id)a3;
@end

@implementation WRMClient

- (WRMClient)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)WRMClient;
  v2 = [(WRMClient *)&v7 init];
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v9 = v3;
        __int16 v10 = 2080;
        v11 = "-[WRMClient init]";
        __int16 v12 = 1024;
        int v13 = 110;
        __int16 v14 = 2048;
        v15 = v2;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient[%p] init", buf, 0x26u);
      }
    }
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_connectionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.WRMClient.clientQueue", 0, CustomRootQueue);
    v2->_rssiThreshold = -80;
  }
  return v2;
}

- (WRMClient)initWithDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)WRMClient;
  v4 = [(WRMClient *)&v9 init];
  if (v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        int v13 = "-[WRMClient initWithDelegate:]";
        __int16 v14 = 1024;
        int v15 = 121;
        __int16 v16 = 2048;
        v17 = v4;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient[%p] init", buf, 0x26u);
      }
    }
    objc_storeWeak(&v4->_wrmClientDelegate, a3);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v4->_connectionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.WRMClient.clientQueue", 0, CustomRootQueue);
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      objc_super v9 = "-[WRMClient dealloc]";
      __int16 v10 = 1024;
      int v11 = 128;
      __int16 v12 = 2048;
      int v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient[%p] dealloc", buf, 0x26u);
    }
  }
  [(WRMClient *)self releaseServiceConnection];
  dispatch_release((dispatch_object_t)self->_connectionQueue);
  objc_storeWeak(&self->_wrmClientDelegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)WRMClient;
  [(WRMClient *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
}

- (WRMClientDelegate)delegate
{
  return (WRMClientDelegate *)objc_loadWeak(&self->_wrmClientDelegate);
}

- (BOOL)setupServiceConnection
{
  v8[5] = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (!connection)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    self->_connection = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", global_queue, 0);
    uint64_t v5 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    v6 = self->_connection;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__WRMClient_setupServiceConnection__block_invoke;
    v8[3] = &unk_1E6DB79C0;
    v8[4] = v5;
    xpc_connection_set_event_handler(v6, v8);
    xpc_connection_resume(self->_connection);
  }
  return connection == 0;
}

void __35__WRMClient_setupServiceConnection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) strong];

  HandleWRMEvent(a2, v3);
}

- (void)releaseServiceConnection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (connection)
  {
    xpc_release(connection);
    self->_connection = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      objc_super v9 = "-[WRMClient releaseServiceConnection]";
      __int16 v10 = 1024;
      int v11 = 167;
      __int16 v12 = 2048;
      int v13 = self;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient(%p): stopped.", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)startWRMClientWithMode:(int)a3 metricsConfig:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WRMClient_startWRMClientWithMode_metricsConfig___block_invoke;
  block[3] = &unk_1E6DB83E0;
  block[4] = self;
  $EB925890EBEBD6850280D1FB85A9BD43 v7 = a4;
  int v6 = a3;
  dispatch_async(connectionQueue, block);
}

void __50__WRMClient_startWRMClientWithMode_metricsConfig___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) setupServiceConnection])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    __int16 v3 = *(_WORD *)(a1 + 44);
    *(unsigned char *)(v2 + 42) = *(unsigned char *)(a1 + 46);
    *(_WORD *)(v2 + 40) = v3;
    int v4 = *(_DWORD *)(a1 + 40);
    if (v4 == 1)
    {
      [*(id *)(a1 + 32) sendProcessInfoWithProcessID:14];
      [*(id *)(a1 + 32) sendSubscriptionInfoFaceTimeCalling];
    }
    else if (!v4)
    {
      [*(id *)(a1 + 32) sendProcessInfoWithProcessID:9];
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 36) = *(_DWORD *)(a1 + 40);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      int v11 = "-[WRMClient startWRMClientWithMode:metricsConfig:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 188;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient(%p): started.", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)stopWRMClient
{
  v3[5] = *MEMORY[0x1E4F143B8];
  connectionQueue = self->_connectionQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__WRMClient_stopWRMClient__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(connectionQueue, v3);
}

uint64_t __26__WRMClient_stopWRMClient__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) releaseServiceConnection];
}

- (int)getWRMSubscribeVersion
{
  return dword_1E25A1180[(self->_metricsConfig.reportRtpErasureMetricsEnabled | (2
                                                                                                * self->_metricsConfig.reportImmediateMetricsEnabled))];
}

- (void)sendProcessInfoWithProcessID:(unint64_t)a3
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = "kWCMRegisterProcess_ProcessId";
  xpc_object_t v4 = xpc_uint64_create(a3);
  xpc_object_t values = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)uint64_t v9 = xmmword_1E6DB8428;
  xpc_object_t v6 = xpc_uint64_create(1uLL);
  v8[0] = v6;
  v8[1] = v5;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v9, v8, 2uLL);
  xpc_connection_send_message(self->_connection, v7);
  xpc_release(v4);
  xpc_release(v6);
  xpc_release(v5);
  xpc_release(v7);
}

- (void)sendSubscriptionInfoFaceTimeCalling
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_uint64_create([(WRMClient *)self getWRMSubscribeVersion]);
  xpc_object_t v4 = xpc_int64_create(self->_rssiThreshold);
  xpc_object_t object = xpc_uint64_create(1uLL);
  xpc_object_t v14 = xpc_uint64_create(2uLL);
  xpc_object_t v5 = xpc_uint64_create(0);
  xpc_object_t v16 = xpc_uint64_create(0x32uLL);
  xpc_object_t v6 = xpc_uint64_create(0x1F4uLL);
  *(_OWORD *)keys = xmmword_1E6DB8400;
  long long v29 = *(_OWORD *)&off_1E6DB8410;
  v30 = "kWRMRSSITh";
  values[0] = object;
  values[1] = v5;
  values[2] = v16;
  values[3] = v3;
  values[4] = v4;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 5uLL);
  *(_OWORD *)v24 = xmmword_1E6DB8400;
  long long v25 = *(_OWORD *)&off_1E6DB8410;
  v26 = "kWRMRSSITh";
  v23[0] = v14;
  v23[1] = v5;
  v23[2] = v6;
  v23[3] = v3;
  v23[4] = v4;
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)v24, v23, 5uLL);
  objects[0] = v7;
  objects[1] = v8;
  xpc_object_t v9 = xpc_array_create(objects, 2uLL);
  xpc_object_t v20 = v9;
  v21 = "kWRMApplicationTypeList";
  xpc_object_t v10 = xpc_dictionary_create((const char *const *)&v21, &v20, 1uLL);
  *(_OWORD *)v19 = xmmword_1E6DB8428;
  xpc_object_t v11 = xpc_uint64_create(0x196uLL);
  v18[0] = v11;
  v18[1] = v10;
  xpc_object_t v12 = xpc_dictionary_create((const char *const *)v19, v18, 2uLL);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WRMClient_sendSubscriptionInfoFaceTimeCalling__block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = v12;
  dispatch_async(connectionQueue, block);
  xpc_release(v3);
  xpc_release(object);
  xpc_release(v14);
  xpc_release(v5);
  xpc_release(v16);
  xpc_release(v6);
  xpc_release(v7);
  xpc_release(v8);
  xpc_release(v9);
  xpc_release(v10);
  xpc_release(v11);
  xpc_release(v12);
}

void __48__WRMClient_sendSubscriptionInfoFaceTimeCalling__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      xpc_object_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v6 = 136315906;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        xpc_object_t v9 = "-[WRMClient sendSubscriptionInfoFaceTimeCalling]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 279;
        __int16 v12 = 2048;
        uint64_t v13 = v5;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient(%p): Subscribed to WRM iRAT notification", (uint8_t *)&v6, 0x26u);
      }
    }
  }
}

- (void)sendUnsubscriptionInfoFaceTimeCalling
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)keys = xmmword_1E6DB8428;
  xpc_object_t v3 = xpc_uint64_create(0x196uLL);
  values[0] = v3;
  values[1] = 0;
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  connectionQueue = self->_connectionQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__WRMClient_sendUnsubscriptionInfoFaceTimeCalling__block_invoke;
  v6[3] = &unk_1E6DB3E40;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(connectionQueue, v6);
  xpc_release(v3);
  xpc_release(v4);
}

void __50__WRMClient_sendUnsubscriptionInfoFaceTimeCalling__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      xpc_object_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v6 = 136315906;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        uint64_t v9 = "-[WRMClient sendUnsubscriptionInfoFaceTimeCalling]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 307;
        __int16 v12 = 2048;
        uint64_t v13 = v5;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient(%p): Unsubscribed to WRM iRAT notification", (uint8_t *)&v6, 0x26u);
      }
    }
  }
}

- (void)requestNotificationFaceTimeCalling
{
  [(WRMClient *)self sendUnsubscriptionInfoFaceTimeCalling];

  [(WRMClient *)self sendSubscriptionInfoFaceTimeCalling];
}

- (void)sendStatusUpdateInfoFaceTimeCalling:(id)a3
{
  objects[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  objects[0] = a3;
  xpc_object_t v4 = xpc_array_create(objects, 1uLL);
  keys = "kWRMApplicationTypeList";
  xpc_object_t values = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)int v11 = xmmword_1E6DB8428;
  xpc_object_t v6 = xpc_uint64_create(0x197uLL);
  v10[0] = v6;
  v10[1] = v5;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  connectionQueue = self->_connectionQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__WRMClient_sendStatusUpdateInfoFaceTimeCalling___block_invoke;
  v9[3] = &unk_1E6DB3E40;
  v9[4] = self;
  v9[5] = v7;
  dispatch_async(connectionQueue, v9);
  xpc_release(v4);
  xpc_release(v5);
  xpc_release(v6);
  xpc_release(v7);
}

void __49__WRMClient_sendStatusUpdateInfoFaceTimeCalling___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8)) {
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), *(xpc_object_t *)(a1 + 40));
  }
}

- (void)sendStatusUpdateFaceTimeCalling:(id *)a3
{
  if (self->_connection)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kWRMApplicationType", a3->var0);
    xpc_dictionary_set_uint64(v5, "kWRMLinkType", a3->var1);
    xpc_dictionary_set_uint64(v5, "kWRMFaceTimeReactionType", a3->var2);
    xpc_dictionary_set_uint64(v5, "kWRMFaceTimeTimeDuration", a3->var3);
    [(WRMClient *)self sendStatusUpdateInfoFaceTimeCalling:v5];
    xpc_release(v5);
  }
}

- (void)dumpReport:(id)a3
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  xpc_object_t v5 = (unsigned char *)MEMORY[0x1E4F47A40];
  xpc_object_t v6 = (NSObject **)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 8)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    __int16 v8 = *v6;
    uint64_t v9 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v142 = 136315650;
        uint64_t v143 = v7;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 371;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient: New report:", (uint8_t *)&v142, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]4();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    int v11 = *v6;
    __int16 v12 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_CallID");
        int v142 = 136315906;
        uint64_t v143 = v10;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 372;
        __int16 v148 = 2048;
        uint64_t v149 = uint64;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CallID: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]3();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *v6;
    xpc_object_t v16 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_Timestamp");
        int v142 = 136315906;
        uint64_t v143 = v14;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 373;
        __int16 v148 = 2048;
        uint64_t v149 = v17;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_Timestamp: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]2();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *v6;
    xpc_object_t v20 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TotalPlaybacks");
        int v142 = 136315906;
        uint64_t v143 = v18;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 374;
        __int16 v148 = 2048;
        uint64_t v149 = v21;
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalPlaybacks: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]1();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *v6;
    v24 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_PlaybacksInSpeech");
        int v142 = 136315906;
        uint64_t v143 = v22;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 375;
        __int16 v148 = 2048;
        uint64_t v149 = v25;
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_PlaybacksInSpeech: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]0();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *v6;
    v28 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TotalErasures");
        int v142 = 136315906;
        uint64_t v143 = v26;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 376;
        __int16 v148 = 2048;
        uint64_t v149 = v29;
        _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalErasures: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]9();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    uint64_t v31 = *v6;
    v32 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_ErasuresInSpeech");
        int v142 = 136315906;
        uint64_t v143 = v30;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 377;
        __int16 v148 = 2048;
        uint64_t v149 = v33;
        _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_ErasuresInSpeech: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]8();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *v6;
    v36 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_ErasuresInSilence");
        int v142 = 136315906;
        uint64_t v143 = v34;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 378;
        __int16 v148 = 2048;
        uint64_t v149 = v37;
        _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_ErasuresInSilence: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]7();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    v39 = *v6;
    v40 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = xpc_dictionary_get_uint64(a3, "VidErasure");
        int v142 = 136315906;
        uint64_t v143 = v38;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 379;
        __int16 v148 = 2048;
        uint64_t v149 = v41;
        _os_log_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_ErasuresInVideo: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]6();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v42 = VRTraceErrorLogLevelToCSTR();
    v43 = *v6;
    v44 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TotalPacketsReceived");
        int v142 = 136315906;
        uint64_t v143 = v42;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 380;
        __int16 v148 = 2048;
        uint64_t v149 = v45;
        _os_log_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalPacketsReceived: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]5();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v46 = VRTraceErrorLogLevelToCSTR();
    v47 = *v6;
    v48 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v49 = xpc_dictionary_get_uint64(a3, "PriVidRxCnt");
        int v142 = 136315906;
        uint64_t v143 = v46;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 381;
        __int16 v148 = 2048;
        uint64_t v149 = v49;
        _os_log_impl(&dword_1E1EA4000, v47, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_PrimaryVideoPacketReceivedCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]4();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v50 = VRTraceErrorLogLevelToCSTR();
    v51 = *v6;
    v52 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v53 = xpc_dictionary_get_uint64(a3, "PriAudRxCnt");
        int v142 = 136315906;
        uint64_t v143 = v50;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 382;
        __int16 v148 = 2048;
        uint64_t v149 = v53;
        _os_log_impl(&dword_1E1EA4000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_PrimaryAudioPacketReceivedCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]3();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v54 = VRTraceErrorLogLevelToCSTR();
    v55 = *v6;
    v56 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v57 = xpc_dictionary_get_uint64(a3, "TotVidRxCnt");
        int v142 = 136315906;
        uint64_t v143 = v54;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 383;
        __int16 v148 = 2048;
        uint64_t v149 = v57;
        _os_log_impl(&dword_1E1EA4000, v55, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tWRMAVConferencePeriodicReport_TotalVideoPacketReceivedCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]2();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v58 = VRTraceErrorLogLevelToCSTR();
    v59 = *v6;
    v60 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v61 = xpc_dictionary_get_uint64(a3, "TotAudRxCnt");
        int v142 = 136315906;
        uint64_t v143 = v58;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 384;
        __int16 v148 = 2048;
        uint64_t v149 = v61;
        _os_log_impl(&dword_1E1EA4000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalAudioPacketReceivedCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]1();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v62 = VRTraceErrorLogLevelToCSTR();
    v63 = *v6;
    v64 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v65 = xpc_dictionary_get_uint64(a3, "TotVidRxExpCnt");
        int v142 = 136315906;
        uint64_t v143 = v62;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 385;
        __int16 v148 = 2048;
        uint64_t v149 = v65;
        _os_log_impl(&dword_1E1EA4000, v63, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalVideoPacketExpectedReceivedCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]0();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v66 = VRTraceErrorLogLevelToCSTR();
    v67 = *v6;
    v68 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v69 = xpc_dictionary_get_uint64(a3, "TotAudRxExpCnt");
        int v142 = 136315906;
        uint64_t v143 = v66;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 386;
        __int16 v148 = 2048;
        uint64_t v149 = v69;
        _os_log_impl(&dword_1E1EA4000, v67, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalAudioPacketExpectedReceivedCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]9();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v70 = VRTraceErrorLogLevelToCSTR();
    v71 = *v6;
    v72 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v73 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_SpeechPacketsReceived");
        int v142 = 136315906;
        uint64_t v143 = v70;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 387;
        __int16 v148 = 2048;
        uint64_t v149 = v73;
        _os_log_impl(&dword_1E1EA4000, v71, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_SpeechPacketsReceived: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]8();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v74 = VRTraceErrorLogLevelToCSTR();
    v75 = *v6;
    v76 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v77 = xpc_dictionary_get_uint64(a3, "kWRMMAVConferencePeriodicReport_SIDPacketsReceived");
        int v142 = 136315906;
        uint64_t v143 = v74;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 388;
        __int16 v148 = 2048;
        uint64_t v149 = v77;
        _os_log_impl(&dword_1E1EA4000, v75, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMMAVConferencePeriodicReport_SIDPacketsReceived: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]7();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v78 = VRTraceErrorLogLevelToCSTR();
    v79 = *v6;
    v80 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v81 = xpc_dictionary_get_uint64(a3, "kWRMMAVConferencPeriodicReport_RTT");
        int v142 = 136315906;
        uint64_t v143 = v78;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 389;
        __int16 v148 = 2048;
        uint64_t v149 = v81;
        _os_log_impl(&dword_1E1EA4000, v79, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMMAVConferencPeriodicReport_RTT: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]6();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v82 = VRTraceErrorLogLevelToCSTR();
    v83 = *v6;
    v84 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v85 = xpc_dictionary_get_uint64(a3, "kWRMMAVConferencePeriodicReport_CountSinceRTTupdated");
        int v142 = 136315906;
        uint64_t v143 = v82;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 390;
        __int16 v148 = 2048;
        uint64_t v149 = v85;
        _os_log_impl(&dword_1E1EA4000, v83, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMMAVConferencePeriodicReport_CountSinceRTTupdated: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]5();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v86 = VRTraceErrorLogLevelToCSTR();
    v87 = *v6;
    v88 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v89 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TxPacketsCount");
        int v142 = 136315906;
        uint64_t v143 = v86;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 391;
        __int16 v148 = 2048;
        uint64_t v149 = v89;
        _os_log_impl(&dword_1E1EA4000, v87, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TxPacketsCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]4();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v90 = VRTraceErrorLogLevelToCSTR();
    v91 = *v6;
    v92 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v93 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TxPacketLoss");
        int v142 = 136315906;
        uint64_t v143 = v90;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 392;
        __int16 v148 = 2048;
        uint64_t v149 = v93;
        _os_log_impl(&dword_1E1EA4000, v91, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TxPacketLoss: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]3();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v94 = VRTraceErrorLogLevelToCSTR();
    v95 = *v6;
    v96 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v97 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_CountSinceTxPacketLossReported");
        int v142 = 136315906;
        uint64_t v143 = v94;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 393;
        __int16 v148 = 2048;
        uint64_t v149 = v97;
        _os_log_impl(&dword_1E1EA4000, v95, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CountSinceTxPacketLossReported: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]2();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v98 = VRTraceErrorLogLevelToCSTR();
    v99 = *v6;
    v100 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v101 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_RxJitter");
        int v142 = 136315906;
        uint64_t v143 = v98;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 394;
        __int16 v148 = 2048;
        uint64_t v149 = v101;
        _os_log_impl(&dword_1E1EA4000, v99, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_RxJitter: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]1();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v102 = VRTraceErrorLogLevelToCSTR();
    v103 = *v6;
    v104 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v105 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TxJitter");
        int v142 = 136315906;
        uint64_t v143 = v102;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 395;
        __int16 v148 = 2048;
        uint64_t v149 = v105;
        _os_log_impl(&dword_1E1EA4000, v103, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TxJitter: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]0();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v106 = VRTraceErrorLogLevelToCSTR();
    v107 = *v6;
    v108 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v109 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_CountSinceTxJitterUpdated");
        int v142 = 136315906;
        uint64_t v143 = v106;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 396;
        __int16 v148 = 2048;
        uint64_t v149 = v109;
        _os_log_impl(&dword_1E1EA4000, v107, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CountSinceTxJitterUpdated: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.9();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v110 = VRTraceErrorLogLevelToCSTR();
    v111 = *v6;
    v112 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v113 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize");
        int v142 = 136315906;
        uint64_t v143 = v110;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 397;
        __int16 v148 = 2048;
        uint64_t v149 = v113;
        _os_log_impl(&dword_1E1EA4000, v111, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.8();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v114 = VRTraceErrorLogLevelToCSTR();
    v115 = *v6;
    v116 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v117 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TargetJitterQueueSize");
        int v142 = 136315906;
        uint64_t v143 = v114;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 398;
        __int16 v148 = 2048;
        uint64_t v149 = v117;
        _os_log_impl(&dword_1E1EA4000, v115, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TargetJitterQueueSize: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.7();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v118 = VRTraceErrorLogLevelToCSTR();
    v119 = *v6;
    v120 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v121 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_CallType");
        int v142 = 136315906;
        uint64_t v143 = v118;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 399;
        __int16 v148 = 2048;
        uint64_t v149 = v121;
        _os_log_impl(&dword_1E1EA4000, v119, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CallType: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.6();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v122 = VRTraceErrorLogLevelToCSTR();
    v123 = *v6;
    v124 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v125 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_BWEstimation");
        int v142 = 136315906;
        uint64_t v143 = v122;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 400;
        __int16 v148 = 2048;
        uint64_t v149 = v125;
        _os_log_impl(&dword_1E1EA4000, v123, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_BWEstimation: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.5();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v126 = VRTraceErrorLogLevelToCSTR();
    v127 = *v6;
    v128 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v129 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TargetBitRate");
        int v142 = 136315906;
        uint64_t v143 = v126;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 401;
        __int16 v148 = 2048;
        uint64_t v149 = v129;
        _os_log_impl(&dword_1E1EA4000, v127, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TargetBitRate: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.4();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v130 = VRTraceErrorLogLevelToCSTR();
    v131 = *v6;
    v132 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v133 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_AdaptationPacketLoss");
        int v142 = 136315906;
        uint64_t v143 = v130;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 402;
        __int16 v148 = 2048;
        uint64_t v149 = v133;
        _os_log_impl(&dword_1E1EA4000, v131, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_AdaptationPacketLoss: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v134 = VRTraceErrorLogLevelToCSTR();
    v135 = *v6;
    v136 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v137 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_OneWayRelativeDelay");
        int v142 = 136315906;
        uint64_t v143 = v134;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 403;
        __int16 v148 = 2048;
        uint64_t v149 = v137;
        _os_log_impl(&dword_1E1EA4000, v135, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_OneWayRelativeDelay: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v138 = VRTraceErrorLogLevelToCSTR();
    v139 = *v6;
    v140 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v141 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_LinkType");
        int v142 = 136315906;
        uint64_t v143 = v138;
        __int16 v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        __int16 v146 = 1024;
        int v147 = 404;
        __int16 v148 = 2048;
        uint64_t v149 = v141;
        _os_log_impl(&dword_1E1EA4000, v139, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_LinkType: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:]();
    }
  }
}

- (void)sendReport:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)keys = xmmword_1E6DB8428;
  xpc_object_t v5 = xpc_uint64_create(0xCAuLL);
  values[0] = v5;
  values[1] = a3;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__WRMClient_sendReport___block_invoke;
  block[3] = &unk_1E6DB43D8;
  block[4] = self;
  void block[5] = a3;
  void block[6] = v6;
  dispatch_async(connectionQueue, block);
  xpc_release(v5);
  xpc_release(v6);
}

void __24__WRMClient_sendReport___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2[1])
  {
    [v2 dumpReport:a1[5]];
    uint64_t v3 = *(_xpc_connection_s **)(a1[4] + 8);
    xpc_object_t v4 = (void *)a1[6];
    xpc_connection_send_message(v3, v4);
  }
}

- (void)reportMetricsWifiCalling:(id *)a3
{
  if (self->_connection)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CallID", a3->var21);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_Timestamp", a3->var0);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TotalPlaybacks", a3->var1);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_PlaybacksInSpeech", a3->var2);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TotalErasures", a3->var6);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_ErasuresInSpeech", a3->var8);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_ErasuresInSilence", a3->var7);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TotalPacketsReceived", a3->var3);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_SpeechPacketsReceived", a3->var5);
    xpc_dictionary_set_uint64(v5, "kWRMMAVConferencePeriodicReport_SIDPacketsReceived", a3->var4);
    xpc_dictionary_set_uint64(v5, "kWRMMAVConferencPeriodicReport_RTT", a3->var17);
    xpc_dictionary_set_uint64(v5, "kWRMMAVConferencePeriodicReport_CountSinceRTTupdated", a3->var18);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TxPacketsCount", a3->var14);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TxPacketLoss", a3->var12);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CountSinceTxPacketLossReported", a3->var13);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_RxJitter", a3->var15);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TxJitter", a3->var10);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CountSinceTxJitterUpdated", a3->var16);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize", a3->var19);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TargetJitterQueueSize", a3->var20);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_LinkType", a3->var27);
    [(WRMClient *)self sendReport:v5];
    xpc_release(v5);
  }
}

- (void)reportImmediateMetric:(int)a3 value:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self->_metricsConfig.reportImmediateMetricsEnabled)
  {
    if (a3)
    {
      if (a3 != 1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          uint64_t v22 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v25 = v21;
            __int16 v26 = 2080;
            v27 = "-[WRMClient reportImmediateMetric:value:]";
            __int16 v28 = 1024;
            int v29 = 478;
            __int16 v30 = 1024;
            *(_DWORD *)uint64_t v31 = a3;
            *(_WORD *)&v31[4] = 2048;
            *(void *)&v31[6] = a4;
            _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d WRMClient: Immediate reporting not supported for metric type: %d: %llu", buf, 0x2Cu);
          }
        }
        return;
      }
      uint64_t v7 = "IsMedStall";
    }
    else
    {
      uint64_t v7 = "AnyPoorCon";
    }
    xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v14, v7, a4);
    *(_OWORD *)keys = xmmword_1E6DB8428;
    xpc_object_t v15 = xpc_uint64_create(0xC9uLL);
    values[0] = v15;
    values[1] = v14;
    xpc_object_t v16 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    connectionQueue = self->_connectionQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __41__WRMClient_reportImmediateMetric_value___block_invoke;
    v23[3] = &unk_1E6DB3E40;
    v23[4] = self;
    xpc_object_t v23[5] = v16;
    dispatch_async(connectionQueue, v23);
    xpc_release(v15);
    xpc_release(v16);
    xpc_release(v14);
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return;
    }
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E4F47A50];
    xpc_object_t v20 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v18;
      __int16 v26 = 2080;
      v27 = "-[WRMClient reportImmediateMetric:value:]";
      __int16 v28 = 1024;
      int v29 = 500;
      __int16 v30 = 2080;
      *(void *)uint64_t v31 = v7;
      *(_WORD *)&v31[8] = 2048;
      *(void *)&v31[10] = a4;
      uint64_t v11 = " [%s] %s:%d WRMClient: Immediate metric reported:%s: %llu";
      __int16 v12 = v19;
      uint32_t v13 = 48;
      goto LABEL_14;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v18;
      __int16 v26 = 2080;
      v27 = "-[WRMClient reportImmediateMetric:value:]";
      __int16 v28 = 1024;
      int v29 = 500;
      __int16 v30 = 2080;
      *(void *)uint64_t v31 = v7;
      *(_WORD *)&v31[8] = 2048;
      *(void *)&v31[10] = a4;
      _os_log_debug_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEBUG, " [%s] %s:%d WRMClient: Immediate metric reported:%s: %llu", buf, 0x30u);
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = v8;
      __int16 v26 = 2080;
      v27 = "-[WRMClient reportImmediateMetric:value:]";
      __int16 v28 = 1024;
      int v29 = 466;
      uint64_t v11 = " [%s] %s:%d Not reporting WRM metrics as directed by the storebag settings";
      __int16 v12 = v9;
      uint32_t v13 = 28;
LABEL_14:
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      return;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[WRMClient reportImmediateMetric:value:]();
    }
  }
}

void __41__WRMClient_reportImmediateMetric_value___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8)) {
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), *(xpc_object_t *)(a1 + 40));
  }
}

- (void)reportMetricsFaceTimeCalling:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (self->_connection)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CallID", a3->var21);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_Timestamp", a3->var0);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TotalPlaybacks", a3->var1);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_PlaybacksInSpeech", a3->var2);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TotalErasures", a3->var6);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_ErasuresInSpeech", a3->var8);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_ErasuresInSilence", a3->var7);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TotalPacketsReceived", a3->var3);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_SpeechPacketsReceived", a3->var5);
    xpc_dictionary_set_uint64(v5, "kWRMMAVConferencePeriodicReport_SIDPacketsReceived", a3->var4);
    xpc_dictionary_set_uint64(v5, "kWRMMAVConferencPeriodicReport_RTT", a3->var17);
    xpc_dictionary_set_uint64(v5, "kWRMMAVConferencePeriodicReport_CountSinceRTTupdated", a3->var18);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TxPacketsCount", a3->var14);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TxPacketLoss", a3->var12);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CountSinceTxPacketLossReported", a3->var13);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_RxJitter", a3->var15);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TxJitter", a3->var10);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CountSinceTxJitterUpdated", a3->var16);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize", a3->var19);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TargetJitterQueueSize", a3->var20);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CallType", a3->var22);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_BWEstimation", a3->var23);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TargetBitRate", a3->var24);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_AdaptationPacketLoss", a3->var26);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_OneWayRelativeDelay", a3->var25);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_LinkType", a3->var27);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_VideoPause", a3->var28);
    if (self->_metricsConfig.reportRtpErasureMetricsEnabled)
    {
      uint64_t var29 = a3->var29;
      uint64_t var30 = a3->var30;
      uint64_t var31 = a3->var31;
      uint64_t var32 = a3->var32;
      uint64_t var33 = a3->var33;
      uint64_t var34 = a3->var34;
    }
    else
    {
      uint64_t var33 = 10;
      uint64_t var31 = 10;
      uint64_t var29 = 10;
      uint64_t var30 = 10;
      uint64_t var32 = 10;
      uint64_t var34 = 10;
    }
    uint64_t v24 = var29;
    xpc_dictionary_set_uint64(v5, "PriVidRxCnt", var29);
    xpc_dictionary_set_uint64(v5, "PriAudRxCnt", var30);
    xpc_dictionary_set_uint64(v5, "TotVidRxCnt", var31);
    xpc_dictionary_set_uint64(v5, "TotAudRxCnt", var32);
    xpc_dictionary_set_uint64(v5, "TotVidRxExpCnt", var33);
    xpc_dictionary_set_uint64(v5, "TotAudRxExpCnt", var34);
    if (self->_mediaControlInfoVersion == 2)
    {
      if (self->_metricsConfig.reportRtpErasureMetricsEnabled) {
        uint64_t var9 = a3->var9;
      }
      else {
        uint64_t var9 = 0;
      }
      xpc_dictionary_set_uint64(v5, "VidErasure", var9);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      xpc_object_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t var21 = a3->var21;
        unint64_t var22 = a3->var22;
        unint64_t var27 = a3->var27;
        unint64_t var28 = a3->var28;
        unint64_t var1 = a3->var1;
        unint64_t var6 = a3->var6;
        unint64_t var8 = a3->var8;
        unint64_t var4 = a3->var4;
        unint64_t var19 = a3->var19;
        *(_DWORD *)buf = 136319490;
        uint64_t v26 = v13;
        __int16 v27 = 2080;
        __int16 v28 = "-[WRMClient reportMetricsFaceTimeCalling:]";
        __int16 v29 = 1024;
        int v30 = 559;
        __int16 v31 = 2048;
        unint64_t v32 = var21;
        __int16 v33 = 2048;
        unint64_t v34 = var22;
        __int16 v35 = 2048;
        unint64_t v36 = var27;
        __int16 v37 = 2048;
        unint64_t v38 = var28;
        __int16 v39 = 2048;
        unint64_t v40 = var1;
        __int16 v41 = 2048;
        unint64_t v42 = var6;
        __int16 v43 = 2048;
        unint64_t v44 = var8;
        __int16 v45 = 2048;
        unint64_t v46 = var4;
        __int16 v47 = 2048;
        unint64_t v48 = var19;
        __int16 v49 = 2048;
        uint64_t v50 = v24;
        __int16 v51 = 2048;
        uint64_t v52 = var30;
        __int16 v53 = 2048;
        uint64_t v54 = var31;
        __int16 v55 = 2048;
        uint64_t v56 = var32;
        __int16 v57 = 2048;
        uint64_t v58 = var33;
        __int16 v59 = 2048;
        uint64_t v60 = var34;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRM reporting metrics callID=%llu callType=%llu linkType=%llu videoPause=%llu playBackCount=%llu erasureCount=%llu erasureCountSpeech=%llu packetsReceivedSilence=%llu nominalJitterBufferDelay=%llu primaryVideoPacketsReceived=%llu primaryAudioPacketsReceived=%llu totalVideoPacketsReceived=%llu totalAudioPacketsReceived=%llu totalVideoPacketsExpected=%llu totalAudioPacketsExpected=%llu", buf, 0xB2u);
      }
    }
    [(WRMClient *)self sendReport:v5];
    xpc_release(v5);
  }
}

- (void)setConfiguration:(id *)a3
{
  xpc_object_t v4 = (void *)MEMORY[0x1E4E56580](&self->_wrmClientDelegate, a2);
  [v4 setWRMMetricConfig:a3];
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)processWRMCoexMetrics:(id)a3 isAlertedMode:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v4), @"WRMAlertedMode");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_rssiThreshold), @"WRMwRSSIThreshold");
    if (xpc_dictionary_get_value(a3, "kwRSSI")) {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kwRSSI")), @"WRMwRSSI");
    }
    if (xpc_dictionary_get_value(a3, "kwSNR")) {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kwSNR")), @"WRMwSNR");
    }
    if (xpc_dictionary_get_value(a3, "kwCCA")) {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kwCCA")), @"WRMwCCA");
    }
    if (xpc_dictionary_get_value(a3, "kwPER")) {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kwPER")), @"WRMwPacketLoss");
    }
    if (xpc_dictionary_get_value(a3, "kcSigStrength")) {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kcSigStrength")), @"WRMcSigStrength");
    }
    if (xpc_dictionary_get_value(a3, "kcSignalBar")) {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kcSignalBar")), @"WRMcSignalBar");
    }
    if (xpc_dictionary_get_value(a3, "kcServingCellType")) {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kcServingCellType")), @"WRMcServingCellType");
    }
    if ([v7 count])
    {
      uint64_t v8 = (void *)MEMORY[0x1E4E56580](&self->_wrmClientDelegate);
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"WRMCoexIsLocal"];
      [v8 setWRMCoexMetrics:v7];
      if (v8)
      {
        CFRelease(v8);
      }
    }
  }
}

- (void)processNotificationList:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  memset(v13, 0, sizeof(v13));
  int count = xpc_array_get_count(a3);
  if (count >= 1)
  {
    size_t v6 = 0;
    p_wrmClientDelegate = &self->_wrmClientDelegate;
    uint64_t v8 = count;
    do
    {
      xpc_object_t value = xpc_array_get_value(a3, v6);
      LODWORD(v12) = xpc_dictionary_get_uint64(value, "kWRMApplicationType");
      DWORD1(v12) = xpc_dictionary_get_uint64(value, "kWRMLinkType");
      *((void *)&v12 + 1) = xpc_dictionary_get_uint64(value, "kWRMLinkTypeChangeReasonCode");
      string = xpc_dictionary_get_string(value, "kWRMLinkTypeChangeReasonString");
      strncpy((char *)v13, string, 0x80uLL);
      HIBYTE(v14) = 0;
      *((void *)&v15 + 1) = xpc_dictionary_get_uint64(value, "kWRMCurrentLinkMovBandwidthEstimateMax");
      *(void *)&long long v15 = xpc_dictionary_get_uint64(value, "kWRMCurrentLinkMovBandwidthEstimateMin");
      uint64_t v11 = (void *)MEMORY[0x1E4E56580](p_wrmClientDelegate);
      [v11 setWRMNotification:&v12];
      if (v11) {
        CFRelease(v11);
      }
      ++v6;
    }
    while (v8 != v6);
  }
}

- (void)setPreWarmState:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_metricsConfig.allowPreWarmCellEnabled)
  {
    BOOL v4 = a3;
    xpc_object_t v5 = (void *)MEMORY[0x1E4E56580](&self->_wrmClientDelegate, a2);
    [v5 setPreWarmState:v4];
    if (v5) {
      CFRelease(v5);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316162;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        uint64_t v16 = "-[WRMClient setPreWarmState:]";
        __int16 v17 = 1024;
        int v18 = 652;
        __int16 v19 = 2048;
        xpc_object_t v20 = self;
        __int16 v21 = 1024;
        BOOL v22 = v4;
        uint64_t v8 = " [%s] %s:%d WRMClient(%p): Get PreWarmState %d from iRAT";
        uint64_t v9 = v7;
        uint32_t v10 = 44;
LABEL_10:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    long long v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315906;
      uint64_t v14 = v11;
      __int16 v15 = 2080;
      uint64_t v16 = "-[WRMClient setPreWarmState:]";
      __int16 v17 = 1024;
      int v18 = 645;
      __int16 v19 = 2048;
      xpc_object_t v20 = self;
      uint64_t v8 = " [%s] %s:%d WRMClient(%p): Ignoring prewarm signal from iRAT as directed by storebagsettings";
      uint64_t v9 = v12;
      uint32_t v10 = 38;
      goto LABEL_10;
    }
  }
}

- (void)setRSSIThresholdEnabled:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3) {
    uint64_t v4 = +[GKSConnectivitySettings getWRMRSSIThresholdValue:4294967216];
  }
  else {
    uint64_t v4 = -80;
  }
  self->_int rssiThreshold = +[VCDefaults integerValueForKey:@"wrmRSSIThreshold" defaultValue:v4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int rssiThreshold = self->_rssiThreshold;
      int v8 = 136316162;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      uint64_t v11 = "-[WRMClient setRSSIThresholdEnabled:]";
      __int16 v12 = 1024;
      int v13 = 665;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 1024;
      int v17 = rssiThreshold;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient(%p): Picked WRM RSSI Threshold value %d", (uint8_t *)&v8, 0x2Cu);
    }
  }
}

- (void)updateMetricsConfig:(id)a3
{
  self->_metricsConfig = ($3F05CAD367707F359A92B6E46C9E9A87)a3;
}

- (int)mediaControlInfoVersion
{
  return self->_mediaControlInfoVersion;
}

- (void)setMediaControlInfoVersion:(int)a3
{
  self->_mediaControlInfoVersion = a3;
}

- (void)dumpReport:.cold.1()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_LinkType");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_LinkType: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.2()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_OneWayRelativeDelay");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_OneWayRelativeDelay: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.3()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_AdaptationPacketLoss");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_AdaptationPacketLoss: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.4()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_TargetBitRate");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TargetBitRate: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.5()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_BWEstimation");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_BWEstimation: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.6()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_CallType");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CallType: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.7()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_TargetJitterQueueSize");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TargetJitterQueueSize: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.8()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.9()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_CountSinceTxJitterUpdated");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CountSinceTxJitterUpdated: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.10()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_TxJitter");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TxJitter: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.11()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_RxJitter");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_RxJitter: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.12()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_CountSinceTxPacketLossReported");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CountSinceTxPacketLossReported: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.13()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_TxPacketLoss");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TxPacketLoss: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.14()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_TxPacketsCount");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TxPacketsCount: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.15()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMMAVConferencePeriodicReport_CountSinceRTTupdated");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMMAVConferencePeriodicReport_CountSinceRTTupdated: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.16()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMMAVConferencPeriodicReport_RTT");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMMAVConferencPeriodicReport_RTT: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.17()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMMAVConferencePeriodicReport_SIDPacketsReceived");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMMAVConferencePeriodicReport_SIDPacketsReceived: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.18()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_SpeechPacketsReceived");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_SpeechPacketsReceived: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.19()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "TotAudRxExpCnt");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalAudioPacketExpectedReceivedCount: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.20()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "TotVidRxExpCnt");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalVideoPacketExpectedReceivedCount: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.21()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "TotAudRxCnt");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalAudioPacketReceivedCount: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.22()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "TotVidRxCnt");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tWRMAVConferencePeriodicReport_TotalVideoPacketReceivedCount: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.23()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "PriAudRxCnt");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_PrimaryAudioPacketReceivedCount: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.24()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "PriVidRxCnt");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_PrimaryVideoPacketReceivedCount: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.25()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_TotalPacketsReceived");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalPacketsReceived: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.26()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "VidErasure");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_ErasuresInVideo: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.27()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_ErasuresInSilence");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_ErasuresInSilence: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.28()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_ErasuresInSpeech");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_ErasuresInSpeech: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.29()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_TotalErasures");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalErasures: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.30()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_PlaybacksInSpeech");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_PlaybacksInSpeech: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.31()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_TotalPlaybacks");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalPlaybacks: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.32()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_Timestamp");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_Timestamp: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.33()
{
  OUTLINED_FUNCTION_4_16();
  xpc_dictionary_get_uint64(v0, "kWRMAVConferencePeriodicReport_CallID");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CallID: %llu", v3, v4, v5, v6, v7);
}

- (void)dumpReport:.cold.34()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 371;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d WRMClient: New report:", v1, 0x1Cu);
}

- (void)reportImmediateMetric:value:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 466;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Not reporting WRM metrics as directed by the storebag settings", v1, 0x1Cu);
}

@end