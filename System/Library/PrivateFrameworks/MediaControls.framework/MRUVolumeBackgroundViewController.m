@interface MRUVolumeBackgroundViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGRect)effectiveContentFrameForContainerFrame:(CGRect)a3;
- (MRUAudioModuleController)audioModuleController;
- (MRUVolumeBackgroundViewController)initWithAudioModuleController:(id)a3;
- (MRUVolumeBackgroundViewControllerDelegate)delegate;
- (float)systemVolumeValue;
- (void)audioModuleController:(id)a3 listeningModeController:(id)a4 didChangeAvailablePrimaryListeningMode:(id)a5;
- (void)audioModuleController:(id)a3 listeningModeController:(id)a4 didChangeAvailableSecondaryListeningModes:(id)a5;
- (void)audioModuleController:(id)a3 listeningModeController:(id)a4 didChangePrimaryListeningMode:(id)a5;
- (void)audioModuleController:(id)a3 listeningModeController:(id)a4 didChangeSecondaryListeningMode:(id)a5;
- (void)audioModuleController:(id)a3 spatialAudioController:(id)a4 didChangeAvailableSpatialModes:(id)a5;
- (void)audioModuleController:(id)a3 spatialAudioController:(id)a4 didChangeNowPlayingInfo:(id)a5;
- (void)audioModuleController:(id)a3 spatialAudioController:(id)a4 didChangeSelectedSpatialMode:(id)a5;
- (void)audioModuleController:(id)a3 systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:(id)a4;
- (void)audioModuleController:(id)a3 systemOutputDeviceRouteControllerDidUpdateOutputDevices:(id)a4;
- (void)collapseExpandableButtons;
- (void)conversationAwarenessButtonDidChangeValue:(id)a3;
- (void)didTapPrimaryListeningModeButton:(id)a3;
- (void)didTapSecondaryListeningModeButton:(id)a3;
- (void)didTapSpatialAudioModeButton:(id)a3;
- (void)loadView;
- (void)performLayoutWithAnimation:(id)a3;
- (void)primaryListeningModeButtonDidChangeValue:(id)a3;
- (void)secondaryListeningModeButtonDidChangeValue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSystemVolumeValue:(float)a3;
- (void)spatialAudioModeButtonDidChangeValue:(id)a3;
- (void)updateConversationAwarenessButton;
- (void)updateNowPlaying;
- (void)updatePrimaryListeningModeButton;
- (void)updatePrimaryRouteView;
- (void)updateSecondaryListeningModeButton;
- (void)updateSecondaryRouteView;
- (void)updateSpatialAudioModeButton;
- (void)updateVisibility;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MRUVolumeBackgroundViewController

- (void)updateSpatialAudioModeButton
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v3 = [(MRUVolumeBackgroundViewController *)self view];
  v38 = [v3 spatialAudioModeButton];

  v4 = [(MRUAudioModuleController *)self->_audioModuleController spatialAudioController];
  v5 = [v4 availableModes];

  v6 = [(MRUAudioModuleController *)self->_audioModuleController spatialAudioController];
  uint64_t v7 = [v6 selectedMode];

  v8 = [(MRUAudioModuleController *)self->_audioModuleController spatialAudioController];
  v37 = self;
  if ([v8 isMultichannel])
  {
    int v39 = 1;
  }
  else
  {
    v9 = [(MRUAudioModuleController *)self->_audioModuleController spatialAudioController];
    int v39 = [v9 isMultichannelAvailable];
  }
  v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v36 = (void *)v7;
  if (v5) {
    uint64_t v35 = [v5 indexOfObject:v7];
  }
  else {
    uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v12) {
    goto LABEL_28;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v44;
  if (v39) {
    v15 = @"SpatialMultichannelHeadTracked";
  }
  else {
    v15 = @"SpatialStereoHeadTracked";
  }
  v16 = @"SpatialStereoOn";
  if (v39) {
    v16 = @"SpatialMultichannelOn";
  }
  v41 = v16;
  v42 = v15;
  v17 = @"SpatialStereoOff";
  if (v39) {
    v17 = @"SpatialMultichannelOff";
  }
  v40 = v17;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v44 != v14) {
        objc_enumerationMutation(v11);
      }
      v19 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      v20 = objc_alloc_init(MediaControlsExpandableButtonOption);
      [(MediaControlsExpandableButtonOption *)v20 setIdentifier:v19];
      -[MediaControlsExpandableButtonOption setEnabled:](v20, "setEnabled:", [v19 isEnabled]);
      uint64_t v21 = [v19 type];
      switch(v21)
      {
        case 2:
          v28 = +[MRUAsset packageAssetNamed:v42];
          [(MediaControlsExpandableButtonOption *)v20 setAsset:v28];

          v29 = +[MRUStringsProvider spatialButtonSubtitleHeadTracked];
          [(MediaControlsExpandableButtonOption *)v20 setTitle:v29];

          v26 = v20;
          v27 = @"head-tracked";
          goto LABEL_25;
        case 1:
          v24 = +[MRUAsset packageAssetNamed:v41];
          [(MediaControlsExpandableButtonOption *)v20 setAsset:v24];

          v25 = +[MRUStringsProvider spatialButtonSubtitleOn];
          [(MediaControlsExpandableButtonOption *)v20 setTitle:v25];

          v26 = v20;
          v27 = @"animating";
LABEL_25:
          [(MediaControlsExpandableButtonOption *)v26 setSelectedState:v27];
          [(MediaControlsExpandableButtonOption *)v20 setSelectedBackground:2];
          break;
        case 0:
          v22 = +[MRUAsset packageAssetNamed:v40];
          [(MediaControlsExpandableButtonOption *)v20 setAsset:v22];

          v23 = +[MRUStringsProvider spatialButtonSubtitleOff];
          [(MediaControlsExpandableButtonOption *)v20 setTitle:v23];

          break;
      }
      [v10 addObject:v20];
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
  }
  while (v13);
LABEL_28:

  if (v39) {
    +[MRUStringsProvider spatialButtonTitle];
  }
  else {
  v30 = +[MRUStringsProvider spatializeStereoButtonTitle];
  }
  [v38 setTitle:v30];

  v31 = [(MRUAudioModuleController *)v37->_audioModuleController spatialAudioController];
  objc_msgSend(v38, "setEnabled:", objc_msgSend(v31, "isEnabled"));

  v32 = [(MRUAudioModuleController *)v37->_audioModuleController spatialAudioController];
  v33 = [v32 disabledDescription];
  [v38 setDisabledSubtitle:v33];

  v34 = (void *)[v10 copy];
  [v38 setOptions:v34];

  objc_msgSend(v38, "setSelectedOptionIndex:animated:", v35, -[MRUVolumeBackgroundViewController _appearState](v37, "_appearState") == 2);
}

- (void)updateVisibility
{
  v3 = [(MRUAudioModuleController *)self->_audioModuleController outputDeviceRouteController];
  uint64_t v4 = [v3 isSplitRoute];
  v5 = [(MRUVolumeBackgroundViewController *)self view];
  [v5 setShowSecondaryAssetView:v4];

  v6 = [(MRUAudioModuleController *)self->_audioModuleController spatialAudioController];
  uint64_t v7 = [v6 nowPlayingInfo];
  v8 = [(MRUVolumeBackgroundViewController *)self view];
  [v8 setShowNowPlayingView:v7 != 0];

  v9 = [(MRUAudioModuleController *)self->_audioModuleController listeningModeController];
  v10 = [v9 availablePrimaryListeningModes];
  BOOL v11 = (unint64_t)[v10 count] > 1;
  uint64_t v12 = [(MRUVolumeBackgroundViewController *)self view];
  [v12 setShowPrimaryListeningModeButton:v11];

  uint64_t v13 = [(MRUAudioModuleController *)self->_audioModuleController listeningModeController];
  uint64_t v14 = [v13 availableSecondaryListeningModes];
  BOOL v15 = (unint64_t)[v14 count] > 1;
  v16 = [(MRUVolumeBackgroundViewController *)self view];
  [v16 setShowSecondaryListeningModeButton:v15];

  v17 = [(MRUAudioModuleController *)self->_audioModuleController spatialAudioController];
  v18 = [v17 availableModes];
  BOOL v19 = (unint64_t)[v18 count] > 1;
  v20 = [(MRUVolumeBackgroundViewController *)self view];
  [v20 setShowSpatialAudioModeButton:v19];

  uint64_t v21 = [(MRUAudioModuleController *)self->_audioModuleController conversationAwarenessController];
  v22 = (void *)[v21 isConversationAwarenessSupported];
  v23 = [(MRUVolumeBackgroundViewController *)self view];
  [v23 setShowConversationAwarenessButton:v22];

  id v27 = [(MRUAudioModuleController *)self->_audioModuleController hearingServiceController];
  int v24 = [v27 primaryHearingAidEnabled];
  if (v24)
  {
    v22 = [(MRUAudioModuleController *)self->_audioModuleController outputDeviceRouteController];
    uint64_t v25 = [v22 isSplitRoute] ^ 1;
  }
  else
  {
    uint64_t v25 = 0;
  }
  v26 = [(MRUVolumeBackgroundViewController *)self view];
  [v26 setShowEnvironmentSlider:v25];

  if (v24) {
}
  }

void __64__MRUVolumeBackgroundViewController_performLayoutWithAnimation___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

uint64_t __113__MRUVolumeBackgroundViewController_audioModuleController_spatialAudioController_didChangeAvailableSpatialModes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibility];
}

uint64_t __106__MRUVolumeBackgroundViewController_audioModuleController_spatialAudioController_didChangeNowPlayingInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibility];
}

- (void)audioModuleController:(id)a3 spatialAudioController:(id)a4 didChangeSelectedSpatialMode:(id)a5
{
  v6 = [(MRUVolumeBackgroundViewController *)self view];
  uint64_t v7 = [v6 spatialAudioModeButton];
  char v8 = [v7 isTracking];

  if ((v8 & 1) == 0)
  {
    [(MRUVolumeBackgroundViewController *)self updateSpatialAudioModeButton];
  }
}

- (void)audioModuleController:(id)a3 spatialAudioController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  [(MRUVolumeBackgroundViewController *)self updateNowPlaying];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__MRUVolumeBackgroundViewController_audioModuleController_spatialAudioController_didChangeNowPlayingInfo___block_invoke;
  v6[3] = &unk_1E5F0D7F8;
  v6[4] = self;
  [(MRUVolumeBackgroundViewController *)self performLayoutWithAnimation:v6];
}

- (void)audioModuleController:(id)a3 spatialAudioController:(id)a4 didChangeAvailableSpatialModes:(id)a5
{
  [(MRUVolumeBackgroundViewController *)self updateSpatialAudioModeButton];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __113__MRUVolumeBackgroundViewController_audioModuleController_spatialAudioController_didChangeAvailableSpatialModes___block_invoke;
  v6[3] = &unk_1E5F0D7F8;
  v6[4] = self;
  [(MRUVolumeBackgroundViewController *)self performLayoutWithAnimation:v6];
}

- (void)performLayoutWithAnimation:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5ADE8];
  v6 = [(MRUVolumeBackgroundViewController *)self view];
  uint64_t v7 = [v6 window];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__MRUVolumeBackgroundViewController_performLayoutWithAnimation___block_invoke;
  v9[3] = &unk_1E5F0E428;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v5 performWithoutAnimationWhileHiddenInWindow:v7 actions:v9];
}

void __53__MRUVolumeBackgroundViewController_updateNowPlaying__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) view];
  id v4 = [v3 nowPlayingView];
  [v4 setIcon:v2];

  id v5 = [*(id *)(a1 + 32) view];
  [v5 setNeedsLayout];
}

- (void)updateNowPlaying
{
  v3 = [(MRUAudioModuleController *)self->_audioModuleController spatialAudioController];
  id v4 = [v3 nowPlayingInfo];

  id v5 = [v4 formatDescription];
  v6 = [(MRUVolumeBackgroundViewController *)self view];
  uint64_t v7 = [v6 nowPlayingView];
  [v7 setTitle:v5];

  id v8 = [(MRUVolumeBackgroundViewController *)self view];
  [v8 setNeedsLayout];

  v9 = +[MRUAssetsProvider sharedAssetsProvider];
  id v10 = [v4 bundleID];
  BOOL v11 = [(MRUVolumeBackgroundViewController *)self view];
  uint64_t v12 = [v11 traitCollection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__MRUVolumeBackgroundViewController_updateNowPlaying__block_invoke;
  v13[3] = &unk_1E5F0E270;
  v13[4] = self;
  [v9 applicationIconForBundleIdentifier:v10 traitCollection:v12 completion:v13];
}

void __53__MRUVolumeBackgroundViewController_updateNowPlaying__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MRUVolumeBackgroundViewController_updateNowPlaying__block_invoke_2;
  v5[3] = &unk_1E5F0D8E8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __64__MRUVolumeBackgroundViewController_performLayoutWithAnimation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];

  id v3 = (void *)MEMORY[0x1E4FB1EB0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__MRUVolumeBackgroundViewController_performLayoutWithAnimation___block_invoke_2;
  v5[3] = &unk_1E5F0DFB8;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(v3, "mru_animateUsingType:animations:completion:", 1, v5, 0);
}

- (MRUVolumeBackgroundViewController)initWithAudioModuleController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUVolumeBackgroundViewController;
  id v6 = [(MRUVolumeBackgroundViewController *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioModuleController, a3);
  }

  return v7;
}

- (void)loadView
{
  id v3 = [MRUVolumeBackgroundView alloc];
  id v4 = -[MRUVolumeBackgroundView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MRUVolumeBackgroundViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)MRUVolumeBackgroundViewController;
  [(MRUVolumeBackgroundViewController *)&v22 viewDidLoad];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained volumeBackgroundViewControllerStylingProvider];
  id v5 = [(MRUVolumeBackgroundViewController *)self view];
  [v5 setStylingProvider:v4];

  id v6 = [(MRUVolumeBackgroundViewController *)self view];
  uint64_t v7 = [v6 primaryListeningModeButton];
  [v7 addTarget:self action:sel_didTapPrimaryListeningModeButton_ forControlEvents:64];

  id v8 = [(MRUVolumeBackgroundViewController *)self view];
  objc_super v9 = [v8 primaryListeningModeButton];
  [v9 addTarget:self action:sel_primaryListeningModeButtonDidChangeValue_ forControlEvents:4096];

  id v10 = [(MRUVolumeBackgroundViewController *)self view];
  BOOL v11 = [v10 secondaryListeningModeButton];
  [v11 addTarget:self action:sel_didTapSecondaryListeningModeButton_ forControlEvents:64];

  uint64_t v12 = [(MRUVolumeBackgroundViewController *)self view];
  uint64_t v13 = [v12 secondaryListeningModeButton];
  [v13 addTarget:self action:sel_secondaryListeningModeButtonDidChangeValue_ forControlEvents:4096];

  uint64_t v14 = [(MRUVolumeBackgroundViewController *)self view];
  BOOL v15 = [v14 spatialAudioModeButton];
  [v15 addTarget:self action:sel_didTapSpatialAudioModeButton_ forControlEvents:64];

  v16 = [(MRUVolumeBackgroundViewController *)self view];
  v17 = [v16 spatialAudioModeButton];
  [v17 addTarget:self action:sel_spatialAudioModeButtonDidChangeValue_ forControlEvents:4096];

  v18 = [(MRUVolumeBackgroundViewController *)self view];
  BOOL v19 = [v18 conversationAwarenessButton];
  [v19 addTarget:self action:sel_conversationAwarenessButtonDidChangeValue_ forControlEvents:4096];

  v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_collapseExpandableButtons];
  [v20 setDelegate:self];
  uint64_t v21 = [(MRUVolumeBackgroundViewController *)self view];
  [v21 addGestureRecognizer:v20];

  [(MRUAudioModuleController *)self->_audioModuleController addObserver:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRUVolumeBackgroundViewController;
  [(MRUVolumeBackgroundViewController *)&v6 viewWillAppear:a3];
  id v4 = [(MRUVolumeBackgroundViewController *)self audioModuleController];
  id v5 = [v4 spatialAudioController];
  [v5 startMonitoring];

  [(MRUVolumeBackgroundViewController *)self updatePrimaryRouteView];
  [(MRUVolumeBackgroundViewController *)self updateSecondaryRouteView];
  [(MRUVolumeBackgroundViewController *)self updatePrimaryListeningModeButton];
  [(MRUVolumeBackgroundViewController *)self updateSecondaryListeningModeButton];
  [(MRUVolumeBackgroundViewController *)self updateSpatialAudioModeButton];
  [(MRUVolumeBackgroundViewController *)self updateNowPlaying];
  [(MRUVolumeBackgroundViewController *)self updateConversationAwarenessButton];
  [(MRUVolumeBackgroundViewController *)self updateVisibility];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRUVolumeBackgroundViewController;
  [(MRUVolumeBackgroundViewController *)&v6 viewDidDisappear:a3];
  [(MRUVolumeBackgroundViewController *)self collapseExpandableButtons];
  id v4 = [(MRUVolumeBackgroundViewController *)self audioModuleController];
  id v5 = [v4 spatialAudioController];
  [v5 stopMonitoring];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setSystemVolumeValue:(float)a3
{
  self->_systemVolumeValue = a3;
  id v5 = [(MRUAudioModuleController *)self->_audioModuleController outputDeviceRouteController];
  char v6 = [v5 isSplitRoute];

  if ((v6 & 1) == 0)
  {
    *(float *)&double v7 = a3;
    id v10 = +[MRUSystemVolumeController packageStateForVolumeValue:v7];
    id v8 = [(MRUVolumeBackgroundViewController *)self view];
    objc_super v9 = [v8 primaryAssetView];
    [v9 setGlyphState:v10];
  }
}

- (void)didTapPrimaryListeningModeButton:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__MRUVolumeBackgroundViewController_didTapPrimaryListeningModeButton___block_invoke;
  v6[3] = &unk_1E5F0D8E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MRUVolumeBackgroundViewController *)self performLayoutWithAnimation:v6];
}

void __70__MRUVolumeBackgroundViewController_didTapPrimaryListeningModeButton___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 expandButton:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 volumeBackgroundViewController:*(void *)(a1 + 32) didUpdateSecondaryInteractionEnabled:0];
}

- (void)primaryListeningModeButtonDidChangeValue:(id)a3
{
  id v4 = a3;
  id v5 = [(MRUAudioModuleController *)self->_audioModuleController listeningModeController];
  char v6 = [v5 primaryListeningMode];

  id v7 = [v4 selectedOption];
  id v8 = [v7 identifier];

  objc_super v9 = [(MRUAudioModuleController *)self->_audioModuleController listeningModeController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__MRUVolumeBackgroundViewController_primaryListeningModeButtonDidChangeValue___block_invoke;
  v12[3] = &unk_1E5F0E3D8;
  id v13 = v4;
  id v14 = v6;
  id v10 = v6;
  id v11 = v4;
  [v9 setPrimaryListeningMode:v8 completion:v12];
}

void __78__MRUVolumeBackgroundViewController_primaryListeningModeButtonDidChangeValue___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  char v6 = *(void **)(a1 + 32);
  id v7 = v5;
  if (a2)
  {
    [v6 playValueChangedEventHaptic];
  }
  else
  {
    [v6 playFailedValueChangedEventHapticWithMessage:v5];
    if (([*(id *)(a1 + 32) isTracking] & 1) == 0) {
      [*(id *)(a1 + 32) setSelectedListeningMode:*(void *)(a1 + 40) animated:1];
    }
  }
}

- (void)didTapSecondaryListeningModeButton:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__MRUVolumeBackgroundViewController_didTapSecondaryListeningModeButton___block_invoke;
  v6[3] = &unk_1E5F0D8E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MRUVolumeBackgroundViewController *)self performLayoutWithAnimation:v6];
}

void __72__MRUVolumeBackgroundViewController_didTapSecondaryListeningModeButton___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 expandButton:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 volumeBackgroundViewController:*(void *)(a1 + 32) didUpdatePrimaryInteractionEnabled:0];
}

- (void)secondaryListeningModeButtonDidChangeValue:(id)a3
{
  id v4 = a3;
  id v5 = [(MRUAudioModuleController *)self->_audioModuleController listeningModeController];
  char v6 = [v5 secondaryListeningMode];

  id v7 = [v4 selectedOption];
  id v8 = [v7 identifier];

  objc_super v9 = [(MRUAudioModuleController *)self->_audioModuleController listeningModeController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__MRUVolumeBackgroundViewController_secondaryListeningModeButtonDidChangeValue___block_invoke;
  v12[3] = &unk_1E5F0E3D8;
  id v13 = v4;
  id v14 = v6;
  id v10 = v6;
  id v11 = v4;
  [v9 setSecondaryListeningMode:v8 completion:v12];
}

void __80__MRUVolumeBackgroundViewController_secondaryListeningModeButtonDidChangeValue___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  char v6 = *(void **)(a1 + 32);
  id v7 = v5;
  if (a2)
  {
    [v6 playValueChangedEventHaptic];
  }
  else
  {
    [v6 playFailedValueChangedEventHapticWithMessage:v5];
    if (([*(id *)(a1 + 32) isTracking] & 1) == 0) {
      [*(id *)(a1 + 32) setSelectedListeningMode:*(void *)(a1 + 40) animated:1];
    }
  }
}

- (void)didTapSpatialAudioModeButton:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__MRUVolumeBackgroundViewController_didTapSpatialAudioModeButton___block_invoke;
  v6[3] = &unk_1E5F0D8E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MRUVolumeBackgroundViewController *)self performLayoutWithAnimation:v6];
}

void __66__MRUVolumeBackgroundViewController_didTapSpatialAudioModeButton___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 expandButton:*(void *)(a1 + 40)];
}

- (void)spatialAudioModeButtonDidChangeValue:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  audioModuleController = self->_audioModuleController;
  id v5 = a3;
  char v6 = [(MRUAudioModuleController *)audioModuleController spatialAudioController];
  id v7 = [v6 selectedMode];

  id v8 = [v5 selectedOption];
  objc_super v9 = [v8 identifier];

  id v10 = [(MRUAudioModuleController *)self->_audioModuleController spatialAudioController];
  [v10 setSelectedMode:v9];

  [v5 playValueChangedEventHaptic];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  uint64_t v12 = [v7 description];
  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F77188]];

  id v13 = [v9 description];
  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F77178]];

  id v14 = +[MRUSystemOutputDeviceRouteController outputContextDescription];
  [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F77180]];

  uint64_t v19 = MEMORY[0x1E4F143A8];
  v20 = v11;
  id v15 = v11;
  MRAnalyticsSendEvent();
  v16 = (void *)MEMORY[0x1E4FB9430];
  v21[0] = MRUVolumeCARSpatialAudioClientKey;
  v21[1] = MRUVolumeCARSpatialAudioKey;
  v22[0] = MRUVolumeCARSpatialAudioClientValue;
  v17 = objc_msgSend(v9, "description", v19, 3221225472, __74__MRUVolumeBackgroundViewController_spatialAudioModeButtonDidChangeValue___block_invoke, &unk_1E5F0E2C0);
  v22[1] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v16 sendSingleMessage:v18 category:8 type:5];
}

id __74__MRUVolumeBackgroundViewController_spatialAudioModeButtonDidChangeValue___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)conversationAwarenessButtonDidChangeValue:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 selectedOptionIndex] != 0;
  char v6 = [(MRUAudioModuleController *)self->_audioModuleController conversationAwarenessController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__MRUVolumeBackgroundViewController_conversationAwarenessButtonDidChangeValue___block_invoke;
  v8[3] = &unk_1E5F0E400;
  id v9 = v4;
  id v7 = v4;
  [v6 setConversationAwarenessEnabled:v5 completion:v8];
}

uint64_t __79__MRUVolumeBackgroundViewController_conversationAwarenessButtonDidChangeValue___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    return [v3 playFailedValueChangedEventHapticWithMessage:a2];
  }
  else
  {
    uint64_t result = [v3 isTracking];
    if (result)
    {
      BOOL v5 = *(void **)(a1 + 32);
      return [v5 playValueChangedEventHaptic];
    }
  }
  return result;
}

- (CGRect)effectiveContentFrameForContainerFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = [(MRUVolumeBackgroundViewController *)self view];
  id v8 = [v7 nowPlayingView];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;

  CGFloat v11 = x;
  CGFloat v12 = y;
  double v13 = width;
  double v14 = height;

  return CGRectInset(*(CGRect *)&v11, 0.0, v10 * -2.0);
}

- (void)audioModuleController:(id)a3 systemOutputDeviceRouteControllerDidUpdateOutputDevices:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __115__MRUVolumeBackgroundViewController_audioModuleController_systemOutputDeviceRouteControllerDidUpdateOutputDevices___block_invoke;
  v4[3] = &unk_1E5F0D7F8;
  v4[4] = self;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v4, a4);
}

uint64_t __115__MRUVolumeBackgroundViewController_audioModuleController_systemOutputDeviceRouteControllerDidUpdateOutputDevices___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibility];
}

- (void)audioModuleController:(id)a3 systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:(id)a4
{
  [(MRUVolumeBackgroundViewController *)self updatePrimaryRouteView];
  [(MRUVolumeBackgroundViewController *)self updateSecondaryRouteView];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __124__MRUVolumeBackgroundViewController_audioModuleController_systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties___block_invoke;
  v5[3] = &unk_1E5F0D7F8;
  v5[4] = self;
  [(MRUVolumeBackgroundViewController *)self performLayoutWithAnimation:v5];
}

uint64_t __124__MRUVolumeBackgroundViewController_audioModuleController_systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibility];
}

- (void)audioModuleController:(id)a3 listeningModeController:(id)a4 didChangeAvailablePrimaryListeningMode:(id)a5
{
  [(MRUVolumeBackgroundViewController *)self updatePrimaryListeningModeButton];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __122__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangeAvailablePrimaryListeningMode___block_invoke;
  v6[3] = &unk_1E5F0D7F8;
  v6[4] = self;
  [(MRUVolumeBackgroundViewController *)self performLayoutWithAnimation:v6];
}

uint64_t __122__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangeAvailablePrimaryListeningMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibility];
}

- (void)audioModuleController:(id)a3 listeningModeController:(id)a4 didChangePrimaryListeningMode:(id)a5
{
  [(MRUVolumeBackgroundViewController *)self updatePrimaryListeningModeButton];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __113__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangePrimaryListeningMode___block_invoke;
  v6[3] = &unk_1E5F0D7F8;
  v6[4] = self;
  [(MRUVolumeBackgroundViewController *)self performLayoutWithAnimation:v6];
}

uint64_t __113__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangePrimaryListeningMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibility];
}

- (void)audioModuleController:(id)a3 listeningModeController:(id)a4 didChangeAvailableSecondaryListeningModes:(id)a5
{
  [(MRUVolumeBackgroundViewController *)self updateSecondaryListeningModeButton];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __125__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangeAvailableSecondaryListeningModes___block_invoke;
  v6[3] = &unk_1E5F0D7F8;
  v6[4] = self;
  [(MRUVolumeBackgroundViewController *)self performLayoutWithAnimation:v6];
}

uint64_t __125__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangeAvailableSecondaryListeningModes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibility];
}

- (void)audioModuleController:(id)a3 listeningModeController:(id)a4 didChangeSecondaryListeningMode:(id)a5
{
  [(MRUVolumeBackgroundViewController *)self updateSecondaryListeningModeButton];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __115__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangeSecondaryListeningMode___block_invoke;
  v6[3] = &unk_1E5F0D7F8;
  v6[4] = self;
  [(MRUVolumeBackgroundViewController *)self performLayoutWithAnimation:v6];
}

uint64_t __115__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangeSecondaryListeningMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibility];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v3 = [(MRUVolumeBackgroundViewController *)self view];
  char v4 = [v3 hasExpandedButtons];

  return v4;
}

- (void)collapseExpandableButtons
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__MRUVolumeBackgroundViewController_collapseExpandableButtons__block_invoke;
  v2[3] = &unk_1E5F0D7F8;
  v2[4] = self;
  [(MRUVolumeBackgroundViewController *)self performLayoutWithAnimation:v2];
}

void __62__MRUVolumeBackgroundViewController_collapseExpandableButtons__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 collapseExpandableButtons];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 volumeBackgroundViewController:*(void *)(a1 + 32) didUpdateSecondaryInteractionEnabled:1];
  [v3 volumeBackgroundViewController:*(void *)(a1 + 32) didUpdatePrimaryInteractionEnabled:1];
}

- (void)updatePrimaryRouteView
{
  id v3 = [(MRUAudioModuleController *)self->_audioModuleController outputDeviceRouteController];
  int v4 = [v3 isSplitRoute];

  BOOL v5 = [(MRUAudioModuleController *)self->_audioModuleController outputDeviceRouteController];
  char v6 = v5;
  if (v4)
  {
    id v7 = [v5 primaryOutputDeviceAsset];
    id v8 = [(MRUVolumeBackgroundViewController *)self view];
    double v9 = [v8 primaryAssetView];
    [v9 setAsset:v7];

    id v23 = [(MRUAudioModuleController *)self->_audioModuleController outputDeviceRouteController];
    double v10 = [v23 primaryOutputDeviceRoute];
    CGFloat v11 = [v10 routeName];
    CGFloat v12 = [(MRUVolumeBackgroundViewController *)self view];
    double v13 = [v12 primaryAssetView];
    [v13 setTitle:v11];
  }
  else
  {
    double v14 = [v5 systemOutputDeviceAssetWithInCall];
    id v15 = [(MRUVolumeBackgroundViewController *)self view];
    v16 = [v15 primaryAssetView];
    [v16 setAsset:v14];

    v17 = [(MRUAudioModuleController *)self->_audioModuleController outputDeviceRouteController];
    v18 = [v17 systemOutputDeviceRoute];
    uint64_t v19 = [v18 routeName];
    v20 = [(MRUVolumeBackgroundViewController *)self view];
    uint64_t v21 = [v20 primaryAssetView];
    [v21 setTitle:v19];

    *(float *)&double v22 = self->_systemVolumeValue;
    id v23 = +[MRUSystemVolumeController packageStateForVolumeValue:v22];
    double v10 = [(MRUVolumeBackgroundViewController *)self view];
    CGFloat v11 = [v10 primaryAssetView];
    [v11 setGlyphState:v23];
  }
}

- (void)updateSecondaryRouteView
{
  id v3 = [(MRUAudioModuleController *)self->_audioModuleController outputDeviceRouteController];
  int v4 = [v3 secondaryOutputDeviceAsset];
  BOOL v5 = [(MRUVolumeBackgroundViewController *)self view];
  char v6 = [v5 secondaryAssetView];
  [v6 setAsset:v4];

  id v11 = [(MRUAudioModuleController *)self->_audioModuleController outputDeviceRouteController];
  id v7 = [v11 secondaryOutputDeviceRoute];
  id v8 = [v7 routeName];
  double v9 = [(MRUVolumeBackgroundViewController *)self view];
  double v10 = [v9 secondaryAssetView];
  [v10 setTitle:v8];
}

- (void)updatePrimaryListeningModeButton
{
  id v3 = [(MRUVolumeBackgroundViewController *)self view];
  id v9 = [v3 primaryListeningModeButton];

  if (([v9 isTracking] & 1) == 0)
  {
    int v4 = [(MRUAudioModuleController *)self->_audioModuleController listeningModeController];
    BOOL v5 = [v4 availablePrimaryListeningModes];

    char v6 = [(MRUAudioModuleController *)self->_audioModuleController listeningModeController];
    id v7 = [v6 primaryListeningMode];

    [v9 setAvailableListeningModes:v5];
    objc_msgSend(v9, "setSelectedListeningMode:animated:", v7, -[MRUVolumeBackgroundViewController _appearState](self, "_appearState") == 2);
    id v8 = +[MRUStringsProvider listeningModeTitle];
    [v9 setTitle:v8];
  }
}

- (void)updateSecondaryListeningModeButton
{
  id v3 = [(MRUVolumeBackgroundViewController *)self view];
  id v9 = [v3 secondaryListeningModeButton];

  if (([v9 isTracking] & 1) == 0)
  {
    int v4 = [(MRUAudioModuleController *)self->_audioModuleController listeningModeController];
    BOOL v5 = [v4 availableSecondaryListeningModes];

    char v6 = [(MRUAudioModuleController *)self->_audioModuleController listeningModeController];
    id v7 = [v6 secondaryListeningMode];

    [v9 setAvailableListeningModes:v5];
    objc_msgSend(v9, "setSelectedListeningMode:animated:", v7, -[MRUVolumeBackgroundViewController _appearState](self, "_appearState") == 2);
    id v8 = +[MRUStringsProvider listeningModeTitle];
    [v9 setTitle:v8];
  }
}

- (void)updateConversationAwarenessButton
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(MRUVolumeBackgroundViewController *)self view];
  int v4 = [v3 conversationAwarenessButton];

  BOOL v5 = [(MRUAudioModuleController *)self->_audioModuleController conversationAwarenessController];
  LODWORD(v3) = [v5 isConversationAwarenessEnabled];

  char v6 = objc_alloc_init(MediaControlsExpandableButtonOption);
  id v7 = +[MRUAsset symbolNamed:@"person.wave.2.fill"];
  [(MediaControlsExpandableButtonOption *)v6 setAsset:v7];

  id v8 = +[MRUStringsProvider conversationAwarenessOff];
  [(MediaControlsExpandableButtonOption *)v6 setTitle:v8];

  id v9 = objc_alloc_init(MediaControlsExpandableButtonOption);
  double v10 = +[MRUAsset symbolNamed:@"person.wave.2.fill"];
  [(MediaControlsExpandableButtonOption *)v9 setAsset:v10];

  [(MediaControlsExpandableButtonOption *)v9 setSelectedState:@"On"];
  id v11 = +[MRUStringsProvider conversationAwarenessOn];
  [(MediaControlsExpandableButtonOption *)v9 setTitle:v11];

  [(MediaControlsExpandableButtonOption *)v9 setSelectedBackground:2];
  CGFloat v12 = +[MRUStringsProvider conversationAwarenessTitle];
  [v4 setTitle:v12];

  v14[0] = v6;
  v14[1] = v9;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v4 setOptions:v13];

  [v4 setSelectedOptionIndex:v3];
}

- (MRUAudioModuleController)audioModuleController
{
  return self->_audioModuleController;
}

- (MRUVolumeBackgroundViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUVolumeBackgroundViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (float)systemVolumeValue
{
  return self->_systemVolumeValue;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_audioModuleController, 0);
}

@end