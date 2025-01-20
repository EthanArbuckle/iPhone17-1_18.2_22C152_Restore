@interface _HKPopulationNormsAxisLabelView
- (HKPopulationNormsAxisLabel)axisLabel;
- (UIColor)textColor;
- (UIFont)font;
- (_HKPopulationNormsAxisLabelView)initWithLabel:(id)a3;
- (void)layoutSubviews;
- (void)setFont:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation _HKPopulationNormsAxisLabelView

- (_HKPopulationNormsAxisLabelView)initWithLabel:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_HKPopulationNormsAxisLabelView;
  v6 = -[_HKPopulationNormsAxisLabelView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_axisLabel, a3);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    rangeStartLabel = v7->_rangeStartLabel;
    v7->_rangeStartLabel = v8;

    [(_HKPopulationNormsAxisLabelView *)v7 addSubview:v7->_rangeStartLabel];
    v10 = [(HKPopulationNormsAxisLabel *)v7->_axisLabel rangeEnd];

    if (v10)
    {
      v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      rangeSeparatorLabel = v7->_rangeSeparatorLabel;
      v7->_rangeSeparatorLabel = v11;

      [(_HKPopulationNormsAxisLabelView *)v7 addSubview:v7->_rangeSeparatorLabel];
      v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      rangeEndLabel = v7->_rangeEndLabel;
      v7->_rangeEndLabel = v13;

      [(_HKPopulationNormsAxisLabelView *)v7 addSubview:v7->_rangeEndLabel];
    }
  }

  return v7;
}

- (void)setTextColor:(id)a3
{
  rangeStartLabel = self->_rangeStartLabel;
  id v5 = a3;
  [(UILabel *)rangeStartLabel setTextColor:v5];
  [(UILabel *)self->_rangeSeparatorLabel setTextColor:v5];
  [(UILabel *)self->_rangeEndLabel setTextColor:v5];
}

- (void)setFont:(id)a3
{
  rangeStartLabel = self->_rangeStartLabel;
  id v5 = a3;
  [(UILabel *)rangeStartLabel setFont:v5];
  [(UILabel *)self->_rangeSeparatorLabel setFont:v5];
  [(UILabel *)self->_rangeEndLabel setFont:v5];
}

- (void)layoutSubviews
{
  v3 = [(HKPopulationNormsAxisLabel *)self->_axisLabel stringRepresentation];
  v4 = [(HKPopulationNormsAxisLabel *)self->_axisLabel separatorString];
  id v26 = [v3 componentsSeparatedByString:v4];

  id v5 = [v26 objectAtIndexedSubscript:0];
  [(UILabel *)self->_rangeStartLabel setText:v5];

  [(UILabel *)self->_rangeStartLabel sizeToFit];
  if (self->_rangeEndLabel && [v26 count] == 2)
  {
    v6 = [(HKPopulationNormsAxisLabel *)self->_axisLabel separatorString];
    [(UILabel *)self->_rangeSeparatorLabel setText:v6];

    [(UILabel *)self->_rangeSeparatorLabel sizeToFit];
    [(UILabel *)self->_rangeSeparatorLabel bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [(UILabel *)self->_rangeStartLabel frame];
    CGFloat MaxX = CGRectGetMaxX(v28);
    v29.origin.x = v8;
    v29.origin.y = v10;
    v29.size.width = v12;
    v29.size.height = v14;
    CGRect v30 = CGRectOffset(v29, MaxX, 0.0);
    -[UILabel setFrame:](self->_rangeSeparatorLabel, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    objc_super v16 = [v26 objectAtIndexedSubscript:1];
    [(UILabel *)self->_rangeEndLabel setText:v16];

    [(UILabel *)self->_rangeEndLabel sizeToFit];
    [(UILabel *)self->_rangeEndLabel bounds];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    [(UILabel *)self->_rangeSeparatorLabel frame];
    CGFloat v25 = CGRectGetMaxX(v31);
    v32.origin.x = v18;
    v32.origin.y = v20;
    v32.size.width = v22;
    v32.size.height = v24;
    CGRect v33 = CGRectOffset(v32, v25, 0.0);
    -[UILabel setFrame:](self->_rangeEndLabel, "setFrame:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
  }
}

- (HKPopulationNormsAxisLabel)axisLabel
{
  return self->_axisLabel;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)font
{
  return self->_font;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_axisLabel, 0);
  objc_storeStrong((id *)&self->_rangeEndLabel, 0);
  objc_storeStrong((id *)&self->_rangeSeparatorLabel, 0);
  objc_storeStrong((id *)&self->_rangeStartLabel, 0);
}

@end