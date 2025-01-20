@interface BPSIllustratedWatchView
- (BOOL)_shouldUseCompactWatchAsset;
- (BOOL)allowScaling;
- (BOOL)allowUpScaling;
- (BOOL)usingAgaveWatchAsset;
- (BOOL)usingAvoniaWatchAsset;
- (BOOL)usingCompactWatchAsset;
- (BOOL)usingFallbackScreen;
- (BPSIllustratedWatchView)initWithFrame:(CGRect)a3;
- (CGRect)_unscaledWatchScreenInsetGuide;
- (CGRect)watchScreenInsetGuide;
- (NSLayoutConstraint)centeredSubviewCenterXConstraint;
- (NSString)imageName;
- (NSString)imageSearchBundlePath;
- (NSString)screenImageName;
- (NSString)screenImageSearchBundleIdentifier;
- (NSValue)preferredCGSizeValue;
- (UIImageView)watchScreenImageView;
- (UIImageView)watchView;
- (double)scaledDownFactor;
- (double)scaledDownXDelta;
- (double)scaledDownYDelta;
- (id)watchAssetBundle;
- (unint64_t)screenImageSize;
- (void)_configureWatchImage;
- (void)_updateCenteredSubviewConstraints;
- (void)addSyncTrapProgressView:(id)a3;
- (void)layoutSubviews;
- (void)setAllowScaling:(BOOL)a3;
- (void)setAllowUpScaling:(BOOL)a3;
- (void)setCenteredSubviewCenterXConstraint:(id)a3;
- (void)setImageName:(id)a3;
- (void)setImageSearchBundlePath:(id)a3;
- (void)setPreferredCGSizeValue:(id)a3;
- (void)setScaledDownFactor:(double)a3;
- (void)setScaledDownXDelta:(double)a3;
- (void)setScaledDownYDelta:(double)a3;
- (void)setScreenImageName:(id)a3;
- (void)setScreenImageSearchBundleIdentifier:(id)a3;
- (void)setScreenImageSize:(unint64_t)a3;
- (void)setUsingAgaveWatchAsset:(BOOL)a3;
- (void)setUsingAvoniaWatchAsset:(BOOL)a3;
- (void)setUsingCompactWatchAsset:(BOOL)a3;
- (void)setUsingFallbackScreen:(BOOL)a3;
- (void)setWatchScreenImageView:(id)a3;
- (void)setWatchView:(id)a3;
- (void)textSizeDidChange:(id)a3;
@end

@implementation BPSIllustratedWatchView

- (BPSIllustratedWatchView)initWithFrame:(CGRect)a3
{
  v40[4] = *MEMORY[0x263EF8340];
  v39.receiver = self;
  v39.super_class = (Class)BPSIllustratedWatchView;
  v3 = -[BPSIllustratedWatchView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_usingCompactWatchAsset = [(BPSIllustratedWatchView *)v3 _shouldUseCompactWatchAsset];
    uint64_t v5 = BPSGetActiveSetupCompletedDevice();
    v6 = +[BPSBridgeAppContext shared];
    char v7 = [v6 inWatchSetupFlow];

    v37 = (void *)v5;
    if ((v7 & 1) != 0 || !v5)
    {
      v9 = [MEMORY[0x263F5B978] sharedDeviceController];
      uint64_t v8 = [v9 size];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263F5B978] sizeFromDevice:v5];
    }
    v4->_usingAgaveWatchAsset = v8 == 19;
    v4->_usingAvoniaWatchAsset = (v8 & 0xFFFFFFFFFFFFFFFELL) == 20;
    if (PSIsInternalInstall())
    {
      v10 = (void *)CFPreferencesCopyAppValue(@"DebugIdealAssetOverride", @"com.apple.Bridge");
      v11 = (void *)CFPreferencesCopyAppValue(@"DebugIdealAssetOverrideModifier", @"com.apple.Bridge");
      v12 = v11;
      if (v11 && ![v11 caseInsensitiveCompare:@"compact"])
      {
        v4->_usingCompactWatchAsset = 1;
        v13 = bps_setup_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C513000, v13, OS_LOG_TYPE_DEFAULT, "Forcing Compact", buf, 2u);
        }
      }
      if (v10)
      {
        if (![v10 caseInsensitiveCompare:@"aloe"])
        {
          v4->_usingAgaveWatchAsset = 0;
          v4->_usingAvoniaWatchAsset = 0;
          v14 = bps_setup_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21C513000, v14, OS_LOG_TYPE_DEFAULT, "Forcing Aloe", buf, 2u);
          }
        }
        if (![v10 caseInsensitiveCompare:@"agave"])
        {
          v4->_usingAgaveWatchAsset = 1;
          v4->_usingAvoniaWatchAsset = 0;
          v15 = bps_setup_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21C513000, v15, OS_LOG_TYPE_DEFAULT, "Forcing Agave", buf, 2u);
          }
        }
        if (![v10 caseInsensitiveCompare:@"avonia"])
        {
          v4->_usingAgaveWatchAsset = 0;
          v4->_usingAvoniaWatchAsset = 1;
          v16 = bps_setup_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21C513000, v16, OS_LOG_TYPE_DEFAULT, "Forcing Avonia", buf, 2u);
          }
        }
      }
    }
    v17 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    watchView = v4->_watchView;
    v4->_watchView = v17;

    [(BPSIllustratedWatchView *)v4 _configureWatchImage];
    [(BPSIllustratedWatchView *)v4 addSubview:v4->_watchView];
    v19 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    watchScreenImageView = v4->_watchScreenImageView;
    v4->_watchScreenImageView = v19;

    [(UIImageView *)v4->_watchView addSubview:v4->_watchScreenImageView];
    v32 = (void *)MEMORY[0x263F08938];
    v36 = [(BPSIllustratedWatchView *)v4 topAnchor];
    v35 = [(UIImageView *)v4->_watchView topAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v40[0] = v34;
    v33 = [(BPSIllustratedWatchView *)v4 leadingAnchor];
    v21 = [(UIImageView *)v4->_watchView leadingAnchor];
    v22 = [v33 constraintEqualToAnchor:v21];
    v40[1] = v22;
    v23 = [(BPSIllustratedWatchView *)v4 trailingAnchor];
    v24 = [(UIImageView *)v4->_watchView trailingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v40[2] = v25;
    v26 = [(BPSIllustratedWatchView *)v4 bottomAnchor];
    v27 = [(UIImageView *)v4->_watchView bottomAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v40[3] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
    [v32 activateConstraints:v29];

    v4->_allowScaling = 0;
    v30 = [MEMORY[0x263F08A00] defaultCenter];
    [v30 addObserver:v4 selector:sel_textSizeDidChange_ name:*MEMORY[0x263F1D158] object:0];
  }
  return v4;
}

- (void)_configureWatchImage
{
  if (self->_usingAgaveWatchAsset)
  {
    if (self->_usingCompactWatchAsset) {
      v3 = @"watch-ideal-compact-agave";
    }
    else {
      v3 = @"watch-ideal-agave";
    }
  }
  else
  {
    v4 = @"watch-ideal-compact-aloe";
    if (!self->_usingCompactWatchAsset) {
      v4 = @"watch-ideal-aloe";
    }
    uint64_t v5 = @"watch-ideal-avonia";
    if (self->_usingCompactWatchAsset) {
      uint64_t v5 = @"watch-ideal-compact-avonia";
    }
    if (self->_usingAvoniaWatchAsset) {
      v3 = v5;
    }
    else {
      v3 = v4;
    }
  }
  v6 = (void *)MEMORY[0x263F1C6B0];
  char v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v6 imageNamed:v3 inBundle:v7 withConfiguration:0];

  [(UIImageView *)self->_watchView setImage:v8];
  [(BPSIllustratedWatchView *)self setNeedsLayout];
}

- (BOOL)_shouldUseCompactWatchAsset
{
  v2 = [(id)*MEMORY[0x263F1D020] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (void)textSizeDidChange:(id)a3
{
  BOOL v4 = [(BPSIllustratedWatchView *)self _shouldUseCompactWatchAsset];
  [(BPSIllustratedWatchView *)self setUsingCompactWatchAsset:v4];
}

- (void)setUsingCompactWatchAsset:(BOOL)a3
{
  self->_usingCompactWatchAsset = a3;
  [(BPSIllustratedWatchView *)self _updateCenteredSubviewConstraints];
  [(BPSIllustratedWatchView *)self _configureWatchImage];
}

- (void)setScreenImageName:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (NSString *)[v4 copy];
  screenImageName = self->_screenImageName;
  self->_screenImageName = v5;

  if (![(NSString *)self->_screenImageName length])
  {
    [(UIImageView *)self->_watchScreenImageView setImage:0];
    goto LABEL_31;
  }
  self->_screenImageSize = 13;
  if (self->_usingAgaveWatchAsset)
  {
    unint64_t v7 = 19;
  }
  else
  {
    if (!self->_usingAvoniaWatchAsset) {
      goto LABEL_8;
    }
    unint64_t v7 = 21;
  }
  self->_screenImageSize = v7;
LABEL_8:
  id v8 = objc_msgSend(MEMORY[0x263F5B978], "resourceString:material:size:forAttributes:", self->_screenImageName, 0);
  if (!self->_screenImageSearchBundleIdentifier
    || (objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:"),
        (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = [(BPSIllustratedWatchView *)self watchAssetBundle];
  }
  uint64_t v10 = [MEMORY[0x263F1C6B0] imageNamed:v8 inBundle:v9 compatibleWithTraitCollection:0];
  v11 = (void *)v10;
  if (self->_usingAgaveWatchAsset && !v10)
  {
    self->_screenImageSize = 13;
    v12 = [MEMORY[0x263F5B978] resourceString:self->_screenImageName material:0 size:13 forAttributes:4];

    v11 = [MEMORY[0x263F1C6B0] imageNamed:v12 inBundle:v9 compatibleWithTraitCollection:0];
    v13 = bps_setup_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      v24 = v12;
      _os_log_impl(&dword_21C513000, v13, OS_LOG_TYPE_DEFAULT, "Agave image doesn't exist, using aloe image for: %@", (uint8_t *)&v23, 0xCu);
    }

    if (v11) {
      goto LABEL_16;
    }
LABEL_18:
    self->_usingFallbackScreen = 1;
    self->_screenImageSize = 7;
    v14 = [MEMORY[0x263F5B978] resourceString:self->_screenImageName material:0 size:7 forAttributes:4];

    v11 = [MEMORY[0x263F1C6B0] imageNamed:v14 inBundle:v9 compatibleWithTraitCollection:0];
    v15 = bps_setup_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      v24 = v14;
      _os_log_impl(&dword_21C513000, v15, OS_LOG_TYPE_DEFAULT, "Aloe image doesn't exist, using luxo image for: %@", (uint8_t *)&v23, 0xCu);
    }

    goto LABEL_21;
  }
  v12 = (NSString *)v8;
  if (!v10) {
    goto LABEL_18;
  }
LABEL_16:
  v14 = v12;
LABEL_21:
  v16 = bps_setup_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    v24 = v14;
    _os_log_impl(&dword_21C513000, v16, OS_LOG_TYPE_DEFAULT, "Original ImageName: %@", (uint8_t *)&v23, 0xCu);
  }

  v17 = bps_setup_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    v24 = (NSString *)v4;
    _os_log_impl(&dword_21C513000, v17, OS_LOG_TYPE_DEFAULT, "Resolved ImageName: %@", (uint8_t *)&v23, 0xCu);
  }

  if (!v11)
  {
    v18 = bps_setup_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21C513000, v18, OS_LOG_TYPE_DEFAULT, "Did not resolve to valid screen image!", (uint8_t *)&v23, 2u);
    }
  }
  [(UIImageView *)self->_watchScreenImageView setImage:v11];
  imageName = self->_imageName;
  self->_imageName = v14;
  v20 = v14;

  v21 = [v9 bundlePath];
  imageSearchBundlePath = self->_imageSearchBundlePath;
  self->_imageSearchBundlePath = v21;

  [(BPSIllustratedWatchView *)self setNeedsLayout];
LABEL_31:
}

- (id)watchAssetBundle
{
  return (id)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Bridge"];
}

- (void)layoutSubviews
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v49.receiver = self;
  v49.super_class = (Class)BPSIllustratedWatchView;
  [(BPSIllustratedWatchView *)&v49 layoutSubviews];
  if (self->_usingAgaveWatchAsset) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.92;
  }
  id v4 = [(UIImageView *)self->_watchView image];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  memset(&v48, 0, sizeof(v48));
  CGAffineTransformMakeScale(&v48, v3, v3);
  double v9 = v8 * v48.c + v48.a * v6;
  double v10 = v8 * v48.d + v48.b * v6;
  [(BPSIllustratedWatchView *)self _unscaledWatchScreenInsetGuide];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  -[UIImageView sizeThatFits:](self->_watchScreenImageView, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  if (self->_allowScaling)
  {
    [(BPSIllustratedWatchView *)self frame];
    if (v19 < v9 || ([(BPSIllustratedWatchView *)self frame], v20 < v10))
    {
      [(BPSIllustratedWatchView *)self frame];
      double v22 = v21 / v9;
      [(BPSIllustratedWatchView *)self frame];
      double v24 = fmin(v22, v23 / v10);
      self->_scaledDownFactor = v24;
      memset(&v50, 0, sizeof(v50));
      CGAffineTransformMakeScale(&v50, v24, v24);
      CGAffineTransform v47 = v50;
      v52.origin.CGFloat x = 0.0;
      v52.origin.CGFloat y = 0.0;
      v52.size.double width = v9;
      v52.size.double height = v10;
      CGRect v53 = CGRectApplyAffineTransform(v52, &v47);
      CGFloat x = v53.origin.x;
      CGFloat y = v53.origin.y;
      double width = v53.size.width;
      double height = v53.size.height;
      CGAffineTransform v47 = v50;
      v53.origin.CGFloat x = v12;
      v53.origin.CGFloat y = v14;
      v53.size.double width = v16;
      v53.size.double height = v18;
      CGRect v54 = CGRectApplyAffineTransform(v53, &v47);
      CGFloat v45 = v54.origin.x;
      double v14 = v54.origin.y;
      double v16 = v54.size.width;
      double v18 = v54.size.height;
      [(BPSIllustratedWatchView *)self frame];
      self->_scaledDownXDelta = (v29 - width) * 0.5;
      [(BPSIllustratedWatchView *)self frame];
      double v31 = (v30 - height) * 0.5;
      self->_scaledDownYDelta = v31;
      memset(&v47, 0, sizeof(v47));
      CGAffineTransformMakeTranslation(&v47, self->_scaledDownXDelta, v31);
      CGAffineTransform v46 = v47;
      v55.origin.CGFloat x = x;
      v55.origin.CGFloat y = y;
      v55.size.double width = width;
      v55.size.double height = height;
      CGRect v56 = CGRectApplyAffineTransform(v55, &v46);
      double v32 = v56.origin.x;
      double v33 = v56.origin.y;
      double v9 = v56.size.width;
      double v10 = v56.size.height;
      CGAffineTransform v46 = v47;
      v34 = &v46;
      CGFloat v35 = v45;
LABEL_17:
      double v40 = v14;
      double v41 = v16;
      double v42 = v18;
      CGRect v59 = CGRectApplyAffineTransform(*(CGRect *)&v35, v34);
      double v12 = v59.origin.x;
      double v14 = v59.origin.y;
      double v16 = v59.size.width;
      double v18 = v59.size.height;
      goto LABEL_19;
    }
  }
  preferredCGSizeValue = self->_preferredCGSizeValue;
  if (preferredCGSizeValue)
  {
    [(NSValue *)preferredCGSizeValue CGSizeValue];
    if (v37 >= 2.22044605e-16)
    {
      if (v38 < 2.22044605e-16) {
        double v38 = v10 * v37 / v9;
      }
    }
    else
    {
      double v37 = v9 * v38 / v10;
    }
    double v39 = fmin(v37 / v9, v38 / v10);
    self->_scaledDownFactor = v39;
    if (v39 < 1.0 || self->_allowUpScaling)
    {
      memset(&v50, 0, sizeof(v50));
      CGAffineTransformMakeScale(&v50, v39, v39);
      CGAffineTransform v47 = v50;
      v57.origin.CGFloat x = 0.0;
      v57.origin.CGFloat y = 0.0;
      v57.size.double width = v9;
      v57.size.double height = v10;
      CGRect v58 = CGRectApplyAffineTransform(v57, &v47);
      double v32 = v58.origin.x;
      double v33 = v58.origin.y;
      double v9 = v58.size.width;
      double v10 = v58.size.height;
      CGAffineTransform v47 = v50;
      v34 = &v47;
      CGFloat v35 = v12;
      goto LABEL_17;
    }
  }
  else
  {
    self->_scaledDownFactor = 0.0;
    self->_scaledDownXDelta = 0.0;
    self->_scaledDownYDelta = 0.0;
  }
  double v33 = 0.0;
  double v32 = 0.0;
LABEL_19:
  v43 = bps_setup_log();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v60.origin.CGFloat x = v12;
    v60.origin.CGFloat y = v14;
    v60.size.double width = v16;
    v60.size.double height = v18;
    v44 = NSStringFromCGRect(v60);
    LODWORD(v50.a) = 138412290;
    *(void *)((char *)&v50.a + 4) = v44;
    _os_log_impl(&dword_21C513000, v43, OS_LOG_TYPE_DEFAULT, "watchScreenViewFrame: %@", (uint8_t *)&v50, 0xCu);
  }
  -[UIImageView setFrame:](self->_watchView, "setFrame:", v32, v33, v9, v10);
  -[UIImageView setFrame:](self->_watchScreenImageView, "setFrame:", v12, v14, v16, v18);
}

- (CGRect)_unscaledWatchScreenInsetGuide
{
  double v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 scale];
  double v5 = v4;

  if (self->_usingCompactWatchAsset)
  {
    if (self->_usingAgaveWatchAsset)
    {
      double v6 = 21.0;
      double v7 = 156.5;
      double v8 = 128.0;
LABEL_6:
      double v9 = 36.0;
      goto LABEL_15;
    }
    double v6 = 29.0;
    if (self->_usingAvoniaWatchAsset) {
      double v6 = 10.0;
    }
    double v9 = 41.0;
    if (self->_usingAvoniaWatchAsset) {
      double v9 = 11.0;
    }
    double v7 = dbl_21C53D8D0[!self->_usingAvoniaWatchAsset];
    double v8 = dbl_21C53D8E0[!self->_usingAvoniaWatchAsset];
  }
  else
  {
    if (self->_usingAgaveWatchAsset)
    {
      double v7 = 156.5;
      double v8 = 128.0;
      double v6 = 76.0;
      goto LABEL_6;
    }
    double v10 = 1.0 / v5;
    if (self->_usingAvoniaWatchAsset)
    {
      double v9 = v10 + 11.0;
      double v7 = 133.0;
      double v8 = 111.0;
      double v6 = 50.0;
    }
    else
    {
      double v9 = v10 + 12.0;
      double v7 = 126.0;
      double v8 = 103.0;
      double v6 = 83.0;
    }
  }
LABEL_15:
  result.size.double height = v7;
  result.size.double width = v8;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGRect)watchScreenInsetGuide
{
  [(BPSIllustratedWatchView *)self _unscaledWatchScreenInsetGuide];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double scaledDownFactor = self->_scaledDownFactor;
  if (scaledDownFactor > 0.0)
  {
    memset(&v22, 0, sizeof(v22));
    CGAffineTransformMakeScale(&v22, scaledDownFactor, scaledDownFactor);
    CGAffineTransform v21 = v22;
    v23.origin.CGFloat x = v4;
    v23.origin.CGFloat y = v6;
    v23.size.CGFloat width = v8;
    v23.size.CGFloat height = v10;
    CGRect v24 = CGRectApplyAffineTransform(v23, &v21);
    CGFloat x = v24.origin.x;
    CGFloat y = v24.origin.y;
    CGFloat width = v24.size.width;
    CGFloat height = v24.size.height;
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeTranslation(&v21, self->_scaledDownXDelta, self->_scaledDownYDelta);
    CGAffineTransform v20 = v21;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    CGRect v26 = CGRectApplyAffineTransform(v25, &v20);
    CGFloat v4 = v26.origin.x;
    CGFloat v6 = v26.origin.y;
    CGFloat v8 = v26.size.width;
    CGFloat v10 = v26.size.height;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)addSyncTrapProgressView:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_centeredSubviewCenterXConstraint)
  {
    double v5 = bps_setup_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v15 = 0;
      _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, "Only one sync trap progress view is supported.", v15, 2u);
    }
  }
  else
  {
    CGFloat v6 = [(BPSIllustratedWatchView *)self watchView];
    [v6 addSubview:v4];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v7 = [(BPSIllustratedWatchView *)self centerXAnchor];
    CGFloat v8 = [v4 centerXAnchor];
    double v9 = [v7 constraintEqualToAnchor:v8];
    centeredSubviewCenterXConstraint = self->_centeredSubviewCenterXConstraint;
    self->_centeredSubviewCenterXConstraint = v9;

    [(BPSIllustratedWatchView *)self _updateCenteredSubviewConstraints];
    double v11 = (void *)MEMORY[0x263F08938];
    v16[0] = self->_centeredSubviewCenterXConstraint;
    double v5 = [(BPSIllustratedWatchView *)self centerYAnchor];
    double v12 = [v4 centerYAnchor];
    double v13 = [v5 constraintEqualToAnchor:v12];
    v16[1] = v13;
    double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    [v11 activateConstraints:v14];
  }
}

- (void)_updateCenteredSubviewConstraints
{
  double v2 = 0.0;
  if (!self->_usingCompactWatchAsset && !self->_usingAgaveWatchAsset) {
    double v2 = 3.0;
  }
  [(NSLayoutConstraint *)self->_centeredSubviewCenterXConstraint setConstant:v2];
}

- (NSString)screenImageSearchBundleIdentifier
{
  return self->_screenImageSearchBundleIdentifier;
}

- (void)setScreenImageSearchBundleIdentifier:(id)a3
{
}

- (NSString)screenImageName
{
  return self->_screenImageName;
}

- (BOOL)allowScaling
{
  return self->_allowScaling;
}

- (void)setAllowScaling:(BOOL)a3
{
  self->_allowScaling = a3;
}

- (NSValue)preferredCGSizeValue
{
  return self->_preferredCGSizeValue;
}

- (void)setPreferredCGSizeValue:(id)a3
{
}

- (UIImageView)watchScreenImageView
{
  return self->_watchScreenImageView;
}

- (void)setWatchScreenImageView:(id)a3
{
}

- (UIImageView)watchView
{
  return self->_watchView;
}

- (void)setWatchView:(id)a3
{
}

- (double)scaledDownFactor
{
  return self->_scaledDownFactor;
}

- (void)setScaledDownFactor:(double)a3
{
  self->_double scaledDownFactor = a3;
}

- (double)scaledDownXDelta
{
  return self->_scaledDownXDelta;
}

- (void)setScaledDownXDelta:(double)a3
{
  self->_scaledDownXDelta = a3;
}

- (double)scaledDownYDelta
{
  return self->_scaledDownYDelta;
}

- (void)setScaledDownYDelta:(double)a3
{
  self->_scaledDownYDelta = a3;
}

- (unint64_t)screenImageSize
{
  return self->_screenImageSize;
}

- (void)setScreenImageSize:(unint64_t)a3
{
  self->_screenImageSize = a3;
}

- (BOOL)usingCompactWatchAsset
{
  return self->_usingCompactWatchAsset;
}

- (BOOL)usingAgaveWatchAsset
{
  return self->_usingAgaveWatchAsset;
}

- (void)setUsingAgaveWatchAsset:(BOOL)a3
{
  self->_usingAgaveWatchAsset = a3;
}

- (BOOL)usingAvoniaWatchAsset
{
  return self->_usingAvoniaWatchAsset;
}

- (void)setUsingAvoniaWatchAsset:(BOOL)a3
{
  self->_usingAvoniaWatchAsset = a3;
}

- (NSLayoutConstraint)centeredSubviewCenterXConstraint
{
  return self->_centeredSubviewCenterXConstraint;
}

- (void)setCenteredSubviewCenterXConstraint:(id)a3
{
}

- (NSString)imageSearchBundlePath
{
  return self->_imageSearchBundlePath;
}

- (void)setImageSearchBundlePath:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (BOOL)allowUpScaling
{
  return self->_allowUpScaling;
}

- (void)setAllowUpScaling:(BOOL)a3
{
  self->_allowUpScaling = a3;
}

- (BOOL)usingFallbackScreen
{
  return self->_usingFallbackScreen;
}

- (void)setUsingFallbackScreen:(BOOL)a3
{
  self->_usingFallbackScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_imageSearchBundlePath, 0);
  objc_storeStrong((id *)&self->_centeredSubviewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
  objc_storeStrong((id *)&self->_watchScreenImageView, 0);
  objc_storeStrong((id *)&self->_preferredCGSizeValue, 0);
  objc_storeStrong((id *)&self->_screenImageName, 0);
  objc_storeStrong((id *)&self->_screenImageSearchBundleIdentifier, 0);
}

@end