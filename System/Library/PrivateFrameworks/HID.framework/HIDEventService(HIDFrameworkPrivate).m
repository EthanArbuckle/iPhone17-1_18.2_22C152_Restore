@interface HIDEventService(HIDFrameworkPrivate)
- (uint64_t)dispatchEvent:()HIDFrameworkPrivate;
@end

@implementation HIDEventService(HIDFrameworkPrivate)

- (uint64_t)dispatchEvent:()HIDFrameworkPrivate
{
  return MEMORY[0x1F40E92C8](a1, a3);
}

@end