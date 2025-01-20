@interface ServiceReviewViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (SKUIConfigurationPreloader)configurationPreloader;
- (SKUIReviewInAppController)reviewInAppController;
- (id)_iconForApplication:(id)a3;
- (id)_inAppConfigurationWithItemID:(id)a3 title:(id)a4 icon:(id)a5 sandboxed:(BOOL)a6 clientContext:(id)a7;
- (void)_buildReviewInAppConfigurationWithParameters:(id)a3 clientContext:(id)a4 completionHandler:(id)a5;
- (void)_loadDidFailWithError:(id)a3;
- (void)finishImmediately:(id)a3;
- (void)setConfigurationPreloader:(id)a3;
- (void)setReviewInAppController:(id)a3;
- (void)setupWithParameters:(id)a3;
@end

@implementation ServiceReviewViewController

- (SKUIConfigurationPreloader)configurationPreloader
{
  configurationPreloader = self->_configurationPreloader;
  if (!configurationPreloader)
  {
    v4 = (SKUIConfigurationPreloader *)objc_alloc_init((Class)SKUIConfigurationPreloader);
    v5 = self->_configurationPreloader;
    self->_configurationPreloader = v4;

    configurationPreloader = self->_configurationPreloader;
  }

  return configurationPreloader;
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKUIServiceReviewViewController];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKUIClientReviewViewController];
}

- (void)setupWithParameters:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_10000BE64;
  v11 = &unk_10004D248;
  objc_copyWeak(&v14, &location);
  id v5 = v4;
  id v12 = v5;
  v13 = self;
  v6 = objc_retainBlock(&v8);
  v7 = [(ServiceReviewViewController *)self configurationPreloader];
  [v7 preloadConfigurationForPurpose:1 withCompletionBlock:v6];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)finishImmediately:(id)a3
{
  id v4 = a3;
  id v5 = [(ServiceReviewViewController *)self presentedViewController];

  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000C6E4;
    v6[3] = &unk_10004CEB0;
    v6[4] = self;
    -[ServiceReviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", [v4 BOOLValue], v6);
  }
}

- (void)_buildReviewInAppConfigurationWithParameters:(id)a3 clientContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  v11 = [(ServiceReviewViewController *)self _hostApplicationBundleIdentifier];
  if (!v11)
  {
    id v12 = [v8 objectForKeyedSubscript:@"bundleID"];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = +[NSNull null];
    }
    v11 = v14;

    v15 = +[NSNull null];

    if (v11 == v15)
    {
      v30 = +[SSLogConfig sharedConfig];
      unsigned int v31 = [v30 shouldLog];
      if ([v30 shouldLogToDisk]) {
        int v32 = v31 | 2;
      }
      else {
        int v32 = v31;
      }
      v33 = [v30 OSLogObject];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        int v34 = v32;
      }
      else {
        int v34 = v32 & 2;
      }
      if (v34)
      {
        int v49 = 138412290;
        id v50 = (id)objc_opt_class();
        id v35 = v8;
        id v36 = v50;
        LODWORD(v38) = 12;
        v37 = (void *)_os_log_send_and_compose_impl();

        id v8 = v35;
        if (!v37)
        {
LABEL_22:

          v10[2](v10, 0);
          goto LABEL_11;
        }
        v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v49, v38);
        free(v37);
        SSFileLog();
      }

      goto LABEL_22;
    }
  }
  v16 = v9;
  v17 = +[LSApplicationProxy applicationProxyForIdentifier:v11];
  v18 = [(ServiceReviewViewController *)self _iconForApplication:v17];
  id v39 = v8;
  v19 = [v8 objectForKey:SKUIServiceReviewSandboxMode];
  id v20 = [v19 BOOLValue];

  v21 = [v17 itemID];
  id v22 = [v21 unsignedIntegerValue];

  if (v22 || (v20 & 1) != 0)
  {
    v27 = [v17 itemID];
    v28 = [v17 localizedName];
    id v9 = v16;
    v29 = [(ServiceReviewViewController *)self _inAppConfigurationWithItemID:v27 title:v28 icon:v18 sandboxed:v20 clientContext:v16];

    ((void (**)(id, void *))v10)[2](v10, v29);
  }
  else
  {
    v23 = objc_opt_new();
    [v23 addObject:v11];
    v24 = +[SKServiceBroker defaultBroker];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10000CBB8;
    v47[3] = &unk_10004D270;
    v47[4] = self;
    v25 = v10;
    id v48 = v25;
    v26 = [v24 storeKitServiceWithErrorHandler:v47];

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10000CD4C;
    v40[3] = &unk_10004D298;
    v40[4] = self;
    v45 = v25;
    id v41 = v11;
    id v42 = v17;
    id v43 = v18;
    char v46 = 0;
    id v9 = v16;
    id v44 = v16;
    [v26 lookUpItemIDsForDeletableSystemAppsWithBundleIDs:v23 reply:v40];
  }
  id v8 = v39;
LABEL_11:
}

- (id)_inAppConfigurationWithItemID:(id)a3 title:(id)a4 icon:(id)a5 sandboxed:(BOOL)a6 clientContext:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init((Class)SKUIReviewInAppConfiguration);
  v17 = [v15 stringValue];

  [v16 setItemID:v17];
  [v16 setTitle:v14];

  [v16 setViewController:self];
  [v16 setClientContext:v12];

  [v16 setIcon:v13];
  [v16 setSandboxed:v7];
  [v16 setIsNativeVisionApp:0];

  return v16;
}

- (id)_iconForApplication:(id)a3
{
  id v3 = a3;
  id v4 = +[UIScreen mainScreen];
  [v4 scale];
  double v6 = v5;

  BOOL v7 = +[UIDevice currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  if (v6 == 3.0)
  {
    uint64_t v9 = 32;
  }
  else if (v6 == 2.0)
  {
    if (v8 == (id)1) {
      uint64_t v9 = 24;
    }
    else {
      uint64_t v9 = 15;
    }
  }
  else
  {
    uint64_t v9 = v8 == (id)1;
  }
  v10 = [v3 iconDataForVariant:v9];

  v11 = (CGImage *)LICreateIconFromCachedBitmap();
  if (v11)
  {
    id v12 = +[UIImage imageWithCGImage:v11 scale:0 orientation:v6];
  }
  else
  {
    id v12 = 0;
  }
  CGImageRelease(v11);

  return v12;
}

- (void)_loadDidFailWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    double v5 = +[NSBundle bundleForClass:objc_opt_class()];
    double v6 = [v5 localizedStringForKey:@"DEFAULT_ERROR_TITLE" value:&stru_10004DF18 table:0];
    v25 = v6;
    BOOL v7 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v4 = +[NSError errorWithDomain:SKErrorDomain code:5 userInfo:v7];
  }
  id v8 = +[SSLogConfig sharedConfig];
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    v10 &= 2u;
  }
  if (v10)
  {
    int v20 = 138543618;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2114;
    id v23 = v4;
    id v12 = v21;
    LODWORD(v17) = 22;
    id v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_12;
    }
    v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v20, v17);
    free(v13);
    SSFileLog();
  }

LABEL_12:
  id v14 = +[SKUIErrorHelper errorWithSafeUserInfo:v4];
  id v15 = [(ServiceReviewViewController *)self presentedViewController];

  if (v15)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000D5B4;
    v18[3] = &unk_10004D2C0;
    v18[4] = self;
    id v19 = v14;
    [(ServiceReviewViewController *)self dismissViewControllerAnimated:1 completion:v18];
  }
  else
  {
    id v16 = [(ServiceReviewViewController *)self _clientViewControllerProxy];
    [v16 didFinishWithResult:&off_100050B68 error:v14];
  }
}

- (void)setConfigurationPreloader:(id)a3
{
}

- (SKUIReviewInAppController)reviewInAppController
{
  return self->_reviewInAppController;
}

- (void)setReviewInAppController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewInAppController, 0);

  objc_storeStrong((id *)&self->_configurationPreloader, 0);
}

@end