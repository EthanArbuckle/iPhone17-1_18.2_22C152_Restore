@interface ADImageSupportedSize
+ (id)createWithSize:(CGSize)a3 andLayout:(unint64_t)a4;
- (CGSize)size;
- (unint64_t)layout;
@end

@implementation ADImageSupportedSize

+ (id)createWithSize:(CGSize)a3 andLayout:(unint64_t)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v7 = (CGFloat *)objc_opt_new();
  v7[2] = width;
  v7[3] = height;
  *((void *)v7 + 1) = a4;

  return v7;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)layout
{
  return self->_layout;
}

@end