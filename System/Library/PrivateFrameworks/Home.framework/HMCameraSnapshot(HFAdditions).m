@interface HMCameraSnapshot(HFAdditions)
+ (id)hf_localizedAgeForCaptureDate:()HFAdditions;
- (id)hf_localizedAge;
@end

@implementation HMCameraSnapshot(HFAdditions)

+ (id)hf_localizedAgeForCaptureDate:()HFAdditions
{
  [a3 timeIntervalSinceNow];
  if (v3 <= -1.0)
  {
    double v5 = -v3;
    if (qword_26AB2FD40 != -1) {
      dispatch_once(&qword_26AB2FD40, &__block_literal_global_212);
    }
    v4 = [(id)_MergedGlobals_314 stringFromTimeInterval:v5];
  }
  else
  {
    v4 = _HFLocalizedStringWithDefaultValue(@"HFCameraSnapshotAgeNow", @"HFCameraSnapshotAgeNow", 1);
  }
  return v4;
}

- (id)hf_localizedAge
{
  v2 = objc_opt_class();
  double v3 = [a1 captureDate];
  v4 = objc_msgSend(v2, "hf_localizedAgeForCaptureDate:", v3);

  return v4;
}

@end