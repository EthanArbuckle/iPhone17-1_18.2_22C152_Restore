@interface VCVideoStreamOWRDLossEventRateControl
- (BOOL)shouldRampDown;
- (BOOL)shouldRampUp;
- (NSString)description;
- (VCVideoStreamOWRDLossEventRateControl)init;
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

@implementation VCVideoStreamOWRDLossEventRateControl

- (VCVideoStreamOWRDLossEventRateControl)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCVideoStreamOWRDLossEventRateControl;
  v2 = [(VCVideoStreamOWRDLossEventRateControl *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(VCVideoStreamOWRDLossEventRateControl *)v2 setMaxTierIndex:26 minTierIndex:0];
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
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampDownOWRDThreshold" defaultValue:0.15];
    v3->_rampDownOWRDThreshold = v9;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampDownLossRateThreshold" defaultValue:0.005];
    v3->_rampDownLossRateThreshold = v10;
  }
  return v3;
}

- (void)setMaxTierIndex:(unsigned __int16)a3 minTierIndex:(unsigned __int16)a4
{
  self->_maxTierIndex = a3;
  self->_minTierIndex = a4;
  self->_currentTierIndex = a4;
  self->_state = 2;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@ state:%d OWRD:%.3f RTT:%.3f packetLossRate:%f", -[VCVideoStreamOWRDLossEventRateControl className](self, "className"), self->_state, *(void *)&self->_owrd, *(void *)&self->_roundTripTime, *(void *)&self->_packetLossRate];
}

- (void)doRateControlWithTime:(double)a3 roundTripTime:(double)a4 packetLossRate:(double)a5 operatingTierIndex:(unsigned __int16)a6 averageReceivedBitrate:(unsigned int)a7
{
  if (self->_state != 3)
  {
    self->_rampUpStatus = 0;
    self->_rateControlTime = a3;
    self->_roundTripTime = a4;
    self->_averageReceivedBitrate = a7;
    [(VCVideoStreamOWRDLossEventRateControl *)self updatePacketLossRate:a5 time:a3];
    self->_currentTierIndex = a6;
    int state = self->_state;
    if (state)
    {
      if (state == 1)
      {
        self->_rampUpStatus |= 1uLL;
        if ([(VCVideoStreamOWRDLossEventRateControl *)self shouldRampDown])
        {
          self->_currentTierIndex = [(VCVideoStreamOWRDLossEventRateControl *)self rampDownTier];
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
        goto LABEL_18;
      }
      if (state == 2)
      {
        if ([(VCVideoStreamOWRDLossEventRateControl *)self shouldRampDown])
        {
          self->_currentTierIndex = [(VCVideoStreamOWRDLossEventRateControl *)self rampDownTier];
LABEL_18:
          uint64_t v13 = self;
          uint64_t v14 = 0;
          goto LABEL_19;
        }
        if ([(VCVideoStreamOWRDLossEventRateControl *)self shouldRampUp])
        {
          unsigned __int16 v11 = [(VCVideoStreamOWRDLossEventRateControl *)self rampUpTier];
          goto LABEL_13;
        }
      }
    }
    else
    {
      if ([(VCVideoStreamOWRDLossEventRateControl *)self shouldRampDown])
      {
        unsigned __int16 v11 = [(VCVideoStreamOWRDLossEventRateControl *)self rampDownTier];
LABEL_13:
        self->_currentTierIndex = v11;
        goto LABEL_20;
      }
      if ([(VCVideoStreamOWRDLossEventRateControl *)self shouldRampUp])
      {
        self->_currentTierIndex = [(VCVideoStreamOWRDLossEventRateControl *)self rampUpTier];
        uint64_t v13 = self;
        uint64_t v14 = 1;
LABEL_19:
        [(VCVideoStreamOWRDLossEventRateControl *)v13 stateChange:v14];
      }
    }
LABEL_20:
    self->_targetBitrate = g_adwTxRateTiers[self->_currentTierIndex];
  }
}

- (void)printRateControlFullInfoWithLogDump:(void *)a3 time:(double)a4 videoStall:(BOOL)a5 videoFrozenDuration:(double)a6 averageTargetBitrate:(unsigned int)a7
{
  if (a3) {
    VRLogfilePrintWithTimestamp((uint64_t)a3, "%8.3f/%04X:\t%.4f\t%.4f\t%.4f\t%.4f %c\tRTT:%-4u\tPLR:%4.2f@%.1f\tRRx:0\tMBL:0\t%3u/%3u\t 0:0/0  0:0/0 CS: 0 0 0 BB: %u\t%d\t0\t UAT S _\t%d\n", (uint64_t)a3, a5, *(uint64_t *)&a7, v7, v8, v9, SLOBYTE(a4));
  }
}

- (double)nowrd
{
  return 0.0;
}

- (double)nowrdShort
{
  return 0.0;
}

- (double)nowrdAcc
{
  return 0.0;
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
        uint64_t v7 = objc_msgSend(-[VCVideoStreamOWRDLossEventRateControl className](self, "className"), "UTF8String");
        int state = self->_state;
        int v9 = 136316674;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        objc_super v12 = "-[VCVideoStreamOWRDLossEventRateControl stateChange:]";
        __int16 v13 = 1024;
        int v14 = 193;
        __int16 v15 = 2080;
        uint64_t v16 = v7;
        __int16 v17 = 1024;
        int v18 = 193;
        __int16 v19 = 1024;
        int v20 = state;
        __int16 v21 = 1024;
        int v22 = a3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s:%d Exiting state:%d Entering state:%d", (uint8_t *)&v9, 0x38u);
      }
    }
    [(VCVideoStreamOWRDLossEventRateControl *)self stateExit];
    self->_int state = a3;
    [(VCVideoStreamOWRDLossEventRateControl *)self stateEnter];
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
  return v2;
}

- (BOOL)shouldRampDown
{
  BOOL v3 = self->_owrd >= self->_rampDownOWRDThreshold;
  uint64_t v4 = g_adwTxRateTiers[self->_currentTierIndex];
  int v5 = [(VCVideoStreamOWRDLossEventRateControl *)self lossEventCount];
  if (v5 >= [(VCVideoStreamOWRDLossEventRateControl *)self lossEventCountThresholdForBitrate:v4])
  {
    [(VCVideoStreamOWRDLossEventRateControl *)self resetLossEventBuffer];
    return 1;
  }
  return v3;
}

- (BOOL)shouldRampUp
{
  double v3 = self->_rateControlTime - self->_lastLossEventTime;
  double rateControlInterval = self->_rateControlInterval;
  double v5 = self->_rampUpNoLossEventDurationRatio * rateControlInterval;
  BOOL result = v3 >= v5;
  if (v3 < v5) {
    self->_rampUpStatus |= 2uLL;
  }
  unsigned int averageReceivedBitrate = self->_averageReceivedBitrate;
  if (averageReceivedBitrate)
  {
    LODWORD(rateControlInterval) = g_adwTxRateTiers[self->_currentTierIndex];
    if (self->_rampUpStatusRateLimitedThreshold * (double)*(unint64_t *)&rateControlInterval > (double)averageReceivedBitrate
      && self->_state != 2)
    {
      BOOL result = 0;
      self->_rampUpStatus |= 4uLL;
    }
  }
  return result;
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
  if (self->_previousSendTimestamp < a3)
  {
    unsigned int v11 = a3 - firstSendTimestamp;
    unsigned int previousTimestampDiff = self->_previousTimestampDiff;
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
            v38 = "-[VCVideoStreamOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
            __int16 v39 = 1024;
            int v40 = 316;
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
            v38 = "-[VCVideoStreamOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
            __int16 v39 = 1024;
            int v40 = 345;
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
          v38 = "-[VCVideoStreamOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
          __int16 v39 = 1024;
          int v40 = 345;
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
        v38 = "-[VCVideoStreamOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
        __int16 v39 = 1024;
        int v40 = 333;
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

- (double)rateControlInterval
{
  return self->_rateControlInterval;
}

- (void)setRateControlInterval:(double)a3
{
  self->_double rateControlInterval = a3;
}

@end