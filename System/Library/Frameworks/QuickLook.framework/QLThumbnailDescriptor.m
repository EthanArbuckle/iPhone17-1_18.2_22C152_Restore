@interface QLThumbnailDescriptor
+ (id)descriptorWithSize:(CGSize)a3 scaleFactor:(double)a4;
- (CGSize)size;
- (double)scaleFactor;
- (void)setScaleFactor:(double)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation QLThumbnailDescriptor

+ (id)descriptorWithSize:(CGSize)a3 scaleFactor:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = objc_alloc_init((Class)a1);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setSize:", width, height);
    [v8 setScaleFactor:a4];
  }

  return v8;
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

@end