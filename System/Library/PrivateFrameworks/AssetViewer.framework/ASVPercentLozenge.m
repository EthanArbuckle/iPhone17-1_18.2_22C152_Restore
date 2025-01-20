@interface ASVPercentLozenge
- (ASVPercentLozenge)init;
- (CGSize)intrinsicContentSize;
- (NSNumberFormatter)percentageFormatter;
- (UIViewPropertyAnimator)percentLozengeAnimator;
- (id)lozengeFont;
- (void)layoutSubviews;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setPercentLozengeAnimator:(id)a3;
- (void)setPercentage:(float)a3;
- (void)setPercentageFormatter:(id)a3;
- (void)setText:(id)a3;
- (void)sizeToFit;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ASVPercentLozenge

- (ASVPercentLozenge)init
{
  v14.receiver = self;
  v14.super_class = (Class)ASVPercentLozenge;
  v2 = -[ASVPercentLozenge initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    percentageFormatter = v2->_percentageFormatter;
    v2->_percentageFormatter = v3;

    [(NSNumberFormatter *)v2->_percentageFormatter setNumberStyle:3];
    id v5 = objc_alloc(MEMORY[0x1E4FB1ED8]);
    +[ASVSettings floatForKey:@"ASVSettingPercentLozengeFadeOutDuration"];
    uint64_t v7 = [v5 initWithDuration:0 curve:0 animations:v6];
    percentLozengeAnimator = v2->_percentLozengeAnimator;
    v2->_percentLozengeAnimator = (UIViewPropertyAnimator *)v7;

    v9 = [MEMORY[0x1E4FB1618] blackColor];
    [(ASVPercentLozenge *)v2 setTextColor:v9];

    [(ASVPercentLozenge *)v2 setTextAlignment:1];
    v10 = [MEMORY[0x1E4FB1618] whiteColor];
    [(ASVPercentLozenge *)v2 setBackgroundColor:v10];

    v11 = [(ASVPercentLozenge *)v2 lozengeFont];
    [(ASVPercentLozenge *)v2 setFont:v11];

    [(ASVPercentLozenge *)v2 setAdjustsFontForContentSizeCategory:1];
    v12 = [(ASVPercentLozenge *)v2 layer];
    [v12 setMasksToBounds:1];
  }
  return v2;
}

- (void)setPercentage:(float)a3
{
  id v8 = [(ASVPercentLozenge *)self percentageFormatter];
  *(float *)&double v5 = a3;
  float v6 = [NSNumber numberWithFloat:v5];
  uint64_t v7 = [v8 stringFromNumber:v6];
  [(ASVPercentLozenge *)self setText:v7];
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASVPercentLozenge;
  [(ASVPercentLozenge *)&v4 setText:a3];
  [(ASVPercentLozenge *)self sizeToFit];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASVPercentLozenge;
  id v4 = a3;
  [(ASVPercentLozenge *)&v8 traitCollectionDidChange:v4];
  double v5 = [(ASVPercentLozenge *)self traitCollection];
  float v6 = [v5 preferredContentSizeCategory];
  uint64_t v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(ASVPercentLozenge *)self sizeToFit];
  }
}

- (void)sizeToFit
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(ASVPercentLozenge *)self intrinsicContentSize];
  -[ASVPercentLozenge setBounds:](self, "setBounds:", v3, v4, v5, v6);
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)ASVPercentLozenge;
  [(ASVPercentLozenge *)&v9 layoutSubviews];
  [(ASVPercentLozenge *)self bounds];
  double v4 = v3;
  [(ASVPercentLozenge *)self bounds];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  double v7 = v6 * 0.5;
  objc_super v8 = [(ASVPercentLozenge *)self layer];
  [v8 setCornerRadius:v7];
}

- (CGSize)intrinsicContentSize
{
  v6.receiver = self;
  v6.super_class = (Class)ASVPercentLozenge;
  [(ASVPercentLozenge *)&v6 intrinsicContentSize];
  double v3 = v2 + 20.0;
  double v5 = v4 + 10.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    objc_initWeak(&location, self);
    objc_super v6 = (void *)MEMORY[0x1E4FB1EB0];
    +[ASVSettings floatForKey:@"ASVSettingPercentLozengeFadeOutDuration"];
    double v8 = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__ASVPercentLozenge_setHidden_animated___block_invoke;
    v10[3] = &unk_1E6DD7C40;
    objc_copyWeak(&v11, &location);
    BOOL v12 = v4;
    [v6 animateWithDuration:0 delay:v10 options:&__block_literal_global_9 animations:v8 completion:0.0];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_super v9 = [(ASVPercentLozenge *)self percentLozengeAnimator];
    [v9 stopAnimation:1];

    [(ASVPercentLozenge *)self setAlpha:(double)!v4];
  }
}

void __40__ASVPercentLozenge_setHidden_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAlpha:v1];
}

- (id)lozengeFont
{
  v22[1] = *MEMORY[0x1E4F143B8];
  double v2 = [(ASVPercentLozenge *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];

  BOOL v4 = (void *)*MEMORY[0x1E4FB2798];
  if ((UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v3, (UIContentSizeCategory)*MEMORY[0x1E4FB2798]) & 0x8000000000000000) == 0)
  {
    id v5 = v4;

    double v3 = v5;
  }
  objc_super v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v3];
  float v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] compatibleWithTraitCollection:v6];
  double v8 = [v7 fontDescriptor];
  objc_super v9 = [v8 fontDescriptorWithSymbolicTraits:2];

  uint64_t v21 = *MEMORY[0x1E4FB0910];
  v10 = objc_msgSend(NSNumber, "numberWithInt:", 6, *MEMORY[0x1E4FB0968]);
  v19[0] = v10;
  v18[1] = *MEMORY[0x1E4FB0960];
  id v11 = [NSNumber numberWithInt:0];
  v19[1] = v11;
  BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v20 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v22[0] = v13;
  objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v15 = [v9 fontDescriptorByAddingAttributes:v14];

  v16 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v15 size:0.0];

  return v16;
}

- (NSNumberFormatter)percentageFormatter
{
  return self->_percentageFormatter;
}

- (void)setPercentageFormatter:(id)a3
{
}

- (UIViewPropertyAnimator)percentLozengeAnimator
{
  return self->_percentLozengeAnimator;
}

- (void)setPercentLozengeAnimator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentLozengeAnimator, 0);
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
}

@end