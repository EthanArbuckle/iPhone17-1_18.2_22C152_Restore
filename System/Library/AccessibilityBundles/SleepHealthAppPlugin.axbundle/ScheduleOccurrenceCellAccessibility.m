@interface ScheduleOccurrenceCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ScheduleOccurrenceCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SleepHealthAppPlugin.ScheduleOccurrenceCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80938](self, a2);
}

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  int v3 = [v2 isUserInteractionEnabled];
  v4 = (unint64_t *)MEMORY[0x263F1CEE8];
  if (!v3) {
    v4 = (unint64_t *)MEMORY[0x263F1CF18];
  }
  unint64_t v5 = *v4;

  return v5;
}

@end