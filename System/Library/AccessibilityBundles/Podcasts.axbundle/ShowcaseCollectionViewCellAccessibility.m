@interface ShowcaseCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
@end

@implementation ShowcaseCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.ShowcaseCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ShowcaseCollectionViewCell", @"accessibilityCaptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ShowcaseCollectionViewCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ShowcaseCollectionViewCell", @"accessibilitySubtitleLabel", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(ShowcaseCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityCaptionLabel, accessibilityTitleLabel, accessibilitySubtitleLabel"];
}

- (id)accessibilityUserInputLabels
{
  objc_opt_class();
  id v3 = [(ShowcaseCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityCaptionLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = __UIAXStringForVariables();
  v6 = MEMORY[0x24565B6D0](v5);

  return v6;
}

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x263F1C390]);
  v5 = accessibilityLocalizedString(@"show.context.menu");
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __69__ShowcaseCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
  v11 = &unk_265144210;
  objc_copyWeak(&v12, &location);
  v6 = (void *)[v4 initWithName:v5 actionHandler:&v8];

  objc_msgSend(v3, "axSafelyAddObject:", v6, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v3;
}

uint64_t __69__ShowcaseCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityShowContextMenuForElement:WeakRetained targetPointValue:0];

  return 1;
}

@end