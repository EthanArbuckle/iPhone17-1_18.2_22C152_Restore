@interface VCRedundancyControllerVideo
- (AVCStatisticsCollector)statisticsCollector;
- (NSArray)fecLevelPerFrameSizeVector;
- (VCRedundancyControllerVideo)initWithDelegate:(id)a3 mode:(unsigned int)a4 parameters:(VCRedundancyControllerVideoParameters_t)a5;
- (unint64_t)statisticsID;
- (void)dealloc;
- (void)loadDefaultSettings;
- (void)reportRedundancyPercentage:(unsigned int)a3 redundancyInterval:(double)a4;
- (void)resetNetworkStatistics;
- (void)resetRedundancyStrategy:(id *)a3;
- (void)setBtNotificationMonitor;
- (void)setStatisticsID:(unint64_t)a3;
- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3;
@end

@implementation VCRedundancyControllerVideo

- (VCRedundancyControllerVideo)initWithDelegate:(id)a3 mode:(unsigned int)a4 parameters:(VCRedundancyControllerVideoParameters_t)a5
{
  uint64_t v5 = *(void *)&a5.var1;
  id var0 = a5.var0;
  uint64_t v7 = *(void *)&a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)VCRedundancyControllerVideo;
  v9 = [(VCRedundancyControllerVideo *)&v30 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_28;
  }
  objc_storeWeak(&v9->_redundancyControllerDelegate, a3);
  if ((v5 & 0x100000000) != 0)
  {
    v12 = [[AVCStatisticsCollector alloc] initForSimulation:0 useExternalThread:1];
    v10->_statisticsCollector = v12;
    if (v12)
    {
      [(AVCStatisticsCollector *)v12 setMediaControlInfoFECFeedbackVersion:BYTE5(v5)];
      v10->_isUsingInternalStatisticsCollector = 1;
      [(AVCStatisticsCollector *)v10->_statisticsCollector start];
      statisticsCollector = v10->_statisticsCollector;
      goto LABEL_6;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:](v25, v26);
      }
    }
LABEL_28:

    return 0;
  }
  statisticsCollector = (AVCStatisticsCollector *)var0;
  v10->_statisticsCollector = statisticsCollector;
LABEL_6:
  v10->_mode = v7;
  v10->_uint64_t type = 0;
  v10->_btNotificationHandlerIndex = -1;
  v10->_mediaControlInfoFECFeedbackVersion = [(AVCStatisticsCollector *)statisticsCollector mediaControlInfoFECFeedbackVersion];
  RSUtil_SetOptimizationMode(objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-fec-vectorization-enabled", @"isRSUOptimizationEnabled", &unk_1F3DC30F0, 0), "integerValue"));
  v10->_isNWConnectionEnabled = _os_feature_enabled_impl();
  switch(v10->_mode)
  {
    case 0u:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v32 = v15;
          __int16 v33 = 2080;
          v34 = "-[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]";
          __int16 v35 = 1024;
          int v36 = 82;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Video redundancy is disabled.", buf, 0x1Cu);
        }
      }
      break;
    case 5u:
    case 6u:
      v13 = [[VCRedundancyControlAlgorithmVideo alloc] initWithRedundancyControllerMode:v7 maxAllowedRedundancyPercentage:v5 mediaControlInfoFECFeedbackVersion:v10->_mediaControlInfoFECFeedbackVersion];
      char v14 = 0;
      v10->_algorithm = (VCRedundancyControlAlgorithm *)v13;
      v10->_uint64_t type = 3;
      goto LABEL_20;
    case 7u:
      v19 = VCRedundancyControlAlgorithmVideoMultiway;
      goto LABEL_16;
    case 8u:
      v19 = VCRedundancyControlAlgorithmVideoIpadCompanion;
LABEL_16:
      v10->_algorithm = (VCRedundancyControlAlgorithm *)objc_alloc_init(v19);
      int v20 = 3;
      goto LABEL_18;
    case 9u:
      v10->_algorithm = (VCRedundancyControlAlgorithm *)[[VCRedundancyControlAlgorithmVideo alloc] initWithRedundancyControllerMode:v7 maxAllowedRedundancyPercentage:v5 mediaControlInfoFECFeedbackVersion:v10->_mediaControlInfoFECFeedbackVersion];
      int v20 = 13;
LABEL_18:
      v10->_uint64_t type = v20;
      break;
    default:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:](v17, (int *)&v10->_mode, v18);
        }
      }
      break;
  }
  char v14 = 1;
LABEL_20:
  uint64_t v21 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:v10];
  v22 = v10->_statisticsCollector;
  uint64_t type = v10->_type;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __64__VCRedundancyControllerVideo_initWithDelegate_mode_parameters___block_invoke;
  v29[3] = &unk_1E6DB3FA8;
  v29[4] = v21;
  [(AVCStatisticsCollector *)v22 registerStatisticsChangeHandlerWithType:type handler:v29];
  if ((v14 & 1) == 0 && v10->_isNWConnectionEnabled)
  {
    v24 = v10->_statisticsCollector;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __64__VCRedundancyControllerVideo_initWithDelegate_mode_parameters___block_invoke_2;
    v28[3] = &unk_1E6DB3FA8;
    v28[4] = v21;
    [(AVCStatisticsCollector *)v24 registerStatisticsChangeHandlerWithType:11 handler:v28];
  }
  if (_os_feature_enabled_impl()) {
    [(VCRedundancyControllerVideo *)v10 setBtNotificationMonitor];
  }
  return v10;
}

void __64__VCRedundancyControllerVideo_initWithDelegate_mode_parameters___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak]);
  long long v4 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v4;
  uint64_t v11 = *(void *)(a2 + 192);
  long long v5 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v5;
  long long v6 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v8;
  long long v9 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v9;
  [v3 updateRedundancyStrategyWithNetworkStatistics:v10];
  if (v3) {
    CFRelease(v3);
  }
}

void __64__VCRedundancyControllerVideo_initWithDelegate_mode_parameters___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak]);
  long long v4 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v4;
  uint64_t v11 = *(void *)(a2 + 192);
  long long v5 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v5;
  long long v6 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v8;
  long long v9 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v9;
  [v3 updateRedundancyStrategyWithNetworkStatistics:v10];
  if (v3) {
    CFRelease(v3);
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->_isUsingInternalStatisticsCollector) {
    [(AVCStatisticsCollector *)self->_statisticsCollector stop];
  }
  [+[VCBTNotificationMonitor sharedInstance] unregisterBTNotificationHandler:self->_btNotificationHandlerIndex];
  self->_btNotificationHandlerIndex = -1;
  objc_storeWeak(&self->_redundancyControllerDelegate, 0);

  v3.receiver = self;
  v3.super_class = (Class)VCRedundancyControllerVideo;
  [(VCRedundancyControllerVideo *)&v3 dealloc];
}

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_type == 3 && (unint64_t v5 = a3->var0.network.statisticsID) != 0 && v5 != self->_statisticsID)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E4F47A50];
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t statisticsID = self->_statisticsID;
          unint64_t v19 = a3->var0.network.statisticsID;
          *(_DWORD *)v22 = 136316162;
          *(void *)&v22[4] = v15;
          *(_WORD *)&v22[12] = 2080;
          *(void *)&v22[14] = "-[VCRedundancyControllerVideo updateRedundancyStrategyWithNetworkStatistics:]";
          *(_WORD *)&v22[22] = 1024;
          *(_DWORD *)&v22[24] = 135;
          *(_WORD *)&v22[28] = 2048;
          *(void *)&v22[30] = statisticsID;
          *(_WORD *)&v22[38] = 2048;
          *(void *)&v22[40] = v19;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Filter out statistics not belong to this redundancyController with id:%llu, statisticsID:%llu", v22, 0x30u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v20 = self->_statisticsID;
        unint64_t v21 = a3->var0.network.statisticsID;
        *(_DWORD *)v22 = 136316162;
        *(void *)&v22[4] = v15;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[VCRedundancyControllerVideo updateRedundancyStrategyWithNetworkStatistics:]";
        *(_WORD *)&v22[22] = 1024;
        *(_DWORD *)&v22[24] = 135;
        *(_WORD *)&v22[28] = 2048;
        *(void *)&v22[30] = v20;
        *(_WORD *)&v22[38] = 2048;
        *(void *)&v22[40] = v21;
        _os_log_debug_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Filter out statistics not belong to this redundancyController with id:%llu, statisticsID:%llu", v22, 0x30u);
      }
    }
  }
  else
  {
    algorithm = self->_algorithm;
    long long v7 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    long long v30 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    long long v31 = v7;
    uint64_t v32 = *((void *)&a3->var0.localRCEvent + 21);
    long long v8 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    long long v26 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    long long v27 = v8;
    long long v9 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    long long v28 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    long long v29 = v9;
    long long v10 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    *(_OWORD *)&v22[32] = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    long long v23 = v10;
    long long v11 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    long long v24 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    long long v25 = v11;
    long long v12 = *(_OWORD *)&a3->isVCRCInternal;
    *(_OWORD *)v22 = *(_OWORD *)&a3->type;
    *(_OWORD *)&v22[16] = v12;
    [(VCRedundancyControlAlgorithm *)algorithm updateRedundancyStrategyWithNetworkStatistics:v22];
    int type = self->_type;
    if (type == 13 || type == 3)
    {
      uint64_t v14 = [(VCRedundancyControlAlgorithm *)self->_algorithm redundancyPercentage];
      [(VCRedundancyControlAlgorithm *)self->_algorithm redundancyInterval];
      -[VCRedundancyControllerVideo reportRedundancyPercentage:redundancyInterval:](self, "reportRedundancyPercentage:redundancyInterval:", v14);
    }
  }
}

- (void)resetNetworkStatistics
{
}

- (void)reportRedundancyPercentage:(unsigned int)a3 redundancyInterval:(double)a4
{
  LODWORD(v5) = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(VCRedundancyControllerVideo *)self loadDefaultSettings];
  int forceRedundancyPercentage = self->_forceRedundancyPercentage;
  if (forceRedundancyPercentage >= 0) {
    uint64_t v5 = forceRedundancyPercentage;
  }
  else {
    uint64_t v5 = v5;
  }
  if (self->_currentRedundancyPercentage != v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      long long v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int currentRedundancyPercentage = self->_currentRedundancyPercentage;
        unsigned int mode = self->_mode;
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCRedundancyControllerVideo reportRedundancyPercentage:redundancyInterval:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 169;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = currentRedundancyPercentage;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = v5;
        *(_WORD *)&buf[40] = 1024;
        *(_DWORD *)&buf[42] = mode;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Video redundancy percentage changed from %d to %d with mode %d", buf, 0x2Eu);
      }
    }
    self->_unsigned int currentRedundancyPercentage = v5;
    long long v12 = (void *)MEMORY[0x1E4E56580](&self->_redundancyControllerDelegate);
    [v12 redundancyController:self redundancyPercentageDidChange:v5];
    if (v12) {
      CFRelease(v12);
    }
  }
  if (a4 != 0.0 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCRedundancyControllerVideo reportRedundancyPercentage:redundancyInterval:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 177;
      *(_WORD *)&buf[28] = 2048;
      *(double *)&buf[30] = a4;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Video redundancy interval %f, which should be 0 since we don't support cross-frame FEC yet", buf, 0x26u);
    }
  }
  if (VCMediaControlInfo_IsLossStatsEnabled(self->_mediaControlInfoFECFeedbackVersion))
  {
    __int16 v22 = -21846;
    *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&buf[32] = v15;
    long long v21 = v15;
    *(_OWORD *)buf = v15;
    *(_OWORD *)&buf[16] = v15;
    algorithm = self->_algorithm;
    if (algorithm)
    {
      [(VCRedundancyControlAlgorithm *)algorithm getFecLevelPerFrameSizeVector];
      if (*(_WORD *)buf)
      {
        uint64_t v17 = (void *)MEMORY[0x1E4E56580](&self->_redundancyControllerDelegate);
        if (objc_opt_respondsToSelector())
        {
          v18[2] = *(_OWORD *)&buf[32];
          v18[3] = v21;
          __int16 v19 = v22;
          v18[0] = *(_OWORD *)buf;
          v18[1] = *(_OWORD *)&buf[16];
          [v17 redundancyController:self redundancyVectorDidChange:v18];
        }
        if (v17) {
          CFRelease(v17);
        }
      }
    }
  }
}

- (void)loadDefaultSettings
{
  double v3 = micro();
  if (v3 - self->_lastDefaultSettingLoadingTime > 3.0)
  {
    self->_int forceRedundancyPercentage = [+[VCDefaults sharedInstance] redundancyControlForceVideoRedundancyPercentage];
    self->_lastDefaultSettingLoadingTime = v3;
  }
}

- (void)setBtNotificationMonitor
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = __Block_byref_object_copy__2;
  v5[4] = __Block_byref_object_dispose__2;
  v5[5] = self;
  double v3 = +[VCBTNotificationMonitor sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__VCRedundancyControllerVideo_setBtNotificationMonitor__block_invoke;
  v4[3] = &unk_1E6DB3FF0;
  v4[4] = v5;
  self->_btNotificationHandlerIndex = [(VCBTNotificationMonitor *)v3 registerBTNotificationHandler:v4];
  _Block_object_dispose(v5, 8);
}

uint64_t __55__VCRedundancyControllerVideo_setBtNotificationMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) resetRedundancyStrategy:a2];
}

- (void)resetRedundancyStrategy:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((VCRedundancyControllerVideo *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      long long v7 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      id var0 = a3->var0;
      unint64_t var1 = a3->var1;
      *(_DWORD *)uint64_t v17 = 136316162;
      *(void *)&v17[4] = v6;
      *(_WORD *)&v17[12] = 2080;
      *(void *)&v17[14] = "-[VCRedundancyControllerVideo resetRedundancyStrategy:]";
      *(_WORD *)&v17[22] = 1024;
      LODWORD(v18) = 210;
      WORD2(v18) = 2080;
      *(void *)((char *)&v18 + 6) = var0;
      HIWORD(v18) = 1024;
      LODWORD(v19) = var1;
      long long v10 = " [%s] %s:%d Reset redundancy strategy, BT device %s state=%d while WLAN's on 2.4GHz";
      long long v11 = v7;
      uint32_t v12 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCRedundancyControllerVideo *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      long long v15 = a3->var0;
      unint64_t v16 = a3->var1;
      *(_DWORD *)uint64_t v17 = 136316674;
      *(void *)&v17[4] = v13;
      *(_WORD *)&v17[12] = 2080;
      *(void *)&v17[14] = "-[VCRedundancyControllerVideo resetRedundancyStrategy:]";
      *(_WORD *)&v17[22] = 1024;
      LODWORD(v18) = 210;
      WORD2(v18) = 2112;
      *(void *)((char *)&v18 + 6) = v5;
      HIWORD(v18) = 2048;
      __int16 v19 = self;
      LOWORD(v20) = 2080;
      *(void *)((char *)&v20 + 2) = v15;
      WORD5(v20) = 1024;
      HIDWORD(v20) = v16;
      long long v10 = " [%s] %s:%d %@(%p) Reset redundancy strategy, BT device %s state=%d while WLAN's on 2.4GHz";
      long long v11 = v14;
      uint32_t v12 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v17, v12);
LABEL_13:
    -[VCRedundancyControlAlgorithm setIsRedundancyStrategyResetPending:](self->_algorithm, "setIsRedundancyStrategyResetPending:", 1, *(_OWORD *)v17, *(void *)&v17[16], v18, v19, v20);
  }
}

- (unint64_t)statisticsID
{
  return self->_statisticsID;
}

- (void)setStatisticsID:(unint64_t)a3
{
  self->_unint64_t statisticsID = a3;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (NSArray)fecLevelPerFrameSizeVector
{
  return self->_fecLevelPerFrameSizeVector;
}

- (void)initWithDelegate:(uint64_t)a1 mode:(int *)a2 parameters:(os_log_t)log .cold.1(uint64_t a1, int *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  long long v7 = "-[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]";
  __int16 v8 = 1024;
  int v9 = 85;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d In-appropriate mode %d for VCRedundancyControllerVideo", (uint8_t *)&v4, 0x22u);
}

- (void)initWithDelegate:(uint64_t)a1 mode:(NSObject *)a2 parameters:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]";
  __int16 v6 = 1024;
  int v7 = 45;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create internal statistics collector for redundancy controller", (uint8_t *)&v2, 0x1Cu);
}

@end