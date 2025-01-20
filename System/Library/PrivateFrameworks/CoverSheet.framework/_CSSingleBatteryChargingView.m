@interface _CSSingleBatteryChargingView
- (BOOL)batteryVisible;
- (BOOL)horizontalLayoutNeeded;
- (BOOL)includesBoltImage;
- (CGSize)batterySize;
- (_CSSingleBatteryChargingView)initWithFrame:(CGRect)a3;
- (double)_batteryNoseOffset;
- (double)desiredVisibilityDuration;
- (id)_chargePercentFont;
- (int64_t)batteryCount;
- (void)_layoutBattery;
- (void)_layoutChargePercentLabel;
- (void)layoutSubviews;
- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4;
- (void)setBatterySize:(CGSize)a3;
- (void)setBatteryVisible:(BOOL)a3;
- (void)setHorizontalLayoutNeeded:(BOOL)a3;
- (void)setIncludesBoltImage:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setPrimaryBatteryText:(id)a3 forBattery:(id)a4;
@end

@implementation _CSSingleBatteryChargingView

- (_CSSingleBatteryChargingView)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)_CSSingleBatteryChargingView;
  v3 = -[CSBatteryChargingView initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v4 = +[CSBatteryChargingView maskImageNameForChargingBattery];
    uint64_t v5 = [MEMORY[0x1E4F42A80] imageNamed:v4 inBundle:v39];
    batteryImage = v3->_batteryImage;
    v3->_batteryImage = (UIImage *)v5;

    [(UIImage *)v3->_batteryImage size];
    v3->_batteryImageSize.width = v7;
    v3->_batteryImageSize.height = v8;
    v9 = [MEMORY[0x1E4F42A98] configurationWithWeight:7];
    uint64_t v10 = [MEMORY[0x1E4F42A80] systemImageNamed:@"bolt.fill"];
    boltImage = v3->_boltImage;
    v3->_boltImage = (UIImage *)v10;

    uint64_t v12 = [(UIImage *)v3->_boltImage imageWithRenderingMode:2];
    v13 = v3->_boltImage;
    v3->_boltImage = (UIImage *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v3->_boltImage];
    boltImageView = v3->_boltImageView;
    v3->_boltImageView = (UIImageView *)v14;

    [(UIImageView *)v3->_boltImageView setPreferredSymbolConfiguration:v9];
    v16 = v3->_boltImageView;
    v17 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIImageView *)v16 setTintColor:v17];

    -[CSBatteryChargingView _imageViewScalingCorrectedBatterySize:](v3, "_imageViewScalingCorrectedBatterySize:", v3->_batteryImageSize.width, v3->_batteryImageSize.height);
    double v19 = v18;
    double v21 = v20;
    v22 = [CSBatteryFillView alloc];
    uint64_t v23 = -[CSBatteryFillView initWithFrame:isInternalBattery:lowBatteryLevel:](v22, "initWithFrame:isInternalBattery:lowBatteryLevel:", 1, [MEMORY[0x1E4F42E28] lowBatteryLevel], 0.0, 0.0, v19, v21);
    batteryFillView = v3->_batteryFillView;
    v3->_batteryFillView = (CSBatteryFillView *)v23;

    [(CSBatteryFillView *)v3->_batteryFillView setAutoresizingMask:18];
    v25 = v3->_batteryFillView;
    v26 = [MEMORY[0x1E4F428B8] clearColor];
    [(CSBatteryFillView *)v25 setBackgroundColor:v26];

    v27 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:2020];
    [v27 setRenderingHint:1];
    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F430A8]), "initWithFrame:settings:", v27, 0.0, 0.0, v19, v21);
    batteryBlurView = v3->_batteryBlurView;
    v3->_batteryBlurView = (_UIBackdropView *)v28;

    [(_UIBackdropView *)v3->_batteryBlurView setAutoresizingMask:18];
    uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, v19, v21);
    batteryContainerView = v3->_batteryContainerView;
    v3->_batteryContainerView = (UIView *)v30;

    v32 = v3->_batteryContainerView;
    v33 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v32 setBackgroundColor:v33];

    [(UIView *)v3->_batteryContainerView setAutoresizingMask:18];
    [(UIView *)v3->_batteryContainerView setClipsToBounds:1];
    [(UIView *)v3->_batteryContainerView addSubview:v3->_batteryBlurView];
    [(UIView *)v3->_batteryContainerView addSubview:v3->_batteryFillView];
    [(UIView *)v3->_batteryContainerView setAlpha:0.0];
    v34 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v3->_batteryImage];
    [v34 setAutoresizingMask:18];
    objc_msgSend(v34, "setFrame:", 0.0, 0.0, v19, v21);
    [v34 setContentMode:0];
    [(CSBatteryFillView *)v3->_batteryFillView setMaskView:v34];
    v35 = [(_UIBackdropView *)v3->_batteryBlurView inputSettings];
    [v35 setGrayscaleTintMaskImage:v3->_batteryImage];

    v36 = [(_UIBackdropView *)v3->_batteryBlurView inputSettings];
    [v36 setColorTintMaskImage:v3->_batteryImage];

    v37 = [(_UIBackdropView *)v3->_batteryBlurView inputSettings];
    [v37 setFilterMaskImage:v3->_batteryImage];

    [(_CSSingleBatteryChargingView *)v3 addSubview:v3->_batteryContainerView];
  }
  return v3;
}

- (void)setBatterySize:(CGSize)a3
{
  if (self->_batteryImageSize.width != a3.width || self->_batteryImageSize.height != a3.height)
  {
    self->_batteryImageSize = a3;
    [(_CSSingleBatteryChargingView *)self setNeedsLayout];
    [(_CSSingleBatteryChargingView *)self layoutIfNeeded];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_CSSingleBatteryChargingView;
  [(CSBatteryChargingView *)&v6 setLegibilitySettings:a3];
  chargePercentLabel = self->_chargePercentLabel;
  uint64_t v5 = [(CSBatteryChargingView *)self legibilitySettings];
  [(SBUILegibilityLabel *)chargePercentLabel setLegibilitySettings:v5];
}

- (void)setIncludesBoltImage:(BOOL)a3
{
  if (self->_includesBoltImage != a3)
  {
    self->_includesBoltImage = a3;
    [(UIImageView *)self->_boltImageView removeFromSuperview];
    if (self->_includesBoltImage)
    {
      boltImageView = self->_boltImageView;
      [(_CSSingleBatteryChargingView *)self addSubview:boltImageView];
    }
  }
}

- (void)setPrimaryBatteryText:(id)a3 forBattery:(id)a4
{
  chargePercentLabel = self->_chargePercentLabel;
  id v7 = a4;
  CGFloat v8 = [(CSBatteryChargingView *)self _updateChargeString:a3 oldLabel:chargePercentLabel];
  v9 = self->_chargePercentLabel;
  self->_chargePercentLabel = v8;

  [(SBUILegibilityLabel *)self->_chargePercentLabel setAdjustsFontSizeToFitWidth:1];
  -[CSBatteryFillView setChargePercentage:](self->_batteryFillView, "setChargePercentage:", [v7 percentCharge]);
  batteryFillView = self->_batteryFillView;
  uint64_t v11 = [v7 isLowPowerModeActive];

  [(CSBatteryFillView *)batteryFillView setBatterySaverModeActive:v11];

  [(_CSSingleBatteryChargingView *)self setNeedsLayout];
}

- (BOOL)batteryVisible
{
  [(UIView *)self->_batteryContainerView alpha];
  return v2 == 1.0;
}

- (void)setBatteryVisible:(BOOL)a3
{
  batteryContainerView = self->_batteryContainerView;
  double v5 = 0.0;
  if (a3) {
    double v5 = 1.0;
  }
  [(UIView *)batteryContainerView setAlpha:v5];

  [(_CSSingleBatteryChargingView *)self setNeedsLayout];
}

- (int64_t)batteryCount
{
  return 1;
}

- (double)desiredVisibilityDuration
{
  return 2.5;
}

- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)layoutSubviews
{
  [(_CSSingleBatteryChargingView *)self _layoutBattery];

  [(_CSSingleBatteryChargingView *)self _layoutChargePercentLabel];
}

- (void)_layoutChargePercentLabel
{
  [(SBUILegibilityLabel *)self->_chargePercentLabel frame];
  chargePercentLabel = self->_chargePercentLabel;
  [(_CSSingleBatteryChargingView *)self bounds];
  -[SBUILegibilityLabel sizeThatFits:](chargePercentLabel, "sizeThatFits:", v4, 0.0);
  double v6 = v5;
  double v8 = v7;
  [(_CSSingleBatteryChargingView *)self bounds];
  if (v6 > v9)
  {
    [(_CSSingleBatteryChargingView *)self bounds];
    double v6 = v10;
  }
  if ([(_CSSingleBatteryChargingView *)self horizontalLayoutNeeded])
  {
    [(_CSSingleBatteryChargingView *)self bounds];
    [(CSBatteryChargingView *)self horizontalGapBetweenBatteryAndPercentLabel];
    SBFMainScreenScale();
    BSFloatRoundForScale();
    double v12 = v11;
    SBFMainScreenScale();
    BSFloatRoundForScale();
    double v14 = v13;
  }
  else
  {
    [(CSBatteryChargingView *)self _tightFrameForElement:2];
    CGFloat x = v24.origin.x;
    CGFloat y = v24.origin.y;
    CGFloat width = v24.size.width;
    CGFloat height = v24.size.height;
    CGRectGetMidY(v24);
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    CGRectGetMidX(v25);
    SBFMainScreenScale();
    BSRectRoundForScale();
    double v12 = v19;
    double v6 = v20;
    double v8 = v21;
  }
  v22 = self->_chargePercentLabel;

  -[SBUILegibilityLabel setFrame:](v22, "setFrame:", v12, v14, v6, v8);
}

- (void)_layoutBattery
{
  -[CSBatteryChargingView _imageViewScalingCorrectedBatterySize:](self, "_imageViewScalingCorrectedBatterySize:", self->_batteryImageSize.width, self->_batteryImageSize.height);
  double v4 = v3;
  double v6 = v5;
  if ([(_CSSingleBatteryChargingView *)self horizontalLayoutNeeded])
  {
    [(_CSSingleBatteryChargingView *)self bounds];
    [(CSBatteryChargingView *)self horizontalGapBetweenBatteryAndPercentLabel];
    SBFMainScreenScale();
    BSFloatRoundForScale();
    double v8 = v7;
    SBFMainScreenScale();
    BSFloatRoundForScale();
    double v10 = v9;
  }
  else
  {
    [(CSBatteryChargingView *)self _batteryCenter];
    double v10 = v11 - v6 * 0.5;
    double v13 = v12 - v4 * 0.5;
    [(_CSSingleBatteryChargingView *)self _batteryNoseOffset];
    double v8 = v14 + v13;
  }
  if (self->_includesBoltImage)
  {
    -[UIImageView sizeThatFits:](self->_boltImageView, "sizeThatFits:", 0.0, v6);
    -[UIImageView setFrame:](self->_boltImageView, "setFrame:", v8 + (v4 - v16) * 0.5, v10 - (v15 + -2.0 - v6) * 0.5);
  }
  batteryContainerView = self->_batteryContainerView;

  -[UIView setFrame:](batteryContainerView, "setFrame:", v8, v10, v4, v6);
}

- (double)_batteryNoseOffset
{
  int v3 = __sb__runningInSpringBoard();
  char v4 = v3;
  if (v3)
  {
    double v5 = 3.0;
    if (SBFEffectiveDeviceClass() != 2) {
      return v5;
    }
  }
  else
  {
    double v2 = [MEMORY[0x1E4F42948] currentDevice];
    double v5 = 3.0;
    if ([v2 userInterfaceIdiom] != 1)
    {
LABEL_6:

      return v5;
    }
  }
  SBFMainScreenScale();
  BSFloatFloorForScale();
  double v5 = v6;
  if ((v4 & 1) == 0) {
    goto LABEL_6;
  }
  return v5;
}

- (id)_chargePercentFont
{
  [MEMORY[0x1E4F5E4D0] fontSizeForElementType:2 isLandscapeVariant:0];
  double v4 = v3;
  if ([(_CSSingleBatteryChargingView *)self horizontalLayoutNeeded]) {
    double v4 = 25.0;
  }
  [MEMORY[0x1E4F5E4D0] fontWeightForElementType:2];
  double v6 = (void *)MEMORY[0x1E4F42A30];

  return (id)[v6 systemFontOfSize:v4 weight:v5];
}

- (CGSize)batterySize
{
  double width = self->_batterySize.width;
  double height = self->_batterySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)horizontalLayoutNeeded
{
  return self->_horizontalLayoutNeeded;
}

- (void)setHorizontalLayoutNeeded:(BOOL)a3
{
  self->_horizontalLayoutNeeded = a3;
}

- (BOOL)includesBoltImage
{
  return self->_includesBoltImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boltImageView, 0);
  objc_storeStrong((id *)&self->_boltImage, 0);
  objc_storeStrong((id *)&self->_batteryImage, 0);
  objc_storeStrong((id *)&self->_batteryTopOffset, 0);
  objc_storeStrong((id *)&self->_batteryConstraints, 0);
  objc_storeStrong((id *)&self->_chargePercentLabel, 0);
  objc_storeStrong((id *)&self->_batteryFillView, 0);
  objc_storeStrong((id *)&self->_batteryBlurView, 0);

  objc_storeStrong((id *)&self->_batteryContainerView, 0);
}

@end