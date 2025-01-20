@interface LargeLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation LargeLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.LargeLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.LargeLockupCollectionViewCell", @"accessibilityEmbeddedView", "@", 0);
  [v3 validateClass:@"ShelfKitCollectionViews.LargeLockupCollectionViewCell" hasSwiftField:@"deletionButton" withSwiftType:"Optional<MTMPButton>"];
  [v3 validateClass:@"MTMPButton" isKindOfClass:@"UIView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)LargeLockupCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(LargeLockupCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return (id)[(LargeLockupCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityEmbeddedView"];
}

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(LargeLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityEmbeddedView"];
  v5 = [v4 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v5];

  v6 = [(LargeLockupCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"deletionButton"];
  [v6 alpha];
  if (v7 > 0.0)
  {
    id v8 = objc_alloc(MEMORY[0x263F1C390]);
    v9 = accessibilityLocalizedString(@"delete.button");
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __72__LargeLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v18[3] = &unk_2651441C0;
    id v19 = v6;
    v10 = (void *)[v8 initWithName:v9 actionHandler:v18];

    [v3 axSafelyAddObject:v10];
  }
  objc_initWeak(&location, self);
  id v11 = objc_alloc(MEMORY[0x263F1C390]);
  v12 = accessibilityLocalizedString(@"show.context.menu");
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__LargeLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2;
  v15[3] = &unk_265144210;
  objc_copyWeak(&v16, &location);
  v13 = (void *)[v11 initWithName:v12 actionHandler:v15];

  [v3 axSafelyAddObject:v13];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v3;
}

uint64_t __72__LargeLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __72__LargeLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityShowContextMenuForElement:WeakRetained targetPointValue:0];

  return 1;
}

- (id)accessibilityUserInputLabels
{
  v2 = [(LargeLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityEmbeddedView"];
  id v3 = [v2 accessibilityUserInputLabels];

  return v3;
}

@end