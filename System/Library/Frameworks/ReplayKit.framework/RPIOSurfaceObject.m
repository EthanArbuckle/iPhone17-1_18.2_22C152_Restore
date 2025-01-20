@interface RPIOSurfaceObject
+ (BOOL)supportsSecureCoding;
- (RPIOSurfaceObject)initWithCoder:(id)a3;
- (__IOSurface)ioSurface;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setIOSurface:(__IOSurface *)a3;
@end

@implementation RPIOSurfaceObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    ioSurface = self->_ioSurface;
    if (ioSurface)
    {
      xpc_object_t XPCObject = IOSurfaceCreateXPCObject(ioSurface);
      [v6 encodeXPCObject:XPCObject forKey:@"ioSurface"];
    }
  }
}

- (RPIOSurfaceObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPIOSurfaceObject;
  v5 = [(RPIOSurfaceObject *)&v11 init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v4 decodeXPCObjectForKey:@"ioSurface"];
      v7 = v6;
      if (v6)
      {
        IOSurfaceRef v8 = IOSurfaceLookupFromXPCObject(v6);
        [(RPIOSurfaceObject *)v5 setIOSurface:v8];
        CFRelease(v8);
      }
    }
    v9 = v5;
  }

  return v5;
}

- (void)setIOSurface:(__IOSurface *)a3
{
  ioSurface = self->_ioSurface;
  if (ioSurface != a3)
  {
    if (ioSurface) {
      CFRelease(ioSurface);
    }
    self->_ioSurface = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (__IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (void)dealloc
{
  ioSurface = self->_ioSurface;
  if (ioSurface) {
    CFRelease(ioSurface);
  }
  v4.receiver = self;
  v4.super_class = (Class)RPIOSurfaceObject;
  [(RPIOSurfaceObject *)&v4 dealloc];
}

@end