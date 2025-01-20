@interface IDSConnectivityMonitorMetricProperties
- (BOOL)success;
- (BOOL)terminusConnected;
- (BOOL)terminusNearby;
- (BOOL)terminusRegistered;
- (NSString)pairedDeviceCBUUIDString;
- (NSString)personalCBUUIDString;
- (double)timeConnected;
- (double)timeDisconnected;
- (void)setPairedDeviceCBUUIDString:(id)a3;
- (void)setPersonalCBUUIDString:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setTerminusConnected:(BOOL)a3;
- (void)setTerminusNearby:(BOOL)a3;
- (void)setTerminusRegistered:(BOOL)a3;
- (void)setTimeConnected:(double)a3;
- (void)setTimeDisconnected:(double)a3;
@end

@implementation IDSConnectivityMonitorMetricProperties

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)terminusConnected
{
  return self->_terminusConnected;
}

- (void)setTerminusConnected:(BOOL)a3
{
  self->_terminusConnected = a3;
}

- (BOOL)terminusNearby
{
  return self->_terminusNearby;
}

- (void)setTerminusNearby:(BOOL)a3
{
  self->_terminusNearby = a3;
}

- (BOOL)terminusRegistered
{
  return self->_terminusRegistered;
}

- (void)setTerminusRegistered:(BOOL)a3
{
  self->_terminusRegistered = a3;
}

- (double)timeConnected
{
  return self->_timeConnected;
}

- (void)setTimeConnected:(double)a3
{
  self->_timeConnected = a3;
}

- (double)timeDisconnected
{
  return self->_timeDisconnected;
}

- (void)setTimeDisconnected:(double)a3
{
  self->_timeDisconnected = a3;
}

- (NSString)personalCBUUIDString
{
  return self->_personalCBUUIDString;
}

- (void)setPersonalCBUUIDString:(id)a3
{
}

- (NSString)pairedDeviceCBUUIDString
{
  return self->_pairedDeviceCBUUIDString;
}

- (void)setPairedDeviceCBUUIDString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceCBUUIDString, 0);

  objc_storeStrong((id *)&self->_personalCBUUIDString, 0);
}

@end