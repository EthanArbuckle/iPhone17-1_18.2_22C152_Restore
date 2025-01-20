@interface PowerSwooshCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PowerSwooshCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.PowerSwooshCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PowerSwooshCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PowerSwooshCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  objc_super v3 = UIAXStringForAllChildren();
  if ([v3 length])
  {
    uint64_t v4 = UIAXStringForAllChildren();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PowerSwooshCellAccessibility;
    uint64_t v4 = [(PowerSwooshCellAccessibility *)&v7 accessibilityLabel];
  }
  v5 = (void *)v4;

  return v5;
}

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x263F1C390]);
  v5 = accessibilityLocalizedString(@"show.context.menu");
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __58__PowerSwooshCellAccessibility_accessibilityCustomActions__block_invoke;
  v11 = &unk_265144210;
  objc_copyWeak(&v12, &location);
  v6 = (void *)[v4 initWithName:v5 actionHandler:&v8];

  objc_msgSend(v3, "axSafelyAddObject:", v6, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v3;
}

uint64_t __58__PowerSwooshCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityShowContextMenuForElement:WeakRetained targetPointValue:0];

  return 1;
}

@end