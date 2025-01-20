@interface VerticalLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_axCollectionViewLayout;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation VerticalLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.VerticalLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCollectionViewLayout
{
  objc_opt_class();
  v3 = [(VerticalLockupCollectionViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 collectionViewLayout];

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3 = [(VerticalLockupCollectionViewCellAccessibility *)self _axCollectionViewLayout];
  MEMORY[0x2456584B0](@"MusicApplication.ShelfCollectionViewLayout");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(VerticalLockupCollectionViewCellAccessibility *)self _axCollectionViewLayout];
    [v5 setAccessibilityIdentifier:@"AX_VertificalLockupCollectionViewCell"];
  }
  v6.receiver = self;
  v6.super_class = (Class)VerticalLockupCollectionViewCellAccessibility;
  [(VerticalLockupCollectionViewCellAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VerticalLockupCollectionViewCellAccessibility;
  [(VerticalLockupCollectionViewCellAccessibility *)&v3 layoutSubviews];
  [(VerticalLockupCollectionViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end