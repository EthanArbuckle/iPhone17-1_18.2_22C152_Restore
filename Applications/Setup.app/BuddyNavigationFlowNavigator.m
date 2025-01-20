@interface BuddyNavigationFlowNavigator
- (BFFNavigationController)navigationController;
- (BuddyNavigationFlowNavigator)initWithNavigationController:(id)a3;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popToViewController:(id)a3 animated:(BOOL)a4;
- (id)presentedViewController;
- (id)topViewController;
- (id)view;
- (id)viewControllers;
- (void)addDelegateObserver:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 completion:(id)a4;
- (void)pushViewController:(id)a3 usingShieldColor:(id)a4 completion:(id)a5;
- (void)setNavigationController:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
@end

@implementation BuddyNavigationFlowNavigator

- (BuddyNavigationFlowNavigator)initWithNavigationController:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v8;
  id v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyNavigationFlowNavigator;
  id v8 = [(BuddyNavigationFlowNavigator *)&v6 init];
  objc_storeStrong(&v8, v8);
  if (v8) {
    objc_storeWeak((id *)v8 + 1, location[0]);
  }
  v4 = (BuddyNavigationFlowNavigator *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (void)addDelegateObserver:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyNavigationFlowNavigator *)v5 navigationController];
  [(BFFNavigationController *)v3 addDelegateObserver:location[0]];

  objc_storeStrong(location, 0);
}

- (id)topViewController
{
  v2 = [(BuddyNavigationFlowNavigator *)self navigationController];
  id v3 = [(BFFNavigationController *)v2 topViewController];

  return v3;
}

- (id)presentedViewController
{
  v2 = [(BuddyNavigationFlowNavigator *)self navigationController];
  id v3 = [(BFFNavigationController *)v2 presentedViewController];

  return v3;
}

- (id)viewControllers
{
  v2 = [(BuddyNavigationFlowNavigator *)self navigationController];
  id v3 = [(BFFNavigationController *)v2 viewControllers];

  return v3;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v6 = a4;
  v5 = [(BuddyNavigationFlowNavigator *)v8 navigationController];
  [(BFFNavigationController *)v5 setViewControllers:location[0] animated:v6];

  objc_storeStrong(location, 0);
}

- (id)view
{
  v2 = [(BuddyNavigationFlowNavigator *)self navigationController];
  id v3 = [(BFFNavigationController *)v2 view];

  return v3;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(BuddyNavigationFlowNavigator *)v6 navigationController];
  [(BFFNavigationController *)v4 pushViewController:location[0] animated:1];

  objc_storeStrong(location, 0);
}

- (void)pushViewController:(id)a3 completion:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = [(BuddyNavigationFlowNavigator *)v8 navigationController];
  [(BFFNavigationController *)v5 pushViewController:location[0] completion:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pushViewController:(id)a3 usingShieldColor:(id)a4 completion:(id)a5
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  v7 = [(BuddyNavigationFlowNavigator *)v11 navigationController];
  [(BFFNavigationController *)v7 pushViewController:location[0] usingShieldColor:v9 completion:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v8 = a4;
  v5 = [(BuddyNavigationFlowNavigator *)v10 navigationController];
  id v6 = [(BFFNavigationController *)v5 popToViewController:location[0] animated:v8];

  objc_storeStrong(location, 0);

  return v6;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v6 = a3;
  id v3 = [(BuddyNavigationFlowNavigator *)self navigationController];
  id v4 = [(BFFNavigationController *)v3 popToRootViewControllerAnimated:v6];

  return v4;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = a4;
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  v7 = [(BuddyNavigationFlowNavigator *)v11 navigationController];
  [(BFFNavigationController *)v7 presentViewController:location[0] animated:v9 completion:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  id v4 = [(BuddyNavigationFlowNavigator *)v8 navigationController];
  [(BFFNavigationController *)v4 dismissViewControllerAnimated:v6 completion:v5];

  objc_storeStrong(&v5, 0);
}

- (BFFNavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  return (BFFNavigationController *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end