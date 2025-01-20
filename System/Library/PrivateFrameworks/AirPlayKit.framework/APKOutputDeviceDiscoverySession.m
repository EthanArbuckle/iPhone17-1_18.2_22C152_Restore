@interface APKOutputDeviceDiscoverySession
- (APKOutputDeviceDiscoverySession)init;
- (AVOutputDeviceDiscoverySession)session;
- (NSArray)availableOutputDevices;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
@end

@implementation APKOutputDeviceDiscoverySession

- (APKOutputDeviceDiscoverySession)init
{
  v6.receiver = self;
  v6.super_class = (Class)APKOutputDeviceDiscoverySession;
  v2 = [(APKOutputDeviceDiscoverySession *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFA7D0]) initWithDeviceFeatures:8];
    session = v2->_session;
    v2->_session = (AVOutputDeviceDiscoverySession *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(APKOutputDeviceDiscoverySession *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)APKOutputDeviceDiscoverySession;
  [(APKOutputDeviceDiscoverySession *)&v3 dealloc];
}

- (NSArray)availableOutputDevices
{
  v2 = [(APKOutputDeviceDiscoverySession *)self session];
  objc_super v3 = [v2 availableOutputDevices];

  return (NSArray *)v3;
}

- (void)activate
{
  id v2 = [(APKOutputDeviceDiscoverySession *)self session];
  [v2 setDiscoveryMode:2];
}

- (void)deactivate
{
  id v2 = [(APKOutputDeviceDiscoverySession *)self session];
  [v2 setDiscoveryMode:0];
}

- (AVOutputDeviceDiscoverySession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
}

@end