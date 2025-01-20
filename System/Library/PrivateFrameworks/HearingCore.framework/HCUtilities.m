@interface HCUtilities
+ (BOOL)currentProcessIsAXUIServer;
+ (BOOL)currentProcessIsCarousel;
+ (BOOL)currentProcessIsHealth;
+ (BOOL)currentProcessIsHeard;
+ (BOOL)currentProcessIsInCallService;
+ (BOOL)currentProcessIsPreferences;
+ (BOOL)currentProcessIsRTTExternsion;
+ (BOOL)currentProcessIsSpringBoard;
+ (BOOL)currentProcessIsSystemApp;
+ (BOOL)deviceHasHomeButton;
+ (BOOL)deviceIsBigPhone;
+ (BOOL)deviceIsMultiUser;
+ (BOOL)deviceIsPad;
+ (BOOL)deviceIsPhone;
+ (BOOL)deviceIsPod;
+ (BOOL)deviceIsSmallPhone;
+ (BOOL)deviceIsWatch;
+ (BOOL)isInternalInstall;
+ (BOOL)isProtectedDataAvailable;
+ (BOOL)supportsAlwaysListening;
+ (BOOL)supportsLEA2;
+ (BOOL)watchSupportsPairingHearingAids;
+ (double)roundToPercentageValue:(double)a3;
+ (id)bluetoothManagerQueue;
+ (id)messagePayloadFromDictionary:(id)a3 andIdentifier:(unint64_t)a4;
+ (int64_t)systemBootTime;
@end

@implementation HCUtilities

+ (BOOL)deviceIsPod
{
  if (HCDeviceGetType__AXCurrentDeviceTypeOnceToken != -1) {
    dispatch_once(&HCDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_33_0);
  }
  return HCDeviceGetType__HCDeviceType == 2;
}

+ (BOOL)deviceIsPad
{
  if (HCDeviceGetType__AXCurrentDeviceTypeOnceToken != -1) {
    dispatch_once(&HCDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_33_0);
  }
  return HCDeviceGetType__HCDeviceType == 3;
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall__AXIsInternalInstallOnceToken != -1) {
    dispatch_once(&isInternalInstall__AXIsInternalInstallOnceToken, &__block_literal_global_40);
  }
  return isInternalInstall__AXIsInternalInstall;
}

+ (id)messagePayloadFromDictionary:(id)a3 andIdentifier:(unint64_t)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5 && [v5 count])
  {
    v10[0] = @"axha_messageID";
    v7 = [NSNumber numberWithUnsignedLongLong:a4];
    v10[1] = @"axha_payload";
    v11[0] = v7;
    v11[1] = v6;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __32__HCUtilities_isInternalInstall__block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  isInternalInstall__AXIsInternalInstall = result;
  return result;
}

+ (id)bluetoothManagerQueue
{
  if (bluetoothManagerQueue_token != -1) {
    dispatch_once(&bluetoothManagerQueue_token, &__block_literal_global_43);
  }
  v2 = (void *)bluetoothManagerQueue_BluetoothQueue;
  return v2;
}

void __36__HCUtilities_bluetoothManagerQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("hearing_bluetooth_manager_queue", v2);
  v1 = (void *)bluetoothManagerQueue_BluetoothQueue;
  bluetoothManagerQueue_BluetoothQueue = (uint64_t)v0;
}

+ (BOOL)currentProcessIsHeard
{
  if (currentProcessIsHeard_token != -1) {
    dispatch_once(&currentProcessIsHeard_token, &__block_literal_global_46);
  }
  return currentProcessIsHeard__AXIsProcess;
}

void __36__HCUtilities_currentProcessIsHeard__block_invoke()
{
  dispatch_queue_t v0 = HCProcessGetName();
  int v1 = [v0 isEqualToString:@"heard"];

  if (v1) {
    currentProcessIsHeard__AXIsProcess = 1;
  }
}

+ (BOOL)currentProcessIsPreferences
{
  if (currentProcessIsPreferences_token != -1) {
    dispatch_once(&currentProcessIsPreferences_token, &__block_literal_global_48);
  }
  return currentProcessIsPreferences__AXIsProcess;
}

void __42__HCUtilities_currentProcessIsPreferences__block_invoke()
{
  dispatch_queue_t v0 = HCApplicationGetMainBundleIdentifier();
  int v1 = [v0 isEqualToString:@"com.apple.Preferences"];

  if (v1) {
    currentProcessIsPreferences__AXIsProcess = 1;
  }
}

+ (BOOL)currentProcessIsAXUIServer
{
  if (currentProcessIsAXUIServer_token != -1) {
    dispatch_once(&currentProcessIsAXUIServer_token, &__block_literal_global_50);
  }
  return currentProcessIsAXUIServer__AXIsProcess;
}

void __41__HCUtilities_currentProcessIsAXUIServer__block_invoke()
{
  HCApplicationGetMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  if (([v0 isEqualToString:@"com.apple.accessibility.AccessibilityUIServer"] & 1) != 0
    || [v0 isEqualToString:@"com.apple.AccessibilityUIServer"])
  {
    currentProcessIsAXUIServer__AXIsProcess = 1;
  }
}

+ (BOOL)currentProcessIsSpringBoard
{
  if (currentProcessIsSpringBoard_token != -1) {
    dispatch_once(&currentProcessIsSpringBoard_token, &__block_literal_global_52);
  }
  return currentProcessIsSpringBoard__AXIsProcess;
}

void __42__HCUtilities_currentProcessIsSpringBoard__block_invoke()
{
  id v0 = HCApplicationGetMainBundleIdentifier();
  int v1 = [v0 isEqualToString:@"com.apple.springboard"];

  if (v1) {
    currentProcessIsSpringBoard__AXIsProcess = 1;
  }
}

+ (BOOL)currentProcessIsCarousel
{
  if (currentProcessIsCarousel_token != -1) {
    dispatch_once(&currentProcessIsCarousel_token, &__block_literal_global_54);
  }
  return currentProcessIsCarousel__AXIsProcess;
}

void __39__HCUtilities_currentProcessIsCarousel__block_invoke()
{
  id v0 = HCApplicationGetMainBundleIdentifier();
  int v1 = [v0 isEqualToString:@"com.apple.Carousel"];

  if (v1) {
    currentProcessIsCarousel__AXIsProcess = 1;
  }
}

+ (BOOL)currentProcessIsSystemApp
{
  if (currentProcessIsSystemApp_token != -1) {
    dispatch_once(&currentProcessIsSystemApp_token, &__block_literal_global_56);
  }
  return currentProcessIsSystemApp__AXIsProcess;
}

BOOL __40__HCUtilities_currentProcessIsSystemApp__block_invoke()
{
  BOOL result = +[HCUtilities currentProcessIsSpringBoard]
        || +[HCUtilities currentProcessIsCarousel];
  currentProcessIsSystemApp__AXIsProcess = result;
  return result;
}

+ (BOOL)currentProcessIsRTTExternsion
{
  if (currentProcessIsRTTExternsion_onceToken != -1) {
    dispatch_once(&currentProcessIsRTTExternsion_onceToken, &__block_literal_global_59);
  }
  return currentProcessIsRTTExternsion_AXIsRTTNotificationContentExtension;
}

void __44__HCUtilities_currentProcessIsRTTExternsion__block_invoke()
{
  HCApplicationGetMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  currentProcessIsRTTExternsion_AXIsRTTNotificationContentExtension = [v0 isEqualToString:@"com.apple.accessibility.RTTUI.RTTNotifications"];
}

+ (BOOL)currentProcessIsInCallService
{
  if (currentProcessIsInCallService_onceToken != -1) {
    dispatch_once(&currentProcessIsInCallService_onceToken, &__block_literal_global_61);
  }
  return currentProcessIsInCallService_AXIsInCallService;
}

void __44__HCUtilities_currentProcessIsInCallService__block_invoke()
{
  HCApplicationGetMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  currentProcessIsInCallService_AXIsInCallService = [v0 isEqualToString:@"com.apple.InCallService"];
}

+ (BOOL)currentProcessIsHealth
{
  if (currentProcessIsHealth_token != -1) {
    dispatch_once(&currentProcessIsHealth_token, &__block_literal_global_63);
  }
  return currentProcessIsHealth__AXIsProcess;
}

void __37__HCUtilities_currentProcessIsHealth__block_invoke()
{
  id v0 = HCApplicationGetMainBundleIdentifier();
  int v1 = [v0 isEqualToString:@"com.apple.Health"];

  if (v1) {
    currentProcessIsHealth__AXIsProcess = 1;
  }
}

+ (BOOL)deviceIsMultiUser
{
  v2 = (void *)MKBUserTypeDeviceMode();
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F78100]];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F78108]];

  return v4;
}

+ (BOOL)deviceIsSmallPhone
{
  if (deviceIsSmallPhone_onceToken != -1) {
    dispatch_once(&deviceIsSmallPhone_onceToken, &__block_literal_global_72);
  }
  return deviceIsSmallPhone_deviceIsSmallPhone;
}

uint64_t __33__HCUtilities_deviceIsSmallPhone__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  deviceIsSmallPhone_deviceIsSmallPhone = ((result + 1) < 7) & (0x4Du >> (result + 1));
  return result;
}

+ (BOOL)deviceIsBigPhone
{
  if (deviceIsBigPhone_onceToken != -1) {
    dispatch_once(&deviceIsBigPhone_onceToken, &__block_literal_global_77);
  }
  return deviceIsBigPhone_deviceIsBigPhone;
}

uint64_t __31__HCUtilities_deviceIsBigPhone__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  deviceIsBigPhone_deviceIsBigPhone = ((result + 1) < 0x11) & (0x10401u >> (result + 1));
  return result;
}

+ (BOOL)watchSupportsPairingHearingAids
{
  return +[HCUtilities supportsLEA2];
}

+ (BOOL)supportsAlwaysListening
{
  if (supportsAlwaysListening_onceToken != -1) {
    dispatch_once(&supportsAlwaysListening_onceToken, &__block_literal_global_79);
  }
  return supportsAlwaysListening_supportsAlwaysListening;
}

uint64_t __38__HCUtilities_supportsAlwaysListening__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  supportsAlwaysListening_supportsAlwaysListening = result;
  return result;
}

+ (BOOL)supportsLEA2
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (supportsLEA2_onceToken != -1) {
    dispatch_once(&supportsLEA2_onceToken, &__block_literal_global_84);
  }
  HAInitializeLogging();
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"This device support LEA 2.0 hearing aids: %hhd", supportsLEA2_SupportsLEA2);
  v3 = [NSString stringWithFormat:@"%s:%d %@", "+[HCUtilities supportsLEA2]", 400, v2];
  char v4 = (void *)HAEngineeringLog;
  if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v5 UTF8String];
    _os_log_impl(&dword_1B8AF3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  return supportsLEA2_SupportsLEA2;
}

void __27__HCUtilities_supportsLEA2__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1BD30] controllerInfoAndReturnError:0];
  supportsLEA2_SupportsLEA2 = [v0 leaVersion] == 2;
}

+ (int64_t)systemBootTime
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t result = systemBootTime___boottime;
  if (!systemBootTime___boottime)
  {
    int v6 = 0;
    v4[1] = 0;
    *(void *)id v5 = 0x1500000001;
    size_t v3 = 16;
    v4[0] = 0;
    if (sysctl(v5, 2u, v4, &v3, 0, 0) == -1) {
      int64_t result = 0;
    }
    else {
      int64_t result = v4[0];
    }
    systemBootTime___boottime = result;
  }
  return result;
}

+ (BOOL)deviceIsPhone
{
  if (HCDeviceGetType__AXCurrentDeviceTypeOnceToken != -1) {
    dispatch_once(&HCDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_33_0);
  }
  return HCDeviceGetType__HCDeviceType == 1;
}

+ (BOOL)deviceIsWatch
{
  if (HCDeviceGetType__AXCurrentDeviceTypeOnceToken != -1) {
    dispatch_once(&HCDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_33_0);
  }
  return HCDeviceGetType__HCDeviceType == 5;
}

+ (BOOL)deviceHasHomeButton
{
  if (deviceHasHomeButton_onceToken != -1) {
    dispatch_once(&deviceHasHomeButton_onceToken, &__block_literal_global_90);
  }
  return deviceHasHomeButton_hasHomeButton;
}

uint64_t __34__HCUtilities_deviceHasHomeButton__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  deviceHasHomeButton_hasHomeButton = result != 2;
  return result;
}

+ (BOOL)isProtectedDataAvailable
{
  return MKBUserUnlockedSinceBoot() != 0;
}

+ (double)roundToPercentageValue:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (a3 >= 1.0) {
    double v3 = 100.0;
  }
  else {
    double v3 = a3 * 100.0;
  }
  return (double)(int)llround(v3) / 100.0;
}

@end