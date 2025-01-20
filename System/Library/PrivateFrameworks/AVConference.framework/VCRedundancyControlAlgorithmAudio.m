@interface VCRedundancyControlAlgorithmAudio
- (VCRedundancyControlAlgorithmAudio)initWithMode:(unsigned int)a3;
- (double)redundancyInterval;
- (unsigned)redundancyPercentage;
- (unsigned)updateRedundancyPercentageWithPLRThresholds:(double *)a3;
- (void)computeRedundancyInfo;
- (void)processNWConnectionStatistics:(tagVCStatisticsMessage *)a3;
- (void)processRCNetworkStatistics:(tagVCStatisticsMessage *)a3;
- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3;
@end

@implementation VCRedundancyControlAlgorithmAudio

- (VCRedundancyControlAlgorithmAudio)initWithMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)VCRedundancyControlAlgorithmAudio;
  v4 = [(VCRedundancyControlAlgorithmAudio *)&v20 init];
  if (!v4) {
    return v4;
  }
  if (v3 == 3)
  {
    double v5 = 16.0;
    double v6 = 4.0;
    double v7 = 18.0;
    double v8 = 6.0;
    goto LABEL_6;
  }
  if (v3 == 2)
  {
    double v5 = 6.0;
    double v6 = 3.0;
    double v7 = 8.0;
    double v8 = 4.0;
LABEL_6:
    v4->_packetLossPercentageIncreaseThresholds[0] = VCDefaults_GetDoubleValueForKey(@"redundancyControllerIncreaseToLevel1PLR", 2.0);
    v4->_packetLossPercentageIncreaseThresholds[1] = VCDefaults_GetDoubleValueForKey(@"redundancyControllerIncreaseToLevel2PLR", v8);
    v4->_packetLossPercentageIncreaseThresholds[2] = VCDefaults_GetDoubleValueForKey(@"redundancyControllerIncreaseToLevel3PLR", v7);
    v4->_packetLossPercentageDecreaseThresholds[0] = VCDefaults_GetDoubleValueForKey(@"redundancyControllerDecreaseToLevel0PLR", 1.0);
    v4->_packetLossPercentageDecreaseThresholds[1] = VCDefaults_GetDoubleValueForKey(@"redundancyControllerDecreaseToLevel1PLR", v6);
    v4->_packetLossPercentageDecreaseThresholds[2] = VCDefaults_GetDoubleValueForKey(@"redundancyControllerDecreaseToLevel2PLR", v5);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v11 = v4->_packetLossPercentageIncreaseThresholds[0];
        double v12 = v4->_packetLossPercentageIncreaseThresholds[1];
        double v13 = v4->_packetLossPercentageIncreaseThresholds[2];
        double v14 = v4->_packetLossPercentageDecreaseThresholds[0];
        double v15 = v4->_packetLossPercentageDecreaseThresholds[1];
        double v16 = v4->_packetLossPercentageDecreaseThresholds[2];
        *(_DWORD *)buf = 136317186;
        uint64_t v22 = v9;
        __int16 v23 = 2080;
        v24 = "-[VCRedundancyControlAlgorithmAudio initWithMode:]";
        __int16 v25 = 1024;
        int v26 = 76;
        __int16 v27 = 2048;
        double v28 = v11;
        __int16 v29 = 2048;
        double v30 = v12;
        __int16 v31 = 2048;
        double v32 = v13;
        __int16 v33 = 2048;
        double v34 = v14;
        __int16 v35 = 2048;
        double v36 = v15;
        __int16 v37 = 2048;
        double v38 = v16;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Using Audio RED cutover points RED0to1=%0.2f RED1to2=%0.2f RED2to3=%0.2f RED1to0=%0.2f RED2to1=%0.2f RED3to2=%0.2f", buf, 0x58u);
      }
    }
    return v4;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCRedundancyControlAlgorithmAudio *)v17 initWithMode:v18];
    }
  }

  return 0;
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
    [(VCRedundancyControlAlgorithmAudio *)self processNWConnectionStatistics:&v15];
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
    [(VCRedundancyControlAlgorithmAudio *)self processRCNetworkStatistics:&v15];
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
      -[VCRedundancyControlAlgorithmAudio processNWConnectionStatistics:]();
    }
  }
}

- (void)processRCNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
            int v13 = 136315906;
            uint64_t v14 = v4;
            __int16 v15 = 2080;
            long long v16 = "-[VCRedundancyControlAlgorithmAudio processRCNetworkStatistics:]";
            __int16 v17 = 1024;
            int v18 = 113;
            __int16 v19 = 2048;
            unint64_t v20 = v7;
            _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Filter out statistics not belong to this redundancyController with statisticsID:%llu", (uint8_t *)&v13, 0x26u);
          }
        }
        else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          -[VCRedundancyControlAlgorithmAudio processRCNetworkStatistics:]();
        }
      }
    }
    else
    {
      double packetLossPercentageAudio = a3->var0.network.packetLossPercentageAudio;
      double packetLossPercentage = self->_packetLossPercentage;
      if (packetLossPercentageAudio <= packetLossPercentage) {
        double v12 = packetLossPercentage * 0.9985 + packetLossPercentageAudio * 0.0015;
      }
      else {
        double v12 = packetLossPercentage * 0.1 + packetLossPercentageAudio * 0.9;
      }
      self->_isPacketLossIncreasing = v12 >= self->_packetLossPercentageThreshold;
      self->_double packetLossPercentage = v12;
      self->_burstLossPacketCount = a3->var0.baseband.transmittedBytes;
      self->_isUplinkRecentlyCongested = a3->var0.feedback.videoReceivedPackets != 0;
      [(VCRedundancyControlAlgorithmAudio *)self computeRedundancyInfo];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    long long v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCRedundancyControlAlgorithmAudio processRCNetworkStatistics:](v8, v9);
    }
  }
}

- (void)computeRedundancyInfo
{
  if (!self->_isPacketLossIncreasing)
  {
    uint64_t v3 = 48;
    goto LABEL_6;
  }
  if (!self->_isUplinkRecentlyCongested && !self->_isOffChannelActivityHigh)
  {
    uint64_t v3 = 24;
LABEL_6:
    self->_redundancyPercentage = [(VCRedundancyControlAlgorithmAudio *)self updateRedundancyPercentageWithPLRThresholds:(char *)self + v3];
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

- (unsigned)updateRedundancyPercentageWithPLRThresholds:(double *)a3
{
  uint64_t v4 = 0;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  do
  {
    if (self->_packetLossPercentage < a3[v4]) {
      break;
    }
    ++v4;
  }
  while (v4 != 3);
  unsigned int v5 = 100 * v4;
  if (100 * v4 != self->_redundancyPercentage)
  {
    int v6 = (v4 - self->_isPacketLossIncreasing) & ~(((int)v4 - self->_isPacketLossIncreasing) >> 31);
    if (v6 >= 2) {
      int v6 = 2;
    }
    self->_double packetLossPercentageThreshold = a3[v6];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double packetLossPercentage = self->_packetLossPercentage;
        double packetLossPercentageThreshold = self->_packetLossPercentageThreshold;
        unsigned int redundancyPercentage = self->_redundancyPercentage;
        int v13 = 136316674;
        uint64_t v14 = v7;
        __int16 v15 = 2080;
        long long v16 = "-[VCRedundancyControlAlgorithmAudio updateRedundancyPercentageWithPLRThresholds:]";
        __int16 v17 = 1024;
        int v18 = 163;
        __int16 v19 = 2048;
        double v20 = packetLossPercentage;
        __int16 v21 = 2048;
        double v22 = packetLossPercentageThreshold;
        __int16 v23 = 1024;
        unsigned int v24 = redundancyPercentage;
        __int16 v25 = 1024;
        unsigned int v26 = v5;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio redundancy percentage change due to packet loss: %lf, new threshold: %lf [%d to %d]", (uint8_t *)&v13, 0x3Cu);
      }
    }
  }
  return v5;
}

- (unsigned)redundancyPercentage
{
  return self->_redundancyPercentage;
}

- (double)redundancyInterval
{
  return self->_redundancyInterval;
}

- (void)initWithMode:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[VCRedundancyControlAlgorithmAudio initWithMode:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, a2, a3, " [%s] %s:%d Invalid redundancy controller mode=%u", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCRedundancyControlAlgorithmAudio initWithMode:]" >> 16, 69);
}

- (void)processNWConnectionStatistics:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "-[VCRedundancyControlAlgorithmAudio processNWConnectionStatistics:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl type=%d", v2, *(const char **)v3, (unint64_t)"-[VCRedundancyControlAlgorithmAudio processNWConnectionStatistics:]" >> 16, 96);
}

- (void)processRCNetworkStatistics:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  uint64_t v3 = "-[VCRedundancyControlAlgorithmAudio processRCNetworkStatistics:]";
  __int16 v4 = 1024;
  int v5 = 113;
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
  int v5 = "-[VCRedundancyControlAlgorithmAudio processRCNetworkStatistics:]";
  __int16 v6 = 1024;
  int v7 = 109;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl", (uint8_t *)&v2, 0x1Cu);
}

@end