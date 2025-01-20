@interface AMMotionDetectionSettings
+ (id)_keyPathForTriggerTypeName:(id)a3;
+ (id)settingsControllerModule;
+ (void)_enumerateTriggerTypes:(id)a3;
- (BOOL)triggerTypeFilteredThresholdHigh;
- (BOOL)triggerTypeFilteredThresholdLow;
- (BOOL)triggerTypeFilteredThresholdMedium;
- (BOOL)triggerTypeThresholdHigh;
- (BOOL)triggerTypeThresholdLow;
- (BOOL)triggerTypeThresholdMedium;
- (unint64_t)enabledTriggers;
- (void)setDefaultValues;
- (void)setEnabledTriggers:(unint64_t)a3;
- (void)setTriggerTypeFilteredThresholdHigh:(BOOL)a3;
- (void)setTriggerTypeFilteredThresholdLow:(BOOL)a3;
- (void)setTriggerTypeFilteredThresholdMedium:(BOOL)a3;
- (void)setTriggerTypeThresholdHigh:(BOOL)a3;
- (void)setTriggerTypeThresholdLow:(BOOL)a3;
- (void)setTriggerTypeThresholdMedium:(BOOL)a3;
@end

@implementation AMMotionDetectionSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)AMMotionDetectionSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(AMMotionDetectionSettings *)self setEnabledTriggers:128];
}

+ (id)settingsControllerModule
{
  v24[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = objc_opt_class();
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __53__AMMotionDetectionSettings_settingsControllerModule__block_invoke;
  v20 = &unk_265223408;
  id v21 = v3;
  id v22 = a1;
  id v5 = v3;
  [v4 _enumerateTriggerTypes:&v17];
  v6 = objc_msgSend(MEMORY[0x263F622D8], "sectionWithRows:title:", v5, @"Enabled Triggers", v17, v18, v19, v20);
  v7 = (void *)MEMORY[0x263F622A0];
  v8 = [MEMORY[0x263F622F8] actionWithSettingsKeyPath:0];
  v9 = [v7 rowWithTitle:@"Restore Defaults" action:v8];

  v10 = (void *)MEMORY[0x263F622D8];
  v24[0] = v9;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  v12 = [v10 sectionWithRows:v11];

  v13 = (void *)MEMORY[0x263F622D8];
  v23[0] = v6;
  v23[1] = v12;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v15 = [v13 moduleWithTitle:@"Motion Detection" contents:v14];

  return v15;
}

void __53__AMMotionDetectionSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)MEMORY[0x263F62328];
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  v6 = [v4 _keyPathForTriggerTypeName:v5];
  id v7 = [v3 rowWithTitle:v5 valueKeyPath:v6];

  [*(id *)(a1 + 32) addObject:v7];
}

+ (id)_keyPathForTriggerTypeName:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  id v5 = [v3 whitespaceCharacterSet];
  v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  id v7 = [v6 componentsJoinedByString:&stru_26FBC75E0];
  v8 = [NSString stringWithFormat:@"triggerType%@", v7];

  return v8;
}

- (unint64_t)enabledTriggers
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  objc_super v3 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__AMMotionDetectionSettings_enabledTriggers__block_invoke;
  v6[3] = &unk_265223430;
  v6[4] = self;
  v6[5] = &v7;
  [v3 _enumerateTriggerTypes:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __44__AMMotionDetectionSettings_enabledTriggers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [(id)objc_opt_class() _keyPathForTriggerTypeName:v6];

  v8 = [v5 valueForKey:v7];
  LODWORD(v5) = [v8 BOOLValue];

  if (v5) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v9 unsignedIntegerValue];
  }
}

- (void)setEnabledTriggers:(unint64_t)a3
{
  id v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__AMMotionDetectionSettings_setEnabledTriggers___block_invoke;
  v6[3] = &unk_265223408;
  v6[4] = self;
  v6[5] = a3;
  [v5 _enumerateTriggerTypes:v6];
}

void __48__AMMotionDetectionSettings_setEnabledTriggers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  BOOL v7 = ([a3 unsignedIntegerValue] & v5) != 0;
  v8 = *(void **)(a1 + 32);
  id v10 = [NSNumber numberWithBool:v7];
  id v9 = [(id)objc_opt_class() _keyPathForTriggerTypeName:v6];

  [v8 setValue:v10 forKey:v9];
}

+ (void)_enumerateTriggerTypes:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void (**)(id, void *, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [&unk_26FBC9230 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(&unk_26FBC9230);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 objectForKeyedSubscript:@"name"];
        id v10 = [v8 objectForKeyedSubscript:@"value"];
        v3[2](v3, v9, v10);
      }
      uint64_t v5 = [&unk_26FBC9230 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (BOOL)triggerTypeThresholdLow
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setTriggerTypeThresholdLow:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (BOOL)triggerTypeThresholdMedium
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setTriggerTypeThresholdMedium:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

- (BOOL)triggerTypeThresholdHigh
{
  return *(&self->super.__isObservingChildren + 3);
}

- (void)setTriggerTypeThresholdHigh:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 3) = a3;
}

- (BOOL)triggerTypeFilteredThresholdLow
{
  return *(&self->super.__isObservingChildren + 4);
}

- (void)setTriggerTypeFilteredThresholdLow:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 4) = a3;
}

- (BOOL)triggerTypeFilteredThresholdMedium
{
  return *(&self->super.__isObservingChildren + 5);
}

- (void)setTriggerTypeFilteredThresholdMedium:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 5) = a3;
}

- (BOOL)triggerTypeFilteredThresholdHigh
{
  return self->_triggerTypeThresholdLow;
}

- (void)setTriggerTypeFilteredThresholdHigh:(BOOL)a3
{
  self->_triggerTypeThresholdLow = a3;
}

@end