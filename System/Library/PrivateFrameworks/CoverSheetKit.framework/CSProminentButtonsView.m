@interface CSProminentButtonsView
+ (UIEdgeInsets)_buttonOutsets;
+ (double)_buttonDiameter;
+ (double)_buttonInsetX;
+ (double)_buttonInsetY;
+ (double)_leadingOutset;
+ (double)_reticleOutset;
- (CGRect)_frameWithMinX:(double)a3 outset:(BOOL)a4;
- (CGRect)_leadingFrameWithOutsets:(BOOL)a3;
- (CGRect)_trailingFrameWithOutsets:(BOOL)a3;
- (CGSize)_buttonSizeWithOutsets:(BOOL)a3;
- (CSProminentButtonControl)leadingButton;
- (CSProminentButtonControl)trailingButton;
- (CSProminentButtonReticlePresenter)leadingReticle;
- (CSProminentButtonReticlePresenter)trailingReticle;
- (CSProminentButtonsView)initWithLeadingButton:(id)a3 trailingButton:(id)a4;
- (UIButton)leadingRemoveButton;
- (UIButton)trailingRemoveButton;
- (double)_buttonMinYWithOutset:(BOOL)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_addContraintsForRemoveButtonsIfNecessary;
- (void)_layoutButtons;
- (void)_setConstraintsForRemoveButton:(id)a3 withReticle:(id)a4;
- (void)layoutSubviews;
- (void)setLeadingButton:(id)a3;
- (void)setLeadingRemoveButton:(id)a3;
- (void)setLeadingReticle:(id)a3;
- (void)setTrailingButton:(id)a3;
- (void)setTrailingRemoveButton:(id)a3;
- (void)setTrailingReticle:(id)a3;
@end

@implementation CSProminentButtonsView

- (CSProminentButtonsView)initWithLeadingButton:(id)a3 trailingButton:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSProminentButtonsView;
  v8 = [(CSProminentButtonsView *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CSProminentButtonsView *)v8 setLeadingButton:v6];
    [(CSProminentButtonsView *)v9 setTrailingButton:v7];
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CSProminentButtonsView;
  -[CSProminentButtonsView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CSProminentButtonsView *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSProminentButtonsView;
  [(CSProminentButtonsView *)&v3 layoutSubviews];
  [(CSProminentButtonsView *)self _layoutButtons];
}

- (void)setLeadingButton:(id)a3
{
  v5 = (CSProminentButtonControl *)a3;
  leadingButton = self->_leadingButton;
  id v7 = v5;
  if (leadingButton != v5)
  {
    [(CSProminentButtonControl *)leadingButton removeFromSuperview];
    objc_storeStrong((id *)&self->_leadingButton, a3);
    if (self->_leadingButton) {
      -[CSProminentButtonsView addSubview:](self, "addSubview:");
    }
  }
}

- (void)setTrailingButton:(id)a3
{
  v5 = (CSProminentButtonControl *)a3;
  trailingButton = self->_trailingButton;
  id v7 = v5;
  if (trailingButton != v5)
  {
    [(CSProminentButtonControl *)trailingButton removeFromSuperview];
    objc_storeStrong((id *)&self->_trailingButton, a3);
    if (self->_trailingButton) {
      -[CSProminentButtonsView addSubview:](self, "addSubview:");
    }
  }
}

- (void)setLeadingReticle:(id)a3
{
  v5 = (CSProminentButtonReticlePresenter *)a3;
  if (self->_trailingReticle != v5)
  {
    [(CSProminentButtonReticlePresenter *)self->_leadingReticle removeFromSuperview];
    objc_storeStrong((id *)&self->_leadingReticle, a3);
    if (self->_leadingReticle)
    {
      -[CSProminentButtonsView addSubview:](self, "addSubview:");
      [(CSProminentButtonsView *)self sendSubviewToBack:self->_leadingReticle];
      [(CSProminentButtonsView *)self setNeedsLayout];
      [(CSProminentButtonsView *)self _addContraintsForRemoveButtonsIfNecessary];
    }
  }
}

- (void)setTrailingReticle:(id)a3
{
  v5 = (CSProminentButtonReticlePresenter *)a3;
  p_trailingReticle = &self->_trailingReticle;
  trailingReticle = self->_trailingReticle;
  v8 = v5;
  if (trailingReticle != v5)
  {
    [(CSProminentButtonReticlePresenter *)trailingReticle removeFromSuperview];
    objc_storeStrong((id *)&self->_trailingReticle, a3);
    if (*p_trailingReticle)
    {
      -[CSProminentButtonsView addSubview:](self, "addSubview:");
      [(CSProminentButtonsView *)self sendSubviewToBack:*p_trailingReticle];
      [(CSProminentButtonsView *)self setNeedsLayout];
      [(CSProminentButtonsView *)self _addContraintsForRemoveButtonsIfNecessary];
    }
  }
}

- (void)setLeadingRemoveButton:(id)a3
{
  v5 = (UIButton *)a3;
  p_leadingRemoveButton = &self->_leadingRemoveButton;
  leadingRemoveButton = self->_leadingRemoveButton;
  v8 = v5;
  if (leadingRemoveButton != v5)
  {
    [(UIButton *)leadingRemoveButton removeFromSuperview];
    objc_storeStrong((id *)&self->_leadingRemoveButton, a3);
    [(UIButton *)*p_leadingRemoveButton setTranslatesAutoresizingMaskIntoConstraints:0];
    if (*p_leadingRemoveButton)
    {
      -[CSProminentButtonsView addSubview:](self, "addSubview:");
      [(CSProminentButtonsView *)self _addContraintsForRemoveButtonsIfNecessary];
    }
  }
}

- (void)setTrailingRemoveButton:(id)a3
{
  v5 = (UIButton *)a3;
  p_trailingRemoveButton = &self->_trailingRemoveButton;
  trailingRemoveButton = self->_trailingRemoveButton;
  v8 = v5;
  if (trailingRemoveButton != v5)
  {
    [(UIButton *)trailingRemoveButton removeFromSuperview];
    objc_storeStrong((id *)&self->_trailingRemoveButton, a3);
    [(UIButton *)*p_trailingRemoveButton setTranslatesAutoresizingMaskIntoConstraints:0];
    if (*p_trailingRemoveButton)
    {
      -[CSProminentButtonsView addSubview:](self, "addSubview:");
      [(CSProminentButtonsView *)self _addContraintsForRemoveButtonsIfNecessary];
    }
  }
}

- (void)_layoutButtons
{
  [(id)objc_opt_class() _buttonOutsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CSProminentButtonControl setEdgeInsets:](self->_leadingButton, "setEdgeInsets:");
  -[CSProminentButtonControl setEdgeInsets:](self->_trailingButton, "setEdgeInsets:", v4, v6, v8, v10);
  [(CSProminentButtonsView *)self _leadingFrameWithOutsets:1];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(CSProminentButtonsView *)self _trailingFrameWithOutsets:1];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  leadingButton = self->_leadingButton;
  v28 = (id *)MEMORY[0x1E4FB2608];
  uint64_t v29 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  if (v29 == 1) {
    double v30 = v26;
  }
  else {
    double v30 = v18;
  }
  if (v29 == 1) {
    double v31 = v24;
  }
  else {
    double v31 = v16;
  }
  if (v29 == 1) {
    double v32 = v22;
  }
  else {
    double v32 = v14;
  }
  if (v29 == 1) {
    double v33 = v20;
  }
  else {
    double v33 = v12;
  }
  -[CSProminentButtonControl setFrame:](leadingButton, "setFrame:", v33, v32, v31, v30);
  trailingButton = self->_trailingButton;
  uint64_t v35 = [*v28 userInterfaceLayoutDirection];
  if (v35 == 1) {
    double v36 = v18;
  }
  else {
    double v36 = v26;
  }
  if (v35 == 1) {
    double v37 = v16;
  }
  else {
    double v37 = v24;
  }
  if (v35 == 1) {
    double v38 = v14;
  }
  else {
    double v38 = v22;
  }
  double v54 = v12;
  if (v35 == 1) {
    double v39 = v12;
  }
  else {
    double v39 = v20;
  }
  -[CSProminentButtonControl setFrame:](trailingButton, "setFrame:", v39, v38, v37, v36);
  [(id)objc_opt_class() _reticleOutset];
  CGFloat v41 = v40;
  leadingReticle = self->_leadingReticle;
  if (leadingReticle)
  {
    uint64_t v43 = [*v28 userInterfaceLayoutDirection];
    if (v43 == 1) {
      double v44 = v26;
    }
    else {
      double v44 = v18;
    }
    if (v43 == 1) {
      double v45 = v24;
    }
    else {
      double v45 = v16;
    }
    if (v43 == 1) {
      double v46 = v22;
    }
    else {
      double v46 = v14;
    }
    double v47 = v54;
    if (v43 == 1) {
      double v47 = v20;
    }
    CGRect v56 = CGRectInset(*(CGRect *)(&v44 - 3), v41, v41);
    -[CSProminentButtonReticlePresenter setFrame:](leadingReticle, "setFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
  }
  trailingReticle = self->_trailingReticle;
  if (trailingReticle)
  {
    uint64_t v49 = [*v28 userInterfaceLayoutDirection];
    if (v49 == 1) {
      double v50 = v18;
    }
    else {
      double v50 = v26;
    }
    if (v49 == 1) {
      double v51 = v16;
    }
    else {
      double v51 = v24;
    }
    if (v49 == 1) {
      double v52 = v14;
    }
    else {
      double v52 = v22;
    }
    double v53 = v54;
    if (v49 != 1) {
      double v53 = v20;
    }
    CGRect v57 = CGRectInset(*(CGRect *)(&v50 - 3), v41, v41);
    -[CSProminentButtonReticlePresenter setFrame:](trailingReticle, "setFrame:", v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);
  }
}

- (CGRect)_leadingFrameWithOutsets:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = 0.0;
  if (a3)
  {
    [(id)objc_opt_class() _leadingOutset];
    double v5 = v6;
  }
  [(id)objc_opt_class() _buttonInsetX];
  double v8 = v7 - v5;

  [(CSProminentButtonsView *)self _frameWithMinX:v3 outset:v8];
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)_trailingFrameWithOutsets:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = 0.0;
  if (a3)
  {
    [(id)objc_opt_class() _leadingOutset];
    double v5 = v6;
  }
  [(CSProminentButtonsView *)self bounds];
  double Width = CGRectGetWidth(v17);
  [(id)objc_opt_class() _buttonInsetX];
  double v9 = Width - v8;
  [(id)objc_opt_class() _buttonDiameter];
  double v11 = v9 - (v5 + v10);

  [(CSProminentButtonsView *)self _frameWithMinX:v3 outset:v11];
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_frameWithMinX:(double)a3 outset:(BOOL)a4
{
  BOOL v4 = a4;
  -[CSProminentButtonsView _buttonMinYWithOutset:](self, "_buttonMinYWithOutset:");
  double v8 = v7;
  [(CSProminentButtonsView *)self _buttonSizeWithOutsets:v4];
  double v10 = v9;
  double v12 = v11;
  double v13 = a3;
  double v14 = v8;
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)_buttonMinYWithOutset:(BOOL)a3
{
  double v4 = 0.0;
  if (a3)
  {
    [(id)objc_opt_class() _buttonOutsets];
    double v4 = v5;
  }
  [(CSProminentButtonsView *)self bounds];
  double Height = CGRectGetHeight(v11);
  [(id)objc_opt_class() _buttonInsetY];
  double v8 = Height - v7;
  [(id)objc_opt_class() _buttonDiameter];
  return v8 - (v4 + v9);
}

- (CGSize)_buttonSizeWithOutsets:(BOOL)a3
{
  BOOL v3 = a3;
  [(id)objc_opt_class() _buttonDiameter];
  double v5 = v4;
  [(id)objc_opt_class() _buttonOutsets];
  double v10 = v8 + v9;
  if (!v3) {
    double v10 = 0.0;
  }
  double v11 = v5 + v10;
  double v12 = v6 + v7;
  if (!v3) {
    double v12 = 0.0;
  }
  double v13 = v5 + v12;
  double v14 = v11;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)_addContraintsForRemoveButtonsIfNecessary
{
  if (self->_leadingRemoveButton && self->_leadingReticle) {
    -[CSProminentButtonsView _setConstraintsForRemoveButton:withReticle:](self, "_setConstraintsForRemoveButton:withReticle:");
  }
  if (self->_trailingRemoveButton && self->_trailingReticle)
  {
    -[CSProminentButtonsView _setConstraintsForRemoveButton:withReticle:](self, "_setConstraintsForRemoveButton:withReticle:");
  }
}

- (void)_setConstraintsForRemoveButton:(id)a3 withReticle:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  double v5 = (void *)MEMORY[0x1E4F28DC8];
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 topAnchor];
  double v9 = [v6 topAnchor];
  double v10 = [v8 constraintEqualToAnchor:v9 constant:-3.0];
  v15[0] = v10;
  double v11 = [v7 leadingAnchor];

  double v12 = [v6 leadingAnchor];

  double v13 = [v11 constraintEqualToAnchor:v12 constant:-3.0];
  v15[1] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v5 activateConstraints:v14];
}

+ (UIEdgeInsets)_buttonOutsets
{
  double v2 = 18.0;
  double v3 = 18.0;
  double v4 = 18.0;
  double v5 = 18.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)_buttonDiameter
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  if (v2 - 6 > 0x17) {
    return 50.0;
  }
  else {
    return dbl_1ADA42438[v2 - 6];
  }
}

+ (double)_buttonInsetX
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  if (v2 > 0x1D) {
    return 46.0;
  }
  else {
    return dbl_1ADA424F8[v2];
  }
}

+ (double)_buttonInsetY
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  if (v2 > 0x1D) {
    return 50.0;
  }
  else {
    return dbl_1ADA425E8[v2];
  }
}

+ (double)_leadingOutset
{
  [(id)objc_opt_class() _buttonOutsets];
  double v3 = v2;
  double v5 = v4;
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
    return v5;
  }
  else {
    return v3;
  }
}

+ (double)_reticleOutset
{
  return 12.0;
}

- (CSProminentButtonControl)leadingButton
{
  return self->_leadingButton;
}

- (CSProminentButtonControl)trailingButton
{
  return self->_trailingButton;
}

- (CSProminentButtonReticlePresenter)leadingReticle
{
  return self->_leadingReticle;
}

- (CSProminentButtonReticlePresenter)trailingReticle
{
  return self->_trailingReticle;
}

- (UIButton)leadingRemoveButton
{
  return self->_leadingRemoveButton;
}

- (UIButton)trailingRemoveButton
{
  return self->_trailingRemoveButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingRemoveButton, 0);
  objc_storeStrong((id *)&self->_leadingRemoveButton, 0);
  objc_storeStrong((id *)&self->_trailingReticle, 0);
  objc_storeStrong((id *)&self->_leadingReticle, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);

  objc_storeStrong((id *)&self->_leadingButton, 0);
}

@end