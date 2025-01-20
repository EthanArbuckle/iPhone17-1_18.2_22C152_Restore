@interface DownloadButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation DownloadButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.DownloadButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  unint64_t v2 = [(DownloadButtonAccessibility *)self safeIntegerForKey:@"accessibilityState"];
  if (v2 > 6)
  {
    v3 = 0;
  }
  else
  {
    v3 = accessibilityLocalizedString(off_26514EFE0[v2]);
  }

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return [(DownloadButtonAccessibility *)self safeIntegerForKey:@"accessibilityState"] != 7;
}

- (unint64_t)accessibilityTraits
{
  if ([(DownloadButtonAccessibility *)self safeIntegerForKey:@"accessibilityState"] == 5)
  {
    v7.receiver = self;
    v7.super_class = (Class)DownloadButtonAccessibility;
    unint64_t v3 = *MEMORY[0x263F1CEE8] | [(DownloadButtonAccessibility *)&v7 accessibilityTraits];
    unint64_t v4 = *MEMORY[0x263F1CF20];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DownloadButtonAccessibility;
    unint64_t v4 = [(DownloadButtonAccessibility *)&v6 accessibilityTraits];
    unint64_t v3 = *MEMORY[0x263F1CEE8];
  }
  return v3 | v4;
}

@end