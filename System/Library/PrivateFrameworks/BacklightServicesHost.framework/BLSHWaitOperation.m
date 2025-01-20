@interface BLSHWaitOperation
- (BOOL)isCompleted;
- (BOOL)isStarted;
- (int64_t)type;
- (void)setCompleted:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
@end

@implementation BLSHWaitOperation

- (int64_t)type
{
  return 6;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

@end