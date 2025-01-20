@interface UIStatusBarBackgroundActivityItemAccessibility
@end

@implementation UIStatusBarBackgroundActivityItemAccessibility

id __76___UIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = AXStatusBarPillTimeView(WeakRetained);
  id v2 = (id)[v3 accessibilityLabel];
  id v5 = (id)__UIAXStringForVariables();

  return v5;
}

id __76___UIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = AXStatusBarPillTimeView(WeakRetained);
  id v2 = (id)[v3 accessibilityLabel];
  id v5 = (id)__UIAXStringForVariables();

  return v5;
}

void __93___UIStatusBarBackgroundActivityItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) safeValueForKey:@"setNeedsUpdate"];
  id v5 = (id)[*(id *)(a1 + 32) safeUIViewForKey:@"backgroundView"];
  id v4 = (id)[v5 _accessibilityAncestorIsKindOf:objc_opt_class()];
  [v4 forceUpdate:1];

  NSClassFromString(&cfstr_Uistatusbarpil_1.isa);
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[*(id *)(a1 + 32) safeUIViewForKey:@"combinedView"];
    id v2 = (id)[v3 _accessibilityAncestorIsKindOf:objc_opt_class()];
    [v2 forceUpdate:1];
  }
}

uint64_t __82___UIStatusBarBackgroundActivityItemAccessibility__axSetupIconViewWithUpdateData___block_invoke()
{
  return 1;
}

id __82___UIStatusBarBackgroundActivityItemAccessibility__axSetupIconViewWithUpdateData___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end