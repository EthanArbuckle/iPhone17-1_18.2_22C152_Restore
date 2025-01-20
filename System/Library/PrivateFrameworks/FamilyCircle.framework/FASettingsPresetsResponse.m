@interface FASettingsPresetsResponse
+ (BOOL)supportsSecureCoding;
- (FASettingsPreset)currentPreset;
- (FASettingsPreset)expectedPreset;
- (FASettingsPresetsResponse)initWithAvailablePresets:(id)a3 expectedPreset:(id)a4 currentPreset:(id)a5;
- (FASettingsPresetsResponse)initWithCoder:(id)a3;
- (NSArray)availablePresets;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FASettingsPresetsResponse

- (FASettingsPresetsResponse)initWithAvailablePresets:(id)a3 expectedPreset:(id)a4 currentPreset:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FASettingsPresetsResponse;
  v11 = [(FASettingsPresetsResponse *)&v15 init];
  v12 = v11;
  if (v11)
  {
    if (v8) {
      v13 = v8;
    }
    else {
      v13 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v11->_availablePresets, v13);
    objc_storeStrong((id *)&v12->_expectedPreset, a4);
    objc_storeStrong((id *)&v12->_currentPreset, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  availablePresets = self->_availablePresets;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_availablePresets);
  [v5 encodeObject:availablePresets forKey:v6];

  expectedPreset = self->_expectedPreset;
  id v8 = NSStringFromSelector(sel_expectedPreset);
  [v5 encodeObject:expectedPreset forKey:v8];

  currentPreset = self->_currentPreset;
  NSStringFromSelector(sel_currentPreset);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:currentPreset forKey:v10];
}

- (FASettingsPresetsResponse)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = NSStringFromSelector(sel_availablePresets);
  id v9 = [v5 decodeObjectOfClasses:v7 forKey:v8];

  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_expectedPreset);
  v12 = [v5 decodeObjectOfClass:v10 forKey:v11];

  uint64_t v13 = objc_opt_class();
  v14 = NSStringFromSelector(sel_currentPreset);
  objc_super v15 = [v5 decodeObjectOfClass:v13 forKey:v14];

  v16 = [(FASettingsPresetsResponse *)self initWithAvailablePresets:v9 expectedPreset:v12 currentPreset:v15];
  return v16;
}

- (NSArray)availablePresets
{
  return self->_availablePresets;
}

- (FASettingsPreset)expectedPreset
{
  return self->_expectedPreset;
}

- (FASettingsPreset)currentPreset
{
  return self->_currentPreset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPreset, 0);
  objc_storeStrong((id *)&self->_expectedPreset, 0);
  objc_storeStrong((id *)&self->_availablePresets, 0);
}

@end