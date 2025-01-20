@interface CSLookSettings
+ (id)settingsControllerModule;
- (BOOL)customizesDateTime;
- (BOOL)subtitleAboveTime;
- (BOOL)useSettingsDateTime;
- (NSString)timeFontDesign;
- (double)timeFontSize;
- (double)timeFontWeight;
- (id)customTimeFont;
- (void)setCustomizesDateTime:(BOOL)a3;
- (void)setDefaultValues;
- (void)setSubtitleAboveTime:(BOOL)a3;
- (void)setTimeFontDesign:(id)a3;
- (void)setTimeFontSize:(double)a3;
- (void)setTimeFontWeight:(double)a3;
- (void)setUseSettingsDateTime:(BOOL)a3;
@end

@implementation CSLookSettings

- (void)setDefaultValues
{
  [(CSLookSettings *)self setUseSettingsDateTime:0];
  [(CSLookSettings *)self setCustomizesDateTime:1];
  [(CSLookSettings *)self setSubtitleAboveTime:1];
  [(CSLookSettings *)self setTimeFontSize:80.0];
  [(CSLookSettings *)self setTimeFontWeight:*MEMORY[0x1E4F43910]];
  uint64_t v3 = *MEMORY[0x1E4F43830];

  [(CSLookSettings *)self setTimeFontDesign:v3];
}

+ (id)settingsControllerModule
{
  v43[1] = *MEMORY[0x1E4F143B8];
  v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"useSettingsDateTime = YES"];
  v37 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Custom Values" valueKeyPath:@"useSettingsDateTime"];
  v2 = (void *)MEMORY[0x1E4F94160];
  v43[0] = v37;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  v34 = [v2 sectionWithRows:v3];

  v36 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Customizes Date/Time" valueKeyPath:@"customizesDateTime"];
  v35 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Subtitle Above Time" valueKeyPath:@"subtitleAboveTime"];
  v4 = (void *)MEMORY[0x1E4F94160];
  v42[0] = v36;
  v42[1] = v35;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  v33 = [v4 sectionWithRows:v5 title:@"Layout" condition:v32];

  v6 = [MEMORY[0x1E4F94108] rowWithTitle:@"Size" valueKeyPath:@"timeFontSize"];
  v31 = [v6 possibleValues:&unk_1F306B8D8 titles:&unk_1F306B8F0];

  v7 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43948]];
  v41[0] = v7;
  v8 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43938]];
  v41[1] = v8;
  v9 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43918]];
  v41[2] = v9;
  v10 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43928]];
  v41[3] = v10;
  v11 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43920]];
  v41[4] = v11;
  v12 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43930]];
  v41[5] = v12;
  v13 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43908]];
  v41[6] = v13;
  v14 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43910]];
  v41[7] = v14;
  v15 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43900]];
  v41[8] = v15;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:9];

  v16 = [MEMORY[0x1E4F94108] rowWithTitle:@"Weight" valueKeyPath:@"timeFontWeight"];
  v17 = [v16 possibleValues:v30 titles:&unk_1F306B908];

  uint64_t v18 = *MEMORY[0x1E4F43830];
  v40[0] = *MEMORY[0x1E4F43820];
  v40[1] = v18;
  uint64_t v19 = *MEMORY[0x1E4F43828];
  v40[2] = *MEMORY[0x1E4F43838];
  v40[3] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
  v21 = [MEMORY[0x1E4F94108] rowWithTitle:@"Design" valueKeyPath:@"timeFontDesign"];
  v22 = [v21 possibleValues:v20 titles:&unk_1F306B920];

  v23 = (void *)MEMORY[0x1E4F94160];
  v39[0] = v31;
  v39[1] = v17;
  v39[2] = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
  v25 = [v23 sectionWithRows:v24 title:@"Time Font" condition:v32];

  v26 = (void *)MEMORY[0x1E4F94160];
  v38[0] = v34;
  v38[1] = v33;
  v38[2] = v25;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  v28 = [v26 moduleWithTitle:@"Look Around" contents:v27];

  return v28;
}

- (id)customTimeFont
{
  return (id)[MEMORY[0x1E4F42A30] systemFontOfSize:self->_timeFontDesign weight:self->_timeFontSize design:self->_timeFontWeight];
}

- (BOOL)useSettingsDateTime
{
  return self->_useSettingsDateTime;
}

- (void)setUseSettingsDateTime:(BOOL)a3
{
  self->_useSettingsDateTime = a3;
}

- (BOOL)customizesDateTime
{
  return self->_customizesDateTime;
}

- (void)setCustomizesDateTime:(BOOL)a3
{
  self->_customizesDateTime = a3;
}

- (BOOL)subtitleAboveTime
{
  return self->_subtitleAboveTime;
}

- (void)setSubtitleAboveTime:(BOOL)a3
{
  self->_subtitleAboveTime = a3;
}

- (double)timeFontSize
{
  return self->_timeFontSize;
}

- (void)setTimeFontSize:(double)a3
{
  self->_timeFontSize = a3;
}

- (double)timeFontWeight
{
  return self->_timeFontWeight;
}

- (void)setTimeFontWeight:(double)a3
{
  self->_timeFontWeight = a3;
}

- (NSString)timeFontDesign
{
  return self->_timeFontDesign;
}

- (void)setTimeFontDesign:(id)a3
{
}

- (void).cxx_destruct
{
}

@end