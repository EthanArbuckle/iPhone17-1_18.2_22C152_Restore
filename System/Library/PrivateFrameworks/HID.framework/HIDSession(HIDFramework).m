@interface HIDSession(HIDFramework)
- (BOOL)setProperty:()HIDFramework forKey:;
- (uint64_t)propertyForKey:()HIDFramework;
@end

@implementation HIDSession(HIDFramework)

- (uint64_t)propertyForKey:()HIDFramework
{
  return MEMORY[0x1F40E8DB8](a1, a3);
}

- (BOOL)setProperty:()HIDFramework forKey:
{
  return IOHIDSessionSetProperty() != 0;
}

@end