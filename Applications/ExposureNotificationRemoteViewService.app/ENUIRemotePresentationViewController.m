@interface ENUIRemotePresentationViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (ENManager)manager;
- (ENRemotePresentationRequest)presentationRequest;
- (ENUIHostViewControllerProtocol)_hostViewController;
- (ENUIRemotePresentationViewController)init;
- (OS_dispatch_group)activationGroup;
- (id)_viewControllerToShowForPresentationRequest:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_handleKeyReleaseDecision:(BOOL)a3 completion:(id)a4;
- (void)_handleOnboardingResult:(int64_t)a3 completion:(id)a4;
- (void)_handlePreApprovalDecision:(BOOL)a3 completion:(id)a4;
- (void)_performAfterActivation:(id)a3;
- (void)dealloc;
- (void)setActivationGroup:(id)a3;
- (void)setManager:(id)a3;
- (void)setPresentationRequest:(id)a3;
- (void)show;
- (void)viewDidLoad;
@end

@implementation ENUIRemotePresentationViewController

- (ENUIRemotePresentationViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)ENUIRemotePresentationViewController;
  id v2 = [(ENUIRemotePresentationViewController *)&v11 initWithNibName:0 bundle:0];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)ENManager);
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    [*((id *)v2 + 3) setDispatchQueue:&_dispatch_main_q];
    dispatch_group_t v5 = dispatch_group_create();
    v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 4));
    v7 = (void *)*((void *)v2 + 3);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100001E3C;
    v9[3] = &unk_100004178;
    id v10 = v2;
    [v7 activateWithCompletionHandler:v9];
  }
  return (ENUIRemotePresentationViewController *)v2;
}

- (void)dealloc
{
  [(ENManager *)self->_manager invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ENUIRemotePresentationViewController;
  [(ENUIRemotePresentationViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ENUIRemotePresentationViewController;
  [(ENUIRemotePresentationViewController *)&v3 viewDidLoad];
  if (self->_showAtViewLoad) {
    [(ENUIRemotePresentationViewController *)self show];
  }
}

- (void)setPresentationRequest:(id)a3
{
  p_presentationRequest = &self->_presentationRequest;
  objc_storeStrong((id *)&self->_presentationRequest, a3);
  if (*p_presentationRequest)
  {
    [(ENUIRemotePresentationViewController *)self show];
  }
}

- (void)show
{
  if (([(ENUIRemotePresentationViewController *)self isViewLoaded] & 1) == 0)
  {
    uint64_t v4 = 8;
LABEL_8:
    *((unsigned char *)&self->super.super.super.isa + v4) = 1;
    return;
  }
  if (!self->_presentationRequest)
  {
    uint64_t v4 = 9;
    goto LABEL_8;
  }
  self->_showAtViewLoad = 0;
  self->_showAfterPresentationRequest = 0;
  objc_super v3 = [(ENUIRemotePresentationViewController *)self _viewControllerToShowForPresentationRequest:self->_presentationRequest];
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100002080;
    v5[3] = &unk_1000041A0;
    v5[4] = self;
    [(ENUIRemotePresentationViewController *)self presentViewController:v3 animated:1 completion:v5];
  }
}

- (ENUIHostViewControllerProtocol)_hostViewController
{
  return (ENUIHostViewControllerProtocol *)[(ENUIRemotePresentationViewController *)self _remoteViewControllerProxy];
}

+ (id)_remoteViewControllerInterface
{
  return (id)_ENUIHostViewControllerInterface(a1, a2);
}

+ (id)_exportedInterface
{
  return (id)_ENUIRemoteViewControllerInterface(a1, a2);
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = [(ENUIRemotePresentationViewController *)self _hostViewController];
  [v5 didFinishWithError:v4];
}

- (id)_viewControllerToShowForPresentationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 == (id)3)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v12 = +[ENUIViewControllerFactory sharedInstance];
    v13 = [v4 appBundleIdentifier];
    v14 = [v4 agencyRegion];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000027BC;
    v19[3] = &unk_1000041F0;
    v15 = &v20;
    objc_copyWeak(&v20, &location);
    uint64_t v16 = [v12 createPreApprovalDialogueWithBundleIdentifier:v13 region:v14 completion:v19];
LABEL_8:
    objc_super v11 = (void *)v16;

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  if (v5 == (id)2)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v12 = +[ENUIViewControllerFactory sharedInstance];
    v13 = [v4 appBundleIdentifier];
    v14 = [v4 agencyRegion];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100002688;
    v21[3] = &unk_1000041F0;
    v15 = &v22;
    objc_copyWeak(&v22, &location);
    uint64_t v16 = [v12 createKeyReleaseDialogueWithBundleIdentifier:v13 region:v14 completion:v21];
    goto LABEL_8;
  }
  if (v5 == (id)1)
  {
    v6 = [v4 agencyRegion];
    v7 = [v6 regionCode];
    v8 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel regionForRegionCode:v7];

    if (v8)
    {
      id location = 0;
      objc_initWeak(&location, self);
      v9 = +[ENUIViewControllerFactory sharedInstance];
      id v10 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100002554;
      v23[3] = &unk_1000041C8;
      objc_copyWeak(&v24, &location);
      objc_super v11 = [v9 createOnboardingStackForAgencyModel:v8 exposureManager:v10 fromAvailabilityAlert:0 fromDeepLink:0 subsequentFlow:0 completion:v23];

      [v11 setModalPresentationStyle:0];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    else
    {
      v17 = ENUILogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100002E7C(v17);
      }

      objc_super v11 = 0;
    }
  }
  else
  {
    objc_super v11 = 0;
  }
LABEL_14:

  return v11;
}

- (void)_performAfterActivation:(id)a3
{
}

- (void)_handleOnboardingResult:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(ENUIRemotePresentationViewController *)self presentationRequest];
  [v7 onboardingRequestCompletedWithDecision:a3 != 0];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000029CC;
  v9[3] = &unk_100004240;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(ENUIRemotePresentationViewController *)self _performAfterActivation:v9];
}

- (void)_handleKeyReleaseDecision:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(ENUIRemotePresentationViewController *)self presentationRequest];
  [v7 keyReleaseRequestCompletedWithDecision:v4];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002B5C;
  v9[3] = &unk_100004240;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(ENUIRemotePresentationViewController *)self _performAfterActivation:v9];
}

- (void)_handlePreApprovalDecision:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(ENUIRemotePresentationViewController *)self presentationRequest];
  [v7 preApprovalRequestCompletedWithDecision:v4];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002CEC;
  v9[3] = &unk_100004240;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(ENUIRemotePresentationViewController *)self _performAfterActivation:v9];
}

- (ENRemotePresentationRequest)presentationRequest
{
  return self->_presentationRequest;
}

- (ENManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (OS_dispatch_group)activationGroup
{
  return self->_activationGroup;
}

- (void)setActivationGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationGroup, 0);
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_presentationRequest, 0);
}

@end