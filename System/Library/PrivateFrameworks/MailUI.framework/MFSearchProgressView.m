@interface MFSearchProgressView
+ (id)log;
- (BOOL)isAnimating;
- (MFSearchProgressView)initWithFrame:(CGRect)a3;
- (NSArray)characterLabels;
- (UIStackView)stackView;
- (id)_newProgressLabelWithText:(id)a3;
- (id)_searchingFont;
- (void)_endCharacterAnimation;
- (void)_setupLabels;
- (void)_startCharacterAnimation;
- (void)dealloc;
- (void)invalidateLayout;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimating:(BOOL)a3 fade:(BOOL)a4;
- (void)setCharacterLabels:(id)a3;
- (void)setStackView:(id)a3;
@end

@implementation MFSearchProgressView

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__MFSearchProgressView_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1) {
    dispatch_once(&log_onceToken_4, block);
  }
  v2 = (void *)log_log_4;
  return v2;
}

void __27__MFSearchProgressView_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;
}

- (id)_searchingFont
{
  v2 = [MEMORY[0x1E4F350E0] sharedFontMetricCache];
  id v3 = [v2 cachedFont:&__block_literal_global_11 forKey:@"MFSearchProgressView.searchingFont"];

  return v3;
}

id __38__MFSearchProgressView__searchingFont__block_invoke()
{
  v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950]];
  os_log_t v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

- (id)_newProgressLabelWithText:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4FB1930];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setText:v5];

  v7 = [MEMORY[0x1E4FB1618] grayColor];
  [v6 setTextColor:v7];

  v8 = [(MFSearchProgressView *)self _searchingFont];
  [v6 setFont:v8];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v6;
}

- (MFSearchProgressView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFSearchProgressView;
  id v3 = -[MFSearchProgressView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MFSearchProgressView *)v3 _setupLabels];
    [(MFSearchProgressView *)v4 setAlpha:0.0];
  }
  return v4;
}

- (void)dealloc
{
  [(MFSearchProgressView *)self _endCharacterAnimation];
  v3.receiver = self;
  v3.super_class = (Class)MFSearchProgressView;
  [(MFSearchProgressView *)&v3 dealloc];
}

- (void)_setupLabels
{
  v32[5] = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_msgSend(MEMORY[0x1E4FB1C60], "mf_baselineAlignedHorizontalStackView");
  [(MFSearchProgressView *)self setStackView:v3];

  v4 = [(MFSearchProgressView *)self stackView];
  [(MFSearchProgressView *)self addSubview:v4];

  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v6 = [v5 localizedStringForKey:@"SEARCHING" value:&stru_1F39CB5D8 table:@"Main"];
  id v7 = [(MFSearchProgressView *)self _newProgressLabelWithText:v6];

  v8 = [(MFSearchProgressView *)self stackView];
  v31 = v7;
  [v8 addArrangedSubview:v7];

  uint64_t v9 = 3;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v12 = [v11 localizedStringForKey:@"SEARCHING_ANIMATED_CHARACTER" value:&stru_1F39CB5D8 table:@"Main"];

  do
  {
    id v13 = [(MFSearchProgressView *)self _newProgressLabelWithText:v12];
    [v13 setAlpha:0.0];
    [v10 addObject:v13];
    v14 = [(MFSearchProgressView *)self stackView];
    [v14 addArrangedSubview:v13];

    --v9;
  }
  while (v9);
  [(MFSearchProgressView *)self setCharacterLabels:v10];
  v30 = [(UIStackView *)self->_stackView topAnchor];
  v29 = [(MFSearchProgressView *)self topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:8.0];
  v32[0] = v28;
  v27 = [(UIStackView *)self->_stackView leadingAnchor];
  v26 = [(MFSearchProgressView *)self leadingAnchor];
  v25 = [v27 constraintGreaterThanOrEqualToAnchor:v26 constant:8.0];
  v32[1] = v25;
  v24 = [(UIStackView *)self->_stackView bottomAnchor];
  v23 = [(MFSearchProgressView *)self bottomAnchor];
  v15 = [v24 constraintEqualToAnchor:v23 constant:-8.0];
  v32[2] = v15;
  v16 = [(UIStackView *)self->_stackView trailingAnchor];
  v17 = [(MFSearchProgressView *)self trailingAnchor];
  v18 = [v16 constraintLessThanOrEqualToAnchor:v17 constant:-8.0];
  v32[3] = v18;
  v19 = [(UIStackView *)self->_stackView centerXAnchor];
  v20 = [(MFSearchProgressView *)self centerXAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v32[4] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:5];

  [MEMORY[0x1E4F28DC8] activateConstraints:v22];
}

- (void)_startCharacterAnimation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[MFSearchProgressView log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DDCDB000, v3, OS_LOG_TYPE_DEFAULT, "Starting 'searching...' animation", buf, 2u);
  }

  v4 = [(MFSearchProgressView *)self characterLabels];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v8++) setAlpha:0.0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  double v9 = (double)(unint64_t)([v4 count] + 1) * 0.4 + 0.05;
  UIAnimationDragCoefficient();
  double v13 = v9 * v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__MFSearchProgressView__startCharacterAnimation__block_invoke;
  aBlock[3] = &unk_1E6D12688;
  id v15 = v4;
  float64x2_t v16 = vdivq_f64((float64x2_t)xmmword_1DDF03A30, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v13, 0));
  double v17 = 0.05 / v13;
  id v11 = v4;
  v12 = _Block_copy(aBlock);
  [MEMORY[0x1E4FB1EB0] animateKeyframesWithDuration:8 delay:v12 options:0 animations:v13 completion:0.0];
}

uint64_t __48__MFSearchProgressView__startCharacterAnimation__block_invoke(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__MFSearchProgressView__startCharacterAnimation__block_invoke_2;
  v3[3] = &__block_descriptor_56_e23_v32__0__UIView_8Q16_B24l;
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __48__MFSearchProgressView__startCharacterAnimation__block_invoke_2(double *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = a1[5];
  double v7 = a1[4] * (double)(unint64_t)(a3 + 1);
  uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__MFSearchProgressView__startCharacterAnimation__block_invoke_3;
  v15[3] = &unk_1E6D11708;
  id v9 = v5;
  id v16 = v9;
  [v8 addKeyframeWithRelativeStartTime:v15 relativeDuration:v7 animations:v6];
  float v10 = (void *)MEMORY[0x1E4FB1EB0];
  double v11 = a1[6];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__MFSearchProgressView__startCharacterAnimation__block_invoke_4;
  v13[3] = &unk_1E6D11708;
  id v14 = v9;
  id v12 = v9;
  [v10 addKeyframeWithRelativeStartTime:v13 relativeDuration:1.0 - v11 animations:v11];
}

uint64_t __48__MFSearchProgressView__startCharacterAnimation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __48__MFSearchProgressView__startCharacterAnimation__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)_endCharacterAnimation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[MFSearchProgressView log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DDCDB000, v3, OS_LOG_TYPE_DEFAULT, "Stopping 'searching...' animation", buf, 2u);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v4 = [(MFSearchProgressView *)self characterLabels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        float v10 = [v9 layer];
        [v10 removeAllAnimations];

        [v9 setAlpha:0.0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)setAnimating:(BOOL)a3 fade:(BOOL)a4
{
  if (self->_animating != a3)
  {
    BOOL v4 = a4;
    self->_animating = a3;
    if (a3)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __42__MFSearchProgressView_setAnimating_fade___block_invoke_3;
      aBlock[3] = &unk_1E6D11708;
      void aBlock[4] = self;
      uint64_t v6 = (void (**)(void))_Block_copy(aBlock);
      uint64_t v7 = v12;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      uint64_t v8 = __42__MFSearchProgressView_setAnimating_fade___block_invoke_4;
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __42__MFSearchProgressView_setAnimating_fade___block_invoke_5;
      v11[3] = &unk_1E6D11708;
      v11[4] = self;
      uint64_t v6 = (void (**)(void))_Block_copy(v11);
      uint64_t v7 = v10;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      uint64_t v8 = __42__MFSearchProgressView_setAnimating_fade___block_invoke_6;
    }
    v7[2] = v8;
    v7[3] = &unk_1E6D126B0;
    v7[4] = self;
    id v9 = (void (**)(void *, uint64_t))_Block_copy(v7);
    if (v4)
    {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:v9 completion:0.15];
    }
    else
    {
      v6[2](v6);
      v9[2](v9, 1);
    }
  }
}

uint64_t __42__MFSearchProgressView_setAnimating_fade___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __42__MFSearchProgressView_setAnimating_fade___block_invoke_4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) setAlpha:1.0];
  }
  objc_super v3 = *(void **)(a1 + 32);
  return [v3 _startCharacterAnimation];
}

uint64_t __42__MFSearchProgressView_setAnimating_fade___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __42__MFSearchProgressView_setAnimating_fade___block_invoke_6(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) setAlpha:0.0];
  }
  objc_super v3 = *(void **)(a1 + 32);
  return [v3 _endCharacterAnimation];
}

- (void)setAnimating:(BOOL)a3
{
}

- (void)invalidateLayout
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F350E0] sharedFontMetricCache];
  [v3 ensureCacheIsValid];

  BOOL v4 = [(MFSearchProgressView *)self stackView];
  uint64_t v5 = [v4 arrangedSubviews];
  uint64_t v6 = objc_msgSend(v5, "ef_filter:", &__block_literal_global_38);

  uint64_t v7 = [(MFSearchProgressView *)self _searchingFont];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "setFont:", v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

uint64_t __40__MFSearchProgressView_invalidateLayout__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSArray)characterLabels
{
  return self->_characterLabels;
}

- (void)setCharacterLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterLabels, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end