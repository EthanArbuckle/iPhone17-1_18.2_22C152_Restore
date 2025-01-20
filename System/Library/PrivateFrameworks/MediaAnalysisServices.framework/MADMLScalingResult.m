@interface MADMLScalingResult
+ (BOOL)supportsSecureCoding;
- (CGImage)image;
- (MADMLScalingResult)initWithCoder:(id)a3;
- (MADMLScalingResult)initWithSurface:(id)a3;
- (__CVBuffer)pixelBuffer;
- (id).cxx_construct;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)image;
@end

@implementation MADMLScalingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMLScalingResult)initWithSurface:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADMLScalingResult;
  v6 = [(MADResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_surface, a3);
  }

  return v7;
}

- (MADMLScalingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADMLScalingResult;
  id v5 = [(MADResult *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Surface"];
    surface = v5->_surface;
    v5->_surface = (IOSurface *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADMLScalingResult;
  [(MADResult *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_surface forKey:@"Surface"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"surface: %@>", self->_surface];
  return v3;
}

- (__CVBuffer)pixelBuffer
{
  p_pixelBuffer = &self->_pixelBuffer;
  result = self->_pixelBuffer.value_;
  if (!result)
  {
    CVReturn v5 = CVPixelBufferCreateWithIOSurface(0, (IOSurfaceRef)self->_surface, 0, &p_pixelBuffer->value_);
    result = p_pixelBuffer->value_;
    if (!p_pixelBuffer->value_)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADRemoveBackgroundMatteResult pixelBuffer](v5);
      }
      return p_pixelBuffer->value_;
    }
  }
  return result;
}

- (CGImage)image
{
  p_image = &self->_image;
  result = self->_image.value_;
  if (!result)
  {
    if ([(IOSurface *)self->_surface pixelFormat] == 1111970369)
    {
      *(void *)&callbacks.version = CGColorSpaceCreateDeviceRGB();
      [(IOSurface *)self->_surface width];
      [(IOSurface *)self->_surface height];
      v31 = (CGDataProvider *)CGIOSurfaceContextCreate();
      CGColorSpaceRef space = (CGColorSpaceRef)CGIOSurfaceContextCreateImageReference();
      CF<CGImage *>::operator=((const void **)&p_image->value_, (const void **)&space);
      CF<CGColorSpace *>::~CF((const void **)&space);
      CF<CGColorSpace *>::~CF((const void **)&v31);
      CF<CGColorSpace *>::~CF((const void **)&callbacks);
    }
    else if ([(IOSurface *)self->_surface pixelFormat] == 1278226534 {
           || [(IOSurface *)self->_surface pixelFormat] == 1278226488)
    }
    {
      OSType v5 = [(IOSurface *)self->_surface pixelFormat];
      if (v5 == 1278226488) {
        size_t v6 = 8;
      }
      else {
        size_t v6 = 32;
      }
      if (v5 == 1278226488) {
        CGBitmapInfo v7 = 0;
      }
      else {
        CGBitmapInfo v7 = 8448;
      }
      CGDataProviderDirectCallbacks callbacks = *(CGDataProviderDirectCallbacks *)byte_1F381E828;
      surface = self->_surface;
      v31 = CGDataProviderCreateDirect(surface, [(IOSurface *)surface height] * [(IOSurface *)surface bytesPerRow], &callbacks);
      if (v31)
      {
        CFRetain(surface);
        CGColorSpaceRef space = CGColorSpaceCreateDeviceGray();
        size_t v9 = [(IOSurface *)self->_surface width];
        size_t v10 = [(IOSurface *)self->_surface height];
        size_t v11 = [(IOSurface *)self->_surface bytesPerRow];
        CGImageRef v28 = CGImageCreate(v9, v10, v6, v6, v11, space, v7, v31, 0, 1, kCGRenderingIntentDefault);
        CF<CGImage *>::operator=((const void **)&p_image->value_, (const void **)&v28);
        CF<CGColorSpace *>::~CF((const void **)&v28);
        CF<CGColorSpace *>::~CF((const void **)&space);
      }
      else
      {
        BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v12) {
          [(MADMLScalingResult *)v12 image];
        }
      }
      CF<CGColorSpace *>::~CF((const void **)&v31);
    }
    result = p_image->value_;
    if (!p_image->value_)
    {
      BOOL v20 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v20) {
        [(MADMLScalingResult *)v20 image];
      }
      return p_image->value_;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  CF<CGColorSpace *>::~CF((const void **)&self->_image.value_);
  CF<CGColorSpace *>::~CF((const void **)&self->_pixelBuffer.value_);
  objc_storeStrong((id *)&self->_surface, 0);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (void)image
{
}

@end