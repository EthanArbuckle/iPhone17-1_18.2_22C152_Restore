@interface _WKWebExtensionSidebar
- (BOOL)isEnabled;
- (NSString)title;
- (UIViewController)viewController;
- (WKWebExtensionContext)webExtensionContext;
- (WKWebExtensionTab)associatedTab;
- (WKWebView)webView;
- (id)iconForSize:(CGSize)a3;
@end

@implementation _WKWebExtensionSidebar

- (WKWebExtensionContext)webExtensionContext
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (id)iconForSize:(CGSize)a3
{
  return 0;
}

- (UIViewController)viewController
{
  return 0;
}

- (BOOL)isEnabled
{
  return 0;
}

- (WKWebView)webView
{
  return 0;
}

- (WKWebExtensionTab)associatedTab
{
  return 0;
}

@end