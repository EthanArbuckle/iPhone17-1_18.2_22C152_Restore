@interface VCVideoStreamNOWRDLossEventRateControl
- (BOOL)shouldRampDown;
- (BOOL)shouldRampUp;
- (NSString)description;
- (VCVideoStreamNOWRDLossEventRateControl)init;
- (double)nowrd;
- (double)nowrdAcc;
- (double)nowrdShort;
- (double)owrd;
- (double)rateControlInterval;
- (id)className;
- (int)lossEventCount;
- (int)lossEventCountThresholdForBitrate:(unsigned int)a3;
- (int)state;
- (unsigned)rampDownTier;
- (unsigned)rampUpTier;
- (unsigned)targetBitrate;
- (void)calculateNOWRD:(double)a3 time:(double)a4;
- (void)calculateOWRDWithTimestamp:(unsigned int)a3 sampleRate:(unsigned int)a4 time:(double)a5;
- (void)doRateControlWithTime:(double)a3 roundTripTime:(double)a4 packetLossRate:(double)a5 operatingTierIndex:(unsigned __int16)a6 averageReceivedBitrate:(unsigned int)a7;
- (void)printRateControlFullInfoWithLogDump:(void *)a3 time:(double)a4 videoStall:(BOOL)a5 videoFrozenDuration:(double)a6 averageTargetBitrate:(unsigned int)a7;
- (void)resetLossEventBuffer;
- (void)setMaxTierIndex:(unsigned __int16)a3 minTierIndex:(unsigned __int16)a4;
- (void)setRateControlInterval:(double)a3;
- (void)stateChange:(int)a3;
- (void)stateEnter;
- (void)updatePacketLossRate:(double)a3 time:(double)a4;
@end

@implementation VCVideoStreamNOWRDLossEventRateControl

- (VCVideoStreamNOWRDLossEventRateControl)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)VCVideoStreamNOWRDLossEventRateControl;
  v2 = [(VCVideoStreamNOWRDLossEventRateControl *)&v15 init];
  v3 = v2;
  if (v2)
  {
    [(VCVideoStreamNOWRDLossEventRateControl *)v2 setMaxTierIndex:26 minTierIndex:0];
    v3->_rateControlInterval = 0.5;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampUpFrozenDuration" defaultValue:2.0];
    v3->_rampUpFrozenDuration = v4;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampUpNoLossEventDurationRatio" defaultValue:4.0];
    v3->_rampUpNoLossEventDurationRatio = v5;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampDownLossEventCountThreshold" defaultValue:2.0];
    v3->_rampDownLossEventCountThreshold = v6;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampDownLossEventBitrateThreshold" defaultValue:502000.0];
    v3->_rampDownLossEventBitrateThreshold = v7;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampUpStatusRateLimitedThreshold" defaultValue:0.5];
    v3->_rampUpStatusRateLimitedThreshold = v8;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampDownLossRateThreshold" defaultValue:0.005];
    v3->_rampDownLossRateThreshold = v9;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampDownNOWRDThreshold" defaultValue:0.1];
    v3->_nowrdRampDownThreshold = v10;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampUpNOWRDThreshold" defaultValue:0.005];
    v3->_nowrdRampUpThreshold = v11;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampDownNOWRDAccThreshold" defaultValue:0.1];
    v3->_nowrdAccRampDownThreshold = v12;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampUpNOWRDAccThreshold" defaultValue:0.1];
    v3->_nowrdAccRampUpThreshold = v13;
    v3->_doRateControlCounter = 0;
  }
  return v3;
}

- (void)setMaxTierIndex:(unsigned __int16)a3 minTierIndex:(unsigned __int16)a4
{
  self->_maxTierIndex = a3;
  self->_minTierIndex = a4;
  self->_currentTierIndex = a4;
  self->_targetBitrate = g_adwTxRateTiers[a4];
  self->_state = 2;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@ state:%d OWRD:%.3f NOWRD:%.3f NOWRDACC:%.3f RTT:%.3f packetLossRate:%f rampingStatus:0x%04X", -[VCVideoStreamNOWRDLossEventRateControl className](self, "className"), self->_state, *(void *)&self->_owrd, *(void *)&self->_nowrd, *(void *)&self->_nowrdAcc, *(void *)&self->_roundTripTime, *(void *)&self->_packetLossRate, self->_rampDownStatus | self->_rampUpStatus];
}

- (void)doRateControlWithTime:(double)a3 roundTripTime:(double)a4 packetLossRate:(double)a5 operatingTierIndex:(unsigned __int16)a6 averageReceivedBitrate:(unsigned int)a7
{
  if (self->_state != 3)
  {
    *(void *)&self->_rampUpStatus = 0;
    self->_rateControlTime = a3;
    self->_roundTripTime = a4;
    self->_averageReceivedBitrate = a7;
    ++self->_doRateControlCounter;
    [(VCVideoStreamNOWRDLossEventRateControl *)self updatePacketLossRate:a5 time:a3];
    self->_currentTierIndex = a6;
    self->_prevOperatingTierIndex = a6;
    int state = self->_state;
    if (state)
    {
      if (state == 1)
      {
        self->_rampUpStatus |= 1u;
        if ([(VCVideoStreamNOWRDLossEventRateControl *)self shouldRampDown])
        {
          self->_currentTierIndex = [(VCVideoStreamNOWRDLossEventRateControl *)self rampDownTier];
          self->_double rampUpFrozenTime = a3;
          double rampUpFrozenTime = a3;
        }
        else
        {
          double rampUpFrozenTime = self->_rampUpFrozenTime;
        }
        if (a3 - rampUpFrozenTime <= self->_rampUpFrozenDuration) {
          goto LABEL_20;
        }
LABEL_18:
        double v13 = self;
        uint64_t v14 = 0;
        goto LABEL_19;
      }
      if (state == 2)
      {
        if (![(VCVideoStreamNOWRDLossEventRateControl *)self shouldRampDown])
        {
          if ([(VCVideoStreamNOWRDLossEventRateControl *)self shouldRampUp]) {
            self->_currentTierIndex = [(VCVideoStreamNOWRDLossEventRateControl *)self rampUpTier];
          }
          goto LABEL_20;
        }
        self->_currentTierIndex = [(VCVideoStreamNOWRDLossEventRateControl *)self rampDownTier];
        goto LABEL_18;
      }
LABEL_20:
      self->_targetBitrate = g_adwTxRateTiers[self->_currentTierIndex];
      return;
    }
    if ([(VCVideoStreamNOWRDLossEventRateControl *)self shouldRampDown])
    {
      unsigned __int16 v11 = [(VCVideoStreamNOWRDLossEventRateControl *)self rampDownTier];
    }
    else
    {
      if (![(VCVideoStreamNOWRDLossEventRateControl *)self shouldRampUp]) {
        goto LABEL_20;
      }
      unsigned __int16 v11 = [(VCVideoStreamNOWRDLossEventRateControl *)self rampUpTier];
    }
    self->_currentTierIndex = v11;
    double v13 = self;
    uint64_t v14 = 1;
LABEL_19:
    [(VCVideoStreamNOWRDLossEventRateControl *)v13 stateChange:v14];
    goto LABEL_20;
  }
}

- (void)printRateControlFullInfoWithLogDump:(void *)a3 time:(double)a4 videoStall:(BOOL)a5 videoFrozenDuration:(double)a6 averageTargetBitrate:(unsigned int)a7
{
  if (a3)
  {
    if (self->_doRateControlCounter) {
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%8.3f/%04X:\t%.4f\t%.4f\t%.4f\t%.4f %c\tRTT:%-4u\tPLR:%4.2f@%.1f\tRRx:%3u\tMBL:0\t%3u/%3u\t 0:0/0  0:0/0 CS: 0 0 0 BB: %u\t%04X\t%u\t UAT S _\t%d\n", (uint64_t)a3, a5, *(uint64_t *)&a7, v7, v8, v9, SLOBYTE(a4));
    }
  }
}

- (void)stateChange:(int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = objc_msgSend(-[VCVideoStreamNOWRDLossEventRateControl className](self, "className"), "UTF8String");
        int state = self->_state;
        int v9 = 136316674;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        double v12 = "-[VCVideoStreamNOWRDLossEventRateControl stateChange:]";
        __int16 v13 = 1024;
        int v14 = 223;
        __int16 v15 = 2080;
        uint64_t v16 = v7;
        __int16 v17 = 1024;
        int v18 = 223;
        __int16 v19 = 1024;
        int v20 = state;
        __int16 v21 = 1024;
        int v22 = a3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s:%d Exiting state:%d Entering state:%d", (uint8_t *)&v9, 0x38u);
      }
    }
    [(VCVideoStreamNOWRDLossEventRateControl *)self stateExit];
    self->_int state = a3;
    [(VCVideoStreamNOWRDLossEventRateControl *)self stateEnter];
  }
}

- (void)stateEnter
{
  if (self->_state == 1) {
    self->_double rampUpFrozenTime = self->_rateControlTime;
  }
}

- (unsigned)rampUpTier
{
  if ((unsigned __int16)(self->_currentTierIndex + 1) >= self->_maxTierIndex) {
    return self->_maxTierIndex;
  }
  else {
    return self->_currentTierIndex + 1;
  }
}

- (unsigned)rampDownTier
{
  int v2 = self->_currentTierIndex - 2;
  if (v2 <= self->_minTierIndex) {
    LOWORD(v2) = self->_minTierIndex;
  }
  self->_nowrdAcc = 0.0;
  return v2;
}

- (BOOL)shouldRampDown
{
  uint64_t v3 = g_adwTxRateTiers[self->_currentTierIndex];
  double nowrd = self->_nowrd;
  double nowrdRampDownThreshold = self->_nowrdRampDownThreshold;
  BOOL v6 = nowrd > nowrdRampDownThreshold;
  if (nowrd > nowrdRampDownThreshold) {
    self->_rampDownStatus |= 0x80u;
  }
  if (self->_nowrdAcc > self->_nowrdAccRampDownThreshold)
  {
    self->_rampDownStatus |= 0x100u;
    BOOL v6 = 1;
  }
  int v7 = [(VCVideoStreamNOWRDLossEventRateControl *)self lossEventCount];
  if (v7 >= [(VCVideoStreamNOWRDLossEventRateControl *)self lossEventCountThresholdForBitrate:v3])
  {
    [(VCVideoStreamNOWRDLossEventRateControl *)self resetLossEventBuffer];
    self->_rampDownStatus |= 0x20u;
    return 1;
  }
  return v6;
}

- (BOOL)shouldRampUp
{
  double v2 = self->_rateControlTime - self->_lastLossEventTime;
  double rateControlInterval = self->_rateControlInterval;
  double v4 = self->_rampUpNoLossEventDurationRatio * rateControlInterval;
  BOOL v5 = v2 >= v4;
  if (v2 < v4) {
    self->_rampUpStatus |= 2u;
  }
  unsigned int averageReceivedBitrate = self->_averageReceivedBitrate;
  if (averageReceivedBitrate)
  {
    LODWORD(rateControlInterval) = g_adwTxRateTiers[self->_currentTierIndex];
    if (self->_rampUpStatusRateLimitedThreshold * (double)*(unint64_t *)&rateControlInterval > (double)averageReceivedBitrate
      && self->_state != 2)
    {
      BOOL v5 = 0;
      self->_rampUpStatus |= 4u;
    }
  }
  if (self->_nowrd > self->_nowrdRampUpThreshold)
  {
    BOOL v5 = 0;
    self->_rampUpStatus |= 8u;
  }
  double nowrdAcc = self->_nowrdAcc;
  if (nowrdAcc == 0.0 || nowrdAcc > self->_nowrdAccRampUpThreshold)
  {
    BOOL v5 = 0;
    self->_rampUpStatus |= 0x10u;
  }
  return v5;
}

- (void)updatePacketLossRate:(double)a3 time:(double)a4
{
  self->_packetLossRate = a3;
  lossEventBuffer = self->_lossEventBuffer;
  uint64_t lossEventBufferIndex = self->_lossEventBufferIndex;
  if (self->_rampDownLossRateThreshold >= a3)
  {
    lossEventBuffer[lossEventBufferIndex] = 0;
  }
  else
  {
    lossEventBuffer[lossEventBufferIndex] = 1;
    self->_lastLossEventTime = a4;
  }
  int v6 = lossEventBufferIndex + 1;
  BOOL v7 = -v6 < 0;
  int v8 = -v6 & 3;
  int v9 = v6 & 3;
  if (!v7) {
    int v9 = -v8;
  }
  self->_uint64_t lossEventBufferIndex = v9;
}

- (int)lossEventCount
{
  v2.i32[0] = *(_DWORD *)self->_lossEventBuffer;
  return vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v2)));
}

- (int)lossEventCountThresholdForBitrate:(unsigned int)a3
{
  if (self->_rampDownLossEventBitrateThreshold <= (double)a3) {
    return 1;
  }
  else {
    return (int)self->_rampDownLossEventCountThreshold;
  }
}

- (void)resetLossEventBuffer
{
  *(void *)self->_lossEventBuffer = 0;
}

- (void)calculateOWRDWithTimestamp:(unsigned int)a3 sampleRate:(unsigned int)a4 time:(double)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  unsigned int firstSendTimestamp = self->_firstSendTimestamp;
  if (!firstSendTimestamp)
  {
    self->_unsigned int firstSendTimestamp = a3;
    unsigned int firstSendTimestamp = a3;
  }
  double firstReceiveTime = self->_firstReceiveTime;
  if (firstReceiveTime == 0.0)
  {
    self->_double firstReceiveTime = a5;
    double firstReceiveTime = a5;
  }
  unsigned int v11 = a3 - firstSendTimestamp;
  unsigned int previousTimestampDiff = self->_previousTimestampDiff;
  if (v11 != previousTimestampDiff)
  {
    if (v11 - previousTimestampDiff <= 0x7FFFFFFE)
    {
      if (v11 < previousTimestampDiff)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          int v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v35 = 136315650;
            uint64_t v36 = v13;
            __int16 v37 = 2080;
            v38 = "-[VCVideoStreamNOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
            __int16 v39 = 1024;
            int v40 = 367;
            _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Time counter wrapped around", (uint8_t *)&v35, 0x1Cu);
          }
        }
        ++self->_sendTimestampWrappedAround;
        double firstReceiveTime = self->_firstReceiveTime;
      }
      self->_unsigned int previousTimestampDiff = v11;
    }
    double v15 = a5 - firstReceiveTime - (double)(v11 - self->_sendTimestampWrappedAround) / (double)a4;
    self->_previousSendTimestamp = a3;
    double shortAverageLag = self->_shortAverageLag;
    if (shortAverageLag == 0.0 || (double longAverageLag = self->_longAverageLag, longAverageLag == 0.0))
    {
      self->_double shortAverageLag = v15;
      self->_double longAverageLag = v15;
      double longAverageLag = v15;
      double shortAverageLag = v15;
    }
    if (v15 - shortAverageLag <= 30.0 && longAverageLag - v15 <= 30.0)
    {
      double v23 = v15 * 0.0001 + longAverageLag * 0.9999;
      double v24 = v15 * 0.1 + shortAverageLag * 0.9;
      self->_double shortAverageLag = v24;
      self->_double longAverageLag = v23;
      double v25 = v24 - v23;
      self->_double owrd = v25;
      if (v25 < 0.0)
      {
        self->_double longAverageLag = v24;
        self->_double owrd = 0.0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E4F47A50];
        v28 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            double v29 = self->_shortAverageLag;
            double v30 = self->_longAverageLag;
            double owrd = self->_owrd;
            int v35 = 136317186;
            uint64_t v36 = v26;
            __int16 v37 = 2080;
            v38 = "-[VCVideoStreamNOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
            __int16 v39 = 1024;
            int v40 = 396;
            __int16 v41 = 1024;
            *(_DWORD *)v42 = a3;
            *(_WORD *)&v42[4] = 2048;
            *(double *)&v42[6] = a5;
            *(_WORD *)&v42[14] = 2048;
            *(double *)&v42[16] = v15;
            *(_WORD *)&v42[24] = 2048;
            *(double *)&v42[26] = v29;
            *(_WORD *)&v42[34] = 2048;
            *(double *)&v42[36] = v30;
            __int16 v43 = 2048;
            double v44 = owrd;
            _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d calculateOWRDWithTimestamp: timestamp: %u, now: %f, Lag %fs short %fs: long %fs : owrd %fs", (uint8_t *)&v35, 0x54u);
          }
        }
        else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          double v32 = self->_shortAverageLag;
          double v33 = self->_longAverageLag;
          double v34 = self->_owrd;
          int v35 = 136317186;
          uint64_t v36 = v26;
          __int16 v37 = 2080;
          v38 = "-[VCVideoStreamNOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
          __int16 v39 = 1024;
          int v40 = 396;
          __int16 v41 = 1024;
          *(_DWORD *)v42 = a3;
          *(_WORD *)&v42[4] = 2048;
          *(double *)&v42[6] = a5;
          *(_WORD *)&v42[14] = 2048;
          *(double *)&v42[16] = v15;
          *(_WORD *)&v42[24] = 2048;
          *(double *)&v42[26] = v32;
          *(_WORD *)&v42[34] = 2048;
          *(double *)&v42[36] = v33;
          __int16 v43 = 2048;
          double v44 = v34;
          _os_log_debug_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEBUG, " [%s] %s:%d calculateOWRDWithTimestamp: timestamp: %u, now: %f, Lag %fs short %fs: long %fs : owrd %fs", (uint8_t *)&v35, 0x54u);
        }
      }
      [(VCVideoStreamNOWRDLossEventRateControl *)self calculateNOWRD:self->_owrd time:a5];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      int v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        double v21 = self->_shortAverageLag;
        double v22 = self->_longAverageLag;
        int v35 = 136316674;
        uint64_t v36 = v19;
        __int16 v37 = 2080;
        v38 = "-[VCVideoStreamNOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
        __int16 v39 = 1024;
        int v40 = 384;
        __int16 v41 = 2048;
        *(double *)v42 = v15;
        *(_WORD *)&v42[8] = 2048;
        *(double *)&v42[10] = v21;
        *(_WORD *)&v42[18] = 2048;
        *(double *)&v42[20] = v22;
        *(_WORD *)&v42[28] = 2048;
        *(void *)&v42[30] = 0x403E000000000000;
        _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d calculateOWRDWithTimestamp: Lag (%fs) looks spurios (short %fs: long %fs : threshold %fs), discarding", (uint8_t *)&v35, 0x44u);
      }
    }
  }
}

- (void)calculateNOWRD:(double)a3 time:(double)a4
{
  p_OWRDList = &self->OWRDList;
  uint64_t rearIndex = self->OWRDList.rearIndex;
  if (a4 - self->OWRDList.time[rearIndex] >= 0.01)
  {
    int v6 = ((int)rearIndex + 1) % 50;
    self->OWRDList.uint64_t rearIndex = v6;
    double owrd = self->OWRDList.owrd;
    self->OWRDList.owrd[v6] = a3;
    p_OWRDList->time[v6] = a4;
    int size = self->OWRDList.size;
    if (size >= 50) {
      int v9 = self->OWRDList.size;
    }
    else {
      int v9 = size + 1;
    }
    self->OWRDList.int size = v9;
    int frontIndex = self->OWRDList.frontIndex;
    if (v6 == frontIndex && v9 != 1)
    {
      int frontIndex = (char)(v6
                        + 1
                        - 50 * ((((41 * (char)(v6 + 1)) & 0x8000) != 0) + ((41 * (char)(v6 + 1)) >> 11)));
      self->OWRDList.int frontIndex = frontIndex;
    }
    if (v9 >= 4)
    {
      signed int v12 = (char)(v6
                 + 47
                 - 50 * ((((41 * (char)(v6 + 47)) & 0x8000) != 0) + ((41 * (char)(v6 + 47)) >> 11)));
      signed int v13 = frontIndex;
      if (frontIndex != v12)
      {
        signed int v13 = (char)(v6
                   + 47
                   - 50 * ((((41 * (char)(v6 + 47)) & 0x8000) != 0) + ((41 * (char)(v6 + 47)) >> 11)));
        while (a4 - p_OWRDList->time[v13] <= 0.5)
        {
          signed int v13 = (v13 + 49) % 0x32u;
          if (v13 == frontIndex)
          {
            signed int v13 = frontIndex;
            break;
          }
        }
      }
      int state = self->_state;
      if (state != 2 || (double v15 = 0.0, a4 - p_OWRDList->time[v13] >= 0.2))
      {
        int v16 = v6 + 50;
        if (v6 > v13) {
          int v16 = v6;
        }
        int v17 = v16 - v13;
        unsigned int v18 = v16 - v13 + 2;
        if (v16 - v13 >= -1) {
          int v19 = v17 + 1;
        }
        else {
          int v19 = v16 - v13 + 2;
        }
        if (v17 < 0)
        {
          double v25 = 0.0;
          double v24 = 0.0;
          double v26 = 0.0;
        }
        else
        {
          int v20 = (v13 + (v19 >> 1)) % 50;
          unsigned int v21 = v18 >> 1;
          double v22 = 0.0;
          double v23 = 0.0;
          double v24 = 0.0;
          double v25 = 0.0;
          do
          {
            double v25 = v25 + owrd[v13 % 50];
            double v24 = v24 + owrd[v20 % 50];
            double v23 = v23 + p_OWRDList->time[v13 % 50];
            double v22 = v22 + p_OWRDList->time[v20 % 50];
            ++v20;
            ++v13;
            --v21;
          }
          while (v21);
          double v26 = v22 - v23;
        }
        if (fabs(v26) < 0.001) {
          return;
        }
        double v15 = (v24 - v25) / v26 * 0.5;
      }
      self->_double nowrd = v15;
      if (frontIndex != v12)
      {
        while (a4 - p_OWRDList->time[v12] <= 0.25)
        {
          signed int v12 = (v12 + 49) % 0x32u;
          if (v12 == frontIndex) {
            goto LABEL_35;
          }
        }
        int frontIndex = v12;
      }
LABEL_35:
      if (state == 2)
      {
        double v27 = 0.0;
        if (a4 - p_OWRDList->time[frontIndex] < 0.2) {
          goto LABEL_49;
        }
      }
      int v28 = v6 + 50;
      if (v6 > frontIndex) {
        int v28 = v6;
      }
      int v29 = v28 - frontIndex;
      unsigned int v30 = v28 - frontIndex + 2;
      if (v28 - frontIndex >= -1) {
        int v31 = v29 + 1;
      }
      else {
        int v31 = v28 - frontIndex + 2;
      }
      if (v29 < 0)
      {
        double v37 = 0.0;
        double v36 = 0.0;
        double v38 = 0.0;
      }
      else
      {
        int v32 = (frontIndex + (v31 >> 1)) % 50;
        unsigned int v33 = v30 >> 1;
        double v34 = 0.0;
        double v35 = 0.0;
        double v36 = 0.0;
        double v37 = 0.0;
        do
        {
          double v37 = v37 + owrd[frontIndex % 50];
          double v36 = v36 + owrd[v32 % 50];
          double v35 = v35 + p_OWRDList->time[frontIndex % 50];
          double v34 = v34 + p_OWRDList->time[v32 % 50];
          ++v32;
          ++frontIndex;
          --v33;
        }
        while (v33);
        double v38 = v34 - v35;
      }
      if (fabs(v38) >= 0.001)
      {
        double v27 = (v36 - v37) / v38 * 0.25;
LABEL_49:
        self->_nowrdShort = v27;
        double v39 = p_OWRDList->time[(v6 + 49) % 0x32u];
        double v40 = self->_nowrdAcc + v15 * (a4 - v39) + v15 * (a4 - v39);
        if (v40 < 0.0) {
          double v40 = 0.0;
        }
        self->_double nowrdAcc = v40;
      }
    }
  }
}

- (id)className
{
  uint8x8_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (int)state
{
  return self->_state;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (double)owrd
{
  return self->_owrd;
}

- (double)nowrd
{
  return self->_nowrd;
}

- (double)nowrdShort
{
  return self->_nowrdShort;
}

- (double)nowrdAcc
{
  return self->_nowrdAcc;
}

- (double)rateControlInterval
{
  return self->_rateControlInterval;
}

- (void)setRateControlInterval:(double)a3
{
  self->_double rateControlInterval = a3;
}

@end