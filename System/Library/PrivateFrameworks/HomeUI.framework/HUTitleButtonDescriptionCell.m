@interface HUTitleButtonDescriptionCell
- (BOOL)buttonColorFollowsTintColor;
- (BOOL)hideButton;
- (HUTitleButtonDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUTitleButtonDescriptionCellDelegate)delegate;
- (NSString)buttonText;
- (UIButton)valueButton;
- (UIFont)buttonFont;
- (void)_updateButtonHidden;
- (void)handleRemoveAction:(id)a3;
- (void)prepareForReuse;
- (void)setButtonColorFollowsTintColor:(BOOL)a3;
- (void)setButtonFont:(id)a3;
- (void)setButtonText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHideButton:(BOOL)a3;
- (void)setValueButton:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUTitleButtonDescriptionCell

- (HUTitleButtonDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUTitleButtonDescriptionCell;
  v7 = [(HUTitleDescriptionCell *)&v21 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
    buttonFont = v7->_buttonFont;
    v7->_buttonFont = (UIFont *)v8;

    [(HUTitleDescriptionCell *)v7 setMaxNumberOfTitleLines:0];
    [(HUTitleDescriptionCell *)v7 setMaxNumberOfDescriptionLines:1];
    [(HUTitleButtonDescriptionCell *)v7 setButtonText:&stru_1F18F92B8];
    v10 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
    uint64_t v11 = [MEMORY[0x1E4F427E0] buttonWithConfiguration:v10 primaryAction:0];
    valueButton = v7->_valueButton;
    v7->_valueButton = (UIButton *)v11;

    objc_initWeak(&location, v7);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __62__HUTitleButtonDescriptionCell_initWithStyle_reuseIdentifier___block_invoke;
    v18 = &unk_1E638E688;
    objc_copyWeak(&v19, &location);
    [(UIButton *)v7->_valueButton setConfigurationUpdateHandler:&v15];
    -[UIButton setConfiguration:](v7->_valueButton, "setConfiguration:", v10, v15, v16, v17, v18);
    [(UIButton *)v7->_valueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v7->_valueButton addTarget:v7 action:sel_handleRemoveAction_ forControlEvents:64];
    v13 = [(HUTitleButtonDescriptionCell *)v7 contentView];
    [v13 addSubview:v7->_valueButton];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __62__HUTitleButtonDescriptionCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v4 = (void *)MEMORY[0x1E4F427E8];
  id v5 = a2;
  id v18 = [v4 plainButtonConfiguration];
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v8 = [WeakRetained isDisabled];
  if ((v8 & 1) != 0
    || (id v2 = objc_loadWeakRetained((id *)(a1 + 32)), ![v2 buttonColorFollowsTintColor]))
  {
    v10 = [MEMORY[0x1E4F428B8] systemGrayColor];
    if (v8) {
      goto LABEL_6;
    }
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = [v9 tintColor];
  }
LABEL_6:

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = objc_loadWeakRetained(v6);
  v13 = [v12 titleFont];
  [v11 setObject:v13 forKey:*MEMORY[0x1E4F42508]];

  [v11 setObject:v10 forKey:*MEMORY[0x1E4F42510]];
  id v14 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v15 = objc_loadWeakRetained(v6);
  uint64_t v16 = [v15 buttonText];
  v17 = (void *)[v14 initWithString:v16 attributes:v11];
  [v18 setAttributedTitle:v17];

  objc_msgSend(v18, "setContentInsets:", *MEMORY[0x1E4F424F0], *(double *)(MEMORY[0x1E4F424F0] + 8), *(double *)(MEMORY[0x1E4F424F0] + 16), *(double *)(MEMORY[0x1E4F424F0] + 24));
  [v5 setConfiguration:v18];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HUTitleButtonDescriptionCell;
  [(HUTitleDescriptionCell *)&v4 prepareForReuse];
  [(HUTitleButtonDescriptionCell *)self setHideButton:0];
  [(HUTitleButtonDescriptionCell *)self setButtonText:0];
  v3 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  [(HUTitleButtonDescriptionCell *)self setButtonFont:v3];

  [(HUTitleButtonDescriptionCell *)self setButtonColorFollowsTintColor:0];
}

- (void)setHideButton:(BOOL)a3
{
  if (self->_hideButton != a3)
  {
    self->_hideButton = a3;
    [(HUTitleButtonDescriptionCell *)self _updateButtonHidden];
  }
}

- (void)setButtonText:(id)a3
{
  id v5 = a3;
  id v6 = [(HUTitleButtonDescriptionCell *)self buttonText];
  id v7 = v5;
  id v13 = v7;
  if (v6 == v7)
  {

    v10 = v13;
LABEL_8:

    id v9 = v13;
    goto LABEL_9;
  }
  if (!v6)
  {

    goto LABEL_7;
  }
  char v8 = [v6 isEqual:v7];

  id v9 = v13;
  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_buttonText, a3);
    id v11 = [(HUTitleButtonDescriptionCell *)self valueButton];
    v10 = [v11 configuration];

    [v10 setTitle:v13];
    id v12 = [(HUTitleButtonDescriptionCell *)self valueButton];
    [v12 setConfiguration:v10];

    [(HUTitleButtonDescriptionCell *)self _updateButtonHidden];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)setButtonFont:(id)a3
{
  id v10 = a3;
  if ((-[UIFont isEqual:](self->_buttonFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_buttonFont, a3);
    id v5 = [(HUTitleButtonDescriptionCell *)self valueButton];
    id v6 = [v5 configuration];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v7 setObject:v10 forKey:*MEMORY[0x1E4F42508]];
    char v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:self->_buttonText attributes:v7];
    [v6 setAttributedTitle:v8];

    id v9 = [(HUTitleButtonDescriptionCell *)self valueButton];
    [v9 setConfiguration:v6];
  }
}

- (void)setButtonColorFollowsTintColor:(BOOL)a3
{
  if ([(HUTitleButtonDescriptionCell *)self buttonColorFollowsTintColor] != a3) {
    self->_buttonColorFollowsTintColor = a3;
  }
}

- (void)updateConstraints
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v41.receiver = self;
  v41.super_class = (Class)HUTitleButtonDescriptionCell;
  [(HUTitleDescriptionCell *)&v41 updateConstraints];
  objc_super v4 = [(HUTitleButtonDescriptionCell *)self valueButton];
  id v5 = [v4 superview];

  if (v5)
  {
    id v6 = [(HUTitleButtonDescriptionCell *)self valueButton];
    id v7 = [v6 centerYAnchor];
    char v8 = [(HUTitleButtonDescriptionCell *)self contentView];
    id v9 = [v8 centerYAnchor];
    id v10 = [v7 constraintEqualToAnchor:v9];
    [v3 addObject:v10];

    id v11 = [(HUTitleButtonDescriptionCell *)self contentView];
    id v12 = [v11 layoutMarginsGuide];
    id v13 = [v12 trailingAnchor];
    id v14 = [(HUTitleButtonDescriptionCell *)self valueButton];
    id v15 = [v14 trailingAnchor];
    uint64_t v16 = [v13 constraintEqualToSystemSpacingAfterAnchor:v15 multiplier:1.0];
    [v3 addObject:v16];

    v17 = [(HUTitleButtonDescriptionCell *)self valueButton];
    LODWORD(v18) = 1144750080;
    [v17 setContentCompressionResistancePriority:0 forAxis:v18];

    id v19 = [(HUTitleDescriptionCell *)self titleLabel];
    v20 = [v19 trailingAnchor];
    objc_super v21 = [v20 constraintsAffectingLayout];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __49__HUTitleButtonDescriptionCell_updateConstraints__block_invoke;
    v40[3] = &unk_1E638D2A8;
    v40[4] = self;
    objc_msgSend(v21, "na_each:", v40);

    v22 = [(HUTitleDescriptionCell *)self descriptionLabel];
    v23 = [v22 trailingAnchor];
    v24 = [v23 constraintsAffectingLayout];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __49__HUTitleButtonDescriptionCell_updateConstraints__block_invoke_2;
    v39[3] = &unk_1E638D2A8;
    v39[4] = self;
    objc_msgSend(v24, "na_each:", v39);

    v25 = [(HUTitleDescriptionCell *)self titleTrailingConstraint];
    [v25 setActive:0];

    v26 = [(HUTitleDescriptionCell *)self descriptionTrailingConstraint];
    [v26 setActive:0];

    v27 = [(HUTitleDescriptionCell *)self descriptionLabel];
    LODWORD(v28) = 1132068864;
    [v27 setContentCompressionResistancePriority:0 forAxis:v28];

    v29 = [(HUTitleButtonDescriptionCell *)self valueButton];
    v30 = [v29 leadingAnchor];
    v31 = [(HUTitleDescriptionCell *)self titleLabel];
    v32 = [v31 trailingAnchor];
    v33 = [v30 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v32 multiplier:1.0];
    [v3 addObject:v33];

    v34 = [(HUTitleButtonDescriptionCell *)self valueButton];
    v35 = [v34 leadingAnchor];
    v36 = [(HUTitleDescriptionCell *)self descriptionLabel];
    v37 = [v36 trailingAnchor];
    v38 = [v35 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v37 multiplier:1.0];
    [v3 addObject:v38];
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
}

void __49__HUTitleButtonDescriptionCell_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  v3 = [v13 firstAnchor];
  objc_super v4 = [*(id *)(a1 + 32) titleLabel];
  id v5 = [v4 trailingAnchor];
  if ([v3 isEqual:v5]) {
    [v13 secondAnchor];
  }
  else {
  id v6 = [v13 firstAnchor];
  }

  id v7 = [*(id *)(a1 + 32) titleLabel];
  char v8 = [v7 superview];
  id v9 = [v8 trailingAnchor];
  if ([v6 isEqual:v9])
  {
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) containerView];
    id v11 = [v10 trailingAnchor];
    int v12 = [v6 isEqual:v11];

    if (!v12) {
      goto LABEL_8;
    }
  }
  [v13 setActive:0];
LABEL_8:
}

void __49__HUTitleButtonDescriptionCell_updateConstraints__block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  v3 = [v13 firstAnchor];
  objc_super v4 = [*(id *)(a1 + 32) descriptionLabel];
  id v5 = [v4 trailingAnchor];
  if ([v3 isEqual:v5]) {
    [v13 secondAnchor];
  }
  else {
  id v6 = [v13 firstAnchor];
  }

  id v7 = [*(id *)(a1 + 32) descriptionLabel];
  char v8 = [v7 superview];
  id v9 = [v8 trailingAnchor];
  if ([v6 isEqual:v9])
  {
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) containerView];
    id v11 = [v10 trailingAnchor];
    int v12 = [v6 isEqual:v11];

    if (!v12) {
      goto LABEL_8;
    }
  }
  [v13 setActive:0];
LABEL_8:
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUTitleButtonDescriptionCell;
  [(HUTitleDescriptionCell *)&v9 updateUIWithAnimation:a3];
  [(HUTitleButtonDescriptionCell *)self setSelectionStyle:0];
  objc_opt_class();
  objc_super v4 = [(HUIconCell *)self item];
  id v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68990]];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  [(HUTitleButtonDescriptionCell *)self setButtonText:v8];
}

- (void)_updateButtonHidden
{
  if ([(HUTitleButtonDescriptionCell *)self hideButton])
  {
    BOOL v3 = 1;
  }
  else
  {
    objc_super v4 = [(HUTitleButtonDescriptionCell *)self buttonText];
    BOOL v3 = [v4 length] == 0;
  }
  id v5 = [(HUTitleButtonDescriptionCell *)self valueButton];
  id v6 = [v5 superview];
  BOOL v7 = v6 != 0;

  if (((v3 ^ v7) & 1) == 0)
  {
    if (v3)
    {
      id v8 = [(HUTitleButtonDescriptionCell *)self valueButton];
      [v8 removeFromSuperview];
    }
    else
    {
      id v8 = [(HUTitleButtonDescriptionCell *)self contentView];
      objc_super v9 = [(HUTitleButtonDescriptionCell *)self valueButton];
      [v8 addSubview:v9];
    }
    [(HUTitleButtonDescriptionCell *)self setNeedsUpdateConstraints];
    [(HUTitleDescriptionCell *)self updateTitle];
  }
}

- (void)handleRemoveAction:(id)a3
{
  id v5 = [(HUTitleButtonDescriptionCell *)self delegate];
  objc_super v4 = [(HUIconCell *)self item];
  [v5 buttonTappedForCell:self withItem:v4];
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (UIFont)buttonFont
{
  return self->_buttonFont;
}

- (BOOL)hideButton
{
  return self->_hideButton;
}

- (BOOL)buttonColorFollowsTintColor
{
  return self->_buttonColorFollowsTintColor;
}

- (HUTitleButtonDescriptionCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTitleButtonDescriptionCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)valueButton
{
  return self->_valueButton;
}

- (void)setValueButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonFont, 0);

  objc_storeStrong((id *)&self->_buttonText, 0);
}

@end