@interface ListTableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityFauxTableViewCellsDisabled;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (id)_accessibilityFirstContainedElementForTechnology:(id)a3 honoringGroups:(BOOL)a4 shouldAlwaysScroll:(BOOL)a5;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation ListTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ListTableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"events.container");
}

- (id)_accessibilityFirstContainedElementForTechnology:(id)a3 honoringGroups:(BOOL)a4 shouldAlwaysScroll:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  objc_opt_class();
  v8 = __UIAccessibilityCastAsClass();
  v9 = [v8 visibleCells];
  v10 = [v9 firstObject];
  v11 = [v10 _accessibilityFirstContainedElementForTechnology:v7 honoringGroups:v6 shouldAlwaysScroll:v5];

  return v11;
}

- (BOOL)_accessibilityFauxTableViewCellsDisabled
{
  return 1;
}

@end