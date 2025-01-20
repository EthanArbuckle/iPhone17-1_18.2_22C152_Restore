@interface ServiceStorePageViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (id)_storePageViewController;
- (void)_finishLoadWithResult:(BOOL)a3 error:(id)a4;
- (void)_willAppearInRemoteViewController;
- (void)dealloc;
- (void)loadPageWithURL:(id)a3;
- (void)loadPageWithURLBagKey:(id)a3;
- (void)loadView;
- (void)storePage:(id)a3 showProductPageForItem:(id)a4;
- (void)storePage:(id)a3 showStorePageForURL:(id)a4;
@end

@implementation ServiceStorePageViewController

- (void)dealloc
{
  [(SKUIStorePageViewController *)self->_storePageViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)ServiceStorePageViewController;
  [(ServiceStorePageViewController *)&v3 dealloc];
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKUIServiceStorePageViewController];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKUIClientStorePageViewController];
}

- (void)loadView
{
  id v5 = objc_alloc_init((Class)UIView);
  objc_super v3 = [(ServiceStorePageViewController *)self _storePageViewController];
  v4 = [v3 view];

  [v4 setAutoresizingMask:18];
  [v5 bounds];
  [v4 setFrame:];
  [v5 addSubview:v4];
  [(ServiceStorePageViewController *)self setView:v5];
}

- (void)_willAppearInRemoteViewController
{
  [(ServiceStorePageViewController *)self _hostAuditToken];
  self->_isEntitled = sub_100010BA0(&v3, @"com.apple.ios.StoreKit.store-page");
}

- (void)loadPageWithURLBagKey:(id)a3
{
  id v4 = a3;
  if (!self->_isEntitled)
  {
    v11 = +[SSLogConfig sharedConfig];
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    v14 = [v11 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      int v15 = v13;
    }
    else {
      int v15 = v13 & 2;
    }
    if (v15)
    {
      v20[0] = 0;
      LODWORD(v17) = 2;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        id v9 = [(ServiceStorePageViewController *)self _clientViewControllerProxy];
        v10 = SSError();
        [v9 didFinishWithResult:&__kCFBooleanFalse error:v10];
        goto LABEL_16;
      }
      v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, v20, v17);
      free(v16);
      SSFileLog();
    }

    goto LABEL_15;
  }
  if (!self->_urlBag)
  {
    id v5 = (SSURLBag *)objc_alloc_init((Class)SSURLBag);
    urlBag = self->_urlBag;
    self->_urlBag = v5;
  }
  v7 = +[SSWeakReference weakReferenceWithObject:self];
  v8 = self->_urlBag;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100029B30;
  v18[3] = &unk_10004D648;
  v19 = v7;
  id v9 = v7;
  [(SSURLBag *)v8 loadValueForKey:v4 completionBlock:v18];
  v10 = v19;
LABEL_16:
}

- (void)loadPageWithURL:(id)a3
{
  id v4 = a3;
  if (!self->_isEntitled)
  {
    id v9 = +[SSLogConfig sharedConfig];
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    unsigned int v12 = [v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      int v13 = v11;
    }
    else {
      int v13 = v11 & 2;
    }
    if (v13)
    {
      v18[0] = 0;
      LODWORD(v15) = 2;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        id v7 = [(ServiceStorePageViewController *)self _clientViewControllerProxy];
        v8 = SSError();
        [v7 didFinishWithResult:&__kCFBooleanFalse error:v8];
        goto LABEL_14;
      }
      unsigned int v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, v18, v15);
      free(v14);
      SSFileLog();
    }

    goto LABEL_13;
  }
  id v5 = +[SSWeakReference weakReferenceWithObject:self];
  v6 = [(ServiceStorePageViewController *)self _storePageViewController];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100029EC8;
  v16[3] = &unk_10004DBE0;
  uint64_t v17 = v5;
  id v7 = v5;
  [v6 loadURL:v4 withCompletionBlock:v16];

  v8 = v17;
LABEL_14:
}

- (void)storePage:(id)a3 showProductPageForItem:(id)a4
{
  id v5 = a4;
  id v8 = [(ServiceStorePageViewController *)self _clientViewControllerProxy];
  id v6 = [v5 itemIdentifier];

  id v7 = +[NSNumber numberWithLongLong:v6];
  [v8 showProductPageWithItemIdentifier:v7];
}

- (void)storePage:(id)a3 showStorePageForURL:(id)a4
{
  id v4 = a4;
  id v5 = +[UIApplication sharedApplication];
  [v5 openURL:v4];
}

- (void)_finishLoadWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!v6 && !v4)
  {
    SSError();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v6;
  id v7 = [(ServiceStorePageViewController *)self _clientViewControllerProxy];
  id v8 = +[NSNumber numberWithBool:v4];
  [v7 didFinishWithResult:v8 error:v9];
}

- (id)_storePageViewController
{
  if (!self->_clientContext)
  {
    long long v3 = +[SKUIClientContext defaultContext];
    clientContext = self->_clientContext;
    self->_clientContext = v3;
  }
  storePageViewController = self->_storePageViewController;
  if (!storePageViewController)
  {
    id v6 = (SKUIStorePageViewController *)objc_alloc_init((Class)SKUIStorePageViewController);
    id v7 = self->_storePageViewController;
    self->_storePageViewController = v6;

    [(SKUIStorePageViewController *)self->_storePageViewController setClientContext:self->_clientContext];
    [(SKUIStorePageViewController *)self->_storePageViewController setDelegate:self];
    [(ServiceStorePageViewController *)self addChildViewController:self->_storePageViewController];
    storePageViewController = self->_storePageViewController;
  }

  return storePageViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_storePageViewController, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end