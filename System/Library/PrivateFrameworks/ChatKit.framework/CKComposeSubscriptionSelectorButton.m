@interface CKComposeSubscriptionSelectorButton
- (CKComposeSubscriptionSelectorButton)init;
- (CKComposeSubscriptionSelectorButtonDelegate)delegate;
- (TPBadgeView)badgeView;
- (UILabel)buttonTitleLabel;
- (UIStackView)stackView;
- (UITapGestureRecognizer)gestureRecognizer;
- (unint64_t)theme;
- (void)handleTap:(id)a3;
- (void)loadConstraintsForButton;
- (void)setBadgeView:(id)a3;
- (void)setButtonTitleLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTheme:(unint64_t)a3;
- (void)updateContentsWithTitle:(id)a3 badgeText:(id)a4 theme:(unint64_t)a5;
- (void)updateTheme;
- (void)updateTitleFont:(id)a3;
@end

@implementation CKComposeSubscriptionSelectorButton

- (void)updateContentsWithTitle:(id)a3 badgeText:(id)a4 theme:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(CKComposeSubscriptionSelectorButton *)self buttonTitleLabel];
  [v10 setText:v9];

  v11 = [(CKComposeSubscriptionSelectorButton *)self badgeView];
  [v11 setTitle:v8];

  v12 = [(CKComposeSubscriptionSelectorButton *)self badgeView];
  [v12 setTheme:0];

  [(CKComposeSubscriptionSelectorButton *)self setTheme:a5];
}

- (CKComposeSubscriptionSelectorButton)init
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)CKComposeSubscriptionSelectorButton;
  v2 = [(CKComposeSubscriptionSelectorButton *)&v15 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(CKComposeSubscriptionSelectorButton *)v2 setBackgroundColor:v3];

    [(CKComposeSubscriptionSelectorButton *)v2 setContextMenuIsPrimary:1];
    [(CKComposeSubscriptionSelectorButton *)v2 setContextMenuEnabled:1];
    v4 = [(CKComposeSubscriptionSelectorButton *)v2 gestureRecognizer];
    [v4 setEnabled:0];

    [(CKComposeSubscriptionSelectorButton *)v2 setTitle:&stru_1EDE4CA38];
    [(CKComposeSubscriptionSelectorButton *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v2 action:sel_handleTap_];
    gestureRecognizer = v2->_gestureRecognizer;
    v2->_gestureRecognizer = (UITapGestureRecognizer *)v5;

    [(CKComposeSubscriptionSelectorButton *)v2 addGestureRecognizer:v2->_gestureRecognizer];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    buttonTitleLabel = v2->_buttonTitleLabel;
    v2->_buttonTitleLabel = v7;

    [(UILabel *)v2->_buttonTitleLabel setUserInteractionEnabled:0];
    id v9 = objc_alloc(MEMORY[0x1E4F42E20]);
    v10 = [(CKComposeSubscriptionSelectorButton *)v2 badgeView];
    v16[0] = v10;
    v16[1] = v2->_buttonTitleLabel;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    uint64_t v12 = [v9 initWithArrangedSubviews:v11];
    stackView = v2->_stackView;
    v2->_stackView = (UIStackView *)v12;

    [(UIStackView *)v2->_stackView setAlignment:3];
    [(UIStackView *)v2->_stackView setAxis:0];
    [(UIStackView *)v2->_stackView setDistribution:3];
    -[UIStackView setLayoutMargins:](v2->_stackView, "setLayoutMargins:", 4.0, 5.0, 4.0, 5.0);
    [(UIStackView *)v2->_stackView setLayoutMarginsRelativeArrangement:1];
    [(UIStackView *)v2->_stackView setSpacing:6.0];
    [(UIStackView *)v2->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v2->_stackView setUserInteractionEnabled:1];
    [(CKComposeSubscriptionSelectorButton *)v2 addSubview:v2->_stackView];
    [(CKComposeSubscriptionSelectorButton *)v2 loadConstraintsForButton];
  }
  return v2;
}

- (void)loadConstraintsForButton
{
  v3 = [(CKComposeSubscriptionSelectorButton *)self stackView];
  v4 = [v3 topAnchor];
  uint64_t v5 = [(CKComposeSubscriptionSelectorButton *)self topAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];
  [v6 setActive:1];

  v7 = [(CKComposeSubscriptionSelectorButton *)self stackView];
  id v8 = [v7 bottomAnchor];
  id v9 = [(CKComposeSubscriptionSelectorButton *)self bottomAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  v11 = [(CKComposeSubscriptionSelectorButton *)self stackView];
  uint64_t v12 = [v11 leadingAnchor];
  v13 = [(CKComposeSubscriptionSelectorButton *)self leadingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  objc_super v15 = [(CKComposeSubscriptionSelectorButton *)self stackView];
  v16 = [v15 trailingAnchor];
  v17 = [(CKComposeSubscriptionSelectorButton *)self trailingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [(CKComposeSubscriptionSelectorButton *)self stackView];
  v20 = [v19 centerYAnchor];
  v21 = [(CKComposeSubscriptionSelectorButton *)self centerYAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [(CKComposeSubscriptionSelectorButton *)self badgeView];
  v24 = [v23 centerYAnchor];
  v25 = [(CKComposeSubscriptionSelectorButton *)self stackView];
  v26 = [v25 centerYAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  [v27 setActive:1];

  id v32 = [(CKComposeSubscriptionSelectorButton *)self buttonTitleLabel];
  v28 = [v32 centerYAnchor];
  v29 = [(CKComposeSubscriptionSelectorButton *)self stackView];
  v30 = [v29 centerYAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  [v31 setActive:1];
}

- (TPBadgeView)badgeView
{
  badgeView = self->_badgeView;
  if (!badgeView)
  {
    if (badgeView_onceToken != -1) {
      dispatch_once(&badgeView_onceToken, &__block_literal_global_269);
    }
    if ([(id)badgeView__CKTPBadgeView instancesRespondToSelector:sel_initWithTitle_])
    {
      v4 = (TPBadgeView *)[objc_alloc((Class)badgeView__CKTPBadgeView) initWithTitle:&stru_1EDE4CA38];
      uint64_t v5 = self->_badgeView;
      self->_badgeView = v4;
    }
    [(TPBadgeView *)self->_badgeView setSizeCategory:2];
    [(TPBadgeView *)self->_badgeView setAutoresizesSubviews:1];
    [(TPBadgeView *)self->_badgeView setAlpha:1.0];
    [(TPBadgeView *)self->_badgeView setTheme:0];
    badgeView = self->_badgeView;
  }

  return badgeView;
}

uint64_t __48__CKComposeSubscriptionSelectorButton_badgeView__block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"TPBadgeView", @"TelephonyUI");
  badgeView__CKTPBadgeView = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }
}

- (void)handleTap:(id)a3
{
  if ([a3 state] == 3)
  {
    v4 = [(CKComposeSubscriptionSelectorButton *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CKComposeSubscriptionSelectorButton *)self delegate];
      [v6 CKComposeSubscriptionSelectorButtonWasTapped:self];
    }
  }
}

- (void)updateTheme
{
  unint64_t v3 = [(CKComposeSubscriptionSelectorButton *)self theme];
  if (v3 == 2)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F428B8], "_tp_greenPillColor");
    id v8 = [(CKComposeSubscriptionSelectorButton *)self buttonTitleLabel];
    [v8 setTextColor:v7];

    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F428B8], "_tp_greenPillColor");
  }
  else
  {
    if (v3 != 1) {
      return;
    }
    v4 = objc_msgSend(MEMORY[0x1E4F428B8], "_tp_bluePillColor");
    char v5 = [(CKComposeSubscriptionSelectorButton *)self buttonTitleLabel];
    [v5 setTextColor:v4];

    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F428B8], "_tp_bluePillColor");
  }
  id v10 = (id)v6;
  id v9 = [(CKComposeSubscriptionSelectorButton *)self badgeView];
  [v9 setBackgroundColor:v10];
}

- (void)updateTitleFont:(id)a3
{
  id v4 = a3;
  id v5 = [(CKComposeSubscriptionSelectorButton *)self buttonTitleLabel];
  [v5 setFont:v4];
}

- (void)setTheme:(unint64_t)a3
{
  if (self->_theme != a3)
  {
    self->_theme = a3;
    [(CKComposeSubscriptionSelectorButton *)self updateTheme];
  }
}

- (CKComposeSubscriptionSelectorButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKComposeSubscriptionSelectorButtonDelegate *)WeakRetained;
}

- (unint64_t)theme
{
  return self->_theme;
}

- (void)setBadgeView:(id)a3
{
}

- (UILabel)buttonTitleLabel
{
  return self->_buttonTitleLabel;
}

- (void)setButtonTitleLabel:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UITapGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_buttonTitleLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end