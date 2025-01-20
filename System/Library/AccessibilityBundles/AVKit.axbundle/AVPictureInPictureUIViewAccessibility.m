@interface AVPictureInPictureUIViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsUsingRemoteParentActivateAction;
- (CGPoint)accessibilityActivationPoint;
@end

@implementation AVPictureInPictureUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)accessibilityActivationPoint
{
  v3 = [(AVPictureInPictureUIViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"PIPUIView"];

  if (v4)
  {
    v5 = [(AVPictureInPictureUIViewAccessibility *)self _accessibilityValueForKey:@"AXPIPConvertedBoundsKey"];
    v6 = v5;
    if (v5)
    {
      [v5 floatValue];
      float v8 = v7;
    }
    else
    {
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v13 = (UIView *)objc_claimAutoreleasedReturnValue();
      [(UIView *)v13 bounds];
      CGRect v20 = UIAccessibilityConvertFrameToScreenCoordinates(v19, v13);
      v20.origin.x = v20.size.width * 0.5;
      float v8 = v20.size.width * 0.5;
      *(float *)&v20.origin.x = v8;
      v14 = objc_msgSend(NSNumber, "numberWithFloat:", v20.origin.x, v20.origin.y);
      [(AVPictureInPictureUIViewAccessibility *)self _accessibilitySetRetainedValue:v14 forKey:@"AXPIPConvertedBoundsKey"];
    }
    double v10 = v8;
    double v12 = 1.0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)AVPictureInPictureUIViewAccessibility;
    [(AVPictureInPictureUIViewAccessibility *)&v17 accessibilityActivationPoint];
    double v10 = v9;
    double v12 = v11;
  }
  double v15 = v10;
  double v16 = v12;
  result.y = v16;
  result.x = v15;
  return result;
}

- (BOOL)_accessibilityIsUsingRemoteParentActivateAction
{
  v3 = [(AVPictureInPictureUIViewAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"PIPUIView"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)AVPictureInPictureUIViewAccessibility;
  return [(AVPictureInPictureUIViewAccessibility *)&v6 _accessibilityIsUsingRemoteParentActivateAction];
}

@end