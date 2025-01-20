@interface HKTitledIconHeaderView
- (BOOL)centersSubtitle;
- (BOOL)prefersLargeTitle;
- (CGSize)_sizeThatFitsLabel:(id)a3 containerSize:(CGSize)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HKTitledIconHeaderView)initWithFrame:(CGRect)a3;
- (NSString)subtitle;
- (NSString)title;
- (UIColor)iconImageTint;
- (UIImage)iconImage;
- (UIImageView)iconImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)_verticalOffsetForSubtitle;
- (double)_verticalOffsetForTitle;
- (id)_healthIconImage;
- (id)_titleFont;
- (void)_positionSubtitleLabel;
- (void)_updateFont;
- (void)layoutSubviews;
- (void)setCentersSubtitle:(BOOL)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageTint:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setLayoutMarginsWithTableView:(id)a3;
- (void)setPrefersLargeTitle:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKTitledIconHeaderView

- (HKTitledIconHeaderView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HKTitledIconHeaderView;
  v3 = -[HKTitledIconHeaderView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v4;

    v6 = [(HKTitledIconHeaderView *)v3 _healthIconImage];
    [(UIImageView *)v3->_iconImageView setImage:v6];

    [(UIImageView *)v3->_iconImageView sizeToFit];
    [(HKTitledIconHeaderView *)v3 addSubview:v3->_iconImageView];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v9];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    LODWORD(v10) = 1.0;
    [(UILabel *)v3->_titleLabel _setHyphenationFactor:v10];
    objc_storeStrong((id *)&v3->_titleTextStyle, (id)*MEMORY[0x1E4FB2988]);
    [(HKTitledIconHeaderView *)v3 addSubview:v3->_titleLabel];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v11;

    [(UILabel *)v3->_subtitleLabel setNumberOfLines:0];
    v13 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_subtitleLabel setTextColor:v13];

    [(HKTitledIconHeaderView *)v3 setCentersSubtitle:1];
    [(UILabel *)v3->_subtitleLabel setHidden:1];
    [(HKTitledIconHeaderView *)v3 addSubview:v3->_subtitleLabel];
    [(HKTitledIconHeaderView *)v3 _updateFont];
  }
  return v3;
}

- (void)_updateFont
{
  v3 = [(HKTitledIconHeaderView *)self _titleFont];
  [(UILabel *)self->_titleLabel setFont:v3];

  objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_subtitleLabel setFont:v4];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    [(UILabel *)self->_titleLabel setText:v6];
    LODWORD(v5) = 1045220557;
    [(UILabel *)self->_titleLabel _setHyphenationFactor:v5];
    [(UILabel *)self->_titleLabel sizeToFit];
  }
}

- (void)setSubtitle:(id)a3
{
  p_subtitle = &self->_subtitle;
  id v6 = a3;
  if (!-[NSString isEqualToString:](*p_subtitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    [(UILabel *)self->_subtitleLabel setHidden:[(NSString *)*p_subtitle length] == 0];
    [(UILabel *)self->_subtitleLabel setText:v6];
    [(UILabel *)self->_subtitleLabel sizeToFit];
  }
}

- (void)setCentersSubtitle:(BOOL)a3
{
  self->_centersSubtitle = a3;
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 4;
  }
  [(UILabel *)self->_subtitleLabel setTextAlignment:v3];
}

- (void)setPrefersLargeTitle:(BOOL)a3
{
  id v4 = (id *)MEMORY[0x1E4FB2928];
  if (!a3) {
    id v4 = (id *)MEMORY[0x1E4FB2988];
  }
  objc_storeStrong((id *)&self->_titleTextStyle, *v4);
  [(HKTitledIconHeaderView *)self _updateFont];
}

- (void)setIconImage:(id)a3
{
  [(UIImageView *)self->_iconImageView setImage:a3];
  iconImageView = self->_iconImageView;
  [(UIImageView *)iconImageView sizeToFit];
}

- (UIColor)iconImageTint
{
  return [(UIImageView *)self->_iconImageView tintColor];
}

- (void)setIconImageTint:(id)a3
{
  id v4 = (id)[a3 copy];
  [(UIImageView *)self->_iconImageView setTintColor:v4];
}

- (void)setLayoutMarginsWithTableView:(id)a3
{
  [a3 separatorInset];
  -[HKTitledIconHeaderView setLayoutMargins:](self, "setLayoutMargins:", 0.0, v4, 0.0, v4);
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)HKTitledIconHeaderView;
  [(HKTitledIconHeaderView *)&v21 layoutSubviews];
  [(HKTitledIconHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIImageView *)self->_iconImageView frame];
  UIRectCenteredXInRect();
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
  -[HKTitledIconHeaderView _sizeThatFitsLabel:containerSize:](self, "_sizeThatFitsLabel:containerSize:", self->_titleLabel, v4, v6);
  [(UILabel *)self->_titleLabel frame];
  UIRectCenteredXInRect();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v22.origin.y = 30.0;
  v22.origin.x = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  double MaxY = CGRectGetMaxY(v22);
  [(HKTitledIconHeaderView *)self _verticalOffsetForTitle];
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v14, MaxY + v20, v16, v18);
  [(HKTitledIconHeaderView *)self _positionSubtitleLabel];
}

- (void)_positionSubtitleLabel
{
  if ([(UILabel *)self->_subtitleLabel isHidden])
  {
    double v4 = *MEMORY[0x1E4F1DB28];
    double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(UILabel *)self->_titleLabel frame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [(HKTitledIconHeaderView *)self bounds];
    double v16 = v15;
    -[HKTitledIconHeaderView _sizeThatFitsLabel:containerSize:](self, "_sizeThatFitsLabel:containerSize:", self->_subtitleLabel, v15, v17);
    double v5 = v18;
    double v6 = v19;
    [(UILabel *)self->_subtitleLabel frame];
    if ([(HKTitledIconHeaderView *)self centersSubtitle])
    {
      double v4 = (v16 - v5) * 0.5;
    }
    else if ([(HKTitledIconHeaderView *)self _shouldReverseLayoutDirection])
    {
      [(HKTitledIconHeaderView *)self layoutMargins];
      double v4 = v16 - v5 - v20;
    }
    else
    {
      [(HKTitledIconHeaderView *)self layoutMargins];
      double v4 = v21;
    }
    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.width = v12;
    v26.size.height = v14;
    double MaxY = CGRectGetMaxY(v26);
    [(HKTitledIconHeaderView *)self _verticalOffsetForSubtitle];
    double v3 = MaxY + v23;
  }
  subtitleLabel = self->_subtitleLabel;
  -[UILabel setFrame:](subtitleLabel, "setFrame:", v4, v3, v5, v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIImageView *)self->_iconImageView frame];
  double v7 = v6 + 31.0;
  [(HKTitledIconHeaderView *)self _verticalOffsetForTitle];
  double v9 = v8 + v7;
  -[HKTitledIconHeaderView _sizeThatFitsLabel:containerSize:](self, "_sizeThatFitsLabel:containerSize:", self->_titleLabel, width, height);
  double v11 = v9 + v10;
  if (([(UILabel *)self->_subtitleLabel isHidden] & 1) == 0)
  {
    [(HKTitledIconHeaderView *)self _verticalOffsetForSubtitle];
    double v13 = v11 + v12;
    -[HKTitledIconHeaderView _sizeThatFitsLabel:containerSize:](self, "_sizeThatFitsLabel:containerSize:", self->_subtitleLabel, width, height);
    double v11 = v13 + v14;
  }
  double v15 = width;
  double v16 = v11;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKTitledIconHeaderView;
  [(HKTitledIconHeaderView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(HKTitledIconHeaderView *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(HKTitledIconHeaderView *)self _updateFont];
      [(HKTitledIconHeaderView *)self setNeedsLayout];
    }
  }
}

- (id)_healthIconImage
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  double v3 = HKHealthUIFrameworkBundle();
  id v4 = [v2 imageNamed:@"healthauthorization_icon_large" inBundle:v3];

  return v4;
}

- (id)_titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", self->_titleTextStyle, 2);
}

- (double)_verticalOffsetForTitle
{
  return 20.0;
}

- (double)_verticalOffsetForSubtitle
{
  return 15.0;
}

- (CGSize)_sizeThatFitsLabel:(id)a3 containerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  [(HKTitledIconHeaderView *)self layoutMargins];
  objc_msgSend(v7, "sizeThatFits:", width - (v8 + v9), height);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (BOOL)centersSubtitle
{
  return self->_centersSubtitle;
}

- (BOOL)prefersLargeTitle
{
  return self->_prefersLargeTitle;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
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
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
}

@end