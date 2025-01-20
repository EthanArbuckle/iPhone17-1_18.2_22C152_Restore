@interface CPSPermissionView
- (BOOL)locationConfirmationPermissionEnabled;
- (BOOL)notificationPermissionEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CPSPermissionView)initWithFrame:(CGRect)a3;
- (id)optionsAction;
- (void)configureWithAppName:(id)a3 requestsNotificationPermission:(BOOL)a4 requestsLocationConfirmationPermission:(BOOL)a5;
- (void)layoutSubviews;
- (void)permissionButtonTapped:(id)a3;
- (void)setLocationConfirmationPermissionEnabled:(BOOL)a3;
- (void)setLocationConfirmationPermissionEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setNotificationPermissionEnabled:(BOOL)a3;
- (void)setNotificationPermissionEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setOptionsAction:(id)a3;
- (void)toggleLocationConfirmationPermission;
- (void)toggleNotificationPermission;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionViewAnimated:(BOOL)a3;
@end

@implementation CPSPermissionView

- (CPSPermissionView)initWithFrame:(CGRect)a3
{
  v35[5] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)CPSPermissionView;
  v3 = -[CPSPermissionView initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CPSButton);
    permissionButton = v3->_permissionButton;
    v3->_permissionButton = v4;

    [(CPSButton *)v3->_permissionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [MEMORY[0x1E4F428B8] clearColor];
    [(CPSButton *)v3->_permissionButton setBackgroundColor:v6];

    [(CPSButton *)v3->_permissionButton setAnimatesAlphaWhenHighlighted:1];
    [(CPSButton *)v3->_permissionButton setContentHorizontalAlignment:1];
    -[CPSButton setContentEdgeInsets:](v3->_permissionButton, "setContentEdgeInsets:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    v7 = [(CPSButton *)v3->_permissionButton titleLabel];
    [v7 setAdjustsFontForContentSizeCategory:1];

    v8 = [(CPSButton *)v3->_permissionButton titleLabel];
    [v8 setNumberOfLines:0];

    v9 = [(CPSButton *)v3->_permissionButton titleLabel];
    [v9 setLineBreakMode:0];

    [(CPSButton *)v3->_permissionButton addTarget:v3 action:sel_permissionButtonTapped_ forControlEvents:64];
    [(CPSPermissionView *)v3 addSubview:v3->_permissionButton];
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v33 = [(CPSButton *)v3->_permissionButton titleLabel];
    v32 = [v33 leadingAnchor];
    v31 = [(CPSPermissionView *)v3 leadingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v35[0] = v30;
    v29 = [(CPSButton *)v3->_permissionButton titleLabel];
    v28 = [v29 topAnchor];
    v27 = [(CPSPermissionView *)v3 topAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v35[1] = v26;
    v24 = [(CPSButton *)v3->_permissionButton titleLabel];
    v23 = [v24 bottomAnchor];
    v22 = [(CPSPermissionView *)v3 bottomAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v35[2] = v21;
    v10 = [(CPSButton *)v3->_permissionButton titleLabel];
    v11 = [v10 trailingAnchor];
    v12 = [(CPSPermissionView *)v3 trailingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v35[3] = v13;
    v14 = [(CPSButton *)v3->_permissionButton trailingAnchor];
    v15 = [(CPSButton *)v3->_permissionButton titleLabel];
    v16 = [v15 trailingAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    v35[4] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
    [v25 activateConstraints:v18];

    v19 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)CPSPermissionView;
  [(CPSPermissionView *)&v26 layoutSubviews];
  if (!self->_permissionTextNeedsUpdate) {
    return;
  }
  self->_permissionTextNeedsUpdate = 0;
  if (self->_requestsNotificationPermission != self->_requestsLocationConfirmationPermission)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
    v10 = NSString;
    v11 = _CPSLocalizedString();
    v12 = objc_msgSend(v10, "stringWithFormat:", v11, self->_appName);
    v7 = (void *)[v9 initWithString:v12];

    id v8 = objc_alloc(MEMORY[0x1E4F28E48]);
    goto LABEL_7;
  }
  if (self->_requestsNotificationPermission)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28E48]);
    v4 = NSString;
    v5 = _CPSLocalizedString();
    v6 = objc_msgSend(v4, "stringWithFormat:", v5, self->_appName);
    v7 = (void *)[v3 initWithString:v6];

    id v8 = objc_alloc(MEMORY[0x1E4F28E48]);
LABEL_7:
    v14 = _CPSLocalizedString();
    v13 = (void *)[v8 initWithString:v14];

    goto LABEL_8;
  }
  v13 = 0;
  v7 = 0;
LABEL_8:
  v15 = [v13 string];
  [(CPSButton *)self->_permissionButton setExtraTapTargetSubstring:v15];

  uint64_t v16 = *MEMORY[0x1E4F42510];
  v17 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  objc_msgSend(v7, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v7, "length"));

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  [v7 appendAttributedString:v18];

  v19 = [MEMORY[0x1E4F428B8] systemBlueColor];
  objc_msgSend(v13, "addAttribute:value:range:", v16, v19, 0, objc_msgSend(v13, "length"));

  if (UIAccessibilityButtonShapesEnabled()) {
    objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E4F425C8], &unk_1F3070ED0, 0, objc_msgSend(v13, "length"));
  }
  [v7 appendAttributedString:v13];
  uint64_t v20 = *MEMORY[0x1E4F42508];
  v21 = (void *)MEMORY[0x1E4F42A30];
  uint64_t v22 = *MEMORY[0x1E4F43888];
  v23 = [(CPSPermissionView *)self traitCollection];
  v24 = [v21 _preferredFontForTextStyle:v22 design:0 variant:256 compatibleWithTraitCollection:v23];
  objc_msgSend(v7, "addAttribute:value:range:", v20, v24, 0, objc_msgSend(v7, "length"));

  id v25 = objc_alloc_init(MEMORY[0x1E4F42670]);
  [v25 setLineBreakMode:0];
  [v25 setLineSpacing:2.0];
  objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E4F42540], v25, 0, objc_msgSend(v7, "length"));
  [(CPSButton *)self->_permissionButton setAttributedTitle:v7 forState:0];
}

- (void)configureWithAppName:(id)a3 requestsNotificationPermission:(BOOL)a4 requestsLocationConfirmationPermission:(BOOL)a5
{
  id v8 = (NSString *)a3;
  [(CPSPermissionView *)self layoutIfNeeded];
  appName = self->_appName;
  self->_appName = v8;

  self->_requestsNotificationPermission = a4;
  self->_requestsLocationConfirmationPermission = a5;

  [(CPSPermissionView *)self transitionViewAnimated:0];
}

- (void)permissionButtonTapped:(id)a3
{
  id v6 = a3;
  if (self->_requestsNotificationPermission)
  {
    if (self->_requestsLocationConfirmationPermission)
    {
      v4 = [(CPSPermissionView *)self optionsAction];

      if (v4)
      {
        v5 = [(CPSPermissionView *)self optionsAction];
        v5[2]();
      }
    }
    else
    {
      [(CPSPermissionView *)self toggleNotificationPermission];
    }
  }
  else if (self->_requestsLocationConfirmationPermission)
  {
    [(CPSPermissionView *)self toggleLocationConfirmationPermission];
  }
}

- (void)setNotificationPermissionEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_notificationPermissionEnabled != a3)
  {
    BOOL v4 = a4;
    [(CPSPermissionView *)self layoutIfNeeded];
    self->_notificationPermissionEnabled = a3;
    [(CPSPermissionView *)self transitionViewAnimated:v4];
  }
}

- (void)setNotificationPermissionEnabled:(BOOL)a3
{
}

- (void)setLocationConfirmationPermissionEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_locationConfirmationPermissionEnabled != a3)
  {
    BOOL v4 = a4;
    [(CPSPermissionView *)self layoutIfNeeded];
    self->_locationConfirmationPermissionEnabled = a3;
    [(CPSPermissionView *)self transitionViewAnimated:v4];
  }
}

- (void)setLocationConfirmationPermissionEnabled:(BOOL)a3
{
}

- (void)transitionViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  self->_permissionTextNeedsUpdate = 1;
  [(CPSPermissionView *)self setNeedsLayout];
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__CPSPermissionView_transitionViewAnimated___block_invoke;
    v5[3] = &unk_1E6AE8DF0;
    v5[4] = self;
    [MEMORY[0x1E4F42FF0] transitionWithView:self duration:5242880 options:v5 animations:0 completion:0.35];
  }
  else
  {
    [(CPSPermissionView *)self layoutIfNeeded];
  }
}

uint64_t __44__CPSPermissionView_transitionViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)toggleNotificationPermission
{
  uint64_t v3 = [(CPSPermissionView *)self notificationPermissionEnabled] ^ 1;

  [(CPSPermissionView *)self setNotificationPermissionEnabled:v3 animated:0];
}

- (void)toggleLocationConfirmationPermission
{
  uint64_t v3 = [(CPSPermissionView *)self locationConfirmationPermissionEnabled] ^ 1;

  [(CPSPermissionView *)self setLocationConfirmationPermissionEnabled:v3 animated:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  self->_permissionTextNeedsUpdate = 1;
  [(CPSPermissionView *)self setNeedsLayout];

  [(CPSPermissionView *)self layoutIfNeeded];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPSPermissionView;
  if (-[CPSPermissionView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    char v8 = 1;
  }
  else
  {
    permissionButton = self->_permissionButton;
    -[CPSPermissionView convertPoint:toView:](self, "convertPoint:toView:", permissionButton, x, y);
    char v8 = -[CPSButton pointInside:withEvent:](permissionButton, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (id)optionsAction
{
  return self->_optionsAction;
}

- (void)setOptionsAction:(id)a3
{
}

- (BOOL)notificationPermissionEnabled
{
  return self->_notificationPermissionEnabled;
}

- (BOOL)locationConfirmationPermissionEnabled
{
  return self->_locationConfirmationPermissionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_optionsAction, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_permissionButton, 0);
}

@end