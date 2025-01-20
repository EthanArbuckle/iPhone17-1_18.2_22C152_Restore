@interface BWMetadataTimeMachineWaitRequest
- (id)description;
@end

@implementation BWMetadataTimeMachineWaitRequest

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>: Capacity:%d, completion capacity:%d", objc_opt_class(), self, self->_capacity, self->_completionCapacity];
}

@end