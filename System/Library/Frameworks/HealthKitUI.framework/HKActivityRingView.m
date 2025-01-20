@interface HKActivityRingView
- (BOOL)_shouldBypassApplicationStateChecking;
- (HKActivityRingView)initWithCoder:(id)a3;
- (HKActivityRingView)initWithFrame:(CGRect)a3;
- (HKActivityRingView)initWithFrame:(CGRect)a3 renderer:(id)a4;
- (HKActivitySummary)activitySummary;
- (double)_emptyRingAlpha;
- (double)_ringDiameter;
- (double)_ringInsetPercentage;
- (id)_snapshotImage;
- (void)_displayIconsForWheelchairUser:(BOOL)a3;
- (void)_setActivityRingViewBackgroundColor:(id)a3;
- (void)_setActivityRingViewBackgroundTransparent:(BOOL)a3;
- (void)_setActivitySummary:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setEmptyRingAlpha:(double)a3;
- (void)_setRingDiameter:(double)a3 ringInterspacing:(double)a4 ringThickness:(double)a5;
- (void)_setRingInsetPercentage:(double)a3;
- (void)_setShouldBypassApplicationStateChecking:(BOOL)a3;
- (void)_setUpAfterInit;
- (void)_setUpRingsView;
- (void)_updateAndInterpolateRingsViewDiameterForWidth:(double)a3 lowerDirective:(id)a4 higherDirective:(id)a5;
- (void)_updateMaskPath;
- (void)_updateRingsViewDiameter;
- (void)_updateRingsViewDiameterLegacy;
- (void)layoutSubviews;
- (void)setActivitySummary:(HKActivitySummary *)activitySummary;
- (void)setActivitySummary:(HKActivitySummary *)activitySummary animated:(BOOL)animated;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation HKActivityRingView

- (HKActivityRingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKActivityRingView;
  v3 = -[HKActivityRingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HKActivityRingView *)v3 _setUpAfterInit];
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKActivityRingView;
  -[HKActivityRingView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(HKActivityRingView *)self _updateMaskPath];
}

- (void)_updateMaskPath
{
  [(HKActivityRingView *)self bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGRectGetWidth(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetHeight(v11);
  v7 = (void *)MEMORY[0x263F824C0];
  [(ARUIRingsView *)self->_ringsView bounds];
  objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(_HKShapeView *)self->_maskView setPath:v8];
}

- (void)_setUpAfterInit
{
  self->_ringInsetPercentage = 0.15;
  self->_emptyRingAlpha = 0.15;
  [(HKActivityRingView *)self setOpaque:0];
  v3 = [MEMORY[0x263F825C8] clearColor];
  [(HKActivityRingView *)self setBackgroundColor:v3];

  [(HKActivityRingView *)self _setUpRingsView];
  [(HKActivityRingView *)self setActivitySummary:0 animated:0];

  [(HKActivityRingView *)self _updateMaskPath];
}

- (void)_setUpRingsView
{
  v37[3] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F23950] energyColors];
  objc_super v4 = [MEMORY[0x263F23950] briskColors];
  v5 = [MEMORY[0x263F23950] sedentaryColors];
  objc_super v6 = [v3 gradientDarkColor];
  v37[0] = v6;
  v7 = [v4 gradientDarkColor];
  v37[1] = v7;
  id v8 = [v5 gradientDarkColor];
  v37[2] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:3];

  v35 = v3;
  CGRect v10 = [v3 gradientLightColor];
  v36[0] = v10;
  CGRect v11 = [v4 gradientLightColor];
  v36[1] = v11;
  v12 = [v5 gradientLightColor];
  v36[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];

  v14 = [MEMORY[0x263F23968] activityRingGroup];
  LODWORD(v15) = 1132134400;
  [v14 setGroupDiameter:v15];
  LODWORD(v16) = 2.0;
  [v14 setInterspacing:v16];
  LODWORD(v17) = 27.0;
  [v14 setThickness:v17];
  uint64_t v18 = 0;
  uint64_t v19 = -1;
  do
  {
    uint64_t v20 = [v9 count] + v19;
    [v14 setPercentage:v18 ofRingAtIndex:0 animated:0.0];
    v21 = [v9 objectAtIndexedSubscript:v20];
    v22 = [v13 objectAtIndexedSubscript:v20];
    [v14 setTopColor:v21 bottomColor:v22 ofRingAtIndex:v18];

    ++v18;
    --v19;
  }
  while (v18 != 3);
  renderer = self->_renderer;
  id v24 = objc_alloc(MEMORY[0x263F23980]);
  if (renderer) {
    v25 = (ARUIRingsView *)[v24 initWithRingGroup:v14 renderer:self->_renderer];
  }
  else {
    v25 = (ARUIRingsView *)[v24 initWithRingGroup:v14];
  }
  ringsView = self->_ringsView;
  self->_ringsView = v25;

  [(HKActivityRingView *)self _emptyRingAlpha];
  float v28 = v27;
  v29 = [(ARUIRingsView *)self->_ringsView ringGroup];
  *(float *)&double v30 = v28;
  [v29 setEmptyOpacity:v30];

  [(ARUIRingsView *)self->_ringsView setPaused:1];
  v31 = self->_ringsView;
  v32 = [MEMORY[0x263F825C8] blackColor];
  [(ARUIRingsView *)v31 setBackgroundColor:v32];

  [(ARUIRingsView *)self->_ringsView setOpaque:1];
  [(HKActivityRingView *)self addSubview:self->_ringsView];
  v33 = objc_alloc_init(_HKShapeView);
  maskView = self->_maskView;
  self->_maskView = v33;

  [(ARUIRingsView *)self->_ringsView setMaskView:self->_maskView];
}

- (double)_emptyRingAlpha
{
  return self->_emptyRingAlpha;
}

- (void)setActivitySummary:(HKActivitySummary *)activitySummary animated:(BOOL)animated
{
}

- (void)_setActivityRingViewBackgroundColor:(id)a3
{
  self->_backgroundTransparencyOrColorSPIUsed = 1;
  [(ARUIRingsView *)self->_ringsView setBackgroundColor:a3];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HKActivityRingView;
  [(HKActivityRingView *)&v13 layoutSubviews];
  if (MEMORY[0x223C56D60](0x7E00901FFFFFFFFLL)) {
    [(HKActivityRingView *)self _updateRingsViewDiameter];
  }
  else {
    [(HKActivityRingView *)self _updateRingsViewDiameterLegacy];
  }
  [(HKActivityRingView *)self bounds];
  double x = v14.origin.x;
  double y = v14.origin.y;
  CGFloat height = v14.size.height;
  double Width = CGRectGetWidth(v14);
  double v7 = HKUIOnePixel();
  if (Width < v7) {
    double Width = v7;
  }
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.CGFloat width = Width;
  v15.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v15);
  double v9 = HKUIOnePixel();
  if (v8 >= v9) {
    double v10 = v8;
  }
  else {
    double v10 = v9;
  }
  -[ARUIRingsView setBounds:](self->_ringsView, "setBounds:", x, y, Width, v10);
  ringsView = self->_ringsView;
  [(HKActivityRingView *)self bounds];
  double MidX = CGRectGetMidX(v16);
  [(HKActivityRingView *)self bounds];
  -[ARUIRingsView setCenter:](ringsView, "setCenter:", MidX, CGRectGetMidY(v17));
  [(HKActivityRingView *)self _updateMaskPath];
}

- (void)_updateRingsViewDiameter
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(HKActivityRingView *)self bounds];
  double Width = CGRectGetWidth(v28);
  [(HKActivityRingView *)self bounds];
  double Height = CGRectGetHeight(v29);
  if (Width >= Height) {
    double Width = Height;
  }
  v5 = +[_HKActivityRingViewSizingDirective sortedRingRatioDirectives];
  id v6 = [v5 firstObject];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      uint64_t v12 = 0;
      objc_super v13 = v6;
      id v6 = v10;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(id *)(*((void *)&v22 + 1) + 8 * v12);

        objc_msgSend(v14, "width", (void)v22);
        if (Width < v15)
        {
          id v6 = v13;
          goto LABEL_14;
        }
        id v6 = v14;

        ++v12;
        objc_super v13 = v6;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v10 = v6;
      id v14 = v6;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v14 = 0;
  }
LABEL_14:

  [v6 width];
  if (HKUIEqualDoubles(floor(Width), v16))
  {
    [v6 outerRingOffset];
    double v18 = Width - v17;
    [v6 ringInterspacing];
    double v20 = v19;
    [v6 ringThickness];
    [(HKActivityRingView *)self _setRingDiameter:v18 ringInterspacing:v20 ringThickness:v21];
  }
  else
  {
    [(HKActivityRingView *)self _updateAndInterpolateRingsViewDiameterForWidth:v6 lowerDirective:v14 higherDirective:Width];
  }
}

- (void)_updateAndInterpolateRingsViewDiameterForWidth:(double)a3 lowerDirective:(id)a4 higherDirective:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [v8 width];
  double v11 = v10;
  [v9 width];
  double v13 = v11 - v12;
  [v9 width];
  double v15 = (a3 - v14) / v13;
  [v9 ringThickness];
  double v17 = v16;
  [v8 ringThickness];
  double v19 = v17 + (v18 - v17) * v15;
  [v9 ringInterspacing];
  double v21 = v20;
  [v8 ringInterspacing];
  double v23 = v22;

  double v24 = v21 + (v23 - v21) * v15;
  [v9 outerRingOffset];
  double v26 = v25;

  [(HKActivityRingView *)self _setRingDiameter:a3 - v26 ringInterspacing:v24 ringThickness:v19];
}

- (void)_setRingDiameter:(double)a3 ringInterspacing:(double)a4 ringThickness:(double)a5
{
  id v9 = [(ARUIRingsView *)self->_ringsView ringGroup];
  UIRoundToViewScale();
  *(float *)&double v6 = v6;
  [v9 setGroupDiameter:v6];
  UIRoundToViewScale();
  *(float *)&double v7 = v7;
  [v9 setInterspacing:v7];
  UIRoundToViewScale();
  *(float *)&double v8 = v8;
  [v9 setThickness:v8];
  [(HKActivityRingView *)self setActivitySummary:self->_activitySummary animated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySummary, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_renderer, 0);

  objc_storeStrong((id *)&self->_ringsView, 0);
}

- (HKActivityRingView)initWithFrame:(CGRect)a3 renderer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKActivityRingView;
  double v11 = -[HKActivityRingView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  double v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_renderer, a4);
    [(HKActivityRingView *)v12 _setUpAfterInit];
  }

  return v12;
}

- (HKActivityRingView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKActivityRingView;
  v3 = [(HKActivityRingView *)&v6 initWithCoder:a3];
  objc_super v4 = v3;
  if (v3) {
    [(HKActivityRingView *)v3 _setUpAfterInit];
  }
  return v4;
}

- (void)setActivitySummary:(HKActivitySummary *)activitySummary
{
}

- (void)_setEmptyRingAlpha:(double)a3
{
  double v3 = fmin(a3, 1.0);
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  self->_emptyRingAlpha = v3;
  float v4 = v3;
  id v6 = [(ARUIRingsView *)self->_ringsView ringGroup];
  *(float *)&double v5 = v4;
  [v6 setEmptyOpacity:v5];
}

- (void)_setActivityRingViewBackgroundTransparent:(BOOL)a3
{
  self->_backgroundTransparencyOrColorSPIUsed = 1;
  BOOL v4 = !a3;
  [(ARUIRingsView *)self->_ringsView setOpaque:!a3];
  ringsView = self->_ringsView;
  if (v4) {
    maskView = 0;
  }
  else {
    maskView = self->_maskView;
  }

  [(ARUIRingsView *)ringsView setMaskView:maskView];
}

- (void)_setShouldBypassApplicationStateChecking:(BOOL)a3
{
  self->_shouldBypassApplicationStateChecking = 1;
  [(ARUIRingsView *)self->_ringsView setShouldBypassApplicationStateChecking:a3];
}

- (void)_displayIconsForWheelchairUser:(BOOL)a3
{
  double v5 = [(ARUIRingsView *)self->_ringsView ringGroup];
  if (a3) {
    [MEMORY[0x263F23988] wheelchairSpriteSheet];
  }
  else {
  id v6 = [MEMORY[0x263F23988] defaultSpriteSheet];
  }
  [v5 setSpriteSheet:v6];

  id v7 = [(ARUIRingsView *)self->_ringsView ringGroup];
  [v7 playSpriteAnimation];
}

- (void)_setActivitySummary:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  objc_storeStrong((id *)&self->_activitySummary, a3);
  id v9 = a5;
  [(ARUIRingsView *)self->_ringsView hk_configureWithActivitySummary:v15 animated:v6 completion:v9];

  id v10 = v15;
  if (!self->_backgroundTransparencyOrColorSPIUsed)
  {
    int v11 = [v15 isPaused];
    ringsView = self->_ringsView;
    if (v11)
    {
      [(ARUIRingsView *)ringsView setOpaque:0];
      double v13 = self->_ringsView;
      [MEMORY[0x263F825C8] clearColor];
    }
    else
    {
      [(ARUIRingsView *)ringsView setOpaque:1];
      double v13 = self->_ringsView;
      [MEMORY[0x263F825C8] blackColor];
    objc_super v14 = };
    [(ARUIRingsView *)v13 setBackgroundColor:v14];

    id v10 = v15;
  }
}

- (id)_snapshotImage
{
  return (id)[(ARUIRingsView *)self->_ringsView snapshot];
}

- (double)_ringDiameter
{
  [(HKActivityRingView *)self bounds];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  double v7 = CGRectGetWidth(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v13);
  if (v7 < v8) {
    double v8 = v7;
  }
  double v9 = v8 * (1.0 - self->_ringInsetPercentage);

  return HKUIFloorToScreenScale(v9);
}

- (void)_updateRingsViewDiameterLegacy
{
  [(HKActivityRingView *)self _ringDiameter];
  if (v3 >= 60.0) {
    double v4 = 0.3;
  }
  else {
    double v4 = v3 / 60.0 * 0.3;
  }
  double v5 = (v3 - v3 * fmax(v4, 0.25) + -8.0) / 6.0;
  if (v5 < 0.0) {
    double v5 = 0.0;
  }
  if (v5 >= 2.0) {
    double v6 = v5;
  }
  else {
    double v6 = (v5 + 2.0) * 0.5;
  }
  if (v5 >= 2.0) {
    double v7 = 2.0;
  }
  else {
    double v7 = (v5 + 2.0) * 0.5;
  }

  [(HKActivityRingView *)self _setRingDiameter:v3 ringInterspacing:v7 ringThickness:v6];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKActivityRingView;
  -[HKActivityRingView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(HKActivityRingView *)self _updateMaskPath];
}

- (HKActivitySummary)activitySummary
{
  return self->_activitySummary;
}

- (double)_ringInsetPercentage
{
  return self->_ringInsetPercentage;
}

- (void)_setRingInsetPercentage:(double)a3
{
  self->_ringInsetPercentage = a3;
}

- (BOOL)_shouldBypassApplicationStateChecking
{
  return self->_shouldBypassApplicationStateChecking;
}

@end