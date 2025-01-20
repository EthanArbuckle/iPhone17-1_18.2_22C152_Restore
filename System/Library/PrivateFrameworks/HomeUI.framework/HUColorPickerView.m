@interface HUColorPickerView
- ($01BB1521EC52D44A8E7628F5261DCEC8)selectedColor;
- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedColorCoordinate;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isUserInteractionActive;
- (CGPoint)magnifierLocation;
- (HUColorPickerView)initWithProfile:(id)a3;
- (HUColorWheelSpace)colorWheelSpace;
- (HUColorWheelView)colorWheelView;
- (HUQuickControlColorPickerViewInteractionDelegate)interactionDelegate;
- (HUQuickControlColorViewProfile)profile;
- (HUQuickControlMagnifierView)magnifierView;
- (UILongPressGestureRecognizer)gestureRecognizer;
- (double)magnifierLength;
- (double)touchDownTimestamp;
- (double)wheelHoleRadius;
- (id)_colorWheelSpaceForMode:(unint64_t)a3;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)value;
- (unint64_t)colorPickerMode;
- (unint64_t)mirroringAxisBias;
- (unint64_t)reachabilityState;
- (void)_applyMirroringAxisBiasToColorWheelSpaceIfNecessary;
- (void)_handleGesture:(id)a3;
- (void)_updateDerivedSelectedColorCoordinate;
- (void)_updateMagnifierPosition;
- (void)_updateMagnifierTransformForTouchLocation:(CGPoint)a3;
- (void)_updateMagnifierView;
- (void)_updateMirroringAxisBiasIfNecessary;
- (void)_updateUIForReachabilityState:(unint64_t)a3;
- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)setColorPickerMode:(unint64_t)a3;
- (void)setColorWheelView:(id)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setMagnifierLength:(double)a3;
- (void)setMagnifierLocation:(CGPoint)a3;
- (void)setMagnifierView:(id)a3;
- (void)setMirroringAxisBias:(unint64_t)a3;
- (void)setProfile:(id)a3;
- (void)setReachabilityState:(unint64_t)a3;
- (void)setSelectedColor:(id)a3;
- (void)setSelectedColorCoordinate:(id)a3;
- (void)setTouchDownTimestamp:(double)a3;
- (void)setUserInteractionActive:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setWheelHoleRadius:(double)a3;
@end

@implementation HUColorPickerView

- (HUColorPickerView)initWithProfile:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUColorPickerView;
  v6 = [(HUColorPickerView *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    v7->_colorPickerMode = [v5 supportsRGBColor] ^ 1;
    v7->_mirroringAxisBias = 0;
    *(_OWORD *)&v7->_selectedColor.r = HUWheelColorInvalid;
    *(_OWORD *)&v7->_selectedColor.b = *(_OWORD *)&qword_1BEA1A490;
    v7->_selectedColorCoordinate = ($93411E767E52E887DBE6B6E7CEF02EAC)HUColorWheelNullCoordinate;
    v8 = [(HUColorPickerView *)v7 _colorWheelSpaceForMode:[(HUColorPickerView *)v7 colorPickerMode]];
    v9 = [[HUColorWheelView alloc] initWithColorWheelSpace:v8];
    [(HUColorPickerView *)v7 setColorWheelView:v9];

    v10 = [(HUColorPickerView *)v7 colorWheelView];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    v11 = [(HUColorPickerView *)v7 colorWheelView];
    [(HUColorPickerView *)v7 addSubview:v11];

    v12 = objc_alloc_init(HUQuickControlMagnifierView);
    [(HUColorPickerView *)v7 setMagnifierView:v12];

    v13 = [(HUColorPickerView *)v7 magnifierView];
    [v13 sizeToFit];

    v14 = [(HUColorPickerView *)v7 magnifierView];
    [(HUColorPickerView *)v7 addSubview:v14];

    [(HUColorPickerView *)v7 _updateMagnifierPosition];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v7 action:sel__handleGesture_];
    [(HUColorPickerView *)v7 setGestureRecognizer:v15];

    v16 = [(HUColorPickerView *)v7 gestureRecognizer];
    [v16 setDelegate:v7];

    v17 = [(HUColorPickerView *)v7 gestureRecognizer];
    [v17 setMinimumPressDuration:0.0];

    v18 = [(HUColorPickerView *)v7 gestureRecognizer];
    [(HUColorPickerView *)v7 addGestureRecognizer:v18];
  }
  return v7;
}

- (HUColorWheelSpace)colorWheelSpace
{
  v2 = [(HUColorPickerView *)self colorWheelView];
  v3 = [v2 colorWheelSpace];

  return (HUColorWheelSpace *)v3;
}

- (double)wheelHoleRadius
{
  v2 = [(HUColorPickerView *)self colorWheelView];
  [v2 wheelHoleRadius];
  double v4 = v3;

  return v4;
}

- (void)setWheelHoleRadius:(double)a3
{
  id v5 = [(HUColorPickerView *)self colorWheelView];
  [v5 setWheelHoleRadius:a3];

  [(HUColorPickerView *)self _updateMagnifierView];
}

- (void)setMagnifierLength:(double)a3
{
  self->_magnifierLength = a3;
  [(HUColorPickerView *)self _updateMagnifierView];
}

- (void)setSelectedColor:(id)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  self->_selectedColor = ($56D0F75D0B2E5F190A6F978686E1AFE9)a3;
  [(HUColorPickerView *)self _updateMagnifierView];
  UIColorForHUWheelColor(var0, var1, var2, var3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = [(HUColorPickerView *)self magnifierView];
  [v8 setSelectedColor:v9];
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 >= 2)
  {
    if (a3 != 2) {
      return;
    }
    [(HUColorPickerView *)self setAlpha:1.0];
    [(HUColorPickerView *)self setUserInteractionEnabled:1];
    double v4 = [(HUColorPickerView *)self magnifierView];
    id v6 = v4;
    uint64_t v5 = 0;
  }
  else
  {
    [(HUColorPickerView *)self setAlpha:0.5];
    [(HUColorPickerView *)self setUserInteractionEnabled:0];
    double v4 = [(HUColorPickerView *)self magnifierView];
    id v6 = v4;
    uint64_t v5 = 1;
  }
  [v4 setHidden:v5];
}

- (void)_updateMagnifierView
{
  [(HUColorPickerView *)self magnifierLength];
  if (v3 <= 0.0)
  {
    v7 = [(HUColorPickerView *)self colorWheelView];
    [v7 wheelHoleRadius];
    double v9 = v8;

    if (v9 <= 0.0) {
      goto LABEL_6;
    }
    id v6 = [(HUColorPickerView *)self colorWheelView];
    [v6 wheelHoleRadius];
    double v11 = HURoundToScreenScale(v10 * 0.44);
    v12 = [(HUColorPickerView *)self magnifierView];
    [v12 setInnerRadius:v11];
  }
  else
  {
    [(HUColorPickerView *)self magnifierLength];
    double v5 = v4 * 0.5;
    id v6 = [(HUColorPickerView *)self magnifierView];
    [v6 setInnerRadius:v5];
  }

LABEL_6:
  id v13 = [(HUColorPickerView *)self magnifierView];
  [v13 sizeToFit];
}

- (void)setSelectedColorCoordinate:(id)a3
{
  self->_selectedColorCoordinate = ($93411E767E52E887DBE6B6E7CEF02EAC)a3;
  [(HUColorPickerView *)self _updateMagnifierPosition];

  [(HUColorPickerView *)self _updateMirroringAxisBiasIfNecessary];
}

- (CGPoint)magnifierLocation
{
  v2 = [(HUColorPickerView *)self magnifierView];
  [v2 center];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setMagnifierLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(HUColorPickerView *)self magnifierView];
  objc_msgSend(v5, "setCenter:", x, y);
}

- (void)setUserInteractionActive:(BOOL)a3
{
  if (self->_userInteractionActive != a3)
  {
    BOOL v3 = a3;
    self->_userInteractionActive = a3;
    if (!a3) {
      -[HUColorPickerView _updateMagnifierTransformForTouchLocation:](self, "_updateMagnifierTransformForTouchLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
    id v5 = [(HUColorPickerView *)self interactionDelegate];
    [v5 controlView:self interactionStateDidChange:v3 forFirstTouch:0];
  }
}

- (void)setColorPickerMode:(unint64_t)a3
{
  if (self->_colorPickerMode != a3)
  {
    self->_colorPickerMode = a3;
    double v4 = -[HUColorPickerView _colorWheelSpaceForMode:](self, "_colorWheelSpaceForMode:");
    id v5 = [(HUColorPickerView *)self colorWheelView];
    [v5 setColorWheelSpace:v4];

    [(HUColorPickerView *)self _applyMirroringAxisBiasToColorWheelSpaceIfNecessary];
    [(HUColorPickerView *)self _updateDerivedSelectedColorCoordinate];
  }
}

- (id)_colorWheelSpaceForMode:(unint64_t)a3
{
  if (a3 == 1)
  {
    +[HUTemperatureColorWheelSpace defaultTemperatureRange];
    double v6 = v5;
    double v8 = v7;
    objc_opt_class();
    double v9 = [(HUColorPickerView *)self profile];
    double v10 = [v9 colorProfile];
    if (objc_opt_isKindOfClass()) {
      double v11 = v10;
    }
    else {
      double v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      [v12 minimumTemperature];
      double v8 = 1000000.0 / v13;
      [v12 maximumTemperature];
      double v6 = 1000000.0 / v14;
    }
    BOOL v3 = -[HUTemperatureColorWheelSpace initWithSupportedRange:]([HUTemperatureColorWheelSpace alloc], "initWithSupportedRange:", v6, v8);
  }
  else if (a3)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = objc_alloc_init(HUWheelColorWheelSpace);
  }

  return v3;
}

- (void)_updateDerivedSelectedColorCoordinate
{
  [(HUColorPickerView *)self selectedColor];
  if (v6 == 1.79769313e308 && v3 == 1.79769313e308 && v4 == 1.79769313e308)
  {
    double v9 = 1.79769313e308;
    BOOL v16 = v5 != 1.79769313e308;
    if (v5 == 1.79769313e308)
    {
      double v15 = 1.79769313e308;
      goto LABEL_17;
    }
  }
  else
  {
    BOOL v16 = 1;
  }
  double v10 = [(HUColorPickerView *)self colorWheelSpace];
  [(HUColorPickerView *)self selectedColor];
  objc_msgSend(v10, "coordinateForColor:isValid:", &v16);
  double v12 = v11;
  double v14 = v13;

  double v15 = 1.79769313e308;
  if (v16) {
    double v9 = v14;
  }
  else {
    double v9 = 1.79769313e308;
  }
  if (v16) {
    double v15 = v12;
  }
LABEL_17:
  -[HUColorPickerView setSelectedColorCoordinate:](self, "setSelectedColorCoordinate:", v15, v9);
}

- (void)_updateMagnifierPosition
{
  [(HUColorPickerView *)self selectedColorCoordinate];
  BOOL v5 = v4 == 1.79769313e308 && v3 == 1.79769313e308;
  if (!v5)
  {
    double v6 = [(HUColorPickerView *)self colorWheelView];
    [(HUColorPickerView *)self selectedColorCoordinate];
    objc_msgSend(v6, "pointForColorWheelCoordinate:");
    double v8 = v7;
    double v10 = v9;

    double v11 = [(HUColorPickerView *)self colorWheelView];
    -[HUColorPickerView convertPoint:fromView:](self, "convertPoint:fromView:", v11, v8, v10);
    -[HUColorPickerView setMagnifierLocation:](self, "setMagnifierLocation:");
  }
  id v12 = [(HUColorPickerView *)self magnifierView];
  [v12 setHidden:v5];
}

- (void)_applyMirroringAxisBiasToColorWheelSpaceIfNecessary
{
  double v3 = [(HUColorPickerView *)self colorWheelSpace];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(HUColorPickerView *)self colorWheelSpace];
    objc_msgSend(v5, "setMirroringBiasAxis:", -[HUColorPickerView mirroringAxisBias](self, "mirroringAxisBias"));
  }
}

- (void)_updateMirroringAxisBiasIfNecessary
{
  double v3 = [(HUColorPickerView *)self colorWheelSpace];
  uint64_t v4 = [v3 type];

  if (v4 == 1)
  {
    [(HUColorPickerView *)self selectedColorCoordinate];
    BOOL v7 = v6 == 1.79769313e308 && v5 == 1.79769313e308;
    BOOL v10 = 0;
    if (!v7)
    {
      [(HUColorPickerView *)self selectedColorCoordinate];
      if (v8 < 0.25 || ([(HUColorPickerView *)self selectedColorCoordinate], v9 > 0.75)) {
        BOOL v10 = 1;
      }
    }
    [(HUColorPickerView *)self setMirroringAxisBias:v10];
  }
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  return +[HUIntrinsicSizeDescriptor descriptorWithAspectRatio:](HUIntrinsicSizeDescriptor, "descriptorWithAspectRatio:", a3, 1.0);
}

- (id)value
{
  [(HUColorPickerView *)self selectedColor];

  return HUPaletteColorForWheelColor(v2, v3, v4, v5);
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  id v18 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    BOOL v7 = v18;
  }
  else {
    BOOL v7 = 0;
  }
  id v8 = v7;
  id v6 = v18;
  double v9 = v18;
  if (!v8)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];

    id v6 = v18;
LABEL_7:
    double v9 = 0;
  }

  [(HUColorPickerView *)self selectedColor];
  BOOL v16 = HUPaletteColorForWheelColor(v12, v13, v14, v15);
  v17 = v16;
  if ((!v16 || ([v16 isSimilarToColor:v9] & 1) == 0)
    && ([v9 isNaturalLightColor] & 1) == 0)
  {
    [(HUColorPickerView *)self setSelectedColor:HUWheelColorForPaletteColor(v9)];
    [(HUColorPickerView *)self _updateDerivedSelectedColorCoordinate];
  }
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  unint64_t v4 = [(HUColorPickerView *)self reachabilityState];

  [(HUColorPickerView *)self _updateUIForReachabilityState:v4];
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
}

- (void)_handleGesture:(id)a3
{
  id v26 = a3;
  uint64_t v4 = [v26 state];
  if (v4 == 2) {
    goto LABEL_4;
  }
  if (v4 == 1)
  {
    [(HUColorPickerView *)self setTouchDownTimestamp:CFAbsoluteTimeGetCurrent()];
LABEL_4:
    [(HUColorPickerView *)self setUserInteractionActive:1];
    uint64_t v5 = [(HUColorPickerView *)self colorWheelView];
    [v26 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    BOOL v10 = [(HUColorPickerView *)self colorWheelView];
    objc_msgSend(v10, "colorWheelCoordinateForPoint:boundedToWheel:", 1, v7, v9);
    double v12 = v11;
    double v14 = v13;

    -[HUColorPickerView setSelectedColorCoordinate:](self, "setSelectedColorCoordinate:", v12, v14);
    double v15 = [(HUColorPickerView *)self colorWheelSpace];
    objc_msgSend(v15, "colorForCoordinate:", v12, v14);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    -[HUColorPickerView setSelectedColor:](self, "setSelectedColor:", v17, v19, v21, v23);
    v24 = [(HUColorPickerView *)self interactionDelegate];
    v25 = [(HUColorPickerView *)self value];
    [v24 controlView:self valueDidChange:v25];

    [v26 locationInView:self];
    -[HUColorPickerView _updateMagnifierTransformForTouchLocation:](self, "_updateMagnifierTransformForTouchLocation:");
    goto LABEL_6;
  }
  [(HUColorPickerView *)self setUserInteractionActive:0];
  [(HUColorPickerView *)self setTouchDownTimestamp:0.0];
LABEL_6:
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  double v6 = [(HUColorPickerView *)self colorWheelView];
  double v7 = [v6 wheelBezierPath];
  double v8 = [(HUColorPickerView *)self colorWheelView];
  [v5 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  LOBYTE(v5) = objc_msgSend(v7, "containsPoint:", v10, v12);
  return (char)v5;
}

- (void)_updateMagnifierTransformForTouchLocation:(CGPoint)a3
{
  double y = a3.y;
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v24 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v29.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v29.c = v23;
  long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v29.tdouble x = v22;
  if ([(HUColorPickerView *)self isUserInteractionActive])
  {
    [(HUColorPickerView *)self touchDownTimestamp];
    if (v5 != 0.0)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [(HUColorPickerView *)self touchDownTimestamp];
      if (Current - v7 >= 0.15)
      {
        *(_OWORD *)&v28.a = v24;
        *(_OWORD *)&v28.c = v23;
        *(_OWORD *)&v28.tdouble x = v22;
        CGAffineTransformScale(&v29, &v28, 1.14999998, 1.14999998);
        [(HUColorPickerView *)self magnifierLocation];
        double v9 = fmax(30.0 - vabdd_f64(v8, y), 0.0);
        [(HUColorPickerView *)self magnifierLocation];
        double v11 = v10;
        double v13 = v12 - v9;
        double v14 = [(HUColorPickerView *)self colorWheelView];
        objc_msgSend(v14, "colorWheelCoordinateForPoint:boundedToWheel:", 1, v11, v13);
        double v16 = v15;
        double v18 = v17;

        double v19 = [(HUColorPickerView *)self colorWheelView];
        objc_msgSend(v19, "pointForColorWheelCoordinate:", v16, v18);
        double v21 = v20;

        CGAffineTransform v27 = v29;
        CGAffineTransformTranslate(&v28, &v27, 0.0, v21 - v13 - v9);
        CGAffineTransform v29 = v28;
      }
    }
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  CGAffineTransform v26 = v29;
  v25[2] = __63__HUColorPickerView__updateMagnifierTransformForTouchLocation___block_invoke;
  v25[3] = &unk_1E6385C78;
  v25[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v25 animations:0.15];
}

void __63__HUColorPickerView__updateMagnifierTransformForTouchLocation___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "magnifierView", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
  [v1 setTransform:&v2];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)HUColorPickerView;
  [(HUColorPickerView *)&v8 layoutSubviews];
  [(HUColorPickerView *)self frame];
  double v4 = v3;
  [(HUColorPickerView *)self frame];
  double v6 = v5;
  double v7 = [(HUColorPickerView *)self colorWheelView];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  [(HUColorPickerView *)self _updateMagnifierPosition];
  [(HUColorPickerView *)self _updateUIForReachabilityState:[(HUColorPickerView *)self reachabilityState]];
}

- (HUQuickControlColorPickerViewInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (HUQuickControlColorPickerViewInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (HUQuickControlColorViewProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (unint64_t)colorPickerMode
{
  return self->_colorPickerMode;
}

- (double)magnifierLength
{
  return self->_magnifierLength;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (unint64_t)mirroringAxisBias
{
  return self->_mirroringAxisBias;
}

- (void)setMirroringAxisBias:(unint64_t)a3
{
  self->_mirroringAxisBias = a3;
}

- (HUColorWheelView)colorWheelView
{
  return self->_colorWheelView;
}

- (void)setColorWheelView:(id)a3
{
}

- (HUQuickControlMagnifierView)magnifierView
{
  return self->_magnifierView;
}

- (void)setMagnifierView:(id)a3
{
}

- (UILongPressGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (double)touchDownTimestamp
{
  return self->_touchDownTimestamp;
}

- (void)setTouchDownTimestamp:(double)a3
{
  self->_touchDownTimestamp = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedColorCoordinate
{
  double angle = self->_selectedColorCoordinate.angle;
  double radius = self->_selectedColorCoordinate.radius;
  result.double var1 = radius;
  result.double var0 = angle;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)selectedColor
{
  double r = self->_selectedColor.r;
  double g = self->_selectedColor.g;
  double b = self->_selectedColor.b;
  double temperature = self->_selectedColor.temperature;
  result.double var3 = temperature;
  result.double var2 = b;
  result.double var1 = g;
  result.double var0 = r;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_magnifierView, 0);
  objc_storeStrong((id *)&self->_colorWheelView, 0);
  objc_storeStrong((id *)&self->_profile, 0);

  objc_destroyWeak((id *)&self->_interactionDelegate);
}

@end