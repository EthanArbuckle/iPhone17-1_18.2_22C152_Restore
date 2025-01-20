@interface VCRedundancyControlAlgorithmAudioMultiWay
- (VCRedundancyControlAlgorithmAudioMultiWay)init;
- (double)redundancyInterval;
- (unsigned)redundancyPercentage;
- (unsigned)updateRedundancyPercentageWithPLRThresholds:(unsigned int *)a3;
- (void)computeRedundancyInfo;
- (void)processNWConnectionStatistics:(tagVCStatisticsMessage *)a3;
- (void)processRCNetworkStatistics:(tagVCStatisticsMessage *)a3;
- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3;
@end

@implementation VCRedundancyControlAlgorithmAudioMultiWay

- (VCRedundancyControlAlgorithmAudioMultiWay)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCRedundancyControlAlgorithmAudioMultiWay;
  result = [(VCRedundancyControlAlgorithmAudioMultiWay *)&v3 init];
  if (result)
  {
    *(_OWORD *)result->_packetLossPercentageIncreaseThresholds = xmmword_1E25A0410;
    *(void *)&result->_packetLossPercentageDecreaseThresholds[1] = 0x600000003;
  }
  return result;
}

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3->type == 11)
  {
    long long v9 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    long long v25 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    long long v26 = v9;
    uint64_t v27 = *((void *)&a3->var0.localRCEvent + 21);
    long long v10 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    long long v21 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    long long v22 = v10;
    long long v11 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    long long v23 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    long long v24 = v11;
    long long v12 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    long long v17 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    long long v18 = v12;
    long long v13 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    long long v19 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    long long v20 = v13;
    long long v14 = *(_OWORD *)&a3->isVCRCInternal;
    long long v15 = *(_OWORD *)&a3->type;
    long long v16 = v14;
    [(VCRedundancyControlAlgorithmAudioMultiWay *)self processNWConnectionStatistics:&v15];
  }
  else if (a3->type == 3)
  {
    long long v3 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    long long v25 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    long long v26 = v3;
    uint64_t v27 = *((void *)&a3->var0.localRCEvent + 21);
    long long v4 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    long long v21 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    long long v22 = v4;
    long long v5 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    long long v23 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    long long v24 = v5;
    long long v6 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    long long v17 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    long long v18 = v6;
    long long v7 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    long long v19 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    long long v20 = v7;
    long long v8 = *(_OWORD *)&a3->isVCRCInternal;
    long long v15 = *(_OWORD *)&a3->type;
    long long v16 = v8;
    [(VCRedundancyControlAlgorithmAudioMultiWay *)self processRCNetworkStatistics:&v15];
  }
}

- (void)processNWConnectionStatistics:(tagVCStatisticsMessage *)a3
{
  if (a3->type == 11)
  {
    LODWORD(self->_offChannelTimeRatio) = a3->var0.feedback.receiveQueueTarget;
    float offChannelTimeRatio = a3->var0.nwConnection.var0.wifi.offChannelTimeRatio;
    if (self->_isOffChannelActivityHigh) {
      BOOL v4 = offChannelTimeRatio >= 0.25;
    }
    else {
      BOOL v4 = offChannelTimeRatio > 0.4;
    }
    self->_isOffChannelActivityHigh = v4;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCRedundancyControlAlgorithmAudioMultiWay processNWConnectionStatistics:]();
    }
  }
}

- (void)processRCNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3->type == 3)
  {
    p_statisticsID = &a3->var0.network.statisticsID;
    if (a3->var0.network.statisticsID)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        long long v5 = *MEMORY[0x1E4F47A50];
        long long v6 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v7 = *p_statisticsID;
            int v15 = 136315906;
            uint64_t v16 = v4;
            __int16 v17 = 2080;
            long long v18 = "-[VCRedundancyControlAlgorithmAudioMultiWay processRCNetworkStatistics:]";
            __int16 v19 = 1024;
            int v20 = 95;
            __int16 v21 = 2048;
            unint64_t v22 = v7;
            _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Filter out statistics not belong to this redundancyController with statisticsID:%llu", (uint8_t *)&v15, 0x26u);
          }
        }
        else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          -[VCRedundancyControlAlgorithmAudioMultiWay processRCNetworkStatistics:]();
        }
      }
    }
    else
    {
      double packetLossPercentage = a3->var0.network.packetLossPercentage;
      double packetLossPercentageThreshold = self->_packetLossPercentageThreshold;
      double plrEnvelope = self->_plrEnvelope;
      double v13 = dbl_1E25A00F0[plrEnvelope < packetLossPercentage];
      double v14 = plrEnvelope * (1.0 - v13) + packetLossPercentage * v13;
      self->_double plrEnvelope = v14;
      self->_isPacketLossIncreasing = v14 >= packetLossPercentageThreshold;
      self->_double packetLossPercentage = packetLossPercentage;
      self->_burstLossPacketCount = a3->var0.baseband.transmittedBytes;
      self->_isUplinkRecentlyCongested = a3->var0.feedback.videoReceivedPackets != 0;
      [(VCRedundancyControlAlgorithmAudioMultiWay *)self computeRedundancyInfo];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    long long v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCRedundancyControlAlgorithmAudioMultiWay processRCNetworkStatistics:](v8, v9);
    }
  }
}

- (void)computeRedundancyInfo
{
  if (!self->_isPacketLossIncreasing)
  {
    uint64_t v3 = 36;
    goto LABEL_6;
  }
  if (!self->_isUplinkRecentlyCongested && !self->_isOffChannelActivityHigh)
  {
    uint64_t v3 = 24;
LABEL_6:
    self->_redundancyPercentage = [(VCRedundancyControlAlgorithmAudioMultiWay *)self updateRedundancyPercentageWithPLRThresholds:(char *)self + v3];
  }
  signed int v4 = 20 * self->_burstLossPacketCount;
  double v5 = (double)v4;
  if (v4 < 41) {
    double v5 = 40.0;
  }
  if (v4 >= 180) {
    double v5 = 180.0;
  }
  self->_redundancyInterval = v5;
}

- (unsigned)updateRedundancyPercentageWithPLRThresholds:(unsigned int *)a3
{
  uint64_t v5 = 0;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  double plrEnvelope = self->_plrEnvelope;
  do
  {
    LODWORD(v3) = a3[v5];
    double v3 = (double)*(unint64_t *)&v3;
    if (plrEnvelope < v3) {
      break;
    }
    ++v5;
  }
  while (v5 != 3);
  unsigned int v7 = 100 * v5;
  if (100 * v5 != self->_redundancyPercentage)
  {
    int v8 = (v5 - self->_isPacketLossIncreasing) & ~(((int)v5 - self->_isPacketLossIncreasing) >> 31);
    if (v8 >= 2) {
      int v8 = 2;
    }
    LODWORD(plrEnvelope) = a3[v8];
    self->_float packetLossPercentageThreshold = (double)*(unint64_t *)&plrEnvelope;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        float packetLossPercentage = self->_packetLossPercentage;
        float packetLossPercentageThreshold = self->_packetLossPercentageThreshold;
        unsigned int redundancyPercentage = self->_redundancyPercentage;
        float v14 = self->_plrEnvelope;
        int v16 = 136316930;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        __int16 v19 = "-[VCRedundancyControlAlgorithmAudioMultiWay updateRedundancyPercentageWithPLRThresholds:]";
        __int16 v20 = 1024;
        int v21 = 140;
        __int16 v22 = 2048;
        double v23 = packetLossPercentage;
        __int16 v24 = 2048;
        double v25 = packetLossPercentageThreshold;
        __int16 v26 = 1024;
        unsigned int v27 = redundancyPercentage;
        __int16 v28 = 1024;
        unsigned int v29 = v7;
        __int16 v30 = 2048;
        double v31 = v14;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio redundancy percentage change due to packet loss: %2.3f, new threshold: %2.3f [%d to %d] plrEnvelope=%2.3f", (uint8_t *)&v16, 0x46u);
      }
    }
  }
  return v7;
}

- (unsigned)redundancyPercentage
{
  return self->_redundancyPercentage;
}

- (double)redundancyInterval
{
  return self->_redundancyInterval;
}

- (void)processNWConnectionStatistics:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  double v3 = "-[VCRedundancyControlAlgorithmAudioMultiWay processNWConnectionStatistics:]";
  __int16 v4 = 1024;
  int v5 = 78;
  __int16 v6 = 1024;
  int v7 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl type=%d", v2, 0x22u);
}

- (void)processRCNetworkStatistics:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  double v3 = "-[VCRedundancyControlAlgorithmAudioMultiWay processRCNetworkStatistics:]";
  __int16 v4 = 1024;
  int v5 = 95;
  __int16 v6 = 2048;
  uint64_t v7 = v0;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Filter out statistics not belong to this redundancyController with statisticsID:%llu", v2, 0x26u);
}

- (void)processRCNetworkStatistics:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  int v5 = "-[VCRedundancyControlAlgorithmAudioMultiWay processRCNetworkStatistics:]";
  __int16 v6 = 1024;
  int v7 = 91;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl", (uint8_t *)&v2, 0x1Cu);
}

@end