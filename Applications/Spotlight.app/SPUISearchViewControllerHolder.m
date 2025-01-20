@interface SPUISearchViewControllerHolder
+ (id)sharedInstance;
- (CALayer)searchProtectorLayer;
- (SPUINavigationController)navigationController;
- (SPUIPlatterContainerViewController)platterViewController;
- (SPUISearchViewController)searchViewController;
- (SPUISearchViewControllerHolder)init;
- (SPUIUnifiedFieldViewController)unifiedFieldController;
- (UIViewController)rootViewController;
- (void)setNavigationController:(id)a3;
- (void)setPlatterViewController:(id)a3;
- (void)setSearchViewController:(id)a3;
- (void)setUnifiedFieldController:(id)a3;
@end

@implementation SPUISearchViewControllerHolder

- (SPUISearchViewControllerHolder)init
{
  v10.receiver = self;
  v10.super_class = (Class)SPUISearchViewControllerHolder;
  v2 = [(SPUISearchViewControllerHolder *)&v10 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SPUISearchViewControllerHolder *)v2 setSearchViewController:v3];

    id v4 = objc_alloc((Class)SPUINavigationController);
    v5 = [(SPUISearchViewControllerHolder *)v2 searchViewController];
    id v6 = [v4 initWithSearchViewController:v5];

    [(SPUISearchViewControllerHolder *)v2 setNavigationController:v6];
    if (+[SPUIDefaults enableFloatingWindow])
    {
      id v7 = [objc_alloc((Class)SPUIPlatterContainerViewController) initWithNavigationController:v6];
      [(SPUISearchViewControllerHolder *)v2 setPlatterViewController:v7];
    }
    if (+[SPUIDefaults bottomSearchFieldEnabled])
    {
      id v8 = [objc_alloc((Class)SPUIUnifiedFieldViewController) initWithNavigationController:v6];
      [(SPUISearchViewControllerHolder *)v2 setUnifiedFieldController:v8];
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A6C;
  block[3] = &unk_10000C5C8;
  block[4] = a1;
  if (qword_1000126A8 != -1) {
    dispatch_once(&qword_1000126A8, block);
  }
  v2 = (void *)qword_1000126A0;

  return v2;
}

- (CALayer)searchProtectorLayer
{
  v2 = [(SPUISearchViewControllerHolder *)self unifiedFieldController];
  v3 = [v2 searchProtectorLayer];

  return (CALayer *)v3;
}

- (SPUIUnifiedFieldViewController)unifiedFieldController
{
  return self->_unifiedFieldController;
}

- (void)setUnifiedFieldController:(id)a3
{
}

- (void)setSearchViewController:(id)a3
{
}

- (void)setNavigationController:(id)a3
{
}

- (SPUISearchViewController)searchViewController
{
  return self->_searchViewController;
}

- (UIViewController)rootViewController
{
  if (+[SPUIDefaults bottomSearchFieldEnabled])
  {
    v3 = [(SPUISearchViewControllerHolder *)self unifiedFieldController];
  }
  else
  {
    if (+[SPUIDefaults enableFloatingWindow]) {
      [(SPUISearchViewControllerHolder *)self platterViewController];
    }
    else {
    v3 = [(SPUISearchViewControllerHolder *)self navigationController];
    }
  }

  return (UIViewController *)v3;
}

- (SPUINavigationController)navigationController
{
  return self->_navigationController;
}

- (SPUIPlatterContainerViewController)platterViewController
{
  return self->_platterViewController;
}

- (void)setPlatterViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unifiedFieldController, 0);
  objc_storeStrong((id *)&self->_platterViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_storeStrong((id *)&self->_searchViewController, 0);
}

@end