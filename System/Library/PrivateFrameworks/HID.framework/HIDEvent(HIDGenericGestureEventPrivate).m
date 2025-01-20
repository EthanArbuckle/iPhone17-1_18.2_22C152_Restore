@interface HIDEvent(HIDGenericGestureEventPrivate)
- (uint64_t)genericGestureType;
- (uint64_t)genericGestureTypeSwipeProgress;
- (uint64_t)genericGestureTypeTapCount;
- (uint64_t)setGenericGestureTypeSwipeProgress:()HIDGenericGestureEventPrivate;
- (uint64_t)setGenericGestureTypeTapCount:()HIDGenericGestureEventPrivate;
@end

@implementation HIDEvent(HIDGenericGestureEventPrivate)

- (uint64_t)genericGestureType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)genericGestureTypeSwipeProgress
{
  return MEMORY[0x1F40E89F8](a1, 2555906);
}

- (uint64_t)setGenericGestureTypeSwipeProgress:()HIDGenericGestureEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2555906);
}

- (uint64_t)genericGestureTypeTapCount
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGenericGestureTypeTapCount:()HIDGenericGestureEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2555905);
}

@end