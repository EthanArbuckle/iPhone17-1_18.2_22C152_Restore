@interface SFDownloadsBarButtonItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SFDownloadsBarButtonItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFDownloadsBarButtonItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFDownloadsBarButtonItemView" hasInstanceVariable:@"_progress" withType:"d"];
  [v3 validateClass:@"SFDownloadsBarButtonItemView" hasInstanceVariable:@"_progressView" withType:"UIProgressView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilitySafariServicesLocalizedString(@"downloads.button");
}

- (id)accessibilityValue
{
  id v3 = [(SFDownloadsBarButtonItemViewAccessibility *)self safeUIViewForKey:@"_progressView"];
  char v4 = [v3 isHidden];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    [(SFDownloadsBarButtonItemViewAccessibility *)self safeDoubleForKey:@"_progress"];
    v5 = AXFormatFloatWithPercentage();
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end