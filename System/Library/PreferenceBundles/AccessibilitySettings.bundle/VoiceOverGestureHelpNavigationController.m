@interface VoiceOverGestureHelpNavigationController
- (BOOL)prefersStatusBarHidden;
- (int64_t)modalPresentationStyle;
@end

@implementation VoiceOverGestureHelpNavigationController

- (int64_t)modalPresentationStyle
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

@end