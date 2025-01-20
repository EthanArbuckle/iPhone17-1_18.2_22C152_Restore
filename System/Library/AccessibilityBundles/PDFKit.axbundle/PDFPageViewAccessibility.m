@interface PDFPageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityInsertAnnotation:(id)a3;
- (BOOL)_accessibilityIsFrameOutOfBounds;
- (BOOL)_accessibilityRemoveAnnotation:(id)a3;
- (BOOL)_axIsUsingPDFExtensionView;
- (BOOL)isAccessibilityElement;
- (CGPDFPage)_axPageRef;
- (CGPDFSelection)_lineSelectionForSelection:(CGPDFSelection *)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_axAllElements;
- (id)_axAllNodeElements;
- (id)_axGetPDFView;
- (id)_axGetPage;
- (id)_axLineSelections;
- (id)_axPageViewElements;
- (id)accessibilityElements;
- (void)_axSetAllNodeElements:(id)a3;
- (void)_axSetPageViewElements:(id)a3;
- (void)removeControlForAnnotation:(id)a3;
- (void)resetAccessibilityTree;
@end

@implementation PDFPageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PDFPageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axPageViewElements
{
}

- (void)_axSetPageViewElements:(id)a3
{
}

- (id)_axAllNodeElements
{
}

- (void)_axSetAllNodeElements:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFView", @"convertPoint:toPage:", "{CGPoint=dd}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFView", @"convertRect:fromPage:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFView", @"convertRect:toPage:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFPageView", @"page", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFPage", @"view", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFPage", @"fetchAnnotationFromTaggedNodeRef:", "@", "^{CGPDFTaggedNode=}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFAnnotation", @"control", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFPageView", @"removeControlForAnnotation:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFPageView", @"resetAccessibilityTree", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (CGPDFPage)_axPageRef
{
  v2 = [(PDFPageViewAccessibility *)self _axGetPage];
  id v3 = __UIAccessibilitySafeClass();

  v4 = (CGPDFPage *)[v3 pageRef];
  return v4;
}

- (id)_axGetPage
{
  return (id)[(PDFPageViewAccessibility *)self safeValueForKey:@"page"];
}

- (id)_axGetPDFView
{
  v2 = [(PDFPageViewAccessibility *)self _axGetPage];
  id v3 = [v2 safeValueForKey:@"view"];

  return v3;
}

- (BOOL)_axIsUsingPDFExtensionView
{
  v2 = [(PDFPageViewAccessibility *)self _axGetPDFView];
  id v3 = [v2 safeValueForKey:@"renderingProperties"];
  char v4 = [v3 safeBoolForKey:@"isUsingPDFExtensionView"];

  return v4;
}

- (BOOL)_accessibilityIsFrameOutOfBounds
{
  if ([(PDFPageViewAccessibility *)self _axIsUsingPDFExtensionView]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PDFPageViewAccessibility;
  return [(PDFPageViewAccessibility *)&v4 _accessibilityIsFrameOutOfBounds];
}

- (BOOL)_accessibilityInsertAnnotation:(id)a3
{
  id v4 = a3;
  v5 = [(PDFPageViewAccessibility *)self accessibilityElements];
  if ([v5 count] == 1)
  {
    v6 = [v5 objectAtIndex:0];
    char v7 = [v6 _accessibilityInsertAnnotation:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_accessibilityRemoveAnnotation:(id)a3
{
  id v4 = a3;
  v5 = [(PDFPageViewAccessibility *)self accessibilityElements];
  if ([v5 count] == 1)
  {
    v6 = [v5 objectAtIndex:0];
    char v7 = [v6 _accessibilityRemoveAnnotation:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if ([(PDFPageViewAccessibility *)self _axIsUsingPDFExtensionView])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = [(PDFPageViewAccessibility *)self _axAllElements];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v13 accessibilityFrame];
          v24.double x = x;
          v24.double y = y;
          if (CGRectContainsPoint(v25, v24))
          {
            id v14 = v13;

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v14 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)PDFPageViewAccessibility;
    -[PDFPageViewAccessibility _accessibilityHitTest:withEvent:](&v20, sel__accessibilityHitTest_withEvent_, v7, x, y);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v14;
}

- (id)_axAllElements
{
  id v3 = [(PDFPageViewAccessibility *)self _axAllNodeElements];
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    id v4 = [MEMORY[0x263EFF980] array];
    v5 = [(PDFPageViewAccessibility *)self accessibilityElements];
    [v4 addObjectsFromArray:v5];
    while (1)
    {

      if (![v4 count]) {
        break;
      }
      v5 = [v4 firstObject];
      [v4 removeObjectAtIndex:0];
      if ([v5 isAccessibilityElement])
      {
        [v3 addObject:v5];
      }
      else
      {
        v6 = [v5 accessibilityElements];
        uint64_t v7 = [v6 count];

        if (v7)
        {
          v8 = [v5 accessibilityElements];
          [v4 addObjectsFromArray:v8];
        }
      }
    }
    [(PDFPageViewAccessibility *)self _axSetAllNodeElements:v3];
  }

  return v3;
}

- (id)accessibilityElements
{
  id v3 = [(PDFPageViewAccessibility *)self _axPageViewElements];
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    [(PDFPageViewAccessibility *)self _axPageRef];
    uint64_t v4 = CGPDFPageCopyRootTaggedNode();
    v5 = [UICGPDFNodeAccessibilityElement alloc];
    v6 = [(PDFPageViewAccessibility *)self _axGetPage];
    uint64_t v7 = [(UICGPDFNodeAccessibilityElement *)v5 initWithAccessibilityContainer:self pdfNodeRef:v4 withPage:v6];

    [v3 axSafelyAddObject:v7];
    [(PDFPageViewAccessibility *)self _axSetPageViewElements:v3];
    CGPDFTaggedNodeRelease();
  }

  return v3;
}

- (void)resetAccessibilityTree
{
  [(PDFPageViewAccessibility *)self _axSetPageViewElements:0];
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v2, 0);
}

- (id)_axLineSelections
{
  id v3 = [(PDFPageViewAccessibility *)self _accessibilityValueForKey:@"lineSelections"];
  if (!v3)
  {
    [(PDFPageViewAccessibility *)self _axPageRef];
    uint64_t v4 = (const void *)CGPDFSelectionCreateForEntirePage();
    SelectionsByLine = (void *)CGPDFSelectionCreateSelectionsByLine();
    [(PDFPageViewAccessibility *)self _accessibilitySetRetainedValue:SelectionsByLine forKey:@"lineSelections"];

    if (v4) {
      CFRelease(v4);
    }
  }

  return v3;
}

- (CGPDFSelection)_lineSelectionForSelection:(CGPDFSelection *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t TextRange = CGPDFSelectionGetTextRange();
  uint64_t v6 = v5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [(PDFPageViewAccessibility *)self _axLineSelections];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(CGPDFSelection **)(*((void *)&v16 + 1) + 8 * v11);
      if (CGPDFSelectionGetTextRange() == TextRange && v13 == v6) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v12 = 0;
  }

  return v12;
}

- (void)removeControlForAnnotation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDFPageViewAccessibility;
  [(PDFPageViewAccessibility *)&v4 removeControlForAnnotation:a3];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:AXPDFRemoveFromSuperviewNotification object:0 userInfo:0];
}

@end