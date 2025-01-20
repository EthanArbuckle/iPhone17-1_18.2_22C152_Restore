@interface CSLockScreenPearlSettings
+ (id)settingsControllerModule;
- ($20D0CF0D87A8AD096D8C820DF2D4BB3C)proudLockControllerViewControllerConfiguration;
- (BOOL)coachingDelaysUnlock;
- (BOOL)overrideCoachingConditionEnabled;
- (BOOL)pearlDebugUIEnabled;
- (BOOL)showScanningStateDuringFaceDetect;
- (BOOL)showScanningStateOnLockScreen;
- (BOOL)spinBeforeCoaching;
- (CSLockScreenBiometricFailureSettings)failureSettings;
- (double)durationOnCameraCoveredGlyphBeforeCoaching;
- (double)durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard;
- (double)durationToSuppressCameraCoveredWhenWakingWithSmartCover;
- (double)minimumDurationBeforeShowingScanningState;
- (double)minimumDurationBetweenLeavingCoachingAndCoaching;
- (double)minimumDurationShowingCoaching;
- (double)systemApertureDismissDelayAuth;
- (double)systemApertureDismissDelayDismissal;
- (unint64_t)overrideCoachingBiometricEvent;
- (void)setCoachingDelaysUnlock:(BOOL)a3;
- (void)setDefaultValues;
- (void)setDurationOnCameraCoveredGlyphBeforeCoaching:(double)a3;
- (void)setDurationToSuppressCameraCoveredWhenWakingWithMagicKeyboard:(double)a3;
- (void)setDurationToSuppressCameraCoveredWhenWakingWithSmartCover:(double)a3;
- (void)setFailureSettings:(id)a3;
- (void)setMinimumDurationBeforeShowingScanningState:(double)a3;
- (void)setMinimumDurationBetweenLeavingCoachingAndCoaching:(double)a3;
- (void)setMinimumDurationShowingCoaching:(double)a3;
- (void)setOverrideCoachingBiometricEvent:(unint64_t)a3;
- (void)setOverrideCoachingConditionEnabled:(BOOL)a3;
- (void)setPearlDebugUIEnabled:(BOOL)a3;
- (void)setShowScanningStateDuringFaceDetect:(BOOL)a3;
- (void)setShowScanningStateOnLockScreen:(BOOL)a3;
- (void)setSpinBeforeCoaching:(BOOL)a3;
- (void)setSystemApertureDismissDelayAuth:(double)a3;
- (void)setSystemApertureDismissDelayDismissal:(double)a3;
@end

@implementation CSLockScreenPearlSettings

- (void)setDefaultValues
{
  [(CSLockScreenPearlSettings *)self setPearlDebugUIEnabled:0];
  v3 = [(CSLockScreenPearlSettings *)self failureSettings];
  [v3 setJiggleLock:1];

  v4 = [(CSLockScreenPearlSettings *)self failureSettings];
  [v4 setVibrate:1];

  v5 = [(CSLockScreenPearlSettings *)self failureSettings];
  [v5 setShowPasscode:0];

  v6 = [(CSLockScreenPearlSettings *)self failureSettings];
  [v6 setWaitUntilButtonUp:0];

  SBUIProudLockContainerViewControllerConfigurationDefault();
  [(CSLockScreenPearlSettings *)self setShowScanningStateOnLockScreen:0];
  [(CSLockScreenPearlSettings *)self setShowScanningStateDuringFaceDetect:0];
  [(CSLockScreenPearlSettings *)self setMinimumDurationBeforeShowingScanningState:0.0];
  [(CSLockScreenPearlSettings *)self setMinimumDurationBetweenLeavingCoachingAndCoaching:0.0];
  [(CSLockScreenPearlSettings *)self setMinimumDurationShowingCoaching:0.0];
  [(CSLockScreenPearlSettings *)self setDurationOnCameraCoveredGlyphBeforeCoaching:0.0];
  [(CSLockScreenPearlSettings *)self setCoachingDelaysUnlock:0];
  [(CSLockScreenPearlSettings *)self setSpinBeforeCoaching:0];
  [(CSLockScreenPearlSettings *)self setDurationToSuppressCameraCoveredWhenWakingWithSmartCover:0.0];
  [(CSLockScreenPearlSettings *)self setDurationToSuppressCameraCoveredWhenWakingWithMagicKeyboard:0.0];
  [(CSLockScreenPearlSettings *)self setSystemApertureDismissDelayAuth:0.35];
  [(CSLockScreenPearlSettings *)self setSystemApertureDismissDelayDismissal:0.25];
}

+ (id)settingsControllerModule
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v39 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Pearl Debug UI" valueKeyPath:@"pearlDebugUIEnabled"];
  v2 = (void *)MEMORY[0x1E4F94160];
  v44[0] = v39;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  v37 = [v2 sectionWithRows:v3 title:@"Debug UI"];

  v38 = [MEMORY[0x1E4F94130] rowWithTitle:@"Failure Settings" childSettingsKeyPath:@"failureSettings"];
  v4 = (void *)MEMORY[0x1E4F94160];
  v43 = v38;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v32 = [v4 sectionWithRows:v5 title:@"Feedbacks"];

  v36 = [MEMORY[0x1E4F941C0] rowWithTitle:@"Show Scanning On LockScreen" valueKeyPath:@"showScanningStateOnLockScreen"];
  v35 = [MEMORY[0x1E4F941C0] rowWithTitle:@"Show Scanning During Face Detect" valueKeyPath:@"showScanningStateDuringFaceDetect"];
  v34 = [MEMORY[0x1E4F941C0] rowWithTitle:@"Coaching Delays Unlock" valueKeyPath:@"coachingDelaysUnlock"];
  v33 = [MEMORY[0x1E4F941C0] rowWithTitle:@"Spin Before Coaching" valueKeyPath:@"spinBeforeCoaching"];
  v6 = (void *)MEMORY[0x1E4F941A8];
  v42[0] = v36;
  v42[1] = v35;
  v42[2] = v34;
  v42[3] = v33;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  v31 = [v6 sectionWithRows:v7 title:@"Feedback"];

  v8 = [MEMORY[0x1E4F94148] rowWithTitle:@"Jindo Dismissal Delay" valueKeyPath:@"systemApertureDismissDelayDismissal"];
  v30 = [v8 between:0.0 and:2.0];

  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Jindo Auth Delay" valueKeyPath:@"systemApertureDismissDelayAuth"];
  v29 = [v9 between:0.0 and:2.0];

  v10 = [MEMORY[0x1E4F94148] rowWithTitle:@"Before Show Scanning" valueKeyPath:@"minimumDurationBeforeShowingScanningState"];
  v28 = [v10 between:0.0 and:10.0];

  v11 = [MEMORY[0x1E4F94148] rowWithTitle:@"Between Leaving and Coaching" valueKeyPath:@"minimumDurationBetweenLeavingCoachingAndCoaching"];
  v27 = [v11 between:0.0 and:10.0];

  v12 = [MEMORY[0x1E4F94148] rowWithTitle:@"Showing Coaching" valueKeyPath:@"minimumDurationShowingCoaching"];
  v26 = [v12 between:0.0 and:10.0];

  v13 = [MEMORY[0x1E4F94148] rowWithTitle:@"Camera Covered Glyph" valueKeyPath:@"durationOnCameraCoveredGlyphBeforeCoaching"];
  v14 = [v13 between:0.0 and:10.0];

  v15 = [MEMORY[0x1E4F94148] rowWithTitle:@"Suppress Camera Covered (Smart Cover)" valueKeyPath:@"durationToSuppressCameraCoveredWhenWakingWithSmartCover"];
  v16 = [v15 between:0.0 and:10.0];

  v17 = [MEMORY[0x1E4F94148] rowWithTitle:@"Suppress Camera Covered (Magic Keyboard)" valueKeyPath:@"durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard"];
  v18 = [v17 between:0.0 and:10.0];

  v19 = (void *)MEMORY[0x1E4F941A8];
  v41[0] = v30;
  v41[1] = v29;
  v41[2] = v28;
  v41[3] = v27;
  v41[4] = v26;
  v41[5] = v14;
  v41[6] = v16;
  v41[7] = v18;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:8];
  v21 = [v19 sectionWithRows:v20 title:@"Minimum Durations"];

  v22 = (void *)MEMORY[0x1E4F94160];
  v40[0] = v37;
  v40[1] = v32;
  v40[2] = v31;
  v40[3] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
  v24 = [v22 moduleWithTitle:@"Pearl Settings" contents:v23];

  return v24;
}

- ($20D0CF0D87A8AD096D8C820DF2D4BB3C)proudLockControllerViewControllerConfiguration
{
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var0 = [(CSLockScreenPearlSettings *)self showScanningStateOnLockScreen];
  retstr->var1 = [(CSLockScreenPearlSettings *)self showScanningStateDuringFaceDetect];
  [(CSLockScreenPearlSettings *)self minimumDurationBeforeShowingScanningState];
  retstr->var2 = v5;
  retstr->var3 = 1;
  [(CSLockScreenPearlSettings *)self minimumDurationBetweenLeavingCoachingAndCoaching];
  retstr->var4 = v6;
  [(CSLockScreenPearlSettings *)self minimumDurationShowingCoaching];
  retstr->var5 = v7;
  [(CSLockScreenPearlSettings *)self durationOnCameraCoveredGlyphBeforeCoaching];
  retstr->var6 = v8;
  retstr->var9 = [(CSLockScreenPearlSettings *)self coachingDelaysUnlock];
  retstr->var10 = 0;
  retstr->var11 = [(CSLockScreenPearlSettings *)self spinBeforeCoaching];
  [(CSLockScreenPearlSettings *)self durationToSuppressCameraCoveredWhenWakingWithSmartCover];
  retstr->var7 = v9;
  result = ($20D0CF0D87A8AD096D8C820DF2D4BB3C *)[(CSLockScreenPearlSettings *)self durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard];
  retstr->var8 = v11;
  retstr->var12 = 0;
  return result;
}

- (BOOL)pearlDebugUIEnabled
{
  return self->_pearlDebugUIEnabled;
}

- (void)setPearlDebugUIEnabled:(BOOL)a3
{
  self->_pearlDebugUIEnabled = a3;
}

- (CSLockScreenBiometricFailureSettings)failureSettings
{
  return self->_failureSettings;
}

- (void)setFailureSettings:(id)a3
{
}

- (BOOL)showScanningStateOnLockScreen
{
  return self->_showScanningStateOnLockScreen;
}

- (void)setShowScanningStateOnLockScreen:(BOOL)a3
{
  self->_showScanningStateOnLockScreen = a3;
}

- (BOOL)showScanningStateDuringFaceDetect
{
  return self->_showScanningStateDuringFaceDetect;
}

- (void)setShowScanningStateDuringFaceDetect:(BOOL)a3
{
  self->_showScanningStateDuringFaceDetect = a3;
}

- (double)minimumDurationBeforeShowingScanningState
{
  return self->_minimumDurationBeforeShowingScanningState;
}

- (void)setMinimumDurationBeforeShowingScanningState:(double)a3
{
  self->_minimumDurationBeforeShowingScanningState = a3;
}

- (double)minimumDurationBetweenLeavingCoachingAndCoaching
{
  return self->_minimumDurationBetweenLeavingCoachingAndCoaching;
}

- (void)setMinimumDurationBetweenLeavingCoachingAndCoaching:(double)a3
{
  self->_minimumDurationBetweenLeavingCoachingAndCoaching = a3;
}

- (double)minimumDurationShowingCoaching
{
  return self->_minimumDurationShowingCoaching;
}

- (void)setMinimumDurationShowingCoaching:(double)a3
{
  self->_minimumDurationShowingCoaching = a3;
}

- (double)durationOnCameraCoveredGlyphBeforeCoaching
{
  return self->_durationOnCameraCoveredGlyphBeforeCoaching;
}

- (void)setDurationOnCameraCoveredGlyphBeforeCoaching:(double)a3
{
  self->_durationOnCameraCoveredGlyphBeforeCoaching = a3;
}

- (double)durationToSuppressCameraCoveredWhenWakingWithSmartCover
{
  return self->_durationToSuppressCameraCoveredWhenWakingWithSmartCover;
}

- (void)setDurationToSuppressCameraCoveredWhenWakingWithSmartCover:(double)a3
{
  self->_durationToSuppressCameraCoveredWhenWakingWithSmartCover = a3;
}

- (double)durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard
{
  return self->_durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard;
}

- (void)setDurationToSuppressCameraCoveredWhenWakingWithMagicKeyboard:(double)a3
{
  self->_durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard = a3;
}

- (BOOL)coachingDelaysUnlock
{
  return self->_coachingDelaysUnlock;
}

- (void)setCoachingDelaysUnlock:(BOOL)a3
{
  self->_coachingDelaysUnlock = a3;
}

- (BOOL)spinBeforeCoaching
{
  return self->_spinBeforeCoaching;
}

- (void)setSpinBeforeCoaching:(BOOL)a3
{
  self->_spinBeforeCoaching = a3;
}

- (BOOL)overrideCoachingConditionEnabled
{
  return self->_overrideCoachingConditionEnabled;
}

- (void)setOverrideCoachingConditionEnabled:(BOOL)a3
{
  self->_overrideCoachingConditionEnabled = a3;
}

- (unint64_t)overrideCoachingBiometricEvent
{
  return self->_overrideCoachingBiometricEvent;
}

- (void)setOverrideCoachingBiometricEvent:(unint64_t)a3
{
  self->_overrideCoachingBiometricEvent = a3;
}

- (double)systemApertureDismissDelayDismissal
{
  return self->_systemApertureDismissDelayDismissal;
}

- (void)setSystemApertureDismissDelayDismissal:(double)a3
{
  self->_systemApertureDismissDelayDismissal = a3;
}

- (double)systemApertureDismissDelayAuth
{
  return self->_systemApertureDismissDelayAuth;
}

- (void)setSystemApertureDismissDelayAuth:(double)a3
{
  self->_systemApertureDismissDelayAuth = a3;
}

- (void).cxx_destruct
{
}

@end