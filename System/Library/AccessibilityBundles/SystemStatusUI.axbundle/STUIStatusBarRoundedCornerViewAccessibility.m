@interface STUIStatusBarRoundedCornerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityViewIsVisible;
@end

@implementation STUIStatusBarRoundedCornerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarRoundedCornerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityViewIsVisible
{
  MEMORY[0x245665C20](@"STUIStatusBarPillView", a2);
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarRoundedCornerViewAccessibility;
  return [(STUIStatusBarRoundedCornerViewAccessibility *)&v4 _accessibilityViewIsVisible];
}

@end