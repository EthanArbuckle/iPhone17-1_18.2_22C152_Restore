@interface SUUIShelfPageSectionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
@end

@implementation SUUIShelfPageSectionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIShelfPageSection";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIShelfPageSectionAccessibility;
  [(SUUIShelfPageSectionAccessibility *)&v4 collectionView:a3 didSelectItemAtIndexPath:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end