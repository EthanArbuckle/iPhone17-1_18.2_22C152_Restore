@interface DNDSServerSettings
+ (id)settingsControllerModule;
- (int64_t)forcedIntelligentBreakthrough;
- (void)setDefaultValues;
- (void)setForcedIntelligentBreakthrough:(int64_t)a3;
@end

@implementation DNDSServerSettings

- (void)setDefaultValues
{
  v2.receiver = self;
  v2.super_class = (Class)DNDSServerSettings;
  [(PTSettings *)&v2 setDefaultValues];
}

+ (id)settingsControllerModule
{
  v23[3] = *MEMORY[0x1E4F143B8];
  objc_super v2 = [MEMORY[0x1E4F94108] rowWithTitle:@"Intelligent Breakthrough" valueKeyPath:@"forcedIntelligentBreakthrough"];
  v22[0] = &unk_1F2A5D838;
  v22[1] = &unk_1F2A5D850;
  v23[0] = @"None";
  v23[1] = @"Yes";
  v22[2] = &unk_1F2A5D868;
  v23[2] = @"No";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  v4 = [v3 allKeys];
  [v2 setPossibleValues:v4];

  v5 = [v3 allValues];
  [v2 setPossibleTitles:v5];

  v6 = (void *)MEMORY[0x1E4F94160];
  v21 = v2;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v8 = [v6 sectionWithRows:v7 title:@"Force Intelligent Breakthrough"];

  v9 = (void *)MEMORY[0x1E4F940F8];
  v10 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v11 = [v9 rowWithTitle:@"Restore Defaults" action:v10];

  v12 = (void *)MEMORY[0x1E4F94160];
  v20 = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v14 = [v12 sectionWithRows:v13];

  v15 = (void *)MEMORY[0x1E4F94160];
  v19[0] = v8;
  v19[1] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v17 = [v15 moduleWithTitle:@"Focus" contents:v16];

  return v17;
}

- (int64_t)forcedIntelligentBreakthrough
{
  return self->_forcedIntelligentBreakthrough;
}

- (void)setForcedIntelligentBreakthrough:(int64_t)a3
{
  self->_forcedIntelligentBreakthrough = a3;
}

@end