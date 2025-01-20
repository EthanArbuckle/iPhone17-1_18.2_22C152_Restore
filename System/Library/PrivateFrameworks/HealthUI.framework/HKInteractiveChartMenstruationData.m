@interface HKInteractiveChartMenstruationData
- (BOOL)startOfCycle;
- (NSDate)date;
- (int64_t)value;
- (void)setDate:(id)a3;
- (void)setStartOfCycle:(BOOL)a3;
- (void)setValue:(int64_t)a3;
@end

@implementation HKInteractiveChartMenstruationData

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BOOL)startOfCycle
{
  return self->_startOfCycle;
}

- (void)setStartOfCycle:(BOOL)a3
{
  self->_startOfCycle = a3;
}

- (void).cxx_destruct
{
}

@end