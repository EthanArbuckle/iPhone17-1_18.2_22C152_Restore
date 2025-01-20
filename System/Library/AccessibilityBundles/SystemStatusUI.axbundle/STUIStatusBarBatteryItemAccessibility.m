@interface STUIStatusBarBatteryItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (STUIStatusBarBatteryItemAccessibility)init;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation STUIStatusBarBatteryItemAccessibility

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)STUIStatusBarBatteryItemAccessibility;
  v8 = [(STUIStatusBarBatteryItemAccessibility *)&v22 applyUpdate:v6 toDisplayItem:v7];
  v9 = [v7 safeValueForKey:@"identifier"];
  v10 = [(id)objc_opt_class() safeValueForKey:@"percentDisplayIdentifier"];
  if ([v9 isEqual:v10])
  {
    v11 = [(STUIStatusBarBatteryItemAccessibility *)self safeUIViewForKey:@"batteryView"];
    objc_initWeak(&location, v11);
    v12 = [(STUIStatusBarBatteryItemAccessibility *)self safeUIViewForKey:@"percentView"];
    objc_initWeak(&from, v12);
    if ([v7 safeBoolForKey:@"isEnabled"])
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __67__STUIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke;
      v17[3] = &unk_26515C920;
      v13 = &v18;
      objc_copyWeak(&v18, &location);
      objc_copyWeak(&v19, &from);
      [v11 _setAccessibilityFrameBlock:v17];
      objc_destroyWeak(&v19);
    }
    else
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __67__STUIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke_2;
      v15[3] = &unk_26515C948;
      v13 = &v16;
      objc_copyWeak(&v16, &location);
      [v11 _setAccessibilityFrameBlock:v15];
    }
    objc_destroyWeak(v13);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarBatteryItemAccessibility;
  [(STUIStatusBarBatteryItemAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(STUIStatusBarBatteryItemAccessibility *)self safeValueForKey:@"percentView"];
  [v3 setIsAccessibilityElement:0];
}

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarBatteryItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarBatteryItem", @"batteryView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarBatteryItem", @"percentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarDisplayItem", @"isEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarItem", @"identifier", "@", 0);
  [v3 validateClass:@"STUIStatusBarBatteryItem" isKindOfClass:@"STUIStatusBarItem"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"STUIStatusBarBatteryItem", @"percentDisplayIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarBatteryItem", @"applyUpdate:toDisplayItem:", "@", "@", "@", 0);
}

- (STUIStatusBarBatteryItemAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarBatteryItemAccessibility;
  v2 = [(STUIStatusBarBatteryItemAccessibility *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(STUIStatusBarBatteryItemAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  }
  return v3;
}

double __67__STUIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 frame];
  v35.origin.double x = v12;
  v35.origin.double y = v13;
  v35.size.double width = v14;
  v35.size.double height = v15;
  v33.origin.double x = v5;
  v33.origin.double y = v7;
  v33.size.double width = v9;
  v33.size.double height = v11;
  CGRect v34 = CGRectUnion(v33, v35);
  double x = v34.origin.x;
  double y = v34.origin.y;
  double width = v34.size.width;
  double height = v34.size.height;
  v20 = [WeakRetained superview];
  objc_msgSend(v20, "convertRect:toView:", 0, x, y, width, height);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  v29 = [WeakRetained window];
  objc_msgSend(v29, "convertRect:toWindow:", 0, v22, v24, v26, v28);
  double v31 = v30;

  return v31;
}

double __67__STUIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained superview];
  [WeakRetained frame];
  objc_msgSend(v2, "convertRect:toView:", 0);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  CGFloat v11 = [WeakRetained window];
  objc_msgSend(v11, "convertRect:toWindow:", 0, v4, v6, v8, v10);
  double v13 = v12;

  return v13;
}

@end