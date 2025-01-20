@interface ServiceTouchIDAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (id)_remoteViewControllerProxy;
- (void)_dismissAlertController;
- (void)_finishWithButtonIndex:(int64_t)a3;
- (void)_showAlertForAlertProxy:(id)a3;
- (void)_willAppearInRemoteViewController:(id)a3;
- (void)alertProxy:(id)a3 didReceiveMessage:(id)a4;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ServiceTouchIDAlertViewController

- (void)dealloc
{
  [(ServiceAlertProxy *)self->_remoteAlertProxy setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)ServiceTouchIDAlertViewController;
  [(ServiceTouchIDAlertViewController *)&v3 dealloc];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  v5 = +[ServiceAlertQueue defaultQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001380C;
  v11[3] = &unk_10004D488;
  objc_copyWeak(&v12, &location);
  [v5 getNextAlertForClassName:@"ServiceTouchIDAlertViewController" completionBlock:v11];

  v6 = [(ServiceTouchIDAlertViewController *)self _remoteViewControllerProxy];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 setIdleTimerDisabled:1 forReason:v8];

  v9 = [(ServiceTouchIDAlertViewController *)self _remoteViewControllerProxy];
  [v9 setDesiredHardwareButtonEvents:16];

  v10.receiver = self;
  v10.super_class = (Class)ServiceTouchIDAlertViewController;
  [(ServiceTouchIDAlertViewController *)&v10 viewDidAppear:v3];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  remoteAlertProxy = self->_remoteAlertProxy;
  if (remoteAlertProxy)
  {
    [(ServiceAlertProxy *)remoteAlertProxy setDelegate:0];
    [(ServiceAlertProxy *)self->_remoteAlertProxy invalidate];
    v6 = self->_remoteAlertProxy;
    self->_remoteAlertProxy = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)ServiceTouchIDAlertViewController;
  [(ServiceTouchIDAlertViewController *)&v7 viewWillDisappear:v3];
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v4 = a3;
  [v4 setAllowsAlertStacking:1];
  [v4 setAllowsMenuButtonDismissal:1];
  [v4 setShouldDismissOnUILock:1];
  v5.receiver = self;
  v5.super_class = (Class)ServiceTouchIDAlertViewController;
  [(ServiceTouchIDAlertViewController *)&v5 _willAppearInRemoteViewController:v4];
}

- (void)alertProxy:(id)a3 didReceiveMessage:(id)a4
{
  xpc_object_t xdict = a4;
  int64_t int64 = xpc_dictionary_get_int64(xdict, "0");
  if (int64 == 3002)
  {
    objc_opt_class();
    v6 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    id v7 = [objc_alloc((Class)SSDialog) initWithDialogDictionary:v6];
    headerView = self->_headerView;
    v9 = [v7 message];
    [(ServiceTouchIDAlertHeaderView *)headerView setMessage:v9];

    objc_super v10 = self->_headerView;
    v11 = [v7 title];
    [(ServiceTouchIDAlertHeaderView *)v10 setTitle:v11];

    if (xpc_dictionary_get_BOOL(xdict, "2")) {
      [(ServiceTouchIDAlertHeaderView *)self->_headerView shakeTitleView];
    }
  }
  else if (int64 == 3001)
  {
    [(ServiceTouchIDAlertViewController *)self _dismissAlertController];
  }
}

- (void)_dismissAlertController
{
  [(UIAlertController *)self->_alertController dismissViewControllerAnimated:1 completion:0];
  [(ServiceAlertProxy *)self->_remoteAlertProxy setDelegate:0];
  remoteAlertProxy = self->_remoteAlertProxy;
  self->_remoteAlertProxy = 0;

  id v6 = [(ServiceTouchIDAlertViewController *)self _remoteViewControllerProxy];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v6 setIdleTimerDisabled:0 forReason:v5];

  [v6 dismiss];
}

- (void)_finishWithButtonIndex:(int64_t)a3
{
  id v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "1", a3);
  [(ServiceAlertProxy *)self->_remoteAlertProxy finishWithResponse:v5];
  [(ServiceTouchIDAlertViewController *)self _dismissAlertController];
}

- (id)_remoteViewControllerProxy
{
  v4.receiver = self;
  v4.super_class = (Class)ServiceTouchIDAlertViewController;
  v2 = [(ServiceTouchIDAlertViewController *)&v4 _remoteViewControllerProxy];

  return v2;
}

- (void)_showAlertForAlertProxy:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_remoteAlertProxy, a3);
  [(ServiceAlertProxy *)self->_remoteAlertProxy setDelegate:self];
  id v6 = [v5 options];
  id v7 = (void *)SSXPCCreateCFObjectFromXPCObject();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [objc_alloc((Class)SSDialog) initWithDialogDictionary:v7];
    if (!self->_headerView)
    {
      v9 = objc_alloc_init(ServiceTouchIDAlertHeaderView);
      headerView = self->_headerView;
      self->_headerView = v9;

      v11 = self->_headerView;
      id v12 = +[UIColor clearColor];
      [(ServiceTouchIDAlertHeaderView *)v11 setBackgroundColor:v12];

      v13 = self->_headerView;
      v14 = [v8 message];
      [(ServiceTouchIDAlertHeaderView *)v13 setMessage:v14];

      v15 = self->_headerView;
      v16 = [v8 title];
      [(ServiceTouchIDAlertHeaderView *)v15 setTitle:v16];

      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = +[UIImage imageNamed:@"MesaGlyph" inBundle:v17];

      v19 = +[UIColor systemRedColor];
      v20 = [v18 _flatImageWithColor:v19];

      [(ServiceTouchIDAlertHeaderView *)self->_headerView setImage:v20];
    }
    if (!self->_alertController)
    {
      v21 = (UIAlertController *)objc_alloc_init((Class)UIAlertController);
      alertController = self->_alertController;
      self->_alertController = v21;

      [(UIAlertController *)self->_alertController setPreferredStyle:1];
      id v23 = objc_alloc_init((Class)UIViewController);
      -[ServiceTouchIDAlertHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", 272.0, 1.79769313e308);
      [v23 setPreferredContentSize:];
      [v23 setView:self->_headerView];
      [(UIAlertController *)self->_alertController setContentViewController:v23];
      objc_initWeak(&location, self);
      v24 = [v8 buttons];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100014034;
      v26[3] = &unk_10004D4F8;
      id v27 = v8;
      v28 = self;
      objc_copyWeak(&v29, &location);
      [v24 enumerateObjectsUsingBlock:v26];

      [(ServiceTouchIDAlertViewController *)self presentViewController:self->_alertController animated:1 completion:0];
      objc_destroyWeak(&v29);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v25 = objc_opt_class();
    NSLog(@"[%@]: Invalid alert proxy, dismissing", v25);
    [(ServiceTouchIDAlertViewController *)self _dismissAlertController];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertProxy, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_alertController, 0);
}

@end