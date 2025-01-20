@interface SPUISecureWindow
+ (BOOL)_isSecure;
- (BOOL)_requiresKeyboardPresentationFence;
@end

@implementation SPUISecureWindow

- (BOOL)_requiresKeyboardPresentationFence
{
  return 0;
}

+ (BOOL)_isSecure
{
  return 1;
}

@end