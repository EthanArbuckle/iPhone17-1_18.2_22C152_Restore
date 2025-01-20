@interface TPSWidgetTipViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (CGRect)accessibilityFrame;
@end

@implementation TPSWidgetTipViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPSWidgetTipView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSWidgetTipView", @"tip", "@", 0);
  [v3 validateClass:@"TPSWidgetTip" isKindOfClass:@"TPSTip"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSWidgetTipView", @"updateTitleLabel", "v", 0);
}

- (CGRect)accessibilityFrame
{
  v2 = [(TPSWidgetTipViewAccessibility *)self superview];
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

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

@end