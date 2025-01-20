@interface CSDashBoardRemoteContentSettings
+ (id)settingsControllerModule;
- (BOOL)animatesDimming;
- (BOOL)animatesUndimming;
- (BOOL)autoExtendsIdleTimer;
- (BOOL)dismissesOnTapOverride;
- (BOOL)forceLuminanceReduction;
- (BOOL)hostsInlineContentNativelyInNotificationList;
- (BOOL)includesDateTimeStandinInAdjunctList;
- (BOOL)overrideContentPreferences;
- (BOOL)prefersInlinePresentationOverride;
- (BOOL)shouldHostContentInNotificationList;
- (BOOL)undimsOnTap;
- (BOOL)usesLegacyDismissalLogic;
- (double)bottomLuminanceValue;
- (double)dimDuration;
- (double)directFlingDampeningFactor;
- (double)directThreshold;
- (double)legacyThreshold;
- (double)lighterBottomLuminanceValue;
- (double)lighterLowerLuminanceValue;
- (double)lighterTopLuminanceValue;
- (double)lighterUpperLuminanceValue;
- (double)lowerLuminanceValue;
- (double)topLuminanceValue;
- (double)undimDuration;
- (double)upperLuminanceValue;
- (int64_t)backgroundStyleOverride;
- (int64_t)dateTimeStyleOverride;
- (int64_t)homeGestureModeOverride;
- (void)setAnimatesDimming:(BOOL)a3;
- (void)setAnimatesUndimming:(BOOL)a3;
- (void)setAutoExtendsIdleTimer:(BOOL)a3;
- (void)setBackgroundStyleOverride:(int64_t)a3;
- (void)setBottomLuminanceValue:(double)a3;
- (void)setDateTimeStyleOverride:(int64_t)a3;
- (void)setDefaultValues;
- (void)setDimDuration:(double)a3;
- (void)setDirectFlingDampeningFactor:(double)a3;
- (void)setDirectThreshold:(double)a3;
- (void)setDismissesOnTapOverride:(BOOL)a3;
- (void)setForceLuminanceReduction:(BOOL)a3;
- (void)setHomeGestureModeOverride:(int64_t)a3;
- (void)setHostsInlineContentNativelyInNotificationList:(BOOL)a3;
- (void)setIncludesDateTimeStandinInAdjunctList:(BOOL)a3;
- (void)setLegacyThreshold:(double)a3;
- (void)setLighterBottomLuminanceValue:(double)a3;
- (void)setLighterLowerLuminanceValue:(double)a3;
- (void)setLighterTopLuminanceValue:(double)a3;
- (void)setLighterUpperLuminanceValue:(double)a3;
- (void)setLowerLuminanceValue:(double)a3;
- (void)setOverrideContentPreferences:(BOOL)a3;
- (void)setPrefersInlinePresentationOverride:(BOOL)a3;
- (void)setTopLuminanceValue:(double)a3;
- (void)setUndimDuration:(double)a3;
- (void)setUndimsOnTap:(BOOL)a3;
- (void)setUpperLuminanceValue:(double)a3;
- (void)setUsesLegacyDismissalLogic:(BOOL)a3;
@end

@implementation CSDashBoardRemoteContentSettings

- (void)setDefaultValues
{
  [(CSDashBoardRemoteContentSettings *)self setOverrideContentPreferences:0];
  [(CSDashBoardRemoteContentSettings *)self setDateTimeStyleOverride:0];
  [(CSDashBoardRemoteContentSettings *)self setBackgroundStyleOverride:3];
  [(CSDashBoardRemoteContentSettings *)self setHomeGestureModeOverride:3];
  [(CSDashBoardRemoteContentSettings *)self setDismissesOnTapOverride:0];
  [(CSDashBoardRemoteContentSettings *)self setPrefersInlinePresentationOverride:0];
  [(CSDashBoardRemoteContentSettings *)self setForceLuminanceReduction:1];
  [(CSDashBoardRemoteContentSettings *)self setAnimatesDimming:1];
  [(CSDashBoardRemoteContentSettings *)self setDimDuration:0.5];
  [(CSDashBoardRemoteContentSettings *)self setAnimatesUndimming:1];
  [(CSDashBoardRemoteContentSettings *)self setUndimDuration:0.5];
  [(CSDashBoardRemoteContentSettings *)self setUndimsOnTap:0];
  [(CSDashBoardRemoteContentSettings *)self setAutoExtendsIdleTimer:0];
  [(CSDashBoardRemoteContentSettings *)self setBottomLuminanceValue:0.0];
  [(CSDashBoardRemoteContentSettings *)self setLowerLuminanceValue:0.15];
  [(CSDashBoardRemoteContentSettings *)self setUpperLuminanceValue:0.3];
  [(CSDashBoardRemoteContentSettings *)self setTopLuminanceValue:0.45];
  [(CSDashBoardRemoteContentSettings *)self setLighterBottomLuminanceValue:0.0];
  [(CSDashBoardRemoteContentSettings *)self setLighterLowerLuminanceValue:0.3];
  [(CSDashBoardRemoteContentSettings *)self setLighterUpperLuminanceValue:0.6];
  [(CSDashBoardRemoteContentSettings *)self setLighterTopLuminanceValue:0.9];
  [(CSDashBoardRemoteContentSettings *)self setUsesLegacyDismissalLogic:0];
  [(CSDashBoardRemoteContentSettings *)self setLegacyThreshold:0.8];
  [(CSDashBoardRemoteContentSettings *)self setDirectThreshold:0.96];
  [(CSDashBoardRemoteContentSettings *)self setDirectFlingDampeningFactor:2.5];
  [(CSDashBoardRemoteContentSettings *)self setHostsInlineContentNativelyInNotificationList:1];

  [(CSDashBoardRemoteContentSettings *)self setIncludesDateTimeStandinInAdjunctList:1];
}

- (BOOL)shouldHostContentInNotificationList
{
  return _os_feature_enabled_impl();
}

+ (id)settingsControllerModule
{
  v74[6] = *MEMORY[0x1E4F143B8];
  v65 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Override Preferences" valueKeyPath:@"overrideContentPreferences"];
  v2 = [MEMORY[0x1E4F94108] rowWithTitle:@"Date/Time Style" valueKeyPath:@"dateTimeStyleOverride"];
  v64 = [v2 possibleValues:&unk_1F306BB78 titles:&unk_1F306BB90];

  v3 = [MEMORY[0x1E4F94108] rowWithTitle:@"Background Style" valueKeyPath:@"backgroundStyleOverride"];
  v63 = [v3 possibleValues:&unk_1F306BBA8 titles:&unk_1F306BBC0];

  v4 = [MEMORY[0x1E4F94108] rowWithTitle:@"Home Gesture Mode" valueKeyPath:@"homeGestureModeOverride"];
  v62 = [v4 possibleValues:&unk_1F306BBD8 titles:&unk_1F306BBF0];

  v61 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Dismisses On Tap" valueKeyPath:@"dismissesOnTapOverride"];
  v60 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Prefers Inline Presentation" valueKeyPath:@"prefersInlinePresentationOverride"];
  v5 = (void *)MEMORY[0x1E4F94160];
  v74[0] = v65;
  v74[1] = v64;
  v74[2] = v63;
  v74[3] = v62;
  v74[4] = v61;
  v74[5] = v60;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:6];
  v66 = [v5 sectionWithRows:v6];

  v59 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Legacy Threshold" valueKeyPath:@"usesLegacyDismissalLogic"];
  v58 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Legacy Threshold" valueKeyPath:@"legacyThreshold"];
  v57 = [MEMORY[0x1E4F94148] rowWithTitle:@"Direct Threshold" valueKeyPath:@"directThreshold"];
  v56 = [MEMORY[0x1E4F94148] rowWithTitle:@"Dampening Factor" valueKeyPath:@"directFlingDampeningFactor"];
  v7 = (void *)MEMORY[0x1E4F94160];
  v73[0] = v59;
  v73[1] = v58;
  v73[2] = v57;
  v73[3] = v56;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];
  v50 = [v7 sectionWithRows:v8];

  v55 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Force Luminance Reduction" valueKeyPath:@"forceLuminanceReduction"];
  v54 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Animates Dimming" valueKeyPath:@"animatesDimming"];
  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Dimming Duration" valueKeyPath:@"dimDuration"];
  v53 = [v9 between:0.0 and:2.0];

  v52 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Animates Undimming" valueKeyPath:@"animatesUndimming"];
  v10 = [MEMORY[0x1E4F94148] rowWithTitle:@"Undimming Duration" valueKeyPath:@"undimDuration"];
  v51 = [v10 between:0.0 and:2.0];

  v49 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Undims on Tap" valueKeyPath:@"undimsOnTap"];
  v11 = (void *)MEMORY[0x1E4F94160];
  v72[0] = v55;
  v72[1] = v54;
  v72[2] = v53;
  v72[3] = v52;
  v72[4] = v51;
  v72[5] = v49;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:6];
  v13 = [v11 sectionWithRows:v12];

  v48 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Auto Extends Timer" valueKeyPath:@"autoExtendsIdleTimer"];
  v14 = (void *)MEMORY[0x1E4F94160];
  v71 = v48;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
  v47 = [v14 sectionWithRows:v15];

  v16 = [MEMORY[0x1E4F94148] rowWithTitle:@"(D) Minimum Luminance Factor" valueKeyPath:@"bottomLuminanceValue"];
  v46 = [v16 between:0.0 and:1.0];

  v17 = [MEMORY[0x1E4F94148] rowWithTitle:@"(D) Lower Luminance Factor" valueKeyPath:@"lowerLuminanceValue"];
  v45 = [v17 between:0.0 and:1.0];

  v18 = [MEMORY[0x1E4F94148] rowWithTitle:@"(D) Upper Luminance Factor" valueKeyPath:@"upperLuminanceValue"];
  v44 = [v18 between:0.0 and:1.0];

  v19 = [MEMORY[0x1E4F94148] rowWithTitle:@"(D) Maximum Luminance Factor" valueKeyPath:@"topLuminanceValue"];
  v43 = [v19 between:0.0 and:1.0];

  v20 = (void *)MEMORY[0x1E4F94160];
  v70[0] = v46;
  v70[1] = v45;
  v70[2] = v44;
  v70[3] = v43;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:4];
  v42 = [v20 sectionWithRows:v21];

  v22 = [MEMORY[0x1E4F94148] rowWithTitle:@"(L) Minimum Luminance Factor" valueKeyPath:@"lighterBottomLuminanceValue"];
  v41 = [v22 between:0.0 and:1.0];

  v23 = [MEMORY[0x1E4F94148] rowWithTitle:@"(L) Lower Luminance Factor" valueKeyPath:@"lighterLowerLuminanceValue"];
  v40 = [v23 between:0.0 and:1.0];

  v24 = [MEMORY[0x1E4F94148] rowWithTitle:@"(L) Upper Luminance Factor" valueKeyPath:@"lighterUpperLuminanceValue"];
  v39 = [v24 between:0.0 and:1.0];

  v25 = [MEMORY[0x1E4F94148] rowWithTitle:@"(L) Maximum Luminance Factor" valueKeyPath:@"lighterTopLuminanceValue"];
  v38 = [v25 between:0.0 and:1.0];

  v26 = (void *)MEMORY[0x1E4F94160];
  v69[0] = v41;
  v69[1] = v40;
  v69[2] = v39;
  v69[3] = v38;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:4];
  v28 = [v26 sectionWithRows:v27];

  v29 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Hosts in Notification List" valueKeyPath:@"hostsInlineContentNativelyInNotificationList"];
  v30 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Date Time Standin" valueKeyPath:@"includesDateTimeStandinInAdjunctList"];
  v31 = (void *)MEMORY[0x1E4F94160];
  v68[0] = v29;
  v68[1] = v30;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
  v33 = [v31 sectionWithRows:v32];

  v34 = (void *)MEMORY[0x1E4F94160];
  v67[0] = v66;
  v67[1] = v50;
  v67[2] = v13;
  v67[3] = v47;
  v67[4] = v42;
  v67[5] = v28;
  v67[6] = v33;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:7];
  v36 = [v34 moduleWithTitle:@"Remote Content Settings" contents:v35];

  return v36;
}

- (BOOL)overrideContentPreferences
{
  return self->_overrideContentPreferences;
}

- (void)setOverrideContentPreferences:(BOOL)a3
{
  self->_overrideContentPreferences = a3;
}

- (int64_t)dateTimeStyleOverride
{
  return self->_dateTimeStyleOverride;
}

- (void)setDateTimeStyleOverride:(int64_t)a3
{
  self->_dateTimeStyleOverride = a3;
}

- (int64_t)backgroundStyleOverride
{
  return self->_backgroundStyleOverride;
}

- (void)setBackgroundStyleOverride:(int64_t)a3
{
  self->_backgroundStyleOverride = a3;
}

- (int64_t)homeGestureModeOverride
{
  return self->_homeGestureModeOverride;
}

- (void)setHomeGestureModeOverride:(int64_t)a3
{
  self->_homeGestureModeOverride = a3;
}

- (BOOL)dismissesOnTapOverride
{
  return self->_dismissesOnTapOverride;
}

- (void)setDismissesOnTapOverride:(BOOL)a3
{
  self->_dismissesOnTapOverride = a3;
}

- (BOOL)prefersInlinePresentationOverride
{
  return self->_prefersInlinePresentationOverride;
}

- (void)setPrefersInlinePresentationOverride:(BOOL)a3
{
  self->_prefersInlinePresentationOverride = a3;
}

- (BOOL)forceLuminanceReduction
{
  return self->_forceLuminanceReduction;
}

- (void)setForceLuminanceReduction:(BOOL)a3
{
  self->_forceLuminanceReduction = a3;
}

- (BOOL)animatesDimming
{
  return self->_animatesDimming;
}

- (void)setAnimatesDimming:(BOOL)a3
{
  self->_animatesDimming = a3;
}

- (double)dimDuration
{
  return self->_dimDuration;
}

- (void)setDimDuration:(double)a3
{
  self->_dimDuration = a3;
}

- (BOOL)animatesUndimming
{
  return self->_animatesUndimming;
}

- (void)setAnimatesUndimming:(BOOL)a3
{
  self->_animatesUndimming = a3;
}

- (double)undimDuration
{
  return self->_undimDuration;
}

- (void)setUndimDuration:(double)a3
{
  self->_undimDuration = a3;
}

- (BOOL)undimsOnTap
{
  return self->_undimsOnTap;
}

- (void)setUndimsOnTap:(BOOL)a3
{
  self->_undimsOnTap = a3;
}

- (BOOL)autoExtendsIdleTimer
{
  return self->_autoExtendsIdleTimer;
}

- (void)setAutoExtendsIdleTimer:(BOOL)a3
{
  self->_autoExtendsIdleTimer = a3;
}

- (double)bottomLuminanceValue
{
  return self->_bottomLuminanceValue;
}

- (void)setBottomLuminanceValue:(double)a3
{
  self->_bottomLuminanceValue = a3;
}

- (double)lowerLuminanceValue
{
  return self->_lowerLuminanceValue;
}

- (void)setLowerLuminanceValue:(double)a3
{
  self->_lowerLuminanceValue = a3;
}

- (double)upperLuminanceValue
{
  return self->_upperLuminanceValue;
}

- (void)setUpperLuminanceValue:(double)a3
{
  self->_upperLuminanceValue = a3;
}

- (double)topLuminanceValue
{
  return self->_topLuminanceValue;
}

- (void)setTopLuminanceValue:(double)a3
{
  self->_topLuminanceValue = a3;
}

- (double)lighterBottomLuminanceValue
{
  return self->_lighterBottomLuminanceValue;
}

- (void)setLighterBottomLuminanceValue:(double)a3
{
  self->_lighterBottomLuminanceValue = a3;
}

- (double)lighterLowerLuminanceValue
{
  return self->_lighterLowerLuminanceValue;
}

- (void)setLighterLowerLuminanceValue:(double)a3
{
  self->_lighterLowerLuminanceValue = a3;
}

- (double)lighterUpperLuminanceValue
{
  return self->_lighterUpperLuminanceValue;
}

- (void)setLighterUpperLuminanceValue:(double)a3
{
  self->_lighterUpperLuminanceValue = a3;
}

- (double)lighterTopLuminanceValue
{
  return self->_lighterTopLuminanceValue;
}

- (void)setLighterTopLuminanceValue:(double)a3
{
  self->_lighterTopLuminanceValue = a3;
}

- (BOOL)usesLegacyDismissalLogic
{
  return self->_usesLegacyDismissalLogic;
}

- (void)setUsesLegacyDismissalLogic:(BOOL)a3
{
  self->_usesLegacyDismissalLogic = a3;
}

- (double)legacyThreshold
{
  return self->_legacyThreshold;
}

- (void)setLegacyThreshold:(double)a3
{
  self->_legacyThreshold = a3;
}

- (double)directThreshold
{
  return self->_directThreshold;
}

- (void)setDirectThreshold:(double)a3
{
  self->_directThreshold = a3;
}

- (double)directFlingDampeningFactor
{
  return self->_directFlingDampeningFactor;
}

- (void)setDirectFlingDampeningFactor:(double)a3
{
  self->_directFlingDampeningFactor = a3;
}

- (BOOL)hostsInlineContentNativelyInNotificationList
{
  return self->_hostsInlineContentNativelyInNotificationList;
}

- (void)setHostsInlineContentNativelyInNotificationList:(BOOL)a3
{
  self->_hostsInlineContentNativelyInNotificationList = a3;
}

- (BOOL)includesDateTimeStandinInAdjunctList
{
  return self->_includesDateTimeStandinInAdjunctList;
}

- (void)setIncludesDateTimeStandinInAdjunctList:(BOOL)a3
{
  self->_includesDateTimeStandinInAdjunctList = a3;
}

@end