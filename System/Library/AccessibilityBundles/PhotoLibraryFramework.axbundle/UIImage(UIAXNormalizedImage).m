@interface UIImage(UIAXNormalizedImage)
- (id)normalizedImageWithScale:()UIAXNormalizedImage;
@end

@implementation UIImage(UIAXNormalizedImage)

- (id)normalizedImageWithScale:()UIAXNormalizedImage
{
  [a1 size];
  double v4 = a2;
  CGFloat v6 = v5 * a2;
  [a1 size];
  CGFloat v8 = v7 * v4;
  [a1 scale];
  CGFloat v10 = v9;
  v17.width = v6;
  v17.height = v8;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v10);
  [a1 size];
  double v12 = v11 * v4;
  [a1 size];
  objc_msgSend(a1, "drawInRect:", 0.0, 0.0, v12, v13 * v4);
  v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v14;
}

@end