@interface CNPhotoPickerSectionHeader
+ (double)heightNeededForAccessibilityLayoutIncludingActionButton:(BOOL)a3;
+ (id)actionButtonFont;
+ (id)reusableIdentifier;
+ (id)titleLabelFont;
- (CNPhotoPickerSectionHeader)initWithFrame:(CGRect)a3;
- (UIButton)actionButton;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (id)actionBlock;
- (void)actionButtonPressed:(id)a3;
- (void)prepareForReuse;
- (void)setActionBlock:(id)a3;
- (void)setStackView:(id)a3;
- (void)setupConstraints;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateDynamicStackViewProperties;
- (void)updateStyle:(id)a3;
@end

@implementation CNPhotoPickerSectionHeader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)setStackView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setActionBlock:(id)a3
{
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNPhotoPickerSectionHeader;
  [(CNPhotoPickerSectionHeader *)&v4 traitCollectionDidChange:a3];
  [(CNPhotoPickerSectionHeader *)self updateDynamicStackViewProperties];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerSectionHeader;
  [(CNPhotoPickerSectionHeader *)&v5 prepareForReuse];
  v3 = [(CNPhotoPickerSectionHeader *)self titleLabel];
  [v3 setText:0];

  objc_super v4 = [(CNPhotoPickerSectionHeader *)self actionButton];
  [v4 setTitle:0 forState:0];
}

- (void)actionButtonPressed:(id)a3
{
  objc_super v4 = [(CNPhotoPickerSectionHeader *)self actionBlock];

  if (v4)
  {
    objc_super v5 = [(CNPhotoPickerSectionHeader *)self actionBlock];
    v5[2]();
  }
}

- (void)updateDynamicStackViewProperties
{
  int v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  objc_super v4 = [(CNPhotoPickerSectionHeader *)self stackView];
  objc_super v5 = v4;
  if (v3)
  {
    [v4 setAxis:1];

    v6 = [(CNPhotoPickerSectionHeader *)self stackView];
    id v8 = v6;
    uint64_t v7 = 1;
  }
  else
  {
    [v4 setAxis:0];

    v6 = [(CNPhotoPickerSectionHeader *)self stackView];
    id v8 = v6;
    uint64_t v7 = 0;
  }
  [v6 setAlignment:v7];
}

- (void)setupConstraints
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v15 = objc_opt_new();
  int v3 = [(CNPhotoPickerSectionHeader *)self safeAreaLayoutGuide];
  v22 = [v3 leadingAnchor];

  v21 = [(CNPhotoPickerSectionHeader *)self stackView];
  v20 = [v21 leadingAnchor];
  v19 = [v20 constraintEqualToAnchor:v22];
  v23[0] = v19;
  v18 = [(CNPhotoPickerSectionHeader *)self stackView];
  v16 = [v18 trailingAnchor];
  v17 = [(CNPhotoPickerSectionHeader *)self safeAreaLayoutGuide];
  v14 = [v17 trailingAnchor];
  v13 = [v16 constraintEqualToAnchor:v14];
  v23[1] = v13;
  objc_super v4 = [(CNPhotoPickerSectionHeader *)self stackView];
  objc_super v5 = [v4 topAnchor];
  v6 = [(CNPhotoPickerSectionHeader *)self topAnchor];
  uint64_t v7 = [v5 constraintEqualToAnchor:v6];
  v23[2] = v7;
  id v8 = [(CNPhotoPickerSectionHeader *)self stackView];
  v9 = [v8 bottomAnchor];
  v10 = [(CNPhotoPickerSectionHeader *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v23[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  [v15 addObjectsFromArray:v12];

  [MEMORY[0x1E4F28DC8] activateConstraints:v15];
}

- (void)updateStyle:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 backgroundColor];
  if (v5)
  {
    [(CNPhotoPickerSectionHeader *)self setBackgroundColor:v5];
  }
  else
  {
    v6 = +[CNUIColorRepository photoPickerBackgroundColor];
    [(CNPhotoPickerSectionHeader *)self setBackgroundColor:v6];
  }
  id v8 = [v4 textColor];

  uint64_t v7 = [(CNPhotoPickerSectionHeader *)self titleLabel];
  [v7 setTextColor:v8];
}

- (CNPhotoPickerSectionHeader)initWithFrame:(CGRect)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)CNPhotoPickerSectionHeader;
  int v3 = -[CNPhotoPickerSectionHeader initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(id)objc_opt_class() titleLabelFont];
    [(UILabel *)v3->_titleLabel setFont:v6];

    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v7) = 1148846080;
    [(UILabel *)v3->_titleLabel setContentCompressionResistancePriority:1 forAxis:v7];
    uint64_t v8 = +[CNPhotoPickerHeaderButton buttonWithType:1];
    actionButton = v3->_actionButton;
    v3->_actionButton = (UIButton *)v8;

    [(UIButton *)v3->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(id)objc_opt_class() actionButtonFont];
    v11 = [(UIButton *)v3->_actionButton titleLabel];
    [v11 setFont:v10];

    v12 = [(UIButton *)v3->_actionButton titleLabel];
    [v12 setAdjustsFontForContentSizeCategory:1];

    LODWORD(v13) = 1148846080;
    [(UIButton *)v3->_actionButton setContentHuggingPriority:0 forAxis:v13];
    [(UIButton *)v3->_actionButton addTarget:v3 action:sel_actionButtonPressed_ forControlEvents:64];
    id v14 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v22[0] = v3->_titleLabel;
    v22[1] = v3->_actionButton;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    uint64_t v16 = [v14 initWithArrangedSubviews:v15];
    stackView = v3->_stackView;
    v3->_stackView = (UIStackView *)v16;

    [(UIStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView setDistribution:3];
    [(CNPhotoPickerSectionHeader *)v3 addSubview:v3->_stackView];
    v18 = +[CNContactStyle currentStyle];
    [(CNPhotoPickerSectionHeader *)v3 updateStyle:v18];

    [(CNPhotoPickerSectionHeader *)v3 setupConstraints];
    [(CNPhotoPickerSectionHeader *)v3 updateDynamicStackViewProperties];
    v19 = v3;
  }

  return v3;
}

+ (double)heightNeededForAccessibilityLayoutIncludingActionButton:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];

  v6 = [a1 titleLabelFont];
  [v6 lineHeight];
  UIRoundToScale();
  double v8 = v7;

  if (v3)
  {
    v9 = [a1 actionButtonFont];
    [v9 lineHeight];
    UIRoundToScale();
    double v8 = v8 + v10;
  }
  return v8;
}

+ (id)reusableIdentifier
{
  return @"CNPhotoPickerSectionHeader";
}

+ (id)actionButtonFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
}

+ (id)titleLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredFontForTextStyle:", *MEMORY[0x1E4FB2908]);
}

@end