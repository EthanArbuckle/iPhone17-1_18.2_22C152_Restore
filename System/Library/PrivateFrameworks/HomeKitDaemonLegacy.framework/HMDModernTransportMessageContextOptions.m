@interface HMDModernTransportMessageContextOptions
+ (id)newWithBuilder:(id)a3;
- (BOOL)expectRapportSuccess;
- (BOOL)expectsMultipleResponses;
- (BOOL)isTrackingDeviceReachability;
- (HMDModernTransportMessageContextOptions)initWithBuilder:(id)a3;
- (NSSet)transports;
- (NSString)requestStartTimeHeaderKey;
- (NSString)timeToLiveHeaderKey;
- (double)timeToLive;
- (double)timeoutOverride;
@end

@implementation HMDModernTransportMessageContextOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToLiveHeaderKey, 0);
  objc_storeStrong((id *)&self->_requestStartTimeHeaderKey, 0);
  objc_storeStrong((id *)&self->_transports, 0);
}

- (BOOL)expectRapportSuccess
{
  return self->_expectRapportSuccess;
}

- (NSString)timeToLiveHeaderKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)requestStartTimeHeaderKey
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isTrackingDeviceReachability
{
  return self->_trackingDeviceReachability;
}

- (BOOL)expectsMultipleResponses
{
  return self->_expectsMultipleResponses;
}

- (double)timeToLive
{
  return self->_timeToLive;
}

- (double)timeoutOverride
{
  return self->_timeoutOverride;
}

- (NSSet)transports
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (HMDModernTransportMessageContextOptions)initWithBuilder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDModernTransportMessageContextOptions;
  v5 = [(HMDModernTransportMessageContextOptions *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 transports];
    transports = v5->_transports;
    v5->_transports = (NSSet *)v6;

    [v4 timeoutOverride];
    v5->_timeoutOverride = v8;
    [v4 timeToLive];
    v5->_timeToLive = v9;
    v5->_expectsMultipleResponses = [v4 expectsMultipleResponses];
    v5->_expectRapportSuccess = [v4 expectRapportSuccess];
    v5->_trackingDeviceReachability = [v4 trackingDeviceReachability];
    uint64_t v10 = [v4 requestStartTimeHeaderKey];
    requestStartTimeHeaderKey = v5->_requestStartTimeHeaderKey;
    v5->_requestStartTimeHeaderKey = (NSString *)v10;

    uint64_t v12 = [v4 timeToLiveHeaderKey];
    timeToLiveHeaderKey = v5->_timeToLiveHeaderKey;
    v5->_timeToLiveHeaderKey = (NSString *)v12;
  }
  return v5;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, HMDModernTransportMessageContextOptionsBuilder *))a3;
  id v4 = objc_alloc_init(HMDModernTransportMessageContextOptionsBuilder);
  v3[2](v3, v4);

  v5 = [[HMDModernTransportMessageContextOptions alloc] initWithBuilder:v4];
  return v5;
}

@end