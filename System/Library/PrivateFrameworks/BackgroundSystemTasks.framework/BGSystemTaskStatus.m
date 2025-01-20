@interface BGSystemTaskStatus
- (NSSet)blockingReasons;
- (int64_t)status;
@end

@implementation BGSystemTaskStatus

- (int64_t)status
{
  return self->_status;
}

- (NSSet)blockingReasons
{
  return self->_blockingReasons;
}

- (void).cxx_destruct
{
}

@end