@interface HUDownloadControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation HUDownloadControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUDownloadControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUDownloadControl" hasInstanceVariable:@"_controlTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"HUDownloadControl" hasInstanceVariable:@"_downloadProgressView" withType:"HUDownloadProgressView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(HUDownloadControlAccessibility *)self safeUIViewForKey:@"_controlTitleLabel"];
  v4 = [v3 accessibilityLabel];

  v8.receiver = self;
  v8.super_class = (Class)HUDownloadControlAccessibility;
  v5 = [(HUDownloadControlAccessibility *)&v8 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)accessibilityValue
{
  id v3 = [(HUDownloadControlAccessibility *)self safeValueForKey:@"_downloadProgressView"];
  v4 = [v3 accessibilityValue];

  v8.receiver = self;
  v8.super_class = (Class)HUDownloadControlAccessibility;
  v5 = [(HUDownloadControlAccessibility *)&v8 accessibilityValue];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HUDownloadControlAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HUDownloadControlAccessibility *)&v3 accessibilityTraits];
}

@end