@interface AVMobileChromeControlsViewController
- (AVMobileChromeControlsViewController)initWithPlayerViewController:(id)a3;
- (AVPlaybackControlsController)playbackControlsController;
- (AVPlaybackControlsView)playbackControlsView;
- (AVTurboModePlaybackControlsPlaceholderView)turboModeControlsView;
- (BOOL)prefersCompactFullScreenControls;
- (BOOL)showsFullScreenControl;
- (CGAffineTransform)transformForProminentPlayButton;
- (NSValue)embeddedInlineLayoutMargins;
- (id)displayModeControlsLayoutItem;
- (id)transportControlsLayoutItem;
- (id)volumeControlsLayoutItem;
- (void)_loadControlsViewIfNeeded;
- (void)_loadPlaybackControlsViewIfNeeded;
- (void)_updateStyleSheet;
- (void)dealloc;
- (void)didBeginIndirectUserInteraction;
- (void)didEndIndirectUserInteraction;
- (void)flashControlsWithDuration:(double)a3;
- (void)loadView;
- (void)setControlItems:(id)a3;
- (void)setEmbeddedInlineLayoutMargins:(id)a3;
- (void)setIncludedControls:(unint64_t)a3;
- (void)setOptimizeForPerformance:(BOOL)a3;
- (void)setPrefersCompactFullScreenControls:(BOOL)a3;
- (void)setRoutingConfiguration:(id)a3;
- (void)setShowsFullScreenControl:(BOOL)a3;
- (void)setTransformForProminentPlayButton:(CGAffineTransform *)a3;
- (void)setTransportBarCustomMenuItems:(id)a3;
- (void)setVolumeController:(id)a3;
- (void)toggleVisibility:(id)a3;
@end

@implementation AVMobileChromeControlsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turboModeControlsView, 0);
  objc_storeStrong((id *)&self->_playbackControlsView, 0);
  objc_storeStrong((id *)&self->_embeddedInlineLayoutMargins, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_playbackControlsController, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);

  objc_destroyWeak((id *)&self->_playerViewController);
}

- (void)setTransformForProminentPlayButton:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transformForProminentPlayButton.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transformForProminentPlayButton.c = v4;
  *(_OWORD *)&self->_transformForProminentPlayButton.tx = v3;
}

- (CGAffineTransform)transformForProminentPlayButton
{
  long long v3 = *(_OWORD *)&self[25].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[25].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[26].a;
  return self;
}

- (AVTurboModePlaybackControlsPlaceholderView)turboModeControlsView
{
  return self->_turboModeControlsView;
}

- (AVPlaybackControlsView)playbackControlsView
{
  return self->_playbackControlsView;
}

- (BOOL)prefersCompactFullScreenControls
{
  return self->_prefersCompactFullScreenControls;
}

- (NSValue)embeddedInlineLayoutMargins
{
  return self->_embeddedInlineLayoutMargins;
}

- (void)_updateStyleSheet
{
  long long v3 = [AVMobileChromeControlsStyleSheet alloc];
  long long v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v5 = [v4 traitCollection];
  v6 = [(AVMobileChromeControlsStyleSheet *)v3 initWithTraitCollection:v5 shouldUseCompactFullScreenSize:self->_prefersCompactFullScreenControls];
  styleSheet = self->_styleSheet;
  self->_styleSheet = v6;

  [(AVPlaybackControlsView *)self->_playbackControlsView setStyleSheet:self->_styleSheet];
  turboModeControlsView = self->_turboModeControlsView;
  v9 = self->_styleSheet;

  [(AVTurboModePlaybackControlsPlaceholderView *)turboModeControlsView setStyleSheet:v9];
}

- (void)_loadControlsViewIfNeeded
{
  if (!a1) {
    return;
  }
  v2 = [(id)a1 viewIfLoaded];
  if (v2 && !*(void *)(a1 + 1200))
  {
    id v14 = v2;
    if (!*(void *)(a1 + 1176))
    {
      long long v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v3 addObserver:a1 selector:sel__updateStyleSheet name:*MEMORY[0x1E4FB27A8] object:0];

      long long v4 = [AVMobileChromeControlsStyleSheet alloc];
      v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
      v6 = [v5 traitCollection];
      uint64_t v7 = [(AVMobileChromeControlsStyleSheet *)v4 initWithTraitCollection:v6 shouldUseCompactFullScreenSize:*(unsigned __int8 *)(a1 + 1184)];
      v8 = *(void **)(a1 + 1176);
      *(void *)(a1 + 1176) = v7;
    }
    if (([(id)a1 optimizeForPerformance] & 1) == 0)
    {
      -[AVMobileChromeControlsViewController _loadPlaybackControlsViewIfNeeded](a1);
LABEL_14:
      v2 = v14;
      goto LABEL_15;
    }
    v2 = v14;
    if (!*(void *)(a1 + 1208))
    {
      if (*(void *)(a1 + 1200))
      {
        v9 = _AVLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Never load the turboModePlaybackControlsPlaceholderView when the playbackControlsView is already loaded!", buf, 2u);
        }
      }
      v10 = [AVTurboModePlaybackControlsPlaceholderView alloc];
      [*(id *)(a1 + 1160) bounds];
      uint64_t v11 = -[AVTurboModePlaybackControlsPlaceholderView initWithFrame:styleSheet:](v10, "initWithFrame:styleSheet:", *(void *)(a1 + 1176));
      v12 = *(void **)(a1 + 1208);
      *(void *)(a1 + 1208) = v11;

      v13 = [(id)a1 playbackControlsController];
      [v13 turboModePlaybackControlsPlaceholderViewDidLoad:*(void *)(a1 + 1208)];

      [*(id *)(a1 + 1160) setActivePlaybackControlsView:*(void *)(a1 + 1208)];
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)_loadPlaybackControlsViewIfNeeded
{
  if (a1 && !*(void *)(a1 + 1200))
  {
    v2 = [AVPlaybackControlsView alloc];
    [*(id *)(a1 + 1160) bounds];
    uint64_t v3 = -[AVPlaybackControlsView initWithFrame:styleSheet:](v2, "initWithFrame:styleSheet:", *(void *)(a1 + 1176));
    long long v4 = *(void **)(a1 + 1200);
    *(void *)(a1 + 1200) = v3;

    [*(id *)(a1 + 1200) setOverrideLayoutMarginsWhenEmbeddedInline:*(void *)(a1 + 1192)];
    v5 = [*(id *)(a1 + 1200) routePickerView];
    v6 = [(id)a1 routingConfiguration];
    [v5 setRoutingConfiguration:v6];

    uint64_t v7 = [(id)a1 playbackControlsController];
    [v7 playbackControlsViewDidLoad:*(void *)(a1 + 1200)];

    [*(id *)(a1 + 1160) setActivePlaybackControlsView:*(void *)(a1 + 1200)];
    v8 = *(void **)(a1 + 1208);
    *(void *)(a1 + 1208) = 0;
  }
}

- (void)loadView
{
  uint64_t v3 = objc_alloc_init(AVMobileChromeControlsView);
  controlsView = self->_controlsView;
  self->_controlsView = v3;

  v5 = self->_controlsView;
  v6 = [MEMORY[0x1E4FB1618] clearColor];
  [(AVMobileChromeControlsView *)v5 setBackgroundColor:v6];

  uint64_t v7 = self->_controlsView;

  [(AVMobileChromeControlsViewController *)self setView:v7];
}

- (void)toggleVisibility:(id)a3
{
  id v3 = [(AVMobileChromeControlsViewController *)self playbackControlsController];
  [v3 togglePlaybackControlsVisibility];
}

- (void)flashControlsWithDuration:(double)a3
{
  id v4 = [(AVMobileChromeControlsViewController *)self playbackControlsController];
  [v4 flashPlaybackControlsWithDuration:a3];
}

- (void)didEndIndirectUserInteraction
{
  id v2 = [(AVMobileChromeControlsViewController *)self playbackControlsController];
  [v2 endShowingItemsDueToIndirectUserInteraction];
}

- (void)didBeginIndirectUserInteraction
{
  id v2 = [(AVMobileChromeControlsViewController *)self playbackControlsController];
  [v2 beginShowingItemsDueToIndirectUserInteraction];
}

- (BOOL)showsFullScreenControl
{
  id v2 = [(AVMobileChromeControlsViewController *)self playbackControlsController];
  char v3 = [v2 allowsEnteringFullScreen];

  return v3;
}

- (void)setShowsFullScreenControl:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVMobileChromeControlsViewController *)self playbackControlsController];
  [v4 setAllowsEnteringFullScreen:v3];
}

- (id)volumeControlsLayoutItem
{
  -[AVMobileChromeControlsViewController _loadPlaybackControlsViewIfNeeded]((uint64_t)self);
  playbackControlsView = self->_playbackControlsView;

  return [(AVPlaybackControlsView *)playbackControlsView volumeControls];
}

- (void)setVolumeController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromeControlsViewController;
  id v4 = a3;
  [(AVMobileControlsViewController *)&v6 setVolumeController:v4];
  v5 = [(AVMobileChromeControlsViewController *)self playbackControlsController];
  [v5 setVolumeController:v4];
}

- (id)transportControlsLayoutItem
{
  -[AVMobileChromeControlsViewController _loadPlaybackControlsViewIfNeeded]((uint64_t)self);
  playbackControlsView = self->_playbackControlsView;

  return [(AVPlaybackControlsView *)playbackControlsView transportControlsView];
}

- (void)setTransportBarCustomMenuItems:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromeControlsViewController;
  id v4 = a3;
  [(AVMobileControlsViewController *)&v6 setTransportBarCustomMenuItems:v4];
  v5 = [(AVMobileChromeControlsViewController *)self playbackControlsController];
  [v5 setTransportBarCustomMenuItems:v4];
}

- (void)setOptimizeForPerformance:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromeControlsViewController;
  [(AVMobileControlsViewController *)&v4 setOptimizeForPerformance:a3];
  -[AVMobileChromeControlsViewController _loadControlsViewIfNeeded]((uint64_t)self);
}

- (void)setIncludedControls:(unint64_t)a3
{
  if ([(AVMobileControlsViewController *)self includedControls] != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)AVMobileChromeControlsViewController;
    [(AVMobileControlsViewController *)&v8 setIncludedControls:a3];
    v5 = [(AVMobileChromeControlsViewController *)self playbackControlsController];
    [v5 setPlaybackControlsIncludeTransportControls:(a3 & 0x19) != 0];

    objc_super v6 = [(AVMobileChromeControlsViewController *)self playbackControlsController];
    [v6 setPlaybackControlsIncludeDisplayModeControls:(a3 >> 2) & 1];

    uint64_t v7 = [(AVMobileChromeControlsViewController *)self playbackControlsController];
    [v7 setPlaybackControlsIncludeVolumeControls:(a3 >> 1) & 1];
  }
}

- (id)displayModeControlsLayoutItem
{
  -[AVMobileChromeControlsViewController _loadPlaybackControlsViewIfNeeded]((uint64_t)self);
  playbackControlsView = self->_playbackControlsView;

  return [(AVPlaybackControlsView *)playbackControlsView screenModeControls];
}

- (void)setRoutingConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromeControlsViewController;
  id v4 = a3;
  [(AVMobileControlsViewController *)&v6 setRoutingConfiguration:v4];
  v5 = [(AVPlaybackControlsView *)self->_playbackControlsView routePickerView];
  [v5 setRoutingConfiguration:v4];
}

- (void)setPrefersCompactFullScreenControls:(BOOL)a3
{
  if (self->_prefersCompactFullScreenControls != a3)
  {
    self->_prefersCompactFullScreenControls = a3;
    [(AVMobileChromeControlsViewController *)self _updateStyleSheet];
  }
}

- (AVPlaybackControlsController)playbackControlsController
{
  playbackControlsController = self->_playbackControlsController;
  if (!playbackControlsController)
  {
    id v4 = [AVPlaybackControlsController alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);
    objc_super v6 = [(AVPlaybackControlsController *)v4 initWithPlayerViewController:WeakRetained];
    uint64_t v7 = self->_playbackControlsController;
    self->_playbackControlsController = v6;

    playbackControlsController = self->_playbackControlsController;
  }

  return playbackControlsController;
}

- (void)setEmbeddedInlineLayoutMargins:(id)a3
{
  v5 = (NSValue *)a3;
  if (self->_embeddedInlineLayoutMargins != v5)
  {
    objc_storeStrong((id *)&self->_embeddedInlineLayoutMargins, a3);
    [(AVPlaybackControlsView *)self->_playbackControlsView setOverrideLayoutMarginsWhenEmbeddedInline:v5];
  }
}

- (void)setControlItems:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromeControlsViewController;
  id v4 = a3;
  [(AVMobileControlsViewController *)&v6 setControlItems:v4];
  v5 = [(AVMobileChromeControlsViewController *)self playbackControlsController];
  [v5 setCustomControlItems:v4];
}

- (void)dealloc
{
  if (self->_styleSheet)
  {
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromeControlsViewController;
  [(AVMobileChromeControlsViewController *)&v4 dealloc];
}

- (AVMobileChromeControlsViewController)initWithPlayerViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromeControlsViewController;
  v5 = [(AVMobileChromeControlsViewController *)&v8 initWithNibName:0 bundle:0];
  objc_super v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_playerViewController, v4);
  }

  return v6;
}

@end