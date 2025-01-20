@interface RPVideoEditorExtensionViewController
- (BOOL)isInternalTestMode;
- (NSString)appName;
- (NSString)bundleIdentifier;
- (NSString)overrideShareMessage;
- (NSURL)fileAttachmentURL;
- (NSURL)movieURL;
- (OS_dispatch_queue)replyQueue;
- (RPVideoEditorViewController)videoEditorViewController;
- (UIColor)overrideTintColor;
- (void)doAction:(id)a3;
- (void)inputItemsFromClientWithCompletionHandler:(id)a3;
- (void)setAppName:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setFileAttachmentURL:(id)a3;
- (void)setIsInternalTestMode:(BOOL)a3;
- (void)setMovieURL:(id)a3;
- (void)setOverrideShareMessage:(id)a3;
- (void)setOverrideTintColor:(id)a3;
- (void)setReplyQueue:(id)a3;
- (void)setVideoEditorViewController:(id)a3;
- (void)setupChildViewControllers;
- (void)setupVideoEditorController;
- (void)tearDownChildViewControllers;
- (void)videoEditor:(id)a3 didFinishWithActivityTypes:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RPVideoEditorExtensionViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)RPVideoEditorExtensionViewController;
  [(RPVideoEditorExtensionViewController *)&v5 viewDidLoad];
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ReplayKit.RPVideoEditorExtension.replyQueue", 0);
  replyQueue = self->_replyQueue;
  self->_replyQueue = v3;

  [(RPVideoEditorExtensionViewController *)self setupChildViewControllers];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RPVideoEditorExtensionViewController;
  [(RPVideoEditorExtensionViewController *)&v4 viewWillAppear:a3];
  if (!self->_videoEditorViewController) {
    [(RPVideoEditorExtensionViewController *)self setupVideoEditorController];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RPVideoEditorExtensionViewController;
  [(RPVideoEditorExtensionViewController *)&v5 viewDidDisappear:a3];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPVideoEditorExtensionViewController -viewDidDisappear:", v4, 2u);
  }
  [(RPVideoEditorExtensionViewController *)self tearDownChildViewControllers];
}

- (void)setupChildViewControllers
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPVideoEditorExtensionViewController -setupChildViewControllers", buf, 2u);
  }
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000D9F4;
  v3[3] = &unk_1000187A8;
  v3[4] = self;
  [(RPVideoEditorExtensionViewController *)self inputItemsFromClientWithCompletionHandler:v3];
}

- (void)setupVideoEditorController
{
  v3 = [RPVideoEditorViewController alloc];
  bundleIdentifier = self->_bundleIdentifier;
  movieURL = self->_movieURL;
  appName = self->_appName;
  overrideTintColor = self->_overrideTintColor;
  v8 = [(RPVideoEditorExtensionViewController *)self view];
  [v8 bounds];
  v9 = -[RPVideoEditorViewController initWithBundleIdentifier:URL:applicationName:overrideTintColor:size:](v3, "initWithBundleIdentifier:URL:applicationName:overrideTintColor:size:", bundleIdentifier, movieURL, appName, overrideTintColor);
  [(RPVideoEditorExtensionViewController *)self setVideoEditorViewController:v9];

  [(RPVideoEditorViewController *)self->_videoEditorViewController setFileAttachmentURL:self->_fileAttachmentURL];
  [(RPVideoEditorViewController *)self->_videoEditorViewController setOverrideShareMessage:self->_overrideShareMessage];
  [(RPVideoEditorViewController *)self->_videoEditorViewController setDelegate:self];
  [(RPVideoEditorExtensionViewController *)self addChildViewController:self->_videoEditorViewController];
  v10 = [(RPVideoEditorExtensionViewController *)self view];
  v11 = [(RPVideoEditorViewController *)self->_videoEditorViewController view];
  [v10 addSubview:v11];

  videoEditorViewController = self->_videoEditorViewController;

  [(RPVideoEditorViewController *)videoEditorViewController didMoveToParentViewController:self];
}

- (void)tearDownChildViewControllers
{
  [(RPVideoEditorViewController *)self->_videoEditorViewController willMoveToParentViewController:0];
  v3 = [(RPVideoEditorViewController *)self->_videoEditorViewController view];
  [v3 removeFromSuperview];

  [(RPVideoEditorViewController *)self->_videoEditorViewController removeFromParentViewController];

  [(RPVideoEditorExtensionViewController *)self setVideoEditorViewController:0];
}

- (void)inputItemsFromClientWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPVideoEditorExtensionViewController -inputItemsFromClientWithCompletionHandler:", buf, 2u);
  }
  objc_super v5 = (id)kUTTypeData;
  *(void *)buf = 0;
  v41 = buf;
  uint64_t v42 = 0x3032000000;
  v43 = sub_10000E244;
  v44 = sub_10000E254;
  id v45 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_10000E244;
  v38[4] = sub_10000E254;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_10000E244;
  v36[4] = sub_10000E254;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_10000E244;
  v34[4] = sub_10000E254;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_10000E244;
  v32[4] = sub_10000E254;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_10000E244;
  v30[4] = sub_10000E254;
  id v31 = 0;
  dispatch_group_t v6 = dispatch_group_create();
  v7 = [(RPVideoEditorExtensionViewController *)self extensionContext];
  v8 = [v7 inputItems];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000E25C;
  v21[3] = &unk_1000187F8;
  v9 = v5;
  v22 = v9;
  v10 = v6;
  v23 = v10;
  v24 = buf;
  v25 = v38;
  v26 = v36;
  v27 = v34;
  v28 = v32;
  v29 = v30;
  [v8 enumerateObjectsUsingBlock:v21];

  v11 = [(RPVideoEditorExtensionViewController *)self replyQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E5F0;
  block[3] = &unk_100018820;
  id v14 = v4;
  v15 = v36;
  v16 = buf;
  v17 = v38;
  v18 = v34;
  v19 = v32;
  v20 = v30;
  id v12 = v4;
  dispatch_group_notify(v10, v11, block);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(buf, 8);
}

- (void)videoEditor:(id)a3 didFinishWithActivityTypes:(id)a4
{
  id v5 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPVideoEditorExtensionViewController -videoEditorViewDidFinishWithActivityTypes:", v8, 2u);
  }
  dispatch_group_t v6 = [(RPVideoEditorExtensionViewController *)self extensionContext];
  v7 = [v6 extensionObjectProxy];
  [v7 extensionDidFinishWithActivityTypes:v5];
}

- (void)doAction:(id)a3
{
  id v4 = (NSString *)a3;
  if ([(RPVideoEditorExtensionViewController *)self isInternalTestMode])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      dispatch_group_t v6 = "-[RPVideoEditorExtensionViewController doAction:]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
    }
    [(RPVideoEditorViewController *)self->_videoEditorViewController performSelector:NSSelectorFromString(v4)];
  }
}

- (RPVideoEditorViewController)videoEditorViewController
{
  return self->_videoEditorViewController;
}

- (void)setVideoEditorViewController:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSURL)movieURL
{
  return self->_movieURL;
}

- (void)setMovieURL:(id)a3
{
}

- (NSURL)fileAttachmentURL
{
  return self->_fileAttachmentURL;
}

- (void)setFileAttachmentURL:(id)a3
{
}

- (NSString)overrideShareMessage
{
  return self->_overrideShareMessage;
}

- (void)setOverrideShareMessage:(id)a3
{
}

- (UIColor)overrideTintColor
{
  return self->_overrideTintColor;
}

- (void)setOverrideTintColor:(id)a3
{
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
}

- (BOOL)isInternalTestMode
{
  return self->_isInternalTestMode;
}

- (void)setIsInternalTestMode:(BOOL)a3
{
  self->_isInternalTestMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_overrideTintColor, 0);
  objc_storeStrong((id *)&self->_overrideShareMessage, 0);
  objc_storeStrong((id *)&self->_fileAttachmentURL, 0);
  objc_storeStrong((id *)&self->_movieURL, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_videoEditorViewController, 0);
}

@end