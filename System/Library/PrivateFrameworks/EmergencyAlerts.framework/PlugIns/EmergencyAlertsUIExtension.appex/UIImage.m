@interface UIImage
- (UIImage)imageWithSize:(CGSize)a3;
@end

@implementation UIImage

- (UIImage)imageWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v6 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", a3.width, a3.height);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100001FC8;
  v10[3] = &unk_100008280;
  v10[4] = self;
  *(CGFloat *)&v10[5] = width;
  *(CGFloat *)&v10[6] = height;
  v7 = [v6 imageWithActions:v10];
  v8 = objc_msgSend(v7, "imageWithRenderingMode:", -[UIImage renderingMode](self, "renderingMode"));

  return (UIImage *)v8;
}

@end