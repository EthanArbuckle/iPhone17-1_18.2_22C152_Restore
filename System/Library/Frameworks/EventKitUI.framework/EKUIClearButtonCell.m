@interface EKUIClearButtonCell
- (EKUIClearButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIButton)clearButton;
- (id)configuration;
- (void)_updateConfigurationNumLines:(id)a3;
- (void)_updateConstraints;
- (void)setTitleSubtitleContentConfiguration:(id)a3;
@end

@implementation EKUIClearButtonCell

- (EKUIClearButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)EKUIClearButtonCell;
  v7 = [(EKUITableViewCell *)&v23 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    v8 = [EKUIClearButton alloc];
    v9 = ClearButtonImageColor();
    uint64_t v10 = [(EKUIClearButton *)v8 initWithColor:v9];
    clearButton = v7->_clearButton;
    v7->_clearButton = (UIButton *)v10;

    [(UIButton *)v7->_clearButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(EKUIClearButtonCell *)v7 contentView];
    [v12 addSubview:v7->_clearButton];

    v13 = [(EKUIClearButtonCell *)v7 defaultContentConfiguration];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1950]) initWithConfiguration:v13];
    listContentView = v7->_listContentView;
    v7->_listContentView = (UIListContentView *)v14;

    [(UIListContentView *)v7->_listContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [(EKUIClearButtonCell *)v7 contentView];
    [v16 addSubview:v7->_listContentView];

    [(EKUIClearButtonCell *)v7 _updateConstraints];
    objc_initWeak(&location, v7);
    v24[0] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __53__EKUIClearButtonCell_initWithStyle_reuseIdentifier___block_invoke;
    v20[3] = &unk_1E60874F8;
    objc_copyWeak(&v21, &location);
    id v18 = (id)[(EKUIClearButtonCell *)v7 registerForTraitChanges:v17 withHandler:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __53__EKUIClearButtonCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = [WeakRetained[135] configuration];
    [v3 _updateConfigurationNumLines:v2];
    [v3[135] setConfiguration:v2];

    WeakRetained = v3;
  }
}

- (void)_updateConstraints
{
  v29[6] = *MEMORY[0x1E4F143B8];
  if (self->_constraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  v27 = [(UIListContentView *)self->_listContentView leadingAnchor];
  v28 = [(EKUIClearButtonCell *)self contentView];
  v26 = [v28 leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v29[0] = v25;
  objc_super v23 = [(UIListContentView *)self->_listContentView topAnchor];
  v24 = [(EKUIClearButtonCell *)self contentView];
  v22 = [v24 topAnchor];
  id v21 = [v23 constraintEqualToAnchor:v22];
  v29[1] = v21;
  v19 = [(UIListContentView *)self->_listContentView bottomAnchor];
  v20 = [(EKUIClearButtonCell *)self contentView];
  id v18 = [v20 bottomAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v29[2] = v17;
  v16 = [(UIButton *)self->_clearButton leadingAnchor];
  v15 = [(UIListContentView *)self->_listContentView trailingAnchor];
  uint64_t v14 = [v16 constraintGreaterThanOrEqualToAnchor:v15];
  v29[3] = v14;
  v13 = [(EKUIClearButtonCell *)self contentView];
  v3 = [v13 layoutMarginsGuide];
  v4 = [v3 trailingAnchor];
  v5 = [(UIButton *)self->_clearButton trailingAnchor];
  +[EKUIClearButton trailingOffsetToMarginForTextFieldClearButtonAlignment];
  id v6 = objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5);
  v29[4] = v6;
  v7 = [(UIButton *)self->_clearButton centerYAnchor];
  v8 = [(EKUIClearButtonCell *)self contentView];
  v9 = [v8 centerYAnchor];
  uint64_t v10 = [v7 constraintEqualToAnchor:v9];
  v29[5] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];
  constraints = self->_constraints;
  self->_constraints = v11;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
}

- (void)setTitleSubtitleContentConfiguration:(id)a3
{
  id v4 = a3;
  [(EKUIClearButtonCell *)self _updateConfigurationNumLines:v4];
  [(UIListContentView *)self->_listContentView setConfiguration:v4];
}

- (void)_updateConfigurationNumLines:(id)a3
{
  id v4 = a3;
  v5 = [(EKUIClearButtonCell *)self traitCollection];
  category = [v5 preferredContentSizeCategory];

  BOOL v6 = !UIContentSizeCategoryIsAccessibilityCategory(category);
  v7 = [v4 textProperties];
  [v7 setNumberOfLines:v6];

  v8 = [v4 secondaryTextProperties];

  [v8 setNumberOfLines:v6];
}

- (id)configuration
{
  if (self->_listContentView)
  {
    v2 = [(UIListContentView *)self->_listContentView configuration];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)EKUIClearButtonCell;
    v2 = [(EKUIClearButtonCell *)&v4 defaultContentConfiguration];
  }

  return v2;
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_listContentView, 0);
}

@end