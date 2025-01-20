id initSFLocalizedStringForKey(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t vars8;

  v1 = SharingLibrary_sOnce;
  v2 = a1;
  if (v1 != -1) {
    dispatch_once(&SharingLibrary_sOnce, &__block_literal_global_888);
  }
  softLinkSFLocalizedStringForKey = (uint64_t)dlsym((void *)SharingLibrary_sLib, "SFLocalizedStringForKey");
  v3 = ((void (*)(id))softLinkSFLocalizedStringForKey)(v2);

  return v3;
}

id SFNormalizeEmailAddress(void *a1, int a2)
{
  v3 = [a1 lowercaseString];
  v4 = v3;
  if (a2
    && (([v3 hasSuffix:@"@me.com"] & 1) != 0
     || [v4 hasSuffix:@"@mac.com"]))
  {
    v5 = [v4 componentsSeparatedByString:@"@"];
    if ([v5 count])
    {
      v6 = NSString;
      v7 = [v5 objectAtIndexedSubscript:0];
      id v8 = [v6 stringWithFormat:@"%@@icloud.com", v7];
    }
    else
    {
      id v8 = v4;
    }
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

Class initTROperationQueue()
{
  if (TouchRemoteLibrary_sOnce != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce, &__block_literal_global_877);
  }
  Class result = objc_getClass("TROperationQueue");
  classTROperationQueue = (uint64_t)result;
  getTROperationQueueClass = (uint64_t (*)())TROperationQueueFunction;
  return result;
}

id TROperationQueueFunction()
{
  return (id)classTROperationQueue;
}

void *__TouchRemoteLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/TouchRemote.framework/TouchRemote", 2);
  TouchRemoteLibrary_sLib = (uint64_t)result;
  return result;
}

Class initHMMutableHomeManagerConfiguration()
{
  if (HomeKitLibrary_sOnce != -1) {
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_881);
  }
  Class result = objc_getClass("HMMutableHomeManagerConfiguration");
  classHMMutableHomeManagerConfiguration = (uint64_t)result;
  getHMMutableHomeManagerConfigurationClass = (uint64_t (*)())HMMutableHomeManagerConfigurationFunction;
  return result;
}

id HMMutableHomeManagerConfigurationFunction()
{
  return (id)classHMMutableHomeManagerConfiguration;
}

void *__HomeKitLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/HomeKit.framework/HomeKit", 2);
  HomeKitLibrary_sLib = (uint64_t)result;
  return result;
}

Class initHMHomeManager()
{
  if (HomeKitLibrary_sOnce != -1) {
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_881);
  }
  Class result = objc_getClass("HMHomeManager");
  classHMHomeManager = (uint64_t)result;
  getHMHomeManagerClass = (uint64_t (*)())HMHomeManagerFunction;
  return result;
}

id HMHomeManagerFunction()
{
  return (id)classHMHomeManager;
}

Class initHMAccessoryBrowser()
{
  if (HomeKitLibrary_sOnce != -1) {
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_881);
  }
  Class result = objc_getClass("HMAccessoryBrowser");
  classHMAccessoryBrowser = (uint64_t)result;
  getHMAccessoryBrowserClass = (uint64_t (*)())HMAccessoryBrowserFunction;
  return result;
}

id HMAccessoryBrowserFunction()
{
  return (id)classHMAccessoryBrowser;
}

Class initHMDeviceSetupOperation()
{
  if (HomeKitLibrary_sOnce != -1) {
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_881);
  }
  Class result = objc_getClass("HMDeviceSetupOperation");
  classHMDeviceSetupOperation = (uint64_t)result;
  getHMDeviceSetupOperationClass = (uint64_t (*)())HMDeviceSetupOperationFunction;
  return result;
}

id HMDeviceSetupOperationFunction()
{
  return (id)classHMDeviceSetupOperation;
}

void *__SharingLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  SharingLibrary_sLib = (uint64_t)result;
  return result;
}

Class initHMMediaSystemBuilder()
{
  if (HomeKitLibrary_sOnce != -1) {
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_881);
  }
  Class result = objc_getClass("HMMediaSystemBuilder");
  classHMMediaSystemBuilder = (uint64_t)result;
  getHMMediaSystemBuilderClass = (uint64_t (*)())HMMediaSystemBuilderFunction;
  return result;
}

id HMMediaSystemBuilderFunction()
{
  return (id)classHMMediaSystemBuilder;
}

Class initHMMediaSystemRole()
{
  if (HomeKitLibrary_sOnce != -1) {
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_881);
  }
  Class result = objc_getClass("HMMediaSystemRole");
  classHMMediaSystemRole = (uint64_t)result;
  getHMMediaSystemRoleClass = (uint64_t (*)())HMMediaSystemRoleFunction;
  return result;
}

id HMMediaSystemRoleFunction()
{
  return (id)classHMMediaSystemRole;
}

Class initHMMediaSystemComponent()
{
  if (HomeKitLibrary_sOnce != -1) {
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_881);
  }
  Class result = objc_getClass("HMMediaSystemComponent");
  classHMMediaSystemComponent = (uint64_t)result;
  getHMMediaSystemComponentClass = (uint64_t (*)())HMMediaSystemComponentFunction;
  return result;
}

id HMMediaSystemComponentFunction()
{
  return (id)classHMMediaSystemComponent;
}

id initValHMAccessoryCategoryTypeHomePod()
{
  if (HomeKitLibrary_sOnce != -1) {
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_881);
  }
  v0 = (id *)dlsym((void *)HomeKitLibrary_sLib, "HMAccessoryCategoryTypeHomePod");
  if (v0) {
    objc_storeStrong((id *)&constantValHMAccessoryCategoryTypeHomePod, *v0);
  }
  getHMAccessoryCategoryTypeHomePod = (uint64_t (*)())HMAccessoryCategoryTypeHomePodFunction;
  v1 = (void *)constantValHMAccessoryCategoryTypeHomePod;
  return v1;
}

id HMAccessoryCategoryTypeHomePodFunction()
{
  return (id)constantValHMAccessoryCategoryTypeHomePod;
}

id initValHMAccessoryCategoryTypeAppleTV()
{
  if (HomeKitLibrary_sOnce != -1) {
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_881);
  }
  v0 = (id *)dlsym((void *)HomeKitLibrary_sLib, "HMAccessoryCategoryTypeAppleTV");
  if (v0) {
    objc_storeStrong((id *)&constantValHMAccessoryCategoryTypeAppleTV, *v0);
  }
  getHMAccessoryCategoryTypeAppleTV = (uint64_t (*)())HMAccessoryCategoryTypeAppleTVFunction;
  v1 = (void *)constantValHMAccessoryCategoryTypeAppleTV;
  return v1;
}

id HMAccessoryCategoryTypeAppleTVFunction()
{
  return (id)constantValHMAccessoryCategoryTypeAppleTV;
}

Class initASDSystemAppRequest()
{
  if (AppStoreDaemonLibrary_sOnce != -1) {
    dispatch_once(&AppStoreDaemonLibrary_sOnce, &__block_literal_global_897);
  }
  Class result = objc_getClass("ASDSystemAppRequest");
  classASDSystemAppRequest = (uint64_t)result;
  getASDSystemAppRequestClass = (uint64_t (*)())ASDSystemAppRequestFunction;
  return result;
}

id ASDSystemAppRequestFunction()
{
  return (id)classASDSystemAppRequest;
}

void *__AppStoreDaemonLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AppStoreDaemon.framework/AppStoreDaemon", 2);
  AppStoreDaemonLibrary_sLib = (uint64_t)result;
  return result;
}

Class initSFAirDropDiscoveryController()
{
  if (SharingUILibrary_sOnce != -1) {
    dispatch_once(&SharingUILibrary_sOnce, &__block_literal_global_1);
  }
  Class result = objc_getClass("SFAirDropDiscoveryController");
  classSFAirDropDiscoveryController = (uint64_t)result;
  getSFAirDropDiscoveryControllerClass = (uint64_t (*)())SFAirDropDiscoveryControllerFunction;
  return result;
}

id SFAirDropDiscoveryControllerFunction()
{
  return (id)classSFAirDropDiscoveryController;
}

void *__SharingUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/SharingUI.framework/SharingUI", 2);
  SharingUILibrary_sLib = (uint64_t)result;
  return result;
}

void HDSMetricsLog(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = a2;
  if (gLogCategory_Metrics <= 30 && (gLogCategory_Metrics != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  softLinkAnalyticsSendEvent(v4, v3);
}

void initAnalyticsSendEvent(void *a1, void *a2)
{
  uint64_t v3 = CoreAnalyticsLibrary_sOnce;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&CoreAnalyticsLibrary_sOnce, &__block_literal_global_3);
  }
  softLinkAnalyticsSendEvent = (uint64_t (*)())dlsym((void *)CoreAnalyticsLibrary_sLib, "AnalyticsSendEvent");
  ((void (*)(id, id))softLinkAnalyticsSendEvent)(v5, v4);
}

void *__CoreAnalyticsLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics", 2);
  CoreAnalyticsLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_23EB749A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_23EB75E54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

Class initHMHomeManager_0()
{
  if (HomeKitLibrary_sOnce_0 != -1) {
    dispatch_once(&HomeKitLibrary_sOnce_0, &__block_literal_global_1252);
  }
  Class result = objc_getClass("HMHomeManager");
  classHMHomeManager_0 = (uint64_t)result;
  getHMHomeManagerClass_0 = (uint64_t (*)())HMHomeManagerFunction_0;
  return result;
}

id HMHomeManagerFunction_0()
{
  return (id)classHMHomeManager_0;
}

void *__HomeKitLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/Frameworks/HomeKit.framework/HomeKit", 2);
  HomeKitLibrary_sLib_0 = (uint64_t)result;
  return result;
}

uint64_t initAudioServicesSetProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (AudioToolboxLibrary_sOnce != -1) {
    dispatch_once(&AudioToolboxLibrary_sOnce, &__block_literal_global_1256);
  }
  v10 = (uint64_t (*)())dlsym((void *)AudioToolboxLibrary_sLib, "AudioServicesSetProperty");
  softLinkAudioServicesSetProperty = v10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v10)(a1, a2, a3, a4, a5);
}

void *__AudioToolboxLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox", 2);
  AudioToolboxLibrary_sLib = (uint64_t)result;
  return result;
}

Class initAPCPlayer()
{
  if (AudioPasscodeLibrary_sOnce != -1) {
    dispatch_once(&AudioPasscodeLibrary_sOnce, &__block_literal_global_1268);
  }
  Class result = objc_getClass("APCPlayer");
  classAPCPlayer = (uint64_t)result;
  getAPCPlayerClass = (uint64_t (*)())APCPlayerFunction;
  return result;
}

id APCPlayerFunction()
{
  return (id)classAPCPlayer;
}

void *__AudioPasscodeLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AudioPasscode.framework/AudioPasscode", 2);
  AudioPasscodeLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t init_AXSVoiceOverTouchSetEnabled(uint64_t a1)
{
  if (AccessibilityLibrary_sOnce != -1) {
    dispatch_once(&AccessibilityLibrary_sOnce, &__block_literal_global_1272);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)AccessibilityLibrary_sLib, "_AXSVoiceOverTouchSetEnabled");
  softLink_AXSVoiceOverTouchSetEnabled = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void *__AccessibilityLibrary_block_invoke()
{
  Class result = dlopen("/usr/lib/libAccessibility.dylib", 2);
  AccessibilityLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t init_AXSVoiceOverTouchSetSpeakingRate(float a1)
{
  if (AccessibilityLibrary_sOnce != -1) {
    dispatch_once(&AccessibilityLibrary_sOnce, &__block_literal_global_1272);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)AccessibilityLibrary_sLib, "_AXSVoiceOverTouchSetSpeakingRate");
  softLink_AXSVoiceOverTouchSetSpeakingRate = v2;
  v3.n128_f32[0] = a1;
  return ((uint64_t (*)(__n128))v2)(v3);
}

Class initAXSettings()
{
  if (AccessibilityUtilitiesLibrary_sOnce != -1) {
    dispatch_once(&AccessibilityUtilitiesLibrary_sOnce, &__block_literal_global_1277);
  }
  Class result = objc_getClass("AXSettings");
  classAXSettings = (uint64_t)result;
  getAXSettingsClass = (uint64_t (*)())AXSettingsFunction;
  return result;
}

id AXSettingsFunction()
{
  return (id)classAXSettings;
}

void *__AccessibilityUtilitiesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AccessibilityUtilities.framework/AccessibilityUtilities", 2);
  AccessibilityUtilitiesLibrary_sLib = (uint64_t)result;
  return result;
}

Class initCLLocationManager()
{
  if (CoreLocationLibrary_sOnce != -1) {
    dispatch_once(&CoreLocationLibrary_sOnce, &__block_literal_global_1281);
  }
  Class result = objc_getClass("CLLocationManager");
  classCLLocationManager = (uint64_t)result;
  getCLLocationManagerClass = (uint64_t (*)())CLLocationManagerFunction;
  return result;
}

id CLLocationManagerFunction()
{
  return (id)classCLLocationManager;
}

void *__CoreLocationLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 2);
  CoreLocationLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t initValTMSourceProxBuddy()
{
  if (CoreTimeLibrary_sOnce != -1) {
    dispatch_once(&CoreTimeLibrary_sOnce, &__block_literal_global_1293);
  }
  v0 = (uint64_t *)dlsym((void *)CoreTimeLibrary_sLib, "TMSourceProxBuddy");
  if (v0)
  {
    uint64_t result = *v0;
    constantValTMSourceProxBuddy = result;
  }
  else
  {
    uint64_t result = constantValTMSourceProxBuddy;
  }
  getTMSourceProxBuddy = type metadata for ;
  return result;
}

uint64_t type metadata for ()
{
  return constantValTMSourceProxBuddy;
}

void *__CoreTimeLibrary_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/CoreTime.framework/CoreTime", 2);
  CoreTimeLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t initTMSetSourceTime(uint64_t a1, double a2, double a3)
{
  if (CoreTimeLibrary_sOnce != -1) {
    dispatch_once(&CoreTimeLibrary_sOnce, &__block_literal_global_1293);
  }
  v6 = (uint64_t (*)())dlsym((void *)CoreTimeLibrary_sLib, "TMSetSourceTime");
  softLinkTMSetSourceTime = v6;
  v7.n128_f64[0] = a2;
  v8.n128_f64[0] = a3;
  return ((uint64_t (*)(uint64_t, __n128, __n128))v6)(a1, v7, v8);
}

Class initHMDeviceSetupOperationHandler()
{
  if (HomeKitLibrary_sOnce_0 != -1) {
    dispatch_once(&HomeKitLibrary_sOnce_0, &__block_literal_global_1252);
  }
  Class result = objc_getClass("HMDeviceSetupOperationHandler");
  classHMDeviceSetupOperationHandler = (uint64_t)result;
  getHMDeviceSetupOperationHandlerClass = (uint64_t (*)())HMDeviceSetupOperationHandlerFunction;
  return result;
}

id HMDeviceSetupOperationHandlerFunction()
{
  return (id)classHMDeviceSetupOperationHandler;
}

Class initVTPreferences()
{
  if (VoiceTriggerLibrary_sOnce != -1) {
    dispatch_once(&VoiceTriggerLibrary_sOnce, &__block_literal_global_1299);
  }
  Class result = objc_getClass("VTPreferences");
  classVTPreferences = (uint64_t)result;
  getVTPreferencesClass = (uint64_t (*)())VTPreferencesFunction;
  return result;
}

id VTPreferencesFunction()
{
  return (id)classVTPreferences;
}

void *__VoiceTriggerLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/VoiceTrigger.framework/VoiceTrigger", 2);
  VoiceTriggerLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t initTMSetAutomaticTimeZoneEnabled(uint64_t a1)
{
  if (CoreTimeLibrary_sOnce != -1) {
    dispatch_once(&CoreTimeLibrary_sOnce, &__block_literal_global_1293);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)CoreTimeLibrary_sLib, "TMSetAutomaticTimeZoneEnabled");
  softLinkTMSetAutomaticTimeZoneEnabled = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t initTMSetAutomaticTimeEnabled(uint64_t a1)
{
  if (CoreTimeLibrary_sOnce != -1) {
    dispatch_once(&CoreTimeLibrary_sOnce, &__block_literal_global_1293);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)CoreTimeLibrary_sLib, "TMSetAutomaticTimeEnabled");
  softLinkTMSetAutomaticTimeEnabled = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void initTMSetupTime(void *a1, void *a2, double a3)
{
  uint64_t v5 = CoreTimeLibrary_sOnce;
  id v6 = a2;
  id v7 = a1;
  if (v5 != -1) {
    dispatch_once(&CoreTimeLibrary_sOnce, &__block_literal_global_1293);
  }
  softLinkTMSetupTime = (uint64_t (*)())dlsym((void *)CoreTimeLibrary_sLib, "TMSetupTime");
  ((void (*)(id, id, double))softLinkTMSetupTime)(v7, v6, a3);
}

Class initFLFollowUpController()
{
  if (CoreFollowUpLibrary_sOnce != -1) {
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_1306);
  }
  Class result = objc_getClass("FLFollowUpController");
  classFLFollowUpController = (uint64_t)result;
  getFLFollowUpControllerClass = (uint64_t (*)())FLFollowUpControllerFunction;
  return result;
}

id FLFollowUpControllerFunction()
{
  return (id)classFLFollowUpController;
}

void *__CoreFollowUpLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/CoreFollowUp.framework/CoreFollowUp", 2);
  CoreFollowUpLibrary_sLib = (uint64_t)result;
  return result;
}

Class initSUICDefaultVoicePreviewer()
{
  if (SiriUICoreLibrary_sOnce != -1) {
    dispatch_once(&SiriUICoreLibrary_sOnce, &__block_literal_global_1310);
  }
  Class result = objc_getClass("SUICDefaultVoicePreviewer");
  classSUICDefaultVoicePreviewer = (uint64_t)result;
  getSUICDefaultVoicePreviewerClass = (uint64_t (*)())SUICDefaultVoicePreviewerFunction;
  return result;
}

id SUICDefaultVoicePreviewerFunction()
{
  return (id)classSUICDefaultVoicePreviewer;
}

void *__SiriUICoreLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/SiriUICore.framework/SiriUICore", 2);
  SiriUICoreLibrary_sLib = (uint64_t)result;
  return result;
}

Class initAFVoiceInfo()
{
  if (AssistantServicesLibrary_sOnce != -1) {
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1314);
  }
  Class result = objc_getClass("AFVoiceInfo");
  classAFVoiceInfo = (uint64_t)result;
  getAFVoiceInfoClass = (uint64_t (*)())AFVoiceInfoFunction;
  return result;
}

id AFVoiceInfoFunction()
{
  return (id)classAFVoiceInfo;
}

void *__AssistantServicesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices", 2);
  AssistantServicesLibrary_sLib = (uint64_t)result;
  return result;
}

void initAFPreferencesSetHorsemanSupplementalLanguageDictionary(void *a1)
{
  uint64_t v1 = AssistantServicesLibrary_sOnce;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1314);
  }
  softLinkAFPreferencesSetHorsemanSupplementalLanguageDictionary = (uint64_t (*)())dlsym((void *)AssistantServicesLibrary_sLib, "AFPreferencesSetHorsemanSupplementalLanguageDictionary");
  ((void (*)(id))softLinkAFPreferencesSetHorsemanSupplementalLanguageDictionary)(v2);
}

Class initAFConnection()
{
  if (AssistantServicesLibrary_sOnce != -1) {
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1314);
  }
  Class result = objc_getClass("AFConnection");
  classAFConnection = (uint64_t)result;
  getAFConnectionClass = (uint64_t (*)())AFConnectionFunction;
  return result;
}

id AFConnectionFunction()
{
  return (id)classAFConnection;
}

Class initAFLocalization()
{
  if (AssistantServicesLibrary_sOnce != -1) {
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1314);
  }
  Class result = objc_getClass("AFLocalization");
  classAFLocalization = (uint64_t)result;
  getAFLocalizationClass = (uint64_t (*)())AFLocalizationFunction;
  return result;
}

id AFLocalizationFunction()
{
  return (id)classAFLocalization;
}

uint64_t initAFPreferencesSupportedLanguages()
{
  if (AssistantServicesLibrary_sOnce != -1) {
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1314);
  }
  v0 = (uint64_t (*)())dlsym((void *)AssistantServicesLibrary_sLib, "AFPreferencesSupportedLanguages");
  softLinkAFPreferencesSupportedLanguages = v0;
  return v0();
}

Class initAFPreferences()
{
  if (AssistantServicesLibrary_sOnce != -1) {
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1314);
  }
  Class result = objc_getClass("AFPreferences");
  classAFPreferences = (uint64_t)result;
  getAFPreferencesClass = (uint64_t (*)())AFPreferencesFunction;
  return result;
}

id AFPreferencesFunction()
{
  return (id)classAFPreferences;
}

Class initAFSettingsConnection()
{
  if (AssistantServicesLibrary_sOnce != -1) {
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1314);
  }
  Class result = objc_getClass("AFSettingsConnection");
  classAFSettingsConnection = (uint64_t)result;
  getAFSettingsConnectionClass = (uint64_t (*)())AFSettingsConnectionFunction;
  return result;
}

id AFSettingsConnectionFunction()
{
  return (id)classAFSettingsConnection;
}

Class initICCloudClient()
{
  if (iTunesCloudLibrary_sOnce != -1) {
    dispatch_once(&iTunesCloudLibrary_sOnce, &__block_literal_global_1324);
  }
  Class result = objc_getClass("ICCloudClient");
  classICCloudClient = (uint64_t)result;
  getICCloudClientClass = (uint64_t (*)())ICCloudClientFunction;
  return result;
}

id ICCloudClientFunction()
{
  return (id)classICCloudClient;
}

void *__iTunesCloudLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/iTunesCloud.framework/iTunesCloud", 2);
  iTunesCloudLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_23EB82B3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_23EB84628(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_23EB86F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23EBA48C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

const char *SFDeviceSetupProgressEventToString(int a1)
{
  if (a1 > 299)
  {
    if (a1 <= 799)
    {
      if (a1 <= 519)
      {
        if (a1 <= 410)
        {
          if (a1 <= 399)
          {
            if (a1 == 300) {
              return "BackupProgress";
            }
            if (a1 == 310) {
              return "SyncProgress";
            }
          }
          else
          {
            switch(a1)
            {
              case 400:
                return "StopSetup";
              case 401:
                return "PINPair";
              case 410:
                return "MigrateStart";
            }
          }
        }
        else if (a1 > 430)
        {
          switch(a1)
          {
            case 431:
              return "eSimExternal2FAStop";
            case 500:
              return "SiriWelcome";
            case 510:
              return "SiriDialogA";
          }
        }
        else
        {
          switch(a1)
          {
            case 411:
              return "MigrateStop";
            case 420:
              return "FileTransferReady";
            case 430:
              return "eSimExternal2FAStart";
          }
        }
      }
      else if (a1 > 559)
      {
        if (a1 > 599)
        {
          switch(a1)
          {
            case 600:
              return "SiriSkipDemo";
            case 700:
              return "StopSetupLEDs";
            case 710:
              return "AudioPasscodeEnded";
          }
        }
        else
        {
          switch(a1)
          {
            case 560:
              return "SiriDialogCMusic";
            case 570:
              return "SiriDialogCNews";
            case 580:
              return "SiriDialogCWeather";
          }
        }
      }
      else if (a1 > 549)
      {
        switch(a1)
        {
          case 550:
            return "SiriDialogBWeather";
          case 555:
            return "SiriDialogBClock";
          case 558:
            return "SiriDialogBMusic";
        }
      }
      else
      {
        switch(a1)
        {
          case 520:
            return "SiriDialogBStart";
          case 530:
            return "SiriDialogBHome";
          case 540:
            return "SiriDialogBNews";
        }
      }
      return "?";
    }
    if (a1 > 999)
    {
      if (a1 <= 1099)
      {
        if (a1 == 1000) {
          return "SecureIntentStart";
        }
        if (a1 == 1001) {
          return "SecureIntentFinish";
        }
      }
      else
      {
        switch(a1)
        {
          case 1100:
            return "OneTimeCodeDetected";
          case 2000:
            return "DependentStart";
          case 2001:
            return "DependentEnd";
        }
      }
      return "?";
    }
    switch(a1)
    {
      case 900:
        Class result = "SU-No-SetupScanAttempt";
        break;
      case 901:
        Class result = "SU-No-SetupStatusUpdate";
        break;
      case 902:
        Class result = "SU-No-SetupWipeWifi";
        break;
      case 903:
        Class result = "SU-No-SetupCancelled";
        break;
      case 904:
        Class result = "SU-No-SetupObliterate";
        break;
      case 905:
        Class result = "SU-No-SetupCannotCancel";
        break;
      case 906:
        Class result = "SysDrop AirDrop Event";
        break;
      case 907:
        Class result = "SysDrop Sysdiagnose Event";
        break;
      case 908:
        Class result = "SysDrop Cancel Event";
        break;
      case 909:
        Class result = "File Transfer Progress Event";
        break;
      case 910:
        Class result = "File Transfer Completed Event";
        break;
      case 911:
        Class result = "iOSWiFiSetup";
        break;
      case 912:
        Class result = "HKPrimaryResidentSSIDFetchStart";
        break;
      case 913:
        Class result = "LoggingProfileTransfer";
        break;
      default:
        switch(a1)
        {
          case 800:
            Class result = "AuthAccountsStart";
            break;
          case 803:
            Class result = "AuthAccountsiCloudProgress";
            break;
          case 804:
            Class result = "AuthAccountsStoreProgress";
            break;
          case 805:
            Class result = "AuthAccountsGameCenterProgress";
            break;
          default:
            return "?";
        }
        break;
    }
  }
  else if (a1 > 129)
  {
    if (a1 > 249)
    {
      switch(a1)
      {
        case 260:
          Class result = "TVLSStart";
          break;
        case 261:
        case 262:
        case 263:
        case 265:
        case 266:
        case 267:
        case 268:
        case 269:
        case 271:
        case 273:
        case 275:
          return "?";
        case 264:
          Class result = "TVLSFinish";
          break;
        case 270:
          Class result = "TVLSEstimateStart";
          break;
        case 272:
          Class result = "TVLSEstimateFinal";
          break;
        case 274:
          Class result = "TVLSEstimateFailed";
          break;
        case 276:
          Class result = "TVLSTryAgain";
          break;
        case 277:
          Class result = "TVLSToneBegan";
          break;
        case 278:
          Class result = "TVLCalStart";
          break;
        case 279:
          Class result = "TVLCalStep";
          break;
        case 280:
          Class result = "TVLCalFailed";
          break;
        case 281:
          Class result = "TVLCalTryAgain";
          break;
        case 282:
          Class result = "TVLCalFinal";
          break;
        default:
          if (a1 != 250) {
            return "?";
          }
          Class result = "ReportSuccess";
          break;
      }
    }
    else
    {
      if (a1 <= 219)
      {
        if (a1 <= 149)
        {
          if (a1 == 130) {
            return "WiFiPoweredOff";
          }
          if (a1 == 140) {
            return "RecognizeVoice";
          }
        }
        else
        {
          switch(a1)
          {
            case 150:
              return "SiriForEveryone";
            case 200:
              return "WiFiStart";
            case 210:
              return "ActivationStart";
          }
        }
        return "?";
      }
      switch(a1)
      {
        case 230:
          return "HomeKitStart";
        case 231:
        case 232:
        case 233:
        case 235:
        case 237:
        case 238:
        case 239:
          return "?";
        case 234:
          return "HomeKitSetupStart";
        case 236:
          return "CDPSetupStart";
        case 240:
          return "BuddyStarting";
        case 241:
          return "BuddyProgress";
        case 242:
          return "BuddyFinished";
        default:
          if (a1 == 220)
          {
            Class result = "iCloudStart";
          }
          else
          {
            if (a1 != 224) {
              return "?";
            }
            Class result = "AppleIDSetupStart";
          }
          break;
      }
    }
  }
  else
  {
    if (a1 <= 79)
    {
      if (a1 > 49)
      {
        if (a1 > 64)
        {
          if (a1 == 65) {
            return "SecurityAPCLoopStart";
          }
          if (a1 == 70) {
            return "SecurityFinish";
          }
        }
        else
        {
          if (a1 == 50) {
            return "PreAuthFinish";
          }
          if (a1 == 60) {
            return "SecurityStart";
          }
        }
      }
      else
      {
        if (a1 > 29)
        {
          switch(a1)
          {
            case 30:
              Class result = "Error";
              break;
            case 31:
              Class result = "SessionStarted";
              break;
            case 32:
              Class result = "SessionEnded";
              break;
            case 33:
              Class result = "SessionSecured";
              break;
            case 35:
              Class result = "ConnectStart";
              break;
            case 40:
              Class result = "PreAuthStart";
              break;
            default:
              return "?";
          }
          return result;
        }
        switch(a1)
        {
          case 0:
            return "Invalid";
          case 10:
            return "Start";
          case 20:
            return "Final";
        }
      }
      return "?";
    }
    if (a1 > 119)
    {
      switch(a1)
      {
        case 'x':
          return "CheckingiCloud";
        case 'z':
          return "CheckingAppleMusic";
        case '|':
          return "CheckingAccount";
      }
      return "?";
    }
    switch(a1)
    {
      case 'P':
        Class result = "BasicConfigStart";
        break;
      case 'Z':
        Class result = "BasicConfigFinish";
        break;
      case '\\':
        Class result = "StepStart";
        break;
      case '^':
        Class result = "StepFinish";
        break;
      case '_':
        Class result = "PreFinish";
        break;
        Class result = "SetupFinished";
        break;
      case 'a':
        Class result = "SetupResumed";
        break;
      case 'b':
        Class result = "SetupSuspend";
        break;
      case 'c':
        Class result = "SetupPeerSWUpdate";
        break;
      case 'd':
        Class result = "Finished";
        break;
      default:
        return "?";
    }
  }
  return result;
}

void sub_23EBAFEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

Class initAFSettingsConnection_0()
{
  if (AssistantServicesLibrary_sOnce_0 != -1) {
    dispatch_once(&AssistantServicesLibrary_sOnce_0, &__block_literal_global_3065);
  }
  Class result = objc_getClass("AFSettingsConnection");
  classAFSettingsConnection_0 = (uint64_t)result;
  getAFSettingsConnectionClass_0 = (uint64_t (*)())AFSettingsConnectionFunction_0;
  return result;
}

id AFSettingsConnectionFunction_0()
{
  return (id)classAFSettingsConnection_0;
}

void *__AssistantServicesLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices", 2);
  AssistantServicesLibrary_sLib_0 = (uint64_t)result;
  return result;
}

Class initSSAccountStore()
{
  if (StoreServicesLibrary_sOnce != -1) {
    dispatch_once(&StoreServicesLibrary_sOnce, &__block_literal_global_3069);
  }
  Class result = objc_getClass("SSAccountStore");
  classSSAccountStore = (uint64_t)result;
  getSSAccountStoreClass = (uint64_t (*)())SSAccountStoreFunction;
  return result;
}

id SSAccountStoreFunction()
{
  return (id)classSSAccountStore;
}

void *__StoreServicesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/StoreServices.framework/StoreServices", 2);
  StoreServicesLibrary_sLib = (uint64_t)result;
  return result;
}

id initValAVAudioSessionInterruptionNotification()
{
  if (AVFoundationLibrary_sOnce != -1) {
    dispatch_once(&AVFoundationLibrary_sOnce, &__block_literal_global_3073);
  }
  v0 = (id *)dlsym((void *)AVFoundationLibrary_sLib, "AVAudioSessionInterruptionNotification");
  if (v0) {
    objc_storeStrong((id *)&constantValAVAudioSessionInterruptionNotification, *v0);
  }
  getAVAudioSessionInterruptionNotification = (uint64_t (*)())AVAudioSessionInterruptionNotificationFunction;
  uint64_t v1 = (void *)constantValAVAudioSessionInterruptionNotification;
  return v1;
}

id AVAudioSessionInterruptionNotificationFunction()
{
  return (id)constantValAVAudioSessionInterruptionNotification;
}

void *__AVFoundationLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", 2);
  AVFoundationLibrary_sLib = (uint64_t)result;
  return result;
}

Class initSKCloudServiceController()
{
  if (StoreKitLibrary_sOnce != -1) {
    dispatch_once(&StoreKitLibrary_sOnce, &__block_literal_global_3081);
  }
  Class result = objc_getClass("SKCloudServiceController");
  classSKCloudServiceController = (uint64_t)result;
  getSKCloudServiceControllerClass = (uint64_t (*)())SKCloudServiceControllerFunction;
  return result;
}

id SKCloudServiceControllerFunction()
{
  return (id)classSKCloudServiceController;
}

void *__StoreKitLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/StoreKit.framework/StoreKit", 2);
  StoreKitLibrary_sLib = (uint64_t)result;
  return result;
}

Class initHFUtilities()
{
  if (HomeLibrary_sOnce != -1) {
    dispatch_once(&HomeLibrary_sOnce, &__block_literal_global_3085);
  }
  Class result = objc_getClass("HFUtilities");
  classHFUtilities = (uint64_t)result;
  getHFUtilitiesClass = (uint64_t (*)())HFUtilitiesFunction;
  return result;
}

id HFUtilitiesFunction()
{
  return (id)classHFUtilities;
}

void *__HomeLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/Home.framework/Home", 2);
  HomeLibrary_sLib = (uint64_t)result;
  return result;
}

Class initAFPreferences_0()
{
  if (AssistantServicesLibrary_sOnce_0 != -1) {
    dispatch_once(&AssistantServicesLibrary_sOnce_0, &__block_literal_global_3065);
  }
  Class result = objc_getClass("AFPreferences");
  classAFPreferences_0 = (uint64_t)result;
  getAFPreferencesClass_0 = (uint64_t (*)())AFPreferencesFunction_0;
  return result;
}

id AFPreferencesFunction_0()
{
  return (id)classAFPreferences_0;
}

Class initAFVoiceInfo_0()
{
  if (AssistantServicesLibrary_sOnce_0 != -1) {
    dispatch_once(&AssistantServicesLibrary_sOnce_0, &__block_literal_global_3065);
  }
  Class result = objc_getClass("AFVoiceInfo");
  classAFVoiceInfo_0 = (uint64_t)result;
  getAFVoiceInfoClass_0 = (uint64_t (*)())AFVoiceInfoFunction_0;
  return result;
}

id AFVoiceInfoFunction_0()
{
  return (id)classAFVoiceInfo_0;
}

Class initCLLocationManager_0()
{
  if (CoreLocationLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreLocationLibrary_sOnce_0, &__block_literal_global_3099);
  }
  Class result = objc_getClass("CLLocationManager");
  classCLLocationManager_0 = (uint64_t)result;
  getCLLocationManagerClass_0 = (uint64_t (*)())CLLocationManagerFunction_0;
  return result;
}

id CLLocationManagerFunction_0()
{
  return (id)classCLLocationManager_0;
}

void *__CoreLocationLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 2);
  CoreLocationLibrary_sLib_0 = (uint64_t)result;
  return result;
}

Class initAARemoteServer()
{
  if (AppleAccountLibrary_sOnce != -1) {
    dispatch_once(&AppleAccountLibrary_sOnce, &__block_literal_global_3103);
  }
  Class result = objc_getClass("AARemoteServer");
  classAARemoteServer = (uint64_t)result;
  getAARemoteServerClass = (uint64_t (*)())AARemoteServerFunction;
  return result;
}

id AARemoteServerFunction()
{
  return (id)classAARemoteServer;
}

void *__AppleAccountLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AppleAccount.framework/AppleAccount", 2);
  AppleAccountLibrary_sLib = (uint64_t)result;
  return result;
}

Class initAKAccountManager()
{
  if (AuthKitLibrary_sOnce != -1) {
    dispatch_once(&AuthKitLibrary_sOnce, &__block_literal_global_3116);
  }
  Class result = objc_getClass("AKAccountManager");
  classAKAccountManager = (uint64_t)result;
  getAKAccountManagerClass = (uint64_t (*)())AKAccountManagerFunction;
  return result;
}

id AKAccountManagerFunction()
{
  return (id)classAKAccountManager;
}

void *__AuthKitLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit", 2);
  AuthKitLibrary_sLib = (uint64_t)result;
  return result;
}

id initValkAccountDataclassHome()
{
  if (AccountsLibrary_sOnce != -1) {
    dispatch_once(&AccountsLibrary_sOnce, &__block_literal_global_3120);
  }
  v0 = (id *)dlsym((void *)AccountsLibrary_sLib, "kAccountDataclassHome");
  if (v0) {
    objc_storeStrong((id *)&constantValkAccountDataclassHome, *v0);
  }
  getkAccountDataclassHome = (uint64_t (*)())kAccountDataclassHomeFunction;
  uint64_t v1 = (void *)constantValkAccountDataclassHome;
  return v1;
}

id kAccountDataclassHomeFunction()
{
  return (id)constantValkAccountDataclassHome;
}

void *__AccountsLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/Accounts.framework/Accounts", 2);
  AccountsLibrary_sLib = (uint64_t)result;
  return result;
}

Class initCDPAccount()
{
  if (CoreCDPLibrary_sOnce != -1) {
    dispatch_once(&CoreCDPLibrary_sOnce, &__block_literal_global_3124);
  }
  Class result = objc_getClass("CDPAccount");
  classCDPAccount = (uint64_t)result;
  getCDPAccountClass = (uint64_t (*)())CDPAccountFunction;
  return result;
}

id CDPAccountFunction()
{
  return (id)classCDPAccount;
}

void *__CoreCDPLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/CoreCDP.framework/CoreCDP", 2);
  CoreCDPLibrary_sLib = (uint64_t)result;
  return result;
}

Class initVTPreferences_0()
{
  if (VoiceTriggerLibrary_sOnce_0 != -1) {
    dispatch_once(&VoiceTriggerLibrary_sOnce_0, &__block_literal_global_3128);
  }
  Class result = objc_getClass("VTPreferences");
  classVTPreferences_0 = (uint64_t)result;
  getVTPreferencesClass_0 = (uint64_t (*)())VTPreferencesFunction_0;
  return result;
}

id VTPreferencesFunction_0()
{
  return (id)classVTPreferences_0;
}

void *__VoiceTriggerLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/VoiceTrigger.framework/VoiceTrigger", 2);
  VoiceTriggerLibrary_sLib_0 = (uint64_t)result;
  return result;
}

uint64_t initAFPreferencesHorsemanSupplementalLanguageDictionary()
{
  if (AssistantServicesLibrary_sOnce_0 != -1) {
    dispatch_once(&AssistantServicesLibrary_sOnce_0, &__block_literal_global_3065);
  }
  v0 = (uint64_t (*)())dlsym((void *)AssistantServicesLibrary_sLib_0, "AFPreferencesHorsemanSupplementalLanguageDictionary");
  softLinkAFPreferencesHorsemanSupplementalLanguageDictionary = v0;
  return v0();
}

Class initCDPWalrusStateController()
{
  if (CoreCDPLibrary_sOnce != -1) {
    dispatch_once(&CoreCDPLibrary_sOnce, &__block_literal_global_3124);
  }
  Class result = objc_getClass("CDPWalrusStateController");
  classCDPWalrusStateController = (uint64_t)result;
  getCDPWalrusStateControllerClass = (uint64_t (*)())CDPWalrusStateControllerFunction;
  return result;
}

id CDPWalrusStateControllerFunction()
{
  return (id)classCDPWalrusStateController;
}

Class initSSRVoiceProfileManager()
{
  if (SpeakerRecognitionLibrary_sOnce != -1) {
    dispatch_once(&SpeakerRecognitionLibrary_sOnce, &__block_literal_global_3145);
  }
  Class result = objc_getClass("SSRVoiceProfileManager");
  classSSRVoiceProfileManager = (uint64_t)result;
  getSSRVoiceProfileManagerClass = (uint64_t (*)())SSRVoiceProfileManagerFunction;
  return result;
}

id SSRVoiceProfileManagerFunction()
{
  return (id)classSSRVoiceProfileManager;
}

void *__SpeakerRecognitionLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/SpeakerRecognition.framework/SpeakerRecognition", 2);
  SpeakerRecognitionLibrary_sLib = (uint64_t)result;
  return result;
}

Class initAFEnablementFlowConfigurationProvider()
{
  if (AssistantServicesLibrary_sOnce_0 != -1) {
    dispatch_once(&AssistantServicesLibrary_sOnce_0, &__block_literal_global_3065);
  }
  Class result = objc_getClass("AFEnablementFlowConfigurationProvider");
  classAFEnablementFlowConfigurationProvider = (uint64_t)result;
  getAFEnablementFlowConfigurationProviderClass = (uint64_t (*)())AFEnablementFlowConfigurationProviderFunction;
  return result;
}

id AFEnablementFlowConfigurationProviderFunction()
{
  return (id)classAFEnablementFlowConfigurationProvider;
}

Class initAKAppleIDAuthenticationInAppContext()
{
  if (AuthKitUILibrary_sOnce != -1) {
    dispatch_once(&AuthKitUILibrary_sOnce, &__block_literal_global_3157);
  }
  Class result = objc_getClass("AKAppleIDAuthenticationInAppContext");
  classAKAppleIDAuthenticationInAppContext = (uint64_t)result;
  getAKAppleIDAuthenticationInAppContextClass = (uint64_t (*)())AKAppleIDAuthenticationInAppContextFunction;
  return result;
}

id AKAppleIDAuthenticationInAppContextFunction()
{
  return (id)classAKAppleIDAuthenticationInAppContext;
}

void *__AuthKitUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AuthKitUI.framework/AuthKitUI", 2);
  AuthKitUILibrary_sLib = (uint64_t)result;
  return result;
}

Class initAPCListener()
{
  if (AudioPasscodeLibrary_sOnce_0 != -1) {
    dispatch_once(&AudioPasscodeLibrary_sOnce_0, &__block_literal_global_3161);
  }
  Class result = objc_getClass("APCListener");
  classAPCListener = (uint64_t)result;
  getAPCListenerClass = (uint64_t (*)())APCListenerFunction;
  return result;
}

id APCListenerFunction()
{
  return (id)classAPCListener;
}

void *__AudioPasscodeLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AudioPasscode.framework/AudioPasscode", 2);
  AudioPasscodeLibrary_sLib_0 = (uint64_t)result;
  return result;
}

id initValAVAudioSessionCategoryAmbient()
{
  if (AVFoundationLibrary_sOnce != -1) {
    dispatch_once(&AVFoundationLibrary_sOnce, &__block_literal_global_3073);
  }
  v0 = (id *)dlsym((void *)AVFoundationLibrary_sLib, "AVAudioSessionCategoryAmbient");
  if (v0) {
    objc_storeStrong((id *)&constantValAVAudioSessionCategoryAmbient, *v0);
  }
  getAVAudioSessionCategoryAmbient = (uint64_t (*)())AVAudioSessionCategoryAmbientFunction;
  uint64_t v1 = (void *)constantValAVAudioSessionCategoryAmbient;
  return v1;
}

id AVAudioSessionCategoryAmbientFunction()
{
  return (id)constantValAVAudioSessionCategoryAmbient;
}

id initValAVAudioSessionModeDefault()
{
  if (AVFoundationLibrary_sOnce != -1) {
    dispatch_once(&AVFoundationLibrary_sOnce, &__block_literal_global_3073);
  }
  v0 = (id *)dlsym((void *)AVFoundationLibrary_sLib, "AVAudioSessionModeDefault");
  if (v0) {
    objc_storeStrong((id *)&constantValAVAudioSessionModeDefault, *v0);
  }
  getAVAudioSessionModeDefault = (uint64_t (*)())AVAudioSessionModeDefaultFunction;
  uint64_t v1 = (void *)constantValAVAudioSessionModeDefault;
  return v1;
}

id AVAudioSessionModeDefaultFunction()
{
  return (id)constantValAVAudioSessionModeDefault;
}

uint64_t init_AXSVoiceOverTouchEnabled()
{
  if (AccessibilityLibrary_sOnce_0 != -1) {
    dispatch_once(&AccessibilityLibrary_sOnce_0, &__block_literal_global_3167);
  }
  v0 = (uint64_t (*)())dlsym((void *)AccessibilityLibrary_sLib_0, "_AXSVoiceOverTouchEnabled");
  softLink_AXSVoiceOverTouchEnabled = v0;
  return v0();
}

void *__AccessibilityLibrary_block_invoke_0()
{
  Class result = dlopen("/usr/lib/libAccessibility.dylib", 2);
  AccessibilityLibrary_sLib_0 = (uint64_t)result;
  return result;
}

uint64_t init_AXSVoiceOverTouchSpeakingRate()
{
  if (AccessibilityLibrary_sOnce_0 != -1) {
    dispatch_once(&AccessibilityLibrary_sOnce_0, &__block_literal_global_3167);
  }
  v0 = (uint64_t (*)())dlsym((void *)AccessibilityLibrary_sLib_0, "_AXSVoiceOverTouchSpeakingRate");
  softLink_AXSVoiceOverTouchSpeakingRate = v0;
  return v0();
}

Class initAXSettings_0()
{
  if (AccessibilityUtilitiesLibrary_sOnce_0 != -1) {
    dispatch_once(&AccessibilityUtilitiesLibrary_sOnce_0, &__block_literal_global_3172);
  }
  Class result = objc_getClass("AXSettings");
  classAXSettings_0 = (uint64_t)result;
  getAXSettingsClass_0 = (uint64_t (*)())AXSettingsFunction_0;
  return result;
}

id AXSettingsFunction_0()
{
  return (id)classAXSettings_0;
}

void *__AccessibilityUtilitiesLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AccessibilityUtilities.framework/AccessibilityUtilities", 2);
  AccessibilityUtilitiesLibrary_sLib_0 = (uint64_t)result;
  return result;
}

uint64_t initTMIsAutomaticTimeEnabled()
{
  if (CoreTimeLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreTimeLibrary_sOnce_0, &__block_literal_global_3176);
  }
  v0 = (uint64_t (*)())dlsym((void *)CoreTimeLibrary_sLib_0, "TMIsAutomaticTimeEnabled");
  softLinkTMIsAutomaticTimeEnabled = v0;
  return v0();
}

void *__CoreTimeLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/CoreTime.framework/CoreTime", 2);
  CoreTimeLibrary_sLib_0 = (uint64_t)result;
  return result;
}

uint64_t initTMIsAutomaticTimeZoneEnabled()
{
  if (CoreTimeLibrary_sOnce_0 != -1) {
    dispatch_once(&CoreTimeLibrary_sOnce_0, &__block_literal_global_3176);
  }
  v0 = (uint64_t (*)())dlsym((void *)CoreTimeLibrary_sLib_0, "TMIsAutomaticTimeZoneEnabled");
  softLinkTMIsAutomaticTimeZoneEnabled = v0;
  return v0();
}

Class initTROperationQueue_0()
{
  if (TouchRemoteLibrary_sOnce_0 != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_3181);
  }
  Class result = objc_getClass("TROperationQueue");
  classTROperationQueue_0 = (uint64_t)result;
  getTROperationQueueClass_0 = (uint64_t (*)())TROperationQueueFunction_0;
  return result;
}

id TROperationQueueFunction_0()
{
  return (id)classTROperationQueue_0;
}

void *__TouchRemoteLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/TouchRemote.framework/TouchRemote", 2);
  TouchRemoteLibrary_sLib_0 = (uint64_t)result;
  return result;
}

Class initTRSetupConfigurationOperation()
{
  if (TouchRemoteLibrary_sOnce_0 != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_3181);
  }
  Class result = objc_getClass("TRSetupConfigurationOperation");
  classTRSetupConfigurationOperation = (uint64_t)result;
  getTRSetupConfigurationOperationClass = (uint64_t (*)())TRSetupConfigurationOperationFunction;
  return result;
}

id TRSetupConfigurationOperationFunction()
{
  return (id)classTRSetupConfigurationOperation;
}

id initValTRSetupConfigurationOperationNeedsNetworkKey()
{
  if (TouchRemoteLibrary_sOnce_0 != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_3181);
  }
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRSetupConfigurationOperationNeedsNetworkKey");
  if (v0) {
    objc_storeStrong((id *)&constantValTRSetupConfigurationOperationNeedsNetworkKey, *v0);
  }
  getTRSetupConfigurationOperationNeedsNetworkKey = (uint64_t (*)())TRSetupConfigurationOperationNeedsNetworkKeyFunction;
  uint64_t v1 = (void *)constantValTRSetupConfigurationOperationNeedsNetworkKey;
  return v1;
}

id TRSetupConfigurationOperationNeedsNetworkKeyFunction()
{
  return (id)constantValTRSetupConfigurationOperationNeedsNetworkKey;
}

id initValTRSetupConfigurationOperationUnauthenticatedServicesKey()
{
  if (TouchRemoteLibrary_sOnce_0 != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_3181);
  }
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRSetupConfigurationOperationUnauthenticatedServicesKey");
  if (v0) {
    objc_storeStrong((id *)&constantValTRSetupConfigurationOperationUnauthenticatedServicesKey, *v0);
  }
  getTRSetupConfigurationOperationUnauthenticatedServicesKey = (uint64_t (*)())TRSetupConfigurationOperationUnauthenticatedServicesKeyFunction;
  uint64_t v1 = (void *)constantValTRSetupConfigurationOperationUnauthenticatedServicesKey;
  return v1;
}

id TRSetupConfigurationOperationUnauthenticatedServicesKeyFunction()
{
  return (id)constantValTRSetupConfigurationOperationUnauthenticatedServicesKey;
}

id initValTRSetupConfigurationOperationUseAIDAKey()
{
  if (TouchRemoteLibrary_sOnce_0 != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_3181);
  }
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRSetupConfigurationOperationUseAIDAKey");
  if (v0) {
    objc_storeStrong((id *)&constantValTRSetupConfigurationOperationUseAIDAKey, *v0);
  }
  getTRSetupConfigurationOperationUseAIDAKey = (uint64_t (*)())TRSetupConfigurationOperationUseAIDAKeyFunction;
  uint64_t v1 = (void *)constantValTRSetupConfigurationOperationUseAIDAKey;
  return v1;
}

id TRSetupConfigurationOperationUseAIDAKeyFunction()
{
  return (id)constantValTRSetupConfigurationOperationUseAIDAKey;
}

Class initTRActivationOperation()
{
  if (TouchRemoteLibrary_sOnce_0 != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_3181);
  }
  Class result = objc_getClass("TRActivationOperation");
  classTRActivationOperation = (uint64_t)result;
  getTRActivationOperationClass = (uint64_t (*)())TRActivationOperationFunction;
  return result;
}

id TRActivationOperationFunction()
{
  return (id)classTRActivationOperation;
}

id initValTRActivationOperationIsActivatedKey()
{
  if (TouchRemoteLibrary_sOnce_0 != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_3181);
  }
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRActivationOperationIsActivatedKey");
  if (v0) {
    objc_storeStrong((id *)&constantValTRActivationOperationIsActivatedKey, *v0);
  }
  getTRActivationOperationIsActivatedKey = (uint64_t (*)())TRActivationOperationIsActivatedKeyFunction;
  uint64_t v1 = (void *)constantValTRActivationOperationIsActivatedKey;
  return v1;
}

id TRActivationOperationIsActivatedKeyFunction()
{
  return (id)constantValTRActivationOperationIsActivatedKey;
}

id initValTRActivationOperationErrorKey()
{
  if (TouchRemoteLibrary_sOnce_0 != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_3181);
  }
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRActivationOperationErrorKey");
  if (v0) {
    objc_storeStrong((id *)&constantValTRActivationOperationErrorKey, *v0);
  }
  getTRActivationOperationErrorKey = (uint64_t (*)())TRActivationOperationErrorKeyFunction;
  uint64_t v1 = (void *)constantValTRActivationOperationErrorKey;
  return v1;
}

id TRActivationOperationErrorKeyFunction()
{
  return (id)constantValTRActivationOperationErrorKey;
}

Class initTRAuthenticationOperation()
{
  if (TouchRemoteLibrary_sOnce_0 != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_3181);
  }
  Class result = objc_getClass("TRAuthenticationOperation");
  classTRAuthenticationOperation = (uint64_t)result;
  getTRAuthenticationOperationClass = (uint64_t (*)())TRAuthenticationOperationFunction;
  return result;
}

id TRAuthenticationOperationFunction()
{
  return (id)classTRAuthenticationOperation;
}

id initValTRAuthenticationOperationUnauthenticatedServicesKey()
{
  if (TouchRemoteLibrary_sOnce_0 != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_3181);
  }
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRAuthenticationOperationUnauthenticatedServicesKey");
  if (v0) {
    objc_storeStrong((id *)&constantValTRAuthenticationOperationUnauthenticatedServicesKey, *v0);
  }
  getTRAuthenticationOperationUnauthenticatedServicesKey = (uint64_t (*)())TRAuthenticationOperationUnauthenticatedServicesKeyFunction;
  uint64_t v1 = (void *)constantValTRAuthenticationOperationUnauthenticatedServicesKey;
  return v1;
}

id TRAuthenticationOperationUnauthenticatedServicesKeyFunction()
{
  return (id)constantValTRAuthenticationOperationUnauthenticatedServicesKey;
}

id initValTRAuthenticationOperationErrorKey()
{
  if (TouchRemoteLibrary_sOnce_0 != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_3181);
  }
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRAuthenticationOperationErrorKey");
  if (v0) {
    objc_storeStrong((id *)&constantValTRAuthenticationOperationErrorKey, *v0);
  }
  getTRAuthenticationOperationErrorKey = (uint64_t (*)())TRAuthenticationOperationErrorKeyFunction;
  uint64_t v1 = (void *)constantValTRAuthenticationOperationErrorKey;
  return v1;
}

id TRAuthenticationOperationErrorKeyFunction()
{
  return (id)constantValTRAuthenticationOperationErrorKey;
}

id initValTROperationErrorDomain()
{
  if (TouchRemoteLibrary_sOnce_0 != -1) {
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_3181);
  }
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TROperationErrorDomain");
  if (v0) {
    objc_storeStrong((id *)&constantValTROperationErrorDomain, *v0);
  }
  getTROperationErrorDomain = (uint64_t (*)())TROperationErrorDomainFunction;
  uint64_t v1 = (void *)constantValTROperationErrorDomain;
  return v1;
}

id TROperationErrorDomainFunction()
{
  return (id)constantValTROperationErrorDomain;
}

uint64_t initIDSCopyLocalDeviceUniqueID()
{
  if (IDSLibrary_sOnce != -1) {
    dispatch_once(&IDSLibrary_sOnce, &__block_literal_global_3196);
  }
  v0 = (uint64_t (*)())dlsym((void *)IDSLibrary_sLib, "IDSCopyLocalDeviceUniqueID");
  softLinkIDSCopyLocalDeviceUniqueID = v0;
  return v0();
}

void *__IDSLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/IDS.framework/IDS", 2);
  IDSLibrary_sLib = (uint64_t)result;
  return result;
}

Class initAMSDevice()
{
  if (AppleMediaServicesLibrary_sOnce != -1) {
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_3200);
  }
  Class result = objc_getClass("AMSDevice");
  classAMSDevice = (uint64_t)result;
  getAMSDeviceClass = (uint64_t (*)())AMSDeviceFunction;
  return result;
}

id AMSDeviceFunction()
{
  return (id)classAMSDevice;
}

void *__AppleMediaServicesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AppleMediaServices.framework/AppleMediaServices", 2);
  AppleMediaServicesLibrary_sLib = (uint64_t)result;
  return result;
}

Class initHMHomeManager_1()
{
  if (HomeKitLibrary_sOnce_1 != -1) {
    dispatch_once(&HomeKitLibrary_sOnce_1, &__block_literal_global_3301);
  }
  Class result = objc_getClass("HMHomeManager");
  classHMHomeManager_1 = (uint64_t)result;
  getHMHomeManagerClass_1 = (uint64_t (*)())HMHomeManagerFunction_1;
  return result;
}

id HMHomeManagerFunction_1()
{
  return (id)classHMHomeManager_1;
}

void *__HomeKitLibrary_block_invoke_1()
{
  Class result = dlopen("/System/Library/Frameworks/HomeKit.framework/HomeKit", 2);
  HomeKitLibrary_sLib_1 = (uint64_t)result;
  return result;
}

Class initAVAudioSession()
{
  if (AVFoundationLibrary_sOnce != -1) {
    dispatch_once(&AVFoundationLibrary_sOnce, &__block_literal_global_3073);
  }
  Class result = objc_getClass("AVAudioSession");
  classAVAudioSession = (uint64_t)result;
  getAVAudioSessionClass = (uint64_t (*)())AVAudioSessionFunction;
  return result;
}

id AVAudioSessionFunction()
{
  return (id)classAVAudioSession;
}

Class initAVAudioPlayer()
{
  if (AVFoundationLibrary_sOnce != -1) {
    dispatch_once(&AVFoundationLibrary_sOnce, &__block_literal_global_3073);
  }
  Class result = objc_getClass("AVAudioPlayer");
  classAVAudioPlayer = (uint64_t)result;
  getAVAudioPlayerClass = (uint64_t (*)())AVAudioPlayerFunction;
  return result;
}

id AVAudioPlayerFunction()
{
  return (id)classAVAudioPlayer;
}

id HDSLocalizedStringForKey(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  uint64_t v3 = [v1 mainBundle];
  id v4 = [v3 localizedStringForKey:v2 value:&stru_26F254F18 table:@"Localizable"];

  return v4;
}

void HDSDispatchTimerSet(void *a1, double a2, double a3, double a4)
{
  unint64_t v6 = (unint64_t)(a2 * 1000000000.0);
  source = a1;
  dispatch_time_t v7 = dispatch_time(0x8000000000000000, v6);
  if (a4 <= -10.0)
  {
    uint64_t v8 = v6 / 0xA;
  }
  else if (a4 <= -4.0)
  {
    uint64_t v8 = v6 >> 2;
  }
  else
  {
    uint64_t v8 = (unint64_t)(a4 * 1000000000.0);
  }
  if (a3 < 0.0) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = (unint64_t)(a3 * 1000000000.0);
  }
  dispatch_source_set_timer(source, v7, v9, v8);
}

BOOL HDSDeviceLocked()
{
  return MKBGetDeviceLockState() - 1 < 2;
}

uint64_t HDSIsDevicePhone()
{
  if (HDSIsDevicePhone_onceToken != -1) {
    dispatch_once(&HDSIsDevicePhone_onceToken, &__block_literal_global_7);
  }
  return HDSIsDevicePhone_isPhone;
}

uint64_t __HDSIsDevicePhone_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  HDSIsDevicePhone_isPhone = result == 1;
  return result;
}

uint64_t HDSIsGreenTeaDevice()
{
  if (HDSIsGreenTeaDevice_onceToken != -1) {
    dispatch_once(&HDSIsGreenTeaDevice_onceToken, &__block_literal_global_9);
  }
  return HDSIsGreenTeaDevice_result;
}

uint64_t __HDSIsGreenTeaDevice_block_invoke()
{
  if (MGGetBoolAnswer()) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = MGGetBoolAnswer();
  }
  HDSIsGreenTeaDevice_uint64_t result = result;
  return result;
}

id SVSLocalizedNameForDeviceClassCode(char a1)
{
  if ((a1 - 2) > 3u) {
    uint64_t v1 = @"iPhone";
  }
  else {
    uint64_t v1 = off_265040938[(char)(a1 - 2)];
  }
  return SVSLocalizedStringEx(@"Localizable", v1);
}

id SVSLocalizedString(void *a1)
{
  return SVSLocalizedStringEx(@"Localizable", a1);
}

id SVSLocalizedStringEx(void *a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a2;
  id v5 = a1;
  unint64_t v6 = [v3 mainBundle];
  dispatch_time_t v7 = SVSLocalizedStringEx2(v6, v5, v4);

  return v7;
}

id SVSLocalizedStringEx2(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (HDSIsGreenTeaDevice_onceToken != -1) {
    dispatch_once(&HDSIsGreenTeaDevice_onceToken, &__block_literal_global_9);
  }
  if (HDSIsGreenTeaDevice_result)
  {
    uint64_t v8 = [v7 stringByAppendingString:@"_GT"];
    uint64_t v9 = [v5 localizedStringForKey:v8 value:@"_GT" table:v6];

    if (![v9 isEqual:@"_GT"]) {
      goto LABEL_7;
    }
  }
  uint64_t v9 = 0;
LABEL_7:
  if (![v9 length])
  {
    uint64_t v10 = [v5 localizedStringForKey:v7 value:&stru_26F254F18 table:v6];

    uint64_t v9 = (void *)v10;
  }
  if (v9) {
    v11 = v9;
  }
  else {
    v11 = v7;
  }
  id v12 = v11;

  return v12;
}

id SVSLocalizedStringV(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = SVSLocalizedStringEx(@"Localizable", v5);
  id v15 = 0;
  uint64_t v8 = (void *)[[NSString alloc] initWithValidatedFormat:v7 validFormatSpecifiers:v6 arguments:a3 error:&v15];

  id v9 = v15;
  uint64_t v10 = v8;
  if (!v8)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString * _Nonnull SVSLocalizedStringV(NSString * _Nonnull __strong, NSString *__strong _Nonnull, va_list)");
    [v13 handleFailureInFunction:v14, @"Utilities.m", 109, @"nil localized string for %@ key - %@", v5, v9 file lineNumber description];

    uint64_t v10 = v5;
  }
  id v11 = v10;

  return v11;
}

id SVSLocalizedStringF(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = SVSLocalizedStringV(a1, a2, (uint64_t)&a9);
  return v9;
}

id SVSAddSuffixForCurrentDeviceClassAndProductName()
{
  v0 = CUAddSuffixForCurrentDeviceClass();
  uint64_t v1 = [v0 stringByAppendingString:@"_HOMEPOD"];

  return v1;
}

id FrontBoardOpenURLOptions()
{
  v4[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F3F5E8];
  v3[0] = *MEMORY[0x263F3F608];
  v3[1] = v0;
  v4[0] = MEMORY[0x263EFFA88];
  v4[1] = MEMORY[0x263EFFA88];
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return v1;
}

uint64_t SFTestFlagsFromString(void *a1)
{
  strlen((const char *)[a1 UTF8String]);
  uint64_t v1 = 1;
  while (TextSep())
  {
    if (strnicmpx())
    {
      if (strnicmpx())
      {
        if (strnicmpx())
        {
          if (strnicmpx())
          {
            if (strnicmpx())
            {
              if (strnicmpx())
              {
                if (strnicmpx())
                {
                  if (strnicmpx())
                  {
                    if (strnicmpx())
                    {
                      if (strnicmpx())
                      {
                        if (strnicmpx())
                        {
                          if (strnicmpx())
                          {
                            if (strnicmpx())
                            {
                              if (strnicmpx())
                              {
                                if (strnicmpx())
                                {
                                  if (strnicmpx())
                                  {
                                    if (strnicmpx())
                                    {
                                      if (strnicmpx())
                                      {
                                        if (strnicmpx())
                                        {
                                          if (strnicmpx())
                                          {
                                            if (strnicmpx())
                                            {
                                              if (strnicmpx())
                                              {
                                                if (strnicmpx())
                                                {
                                                  if (strnicmpx())
                                                  {
                                                    if (strnicmp_prefix())
                                                    {
                                                      if (strnicmp_prefix())
                                                      {
                                                        if (strnicmp_prefix())
                                                        {
                                                          if (strnicmp_prefix())
                                                          {
                                                            if (strnicmp_prefix())
                                                            {
                                                              if (strnicmp_prefix())
                                                              {
                                                                if (strnicmp_prefix())
                                                                {
                                                                  if (strnicmpx())
                                                                  {
                                                                    if (strnicmpx())
                                                                    {
                                                                      if (strnicmpx())
                                                                      {
                                                                        if (strnicmpx())
                                                                        {
                                                                          if (strnicmpx())
                                                                          {
                                                                            if (!strnicmpx()) {
                                                                              v1 |= 0x10000000000uLL;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v1 |= 0x1000000000uLL;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v1 |= 0x800000000uLL;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v1 |= 0x400000000uLL;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v1 |= 0x200000000uLL;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v1 |= 0x100000000uLL;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v1 |= 0x80000000uLL;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v1 |= 0x20000000uLL;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v1 |= 0x10000000uLL;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v1 |= 0x8000000uLL;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v1 |= 0x4000000uLL;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v1 |= 0x40000000uLL;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v1 |= 0x2000000uLL;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v1 |= 0x1000000uLL;
                                                  }
                                                }
                                                else
                                                {
                                                  v1 |= 0x800000uLL;
                                                }
                                              }
                                              else
                                              {
                                                v1 |= 0x400000uLL;
                                              }
                                            }
                                            else
                                            {
                                              v1 |= 0x200000uLL;
                                            }
                                          }
                                          else
                                          {
                                            v1 |= 0x100000uLL;
                                          }
                                        }
                                        else
                                        {
                                          v1 |= 0x80000uLL;
                                        }
                                      }
                                      else
                                      {
                                        v1 |= 0x40000uLL;
                                      }
                                    }
                                    else
                                    {
                                      v1 |= 0x20000uLL;
                                    }
                                  }
                                  else
                                  {
                                    v1 |= 0x10000uLL;
                                  }
                                }
                                else
                                {
                                  v1 |= 0x8000uLL;
                                }
                              }
                              else
                              {
                                v1 |= 0x4000uLL;
                              }
                            }
                            else
                            {
                              v1 |= 0x2000uLL;
                            }
                          }
                          else
                          {
                            v1 |= 0x1000uLL;
                          }
                        }
                        else
                        {
                          v1 |= 0x800uLL;
                        }
                      }
                      else
                      {
                        v1 |= 0x400uLL;
                      }
                    }
                    else
                    {
                      v1 |= 0x200uLL;
                    }
                  }
                  else
                  {
                    v1 |= 0x100uLL;
                  }
                }
                else
                {
                  v1 |= 0x80uLL;
                }
              }
              else
              {
                v1 |= 0x40uLL;
              }
            }
            else
            {
              v1 |= 0x20uLL;
            }
          }
          else
          {
            v1 |= 0x10uLL;
          }
        }
        else
        {
          v1 |= 8uLL;
        }
      }
      else
      {
        v1 |= 4uLL;
      }
    }
    else
    {
      v1 |= 2uLL;
    }
  }
  return v1;
}

uint64_t HDSFMLDevice.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC15HomeDeviceSetup12HDSFMLDevice_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HDSFMLDevice.deviceName.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC15HomeDeviceSetup12HDSFMLDevice_deviceName);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HDSFMLDevice.isThisDevice.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC15HomeDeviceSetup12HDSFMLDevice_isThisDevice);
}

id HDSFMLDevice.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HDSFMLDevice.init()()
{
}

id HDSFMLDevice.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HDSFMLDevice()
{
  return self;
}

uint64_t method lookup function for HDSFMLDevice(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HDSFMLDevice);
}

uint64_t sub_23EBB6EE0()
{
  uint64_t v0 = sub_23EBBB2A0();
  __swift_allocate_value_buffer(v0, qword_268C11AD0);
  __swift_project_value_buffer(v0, (uint64_t)qword_268C11AD0);
  return sub_23EBBB290();
}

BOOL sub_23EBB6F64(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23EBB6F7C()
{
  return sub_23EBBB3F0();
}

uint64_t sub_23EBB6FC4()
{
  return sub_23EBBB3E0();
}

uint64_t sub_23EBB6FF0()
{
  return sub_23EBBB3F0();
}

uint64_t sub_23EBB7044()
{
  uint64_t v0 = sub_23EBBB2A0();
  __swift_allocate_value_buffer(v0, qword_268C11AE8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268C11AE8);
  if (qword_268C119C8 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268C11AD0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_23EBB710C()
{
  v1[10] = v0;
  uint64_t v2 = sub_23EBBB1C0();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v3 = sub_23EBBB220();
  v1[14] = v3;
  v1[15] = *(void *)(v3 - 8);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23EBB725C, 0, 0);
}

uint64_t sub_23EBB725C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = OBJC_IVAR____TtC15HomeDeviceSetup19FindMyLocateSession_session;
  v0[21] = OBJC_IVAR____TtC15HomeDeviceSetup19FindMyLocateSession_session;
  v0[22] = *(void *)(v1 + v2);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[23] = v3;
  void *v3 = v0;
  v3[1] = sub_23EBB731C;
  uint64_t v4 = v0[20];
  return MEMORY[0x270F29700](v4, 1);
}

uint64_t sub_23EBB731C()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_23EBB7778;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_23EBB7438;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23EBB7438()
{
  v33 = v0;
  if (qword_268C119D0 != -1) {
    swift_once();
  }
  Class super_class = v0[9].super_class;
  id receiver = v0[10].receiver;
  id v3 = v0[7].receiver;
  Class v4 = v0[7].super_class;
  uint64_t v5 = sub_23EBBB2A0();
  __swift_project_value_buffer(v5, (uint64_t)qword_268C11AE8);
  v31 = (void (*)(Class, id, id))*((void *)v4 + 2);
  v31(super_class, receiver, v3);
  uint64_t v6 = sub_23EBBB280();
  os_log_type_t v7 = sub_23EBBB310();
  BOOL v8 = os_log_type_enabled(v6, v7);
  Class v9 = v0[9].super_class;
  id v10 = v0[7].receiver;
  Class v11 = v0[7].super_class;
  if (v8)
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v32 = v30;
    *(_DWORD *)id v12 = 136315138;
    sub_23EBBA4AC();
    uint64_t v13 = sub_23EBBB380();
    v0[4].Class super_class = (Class)sub_23EBB9E54(v13, v14, &v32);
    sub_23EBBB320();
    swift_bridgeObjectRelease();
    id v15 = (void (*)(Class, id))*((void *)v11 + 1);
    v15(v9, v10);
    _os_log_impl(&dword_23EB5C000, v6, v7, "Successfully got active location sharing device: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ED0D920](v30, -1, -1);
    MEMORY[0x23ED0D920](v12, -1, -1);
  }
  else
  {
    id v15 = (void (*)(Class, id))*((void *)v11 + 1);
    v15(v0[9].super_class, v0[7].receiver);
  }

  id v16 = v0[10].receiver;
  v17 = (objc_class *)v0[9].receiver;
  id v18 = v0[7].receiver;
  v31(v17, v16, v18);
  v19 = (objc_class *)type metadata accessor for HDSFMLDevice();
  v20 = objc_allocWithZone(v19);
  uint64_t v21 = sub_23EBBB210();
  v22 = (uint64_t *)&v20[OBJC_IVAR____TtC15HomeDeviceSetup12HDSFMLDevice_identifier];
  uint64_t *v22 = v21;
  v22[1] = v23;
  uint64_t v24 = sub_23EBBB200();
  v25 = (uint64_t *)&v20[OBJC_IVAR____TtC15HomeDeviceSetup12HDSFMLDevice_deviceName];
  uint64_t *v25 = v24;
  v25[1] = v26;
  v20[OBJC_IVAR____TtC15HomeDeviceSetup12HDSFMLDevice_isThisDevice] = sub_23EBBB1F0() & 1;

  v0[2].id receiver = v20;
  v0[2].Class super_class = v19;
  id v27 = objc_msgSendSuper2(v0 + 2, sel_init);
  v15(v17, v18);
  v15((Class)v16, v18);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v28 = (uint64_t (*)(id))v0->super_class;
  return v28(v27);
}

uint64_t sub_23EBB7778()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_release();
  *(void *)(v0 + 48) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C11A00);
  if (swift_dynamicCast())
  {
    if ((*(unsigned int (**)(void, void))(*(void *)(v0 + 96) + 88))(*(void *)(v0 + 104), *(void *)(v0 + 88)) == *MEMORY[0x263F3CD58])
    {

      if (qword_268C119D0 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_23EBBB2A0();
      *(void *)(v0 + 200) = __swift_project_value_buffer(v3, (uint64_t)qword_268C11AE8);
      Class v4 = sub_23EBBB280();
      os_log_type_t v5 = sub_23EBBB310();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_23EB5C000, v4, v5, "Error getting cached location sharing device, trying not cached.", v6, 2u);
        MEMORY[0x23ED0D920](v6, -1, -1);
      }
      uint64_t v7 = *(void *)(v0 + 168);
      uint64_t v8 = *(void *)(v0 + 80);

      *(void *)(v0 + 208) = *(void *)(v8 + v7);
      swift_retain();
      Class v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 216) = v9;
      *Class v9 = v0;
      v9[1] = sub_23EBB7B88;
      uint64_t v10 = *(void *)(v0 + 136);
      return MEMORY[0x270F29700](v10, 0);
    }
    (*(void (**)(void, void))(*(void *)(v0 + 96) + 8))(*(void *)(v0 + 104), *(void *)(v0 + 88));
  }

  if (qword_268C119D0 != -1) {
    swift_once();
  }
  Class v11 = *(void **)(v0 + 192);
  uint64_t v12 = sub_23EBBB2A0();
  __swift_project_value_buffer(v12, (uint64_t)qword_268C11AE8);
  id v13 = v11;
  unint64_t v14 = sub_23EBBB280();
  os_log_type_t v15 = sub_23EBBB300();
  BOOL v16 = os_log_type_enabled(v14, v15);
  v17 = *(void **)(v0 + 192);
  if (v16)
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    v19 = (void *)swift_slowAlloc();
    *(_DWORD *)id v18 = 138543362;
    uint64_t v20 = sub_23EBBB180();
    *(void *)(v0 + 56) = v20;
    sub_23EBBB320();
    void *v19 = v20;

    _os_log_impl(&dword_23EB5C000, v14, v15, "Error getting active location sharing device: %{public}@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C11A08);
    swift_arrayDestroy();
    MEMORY[0x23ED0D920](v19, -1, -1);
    MEMORY[0x23ED0D920](v18, -1, -1);
  }
  else
  {
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_23EBB7B88()
{
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_23EBB7F94;
  }
  else
  {
    swift_release();
    id v2 = sub_23EBB7CA4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23EBB7CA4()
{
  v28 = v0;
  uint64_t v1 = (void (*)(id, Class, id))*((void *)v0[7].super_class + 2);
  v1(v0[8].receiver, v0[8].super_class, v0[7].receiver);
  id v2 = sub_23EBBB280();
  os_log_type_t v3 = sub_23EBBB310();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v26 = v1;
    Class super_class = v0[7].super_class;
    id receiver = v0[8].receiver;
    id v24 = v0[7].receiver;
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v27 = v25;
    *(_DWORD *)uint64_t v6 = 136315138;
    sub_23EBBA4AC();
    uint64_t v7 = sub_23EBBB380();
    v0[4].id receiver = (id)sub_23EBB9E54(v7, v8, &v27);
    sub_23EBBB320();
    swift_bridgeObjectRelease();
    Class v9 = (void (*)(id, id))*((void *)super_class + 1);
    v9(receiver, v24);
    uint64_t v1 = v26;
    _os_log_impl(&dword_23EB5C000, v2, v3, "Successfully got non-cached active location sharing device: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ED0D920](v25, -1, -1);
    MEMORY[0x23ED0D920](v6, -1, -1);
  }
  else
  {
    Class v9 = (void (*)(id, id))*((void *)v0[7].super_class + 1);
    v9(v0[8].receiver, v0[7].receiver);
  }

  Class v10 = v0[8].super_class;
  id v11 = v0[9].receiver;
  id v12 = v0[7].receiver;
  v1(v11, v10, v12);
  id v13 = (objc_class *)type metadata accessor for HDSFMLDevice();
  unint64_t v14 = objc_allocWithZone(v13);
  uint64_t v15 = sub_23EBBB210();
  BOOL v16 = (uint64_t *)&v14[OBJC_IVAR____TtC15HomeDeviceSetup12HDSFMLDevice_identifier];
  *BOOL v16 = v15;
  v16[1] = v17;
  uint64_t v18 = sub_23EBBB200();
  v19 = (uint64_t *)&v14[OBJC_IVAR____TtC15HomeDeviceSetup12HDSFMLDevice_deviceName];
  uint64_t *v19 = v18;
  v19[1] = v20;
  v14[OBJC_IVAR____TtC15HomeDeviceSetup12HDSFMLDevice_isThisDevice] = sub_23EBBB1F0() & 1;

  v0[1].id receiver = v14;
  v0[1].Class super_class = v13;
  id v21 = objc_msgSendSuper2(v0 + 1, sel_init);
  v9(v11, v12);
  v9(v10, v12);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v22 = (uint64_t (*)(id))v0->super_class;
  return v22(v21);
}

uint64_t sub_23EBB7F94()
{
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_23EBB8230(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_23EBB82D8;
  return sub_23EBB710C();
}

uint64_t sub_23EBB82D8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc();

  unint64_t v8 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    Class v9 = (void *)sub_23EBBB180();

    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
    _Block_release(v8);
  }
  else
  {
    ((void (**)(void, void *, void))v8)[2](v8, a1, 0);
    _Block_release(v8);
  }
  Class v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

uint64_t sub_23EBB8478()
{
  v1[3] = v0;
  uint64_t v2 = sub_23EBBB1E0();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C11A20);
  v1[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23EBB8568, 0, 0);
}

uint64_t sub_23EBB8568()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = OBJC_IVAR____TtC15HomeDeviceSetup19FindMyLocateSession_session;
  v0[8] = OBJC_IVAR____TtC15HomeDeviceSetup19FindMyLocateSession_session;
  v0[9] = *(void *)(v1 + v2);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  void *v3 = v0;
  v3[1] = sub_23EBB8624;
  uint64_t v4 = v0[6];
  return MEMORY[0x270F296E0](v4);
}

uint64_t sub_23EBB8624()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_23EBB8DCC;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_23EBB8740;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23EBB8740()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  sub_23EBBB1D0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  uint64_t v5 = sub_23EBBB220();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5) == 1)
  {
    sub_23EBBADE4(v0[7], &qword_268C11A20);
    if (qword_268C119D0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_23EBBB2A0();
    __swift_project_value_buffer(v7, (uint64_t)qword_268C11AE8);
    unint64_t v8 = sub_23EBBB280();
    os_log_type_t v9 = sub_23EBBB300();
    if (os_log_type_enabled(v8, v9))
    {
      Class v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Class v10 = 0;
      _os_log_impl(&dword_23EB5C000, v8, v9, "Me device switch failed, no this device", v10, 2u);
      MEMORY[0x23ED0D920](v10, -1, -1);
    }

    sub_23EBBA504();
    id v11 = (void *)swift_allocError();
    *uint64_t v12 = 0;
    swift_willThrow();
    if (qword_268C119D0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v7, (uint64_t)qword_268C11AE8);
    id v13 = v11;
    id v14 = v11;
    uint64_t v15 = sub_23EBBB280();
    os_log_type_t v16 = sub_23EBBB300();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412290;
      id v19 = v11;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      v0[2] = v20;
      sub_23EBBB320();
      *uint64_t v18 = v20;

      _os_log_impl(&dword_23EB5C000, v15, v16, "Me device switch failed, %@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C11A08);
      swift_arrayDestroy();
      MEMORY[0x23ED0D920](v18, -1, -1);
      MEMORY[0x23ED0D920](v17, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    v28 = (uint64_t (*)(void))v0[1];
    return v28();
  }
  else
  {
    uint64_t v21 = v0[7];
    uint64_t v22 = v0[8];
    uint64_t v23 = v0[3];
    uint64_t v24 = sub_23EBBB210();
    uint64_t v26 = v25;
    v0[12] = v25;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v21, v5);
    v0[13] = *(void *)(v23 + v22);
    swift_retain();
    uint64_t v27 = (void *)swift_task_alloc();
    v0[14] = v27;
    *uint64_t v27 = v0;
    v27[1] = sub_23EBB8B7C;
    return MEMORY[0x270F29720](v24, v26);
  }
}

uint64_t sub_23EBB8B7C()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_23EBB8FDC;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v2 = sub_23EBB8CA0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23EBB8CA0()
{
  if (qword_268C119D0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_23EBBB2A0();
  __swift_project_value_buffer(v1, (uint64_t)qword_268C11AE8);
  uint64_t v2 = sub_23EBBB280();
  os_log_type_t v3 = sub_23EBBB310();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_23EB5C000, v2, v3, "Successfully set activeLocationSharing device to this device", v4, 2u);
    MEMORY[0x23ED0D920](v4, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_23EBB8DCC()
{
  swift_release();
  uint64_t v1 = (void *)v0[11];
  if (qword_268C119D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23EBBB2A0();
  __swift_project_value_buffer(v2, (uint64_t)qword_268C11AE8);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_23EBBB280();
  os_log_type_t v6 = sub_23EBBB300();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    unint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v10;
    sub_23EBBB320();
    *unint64_t v8 = v10;

    _os_log_impl(&dword_23EB5C000, v5, v6, "Me device switch failed, %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C11A08);
    swift_arrayDestroy();
    MEMORY[0x23ED0D920](v8, -1, -1);
    MEMORY[0x23ED0D920](v7, -1, -1);
  }
  else
  {
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  id v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_23EBB8FDC()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)v0[15];
  if (qword_268C119D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23EBBB2A0();
  __swift_project_value_buffer(v2, (uint64_t)qword_268C11AE8);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_23EBBB280();
  os_log_type_t v6 = sub_23EBBB300();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    unint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v10;
    sub_23EBBB320();
    *unint64_t v8 = v10;

    _os_log_impl(&dword_23EB5C000, v5, v6, "Me device switch failed, %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C11A08);
    swift_arrayDestroy();
    MEMORY[0x23ED0D920](v8, -1, -1);
    MEMORY[0x23ED0D920](v7, -1, -1);
  }
  else
  {
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  id v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_23EBB935C(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  id v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_23EBB9404;
  return sub_23EBB8478();
}

uint64_t sub_23EBB9404()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    unint64_t v8 = (void *)sub_23EBBB180();

    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  id v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

id FindMyLocateSession.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id FindMyLocateSession.init()()
{
  id v1 = v0;
  uint64_t v2 = sub_23EBBB190();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EBBB1A0();
  MEMORY[0x270FA5388]();
  uint64_t v6 = OBJC_IVAR____TtC15HomeDeviceSetup19FindMyLocateSession_session;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F3CD10], v2);
  uint64_t v7 = v1;
  sub_23EBBB1B0();
  sub_23EBBB260();
  swift_allocObject();
  *(void *)&v1[v6] = sub_23EBBB270();
  *(void *)&v7[OBJC_IVAR____TtC15HomeDeviceSetup19FindMyLocateSession_preferenceChangesTask] = 0;

  Session = (objc_class *)type metadata accessor for FindMyLocateSession();
  v10.id receiver = v7;
  v10.Class super_class = Session;
  return objc_msgSendSuper2(&v10, sel_init);
}

id FindMyLocateSession.__deallocating_deinit()
{
  v2.id receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for FindMyLocateSession();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23EBB993C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_23EBBB17C;
  return v6();
}

uint64_t sub_23EBB9A08(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_23EBBB17C;
  return v7();
}

uint64_t sub_23EBB9AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23EBBB2F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23EBBB2E0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_23EBBADE4(a1, &qword_268C11A50);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23EBBB2D0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23EBB9C80(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_23EBB9D5C;
  return v6(a1);
}

uint64_t sub_23EBB9D5C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_23EBB9E54(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23EBB9F28(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23EBBB0B8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_23EBBB0B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23EBB9F28(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_23EBBB330();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_23EBBA0E4(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_23EBBB350();
  if (!v8)
  {
    sub_23EBBB360();
    __break(1u);
LABEL_17:
    uint64_t result = sub_23EBBB370();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_23EBBA0E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23EBBA17C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23EBBA35C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_23EBBA35C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23EBBA17C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_23EBBA2F4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_23EBBB340();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_23EBBB360();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_23EBBB2C0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_23EBBB370();
    __break(1u);
LABEL_14:
    uint64_t result = sub_23EBBB360();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23EBBA2F4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C11AB8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  void v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23EBBA35C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C11AB8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_23EBBB370();
  __break(1u);
  return result;
}

unint64_t sub_23EBBA4AC()
{
  unint64_t result = qword_268C11A10;
  if (!qword_268C11A10)
  {
    sub_23EBBB220();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268C11A10);
  }
  return result;
}

unint64_t sub_23EBBA504()
{
  unint64_t result = qword_268C11A28;
  if (!qword_268C11A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C11A28);
  }
  return result;
}

uint64_t type metadata accessor for FindMyLocateSession()
{
  return self;
}

uint64_t method lookup function for FindMyLocateSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FindMyLocateSession);
}

uint64_t dispatch thunk of FindMyLocateSession.getActiveLocationSharingDevice()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x90);
  size_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_23EBBA698;
  return v5();
}

uint64_t sub_23EBBA698(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  unint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of FindMyLocateSession.setActiveLocationSharingDeviceToThisDevice()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x98);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_23EBBA898;
  return v5();
}

uint64_t sub_23EBBA898()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FMLSessionError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FMLSessionError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23EBBAAF8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_23EBBAB20(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23EBBAB2C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FMLSessionError()
{
  return &type metadata for FMLSessionError;
}

unint64_t sub_23EBBAB4C()
{
  unint64_t result = qword_268C11A48;
  if (!qword_268C11A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C11A48);
  }
  return result;
}

uint64_t sub_23EBBABA4()
{
  int v2 = *(const void **)(v0 + 16);
  int v3 = *(void **)(v0 + 24);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_23EBBB17C;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_268C11A58 + dword_268C11A58);
  return v5(v2, v3);
}

uint64_t sub_23EBBAC54()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unsigned int v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_23EBBB17C;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268C11A68 + dword_268C11A68);
  return v6(v2, v3, v4);
}

uint64_t sub_23EBBAD18(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unsigned int v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_23EBBB17C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268C11A78 + dword_268C11A78);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_23EBBADE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23EBBAE40()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23EBBAE78(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_23EBBB17C;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268C11A88 + dword_268C11A88);
  return v6(a1, v4);
}

uint64_t objectdestroyTm()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23EBBAF74()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_23EBBA898;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_268C11A98 + dword_268C11A98);
  return v5(v2, v3);
}

uint64_t objectdestroy_22Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_23EBBB0B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_23EBBB180()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_23EBBB190()
{
  return MEMORY[0x270F29228]();
}

uint64_t sub_23EBBB1A0()
{
  return MEMORY[0x270F29270]();
}

uint64_t sub_23EBBB1B0()
{
  return MEMORY[0x270F29280]();
}

uint64_t sub_23EBBB1C0()
{
  return MEMORY[0x270F292B8]();
}

uint64_t sub_23EBBB1D0()
{
  return MEMORY[0x270F29308]();
}

uint64_t sub_23EBBB1E0()
{
  return MEMORY[0x270F29310]();
}

uint64_t sub_23EBBB1F0()
{
  return MEMORY[0x270F29510]();
}

uint64_t sub_23EBBB200()
{
  return MEMORY[0x270F29528]();
}

uint64_t sub_23EBBB210()
{
  return MEMORY[0x270F29538]();
}

uint64_t sub_23EBBB220()
{
  return MEMORY[0x270F29568]();
}

uint64_t sub_23EBBB260()
{
  return MEMORY[0x270F29768]();
}

uint64_t sub_23EBBB270()
{
  return MEMORY[0x270F29780]();
}

uint64_t sub_23EBBB280()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23EBBB290()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23EBBB2A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23EBBB2B0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23EBBB2C0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23EBBB2D0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_23EBBB2E0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_23EBBB2F0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_23EBBB300()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23EBBB310()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23EBBB320()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23EBBB330()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23EBBB340()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23EBBB350()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23EBBB360()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23EBBB370()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23EBBB380()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23EBBB390()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23EBBB3A0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23EBBB3B0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23EBBB3C0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23EBBB3D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23EBBB3E0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23EBBB3F0()
{
  return MEMORY[0x270F9FC90]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x270EE48D8]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x270F23D58]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x270F23D70]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x270F23D78]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x270F23D80]();
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x270EE49E0]();
}

uint64_t CFGetInt64()
{
  return MEMORY[0x270F23DC8]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

uint64_t CFPrefs_CopyTypedValue()
{
  return MEMORY[0x270F23E70]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x270F23E88]();
}

uint64_t CFPrefs_SetDouble()
{
  return MEMORY[0x270F23EA0]();
}

uint64_t CFPrefs_SetInt64()
{
  return MEMORY[0x270F23EA8]();
}

uint64_t CFPrefs_SetValue()
{
  return MEMORY[0x270F23EB0]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x270EE4F78]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t CUAddSuffixForCurrentDeviceClass()
{
  return MEMORY[0x270F23F00]();
}

uint64_t CUMainQueue()
{
  return MEMORY[0x270F23F58]();
}

uint64_t CUSetSystemName()
{
  return MEMORY[0x270F24000]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x270F24148]();
}

uint64_t FPrintF()
{
  return MEMORY[0x270F24168]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x270F24178]();
}

uint64_t GestaltCopyAnswer()
{
  return MEMORY[0x270F24180]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x270F243B8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t MAEActivateDeviceWithError()
{
  return MEMORY[0x270F4A8A0]();
}

uint64_t MAECreateActivationRequestWithError()
{
  return MEMORY[0x270F4A8B0]();
}

uint64_t MAECreateSessionRequestWithError()
{
  return MEMORY[0x270F4A8B8]();
}

uint64_t MAEGetActivationStateWithError()
{
  return MEMORY[0x270F4A8C0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x270F24490]();
}

uint64_t NSErrorNestedF()
{
  return MEMORY[0x270F244A0]();
}

uint64_t NSErrorToOSStatus()
{
  return MEMORY[0x270F244B0]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x270F244C0]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSPrintF()
{
  return MEMORY[0x270F244C8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringWithMACAddress()
{
  return MEMORY[0x270F244F0]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x270F24630]();
}

uint64_t RandomString()
{
  return MEMORY[0x270F24638]();
}

uint64_t SFDeviceIsVirtualMachine()
{
  return MEMORY[0x270F636F8]();
}

uint64_t SFDeviceModelCodeGet()
{
  return MEMORY[0x270F63700]();
}

uint64_t SFDeviceSupportsTVAudio()
{
  return MEMORY[0x270F63710]();
}

uint64_t SUControllerStringForManagerState()
{
  return MEMORY[0x270F76330]();
}

uint64_t TextSep()
{
  return MEMORY[0x270F247A0]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x270F24808]();
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x270F24828]();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x270F24838]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiManagerClientDisable()
{
  return MEMORY[0x270F4B520]();
}

uint64_t WiFiManagerClientEnable()
{
  return MEMORY[0x270F4B538]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CSCopyLocalHostnameForComputerName()
{
  return MEMORY[0x270EE8598]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

uint64_t isInternalBuild()
{
  return MEMORY[0x270EF3E60]();
}

uint64_t lockdown_connect()
{
  return MEMORY[0x270F99B20]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x270F99B50]();
}

uint64_t lockdown_set_value()
{
  return MEMORY[0x270F99B78]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t strnicmp_prefix()
{
  return MEMORY[0x270F24900]();
}

uint64_t strnicmpx()
{
  return MEMORY[0x270F24910]();
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t tzlink()
{
  return MEMORY[0x270F9BA20]();
}