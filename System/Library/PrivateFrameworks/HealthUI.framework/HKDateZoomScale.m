@interface HKDateZoomScale
- (BOOL)isEqual:(id)a3;
- (HKDateZoomScale)initWithCurrentCalendar:(id)a3;
- (NSCalendar)currentCalendar;
- (double)zoomScaleForRange:(HKRange)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)maxDate;
- (id)minDate;
- (id)unitZoomScaleValueRange;
- (int64_t)zoomForZoomScale:(double)a3;
- (void)setCurrentCalendar:(id)a3;
- (void)setUnitZoomScaleValueRangeForTimeInterval:(double)a3;
@end

@implementation HKDateZoomScale

- (HKDateZoomScale)initWithCurrentCalendar:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDateZoomScale;
  v6 = [(HKDateZoomScale *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_currentCalendar, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKDateZoomScale *)a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (v4 == self)
    {
      char v6 = 1;
    }
    else
    {
      v7 = v4;
      v8 = [(HKDateZoomScale *)self unitZoomScaleValueRange];
      objc_super v9 = [(HKDateZoomScale *)v7 unitZoomScaleValueRange];
      if (v8 == v9)
      {
        char v6 = 1;
      }
      else
      {
        v10 = [(HKDateZoomScale *)v7 unitZoomScaleValueRange];
        if (v10)
        {
          v11 = [(HKDateZoomScale *)self unitZoomScaleValueRange];
          v12 = [(HKDateZoomScale *)v7 unitZoomScaleValueRange];
          char v6 = [v11 isEqual:v12];
        }
        else
        {
          char v6 = 0;
        }
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[HKDateZoomScale allocWithZone:a3] init];
  uint64_t v5 = [(HKValueRange *)self->_unitZoomScaleValueRange copy];
  unitZoomScaleValueRange = v4->_unitZoomScaleValueRange;
  v4->_unitZoomScaleValueRange = (HKValueRange *)v5;

  return v4;
}

- (id)minDate
{
  v2 = [(HKDateZoomScale *)self unitZoomScaleValueRange];
  v3 = [v2 startDate];

  return v3;
}

- (id)maxDate
{
  v2 = [(HKDateZoomScale *)self unitZoomScaleValueRange];
  v3 = [v2 endDate];

  return v3;
}

- (int64_t)zoomForZoomScale:(double)a3
{
  if (HKUIEqualCGFloats(a3, self->_previousZoomScale)) {
    return self->_previousZoom;
  }
  char v6 = [(HKDateZoomScale *)self minDate];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  objc_super v9 = [(HKDateZoomScale *)self maxDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  unint64_t v12 = 0;
  double v13 = (v11 - v8) / a3;
  do
  {
    v14 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:v12];
    [v14 zoomLevelThreshold];
    double v16 = v15;

    if (v13 >= v16) {
      break;
    }
    ++v12;
  }
  while (v12 != 8);
  if (v12 >= 7) {
    int64_t result = 7;
  }
  else {
    int64_t result = v12;
  }
  self->_previousZoom = result;
  self->_previousZoomScale = a3;
  return result;
}

- (double)zoomScaleForRange:(HKRange)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  char v6 = [(HKDateZoomScale *)self minDate];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  objc_super v9 = [(HKDateZoomScale *)self maxDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  return (v11 - v8) / (var0 + var1 - var0);
}

- (id)unitZoomScaleValueRange
{
  return self->_unitZoomScaleValueRange;
}

- (void)setUnitZoomScaleValueRangeForTimeInterval:(double)a3
{
  uint64_t v5 = [(HKDateZoomScale *)self currentCalendar];
  char v6 = objc_msgSend(v5, "hk_dateWithDurationSinceReferenceDate:calendarUnit:", 16, 0.0);
  double v7 = [(HKDateZoomScale *)self currentCalendar];
  double v8 = objc_msgSend(v7, "hk_dateWithDurationSinceReferenceDate:calendarUnit:", 16, a3);
  objc_super v9 = +[HKValueRange valueRangeWithMinValue:v6 maxValue:v8];
  unitZoomScaleValueRange = self->_unitZoomScaleValueRange;
  self->_unitZoomScaleValueRange = v9;

  self->_previousZoomScale = 0.0;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_unitZoomScaleValueRange, 0);
}

@end