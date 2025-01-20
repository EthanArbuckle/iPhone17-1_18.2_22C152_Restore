@interface VCRedundancyControllerAudio
- (VCRedundancyControllerAudio)initWithDelegate:(id)a3 statisticsCollector:(id)a4 mode:(unsigned int)a5;
- (void)dealloc;
- (void)reportRedundancyPercentage:(unsigned int)a3 redundancyInterval:(double)a4;
- (void)unregisterStatistics;
- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3;
@end

@implementation VCRedundancyControllerAudio

- (VCRedundancyControllerAudio)initWithDelegate:(id)a3 statisticsCollector:(id)a4 mode:(unsigned int)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)VCRedundancyControllerAudio;
  v8 = [(VCRedundancyControllerAudio *)&v24 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_redundancyControllerDelegate, a3);
    v10 = (AVCStatisticsCollector *)a4;
    v9->_mode = a5;
    v9->_statisticsCollector = v10;
    v9->_uint64_t networkStatisticsType = 0;
    switch(a5)
    {
      case 0u:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v26 = v14;
            __int16 v27 = 2080;
            v28 = "-[VCRedundancyControllerAudio initWithDelegate:statisticsCollector:mode:]";
            __int16 v29 = 1024;
            int v30 = 55;
            _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio redundancy is disabled.", buf, 0x1Cu);
          }
        }
        goto LABEL_11;
      case 1u:
        v9->_algorithm = (VCRedundancyControlAlgorithm *)objc_alloc_init(VCRedundancyControlAlgorithmAudioLegacy);
        v9->_uint64_t networkStatisticsType = 3;
        goto LABEL_11;
      case 2u:
      case 3u:
        v11 = [[VCRedundancyControlAlgorithmAudio alloc] initWithMode:v9->_mode];
        goto LABEL_13;
      case 4u:
        v11 = objc_alloc_init(VCRedundancyControlAlgorithmAudioMultiWay);
LABEL_13:
        char v16 = 0;
        v9->_algorithm = (VCRedundancyControlAlgorithm *)v11;
        v9->_uint64_t networkStatisticsType = 3;
        break;
      default:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCRedundancyControllerAudio initWithDelegate:statisticsCollector:mode:](v12, (int *)&v9->_mode, v13);
          }
        }
LABEL_11:
        char v16 = 1;
        break;
    }
    statisticsCollector = v9->_statisticsCollector;
    uint64_t networkStatisticsType = v9->_networkStatisticsType;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__VCRedundancyControllerAudio_initWithDelegate_statisticsCollector_mode___block_invoke;
    v23[3] = &unk_1E6DB3FA8;
    v23[4] = v9;
    v9->_statisticRegistrationIndexNetwork = [(AVCStatisticsCollector *)statisticsCollector registerStatisticsChangeHandlerWithType:networkStatisticsType handler:v23];
    int v19 = _os_feature_enabled_impl();
    v9->_isNWConnectionEnabled = v19;
    v9->_statisticRegistrationIndexNWConnection = -1;
    if ((v16 & 1) == 0 && v19)
    {
      v20 = v9->_statisticsCollector;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __73__VCRedundancyControllerAudio_initWithDelegate_statisticsCollector_mode___block_invoke_2;
      v22[3] = &unk_1E6DB3FA8;
      v22[4] = v9;
      v9->_statisticRegistrationIndexNWConnection = [(AVCStatisticsCollector *)v20 registerStatisticsChangeHandlerWithType:11 handler:v22];
    }
  }
  return v9;
}

uint64_t __73__VCRedundancyControllerAudio_initWithDelegate_statisticsCollector_mode___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v3;
  uint64_t v11 = *(void *)(a2 + 192);
  long long v4 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v4;
  long long v5 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v5;
  long long v6 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v6;
  long long v7 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v7;
  long long v8 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v8;
  return [v2 updateRedundancyStrategyWithNetworkStatistics:v10];
}

uint64_t __73__VCRedundancyControllerAudio_initWithDelegate_statisticsCollector_mode___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v3;
  uint64_t v11 = *(void *)(a2 + 192);
  long long v4 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v4;
  long long v5 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v5;
  long long v6 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v6;
  long long v7 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v7;
  long long v8 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v8;
  return [v2 updateRedundancyStrategyWithNetworkStatistics:v10];
}

- (void)unregisterStatistics
{
  [(AVCStatisticsCollector *)self->_statisticsCollector unregisterStatisticsChangeHandlerWithType:self->_networkStatisticsType handlerIndex:self->_statisticRegistrationIndexNetwork];
  if ((self->_statisticRegistrationIndexNWConnection & 0x80000000) == 0)
  {
    statisticsCollector = self->_statisticsCollector;
    -[AVCStatisticsCollector unregisterStatisticsChangeHandlerWithType:handlerIndex:](statisticsCollector, "unregisterStatisticsChangeHandlerWithType:handlerIndex:", 11);
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_redundancyControllerDelegate, 0);

  v3.receiver = self;
  v3.super_class = (Class)VCRedundancyControllerAudio;
  [(VCRedundancyControllerAudio *)&v3 dealloc];
}

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  algorithm = self->_algorithm;
  long long v5 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
  v12[10] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
  v12[11] = v5;
  uint64_t v13 = *((void *)&a3->var0.localRCEvent + 21);
  long long v6 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
  v12[6] = *(_OWORD *)(&a3->var0.localRCEvent + 3);
  v12[7] = v6;
  long long v7 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
  v12[8] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
  v12[9] = v7;
  long long v8 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
  v12[2] = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
  v12[3] = v8;
  long long v9 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
  v12[4] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
  v12[5] = v9;
  long long v10 = *(_OWORD *)&a3->isVCRCInternal;
  v12[0] = *(_OWORD *)&a3->type;
  v12[1] = v10;
  [(VCRedundancyControlAlgorithm *)algorithm updateRedundancyStrategyWithNetworkStatistics:v12];
  uint64_t v11 = [(VCRedundancyControlAlgorithm *)self->_algorithm redundancyPercentage];
  [(VCRedundancyControlAlgorithm *)self->_algorithm redundancyInterval];
  -[VCRedundancyControllerAudio reportRedundancyPercentage:redundancyInterval:](self, "reportRedundancyPercentage:redundancyInterval:", v11);
}

- (void)reportRedundancyPercentage:(unsigned int)a3 redundancyInterval:(double)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t IntValueForKey = VCDefaults_GetIntValueForKey(@"forceAudioRedundancyPercentage", *(uint64_t *)&a3);
  double v7 = (double)(int)VCDefaults_GetIntValueForKey(@"forceAudioRedundancyInterval", (int)a4);
  if (self->_currentRedundancyPercentage != IntValueForKey)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      long long v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int currentRedundancyPercentage = self->_currentRedundancyPercentage;
        unsigned int mode = self->_mode;
        int v18 = 136316674;
        uint64_t v19 = v8;
        __int16 v20 = 2080;
        v21 = "-[VCRedundancyControllerAudio reportRedundancyPercentage:redundancyInterval:]";
        __int16 v22 = 1024;
        int v23 = 108;
        __int16 v24 = 1024;
        *(_DWORD *)v25 = currentRedundancyPercentage;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&v25[6] = IntValueForKey;
        LOWORD(v26) = 1024;
        *(_DWORD *)((char *)&v26 + 2) = mode;
        HIWORD(v26) = 2048;
        __int16 v27 = self;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio redundancy percentage changed from %d to %d with mode %d, 0x%p", (uint8_t *)&v18, 0x38u);
      }
    }
    self->_unsigned int currentRedundancyPercentage = IntValueForKey;
    uint64_t v12 = (void *)MEMORY[0x1E4E56580](&self->_redundancyControllerDelegate);
    [v12 redundancyController:self redundancyPercentageDidChange:IntValueForKey];
    if (v12) {
      CFRelease(v12);
    }
  }
  if (self->_currentRedundancyInterval != v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double currentRedundancyInterval = self->_currentRedundancyInterval;
        unsigned int v16 = self->_mode;
        int v18 = 136316674;
        uint64_t v19 = v13;
        __int16 v20 = 2080;
        v21 = "-[VCRedundancyControllerAudio reportRedundancyPercentage:redundancyInterval:]";
        __int16 v22 = 1024;
        int v23 = 116;
        __int16 v24 = 2048;
        *(double *)v25 = currentRedundancyInterval;
        *(_WORD *)&v25[8] = 2048;
        double v26 = v7;
        LOWORD(v27) = 1024;
        *(_DWORD *)((char *)&v27 + 2) = v16;
        HIWORD(v27) = 2048;
        v28 = self;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio redundancy interval changed from %f to %f with mode %d, 0x%p", (uint8_t *)&v18, 0x40u);
      }
    }
    self->_double currentRedundancyInterval = v7;
    v17 = (void *)MEMORY[0x1E4E56580](&self->_redundancyControllerDelegate);
    [v17 redundancyController:self redundancyIntervalDidChange:v7];
    if (v17) {
      CFRelease(v17);
    }
  }
}

- (void)initWithDelegate:(uint64_t)a1 statisticsCollector:(int *)a2 mode:(os_log_t)log .cold.1(uint64_t a1, int *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  double v7 = "-[VCRedundancyControllerAudio initWithDelegate:statisticsCollector:mode:]";
  __int16 v8 = 1024;
  int v9 = 58;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d In-appropriate mode %d for VCRedundancyController", (uint8_t *)&v4, 0x22u);
}

@end