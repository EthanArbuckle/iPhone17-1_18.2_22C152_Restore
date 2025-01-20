@interface HMSymptom(HFAdditions)
- (id)hf_shortDescription;
- (uint64_t)hf_generatedByHomeAppForDebuggingPurposes;
- (void)hf_setGeneratedByHomeAppForDebuggingPurposes:()HFAdditions;
@end

@implementation HMSymptom(HFAdditions)

- (uint64_t)hf_generatedByHomeAppForDebuggingPurposes
{
  v1 = objc_getAssociatedObject(a1, @"kHMSymptomhf_generatedByHomeAppForDebuggingPurposesKey");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)hf_setGeneratedByHomeAppForDebuggingPurposes:()HFAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"kHMSymptomhf_generatedByHomeAppForDebuggingPurposesKey", v2, (void *)0x301);
}

- (id)hf_shortDescription
{
  uint64_t v1 = [a1 type];
  switch(v1)
  {
    case 1:
    case 2:
    case 20:
      v3 = @"HFSymptomDescriptionProblemAccount";
      goto LABEL_14;
    case 3:
    case 7:
      v3 = @"HFSymptomDescriptionNeedsService";
      goto LABEL_14;
    case 4:
    case 11:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
      id v2 = HFLocalizedWiFiString(@"HFSymptomDescriptionProblemWiFiNetwork");
      goto LABEL_15;
    case 5:
      v3 = @"HFSymptomDescriptionProblemWifiPerformanceFix";
      goto LABEL_14;
    case 6:
      v3 = @"HFSymptomDescriptionProblemInternet";
      goto LABEL_14;
    case 8:
      v3 = @"HFSymptomDescriptionStereoVersionMismatch";
      goto LABEL_14;
    case 9:
      v3 = @"HFSymptomDescriptionStereoNotFound";
      goto LABEL_14;
    case 10:
      v3 = @"HFSymptomDescriptionStereoError";
      goto LABEL_14;
    case 12:
      v3 = @"HFSymptomDescriptionTargetControlMissing";
      goto LABEL_14;
    case 13:
      v3 = @"HFSymptomDescriptionVPNProfileExpired";
      goto LABEL_14;
    default:
      if (v1 == 999)
      {
        v3 = @"HMSymptomDescriptionSharedUserErrorNotification";
LABEL_14:
        id v2 = _HFLocalizedStringWithDefaultValue(v3, v3, 1);
      }
      else
      {
        id v2 = 0;
      }
LABEL_15:
      return v2;
  }
}

@end