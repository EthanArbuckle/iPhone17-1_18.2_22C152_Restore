@interface AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl
- (AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl)init;
- (AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl)initWithAvailableFigEndpoints:(id)a3;
- (NSArray)allDevices;
- (void)dealloc;
@end

@implementation AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl

- (AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(sel_initWithAvailableFigEndpoints_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl)initWithAvailableFigEndpoints:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl;
  v4 = [(AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *)&v6 init];
  if (v4) {
    v4->_figEndpoints = (NSArray *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl;
  [(AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *)&v3 dealloc];
}

- (NSArray)allDevices
{
  objc_super v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  if ([(NSArray *)self->_figEndpoints count])
  {
    unint64_t v4 = 0;
    do
      [(NSArray *)v3 addObject:+[AVOutputDevice outputDeviceWithFigEndpoint:[(NSArray *)self->_figEndpoints objectAtIndex:v4++]]];
    while ([(NSArray *)self->_figEndpoints count] > v4);
  }
  return v3;
}

@end