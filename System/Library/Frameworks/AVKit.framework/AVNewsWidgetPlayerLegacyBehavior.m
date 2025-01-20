@interface AVNewsWidgetPlayerLegacyBehavior
- (AVPlayerViewControllerContentTransitioning_NewsOnly)legacyDelegate;
- (id)playerForContentTransitionType:(int64_t)a3;
- (void)didCancelContentTransition;
- (void)didCompleteContentTransition;
- (void)didUpdateContentTransitionProgress:(double)a3;
- (void)setLegacyDelegate:(id)a3;
- (void)willBeginContentTransition;
- (void)willCancelContentTransition;
- (void)willCompleteContentTransition;
@end

@implementation AVNewsWidgetPlayerLegacyBehavior

- (void).cxx_destruct
{
}

- (void)setLegacyDelegate:(id)a3
{
}

- (AVPlayerViewControllerContentTransitioning_NewsOnly)legacyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_legacyDelegate);

  return (AVPlayerViewControllerContentTransitioning_NewsOnly *)WeakRetained;
}

- (void)didCancelContentTransition
{
  id v5 = [(AVNewsWidgetPlayerLegacyBehavior *)self legacyDelegate];
  v3 = [(AVNewsWidgetPlayerBehavior *)self behaviorContext];
  v4 = [v3 playerViewController];
  [v5 playerViewControllerDidCancelContentTransition:v4];
}

- (void)willCancelContentTransition
{
  id v5 = [(AVNewsWidgetPlayerLegacyBehavior *)self legacyDelegate];
  v3 = [(AVNewsWidgetPlayerBehavior *)self behaviorContext];
  v4 = [v3 playerViewController];
  [v5 playerViewControllerWillCancelContentTransition:v4];
}

- (void)didCompleteContentTransition
{
  id v5 = [(AVNewsWidgetPlayerLegacyBehavior *)self legacyDelegate];
  v3 = [(AVNewsWidgetPlayerBehavior *)self behaviorContext];
  v4 = [v3 playerViewController];
  [v5 playerViewControllerDidCompleteContentTransition:v4];
}

- (void)willCompleteContentTransition
{
  id v5 = [(AVNewsWidgetPlayerLegacyBehavior *)self legacyDelegate];
  v3 = [(AVNewsWidgetPlayerBehavior *)self behaviorContext];
  v4 = [v3 playerViewController];
  [v5 playerViewControllerWillCompleteContentTransition:v4];
}

- (void)didUpdateContentTransitionProgress:(double)a3
{
  id v7 = [(AVNewsWidgetPlayerLegacyBehavior *)self legacyDelegate];
  id v5 = [(AVNewsWidgetPlayerBehavior *)self behaviorContext];
  v6 = [v5 playerViewController];
  [v7 playerViewController:v6 didUpdateContentTransitionProgress:a3];
}

- (void)willBeginContentTransition
{
  id v5 = [(AVNewsWidgetPlayerLegacyBehavior *)self legacyDelegate];
  v3 = [(AVNewsWidgetPlayerBehavior *)self behaviorContext];
  v4 = [v3 playerViewController];
  [v5 playerViewControllerWillBeginContentTransition:v4];
}

- (id)playerForContentTransitionType:(int64_t)a3
{
  id v5 = [(AVNewsWidgetPlayerLegacyBehavior *)self legacyDelegate];
  v6 = [(AVNewsWidgetPlayerBehavior *)self behaviorContext];
  id v7 = [v6 playerViewController];
  v8 = [v5 playerViewController:v7 playerForContentTransitionType:a3];

  return v8;
}

@end