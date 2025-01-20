@interface SBUIAppleLogoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SBUIAppleLogoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIAppleLogoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBUIAppleLogoView" hasInstanceVariable:@"_progressWindow" withType:"PUIProgressWindow"];
  [v3 validateClass:@"SBUIAppleLogoView" hasInstanceVariable:@"_progress" withType:"f"];
  [v3 validateClass:@"PUIProgressWindow" hasInstanceVariable:@"_showsProgressBar" withType:"B"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = accessibilitySBLocalizedString(@"apple.logo");
  v4 = [(SBUIAppleLogoViewAccessibility *)self safeUIViewForKey:@"_progressWindow"];
  int v5 = [v4 safeBoolForKey:@"_showsProgressBar"];

  if (v5)
  {
    v8 = accessibilitySBLocalizedString(@"progress.bar.label");
    uint64_t v6 = __UIAXStringForVariables();

    id v3 = (void *)v6;
  }

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(SBUIAppleLogoViewAccessibility *)self safeUIViewForKey:@"_progressWindow"];
  int v4 = [v3 safeBoolForKey:@"_showsProgressBar"];

  if (v4)
  {
    [(SBUIAppleLogoViewAccessibility *)self safeFloatForKey:@"_progress"];
    int v5 = AXFormatFloatWithPercentage();
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF68];
}

@end