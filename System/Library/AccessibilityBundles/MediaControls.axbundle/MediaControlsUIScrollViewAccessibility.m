@interface MediaControlsUIScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (UIEdgeInsets)_accessibilityContentInset;
@end

@implementation MediaControlsUIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollViewAccessibility", @"_accessibilityContentInset", "{UIEdgeInsets=dddd}", 0);
}

- (UIEdgeInsets)_accessibilityContentInset
{
  v3 = [(MediaControlsUIScrollViewAccessibility *)self accessibilityIdentification];
  if ([v3 isEqualToString:@"AXMediaControlsScrollViewIdentifier"]
    && (UIAccessibilityIsSwitchControlRunning() || _AXSCommandAndControlEnabled()))
  {
    double v4 = *MEMORY[0x263F1D1C0];
    double v5 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v6 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v7 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)MediaControlsUIScrollViewAccessibility;
    [(MediaControlsUIScrollViewAccessibility *)&v16 _accessibilityContentInset];
    double v4 = v8;
    double v5 = v9;
    double v6 = v10;
    double v7 = v11;
  }

  double v12 = v4;
  double v13 = v5;
  double v14 = v6;
  double v15 = v7;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

@end