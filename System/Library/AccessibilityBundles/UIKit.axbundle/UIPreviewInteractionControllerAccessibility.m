@interface UIPreviewInteractionControllerAccessibility
@end

@implementation UIPreviewInteractionControllerAccessibility

void __112___UIPreviewInteractionControllerAccessibility__preparePreviewViewControllerPresentationFromPreviewInteraction___block_invoke(id *a1)
{
  v12[2] = a1;
  v12[1] = a1;
  char v11 = 0;
  objc_opt_class();
  id v7 = (id)[a1[4] safeValueForKey:@"currentPresentationController"];
  id v10 = (id)__UIAccessibilityCastAsClass();

  id v9 = v10;
  objc_storeStrong(&v10, 0);
  v12[0] = v9;
  id v8 = (id)[v9 safeUIViewForKey:@"contentPlatterView"];
  [v8 setIsAccessibilityElement:1];
  id v1 = v8;
  id v2 = (id)UIKitAccessibilityLocalizedString();
  objc_msgSend(v1, "setAccessibilityLabel:");

  [v8 setAccessibilityIdentifier:@"PreviewContainerElement"];
  uint64_t v3 = (uint64_t)a1[4];
  id v5 = (id)[v12[0] presentedViewController];
  id v4 = -[_UIPreviewInteractionControllerAccessibility _accessibilityCustomActionsFromPresentedViewController:](v3, v5);
  objc_msgSend(v8, "setAccessibilityCustomActions:");

  objc_storeStrong(&v8, 0);
  objc_storeStrong(v12, 0);
}

uint64_t __72___UIPreviewInteractionControllerAccessibility__axPerformPreviewAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 48) _accessibilityDismissPresentation];
}

void __77___UIPreviewInteractionControllerAccessibility__accessibilityShowMoreActions__block_invoke(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  v2[0] = (id)[a1[4] safeValueForKey:@"previewActionsController"];
  id argument = (id)[v2[0] safeValueForKey:@"previewActionsView"];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(v2, 0);
}

uint64_t __81___UIPreviewInteractionControllerAccessibility__accessibilityDismissPresentation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissPreviewViewControllerIfNeeded", a1, a1);
}

@end