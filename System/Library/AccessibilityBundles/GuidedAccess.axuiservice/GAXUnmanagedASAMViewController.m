@interface GAXUnmanagedASAMViewController
- (GAXUnmanagedASAMViewController)initWithApplicationDisplayName:(id)a3 resultHandler:(id)a4;
- (NSString)appDisplayName;
- (id)resultHandler;
- (void)loadView;
- (void)setAppDisplayName:(id)a3;
- (void)setResultHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GAXUnmanagedASAMViewController

- (GAXUnmanagedASAMViewController)initWithApplicationDisplayName:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)GAXUnmanagedASAMViewController;
  v8 = [(GAXUnmanagedASAMViewController *)&v10 init];
  if (v8)
  {
    if (!v7) {
      _AXAssert();
    }
    [(GAXUnmanagedASAMViewController *)v8 setResultHandler:v7];
    [(GAXUnmanagedASAMViewController *)v8 setAppDisplayName:v6];
  }

  return v8;
}

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  [(GAXUnmanagedASAMViewController *)self setView:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ((AXDeviceIsUnlocked() & 1) == 0)
  {
    v5 = GAXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_37E8C(v5);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)GAXUnmanagedASAMViewController;
  [(GAXUnmanagedASAMViewController *)&v6 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)GAXUnmanagedASAMViewController;
  [(GAXUnmanagedASAMViewController *)&v19 viewDidAppear:a3];
  v4 = AXDeviceGetLocalizedShortModelName();
  v5 = GAXLocString(@"APP_SELF_LOCK_CONFIRM_MESSAGE");
  objc_super v6 = [(GAXUnmanagedASAMViewController *)self appDisplayName];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6, v4);

  v8 = GAXLocString(@"APP_SELF_LOCK_CONFIRM_TITLE");
  v9 = +[UIAlertController alertControllerWithTitle:v8 message:v7 preferredStyle:1];

  objc_super v10 = GAXLocString(@"APP_SELF_LOCK_ALLOW_BUTTON_LABEL");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_2FD04;
  v18[3] = &unk_5E008;
  v18[4] = self;
  v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v18];
  [v9 addAction:v11];

  v12 = GAXLocString(@"APP_SELF_LOCK_DENY_BUTTON_LABEL");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_2FD60;
  v17[3] = &unk_5E008;
  v17[4] = self;
  v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v17];
  [v9 addAction:v13];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2FDBC;
  block[3] = &unk_5CEB0;
  block[4] = self;
  id v16 = v9;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setResultHandler:(id)a3
{
}

- (NSString)appDisplayName
{
  return self->_appDisplayName;
}

- (void)setAppDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDisplayName, 0);

  objc_storeStrong(&self->_resultHandler, 0);
}

@end