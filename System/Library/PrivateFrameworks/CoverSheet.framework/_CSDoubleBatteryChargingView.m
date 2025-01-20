@interface _CSDoubleBatteryChargingView
- (BOOL)batteryVisible;
- (_CSDoubleBatteryChargingView)initWithFrame:(CGRect)a3;
- (double)_batteryTopPadding;
- (double)_chargingBoltTopOffset;
- (double)_deviceChargeBaselineOffset;
- (double)_deviceNameBaselineOffset;
- (double)_spaceBetweenBatteryImages;
- (double)desiredVisibilityDuration;
- (id)_chargePercentFont;
- (int64_t)batteryCount;
- (void)layoutSubviews;
- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4;
- (void)setBatteryVisible:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setPrimaryBatteryText:(id)a3 forBattery:(id)a4;
- (void)setSecondaryBatteryText:(id)a3 forBattery:(id)a4;
@end

@implementation _CSDoubleBatteryChargingView

- (_CSDoubleBatteryChargingView)initWithFrame:(CGRect)a3
{
  v58.receiver = self;
  v58.super_class = (Class)_CSDoubleBatteryChargingView;
  v3 = -[CSBatteryChargingView initWithFrame:](&v58, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v57 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v56 = +[CSBatteryChargingView maskImageNameForInternalChargingBattery];
    v55 = +[CSBatteryChargingView maskImageNameForExternalChargingBattery];
    v4 = [MEMORY[0x1E4F42A80] imageNamed:v56 inBundle:v57];
    v5 = [MEMORY[0x1E4F42A80] imageNamed:v55 inBundle:v57];
    [v4 size];
    double v7 = v6;
    double v9 = v8;
    [v5 size];
    double v11 = v10;
    double v13 = v12;
    v14 = [CSBatteryFillView alloc];
    uint64_t v15 = -[CSBatteryFillView initWithFrame:isInternalBattery:lowBatteryLevel:](v14, "initWithFrame:isInternalBattery:lowBatteryLevel:", 1, [MEMORY[0x1E4F42E28] lowBatteryLevel], 0.0, 0.0, v7, v9);
    internalBatteryFillView = v3->_internalBatteryFillView;
    v3->_internalBatteryFillView = (CSBatteryFillView *)v15;

    v17 = v3->_internalBatteryFillView;
    v18 = [MEMORY[0x1E4F428B8] clearColor];
    [(CSBatteryFillView *)v17 setBackgroundColor:v18];

    v19 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:2020];
    [v19 setRenderingHint:1];
    [v19 setGrayscaleTintMaskImage:v4];
    [v19 setColorTintMaskImage:v4];
    [v19 setFilterMaskImage:v4];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F430A8]), "initWithFrame:settings:", v19, 0.0, 0.0, v7, v9);
    internalBatteryBlurView = v3->_internalBatteryBlurView;
    v3->_internalBatteryBlurView = (_UIBackdropView *)v20;

    v22 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v4];
    objc_msgSend(v22, "setFrame:", 0.0, 0.0, v7, v9);
    [(CSBatteryFillView *)v3->_internalBatteryFillView setMaskView:v22];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, v7, v9);
    internalBatteryContainerView = v3->_internalBatteryContainerView;
    v3->_internalBatteryContainerView = (UIView *)v23;

    v25 = v3->_internalBatteryContainerView;
    v26 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v25 setBackgroundColor:v26];

    [(UIView *)v3->_internalBatteryContainerView setAutoresizingMask:18];
    [(UIView *)v3->_internalBatteryContainerView setClipsToBounds:1];
    [(UIView *)v3->_internalBatteryContainerView addSubview:v3->_internalBatteryBlurView];
    [(UIView *)v3->_internalBatteryContainerView addSubview:v3->_internalBatteryFillView];
    v27 = [(_UIBackdropView *)v3->_internalBatteryBlurView inputSettings];
    [v27 setGrayscaleTintMaskImage:v4];

    v28 = [(_UIBackdropView *)v3->_internalBatteryBlurView inputSettings];
    [v28 setColorTintMaskImage:v4];

    v29 = [(_UIBackdropView *)v3->_internalBatteryBlurView inputSettings];
    [v29 setFilterMaskImage:v4];

    v30 = -[CSBatteryFillView initWithFrame:isInternalBattery:lowBatteryLevel:]([CSBatteryFillView alloc], "initWithFrame:isInternalBattery:lowBatteryLevel:", 0, 20, 0.0, 0.0, v11, v13);
    externalBatteryFillView = v3->_externalBatteryFillView;
    v3->_externalBatteryFillView = v30;

    v32 = v3->_externalBatteryFillView;
    v33 = [MEMORY[0x1E4F428B8] clearColor];
    [(CSBatteryFillView *)v32 setBackgroundColor:v33];

    v34 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:2020];
    [v34 setRenderingHint:1];
    [v34 setGrayscaleTintMaskImage:v5];
    [v34 setColorTintMaskImage:v5];
    v54 = v5;
    [v34 setFilterMaskImage:v5];
    uint64_t v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F430A8]), "initWithFrame:settings:", v34, 0.0, 0.0, v11, v13);
    externalBatteryBlurView = v3->_externalBatteryBlurView;
    v3->_externalBatteryBlurView = (_UIBackdropView *)v35;

    v37 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v5];
    objc_msgSend(v37, "setFrame:", 0.0, 0.0, v11, v13);
    [(CSBatteryFillView *)v3->_externalBatteryFillView setMaskView:v37];
    uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, v11, v13);
    externalBatteryContainerView = v3->_externalBatteryContainerView;
    v3->_externalBatteryContainerView = (UIView *)v38;

    v40 = v3->_externalBatteryContainerView;
    v41 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v40 setBackgroundColor:v41];

    [(UIView *)v3->_externalBatteryContainerView setAutoresizingMask:18];
    [(UIView *)v3->_externalBatteryContainerView setClipsToBounds:1];
    [(UIView *)v3->_externalBatteryContainerView addSubview:v3->_externalBatteryBlurView];
    [(UIView *)v3->_externalBatteryContainerView addSubview:v3->_externalBatteryFillView];
    v42 = [MEMORY[0x1E4F42A80] imageNamed:@"LockScreenSmallChargingBolt" inBundle:v57];
    v43 = [v42 imageWithRenderingMode:2];

    uint64_t v44 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v43];
    internalChargingIndicator = v3->_internalChargingIndicator;
    v3->_internalChargingIndicator = (UIImageView *)v44;

    uint64_t v46 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v43];
    externalChargingIndicator = v3->_externalChargingIndicator;
    v3->_externalChargingIndicator = (UIImageView *)v46;

    [(_CSDoubleBatteryChargingView *)v3 addSubview:v3->_internalChargingIndicator];
    [(_CSDoubleBatteryChargingView *)v3 addSubview:v3->_externalChargingIndicator];
    [(_CSDoubleBatteryChargingView *)v3 _spaceBetweenBatteryImages];
    uint64_t v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, v7 + v11 + v48, v9);
    batteryContainerView = v3->_batteryContainerView;
    v3->_batteryContainerView = (UIView *)v49;

    v51 = v3->_batteryContainerView;
    v52 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v51 setBackgroundColor:v52];

    [(UIView *)v3->_batteryContainerView addSubview:v3->_internalBatteryContainerView];
    [(UIView *)v3->_batteryContainerView addSubview:v3->_externalBatteryContainerView];
    [(_CSDoubleBatteryChargingView *)v3 addSubview:v3->_batteryContainerView];
    [(UIView *)v3->_batteryContainerView setAlpha:0.0];
  }
  return v3;
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

  [(_CSDoubleBatteryChargingView *)self setNeedsLayout];
}

- (int64_t)batteryCount
{
  return 2;
}

- (double)desiredVisibilityDuration
{
  return 3.5;
}

- (void)setLegibilitySettings:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)_CSDoubleBatteryChargingView;
  id v4 = a3;
  [(CSBatteryChargingView *)&v17 setLegibilitySettings:v4];
  internalChargingNameLabel = self->_internalChargingNameLabel;
  double v6 = [(CSBatteryChargingView *)self legibilitySettings];
  [(SBUILegibilityLabel *)internalChargingNameLabel setLegibilitySettings:v6];

  externalChargingNameLabel = self->_externalChargingNameLabel;
  double v8 = [(CSBatteryChargingView *)self legibilitySettings];
  [(SBUILegibilityLabel *)externalChargingNameLabel setLegibilitySettings:v8];

  internalChargePercentLabel = self->_internalChargePercentLabel;
  double v10 = [(CSBatteryChargingView *)self legibilitySettings];
  [(SBUILegibilityLabel *)internalChargePercentLabel setLegibilitySettings:v10];

  externalChargePercentLabel = self->_externalChargePercentLabel;
  double v12 = [(CSBatteryChargingView *)self legibilitySettings];
  [(SBUILegibilityLabel *)externalChargePercentLabel setLegibilitySettings:v12];

  internalChargingIndicator = self->_internalChargingIndicator;
  v14 = [v4 primaryColor];
  [(UIImageView *)internalChargingIndicator setTintColor:v14];

  externalChargingIndicator = self->_externalChargingIndicator;
  v16 = [v4 primaryColor];

  [(UIImageView *)externalChargingIndicator setTintColor:v16];
}

- (void)setPrimaryBatteryText:(id)a3 forBattery:(id)a4
{
  id v22 = a4;
  double v6 = [(CSBatteryChargingView *)self _updateChargeString:a3 oldLabel:self->_internalChargePercentLabel];
  internalChargePercentLabel = self->_internalChargePercentLabel;
  self->_internalChargePercentLabel = v6;

  -[CSBatteryFillView setChargePercentage:](self->_internalBatteryFillView, "setChargePercentage:", [v22 percentCharge]);
  if (!self->_internalChargingNameLabel)
  {
    double v8 = [MEMORY[0x1E4FA5F38] rootSettings];
    double v9 = [(CSBatteryChargingView *)self legibilitySettings];
    objc_msgSend(v8, "dateStrengthForStyle:", objc_msgSend(v9, "style"));
    double v11 = v10;

    id v12 = objc_alloc(MEMORY[0x1E4FA7CA0]);
    double v13 = [(CSBatteryChargingView *)self legibilitySettings];
    v14 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v15 = [v14 model];
    v16 = [(_CSDoubleBatteryChargingView *)self _chargePercentFont];
    objc_super v17 = (SBUILegibilityLabel *)[v12 initWithSettings:v13 strength:v15 string:v16 font:v11];
    internalChargingNameLabel = self->_internalChargingNameLabel;
    self->_internalChargingNameLabel = v17;

    [(_CSDoubleBatteryChargingView *)self addSubview:self->_internalChargingNameLabel];
  }
  internalChargingIndicator = self->_internalChargingIndicator;
  int v20 = [v22 isCharging];
  double v21 = 0.0;
  if (v20) {
    double v21 = 1.0;
  }
  [(UIImageView *)internalChargingIndicator setAlpha:v21];
  [(_CSDoubleBatteryChargingView *)self setNeedsLayout];
}

- (void)setSecondaryBatteryText:(id)a3 forBattery:(id)a4
{
  externalChargePercentLabel = self->_externalChargePercentLabel;
  id v7 = a4;
  double v8 = [(CSBatteryChargingView *)self _updateChargeString:a3 oldLabel:externalChargePercentLabel];
  double v9 = self->_externalChargePercentLabel;
  self->_externalChargePercentLabel = v8;

  -[CSBatteryFillView setChargePercentage:](self->_externalBatteryFillView, "setChargePercentage:", [v7 percentCharge]);
  [(SBUILegibilityLabel *)self->_externalChargingNameLabel removeFromSuperview];
  double v10 = [MEMORY[0x1E4FA5F38] rootSettings];
  double v11 = [(CSBatteryChargingView *)self legibilitySettings];
  objc_msgSend(v10, "dateStrengthForStyle:", objc_msgSend(v11, "style"));
  double v13 = v12;

  id v14 = objc_alloc(MEMORY[0x1E4FA7CA0]);
  uint64_t v15 = [(CSBatteryChargingView *)self legibilitySettings];
  v16 = [v7 name];
  objc_super v17 = [(_CSDoubleBatteryChargingView *)self _chargePercentFont];
  v18 = (SBUILegibilityLabel *)[v14 initWithSettings:v15 strength:v16 string:v17 font:v13];
  externalChargingNameLabel = self->_externalChargingNameLabel;
  self->_externalChargingNameLabel = v18;

  [(_CSDoubleBatteryChargingView *)self addSubview:self->_externalChargingNameLabel];
  externalChargingIndicator = self->_externalChargingIndicator;
  LODWORD(v15) = [v7 isCharging];

  double v21 = 0.0;
  if (v15) {
    double v21 = 1.0;
  }
  [(UIImageView *)externalChargingIndicator setAlpha:v21];

  [(_CSDoubleBatteryChargingView *)self setNeedsLayout];
}

- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)layoutSubviews
{
  v119.receiver = self;
  v119.super_class = (Class)_CSDoubleBatteryChargingView;
  [(_CSDoubleBatteryChargingView *)&v119 layoutSubviews];
  [(_CSDoubleBatteryChargingView *)self bounds];
  double v4 = v3;
  [(UIView *)self->_batteryContainerView frame];
  double v6 = v5;
  double v8 = v7;
  CGFloat v111 = v5;
  CGFloat v112 = v7;
  float v9 = (v4 - v5) * 0.5;
  double v110 = floorf(v9);
  [(_CSDoubleBatteryChargingView *)self _batteryTopPadding];
  CGFloat v109 = v10;
  -[UIView setFrame:](self->_batteryContainerView, "setFrame:", v110, v10, v6, v8);
  double v11 = (void **)MEMORY[0x1E4F43630];
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    double v12 = &OBJC_IVAR____CSDoubleBatteryChargingView__internalBatteryContainerView;
  }
  else {
    double v12 = &OBJC_IVAR____CSDoubleBatteryChargingView__externalBatteryContainerView;
  }
  double v13 = *v11;
  id v14 = *(id *)((char *)&self->super.super.super.super.super.super.isa + *v12);
  if ([v13 userInterfaceLayoutDirection] == 1) {
    uint64_t v15 = &OBJC_IVAR____CSDoubleBatteryChargingView__externalBatteryContainerView;
  }
  else {
    uint64_t v15 = &OBJC_IVAR____CSDoubleBatteryChargingView__internalBatteryContainerView;
  }
  id v16 = *(id *)((char *)&self->super.super.super.super.super.super.isa + *v15);
  [v14 frame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v21 = *MEMORY[0x1E4F1DAD8];
  double v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_msgSend(v14, "setFrame:", *MEMORY[0x1E4F1DAD8], v22);
  [v16 frame];
  double v24 = v23;
  double v26 = v25;
  v120.origin.x = v21;
  v120.origin.y = v22;
  v120.size.width = v18;
  v120.size.height = v20;
  double MaxX = CGRectGetMaxX(v120);
  [(_CSDoubleBatteryChargingView *)self _spaceBetweenBatteryImages];
  objc_msgSend(v16, "setFrame:", MaxX + v28, 0.0, v24, v26);
  v29 = [(_CSDoubleBatteryChargingView *)self _chargePercentFont];
  [(UIView *)self->_externalBatteryContainerView frame];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  [(UIView *)self->_internalBatteryContainerView frame];
  -[_CSDoubleBatteryChargingView convertRect:fromView:](self, "convertRect:fromView:", self->_batteryContainerView);
  CGFloat v39 = v38;
  CGFloat v108 = v38;
  CGFloat v41 = v40;
  CGFloat v117 = v42;
  CGFloat v118 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  -[_CSDoubleBatteryChargingView convertRect:fromView:](self, "convertRect:fromView:", self->_batteryContainerView, v31, v33, v35, v37);
  CGFloat v114 = v47;
  CGFloat v115 = v46;
  CGFloat rect = v48;
  CGFloat v50 = v49;
  CGFloat v116 = v49;
  [(UIImageView *)self->_internalChargingIndicator frame];
  double v52 = v51;
  double v106 = v53;
  v121.origin.x = v39;
  v121.origin.y = v41;
  v121.size.width = v43;
  v121.size.height = v45;
  CGFloat MidX = CGRectGetMidX(v121);
  float v55 = v52 * 0.5;
  CGFloat v56 = MidX - floorf(v55);
  v122.origin.x = v110;
  v122.origin.y = v109;
  v122.size.width = v111;
  v122.size.height = v112;
  double MaxY = CGRectGetMaxY(v122);
  [(_CSDoubleBatteryChargingView *)self _chargingBoltTopOffset];
  -[UIImageView setFrame:](self->_internalChargingIndicator, "setFrame:", v56, MaxY + v58, v52, v106);
  [(UIImageView *)self->_externalChargingIndicator frame];
  double v60 = v59;
  double v107 = v61;
  v123.origin.y = v114;
  v123.origin.x = v115;
  v123.size.width = rect;
  v123.size.height = v50;
  CGFloat v62 = CGRectGetMidX(v123);
  float v63 = v60 * 0.5;
  CGFloat v64 = v62 - floorf(v63);
  v124.origin.x = v110;
  v124.origin.y = v109;
  v124.size.width = v111;
  v124.size.height = v112;
  double v65 = CGRectGetMaxY(v124);
  [(_CSDoubleBatteryChargingView *)self _chargingBoltTopOffset];
  -[UIImageView setFrame:](self->_externalChargingIndicator, "setFrame:", v64, v65 + v66, v60, v107);
  v125.origin.x = v110;
  v125.origin.y = v109;
  v125.size.width = v111;
  v125.size.height = v112;
  double v67 = CGRectGetMaxY(v125);
  [(_CSDoubleBatteryChargingView *)self _deviceNameBaselineOffset];
  double v69 = v67 + v68;
  [v29 descender];
  double v71 = v69 - ceil(v70);
  [v29 _bodyLeading];
  CGFloat v73 = round(v71 - v72);
  [(SBUILegibilityLabel *)self->_internalChargingNameLabel sizeToFit];
  [(SBUILegibilityLabel *)self->_internalChargingNameLabel frame];
  double v75 = v74;
  double v77 = v76;
  v126.origin.x = v108;
  v126.size.width = v117;
  v126.origin.y = v118;
  v126.size.height = v45;
  CGFloat v78 = CGRectGetMidX(v126);
  float v79 = v75 * 0.5;
  -[SBUILegibilityLabel setFrame:](self->_internalChargingNameLabel, "setFrame:", v78 - floorf(v79), v73, v75, v77);
  [(SBUILegibilityLabel *)self->_externalChargingNameLabel sizeToFit];
  [(SBUILegibilityLabel *)self->_externalChargingNameLabel frame];
  double v81 = v80;
  double v83 = v82;
  v127.origin.x = v115;
  v127.origin.y = v114;
  v127.size.width = rect;
  v127.size.height = v116;
  CGFloat v84 = CGRectGetMidX(v127);
  float v85 = v81 * 0.5;
  CGFloat v86 = v84 - floorf(v85);
  -[SBUILegibilityLabel setFrame:](self->_externalChargingNameLabel, "setFrame:", v86, v73, v81, v83);
  v128.origin.x = v86;
  v128.origin.y = v73;
  v128.size.width = v81;
  v128.size.height = v83;
  double v87 = CGRectGetMaxY(v128);
  [(_CSDoubleBatteryChargingView *)self _deviceChargeBaselineOffset];
  double v89 = v87 + v88;
  [v29 descender];
  double v91 = v89 - ceil(v90);
  [v29 _bodyLeading];
  double v93 = round(v91 - v92);
  [(SBUILegibilityLabel *)self->_internalChargePercentLabel sizeToFit];
  [(SBUILegibilityLabel *)self->_internalChargePercentLabel frame];
  double v95 = v94;
  double v97 = v96;
  v129.origin.x = v108;
  v129.size.width = v117;
  v129.origin.y = v118;
  v129.size.height = v45;
  CGFloat v98 = CGRectGetMidX(v129);
  float v99 = v95 * 0.5;
  -[SBUILegibilityLabel setFrame:](self->_internalChargePercentLabel, "setFrame:", v98 - floorf(v99), v93, v95, v97);
  [(SBUILegibilityLabel *)self->_externalChargePercentLabel sizeToFit];
  [(SBUILegibilityLabel *)self->_externalChargePercentLabel frame];
  double v101 = v100;
  double v103 = v102;
  v130.origin.x = v115;
  v130.origin.y = v114;
  v130.size.width = rect;
  v130.size.height = v116;
  CGFloat v104 = CGRectGetMidX(v130);
  float v105 = v101 * 0.5;
  -[SBUILegibilityLabel setFrame:](self->_externalChargePercentLabel, "setFrame:", v104 - floorf(v105), v93, v101, v103);
}

- (double)_spaceBetweenBatteryImages
{
  if (__sb__runningInSpringBoard())
  {
    BOOL v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    double v3 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v2 = [v3 userInterfaceIdiom] == 1;
  }
  double result = 15.0;
  if (v2) {
    return 20.0;
  }
  return result;
}

- (double)_batteryTopPadding
{
  [(CSBatteryChargingView *)self _batteryCenter];
  double v4 = v3;
  [(CSBatteryChargingView *)self _batteryHeight];
  return v4 + v5 * -0.5;
}

- (double)_chargingBoltTopOffset
{
  if (__sb__runningInSpringBoard())
  {
    BOOL v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    double v3 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v2 = [v3 userInterfaceIdiom] == 1;
  }
  double result = 5.0;
  if (v2) {
    return 10.0;
  }
  return result;
}

- (double)_deviceNameBaselineOffset
{
  if (__sb__runningInSpringBoard())
  {
    BOOL v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    double v3 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v2 = [v3 userInterfaceIdiom] == 1;
  }
  double result = 33.0;
  if (v2) {
    return 60.0;
  }
  return result;
}

- (double)_deviceChargeBaselineOffset
{
  return 20.0;
}

- (id)_chargePercentFont
{
  BOOL v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [MEMORY[0x1E4F5E4D0] fontSizeForElementType:2 isLandscapeVariant:0];
    double v5 = v4;
    [MEMORY[0x1E4F5E4D0] fontWeightForElementType:2];
    [MEMORY[0x1E4F42A30] systemFontOfSize:v5 weight:v6];
  }
  else
  {
    [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  double v7 = };

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalChargingIndicator, 0);
  objc_storeStrong((id *)&self->_internalChargingIndicator, 0);
  objc_storeStrong((id *)&self->_externalChargingNameLabel, 0);
  objc_storeStrong((id *)&self->_internalChargingNameLabel, 0);
  objc_storeStrong((id *)&self->_externalChargePercentLabel, 0);
  objc_storeStrong((id *)&self->_internalChargePercentLabel, 0);
  objc_storeStrong((id *)&self->_externalBatteryFillView, 0);
  objc_storeStrong((id *)&self->_internalBatteryFillView, 0);
  objc_storeStrong((id *)&self->_externalBatteryBlurView, 0);
  objc_storeStrong((id *)&self->_internalBatteryBlurView, 0);
  objc_storeStrong((id *)&self->_externalBatteryContainerView, 0);
  objc_storeStrong((id *)&self->_internalBatteryContainerView, 0);

  objc_storeStrong((id *)&self->_batteryContainerView, 0);
}

@end