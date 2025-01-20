@interface SUUIItemCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityElements;
@end

@implementation SUUIItemCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIItemCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityElements
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SUUIItemCollectionViewCellAccessibility *)self safeValueForKey:@"_layout"];
  v5 = [v4 safeValueForKey:@"_itemOfferButton"];
  [v5 accessibilitySetIdentification:@"ItemOfferButton"];
  [v3 axSafelyAddObject:v5];

  return v3;
}

@end