@interface AMPOnboardingHeaderView
- (AMPOnboardingHeaderView)initWithFrame:(CGRect)a3;
- (BOOL)isPresentedInFormSheet;
- (UIImageView)imageView;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (double)containerHeight;
- (void)adjustedContentInsetDidChange;
- (void)layoutSubviews;
- (void)setContainerHeight:(double)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImageView:(id)a3;
- (void)setIsPresentedInFormSheet:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContentSize;
@end

@implementation AMPOnboardingHeaderView

- (AMPOnboardingHeaderView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AMPOnboardingHeaderView;
  v3 = -[AMPOnboardingHeaderView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(UIImageView *)v3->_imageView setContentMode:1];
    [(AMPOnboardingHeaderView *)v3 addSubview:v3->_imageView];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v6;

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setLineBreakMode:0];
    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(AMPOnboardingHeaderView *)v3 addSubview:v3->_titleLabel];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v8;

    [(UILabel *)v3->_descriptionLabel setNumberOfLines:0];
    [(UILabel *)v3->_descriptionLabel setLineBreakMode:0];
    [(UILabel *)v3->_descriptionLabel setTextAlignment:1];
    [(AMPOnboardingHeaderView *)v3 addSubview:v3->_descriptionLabel];
    [(AMPOnboardingHeaderView *)v3 setShowsVerticalScrollIndicator:0];
    [(AMPOnboardingHeaderView *)v3 setShowsHorizontalScrollIndicator:0];
  }
  return v3;
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)AMPOnboardingHeaderView;
  [(AMPOnboardingHeaderView *)&v55 layoutSubviews];
  v3 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D2F0]];
  v4 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D260]];
  [(AMPOnboardingHeaderView *)self bounds];
  double Width = CGRectGetWidth(v56);
  BOOL v6 = [(AMPOnboardingHeaderView *)self isPresentedInFormSheet];
  if ([(AMPOnboardingHeaderView *)self isPresentedInFormSheet])
  {
    double v7 = 200.0;
  }
  else
  {
    [(AMPOnboardingHeaderView *)self containerHeight];
    double v7 = v8 * 0.25;
  }
  if (v6) {
    double v9 = 0.0;
  }
  else {
    double v9 = 44.0;
  }
  v10 = [(AMPOnboardingHeaderView *)self traitCollection];
  [v3 scaledValueForValue:v10 compatibleWithTraitCollection:60.0];
  double v12 = v11;

  v13 = [(AMPOnboardingHeaderView *)self imageView];
  objc_msgSend(v13, "sizeThatFits:", Width, 3.40282347e38);
  double v15 = v14;
  double v17 = v16;

  [(AMPOnboardingHeaderView *)self safeAreaInsets];
  *(float *)&double v18 = v9 + v18 + fmax(v7 - v12 - v17, 0.0);
  double v19 = floorf(*(float *)&v18);
  [(AMPOnboardingHeaderView *)self bounds];
  float v20 = CGRectGetMidX(v57) - v15 * 0.5;
  double v21 = floorf(v20);
  v22 = [(AMPOnboardingHeaderView *)self imageView];
  objc_msgSend(v22, "setFrame:", v21, v19, v15, v17);

  v23 = [(AMPOnboardingHeaderView *)self imageView];
  [v23 frame];
  double v24 = v12 + CGRectGetMaxY(v58);

  v25 = [(AMPOnboardingHeaderView *)self titleLabel];
  objc_msgSend(v25, "sizeThatFits:", Width, 3.40282347e38);
  double v27 = v26;
  double v29 = v28;

  [(AMPOnboardingHeaderView *)self bounds];
  float v30 = CGRectGetMidX(v59) - v27 * 0.5;
  double v31 = floorf(v30);
  v32 = [(AMPOnboardingHeaderView *)self titleLabel];
  [v32 _firstBaselineOffsetFromTop];
  double v34 = v24 - v33;
  v35 = [(AMPOnboardingHeaderView *)self titleLabel];
  objc_msgSend(v35, "setFrame:", v31, v34, v27, v29);

  v36 = [(AMPOnboardingHeaderView *)self titleLabel];
  [v36 frame];
  double MaxY = CGRectGetMaxY(v60);
  v38 = [(AMPOnboardingHeaderView *)self titleLabel];
  [v38 _baselineOffsetFromBottom];
  double v40 = MaxY - v39;

  v41 = [(AMPOnboardingHeaderView *)self descriptionLabel];
  objc_msgSend(v41, "sizeThatFits:", Width, 3.40282347e38);
  double v43 = v42;
  double v45 = v44;

  [(AMPOnboardingHeaderView *)self bounds];
  float v46 = CGRectGetMidX(v61) - v43 * 0.5;
  double v47 = floorf(v46);
  v48 = [(AMPOnboardingHeaderView *)self traitCollection];
  [v4 scaledValueForValue:v48 compatibleWithTraitCollection:32.0];
  double v50 = v40 + v49;
  v51 = [(AMPOnboardingHeaderView *)self descriptionLabel];
  [v51 _firstBaselineOffsetFromTop];
  double v53 = v50 - v52;
  v54 = [(AMPOnboardingHeaderView *)self descriptionLabel];
  objc_msgSend(v54, "setFrame:", v47, v53, v43, v45);
}

- (void)adjustedContentInsetDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)AMPOnboardingHeaderView;
  [(AMPOnboardingHeaderView *)&v3 adjustedContentInsetDidChange];
  [(AMPOnboardingHeaderView *)self updateContentSize];
  [(AMPOnboardingHeaderView *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)AMPOnboardingHeaderView;
  [(AMPOnboardingHeaderView *)&v19 traitCollectionDidChange:a3];
  v4 = (void *)MEMORY[0x263F1C660];
  uint64_t v5 = *MEMORY[0x263F1D2F0];
  BOOL v6 = [(AMPOnboardingHeaderView *)self traitCollection];
  double v7 = [v4 preferredFontDescriptorWithTextStyle:v5 compatibleWithTraitCollection:v6];

  uint64_t v8 = [v7 fontDescriptorWithSymbolicTraits:2];
  double v9 = (void *)v8;
  if (v8) {
    v10 = (void *)v8;
  }
  else {
    v10 = v7;
  }
  id v11 = v10;

  double v12 = [MEMORY[0x263F1C658] fontWithDescriptor:v11 size:0.0];

  v13 = [(AMPOnboardingHeaderView *)self titleLabel];
  [v13 setFont:v12];

  double v14 = (void *)MEMORY[0x263F1C658];
  uint64_t v15 = *MEMORY[0x263F1D260];
  double v16 = [(AMPOnboardingHeaderView *)self traitCollection];
  double v17 = [v14 preferredFontForTextStyle:v15 compatibleWithTraitCollection:v16];
  double v18 = [(AMPOnboardingHeaderView *)self descriptionLabel];
  [v18 setFont:v17];

  [(AMPOnboardingHeaderView *)self updateContentSize];
  [(AMPOnboardingHeaderView *)self setNeedsLayout];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMPOnboardingHeaderView;
  -[AMPOnboardingHeaderView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AMPOnboardingHeaderView *)self updateContentSize];
}

- (void)updateContentSize
{
  id v36 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D2F0]];
  objc_super v3 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D260]];
  [(AMPOnboardingHeaderView *)self bounds];
  double Width = CGRectGetWidth(v38);
  BOOL v5 = [(AMPOnboardingHeaderView *)self isPresentedInFormSheet];
  if ([(AMPOnboardingHeaderView *)self isPresentedInFormSheet])
  {
    double v6 = 200.0;
  }
  else
  {
    [(AMPOnboardingHeaderView *)self containerHeight];
    double v6 = v7 * 0.25;
  }
  if (v5) {
    double v8 = 0.0;
  }
  else {
    double v8 = 44.0;
  }
  double v9 = [(AMPOnboardingHeaderView *)self traitCollection];
  [v36 scaledValueForValue:v9 compatibleWithTraitCollection:60.0];
  double v11 = v10;

  double v12 = [(AMPOnboardingHeaderView *)self imageView];
  objc_msgSend(v12, "sizeThatFits:", Width, 3.40282347e38);
  double v14 = v13;

  [(AMPOnboardingHeaderView *)self safeAreaInsets];
  *(float *)&double v15 = v8 + v15 + fmax(v6 - v11 - v14, 0.0);
  double v16 = v14 + floorf(*(float *)&v15);
  double v17 = [(AMPOnboardingHeaderView *)self titleLabel];
  [v17 _firstBaselineOffsetFromTop];
  double v19 = v11 - v18 + v16;

  float v20 = [(AMPOnboardingHeaderView *)self titleLabel];
  objc_msgSend(v20, "sizeThatFits:", Width, 3.40282347e38);
  double v22 = v19 + v21;

  v23 = [(AMPOnboardingHeaderView *)self titleLabel];
  [v23 _baselineOffsetFromBottom];
  double v25 = v22 - v24;

  double v26 = [(AMPOnboardingHeaderView *)self traitCollection];
  [v3 scaledValueForValue:v26 compatibleWithTraitCollection:32.0];
  double v28 = v27;
  double v29 = [(AMPOnboardingHeaderView *)self descriptionLabel];
  [v29 _firstBaselineOffsetFromTop];
  double v31 = v25 + v28 - v30;

  v32 = [(AMPOnboardingHeaderView *)self descriptionLabel];
  objc_msgSend(v32, "sizeThatFits:", Width, 3.40282347e38);
  double v34 = v31 + v33;

  float v35 = v34;
  -[AMPOnboardingHeaderView setContentSize:](self, "setContentSize:", Width, roundf(v35));
}

- (void)setContainerHeight:(double)a3
{
  if (vabdd_f64(a3, self->_containerHeight) > 2.22044605e-16)
  {
    self->_containerHeight = a3;
    [(AMPOnboardingHeaderView *)self updateContentSize];
    [(AMPOnboardingHeaderView *)self setNeedsLayout];
  }
}

- (void)setIsPresentedInFormSheet:(BOOL)a3
{
  if (self->_isPresentedInFormSheet != a3)
  {
    self->_isPresentedInFormSheet = a3;
    [(AMPOnboardingHeaderView *)self updateContentSize];
    [(AMPOnboardingHeaderView *)self setNeedsLayout];
  }
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

- (double)containerHeight
{
  return self->_containerHeight;
}

- (BOOL)isPresentedInFormSheet
{
  return self->_isPresentedInFormSheet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end