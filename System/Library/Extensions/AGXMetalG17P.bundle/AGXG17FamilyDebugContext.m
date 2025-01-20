@interface AGXG17FamilyDebugContext
- (AGXG17FamilyDebugContext)initWithCommandBuffer:(id)a3;
- (unsigned)getLastStartStopCaptureResult;
- (void)dealloc;
- (void)endEncoding;
@end

@implementation AGXG17FamilyDebugContext

- (unsigned)getLastStartStopCaptureResult
{
  return 0;
}

- (void)endEncoding
{
  *((unsigned char *)self->_impl + 12) = 1;
  v2.receiver = self;
  v2.super_class = (Class)AGXG17FamilyDebugContext;
  [(IOGPUMetalDebugCommandEncoder *)&v2 endEncoding];
}

- (void)dealloc
{
  impl = self->_impl;
  if (impl)
  {
    free(impl);
    self->_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilyDebugContext;
  [(IOGPUMetalDebugCommandEncoder *)&v4 dealloc];
}

- (AGXG17FamilyDebugContext)initWithCommandBuffer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AGXG17FamilyDebugContext;
  v3 = [(IOGPUMetalDebugCommandEncoder *)&v7 initWithCommandBuffer:a3];
  if (v3)
  {
    objc_super v4 = malloc_type_calloc(0x10uLL, 1uLL, 0xAA563435uLL);
    v3->_impl = v4;
    if (v4)
    {
      v5 = v4;
      *objc_super v4 = v3;
      *((unsigned char *)v4 + 12) = 0;
      [(MTLDevice *)[(_MTLCommandEncoder *)v3 device] deviceRef];
      *((_DWORD *)v5 + 2) = IOGPUDeviceGetConnect();
    }
    else
    {
      [(AGXG17FamilyDebugContext *)v3 endEncoding];

      return 0;
    }
  }
  return v3;
}

@end