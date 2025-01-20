@interface VCVideoStreamRTTPLRRateControl
- (BOOL)shouldRampDown;
- (BOOL)shouldRampUp;
- (NSString)description;
- (VCVideoStreamRTTPLRRateControl)init;
- (double)nowrd;
- (double)nowrdAcc;
- (double)nowrdShort;
- (double)owrd;
- (double)rateControlInterval;
- (id)className;
- (int)state;
- (unsigned)rampDownTier;
- (unsigned)rampUpTier;
- (unsigned)targetBitrate;
- (void)doRateControlWithTime:(double)a3 roundTripTime:(double)a4 packetLossRate:(double)a5 operatingTierIndex:(unsigned __int16)a6 averageReceivedBitrate:(unsigned int)a7;
- (void)printRateControlFullInfoWithLogDump:(void *)a3 time:(double)a4 videoStall:(BOOL)a5 videoFrozenDuration:(double)a6 averageTargetBitrate:(unsigned int)a7;
- (void)setMaxTierIndex:(unsigned __int16)a3 minTierIndex:(unsigned __int16)a4;
- (void)setRateControlInterval:(double)a3;
- (void)stateChange:(int)a3;
- (void)stateEnter;
@end

@implementation VCVideoStreamRTTPLRRateControl

- (VCVideoStreamRTTPLRRateControl)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCVideoStreamRTTPLRRateControl;
  v2 = [(VCVideoStreamRTTPLRRateControl *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(VCVideoStreamRTTPLRRateControl *)v2 setMaxTierIndex:26 minTierIndex:0];
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampUpFrozenDuration" defaultValue:10.0];
    v3->_rampUpFrozenDuration = v4;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampUpPacketLossRate" defaultValue:0.01];
    v3->_rampUpPacketLossRate = v5;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampDownPacketLossRate" defaultValue:0.03];
    v3->_rampDownPacketLossRate = v6;
    +[VCDefaults getDoubleValueForKey:@"videoStreamRampDownRoundTripTime" defaultValue:0.25];
    v3->_rampDownRoundTripTime = v7;
  }
  return v3;
}

- (void)setMaxTierIndex:(unsigned __int16)a3 minTierIndex:(unsigned __int16)a4
{
  self->_maxTierIndex = a3;
  self->_minTierIndex = a4;
  self->_currentTierIndex = a4;
  self->_state = 0;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@ state:%d RTT:%.3f packetLossRate:%f", -[VCVideoStreamRTTPLRRateControl className](self, "className"), self->_state, *(void *)&self->_roundTripTime, *(void *)&self->_packetLossRate];
}

- (void)doRateControlWithTime:(double)a3 roundTripTime:(double)a4 packetLossRate:(double)a5 operatingTierIndex:(unsigned __int16)a6 averageReceivedBitrate:(unsigned int)a7
{
  int state = self->_state;
  if (state != 3)
  {
    self->_rateControlTime = a3;
    self->_packetLossRate = a5;
    self->_roundTripTime = a4;
    self->_currentTierIndex = a6;
    if (state == 1)
    {
      if ([(VCVideoStreamRTTPLRRateControl *)self shouldRampDown])
      {
        self->_currentTierIndex = [(VCVideoStreamRTTPLRRateControl *)self rampDownTier];
        self->_double rampUpFrozenTime = a3;
        double rampUpFrozenTime = a3;
      }
      else
      {
        double rampUpFrozenTime = self->_rampUpFrozenTime;
      }
      if (a3 - rampUpFrozenTime <= self->_rampUpFrozenDuration) {
        goto LABEL_14;
      }
      uint64_t v10 = self;
      uint64_t v11 = 0;
    }
    else
    {
      if (state)
      {
LABEL_14:
        self->_targetBitrate = g_adwTxRateTiers[self->_currentTierIndex];
        return;
      }
      if (![(VCVideoStreamRTTPLRRateControl *)self shouldRampDown])
      {
        if ([(VCVideoStreamRTTPLRRateControl *)self shouldRampUp]) {
          self->_currentTierIndex = [(VCVideoStreamRTTPLRRateControl *)self rampUpTier];
        }
        goto LABEL_14;
      }
      self->_currentTierIndex = [(VCVideoStreamRTTPLRRateControl *)self rampDownTier];
      uint64_t v10 = self;
      uint64_t v11 = 1;
    }
    [(VCVideoStreamRTTPLRRateControl *)v10 stateChange:v11];
    goto LABEL_14;
  }
}

- (void)printRateControlFullInfoWithLogDump:(void *)a3 time:(double)a4 videoStall:(BOOL)a5 videoFrozenDuration:(double)a6 averageTargetBitrate:(unsigned int)a7
{
  if (a3) {
    VRLogfilePrintWithTimestamp((uint64_t)a3, "%8.3f/%04X:\t%.4f\t%.4f\t%.4f\t%.4f %c\tRTT:%-4u\tPLR:%4.2f@%.1f\tRRx:0\tMBL:0\t%3u/%3u\t 0:0/0  0:0/0 CS: 0 0 0 BB: 0\t0\t0\t UAT S _\t%d\n", (uint64_t)a3, a5, *(uint64_t *)&a7, v7, v8, v9, SLOBYTE(a4));
  }
}

- (double)owrd
{
  return 0.0;
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

- (id)className
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
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
        uint64_t v7 = objc_msgSend(-[VCVideoStreamRTTPLRRateControl className](self, "className"), "UTF8String");
        int state = self->_state;
        int v9 = 136316674;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        v12 = "-[VCVideoStreamRTTPLRRateControl stateChange:]";
        __int16 v13 = 1024;
        int v14 = 155;
        __int16 v15 = 2080;
        uint64_t v16 = v7;
        __int16 v17 = 1024;
        int v18 = 155;
        __int16 v19 = 1024;
        int v20 = state;
        __int16 v21 = 1024;
        int v22 = a3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s:%d Exiting state:%d Entering state:%d", (uint8_t *)&v9, 0x38u);
      }
    }
    [(VCVideoStreamRTTPLRRateControl *)self stateExit];
    self->_int state = a3;
    [(VCVideoStreamRTTPLRRateControl *)self stateEnter];
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
  return self->_roundTripTime >= self->_rampDownRoundTripTime || self->_packetLossRate >= self->_rampDownPacketLossRate;
}

- (BOOL)shouldRampUp
{
  return self->_packetLossRate < self->_rampUpPacketLossRate;
}

- (int)state
{
  return self->_state;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (double)rateControlInterval
{
  return self->_rateControlInterval;
}

- (void)setRateControlInterval:(double)a3
{
  self->_rateControlInterval = a3;
}

@end