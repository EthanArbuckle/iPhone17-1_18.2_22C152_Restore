@interface HKChartPointRangeBuilder
- (HKChartPointRangeBuilder)init;
- (double)maximumMax;
- (double)minimumMin;
- (double)uMax;
- (double)uMin;
- (double)vMax;
- (double)vMin;
- (id)suggestedValueRangeWithRounding:(BOOL)a3;
- (int64_t)numChartPoints;
- (void)setMaximumMax:(double)a3;
- (void)setMinimumMin:(double)a3;
- (void)setNumChartPoints:(int64_t)a3;
- (void)setUMax:(double)a3;
- (void)setUMin:(double)a3;
- (void)setVMax:(double)a3;
- (void)setVMin:(double)a3;
- (void)visitChartPoint:(id)a3;
@end

@implementation HKChartPointRangeBuilder

- (HKChartPointRangeBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKChartPointRangeBuilder;
  result = [(HKChartPointRangeBuilder *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_maximumMax = xmmword_1E0F06090;
  }
  return result;
}

- (id)suggestedValueRangeWithRounding:(BOOL)a3
{
  if (self->_numChartPoints)
  {
    double minimumMin = fmax(self->_uMin + sqrt(self->_vMin) * -1.25, 0.0);
    double v4 = self->_uMax + sqrt(self->_vMax) * 1.25;
    if (minimumMin < self->_minimumMin) {
      double minimumMin = self->_minimumMin;
    }
    double maximumMax = fmax(v4, 0.0);
    if (maximumMax >= self->_maximumMax) {
      double maximumMax = self->_maximumMax;
    }
    double v6 = floor(minimumMin);
    double v7 = ceil(maximumMax);
    if (a3) {
      double v8 = v7;
    }
    else {
      double v8 = maximumMax;
    }
    if (a3) {
      double minimumMin = v6;
    }
    v9 = [NSNumber numberWithDouble:minimumMin];
    v10 = [NSNumber numberWithDouble:v8];
    v11 = +[HKValueRange valueRangeWithMinValue:v9 maxValue:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)visitChartPoint:(id)a3
{
  id v4 = a3;
  v5 = [v4 maxYValue];
  [v5 doubleValue];
  double v27 = v6;

  double v7 = [v4 minYValue];

  [v7 doubleValue];
  double v26 = v8;

  v9.f64[0] = v27;
  if (v27 > -1.79769313e308 && v26 < 1.79769313e308)
  {
    int64_t numChartPoints = self->_numChartPoints;
    int64_t v12 = numChartPoints + 1;
    double v13 = (double)numChartPoints;
    double uMax = self->_uMax;
    double uMin = self->_uMin;
    double v16 = (double)(numChartPoints + 1);
    double v17 = (v27 + uMax * (double)numChartPoints) / v16;
    double v18 = (v26 + uMin * (double)numChartPoints) / v16;
    BOOL v19 = numChartPoints <= 1;
    uint64_t v20 = numChartPoints - 1;
    if (v19)
    {
      double v21 = 0.0;
      double v22 = 0.0;
    }
    else
    {
      double v21 = ((v27 - uMax) * (v27 - v17) + (double)v20 * self->_vMax) / v13;
      double v22 = ((v26 - uMin) * (v26 - v18) + (double)v20 * self->_vMin) / v13;
    }
    self->_double uMax = v17;
    self->_double uMin = v18;
    self->_vMax = v21;
    self->_vMin = v22;
    float64x2_t v23 = *(float64x2_t *)&self->_maximumMax;
    v24.i64[1] = *(void *)&self->_minimumMin;
    *(double *)v24.i64 = v27;
    v9.f64[1] = v26;
    int8x16_t v25 = (int8x16_t)vcgtq_f64(v9, v23);
    v23.f64[1] = v26;
    *(int8x16_t *)&self->_double maximumMax = vbslq_s8(v25, v24, (int8x16_t)v23);
    self->_int64_t numChartPoints = v12;
  }
}

- (double)uMax
{
  return self->_uMax;
}

- (void)setUMax:(double)a3
{
  self->_double uMax = a3;
}

- (double)uMin
{
  return self->_uMin;
}

- (void)setUMin:(double)a3
{
  self->_double uMin = a3;
}

- (double)vMax
{
  return self->_vMax;
}

- (void)setVMax:(double)a3
{
  self->_vMax = a3;
}

- (double)vMin
{
  return self->_vMin;
}

- (void)setVMin:(double)a3
{
  self->_vMin = a3;
}

- (double)maximumMax
{
  return self->_maximumMax;
}

- (void)setMaximumMax:(double)a3
{
  self->_double maximumMax = a3;
}

- (double)minimumMin
{
  return self->_minimumMin;
}

- (void)setMinimumMin:(double)a3
{
  self->_double minimumMin = a3;
}

- (int64_t)numChartPoints
{
  return self->_numChartPoints;
}

- (void)setNumChartPoints:(int64_t)a3
{
  self->_int64_t numChartPoints = a3;
}

@end