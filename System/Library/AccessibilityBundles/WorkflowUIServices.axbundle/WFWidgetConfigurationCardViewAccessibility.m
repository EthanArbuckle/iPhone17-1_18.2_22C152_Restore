@interface WFWidgetConfigurationCardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axHandleClosePopupAction;
- (id)__axClosePopupElement;
- (id)_accessibilityAdditionalElements;
- (id)_axClosePopupElement;
- (void)__axSetClosePopupElement:(id)a3;
@end

@implementation WFWidgetConfigurationCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFWidgetConfigurationCardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFWidgetConfigurationCardView", @"delegate", "@", 0);
  [v3 validateProtocol:@"WFWidgetConfigurationCardViewDelegate" hasMethod:@"widgetConfigurationCardViewDidRequestToClose:" isInstanceMethod:1 isRequired:1];
}

- (id)_accessibilityAdditionalElements
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(WFWidgetConfigurationCardViewAccessibility *)self _axClosePopupElement];
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)__axClosePopupElement
{
}

- (void)__axSetClosePopupElement:(id)a3
{
}

- (id)_axClosePopupElement
{
  id v3 = [(WFWidgetConfigurationCardViewAccessibility *)self __axClosePopupElement];

  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    v5 = accessibilityLocalizedString(@"dismiss.popup");
    [v4 setAccessibilityLabel:v5];

    [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__WFWidgetConfigurationCardViewAccessibility__axClosePopupElement__block_invoke;
    v10[3] = &unk_265169F50;
    objc_copyWeak(&v11, &location);
    [v4 _setAccessibilityFrameBlock:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__WFWidgetConfigurationCardViewAccessibility__axClosePopupElement__block_invoke_2;
    v8[3] = &unk_265169F78;
    objc_copyWeak(&v9, &location);
    [v4 _setAccessibilityActivateBlock:v8];
    [(WFWidgetConfigurationCardViewAccessibility *)self __axSetClosePopupElement:v4];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  v6 = [(WFWidgetConfigurationCardViewAccessibility *)self __axClosePopupElement];

  return v6;
}

double __66__WFWidgetConfigurationCardViewAccessibility__axClosePopupElement__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _accessibilityBounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  CGRectGetMidY(v16);
  id v12 = objc_loadWeakRetained(v1);
  UIAccessibilityFrameToBounds();
  double v14 = v13;

  return v14;
}

uint64_t __66__WFWidgetConfigurationCardViewAccessibility__axClosePopupElement__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _axHandleClosePopupAction];

  return v2;
}

- (BOOL)_axHandleClosePopupAction
{
  return 1;
}

void __71__WFWidgetConfigurationCardViewAccessibility__axHandleClosePopupAction__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_delegate"];
  [v2 widgetConfigurationCardViewDidRequestToClose:*(void *)(a1 + 32)];
}

@end