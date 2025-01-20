@interface HUCameraPlayerAccessoryViewController
+ (id)_newLabel;
- (BOOL)_shouldShortCircuitBlurEffect;
- (BOOL)canShowOverlayContent;
- (BOOL)forceLoadingIndicatorToDisplay;
- (BOOL)reachabilityEventWasOffline;
- (BOOL)shouldShortCircuitLoadingIndicator;
- (BOOL)shouldShowLoadingIndicatorForClipPlayback;
- (BOOL)showingError;
- (BOOL)showingLoadingIndicator;
- (BOOL)showingNoActivity;
- (HFCameraPlaybackEngine)playbackEngine;
- (HFCameraRecordingEvent)lastDisplayedEvent;
- (HUCameraLoadingActivityIndicatorView)loadingActivityIndicator;
- (HUCameraPlayerAccessoryViewController)initWithPlaybackEngine:(id)a3;
- (UIImageView)noResponseView;
- (UILabel)noActivityLabel;
- (UILabel)primaryErrorLabel;
- (UILabel)secondaryErrorLabel;
- (UIView)loadingOverlayView;
- (id)_errorStringDetailsForError:(id)a3;
- (unint64_t)currentAccessMode;
- (unint64_t)lastEngineMode;
- (void)_displayReachabilityMessageForEvent:(id)a3;
- (void)_updateAllOverlayStateAnimated:(BOOL)a3;
- (void)_updateErrorStateAnimated:(BOOL)a3;
- (void)_updateLoadingStateAnimated:(BOOL)a3;
- (void)_updateNoActivityStateAnimated:(BOOL)a3;
- (void)_updateStateAnimated:(BOOL)a3 usingBlock:(id)a4;
- (void)hu_reloadData;
- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6;
- (void)playbackEngine:(id)a3 didUpdatePlaybackError:(id)a4;
- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4;
- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4;
- (void)setCanShowOverlayContent:(BOOL)a3;
- (void)setCurrentAccessMode:(unint64_t)a3;
- (void)setForceLoadingIndicatorToDisplay:(BOOL)a3;
- (void)setLastDisplayedEvent:(id)a3;
- (void)setLastEngineMode:(unint64_t)a3;
- (void)setLoadingActivityIndicator:(id)a3;
- (void)setLoadingOverlayView:(id)a3;
- (void)setNoActivityLabel:(id)a3;
- (void)setNoResponseView:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setPrimaryErrorLabel:(id)a3;
- (void)setReachabilityEventWasOffline:(BOOL)a3;
- (void)setSecondaryErrorLabel:(id)a3;
- (void)setShouldShowLoadingIndicatorForClipPlayback:(BOOL)a3;
- (void)setShowingError:(BOOL)a3;
- (void)setShowingLoadingIndicator:(BOOL)a3;
- (void)setShowingNoActivity:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUCameraPlayerAccessoryViewController

- (void)setPlaybackEngine:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_playbackEngine);
    [v5 removeObserver:self];

    objc_storeWeak((id *)&self->_playbackEngine, obj);
    id v6 = objc_alloc_init(MEMORY[0x1E4F68FC0]);
    [v6 setPeriodicTimeUpdateInterval:&unk_1F19B6130];
    id v7 = objc_loadWeakRetained((id *)&self->_playbackEngine);
    [v7 addObserver:self withOptions:v6];
  }
}

- (HUCameraPlayerAccessoryViewController)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCameraPlayerAccessoryViewController;
  id v5 = [(HUCameraPlayerAccessoryViewController *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(HUCameraPlayerAccessoryViewController *)v5 setPlaybackEngine:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v87[12] = *MEMORY[0x1E4F143B8];
  v86.receiver = self;
  v86.super_class = (Class)HUCameraPlayerAccessoryViewController;
  [(HUCameraPlayerAccessoryViewController *)&v86 viewDidLoad];
  v3 = [(HUCameraPlayerAccessoryViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  id v4 = [(HUCameraPlayerAccessoryViewController *)self view];
  id v5 = [(HUCameraPlayerAccessoryViewController *)self loadingActivityIndicator];
  [v4 addSubview:v5];

  id v6 = [(HUCameraPlayerAccessoryViewController *)self view];
  id v7 = [(HUCameraPlayerAccessoryViewController *)self noActivityLabel];
  objc_msgSend(v6, "naui_addAutoLayoutSubview:", v7);

  objc_super v8 = [(HUCameraPlayerAccessoryViewController *)self view];
  v9 = [(HUCameraPlayerAccessoryViewController *)self primaryErrorLabel];
  [v8 addSubview:v9];

  v10 = [(HUCameraPlayerAccessoryViewController *)self view];
  v11 = [(HUCameraPlayerAccessoryViewController *)self secondaryErrorLabel];
  [v10 addSubview:v11];

  v12 = [(HUCameraPlayerAccessoryViewController *)self view];
  v13 = [(HUCameraPlayerAccessoryViewController *)self noResponseView];
  [v12 addSubview:v13];

  v14 = [(HUCameraPlayerAccessoryViewController *)self view];
  [v14 center];
  double v16 = v15;
  double v18 = v17;
  v19 = [(HUCameraPlayerAccessoryViewController *)self loadingActivityIndicator];
  objc_msgSend(v19, "setCenter:", v16, v18);

  v59 = (void *)MEMORY[0x1E4F28DC8];
  v85 = [(HUCameraPlayerAccessoryViewController *)self noActivityLabel];
  v83 = [v85 centerYAnchor];
  v84 = [(HUCameraPlayerAccessoryViewController *)self view];
  v82 = [v84 centerYAnchor];
  v81 = [v83 constraintEqualToAnchor:v82];
  v87[0] = v81;
  v80 = [(HUCameraPlayerAccessoryViewController *)self noActivityLabel];
  v78 = [v80 centerXAnchor];
  v79 = [(HUCameraPlayerAccessoryViewController *)self view];
  v77 = [v79 centerXAnchor];
  v76 = [v78 constraintEqualToAnchor:v77];
  v87[1] = v76;
  v75 = [(HUCameraPlayerAccessoryViewController *)self primaryErrorLabel];
  v73 = [v75 centerXAnchor];
  v74 = [(HUCameraPlayerAccessoryViewController *)self view];
  v72 = [v74 centerXAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v87[2] = v71;
  v70 = [(HUCameraPlayerAccessoryViewController *)self primaryErrorLabel];
  v68 = [v70 centerYAnchor];
  v69 = [(HUCameraPlayerAccessoryViewController *)self view];
  v67 = [v69 centerYAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v87[3] = v66;
  v65 = [(HUCameraPlayerAccessoryViewController *)self primaryErrorLabel];
  v63 = [v65 widthAnchor];
  v64 = [(HUCameraPlayerAccessoryViewController *)self view];
  v62 = [v64 readableContentGuide];
  v61 = [v62 widthAnchor];
  v60 = [v63 constraintEqualToAnchor:v61];
  v87[4] = v60;
  v58 = [(HUCameraPlayerAccessoryViewController *)self secondaryErrorLabel];
  v56 = [v58 topAnchor];
  v57 = [(HUCameraPlayerAccessoryViewController *)self primaryErrorLabel];
  v55 = [v57 bottomAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:6.0];
  v87[5] = v54;
  v53 = [(HUCameraPlayerAccessoryViewController *)self secondaryErrorLabel];
  v50 = [v53 leftAnchor];
  v52 = [(HUCameraPlayerAccessoryViewController *)self view];
  v51 = [v52 safeAreaLayoutGuide];
  v49 = [v51 leftAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:10.0];
  v87[6] = v48;
  v47 = [(HUCameraPlayerAccessoryViewController *)self secondaryErrorLabel];
  v44 = [v47 rightAnchor];
  v46 = [(HUCameraPlayerAccessoryViewController *)self view];
  v45 = [v46 safeAreaLayoutGuide];
  v43 = [v45 rightAnchor];
  v42 = [v44 constraintEqualToAnchor:v43 constant:-10.0];
  v87[7] = v42;
  v41 = [(HUCameraPlayerAccessoryViewController *)self noResponseView];
  v39 = [v41 bottomAnchor];
  v40 = [(HUCameraPlayerAccessoryViewController *)self primaryErrorLabel];
  v38 = [v40 topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:-10.0];
  v87[8] = v37;
  v36 = [(HUCameraPlayerAccessoryViewController *)self noResponseView];
  v34 = [v36 centerXAnchor];
  v35 = [(HUCameraPlayerAccessoryViewController *)self view];
  v33 = [v35 centerXAnchor];
  v20 = [v34 constraintEqualToAnchor:v33];
  v87[9] = v20;
  v21 = [(HUCameraPlayerAccessoryViewController *)self noResponseView];
  v22 = [v21 widthAnchor];
  v23 = [v22 constraintEqualToConstant:61.0];
  v87[10] = v23;
  v24 = [(HUCameraPlayerAccessoryViewController *)self noResponseView];
  v25 = [v24 heightAnchor];
  v26 = [v25 constraintEqualToConstant:50.0];
  v87[11] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:12];
  v28 = objc_msgSend(v27, "na_arrayByFlattening");
  [v59 activateConstraints:v28];

  [(HUCameraPlayerAccessoryViewController *)self _updateAllOverlayStateAnimated:0];
  v29 = [MEMORY[0x1E4F428B8] lightTextColor];
  v30 = [(HUCameraPlayerAccessoryViewController *)self primaryErrorLabel];
  [v30 setTextColor:v29];

  v31 = [MEMORY[0x1E4F428B8] lightTextColor];
  v32 = [(HUCameraPlayerAccessoryViewController *)self secondaryErrorLabel];
  [v32 setTextColor:v31];
}

- (void)setCanShowOverlayContent:(BOOL)a3
{
  if (self->_canShowOverlayContent != a3)
  {
    self->_canShowOverlayContent = a3;
    [(HUCameraPlayerAccessoryViewController *)self _updateAllOverlayStateAnimated:1];
  }
}

- (void)setShouldShowLoadingIndicatorForClipPlayback:(BOOL)a3
{
  if (self->_shouldShowLoadingIndicatorForClipPlayback != a3)
  {
    self->_shouldShowLoadingIndicatorForClipPlayback = a3;
    [(HUCameraPlayerAccessoryViewController *)self _updateLoadingStateAnimated:1];
  }
}

- (void)hu_reloadData
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HUCameraPlayerAccessoryViewController_hu_reloadData__block_invoke;
  block[3] = &unk_1E6386018;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__HUCameraPlayerAccessoryViewController_hu_reloadData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAllOverlayStateAnimated:1];
}

- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6
{
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4
{
}

- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__HUCameraPlayerAccessoryViewController_playbackEngine_didUpdateTimeControlStatus___block_invoke;
  block[3] = &unk_1E6386018;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __83__HUCameraPlayerAccessoryViewController_playbackEngine_didUpdateTimeControlStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLoadingStateAnimated:1];
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackError:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__HUCameraPlayerAccessoryViewController_playbackEngine_didUpdatePlaybackError___block_invoke;
  block[3] = &unk_1E6386018;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __79__HUCameraPlayerAccessoryViewController_playbackEngine_didUpdatePlaybackError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateErrorStateAnimated:1];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateLoadingStateAnimated:1];
}

- (void)_updateAllOverlayStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[HUCameraPlayerAccessoryViewController _updateLoadingStateAnimated:](self, "_updateLoadingStateAnimated:");
  [(HUCameraPlayerAccessoryViewController *)self _updateNoActivityStateAnimated:v3];

  [(HUCameraPlayerAccessoryViewController *)self _updateErrorStateAnimated:v3];
}

- (void)_updateLoadingStateAnimated:(BOOL)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([(HUCameraPlayerAccessoryViewController *)self shouldShortCircuitLoadingIndicator])
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
      int v32 = 134217984;
      *(void *)v33 = [v5 timeControlStatus];
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Short-circuiting accessory view loading UI. %lu", (uint8_t *)&v32, 0xCu);
    }
    id v6 = [(HUCameraPlayerAccessoryViewController *)self loadingActivityIndicator];
    [v6 setAlpha:0.0];

    id v7 = [(HUCameraPlayerAccessoryViewController *)self loadingOverlayView];
    [v7 setAlpha:0.0];

    [(HUCameraPlayerAccessoryViewController *)self setShowingLoadingIndicator:0];
    return;
  }
  int v8 = [(HUCameraPlayerAccessoryViewController *)self showingLoadingIndicator];
  v9 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
  v10 = [v9 playbackPosition];
  uint64_t v11 = [v10 contentType];

  v12 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
  v13 = v12;
  if (v11 == 1)
  {
    if ([v12 timelineState] == 3)
    {

LABEL_10:
      [(HUCameraPlayerAccessoryViewController *)self canShowOverlayContent];
LABEL_15:
      [(HUCameraPlayerAccessoryViewController *)self setShowingLoadingIndicator:0];
      goto LABEL_16;
    }
    double v15 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
    uint64_t v16 = [v15 timelineState];

    if (v16 == 4) {
      goto LABEL_10;
    }
    BOOL v14 = [(HUCameraPlayerAccessoryViewController *)self shouldShowLoadingIndicatorForClipPlayback];
  }
  else
  {
    BOOL v14 = [v12 timeControlStatus] == 1;
  }
  if (![(HUCameraPlayerAccessoryViewController *)self canShowOverlayContent] || !v14) {
    goto LABEL_15;
  }
  double v17 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
  double v18 = [v17 playbackError];
  [(HUCameraPlayerAccessoryViewController *)self setShowingLoadingIndicator:v18 == 0];

LABEL_16:
  if ([(HUCameraPlayerAccessoryViewController *)self forceLoadingIndicatorToDisplay]) {
    [(HUCameraPlayerAccessoryViewController *)self setShowingLoadingIndicator:1];
  }
  int v19 = [(HUCameraPlayerAccessoryViewController *)self showingLoadingIndicator];
  v20 = HFLogForCategory();
  v21 = v20;
  if (v8 == v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      BOOL v26 = [(HUCameraPlayerAccessoryViewController *)self showingLoadingIndicator];
      v27 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
      v28 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
      v29 = [v28 playbackPosition];
      uint64_t v30 = [v29 contentType];
      v31 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
      int v32 = 67109890;
      *(_DWORD *)v33 = v26;
      *(_WORD *)&v33[4] = 2112;
      *(void *)&v33[6] = v27;
      __int16 v34 = 2048;
      uint64_t v35 = v30;
      __int16 v36 = 2048;
      uint64_t v37 = [v31 timeControlStatus];
      _os_log_debug_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEBUG, "Loading state unchanged. Showing:%{BOOL}d for engine:%@ contentType:%lu timeControlStatus:%lu.", (uint8_t *)&v32, 0x26u);
    }
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 67109120;
      *(_DWORD *)v33 = [(HUCameraPlayerAccessoryViewController *)self showingLoadingIndicator];
      _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "Loading state updated. Showing:%{BOOL}d.", (uint8_t *)&v32, 8u);
    }

    double v22 = (double)[(HUCameraPlayerAccessoryViewController *)self showingLoadingIndicator];
    v23 = [(HUCameraPlayerAccessoryViewController *)self loadingActivityIndicator];
    [v23 setAlpha:v22];

    if ([(HUCameraPlayerAccessoryViewController *)self showingLoadingIndicator]) {
      double v24 = 0.5;
    }
    else {
      double v24 = 0.0;
    }
    v25 = [(HUCameraPlayerAccessoryViewController *)self loadingOverlayView];
    [v25 setAlpha:v24];
  }
}

- (void)_updateNoActivityStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(HUCameraPlayerAccessoryViewController *)self showingNoActivity];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__HUCameraPlayerAccessoryViewController__updateNoActivityStateAnimated___block_invoke;
  v7[3] = &unk_1E6388318;
  v7[4] = self;
  [(HUCameraPlayerAccessoryViewController *)self setShowingNoActivity:__72__HUCameraPlayerAccessoryViewController__updateNoActivityStateAnimated___block_invoke((uint64_t)v7) != 0];
  if (v5 != [(HUCameraPlayerAccessoryViewController *)self showingNoActivity])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__HUCameraPlayerAccessoryViewController__updateNoActivityStateAnimated___block_invoke_2;
    v6[3] = &unk_1E6386018;
    v6[4] = self;
    [(HUCameraPlayerAccessoryViewController *)self _updateStateAnimated:v3 usingBlock:v6];
  }
}

uint64_t __72__HUCameraPlayerAccessoryViewController__updateNoActivityStateAnimated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) playbackEngine];
  BOOL v3 = [v2 playbackPosition];

  if ([*(id *)(a1 + 32) canShowOverlayContent] && objc_msgSend(v3, "contentType") == 1)
  {
    id v4 = [*(id *)(a1 + 32) playbackEngine];
    if ([v4 timelineState] == 4)
    {
      BOOL v5 = [*(id *)(a1 + 32) playbackEngine];
      uint64_t v6 = [v5 isUserScrubbing];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __72__HUCameraPlayerAccessoryViewController__updateNoActivityStateAnimated___block_invoke_2(uint64_t a1)
{
  double v2 = (double)[*(id *)(a1 + 32) showingNoActivity];
  id v3 = [*(id *)(a1 + 32) noActivityLabel];
  [v3 setAlpha:v2];
}

- (void)_updateErrorStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
    return;
  }
  BOOL v52 = v3;
  int v5 = [(HUCameraPlayerAccessoryViewController *)self showingError];
  uint64_t v6 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
  v53 = [v6 playbackError];

  if ([(HUCameraPlayerAccessoryViewController *)self canShowOverlayContent] && v53)
  {
    [(HUCameraPlayerAccessoryViewController *)self setShowingError:1];
  }
  else
  {
    id v7 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
    int v8 = [v7 cameraProfile];
    -[HUCameraPlayerAccessoryViewController setShowingError:](self, "setShowingError:", objc_msgSend(v8, "hf_shouldDisableLiveStream"));
  }
  v9 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
  v10 = [v9 playbackPosition];
  uint64_t v11 = [v10 contentType];

  if (v11 == 1) {
    [(HUCameraPlayerAccessoryViewController *)self setShowingError:0];
  }
  v12 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
  uint64_t v13 = [v12 timelineState];

  if (v13 != 3) {
    goto LABEL_11;
  }
  [(HUCameraPlayerAccessoryViewController *)self setShowingError:1];
  if ([(HUCameraPlayerAccessoryViewController *)self reachabilityEventWasOffline]) {
    goto LABEL_12;
  }
  BOOL v14 = [(HUCameraPlayerAccessoryViewController *)self lastDisplayedEvent];
  double v15 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
  uint64_t v16 = [v15 currentClip];
  char v17 = [v14 isEqual:v16];

  if ((v17 & 1) == 0)
  {
LABEL_12:
    int v19 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
    v20 = [v19 currentClip];
    [(HUCameraPlayerAccessoryViewController *)self setLastDisplayedEvent:v20];

    objc_opt_class();
    v21 = [(HUCameraPlayerAccessoryViewController *)self lastDisplayedEvent];
    if (objc_opt_isKindOfClass()) {
      double v22 = v21;
    }
    else {
      double v22 = 0;
    }
    id v23 = v22;

    double v24 = [v23 endEvent];

    [(HUCameraPlayerAccessoryViewController *)self setReachabilityEventWasOffline:v24 == 0];
    int v18 = 1;
  }
  else
  {
LABEL_11:
    int v18 = 0;
  }
  unint64_t v25 = [(HUCameraPlayerAccessoryViewController *)self currentAccessMode];
  BOOL v26 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
  v27 = [v26 cameraProfile];
  v28 = [v27 userSettings];
  uint64_t v29 = [v28 currentAccessMode];

  if (v25 != v29)
  {
    uint64_t v30 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
    v31 = [v30 cameraProfile];
    int v32 = [v31 userSettings];
    -[HUCameraPlayerAccessoryViewController setCurrentAccessMode:](self, "setCurrentAccessMode:", [v32 currentAccessMode]);

    int v18 = 1;
  }
  unint64_t v33 = [(HUCameraPlayerAccessoryViewController *)self lastEngineMode];
  __int16 v34 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
  if (v33 == [v34 engineMode])
  {
    uint64_t v35 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
    uint64_t v36 = [v35 engineMode];

    if (v36) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v37 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
  -[HUCameraPlayerAccessoryViewController setLastEngineMode:](self, "setLastEngineMode:", [v37 engineMode]);

  int v18 = 1;
LABEL_23:
  int v38 = [(HUCameraPlayerAccessoryViewController *)self showingError];
  if (v18 || v5 != v38)
  {
    v39 = HFLogForCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
      v51 = [v40 cameraProfile];
      v50 = [v51 userSettings];
      v48 = objc_msgSend(v50, "hu_currentAccessModeDescription");
      v49 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
      v41 = [v49 cameraProfile];
      int v42 = objc_msgSend(v41, "hf_shouldDisableLiveStream");
      BOOL v43 = [(HUCameraPlayerAccessoryViewController *)self showingError];
      v44 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
      v45 = [v44 timelineStateDescription];
      v46 = [(HUCameraPlayerAccessoryViewController *)self lastDisplayedEvent];
      *(_DWORD *)buf = 138413570;
      v59 = v48;
      __int16 v60 = 1024;
      int v61 = v42;
      __int16 v62 = 1024;
      BOOL v63 = v43;
      __int16 v64 = 2112;
      v65 = v45;
      __int16 v66 = 1024;
      BOOL v67 = [v46 containerType] == 1;
      __int16 v68 = 1024;
      BOOL v69 = [(HUCameraPlayerAccessoryViewController *)self reachabilityEventWasOffline];
      _os_log_impl(&dword_1BE345000, v39, OS_LOG_TYPE_DEFAULT, "Update AccessoryController cameraAccessMode:%@ liveStreamDisabled:%{BOOL}d showingError:%{BOOL}d timelineState:%@ containerTypeRecording:%{BOOL}d offline:%{BOOL}d", buf, 0x2Eu);
    }
    objc_initWeak((id *)buf, self);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __67__HUCameraPlayerAccessoryViewController__updateErrorStateAnimated___block_invoke;
    v55[3] = &unk_1E63882F0;
    objc_copyWeak(&v57, (id *)buf);
    id v56 = v53;
    [(HUCameraPlayerAccessoryViewController *)self _updateStateAnimated:v52 usingBlock:v55];
    v47 = HFLogForCategory();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_1BE345000, v47, OS_LOG_TYPE_DEFAULT, "Accessory controller did update error state after change.", v54, 2u);
    }

    objc_destroyWeak(&v57);
    objc_destroyWeak((id *)buf);
  }
}

void __67__HUCameraPlayerAccessoryViewController__updateErrorStateAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v2 = [WeakRetained playbackEngine];
  BOOL v3 = [v2 cameraProfile];
  int v4 = objc_msgSend(v3, "hf_shouldDisableLiveStream");

  int v5 = [WeakRetained playbackEngine];
  uint64_t v6 = [v5 cameraProfile];
  id v7 = v6;
  if (!v4)
  {
    uint64_t v14 = objc_msgSend(v6, "hf_thermalShutdownMode");

    if (v14 != 1 && v14 != 2)
    {
      double v15 = *(void **)(a1 + 32);
      if (!v15) {
        goto LABEL_15;
      }
      [v15 code];
      uint64_t v16 = HFLocalizedString();
      char v17 = [WeakRetained primaryErrorLabel];
      [v17 setText:v16];

      uint64_t v18 = [WeakRetained _errorStringDetailsForError:*(void *)(a1 + 32)];
      goto LABEL_14;
    }
LABEL_13:
    int v19 = HFLocalizedString();
    v20 = [WeakRetained primaryErrorLabel];
    [v20 setText:v19];

    uint64_t v18 = HFLocalizedString();
LABEL_14:
    v21 = (void *)v18;
    double v22 = [WeakRetained secondaryErrorLabel];
    [v22 setText:v21];

    goto LABEL_15;
  }
  int v8 = [v6 userSettings];
  uint64_t v9 = [v8 currentAccessMode];

  v10 = [WeakRetained playbackEngine];
  uint64_t v11 = [v10 cameraProfile];
  v12 = [v11 userSettings];
  int v13 = [v12 isCameraManuallyDisabled];

  if (v13 || v9 == 3 || !v9) {
    goto LABEL_13;
  }
LABEL_15:
  id v23 = [WeakRetained playbackEngine];
  uint64_t v24 = [v23 timelineState];

  if (v24 == 3)
  {
    unint64_t v25 = [WeakRetained playbackEngine];
    BOOL v26 = [v25 currentClip];
    [WeakRetained _displayReachabilityMessageForEvent:v26];
  }
  double v27 = (double)[WeakRetained showingError];
  v28 = [WeakRetained primaryErrorLabel];
  [v28 setAlpha:v27];

  double v29 = (double)[WeakRetained showingError];
  uint64_t v30 = [WeakRetained secondaryErrorLabel];
  [v30 setAlpha:v29];

  if ([WeakRetained showingError]) {
    double v31 = 0.5;
  }
  else {
    double v31 = 0.0;
  }
  int v32 = [WeakRetained noResponseView];
  [v32 setAlpha:v31];
}

- (void)_updateStateAnimated:(BOOL)a3 usingBlock:(id)a4
{
  if (a3) {
    [MEMORY[0x1E4F42FF0] animateWithDuration:a4 animations:0.3];
  }
  else {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (id)_errorStringDetailsForError:(id)a3
{
  [a3 code];
  BOOL v3 = HFLocalizedString();

  return v3;
}

- (BOOL)shouldShortCircuitLoadingIndicator
{
  if ([(HUCameraPlayerAccessoryViewController *)self forceLoadingIndicatorToDisplay]) {
    return 0;
  }
  int v4 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
  if ([v4 timeControlStatus])
  {
    int v5 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
    uint64_t v6 = [v5 cameraProfile];
    if (objc_msgSend(v6, "hf_shouldDisableLiveStream"))
    {
      id v7 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
      int v8 = [v7 playbackPosition];
      BOOL v3 = [v8 contentType] == 0;
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (BOOL)_shouldShortCircuitBlurEffect
{
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
    return 1;
  }
  if ([(HUCameraPlayerAccessoryViewController *)self showingError]) {
    return 0;
  }
  int v4 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
  int v5 = [v4 playbackPosition];
  if ([v5 contentType])
  {
    uint64_t v6 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
    if ([v6 timeControlStatus] == 2)
    {
      id v7 = [(HUCameraPlayerAccessoryViewController *)self playbackEngine];
      BOOL v3 = [v7 timelineState] == 2;
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (void)_displayReachabilityMessageForEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    int v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Unable to display a reachability message for a non-reachability event:%@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v9 = [(HUCameraPlayerAccessoryViewController *)self primaryErrorLabel];
  [v9 setText:&stru_1F18F92B8];

  v10 = [v7 displayDescription];
  uint64_t v11 = [(HUCameraPlayerAccessoryViewController *)self secondaryErrorLabel];
  [v11 setText:v10];
}

- (HUCameraLoadingActivityIndicatorView)loadingActivityIndicator
{
  loadingActivityIndicator = self->_loadingActivityIndicator;
  if (!loadingActivityIndicator)
  {
    id v4 = [HUCameraLoadingActivityIndicatorView alloc];
    id v5 = [(HUCameraPlayerAccessoryViewController *)self view];
    [v5 bounds];
    uint64_t v6 = -[HUCameraLoadingActivityIndicatorView initWithFrame:](v4, "initWithFrame:");
    id v7 = self->_loadingActivityIndicator;
    self->_loadingActivityIndicator = v6;

    [(HUCameraLoadingActivityIndicatorView *)self->_loadingActivityIndicator setAutoresizingMask:18];
    loadingActivityIndicator = self->_loadingActivityIndicator;
  }

  return loadingActivityIndicator;
}

- (UILabel)primaryErrorLabel
{
  primaryErrorLabel = self->_primaryErrorLabel;
  if (!primaryErrorLabel)
  {
    id v4 = (UILabel *)[(id)objc_opt_class() _newLabel];
    id v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
    [(UILabel *)v4 setFont:v5];

    [(UILabel *)v4 setNumberOfLines:0];
    [(UILabel *)v4 setAlpha:0.0];
    uint64_t v6 = self->_primaryErrorLabel;
    self->_primaryErrorLabel = v4;

    primaryErrorLabel = self->_primaryErrorLabel;
  }

  return primaryErrorLabel;
}

- (UILabel)secondaryErrorLabel
{
  secondaryErrorLabel = self->_secondaryErrorLabel;
  if (!secondaryErrorLabel)
  {
    id v4 = (UILabel *)[(id)objc_opt_class() _newLabel];
    id v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
    [(UILabel *)v4 setFont:v5];

    [(UILabel *)v4 setNumberOfLines:0];
    [(UILabel *)v4 setAlpha:0.0];
    uint64_t v6 = self->_secondaryErrorLabel;
    self->_secondaryErrorLabel = v4;

    secondaryErrorLabel = self->_secondaryErrorLabel;
  }

  return secondaryErrorLabel;
}

- (UILabel)noActivityLabel
{
  noActivityLabel = self->_noActivityLabel;
  if (!noActivityLabel)
  {
    id v4 = (UILabel *)[(id)objc_opt_class() _newLabel];
    id v5 = _HULocalizedStringWithDefaultValue(@"HUCameraPlayerNoActivity", @"HUCameraPlayerNoActivity", 1);
    [(UILabel *)v4 setText:v5];

    uint64_t v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
    [(UILabel *)v4 setFont:v6];

    [(UILabel *)v4 setAlpha:0.0];
    id v7 = self->_noActivityLabel;
    self->_noActivityLabel = v4;

    noActivityLabel = self->_noActivityLabel;
  }

  return noActivityLabel;
}

+ (id)_newLabel
{
  id v2 = objc_alloc(MEMORY[0x1E4F42B38]);
  BOOL v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v4 = [MEMORY[0x1E4F428B8] systemGrayColor];
  [v3 setTextColor:v4];

  id v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v3 setFont:v5];

  [v3 setTextAlignment:1];
  uint64_t v6 = [v3 layer];
  [v6 setShadowRadius:3.0];

  id v7 = [v3 layer];
  LODWORD(v8) = *(_DWORD *)"333?";
  [v7 setShadowOpacity:v8];

  id v9 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
  uint64_t v10 = [v9 CGColor];
  uint64_t v11 = [v3 layer];
  [v11 setShadowColor:v10];

  int v12 = [v3 layer];
  objc_msgSend(v12, "setShadowOffset:", 0.0, 0.0);

  [v3 setTextAlignment:1];
  id v13 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:16.0];
  [v3 setFont:v13];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v3;
}

- (UIImageView)noResponseView
{
  noResponseView = self->_noResponseView;
  if (!noResponseView)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_cameraErrorImage");
    id v5 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v4];
    [(UIImageView *)v5 setContentMode:1];
    [(UIImageView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UIImageView *)v5 setTintColor:v6];

    [(UIImageView *)v5 setAlpha:0.0];
    id v7 = self->_noResponseView;
    self->_noResponseView = v5;

    noResponseView = self->_noResponseView;
  }

  return noResponseView;
}

- (BOOL)showingError
{
  return self->_showingError;
}

- (void)setShowingError:(BOOL)a3
{
  self->_showingError = a3;
}

- (BOOL)canShowOverlayContent
{
  return self->_canShowOverlayContent;
}

- (BOOL)shouldShowLoadingIndicatorForClipPlayback
{
  return self->_shouldShowLoadingIndicatorForClipPlayback;
}

- (HFCameraPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (HFCameraPlaybackEngine *)WeakRetained;
}

- (UIView)loadingOverlayView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadingOverlayView);

  return (UIView *)WeakRetained;
}

- (void)setLoadingOverlayView:(id)a3
{
}

- (BOOL)forceLoadingIndicatorToDisplay
{
  return self->_forceLoadingIndicatorToDisplay;
}

- (void)setForceLoadingIndicatorToDisplay:(BOOL)a3
{
  self->_forceLoadingIndicatorToDisplay = a3;
}

- (void)setNoResponseView:(id)a3
{
}

- (void)setLoadingActivityIndicator:(id)a3
{
}

- (void)setNoActivityLabel:(id)a3
{
}

- (void)setPrimaryErrorLabel:(id)a3
{
}

- (void)setSecondaryErrorLabel:(id)a3
{
}

- (BOOL)showingNoActivity
{
  return self->_showingNoActivity;
}

- (void)setShowingNoActivity:(BOOL)a3
{
  self->_showingNoActivity = a3;
}

- (BOOL)showingLoadingIndicator
{
  return self->_showingLoadingIndicator;
}

- (void)setShowingLoadingIndicator:(BOOL)a3
{
  self->_showingLoadingIndicator = a3;
}

- (unint64_t)currentAccessMode
{
  return self->_currentAccessMode;
}

- (void)setCurrentAccessMode:(unint64_t)a3
{
  self->_currentAccessMode = a3;
}

- (HFCameraRecordingEvent)lastDisplayedEvent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastDisplayedEvent);

  return (HFCameraRecordingEvent *)WeakRetained;
}

- (void)setLastDisplayedEvent:(id)a3
{
}

- (BOOL)reachabilityEventWasOffline
{
  return self->_reachabilityEventWasOffline;
}

- (void)setReachabilityEventWasOffline:(BOOL)a3
{
  self->_reachabilityEventWasOffline = a3;
}

- (unint64_t)lastEngineMode
{
  return self->_lastEngineMode;
}

- (void)setLastEngineMode:(unint64_t)a3
{
  self->_lastEngineMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastDisplayedEvent);
  objc_storeStrong((id *)&self->_secondaryErrorLabel, 0);
  objc_storeStrong((id *)&self->_primaryErrorLabel, 0);
  objc_storeStrong((id *)&self->_noActivityLabel, 0);
  objc_storeStrong((id *)&self->_loadingActivityIndicator, 0);
  objc_storeStrong((id *)&self->_noResponseView, 0);
  objc_destroyWeak((id *)&self->_loadingOverlayView);

  objc_destroyWeak((id *)&self->_playbackEngine);
}

@end