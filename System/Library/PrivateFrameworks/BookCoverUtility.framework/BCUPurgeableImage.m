@interface BCUPurgeableImage
- (BCUPurgeableImage)initWithImage:(CGImage *)a3 surface:(__IOSurface *)a4 contentsScale:(double)a5;
- (BOOL)markAsNonVolatile;
- (BOOL)markAsVolatile;
- (CGImage)CGImage;
- (CGSize)size;
- (double)contentsScale;
- (id)layerContents;
- (void)dealloc;
@end

@implementation BCUPurgeableImage

- (BCUPurgeableImage)initWithImage:(CGImage *)a3 surface:(__IOSurface *)a4 contentsScale:(double)a5
{
  v12.receiver = self;
  v12.super_class = (Class)BCUPurgeableImage;
  v8 = [(BCUPurgeableImage *)&v12 init];
  v9 = v8;
  if (v8)
  {
    double v10 = 1.0;
    if (a5 != 0.0) {
      double v10 = a5;
    }
    v8->_contentsScale = v10;
    v8->_image = CGImageRetain(a3);
    v9->_surface = a4;
    if (a4) {
      CFRetain(a4);
    }
  }
  return v9;
}

- (void)dealloc
{
  surface = self->_surface;
  if (surface) {
    CFRelease(surface);
  }
  CGImageRelease(self->_image);
  v4.receiver = self;
  v4.super_class = (Class)BCUPurgeableImage;
  [(BCUPurgeableImage *)&v4 dealloc];
}

- (CGSize)size
{
  image = self->_image;
  if (image)
  {
    double v4 = (double)CGImageGetWidth(image) / self->_contentsScale;
    double v5 = (double)CGImageGetHeight(self->_image) / self->_contentsScale;
  }
  else
  {
    double v4 = *MEMORY[0x263F001B0];
    double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (id)layerContents
{
  return self->_image;
}

- (CGImage)CGImage
{
  CGSize result = self->_image;
  if (result)
  {
    CGImageRef v3 = CGImageRetain(result);
    return (CGImage *)CFAutorelease(v3);
  }
  return result;
}

- (BOOL)markAsVolatile
{
  surface = self->_surface;
  if (surface) {
    IOSurfaceSetPurgeable(self->_surface, 1u, 0);
  }
  return surface != 0;
}

- (BOOL)markAsNonVolatile
{
  surface = self->_surface;
  if (!surface) {
    return 1;
  }
  uint32_t oldState = 0;
  IOSurfaceSetPurgeable(surface, 0, &oldState);
  return oldState != 2;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

@end