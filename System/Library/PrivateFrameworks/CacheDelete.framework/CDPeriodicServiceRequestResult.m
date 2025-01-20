@interface CDPeriodicServiceRequestResult
- (unint64_t)reportedPurgedBytes;
- (void)setReportedPurgedBytes:(unint64_t)a3;
@end

@implementation CDPeriodicServiceRequestResult

- (unint64_t)reportedPurgedBytes
{
  return self->_reportedPurgedBytes;
}

- (void)setReportedPurgedBytes:(unint64_t)a3
{
  self->_reportedPurgedBytes = a3;
}

@end