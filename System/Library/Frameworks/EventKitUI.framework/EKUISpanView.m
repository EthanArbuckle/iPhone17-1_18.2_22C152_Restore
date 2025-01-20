@interface EKUISpanView
- (BOOL)inset;
- (NSDate)endDate;
- (NSDate)startDate;
- (void)setEndDate:(id)a3;
- (void)setInset:(BOOL)a3;
- (void)setStartDate:(id)a3;
@end

@implementation EKUISpanView

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 416, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 424, 1);
}

- (void)setEndDate:(id)a3
{
}

- (BOOL)inset
{
  return self->_inset;
}

- (void)setInset:(BOOL)a3
{
  self->_inset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end