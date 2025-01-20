@interface PDFDocumentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsUsingPDFExtensionView;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_axGetPDFView;
- (id)_axPageViews;
- (void)_axSetPageViews:(id)a3;
- (void)layoutDocumentView;
- (void)updateVisibility;
@end

@implementation PDFDocumentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PDFDocumentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axPageViews
{
}

- (void)_axSetPageViews:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PDFDocumentView" hasInstanceVariable:@"_private" withType:"PDFDocumentViewPrivate"];
  [v3 validateClass:@"PDFDocumentViewPrivate" hasInstanceVariable:@"pdfView" withType:"PDFView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFView", @"extensionViewZoomScale", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFView", @"extensionViewBoundsInDocument", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFView", @"renderingProperties", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFRenderingProperties", @"isUsingPDFExtensionView", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFDocumentView", @"updateVisibility", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFDocumentView", @"layoutDocumentView", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if ([(PDFDocumentViewAccessibility *)self _axIsUsingPDFExtensionView])
  {
    v8 = [(PDFDocumentViewAccessibility *)self _axGetPDFView];
    [v8 safeCGFloatForKey:@"extensionViewZoomScale"];
    double v10 = v9;
    [v8 safeCGRectForKey:@"extensionViewBoundsInDocument"];
    double v12 = v11;
    double v14 = v13;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_opt_class();
    v15 = __UIAccessibilityCastAsClass();
    double v16 = y / v10;
    double v17 = x / v10 + v12;
    double v18 = v16 + v14;
    v19 = [v15 subviews];

    id v20 = (id)[v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v27;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          objc_msgSend(v23, "convertPoint:fromView:", self, v17, v18);
          if (objc_msgSend(v23, "pointInside:withEvent:", v7))
          {
            id v20 = v23;
            goto LABEL_13;
          }
        }
        id v20 = (id)[v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    v24 = objc_msgSend(v20, "_accessibilityHitTest:withEvent:", v7, v17, v18);
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)PDFDocumentViewAccessibility;
    v24 = -[PDFDocumentViewAccessibility _accessibilityHitTest:withEvent:](&v30, sel__accessibilityHitTest_withEvent_, v7, x, y);
  }

  return v24;
}

- (id)_axGetPDFView
{
  v2 = [(PDFDocumentViewAccessibility *)self safeValueForKey:@"_private"];
  id v3 = [v2 safeValueForKey:@"pdfView"];

  return v3;
}

- (BOOL)_axIsUsingPDFExtensionView
{
  v2 = [(PDFDocumentViewAccessibility *)self _axGetPDFView];
  id v3 = [v2 safeValueForKey:@"renderingProperties"];
  char v4 = [v3 safeBoolForKey:@"isUsingPDFExtensionView"];

  return v4;
}

- (void)updateVisibility
{
  v3.receiver = self;
  v3.super_class = (Class)PDFDocumentViewAccessibility;
  [(PDFDocumentViewAccessibility *)&v3 updateVisibility];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:AXPDFVisibiltyUpdatedNotification object:0 userInfo:0];
}

- (void)layoutDocumentView
{
  v3.receiver = self;
  v3.super_class = (Class)PDFDocumentViewAccessibility;
  [(PDFDocumentViewAccessibility *)&v3 layoutDocumentView];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:AXPDFVisibiltyUpdatedNotification object:0 userInfo:0];
}

@end