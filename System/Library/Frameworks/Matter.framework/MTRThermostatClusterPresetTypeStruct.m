@interface MTRThermostatClusterPresetTypeStruct
- (MTRThermostatClusterPresetTypeStruct)init;
- (NSNumber)numberOfPresets;
- (NSNumber)presetScenario;
- (NSNumber)presetTypeFeatures;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setNumberOfPresets:(id)a3;
- (void)setPresetScenario:(id)a3;
- (void)setPresetTypeFeatures:(id)a3;
@end

@implementation MTRThermostatClusterPresetTypeStruct

- (MTRThermostatClusterPresetTypeStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRThermostatClusterPresetTypeStruct;
  v2 = [(MTRThermostatClusterPresetTypeStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    presetScenario = v2->_presetScenario;
    v2->_presetScenario = (NSNumber *)&unk_26F9C8620;

    numberOfPresets = v3->_numberOfPresets;
    v3->_numberOfPresets = (NSNumber *)&unk_26F9C8620;

    presetTypeFeatures = v3->_presetTypeFeatures;
    v3->_presetTypeFeatures = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThermostatClusterPresetTypeStruct);
  v7 = objc_msgSend_presetScenario(self, v5, v6);
  objc_msgSend_setPresetScenario_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_numberOfPresets(self, v9, v10);
  objc_msgSend_setNumberOfPresets_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_presetTypeFeatures(self, v13, v14);
  objc_msgSend_setPresetTypeFeatures_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: presetScenario:%@; numberOfPresets:%@; presetTypeFeatures:%@; >",
    v5,
    self->_presetScenario,
    self->_numberOfPresets,
  v7 = self->_presetTypeFeatures);

  return v7;
}

- (NSNumber)presetScenario
{
  return self->_presetScenario;
}

- (void)setPresetScenario:(id)a3
{
}

- (NSNumber)numberOfPresets
{
  return self->_numberOfPresets;
}

- (void)setNumberOfPresets:(id)a3
{
}

- (NSNumber)presetTypeFeatures
{
  return self->_presetTypeFeatures;
}

- (void)setPresetTypeFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presetTypeFeatures, 0);
  objc_storeStrong((id *)&self->_numberOfPresets, 0);

  objc_storeStrong((id *)&self->_presetScenario, 0);
}

@end