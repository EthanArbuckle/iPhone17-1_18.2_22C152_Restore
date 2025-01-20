@interface HIDEvent(HIDForceEvent)
+ (char)forceEvent:()HIDForceEvent behavior:progress:stage:stageProgress:options:;
@end

@implementation HIDEvent(HIDForceEvent)

+ (char)forceEvent:()HIDForceEvent behavior:progress:stage:stageProgress:options:
{
  v11 = (char *)_IOHIDEventCreate();
  v12 = *(_DWORD **)&v11[*MEMORY[0x1E4F2EEE0] + 96];
  v12[4] = a6;
  v12[5] = vcvtd_n_s64_f64(a1, 0x10uLL);
  v12[6] = a7;
  v12[7] = vcvtd_n_s64_f64(a2, 0x10uLL);
  return v11;
}

@end