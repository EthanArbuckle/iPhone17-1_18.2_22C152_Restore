@interface HUQuickControlCollectionViewCellContainerViewController
+ (id)intrinsicSizeDescriptorControlSizeDescriptor:(id)a3 titlePosition:(unint64_t)a4;
- (BOOL)_canShowWhileLocked;
- (HUQuickControlCollectionViewCellContainerViewController)initWithContentViewController:(id)a3;
- (HUQuickControlViewController)contentViewController;
- (UIEdgeInsets)preferredContentLayoutFrameInset;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (unint64_t)titlePosition;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setPreferredContentLayoutFrameInset:(UIEdgeInsets)a3;
- (void)setTitle:(id)a3;
- (void)setTitlePosition:(unint64_t)a3;
@end

@implementation HUQuickControlCollectionViewCellContainerViewController

- (HUQuickControlCollectionViewCellContainerViewController)initWithContentViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlCollectionViewCellContainerViewController;
  v6 = [(HUQuickControlCollectionViewCellContainerViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentViewController, a3);
    v7->_titlePosition = 0;
  }

  return v7;
}

- (void)loadView
{
  v3 = [(HUQuickControlCollectionViewCellContainerViewController *)self contentViewController];
  [(HUQuickControlCollectionViewCellContainerViewController *)self addChildViewController:v3];

  v4 = [HUQuickControlCollectionViewCellContainerView alloc];
  unint64_t v5 = [(HUQuickControlCollectionViewCellContainerViewController *)self titlePosition];
  v6 = -[HUQuickControlCollectionViewCellContainerView initWithFrame:titlePosition:](v4, "initWithFrame:titlePosition:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HUQuickControlCollectionViewCellContainerViewController *)self setView:v6];

  v7 = [(HUQuickControlCollectionViewCellContainerViewController *)self contentViewController];
  v8 = [v7 view];
  objc_super v9 = [(HUQuickControlCollectionViewCellContainerViewController *)self view];
  [v9 setContentView:v8];

  v10 = [(HUQuickControlCollectionViewCellContainerViewController *)self title];
  v11 = [(HUQuickControlCollectionViewCellContainerViewController *)self view];
  [v11 setTitle:v10];

  [(HUQuickControlCollectionViewCellContainerViewController *)self preferredContentLayoutFrameInset];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(HUQuickControlCollectionViewCellContainerViewController *)self view];
  objc_msgSend(v20, "setPreferredContentLayoutFrameInset:", v13, v15, v17, v19);

  v21 = [(HUQuickControlCollectionViewCellContainerViewController *)self view];
  v22 = [v21 preferredContentFrameLayoutGuide];
  v23 = [(HUQuickControlCollectionViewCellContainerViewController *)self contentViewController];
  [v23 setPreferredFrameLayoutGuide:v22];

  v24 = [(HUQuickControlCollectionViewCellContainerViewController *)self contentViewController];
  [v24 didMoveToParentViewController:self];

  double v25 = *MEMORY[0x1E4F437F8];
  double v26 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v27 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v28 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  id v30 = [(HUQuickControlCollectionViewCellContainerViewController *)self contentViewController];
  v29 = [v30 view];
  objc_msgSend(v29, "setLayoutMargins:", v25, v26, v27, v28);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setTitle:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlCollectionViewCellContainerViewController;
  id v4 = a3;
  [(HUQuickControlCollectionViewCellContainerViewController *)&v6 setTitle:v4];
  unint64_t v5 = [(HUQuickControlCollectionViewCellContainerViewController *)self viewIfLoaded];
  [v5 setTitle:v4];
}

- (void)setTitlePosition:(unint64_t)a3
{
  self->_titlePosition = a3;
  unint64_t v5 = [(HUQuickControlCollectionViewCellContainerViewController *)self viewIfLoaded];
  [v5 setTitlePosition:a3];

  if ([MEMORY[0x1E4F69758] isAMac])
  {
    id v6 = [(HUQuickControlCollectionViewCellContainerViewController *)self view];
    [v6 setTitlePosition:a3];
  }
}

- (void)setPreferredContentLayoutFrameInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  self->_preferredContentLayoutFrameInset = a3;
  id v7 = [(HUQuickControlCollectionViewCellContainerViewController *)self viewIfLoaded];
  objc_msgSend(v7, "setPreferredContentLayoutFrameInset:", top, left, bottom, right);
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  unint64_t v5 = [(HUQuickControlCollectionViewCellContainerViewController *)self contentViewController];
  id v6 = [v5 intrinsicSizeDescriptorForControlSize:a3];

  id v7 = objc_msgSend((id)objc_opt_class(), "intrinsicSizeDescriptorControlSizeDescriptor:titlePosition:", v6, -[HUQuickControlCollectionViewCellContainerViewController titlePosition](self, "titlePosition"));

  return v7;
}

+ (id)intrinsicSizeDescriptorControlSizeDescriptor:(id)a3 titlePosition:(unint64_t)a4
{
  id v5 = a3;
  [v5 intrinsicSize];
  id v6 = v5;
  if (v7 != *MEMORY[0x1E4F43ED8])
  {
    [v5 intrinsicSize];
    double v9 = v8;
    double v11 = v10;
    +[HUQuickControlCollectionViewCellContainerView preferredChromeHeightForTitlePosition:a4];
    id v6 = +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", [v5 flexType], v9, v11 + v12);
  }

  return v6;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)HUQuickControlCollectionViewCellContainerViewController;
  id v4 = a3;
  [(HUQuickControlCollectionViewCellContainerViewController *)&v17 preferredContentSizeDidChangeForChildContentContainer:v4];
  id v5 = [(HUQuickControlCollectionViewCellContainerViewController *)self contentViewController];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    [(HUQuickControlCollectionViewCellContainerViewController *)self preferredContentSize];
    double v8 = v7;
    double v10 = v9;
    double v11 = [(HUQuickControlCollectionViewCellContainerViewController *)self contentViewController];
    [v11 preferredContentSize];
    double v13 = v12;
    double v15 = v14;

    if (v8 != v13 || v10 != v15)
    {
      double v16 = [(HUQuickControlCollectionViewCellContainerViewController *)self contentViewController];
      [v16 preferredContentSize];
      -[HUQuickControlCollectionViewCellContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
  }
}

- (unint64_t)titlePosition
{
  return self->_titlePosition;
}

- (UIEdgeInsets)preferredContentLayoutFrameInset
{
  double top = self->_preferredContentLayoutFrameInset.top;
  double left = self->_preferredContentLayoutFrameInset.left;
  double bottom = self->_preferredContentLayoutFrameInset.bottom;
  double right = self->_preferredContentLayoutFrameInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (HUQuickControlViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
}

@end