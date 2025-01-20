@interface HIDEvent(HIDAmbientLightSensorEvent)
+ (char)ambientLightSensorEvent:()HIDAmbientLightSensorEvent level:options:;
@end

@implementation HIDEvent(HIDAmbientLightSensorEvent)

+ (char)ambientLightSensorEvent:()HIDAmbientLightSensorEvent level:options:
{
  v5 = (char *)_IOHIDEventCreate();
  *(_DWORD *)(*(void *)&v5[*MEMORY[0x1E4F2EEE0] + 96] + 16) = a4;
  return v5;
}

@end