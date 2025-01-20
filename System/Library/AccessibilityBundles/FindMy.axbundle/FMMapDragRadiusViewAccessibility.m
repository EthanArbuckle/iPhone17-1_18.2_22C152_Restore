@interface FMMapDragRadiusViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axInitialHandleState;
- (void)_axSetUpHandleImageView;
- (void)initialize;
@end

@implementation FMMapDragRadiusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FMMapDragRadiusView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"handleImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"initialize", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"isDragging", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"isMinimum", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"isMaximum", "B", 0);
  [v3 validateProtocol:@"FMMapDragRadiusViewDelegate" hasRequiredInstanceMethod:@"willStartDraggingHandle:"];
  [v3 validateProtocol:@"FMMapDragRadiusViewDelegate" hasRequiredInstanceMethod:@"didStopDraggingHandle:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"setIsDragging:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"setIsMaximum:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"setIsMinimum:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"currentHandleDistance", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"currentHandleDistanceNormalized", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"popAnimateHandle", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"_axSetCustomRadius:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"minPoint", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"maxPoint", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"usesMetric", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"maximumRadiusNormalized", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMMapDragRadiusView", @"minimumRadiusNormalized", "d", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)FMMapDragRadiusViewAccessibility;
  [(FMMapDragRadiusViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(FMMapDragRadiusViewAccessibility *)self _axInitialHandleState];
  [(FMMapDragRadiusViewAccessibility *)self _axSetUpHandleImageView];
}

- (void)_axInitialHandleState
{
  LOBYTE(v7[0]) = 0;
  objc_opt_class();
  objc_super v3 = [(FMMapDragRadiusViewAccessibility *)self safeValueForKey:@"handleImageView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 frame];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3010000000;
  v7[3] = &unk_242135045;
  long long v8 = *MEMORY[0x263F00148];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3010000000;
  v5[3] = &unk_242135045;
  long long v6 = v8;
  AXPerformSafeBlock();
  AXPerformSafeBlock();
  AXPerformSafeBlock();
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);
}

uint64_t __57__FMMapDragRadiusViewAccessibility__axInitialHandleState__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) maxPoint];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
  uint64_t result = [*(id *)(a1 + 32) minPoint];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v8;
  return result;
}

uint64_t __57__FMMapDragRadiusViewAccessibility__axInitialHandleState__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsMaximum:1];
}

uint64_t __57__FMMapDragRadiusViewAccessibility__axInitialHandleState__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsMaximum:0];
}

uint64_t __57__FMMapDragRadiusViewAccessibility__axInitialHandleState__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsMinimum:1];
}

uint64_t __57__FMMapDragRadiusViewAccessibility__axInitialHandleState__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsMinimum:0];
}

- (void)initialize
{
  v3.receiver = self;
  v3.super_class = (Class)FMMapDragRadiusViewAccessibility;
  [(FMMapDragRadiusViewAccessibility *)&v3 initialize];
  [(FMMapDragRadiusViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_axSetUpHandleImageView
{
  LOBYTE(location) = 0;
  objc_opt_class();
  objc_super v3 = [(FMMapDragRadiusViewAccessibility *)self safeValueForKey:@"handleImageView"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  [v4 setIsAccessibilityElement:1];
  v5 = accessibilityLocalizedString(@"location.range.handle");
  [v4 setAccessibilityLabel:v5];

  uint64_t v6 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CED8] | v6];
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke;
  v15[3] = &unk_265120EF0;
  objc_copyWeak(&v16, &from);
  [v4 _setAccessibilityValueBlock:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_3;
  v13[3] = &unk_265120EF0;
  objc_copyWeak(&v14, &from);
  [v4 _setAccessibilityHintBlock:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_4;
  v10[3] = &unk_265120F18;
  objc_copyWeak(&v11, &from);
  objc_copyWeak(&v12, &location);
  [v4 _setAccessibilityIncrementBlock:v10];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_8;
  v7[3] = &unk_265120F18;
  objc_copyWeak(&v8, &from);
  objc_copyWeak(&v9, &location);
  [v4 _setAccessibilityDecrementBlock:v7];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

id __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained safeBoolForKey:@"isMinimum"];

  id v4 = objc_loadWeakRetained(v1);
  int v5 = [v4 safeBoolForKey:@"isMaximum"];

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0x10000000000000;
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FEFFFFFFFFFFFFFLL;
  objc_copyWeak(&v16, v1);
  AXPerformSafeBlock();
  if (v5)
  {
    double v6 = v18[3];
  }
  else
  {
    uint64_t v7 = v22;
    if (v3) {
      uint64_t v7 = v21;
    }
    double v8 = *(double *)(v7[1] + 24);
    double v6 = v18[3];
    if (v6 > (double)(unint64_t)v8)
    {
      unint64_t v9 = (unint64_t)v8;
      goto LABEL_8;
    }
  }
  unint64_t v9 = (unint64_t)v6;
LABEL_8:
  id v10 = objc_loadWeakRetained(v1);
  int v11 = [v10 usesMetric];

  id v12 = NSString;
  if (v11) {
    accessibilityLocalizedString(@"distance.in.meters");
  }
  else {
  v13 = accessibilityLocalizedString(@"distance.in.feet");
  }
  id v14 = objc_msgSend(v12, "stringWithFormat:", v13, v9);

  objc_destroyWeak(&v16);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);

  return v14;
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained minimumRadiusNormalized];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;

  id v5 = objc_loadWeakRetained(v2);
  [v5 maximumRadiusNormalized];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;

  id v8 = objc_loadWeakRetained(v2);
  [v8 currentHandleDistanceNormalized];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
}

id __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained safeBoolForKey:@"isMinimum"];

  if (v3)
  {
    uint64_t v4 = @"distance.minimum.reached";
LABEL_5:
    uint64_t v7 = accessibilityLocalizedString(v4);
    goto LABEL_7;
  }
  id v5 = objc_loadWeakRetained(v1);
  int v6 = [v5 safeBoolForKey:@"isMaximum"];

  if (v6)
  {
    uint64_t v4 = @"distance.maximum.reached";
    goto LABEL_5;
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained safeValueForKey:@"delegate"];

  char v11 = 0;
  objc_opt_class();
  id v5 = objc_loadWeakRetained(v2);
  int v6 = __UIAccessibilityCastAsClass();

  objc_copyWeak(&v9, v2);
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v7 = v6;
  id v8 = v4;
  AXPerformSafeBlock();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_5(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setIsDragging:1];

  id v4 = objc_loadWeakRetained(v2);
  [v4 setIsMaximum:0];

  id v5 = objc_loadWeakRetained(v2);
  [v5 setIsMinimum:0];

  id v6 = objc_loadWeakRetained(a1 + 7);
  [v6 setHighlighted:1];

  [a1[4] setNeedsDisplay];
  id v7 = a1[5];
  id v8 = NSProtocolFromString(&cfstr_Fmmapdragradiu_1.isa);
  LODWORD(v7) = [v7 conformsToProtocol:v8];

  if (v7)
  {
    id v9 = a1[5];
    id v10 = objc_loadWeakRetained(v2);
    [v9 willStartDraggingHandle:v10];
  }
  id v11 = objc_loadWeakRetained(a1 + 7);
  [v11 frame];
  double v13 = v12;
  CGFloat v15 = v14;

  double v16 = v13 + 3.0;
  id v17 = objc_loadWeakRetained(v2);
  [v17 maxPoint];
  double v19 = v18;

  if (v16 > v19)
  {
    id v20 = objc_loadWeakRetained(v2);
    [v20 setIsMaximum:1];

    v21 = accessibilityLocalizedString(@"distance.maximum.reached");
    UIAccessibilitySpeakOrQueueIfNeeded();

    double v16 = v19;
  }
  v45.size.double width = 24.0;
  v45.size.double height = 24.0;
  v45.origin.double x = v16;
  v45.origin.double y = v15;
  CGRect v46 = CGRectIntegral(v45);
  double x = v46.origin.x;
  double y = v46.origin.y;
  double width = v46.size.width;
  double height = v46.size.height;
  id v26 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v26, "setFrame:", x, y, width, height);

  [a1[4] setNeedsDisplay];
  id v27 = objc_loadWeakRetained(v2);
  char v28 = [v27 safeBoolForKey:@"isMaximum"];

  if (v28)
  {
    double v29 = 241401.0;
  }
  else
  {
    id v30 = objc_loadWeakRetained(v2);
    [v30 currentHandleDistance];
    double v29 = v31;
  }
  id v32 = objc_loadWeakRetained(v2);
  [v32 _axSetCustomRadius:v29];

  objc_initWeak(&location, a1[4]);
  dispatch_time_t v33 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_6;
  block[3] = &unk_265120F18;
  objc_copyWeak(&v42, v2);
  objc_copyWeak(&v43, &location);
  v34 = MEMORY[0x263EF83A0];
  dispatch_after(v33, MEMORY[0x263EF83A0], block);
  objc_initWeak(&from, a1[5]);
  dispatch_time_t v35 = dispatch_time(0, 300000000);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_7;
  v36[3] = &unk_265120F40;
  objc_copyWeak(&v37, &from);
  objc_copyWeak(&v38, v2);
  objc_copyWeak(&v39, &location);
  dispatch_after(v35, v34, v36);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsDragging:0];

  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 setNeedsDisplay];
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_7(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v3 = objc_loadWeakRetained(a1 + 5);
  [WeakRetained didStopDraggingHandle:v3];

  id v4 = objc_loadWeakRetained(a1 + 5);
  [v4 popAnimateHandle];

  id v5 = objc_loadWeakRetained(a1 + 6);
  [v5 setNeedsDisplay];
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_8(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained safeValueForKey:@"delegate"];

  char v11 = 0;
  objc_opt_class();
  id v5 = objc_loadWeakRetained(v2);
  id v6 = __UIAccessibilityCastAsClass();

  objc_copyWeak(&v9, v2);
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v7 = v6;
  id v8 = v4;
  AXPerformSafeBlock();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_9(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setIsDragging:1];

  id v4 = objc_loadWeakRetained(v2);
  [v4 setIsMaximum:0];

  id v5 = objc_loadWeakRetained(v2);
  [v5 setIsMinimum:0];

  id v6 = objc_loadWeakRetained(a1 + 7);
  [v6 setHighlighted:1];

  [a1[4] setNeedsDisplay];
  id v7 = a1[5];
  id v8 = NSProtocolFromString(&cfstr_Fmmapdragradiu_1.isa);
  LODWORD(v7) = [v7 conformsToProtocol:v8];

  if (v7)
  {
    id v9 = a1[5];
    id v10 = objc_loadWeakRetained(v2);
    [v9 willStartDraggingHandle:v10];
  }
  id v11 = objc_loadWeakRetained(a1 + 7);
  [v11 frame];
  double v13 = v12;
  CGFloat v15 = v14;

  double v16 = v13 + -3.0;
  id v17 = objc_loadWeakRetained(v2);
  [v17 minPoint];
  double v19 = v18;

  if (v16 < v19)
  {
    id v20 = objc_loadWeakRetained(v2);
    [v20 setIsMinimum:1];

    v21 = accessibilityLocalizedString(@"distance.minimum.reached");
    UIAccessibilitySpeakOrQueueIfNeeded();

    double v16 = v19;
  }
  v45.size.double width = 24.0;
  v45.size.double height = 24.0;
  v45.origin.double x = v16;
  v45.origin.double y = v15;
  CGRect v46 = CGRectIntegral(v45);
  double x = v46.origin.x;
  double y = v46.origin.y;
  double width = v46.size.width;
  double height = v46.size.height;
  id v26 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v26, "setFrame:", x, y, width, height);

  [a1[4] setNeedsDisplay];
  id v27 = objc_loadWeakRetained(v2);
  char v28 = [v27 safeBoolForKey:@"isMinimum"];

  if (v28)
  {
    double v29 = 100.0;
  }
  else
  {
    id v30 = objc_loadWeakRetained(v2);
    [v30 currentHandleDistance];
    double v29 = v31;
  }
  id v32 = objc_loadWeakRetained(v2);
  [v32 _axSetCustomRadius:v29];

  objc_initWeak(&location, a1[4]);
  dispatch_time_t v33 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_10;
  block[3] = &unk_265120F18;
  objc_copyWeak(&v42, v2);
  objc_copyWeak(&v43, &location);
  v34 = MEMORY[0x263EF83A0];
  dispatch_after(v33, MEMORY[0x263EF83A0], block);
  objc_initWeak(&from, a1[5]);
  dispatch_time_t v35 = dispatch_time(0, 300000000);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_11;
  v36[3] = &unk_265120F40;
  objc_copyWeak(&v37, &from);
  objc_copyWeak(&v38, v2);
  objc_copyWeak(&v39, &location);
  dispatch_after(v35, v34, v36);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsDragging:0];

  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 setNeedsDisplay];
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_11(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v3 = objc_loadWeakRetained(a1 + 5);
  [WeakRetained didStopDraggingHandle:v3];

  id v4 = objc_loadWeakRetained(a1 + 5);
  [v4 popAnimateHandle];

  id v5 = objc_loadWeakRetained(a1 + 6);
  [v5 setNeedsDisplay];
}

@end