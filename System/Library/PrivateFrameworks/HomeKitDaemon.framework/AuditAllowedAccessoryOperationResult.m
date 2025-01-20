@interface AuditAllowedAccessoryOperationResult
- (BOOL)credentialsRemoved;
- (BOOL)shouldReschedule;
- (NSError)error;
- (void)setCredentialsRemoved:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setShouldReschedule:(BOOL)a3;
@end

@implementation AuditAllowedAccessoryOperationResult

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

- (void)setCredentialsRemoved:(BOOL)a3
{
  self->_credentialsRemoved = a3;
}

- (BOOL)credentialsRemoved
{
  return self->_credentialsRemoved;
}

@end