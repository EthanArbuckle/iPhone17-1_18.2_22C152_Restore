@interface CAMControlStatusIndicator
+ (NSNumberFormatter)decimalFormatter;
+ (NSNumberFormatter)integerFormatter;
+ (id)_createStretchableCircleImageFilled:(BOOL)a3 scale:(double)a4;
+ (id)stretchableCircleImageFilled:(BOOL)a3 scale:(double)a4;
- (BOOL)_needsUpdateValueText;
- (BOOL)canShowValue;
- (BOOL)isShowingValue;
- (BOOL)shouldFillOutlineForCurrentState;
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseOutline;
- (BOOL)shouldUseSlash;
- (BOOL)supportsOrientations;
- (CAMControlStatusIndicator)initWithFrame:(CGRect)a3;
- (CAMControlStatusIndicatorDelegate)delegate;
- (CAMSlashMaskView)_slashMaskView;
- (CAMSlashView)_slashView;
- (CGSize)_valueLabelSize;
- (CGSize)intrinsicContentSize;
- (CGVector)imageOffset;
- (UIImageSymbolConfiguration)imageSymbolColorConfiguration;
- (UIImageView)_imageView;
- (UIImageView)_outlineView;
- (UILabel)_valueLabel;
- (UIView)_slashMaskContainer;
- (double)_additionalWidthForValue;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (id)imageForAXHUD;
- (id)imageForCurrentState;
- (id)imageNameForCurrentState;
- (id)valueText;
- (int64_t)orientation;
- (unint64_t)controlStatusType;
- (unint64_t)customPointSizeForImageSymbol;
- (void)_setNeedsUpdateValueText:(BOOL)a3;
- (void)_setValueLabelSize:(CGSize)a3;
- (void)_updateImageOrientationAnimated:(BOOL)a3;
- (void)_updateSlashAnimated:(BOOL)a3;
- (void)_updateValueLabelVisibilityAnimated:(BOOL)a3;
- (void)_updateValueText;
- (void)layoutSubviews;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)setControlStatusType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsUpdateValueText;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setShowingValue:(BOOL)a3;
- (void)setShowingValue:(BOOL)a3 animated:(BOOL)a4;
- (void)set_imageView:(id)a3;
- (void)updateImage;
- (void)updateImageAnimated:(BOOL)a3;
@end

@implementation CAMControlStatusIndicator

+ (NSNumberFormatter)decimalFormatter
{
  if (decimalFormatter_onceToken != -1) {
    dispatch_once(&decimalFormatter_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)decimalFormatter___decimalFormatter;
  return (NSNumberFormatter *)v2;
}

void __45__CAMControlStatusIndicator_decimalFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)decimalFormatter___decimalFormatter;
  decimalFormatter___decimalFormatter = (uint64_t)v0;

  [(id)decimalFormatter___decimalFormatter setPositiveFormat:@"0.0"];
  v2 = [(id)decimalFormatter___decimalFormatter stringFromNumber:&unk_26BDDF328];
  int v3 = [v2 isEqualToString:@"4,5"];

  if (v3)
  {
    v4 = (void *)decimalFormatter___decimalFormatter;
    [v4 setDecimalSeparator:@"."];
  }
}

+ (NSNumberFormatter)integerFormatter
{
  if (integerFormatter_onceToken != -1) {
    dispatch_once(&integerFormatter_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)integerFormatter___integerFormatter;
  return (NSNumberFormatter *)v2;
}

uint64_t __45__CAMControlStatusIndicator_integerFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)integerFormatter___integerFormatter;
  integerFormatter___integerFormatter = (uint64_t)v0;

  v2 = (void *)integerFormatter___integerFormatter;
  return [v2 setPositiveFormat:@"0"];
}

+ (id)stretchableCircleImageFilled:(BOOL)a3 scale:(double)a4
{
  BOOL v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v7 = @"NO";
  if (v5) {
    v7 = @"YES";
  }
  v8 = [NSString stringWithFormat:@"filled=%@ scale=%f", v7, *(void *)&a4];
  if (stretchableCircleImageFilled_scale__onceToken != -1) {
    dispatch_once(&stretchableCircleImageFilled_scale__onceToken, &__block_literal_global_18);
  }
  v9 = [(id)stretchableCircleImageFilled_scale__cachedCircleImages objectForKeyedSubscript:v8];

  if (v9)
  {
    v10 = [(id)stretchableCircleImageFilled_scale__cachedCircleImages objectForKeyedSubscript:v8];
  }
  else
  {
    v10 = [a1 _createStretchableCircleImageFilled:v5 scale:a4];
    [(id)stretchableCircleImageFilled_scale__cachedCircleImages setObject:v10 forKeyedSubscript:v8];
  }

  return v10;
}

uint64_t __64__CAMControlStatusIndicator_stretchableCircleImageFilled_scale___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v1 = stretchableCircleImageFilled_scale__cachedCircleImages;
  stretchableCircleImageFilled_scale__cachedCircleImages = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)_createStretchableCircleImageFilled:(BOOL)a3 scale:(double)a4
{
  BOOL v5 = a3;
  CGFloat v6 = 3.0 / a4 * 0.5;
  double v7 = v6 * 2.0 + 24.0;
  v24.origin.CGFloat x = 0.0;
  v24.origin.CGFloat y = 0.0;
  v24.size.CGFloat width = v7;
  v24.size.CGFloat height = v7;
  CGRect v25 = CGRectInset(v24, v6, v6);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  v25.origin.CGFloat x = v7;
  v25.origin.CGFloat y = v7;
  UIGraphicsBeginImageContextWithOptions((CGSize)v25.origin, 0, a4);
  CurrentContext = UIGraphicsGetCurrentContext();
  v13 = [MEMORY[0x263F825C8] whiteColor];
  [v13 setFill];

  v14 = [MEMORY[0x263F825C8] whiteColor];
  [v14 setStroke];

  CGFloat v15 = x;
  CGFloat v16 = y;
  CGFloat v17 = width;
  CGFloat v18 = height;
  if (v5) {
    CGContextFillEllipseInRect(CurrentContext, *(CGRect *)&v15);
  }
  else {
    CGContextStrokeEllipseInRect(CurrentContext, *(CGRect *)&v15);
  }
  v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v20 = objc_msgSend(v19, "resizableImageWithCapInsets:", 0.0, v7 * 0.5, 0.0, v7 * 0.5);

  v21 = [v20 imageWithRenderingMode:2];

  return v21;
}

- (CAMControlStatusIndicator)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)CAMControlStatusIndicator;
  int v3 = -[CAMControlStatusIndicator initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    BOOL v5 = v3;
    CGFloat v6 = v5;
    if ([(CAMControlStatusIndicator *)v5 shouldUseSlash])
    {
      double v7 = objc_alloc_init(CAMSlashView);
      slashView = v5->__slashView;
      v5->__slashView = v7;

      v9 = [MEMORY[0x263F825C8] whiteColor];
      [(CAMSlashView *)v5->__slashView setTintColor:v9];

      [(CAMControlStatusIndicator *)v5 addSubview:v5->__slashView];
      v10 = objc_alloc_init(CAMSlashMaskView);
      slashMaskView = v5->__slashMaskView;
      v5->__slashMaskView = v10;

      v12 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      slashMaskContainer = v5->__slashMaskContainer;
      v5->__slashMaskContainer = v12;

      [(UIView *)v5->__slashMaskContainer setUserInteractionEnabled:0];
      [(CAMControlStatusIndicator *)v5 addSubview:v5->__slashMaskContainer];
      CGFloat v6 = v5->__slashMaskContainer;
    }
    if ([(CAMControlStatusIndicator *)v5 shouldUseOutline])
    {
      id v14 = objc_alloc(MEMORY[0x263F82828]);
      CGFloat v15 = objc_opt_class();
      CGFloat v16 = [(CAMControlStatusIndicator *)v5 traitCollection];
      [v16 displayScale];
      CGFloat v17 = objc_msgSend(v15, "stretchableCircleImageFilled:scale:", 0);
      uint64_t v18 = [v14 initWithImage:v17];
      outlineView = v5->__outlineView;
      v5->__outlineView = (UIImageView *)v18;

      [(CAMControlStatusIndicator *)v6 addSubview:v5->__outlineView];
    }
    if ([(CAMControlStatusIndicator *)v5 canShowValue])
    {
      v20 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
      valueLabel = v5->__valueLabel;
      v5->__valueLabel = v20;

      v22 = [MEMORY[0x263F825C8] whiteColor];
      [(UILabel *)v5->__valueLabel setTextColor:v22];

      v23 = +[CAMCaptureCapabilities capabilities];
      [v23 sfCameraFontSupported];

      CGRect v24 = CEKMonospacedStylisticNumeralFontOfSizeAndStyle();
      [(UILabel *)v5->__valueLabel setFont:v24];

      [(CAMControlStatusIndicator *)v6 addSubview:v5->__valueLabel];
      [(CAMControlStatusIndicator *)v5 _updateValueLabelVisibilityAnimated:0];
      [(CAMControlStatusIndicator *)v5 _setNeedsUpdateValueText:1];
    }
    if (v5->__slashMaskView)
    {
      CGRect v25 = v5->__slashMaskContainer;
      if (v25) {
        -[UIView setMaskView:](v25, "setMaskView:");
      }
    }
    [(CAMControlStatusIndicator *)v5 updateImage];
    [(CAMControlStatusIndicator *)v5 setExclusiveTouch:1];
  }
  return v4;
}

- (void)layoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)CAMControlStatusIndicator;
  [(CAMControlStatusIndicator *)&v53 layoutSubviews];
  [(CAMControlStatusIndicator *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CAMControlStatusIndicator *)self _imageView];
  v12 = [(CAMControlStatusIndicator *)self _outlineView];
  v13 = [(CAMControlStatusIndicator *)self _valueLabel];
  id v14 = [(CAMControlStatusIndicator *)self _slashMaskContainer];
  objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);

  double v51 = v6;
  double v52 = v4;
  double v49 = v10;
  double v50 = v8;
  -[CAMControlStatusIndicator alignmentRectForFrame:](self, "alignmentRectForFrame:", v4, v6, v8, v10);
  UIRectGetCenter();
  CGFloat v15 = (double *)MEMORY[0x263F00148];
  if (v11)
  {
    [(CAMControlStatusIndicator *)self imageOffset];
    if (v17 == 0.0 && v16 == 0.0 && [(CAMControlStatusIndicator *)self isShowingValue]) {
      [(CAMControlStatusIndicator *)self _additionalWidthForValue];
    }
    double v18 = *v15;
    double v19 = v15[1];
    [v11 intrinsicContentSize];
    objc_msgSend(v11, "frameForAlignmentRect:", v18, v19, v20, v21);
    double v23 = v22;
    double v25 = v24;
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v11, "setCenter:");
    objc_msgSend(v11, "setBounds:", v18, v19, v23, v25);
  }
  if (v12)
  {
    double v26 = *v15;
    double v27 = v15[1];
    [(CAMControlStatusIndicator *)self intrinsicContentSize];
    double v29 = v28;
    double v31 = v30;
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v12, "setCenter:");
    objc_msgSend(v12, "setBounds:", v26, v27, v29, v31);
  }
  if (v13)
  {
    double v32 = *MEMORY[0x263F001A8];
    double v33 = *(double *)(MEMORY[0x263F001A8] + 8);
    [(CAMControlStatusIndicator *)self _valueLabelSize];
    double v48 = v34;
    double v47 = v35;
    UIRectCenteredYInRectScale();
    if ([(CAMControlStatusIndicator *)self isShowingValue])
    {
      [v12 frame];
      CGRectGetMaxX(v54);
      [(CAMControlStatusIndicator *)self _additionalWidthForValue];
    }
    else
    {
      uint64_t v46 = 0;
      UIRectCenteredXInRectScale();
    }
    UIRectGetCenter();
    objc_msgSend(v13, "setCenter:");
    objc_msgSend(v13, "setBounds:", v32, v33, v48, v47);
  }
  if ([(CAMControlStatusIndicator *)self shouldUseSlash])
  {
    if (v11) {
      [v11 frame];
    }
    else {
      [(CAMControlStatusIndicator *)self bounds];
    }
    UIRectCenteredIntegralRectScale();
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    v44 = [(CAMControlStatusIndicator *)self _slashView];
    objc_msgSend(v44, "setFrame:", v37, v39, v41, v43);

    v45 = [(CAMControlStatusIndicator *)self _slashMaskView];
    objc_msgSend(v45, "setFrame:", v52, v51, v50, v49);

    [(CAMControlStatusIndicator *)self _updateSlashAnimated:0];
  }
}

- (double)_additionalWidthForValue
{
  [(CAMControlStatusIndicator *)self _valueLabelSize];
  return v2 + 4.0 + 4.0;
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(CAMControlStatusIndicator *)self _outlineView];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(CAMControlStatusIndicator *)self _imageView];
  double v9 = [v8 image];
  [v9 size];
  double v11 = v10;
  double v13 = v12;

  if (!v3)
  {
    double v7 = v13;
    double v5 = v11;
  }
  if ([(CAMControlStatusIndicator *)self isShowingValue])
  {
    [(CAMControlStatusIndicator *)self _additionalWidthForValue];
    double v5 = v5 + v14;
  }

  double v15 = v5;
  double v16 = v7;
  result.CGFloat height = v16;
  result.CGFloat width = v15;
  return result;
}

- (void)updateImage
{
}

- (void)updateImageAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  id v27 = [(CAMControlStatusIndicator *)self imageForCurrentState];
  if (v27)
  {
    id v5 = [(CAMControlStatusIndicator *)self _imageView];
    double v6 = [(CAMControlStatusIndicator *)self _outlineView];
    if (!v5)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F82828]);
      uint64_t v7 = [(CAMControlStatusIndicator *)self _slashMaskContainer];
      double v8 = (void *)v7;
      if (v7) {
        double v9 = (CAMControlStatusIndicator *)v7;
      }
      else {
        double v9 = self;
      }
      double v10 = v9;

      [(CAMControlStatusIndicator *)v10 addSubview:v5];
      [(CAMControlStatusIndicator *)self set_imageView:v5];
    }
    [v5 setImage:v27];
    [(CAMControlStatusIndicator *)self setNeedsLayout];
    BOOL v11 = [(CAMControlStatusIndicator *)self shouldUseActiveTintForCurrentState];
    double v12 = [MEMORY[0x263F825C8] systemYellowColor];
    double v13 = v12;
    if (v11)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x263F825C8] whiteColor];
    }
    double v15 = v14;
    if (v6)
    {
      unsigned int v26 = v3;
      BOOL v16 = [(CAMControlStatusIndicator *)self shouldFillOutlineForCurrentState];
      BOOL v17 = [(CAMControlStatusIndicator *)self shouldShowOutlineForCurrentState];
      double v18 = objc_opt_class();
      double v19 = [(CAMControlStatusIndicator *)self traitCollection];
      [v19 displayScale];
      double v20 = objc_msgSend(v18, "stretchableCircleImageFilled:scale:", v16);
      [v6 setImage:v20];

      if (v11)
      {
        [v6 setTintColor:v13];
        unint64_t v21 = 0x263F82000;
      }
      else
      {
        unint64_t v21 = 0x263F82000uLL;
        double v22 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.6];
        [v6 setTintColor:v22];
      }
      double v23 = 0.0;
      if (v17) {
        double v23 = 1.0;
      }
      [v6 setAlpha:v23];
      if (v17 && v16)
      {
        uint64_t v24 = [*(id *)(v21 + 1480) blackColor];

        double v15 = (void *)v24;
      }
      uint64_t v3 = v26;
    }
    [v5 setTintColor:v15];
    double v25 = [(CAMControlStatusIndicator *)self _valueLabel];
    [v25 setTextColor:v15];
  }
  if ([(CAMControlStatusIndicator *)self shouldUseSlash]) {
    [(CAMControlStatusIndicator *)self _updateSlashAnimated:v3];
  }
}

- (id)imageForCurrentState
{
  uint64_t v3 = [(CAMControlStatusIndicator *)self imageNameForCurrentState];
  if (v3)
  {
    unint64_t v4 = [(CAMControlStatusIndicator *)self customPointSizeForImageSymbol];
    if (v4)
    {
      uint64_t v5 = [MEMORY[0x263F82818] configurationWithPointSize:(double)v4];
    }
    else
    {
      if ([(CAMControlStatusIndicator *)self shouldUseOutline]) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 3;
      }
      uint64_t v5 = [MEMORY[0x263F82818] configurationWithScale:v7];
    }
    double v8 = (void *)v5;
    double v9 = [(CAMControlStatusIndicator *)self imageSymbolColorConfiguration];
    if (v9)
    {
      uint64_t v10 = [v8 configurationByApplyingConfiguration:v9];

      double v8 = (void *)v10;
    }
    BOOL v11 = [MEMORY[0x263F827E8] _systemImageNamed:v3 withConfiguration:v8];
    double v12 = v11;
    if (v11)
    {
      id v6 = v11;
    }
    else
    {
      double v13 = (void *)MEMORY[0x263F827E8];
      id v14 = CAMCameraUIFrameworkBundle();
      double v15 = [v13 imageNamed:v3 inBundle:v14];
      id v6 = [v15 imageWithRenderingMode:2];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)imageNameForCurrentState
{
  double v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF488];
  unint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"%@ must be implemented by subclasses", v4 format];

  return 0;
}

- (id)imageForAXHUD
{
  uint64_t v3 = [(CAMControlStatusIndicator *)self imageNameForAXHUD];
  unint64_t v4 = [MEMORY[0x263F82818] configurationWithScale:3];
  uint64_t v5 = [(CAMControlStatusIndicator *)self traitCollection];
  id v6 = [v4 configurationWithTraitCollection:v5];

  uint64_t v7 = [MEMORY[0x263F827E8] _systemImageNamed:v3 withConfiguration:v6];
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F827E8];
    BOOL v11 = CAMCameraUIFrameworkBundle();
    id v9 = [v10 imageNamed:v3 inBundle:v11];
  }
  return v9;
}

- (BOOL)shouldUseOutline
{
  return 1;
}

- (BOOL)shouldFillOutlineForCurrentState
{
  return 0;
}

- (BOOL)shouldUseSlash
{
  return 0;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return 0;
}

- (BOOL)supportsOrientations
{
  return 1;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return 0;
}

- (CGVector)imageOffset
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.dCGFloat y = v3;
  result.dCGFloat x = v2;
  return result;
}

- (UIImageSymbolConfiguration)imageSymbolColorConfiguration
{
  return 0;
}

- (BOOL)canShowValue
{
  return 0;
}

- (void)setNeedsUpdateValueText
{
  if ([(CAMControlStatusIndicator *)self isShowingValue])
  {
    [(CAMControlStatusIndicator *)self _updateValueText];
  }
  else
  {
    [(CAMControlStatusIndicator *)self _setNeedsUpdateValueText:1];
  }
}

- (id)valueText
{
  double v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF488];
  unint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"%@ must be implemented by subclasses that return YES for canShowValue", v4 format];

  return 0;
}

- (unint64_t)customPointSizeForImageSymbol
{
  return 0;
}

- (void)_updateValueText
{
  [(CAMControlStatusIndicator *)self _setNeedsUpdateValueText:0];
  id v13 = [(CAMControlStatusIndicator *)self valueText];
  uint64_t v3 = [(CAMControlStatusIndicator *)self _valueLabel];
  [v3 setText:v13];
  [v3 intrinsicContentSize];
  UICeilToViewScale();
  double v5 = v4;
  UICeilToViewScale();
  double v7 = v6;
  [(CAMControlStatusIndicator *)self _valueLabelSize];
  if (v9 != v5 || v8 != v7)
  {
    -[CAMControlStatusIndicator _setValueLabelSize:](self, "_setValueLabelSize:", v5, v7);
    if ([(CAMControlStatusIndicator *)self isShowingValue])
    {
      BOOL v11 = [(CAMControlStatusIndicator *)self delegate];
      [v11 controlStatusIndicatorDidChangeIntrinsicContentSize:self animated:1];

      double v12 = [(CAMControlStatusIndicator *)self _slashMaskView];
      [v12 updateMaskAnimated];
    }
  }
}

- (void)_updateValueLabelVisibilityAnimated:(BOOL)a3
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 0.25;
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__CAMControlStatusIndicator__updateValueLabelVisibilityAnimated___block_invoke;
  v4[3] = &unk_263FA0208;
  v4[4] = self;
  +[CAMView animateIfNeededWithDuration:v4 animations:v3];
}

void __65__CAMControlStatusIndicator__updateValueLabelVisibilityAnimated___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isShowingValue]) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  id v3 = [*(id *)(a1 + 32) _valueLabel];
  [v3 setAlpha:v2];
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(CAMControlStatusIndicator *)self _updateImageOrientationAnimated:a4];
  }
}

- (void)_updateImageOrientationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ((unint64_t)([(CAMControlStatusIndicator *)self orientation] - 1) > 1) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = [(CAMControlStatusIndicator *)self orientation];
  }
  double v6 = [(CAMControlStatusIndicator *)self _valueLabel];
  +[CAMView rotateView:v6 toInterfaceOrientation:v5 animated:0];

  if (![(CAMControlStatusIndicator *)self isShowingValue]) {
    int64_t v5 = [(CAMControlStatusIndicator *)self orientation];
  }
  double v7 = [(CAMControlStatusIndicator *)self _imageView];
  +[CAMView rotateView:v7 toInterfaceOrientation:v5 animated:v3];

  double v8 = [(CAMControlStatusIndicator *)self _slashView];
  +[CAMView rotateView:v8 toInterfaceOrientation:v5 animated:v3];

  id v9 = [(CAMControlStatusIndicator *)self _slashMaskView];
  +[CAMView rotateView:v9 toInterfaceOrientation:v5 animated:v3];
}

- (void)setShowingValue:(BOOL)a3
{
}

- (void)setShowingValue:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showingValue != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    double v7 = [(CAMControlStatusIndicator *)self _valueLabel];

    if (v7)
    {
      if (v4) {
        [(CAMControlStatusIndicator *)self layoutIfNeeded];
      }
      if (v5 && [(CAMControlStatusIndicator *)self _needsUpdateValueText]) {
        [(CAMControlStatusIndicator *)self _updateValueText];
      }
      self->_showingValue = v5;
      [(CAMControlStatusIndicator *)self setNeedsLayout];
      [(CAMControlStatusIndicator *)self _updateImageOrientationAnimated:v4];
      [(CAMControlStatusIndicator *)self _updateValueLabelVisibilityAnimated:v4];
      double v8 = [(CAMControlStatusIndicator *)self delegate];
      [v8 controlStatusIndicatorDidChangeIntrinsicContentSize:self animated:v4];

      if (v4)
      {
        id v9 = [(CAMControlStatusIndicator *)self _slashMaskView];
        [v9 updateMaskAnimated];
      }
    }
  }
}

- (void)_updateSlashAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(CAMControlStatusIndicator *)self _slashView];
  BOOL v5 = [(CAMControlStatusIndicator *)self _slashMaskView];
  BOOL v6 = [(CAMControlStatusIndicator *)self shouldShowSlashForCurrentState];
  [v7 bounds];
  objc_msgSend(v5, "convertRect:fromView:", v7);
  objc_msgSend(v5, "setSlashBounds:animated:", v3);
  [v7 setVisible:v6 animated:v3];
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  BOOL v4 = [(CAMControlStatusIndicator *)self imageForAXHUD];
  if ([(CAMControlStatusIndicator *)self canShowValue]
    && [(CAMControlStatusIndicator *)self isShowingValue])
  {
    BOOL v5 = [(CAMControlStatusIndicator *)self valueText];
  }
  else
  {
    BOOL v5 = 0;
  }
  id v6 = objc_alloc(MEMORY[0x263F823C0]);
  id v7 = objc_msgSend(v6, "initWithTitle:image:imageInsets:scaleImage:", v5, v4, 1, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

  return v7;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)controlStatusType
{
  return self->_controlStatusType;
}

- (void)setControlStatusType:(unint64_t)a3
{
  self->_controlStatusType = a3;
}

- (CAMControlStatusIndicatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMControlStatusIndicatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isShowingValue
{
  return self->_showingValue;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void)set_imageView:(id)a3
{
}

- (UIImageView)_outlineView
{
  return self->__outlineView;
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (CAMSlashView)_slashView
{
  return self->__slashView;
}

- (CAMSlashMaskView)_slashMaskView
{
  return self->__slashMaskView;
}

- (UIView)_slashMaskContainer
{
  return self->__slashMaskContainer;
}

- (CGSize)_valueLabelSize
{
  double width = self->__valueLabelSize.width;
  double height = self->__valueLabelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setValueLabelSize:(CGSize)a3
{
  self->__valueLabelSize = a3;
}

- (BOOL)_needsUpdateValueText
{
  return self->__needsUpdateValueText;
}

- (void)_setNeedsUpdateValueText:(BOOL)a3
{
  self->__needsUpdateValueText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__slashMaskContainer, 0);
  objc_storeStrong((id *)&self->__slashMaskView, 0);
  objc_storeStrong((id *)&self->__slashView, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__outlineView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end