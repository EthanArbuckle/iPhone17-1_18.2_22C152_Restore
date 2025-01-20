@interface VCQoSReportSource
- (int64_t)sourceToken;
- (void)setSourceToken:(int64_t)a3;
@end

@implementation VCQoSReportSource

- (int64_t)sourceToken
{
  return self->_sourceToken;
}

- (void)setSourceToken:(int64_t)a3
{
  self->_sourceToken = a3;
}

@end