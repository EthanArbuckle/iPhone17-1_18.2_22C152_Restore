@interface AKToolsPickerController
- (AKController)controller;
- (AKToolsPickerController)initWithController:(id)a3;
- (UINavigationController)navController;
- (UIViewController)toolsListController;
- (void)setController:(id)a3;
- (void)setNavController:(id)a3;
- (void)setToolsListController:(id)a3;
@end

@implementation AKToolsPickerController

- (AKToolsPickerController)initWithController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKToolsPickerController;
  v5 = [(AKToolsPickerController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(AKToolsPickerController *)v5 setController:v4];
    v7 = [[AKToolsListViewController alloc] initWithNibName:0 bundle:0];
    [(AKToolsPickerController *)v6 setToolsListController:v7];
  }
  return v6;
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
}

- (UIViewController)toolsListController
{
  return self->_toolsListController;
}

- (void)setToolsListController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolsListController, 0);
  objc_storeStrong((id *)&self->_navController, 0);

  objc_destroyWeak((id *)&self->_controller);
}

@end