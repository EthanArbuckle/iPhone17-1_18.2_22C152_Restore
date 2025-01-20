@interface VCTransportSession
+ (int)vtpPacketTypeForStreamType:(unsigned int)a3;
+ (unsigned)trafficClassForStreamType:(unsigned int)a3;
- (BOOL)getConnectionSetupData:(id *)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)isCallActive;
- (BOOL)isHandoverSupported;
- (BOOL)isIPv6;
- (BOOL)isRemoteOSPreLion;
- (BOOL)requiresWiFi;
- (BOOL)shouldIgnoreConnectionRefusedError;
- (BOOL)shouldSetupNWMonitor;
- (BOOL)useCompressedConnectionData;
- (NSObject)connectionSetupPiggybackBlob;
- (OS_dispatch_queue)nwMonitorEventHandlerQueue;
- (TimingCollection)perfTimings;
- (VCConnectionManager)connectionManager;
- (VCConnectionProtocol)registeredConnection;
- (VCTransportSession)initWithNotificationQueue:(id)a3 reportingAgent:(opaqueRTCReporting *)a4;
- (VCTransportSession)initWithNotificationQueue:(id)a3 reportingAgent:(opaqueRTCReporting *)a4 notificationHandler:(void *)a5 eventHandler:(void *)a6 handlerQueue:(id)a7 context:(void *)a8;
- (id)eventHandler;
- (int)createTransportStream:(OpaqueVCTransportStream *)a3 withType:(unsigned int)a4 options:(id)a5;
- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4;
- (int)deregisterNotificationForTransportStream:(OpaqueVCTransportStream *)a3;
- (int)detailedErrorCode;
- (int)flushBasebandQueueForConnection:(id)a3 payloadInfoList:(id)a4;
- (int)flushBasebandQueueWithPayloads:(id)a3 flushCount:(unsigned int *)a4;
- (int)getSignalStrengthBars:(int *)a3 displayBars:(int *)a4 maxDisplayBars:(int *)a5;
- (int)networkInterfaceType;
- (int)registerBasebandNotificationsForConnection:(id)a3;
- (int)updateBasebandForConnection:(id)a3;
- (int)updateQualityIndicator:(int)a3 isIPv6:(BOOL)a4;
- (tagVCNWConnectionMonitor)createNWMonitor;
- (tagVCNWConnectionMonitor)nwMonitor;
- (unsigned)basebandNotificationRegistrationToken;
- (unsigned)connectionSetupRTTEstimate;
- (unsigned)networkMTU;
- (void)addNetworkAssertionWithInterfaceType:(int)a3;
- (void)callEventHandlerWithEvent:(unsigned int)a3 info:(id)a4;
- (void)cleanupBaseband;
- (void)dealloc;
- (void)deregisterBasebandNotifications;
- (void)destroyNWMonitor;
- (void)handleTransportStreamDeactivated:(OpaqueVCTransportStream *)a3;
- (void)removeNetworkAssertion;
- (void)setCallActive:(BOOL)a3;
- (void)setConnectionSelectionVersionWithLocalFrameworkVersion:(id)a3 remoteFrameworkVersion:(id)a4;
- (void)setConnectionSetupPiggybackBlob:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setPerfTimings:(id)a3;
- (void)setRegisteredConnection:(id)a3;
- (void)setRequiresWiFi:(BOOL)a3;
- (void)setShouldIgnoreConnectionRefusedError:(BOOL)a3;
- (void)setShouldSetupNWMonitor:(BOOL)a3;
- (void)setUseCompressedConnectionData:(BOOL)a3;
- (void)setupNWMonitor;
- (void)setupNWMonitorNotificationHandler;
- (void)setupNWMonitorPacketEventHandler;
- (void)start;
- (void)stop;
@end

@implementation VCTransportSession

- (VCTransportSession)initWithNotificationQueue:(id)a3 reportingAgent:(opaqueRTCReporting *)a4
{
  return [(VCTransportSession *)self initWithNotificationQueue:a3 reportingAgent:a4 notificationHandler:0 eventHandler:0 handlerQueue:0 context:0];
}

- (VCTransportSession)initWithNotificationQueue:(id)a3 reportingAgent:(opaqueRTCReporting *)a4 notificationHandler:(void *)a5 eventHandler:(void *)a6 handlerQueue:(id)a7 context:(void *)a8
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VCTransportSession;
  v14 = [(VCTransportSession *)&v19 init];
  if (v14)
  {
    +[VCVTPWrapper startVTP];
    v14->_isCallActive = 1;
    if (a4) {
      v15 = (opaqueRTCReporting *)CFRetain(a4);
    }
    else {
      v15 = 0;
    }
    v14->_reportingAgent = v15;
    if (!v14->_basebandNotificationRegistrationToken)
    {
      do
      {
        unsigned int v16 = hwrandom();
        v14->_basebandNotificationRegistrationToken = v16;
      }
      while (!v16);
    }
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(58);
    v14->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.VideoConference.VCTransportSession.stateQueue", 0, CustomRootQueue);
    if (a3) {
      dispatch_retain((dispatch_object_t)a3);
    }
    else {
      a3 = dispatch_queue_create_with_target_V2("com.apple.VideoConference.VCTransportSession.notificationQueue", 0, CustomRootQueue);
    }
    v14->_notificationQueue = (OS_dispatch_queue *)a3;
    v14->_streams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pthread_mutex_init(&v14->_stateLock, 0);
    v14->_nwMonitorLock._os_unfair_lock_opaque = 0;
    v14->_notificationHandler = a5;
    v14->_packetEventHandler = a6;
    v14->_handlerContext = a8;
    if (a7)
    {
      v14->_handlerQueue = (OS_dispatch_queue *)a7;
      dispatch_retain((dispatch_object_t)a7);
    }
  }
  return v14;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  streams = self->_streams;
  uint64_t v4 = [(NSMutableArray *)streams countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(streams);
        }
        [(VCTransportSession *)self deregisterNotificationForTransportStream:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v5 = [(NSMutableArray *)streams countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v5);
  }

  reportingAgent = self->_reportingAgent;
  if (reportingAgent) {
    CFRelease(reportingAgent);
  }
  _Block_release(self->_eventHandler);
  notificationQueue = self->_notificationQueue;
  if (notificationQueue) {
    dispatch_release(notificationQueue);
  }
  stateQueue = self->_stateQueue;
  if (stateQueue) {
    dispatch_release(stateQueue);
  }

  [(VCTransportSession *)self destroyNWMonitor];
  handlerQueue = self->_handlerQueue;
  if (handlerQueue) {
    dispatch_release(handlerQueue);
  }
  pthread_mutex_destroy(&self->_stateLock);
  +[VCVTPWrapper stopVTP];
  v12.receiver = self;
  v12.super_class = (Class)VCTransportSession;
  [(VCTransportSession *)&v12 dealloc];
}

- (void)start
{
}

- (void)stop
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__VCTransportSession_stop__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __26__VCTransportSession_stop__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      v10 = "-[VCTransportSession stop]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 169;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopping transport session", buf, 0x1Cu);
    }
  }
  [*(id *)(a1 + 32) cleanupBaseband];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__VCTransportSession_stop__block_invoke_72;
  block[3] = &unk_1E6DB3DC8;
  block[4] = v4;
  dispatch_async(v5, block);
}

uint64_t __26__VCTransportSession_stop__block_invoke_72(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) eventHandler];
  if (result)
  {
    v3 = *(uint64_t (**)(void))([*(id *)(a1 + 32) eventHandler] + 16);
    return v3();
  }
  return result;
}

- (void)callEventHandlerWithEvent:(unsigned int)a3 info:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__VCTransportSession_callEventHandlerWithEvent_info___block_invoke;
  v5[3] = &unk_1E6DB3EE0;
  unsigned int v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(notificationQueue, v5);
}

void __53__VCTransportSession_callEventHandlerWithEvent_info___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) eventHandler])
  {
    uint64_t v2 = *(void (**)(void))([*(id *)(a1 + 32) eventHandler] + 16);
    v2();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(_DWORD *)(a1 + 48);
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCTransportSession callEventHandlerWithEvent:info:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 187;
      __int16 v12 = 1024;
      int v13 = v5;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Could not dispatch transportSessionEvent %d as eventHandler is nil", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (void)handleTransportStreamDeactivated:(OpaqueVCTransportStream *)a3
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  pthread_mutex_lock(&self->_stateLock);
  [(NSMutableArray *)self->_streams removeObject:a3];

  pthread_mutex_unlock(&self->_stateLock);
}

- (int)createTransportStream:(OpaqueVCTransportStream *)a3 withType:(unsigned int)a4 options:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v21 = -1;
  CFTypeRef cf = 0;
  if (!a3)
  {
    int v14 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSession createTransportStream:withType:options:](v17, v18);
      }
    }
    goto LABEL_17;
  }
  uint64_t v6 = *(void *)&a4;
  int v9 = -[VCTransportSession createVFD:forStreamType:](self, "createVFD:forStreamType:", &v21);
  if (v9 < 0)
  {
    int v14 = v9;
LABEL_17:
    CFDictionaryRef v13 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = +[VCTransportSession trafficClassForStreamType:v6];
  if (v10)
  {
    uint64_t v11 = v10;
    if (a5) {
      CFDictionaryRef v12 = (const __CFDictionary *)[a5 mutableCopy];
    }
    else {
      CFDictionaryRef v12 = (const __CFDictionary *)objc_opt_new();
    }
    CFDictionaryRef v13 = v12;
    -[__CFDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v11], @"TrafficClass");
    int v14 = VCTransportStreamVTPCreate((const __CFAllocator *)*MEMORY[0x1E4F1CF80], v21, v13, &cf);
    if ((v14 & 0x80000000) == 0)
    {
      unsigned int v21 = -1;
      CMNotificationCenterGetDefaultLocalCenter();
      int v15 = CMNotificationCenterAddListener();
      if (v15)
      {
        if (v15 >= 0) {
          int v19 = v15;
        }
        else {
          int v19 = -v15;
        }
        int v14 = v19 | 0xD02B0000;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTransportSession createTransportStream:withType:options:]();
          }
        }
      }
      else
      {
        pthread_mutex_lock(&self->_stateLock);
        [(NSMutableArray *)self->_streams addObject:cf];
        pthread_mutex_unlock(&self->_stateLock);
        *a3 = (OpaqueVCTransportStream *)cf;
        CFTypeRef cf = 0;
      }
    }
  }
  else
  {
    CFDictionaryRef v13 = 0;
    int v14 = -2144665599;
  }
LABEL_10:

  VCCloseVFDIfValid(v21);
  if (cf) {
    CFRelease(cf);
  }
  return v14;
}

- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4
{
}

- (int)deregisterNotificationForTransportStream:(OpaqueVCTransportStream *)a3
{
  CMNotificationCenterGetDefaultLocalCenter();
  int v4 = CMNotificationCenterRemoveListener();
  if (v4)
  {
    if (v4 >= 0) {
      int v14 = v4;
    }
    else {
      int v14 = -v4;
    }
    unsigned int v9 = v14 | 0xD02B0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSession deregisterNotificationForTransportStream:]();
      }
    }
  }
  else
  {
    uint64_t CMBaseObject = VCPacketFilterGetCMBaseObject(a3, v5);
    uint64_t v7 = *(void **)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      __int16 v8 = v7;
    }
    else {
      __int16 v8 = 0;
    }
    unsigned int v9 = -802016786;
    if (*v8 >= 2uLL)
    {
      uint64_t v10 = (uint64_t (*)(uint64_t))v8[8];
      if (v10)
      {
        int v11 = v10(CMBaseObject);
        if (v11 >= 0) {
          int v12 = v11;
        }
        else {
          int v12 = -v11;
        }
        if (!v11) {
          return 0;
        }
        unsigned int v9 = v12 | 0xD0320000;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSession deregisterNotificationForTransportStream:]();
      }
    }
  }
  return v9;
}

- (BOOL)isCallActive
{
  return self->_isCallActive;
}

- (void)setCallActive:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__VCTransportSession_setCallActive___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  BOOL v5 = a3;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

void __36__VCTransportSession_setCallActive___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 8))
  {
    *(unsigned char *)(v2 + 8) = v1;
    int v4 = *(unsigned __int8 *)(a1 + 40);
    BOOL v5 = *(uint64_t **)(a1 + 32);
    if (v4)
    {
      uint64_t v6 = (const void *)VCConnectionManager_CopyConnectionForQuality(v5[9], 1);
      [*(id *)(a1 + 32) updateBasebandForConnection:v6];
      if (v6)
      {
        CFRelease(v6);
      }
    }
    else
    {
      [v5 cleanupBaseband];
    }
  }
}

- (void)setConnectionSelectionVersionWithLocalFrameworkVersion:(id)a3 remoteFrameworkVersion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];

  self->_localFrameworkVersion = (NSString *)[a3 copy];
  self->_remoteFrameworkVersion = (NSString *)[a4 copy];
  [(VCConnectionManager *)self->_connectionManager setConnectionSelectionVersionWithLocalFrameworkVersion:a3 remoteFrameworkVersion:a4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    __int16 v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      localFrameworkVersion = self->_localFrameworkVersion;
      remoteFrameworkVersion = self->_remoteFrameworkVersion;
      int v11 = 136316162;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      int v14 = "-[VCTransportSession setConnectionSelectionVersionWithLocalFrameworkVersion:remoteFrameworkVersion:]";
      __int16 v15 = 1024;
      int v16 = 289;
      __int16 v17 = 2112;
      uint64_t v18 = localFrameworkVersion;
      __int16 v19 = 2112;
      uint64_t v20 = remoteFrameworkVersion;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTransportSession: Setting connection selection version: local='%@', remote='%@'", (uint8_t *)&v11, 0x30u);
    }
  }
}

- (int)updateBasebandForConnection:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v5 = VCConnection_ConnectionID((uint64_t)a3);
  registeredConnection = self->_registeredConnection;
  if (registeredConnection && VCConnection_ConnectionID((uint64_t)registeredConnection) == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      __int16 v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int basebandNotificationRegistrationToken = self->_basebandNotificationRegistrationToken;
        *(_DWORD *)buf = 136316418;
        uint64_t v14 = v7;
        __int16 v15 = 2080;
        int v16 = "-[VCTransportSession updateBasebandForConnection:]";
        __int16 v17 = 1024;
        int v18 = 296;
        __int16 v19 = 2048;
        uint64_t v20 = self;
        __int16 v21 = 1024;
        int v22 = v5;
        __int16 v23 = 1024;
        unsigned int v24 = basebandNotificationRegistrationToken;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTransportSession[%p]: Skip registering baseband notifications for the same connection with id %d, registrationToken %u", buf, 0x32u);
      }
    }
  }
  else
  {
    stateQueue = self->_stateQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__VCTransportSession_updateBasebandForConnection___block_invoke;
    v12[3] = &unk_1E6DB3E40;
    v12[4] = self;
    v12[5] = a3;
    dispatch_async(stateQueue, v12);
  }
  return 0;
}

void __50__VCTransportSession_updateBasebandForConnection___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) cleanupBaseband];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8) && VCConnection_IsLocalOnCellular(*(void *)(a1 + 40)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      uint64_t v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(const char **)(a1 + 32);
        int v4 = *(void **)(a1 + 40);
        if (v4) {
          uint64_t v6 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
        }
        else {
          uint64_t v6 = "<nil>";
        }
        int v7 = *(_DWORD *)(*(void *)(a1 + 32) + 12);
        int v14 = 136316418;
        uint64_t v15 = v2;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCTransportSession updateBasebandForConnection:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 303;
        __int16 v20 = 2048;
        __int16 v21 = v5;
        __int16 v22 = 2080;
        __int16 v23 = v6;
        __int16 v24 = 1024;
        int v25 = v7;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTransportSession[%p]: Registering for baseband notifications for connection %s, registrationToken %u", (uint8_t *)&v14, 0x36u);
      }
    }
    int v8 = [*(id *)(a1 + 32) registerBasebandNotificationsForConnection:*(void *)(a1 + 40)];
    if (v8 < 0)
    {
      int v9 = v8;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        int v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = *(void **)(a1 + 40);
          if (v12) {
            __int16 v13 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
          }
          else {
            __int16 v13 = "<nil>";
          }
          int v14 = 136316162;
          uint64_t v15 = v10;
          __int16 v16 = 2080;
          __int16 v17 = "-[VCTransportSession updateBasebandForConnection:]_block_invoke";
          __int16 v18 = 1024;
          int v19 = 309;
          __int16 v20 = 2080;
          __int16 v21 = v13;
          __int16 v22 = 1024;
          LODWORD(v23) = v9;
          _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Baseband notification registration for connection %s failed %x", (uint8_t *)&v14, 0x2Cu);
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) setRegisteredConnection:*(void *)(a1 + 40)];
    }
  }
}

- (void)cleanupBaseband
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_registeredConnection)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      int v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = VCConnection_ConnectionID((uint64_t)self->_registeredConnection);
        unsigned int basebandNotificationRegistrationToken = self->_basebandNotificationRegistrationToken;
        int v7 = 136316418;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        uint64_t v10 = "-[VCTransportSession cleanupBaseband]";
        __int16 v11 = 1024;
        int v12 = 319;
        __int16 v13 = 2048;
        int v14 = self;
        __int16 v15 = 1024;
        int v16 = v5;
        __int16 v17 = 1024;
        unsigned int v18 = basebandNotificationRegistrationToken;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTransportSession[%p]: Deregistering baseband notifications for connectionId %d, registrationToken %u", (uint8_t *)&v7, 0x32u);
      }
    }
    [(VCTransportSession *)self deregisterBasebandNotifications];
    [(VCTransportSession *)self setRegisteredConnection:0];
  }
}

- (int)registerBasebandNotificationsForConnection:(id)a3
{
}

- (void)deregisterBasebandNotifications
{
}

- (int)flushBasebandQueueWithPayloads:(id)a3 flushCount:(unsigned int *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x2020000000;
  int v17 = 0;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VCTransportSession_flushBasebandQueueWithPayloads_flushCount___block_invoke;
  block[3] = &unk_1E6DB8150;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v15;
  block[7] = &v11;
  dispatch_sync(stateQueue, block);
  if (a4) {
    *a4 = *((_DWORD *)v12 + 6);
  }
  if ((*(_DWORD *)(v16[0] + 24) & 0x80000000) != 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCTransportSession flushBasebandQueueWithPayloads:flushCount:](v6, (uint64_t)v16, v7);
    }
  }
  int v8 = *(_DWORD *)(v16[0] + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v8;
}

void __64__VCTransportSession_flushBasebandQueueWithPayloads_flushCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = (const void *)VCConnectionManager_CopyConnectionForQuality(*(void *)(*(void *)(a1 + 32) + 72), 1);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) flushBasebandQueueForConnection:v2 payloadInfoList:*(void *)(a1 + 40)];
  if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) & 0x80000000) == 0) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  uint64_t v3 = (const void *)VCConnectionManager_CopyConnectionForQuality(*(void *)(*(void *)(a1 + 32) + 72), 0);
  if (VCConnection_Equal((uint64_t)v3, (uint64_t)v2)) {
    goto LABEL_7;
  }
  int v4 = [*(id *)(a1 + 32) flushBasebandQueueForConnection:v3 payloadInfoList:*(void *)(a1 + 40)];
  if ((v4 & 0x80000000) == 0) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if ((*(_DWORD *)(v5 + 24) & 0x80000000) == 0)
  {
LABEL_7:
    if (!v2) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 24) = v4;
  if (v2) {
LABEL_8:
  }
    CFRelease(v2);
LABEL_9:
  if (v3)
  {
    CFRelease(v3);
  }
}

- (int)flushBasebandQueueForConnection:(id)a3 payloadInfoList:(id)a4
{
}

- (int)getSignalStrengthBars:(int *)a3 displayBars:(int *)a4 maxDisplayBars:(int *)a5
{
}

- (int)updateQualityIndicator:(int)a3 isIPv6:(BOOL)a4
{
}

- (int)detailedErrorCode
{
  return 1100;
}

- (BOOL)isHandoverSupported
{
  return 1;
}

- (BOOL)isRemoteOSPreLion
{
  return 0;
}

- (unsigned)connectionSetupRTTEstimate
{
  return 0;
}

- (BOOL)getConnectionSetupData:(id *)a3 withOptions:(id)a4 error:(id *)a5
{
  return 1;
}

+ (unsigned)trafficClassForStreamType:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 - 1 < 6) {
    return dword_1E25A04B0[a3 - 1];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    unsigned int result = 0;
    if (!v7) {
      return result;
    }
    int v8 = 136315906;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    uint64_t v11 = "+[VCTransportSession trafficClassForStreamType:]";
    __int16 v12 = 1024;
    int v13 = 438;
    __int16 v14 = 1024;
    unsigned int v15 = a3;
    _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid stream type %d", (uint8_t *)&v8, 0x22u);
  }
  return 0;
}

+ (int)vtpPacketTypeForStreamType:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 - 1 < 6) {
    return dword_1E25A04C8[a3 - 1];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    int result = 0;
    if (!v7) {
      return result;
    }
    int v8 = 136315906;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    uint64_t v11 = "+[VCTransportSession vtpPacketTypeForStreamType:]";
    __int16 v12 = 1024;
    int v13 = 458;
    __int16 v14 = 1024;
    unsigned int v15 = a3;
    _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid stream type %d", (uint8_t *)&v8, 0x22u);
  }
  return 0;
}

- (int)networkInterfaceType
{
}

- (unsigned)networkMTU
{
}

- (BOOL)isIPv6
{
}

- (void)setupNWMonitor
{
  if (self->_shouldSetupNWMonitor)
  {
    p_nwMonitorLock = &self->_nwMonitorLock;
    os_unfair_lock_lock(&self->_nwMonitorLock);
    if (!self->_monitor) {
      self->_monitor = [(VCTransportSession *)self createNWMonitor];
    }
    os_unfair_lock_unlock(p_nwMonitorLock);
  }
}

- (void)destroyNWMonitor
{
  p_nwMonitorLock = &self->_nwMonitorLock;
  os_unfair_lock_lock(&self->_nwMonitorLock);
  monitor = self->_monitor;
  if (monitor)
  {
    VCNWConnectionMonitor_Destroy((uint64_t)monitor);
    self->_monitor = 0;
  }

  os_unfair_lock_unlock(p_nwMonitorLock);
}

- (void)setupNWMonitorNotificationHandler
{
  p_nwMonitorLock = &self->_nwMonitorLock;
  os_unfair_lock_lock(&self->_nwMonitorLock);
  VCNWConnectionMonitor_SetNotificationHandler(self->_monitor, (uint64_t)self->_handlerQueue, (uint64_t)self->_handlerContext, (uint64_t)self->_notificationHandler);

  os_unfair_lock_unlock(p_nwMonitorLock);
}

- (void)setupNWMonitorPacketEventHandler
{
  p_nwMonitorLock = &self->_nwMonitorLock;
  os_unfair_lock_lock(&self->_nwMonitorLock);
  VCNWConnectionMonitor_SetPacketEventHandler(self->_monitor, (uint64_t)self->_handlerQueue, (uint64_t)self->_handlerContext, (uint64_t)self->_packetEventHandler);

  os_unfair_lock_unlock(p_nwMonitorLock);
}

- (tagVCNWConnectionMonitor)createNWMonitor
{
}

- (void)addNetworkAssertionWithInterfaceType:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_didAddNetworkAssertion)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315650;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        int v13 = "-[VCTransportSession addNetworkAssertionWithInterfaceType:]";
        __int16 v14 = 1024;
        int v15 = 520;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unexpected: Adding assertion multiple times", (uint8_t *)&v10, 0x1Cu);
      }
    }
  }
  else
  {
    int v5 = VCFeatureFlagManager_SkipNonInfraWiFiAssertion();
    if (a3 == 3 && v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        BOOL v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315650;
          uint64_t v11 = v6;
          __int16 v12 = 2080;
          int v13 = "-[VCTransportSession addNetworkAssertionWithInterfaceType:]";
          __int16 v14 = 1024;
          int v15 = 525;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent assertion added", (uint8_t *)&v10, 0x1Cu);
        }
      }
      [+[VCNetworkAgent sharedInstance] addAssertion];
      self->_didAddNetworkAssertion = 1;
    }
  }
}

- (void)removeNetworkAssertion
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_didAddNetworkAssertion)
  {
    [+[VCNetworkAgent sharedInstance] removeAssertion];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      int v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315650;
        uint64_t v6 = v3;
        __int16 v7 = 2080;
        uint64_t v8 = "-[VCTransportSession removeNetworkAssertion]";
        __int16 v9 = 1024;
        int v10 = 539;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent assertion removed", (uint8_t *)&v5, 0x1Cu);
      }
    }
    self->_didAddNetworkAssertion = 0;
  }
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (VCConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (BOOL)useCompressedConnectionData
{
  return self->_useCompressedConnectionData;
}

- (void)setUseCompressedConnectionData:(BOOL)a3
{
  self->_useCompressedConnectionData = a3;
}

- (BOOL)requiresWiFi
{
  return self->_requiresWiFi;
}

- (void)setRequiresWiFi:(BOOL)a3
{
  self->_requiresWiFuint64_t i = a3;
}

- (TimingCollection)perfTimings
{
  return self->_perfTimings;
}

- (void)setPerfTimings:(id)a3
{
}

- (unsigned)basebandNotificationRegistrationToken
{
  return self->_basebandNotificationRegistrationToken;
}

- (NSObject)connectionSetupPiggybackBlob
{
  return self->_connectionSetupPiggybackBlob;
}

- (void)setConnectionSetupPiggybackBlob:(id)a3
{
}

- (VCConnectionProtocol)registeredConnection
{
  return self->_registeredConnection;
}

- (void)setRegisteredConnection:(id)a3
{
}

- (BOOL)shouldSetupNWMonitor
{
  return self->_shouldSetupNWMonitor;
}

- (void)setShouldSetupNWMonitor:(BOOL)a3
{
  self->_shouldSetupNWMonitor = a3;
}

- (OS_dispatch_queue)nwMonitorEventHandlerQueue
{
  return self->_handlerQueue;
}

- (tagVCNWConnectionMonitor)nwMonitor
{
  return self->_monitor;
}

- (BOOL)shouldIgnoreConnectionRefusedError
{
  return self->_shouldIgnoreConnectionRefusedError;
}

- (void)setShouldIgnoreConnectionRefusedError:(BOOL)a3
{
  self->_shouldIgnoreConnectionRefusedError = a3;
}

- (void)createTransportStream:(uint64_t)a1 withType:(NSObject *)a2 options:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  int v5 = "-[VCTransportSession createTransportStream:withType:options:]";
  __int16 v6 = 1024;
  int v7 = 209;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d NULL transportStream", (uint8_t *)&v2, 0x1Cu);
}

- (void)createTransportStream:withType:options:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add notification listener %d", v2, v3, v4, v5);
}

- (void)deregisterNotificationForTransportStream:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCTransportStreamNotificationBarrier failed %x", v2, v3, v4, v5);
}

- (void)deregisterNotificationForTransportStream:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Remove listener failed %d", v2, v3, v4, v5);
}

- (void)flushBasebandQueueWithPayloads:(NSObject *)a3 flushCount:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[VCTransportSession flushBasebandQueueWithPayloads:flushCount:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, a2, a3, " [%s] %s:%d Baseband flush failed (%x)", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCTransportSession flushBasebandQueueWithPayloads:flushCount:]" >> 16, 364);
}

@end