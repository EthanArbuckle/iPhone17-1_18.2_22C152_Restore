@interface CRCameraReaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityCameraView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
- (void)sendDidFindTarget:(id)a3 frameTime:(id *)a4;
- (void)sendDidRecognizeNewObjects:(id)a3;
- (void)startSession;
@end

@implementation CRCameraReaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CRCameraReader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CALayer", @"superlayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CRCameraReader", @"sessionManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CRDefaultCaptureSessionManager", @"previewLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CRCameraReader", @"alignmentLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CRAlignmentLayer", @"outlineLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CRCameraReader", @"sendDidFindTarget:frameTime:", "v", "@", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CRCameraReader", @"sendDidRecognizeNewObjects:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CRCameraReader", @"startSession", "v", 0);
}

- (void)sendDidFindTarget:(id)a3 frameTime:(id *)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CRCameraReaderAccessibility;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v41 = *a4;
  [(CRCameraReaderAccessibility *)&v49 sendDidFindTarget:v6 frameTime:&v41];
  v7 = [(CRCameraReaderAccessibility *)self safeValueForKey:@"sessionManager"];
  v8 = [v7 safeValueForKey:@"previewLayer"];
  v9 = [MEMORY[0x263EFF980] array];
  v10 = [v8 safeValueForKey:@"bounds"];
  [v10 CGRectValue];
  CGFloat v39 = v12;
  CGFloat v40 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v6;
  uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v46;
    int v19 = 1;
    double v20 = 2.22507386e-308;
    double v21 = 1.79769313e308;
    double v36 = *(double *)(MEMORY[0x263F00148] + 8);
    double v37 = *MEMORY[0x263F00148];
    double v22 = 1.79769313e308;
    double v23 = 2.22507386e-308;
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(obj);
        }
        v25 = *(NSString **)(*((void *)&v45 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CGPoint v26 = CGPointFromString(v25);
          objc_msgSend(v7, "convertCameraPoint:toLayer:", v8, v26.x, v26.y);
        }
        else
        {
          objc_opt_class();
          double v29 = v36;
          double v30 = v37;
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          [(NSString *)v25 CGPointValue];
          objc_msgSend(v7, "convertCameraPoint:toLayer:", v8);
        }
        double v30 = v27;
        double v29 = v28;
LABEL_11:
        v31 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v30, v29);
        [v9 addObject:v31];

        v53.origin.y = v39;
        v53.origin.x = v40;
        v53.size.width = v14;
        v53.size.height = v16;
        v52.x = v30;
        v52.y = v29;
        v19 &= CGRectContainsPoint(v53, v52);
        if (v30 < v22) {
          double v22 = v30;
        }
        if (v29 < v21) {
          double v21 = v29;
        }
        if (v30 > v23) {
          double v23 = v30;
        }
        if (v29 > v20) {
          double v20 = v29;
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (!v17)
      {

        if (!v19) {
          goto LABEL_30;
        }
        goto LABEL_24;
      }
    }
  }

  double v22 = 1.79769313e308;
  double v23 = 2.22507386e-308;
  double v20 = 2.22507386e-308;
  double v21 = 1.79769313e308;
LABEL_24:
  v41.var0 = 0;
  *(void *)&v41.var1 = &v41;
  v41.var3 = 0x4010000000;
  v42 = &unk_2420BA6B5;
  long long v43 = 0u;
  long long v44 = 0u;
  AXPerformSafeBlock();
  double v32 = (v23 - v22) * (v20 - v21);
  double v33 = *(double *)(*(void *)&v41.var1 + 48);
  double v34 = *(double *)(*(void *)&v41.var1 + 56);
  _Block_object_dispose(&v41, 8);
  if (v32 > v33 * v34 * 0.5 && v32 < v33 * v34 * 1.2) {
    UIAccessibilityPostNotification(0x40Bu, 0);
  }
LABEL_30:
  ++sendDidFindTarget_frameTime__counter;
}

void __59__CRCameraReaderAccessibility_sendDidFindTarget_frameTime___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) safeValueForKey:@"alignmentLayer"];
  v2 = [v8 safeValueForKey:@"outlineLayer"];
  [v2 bounds];
  id v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CRCameraReaderAccessibility;
  [(CRCameraReaderAccessibility *)&v3 loadView];
  [(CRCameraReaderAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)startSession
{
  v4.receiver = self;
  v4.super_class = (Class)CRCameraReaderAccessibility;
  [(CRCameraReaderAccessibility *)&v4 startSession];
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CRCameraReaderAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"AnnouncedStatusActions"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CRCameraReaderAccessibility;
  [(CRCameraReaderAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(CRCameraReaderAccessibility *)self _accessibilityCameraView];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityIdentifier:@"CardCaptureViewFinder"];
  objc_super v4 = accessibilityLocalizedString(@"camera.viewfinder");
  [v3 setAccessibilityLabel:v4];

  uint64_t v5 = [(CRCameraReaderAccessibility *)self accessibilityHint];
  if (!v5)
  {
    uint64_t v5 = accessibilityLocalizedString(@"camera.scan.card.hint");
  }
  [v3 setAccessibilityHint:v5];
  [v3 _setAccessibilityServesAsFirstElement:1];
}

- (id)_accessibilityCameraView
{
  objc_super v3 = [(CRCameraReaderAccessibility *)self safeValueForKey:@"sessionManager"];
  objc_super v4 = [v3 safeValueForKey:@"previewLayer"];
  uint64_t v5 = [v4 safeValueForKey:@"superlayer"];

  objc_super v6 = [(CRCameraReaderAccessibility *)self safeUIViewForKey:@"view"];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__CRCameraReaderAccessibility__accessibilityCameraView__block_invoke;
  v10[3] = &unk_26511B1B8;
  id v11 = v5;
  id v7 = v5;
  id v8 = [v6 _accessibilityFindSubviewDescendant:v10];

  return v8;
}

BOOL __55__CRCameraReaderAccessibility__accessibilityCameraView__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 layer];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)sendDidRecognizeNewObjects:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"code"];
  objc_super v6 = [v4 objectForKey:@"cardholderName"];
  id v7 = [v4 objectForKey:@"expirationDate"];
  id v8 = [(CRCameraReaderAccessibility *)self _accessibilityValueForKey:@"AnnouncedStatusActions"];
  v24.receiver = self;
  v24.super_class = (Class)CRCameraReaderAccessibility;
  [(CRCameraReaderAccessibility *)&v24 sendDidRecognizeNewObjects:v4];

  if (v5 && v6 && v7)
  {
    UIAccessibilityNotifications v9 = *MEMORY[0x263F1CDC8];
    v10 = accessibilityLocalizedString(@"camera.creditcard.allinfo.found");
    UIAccessibilityPostNotification(v9, v10);
  }
  else
  {
    if ([v5 length])
    {
      id v11 = [v8 objectForKey:@"code"];

      if (!v11)
      {
        UIAccessibilityNotifications v12 = *MEMORY[0x263F1CDC8];
        double v13 = accessibilityLocalizedString(@"camera.card.number.found");
        UIAccessibilityPostNotification(v12, v13);

        [v8 setValue:MEMORY[0x263EFFA88] forKey:@"code"];
      }
    }
    if ([v6 length])
    {
      CGFloat v14 = [v8 objectForKey:@"cardholderName"];

      if (!v14)
      {
        UIAccessibilityNotifications v15 = *MEMORY[0x263F1CDC8];
        CGFloat v16 = NSString;
        uint64_t v17 = accessibilityLocalizedString(@"camera.card.holder.found");
        uint64_t v18 = objc_msgSend(v16, "stringWithFormat:", v17, v6);
        UIAccessibilityPostNotification(v15, v18);

        [v8 setValue:MEMORY[0x263EFFA88] forKey:@"cardholderName"];
      }
    }
    if ([v7 length])
    {
      int v19 = [v8 objectForKey:@"expirationDate"];

      if (!v19)
      {
        UIAccessibilityNotifications v20 = *MEMORY[0x263F1CDC8];
        double v21 = NSString;
        double v22 = accessibilityLocalizedString(@"camera.card.expiration.found");
        double v23 = objc_msgSend(v21, "stringWithFormat:", v22, v7);
        UIAccessibilityPostNotification(v20, v23);

        [v8 setValue:MEMORY[0x263EFFA88] forKey:@"expirationDate"];
      }
    }
  }
}

@end