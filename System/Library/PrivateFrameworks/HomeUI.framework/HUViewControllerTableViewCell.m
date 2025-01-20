@interface HUViewControllerTableViewCell
- (BOOL)ignoreRounding;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIViewController)parentViewController;
- (UIViewController)viewController;
- (void)_removeFromParentViewControllerAndClearProperty:(BOOL)a3;
- (void)addToParentViewController:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)removeFromParentViewController;
- (void)setIgnoreRounding:(BOOL)a3;
- (void)setParentViewController:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation HUViewControllerTableViewCell

- (void)prepareForReuse
{
  [(HUViewControllerTableViewCell *)self setViewController:0];
  [(HUViewControllerTableViewCell *)self setParentViewController:0];
  [(HUViewControllerTableViewCell *)self setIgnoreRounding:0];
  v3.receiver = self;
  v3.super_class = (Class)HUViewControllerTableViewCell;
  [(HUViewControllerTableViewCell *)&v3 prepareForReuse];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width = a3.width;
  v7 = [(HUViewControllerTableViewCell *)self viewController];
  v8 = [v7 view];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v17 = [(HUViewControllerTableViewCell *)self viewController];
  v18 = [v17 view];
  objc_msgSend(v18, "setFrame:", v10, v12, width, v16);

  v19 = [(HUViewControllerTableViewCell *)self viewController];
  v20 = [v19 view];
  [v20 layoutIfNeeded];

  v21 = [(HUViewControllerTableViewCell *)self viewController];
  v22 = [v21 view];
  objc_msgSend(v22, "setFrame:", v10, v12, v14, v16);

  v23 = [(HUViewControllerTableViewCell *)self viewController];
  [v23 preferredContentSize];
  double v25 = v24;
  double v27 = v26;

  double v28 = v25;
  double v29 = v27;
  result.height = v29;
  result.double width = v28;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HUViewControllerTableViewCell;
  [(HUViewControllerTableViewCell *)&v13 layoutSubviews];
  [(HUViewControllerTableViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(HUViewControllerTableViewCell *)self viewController];
  double v12 = [v11 view];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  if ([(HUViewControllerTableViewCell *)self ignoreRounding]) {
    [(UITableViewCell *)self turnOffRounding];
  }
}

- (void)setViewController:(id)a3
{
  double v5 = (UIViewController *)a3;
  if (self->_viewController != v5)
  {
    double v10 = v5;
    double v6 = [(HUViewControllerTableViewCell *)self parentViewController];
    if (v6)
    {
      viewController = self->_viewController;

      if (viewController) {
        [(HUViewControllerTableViewCell *)self _removeFromParentViewControllerAndClearProperty:0];
      }
    }
    objc_storeStrong((id *)&self->_viewController, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIViewController *)v10 setWantsPreferredContentSize:1];
    }
    double v8 = [(HUViewControllerTableViewCell *)self parentViewController];

    double v5 = v10;
    if (v10 && v8)
    {
      double v9 = [(HUViewControllerTableViewCell *)self parentViewController];
      [(HUViewControllerTableViewCell *)self addToParentViewController:v9];

      double v5 = v10;
    }
  }
}

- (void)addToParentViewController:(id)a3
{
  id v10 = a3;
  double v4 = [(HUViewControllerTableViewCell *)self viewController];

  if (v4)
  {
    double v5 = [(HUViewControllerTableViewCell *)self viewController];
    [v10 addChildViewController:v5];

    double v6 = [(HUViewControllerTableViewCell *)self contentView];
    double v7 = [(HUViewControllerTableViewCell *)self viewController];
    double v8 = [v7 view];
    [v6 addSubview:v8];

    double v9 = [(HUViewControllerTableViewCell *)self viewController];
    [v9 didMoveToParentViewController:v10];
  }
  [(HUViewControllerTableViewCell *)self setParentViewController:v10];
}

- (void)removeFromParentViewController
{
}

- (void)_removeFromParentViewControllerAndClearProperty:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(HUViewControllerTableViewCell *)self viewController];
  [v5 willMoveToParentViewController:0];

  double v6 = [(HUViewControllerTableViewCell *)self viewController];
  double v7 = [v6 view];
  [v7 removeFromSuperview];

  double v8 = [(HUViewControllerTableViewCell *)self viewController];
  [v8 removeFromParentViewController];

  if (v3)
  {
    [(HUViewControllerTableViewCell *)self setParentViewController:0];
  }
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (BOOL)ignoreRounding
{
  return self->_ignoreRounding;
}

- (void)setIgnoreRounding:(BOOL)a3
{
  self->_ignoreRounding = a3;
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end