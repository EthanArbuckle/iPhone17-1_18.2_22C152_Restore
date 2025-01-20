@interface VCVideoStreamRateAdaptation
- (BOOL)isOperatingAtMaxBitrate;
- (BOOL)isOperatingAtMinBitrate;
- (BOOL)runVideoStreamRateAdaptation;
- (VCMediaStreamStats)stats;
- (VCVideoStreamRateAdaptation)initWithMediaStreamRateAdaptationParam:(const tagVCMediaStreamRateAdaptationParams *)a3;
- (double)maxOWRD;
- (double)nowrd;
- (double)nowrdAcc;
- (double)nowrdShort;
- (double)owrd;
- (double)packetLossPercentage;
- (double)roundTripTime;
- (id)className;
- (tagHANDLE)rtpHandle;
- (unsigned)averageReceivedBitrate;
- (unsigned)operatingBitrate;
- (unsigned)sendTmmbrBitrate;
- (void)dealloc;
- (void)receivedTMMBN:(unsigned int)a3;
- (void)reportingVideoStreamEvent:(unsigned __int16)a3;
- (void)runVideoStreamRateAdaptation;
- (void)scheduleTMMBR:(unsigned int)a3;
- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6;
- (void)setMaxOWRD:(double)a3;
- (void)setOperatingBitrate:(unsigned int)a3;
- (void)setStats:(id)a3;
- (void)updateRTPReceiveWithTimestamp:(unsigned int)a3 sampleRate:(unsigned int)a4 time:(double)a5 size:(unsigned int)a6 endOfFrame:(BOOL)a7;
- (void)updateVideoStall:(BOOL)a3 withStallDuration:(unsigned int)a4;
@end

@implementation VCVideoStreamRateAdaptation

- (VCVideoStreamRateAdaptation)initWithMediaStreamRateAdaptationParam:(const tagVCMediaStreamRateAdaptationParams *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)VCVideoStreamRateAdaptation;
  v4 = [(VCVideoStreamRateAdaptation *)&v16 init];
  v5 = v4;
  if (v4)
  {
    v4->_rtpHandle = a3->var5;
    v4->_reportingAgent = a3->var2;
    v4->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    reportingInheritModuleSpecificInfoFromParent();
    v5->_rateController = [[VCVideoStreamRateController alloc] initWithDumpID:a3->var1];
    v5->_rateAdaptationEnabled = 0;
    +[VCDefaults getDoubleValueForKey:@"videoStreamAverageBitrateWindowDuration" defaultValue:1.0];
    v5->_averageBitrateWindowDuration = v6;
    if ((VCVideoStreamRateAdaptation *)objc_opt_class() == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v18 = v8;
          __int16 v19 = 2080;
          v20 = "-[VCVideoStreamRateAdaptation initWithMediaStreamRateAdaptationParam:]";
          __int16 v21 = 1024;
          int v22 = 40;
          v10 = " [%s] %s:%d ";
          v11 = v9;
          uint32_t v12 = 28;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v7 = (__CFString *)[(VCVideoStreamRateAdaptation *)v5 performSelector:sel_logPrefix];
      }
      else {
        v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          v20 = "-[VCVideoStreamRateAdaptation initWithMediaStreamRateAdaptationParam:]";
          __int16 v21 = 1024;
          int v22 = 40;
          __int16 v23 = 2112;
          v24 = v7;
          __int16 v25 = 2048;
          v26 = v5;
          v10 = " [%s] %s:%d %@(%p) ";
          v11 = v14;
          uint32_t v12 = 48;
          goto LABEL_12;
        }
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamRateAdaptation *)objc_opt_class() == self)
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
        v15 = "-[VCVideoStreamRateAdaptation dealloc]";
        __int16 v16 = 1024;
        int v17 = 46;
        double v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCVideoStreamRateAdaptation *)self performSelector:sel_logPrefix];
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
        v15 = "-[VCVideoStreamRateAdaptation dealloc]";
        __int16 v16 = 1024;
        int v17 = 46;
        __int16 v18 = 2112;
        __int16 v19 = v3;
        __int16 v20 = 2048;
        __int16 v21 = self;
        double v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }

  reportingCacheModuleSpecificInfo();
  v11.receiver = self;
  v11.super_class = (Class)VCVideoStreamRateAdaptation;
  [(VCMediaStreamRateAdaptation *)&v11 dealloc];
}

- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6
{
  self->_rateAdaptationEnabled = a3;
  if (a3)
  {
    uint64_t v6 = *(void *)&a5;
    uint64_t v7 = *(void *)&a4;
    [(VCVideoStreamRateController *)self->_rateController setRateControlInterval:a6];
    [(VCVideoStreamRateController *)self->_rateController setMaxTargetBitrate:v7 minTargetBitrate:v6];
    uint64_t v9 = [(VCVideoStreamRateController *)self->_rateController minBitrate];
    self->_operatingBitrate = v9;
    [(VCVideoStreamRateAdaptation *)self scheduleTMMBR:v9];
    self->_isOperatingAtMinBitrate = 0;
    self->_isOperatingAtMaxBitrate = 0;
  }
}

- (BOOL)runVideoStreamRateAdaptation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!self->_rateAdaptationEnabled) {
    return 0;
  }
  unsigned int v13 = -1431655766;
  unsigned int v14 = -1431655766;
  unsigned int v12 = -1431655766;
  RTPGetPacketLossMetrics((uint64_t)self->_rtpHandle, &v14, &v13, &v12);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v4;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCVideoStreamRateAdaptation runVideoStreamRateAdaptation]";
      __int16 v19 = 1024;
      int v20 = 81;
      __int16 v21 = 1024;
      unsigned int v22 = v13;
      __int16 v23 = 1024;
      unsigned int v24 = v12;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d packetsExpectedForInterval:%u packetsLostForInterval:%u", buf, 0x28u);
    }
  }
  if (v13)
  {
    LODWORD(v3) = v12;
    double v6 = (double)v3 / (double)v13;
    self->_packetLossPercentage = v6 * 100.0;
    if (self->_sendTmmbrBitrate && !self->_receivedTmmbnBitrate)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint32_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          [(VCVideoStreamRateAdaptation *)v7 runVideoStreamRateAdaptation];
        }
      }
      self->_tmmbRTT = 0.0;
      [(VCVideoStreamRateAdaptation *)self setOperatingBitrate:self->_sendTmmbrBitrate];
    }
    double v9 = micro();
    self->_adaptationTime = v9;
    [(VCVideoStreamRateController *)self->_rateController doRateControlWithTime:self->_operatingBitrate roundTripTime:[(VCVideoStreamRateAdaptation *)self averageReceivedBitrate] packetLossRate:v9 operatingBitrate:self->_tmmbRTT averageReceivedBitrate:v6];
    [(VCVideoStreamRateAdaptation *)self owrd];
    if (self->_maxOWRD < v10) {
      self->_maxOWRD = v10;
    }
  }
  else
  {
    self->_packetLossPercentage = 0.0;
  }
  [(VCVideoStreamRateAdaptation *)self scheduleTMMBR:[(VCVideoStreamRateController *)self->_rateController targetBitrate]];
  return self->_downlinkQualityDidChange;
}

- (void)receivedTMMBN:(unsigned int)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  self->_unsigned int receivedTmmbnBitrate = a3;
  double v4 = micro();
  self->_tmmbnReceiveTime = v4;
  self->_double tmmbRTT = v4 - self->_tmmbrSendTime;
  [(VCVideoStreamRateAdaptation *)self setOperatingBitrate:self->_receivedTmmbnBitrate];
  if (self->_downlinkQualityDidChange) {
    [(VCVideoStreamRateAdaptation *)self reportingVideoStreamEvent:227];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    double v6 = *MEMORY[0x1E4F47A50];
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = objc_msgSend(-[VCVideoStreamRateAdaptation className](self, "className"), "UTF8String");
        unsigned int receivedTmmbnBitrate = self->_receivedTmmbnBitrate;
        double tmmbRTT = self->_tmmbRTT;
        unsigned int sendTmmbrBitrate = self->_sendTmmbrBitrate;
        unsigned int operatingBitrate = self->_operatingBitrate;
        int v18 = 136317186;
        uint64_t v19 = v5;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCVideoStreamRateAdaptation receivedTMMBN:]";
        __int16 v22 = 1024;
        int v23 = 134;
        __int16 v24 = 2080;
        uint64_t v25 = v8;
        __int16 v26 = 1024;
        int v27 = 134;
        __int16 v28 = 1024;
        unsigned int v29 = receivedTmmbnBitrate;
        __int16 v30 = 2048;
        double v31 = tmmbRTT;
        __int16 v32 = 1024;
        unsigned int v33 = sendTmmbrBitrate;
        __int16 v34 = 1024;
        unsigned int v35 = operatingBitrate;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s:%d received TMMBN:%u RTT:%.3f requested TMMBR:%u, operatingTierBitrate:%u", (uint8_t *)&v18, 0x48u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = objc_msgSend(-[VCVideoStreamRateAdaptation className](self, "className"), "UTF8String");
      unsigned int v14 = self->_receivedTmmbnBitrate;
      double v15 = self->_tmmbRTT;
      unsigned int v16 = self->_sendTmmbrBitrate;
      unsigned int v17 = self->_operatingBitrate;
      int v18 = 136317186;
      uint64_t v19 = v5;
      __int16 v20 = 2080;
      __int16 v21 = "-[VCVideoStreamRateAdaptation receivedTMMBN:]";
      __int16 v22 = 1024;
      int v23 = 134;
      __int16 v24 = 2080;
      uint64_t v25 = v13;
      __int16 v26 = 1024;
      int v27 = 134;
      __int16 v28 = 1024;
      unsigned int v29 = v14;
      __int16 v30 = 2048;
      double v31 = v15;
      __int16 v32 = 1024;
      unsigned int v33 = v16;
      __int16 v34 = 1024;
      unsigned int v35 = v17;
      _os_log_debug_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %s:%d received TMMBN:%u RTT:%.3f requested TMMBR:%u, operatingTierBitrate:%u", (uint8_t *)&v18, 0x48u);
    }
  }
}

- (void)updateVideoStall:(BOOL)a3 withStallDuration:(unsigned int)a4
{
}

- (void)updateRTPReceiveWithTimestamp:(unsigned int)a3 sampleRate:(unsigned int)a4 time:(double)a5 size:(unsigned int)a6 endOfFrame:(BOOL)a7
{
}

- (double)owrd
{
  [(VCVideoStreamRateController *)self->_rateController owrd];
  return result;
}

- (double)nowrd
{
  [(VCVideoStreamRateController *)self->_rateController nowrd];
  return result;
}

- (double)nowrdShort
{
  [(VCVideoStreamRateController *)self->_rateController nowrdShort];
  return result;
}

- (double)nowrdAcc
{
  [(VCVideoStreamRateController *)self->_rateController nowrdAcc];
  return result;
}

- (void)setOperatingBitrate:(unsigned int)a3
{
  if (self->_operatingBitrate == a3)
  {
    if (self->_adaptationTime <= 0.0
      || self->_isOperatingAtMinBitrate
      || [(VCVideoStreamRateController *)self->_rateController minBitrate] < a3)
    {
      BOOL v4 = 0;
    }
    else
    {
      BOOL v4 = 1;
      self->_isOperatingAtMinBitrate = 1;
    }
  }
  else
  {
    self->_unsigned int operatingBitrate = a3;
    self->_isOperatingAtMinBitrate = [(VCVideoStreamRateController *)self->_rateController minBitrate] >= a3;
    unsigned int operatingBitrate = self->_operatingBitrate;
    self->_isOperatingAtMaxBitrate = operatingBitrate >= [(VCVideoStreamRateController *)self->_rateController maxBitrate];
    BOOL v4 = 1;
  }
  self->_downlinkQualityDidChange = v4;
}

- (unsigned)averageReceivedBitrate
{
  return 1000
       * [(VCMediaStreamStats *)self->_stats getBitrateKbpsSinceTime:self->_adaptationTime - self->_averageBitrateWindowDuration];
}

- (void)scheduleTMMBR:(unsigned int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 && self->_sendTmmbrBitrate != a3)
  {
    self->_downlinkQualityDidChange = 1;
    self->_unsigned int sendTmmbrBitrate = a3;
    [(VCVideoStreamRateAdaptation *)self reportingVideoStreamEvent:226];
  }
  self->_unsigned int receivedTmmbnBitrate = 0;
  self->_tmmbrSendTime = micro();
  RTCPSetSendTMMBR((uint64_t)self->_rtpHandle, self->_sendTmmbrBitrate);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    double v6 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = objc_msgSend(-[VCVideoStreamRateAdaptation className](self, "className"), "UTF8String");
        unsigned int sendTmmbrBitrate = self->_sendTmmbrBitrate;
        int v11 = 136316418;
        uint64_t v12 = v4;
        __int16 v13 = 2080;
        unsigned int v14 = "-[VCVideoStreamRateAdaptation scheduleTMMBR:]";
        __int16 v15 = 1024;
        int v16 = 207;
        __int16 v17 = 2080;
        uint64_t v18 = v7;
        __int16 v19 = 1024;
        int v20 = 207;
        __int16 v21 = 1024;
        unsigned int v22 = sendTmmbrBitrate;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s:%d TMMBR scheduled - new bitrate:%u", (uint8_t *)&v11, 0x32u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = objc_msgSend(-[VCVideoStreamRateAdaptation className](self, "className"), "UTF8String");
      unsigned int v10 = self->_sendTmmbrBitrate;
      int v11 = 136316418;
      uint64_t v12 = v4;
      __int16 v13 = 2080;
      unsigned int v14 = "-[VCVideoStreamRateAdaptation scheduleTMMBR:]";
      __int16 v15 = 1024;
      int v16 = 207;
      __int16 v17 = 2080;
      uint64_t v18 = v9;
      __int16 v19 = 1024;
      int v20 = 207;
      __int16 v21 = 1024;
      unsigned int v22 = v10;
      _os_log_debug_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %s:%d TMMBR scheduled - new bitrate:%u", (uint8_t *)&v11, 0x32u);
    }
  }
}

- (id)className
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)reportingVideoStreamEvent:(unsigned __int16)a3
{
  int v3 = a3;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v3 == 227)
  {
    CFStringRef v22 = CFStringCreateWithFormat(v5, 0, @"%d", self->_receivedTmmbnBitrate);
    CFDictionaryAddValue(Mutable, @"VCVSTMMB", v22);
    CFRelease(v22);
    [(VCVideoStreamRateAdaptation *)self roundTripTime];
    CFStringRef v20 = CFStringCreateWithFormat(v5, 0, @"%.5f", v23);
    __int16 v21 = @"VCVSRxRoundTripTime";
  }
  else
  {
    if (v3 != 226) {
      return;
    }
    CFStringRef v7 = CFStringCreateWithFormat(v5, 0, @"%d", self->_sendTmmbrBitrate);
    CFDictionaryAddValue(Mutable, @"VCVSTMMB", v7);
    CFRelease(v7);
    CFStringRef v8 = CFStringCreateWithFormat(v5, 0, @"%d", self->_operatingBitrate);
    CFDictionaryAddValue(Mutable, @"VCVSRxOperatingBitrate", v8);
    CFRelease(v8);
    [(VCVideoStreamRateAdaptation *)self packetLossPercentage];
    CFStringRef v10 = CFStringCreateWithFormat(v5, 0, @"%.5f", v9);
    CFDictionaryAddValue(Mutable, @"VCVSRxPacketLossPercentage", v10);
    CFRelease(v10);
    [(VCVideoStreamRateAdaptation *)self roundTripTime];
    CFStringRef v12 = CFStringCreateWithFormat(v5, 0, @"%.5f", v11);
    CFDictionaryAddValue(Mutable, @"VCVSRxRoundTripTime", v12);
    CFRelease(v12);
    [(VCVideoStreamRateAdaptation *)self owrd];
    CFStringRef v14 = CFStringCreateWithFormat(v5, 0, @"%.5f", v13);
    CFDictionaryAddValue(Mutable, @"VCVSRxOWRD", v14);
    CFRelease(v14);
    [(VCVideoStreamRateAdaptation *)self nowrd];
    CFStringRef v16 = CFStringCreateWithFormat(v5, 0, @"%.5f", v15);
    CFDictionaryAddValue(Mutable, @"VCVSRxNOWRD", v16);
    CFRelease(v16);
    [(VCVideoStreamRateAdaptation *)self nowrdShort];
    CFStringRef v18 = CFStringCreateWithFormat(v5, 0, @"%.5f", v17);
    CFDictionaryAddValue(Mutable, @"VCVSRxNOWRDSHORT", v18);
    CFRelease(v18);
    [(VCVideoStreamRateAdaptation *)self nowrdAcc];
    CFStringRef v20 = CFStringCreateWithFormat(v5, 0, @"%.5f", v19);
    __int16 v21 = @"VCVSRxNOWRDACC";
  }
  CFDictionaryAddValue(Mutable, v21, v20);
  CFRelease(v20);
  reportingVideoStreamEvent();

  CFRelease(Mutable);
}

- (tagHANDLE)rtpHandle
{
  return self->_rtpHandle;
}

- (BOOL)isOperatingAtMinBitrate
{
  return self->_isOperatingAtMinBitrate;
}

- (BOOL)isOperatingAtMaxBitrate
{
  return self->_isOperatingAtMaxBitrate;
}

- (double)packetLossPercentage
{
  return self->_packetLossPercentage;
}

- (double)roundTripTime
{
  return self->_tmmbRTT;
}

- (double)maxOWRD
{
  return self->_maxOWRD;
}

- (void)setMaxOWRD:(double)a3
{
  self->_maxOWRD = a3;
}

- (unsigned)sendTmmbrBitrate
{
  return self->_sendTmmbrBitrate;
}

- (unsigned)operatingBitrate
{
  return self->_operatingBitrate;
}

- (VCMediaStreamStats)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
}

- (void)runVideoStreamRateAdaptation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v4 = 136316162;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  CFStringRef v7 = "-[VCVideoStreamRateAdaptation runVideoStreamRateAdaptation]";
  __int16 v8 = 1024;
  int v9 = 90;
  __int16 v10 = 2080;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "className"), "UTF8String");
  __int16 v12 = 1024;
  int v13 = 90;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s:%d - Failed to receive TMMBN!", (uint8_t *)&v4, 0x2Cu);
}

@end