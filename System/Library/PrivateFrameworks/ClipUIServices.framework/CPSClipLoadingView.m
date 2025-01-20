@interface CPSClipLoadingView
- (BOOL)_loadingIsComplete;
- (BOOL)isPoweredByThirdParty;
- (CPSClipLoadingView)initWithCoder:(id)a3;
- (CPSClipLoadingView)initWithFrame:(CGRect)a3;
- (NSString)name;
- (NSString)provider;
- (UIImage)backgroundImage;
- (float)loadingProgress;
- (id)_animationForTranslationY:(double)a3;
- (id)_backdropEffectRemovalAnimationForKeyPath:(id)a3;
- (id)_basicAnimationToDecreaseOpacity;
- (id)_springAnimationToDecreaseOpacity;
- (id)_textScaleUpSpringAnimation;
- (void)_reloadTapped:(id)a3;
- (void)_revealBackgroundAndLabels;
- (void)_showCompletionAnimation:(id)a3;
- (void)_startAnimationIfNeeded;
- (void)_updateConicGradientRotation;
- (void)_updateLoadingProgress;
- (void)finishLoadingWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundImage:(id)a3 animated:(BOOL)a4;
- (void)setLoadingHasFailed:(BOOL)a3 animated:(BOOL)a4 reason:(id)a5 reloadHandler:(id)a6;
- (void)setLoadingProgress:(float)a3 completion:(id)a4;
- (void)setName:(id)a3;
- (void)setPoweredByThirdParty:(BOOL)a3;
- (void)setProvider:(id)a3;
@end

@implementation CPSClipLoadingView

- (CPSClipLoadingView)initWithFrame:(CGRect)a3
{
  v76[1] = *MEMORY[0x1E4F143B8];
  v75.receiver = self;
  v75.super_class = (Class)CPSClipLoadingView;
  v3 = -[CPSClipLoadingView initWithFrame:](&v75, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    name = v3->_name;
    v3->_name = (NSString *)&stru_1F306C450;

    provider = v4->_provider;
    v4->_provider = (NSString *)&stru_1F306C450;

    v7 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(CPSClipLoadingView *)v4 setBackgroundColor:v7];

    [(CPSClipLoadingView *)v4 setAccessibilityIgnoresInvertColors:1];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F42AA0], "cps_imageViewWithImage:tintColor:backgroundColor:", 0, 0, 0);
    heroImageView = v4->_heroImageView;
    v4->_heroImageView = (UIImageView *)v8;

    [(UIImageView *)v4->_heroImageView setContentMode:2];
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    gradientView = v4->_gradientView;
    v4->_gradientView = v10;

    if (UIAccessibilityIsReduceMotionEnabled())
    {
      v12 = [MEMORY[0x1E4F428B8] blackColor];
      v13 = [v12 colorWithAlphaComponent:0.3];
      [(UIView *)v4->_gradientView setBackgroundColor:v13];
    }
    else
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F39BD0], "cps_grayscaleConicGradientLayer");
      gradientLayer = v4->_gradientLayer;
      v4->_gradientLayer = (CAGradientLayer *)v14;

      v16 = [(UIView *)v4->_gradientView layer];
      [v16 addSublayer:v4->_gradientLayer];

      v12 = [(UIView *)v4->_gradientView layer];
      LODWORD(v17) = 1053609165;
      [v12 setOpacity:v17];
    }

    [(UIView *)v4->_gradientView sizeToFit];
    v18 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
    v19 = [(UIView *)v4->_gradientView layer];
    [v19 setCompositingFilter:v18];

    v20 = [MEMORY[0x1E4F1CA48] array];
    if (!UIAccessibilityIsReduceTransparencyEnabled())
    {
      v21 = objc_msgSend(MEMORY[0x1E4F39BC0], "cps_filterWithType:value:forKey:", *MEMORY[0x1E4F3A260], *MEMORY[0x1E4F3A100], 0.4);
      [v21 setValue:&unk_1F3070F80 forKey:*MEMORY[0x1E4F3A218]];
      [v20 addObject:v21];
    }
    v74 = objc_msgSend(MEMORY[0x1E4F39BC0], "cps_filterWithType:value:forKey:", *MEMORY[0x1E4F3A0D0], *MEMORY[0x1E4F3A1D8], 50.0);
    [v74 setValue:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F3A170]];
    [v74 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3A1B8]];
    [v20 addObject:v74];
    uint64_t v22 = *MEMORY[0x1E4F3A048];
    v73 = objc_msgSend(MEMORY[0x1E4F39BC0], "cps_filterWithType:value:forKey:", *MEMORY[0x1E4F3A048], *MEMORY[0x1E4F3A048], 1.6);
    [v20 addObject:v73];
    v23 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    backdropView = v4->_backdropView;
    v4->_backdropView = v23;

    v25 = [(UIView *)v4->_backdropView layer];
    [v25 setAllowsGroupBlending:0];

    [(UIView *)v4->_backdropView addSubview:v4->_heroImageView];
    [(UIView *)v4->_backdropView addSubview:v4->_gradientView];
    [(CPSClipLoadingView *)v4 addSubview:v4->_backdropView];
    v26 = (CABackdropLayer *)objc_alloc_init(MEMORY[0x1E4F39B40]);
    backdropLayer = v4->_backdropLayer;
    v4->_backdropLayer = v26;

    [(CABackdropLayer *)v4->_backdropLayer setFilters:v20];
    [(CABackdropLayer *)v4->_backdropLayer setScale:0.25];
    v28 = [(CPSClipLoadingView *)v4 layer];
    [v28 addSublayer:v4->_backdropLayer];

    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    labelContainerView = v4->_labelContainerView;
    v4->_labelContainerView = v29;

    v31 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    clipNameContainerView = v4->_clipNameContainerView;
    v4->_clipNameContainerView = v31;

    v33 = (void *)MEMORY[0x1E4F42B38];
    v34 = [MEMORY[0x1E4F428B8] whiteColor];
    uint64_t v35 = objc_msgSend(v33, "cps_labelWithText:textColor:fontSize:fontWeight:", 0, v34, 35.0, *MEMORY[0x1E4F43908]);
    clipNameLabel = v4->_clipNameLabel;
    v4->_clipNameLabel = (UILabel *)v35;

    [(UILabel *)v4->_clipNameLabel setTextAlignment:1];
    [(UIView *)v4->_clipNameContainerView setMaskView:v4->_clipNameLabel];
    v37 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A018]];
    v38 = [(UIView *)v4->_clipNameContainerView layer];
    v39 = [v38 mask];
    [v39 setCompositingFilter:v37];

    v72 = objc_msgSend(MEMORY[0x1E4F39BC0], "cps_filterWithType:value:forKey:", v22, v22, 2.0);
    v40 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    clipNameBackdropView = v4->_clipNameBackdropView;
    v4->_clipNameBackdropView = v40;

    v42 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIView *)v4->_clipNameBackdropView setBackgroundColor:v42];

    [(UIView *)v4->_clipNameBackdropView setAlpha:0.5];
    v76[0] = v72;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:1];
    v44 = [(UIView *)v4->_clipNameBackdropView layer];
    [v44 setFilters:v43];

    [(UIView *)v4->_clipNameContainerView addSubview:v4->_clipNameBackdropView];
    v45 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    clipNameProgressView = v4->_clipNameProgressView;
    v4->_clipNameProgressView = v45;

    v47 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIView *)v4->_clipNameProgressView setBackgroundColor:v47];

    [(UIView *)v4->_clipNameContainerView addSubview:v4->_clipNameProgressView];
    v48 = (void *)MEMORY[0x1E4F42B38];
    v49 = [MEMORY[0x1E4F428B8] whiteColor];
    uint64_t v50 = objc_msgSend(v48, "cps_labelWithText:textColor:fontSize:fontWeight:", 0, v49, 17.0, *MEMORY[0x1E4F43928]);
    poweredByLabel = v4->_poweredByLabel;
    v4->_poweredByLabel = (UILabel *)v50;

    [(UILabel *)v4->_poweredByLabel setTextAlignment:1];
    v52 = [(UILabel *)v4->_poweredByLabel layer];
    LODWORD(v53) = 0.75;
    [v52 setOpacity:v53];

    [(UIView *)v4->_labelContainerView addSubview:v4->_clipNameContainerView];
    [(UIView *)v4->_labelContainerView addSubview:v4->_poweredByLabel];
    [(CPSClipLoadingView *)v4 addSubview:v4->_labelContainerView];
    v54 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    errorContainerView = v4->_errorContainerView;
    v4->_errorContainerView = v54;

    [(UIView *)v4->_errorContainerView setAlpha:0.0];
    [(CPSClipLoadingView *)v4 addSubview:v4->_errorContainerView];
    v56 = [CPSVibrantLabel alloc];
    uint64_t v57 = [(CPSVibrantLabel *)v56 initWithTextStyle:*MEMORY[0x1E4F438F8] textVariant:0 vibrancyEffectStyle:1];
    clipUnavailableLabel = v4->_clipUnavailableLabel;
    v4->_clipUnavailableLabel = (CPSVibrantLabel *)v57;

    [(CPSVibrantLabel *)v4->_clipUnavailableLabel setOverrideUserInterfaceStyle:2];
    [(CPSVibrantLabel *)v4->_clipUnavailableLabel setNumberOfLines:3];
    [(CPSVibrantLabel *)v4->_clipUnavailableLabel setTextAlignment:1];
    v59 = _CPSLocalizedString();
    [(CPSVibrantLabel *)v4->_clipUnavailableLabel setText:v59];

    [(UIView *)v4->_errorContainerView addSubview:v4->_clipUnavailableLabel];
    v60 = [CPSButton alloc];
    v61 = _CPSLocalizedString();
    v62 = [MEMORY[0x1E4F428B8] whiteColor];
    v63 = [MEMORY[0x1E4F428B8] whiteColor];
    v64 = [v63 colorWithAlphaComponent:0.15];
    uint64_t v65 = *MEMORY[0x1E4F438A0];
    uint64_t v66 = [(CPSButton *)v60 initWithTitle:v61 enabledTitleColor:v62 disabledTitleColor:0 backgroundColor:v64 textStyle:*MEMORY[0x1E4F438A0] cornerRadius:1 animatesAlphaWhenHighlighted:0.0];
    retryButton = v4->_retryButton;
    v4->_retryButton = (CPSButton *)v66;

    v68 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:v65 variant:8];
    v69 = [(CPSButton *)v4->_retryButton titleLabel];
    [v69 setFont:v68];

    -[CPSButton setContentEdgeInsets:](v4->_retryButton, "setContentEdgeInsets:", 14.0, 27.0, 14.0, 27.0);
    [(CPSButton *)v4->_retryButton addTarget:v4 action:sel__reloadTapped_ forControlEvents:64];
    [(UIView *)v4->_errorContainerView addSubview:v4->_retryButton];
    v70 = v4;
  }
  return v4;
}

- (CPSClipLoadingView)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-initWithCoder: is not implemented." userInfo:0];
  objc_exception_throw(v4);
}

- (void)layoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)CPSClipLoadingView;
  [(CPSClipLoadingView *)&v53 layoutSubviews];
  if (self->_labelsNeedUpdate)
  {
    self->_labelsNeedUpdate = 0;
    if (self->_poweredByThirdParty) {
      id v3 = &OBJC_IVAR___CPSClipLoadingView__name;
    }
    else {
      id v3 = &OBJC_IVAR___CPSClipLoadingView__provider;
    }
    id v4 = *(id *)((char *)&self->super.super.super.isa + *v3);
    if (self->_poweredByThirdParty) {
      provider = self->_provider;
    }
    else {
      provider = 0;
    }
    v6 = provider;
    uint64_t v7 = [v4 length];
    clipNameLabel = self->_clipNameLabel;
    if (v7)
    {
      [(UILabel *)clipNameLabel setText:v4];
      if ([(NSString *)v6 length]) {
        [MEMORY[0x1E4F59120] poweredByCaptionForAppName:self->_provider];
      }
      else {
      v9 = _CPSLocalizedString();
      }
      [(UILabel *)self->_poweredByLabel setText:v9];
    }
    else
    {
      [(UILabel *)clipNameLabel setText:0];
      [(UILabel *)self->_poweredByLabel setText:0];
    }
  }
  [(CPSClipLoadingView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(CPSClipLoadingView *)self center];
  double v19 = v18;
  double v21 = v20;
  -[UIImageView setFrame:](self->_heroImageView, "setFrame:", 0.0, 0.0, v15 * 3.45, v17 * 1.74);
  -[UIImageView setCenter:](self->_heroImageView, "setCenter:", v19, v21);
  if (v15 >= v17) {
    double v22 = v15;
  }
  else {
    double v22 = v17;
  }
  -[UIView setFrame:](self->_gradientView, "setFrame:", 0.0, 0.0, v22 * 1.3, v22 * 1.3);
  double v51 = v19;
  double v52 = v21;
  -[UIView setCenter:](self->_gradientView, "setCenter:", v19, v21);
  [(UIView *)self->_gradientView bounds];
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
  double v50 = v11;
  -[UIView setFrame:](self->_backdropView, "setFrame:", v11, v13, v15, v17);
  -[UIView setCenter:](self->_backdropView, "setCenter:", v19, v21);
  -[CABackdropLayer setFrame:](self->_backdropLayer, "setFrame:", v11, v13, v15, v17);
  if ([MEMORY[0x1E4F59120] deviceIsPad]) {
    double v23 = 55.0;
  }
  else {
    double v23 = 30.0;
  }
  if (v17 < 568.0) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = 3;
  }
  [(UILabel *)self->_clipNameLabel setNumberOfLines:v24];
  [(UILabel *)self->_poweredByLabel setNumberOfLines:v24];
  -[UILabel cps_sizeToFitWithinSize:](self->_poweredByLabel, "cps_sizeToFitWithinSize:", v15 / 1.1 + v23 * -2.0, v17);
  -[UILabel cps_sizeToFitWithinSize:](self->_clipNameLabel, "cps_sizeToFitWithinSize:", v15 / 1.1 + v23 * -2.0, v17);
  [(UILabel *)self->_clipNameLabel frame];
  -[UIView setFrame:](self->_clipNameContainerView, "setFrame:");
  [(UIView *)self->_clipNameContainerView bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  -[UILabel setFrame:](self->_clipNameLabel, "setFrame:");
  -[UIView setFrame:](self->_clipNameBackdropView, "setFrame:", v26, v28, v30, v32);
  [(CPSClipLoadingView *)self _updateLoadingProgress];
  [(UIView *)self->_clipNameContainerView frame];
  double v34 = v33;
  [(UILabel *)self->_poweredByLabel frame];
  double v36 = fmax(v34, v35);
  [(UIView *)self->_clipNameContainerView frame];
  double v38 = v37;
  [(UILabel *)self->_poweredByLabel frame];
  double v40 = v23 + v38 + v39;
  v54.origin.x = v50;
  v54.origin.y = v13;
  v54.size.width = v15;
  v54.size.height = v17;
  CGFloat v41 = (CGRectGetWidth(v54) - v36) * 0.5;
  v55.origin.x = v50;
  v55.origin.y = v13;
  v55.size.width = v15;
  v55.size.height = v17;
  -[UIView setFrame:](self->_labelContainerView, "setFrame:", v41, -(v40 - CGRectGetHeight(v55) * 0.96615) * 0.5, v36, v40);
  if (self->_poweredByThirdParty) {
    uint64_t v42 = 432;
  }
  else {
    uint64_t v42 = 528;
  }
  if (self->_poweredByThirdParty) {
    uint64_t v43 = 528;
  }
  else {
    uint64_t v43 = 432;
  }
  [(UIView *)self->_labelContainerView cps_verticallyAlignTopView:*(Class *)((char *)&self->super.super.super.isa + v42) bottomView:*(Class *)((char *)&self->super.super.super.isa + v43) margin:v23];
  -[UIView setFrame:](self->_errorContainerView, "setFrame:", v50, v13, v15, v17);
  [(CPSButton *)self->_retryButton sizeToFit];
  [(CPSButton *)self->_retryButton bounds];
  double v44 = CGRectGetHeight(v56) * 0.5;
  [(CPSButton *)self->_retryButton _setContinuousCornerRadius:ceil(v44)];
  -[CPSButton setCenter:](self->_retryButton, "setCenter:", v51, v52);
  [(CPSButton *)self->_retryButton frame];
  double v46 = v45;
  v57.origin.x = v50;
  v57.origin.y = v13;
  v57.size.width = v15;
  v57.size.height = v17;
  -[CPSButton setOrigin:](self->_retryButton, "setOrigin:", v46, (CGRectGetHeight(v57) - v44) * 0.85);
  -[UIView cps_sizeToFitWithinSize:](self->_clipUnavailableLabel, "cps_sizeToFitWithinSize:", v15 / 1.1 + v23 * -2.0, v17);
  -[CPSVibrantLabel setCenter:](self->_clipUnavailableLabel, "setCenter:", v51, v52);
  [(CPSVibrantLabel *)self->_clipUnavailableLabel bounds];
  CGFloat v47 = CGRectGetHeight(v58) * 0.5;
  [(CPSVibrantLabel *)self->_clipUnavailableLabel frame];
  double v49 = v48;
  v59.origin.x = v50;
  v59.origin.y = v13;
  v59.size.width = v15;
  v59.size.height = v17;
  -[CPSVibrantLabel setOrigin:](self->_clipUnavailableLabel, "setOrigin:", v49, (CGRectGetHeight(v59) - v47) * 0.45);
  [(CPSClipLoadingView *)self _startAnimationIfNeeded];
}

- (void)setLoadingHasFailed:(BOOL)a3 animated:(BOOL)a4 reason:(id)a5 reloadHandler:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  if (self->_loadingHasFailed != v8)
  {
    self->_loadingHasFailed = v8;
    if (v8) {
      id v11 = a6;
    }
    else {
      id v11 = 0;
    }
    double v12 = (void *)MEMORY[0x1D9487A30](v11);
    id reloadHandler = self->_reloadHandler;
    self->_id reloadHandler = v12;

    if (v8 && [v10 length]) {
      [(CPSVibrantLabel *)self->_clipUnavailableLabel setText:v10];
    }
    double v14 = 0.3;
    if (!v7) {
      double v14 = 0.0;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__CPSClipLoadingView_setLoadingHasFailed_animated_reason_reloadHandler___block_invoke;
    v17[3] = &unk_1E6AE9020;
    v17[4] = self;
    BOOL v18 = v8;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__CPSClipLoadingView_setLoadingHasFailed_animated_reason_reloadHandler___block_invoke_2;
    v15[3] = &unk_1E6AE93C0;
    BOOL v16 = v8;
    v15[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v17 animations:v15 completion:v14];
    [(CPSClipLoadingView *)self _updateConicGradientRotation];
  }
}

uint64_t __72__CPSClipLoadingView_setLoadingHasFailed_animated_reason_reloadHandler___block_invoke(uint64_t a1)
{
  double v2 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 504) setAlpha:v2];
  LOBYTE(v3) = *(unsigned char *)(a1 + 40);
  double v4 = (double)v3;
  v5 = *(void **)(*(void *)(a1 + 32) + 456);

  return [v5 setAlpha:v4];
}

uint64_t __72__CPSClipLoadingView_setLoadingHasFailed_animated_reason_reloadHandler___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) setLoadingProgress:0 completion:0.0];
  }
  return result;
}

- (void)setName:(id)a3
{
  double v4 = &stru_1F306C450;
  if (a3) {
    double v4 = (__CFString *)a3;
  }
  v5 = v4;
  uint64_t name = (uint64_t)self->_name;
  if ((__CFString *)name != v5)
  {
    v9 = v5;
    uint64_t name = [(id)name isEqualToString:v5];
    v5 = v9;
    if ((name & 1) == 0)
    {
      BOOL v7 = (NSString *)[(__CFString *)v9 copy];
      BOOL v8 = self->_name;
      self->_uint64_t name = v7;

      self->_labelsNeedUpdate = 1;
      uint64_t name = [(CPSClipLoadingView *)self setNeedsLayout];
      v5 = v9;
    }
  }

  MEMORY[0x1F41817F8](name, v5);
}

- (void)setProvider:(id)a3
{
  double v4 = &stru_1F306C450;
  if (a3) {
    double v4 = (__CFString *)a3;
  }
  v5 = v4;
  uint64_t provider = (uint64_t)self->_provider;
  if ((__CFString *)provider != v5)
  {
    v9 = v5;
    uint64_t provider = [(id)provider isEqualToString:v5];
    v5 = v9;
    if ((provider & 1) == 0)
    {
      BOOL v7 = (NSString *)[(__CFString *)v9 copy];
      BOOL v8 = self->_provider;
      self->_uint64_t provider = v7;

      self->_labelsNeedUpdate = 1;
      uint64_t provider = [(CPSClipLoadingView *)self setNeedsLayout];
      v5 = v9;
    }
  }

  MEMORY[0x1F41817F8](provider, v5);
}

- (UIImage)backgroundImage
{
  return [(UIImageView *)self->_heroImageView image];
}

- (void)setBackgroundImage:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__CPSClipLoadingView_setBackgroundImage_animated___block_invoke;
  v15[3] = &unk_1E6AE93E8;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  BOOL v8 = (void (**)(void, void))MEMORY[0x1D9487A30](v15);
  v9 = v8;
  if (a4)
  {
    id v10 = (void *)MEMORY[0x1E4F42FF0];
    heroImageView = self->_heroImageView;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__CPSClipLoadingView_setBackgroundImage_animated___block_invoke_2;
    v12[3] = &unk_1E6AE9410;
    double v14 = v8;
    id v13 = v7;
    [v10 transitionWithView:heroImageView duration:5242880 options:v12 animations:0 completion:0.7];
  }
  else
  {
    ((void (**)(void, id))v8)[2](v8, v7);
  }
}

void __50__CPSClipLoadingView_setBackgroundImage_animated___block_invoke(uint64_t a1)
{
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  unint64_t v3 = *(void **)(a1 + 40);
  if (IsReduceTransparencyEnabled)
  {
    unint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "cps_averageColorImage");
  }
  [*(id *)(*(void *)(a1 + 32) + 496) setImage:v3];
  if (IsReduceTransparencyEnabled) {

  }
  if (*(void *)(a1 + 40)) {
    float v4 = 0.25;
  }
  else {
    float v4 = 0.4;
  }
  id v6 = [*(id *)(*(void *)(a1 + 32) + 544) layer];
  *(float *)&double v5 = v4;
  [v6 setOpacity:v5];
}

uint64_t __50__CPSClipLoadingView_setBackgroundImage_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setLoadingProgress:(float)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = v6;
  if (self->_loadingProgress == a3)
  {
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    ++self->_progressChangeAnimationCount;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__CPSClipLoadingView_setLoadingProgress_completion___block_invoke;
    v18[3] = &unk_1E6AE9438;
    v18[4] = self;
    double v19 = v6;
    BOOL v8 = (void *)MEMORY[0x1D9487A30](v18);
    self->_loadingProgress = a3;
    BOOL v9 = [(CPSClipLoadingView *)self _loadingIsComplete];
    BOOL v10 = v9;
    if (v9) {
      double v11 = 0.2;
    }
    else {
      double v11 = 0.1;
    }
    double v12 = (void *)MEMORY[0x1E4F42FF0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__CPSClipLoadingView_setLoadingProgress_completion___block_invoke_2;
    v17[3] = &unk_1E6AE8DF0;
    v17[4] = self;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__CPSClipLoadingView_setLoadingProgress_completion___block_invoke_3;
    v14[3] = &unk_1E6AE9460;
    BOOL v16 = v9;
    id v13 = v8;
    id v15 = v13;
    [v12 animateWithDuration:v17 animations:v14 completion:v11];
    if (v10) {
      [(CPSClipLoadingView *)self _showCompletionAnimation:v13];
    }
  }
}

uint64_t __52__CPSClipLoadingView_setLoadingProgress_completion___block_invoke(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 520);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(v3 + 520))
  {
    uint64_t result = *(void *)(v3 + 488);
    if (result)
    {
      float v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

uint64_t __52__CPSClipLoadingView_setLoadingProgress_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLoadingProgress];
}

uint64_t __52__CPSClipLoadingView_setLoadingProgress_completion___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)finishLoadingWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double loadingProgress = self->_loadingProgress;
    int64_t progressChangeAnimationCount = self->_progressChangeAnimationCount;
    *(_DWORD *)buf = 134218240;
    double v31 = loadingProgress;
    __int16 v32 = 2048;
    int64_t v33 = progressChangeAnimationCount;
    _os_log_impl(&dword_1D8589000, v5, OS_LOG_TYPE_DEFAULT, "Requested to finish the loading animation with current progress %f and animation count %ld.", buf, 0x16u);
  }
  if (self->_loadingProgress >= 1.0)
  {
    if (self->_progressChangeAnimationCount)
    {
      if (!self->_deferredActions)
      {
        objc_initWeak((id *)buf, self);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __50__CPSClipLoadingView_finishLoadingWithCompletion___block_invoke_2;
        v24[3] = &unk_1E6AE9488;
        objc_copyWeak(&v26, (id *)buf);
        id v25 = v4;
        BOOL v9 = (void *)MEMORY[0x1D9487A30](v24);
        id deferredActions = self->_deferredActions;
        self->_id deferredActions = v9;

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      double v11 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D8589000, v11, OS_LOG_TYPE_DEFAULT, "Animating out the loading view.", buf, 2u);
      }
      backdropLayer = self->_backdropLayer;
      id v13 = [(CPSClipLoadingView *)self _backdropEffectRemovalAnimationForKeyPath:@"filters.luminanceCurveMap.inputAmount"];
      [(CABackdropLayer *)backdropLayer addAnimation:v13 forKey:0];

      double v14 = self->_backdropLayer;
      id v15 = [(CPSClipLoadingView *)self _backdropEffectRemovalAnimationForKeyPath:@"filters.colorSaturate.inputAmount"];
      [(CABackdropLayer *)v14 addAnimation:v15 forKey:0];

      BOOL v16 = [(UIView *)self->_labelContainerView layer];
      double v17 = [(CPSClipLoadingView *)self _basicAnimationToDecreaseOpacity];
      [v16 addAnimation:v17 forKey:0];

      BOOL v18 = [(CPSClipLoadingView *)self layer];
      double v19 = [(CPSClipLoadingView *)self _springAnimationToDecreaseOpacity];
      [v18 addAnimation:v19 forKey:0];

      double v20 = [(CPSClipLoadingView *)self _textScaleUpSpringAnimation];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __50__CPSClipLoadingView_finishLoadingWithCompletion___block_invoke_71;
      v22[3] = &unk_1E6AE94B0;
      id v23 = v4;
      objc_msgSend(v20, "cps_setDelegateWithDidStartHandler:didStopHandler:", 0, v22);
      double v21 = [(UIView *)self->_clipNameContainerView layer];
      [v21 addAnimation:v20 forKey:0];
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __50__CPSClipLoadingView_finishLoadingWithCompletion___block_invoke;
    v27[3] = &unk_1E6AE9488;
    objc_copyWeak(&v29, (id *)buf);
    id v28 = v4;
    LODWORD(v8) = 1.0;
    [(CPSClipLoadingView *)self setLoadingProgress:v27 completion:v8];

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
}

void __50__CPSClipLoadingView_finishLoadingWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained finishLoadingWithCompletion:*(void *)(a1 + 32)];
}

void __50__CPSClipLoadingView_finishLoadingWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained finishLoadingWithCompletion:*(void *)(a1 + 32)];
}

uint64_t __50__CPSClipLoadingView_finishLoadingWithCompletion___block_invoke_71(uint64_t a1)
{
  double v2 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D8589000, v2, OS_LOG_TYPE_DEFAULT, "The loading view has been animated out.", v4, 2u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_loadingIsComplete
{
  return self->_loadingProgress >= 1.0;
}

- (void)_updateLoadingProgress
{
  [(UIView *)self->_clipNameContainerView bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(CPSClipLoadingView *)self _loadingIsComplete]) {
    double v11 = 1.0;
  }
  else {
    double v11 = 0.7;
  }
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  CGFloat Height = CGRectGetHeight(v16);
  clipNameProgressView = self->_clipNameProgressView;
  double v14 = Height * (1.0 - self->_loadingProgress * v11);

  -[UIView setFrame:](clipNameProgressView, "setFrame:", v4, v14, v8, v10);
}

- (void)_startAnimationIfNeeded
{
  if (!self->_animationHasStarted && !self->_loadingHasFailed)
  {
    uint64_t v3 = [(CPSClipLoadingView *)self superview];
    if (v3)
    {
      id v7 = (id)v3;
      uint64_t v4 = [(CPSClipLoadingView *)self window];
      if (v4)
      {
        double v5 = (void *)v4;
        if ([(NSString *)self->_name length])
        {

LABEL_12:
          [(CPSClipLoadingView *)self _revealBackgroundAndLabels];
          [(CPSClipLoadingView *)self _updateConicGradientRotation];
          self->_animationHasStarted = 1;
          return;
        }
        NSUInteger v6 = [(NSString *)self->_provider length];

        if (v6) {
          goto LABEL_12;
        }
      }
      else
      {
      }
    }
  }
}

- (void)_revealBackgroundAndLabels
{
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    id v11 = [(CPSClipLoadingView *)self _animationForTranslationY:150.0];
    uint64_t v3 = [(UIView *)self->_labelContainerView layer];
    [v3 addAnimation:v11 forKey:@"labelContainerTranslationAnimation"];

    uint64_t v4 = [(CPSClipLoadingView *)self _animationForTranslationY:80.0];
    if (self->_poweredByThirdParty) {
      double v5 = &OBJC_IVAR___CPSClipLoadingView__poweredByLabel;
    }
    else {
      double v5 = &OBJC_IVAR___CPSClipLoadingView__clipNameContainerView;
    }
    id v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
    id v7 = [v6 layer];
    [v7 addAnimation:v4 forKey:@"poweredByLabelTranslationAnimation"];

    double v8 = objc_msgSend(MEMORY[0x1E4F39C90], "cps_animationForKeyPath:from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:", @"transform.scale.xy", &unk_1F3070F50, &unk_1F3070F18, 0, 0.015, 0.8, 2.0, 300.0, 50.0);
    double v9 = [(UIImageView *)self->_heroImageView layer];
    [v9 setValue:&unk_1F3070F50 forKey:@"transform.scale.xy"];

    double v10 = [(UIImageView *)self->_heroImageView layer];

    [v10 addAnimation:v8 forKey:@"heroImageScaleUpAnimation"];
  }
}

- (void)_updateConicGradientRotation
{
  if (UIAccessibilityIsReduceMotionEnabled()) {
    return;
  }
  id v7 = [(UIView *)self->_gradientView layer];
  uint64_t v3 = [v7 animationForKey:@"conicGradientRotationAnimation"];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (self->_loadingHasFailed) {
      objc_msgSend(v7, "cps_pauseAnimations");
    }
    else {
      objc_msgSend(v7, "cps_resumeAnimations");
    }
    goto LABEL_8;
  }
  if (!self->_loadingHasFailed)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F39B48], "cps_animationForKeyPath:from:to:beginAfter:duration:keepFinalFrame:", @"transform.rotation.z", 0, &unk_1F3070F60, 0, 0.0, 5.0);
    LODWORD(v5) = 2139095040;
    [v4 setRepeatCount:v5];
    id v6 = [(UIView *)self->_gradientView layer];
    [v6 addAnimation:v4 forKey:@"conicGradientRotationAnimation"];

LABEL_8:
  }
}

- (void)_showCompletionAnimation:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  double v5 = [(UIView *)self->_clipNameContainerView layer];
  id v6 = [v5 animationForKey:@"progressCompletionAnimation"];

  if (v6)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F39B48], "cps_nullAnimationWithDuration:", 1.19);
    }
    else
    {
      double v8 = (void *)MEMORY[0x1E4F39C90];
      double v9 = [NSNumber numberWithDouble:1.1];
      id v7 = objc_msgSend(v8, "cps_animationForKeyPath:from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:", @"transform.scale.xy", 0, v9, 1, 0.0, 1.19, 2.0, 1000.0, 24.0);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__CPSClipLoadingView__showCompletionAnimation___block_invoke;
    v11[3] = &unk_1E6AE94B0;
    double v12 = v4;
    objc_msgSend(v7, "cps_setDelegateWithDidStartHandler:didStopHandler:", 0, v11);
    double v10 = [(UIView *)self->_clipNameContainerView layer];
    [v10 addAnimation:v7 forKey:@"progressCompletionAnimation"];
  }
}

uint64_t __47__CPSClipLoadingView__showCompletionAnimation___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_reloadTapped:(id)a3
{
  id reloadHandler = (void (**)(void))self->_reloadHandler;
  if (reloadHandler) {
    reloadHandler[2]();
  }
}

- (id)_animationForTranslationY:(double)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F39C90];
  uint64_t v4 = [NSNumber numberWithDouble:a3];
  double v5 = objc_msgSend(v3, "cps_animationForKeyPath:from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:", @"transform.translation.y", v4, &unk_1F3070F00, 0, 0.0, 1.2, 3.0, 200.0, 300.0);

  return v5;
}

- (id)_springAnimationToDecreaseOpacity
{
  return (id)objc_msgSend(MEMORY[0x1E4F39C90], "cps_animationForKeyPath:from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:", @"opacity", 0, &unk_1F3070F00, 1, 0.0, 0.6, 3.0, 1000.0, 500.0);
}

- (id)_basicAnimationToDecreaseOpacity
{
  return (id)objc_msgSend(MEMORY[0x1E4F39B48], "cps_animationForKeyPath:from:to:beginAfter:duration:keepFinalFrame:", @"opacity", 0, &unk_1F3070F00, 1, 0.0, 0.6);
}

- (id)_backdropEffectRemovalAnimationForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F39C90], "cps_animationForKeyPath:from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:", a3, 0, &unk_1F3070F00, 1, 0.0, 0.6, 3.0, 1000.0, 500.0);
}

- (id)_textScaleUpSpringAnimation
{
  if (UIAccessibilityIsReduceMotionEnabled()) {
    objc_msgSend(MEMORY[0x1E4F39B48], "cps_nullAnimationWithDuration:", 0.8);
  }
  else {
  double v2 = objc_msgSend(MEMORY[0x1E4F39C90], "cps_animationForKeyPath:from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:", @"transform.scale.xy", 0, &unk_1F3070F70, 1, 0.0, 0.8, 2.0, 300.0, 50.0);
  }

  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)provider
{
  return self->_provider;
}

- (BOOL)isPoweredByThirdParty
{
  return self->_poweredByThirdParty;
}

- (void)setPoweredByThirdParty:(BOOL)a3
{
  self->_poweredByThirdParty = a3;
}

- (float)loadingProgress
{
  return self->_loadingProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_poweredByLabel, 0);
  objc_storeStrong((id *)&self->_labelContainerView, 0);
  objc_storeStrong((id *)&self->_heroImageView, 0);
  objc_storeStrong(&self->_deferredActions, 0);
  objc_storeStrong(&self->_reloadHandler, 0);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_clipUnavailableLabel, 0);
  objc_storeStrong((id *)&self->_errorContainerView, 0);
  objc_storeStrong((id *)&self->_clipNameProgressView, 0);
  objc_storeStrong((id *)&self->_clipNameLabel, 0);
  objc_storeStrong((id *)&self->_clipNameContainerView, 0);
  objc_storeStrong((id *)&self->_clipNameBackdropView, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end