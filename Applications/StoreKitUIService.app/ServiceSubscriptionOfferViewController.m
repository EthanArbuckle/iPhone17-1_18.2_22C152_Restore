@interface ServiceSubscriptionOfferViewController
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didDismissOfferSheet;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
@end

@implementation ServiceSubscriptionOfferViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Did receive request to display offer code sheet.", (uint8_t *)&buf, 0xCu);
  }
  v8 = [(ServiceSubscriptionOfferViewController *)self _remoteViewControllerProxy];
  [v8 setAllowsMenuButtonDismissal:1];
  [v8 setAllowsAlertStacking:1];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v9 = (void *)qword_1000673B0;
  uint64_t v20 = qword_1000673B0;
  if (!qword_1000673B0)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v22 = sub_100025430;
    v23 = &unk_10004D570;
    v24 = &v17;
    sub_100025430((uint64_t)&buf);
    v9 = (void *)v18[3];
  }
  v10 = v9;
  _Block_object_dispose(&v17, 8);
  id v11 = [v10 alloc];
  v12 = [v6 userInfo:v17];
  id v13 = [v11 initWithParameters:v12];

  [(ServiceSubscriptionOfferViewController *)self addChildViewController:v13];
  v14 = [v13 view];
  v15 = [(ServiceSubscriptionOfferViewController *)self view];
  [v15 bounds];
  [v14 setFrame:];

  v16 = [(ServiceSubscriptionOfferViewController *)self view];
  [v16 addSubview:v14];

  [v13 didMoveToParentViewController:self];
  [v13 setDelegate:self];
  if (v7) {
    v7[2](v7);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)didDismissOfferSheet
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000253A8;
  v4[3] = &unk_10004CD30;
  v4[4] = self;
  v3 = [(ServiceSubscriptionOfferViewController *)self _remoteViewControllerProxyWithErrorHandler:v4];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Offer sheet did dismiss.", buf, 0xCu);
  }
  [v3 deactivate];
}

@end