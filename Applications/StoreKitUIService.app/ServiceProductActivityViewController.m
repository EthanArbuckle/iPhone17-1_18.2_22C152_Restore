@interface ServiceProductActivityViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (CGRect)popoverSourceRect;
- (ServiceProductActivityViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_productIDFromParameters:(id)a3;
- (void)_loadClientContextWithCompletionBlock:(id)a3;
- (void)_loadDidFailWithError:(id)a3;
- (void)_lookupItemWithIdentifier:(id)a3 success:(id)a4 failure:(id)a5;
- (void)_presentActivityViewControllerWithItem:(id)a3;
- (void)dealloc;
- (void)finishImmediately:(id)a3;
- (void)setPopoverSourceRect:(CGRect)a3;
- (void)setupProductWithParameters:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ServiceProductActivityViewController

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKUIServiceProductActivityViewController];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKUIClientProductActivityViewController];
}

- (ServiceProductActivityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)ServiceProductActivityViewController;
  v4 = [(ServiceProductActivityViewController *)&v20 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSUUID UUID];
    v6 = [v5 UUIDString];
    v7 = [v6 componentsSeparatedByString:@"-"];
    uint64_t v8 = [v7 firstObject];
    logKey = v4->_logKey;
    v4->_logKey = (NSString *)v8;

    v10 = +[SSLogConfig sharedConfig];
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      v14 = objc_opt_class();
      v15 = v4->_logKey;
      int v21 = 138543618;
      v22 = v14;
      __int16 v23 = 2114;
      v24 = v15;
      id v16 = v14;
      LODWORD(v19) = 22;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_11:

        return v4;
      }
      v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v21, v19);
      free(v17);
      SSFileLog();
    }

    goto LABEL_11;
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[SSLogConfig sharedConfig];
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_9;
  }
  v7 = objc_opt_class();
  logKey = self->_logKey;
  int v13 = 138543618;
  v14 = v7;
  __int16 v15 = 2114;
  id v16 = logKey;
  id v9 = v7;
  LODWORD(v11) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v13, v11);
    free(v10);
    SSFileLog();
LABEL_9:
  }
  v12.receiver = self;
  v12.super_class = (Class)ServiceProductActivityViewController;
  [(ServiceProductActivityViewController *)&v12 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ServiceProductActivityViewController;
  [(ServiceProductActivityViewController *)&v7 viewDidAppear:a3];
  unsigned int v4 = [(ServiceProductActivityViewController *)self view];
  int v5 = [v4 window];
  v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];
}

- (void)setupProductWithParameters:(id)a3
{
  id v4 = a3;
  int v5 = [(ServiceProductActivityViewController *)self _productIDFromParameters:v4];
  if (v5)
  {
    v6 = [v4 valueForKey:SKStoreProductParameterPopoverSourceRect];
    CGRect v27 = CGRectFromString(v6);
    -[ServiceProductActivityViewController setPopoverSourceRect:](self, "setPopoverSourceRect:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);

    objc_initWeak((id *)location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002784C;
    v21[3] = &unk_10004DC08;
    objc_copyWeak(&v23, (id *)location);
    id v7 = v5;
    id v22 = v7;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000278D8;
    v18[3] = &unk_10004DC30;
    objc_copyWeak(&v20, (id *)location);
    v18[4] = self;
    id v19 = v7;
    [(ServiceProductActivityViewController *)self _lookupItemWithIdentifier:v19 success:v21 failure:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v8 = +[SSLogConfig sharedConfig];
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      objc_super v12 = objc_opt_class();
      logKey = self->_logKey;
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v12;
      __int16 v25 = 2114;
      v26 = logKey;
      id v14 = v12;
      LODWORD(v17) = 22;
      __int16 v15 = (void *)_os_log_send_and_compose_impl();

      if (v15)
      {
        id v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, location, v17);
        free(v15);
        SSFileLog();
      }
    }
    else
    {
    }
    [(ServiceProductActivityViewController *)self _loadDidFailWithError:0];
  }
}

- (void)finishImmediately:(id)a3
{
  id v4 = a3;
  int v5 = [(ServiceProductActivityViewController *)self presentedViewController];

  if (v5)
  {
    id v6 = [(NSString *)self->_logKey copy];
    id v7 = [v4 BOOLValue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100027C38;
    v9[3] = &unk_10004D2C0;
    v9[4] = self;
    id v10 = v6;
    id v8 = v6;
    [(ServiceProductActivityViewController *)self dismissViewControllerAnimated:v7 completion:v9];
  }
}

- (void)_loadClientContextWithCompletionBlock:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  id v4 = +[SKUIClientContext defaultContext];
  if (v4)
  {
    v3[2](v3, v4);
  }
  else
  {
    id v5 = objc_alloc_init((Class)SKUIReloadConfigurationOperation);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100027ED0;
    v7[3] = &unk_10004DC58;
    id v8 = v3;
    [v5 setOutputBlock:v7];
    id v6 = objc_alloc_init((Class)NSOperationQueue);
    [v6 addOperation:v5];
  }
}

- (void)_presentActivityViewControllerWithItem:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002807C;
  v5[3] = &unk_10004DCA8;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(ServiceProductActivityViewController *)self _loadClientContextWithCompletionBlock:v5];
}

- (void)_loadDidFailWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"DEFAULT_ERROR_TITLE" value:&stru_10004DF18 table:0];
    v29 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
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
  uint64_t v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    v10 &= 2u;
  }
  if (v10)
  {
    objc_super v12 = objc_opt_class();
    logKey = self->_logKey;
    int v22 = 138543874;
    id v23 = v12;
    __int16 v24 = 2114;
    __int16 v25 = logKey;
    __int16 v26 = 2114;
    id v27 = v4;
    id v14 = v12;
    LODWORD(v19) = 32;
    __int16 v15 = (void *)_os_log_send_and_compose_impl();

    if (!v15) {
      goto LABEL_12;
    }
    uint64_t v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v22, v19);
    free(v15);
    SSFileLog();
  }

LABEL_12:
  id v16 = +[SKUIErrorHelper errorWithSafeUserInfo:v4];
  uint64_t v17 = [(ServiceProductActivityViewController *)self presentedViewController];

  if (v17)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000288C0;
    v20[3] = &unk_10004D2C0;
    v20[4] = self;
    id v21 = v16;
    [(ServiceProductActivityViewController *)self dismissViewControllerAnimated:1 completion:v20];
  }
  else
  {
    v18 = [(ServiceProductActivityViewController *)self _clientViewControllerProxy];
    [v18 didFinishWithResult:&off_100050BB0 error:v16];
  }
}

- (id)_productIDFromParameters:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:SKStoreProductParameterITunesItemIdentifier];
  if (!v3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v3 length]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v3 integerValue])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10002E0F0();
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v3 stringValue], (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10002E178();
    }
LABEL_10:
    id v4 = 0;
  }
LABEL_11:

  return v4;
}

- (void)_lookupItemWithIdentifier:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a3;
  id v37 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = +[AMSBag bagForProfile:@"appstored" profileVersion:@"1"];
    id v36 = [objc_alloc((Class)AMSProcessInfo) initWithBundleIdentifier:@"com.apple.storekitd"];
    id v48 = v8;
    uint64_t v11 = +[NSArray arrayWithObjects:&v48 count:1];
    objc_super v12 = +[SSLogConfig sharedConfig];
    unsigned int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    __int16 v15 = [v12 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      int v16 = v14;
    }
    else {
      int v16 = v14 & 2;
    }
    if (v16)
    {
      uint64_t v17 = objc_opt_class();
      logKey = self->_logKey;
      *(_DWORD *)location = 138543874;
      *(void *)&location[4] = v17;
      __int16 v44 = 2114;
      v45 = logKey;
      __int16 v46 = 2114;
      id v47 = v8;
      id v19 = v17;
      LODWORD(v35) = 32;
      id v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_12:

        id v21 = [objc_alloc((Class)AMSMediaTask) initWithType:0 clientIdentifier:@"com.storekit.shareactivity" clientVersion:@"1" bag:v10];
        [v21 setClientInfo:v36];
        [v21 setLogKey:self->_logKey];
        [v21 setItemIdentifiers:v11];
        id v22 = [(NSString *)self->_logKey copy];
        objc_initWeak((id *)location, self);
        id v23 = [v21 perform];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100028F60;
        v38[3] = &unk_10004DCD0;
        objc_copyWeak(&v42, (id *)location);
        id v24 = v22;
        id v39 = v24;
        id v40 = v37;
        id v41 = v9;
        [v23 addFinishBlock:v38];

        objc_destroyWeak(&v42);
        objc_destroyWeak((id *)location);

        goto LABEL_24;
      }
      __int16 v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, location, v35);
      free(v20);
      SSFileLog();
    }

    goto LABEL_12;
  }
  __int16 v25 = +[SSLogConfig sharedConfig];
  unsigned int v26 = [v25 shouldLog];
  if ([v25 shouldLogToDisk]) {
    int v27 = v26 | 2;
  }
  else {
    int v27 = v26;
  }
  NSErrorUserInfoKey v28 = [v25 OSLogObject];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    int v29 = v27;
  }
  else {
    int v29 = v27 & 2;
  }
  if (v29)
  {
    v30 = objc_opt_class();
    v31 = self->_logKey;
    *(_DWORD *)location = 138543618;
    *(void *)&location[4] = v30;
    __int16 v44 = 2114;
    v45 = v31;
    id v32 = v30;
    LODWORD(v35) = 22;
    v33 = (void *)_os_log_send_and_compose_impl();

    if (v33)
    {
      v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, location, v35);
      free(v33);
      SSFileLog();
    }
  }
  else
  {
  }
  id v10 = [objc_alloc((Class)NSError) initWithDomain:SKErrorDomain code:5 userInfo:0];
  (*((void (**)(id, id))v9 + 2))(v9, v10);
LABEL_24:
}

- (CGRect)popoverSourceRect
{
  double x = self->_popoverSourceRect.origin.x;
  double y = self->_popoverSourceRect.origin.y;
  double width = self->_popoverSourceRect.size.width;
  double height = self->_popoverSourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPopoverSourceRect:(CGRect)a3
{
  self->_popoverSourceRect = a3;
}

- (void).cxx_destruct
{
}

@end