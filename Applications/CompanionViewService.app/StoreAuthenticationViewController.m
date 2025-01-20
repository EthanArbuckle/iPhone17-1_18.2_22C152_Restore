@interface StoreAuthenticationViewController
- (unint64_t)supportedInterfaceOrientations;
- (void)cancel;
- (void)proxCardFlowDidDismiss;
- (void)proxCardFlowWillPresent;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation StoreAuthenticationViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)StoreAuthenticationViewController;
  [(StoreAuthenticationViewController *)&v4 viewDidAppear:a3];
  sub_100001878(self);
}

- (unint64_t)supportedInterfaceOrientations
{
  return _PRXSupportedInterfaceOrientations(self, 0);
}

- (void)cancel
{
  self->_cancelled = 1;
  [(StoreAuthenticationViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)proxCardFlowWillPresent
{
  id v2 = [(BaseViewController *)self viewServiceHost];
  [v2 setStatusBarHidden:1 withDuration:0.3];
}

- (void)proxCardFlowDidDismiss
{
  v3 = sub_100001C6C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL finished = self->_finished;
    BOOL cancelled = self->_cancelled;
    *(_DWORD *)buf = 67109376;
    BOOL v14 = finished;
    __int16 v15 = 1024;
    BOOL v16 = cancelled;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Store authentication prox card flow dismissed. {finished=%{BOOL}d, cancelled=%{BOOL}d", buf, 0xEu);
  }

  if (!self->_finished && !self->_cancelled)
  {
    v6 = [(BaseViewController *)self viewServicePresenter];
    uint64_t v7 = CPSErrorDomain;
    NSErrorUserInfoKey v11 = NSDebugDescriptionErrorKey;
    CFStringRef v12 = @"User dismissed prox card without authenticating.";
    v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v9 = +[NSError errorWithDomain:v7 code:104 userInfo:v8];
    [v6 deactivateWithError:v9];
  }
  v10 = [(BaseViewController *)self viewServiceHost];
  [v10 invalidate];
}

- (void).cxx_destruct
{
}

@end