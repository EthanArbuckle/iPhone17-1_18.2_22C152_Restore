@interface PosterSectionRemovalViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PosterSectionRemovalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.PosterSectionRemovalView";
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
  v5.receiver = self;
  v5.super_class = (Class)PosterSectionRemovalViewAccessibility;
  [(PosterSectionRemovalViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(PosterSectionRemovalViewAccessibility *)self safeSwiftValueForKey:@"deleteButton"];
  v4 = accessibilityLocalizedString(@"lock.screen.poster.cell.delete.label");
  [v3 setAccessibilityLabel:v4];
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end