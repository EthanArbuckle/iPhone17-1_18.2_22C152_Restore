@interface SmallBreakoutCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axDetailsView;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation SmallBreakoutCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.SmallBreakoutCollectionViewCell";
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

- (id)_axDetailsView
{
  return (id)[(SmallBreakoutCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityDetailsView"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SmallBreakoutCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SmallBreakoutCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return (id)[(SmallBreakoutCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityDetailsView"];
}

- (id)accessibilityCustomActions
{
  objc_super v3 = (void *)MEMORY[0x263EFF980];
  v9.receiver = self;
  v9.super_class = (Class)SmallBreakoutCollectionViewCellAccessibility;
  v4 = [(SmallBreakoutCollectionViewCellAccessibility *)&v9 accessibilityCustomActions];
  v5 = [v3 arrayWithArray:v4];

  v6 = [(SmallBreakoutCollectionViewCellAccessibility *)self _axDetailsView];
  v7 = [v6 accessibilityCustomActions];
  [v5 axSafelyAddObjectsFromArray:v7];

  return v5;
}

- (id)automationElements
{
  v11.receiver = self;
  v11.super_class = (Class)SmallBreakoutCollectionViewCellAccessibility;
  objc_super v3 = [(SmallBreakoutCollectionViewCellAccessibility *)&v11 automationElements];
  v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  v7 = v6;

  v8 = [(SmallBreakoutCollectionViewCellAccessibility *)self _axDetailsView];
  objc_super v9 = [v8 automationElements];
  [v7 axSafelyAddObjectsFromArray:v9];

  return v7;
}

@end