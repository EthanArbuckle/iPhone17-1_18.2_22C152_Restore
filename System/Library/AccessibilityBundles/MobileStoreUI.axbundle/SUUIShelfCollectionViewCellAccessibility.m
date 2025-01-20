@interface SUUIShelfCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setCollectionView:(id)a3;
@end

@implementation SUUIShelfCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIShelfCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIShelfCollectionViewCell", @"setCollectionView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIShelfCollectionViewCell", @"collectionView", "@", 0);
}

- (void)setCollectionView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIShelfCollectionViewCellAccessibility;
  [(SUUIShelfCollectionViewCellAccessibility *)&v4 setCollectionView:a3];
  [(SUUIShelfCollectionViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIShelfCollectionViewCellAccessibility;
  [(SUUIShelfCollectionViewCellAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(SUUIShelfCollectionViewCellAccessibility *)self safeValueForKey:@"collectionView"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 collectionViewLayout];
  NSClassFromString(&cfstr_Suuicarouselco.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  v7 = [(SUUIShelfCollectionViewCellAccessibility *)self safeValueForKey:@"collectionView"];
  v8 = v7;
  if (isKindOfClass) {
    v9 = @"SUUICarouselCollection";
  }
  else {
    v9 = @"ShelfCollectionView";
  }
  [v7 setAccessibilityIdentifier:v9];
}

@end