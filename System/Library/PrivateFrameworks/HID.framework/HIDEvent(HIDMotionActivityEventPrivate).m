@interface HIDEvent(HIDMotionActivityEventPrivate)
- (uint64_t)motionActivityActivityType;
- (uint64_t)motionActivityConfidence;
- (uint64_t)setMotionActivityActivityType:()HIDMotionActivityEventPrivate;
- (uint64_t)setMotionActivityConfidence:()HIDMotionActivityEventPrivate;
@end

@implementation HIDEvent(HIDMotionActivityEventPrivate)

- (uint64_t)motionActivityActivityType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setMotionActivityActivityType:()HIDMotionActivityEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2162688);
}

- (uint64_t)motionActivityConfidence
{
  return MEMORY[0x1F40E89F8](a1, 2162689);
}

- (uint64_t)setMotionActivityConfidence:()HIDMotionActivityEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2162689);
}

@end