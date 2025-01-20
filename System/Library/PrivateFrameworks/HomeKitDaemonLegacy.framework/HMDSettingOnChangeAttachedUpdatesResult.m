@interface HMDSettingOnChangeAttachedUpdatesResult
- (HMDSettingOnChangeAttachedUpdatesResult)initWithSettingsToUpdate:(id)a3 models:(id)a4 onCommitCompletion:(id)a5;
- (NSArray)modelsToUpdate;
- (NSArray)settingsToUpdate;
- (id)onCommitCompletion;
@end

@implementation HMDSettingOnChangeAttachedUpdatesResult

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onCommitCompletion, 0);
  objc_storeStrong((id *)&self->_modelsToUpdate, 0);
  objc_storeStrong((id *)&self->_settingsToUpdate, 0);
}

- (id)onCommitCompletion
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSArray)modelsToUpdate
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)settingsToUpdate
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (HMDSettingOnChangeAttachedUpdatesResult)initWithSettingsToUpdate:(id)a3 models:(id)a4 onCommitCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDSettingOnChangeAttachedUpdatesResult;
  v11 = [(HMDSettingOnChangeAttachedUpdatesResult *)&v17 init];
  if (v11)
  {
    v12 = v8;
    if (!v8)
    {
      v12 = [MEMORY[0x1E4F1C978] array];
    }
    objc_storeStrong((id *)&v11->_settingsToUpdate, v12);
    if (!v8) {

    }
    v13 = v9;
    if (!v9)
    {
      v13 = [MEMORY[0x1E4F1C978] array];
    }
    objc_storeStrong((id *)&v11->_modelsToUpdate, v13);
    if (!v9) {

    }
    v14 = _Block_copy(v10);
    id onCommitCompletion = v11->_onCommitCompletion;
    v11->_id onCommitCompletion = v14;
  }
  return v11;
}

@end