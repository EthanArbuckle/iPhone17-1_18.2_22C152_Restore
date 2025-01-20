@interface WebViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityContainer;
@end

@implementation WebViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WebView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityContainer
{
  return (id)[(WebViewAccessibility *)self safeValueForKey:@"_UIKitDelegate"];
}

@end