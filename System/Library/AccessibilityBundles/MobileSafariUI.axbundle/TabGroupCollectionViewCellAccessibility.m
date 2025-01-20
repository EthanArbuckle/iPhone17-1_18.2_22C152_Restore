@interface TabGroupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation TabGroupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TabGroupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TabGroupCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(TabGroupCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

@end