@interface UIImage(HFAdditions)
+ (id)hf_fetchImageFromURL:()HFAdditions;
+ (id)hf_safetyAndSecurityImage;
- (double)hf_sizeInScreenScale;
- (id)imageWithNormalizedOrientation;
@end

@implementation UIImage(HFAdditions)

- (double)hf_sizeInScreenScale
{
  [a1 size];
  double v3 = v2;
  [a1 scale];
  double v5 = v3 * v4;
  v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];
  double v8 = v5 / v7;
  [a1 size];
  [a1 scale];
  v9 = [MEMORY[0x263F1C920] mainScreen];
  [v9 scale];

  return v8;
}

- (id)imageWithNormalizedOrientation
{
  id v1 = a1;
  if ([v1 imageOrientation])
  {
    [v1 size];
    CGFloat v3 = v2;
    CGFloat v5 = v4;
    [v1 scale];
    CGFloat v7 = v6;
    v14.width = v3;
    v14.height = v5;
    UIGraphicsBeginImageContextWithOptions(v14, 0, v7);
    [v1 size];
    double v9 = v8;
    [v1 size];
    objc_msgSend(v1, "drawInRect:", 0.0, 0.0, v9, v10);
    uint64_t v11 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    id v1 = (id)v11;
  }
  return v1;
}

+ (id)hf_fetchImageFromURL:()HFAdditions
{
  id v3 = a3;
  double v4 = (void *)MEMORY[0x263F58190];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__UIImage_HFAdditions__hf_fetchImageFromURL___block_invoke;
  v12[3] = &unk_26408E4E0;
  id v13 = v3;
  CGFloat v5 = (void *)MEMORY[0x263F581B8];
  id v6 = v3;
  CGFloat v7 = [v5 globalAsyncScheduler];
  double v8 = [v4 futureWithBlock:v12 scheduler:v7];
  double v9 = [MEMORY[0x263F581B8] mainThreadScheduler];
  double v10 = [v8 reschedule:v9];

  return v10;
}

+ (id)hf_safetyAndSecurityImage
{
  v0 = [MEMORY[0x263F1C6C8] configurationPreferringMulticolor];
  id v1 = (void *)MEMORY[0x263F1C6C8];
  double v2 = objc_msgSend(MEMORY[0x263F1C550], "hf_keyColor");
  id v3 = [v1 configurationWithHierarchicalColor:v2];

  double v4 = [v0 configurationByApplyingConfiguration:v3];
  CGFloat v5 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"house.badge.shield.half.filled.fill"];
  id v6 = [v5 imageWithConfiguration:v4];

  return v6;
}

@end