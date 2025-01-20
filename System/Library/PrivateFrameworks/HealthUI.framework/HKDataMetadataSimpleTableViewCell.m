@interface HKDataMetadataSimpleTableViewCell
- (HKDataMetadataSimpleTableViewCell)initWithReuseIdentifier:(id)a3;
- (UILabel)subtitleTextLabel;
- (UILabel)titleTextLabel;
- (void)_updateForCurrentSizeCategory;
- (void)layoutSubviews;
- (void)setSubtitleTextLabel:(id)a3;
- (void)setTitleTextLabel:(id)a3;
- (void)setupConstraints;
- (void)setupSubviews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAutomationIdentifiersWith:(id)a3;
@end

@implementation HKDataMetadataSimpleTableViewCell

- (HKDataMetadataSimpleTableViewCell)initWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKDataMetadataSimpleTableViewCell;
  v3 = [(HKDataMetadataSimpleTableViewCell *)&v6 initWithStyle:3 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    [(HKDataMetadataSimpleTableViewCell *)v3 setupSubviews];
    [(HKDataMetadataSimpleTableViewCell *)v4 setupConstraints];
    [(HKDataMetadataSimpleTableViewCell *)v4 setSelectionStyle:0];
  }
  return v4;
}

- (void)setupSubviews
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKDataMetadataSimpleTableViewCell *)self setSubtitleTextLabel:v3];

  [(UILabel *)self->_subtitleTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_subtitleTextLabel setNumberOfLines:0];
  v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0x8000 options:0];
  v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];
  [(UILabel *)self->_subtitleTextLabel setFont:v5];

  objc_super v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_subtitleTextLabel setTextColor:v6];

  v7 = [(HKDataMetadataSimpleTableViewCell *)self contentView];
  [v7 addSubview:self->_subtitleTextLabel];

  id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKDataMetadataSimpleTableViewCell *)self setTitleTextLabel:v8];

  [(UILabel *)self->_titleTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleTextLabel setNumberOfLines:0];
  id v12 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0x8000 options:0];

  v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v12 size:0.0];
  [(UILabel *)self->_titleTextLabel setFont:v9];

  v10 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_titleTextLabel setTextColor:v10];

  v11 = [(HKDataMetadataSimpleTableViewCell *)self contentView];
  [v11 addSubview:self->_titleTextLabel];
}

- (void)_updateForCurrentSizeCategory
{
  id v3 = [(HKDataMetadataSimpleTableViewCell *)self detailTextLabel];
  v4 = [v3 font];
  [(UILabel *)self->_subtitleTextLabel setFont:v4];

  v5 = [(HKDataMetadataSimpleTableViewCell *)self textLabel];
  objc_super v6 = [v5 font];
  [(UILabel *)self->_titleTextLabel setFont:v6];

  [(HKDataMetadataSimpleTableViewCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)HKDataMetadataSimpleTableViewCell;
  [(HKDataMetadataSimpleTableViewCell *)&v23 layoutSubviews];
  id v3 = [(HKDataMetadataSimpleTableViewCell *)self titleTextLabel];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(HKDataMetadataSimpleTableViewCell *)self titleTextLabel];
  -[HKDataMetadataSimpleTableViewCell convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  if ([(UIView *)self hk_isLeftToRight])
  {
    v24.origin.x = v14;
    v24.origin.y = v16;
    v24.size.width = v18;
    v24.size.height = v20;
    double MinX = CGRectGetMinX(v24);
  }
  else
  {
    [(HKDataMetadataSimpleTableViewCell *)self bounds];
    double Width = CGRectGetWidth(v25);
    v26.origin.x = v14;
    v26.origin.y = v16;
    v26.size.width = v18;
    v26.size.height = v20;
    double MinX = Width - CGRectGetMaxX(v26);
  }
  -[HKDataMetadataSimpleTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, MinX, 0.0, 0.0);
}

- (void)setupConstraints
{
  id v3 = [(HKDataMetadataSimpleTableViewCell *)self subtitleTextLabel];
  double v4 = [v3 leadingAnchor];
  double v5 = [(HKDataMetadataSimpleTableViewCell *)self contentView];
  double v6 = [v5 leadingAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6 constant:16.0];
  [v7 setActive:1];

  double v8 = [(HKDataMetadataSimpleTableViewCell *)self subtitleTextLabel];
  double v9 = [v8 trailingAnchor];
  double v10 = [(HKDataMetadataSimpleTableViewCell *)self contentView];
  double v11 = [v10 trailingAnchor];
  id v12 = [v9 constraintLessThanOrEqualToAnchor:v11];
  [v12 setActive:1];

  double v13 = [(HKDataMetadataSimpleTableViewCell *)self subtitleTextLabel];
  CGFloat v14 = [v13 topAnchor];
  double v15 = [(HKDataMetadataSimpleTableViewCell *)self contentView];
  CGFloat v16 = [v15 topAnchor];
  double v17 = [v14 constraintEqualToAnchor:v16 constant:9.0];
  [v17 setActive:1];

  CGFloat v18 = [(HKDataMetadataSimpleTableViewCell *)self titleTextLabel];
  double v19 = [v18 leadingAnchor];
  CGFloat v20 = [(HKDataMetadataSimpleTableViewCell *)self contentView];
  v21 = [v20 leadingAnchor];
  v22 = [v19 constraintEqualToAnchor:v21 constant:16.0];
  [v22 setActive:1];

  objc_super v23 = [(HKDataMetadataSimpleTableViewCell *)self titleTextLabel];
  CGRect v24 = [v23 trailingAnchor];
  CGRect v25 = [(HKDataMetadataSimpleTableViewCell *)self contentView];
  CGRect v26 = [v25 trailingAnchor];
  v27 = [v24 constraintLessThanOrEqualToAnchor:v26];
  [v27 setActive:1];

  v28 = [(HKDataMetadataSimpleTableViewCell *)self titleTextLabel];
  v29 = [v28 bottomAnchor];
  v30 = [(HKDataMetadataSimpleTableViewCell *)self contentView];
  v31 = [v30 bottomAnchor];
  v32 = [v29 constraintEqualToAnchor:v31 constant:-9.0];
  [v32 setActive:1];

  id v37 = [(HKDataMetadataSimpleTableViewCell *)self titleTextLabel];
  v33 = [v37 topAnchor];
  v34 = [(HKDataMetadataSimpleTableViewCell *)self subtitleTextLabel];
  v35 = [v34 bottomAnchor];
  v36 = [v33 constraintGreaterThanOrEqualToAnchor:v35 constant:1.0];
  [v36 setActive:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDataMetadataSimpleTableViewCell;
  [(HKDataMetadataSimpleTableViewCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(HKDataMetadataSimpleTableViewCell *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKDataMetadataSimpleTableViewCell *)self _updateForCurrentSizeCategory];
    }
  }
}

- (void)updateAutomationIdentifiersWith:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    v15[0] = v4;
    v15[1] = @"Value";
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    double v7 = HKUIJoinStringsForAutomationIdentifier(v6);
    char v8 = [(HKDataMetadataSimpleTableViewCell *)self titleTextLabel];
    [v8 setAccessibilityIdentifier:v7];

    v14[0] = v5;
    v14[1] = @"Title";
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    double v10 = HKUIJoinStringsForAutomationIdentifier(v9);
    double v11 = [(HKDataMetadataSimpleTableViewCell *)self subtitleTextLabel];
    [v11 setAccessibilityIdentifier:v10];
  }
  else
  {
    id v12 = [(HKDataMetadataSimpleTableViewCell *)self titleTextLabel];
    [v12 setAccessibilityIdentifier:0];

    double v13 = [(HKDataMetadataSimpleTableViewCell *)self subtitleTextLabel];
    [v13 setAccessibilityIdentifier:0];
  }
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
}

@end