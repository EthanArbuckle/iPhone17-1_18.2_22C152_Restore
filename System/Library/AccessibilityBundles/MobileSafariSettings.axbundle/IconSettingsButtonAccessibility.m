@interface IconSettingsButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation IconSettingsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"IconSettingsButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return (id)[(IconSettingsButtonAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:0 exclusions:0];
}

@end