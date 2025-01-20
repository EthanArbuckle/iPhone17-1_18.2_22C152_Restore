@interface CEKDynamicTickCell
- (CEKDynamicTickCell)initWithFrame:(CGRect)a3;
- (CEKTickCellConfiguration)contentConfiguration;
- (UIImageView)_imageView;
- (UILabel)_textLabel;
- (void)_applyContentConfiguration;
- (void)layoutSubviews;
- (void)setContentConfiguration:(id)a3;
@end

@implementation CEKDynamicTickCell

- (CEKDynamicTickCell)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CEKDynamicTickCell;
  v3 = -[CEKDynamicTickCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    textLabel = v3->__textLabel;
    v3->__textLabel = (UILabel *)v9;

    [(UILabel *)v3->__textLabel setTextAlignment:1];
    [(UILabel *)v3->__textLabel setLineBreakMode:2];
    [(CEKDynamicTickCell *)v3 addSubview:v3->__textLabel];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v5, v6, v7, v8);
    imageView = v3->__imageView;
    v3->__imageView = (UIImageView *)v11;

    [(CEKDynamicTickCell *)v3 addSubview:v3->__imageView];
    v13 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CEKDynamicTickCell;
  [(CEKDynamicTickCell *)&v13 layoutSubviews];
  [(CEKDynamicTickCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(CEKDynamicTickCell *)self _textLabel];
  v12 = [(CEKDynamicTickCell *)self _imageView];
  UIRectGetCenter();
  objc_msgSend(v11, "setCenter:");
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  UIRectGetCenter();
  objc_msgSend(v12, "setCenter:");
  objc_msgSend(v12, "setBounds:", v4, v6, v8, v10);
}

- (void)setContentConfiguration:(id)a3
{
  double v5 = (CEKTickCellConfiguration *)a3;
  p_contentConfiguration = &self->_contentConfiguration;
  if (self->_contentConfiguration != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_contentConfiguration, a3);
    p_contentConfiguration = (CEKTickCellConfiguration **)[(CEKDynamicTickCell *)self _applyContentConfiguration];
    double v5 = v7;
  }
  MEMORY[0x1F41817F8](p_contentConfiguration, v5);
}

- (void)_applyContentConfiguration
{
  id v9 = [(CEKDynamicTickCell *)self contentConfiguration];
  double v3 = [v9 image];
  double v4 = [v9 text];
  double v5 = [(CEKDynamicTickCell *)self _imageView];
  double v6 = [(CEKDynamicTickCell *)self _textLabel];
  if (v3)
  {
    [v5 setImage:v3];
    [v6 setText:0];
  }
  else
  {
    [v5 setImage:0];
    [v6 setText:v4];
    double v7 = [v9 font];
    [v6 setFont:v7];

    double v8 = [(CEKDynamicTickCell *)self tintColor];
    [v6 setTextColor:v8];
  }
}

- (CEKTickCellConfiguration)contentConfiguration
{
  return self->_contentConfiguration;
}

- (UILabel)_textLabel
{
  return self->__textLabel;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->__textLabel, 0);
  objc_storeStrong((id *)&self->_contentConfiguration, 0);
}

@end