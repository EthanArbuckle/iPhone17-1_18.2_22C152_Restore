@interface _SBHAddWidgetSheetCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
@end

@implementation _SBHAddWidgetSheetCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SBHAddWidgetSheetCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

@end