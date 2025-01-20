@interface UIView(BannerKitAdditions)
- (double)bn_convertRectFromSceneReferenceSpace:()BannerKitAdditions;
- (double)bn_convertRectToSceneReferenceSpace:()BannerKitAdditions;
@end

@implementation UIView(BannerKitAdditions)

- (double)bn_convertRectToSceneReferenceSpace:()BannerKitAdditions
{
  v10 = [a1 window];
  objc_msgSend(a1, "convertRect:toView:", 0, a2, a3, a4, a5);
  objc_msgSend(v10, "_convertRectToSceneReferenceSpace:");
  double v12 = v11;

  return v12;
}

- (double)bn_convertRectFromSceneReferenceSpace:()BannerKitAdditions
{
  v10 = [a1 window];
  objc_msgSend(v10, "_convertRectFromSceneReferenceSpace:", a2, a3, a4, a5);
  objc_msgSend(a1, "convertRect:fromView:", 0);
  double v12 = v11;

  return v12;
}

@end