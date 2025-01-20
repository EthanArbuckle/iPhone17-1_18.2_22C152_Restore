@interface UIWebDocumentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHasTextOperations;
- (BOOL)_accessibilityIsFirstElementForFocus;
- (BOOL)_accessibilityIsScrollAncestor;
- (BOOL)_accessibilityIsWebDocumentView;
- (BOOL)_accessibilityMimicsTextInputResponder;
- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4;
- (BOOL)_accessibilityScrollingEnabled;
- (BOOL)accessibilityScrollDownPage;
- (BOOL)accessibilityScrollLeftPage;
- (BOOL)accessibilityScrollRightPage;
- (BOOL)accessibilityScrollUpPage;
- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3;
- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (CGRect)_accessibilityContentFrame;
- (CGRect)accessibilityFrame;
- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3;
- (id)_accessibilityDataDetectorScheme:(CGPoint)a3;
- (id)_accessibilityDocumentView;
- (id)_accessibilityEquivalenceTag;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityResponderElement;
- (id)_accessibilityRootObject;
- (id)_accessibilityScrollStatus;
- (id)_accessibilitySpeakThisString;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityDocumentView;
- (void)_accessibilityZoomAtPoint:(CGPoint)a3 zoomIn:(BOOL)a4;
- (void)_axZoomToCenterWithScale:(CGPoint)a3 scale:(double)a4;
- (void)clearSelection;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)handleKeyWebEvent:(id)a3;
- (void)paste:(id)a3;
- (void)selectAll:(id)a3;
- (void)setSelectedDOMRange:(id)a3 affinity:(unint64_t)a4;
- (void)setSelectedTextRange:(id)a3;
- (void)stopLoading:(id)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4;
- (void)webView:(id)a3 willShowFullScreenForPlugInView:(id)a4;
@end

@implementation UIWebDocumentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWebDocumentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"_zoomToCenter: scale: duration:", "v", "{CGPoint=dd}", "d", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"_focusedOrMainFrame", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"_zoomedDocumentScale", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"approximateNodeAtViewportLocation:", "@", "^{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"clearSelection", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"didEndZoom", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"didZoom", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"hasEditableSelection", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"hasSelection", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"inputDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"keyboardInputShouldDelete:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"maximumScale", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"minimumScale", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"redrawScaledDocument", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"setSelectedDOMRange: affinity:", "v", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"stopLoading:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"textInputTraits", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"toggleBoldface:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"toggleItalics:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"toggleUnderline:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"updatesScrollView", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"webView: didFinishLoadForFrame:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"webView: willShowFullScreenForPlugInView:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"willStartZoom", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebDocumentView", @"handleKeyWebEvent:", "v", "@", 0);
  [v3 validateClass:@"UIWebDocumentView" hasInstanceVariable:@"_documentScale" withType:"f"];
  [v3 validateClass:@"UIWebDocumentView" hasInstanceVariable:@"_plugInViews" withType:"^{__CFDictionary=}"];
  [v3 validateClass:@"UIWebDocumentView" hasInstanceVariable:@"_webView" withType:"WebView"];
  [v3 validateClass:@"UIWebDocumentView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"UIWebDocumentView"];
  [v3 validateClass:@"WebView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_accessibleSubviews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DOMNode", @"handleKeyWebEvent:", "v", "@", 0);
}

- (void)stopLoading:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v6 stopLoading:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F81458];
  LODWORD(v4) = -1.0;
  v5 = [NSNumber numberWithFloat:v4];
  UIAccessibilityPostNotification(v3, v5);
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v8 webView:a3 didFailLoadWithError:a4 forFrame:a5];
  UIAccessibilityNotifications v5 = *MEMORY[0x263F81458];
  LODWORD(v6) = -1.0;
  v7 = [NSNumber numberWithFloat:v6];
  UIAccessibilityPostNotification(v5, v7);
}

- (void)webView:(id)a3 willShowFullScreenForPlugInView:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v7 webView:a3 willShowFullScreenForPlugInView:a4];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F81458];
  LODWORD(v5) = 1.0;
  double v6 = [NSNumber numberWithFloat:v5];
  UIAccessibilityPostNotification(v4, v6);
}

- (void)setSelectedDOMRange:(id)a3 affinity:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v4 setSelectedDOMRange:a3 affinity:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F81340], 0);
}

- (void)copy:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v4 copy:a3];
  [(UIWebDocumentViewAccessibility *)self _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21B78]];
}

- (void)cut:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F21B78];
  id v5 = a3;
  [(UIWebDocumentViewAccessibility *)self _accessibilityIgnoreNextPostPasteboardTextOperation:v4];
  v6.receiver = self;
  v6.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v6 cut:v5];

  [(UIWebDocumentViewAccessibility *)self _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21B80]];
}

- (void)paste:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F21BC0];
  id v5 = a3;
  [(UIWebDocumentViewAccessibility *)self _accessibilityPostPasteboardTextForOperation:v4];
  v6.receiver = self;
  v6.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v6 paste:v5];
}

- (void)selectAll:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v5 selectAll:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  uint64_t v4 = UIKitAccessibilityLocalizedString();
  UIAccessibilityPostNotification(v3, v4);
}

- (void)toggleBoldface:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v5 toggleBoldface:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  uint64_t v4 = UIKitAccessibilityLocalizedString();
  UIAccessibilityPostNotification(v3, v4);
}

- (void)toggleItalics:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v5 toggleItalics:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  uint64_t v4 = UIKitAccessibilityLocalizedString();
  UIAccessibilityPostNotification(v3, v4);
}

- (void)toggleUnderline:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v5 toggleUnderline:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  uint64_t v4 = UIKitAccessibilityLocalizedString();
  UIAccessibilityPostNotification(v3, v4);
}

- (void)_axZoomToCenterWithScale:(CGPoint)a3 scale:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  objc_super v8 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"enclosingScrollView"];
  v9 = v8;
  if (v8 && [v8 safeBoolForKey:@"isZoomEnabled"])
  {
    if (objc_opt_respondsToSelector()) {
      -[UIWebDocumentViewAccessibility willZoomToLocation:atScale:forDuration:](self, "willZoomToLocation:atScale:forDuration:", x, y, a4, 0.1);
    }
    id v10 = v9;
    AXPerformSafeBlock();
  }
}

uint64_t __65__UIWebDocumentViewAccessibility__axZoomToCenterWithScale_scale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_zoomToCenter:scale:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), 0.1);
}

- (void)_accessibilityZoomAtPoint:(CGPoint)a3 zoomIn:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  WebThreadLock();
  id v34 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"enclosingScrollView"];
  objc_msgSend(v34, "convertPoint:fromView:", self, x, y);
  double v9 = v8;
  double v11 = v10;
  v12 = [v34 safeValueForKey:@"_zoomScale"];
  [v12 floatValue];
  float v14 = v13;

  v15 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"_documentScale"];
  [v15 floatValue];
  float v17 = v16;

  v18 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"minimumScale"];
  [v18 floatValue];
  float v20 = v19;

  v21 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"maximumScale"];
  [v21 floatValue];
  float v23 = v22;

  float v24 = v20 / v17;
  float v25 = v23 / v17;
  float v26 = (float)((float)(v23 / v17) + -1.0) / 10.0;
  if (v14 < 1.0) {
    float v26 = (float)(1.0 - (float)(v20 / v17)) / 5.0;
  }
  double v27 = v26;
  if (!v4) {
    double v27 = -v27;
  }
  double v28 = v27 + v14;
  if (v28 < v24) {
    double v28 = v24;
  }
  if (v28 > v25) {
    double v28 = v25;
  }
  -[UIWebDocumentViewAccessibility _axZoomToCenterWithScale:scale:](self, "_axZoomToCenterWithScale:scale:", v9, v11, v28);
  UIAccessibilityNotifications v29 = *MEMORY[0x263F1CDC8];
  v30 = NSString;
  v31 = UIKitAccessibilityLocalizedString();
  v32 = AXFormatInteger();
  v33 = objc_msgSend(v30, "stringWithFormat:", v31, v32);
  UIAccessibilityPostNotification(v29, v33);

  UIAccessibilityPostNotification(*MEMORY[0x263F81298], 0);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  return 1;
}

- (void)setSelectedTextRange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v3 setSelectedTextRange:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F81340], 0);
}

- (BOOL)_accessibilityHasTextOperations
{
  v2 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"hasSelection"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  return (id)[(UIWebDocumentViewAccessibility *)self safeValueForKey:@"_accessibleSubviews"];
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  id v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v23 webView:a3 didFinishLoadForFrame:v6];
  objc_super v7 = [(id)*MEMORY[0x263F1D020] _accessibilityBundleIdentifier];
  if (!webView_didFinishLoadForFrame__appsOKToPost)
  {
    uint64_t v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF8C0]), "initWithObjects:", @"com.apple.mobilesafari", @"com.apple.Preferences", 0);
    double v9 = (void *)webView_didFinishLoadForFrame__appsOKToPost;
    webView_didFinishLoadForFrame__appsOKToPost = v8;
  }
  double v10 = [v6 dataSource];
  double v11 = [v10 request];
  v12 = [v11 URL];
  if ([v12 isFileURL])
  {
  }
  else
  {
    [v6 dataSource];
    float v22 = self;
    v14 = float v13 = v7;
    v15 = [v14 request];
    float v16 = [v15 URL];
    float v17 = [v16 absoluteString];
    char v18 = [v17 isEqualToString:@"about:blank"];

    objc_super v7 = v13;
    if ((v18 & 1) == 0)
    {
      [(UIWebDocumentViewAccessibility *)v22 bounds];
      if (v19 >= 100.0)
      {
        float v20 = [(UIWebDocumentViewAccessibility *)v22 safeValueForKey:@"superview"];

        if (v20)
        {
          if ([(id)webView_didFinishLoadForFrame__appsOKToPost containsObject:v13])
          {
            v21 = [v6 parentFrame];

            if (!v21) {
              UIAccessibilityPostNotification(*MEMORY[0x263F81458], 0);
            }
          }
        }
      }
    }
  }
}

- (id)_accessibilityEquivalenceTag
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
}

- (BOOL)_accessibilityScrollingEnabled
{
  v2 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"_scroller"];
  char v3 = [v2 _accessibilityScrollingEnabled];

  return v3;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  WebThreadLock();
  if (objc_opt_respondsToSelector())
  {
    LOBYTE(v22) = 0;
    objc_opt_class();
    BOOL v4 = __UIAccessibilityCastAsClass();
    objc_super v5 = [v4 window];
    UIAccessibilitySceneReferencePointToScreenPoint();
    objc_msgSend(v5, "convertPoint:fromWindow:", 0);
    objc_msgSend(v5, "convertPoint:toView:", v4);
    double v7 = v6;
    double v9 = v8;
    double v26 = v6;
    double v27 = v8;
    double v10 = [(UIWebDocumentViewAccessibility *)self approximateNodeAtViewportLocation:&v26];
    Categordouble y = 0;
    if (vabdd_f64(v9, v27) <= 2.0)
    {
      if (vabdd_f64(v7, v26) > 2.0) {
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_13;
      }
      if (!NSClassFromString(&cfstr_Dddetectioncon.isa)) {
        goto LABEL_13;
      }
      v12 = [v10 absoluteLinkURL];
      float v13 = [v12 absoluteString];
      int v14 = [v13 hasPrefix:@"x-apple-data-detectors:"];

      if (!v14) {
        goto LABEL_13;
      }
      v15 = [NSClassFromString(&cfstr_Dddetectioncon.isa) sharedController];
      uint64_t v22 = 0;
      objc_super v23 = &v22;
      uint64_t v24 = 0x2020000000;
      uint64_t v25 = 0;
      id v16 = v15;
      id v21 = v10;
      AXPerformSafeBlock();
      if (v23[3])
      {
        Categordouble y = (__CFString *)DDResultGetCategory();
        CFStringRef Type = (const __CFString *)DDResultGetType();
        switch((int)Category)
        {
          case 1:
            BOOL v18 = 0;
            Categordouble y = @"http";
            break;
          case 2:
            BOOL v18 = 0;
            Categordouble y = @"tel";
            break;
          case 3:
            BOOL v18 = 0;
            Categordouble y = @"address";
            break;
          case 4:
            BOOL v18 = 0;
            Categordouble y = @"event";
            break;
          case 5:
            CFStringRef v20 = Type;
            if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x263F39488], 0))
            {
              BOOL v18 = CFStringCompare(v20, (CFStringRef)*MEMORY[0x263F39448], 0) != kCFCompareEqualTo;
              Categordouble y = @"item-number";
            }
            else
            {
              BOOL v18 = 0;
              Categordouble y = @"tracking-number";
            }
            break;
          case 6:
            BOOL v18 = 0;
            Categordouble y = @"money";
            break;
          case 7:
            BOOL v18 = 0;
            Categordouble y = @"propername";
            break;
          default:
            BOOL v18 = 1;
            break;
        }
      }
      else
      {
        BOOL v18 = 0;
        Categordouble y = 0;
      }

      _Block_object_dispose(&v22, 8);
      if (v18) {
LABEL_13:
      }
        Categordouble y = 0;
    }
  }
  else
  {
    _AXAssert();
    return 0;
  }
  return Category;
}

void __67__UIWebDocumentViewAccessibility__accessibilityDataDetectorScheme___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) absoluteLinkURL];
  char v3 = [*(id *)(a1 + 48) safeValueForKey:@"_webView"];
  BOOL v4 = [v3 safeValueForKey:@"mainFrame"];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 _resultForURL:v5 forContainer:v4 context:0];
}

- (id)accessibilityLabel
{
  v2 = [(UIWebDocumentViewAccessibility *)self accessibilityUserDefinedLabel];
  char v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (id)_accessibilityScrollStatus
{
  v2 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"_scroller"];
  char v3 = [v2 _accessibilityScrollStatus];

  return v3;
}

- (void)clearSelection
{
  v2.receiver = self;
  v2.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v2 clearSelection];
  UIAccessibilityPostNotification(0x3FEu, 0);
}

- (BOOL)accessibilityScrollUpPage
{
  objc_super v2 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"_scroller"];
  char v3 = [v2 accessibilityScrollUpPage];

  return v3;
}

- (BOOL)accessibilityScrollDownPage
{
  objc_super v2 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"_scroller"];
  char v3 = [v2 accessibilityScrollDownPage];

  return v3;
}

- (BOOL)accessibilityScrollRightPage
{
  objc_super v2 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"_scroller"];
  char v3 = [v2 accessibilityScrollRightPage];

  return v3;
}

- (BOOL)accessibilityScrollLeftPage
{
  objc_super v2 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"_scroller"];
  char v3 = [v2 accessibilityScrollLeftPage];

  return v3;
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  id v5 = [(UIWebDocumentViewAccessibility *)self _accessibilityRootObject];
  uint64_t v19 = 0;
  CFStringRef v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  objc_super v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  int v14 = __72__UIWebDocumentViewAccessibility__accessibilityAttributedValueForRange___block_invoke;
  v15 = &unk_2650B9CD0;
  float v17 = &v19;
  id v6 = v5;
  id v16 = v6;
  BOOL v18 = a3;
  AXPerformSafeBlock();
  id v7 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  if (![v7 length])
  {
    uint64_t v8 = [v6 _accessibilityAttributedValueForRange:a3];

    id v7 = (id)v8;
  }
  if (![v7 length])
  {
    v11.receiver = self;
    v11.super_class = (Class)UIWebDocumentViewAccessibility;
    uint64_t v9 = [(UIWebDocumentViewAccessibility *)&v11 _accessibilityAttributedValueForRange:a3];

    id v7 = (id)v9;
  }

  return v7;
}

uint64_t __72__UIWebDocumentViewAccessibility__accessibilityAttributedValueForRange___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "attributedStringForRange:", **(void **)(a1 + 48), *(void *)(*(void *)(a1 + 48) + 8));

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityIsFirstElementForFocus
{
  if (axIsSafari()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIWebDocumentViewAccessibility;
  return [(UIWebDocumentViewAccessibility *)&v4 _accessibilityIsFirstElementForFocus];
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)_accessibilityDocumentView
{
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v3 = (void (*)(void))getWebThreadLockSymbolLoc_ptr;
  uint64_t v13 = getWebThreadLockSymbolLoc_ptr;
  if (!getWebThreadLockSymbolLoc_ptr)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getWebThreadLockSymbolLoc_block_invoke;
    v9[3] = &unk_2650B9CF8;
    v9[4] = &v10;
    __getWebThreadLockSymbolLoc_block_invoke((uint64_t)v9);
    char v3 = (void (*)(void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v3) {
    -[UIWebDocumentViewAccessibility _accessibilityDocumentView]();
  }
  v3();
  objc_super v4 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"_webView"];
  id v5 = [v4 mainFrame];
  id v6 = [v5 frameView];
  id v7 = [v6 documentView];

  return v7;
}

- (id)_accessibilityRootObject
{
  objc_super v2 = [(UIWebDocumentViewAccessibility *)self _accessibilityDocumentView];
  char v3 = [v2 safeValueForKey:@"accessibilityRootElement"];

  return v3;
}

- (id)_accessibilityResponderElement
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_super v2 = [(UIWebDocumentViewAccessibility *)self _accessibilityRootObject];
  NSClassFromString(&cfstr_Webpdfview.isa);
  if (objc_opt_isKindOfClass())
  {
    id v3 = 0;
    id v4 = v2;
  }
  else
  {
    id v4 = [v2 safeValueForKey:@"accessibilityFocusedUIElement"];

    uint64_t v5 = [v4 accessibilityTraits];
    if ((*MEMORY[0x263F81398] & v5) != 0)
    {
      id v4 = v4;
      id v3 = v4;
    }
    else
    {
      id v6 = [NSClassFromString(&cfstr_Uiperipheralho.isa) safeValueForKey:@"sharedInstance"];
      id v7 = v6;
      if (v6)
      {
        uint64_t v8 = [v6 safeValueForKey:@"_hostView"];
        [v8 _accessibleSubviews];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v17;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              int v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
              if (objc_msgSend(v14, "_accessibilityServesAsFirstElement", (void)v16))
              {
                id v3 = v14;

                goto LABEL_17;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        if ([v9 count])
        {
          id v3 = [v9 objectAtIndex:0];
        }
        else
        {
          id v3 = 0;
        }
LABEL_17:
      }
      else
      {
        id v3 = 0;
      }
    }
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(UIWebDocumentViewAccessibility *)self _accessibilityValueForKey:@"AXDocumentSeenChildren"];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) _accessibilityRemoveValueForKey:@"AXWebDocumentViewKey"];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v8 dealloc];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(UIWebDocumentViewAccessibility *)self _accessibilityRootObject];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (CGRect)_accessibilityContentFrame
{
  uint64_t v2 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"_scroller"];
  [v2 _accessibilityContentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BOOL)_accessibilityMimicsTextInputResponder
{
  return 1;
}

- (BOOL)_accessibilityIsWebDocumentView
{
  return 1;
}

- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"updatesScrollView"];
  char v10 = [v9 BOOLValue];

  if ((v10 & 1) == 0)
  {
    double v11 = [MEMORY[0x263F086E0] mainBundle];
    double v12 = [v11 bundleIdentifier];
    int v13 = [v12 isEqualToString:@"com.apple.purplebuddy"];

    if (!v13) {
      return 0;
    }
  }
  double v14 = [(UIWebDocumentViewAccessibility *)self safeValueForKey:@"_scroller"];
  char v15 = objc_msgSend(v14, "_accessibilityScrollToFrame:forView:", 0, x, y, width, height);

  return v15;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  double v3 = [(UIWebDocumentViewAccessibility *)self isAccessibilityUserDefinedScrollAncestor];

  if (!v3) {
    return 1;
  }
  double v4 = [(UIWebDocumentViewAccessibility *)self isAccessibilityUserDefinedScrollAncestor];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (int64_t)accessibilityContainerType
{
  double v3 = [(UIWebDocumentViewAccessibility *)self accessibilityUserDefinedTraits];
  if (v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)UIWebDocumentViewAccessibility;
    int64_t v4 = [(UIWebDocumentViewAccessibility *)&v8 accessibilityContainerType];
  }
  else
  {
    char v5 = [(UIWebDocumentViewAccessibility *)self storedAccessibilityContainerType];

    if (v5)
    {
      double v6 = [(UIWebDocumentViewAccessibility *)self storedAccessibilityContainerType];
      int64_t v4 = [v6 integerValue];
    }
    else
    {
      int64_t v4 = 4;
    }
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = [(UIWebDocumentViewAccessibility *)self accessibilityUserDefinedTraits];
  double v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = *MEMORY[0x263F1CF18];
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  v14.receiver = self;
  v14.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v14 accessibilityFrame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  if (axIsSafari()) {
    double v10 = v5 + 20.0;
  }
  else {
    double v10 = v5;
  }
  double v11 = v3;
  double v12 = v7;
  double v13 = v9;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v10;
  result.origin.double x = v11;
  return result;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (!-[UIWebDocumentViewAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    objc_super v14 = 0;
    goto LABEL_32;
  }
  if (!_accessibilityHitTest_withEvent__AXObjectWrapperClass) {
    _accessibilityHitTest_withEvent__AXObjectWrapperClass = (uint64_t)NSClassFromString(&cfstr_Webaccessibili.isa);
  }
  objc_msgSend((id)-[UIWebDocumentViewAccessibility _axPluginViews](self, "_axPluginViews"), "keyEnumerator");
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "convertPoint:fromView:", self, x, y, (void)v27);
        objc_super v14 = objc_msgSend(v13, "hitTest:withEvent:", v7);

        if ([v14 isAccessibilityElement])
        {

          goto LABEL_31;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v8 = [(UIWebDocumentViewAccessibility *)self _accessibilityDocumentView];
  objc_msgSend(v8, "convertPoint:fromView:", 0, x, y);
  double v16 = v15;
  double v18 = v17;
  if ([v7 _accessibilityAutomationHitTest]) {
    [(UIWebDocumentViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"AXIgnoreFuzzyHitTesting"];
  }
  objc_super v14 = objc_msgSend(v8, "accessibilityHitTest:", v16, v18, (void)v27);
  if (v14)
  {
    do
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      long long v19 = [v14 safeValueForKey:@"isAttachment"];
      int v20 = [v19 BOOLValue];

      if (!v20) {
        break;
      }
      uint64_t v21 = [v14 safeValueForKey:@"attachmentView"];
      uint64_t v22 = [v21 safeValueForKey:@"contentView"];
      objc_super v23 = [v22 safeValueForKey:@"documentView"];

      objc_msgSend(v23, "convertPoint:fromView:", 0, x, y);
      uint64_t v24 = objc_msgSend(v23, "accessibilityHitTest:");

      if ((void *)v24 == v14) {
        break;
      }
      objc_super v14 = (void *)v24;
    }
    while (v24);
  }
  if ([v7 _accessibilityAutomationHitTest]) {
    [(UIWebDocumentViewAccessibility *)self _accessibilitySetBoolValue:0 forKey:@"AXIgnoreFuzzyHitTesting"];
  }
  if ([v14 isAccessibilityElement])
  {
    if (v14) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  -[UIWebDocumentViewAccessibility __accessibilityHitTest:withEvent:](self, "__accessibilityHitTest:withEvent:", v7, x, y);
  uint64_t v25 = (UIWebDocumentViewAccessibility *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    if (!-[UIWebDocumentViewAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
    {
      objc_super v14 = 0;
      goto LABEL_31;
    }
    uint64_t v25 = self;
  }
  objc_super v14 = v25;
LABEL_31:

LABEL_32:

  return v14;
}

- (id)_accessibilitySpeakThisString
{
  double v2 = self;
  double v3 = [(UIWebDocumentViewAccessibility *)v2 selectedTextRange];
  double v4 = [(UIWebDocumentViewAccessibility *)v2 beginningOfDocument];
  double v5 = [(UIWebDocumentViewAccessibility *)v2 endOfDocument];
  double v6 = [(UIWebDocumentViewAccessibility *)v2 textRangeFromPosition:v4 toPosition:v5];
  v10.receiver = v2;
  v10.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v10 setSelectedTextRange:v6];
  id v7 = [(UIWebDocumentViewAccessibility *)v2 textInRange:v6];
  v9.receiver = v2;
  v9.super_class = (Class)UIWebDocumentViewAccessibility;
  [(UIWebDocumentViewAccessibility *)&v9 setSelectedTextRange:v3];

  return v7;
}

- (void)handleKeyWebEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIWebDocumentViewAccessibility;
  id v3 = a3;
  [(UIWebDocumentViewAccessibility *)&v4 handleKeyWebEvent:v3];
  sendNotificationAfterHandlingWebKeyEventIfNeeded(v3);
}

- (void)_accessibilityDocumentView
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"void get_WebThreadLock(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIWebDocumentViewAccessibility.m", 17, @"%s", dlerror());

  __break(1u);
}

@end