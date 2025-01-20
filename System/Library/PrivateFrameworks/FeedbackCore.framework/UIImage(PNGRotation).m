@interface UIImage(PNGRotation)
- (id)correctlyRotatedPNGData;
- (id)rightSideUpImage;
@end

@implementation UIImage(PNGRotation)

- (id)correctlyRotatedPNGData
{
  v1 = [a1 rightSideUpImage];
  v2 = UIImagePNGRepresentation(v1);

  return v2;
}

- (id)rightSideUpImage
{
  if ([a1 imageOrientation])
  {
    [a1 size];
    UIGraphicsBeginImageContext(v8);
    [a1 size];
    double v3 = v2;
    [a1 size];
    objc_msgSend(a1, "drawInRect:", 0.0, 0.0, v3, v4);
    UIGraphicsGetImageFromCurrentImageContext();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    id v5 = a1;
  }

  return v5;
}

@end