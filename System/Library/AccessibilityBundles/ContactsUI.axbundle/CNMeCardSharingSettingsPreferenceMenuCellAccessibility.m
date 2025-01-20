@interface CNMeCardSharingSettingsPreferenceMenuCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation CNMeCardSharingSettingsPreferenceMenuCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNMeCardSharingSettingsPreferenceMenuCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CNMeCardSharingSettingsPreferenceMenuCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CNMeCardSharingSettingsPreferenceMenuCellAccessibility *)&v3 accessibilityTraits];
}

@end