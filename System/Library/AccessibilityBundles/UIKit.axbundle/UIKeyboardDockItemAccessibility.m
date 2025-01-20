@interface UIKeyboardDockItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)button;
@end

@implementation UIKeyboardDockItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardDockItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardDockItem", @"button", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)button
{
  v43 = self;
  v42[1] = (id)a2;
  v41.receiver = self;
  v41.super_class = (Class)UIKeyboardDockItemAccessibility;
  v42[0] = [(UIKeyboardDockItemAccessibility *)&v41 button];
  objc_initWeak(&location, v43);
  id v8 = v42[0];
  uint64_t v34 = MEMORY[0x263EF8330];
  int v35 = -1073741824;
  int v36 = 0;
  v37 = __41__UIKeyboardDockItemAccessibility_button__block_invoke;
  v38 = &unk_2650AE108;
  objc_copyWeak(&v39, &location);
  [v8 _setAccessibilityValueBlock:&v34];
  id v7 = v42[0];
  uint64_t v28 = MEMORY[0x263EF8330];
  int v29 = -1073741824;
  int v30 = 0;
  v31 = __41__UIKeyboardDockItemAccessibility_button__block_invoke_2;
  v32 = &unk_2650AE108;
  objc_copyWeak(v33, &location);
  [v7 _setAccessibilityLabelBlock:&v28];
  id v6 = v42[0];
  uint64_t v22 = MEMORY[0x263EF8330];
  int v23 = -1073741824;
  int v24 = 0;
  v25 = __41__UIKeyboardDockItemAccessibility_button__block_invoke_3;
  v26 = &unk_2650AE108;
  objc_copyWeak(&v27, &location);
  [v6 _setAccessibilityHintBlock:&v22];
  id v5 = v42[0];
  uint64_t v16 = MEMORY[0x263EF8330];
  int v17 = -1073741824;
  int v18 = 0;
  v19 = __41__UIKeyboardDockItemAccessibility_button__block_invoke_4;
  v20 = &unk_2650AE108;
  objc_copyWeak(&v21, &location);
  [v5 _setAccessibilityIdentifierBlock:&v16];
  objc_initWeak(&v15, v42[0]);
  id v4 = v42[0];
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  v12 = __41__UIKeyboardDockItemAccessibility_button__block_invoke_5;
  v13 = &unk_2650ADF60;
  objc_copyWeak(&v14, &v15);
  [v4 _setIsAccessibilityElementBlock:&v9];
  id v3 = v42[0];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v27);
  objc_destroyWeak(v33);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
  objc_storeStrong(v42, 0);

  return v3;
}

id __41__UIKeyboardDockItemAccessibility_button__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[WeakRetained accessibilityValue];

  return v3;
}

id __41__UIKeyboardDockItemAccessibility_button__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[WeakRetained accessibilityLabel];

  return v3;
}

id __41__UIKeyboardDockItemAccessibility_button__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[WeakRetained accessibilityHint];

  return v3;
}

id __41__UIKeyboardDockItemAccessibility_button__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[WeakRetained accessibilityIdentifier];

  return v3;
}

uint64_t __41__UIKeyboardDockItemAccessibility_button__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained _accessibilityViewIsVisible];

  return v3 & 1;
}

@end