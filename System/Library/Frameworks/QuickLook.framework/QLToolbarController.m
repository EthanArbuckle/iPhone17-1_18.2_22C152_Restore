@interface QLToolbarController
- (BOOL)_tryToSetUp:(BOOL)a3;
- (BOOL)isAccessoryViewHidden;
- (BOOL)isHidden;
- (BOOL)isOriginalToolbarHidden;
- (QLToolbarController)init;
- (UIColor)barTintColor;
- (UIToolbar)customToolbar;
- (UIToolbar)originalToolbar;
- (UIView)accessoryView;
- (UIView)preferredParentViewForSafeAreaInset;
- (UIView)preferredSuperview;
- (double)_computeClippingExtensionContainerBottomConstraint;
- (double)_computeClippingExtensionContainerHeightForCurrentHiddenProgress;
- (double)_originalToolbarHeightIncludingSafeAreaBottomInset:(BOOL)a3;
- (double)_toolbarExtensionHeight;
- (double)_toolbarSafeAreaInsetBottom;
- (double)_totalHeight;
- (double)accessoryViewAlpha;
- (double)accessoryViewHiddenProgress;
- (double)hiddenProgress;
- (double)originalToolbarAlpha;
- (double)preferredAccesoryViewHeight;
- (double)toolbarAlpha;
- (void)_embedAccessoryView;
- (void)_layoutAccessoryView:(id)a3;
- (void)restoreOriginalConfiguration;
- (void)restoreOriginalToolbar;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryView:(id)a3 animated:(BOOL)a4;
- (void)setAccessoryViewAlpha:(double)a3;
- (void)setAccessoryViewHidden:(BOOL)a3;
- (void)setAccessoryViewHiddenProgress:(double)a3;
- (void)setBarTintColor:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHiddenProgress:(double)a3;
- (void)setOriginalToolbar:(id)a3;
- (void)setOriginalToolbarAlpha:(double)a3;
- (void)setOriginalToolbarHidden:(BOOL)a3;
- (void)setPreferredAccesoryViewHeight:(double)a3;
- (void)setPreferredSuperview:(id)a3 preferredParentViewForSafeAreaInset:(id)a4;
- (void)setToolbarAlpha:(double)a3;
- (void)updateLayout;
@end

@implementation QLToolbarController

- (QLToolbarController)init
{
  v3.receiver = self;
  v3.super_class = (Class)QLToolbarController;
  result = [(QLToolbarController *)&v3 init];
  if (result)
  {
    result->_preferredAccesoryViewHeight = 44.0;
    result->_accessoryViewHidden = 1;
  }
  return result;
}

- (BOOL)_tryToSetUp:(BOOL)a3
{
  if (self->_customToolbar) {
    BOOL v4 = !a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_originalToolbar);

    if (!WeakRetained) {
      return 0;
    }
    v6 = [(QLToolbarController *)self preferredSuperview];
    if (!v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_originalToolbar);
      v6 = [v7 superview];

      if (!v6) {
        return 0;
      }
    }
    [(QLToolbarController *)self _originalToolbarHeightIncludingSafeAreaBottomInset:1];
    double v9 = v8;
    customToolbar = self->_customToolbar;
    if (!customToolbar)
    {
      v11 = (UIToolbar *)objc_opt_new();
      v12 = self->_customToolbar;
      self->_customToolbar = v11;

      [(UIToolbar *)self->_customToolbar setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIToolbar *)self->_customToolbar setAccessibilityIdentifier:@"QLCustomToolBarAccessibilityIdentifier"];
      customToolbar = self->_customToolbar;
    }
    v13 = [(UIToolbar *)customToolbar constraints];
    [(UIToolbar *)customToolbar removeConstraints:v13];

    uint64_t v14 = [(QLToolbarController *)self preferredSuperview];
    if (!v14) {
      goto LABEL_12;
    }
    v15 = (void *)v14;
    v16 = [(QLToolbarController *)self preferredSuperview];
    id v17 = objc_loadWeakRetained((id *)&self->_originalToolbar);
    int v18 = [v16 containsView:v17];

    if (!v18)
    {
      [v6 addSubview:self->_customToolbar];
    }
    else
    {
LABEL_12:
      v19 = self->_customToolbar;
      id v20 = objc_loadWeakRetained((id *)&self->_originalToolbar);
      [v6 insertSubview:v19 belowSubview:v20];
    }
    v22 = (void *)MEMORY[0x263F08938];
    v23 = _NSDictionaryOfVariableBindings(&cfstr_Customtoolbar.isa, self->_customToolbar, 0);
    v24 = [v22 constraintsWithVisualFormat:@"H:|[_customToolbar]|" options:0 metrics:0 views:v23];
    [v6 addConstraints:v24];

    v25 = [MEMORY[0x263F08938] constraintWithItem:self->_customToolbar attribute:4 relatedBy:0 toItem:v6 attribute:4 multiplier:1.0 constant:0.0];
    objc_msgSend(v25, "ql_activatedConstraint");
    v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    toolbarBottomConstraint = self->_toolbarBottomConstraint;
    self->_toolbarBottomConstraint = v26;

    v28 = [MEMORY[0x263F08938] constraintWithItem:self->_customToolbar attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v9];
    objc_msgSend(v28, "ql_activatedConstraint");
    v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    toolbarHeightConstraint = self->_toolbarHeightConstraint;
    self->_toolbarHeightConstraint = v29;

    v31 = (UIView *)objc_opt_new();
    clippingExtensionContainer = self->_clippingExtensionContainer;
    self->_clippingExtensionContainer = v31;

    [(UIView *)self->_clippingExtensionContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIToolbar *)self->_customToolbar addSubview:self->_clippingExtensionContainer];
    [(UIView *)self->_clippingExtensionContainer setClipsToBounds:1];
    v33 = self->_customToolbar;
    v34 = (void *)MEMORY[0x263F08938];
    v35 = _NSDictionaryOfVariableBindings(&cfstr_Clippingextens.isa, self->_clippingExtensionContainer, 0);
    v36 = [v34 constraintsWithVisualFormat:@"H:|[_clippingExtensionContainer]|" options:0 metrics:0 views:v35];
    [(UIToolbar *)v33 addConstraints:v36];

    v37 = [MEMORY[0x263F08938] constraintWithItem:self->_clippingExtensionContainer attribute:4 relatedBy:0 toItem:self->_customToolbar attribute:4 multiplier:1.0 constant:-v9];
    objc_msgSend(v37, "ql_activatedConstraint");
    v38 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    clippingExtensionContainerBottomConstraint = self->_clippingExtensionContainerBottomConstraint;
    self->_clippingExtensionContainerBottomConstraint = v38;

    v40 = [MEMORY[0x263F08938] constraintWithItem:self->_clippingExtensionContainer attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:0.0];
    objc_msgSend(v40, "ql_activatedConstraint");
    v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    clippingExtensionContainerHeightConstraint = self->_clippingExtensionContainerHeightConstraint;
    self->_clippingExtensionContainerHeightConstraint = v41;

    v43 = (UIView *)objc_opt_new();
    accessoryViewContainer = self->_accessoryViewContainer;
    self->_accessoryViewContainer = v43;

    [(UIView *)self->_accessoryViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_clippingExtensionContainer addSubview:self->_accessoryViewContainer];
    v45 = (void *)MEMORY[0x263F08938];
    v46 = self->_clippingExtensionContainer;
    v47 = _NSDictionaryOfVariableBindings(&cfstr_Accessoryviewc.isa, self->_accessoryViewContainer, 0);
    v48 = [v45 constraintsWithVisualFormat:@"H:|[_accessoryViewContainer]|" options:0 metrics:0 views:v47];
    [(UIView *)v46 addConstraints:v48];

    v49 = (void *)MEMORY[0x263F08938];
    v50 = self->_clippingExtensionContainer;
    v51 = _NSDictionaryOfVariableBindings(&cfstr_Accessoryviewc.isa, self->_accessoryViewContainer, 0);
    v52 = [v49 constraintsWithVisualFormat:@"V:[_accessoryViewContainer]|" options:0 metrics:0 views:v51];
    [(UIView *)v50 addConstraints:v52];

    [(QLToolbarController *)self _toolbarExtensionHeight];
    self->_derivedToolbarExtensionHeight = v53;
    v54 = [MEMORY[0x263F08938] constraintWithItem:self->_accessoryViewContainer attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v53];
    objc_msgSend(v54, "ql_activatedConstraint");
    v55 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    accessoryContainerHeightConstraint = self->_accessoryContainerHeightConstraint;
    self->_accessoryContainerHeightConstraint = v55;

    [(UIToolbar *)self->_customToolbar layoutIfNeeded];
    id v57 = objc_loadWeakRetained((id *)&self->_accessoryView);

    if (v57)
    {
      [(QLToolbarController *)self _embedAccessoryView];
      [(UIToolbar *)self->_customToolbar bringSubviewToFront:self->_clippingExtensionContainer];
    }
    [(QLToolbarController *)self updateLayout];
  }
  if (!self->_originalToolbarConfiguration)
  {
    id v58 = objc_loadWeakRetained((id *)&self->_originalToolbar);
    v59 = [v58 configuration];
    originalToolbarConfiguration = self->_originalToolbarConfiguration;
    self->_originalToolbarConfiguration = v59;

    v61 = (_UIToolbarConfiguration *)[(_UIToolbarConfiguration *)self->_originalToolbarConfiguration copy];
    customToolbarConfiguration = self->_customToolbarConfiguration;
    self->_customToolbarConfiguration = v61;

    [(_UIToolbarConfiguration *)self->_customToolbarConfiguration setBarTintColor:self->_barTintColor];
    [(UIToolbar *)self->_customToolbar configureWithConfiguration:self->_customToolbarConfiguration];
    id v63 = objc_loadWeakRetained((id *)&self->_originalToolbar);
    [v63 configureTransparent];
  }
  return 1;
}

- (double)_toolbarSafeAreaInsetBottom
{
  p_preferredParentViewForSafeAreaInset = &self->_preferredParentViewForSafeAreaInset;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredParentViewForSafeAreaInset);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_preferredParentViewForSafeAreaInset);
    [v5 safeAreaInsets];
    double v7 = v6;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)&self->_originalToolbar);
    double v8 = [v5 superview];
    [v8 safeAreaInsets];
    double v7 = v9;
  }
  return v7;
}

- (double)_computeClippingExtensionContainerBottomConstraint
{
  BOOL v3 = [(QLToolbarController *)self isOriginalToolbarHidden];
  BOOL v4 = [(QLToolbarController *)self isAccessoryViewHidden];
  double result = 0.0;
  if (v3)
  {
    if (v4) {
      return result;
    }
    [(QLToolbarController *)self _toolbarSafeAreaInsetBottom];
  }
  else
  {
    if (v4) {
      return result;
    }
    -[QLToolbarController _originalToolbarHeightIncludingSafeAreaBottomInset:](self, "_originalToolbarHeightIncludingSafeAreaBottomInset:", 1, 0.0);
  }
  return -v6;
}

- (double)_computeClippingExtensionContainerHeightForCurrentHiddenProgress
{
  [(QLToolbarController *)self accessoryViewHiddenProgress];
  double v4 = (1.0 - v3) * self->_derivedToolbarExtensionHeight;
  if (self->_accessoryViewHiddenProgress > 0.0) {
    double v4 = v4 + -1.0;
  }
  return fmax(v4, 0.0);
}

- (double)_originalToolbarHeightIncludingSafeAreaBottomInset:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalToolbar);
  [WeakRetained frame];
  double Height = CGRectGetHeight(v9);

  if (v3)
  {
    [(QLToolbarController *)self _toolbarSafeAreaInsetBottom];
    return Height + v7;
  }
  return Height;
}

- (void)_layoutAccessoryView:(id)a3
{
  id firstValue = a3;
  [(QLToolbarController *)self _toolbarExtensionHeight];
  self->_derivedToolbarExtensiondouble Height = v4;
  if (firstValue)
  {
    accessoryViewContainer = self->_accessoryViewContainer;
    double v6 = (void *)MEMORY[0x263F08938];
    double v7 = _NSDictionaryOfVariableBindings(&cfstr_Accessoryview.isa, firstValue, 0);
    double v8 = [v6 constraintsWithVisualFormat:@"H:|[accessoryView]|" options:0 metrics:0 views:v7];
    [(UIView *)accessoryViewContainer addConstraints:v8];

    CGRect v9 = self->_accessoryViewContainer;
    v10 = (void *)MEMORY[0x263F08938];
    v11 = _NSDictionaryOfVariableBindings(&cfstr_Accessoryview.isa, firstValue, 0);
    v12 = [v10 constraintsWithVisualFormat:@"V:|[accessoryView]|" options:0 metrics:0 views:v11];
    [(UIView *)v9 addConstraints:v12];

    [(NSLayoutConstraint *)self->_accessoryContainerHeightConstraint setConstant:self->_derivedToolbarExtensionHeight];
    [(UIView *)self->_accessoryViewContainer layoutIfNeeded];
  }
}

- (double)_totalHeight
{
  BOOL v3 = [(QLToolbarController *)self isOriginalToolbarHidden];
  BOOL v4 = [(QLToolbarController *)self isAccessoryViewHidden];
  BOOL v5 = v4;
  if (v3)
  {
    double v6 = 0.0;
    if (!v4)
    {
      [(QLToolbarController *)self _toolbarSafeAreaInsetBottom];
      double v6 = v7;
LABEL_5:
      [(QLToolbarController *)self _computeClippingExtensionContainerHeightForCurrentHiddenProgress];
      return v6 + v9;
    }
  }
  else
  {
    [(QLToolbarController *)self _originalToolbarHeightIncludingSafeAreaBottomInset:1];
    double v6 = v8;
    if (!v5) {
      goto LABEL_5;
    }
  }
  return v6;
}

- (double)_toolbarExtensionHeight
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryView);
  [WeakRetained intrinsicContentSize];
  double v5 = v4;

  if (v5 <= 0.0) {
    return self->_preferredAccesoryViewHeight;
  }
  return v5;
}

- (void)_embedAccessoryView
{
  p_accessoryView = &self->_accessoryView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryView);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_accessoryView);
    double v6 = [v5 superview];

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_accessoryView);
      [v7 removeFromSuperview];
    }
    id v8 = objc_loadWeakRetained((id *)p_accessoryView);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    accessoryViewContainer = self->_accessoryViewContainer;
    id v10 = objc_loadWeakRetained((id *)p_accessoryView);
    [(UIView *)accessoryViewContainer addSubview:v10];

    id v11 = objc_loadWeakRetained((id *)p_accessoryView);
    [(QLToolbarController *)self _layoutAccessoryView:v11];
  }
}

- (void)restoreOriginalToolbar
{
  [(QLToolbarController *)self restoreOriginalConfiguration];
  [(UIToolbar *)self->_customToolbar removeFromSuperview];
  customToolbar = self->_customToolbar;
  self->_customToolbar = 0;

  toolbarHeightConstraint = self->_toolbarHeightConstraint;
  self->_toolbarHeightConstraint = 0;

  clippingExtensionContainerHeightConstraint = self->_clippingExtensionContainerHeightConstraint;
  self->_clippingExtensionContainerHeightConstraint = 0;

  accessoryViewContainer = self->_accessoryViewContainer;
  self->_accessoryViewContainer = 0;

  objc_storeWeak((id *)&self->_originalToolbar, 0);
}

- (void)restoreOriginalConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalToolbar);
  [WeakRetained configureWithConfiguration:self->_originalToolbarConfiguration];
}

- (void)updateLayout
{
  [(QLToolbarController *)self _originalToolbarHeightIncludingSafeAreaBottomInset:1];
  double v4 = v3;
  [(QLToolbarController *)self _computeClippingExtensionContainerBottomConstraint];
  -[NSLayoutConstraint setConstant:](self->_clippingExtensionContainerBottomConstraint, "setConstant:");
  [(QLToolbarController *)self _computeClippingExtensionContainerHeightForCurrentHiddenProgress];
  -[NSLayoutConstraint setConstant:](self->_clippingExtensionContainerHeightConstraint, "setConstant:");
  [(QLToolbarController *)self hiddenProgress];
  double v6 = v5;
  [(QLToolbarController *)self _totalHeight];
  [(NSLayoutConstraint *)self->_toolbarBottomConstraint setConstant:v6 * v7];
  [(QLToolbarController *)self _totalHeight];
  -[NSLayoutConstraint setConstant:](self->_toolbarHeightConstraint, "setConstant:");
  id v8 = [(UIToolbar *)self->_customToolbar superview];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v13 = *MEMORY[0x263F001B0];
  double v14 = *(double *)(MEMORY[0x263F001B0] + 8);

  if (v10 != v13 || v12 != v14)
  {
    v16 = [(UIToolbar *)self->_customToolbar superview];
    [v16 setNeedsLayout];

    id v17 = [(UIToolbar *)self->_customToolbar superview];
    [v17 layoutIfNeeded];
  }
  [(QLToolbarController *)self accessoryViewHiddenProgress];
  [(UIView *)self->_accessoryViewContainer setAlpha:1.0 - v18];
  if (!_os_feature_enabled_impl()
    || ![(QLToolbarController *)self isOriginalToolbarHidden])
  {
    v19 = [(QLToolbarController *)self originalToolbar];
    id v20 = [v19 superview];
    [v20 frame];
    double v21 = CGRectGetHeight(v29) - v4;

    if ([(QLToolbarController *)self isOriginalToolbarHidden])
    {
      [(QLToolbarController *)self _totalHeight];
    }
    else
    {
      [(QLToolbarController *)self hiddenProgress];
      double v24 = v23;
      [(QLToolbarController *)self _totalHeight];
      double v22 = v24 * v25;
    }
    double v26 = v21 + v22;
    id v27 = [(QLToolbarController *)self originalToolbar];
    objc_msgSend(v27, "setFrameOrigin:", 0.0, v26);
  }
}

- (void)setPreferredSuperview:(id)a3 preferredParentViewForSafeAreaInset:(id)a4
{
  id obj = a3;
  objc_storeWeak((id *)&self->_preferredParentViewForSafeAreaInset, a4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredSuperview);

  double v7 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_preferredSuperview, obj);
    [(QLToolbarController *)self _tryToSetUp:1];
    double v7 = obj;
  }
}

- (void)setAccessoryViewHidden:(BOOL)a3
{
  self->_accessoryViewHidden = a3;
  double v3 = 0.0;
  if (a3) {
    double v3 = 1.0;
  }
  [(QLToolbarController *)self setAccessoryViewHiddenProgress:v3];
}

- (BOOL)isAccessoryViewHidden
{
  if (self->_accessoryViewHidden) {
    return 1;
  }
  double v3 = [(QLToolbarController *)self accessoryView];
  BOOL v2 = v3 == 0;

  return v2;
}

- (void)setAccessoryViewHiddenProgress:(double)a3
{
  self->_accessoryViewHiddenProgress = a3;
}

- (double)accessoryViewHiddenProgress
{
  double v3 = [(QLToolbarController *)self accessoryView];
  if (v3) {
    double accessoryViewHiddenProgress = self->_accessoryViewHiddenProgress;
  }
  else {
    double accessoryViewHiddenProgress = 1.0;
  }

  return accessoryViewHiddenProgress;
}

- (void)setBarTintColor:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_barTintColor, a3);
  customToolbarConfiguration = self->_customToolbarConfiguration;
  if (customToolbarConfiguration)
  {
    [(_UIToolbarConfiguration *)customToolbarConfiguration setBarTintColor:self->_barTintColor];
    [(UIToolbar *)self->_customToolbar configureWithConfiguration:self->_customToolbarConfiguration];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  [(QLToolbarController *)self _tryToSetUp:0];
  if (self->_hidden != v3)
  {
    self->_hidden = v3;
    double v5 = 0.0;
    if (v3) {
      double v5 = 1.0;
    }
    [(QLToolbarController *)self setHiddenProgress:v5];
  }
}

- (void)setHiddenProgress:(double)a3
{
  self->_hiddenProgress = a3;
}

- (void)setAccessoryView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryView);

  if (WeakRetained != v6)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_accessoryView);
    objc_storeWeak((id *)&self->_accessoryView, v6);
    if ([(QLToolbarController *)self _tryToSetUp:0])
    {
      id v9 = objc_loadWeakRetained((id *)&self->_accessoryView);

      if (v9)
      {
        [(QLToolbarController *)self _embedAccessoryView];
        if (!v4)
        {
          [v8 removeFromSuperview];
          goto LABEL_12;
        }
        id v10 = objc_loadWeakRetained((id *)&self->_accessoryView);
        [v10 setAlpha:0.0];

        double v11 = (void *)MEMORY[0x263F82E00];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __49__QLToolbarController_setAccessoryView_animated___block_invoke_3;
        v18[3] = &unk_2642F5430;
        id v19 = v8;
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __49__QLToolbarController_setAccessoryView_animated___block_invoke_4;
        v15[3] = &unk_2642F59B8;
        id v16 = v19;
        id v17 = self;
        [v11 animateWithDuration:v18 animations:v15 completion:0.15];

        id v12 = v19;
      }
      else
      {
        double v13 = (void *)MEMORY[0x263F82E00];
        if (v4) {
          double v14 = 0.15;
        }
        else {
          double v14 = 0.0;
        }
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __49__QLToolbarController_setAccessoryView_animated___block_invoke;
        v22[3] = &unk_2642F5430;
        v22[4] = self;
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __49__QLToolbarController_setAccessoryView_animated___block_invoke_2;
        v20[3] = &unk_2642F5458;
        id v21 = v8;
        [v13 animateWithDuration:v22 animations:v20 completion:v14];
        id v12 = v21;
      }
    }
LABEL_12:
  }
}

uint64_t __49__QLToolbarController_setAccessoryView_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLayout];
}

uint64_t __49__QLToolbarController_setAccessoryView_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __49__QLToolbarController_setAccessoryView_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __49__QLToolbarController_setAccessoryView_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 32) removeFromSuperview];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__QLToolbarController_setAccessoryView_animated___block_invoke_5;
  v3[3] = &unk_2642F5430;
  v3[4] = *(void *)(a1 + 40);
  return [MEMORY[0x263F82E00] animateWithDuration:v3 animations:0 completion:0.15];
}

void __49__QLToolbarController_setAccessoryView_animated___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  [WeakRetained setAlpha:1.0];
}

- (void)setOriginalToolbar:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalToolbar);

  if (WeakRetained != obj)
  {
    originalToolbarConfiguration = self->_originalToolbarConfiguration;
    self->_originalToolbarConfiguration = 0;

    objc_storeWeak((id *)&self->_originalToolbar, obj);
    [(QLToolbarController *)self _tryToSetUp:0];
  }
}

- (BOOL)isOriginalToolbarHidden
{
  BOOL v2 = [(QLToolbarController *)self originalToolbar];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setOriginalToolbarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLToolbarController *)self originalToolbar];
  [v4 setHidden:v3];
}

- (void)setAccessoryView:(id)a3
{
}

- (void)setPreferredAccesoryViewHeight:(double)a3
{
  self->_preferredAccesoryViewdouble Height = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryView);
  [(QLToolbarController *)self _layoutAccessoryView:WeakRetained];
}

- (void)setToolbarAlpha:(double)a3
{
  self->_toolbarAlpha = a3;
  -[UIToolbar setAlpha:](self->_customToolbar, "setAlpha:");
}

- (void)setAccessoryViewAlpha:(double)a3
{
  self->_accessoryViewAlpha = a3;
  -[UIView setAlpha:](self->_accessoryViewContainer, "setAlpha:");
}

- (void)setOriginalToolbarAlpha:(double)a3
{
  self->_originalToolbarAlpha = a3;
  id v4 = [(QLToolbarController *)self originalToolbar];
  [v4 setAlpha:a3];
}

- (UIToolbar)originalToolbar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalToolbar);

  return (UIToolbar *)WeakRetained;
}

- (UIToolbar)customToolbar
{
  return (UIToolbar *)objc_getProperty(self, a2, 112, 1);
}

- (UIView)accessoryView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryView);

  return (UIView *)WeakRetained;
}

- (double)preferredAccesoryViewHeight
{
  return self->_preferredAccesoryViewHeight;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (double)toolbarAlpha
{
  return self->_toolbarAlpha;
}

- (double)originalToolbarAlpha
{
  return self->_originalToolbarAlpha;
}

- (double)accessoryViewAlpha
{
  return self->_accessoryViewAlpha;
}

- (double)hiddenProgress
{
  return self->_hiddenProgress;
}

- (UIColor)barTintColor
{
  return self->_barTintColor;
}

- (UIView)preferredSuperview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredSuperview);

  return (UIView *)WeakRetained;
}

- (UIView)preferredParentViewForSafeAreaInset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredParentViewForSafeAreaInset);

  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_preferredParentViewForSafeAreaInset);
  objc_destroyWeak((id *)&self->_preferredSuperview);
  objc_storeStrong((id *)&self->_barTintColor, 0);
  objc_destroyWeak((id *)&self->_accessoryView);
  objc_storeStrong((id *)&self->_customToolbar, 0);
  objc_destroyWeak((id *)&self->_originalToolbar);
  objc_storeStrong((id *)&self->_customToolbarConfiguration, 0);
  objc_storeStrong((id *)&self->_originalToolbarConfiguration, 0);
  objc_storeStrong((id *)&self->_accessoryViewContainer, 0);
  objc_storeStrong((id *)&self->_clippingExtensionContainer, 0);
  objc_storeStrong((id *)&self->_toolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_toolbarHeightConstraint, 0);
  objc_storeStrong((id *)&self->_clippingExtensionContainerBottomConstraint, 0);

  objc_storeStrong((id *)&self->_clippingExtensionContainerHeightConstraint, 0);
}

@end