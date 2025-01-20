@interface HXUIPickerLabelView
- (CGSize)sizeThatFits:(CGSize)a3;
- (HXUIPickerLabelView)initWithFrame:(CGRect)a3;
- (NSString)detailText;
- (NSString)text;
- (UIColor)detailTextColor;
- (void)getLabelFramesForSize:(CGSize)a3 titleFrame:(CGRect *)a4 detailFrame:(CGRect *)a5;
- (void)layoutSubviews;
- (void)setDetailText:(id)a3;
- (void)setDetailTextColor:(id)a3;
- (void)setText:(id)a3;
@end

@implementation HXUIPickerLabelView

- (HXUIPickerLabelView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v22.receiver = self;
  v22.super_class = (Class)HXUIPickerLabelView;
  v5 = -[HXUIPickerLabelView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v11;

    v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
    [(UILabel *)v5->_titleLabel setFont:v13];

    [(UILabel *)v5->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v5->_titleLabel setTextColor:v14];

    [(UILabel *)v5->_titleLabel setNumberOfLines:0];
    [(HXUIPickerLabelView *)v5 addSubview:v5->_titleLabel];
    v15 = -[HXUILabelWithBackgroundView initWithFrame:]([HXUILabelWithBackgroundView alloc], "initWithFrame:", v7, v8, v9, v10);
    detailLabel = v5->_detailLabel;
    v5->_detailLabel = v15;

    [(HXUILabelWithBackgroundView *)v5->_detailLabel setNumberOfLines:0];
    [(HXUIPickerLabelView *)v5 addSubview:v5->_detailLabel];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    -[HXUIPickerLabelView getLabelFramesForSize:titleFrame:detailFrame:](v5, "getLabelFramesForSize:titleFrame:detailFrame:", &v20, &v18, width, height);
    -[UILabel setFrame:](v5->_titleLabel, "setFrame:", v20, v21);
    -[HXUILabelWithBackgroundView setFrame:](v5->_detailLabel, "setFrame:", v18, v19);
  }
  return v5;
}

- (void)getLabelFramesForSize:(CGSize)a3 titleFrame:(CGRect *)a4 detailFrame:(CGRect *)a5
{
  double height = a3.height;
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:");
  double v11 = v10;
  double v13 = v12;
  -[HXUILabelWithBackgroundView sizeThatFits:](self->_detailLabel, "sizeThatFits:", width, height);
  if (v11 + v14 + 8.0 >= width)
  {
    double v16 = floor((width + -8.0) * 0.5);
    if (v11 >= v16)
    {
      double v11 = v16;
      if (v14 < v16)
      {
        double v11 = width - v14 + -8.0;
        double v16 = v14;
      }
    }
    else if (v14 >= width - v11 + -8.0)
    {
      double v16 = width - v11 + -8.0;
    }
    else
    {
      double v16 = v14;
    }
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v11, height);
    double v11 = v17;
    double v19 = v18;
    -[HXUILabelWithBackgroundView sizeThatFits:](self->_detailLabel, "sizeThatFits:", v16, height);
    if (v19 >= v15) {
      double v15 = v19;
    }
  }
  else if (v13 >= v15)
  {
    double v15 = v13;
  }
  a4->origin.x = 0.0;
  a4->origin.y = 0.0;
  a4->size.double width = v11;
  a4->size.double height = v15;
  a5->origin.x = width - v14;
  a5->origin.y = 0.0;
  a5->size.double width = v14;
  a5->size.double height = v15;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)HXUIPickerLabelView;
  [(HXUIPickerLabelView *)&v16 layoutSubviews];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  [(HXUIPickerLabelView *)self bounds];
  -[HXUIPickerLabelView getLabelFramesForSize:titleFrame:detailFrame:](self, "getLabelFramesForSize:titleFrame:detailFrame:", &v14, &v12, v3, v4);
  if ([(HXUIPickerLabelView *)self effectiveUserInterfaceLayoutDirection])
  {
    [(HXUIPickerLabelView *)self bounds];
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v5 - *(double *)&v14 - *(double *)&v15, *((double *)&v14 + 1), v15);
    [(HXUIPickerLabelView *)self bounds];
    double v7 = v6;
    double v8 = *((double *)&v12 + 1);
    double v10 = *((double *)&v13 + 1);
    double v9 = *(double *)&v13;
    double v11 = v7 - *(double *)&v12 - *(double *)&v13;
  }
  else
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v14, v15);
    double v8 = *((double *)&v12 + 1);
    double v11 = *(double *)&v12;
    double v10 = *((double *)&v13 + 1);
    double v9 = *(double *)&v13;
  }
  -[HXUILabelWithBackgroundView setFrame:](self->_detailLabel, "setFrame:", v11, v8, v9, v10);
}

- (void)setText:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];
  [(HXUIPickerLabelView *)self setNeedsLayout];
}

- (NSString)text
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setDetailText:(id)a3
{
  [(HXUILabelWithBackgroundView *)self->_detailLabel setText:a3];
  [(HXUIPickerLabelView *)self setNeedsLayout];
}

- (NSString)detailText
{
  return [(HXUILabelWithBackgroundView *)self->_detailLabel text];
}

- (void)setDetailTextColor:(id)a3
{
}

- (UIColor)detailTextColor
{
  return [(HXUILabelWithBackgroundView *)self->_detailLabel textColor];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  memset(&v9, 0, sizeof(v9));
  if (a3.width <= 0.0) {
    double width = 10000.0;
  }
  else {
    double width = a3.width;
  }
  memset(&v8, 0, sizeof(v8));
  [(HXUIPickerLabelView *)self getLabelFramesForSize:&v9 titleFrame:&v8 detailFrame:width];
  double MaxY = CGRectGetMaxY(v9);
  double v5 = CGRectGetMaxY(v8);
  if (MaxY >= v5) {
    double v6 = MaxY;
  }
  else {
    double v6 = v5;
  }
  double v7 = width;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end