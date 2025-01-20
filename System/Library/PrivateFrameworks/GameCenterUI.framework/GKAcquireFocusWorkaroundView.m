@interface GKAcquireFocusWorkaroundView
- (BOOL)canBecomeFirstResponder;
@end

@implementation GKAcquireFocusWorkaroundView

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

@end