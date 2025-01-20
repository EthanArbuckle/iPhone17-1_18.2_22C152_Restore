@interface CollectionTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation CollectionTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CollectionTableViewCell";
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
  v3 = [(CollectionTableViewCellAccessibility *)self safeValueForKey:@"_collectionView"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

@end