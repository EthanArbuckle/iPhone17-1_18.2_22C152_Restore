@interface CDPurgeableServiceRequestResult
- (unint64_t)reportedPurgeableBytes;
- (void)setReportedPurgeableBytes:(unint64_t)a3;
@end

@implementation CDPurgeableServiceRequestResult

- (void)setReportedPurgeableBytes:(unint64_t)a3
{
  self->_reportedPurgeableBytes = a3;
}

- (unint64_t)reportedPurgeableBytes
{
  return self->_reportedPurgeableBytes;
}

@end