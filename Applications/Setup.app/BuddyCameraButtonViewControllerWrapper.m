@interface BuddyCameraButtonViewControllerWrapper
- (BuddyCameraButtonViewControllerDelegate)delegate;
- (void)cameraButtonBuddyViewControllerDidFinish:(id)a3;
- (void)createViewController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BuddyCameraButtonViewControllerWrapper

- (void)createViewController:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = objc_alloc_init((Class)sub_1000C62DC());
  [v13 setDelegate:v15];
  objc_initWeak(&from, v15);
  id v3 = v13;
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1000C63F4;
  v8 = &unk_1002B2750;
  objc_copyWeak(&v11, &from);
  id v10 = location[0];
  id v9 = v13;
  [v3 loadAssetsWithCompletion:&v4];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)cameraButtonBuddyViewControllerDidFinish:(id)a3
{
  int v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyCameraButtonViewControllerWrapper *)v6 delegate];
  -[BuddyCameraButtonViewControllerDelegate cameraButtonViewControllerDidFinish:](v3, "cameraButtonViewControllerDidFinish:", location[0], v3);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (BuddyCameraButtonViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BuddyCameraButtonViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end