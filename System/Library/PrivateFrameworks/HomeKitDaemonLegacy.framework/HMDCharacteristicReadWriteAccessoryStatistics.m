@interface HMDCharacteristicReadWriteAccessoryStatistics
- (HMDCharacteristicReadWriteAccessoryStatistics)init;
- (NSData)lastFailureIpv4Signature;
- (NSData)lastFailureIpv6Signature;
- (NSData)lastSuccessIpv4Signature;
- (NSData)lastSuccessIpv6Signature;
- (NSString)lastSuccessBSSID;
- (NSString)lastSuccessSSID;
- (double)timeOfFirstFailureRequest;
- (double)timeOfLastFailedRequest;
- (double)timeOfLastSuccessfulRequest;
- (int64_t)lastFailedLinkLayerType;
- (int64_t)lastSuccessLinkLayerType;
- (unint64_t)consecutiveFailureCount;
- (unint64_t)consecutiveSuccessCount;
- (void)setConsecutiveFailureCount:(unint64_t)a3;
- (void)setConsecutiveSuccessCount:(unint64_t)a3;
- (void)setLastFailedLinkLayerType:(int64_t)a3;
- (void)setLastFailureIpv4Signature:(id)a3;
- (void)setLastFailureIpv6Signature:(id)a3;
- (void)setLastSuccessBSSID:(id)a3;
- (void)setLastSuccessIpv4Signature:(id)a3;
- (void)setLastSuccessIpv6Signature:(id)a3;
- (void)setLastSuccessLinkLayerType:(int64_t)a3;
- (void)setLastSuccessSSID:(id)a3;
- (void)setTimeOfFirstFailureRequest:(double)a3;
- (void)setTimeOfLastFailedRequest:(double)a3;
- (void)setTimeOfLastSuccessfulRequest:(double)a3;
@end

@implementation HMDCharacteristicReadWriteAccessoryStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFailureIpv6Signature, 0);
  objc_storeStrong((id *)&self->_lastFailureIpv4Signature, 0);
  objc_storeStrong((id *)&self->_lastSuccessIpv6Signature, 0);
  objc_storeStrong((id *)&self->_lastSuccessIpv4Signature, 0);
  objc_storeStrong((id *)&self->_lastSuccessBSSID, 0);
  objc_storeStrong((id *)&self->_lastSuccessSSID, 0);
}

- (void)setLastFailureIpv6Signature:(id)a3
{
}

- (NSData)lastFailureIpv6Signature
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLastFailureIpv4Signature:(id)a3
{
}

- (NSData)lastFailureIpv4Signature
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastSuccessIpv6Signature:(id)a3
{
}

- (NSData)lastSuccessIpv6Signature
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastSuccessIpv4Signature:(id)a3
{
}

- (NSData)lastSuccessIpv4Signature
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastSuccessBSSID:(id)a3
{
}

- (NSString)lastSuccessBSSID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastSuccessSSID:(id)a3
{
}

- (NSString)lastSuccessSSID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastFailedLinkLayerType:(int64_t)a3
{
  self->_lastFailedLinkLayerType = a3;
}

- (int64_t)lastFailedLinkLayerType
{
  return self->_lastFailedLinkLayerType;
}

- (void)setLastSuccessLinkLayerType:(int64_t)a3
{
  self->_lastSuccessLinkLayerType = a3;
}

- (int64_t)lastSuccessLinkLayerType
{
  return self->_lastSuccessLinkLayerType;
}

- (void)setConsecutiveFailureCount:(unint64_t)a3
{
  self->_consecutiveFailureCount = a3;
}

- (unint64_t)consecutiveFailureCount
{
  return self->_consecutiveFailureCount;
}

- (void)setConsecutiveSuccessCount:(unint64_t)a3
{
  self->_consecutiveSuccessCount = a3;
}

- (unint64_t)consecutiveSuccessCount
{
  return self->_consecutiveSuccessCount;
}

- (void)setTimeOfLastFailedRequest:(double)a3
{
  self->_timeOfLastFailedRequest = a3;
}

- (double)timeOfLastFailedRequest
{
  return self->_timeOfLastFailedRequest;
}

- (void)setTimeOfLastSuccessfulRequest:(double)a3
{
  self->_timeOfLastSuccessfulRequest = a3;
}

- (double)timeOfLastSuccessfulRequest
{
  return self->_timeOfLastSuccessfulRequest;
}

- (void)setTimeOfFirstFailureRequest:(double)a3
{
  self->_timeOfFirstFailureRequest = a3;
}

- (double)timeOfFirstFailureRequest
{
  return self->_timeOfFirstFailureRequest;
}

- (HMDCharacteristicReadWriteAccessoryStatistics)init
{
  v11.receiver = self;
  v11.super_class = (Class)HMDCharacteristicReadWriteAccessoryStatistics;
  v2 = [(HMDCharacteristicReadWriteAccessoryStatistics *)&v11 init];
  v3 = (HMDCharacteristicReadWriteAccessoryStatistics *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    v4 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 7) = 0;
    *((void *)v2 + 8) = 0;

    lastSuccessBSSID = v3->_lastSuccessBSSID;
    v3->_lastSuccessBSSID = 0;

    lastSuccessIpv4Signature = v3->_lastSuccessIpv4Signature;
    v3->_lastSuccessIpv4Signature = 0;

    lastSuccessIpv6Signature = v3->_lastSuccessIpv6Signature;
    v3->_lastSuccessIpv6Signature = 0;

    lastFailureIpv4Signature = v3->_lastFailureIpv4Signature;
    v3->_lastFailureIpv4Signature = 0;

    lastFailureIpv6Signature = v3->_lastFailureIpv6Signature;
    v3->_lastFailureIpv6Signature = 0;
  }
  return v3;
}

@end