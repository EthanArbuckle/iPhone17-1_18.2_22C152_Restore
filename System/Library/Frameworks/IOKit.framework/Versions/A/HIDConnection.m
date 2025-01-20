@interface HIDConnection
- (id)description;
- (void)dealloc;
@end

@implementation HIDConnection

- (void)dealloc
{
  _IOHIDEventSystemConnectionReleasePrivate((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HIDConnection;
  [(HIDConnection *)&v3 dealloc];
}

- (id)description
{
  v2 = (__CFString *)IOHIDEventSystemConnectionCopyDescription((time_t *)self);

  return v2;
}

@end