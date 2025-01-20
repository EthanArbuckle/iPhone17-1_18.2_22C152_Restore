@interface VideosUIViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityParentForFindingScrollParent;
@end

@implementation VideosUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityParentForFindingScrollParent
{
  v8.receiver = self;
  v8.super_class = (Class)VideosUIViewAccessibility;
  v3 = [(VideosUIViewAccessibility *)&v8 _accessibilityParentForFindingScrollParent];
  v4 = [(VideosUIViewAccessibility *)self accessibilityIdentifier];
  int v5 = [v4 isEqualToString:@"AXContainedInCollectionView"];

  if (v5)
  {
    uint64_t v6 = [(VideosUIViewAccessibility *)self safeValueForKey:@"superview"];

    v3 = (void *)v6;
  }

  return v3;
}

@end