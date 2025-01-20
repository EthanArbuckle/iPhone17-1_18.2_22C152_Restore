@interface BKUIUtils
+ (BOOL)containerEnrollmentStyleEnabled;
+ (id)nameForMessage:(unsigned int)a3;
+ (int64_t)activeInterfaceOrientationForView:(id)a3;
+ (void)resetScreenDimming;
+ (void)vibrateForBiometricEvent:(BOOL)a3;
+ (void)vibrateWithIntensity:(float)a3 withPattern:(id)a4;
@end

@implementation BKUIUtils

+ (id)nameForMessage:(unsigned int)a3
{
  v3 = @"No fingers enrolled";
  switch(a3)
  {
    case 0u:
      goto LABEL_47;
    case 0x33u:
      v3 = @"Matching failed";
      goto LABEL_47;
    case 0x39u:
      v3 = @"Template list not updated";
      goto LABEL_47;
    case 0x3Au:
      v3 = @"Matching stopped";
      goto LABEL_47;
    case 0x3Bu:
      v3 = @"Sensor in finger detect";
      goto LABEL_47;
    case 0x3Cu:
      v3 = @"Task paused";
      goto LABEL_47;
    case 0x3Du:
      v3 = @"Task resumed";
      goto LABEL_47;
    case 0x3Eu:
      v3 = @"Task resume failed";
      goto LABEL_47;
    case 0x3Fu:
      v3 = @"Finger on";
      goto LABEL_47;
    case 0x40u:
      v3 = @"Finger off";
      goto LABEL_47;
    case 0x41u:
      v3 = @"Enrolment complete";
      goto LABEL_47;
    case 0x42u:
      v3 = @"Enrolment canceled";
      goto LABEL_47;
    case 0x43u:
      v3 = @"Enrolment failed";
      goto LABEL_47;
    case 0x44u:
      v3 = @"Enrolment timed out";
      goto LABEL_47;
    case 0x45u:
      v3 = @"Unknown error";
      goto LABEL_47;
    case 0x46u:
      v3 = @"Image rejected";
      goto LABEL_47;
    case 0x47u:
      v3 = @"No calibration";
      goto LABEL_47;
    case 0x48u:
      v3 = @"Image ready for processing";
      goto LABEL_47;
    case 0x49u:
      v3 = @"Template list updated";
      goto LABEL_47;
    case 0x4Au:
      v3 = @"Request finger off";
      goto LABEL_47;
    case 0x4Bu:
      v3 = @"Autonomous matching started";
      goto LABEL_47;
    case 0x4Cu:
      v3 = @"Autonomous matching stopped";
      goto LABEL_47;
    case 0x4Du:
      v3 = @"Capture restart";
      goto LABEL_47;
    case 0x4Eu:
      v3 = @"Scan too short";
      goto LABEL_47;
    case 0x4Fu:
      v3 = @"Autonomous matching started by home button";
      goto LABEL_47;
    case 0x50u:
      v3 = @"Matching cancelled";
      goto LABEL_47;
    case 0x51u:
      v3 = @"Scan before first unlock";
      goto LABEL_47;
    case 0x52u:
      v3 = @"Scan in passcode lockout";
      goto LABEL_47;
    case 0x53u:
      v3 = @"Scan in biometric lockout";
      goto LABEL_47;
    case 0x54u:
      v3 = @"ESD recovery";
      goto LABEL_47;
    case 0x55u:
      v3 = @"Image rejected (unknown)";
      goto LABEL_47;
    case 0x56u:
      v3 = @"Image rejected (bad blocks)";
      goto LABEL_47;
    case 0x57u:
      v3 = @"Image rejected (ChFPN)";
      goto LABEL_47;
    case 0x58u:
      v3 = @"Image rejected (CaFPN)";
      goto LABEL_47;
    case 0x59u:
      v3 = @"Sensor idle";
      goto LABEL_47;
    case 0x5Au:
      v3 = @"Sensor capturing";
      goto LABEL_47;
    case 0x5Bu:
      v3 = @"Sensor paused";
      goto LABEL_47;
    case 0x5Cu:
      v3 = @"Scan when biometric token expired";
      goto LABEL_47;
    case 0x62u:
      v3 = @"Image rejected (Movement)";
      goto LABEL_47;
    case 0x63u:
      v3 = @"Finger detect canceled";
      goto LABEL_47;
    default:
      if (a3 - 1 <= 0x31)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Enrolment %d", *(void *)&a3, v5);
LABEL_45:
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_47;
      }
      if (a3 >= 0x64)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Progress: %d/255 = %d %%", a3 - 100, ((int)(100 * (a3 - 100)) / 255));
        goto LABEL_45;
      }
      v3 = @"Unknown status code";
LABEL_47:
      return v3;
  }
}

+ (void)resetScreenDimming
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1E4B6C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Reset screen dimming", v0, 2u);
}

+ (void)vibrateWithIntensity:(float)a3 withPattern:(id)a4
{
  id v5 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[BKUIUtils vibrateWithIntensity:withPattern:]((uint64_t)v5, a3);
  }
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v7 = a3;
  v8 = [NSNumber numberWithFloat:v7];
  [v6 setObject:v8 forKey:@"Intensity"];

  [v6 setObject:v5 forKey:@"VibePattern"];
  AudioServicesPlaySystemSoundWithVibration();
}

+ (void)vibrateForBiometricEvent:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[BKUIUtils vibrateForBiometricEvent:](v3);
  }
  if (v3) {
    id v5 = &unk_1F4094690;
  }
  else {
    id v5 = &unk_1F40946A8;
  }
  LODWORD(v4) = 1.0;
  +[BKUIUtils vibrateWithIntensity:v5 withPattern:v4];
}

+ (int64_t)activeInterfaceOrientationForView:(id)a3
{
  id v3 = a3;
  double v4 = [MEMORY[0x1E4F42738] sharedApplication];
  if ([v4 isFrontBoard])
  {

LABEL_4:
    v8 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v9 = [v8 activeInterfaceOrientation];
    goto LABEL_5;
  }
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.springboard"];

  if (v7) {
    goto LABEL_4;
  }
  v12 = [v3 window];

  if (!v12)
  {
    v8 = [MEMORY[0x1E4F42738] sharedApplication];
    v13 = [v8 windows];
    v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_0];
    v15 = [v13 filteredArrayUsingPredicate:v14];
    v16 = [v15 firstObject];
    int64_t v10 = [v16 interfaceOrientation];

    goto LABEL_6;
  }
  v8 = [v3 window];
  uint64_t v9 = [v8 interfaceOrientation];
LABEL_5:
  int64_t v10 = v9;
LABEL_6:

  return v10;
}

uint64_t __47__BKUIUtils_activeInterfaceOrientationForView___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isKeyWindow];
}

+ (BOOL)containerEnrollmentStyleEnabled
{
  return MEMORY[0x1F415C650](a1, a2);
}

+ (void)vibrateWithIntensity:(uint64_t)a1 withPattern:(float)a2 .cold.1(uint64_t a1, float a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218242;
  double v3 = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1E4B6C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Vibrate with intensity: %f, and with pattern: %@", (uint8_t *)&v2, 0x16u);
}

+ (void)vibrateForBiometricEvent:(char)a1 .cold.1(char a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1 & 1;
  _os_log_debug_impl(&dword_1E4B6C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Vibrate for good biometric event: %i", (uint8_t *)v1, 8u);
}

@end