@interface WFHKContentQueryData
- (HKCategoryType)categoryType;
- (HKQuantityType)quantityType;
- (HKSampleType)sampleType;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)sourceName;
- (void)setCategoryType:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setQuantityType:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation WFHKContentQueryData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)setSourceName:(id)a3
{
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setCategoryType:(id)a3
{
}

- (HKCategoryType)categoryType
{
  return self->_categoryType;
}

- (void)setQuantityType:(id)a3
{
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (HKSampleType)sampleType
{
  v3 = [(WFHKContentQueryData *)self quantityType];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(WFHKContentQueryData *)self categoryType];
  }
  v6 = v5;

  return (HKSampleType *)v6;
}

@end