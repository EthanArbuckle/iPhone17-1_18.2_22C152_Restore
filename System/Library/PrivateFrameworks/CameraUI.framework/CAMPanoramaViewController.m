@interface CAMPanoramaViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isPainting;
- (CAMAnalyticsCaptureEvent)analyticsCaptureEvent;
- (CAMPanoramaViewController)initWithCaptureController:(id)a3 layoutStyle:(int64_t)a4;
- (CAMPanoramaViewController)initWithCoder:(id)a3;
- (CUCaptureController)_captureController;
- (UITapGestureRecognizer)_directionChangeGestureRecognizer;
- (int64_t)_captureOrientation;
- (int64_t)layoutStyle;
- (void)_handleDirectionChange:(id)a3;
- (void)_setCaptureOrientation:(int64_t)a3;
- (void)_setPainting:(BOOL)a3;
- (void)finishedProcessingPanorama;
- (void)loadView;
- (void)panoramaConfigurationDidChangeWithDirection:(int64_t)a3;
- (void)panoramaView:(id)a3 didUpdateInstruction:(int64_t)a4;
- (void)panoramaViewDidRequestSynchronizedDirectionChange:(id)a3 toDirection:(int64_t)a4;
- (void)setAnalyticsCaptureEvent:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)startPainting;
- (void)startProcessingPanorama;
- (void)stopPainting;
- (void)updateWithStatus:(id)a3;
@end

@implementation CAMPanoramaViewController

- (CAMPanoramaViewController)initWithCaptureController:(id)a3 layoutStyle:(int64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAMPanoramaViewController;
  v8 = [(CAMPanoramaViewController *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->__captureController, a3);
    v9->__captureOrientation = 1;
    uint64_t v10 = [objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v9 action:sel__handleDirectionChange_];
    directionChangeGestureRecognizer = v9->__directionChangeGestureRecognizer;
    v9->__directionChangeGestureRecognizer = (UITapGestureRecognizer *)v10;

    v9->_layoutStyle = a4;
    [v7 setPanoramaChangeDelegate:v9];
    v12 = v9;
  }

  return v9;
}

- (CAMPanoramaViewController)initWithCoder:(id)a3
{
  [(CAMPanoramaViewController *)self doesNotRecognizeSelector:a2];
  return [(CAMPanoramaViewController *)self initWithCaptureController:0 layoutStyle:0];
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    id v4 = [(CAMPanoramaViewController *)self panoramaView];
    [v4 setLayoutStyle:a3];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  int64_t v3 = [(CAMPanoramaViewController *)self layoutStyle];
  id v7 = [(CAMPanoramaViewController *)self _captureController];
  id v4 = [v7 panoramaPreviewView];
  v5 = [[CAMPanoramaView alloc] initWithPanoramaPreviewView:v4 layoutStyle:v3];
  [(CAMPanoramaView *)v5 setDelegate:self];
  v6 = [(CAMPanoramaViewController *)self _directionChangeGestureRecognizer];
  [(CAMPanoramaView *)v5 addGestureRecognizer:v6];
  [(CAMPanoramaViewController *)self setView:v5];
}

- (void)startPainting
{
  id v3 = [(CAMPanoramaViewController *)self panoramaView];
  [v3 startPainting];
  [(CAMPanoramaViewController *)self _setPainting:1];
}

- (void)stopPainting
{
  id v3 = [(CAMPanoramaViewController *)self panoramaView];
  [v3 stopPainting];
  [(CAMPanoramaViewController *)self _setPainting:0];
}

- (void)startProcessingPanorama
{
  id v2 = [(CAMPanoramaViewController *)self panoramaView];
  [v2 startProcessingPanorama];
}

- (void)finishedProcessingPanorama
{
  id v2 = [(CAMPanoramaViewController *)self panoramaView];
  [v2 finishedProcessingPanorama];
}

- (void)_handleDirectionChange:(id)a3
{
  id v4 = [(CAMPanoramaViewController *)self _captureController];
  char v5 = [v4 isCapturingPanorama];

  if ((v5 & 1) == 0)
  {
    v6 = [(CAMPanoramaViewController *)self panoramaView];
    uint64_t v7 = [v6 direction];
    if (v7)
    {
      uint64_t v8 = 2;
      if (v7 != 1) {
        uint64_t v8 = 0;
      }
      if (v7 == 2) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v8;
      }
    }
    else
    {
      uint64_t v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Changing panorama direction but the current direction is unknown!", v11, 2u);
      }

      uint64_t v9 = 1;
    }
    [v6 setDirection:v9 animated:1];
  }
}

- (void)panoramaViewDidRequestSynchronizedDirectionChange:(id)a3 toDirection:(int64_t)a4
{
  id v5 = [(CAMPanoramaViewController *)self _captureController];
  [v5 changeToPanoramaDirection:a4];
}

- (void)panoramaView:(id)a3 didUpdateInstruction:(int64_t)a4
{
  id v5 = [(CAMPanoramaViewController *)self analyticsCaptureEvent];
  if (v5)
  {
    id v6 = v5;
    [v5 populatePanoramaInstruction:a4];
    id v5 = v6;
  }
}

- (void)updateWithStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMPanoramaViewController *)self panoramaView];
  [v5 updatePaintingWithStatus:v4];
}

- (void)panoramaConfigurationDidChangeWithDirection:(int64_t)a3
{
  if (a3)
  {
    id v4 = [(CAMPanoramaViewController *)self panoramaView];
    [v4 setDirection:a3];
  }
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)isPainting
{
  return self->_painting;
}

- (void)_setPainting:(BOOL)a3
{
  self->_painting = a3;
}

- (CAMAnalyticsCaptureEvent)analyticsCaptureEvent
{
  return self->_analyticsCaptureEvent;
}

- (void)setAnalyticsCaptureEvent:(id)a3
{
}

- (CUCaptureController)_captureController
{
  return self->__captureController;
}

- (int64_t)_captureOrientation
{
  return self->__captureOrientation;
}

- (void)_setCaptureOrientation:(int64_t)a3
{
  self->__captureOrientation = a3;
}

- (UITapGestureRecognizer)_directionChangeGestureRecognizer
{
  return self->__directionChangeGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__directionChangeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__captureController, 0);
  objc_storeStrong((id *)&self->_analyticsCaptureEvent, 0);
}

@end