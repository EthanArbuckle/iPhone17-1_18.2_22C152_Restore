@interface CKObscurableBalloonView
- (BOOL)isObscured;
- (CKObscurableBalloonViewDelegate)obscurableBalloonDelegate;
- (UIButton)showButton;
- (UIButton)warningButton;
- (UIImageView)obscuredContentBadgeView;
- (UILabel)sensitiveContentDescription;
- (UIView)obscuringView;
- (UIVisualEffectView)blurEffect;
- (id)_containerView;
- (id)blurVisualEffect;
- (void)_presentGetHelpAlert:(id)a3;
- (void)_setupForAdultsIn:(id)a3 revealingContent:(BOOL)a4;
- (void)_setupForChildrenIn:(id)a3 withBadgeView:(id)a4;
- (void)_setupObscuringView:(BOOL)a3;
- (void)_setupWarningButtonIn:(id)a3 forRevealing:(BOOL)a4;
- (void)didAskForMoreHelp:(id)a3;
- (void)didBlockContact:(id)a3;
- (void)evidenceToReportWithContext:(id)a3 completionHandler:(id)a4;
- (void)obscureSensitiveContent:(BOOL)a3;
- (void)prepareForReuse;
- (void)revealSensitiveContent:(BOOL)a3;
- (void)setBlurEffect:(id)a3;
- (void)setObscurableBalloonDelegate:(id)a3;
- (void)setObscuredContentBadgeView:(id)a3;
- (void)setObscuringView:(id)a3;
- (void)setSensitiveContentDescription:(id)a3;
- (void)setShowButton:(id)a3;
- (void)setWarningButton:(id)a3;
- (void)tapGestureRecognized:(id)a3;
@end

@implementation CKObscurableBalloonView

- (void)obscureSensitiveContent:(BOOL)a3
{
  [(CKObscurableBalloonView *)self _setupObscuringView:a3];
  [(CKObscurableBalloonView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(CKObscurableBalloonView *)self obscuringView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(CKObscurableBalloonView *)self obscuringView];
  [(CKObscurableBalloonView *)self addSubview:v13];

  id v14 = [(CKObscurableBalloonView *)self obscuringView];
  [(CKObscurableBalloonView *)self bringSubviewToFront:v14];
}

- (void)revealSensitiveContent:(BOOL)a3
{
  if ([(CKObscurableBalloonView *)self isObscured])
  {
    double v5 = [(CKObscurableBalloonView *)self obscuringView];
    [v5 removeFromSuperview];

    [(CKObscurableBalloonView *)self setObscuringView:0];
  }
  if (!a3)
  {
    double v6 = [MEMORY[0x1E4F6E6D0] sharedManager];
    uint64_t v7 = [v6 enablementGroup];

    if (v7 == 2) {
      [(CKObscurableBalloonView *)self _setupForAdultsIn:self revealingContent:1];
    }
    double v8 = [(CKObscurableBalloonView *)self obscurableBalloonDelegate];
    int v9 = [v8 isRevealingContentEnabled];

    if (v9)
    {
      [(CKObscurableBalloonView *)self _setupWarningButtonIn:self forRevealing:1];
    }
  }
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = a3;
  double v5 = [v4 view];
  [v4 locationInView:v5];
  double v6 = objc_msgSend(v5, "hitTest:withEvent:", 0);
  if (![(CKObscurableBalloonView *)self isObscured]
    || ([MEMORY[0x1E4F6E6D0] sharedManager],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 enablementGroup],
        v7,
        v8 != 2)
    || ([(CKObscurableBalloonView *)self showButton],
        int v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v6 == v9))
  {
    v10.receiver = self;
    v10.super_class = (Class)CKObscurableBalloonView;
    [(CKBalloonView *)&v10 tapGestureRecognized:v4];
  }
}

- (void)_setupObscuringView:(BOOL)a3
{
  BOOL v3 = a3;
  v59[4] = *MEMORY[0x1E4F143B8];
  if (![(CKObscurableBalloonView *)self isObscured])
  {
    double v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(UIView *)v5 _setOverrideUserInterfaceRenderingMode:2];
    +[CKUIBehavior sharedBehaviors];
    double v6 = v55 = v3;
    -[UIView _setOverrideUserInterfaceStyle:](v5, "_setOverrideUserInterfaceStyle:", [v6 obscurableBalloonBlurMaterialInterfaceStyle]);

    v57 = self;
    uint64_t v7 = [(CKObscurableBalloonView *)self blurEffect];
    [(UIView *)v5 addSubview:v7];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v43 = (void *)MEMORY[0x1E4F28DC8];
    v53 = [v7 topAnchor];
    v51 = [(UIView *)v5 topAnchor];
    v49 = [v53 constraintEqualToAnchor:v51];
    v59[0] = v49;
    v47 = [v7 bottomAnchor];
    v45 = [(UIView *)v5 bottomAnchor];
    uint64_t v8 = [v47 constraintEqualToAnchor:v45];
    v59[1] = v8;
    int v9 = [v7 leadingAnchor];
    objc_super v10 = [(UIView *)v5 leadingAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10];
    v59[2] = v11;
    v12 = [v7 trailingAnchor];
    v13 = [(UIView *)v5 trailingAnchor];
    id v14 = [v12 constraintEqualToAnchor:v13];
    v59[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:4];
    [v43 activateConstraints:v15];

    if (v55)
    {
      obscuringView = v57->_obscuringView;
      v57->_obscuringView = v5;
    }
    else
    {
      v56 = v5;
      obscuringView = [(CKObscurableBalloonView *)v57 sensitiveContentDescription];
      v17 = [v7 contentView];
      [v17 addSubview:obscuringView];

      [obscuringView setTranslatesAutoresizingMaskIntoConstraints:0];
      v18 = +[CKUIBehavior sharedBehaviors];
      [v18 sensitiveLabelPadding];
      double v20 = v19;

      v21 = [obscuringView centerYAnchor];
      v22 = [v7 contentView];
      v23 = [v22 centerYAnchor];
      v24 = [v21 constraintEqualToAnchor:v23];

      LODWORD(v25) = 1143930880;
      [v24 setPriority:v25];
      v42 = (void *)MEMORY[0x1E4F28DC8];
      v48 = [obscuringView centerXAnchor];
      v50 = [v7 contentView];
      v46 = [v50 centerXAnchor];
      v44 = [v48 constraintEqualToAnchor:v46];
      v58[0] = v44;
      v58[1] = v24;
      v52 = v24;
      v26 = [obscuringView leadingAnchor];
      v27 = [v7 contentView];
      v28 = [v27 leadingAnchor];
      v29 = [v26 constraintGreaterThanOrEqualToAnchor:v28 constant:v20];
      v58[2] = v29;
      v30 = [obscuringView trailingAnchor];
      v54 = v7;
      v31 = [v7 contentView];
      v32 = [v31 trailingAnchor];
      v33 = [v30 constraintLessThanOrEqualToAnchor:v32 constant:-v20];
      v58[3] = v33;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
      [v42 activateConstraints:v34];

      v35 = [(CKObscurableBalloonView *)v57 obscurableBalloonDelegate];
      LODWORD(v30) = [v35 isRevealingContentEnabled];

      if (v30)
      {
        v36 = [(CKObscurableBalloonView *)v57 _containerView];
        [(CKObscurableBalloonView *)v57 _setupWarningButtonIn:v36 forRevealing:0];
      }
      v37 = [MEMORY[0x1E4F6E6D0] sharedManager];
      uint64_t v38 = [v37 enablementGroup];

      v39 = [(CKObscurableBalloonView *)v57 _containerView];
      if (v38 == 2)
      {
        [(CKObscurableBalloonView *)v57 _setupForAdultsIn:v39 revealingContent:0];
      }
      else
      {
        v40 = [(CKObscurableBalloonView *)v57 obscuredContentBadgeView];
        [(CKObscurableBalloonView *)v57 _setupForChildrenIn:v39 withBadgeView:v40];
      }
      uint64_t v7 = v54;

      v41 = v57->_obscuringView;
      v57->_obscuringView = v56;
    }
  }
}

- (void)_setupForChildrenIn:(id)a3 withBadgeView:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  [v6 addSubview:v5];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = +[CKUIBehavior sharedBehaviors];
  [v7 obscurableBalloonVerticalPadding];
  double v9 = v8;

  objc_super v10 = +[CKUIBehavior sharedBehaviors];
  [v10 obscurableBalloonHorizontalPadding];
  double v12 = v11;

  v13 = (void *)MEMORY[0x1E4F28DC8];
  id v14 = [v5 bottomAnchor];
  v15 = [v6 bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:-v9];
  v21[0] = v16;
  v17 = [v5 trailingAnchor];

  v18 = [v6 trailingAnchor];

  double v19 = [v17 constraintEqualToAnchor:v18 constant:-v12];
  v21[1] = v19;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [v13 activateConstraints:v20];
}

- (void)_setupForAdultsIn:(id)a3 revealingContent:(BOOL)a4
{
  v40[5] = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    id v5 = a3;
    id v6 = [(CKObscurableBalloonView *)self showButton];
    [v5 addSubview:v6];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v7 = +[CKUIBehavior sharedBehaviors];
    [v7 obscurableBalloonVerticalPadding];
    double v9 = v8;

    objc_super v10 = +[CKUIBehavior sharedBehaviors];
    [v10 obscurableBalloonHorizontalPadding];
    double v12 = v11;

    v13 = +[CKUIBehavior sharedBehaviors];
    [v13 balloonMaskTailWidth];
    double v15 = v14;

    BOOL v16 = [(CKBalloonView *)self hasTail];
    double v17 = -0.0;
    if (v16) {
      double v17 = v15;
    }
    double v18 = v12 + v17;
    double v19 = [v6 topAnchor];
    double v20 = [(CKObscurableBalloonView *)self sensitiveContentDescription];
    v21 = [v20 bottomAnchor];
    v22 = [v19 constraintGreaterThanOrEqualToAnchor:v21 constant:v9];

    LODWORD(v23) = 1144668160;
    v24 = v22;
    v34 = v22;
    [v22 setPriority:v23];
    v35 = (void *)MEMORY[0x1E4F28DC8];
    v39 = [v6 bottomAnchor];
    uint64_t v38 = [v5 bottomAnchor];
    v37 = [v39 constraintEqualToAnchor:v38 constant:-v9];
    v40[0] = v37;
    v36 = [v6 trailingAnchor];
    double v25 = [v5 trailingAnchor];
    v26 = [v36 constraintEqualToAnchor:v25 constant:-v12];
    v40[1] = v26;
    v27 = [v6 leadingAnchor];
    v28 = [v5 leadingAnchor];
    v29 = [v27 constraintGreaterThanOrEqualToAnchor:v28 constant:v18];
    v40[2] = v29;
    v30 = [v6 topAnchor];
    v31 = [v5 topAnchor];

    v32 = [v30 constraintGreaterThanOrEqualToAnchor:v31 constant:v9];
    v40[3] = v32;
    v40[4] = v24;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:5];
    [v35 activateConstraints:v33];
  }
}

- (void)_setupWarningButtonIn:(id)a3 forRevealing:(BOOL)a4
{
  BOOL v4 = a4;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(CKObscurableBalloonView *)self warningButton];
  double v8 = [v7 configuration];
  double v9 = +[CKUIBehavior sharedBehaviors];
  objc_super v10 = v9;
  if (v4) {
    [v9 obscurableBalloonWarningButtonBackgroundConfigurationRevealed];
  }
  else {
  uint64_t v11 = [v9 obscurableBalloonWarningButtonBackgroundConfigurationObscured];
  }

  [v8 setBackground:v11];
  [v7 setConfiguration:v8];
  [v6 addSubview:v7];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v12 = +[CKUIBehavior sharedBehaviors];
  [v12 obscurableBalloonVerticalPadding];
  double v14 = v13;

  double v15 = +[CKUIBehavior sharedBehaviors];
  [v15 obscurableBalloonHorizontalPadding];
  double v17 = v16;

  v26 = (void *)MEMORY[0x1E4F28DC8];
  double v18 = [v7 topAnchor];
  double v19 = [v6 topAnchor];
  double v20 = [v18 constraintEqualToAnchor:v19 constant:v14];
  v27[0] = v20;
  v21 = [v7 trailingAnchor];
  v22 = [v6 trailingAnchor];

  double v23 = [v21 constraintEqualToAnchor:v22 constant:-v17];
  v27[1] = v23;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  double v25 = v24 = (void *)v11;
  [v26 activateConstraints:v25];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CKObscurableBalloonView;
  [(CKBalloonView *)&v5 prepareForReuse];
  if ([(CKObscurableBalloonView *)self isObscured])
  {
    BOOL v3 = [(CKObscurableBalloonView *)self obscuringView];
    [v3 removeFromSuperview];

    [(CKObscurableBalloonView *)self setObscuringView:0];
  }
  warningButton = self->_warningButton;
  if (warningButton) {
    [(UIButton *)warningButton removeFromSuperview];
  }
}

- (BOOL)isObscured
{
  return self->_obscuringView != 0;
}

- (UIVisualEffectView)blurEffect
{
  blurEffect = self->_blurEffect;
  if (!blurEffect)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F427D8];
    objc_super v5 = +[CKUIBehavior sharedBehaviors];
    id v6 = objc_msgSend(v4, "effectWithStyle:", objc_msgSend(v5, "obscurableBalloonBlurMaterial"));

    uint64_t v7 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v6];
    double v8 = self->_blurEffect;
    self->_blurEffect = v7;

    blurEffect = self->_blurEffect;
  }

  return blurEffect;
}

- (id)blurVisualEffect
{
  v2 = [(CKObscurableBalloonView *)self blurEffect];
  BOOL v3 = [v2 effect];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_containerView
{
  v2 = [(CKObscurableBalloonView *)self blurEffect];
  BOOL v3 = [v2 contentView];

  return v3;
}

- (UILabel)sensitiveContentDescription
{
  sensitiveContentDescription = self->_sensitiveContentDescription;
  if (!sensitiveContentDescription)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(UILabel *)v4 setNumberOfLines:0];
    [(UILabel *)v4 setTextAlignment:1];
    objc_super v5 = IMSharedUtilitiesFrameworkBundle();
    id v6 = [v5 localizedStringForKey:@"MAY_BE_SENSITIVE" value:&stru_1EDE4CA38 table:@"CommSafetyLocalizable"];
    [(UILabel *)v4 setText:v6];

    uint64_t v7 = +[CKUIBehavior sharedBehaviors];
    double v8 = [v7 sensitiveLabelColor];
    [(UILabel *)v4 setTextColor:v8];

    double v9 = +[CKUIBehavior sharedBehaviors];
    objc_super v10 = [v9 sensitiveLabelFont];
    [(UILabel *)v4 setFont:v10];

    uint64_t v11 = self->_sensitiveContentDescription;
    self->_sensitiveContentDescription = v4;

    sensitiveContentDescription = self->_sensitiveContentDescription;
  }

  return sensitiveContentDescription;
}

- (UIButton)showButton
{
  showButton = self->_showButton;
  if (!showButton)
  {
    id v4 = (UIButton *)objc_alloc_init(MEMORY[0x1E4F427E0]);
    objc_super v5 = +[CKUIBehavior sharedBehaviors];
    id v6 = [v5 obscurableBalloonShowButtonConfiguration];
    [(UIButton *)v4 setConfiguration:v6];

    uint64_t v7 = [(UIButton *)v4 titleLabel];
    [v7 _setOverrideUserInterfaceStyle:2];

    double v8 = [(UIButton *)v4 imageView];
    [v8 _setOverrideUserInterfaceStyle:2];

    double v9 = self->_showButton;
    self->_showButton = v4;

    showButton = self->_showButton;
  }

  return showButton;
}

- (UIImageView)obscuredContentBadgeView
{
  obscuredContentBadgeView = self->_obscuredContentBadgeView;
  if (!obscuredContentBadgeView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    objc_super v5 = +[CKUIBehavior sharedBehaviors];
    id v6 = [v5 obscurableBalloonObscuredContentBadgeImage];
    uint64_t v7 = (UIImageView *)[v4 initWithImage:v6];

    double v8 = +[CKUIBehavior sharedBehaviors];
    double v9 = [v8 obscurableBalloonBadgeTintColor];
    [(UIImageView *)v7 setTintColor:v9];

    [(UIImageView *)v7 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    objc_super v10 = self->_obscuredContentBadgeView;
    self->_obscuredContentBadgeView = v7;

    obscuredContentBadgeView = self->_obscuredContentBadgeView;
  }

  return obscuredContentBadgeView;
}

- (UIButton)warningButton
{
  warningButton = self->_warningButton;
  if (!warningButton)
  {
    id v4 = (UIButton *)objc_alloc_init(MEMORY[0x1E4F427E0]);
    objc_super v5 = +[CKUIBehavior sharedBehaviors];
    id v6 = [v5 obscurableBalloonWarningButtonConfiguration];
    [(UIButton *)v4 setConfiguration:v6];

    uint64_t v7 = [(UIButton *)v4 imageView];
    [v7 _setOverrideUserInterfaceStyle:2];

    [(UIButton *)v4 setShowsMenuAsPrimaryAction:1];
    double v8 = [(CKObscurableBalloonView *)self obscurableBalloonDelegate];
    if ([v8 isReportingEnabled]) {
      uint64_t v9 = 97;
    }
    else {
      uint64_t v9 = 1;
    }
    if (v8)
    {
      uint64_t v16 = 0;
      double v17 = &v16;
      uint64_t v18 = 0x2050000000;
      objc_super v10 = (void *)getSCUIMoreHelpContextMenuClass_softClass_0;
      uint64_t v19 = getSCUIMoreHelpContextMenuClass_softClass_0;
      if (!getSCUIMoreHelpContextMenuClass_softClass_0)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __getSCUIMoreHelpContextMenuClass_block_invoke_0;
        v15[3] = &unk_1E5620B90;
        v15[4] = &v16;
        __getSCUIMoreHelpContextMenuClass_block_invoke_0((uint64_t)v15);
        objc_super v10 = (void *)v17[3];
      }
      id v11 = v10;
      _Block_object_dispose(&v16, 8);
      double v12 = [v11 menuWithDelegate:self additionalOptions:v9];
      [(UIButton *)v4 setMenu:v12];
    }
    double v13 = self->_warningButton;
    self->_warningButton = v4;

    warningButton = self->_warningButton;
  }

  return warningButton;
}

- (void)_presentGetHelpAlert:(id)a3
{
  id v4 = [(CKObscurableBalloonView *)self obscurableBalloonDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKObscurableBalloonView *)self obscurableBalloonDelegate];
    [v6 presentGetHelpAlert];
  }
}

- (void)didAskForMoreHelp:(id)a3
{
  id v3 = [(CKObscurableBalloonView *)self obscurableBalloonDelegate];
  [v3 didTapWaysToGetHelp];
}

- (void)didBlockContact:(id)a3
{
  id v3 = [(CKObscurableBalloonView *)self obscurableBalloonDelegate];
  [v3 didTapBlockContact];
}

- (void)evidenceToReportWithContext:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = [(CKObscurableBalloonView *)self obscurableBalloonDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CKObscurableBalloonView *)self obscurableBalloonDelegate];
    [v9 evidenceToReportWithContext:v10 balloonView:self completionHandler:v6];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:0];
    v6[2](v6, 0, v9);
  }
}

- (CKObscurableBalloonViewDelegate)obscurableBalloonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_obscurableBalloonDelegate);

  return (CKObscurableBalloonViewDelegate *)WeakRetained;
}

- (void)setObscurableBalloonDelegate:(id)a3
{
}

- (void)setWarningButton:(id)a3
{
}

- (void)setShowButton:(id)a3
{
}

- (UIView)obscuringView
{
  return self->_obscuringView;
}

- (void)setObscuringView:(id)a3
{
}

- (void)setBlurEffect:(id)a3
{
}

- (void)setSensitiveContentDescription:(id)a3
{
}

- (void)setObscuredContentBadgeView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obscuredContentBadgeView, 0);
  objc_storeStrong((id *)&self->_sensitiveContentDescription, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_obscuringView, 0);
  objc_storeStrong((id *)&self->_showButton, 0);
  objc_storeStrong((id *)&self->_warningButton, 0);

  objc_destroyWeak((id *)&self->_obscurableBalloonDelegate);
}

@end