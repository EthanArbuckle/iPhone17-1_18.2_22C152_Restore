@interface SmallLockupCollectionViewTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axLockupView;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SmallLockupCollectionViewTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.SmallLockupCollectionViewTableCell";
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

- (id)_axLockupView
{
  return (id)[(SmallLockupCollectionViewTableCellAccessibility *)self safeValueForKey:@"accessibilityLockupView"];
}

- (id)accessibilityLabel
{
  v2 = [(SmallLockupCollectionViewTableCellAccessibility *)self _axLockupView];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(SmallLockupCollectionViewTableCellAccessibility *)self _axLockupView];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = [(SmallLockupCollectionViewTableCellAccessibility *)self _axLockupView];
  unint64_t v3 = [v2 _accessibilitySupplementaryFooterViews];

  return v3;
}

@end