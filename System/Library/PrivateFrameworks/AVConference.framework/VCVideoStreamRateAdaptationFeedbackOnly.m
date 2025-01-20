@interface VCVideoStreamRateAdaptationFeedbackOnly
- (BOOL)didReceiveVideo;
- (VCVideoStreamRateAdaptationFeedbackOnly)initWithMediaStreamRateAdaptationParam:(const tagVCMediaStreamRateAdaptationParams *)a3;
- (double)owrd;
- (void)dealloc;
- (void)sendRateControlFeedback;
- (void)setDidReceiveVideo:(BOOL)a3;
- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6;
- (void)startFeedbackSource;
- (void)stopFeedbackSource;
- (void)updateRTPReceiveWithTimestamp:(unsigned int)a3 sampleRate:(unsigned int)a4 time:(double)a5 size:(unsigned int)a6 endOfFrame:(BOOL)a7;
- (void)updateRateControlInfoWithStatisticsMessage:(tagVCStatisticsMessage *)a3;
@end

@implementation VCVideoStreamRateAdaptationFeedbackOnly

- (VCVideoStreamRateAdaptationFeedbackOnly)initWithMediaStreamRateAdaptationParam:(const tagVCMediaStreamRateAdaptationParams *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id var8 = a3->var8;
  v17.receiver = self;
  v17.super_class = (Class)VCVideoStreamRateAdaptationFeedbackOnly;
  v5 = [(VCMediaStreamRateAdaptation *)&v17 initWithDelegate:var8 params:a3];
  v6 = v5;
  if (v5)
  {
    v5->super._rtpHandle = a3->var5;
    v5->super._reportingAgent = a3->var2;
    v5->super._reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    reportingInheritModuleSpecificInfoFromParent();
    v6->_statisticsCollector = [(AVCRateController *)v6->super.super._vcrcRateController statisticsCollector];
    v6->super._rateAdaptationEnabled = 0;
    v6->_useLowPrecisionEchoTimeStamp = a3->var7;
    +[VCDefaults getDoubleValueForKey:@"videoStreamAverageBitrateWindowDuration" defaultValue:1.0];
    v6->super._averageBitrateWindowDuration = v7;
    if ((VCVideoStreamRateAdaptationFeedbackOnly *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v19 = v9;
          __int16 v20 = 2080;
          v21 = "-[VCVideoStreamRateAdaptationFeedbackOnly initWithMediaStreamRateAdaptationParam:]";
          __int16 v22 = 1024;
          int v23 = 52;
          v11 = " [%s] %s:%d ";
          v12 = v10;
          uint32_t v13 = 28;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v8 = (__CFString *)[(VCVideoStreamRateAdaptationFeedbackOnly *)v6 performSelector:sel_logPrefix];
      }
      else {
        v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v19 = v14;
          __int16 v20 = 2080;
          v21 = "-[VCVideoStreamRateAdaptationFeedbackOnly initWithMediaStreamRateAdaptationParam:]";
          __int16 v22 = 1024;
          int v23 = 52;
          __int16 v24 = 2112;
          v25 = v8;
          __int16 v26 = 2048;
          v27 = v6;
          v11 = " [%s] %s:%d %@(%p) ";
          v12 = v15;
          uint32_t v13 = 48;
          goto LABEL_12;
        }
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamRateAdaptationFeedbackOnly *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v4;
        __int16 v14 = 2080;
        v15 = "-[VCVideoStreamRateAdaptationFeedbackOnly dealloc]";
        __int16 v16 = 1024;
        int v17 = 58;
        v6 = " [%s] %s:%d ";
        double v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCVideoStreamRateAdaptationFeedbackOnly *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        v15 = "-[VCVideoStreamRateAdaptationFeedbackOnly dealloc]";
        __int16 v16 = 1024;
        int v17 = 58;
        __int16 v18 = 2112;
        uint64_t v19 = v3;
        __int16 v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        double v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  [(VCVideoStreamRateAdaptationFeedbackOnly *)self stopFeedbackSource];

  v11.receiver = self;
  v11.super_class = (Class)VCVideoStreamRateAdaptationFeedbackOnly;
  [(VCVideoStreamRateAdaptation *)&v11 dealloc];
}

- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6
{
  if (self->super._rateAdaptationEnabled != a3)
  {
    self->super._rateAdaptationEnabled = a3;
    if (a3) {
      [(VCVideoStreamRateAdaptationFeedbackOnly *)self startFeedbackSource];
    }
    else {
      [(VCVideoStreamRateAdaptationFeedbackOnly *)self stopFeedbackSource];
    }
  }
}

- (void)startFeedbackSource
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d RTPGetPreferredSendQueue failed %x", v2, v3, v4, v5);
}

uint64_t __62__VCVideoStreamRateAdaptationFeedbackOnly_startFeedbackSource__block_invoke(uint64_t a1)
{
  os_log_t v1 = (void *)[*(id *)(a1 + 32) strong];

  return [v1 sendRateControlFeedback];
}

- (void)stopFeedbackSource
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_rateControlFeedbackSource)
  {
    if ((VCVideoStreamRateAdaptationFeedbackOnly *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v11 = 136315650;
      uint64_t v12 = v4;
      __int16 v13 = 2080;
      __int16 v14 = "-[VCVideoStreamRateAdaptationFeedbackOnly stopFeedbackSource]";
      __int16 v15 = 1024;
      int v16 = 114;
      v6 = " [%s] %s:%d Stop VCRC rate control feedback";
      double v7 = v5;
      uint32_t v8 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v3 = (__CFString *)[(VCVideoStreamRateAdaptationFeedbackOnly *)self performSelector:sel_logPrefix];
      }
      else {
        v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v11 = 136316162;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      __int16 v14 = "-[VCVideoStreamRateAdaptationFeedbackOnly stopFeedbackSource]";
      __int16 v15 = 1024;
      int v16 = 114;
      __int16 v17 = 2112;
      __int16 v18 = v3;
      __int16 v19 = 2048;
      __int16 v20 = self;
      v6 = " [%s] %s:%d %@(%p) Stop VCRC rate control feedback";
      double v7 = v10;
      uint32_t v8 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
LABEL_13:
    dispatch_source_cancel((dispatch_source_t)self->_rateControlFeedbackSource);
    dispatch_release((dispatch_object_t)self->_rateControlFeedbackSource);
    self->_rateControlFeedbackSource = 0;
  }
}

- (void)sendRateControlFeedback
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to VCMediaControlInfoSerializeWithData %X", v2, v3, v4, v5);
}

- (void)updateRTPReceiveWithTimestamp:(unsigned int)a3 sampleRate:(unsigned int)a4 time:(double)a5 size:(unsigned int)a6 endOfFrame:(BOOL)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  self->_didReceiveVideo = 1;
  ++self->_totalPacketsReceived;
  unsigned int previousRTPTimestamp = self->_previousRTPTimestamp;
  if (previousRTPTimestamp)
  {
    if (a3 != previousRTPTimestamp && a3 - previousRTPTimestamp < 0x7FFFFFFF)
    {
      self->_lastTimestamp = a3;
      self->_lastTimestampReceiveTime = a5;
      memset(&v23[8], 0, 144);
      unsigned int totalPacketsReceived = self->_totalPacketsReceived;
      statisticsCollector = self->_statisticsCollector;
      uint64_t v17 = 7;
      double v18 = a5;
      *(void *)&long long v19 = 0;
      DWORD2(v19) = 4;
      HIDWORD(v19) = a3;
      unsigned int v20 = a4;
      unsigned int v21 = totalPacketsReceived;
      double v22 = 0.0;
      *(double *)int v23 = a5;
      VCRateControlSetStatistics(statisticsCollector, &v17);
      self->_unsigned int previousRTPTimestamp = a3;
    }
  }
  else
  {
    self->_unsigned int previousRTPTimestamp = a3;
  }
  *(void *)((char *)&v19 + 5) = 0;
  *(void *)&long long v19 = 0;
  memset(&v23[4], 0, 148);
  int v16 = self->_statisticsCollector;
  uint64_t v17 = 4;
  double v18 = a5;
  BYTE13(v19) = 1;
  HIWORD(v19) = a7;
  unsigned int v20 = a3;
  unsigned int v21 = a6;
  double v22 = a5;
  *(_DWORD *)int v23 = a3;
  VCRateControlSetStatistics(v16, &v17);
}

- (void)updateRateControlInfoWithStatisticsMessage:(tagVCStatisticsMessage *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  statisticsCollector = self->_statisticsCollector;
  if (statisticsCollector)
  {
    long long v4 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    v10[10] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    v10[11] = v4;
    uint64_t v11 = *((void *)&a3->var0.localRCEvent + 21);
    long long v5 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    v10[6] = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    v10[7] = v5;
    long long v6 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    v10[8] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    v10[9] = v6;
    long long v7 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    v10[2] = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    v10[3] = v7;
    long long v8 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    v10[4] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    v10[5] = v8;
    long long v9 = *(_OWORD *)&a3->isVCRCInternal;
    v10[0] = *(_OWORD *)&a3->type;
    v10[1] = v9;
    VCRateControlSetStatistics(statisticsCollector, v10);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStreamRateAdaptationFeedbackOnly updateRateControlInfoWithStatisticsMessage:]();
    }
  }
}

- (double)owrd
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v4 = 0u;
  memset(v3, 0, sizeof(v3));
  VCRateControlGetStatistics((uint64_t)self->_statisticsCollector, 7, (uint64_t)v3);
  return *((double *)&v4 + 1);
}

- (BOOL)didReceiveVideo
{
  return self->_didReceiveVideo;
}

- (void)setDidReceiveVideo:(BOOL)a3
{
  self->_didReceiveVideo = a3;
}

- (void)updateRateControlInfoWithStatisticsMessage:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Update VCRC information when _statisticsCollector is nil!", v2, v3, v4, v5, v6);
}

@end