@interface MRUIBackgroundContentScene
- (void)handleTouchAction:(id)a3;
@end

@implementation MRUIBackgroundContentScene

- (void)handleTouchAction:(id)a3
{
  id v3 = a3;
  v4 = +[LockScreenCoordinator shared];
  v5 = [v4 backgroundContainer];
  v6 = [v5 artworkView];
  [v6 center];

  [v3 location];
  double v8 = v7;
  double v10 = v9;

  v11 = +[UIApplication sharedApplication];
  [v11 setIdleTimerDisabled:1];

  v12 = +[UIApplication sharedApplication];
  [v12 setIdleTimerDisabled:0];

  id v13 = +[LockScreenCoordinator shared];
  [v13 handleBackgroundTapAt:v8, v10];
}

@end