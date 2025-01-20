@interface HKBirthdateChangeStatus
- (BOOL)shouldShowWarning;
- (BOOL)success;
- (int64_t)newAge;
- (void)setNewAge:(int64_t)a3;
- (void)setShouldShowWarning:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation HKBirthdateChangeStatus

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (int64_t)newAge
{
  return self->_newAge;
}

- (void)setNewAge:(int64_t)a3
{
  self->_newAge = a3;
}

- (BOOL)shouldShowWarning
{
  return self->_shouldShowWarning;
}

- (void)setShouldShowWarning:(BOOL)a3
{
  self->_shouldShowWarning = a3;
}

@end