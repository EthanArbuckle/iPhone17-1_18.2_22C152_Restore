@interface AMSUIOnboardingHeaderView
- (AMSUIOnboardingHeaderView)initWithFrame:(CGRect)a3;
- (BOOL)isPresentedInFormSheet;
- (CGSize)intrinsicContentSize;
- (UIImageView)imageView;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (double)containerHeight;
- (void)_traitCollectionDidChange:(id)a3;
- (void)adjustedContentInsetDidChange;
- (void)layoutSubviews;
- (void)setContainerHeight:(double)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImageView:(id)a3;
- (void)setIsPresentedInFormSheet:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateContentSize;
@end

@implementation AMSUIOnboardingHeaderView

- (AMSUIOnboardingHeaderView)initWithFrame:(CGRect)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)AMSUIOnboardingHeaderView;
  v3 = -[AMSUIOnboardingHeaderView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(UIImageView *)v3->_imageView setContentMode:1];
    [(AMSUIOnboardingHeaderView *)v3 addSubview:v3->_imageView];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v6;

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setLineBreakMode:0];
    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v8 = (void *)MEMORY[0x263F81720];
    v9 = [(AMSUIOnboardingHeaderView *)v3 traitCollection];
    v10 = [v8 preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83608] compatibleWithTraitCollection:v9];

    uint64_t v11 = [v10 fontDescriptorWithSymbolicTraits:2];
    v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = v10;
    }
    id v14 = v13;

    v15 = [MEMORY[0x263F81708] fontWithDescriptor:v14 size:0.0];
    v16 = [(AMSUIOnboardingHeaderView *)v3 titleLabel];
    [v16 setFont:v15];

    [(AMSUIOnboardingHeaderView *)v3 addSubview:v3->_titleLabel];
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v17;

    [(UILabel *)v3->_descriptionLabel setNumberOfLines:0];
    [(UILabel *)v3->_descriptionLabel setLineBreakMode:0];
    [(UILabel *)v3->_descriptionLabel setTextAlignment:1];
    v19 = (void *)MEMORY[0x263F81708];
    v20 = [(AMSUIOnboardingHeaderView *)v3 traitCollection];
    v21 = [v19 preferredFontForTextStyle:*MEMORY[0x263F835F0] compatibleWithTraitCollection:v20];
    v22 = [(AMSUIOnboardingHeaderView *)v3 descriptionLabel];
    [v22 setFont:v21];

    [(AMSUIOnboardingHeaderView *)v3 addSubview:v3->_descriptionLabel];
    [(AMSUIOnboardingHeaderView *)v3 setAutoresizingMask:16];
    [(AMSUIOnboardingHeaderView *)v3 setShowsVerticalScrollIndicator:0];
    [(AMSUIOnboardingHeaderView *)v3 setShowsHorizontalScrollIndicator:0];
    objc_initWeak(&location, v3);
    v30[0] = objc_opt_class();
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __43__AMSUIOnboardingHeaderView_initWithFrame___block_invoke;
    v26[3] = &unk_2643E34A8;
    objc_copyWeak(&v27, &location);
    id v24 = (id)[(AMSUIOnboardingHeaderView *)v3 registerForTraitChanges:v23 withHandler:v26];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__AMSUIOnboardingHeaderView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  v6 = [v11 traitCollection];
  v7 = [v6 preferredContentSizeCategory];
  v8 = [v5 preferredContentSizeCategory];

  if (v7 != v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = [v11 traitCollection];
    [WeakRetained _traitCollectionDidChange:v10];
  }
}

- (void)layoutSubviews
{
  v67.receiver = self;
  v67.super_class = (Class)AMSUIOnboardingHeaderView;
  [(AMSUIOnboardingHeaderView *)&v67 layoutSubviews];
  v3 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83608]];
  v4 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F835F0]];
  [(AMSUIOnboardingHeaderView *)self bounds];
  double Width = CGRectGetWidth(v68);
  if ([(AMSUIOnboardingHeaderView *)self isPresentedInFormSheet])
  {
    double v6 = 110.0;
  }
  else
  {
    [(AMSUIOnboardingHeaderView *)self containerHeight];
    double v6 = v7 * 0.25;
  }
  v8 = [(AMSUIOnboardingHeaderView *)self traitCollection];
  [v3 scaledValueForValue:v8 compatibleWithTraitCollection:60.0];
  double v10 = v9;

  id v11 = [(AMSUIOnboardingHeaderView *)self imageView];
  objc_msgSend(v11, "sizeThatFits:", Width, 3.40282347e38);
  double v13 = v12;
  double v15 = v14;

  [(AMSUIOnboardingHeaderView *)self safeAreaInsets];
  double v17 = v16 + 44.0;
  BOOL v18 = v16 < 60.0;
  double v19 = 104.0;
  if (!v18) {
    double v19 = v17;
  }
  float v20 = fmax(v6 - v10 - v15, 0.0) + v19;
  double v21 = floorf(v20);
  [(AMSUIOnboardingHeaderView *)self bounds];
  float v22 = CGRectGetMidX(v69) - v13 * 0.5;
  double v23 = floorf(v22);
  id v24 = [(AMSUIOnboardingHeaderView *)self imageView];
  objc_msgSend(v24, "setFrame:", v23, v21, v13, v15);

  v25 = [(AMSUIOnboardingHeaderView *)self titleLabel];
  [v25 _firstBaselineOffsetFromTop];
  double v27 = v15 + v21 + v10 - v26;

  v28 = [(AMSUIOnboardingHeaderView *)self titleLabel];
  objc_msgSend(v28, "sizeThatFits:", Width, 3.40282347e38);
  double v30 = v29;
  double v32 = v31;

  v33 = [(AMSUIOnboardingHeaderView *)self titleLabel];
  [v33 _baselineOffsetFromBottom];
  double v35 = v27 + v32 - v34;

  v36 = [(AMSUIOnboardingHeaderView *)self traitCollection];
  [v4 scaledValueForValue:v36 compatibleWithTraitCollection:32.0];
  double v38 = v37;
  v39 = [(AMSUIOnboardingHeaderView *)self descriptionLabel];
  [v39 _firstBaselineOffsetFromTop];
  double v41 = v35 + v38 - v40;

  v42 = [(AMSUIOnboardingHeaderView *)self descriptionLabel];
  objc_msgSend(v42, "sizeThatFits:", Width, 3.40282347e38);
  double v44 = v43;
  double v46 = v45;

  v47 = [(AMSUIOnboardingHeaderView *)self descriptionLabel];
  [v47 _firstBaselineOffsetFromTop];
  double v49 = v41 + v46 - (v32 + v46) - v48 - fmax(v32 + -160.0, 0.0);

  [(AMSUIOnboardingHeaderView *)self bounds];
  float v50 = CGRectGetMidX(v70) - v30 * 0.5;
  double v51 = floorf(v50);
  v52 = [(AMSUIOnboardingHeaderView *)self titleLabel];
  [v52 _firstBaselineOffsetFromTop];
  double v54 = v49 - v53;
  v55 = [(AMSUIOnboardingHeaderView *)self titleLabel];
  objc_msgSend(v55, "setFrame:", v51, v54, v30, v32);

  v56 = [(AMSUIOnboardingHeaderView *)self titleLabel];
  [v56 frame];
  double MaxY = CGRectGetMaxY(v71);
  v58 = [(AMSUIOnboardingHeaderView *)self titleLabel];
  [v58 _baselineOffsetFromBottom];
  double v60 = MaxY - v59;

  v61 = [(AMSUIOnboardingHeaderView *)self traitCollection];
  [v4 scaledValueForValue:v61 compatibleWithTraitCollection:32.0];
  double v63 = v60 + v62;

  [(AMSUIOnboardingHeaderView *)self bounds];
  float v64 = CGRectGetMidX(v72) - v44 * 0.5;
  double v65 = floorf(v64);
  v66 = [(AMSUIOnboardingHeaderView *)self descriptionLabel];
  objc_msgSend(v66, "setFrame:", v65, v63, v44, v46);
}

- (void)adjustedContentInsetDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIOnboardingHeaderView;
  [(AMSUIOnboardingHeaderView *)&v3 adjustedContentInsetDidChange];
  [(AMSUIOnboardingHeaderView *)self updateContentSize];
  [(AMSUIOnboardingHeaderView *)self setNeedsLayout];
}

- (void)_traitCollectionDidChange:(id)a3
{
  v4 = (void *)MEMORY[0x263F81720];
  uint64_t v5 = *MEMORY[0x263F83608];
  double v6 = [(AMSUIOnboardingHeaderView *)self traitCollection];
  double v7 = [v4 preferredFontDescriptorWithTextStyle:v5 compatibleWithTraitCollection:v6];

  uint64_t v8 = [v7 fontDescriptorWithSymbolicTraits:2];
  double v9 = (void *)v8;
  if (v8) {
    double v10 = (void *)v8;
  }
  else {
    double v10 = v7;
  }
  id v11 = v10;

  double v12 = [MEMORY[0x263F81708] fontWithDescriptor:v11 size:0.0];

  double v13 = [(AMSUIOnboardingHeaderView *)self titleLabel];
  [v13 setFont:v12];

  double v14 = (void *)MEMORY[0x263F81708];
  uint64_t v15 = *MEMORY[0x263F835F0];
  double v16 = [(AMSUIOnboardingHeaderView *)self traitCollection];
  double v17 = [v14 preferredFontForTextStyle:v15 compatibleWithTraitCollection:v16];
  BOOL v18 = [(AMSUIOnboardingHeaderView *)self descriptionLabel];
  [v18 setFont:v17];

  [(AMSUIOnboardingHeaderView *)self updateContentSize];
  [(AMSUIOnboardingHeaderView *)self setNeedsLayout];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIOnboardingHeaderView;
  -[AMSUIOnboardingHeaderView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AMSUIOnboardingHeaderView *)self updateContentSize];
}

- (void)updateContentSize
{
  id v36 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83608]];
  objc_super v3 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  [(AMSUIOnboardingHeaderView *)self bounds];
  double Width = CGRectGetWidth(v38);
  uint64_t v5 = [(AMSUIOnboardingHeaderView *)self traitCollection];
  [v36 scaledValueForValue:v5 compatibleWithTraitCollection:60.0];
  double v7 = v6;

  uint64_t v8 = [(AMSUIOnboardingHeaderView *)self imageView];
  objc_msgSend(v8, "sizeThatFits:", Width, 3.40282347e38);
  double v10 = v9;

  [(AMSUIOnboardingHeaderView *)self safeAreaInsets];
  double v12 = v11 + 44.0;
  BOOL v13 = v11 < 60.0;
  double v14 = 104.0;
  if (!v13) {
    double v14 = v12;
  }
  float v15 = fmax(110.0 - v7 - v10, 0.0) + v14;
  double v16 = v10 + floorf(v15);
  double v17 = [(AMSUIOnboardingHeaderView *)self titleLabel];
  [v17 _firstBaselineOffsetFromTop];
  double v19 = v7 - v18 + v16;

  float v20 = [(AMSUIOnboardingHeaderView *)self titleLabel];
  objc_msgSend(v20, "sizeThatFits:", Width, 3.40282347e38);
  double v22 = v21 + v19;

  double v23 = [(AMSUIOnboardingHeaderView *)self titleLabel];
  [v23 _baselineOffsetFromBottom];
  double v25 = v22 - v24;

  double v26 = [(AMSUIOnboardingHeaderView *)self traitCollection];
  [v3 scaledValueForValue:v26 compatibleWithTraitCollection:32.0];
  double v28 = v27;
  double v29 = [(AMSUIOnboardingHeaderView *)self descriptionLabel];
  [v29 _firstBaselineOffsetFromTop];
  double v31 = v25 + v28 - v30;

  double v32 = [(AMSUIOnboardingHeaderView *)self descriptionLabel];
  objc_msgSend(v32, "sizeThatFits:", Width, 3.40282347e38);
  double v34 = v31 + v33;

  float v35 = v34;
  -[AMSUIOnboardingHeaderView setContentSize:](self, "setContentSize:", Width, roundf(v35));
}

- (CGSize)intrinsicContentSize
{
  [(AMSUIOnboardingHeaderView *)self updateContentSize];
  [(AMSUIOnboardingHeaderView *)self contentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setContainerHeight:(double)a3
{
  if (vabdd_f64(a3, self->_containerHeight) > 2.22044605e-16)
  {
    self->_containerHeight = a3;
    [(AMSUIOnboardingHeaderView *)self updateContentSize];
    [(AMSUIOnboardingHeaderView *)self setNeedsLayout];
  }
}

- (void)setIsPresentedInFormSheet:(BOOL)a3
{
  if (self->_isPresentedInFormSheet != a3)
  {
    self->_isPresentedInFormSheet = a3;
    [(AMSUIOnboardingHeaderView *)self updateContentSize];
    [(AMSUIOnboardingHeaderView *)self setNeedsLayout];
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