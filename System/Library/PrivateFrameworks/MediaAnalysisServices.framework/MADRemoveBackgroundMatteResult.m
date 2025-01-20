@interface MADRemoveBackgroundMatteResult
+ (BOOL)supportsSecureCoding;
- (CGImage)image;
- (CGRect)cropRect;
- (MADRemoveBackgroundMatteResult)initWithCoder:(id)a3;
- (MADRemoveBackgroundMatteResult)initWithSurface:(id)a3 cropRect:(CGRect)a4;
- (__CVBuffer)pixelBuffer;
- (id).cxx_construct;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)image;
- (void)pixelBuffer;
@end

@implementation MADRemoveBackgroundMatteResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADRemoveBackgroundMatteResult)initWithSurface:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADRemoveBackgroundMatteResult;
  v11 = [(MADResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_surface, a3);
    v12->_cropRect.origin.CGFloat x = x;
    v12->_cropRect.origin.CGFloat y = y;
    v12->_cropRect.size.CGFloat width = width;
    v12->_cropRect.size.CGFloat height = height;
  }

  return v12;
}

- (MADRemoveBackgroundMatteResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADRemoveBackgroundMatteResult;
  v5 = [(MADResult *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Surface"];
    surface = v5->_surface;
    v5->_surface = (IOSurface *)v6;

    [v4 decodeRectForKey:@"CropRect"];
    v5->_cropRect.origin.CGFloat x = v8;
    v5->_cropRect.origin.CGFloat y = v9;
    v5->_cropRect.size.CGFloat width = v10;
    v5->_cropRect.size.CGFloat height = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADRemoveBackgroundMatteResult;
  [(MADResult *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_surface forKey:@"Surface"];
  objc_msgSend(v4, "encodeRect:forKey:", @"CropRect", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"surface: %@, ", self->_surface];
  [v3 appendFormat:@"cropRect: %0.2fx%0.2f @ (%0.2f, %0.2f)>", *(void *)&self->_cropRect.size.width, *(void *)&self->_cropRect.size.height, *(void *)&self->_cropRect.origin.x, *(void *)&self->_cropRect.origin.y];
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
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
      [(IOSurface *)self->_surface width];
      [(IOSurface *)self->_surface height];
      uint64_t v6 = CGIOSurfaceContextCreate();
      uint64_t ImageReference = CGIOSurfaceContextCreateImageReference();
      CF<CGImage *>::operator=((const void **)&p_image->value_, (const void **)&ImageReference);
      CF<CGColorSpace *>::~CF((const void **)&ImageReference);
      if (!p_image->value_ && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADRemoveBackgroundMatteResult image]();
      }
      CF<CGColorSpace *>::~CF((const void **)&v6);
      CF<CGColorSpace *>::~CF((const void **)&DeviceRGB);
      return p_image->value_;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADRemoveBackgroundMatteResult image]();
      }
      return 0;
    }
  }
  return result;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
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

- (void)pixelBuffer
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create CVPixelBufferRef from IOSurface (%d)", (uint8_t *)v1, 8u);
}

- (void)image
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected pixel format", v0, 2u);
}

@end