@interface FANavigationController
- (BOOL)_isEmpty;
- (FANavigationControllerDelegate)familyDelegate;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setFamilyDelegate:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
@end

@implementation FANavigationController

- (BOOL)_isEmpty
{
  v2 = [(FANavigationController *)self viewControllers];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v9[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(FANavigationController *)self _isEmpty])
  {
    v9[0] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [(FANavigationController *)self setViewControllers:v7 animated:0];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)FANavigationController;
    [(FANavigationController *)&v8 pushViewController:v6 animated:v4];
  }
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(FANavigationController *)self _isEmpty])
  {
    uint64_t v7 = [v6 count];
    if (v7) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v4;
    }
    v11.receiver = self;
    v11.super_class = (Class)FANavigationController;
    [(FANavigationController *)&v11 setViewControllers:v6 animated:v8];
    if (v7)
    {
      v9 = [(FANavigationController *)self familyDelegate];
      v10 = [v6 firstObject];
      [v9 navigationController:self didPresentInitialViewController:v10];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)FANavigationController;
    [(FANavigationController *)&v11 setViewControllers:v6 animated:v4];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [(FANavigationController *)self presentingViewController];

  if (v10)
  {
    v12.receiver = self;
    v12.super_class = (Class)FANavigationController;
    [(FANavigationController *)&v12 presentViewController:v8 animated:v6 completion:v9];
  }
  else
  {
    objc_super v11 = [(FANavigationController *)self familyDelegate];
    [v11 navigationController:self presentViewController:v8];
  }
}

- (FANavigationControllerDelegate)familyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_familyDelegate);
  return (FANavigationControllerDelegate *)WeakRetained;
}

- (void)setFamilyDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end