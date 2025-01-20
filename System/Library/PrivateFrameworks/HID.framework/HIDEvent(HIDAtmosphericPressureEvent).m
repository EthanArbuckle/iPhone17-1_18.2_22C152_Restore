@interface HIDEvent(HIDAtmosphericPressureEvent)
+ (char)atmosphericPressureEvent:()HIDAtmosphericPressureEvent level:sequence:options:;
@end

@implementation HIDEvent(HIDAtmosphericPressureEvent)

+ (char)atmosphericPressureEvent:()HIDAtmosphericPressureEvent level:sequence:options:
{
  v7 = (char *)_IOHIDEventCreate();
  uint64_t v8 = *(void *)&v7[*MEMORY[0x1E4F2EEE0] + 96];
  *(_DWORD *)(v8 + 16) = vcvtd_n_s64_f64(a1, 0x10uLL);
  *(_DWORD *)(v8 + 20) = a5;
  return v7;
}

@end