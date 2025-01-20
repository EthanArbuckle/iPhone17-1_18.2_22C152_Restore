@interface DCDocumentCameraViewServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4;
- (DCDocumentCameraRemoteViewController)remoteViewController;
- (DCDocumentCameraViewServiceSession)session;
- (DCDocumentCameraViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICDocCamViewController)docCamViewController;
- (UIViewController)childViewController;
- (id)documentCameraControllerCreateDataCryptorIfNecessary;
- (id)scanDataDelegateWithIdentifier:(id)a3;
- (void)dismiss;
- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6;
- (void)documentCameraController:(id)a3 didFinishWithImage:(id)a4;
- (void)documentCameraControllerDidCancel:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)prepareForDisplayWithCompletion:(id)a3;
- (void)remoteDocumentCameraController:(id)a3 didFailWithError:(id)a4;
- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4;
- (void)remoteDocumentCameraControllerDidCancel:(id)a3;
- (void)removeSaveActionBlockerForFiles;
- (void)setChildViewController:(id)a3;
- (void)setDocCamViewController:(id)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setSession:(id)a3;
- (void)startSessionWithClientContext:(id)a3 completion:(id)a4;
- (void)viewControllerWasDismissed;
@end

@implementation DCDocumentCameraViewServiceViewController

- (DCDocumentCameraViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DCDocumentCameraViewServiceViewController;
  v4 = [(DCDocumentCameraViewServiceViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = os_log_create("com.apple.documentcamera", (const char *)&unk_10000394F);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000025E8(v5);
    }
  }
  return v4;
}

- (void)startSessionWithClientContext:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)DCDocumentCameraViewServiceSession) initWithSessionRequest:v7];

  [(DCDocumentCameraViewServiceViewController *)self setSession:v8];
  id v9 = [(DCDocumentCameraViewServiceViewController *)self session];
  v6[2](v6, v9);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[UIDevice currentDevice];
  [v6 setOrientation:a3 animated:v4];
}

- (void)setChildViewController:(id)a3
{
  p_childViewController = &self->_childViewController;
  objc_storeStrong((id *)&self->_childViewController, a3);
  id v35 = a3;
  [(UIViewController *)*p_childViewController beginAppearanceTransition:1 animated:0];
  [(DCDocumentCameraViewServiceViewController *)self addChildViewController:*p_childViewController];
  v34 = (id *)p_childViewController;
  id v6 = [(UIViewController *)*p_childViewController view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v7 = [(DCDocumentCameraViewServiceViewController *)self view];
  id v8 = [(UIViewController *)*p_childViewController view];
  [v7 addSubview:v8];

  v33 = [(DCDocumentCameraViewServiceViewController *)self childViewController];
  v32 = [v33 view];
  v30 = [v32 leadingAnchor];
  v31 = [(DCDocumentCameraViewServiceViewController *)self view];
  v29 = [v31 leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v36[0] = v28;
  v27 = [(DCDocumentCameraViewServiceViewController *)self childViewController];
  v26 = [v27 view];
  v24 = [v26 trailingAnchor];
  v25 = [(DCDocumentCameraViewServiceViewController *)self view];
  v23 = [v25 trailingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v36[1] = v22;
  v21 = [(DCDocumentCameraViewServiceViewController *)self childViewController];
  v20 = [v21 view];
  v18 = [v20 topAnchor];
  v19 = [(DCDocumentCameraViewServiceViewController *)self view];
  id v9 = [v19 topAnchor];
  v10 = [v18 constraintEqualToAnchor:v9];
  v36[2] = v10;
  v11 = [(DCDocumentCameraViewServiceViewController *)self childViewController];
  v12 = [v11 view];
  v13 = [v12 bottomAnchor];
  v14 = [(DCDocumentCameraViewServiceViewController *)self view];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v36[3] = v16;
  v17 = +[NSArray arrayWithObjects:v36 count:4];
  +[NSLayoutConstraint activateConstraints:v17];

  [*v34 didMoveToParentViewController:self];
  [*v34 endAppearanceTransition];
}

- (void)dismiss
{
  id v2 = [(DCDocumentCameraViewServiceViewController *)self remoteViewController];
  [v2 dismiss];
}

- (DCDocumentCameraRemoteViewController)remoteViewController
{
  return (DCDocumentCameraRemoteViewController *)[(DCDocumentCameraViewServiceViewController *)self _remoteViewControllerProxy];
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DCDocumentCameraViewServiceViewController];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DCDocumentCameraRemoteViewController];
}

- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4
{
  return kMaximumPagePerScanSession > a4;
}

- (id)documentCameraControllerCreateDataCryptorIfNecessary
{
  return 0;
}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6
{
  id v7 = a4;
  id v8 = [(DCDocumentCameraViewServiceViewController *)self remoteViewController];
  [v8 didFinishWithDocumentInfoCollection:v7];

  [(DCDocumentCameraViewServiceViewController *)self dismiss];
}

- (void)documentCameraController:(id)a3 didFinishWithImage:(id)a4
{
  v5 = [(DCDocumentCameraViewServiceViewController *)self remoteViewController];
  [v5 didCancel];

  [(DCDocumentCameraViewServiceViewController *)self dismiss];
}

- (void)documentCameraControllerDidCancel:(id)a3
{
  id v7 = a3;
  if ([v7 setupResult])
  {
    if ([v7 setupResult] == (id)1) {
      uint64_t v4 = -11852;
    }
    else {
      uint64_t v4 = -11800;
    }
    v5 = +[NSError errorWithDomain:AVFoundationErrorDomain code:v4 userInfo:0];
    id v6 = [(DCDocumentCameraViewServiceViewController *)self remoteViewController];
    [v6 didFailWithError:v5];
  }
  else
  {
    v5 = [(DCDocumentCameraViewServiceViewController *)self remoteViewController];
    [v5 didCancel];
  }

  [(DCDocumentCameraViewServiceViewController *)self dismiss];
}

- (id)scanDataDelegateWithIdentifier:(id)a3
{
  return 0;
}

- (void)remoteDocumentCameraControllerDidCancel:(id)a3
{
  uint64_t v4 = [(DCDocumentCameraViewServiceViewController *)self remoteViewController];
  [v4 didCancel];

  [(DCDocumentCameraViewServiceViewController *)self dismiss];
}

- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4
{
  id v5 = a4;
  id v6 = [(DCDocumentCameraViewServiceViewController *)self remoteViewController];
  [v6 didFinishWithDocumentInfoCollection:v5];

  [(DCDocumentCameraViewServiceViewController *)self dismiss];
}

- (void)remoteDocumentCameraController:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(DCDocumentCameraViewServiceViewController *)self remoteViewController];
  [v6 didFailWithError:v5];

  [(DCDocumentCameraViewServiceViewController *)self dismiss];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DCDocumentCameraViewServiceViewController;
  id v4 = a3;
  [(DCDocumentCameraViewServiceViewController *)&v10 preferredContentSizeDidChangeForChildContentContainer:v4];
  id v5 = [(DCDocumentCameraViewServiceViewController *)self remoteViewController];
  [v4 preferredContentSize];
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(v5, "viewServicePreferredSizeDidChange:", v7, v9);
}

- (void)prepareForDisplayWithCompletion:(id)a3
{
  v16 = (void (**)(void))a3;
  id v4 = [(DCDocumentCameraViewServiceViewController *)self view];
  id v5 = [v4 window];
  [v5 frame];
  -[DCDocumentCameraViewServiceViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v7);

  if (DCDebugInterfaceEnabled())
  {
    id v8 = objc_alloc((Class)ICRemoteDocCamViewController);
    double v9 = [(DCDocumentCameraViewServiceViewController *)self session];
    objc_super v10 = [v9 docCamImageCache];
    id v11 = [v8 initWithImageCache:v10];

    [v11 setDelegate:self];
    [(DCDocumentCameraViewServiceViewController *)self setChildViewController:v11];
  }
  else
  {
    id v12 = objc_alloc((Class)ICDocCamViewController);
    v13 = [(DCDocumentCameraViewServiceViewController *)self session];
    v14 = [v13 docCamImageCache];
    id v11 = [v12 initWithImageCache:v14];

    [v11 setDelegate:self];
    [(DCDocumentCameraViewServiceViewController *)self setDocCamViewController:v11];
    id v15 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v11];
    [v15 setNavigationBarHidden:1 animated:0];
    [(DCDocumentCameraViewServiceViewController *)self setChildViewController:v15];
  }
  [(DCDocumentCameraViewServiceViewController *)self preferredContentSize];
  v16[2]();
}

- (void)viewControllerWasDismissed
{
  v3 = os_log_create("com.apple.documentcamera", (const char *)&unk_10000394F);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000262C(self, v3);
  }

  [(DCDocumentCameraViewServiceViewController *)self setSession:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)removeSaveActionBlockerForFiles
{
  v3 = os_log_create("com.apple.documentcamera", (const char *)&unk_10000394F);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000026EC(v3);
  }

  id v4 = [(DCDocumentCameraViewServiceViewController *)self docCamViewController];
  [v4 removeSaveActionBlockerForFiles];
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (ICDocCamViewController)docCamViewController
{
  return self->_docCamViewController;
}

- (void)setDocCamViewController:(id)a3
{
}

- (DCDocumentCameraViewServiceSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_docCamViewController, 0);

  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end