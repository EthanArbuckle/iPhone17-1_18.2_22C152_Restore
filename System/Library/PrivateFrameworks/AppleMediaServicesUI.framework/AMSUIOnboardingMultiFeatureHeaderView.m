@interface AMSUIOnboardingMultiFeatureHeaderView
- (AMSUIOnboardingMultiFeatureHeaderView)initWithFeatures:(id)a3;
- (BOOL)isPresentedInFormSheet;
- (CGSize)intrinsicContentSize;
- (NSArray)featureViews;
- (UILabel)titleLabel;
- (double)containerHeight;
- (void)adjustedContentInsetDidChange;
- (void)layoutSubviews;
- (void)setContainerHeight:(double)a3;
- (void)setFeatureViews:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIsPresentedInFormSheet:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContentSize;
@end

@implementation AMSUIOnboardingMultiFeatureHeaderView

- (AMSUIOnboardingMultiFeatureHeaderView)initWithFeatures:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)AMSUIOnboardingMultiFeatureHeaderView;
  v5 = -[AMSUIOnboardingMultiFeatureHeaderView initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v6;

    [(UILabel *)v5->_titleLabel setNumberOfLines:0];
    [(UILabel *)v5->_titleLabel setLineBreakMode:0];
    [(UILabel *)v5->_titleLabel setTextAlignment:1];
    [(AMSUIOnboardingMultiFeatureHeaderView *)v5 addSubview:v5->_titleLabel];
    v8 = (void *)MEMORY[0x263F81720];
    uint64_t v9 = *MEMORY[0x263F83608];
    v10 = [(AMSUIOnboardingMultiFeatureHeaderView *)v5 traitCollection];
    v11 = [v8 preferredFontDescriptorWithTextStyle:v9 compatibleWithTraitCollection:v10];

    uint64_t v12 = [v11 fontDescriptorWithSymbolicTraits:2];
    v13 = (void *)v12;
    if (v12) {
      v14 = (void *)v12;
    }
    else {
      v14 = v11;
    }
    id v15 = v14;

    v16 = [MEMORY[0x263F81708] fontWithDescriptor:v15 size:0.0];
    v17 = [(AMSUIOnboardingMultiFeatureHeaderView *)v5 titleLabel];
    [v17 setFont:v16];

    id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v19 = v4;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v25 = [AMSUIOnboardingFeatureView alloc];
          v26 = -[AMSUIOnboardingFeatureView initWithFeature:](v25, "initWithFeature:", v24, (void)v30);
          [v18 addObject:v26];
          [(AMSUIOnboardingMultiFeatureHeaderView *)v5 addSubview:v26];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v21);
    }

    uint64_t v27 = [v18 copy];
    featureViews = v5->_featureViews;
    v5->_featureViews = (NSArray *)v27;

    [(AMSUIOnboardingMultiFeatureHeaderView *)v5 setShowsVerticalScrollIndicator:0];
    [(AMSUIOnboardingMultiFeatureHeaderView *)v5 setShowsHorizontalScrollIndicator:0];
  }
  return v5;
}

- (void)layoutSubviews
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)AMSUIOnboardingMultiFeatureHeaderView;
  [(AMSUIOnboardingMultiFeatureHeaderView *)&v43 layoutSubviews];
  if ([(AMSUIOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet]) {
    double v3 = 0.0;
  }
  else {
    double v3 = 44.0;
  }
  [(AMSUIOnboardingMultiFeatureHeaderView *)self safeAreaInsets];
  *(float *)&double v4 = v3 + v4 + 140.0;
  double v5 = floorf(*(float *)&v4);
  [(AMSUIOnboardingMultiFeatureHeaderView *)self bounds];
  double Width = CGRectGetWidth(v46);
  v7 = [(AMSUIOnboardingMultiFeatureHeaderView *)self titleLabel];
  objc_msgSend(v7, "sizeThatFits:", Width, 3.40282347e38);
  double v9 = v8;
  double v11 = v10;

  [(AMSUIOnboardingMultiFeatureHeaderView *)self bounds];
  float v12 = CGRectGetMidX(v47) + v9 * -0.5;
  double v13 = floorf(v12);
  v14 = [(AMSUIOnboardingMultiFeatureHeaderView *)self titleLabel];
  [v14 _firstBaselineOffsetFromTop];
  double v16 = v5 - v15;
  v17 = [(AMSUIOnboardingMultiFeatureHeaderView *)self titleLabel];
  objc_msgSend(v17, "setFrame:", v13, v16, v9, v11);

  id v18 = [(AMSUIOnboardingMultiFeatureHeaderView *)self titleLabel];
  [v18 frame];
  double MaxY = CGRectGetMaxY(v48);
  uint64_t v20 = [(AMSUIOnboardingMultiFeatureHeaderView *)self titleLabel];
  [v20 _baselineOffsetFromBottom];
  double v22 = v21;

  uint64_t v23 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AMSUIOnboardingMultiFeatureHeaderView semanticContentAttribute](self, "semanticContentAttribute"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v24 = [(AMSUIOnboardingMultiFeatureHeaderView *)self featureViews];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    float v27 = MaxY - v22 + 50.0;
    float v28 = ceilf(v27);
    uint64_t v29 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v24);
        }
        double v31 = v28;
        long long v32 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        objc_msgSend(v32, "sizeThatFits:", Width, 3.40282347e38);
        double v35 = v34;
        double v36 = Width - v34;
        if (v23 != 1) {
          double v36 = 0.0;
        }
        objc_msgSend(v32, "setFrame:", v36, v31, v35, v33);
        [v32 frame];
        double v37 = CGRectGetMaxY(v49);
        [v32 baselineOffsetFromBottom];
        *(float *)&double v38 = v37 - v38 + 36.0;
        float v28 = ceilf(*(float *)&v38);
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v26);
  }
}

- (void)adjustedContentInsetDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIOnboardingMultiFeatureHeaderView;
  [(AMSUIOnboardingMultiFeatureHeaderView *)&v3 adjustedContentInsetDidChange];
  [(AMSUIOnboardingMultiFeatureHeaderView *)self updateContentSize];
  [(AMSUIOnboardingMultiFeatureHeaderView *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AMSUIOnboardingMultiFeatureHeaderView;
  [(AMSUIOnboardingMultiFeatureHeaderView *)&v14 traitCollectionDidChange:a3];
  double v4 = (void *)MEMORY[0x263F81720];
  uint64_t v5 = *MEMORY[0x263F83608];
  v6 = [(AMSUIOnboardingMultiFeatureHeaderView *)self traitCollection];
  v7 = [v4 preferredFontDescriptorWithTextStyle:v5 compatibleWithTraitCollection:v6];

  uint64_t v8 = [v7 fontDescriptorWithSymbolicTraits:2];
  double v9 = (void *)v8;
  if (v8) {
    double v10 = (void *)v8;
  }
  else {
    double v10 = v7;
  }
  id v11 = v10;

  float v12 = [MEMORY[0x263F81708] fontWithDescriptor:v11 size:0.0];

  double v13 = [(AMSUIOnboardingMultiFeatureHeaderView *)self titleLabel];
  [v13 setFont:v12];

  [(AMSUIOnboardingMultiFeatureHeaderView *)self updateContentSize];
  [(AMSUIOnboardingMultiFeatureHeaderView *)self setNeedsLayout];
}

- (void)setContainerHeight:(double)a3
{
  if (vabdd_f64(a3, self->_containerHeight) > 2.22044605e-16)
  {
    self->_containerHeight = a3;
    [(AMSUIOnboardingMultiFeatureHeaderView *)self updateContentSize];
    [(AMSUIOnboardingMultiFeatureHeaderView *)self setNeedsLayout];
  }
}

- (void)setIsPresentedInFormSheet:(BOOL)a3
{
  if (self->_isPresentedInFormSheet != a3)
  {
    self->_isPresentedInFormSheet = a3;
    [(AMSUIOnboardingMultiFeatureHeaderView *)self updateContentSize];
    [(AMSUIOnboardingMultiFeatureHeaderView *)self setNeedsLayout];
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIOnboardingMultiFeatureHeaderView;
  -[AMSUIOnboardingMultiFeatureHeaderView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AMSUIOnboardingMultiFeatureHeaderView *)self updateContentSize];
}

- (CGSize)intrinsicContentSize
{
  [(AMSUIOnboardingMultiFeatureHeaderView *)self updateContentSize];
  [(AMSUIOnboardingMultiFeatureHeaderView *)self contentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)updateContentSize
{
  id v48 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83608]];
  double v3 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F835E8]];
  [(AMSUIOnboardingMultiFeatureHeaderView *)self bounds];
  double Width = CGRectGetWidth(v50);
  if ([(AMSUIOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 44.0;
  }
  if ([(AMSUIOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet])
  {
    double v6 = 140.0;
  }
  else
  {
    [(AMSUIOnboardingMultiFeatureHeaderView *)self containerHeight];
    double v6 = v7 * 0.045;
  }
  uint64_t v8 = [(AMSUIOnboardingMultiFeatureHeaderView *)self traitCollection];
  [v48 scaledValueForValue:v8 compatibleWithTraitCollection:v6];
  double v10 = v9;

  if ([(AMSUIOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet])
  {
    id v11 = [(AMSUIOnboardingMultiFeatureHeaderView *)self traitCollection];
    [v48 scaledValueForValue:v11 compatibleWithTraitCollection:50.0];
    double v13 = v12;
  }
  else
  {
    [(AMSUIOnboardingMultiFeatureHeaderView *)self containerHeight];
    double v13 = v14 * 0.055;
  }
  [(AMSUIOnboardingMultiFeatureHeaderView *)self safeAreaInsets];
  *(float *)&double v15 = v10 + v5 + v15;
  double v16 = floorf(*(float *)&v15);
  v17 = [(AMSUIOnboardingMultiFeatureHeaderView *)self titleLabel];
  [v17 _firstBaselineOffsetFromTop];
  double v19 = v16 - v18 + 0.0;

  uint64_t v20 = [(AMSUIOnboardingMultiFeatureHeaderView *)self titleLabel];
  objc_msgSend(v20, "sizeThatFits:", Width, 3.40282347e38);
  double v22 = v21;
  uint64_t v23 = [(AMSUIOnboardingMultiFeatureHeaderView *)self titleLabel];
  [v23 _baselineOffsetFromBottom];
  *(float *)&double v24 = v13 + v22 - v24;
  double v25 = ceilf(*(float *)&v24);

  if ([(AMSUIOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet])
  {
    uint64_t v26 = [(AMSUIOnboardingMultiFeatureHeaderView *)self traitCollection];
    [v3 scaledValueForValue:v26 compatibleWithTraitCollection:36.0];
    double v28 = v27;
  }
  else
  {
    [(AMSUIOnboardingMultiFeatureHeaderView *)self containerHeight];
    double v28 = v29 * 0.047;
  }
  double v30 = v19 + v25;
  double v31 = [(AMSUIOnboardingMultiFeatureHeaderView *)self featureViews];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    unint64_t v33 = 0;
    do
    {
      double v34 = [(AMSUIOnboardingMultiFeatureHeaderView *)self featureViews];
      double v35 = [v34 objectAtIndexedSubscript:v33];

      objc_msgSend(v35, "sizeThatFits:", Width, 3.40282347e38);
      double v37 = v36;
      double v38 = [(AMSUIOnboardingMultiFeatureHeaderView *)self featureViews];
      uint64_t v39 = [v38 count] - 1;

      long long v40 = [(AMSUIOnboardingMultiFeatureHeaderView *)self featureViews];
      unint64_t v41 = [v40 count];

      double v42 = 0.0;
      if (v33 != v39) {
        objc_msgSend(v35, "baselineOffsetFromBottom", 0.0);
      }
      if (++v33 >= v41) {
        double v43 = 0.0;
      }
      else {
        double v43 = v28;
      }
      float v44 = v43 + v37 - v42;
      double v30 = v30 + ceilf(v44);

      uint64_t v45 = [(AMSUIOnboardingMultiFeatureHeaderView *)self featureViews];
      unint64_t v46 = [v45 count];
    }
    while (v33 < v46);
  }
  float v47 = v30;
  -[AMSUIOnboardingMultiFeatureHeaderView setContentSize:](self, "setContentSize:", Width, roundf(v47));
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
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

- (NSArray)featureViews
{
  return self->_featureViews;
}

- (void)setFeatureViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureViews, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end