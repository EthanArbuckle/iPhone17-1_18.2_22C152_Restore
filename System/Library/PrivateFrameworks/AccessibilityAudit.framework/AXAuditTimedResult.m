@interface AXAuditTimedResult
- (NSDate)endTime;
- (NSDate)startTime;
- (NSString)executionTimeString;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation AXAuditTimedResult

- (NSString)executionTimeString
{
  v3 = [(AXAuditTimedResult *)self endTime];
  v4 = [(AXAuditTimedResult *)self startTime];
  v5 = [v3 axAuditLogStringForDifferenceFromDate:v4];

  return (NSString *)v5;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end