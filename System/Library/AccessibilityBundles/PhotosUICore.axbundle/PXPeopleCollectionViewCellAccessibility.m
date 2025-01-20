@interface PXPeopleCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityToggleFavoriteActivate:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFavoriteButton;
- (id)_accessibilityPersonName;
- (id)_accessibilityUnfavoriteButton;
- (id)accessibilityCustomActions;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)_axPeopleHomeCellSelectionMode;
- (unint64_t)accessibilityTraits;
- (void)_setAXPeopleHomeCellSelectionMode:(unint64_t)a3;
@end

@implementation PXPeopleCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPeopleCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_axPeopleHomeCellSelectionMode
{
  return MEMORY[0x270F0A478](self, &__PXPeopleCollectionViewCellAccessibility___axPeopleHomeCellSelectionMode);
}

- (void)_setAXPeopleHomeCellSelectionMode:(unint64_t)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPeopleCollectionViewCell", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPeopleCollectionViewCell", @"toggleFavorite:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPeopleCollectionViewCell", @"isFavorite", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPeopleCollectionViewCell", @"badgeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPeopleBadgeView", @"favoriteButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPeopleBadgeView", @"unfavoriteButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPeopleCollectionViewCell", @"peopleCellDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPersonItem", @"modelObject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHPerson", @"detectionType", "s", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityPersonName
{
  objc_opt_class();
  id v3 = [(PXPeopleCollectionViewCellAccessibility *)self safeValueForKey:@"name"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = accessibilityPhotosUICoreLocalizedString(@"people.name.unknown");
  if ([v4 length]) {
    v6 = v4;
  }
  else {
    v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (id)accessibilityValue
{
  if ([(PXPeopleCollectionViewCellAccessibility *)self safeBoolForKey:@"isFavorite"])
  {
    v2 = accessibilityPhotosUICoreLocalizedString(@"people.favorite");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (unint64_t)accessibilityTraits
{
  if ([(PXPeopleCollectionViewCellAccessibility *)self _axPeopleHomeCellSelectionMode])
  {
    v4.receiver = self;
    v4.super_class = (Class)PXPeopleCollectionViewCellAccessibility;
    return [(PXPeopleCollectionViewCellAccessibility *)&v4 accessibilityTraits];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PXPeopleCollectionViewCellAccessibility;
    return *MEMORY[0x263F1CEE8] | [(PXPeopleCollectionViewCellAccessibility *)&v5 accessibilityTraits] | *MEMORY[0x263F81380];
  }
}

- (id)_accessibilityFavoriteButton
{
  id v3 = [(PXPeopleCollectionViewCellAccessibility *)self safeValueForKeyPath:@"badgeView.favoriteButton"];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__PXPeopleCollectionViewCellAccessibility__accessibilityFavoriteButton__block_invoke;
  v5[3] = &unk_2650A6320;
  objc_copyWeak(&v6, &location);
  [v3 _setAccessibilityLabelBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

id __71__PXPeopleCollectionViewCellAccessibility__accessibilityFavoriteButton__block_invoke(uint64_t a1)
{
  v2 = NSString;
  id v3 = accessibilityPhotosUICoreLocalizedString(@"add.favorite");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v5 = [WeakRetained _accessibilityPersonName];
  id v6 = objc_msgSend(v2, "localizedStringWithFormat:", v3, v5);

  return v6;
}

- (id)_accessibilityUnfavoriteButton
{
  id v3 = [(PXPeopleCollectionViewCellAccessibility *)self safeValueForKeyPath:@"badgeView.unfavoriteButton"];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73__PXPeopleCollectionViewCellAccessibility__accessibilityUnfavoriteButton__block_invoke;
  v5[3] = &unk_2650A6320;
  objc_copyWeak(&v6, &location);
  [v3 _setAccessibilityLabelBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

id __73__PXPeopleCollectionViewCellAccessibility__accessibilityUnfavoriteButton__block_invoke(uint64_t a1)
{
  v2 = NSString;
  id v3 = accessibilityPhotosUICoreLocalizedString(@"remove.favorite");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v5 = [WeakRetained _accessibilityPersonName];
  id v6 = objc_msgSend(v2, "localizedStringWithFormat:", v3, v5);

  return v6;
}

- (id)automationElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  if ([(PXPeopleCollectionViewCellAccessibility *)self safeBoolForKey:@"isFavorite"])[(PXPeopleCollectionViewCellAccessibility *)self _accessibilityUnfavoriteButton]; {
  else
  }
  objc_super v4 = [(PXPeopleCollectionViewCellAccessibility *)self _accessibilityFavoriteButton];
  [v3 axSafelyAddObject:v4];

  return v3;
}

- (BOOL)_accessibilityToggleFavoriteActivate:(id)a3
{
  return 1;
}

uint64_t __80__PXPeopleCollectionViewCellAccessibility__accessibilityToggleFavoriteActivate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) toggleFavorite:0];
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  objc_super v4 = [(PXPeopleCollectionViewCellAccessibility *)self _accessibilityFavoriteButton];

  if (v4)
  {
    if ([(PXPeopleCollectionViewCellAccessibility *)self safeBoolForKey:@"isFavorite"])objc_super v5 = @"remove.favorite"; {
    else
    }
      objc_super v5 = @"add.favorite";
    id v6 = accessibilityPhotosUICoreLocalizedString(v5);
    id v7 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v6 target:self selector:sel__accessibilityToggleFavoriteActivate_];
    [v3 addObject:v7];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXPeopleCollectionViewCellAccessibility;
  v8 = [(PXPeopleCollectionViewCellAccessibility *)&v11 accessibilityCustomActions];
  v9 = [v3 arrayByAddingObjectsFromArray:v8];

  return v9;
}

@end