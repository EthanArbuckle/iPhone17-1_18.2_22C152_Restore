@interface UIColor(DC)
+ (id)colorInBundleWithName:()DC;
+ (id)dc_barColor;
+ (id)dc_darkerAccessibilityColorForColor:()DC;
+ (id)dc_editBackgroundColor;
+ (id)dc_labelBackgroundColor;
+ (uint64_t)DCExtractedDocumentViewControllerBackgroundColor;
- (BOOL)dc_colorIsLight;
- (id)dc_lighterColor;
@end

@implementation UIColor(DC)

+ (id)dc_darkerAccessibilityColorForColor:()DC
{
  double v8 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 0.0;
  [a3 getHue:&v8 saturation:&v7 brightness:&v6 alpha:&v5];
  v3 = [MEMORY[0x263F1C550] colorWithHue:v8 saturation:v7 brightness:v6 * 0.8 alpha:v5];

  return v3;
}

+ (id)colorInBundleWithName:()DC
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  double v5 = [v3 bundleForClass:objc_opt_class()];
  double v6 = [MEMORY[0x263F1C550] colorNamed:v4 inBundle:v5 compatibleWithTraitCollection:0];

  return v6;
}

+ (uint64_t)DCExtractedDocumentViewControllerBackgroundColor
{
  return [a1 colorInBundleWithName:@"extracted_document_background_color"];
}

+ (id)dc_barColor
{
  if (DCDebugInterfaceEnabled())
  {
    v2 = 0;
  }
  else
  {
    v2 = [a1 colorInBundleWithName:@"bar_color"];
  }

  return v2;
}

+ (id)dc_editBackgroundColor
{
  if (DCDebugInterfaceEnabled())
  {
    v2 = 0;
  }
  else
  {
    v2 = [a1 colorInBundleWithName:@"edit_background_color"];
  }

  return v2;
}

+ (id)dc_labelBackgroundColor
{
  if (DCDebugInterfaceEnabled())
  {
    v2 = 0;
  }
  else
  {
    v2 = [a1 colorInBundleWithName:@"label_background_color"];
  }

  return v2;
}

- (id)dc_lighterColor
{
  double v6 = 0.0;
  uint64_t v4 = 0;
  double v5 = 0.0;
  double v3 = 0.0;
  [a1 getHue:&v6 saturation:&v5 brightness:&v4 alpha:&v3];
  v1 = [MEMORY[0x263F1C550] colorWithHue:v6 saturation:v5 brightness:1.0 alpha:v3];

  return v1;
}

- (BOOL)dc_colorIsLight
{
  Components = CGColorGetComponents((CGColorRef)[a1 CGColor]);
  return (Components[1] * 587.0 + *Components * 299.0 + Components[2] * 114.0) / 1000.0 > 0.5;
}

@end