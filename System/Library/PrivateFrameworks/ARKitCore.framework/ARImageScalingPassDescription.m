@interface ARImageScalingPassDescription
- (ARImageScalingPassDescription)initWithSize:(CGSize)a3;
- (CGSize)size;
- (id)description;
- (unsigned)pixelBufferFormat;
- (void)setPixelBufferFormat:(unsigned int)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation ARImageScalingPassDescription

- (ARImageScalingPassDescription)initWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)ARImageScalingPassDescription;
  result = [(ARImageScalingPassDescription *)&v6 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_pixelBufferFormat = 0;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(ARImageScalingPassDescription *)self size];
  uint64_t v6 = v5;
  [(ARImageScalingPassDescription *)self size];
  uint64_t v8 = v7;
  v9 = AROSTypeToString([(ARImageScalingPassDescription *)self pixelBufferFormat]);
  v10 = [v3 stringWithFormat:@"<%@ %p size=[%.1fx%.1f] format=%@", v4, self, v6, v8, v9];

  return v10;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (unsigned)pixelBufferFormat
{
  return self->_pixelBufferFormat;
}

- (void)setPixelBufferFormat:(unsigned int)a3
{
  self->_pixelBufferFormat = a3;
}

@end