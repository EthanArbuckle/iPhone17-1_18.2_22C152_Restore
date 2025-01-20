@interface HIDEvent(HIDProximityEvent)
+ (char)proximityEvent:()HIDProximityEvent detectionMask:options:;
@end

@implementation HIDEvent(HIDProximityEvent)

+ (char)proximityEvent:()HIDProximityEvent detectionMask:options:
{
  v5 = (char *)_IOHIDEventCreate();
  *(_WORD *)(*(void *)&v5[*MEMORY[0x1E4F2EEE0] + 96] + 16) = a4;
  return v5;
}

@end