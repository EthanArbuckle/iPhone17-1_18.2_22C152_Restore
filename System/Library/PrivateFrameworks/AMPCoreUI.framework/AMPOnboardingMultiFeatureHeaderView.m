@interface AMPOnboardingMultiFeatureHeaderView
- (AMPOnboardingMultiFeatureHeaderView)initWithFeatures:(id)a3;
- (BOOL)isPresentedInFormSheet;
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

@implementation AMPOnboardingMultiFeatureHeaderView

- (AMPOnboardingMultiFeatureHeaderView)initWithFeatures:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AMPOnboardingMultiFeatureHeaderView;
  v5 = -[AMPOnboardingMultiFeatureHeaderView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v6;

    [(UILabel *)v5->_titleLabel setNumberOfLines:0];
    [(UILabel *)v5->_titleLabel setLineBreakMode:0];
    [(UILabel *)v5->_titleLabel setTextAlignment:1];
    [(AMPOnboardingMultiFeatureHeaderView *)v5 addSubview:v5->_titleLabel];
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
          v15 = [AMPOnboardingFeatureView alloc];
          v16 = -[AMPOnboardingFeatureView initWithFeature:](v15, "initWithFeature:", v14, (void)v20);
          [v8 addObject:v16];
          [(AMPOnboardingMultiFeatureHeaderView *)v5 addSubview:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v11);
    }

    uint64_t v17 = [v8 copy];
    featureViews = v5->_featureViews;
    v5->_featureViews = (NSArray *)v17;

    [(AMPOnboardingMultiFeatureHeaderView *)v5 setShowsVerticalScrollIndicator:0];
    [(AMPOnboardingMultiFeatureHeaderView *)v5 setShowsHorizontalScrollIndicator:0];
  }
  return v5;
}

- (void)layoutSubviews
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v58.receiver = self;
  v58.super_class = (Class)AMPOnboardingMultiFeatureHeaderView;
  [(AMPOnboardingMultiFeatureHeaderView *)&v58 layoutSubviews];
  v3 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D2F0]];
  id v4 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D2B8]];
  if ([(AMPOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 44.0;
  }
  if ([(AMPOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet])
  {
    double v6 = 100.0;
  }
  else
  {
    [(AMPOnboardingMultiFeatureHeaderView *)self containerHeight];
    double v6 = v7 * 0.045;
  }
  id v8 = [(AMPOnboardingMultiFeatureHeaderView *)self traitCollection];
  [v3 scaledValueForValue:v8 compatibleWithTraitCollection:v6];
  double v10 = v9;

  [(AMPOnboardingMultiFeatureHeaderView *)self safeAreaInsets];
  *(float *)&double v11 = v10 + v5 + v11;
  double v12 = floorf(*(float *)&v11);
  [(AMPOnboardingMultiFeatureHeaderView *)self bounds];
  double Width = CGRectGetWidth(v61);
  uint64_t v14 = [(AMPOnboardingMultiFeatureHeaderView *)self titleLabel];
  objc_msgSend(v14, "sizeThatFits:", Width, 3.40282347e38);
  double v16 = v15;
  double v18 = v17;

  [(AMPOnboardingMultiFeatureHeaderView *)self bounds];
  float v19 = CGRectGetMidX(v62) + v16 * -0.5;
  double v20 = floorf(v19);
  long long v21 = [(AMPOnboardingMultiFeatureHeaderView *)self titleLabel];
  [v21 _firstBaselineOffsetFromTop];
  double v23 = v12 - v22;
  objc_super v24 = [(AMPOnboardingMultiFeatureHeaderView *)self titleLabel];
  objc_msgSend(v24, "setFrame:", v20, v23, v16, v18);

  if ([(AMPOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet])
  {
    v25 = [(AMPOnboardingMultiFeatureHeaderView *)self traitCollection];
    [v3 scaledValueForValue:v25 compatibleWithTraitCollection:50.0];
    double v27 = v26;
  }
  else
  {
    [(AMPOnboardingMultiFeatureHeaderView *)self containerHeight];
    double v27 = v28 * 0.055;
  }
  v29 = [(AMPOnboardingMultiFeatureHeaderView *)self titleLabel];
  [v29 frame];
  double MaxY = CGRectGetMaxY(v63);
  v31 = [(AMPOnboardingMultiFeatureHeaderView *)self titleLabel];
  [v31 _baselineOffsetFromBottom];
  double v33 = v32;

  if ([(AMPOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet])
  {
    v34 = [(AMPOnboardingMultiFeatureHeaderView *)self traitCollection];
    [v4 scaledValueForValue:v34 compatibleWithTraitCollection:36.0];
    double v36 = v35;
  }
  else
  {
    [(AMPOnboardingMultiFeatureHeaderView *)self containerHeight];
    double v36 = v37 * 0.047;
  }
  uint64_t v38 = objc_msgSend(MEMORY[0x263F1CB60], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AMPOnboardingMultiFeatureHeaderView semanticContentAttribute](self, "semanticContentAttribute"));
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v39 = [(AMPOnboardingMultiFeatureHeaderView *)self featureViews];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    float v42 = v27 + MaxY - v33;
    float v43 = ceilf(v42);
    uint64_t v44 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v55 != v44) {
          objc_enumerationMutation(v39);
        }
        double v46 = v43;
        v47 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        objc_msgSend(v47, "sizeThatFits:", Width, 3.40282347e38);
        double v50 = v49;
        double v51 = Width - v49;
        if (v38 != 1) {
          double v51 = 0.0;
        }
        objc_msgSend(v47, "setFrame:", v51, v46, v50, v48);
        [v47 frame];
        double v52 = CGRectGetMaxY(v64);
        [v47 baselineOffsetFromBottom];
        *(float *)&double v53 = v36 + v52 - v53;
        float v43 = ceilf(*(float *)&v53);
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v41);
  }
}

- (void)adjustedContentInsetDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)AMPOnboardingMultiFeatureHeaderView;
  [(AMPOnboardingMultiFeatureHeaderView *)&v3 adjustedContentInsetDidChange];
  [(AMPOnboardingMultiFeatureHeaderView *)self updateContentSize];
  [(AMPOnboardingMultiFeatureHeaderView *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AMPOnboardingMultiFeatureHeaderView;
  [(AMPOnboardingMultiFeatureHeaderView *)&v14 traitCollectionDidChange:a3];
  id v4 = (void *)MEMORY[0x263F1C660];
  uint64_t v5 = *MEMORY[0x263F1D2F0];
  double v6 = [(AMPOnboardingMultiFeatureHeaderView *)self traitCollection];
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

  double v12 = [MEMORY[0x263F1C658] fontWithDescriptor:v11 size:0.0];

  uint64_t v13 = [(AMPOnboardingMultiFeatureHeaderView *)self titleLabel];
  [v13 setFont:v12];

  [(AMPOnboardingMultiFeatureHeaderView *)self updateContentSize];
  [(AMPOnboardingMultiFeatureHeaderView *)self setNeedsLayout];
}

- (void)setContainerHeight:(double)a3
{
  if (vabdd_f64(a3, self->_containerHeight) > 2.22044605e-16)
  {
    self->_containerHeight = a3;
    [(AMPOnboardingMultiFeatureHeaderView *)self updateContentSize];
    [(AMPOnboardingMultiFeatureHeaderView *)self setNeedsLayout];
  }
}

- (void)setIsPresentedInFormSheet:(BOOL)a3
{
  if (self->_isPresentedInFormSheet != a3)
  {
    self->_isPresentedInFormSheet = a3;
    [(AMPOnboardingMultiFeatureHeaderView *)self updateContentSize];
    [(AMPOnboardingMultiFeatureHeaderView *)self setNeedsLayout];
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMPOnboardingMultiFeatureHeaderView;
  -[AMPOnboardingMultiFeatureHeaderView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AMPOnboardingMultiFeatureHeaderView *)self updateContentSize];
}

- (void)updateContentSize
{
  id v48 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D2F0]];
  objc_super v3 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D2B8]];
  [(AMPOnboardingMultiFeatureHeaderView *)self bounds];
  double Width = CGRectGetWidth(v50);
  if ([(AMPOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 44.0;
  }
  if ([(AMPOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet])
  {
    double v6 = 100.0;
  }
  else
  {
    [(AMPOnboardingMultiFeatureHeaderView *)self containerHeight];
    double v6 = v7 * 0.045;
  }
  uint64_t v8 = [(AMPOnboardingMultiFeatureHeaderView *)self traitCollection];
  [v48 scaledValueForValue:v8 compatibleWithTraitCollection:v6];
  double v10 = v9;

  if ([(AMPOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet])
  {
    id v11 = [(AMPOnboardingMultiFeatureHeaderView *)self traitCollection];
    [v48 scaledValueForValue:v11 compatibleWithTraitCollection:50.0];
    double v13 = v12;
  }
  else
  {
    [(AMPOnboardingMultiFeatureHeaderView *)self containerHeight];
    double v13 = v14 * 0.055;
  }
  [(AMPOnboardingMultiFeatureHeaderView *)self safeAreaInsets];
  *(float *)&double v15 = v10 + v5 + v15;
  double v16 = floorf(*(float *)&v15);
  double v17 = [(AMPOnboardingMultiFeatureHeaderView *)self titleLabel];
  [v17 _firstBaselineOffsetFromTop];
  double v19 = v16 - v18 + 0.0;

  double v20 = [(AMPOnboardingMultiFeatureHeaderView *)self titleLabel];
  objc_msgSend(v20, "sizeThatFits:", Width, 3.40282347e38);
  double v22 = v21;
  double v23 = [(AMPOnboardingMultiFeatureHeaderView *)self titleLabel];
  [v23 _baselineOffsetFromBottom];
  *(float *)&double v24 = v13 + v22 - v24;
  double v25 = ceilf(*(float *)&v24);

  if ([(AMPOnboardingMultiFeatureHeaderView *)self isPresentedInFormSheet])
  {
    double v26 = [(AMPOnboardingMultiFeatureHeaderView *)self traitCollection];
    [v3 scaledValueForValue:v26 compatibleWithTraitCollection:36.0];
    double v28 = v27;
  }
  else
  {
    [(AMPOnboardingMultiFeatureHeaderView *)self containerHeight];
    double v28 = v29 * 0.047;
  }
  double v30 = v19 + v25;
  v31 = [(AMPOnboardingMultiFeatureHeaderView *)self featureViews];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    unint64_t v33 = 0;
    do
    {
      v34 = [(AMPOnboardingMultiFeatureHeaderView *)self featureViews];
      double v35 = [v34 objectAtIndexedSubscript:v33];

      objc_msgSend(v35, "sizeThatFits:", Width, 3.40282347e38);
      double v37 = v36;
      uint64_t v38 = [(AMPOnboardingMultiFeatureHeaderView *)self featureViews];
      uint64_t v39 = [v38 count] - 1;

      uint64_t v40 = [(AMPOnboardingMultiFeatureHeaderView *)self featureViews];
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

      v45 = [(AMPOnboardingMultiFeatureHeaderView *)self featureViews];
      unint64_t v46 = [v45 count];
    }
    while (v33 < v46);
  }
  float v47 = v30;
  -[AMPOnboardingMultiFeatureHeaderView setContentSize:](self, "setContentSize:", Width, roundf(v47));
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