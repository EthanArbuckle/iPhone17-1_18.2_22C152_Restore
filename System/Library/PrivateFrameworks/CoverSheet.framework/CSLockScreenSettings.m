@interface CSLockScreenSettings
+ (id)settingsControllerModule;
- (BOOL)alwaysEnableUserRequestedErase;
- (BOOL)alwaysPutPluginsBelowScrollView;
- (BOOL)autoDismissUnlockedLockScreen;
- (BOOL)killsInsecureDrawingApps;
- (BOOL)prelaunchesCameraAppOnSwipe;
- (BOOL)prelaunchesCameraAppOnTap;
- (BOOL)prewarmsCameraHardwareOnSwipe;
- (BOOL)prewarmsCameraHardwareOnTap;
- (BOOL)showBlockedUI;
- (BOOL)showEmergencyDialer;
- (BOOL)showLogoutButton;
- (BOOL)showNowPlaying;
- (BOOL)showRawErrorCodes;
- (BOOL)showRegionsDebugView;
- (BOOL)showResetRestore;
- (BOOL)showThermalTrap;
- (BOOL)showUserPicture;
- (CSBounceSettings)horizontalBounceSettings;
- (CSBounceSettings)verticalBounceSettings;
- (CSCameraExtensionSettings)cameraExtensionSettings;
- (CSCoverSheetDismissGestureSettings)coverSheetDismissGestureSettings;
- (CSCoverSheetTransitionsSettings)coverSheetTransitionsSettings;
- (CSDashBoardNotificationVersusPagingScrollSettings)dashBoardNotificationScrollSettings;
- (CSDashBoardQuickActionsButtonSettings)dashBoardQuickActionButtonSettings;
- (CSDashBoardRemoteContentSettings)dashBoardRemoteContentSettings;
- (CSDashBoardScrollModifierSettings)dashBoardScrollModifierSettings;
- (CSFocusSettings)focusSettings;
- (CSHorizontalScrollFailureRecognizerSettings)horizontalScrollFailureRecognizerSettings;
- (CSLockScreenChargingSettings)chargingSettings;
- (CSLockScreenIdleTimerSettings)idleTimerSettings;
- (CSLockScreenMesaSettings)mesaSettings;
- (CSLockScreenPasscodeSettings)passcodeSettings;
- (CSLockScreenPearlSettings)pearlSettings;
- (CSLockScreenTestPluginSettings)testPluginSettings;
- (CSLookSettings)lookSettings;
- (CSVibrancySettings)vibrancySettings;
- (PTOutlet)addNotificationOutlet;
- (SBFAnimationSettings)unlockToPhoneWallpaperInSettings;
- (SBFAnimationSettings)unlockToPhoneWallpaperOutSettings;
- (SBFAnimationSettings)unlockWallpaperInSettings;
- (SBFAnimationSettings)unlockWallpaperOutSettings;
- (double)appGrabberSlideUpVelocityThreshold;
- (double)cameraPrelaunchThresholdOnSwipe;
- (double)cameraPrewarmAutoCancelTimeInterval;
- (double)cameraPrewarmDebounceTimeInterval;
- (double)cameraPrewarmThresholdOnSwipe;
- (double)lockJiggleAnimationDelay;
- (double)lockJiggleHapticDelay;
- (double)mainToCameraViewSlideCompletionPercentage;
- (double)mainToTodayViewSlideCompletionPercentage;
- (double)nowPlayingHeightCompact;
- (double)nowPlayingHeightExpanded;
- (double)unlockPasscodeThreshold;
- (double)unlockPasscodeThresholdForExternalDisplay;
- (double)unlockRubberBandFeedbackInterval;
- (double)unlockRubberBandThreshold;
- (double)unlockSwipeWallpaperAlpha;
- (int64_t)unlockRubberBandFeedbackIntensity;
- (void)setAddNotificationOutlet:(id)a3;
- (void)setAlwaysEnableUserRequestedErase:(BOOL)a3;
- (void)setAlwaysPutPluginsBelowScrollView:(BOOL)a3;
- (void)setAppGrabberSlideUpVelocityThreshold:(double)a3;
- (void)setAutoDismissUnlockedLockScreen:(BOOL)a3;
- (void)setCameraExtensionSettings:(id)a3;
- (void)setCameraPrelaunchThresholdOnSwipe:(double)a3;
- (void)setCameraPrewarmAutoCancelTimeInterval:(double)a3;
- (void)setCameraPrewarmDebounceTimeInterval:(double)a3;
- (void)setCameraPrewarmThresholdOnSwipe:(double)a3;
- (void)setChargingSettings:(id)a3;
- (void)setCoverSheetDismissGestureSettings:(id)a3;
- (void)setCoverSheetTransitionsSettings:(id)a3;
- (void)setDashBoardNotificationScrollSettings:(id)a3;
- (void)setDashBoardQuickActionButtonSettings:(id)a3;
- (void)setDashBoardRemoteContentSettings:(id)a3;
- (void)setDashBoardScrollModifierSettings:(id)a3;
- (void)setDefaultValues;
- (void)setFocusSettings:(id)a3;
- (void)setHorizontalBounceSettings:(id)a3;
- (void)setHorizontalScrollFailureRecognizerSettings:(id)a3;
- (void)setIdleTimerSettings:(id)a3;
- (void)setKillsInsecureDrawingApps:(BOOL)a3;
- (void)setLockJiggleAnimationDelay:(double)a3;
- (void)setLockJiggleHapticDelay:(double)a3;
- (void)setLookSettings:(id)a3;
- (void)setMainToCameraViewSlideCompletionPercentage:(double)a3;
- (void)setMainToTodayViewSlideCompletionPercentage:(double)a3;
- (void)setMesaSettings:(id)a3;
- (void)setNowPlayingHeightCompact:(double)a3;
- (void)setNowPlayingHeightExpanded:(double)a3;
- (void)setPasscodeSettings:(id)a3;
- (void)setPearlSettings:(id)a3;
- (void)setPrelaunchesCameraAppOnSwipe:(BOOL)a3;
- (void)setPrelaunchesCameraAppOnTap:(BOOL)a3;
- (void)setPrewarmsCameraHardwareOnSwipe:(BOOL)a3;
- (void)setPrewarmsCameraHardwareOnTap:(BOOL)a3;
- (void)setShowBlockedUI:(BOOL)a3;
- (void)setShowEmergencyDialer:(BOOL)a3;
- (void)setShowLogoutButton:(BOOL)a3;
- (void)setShowNowPlaying:(BOOL)a3;
- (void)setShowRawErrorCodes:(BOOL)a3;
- (void)setShowRegionsDebugView:(BOOL)a3;
- (void)setShowResetRestore:(BOOL)a3;
- (void)setShowThermalTrap:(BOOL)a3;
- (void)setShowUserPicture:(BOOL)a3;
- (void)setTestPluginSettings:(id)a3;
- (void)setUnlockPasscodeThreshold:(double)a3;
- (void)setUnlockPasscodeThresholdForExternalDisplay:(double)a3;
- (void)setUnlockRubberBandFeedbackIntensity:(int64_t)a3;
- (void)setUnlockRubberBandFeedbackInterval:(double)a3;
- (void)setUnlockRubberBandThreshold:(double)a3;
- (void)setUnlockSwipeWallpaperAlpha:(double)a3;
- (void)setUnlockToPhoneWallpaperInSettings:(id)a3;
- (void)setUnlockToPhoneWallpaperOutSettings:(id)a3;
- (void)setUnlockWallpaperInSettings:(id)a3;
- (void)setUnlockWallpaperOutSettings:(id)a3;
- (void)setVerticalBounceSettings:(id)a3;
- (void)setVibrancySettings:(id)a3;
@end

@implementation CSLockScreenSettings

- (void)setDefaultValues
{
  [(CSLockScreenPasscodeSettings *)self->_passcodeSettings setDefaultValues];
  [(CSLockScreenChargingSettings *)self->_chargingSettings setDefaultValues];
  [(CSFocusSettings *)self->_focusSettings setDefaultValues];
  [(CSLookSettings *)self->_lookSettings setDefaultValues];
  [(CSVibrancySettings *)self->_vibrancySettings setDefaultValues];
  self->_showRawErrorCodes = 0;
  self->_showNowPlaying = 0;
  self->_autoDismissUnlockedLockScreen = 0;
  self->_alwaysEnableUserRequestedErase = 0;
  [(CSBounceSettings *)self->_horizontalBounceSettings setDefaultValues];
  [(CSBounceSettings *)self->_horizontalBounceSettings setMultiplier:0.5];
  [(CSBounceSettings *)self->_verticalBounceSettings setDefaultValues];
  [(CSLockScreenMesaSettings *)self->_mesaSettings setDefaultValues];
  [(CSLockScreenPearlSettings *)self->_pearlSettings setDefaultValues];
  [(CSCoverSheetTransitionsSettings *)self->_coverSheetTransitionsSettings setDefaultValues];
  [(CSHorizontalScrollFailureRecognizerSettings *)self->_horizontalScrollFailureRecognizerSettings setDefaultValues];
  [(CSDashBoardScrollModifierSettings *)self->_dashBoardScrollModifierSettings setDefaultValues];
  [(CSCoverSheetDismissGestureSettings *)self->_coverSheetDismissGestureSettings setDefaultValues];
  [(CSDashBoardNotificationVersusPagingScrollSettings *)self->_dashBoardNotificationScrollSettings setDefaultValues];
  [(CSLockScreenIdleTimerSettings *)self->_idleTimerSettings setDefaultValues];
  [(CSCameraExtensionSettings *)self->_cameraExtensionSettings setDefaultValues];
  [(SBFAnimationSettings *)self->_unlockToPhoneWallpaperOutSettings setDefaultValues];
  [(SBFAnimationSettings *)self->_unlockToPhoneWallpaperOutSettings setDuration:0.35];
  [(SBFAnimationSettings *)self->_unlockToPhoneWallpaperOutSettings setCurve:393216];
  v3 = [(SBFAnimationSettings *)self->_unlockToPhoneWallpaperOutSettings controlPoint1Settings];
  objc_msgSend(v3, "setPointValue:", 0.6, 0.0);

  v4 = [(SBFAnimationSettings *)self->_unlockToPhoneWallpaperOutSettings controlPoint2Settings];
  objc_msgSend(v4, "setPointValue:", 1.0, 0.4);

  [(SBFAnimationSettings *)self->_unlockToPhoneWallpaperInSettings setDefaultValues];
  [(SBFAnimationSettings *)self->_unlockToPhoneWallpaperInSettings setDuration:0.35];
  [(SBFAnimationSettings *)self->_unlockToPhoneWallpaperInSettings setCurve:393216];
  v5 = [(SBFAnimationSettings *)self->_unlockToPhoneWallpaperOutSettings controlPoint1Settings];
  objc_msgSend(v5, "setPointValue:", 0.0, 0.6);

  v6 = [(SBFAnimationSettings *)self->_unlockToPhoneWallpaperOutSettings controlPoint2Settings];
  objc_msgSend(v6, "setPointValue:", 0.4, 1.0);

  [(SBFAnimationSettings *)self->_unlockWallpaperOutSettings setDefaultValues];
  [(SBFAnimationSettings *)self->_unlockWallpaperOutSettings setDuration:0.25];
  [(SBFAnimationSettings *)self->_unlockWallpaperOutSettings setCurve:393216];
  v7 = [(SBFAnimationSettings *)self->_unlockWallpaperOutSettings controlPoint1Settings];
  objc_msgSend(v7, "setPointValue:", 0.0, 1.0);

  v8 = [(SBFAnimationSettings *)self->_unlockWallpaperOutSettings controlPoint2Settings];
  objc_msgSend(v8, "setPointValue:", 0.0, 1.0);

  [(SBFAnimationSettings *)self->_unlockWallpaperInSettings setDefaultValues];
  [(SBFAnimationSettings *)self->_unlockWallpaperInSettings setAnimationType:1];
  [(SBFAnimationSettings *)self->_unlockWallpaperInSettings setMass:15.0];
  [(SBFAnimationSettings *)self->_unlockWallpaperInSettings setStiffness:600.0];
  [(SBFAnimationSettings *)self->_unlockWallpaperInSettings setDamping:700.0];
  self->_appGrabberSlideUpVelocityThreshold = 450.0;
  self->_nowPlayingHeightCompact = 282.0;
  self->_nowPlayingHeightExpanded = 336.0;
  if (__sb__runningInSpringBoard())
  {
    *(void *)&self->_mainToCameraViewSlideCompletionPercentage = qword_1D8505B80[SBFEffectiveDeviceClass() == 2];
  }
  else
  {
    v9 = [MEMORY[0x1E4F42948] currentDevice];
    *(void *)&self->_mainToCameraViewSlideCompletionPercentage = qword_1D8505B80[[v9 userInterfaceIdiom] == 1];
  }
  if (__sb__runningInSpringBoard())
  {
    int v10 = SBFEffectiveDeviceClass();
    double v11 = 0.333;
    if (v10 == 2) {
      double v11 = 0.25;
    }
    self->_mainToTodayViewSlideCompletionPercentage = v11;
  }
  else
  {
    v12 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];
    double v14 = 0.333;
    if (v13 == 1) {
      double v14 = 0.25;
    }
    self->_mainToTodayViewSlideCompletionPercentage = v14;
  }
  self->_unlockSwipeWallpaperAlpha = 0.5;
  self->_alwaysPutPluginsBelowScrollView = 0;
  self->_killsInsecureDrawingApps = 1;
  self->_unlockPasscodeThreshold = 93.0;
  self->_unlockPasscodeThresholdForExternalDisplay = 93.0;
  self->_unlockRubberBandThreshold = 93.0;
  self->_unlockRubberBandFeedbackInterval = 0.1;
  self->_unlockRubberBandFeedbackIntensity = 2;
  self->_prewarmsCameraHardwareOnSwipe = 1;
  self->_prewarmsCameraHardwareOnTap = 1;
  self->_prelaunchesCameraAppOnSwipe = 1;
  self->_prelaunchesCameraAppOnTap = 1;
  self->_cameraPrewarmThresholdOnSwipe = 0.05;
  self->_cameraPrelaunchThresholdOnSwipe = 0.05;
  self->_cameraPrewarmDebounceTimeInterval = 1.5;
  self->_cameraPrewarmAutoCancelTimeInterval = 2.0;
  self->_lockJiggleHapticDelay = 0.0;
  self->_lockJiggleAnimationDelay = 0.0;
}

+ (id)settingsControllerModule
{
  v209[1] = *MEMORY[0x1E4F143B8];
  v153 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Raw Error Codes" valueKeyPath:@"showRawErrorCodes"];
  v2 = (void *)MEMORY[0x1E4F94160];
  v209[0] = v153;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v209 count:1];
  v179 = [v2 sectionWithRows:v3 title:@"Phone Unlock with Watch"];

  v182 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Auto Dismiss Unlocked LockScreen" valueKeyPath:@"autoDismissUnlockedLockScreen"];
  v181 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Now Playing" valueKeyPath:@"showNowPlaying"];
  v4 = [MEMORY[0x1E4F941D8] row];
  v5 = [v4 valueKeyPath:@"nowPlayingHeightCompact"];
  v180 = [v5 minValue:110.0 maxValue:520.0];

  v6 = [MEMORY[0x1E4F941D8] row];
  v7 = [v6 valueKeyPath:@"nowPlayingHeightExpanded"];
  v152 = [v7 minValue:110.0 maxValue:520.0];

  v151 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show User Picture" valueKeyPath:@"showUserPicture"];
  v150 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Logout Button" valueKeyPath:@"showLogoutButton"];
  v149 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Thermal Trap" valueKeyPath:@"showThermalTrap"];
  v148 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Blocked UI" valueKeyPath:@"showBlockedUI"];
  v147 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Reset/Restore" valueKeyPath:@"showResetRestore"];
  v146 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Emergency Dialer" valueKeyPath:@"showEmergencyDialer"];
  v145 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Regions Debug" valueKeyPath:@"showRegionsDebugView"];
  v144 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always Enable User Requested Erase" valueKeyPath:@"alwaysEnableUserRequestedErase"];
  v143 = [MEMORY[0x1E4F940F8] rowWithTitle:@"Add Notification" outletKeyPath:@"addNotificationOutlet"];
  v8 = (void *)MEMORY[0x1E4F94160];
  v208[0] = v182;
  v208[1] = v181;
  v208[2] = v180;
  v208[3] = v152;
  v208[4] = v151;
  v208[5] = v150;
  v208[6] = v149;
  v208[7] = v148;
  v208[8] = v147;
  v208[9] = v146;
  v208[10] = v145;
  v208[11] = v144;
  v208[12] = v143;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v208 count:13];
  v178 = [v8 sectionWithRows:v9 title:@"Modern Lockscreen"];

  v142 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Prewarms on Swipe" valueKeyPath:@"prewarmsCameraHardwareOnSwipe"];
  v141 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Prewarms on Button" valueKeyPath:@"prewarmsCameraHardwareOnTap"];
  v140 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Prelaunches on Swipe" valueKeyPath:@"prelaunchesCameraAppOnSwipe"];
  v139 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Prelaunches on Button" valueKeyPath:@"prelaunchesCameraAppOnTap"];
  v138 = [MEMORY[0x1E4F94148] rowWithTitle:@"Camera Prewarm Backoff" valueKeyPath:@"cameraPrewarmDebounceTimeInterval"];
  v137 = [MEMORY[0x1E4F94148] rowWithTitle:@"Camera Prewarm Backoff" valueKeyPath:@"cameraPrewarmAutoCancelTimeInterval"];
  int v10 = (void *)MEMORY[0x1E4F94160];
  v207[0] = v142;
  v207[1] = v141;
  v207[2] = v140;
  v207[3] = v139;
  v207[4] = v138;
  v207[5] = v137;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v207 count:6];
  v177 = [v10 sectionWithRows:v11 title:@"Prewarm/Prelaunch"];

  v12 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Prewarm Threshold" valueKeyPath:@"cameraPrewarmThresholdOnSwipe"];
  v136 = [v12 minValue:0.0 maxValue:1.0];

  uint64_t v13 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Prelaunch Threshold" valueKeyPath:@"cameraPrelaunchThresholdOnSwipe"];
  v135 = [v13 minValue:0.0 maxValue:1.0];

  double v14 = (void *)MEMORY[0x1E4F94160];
  v206[0] = v136;
  v206[1] = v135;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v206 count:2];
  v175 = [v14 sectionWithRows:v15 title:@"Prewarm/Prelaunch Thresholds"];

  v134 = [MEMORY[0x1E4F94130] rowWithTitle:@"CoverSheet Transitions" childSettingsKeyPath:@"coverSheetTransitionsSettings"];
  v16 = (void *)MEMORY[0x1E4F94160];
  v205 = v134;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v205 count:1];
  v176 = [v16 sectionWithRows:v17];

  v133 = [MEMORY[0x1E4F94130] rowWithTitle:@"Custom Time Looks" childSettingsKeyPath:@"lookSettings"];
  v18 = (void *)MEMORY[0x1E4F94160];
  v204 = v133;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v204 count:1];
  v174 = [v18 sectionWithRows:v19];

  v132 = [MEMORY[0x1E4F94130] rowWithTitle:@"Passcode Settings" childSettingsKeyPath:@"passcodeSettings"];
  v20 = (void *)MEMORY[0x1E4F94160];
  v203 = v132;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v203 count:1];
  v173 = [v20 sectionWithRows:v21];

  v131 = [MEMORY[0x1E4F94130] rowWithTitle:@"Charging Settings" childSettingsKeyPath:@"chargingSettings"];
  v22 = (void *)MEMORY[0x1E4F94160];
  v202 = v131;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v202 count:1];
  v172 = [v22 sectionWithRows:v23];

  v130 = [MEMORY[0x1E4F94130] rowWithTitle:@"Focus Settings" childSettingsKeyPath:@"focusSettings"];
  v24 = (void *)MEMORY[0x1E4F94160];
  v201 = v130;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v201 count:1];
  v171 = [v24 sectionWithRows:v25];

  v129 = [MEMORY[0x1E4F94130] rowWithTitle:@"Vibrancy Settings" childSettingsKeyPath:@"vibrancySettings"];
  v26 = (void *)MEMORY[0x1E4F94160];
  v200 = v129;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v200 count:1];
  v170 = [v26 sectionWithRows:v27];

  v128 = [MEMORY[0x1E4F94130] rowWithTitle:@"Slide To Unlock Failure Recognizer" childSettingsKeyPath:@"horizontalScrollFailureRecognizerSettings"];
  v127 = [MEMORY[0x1E4F94130] rowWithTitle:@"DashBoard Scroll Modifier" childSettingsKeyPath:@"dashBoardScrollModifierSettings"];
  v126 = [MEMORY[0x1E4F94130] rowWithTitle:@"Notification Paging" childSettingsKeyPath:@"dashBoardNotificationScrollSettings"];
  v28 = (void *)MEMORY[0x1E4F94160];
  v199[0] = v128;
  v199[1] = v127;
  v199[2] = v126;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v199 count:3];
  v169 = [v28 sectionWithRows:v29];

  v125 = [MEMORY[0x1E4F94130] rowWithTitle:@"Quick Actions" childSettingsKeyPath:@"dashBoardQuickActionButtonSettings"];
  v124 = [MEMORY[0x1E4F94130] rowWithTitle:@"Remote Content" childSettingsKeyPath:@"dashBoardRemoteContentSettings"];
  v30 = (void *)MEMORY[0x1E4F94160];
  v198[0] = v125;
  v198[1] = v124;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v198 count:2];
  v168 = [v30 sectionWithRows:v31];

  v123 = [MEMORY[0x1E4F94130] rowWithTitle:@"Idle Timer" childSettingsKeyPath:@"idleTimerSettings"];
  v32 = (void *)MEMORY[0x1E4F94160];
  v197 = v123;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v197 count:1];
  v167 = [v32 sectionWithRows:v33];

  v122 = [MEMORY[0x1E4F94130] rowWithTitle:@"Camera Extension Settings" childSettingsKeyPath:@"cameraExtensionSettings"];
  v34 = (void *)MEMORY[0x1E4F94160];
  v196 = v122;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v196 count:1];
  v166 = [v34 sectionWithRows:v35];

  v121 = [MEMORY[0x1E4F94130] rowWithTitle:@"Mesa Settings" childSettingsKeyPath:@"mesaSettings"];
  v120 = [MEMORY[0x1E4F94130] rowWithTitle:@"Pearl Settings" childSettingsKeyPath:@"pearlSettings"];
  v36 = (void *)MEMORY[0x1E4F94160];
  v195[0] = v121;
  v195[1] = v120;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:2];
  v165 = [v36 sectionWithRows:v37];

  v38 = (void *)MEMORY[0x1E4F94160];
  v39 = [MEMORY[0x1E4F94130] rowWithTitle:@"Dismiss Gesture" childSettingsKeyPath:@"coverSheetDismissGestureSettings"];
  v194 = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v194 count:1];
  v164 = [v38 sectionWithRows:v40];

  v162 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Gravity" valueKeyPath:@"verticalBounceSettings.gravity"];
  v160 = [v162 minValue:0.0 maxValue:6.0];
  v193[0] = v160;
  v158 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Elasticity" valueKeyPath:@"verticalBounceSettings.elasticity"];
  v156 = [v158 minValue:0.0 maxValue:1.0];
  v193[1] = v156;
  v154 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Friction" valueKeyPath:@"verticalBounceSettings.friction"];
  v41 = [v154 minValue:0.0 maxValue:1.0];
  v193[2] = v41;
  v42 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Velocity" valueKeyPath:@"verticalBounceSettings.velocity"];
  v43 = [v42 minValue:0.0 maxValue:1000.0];
  v193[3] = v43;
  v44 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Minimum Velocity To Assist" valueKeyPath:@"verticalBounceSettings.minVelocityToAssist"];
  v45 = [v44 minValue:500.0 maxValue:3000.0];
  v193[4] = v45;
  v46 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Maximum Velocity To Assist" valueKeyPath:@"verticalBounceSettings.maxVelocityToAssist"];
  v47 = [v46 minValue:500.0 maxValue:3000.0];
  v193[5] = v47;
  v48 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Velocity Assistance Amount" valueKeyPath:@"verticalBounceSettings.maxVelocityAssistance"];
  v49 = [v48 minValue:0.0 maxValue:1500.0];
  v193[6] = v49;
  v116 = [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:7];

  v163 = [MEMORY[0x1E4F94160] sectionWithRows:v116 title:@"Camera Bounce Settings"];
  v50 = (void *)MEMORY[0x1E4F94160];
  v51 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Unlock To Phone Wallpaper Out" delay:0 frameRate:0];
  v161 = [v50 submoduleWithModule:v51 childSettingsKeyPath:@"unlockToPhoneWallpaperOutSettings"];

  v52 = (void *)MEMORY[0x1E4F94160];
  v53 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Unlock To Phone Wallpaper In" delay:1 frameRate:0];
  v159 = [v52 submoduleWithModule:v53 childSettingsKeyPath:@"unlockToPhoneWallpaperInSettings"];

  v54 = (void *)MEMORY[0x1E4F94160];
  v55 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Unlock Wallpaper Out" delay:0 frameRate:0];
  v157 = [v54 submoduleWithModule:v55 childSettingsKeyPath:@"unlockWallpaperOutSettings"];

  v56 = (void *)MEMORY[0x1E4F94160];
  v57 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Unlock Wallpaper In" delay:1 frameRate:0];
  v155 = [v56 submoduleWithModule:v57 childSettingsKeyPath:@"unlockWallpaperInSettings"];

  v58 = (void *)MEMORY[0x1E4F94160];
  v59 = [MEMORY[0x1E4F941D8] row];
  v60 = [v59 valueKeyPath:@"mainToCameraViewSlideCompletionPercentage"];
  v61 = [v60 minValue:0.0 maxValue:1.0];
  v192 = v61;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v192 count:1];
  v119 = [v58 sectionWithRows:v62 title:@"Main page to Camera Slide Completion Percentage"];

  v63 = (void *)MEMORY[0x1E4F94160];
  v64 = [MEMORY[0x1E4F941D8] row];
  v65 = [v64 valueKeyPath:@"mainToTodayViewSlideCompletionPercentage"];
  v66 = [v65 minValue:0.0 maxValue:1.0];
  v191 = v66;
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v191 count:1];
  v118 = [v63 sectionWithRows:v67 title:@"Main page to Today view slide Completion Percentage"];

  v68 = (void *)MEMORY[0x1E4F94160];
  v69 = [MEMORY[0x1E4F941D8] row];
  v70 = [v69 valueKeyPath:@"unlockSwipeWallpaperAlpha"];
  v71 = [v70 minValue:0.0 maxValue:1.0];
  v190 = v71;
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v190 count:1];
  v115 = [v68 sectionWithRows:v72 title:@"Unlock Swipe Wallpaper Alpha"];

  v113 = (void *)MEMORY[0x1E4F94160];
  v111 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Passcode Threshold" valueKeyPath:@"unlockPasscodeThreshold"];
  v73 = [v111 minValue:0.0 maxValue:300.0];
  v189[0] = v73;
  v74 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Passcode ThresholdForExternalDisplay" valueKeyPath:@"unlockPasscodeThresholdForExternalDisplay"];
  v75 = [v74 minValue:0.0 maxValue:300.0];
  v189[1] = v75;
  v76 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Rubber Band Range" valueKeyPath:@"unlockRubberBandThreshold"];
  v77 = [v76 minValue:0.0 maxValue:300.0];
  v189[2] = v77;
  v78 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Haptic Interval" valueKeyPath:@"unlockRubberBandFeedbackInterval"];
  v79 = [v78 minValue:0.0 maxValue:0.3];
  v189[3] = v79;
  v80 = [MEMORY[0x1E4F94108] rowWithTitle:@"Haptic Intensity" valueKeyPath:@"unlockRubberBandFeedbackIntensity"];
  v81 = [v80 possibleValues:&unk_1F306BA28 titles:&unk_1F306BA40];
  v189[4] = v81;
  v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:5];
  v114 = [v113 sectionWithRows:v82 title:@"Unlock Swipe Thresholds"];

  v83 = (void *)MEMORY[0x1E4F94160];
  v84 = [MEMORY[0x1E4F941D8] row];
  v85 = [v84 valueKeyPath:@"appGrabberSlideUpVelocityThreshold"];
  v86 = [v85 minValue:300.0 maxValue:2000.0];
  v188 = v86;
  v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v188 count:1];
  v112 = [v83 sectionWithRows:v87 title:@"App Grabber Slide Up Velocity Threshold"];

  v88 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always put plugins below scroll view" valueKeyPath:@"alwaysPutPluginsBelowScrollView"];
  v187[0] = v88;
  v89 = [MEMORY[0x1E4F94130] rowWithTitle:@"Test Plugin" childSettingsKeyPath:@"testPluginSettings"];
  v187[1] = v89;
  v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:2];

  v110 = [MEMORY[0x1E4F94160] sectionWithRows:v90 title:@"Plugins"];
  v91 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Kill Insecure Drawing Apps" valueKeyPath:@"killsInsecureDrawingApps"];
  v186 = v91;
  v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v186 count:1];

  v93 = [MEMORY[0x1E4F94160] sectionWithRows:v92 title:@"Security"];
  v94 = (void *)MEMORY[0x1E4F940F8];
  v95 = [MEMORY[0x1E4F94170] action];
  v96 = [v94 rowWithTitle:@"Restore Defaults" action:v95];
  v185 = v96;
  v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v185 count:1];

  v109 = [MEMORY[0x1E4F94160] sectionWithRows:v117];
  v97 = (void *)MEMORY[0x1E4F94160];
  v98 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Haptic Delay" valueKeyPath:@"lockJiggleHapticDelay"];
  v99 = [v98 minValue:0.0 maxValue:0.3];
  v184[0] = v99;
  v100 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Animation Delay" valueKeyPath:@"lockJiggleAnimationDelay"];
  v101 = [v100 minValue:0.0 maxValue:0.3];
  v184[1] = v101;
  v102 = [MEMORY[0x1E4F1C978] arrayWithObjects:v184 count:2];
  uint64_t v103 = [v97 sectionWithRows:v102 title:@"Lock Jiggle Timings"];

  id v107 = (id)MEMORY[0x1E4F94160];
  v183[0] = v179;
  v183[1] = v178;
  v183[2] = v176;
  v183[3] = v174;
  v183[4] = v173;
  v183[5] = v170;
  v183[6] = v172;
  v183[7] = v166;
  v183[8] = v171;
  v183[9] = v177;
  v183[10] = v175;
  v183[11] = v169;
  v183[12] = v168;
  v183[13] = v167;
  v183[14] = v165;
  v183[15] = v164;
  v183[16] = v163;
  v183[17] = v161;
  v183[18] = v159;
  v183[19] = v157;
  v183[20] = v155;
  v183[21] = v119;
  v183[22] = v118;
  v183[23] = v115;
  v183[24] = v114;
  v183[25] = v112;
  v183[26] = v103;
  v104 = (void *)v103;
  v183[27] = v110;
  v183[28] = v93;
  v183[29] = v109;
  v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v183 count:30];
  id v108 = [v107 moduleWithTitle:@"LockScreen Settings" contents:v105];

  return v108;
}

- (BOOL)showRawErrorCodes
{
  return self->_showRawErrorCodes;
}

- (void)setShowRawErrorCodes:(BOOL)a3
{
  self->_showRawErrorCodes = a3;
}

- (BOOL)autoDismissUnlockedLockScreen
{
  return self->_autoDismissUnlockedLockScreen;
}

- (void)setAutoDismissUnlockedLockScreen:(BOOL)a3
{
  self->_autoDismissUnlockedLockScreen = a3;
}

- (BOOL)showNowPlaying
{
  return self->_showNowPlaying;
}

- (void)setShowNowPlaying:(BOOL)a3
{
  self->_showNowPlaying = a3;
}

- (BOOL)showUserPicture
{
  return self->_showUserPicture;
}

- (void)setShowUserPicture:(BOOL)a3
{
  self->_showUserPicture = a3;
}

- (BOOL)showLogoutButton
{
  return self->_showLogoutButton;
}

- (void)setShowLogoutButton:(BOOL)a3
{
  self->_showLogoutButton = a3;
}

- (BOOL)showThermalTrap
{
  return self->_showThermalTrap;
}

- (void)setShowThermalTrap:(BOOL)a3
{
  self->_showThermalTrap = a3;
}

- (BOOL)showBlockedUI
{
  return self->_showBlockedUI;
}

- (void)setShowBlockedUI:(BOOL)a3
{
  self->_showBlockedUI = a3;
}

- (BOOL)showResetRestore
{
  return self->_showResetRestore;
}

- (void)setShowResetRestore:(BOOL)a3
{
  self->_showResetRestore = a3;
}

- (BOOL)showEmergencyDialer
{
  return self->_showEmergencyDialer;
}

- (void)setShowEmergencyDialer:(BOOL)a3
{
  self->_showEmergencyDialer = a3;
}

- (BOOL)showRegionsDebugView
{
  return self->_showRegionsDebugView;
}

- (void)setShowRegionsDebugView:(BOOL)a3
{
  self->_showRegionsDebugView = a3;
}

- (BOOL)alwaysEnableUserRequestedErase
{
  return self->_alwaysEnableUserRequestedErase;
}

- (void)setAlwaysEnableUserRequestedErase:(BOOL)a3
{
  self->_alwaysEnableUserRequestedErase = a3;
}

- (PTOutlet)addNotificationOutlet
{
  return (PTOutlet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAddNotificationOutlet:(id)a3
{
}

- (CSBounceSettings)verticalBounceSettings
{
  return (CSBounceSettings *)objc_getProperty(self, a2, 80, 1);
}

- (void)setVerticalBounceSettings:(id)a3
{
}

- (CSBounceSettings)horizontalBounceSettings
{
  return (CSBounceSettings *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHorizontalBounceSettings:(id)a3
{
}

- (CSLockScreenPasscodeSettings)passcodeSettings
{
  return (CSLockScreenPasscodeSettings *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPasscodeSettings:(id)a3
{
}

- (CSLockScreenChargingSettings)chargingSettings
{
  return (CSLockScreenChargingSettings *)objc_getProperty(self, a2, 104, 1);
}

- (void)setChargingSettings:(id)a3
{
}

- (CSFocusSettings)focusSettings
{
  return (CSFocusSettings *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFocusSettings:(id)a3
{
}

- (CSLockScreenMesaSettings)mesaSettings
{
  return (CSLockScreenMesaSettings *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMesaSettings:(id)a3
{
}

- (CSLockScreenPearlSettings)pearlSettings
{
  return (CSLockScreenPearlSettings *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPearlSettings:(id)a3
{
}

- (CSLookSettings)lookSettings
{
  return (CSLookSettings *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLookSettings:(id)a3
{
}

- (CSCoverSheetTransitionsSettings)coverSheetTransitionsSettings
{
  return (CSCoverSheetTransitionsSettings *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCoverSheetTransitionsSettings:(id)a3
{
}

- (CSHorizontalScrollFailureRecognizerSettings)horizontalScrollFailureRecognizerSettings
{
  return (CSHorizontalScrollFailureRecognizerSettings *)objc_getProperty(self, a2, 152, 1);
}

- (void)setHorizontalScrollFailureRecognizerSettings:(id)a3
{
}

- (CSDashBoardScrollModifierSettings)dashBoardScrollModifierSettings
{
  return (CSDashBoardScrollModifierSettings *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDashBoardScrollModifierSettings:(id)a3
{
}

- (CSDashBoardNotificationVersusPagingScrollSettings)dashBoardNotificationScrollSettings
{
  return (CSDashBoardNotificationVersusPagingScrollSettings *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDashBoardNotificationScrollSettings:(id)a3
{
}

- (CSDashBoardQuickActionsButtonSettings)dashBoardQuickActionButtonSettings
{
  return (CSDashBoardQuickActionsButtonSettings *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDashBoardQuickActionButtonSettings:(id)a3
{
}

- (CSDashBoardRemoteContentSettings)dashBoardRemoteContentSettings
{
  return (CSDashBoardRemoteContentSettings *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDashBoardRemoteContentSettings:(id)a3
{
}

- (CSCoverSheetDismissGestureSettings)coverSheetDismissGestureSettings
{
  return (CSCoverSheetDismissGestureSettings *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCoverSheetDismissGestureSettings:(id)a3
{
}

- (CSLockScreenIdleTimerSettings)idleTimerSettings
{
  return (CSLockScreenIdleTimerSettings *)objc_getProperty(self, a2, 200, 1);
}

- (void)setIdleTimerSettings:(id)a3
{
}

- (CSVibrancySettings)vibrancySettings
{
  return (CSVibrancySettings *)objc_getProperty(self, a2, 208, 1);
}

- (void)setVibrancySettings:(id)a3
{
}

- (CSCameraExtensionSettings)cameraExtensionSettings
{
  return (CSCameraExtensionSettings *)objc_getProperty(self, a2, 216, 1);
}

- (void)setCameraExtensionSettings:(id)a3
{
}

- (SBFAnimationSettings)unlockToPhoneWallpaperOutSettings
{
  return (SBFAnimationSettings *)objc_getProperty(self, a2, 224, 1);
}

- (void)setUnlockToPhoneWallpaperOutSettings:(id)a3
{
}

- (SBFAnimationSettings)unlockToPhoneWallpaperInSettings
{
  return (SBFAnimationSettings *)objc_getProperty(self, a2, 232, 1);
}

- (void)setUnlockToPhoneWallpaperInSettings:(id)a3
{
}

- (SBFAnimationSettings)unlockWallpaperOutSettings
{
  return (SBFAnimationSettings *)objc_getProperty(self, a2, 240, 1);
}

- (void)setUnlockWallpaperOutSettings:(id)a3
{
}

- (SBFAnimationSettings)unlockWallpaperInSettings
{
  return (SBFAnimationSettings *)objc_getProperty(self, a2, 248, 1);
}

- (void)setUnlockWallpaperInSettings:(id)a3
{
}

- (CSLockScreenTestPluginSettings)testPluginSettings
{
  return (CSLockScreenTestPluginSettings *)objc_getProperty(self, a2, 256, 1);
}

- (void)setTestPluginSettings:(id)a3
{
}

- (double)nowPlayingHeightCompact
{
  return self->_nowPlayingHeightCompact;
}

- (void)setNowPlayingHeightCompact:(double)a3
{
  self->_nowPlayingHeightCompact = a3;
}

- (double)nowPlayingHeightExpanded
{
  return self->_nowPlayingHeightExpanded;
}

- (void)setNowPlayingHeightExpanded:(double)a3
{
  self->_nowPlayingHeightExpanded = a3;
}

- (double)mainToCameraViewSlideCompletionPercentage
{
  return self->_mainToCameraViewSlideCompletionPercentage;
}

- (void)setMainToCameraViewSlideCompletionPercentage:(double)a3
{
  self->_mainToCameraViewSlideCompletionPercentage = a3;
}

- (double)mainToTodayViewSlideCompletionPercentage
{
  return self->_mainToTodayViewSlideCompletionPercentage;
}

- (void)setMainToTodayViewSlideCompletionPercentage:(double)a3
{
  self->_mainToTodayViewSlideCompletionPercentage = a3;
}

- (double)appGrabberSlideUpVelocityThreshold
{
  return self->_appGrabberSlideUpVelocityThreshold;
}

- (void)setAppGrabberSlideUpVelocityThreshold:(double)a3
{
  self->_appGrabberSlideUpVelocityThreshold = a3;
}

- (double)unlockPasscodeThreshold
{
  return self->_unlockPasscodeThreshold;
}

- (void)setUnlockPasscodeThreshold:(double)a3
{
  self->_unlockPasscodeThreshold = a3;
}

- (double)unlockPasscodeThresholdForExternalDisplay
{
  return self->_unlockPasscodeThresholdForExternalDisplay;
}

- (void)setUnlockPasscodeThresholdForExternalDisplay:(double)a3
{
  self->_unlockPasscodeThresholdForExternalDisplay = a3;
}

- (double)unlockRubberBandThreshold
{
  return self->_unlockRubberBandThreshold;
}

- (void)setUnlockRubberBandThreshold:(double)a3
{
  self->_unlockRubberBandThreshold = a3;
}

- (double)unlockRubberBandFeedbackInterval
{
  return self->_unlockRubberBandFeedbackInterval;
}

- (void)setUnlockRubberBandFeedbackInterval:(double)a3
{
  self->_unlockRubberBandFeedbackInterval = a3;
}

- (int64_t)unlockRubberBandFeedbackIntensity
{
  return self->_unlockRubberBandFeedbackIntensity;
}

- (void)setUnlockRubberBandFeedbackIntensity:(int64_t)a3
{
  self->_unlockRubberBandFeedbackIntensity = a3;
}

- (double)lockJiggleHapticDelay
{
  return self->_lockJiggleHapticDelay;
}

- (void)setLockJiggleHapticDelay:(double)a3
{
  self->_lockJiggleHapticDelay = a3;
}

- (double)lockJiggleAnimationDelay
{
  return self->_lockJiggleAnimationDelay;
}

- (void)setLockJiggleAnimationDelay:(double)a3
{
  self->_lockJiggleAnimationDelay = a3;
}

- (double)unlockSwipeWallpaperAlpha
{
  return self->_unlockSwipeWallpaperAlpha;
}

- (void)setUnlockSwipeWallpaperAlpha:(double)a3
{
  self->_unlockSwipeWallpaperAlpha = a3;
}

- (BOOL)alwaysPutPluginsBelowScrollView
{
  return self->_alwaysPutPluginsBelowScrollView;
}

- (void)setAlwaysPutPluginsBelowScrollView:(BOOL)a3
{
  self->_alwaysPutPluginsBelowScrollView = a3;
}

- (BOOL)killsInsecureDrawingApps
{
  return self->_killsInsecureDrawingApps;
}

- (void)setKillsInsecureDrawingApps:(BOOL)a3
{
  self->_killsInsecureDrawingApps = a3;
}

- (BOOL)prewarmsCameraHardwareOnSwipe
{
  return self->_prewarmsCameraHardwareOnSwipe;
}

- (void)setPrewarmsCameraHardwareOnSwipe:(BOOL)a3
{
  self->_prewarmsCameraHardwareOnSwipe = a3;
}

- (BOOL)prewarmsCameraHardwareOnTap
{
  return self->_prewarmsCameraHardwareOnTap;
}

- (void)setPrewarmsCameraHardwareOnTap:(BOOL)a3
{
  self->_prewarmsCameraHardwareOnTap = a3;
}

- (BOOL)prelaunchesCameraAppOnSwipe
{
  return self->_prelaunchesCameraAppOnSwipe;
}

- (void)setPrelaunchesCameraAppOnSwipe:(BOOL)a3
{
  self->_prelaunchesCameraAppOnSwipe = a3;
}

- (BOOL)prelaunchesCameraAppOnTap
{
  return self->_prelaunchesCameraAppOnTap;
}

- (void)setPrelaunchesCameraAppOnTap:(BOOL)a3
{
  self->_prelaunchesCameraAppOnTap = a3;
}

- (double)cameraPrewarmThresholdOnSwipe
{
  return self->_cameraPrewarmThresholdOnSwipe;
}

- (void)setCameraPrewarmThresholdOnSwipe:(double)a3
{
  self->_cameraPrewarmThresholdOnSwipe = a3;
}

- (double)cameraPrelaunchThresholdOnSwipe
{
  return self->_cameraPrelaunchThresholdOnSwipe;
}

- (void)setCameraPrelaunchThresholdOnSwipe:(double)a3
{
  self->_cameraPrelaunchThresholdOnSwipe = a3;
}

- (double)cameraPrewarmDebounceTimeInterval
{
  return self->_cameraPrewarmDebounceTimeInterval;
}

- (void)setCameraPrewarmDebounceTimeInterval:(double)a3
{
  self->_cameraPrewarmDebounceTimeInterval = a3;
}

- (double)cameraPrewarmAutoCancelTimeInterval
{
  return self->_cameraPrewarmAutoCancelTimeInterval;
}

- (void)setCameraPrewarmAutoCancelTimeInterval:(double)a3
{
  self->_cameraPrewarmAutoCancelTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testPluginSettings, 0);
  objc_storeStrong((id *)&self->_unlockWallpaperInSettings, 0);
  objc_storeStrong((id *)&self->_unlockWallpaperOutSettings, 0);
  objc_storeStrong((id *)&self->_unlockToPhoneWallpaperInSettings, 0);
  objc_storeStrong((id *)&self->_unlockToPhoneWallpaperOutSettings, 0);
  objc_storeStrong((id *)&self->_cameraExtensionSettings, 0);
  objc_storeStrong((id *)&self->_vibrancySettings, 0);
  objc_storeStrong((id *)&self->_idleTimerSettings, 0);
  objc_storeStrong((id *)&self->_coverSheetDismissGestureSettings, 0);
  objc_storeStrong((id *)&self->_dashBoardRemoteContentSettings, 0);
  objc_storeStrong((id *)&self->_dashBoardQuickActionButtonSettings, 0);
  objc_storeStrong((id *)&self->_dashBoardNotificationScrollSettings, 0);
  objc_storeStrong((id *)&self->_dashBoardScrollModifierSettings, 0);
  objc_storeStrong((id *)&self->_horizontalScrollFailureRecognizerSettings, 0);
  objc_storeStrong((id *)&self->_coverSheetTransitionsSettings, 0);
  objc_storeStrong((id *)&self->_lookSettings, 0);
  objc_storeStrong((id *)&self->_pearlSettings, 0);
  objc_storeStrong((id *)&self->_mesaSettings, 0);
  objc_storeStrong((id *)&self->_focusSettings, 0);
  objc_storeStrong((id *)&self->_chargingSettings, 0);
  objc_storeStrong((id *)&self->_passcodeSettings, 0);
  objc_storeStrong((id *)&self->_horizontalBounceSettings, 0);
  objc_storeStrong((id *)&self->_verticalBounceSettings, 0);

  objc_storeStrong((id *)&self->_addNotificationOutlet, 0);
}

@end