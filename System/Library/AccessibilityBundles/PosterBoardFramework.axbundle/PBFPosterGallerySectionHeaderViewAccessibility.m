@interface PBFPosterGallerySectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PBFPosterGallerySectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBFPosterGallerySectionHeaderView";
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
  v4.super_class = (Class)PBFPosterGallerySectionHeaderViewAccessibility;
  [(PBFPosterGallerySectionHeaderViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(PBFPosterGallerySectionHeaderViewAccessibility *)self safeValueForKey:@"label"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F83268]];
}

@end