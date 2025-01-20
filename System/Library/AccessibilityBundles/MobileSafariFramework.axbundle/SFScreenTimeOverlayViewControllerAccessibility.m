@interface SFScreenTimeOverlayViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axShouldHideWebView;
- (id)showBlockingViewControllerForURL:(id)a3 withPolicy:(int64_t)a4 animated:(BOOL)a5;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axHideWebView:(BOOL)a3;
- (void)hideBlockingViewControllerWithCompletionHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFScreenTimeOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFScreenTimeOverlayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFScreenTimeOverlayViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFScreenTimeOverlayViewController", @"showBlockingViewControllerForURL:withPolicy:animated:", "@", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFScreenTimeOverlayViewController", @"hideBlockingViewControllerWithCompletionHandler:", "v", "@?", 0);
  [v3 validateClass:@"SFScreenTimeOverlayViewController" hasInstanceVariable:@"_blockingViewController" withType:"STBlockingViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SFScreenTimeOverlayViewControllerAccessibility;
  [(SFScreenTimeOverlayViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SFScreenTimeOverlayViewControllerAccessibility *)self _axHideWebView:[(SFScreenTimeOverlayViewControllerAccessibility *)self _axShouldHideWebView]];
}

- (BOOL)_axShouldHideWebView
{
  objc_opt_class();
  objc_super v3 = [(SFScreenTimeOverlayViewControllerAccessibility *)self safeValueForKey:@"_blockingViewController"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 view];
  v6 = [v5 window];
  LOBYTE(v3) = v6 != 0;

  return (char)v3;
}

- (void)_axHideWebView:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v17 = 0;
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  v5 = [v4 view];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = objc_msgSend(v5, "superview", 0);
  v7 = [v6 subviews];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v12 _accessibilityHasDescendantOfType:MEMORY[0x245655C80](@"WKWebView")]&& objc_msgSend(v12, "accessibilityElementsHidden") != v3)
        {
          [v12 setAccessibilityElementsHidden:v3];
          AXPerformBlockOnMainThreadAfterDelay();
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);
  }
}

void __65__SFScreenTimeOverlayViewControllerAccessibility__axHideWebView___block_invoke()
{
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFScreenTimeOverlayViewControllerAccessibility;
  [(SFScreenTimeOverlayViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(SFScreenTimeOverlayViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFScreenTimeOverlayViewControllerAccessibility;
  [(SFScreenTimeOverlayViewControllerAccessibility *)&v4 viewWillDisappear:a3];
  [(SFScreenTimeOverlayViewControllerAccessibility *)self _axHideWebView:0];
}

- (id)showBlockingViewControllerForURL:(id)a3 withPolicy:(int64_t)a4 animated:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SFScreenTimeOverlayViewControllerAccessibility;
  v6 = [(SFScreenTimeOverlayViewControllerAccessibility *)&v8 showBlockingViewControllerForURL:a3 withPolicy:a4 animated:a5];
  [(SFScreenTimeOverlayViewControllerAccessibility *)self _axHideWebView:1];

  return v6;
}

- (void)hideBlockingViewControllerWithCompletionHandler:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFScreenTimeOverlayViewControllerAccessibility;
  [(SFScreenTimeOverlayViewControllerAccessibility *)&v4 hideBlockingViewControllerWithCompletionHandler:a3];
  [(SFScreenTimeOverlayViewControllerAccessibility *)self _axHideWebView:0];
}

@end