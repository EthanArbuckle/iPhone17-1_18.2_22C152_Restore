@interface FigIOSurfaceData
+ (id)dataWithIOSurface:(__IOSurface *)a3;
+ (id)dataWithIOSurface:(__IOSurface *)a3 length:(unint64_t)a4;
+ (void)initialize;
- (FigIOSurfaceData)initWithIOSurface:(__IOSurface *)a3;
- (FigIOSurfaceData)initWithIOSurface:(__IOSurface *)a3 length:(unint64_t)a4;
- (const)bytes;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation FigIOSurfaceData

+ (void)initialize
{
}

+ (id)dataWithIOSurface:(__IOSurface *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithIOSurface:a3];
  return v3;
}

+ (id)dataWithIOSurface:(__IOSurface *)a3 length:(unint64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithIOSurface:a3 length:a4];
  return v4;
}

- (FigIOSurfaceData)initWithIOSurface:(__IOSurface *)a3
{
  return [(FigIOSurfaceData *)self initWithIOSurface:a3 length:0];
}

- (FigIOSurfaceData)initWithIOSurface:(__IOSurface *)a3 length:(unint64_t)a4
{
  if (a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)FigIOSurfaceData;
    v6 = [(FigIOSurfaceData *)&v12 init];
    if (v6)
    {
      v7 = (__IOSurface *)CFRetain(a3);
      v6->_surface = v7;
      size_t AllocSize = IOSurfaceGetAllocSize(v7);
      if (AllocSize <= a4 || a4 == 0) {
        unint64_t v10 = AllocSize;
      }
      else {
        unint64_t v10 = a4;
      }
      v6->_length = v10;
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  result = self->_bytes;
  if (!result)
  {
    IOSurfaceLock(self->_surface, 1u, 0);
    result = IOSurfaceGetBaseAddress(self->_surface);
    self->_bytes = result;
  }
  return result;
}

- (void)dealloc
{
  surface = self->_surface;
  if (surface)
  {
    if (self->_bytes)
    {
      IOSurfaceUnlock(surface, 1u, 0);
      self->_bytes = 0;
      surface = self->_surface;
    }
    CFRelease(surface);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigIOSurfaceData;
  [(FigIOSurfaceData *)&v4 dealloc];
}

@end