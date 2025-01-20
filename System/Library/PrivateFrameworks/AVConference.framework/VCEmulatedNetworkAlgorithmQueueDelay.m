@interface VCEmulatedNetworkAlgorithmQueueDelay
- (VCEmulatedNetworkAlgorithmQueueDelay)init;
- (double)computeNetworkDelay;
- (double)expectedProcessEndTime;
- (int)packetCountBytesInNetworkQueue;
- (unsigned)packetCountInNetworkQueue;
- (void)process:(id)a3;
- (void)setPacketCountBytesInNetworkQueue:(int)a3;
- (void)setPacketCountInNetworkQueue:(unsigned int)a3;
- (void)updateSettingsAtTime:(double)a3 impairments:(id)a4;
@end

@implementation VCEmulatedNetworkAlgorithmQueueDelay

- (VCEmulatedNetworkAlgorithmQueueDelay)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCEmulatedNetworkAlgorithmQueueDelay;
  result = [(VCEmulatedNetworkAlgorithmQueueDelay *)&v3 init];
  if (result) {
    result->_networkQueueDelay = 0;
  }
  return result;
}

- (void)updateSettingsAtTime:(double)a3 impairments:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"FixedDelay"), "objectForKeyedSubscript:", @"time");
  v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"FixedDelay"), "objectForKeyedSubscript:", @"value");
  int v9 = [v8 count];
  if (v9 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v7, &self->_currentIndexForDelay, &self->_lastNetworkQueueDelayLoadTime, v9, a3);
    self->_unsigned int networkQueueDelay = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", self->_currentIndexForDelay), "intValue");
  }
  v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"GaussianDelay"), "objectForKeyedSubscript:", @"time");
  v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"GaussianDelay"), "objectForKeyedSubscript:", @"mean");
  v12 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"GaussianDelay"), "objectForKeyedSubscript:", @"stdDev");
  int v13 = [v11 count];
  if (v13 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v10, &self->_currentIndexForDelayDistribution, &self->_lastNetworkQueueDelayDistributionLoadTime, v13, a3);
    self->_unsigned int networkQueueDelayMean = objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", self->_currentIndexForDelayDistribution), "intValue");
    self->_unsigned int networkQueueDelayStdDev = objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", self->_currentIndexForDelayDistribution), "intValue");
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int networkQueueDelay = self->_networkQueueDelay;
      unsigned int networkQueueDelayMean = self->_networkQueueDelayMean;
      unsigned int networkQueueDelayStdDev = self->_networkQueueDelayStdDev;
      int v19 = 136316418;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      v22 = "-[VCEmulatedNetworkAlgorithmQueueDelay updateSettingsAtTime:impairments:]";
      __int16 v23 = 1024;
      int v24 = 49;
      __int16 v25 = 1024;
      unsigned int v26 = networkQueueDelay;
      __int16 v27 = 1024;
      unsigned int v28 = networkQueueDelayMean;
      __int16 v29 = 1024;
      unsigned int v30 = networkQueueDelayStdDev;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Current emulated network delay: [%d, %d, %d]", (uint8_t *)&v19, 0x2Eu);
    }
  }
}

- (double)computeNetworkDelay
{
  unsigned int networkQueueDelayMean = self->_networkQueueDelayMean;
  if (self->_networkQueueDelayStdDev)
  {
    double v4 = (double)networkQueueDelayMean;
    long double v5 = ((double)arc4random_uniform(0xFFFFFFFF) + 1.0) * 2.32830644e-10;
    double v6 = ((double)arc4random_uniform(0xFFFFFFFF) + 1.0) * 2.32830644e-10;
    double v7 = sqrt(log(v5) * -2.0);
    long double v8 = sin(v6 * 6.28318531);
    LODWORD(v9) = self->_networkQueueDelayStdDev;
    unsigned int networkQueueDelayMean = (v4 + v7 * v8 * (double)v9);
  }
  else if (!networkQueueDelayMean)
  {
    unsigned int networkQueueDelayMean = self->_networkQueueDelay;
  }
  return (double)networkQueueDelayMean / 1000.0;
}

- (void)process:(id)a3
{
  [(VCEmulatedNetworkAlgorithmQueueDelay *)self computeNetworkDelay];
  double v6 = v5;
  [a3 departureTime];
  double v8 = v7;
  [a3 arrivalTime];
  double v10 = v9;
  [a3 departureTime];
  if (v11 == 0.0 || ([a3 arrivalTime], v13 == 0.0) || v8 - v10 > v6)
  {
    [a3 departureTime];
    self->_expectedProcessEndTime = v12;
  }
  else
  {
    objc_msgSend(a3, "arrivalTime", v8 - v10);
    self->_expectedProcessEndTime = v6 + v14;
    objc_msgSend(a3, "setDepartureTime:");
  }
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