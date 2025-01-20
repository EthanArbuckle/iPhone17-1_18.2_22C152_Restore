@interface HIDEventService(HIDFramework)
- (BOOL)conformsToUsagePage:()HIDFramework usage:;
- (BOOL)setProperty:()HIDFramework forKey:;
- (id)eventMatching:()HIDFramework;
- (id)propertyForKey:()HIDFramework;
- (uint64_t)serviceID;
@end

@implementation HIDEventService(HIDFramework)

- (id)propertyForKey:()HIDFramework
{
  v0 = (void *)IOHIDServiceCopyProperty();
  return v0;
}

- (uint64_t)serviceID
{
  v0 = IOHIDServiceGetRegistryID();
  v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 unsignedLongLongValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (BOOL)setProperty:()HIDFramework forKey:
{
  return IOHIDServiceSetProperty() != 0;
}

- (BOOL)conformsToUsagePage:()HIDFramework usage:
{
  return IOHIDServiceConformsTo() != 0;
}

- (id)eventMatching:()HIDFramework
{
  v0 = (void *)IOHIDServiceCopyMatchingEvent();
  return v0;
}

@end