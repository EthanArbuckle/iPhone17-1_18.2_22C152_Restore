@interface MTLIOAccelServiceGlobalContext
- (MTLIOAccelServiceGlobalContext)init;
- (void)dealloc;
- (void)processPendingCreateIOAccelServiceRequests;
@end

@implementation MTLIOAccelServiceGlobalContext

- (MTLIOAccelServiceGlobalContext)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTLIOAccelServiceGlobalContext;
  v2 = [(MTLIOAccelServiceGlobalContext *)&v14 init];
  if (v2)
  {
    mach_port_t v13 = 0;
    uint64_t v3 = MEMORY[0x18530BBA0](*MEMORY[0x1E4F14638], &v13);
    if (v3)
    {
      NSLog(&cfstr_SIomainportFai.isa, "-[MTLIOAccelServiceGlobalContext init]", v3);
      return 0;
    }
    io_iterator_t existing = 0;
    mach_port_t v4 = v13;
    CFDictionaryRef v5 = IOServiceMatching("IOAcceleratorES");
    uint64_t MatchingServices = IOServiceGetMatchingServices(v4, v5, &existing);
    if (MatchingServices)
    {
      NSLog(&cfstr_SIoservicegetm.isa, "-[MTLIOAccelServiceGlobalContext init]", MatchingServices);
      return 0;
    }
    v2->_pendingCreateAccelServiceRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = IOIteratorNext(existing);
    if (v8)
    {
      uint64_t v9 = v8;
      do
      {
        MetalPluginClassForService = getMetalPluginClassForService(v9);
        if (MetalPluginClassForService)
        {
          v11 = [[MTLIOAccelServiceDescriptor alloc] initWithAcceleratorPort:v9 deviceClass:MetalPluginClassForService];
          [(NSMutableArray *)v2->_pendingCreateAccelServiceRequests addObject:v11];
        }
        IOObjectRelease(v9);
        uint64_t v9 = IOIteratorNext(existing);
      }
      while (v9);
    }
    IOObjectRelease(existing);
  }
  return v2;
}

- (void)processPendingCreateIOAccelServiceRequests
{
  uint64_t v3 = [(NSMutableArray *)self->_pendingCreateAccelServiceRequests count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = (void *)[(NSMutableArray *)self->_pendingCreateAccelServiceRequests objectAtIndexedSubscript:i];
      v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "deviceClass")), "initWithAcceleratorPort:", objc_msgSend(v6, "acceleratorPort"));
      if (v7)
      {
        v15 = v7;
        MTLAddDevice(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }

  self->_pendingCreateAccelServiceRequests = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelServiceGlobalContext;
  [(MTLIOAccelServiceGlobalContext *)&v3 dealloc];
}

@end