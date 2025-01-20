@interface CSMagSafeSilhouetteConfiguration
- (CGSize)size;
- (CSMagSafeSilhouetteConfiguration)initWithSize:(CGSize)a3 bottomOffset:(double)a4 cornerRadius:(double)a5;
- (CSMagSafeSilhouetteConfiguration)initWithSize:(CGSize)a3 bottomOffset:(double)a4 cornerRadius:(double)a5 roundedCorners:(unint64_t)a6;
- (double)bottomOffset;
- (double)cornerRadius;
- (unint64_t)roundedCorners;
- (unint64_t)roundedCornersMaskForOrientation:(int64_t)a3;
- (void)setBottomOffset:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setRoundedCorners:(unint64_t)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation CSMagSafeSilhouetteConfiguration

- (CSMagSafeSilhouetteConfiguration)initWithSize:(CGSize)a3 bottomOffset:(double)a4 cornerRadius:(double)a5
{
  return -[CSMagSafeSilhouetteConfiguration initWithSize:bottomOffset:cornerRadius:roundedCorners:](self, "initWithSize:bottomOffset:cornerRadius:roundedCorners:", -1, a3.width, a3.height, a4, a5);
}

- (CSMagSafeSilhouetteConfiguration)initWithSize:(CGSize)a3 bottomOffset:(double)a4 cornerRadius:(double)a5 roundedCorners:(unint64_t)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)CSMagSafeSilhouetteConfiguration;
  result = [(CSMagSafeSilhouetteConfiguration *)&v12 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_bottomOffset = a4;
    result->_cornerRadius = a5;
    result->_roundedCorners = a6;
  }
  return result;
}

- (unint64_t)roundedCornersMaskForOrientation:(int64_t)a3
{
  unint64_t v3 = 3;
  uint64_t v4 = 10;
  if (a3 == 3) {
    uint64_t v4 = 5;
  }
  if ((unint64_t)a3 >= 3) {
    unint64_t v3 = v4;
  }
  if (a3) {
    return v3;
  }
  else {
    return 15;
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

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)bottomOffset
{
  return self->_bottomOffset;
}

- (void)setBottomOffset:(double)a3
{
  self->_bottomOffset = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (void)setRoundedCorners:(unint64_t)a3
{
  self->_roundedCorners = a3;
}

@end