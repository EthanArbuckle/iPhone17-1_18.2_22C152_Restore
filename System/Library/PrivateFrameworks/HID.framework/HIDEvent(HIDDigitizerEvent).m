@interface HIDEvent(HIDDigitizerEvent)
+ (char)digitizerEvent:()HIDDigitizerEvent transducerType:x:y:z:options:;
+ (char)polarDigitizerEvent:()HIDDigitizerEvent altitude:azimuth:quality:density:majorRadius:minorRadius:options:;
+ (char)qualityDigitizerEvent:()HIDDigitizerEvent quality:density:irregularity:majorRadius:minorRadius:accuracy:options:;
+ (char)tiltDigitizerEvent:()HIDDigitizerEvent x:y:options:;
@end

@implementation HIDEvent(HIDDigitizerEvent)

+ (char)digitizerEvent:()HIDDigitizerEvent transducerType:x:y:z:options:
{
  v11 = (char *)_IOHIDEventCreate();
  v12 = *(_DWORD **)&v11[*MEMORY[0x1E4F2EEE0] + 96];
  v12[8] = a7;
  v12[4] = vcvtd_n_s64_f64(a1, 0x10uLL);
  v12[5] = vcvtd_n_s64_f64(a2, 0x10uLL);
  v12[6] = vcvtd_n_s64_f64(a3, 0x10uLL);
  return v11;
}

+ (char)tiltDigitizerEvent:()HIDDigitizerEvent x:y:options:
{
  v4 = (char *)_IOHIDEventCreate();
  v5 = *(_DWORD **)&v4[*MEMORY[0x1E4F2EEE0] + 96];
  v5[16] = 0;
  v5[17] = vcvtd_n_s64_f64(a1, 0x10uLL);
  v5[18] = vcvtd_n_s64_f64(a2, 0x10uLL);
  return v4;
}

+ (char)polarDigitizerEvent:()HIDDigitizerEvent altitude:azimuth:quality:density:majorRadius:minorRadius:options:
{
  v12 = (char *)_IOHIDEventCreate();
  v13 = *(_DWORD **)&v12[*MEMORY[0x1E4F2EEE0] + 96];
  v13[16] = 1;
  v13[17] = vcvtd_n_s64_f64(a1, 0x10uLL);
  v13[18] = vcvtd_n_s64_f64(a2, 0x10uLL);
  v13[19] = vcvtd_n_s64_f64(a3, 0x10uLL);
  v13[20] = vcvtd_n_s64_f64(a4, 0x10uLL);
  v13[21] = vcvtd_n_s64_f64(a5, 0x10uLL);
  v13[22] = vcvtd_n_s64_f64(a6, 0x10uLL);
  return v12;
}

+ (char)qualityDigitizerEvent:()HIDDigitizerEvent quality:density:irregularity:majorRadius:minorRadius:accuracy:options:
{
  v12 = (char *)_IOHIDEventCreate();
  v13 = *(_DWORD **)&v12[*MEMORY[0x1E4F2EEE0] + 96];
  v13[16] = 2;
  v13[17] = vcvtd_n_s64_f64(a1, 0x10uLL);
  v13[18] = vcvtd_n_s64_f64(a2, 0x10uLL);
  v13[19] = vcvtd_n_s64_f64(a3, 0x10uLL);
  v13[20] = vcvtd_n_s64_f64(a4, 0x10uLL);
  v13[21] = vcvtd_n_s64_f64(a5, 0x10uLL);
  v13[22] = vcvtd_n_s64_f64(a6, 0x10uLL);
  return v12;
}

@end