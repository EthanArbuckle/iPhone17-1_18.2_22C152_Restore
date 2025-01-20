@interface CUMobileDeviceMonitorContext
- (CUMobileDevice)device;
- (CUMobileDeviceDiscovery)discovery;
- (void)setDevice:(id)a3;
- (void)setDiscovery:(id)a3;
@end

@implementation CUMobileDeviceMonitorContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setDiscovery:(id)a3
{
}

- (CUMobileDeviceDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDevice:(id)a3
{
}

- (CUMobileDevice)device
{
  return self->_device;
}

@end