@interface SUUIScrollingSegmentedControllerCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIScrollingSegmentedControllerCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIScrollingSegmentedControllerCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return 0;
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  return 1;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 0;
}

@end