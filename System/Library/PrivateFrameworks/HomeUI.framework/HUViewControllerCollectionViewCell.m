@interface HUViewControllerCollectionViewCell
- (BOOL)allowSelfSizing;
- (BOOL)useDefaultCellBackgroundColor;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIViewController)parentViewController;
- (UIViewController)viewController;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_removeFromParentViewControllerAndClearProperty:(BOOL)a3;
- (void)addToParentViewController:(id)a3;
- (void)prepareForReuse;
- (void)removeFromParentViewController;
- (void)setAllowSelfSizing:(BOOL)a3;
- (void)setParentViewController:(id)a3;
- (void)setUseDefaultCellBackgroundColor:(BOOL)a3;
- (void)setViewController:(id)a3;
@end

@implementation HUViewControllerCollectionViewCell

- (void)setViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  if (self->_viewController != v5)
  {
    v10 = v5;
    v6 = [(HUViewControllerCollectionViewCell *)self parentViewController];
    if (v6)
    {
      viewController = self->_viewController;

      if (viewController) {
        [(HUViewControllerCollectionViewCell *)self _removeFromParentViewControllerAndClearProperty:0];
      }
    }
    objc_storeStrong((id *)&self->_viewController, a3);
    v8 = [(HUViewControllerCollectionViewCell *)self parentViewController];

    v5 = v10;
    if (v10 && v8)
    {
      v9 = [(HUViewControllerCollectionViewCell *)self parentViewController];
      [(HUViewControllerCollectionViewCell *)self addToParentViewController:v9];

      v5 = v10;
    }
  }
}

- (void)prepareForReuse
{
  [(HUViewControllerCollectionViewCell *)self setViewController:0];
  [(HUViewControllerCollectionViewCell *)self setParentViewController:0];
  v3.receiver = self;
  v3.super_class = (Class)HUViewControllerCollectionViewCell;
  [(HUViewControllerCollectionViewCell *)&v3 prepareForReuse];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  if (![(HUViewControllerCollectionViewCell *)self allowSelfSizing])
  {
    v45.receiver = self;
    v45.super_class = (Class)HUViewControllerCollectionViewCell;
    *(float *)&double v10 = a4;
    *(float *)&double v11 = a5;
    -[HUViewControllerCollectionViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v45, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
    double v30 = v43;
    double v32 = v44;
LABEL_6:
    double v41 = v30;
    double v42 = v32;
    goto LABEL_7;
  }
  v12 = [(HUViewControllerCollectionViewCell *)self viewController];
  v13 = [v12 view];
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  v22 = [(HUViewControllerCollectionViewCell *)self viewController];
  v23 = [v22 view];
  objc_msgSend(v23, "setFrame:", v15, v17, width, v21);

  v24 = [(HUViewControllerCollectionViewCell *)self viewController];
  v25 = [v24 view];
  [v25 layoutIfNeeded];

  v26 = [(HUViewControllerCollectionViewCell *)self viewController];
  v27 = [v26 view];
  objc_msgSend(v27, "setFrame:", v15, v17, v19, v21);

  v28 = [(HUViewControllerCollectionViewCell *)self viewController];
  [v28 preferredContentSize];
  double v30 = v29;
  double v32 = v31;

  if (*MEMORY[0x1E4F1DB30] != v30 || *(double *)(MEMORY[0x1E4F1DB30] + 8) != v32) {
    goto LABEL_6;
  }
  v33 = [(HUViewControllerCollectionViewCell *)self viewController];
  v34 = [v33 view];
  *(float *)&double v35 = a4;
  *(float *)&double v36 = a5;
  objc_msgSend(v34, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v35, v36);
  double v38 = v37;
  double v40 = v39;

  double v41 = v38;
  double v42 = v40;
LABEL_7:
  result.double height = v42;
  result.double width = v41;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  if ([(HUViewControllerCollectionViewCell *)self allowSelfSizing])
  {
    v8.receiver = self;
    v8.super_class = (Class)HUViewControllerCollectionViewCell;
    id v5 = [(HUViewControllerCollectionViewCell *)&v8 preferredLayoutAttributesFittingAttributes:v4];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (void)addToParentViewController:(id)a3
{
  id v25 = a3;
  id v4 = [(HUViewControllerCollectionViewCell *)self viewController];
  [v25 addChildViewController:v4];

  if ([(HUViewControllerCollectionViewCell *)self useDefaultCellBackgroundColor]) {
    [MEMORY[0x1E4F428B8] tableCellGroupedBackgroundColor];
  }
  else {
  id v5 = [MEMORY[0x1E4F428B8] clearColor];
  }
  [(HUViewControllerCollectionViewCell *)self setBackgroundColor:v5];

  v6 = [MEMORY[0x1E4F428B8] clearColor];
  v7 = [(HUViewControllerCollectionViewCell *)self contentView];
  [v7 setBackgroundColor:v6];

  objc_super v8 = [(HUViewControllerCollectionViewCell *)self contentView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [(HUViewControllerCollectionViewCell *)self viewController];
  double v18 = [v17 view];
  objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

  double v19 = [(HUViewControllerCollectionViewCell *)self viewController];
  double v20 = [v19 view];
  [v20 setAutoresizingMask:18];

  double v21 = [(HUViewControllerCollectionViewCell *)self contentView];
  v22 = [(HUViewControllerCollectionViewCell *)self viewController];
  v23 = [v22 view];
  [v21 insertSubview:v23 atIndex:0];

  v24 = [(HUViewControllerCollectionViewCell *)self viewController];
  [v24 didMoveToParentViewController:v25];

  [(HUViewControllerCollectionViewCell *)self setParentViewController:v25];
}

- (void)removeFromParentViewController
{
}

- (void)_removeFromParentViewControllerAndClearProperty:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HUViewControllerCollectionViewCell *)self viewController];
  [v5 willMoveToParentViewController:0];

  v6 = [(HUViewControllerCollectionViewCell *)self viewController];
  v7 = [v6 view];
  [v7 removeFromSuperview];

  objc_super v8 = [(HUViewControllerCollectionViewCell *)self viewController];
  [v8 removeFromParentViewController];

  if (v3)
  {
    [(HUViewControllerCollectionViewCell *)self setParentViewController:0];
  }
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (BOOL)allowSelfSizing
{
  return self->_allowSelfSizing;
}

- (void)setAllowSelfSizing:(BOOL)a3
{
  self->_allowSelfSizing = a3;
}

- (BOOL)useDefaultCellBackgroundColor
{
  return self->_useDefaultCellBackgroundColor;
}

- (void)setUseDefaultCellBackgroundColor:(BOOL)a3
{
  self->_useDefaultCellBackgroundColor = a3;
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