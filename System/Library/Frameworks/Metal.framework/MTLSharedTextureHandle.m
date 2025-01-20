@interface MTLSharedTextureHandle
+ (BOOL)supportsSecureCoding;
- (MTLSharedTextureHandle)initWithCoder:(id)a3;
- (MTLSharedTextureHandle)initWithIOSurface:(__IOSurface *)a3 label:(id)a4;
- (MTLSharedTextureHandle)initWithMachPort:(unsigned int)a3;
- (NSString)label;
- (__IOSurface)ioSurface;
- (id)device;
- (unsigned)createMachPort;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTLSharedTextureHandle

- (MTLSharedTextureHandle)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTLSharedTextureHandle;
  id v4 = [(MTLSharedTextureHandle *)&v7 init];
  if (v4)
  {
    *((void *)v4 + 1) = malloc_type_calloc(0x18uLL, 1uLL, 0xA210A1FAuLL);
    **((void **)v4 + 1) = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"ioSurface"];
    CFRetain(**((CFTypeRef **)v4 + 1));
    id v5 = _copyIOSurfaceDevice(**((__IOSurface ***)v4 + 1));
    *(void *)(*((void *)v4 + 1) + 8) = v5;
    if (v5)
    {
      *(void *)(*((void *)v4 + 1) + 16) = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    }
    else
    {

      return 0;
    }
  }
  return (MTLSharedTextureHandle *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTLSharedTextureHandle)initWithIOSurface:(__IOSurface *)a3 label:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MTLSharedTextureHandle;
  v6 = [(MTLSharedTextureHandle *)&v9 init];
  if (v6)
  {
    v6->_priv = (MTLSharedTextureHandlePrivate *)malloc_type_calloc(0x18uLL, 1uLL, 0xDCE91AuLL);
    CFRetain(a3);
    *(void *)v6->_priv = a3;
    *((void *)v6->_priv + 2) = [a4 copy];
    id v7 = _copyIOSurfaceDevice(a3);
    *((void *)v6->_priv + 1) = v7;
    if (!v7)
    {

      return 0;
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:*(void *)self->_priv forKey:@"ioSurface"];
  uint64_t v5 = *((void *)self->_priv + 2);

  [a3 encodeObject:v5 forKey:@"label"];
}

- (MTLSharedTextureHandle)initWithMachPort:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTLSharedTextureHandle;
  id v4 = [(MTLSharedTextureHandle *)&v7 init];
  if (v4)
  {
    *((void *)v4 + 1) = malloc_type_calloc(0x18uLL, 1uLL, 0xCAF127BCuLL);
    **((void **)v4 + 1) = IOSurfaceLookupFromMachPort(a3);
    id v5 = _copyIOSurfaceDevice(**((__IOSurface ***)v4 + 1));
    *(void *)(*((void *)v4 + 1) + 8) = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return (MTLSharedTextureHandle *)v4;
}

- (__IOSurface)ioSurface
{
  return *(__IOSurface **)self->_priv;
}

- (unsigned)createMachPort
{
  return IOSurfaceCreateMachPort(*(IOSurfaceRef *)self->_priv);
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {

    id v4 = (CFTypeRef *)self->_priv;
    if (*v4)
    {
      CFRelease(*v4);
      id v4 = (CFTypeRef *)self->_priv;
    }
    free(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLSharedTextureHandle;
  [(MTLSharedTextureHandle *)&v5 dealloc];
}

- (NSString)label
{
  return (NSString *)*((void *)self->_priv + 2);
}

- (id)device
{
  return (id)*((void *)self->_priv + 1);
}

@end