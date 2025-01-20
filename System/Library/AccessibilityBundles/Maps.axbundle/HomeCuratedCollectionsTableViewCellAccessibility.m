@interface HomeCuratedCollectionsTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation HomeCuratedCollectionsTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HomeCuratedCollectionsTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  v3 = [(HomeCuratedCollectionsTableViewCellAccessibility *)self safeUIViewForKey:@"_carouselView"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

@end