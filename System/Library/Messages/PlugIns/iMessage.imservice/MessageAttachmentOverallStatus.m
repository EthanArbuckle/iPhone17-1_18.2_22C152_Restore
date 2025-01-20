@interface MessageAttachmentOverallStatus
- (BOOL)failed;
- (unsigned)error;
- (void)setError:(unsigned int)a3;
- (void)setFailed:(BOOL)a3;
@end

@implementation MessageAttachmentOverallStatus

- (BOOL)failed
{
  return self->_failed;
}

- (void)setFailed:(BOOL)a3
{
  self->_failed = a3;
}

- (unsigned)error
{
  return self->_error;
}

- (void)setError:(unsigned int)a3
{
  self->_error = a3;
}

@end