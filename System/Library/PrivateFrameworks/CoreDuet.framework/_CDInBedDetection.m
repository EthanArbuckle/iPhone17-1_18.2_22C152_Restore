@interface _CDInBedDetection
- (NSDate)endDate;
- (NSDate)startDate;
- (double)confidence;
- (double)duration;
- (void)setConfidence:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation _CDInBedDetection

- (double)duration
{
  [(NSDate *)self->_endDate timeIntervalSinceDate:self->_startDate];
  return result;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndDate:(id)a3
{
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end