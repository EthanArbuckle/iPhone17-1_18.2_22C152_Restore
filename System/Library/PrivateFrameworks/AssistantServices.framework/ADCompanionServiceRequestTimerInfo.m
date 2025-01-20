@interface ADCompanionServiceRequestTimerInfo
- (AFWatchdogTimer)heartbeatTimer;
- (AFWatchdogTimer)requestTimer;
- (RPCompanionLinkDevice)destination;
- (double)startTime;
- (void)setDestination:(id)a3;
- (void)setHeartbeatTimer:(id)a3;
- (void)setRequestTimer:(id)a3;
- (void)setStartTime:(double)a3;
@end

@implementation ADCompanionServiceRequestTimerInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_requestTimer, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
}

- (void)setDestination:(id)a3
{
}

- (RPCompanionLinkDevice)destination
{
  return self->_destination;
}

- (void)setRequestTimer:(id)a3
{
}

- (AFWatchdogTimer)requestTimer
{
  return self->_requestTimer;
}

- (void)setHeartbeatTimer:(id)a3
{
}

- (AFWatchdogTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

@end