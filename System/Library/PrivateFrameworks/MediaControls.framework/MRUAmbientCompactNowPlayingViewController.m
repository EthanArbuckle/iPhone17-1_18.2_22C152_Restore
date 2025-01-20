@interface MRUAmbientCompactNowPlayingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOnScreen;
- (MRUAmbientCompactNowPlayingViewController)init;
- (MRUAmbientCompactNowPlayingViewController)initWithNowPlayingController:(id)a3;
- (MRUNowPlayingController)nowPlayingController;
- (MRUWaveformController)waveformController;
- (MRUWaveformViewController)waveformViewController;
- (void)loadView;
- (void)setOnScreen:(BOOL)a3;
- (void)updateArtwork;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MRUAmbientCompactNowPlayingViewController

- (MRUAmbientCompactNowPlayingViewController)init
{
  v3 = +[MRUEndpointController proactiveUserSelectedEndpointController];
  v4 = [[MRUNowPlayingController alloc] initWithEndpointController:v3];
  v5 = [(MRUAmbientCompactNowPlayingViewController *)self initWithNowPlayingController:v4];

  return v5;
}

- (MRUAmbientCompactNowPlayingViewController)initWithNowPlayingController:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MRUAmbientCompactNowPlayingViewController;
  v6 = [(MRUAmbientCompactNowPlayingViewController *)&v17 init];
  v7 = v6;
  if (v6)
  {
    p_nowPlayingController = (id *)&v6->_nowPlayingController;
    objc_storeStrong((id *)&v6->_nowPlayingController, a3);
    [*p_nowPlayingController addObserver:v7];
    v9 = objc_alloc_init(MRUWaveformController);
    waveformController = v7->_waveformController;
    v7->_waveformController = v9;

    [(MRUWaveformController *)v7->_waveformController setNowPlayingController:*p_nowPlayingController];
    v11 = [MRUWaveformViewController alloc];
    v12 = v7->_waveformController;
    v13 = +[MRUWaveformSettings ambientSettings];
    uint64_t v14 = [(MRUWaveformViewController *)v11 initWithContext:2 waveformController:v12 settings:v13];
    waveformViewController = v7->_waveformViewController;
    v7->_waveformViewController = (MRUWaveformViewController *)v14;

    [(MRUWaveformViewController *)v7->_waveformViewController setOnScreen:1];
    [(MRUWaveformViewController *)v7->_waveformViewController willMoveToParentViewController:v7];
    [(MRUAmbientCompactNowPlayingViewController *)v7 addChildViewController:v7->_waveformViewController];
  }

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v3 = [MRUAmbientCompactNowPlayingView alloc];
  v4 = [(MRUAmbientCompactNowPlayingViewController *)self waveformViewController];
  id v5 = [v4 view];
  v6 = [(MRUAmbientCompactNowPlayingView *)v3 initWithWaveformView:v5];
  [(MRUAmbientCompactNowPlayingViewController *)self setView:v6];

  id v7 = [(MRUAmbientCompactNowPlayingViewController *)self waveformViewController];
  [v7 didMoveToParentViewController:self];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MRUAmbientCompactNowPlayingViewController;
  [(MRUAmbientCompactNowPlayingViewController *)&v3 viewDidLoad];
  [(MRUAmbientCompactNowPlayingViewController *)self updateArtwork];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUAmbientCompactNowPlayingViewController;
  [(MRUAmbientCompactNowPlayingViewController *)&v4 viewWillAppear:a3];
  [(MRUAmbientCompactNowPlayingViewController *)self setOnScreen:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUAmbientCompactNowPlayingViewController;
  [(MRUAmbientCompactNowPlayingViewController *)&v4 viewDidDisappear:a3];
  [(MRUAmbientCompactNowPlayingViewController *)self setOnScreen:0];
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    id v3 = [(MRUAmbientCompactNowPlayingViewController *)self nowPlayingController];
    [v3 updateAutomaticResponseLoading];
  }
}

- (void)updateArtwork
{
  id v3 = [(MRUNowPlayingController *)self->_nowPlayingController metadataController];
  objc_super v4 = [v3 artwork];
  id v5 = [v4 catalog];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__MRUAmbientCompactNowPlayingViewController_updateArtwork__block_invoke;
  v6[3] = &unk_1E5F0E700;
  v6[4] = self;
  [v5 requestImageWithCompletion:v6];
}

void __58__MRUAmbientCompactNowPlayingViewController_updateArtwork__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 waveformController];
  [v4 setArtworkImage:v3];
}

- (MRUNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (MRUWaveformController)waveformController
{
  return self->_waveformController;
}

- (MRUWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_storeStrong((id *)&self->_waveformController, 0);

  objc_storeStrong((id *)&self->_nowPlayingController, 0);
}

@end