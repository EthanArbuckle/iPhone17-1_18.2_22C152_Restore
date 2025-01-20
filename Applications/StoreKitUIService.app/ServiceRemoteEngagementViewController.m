@interface ServiceRemoteEngagementViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)_dismissPresentedViewController;
- (void)presentEngagementRequestData:(id)a3 clientBundleID:(id)a4 completion:(id)a5;
- (void)setPreferredContentSize:(CGSize)a3;
@end

@implementation ServiceRemoteEngagementViewController

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKEngagementViewServiceProtocol];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKEngagementPresenterProtocol];
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)ServiceRemoteEngagementViewController;
  -[ServiceRemoteEngagementViewController setPreferredContentSize:](&v8, "setPreferredContentSize:");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025D24;
  v7[3] = &unk_10004CD30;
  v7[4] = self;
  v6 = [(ServiceRemoteEngagementViewController *)self _clientViewControllerProxyWithErrorHandler:v7];
  [v6 preferredContentSizeDidChange:width, height];
}

- (void)presentEngagementRequestData:(id)a3 clientBundleID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void))a5;
  id v10 = a3;
  [(ServiceRemoteEngagementViewController *)self _dismissPresentedViewController];
  id v36 = 0;
  v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v36];

  id v12 = v36;
  if (!v12)
  {
    v13 = [v11 URL];
    uint64_t v14 = [v13 port];
    v15 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
    if (v14)
    {
      v16 = (void *)v14;
      v17 = [v11 URL];
      v18 = [v17 host];
      if ([v18 isEqualToString:@"localhost"])
      {
        [v11 URL];
        v19 = id v33 = v8;
        v20 = [v19 scheme];
        HIDWORD(v32) = [v20 isEqualToString:@"http"];

        v15 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
        id v8 = v33;

        if (HIDWORD(v32))
        {
          v21 = +[SSLogConfig sharedConfig];
          unsigned int v22 = [v21 shouldLog];
          if ([v21 shouldLogToDisk]) {
            int v23 = v22 | 2;
          }
          else {
            int v23 = v22;
          }
          v24 = [v21 OSLogObject];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            int v25 = v23;
          }
          else {
            int v25 = v23 & 2;
          }
          if (v25)
          {
            __int16 v35 = 0;
            LODWORD(v32) = 2;
            v26 = (void *)_os_log_send_and_compose_impl();

            v15 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
            if (!v26)
            {
LABEL_22:

              uint64_t v27 = +[SKUIOctaneBag shared];
              goto LABEL_18;
            }
            v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v35, v32);
            free(v26);
            SSFileLog();
          }
          else
          {
            v15 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
          }

          goto LABEL_22;
        }
LABEL_17:
        uint64_t v27 = [v15[219] createBagForSubProfile];
LABEL_18:
        v28 = (void *)v27;
        id v29 = [objc_alloc((Class)v15[219]) initWithRequest:v11 bag:v27 presentingViewController:self];
        id v30 = [objc_alloc((Class)AMSProcessInfo) initWithBundleIdentifier:v8];
        [v29 setClientInfo:v30];

        v31 = [v29 presentEngagement];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_100026210;
        v34[3] = &unk_10004DBB8;
        v34[4] = self;
        [v31 addFinishBlock:v34];

        v9[2](v9, 0);
        goto LABEL_19;
      }
    }
    goto LABEL_17;
  }
  ((void (**)(id, id))v9)[2](v9, v12);
LABEL_19:
}

- (void)_dismissPresentedViewController
{
  v2 = [(ServiceRemoteEngagementViewController *)self childViewControllers];
  id v4 = [v2 firstObject];

  v3 = [v4 view];
  [v3 removeFromSuperview];

  [v4 removeFromParentViewController];
}

@end