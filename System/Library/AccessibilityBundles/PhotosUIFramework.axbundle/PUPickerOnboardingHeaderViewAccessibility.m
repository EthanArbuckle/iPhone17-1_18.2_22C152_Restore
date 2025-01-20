@interface PUPickerOnboardingHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation PUPickerOnboardingHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPickerOnboardingHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUPickerOnboardingHeaderView" hasSwiftFieldOfAnyClass:@"title"];
  [v3 validateClass:@"PUPickerOnboardingHeaderView" hasSwiftFieldOfAnyClass:@"subtitle"];
  [v3 validateClass:@"PUPickerOnboardingHeaderView" hasSwiftFieldOfAnyClass:@"closeButton"];
  [v3 validateClass:@"PUPickerOnboardingHeaderView" hasSwiftFieldOfAnyClass:@"learnMoreButton"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PUPickerOnboardingHeaderViewAccessibility *)self safeSwiftValueForKey:@"title"];
  v6 = [(PUPickerOnboardingHeaderViewAccessibility *)self safeSwiftValueForKey:@"subtitle"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = (void *)MEMORY[0x263EFF980];
  v12.receiver = self;
  v12.super_class = (Class)PUPickerOnboardingHeaderViewAccessibility;
  v4 = [(PUPickerOnboardingHeaderViewAccessibility *)&v12 _accessibilitySupplementaryFooterViews];
  v5 = objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 1, v4);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF980] array];
  }
  v8 = v7;

  v9 = [(PUPickerOnboardingHeaderViewAccessibility *)self safeSwiftValueForKey:@"closeButton"];
  if ([v9 _accessibilityViewIsVisible]) {
    [v8 axSafelyAddObject:v9];
  }
  v10 = [(PUPickerOnboardingHeaderViewAccessibility *)self safeSwiftValueForKey:@"learnMoreButton"];
  if ([v10 _accessibilityViewIsVisible]) {
    [v8 axSafelyAddObject:v10];
  }

  return v8;
}

@end