@interface HIDEvent(HIDBrightnessEvent)
+ (char)brightnessEvent:()HIDBrightnessEvent currentBrightness:targetBrightness:transitionTime:options:;
@end

@implementation HIDEvent(HIDBrightnessEvent)

+ (char)brightnessEvent:()HIDBrightnessEvent currentBrightness:targetBrightness:transitionTime:options:
{
  v9 = (char *)_IOHIDEventCreate();
  uint64_t v10 = *(void *)&v9[*MEMORY[0x1E4F2EEE0] + 96];
  *(_DWORD *)(v10 + 16) = vcvtd_n_s64_f64(a1, 0x10uLL);
  *(_DWORD *)(v10 + 20) = vcvtd_n_s64_f64(a2, 0x10uLL);
  *(void *)(v10 + 24) = a6;
  return v9;
}

@end