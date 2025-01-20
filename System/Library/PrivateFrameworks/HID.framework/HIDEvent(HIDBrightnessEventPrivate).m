@interface HIDEvent(HIDBrightnessEventPrivate)
- (uint64_t)currentBrightness;
- (uint64_t)setCurrentBrightness:()HIDBrightnessEventPrivate;
- (uint64_t)setTargetBrightness:()HIDBrightnessEventPrivate;
- (uint64_t)setTransitionTime:()HIDBrightnessEventPrivate;
- (uint64_t)targetBrightness;
- (uint64_t)transitionTime;
@end

@implementation HIDEvent(HIDBrightnessEventPrivate)

- (uint64_t)currentBrightness
{
  return MEMORY[0x1F40E89F8](a1, 2490368);
}

- (uint64_t)setCurrentBrightness:()HIDBrightnessEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2490368);
}

- (uint64_t)targetBrightness
{
  return MEMORY[0x1F40E89F8](a1, 2490369);
}

- (uint64_t)setTargetBrightness:()HIDBrightnessEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2490369);
}

- (uint64_t)transitionTime
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setTransitionTime:()HIDBrightnessEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2490370);
}

@end