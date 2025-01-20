@interface WKWebViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)_accessibilityAutomationType;
@end

@implementation WKWebViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WKWebView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 58;
}

@end