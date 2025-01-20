@interface VKCImageTextSelectionView_iOSAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axHighlightSelectableItems;
- (BOOL)_axShouldHaveAccessibilityElements;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)accessibilityContainerType;
- (unint64_t)accessibilityTraits;
- (void)setHighlightSelectableItems:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation VKCImageTextSelectionView_iOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKCImageTextSelectionView_iOS";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCImageTextSelectionView", @"highlightSelectableItems", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCImageTextSelectionView_iOS", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCImageTextSelectionView", @"setHighlightSelectableItems:animated:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCImageTextSelectionView_iOS", @"selectable", "B", 0);
  [v3 validateClass:@"VKCImageTextSelectionView_iOS" isKindOfClass:@"VKCImageTextSelectionView"];
  [v3 validateClass:@"VKCImageTextSelectionView_iOS" conformsToProtocol:@"UITextInput"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCImageTextSelectionView_iOS", @"isEditable", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCImageTextSelectionView_iOS", @"text", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)_axShouldHaveAccessibilityElements
{
  if ([(VKCImageTextSelectionView_iOSAccessibility *)self _axHighlightSelectableItems]
    || AXRequestingClient() == 11)
  {
    return 1;
  }
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.Magnifier"];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  if ([(VKCImageTextSelectionView_iOSAccessibility *)self _axShouldHaveAccessibilityElements])
  {
    return *MEMORY[0x263F21B60] | *MEMORY[0x263F1CF48];
  }
  v4.receiver = self;
  v4.super_class = (Class)VKCImageTextSelectionView_iOSAccessibility;
  return [(VKCImageTextSelectionView_iOSAccessibility *)&v4 accessibilityTraits];
}

- (id)accessibilityElements
{
  if ([(VKCImageTextSelectionView_iOSAccessibility *)self _axShouldHaveAccessibilityElements])
  {
    id v3 = (void *)MEMORY[0x263F81490];
    objc_super v4 = [(VKCImageTextSelectionView_iOSAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
    char v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      v7 = self;
      if (v7)
      {
        uint64_t v12 = 0;
        v13 = &v12;
        uint64_t v14 = 0x3032000000;
        v15 = __Block_byref_object_copy_;
        v16 = __Block_byref_object_dispose_;
        id v17 = [MEMORY[0x263EFF980] array];
        v8 = [(VKCImageTextSelectionView_iOSAccessibility *)v7 safeStringForKey:@"text"];
        uint64_t v9 = [v8 length];
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __67__VKCImageTextSelectionView_iOSAccessibility_accessibilityElements__block_invoke;
        v11[3] = &unk_265167598;
        v11[4] = v7;
        v11[5] = &v12;
        objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 1, v11);
        if ([(id)v13[5] count]) {
          [(VKCImageTextSelectionView_iOSAccessibility *)v7 _accessibilitySetRetainedValue:v13[5] forKey:*v3];
        }
        id v6 = (id)v13[5];

        _Block_object_dispose(&v12, 8);
      }
      else
      {
        id v6 = (id)MEMORY[0x263EFFA68];
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (int64_t)accessibilityContainerType
{
  if ([(VKCImageTextSelectionView_iOSAccessibility *)self _axShouldHaveAccessibilityElements])
  {
    return 4;
  }
  v4.receiver = self;
  v4.super_class = (Class)VKCImageTextSelectionView_iOSAccessibility;
  return [(VKCImageTextSelectionView_iOSAccessibility *)&v4 accessibilityContainerType];
}

- (id)accessibilityLabel
{
  if ([(VKCImageTextSelectionView_iOSAccessibility *)self _axShouldHaveAccessibilityElements])
  {
    id v3 = accessibilityLocalizedString(@"detected.text.element");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VKCImageTextSelectionView_iOSAccessibility;
    id v3 = [(VKCImageTextSelectionView_iOSAccessibility *)&v5 accessibilityLabel];
  }

  return v3;
}

- (id)accessibilityValue
{
  if ([(VKCImageTextSelectionView_iOSAccessibility *)self _axShouldHaveAccessibilityElements])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VKCImageTextSelectionView_iOSAccessibility;
    id v3 = [(VKCImageTextSelectionView_iOSAccessibility *)&v5 accessibilityValue];
  }

  return v3;
}

- (void)setHighlightSelectableItems:(BOOL)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)VKCImageTextSelectionView_iOSAccessibility;
  [(VKCImageTextSelectionView_iOSAccessibility *)&v6 setHighlightSelectableItems:a3 animated:a4];
  if (!a3) {
    [(VKCImageTextSelectionView_iOSAccessibility *)self _accessibilitySetRetainedValue:0 forKey:*MEMORY[0x263F81490]];
  }
}

- (BOOL)_axHighlightSelectableItems
{
  return [(VKCImageTextSelectionView_iOSAccessibility *)self safeBoolForKey:@"highlightSelectableItems"];
}

@end