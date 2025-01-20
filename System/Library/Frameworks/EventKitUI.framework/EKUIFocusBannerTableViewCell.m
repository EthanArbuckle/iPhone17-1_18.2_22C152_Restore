@interface EKUIFocusBannerTableViewCell
- (BOOL)on;
- (EKUIFocusBannerTableViewCell)initWithReuseIdentifier:(id)a3;
- (EKUIFocusBannerTableViewCellDelegate)delegate;
- (id)_configuration;
- (id)_focusFilterButtonConfiguration;
- (void)_tapped;
- (void)_updateView;
- (void)setDelegate:(id)a3;
- (void)setOn:(BOOL)a3;
@end

@implementation EKUIFocusBannerTableViewCell

- (EKUIFocusBannerTableViewCell)initWithReuseIdentifier:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)EKUIFocusBannerTableViewCell;
  v5 = [(EKUIFocusBannerTableViewCell *)&v25 initWithStyle:0 reuseIdentifier:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1950]);
    v7 = [(EKUIFocusBannerTableViewCell *)v5 _configuration];
    uint64_t v8 = [v6 initWithConfiguration:v7];
    listContentView = v5->_listContentView;
    v5->_listContentView = (UIListContentView *)v8;

    [(UIListContentView *)v5->_listContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(EKUIFocusBannerTableViewCell *)v5 contentView];
    [v10 addSubview:v5->_listContentView];

    uint64_t v11 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    focusFilterToggleButton = v5->_focusFilterToggleButton;
    v5->_focusFilterToggleButton = (UIButton *)v11;

    v13 = [(EKUIFocusBannerTableViewCell *)v5 _focusFilterButtonConfiguration];
    [(UIButton *)v5->_focusFilterToggleButton setConfiguration:v13];

    [(UIButton *)v5->_focusFilterToggleButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v14) = 1148846080;
    [(UIButton *)v5->_focusFilterToggleButton setContentCompressionResistancePriority:0 forAxis:v14];
    LODWORD(v15) = 1148846080;
    [(UIButton *)v5->_focusFilterToggleButton setContentCompressionResistancePriority:1 forAxis:v15];
    v16 = [(EKUIFocusBannerTableViewCell *)v5 contentView];
    [v16 addSubview:v5->_focusFilterToggleButton];

    objc_initWeak(&location, v5);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __56__EKUIFocusBannerTableViewCell_initWithReuseIdentifier___block_invoke;
    v22[3] = &unk_1E6089838;
    objc_copyWeak(&v23, &location);
    [(UIButton *)v5->_focusFilterToggleButton setConfigurationUpdateHandler:v22];
    [(UIButton *)v5->_focusFilterToggleButton addTarget:v5 action:sel__tapped forControlEvents:0x2000];
    [(EKUIFocusBannerTableViewCell *)v5 _updateView];
    v26[0] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__EKUIFocusBannerTableViewCell_initWithReuseIdentifier___block_invoke_2;
    v20[3] = &unk_1E60874F8;
    objc_copyWeak(&v21, &location);
    id v18 = (id)[(EKUIFocusBannerTableViewCell *)v5 registerForTraitChanges:v17 withHandler:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __56__EKUIFocusBannerTableViewCell_initWithReuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained _focusFilterButtonConfiguration];
    [v6 setConfiguration:v5];
  }
}

void __56__EKUIFocusBannerTableViewCell_initWithReuseIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateView];
}

- (void)_tapped
{
  [(EKUIFocusBannerTableViewCell *)self setOn:[(EKUIFocusBannerTableViewCell *)self on] ^ 1];
  v3 = [(EKUIFocusBannerTableViewCell *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(EKUIFocusBannerTableViewCell *)self delegate];
    [v5 focusBannerTableViewCellToggled:self];
  }
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    [(EKUIFocusBannerTableViewCell *)self _updateView];
  }
}

- (void)_updateView
{
  v47[6] = *MEMORY[0x1E4F143B8];
  v3 = [(EKUIFocusBannerTableViewCell *)self _configuration];
  [(UIListContentView *)self->_listContentView setConfiguration:v3];

  char v4 = [(EKUIFocusBannerTableViewCell *)self _focusFilterButtonConfiguration];
  [(UIButton *)self->_focusFilterToggleButton setConfiguration:v4];

  if (self->_constraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  id v5 = [(EKUIFocusBannerTableViewCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  uint64_t v8 = [(UIListContentView *)self->_listContentView leadingAnchor];
  v44 = [(EKUIFocusBannerTableViewCell *)self contentView];
  [v44 leadingAnchor];
  v43 = v45 = v8;
  uint64_t v9 = objc_msgSend(v8, "constraintEqualToAnchor:");
  v42 = (void *)v9;
  if (IsAccessibilityCategory)
  {
    v47[0] = v9;
    v10 = [(UIListContentView *)self->_listContentView trailingAnchor];
    v40 = [(EKUIFocusBannerTableViewCell *)self contentView];
    [v40 trailingAnchor];
    v39 = v41 = v10;
    v38 = objc_msgSend(v10, "constraintEqualToAnchor:");
    v47[1] = v38;
    uint64_t v11 = [(UIListContentView *)self->_listContentView topAnchor];
    v36 = [(EKUIFocusBannerTableViewCell *)self contentView];
    [v36 topAnchor];
    v35 = v37 = v11;
    v34 = objc_msgSend(v11, "constraintEqualToAnchor:");
    v47[2] = v34;
    v12 = [(UIButton *)self->_focusFilterToggleButton topAnchor];
    v32 = [(UIListContentView *)self->_listContentView bottomAnchor];
    v33 = v12;
    v31 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", 8.0);
    v47[3] = v31;
    v13 = [(UIButton *)self->_focusFilterToggleButton bottomAnchor];
    v29 = [(EKUIFocusBannerTableViewCell *)self contentView];
    double v14 = [v29 layoutMarginsGuide];
    double v15 = [v14 bottomAnchor];
    v30 = v13;
    v16 = [v13 constraintEqualToAnchor:v15];
    v47[4] = v16;
    v17 = [(UIButton *)self->_focusFilterToggleButton leadingAnchor];
    id v18 = [(EKUIFocusBannerTableViewCell *)self contentView];
    v19 = [v18 layoutMarginsGuide];
    v20 = [v19 leadingAnchor];
    id v21 = [v17 constraintEqualToAnchor:v20];
    v47[5] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:6];
    constraints = self->_constraints;
    self->_constraints = v22;
  }
  else
  {
    v46[0] = v9;
    v24 = [(UIListContentView *)self->_listContentView topAnchor];
    v40 = [(EKUIFocusBannerTableViewCell *)self contentView];
    [v40 topAnchor];
    v39 = v41 = v24;
    v38 = objc_msgSend(v24, "constraintEqualToAnchor:");
    v46[1] = v38;
    objc_super v25 = [(UIListContentView *)self->_listContentView bottomAnchor];
    v36 = [(EKUIFocusBannerTableViewCell *)self contentView];
    [v36 bottomAnchor];
    v35 = v37 = v25;
    v34 = objc_msgSend(v25, "constraintEqualToAnchor:");
    v46[2] = v34;
    v26 = [(UIButton *)self->_focusFilterToggleButton leadingAnchor];
    v32 = [(UIListContentView *)self->_listContentView trailingAnchor];
    v33 = v26;
    v31 = objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:");
    v46[3] = v31;
    v27 = [(UIButton *)self->_focusFilterToggleButton trailingAnchor];
    v29 = [(EKUIFocusBannerTableViewCell *)self contentView];
    double v14 = [v29 layoutMarginsGuide];
    double v15 = [v14 trailingAnchor];
    v30 = v27;
    v16 = [v27 constraintEqualToAnchor:v15];
    v46[4] = v16;
    v17 = [(UIButton *)self->_focusFilterToggleButton centerYAnchor];
    id v18 = [(EKUIFocusBannerTableViewCell *)self contentView];
    v19 = [v18 centerYAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    v46[5] = v20;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:6];
    id v21 = self->_constraints;
    self->_constraints = v28;
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
}

- (id)_configuration
{
  v3 = [MEMORY[0x1E4FB1948] cellConfiguration];
  LODWORD(self) = [(EKUIFocusBannerTableViewCell *)self on];
  char v4 = EventKitUIBundle();
  id v5 = v4;
  if (self)
  {
    id v6 = [v4 localizedStringForKey:@"Filtered by Focus" value:&stru_1F0CC2140 table:0];

    v7 = [MEMORY[0x1E4FB1618] labelColor];
    [MEMORY[0x1E4FB1618] systemIndigoColor];
  }
  else
  {
    id v6 = [v4 localizedStringForKey:@"Focus Filter Off" value:&stru_1F0CC2140 table:0];

    v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [MEMORY[0x1E4FB1618] secondaryLabelColor];
  uint64_t v8 = };
  uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"moon.circle.fill"];
  [v3 setImage:v9];

  v10 = [v3 imageProperties];
  [v10 setTintColor:v8];

  [v3 setText:v6];
  uint64_t v11 = [v3 textProperties];
  [v11 setColor:v7];

  v12 = [v3 textProperties];
  [v12 setNumberOfLines:0];

  return v3;
}

- (id)_focusFilterButtonConfiguration
{
  v20[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKUIFocusBannerTableViewCell *)self on];
  char v4 = EventKitUIBundle();
  id v5 = v4;
  if (v3) {
    id v6 = @"Turn Off";
  }
  else {
    id v6 = @"Turn On";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_1F0CC2140 table:0];

  uint64_t v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:32770 options:0];
  uint64_t v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];
  v10 = [MEMORY[0x1E4FB1618] systemIndigoColor];
  uint64_t v11 = *MEMORY[0x1E4FB0700];
  v19[0] = *MEMORY[0x1E4FB06F8];
  v19[1] = v11;
  v20[0] = v9;
  v20[1] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v12];
  double v14 = [(EKUIFocusBannerTableViewCell *)self traitCollection];
  double v15 = [v14 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  if (IsAccessibilityCategory)
  {
    v17 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
    [v17 setCornerStyle:4];
    [v17 setButtonSize:0];
  }
  else
  {
    v17 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    objc_msgSend(v17, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  }
  [v17 setAttributedTitle:v13];
  [v17 setTitleLineBreakMode:2];

  return v17;
}

- (BOOL)on
{
  return self->_on;
}

- (EKUIFocusBannerTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKUIFocusBannerTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);

  objc_storeStrong((id *)&self->_focusFilterToggleButton, 0);
}

@end