@interface MUPDFContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axAKOverlayView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axHighlightPopoverDismissed;
- (void)_axHighlightPopoverPresentedForAnnotation:(id)a3 withHighlightController:(id)a4 pullFocus:(BOOL)a5;
- (void)loadContentWithCompletionBlock:(id)a3;
@end

@implementation MUPDFContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPDFContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AKOverlayView"];
  [v3 validateClass:@"AKHighlightColorEditorController"];
  [v3 validateClass:@"AKAnnotationLayer"];
  [v3 validateClass:@"MUPDFContentViewController" isKindOfClass:@"MUContentViewController"];
  [v3 validateClass:@"AKHighlightColorEditorController" isKindOfClass:@"AKAnnotationPopoverViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPDFContentViewController", @"pdfView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUContentViewController", @"annotationController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKController", @"pageControllers", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKController", @"currentPageIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKPageController", @"overlayView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKOverlayView", @"pageController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKPageController", @"highlightColorEditorController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKHighlightColorEditorController", @"calloutBar", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKAnnotationLayer", @"annotation", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"view", "@", 0);
  [v3 validateClass:@"AKAnnotationPopoverViewController" hasInstanceVariable:@"mAnnotation" withType:"AKAnnotation"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPDFContentViewController", @"loadContentWithCompletionBlock:", "v", "@?", 0);
}

- (id)_axAKOverlayView
{
  v2 = [(MUPDFContentViewControllerAccessibility *)self safeValueForKey:@"annotationController"];
  objc_opt_class();
  id v3 = [v2 safeValueForKey:@"pageControllers"];
  v4 = __UIAccessibilityCastAsClass();

  unint64_t v5 = [v2 safeUnsignedIntegerForKey:@"currentPageIndex"];
  if (v5 >= [v4 count])
  {
    v7 = 0;
  }
  else
  {
    v6 = [v4 objectAtIndex:v5];
    v7 = [v6 safeValueForKey:@"overlayView"];
  }

  return v7;
}

- (void)loadContentWithCompletionBlock:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MUPDFContentViewControllerAccessibility;
  [(MUPDFContentViewControllerAccessibility *)&v4 loadContentWithCompletionBlock:a3];
  [(MUPDFContentViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MUPDFContentViewControllerAccessibility;
  [(MUPDFContentViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MUPDFContentViewControllerAccessibility *)self _axAKOverlayView];
  MEMORY[0x245653790](@"AKOverlayView");
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = [v3 safeValueForKeyPath:@"pageController.highlightColorEditorController"];
    unint64_t v5 = [v4 safeValueForKey:@"mAnnotation"];
    [(MUPDFContentViewControllerAccessibility *)self _axHighlightPopoverPresentedForAnnotation:v5 withHighlightController:v4 pullFocus:0];
  }
}

- (void)_axHighlightPopoverPresentedForAnnotation:(id)a3 withHighlightController:(id)a4 pullFocus:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(MUPDFContentViewControllerAccessibility *)self _axAKOverlayView];
  MEMORY[0x245653790](@"AKOverlayView");
  if (objc_opt_isKindOfClass())
  {
    MEMORY[0x245653790](@"AKHighlightColorEditorController");
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v9 safeValueForKey:@"calloutBar"];
      v12 = (void *)v11;
      if (v11)
      {
        v24 = v9;
        id argument = (id)v11;
        v22 = self;
        BOOL v23 = v5;
        v13 = [v10 accessibilityElements];
        v14 = (void *)[v13 mutableCopy];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v27;
          while (2)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              MEMORY[0x245653790](@"AKAnnotationLayer");
              if (objc_opt_isKindOfClass())
              {
                v21 = [v20 safeValueForKey:@"annotation"];
                if ([v21 isEqual:v8])
                {
                  objc_msgSend(v15, "insertObject:atIndex:", argument, objc_msgSend(v15, "indexOfObject:", v20));

                  goto LABEL_16;
                }
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        [v10 setAccessibilityElements:v15];
        id v9 = v24;
        [v24 _accessibilitySetAssignedValue:v22 forKey:@"AXCalloutBarDelegate"];
        v12 = argument;
        if (v23) {
          UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
        }
      }
    }
  }
}

- (void)_axHighlightPopoverDismissed
{
  v2 = [(MUPDFContentViewControllerAccessibility *)self _axAKOverlayView];
  [v2 _accessibilitySetRetainedValue:0 forKey:@"AXAKRetainedElements"];

  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v3, 0);
}

@end