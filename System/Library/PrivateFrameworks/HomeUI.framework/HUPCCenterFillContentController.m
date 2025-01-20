@interface HUPCCenterFillContentController
- (HUPCCenterFillContentController)initWithTitle:(id)a3 detailText:(id)a4 contentView:(id)a5;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (NSLayoutConstraint)contentViewContainerHeightConstraint;
- (NSLayoutConstraint)contentViewContainerWidthConstraint;
- (NSLayoutConstraint)contentViewLeadingConstraint;
- (NSLayoutConstraint)contentViewTopConstraint;
- (NSLayoutConstraint)contentViewTrailingConstraint;
- (UIEdgeInsets)contentInsets;
- (UIView)centerFillContentView;
- (UIView)contentViewContainer;
- (double)_contentAspectRatio;
- (unint64_t)contentMode;
- (void)_updateContentViewContainerConstraints;
- (void)_updateContentViewInsetConstraints;
- (void)_viewDidUpdateContent;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setContentMode:(unint64_t)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HUPCCenterFillContentController

- (HUPCCenterFillContentController)initWithTitle:(id)a3 detailText:(id)a4 contentView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)HUPCCenterFillContentController;
  v11 = [(HUPCCenterFillContentController *)&v38 initWithContentView:0];
  v12 = v11;
  if (v11)
  {
    [(HUPCCenterFillContentController *)v11 setTitle:v8];
    [(HUPCCenterFillContentController *)v12 setSubtitle:v9];
    objc_storeStrong((id *)&v12->_centerFillContentView, a5);
    [(UIView *)v12->_centerFillContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    contentViewContainer = v12->_contentViewContainer;
    v12->_contentViewContainer = v13;

    [(UIView *)v12->_contentViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v12->_contentViewContainer addSubview:v12->_centerFillContentView];
    v12->_contentMode = 1;
    *(_OWORD *)&v12->_contentInsets.top = xmmword_1BEA19F30;
    *(_OWORD *)&v12->_contentInsets.bottom = xmmword_1BEA19F30;
    v15 = [(UIView *)v12->_contentViewContainer heightAnchor];
    uint64_t v16 = [v15 constraintEqualToConstant:1.0];
    contentViewContainerHeightConstraint = v12->_contentViewContainerHeightConstraint;
    v12->_contentViewContainerHeightConstraint = (NSLayoutConstraint *)v16;

    v18 = [(UIView *)v12->_contentViewContainer widthAnchor];
    uint64_t v19 = [v18 constraintEqualToConstant:1.0];
    contentViewContainerWidthConstraint = v12->_contentViewContainerWidthConstraint;
    v12->_contentViewContainerWidthConstraint = (NSLayoutConstraint *)v19;

    v21 = [(UIView *)v12->_centerFillContentView topAnchor];
    v22 = [(UIView *)v12->_contentViewContainer topAnchor];
    uint64_t v23 = [v21 constraintEqualToAnchor:v22];
    contentViewTopConstraint = v12->_contentViewTopConstraint;
    v12->_contentViewTopConstraint = (NSLayoutConstraint *)v23;

    v25 = [(UIView *)v12->_centerFillContentView bottomAnchor];
    v26 = [(UIView *)v12->_contentViewContainer bottomAnchor];
    uint64_t v27 = [v25 constraintEqualToAnchor:v26];
    contentViewBottomConstraint = v12->_contentViewBottomConstraint;
    v12->_contentViewBottomConstraint = (NSLayoutConstraint *)v27;

    v29 = [(UIView *)v12->_centerFillContentView leadingAnchor];
    v30 = [(UIView *)v12->_contentViewContainer leadingAnchor];
    uint64_t v31 = [v29 constraintEqualToAnchor:v30];
    contentViewLeadingConstraint = v12->_contentViewLeadingConstraint;
    v12->_contentViewLeadingConstraint = (NSLayoutConstraint *)v31;

    v33 = [(UIView *)v12->_centerFillContentView trailingAnchor];
    v34 = [(UIView *)v12->_contentViewContainer trailingAnchor];
    uint64_t v35 = [v33 constraintEqualToAnchor:v34];
    contentViewTrailingConstraint = v12->_contentViewTrailingConstraint;
    v12->_contentViewTrailingConstraint = (NSLayoutConstraint *)v35;

    [(HUPCFullCenterContentViewController *)v12 setCenteredContentView:v12->_contentViewContainer];
  }

  return v12;
}

- (void)setContentMode:(unint64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    if ([(HUPCCenterFillContentController *)self isViewLoaded])
    {
      [(HUPCCenterFillContentController *)self _updateContentViewContainerConstraints];
      [(HUPCCenterFillContentController *)self _updateContentViewInsetConstraints];
    }
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    if ([(HUPCCenterFillContentController *)self isViewLoaded])
    {
      [(HUPCCenterFillContentController *)self _updateContentViewContainerConstraints];
      [(HUPCCenterFillContentController *)self _updateContentViewInsetConstraints];
    }
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUPCCenterFillContentController;
  [(HUPCFullCenterContentViewController *)&v3 viewDidLoad];
  [(HUPCCenterFillContentController *)self _updateContentViewContainerConstraints];
  [(HUPCCenterFillContentController *)self _updateContentViewInsetConstraints];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUPCCenterFillContentController;
  [(HUPCCenterFillContentController *)&v3 viewWillLayoutSubviews];
  [(HUPCCenterFillContentController *)self _updateContentViewContainerConstraints];
}

- (double)_contentAspectRatio
{
  return 1.0;
}

- (void)_viewDidUpdateContent
{
  [(HUPCCenterFillContentController *)self _updateContentViewContainerConstraints];

  [(HUPCCenterFillContentController *)self _updateContentViewInsetConstraints];
}

- (void)_updateContentViewContainerConstraints
{
  if ([(HUPCCenterFillContentController *)self contentMode] == 1)
  {
    objc_super v3 = [(HUPCCenterFillContentController *)self contentViewContainer];
    v4 = [v3 superview];
    [v4 frame];
    double v6 = v5;

    if (v6 <= 0.0) {
      return;
    }
    [(HUPCCenterFillContentController *)self contentInsets];
    double v8 = v7;
    [(HUPCCenterFillContentController *)self contentInsets];
    double v10 = v6 - (v8 + v9);
    [(HUPCCenterFillContentController *)self _contentAspectRatio];
    double v12 = ceil(v10 / v11);
    [(HUPCCenterFillContentController *)self contentInsets];
    double v14 = v13;
    [(HUPCCenterFillContentController *)self contentInsets];
    double v16 = v12 + v14 + v15;
    v17 = [(HUPCCenterFillContentController *)self contentViewContainerWidthConstraint];
    [v17 setConstant:v6];

    v18 = [(HUPCCenterFillContentController *)self contentViewContainerWidthConstraint];
    [v18 setActive:1];

    uint64_t v19 = [(HUPCCenterFillContentController *)self contentViewContainerHeightConstraint];
    [v19 setConstant:v16];

    v20 = [(HUPCCenterFillContentController *)self contentViewContainerHeightConstraint];
    id v23 = v20;
    uint64_t v21 = 1;
  }
  else
  {
    v22 = [(HUPCCenterFillContentController *)self contentViewContainerHeightConstraint];
    [v22 setActive:0];

    v20 = [(HUPCCenterFillContentController *)self contentViewContainerWidthConstraint];
    id v23 = v20;
    uint64_t v21 = 0;
  }
  [v20 setActive:v21];
}

- (void)_updateContentViewInsetConstraints
{
  if ([(HUPCCenterFillContentController *)self contentMode] == 1)
  {
    [(HUPCCenterFillContentController *)self contentInsets];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F437F8];
    double v6 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  double v11 = [(HUPCCenterFillContentController *)self contentViewTopConstraint];
  [v11 setConstant:v4];

  double v12 = [(HUPCCenterFillContentController *)self contentViewTopConstraint];
  [v12 setActive:1];

  double v13 = [(HUPCCenterFillContentController *)self contentViewBottomConstraint];
  [v13 setConstant:-v8];

  double v14 = [(HUPCCenterFillContentController *)self contentViewBottomConstraint];
  [v14 setActive:1];

  double v15 = [(HUPCCenterFillContentController *)self contentViewLeadingConstraint];
  [v15 setConstant:v6];

  double v16 = [(HUPCCenterFillContentController *)self contentViewLeadingConstraint];
  [v16 setActive:1];

  v17 = [(HUPCCenterFillContentController *)self contentViewTrailingConstraint];
  [v17 setConstant:-v10];

  id v18 = [(HUPCCenterFillContentController *)self contentViewTrailingConstraint];
  [v18 setActive:1];
}

- (UIView)centerFillContentView
{
  return self->_centerFillContentView;
}

- (unint64_t)contentMode
{
  return self->_contentMode;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)contentViewContainer
{
  return self->_contentViewContainer;
}

- (NSLayoutConstraint)contentViewContainerHeightConstraint
{
  return self->_contentViewContainerHeightConstraint;
}

- (NSLayoutConstraint)contentViewContainerWidthConstraint
{
  return self->_contentViewContainerWidthConstraint;
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (NSLayoutConstraint)contentViewLeadingConstraint
{
  return self->_contentViewLeadingConstraint;
}

- (NSLayoutConstraint)contentViewTrailingConstraint
{
  return self->_contentViewTrailingConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewContainer, 0);

  objc_storeStrong((id *)&self->_centerFillContentView, 0);
}

@end