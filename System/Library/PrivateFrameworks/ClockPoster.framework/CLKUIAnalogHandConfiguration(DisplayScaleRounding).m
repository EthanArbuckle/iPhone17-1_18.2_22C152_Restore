@interface CLKUIAnalogHandConfiguration(DisplayScaleRounding)
- (id)cp_handConfigurationRoundedToScaleOfView:()DisplayScaleRounding;
@end

@implementation CLKUIAnalogHandConfiguration(DisplayScaleRounding)

- (id)cp_handConfigurationRoundedToScaleOfView:()DisplayScaleRounding
{
  id v4 = a3;
  v5 = (void *)[a1 copy];
  [v5 handLength];
  UIRoundToViewScale();
  objc_msgSend(v5, "setHandLength:");
  [v5 handWidth];
  UIRoundToViewScale();
  objc_msgSend(v5, "setHandWidth:");
  [v5 armLength];
  UIRoundToViewScale();
  objc_msgSend(v5, "setArmLength:");
  [v5 armWidth];
  UIRoundToViewScale();
  objc_msgSend(v5, "setArmWidth:");
  [v5 pegStrokeWidth];
  UIRoundToViewScale();
  objc_msgSend(v5, "setPegStrokeWidth:");
  [v5 pegRadius];
  UIRoundToViewScale();
  objc_msgSend(v5, "setPegRadius:");
  [v5 tailLength];
  UIRoundToViewScale();
  double v7 = v6;

  [v5 setTailLength:v7];

  return v5;
}

@end