@interface NSURL(NSKeyValueObservingCustomization)
+ (uint64_t)automaticallyNotifiesObserversForKey:()NSKeyValueObservingCustomization;
@end

@implementation NSURL(NSKeyValueObservingCustomization)

+ (uint64_t)automaticallyNotifiesObserversForKey:()NSKeyValueObservingCustomization
{
  return 0;
}

@end