@interface VCEmulatedNetworkAlgorithmQueueBandwidth
- (BOOL)shouldDropPacketWithCurrentAQMBudget:(id)a3;
- (VCEmulatedNetworkAlgorithmQueueBandwidth)init;
- (double)computeNetworkServiceRate;
- (double)expectedProcessEndTime;
- (int)getRemainingAQMBudgetWithPacket:(id)a3;
- (int)packetCountBytesInNetworkQueue;
- (unsigned)packetCountInNetworkQueue;
- (void)addPacketToBudgetBuffer:(id)a3;
- (void)process:(id)a3;
- (void)setPacketCountBytesInNetworkQueue:(int)a3;
- (void)setPacketCountInNetworkQueue:(unsigned int)a3;
- (void)updateSettingsAtTime:(double)a3 impairments:(id)a4;
@end

@implementation VCEmulatedNetworkAlgorithmQueueBandwidth

- (VCEmulatedNetworkAlgorithmQueueBandwidth)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCEmulatedNetworkAlgorithmQueueBandwidth;
  result = [(VCEmulatedNetworkAlgorithmQueueBandwidth *)&v3 init];
  if (result) {
    result->_networkQueueServiceRate = 50000000;
  }
  return result;
}

- (void)updateSettingsAtTime:(double)a3 impairments:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"FixedBandwidth"), "objectForKeyedSubscript:", @"time");
  v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"FixedBandwidth"), "objectForKeyedSubscript:", @"value");
  int v9 = [v8 count];
  if (v9 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v7, &self->_currentIndexForServiceRate, &self->_lastNetworkQueueServiceRateLoadTime, v9, a3);
    self->_unsigned int networkQueueServiceRate = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", self->_currentIndexForServiceRate), "intValue");
  }
  v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"GaussianBandwidth"), "objectForKeyedSubscript:", @"time");
  v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"GaussianBandwidth"), "objectForKeyedSubscript:", @"mean");
  v12 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"GaussianBandwidth"), "objectForKeyedSubscript:", @"stdDev");
  int v13 = [v11 count];
  if (v13 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v10, &self->_currentIndexForServiceRateDistribution, &self->_lastNetworkQueueServiceRateDistributionLoadTime, v13, a3);
    self->_unsigned int networkQueueServiceRateMean = objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", self->_currentIndexForServiceRateDistribution), "intValue");
    self->_unsigned int networkQueueServiceRateStdDev = objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", self->_currentIndexForServiceRateDistribution), "intValue");
  }
  v14 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"AQMBandwidth"), "objectForKeyedSubscript:", @"time");
  v15 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"AQMBandwidth"), "objectForKeyedSubscript:", @"value");
  int v16 = [v15 count];
  if (v16 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v14, &self->_currentIndexForAQMRate, &self->_lastNetworkQueueAQMRateLoadTime, v16, a3);
    self->_unsigned int networkQueueAQMRate = objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", self->_currentIndexForAQMRate), "intValue");
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int networkQueueServiceRate = self->_networkQueueServiceRate;
      unsigned int networkQueueServiceRateMean = self->_networkQueueServiceRateMean;
      unsigned int networkQueueServiceRateStdDev = self->_networkQueueServiceRateStdDev;
      unsigned int networkQueueAQMRate = self->_networkQueueAQMRate;
      int v23 = 136316674;
      uint64_t v24 = v17;
      __int16 v25 = 2080;
      v26 = "-[VCEmulatedNetworkAlgorithmQueueBandwidth updateSettingsAtTime:impairments:]";
      __int16 v27 = 1024;
      int v28 = 62;
      __int16 v29 = 1024;
      unsigned int v30 = networkQueueServiceRate;
      __int16 v31 = 1024;
      unsigned int v32 = networkQueueServiceRateMean;
      __int16 v33 = 1024;
      unsigned int v34 = networkQueueServiceRateStdDev;
      __int16 v35 = 1024;
      unsigned int v36 = networkQueueAQMRate;
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Current emulated network serviceRate=%d, serviceRateMean=%d, serviceRateStdDev=%d, AQMRate=%d", (uint8_t *)&v23, 0x34u);
    }
  }
}

- (double)computeNetworkServiceRate
{
  unsigned int networkQueueServiceRateMean = self->_networkQueueServiceRateMean;
  if (self->_networkQueueServiceRateStdDev)
  {
    double v4 = (double)networkQueueServiceRateMean;
    long double v5 = ((double)arc4random_uniform(0xFFFFFFFF) + 1.0) * 2.32830644e-10;
    double v6 = ((double)arc4random_uniform(0xFFFFFFFF) + 1.0) * 2.32830644e-10;
    double v7 = sqrt(log(v5) * -2.0);
    long double v8 = sin(v6 * 6.28318531);
    LODWORD(v9) = self->_networkQueueServiceRateStdDev;
    return v4 + v7 * v8 * (double)v9;
  }
  else
  {
    if (!networkQueueServiceRateMean) {
      return (double)self->_networkQueueServiceRate;
    }
    return (double)networkQueueServiceRateMean;
  }
}

- (void)process:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  [(VCEmulatedNetworkAlgorithmQueueBandwidth *)self computeNetworkServiceRate];
  self->_unsigned int networkQueueServiceRate = v5;
  double v6 = 0.0;
  if (([a3 isLost] & 1) == 0)
  {
    unsigned int v7 = [a3 size];
    unint64_t v8 = 8.0;
    LODWORD(v8) = self->_networkQueueServiceRate;
    double v6 = (double)v7 * 8.0 / (double)v8;
  }
  [a3 networkServiceTime];
  self->_expectedProcessEndTime = v6 + v9;
  objc_msgSend(a3, "setDepartureTime:");
  if (self->_networkQueueAQMRate)
  {
    objc_msgSend(a3, "setIsDroppedByAQM:", -[VCEmulatedNetworkAlgorithmQueueBandwidth shouldDropPacketWithCurrentAQMBudget:](self, "shouldDropPacketWithCurrentAQMBudget:", a3));
    if ([a3 isLost]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = [a3 isDroppedByAQM];
    }
    [a3 setIsLost:v10];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    int v13 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [a3 packetID];
        int v15 = [a3 isLost];
        int v16 = [a3 size];
        unsigned int networkQueueServiceRate = self->_networkQueueServiceRate;
        [a3 arrivalTime];
        uint64_t v19 = v18;
        [a3 departureTime];
        int v28 = 136317442;
        uint64_t v29 = v11;
        __int16 v30 = 2080;
        __int16 v31 = "-[VCEmulatedNetworkAlgorithmQueueBandwidth process:]";
        __int16 v32 = 1024;
        int v33 = 84;
        __int16 v34 = 1024;
        int v35 = v14;
        __int16 v36 = 1024;
        int v37 = v15;
        __int16 v38 = 1024;
        int v39 = v16;
        __int16 v40 = 1024;
        unsigned int v41 = networkQueueServiceRate;
        __int16 v42 = 2048;
        double v43 = v6;
        __int16 v44 = 2048;
        uint64_t v45 = v19;
        __int16 v46 = 2048;
        uint64_t v47 = v20;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d packetID=%d, isLost=%d, packet size=%d, serviceRate=%d, serviceTime=%f, arrivalTime=%f, departureTime=%f", (uint8_t *)&v28, 0x52u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v21 = [a3 packetID];
      int v22 = [a3 isLost];
      int v23 = [a3 size];
      unsigned int v24 = self->_networkQueueServiceRate;
      [a3 arrivalTime];
      uint64_t v26 = v25;
      [a3 departureTime];
      int v28 = 136317442;
      uint64_t v29 = v11;
      __int16 v30 = 2080;
      __int16 v31 = "-[VCEmulatedNetworkAlgorithmQueueBandwidth process:]";
      __int16 v32 = 1024;
      int v33 = 84;
      __int16 v34 = 1024;
      int v35 = v21;
      __int16 v36 = 1024;
      int v37 = v22;
      __int16 v38 = 1024;
      int v39 = v23;
      __int16 v40 = 1024;
      unsigned int v41 = v24;
      __int16 v42 = 2048;
      double v43 = v6;
      __int16 v44 = 2048;
      uint64_t v45 = v26;
      __int16 v46 = 2048;
      uint64_t v47 = v27;
      _os_log_debug_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEBUG, " [%s] %s:%d packetID=%d, isLost=%d, packet size=%d, serviceRate=%d, serviceTime=%f, arrivalTime=%f, departureTime=%f", (uint8_t *)&v28, 0x52u);
    }
  }
}

- (BOOL)shouldDropPacketWithCurrentAQMBudget:(id)a3
{
  if (([a3 isLost] & 1) == 0)
  {
    int v5 = [a3 size];
    if (v5 > [(VCEmulatedNetworkAlgorithmQueueBandwidth *)self getRemainingAQMBudgetWithPacket:a3])return 1; {
    [(VCEmulatedNetworkAlgorithmQueueBandwidth *)self addPacketToBudgetBuffer:a3];
    }
  }
  return 0;
}

- (void)addPacketToBudgetBuffer:(id)a3
{
  p_budgentBufferIndex = &self->_budgentBufferIndex;
  int budgetBufferSize = self->_budgetBufferSize;
  if (budgetBufferSize < 1) {
    goto LABEL_5;
  }
  int v7 = *p_budgentBufferIndex + 1;
  BOOL v8 = -v7 < 0;
  int v9 = -v7 & 0xFFF;
  int v10 = v7 & 0xFFF;
  if (!v8) {
    int v10 = -v9;
  }
  int *p_budgentBufferIndex = v10;
  if (budgetBufferSize <= 0xFFF) {
LABEL_5:
  }
    self->_int budgetBufferSize = budgetBufferSize + 1;
  [a3 arrivalTime];
  self->_budgetBufferPktTime[*p_budgentBufferIndex] = v11;
  self->_budgetBufferPktSize[*p_budgentBufferIndex] = (double)[a3 size];
}

- (int)getRemainingAQMBudgetWithPacket:(id)a3
{
  p_budgentBufferIndex = &self->_budgentBufferIndex;
  LODWORD(v3) = self->_networkQueueAQMRate;
  double v6 = (double)v3 * 0.5 * 0.125;
  [a3 arrivalTime];
  int v8 = p_budgentBufferIndex[1];
  int result = (int)v6;
  if (v8 >= 1)
  {
    double v10 = v7 + -0.5;
    int v11 = *p_budgentBufferIndex;
    do
    {
      if (v11 <= 0) {
        int v12 = -(-v11 & 0xFFF);
      }
      else {
        int v12 = v11 & 0xFFF;
      }
      if (self->_budgetBufferPktTime[v12] <= v10) {
        break;
      }
      int result = (int)((double)result - self->_budgetBufferPktSize[v12]);
      --v11;
      --v8;
    }
    while (v8);
  }
  return result;
}

- (double)expectedProcessEndTime
{
  return self->_expectedProcessEndTime;
}

- (unsigned)packetCountInNetworkQueue
{
  return self->_packetCountInNetworkQueue;
}

- (void)setPacketCountInNetworkQueue:(unsigned int)a3
{
  self->_packetCountInNetworkQueue = a3;
}

- (int)packetCountBytesInNetworkQueue
{
  return self->_packetCountBytesInNetworkQueue;
}

- (void)setPacketCountBytesInNetworkQueue:(int)a3
{
  self->_packetCountBytesInNetworkQueue = a3;
}

@end