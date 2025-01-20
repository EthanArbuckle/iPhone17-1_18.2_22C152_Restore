@interface HIDEventService
- (id)description;
- (void)dealloc;
@end

@implementation HIDEventService

- (id)description
{
  v2 = (__CFString *)IOHIDServiceCopyDescription((uint64_t)self);

  return v2;
}

- (void)dealloc
{
  _IOHIDServiceReleasePrivate((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HIDEventService;
  [(HIDEventService *)&v3 dealloc];
}

@end