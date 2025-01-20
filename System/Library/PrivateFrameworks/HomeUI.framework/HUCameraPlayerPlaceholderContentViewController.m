@interface HUCameraPlayerPlaceholderContentViewController
- (BOOL)_shouldHidePlaceholderContentForCurrentAccessMode;
- (BOOL)_shouldShowDefaultPlaceholderContent;
- (BOOL)_shouldShowPlaceholderContentForUserScrubbing;
- (BOOL)cameraPlayerHasContentToShow;
- (BOOL)shouldShowPlaceholderContent;
- (HFCameraPlaybackEngine)playbackEngine;
- (HMCameraClip)lastRequestedClip;
- (HUCameraPlayerPlaceholderContentViewController)initWithPlaybackEngine:(id)a3;
- (UIImageView)placeholderImageView;
- (void)setCameraPlayerHasContentToShow:(BOOL)a3;
- (void)setLastRequestedClip:(id)a3;
- (void)setPlaceholderImageView:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)updatePlaceholderContent;
- (void)updatePlaceholderImage:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUCameraPlayerPlaceholderContentViewController

- (HUCameraPlayerPlaceholderContentViewController)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUCameraPlayerPlaceholderContentViewController;
  v5 = [(HUCameraPlayerPlaceholderContentViewController *)&v10 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_playbackEngine, v4);
    v8 = [MEMORY[0x1E4F68FC0] defaultOptions];
    [v4 addObserver:v6 withOptions:v8];
  }
  return v6;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HUCameraPlayerPlaceholderContentViewController;
  [(HUCameraPlayerPlaceholderContentViewController *)&v10 viewDidLoad];
  v3 = [(HUCameraPlayerPlaceholderContentViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  id v4 = [(HUCameraPlayerPlaceholderContentViewController *)self view];
  v5 = [(HUCameraPlayerPlaceholderContentViewController *)self placeholderImageView];
  objc_msgSend(v4, "naui_addAutoLayoutSubview:", v5);

  v6 = (void *)MEMORY[0x1E4F28DC8];
  id v7 = [(HUCameraPlayerPlaceholderContentViewController *)self placeholderImageView];
  v8 = [(HUCameraPlayerPlaceholderContentViewController *)self view];
  v9 = objc_msgSend(v6, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v7, v8);
  [v6 activateConstraints:v9];

  [(HUCameraPlayerPlaceholderContentViewController *)self updatePlaceholderContent];
}

- (void)setCameraPlayerHasContentToShow:(BOOL)a3
{
  if (self->_cameraPlayerHasContentToShow != a3)
  {
    self->_cameraPlayerHasContentToShow = a3;
    [(HUCameraPlayerPlaceholderContentViewController *)self updatePlaceholderContent];
  }
}

- (BOOL)shouldShowPlaceholderContent
{
  BOOL v3 = [(HUCameraPlayerPlaceholderContentViewController *)self _shouldShowDefaultPlaceholderContent];
  char v4 = [(HUCameraPlayerPlaceholderContentViewController *)self _shouldShowPlaceholderContentForUserScrubbing]|| v3;
  return v4 & ~[(HUCameraPlayerPlaceholderContentViewController *)self _shouldHidePlaceholderContentForCurrentAccessMode];
}

- (void)updatePlaceholderContent
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HUCameraPlayerPlaceholderContentViewController *)self playbackEngine];
  char v4 = [v3 playbackPosition];

  BOOL v5 = [(HUCameraPlayerPlaceholderContentViewController *)self shouldShowPlaceholderContent];
  if (v5)
  {
    v6 = [(HUCameraPlayerPlaceholderContentViewController *)self playbackEngine];
    id v7 = [v4 clipPlaybackDate];
    v8 = [v6 findClipPositionForDate:v7];

    v9 = [MEMORY[0x1E4F68F90] sharedManager];
    objc_super v10 = [(HUCameraPlayerPlaceholderContentViewController *)self playbackEngine];
    v11 = [v10 currentClip];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v13 = [(HUCameraPlayerPlaceholderContentViewController *)self playbackEngine];
      v14 = [v13 currentClip];
      [v8 offset];
      v15 = objc_msgSend(v9, "cachedPosterFrameImageForClip:offset:requestor:", v14, self);

      if (!v15)
      {
        v16 = [(HUCameraPlayerPlaceholderContentViewController *)self playbackEngine];
        v17 = [v16 currentClip];
        v15 = [v9 representativeImageForClip:v17];
      }
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  v18 = HFLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109376;
    v19[1] = v5;
    __int16 v20 = 1024;
    BOOL v21 = v15 != 0;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "Placeholder - should show:%{BOOL}d has image:%{BOOL}d", (uint8_t *)v19, 0xEu);
  }

  [(HUCameraPlayerPlaceholderContentViewController *)self updatePlaceholderImage:v15];
}

- (void)updatePlaceholderImage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__HUCameraPlayerPlaceholderContentViewController_updatePlaceholderImage___block_invoke;
  v6[3] = &unk_1E63850E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __73__HUCameraPlayerPlaceholderContentViewController_updatePlaceholderImage___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) placeholderImageView];
  BOOL v3 = [v2 layer];
  [v3 removeAllAnimations];

  id v4 = (void *)MEMORY[0x1E4F42FF0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__HUCameraPlayerPlaceholderContentViewController_updatePlaceholderImage___block_invoke_2;
  v6[3] = &unk_1E63850E0;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 animateWithDuration:v6 animations:0.3];
}

void __73__HUCameraPlayerPlaceholderContentViewController_updatePlaceholderImage___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) placeholderImageView];
  [v3 setImage:v2];

  if (*(void *)(a1 + 40)) {
    double v4 = (double)([*(id *)(a1 + 32) _shouldHidePlaceholderContentForCurrentAccessMode] ^ 1);
  }
  else {
    double v4 = 0.0;
  }
  id v5 = [*(id *)(a1 + 32) placeholderImageView];
  [v5 setAlpha:v4];
}

- (BOOL)_shouldShowPlaceholderContentForUserScrubbing
{
  BOOL v3 = [(HUCameraPlayerPlaceholderContentViewController *)self playbackEngine];
  if ([v3 isUserScrubbing])
  {
    double v4 = [(HUCameraPlayerPlaceholderContentViewController *)self playbackEngine];
    BOOL v5 = [v4 timelineState] == 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldHidePlaceholderContentForCurrentAccessMode
{
  BOOL v3 = [(HUCameraPlayerPlaceholderContentViewController *)self playbackEngine];
  double v4 = [v3 cameraProfile];
  BOOL v5 = [v4 userSettings];
  uint64_t v6 = [v5 currentAccessMode];

  id v7 = [(HUCameraPlayerPlaceholderContentViewController *)self playbackEngine];
  uint64_t v8 = [v7 engineMode];
  if (v6) {
    BOOL v9 = v6 == 3;
  }
  else {
    BOOL v9 = 1;
  }
  char v10 = v9;
  if (v8) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v10;
  }

  return v11;
}

- (BOOL)_shouldShowDefaultPlaceholderContent
{
  BOOL v3 = [(HUCameraPlayerPlaceholderContentViewController *)self playbackEngine];
  double v4 = [v3 playbackPosition];
  if ([v4 contentType] == 1)
  {
    BOOL v5 = [(HUCameraPlayerPlaceholderContentViewController *)self playbackEngine];
    if ([v5 timeControlStatus] == 1) {
      BOOL v6 = ![(HUCameraPlayerPlaceholderContentViewController *)self cameraPlayerHasContentToShow];
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (UIImageView)placeholderImageView
{
  placeholderImageView = self->_placeholderImageView;
  if (!placeholderImageView)
  {
    double v4 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:0];
    BOOL v5 = self->_placeholderImageView;
    self->_placeholderImageView = v4;

    placeholderImageView = self->_placeholderImageView;
  }

  return placeholderImageView;
}

- (BOOL)cameraPlayerHasContentToShow
{
  return self->_cameraPlayerHasContentToShow;
}

- (HFCameraPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (HFCameraPlaybackEngine *)WeakRetained;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (void)setPlaceholderImageView:(id)a3
{
}

- (HMCameraClip)lastRequestedClip
{
  return self->_lastRequestedClip;
}

- (void)setLastRequestedClip:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRequestedClip, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);

  objc_destroyWeak((id *)&self->_playbackEngine);
}

@end