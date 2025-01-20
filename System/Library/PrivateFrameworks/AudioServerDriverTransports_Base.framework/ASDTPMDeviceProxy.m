@interface ASDTPMDeviceProxy
+ (id)forPMDevice:(id)a3;
- (ASDTPMProtocol)proxiedDevice;
- (BOOL)asdtHandlesPowerTransition:(int)a3;
- (BOOL)pmNoStateChangeOnFailure;
- (NSString)name;
- (id)initForPMDevice:(id)a3;
- (int)asdtPowerStateChange:(int)a3;
- (int)performPowerStateIdle:(int)a3;
- (int)performPowerStateOn;
- (int)performPowerStatePrepare:(int)a3;
- (int)performPowerStatePrewarm:(int)a3;
- (int)performPowerStateSleep;
- (int)powerState;
- (unsigned)pmOrderPowerDown;
- (unsigned)pmOrderPowerUp;
- (void)setPowerState:(int)a3;
- (void)setProxiedDevice:(id)a3;
@end

@implementation ASDTPMDeviceProxy

+ (id)forPMDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initForPMDevice:v4];

  return v5;
}

- (id)initForPMDevice:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASDTPMDeviceProxy;
  v5 = [(ASDTPMDeviceProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ASDTPMDeviceProxy *)v5 setProxiedDevice:v4];
  }

  return v6;
}

- (NSString)name
{
  v2 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (unsigned)pmOrderPowerUp
{
  v2 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  unsigned int v3 = [v2 pmOrderPowerUp];

  return v3;
}

- (unsigned)pmOrderPowerDown
{
  v2 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  unsigned int v3 = [v2 pmOrderPowerDown];

  return v3;
}

- (BOOL)pmNoStateChangeOnFailure
{
  v2 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  char v3 = [v2 pmNoStateChangeOnFailure];

  return v3;
}

- (int)powerState
{
  v2 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  int v3 = [v2 powerState];

  return v3;
}

- (void)setPowerState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  [v4 setPowerState:v3];
}

- (int)asdtPowerStateChange:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  LODWORD(v3) = [v4 asdtPowerStateChange:v3];

  return v3;
}

- (BOOL)asdtHandlesPowerTransition:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  LOBYTE(v3) = [v4 asdtHandlesPowerTransition:v3];

  return v3;
}

- (int)performPowerStateSleep
{
  v2 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  int v3 = [v2 performPowerStateSleep];

  return v3;
}

- (int)performPowerStateIdle:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  LODWORD(v3) = [v4 performPowerStateIdle:v3];

  return v3;
}

- (int)performPowerStatePrepare:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  LODWORD(v3) = [v4 performPowerStatePrepare:v3];

  return v3;
}

- (int)performPowerStatePrewarm:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  LODWORD(v3) = [v4 performPowerStatePrewarm:v3];

  return v3;
}

- (int)performPowerStateOn
{
  v2 = [(ASDTPMDeviceProxy *)self proxiedDevice];
  int v3 = [v2 performPowerStateOn];

  return v3;
}

- (ASDTPMProtocol)proxiedDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxiedDevice);
  return (ASDTPMProtocol *)WeakRetained;
}

- (void)setProxiedDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end