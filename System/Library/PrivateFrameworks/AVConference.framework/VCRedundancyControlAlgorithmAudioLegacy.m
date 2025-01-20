@interface VCRedundancyControlAlgorithmAudioLegacy
- (double)redundancyInterval;
- (unsigned)redundancyPercentage;
- (void)computeRedundancyInfo;
- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3;
@end

@implementation VCRedundancyControlAlgorithmAudioLegacy

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  if (a3->type == 3)
  {
    self->_packetLossPercentage = a3->var0.network.packetLossPercentage;
    self->_isUplinkRecentlyCongested = a3->var0.feedback.videoReceivedPackets != 0;
    [(VCRedundancyControlAlgorithmAudioLegacy *)self computeRedundancyInfo];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCRedundancyControlAlgorithmAudioLegacy updateRedundancyStrategyWithNetworkStatistics:](v3, v4);
    }
  }
}

- (void)computeRedundancyInfo
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  v7 = "-[VCRedundancyControlAlgorithmAudioLegacy computeRedundancyInfo]";
  __int16 v8 = 1024;
  int v9 = 65;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Redundancy percentage: %d is out of bound in legacy duplication", (uint8_t *)&v4, 0x22u);
}

- (unsigned)redundancyPercentage
{
  return self->_redundancyPercentage;
}

- (double)redundancyInterval
{
  return self->_redundancyInterval;
}

- (void)updateRedundancyStrategyWithNetworkStatistics:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCRedundancyControlAlgorithmAudioLegacy updateRedundancyStrategyWithNetworkStatistics:]";
  __int16 v6 = 1024;
  int v7 = 24;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl", (uint8_t *)&v2, 0x1Cu);
}

@end