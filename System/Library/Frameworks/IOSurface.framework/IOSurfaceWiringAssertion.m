@interface IOSurfaceWiringAssertion
- (IOSurfaceWiringAssertion)initWithIOSurface:(id)a3;
- (IOSurfaceWiringAssertion)initWithIOSurfaceClient:(__IOSurfaceClient *)a3;
- (void)dealloc;
@end

@implementation IOSurfaceWiringAssertion

- (IOSurfaceWiringAssertion)initWithIOSurfaceClient:(__IOSurfaceClient *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)IOSurfaceWiringAssertion;
  v4 = [(IOSurfaceWiringAssertion *)&v7 init];
  unsigned int MachPortWithOptions = IOSurfaceClientCreateMachPortWithOptions((uint64_t)a3, 1uLL);
  v4->_mach_port = MachPortWithOptions;
  if (!MachPortWithOptions)
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  mach_port_name_t mach_port = self->_mach_port;
  if (mach_port)
  {
    mach_port_mod_refs(*MEMORY[0x1E4F14960], mach_port, 0, -1);
    self->_mach_port_name_t mach_port = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IOSurfaceWiringAssertion;
  [(IOSurfaceWiringAssertion *)&v4 dealloc];
}

- (IOSurfaceWiringAssertion)initWithIOSurface:(id)a3
{
  return [(IOSurfaceWiringAssertion *)self initWithIOSurfaceClient:*((void *)a3 + 1)];
}

@end