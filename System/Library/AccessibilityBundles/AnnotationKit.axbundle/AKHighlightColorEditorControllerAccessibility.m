@interface AKHighlightColorEditorControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didHide;
- (void)presentFromRect:(CGRect)a3 view:(id)a4;
@end

@implementation AKHighlightColorEditorControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKHighlightColorEditorController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AKHighlightAnnotation"];
  [v3 validateClass:@"AKAnnotationTheme"];
  [v3 validateClass:@"AKHighlightColorEditorController" isKindOfClass:@"AKAnnotationPopoverViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKAnnotationPopoverViewController", @"annotation", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKAnnotationPopoverViewController", @"annotationTheme", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKHighlightAnnotation", @"color", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKHighlightAnnotation", @"style", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKAnnotationTheme", @"pageTheme", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKHighlightColorEditorController", @"presentFromRect: view:", "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKHighlightColorEditorController", @"p_setStyle: forAnnotation:", "v", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKHighlightColorEditorController", @"p_updateAppearance", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKHighlightColorEditorController", @"p_colorForTag: pageTheme:", "@", "q", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKAnnotationPopoverViewController", @"didHide", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)AKHighlightColorEditorControllerAccessibility;
  [(AKHighlightColorEditorControllerAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AKHighlightColorEditorControllerAccessibility *)self safeValueForKey:@"annotation"];
  MEMORY[0x245640800](@"AKHighlightAnnotation");
  if (objc_opt_isKindOfClass())
  {
    if ([v3 safeUnsignedIntegerForKey:@"style"] != 2)
    {
      v4 = [(AKHighlightColorEditorControllerAccessibility *)self safeValueForKey:@"annotationTheme"];
      MEMORY[0x245640800](@"AKAnnotationTheme");
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = [v4 safeIntForKey:@"pageTheme"];
        v6 = [v3 safeValueForKey:@"color"];
        for (uint64_t i = 1; i != 7; ++i)
        {
          v8 = [(AKHighlightColorEditorControllerAccessibility *)self p_colorForTag:i pageTheme:v5];
          char v9 = UIAccessibilityColorEqualToColor();

          if (v9) {
            break;
          }
        }
      }
    }
    id v10 = v3;
    AXPerformSafeBlock();
  }
}

uint64_t __91__AKHighlightColorEditorControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "p_setStyle:forAnnotation:", *(void *)(a1 + 48), *(void *)(a1 + 40));
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "p_updateAppearance");
}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AKHighlightColorEditorControllerAccessibility;
  -[AKHighlightColorEditorControllerAccessibility presentFromRect:view:](&v5, sel_presentFromRect_view_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AKHighlightColorEditorControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)didHide
{
  v4.receiver = self;
  v4.super_class = (Class)AKHighlightColorEditorControllerAccessibility;
  [(AKHighlightColorEditorControllerAccessibility *)&v4 didHide];
  id v3 = [(AKHighlightColorEditorControllerAccessibility *)self _accessibilityValueForKey:@"AXCalloutBarDelegate"];
  MEMORY[0x245640800](@"MUPDFContentViewController");
  if (objc_opt_isKindOfClass()) {
    [v3 _axHighlightPopoverDismissed];
  }
}

@end