@interface AMSUIOnboardingFeatureView
- (AMSUIOnboardingFeatureView)initWithFeature:(id)a3;
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

@implementation AMSUIOnboardingFeatureView

- (AMSUIOnboardingFeatureView)initWithFeature:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AMSUIOnboardingFeatureView;
  v5 = -[AMSUIOnboardingFeatureView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    imageView = v5->_imageView;
    v5->_imageView = v6;

    v8 = [v4 image];
    [(UIImageView *)v5->_imageView setImage:v8];

    [(UIImageView *)v5->_imageView setContentMode:1];
    [(AMSUIOnboardingFeatureView *)v5 addSubview:v5->_imageView];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v9;

    [(UILabel *)v5->_titleLabel setNumberOfLines:0];
    [(UILabel *)v5->_titleLabel setLineBreakMode:0];
    v11 = [v4 titleText];
    [(UILabel *)v5->_titleLabel setText:v11];

    [(AMSUIOnboardingFeatureView *)v5 addSubview:v5->_titleLabel];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = v12;

    [(UILabel *)v5->_descriptionLabel setNumberOfLines:0];
    [(UILabel *)v5->_descriptionLabel setLineBreakMode:0];
    v14 = [v4 descriptionText];
    [(UILabel *)v5->_descriptionLabel setText:v14];

    [(AMSUIOnboardingFeatureView *)v5 addSubview:v5->_descriptionLabel];
    v15 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835F0] addingSymbolicTraits:2 options:0];
    v16 = [MEMORY[0x263F81708] fontWithDescriptor:v15 size:0.0];
    v17 = [(AMSUIOnboardingFeatureView *)v5 titleLabel];
    [v17 setFont:v16];

    v18 = (void *)MEMORY[0x263F81708];
    uint64_t v19 = *MEMORY[0x263F835F8];
    v20 = [(AMSUIOnboardingFeatureView *)v5 traitCollection];
    v21 = [v18 preferredFontForTextStyle:v19 compatibleWithTraitCollection:v20];
    v22 = [(AMSUIOnboardingFeatureView *)v5 descriptionLabel];
    [v22 setFont:v21];
  }
  return v5;
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)AMSUIOnboardingFeatureView;
  [(AMSUIOnboardingFeatureView *)&v30 layoutSubviews];
  uint64_t v3 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AMSUIOnboardingFeatureView semanticContentAttribute](self, "semanticContentAttribute"));
  id v4 = [(AMSUIOnboardingFeatureView *)self descriptionLabel];
  v5 = [v4 text];
  if (v5)
  {
    v6 = [(AMSUIOnboardingFeatureView *)self descriptionLabel];
    v7 = [v6 text];
    BOOL v8 = [v7 length] == 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  double v9 = 0.0;
  double v10 = 0.0;
  if (v3 == 1)
  {
    [(AMSUIOnboardingFeatureView *)self bounds];
    double v10 = CGRectGetWidth(v31) + -50.0;
  }
  if (!v8)
  {
    [(AMSUIOnboardingFeatureView *)self bounds];
    double v9 = CGRectGetHeight(v32) * 0.5 + -25.0;
  }
  v11 = [(AMSUIOnboardingFeatureView *)self imageView];
  objc_msgSend(v11, "setFrame:", v10, v9, 50.0, 50.0);

  [(AMSUIOnboardingFeatureView *)self bounds];
  CGFloat v12 = CGRectGetWidth(v33) + -75.0;
  v13 = [(AMSUIOnboardingFeatureView *)self titleLabel];
  objc_msgSend(v13, "sizeThatFits:", v12, 3.40282347e38);
  double v15 = v14;
  double v17 = v16;

  v18 = [(AMSUIOnboardingFeatureView *)self descriptionLabel];
  objc_msgSend(v18, "sizeThatFits:", v12, 3.40282347e38);
  double v20 = v19;
  double v22 = v21;

  if (v3 == 1)
  {
    [(AMSUIOnboardingFeatureView *)self bounds];
    double v23 = CGRectGetWidth(v34) + -75.0 - v15;
  }
  else
  {
    double v23 = 75.0;
  }
  double v24 = 0.0;
  if (v8)
  {
    [(AMSUIOnboardingFeatureView *)self bounds];
    double v24 = CGRectGetHeight(v35) * 0.5 - v17 * 0.5;
  }
  v25 = [(AMSUIOnboardingFeatureView *)self titleLabel];
  objc_msgSend(v25, "setFrame:", v23, v24, v15, v17);

  if (v3 == 1)
  {
    [(AMSUIOnboardingFeatureView *)self bounds];
    double v26 = CGRectGetWidth(v36) + -75.0 - v20;
  }
  else
  {
    double v26 = 75.0;
  }
  v27 = [(AMSUIOnboardingFeatureView *)self titleLabel];
  [v27 frame];
  double MaxY = CGRectGetMaxY(v37);
  v29 = [(AMSUIOnboardingFeatureView *)self descriptionLabel];
  objc_msgSend(v29, "setFrame:", v26, MaxY, v20, v22);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v5 = [(AMSUIOnboardingFeatureView *)self titleLabel];
  objc_msgSend(v5, "sizeThatFits:", width + -75.0, 3.40282347e38);
  double v7 = v6;

  BOOL v8 = [(AMSUIOnboardingFeatureView *)self descriptionLabel];
  objc_msgSend(v8, "sizeThatFits:", width + -75.0, 3.40282347e38);
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
  v12.super_class = (Class)AMSUIOnboardingFeatureView;
  [(AMSUIOnboardingFeatureView *)&v12 traitCollectionDidChange:a3];
  id v4 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835F0] addingSymbolicTraits:2 options:0];
  v5 = [MEMORY[0x263F81708] fontWithDescriptor:v4 size:0.0];
  double v6 = [(AMSUIOnboardingFeatureView *)self titleLabel];
  [v6 setFont:v5];

  double v7 = (void *)MEMORY[0x263F81708];
  uint64_t v8 = *MEMORY[0x263F835F8];
  double v9 = [(AMSUIOnboardingFeatureView *)self traitCollection];
  double v10 = [v7 preferredFontForTextStyle:v8 compatibleWithTraitCollection:v9];
  double v11 = [(AMSUIOnboardingFeatureView *)self descriptionLabel];
  [v11 setFont:v10];

  [(AMSUIOnboardingFeatureView *)self setNeedsLayout];
}

- (double)baselineOffsetFromBottom
{
  v2 = [(AMSUIOnboardingFeatureView *)self descriptionLabel];
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