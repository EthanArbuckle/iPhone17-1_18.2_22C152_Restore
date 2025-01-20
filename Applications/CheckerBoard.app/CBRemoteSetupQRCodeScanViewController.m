@interface CBRemoteSetupQRCodeScanViewController
- (AVCaptureSession)captureSession;
- (AVCaptureVideoPreviewLayer)capturePreviewLayer;
- (CBRemoteSetupManager)remoteSetupManager;
- (CBRemoteSetupQRCodeScanViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 remoteSetupManager:(id)a6 captureSession:(id)a7;
- (NSLayoutConstraint)heightConstraint;
- (UIView)containerView;
- (UIView)previewView;
- (void)setCapturePreviewLayer:(id)a3;
- (void)setCaptureSession:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setPreviewView:(id)a3;
- (void)setRemoteSetupManager:(id)a3;
- (void)setupView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CBRemoteSetupQRCodeScanViewController

- (CBRemoteSetupQRCodeScanViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 remoteSetupManager:(id)a6 captureSession:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)CBRemoteSetupQRCodeScanViewController;
  v15 = [(CBRemoteSetupQRCodeScanViewController *)&v18 initWithTitle:a3 detailText:a4 icon:a5];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_remoteSetupManager, a6);
    objc_storeStrong((id *)&v16->_captureSession, a7);
  }

  return v16;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CBRemoteSetupQRCodeScanViewController;
  [(CBRemoteSetupQRCodeScanViewController *)&v3 viewDidLoad];
  [(CBRemoteSetupQRCodeScanViewController *)self setupView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CBRemoteSetupQRCodeScanViewController;
  [(CBRemoteSetupQRCodeScanViewController *)&v14 viewDidAppear:a3];
  v4 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(CBRemoteSetupQRCodeScanViewController *)self capturePreviewLayer];
  [v13 setFrame:v6, v8, v10, v12];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CBRemoteSetupQRCodeScanViewController;
  [(CBRemoteSetupQRCodeScanViewController *)&v7 viewDidDisappear:a3];
  v4 = [(CBRemoteSetupQRCodeScanViewController *)self remoteSetupManager];
  id v5 = [v4 setupState];

  if (v5 == (id)3)
  {
    double v6 = [(CBRemoteSetupQRCodeScanViewController *)self remoteSetupManager];
    [v6 restartRemoteSetupBroadcast];
  }
}

- (void)setupView
{
  objc_super v3 = [(CBRemoteSetupQRCodeScanViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(CBRemoteSetupQRCodeScanViewController *)self headerView];
  [v4 setTitleHyphenationFactor:0.0];

  id v5 = objc_alloc_init((Class)UIView);
  [(CBRemoteSetupQRCodeScanViewController *)self setContainerView:v5];

  double v6 = [(CBRemoteSetupQRCodeScanViewController *)self containerView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_initWeak(&location, self);
  objc_super v7 = [(CBRemoteSetupQRCodeScanViewController *)self containerView];
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10001F9D0;
  v62[3] = &unk_100079D58;
  objc_copyWeak(&v63, &location);
  [(CBRemoteSetupQRCodeScanViewController *)self addContentSubView:v7 heightConstraintForLayout:v62];

  id v8 = objc_alloc((Class)UIView);
  double v9 = [(CBRemoteSetupQRCodeScanViewController *)self containerView];
  [v9 frame];
  id v10 = [v8 initWithFrame:];
  [(CBRemoteSetupQRCodeScanViewController *)self setPreviewView:v10];

  double v11 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v12 = [(CBRemoteSetupQRCodeScanViewController *)self containerView];
  id v13 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  [v12 addSubview:v13];

  v61 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  v59 = [v61 leadingAnchor];
  v60 = [(CBRemoteSetupQRCodeScanViewController *)self containerView];
  v58 = [v60 leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v65[0] = v57;
  v56 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  v54 = [v56 trailingAnchor];
  v55 = [(CBRemoteSetupQRCodeScanViewController *)self containerView];
  v53 = [v55 trailingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v65[1] = v52;
  v51 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  v49 = [v51 topAnchor];
  v50 = [(CBRemoteSetupQRCodeScanViewController *)self containerView];
  v48 = [v50 topAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v65[2] = v47;
  v46 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  v44 = [v46 bottomAnchor];
  v45 = [(CBRemoteSetupQRCodeScanViewController *)self view];
  v43 = [v45 bottomAnchor];
  v42 = [v44 constraintEqualToAnchor:v43 constant:0.0];
  v65[3] = v42;
  v41 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  v39 = [v41 centerXAnchor];
  v40 = [(CBRemoteSetupQRCodeScanViewController *)self containerView];
  v38 = [v40 centerXAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v65[4] = v37;
  v36 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  v34 = [v36 centerYAnchor];
  v35 = [(CBRemoteSetupQRCodeScanViewController *)self containerView];
  v33 = [v35 centerYAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v65[5] = v32;
  v31 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  v30 = [v31 widthAnchor];
  objc_super v14 = [(CBRemoteSetupQRCodeScanViewController *)self view];
  v15 = [v14 widthAnchor];
  v16 = [v30 constraintEqualToAnchor:v15];
  v65[6] = v16;
  v17 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  objc_super v18 = [v17 heightAnchor];
  v19 = [(CBRemoteSetupQRCodeScanViewController *)self containerView];
  v20 = [v19 heightAnchor];
  v21 = [v18 constraintLessThanOrEqualToAnchor:v20];
  v65[7] = v21;
  v22 = +[NSArray arrayWithObjects:v65 count:8];
  +[NSLayoutConstraint activateConstraints:v22];

  v23 = [(CBRemoteSetupQRCodeScanViewController *)self view];
  [v23 setNeedsLayout];

  id v24 = objc_alloc((Class)AVCaptureVideoPreviewLayer);
  v25 = [(CBRemoteSetupQRCodeScanViewController *)self captureSession];
  id v26 = [v24 initWithSession:v25];

  [v26 setVideoGravity:kCAGravityResizeAspectFill];
  v27 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  [v27 frame];
  [v26 setFrame:];

  v28 = [(CBRemoteSetupQRCodeScanViewController *)self previewView];
  v29 = [v28 layer];
  [v29 addSublayer:v26];

  [(CBRemoteSetupQRCodeScanViewController *)self setCapturePreviewLayer:v26];
  objc_destroyWeak(&v63);
  objc_destroyWeak(&location);
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (AVCaptureVideoPreviewLayer)capturePreviewLayer
{
  return self->_capturePreviewLayer;
}

- (void)setCapturePreviewLayer:(id)a3
{
}

- (CBRemoteSetupManager)remoteSetupManager
{
  return self->_remoteSetupManager;
}

- (void)setRemoteSetupManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSetupManager, 0);
  objc_storeStrong((id *)&self->_capturePreviewLayer, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);

  objc_storeStrong((id *)&self->_captureSession, 0);
}

@end