@interface HUTemperatureColorWheelSpace
+ ($F24F406B2B787EFB06265DBA3D28CBD5)defaultTemperatureRange;
+ ($F24F406B2B787EFB06265DBA3D28CBD5)largestAllowableTemperatureRange;
- ($01BB1521EC52D44A8E7628F5261DCEC8)colorForCoordinate:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateForColor:(id)a3 isValid:(BOOL *)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)supportedRange;
- (HUTemperatureColorWheelSpace)init;
- (HUTemperatureColorWheelSpace)initWithSupportedRange:(id)a3;
- (unint64_t)mirroringBiasAxis;
- (unint64_t)type;
- (void)setMirroringBiasAxis:(unint64_t)a3;
@end

@implementation HUTemperatureColorWheelSpace

+ ($F24F406B2B787EFB06265DBA3D28CBD5)defaultTemperatureRange
{
  double v2 = 2400.0;
  double v3 = 10000.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)largestAllowableTemperatureRange
{
  double v2 = 1000.0;
  double v3 = 40000.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (HUTemperatureColorWheelSpace)initWithSupportedRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v7.receiver = self;
  v7.super_class = (Class)HUTemperatureColorWheelSpace;
  $F24F406B2B787EFB06265DBA3D28CBD5 result = [(HUTemperatureColorWheelSpace *)&v7 init];
  if (result)
  {
    double v6 = 1000.0;
    if (var0 >= 1000.0) {
      double v6 = var0;
    }
    result->_supportedRange.minimum = v6;
    result->_supportedRange.maximum = fmin(var1, 40000.0);
  }
  return result;
}

- (HUTemperatureColorWheelSpace)init
{
  [(id)objc_opt_class() defaultTemperatureRange];

  return -[HUTemperatureColorWheelSpace initWithSupportedRange:](self, "initWithSupportedRange:");
}

- (unint64_t)type
{
  return 1;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)colorForCoordinate:(id)a3
{
  double var0 = a3.var0;
  if (a3.var0 < 0.0 || a3.var0 > 1.0) {
    NSLog(&cfstr_InputCoordinat.isa, a2, *(void *)&a3.var0);
  }
  for (double i = var0 + -0.25; i < 0.0; double i = i + 1.0)
    ;
  double v7 = i + i;
  if (v7 > 1.0) {
    double v7 = 2.0 - v7;
  }
  if (v7 >= 0.525)
  {
    double v9 = (v7 + -0.525) / 0.475;
    double v10 = v9 * (v9 * v9)
        + v9 * ((1.0 - v9) * ((1.0 - v9) * 3.0)) * 0.25
        + (1.0 - v9) * ((1.0 - v9) * (1.0 - v9)) * 0.0
        + v9 * (v9 * ((1.0 - v9) * 3.0)) * 0.95;
    [(HUTemperatureColorWheelSpace *)self supportedRange];
    double v8 = (v11 + -6600.0) * v10 + 6600.0;
  }
  else if (v7 <= 0.475)
  {
    double v12 = v7 / 0.475;
    double v13 = v12 * (v12 * v12)
        + v12 * ((1.0 - v12) * ((1.0 - v12) * 3.0)) * 0.05
        + (1.0 - v12) * ((1.0 - v12) * (1.0 - v12)) * 0.0
        + v12 * (v12 * ((1.0 - v12) * 3.0)) * 0.75;
    [(HUTemperatureColorWheelSpace *)self supportedRange];
    double v15 = v14;
    [(HUTemperatureColorWheelSpace *)self supportedRange];
    double v8 = v15 + (6600.0 - v16) * v13;
  }
  else
  {
    double v8 = 6600.0;
  }
  HFGetColorForLightTemperature();
  double v18 = *((double *)&HUWheelColorInvalid + 1);
  double v17 = *(double *)&HUWheelColorInvalid;
  double v19 = 1.79769313e308;
  double v20 = v8;
  result.var3 = v20;
  result.var2 = v19;
  result.double var1 = v18;
  result.double var0 = v17;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateForColor:(id)a3 isValid:(BOOL *)a4
{
  if (a3.var3 == 1.79769313e308)
  {
    if (a4) {
      *a4 = 0;
    }
    double v4 = 1.79769313e308;
    goto LABEL_18;
  }
  double var3 = a3.var3;
  [(HUTemperatureColorWheelSpace *)self supportedRange];
  double v8 = fmax(var3, v7);
  [(HUTemperatureColorWheelSpace *)self supportedRange];
  v17[1] = 3221225472;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[2] = __59__HUTemperatureColorWheelSpace_coordinateForColor_isValid___block_invoke;
  v17[3] = &unk_1E638FF10;
  double v10 = fmin(v8, v9);
  *(double *)&v17[5] = v10;
  v17[4] = self;
  __59__HUTemperatureColorWheelSpace_coordinateForColor_isValid___block_invoke((uint64_t)v17);
  double v12 = v11 * 0.5 + 0.25;
  if ([(HUTemperatureColorWheelSpace *)self mirroringBiasAxis] == 1) {
    double v4 = 0.5 - v12;
  }
  else {
    double v4 = v12;
  }
  double v13 = 1.0;
  if (v4 <= 1.0)
  {
    if (v4 >= 0.0) {
      goto LABEL_12;
    }
  }
  else
  {
    double v13 = -1.0;
  }
  double v4 = v4 + v13;
LABEL_12:
  if (v4 < 0.0 || v4 > 1.0) {
    NSLog(&cfstr_InvalidAngleFo.isa, *(void *)&v10);
  }
LABEL_18:
  double v15 = 1.79769313e308;
  double v16 = v4;
  result.double var1 = v15;
  result.double var0 = v16;
  return result;
}

void __59__HUTemperatureColorWheelSpace_coordinateForColor_isValid___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  if (v1 <= 6600.0)
  {
    if (v1 < 6600.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "supportedRange", 0.5);
      double v5 = (v1 - v4) / (6600.0 - v4);
      if (qword_1EBA479A8 != -1) {
        dispatch_once(&qword_1EBA479A8, &__block_literal_global_82_3);
      }
      HUApproximatelyInverseCubicBezierWithSamples(v5, (uint64_t)&HULowTemperatureSmoothingBezierCurvePoints, (uint64_t)&unk_1EBA47A50, 20);
    }
  }
  else
  {
    [*(id *)(a1 + 32) supportedRange];
    double v3 = (v1 + -6600.0) / (v2 + -6600.0);
    if (_MergedGlobals_638 != -1) {
      dispatch_once(&_MergedGlobals_638, &__block_literal_global_267);
    }
    HUApproximatelyInverseCubicBezierWithSamples(v3, (uint64_t)&HUHighTemperatureSmoothingBezierCurvePoints, (uint64_t)&unk_1EBA479B0, 20);
  }
}

- (unint64_t)mirroringBiasAxis
{
  return self->_mirroringBiasAxis;
}

- (void)setMirroringBiasAxis:(unint64_t)a3
{
  self->_mirroringBiasAxis = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)supportedRange
{
  double minimum = self->_supportedRange.minimum;
  double maximum = self->_supportedRange.maximum;
  result.double var1 = maximum;
  result.double var0 = minimum;
  return result;
}

@end