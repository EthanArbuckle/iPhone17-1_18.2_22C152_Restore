@interface FIUIHealthSettingsTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation FIUIHealthSettingsTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FIUIHealthSettingsTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FIUIHealthSettingsTableViewCellAccessibility;
  return UIAccessibilityTraitButton | [(FIUIHealthSettingsTableViewCellAccessibility *)&v3 accessibilityTraits];
}

@end