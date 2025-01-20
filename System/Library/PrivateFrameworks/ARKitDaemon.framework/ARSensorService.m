@interface ARSensorService
+ (BOOL)isSupported;
- (ARRemoteSensorClient)clientProxy;
- (ARSensor)sensor;
- (ARSensorService)initWithConnection:(id)a3;
- (void)providedDataTypesWithReply:(id)a3;
- (void)sensor:(id)a3 didFailWithError:(id)a4;
- (void)sensor:(id)a3 didOutputSensorData:(id)a4;
- (void)sensorDidPause:(id)a3;
- (void)sensorDidRestart:(id)a3;
- (void)sensorDidStart:(id)a3;
- (void)setClientProxy:(id)a3;
- (void)setSensor:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ARSensorService

- (ARSensorService)initWithConnection:(id)a3
{
  id v4 = a3;
  v5 = ARRemoteSensorServiceInterfaceWithProtocol();
  v6 = ARRemoteSensorClientInterfaceWithProtocol();
  v11.receiver = self;
  v11.super_class = (Class)ARSensorService;
  v7 = [(ARDaemonService *)&v11 initWithConnection:v4 exportedInterface:v5 remoteObjectInterface:v6];

  if (v7)
  {
    uint64_t v8 = [v4 remoteObjectProxy];
    clientProxy = v7->_clientProxy;
    v7->_clientProxy = (ARRemoteSensorClient *)v8;
  }
  return v7;
}

- (void)providedDataTypesWithReply:(id)a3
{
  sensor = self->_sensor;
  id v4 = (void (**)(id, uint64_t, void))a3;
  v4[2](v4, [(ARSensor *)sensor providedDataTypes], 0);
}

- (void)start
{
}

- (void)stop
{
}

- (void)sensor:(id)a3 didFailWithError:(id)a4
{
}

- (void)sensor:(id)a3 didOutputSensorData:(id)a4
{
}

- (void)sensorDidPause:(id)a3
{
}

- (void)sensorDidRestart:(id)a3
{
}

- (void)sensorDidStart:(id)a3
{
}

+ (BOOL)isSupported
{
  return 0;
}

- (ARRemoteSensorClient)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (ARSensor)sensor
{
  return self->_sensor;
}

- (void)setSensor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensor, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

@end