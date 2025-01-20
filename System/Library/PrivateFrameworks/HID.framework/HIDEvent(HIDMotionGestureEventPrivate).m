@interface HIDEvent(HIDMotionGestureEventPrivate)
- (uint64_t)motionGestureGestureType;
- (uint64_t)motionGestureProgress;
- (uint64_t)setMotionGestureGestureType:()HIDMotionGestureEventPrivate;
- (uint64_t)setMotionGestureProgress:()HIDMotionGestureEventPrivate;
@end

@implementation HIDEvent(HIDMotionGestureEventPrivate)

- (uint64_t)motionGestureGestureType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setMotionGestureGestureType:()HIDMotionGestureEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2228224);
}

- (uint64_t)motionGestureProgress
{
  return MEMORY[0x1F40E89F8](a1, 2228225);
}

- (uint64_t)setMotionGestureProgress:()HIDMotionGestureEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2228225);
}

@end