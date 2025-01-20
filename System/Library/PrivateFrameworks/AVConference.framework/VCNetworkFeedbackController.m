@interface VCNetworkFeedbackController
- ($A43176E2CA7897F9838817DB2FB1B08B)wrmContext;
- (BOOL)isLocalCellular;
- (BOOL)isVideoPaused;
- (BOOL)shouldSendFeedbackControllerReport;
- (VCNetworkFeedbackController)initWithDelegate:(id)a3 connectionManager:(id)a4;
- (id)strongDelegate;
- (tagWRMMetricsInfo)wrmInfo;
- (unsigned)callID;
- (unsigned)clientTargetBitrate;
- (unsigned)clientTargetBitrateCap;
- (unsigned)downlinkTargetBitrate;
- (unsigned)downlinkTargetCellBitrateCap;
- (unsigned)recommendedTargetBitrateCap;
- (void)cleanupWCMClient;
- (void)cleanupWRMClient;
- (void)cleanupWRMData;
- (void)dealloc;
- (void)initializeWRMInfo;
- (void)reportImmediateWRMMetric:(int)a3 value:(unint64_t)a4;
- (void)reportWRMMetrics:(id *)a3;
- (void)requestWRMNotification;
- (void)sendFeedbackControllerReport:(id *)a3;
- (void)sendStatusUpdate:(id *)a3;
- (void)setCallID:(unsigned int)a3;
- (void)setClientTargetBitrate:(unsigned int)a3;
- (void)setClientTargetBitrateCap:(unsigned int)a3;
- (void)setDownlinkTargetBitrate:(unsigned int)a3;
- (void)setDownlinkTargetCellBitrateCap:(unsigned int)a3;
- (void)setIsLocalCellular:(BOOL)a3;
- (void)setIsVideoPaused:(BOOL)a3;
- (void)setPreWarmState:(BOOL)a3;
- (void)setRSSIThresholdEnabled:(BOOL)a3;
- (void)setShouldSendFeedbackControllerReport:(BOOL)a3;
- (void)setWRMCoexMetrics:(id)a3;
- (void)setWRMMetricConfig:(id *)a3;
- (void)setWRMNotification:(id *)a3;
- (void)setupWCMClient;
- (void)setupWRMClientWithMetricsConfig:(id)a3;
- (void)startWithMetricsConfig:(id)a3;
- (void)stop;
- (void)updateMetricsConfig:(id)a3;
- (void)wcmGetCallConfig:(unsigned int *)a3 targetBitrate:(unsigned int *)a4;
- (void)wcmSetCallConfig:(unsigned int)a3 interferenceLevel:(unsigned int)a4;
@end

@implementation VCNetworkFeedbackController

- (VCNetworkFeedbackController)initWithDelegate:(id)a3 connectionManager:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCNetworkFeedbackController;
  v6 = [(VCNetworkFeedbackController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_weakDelegate, a3);
    v7->_connectionManager = (VCConnectionManager *)a4;
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v7->_wrmClientQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.vcNetworkFeedbackController.serialQueue", 0, CustomRootQueue);
    [(VCNetworkFeedbackController *)v7 initializeWRMInfo];
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(VCNetworkFeedbackController *)self stop];
  [(VCNetworkFeedbackController *)self cleanupWRMData];

  objc_storeWeak((id *)&self->_weakDelegate, 0);
  wrmClientQueue = self->_wrmClientQueue;
  if (wrmClientQueue)
  {
    dispatch_release(wrmClientQueue);
    self->_wrmClientQueue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCNetworkFeedbackController;
  [(VCNetworkFeedbackController *)&v4 dealloc];
}

- (void)initializeWRMInfo
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate memory for WRM context", v2, v3, v4, v5, v6);
}

- (void)startWithMetricsConfig:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_isStarted)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v12 = v3;
        __int16 v13 = 2080;
        v14 = "-[VCNetworkFeedbackController startWithMetricsConfig:]";
        __int16 v15 = 1024;
        int v16 = 113;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCNetworkFeedbackController already started", buf, 0x1Cu);
      }
    }
  }
  else
  {
    int v5 = *(_DWORD *)&a3.var0;
    self->_isStarted = 1;
    [(VCNetworkFeedbackController *)self setupWCMClient];
    wrmClientQueue = self->_wrmClientQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__VCNetworkFeedbackController_startWithMetricsConfig___block_invoke;
    v8[3] = &unk_1E6DB6E60;
    v8[4] = self;
    char v10 = BYTE2(v5);
    __int16 v9 = v5;
    dispatch_async(wrmClientQueue, v8);
  }
}

uint64_t __54__VCNetworkFeedbackController_startWithMetricsConfig___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupWRMClientWithMetricsConfig:*(unsigned __int16 *)(a1 + 40) | ((unint64_t)*(unsigned __int8 *)(a1 + 42) << 16)];
}

- (void)stop
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_isStarted)
  {
    self->_isStarted = 0;
    if (self->_WRMClient) {
      [(VCNetworkFeedbackController *)self cleanupWRMClient];
    }
    if (self->_WCMClient)
    {
      [(VCNetworkFeedbackController *)self cleanupWCMClient];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      v8 = "-[VCNetworkFeedbackController stop]";
      __int16 v9 = 1024;
      int v10 = 125;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCNetworkFeedbackController already stopped", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (id)strongDelegate
{
  return objc_loadWeak((id *)&self->_weakDelegate);
}

- (unsigned)recommendedTargetBitrateCap
{
  objc_sync_enter(self);
  unsigned int v3 = [(VCRecommendedNetworkSettings *)self->_recommendedSettings targetBitrateCap];
  objc_sync_exit(self);
  return v3;
}

- (void)updateMetricsConfig:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  wrmClientQueue = self->_wrmClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCNetworkFeedbackController_updateMetricsConfig___block_invoke;
  block[3] = &unk_1E6DB6E60;
  block[4] = self;
  $EB925890EBEBD6850280D1FB85A9BD43 v5 = a3;
  dispatch_async(wrmClientQueue, block);
}

uint64_t __51__VCNetworkFeedbackController_updateMetricsConfig___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) updateMetricsConfig:*(unsigned __int16 *)(a1 + 40) | ((unint64_t)*(unsigned __int8 *)(a1 + 42) << 16)];
}

- (void)setRSSIThresholdEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  wrmClientQueue = self->_wrmClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__VCNetworkFeedbackController_setRSSIThresholdEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(wrmClientQueue, block);
}

uint64_t __55__VCNetworkFeedbackController_setRSSIThresholdEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setRSSIThresholdEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)cleanupWRMData
{
  wrmInfo = self->_wrmInfo;
  if (wrmInfo)
  {
    free(wrmInfo);
    self->_wrmInfo = 0;
  }
  wrmContext = self->_wrmContext;
  if (wrmContext)
  {
    free(wrmContext);
    self->_wrmContext = 0;
  }
}

- (void)sendFeedbackControllerReport:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t var6 = a3->var6;
  unint64_t v4 = a3->var5 / 0x3E8uLL;
  uint64_t var8 = a3->var8;
  unint64_t v6 = a3->var7 / 0x3E8uLL;
  uint64_t var0 = a3->var0;
  unint64_t v8 = a3->var1 / 0x3E8uLL;
  uint64_t var2 = a3->var2;
  unint64_t v10 = a3->var3 / 0x3E8uLL;
  wrmClientQueue = self->_wrmClientQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__VCNetworkFeedbackController_sendFeedbackControllerReport___block_invoke;
  v12[3] = &unk_1E6DB6F90;
  v12[4] = self;
  uint64_t v24 = 2;
  unint64_t v25 = v6;
  unint64_t v26 = v4;
  uint64_t v27 = 0;
  uint64_t v28 = var6;
  uint64_t v29 = var0;
  uint64_t v30 = var8;
  unint64_t v34 = v8;
  uint64_t v35 = var2;
  unint64_t v36 = v10;
  dispatch_async(wrmClientQueue, v12);
}

uint64_t __60__VCNetworkFeedbackController_sendFeedbackControllerReport___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) reportMetricsFaceTimeCalling:a1 + 40];
}

- (void)sendStatusUpdate:(id *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    wrmClientQueue = self->_wrmClientQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __48__VCNetworkFeedbackController_sendStatusUpdate___block_invoke;
    v4[3] = &unk_1E6DB4518;
    v4[4] = self;
    $A217ADC78E8DBEDF7C145ED6E6E16D89 v5 = *a3;
    dispatch_async(wrmClientQueue, v4);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCNetworkFeedbackController sendStatusUpdate:]();
    }
  }
}

uint64_t __48__VCNetworkFeedbackController_sendStatusUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) sendStatusUpdateFaceTimeCalling:a1 + 40];
}

- (void)requestWRMNotification
{
  v3[5] = *MEMORY[0x1E4F143B8];
  wrmClientQueue = self->_wrmClientQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__VCNetworkFeedbackController_requestWRMNotification__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(wrmClientQueue, v3);
}

uint64_t __53__VCNetworkFeedbackController_requestWRMNotification__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    unsigned int v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      unint64_t v8 = "-[VCNetworkFeedbackController requestWRMNotification]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 212;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Request for the latest iRAT notification by resubscribing again", (uint8_t *)&v5, 0x1Cu);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 24) requestNotificationFaceTimeCalling];
}

- (void)reportImmediateWRMMetric:(int)a3 value:(unint64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  wrmClientQueue = self->_wrmClientQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__VCNetworkFeedbackController_reportImmediateWRMMetric_value___block_invoke;
  v5[3] = &unk_1E6DB3F58;
  int v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(wrmClientQueue, v5);
}

uint64_t __62__VCNetworkFeedbackController_reportImmediateWRMMetric_value___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 270)) {
    return [*(id *)(v1 + 24) reportImmediateMetric:*(unsigned int *)(result + 48) value:*(void *)(result + 40)];
  }
  return result;
}

- (void)reportWRMMetrics:(id *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    memcpy(v6, a3, sizeof(v6));
    wrmClientQueue = self->_wrmClientQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__VCNetworkFeedbackController_reportWRMMetrics___block_invoke;
    v5[3] = &unk_1E6DB6F90;
    v5[4] = self;
    dispatch_async(wrmClientQueue, v5);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCNetworkFeedbackController reportWRMMetrics:]();
    }
  }
}

uint64_t __48__VCNetworkFeedbackController_reportWRMMetrics___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 270)) {
    return [*(id *)(v1 + 24) reportMetricsFaceTimeCalling:result + 40];
  }
  return result;
}

- (void)setWRMMetricConfig:(id *)a3
{
  self->_wrmReportingInterval = (double)a3->var0 / 50.0;
  unint64_t v4 = (void *)MEMORY[0x1E4E56580](&self->_weakDelegate, a2);
  [v4 reportingIntervalChanged:self->_wrmReportingInterval];
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)setWRMNotification:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int var0 = a3->var0;
      int var1 = a3->var1;
      unint64_t var2 = a3->var2;
      unint64_t var4 = a3->var4;
      unint64_t var5 = a3->var5;
      int v12 = 136317186;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      long long v15 = "-[VCNetworkFeedbackController setWRMNotification:]";
      __int16 v16 = 1024;
      int v17 = 253;
      __int16 v18 = 1024;
      int v19 = var0;
      __int16 v20 = 1024;
      int v21 = var1;
      __int16 v22 = 2048;
      unint64_t v23 = var2;
      __int16 v24 = 2080;
      var3 = a3->var3;
      __int16 v26 = 2048;
      unint64_t v27 = var5;
      __int16 v28 = 2048;
      unint64_t v29 = var4;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Get iRAT notification for %u, %u, 0x%llx, %s, (%llu, %llu)", (uint8_t *)&v12, 0x50u);
    }
  }
  VCConnectionManager_SetWRMNotification((uint64_t)self->_connectionManager, (long long *)&a3->var0);
}

- (void)setWRMCoexMetrics:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      int v10 = "-[VCNetworkFeedbackController setWRMCoexMetrics:]";
      __int16 v11 = 1024;
      int v12 = 258;
      __int16 v13 = 2080;
      uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRM: Get iRAT Coex Metrics %s", (uint8_t *)&v7, 0x26u);
    }
  }
  [(VCConnectionManager *)self->_connectionManager processWRMCoexMetrics:a3];
}

- (void)setPreWarmState:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = (void *)MEMORY[0x1E4E56580](&self->_weakDelegate, a2);
  [v4 preWarmStateChanged:v3];
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)wcmSetCallConfig:(unsigned int)a3 interferenceLevel:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      int v12 = "-[VCNetworkFeedbackController wcmSetCallConfig:interferenceLevel:]";
      __int16 v13 = 1024;
      int v14 = 272;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d wcmSetCallConfig callback.", (uint8_t *)&v9, 0x1Cu);
    }
  }
  objc_sync_enter(self);

  self->_recommendedSettings = [[VCRecommendedNetworkSettings alloc] initWithTargetBitrateCap:v4];
  uint64_t v8 = (void *)MEMORY[0x1E4E56580](&self->_weakDelegate);
  [v8 recommendedSettingsChanged:self->_recommendedSettings];
  if (v8) {
    CFRelease(v8);
  }
  objc_sync_exit(self);
}

- (void)wcmGetCallConfig:(unsigned int *)a3 targetBitrate:(unsigned int *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      int v12 = "-[VCNetworkFeedbackController wcmGetCallConfig:targetBitrate:]";
      __int16 v13 = 1024;
      int v14 = 284;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d wcmGetCallConfig callback.", (uint8_t *)&v9, 0x1Cu);
    }
  }
  objc_sync_enter(self);
  *a3 = [(VCNetworkFeedbackController *)self clientTargetBitrateCap];
  *a4 = [(VCNetworkFeedbackController *)self clientTargetBitrate];
  objc_sync_exit(self);
}

- (void)setupWCMClient
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!MEMORY[0x1E4FB7058] || !WCMEnabled())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v9 = 136315650;
    uint64_t v10 = v5;
    __int16 v11 = 2080;
    int v12 = "-[VCNetworkFeedbackController setupWCMClient]";
    __int16 v13 = 1024;
    int v14 = 308;
    uint64_t v7 = " [%s] %s:%d not supported on this device.";
LABEL_11:
    _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0x1Cu);
    return;
  }
  if ((NetworkUtils_IsLTEOrNewer([(VCConnectionManager *)self->_connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1]) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v9 = 136315650;
    uint64_t v10 = v8;
    __int16 v11 = 2080;
    int v12 = "-[VCNetworkFeedbackController setupWCMClient]";
    __int16 v13 = 1024;
    int v14 = 298;
    uint64_t v7 = " [%s] %s:%d non-LTE RAT not supported.";
    goto LABEL_11;
  }
  if (!self->_WCMClient)
  {
    BOOL v3 = objc_alloc_init(VCWCMClient);
    self->_WCMClient = v3;
    [(VCWCMClient *)v3 setWcmClientDelegate:self];
    WCMClient = self->_WCMClient;
    [(VCWCMClient *)WCMClient startWCMClient];
  }
}

- (void)cleanupWCMClient
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x1E4FB7058] && WCMEnabled())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315650;
        uint64_t v6 = v3;
        __int16 v7 = 2080;
        uint64_t v8 = "-[VCNetworkFeedbackController cleanupWCMClient]";
        __int16 v9 = 1024;
        int v10 = 317;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cleanup start.", (uint8_t *)&v5, 0x1Cu);
      }
    }
    [(VCWCMClient *)self->_WCMClient stopWCMClient];
    [(VCWCMClient *)self->_WCMClient setWcmClientDelegate:0];

    self->_WCMClient = 0;
  }
}

- (void)setupWRMClientWithMetricsConfig:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_WRMClient)
  {
    int v3 = *(_DWORD *)&a3.var0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v5;
        __int16 v10 = 2080;
        uint64_t v11 = "-[VCNetworkFeedbackController setupWRMClientWithMetricsConfig:]";
        __int16 v12 = 1024;
        int v13 = 329;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient setup start.", (uint8_t *)&v8, 0x1Cu);
      }
    }
    [(VCConnectionManager *)self->_connectionManager setWRMUpdateCallback:VCCMWRMStatusUpdateCallback requestNotificationCallback:VCCMWRMRequestNotificationCallback withContext:self completionHandler:0];
    __int16 v7 = [[WRMClient alloc] initWithDelegate:self];
    self->_WRMClient = v7;
    [(WRMClient *)v7 startWRMClientWithMode:1 metricsConfig:*(void *)&v3 & 0xFFFFFFLL];
  }
}

- (void)cleanupWRMClient
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      __int16 v12 = "-[VCNetworkFeedbackController cleanupWRMClient]";
      __int16 v13 = 1024;
      int v14 = 339;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient cleanup start.", buf, 0x1Cu);
    }
  }
  wrmClientQueue = self->_wrmClientQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__VCNetworkFeedbackController_cleanupWRMClient__block_invoke;
  v7[3] = &unk_1E6DB3E40;
  int8x16_t v6 = *(int8x16_t *)&self->_WRMClient;
  self->_WRMClient = 0;
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(wrmClientQueue, v7);
}

uint64_t __47__VCNetworkFeedbackController_cleanupWRMClient__block_invoke(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__VCNetworkFeedbackController_cleanupWRMClient__block_invoke_2;
  v3[3] = &unk_1E6DB3DC8;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 setWRMUpdateCallback:0 requestNotificationCallback:0 withContext:0 completionHandler:v3];
}

void __47__VCNetworkFeedbackController_cleanupWRMClient__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) stopWRMClient];
  uint64_t v2 = *(void **)(a1 + 32);
}

- (void)setDownlinkTargetBitrate:(unsigned int)a3
{
  self->_downlinkTargetBitrate = a3;
  [(VCConnectionManager *)self->_connectionManager setDuplicationDownlinkCellBitrateCap:self->_downlinkTargetCellBitrateCap currentBitrate:*(void *)&a3];
}

- (void)setDownlinkTargetCellBitrateCap:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_downlinkTargetCellBitrateCap = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCNetworkFeedbackController setDownlinkTargetCellBitrateCap:]";
      __int16 v10 = 1024;
      int v11 = 360;
      __int16 v12 = 1024;
      unsigned int v13 = a3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Update cellBitrateCap for pending iRAT notification purpose: %d", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (void)setIsLocalCellular:(BOOL)a3
{
  self->_isLocalCellular = a3;
  wrmInfo = self->_wrmInfo;
  if (wrmInfo) {
    wrmInfo->isLocalCellular = a3;
  }
}

- (void)setIsVideoPaused:(BOOL)a3
{
  self->_isVideoPaused = a3;
  wrmInfo = self->_wrmInfo;
  if (wrmInfo) {
    wrmInfo->isVideoPaused = a3;
  }
}

- (unsigned)clientTargetBitrate
{
  return self->_clientTargetBitrate;
}

- (void)setClientTargetBitrate:(unsigned int)a3
{
  self->_clientTargetBitrate = a3;
}

- (unsigned)clientTargetBitrateCap
{
  return self->_clientTargetBitrateCap;
}

- (void)setClientTargetBitrateCap:(unsigned int)a3
{
  self->_clientTargetBitrateCap = a3;
}

- (unsigned)downlinkTargetBitrate
{
  return self->_downlinkTargetBitrate;
}

- (unsigned)downlinkTargetCellBitrateCap
{
  return self->_downlinkTargetCellBitrateCap;
}

- (tagWRMMetricsInfo)wrmInfo
{
  return self->_wrmInfo;
}

- ($A43176E2CA7897F9838817DB2FB1B08B)wrmContext
{
  return self->_wrmContext;
}

- (unsigned)callID
{
  return self->_callID;
}

- (void)setCallID:(unsigned int)a3
{
  self->_callID = a3;
}

- (BOOL)isLocalCellular
{
  return self->_isLocalCellular;
}

- (BOOL)isVideoPaused
{
  return self->_isVideoPaused;
}

- (BOOL)shouldSendFeedbackControllerReport
{
  return self->_shouldSendFeedbackControllerReport;
}

- (void)setShouldSendFeedbackControllerReport:(BOOL)a3
{
  self->_shouldSendFeedbackControllerReport = a3;
}

- (void)sendStatusUpdate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d WRM status update cannot be null", v2, v3, v4, v5, v6);
}

- (void)reportWRMMetrics:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d WRM metric report cannot be null", v2, v3, v4, v5, v6);
}

@end