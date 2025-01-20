@interface RPPipViewController
- (AVCaptureDevice)videoDevice;
- (AVCaptureDeviceInput)videoInput;
- (AVCaptureSession)pipSession;
- (RPPipViewController)initWithOrientation:(int64_t)a3 position:(int64_t)a4;
- (double)previousOrientationHeight;
- (double)previousOrientationWidth;
- (id)cameraWithPosition:(int64_t)a3;
- (int64_t)_captureVideoOrientationForUIDeviceOrientation:(int64_t)a3;
- (int64_t)cameraPosition;
- (int64_t)initialOrientation;
- (int64_t)previousOrientation;
- (void)_deviceOrientationDidChange;
- (void)_updateViewGeometry;
- (void)configurePipSessionWithCameraPosition:(int64_t)a3;
- (void)dealloc;
- (void)loadView;
- (void)setCameraPosition:(int64_t)a3;
- (void)setInitialOrientation:(int64_t)a3;
- (void)setPipSession:(id)a3;
- (void)setPreviousOrientation:(int64_t)a3;
- (void)setPreviousOrientationHeight:(double)a3;
- (void)setPreviousOrientationWidth:(double)a3;
- (void)setUpPipSession;
- (void)setVideoDevice:(id)a3;
- (void)setVideoInput:(id)a3;
- (void)startPipSession;
- (void)stopPipSession;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RPPipViewController

- (RPPipViewController)initWithOrientation:(int64_t)a3 position:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)RPPipViewController;
  v6 = [(RPPipViewController *)&v8 init];
  if (v6)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v10 = "-[RPPipViewController initWithOrientation:position:]";
      __int16 v11 = 1024;
      int v12 = 87;
      __int16 v13 = 2048;
      v14 = v6;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    [(RPPipViewController *)v6 setInitialOrientation:a3];
    [(RPPipViewController *)v6 setPreviousOrientation:a3];
    v6->_cameraPosition = a4;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPPipViewController dealloc]";
    __int16 v6 = 1024;
    int v7 = 98;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  [(RPPipViewController *)self removeSystemPrefferedCameraObserver];
  v3.receiver = self;
  v3.super_class = (Class)RPPipViewController;
  [(RPPipViewController *)&v3 dealloc];
}

- (id)cameraWithPosition:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263EFA598] devicesWithMediaType:*MEMORY[0x263EF9D48]];
  if (v4)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v22 = "-[RPPipViewController cameraWithPosition:]";
      __int16 v23 = 1024;
      int v24 = 118;
      __int16 v25 = 1024;
      int v26 = [v4 count];
      v5 = &_os_log_internal;
      __int16 v6 = " [INFO] %{public}s:%d looking for camera in %d capture devices";
      uint32_t v7 = 24;
LABEL_8:
      _os_log_impl(&dword_21F69F000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
    }
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v22 = "-[RPPipViewController cameraWithPosition:]";
    __int16 v23 = 1024;
    int v24 = 120;
    v5 = &_os_log_internal;
    __int16 v6 = " [INFO] %{public}s:%d no capture devices found";
    uint32_t v7 = 18;
    goto LABEL_8;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "position", (void)v16) == a3)
        {
          if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v22 = "-[RPPipViewController cameraWithPosition:]";
            __int16 v23 = 1024;
            int v24 = 131;
            __int16 v25 = 1024;
            int v26 = a3;
            _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d camera found with position %d", buf, 0x18u);
          }
          id v14 = v13;

          goto LABEL_25;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[RPPipViewController cameraWithPosition:]();
  }
  id v14 = 0;
LABEL_25:

  return v14;
}

- (void)configurePipSessionWithCameraPosition:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v12 = "-[RPPipViewController configurePipSessionWithCameraPosition:]";
    __int16 v13 = 1024;
    int v14 = 141;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  [(AVCaptureSession *)self->_pipSession beginConfiguration];
  if (self->_videoInput) {
    -[AVCaptureSession removeInput:](self->_pipSession, "removeInput:");
  }
  v5 = [(RPPipViewController *)self cameraWithPosition:a3];
  id v10 = 0;
  __int16 v6 = (AVCaptureDeviceInput *)[objc_alloc(MEMORY[0x263EFA5B8]) initWithDevice:v5 error:&v10];
  id v7 = v10;
  videoInput = self->_videoInput;
  self->_videoInput = v6;

  if (self->_videoInput) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    -[AVCaptureSession addInput:](self->_pipSession, "addInput:");
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[RPPipViewController configurePipSessionWithCameraPosition:](v7);
  }
  [(AVCaptureSession *)self->_pipSession commitConfiguration];
}

- (void)setCameraPosition:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    __int16 v6 = "-[RPPipViewController setCameraPosition:]";
    __int16 v7 = 1024;
    int v8 = 167;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  if (self->_pipSession && self->_cameraPosition != a3) {
    [(RPPipViewController *)self configurePipSessionWithCameraPosition:a3];
  }
  self->_cameraPosition = a3;
}

- (void)setUpPipSession
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d video input error %@", (uint8_t *)v0, 0x1Cu);
}

- (void)startPipSession
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    int v5 = "-[RPPipViewController startPipSession]";
    __int16 v6 = 1024;
    int v7 = 217;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  objc_super v3 = [(RPPipViewController *)self pipSession];
  [v3 startRunning];
}

- (void)stopPipSession
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    int v5 = "-[RPPipViewController stopPipSession]";
    __int16 v6 = 1024;
    int v7 = 223;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  [(RPPipViewController *)self removeSystemPrefferedCameraObserver];
  objc_super v3 = [(RPPipViewController *)self pipSession];
  [v3 stopRunning];
}

- (void)loadView
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    uint64_t v8 = "-[RPPipViewController loadView]";
    __int16 v9 = 1024;
    int v10 = 230;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  objc_super v3 = [RPPipView alloc];
  int v4 = -[RPPipView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(RPPipViewController *)self setView:v4];

  int v5 = [MEMORY[0x263F1C550] clearColor];
  __int16 v6 = [(RPPipViewController *)self view];
  [v6 setBackgroundColor:v5];

  [(RPPipViewController *)self _updateViewGeometry];
  [(RPPipViewController *)self setUpPipSession];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v10 = "-[RPPipViewController viewWillAppear:]";
    __int16 v11 = 1024;
    int v12 = 262;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v8.receiver = self;
  v8.super_class = (Class)RPPipViewController;
  [(RPPipViewController *)&v8 viewWillAppear:v3];
  [(RPPipViewController *)self startPipSession];
  int v5 = [(RPPipViewController *)self _pipView];
  __int16 v6 = [v5 previewLayer];
  int v7 = [v6 connection];
  objc_msgSend(v7, "setVideoOrientation:", -[RPPipViewController _captureVideoOrientationForUIDeviceOrientation:](self, "_captureVideoOrientationForUIDeviceOrientation:", self->_initialOrientation));
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v12 = "-[RPPipViewController viewDidAppear:]";
    __int16 v13 = 1024;
    int v14 = 271;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v10.receiver = self;
  v10.super_class = (Class)RPPipViewController;
  [(RPPipViewController *)&v10 viewDidAppear:v3];
  int v5 = [(RPPipViewController *)self view];
  __int16 v6 = [v5 window];
  char v7 = [v6 isInterfaceAutorotationDisabled];

  if ((v7 & 1) == 0)
  {
    objc_super v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel__deviceOrientationDidChange name:*MEMORY[0x263F1D1B0] object:0];

    __int16 v9 = [MEMORY[0x263F1C5C0] currentDevice];
    [v9 beginGeneratingDeviceOrientationNotifications];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v12 = "-[RPPipViewController viewDidDisappear:]";
    __int16 v13 = 1024;
    int v14 = 281;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v10.receiver = self;
  v10.super_class = (Class)RPPipViewController;
  [(RPPipViewController *)&v10 viewDidDisappear:v3];
  int v5 = [(RPPipViewController *)self view];
  __int16 v6 = [v5 window];
  char v7 = [v6 isInterfaceAutorotationDisabled];

  if ((v7 & 1) == 0)
  {
    objc_super v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 removeObserver:self];

    __int16 v9 = [MEMORY[0x263F1C5C0] currentDevice];
    [v9 endGeneratingDeviceOrientationNotifications];
  }
  [(RPPipViewController *)self stopPipSession];
}

- (void)_updateViewGeometry
{
  BOOL v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  int v12 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v12 orientation])
  {
    __int16 v13 = [MEMORY[0x263F1C5C0] currentDevice];
    int64_t initialOrientation = [v13 orientation];
  }
  else
  {
    int64_t initialOrientation = self->_initialOrientation;
  }

  unint64_t v15 = initialOrientation - 5;
  unint64_t v16 = initialOrientation - 1;
  if (v9 >= v11) {
    double v17 = v11;
  }
  else {
    double v17 = v9;
  }
  if (v9 >= v11) {
    double v18 = v9;
  }
  else {
    double v18 = v11;
  }
  if (v16 > 1)
  {
    double v18 = v11;
    double v17 = v9;
  }
  if (v9 <= v11) {
    double v19 = v11;
  }
  else {
    double v19 = v9;
  }
  if (v9 <= v11) {
    double v20 = v9;
  }
  else {
    double v20 = v11;
  }
  if (v15 >= 0xFFFFFFFFFFFFFFFELL) {
    double v21 = v20;
  }
  else {
    double v21 = v18;
  }
  if (v15 >= 0xFFFFFFFFFFFFFFFELL) {
    double v22 = v19;
  }
  else {
    double v22 = v17;
  }
  double v44 = v22 * 0.2;
  double v23 = v21 * (v22 * 0.2 / v22);
  int v24 = [(RPPipViewController *)self view];
  [v24 frame];
  if (v25 == 0.0)
  {
    int v26 = [(RPPipViewController *)self view];
    [v26 frame];
    double v28 = v27;

    BOOL v29 = v28 == 0.0;
    double v23 = v21 * (v22 * 0.2 / v22);
    if (v29)
    {
      v30 = [(RPPipViewController *)self view];
      objc_msgSend(v30, "setFrame:", v5 + v22 * 0.03, v7 + v21 * 0.03, v44, v21 * (v22 * 0.2 / v22));
      goto LABEL_40;
    }
  }
  else
  {
  }
  if ((unint64_t)([(RPPipViewController *)self previousOrientation] - 3) > 1 || v16 >= 2)
  {
    int64_t v31 = [(RPPipViewController *)self previousOrientation];
    if (v15 < 0xFFFFFFFFFFFFFFFELL || (unint64_t)(v31 - 3) < 0xFFFFFFFFFFFFFFFELL)
    {
      if ([(RPPipViewController *)self previousOrientation] != 5
        && [(RPPipViewController *)self previousOrientation] != 6)
      {
        goto LABEL_41;
      }
      [(RPPipViewController *)self previousOrientationWidth];
      double v33 = v32;
      [(RPPipViewController *)self previousOrientationHeight];
      if (v15 < 0xFFFFFFFFFFFFFFFELL || v33 >= v34)
      {
        [(RPPipViewController *)self previousOrientationWidth];
        double v36 = v35;
        [(RPPipViewController *)self previousOrientationHeight];
        if (v36 <= v37 || v16 > 1) {
          goto LABEL_41;
        }
      }
    }
  }
  v30 = [(RPPipViewController *)self view];
  [v30 frame];
  double v39 = v38;
  v40 = [(RPPipViewController *)self view];
  [v40 frame];
  double v42 = v41;
  v43 = [(RPPipViewController *)self view];
  objc_msgSend(v43, "setFrame:", v39, v42, v44, v23);

LABEL_40:
LABEL_41:
  [(RPPipViewController *)self setPreviousOrientation:initialOrientation];
  [(RPPipViewController *)self setPreviousOrientationWidth:v9];

  [(RPPipViewController *)self setPreviousOrientationHeight:v11];
}

- (void)_deviceOrientationDidChange
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__RPPipViewController__deviceOrientationDidChange__block_invoke;
  v7[3] = &unk_26451D7F0;
  v7[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v7 animations:0.3];
  BOOL v3 = [(RPPipViewController *)self _pipView];
  double v4 = [v3 previewLayer];
  double v5 = [v4 connection];
  double v6 = [MEMORY[0x263F1C5C0] currentDevice];
  objc_msgSend(v5, "setVideoOrientation:", -[RPPipViewController _captureVideoOrientationForUIDeviceOrientation:](self, "_captureVideoOrientationForUIDeviceOrientation:", objc_msgSend(v6, "orientation")));
}

uint64_t __50__RPPipViewController__deviceOrientationDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateViewGeometry];
}

- (int64_t)_captureVideoOrientationForUIDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3) {
    return 1;
  }
  else {
    return a3;
  }
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (AVCaptureSession)pipSession
{
  return self->_pipSession;
}

- (void)setPipSession:(id)a3
{
}

- (AVCaptureDevice)videoDevice
{
  return self->_videoDevice;
}

- (void)setVideoDevice:(id)a3
{
}

- (AVCaptureDeviceInput)videoInput
{
  return self->_videoInput;
}

- (void)setVideoInput:(id)a3
{
}

- (int64_t)initialOrientation
{
  return self->_initialOrientation;
}

- (void)setInitialOrientation:(int64_t)a3
{
  self->_int64_t initialOrientation = a3;
}

- (int64_t)previousOrientation
{
  return self->_previousOrientation;
}

- (void)setPreviousOrientation:(int64_t)a3
{
  self->_previousOrientation = a3;
}

- (double)previousOrientationWidth
{
  return self->_previousOrientationWidth;
}

- (void)setPreviousOrientationWidth:(double)a3
{
  self->_previousOrientationWidth = a3;
}

- (double)previousOrientationHeight
{
  return self->_previousOrientationHeight;
}

- (void)setPreviousOrientationHeight:(double)a3
{
  self->_previousOrientationHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoInput, 0);
  objc_storeStrong((id *)&self->_videoDevice, 0);

  objc_storeStrong((id *)&self->_pipSession, 0);
}

- (void)cameraWithPosition:.cold.1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136446466;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)((char *)&v0[3] + 2) = 136;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Camera not found", (uint8_t *)v0, 0x12u);
}

- (void)configurePipSessionWithCameraPosition:(void *)a1 .cold.1(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 localizedDescription];
  v2[0] = 136446722;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Error creating capture device input: %@", (uint8_t *)v2, 0x1Cu);
}

@end