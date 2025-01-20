@interface HUCameraPlayerLiveContentViewController
- (HFCameraPlaybackEngine)playbackEngine;
- (HUCameraMicrophoneControl)microphoneControl;
- (HUCameraPlayerLiveContentViewController)initWithCoder:(id)a3;
- (HUCameraPlayerLiveContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HUCameraPlayerLiveContentViewController)initWithPlaybackEngine:(id)a3;
- (HUCameraView)cameraView;
- (double)cornerRadius;
- (void)_updateCameraCornerRadius;
- (void)playbackEngine:(id)a3 didUpdateLiveCameraSource:(id)a4;
- (void)setCameraView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setMicrophoneControl:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUCameraPlayerLiveContentViewController

- (HUCameraPlayerLiveContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithPlaybackEngine_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraPlayerLiveContentViewController.m", 27, @"%s is unavailable; use %@ instead",
    "-[HUCameraPlayerLiveContentViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HUCameraPlayerLiveContentViewController)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithPlaybackEngine_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraPlayerLiveContentViewController.m", 32, @"%s is unavailable; use %@ instead",
    "-[HUCameraPlayerLiveContentViewController initWithCoder:]",
    v6);

  return 0;
}

- (HUCameraPlayerLiveContentViewController)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUCameraPlayerLiveContentViewController;
  v5 = [(HUCameraPlayerLiveContentViewController *)&v10 initWithNibName:0 bundle:0];
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
  v17.receiver = self;
  v17.super_class = (Class)HUCameraPlayerLiveContentViewController;
  [(HUCameraPlayerLiveContentViewController *)&v17 viewDidLoad];
  v3 = [(HUCameraPlayerLiveContentViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  id v4 = [[HUCameraBadgeView alloc] initWithSize:1];
  v5 = [[HUCameraView alloc] initWithBadgeView:v4];
  [(HUCameraPlayerLiveContentViewController *)self setCameraView:v5];

  v6 = [(HUCameraPlayerLiveContentViewController *)self cameraView];
  [v6 setContentMode:1];

  id v7 = [(HUCameraPlayerLiveContentViewController *)self cameraView];
  [v7 setBadgeHidden:1];

  v8 = [(HUCameraPlayerLiveContentViewController *)self playbackEngine];
  v9 = [v8 liveCameraSource];
  objc_super v10 = [(HUCameraPlayerLiveContentViewController *)self cameraView];
  [v10 setCameraSource:v9];

  v11 = [(HUCameraPlayerLiveContentViewController *)self view];
  v12 = [(HUCameraPlayerLiveContentViewController *)self cameraView];
  objc_msgSend(v11, "naui_addAutoLayoutSubview:", v12);

  v13 = (void *)MEMORY[0x1E4F28DC8];
  v14 = [(HUCameraPlayerLiveContentViewController *)self cameraView];
  v15 = [(HUCameraPlayerLiveContentViewController *)self view];
  v16 = objc_msgSend(v13, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v14, v15);
  [v13 activateConstraints:v16];

  [(HUCameraPlayerLiveContentViewController *)self _updateCameraCornerRadius];
}

- (void)playbackEngine:(id)a3 didUpdateLiveCameraSource:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Updating %@ to source:%@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__HUCameraPlayerLiveContentViewController_playbackEngine_didUpdateLiveCameraSource___block_invoke;
  v8[3] = &unk_1E63850E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __84__HUCameraPlayerLiveContentViewController_playbackEngine_didUpdateLiveCameraSource___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) parentViewController];
  BOOL v3 = v2 != 0;

  id v4 = [*(id *)(a1 + 32) cameraView];
  [v4 setCameraSource:*(void *)(a1 + 40) animated:v3];
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  [(HUCameraPlayerLiveContentViewController *)self _updateCameraCornerRadius];
}

- (void)_updateCameraCornerRadius
{
  [(HUCameraPlayerLiveContentViewController *)self cornerRadius];
  double v4 = v3;
  id v5 = [(HUCameraPlayerLiveContentViewController *)self cameraView];
  [v5 _setContinuousCornerRadius:v4];

  id v6 = [(HUCameraPlayerLiveContentViewController *)self cameraView];
  [v6 setMaskedCameraCorners:-1];
}

- (HUCameraMicrophoneControl)microphoneControl
{
  microphoneControl = self->_microphoneControl;
  if (!microphoneControl)
  {
    double v4 = -[HUCameraMicrophoneControl initWithFrame:]([HUCameraMicrophoneControl alloc], "initWithFrame:", 0.0, 0.0, 45.0, 44.0);
    [(HUCameraMicrophoneControl *)v4 setAutoresizingMask:12];
    [(HUCameraMicrophoneControl *)v4 setHidden:0];
    id v5 = self->_microphoneControl;
    self->_microphoneControl = v4;

    microphoneControl = self->_microphoneControl;
  }

  return microphoneControl;
}

- (HFCameraPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (HFCameraPlaybackEngine *)WeakRetained;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (HUCameraView)cameraView
{
  return self->_cameraView;
}

- (void)setCameraView:(id)a3
{
}

- (void)setMicrophoneControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microphoneControl, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);

  objc_destroyWeak((id *)&self->_playbackEngine);
}

@end