@interface ContentSearchResultCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axLockupView;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ContentSearchResultCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.ContentSearchResultCollectionViewCell";
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
  return (id)[(ContentSearchResultCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityLockupView"];
}

- (id)accessibilityLabel
{
  v2 = [(ContentSearchResultCollectionViewCellAccessibility *)self _axLockupView];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(ContentSearchResultCollectionViewCellAccessibility *)self _axLockupView];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = [(ContentSearchResultCollectionViewCellAccessibility *)self _axLockupView];
  unint64_t v3 = [v2 _accessibilitySupplementaryFooterViews];

  return v3;
}

@end