@interface VCRedundancyControlAlgorithmVideoIpadCompanion
- (double)redundancyInterval;
- (unsigned)computeRedundancyWithBurstyLoss;
- (unsigned)computeRedundancyWithLossPercentage;
- (unsigned)redundancyPercentage;
- (void)updateBurstyLoss:(unsigned int)a3;
- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3;
@end

@implementation VCRedundancyControlAlgorithmVideoIpadCompanion

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  if (a3->type == 3)
  {
    self->_packetLossPercentage = a3->var0.network.packetLossPercentage;
    [(VCRedundancyControlAlgorithmVideoIpadCompanion *)self updateBurstyLoss:a3->var0.baseband.transmittedBytes];
    unsigned int v4 = [(VCRedundancyControlAlgorithmVideoIpadCompanion *)self computeRedundancyWithLossPercentage];
    unsigned int v5 = [(VCRedundancyControlAlgorithmVideoIpadCompanion *)self computeRedundancyWithBurstyLoss];
    if (v4 <= v5) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = v4;
    }
    self->_redundancyPercentage = v6;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCRedundancyControlAlgorithmVideoIpadCompanion updateRedundancyStrategyWithNetworkStatistics:](v7, v8);
    }
  }
}

- (void)updateBurstyLoss:(unsigned int)a3
{
  self->_burstyLoss[self->_burstyLossArrayIndex] = a3;
  self->_burstyLossArrayIndex = (self->_burstyLossArrayIndex + 1) % 0x1F4;
  unsigned int burstyLossArraySize = self->_burstyLossArraySize;
  if (burstyLossArraySize <= 0x1F3) {
    self->_unsigned int burstyLossArraySize = burstyLossArraySize + 1;
  }
}

- (unsigned)computeRedundancyWithLossPercentage
{
  unsigned int packetLossPercentage = self->_packetLossPercentage;
  if (packetLossPercentage >= 0xB) {
    int v3 = 100;
  }
  else {
    int v3 = 50;
  }
  if (packetLossPercentage >= 6) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = 25;
  }
  if (packetLossPercentage >= 2) {
    return v4;
  }
  else {
    return 0;
  }
}

- (unsigned)computeRedundancyWithBurstyLoss
{
  uint64_t burstyLossArraySize = self->_burstyLossArraySize;
  if (!burstyLossArraySize) {
    return 0;
  }
  unsigned int v3 = 0;
  burstyLoss = self->_burstyLoss;
  do
  {
    unsigned int v6 = *burstyLoss++;
    unsigned int v5 = v6;
    if (v3 <= v6) {
      unsigned int v3 = v5;
    }
    --burstyLossArraySize;
  }
  while (burstyLossArraySize);
  if (!v3) {
    return 0;
  }
  if (v3 < 3) {
    return 25;
  }
  if (v3 >= 5) {
    return 100;
  }
  return 50;
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
  unsigned int v5 = "-[VCRedundancyControlAlgorithmVideoIpadCompanion updateRedundancyStrategyWithNetworkStatistics:]";
  __int16 v6 = 1024;
  int v7 = 28;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl", (uint8_t *)&v2, 0x1Cu);
}

@end