@interface SmallLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityScrollParentForComparingByXAxis;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axLockupView;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation SmallLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.SmallLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_axLockupView
{
  return (id)[(SmallLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityLockupView"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(SmallLockupCollectionViewCellAccessibility *)self _axLockupView];
  char v3 = [v2 isAccessibilityElement];

  return v3;
}

- (id)accessibilityLabel
{
  v2 = [(SmallLockupCollectionViewCellAccessibility *)self _axLockupView];
  char v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(SmallLockupCollectionViewCellAccessibility *)self _axLockupView];
  uint64_t v3 = [v2 accessibilityTraits];
  unint64_t v4 = *MEMORY[0x263F1CF48] | v3;

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = [(SmallLockupCollectionViewCellAccessibility *)self _axLockupView];
  uint64_t v3 = [v2 _accessibilitySupplementaryFooterViews];

  return v3;
}

- (id)_accessibilityScrollParentForComparingByXAxis
{
  uint64_t v3 = objc_opt_class();

  return (id)[(SmallLockupCollectionViewCellAccessibility *)self _accessibilityAncestorIsKindOf:v3];
}

- (id)accessibilityUserInputLabels
{
  objc_opt_class();
  uint64_t v3 = [(SmallLockupCollectionViewCellAccessibility *)self _axLockupView];
  unint64_t v4 = [v3 safeValueForKey:@"accessibilityTitleLabel"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = __UIAXStringForVariables();
  v7 = MEMORY[0x24565D260](v6);

  return v7;
}

@end