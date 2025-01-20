@interface TipsWidgetExtensionUIViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (CGRect)accessibilityFrame;
@end

@implementation TipsWidgetExtensionUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  v3 = [(TipsWidgetExtensionUIViewAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:kAXSingleTipsViewIdentifier];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)TipsWidgetExtensionUIViewAccessibility;
  return [(TipsWidgetExtensionUIViewAccessibility *)&v6 _accessibilityUseAccessibilityFrameForHittest];
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  v3 = [(TipsWidgetExtensionUIViewAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:kAXSingleTipsViewIdentifier];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)TipsWidgetExtensionUIViewAccessibility;
  return [(TipsWidgetExtensionUIViewAccessibility *)&v6 _accessibilityOverridesInvalidFrames];
}

- (CGRect)accessibilityFrame
{
  v3 = [(TipsWidgetExtensionUIViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:kAXSingleTipsViewIdentifier];

  if (v4)
  {
    v5 = [(TipsWidgetExtensionUIViewAccessibility *)self superview];
    [v5 accessibilityFrame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)TipsWidgetExtensionUIViewAccessibility;
    [(TipsWidgetExtensionUIViewAccessibility *)&v22 accessibilityFrame];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

@end