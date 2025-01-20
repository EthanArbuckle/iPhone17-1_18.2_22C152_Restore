@interface HIDSession
- (void)dealloc;
@end

@implementation HIDSession

- (void)dealloc
{
  _IOHIDSessionReleasePrivate((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HIDSession;
  [(HIDSession *)&v3 dealloc];
}

@end