@interface AMPOnboardingFeatureView
- (AMPOnboardingFeatureView)initWithFeature:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImageView)imageView;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (double)baselineOffsetFromBottom;
- (void)layoutSubviews;
- (void)setDescriptionLabel:(id)a3;
- (void)setImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AMPOnboardingFeatureView

- (AMPOnboardingFeatureView)initWithFeature:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMPOnboardingFeatureView;
  v5 = -[AMPOnboardingFeatureView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    imageView = v5->_imageView;
    v5->_imageView = v6;

    v8 = [v4 image];
    [(UIImageView *)v5->_imageView setImage:v8];

    [(UIImageView *)v5->_imageView setContentMode:4];
    [(AMPOnboardingFeatureView *)v5 addSubview:v5->_imageView];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v9;

    [(UILabel *)v5->_titleLabel setNumberOfLines:0];
    [(UILabel *)v5->_titleLabel setLineBreakMode:0];
    v11 = [v4 titleText];
    [(UILabel *)v5->_titleLabel setText:v11];

    [(AMPOnboardingFeatureView *)v5 addSubview:v5->_titleLabel];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = v12;

    [(UILabel *)v5->_descriptionLabel setNumberOfLines:0];
    [(UILabel *)v5->_descriptionLabel setLineBreakMode:0];
    v14 = [v4 descriptionText];
    [(UILabel *)v5->_descriptionLabel setText:v14];

    [(AMPOnboardingFeatureView *)v5 addSubview:v5->_descriptionLabel];
  }

  return v5;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)AMPOnboardingFeatureView;
  [(AMPOnboardingFeatureView *)&v23 layoutSubviews];
  uint64_t v3 = objc_msgSend(MEMORY[0x263F1CB60], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AMPOnboardingFeatureView semanticContentAttribute](self, "semanticContentAttribute"));
  double v4 = 0.0;
  if (v3 == 1)
  {
    [(AMPOnboardingFeatureView *)self bounds];
    double v4 = CGRectGetWidth(v24) + -50.0;
  }
  v5 = [(AMPOnboardingFeatureView *)self imageView];
  objc_msgSend(v5, "setFrame:", v4, 0.0, 50.0, 50.0);

  [(AMPOnboardingFeatureView *)self bounds];
  double v6 = CGRectGetWidth(v25) + -62.0;
  v7 = [(AMPOnboardingFeatureView *)self titleLabel];
  objc_msgSend(v7, "sizeThatFits:", v6, 3.40282347e38);
  double v9 = v8;
  double v11 = v10;

  if (v3 == 1)
  {
    [(AMPOnboardingFeatureView *)self bounds];
    double v12 = CGRectGetWidth(v26) + -62.0 - v9;
  }
  else
  {
    double v12 = 62.0;
  }
  v13 = [(AMPOnboardingFeatureView *)self titleLabel];
  objc_msgSend(v13, "setFrame:", v12, 0.0, v9, v11);

  v14 = [(AMPOnboardingFeatureView *)self descriptionLabel];
  objc_msgSend(v14, "sizeThatFits:", v6, 3.40282347e38);
  double v16 = v15;
  double v18 = v17;

  if (v3 == 1)
  {
    [(AMPOnboardingFeatureView *)self bounds];
    double v19 = CGRectGetWidth(v27) + -62.0 - v16;
  }
  else
  {
    double v19 = 62.0;
  }
  v20 = [(AMPOnboardingFeatureView *)self titleLabel];
  [v20 frame];
  double MaxY = CGRectGetMaxY(v28);
  v22 = [(AMPOnboardingFeatureView *)self descriptionLabel];
  objc_msgSend(v22, "setFrame:", v19, MaxY, v16, v18);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v5 = [(AMPOnboardingFeatureView *)self titleLabel];
  objc_msgSend(v5, "sizeThatFits:", width + -62.0, 3.40282347e38);
  double v7 = v6;

  double v8 = [(AMPOnboardingFeatureView *)self descriptionLabel];
  objc_msgSend(v8, "sizeThatFits:", width + -62.0, 3.40282347e38);
  double v10 = v9;

  double v11 = v7 + v10;
  if (v7 + v10 < 50.0) {
    double v11 = 50.0;
  }
  float v12 = v11;
  double v13 = roundf(v12);
  double v14 = width;
  result.height = v13;
  result.double width = v14;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AMPOnboardingFeatureView;
  [(AMPOnboardingFeatureView *)&v12 traitCollectionDidChange:a3];
  uint64_t v4 = *MEMORY[0x263F1D2B8];
  v5 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2B8] addingSymbolicTraits:2 options:0];
  double v6 = [MEMORY[0x263F1C658] fontWithDescriptor:v5 size:0.0];
  double v7 = [(AMPOnboardingFeatureView *)self titleLabel];
  [v7 setFont:v6];

  double v8 = (void *)MEMORY[0x263F1C658];
  double v9 = [(AMPOnboardingFeatureView *)self traitCollection];
  double v10 = [v8 preferredFontForTextStyle:v4 compatibleWithTraitCollection:v9];
  double v11 = [(AMPOnboardingFeatureView *)self descriptionLabel];
  [v11 setFont:v10];

  [(AMPOnboardingFeatureView *)self setNeedsLayout];
}

- (double)baselineOffsetFromBottom
{
  v2 = [(AMPOnboardingFeatureView *)self descriptionLabel];
  [v2 _baselineOffsetFromBottom];
  double v4 = v3;

  return v4;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end