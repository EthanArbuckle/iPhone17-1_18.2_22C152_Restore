@interface HUCenterFillOBWelcomeController
- (BOOL)_limitToNonScrollingContentHeight;
- (CGSize)maxSize;
- (HUCenterFillOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (HUCenterFillOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (HUCenterFillOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6;
- (HUCenterFillOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
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
- (void)setMaxSize:(CGSize)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HUCenterFillOBWelcomeController

- (HUCenterFillOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6
{
  id v11 = a6;
  v40.receiver = self;
  v40.super_class = (Class)HUCenterFillOBWelcomeController;
  v12 = [(HUCenterFillOBWelcomeController *)&v40 initWithTitle:a3 detailText:a4 icon:a5 contentLayout:2];
  v13 = v12;
  if (v12)
  {
    p_centerFillContentView = (id *)&v12->_centerFillContentView;
    objc_storeStrong((id *)&v12->_centerFillContentView, a6);
    [*p_centerFillContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    contentViewContainer = v13->_contentViewContainer;
    v13->_contentViewContainer = v15;

    [(UIView *)v13->_contentViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v13->_contentViewContainer addSubview:*p_centerFillContentView];
    v13->_contentMode = 1;
    *(_OWORD *)&v13->_contentInsets.top = xmmword_1BEA19F30;
    *(_OWORD *)&v13->_contentInsets.bottom = xmmword_1BEA19F30;
    v13->_maxSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v17 = [(UIView *)v13->_contentViewContainer heightAnchor];
    uint64_t v18 = [v17 constraintEqualToConstant:1.0];
    contentViewContainerHeightConstraint = v13->_contentViewContainerHeightConstraint;
    v13->_contentViewContainerHeightConstraint = (NSLayoutConstraint *)v18;

    v20 = [(UIView *)v13->_contentViewContainer widthAnchor];
    uint64_t v21 = [v20 constraintEqualToConstant:1.0];
    contentViewContainerWidthConstraint = v13->_contentViewContainerWidthConstraint;
    v13->_contentViewContainerWidthConstraint = (NSLayoutConstraint *)v21;

    v23 = [*p_centerFillContentView topAnchor];
    v24 = [(UIView *)v13->_contentViewContainer topAnchor];
    uint64_t v25 = [v23 constraintEqualToAnchor:v24];
    contentViewTopConstraint = v13->_contentViewTopConstraint;
    v13->_contentViewTopConstraint = (NSLayoutConstraint *)v25;

    v27 = [*p_centerFillContentView bottomAnchor];
    v28 = [(UIView *)v13->_contentViewContainer bottomAnchor];
    uint64_t v29 = [v27 constraintEqualToAnchor:v28];
    contentViewBottomConstraint = v13->_contentViewBottomConstraint;
    v13->_contentViewBottomConstraint = (NSLayoutConstraint *)v29;

    v31 = [*p_centerFillContentView leadingAnchor];
    v32 = [(UIView *)v13->_contentViewContainer leadingAnchor];
    uint64_t v33 = [v31 constraintEqualToAnchor:v32];
    contentViewLeadingConstraint = v13->_contentViewLeadingConstraint;
    v13->_contentViewLeadingConstraint = (NSLayoutConstraint *)v33;

    v35 = [*p_centerFillContentView trailingAnchor];
    v36 = [(UIView *)v13->_contentViewContainer trailingAnchor];
    uint64_t v37 = [v35 constraintEqualToAnchor:v36];
    contentViewTrailingConstraint = v13->_contentViewTrailingConstraint;
    v13->_contentViewTrailingConstraint = (NSLayoutConstraint *)v37;

    [(OBWelcomeFullCenterContentController *)v13 setCenteredContentView:v13->_contentViewContainer];
  }

  return v13;
}

- (HUCenterFillOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithTitle_detailText_icon_contentView_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCenterFillOBWelcomeController.m", 75, @"%s is unavailable; use %@ instead",
    "-[HUCenterFillOBWelcomeController initWithTitle:detailText:symbolName:contentLayout:]",
    v9);

  return 0;
}

- (HUCenterFillOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithTitle_detailText_icon_contentView_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCenterFillOBWelcomeController.m", 80, @"%s is unavailable; use %@ instead",
    "-[HUCenterFillOBWelcomeController initWithTitle:detailText:icon:contentLayout:]",
    v9);

  return 0;
}

- (HUCenterFillOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithTitle_detailText_icon_contentView_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCenterFillOBWelcomeController.m", 85, @"%s is unavailable; use %@ instead",
    "-[HUCenterFillOBWelcomeController initWithTitle:detailText:icon:]",
    v8);

  return 0;
}

- (void)setContentMode:(unint64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    if ([(HUCenterFillOBWelcomeController *)self isViewLoaded])
    {
      [(HUCenterFillOBWelcomeController *)self _updateContentViewContainerConstraints];
      [(HUCenterFillOBWelcomeController *)self _updateContentViewInsetConstraints];
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
    if ([(HUCenterFillOBWelcomeController *)self isViewLoaded])
    {
      [(HUCenterFillOBWelcomeController *)self _updateContentViewContainerConstraints];
      [(HUCenterFillOBWelcomeController *)self _updateContentViewInsetConstraints];
    }
  }
}

- (void)setMaxSize:(CGSize)a3
{
  if (self->_maxSize.width != a3.width || self->_maxSize.height != a3.height)
  {
    self->_maxSize = a3;
    if ([(HUCenterFillOBWelcomeController *)self isViewLoaded])
    {
      [(HUCenterFillOBWelcomeController *)self _updateContentViewContainerConstraints];
      [(HUCenterFillOBWelcomeController *)self _updateContentViewInsetConstraints];
    }
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUCenterFillOBWelcomeController;
  [(OBWelcomeFullCenterContentController *)&v3 viewDidLoad];
  [(HUCenterFillOBWelcomeController *)self _updateContentViewContainerConstraints];
  [(HUCenterFillOBWelcomeController *)self _updateContentViewInsetConstraints];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUCenterFillOBWelcomeController;
  [(HUCenterFillOBWelcomeController *)&v3 viewWillLayoutSubviews];
  [(HUCenterFillOBWelcomeController *)self _updateContentViewContainerConstraints];
}

- (double)_contentAspectRatio
{
  return 1.0;
}

- (void)_viewDidUpdateContent
{
  [(HUCenterFillOBWelcomeController *)self _updateContentViewContainerConstraints];

  [(HUCenterFillOBWelcomeController *)self _updateContentViewInsetConstraints];
}

- (BOOL)_limitToNonScrollingContentHeight
{
  return 0;
}

- (void)_updateContentViewContainerConstraints
{
  if ([(HUCenterFillOBWelcomeController *)self contentMode] != 1)
  {
    v8 = [(HUCenterFillOBWelcomeController *)self contentViewContainerHeightConstraint];
    [v8 setActive:0];

    v9 = [(HUCenterFillOBWelcomeController *)self contentViewContainerWidthConstraint];
    id v34 = v9;
    uint64_t v10 = 0;
LABEL_14:
    [v9 setActive:v10];

    return;
  }
  [(HUCenterFillOBWelcomeController *)self maxSize];
  if (v3 > 0.0)
  {
    [(HUCenterFillOBWelcomeController *)self maxSize];
    double v7 = v11;
  }
  else
  {
    v4 = [(HUCenterFillOBWelcomeController *)self contentViewContainer];
    v5 = [v4 superview];
    [v5 frame];
    double v7 = v6;
  }
  [(HUCenterFillOBWelcomeController *)self maxSize];
  if (v12 <= 0.0)
  {
    [(HUCenterFillOBWelcomeController *)self availableContentViewHeight];
    double v14 = v15;
  }
  else
  {
    [(HUCenterFillOBWelcomeController *)self maxSize];
    double v14 = v13;
  }
  if (v7 > 0.0)
  {
    [(HUCenterFillOBWelcomeController *)self contentInsets];
    double v17 = v16;
    [(HUCenterFillOBWelcomeController *)self contentInsets];
    double v19 = v7 - (v17 + v18);
    [(HUCenterFillOBWelcomeController *)self _contentAspectRatio];
    double v21 = ceil(v19 / v20);
    [(HUCenterFillOBWelcomeController *)self contentInsets];
    double v23 = v22;
    [(HUCenterFillOBWelcomeController *)self contentInsets];
    double v25 = v21 + v23 + v24;
    if (v25 > v14
      && [(HUCenterFillOBWelcomeController *)self _limitToNonScrollingContentHeight])
    {
      [(HUCenterFillOBWelcomeController *)self contentInsets];
      double v27 = v26;
      [(HUCenterFillOBWelcomeController *)self contentInsets];
      double v29 = v14 - (v27 + v28);
      [(HUCenterFillOBWelcomeController *)self _contentAspectRatio];
      double v7 = ceil(v30 * v29);
      double v25 = v14;
    }
    v31 = [(HUCenterFillOBWelcomeController *)self contentViewContainerWidthConstraint];
    [v31 setConstant:v7];

    v32 = [(HUCenterFillOBWelcomeController *)self contentViewContainerWidthConstraint];
    [v32 setActive:1];

    uint64_t v33 = [(HUCenterFillOBWelcomeController *)self contentViewContainerHeightConstraint];
    [v33 setConstant:v25];

    v9 = [(HUCenterFillOBWelcomeController *)self contentViewContainerHeightConstraint];
    id v34 = v9;
    uint64_t v10 = 1;
    goto LABEL_14;
  }
}

- (void)_updateContentViewInsetConstraints
{
  if ([(HUCenterFillOBWelcomeController *)self contentMode] == 1)
  {
    [(HUCenterFillOBWelcomeController *)self contentInsets];
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
  double v11 = [(HUCenterFillOBWelcomeController *)self contentViewTopConstraint];
  [v11 setConstant:v4];

  double v12 = [(HUCenterFillOBWelcomeController *)self contentViewTopConstraint];
  [v12 setActive:1];

  double v13 = [(HUCenterFillOBWelcomeController *)self contentViewBottomConstraint];
  [v13 setConstant:-v8];

  double v14 = [(HUCenterFillOBWelcomeController *)self contentViewBottomConstraint];
  [v14 setActive:1];

  double v15 = [(HUCenterFillOBWelcomeController *)self contentViewLeadingConstraint];
  [v15 setConstant:v6];

  double v16 = [(HUCenterFillOBWelcomeController *)self contentViewLeadingConstraint];
  [v16 setActive:1];

  double v17 = [(HUCenterFillOBWelcomeController *)self contentViewTrailingConstraint];
  [v17 setConstant:-v10];

  id v18 = [(HUCenterFillOBWelcomeController *)self contentViewTrailingConstraint];
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

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
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