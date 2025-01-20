@interface CSCameraExtensionSettings
+ (id)settingsControllerModule;
- (BOOL)captureExtensionsEnabled;
- (SBFFluidBehaviorSettings)coverSheetContentScaleSettings;
- (void)setCaptureExtensionsEnabled:(BOOL)a3;
- (void)setCoverSheetContentScaleSettings:(id)a3;
- (void)setDefaultValues;
@end

@implementation CSCameraExtensionSettings

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)CSCameraExtensionSettings;
  [(PTSettings *)&v4 setDefaultValues];
  [(CSCameraExtensionSettings *)self setCaptureExtensionsEnabled:0];
  [(SBFFluidBehaviorSettings *)self->_coverSheetContentScaleSettings setDampingRatio:0.783];
  [(SBFFluidBehaviorSettings *)self->_coverSheetContentScaleSettings setResponse:0.702];
  coverSheetContentScaleSettings = self->_coverSheetContentScaleSettings;
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](coverSheetContentScaleSettings, "setFrameRateRange:highFrameRateReason:", 1114151, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

+ (id)settingsControllerModule
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Launch Camera Extension from Quick Action Button" valueKeyPath:@"captureExtensionsEnabled"];
  v3 = [MEMORY[0x1E4F94130] rowWithTitle:@"Cover Sheet Content Scale" childSettingsKeyPath:@"coverSheetContentScaleSettings"];
  objc_super v4 = (void *)MEMORY[0x1E4F94160];
  v12[0] = v2;
  v12[1] = v3;
  CAFrameRateRange v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v6 = [v4 sectionWithRows:v5];

  v7 = (void *)MEMORY[0x1E4F94160];
  v11 = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v9 = [v7 moduleWithTitle:@"Camera Extension Settings" contents:v8];

  return v9;
}

- (BOOL)captureExtensionsEnabled
{
  return self->_captureExtensionsEnabled;
}

- (void)setCaptureExtensionsEnabled:(BOOL)a3
{
  self->_captureExtensionsEnabled = a3;
}

- (SBFFluidBehaviorSettings)coverSheetContentScaleSettings
{
  return self->_coverSheetContentScaleSettings;
}

- (void)setCoverSheetContentScaleSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end