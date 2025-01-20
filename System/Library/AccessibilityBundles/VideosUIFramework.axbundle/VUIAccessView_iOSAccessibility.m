@interface VUIAccessView_iOSAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation VUIAccessView_iOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIAccessView_iOS";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)VUIAccessView_iOSAccessibility;
  [(VUIAccessView_iOSAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(VUIAccessView_iOSAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245669780](@"UITransitionView")];
  [v3 setAccessibilityViewIsModal:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VUIAccessView_iOSAccessibility;
  [(VUIAccessView_iOSAccessibility *)&v3 layoutSubviews];
  [(VUIAccessView_iOSAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end