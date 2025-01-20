@interface SFAirDropActivityViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axDidPostScreenChangeAfterAppearance;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAddIfVisible:(id)a3 toArray:(id)a4;
- (void)_axAnnotateCollectionViewCellIfNeeded;
- (void)_axSetDidPostScreenChangeAfterAppearance:(BOOL)a3;
- (void)setSharedItemsAvailable:(BOOL)a3;
- (void)updateContentAreaAnimated:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SFAirDropActivityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFAirDropActivityViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFAirDropActivityViewController" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"SFAirDropActivityViewController" hasInstanceVariable:@"_collectionView" withType:"UICollectionView"];
  [v3 validateClass:@"SFAirDropActivityViewController" hasInstanceVariable:@"_airDropIconView" withType:"SFAirDropIconView"];
  [v3 validateClass:@"SFAirDropActivityViewController" hasInstanceVariable:@"_airDropActiveIconView" withType:"SFAirDropActiveIconView"];
  [v3 validateClass:@"SFAirDropActivityViewController" hasInstanceVariable:@"_noWifiTextView" withType:"UITextView"];
  [v3 validateClass:@"SFAirDropActivityViewController" hasInstanceVariable:@"_instructionsTextView" withType:"UITextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFAirDropActivityViewController", @"viewWillAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFAirDropActivityViewController", @"updateContentAreaAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFAirDropActivityViewController", @"setSharedItemsAvailable:", "v", "B", 0);
}

- (void)_axAddIfVisible:(id)a3 toArray:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if ([v6 _accessibilityViewIsVisible]) {
    [v5 addObject:v6];
  }
}

- (void)_axAnnotateCollectionViewCellIfNeeded
{
  id v3 = [(SFAirDropActivityViewControllerAccessibility *)self safeValueForKey:@"view"];
  id v14 = [v3 _accessibilityAncestorIsKindOf:objc_opt_class()];

  v4 = v14;
  if (v14)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    id v6 = [(SFAirDropActivityViewControllerAccessibility *)self safeValueForKey:@"_titleLabel"];
    [(SFAirDropActivityViewControllerAccessibility *)self _axAddIfVisible:v6 toArray:v5];

    v7 = [(SFAirDropActivityViewControllerAccessibility *)self safeValueForKey:@"_collectionView"];
    [(SFAirDropActivityViewControllerAccessibility *)self _axAddIfVisible:v7 toArray:v5];

    v8 = [(SFAirDropActivityViewControllerAccessibility *)self safeValueForKey:@"_airDropIconView"];
    [(SFAirDropActivityViewControllerAccessibility *)self _axAddIfVisible:v8 toArray:v5];

    v9 = [(SFAirDropActivityViewControllerAccessibility *)self safeValueForKey:@"_noWifiTextView"];
    [(SFAirDropActivityViewControllerAccessibility *)self _axAddIfVisible:v9 toArray:v5];

    v10 = [(SFAirDropActivityViewControllerAccessibility *)self safeValueForKey:@"_airDropActiveIconView"];
    [(SFAirDropActivityViewControllerAccessibility *)self _axAddIfVisible:v10 toArray:v5];

    v11 = [(SFAirDropActivityViewControllerAccessibility *)self safeValueForKey:@"_instructionsTextView"];
    [(SFAirDropActivityViewControllerAccessibility *)self _axAddIfVisible:v11 toArray:v5];

    [v14 setAccessibilityElements:v5];
    if ([(SFAirDropActivityViewControllerAccessibility *)self _axDidPostScreenChangeAfterAppearance])
    {
      UIAccessibilityNotifications v12 = *MEMORY[0x263F1CE18];
      v13 = 0;
    }
    else
    {
      [(SFAirDropActivityViewControllerAccessibility *)self _axSetDidPostScreenChangeAfterAppearance:1];
      UIAccessibilityNotifications v12 = *MEMORY[0x263F1CE68];
      v13 = (void *)*MEMORY[0x263F21A78];
    }
    UIAccessibilityPostNotification(v12, v13);

    v4 = v14;
  }
}

- (BOOL)_axDidPostScreenChangeAfterAppearance
{
  return MEMORY[0x270F0A438](self, &__SFAirDropActivityViewControllerAccessibility___axDidPostScreenChangeAfterAppearance);
}

- (void)_axSetDidPostScreenChangeAfterAppearance:(BOOL)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SFAirDropActivityViewControllerAccessibility *)self _axSetDidPostScreenChangeAfterAppearance:0];
  v5.receiver = self;
  v5.super_class = (Class)SFAirDropActivityViewControllerAccessibility;
  [(SFAirDropActivityViewControllerAccessibility *)&v5 viewWillAppear:v3];
  [(SFAirDropActivityViewControllerAccessibility *)self _axAnnotateCollectionViewCellIfNeeded];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropActivityViewControllerAccessibility;
  [(SFAirDropActivityViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SFAirDropActivityViewControllerAccessibility *)self _axAnnotateCollectionViewCellIfNeeded];
}

- (void)updateContentAreaAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SFAirDropActivityViewControllerAccessibility;
  -[SFAirDropActivityViewControllerAccessibility updateContentAreaAnimated:](&v5, sel_updateContentAreaAnimated_);
  if (v3) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else {
    [(SFAirDropActivityViewControllerAccessibility *)self _axAnnotateCollectionViewCellIfNeeded];
  }
  [(SFAirDropActivityViewControllerAccessibility *)self _axAnnotateCollectionViewCellIfNeeded];
}

uint64_t __74__SFAirDropActivityViewControllerAccessibility_updateContentAreaAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axAnnotateCollectionViewCellIfNeeded];
}

- (void)setSharedItemsAvailable:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFAirDropActivityViewControllerAccessibility;
  [(SFAirDropActivityViewControllerAccessibility *)&v4 setSharedItemsAvailable:a3];
  [(SFAirDropActivityViewControllerAccessibility *)self _axAnnotateCollectionViewCellIfNeeded];
}

@end