@interface CAMLevelViewModel
- (UIOffset)currentIndicatorOffset;
- (double)_desiredModeBeganTime;
- (double)_hysteresisAlphaForDesiredAlpha:(double)result fromCurrentAlpha:(double)a4;
- (double)_lastNonZeroAngleTime;
- (double)currentIndicatorAlpha;
- (double)currentIndicatorRotationAngle;
- (double)desiredUpdateInterval;
- (int64_t)_desiredIndicatorMode;
- (int64_t)_hysteresisModeForDesiredMode:(int64_t)a3;
- (int64_t)currentIndicatorMode;
- (void)_deviceAngleForGravity:(id)a3 captureOrientation:(int64_t)a4 relativeRoll:(double *)a5 relativePitch:(double *)a6;
- (void)_setCurrentIndicatorAlpha:(double)a3;
- (void)_setCurrentIndicatorMode:(int64_t)a3;
- (void)_setCurrentIndicatorOffset:(UIOffset)a3;
- (void)_setCurrentIndicatorRotationAngle:(double)a3;
- (void)_setDesiredIndicatorMode:(int64_t)a3;
- (void)_setDesiredModeBeganTime:(double)a3;
- (void)_setDesiredUpdateInterval:(double)a3;
- (void)_setLastNonZeroAngleTime:(double)a3;
- (void)_updateFlatModeWithRoll:(float)a3 pitch:(float)a4 magnitude:(float)a5;
- (void)_updateModeNone;
- (void)_updateStraightModeWithMode:(int64_t)a3 roll:(double)a4 pitch:(double)a5;
- (void)applyDeviceMotion:(id)a3 captureOrientation:(int64_t)a4;
@end

@implementation CAMLevelViewModel

- (void)_deviceAngleForGravity:(id)a3 captureOrientation:(int64_t)a4 relativeRoll:(double *)a5 relativePitch:(double *)a6
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  if ((unint64_t)(a4 - 1) > 1)
  {
    if ((unint64_t)(a4 - 3) > 1) {
      return;
    }
    double v9 = a3.var1 / a3.var0;
    double var1 = a3.var0;
  }
  else
  {
    double v9 = a3.var0 / a3.var1;
  }
  *a5 = atan(v9);
  float v10 = var2 / var1;
  *a6 = atanf(v10);
}

- (void)applyDeviceMotion:(id)a3 captureOrientation:(int64_t)a4
{
  id v6 = a3;
  v7 = [v6 attitude];
  [v6 gravity];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [v7 pitch];
  double v15 = v14;
  double v24 = 0.0;
  uint64_t v25 = 0;
  double v23 = 0.0;
  objc_msgSend(v7, "cam_getDistanceFromFlat:relativeRoll:", &v25, (char *)&v25 + 4);
  -[CAMLevelViewModel _deviceAngleForGravity:captureOrientation:relativeRoll:relativePitch:](self, "_deviceAngleForGravity:captureOrientation:relativeRoll:relativePitch:", a4, &v24, &v23, v9, v11, v13);
  LODWORD(v16) = v25;
  if (*(float *)&v25 >= 0.25)
  {
    BOOL v18 = fabs(v24) >= 0.200000003;
    double v16 = fabs(v23);
    if (v16 >= 0.600000024) {
      BOOL v18 = 1;
    }
    if ((unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL || v18)
    {
      if ((unint64_t)(a4 - 5) < 0xFFFFFFFFFFFFFFFELL) {
        BOOL v18 = 1;
      }
      if (v18) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = 3;
      }
    }
    else
    {
      uint64_t v17 = 2;
    }
  }
  else
  {
    uint64_t v17 = 1;
  }
  int64_t v19 = -[CAMLevelViewModel _hysteresisModeForDesiredMode:](self, "_hysteresisModeForDesiredMode:", v17, v16);
  if ((unint64_t)(v19 - 2) < 2)
  {
    [(CAMLevelViewModel *)self _updateStraightModeWithMode:v19 roll:v24 pitch:v23];
  }
  else if (v19)
  {
    if (v19 == 1)
    {
      *(float *)&double v21 = v15;
      LODWORD(v20) = HIDWORD(v25);
      LODWORD(v22) = v25;
      [(CAMLevelViewModel *)self _updateFlatModeWithRoll:v20 pitch:v21 magnitude:v22];
    }
  }
  else
  {
    [(CAMLevelViewModel *)self _updateModeNone];
  }
}

- (void)_updateModeNone
{
}

void __36__CAMLevelViewModel__updateModeNone__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _setDesiredUpdateInterval:0.1];
  [v2 _setCurrentIndicatorMode:0];
  [v2 _setCurrentIndicatorAlpha:0.0];
}

- (void)_updateFlatModeWithRoll:(float)a3 pitch:(float)a4 magnitude:(float)a5
{
  int64_t v7 = [(CAMLevelViewModel *)self currentIndicatorMode];
  [(CAMLevelViewModel *)self currentIndicatorOffset];
  uint64_t v8 = *MEMORY[0x263F838D8];
  double v9 = *(double *)(MEMORY[0x263F838D8] + 8);
  BOOL v11 = v10 == *MEMORY[0x263F838D8];
  if (v12 != v9) {
    BOOL v11 = 0;
  }
  if (v7 != 1) {
    BOOL v11 = 0;
  }
  if (a5 >= 0.025) {
    BOOL v11 = 0;
  }
  double v13 = 1.0;
  if (a5 >= 0.0175 && !v11)
  {
    double v14 = (a5 + -0.125) * -8.0 + 1.0;
    if (v14 > 1.0) {
      double v14 = 1.0;
    }
    double v13 = fmax(v14, 0.0);
    double v15 = [MEMORY[0x263F82B60] mainScreen];
    UIRoundToScreenScale();
    uint64_t v8 = v16;
    UIRoundToScreenScale();
    double v9 = v17;
  }
  [(CAMLevelViewModel *)self currentIndicatorAlpha];
  [(CAMLevelViewModel *)self _hysteresisAlphaForDesiredAlpha:v13 fromCurrentAlpha:v18];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __61__CAMLevelViewModel__updateFlatModeWithRoll_pitch_magnitude___block_invoke;
  v20[3] = &__block_descriptor_56_e27_v16__0__CAMLevelViewModel_8l;
  v20[4] = v8;
  *(double *)&v20[5] = v9;
  v20[6] = v19;
  [(CAMObservable *)self performChanges:v20];
}

void __61__CAMLevelViewModel__updateFlatModeWithRoll_pitch_magnitude___block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  [v3 _setDesiredUpdateInterval:0.0166666667];
  [v3 _setCurrentIndicatorMode:1];
  objc_msgSend(v3, "_setCurrentIndicatorOffset:", a1[4], a1[5]);
  [v3 _setCurrentIndicatorAlpha:a1[6]];
}

- (void)_updateStraightModeWithMode:(int64_t)a3 roll:(double)a4 pitch:(double)a5
{
  double v8 = fabs(a4);
  int64_t v9 = [(CAMLevelViewModel *)self currentIndicatorMode];
  [(CAMLevelViewModel *)self currentIndicatorRotationAngle];
  BOOL v10 = v8 < 0.0150000006;
  if (v11 != 0.0 || (v9 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    BOOL v10 = 0;
  }
  double v13 = 0.0;
  double v14 = 1.0;
  if (v8 >= 0.0125000002 && !v10)
  {
    CEKProgressClamped();
    CEKInterpolateClamped();
    double v14 = v15;
    double v13 = a4;
  }
  CEKProgressClamped();
  CEKInterpolateClamped();
  double v17 = v16;
  if (v13 != 0.0)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    -[CAMLevelViewModel _setLastNonZeroAngleTime:](self, "_setLastNonZeroAngleTime:");
  }
  if (v14 >= v17) {
    double v14 = v17;
  }
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v19 = v18;
  [(CAMLevelViewModel *)self _lastNonZeroAngleTime];
  double v21 = fmin(v14, 0.0);
  if (v19 - v20 <= 0.8) {
    double v22 = v14;
  }
  else {
    double v22 = v21;
  }
  [(CAMLevelViewModel *)self currentIndicatorAlpha];
  [(CAMLevelViewModel *)self _hysteresisAlphaForDesiredAlpha:v22 fromCurrentAlpha:v23];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __60__CAMLevelViewModel__updateStraightModeWithMode_roll_pitch___block_invoke;
  v25[3] = &__block_descriptor_56_e27_v16__0__CAMLevelViewModel_8l;
  v25[4] = a3;
  *(double *)&v25[5] = v13;
  v25[6] = v24;
  [(CAMObservable *)self performChanges:v25];
}

void __60__CAMLevelViewModel__updateStraightModeWithMode_roll_pitch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 _setDesiredUpdateInterval:0.0166666667];
  [v3 _setCurrentIndicatorMode:*(void *)(a1 + 32)];
  [v3 _setCurrentIndicatorRotationAngle:*(double *)(a1 + 40)];
  [v3 _setCurrentIndicatorAlpha:*(double *)(a1 + 48)];
}

- (double)_hysteresisAlphaForDesiredAlpha:(double)result fromCurrentAlpha:(double)a4
{
  double v4 = fmax(a4 + -0.0833333333, 0.0);
  double v5 = a4 + 0.0833333333;
  if (v5 > 1.0) {
    double v5 = 1.0;
  }
  if (v5 < result) {
    result = v5;
  }
  if (v4 >= result) {
    return v4;
  }
  return result;
}

- (int64_t)_hysteresisModeForDesiredMode:(int64_t)a3
{
  int64_t v3 = a3;
  if ([(CAMLevelViewModel *)self _desiredIndicatorMode] != a3)
  {
    [(CAMLevelViewModel *)self _setDesiredIndicatorMode:v3];
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    -[CAMLevelViewModel _setDesiredModeBeganTime:](self, "_setDesiredModeBeganTime:");
  }
  int64_t v5 = [(CAMLevelViewModel *)self currentIndicatorMode];
  int64_t v6 = v5;
  if (v3 || !v5)
  {
    if (v3)
    {
      if (!v5)
      {
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        double v10 = v9;
        [(CAMLevelViewModel *)self _desiredModeBeganTime];
        if (v10 - v11 < 0.5) {
          return 0;
        }
      }
    }
  }
  else
  {
    [(CAMLevelViewModel *)self currentIndicatorAlpha];
    [(CAMLevelViewModel *)self _hysteresisAlphaForDesiredAlpha:0.0 fromCurrentAlpha:v7];
    if (v8 <= 0.0) {
      return 0;
    }
    else {
      return v6;
    }
  }
  return v3;
}

- (void)_setCurrentIndicatorMode:(int64_t)a3
{
  if (self->_currentIndicatorMode != a3)
  {
    self->_currentIndicatorMode = a3;
    [(CAMObservable *)self signalChange:1];
  }
}

- (void)_setCurrentIndicatorOffset:(UIOffset)a3
{
  if (a3.horizontal != self->_currentIndicatorOffset.horizontal
    || a3.vertical != self->_currentIndicatorOffset.vertical)
  {
    self->_currentIndicatorOffset = a3;
    [(CAMObservable *)self signalChange:2];
  }
}

- (void)_setCurrentIndicatorRotationAngle:(double)a3
{
  if (self->_currentIndicatorRotationAngle != a3)
  {
    self->_currentIndicatorRotationAngle = a3;
    [(CAMObservable *)self signalChange:16];
  }
}

- (void)_setCurrentIndicatorAlpha:(double)a3
{
  if (self->_currentIndicatorAlpha != a3)
  {
    self->_currentIndicatorAlpha = a3;
    [(CAMObservable *)self signalChange:4];
  }
}

- (void)_setDesiredUpdateInterval:(double)a3
{
  if (self->_desiredUpdateInterval != a3)
  {
    self->_desiredUpdateInterval = a3;
    [(CAMObservable *)self signalChange:8];
  }
}

- (int64_t)currentIndicatorMode
{
  return self->_currentIndicatorMode;
}

- (double)currentIndicatorAlpha
{
  return self->_currentIndicatorAlpha;
}

- (UIOffset)currentIndicatorOffset
{
  double horizontal = self->_currentIndicatorOffset.horizontal;
  double vertical = self->_currentIndicatorOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (double)currentIndicatorRotationAngle
{
  return self->_currentIndicatorRotationAngle;
}

- (double)desiredUpdateInterval
{
  return self->_desiredUpdateInterval;
}

- (int64_t)_desiredIndicatorMode
{
  return self->__desiredIndicatorMode;
}

- (void)_setDesiredIndicatorMode:(int64_t)a3
{
  self->__desiredIndicatorMode = a3;
}

- (double)_desiredModeBeganTime
{
  return self->__desiredModeBeganTime;
}

- (void)_setDesiredModeBeganTime:(double)a3
{
  self->__desiredModeBeganTime = a3;
}

- (double)_lastNonZeroAngleTime
{
  return self->__lastNonZeroAngleTime;
}

- (void)_setLastNonZeroAngleTime:(double)a3
{
  self->__lastNonZeroAngleTime = a3;
}

@end