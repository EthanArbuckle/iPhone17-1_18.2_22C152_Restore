@interface ADBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation ADBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ADBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  if (!_AXSAutomationEnabled())
  {
    v5 = [(ADBannerViewAccessibility *)self accessibilityUserDefinedLabel];

    if (v5) {
      return 1;
    }
  }
  uint64_t v3 = MEMORY[0x24566B9B0](@"ADBannerView");

  return [(ADBannerViewAccessibility *)self isMemberOfClass:v3];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ADBannerViewAccessibility;
  return *MEMORY[0x263F1CF00] | [(ADBannerViewAccessibility *)&v3 accessibilityTraits];
}

@end