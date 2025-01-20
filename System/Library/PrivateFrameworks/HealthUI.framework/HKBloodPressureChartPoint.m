@interface HKBloodPressureChartPoint
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (HKHealthChartPoint)diastolicChartPoint;
- (HKHealthChartPoint)systolicChartPoint;
- (NSDate)date;
- (NSString)description;
- (id)allYValues;
- (id)maxYValue;
- (id)minYValue;
- (id)xValueAsGenericType;
- (id)yValue;
- (void)setChartPoint:(id)a3 forType:(id)a4;
- (void)setDate:(id)a3;
- (void)setDiastolicChartPoint:(id)a3;
- (void)setSystolicChartPoint:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation HKBloodPressureChartPoint

- (void)setChartPoint:(id)a3 forType:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v8 code] == 16)
  {
    p_systolicChartPoint = &self->_systolicChartPoint;
LABEL_5:
    objc_storeStrong((id *)p_systolicChartPoint, a3);
    goto LABEL_6;
  }
  if ([v8 code] == 17)
  {
    p_systolicChartPoint = &self->_diastolicChartPoint;
    goto LABEL_5;
  }
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x1E4F29F98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F98], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = [v8 code];
    _os_log_impl(&dword_1E0B26000, v11, OS_LOG_TYPE_DEFAULT, "Attempt to insert chart point %@ for type %ld, this is probably a mistake", (uint8_t *)&v12, 0x16u);
  }
LABEL_6:
}

- (id)xValueAsGenericType
{
  return self->_date;
}

- (id)yValue
{
  systolicChartPoint = self->_systolicChartPoint;
  if (!systolicChartPoint) {
    systolicChartPoint = self->_diastolicChartPoint;
  }
  return [(HKHealthChartPoint *)systolicChartPoint yValue];
}

- (id)allYValues
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  systolicChartPoint = self->_systolicChartPoint;
  if (systolicChartPoint)
  {
    v5 = [(HKHealthChartPoint *)systolicChartPoint yValue];
    [v3 addObject:v5];
  }
  diastolicChartPoint = self->_diastolicChartPoint;
  if (diastolicChartPoint)
  {
    id v7 = [(HKHealthChartPoint *)diastolicChartPoint yValue];
    [v3 addObject:v7];
  }
  return v3;
}

- (id)minYValue
{
  diastolicChartPoint = self->_diastolicChartPoint;
  if (!diastolicChartPoint) {
    diastolicChartPoint = self->_systolicChartPoint;
  }
  return [(HKHealthChartPoint *)diastolicChartPoint minYValue];
}

- (id)maxYValue
{
  systolicChartPoint = self->_systolicChartPoint;
  if (!systolicChartPoint) {
    systolicChartPoint = self->_diastolicChartPoint;
  }
  return [(HKHealthChartPoint *)systolicChartPoint maxYValue];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p> date: %@, systole: %@, diastole: %@", objc_opt_class(), self, self->_date, self->_systolicChartPoint, self->_diastolicChartPoint];
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (HKHealthChartPoint)systolicChartPoint
{
  return self->_systolicChartPoint;
}

- (void)setSystolicChartPoint:(id)a3
{
}

- (HKHealthChartPoint)diastolicChartPoint
{
  return self->_diastolicChartPoint;
}

- (void)setDiastolicChartPoint:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_diastolicChartPoint, 0);
  objc_storeStrong((id *)&self->_systolicChartPoint, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end