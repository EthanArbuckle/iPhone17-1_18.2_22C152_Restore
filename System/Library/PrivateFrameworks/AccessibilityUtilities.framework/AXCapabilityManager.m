@interface AXCapabilityManager
+ (id)sharedManager;
- (BOOL)isAccessibilityCapability:(id)a3;
- (BOOL)isCapabilityAvailable:(id)a3;
- (id)capabilities;
@end

@implementation AXCapabilityManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_13);
  }
  v2 = (void *)sharedManager_SharedManager_0;

  return v2;
}

uint64_t __36__AXCapabilityManager_sharedManager__block_invoke()
{
  sharedManager_SharedManager_0 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isAccessibilityCapability:(id)a3
{
  id v4 = a3;
  v5 = [(AXCapabilityManager *)self capabilities];
  v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

- (id)capabilities
{
  if (capabilities_onceToken != -1) {
    dispatch_once(&capabilities_onceToken, &__block_literal_global_267);
  }
  v2 = (void *)capabilities_Available;

  return v2;
}

void __35__AXCapabilityManager_capabilities__block_invoke()
{
  v3[102] = *MEMORY[0x1E4F143B8];
  v2[0] = @"AXHapticMusic";
  v2[1] = @"VoiceOverRecognition";
  v3[0] = &__block_literal_global_273;
  v3[1] = &__block_literal_global_278;
  v2[2] = @"LiveTranscription";
  v2[3] = @"LiveTranscriptionInFaceTime";
  v3[2] = &__block_literal_global_284;
  v3[3] = &__block_literal_global_289;
  v2[4] = @"AXMotionCues";
  v2[5] = @"TapTouchToWake";
  v3[4] = &__block_literal_global_294;
  v3[5] = &__block_literal_global_299;
  v2[6] = @"TapToWake";
  v2[7] = @"AXSideButton";
  v3[6] = &__block_literal_global_307;
  v3[7] = &__block_literal_global_315;
  v2[8] = @"AXTopButton";
  v2[9] = @"AXHomeButton";
  v3[8] = &__block_literal_global_320;
  v3[9] = &__block_literal_global_325;
  v2[10] = @"AXTopTouchIDButton";
  v2[11] = @"HoverText";
  v3[10] = &__block_literal_global_330;
  v3[11] = &__block_literal_global_335;
  v2[12] = @"HoverTextTyping";
  v2[13] = @"AXReduceTransparency";
  v3[12] = &__block_literal_global_340;
  v3[13] = &__block_literal_global_345_0;
  v2[14] = @"AXSiri";
  v2[15] = @"AXTypeToSiri";
  v3[14] = &__block_literal_global_350_1;
  v3[15] = &__block_literal_global_357;
  v2[16] = @"AXWatchRemoteScreen";
  v2[17] = @"AXStartupSound";
  v3[16] = &__block_literal_global_362;
  v3[17] = &__block_literal_global_367;
  v2[18] = @"AXHeadphoneNotifications";
  v2[19] = @"AXTTYRTTCapability";
  v3[18] = &__block_literal_global_372;
  v3[19] = &__block_literal_global_377;
  v2[20] = @"AXRTT_TTYTextingTypeCapability";
  v2[21] = @"AXRTTTextingTypeCapability";
  v3[20] = &__block_literal_global_382;
  v3[21] = &__block_literal_global_387;
  v2[22] = @"AXTTYTextingTypeCapability";
  v2[23] = @"NearbyControlCapability";
  v3[22] = &__block_literal_global_392;
  v3[23] = &__block_literal_global_397;
  v2[24] = @"AXCameraFlashCapability";
  v2[25] = @"AXProximitySensor";
  v3[24] = &__block_literal_global_402;
  v3[25] = &__block_literal_global_410;
  v2[26] = @"GuidedAccessEnabled";
  v2[27] = @"KeyRepeatEnabled";
  v3[26] = &__block_literal_global_418;
  v3[27] = &__block_literal_global_423;
  v2[28] = @"LimitFrameRate";
  v2[29] = @"Vibration";
  v3[28] = &__block_literal_global_428;
  v3[29] = &__block_literal_global_436;
  v2[30] = @"Reachability";
  v2[31] = @"SpeakScreenEnabled";
  v3[30] = &__block_literal_global_441;
  v3[31] = &__block_literal_global_446;
  v2[32] = @"SpeakSelectionEnabled";
  v2[33] = @"HighlightContentEnabled";
  v3[32] = &__block_literal_global_451;
  v3[33] = &__block_literal_global_456;
  v2[34] = @"ExtendedVoiceIsolation";
  v2[35] = @"MixToUplink";
  v3[34] = &__block_literal_global_461;
  v3[35] = &__block_literal_global_468;
  v2[36] = @"PSECapability";
  v2[37] = @"AXForceTouch";
  v3[36] = &__block_literal_global_474;
  v3[37] = &__block_literal_global_479;
  v2[38] = @"AXNoForceTouch";
  v2[39] = @"AXAdaptiveVoiceShortcuts";
  v3[38] = &__block_literal_global_484;
  v3[39] = &__block_literal_global_489;
  v2[40] = @"AXOnDeviceEyeTracking";
  v2[41] = @"AXLiveSpeech";
  v3[40] = &__block_literal_global_494;
  v3[41] = &__block_literal_global_499;
  v2[42] = @"BackTap";
  v2[43] = @"AXLiveSpeechCategories";
  v3[42] = &__block_literal_global_504;
  v3[43] = &__block_literal_global_509;
  v2[44] = @"AXLiveSpeechCategory";
  v2[45] = @"AXOnboardingVoiceOver";
  v3[44] = &__block_literal_global_514;
  v3[45] = &__block_literal_global_519;
  v2[46] = @"ConfirmWith";
  v2[47] = @"AXHaptics";
  v3[46] = &__block_literal_global_524;
  v3[47] = &__block_literal_global_529_0;
  v2[48] = @"AXNoHaptics";
  v2[49] = @"AXVoiceBanking";
  v3[48] = &__block_literal_global_534;
  v3[49] = &__block_literal_global_539;
  v2[50] = @"AXIndependentDwellControl";
  v2[51] = @"AXPointerControlIncreaseContrast";
  v3[50] = &__block_literal_global_544;
  v3[51] = &__block_literal_global_549;
  v2[52] = @"AXPointerControlAutoHide";
  v2[53] = @"AXPointerControlColor";
  v3[52] = &__block_literal_global_554;
  v3[53] = &__block_literal_global_559;
  v2[54] = @"AXPointerControlSize";
  v2[55] = @"AXUpwardsHUDControlPosition";
  v3[54] = &__block_literal_global_564;
  v3[55] = &__block_literal_global_569;
  v2[56] = @"AXUpwardsHUDToggle";
  v2[57] = @"AXAutoBrightness";
  v3[56] = &__block_literal_global_574;
  v3[57] = &__block_literal_global_579;
  v2[58] = @"AXAssistiveTouchBasedDwellControl";
  v2[59] = @"AXTouchAccommodations";
  v3[58] = &__block_literal_global_584;
  v3[59] = &__block_literal_global_589;
  v2[60] = @"AXHomeButtonIsDigitalCrown";
  v2[61] = @"AXHomeButtonIsNotDigitalCrown";
  v3[60] = &__block_literal_global_594;
  v3[61] = &__block_literal_global_599;
  v2[62] = @"AXAutoEnableSubtitles";
  v2[63] = @"AXLockScreenNotifications";
  v3[62] = &__block_literal_global_604;
  v3[63] = &__block_literal_global_609;
  v2[64] = @"AXRingerSwitch";
  v3[64] = &__block_literal_global_614;
  v2[65] = @"AXHandwriting";
  v3[65] = &__block_literal_global_619;
  v2[66] = @"AXBrailleScreenInput";
  v3[66] = &__block_literal_global_624;
  v2[67] = @"AXDirectTouchApps";
  v3[67] = &__block_literal_global_629;
  v2[68] = @"AXZoomController";
  v3[68] = &__block_literal_global_634;
  v2[69] = @"AXZoomFilter";
  v3[69] = &__block_literal_global_639;
  v2[70] = @"AXZoomShowWhileMirroring";
  v3[70] = &__block_literal_global_644;
  v2[71] = @"AXCallAudioRouting";
  v3[71] = &__block_literal_global_649;
  v2[72] = @"AXTrackpadZoom";
  v3[72] = &__block_literal_global_654;
  v2[73] = @"AXHearingControlCenter";
  v3[73] = &__block_literal_global_659;
  v2[74] = @"AXAppleTVRemote";
  v3[74] = &__block_literal_global_664;
  v2[75] = @"AXVirtualTrackpad";
  v3[75] = &__block_literal_global_669;
  v2[76] = @"AXVoiceOverDelayUntilSpeak";
  v3[76] = &__block_literal_global_674;
  v2[77] = @"AXAirPodPaired";
  v3[77] = &__block_literal_global_679;
  v2[78] = @"AXRealWorldDetection";
  v3[78] = &__block_literal_global_685;
  v2[79] = @"AXSiriAtypicalSpeech";
  v3[79] = &__block_literal_global_690;
  v2[80] = @"AXClarityUI";
  v3[80] = &__block_literal_global_703;
  v2[81] = @"AXResizeZoomWindow";
  v3[81] = &__block_literal_global_708;
  v2[82] = @"AXZoomWithScrollWheel";
  v3[82] = &__block_literal_global_714;
  v2[83] = @"AXZoomVisionOS";
  v3[83] = &__block_literal_global_720;
  v2[84] = @"AXPlatformUsesInteractionTerm";
  v3[84] = &__block_literal_global_725;
  v2[85] = @"AXPlatformUsesTouchTerm";
  v3[85] = &__block_literal_global_730;
  v2[86] = @"AXSoundEffects";
  v3[86] = &__block_literal_global_735;
  v2[87] = @"AXSpatializeSpeech";
  v3[87] = &__block_literal_global_740;
  v2[88] = @"AXPlatformUsesHandTrackingForVoiceOver";
  v3[88] = &__block_literal_global_745;
  v2[89] = @"AXIgnoreEyeMovement";
  v3[89] = &__block_literal_global_750;
  v2[90] = @"AXAlignDisplaysAutomatically";
  v3[90] = &__block_literal_global_755;
  v2[91] = @"AXIncreaseFocusState";
  v3[91] = &__block_literal_global_760;
  v2[92] = @"AXVideoPassthrough";
  v3[92] = &__block_literal_global_765;
  v2[93] = @"AXSystemSoundActions";
  v3[93] = &__block_literal_global_770;
  v2[94] = @"AXASTSoundActions";
  v3[94] = &__block_literal_global_775;
  v2[95] = @"AXPlatformUsesHandTrackingForDwell";
  v3[95] = &__block_literal_global_780;
  v2[96] = @"AXPointerControl";
  v3[96] = &__block_literal_global_785;
  v2[97] = @"AXPlatformUsesHeadMovement";
  v3[97] = &__block_literal_global_790;
  v2[98] = @"AXFaceID";
  v3[98] = &__block_literal_global_795;
  v2[99] = @"AXASTExtendedPredictions";
  v3[99] = &__block_literal_global_800;
  v2[100] = @"AXSiriBargeIn";
  v3[100] = &__block_literal_global_805;
  v2[101] = @"AXCameraControl";
  v3[101] = &__block_literal_global_810;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:102];
  v1 = (void *)capabilities_Available;
  capabilities_Available = v0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_3()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  if (unint64_t)[v0 physicalMemory] > 0x773593FF && (AXRuntimeCheck_HasANE())
  {
    uint64_t v1 = 1;
  }
  else
  {
    v2 = [MEMORY[0x1E4F28F80] processInfo];
    if ((unint64_t)[v2 physicalMemory] <= 0x773593FF) {
      uint64_t v1 = 0;
    }
    else {
      uint64_t v1 = AXRuntimeCheck_HasANE();
    }
  }
  return v1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_4()
{
  return MEMORY[0x1F4106268]();
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_5()
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  uint64_t v0 = (void *)getAVCCaptionsClientClass_softClass;
  uint64_t v19 = getAVCCaptionsClientClass_softClass;
  if (!getAVCCaptionsClientClass_softClass)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __getAVCCaptionsClientClass_block_invoke;
    v14 = &unk_1E5585E30;
    v15 = &v16;
    __getAVCCaptionsClientClass_block_invoke((uint64_t)&v11);
    uint64_t v0 = (void *)v17[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v16, 8);
  if (![v1 isCaptioningSupported]) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EDC63198];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v4 = (void *)getUITextInputModeClass_softClass;
  uint64_t v19 = getUITextInputModeClass_softClass;
  if (!getUITextInputModeClass_softClass)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __getUITextInputModeClass_block_invoke;
    v14 = &unk_1E5585E30;
    v15 = &v16;
    __getUITextInputModeClass_block_invoke((uint64_t)&v11);
    id v4 = (void *)v17[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v16, 8);
  v6 = [v5 activeInputModes];
  v7 = objc_msgSend(v6, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_823);
  v8 = [v3 setWithArray:v7];

  uint64_t v9 = [v8 intersectsSet:v2];
  return v9;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_7()
{
  return MGGetBoolAnswer();
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_8()
{
  uint64_t result = MGGetBoolAnswer();
  if (result) {
    return MGGetBoolAnswer() ^ 1;
  }
  return result;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_16()
{
  uint64_t v0 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v1 = [v0 assistantIsEnabled];

  v2 = (void *)MEMORY[0x1E4F4E420];
  v3 = [MEMORY[0x1E4F4E538] sharedPreferences];
  id v4 = [v3 languageCode];
  LODWORD(v2) = [v2 assistantIsSupportedForLanguageCode:v4 error:0];

  return v1 & v2;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_17()
{
  uint64_t result = AXHasCapability(@"AXSiri");
  if (result) {
    return AXDeviceHasGreyMatterEnabled() ^ 1;
  }
  return result;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_21()
{
  return [getRTTTelephonyUtilitiesClass() currentSupportedTextingType] != 4;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_22()
{
  return [getRTTTelephonyUtilitiesClass() currentSupportedTextingType] == 3;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_23()
{
  return [getRTTTelephonyUtilitiesClass() currentSupportedTextingType] == 1;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_24()
{
  return [getRTTTelephonyUtilitiesClass() currentSupportedTextingType] == 2;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_26()
{
  return MGGetBoolAnswer();
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_27()
{
  return MGGetBoolAnswer();
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_28()
{
  return _AXSGuidedAccessEnabled() != 0;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_29()
{
  return _AXSKeyRepeatEnabled() != 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_30()
{
  return MGGetBoolAnswer();
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_33()
{
  return _AXSSpeakThisEnabled() != 0;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_34()
{
  return _AXSQuickSpeakEnabled() != 0;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_35()
{
  return _AXSQuickSpeakHighlightTextEnabled() != 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_36()
{
  return _os_feature_enabled_impl();
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_37()
{
  return _os_feature_enabled_impl();
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_40()
{
  return AXForceTouchAvailableAndEnabled() ^ 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_41()
{
  return MEMORY[0x1F4105F10]();
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_46()
{
  return MEMORY[0x1F4105F20]();
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_50()
{
  return AXDeviceSupportsHaptics() ^ 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_52()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_53()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_54()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_55()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_56()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_57()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_58()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_59()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_60()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_61()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_62()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_63()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_64()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_65()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_66()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_67()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_68()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_69()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_70()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_71()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_72()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_73()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_74()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_75()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_76()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_78()
{
  return 1;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_79()
{
  uint64_t v0 = +[AXAirPodSettingsManager sharedInstance];
  int v1 = [v0 pairedAirPods];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_81()
{
  if (!AXHasCapability(@"AXSiri") || !_os_feature_enabled_impl()) {
    return 0;
  }
  uint64_t v0 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v1 = [v0 languageCode];
  if ([v1 isEqualToString:@"en-US"])
  {
    uint64_t v2 = 1;
  }
  else
  {
    v3 = [MEMORY[0x1E4F4E538] sharedPreferences];
    id v4 = [v3 languageCode];
    uint64_t v2 = [v4 isEqualToString:@"en-CA"];
  }
  return v2;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_82()
{
  return _AXSClarityUIEnabled() != 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_83()
{
  uint64_t v0 = +[AXSettings sharedInstance];
  int v1 = [v0 zoomPreferredCurrentLensMode];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F48270]] ^ 1;

  return v2;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_84()
{
  uint64_t v0 = +[AXPointerDeviceManager sharedInstance];
  int v1 = [v0 connectedDevices];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_85()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_86()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_87()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_88()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_89()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_90()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_91()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_92()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_93()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_94()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_95()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_96()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_97()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_98()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_99()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_101()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_102()
{
  if (!AXHasCapability(@"AXSiri")) {
    return 0;
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2050000000;
  uint64_t v0 = (void *)getCSPreferencesClass_softClass;
  uint64_t v9 = getCSPreferencesClass_softClass;
  if (!getCSPreferencesClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getCSPreferencesClass_block_invoke;
    v5[3] = &unk_1E5585E30;
    v5[4] = &v6;
    __getCSPreferencesClass_block_invoke((uint64_t)v5);
    uint64_t v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  BOOL v2 = [v1 sharedPreferences];
  uint64_t v3 = [v2 isFlexibleFollowupsSupported];

  return v3;
}

- (BOOL)isCapabilityAvailable:(id)a3
{
  id v4 = a3;
  id v5 = [(AXCapabilityManager *)self capabilities];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6) {
    char v7 = v6[2](v6);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

@end