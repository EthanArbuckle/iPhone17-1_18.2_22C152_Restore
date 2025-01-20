@interface CDPurgeServiceRequestResult
- (unint64_t)reportedBytes;
- (unint64_t)requestedBytes;
- (void)setReportedBytes:(unint64_t)a3;
- (void)setRequestedBytes:(unint64_t)a3;
@end

@implementation CDPurgeServiceRequestResult

- (unint64_t)requestedBytes
{
  return self->_requestedBytes;
}

- (void)setRequestedBytes:(unint64_t)a3
{
  self->_requestedBytes = a3;
}

- (unint64_t)reportedBytes
{
  return self->_reportedBytes;
}

- (void)setReportedBytes:(unint64_t)a3
{
  self->_reportedBytes = a3;
}

@end