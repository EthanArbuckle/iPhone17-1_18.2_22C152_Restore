@interface AuditProhibitedAccessoryOperationResult
- (BOOL)shouldReschedule;
- (NSError)error;
- (void)setError:(id)a3;
- (void)setShouldReschedule:(BOOL)a3;
@end

@implementation AuditProhibitedAccessoryOperationResult

- (void).cxx_destruct
{
}

- (void)setShouldReschedule:(BOOL)a3
{
  self->_shouldReschedule = a3;
}

- (BOOL)shouldReschedule
{
  return self->_shouldReschedule;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

@end