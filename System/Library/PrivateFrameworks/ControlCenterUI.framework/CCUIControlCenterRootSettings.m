@interface CCUIControlCenterRootSettings
+ (id)settingsControllerModule;
- (CCUIEditingSettings)editingSettings;
- (void)setDefaultValues;
- (void)setEditingSettings:(id)a3;
@end

@implementation CCUIControlCenterRootSettings

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIControlCenterRootSettings;
  [(PTSettings *)&v4 setDefaultValues];
  v3 = [(CCUIControlCenterRootSettings *)self editingSettings];
  [v3 setDefaultValues];
}

+ (id)settingsControllerModule
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94130] rowWithTitle:@"Editing" childSettingsKeyPath:@"editingSettings"];
  v16[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

  objc_super v4 = [MEMORY[0x1E4F94160] sectionWithRows:v3];
  v5 = (void *)MEMORY[0x1E4F940F8];
  v6 = [MEMORY[0x1E4F94170] action];
  v7 = [v5 rowWithTitle:@"Restore Defaults" action:v6];
  v15 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

  v9 = [MEMORY[0x1E4F94160] sectionWithRows:v8];
  v10 = (void *)MEMORY[0x1E4F94160];
  v14[0] = v4;
  v14[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v12 = [v10 moduleWithTitle:0 contents:v11];

  return v12;
}

- (CCUIEditingSettings)editingSettings
{
  return self->_editingSettings;
}

- (void)setEditingSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end