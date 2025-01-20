@interface RPAngelCameraPipViewController
- (RPAngelCameraPipViewController)init;
- (id)cameraWithPosition:(int64_t)a3;
- (void)cameraDidBecomeAvailableForUniqueID:(id)a3;
- (void)cameraDidBecomeInterruptedForForUniqueID:(id)a3 reason:(int64_t)a4;
- (void)didChangeLocalScreenAttributes:(id)a3;
- (void)didChangeLocalVideoAttributes:(id)a3;
- (void)didPausePreview;
- (void)didStartPreview;
- (void)didStopPreview;
- (void)layoutPreviewLayer;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setupPreview;
- (void)startPipSession;
- (void)stopPipSession;
- (void)updateViewGeometry;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation RPAngelCameraPipViewController

- (RPAngelCameraPipViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)RPAngelCameraPipViewController;
  v2 = [(RPAngelCameraPipViewController *)&v4 init];
  if (v2)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v6 = "-[RPAngelCameraPipViewController init]";
      __int16 v7 = 1024;
      int v8 = 32;
      __int16 v9 = 2048;
      v10 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    v2->_isRunning = 0;
    [(RPAngelCameraPipViewController *)v2 setupPreview];
  }
  return v2;
}

- (id)cameraWithPosition:(int64_t)a3
{
  objc_super v4 = +[AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
  if (v4)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v21 = "-[RPAngelCameraPipViewController cameraWithPosition:]";
      __int16 v22 = 1024;
      int v23 = 43;
      __int16 v24 = 1024;
      unsigned int v25 = [v4 count];
      v5 = " [INFO] %{public}s:%d looking for camera in %d capture devices";
      uint32_t v6 = 24;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, buf, v6);
    }
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPAngelCameraPipViewController cameraWithPosition:]";
    __int16 v22 = 1024;
    int v23 = 45;
    v5 = " [INFO] %{public}s:%d no capture devices found";
    uint32_t v6 = 18;
    goto LABEL_8;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "position", (void)v16) == (id)a3)
        {
          if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v14 = [v12 uniqueID];
            *(_DWORD *)buf = 136446978;
            v21 = "-[RPAngelCameraPipViewController cameraWithPosition:]";
            __int16 v22 = 1024;
            int v23 = 51;
            __int16 v24 = 1024;
            unsigned int v25 = a3;
            __int16 v26 = 2112;
            v27 = v14;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d camera found with position %d UID %@", buf, 0x22u);
          }
          v13 = [v12 uniqueID];

          goto LABEL_25;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10002CB0C();
  }
  v13 = 0;
LABEL_25:

  return v13;
}

- (void)setupPreview
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136446466;
    long long v16 = "-[RPAngelCameraPipViewController setupPreview]";
    __int16 v17 = 1024;
    int v18 = 60;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v15, 0x12u);
  }
  v3 = (CALayer *)objc_alloc_init((Class)CALayer);
  previewLayer = self->_previewLayer;
  self->_previewLayer = v3;

  v5 = +[AVConferencePreview AVConferencePreviewSingleton];
  preview = self->_preview;
  self->_preview = v5;

  [(AVConferencePreview *)self->_preview setDelegate:self];
  id v7 = self->_preview;
  id v8 = [(RPAngelCameraPipViewController *)self cameraWithPosition:2];
  [(AVConferencePreview *)v7 setLocalCameraWithUID:v8];

  [(AVConferencePreview *)self->_preview setLocalVideoLayer:self->_previewLayer front:1];
  id v9 = [(RPAngelCameraPipViewController *)self view];
  uint64_t v10 = [v9 layer];
  [v10 setMasksToBounds:1];

  v11 = [(RPAngelCameraPipViewController *)self view];
  v12 = [v11 layer];
  [v12 addSublayer:self->_previewLayer];

  v13 = [(AVConferencePreview *)self->_preview localVideoAttributes];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136446722;
    long long v16 = "-[RPAngelCameraPipViewController setupPreview]";
    __int16 v17 = 1024;
    int v18 = 70;
    __int16 v19 = 2112;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d localVideoAttributes %@", (uint8_t *)&v15, 0x1Cu);
  }
  v14 = [(AVConferencePreview *)self->_preview localScreenAttributesForVideoAttributes:v13];

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136446722;
    long long v16 = "-[RPAngelCameraPipViewController setupPreview]";
    __int16 v17 = 1024;
    int v18 = 72;
    __int16 v19 = 2112;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d localScreenAttributes %@", (uint8_t *)&v15, 0x1Cu);
  }
  [(RPAngelCameraPipViewController *)self layoutPreviewLayer];
}

- (void)startPipSession
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    preview = self->_preview;
    *(_DWORD *)buf = 136446722;
    v14 = "-[RPAngelCameraPipViewController startPipSession]";
    __int16 v15 = 1024;
    int v16 = 77;
    __int16 v17 = 2048;
    int v18 = preview;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  if (+[PGPictureInPictureProxy isPictureInPictureSupported])
  {
    if (self->_isRunning)
    {
      if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v14 = "-[RPAngelCameraPipViewController startPipSession]";
        __int16 v15 = 1024;
        int v16 = 107;
        objc_super v4 = " [INFO] %{public}s:%d pip already running";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, buf, 0x12u);
      }
    }
    else
    {
      if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        [(RPAngelCameraPipViewController *)self preferredContentSize];
        uint32_t v6 = v5;
        [(RPAngelCameraPipViewController *)self preferredContentSize];
        *(_DWORD *)buf = 136446978;
        v14 = "-[RPAngelCameraPipViewController startPipSession]";
        __int16 v15 = 1024;
        int v16 = 82;
        __int16 v17 = 2048;
        int v18 = v6;
        __int16 v19 = 2048;
        uint64_t v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d preferred content size: w:%lf x h:%lf", buf, 0x26u);
      }
      id v8 = (PGPictureInPictureProxy *)[objc_alloc((Class)PGPictureInPictureProxy) initWithControlsStyle:0 viewController:self];
      pegasusProxy = self->_pegasusProxy;
      self->_pegasusProxy = v8;

      [(PGPictureInPictureProxy *)self->_pegasusProxy setDelegate:self];
      if (([(AVConferencePreview *)self->_preview isPreviewRunning] & 1) == 0)
      {
        if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v14 = "-[RPAngelCameraPipViewController startPipSession]";
          __int16 v15 = 1024;
          int v16 = 89;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d not running, can start", buf, 0x12u);
        }
        [(AVConferencePreview *)self->_preview startPreview];
        if ([(PGPictureInPictureProxy *)self->_pegasusProxy isPictureInPicturePossible])
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000077C0;
          block[3] = &unk_10003D028;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
        else
        {
          [(PGPictureInPictureProxy *)self->_pegasusProxy addObserver:self forKeyPath:@"pictureInPicturePossible" options:0 context:0];
        }
        uint64_t v10 = +[NSNotificationCenter defaultCenter];
        [v10 addObserver:self selector:"updateViewGeometry" name:UIDeviceOrientationDidChangeNotification object:0];

        v11 = +[UIDevice currentDevice];
        [v11 beginGeneratingDeviceOrientationNotifications];

        self->_isRunning = 1;
      }
    }
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v14 = "-[RPAngelCameraPipViewController startPipSession]";
    __int16 v15 = 1024;
    int v16 = 79;
    objc_super v4 = " [INFO] %{public}s:%d pip not supported on device";
    goto LABEL_12;
  }
}

- (void)stopPipSession
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    id v9 = "-[RPAngelCameraPipViewController stopPipSession]";
    __int16 v10 = 1024;
    int v11 = 112;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  pegasusProxy = self->_pegasusProxy;
  if (pegasusProxy)
  {
    [(PGPictureInPictureProxy *)pegasusProxy stopPictureInPictureAndRestoreUserInterface:0];
    [(PGPictureInPictureProxy *)self->_pegasusProxy removeObserver:self forKeyPath:@"pictureInPicturePossible"];
    [(PGPictureInPictureProxy *)self->_pegasusProxy setDelegate:0];
    objc_super v4 = self->_pegasusProxy;
    self->_pegasusProxy = 0;
  }
  [(AVConferencePreview *)self->_preview stopPreview];
  [(AVConferencePreview *)self->_preview setDelegate:0];
  previewLayer = self->_previewLayer;
  self->_previewLayer = 0;

  uint32_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:UIDeviceOrientationDidChangeNotification object:0];

  uint64_t v7 = +[UIDevice currentDevice];
  [v7 endGeneratingDeviceOrientationNotifications];

  self->_isRunning = 0;
}

- (void)loadView
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    uint64_t v7 = "-[RPAngelCameraPipViewController loadView]";
    __int16 v8 = 1024;
    int v9 = 135;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(RPAngelCameraPipViewController *)self setView:v3];

  objc_super v4 = +[UIColor clearColor];
  v5 = [(RPAngelCameraPipViewController *)self view];
  [v5 setBackgroundColor:v4];

  [(RPAngelCameraPipViewController *)self updateViewGeometry];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v7 = "-[RPAngelCameraPipViewController viewDidDisappear:]";
    __int16 v8 = 1024;
    int v9 = 142;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v5.receiver = self;
  v5.super_class = (Class)RPAngelCameraPipViewController;
  [(RPAngelCameraPipViewController *)&v5 viewDidDisappear:v3];
  [(RPAngelCameraPipViewController *)self stopPipSession];
}

- (void)viewDidLayoutSubviews
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    objc_super v4 = "-[RPAngelCameraPipViewController viewDidLayoutSubviews]";
    __int16 v5 = 1024;
    int v6 = 148;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d viewDidLayoutSubviews", (uint8_t *)&v3, 0x12u);
  }
  [(RPAngelCameraPipViewController *)self layoutPreviewLayer];
}

- (void)layoutPreviewLayer
{
  int v3 = [(RPAngelCameraPipViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  __int16 v8 = [(AVConferencePreview *)self->_preview localVideoAttributes];
  if ([v8 camera] == 3)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 136446466;
      v41 = "-[RPAngelCameraPipViewController layoutPreviewLayer]";
      __int16 v42 = 1024;
      int v43 = 158;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d camera invalid", (uint8_t *)&v40, 0x12u);
    }
    [v8 setRatio:1080.0, 1920.0];
  }
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    [v8 ratio];
    double v10 = v9;
    [v8 ratio];
    int v40 = 136446978;
    v41 = "-[RPAngelCameraPipViewController layoutPreviewLayer]";
    __int16 v42 = 1024;
    int v43 = 163;
    __int16 v44 = 2048;
    double v45 = v10;
    __int16 v46 = 2048;
    double v47 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d localVideoAttributes: %lf x %lf", (uint8_t *)&v40, 0x26u);
  }
  [v8 ratio];
  float v13 = v5 / v12;
  [v8 ratio];
  float v15 = v7 / v14;
  [v8 ratio];
  if (v13 <= v15)
  {
    float v20 = v17 * v15;
    float v21 = v7;
    -[CALayer setFrame:](self->_previewLayer, "setFrame:", (v5 - v20) * 0.5, 0.0, v20, v21);
  }
  else
  {
    float v19 = v18 * v13;
    float v16 = v5;
    -[CALayer setFrame:](self->_previewLayer, "setFrame:", 0.0, (v7 - v19) * 0.5, v16);
  }
  if (__RPLogLevel <= 1u)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = [(RPAngelCameraPipViewController *)self view];
      [v22 frame];
      double v24 = v23;
      unsigned int v25 = [(RPAngelCameraPipViewController *)self view];
      [v25 frame];
      double v27 = v26;
      v28 = [(RPAngelCameraPipViewController *)self view];
      [v28 frame];
      uint64_t v30 = v29;
      v31 = [(RPAngelCameraPipViewController *)self view];
      [v31 frame];
      int v40 = 136447490;
      v41 = "-[RPAngelCameraPipViewController layoutPreviewLayer]";
      __int16 v42 = 1024;
      int v43 = 179;
      __int16 v44 = 2048;
      double v45 = v24;
      __int16 v46 = 2048;
      double v47 = v27;
      __int16 v48 = 2048;
      uint64_t v49 = v30;
      __int16 v50 = 2048;
      uint64_t v51 = v32;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d view frame - origin:%lf, %lf size:%lf x %lf", (uint8_t *)&v40, 0x3Au);
    }
    if (__RPLogLevel <= 1u)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v40 = 136446978;
        v41 = "-[RPAngelCameraPipViewController layoutPreviewLayer]";
        __int16 v42 = 1024;
        int v43 = 180;
        __int16 v44 = 2048;
        double v45 = v13;
        __int16 v46 = 2048;
        double v47 = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d width factor: %f height factor:%f", (uint8_t *)&v40, 0x26u);
      }
      if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        [(CALayer *)self->_previewLayer frame];
        double v34 = v33;
        [(CALayer *)self->_previewLayer frame];
        double v36 = v35;
        [(CALayer *)self->_previewLayer frame];
        uint64_t v38 = v37;
        [(CALayer *)self->_previewLayer frame];
        int v40 = 136447490;
        v41 = "-[RPAngelCameraPipViewController layoutPreviewLayer]";
        __int16 v42 = 1024;
        int v43 = 181;
        __int16 v44 = 2048;
        double v45 = v34;
        __int16 v46 = 2048;
        double v47 = v36;
        __int16 v48 = 2048;
        uint64_t v49 = v38;
        __int16 v50 = 2048;
        uint64_t v51 = v39;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d preview layer frame - origin:%lf, %lf size:%lf x %lf", (uint8_t *)&v40, 0x3Au);
      }
    }
  }
}

- (void)updateViewGeometry
{
  int v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;

  -[RPAngelCameraPipViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5 * 0.2, v5 * 0.2);
  pegasusProxy = self->_pegasusProxy;

  [(PGPictureInPictureProxy *)pegasusProxy preferredContentSizeDidChangeForViewController];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 isEqualToString:@"pictureInPicturePossible"]
    && [(PGPictureInPictureProxy *)self->_pegasusProxy isPictureInPicturePossible])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000083B8;
    block[3] = &unk_10003D028;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    [v10 removeObserver:self forKeyPath:@"pictureInPicturePossible"];
  }
}

- (void)didStartPreview
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    int v3 = "-[RPAngelCameraPipViewController didStartPreview]";
    __int16 v4 = 1024;
    int v5 = 212;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v2, 0x12u);
  }
}

- (void)didPausePreview
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    int v3 = "-[RPAngelCameraPipViewController didPausePreview]";
    __int16 v4 = 1024;
    int v5 = 216;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v2, 0x12u);
  }
}

- (void)didStopPreview
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    int v3 = "-[RPAngelCameraPipViewController didStopPreview]";
    __int16 v4 = 1024;
    int v5 = 220;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v2, 0x12u);
  }
}

- (void)cameraDidBecomeAvailableForUniqueID:(id)a3
{
  id v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    int v5 = "-[RPAngelCameraPipViewController cameraDidBecomeAvailableForUniqueID:]";
    __int16 v6 = 1024;
    int v7 = 224;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
}

- (void)cameraDidBecomeInterruptedForForUniqueID:(id)a3 reason:(int64_t)a4
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    __int16 v6 = "-[RPAngelCameraPipViewController cameraDidBecomeInterruptedForForUniqueID:reason:]";
    __int16 v7 = 1024;
    int v8 = 228;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
}

- (void)didChangeLocalVideoAttributes:(id)a3
{
  id v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446722;
    int v5 = "-[RPAngelCameraPipViewController didChangeLocalVideoAttributes:]";
    __int16 v6 = 1024;
    int v7 = 232;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@", (uint8_t *)&v4, 0x1Cu);
  }
}

- (void)didChangeLocalScreenAttributes:(id)a3
{
  id v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446722;
    int v5 = "-[RPAngelCameraPipViewController didChangeLocalScreenAttributes:]";
    __int16 v6 = 1024;
    int v7 = 236;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@", (uint8_t *)&v4, 0x1Cu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusProxy, 0);
  objc_storeStrong((id *)&self->_preview, 0);

  objc_storeStrong((id *)&self->_previewLayer, 0);
}

@end