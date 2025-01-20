@interface SUSSoftwareUpdateTitleCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
- (id)newProgressBar;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axApplyProgressViewLabel:(id)a3;
@end

@implementation SUSSoftwareUpdateTitleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUSSoftwareUpdateTitleCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUSSoftwareUpdateTitleCell", @"newProgressBar", "@", 0);
  [v3 validateClass:@"SUSSoftwareUpdateTitleCell" hasInstanceVariable:@"_progressBar" withType:"UIProgressView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUSSoftwareUpdateTitleCell", @"updateStatusLabel", "@", 0);
}

- (id)accessibilityValue
{
  v8.receiver = self;
  v8.super_class = (Class)SUSSoftwareUpdateTitleCellAccessibility;
  id v3 = [(SUSSoftwareUpdateTitleCellAccessibility *)&v8 accessibilityValue];
  v4 = [(SUSSoftwareUpdateTitleCellAccessibility *)self safeValueForKey:@"updateStatusLabel"];
  v7 = [v4 accessibilityLabel];
  v5 = __UIAXStringForVariables();

  return v5;
}

- (void)_axApplyProgressViewLabel:(id)a3
{
  id v3 = a3;
  accessibilityLocalizedString(@"download.progress");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setAccessibilityLabel:v4];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SUSSoftwareUpdateTitleCellAccessibility;
  [(SUSSoftwareUpdateTitleCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SUSSoftwareUpdateTitleCellAccessibility *)self safeUIViewForKey:@"_progressBar"];
  [(SUSSoftwareUpdateTitleCellAccessibility *)self _axApplyProgressViewLabel:v3];
}

- (id)newProgressBar
{
  v5.receiver = self;
  v5.super_class = (Class)SUSSoftwareUpdateTitleCellAccessibility;
  id v3 = [(SUSSoftwareUpdateTitleCellAccessibility *)&v5 newProgressBar];
  [(SUSSoftwareUpdateTitleCellAccessibility *)self _axApplyProgressViewLabel:v3];
  return v3;
}

@end