@interface MIFileManagerCopyfileContext
- (BOOL)ignoreErrors;
- (NSError)error;
- (void)setError:(id)a3;
- (void)setIgnoreErrors:(BOOL)a3;
@end

@implementation MIFileManagerCopyfileContext

- (BOOL)ignoreErrors
{
  return self->_ignoreErrors;
}

- (void)setIgnoreErrors:(BOOL)a3
{
  self->_ignoreErrors = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end