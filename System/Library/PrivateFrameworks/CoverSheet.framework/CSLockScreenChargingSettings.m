@interface CSLockScreenChargingSettings
+ (id)settingsControllerModule;
- (BOOL)shouldFakeA149Attach;
- (BOOL)shouldShowMaskForAuxiliaryBattery;
- (BOOL)shouldUseBrightnessFloor;
- (BOOL)showWirelessAndAccessoryAnimations;
- (BOOL)useWhimsicalDesign;
- (BOOL)warnForIdleDim;
- (double)accessoryAnimationBlockingDurationAfterBootInSeconds;
- (double)accessoryAnimationDelayInMilliseconds;
- (double)auxiliaryBoltHeight;
- (double)auxiliaryBoltMaskHeightDifference;
- (double)brightnessFloor;
- (double)omniAccessoryAnimationDelayInMilliseconds;
- (double)wirelessChargingDebounceDurationInSeconds;
- (double)wirelessChargingFirmwareUpdateDebounceDurationInSeconds;
- (int64_t)accessoryTypeForAnimationType:(int64_t)a3;
- (int64_t)wiredChargingAnimationType;
- (int64_t)wirelessChargingAnimationType;
- (void)setAccessoryAnimationBlockingDurationAfterBootInSeconds:(double)a3;
- (void)setAccessoryAnimationDelayInMilliseconds:(double)a3;
- (void)setAuxiliaryBoltHeight:(double)a3;
- (void)setAuxiliaryBoltMaskHeightDifference:(double)a3;
- (void)setBrightnessFloor:(double)a3;
- (void)setDefaultValues;
- (void)setOmniAccessoryAnimationDelayInMilliseconds:(double)a3;
- (void)setShouldFakeA149Attach:(BOOL)a3;
- (void)setShouldShowMaskForAuxiliaryBattery:(BOOL)a3;
- (void)setShouldUseBrightnessFloor:(BOOL)a3;
- (void)setShowWirelessAndAccessoryAnimations:(BOOL)a3;
- (void)setUseWhimsicalDesign:(BOOL)a3;
- (void)setWarnForIdleDim:(BOOL)a3;
- (void)setWiredChargingAnimationType:(int64_t)a3;
- (void)setWirelessChargingAnimationType:(int64_t)a3;
- (void)setWirelessChargingDebounceDurationInSeconds:(double)a3;
- (void)setWirelessChargingFirmwareUpdateDebounceDurationInSeconds:(double)a3;
@end

@implementation CSLockScreenChargingSettings

- (void)setDefaultValues
{
  [(CSLockScreenChargingSettings *)self setAccessoryAnimationDelayInMilliseconds:600.0];
  [(CSLockScreenChargingSettings *)self setOmniAccessoryAnimationDelayInMilliseconds:0.0];
  [(CSLockScreenChargingSettings *)self setAccessoryAnimationBlockingDurationAfterBootInSeconds:10.0];
  [(CSLockScreenChargingSettings *)self setWirelessChargingDebounceDurationInSeconds:8.0];
  [(CSLockScreenChargingSettings *)self setWirelessChargingFirmwareUpdateDebounceDurationInSeconds:80.0];
  [(CSLockScreenChargingSettings *)self setShowWirelessAndAccessoryAnimations:0];
  [(CSLockScreenChargingSettings *)self setWarnForIdleDim:1];
  [(CSLockScreenChargingSettings *)self setShouldUseBrightnessFloor:0];
  [(CSLockScreenChargingSettings *)self setBrightnessFloor:140.0];
  [(CSLockScreenChargingSettings *)self setWirelessChargingAnimationType:1];
  [(CSLockScreenChargingSettings *)self setWiredChargingAnimationType:0];
  [(CSLockScreenChargingSettings *)self setShouldFakeA149Attach:0];
  [(CSLockScreenChargingSettings *)self setUseWhimsicalDesign:0];
  [(CSLockScreenChargingSettings *)self setShouldShowMaskForAuxiliaryBattery:1];
  [(CSLockScreenChargingSettings *)self setAuxiliaryBoltHeight:15.0];

  [(CSLockScreenChargingSettings *)self setAuxiliaryBoltMaskHeightDifference:9.0];
}

+ (id)settingsControllerModule
{
  v44[11] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94148] rowWithTitle:@"Accessory Animation Delay (ms)" valueKeyPath:@"accessoryAnimationDelayInMilliseconds"];
  v41 = [v2 between:0.0 and:3000.0];

  [v41 setStaticTitle:@"Accessory Animation Delay (ms)"];
  v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Faked Animation Delay (ms)" valueKeyPath:@"omniAccessoryAnimationDelayInMilliseconds"];
  v40 = [v3 between:0.0 and:5000.0];

  v4 = [MEMORY[0x1E4F94148] rowWithTitle:@"Accessory Animation Blocking Duration After Boot (s)" valueKeyPath:@"accessoryAnimationBlockingDurationAfterBootInSeconds"];
  v39 = [v4 between:0.0 and:20.0];

  v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Debounce Duration (s)" valueKeyPath:@"wirelessChargingDebounceDurationInSeconds"];
  v38 = [v5 between:0.0 and:20.0];

  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Firmware Update Debounce Duration (s)" valueKeyPath:@"wirelessChargingFirmwareUpdateDebounceDurationInSeconds"];
  v37 = [v6 between:0.0 and:200.0];

  v35 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Warn for idle dim" valueKeyPath:@"warnForIdleDim"];
  v34 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Should Use Floor" valueKeyPath:@"shouldUseBrightnessFloor"];
  v7 = [MEMORY[0x1E4F94148] rowWithTitle:@"Brightness Floor" valueKeyPath:@"brightnessFloor"];
  v33 = [v7 between:0.0 and:200.0];

  v32 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Wireless/Accessory Animations" valueKeyPath:@"showWirelessAndAccessoryAnimations"];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"showWirelessAndAccessoryAnimations == YES"];
  v9 = [MEMORY[0x1E4F94108] rowWithTitle:@"Wireless Charging Animation" valueKeyPath:@"wirelessChargingAnimationType"];
  v10 = [v9 possibleValues:&unk_1F306ADC8 titles:&unk_1F306ADE0];
  v36 = (void *)v8;
  v31 = [v10 condition:v8];

  v11 = [MEMORY[0x1E4F94108] rowWithTitle:@"Wired Charging Animation" valueKeyPath:@"wiredChargingAnimationType"];
  v12 = [v11 possibleValues:&unk_1F306ADF8 titles:&unk_1F306AE10];
  v30 = [v12 condition:v8];

  v13 = (void *)MEMORY[0x1E4F94160];
  v44[0] = v41;
  v44[1] = v40;
  v44[2] = v39;
  v44[3] = v38;
  v44[4] = v37;
  v44[5] = v35;
  v44[6] = v34;
  v44[7] = v33;
  v44[8] = v32;
  v44[9] = v31;
  v44[10] = v30;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:11];
  v29 = [v13 sectionWithRows:v14];

  v15 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Fake A149 on B390" valueKeyPath:@"shouldFakeA149Attach"];
  v16 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use new HI design for A149" valueKeyPath:@"useWhimsicalDesign"];
  v17 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Auxiliary Mask" valueKeyPath:@"shouldShowMaskForAuxiliaryBattery"];
  v18 = [MEMORY[0x1E4F94148] rowWithTitle:@"Auxiliary Bolt Height" valueKeyPath:@"auxiliaryBoltHeight"];
  v19 = [v18 between:6.0 and:30.0];

  v20 = [MEMORY[0x1E4F94148] rowWithTitle:@"Bolt Mask Height Difference" valueKeyPath:@"auxiliaryBoltMaskHeightDifference"];
  v21 = [v20 between:0.0 and:20.0];

  v22 = (void *)MEMORY[0x1E4F94160];
  v43[0] = v15;
  v43[1] = v16;
  v43[2] = v17;
  v43[3] = v19;
  v43[4] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:5];
  v24 = [v22 sectionWithRows:v23 title:@"A149 Settings"];

  v25 = (void *)MEMORY[0x1E4F94160];
  v42[0] = v29;
  v42[1] = v24;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  v27 = [v25 moduleWithTitle:@"Charging Animation Settings" contents:v26];

  return v27;
}

- (int64_t)accessoryTypeForAnimationType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3) {
    return 0;
  }
  else {
    return qword_1D8504AB0[a3 - 2];
  }
}

- (double)accessoryAnimationDelayInMilliseconds
{
  return self->_accessoryAnimationDelayInMilliseconds;
}

- (void)setAccessoryAnimationDelayInMilliseconds:(double)a3
{
  self->_accessoryAnimationDelayInMilliseconds = a3;
}

- (double)omniAccessoryAnimationDelayInMilliseconds
{
  return self->_omniAccessoryAnimationDelayInMilliseconds;
}

- (void)setOmniAccessoryAnimationDelayInMilliseconds:(double)a3
{
  self->_omniAccessoryAnimationDelayInMilliseconds = a3;
}

- (double)accessoryAnimationBlockingDurationAfterBootInSeconds
{
  return self->_accessoryAnimationBlockingDurationAfterBootInSeconds;
}

- (void)setAccessoryAnimationBlockingDurationAfterBootInSeconds:(double)a3
{
  self->_accessoryAnimationBlockingDurationAfterBootInSeconds = a3;
}

- (double)wirelessChargingDebounceDurationInSeconds
{
  return self->_wirelessChargingDebounceDurationInSeconds;
}

- (void)setWirelessChargingDebounceDurationInSeconds:(double)a3
{
  self->_wirelessChargingDebounceDurationInSeconds = a3;
}

- (double)wirelessChargingFirmwareUpdateDebounceDurationInSeconds
{
  return self->_wirelessChargingFirmwareUpdateDebounceDurationInSeconds;
}

- (void)setWirelessChargingFirmwareUpdateDebounceDurationInSeconds:(double)a3
{
  self->_wirelessChargingFirmwareUpdateDebounceDurationInSeconds = a3;
}

- (BOOL)showWirelessAndAccessoryAnimations
{
  return self->_showWirelessAndAccessoryAnimations;
}

- (void)setShowWirelessAndAccessoryAnimations:(BOOL)a3
{
  self->_showWirelessAndAccessoryAnimations = a3;
}

- (BOOL)warnForIdleDim
{
  return self->_warnForIdleDim;
}

- (void)setWarnForIdleDim:(BOOL)a3
{
  self->_warnForIdleDim = a3;
}

- (BOOL)shouldUseBrightnessFloor
{
  return self->_shouldUseBrightnessFloor;
}

- (void)setShouldUseBrightnessFloor:(BOOL)a3
{
  self->_shouldUseBrightnessFloor = a3;
}

- (double)brightnessFloor
{
  return self->_brightnessFloor;
}

- (void)setBrightnessFloor:(double)a3
{
  self->_brightnessFloor = a3;
}

- (int64_t)wirelessChargingAnimationType
{
  return self->_wirelessChargingAnimationType;
}

- (void)setWirelessChargingAnimationType:(int64_t)a3
{
  self->_wirelessChargingAnimationType = a3;
}

- (int64_t)wiredChargingAnimationType
{
  return self->_wiredChargingAnimationType;
}

- (void)setWiredChargingAnimationType:(int64_t)a3
{
  self->_wiredChargingAnimationType = a3;
}

- (BOOL)shouldFakeA149Attach
{
  return self->_shouldFakeA149Attach;
}

- (void)setShouldFakeA149Attach:(BOOL)a3
{
  self->_shouldFakeA149Attach = a3;
}

- (BOOL)useWhimsicalDesign
{
  return self->_useWhimsicalDesign;
}

- (void)setUseWhimsicalDesign:(BOOL)a3
{
  self->_useWhimsicalDesign = a3;
}

- (BOOL)shouldShowMaskForAuxiliaryBattery
{
  return self->_shouldShowMaskForAuxiliaryBattery;
}

- (void)setShouldShowMaskForAuxiliaryBattery:(BOOL)a3
{
  self->_shouldShowMaskForAuxiliaryBattery = a3;
}

- (double)auxiliaryBoltHeight
{
  return self->_auxiliaryBoltHeight;
}

- (void)setAuxiliaryBoltHeight:(double)a3
{
  self->_auxiliaryBoltHeight = a3;
}

- (double)auxiliaryBoltMaskHeightDifference
{
  return self->_auxiliaryBoltMaskHeightDifference;
}

- (void)setAuxiliaryBoltMaskHeightDifference:(double)a3
{
  self->_auxiliaryBoltMaskHeightDifference = a3;
}

@end