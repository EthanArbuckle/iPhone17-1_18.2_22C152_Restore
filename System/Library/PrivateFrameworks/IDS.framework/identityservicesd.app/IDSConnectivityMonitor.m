@interface IDSConnectivityMonitor
- (BOOL)isConnected;
- (BOOL)isNearby;
- (IDSConnectivityMonitor)init;
- (NRDeviceMonitor)deviceMonitor;
- (NSDate)lastConnection;
- (NSDate)lastDisconnection;
- (NSString)cbuuidString;
- (NSString)pairedDeviceCBUUIDString;
- (double)timeConnected;
- (double)timeDisconnected;
- (void)checkConnectivityState:(id)a3;
- (void)deliveryController:(id)a3 uniqueID:(id)a4 isConnected:(BOOL)a5;
- (void)sendMonitorMessage;
- (void)setCbuuidString:(id)a3;
- (void)setDeviceMonitor:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsNearby:(BOOL)a3;
- (void)setLastConnection:(id)a3;
- (void)setLastDisconnection:(id)a3;
- (void)setPairedDeviceCBUUIDString:(id)a3;
- (void)setTimeConnected:(double)a3;
- (void)setTimeDisconnected:(double)a3;
@end

@implementation IDSConnectivityMonitor

- (IDSConnectivityMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSConnectivityMonitor;
  return [(IDSConnectivityMonitor *)&v3 init];
}

- (void)checkConnectivityState:(id)a3
{
  v4 = +[IDSPairingManager sharedInstance];
  v5 = [v4 pairedDeviceUUIDString];

  if (v5)
  {
    v6 = +[IDSUTunDeliveryController sharedInstance];
    unsigned int v7 = [v6 isConnected];

    if (v7)
    {
      [(IDSConnectivityMonitor *)self sendMonitorMessage];
    }
    else
    {
      v8 = +[IDSFoundationLog ConnectivityMonitor];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IDS is not connected, do not send monitoring message.", v15, 2u);
      }

      v9 = objc_alloc_init(IDSConnectivityMonitorMetricProperties);
      v10 = +[IDSUTunDeliveryController sharedInstance];
      -[IDSConnectivityMonitorMetricProperties setTerminusConnected:](v9, "setTerminusConnected:", [v10 isTerminusConnected]);

      v11 = +[IDSUTunDeliveryController sharedInstance];
      -[IDSConnectivityMonitorMetricProperties setTerminusNearby:](v9, "setTerminusNearby:", [v11 isTerminusNearby]);

      v12 = +[IDSUTunDeliveryController sharedInstance];
      -[IDSConnectivityMonitorMetricProperties setTerminusRegistered:](v9, "setTerminusRegistered:", [v12 isTerminusRegistered]);

      [(IDSConnectivityMonitorMetricProperties *)v9 setPairedDeviceCBUUIDString:v5];
      [(IDSConnectivityMonitorMetricProperties *)v9 setSuccess:0];
      [(IDSConnectivityMonitor *)self timeConnected];
      -[IDSConnectivityMonitorMetricProperties setTimeConnected:](v9, "setTimeConnected:");
      [(IDSConnectivityMonitor *)self timeDisconnected];
      -[IDSConnectivityMonitorMetricProperties setTimeDisconnected:](v9, "setTimeDisconnected:");
      v13 = [[IDSConnectivityMonitorMetric alloc] initWithProperties:v9];
      v14 = +[IDSRTCLogger loggerWithCategory:3000];
      [v14 logMetric:v13];
    }
  }
}

- (void)sendMonitorMessage
{
  objc_super v3 = +[NSString stringGUID];
  id v4 = objc_alloc_init((Class)IDSSendParameters);
  [v4 setPriority:200];
  uint64_t v18 = IDSDefaultPairedDevice;
  v5 = +[NSArray arrayWithObjects:&v18 count:1];
  v6 = +[NSSet setWithArray:v5];
  unsigned int v7 = +[IDSDestination destinationWithStrings:v6];
  [v4 setDestinations:v7];

  v8 = +[NSNumber numberWithInteger:242];
  [v4 setCommand:v8];

  [v4 setFromID:0];
  [v4 setIdentifier:v3];
  v9 = IDSGetUUIDData();
  [v4 setMessageUUID:v9];

  [v4 setLocalDelivery:1];
  v10 = +[IDSDAccountController sharedInstance];
  v11 = +[IDSDServiceController sharedInstance];
  v12 = [v11 serviceWithIdentifier:@"com.apple.private.alloy.connectivity.monitor"];
  v13 = [v10 localAccountOnService:v12];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100140A64;
  v15[3] = &unk_100980110;
  id v16 = v3;
  v17 = self;
  id v14 = v3;
  [v13 sendMessageWithSendParameters:v4 willSendBlock:0 completionBlock:v15];
}

- (double)timeConnected
{
  objc_super v3 = [(IDSConnectivityMonitor *)self lastConnection];

  if (!v3) {
    return 0.0;
  }
  id v4 = +[NSDate date];
  v5 = [(IDSConnectivityMonitor *)self lastConnection];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7;
}

- (double)timeDisconnected
{
  objc_super v3 = [(IDSConnectivityMonitor *)self lastDisconnection];

  if (!v3) {
    return 0.0;
  }
  id v4 = +[NSDate date];
  v5 = [(IDSConnectivityMonitor *)self lastDisconnection];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7;
}

- (void)deliveryController:(id)a3 uniqueID:(id)a4 isConnected:(BOOL)a5
{
  BOOL v5 = a5;
  double v7 = +[NSDate date];
  if (v5)
  {
    [(IDSConnectivityMonitor *)self setLastConnection:v7];

    [(IDSConnectivityMonitor *)self setLastDisconnection:0];
  }
  else
  {
    [(IDSConnectivityMonitor *)self setLastDisconnection:v7];

    [(IDSConnectivityMonitor *)self setLastConnection:0];
  }
}

- (NRDeviceMonitor)deviceMonitor
{
  return self->_deviceMonitor;
}

- (void)setDeviceMonitor:(id)a3
{
}

- (NSString)cbuuidString
{
  return self->_cbuuidString;
}

- (void)setCbuuidString:(id)a3
{
}

- (NSString)pairedDeviceCBUUIDString
{
  return self->_pairedDeviceCBUUIDString;
}

- (void)setPairedDeviceCBUUIDString:(id)a3
{
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (void)setIsNearby:(BOOL)a3
{
  self->_isNearby = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (void)setTimeConnected:(double)a3
{
  self->_timeConnected = a3;
}

- (void)setTimeDisconnected:(double)a3
{
  self->_timeDisconnected = a3;
}

- (NSDate)lastConnection
{
  return self->_lastConnection;
}

- (void)setLastConnection:(id)a3
{
}

- (NSDate)lastDisconnection
{
  return self->_lastDisconnection;
}

- (void)setLastDisconnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDisconnection, 0);
  objc_storeStrong((id *)&self->_lastConnection, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCBUUIDString, 0);
  objc_storeStrong((id *)&self->_cbuuidString, 0);

  objc_storeStrong((id *)&self->_deviceMonitor, 0);
}

@end