@interface HUSoftwareUpdateFetchCell
+ (BOOL)requiresConstraintBasedLayout;
- (HFItem)item;
- (HUIconView)iconView;
- (HUSoftwareUpdateFetchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIActivityIndicatorView)checkingForUpdateSpinner;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)mainStackView;
- (UIView)titleSpinnerView;
- (unint64_t)iconSize;
- (void)setCheckingForUpdateSpinner:(id)a3;
- (void)setIconSize:(unint64_t)a3;
- (void)setIconView:(id)a3;
- (void)setItem:(id)a3;
- (void)setMainStackView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleSpinnerView:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUSoftwareUpdateFetchCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUSoftwareUpdateFetchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v38[2] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)HUSoftwareUpdateFetchCell;
  v4 = [(HUSoftwareUpdateFetchCell *)&v37 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HUSoftwareUpdateFetchCell *)v4 setSelectionStyle:0];
    [(HUSoftwareUpdateFetchCell *)v5 setUserInteractionEnabled:0];
    v6 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUSoftwareUpdateFetchCell *)v5 setBackgroundColor:v6];

    v7 = (HUIconView *)objc_alloc_init(MEMORY[0x1E4F6A428]);
    iconView = v5->_iconView;
    v5->_iconView = v7;

    [(HUIconView *)v5->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUIconView *)v5->_iconView setContentMode:4];
    v5->_iconSize = 2;
    [(HUIconView *)v5->_iconView setIconSize:2];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v9;

    v11 = v5->_titleLabel;
    v12 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F43870] traits:2];
    [(UILabel *)v11 setFont:v12];

    v13 = v5->_titleLabel;
    v14 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)v13 setBackgroundColor:v14];

    [(UILabel *)v5->_titleLabel setNumberOfLines:0];
    [(UILabel *)v5->_titleLabel setTextAlignment:1];
    [(UILabel *)v5->_titleLabel setLineBreakMode:0];
    [(UILabel *)v5->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v15;

    v17 = v5->_subtitleLabel;
    v18 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
    [(UILabel *)v17 setFont:v18];

    v19 = v5->_subtitleLabel;
    v20 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)v19 setBackgroundColor:v20];

    v21 = v5->_subtitleLabel;
    v22 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UILabel *)v21 setTextColor:v22];

    [(UILabel *)v5->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v5->_subtitleLabel setTextAlignment:1];
    [(UILabel *)v5->_subtitleLabel setLineBreakMode:0];
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    checkingForUpdateSpinner = v5->_checkingForUpdateSpinner;
    v5->_checkingForUpdateSpinner = (UIActivityIndicatorView *)v23;

    [(UIActivityIndicatorView *)v5->_checkingForUpdateSpinner startAnimating];
    [(UIActivityIndicatorView *)v5->_checkingForUpdateSpinner setHidesWhenStopped:1];
    LODWORD(v25) = 1148846080;
    [(UIActivityIndicatorView *)v5->_checkingForUpdateSpinner setContentHuggingPriority:0 forAxis:v25];
    LODWORD(v26) = 1148846080;
    [(UIActivityIndicatorView *)v5->_checkingForUpdateSpinner setContentCompressionResistancePriority:0 forAxis:v26];
    [(UIActivityIndicatorView *)v5->_checkingForUpdateSpinner setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v27 = objc_opt_new();
    titleSpinnerView = v5->_titleSpinnerView;
    v5->_titleSpinnerView = (UIView *)v27;

    [(UIView *)v5->_titleSpinnerView addSubview:v5->_checkingForUpdateSpinner];
    [(UIView *)v5->_titleSpinnerView addSubview:v5->_titleLabel];
    v29 = [MEMORY[0x1E4F1CA48] array];
    [v29 addObject:v5->_iconView];
    v38[0] = v5->_titleSpinnerView;
    v38[1] = v5->_subtitleLabel;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    [v29 addObjectsFromArray:v30];

    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F42E20]) initWithArrangedSubviews:v29];
    mainStackView = v5->_mainStackView;
    v5->_mainStackView = (UIStackView *)v31;

    [(UIStackView *)v5->_mainStackView setAxis:1];
    [(UIStackView *)v5->_mainStackView setAlignment:3];
    [(UIStackView *)v5->_mainStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v5->_mainStackView setSpacing:4.0];
    v33 = v5->_mainStackView;
    v34 = [(HUSoftwareUpdateFetchCell *)v5 iconView];
    [(UIStackView *)v33 setCustomSpacing:v34 afterView:10.0];

    v35 = [(HUSoftwareUpdateFetchCell *)v5 contentView];
    [v35 addSubview:v5->_mainStackView];
  }
  return v5;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(HUSoftwareUpdateFetchCell *)self item];
  id v26 = [v5 latestResults];

  v6 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v7 = [(HUSoftwareUpdateFetchCell *)self titleLabel];
  [v7 setText:v6];

  v8 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
  v9 = [v8 stringWithAttributes:MEMORY[0x1E4F1CC08]];
  v10 = [(HUSoftwareUpdateFetchCell *)self subtitleLabel];
  [v10 setAttributedText:v9];

  v11 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68C48]];
  int v12 = [v11 BOOLValue];

  v13 = [(HUSoftwareUpdateFetchCell *)self titleSpinnerView];
  v14 = [(HUSoftwareUpdateFetchCell *)self checkingForUpdateSpinner];
  int v15 = [v13 containsView:v14];

  if (!v12 || (v15 & 1) != 0)
  {
    if (((v12 | v15 ^ 1) & 1) == 0)
    {
      v19 = [(HUSoftwareUpdateFetchCell *)self checkingForUpdateSpinner];
      [v19 removeFromSuperview];

      v20 = [(HUSoftwareUpdateFetchCell *)self checkingForUpdateSpinner];
      [v20 stopAnimating];
    }
  }
  else
  {
    v16 = [(HUSoftwareUpdateFetchCell *)self titleSpinnerView];
    v17 = [(HUSoftwareUpdateFetchCell *)self checkingForUpdateSpinner];
    [v16 addSubview:v17];

    v18 = [(HUSoftwareUpdateFetchCell *)self checkingForUpdateSpinner];
    [v18 startAnimating];

    [(HUSoftwareUpdateFetchCell *)self updateConstraints];
  }
  if (v15) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  v21 = [MEMORY[0x1E4F428B8] labelColor];
  }
  v22 = [(HUSoftwareUpdateFetchCell *)self titleLabel];
  [v22 setTextColor:v21];

  uint64_t v23 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
  v24 = [(HUSoftwareUpdateFetchCell *)self iconView];
  [v24 updateWithIconDescriptor:v23 displayStyle:1 animated:v3];

  double v25 = [(HUSoftwareUpdateFetchCell *)self iconView];
  [v25 setHidden:v23 == 0];

  [(HUSoftwareUpdateFetchCell *)self setNeedsLayout];
}

- (void)updateConstraints
{
  v48.receiver = self;
  v48.super_class = (Class)HUSoftwareUpdateFetchCell;
  [(HUSoftwareUpdateFetchCell *)&v48 updateConstraints];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(UIStackView *)self->_mainStackView leadingAnchor];
  v5 = [(HUSoftwareUpdateFetchCell *)self contentView];
  v6 = [v5 layoutMarginsGuide];
  v7 = [v6 leadingAnchor];
  v8 = [v4 constraintEqualToAnchor:v7];
  [v3 addObject:v8];

  v9 = [(UIStackView *)self->_mainStackView trailingAnchor];
  v10 = [(HUSoftwareUpdateFetchCell *)self contentView];
  v11 = [v10 layoutMarginsGuide];
  int v12 = [v11 trailingAnchor];
  v13 = [v9 constraintEqualToAnchor:v12];
  [v3 addObject:v13];

  v14 = [(UIStackView *)self->_mainStackView topAnchor];
  int v15 = [(HUSoftwareUpdateFetchCell *)self contentView];
  v16 = [v15 layoutMarginsGuide];
  v17 = [v16 topAnchor];
  v18 = [v14 constraintEqualToAnchor:v17];
  [v3 addObject:v18];

  v19 = [(UIStackView *)self->_mainStackView bottomAnchor];
  v20 = [(HUSoftwareUpdateFetchCell *)self contentView];
  v21 = [v20 layoutMarginsGuide];
  v22 = [v21 bottomAnchor];
  uint64_t v23 = [v19 constraintEqualToAnchor:v22];
  [v3 addObject:v23];

  v24 = [(UILabel *)self->_titleLabel rightAnchor];
  double v25 = [(UIView *)self->_titleSpinnerView rightAnchor];
  id v26 = [v24 constraintEqualToAnchor:v25];
  [v3 addObject:v26];

  uint64_t v27 = [(UILabel *)self->_titleLabel topAnchor];
  v28 = [(UIView *)self->_titleSpinnerView topAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v3 addObject:v29];

  v30 = [(UILabel *)self->_titleLabel bottomAnchor];
  uint64_t v31 = [(UIView *)self->_titleSpinnerView bottomAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v3 addObject:v32];

  v33 = [(UILabel *)self->_titleLabel leftAnchor];
  v34 = [(UIView *)self->_titleSpinnerView leftAnchor];
  v35 = [v33 constraintGreaterThanOrEqualToAnchor:v34];
  [v3 addObject:v35];

  if ([(UIView *)self->_titleSpinnerView containsView:self->_checkingForUpdateSpinner])
  {
    v36 = [(UIView *)self->_titleSpinnerView widthAnchor];
    objc_super v37 = [(UIStackView *)self->_mainStackView widthAnchor];
    v38 = [v36 constraintLessThanOrEqualToAnchor:v37];
    [v3 addObject:v38];

    v39 = [(UIActivityIndicatorView *)self->_checkingForUpdateSpinner leftAnchor];
    v40 = [(UIView *)self->_titleSpinnerView leftAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    [v3 addObject:v41];

    v42 = [(UIActivityIndicatorView *)self->_checkingForUpdateSpinner centerYAnchor];
    v43 = [(UIView *)self->_titleSpinnerView centerYAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    [v3 addObject:v44];

    v45 = [(UILabel *)self->_titleLabel leftAnchor];
    v46 = [(UIActivityIndicatorView *)self->_checkingForUpdateSpinner rightAnchor];
    v47 = [v45 constraintEqualToAnchor:v46 constant:8.0];
    [v3 addObject:v47];
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (UIStackView)mainStackView
{
  return self->_mainStackView;
}

- (void)setMainStackView:(id)a3
{
}

- (UIView)titleSpinnerView
{
  return self->_titleSpinnerView;
}

- (void)setTitleSpinnerView:(id)a3
{
}

- (UIActivityIndicatorView)checkingForUpdateSpinner
{
  return self->_checkingForUpdateSpinner;
}

- (void)setCheckingForUpdateSpinner:(id)a3
{
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(unint64_t)a3
{
  self->_iconSize = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_checkingForUpdateSpinner, 0);
  objc_storeStrong((id *)&self->_titleSpinnerView, 0);
  objc_storeStrong((id *)&self->_mainStackView, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end