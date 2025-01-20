@interface CCUIControlResizingSettings
+ (id)settingsControllerModule;
- (SBFFluidBehaviorSettings)animationSettings;
- (SBHIconResizingSettings)resizeHandleSettings;
- (SBHIconResizingSettings)smallControlsResizeHandleSettings;
- (double)oversizeRubberbandingRange;
- (double)undersizeRubberbandingRange;
- (void)setAnimationSettings:(id)a3;
- (void)setDefaultValues;
- (void)setOversizeRubberbandingRange:(double)a3;
- (void)setResizeHandleSettings:(id)a3;
- (void)setSmallControlsResizeHandleSettings:(id)a3;
- (void)setUndersizeRubberbandingRange:(double)a3;
@end

@implementation CCUIControlResizingSettings

- (void)setDefaultValues
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIControlResizingSettings;
  [(PTSettings *)&v7 setDefaultValues];
  v3 = [(CCUIControlResizingSettings *)self resizeHandleSettings];
  [v3 setDefaultValues];

  v4 = [(CCUIControlResizingSettings *)self smallControlsResizeHandleSettings];
  [v4 setDefaultValues];

  v5 = [(CCUIControlResizingSettings *)self smallControlsResizeHandleSettings];
  [v5 setResizeHandleUsesTruncatedSectorHitArea:1];

  v6 = [(CCUIControlResizingSettings *)self animationSettings];
  [v6 setDefaultValues];

  [(CCUIControlResizingSettings *)self setOversizeRubberbandingRange:20.0];
  [(CCUIControlResizingSettings *)self setUndersizeRubberbandingRange:10.0];
}

+ (id)settingsControllerModule
{
  v37[1] = *MEMORY[0x1E4F143B8];
  v31 = [MEMORY[0x1E4F94130] rowWithTitle:@"Resize Handles" childSettingsKeyPath:@"resizeHandleSettings"];
  v2 = (void *)MEMORY[0x1E4F94160];
  v37[0] = v31;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  v28 = [v2 sectionWithRows:v3];

  v30 = [MEMORY[0x1E4F94130] rowWithTitle:@"1x1 Resize Handles" childSettingsKeyPath:@"smallControlsResizeHandleSettings"];
  v4 = (void *)MEMORY[0x1E4F94160];
  v36 = v30;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v27 = [v4 sectionWithRows:v5];

  v29 = [MEMORY[0x1E4F94130] rowWithTitle:@"Resize Animation" childSettingsKeyPath:@"animationSettings"];
  v6 = (void *)MEMORY[0x1E4F94160];
  v35 = v29;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v8 = [v6 sectionWithRows:v7];

  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Oversize Rubberband Range" valueKeyPath:@"oversizeRubberbandingRange"];
  v10 = [v9 between:0.0 and:100.0];
  v11 = [v10 precision:0];
  v34[0] = v11;
  v12 = [MEMORY[0x1E4F94148] rowWithTitle:@"Undersize Rubberband Range" valueKeyPath:@"undersizeRubberbandingRange"];
  v13 = [v12 between:0.0 and:100.0];
  v14 = [v13 precision:0];
  v34[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];

  v16 = [MEMORY[0x1E4F94160] sectionWithRows:v15];
  v17 = (void *)MEMORY[0x1E4F940F8];
  v18 = [MEMORY[0x1E4F94170] action];
  v19 = [v17 rowWithTitle:@"Restore Defaults" action:v18];

  v20 = (void *)MEMORY[0x1E4F94160];
  v33 = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v22 = [v20 sectionWithRows:v21];

  v23 = (void *)MEMORY[0x1E4F94160];
  v32[0] = v28;
  v32[1] = v27;
  v32[2] = v8;
  v32[3] = v16;
  v32[4] = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:5];
  v25 = [v23 moduleWithTitle:@"Resizing" contents:v24];

  return v25;
}

- (SBHIconResizingSettings)resizeHandleSettings
{
  return self->_resizeHandleSettings;
}

- (void)setResizeHandleSettings:(id)a3
{
}

- (SBHIconResizingSettings)smallControlsResizeHandleSettings
{
  return self->_smallControlsResizeHandleSettings;
}

- (void)setSmallControlsResizeHandleSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
}

- (double)oversizeRubberbandingRange
{
  return self->_oversizeRubberbandingRange;
}

- (void)setOversizeRubberbandingRange:(double)a3
{
  self->_oversizeRubberbandingRange = a3;
}

- (double)undersizeRubberbandingRange
{
  return self->_undersizeRubberbandingRange;
}

- (void)setUndersizeRubberbandingRange:(double)a3
{
  self->_undersizeRubberbandingRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_smallControlsResizeHandleSettings, 0);

  objc_storeStrong((id *)&self->_resizeHandleSettings, 0);
}

@end