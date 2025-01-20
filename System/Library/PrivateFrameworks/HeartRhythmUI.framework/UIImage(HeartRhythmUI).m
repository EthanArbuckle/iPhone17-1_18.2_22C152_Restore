@interface UIImage(HeartRhythmUI)
+ (__CFString)_watchImageName;
+ (id)hrui_ECGAppIconImage;
+ (id)hrui_ECGOnboardingWristImage;
+ (id)hrui_atrialFibrillationDetectionIllustrationImage;
+ (id)hrui_cannotDoImage;
+ (id)hrui_fingerCrownImage;
+ (id)hrui_heartRateIconImage;
+ (id)hrui_screenWidthImageWithName:()HeartRhythmUI;
+ (id)hrui_warningImage;
+ (id)hrui_watchIconImage;
+ (id)hrui_waveformImage;
+ (uint64_t)_watchImageName;
@end

@implementation UIImage(HeartRhythmUI)

+ (id)hrui_screenWidthImageWithName:()HeartRhythmUI
{
  id v3 = a3;
  if (objc_msgSend(MEMORY[0x263F1C920], "hrui_currentDeviceHasSmallPhoneScreen"))
  {
    v4 = @"_320w";
  }
  else if (objc_msgSend(MEMORY[0x263F1C920], "hrui_currentDeviceHasMediumPhoneScreen"))
  {
    v4 = @"_375w";
  }
  else
  {
    if (!objc_msgSend(MEMORY[0x263F1C920], "hrui_currentDeviceHasLargePhoneScreen")) {
      goto LABEL_8;
    }
    v4 = @"_414w";
  }
  uint64_t v5 = [v3 stringByAppendingString:v4];

  id v3 = (id)v5;
LABEL_8:
  v6 = (void *)MEMORY[0x263F1C6B0];
  v7 = HRHeartRhythmUIFrameworkBundle();
  v8 = [v6 imageNamed:v3 inBundle:v7 compatibleWithTraitCollection:0];

  return v8;
}

+ (__CFString)_watchImageName
{
  v0 = [MEMORY[0x263F0A550] activeNonFamilySetupDevice];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v1 = (void *)getNRDevicePropertyProductTypeSymbolLoc_ptr;
  uint64_t v10 = getNRDevicePropertyProductTypeSymbolLoc_ptr;
  if (!getNRDevicePropertyProductTypeSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getNRDevicePropertyProductTypeSymbolLoc_block_invoke;
    v6[3] = &unk_264580FD0;
    v6[4] = &v7;
    __getNRDevicePropertyProductTypeSymbolLoc_block_invoke((uint64_t)v6);
    v1 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v1)
  {
    uint64_t v5 = (_Unwind_Exception *)+[UIImage(HeartRhythmUI) _watchImageName]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  v2 = [v0 valueForProperty:*v1];
  if ([v2 isEqualToString:@"Watch6,18"])
  {
    id v3 = [@"ECG_onboarding_wrist" stringByAppendingString:@"_alt"];
  }
  else
  {
    id v3 = @"ECG_onboarding_wrist";
  }

  return v3;
}

+ (id)hrui_ECGOnboardingWristImage
{
  v1 = (void *)MEMORY[0x263F1C6B0];
  v2 = [a1 _watchImageName];
  id v3 = objc_msgSend(v1, "hrui_screenWidthImageWithName:", v2);

  return v3;
}

+ (id)hrui_cannotDoImage
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = HRHeartRhythmUIFrameworkBundle();
  v2 = [v0 imageNamed:@"cannot_do" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)hrui_warningImage
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = HRHeartRhythmUIFrameworkBundle();
  v2 = [v0 imageNamed:@"warning" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)hrui_ECGAppIconImage
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = HRHeartRhythmUIFrameworkBundle();
  v2 = [v0 imageNamed:@"ECG_app_icon" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)hrui_fingerCrownImage
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = HRHeartRhythmUIFrameworkBundle();
  v2 = [v0 imageNamed:@"finger_crown" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)hrui_waveformImage
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = HRHeartRhythmUIFrameworkBundle();
  v2 = [v0 imageNamed:@"waveform" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)hrui_atrialFibrillationDetectionIllustrationImage
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = HRHeartRhythmUIFrameworkBundle();
  v2 = [v0 imageNamed:@"afib_detection_illustration" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)hrui_heartRateIconImage
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = HRHeartRhythmUIFrameworkBundle();
  v2 = [v0 imageNamed:@"heart_rate_icon" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)hrui_watchIconImage
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = HRHeartRhythmUIFrameworkBundle();
  v2 = [v0 imageNamed:@"watch_icon" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (uint64_t)_watchImageName
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __43__AVURLAsset_HeartRhythmUI__hrui_assetSize__block_invoke_cold_1(v0);
}

@end