@interface PRWidgetIconViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetWidgetView;
- (void)viewDidLayoutSubviews;
@end

@implementation PRWidgetIconViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRWidgetIconViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRWidgetIconViewController", @"widgetHostViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRWidgetIconViewController", @"complicationDescriptor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRComplicationDescriptor", @"widgetDescriptor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRWidgetGridViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRWidgetGridViewController", @"model", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRWidgetGridModel", @"removeComplicationDescriptor:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRComplicationContainerViewController", @"widgetGridViewController:didRequestConfigurationForComplicationDescriptor:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRWidgetIconViewController", @"viewDidLayoutSubviews", "v", 0);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PRWidgetIconViewControllerAccessibility;
  [(PRWidgetIconViewControllerAccessibility *)&v3 viewDidLayoutSubviews];
  [(PRWidgetIconViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PRWidgetIconViewControllerAccessibility;
  [(PRWidgetIconViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PRWidgetIconViewControllerAccessibility *)self _axSetWidgetView];
}

- (void)_axSetWidgetView
{
  LOBYTE(location[0]) = 0;
  objc_opt_class();
  objc_super v3 = [(PRWidgetIconViewControllerAccessibility *)self safeValueForKey:@"widgetHostViewController"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 view];
  v6 = [v4 delegate];
  v7 = [v6 safeValueForKey:@"delegate"];
  v8 = [(PRWidgetIconViewControllerAccessibility *)self safeValueForKey:@"complicationDescriptor"];
  v9 = [v8 safeValueForKey:@"widget"];
  objc_initWeak(location, v7);
  id v10 = objc_alloc(MEMORY[0x263F1C390]);
  v11 = [(PRWidgetIconViewControllerAccessibility *)self safeValueForKeyPath:@"complicationDescriptor.widgetDescriptor"];
  v12 = AXRemoveWidgetLabel(v11);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __59__PRWidgetIconViewControllerAccessibility__axSetWidgetView__block_invoke;
  v27[3] = &unk_265145F08;
  id v13 = v6;
  id v28 = v13;
  id v14 = v8;
  id v29 = v14;
  v15 = (void *)[v10 initWithName:v12 actionHandler:v27];

  if (AXIsWidgetConfigurable(v9))
  {
    id v16 = objc_alloc(MEMORY[0x263F1C390]);
    v17 = accessibilityLocalizedString(@"edit.widget.label");
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __59__PRWidgetIconViewControllerAccessibility__axSetWidgetView__block_invoke_3;
    v23[3] = &unk_265145F58;
    objc_copyWeak(&v26, location);
    id v24 = v13;
    id v25 = v14;
    v18 = (void *)[v16 initWithName:v17 actionHandler:v23];

    objc_destroyWeak(&v26);
  }
  else
  {
    v18 = 0;
  }
  v19 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v15, v18);
  [v5 setAccessibilityCustomActions:v19];

  [v5 setIsAccessibilityElement:AXProcessIsSpringBoard() ^ 1];
  uint64_t v20 = [v5 accessibilityTraits];
  [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v20];
  v21 = [v14 safeValueForKey:@"widgetDescriptor"];
  v22 = AXWidgetAndAppName(v21, 0);
  [v5 setAccessibilityLabel:v22];

  objc_destroyWeak(location);
}

uint64_t __59__PRWidgetIconViewControllerAccessibility__axSetWidgetView__block_invoke(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

void __59__PRWidgetIconViewControllerAccessibility__axSetWidgetView__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) safeValueForKey:@"model"];
  id v2 = (id)[v3 removeComplicationDescriptor:*(void *)(a1 + 40)];
}

uint64_t __59__PRWidgetIconViewControllerAccessibility__axSetWidgetView__block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v7, a1 + 6);
  id v5 = a1[4];
  id v6 = a1[5];
  AXPerformSafeBlock();

  objc_destroyWeak(&v7);
  return 1;
}

void __59__PRWidgetIconViewControllerAccessibility__axSetWidgetView__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained widgetGridViewController:*(void *)(a1 + 32) didRequestConfigurationForComplicationDescriptor:*(void *)(a1 + 40)];
}

@end