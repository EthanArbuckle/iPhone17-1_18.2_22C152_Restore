@interface TPButtonAccessibilityElement
- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping;
@end

@implementation TPButtonAccessibilityElement

- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping
{
  return 1;
}

@end