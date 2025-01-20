@interface FMSettingRowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation FMSettingRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FindMy.FMSettingRowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)FMSettingRowViewAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(FMSettingRowViewAccessibility *)&v7 accessibilityTraits];
  v4 = [(FMSettingRowViewAccessibility *)self safeValueForKey:@"accessibilityChevronImage"];
  if (v4) {
    unint64_t v5 = *MEMORY[0x263F1CF38] | v3;
  }
  else {
    unint64_t v5 = v3 & ~*MEMORY[0x263F1CF38];
  }

  return v5;
}

@end