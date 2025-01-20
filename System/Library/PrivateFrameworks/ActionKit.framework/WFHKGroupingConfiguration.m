@interface WFHKGroupingConfiguration
- (BOOL)fillMissing;
- (NSDate)queryEndDate;
- (NSDate)queryStartDate;
- (int64_t)groupingOption;
- (void)setFillMissing:(BOOL)a3;
- (void)setGroupingOption:(int64_t)a3;
- (void)setQueryEndDate:(id)a3;
- (void)setQueryStartDate:(id)a3;
@end

@implementation WFHKGroupingConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryEndDate, 0);
  objc_storeStrong((id *)&self->_queryStartDate, 0);
}

- (void)setQueryEndDate:(id)a3
{
}

- (NSDate)queryEndDate
{
  return self->_queryEndDate;
}

- (void)setQueryStartDate:(id)a3
{
}

- (NSDate)queryStartDate
{
  return self->_queryStartDate;
}

- (void)setFillMissing:(BOOL)a3
{
  self->_fillMissing = a3;
}

- (BOOL)fillMissing
{
  return self->_fillMissing;
}

- (void)setGroupingOption:(int64_t)a3
{
  self->_groupingOption = a3;
}

- (int64_t)groupingOption
{
  return self->_groupingOption;
}

@end