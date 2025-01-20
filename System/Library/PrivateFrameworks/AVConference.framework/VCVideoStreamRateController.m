@interface VCVideoStreamRateController
- (VCVideoStreamRateController)initWithDumpID:(unsigned int)a3;
- (double)nowrd;
- (double)nowrdAcc;
- (double)nowrdShort;
- (double)owrd;
- (id)className;
- (unsigned)maxBitrate;
- (unsigned)maxTierIndex:(unsigned int)a3;
- (unsigned)minBitrate;
- (unsigned)minTierIndex:(unsigned int)a3;
- (unsigned)targetBitrate;
- (void)createLogDumpFile:(unsigned int)a3;
- (void)dealloc;
- (void)doRateControlWithTime:(double)a3 roundTripTime:(double)a4 packetLossRate:(double)a5 operatingBitrate:(unsigned int)a6 averageReceivedBitrate:(unsigned int)a7;
- (void)releaseLogDumpFile;
- (void)setMaxTargetBitrate:(unsigned int)a3 minTargetBitrate:(unsigned int)a4;
- (void)setOperatingTierIndexWithBitrate:(unsigned int)a3;
- (void)setRateControlInterval:(double)a3;
- (void)updateAverageTargetBitrate:(unsigned int)a3 interval:(double)a4;
- (void)updateRTPReceiveWithTimestamp:(unsigned int)a3 sampleRate:(unsigned int)a4 time:(double)a5;
- (void)updateVideoStall:(BOOL)a3 withStallDuration:(unsigned int)a4;
@end

@implementation VCVideoStreamRateController

- (VCVideoStreamRateController)initWithDumpID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCVideoStreamRateController;
  v4 = [(VCVideoStreamRateController *)&v12 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  v4->_minBitrate = 10000;
  v4->_maxBitrate = 1949000;
  *(void *)&v4->_int algorithm = 0x1A00000002;
  int algorithm = [+[VCDefaults sharedInstance] videoStreamRateControlAlgorithm];
  if (algorithm < 0) {
    int algorithm = v5->_algorithm;
  }
  else {
    v5->_int algorithm = algorithm;
  }
  if (algorithm == 2)
  {
    v7 = VCVideoStreamNOWRDLossEventRateControl;
  }
  else if (algorithm == 1)
  {
    v7 = VCVideoStreamOWRDLossEventRateControl;
  }
  else
  {
    if (algorithm)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoStreamRateController initWithDumpID:](v10, v11);
        }
      }
      goto LABEL_12;
    }
    v7 = VCVideoStreamRTTPLRRateControl;
  }
  v5->_rateControl = (VCVideoStreamRateControlProtocol *)objc_alloc_init(v7);
LABEL_12:
  if ([+[VCDefaults sharedInstance] videoStreamRateControlDumpEnabled])
  {
    [(VCVideoStreamRateController *)v5 createLogDumpFile:v3];
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v5->_videoStreamRateControllerQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoStreamRateController.videoStreamRateControllerQueue", 0, CustomRootQueue);
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCVideoStreamRateController *)self releaseLogDumpFile];

  dispatch_release((dispatch_object_t)self->_videoStreamRateControllerQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCVideoStreamRateController;
  [(VCVideoStreamRateController *)&v3 dealloc];
}

- (void)setMaxTargetBitrate:(unsigned int)a3 minTargetBitrate:(unsigned int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  videoStreamRateControllerQueue = self->_videoStreamRateControllerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VCVideoStreamRateController_setMaxTargetBitrate_minTargetBitrate___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  unsigned int v6 = a4;
  unsigned int v7 = a3;
  dispatch_sync(videoStreamRateControllerQueue, block);
}

uint64_t __68__VCVideoStreamRateController_setMaxTargetBitrate_minTargetBitrate___block_invoke(uint64_t a1)
{
  *(_WORD *)(*(void *)(a1 + 32) + 22) = [*(id *)(a1 + 32) minTierIndex:*(unsigned int *)(a1 + 40)];
  *(_WORD *)(*(void *)(a1 + 32) + 20) = [*(id *)(a1 + 32) maxTierIndex:*(unsigned int *)(a1 + 44)];
  *(_DWORD *)(*(void *)(a1 + 32) + 28) = g_adwTxRateTiers[*(unsigned __int16 *)(*(void *)(a1 + 32) + 22)];
  *(_DWORD *)(*(void *)(a1 + 32) + 32) = g_adwTxRateTiers[*(unsigned __int16 *)(*(void *)(a1 + 32) + 20)];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 8);
  uint64_t v4 = *(unsigned __int16 *)(v2 + 20);
  uint64_t v5 = *(unsigned __int16 *)(v2 + 22);

  return [v3 setMaxTierIndex:v4 minTierIndex:v5];
}

- (void)setRateControlInterval:(double)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  videoStreamRateControllerQueue = self->_videoStreamRateControllerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCVideoStreamRateController_setRateControlInterval___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  *(double *)&void block[5] = a3;
  dispatch_sync(videoStreamRateControllerQueue, block);
}

uint64_t __54__VCVideoStreamRateController_setRateControlInterval___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setRateControlInterval:*(double *)(a1 + 40)];
}

- (void)doRateControlWithTime:(double)a3 roundTripTime:(double)a4 packetLossRate:(double)a5 operatingBitrate:(unsigned int)a6 averageReceivedBitrate:(unsigned int)a7
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  videoStreamRateControllerQueue = self->_videoStreamRateControllerQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __122__VCVideoStreamRateController_doRateControlWithTime_roundTripTime_packetLossRate_operatingBitrate_averageReceivedBitrate___block_invoke;
  v8[3] = &unk_1E6DB7FF8;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  *(double *)&v8[6] = a4;
  *(double *)&v8[7] = a5;
  unsigned int v9 = a6;
  unsigned int v10 = a7;
  dispatch_sync(videoStreamRateControllerQueue, v8);
}

void __122__VCVideoStreamRateController_doRateControlWithTime_roundTripTime_packetLossRate_operatingBitrate_averageReceivedBitrate___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(v2 + 40);
  if (v3 != 0.0)
  {
    double v4 = *(double *)(a1 + 40);
    if (v4 > v3)
    {
      [(id)v2 updateAverageTargetBitrate:*(unsigned int *)(v2 + 36) interval:v4 - v3];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(void *)(v2 + 40) = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) setOperatingTierIndexWithBitrate:*(unsigned int *)(a1 + 64)];
  [*(id *)(*(void *)(a1 + 32) + 8) doRateControlWithTime:*(unsigned __int16 *)(*(void *)(a1 + 32) + 24) roundTripTime:*(unsigned int *)(a1 + 68) packetLossRate:*(double *)(*(void *)(a1 + 32) + 40) operatingTierIndex:*(double *)(a1 + 48) averageReceivedBitrate:*(double *)(a1 + 56)];
  *(_DWORD *)(*(void *)(a1 + 32) + 36) = [*(id *)(*(void *)(a1 + 32) + 8) targetBitrate];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    unsigned int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "className"), "UTF8String");
      uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "description"), "UTF8String");
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = g_adwTxRateTiers[*(unsigned __int16 *)(v9 + 24)];
      int v12 = *(_DWORD *)(v9 + 28);
      int v11 = *(_DWORD *)(v9 + 32);
      LODWORD(v9) = *(_DWORD *)(v9 + 36);
      int v13 = *(_DWORD *)(a1 + 68);
      int v14 = 136317442;
      uint64_t v15 = v5;
      __int16 v16 = 2080;
      v17 = "-[VCVideoStreamRateController doRateControlWithTime:roundTripTime:packetLossRate:operatingBitrate:averageRec"
            "eivedBitrate:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 126;
      __int16 v20 = 2080;
      uint64_t v21 = v7;
      __int16 v22 = 2080;
      uint64_t v23 = v8;
      __int16 v24 = 1024;
      int v25 = v11;
      __int16 v26 = 1024;
      int v27 = v12;
      __int16 v28 = 1024;
      int v29 = v10;
      __int16 v30 = 1024;
      int v31 = v9;
      __int16 v32 = 1024;
      int v33 = v13;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s doRateControlWithTime - %s maxTierBitrate:%u minTierBitrate:%u operatingTierBitrate:%u targetBitrate:%u rxBitrate:%u", (uint8_t *)&v14, 0x4Eu);
    }
  }
}

- (void)updateRTPReceiveWithTimestamp:(unsigned int)a3 sampleRate:(unsigned int)a4 time:(double)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  videoStreamRateControllerQueue = self->_videoStreamRateControllerQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__VCVideoStreamRateController_updateRTPReceiveWithTimestamp_sampleRate_time___block_invoke;
  v6[3] = &unk_1E6DB4518;
  v6[4] = self;
  unsigned int v7 = a3;
  unsigned int v8 = a4;
  *(double *)&v6[5] = a5;
  dispatch_async(videoStreamRateControllerQueue, v6);
}

uint64_t __77__VCVideoStreamRateController_updateRTPReceiveWithTimestamp_sampleRate_time___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) updateRTPReceiveWithTimestamp:*(unsigned int *)(a1 + 48) sampleRate:*(unsigned int *)(a1 + 52) time:*(double *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v3 + 56) != *(_DWORD *)(a1 + 48))
  {
    uint64_t result = [*(id *)(v3 + 8) printRateControlFullInfoWithLogDump:*(void *)(v3 + 96) time:*(unsigned __int8 *)(v3 + 88) videoStall:*(unsigned int *)(v3 + 60) videoFrozenDuration:*(double *)(a1 + 40) averageTargetBitrate:*(double *)(v3 + 80)];
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = *(_DWORD *)(a1 + 48);
  }
  return result;
}

- (void)updateVideoStall:(BOOL)a3 withStallDuration:(unsigned int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  videoStreamRateControllerQueue = self->_videoStreamRateControllerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VCVideoStreamRateController_updateVideoStall_withStallDuration___block_invoke;
  block[3] = &unk_1E6DB76B0;
  block[4] = self;
  BOOL v7 = a3;
  unsigned int v6 = a4;
  dispatch_async(videoStreamRateControllerQueue, block);
}

double __66__VCVideoStreamRateController_updateVideoStall_withStallDuration___block_invoke(uint64_t a1, double a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = *(unsigned char *)(a1 + 44);
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  double result = *(double *)(v2 + 80) + (double)*(unint64_t *)&a2 / 1000.0;
  *(double *)(v2 + 80) = result;
  return result;
}

- (double)owrd
{
  [(VCVideoStreamRateControlProtocol *)self->_rateControl owrd];
  return result;
}

- (double)nowrd
{
  [(VCVideoStreamRateControlProtocol *)self->_rateControl nowrd];
  return result;
}

- (double)nowrdShort
{
  [(VCVideoStreamRateControlProtocol *)self->_rateControl nowrdShort];
  return result;
}

- (double)nowrdAcc
{
  [(VCVideoStreamRateControlProtocol *)self->_rateControl nowrdAcc];
  return result;
}

- (unsigned)minTierIndex:(unsigned int)a3
{
  if (a3 <= 0x1DBD48)
  {
    uint64_t v5 = 0;
    while (g_adwTxRateTiers[v5] < a3)
    {
      if (++v5 == 27) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamRateController minTierIndex:](v4, self);
      }
    }
LABEL_8:
    LOWORD(v5) = 26;
  }
  return v5;
}

- (unsigned)maxTierIndex:(unsigned int)a3
{
  if (a3 >= 0x2710)
  {
    int v5 = 26;
    while (g_adwTxRateTiers[v5] > a3)
    {
      if (--v5 == -1) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamRateController maxTierIndex:](v4, self);
      }
    }
LABEL_8:
    LOWORD(v5) = 0;
  }
  return v5;
}

- (void)setOperatingTierIndexWithBitrate:(unsigned int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_maxBitrate >= a3)
  {
    if (self->_minBitrate <= a3)
    {
      unsigned __int16 minTierIndex = -[VCVideoStreamRateController minTierIndex:](self, "minTierIndex:");
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = objc_msgSend(-[VCVideoStreamRateController className](self, "className"), "UTF8String");
          unsigned int minBitrate = self->_minBitrate;
          int v13 = 136316162;
          uint64_t v14 = v7;
          __int16 v15 = 2080;
          __int16 v16 = "-[VCVideoStreamRateController setOperatingTierIndexWithBitrate:]";
          __int16 v17 = 1024;
          int v18 = 212;
          __int16 v19 = 2080;
          uint64_t v20 = v11;
          __int16 v21 = 1024;
          unsigned int v22 = minBitrate;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s: operating bitrate is less than the configured min bitrate: %u!", (uint8_t *)&v13, 0x2Cu);
        }
      }
      unsigned __int16 minTierIndex = self->_minTierIndex;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = objc_msgSend(-[VCVideoStreamRateController className](self, "className"), "UTF8String");
        unsigned int maxBitrate = self->_maxBitrate;
        int v13 = 136316162;
        uint64_t v14 = v4;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCVideoStreamRateController setOperatingTierIndexWithBitrate:]";
        __int16 v17 = 1024;
        int v18 = 209;
        __int16 v19 = 2080;
        uint64_t v20 = v9;
        __int16 v21 = 1024;
        unsigned int v22 = maxBitrate;
        _os_log_error_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s: operating bitrate is greater than the configured max bitrate: %u!", (uint8_t *)&v13, 0x2Cu);
      }
    }
    unsigned __int16 minTierIndex = self->_maxTierIndex;
  }
  self->_operatingTierIndex = minTierIndex;
}

- (void)updateAverageTargetBitrate:(unsigned int)a3 interval:(double)a4
{
  double totalTime = self->_totalTime;
  if (a4 > 0.0)
  {
    double totalTime = totalTime + a4;
    self->_double totalTime = totalTime;
    self->_accumulatedTargetDataSize = (unint64_t)((double)self->_accumulatedTargetDataSize
                                                        + (double)(a3 / 0x3E8) * a4);
  }
  if (totalTime > 0.0) {
    self->_averageTargetBitrate = ((double)self->_accumulatedTargetDataSize / totalTime * 1000.0);
  }
}

- (void)createLogDumpFile:(unsigned int)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  memset(v12, 170, 12);
  __sprintf_chk(v12, 0, 0xCuLL, "%010u", a3);
  uint64_t v4 = VRLogfileAlloc(0, (uint64_t)v12, (uint64_t)"VCVideoRC", (uint64_t)".afrcdump", "com.apple.VideoConference.AFRClog.VideoStream", 9);
  self->_logDump = v4;
  VRLogfilePrintSync(v4, "STime\t\tdTime/ETxTS\tOWRD\tNOWRD\tNOWRDS\tNOWRDA\tUp\tRTT\tPLR/FEC\tRRx\tMBL\tBR/TR\tMQIn: A/V\tMQOut: A/V\tABRL\tQD\tBDL\tTxAT\tMODE\tTxSTATE\n", v5, v6, v7, v8, v9, v10, v11);
}

- (void)releaseLogDumpFile
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_logDump = &self->_logDump;
  if (self->_logDump)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v10[6] = v3;
    v10[7] = v3;
    v10[4] = v3;
    v10[5] = v3;
    v10[2] = v3;
    v10[3] = v3;
    v10[0] = v3;
    v10[1] = v3;
    micro();
    VRLogfileGetTimestamp((char *)v10, 0x80u);
    VRLogfilePrintSync((FILE **)*p_logDump, "%s\t%8.3f\tEndOfFile\n", v4, v5, v6, v7, v8, v9, (char)v10);
    VRLogfileFree((uint64_t *)p_logDump);
    *p_logDump = 0;
  }
}

- (id)className
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (unsigned)minBitrate
{
  return self->_minBitrate;
}

- (unsigned)maxBitrate
{
  return self->_maxBitrate;
}

- (void)initWithDumpID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCVideoStreamRateController initWithDumpID:]";
  __int16 v6 = 1024;
  int v7 = 75;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Creating a VCVideoStreamRateController with unknown algorithm.", (uint8_t *)&v2, 0x1Cu);
}

- (void)minTierIndex:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(a2, "className"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_8_12(&dword_1E1EA4000, v2, v3, " [%s] %s:%d %s:%d bitrate is greater than the maximum possible tier!", v4, v5, v6, v7, v8);
}

- (void)maxTierIndex:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(a2, "className"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_8_12(&dword_1E1EA4000, v2, v3, " [%s] %s:%d %s:%d bitrate is less than the minimum possible tier!", v4, v5, v6, v7, v8);
}

@end