@interface HIDEvent(HIDGenericGestureEvent)
+ (char)genericGestureEvent:()HIDGenericGestureEvent gestureType:options:;
@end

@implementation HIDEvent(HIDGenericGestureEvent)

+ (char)genericGestureEvent:()HIDGenericGestureEvent gestureType:options:
{
  v5 = (char *)_IOHIDEventCreate();
  *(_DWORD *)(*(void *)&v5[*MEMORY[0x1E4F2EEE0] + 96] + 16) = a4;
  return v5;
}

@end