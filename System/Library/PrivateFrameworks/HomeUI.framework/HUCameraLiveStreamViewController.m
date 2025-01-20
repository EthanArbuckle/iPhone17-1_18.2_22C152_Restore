@interface HUCameraLiveStreamViewController
- (BOOL)shouldRespectAspectRatio;
- (HFCameraLiveStreamController)liveStreamController;
- (HFCameraLiveStreamControllerDelegate)liveStreamControllerDelegate;
- (HUCameraLiveStreamViewController)initWithCameraProfile:(id)a3;
- (HUCameraView)cameraView;
- (void)setCameraView:(id)a3;
- (void)setLiveStreamController:(id)a3;
- (void)setLiveStreamControllerDelegate:(id)a3;
- (void)setShouldRespectAspectRatio:(BOOL)a3;
- (void)streamControllerStateDidUpdate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUCameraLiveStreamViewController

- (HUCameraLiveStreamViewController)initWithCameraProfile:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUCameraLiveStreamViewController;
  v5 = [(HUCameraLiveStreamViewController *)&v12 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F68FA8]);
    v7 = [v4 accessory];
    v8 = [v7 home];
    uint64_t v9 = [v6 initWithHome:v8 cameraProfile:v4];
    liveStreamController = v5->_liveStreamController;
    v5->_liveStreamController = (HFCameraLiveStreamController *)v9;

    [(HFCameraLiveStreamController *)v5->_liveStreamController setDelegate:v5];
  }

  return v5;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)HUCameraLiveStreamViewController;
  [(HUCameraLiveStreamViewController *)&v17 viewDidLoad];
  v3 = [(HUCameraLiveStreamViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  id v4 = [(HUCameraLiveStreamViewController *)self view];
  v5 = [(HUCameraLiveStreamViewController *)self cameraView];
  [v4 addSubview:v5];

  BOOL v6 = [(HUCameraLiveStreamViewController *)self shouldRespectAspectRatio];
  v7 = [(HUCameraLiveStreamViewController *)self cameraView];
  [v7 setShouldRespectAspectRatio:v6];

  v8 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v9 = [(HUCameraLiveStreamViewController *)self cameraView];
  v10 = [(HUCameraLiveStreamViewController *)self view];
  v11 = objc_msgSend(v8, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v9, v10);
  [v8 activateConstraints:v11];

  objc_super v12 = [(HUCameraLiveStreamViewController *)self liveStreamController];
  [v12 startStreaming];

  v13 = [(HUCameraLiveStreamViewController *)self liveStreamController];
  uint64_t v14 = [v13 streamState];

  if (v14 == 2)
  {
    v15 = [(HUCameraLiveStreamViewController *)self liveStreamControllerDelegate];
    v16 = [(HUCameraLiveStreamViewController *)self liveStreamController];
    [v15 streamControllerStateDidUpdate:v16];
  }
}

- (void)setShouldRespectAspectRatio:(BOOL)a3
{
  if (self->_shouldRespectAspectRatio != a3)
  {
    self->_shouldRespectAspectRatio = a3;
    -[HUCameraView setShouldRespectAspectRatio:](self->_cameraView, "setShouldRespectAspectRatio:");
  }
}

- (void)streamControllerStateDidUpdate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    objc_super v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@ did update: %@", (uint8_t *)&v11, 0x16u);
  }

  BOOL v6 = [(HUCameraLiveStreamViewController *)self liveStreamController];
  v7 = [v6 liveCameraSource];
  v8 = [(HUCameraLiveStreamViewController *)self cameraView];
  [v8 setCameraSource:v7];

  uint64_t v9 = [(HUCameraLiveStreamViewController *)self liveStreamControllerDelegate];

  if (v9)
  {
    v10 = [(HUCameraLiveStreamViewController *)self liveStreamControllerDelegate];
    [v10 streamControllerStateDidUpdate:v4];
  }
}

- (HUCameraView)cameraView
{
  cameraView = self->_cameraView;
  if (!cameraView)
  {
    id v4 = [[HUCameraView alloc] initWithBadgeView:0];
    [(HUCameraView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUCameraView *)v4 setShouldRespectAspectRatio:[(HUCameraLiveStreamViewController *)self shouldRespectAspectRatio]];
    v5 = [(HUCameraLiveStreamViewController *)self liveStreamController];
    BOOL v6 = [v5 liveCameraSource];
    [(HUCameraView *)v4 setCameraSource:v6];

    v7 = self->_cameraView;
    self->_cameraView = v4;

    cameraView = self->_cameraView;
  }

  return cameraView;
}

- (HFCameraLiveStreamControllerDelegate)liveStreamControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveStreamControllerDelegate);

  return (HFCameraLiveStreamControllerDelegate *)WeakRetained;
}

- (void)setLiveStreamControllerDelegate:(id)a3
{
}

- (BOOL)shouldRespectAspectRatio
{
  return self->_shouldRespectAspectRatio;
}

- (HFCameraLiveStreamController)liveStreamController
{
  return self->_liveStreamController;
}

- (void)setLiveStreamController:(id)a3
{
}

- (void)setCameraView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_liveStreamController, 0);

  objc_destroyWeak((id *)&self->_liveStreamControllerDelegate);
}

@end