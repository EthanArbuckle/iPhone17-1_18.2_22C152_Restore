@interface BWTrackedSurface
- (BOOL)owningPixelBufferDeallocated;
- (BWTrackedSurface)initWithSurface:(__IOSurface *)a3 handler:(id)a4;
- (__IOSurface)surface;
- (id)handler;
- (int)clientUseCount;
- (void)dealloc;
- (void)setClientUseCount:(int)a3;
- (void)setOwningPixelBufferDeallocated:(BOOL)a3;
@end

@implementation BWTrackedSurface

- (BWTrackedSurface)initWithSurface:(__IOSurface *)a3 handler:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWTrackedSurface;
  v6 = [(BWTrackedSurface *)&v8 init];
  if (v6)
  {
    v6->_surface = (__IOSurface *)CFRetain(a3);
    v6->_handler = (id)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  surface = self->_surface;
  if (surface) {
    CFRelease(surface);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWTrackedSurface;
  [(BWTrackedSurface *)&v4 dealloc];
}

- (__IOSurface)surface
{
  return self->_surface;
}

- (id)handler
{
  return self->_handler;
}

- (int)clientUseCount
{
  return self->_clientUseCount;
}

- (void)setClientUseCount:(int)a3
{
  self->_clientUseCount = a3;
}

- (BOOL)owningPixelBufferDeallocated
{
  return self->_owningPixelBufferDeallocated;
}

- (void)setOwningPixelBufferDeallocated:(BOOL)a3
{
  self->_owningPixelBufferDeallocated = a3;
}

@end