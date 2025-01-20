@interface PMiOSSliderViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axDraggingSlider;
- (id)_axLastSpokenSliderDescription;
- (id)_axMemoriesMoodSlider;
- (int64_t)_axMemoriesEditSliderType;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetMemoriesEditSliderType:(int64_t)a3;
- (void)_setAXDraggingSlider:(BOOL)a3;
- (void)_setAXLastSpokenSliderDescription:(id)a3;
- (void)_setAXMemoriesEditSliderType:(int64_t)a3;
- (void)_setAXMemoriesMoodSlider:(id)a3;
- (void)_setFontStyleForCell:(id)a3 highlighted:(BOOL)a4;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setSelectedItem:(int64_t)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation PMiOSSliderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PMiOSSliderViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PMiOSSliderViewController" isKindOfClass:@"UICollectionViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSSliderViewController", @"selectedItem", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSSliderViewController", @"provider", "@", 0);
  [v3 validateClass:@"PMiOSSliderViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSSliderViewController", @"viewDidLayoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSSliderViewController", @"setSelectedItem:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSSliderViewController", @"scrollViewWillBeginDragging:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSSliderViewController", @"scrollViewDidEndDragging: willDecelerate:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSSliderViewController", @"_setFontStyleForCell: highlighted:", "v", "@", "B", 0);
  [v3 validateProtocol:@"PMSliderProviderProtocol" hasRequiredInstanceMethod:@"displayNameForIndex:"];
}

- (id)_axMemoriesMoodSlider
{
}

- (void)_setAXMemoriesMoodSlider:(id)a3
{
}

- (int64_t)_axMemoriesEditSliderType
{
  return MEMORY[0x270F0A458](self, &__PMiOSSliderViewControllerAccessibility___axMemoriesEditSliderType);
}

- (void)_setAXMemoriesEditSliderType:(int64_t)a3
{
}

- (BOOL)_axDraggingSlider
{
  return MEMORY[0x270F0A438](self, &__PMiOSSliderViewControllerAccessibility___axDraggingSlider);
}

- (void)_setAXDraggingSlider:(BOOL)a3
{
}

- (id)_axLastSpokenSliderDescription
{
}

- (void)_setAXLastSpokenSliderDescription:(id)a3
{
}

- (void)_axSetMemoriesEditSliderType:(int64_t)a3
{
  -[PMiOSSliderViewControllerAccessibility _setAXMemoriesEditSliderType:](self, "_setAXMemoriesEditSliderType:");
  id v5 = [(PMiOSSliderViewControllerAccessibility *)self _axMemoriesMoodSlider];
  [v5 setSliderType:a3];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PMiOSSliderViewControllerAccessibility;
  [(PMiOSSliderViewControllerAccessibility *)&v3 viewDidLayoutSubviews];
  [(PMiOSSliderViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17.receiver = self;
  v17.super_class = (Class)PMiOSSliderViewControllerAccessibility;
  [(PMiOSSliderViewControllerAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  [(PMiOSSliderViewControllerAccessibility *)self _setAXDraggingSlider:0];
  objc_super v3 = [(PMiOSSliderViewControllerAccessibility *)self _axMemoriesMoodSlider];
  if (!v3)
  {
    objc_super v3 = [[AXMemoriesSlider alloc] initWithAccessibilityContainer:self];
    [(PMiOSSliderViewControllerAccessibility *)self safeIntegerForKey:@"selectedItem"];
    [(AXMemoriesSlider *)v3 setSliderType:[(PMiOSSliderViewControllerAccessibility *)self _axMemoriesEditSliderType]];
    v4 = [(PMiOSSliderViewControllerAccessibility *)self safeValueForKey:@"provider"];
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v10 = MEMORY[0x263EF8330];
    id v5 = v4;
    AXPerformSafeBlock();
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    [(AXMemoriesSlider *)v3 setSelectedDescription:v6];

    [(PMiOSSliderViewControllerAccessibility *)self _setAXMemoriesMoodSlider:v3];
    LOBYTE(v11) = 0;
    objc_opt_class();
    v7 = [(PMiOSSliderViewControllerAccessibility *)self safeValueForKey:@"view"];
    v8 = __UIAccessibilityCastAsClass();

    if ((_BYTE)v11) {
      abort();
    }
    v9 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v3, v10, 3221225472, __84__PMiOSSliderViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke, &unk_2650A3750);
    [v8 setAccessibilityElements:v9];
  }
}

uint64_t __84__PMiOSSliderViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) displayNameForIndex:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

- (void)setSelectedItem:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PMiOSSliderViewControllerAccessibility;
  [(PMiOSSliderViewControllerAccessibility *)&v14 setSelectedItem:a3];
  v4 = [(PMiOSSliderViewControllerAccessibility *)self _axMemoriesMoodSlider];
  if (v4)
  {
    id v5 = [(PMiOSSliderViewControllerAccessibility *)self safeValueForKey:@"provider"];
    [(PMiOSSliderViewControllerAccessibility *)self safeIntegerForKey:@"selectedItem"];
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy_;
    v12 = __Block_byref_object_dispose_;
    id v13 = 0;
    id v7 = v5;
    AXPerformSafeBlock();
    id v6 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
    [v4 setSelectedDescription:v6];
  }
}

uint64_t __58__PMiOSSliderViewControllerAccessibility_setSelectedItem___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) displayNameForIndex:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PMiOSSliderViewControllerAccessibility;
  [(PMiOSSliderViewControllerAccessibility *)&v4 scrollViewWillBeginDragging:a3];
  [(PMiOSSliderViewControllerAccessibility *)self _setAXDraggingSlider:1];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PMiOSSliderViewControllerAccessibility;
  [(PMiOSSliderViewControllerAccessibility *)&v5 scrollViewDidEndDragging:a3 willDecelerate:a4];
  [(PMiOSSliderViewControllerAccessibility *)self _setAXDraggingSlider:0];
}

- (void)_setFontStyleForCell:(id)a3 highlighted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PMiOSSliderViewControllerAccessibility;
  [(PMiOSSliderViewControllerAccessibility *)&v23 _setFontStyleForCell:v6 highlighted:v4];
  if ([(PMiOSSliderViewControllerAccessibility *)self _axDraggingSlider] && v4)
  {
    objc_opt_class();
    id v7 = [(PMiOSSliderViewControllerAccessibility *)self safeValueForKeyPath:@"collectionView"];
    uint64_t v8 = __UIAccessibilityCastAsClass();

    v9 = [v8 indexPathForCell:v6];
    uint64_t v10 = [(PMiOSSliderViewControllerAccessibility *)self safeValueForKey:@"provider"];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    id v11 = v10;
    id v12 = v9;
    AXPerformSafeBlock();
    id v13 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
    objc_super v14 = [(PMiOSSliderViewControllerAccessibility *)self _axLastSpokenSliderDescription];
    char v15 = [v13 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      if ([v13 isEqualToString:@"●"])
      {
        id v16 = accessibilityMemoriesLocalizedString(@"slider.value.neutral");
        UIAccessibilitySpeak();
      }
      else
      {
        UIAccessibilitySpeak();
      }
      [(PMiOSSliderViewControllerAccessibility *)self _setAXLastSpokenSliderDescription:v13];
    }
  }
}

uint64_t __75__PMiOSSliderViewControllerAccessibility__setFontStyleForCell_highlighted___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "displayNameForIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));

  return MEMORY[0x270F9A758]();
}

@end