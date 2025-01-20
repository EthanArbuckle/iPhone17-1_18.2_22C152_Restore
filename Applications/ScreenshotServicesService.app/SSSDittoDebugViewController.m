@interface SSSDittoDebugViewController
+ (void)prepareForDebugging;
- (SSSDittoRootViewController)rootViewController;
- (SSSViewControllerManager)viewControllerManager;
- (void)_addScreenshotWithPDF:(id)a3 visibleRect:(CGRect)a4;
- (void)_addScreenshots;
- (void)createDittoRootViewControllerIfNecessary;
- (void)dittoDebugView:(id)a3 requestsPresentationOfViewController:(id)a4;
- (void)dittoRootViewController:(id)a3 wantsBackground:(BOOL)a4 duration:(double)a5;
- (void)dittoRootViewController:(id)a3 willShowShowSharingUIWithBlock:(id)a4;
- (void)dittoRootViewController:(id)a3 willShowTestFlightUIWithBlock:(id)a4;
- (void)dittoRootViewController:(id)a3 willTransitionToState:(unint64_t)a4 changeBlock:(id)a5;
- (void)dittoRootViewControllerDidDismiss:(id)a3;
- (void)loadView;
- (void)removeDittoRootViewController;
- (void)setViewControllerManager:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SSSDittoDebugViewController

+ (void)prepareForDebugging
{
  id v3 = +[SSScreenshotAssetManager sharedAssetManager];
  v2 = objc_opt_new();
  [v3 setBackend:v2];
}

- (void)dittoRootViewController:(id)a3 willTransitionToState:(unint64_t)a4 changeBlock:(id)a5
{
}

- (void)dittoRootViewController:(id)a3 willShowShowSharingUIWithBlock:(id)a4
{
}

- (void)dittoRootViewController:(id)a3 willShowTestFlightUIWithBlock:(id)a4
{
}

- (void)dittoRootViewController:(id)a3 wantsBackground:(BOOL)a4 duration:(double)a5
{
  if (a4)
  {
    v7 = +[UIBlurEffect effectWithStyle:2];
  }
  else
  {
    v7 = 0;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014B9C;
  v9[3] = &unk_100099C98;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  +[UIView animateWithDuration:v9 animations:a5];
}

- (void)dittoRootViewControllerDidDismiss:(id)a3
{
}

- (SSSDittoRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)createDittoRootViewControllerIfNecessary
{
  if (!self->_rootViewController)
  {
    id v3 = objc_alloc_init(SSSDittoRootViewController);
    rootViewController = self->_rootViewController;
    self->_rootViewController = v3;

    [(SSSDittoRootViewController *)self->_rootViewController setDelegate:self];
    [(SSSDittoDebugViewController *)self addChildViewController:self->_rootViewController];
    v5 = [(SSSDittoDebugViewController *)self view];
    v6 = [(SSSDittoRootViewController *)self->_rootViewController view];
    [v5 addSubview:v6];

    [(SSSDittoRootViewController *)self->_rootViewController didMoveToParentViewController:self];
    v7 = [(SSSDittoRootViewController *)self->_rootViewController view];
    id v8 = [(SSSDittoDebugViewController *)self view];
    [v8 bounds];
    [v7 setFrame:];

    id v9 = [(SSSDittoRootViewController *)self->_rootViewController view];
    [v9 setHidden:1];
  }
}

- (void)removeDittoRootViewController
{
  [(SSSDittoRootViewController *)self->_rootViewController setDelegate:0];
  [(SSSDittoRootViewController *)self->_rootViewController willMoveToParentViewController:0];
  [(SSSDittoRootViewController *)self->_rootViewController removeFromParentViewController];
  id v3 = [(SSSDittoRootViewController *)self->_rootViewController view];
  [v3 removeFromSuperview];

  rootViewController = self->_rootViewController;
  self->_rootViewController = 0;
}

- (void)_addScreenshotWithPDF:(id)a3 visibleRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)SSEnvironmentDescription);
  [v10 setPresentationMode:0];
  v11 = +[UIScreen mainScreen];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;

  v16 = +[UIScreen mainScreen];
  [v16 scale];
  double v18 = v17;

  [v10 setImagePixelSize:v13 * v18, v15 * v18];
  [v10 setImageScale:v18];
  if (v9)
  {
    id v19 = objc_alloc_init((Class)SSHarvestedApplicationMetadata);
    [v19 setCanGenerateDocument:1];
    id v20 = objc_alloc_init((Class)SSHarvestedApplicationDocument);
    [v20 setPDFData:v9];
    [v20 setPDFPage:0];
    [v20 setPDFVisibleRect:x, y, width, height];
    v21 = objc_alloc_init(SSDebugEnvironmentElement);
    [(SSDebugEnvironmentElement *)v21 setMetadata:v19];
    [(SSDebugEnvironmentElement *)v21 setDocument:v20];
    v31 = v21;
    v22 = +[NSArray arrayWithObjects:&v31 count:1];
    [v10 setDebugElements:v22];
  }
  v23 = +[SSSScreenshotManager sharedScreenshotManager];
  v24 = [v23 createScreenshotWithEnvironmentDescription:v10];

  v25 = [(SSSDittoDebugViewController *)self view];
  v26 = [v25 window];

  v32.double width = v13;
  v32.double height = v15;
  UIGraphicsBeginImageContextWithOptions(v32, 1, v18);
  [v26 bounds];
  [v26 drawViewHierarchyInRect:1];
  v27 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [v24 setBackingImage:v27];
  [(SSSDittoRootViewController *)self->_rootViewController screenshotReceived:v24 completion:&stru_100099D98];
  id v28 = objc_alloc_init((Class)SSImageIdentifierUpdate);
  [v28 setImageIdentifier:@"test"];
  v29 = [v10 identifier];
  [v28 setEnvironmentDescriptionIdentifier:v29];

  [v28 setSuccess:1];
  [v24 _harvestPDFIfNecessary];
  v30 = +[SSSScreenshotManager sharedScreenshotManager];
  [v30 processImageIdentifierUpdate:v28];
}

- (void)dittoDebugView:(id)a3 requestsPresentationOfViewController:(id)a4
{
}

- (void)_addScreenshots
{
  [(SSSDittoDebugViewController *)self createDittoRootViewControllerIfNecessary];
  id v3 = [(SSSDittoRootViewController *)self->_rootViewController view];
  [v3 setHidden:0];

  v4 = [(SSSDittoDebugViewController *)self debugView];
  uint64_t v5 = (uint64_t)[v4 numberOfScreenshotsToAdd];

  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v16 = size;
  v7 = [(SSSDittoDebugViewController *)self debugView];
  unsigned int v8 = [v7 shouldIncludePDF];

  if (v8)
  {
    id v9 = [(SSSDittoDebugViewController *)self debugView];
    id v10 = [v9 generatePDF:&origin];
  }
  else
  {
    id v10 = 0;
  }
  -[SSSDittoDebugViewController _addScreenshotWithPDF:visibleRect:](self, "_addScreenshotWithPDF:visibleRect:", v10, origin, v16);
  if (v5 >= 2)
  {
    v11 = [(SSSDittoDebugViewController *)self debugView];
    [v11 advanceScrollOffset];

    uint64_t v12 = 0;
    do
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10001523C;
      v14[3] = &unk_100099DC0;
      v14[4] = self;
      v14[5] = v12;
      v14[6] = v5;
      id v13 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v14 block:(double)v12++ + 1.0];
    }
    while (v5 - 1 != v12);
  }
}

- (void)loadView
{
  id v3 = objc_opt_new();
  [(SSSDittoDebugViewController *)self setView:v3];

  id v4 = [(SSSDittoDebugViewController *)self debugView];
  [v4 setDelegate:self];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SSSDittoDebugViewController;
  [(SSSDittoDebugViewController *)&v8 viewDidLoad];
  id v3 = (UIVisualEffectView *)objc_alloc_init((Class)UIVisualEffectView);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  [(UIVisualEffectView *)self->_backgroundView setUserInteractionEnabled:0];
  uint64_t v5 = [(SSSDittoDebugViewController *)self view];
  [v5 addSubview:self->_backgroundView];

  v6 = [(SSSDittoDebugViewController *)self debugView];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015438;
  v7[3] = &unk_100099A20;
  v7[4] = self;
  [v6 setBlockToRunForAddScreenshotsButton:v7];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SSSDittoDebugViewController;
  [(SSSDittoDebugViewController *)&v5 viewWillLayoutSubviews];
  backgroundView = self->_backgroundView;
  id v4 = [(SSSDittoDebugViewController *)self view];
  [v4 bounds];
  -[UIVisualEffectView setFrame:](backgroundView, "setFrame:");
}

- (SSSViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->viewControllerManager);

  return (SSSViewControllerManager *)WeakRetained;
}

- (void)setViewControllerManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->viewControllerManager);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end