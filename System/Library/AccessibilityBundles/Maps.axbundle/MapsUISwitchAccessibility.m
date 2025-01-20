@interface MapsUISwitchAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsInSettingsTableViewCell;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetIsInSettingsTableViewCell:(BOOL)a3;
@end

@implementation MapsUISwitchAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISwitch";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)MapsUISwitchAccessibility;
  unint64_t v3 = [(MapsUISwitchAccessibility *)&v7 accessibilityTraits];
  BOOL v4 = [(MapsUISwitchAccessibility *)self _accessibilityIsInSettingsTableViewCell];
  uint64_t v5 = *MEMORY[0x263F813E8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (BOOL)_accessibilityIsInSettingsTableViewCell
{
  return self->__accessibilityIsInSettingsTableViewCell;
}

- (void)_accessibilitySetIsInSettingsTableViewCell:(BOOL)a3
{
  self->__accessibilityIsInSettingsTableViewCell = a3;
}

@end