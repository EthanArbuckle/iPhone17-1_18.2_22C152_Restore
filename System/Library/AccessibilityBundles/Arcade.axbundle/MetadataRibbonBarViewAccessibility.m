@interface MetadataRibbonBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MetadataRibbonBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.MetadataRibbonBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)MetadataRibbonBarViewAccessibility;
  [(MetadataRibbonBarViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(MetadataRibbonBarViewAccessibility *)self safeSwiftValueForKey:@"dividerLabel"];
  [v3 setIsAccessibilityElement:0];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end