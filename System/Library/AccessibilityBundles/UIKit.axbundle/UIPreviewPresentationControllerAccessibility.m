@interface UIPreviewPresentationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation UIPreviewPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPreviewPresentationController";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPreviewPresentationController", @"_handleDismissGestureRecognizer:", "v", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)accessibilityPerformEscape
{
  v8[2] = self;
  v8[1] = (id)a2;
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  v6 = __74__UIPreviewPresentationControllerAccessibility_accessibilityPerformEscape__block_invoke;
  v7 = &unk_2650ADF18;
  v8[0] = self;
  AXPerformSafeBlock();
  objc_storeStrong(v8, 0);
  return 1;
}

uint64_t __74__UIPreviewPresentationControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDismissGestureRecognizer:", 0, a1, a1);
}

void __68___UIPreviewPresentationControllerAccessibility__axShowMoreActions___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CE18];
  id v2 = (id)[*(id *)(a1 + 32) safeValueForKey:@"previewActionSheet"];
  UIAccessibilityPostNotification(notification, v2);
}

uint64_t __72___UIPreviewPresentationControllerAccessibility__axPerformLeadingAction__block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = (id)[*(id *)(a1 + 40) safeValueForKey:@"presentedViewController"];
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);

  return [*(id *)(a1 + 40) _dismissPresentation];
}

uint64_t __73___UIPreviewPresentationControllerAccessibility__axPerformTrailingAction__block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = (id)[*(id *)(a1 + 40) safeValueForKey:@"presentedViewController"];
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);

  return [*(id *)(a1 + 40) _dismissPresentation];
}

uint64_t __82___UIPreviewPresentationControllerAccessibility__accessibilityDismissPresentation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissPresentation", a1, a1);
}

void __93___UIPreviewPresentationControllerAccessibility__presentSubActionSheetForPreviewActionGroup___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CE18];
  id v2 = (id)[*(id *)(a1 + 32) safeValueForKey:@"previewActionSheet"];
  UIAccessibilityPostNotification(notification, v2);
}

@end