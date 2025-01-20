@interface VerificationCheckmarkCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation VerificationCheckmarkCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExposureNotificationUI.VerificationCheckmarkCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  int v2 = [(VerificationCheckmarkCellAccessibility *)self safeBoolForKey:@"isChecked"];
  uint64_t v3 = *MEMORY[0x263F1CF38];
  if (!v2) {
    uint64_t v3 = 0;
  }
  return v3 | *MEMORY[0x263F1CEE8];
}

@end