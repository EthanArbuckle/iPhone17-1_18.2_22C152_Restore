@interface CCUIEditingSettings
+ (id)settingsControllerModule;
- (CCUIControlResizingSettings)resizingSettings;
- (double)pulsingBorderFadeDuration;
- (double)pulsingBorderMaxAlpha;
- (double)pulsingBorderMinAlpha;
- (double)pulsingBorderPulseDuration;
- (double)pulsingBorderWidth;
- (void)setDefaultValues;
- (void)setPulsingBorderFadeDuration:(double)a3;
- (void)setPulsingBorderMaxAlpha:(double)a3;
- (void)setPulsingBorderMinAlpha:(double)a3;
- (void)setPulsingBorderPulseDuration:(double)a3;
- (void)setPulsingBorderWidth:(double)a3;
- (void)setResizingSettings:(id)a3;
@end

@implementation CCUIEditingSettings

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIEditingSettings;
  [(PTSettings *)&v4 setDefaultValues];
  [(CCUIEditingSettings *)self setPulsingBorderWidth:3.0];
  [(CCUIEditingSettings *)self setPulsingBorderFadeDuration:0.3];
  [(CCUIEditingSettings *)self setPulsingBorderPulseDuration:0.7];
  [(CCUIEditingSettings *)self setPulsingBorderMinAlpha:0.08];
  [(CCUIEditingSettings *)self setPulsingBorderMaxAlpha:0.3];
  v3 = [(CCUIEditingSettings *)self resizingSettings];
  [v3 setDefaultValues];
}

+ (id)settingsControllerModule
{
  v37[5] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94148] rowWithTitle:@"Border Width" valueKeyPath:@"pulsingBorderWidth"];
  v3 = [v2 between:0.0 and:10.0];
  v33 = [v3 precision:2];

  objc_super v4 = [MEMORY[0x1E4F94148] rowWithTitle:@"Fade Duration" valueKeyPath:@"pulsingBorderFadeDuration"];
  v5 = [v4 between:0.0 and:2.0];
  v32 = [v5 precision:2];

  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Pulse Duration" valueKeyPath:@"pulsingBorderPulseDuration"];
  v7 = [v6 between:0.0 and:2.0];
  v31 = [v7 precision:2];

  v8 = [MEMORY[0x1E4F94148] rowWithTitle:@"Min Alpha" valueKeyPath:@"pulsingBorderMinAlpha"];
  v9 = [v8 between:0.0 and:1.0];
  v30 = [v9 precision:2];

  v10 = [MEMORY[0x1E4F94148] rowWithTitle:@"Max Alpha" valueKeyPath:@"pulsingBorderMaxAlpha"];
  v11 = [v10 between:0.0 and:1.0];
  v12 = [v11 precision:2];

  v13 = (void *)MEMORY[0x1E4F94160];
  v37[0] = v33;
  v37[1] = v32;
  v37[2] = v31;
  v37[3] = v30;
  v37[4] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
  v15 = [v13 sectionWithRows:v14 title:@"Pulsing Border"];

  v16 = [MEMORY[0x1E4F94130] rowWithTitle:@"Resizing" childSettingsKeyPath:@"resizingSettings"];
  v17 = (void *)MEMORY[0x1E4F94160];
  v36 = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v19 = [v17 sectionWithRows:v18];

  v20 = (void *)MEMORY[0x1E4F940F8];
  v21 = [MEMORY[0x1E4F94170] action];
  v22 = [v20 rowWithTitle:@"Restore Defaults" action:v21];

  v23 = (void *)MEMORY[0x1E4F94160];
  v35 = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v25 = [v23 sectionWithRows:v24];

  v26 = (void *)MEMORY[0x1E4F94160];
  v34[0] = v15;
  v34[1] = v19;
  v34[2] = v25;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  v28 = [v26 moduleWithTitle:@"Editing" contents:v27];

  return v28;
}

- (double)pulsingBorderWidth
{
  return self->_pulsingBorderWidth;
}

- (void)setPulsingBorderWidth:(double)a3
{
  self->_pulsingBorderWidth = a3;
}

- (double)pulsingBorderFadeDuration
{
  return self->_pulsingBorderFadeDuration;
}

- (void)setPulsingBorderFadeDuration:(double)a3
{
  self->_pulsingBorderFadeDuration = a3;
}

- (double)pulsingBorderPulseDuration
{
  return self->_pulsingBorderPulseDuration;
}

- (void)setPulsingBorderPulseDuration:(double)a3
{
  self->_pulsingBorderPulseDuration = a3;
}

- (double)pulsingBorderMinAlpha
{
  return self->_pulsingBorderMinAlpha;
}

- (void)setPulsingBorderMinAlpha:(double)a3
{
  self->_pulsingBorderMinAlpha = a3;
}

- (double)pulsingBorderMaxAlpha
{
  return self->_pulsingBorderMaxAlpha;
}

- (void)setPulsingBorderMaxAlpha:(double)a3
{
  self->_pulsingBorderMaxAlpha = a3;
}

- (CCUIControlResizingSettings)resizingSettings
{
  return self->_resizingSettings;
}

- (void)setResizingSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end