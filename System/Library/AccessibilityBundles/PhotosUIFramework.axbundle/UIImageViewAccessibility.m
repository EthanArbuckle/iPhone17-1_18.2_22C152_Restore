@interface UIImageViewAccessibility
@end

@implementation UIImageViewAccessibility

BOOL __78__UIImageViewAccessibility__PhotosUI__UIKit__accessibilityZoomAtPoint_zoomIn___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Puusertransfor_0.isa);
  if (objc_opt_isKindOfClass())
  {
    [v2 frame];
    BOOL v5 = v4 == *(double *)(MEMORY[0x263F00148] + 8) && v3 == *MEMORY[0x263F00148];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __78__UIImageViewAccessibility__PhotosUI__UIKit__accessibilityZoomAtPoint_zoomIn___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __78__UIImageViewAccessibility__PhotosUI__UIKit__accessibilityZoomAtPoint_zoomIn___block_invoke_3;
  v3[3] = &unk_2650A8210;
  id v4 = v2;
  char v5 = *(unsigned char *)(a1 + 40);
  [v4 _performZoomAndScrollChanges:v3];
}

void __78__UIImageViewAccessibility__PhotosUI__UIKit__accessibilityZoomAtPoint_zoomIn___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_scrollView"];
  double v3 = __UIAccessibilitySafeClass();

  [v3 zoomScale];
  double v5 = v4;
  [v3 maximumZoomScale];
  double v7 = v6;
  [v3 minimumZoomScale];
  double v9 = (v7 - v8) / 10.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v9 = -v9;
  }
  [v3 setZoomScale:1 animated:v5 + v9];
  [v3 zoomScale];
  uint64_t v15 = MEMORY[0x263EF8330];
  id v16 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
  UIAccessibilityNotifications v10 = *MEMORY[0x263F1CDC8];
  v11 = NSString;
  v12 = UIKitAccessibilityLocalizedString();
  v13 = AXFormatFloat();
  v14 = objc_msgSend(v11, "stringWithFormat:", v12, v13, v15, 3221225472, __78__UIImageViewAccessibility__PhotosUI__UIKit__accessibilityZoomAtPoint_zoomIn___block_invoke_4, &unk_2650A81E8);
  UIAccessibilityPostNotification(v10, v14);
}

uint64_t __78__UIImageViewAccessibility__PhotosUI__UIKit__accessibilityZoomAtPoint_zoomIn___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setDesiredZoomScale:*(double *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _setEnabledInteractions:7];
}

uint64_t __65__UIImageViewAccessibility__PhotosUI__UIKit__liftableSubjectView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Vkcimagesubjec.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end