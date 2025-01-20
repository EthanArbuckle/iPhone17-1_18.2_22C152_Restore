@interface EKUIPopupTableViewCell
- (BOOL)showSelectedImage;
- (BOOL)titleStrikethrough;
- (EKUIPopupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIMenu)popupMenu;
- (id)popupMenuProvider;
- (id)textLabel;
- (void)_updateConstraints;
- (void)setPopupMenu:(id)a3;
- (void)setPopupMenuProvider:(id)a3;
- (void)setShowSelectedImage:(BOOL)a3;
- (void)setTitleStrikethrough:(BOOL)a3;
@end

@implementation EKUIPopupTableViewCell

- (EKUIPopupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v34.receiver = self;
  v34.super_class = (Class)EKUIPopupTableViewCell;
  v7 = [(EKUITableViewCell *)&v34 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v7->_textLabel;
    v7->_textLabel = v8;

    v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v7->_textLabel setFont:v10];

    [(UILabel *)v7->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7->_textLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v11) = 1148846080;
    [(UILabel *)v7->_textLabel setContentCompressionResistancePriority:0 forAxis:v11];
    v12 = [(EKUIPopupTableViewCell *)v7 contentView];
    [v12 addSubview:v7->_textLabel];

    v13 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v13 setTitleLineBreakMode:4];
    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v13 setBaseForegroundColor:v14];

    [v13 contentInsets];
    double v16 = v15;
    [v13 contentInsets];
    objc_msgSend(v13, "setContentInsets:", v16, 0.0);
    uint64_t v17 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v13 primaryAction:0];
    popupButton = v7->_popupButton;
    v7->_popupButton = (UIButton *)v17;

    [(UIButton *)v7->_popupButton setChangesSelectionAsPrimaryAction:1];
    [(UIButton *)v7->_popupButton setShowsMenuAsPrimaryAction:1];
    v19 = [MEMORY[0x1E4FB13F0] actionWithTitle:&stru_1F0CC2140 image:0 identifier:0 handler:&__block_literal_global_31];
    v20 = (void *)MEMORY[0x1E4FB1970];
    v36[0] = v19;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    v22 = [v20 menuWithChildren:v21];
    [(UIButton *)v7->_popupButton setMenu:v22];

    objc_initWeak(&location, v7);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __56__EKUIPopupTableViewCell_initWithStyle_reuseIdentifier___block_invoke_2;
    v31[3] = &unk_1E6089838;
    objc_copyWeak(&v32, &location);
    [(UIButton *)v7->_popupButton setConfigurationUpdateHandler:v31];
    [(UIButton *)v7->_popupButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v23) = 1144750080;
    [(UIButton *)v7->_popupButton setContentCompressionResistancePriority:0 forAxis:v23];
    [(EKUIPopupTableViewCell *)v7 _setPopupMenuButton:v7->_popupButton];
    v24 = [(EKUIPopupTableViewCell *)v7 contentView];
    [v24 addSubview:v7->_popupButton];

    [(EKUIPopupTableViewCell *)v7 _updateConstraints];
    objc_initWeak(&from, v7);
    uint64_t v35 = objc_opt_class();
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __56__EKUIPopupTableViewCell_initWithStyle_reuseIdentifier___block_invoke_121;
    v28[3] = &unk_1E60874F8;
    objc_copyWeak(&v29, &from);
    id v26 = (id)[(EKUIPopupTableViewCell *)v7 registerForTraitChanges:v25 withHandler:v28];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __56__EKUIPopupTableViewCell_initWithStyle_reuseIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [v3 configuration];
  id v6 = [v3 menu];
  v7 = [v6 selectedElements];
  v8 = [v7 firstObject];

  if ([WeakRetained showSelectedImage])
  {
    v9 = [v8 image];
    [v5 setImage:v9];

    [v5 setImagePadding:8.0];
    v10 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28F0]];
    [v5 setPreferredSymbolConfigurationForImage:v10];
  }
  if ([WeakRetained titleStrikethrough])
  {
    double v11 = [WeakRetained detailTextLabel];
    v12 = [v11 font];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    }
    double v15 = v14;

    double v16 = [WeakRetained detailTextLabel];
    uint64_t v17 = [v16 textColor];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    v20 = v19;

    uint64_t v21 = *MEMORY[0x1E4FB06F8];
    v29[0] = *MEMORY[0x1E4FB0768];
    v29[1] = v21;
    v30[0] = &unk_1F0D03808;
    v30[1] = v15;
    uint64_t v22 = *MEMORY[0x1E4FB0700];
    v30[2] = v20;
    uint64_t v23 = *MEMORY[0x1E4FB0760];
    v29[2] = v22;
    v29[3] = v23;
    v24 = [v20 colorWithAlphaComponent:0.75];
    v30[3] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];

    id v26 = objc_alloc(MEMORY[0x1E4F28B18]);
    v27 = [v5 title];
    v28 = (void *)[v26 initWithString:v27 attributes:v25];
    [v5 setAttributedTitle:v28];
  }
  [v3 setConfiguration:v5];
}

void __56__EKUIPopupTableViewCell_initWithStyle_reuseIdentifier___block_invoke_121(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateConstraints];
}

- (void)_updateConstraints
{
  v47[6] = *MEMORY[0x1E4F143B8];
  if (self->_constraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  id v3 = [(EKUIPopupTableViewCell *)self traitCollection];
  BOOL v4 = EKUIUsesLargeTextLayout(v3);

  v5 = [(UILabel *)self->_textLabel leadingAnchor];
  v39 = [(EKUIPopupTableViewCell *)self contentView];
  v38 = [v39 layoutMarginsGuide];
  [v38 leadingAnchor];
  v37 = v41 = v5;
  uint64_t v6 = objc_msgSend(v5, "constraintEqualToAnchor:");
  v7 = (void *)v6;
  if (v4)
  {
    v47[0] = v6;
    v33 = [(UILabel *)self->_textLabel topAnchor];
    v45 = [(EKUIPopupTableViewCell *)self contentView];
    v44 = [v45 layoutMarginsGuide];
    v43 = [v44 topAnchor];
    v42 = objc_msgSend(v33, "constraintEqualToAnchor:");
    v47[1] = v42;
    v8 = [(UIButton *)self->_popupButton leadingAnchor];
    id v32 = [(EKUIPopupTableViewCell *)self contentView];
    v31 = [v32 layoutMarginsGuide];
    id v29 = [v31 leadingAnchor];
    v40 = v8;
    uint64_t v27 = [v8 constraintEqualToAnchor:v29];
    v47[2] = v27;
    v9 = [(UIButton *)self->_popupButton trailingAnchor];
    uint64_t v35 = [(EKUIPopupTableViewCell *)self contentView];
    objc_super v34 = [v35 layoutMarginsGuide];
    uint64_t v26 = [v34 trailingAnchor];
    v36 = v9;
    v10 = [v9 constraintLessThanOrEqualToAnchor:v26];
    v47[3] = v10;
    double v11 = [(UIButton *)self->_popupButton topAnchor];
    v12 = [(UILabel *)self->_textLabel bottomAnchor];
    v30 = [v11 constraintEqualToAnchor:v12];
    v47[4] = v30;
    v13 = [(UIButton *)self->_popupButton bottomAnchor];
    id v14 = [(EKUIPopupTableViewCell *)self contentView];
    double v15 = [v14 layoutMarginsGuide];
    [v15 bottomAnchor];
    double v16 = v28 = v7;
    uint64_t v17 = [v13 constraintEqualToAnchor:v16];
    v47[5] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:6];
    constraints = self->_constraints;
    self->_constraints = v18;

    v20 = (void *)v27;
    v7 = v28;

    uint64_t v21 = (void *)v26;
  }
  else
  {
    v46[0] = v6;
    uint64_t v22 = [(UILabel *)self->_textLabel centerYAnchor];
    v45 = [(EKUIPopupTableViewCell *)self contentView];
    v44 = [v45 layoutMarginsGuide];
    [v44 centerYAnchor];
    v43 = v33 = v22;
    v42 = objc_msgSend(v22, "constraintEqualToAnchor:");
    v46[1] = v42;
    uint64_t v23 = [(UIButton *)self->_popupButton leadingAnchor];
    [(UILabel *)self->_textLabel trailingAnchor];
    id v32 = v40 = v23;
    v31 = [v23 constraintGreaterThanOrEqualToAnchor:v32 constant:8.0];
    v46[2] = v31;
    v24 = [(UIButton *)self->_popupButton trailingAnchor];
    v20 = [(EKUIPopupTableViewCell *)self contentView];
    v36 = [v20 layoutMarginsGuide];
    [v36 trailingAnchor];
    v35 = id v29 = v24;
    objc_super v34 = objc_msgSend(v24, "constraintEqualToAnchor:");
    v46[3] = v34;
    uint64_t v21 = [(UIButton *)self->_popupButton centerYAnchor];
    v10 = [(EKUIPopupTableViewCell *)self contentView];
    double v11 = [v10 layoutMarginsGuide];
    v12 = [v11 centerYAnchor];
    v30 = [v21 constraintEqualToAnchor:v12];
    v46[4] = v30;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:5];
    v13 = self->_constraints;
    self->_constraints = v25;
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
  [(UILabel *)self->_textLabel setNeedsUpdateConstraints];
  [(UIButton *)self->_popupButton setNeedsUpdateConstraints];
}

- (void)setPopupMenu:(id)a3
{
}

- (UIMenu)popupMenu
{
  return [(UIButton *)self->_popupButton menu];
}

- (void)setPopupMenuProvider:(id)a3
{
  id v4 = (id)[a3 copy];
  [(UIButton *)self->_popupButton _setMenuProvider:v4];
}

- (id)popupMenuProvider
{
  return (id)[(UIButton *)self->_popupButton _menuProvider];
}

- (void)setShowSelectedImage:(BOOL)a3
{
  if (self->_showSelectedImage != a3)
  {
    self->_showSelectedImage = a3;
    [(UIButton *)self->_popupButton setNeedsUpdateConfiguration];
  }
}

- (void)setTitleStrikethrough:(BOOL)a3
{
  if (self->_titleStrikethrough != a3)
  {
    self->_titleStrikethrough = a3;
    [(UIButton *)self->_popupButton setNeedsUpdateConfiguration];
  }
}

- (id)textLabel
{
  return self->_textLabel;
}

- (BOOL)showSelectedImage
{
  return self->_showSelectedImage;
}

- (BOOL)titleStrikethrough
{
  return self->_titleStrikethrough;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_popupButton, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end