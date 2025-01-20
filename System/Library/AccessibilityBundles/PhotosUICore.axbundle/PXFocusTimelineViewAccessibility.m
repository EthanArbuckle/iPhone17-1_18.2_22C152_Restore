@interface PXFocusTimelineViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axFocusTimelineViewAXElements;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (void)_setAXFocusTimelineViewAXElements:(id)a3;
- (void)layoutSubviews;
@end

@implementation PXFocusTimelineViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXFocusTimelineView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axFocusTimelineViewAXElements
{
}

- (void)_setAXFocusTimelineViewAXElements:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXFocusTimelineView", @"layoutSubviews", "v", 0);
  [v3 validateClass:@"PXFocusTimelineView" hasInstanceVariable:@"_focusEventsView" withType:"UIView"];
  [v3 validateClass:@"PXFocusTimelineView" hasInstanceVariable:@"_focusEvents" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXFocusTimelineView", @"_axDescriptionForFocusEvent:", "@", 0);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityPhotosUICoreLocalizedString(@"photos.focus.timeline");
}

- (id)accessibilityElements
{
  id v3 = [(PXFocusTimelineViewAccessibility *)self _axFocusTimelineViewAXElements];
  if (!v3)
  {
    v26.receiver = self;
    v26.super_class = (Class)PXFocusTimelineViewAccessibility;
    v4 = [(PXFocusTimelineViewAccessibility *)&v26 accessibilityElements];
    if (v4)
    {
      v25.receiver = self;
      v25.super_class = (Class)PXFocusTimelineViewAccessibility;
      v5 = [(PXFocusTimelineViewAccessibility *)&v25 accessibilityElements];
      v6 = (void *)[v5 mutableCopy];
    }
    else
    {
      v6 = [MEMORY[0x263EFF980] array];
    }

    v7 = [(PXFocusTimelineViewAccessibility *)self safeUIViewForKey:@"_focusEventsView"];
    v8 = [(PXFocusTimelineViewAccessibility *)self safeArrayForKey:@"_focusEvents"];
    v9 = [v7 subviews];
    v10 = (void *)[v9 mutableCopy];

    [v10 sortUsingSelector:sel_accessibilityCompareGeometry_];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x4010000000;
    v22[3] = "";
    long long v11 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    long long v23 = *MEMORY[0x263F001A0];
    long long v24 = v11;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __57__PXFocusTimelineViewAccessibility_accessibilityElements__block_invoke;
    v21[3] = &unk_2650A6138;
    v21[4] = v22;
    v12 = objc_msgSend(v10, "ax_filteredArrayUsingBlock:", v21);
    v13 = (void *)[v12 mutableCopy];

    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __57__PXFocusTimelineViewAccessibility_accessibilityElements__block_invoke_2;
    v16[3] = &unk_2650A6160;
    id v14 = v13;
    id v17 = v14;
    objc_copyWeak(&v19, &location);
    id v3 = v6;
    id v18 = v3;
    [v8 enumerateObjectsUsingBlock:v16];
    [(PXFocusTimelineViewAccessibility *)self _setAXFocusTimelineViewAXElements:v3];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    _Block_object_dispose(v22, 8);
  }

  return v3;
}

BOOL __57__PXFocusTimelineViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  [a2 accessibilityFrame];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  if (CGRectEqualToRect(v10, *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32))) {
    return 0;
  }
  v9 = *(CGFloat **)(*(void *)(a1 + 32) + 8);
  v9[4] = x;
  v9[5] = y;
  v9[6] = width;
  v9[7] = height;
  return a2 != 0;
}

void __57__PXFocusTimelineViewAccessibility_accessibilityElements__block_invoke_2(id *a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if ([a1[4] count] > a3)
  {
    v6 = [a1[4] objectAtIndex:a3];
    [v6 setIsAccessibilityElement:1];
    MEMORY[0x2455E3C60](@"PXFocusTimelineEvent");
    if (objc_opt_isKindOfClass())
    {
      id v7 = v5;
      v8 = [v7 accessibilityFocusEventTimeString];
      v9 = [v7 accessibilityFocusEventTypeString];
      CGRect v10 = __UIAXStringForVariables();
      objc_msgSend(v6, "setAccessibilityLabel:", v10, v9, @"__AXStringForVariablesSentinel");

      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x3032000000;
      id v18 = __Block_byref_object_copy__1;
      id v19 = __Block_byref_object_dispose__1;
      id v20 = 0;
      objc_copyWeak(&v14, a1 + 6);
      id v13 = v7;
      AXPerformSafeBlock();
      id v11 = (id)v16[5];

      objc_destroyWeak(&v14);
      _Block_object_dispose(&v15, 8);

      [v6 setAccessibilityValue:v11];
      [v6 setAccessibilityTraits:*MEMORY[0x263F1CF18]];
      v12 = accessibilityPhotosUICoreLocalizedString(@"focus.hint");
      [v6 setAccessibilityHint:v12];
    }
    [a1[5] axSafelyAddObject:v6];
  }
}

void __57__PXFocusTimelineViewAccessibility_accessibilityElements__block_invoke_497(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained _axDescriptionForFocusEvent:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXFocusTimelineViewAccessibility;
  [(PXFocusTimelineViewAccessibility *)&v3 layoutSubviews];
  [(PXFocusTimelineViewAccessibility *)self _setAXFocusTimelineViewAXElements:0];
}

@end