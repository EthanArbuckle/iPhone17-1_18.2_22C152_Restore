@interface HUQuickControlRingSliderInteractionCoordinator
- ($F24F406B2B787EFB06265DBA3D28CBD5)modelRangeValue;
- (BOOL)hasSecondaryValue;
- (BOOL)isFirstTouchDown;
- (BOOL)isUserInteractionActive;
- (HUQuickControlIncrementalConvertibleProfile)viewProfile;
- (HUQuickControlRingSliderInteractionCoordinator)initWithControlView:(id)a3 delegate:(id)a4;
- (id)value;
- (void)_updateControlViewValueOfType:(unint64_t)a3 withValue:(double)a4;
- (void)_updateModelValue:(id)a3 roundValue:(BOOL)a4 notifyDelegate:(BOOL)a5;
- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3;
- (void)controlView:(id)a3 interactionStateDidChange:(BOOL)a4 forFirstTouch:(BOOL)a5;
- (void)controlView:(id)a3 valueDidChange:(id)a4;
- (void)setFirstTouchDown:(BOOL)a3;
- (void)setHasSecondaryValue:(BOOL)a3;
- (void)setModelRangeValue:(id)a3;
- (void)setUserInteractionActive:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation HUQuickControlRingSliderInteractionCoordinator

- (HUQuickControlRingSliderInteractionCoordinator)initWithControlView:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUQuickControlRingSliderInteractionCoordinator;
  v7 = [(HUQuickControlInteractionCoordinator *)&v13 initWithControlView:v6 delegate:a4];
  v8 = (HUQuickControlRingSliderInteractionCoordinator *)v7;
  if (v7)
  {
    *(_OWORD *)(v7 + 40) = HUFloatRangeNormal_0;
    [v6 setInteractionDelegate:v7];
    objc_opt_class();
    v9 = [(HUQuickControlRingSliderInteractionCoordinator *)v8 viewProfile];
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    if (v11) {
      v8->_hasSecondaryValue = [v11 hasSecondaryValue];
    }
    else {
      v8->_hasSecondaryValue = 0;
    }
  }
  return v8;
}

- (HUQuickControlIncrementalConvertibleProfile)viewProfile
{
  v2 = [(HUQuickControlInteractionCoordinator *)self controlView];
  v3 = [v2 profile];
  v4 = &unk_1F1AA32D8;
  id v5 = v3;
  id v6 = v5;
  if (v5)
  {
    if ([v5 conformsToProtocol:v4]) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    v8 = v6;
    if (v7) {
      goto LABEL_8;
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    id v11 = NSStringFromProtocol((Protocol *)v4);
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v11 file lineNumber description];
  }
  v8 = 0;
LABEL_8:

  return (HUQuickControlIncrementalConvertibleProfile *)v8;
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  if (![(HUQuickControlRingSliderInteractionCoordinator *)self hasSecondaryValue])
  {
    [(HUQuickControlRingSliderInteractionCoordinator *)self setUserInteractionActive:1];
    [(HUQuickControlRingSliderInteractionCoordinator *)self setFirstTouchDown:1];
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlRingSliderInteractionCoordinator;
  -[HUQuickControlInteractionCoordinator setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_);
  if (!a3) {
    [(HUQuickControlRingSliderInteractionCoordinator *)self setUserInteractionActive:0];
  }
}

- (BOOL)isUserInteractionActive
{
  v2 = [(HUQuickControlInteractionCoordinator *)self controlView];
  char v3 = [v2 isUserInteractionActive];

  return v3;
}

- (id)value
{
  if ([(HUQuickControlRingSliderInteractionCoordinator *)self hasSecondaryValue])
  {
    char v3 = (void *)MEMORY[0x1E4F69368];
    [(HUQuickControlRingSliderInteractionCoordinator *)self modelRangeValue];
    objc_msgSend(v3, "rangeWithFloatRange:");
  }
  else
  {
    objc_super v5 = NSNumber;
    [(HUQuickControlRingSliderInteractionCoordinator *)self modelRangeValue];
    [v5 numberWithDouble:v6];
  v4 = };

  return v4;
}

- (void)setValue:(id)a3
{
  id v17 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v4 = v17;
    if (objc_opt_isKindOfClass()) {
      objc_super v5 = v4;
    }
    else {
      objc_super v5 = 0;
    }
    id v6 = v5;

    -[HUQuickControlRingSliderInteractionCoordinator setHasSecondaryValue:](self, "setHasSecondaryValue:", [v6 type] == 1);
    if ([(HUQuickControlRingSliderInteractionCoordinator *)self hasSecondaryValue])
    {
      [v6 floatRangeValue];
      double v8 = v7;
      double v10 = v9;
    }
    else
    {
      v12 = [v6 midValue];
      [v12 doubleValue];
      double v10 = v13;

      double v8 = 0.0;
    }
  }
  else
  {
    [(HUQuickControlRingSliderInteractionCoordinator *)self setHasSecondaryValue:0];
    [v17 doubleValue];
    double v10 = v11;
    double v8 = 0.0;
  }
  -[HUQuickControlRingSliderInteractionCoordinator _updateModelValue:roundValue:notifyDelegate:](self, "_updateModelValue:roundValue:notifyDelegate:", 1, 0, v8, v10);
  v14 = [(HUQuickControlInteractionCoordinator *)self delegate];
  [v14 updateMainStatusStringWithValue:v17];

  v15 = [(HUQuickControlInteractionCoordinator *)self delegate];
  [v15 updateSupplementaryValue];

  [(HUQuickControlRingSliderInteractionCoordinator *)self modelRangeValue];
  [(HUQuickControlRingSliderInteractionCoordinator *)self _updateControlViewValueOfType:2 withValue:v16];
  if ([(HUQuickControlRingSliderInteractionCoordinator *)self hasSecondaryValue])
  {
    [(HUQuickControlRingSliderInteractionCoordinator *)self modelRangeValue];
    -[HUQuickControlRingSliderInteractionCoordinator _updateControlViewValueOfType:withValue:](self, "_updateControlViewValueOfType:withValue:", 1);
  }
}

- (void)setUserInteractionActive:(BOOL)a3
{
  if (self->_userInteractionActive != a3)
  {
    BOOL v3 = a3;
    self->_userInteractionActive = a3;
    id v5 = [(HUQuickControlInteractionCoordinator *)self delegate];
    [v5 interactionCoordinator:self interactionStateDidChange:v3];
  }
}

- (void)_updateModelValue:(id)a3 roundValue:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  -[HUQuickControlRingSliderInteractionCoordinator setModelRangeValue:](self, "setModelRangeValue:", a4, a3.var0, a3.var1);
  if (v5 && [(HUQuickControlRingSliderInteractionCoordinator *)self isUserInteractionActive])
  {
    id v8 = [(HUQuickControlInteractionCoordinator *)self delegate];
    double v7 = [(HUQuickControlRingSliderInteractionCoordinator *)self value];
    [v8 interactionCoordinator:self viewValueDidChange:v7];
  }
}

- (void)_updateControlViewValueOfType:(unint64_t)a3 withValue:(double)a4
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v7 = [NSNumber numberWithDouble:a4];
      BOOL v5 = [(HUQuickControlInteractionCoordinator *)self controlView];
      [v5 setSecondaryValue:v7];
    }
    else
    {
      if (a3 != 2) {
        return;
      }
      id v7 = [NSNumber numberWithDouble:a4];
      BOOL v5 = [(HUQuickControlInteractionCoordinator *)self controlView];
      [v5 setValue:v7];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInMethod:a2 object:self file:@"HUQuickControlRingSliderInteractionCoordinator.m" lineNumber:151 description:@"Invalid control view value type!"];
  }
}

- (void)controlView:(id)a3 valueDidChange:(id)a4
{
  id v16 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v5 = v16;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if ([v7 type] == 1)
    {
      [v7 floatRangeValue];
      double v9 = v8;
      double v11 = v10;
    }
    else
    {
      double v13 = [v7 midValue];
      [v13 doubleValue];
      double v11 = v14;

      double v9 = 0.0;
    }
  }
  else
  {
    [v16 doubleValue];
    double v11 = v12;
    double v9 = 0.0;
  }
  -[HUQuickControlRingSliderInteractionCoordinator setModelRangeValue:](self, "setModelRangeValue:", v9, v11);
  v15 = [(HUQuickControlInteractionCoordinator *)self delegate];
  [v15 interactionCoordinator:self viewValueDidChange:v16];
}

- (void)controlView:(id)a3 interactionStateDidChange:(BOOL)a4 forFirstTouch:(BOOL)a5
{
  BOOL v5 = a4;
  id v7 = [(HUQuickControlInteractionCoordinator *)self delegate];
  [v7 interactionCoordinator:self interactionStateDidChange:v5];
}

- (BOOL)hasSecondaryValue
{
  return self->_hasSecondaryValue;
}

- (void)setHasSecondaryValue:(BOOL)a3
{
  self->_hasSecondaryValue = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)modelRangeValue
{
  double minimum = self->_modelRangeValue.minimum;
  double maximum = self->_modelRangeValue.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

- (void)setModelRangeValue:(id)a3
{
  self->_modelRangeValue = ($888842945EE2C7AB0ACD33E179C69952)a3;
}

- (BOOL)isFirstTouchDown
{
  return self->_firstTouchDown;
}

- (void)setFirstTouchDown:(BOOL)a3
{
  self->_firstTouchDown = a3;
}

@end