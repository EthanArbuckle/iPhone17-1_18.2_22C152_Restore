@interface ServiceComposeReviewViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)composeReviewViewController:(id)a3 shouldSubmitReview:(id)a4;
- (void)_dismissWithError:(id)a3;
- (void)_presentAlertForDialog:(id)a3;
- (void)_willAppearInRemoteViewController;
- (void)alertController:(id)a3 alertDidFinishWithButton:(id)a4;
- (void)clientKeyboardFrameChanged:(CGRect)a3;
- (void)composeReviewViewController:(id)a3 didFailWithDialog:(id)a4;
- (void)composeReviewViewController:(id)a3 presentDialog:(id)a4;
- (void)composeReviewViewControllerDidCancel:(id)a3;
- (void)composeReviewViewControllerDidSubmit:(id)a3;
- (void)dealloc;
- (void)finishStarRatingPromptWithRating:(id)a3;
- (void)loadReviewWithURL:(id)a3;
- (void)loadView;
@end

@implementation ServiceComposeReviewViewController

- (void)dealloc
{
  [(ServiceAlertController *)self->_alertController setDelegate:0];
  [(SKUIComposeReviewViewController *)self->_underlyingViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)ServiceComposeReviewViewController;
  [(ServiceComposeReviewViewController *)&v3 dealloc];
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKUIServiceComposeReviewViewController];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKUIClientComposeReviewViewController];
}

- (void)loadView
{
  id v8 = objc_alloc_init((Class)UIView);
  underlyingViewController = self->_underlyingViewController;
  if (!underlyingViewController)
  {
    v4 = (SKUIComposeReviewViewController *)objc_alloc_init((Class)SKUIComposeReviewViewController);
    v5 = self->_underlyingViewController;
    self->_underlyingViewController = v4;

    [(SKUIComposeReviewViewController *)self->_underlyingViewController setDelegate:self];
    id v6 = objc_alloc_init((Class)SUClientInterface);
    [(SKUIComposeReviewViewController *)self->_underlyingViewController setClientInterface:v6];
    [(ServiceComposeReviewViewController *)self addChildViewController:self->_underlyingViewController];

    underlyingViewController = self->_underlyingViewController;
  }
  v7 = [(SKUIComposeReviewViewController *)underlyingViewController view];
  [v7 setAutoresizingMask:18];
  [v8 bounds];
  [v7 setFrame:];
  [v8 addSubview:v7];
  [(ServiceComposeReviewViewController *)self setView:v8];
}

- (void)_willAppearInRemoteViewController
{
  long long v9 = 0u;
  long long v10 = 0u;
  [(ServiceComposeReviewViewController *)self _hostAuditToken];
  long long v7 = v9;
  long long v8 = v10;
  if (sub_100010BA0(&v7, @"com.apple.ios.StoreKit.compose-review")
    || (v7 = v9, long long v8 = v10, sub_100010BA0(&v7, kSSITunesStorePrivateEntitlement)))
  {
    objc_super v3 = 0;
    uint64_t v4 = 1;
  }
  else
  {
    objc_super v3 = SSError();
    uint64_t v4 = 0;
  }
  v5 = [(ServiceComposeReviewViewController *)self _clientViewControllerProxy];
  id v6 = +[NSNumber numberWithBool:v4];
  [v5 didPrepareWithResult:v6 error:v3];
}

- (void)alertController:(id)a3 alertDidFinishWithButton:(id)a4
{
  if (self->_dismissAfterDialog)
  {
    self->_dismissAfterDialog = 0;
    -[ServiceComposeReviewViewController _dismissWithError:](self, "_dismissWithError:", 0, a4);
  }
}

- (void)composeReviewViewController:(id)a3 didFailWithDialog:(id)a4
{
  if (a4)
  {
    self->_dismissAfterDialog = 1;
    [(ServiceComposeReviewViewController *)self _presentAlertForDialog:a4];
  }
  else
  {
    [(ServiceComposeReviewViewController *)self _dismissWithError:0];
  }
}

- (void)composeReviewViewController:(id)a3 presentDialog:(id)a4
{
}

- (BOOL)composeReviewViewController:(id)a3 shouldSubmitReview:(id)a4
{
  [a4 rating:a3];
  float v6 = v5;
  if (v5 < 0.00000011921)
  {
    long long v7 = [(ServiceComposeReviewViewController *)self _clientViewControllerProxy];
    [v7 promptForStarRating];
  }
  return v6 >= 0.00000011921;
}

- (void)composeReviewViewControllerDidCancel:(id)a3
{
}

- (void)composeReviewViewControllerDidSubmit:(id)a3
{
  id v4 = [(ServiceComposeReviewViewController *)self _clientViewControllerProxy];
  objc_super v3 = +[NSNumber numberWithBool:1];
  [v4 didFinishWithResult:v3 error:0];
}

- (void)finishStarRatingPromptWithRating:(id)a3
{
  if (a3)
  {
    underlyingViewController = self->_underlyingViewController;
    [a3 floatValue];
    -[SKUIComposeReviewViewController setRating:](underlyingViewController, "setRating:");
    float v5 = self->_underlyingViewController;
    [(SKUIComposeReviewViewController *)v5 submitReview];
  }
}

- (void)loadReviewWithURL:(id)a3
{
  id v4 = a3;
  float v5 = +[SSWeakReference weakReferenceWithObject:self];
  underlyingViewController = self->_underlyingViewController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100026A58;
  v8[3] = &unk_10004DBE0;
  id v9 = v5;
  id v7 = v5;
  [(SKUIComposeReviewViewController *)underlyingViewController loadReviewWithURL:v4 completionBlock:v8];
}

- (void)clientKeyboardFrameChanged:(CGRect)a3
{
  objc_super v3 = +[NSValue valueWithRect:](NSValue, "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    uint64_t v5 = SKUIRemoteKeyboardFrameChangedNotification;
    uint64_t v7 = SKUIRemoteKeyboardFrameKey;
    long long v8 = v3;
    float v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    [v4 postNotificationName:v5 object:0 userInfo:v6];
  }
}

- (void)_dismissWithError:(id)a3
{
  id v4 = a3;
  id v6 = [(ServiceComposeReviewViewController *)self _clientViewControllerProxy];
  uint64_t v5 = +[NSNumber numberWithBool:0];
  [v6 didFinishWithResult:v5 error:v4];
}

- (void)_presentAlertForDialog:(id)a3
{
  id v4 = a3;
  alertController = self->_alertController;
  id v10 = v4;
  if (!alertController)
  {
    id v6 = [ServiceAlertController alloc];
    uint64_t v7 = [(ServiceComposeReviewViewController *)self _clientViewControllerProxy];
    long long v8 = [(ServiceAlertController *)v6 initWithRemoteViewControllerProxy:v7];
    id v9 = self->_alertController;
    self->_alertController = v8;

    [(ServiceAlertController *)self->_alertController setDelegate:self];
    id v4 = v10;
    alertController = self->_alertController;
  }
  [(ServiceAlertController *)alertController presentAlertForDialog:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingViewController, 0);

  objc_storeStrong((id *)&self->_alertController, 0);
}

@end