@interface TPSSingleTipViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setTip:(id)a3;
@end

@implementation TPSSingleTipViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPSSingleTipViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TPSSingleTipViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"TPSSingleTipViewController" hasInstanceVariable:@"_imageAssetView" withType:"TPSImageAssetView"];
  [v3 validateClass:@"TPSImageAssetView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSSingleTipViewController", @"tip", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSTip", @"fullContentAssets", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSAssets", @"alt", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TPSSingleTipViewController", @"setTip:", "v", "@", 0);
  [v3 validateClass:@"TPSSingleTipViewController" hasInstanceVariable:@"_pendingTip" withType:"TPSTip"];
}

- (void)setTip:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPSSingleTipViewControllerAccessibility;
  [(TPSSingleTipViewControllerAccessibility *)&v4 setTip:a3];
  [(TPSSingleTipViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v15.receiver = self;
  v15.super_class = (Class)TPSSingleTipViewControllerAccessibility;
  [(TPSSingleTipViewControllerAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(TPSSingleTipViewControllerAccessibility *)self safeValueForKey:@"_imageAssetView"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  v5 = [(TPSSingleTipViewControllerAccessibility *)self safeValueForKey:@"tip"];
  if (!v5)
  {
    v5 = [(TPSSingleTipViewControllerAccessibility *)self safeValueForKey:@"_pendingTip"];
  }
  [v4 setIsAccessibilityElement:1];
  v6 = [v4 layer];
  v7 = [v6 sublayers];

  uint64_t v8 = [v7 indexOfObjectPassingTest:&__block_literal_global_0];
  v9 = [v5 safeValueForKey:@"fullContentAssets"];
  v10 = [v9 safeStringForKey:@"alt"];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setAccessibilityTraits:*MEMORY[0x263F1CF00]];
    [v4 setAccessibilityLabel:v10];
    [v4 setAccessibilityHint:0];
  }
  else
  {
    [v4 setAccessibilityTraits:*MEMORY[0x263F1CF18]];
    v11 = accessibilityTipsLocalizedString(@"video.role");
    v12 = __UIAXStringForVariables();
    objc_msgSend(v4, "setAccessibilityLabel:", v12, v10, @"__AXStringForVariablesSentinel");
  }
  objc_opt_class();
  v13 = __UIAccessibilityCastAsClass();
  v14 = [v13 view];

  [v14 setAccessibilityIdentifier:kAXSingleTipsViewIdentifier];
}

uint64_t __85__TPSSingleTipViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 isHidden] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

@end