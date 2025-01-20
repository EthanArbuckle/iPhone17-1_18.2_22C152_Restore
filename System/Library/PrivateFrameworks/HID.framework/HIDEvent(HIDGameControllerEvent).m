@interface HIDEvent(HIDGameControllerEvent)
+ (char)gameControllerEvent:()HIDGameControllerEvent controllerType:options:;
@end

@implementation HIDEvent(HIDGameControllerEvent)

+ (char)gameControllerEvent:()HIDGameControllerEvent controllerType:options:
{
  v5 = (char *)_IOHIDEventCreate();
  *(_DWORD *)(*(void *)&v5[*MEMORY[0x1E4F2EEE0] + 96] + 16) = a4;
  return v5;
}

@end