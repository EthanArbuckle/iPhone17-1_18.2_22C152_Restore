@interface PHPhoneRemoteHostViewController
+ (Class)remoteViewControllerClass;
+ (void)requestViewControllerWithCompletionHandler:(id)a3;
- (PHPhoneRemoteHostViewControllerDelegate)delegate;
- (PHPhoneRemoteViewController)remoteViewController;
- (void)setDelegate:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setUpRemoteViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PHPhoneRemoteHostViewController

+ (void)requestViewControllerWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = +[PHPhoneRemoteHostViewController remoteViewControllerClass];
  if (v4)
  {
    v5 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007F948;
    v8[3] = &unk_1002CF238;
    id v9 = v3;
    v10 = v5;
    id v6 = [(objc_class *)v5 requestViewControllerWithConnectionHandler:v8];
  }
  else
  {
    v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] No PHPhoneRemoteViewController subclasses are supported, so unable to show remote view controller", buf, 2u);
    }

    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }
}

+ (Class)remoteViewControllerClass
{
  if (+[PHMobilePhoneRemoteViewController isSupported]
    || +[PHPhoneRemoteViewController isSupported])
  {
    v2 = objc_opt_class();
  }
  else
  {
    v2 = 0;
  }

  return (Class)v2;
}

- (void)setUpRemoteViewController:(id)a3
{
  id v19 = a3;
  [(PHPhoneRemoteHostViewController *)self addChildViewController:v19];
  v4 = [(PHPhoneRemoteHostViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [v19 view];
  [v13 setFrame:v6, v8, v10, v12];

  v14 = [(PHPhoneRemoteHostViewController *)self view];
  id v15 = [v14 autoresizingMask];
  v16 = [v19 view];
  [v16 setAutoresizingMask:v15];

  v17 = [(PHPhoneRemoteHostViewController *)self view];
  v18 = [v19 view];
  [v17 addSubview:v18];

  [v19 didMoveToParentViewController:self];
  [(PHPhoneRemoteHostViewController *)self setRemoteViewController:v19];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHPhoneRemoteHostViewController;
  [(PHPhoneRemoteHostViewController *)&v5 viewDidDisappear:a3];
  v4 = [(PHPhoneRemoteHostViewController *)self delegate];
  [v4 phoneRemoteHostViewControllerDidDismiss];
}

- (PHPhoneRemoteHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHPhoneRemoteHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PHPhoneRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end