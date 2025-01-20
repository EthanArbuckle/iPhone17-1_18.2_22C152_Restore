@interface AVCRateController
- (AVCBasebandCongestionDetector)basebandCongestionDetector;
- (AVCRateControlConfig)configuration;
- (AVCRateControlFeedbackController)feedbackController;
- (AVCRateController)initWithDelegate:(id)a3 dumpID:(id)a4 isUplink:(BOOL)a5 reportingAgent:(id)a6;
- (AVCRateController)initWithDelegate:(id)a3 params:(const tagVCRateControlParams *)a4;
- (AVCStatisticsCollector)statisticsCollector;
- (BOOL)isPaused;
- (BOOL)isStarted;
- (BOOL)start;
- (BOOL)stop;
- (VCNWConnectionCongestionDetector)nwConnectionCongestionDetector;
- (VCRateControlMediaController)mediaController;
- (VCRateControlTrafficMetricCollector)trafficMetricCollector;
- (id)reportingAgent;
- (tagAVCRateControlExperimentConfig)rateControlExperimentConfig;
- (tagVCRateControlAlgorithmConfig)algorithmConfig;
- (unsigned)estimatedBandwidthCap;
- (unsigned)expectedBitrate;
- (unsigned)loadDefaultVCRCFeatureFlags:(unsigned int)a3;
- (unsigned)maxTargetBitrate;
- (unsigned)minTargetBitrate;
- (unsigned)nwNotificationProcessed;
- (unsigned)radioAccessTechnologyFromAVConferenceCellTech:(int)a3 isCellular:(BOOL)a4;
- (unsigned)rateControlModeFromAVConferenceOperatingMode:(int)a3;
- (unsigned)targetBitrate;
- (unsigned)targetBitrateCap;
- (void)accumulateStatsForPeriodicTaskUpdate;
- (void)cleanupNwActivity;
- (void)completeAndReleaseNwActivity:(id)a3 withReason:(int)a4;
- (void)configure:(AVCRateControlConfig *)a3;
- (void)configureWithOperatingMode:(int)a3 isLocalCellular:(BOOL)a4 localCellTech:(int)a5 isRemoteCellular:(BOOL)a6 remoteCellTech:(int)a7 bitrateCapKbps:(unsigned int)a8 isTrafficBursty:(BOOL)a9 featureFlags:(unsigned int)a10;
- (void)createBasebandLogDumpFile;
- (void)createNWConnectionLogDumpFile;
- (void)dealloc;
- (void)deregisterForRateSharing;
- (void)deregisterPeriodicTask;
- (void)getRealTimeStats:(__CFDictionary *)a3;
- (void)getRealTimeStatsForLowLatency:(__CFDictionary *)a3;
- (void)getRealTimeStatsForServerBasedRxOnly:(__CFDictionary *)a3;
- (void)getRealTimeStatsForServerBasedTxOnly:(__CFDictionary *)a3;
- (void)initAndStartTrafficMetricCollector;
- (void)periodicTask:(void *)a3;
- (void)printRateControllerHealthPrint;
- (void)registerForRateSharing:(unsigned int)a3;
- (void)registerPeriodicTask;
- (void)releaseAllLogDumpFiles;
- (void)releaseLogDumpFile:(void *)a3;
- (void)resetStatsForPeriodicTaskReport;
- (void)setBasebandCongestionDetector:(id)a3;
- (void)setBtNotificationMonitor;
- (void)setEstimatedBandwidthCap:(unsigned int)a3;
- (void)setExpectedBitrate:(unsigned int)a3;
- (void)setFeedbackController:(id)a3;
- (void)setMediaController:(id)a3;
- (void)setNwConnectionCongestionDetector:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setShareProfile:(id)a3;
- (void)setStatisticsCollector:(id)a3;
- (void)setTargetBitrateCap:(unsigned int)a3;
- (void)start;
@end

@implementation AVCRateController

- (AVCRateController)initWithDelegate:(id)a3 dumpID:(id)a4 isUplink:(BOOL)a5 reportingAgent:(id)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  uint64_t v11 = 0;
  long long v10 = 0u;
  id v7 = a4;
  BYTE1(v8) = a5;
  long long v9 = (unint64_t)a6;
  return [(AVCRateController *)self initWithDelegate:a3 params:&v7];
}

- (AVCRateController)initWithDelegate:(id)a3 params:(const tagVCRateControlParams *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)AVCRateController;
  v5 = [(AVCRateController *)&v15 init];
  if (v5)
  {
    FigCFWeakReferenceStore();
    FigCFWeakReferenceStore();
    v5->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    v5->_statisticsCollector = (AVCStatisticsCollector *)[[AVCStatisticsCollector alloc] initForSimulation:a4->var1 useExternalThread:a4->var5];
    v5->_feedbackController = [[AVCRateControlFeedbackController alloc] initWithStatisticsCollector:v5->_statisticsCollector];
    v5->_isForSimulation = a4->var1;
    v5->_isRateControlDumpFileEnabled = [+[VCDefaults sharedInstance] rateControlDumpEnabled];
    v5->_BOOL isBWEDumpFileEnabled = [+[VCDefaults sharedInstance] bandwidthEstimationDumpEnabled];
    v5->_dumpID = (NSString *)[a4->var0 copy];
    v5->_isUplink = a4->var2;
    v5->_useExternalThread = a4->var5;
    v5->_isPeriodicLoggingEnabled = [+[VCDefaults sharedInstance] rateControlLogEnabled];
    *(void *)&v5->_forcedTargetBitrate = -1;
    v5->_serverBag = (VCRateControlServerBag *)a4->var3;
    v5->_btNotificationHandlerIndex = -1;
    var6 = (OS_nw_activity *)a4->var6;
    v5->_parentNWActivity = var6;
    v5->_registrationLock._os_unfair_lock_opaque = 0;
    v5->_isECNEnabled = 0;
    if (var6) {
      nw_retain(var6);
    }
    pthread_mutex_init(&v5->_mutex, 0);
    v5->_useNWConnectionNotification = _os_feature_enabled_impl();
    v5->_sharingGroup = (VCRateSharingGroup *)a4->var8;
    if (_os_feature_enabled_impl()) {
      v5->_useBTNotificationMonitor = a4->var7;
    }
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v5->_reportingQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.VideoConference.VCRCReport", 0, CustomRootQueue);
    v5->_weakSelf = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      long long v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        long long v10 = "enabled";
        if (v5->_isRateControlDumpFileEnabled) {
          uint64_t v11 = "enabled";
        }
        else {
          uint64_t v11 = "disabled";
        }
        BOOL isBWEDumpFileEnabled = v5->_isBWEDumpFileEnabled;
        if (v5->_isPeriodicLoggingEnabled) {
          v13 = "enabled";
        }
        else {
          v13 = "disabled";
        }
        *(_DWORD *)buf = 136316674;
        if (!isBWEDumpFileEnabled) {
          long long v10 = "disabled";
        }
        uint64_t v17 = v8;
        __int16 v18 = 2080;
        v19 = "-[AVCRateController initWithDelegate:params:]";
        __int16 v20 = 1024;
        int v21 = 523;
        __int16 v22 = 2048;
        v23 = v5;
        __int16 v24 = 2080;
        v25 = v11;
        __int16 v26 = 2080;
        v27 = v13;
        __int16 v28 = 2080;
        v29 = v10;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d AVCRateController (%p) init with VCRateControl dumpFile %s, VCRateControl logging %s, BWE dumpFile %s.", buf, 0x44u);
      }
    }
  }
  return v5;
}

- (void)completeAndReleaseNwActivity:(id)a3 withReason:(int)a4
{
  nw_activity_complete_with_reason();

  nw_release(a3);
}

- (void)cleanupNwActivity
{
  noServerStatsUplinkNwActivity = self->_noServerStatsUplinkNwActivity;
  if (noServerStatsUplinkNwActivity) {
    [(AVCRateController *)self completeAndReleaseNwActivity:noServerStatsUplinkNwActivity withReason:3];
  }
  noServerStatsDownlinkNwActivity = self->_noServerStatsDownlinkNwActivity;
  if (noServerStatsDownlinkNwActivity) {
    [(AVCRateController *)self completeAndReleaseNwActivity:noServerStatsDownlinkNwActivity withReason:3];
  }
  parentNWActivity = self->_parentNWActivity;
  if (parentNWActivity)
  {
    nw_release(parentNWActivity);
  }
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      uint64_t v11 = "-[AVCRateController dealloc]";
      __int16 v12 = 1024;
      int v13 = 547;
      __int16 v14 = 2048;
      objc_super v15 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d (%p)", buf, 0x26u);
    }
  }
  [(AVCRateController *)self releaseAllLogDumpFiles];
  FigCFWeakReferenceStore();
  FigCFWeakReferenceStore();

  [(AVCRateController *)self cleanupNwActivity];
  pthread_mutex_destroy(&self->_mutex);
  reportingQueue = self->_reportingQueue;
  if (reportingQueue) {
    dispatch_release(reportingQueue);
  }
  weakSelf = self->_weakSelf;
  if (weakSelf) {
    CFRelease(weakSelf);
  }

  v7.receiver = self;
  v7.super_class = (Class)AVCRateController;
  [(AVCRateController *)&v7 dealloc];
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    VCRateControlAlgorithm_SetPaused((uint64_t)self->_rateControlAlgorithm, a3);
  }
}

- (void)configure:(AVCRateControlConfig *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int mode = a3->mode;
      unsigned int localRadioAccessTechnology = a3->localRadioAccessTechnology;
      unsigned int maxBitrate = a3->maxBitrate;
      unsigned int minBitrate = a3->minBitrate;
      unsigned int remoteRadioAccessTechnology = a3->remoteRadioAccessTechnology;
      BOOL isTrafficBursty = a3->isTrafficBursty;
      unsigned int featureFlags = a3->featureFlags;
      statisticsCollector = self->_statisticsCollector;
      *(_DWORD *)__int16 v22 = 136317954;
      *(void *)&v22[4] = v5;
      *(_WORD *)&v22[12] = 2080;
      *(void *)&v22[14] = "-[AVCRateController configure:]";
      *(_WORD *)&v22[22] = 1024;
      *(_DWORD *)&v22[24] = 578;
      *(_WORD *)&v22[28] = 2048;
      *(void *)&v22[30] = self;
      *(_WORD *)&v22[38] = 1024;
      *(_DWORD *)&v22[40] = mode;
      *(_WORD *)&v22[44] = 1024;
      *(_DWORD *)&v22[46] = localRadioAccessTechnology;
      *(_WORD *)&v22[50] = 1024;
      *(_DWORD *)&v22[52] = remoteRadioAccessTechnology;
      *(_WORD *)&v22[56] = 1024;
      *(_DWORD *)&v22[58] = minBitrate;
      *(_WORD *)&v22[62] = 1024;
      *(_DWORD *)&v22[64] = maxBitrate;
      *(_WORD *)&v22[68] = 1024;
      *(_DWORD *)&v22[70] = isTrafficBursty;
      *(_WORD *)&v22[74] = 1024;
      *(_DWORD *)&v22[76] = featureFlags;
      *(_WORD *)&v22[80] = 2048;
      *(void *)&v22[82] = statisticsCollector;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d AVCRateController (%p) configuration with mode=%d, LocalRAT=%d, RemoteRAT=%d, minBitrate=%d, maxBitrate=%d, isTrafficBursty=%d, featureFlags=%X, statisticsCollector=%p", v22, 0x5Au);
    }
  }
  if ((a3->featureFlags & 4) != 0) {
    [(VCRateControlMediaController *)self->_mediaController setEnableAggressiveProbingSequence:1];
  }
  [(VCRateControlMediaController *)self->_mediaController setServerBag:self->_serverBag];
  algorithmConfig = a3->algorithmConfig;
  if (algorithmConfig && !self->_didCacheAlgorithmConfig)
  {
    memcpy(&self->_algorithmConfigCache, algorithmConfig, sizeof(self->_algorithmConfigCache));
    self->_didCacheAlgorithmConfig = 1;
  }
  if (!self->_basebandCongestionDetector && a3->localRadioAccessTechnology - 2 <= 4)
  {
    uint64_t v16 = objc_alloc_init(AVCBasebandCongestionDetector);
    self->_basebandCongestionDetector = v16;
    [(AVCBasebandCongestionDetector *)v16 setStatisticsCollector:self->_statisticsCollector];
    [(AVCBasebandCongestionDetector *)self->_basebandCongestionDetector setMediaController:self->_mediaController];
    [(AVCRateController *)self createBasebandLogDumpFile];
    [(AVCBasebandCongestionDetector *)self->_basebandCongestionDetector enableBasebandLogDump:self->_logBasebandDump];
    [(VCRateControlMediaController *)self->_mediaController enableBasebandLogDump:self->_logBasebandDump];
    [(AVCBasebandCongestionDetector *)self->_basebandCongestionDetector start];
  }
  unsigned int v17 = a3->mode;
  if (!self->_nwConnectionCongestionDetector)
  {
    if ((v17 & 0xFFFFFFFE) != 8
      || (__int16 v20 = objc_alloc_init(VCNWConnectionCongestionDetector),
          self->_nwConnectionCongestionDetector = v20,
          [(VCNWConnectionCongestionDetector *)v20 setStatisticsCollector:self->_statisticsCollector], [(AVCRateController *)self createNWConnectionLogDumpFile], [(VCNWConnectionCongestionDetector *)self->_nwConnectionCongestionDetector enableNWLogDump:self->_logNWDump], unsigned int v17 = a3->mode, !self->_nwConnectionCongestionDetector))
    {
      if (v17 == 10)
      {
        int v21 = objc_alloc_init(VCNWConnectionCongestionDetectorBaseband);
        self->_nwConnectionCongestionDetector = &v21->super;
        [(VCNWConnectionCongestionDetector *)v21 setStatisticsCollector:self->_statisticsCollector];
        [(AVCRateController *)self createNWConnectionLogDumpFile];
        [(VCNWConnectionCongestionDetector *)self->_nwConnectionCongestionDetector enableNWLogDump:self->_logNWDump];
        unsigned int v17 = a3->mode;
      }
    }
  }
  unsigned int v18 = a3->localRadioAccessTechnology;
  if (v18 == 1)
  {
    if (v17 - 1 > 1 || self->_logNWDump)
    {
      unsigned int v18 = 1;
    }
    else
    {
      [(AVCRateController *)self createNWConnectionLogDumpFile];
      unsigned int v17 = a3->mode;
      unsigned int v18 = a3->localRadioAccessTechnology;
    }
  }
  memset(&v22[24], 0, 176);
  *(_OWORD *)&v22[8] = 0u;
  *(void *)__int16 v22 = 0x100000009;
  *(_DWORD *)&v22[32] = v18;
  unsigned int v19 = a3->remoteRadioAccessTechnology;
  *(_DWORD *)&v22[24] = v17;
  *(_DWORD *)&v22[28] = v19;
  *(void *)&v22[36] = *(void *)&a3->maxBitrate;
  *(_DWORD *)&v22[44] = a3->initialBitrate;
  *(_DWORD *)&v22[52] = a3->featureFlags;
  v22[48] = a3->isTrafficBursty;
  AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v22);
}

- (BOOL)start
{
  v11[5] = *MEMORY[0x1E4F143B8];
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  if ([(AVCRateController *)self isStarted])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCRateController start]();
      }
    }
LABEL_21:
    BOOL v8 = 0;
    goto LABEL_22;
  }
  v4 = (AVCRateControllerDelegate *)MEMORY[0x1E4E56580](&self->_rateControllerDelegateWeak);
  self->_rateControllerDelegate = v4;
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCRateController start]();
      }
    }
    goto LABEL_21;
  }
  if (self->_reportingAgentWeak
    && (uint64_t v5 = (opaqueRTCReporting *)MEMORY[0x1E4E56580](&self->_reportingAgentWeak),
        (self->_reportingAgentStrong = v5) == 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCRateController start]();
      }
    }
    rateControllerDelegate = self->_rateControllerDelegate;
    if (!rateControllerDelegate) {
      goto LABEL_21;
    }
    CFRelease(rateControllerDelegate);
    BOOL v8 = 0;
    self->_rateControllerDelegate = 0;
  }
  else
  {
    statisticsCollector = self->_statisticsCollector;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __26__AVCRateController_start__block_invoke;
    v11[3] = &unk_1E6DB3FA8;
    v11[4] = self;
    [(AVCStatisticsCollector *)statisticsCollector registerStatisticsChangeHandlerWithType:9 handler:v11];
    _AVCRateController_RegisterStatisticsChangeHandlers((uint64_t)self);
    [(AVCStatisticsCollector *)self->_statisticsCollector start];
    [(AVCRateController *)self registerPeriodicTask];
    [(AVCRateController *)self registerForRateSharing:self->_configuration.mode];
    [(AVCRateController *)self setBtNotificationMonitor];
    unsigned int mode = self->_configuration.mode;
    if (mode <= 7
      && ((1 << mode) & 0x86) != 0
      && [(VCRateControlMediaController *)self->_mediaController vcMediaQueue])
    {
      [(AVCRateController *)self initAndStartTrafficMetricCollector];
    }
    [(VCRateControlAlgorithm *)self->_rateControlAlgorithm setIsFirstTimestampArrived:0];
    BOOL v8 = 1;
  }
LABEL_22:
  pthread_mutex_unlock(p_mutex);
  return v8;
}

uint64_t __26__AVCRateController_start__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  float32x2x2_t v2 = *(float32x2x2_t *)(a2 + 24);
  unint64_t v3 = vextq_s8((int8x16_t)v2, (int8x16_t)v2, 8uLL).u64[0];
  v4 = (float *)v6;
  vst2_f32(v4, v2);
  v4 += 4;
  *(void *)v4 = *(void *)(a2 + 40);
  LOBYTE(v7) = *(unsigned char *)(a2 + 48);
  LODWORD(v9) = *(_DWORD *)(a2 + 52);
  return _AVCRateController_ConfigureInternal(*(void *)(a1 + 32), v6);
}

- (BOOL)stop
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  BOOL v4 = [(AVCRateController *)self isStarted];
  if (v4)
  {
    [(AVCRateController *)self deregisterForRateSharing];
    [(AVCRateController *)self deregisterPeriodicTask];
    rateControllerDelegate = self->_rateControllerDelegate;
    if (rateControllerDelegate)
    {
      CFRelease(rateControllerDelegate);
      self->_rateControllerDelegate = 0;
    }
    reportingAgentStrong = self->_reportingAgentStrong;
    if (reportingAgentStrong)
    {
      CFRelease(reportingAgentStrong);
      self->_reportingAgentStrong = 0;
    }
    [(AVCBasebandCongestionDetector *)self->_basebandCongestionDetector stop];
    [(AVCStatisticsCollector *)self->_statisticsCollector stop];
    [(AVCStatisticsCollector *)self->_statisticsCollector unregisterAllStatisticsChangeHandlers];
    [+[VCBTNotificationMonitor sharedInstance] unregisterBTNotificationHandler:self->_btNotificationHandlerIndex];
    self->_btNotificationHandlerIndex = -1;
    [(VCRateControlTrafficMetricCollector *)self->_trafficMetricCollector stopVCRateControlTrafficMetricCollector];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      int v13 = "-[AVCRateController stop]";
      __int16 v14 = 1024;
      int v15 = 696;
      __int16 v16 = 2048;
      unsigned int v17 = self;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d (%p) rate controller has been stopped", (uint8_t *)&v10, 0x26u);
    }
  }
  pthread_mutex_unlock(p_mutex);
  return v4;
}

- (tagAVCRateControlExperimentConfig)rateControlExperimentConfig
{
  unsigned int v3 = [(VCRateControlServerBag *)self->_serverBag experimentVersion];
  uint64_t v4 = [(NSNumber *)[(VCRateControlServerBag *)self->_serverBag experimentGroupIndex] intValue];
  rateControlAlgorithm = self->_rateControlAlgorithm;
  if (!rateControlAlgorithm) {
    goto LABEL_9;
  }
  [(VCRateControlAlgorithm *)rateControlAlgorithm config];
  v6 = self->_rateControlAlgorithm;
  if (!v6)
  {
    if (!v12) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  [(VCRateControlAlgorithm *)v6 reportStatistics];
  unsigned int v7 = 0;
  if (v12 && !v11)
  {
LABEL_7:
    uint64_t v8 = self->_rateControlAlgorithm;
    if (v8)
    {
      [(VCRateControlAlgorithm *)v8 reportStatistics];
      unsigned int v7 = v10;
      goto LABEL_10;
    }
LABEL_9:
    unsigned int v7 = 0;
  }
LABEL_10:
  unint64_t v9 = v3 | (unint64_t)(v4 << 32);
  result.var0 = v9;
  result.var1 = HIDWORD(v9);
  result.var2 = v7;
  return result;
}

- (tagVCRateControlAlgorithmConfig)algorithmConfig
{
  rateControlAlgorithm = self->_rateControlAlgorithm;
  if (rateControlAlgorithm) {
    return (tagVCRateControlAlgorithmConfig *)[(VCRateControlAlgorithm *)rateControlAlgorithm config];
  }
  bzero(retstr, 0x3F0uLL);
  return result;
}

- (void)initAndStartTrafficMetricCollector
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "AVCRC [%s] %s:%d [%p] cannot start Rate controller, because trafficMetricCollector is not allocated", v2, v3, v4, v5);
}

- (void)periodicTask:(void *)a3
{
  if (a3)
  {
    unsigned int mode = self->_configuration.mode;
    if (mode - 8 < 2)
    {
      -[AVCRateController getRealTimeStatsForLowLatency:](self, "getRealTimeStatsForLowLatency:");
    }
    else if (mode == 5)
    {
      -[AVCRateController getRealTimeStatsForServerBasedRxOnly:](self, "getRealTimeStatsForServerBasedRxOnly:");
    }
    else if (mode == 4)
    {
      -[AVCRateController getRealTimeStatsForServerBasedTxOnly:](self, "getRealTimeStatsForServerBasedTxOnly:");
    }
    else
    {
      -[AVCRateController getRealTimeStats:](self, "getRealTimeStats:");
    }
    [(AVCRateController *)self resetStatsForPeriodicTaskReport];
    [(AVCRateController *)self printRateControllerHealthPrint];
  }
  else
  {
    [(AVCRateController *)self accumulateStatsForPeriodicTaskUpdate];
  }
}

- (void)accumulateStatsForPeriodicTaskUpdate
{
  *(float64x2_t *)&self->_sumPLR = vmlaq_f64(*(float64x2_t *)&self->_sumPLR, (float64x2_t)vdupq_n_s64(0x4059000000000000uLL), *(float64x2_t *)&self->_packetLossPercentage);
  [(VCRateControlAlgorithm *)self->_rateControlAlgorithm worstRecentRoundTripTime];
  LODWORD(v3) = self->_sumWorstRecentRTTInMillisecond;
  self->_sumWorstRecentRTTInMillisecond = ((double)v3 + v4 * 1000.0);
  self->_sumWorstRecentBurstLoss += [(VCRateControlAlgorithm *)self->_rateControlAlgorithm worstRecentBurstLoss];
  unsigned int targetBitrateTier = self->_targetBitrateTier;
  if (targetBitrateTier)
  {
    unsigned int targetBitrate = self->_targetBitrate;
    BOOL v15 = targetBitrate >= targetBitrateTier;
    unsigned int v8 = targetBitrate - targetBitrateTier;
    BOOL v7 = v8 != 0 && v15;
    unsigned int targetBitrateTier = v8 / 0x3E8;
    if (!v7) {
      unsigned int targetBitrateTier = 0;
    }
  }
  self->_sumExtraTargetBitrate += targetBitrateTier;
  if (([(VCRateControlAlgorithm *)self->_rateControlAlgorithm isSendBitrateLimited] & 1) == 0)
  {
    unsigned int v9 = [(AVCStatisticsCollector *)self->_statisticsCollector sharedRemoteEstimatedBandwidth];
    unsigned int v10 = self->_targetBitrate;
    unsigned int v11 = v9 - v10;
    if (v10 >= v9) {
      unsigned int v11 = v10 - v9;
    }
    uint64_t v12 = 1224;
    if (v10 < v9) {
      uint64_t v12 = 1228;
    }
    *(_DWORD *)((char *)&self->super.isa + v12) += v11 / 0x3E8;
    unsigned int actualBitrate = self->_actualBitrate;
    unsigned int v14 = v10 - actualBitrate;
    BOOL v15 = actualBitrate >= v10;
    unsigned int v16 = actualBitrate - v10;
    if (!v15) {
      unsigned int v16 = v14;
    }
    uint64_t v17 = 1232;
    if (!v15) {
      uint64_t v17 = 1236;
    }
    *(_DWORD *)((char *)&self->super.isa + v17) += v16 / 0x3E8;
  }
  ++self->_countPeriodicTaskUpdate;
}

- (void)resetStatsForPeriodicTaskReport
{
  self->_isCongestedForReport = 0;
  *(_OWORD *)&self->_sumPLR = 0u;
  *(_OWORD *)&self->_sumOverUtilizedBandwidth = 0u;
  *(_OWORD *)&self->_sumWorstRecentRTTInMillisecond = 0u;
}

- (void)registerPeriodicTask
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "AVCRC [%s] %s:%d (%p) Cannot register periodic task before rate controller start!", v2, v3, v4, v5);
}

uint64_t __41__AVCRateController_registerPeriodicTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "periodicTask:");
}

- (void)getRealTimeStatsForServerBasedTxOnly:(__CFDictionary *)a3
{
  unsigned int countPeriodicTaskUpdate = self->_countPeriodicTaskUpdate;
  if (countPeriodicTaskUpdate) {
    double v6 = self->_sumPLR / (double)countPeriodicTaskUpdate;
  }
  else {
    double v6 = 0.0;
  }
  CFDictionaryAddValue(a3, @"ULPLR", (const void *)[NSNumber numberWithDouble:v6]);
  CFDictionaryAddValue(a3, @"RTTUL", (const void *)[NSNumber numberWithUnsignedInt:self->_roundTripTimeMilliseconds]);
  CFDictionaryAddValue(a3, @"ULTBR", (const void *)[NSNumber numberWithUnsignedInt:self->_targetBitrate / 0x3E8uLL]);
  CFDictionaryAddValue(a3, @"ULSBR", (const void *)[NSNumber numberWithUnsignedInt:self->_actualBitrate / 0x3E8uLL]);
  CFDictionaryAddValue(a3, @"ULWMBR", (const void *)[NSNumber numberWithUnsignedInt:self->_wifiTxMediaBitrate / 0x3E8uLL]);
  CFDictionaryAddValue(a3, @"ULWNBR", (const void *)[NSNumber numberWithUnsignedInt:self->_wifiNonAVCTxMediaBitrate / 0x3E8uLL]);
  CFDictionaryAddValue(a3, @"ULBWE", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[AVCStatisticsCollector sharedEstimatedBandwidthUncapped](self->_statisticsCollector, "sharedEstimatedBandwidthUncapped")/ 0x3E8uLL));
  CFDictionaryAddValue(a3, @"ULTBSNT", (const void *)[NSNumber numberWithUnsignedInt:self->_totalBytesSent]);
  CFDictionaryAddValue(a3, @"ULTPRC", (const void *)[NSNumber numberWithUnsignedInt:self->_totalPacketsReceived]);
  CFDictionaryAddValue(a3, @"ULTPST", (const void *)[NSNumber numberWithUnsignedInt:self->_totalPacketsSent]);
  BOOL v7 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[VCRateControlAlgorithm isLossBasedAdaptationOn](self->_rateControlAlgorithm, "isLossBasedAdaptationOn"));

  CFDictionaryAddValue(a3, @"ULLBA", v7);
}

- (void)getRealTimeStatsForServerBasedRxOnly:(__CFDictionary *)a3
{
  CFDictionaryAddValue(a3, @"DLTPRC", (const void *)[NSNumber numberWithUnsignedInt:self->_totalPacketsReceived]);
  unsigned int countPeriodicTaskUpdate = self->_countPeriodicTaskUpdate;
  if (countPeriodicTaskUpdate) {
    double v6 = self->_sumPLR / (double)countPeriodicTaskUpdate;
  }
  else {
    double v6 = 0.0;
  }
  CFDictionaryAddValue(a3, @"DLPLR", (const void *)[NSNumber numberWithDouble:v6]);
  CFDictionaryAddValue(a3, @"RTTDL", (const void *)[NSNumber numberWithUnsignedInt:self->_roundTripTimeMilliseconds]);
  CFDictionaryAddValue(a3, @"DLTBR", (const void *)[NSNumber numberWithUnsignedInt:self->_targetBitrate / 0x3E8uLL]);
  CFDictionaryAddValue(a3, @"DLRBR", (const void *)[NSNumber numberWithUnsignedInt:self->_actualBitrate / 0x3E8uLL]);
  CFDictionaryAddValue(a3, @"DLBWE", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[AVCStatisticsCollector sharedEstimatedBandwidthUncapped](self->_statisticsCollector, "sharedEstimatedBandwidthUncapped")/ 0x3E8uLL));
  CFDictionaryAddValue(a3, @"DLTBRCVD", (const void *)[NSNumber numberWithUnsignedInt:self->_totalBytesReceived]);
  BOOL v7 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", -[VCRateControlAlgorithm isLossBasedAdaptationOn](self->_rateControlAlgorithm, "isLossBasedAdaptationOn"));

  CFDictionaryAddValue(a3, @"DLLBA", v7);
}

- (void)getRealTimeStatsForLowLatency:(__CFDictionary *)a3
{
  unsigned int countPeriodicTaskUpdate = self->_countPeriodicTaskUpdate;
  if (countPeriodicTaskUpdate) {
    double v6 = self->_sumPLR / (double)countPeriodicTaskUpdate;
  }
  else {
    double v6 = 0.0;
  }
  CFDictionaryAddValue(a3, @"ULPLR", (const void *)[NSNumber numberWithDouble:v6]);
  CFDictionaryAddValue(a3, @"RTT", (const void *)[NSNumber numberWithUnsignedInt:self->_roundTripTimeMilliseconds]);
  CFDictionaryAddValue(a3, @"ULTBR", (const void *)[NSNumber numberWithUnsignedInt:self->_targetBitrate / 0x3E8uLL]);
  CFDictionaryAddValue(a3, @"ULBWE", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[AVCStatisticsCollector sharedRemoteEstimatedBandwidth](self->_statisticsCollector, "sharedRemoteEstimatedBandwidth")/ 0x3E8uLL));
  CFDictionaryAddValue(a3, @"ULBPL", (const void *)[NSNumber numberWithUnsignedInt:self->_burstPacketLoss]);
  nwConnectionCongestionDetector = self->_nwConnectionCongestionDetector;
  if (nwConnectionCongestionDetector)
  {
    CFDictionaryAddValue(a3, @"NWAPD", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCNWConnectionCongestionDetector averagePacketDelayMs](nwConnectionCongestionDetector, "averagePacketDelayMs")));
    CFDictionaryAddValue(a3, @"MAWFPD", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCNWConnectionCongestionDetector maxAveragePacketDelayMs](self->_nwConnectionCongestionDetector, "maxAveragePacketDelayMs")));
    CFDictionaryAddValue(a3, @"NWATH", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCNWConnectionCongestionDetector averageThroughputBps](self->_nwConnectionCongestionDetector, "averageThroughputBps")/ 0x3E8uLL));
    CFDictionaryAddValue(a3, @"NWNaC", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCNWConnectionCongestionDetector packetDropCount](self->_nwConnectionCongestionDetector, "packetDropCount")));
    unsigned int v8 = self->_nwConnectionCongestionDetector;
    [(VCNWConnectionCongestionDetector *)v8 setMaxAveragePacketDelayMs:0];
  }
}

- (void)getRealTimeStats:(__CFDictionary *)a3
{
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t countPeriodicTaskUpdate = self->_countPeriodicTaskUpdate;
  if (countPeriodicTaskUpdate) {
    uint64_t countPeriodicTaskUpdate = (int)(self->_sumPLR / (double)countPeriodicTaskUpdate);
  }
  CFStringRef v7 = CFStringCreateWithFormat(v5, 0, @"%u", countPeriodicTaskUpdate);
  CFDictionaryAddValue(a3, @"PLR", v7);
  CFRelease(v7);
  uint64_t v8 = self->_countPeriodicTaskUpdate;
  if (v8) {
    uint64_t v8 = (int)(self->_sumPLRVideo / (double)v8);
  }
  CFStringRef v9 = CFStringCreateWithFormat(v5, 0, @"%u", v8);
  CFDictionaryAddValue(a3, @"VPLR", v9);
  CFRelease(v9);
  CFStringRef v10 = CFStringCreateWithFormat(v5, 0, @"%u", self->_roundTripTimeMilliseconds);
  CFDictionaryAddValue(a3, @"RTT", v10);
  CFRelease(v10);
  CFStringRef v11 = CFStringCreateWithFormat(v5, 0, @"%u", self->_targetBitrate / 0x3E8uLL);
  CFDictionaryAddValue(a3, @"TTxR", v11);
  CFRelease(v11);
  CFStringRef v12 = CFStringCreateWithFormat(v5, 0, @"%u", self->_actualBitrate / 0x3E8uLL);
  CFDictionaryAddValue(a3, @"ULSBR", v12);
  CFRelease(v12);
  CFStringRef v13 = CFStringCreateWithFormat(v5, 0, @"%u", [(AVCStatisticsCollector *)self->_statisticsCollector sharedEstimatedBandwidthUncapped]/ 0x3E8uLL);
  CFDictionaryAddValue(a3, @"DBE", v13);
  CFRelease(v13);
  CFStringRef v14 = CFStringCreateWithFormat(v5, 0, @"%u", [(AVCStatisticsCollector *)self->_statisticsCollector sharedRemoteEstimatedBandwidth]/ 0x3E8uLL);
  CFDictionaryAddValue(a3, @"UBE", v14);
  CFRelease(v14);
  unsigned int v15 = self->_countPeriodicTaskUpdate;
  if (v15) {
    uint64_t v16 = self->_sumWorstRecentRTTInMillisecond / v15;
  }
  else {
    uint64_t v16 = 0;
  }
  CFDictionaryAddValue(a3, @"WRRTT", (const void *)[NSNumber numberWithUnsignedInt:v16]);
  unsigned int v17 = self->_countPeriodicTaskUpdate;
  if (v17) {
    uint64_t v18 = self->_sumWorstRecentBurstLoss / v17;
  }
  else {
    uint64_t v18 = 0;
  }
  CFDictionaryAddValue(a3, @"WRBPL", (const void *)[NSNumber numberWithUnsignedInt:v18]);
  unsigned int v19 = self->_countPeriodicTaskUpdate;
  if (v19) {
    uint64_t v20 = self->_sumOverShootSendBitrate / v19;
  }
  else {
    uint64_t v20 = 0;
  }
  CFDictionaryAddValue(a3, @"OVSBR", (const void *)[NSNumber numberWithUnsignedInt:v20]);
  unsigned int v21 = self->_countPeriodicTaskUpdate;
  if (v21) {
    uint64_t v22 = self->_sumUnderShootSendBitrate / v21;
  }
  else {
    uint64_t v22 = 0;
  }
  CFDictionaryAddValue(a3, @"UNSBR", (const void *)[NSNumber numberWithUnsignedInt:v22]);
  unsigned int v23 = self->_countPeriodicTaskUpdate;
  if (v23) {
    uint64_t v24 = self->_sumOverUtilizedBandwidth / v23;
  }
  else {
    uint64_t v24 = 0;
  }
  CFDictionaryAddValue(a3, @"OVBWE", (const void *)[NSNumber numberWithUnsignedInt:v24]);
  unsigned int v25 = self->_countPeriodicTaskUpdate;
  if (v25) {
    uint64_t v26 = self->_sumUnderUtilizedBandwidth / v25;
  }
  else {
    uint64_t v26 = 0;
  }
  CFDictionaryAddValue(a3, @"UNBWE", (const void *)[NSNumber numberWithUnsignedInt:v26]);
  unsigned int v27 = self->_countPeriodicTaskUpdate;
  if (v27) {
    uint64_t v28 = self->_sumExtraTargetBitrate / v27;
  }
  else {
    uint64_t v28 = 0;
  }
  CFDictionaryAddValue(a3, @"AExTR", (const void *)[NSNumber numberWithUnsignedInt:v28]);
  unsigned int v29 = [(AVCStatisticsCollector *)self->_statisticsCollector sharedEstimatedBandwidth];
  unsigned int lastReportedBandwidthEstimation = self->_lastReportedBandwidthEstimation;
  if (lastReportedBandwidthEstimation
    && v29
    && (double)lastReportedBandwidthEstimation / (double)v29 > 2.0
    && lastReportedBandwidthEstimation - v29 >= 0x2EF)
  {
    ++self->_totalSuddenBandwidthDropCount;
  }
  self->_unsigned int lastReportedBandwidthEstimation = v29;
  CFStringRef v31 = CFStringCreateWithFormat(v5, 0, @"%u", self->_totalSuddenBandwidthDropCount);
  CFDictionaryAddValue(a3, @"SBWD", v31);
  CFRelease(v31);
  if ([(VCRateControlAlgorithm *)self->_rateControlAlgorithm didMBLRampDown]) {
    ++self->_totalMBLRampDownCount;
  }
  [(VCRateControlAlgorithm *)self->_rateControlAlgorithm setDidMBLRampDown:0];
  CFStringRef v32 = CFStringCreateWithFormat(v5, 0, @"%u", self->_totalMBLRampDownCount);
  CFDictionaryAddValue(a3, @"RDMBL", v32);
  CFRelease(v32);
  [(AVCBasebandCongestionDetector *)self->_basebandCongestionDetector basebandExpectedQueuingDelay];
  CFStringRef v34 = CFStringCreateWithFormat(v5, 0, @"%u", (v33 * 1000.0));
  CFDictionaryAddValue(a3, @"BbD", v34);
  CFRelease(v34);
  CFStringRef v35 = CFStringCreateWithFormat(v5, 0, @"%u", [(AVCBasebandCongestionDetector *)self->_basebandCongestionDetector basebandQueueDepth]);
  CFDictionaryAddValue(a3, @"BbQ", v35);
  CFRelease(v35);
  CFStringRef v36 = CFStringCreateWithFormat(v5, 0, @"%5.1f", (double)[(AVCBasebandCongestionDetector *)self->_basebandCongestionDetector basebandAverageBitrate]/ 1000.0);
  CFDictionaryAddValue(a3, @"BbTx", v36);
  CFRelease(v36);
  CFStringRef v37 = CFStringCreateWithFormat(v5, 0, @"%5.1f", (double)[(AVCBasebandCongestionDetector *)self->_basebandCongestionDetector basebandTxBitrate]/ 1000.0);
  CFDictionaryAddValue(a3, @"InTxR", v37);
  CFRelease(v37);
  unsigned int v38 = [(VCRateControlMediaController *)self->_mediaController basebandFlushedVideoCount];
  unsigned int v39 = [(VCRateControlMediaController *)self->_mediaController basebandFlushedAudioCount];
  CFStringRef v40 = CFStringCreateWithFormat(v5, 0, @"%u", v38 - self->_lastReportFlushedVideoPacketCount);
  CFDictionaryAddValue(a3, @"VPF", v40);
  CFRelease(v40);
  CFStringRef v41 = CFStringCreateWithFormat(v5, 0, @"%u", v39 - self->_lastReportFlushedAudioPacketCount);
  CFDictionaryAddValue(a3, @"APF", v41);
  CFRelease(v41);
  CFStringRef v42 = CFStringCreateWithFormat(v5, 0, @"%u", self->_remotePacketReceivedAudio);
  CFDictionaryAddValue(a3, @"APRR", v42);
  CFRelease(v42);
  CFStringRef v43 = CFStringCreateWithFormat(v5, 0, @"%u", self->_remoteECT1ReceiveCount);
  CFDictionaryAddValue(a3, @"ECT1Cnt", v43);
  CFRelease(v43);
  CFStringRef v44 = CFStringCreateWithFormat(v5, 0, @"%u", self->_remoteCEReceiveCount);
  CFDictionaryAddValue(a3, @"CECnt", v44);
  CFRelease(v44);
  CFStringRef v45 = CFStringCreateWithFormat(v5, 0, @"%u", self->_isCongestedForReport);
  CFDictionaryAddValue(a3, @"NWCng", v45);
  CFRelease(v45);
  if ([(VCRateControlAlgorithm *)self->_rateControlAlgorithm bytesInFlightState] != -1)
  {
    CFStringRef v46 = CFStringCreateWithFormat(v5, 0, @"%u", [(VCRateControlAlgorithm *)self->_rateControlAlgorithm bytesInFlightState] == 0);
    CFDictionaryAddValue(a3, @"BIFCng", v46);
    CFRelease(v46);
  }
  CFStringRef v47 = CFStringCreateWithFormat(v5, 0, @"%u", [(VCRateControlAlgorithm *)self->_rateControlAlgorithm isLossBasedAdaptationOn]);
  CFDictionaryAddValue(a3, @"ULLBA", v47);
  CFRelease(v47);
  if (VCMediaControlInfo_IsLossStatsEnabled([(AVCStatisticsCollector *)self->_statisticsCollector mediaControlInfoFECFeedbackVersion]))
  {
    uint64_t remotePacketReceivedVideo = 0;
  }
  else
  {
    uint64_t remotePacketReceivedVideo = self->_remotePacketReceivedVideo;
  }
  CFStringRef v49 = CFStringCreateWithFormat(v5, 0, @"%u", remotePacketReceivedVideo);
  CFDictionaryAddValue(a3, @"VPRR", v49);
  CFRelease(v49);
  self->_lastReportFlushedVideoPacketCount = v38;
  self->_lastReportFlushedAudioPacketCount = v39;
}

- (void)deregisterPeriodicTask
{
}

- (void)setShareProfile:(id)a3
{
  uint64_t v4 = [a3 rateSharingCount];
  rateControlAlgorithm = self->_rateControlAlgorithm;

  [(VCRateControlAlgorithm *)rateControlAlgorithm setRateSharingCount:v4];
}

- (BOOL)isStarted
{
  return [(AVCStatisticsCollector *)self->_statisticsCollector isStarted];
}

- (void)configureWithOperatingMode:(int)a3 isLocalCellular:(BOOL)a4 localCellTech:(int)a5 isRemoteCellular:(BOOL)a6 remoteCellTech:(int)a7 bitrateCapKbps:(unsigned int)a8 isTrafficBursty:(BOOL)a9 featureFlags:(unsigned int)a10
{
  uint64_t v11 = *(void *)&a7;
  BOOL v12 = a6;
  uint64_t v13 = *(void *)&a5;
  BOOL v14 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  memset(v19, 0, sizeof(v19));
  v16[0] = [(AVCRateController *)self rateControlModeFromAVConferenceOperatingMode:*(void *)&a3];
  v16[1] = [(AVCRateController *)self radioAccessTechnologyFromAVConferenceCellTech:v13 isCellular:v14];
  v16[2] = [(AVCRateController *)self radioAccessTechnologyFromAVConferenceCellTech:v11 isCellular:v12];
  v16[3] = 1000 * a8;
  uint64_t v17 = 0;
  BOOL v18 = a9;
  unsigned int v20 = [(AVCRateController *)self loadDefaultVCRCFeatureFlags:a10];
  int v21 = 0;
  [(AVCRateController *)self configure:v16];
}

- (void)setTargetBitrateCap:(unsigned int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    double v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int targetBitrateCap = self->_targetBitrateCap;
      *(_DWORD *)CFStringRef v10 = 136316418;
      *(void *)&v10[4] = v5;
      *(_WORD *)uint64_t v11 = 2080;
      *(void *)&v11[2] = "-[AVCRateController setTargetBitrateCap:]";
      *(_WORD *)&v11[10] = 1024;
      *(_DWORD *)&v11[12] = 1000;
      *(_WORD *)&v11[16] = 2048;
      *(void *)&v11[18] = self;
      *(_WORD *)&v11[26] = 1024;
      *(_DWORD *)&v11[28] = targetBitrateCap;
      *(_WORD *)&v11[32] = 1024;
      *(_DWORD *)&v11[34] = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d (%p) AVCRateController target bitrate cap %d -> %d", v10, 0x32u);
    }
  }
  self->_unsigned int targetBitrateCap = a3;
  *(void *)CFStringRef v10 = *(void *)&self->_configuration.mode;
  unsigned int remoteRadioAccessTechnology = self->_configuration.remoteRadioAccessTechnology;
  long long v9 = *(_OWORD *)&self->_configuration.algorithmConfig;
  *(_OWORD *)&v11[4] = *(_OWORD *)&self->_configuration.minBitrate;
  *(_OWORD *)&v11[20] = v9;
  *(_DWORD *)&v10[8] = remoteRadioAccessTechnology;
  *(_DWORD *)uint64_t v11 = a3;
  [(AVCRateController *)self configure:v10];
}

- (void)setEstimatedBandwidthCap:(unsigned int)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((self->_configuration.mode & 0xFFFFFFFE) == 4)
    {
      uint64_t v5 = 7;
      do
        unsigned int v6 = vcRateControlTierBitrates[v5++];
      while (v6 < a3);
    }
    else
    {
      uint64_t v5 = 0;
      do
        unsigned int v8 = vcRateControlTierBitrates[v5++];
      while (v8 < a3);
    }
    int v9 = v5 - 1;
    if (v9 >= 31) {
      int v9 = 31;
    }
    if (v9 < 30) {
      ++v9;
    }
    unsigned int v7 = vcRateControlTierBitrates[v9];
  }
  else
  {
    unsigned int v7 = 0;
  }
  self->_unsigned int estimatedBandwidthCap = v7;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int estimatedBandwidthCap = self->_estimatedBandwidthCap;
      int v13 = 136316418;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      uint64_t v16 = "-[AVCRateController setEstimatedBandwidthCap:]";
      __int16 v17 = 1024;
      int v18 = 1027;
      __int16 v19 = 2048;
      unsigned int v20 = self;
      __int16 v21 = 1024;
      unsigned int v22 = a3;
      __int16 v23 = 1024;
      unsigned int v24 = estimatedBandwidthCap;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d (%p) AVCRateController bandwidth estimation cap %d -> %d", (uint8_t *)&v13, 0x32u);
    }
  }
  [(AVCStatisticsCollector *)self->_statisticsCollector setEstimatedBandwidthCap:self->_estimatedBandwidthCap];
}

- (void)setExpectedBitrate:(unsigned int)a3
{
  self->_expectedBitrate = a3;
  -[AVCStatisticsCollector setExpectedBitrate:](self->_statisticsCollector, "setExpectedBitrate:");
}

- (void)registerForRateSharing:(unsigned int)a3
{
  p_registrationLock = &self->_registrationLock;
  os_unfair_lock_lock(&self->_registrationLock);
  if (a3 != 8 || self->_isRegisteredForRateSharing)
  {
  }
  else
  {
    sharingGroup = self->_sharingGroup;
    if (sharingGroup)
    {
      self->_isRegisteredForRateSharing = [(VCRateSharingGroup *)sharingGroup registerRateSharingClient:self forInterfaceType:0];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCRateController registerForRateSharing:]();
      }
    }
  }
  os_unfair_lock_unlock(p_registrationLock);
}

- (void)deregisterForRateSharing
{
  p_registrationLock = &self->_registrationLock;
  os_unfair_lock_lock(&self->_registrationLock);
  if (self->_isRegisteredForRateSharing)
  {
    [(VCRateSharingGroup *)self->_sharingGroup deregisterRateSharingClient:self];
    self->_isRegisteredForRateSharing = 0;
  }

  os_unfair_lock_unlock(p_registrationLock);
}

- (unsigned)loadDefaultVCRCFeatureFlags:(unsigned int)a3
{
  if (VCDefaults_GetBoolValueForKey(@"disableBasebandAdaptation", 0)) {
    int v4 = 957;
  }
  else {
    int v4 = 445;
  }
  unsigned int v5 = v4 | a3;
  if (VCDefaults_GetBoolValueForKey(@"enableRampDownSuppression", 0)) {
    v5 |= 0x400u;
  }
  if (VCDefaults_GetBoolValueForKey(@"enableBlockRampUpInBluetoothCoex", 0)) {
    v5 |= 0x800u;
  }
  if (VCDefaults_GetBoolValueForKey(@"enableRampDownToActualSendBitrate", 0)) {
    v5 |= 0x1000u;
  }
  if (VCDefaults_GetBoolValueForKey(@"enableRampDownUsingPLRThreshold", 1)) {
    return v5 | 0x2000;
  }
  else {
    return v5;
  }
}

- (void)setBtNotificationMonitor
{
  v5[6] = *MEMORY[0x1E4F143B8];
  if (self->_useBTNotificationMonitor)
  {
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3052000000;
    v5[3] = __Block_byref_object_copy_;
    v5[4] = __Block_byref_object_dispose_;
    v5[5] = self;
    unint64_t v3 = +[VCBTNotificationMonitor sharedInstance];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45__AVCRateController_setBtNotificationMonitor__block_invoke;
    v4[3] = &unk_1E6DB3FF0;
    v4[4] = v5;
    self->_btNotificationHandlerIndex = [(VCBTNotificationMonitor *)v3 registerBTNotificationHandler:v4];
    _Block_object_dispose(v5, 8);
  }
}

void __45__AVCRateController_setBtNotificationMonitor__block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setPaused:1];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    unsigned int v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v7 = *a2;
      uint64_t v8 = a2[1];
      int v9 = 136316418;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      uint64_t v12 = "-[AVCRateController setBtNotificationMonitor]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 1101;
      __int16 v15 = 2048;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      uint64_t v18 = v7;
      __int16 v19 = 1024;
      int v20 = v8;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d [%p] Pause rate controller for 5 seconds, BT device %s state=%d while WLAN's on 2.4GHz", (uint8_t *)&v9, 0x36u);
    }
  }
}

- (unsigned)rateControlModeFromAVConferenceOperatingMode:(int)a3
{
  unsigned int result = 2;
  switch(a3)
  {
    case 1:
    case 4:
      unsigned int result = 1;
      break;
    case 2:
    case 7:
      return result;
    case 6:
      if (self->_isUplink) {
        unsigned int result = 4;
      }
      else {
        unsigned int result = 5;
      }
      break;
    default:
      unsigned int result = 0;
      break;
  }
  return result;
}

- (unsigned)radioAccessTechnologyFromAVConferenceCellTech:(int)a3 isCellular:(BOOL)a4
{
  if (!a4) {
    return 1;
  }
  if ((a3 - 1) > 8) {
    return 0;
  }
  return dword_1E259BEE0[a3 - 1];
}

- (void)createBasebandLogDumpFile
{
  if (self->_isRateControlDumpFileEnabled)
  {
    unsigned int mode = self->_configuration.mode;
    uint64_t v4 = "VCRateControl";
    if (mode == 5) {
      uint64_t v4 = "VCRC-DL";
    }
    if (mode == 4) {
      unsigned int v5 = "VCRC-UL";
    }
    else {
      unsigned int v5 = v4;
    }
    uint64_t v6 = VRLogfileAlloc(0, (uint64_t)[(NSString *)self->_dumpID UTF8String], (uint64_t)v5, (uint64_t)".bbdump", "com.apple.VideoConference.VCRClogBB", 9);
    self->_logBasebandDump = v6;
    VRLogfilePrintSync(v6, "STime\t\tV-R-A-F-T\tQD\tQD2\tXmitB\tLTxTS\tIBR\tIBR_OLD\tABRS\tABRL\tBDS\tBDCD\tNBDCD\tND\tTR\tAF\n", v7, v8, v9, v10, v11, v12, v14);
  }
}

- (void)createNWConnectionLogDumpFile
{
  if (self->_isRateControlDumpFileEnabled)
  {
    unint64_t v3 = VRLogfileAlloc(0, (uint64_t)[(NSString *)self->_dumpID UTF8String], (uint64_t)"VCRateControl", (uint64_t)".nwdump", "com.apple.VideoConference.VCRClogNW", 9);
    self->_logNWDump = v3;
    VRLogfilePrintSync(v3, "STime\taTime\tTxTS\tVersion\tDirection\tTech\tByteCount\tQSize1\tQSize2\tDelay\tThroughput\tTxRate\tRateTrend\tFrequentScans\n", v4, v5, v6, v7, v8, v9, v11);
  }
}

- (void)releaseAllLogDumpFiles
{
  [(AVCRateController *)self releaseLogDumpFile:&self->_logDump];
  [(AVCRateController *)self releaseLogDumpFile:&self->_logFeedbackDump];
  [(AVCRateController *)self releaseLogDumpFile:&self->_logBasebandDump];
  [(AVCRateController *)self releaseLogDumpFile:&self->_logNWDump];

  [(AVCRateController *)self releaseLogDumpFile:&self->_logBWEDump];
}

- (void)releaseLogDumpFile:(void *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*a3)
  {
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    void v11[6] = v4;
    v11[7] = v4;
    v11[4] = v4;
    v11[5] = v4;
    v11[2] = v4;
    v11[3] = v4;
    v11[0] = v4;
    v11[1] = v4;
    micro();
    VRLogfileGetTimestamp((char *)v11, 0x80u);
    VRLogfilePrintSync((FILE **)*a3, "%s\t%8.3f\tEndOfFile\n", v5, v6, v7, v8, v9, v10, (char)v11);
    VRLogfileFree((uint64_t *)a3);
    *a3 = 0;
  }
}

- (void)printRateControllerHealthPrint
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if ([(AVCRateController *)self isStarted])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      long long v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int mode = self->_configuration.mode;
        unsigned int v6 = self->_targetBitrate / 0x3E8;
        unsigned int v7 = self->_configuration.maxBitrate / 0x3E8;
        unsigned int v8 = self->_actualBitrate / 0x3E8;
        unsigned int v9 = [(AVCStatisticsCollector *)self->_statisticsCollector sharedRemoteEstimatedBandwidth]/ 0x3E8;
        unsigned int v10 = [(AVCStatisticsCollector *)self->_statisticsCollector sharedEstimatedBandwidth]
            / 0x3E8;
        unsigned int roundTripTimeMilliseconds = self->_roundTripTimeMilliseconds;
        unsigned int owrd = self->_owrd;
        unsigned int v13 = self->_configuration.mode;
        char v14 = "Uplink PLR=";
        if (v13 == 5) {
          char v14 = "Downlink PLR=";
        }
        if (v13 == 1) {
          __int16 v15 = "APLR=";
        }
        else {
          __int16 v15 = v14;
        }
        double packetLossPercentage = self->_packetLossPercentage;
        if (v13 == 1) {
          __int16 v17 = "VPLR=";
        }
        else {
          __int16 v17 = "";
        }
        double packetLossPercentageVideo = self->_packetLossPercentageVideo;
        unsigned int remoteECT1ReceiveCount = self->_remoteECT1ReceiveCount;
        unsigned int remoteCEReceiveCount = self->_remoteCEReceiveCount;
        unsigned int targetBitrateTier = self->_targetBitrateTier;
        if (targetBitrateTier) {
          unsigned int targetBitrateTier = self->_targetBitrate - targetBitrateTier;
        }
        int v22 = 136319746;
        uint64_t v23 = v3;
        __int16 v24 = 2080;
        uint64_t v25 = "-[AVCRateController printRateControllerHealthPrint]";
        __int16 v26 = 1024;
        int v27 = 3037;
        __int16 v28 = 2048;
        unsigned int v29 = self;
        __int16 v30 = 1024;
        unsigned int v31 = mode;
        __int16 v32 = 1024;
        unsigned int v33 = v6;
        __int16 v34 = 1024;
        unsigned int v35 = v7;
        __int16 v36 = 1024;
        unsigned int v37 = v8;
        __int16 v38 = 1024;
        unsigned int v39 = v9;
        __int16 v40 = 1024;
        unsigned int v41 = v10;
        __int16 v42 = 1024;
        unsigned int v43 = roundTripTimeMilliseconds;
        __int16 v44 = 1024;
        unsigned int v45 = owrd;
        __int16 v46 = 2080;
        CFStringRef v47 = v15;
        __int16 v48 = 2048;
        double v49 = packetLossPercentage;
        __int16 v50 = 2080;
        v51 = v17;
        __int16 v52 = 2048;
        double v53 = packetLossPercentageVideo;
        __int16 v54 = 1024;
        unsigned int v55 = remoteECT1ReceiveCount;
        __int16 v56 = 1024;
        unsigned int v57 = remoteCEReceiveCount;
        __int16 v58 = 1024;
        unsigned int v59 = targetBitrateTier;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d @=@ Health: VCRC (%p) mode=%d, targetBitrate=%u kbps, bitrateCap=%u kbps, actualBitrate=%u kbps, RemoteBWE=%u kbps, LocalBWE=%u kbps, RTT=%u ms, OWRD=%u ms, %s%.2f%%, %s%.2f%%, ect1Count=%u, ceCount=%u, extraTargetBitrate=%u", (uint8_t *)&v22, 0x90u);
      }
    }
  }
}

- (AVCBasebandCongestionDetector)basebandCongestionDetector
{
  return self->_basebandCongestionDetector;
}

- (void)setBasebandCongestionDetector:(id)a3
{
}

- (VCNWConnectionCongestionDetector)nwConnectionCongestionDetector
{
  return self->_nwConnectionCongestionDetector;
}

- (void)setNwConnectionCongestionDetector:(id)a3
{
}

- (AVCRateControlFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (void)setFeedbackController:(id)a3
{
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
}

- (VCRateControlMediaController)mediaController
{
  return self->_mediaController;
}

- (void)setMediaController:(id)a3
{
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (AVCRateControlConfig)configuration
{
  long long v3 = *(_OWORD *)&self[1].isTrafficBursty;
  *(_OWORD *)&retstr->unsigned int mode = *(_OWORD *)&self[1].remoteRadioAccessTechnology;
  *(_OWORD *)&retstr->unsigned int minBitrate = v3;
  *(_OWORD *)&retstr->algorithmConfig = *(_OWORD *)&self[1].featureFlags;
  return self;
}

- (unsigned)targetBitrateCap
{
  return self->_targetBitrateCap;
}

- (unsigned)estimatedBandwidthCap
{
  return self->_estimatedBandwidthCap;
}

- (unsigned)expectedBitrate
{
  return self->_expectedBitrate;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (unsigned)nwNotificationProcessed
{
  return self->_nwNotificationProcessed;
}

- (unsigned)maxTargetBitrate
{
  return self->_maxTargetBitrate;
}

- (unsigned)minTargetBitrate
{
  return self->_minTargetBitrate;
}

- (VCRateControlTrafficMetricCollector)trafficMetricCollector
{
  return self->_trafficMetricCollector;
}

- (id)reportingAgent
{
  return self->_reportingAgent;
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_2(uint64_t a1, _DWORD *a2)
{
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_3(uint64_t a1, uint64_t a2)
{
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_4(uint64_t a1, int *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v3 = *(void **)(a1 + 32);
  if (*a2 == 14)
  {
    _AVCRateController_DoRateControl((uint64_t)v3, (uint64_t)a2);
    _AVCRateController_NotifyTargetBitrateChange((uint64_t)v3);
  }
  else if (objc_opt_class() == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_4_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v4 = (__CFString *)[v3 performSelector:sel_logPrefix];
    }
    else {
      long long v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      unsigned int v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v7 = *a2;
        int v8 = 136316418;
        uint64_t v9 = v5;
        __int16 v10 = 2080;
        char v11 = "_AVCRateController_DoRateControlWithLocalRCEvent";
        __int16 v12 = 1024;
        int v13 = 2622;
        __int16 v14 = 2112;
        __int16 v15 = v4;
        __int16 v16 = 2048;
        __int16 v17 = v3;
        __int16 v18 = 1024;
        int v19 = v7;
        _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, "AVCRC [%s] %s:%d %@(%p) Wrong statistics type=%d", (uint8_t *)&v8, 0x36u);
      }
    }
  }
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_6(uint64_t a1, uint64_t a2)
{
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_8(uint64_t a1, _DWORD *a2)
{
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_10(uint64_t a1, uint64_t a2)
{
}

void ___AVCRateController_SetupDelayedReportingSmartBrake_block_invoke(uint64_t a1)
{
  uint64_t v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    long long v3 = (const void *)v2;
    int v4 = [*(id *)(v2 + 1808) targetBitrate];
    unsigned int v5 = *(_DWORD *)(a1 + 48);
    if (v5) {
      unsigned int v6 = 100 * v4 / v5;
    }
    else {
      unsigned int v6 = -1;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
    CFRelease(v3);
  }
}

void ___AVCRateController_SetupDelayedReportingSmartBrake_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    long long v3 = (const void *)v2;
    int v4 = [*(id *)(v2 + 1808) targetBitrate];
    unsigned int v5 = *(_DWORD *)(a1 + 48);
    if (v5) {
      unsigned int v6 = 100 * v4 / v5;
    }
    else {
      unsigned int v6 = -1;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
    CFRelease(v3);
  }
}

void ___AVCRateController_SetupDelayedReportingSmartBrake_block_invoke_3(uint64_t a1)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    long long v3 = (const void *)v2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 100
                                                                * [*(id *)(v2 + 1808) targetBitrate]/ *(_DWORD *)(a1 + 64);
    uint64_t v4 = *(unsigned int *)(a1 + 68);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v7 = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v8 = *(unsigned int *)(*(void *)(v5 + 8) + 24);
    v9[0] = @"CongestionIndex";
    v10[0] = [NSNumber numberWithUnsignedInt:v4];
    v9[1] = @"BWETTxRRatio5";
    v10[1] = [NSNumber numberWithUnsignedInt:v6];
    v9[2] = @"BWETTxRRatio15";
    v10[2] = [NSNumber numberWithUnsignedInt:v7];
    v9[3] = @"BWETTxRRatio30";
    v10[3] = [NSNumber numberWithUnsignedInt:v8];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
    reportingGenericEvent();
    CFRelease(v3);
  }
}

- (void)start
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "AVCRC [%s] %s:%d (%p) Cannot load and retain reportingAgent successfully!", v2, v3, v4, v5);
}

- (void)registerForRateSharing:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCRC [%s] %s:%d Failed to register for rate sharing due to nil sharing group", v2, v3, v4, v5, v6);
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "AVCRC [%s] %s:%d Wrong statistics type=%d", v2, v3, v4, v5);
}

@end