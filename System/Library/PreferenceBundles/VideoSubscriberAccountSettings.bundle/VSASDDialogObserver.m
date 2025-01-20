@interface VSASDDialogObserver
- (UIViewController)presenterViewController;
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)setPresenterViewController:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation VSASDDialogObserver

- (void)startListening
{
  id v3 = +[ASDNotificationCenter defaultCenter];
  [v3 setDialogObserver:self];
}

- (void)stopListening
{
  id v2 = +[ASDNotificationCenter defaultCenter];
  [v2 setDialogObserver:0];
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  id v8 = v6;
  id v9 = v7;
  VSPerformBlockOnMainThread();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  id v8 = v6;
  id v9 = v7;
  VSPerformBlockOnMainThread();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (UIViewController)presenterViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresenterViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end