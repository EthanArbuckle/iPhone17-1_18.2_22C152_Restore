@interface HMDModernTransportMessageContextOptionsBuilder
- (BOOL)expectRapportSuccess;
- (BOOL)expectsMultipleResponses;
- (BOOL)trackingDeviceReachability;
- (NSSet)transports;
- (NSString)requestStartTimeHeaderKey;
- (NSString)timeToLiveHeaderKey;
- (double)timeToLive;
- (double)timeoutOverride;
- (void)setExpectRapportSuccess:(BOOL)a3;
- (void)setExpectsMultipleResponses:(BOOL)a3;
- (void)setRequestStartTimeHeaderKey:(id)a3;
- (void)setTimeToLive:(double)a3;
- (void)setTimeToLiveHeaderKey:(id)a3;
- (void)setTimeoutOverride:(double)a3;
- (void)setTrackingDeviceReachability:(BOOL)a3;
- (void)setTransports:(id)a3;
@end

@implementation HMDModernTransportMessageContextOptionsBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToLiveHeaderKey, 0);
  objc_storeStrong((id *)&self->_requestStartTimeHeaderKey, 0);
  objc_storeStrong((id *)&self->_transports, 0);
}

- (void)setTimeToLiveHeaderKey:(id)a3
{
}

- (NSString)timeToLiveHeaderKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequestStartTimeHeaderKey:(id)a3
{
}

- (NSString)requestStartTimeHeaderKey
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExpectRapportSuccess:(BOOL)a3
{
  self->_expectRapportSuccess = a3;
}

- (BOOL)expectRapportSuccess
{
  return self->_expectRapportSuccess;
}

- (void)setTrackingDeviceReachability:(BOOL)a3
{
  self->_trackingDeviceReachability = a3;
}

- (BOOL)trackingDeviceReachability
{
  return self->_trackingDeviceReachability;
}

- (void)setExpectsMultipleResponses:(BOOL)a3
{
  self->_expectsMultipleResponses = a3;
}

- (BOOL)expectsMultipleResponses
{
  return self->_expectsMultipleResponses;
}

- (void)setTimeToLive:(double)a3
{
  self->_timeToLive = a3;
}

- (double)timeToLive
{
  return self->_timeToLive;
}

- (void)setTimeoutOverride:(double)a3
{
  self->_timeoutOverride = a3;
}

- (double)timeoutOverride
{
  return self->_timeoutOverride;
}

- (void)setTransports:(id)a3
{
}

- (NSSet)transports
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

@end