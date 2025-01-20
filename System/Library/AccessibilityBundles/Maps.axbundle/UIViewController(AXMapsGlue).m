@interface UIViewController(AXMapsGlue)
- (id)_accessibilityFirstNonGrabberElement;
@end

@implementation UIViewController(AXMapsGlue)

- (id)_accessibilityFirstNonGrabberElement
{
  if (_accessibilityFirstNonGrabberElement_onceToken != -1) {
    dispatch_once(&_accessibilityFirstNonGrabberElement_onceToken, &__block_literal_global_429);
  }
  v2 = [a1 view];
  v3 = [v2 _accessibilityLeafDescendantsWithCount:1 options:_accessibilityFirstNonGrabberElement_Options];
  v4 = [v3 firstObject];

  return v4;
}

@end