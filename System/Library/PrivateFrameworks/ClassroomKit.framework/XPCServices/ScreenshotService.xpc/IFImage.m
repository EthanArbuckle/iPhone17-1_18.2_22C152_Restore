@interface IFImage
+ (id)css_imageWithWebClip:(id)a3;
- (NSData)css_PNGRepresentation;
@end

@implementation IFImage

+ (id)css_imageWithWebClip:(id)a3
{
  id v4 = [a3 iconImage];
  id v5 = [v4 CGImage];
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_alloc((Class)a1);
    [v4 scale];
    id v8 = objc_msgSend(v7, "initWithCGImage:scale:", v6);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSData)css_PNGRepresentation
{
  id v3 = [(IFImage *)self CGImage];
  if (v3)
  {
    [(IFImage *)self scale];
    +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v3, 0);
    id v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v4);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSData *)v3;
}

@end