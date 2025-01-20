@interface _HKBloodGlucosePercentInRangeChartPoint
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (NSDate)midDate;
- (NSNumber)fractionBelowUpperEuglycemiaBound;
- (NSNumber)fractionBelowUpperLevel1HypoglycemiaBound;
- (NSNumber)fractionBelowUpperLevel2HypoglycemiaBound;
- (_HKBloodGlucosePercentInRangeChartPoint)initWithStartDate:(id)a3 endDate:(id)a4 userInfo:(id)a5;
- (id)allYValues;
- (id)minYValue;
- (id)xValueAsGenericType;
- (id)yValue;
- (id)yValueForKey:(id)a3;
- (void)setFractionBelowUpperEuglycemiaBound:(id)a3;
- (void)setFractionBelowUpperLevel1HypoglycemiaBound:(id)a3;
- (void)setFractionBelowUpperLevel2HypoglycemiaBound:(id)a3;
- (void)setMidDate:(id)a3;
@end

@implementation _HKBloodGlucosePercentInRangeChartPoint

- (_HKBloodGlucosePercentInRangeChartPoint)initWithStartDate:(id)a3 endDate:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)_HKBloodGlucosePercentInRangeChartPoint;
  v11 = [(_HKBloodGlucosePercentInRangeChartPoint *)&v28 init];
  if (v11)
  {
    uint64_t v12 = HKUIMidDate(v8, v9);
    midDate = v11->_midDate;
    v11->_midDate = (NSDate *)v12;

    [v10 fractionForClassification:0];
    double v15 = v14;
    [v10 fractionForClassification:1];
    double v17 = v16;
    [v10 fractionForClassification:2];
    double v19 = v18;
    uint64_t v20 = [NSNumber numberWithDouble:v15];
    fractionBelowUpperLevel2HypoglycemiaBound = v11->_fractionBelowUpperLevel2HypoglycemiaBound;
    v11->_fractionBelowUpperLevel2HypoglycemiaBound = (NSNumber *)v20;

    double v22 = v15 + v17;
    uint64_t v23 = [NSNumber numberWithDouble:v22];
    fractionBelowUpperLevel1HypoglycemiaBound = v11->_fractionBelowUpperLevel1HypoglycemiaBound;
    v11->_fractionBelowUpperLevel1HypoglycemiaBound = (NSNumber *)v23;

    uint64_t v25 = [NSNumber numberWithDouble:v22 + v19];
    fractionBelowUpperEuglycemiaBound = v11->_fractionBelowUpperEuglycemiaBound;
    v11->_fractionBelowUpperEuglycemiaBound = (NSNumber *)v25;

    objc_storeStrong((id *)&v11->_userInfo, a5);
  }

  return v11;
}

- (id)xValueAsGenericType
{
  return self->_midDate;
}

- (id)yValue
{
  return &unk_1F3C22BA0;
}

- (id)yValueForKey:(id)a3
{
  return 0;
}

- (id)allYValues
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&self->_fractionBelowUpperLevel2HypoglycemiaBound;
  fractionBelowUpperEuglycemiaBound = self->_fractionBelowUpperEuglycemiaBound;
  v6 = &unk_1F3C22BA0;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:4];
  return v2;
}

- (id)minYValue
{
  return &unk_1F3C22618;
}

- (NSDate)midDate
{
  return self->_midDate;
}

- (void)setMidDate:(id)a3
{
}

- (NSNumber)fractionBelowUpperLevel2HypoglycemiaBound
{
  return self->_fractionBelowUpperLevel2HypoglycemiaBound;
}

- (void)setFractionBelowUpperLevel2HypoglycemiaBound:(id)a3
{
}

- (NSNumber)fractionBelowUpperLevel1HypoglycemiaBound
{
  return self->_fractionBelowUpperLevel1HypoglycemiaBound;
}

- (void)setFractionBelowUpperLevel1HypoglycemiaBound:(id)a3
{
}

- (NSNumber)fractionBelowUpperEuglycemiaBound
{
  return self->_fractionBelowUpperEuglycemiaBound;
}

- (void)setFractionBelowUpperEuglycemiaBound:(id)a3
{
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_fractionBelowUpperEuglycemiaBound, 0);
  objc_storeStrong((id *)&self->_fractionBelowUpperLevel1HypoglycemiaBound, 0);
  objc_storeStrong((id *)&self->_fractionBelowUpperLevel2HypoglycemiaBound, 0);
  objc_storeStrong((id *)&self->_midDate, 0);
}

@end