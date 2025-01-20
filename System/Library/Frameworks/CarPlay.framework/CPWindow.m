@interface CPWindow
- (CPTemplateApplicationScene)templateApplicationScene;
- (CPWindow)initWithFrame:(CGRect)a3 templateScene:(id)a4;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)leftConstraint;
- (NSLayoutConstraint)rightConstraint;
- (NSLayoutConstraint)topConstraint;
- (UILayoutGuide)mapButtonSafeAreaLayoutGuide;
- (void)setBottomConstraint:(id)a3;
- (void)setLeftConstraint:(id)a3;
- (void)setRightConstraint:(id)a3;
- (void)setTemplateApplicationScene:(CPTemplateApplicationScene *)templateApplicationScene;
- (void)setTopConstraint:(id)a3;
- (void)updateLayoutGuideWithInsets:(UIEdgeInsets)a3;
@end

@implementation CPWindow

- (CPWindow)initWithFrame:(CGRect)a3 templateScene:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v38[4] = *MEMORY[0x263EF8340];
  id v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CPWindow;
  v10 = -[CPWindow initWithFrame:](&v37, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_templateApplicationScene, v9);
    v12 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    [(CPWindow *)v11 addLayoutGuide:v12];
    mapButtonSafeAreaLayoutGuide = v11->_mapButtonSafeAreaLayoutGuide;
    v11->_mapButtonSafeAreaLayoutGuide = v12;
    v14 = v12;

    v15 = [(CPWindow *)v11 topAnchor];
    v16 = [(UILayoutGuide *)v14 topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:0.0];

    v18 = [(CPWindow *)v11 bottomAnchor];
    v19 = [(UILayoutGuide *)v14 bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:0.0];

    v21 = [(CPWindow *)v11 leftAnchor];
    v22 = [(UILayoutGuide *)v14 leftAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:0.0];

    v24 = [(CPWindow *)v11 rightAnchor];
    v25 = [(UILayoutGuide *)v14 rightAnchor];
    uint64_t v26 = [v24 constraintEqualToAnchor:v25 constant:0.0];

    v27 = (void *)MEMORY[0x263F08938];
    v38[0] = v17;
    v38[1] = v20;
    v38[2] = v23;
    v38[3] = v26;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];
    [v27 activateConstraints:v28];

    topConstraint = v11->_topConstraint;
    v11->_topConstraint = v17;
    v30 = v17;

    bottomConstraint = v11->_bottomConstraint;
    v11->_bottomConstraint = v20;
    v32 = v20;

    leftConstraint = v11->_leftConstraint;
    v11->_leftConstraint = v23;
    v34 = v23;

    rightConstraint = v11->_rightConstraint;
    v11->_rightConstraint = (NSLayoutConstraint *)v26;
  }
  return v11;
}

- (void)updateLayoutGuideWithInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v8 = [(CPWindow *)self topConstraint];
  [v8 setConstant:-top];

  id v9 = [(CPWindow *)self bottomConstraint];
  [v9 setConstant:bottom];

  v10 = [(CPWindow *)self leftConstraint];
  [v10 setConstant:-left];

  v11 = [(CPWindow *)self rightConstraint];
  [v11 setConstant:right];

  [(CPWindow *)self setNeedsUpdateConstraints];
  [(CPWindow *)self updateConstraintsIfNeeded];
  double v12 = *MEMORY[0x263F1D4D8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__CPWindow_updateLayoutGuideWithInsets___block_invoke;
  v13[3] = &unk_264309D80;
  v13[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v13 animations:v12];
}

uint64_t __40__CPWindow_updateLayoutGuideWithInsets___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (CPTemplateApplicationScene)templateApplicationScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateApplicationScene);

  return (CPTemplateApplicationScene *)WeakRetained;
}

- (void)setTemplateApplicationScene:(CPTemplateApplicationScene *)templateApplicationScene
{
}

- (UILayoutGuide)mapButtonSafeAreaLayoutGuide
{
  return self->_mapButtonSafeAreaLayoutGuide;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)leftConstraint
{
  return self->_leftConstraint;
}

- (void)setLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)rightConstraint
{
  return self->_rightConstraint;
}

- (void)setRightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_mapButtonSafeAreaLayoutGuide, 0);

  objc_destroyWeak((id *)&self->_templateApplicationScene);
}

@end