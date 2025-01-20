@interface HKInteractiveChartCategoryValueData
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (int64_t)value;
- (unint64_t)hash;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setValue:(int64_t)a3;
@end

@implementation HKInteractiveChartCategoryValueData

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(HKInteractiveChartCategoryValueData *)self value];
    if (v6 == [v5 value])
    {
      v7 = [(HKInteractiveChartCategoryValueData *)self startDate];
      v8 = [v5 startDate];
      if (v7 == v8)
      {
        v10 = [(HKInteractiveChartCategoryValueData *)self endDate];
        v11 = [v5 endDate];
        BOOL v9 = v10 == v11;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(HKInteractiveChartCategoryValueData *)self startDate];
  uint64_t v4 = [v3 hash];
  id v5 = [(HKInteractiveChartCategoryValueData *)self endDate];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(HKInteractiveChartCategoryValueData *)self value];

  return v7;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end