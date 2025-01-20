@interface MRUWaveformViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)delayArtworkChange;
- (BOOL)hasAppeared;
- (BOOL)isDimmed;
- (BOOL)isOnScreen;
- (BOOL)lowPowerModeEnabled;
- (CAFrameRateRange)framerateRangeForData:(id)a3;
- (MRUWaveformController)controller;
- (MRUWaveformData)waveformData;
- (MRUWaveformSettings)settings;
- (MRUWaveformViewController)initWithContext:(unint64_t)a3 waveformController:(id)a4;
- (MRUWaveformViewController)initWithContext:(unint64_t)a3 waveformController:(id)a4 settings:(id)a5;
- (unint64_t)context;
- (void)loadView;
- (void)processInfoPowerStateDidChange:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setController:(id)a3;
- (void)setDelayArtworkChange:(BOOL)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setHasAppeared:(BOOL)a3;
- (void)setLowPowerModeEnabled:(BOOL)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setSettings:(id)a3;
- (void)setWaveformData:(id)a3;
- (void)updateState;
- (void)updateVisibility;
- (void)updateWaveformWithData:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)waveformController:(id)a3 artworkImageDidChange:(id)a4;
- (void)waveformController:(id)a3 waveformDidChange:(id)a4;
- (void)waveformControllerTrackDidChange:(id)a3;
@end

@implementation MRUWaveformViewController

- (MRUWaveformViewController)initWithContext:(unint64_t)a3 waveformController:(id)a4 settings:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MRUWaveformViewController;
  v11 = [(MRUWaveformViewController *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_settings, a5);
    objc_storeStrong((id *)&v12->_controller, a4);
    v12->_context = a3;
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v12 selector:sel_processInfoPowerStateDidChange_ name:*MEMORY[0x1E4F287E8] object:0];

    v14 = [MEMORY[0x1E4F28F80] processInfo];
    v12->_lowPowerModeEnabled = [v14 isLowPowerModeEnabled];
  }
  return v12;
}

- (MRUWaveformViewController)initWithContext:(unint64_t)a3 waveformController:(id)a4
{
  id v6 = a4;
  v7 = +[MRUWaveformSettings currentSettings];
  v8 = [(MRUWaveformViewController *)self initWithContext:a3 waveformController:v6 settings:v7];

  return v8;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v3 = [MRUWaveformView alloc];
  v4 = -[MRUWaveformView initWithFrame:context:settings:](v3, "initWithFrame:context:settings:", self->_context, self->_settings, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MRUWaveformViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MRUWaveformViewController;
  [(MRUWaveformViewController *)&v3 viewDidLoad];
  [(MRUWaveformController *)self->_controller setDelegate:self];
  [(MRUWaveformViewController *)self updateState];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUWaveformViewController;
  [(MRUWaveformViewController *)&v4 viewWillAppear:a3];
  self->_hasAppeared = 1;
  [(MRUWaveformViewController *)self updateVisibility];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUWaveformViewController;
  [(MRUWaveformViewController *)&v4 viewWillDisappear:a3];
  self->_hasAppeared = 0;
  [(MRUWaveformViewController *)self updateVisibility];
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    [(MRUWaveformViewController *)self updateVisibility];
  }
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    [(MRUWaveformViewController *)self updateVisibility];
    [MEMORY[0x1E4FB1FF0] _defaultAnimationDuration];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__MRUWaveformViewController_setDimmed___block_invoke;
    v5[3] = &unk_1E5F0D8C0;
    v5[4] = self;
    BOOL v6 = a3;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:animations:", v5);
  }
}

void __39__MRUWaveformViewController_setDimmed___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setDimmed:v1];
}

- (void)updateVisibility
{
  BOOL v3 = [(MRUWaveformViewController *)self isOnScreen] && self->_hasAppeared && !self->_dimmed;
  controller = self->_controller;

  [(MRUWaveformController *)controller setVisible:v3];
}

- (void)updateWaveformWithData:(id)a3
{
  id v4 = a3;
  [(MRUWaveformViewController *)self framerateRangeForData:v4];
  int v6 = v5;
  int v8 = v7;
  int v10 = v9;
  BOOL v11 = [(MRUWaveformController *)self->_controller isPlaying];
  settings = self->_settings;
  if (v11)
  {
    [(MRUWaveformSettings *)settings animationDuration];
    float v14 = v13;
    [(MRUWaveformSettings *)self->_settings springDamping];
  }
  else
  {
    [(MRUWaveformSettings *)settings pausedAnimationDuration];
    float v14 = v16;
    [(MRUWaveformSettings *)self->_settings pausedSpringDamping];
  }
  v17 = (void *)MEMORY[0x1E4FB1EB0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__MRUWaveformViewController_updateWaveformWithData___block_invoke;
  v22[3] = &unk_1E5F0D910;
  double v18 = v15;
  int v24 = v6;
  int v25 = v8;
  int v26 = v10;
  v22[4] = self;
  v19 = (MRUWaveformData *)v4;
  v23 = v19;
  [v17 animateWithDuration:0 delay:v22 usingSpringWithDamping:0 initialSpringVelocity:v14 options:0.0 animations:v18 completion:0.0];
  waveformData = self->_waveformData;
  self->_waveformData = v19;
  v21 = v19;
}

void __52__MRUWaveformViewController_updateWaveformWithData___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MRUWaveformViewController_updateWaveformWithData___block_invoke_2;
  v7[3] = &unk_1E5F0D8E8;
  BOOL v3 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  LODWORD(v4) = *(_DWORD *)(a1 + 48);
  LODWORD(v5) = *(_DWORD *)(a1 + 52);
  LODWORD(v6) = *(_DWORD *)(a1 + 56);
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1966083, v7, v4, v5, v6);
}

void __52__MRUWaveformViewController_updateWaveformWithData___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setWaveformData:v1];
}

- (CAFrameRateRange)framerateRangeForData:(id)a3
{
  id v4 = a3;
  if ([(MRUWaveformSettings *)self->_settings supportsVariableFramerate])
  {
    [v4 maxAbsoluteDifferenceFrom:self->_waveformData];
    float v6 = v5;
    float v7 = (float)[(MRUWaveformSettings *)self->_settings minimumFramerate];
    settings = self->_settings;
    if (self->_lowPowerModeEnabled) {
      int v9 = [(MRUWaveformSettings *)settings lowPowerModeMaximumFramerate];
    }
    else {
      int v9 = [(MRUWaveformSettings *)settings maximumFramerate];
    }
    float v15 = (float)v9;
    [(MRUWaveformSettings *)self->_settings framerateThreshold];
    float v17 = v7 + (float)((float)(v6 / v16) * (float)(v15 - v7));
    if (v17 <= v15) {
      float v12 = v17;
    }
    else {
      float v12 = v15;
    }
    float v13 = v7;
    float v14 = v15;
  }
  else
  {
    float v10 = (float)[(MRUWaveformSettings *)self->_settings nonVariableFramerate];
    float v11 = (float)[(MRUWaveformSettings *)self->_settings nonVariableFramerate];
    float v12 = (float)[(MRUWaveformSettings *)self->_settings nonVariableFramerate];
    float v13 = v10;
    float v14 = v11;
  }
  CAFrameRateRange v24 = CAFrameRateRangeMake(v13, v14, v12);
  float minimum = v24.minimum;
  float maximum = v24.maximum;
  float preferred = v24.preferred;

  float v21 = minimum;
  float v22 = maximum;
  float v23 = preferred;
  result.float preferred = v23;
  result.float maximum = v22;
  result.float minimum = v21;
  return result;
}

- (void)updateState
{
  BOOL v3 = [(MRUWaveformController *)self->_controller artworkImage];
  id v4 = [(MRUWaveformViewController *)self view];
  [v4 setArtworkImage:v3];

  id v5 = [(MRUWaveformController *)self->_controller waveform];
  [(MRUWaveformViewController *)self updateWaveformWithData:v5];
}

- (void)waveformControllerTrackDidChange:(id)a3
{
  id v4 = a3;
  self->_delayArtworkChange = 1;
  dispatch_time_t v5 = dispatch_time(0, 100000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__MRUWaveformViewController_waveformControllerTrackDidChange___block_invoke;
  v7[3] = &unk_1E5F0D8E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x1E4F14428], v7);
}

void __62__MRUWaveformViewController_waveformControllerTrackDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) artworkImage];
  BOOL v3 = [*(id *)(a1 + 32) view];
  [v3 setArtworkImage:v2];

  *(unsigned char *)(*(void *)(a1 + 32) + 979) = 0;
}

- (void)waveformController:(id)a3 waveformDidChange:(id)a4
{
}

- (void)waveformController:(id)a3 artworkImageDidChange:(id)a4
{
  if (!a4 || !self->_delayArtworkChange)
  {
    id v5 = a4;
    id v6 = [(MRUWaveformViewController *)self view];
    [v6 setArtworkImage:v5];
  }
}

- (void)processInfoPowerStateDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MRUWaveformViewController_processInfoPowerStateDidChange___block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__MRUWaveformViewController_processInfoPowerStateDidChange___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  objc_msgSend(*(id *)(a1 + 32), "setLowPowerModeEnabled:", objc_msgSend(v2, "isLowPowerModeEnabled"));
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (MRUWaveformController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (MRUWaveformSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (MRUWaveformData)waveformData
{
  return self->_waveformData;
}

- (void)setWaveformData:(id)a3
{
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setHasAppeared:(BOOL)a3
{
  self->_hasAppeared = a3;
}

- (BOOL)delayArtworkChange
{
  return self->_delayArtworkChange;
}

- (void)setDelayArtworkChange:(BOOL)a3
{
  self->_delayArtworkChange = a3;
}

- (BOOL)lowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformData, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end