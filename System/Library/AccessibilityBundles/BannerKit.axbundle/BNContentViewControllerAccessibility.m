@interface BNContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axPresentableForViewController:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupBannerVC:(id)a3;
- (void)addChildViewController:(id)a3;
- (void)presentPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5;
@end

@implementation BNContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BNContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BNContentViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"BNContentViewController" hasInstanceVariable:@"_presentables" withType:"BNTieredArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BNTieredArray", @"allObjects", "@", 0);
  [v3 validateProtocol:@"BNPresentable" hasOptionalInstanceMethod:@"viewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BNContentViewController", @"_dismissPresentable:withReason:animated:userInfo:", "v", "@", "@", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BNContentViewController", @"presentPresentable:withOptions:userInfo:", "v", "@", "Q", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)BNContentViewControllerAccessibility;
  [(BNContentViewControllerAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  char v13 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = objc_msgSend(v3, "childViewControllers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(BNContentViewControllerAccessibility *)self _axMarkupBannerVC:*(void *)(*((void *)&v9 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)addChildViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BNContentViewControllerAccessibility;
  id v4 = a3;
  [(BNContentViewControllerAccessibility *)&v5 addChildViewController:v4];
  -[BNContentViewControllerAccessibility _axMarkupBannerVC:](self, "_axMarkupBannerVC:", v4, v5.receiver, v5.super_class);
}

- (void)presentPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = [v9 objectForKey:@"com.apple.DragUI.druid.DRPasteAnnouncementAccessibilityDescriptionKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setAccessibilityLabel:v10];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)BNContentViewControllerAccessibility;
  [(BNContentViewControllerAccessibility *)&v11 presentPresentable:v8 withOptions:a4 userInfo:v9];
}

- (void)_axMarkupBannerVC:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 view];
  [v5 _setAccessibilityAutomationType:8];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  uint64_t v6 = [v4 view];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  objc_super v14 = __58__BNContentViewControllerAccessibility__axMarkupBannerVC___block_invoke;
  v15 = &unk_26510D6F8;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  [v6 _setAccessibilityPerformEscapeBlock:&v12];

  uint64_t v7 = -[BNContentViewControllerAccessibility _axPresentableForViewController:](self, "_axPresentableForViewController:", v4, v12, v13, v14, v15);
  id v8 = [v4 view];
  id v9 = [v7 accessibilityLabel];
  objc_msgSend(v8, "setIsAccessibilityElement:", objc_msgSend(v9, "length") != 0);

  long long v10 = [v4 view];
  objc_super v11 = [v7 accessibilityLabel];
  [v10 setAccessibilityLabel:v11];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

BOOL __58__BNContentViewControllerAccessibility__axMarkupBannerVC___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained _axPresentableForViewController:v3];
  if (v4)
  {
    id v6 = v3;
    AXPerformSafeBlock();
  }
  return v4 != 0;
}

void __58__BNContentViewControllerAccessibility__axMarkupBannerVC___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _axPresentableForViewController:*(void *)(a1 + 40)];
  [v1 _dismissPresentable:v2 withReason:@"Accessibility" animated:1 userInfo:0];
}

- (id)_axPresentableForViewController:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  objc_super v5 = [(BNContentViewControllerAccessibility *)self safeValueForKey:@"_presentables"];
  id v6 = [v5 safeArrayForKey:@"allObjects"];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__BNContentViewControllerAccessibility__axPresentableForViewController___block_invoke;
  v10[3] = &unk_26510D720;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v6 enumerateObjectsUsingBlock:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __72__BNContentViewControllerAccessibility__axPresentableForViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 safeValueForKey:@"viewController"];
  id v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

@end