@interface CAFlipBookFrame
- (BOOL)isInverted;
- (CGRect)rawSurfaceFrame;
- (__IOSurface)rawSurface;
- (__IOSurface)surface;
- (float)apl;
- (float)aplDimming;
- (id)_initWithPresentationTime:(unint64_t)a3 frameId:(unint64_t)a4 generation:(unsigned int)a5 apl:(float)a6 aplDimming:(float)a7 memoryUsage:(unint64_t)a8 inverted:(BOOL)a9 userInfo:(id)a10;
- (id)description;
- (id)userInfo;
- (unint64_t)frameId;
- (unint64_t)memoryUsage;
- (unint64_t)presentationTime;
- (unsigned)generation;
- (void)dealloc;
- (void)releaseSurface;
- (void)setRawSurface:(__IOSurface *)a3;
- (void)setRawSurfaceFrame:(CGRect)a3;
- (void)setSurface:(__IOSurface *)a3;
@end

@implementation CAFlipBookFrame

- (id)description
{
  return (id)[NSString stringWithFormat:@"<CAFlipBookFrame: time %llu, id %llu, generation %u, userInfo %p>", self->_presentationTime, self->_frameId, self->_generation, self->_userInfo];
}

- (BOOL)isInverted
{
  return self->_inverted;
}

- (void)releaseSurface
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (__IOSurface)surface
{
  return self->_surface;
}

- (void)setSurface:(__IOSurface *)a3
{
  surface = self->_surface;
  if (surface != a3)
  {
    if (surface) {
      CFRelease(surface);
    }
    self->_surface = 0;
    if (a3) {
      self->_surface = (__IOSurface *)CFRetain(a3);
    }
  }
}

- (CGRect)rawSurfaceFrame
{
  double x = self->_rawSurfaceFrame.origin.x;
  double y = self->_rawSurfaceFrame.origin.y;
  double width = self->_rawSurfaceFrame.size.width;
  double height = self->_rawSurfaceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRawSurfaceFrame:(CGRect)a3
{
  self->_rawSurfaceFrame = a3;
}

- (__IOSurface)rawSurface
{
  return self->_rawSurface;
}

- (void)setRawSurface:(__IOSurface *)a3
{
  rawSurface = self->_rawSurface;
  if (rawSurface != a3)
  {
    if (rawSurface) {
      CFRelease(rawSurface);
    }
    self->_rawSurface = 0;
    if (a3) {
      self->_rawSurface = (__IOSurface *)CFRetain(a3);
    }
  }
}

- (unint64_t)memoryUsage
{
  return self->_memoryUsage;
}

- (float)aplDimming
{
  return self->_aplDimming;
}

- (float)apl
{
  return self->_apl;
}

- (unsigned)generation
{
  return self->_generation;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (unint64_t)presentationTime
{
  return self->_presentationTime;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  rawSurface = self->_rawSurface;
  if (rawSurface)
  {
    CFRelease(rawSurface);
    self->_rawSurface = 0;
  }
  surface = self->_surface;
  if (surface)
  {
    CFRelease(surface);
    self->_surface = 0;
  }

  self->_userInfo = 0;
  v5.receiver = self;
  v5.super_class = (Class)CAFlipBookFrame;
  [(CAFlipBookFrame *)&v5 dealloc];
}

- (id)_initWithPresentationTime:(unint64_t)a3 frameId:(unint64_t)a4 generation:(unsigned int)a5 apl:(float)a6 aplDimming:(float)a7 memoryUsage:(unint64_t)a8 inverted:(BOOL)a9 userInfo:(id)a10
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)CAFlipBookFrame;
  v18 = [(CAFlipBookFrame *)&v22 init];
  v19 = v18;
  if (v18)
  {
    *((void *)v18 + 1) = a3;
    *((void *)v18 + 2) = a4;
    *((_DWORD *)v18 + 6) = a5;
    *((float *)v18 + 7) = a6;
    *((float *)v18 + 8) = a7;
    *((void *)v18 + 5) = a8;
    *((void *)v18 + 6) = 0;
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v18 + 56) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v18 + 72) = v20;
    *((void *)v18 + 11) = 0;
    v18[104] = a9;
    *((void *)v18 + 12) = a10;
  }
  return v19;
}

@end