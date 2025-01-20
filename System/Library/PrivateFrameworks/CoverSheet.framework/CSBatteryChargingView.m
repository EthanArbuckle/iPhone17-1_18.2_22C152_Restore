@interface CSBatteryChargingView
+ (id)batteryChargingRingViewWithConfiguration:(id)a3;
+ (id)batteryChargingViewWithDoubleBattery;
+ (id)batteryChargingViewWithSingleBattery;
+ (id)horizontalBatteryChargingViewForBatterySize:(CGSize)a3 includeBoltImage:(BOOL)a4;
+ (id)maskImageNameForChargingBattery;
+ (id)maskImageNameForExternalChargingBattery;
+ (id)maskImageNameForInternalChargingBattery;
- (BOOL)batteryVisible;
- (CGPoint)_batteryCenter;
- (CGRect)_tightFrameForElement:(unint64_t)a3;
- (CGSize)_imageViewScalingCorrectedBatterySize:(CGSize)a3;
- (CSBatteryChargingView)initWithFrame:(CGRect)a3;
- (_UILegibilitySettings)legibilitySettings;
- (double)_batteryHeight;
- (double)alignmentPercent;
- (double)desiredVisibilityDuration;
- (double)horizontalGapBetweenBatteryAndPercentLabel;
- (id)_chargePercentFont;
- (id)_updateChargeString:(id)a3 oldLabel:(id)a4;
- (int64_t)batteryCount;
- (void)setAlignmentPercent:(double)a3;
- (void)setLegibilitySettings:(id)a3;
@end

@implementation CSBatteryChargingView

+ (id)batteryChargingViewWithSingleBattery
{
  v2 = [_CSSingleBatteryChargingView alloc];
  v3 = -[_CSSingleBatteryChargingView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v3;
}

+ (id)batteryChargingViewWithDoubleBattery
{
  v2 = [_CSDoubleBatteryChargingView alloc];
  v3 = -[_CSDoubleBatteryChargingView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v3;
}

+ (id)horizontalBatteryChargingViewForBatterySize:(CGSize)a3 includeBoltImage:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v7 = [_CSSingleBatteryChargingView alloc];
  v8 = -[_CSSingleBatteryChargingView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  -[_CSSingleBatteryChargingView setBatterySize:](v8, "setBatterySize:", width, height);
  [(_CSSingleBatteryChargingView *)v8 setHorizontalLayoutNeeded:1];
  [(_CSSingleBatteryChargingView *)v8 setIncludesBoltImage:v4];

  return v8;
}

+ (id)batteryChargingRingViewWithConfiguration:(id)a3
{
  id v3 = a3;
  BOOL v4 = [CSBatteryChargingRingView alloc];
  v5 = -[CSBatteryChargingRingView initWithFrame:configuration:](v4, "initWithFrame:configuration:", v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v5;
}

+ (id)maskImageNameForChargingBattery
{
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    v2 = [@"LockScreenChargingBatteryMask" stringByAppendingString:@"-RTL"];
  }
  else
  {
    v2 = @"LockScreenChargingBatteryMask";
  }

  return v2;
}

+ (id)maskImageNameForInternalChargingBattery
{
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    v2 = [@"LockScreenInternalChargingBatteryMask" stringByAppendingString:@"-RTL"];
  }
  else
  {
    v2 = @"LockScreenInternalChargingBatteryMask";
  }

  return v2;
}

+ (id)maskImageNameForExternalChargingBattery
{
  return @"LockScreenExternalChargingBatteryMask";
}

- (CSBatteryChargingView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSBatteryChargingView;
  id v3 = -[CSBatteryChargingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    v3->_alignmentPercent = 0.0;
    v5 = [MEMORY[0x1E4F428B8] clearColor];
    [(CSBatteryChargingView *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (void)setLegibilitySettings:(id)a3
{
  p_legibilitySettings = &self->_legibilitySettings;
  id v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](*p_legibilitySettings, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_legibilitySettings, a3);
  }
}

- (BOOL)batteryVisible
{
  return 0;
}

- (int64_t)batteryCount
{
  return 0;
}

- (double)desiredVisibilityDuration
{
  return 0.0;
}

- (void)setAlignmentPercent:(double)a3
{
  self->_alignmentPercent = a3;
  [(CSBatteryChargingView *)self setNeedsLayout];
}

- (id)_updateChargeString:(id)a3 oldLabel:(id)a4
{
  id v6 = a3;
  [a4 removeFromSuperview];
  objc_super v7 = [MEMORY[0x1E4FA5F38] rootSettings];
  v8 = [(CSBatteryChargingView *)self legibilitySettings];
  objc_msgSend(v7, "dateStrengthForStyle:", objc_msgSend(v8, "style"));
  double v10 = v9;

  id v11 = objc_alloc(MEMORY[0x1E4FA7CA0]);
  v12 = [(CSBatteryChargingView *)self legibilitySettings];
  v13 = [(CSBatteryChargingView *)self _chargePercentFont];
  v14 = (void *)[v11 initWithSettings:v12 strength:v6 string:v13 font:v10];

  [(CSBatteryChargingView *)self addSubview:v14];

  return v14;
}

- (id)_chargePercentFont
{
  return 0;
}

- (CGSize)_imageViewScalingCorrectedBatterySize:(CGSize)a3
{
  double v3 = round(a3.width * 1.0735);
  double v4 = round(a3.height * 1.0735);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (double)_batteryHeight
{
  [MEMORY[0x1E4F5E4D0] fontSizeForElementType:1 isLandscapeVariant:0];
  v2 = objc_msgSend(MEMORY[0x1E4F42A30], "systemFontOfSize:");
  [v2 capHeight];
  double v4 = round(v3);

  int v5 = BSFloatEqualToFloat();
  double result = 73.0;
  if (!v5) {
    return v4;
  }
  return result;
}

- (double)horizontalGapBetweenBatteryAndPercentLabel
{
  return 10.0;
}

- (CGPoint)_batteryCenter
{
  [(CSBatteryChargingView *)self _tightFrameForElement:1];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetMidY(v11);
  SBFMainScreenScale();

  BSPointRoundForScale();
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (CGRect)_tightFrameForElement:(unint64_t)a3
{
  prominentLayoutController = self->_prominentLayoutController;
  if (prominentLayoutController)
  {
    [(CSProminentLayoutController *)prominentLayoutController setTraitEnvironment:self];
  }
  else
  {
    double v6 = (CSProminentLayoutController *)[objc_alloc(MEMORY[0x1E4F5E4D0]) initWithTraitEnvironment:self];
    double v7 = self->_prominentLayoutController;
    self->_prominentLayoutController = v6;
  }
  v8 = self->_prominentLayoutController;
  [(CSBatteryChargingView *)self bounds];

  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](v8, "frameForElements:variant:withBoundingRect:", a3, 1);
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)alignmentPercent
{
  return self->_alignmentPercent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);

  objc_storeStrong((id *)&self->_prominentLayoutController, 0);
}

@end