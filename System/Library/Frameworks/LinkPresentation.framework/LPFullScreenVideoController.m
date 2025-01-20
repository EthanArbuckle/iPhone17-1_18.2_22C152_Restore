@interface LPFullScreenVideoController
- (BOOL)playerViewControllerShouldMuteVolumeForFullScreenDismissalTransition:(id)a3;
- (LPFullScreenVideoController)initWithPlayer:(id)a3 sourceView:(id)a4;
- (void)didCompleteDismissal;
- (void)dismiss;
- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)prepareForDisplayWithCompletionHandler:(id)a3;
- (void)present;
- (void)setUpFullScreenVideoViewControllerIfNeeded;
@end

@implementation LPFullScreenVideoController

- (LPFullScreenVideoController)initWithPlayer:(id)a3 sourceView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)LPFullScreenVideoController;
  v9 = [(LPFullScreenVideoController *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceView, a4);
    objc_storeStrong((id *)&v10->_player, a3);
    id v11 = objc_alloc(MEMORY[0x1E4F16768]);
    [v8 bounds];
    double v13 = v12;
    [v8 bounds];
    uint64_t v14 = objc_msgSend(v11, "initWithFrame:", 0.0, 0.0, v13);
    playerLayerView = v10->_playerLayerView;
    v10->_playerLayerView = (__AVPlayerLayerView *)v14;

    v16 = [(__AVPlayerLayerView *)v10->_playerLayerView layer];
    [v16 setMasksToBounds:1];

    v17 = [(__AVPlayerLayerView *)v10->_playerLayerView playerLayer];
    [v17 setPlayer:v7];

    v18 = v10;
  }

  return v10;
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(LPFullScreenVideoController *)self setUpFullScreenVideoViewControllerIfNeeded];
  [(LPAVPlayerViewController *)self->_playerViewController prepareForDisplayWithCompletionHandler:v4];
}

- (void)setUpFullScreenVideoViewControllerIfNeeded
{
  if (!self->_playerController)
  {
    v3 = (AVPlayerController *)[objc_alloc(MEMORY[0x1E4F16748]) initWithPlayer:self->_player];
    playerController = self->_playerController;
    self->_playerController = v3;

    v5 = objc_alloc_init(LPAVPlayerViewController);
    playerViewController = self->_playerViewController;
    self->_playerViewController = v5;

    [(LPAVPlayerViewController *)self->_playerViewController setPlayer:self->_player];
    [(LPAVPlayerViewController *)self->_playerViewController setDelegate:self];
    [(LPAVPlayerViewController *)self->_playerViewController setEntersFullScreenWhenPlaybackBegins:1];
    [(LPAVPlayerViewController *)self->_playerViewController setAllowsPictureInPicturePlayback:0];
    [(LPAVPlayerViewController *)self->_playerViewController setUpdatesNowPlayingInfoCenter:0];
    [(LPAVPlayerViewController *)self->_playerViewController setCanPausePlaybackWhenExitingFullScreen:0];
    [(LPAVPlayerViewController *)self->_playerViewController setPlayerController:self->_playerController];
    playerLayerView = self->_playerLayerView;
    id v8 = self->_playerController;
    [(__AVPlayerLayerView *)playerLayerView setPlayerController:v8];
  }
}

- (void)present
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__LPFullScreenVideoController_present__block_invoke;
  v2[3] = &unk_1E5B04DF0;
  v2[4] = self;
  [(LPFullScreenVideoController *)self prepareForDisplayWithCompletionHandler:v2];
}

uint64_t __38__LPFullScreenVideoController_present__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) showFullScreenPresentationFromView:*(void *)(*(void *)(a1 + 32) + 8) completion:0];
}

- (void)dismiss
{
  playerViewController = self->_playerViewController;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__LPFullScreenVideoController_dismiss__block_invoke;
  v3[3] = &unk_1E5B04DF0;
  v3[4] = self;
  [(LPAVPlayerViewController *)playerViewController dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __38__LPFullScreenVideoController_dismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didCompleteDismissal];
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__LPFullScreenVideoController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke;
  v5[3] = &unk_1E5B05EF8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __106__LPFullScreenVideoController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2;
  v4[3] = &unk_1E5B05EF8;
  [a4 animateAlongsideTransition:v5 completion:v4];
}

void __106__LPFullScreenVideoController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  id v3 = [*(id *)(v1 + 8) configuration];
  [v3 fullScreenTransitionCornerRadius];
  objc_msgSend(v2, "_lp_setCornerRadius:");
}

void __106__LPFullScreenVideoController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "_lp_setCornerRadius:", 0.0);
  if (([v3 isCancelled] & 1) == 0) {
    [*(id *)(a1 + 32) didCompleteDismissal];
  }
}

- (void)didCompleteDismissal
{
  [(LPVisualMediaView *)self->_sourceView fullScreenVideoWillDismiss];
  [(LPVisualMediaView *)self->_sourceView fullScreenVideoDidDismiss];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__LPFullScreenVideoController_didCompleteDismissal__block_invoke;
  block[3] = &unk_1E5B04DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51__LPFullScreenVideoController_didCompleteDismissal__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) setVolume:0.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 40);

  return [v2 setMuted:0];
}

- (BOOL)playerViewControllerShouldMuteVolumeForFullScreenDismissalTransition:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_playerLayerView, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);

  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end