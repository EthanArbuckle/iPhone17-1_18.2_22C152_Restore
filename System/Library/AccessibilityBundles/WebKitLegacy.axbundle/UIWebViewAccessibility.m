@interface UIWebViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)_accessibilityAutomationType;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4;
- (void)webViewClose:(id)a3;
@end

@implementation UIWebViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWebView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 58;
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)UIWebViewAccessibility;
  [(UIWebViewAccessibility *)&v4 webView:a3 didFinishLoadForFrame:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)webViewClose:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIWebViewAccessibility;
  [(UIWebViewAccessibility *)&v6 webViewClose:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F81458];
  LODWORD(v4) = -1.0;
  v5 = [NSNumber numberWithFloat:v4];
  UIAccessibilityPostNotification(v3, v5);
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UIWebViewAccessibility;
  [(UIWebViewAccessibility *)&v8 webView:a3 didFailLoadWithError:a4 forFrame:a5];
  UIAccessibilityNotifications v5 = *MEMORY[0x263F81458];
  LODWORD(v6) = -1.0;
  v7 = [NSNumber numberWithFloat:v6];
  UIAccessibilityPostNotification(v5, v7);
}

@end