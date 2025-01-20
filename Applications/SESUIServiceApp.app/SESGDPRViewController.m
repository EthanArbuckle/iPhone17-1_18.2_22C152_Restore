@interface SESGDPRViewController
- (void)dismiss;
- (void)presentGDPR;
- (void)setDismissHandler:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SESGDPRViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SESGDPRViewController;
  [(SESGDPRViewController *)&v4 viewDidLoad];
  v2 = SESDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "angelViewController:viewDidLoad:", v3, 2u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SESGDPRViewController;
  [(SESGDPRViewController *)&v3 viewWillDisappear:a3];
}

- (void)setDismissHandler:(id)a3
{
  if (!self->_dismissed)
  {
    self->_dismissHandler = objc_retainBlock(a3);
    _objc_release_x1();
  }
}

- (void)presentGDPR
{
  objc_super v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.opennfcplatform"];
  objc_super v4 = v3;
  if (v3)
  {
    [v3 setPresentingViewController:self];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000010C8;
    v7[3] = &unk_100004178;
    v7[4] = self;
    [v4 setDismissHandler:v7];
    v5 = SESDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Presenting GDPR sheet", v6, 2u);
    }

    [v4 present];
  }
  else
  {
    [(SESGDPRViewController *)self dismiss];
  }
}

- (void)dismiss
{
  if (!self->_dismissed)
  {
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100001220;
    v3[3] = &unk_1000041A0;
    objc_copyWeak(&v4, &location);
    [(SESGDPRViewController *)self dismissViewControllerAnimated:1 completion:v3];
    self->_dismissed = 1;
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void).cxx_destruct
{
}

@end