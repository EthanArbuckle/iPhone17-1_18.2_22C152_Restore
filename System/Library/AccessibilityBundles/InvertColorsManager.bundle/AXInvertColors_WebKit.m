@interface AXInvertColors_WebKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_WebKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WKWebView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"WKContentView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKWebView", @"_didFinishNavigation:", "v", "^{Navigation=}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKWebView", @"_didStartProvisionalLoadForMainFrame", "v", 0);
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 1;
}

@end