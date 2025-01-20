@interface DedicatedCameraViewController
- (unint64_t)supportedInterfaceOrientations;
- (void)cancel;
- (void)proxCardFlowDidDismiss;
- (void)proxCardFlowWillPresent;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation DedicatedCameraViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DedicatedCameraViewController;
  [(DedicatedCameraViewController *)&v4 viewDidAppear:a3];
  sub_1000059B8((__CFString *)self);
}

- (unint64_t)supportedInterfaceOrientations
{
  return _PRXSupportedInterfaceOrientations(self, 0);
}

- (void)cancel
{
  self->_cancelled = 1;
  [(DedicatedCameraViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)proxCardFlowWillPresent
{
  id v2 = [(BaseViewController *)self viewServiceHost];
  [v2 setStatusBarHidden:1 withDuration:0.3];
}

- (void)proxCardFlowDidDismiss
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL confirmed = self->_confirmed;
    *(_DWORD *)buf = 67109120;
    BOOL v12 = confirmed;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Dedicated Camera prox card flow dismissed: %{BOOL}d", buf, 8u);
  }
  if (!self->_confirmed && !self->_cancelled)
  {
    objc_super v4 = [(BaseViewController *)self viewServicePresenter];
    uint64_t v5 = CPSErrorDomain;
    NSErrorUserInfoKey v9 = NSDebugDescriptionErrorKey;
    CFStringRef v10 = @"User dismissed prox card without authenticating.";
    v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v7 = +[NSError errorWithDomain:v5 code:104 userInfo:v6];
    [v4 deactivateWithError:v7];
  }
  v8 = [(BaseViewController *)self viewServiceHost];
  [v8 invalidate];
}

- (void).cxx_destruct
{
}

@end