@interface HMIVideoNode
- (NSError)error;
- (int64_t)status;
@end

@implementation HMIVideoNode

- (int64_t)status
{
  return self->_status;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end