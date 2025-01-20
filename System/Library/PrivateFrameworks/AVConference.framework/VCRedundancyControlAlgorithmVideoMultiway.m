@interface VCRedundancyControlAlgorithmVideoMultiway
- (VCRedundancyControlAlgorithmVideoMultiway)init;
- (double)redundancyInterval;
- (unsigned)redundancyPercentage;
- (void)updateRedundancyPercentage;
- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3;
@end

@implementation VCRedundancyControlAlgorithmVideoMultiway

- (VCRedundancyControlAlgorithmVideoMultiway)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCRedundancyControlAlgorithmVideoMultiway;
  result = [(VCRedundancyControlAlgorithmVideoMultiway *)&v3 init];
  if (result)
  {
    result->_redundancyPercentage = 0;
    result->_lastPercentageChange = NAN;
  }
  return result;
}

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  if (a3->type == 3)
  {
    self->_currentTime = a3->arrivalTime;
    self->_packetLossPercentage = a3->var0.network.packetLossPercentage;
    [(VCRedundancyControlAlgorithmVideoMultiway *)self updateRedundancyPercentage];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCRedundancyControlAlgorithmVideoMultiway updateRedundancyStrategyWithNetworkStatistics:](v3, v4);
    }
  }
}

- (void)updateRedundancyPercentage
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  double packetLossPercentage = self->_packetLossPercentage;
  double plrEnvelope = self->_plrEnvelope;
  double v5 = dbl_1E25A00F0[plrEnvelope < packetLossPercentage];
  self->_double plrEnvelope = plrEnvelope * (1.0 - v5) + packetLossPercentage * v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    v8 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        float v9 = self->_packetLossPercentage;
        float v10 = self->_plrEnvelope;
        int v22 = 136316162;
        uint64_t v23 = v6;
        __int16 v24 = 2080;
        v25 = "-[VCRedundancyControlAlgorithmVideoMultiway updateRedundancyPercentage]";
        __int16 v26 = 1024;
        int v27 = 84;
        __int16 v28 = 2048;
        *(double *)v29 = v9;
        *(_WORD *)&v29[8] = 2048;
        *(double *)v30 = v10;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy level _packetLossPercentage=%2.2f _plrEnvelope=%2.2f ", (uint8_t *)&v22, 0x30u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      float v20 = self->_packetLossPercentage;
      float v21 = self->_plrEnvelope;
      int v22 = 136316162;
      uint64_t v23 = v6;
      __int16 v24 = 2080;
      v25 = "-[VCRedundancyControlAlgorithmVideoMultiway updateRedundancyPercentage]";
      __int16 v26 = 1024;
      int v27 = 84;
      __int16 v28 = 2048;
      *(double *)v29 = v20;
      *(_WORD *)&v29[8] = 2048;
      *(double *)v30 = v21;
      _os_log_debug_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Redundancy level _packetLossPercentage=%2.2f _plrEnvelope=%2.2f ", (uint8_t *)&v22, 0x30u);
    }
  }
  if (self->_plrEnvelope >= 0.5) {
    unsigned int v11 = 50;
  }
  else {
    unsigned int v11 = 0;
  }
  unsigned int redundancyPercentage = self->_redundancyPercentage;
  BOOL v13 = self->_currentTime - self->_lastPercentageChange >= 5.0;
  if (v11 >= redundancyPercentage) {
    BOOL v13 = 1;
  }
  if (redundancyPercentage != v11 && v13)
  {
    self->_unsigned int redundancyPercentage = v11;
    self->_lastPercentageChange = self->_currentTime;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v17 = self->_redundancyPercentage;
        float v18 = self->_packetLossPercentage;
        float v19 = self->_plrEnvelope;
        int v22 = 136316674;
        uint64_t v23 = v15;
        __int16 v24 = 2080;
        v25 = "-[VCRedundancyControlAlgorithmVideoMultiway updateRedundancyPercentage]";
        __int16 v26 = 1024;
        int v27 = 94;
        __int16 v28 = 1024;
        *(_DWORD *)v29 = v17;
        *(_WORD *)&v29[4] = 1024;
        *(_DWORD *)&v29[6] = v11;
        *(_WORD *)v30 = 2048;
        *(double *)&v30[2] = v18;
        __int16 v31 = 2048;
        double v32 = v19;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy level changed from _redundancyPercentage=%d to newRedundancyPercentage=%d _packetLossPercentage=%3.3f _plrEnvelope=%3.3f", (uint8_t *)&v22, 0x3Cu);
      }
    }
  }
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
  double v5 = "-[VCRedundancyControlAlgorithmVideoMultiway updateRedundancyStrategyWithNetworkStatistics:]";
  __int16 v6 = 1024;
  int v7 = 67;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl", (uint8_t *)&v2, 0x1Cu);
}

@end