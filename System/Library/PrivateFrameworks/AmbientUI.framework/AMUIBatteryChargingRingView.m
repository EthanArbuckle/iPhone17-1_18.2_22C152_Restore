@interface AMUIBatteryChargingRingView
- (AMUIBatteryChargingRingView)initWithFrame:(CGRect)a3;
- (AMUIBatteryChargingRingView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (AMUIBatteryChargingUIConfiguration)configuration;
- (AMUIPowerStatus)internalStatus;
- (AMUIRingLayer)batteryLevelRing;
- (AMUIRingLayer)trackFillRingLayer;
- (BCBatteryDevice)internalBattery;
- (BOOL)_isRTL;
- (BOOL)_layerHasGaussianBlurFilter:(id)a3;
- (CALayer)chargeRingLayer;
- (CALayer)chargingBoltGlyph;
- (CALayer)magSafeLayer;
- (CALayer)ringContainerLayer;
- (CALayer)ringLayer;
- (CGPath)_pathForRingConfiguration:(id)a3;
- (CGPoint)_initialRingCenterPosition;
- (CGPoint)_ringOrigin;
- (PLPlatterView)grabberView;
- (PLPlatterView)platterView;
- (UILabel)chargePercentLabel;
- (UIView)chargingContainerView;
- (id)_powerStatusForBattery:(id)a3;
- (id)_ringLayerForRingConfiguration:(id)a3;
- (id)_springAnimationForKeyPath:(id)a3 duration:(double)a4 delay:(double)a5 fromValue:(id)a6 toValue:(id)a7 fillMode:(id)a8 stiffness:(double)a9 mass:(double)a10 damping:(double)a11;
- (id)_trackRingForRingConfiguration:(id)a3 withBlendMode:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_addGaussianBlurToLayerIfNeeded:(id)a3 inputRadius:(double)a4;
- (void)_removeAllAnimations;
- (void)_runBatteryLevelAnimation;
- (void)_updateForPowerStatus:(id)a3;
- (void)layoutSubviews;
- (void)presentChargingViewWithCompletionHandler:(id)a3;
- (void)setBatteryLevelRing:(id)a3;
- (void)setChargePercentLabel:(id)a3;
- (void)setChargeRingLayer:(id)a3;
- (void)setChargingBoltGlyph:(id)a3;
- (void)setChargingContainerView:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setGrabberView:(id)a3;
- (void)setInternalBattery:(id)a3;
- (void)setInternalStatus:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setMagSafeLayer:(id)a3;
- (void)setRingContainerLayer:(id)a3;
- (void)setRingLayer:(id)a3;
- (void)setTrackFillRingLayer:(id)a3;
- (void)updateWithBattery:(id)a3;
@end

@implementation AMUIBatteryChargingRingView

- (AMUIBatteryChargingRingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = +[AMUIBatteryChargingUIConfiguration defaultConfiguration];
  v9 = -[AMUIBatteryChargingRingView initWithFrame:configuration:](self, "initWithFrame:configuration:", v8, x, y, width, height);

  return v9;
}

- (AMUIBatteryChargingRingView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v82[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  v81.receiver = self;
  v81.super_class = (Class)AMUIBatteryChargingRingView;
  v11 = -[AMUIBatteryChargingView initWithFrame:](&v81, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    p_configuration = (id *)&v11->_configuration;
    objc_storeStrong((id *)&v11->_configuration, a4);
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", x, y, width, height);
    chargingContainerView = v12->_chargingContainerView;
    v12->_chargingContainerView = (UIView *)v14;

    v16 = [(UIView *)v12->_chargingContainerView layer];
    [v16 setAllowsGroupBlending:0];

    uint64_t v17 = [MEMORY[0x263F157E8] layer];
    magSafeLayer = v12->_magSafeLayer;
    v12->_magSafeLayer = (CALayer *)v17;

    [(CALayer *)v12->_magSafeLayer setAllowsEdgeAntialiasing:1];
    [(CALayer *)v12->_magSafeLayer setDoubleSided:1];
    [(CALayer *)v12->_magSafeLayer setSortsSublayers:1];
    [(CALayer *)v12->_magSafeLayer setOpacity:0.0];
    v19 = v12->_magSafeLayer;
    [*p_configuration ringDiameter];
    double v21 = v20;
    [*p_configuration ringDiameter];
    -[CALayer setBounds:](v19, "setBounds:", 0.0, 0.0, v21, v22);
    uint64_t v23 = [MEMORY[0x263F157E8] layer];
    chargeRingLayer = v12->_chargeRingLayer;
    v12->_chargeRingLayer = (CALayer *)v23;

    [(CALayer *)v12->_chargeRingLayer setAllowsEdgeAntialiasing:1];
    [(CALayer *)v12->_chargeRingLayer setDoubleSided:1];
    [(CALayer *)v12->_chargeRingLayer setSortsSublayers:1];
    LODWORD(v25) = 1.0;
    [(CALayer *)v12->_chargeRingLayer setOpacity:v25];
    v26 = v12->_chargeRingLayer;
    [*p_configuration ringDiameter];
    double v28 = v27;
    [*p_configuration ringDiameter];
    -[CALayer setBounds:](v26, "setBounds:", 0.0, 0.0, v28, v29);
    uint64_t v30 = [MEMORY[0x263F157E8] layer];
    ringContainerLayer = v12->_ringContainerLayer;
    v12->_ringContainerLayer = (CALayer *)v30;

    [(CALayer *)v12->_ringContainerLayer setAllowsEdgeAntialiasing:1];
    [(CALayer *)v12->_ringContainerLayer setDoubleSided:1];
    [(CALayer *)v12->_ringContainerLayer setSortsSublayers:1];
    LODWORD(v32) = 1.0;
    [(CALayer *)v12->_ringContainerLayer setOpacity:v32];
    v33 = v12->_ringContainerLayer;
    [*p_configuration ringDiameter];
    double v35 = v34;
    [*p_configuration ringDiameter];
    -[CALayer setBounds:](v33, "setBounds:", 0.0, 0.0, v35, v36);
    uint64_t v37 = [MEMORY[0x263F157E8] layer];
    ringLayer = v12->_ringLayer;
    v12->_ringLayer = (CALayer *)v37;

    [(CALayer *)v12->_ringLayer setAllowsEdgeAntialiasing:1];
    [(CALayer *)v12->_ringLayer setDoubleSided:1];
    [(CALayer *)v12->_ringLayer setSortsSublayers:1];
    LODWORD(v39) = 1.0;
    [(CALayer *)v12->_ringLayer setOpacity:v39];
    v40 = v12->_ringLayer;
    [*p_configuration ringDiameter];
    double v42 = v41;
    [*p_configuration ringDiameter];
    -[CALayer setBounds:](v40, "setBounds:", 0.0, 0.0, v42, v43);
    BOOL v44 = [(AMUIBatteryChargingRingView *)v12 _isDarkerSystemColorsEnabled];
    v45 = (id *)MEMORY[0x263F15D30];
    if (!v44) {
      v45 = (id *)MEMORY[0x263F15D58];
    }
    id v46 = *v45;
    uint64_t v47 = [(AMUIBatteryChargingRingView *)v12 _trackRingForRingConfiguration:v10 withBlendMode:v46];
    trackFillRingLayer = v12->_trackFillRingLayer;
    v12->_trackFillRingLayer = (AMUIRingLayer *)v47;

    v49 = [MEMORY[0x263F1C6B0] systemImageNamed:@"bolt.fill"];
    [MEMORY[0x263F1C550] whiteColor];
    v50 = id v80 = v10;
    v51 = [v49 _flatImageWithColor:v50];

    v52 = [v51 imageWithRenderingMode:2];

    uint64_t v53 = [MEMORY[0x263F157E8] layer];
    chargingBoltGlyph = v12->_chargingBoltGlyph;
    v12->_chargingBoltGlyph = (CALayer *)v53;

    v55 = v12->_chargingBoltGlyph;
    id v79 = v52;
    -[CALayer setContents:](v55, "setContents:", [v79 CGImage]);
    v56 = v12->_chargingBoltGlyph;
    v57 = [MEMORY[0x263F157C8] brightnessFilterWithAmount:0.1];
    v82[0] = v57;
    v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:1];
    [(CALayer *)v56 setFilters:v58];

    uint64_t v59 = [(AMUIBatteryChargingRingView *)v12 _ringLayerForRingConfiguration:v80];

    batteryLevelRing = v12->_batteryLevelRing;
    v12->_batteryLevelRing = (AMUIRingLayer *)v59;

    v61 = [(AMUIBatteryChargingRingView *)v12 _pathForRingConfiguration:*p_configuration];
    [(AMUIRingLayer *)v12->_batteryLevelRing setPath:v61];
    CGPathRelease(v61);
    id v62 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v63 = objc_msgSend(v62, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    chargePercentLabel = v12->_chargePercentLabel;
    v12->_chargePercentLabel = (UILabel *)v63;

    v65 = (void *)MEMORY[0x263F1C658];
    [*p_configuration chargingTextFontSize];
    v78 = objc_msgSend(v65, "boldSystemFontOfSize:");
    [(UILabel *)v12->_chargePercentLabel setFont:v78];
    uint64_t v66 = [objc_alloc(MEMORY[0x263F5E700]) initWithRecipe:6];
    platterView = v12->_platterView;
    v12->_platterView = (PLPlatterView *)v66;

    [(PLPlatterView *)v12->_platterView setUsesBackgroundView:1];
    [(PLPlatterView *)v12->_platterView setMaterialGroupNameBase:@"AMUIChargingViewMaterialGroup"];
    v68 = v12->_platterView;
    [*p_configuration ringDiameter];
    [(PLPlatterView *)v68 _setContinuousCornerRadius:v69 * 0.5];
    uint64_t v70 = [objc_alloc(MEMORY[0x263F5E700]) initWithRecipe:19];
    grabberView = v12->_grabberView;
    v12->_grabberView = (PLPlatterView *)v70;

    [(PLPlatterView *)v12->_grabberView setRecipeDynamic:0];
    v72 = [(UIView *)v12->_chargingContainerView layer];
    [v72 addSublayer:v12->_magSafeLayer];

    [(CALayer *)v12->_magSafeLayer addSublayer:v12->_chargeRingLayer];
    [(CALayer *)v12->_magSafeLayer addSublayer:v12->_chargingBoltGlyph];
    [(CALayer *)v12->_chargeRingLayer addSublayer:v12->_ringContainerLayer];
    v73 = v12->_chargeRingLayer;
    v74 = [(UILabel *)v12->_chargePercentLabel layer];
    [(CALayer *)v73 addSublayer:v74];

    [(CALayer *)v12->_ringContainerLayer addSublayer:v12->_ringLayer];
    v75 = v12->_ringLayer;
    v76 = [(PLPlatterView *)v12->_platterView layer];
    [(CALayer *)v75 addSublayer:v76];

    id v10 = v80;
    [(CALayer *)v12->_ringLayer addSublayer:v12->_trackFillRingLayer];
    [(CALayer *)v12->_ringLayer addSublayer:v12->_batteryLevelRing];
    [(AMUIBatteryChargingRingView *)v12 addSubview:v12->_chargingContainerView];
    [(AMUIBatteryChargingRingView *)v12 addSubview:v12->_grabberView];
  }
  return v12;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)AMUIBatteryChargingRingView;
  [(AMUIBatteryChargingRingView *)&v31 layoutSubviews];
  [(AMUIBatteryChargingRingView *)self frame];
  -[UIView setFrame:](self->_chargingContainerView, "setFrame:");
  [(AMUIBatteryChargingUIConfiguration *)self->_configuration ringDiameter];
  double v4 = v3;
  [(AMUIBatteryChargingUIConfiguration *)self->_configuration ringDiameter];
  double v6 = v5;
  [(AMUIBatteryChargingRingView *)self _ringOrigin];
  double v8 = v7;
  double v10 = v9;
  -[CALayer setFrame:](self->_magSafeLayer, "setFrame:");
  -[CALayer setBounds:](self->_magSafeLayer, "setBounds:", v8, v10, v4, v6);
  -[CALayer setFrame:](self->_chargeRingLayer, "setFrame:", v8, v10, v4, v6);
  -[CALayer setBounds:](self->_chargeRingLayer, "setBounds:", v8, v10, v4, v6);
  -[CALayer setFrame:](self->_ringContainerLayer, "setFrame:", v8, v10, v4, v6);
  -[CALayer setBounds:](self->_ringContainerLayer, "setBounds:", v8, v10, v4, v6);
  -[CALayer setFrame:](self->_ringLayer, "setFrame:", v8, v10, v4, v6);
  -[CALayer setBounds:](self->_ringLayer, "setBounds:", v8, v10, v4, v6);
  -[AMUIRingLayer setFrame:](self->_trackFillRingLayer, "setFrame:", v8, v10, v4, v6);
  -[AMUIRingLayer setFrame:](self->_batteryLevelRing, "setFrame:", v8, v10, v4, v6);
  [(AMUIBatteryChargingUIConfiguration *)self->_configuration boltSize];
  double v12 = v11;
  double v14 = v13;
  [(AMUIBatteryChargingRingView *)self _ringOrigin];
  double v16 = v15 - v12 * 0.5;
  [(AMUIBatteryChargingRingView *)self _ringOrigin];
  -[CALayer setFrame:](self->_chargingBoltGlyph, "setFrame:", v16, v17 - v14 * 0.5, v12, v14);
  chargingBoltGlyph = self->_chargingBoltGlyph;
  [(AMUIBatteryChargingRingView *)self _initialRingCenterPosition];
  -[CALayer setPosition:](chargingBoltGlyph, "setPosition:");
  [(UILabel *)self->_chargePercentLabel sizeToFit];
  chargePercentLabel = self->_chargePercentLabel;
  [(AMUIBatteryChargingRingView *)self _initialRingCenterPosition];
  -[UILabel setCenter:](chargePercentLabel, "setCenter:");
  double v20 = [(UILabel *)self->_chargePercentLabel layer];
  [v20 setOpacity:0.0];

  -[PLPlatterView setFrame:](self->_platterView, "setFrame:", v8, v10, v4, v6);
  -[PLPlatterView setBounds:](self->_platterView, "setBounds:", v8, v10, v4, v6);
  LODWORD(v20) = [(AMUIBatteryChargingRingView *)self _isRTL];
  [(AMUIBatteryChargingRingView *)self _initialRingCenterPosition];
  double v22 = 0.0;
  if (!v20) {
    double v22 = v4;
  }
  double v23 = v21 - v22;
  [(AMUIBatteryChargingRingView *)self _initialRingCenterPosition];
  [(PLPlatterView *)self->_grabberView setFrame:v23];
  grabberView = self->_grabberView;
  [(PLPlatterView *)grabberView frame];
  [(PLPlatterView *)grabberView _setContinuousCornerRadius:CGRectGetHeight(v32) * 0.5];
  LODWORD(v25) = 1036831949;
  [(AMUIRingLayer *)self->_trackFillRingLayer setOpacity:v25];
  [(CALayer *)self->_chargingBoltGlyph setOpacity:0.0];
  LODWORD(v26) = 1.0;
  [(AMUIRingLayer *)self->_batteryLevelRing setOpacity:v26];
  double v27 = [(UILabel *)self->_chargePercentLabel layer];
  [v27 setOpacity:0.0];

  double v28 = [(PLPlatterView *)self->_platterView layer];
  LODWORD(v29) = 1.0;
  [v28 setOpacity:v29];

  uint64_t v30 = [(PLPlatterView *)self->_grabberView layer];
  [v30 setOpacity:0.0];
}

- (void)updateWithBattery:(id)a3
{
  objc_storeStrong((id *)&self->_internalBattery, a3);
  id v7 = a3;
  double v5 = [(AMUIBatteryChargingRingView *)self _powerStatusForBattery:v7];
  internalStatus = self->_internalStatus;
  self->_internalStatus = v5;

  [(AMUIBatteryChargingRingView *)self _updateForPowerStatus:self->_internalStatus];
}

- (void)presentChargingViewWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [MEMORY[0x263F158F8] begin];
  double v5 = (void *)MEMORY[0x263F158F8];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  double v9 = __72__AMUIBatteryChargingRingView_presentChargingViewWithCompletionHandler___block_invoke;
  double v10 = &unk_265225188;
  double v11 = self;
  id v12 = v4;
  id v6 = v4;
  [v5 setCompletionBlock:&v7];
  [(AMUIBatteryChargingRingView *)self _runBatteryLevelAnimation];
  [MEMORY[0x263F158F8] commit];
}

uint64_t __72__AMUIBatteryChargingRingView_presentChargingViewWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeAllAnimations];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_updateForPowerStatus:(id)a3
{
  id v4 = a3;
  double v5 = AMUIRingColorForPowerStatus(v4);
  chargingBoltGlyph = self->_chargingBoltGlyph;
  id v7 = v5;
  -[CALayer setContentsMultiplyColor:](chargingBoltGlyph, "setContentsMultiplyColor:", [v7 CGColor]);
  batteryLevelRing = self->_batteryLevelRing;
  id v9 = v7;
  -[AMUIRingLayer setContentsMultiplyColor:](batteryLevelRing, "setContentsMultiplyColor:", [v9 CGColor]);
  double v10 = self->_batteryLevelRing;
  id v19 = v9;
  -[AMUIRingLayer setStrokeColor:](v10, "setStrokeColor:", [v19 CGColor]);
  double v11 = self->_batteryLevelRing;
  [v4 powerPercent];
  [(AMUIRingLayer *)v11 setStrokeEnd:v12 / 100.0];
  double v13 = (void *)MEMORY[0x263F08A30];
  double v14 = NSNumber;
  [v4 powerPercent];
  double v16 = v15;

  double v17 = [v14 numberWithDouble:v16];
  v18 = [v13 localizedStringFromNumber:v17 numberStyle:0];

  [(UILabel *)self->_chargePercentLabel setText:v18];
  [(UILabel *)self->_chargePercentLabel setTextColor:v19];
  [(AMUIBatteryChargingRingView *)self setNeedsLayout];
}

- (id)_powerStatusForBattery:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(AMUIPowerStatus);
  -[AMUIPowerStatus setPowerPercent:](v5, "setPowerPercent:", (double)[v4 percentCharge]);
  if ([v4 isLowPowerModeActive]) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 0;
  }
  [v4 percentCharge];
  [MEMORY[0x263F1C9C0] lowBatteryLevel];
  if (BSFloatLessThanOrEqualToFloat()) {
    v6 |= 2uLL;
  }
  -[AMUIPowerStatus setPowerStatus:](v5, "setPowerStatus:", v6 | [v4 isCharging]);
  if ([v4 isCharging])
  {
    if ([v4 powerSourceState] == 2) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 3;
    }
  }
  else if (([v4 isInternal] & 1) != 0 {
         || ([v4 isCharging] & 1) != 0
  }
         || ![(BCBatteryDevice *)self->_internalBattery isCharging]
         || [(BCBatteryDevice *)self->_internalBattery powerSourceState] != 2)
  {
    uint64_t v7 = 0;
  }
  else if ([(BCBatteryDevice *)self->_internalBattery isWirelesslyCharging])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 2;
  }
  [(AMUIPowerStatus *)v5 setChargeState:v7];

  return v5;
}

- (BOOL)_isRTL
{
  return [(AMUIBatteryChargingRingView *)self effectiveUserInterfaceLayoutDirection] == 1;
}

- (CGPoint)_ringOrigin
{
  [(AMUIBatteryChargingUIConfiguration *)self->_configuration ringDiameter];
  [(AMUIBatteryChargingRingView *)self frame];
  [(AMUIBatteryChargingRingView *)self _isRTL];
  double v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 scale];
  BSFloatRoundForScale();
  double v5 = v4;

  uint64_t v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];
  BSFloatRoundForScale();
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)_initialRingCenterPosition
{
  [(AMUIBatteryChargingUIConfiguration *)self->_configuration ringDiameter];
  uint64_t v3 = [(AMUIBatteryChargingRingView *)self _ringOrigin];

  MEMORY[0x270F06240](v3);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (void)_removeAllAnimations
{
  uint64_t v3 = [(AMUIBatteryChargingRingView *)self layer];
  [v3 removeAllAnimations];

  [(CALayer *)self->_magSafeLayer removeAllAnimations];
  [(CALayer *)self->_ringContainerLayer removeAllAnimations];
  [(CALayer *)self->_ringLayer removeAllAnimations];
  [(CALayer *)self->_chargingBoltGlyph removeAllAnimations];
  [(AMUIRingLayer *)self->_trackFillRingLayer removeAllAnimations];
  [(AMUIRingLayer *)self->_batteryLevelRing removeAllAnimations];
  [(AMUIRingLayer *)self->_trackFillRingLayer removeAllAnimations];
  double v4 = [(UILabel *)self->_chargePercentLabel layer];
  [v4 removeAllAnimations];

  double v5 = [(PLPlatterView *)self->_platterView layer];
  [v5 removeAllAnimations];

  id v6 = [(PLPlatterView *)self->_grabberView layer];
  [v6 removeAllAnimations];
}

- (BOOL)_layerHasGaussianBlurFilter:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = objc_msgSend(a3, "filters", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = *MEMORY[0x263F15BC8];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        double v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) name];
        char v10 = [v9 isEqualToString:v7];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)_addGaussianBlurToLayerIfNeeded:(id)a3 inputRadius:(double)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![(AMUIBatteryChargingRingView *)self _layerHasGaussianBlurFilter:v6])
  {
    uint64_t v7 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
    [v7 setName:@"gaussianBlur"];
    [v7 setValue:@"default" forKey:@"inputQuality"];
    [v7 setValue:@"default" forKey:@"inputIntermediateBitDepth"];
    double v8 = [NSNumber numberWithDouble:a4];
    [v7 setValue:v8 forKey:@"inputRadius"];

    uint64_t v9 = MEMORY[0x263EFFA80];
    [v7 setValue:MEMORY[0x263EFFA80] forKey:@"inputNormalizeEdges"];
    [v7 setValue:v9 forKey:@"inputHardEdges"];
    char v10 = [v6 filters];
    BOOL v11 = (void *)[v10 mutableCopy];

    [v11 addObject:v7];
    v13[0] = v7;
    double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [v6 setFilters:v12];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AMUIBatteryChargingRingView;
  id v4 = a3;
  [(AMUIBatteryChargingView *)&v8 setLegibilitySettings:v4];
  uint64_t v5 = objc_msgSend(v4, "primaryColor", v8.receiver, v8.super_class);

  trackFillRingLayer = self->_trackFillRingLayer;
  id v7 = v5;
  -[AMUIRingLayer setStrokeColor:](trackFillRingLayer, "setStrokeColor:", [v7 CGColor]);
}

- (void)_runBatteryLevelAnimation
{
  [(AMUIRingLayer *)self->_batteryLevelRing setStrokeEnd:0.0];
  [(AMUIPowerStatus *)self->_internalStatus powerPercent];
  id v4 = [NSNumber numberWithDouble:v3 / 100.0];
  uint64_t v5 = *MEMORY[0x263F15AB0];
  id v46 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"strokeEnd" duration:&unk_26FBDB1F0 delay:v4 fromValue:*MEMORY[0x263F15AB0] toValue:2.1 fillMode:0.1236 stiffness:300.0 mass:2.0 damping:50.0];

  v45 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"transform.scale.xy" duration:&unk_26FBDB200 delay:&unk_26FBDB210 fromValue:v5 toValue:1.1993 fillMode:0.25 stiffness:200.0 mass:2.0 damping:25.0];
  double v42 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"opacity" duration:&unk_26FBDB1F0 delay:&unk_26FBDB210 fromValue:v5 toValue:0.8 fillMode:0.25 stiffness:300.0 mass:2.0 damping:50.0];
  double v43 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"transform.scale.xy" duration:&unk_26FBDB1F0 delay:&unk_26FBDB220 fromValue:v5 toValue:1.1993 fillMode:0.0 stiffness:200.0 mass:2.0 damping:25.0];
  BOOL v44 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"opacity" duration:&unk_26FBDB1F0 delay:&unk_26FBDB210 fromValue:v5 toValue:0.8 fillMode:0.25 stiffness:300.0 mass:2.0 damping:50.0];
  double v39 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"filters.gaussianBlur.inputRadius" duration:&unk_26FBDB230 delay:&unk_26FBDB1F0 fromValue:v5 toValue:0.8 fillMode:0.0 stiffness:300.0 mass:2.0 damping:50.0];
  v38 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"filters.gaussianBlur.inputRadius" duration:&unk_26FBDB1F0 delay:&unk_26FBDB240 fromValue:v5 toValue:0.8 fillMode:3.0 stiffness:300.0 mass:2.0 damping:50.0];
  uint64_t v37 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"transform.scale.xy" duration:&unk_26FBDB220 delay:&unk_26FBDB1F0 fromValue:v5 toValue:1.1993 fillMode:3.0 stiffness:200.0 mass:2.0 damping:25.0];
  v33 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"opacity" duration:&unk_26FBDB210 delay:&unk_26FBDB1F0 fromValue:v5 toValue:0.907 fillMode:3.0 stiffness:120.0 mass:1.0 damping:17.0];
  double v41 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"transform.scale.xy" duration:&unk_26FBDB210 delay:&unk_26FBDB250 fromValue:v5 toValue:1.1877 fillMode:3.28 stiffness:100.0 mass:0.8 damping:10.0];
  v40 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"transform.scale.xy" duration:&unk_26FBDB210 delay:&unk_26FBDB200 fromValue:v5 toValue:1.1877 fillMode:3.0 stiffness:100.0 mass:0.8 damping:10.0];
  uint64_t v30 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"opacity" duration:&unk_26FBDB1F0 delay:&unk_26FBDB210 fromValue:v5 toValue:1.0 fillMode:3.1 stiffness:200.0 mass:2.0 damping:100.0];
  objc_super v31 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"filters.gaussianBlur.inputRadius" duration:&unk_26FBDB260 delay:&unk_26FBDB1F0 fromValue:v5 toValue:0.8 fillMode:3.1 stiffness:300.0 mass:2.0 damping:50.0];
  CGRect v32 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"transform.scale.xy" duration:&unk_26FBDB200 delay:&unk_26FBDB210 fromValue:v5 toValue:1.1993 fillMode:3.1 stiffness:200.0 mass:2.0 damping:25.0];
  [(AMUIBatteryChargingRingView *)self _initialRingCenterPosition];
  double v7 = v6;
  objc_super v8 = [(PLPlatterView *)self->_grabberView layer];
  uint64_t v9 = [v8 valueForKeyPath:@"position.y"];
  [v9 floatValue];
  double v27 = v10;

  BOOL v11 = [NSNumber numberWithDouble:v7];
  double v12 = [NSNumber numberWithDouble:v7 + -200.0];
  double v36 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"position.y" duration:v11 delay:v12 fromValue:v5 toValue:1.277 fillMode:6.33 stiffness:300.0 mass:3.0 damping:35.0];

  double v35 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"shadownOpacity" duration:&unk_26FBDB270 delay:&unk_26FBDB1F0 fromValue:v5 toValue:0.8 fillMode:6.2 stiffness:300.0 mass:2.0 damping:50.0];
  double v34 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"filters.gaussianBlur.inputRadius" duration:&unk_26FBDB1F0 delay:&unk_26FBDB230 fromValue:v5 toValue:1.277 fillMode:6.3035 stiffness:300.0 mass:3.0 damping:35.0];
  double v25 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"transform.scale.xy" duration:&unk_26FBDB210 delay:&unk_26FBDB270 fromValue:v5 toValue:0.9392 fillMode:6.23778 stiffness:300.0 mass:3.0 damping:50.0];
  double v29 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"transform.scale.xy" duration:&unk_26FBDB210 delay:&unk_26FBDB1F0 fromValue:v5 toValue:0.9392 fillMode:6.2 stiffness:300.0 mass:3.0 damping:50.0];
  long long v13 = [NSNumber numberWithDouble:v27];
  double v28 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"position.y" duration:v13 delay:&unk_26FBDB280 fromValue:v5 toValue:2.2328 fillMode:6.33 stiffness:100.0 mass:3.0 damping:20.0];

  long long v14 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"opacity" duration:&unk_26FBDB1F0 delay:&unk_26FBDB210 fromValue:v5 toValue:1.0 fillMode:6.4023 stiffness:200.0 mass:2.0 damping:100.0];
  double v26 = [(AMUIBatteryChargingRingView *)self _springAnimationForKeyPath:@"opacity" duration:&unk_26FBDB210 delay:&unk_26FBDB1F0 fromValue:v5 toValue:1.6 fillMode:8.2 stiffness:300.0 mass:8.0 damping:100.0];
  [(AMUIBatteryChargingRingView *)self _addGaussianBlurToLayerIfNeeded:self->_magSafeLayer inputRadius:0.0];
  [(AMUIBatteryChargingRingView *)self _addGaussianBlurToLayerIfNeeded:self->_chargingBoltGlyph inputRadius:50.0];
  [(AMUIBatteryChargingRingView *)self _addGaussianBlurToLayerIfNeeded:self->_batteryLevelRing inputRadius:0.0];
  long long v15 = [(UILabel *)self->_chargePercentLabel layer];
  [(AMUIBatteryChargingRingView *)self _addGaussianBlurToLayerIfNeeded:v15 inputRadius:40.0];

  [(CALayer *)self->_magSafeLayer setValue:&unk_26FBDB200 forKey:@"transform.scale.xy"];
  long long v16 = [(UILabel *)self->_chargePercentLabel layer];
  [v16 setValue:&unk_26FBDB1F0 forKey:@"transform.scale.xy"];

  double v17 = [(PLPlatterView *)self->_grabberView layer];
  [v17 setOpacity:0.0];

  [(CALayer *)self->_magSafeLayer addAnimation:v44 forKey:@"magSafeFadeInAnimation"];
  [(CALayer *)self->_magSafeLayer addAnimation:v45 forKey:@"magSafeScaleAnimation"];
  [(CALayer *)self->_magSafeLayer addAnimation:v36 forKey:@"magSafeMoveUpAnimation"];
  [(CALayer *)self->_magSafeLayer addAnimation:v34 forKey:@"dissappearBlurAnimation"];
  [(CALayer *)self->_magSafeLayer addAnimation:v25 forKey:@"dissappearScaleOutAnimation"];
  [(CALayer *)self->_magSafeLayer addAnimation:v35 forKey:@"shadowFadeOutAnimation"];
  [(CALayer *)self->_ringContainerLayer addAnimation:v41 forKey:@"containerRingScaleInAnimation"];
  [(CALayer *)self->_ringLayer addAnimation:v40 forKey:@"ringScaleOutAnimation"];
  [(CALayer *)self->_chargingBoltGlyph addAnimation:v43 forKey:@"chargingBoltScaleAnimation"];
  [(CALayer *)self->_chargingBoltGlyph addAnimation:v42 forKey:@"chargingBoltFadeInAnimation"];
  [(CALayer *)self->_chargingBoltGlyph addAnimation:v39 forKey:@"chargingBoltBlurInAnimation"];
  [(CALayer *)self->_chargingBoltGlyph addAnimation:v38 forKey:@"chargingBoltBlurOutAnimation"];
  [(CALayer *)self->_chargingBoltGlyph addAnimation:v37 forKey:@"chargingBoltScaleOutAnimation"];
  [(CALayer *)self->_chargingBoltGlyph addAnimation:v33 forKey:@"chargingBoltFadeOutAnimation"];
  [(AMUIRingLayer *)self->_batteryLevelRing setValue:&unk_26FBDB1F0 forKey:@"strokeEnd"];
  [(AMUIRingLayer *)self->_batteryLevelRing addAnimation:v46 forKey:@"levelRingStrokeEndAnimation"];
  uint64_t v18 = [(UILabel *)self->_chargePercentLabel layer];
  [v18 addAnimation:v30 forKey:@"chargingLabelFadeInAnimation"];

  id v19 = [(UILabel *)self->_chargePercentLabel layer];
  [v19 addAnimation:v31 forKey:@"chargingLabelBlurInAnimation"];

  double v20 = [(UILabel *)self->_chargePercentLabel layer];
  [v20 addAnimation:v32 forKey:@"chargingLabelScaleInAnimation"];

  double v21 = [(UILabel *)self->_chargePercentLabel layer];
  [v21 addAnimation:v29 forKey:@"chargingLabelDissappearScaleOutAnimation"];

  double v22 = [(PLPlatterView *)self->_grabberView layer];
  [v22 addAnimation:v28 forKey:@"grabberMoveUpAnimation"];

  double v23 = [(PLPlatterView *)self->_grabberView layer];
  [v23 addAnimation:v14 forKey:@"grabberFadeInAnimation"];

  v24 = [(PLPlatterView *)self->_grabberView layer];
  [v24 addAnimation:v26 forKey:@"grabberFadeOutAnimation"];
}

- (id)_ringLayerForRingConfiguration:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a3;
    [v4 ringDiameter];
    double v6 = v5;
    [v4 lineWidth];
    double v8 = v7;

    uint64_t v9 = +[AMUIRingLayer ringWithDiameter:v6 lineWidth:v8];
    [v9 setStrokeStart:0.0];
    [v9 setStrokeEnd:0.0];
    [v9 setLineCap:*MEMORY[0x263F15E70]];
    if ([(AMUIBatteryChargingRingView *)self _isReduceMotionEnabled])
    {
      [v9 setOpacity:0.0];
    }
    else
    {
      LODWORD(v10) = 1.0;
      [v9 setOpacity:v10];
      Mutable = CGPathCreateMutable();
      [v9 setPath:Mutable];
      CGPathRelease(Mutable);
    }
    double v12 = [MEMORY[0x263F157C8] brightnessFilterWithAmount:0.1];
    v15[0] = v12;
    long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [v9 setFilters:v13];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (CGPath)_pathForRingConfiguration:(id)a3
{
  id v3 = a3;
  [v3 ringDiameter];
  double v5 = v4;
  [v3 lineWidth];
  double v7 = v6;

  return +[AMUIRingLayer newPathForDiameter:v5 lineWidth:v7];
}

- (id)_trackRingForRingConfiguration:(id)a3 withBlendMode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 ringDiameter];
  double v8 = v7;
  [v6 lineWidth];
  double v10 = v9;

  BOOL v11 = +[AMUIRingLayer ringLayerWithBlendMode:v5 diameter:v8 lineWidth:v10 brightnessAmount:0.2 saturationAmount:1.25];

  return v11;
}

- (id)_springAnimationForKeyPath:(id)a3 duration:(double)a4 delay:(double)a5 fromValue:(id)a6 toValue:(id)a7 fillMode:(id)a8 stiffness:(double)a9 mass:(double)a10 damping:(double)a11
{
  id v19 = (void *)MEMORY[0x263F15890];
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  double v23 = [v19 animationWithKeyPath:a3];
  double v24 = CACurrentMediaTime();
  double v25 = -0.0;
  if (a5 != 0.0) {
    double v25 = a5;
  }
  [v23 setBeginTime:v24 + v25];
  [v23 setFillMode:v20];

  [v23 setRemovedOnCompletion:0];
  [v23 setFromValue:v22];

  [v23 setToValue:v21];
  [v23 setMass:a10];
  [v23 setStiffness:a9];
  [v23 setDamping:a11];
  [v23 setDuration:a4];

  return v23;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AMUIBatteryChargingRingView;
  id v5 = -[AMUIBatteryChargingView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v6 = [v5 layer];
  double v7 = v6;
  if (v6 == (AMUIRingLayer *)self->_chargingBoltGlyph
    || v6 == self->_batteryLevelRing
    || v6 == self->_trackFillRingLayer)
  {
    id v8 = v5;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (AMUIBatteryChargingUIConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (CALayer)chargingBoltGlyph
{
  return self->_chargingBoltGlyph;
}

- (void)setChargingBoltGlyph:(id)a3
{
}

- (UILabel)chargePercentLabel
{
  return self->_chargePercentLabel;
}

- (void)setChargePercentLabel:(id)a3
{
}

- (AMUIRingLayer)batteryLevelRing
{
  return self->_batteryLevelRing;
}

- (void)setBatteryLevelRing:(id)a3
{
}

- (AMUIRingLayer)trackFillRingLayer
{
  return self->_trackFillRingLayer;
}

- (void)setTrackFillRingLayer:(id)a3
{
}

- (CALayer)magSafeLayer
{
  return self->_magSafeLayer;
}

- (void)setMagSafeLayer:(id)a3
{
}

- (CALayer)chargeRingLayer
{
  return self->_chargeRingLayer;
}

- (void)setChargeRingLayer:(id)a3
{
}

- (CALayer)ringContainerLayer
{
  return self->_ringContainerLayer;
}

- (void)setRingContainerLayer:(id)a3
{
}

- (CALayer)ringLayer
{
  return self->_ringLayer;
}

- (void)setRingLayer:(id)a3
{
}

- (UIView)chargingContainerView
{
  return self->_chargingContainerView;
}

- (void)setChargingContainerView:(id)a3
{
}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (PLPlatterView)grabberView
{
  return self->_grabberView;
}

- (void)setGrabberView:(id)a3
{
}

- (BCBatteryDevice)internalBattery
{
  return self->_internalBattery;
}

- (void)setInternalBattery:(id)a3
{
}

- (AMUIPowerStatus)internalStatus
{
  return self->_internalStatus;
}

- (void)setInternalStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalStatus, 0);
  objc_storeStrong((id *)&self->_internalBattery, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_chargingContainerView, 0);
  objc_storeStrong((id *)&self->_ringLayer, 0);
  objc_storeStrong((id *)&self->_ringContainerLayer, 0);
  objc_storeStrong((id *)&self->_chargeRingLayer, 0);
  objc_storeStrong((id *)&self->_magSafeLayer, 0);
  objc_storeStrong((id *)&self->_trackFillRingLayer, 0);
  objc_storeStrong((id *)&self->_batteryLevelRing, 0);
  objc_storeStrong((id *)&self->_chargePercentLabel, 0);
  objc_storeStrong((id *)&self->_chargingBoltGlyph, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end