@interface NSObject(WebViewAccessibilityAdditions)
- (uint64_t)_accessibilityParentForSubview:()WebViewAccessibilityAdditions;
@end

@implementation NSObject(WebViewAccessibilityAdditions)

- (uint64_t)_accessibilityParentForSubview:()WebViewAccessibilityAdditions
{
  return 0;
}

@end