@interface _HKDisplayTypeSectionedHeaderView
+ (id)reuseIdentifier;
- (NSLayoutConstraint)titleTrailingConstraint;
- (NSLayoutConstraint)titleWithNoTopMargin;
- (NSLayoutConstraint)titleWithTopMargin;
- (NSString)title;
- (UILabel)titleLabel;
- (UIView)contentView;
- (_HKDisplayTypeSectionedHeaderView)initWithFrame:(CGRect)a3;
- (void)_updatePreferredTitleFont;
- (void)prepareForReuse;
- (void)setContentView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleTrailingConstraint:(id)a3;
- (void)setTitleWithNoTopMargin:(id)a3;
- (void)setTitleWithTopMargin:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _HKDisplayTypeSectionedHeaderView

- (_HKDisplayTypeSectionedHeaderView)initWithFrame:(CGRect)a3
{
  v52[4] = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)_HKDisplayTypeSectionedHeaderView;
  v3 = -[_HKDisplayTypeSectionedHeaderView initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v9;

    [(UIView *)v3->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v11;

    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v13 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v13];

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v3->_titleLabel setBackgroundColor:v14];

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setClipsToBounds:0];
    [(UILabel *)v3->_titleLabel setLineBreakMode:0];
    [(_HKDisplayTypeSectionedHeaderView *)v3 _updatePreferredTitleFont];
    [(_HKDisplayTypeSectionedHeaderView *)v3 addSubview:v3->_contentView];
    v44 = (void *)MEMORY[0x1E4F28DC8];
    v49 = [(UIView *)v3->_contentView topAnchor];
    v48 = [(_HKDisplayTypeSectionedHeaderView *)v3 topAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v52[0] = v47;
    v46 = [(UIView *)v3->_contentView leadingAnchor];
    v45 = [(_HKDisplayTypeSectionedHeaderView *)v3 leadingAnchor];
    v43 = [v46 constraintEqualToAnchor:v45];
    v52[1] = v43;
    v15 = [(UIView *)v3->_contentView bottomAnchor];
    v16 = [(_HKDisplayTypeSectionedHeaderView *)v3 bottomAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v52[2] = v17;
    v18 = [(UIView *)v3->_contentView trailingAnchor];
    v19 = [(_HKDisplayTypeSectionedHeaderView *)v3 trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v52[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:4];
    [v44 activateConstraints:v21];

    [(UIView *)v3->_contentView addSubview:v3->_titleLabel];
    v22 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v23 = [(UIView *)v3->_contentView trailingAnchor];
    uint64_t v24 = [v22 constraintEqualToAnchor:v23];
    titleTrailingConstraint = v3->_titleTrailingConstraint;
    v3->_titleTrailingConstraint = (NSLayoutConstraint *)v24;

    v26 = [(UILabel *)v3->_titleLabel topAnchor];
    v27 = [(UIView *)v3->_contentView topAnchor];
    uint64_t v28 = [v26 constraintEqualToAnchor:v27];
    titleWithNoTopMargin = v3->_titleWithNoTopMargin;
    v3->_titleWithNoTopMargin = (NSLayoutConstraint *)v28;

    v30 = [(UILabel *)v3->_titleLabel topAnchor];
    v31 = [(UIView *)v3->_contentView topAnchor];
    uint64_t v32 = [v30 constraintEqualToAnchor:v31 constant:16.0];
    titleWithTopMargin = v3->_titleWithTopMargin;
    v3->_titleWithTopMargin = (NSLayoutConstraint *)v32;

    [(NSLayoutConstraint *)v3->_titleWithNoTopMargin setActive:1];
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v36 = [(UIView *)v3->_contentView leadingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v51[0] = v37;
    v38 = [(UILabel *)v3->_titleLabel bottomAnchor];
    v39 = [(UIView *)v3->_contentView bottomAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v51[1] = v40;
    v51[2] = v3->_titleTrailingConstraint;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
    [v34 activateConstraints:v41];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_HKDisplayTypeSectionedHeaderView;
  id v4 = a3;
  [(_HKDisplayTypeSectionedHeaderView *)&v8 traitCollectionDidChange:v4];
  double v5 = objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);

  double v6 = [(_HKDisplayTypeSectionedHeaderView *)self traitCollection];
  double v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7) {
    [(_HKDisplayTypeSectionedHeaderView *)self _updatePreferredTitleFont];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    uint64_t v5 = [v4 length];
    BOOL v6 = v5 == 0;
    BOOL v7 = v5 != 0;
  }
  else
  {
    BOOL v7 = 0;
    BOOL v6 = 1;
  }
  [(NSLayoutConstraint *)self->_titleWithNoTopMargin setActive:v6];
  [(NSLayoutConstraint *)self->_titleWithTopMargin setActive:v7];
  [(_HKDisplayTypeSectionedHeaderView *)self setHidden:v6];
  [(UILabel *)self->_titleLabel setText:v8];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_HKDisplayTypeSectionedHeaderView;
  [(_HKDisplayTypeSectionedHeaderView *)&v3 prepareForReuse];
  [(UILabel *)self->_titleLabel setText:&stru_1F3B9CF20];
  [(_HKDisplayTypeSectionedHeaderView *)self setHidden:0];
}

- (void)_updatePreferredTitleFont
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionHeaderFont");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_titleLabel setFont:v3];
}

+ (id)reuseIdentifier
{
  return @"HKChartViewControllerCollectionViewHeaderIdentifier";
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSLayoutConstraint)titleTrailingConstraint
{
  return self->_titleTrailingConstraint;
}

- (void)setTitleTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleWithNoTopMargin
{
  return self->_titleWithNoTopMargin;
}

- (void)setTitleWithNoTopMargin:(id)a3
{
}

- (NSLayoutConstraint)titleWithTopMargin
{
  return self->_titleWithTopMargin;
}

- (void)setTitleWithTopMargin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleWithTopMargin, 0);
  objc_storeStrong((id *)&self->_titleWithNoTopMargin, 0);
  objc_storeStrong((id *)&self->_titleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end