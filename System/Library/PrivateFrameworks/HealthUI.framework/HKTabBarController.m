@interface HKTabBarController
- (HKTabBarController)init;
- (HKTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)previousViewController;
- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3;
- (void)setPreviousViewController:(id)a3;
- (void)setTabBarControlsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation HKTabBarController

- (HKTabBarController)init
{
  v5.receiver = self;
  v5.super_class = (Class)HKTabBarController;
  v2 = [(HKTabBarController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HKTabBarController *)v2 setDelegate:v2];
  }
  return v3;
}

- (HKTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKTabBarController;
  v4 = [(HKTabBarController *)&v7 initWithNibName:a3 bundle:a4];
  objc_super v5 = v4;
  if (v4) {
    [(HKTabBarController *)v4 setDelegate:v4];
  }
  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKTabBarController;
  [(HKTabBarController *)&v5 viewDidAppear:a3];
  v4 = [(HKTabBarController *)self selectedViewController];
  [(HKTabBarController *)self setPreviousViewController:v4];
}

- (void)setTabBarControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6 = [(HKTabBarController *)self tabBar];
  objc_super v7 = [(HKTabBarController *)self view];
  [v6 frame];
  uint64_t v9 = v8;
  double v11 = v10;
  uint64_t v13 = v12;
  double v15 = v14;
  [v7 frame];
  if ((((v11 < v19) ^ v4) & 1) == 0)
  {
    uint64_t v20 = v17;
    uint64_t v21 = v18;
    double v22 = v19;
    uint64_t v25 = v16;
    if (v4) {
      double v23 = v15;
    }
    else {
      double v23 = -v15;
    }
    v24 = (void *)MEMORY[0x1E4FB1EB0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __55__HKTabBarController_setTabBarControlsHidden_animated___block_invoke;
    v26[3] = &unk_1E6D55C40;
    id v27 = v6;
    uint64_t v29 = v9;
    double v30 = v11;
    uint64_t v31 = v13;
    double v32 = v15;
    double v33 = v23;
    id v28 = v7;
    uint64_t v34 = v25;
    uint64_t v35 = v20;
    uint64_t v36 = v21;
    double v37 = v22;
    [v24 animateWithDuration:v26 animations:0.3];
  }
}

uint64_t __55__HKTabBarController_setTabBarControlsHidden_animated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  CGRect v10 = CGRectOffset(*(CGRect *)(a1 + 48), 0.0, *(CGFloat *)(a1 + 80));
  objc_msgSend(v2, "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  v3 = *(void **)(a1 + 40);
  double v4 = *(double *)(a1 + 96);
  double v5 = *(double *)(a1 + 104);
  double v6 = *(double *)(a1 + 88);
  double v7 = *(double *)(a1 + 112) + *(double *)(a1 + 80);
  return objc_msgSend(v3, "setFrame:", v6, v4, v5, v7);
}

- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3
{
  v3 = [(HKTabBarController *)self selectedViewController];
  double v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 supportedInterfaceOrientations];
  }
  else {
    unint64_t v5 = 2;
  }

  return v5;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v13 = a4;
  unint64_t v5 = [(HKTabBarController *)self previousViewController];
  int v6 = [v5 conformsToProtocol:&unk_1F3D18E98];

  if (v6)
  {
    id v7 = [(HKTabBarController *)self previousViewController];
    if (v7 == v13)
    {
    }
    else
    {
      uint64_t v8 = [(HKTabBarController *)self previousViewController];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        CGRect v10 = [(HKTabBarController *)self previousViewController];
        [v10 didChangeToAnotherTab];

        goto LABEL_10;
      }
    }
    id v11 = [(HKTabBarController *)self previousViewController];
    if (v11 == v13)
    {
      char v12 = objc_opt_respondsToSelector();

      if (v12) {
        [v13 didTapTabBarIcon];
      }
    }
    else
    {
    }
  }
LABEL_10:
  [(HKTabBarController *)self setPreviousViewController:v13];
}

- (UIViewController)previousViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPreviousViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end