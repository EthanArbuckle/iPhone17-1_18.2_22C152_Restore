@interface PixelBufferPoolKey
- (BOOL)isEqual:(id)a3;
- (CGSize)frameSize;
- (PixelBufferPoolKey)initWithSize:(CGSize)a3 pixelFormatType:(unsigned int)a4;
- (unint64_t)hash;
- (unsigned)pixelFormatType;
@end

@implementation PixelBufferPoolKey

- (unsigned)pixelFormatType
{
  return self->_pixelFormatType;
}

- (CGSize)frameSize
{
  double width = self->_frameSize.width;
  double height = self->_frameSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)hash
{
  [(PixelBufferPoolKey *)self frameSize];
  return (unint64_t)v3 ^ (unint64_t)v4 ^ [(PixelBufferPoolKey *)self pixelFormatType];
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PixelBufferPoolKey *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(PixelBufferPoolKey *)self frameSize];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      [(PixelBufferPoolKey *)v5 frameSize];
      v16.double width = v10;
      v16.double height = v11;
      v15.double width = v7;
      v15.double height = v9;
      if (NSEqualSizes(v15, v16))
      {
        unsigned int v12 = [(PixelBufferPoolKey *)self pixelFormatType];
        BOOL v13 = v12 == [(PixelBufferPoolKey *)v5 pixelFormatType];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (PixelBufferPoolKey)initWithSize:(CGSize)a3 pixelFormatType:(unsigned int)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)PixelBufferPoolKey;
  CGSize result = [(PixelBufferPoolKey *)&v8 init];
  if (result)
  {
    result->_frameSize.CGFloat width = width;
    result->_frameSize.CGFloat height = height;
    result->_pixelFormatType = a4;
  }
  return result;
}

@end