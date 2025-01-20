@interface CNSensitiveContentBlurView
- (BOOL)canRevealContent;
- (BOOL)canShowButtons;
- (CNContact)contact;
- (CNSensitiveContentAnalysisManager)sensitiveContentAnalysisManager;
- (CNSensitiveContentBlurView)initWithManager:(id)a3;
- (CNSensitiveContentBlurViewDelegate)delegate;
- (SCUIInterventionViewController)interventionViewController;
- (UIButton)revealButton;
- (UILabel)descriptionLabel;
- (UIVisualEffectView)blurView;
- (UIVisualEffectView)vibrancyView;
- (void)configureButtons;
- (void)configureButtonsConstraints;
- (void)configureConstraints;
- (void)configureSubviews;
- (void)didConfirmForInterventionViewController:(id)a3;
- (void)didRejectForInterventionViewController:(id)a3;
- (void)resetRevealState;
- (void)revealContent;
- (void)setBlurView:(id)a3;
- (void)setCanRevealContent:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setInterventionViewController:(id)a3;
- (void)setRevealButton:(id)a3;
- (void)setSensitiveContentAnalysisManager:(id)a3;
- (void)setVibrancyView:(id)a3;
@end

@implementation CNSensitiveContentBlurView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interventionViewController, 0);
  objc_storeStrong((id *)&self->_sensitiveContentAnalysisManager, 0);
  objc_storeStrong((id *)&self->_revealButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setInterventionViewController:(id)a3
{
}

- (SCUIInterventionViewController)interventionViewController
{
  return self->_interventionViewController;
}

- (void)setSensitiveContentAnalysisManager:(id)a3
{
}

- (CNSensitiveContentAnalysisManager)sensitiveContentAnalysisManager
{
  return self->_sensitiveContentAnalysisManager;
}

- (void)setRevealButton:(id)a3
{
}

- (void)setDescriptionLabel:(id)a3
{
}

- (void)setBlurView:(id)a3
{
}

- (void)setVibrancyView:(id)a3
{
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (BOOL)canRevealContent
{
  return self->_canRevealContent;
}

- (void)setDelegate:(id)a3
{
}

- (CNSensitiveContentBlurViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSensitiveContentBlurViewDelegate *)WeakRetained;
}

- (void)didRejectForInterventionViewController:(id)a3
{
  v4 = [(CNSensitiveContentBlurView *)self interventionViewController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__CNSensitiveContentBlurView_didRejectForInterventionViewController___block_invoke;
  v5[3] = &unk_1E549B488;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

uint64_t __69__CNSensitiveContentBlurView_didRejectForInterventionViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetRevealState];
}

- (void)didConfirmForInterventionViewController:(id)a3
{
  v4 = [(CNSensitiveContentBlurView *)self delegate];
  [v4 sensitiveContentBlurView:self didSetContentHidden:0];

  [(CNSensitiveContentBlurView *)self resetRevealState];
}

- (void)revealContent
{
  v3 = [(CNSensitiveContentBlurView *)self sensitiveContentAnalysisManager];
  int v4 = [v3 requiresDescriptiveInterventions];

  if (v4)
  {
    v5 = [(CNSensitiveContentBlurView *)self interventionViewController];

    if (!v5)
    {
      v6 = [MEMORY[0x1E4F9A688] viewControllerWithWorkflow:0 contextDictionary:0];
      [(CNSensitiveContentBlurView *)self setInterventionViewController:v6];

      v7 = [(CNSensitiveContentBlurView *)self interventionViewController];
      [v7 setInterventionDelegate:self];
    }
    id v9 = [(CNSensitiveContentBlurView *)self delegate];
    v8 = [(CNSensitiveContentBlurView *)self interventionViewController];
    [v9 sensitiveContentBlurView:self wantsToPresentInterventionController:v8];
  }
  else
  {
    id v9 = [(CNSensitiveContentBlurView *)self delegate];
    [v9 sensitiveContentBlurView:self didSetContentHidden:0];
  }
}

- (void)resetRevealState
{
  v3 = [(CNSensitiveContentBlurView *)self interventionViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  [(CNSensitiveContentBlurView *)self setInterventionViewController:0];
}

- (UIButton)revealButton
{
  BOOL v3 = [(CNSensitiveContentBlurView *)self canRevealContent];
  revealButton = self->_revealButton;
  if (v3)
  {
    if (!revealButton)
    {
      v5 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
      v6 = [v5 background];
      v7 = (void *)[v6 copy];

      v8 = [MEMORY[0x1E4FB14C8] effectWithStyle:16];
      [v7 setVisualEffect:v8];

      [v5 setBackground:v7];
      [v5 setCornerStyle:4];
      id v9 = [MEMORY[0x1E4FB1618] whiteColor];
      [v5 setBaseForegroundColor:v9];

      [v5 setButtonSize:2];
      v10 = CNContactsUIBundle();
      v11 = [v10 localizedStringForKey:@"SENSITIVE_CONTENT_BUTTON_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
      [v5 setTitle:v11];

      v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eye.fill"];
      [v5 setImage:v12];

      [v5 setImagePlacement:2];
      [v5 setImagePadding:2.0];
      objc_msgSend(v5, "setContentInsets:", 6.0, 15.0, 6.0, 15.0);
      v13 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v5 primaryAction:0];
      [(UIButton *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIButton *)v13 addTarget:self action:sel_revealContent forControlEvents:64];
      v14 = self->_revealButton;
      self->_revealButton = v13;
      v15 = v13;

      v16 = self->_revealButton;
      goto LABEL_6;
    }
  }
  else
  {
    self->_revealButton = 0;

    revealButton = self->_revealButton;
  }
  v16 = revealButton;
LABEL_6:

  return v16;
}

- (UILabel)descriptionLabel
{
  descriptionLabel = self->_descriptionLabel;
  if (descriptionLabel)
  {
    BOOL v3 = descriptionLabel;
  }
  else
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v5 setFont:v6];

    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v5 setTextColor:v7];

    [(UILabel *)v5 setNumberOfLines:2];
    [(UILabel *)v5 setTextAlignment:1];
    v8 = CNContactsUIBundle();
    id v9 = [v8 localizedStringForKey:@"SENSITIVE_CONTENT_DESCRIPTION" value:&stru_1ED8AC728 table:@"Localized"];
    [(UILabel *)v5 setText:v9];

    [(UILabel *)v5 setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = self->_descriptionLabel;
    self->_descriptionLabel = v5;
    v11 = v5;

    BOOL v3 = self->_descriptionLabel;
  }

  return v3;
}

- (UIVisualEffectView)blurView
{
  blurView = self->_blurView;
  if (blurView)
  {
    BOOL v3 = blurView;
  }
  else
  {
    v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:16];
    v6 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v5];
    [(UIVisualEffectView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = self->_blurView;
    self->_blurView = v6;
    v8 = v6;

    BOOL v3 = self->_blurView;
  }

  return v3;
}

- (void)configureButtonsConstraints
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if ([(CNSensitiveContentBlurView *)self canShowButtons])
  {
    BOOL v3 = [(CNSensitiveContentBlurView *)self revealButton];

    if (v3)
    {
      int v4 = [(CNSensitiveContentBlurView *)self revealButton];
      v5 = [v4 topAnchor];
      v6 = [(CNSensitiveContentBlurView *)self descriptionLabel];
      v7 = [v6 bottomAnchor];
      v8 = [v5 constraintEqualToAnchor:v7 constant:8.0];
      v14[0] = v8;
      id v9 = [(CNSensitiveContentBlurView *)self revealButton];
      v10 = [v9 centerXAnchor];
      v11 = [(CNSensitiveContentBlurView *)self centerXAnchor];
      v12 = [v10 constraintEqualToAnchor:v11];
      v14[1] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

      [MEMORY[0x1E4F28DC8] activateConstraints:v13];
    }
  }
}

- (void)configureConstraints
{
  v21[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNSensitiveContentBlurView *)self blurView];
  int v4 = [(UIView *)self constrainViewToEdgesConstraints:v3];
  v19 = [MEMORY[0x1E4F1CBF0] arrayByAddingObjectsFromArray:v4];

  double v5 = 0.0;
  if ([(CNSensitiveContentBlurView *)self canShowButtons])
  {
    if ([(CNSensitiveContentBlurView *)self canRevealContent]) {
      double v5 = -50.0;
    }
    else {
      double v5 = 0.0;
    }
  }
  v20 = [(CNSensitiveContentBlurView *)self descriptionLabel];
  v18 = [v20 centerYAnchor];
  v17 = [(CNSensitiveContentBlurView *)self centerYAnchor];
  v16 = [v18 constraintEqualToAnchor:v17 constant:v5];
  v21[0] = v16;
  v15 = [(CNSensitiveContentBlurView *)self descriptionLabel];
  v14 = [v15 leadingAnchor];
  v6 = [(CNSensitiveContentBlurView *)self leadingAnchor];
  v7 = [v14 constraintEqualToAnchor:v6 constant:17.0];
  v21[1] = v7;
  v8 = [(CNSensitiveContentBlurView *)self descriptionLabel];
  id v9 = [v8 trailingAnchor];
  v10 = [(CNSensitiveContentBlurView *)self trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:-17.0];
  v21[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  v13 = [v19 arrayByAddingObjectsFromArray:v12];

  [MEMORY[0x1E4F28DC8] activateConstraints:v13];
  [(CNSensitiveContentBlurView *)self configureButtonsConstraints];
}

- (void)configureButtons
{
  if ([(CNSensitiveContentBlurView *)self canShowButtons]
    && ([(CNSensitiveContentBlurView *)self revealButton],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(CNSensitiveContentBlurView *)self revealButton];
    -[CNSensitiveContentBlurView addSubview:](self, "addSubview:");
  }
  else
  {
    id v4 = [(CNSensitiveContentBlurView *)self revealButton];
    [v4 removeFromSuperview];
  }
}

- (void)configureSubviews
{
  BOOL v3 = [(CNSensitiveContentBlurView *)self blurView];
  [(CNSensitiveContentBlurView *)self addSubview:v3];

  id v4 = [(CNSensitiveContentBlurView *)self descriptionLabel];
  [(CNSensitiveContentBlurView *)self addSubview:v4];

  [(CNSensitiveContentBlurView *)self configureButtons];
}

- (BOOL)canShowButtons
{
  v2 = [(CNSensitiveContentBlurView *)self sensitiveContentAnalysisManager];
  char v3 = [v2 isEntitledForSensitiveContentUI];

  return v3;
}

- (void)setCanRevealContent:(BOOL)a3
{
  if (self->_canRevealContent != a3)
  {
    self->_canRevealContent = a3;
    [(CNSensitiveContentBlurView *)self configureButtons];
    [(CNSensitiveContentBlurView *)self configureConstraints];
    [(CNSensitiveContentBlurView *)self configureButtonsConstraints];
  }
}

- (CNSensitiveContentBlurView)initWithManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNSensitiveContentBlurView;
  v6 = [(CNSensitiveContentBlurView *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sensitiveContentAnalysisManager, a3);
    [(CNSensitiveContentBlurView *)v7 configureSubviews];
    [(CNSensitiveContentBlurView *)v7 configureConstraints];
    v8 = v7;
  }

  return v7;
}

@end