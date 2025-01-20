@interface AXOnboardingVoiceOverBridge
+ (BOOL)deviceHasHomeButton;
+ (BOOL)hasVoiceOverTeachableMomentsContent;
+ (BOOL)isInBuddy;
+ (BOOL)isVoiceOverHintsEnabled;
+ (BOOL)triggerEventCommand:(id)a3;
+ (BOOL)voSplashScreenEnabled;
+ (BOOL)voTutorialStartedFromSplash;
+ (BOOL)voTutorialUsageConfirmed;
+ (BOOL)voiceOverEnabled;
+ (float)getSpeakingRate;
+ (float)getVolume;
+ (id)getRecognizedGesture;
+ (id)getRotorName;
+ (id)getVoice;
+ (id)getVoiceOverEnabledDefaultName;
+ (id)getVoiceOverHintsEnabledDefaultName;
+ (id)keyboardShortcutSpelledOutForCommand:(id)a3;
+ (id)keyboardShortcutStringForCommand:(id)a3;
+ (id)setRecognizedGesture;
+ (id)sfSymbolsForCommand:(id)a3;
+ (id)teachableBrailleItems;
+ (id)teachableMomentsBuildVersion;
+ (id)teachableVoiceOverItems;
+ (void)connectToVO;
+ (void)enableVoiceOver:(BOOL)a3;
+ (void)setSpeakingRate:(float)a3;
+ (void)setVOTutorialUsageConfirmed:(BOOL)a3;
+ (void)synthesizerSpeakString:(id)a3;
+ (void)synthesizerStopSpeaking;
@end

@implementation AXOnboardingVoiceOverBridge

+ (BOOL)triggerEventCommand:(id)a3
{
  id v3 = a3;
  v4 = [getAXVoiceOverServerClass() server];
  char v5 = [v4 triggerEventCommand:v3];

  return v5;
}

+ (void)connectToVO
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_updateRecognizedGestureNotification, (CFStringRef)*MEMORY[0x263F8B410], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263F8B408];
  CFNotificationCenterAddObserver(v4, a1, (CFNotificationCallback)_updateSpeakingRateNotification, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

+ (id)setRecognizedGesture
{
  v2 = [getAXVoiceOverServerClass() server];
  uint64_t v3 = [v2 recognizedGestureForTutorial];
  v4 = (void *)recognizedGesture;
  recognizedGesture = v3;

  CFStringRef v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"AXVOTTrainingSwiftNotification" object:0];

  v6 = (void *)recognizedGesture;
  return v6;
}

+ (id)getRecognizedGesture
{
  return (id)recognizedGesture;
}

+ (id)getRotorName
{
  v2 = [getAXVoiceOverServerClass() server];
  uint64_t v3 = [v2 currentRotorName];

  return v3;
}

+ (id)teachableBrailleItems
{
  id AXTeachableMomentsManagerClass = getAXTeachableMomentsManagerClass();
  uint64_t v3 = getAXTeachableFeatureBraille();
  v4 = [AXTeachableMomentsManagerClass teachableItemsForFeature:v3];
  CFStringRef v5 = objc_msgSend(v4, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_1);

  return v5;
}

id __52__AXOnboardingVoiceOverBridge_teachableBrailleItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_new();
  v4 = [v2 itemTitle];
  [v3 setItemTitle:v4];

  CFStringRef v5 = [v2 itemDescription];

  [v3 setItemDescription:v5];
  return v3;
}

+ (id)teachableVoiceOverItems
{
  id AXTeachableMomentsManagerClass = getAXTeachableMomentsManagerClass();
  uint64_t v3 = getAXTeachableFeatureVoiceOver();
  v4 = [AXTeachableMomentsManagerClass teachableItemsForFeature:v3];
  CFStringRef v5 = objc_msgSend(v4, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_291);

  return v5;
}

id __54__AXOnboardingVoiceOverBridge_teachableVoiceOverItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_new();
  v4 = [v2 itemTitle];
  [v3 setItemTitle:v4];

  CFStringRef v5 = [v2 itemDescription];

  [v3 setItemDescription:v5];
  return v3;
}

+ (id)teachableMomentsBuildVersion
{
  id AXTeachableMomentsManagerClass = getAXTeachableMomentsManagerClass();
  return (id)[AXTeachableMomentsManagerClass buildVersion];
}

+ (BOOL)hasVoiceOverTeachableMomentsContent
{
  id AXTeachableMomentsManagerClass = getAXTeachableMomentsManagerClass();
  uint64_t v3 = getAXTeachableFeatureVoiceOver();
  v4 = [AXTeachableMomentsManagerClass teachableItemsForFeature:v3];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = getAXTeachableMomentsManagerClass();
    v7 = getAXTeachableFeatureBraille();
    v8 = [v6 teachableItemsForFeature:v7];
    BOOL v5 = [v8 count] != 0;
  }
  return v5;
}

+ (BOOL)voTutorialUsageConfirmed
{
  return _AXSVoiceOverTouchTutorialUsageConfirmed() != 0;
}

+ (void)setVOTutorialUsageConfirmed:(BOOL)a3
{
}

+ (BOOL)voSplashScreenEnabled
{
  return 0;
}

+ (BOOL)voTutorialStartedFromSplash
{
  return 0;
}

+ (BOOL)isInBuddy
{
  return 0;
}

+ (void)enableVoiceOver:(BOOL)a3
{
}

+ (BOOL)voiceOverEnabled
{
  return 0;
}

+ (id)getVoiceOverEnabledDefaultName
{
  return (id)enabledOnLaunchDefault;
}

+ (id)getVoiceOverHintsEnabledDefaultName
{
  return (id)hintsEnabledOnLaunchDefault;
}

+ (void)synthesizerSpeakString:(id)a3
{
  id v3 = a3;
  id v8 = v3;
  if (!synthesizer)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EF94A0]);
    BOOL v5 = (void *)synthesizer;
    synthesizer = (uint64_t)v4;

    id v3 = v8;
  }
  id v6 = [MEMORY[0x263EF94B8] speechUtteranceWithString:v3];
  +[AXOnboardingVoiceOverBridge getVolume];
  objc_msgSend(v6, "setVolume:");
  [v6 setPreUtteranceDelay:3.0];
  v7 = +[AXOnboardingVoiceOverBridge getVoice];
  if (v7) {
    [v6 setVoice:v7];
  }
  [(id)synthesizer speakUtterance:v6];
}

+ (void)synthesizerStopSpeaking
{
  [(id)synthesizer stopSpeakingAtBoundary:0];
  id v2 = (void *)synthesizer;
  synthesizer = 0;
}

+ (void)setSpeakingRate:(float)a3
{
}

+ (float)getSpeakingRate
{
  _AXSVoiceOverTouchSpeakingRate();
  return roundf(v2 * 100.0);
}

+ (float)getVolume
{
  return 1.0;
}

+ (id)getVoice
{
  return 0;
}

+ (BOOL)isVoiceOverHintsEnabled
{
  return 0;
}

+ (id)keyboardShortcutStringForCommand:(id)a3
{
  return 0;
}

+ (id)sfSymbolsForCommand:(id)a3
{
  return 0;
}

+ (id)keyboardShortcutSpelledOutForCommand:(id)a3
{
  return 0;
}

+ (BOOL)deviceHasHomeButton
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  float v2 = (uint64_t (*)(void))getAXDeviceHasHomeButtonSymbolLoc_ptr;
  id v8 = getAXDeviceHasHomeButtonSymbolLoc_ptr;
  if (!getAXDeviceHasHomeButtonSymbolLoc_ptr)
  {
    id v3 = (void *)AccessibilityUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v3, "AXDeviceHasHomeButton");
    getAXDeviceHasHomeButtonSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    float v2 = (uint64_t (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    getAXTeachableFeatureBraille_cold_1();
  }
  return v2();
}

@end