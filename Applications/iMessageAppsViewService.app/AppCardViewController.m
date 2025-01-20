@interface AppCardViewController
+ (BOOL)nextPresentationIsFullscreenModal;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (void)setNextPresentationIsFullscreenModal:(BOOL)a3;
- (AppCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (IMAAppPresenter)appPresenter;
- (double)compactHeight;
- (void)addSticker:(id)a3;
- (void)addSticker:(id)a3 atDropTarget:(id)a4;
- (void)animateCardHiddenWithCompletion:(id)a3;
- (void)appPresenterDidDismissFullscreenModal:(id)a3;
- (void)didDragStickerToTarget:(id)a3 outsideSwitcher:(BOOL)a4;
- (void)didSelectAppWithBundleIdentifier:(id)a3;
- (void)dismiss;
- (void)overrideDropPointWithCompletion:(id)a3;
- (void)requestPasteSticker:(id)a3;
- (void)setAppPresenter:(id)a3;
- (void)updateCompactCardHeight:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AppCardViewController

+ (BOOL)nextPresentationIsFullscreenModal
{
  return byte_1000167A0;
}

+ (void)setNextPresentationIsFullscreenModal:(BOOL)a3
{
  byte_1000167A0 = a3;
}

- (AppCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AppCardViewController;
  v4 = [(AppCardViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v6 = [v5 BOOLForKey:@"LoadAlliMessageApps"];

    if ((v6 & 1) == 0) {
      +[IMAAppPresenter disableAutomaticAppDiscovery];
    }
  }
  return v4;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)AppCardViewController;
  [(AppCardViewController *)&v6 viewDidLoad];
  v3 = IMBalloonExtensionIDWithSuffix();
  +[IMAAppPresenter loadAppWithIdentifierIfNeeded:v3];

  v4 = (IMAAppPresenter *)objc_alloc_init((Class)IMAAppPresenter);
  appPresenter = self->_appPresenter;
  self->_appPresenter = v4;

  [(IMAAppPresenter *)self->_appPresenter setDelegate:self];
  [(AppCardViewController *)self compactHeight];
  -[IMAAppPresenter setCompactHeight:](self->_appPresenter, "setCompactHeight:");
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AppCardViewController;
  [(AppCardViewController *)&v6 viewDidAppear:a3];
  v4 = IMBalloonExtensionIDWithSuffix();
  appPresenter = self->_appPresenter;
  if (byte_1000167A0)
  {
    [(IMAAppPresenter *)appPresenter presentFullScreenModalAppWithBundleIdentifier:v4 completion:0];
    self->_isPresentingStandaloneFullscreenModal = 1;
    byte_1000167A0 = 0;
  }
  else
  {
    [(IMAAppPresenter *)appPresenter presentAppWithBundleIdentifier:v4 completion:0];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AppCardViewController;
  id v7 = a4;
  -[AppCardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000944C;
  v8[3] = &unk_100010618;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)dismiss
{
  self->_isPresentingStandaloneFullscreenModal = 0;
  id v2 = [(AppCardViewController *)self _remoteViewControllerProxy];
  [v2 dismissCard];
}

- (double)compactHeight
{
  double result = self->_compactHeight;
  if (result <= 0.0) {
    return 335.0;
  }
  return result;
}

- (void)requestPasteSticker:(id)a3
{
  id v4 = a3;
  v5 = [v4 fileURL];
  objc_super v6 = [v5 path];
  id v7 = +[NSFileHandle fileHandleForReadingAtPath:v6];

  objc_super v8 = [(AppCardViewController *)self _remoteViewControllerProxy];
  [v8 pasteImageAtFileHandle:v7];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  objc_super v9 = (void *)qword_1000167C8;
  uint64_t v16 = qword_1000167C8;
  if (!qword_1000167C8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100009B08;
    v12[3] = &unk_100010560;
    v12[4] = &v13;
    sub_100009B08((uint64_t)v12);
    objc_super v9 = (void *)v14[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);
  if (objc_opt_respondsToSelector())
  {
    v11 = [(AppCardViewController *)self _hostApplicationBundleIdentifier];
    [v10 trackStickerSentFromHostBundleIdentifier:v11];
  }
}

- (void)updateCompactCardHeight:(double)a3
{
  if (self->_compactHeight != a3)
  {
    id v5 = [(AppCardViewController *)self appPresenter];
    [v5 setCompactHeight:a3];
    if (self->_compactHeight < a3) {
      [v5 updateAppFrameForRotation];
    }
    self->_compactHeight = a3;
  }
}

- (void)animateCardHiddenWithCompletion:(id)a3
{
}

- (void)addSticker:(id)a3
{
}

- (void)addSticker:(id)a3 atDropTarget:(id)a4
{
}

- (void)didSelectAppWithBundleIdentifier:(id)a3
{
  if (a3) {
    [(ImmediatePanGestureRecognizer *)self->_dismissalGestureTracker setEnabled:1];
  }
  else {
    [(AppCardViewController *)self dismiss];
  }
}

- (void)didDragStickerToTarget:(id)a3 outsideSwitcher:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v8 = v6;
    id v7 = [(AppCardViewController *)self _remoteViewControllerProxy];
    if (objc_opt_respondsToSelector())
    {
      [v8 screenCoordinate];
      [v7 draggedStickerToPoint:];
    }

    id v6 = v8;
  }
}

- (void)overrideDropPointWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(void, double, double))a3;
  id v5 = [(AppCardViewController *)self _remoteViewControllerProxy];
  if (objc_opt_respondsToSelector())
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000098B4;
    v6[3] = &unk_1000107A0;
    id v7 = v4;
    [v5 requestInsertionPointCompletion:v6];
  }
  else
  {
    v4[2](v4, CGPointZero.x, CGPointZero.y);
  }
}

- (void)appPresenterDidDismissFullscreenModal:(id)a3
{
  if (self->_isPresentingStandaloneFullscreenModal) {
    [(AppCardViewController *)self dismiss];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

+ (id)_remoteViewControllerInterface
{
  if (qword_1000167B0 != -1) {
    dispatch_once(&qword_1000167B0, &stru_1000107C0);
  }
  id v2 = (void *)qword_1000167A8;

  return v2;
}

+ (id)_exportedInterface
{
  if (qword_1000167C0 != -1) {
    dispatch_once(&qword_1000167C0, &stru_1000107E0);
  }
  id v2 = (void *)qword_1000167B8;

  return v2;
}

- (IMAAppPresenter)appPresenter
{
  return self->_appPresenter;
}

- (void)setAppPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPresenter, 0);
  objc_storeStrong((id *)&self->_dismissalView, 0);

  objc_storeStrong((id *)&self->_dismissalGestureTracker, 0);
}

@end