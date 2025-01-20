@interface CAMTrackingSpring
- ($F24F406B2B787EFB06265DBA3D28CBD5)_secondaryTarget;
- (BOOL)hasSecondaryTarget;
- (BOOL)isConverged;
- (CAMSpring)_settleProgressSpring;
- (CAMTrackingSpring)initWithTension:(double)a3 friction:(double)a4 epsilon:(double)a5;
- (double)_convergenceStartValue;
- (double)convergenceProgress;
- (void)_beginConverging;
- (void)_convergenceStartValue:(double)a3;
- (void)_setSecondaryTarget:(id)a3;
- (void)_setSettlingSpring:(id)a3;
- (void)removeSecondaryTargetAnimated:(BOOL)a3;
- (void)resetToValue:(double)a3;
- (void)resetToValue:(double)a3 animated:(BOOL)a4;
- (void)setSecondaryTarget:(double)a3 withStrength:(double)a4 animated:(BOOL)a5;
- (void)setTarget:(double)a3 animated:(BOOL)a4;
- (void)updateForTimestamp:(double)a3;
@end

@implementation CAMTrackingSpring

- (CAMTrackingSpring)initWithTension:(double)a3 friction:(double)a4 epsilon:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CAMTrackingSpring;
  result = [(CAMSpring *)&v6 initWithTension:a3 friction:a4 epsilon:a5];
  if (result) {
    result->112 = ($086C0E59A94AFF41DFCAA15FAFF4BA1C)CAMTrackingSpringTargetInvalid;
  }
  return result;
}

- (BOOL)isConverged
{
  v3 = [(CAMTrackingSpring *)self _settleProgressSpring];
  if (v3)
  {
    v4 = [(CAMTrackingSpring *)self _settleProgressSpring];
    char v5 = [v4 isConverged];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (double)convergenceProgress
{
  v3 = [(CAMTrackingSpring *)self _settleProgressSpring];
  if (v3)
  {
    v4 = [(CAMTrackingSpring *)self _settleProgressSpring];
    [v4 _current];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }

  return v6;
}

- (void)_beginConverging
{
  v3 = [(CAMTrackingSpring *)self _settleProgressSpring];

  if (!v3)
  {
    v4 = [CAMSpring alloc];
    [(CAMSpring *)self tension];
    double v6 = v5;
    [(CAMSpring *)self friction];
    v8 = [(CAMSpring *)v4 initWithTension:v6 friction:v7 epsilon:0.001];
    [(CAMTrackingSpring *)self _setSettlingSpring:v8];
  }
  v9 = [(CAMTrackingSpring *)self _settleProgressSpring];
  [v9 setTarget:1.0];

  v10 = [(CAMTrackingSpring *)self _settleProgressSpring];
  [v10 _setCurrent:0.0];

  [(CAMSpring *)self _current];
  -[CAMTrackingSpring _convergenceStartValue:](self, "_convergenceStartValue:");
}

- (void)setTarget:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(CAMSpring *)self setTarget:a3];
  if (v4)
  {
    [(CAMTrackingSpring *)self _beginConverging];
  }
}

- (void)setSecondaryTarget:(double)a3 withStrength:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  [(CAMTrackingSpring *)self _secondaryTarget];
  if (v9 != a3 || v10 != a4)
  {
    double v12 = v9;
    -[CAMTrackingSpring _setSecondaryTarget:](self, "_setSecondaryTarget:", a3, a4);
    if (v12 != a3 && v5)
    {
      [(CAMTrackingSpring *)self _beginConverging];
    }
  }
}

- (void)removeSecondaryTargetAnimated:(BOOL)a3
{
}

- (BOOL)hasSecondaryTarget
{
  [(CAMTrackingSpring *)self _secondaryTarget];
  return v2 != 1.79769313e308;
}

- (void)resetToValue:(double)a3
{
}

- (void)resetToValue:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(CAMTrackingSpring *)self removeSecondaryTargetAnimated:0];
  [(CAMSpring *)self setTarget:a3];
  if (v4)
  {
    [(CAMTrackingSpring *)self _beginConverging];
  }
  else
  {
    [(CAMTrackingSpring *)self _setSettlingSpring:0];
    [(CAMSpring *)self _setCurrent:a3];
  }
}

- (void)updateForTimestamp:(double)a3
{
  id v9 = [(CAMTrackingSpring *)self _settleProgressSpring];
  [v9 updateForTimestamp:a3];
  [(CAMSpring *)self target];
  double v6 = v5;
  if ([(CAMTrackingSpring *)self hasSecondaryTarget])
  {
    [(CAMSpring *)self target];
    [(CAMTrackingSpring *)self _secondaryTarget];
    CEKInterpolate();
    double v6 = v7;
  }
  if ([(CAMTrackingSpring *)self isConverged])
  {
    [(CAMTrackingSpring *)self _setSettlingSpring:0];
  }
  else
  {
    [(CAMTrackingSpring *)self convergenceProgress];
    [(CAMTrackingSpring *)self _convergenceStartValue];
    CEKInterpolate();
    double v6 = v8;
  }
  [(CAMSpring *)self _setCurrent:v6];
}

- (CAMSpring)_settleProgressSpring
{
  return self->__settleProgressSpring;
}

- (void)_setSettlingSpring:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_secondaryTarget
{
  double value = self->value;
  double strength = self->strength;
  result.var1 = strength;
  result.var0 = value;
  return result;
}

- (void)_setSecondaryTarget:(id)a3
{
  self->112 = ($086C0E59A94AFF41DFCAA15FAFF4BA1C)a3;
}

- (double)_convergenceStartValue
{
  return self->__convergenceStartValue;
}

- (void)_convergenceStartValue:(double)a3
{
  self->__convergenceStartValue = a3;
}

- (void).cxx_destruct
{
}

@end