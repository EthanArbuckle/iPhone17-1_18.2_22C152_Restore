@interface DSSessionMetric
- (DSSessionMetric)init;
- (NSString)eventName;
- (id)sessionMetricFinalize;
- (void)dsFirstListenerSessionSetUnsuccessful;
- (void)dsProviderAvailable;
- (void)dsProviderUnavailable;
- (void)dsSessionCompletedWithStopReason:(int)a3 numHeartbeats:(unint64_t)a4 numMotionStateMessages:(unint64_t)a5 activeProviderLostCount:(unint64_t)a6 dataLinkType:(int)a7 maxListenerClients:(unint64_t)a8 avgListenerStartInterval:(double)a9;
- (void)dsSessionStartedWithDeviceRole:(int)a3 numPotentialProviders:(unint64_t)a4 unterminatedSession:(BOOL)a5;
- (void)setEventName:(id)a3;
@end

@implementation DSSessionMetric

- (DSSessionMetric)init
{
  v8.receiver = self;
  v8.super_class = (Class)DSSessionMetric;
  v2 = [(DSSessionMetric *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [NSString stringWithString:@"com.apple.distributedsensing.sessionMetric"];
    v4 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v3;

    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = 0;

    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 2) = 0;
    *((void *)v2 + 3) = 0;

    *((void *)v2 + 4) = 0;
    *((void *)v2 + 5) = 0;
    *((_DWORD *)v2 + 12) = 0;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *((void *)v2 + 12) = 0;
    *((void *)v2 + 13) = 0;
    *((_WORD *)v2 + 56) = 0;
  }
  return (DSSessionMetric *)v2;
}

- (void)dsSessionStartedWithDeviceRole:(int)a3 numPotentialProviders:(unint64_t)a4 unterminatedSession:(BOOL)a5
{
  self->_deviceRole = a3;
  self->_numPotentialProviders = a4;
  self->_unterminatedSession = a5;
  self->_sessionStartTime = [MEMORY[0x263EFF910] date];
  MEMORY[0x270F9A758]();
}

- (void)dsProviderAvailable
{
  if (self->_providerAvailableStartTime)
  {
    v2 = +[DSLogging sharedInstance];
    uint64_t v3 = [v2 dsLogger];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] start time already initialized\n", v5, 2u);
    }
  }
  else
  {
    self->_providerAvailableStartTime = [MEMORY[0x263EFF910] date];
    MEMORY[0x270F9A758]();
  }
}

- (void)dsProviderUnavailable
{
  if (self->_providerAvailableStartTime)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    [v3 timeIntervalSinceDate:self->_providerAvailableStartTime];
    self->_totalProviderAvailableDuration = v4 + self->_totalProviderAvailableDuration;

    providerAvailableStartTime = self->_providerAvailableStartTime;
    self->_providerAvailableStartTime = 0;
  }
  else
  {
    v6 = +[DSLogging sharedInstance];
    v7 = [v6 dsLogger];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] Invalid provider availability start time\n", v8, 2u);
    }
  }
}

- (void)dsFirstListenerSessionSetUnsuccessful
{
  self->_isSessionStartUnsuccessful = 1;
}

- (void)dsSessionCompletedWithStopReason:(int)a3 numHeartbeats:(unint64_t)a4 numMotionStateMessages:(unint64_t)a5 activeProviderLostCount:(unint64_t)a6 dataLinkType:(int)a7 maxListenerClients:(unint64_t)a8 avgListenerStartInterval:(double)a9
{
  v17 = [MEMORY[0x263EFF910] date];
  [v17 timeIntervalSinceDate:self->_sessionStartTime];
  self->_sessionDuration = v18;

  self->_sessionStopReason = a3;
  self->_numHeartbeats = a4;
  self->_numMotionStateMessages = a5;
  self->_activeProviderLostCount = a6;
  self->_linkType = a7;
  self->_maxListenerClients = a8;
  self->_avgListenerStartInterval = a9;
}

- (id)sessionMetricFinalize
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t deviceRole = self->_deviceRole;
  if (deviceRole > 2) {
    v5 = "?";
  }
  else {
    v5 = off_2646D50A8[deviceRole];
  }
  v6 = [NSString stringWithUTF8String:v5];
  [v3 setObject:v6 forKeyedSubscript:@"deviceRole"];

  uint64_t linkType = self->_linkType;
  if (linkType > 0xB) {
    objc_super v8 = "?";
  }
  else {
    objc_super v8 = off_2646D50C0[linkType];
  }
  v9 = [NSString stringWithUTF8String:v8];
  [v3 setObject:v9 forKeyedSubscript:@"dataLinkType"];

  v10 = [NSNumber numberWithUnsignedInteger:self->_numHeartbeats];
  [v3 setObject:v10 forKeyedSubscript:@"numHeartbeats"];

  v11 = [NSNumber numberWithUnsignedInteger:self->_numMotionStateMessages];
  [v3 setObject:v11 forKeyedSubscript:@"numMotionStateMessages"];

  v12 = [NSNumber numberWithDouble:self->_sessionDuration];
  [v3 setObject:v12 forKeyedSubscript:@"sessionDuration"];

  int v13 = self->_deviceRole;
  if (v13 == 1)
  {
    uint64_t sessionStopReason = self->_sessionStopReason;
    if (sessionStopReason > 4) {
      v15 = "?";
    }
    else {
      v15 = off_2646D5120[sessionStopReason];
    }
    v16 = [NSString stringWithUTF8String:v15];
    [v3 setObject:v16 forKeyedSubscript:@"sessionStopReason"];

    v17 = [NSNumber numberWithBool:self->_unterminatedSession];
    [v3 setObject:v17 forKeyedSubscript:@"unterminatedSession"];

    int v13 = self->_deviceRole;
  }
  if (v13 == 2)
  {
    double v18 = [NSNumber numberWithUnsignedInteger:self->_numPotentialProviders];
    [v3 setObject:v18 forKeyedSubscript:@"numPotentialProviders"];

    v19 = [NSNumber numberWithUnsignedInteger:self->_activeProviderLostCount];
    [v3 setObject:v19 forKeyedSubscript:@"activeProviderLostCount"];

    v20 = [NSNumber numberWithDouble:self->_totalProviderAvailableDuration];
    [v3 setObject:v20 forKeyedSubscript:@"providerAvailabilityDuration"];

    self->_providerAvailability = (self->_totalProviderAvailableDuration / self->_sessionDuration * 100.0);
    v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v21 forKeyedSubscript:@"providerAvailability"];

    v22 = [NSNumber numberWithUnsignedInteger:self->_maxListenerClients];
    [v3 setObject:v22 forKeyedSubscript:@"maxListenerClients"];

    if (self->_avgListenerStartInterval != 0.0)
    {
      v23 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v3 setObject:v23 forKeyedSubscript:@"avgListenerStartInterval"];
    }
    v24 = [NSNumber numberWithBool:self->_isSessionStartUnsuccessful];
    [v3 setObject:v24 forKeyedSubscript:@"unsuccessfulSessionStart"];
  }
  return v3;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_providerAvailableStartTime, 0);
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
}

@end