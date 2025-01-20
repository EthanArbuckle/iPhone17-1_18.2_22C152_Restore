@interface CAGradientLayer(ClipServicesUIExtras)
+ (id)cps_grayscaleConicGradientLayer;
@end

@implementation CAGradientLayer(ClipServicesUIExtras)

+ (id)cps_grayscaleConicGradientLayer
{
  v5[2] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F39BD0]);
  objc_msgSend(v0, "setStartPoint:", 0.5, 0.5);
  objc_msgSend(v0, "setEndPoint:", 0.0, 0.5);
  [v0 setType:*MEMORY[0x1E4F3A398]];
  id v1 = [MEMORY[0x1E4F428B8] whiteColor];
  v5[0] = [v1 CGColor];
  id v2 = [MEMORY[0x1E4F428B8] blackColor];
  v5[1] = [v2 CGColor];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  [v0 setColors:v3];

  return v0;
}

@end