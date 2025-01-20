@interface LAUIMetalRenderLoop
- (BOOL)_isForcingPause;
- (BOOL)framebufferOnly;
- (BOOL)isDrawableAvailable;
- (CALayer)layer;
- (CGColorSpace)colorSpace;
- (CGSize)drawableSize;
- (LAUIMetalRenderLoop)init;
- (LAUIMetalRenderLoop)initWithPixelFormat:(unint64_t)a3 forDevice:(id)a4;
- (MTLDevice)device;
- (id)currentDrawable;
- (unint64_t)pixelFormat;
- (void)_didDraw;
- (void)_didInvalidate;
- (void)_willDraw;
- (void)dealloc;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setDrawableSize:(CGSize)a3;
- (void)setFramebufferOnly:(BOOL)a3;
@end

@implementation LAUIMetalRenderLoop

- (LAUIMetalRenderLoop)init
{
  return 0;
}

- (LAUIMetalRenderLoop)initWithPixelFormat:(unint64_t)a3 forDevice:(id)a4
{
  id v8 = a4;
  if (v8
  {
    v18.receiver = self;
    v18.super_class = (Class)LAUIMetalRenderLoop;
    v10 = [(LAUIRenderLoop *)&v18 init];
    uint64_t v11 = (uint64_t)v10;
    if (v10)
    {
      v10->_pixel_format = a3;
      objc_storeStrong((id *)&v10->_device, a4);
      *(void *)(v11 + 104) = default_color_space;
      id v12 = objc_alloc_init(MEMORY[0x263F15820]);
      v13 = *(void **)(v11 + 72);
      *(void *)(v11 + 72) = v12;

      [*(id *)(v11 + 72) setDevice:*(void *)(v11 + 112)];
      [*(id *)(v11 + 72) setPixelFormat:*(void *)(v11 + 96)];
      [*(id *)(v11 + 72) setColorspace:*(void *)(v11 + 104)];
      [*(id *)(v11 + 72) setLowLatency:0];
      [*(id *)(v11 + 72) drawableSize];
      *(void *)(v11 + 120) = v14;
      *(void *)(v11 + 128) = v15;
      -[LAUIRenderLoop _setNeedsForcingPauseUpdate](v11);
    }
    else
    {
      CFRelease(default_color_space);
    }
    self = (LAUIMetalRenderLoop *)(id)v11;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_color_space);
  v3.receiver = self;
  v3.super_class = (Class)LAUIMetalRenderLoop;
  [(LAUIRenderLoop *)&v3 dealloc];
}

- (BOOL)isDrawableAvailable
{
  if (self->super._invalidated) {
    return 0;
  }
  if (self->_current_drawable) {
    return 1;
  }
  if (!self->super._drawing) {
    return 0;
  }
  return [(CAMetalLayer *)self->_layer isDrawableAvailable];
}

- (id)currentDrawable
{
  if (self->super._invalidated)
  {
    v2 = 0;
  }
  else
  {
    if (self->super._drawing && !self->_current_drawable)
    {
      v4 = [(CAMetalLayer *)self->_layer nextDrawable];
      current_drawable = self->_current_drawable;
      self->_current_drawable = v4;
    }
    v2 = self->_current_drawable;
  }
  return v2;
}

- (CALayer)layer
{
  return (CALayer *)self->_layer;
}

- (BOOL)framebufferOnly
{
  return [(CAMetalLayer *)self->_layer framebufferOnly];
}

- (void)setFramebufferOnly:(BOOL)a3
{
}

- (void)setDrawableSize:(CGSize)a3
{
  p_drawable_size = &self->_drawable_size;
  if (self->_drawable_size.width != a3.width || self->_drawable_size.height != a3.height)
  {
    p_drawable_size->width = a3.width;
    self->_drawable_size.height = a3.height;
    if (a3.width == *MEMORY[0x263F001B0] && a3.height == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      self->_drawable_size_dirty = 0;
      -[CAMetalLayer setDrawableSize:](self->_layer, "setDrawableSize:");
    }
    else
    {
      self->_drawable_size_dirty = 1;
    }
    -[LAUIRenderLoop _setNeedsForcingPauseUpdate]((uint64_t)self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "renderLoop:drawableSizeDidChange:", self, p_drawable_size->width, p_drawable_size->height);
  }
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  if (a3)
  {
    CGColorSpaceRef default_color_space = a3;
    CGColorSpaceRetain(a3);
  }
  else
  {
  }
  CGColorSpaceRelease(self->_color_space);
  self->_color_space = default_color_space;
  layer = self->_layer;
  [(CAMetalLayer *)layer setColorspace:default_color_space];
}

- (void)_didInvalidate
{
  device = self->_device;
  self->_device = 0;

  layer = self->_layer;
  self->_layer = 0;

  current_drawable = self->_current_drawable;
  self->_current_drawable = 0;

  v6.receiver = self;
  v6.super_class = (Class)LAUIMetalRenderLoop;
  [(LAUIRenderLoop *)&v6 _didInvalidate];
}

- (void)_willDraw
{
  v3.receiver = self;
  v3.super_class = (Class)LAUIMetalRenderLoop;
  [(LAUIRenderLoop *)&v3 _willDraw];
  if (self->_drawable_size_dirty)
  {
    self->_drawable_size_dirty = 0;
    -[CAMetalLayer setDrawableSize:](self->_layer, "setDrawableSize:", self->_drawable_size.width, self->_drawable_size.height);
  }
}

- (void)_didDraw
{
  current_drawable = self->_current_drawable;
  self->_current_drawable = 0;

  v4.receiver = self;
  v4.super_class = (Class)LAUIMetalRenderLoop;
  [(LAUIRenderLoop *)&v4 _didDraw];
}

- (BOOL)_isForcingPause
{
  if (self->_drawable_size.width == *MEMORY[0x263F001B0]
    && self->_drawable_size.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)LAUIMetalRenderLoop;
  return [(LAUIRenderLoop *)&v4 _isForcingPause];
}

- (unint64_t)pixelFormat
{
  return self->_pixel_format;
}

- (CGSize)drawableSize
{
  double width = self->_drawable_size.width;
  double height = self->_drawable_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGColorSpace)colorSpace
{
  return self->_color_space;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_current_drawable, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end