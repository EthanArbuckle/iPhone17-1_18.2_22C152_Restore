@interface AKColorPaletteViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axLoadCellAccessibility:(id)a3 atIndexPath:(id)a4;
@end

@implementation AKColorPaletteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKColorPaletteView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKColorPaletteView", @"collectionView: cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKColorPaletteView", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKColorPaletteView", @"colors", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKColorPaletteView", @"color", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)AKColorPaletteViewAccessibility;
  [(AKColorPaletteViewAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  char v16 = 0;
  objc_opt_class();
  id v3 = [(AKColorPaletteViewAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(v4, "indexPathsForVisibleItems", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = [v4 cellForItemAtIndexPath:v10];
        [(AKColorPaletteViewAccessibility *)self _axLoadCellAccessibility:v11 atIndexPath:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_axLoadCellAccessibility:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setIsAccessibilityElement:1];
  LOBYTE(v15) = 0;
  objc_opt_class();
  uint64_t v8 = [(AKColorPaletteViewAccessibility *)self safeValueForKey:@"colors"];
  v9 = __UIAccessibilityCastAsClass();

  unint64_t v10 = [v7 row];
  if (v10 < [v9 count])
  {
    v11 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));
    long long v12 = AXColorStringForColor();
    [v6 setAccessibilityLabel:v12];

    uint64_t v15 = 0;
    char v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id v13 = v11;
    AXPerformSafeBlock();
    if (*((unsigned char *)v16 + 24)) {
      uint64_t v14 = *MEMORY[0x263F1CF38];
    }
    else {
      uint64_t v14 = 0;
    }
    [v6 setAccessibilityTraits:v14 | *MEMORY[0x263F1CEE8]];

    _Block_object_dispose(&v15, 8);
  }
}

void __72__AKColorPaletteViewAccessibility__axLoadCellAccessibility_atIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"color"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 akIsEqualToColor:*(void *)(a1 + 40)];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AKColorPaletteViewAccessibility;
  id v6 = a4;
  id v7 = [(AKColorPaletteViewAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[AKColorPaletteViewAccessibility _axLoadCellAccessibility:atIndexPath:](self, "_axLoadCellAccessibility:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

@end