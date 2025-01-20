@interface MTKOffscreenDrawable
- (CAMetalLayer)layer;
- (CGSize)size;
- (MTKOffscreenDrawable)initWithDevice:(id)a3 pixelFormat:(unint64_t)a4 size:(CGSize)a5 drawableID:(unint64_t)a6;
- (MTLDevice)device;
- (MTLTexture)texture;
- (double)presentedTime;
- (unint64_t)drawableID;
- (unint64_t)pixelFormat;
- (void)addPresentedHandler:(id)a3;
- (void)present;
- (void)presentAfterMinimumDuration:(double)a3;
- (void)presentAtTime:(double)a3;
- (void)setDevice:(id)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation MTKOffscreenDrawable

- (MTKOffscreenDrawable)initWithDevice:(id)a3 pixelFormat:(unint64_t)a4 size:(CGSize)a5 drawableID:(unint64_t)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTKOffscreenDrawable;
  v13 = [(MTKOffscreenDrawable *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_textureDirty = 1;
    v13->_size.CGFloat width = width;
    v13->_size.CGFloat height = height;
    v13->_pixelFormat = a4;
    objc_storeStrong((id *)&v13->_device, a3);
    v14->_drawableID = a6;
  }

  return v14;
}

- (void)present
{
  self->_presentedTime = CACurrentMediaTime() + 0.0166666667;
}

- (void)presentAfterMinimumDuration:(double)a3
{
  self->_presentedTime = CACurrentMediaTime() + a3;
}

- (void)presentAtTime:(double)a3
{
  self->_presentedTime = a3;
}

- (MTLTexture)texture
{
  if (self->_textureDirty)
  {
    v3 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:self->_pixelFormat width:(unint64_t)self->_size.width height:(unint64_t)self->_size.height mipmapped:0];
    [v3 setUsage:5];
    [v3 setStorageMode:2];
    if (self->_size.width != 0.0 && self->_size.height != 0.0 && self->_pixelFormat)
    {
      v4 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v3];
      texture = self->_texture;
      self->_texture = v4;

      self->_textureDirty = 0;
    }
  }
  v6 = self->_texture;

  return v6;
}

- (void)setPixelFormat:(unint64_t)a3
{
  if (self->_pixelFormat != a3)
  {
    self->_pixelFormat = a3;
    self->_textureDirty = 1;
  }
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setDevice:(id)a3
{
  v5 = (MTLDevice *)a3;
  p_device = &self->_device;
  if (self->_device != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_device, a3);
    v5 = v7;
    self->_textureDirty = 1;
  }

  MEMORY[0x270F9A758](p_device, v5);
}

- (void)setSize:(CGSize)a3
{
  if (self->_size.width != a3.width || self->_size.height != a3.height)
  {
    self->_size = a3;
    self->_textureDirty = 1;
  }
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)addPresentedHandler:(id)a3
{
}

- (CAMetalLayer)layer
{
  return (CAMetalLayer *)objc_getProperty(self, a2, 48, 1);
}

- (double)presentedTime
{
  return self->_presentedTime;
}

- (unint64_t)drawableID
{
  return self->_drawableID;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_layer, 0);

  objc_storeStrong((id *)&self->_texture, 0);
}

@end