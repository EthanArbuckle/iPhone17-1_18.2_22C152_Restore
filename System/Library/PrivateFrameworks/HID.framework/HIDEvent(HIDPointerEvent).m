@interface HIDEvent(HIDPointerEvent)
+ (char)pointerEvent:()HIDPointerEvent x:y:z:buttonMask:options:;
@end

@implementation HIDEvent(HIDPointerEvent)

+ (char)pointerEvent:()HIDPointerEvent x:y:z:buttonMask:options:
{
  v11 = (char *)_IOHIDEventCreate();
  v12 = *(_DWORD **)&v11[*MEMORY[0x1E4F2EEE0] + 96];
  v12[4] = vcvtd_n_s64_f64(a1, 0x10uLL);
  v12[5] = vcvtd_n_s64_f64(a2, 0x10uLL);
  v12[6] = vcvtd_n_s64_f64(a3, 0x10uLL);
  v12[7] = a7;
  return v11;
}

@end