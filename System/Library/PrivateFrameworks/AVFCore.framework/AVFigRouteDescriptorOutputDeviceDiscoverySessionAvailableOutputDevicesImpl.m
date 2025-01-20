@interface AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl
- (AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl)init;
- (AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl)initWithRouteDescriptors:(id)a3 routeDiscoverer:(OpaqueFigRouteDiscoverer *)a4;
- (NSArray)allDevices;
- (void)dealloc;
@end

@implementation AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl

- (NSArray)allDevices
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  routeDescriptors = self->_routeDescriptors;
  uint64_t v5 = [(NSArray *)routeDescriptors countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(routeDescriptors);
        }
        [(NSArray *)v3 addObject:+[AVOutputDevice outputDeviceWithRouteDescriptor:*(void *)(*((void *)&v10 + 1) + 8 * i) routeDiscoverer:self->_routeDiscoverer]];
      }
      uint64_t v6 = [(NSArray *)routeDescriptors countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl)initWithRouteDescriptors:(id)a3 routeDiscoverer:(OpaqueFigRouteDiscoverer *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl;
  uint64_t v6 = [(AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *)&v10 init];
  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v7 = [a3 copy];
  v6->_routeDescriptors = (NSArray *)v7;
  if (!v7) {
    goto LABEL_8;
  }
  if (!a4)
  {
    v6->_routeDiscoverer = 0;
    goto LABEL_7;
  }
  v8 = (OpaqueFigRouteDiscoverer *)CFRetain(a4);
  v6->_routeDiscoverer = v8;
  if (!v8)
  {
LABEL_8:
    a4 = 0;
    goto LABEL_7;
  }
  a4 = v6;
LABEL_7:

  return (AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *)a4;
}

- (void)dealloc
{
  routeDiscoverer = self->_routeDiscoverer;
  if (routeDiscoverer) {
    CFRelease(routeDiscoverer);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl;
  [(AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *)&v4 dealloc];
}

- (AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl)init
{
  objc_super v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  uint64_t v6 = NSStringFromSelector(sel_initWithRouteDescriptors_routeDiscoverer_);
  long long v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

@end