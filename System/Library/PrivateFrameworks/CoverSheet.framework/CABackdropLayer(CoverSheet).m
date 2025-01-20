@interface CABackdropLayer(CoverSheet)
+ (id)backdropLayerWithGaussianBlurRadius:()CoverSheet brightnessAmount:saturationAmount:;
@end

@implementation CABackdropLayer(CoverSheet)

+ (id)backdropLayerWithGaussianBlurRadius:()CoverSheet brightnessAmount:saturationAmount:
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v6 = [MEMORY[0x1E4F39B40] layer];
  [v6 setOpacity:0.0];
  v7 = [MEMORY[0x1E4F39BC0] gaussianFilterWithInputRadius:a1];
  v8 = [MEMORY[0x1E4F39BC0] brightnessFilterWithAmount:a2];
  v9 = [MEMORY[0x1E4F39BC0] saturationFilterWithAmount:a3];
  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  [v6 setFilters:v10];

  id v11 = [MEMORY[0x1E4F428B8] clearColor];
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  [v6 setScale:100.0];
  [v6 setAllowsGroupOpacity:1];
  [v6 setAllowsEdgeAntialiasing:1];

  return v6;
}

@end