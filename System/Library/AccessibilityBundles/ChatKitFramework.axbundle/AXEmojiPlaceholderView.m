@interface AXEmojiPlaceholderView
- (BOOL)_accessibilityViewIsVisible;
- (BOOL)isUserInteractionEnabled;
- (id)backgroundColor;
@end

@implementation AXEmojiPlaceholderView

- (id)backgroundColor
{
  return (id)[MEMORY[0x263F1C550] clearColor];
}

- (BOOL)_accessibilityViewIsVisible
{
  return 1;
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

@end