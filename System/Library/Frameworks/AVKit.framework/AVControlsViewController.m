@interface AVControlsViewController
+ (double)autoHideInterval;
- (AVControlsViewController)init;
- (AVControlsViewControllerDelegate)delegate;
- (AVPlaybackSpeedCollection)playbackSpeedCollection;
- (BOOL)requiresLinearPlayback;
- (unint64_t)visibilityPolicy;
- (unint64_t)visibleControls;
- (void)setDelegate:(id)a3;
- (void)setPlaybackSpeedCollection:(id)a3;
- (void)setRequiresLinearPlayback:(BOOL)a3;
- (void)setVisibleControls:(unint64_t)a3;
@end

@implementation AVControlsViewController

- (void)setPlaybackSpeedCollection:(id)a3
{
}

- (AVPlaybackSpeedCollection)playbackSpeedCollection
{
  return self->_playbackSpeedCollection;
}

- (AVControlsViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVControlsViewController;
  result = [(AVControlsViewController *)&v3 init];
  if (result)
  {
    result->_visibleControls = 0;
    result->_requiresLinearPlayback = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_playbackSpeedCollection, 0);
}

- (unint64_t)visibilityPolicy
{
  return self->_visibilityPolicy;
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  self->_requiresLinearPlayback = a3;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (void)setDelegate:(id)a3
{
}

- (AVControlsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVControlsViewControllerDelegate *)WeakRetained;
}

- (void)setVisibleControls:(unint64_t)a3
{
  self->_visibleControls = a3;
}

- (unint64_t)visibleControls
{
  return self->_visibleControls;
}

+ (double)autoHideInterval
{
  return 3.0;
}

@end