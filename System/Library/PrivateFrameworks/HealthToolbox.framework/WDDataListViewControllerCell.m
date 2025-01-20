@interface WDDataListViewControllerCell
- (UIImageView)iconImageView;
- (UILabel)subtitleTextLabel;
- (UILabel)titleTextLabel;
- (WDDataListViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_updateFont;
- (void)_updateForCurrentSizeCategory;
- (void)layoutSubviews;
- (void)setIconImageView:(id)a3;
- (void)setSubtitleTextLabel:(id)a3;
- (void)setTitleTextLabel:(id)a3;
- (void)setupConstraints;
- (void)setupSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WDDataListViewControllerCell

- (WDDataListViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WDDataListViewControllerCell;
  v4 = [(WDDataListViewControllerCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(WDDataListViewControllerCell *)v4 setupSubviews];
    [(WDDataListViewControllerCell *)v5 setupConstraints];
    [(WDDataListViewControllerCell *)v5 _updateForCurrentSizeCategory];
    [(WDDataListViewControllerCell *)v5 setAccessoryType:1];
  }
  return v5;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)WDDataListViewControllerCell;
  [(WDDataListViewControllerCell *)&v23 layoutSubviews];
  v3 = [(WDDataListViewControllerCell *)self titleTextLabel];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(WDDataListViewControllerCell *)self titleTextLabel];
  -[WDDataListViewControllerCell convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  if ([(WDDataListViewControllerCell *)self hk_isLeftToRight])
  {
    v24.origin.x = v14;
    v24.origin.y = v16;
    v24.size.width = v18;
    v24.size.height = v20;
    double MinX = CGRectGetMinX(v24);
  }
  else
  {
    [(WDDataListViewControllerCell *)self bounds];
    double Width = CGRectGetWidth(v25);
    v26.origin.x = v14;
    v26.origin.y = v16;
    v26.size.width = v18;
    v26.size.height = v20;
    double MinX = Width - CGRectGetMaxX(v26);
  }
  -[WDDataListViewControllerCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, MinX, 0.0, 0.0);
}

- (void)setupSubviews
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C6D0]);
  [(WDDataListViewControllerCell *)self setIconImageView:v3];

  [(UIImageView *)self->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_iconImageView setContentMode:1];
  double v4 = [(WDDataListViewControllerCell *)self contentView];
  [v4 addSubview:self->_iconImageView];

  id v5 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(WDDataListViewControllerCell *)self setSubtitleTextLabel:v5];

  [(UILabel *)self->_subtitleTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  double v6 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [(UILabel *)self->_subtitleTextLabel setTextColor:v6];

  double v7 = [(WDDataListViewControllerCell *)self contentView];
  [v7 addSubview:self->_subtitleTextLabel];

  id v8 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(WDDataListViewControllerCell *)self setTitleTextLabel:v8];

  [(UILabel *)self->_titleTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleTextLabel setNumberOfLines:0];
  double v9 = [(WDDataListViewControllerCell *)self textLabel];
  double v10 = [v9 textColor];
  [(UILabel *)self->_titleTextLabel setTextColor:v10];

  id v11 = [(WDDataListViewControllerCell *)self contentView];
  [v11 addSubview:self->_titleTextLabel];
}

- (void)_updateFont
{
  id v3 = [(WDDataListViewControllerCell *)self detailTextLabel];
  double v4 = [v3 font];
  [(UILabel *)self->_subtitleTextLabel setFont:v4];

  objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_titleTextLabel setFont:v5];
}

- (void)setupConstraints
{
  v71[8] = *MEMORY[0x263EF8340];
  id v3 = [(WDDataListViewControllerCell *)self iconImageView];
  LODWORD(v4) = 1148846080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v4];

  id v5 = [(WDDataListViewControllerCell *)self iconImageView];
  double v6 = [v5 centerYAnchor];
  double v7 = [(WDDataListViewControllerCell *)self subtitleTextLabel];
  id v8 = [v7 firstBaselineAnchor];
  double v9 = [v6 constraintEqualToAnchor:v8 constant:0.0];
  largeTextIconImageCenterYAnchorConstraint = self->_largeTextIconImageCenterYAnchorConstraint;
  self->_largeTextIconImageCenterYAnchorConstraint = v9;

  v67 = [(WDDataListViewControllerCell *)self iconImageView];
  v65 = [v67 leadingAnchor];
  v66 = [(WDDataListViewControllerCell *)self contentView];
  v64 = [v66 leadingAnchor];
  v62 = [v65 constraintEqualToAnchor:v64 constant:16.0];
  v71[0] = v62;
  v61 = [(WDDataListViewControllerCell *)self iconImageView];
  v60 = [v61 widthAnchor];
  v59 = [v60 constraintEqualToConstant:29.0];
  v71[1] = v59;
  v58 = [(WDDataListViewControllerCell *)self subtitleTextLabel];
  v56 = [v58 leadingAnchor];
  v57 = [(WDDataListViewControllerCell *)self iconImageView];
  v55 = [v57 trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:16.0];
  v71[2] = v54;
  v53 = [(WDDataListViewControllerCell *)self subtitleTextLabel];
  v51 = [v53 trailingAnchor];
  v52 = [(WDDataListViewControllerCell *)self contentView];
  v50 = [v52 trailingAnchor];
  v49 = [v51 constraintLessThanOrEqualToAnchor:v50 constant:-16.0];
  v71[3] = v49;
  v48 = [(WDDataListViewControllerCell *)self subtitleTextLabel];
  v46 = [v48 topAnchor];
  v47 = [(WDDataListViewControllerCell *)self contentView];
  v45 = [v47 topAnchor];
  v44 = [v46 constraintEqualToAnchor:v45 constant:9.0];
  v71[4] = v44;
  v43 = [(WDDataListViewControllerCell *)self titleTextLabel];
  v41 = [v43 trailingAnchor];
  v42 = [(WDDataListViewControllerCell *)self contentView];
  v40 = [v42 trailingAnchor];
  v39 = [v41 constraintLessThanOrEqualToAnchor:v40 constant:-16.0];
  v71[5] = v39;
  v38 = [(WDDataListViewControllerCell *)self titleTextLabel];
  id v11 = [v38 bottomAnchor];
  v12 = [(WDDataListViewControllerCell *)self contentView];
  double v13 = [v12 bottomAnchor];
  CGFloat v14 = [v11 constraintEqualToAnchor:v13 constant:-6.0];
  v71[6] = v14;
  double v15 = [(WDDataListViewControllerCell *)self titleTextLabel];
  CGFloat v16 = [v15 topAnchor];
  double v17 = [(WDDataListViewControllerCell *)self subtitleTextLabel];
  CGFloat v18 = [v17 bottomAnchor];
  double v19 = [v16 constraintGreaterThanOrEqualToAnchor:v18 constant:1.0];
  v71[7] = v19;
  v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:8];

  v68 = [(WDDataListViewControllerCell *)self iconImageView];
  CGFloat v20 = [v68 centerYAnchor];
  v21 = [(WDDataListViewControllerCell *)self contentView];
  v22 = [v21 centerYAnchor];
  objc_super v23 = [v20 constraintEqualToAnchor:v22];
  v70[0] = v23;
  CGRect v24 = [(WDDataListViewControllerCell *)self titleTextLabel];
  CGRect v25 = [v24 leadingAnchor];
  CGRect v26 = [(WDDataListViewControllerCell *)self iconImageView];
  v27 = [v26 trailingAnchor];
  v28 = [v25 constraintEqualToAnchor:v27 constant:16.0];
  v70[1] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:2];
  regularConstraints = self->_regularConstraints;
  self->_regularConstraints = v29;

  v69[0] = self->_largeTextIconImageCenterYAnchorConstraint;
  v31 = [(WDDataListViewControllerCell *)self titleTextLabel];
  v32 = [v31 leadingAnchor];
  v33 = [(WDDataListViewControllerCell *)self iconImageView];
  v34 = [v33 leadingAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  v69[1] = v35;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:2];
  largeTextConstraints = self->_largeTextConstraints;
  self->_largeTextConstraints = v36;

  [MEMORY[0x263F08938] activateConstraints:v63];
}

- (void)_updateForCurrentSizeCategory
{
  [(WDDataListViewControllerCell *)self _updateFont];
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    id v3 = [(UILabel *)self->_subtitleTextLabel font];
    [v3 capHeight];
    [(NSLayoutConstraint *)self->_largeTextIconImageCenterYAnchorConstraint setConstant:v4 * -0.5];

    id v5 = &OBJC_IVAR___WDDataListViewControllerCell__largeTextConstraints;
    double v6 = &OBJC_IVAR___WDDataListViewControllerCell__regularConstraints;
  }
  else
  {
    id v5 = &OBJC_IVAR___WDDataListViewControllerCell__regularConstraints;
    double v6 = &OBJC_IVAR___WDDataListViewControllerCell__largeTextConstraints;
  }
  [MEMORY[0x263F08938] deactivateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v6)];
  double v7 = (void *)MEMORY[0x263F08938];
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v5);

  [v7 activateConstraints:v8];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDDataListViewControllerCell;
  [(WDDataListViewControllerCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(WDDataListViewControllerCell *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(WDDataListViewControllerCell *)self _updateForCurrentSizeCategory];
    }
  }
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UILabel)titleTextLabel
{
  return self->_titleTextLabel;
}

- (void)setTitleTextLabel:(id)a3
{
}

- (UILabel)subtitleTextLabel
{
  return self->_subtitleTextLabel;
}

- (void)setSubtitleTextLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_titleTextLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);

  objc_storeStrong((id *)&self->_largeTextIconImageCenterYAnchorConstraint, 0);
}

@end