@interface MTLFXSpatialScalerDescriptor
+ (BOOL)supportsDevice:(id)device;
+ (unint64_t)colorTextureUsage;
+ (unint64_t)outputTextureUsage;
- (MTLFXSpatialScalerColorProcessingMode)colorProcessingMode;
- (MTLPixelFormat)colorTextureFormat;
- (MTLPixelFormat)outputTextureFormat;
- (NSUInteger)inputHeight;
- (NSUInteger)inputWidth;
- (NSUInteger)outputHeight;
- (NSUInteger)outputWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newSpatialScalerWithDevice:(id)device;
- (unint64_t)version;
- (void)setColorProcessingMode:(MTLFXSpatialScalerColorProcessingMode)colorProcessingMode;
- (void)setColorTextureFormat:(MTLPixelFormat)colorTextureFormat;
- (void)setInputHeight:(NSUInteger)inputHeight;
- (void)setInputWidth:(NSUInteger)inputWidth;
- (void)setOutputHeight:(NSUInteger)outputHeight;
- (void)setOutputTextureFormat:(MTLPixelFormat)outputTextureFormat;
- (void)setOutputWidth:(NSUInteger)outputWidth;
- (void)setVersion:(unint64_t)a3;
@end

@implementation MTLFXSpatialScalerDescriptor

+ (unint64_t)colorTextureUsage
{
  return 1;
}

+ (unint64_t)outputTextureUsage
{
  return 5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setVersion:", -[MTLFXSpatialScalerDescriptor version](self, "version"));
  objc_msgSend(v4, "setColorTextureFormat:", -[MTLFXSpatialScalerDescriptor colorTextureFormat](self, "colorTextureFormat"));
  objc_msgSend(v4, "setOutputTextureFormat:", -[MTLFXSpatialScalerDescriptor outputTextureFormat](self, "outputTextureFormat"));
  objc_msgSend(v4, "setInputWidth:", -[MTLFXSpatialScalerDescriptor inputWidth](self, "inputWidth"));
  objc_msgSend(v4, "setInputHeight:", -[MTLFXSpatialScalerDescriptor inputHeight](self, "inputHeight"));
  objc_msgSend(v4, "setOutputWidth:", -[MTLFXSpatialScalerDescriptor outputWidth](self, "outputWidth"));
  objc_msgSend(v4, "setOutputHeight:", -[MTLFXSpatialScalerDescriptor outputHeight](self, "outputHeight"));
  objc_msgSend(v4, "setColorProcessingMode:", -[MTLFXSpatialScalerDescriptor colorProcessingMode](self, "colorProcessingMode"));
  return v4;
}

- (id)newSpatialScalerWithDevice:(id)device
{
  id v4 = device;
  if (+[MTLFXSpatialScalerDescriptor supportsDevice:v4])
  {
    [(MTLFXSpatialScalerDescriptor *)self version];
    v5 = [[_MFXSpatialScalingEffectEFFECT_NAME_V1 alloc] initWithDevice:v4 descriptor:self];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsDevice:(id)device
{
  return 1;
}

- (MTLPixelFormat)outputTextureFormat
{
  return self->outputTextureFormat;
}

- (void)setOutputTextureFormat:(MTLPixelFormat)outputTextureFormat
{
  self->outputTextureFormat = outputTextureFormat;
}

- (NSUInteger)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(NSUInteger)inputWidth
{
  self->inputWidth = inputWidth;
}

- (NSUInteger)inputHeight
{
  return self->inputHeight;
}

- (void)setInputHeight:(NSUInteger)inputHeight
{
  self->inputHeight = inputHeight;
}

- (NSUInteger)outputWidth
{
  return self->outputWidth;
}

- (void)setOutputWidth:(NSUInteger)outputWidth
{
  self->outputWidth = outputWidth;
}

- (NSUInteger)outputHeight
{
  return self->outputHeight;
}

- (void)setOutputHeight:(NSUInteger)outputHeight
{
  self->outputHeight = outputHeight;
}

- (unint64_t)version
{
  return self->version;
}

- (void)setVersion:(unint64_t)a3
{
  self->version = a3;
}

- (MTLFXSpatialScalerColorProcessingMode)colorProcessingMode
{
  return self->colorProcessingMode;
}

- (void)setColorProcessingMode:(MTLFXSpatialScalerColorProcessingMode)colorProcessingMode
{
  self->colorProcessingMode = colorProcessingMode;
}

- (MTLPixelFormat)colorTextureFormat
{
  return self->_colorTextureFormat;
}

- (void)setColorTextureFormat:(MTLPixelFormat)colorTextureFormat
{
  self->_colorTextureFormat = colorTextureFormat;
}

@end