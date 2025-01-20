@interface IMPingStatistics
- (IMPingStatistics)initWithMaxRTT:(double)a3 medianRTT:(double)a4 avgRTT:(double)a5 minRTT:(double)a6 transmitted:(int)a7 successful:(int)a8 received:(int)a9;
- (double)averageRoundtripTime;
- (double)maxRoundtripTime;
- (double)medianRoundtripTime;
- (double)minRoundtripTime;
- (double)packetLossRate;
- (double)standardDeviationRoundtripTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)numPingsReceived;
- (int)numPingsTransmitted;
- (int)packetsSuccessfullySent;
- (void)_addReceivedPacket:(double)a3;
- (void)_addTransmittedPacket:(BOOL)a3;
- (void)_setMaxRoundtripTime:(double)a3;
- (void)_setMedianRoundtripTime:(double)a3;
- (void)_setMinRoundtripTime:(double)a3;
- (void)_setStandardDeviationRoundtripTime:(double)a3;
@end

@implementation IMPingStatistics

- (IMPingStatistics)initWithMaxRTT:(double)a3 medianRTT:(double)a4 avgRTT:(double)a5 minRTT:(double)a6 transmitted:(int)a7 successful:(int)a8 received:(int)a9
{
  v17.receiver = self;
  v17.super_class = (Class)IMPingStatistics;
  result = [(IMPingStatistics *)&v17 init];
  if (result)
  {
    result->_medianRoundtripTime = a4;
    result->_averageRoundtripTime = a5;
    result->_minRoundtripTime = a6;
    result->_maxRoundtripTime = a3;
    result->_numPingsTransmitted = a7;
    result->_numPingsReceived = a9;
    result->_numPacketsSuccessfullySent = a8;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend_allocWithZone_(IMPingStatistics, a2, (uint64_t)a3, v3);
  id result = (id)objc_msgSend_initWithMaxRTT_medianRTT_avgRTT_minRTT_transmitted_successful_received_(v5, v6, self->_numPingsTransmitted, self->_numPacketsSuccessfullySent, self->_numPingsReceived, self->_maxRoundtripTime, self->_medianRoundtripTime, self->_averageRoundtripTime, self->_minRoundtripTime);
  if (result) {
    *((void *)result + 8) = *(void *)&self->_standardDeviationRoundtripTime;
  }
  return result;
}

- (void)_addTransmittedPacket:(BOOL)a3
{
  if (a3) {
    ++self->_numPacketsSuccessfullySent;
  }
}

- (void)_addReceivedPacket:(double)a3
{
  double minRoundtripTime = self->_minRoundtripTime;
  if (minRoundtripTime == 0.0 || minRoundtripTime > a3) {
    self->_double minRoundtripTime = a3;
  }
  if (self->_maxRoundtripTime < a3) {
    self->_maxRoundtripTime = a3;
  }
  double v5 = self->_sumRoundtripTimes + a3;
  self->_sumRoundtripTimes = v5;
  int numPingsReceived = self->_numPingsReceived;
  self->_averageRoundtripTime = v5 / (double)numPingsReceived;
  self->_int numPingsReceived = numPingsReceived + 1;
}

- (double)packetLossRate
{
  int numPingsTransmitted = self->_numPingsTransmitted;
  if (numPingsTransmitted) {
    return 1.0 - (float)((float)self->_numPingsReceived / (float)numPingsTransmitted);
  }
  else {
    return 0.0;
  }
}

- (id)description
{
  v4 = NSString;
  long long v14 = *(_OWORD *)&self->_minRoundtripTime;
  long long v13 = *(_OWORD *)&self->_medianRoundtripTime;
  double standardDeviationRoundtripTime = self->_standardDeviationRoundtripTime;
  uint64_t numPacketsSuccessfullySent = self->_numPacketsSuccessfullySent;
  uint64_t numPingsTransmitted = self->_numPingsTransmitted;
  uint64_t numPingsReceived = self->_numPingsReceived;
  objc_msgSend_packetLossRate(self, a2, v2, v3);
  return (id)objc_msgSend_stringWithFormat_(v4, v9, @"Ping Statistics:sent = %d, successful = %d, received = %d, min = %f, max = %f, median = %f, average = %f, standardDeviation = %f, packetLossRate = %f", v10, numPingsTransmitted, numPacketsSuccessfullySent, numPingsReceived, v14, v13, *(void *)&standardDeviationRoundtripTime, v11);
}

- (double)medianRoundtripTime
{
  return self->_medianRoundtripTime;
}

- (void)_setMedianRoundtripTime:(double)a3
{
  self->_medianRoundtripTime = a3;
}

- (double)averageRoundtripTime
{
  return self->_averageRoundtripTime;
}

- (double)minRoundtripTime
{
  return self->_minRoundtripTime;
}

- (void)_setMinRoundtripTime:(double)a3
{
  self->_double minRoundtripTime = a3;
}

- (double)maxRoundtripTime
{
  return self->_maxRoundtripTime;
}

- (void)_setMaxRoundtripTime:(double)a3
{
  self->_maxRoundtripTime = a3;
}

- (int)numPingsTransmitted
{
  return self->_numPingsTransmitted;
}

- (int)numPingsReceived
{
  return self->_numPingsReceived;
}

- (int)packetsSuccessfullySent
{
  return self->_packetsSuccessfullySent;
}

- (double)standardDeviationRoundtripTime
{
  return self->_standardDeviationRoundtripTime;
}

- (void)_setStandardDeviationRoundtripTime:(double)a3
{
  self->_double standardDeviationRoundtripTime = a3;
}

@end