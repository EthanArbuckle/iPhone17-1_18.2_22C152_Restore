@interface HKInsulinChartPoint
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (HKInsulinChartPoint)initWithStartDate:(id)a3 endDate:(id)a4;
- (NSDate)midDate;
- (NSDate)startDate;
- (NSNumber)basalSum;
- (NSNumber)totalSum;
- (id)allYValues;
- (id)yValueForKey:(id)a3;
- (void)setBasalSum:(id)a3;
- (void)setMidDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTotalSum:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation HKInsulinChartPoint

- (HKInsulinChartPoint)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKInsulinChartPoint;
  v9 = [(HKInsulinChartPoint *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    uint64_t v11 = HKUIMidDate(v7, v8);
    midDate = v10->_midDate;
    v10->_midDate = (NSDate *)v11;
  }
  return v10;
}

- (id)yValueForKey:(id)a3
{
  return 0;
}

- (id)allYValues
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HKInsulinChartPoint *)self basalSum];
  v4 = (void *)v3;
  if (v3) {
    v5 = (void *)v3;
  }
  else {
    v5 = &unk_1F3C222A0;
  }
  v11[0] = v5;
  uint64_t v6 = [(HKInsulinChartPoint *)self totalSum];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (void *)v6;
  }
  else {
    id v8 = &unk_1F3C222A0;
  }
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSNumber)basalSum
{
  return self->_basalSum;
}

- (void)setBasalSum:(id)a3
{
}

- (NSNumber)totalSum
{
  return self->_totalSum;
}

- (void)setTotalSum:(id)a3
{
}

- (NSDate)midDate
{
  return self->_midDate;
}

- (void)setMidDate:(id)a3
{
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_midDate, 0);
  objc_storeStrong((id *)&self->_totalSum, 0);
  objc_storeStrong((id *)&self->_basalSum, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end