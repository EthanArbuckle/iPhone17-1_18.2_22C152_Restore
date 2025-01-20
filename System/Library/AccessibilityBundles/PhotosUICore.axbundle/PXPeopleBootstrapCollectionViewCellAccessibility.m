@interface PXPeopleBootstrapCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setConfirmed:(BOOL)a3;
@end

@implementation PXPeopleBootstrapCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPeopleBootstrapCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPeopleBootstrapCollectionViewCell", @"image", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPeopleBootstrapCollectionViewCell", @"setConfirmed:", "v", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PXPeopleBootstrapCollectionViewCellAccessibility *)self safeValueForKey:@"image"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)setConfirmed:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXPeopleBootstrapCollectionViewCellAccessibility;
  -[PXPeopleBootstrapCollectionViewCellAccessibility setConfirmed:](&v7, sel_setConfirmed_);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__PXPeopleBootstrapCollectionViewCellAccessibility_setConfirmed___block_invoke;
  v5[3] = &__block_descriptor_33_e15___NSString_8__0l;
  BOOL v6 = a3;
  [(PXPeopleBootstrapCollectionViewCellAccessibility *)self _setAccessibilityValueBlock:v5];
}

id __65__PXPeopleBootstrapCollectionViewCellAccessibility_setConfirmed___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32)) {
    v1 = @"bootstrap.cell.confirmed.status";
  }
  else {
    v1 = @"bootstrap.cell.unconfirmed.status";
  }
  v2 = accessibilityPhotosUICoreLocalizedString(v1);

  return v2;
}

- (id)accessibilityHint
{
  return accessibilityPhotosUICoreLocalizedString(@"bootstrap.cell.confirm.hint");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleBootstrapCollectionViewCellAccessibility;
  return [(PXPeopleBootstrapCollectionViewCellAccessibility *)&v3 accessibilityTraits] & ~*MEMORY[0x263F1CF38];
}

@end