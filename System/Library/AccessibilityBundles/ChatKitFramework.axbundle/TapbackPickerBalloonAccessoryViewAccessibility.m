@interface TapbackPickerBalloonAccessoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityViewIsVisible;
- (CGRect)accessibilityFrame;
@end

@implementation TapbackPickerBalloonAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ChatKit.TapbackPickerBalloonAccessoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityViewIsVisible
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  v2 = [(TapbackPickerBalloonAccessoryViewAccessibility *)self accessibilityContainer];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end