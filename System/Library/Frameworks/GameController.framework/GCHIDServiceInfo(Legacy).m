@interface GCHIDServiceInfo(Legacy)
- (uint64_t)name;
@end

@implementation GCHIDServiceInfo(Legacy)

- (uint64_t)name
{
  return [a1 stringPropertyForKey:@"Product"];
}

@end