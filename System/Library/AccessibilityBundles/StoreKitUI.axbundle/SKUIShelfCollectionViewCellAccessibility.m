@interface SKUIShelfCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setCollectionView:(id)a3;
@end

@implementation SKUIShelfCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIShelfCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIShelfCollectionViewCell", @"setCollectionView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIShelfCollectionViewCell", @"collectionView", "@", 0);
}

- (void)setCollectionView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIShelfCollectionViewCellAccessibility;
  [(SKUIShelfCollectionViewCellAccessibility *)&v4 setCollectionView:a3];
  [(SKUIShelfCollectionViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)SKUIShelfCollectionViewCellAccessibility;
  [(SKUIShelfCollectionViewCellAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(SKUIShelfCollectionViewCellAccessibility *)self safeValueForKey:@"collectionView"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 collectionViewLayout];
  NSClassFromString(&cfstr_Skuicarouselco.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  v7 = [(SKUIShelfCollectionViewCellAccessibility *)self safeValueForKey:@"collectionView"];
  v8 = v7;
  if (isKindOfClass) {
    v9 = @"SKUICarouselCollection";
  }
  else {
    v9 = @"ShelfCollectionView";
  }
  [v7 setAccessibilityIdentifier:v9];
}

@end