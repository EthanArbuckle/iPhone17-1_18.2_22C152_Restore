@interface ExternalLinkCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation ExternalLinkCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.ExternalLinkCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ExternalLinkCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ExternalLinkCellAccessibility *)&v3 accessibilityTraits];
}

@end