@interface HIDEvent(HIDGyroEvent)
+ (char)gyroEvent:()HIDGyroEvent x:y:z:options:;
@end

@implementation HIDEvent(HIDGyroEvent)

+ (char)gyroEvent:()HIDGyroEvent x:y:z:options:
{
  v6 = (char *)_IOHIDEventCreate();
  v7 = *(_DWORD **)&v6[*MEMORY[0x1E4F2EEE0] + 96];
  v7[4] = vcvtd_n_s64_f64(a1, 0x10uLL);
  v7[5] = vcvtd_n_s64_f64(a2, 0x10uLL);
  v7[6] = vcvtd_n_s64_f64(a3, 0x10uLL);
  return v6;
}

@end