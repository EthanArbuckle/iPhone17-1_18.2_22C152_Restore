@interface MTRThermostatClusterPresetStruct
- (MTRThermostatClusterPresetStruct)init;
- (NSData)presetHandle;
- (NSNumber)builtIn;
- (NSNumber)coolingSetpoint;
- (NSNumber)heatingSetpoint;
- (NSNumber)presetScenario;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBuiltIn:(id)a3;
- (void)setCoolingSetpoint:(id)a3;
- (void)setHeatingSetpoint:(id)a3;
- (void)setName:(id)a3;
- (void)setPresetHandle:(id)a3;
- (void)setPresetScenario:(id)a3;
@end

@implementation MTRThermostatClusterPresetStruct

- (MTRThermostatClusterPresetStruct)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRThermostatClusterPresetStruct;
  v2 = [(MTRThermostatClusterPresetStruct *)&v11 init];
  v3 = v2;
  if (v2)
  {
    presetHandle = v2->_presetHandle;
    v2->_presetHandle = 0;

    presetScenario = v3->_presetScenario;
    v3->_presetScenario = (NSNumber *)&unk_26F9C8620;

    name = v3->_name;
    v3->_name = 0;

    coolingSetpoint = v3->_coolingSetpoint;
    v3->_coolingSetpoint = 0;

    heatingSetpoint = v3->_heatingSetpoint;
    v3->_heatingSetpoint = 0;

    builtIn = v3->_builtIn;
    v3->_builtIn = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThermostatClusterPresetStruct);
  v7 = objc_msgSend_presetHandle(self, v5, v6);
  objc_msgSend_setPresetHandle_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_presetScenario(self, v9, v10);
  objc_msgSend_setPresetScenario_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_name(self, v13, v14);
  objc_msgSend_setName_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_coolingSetpoint(self, v17, v18);
  objc_msgSend_setCoolingSetpoint_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_heatingSetpoint(self, v21, v22);
  objc_msgSend_setHeatingSetpoint_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_builtIn(self, v25, v26);
  objc_msgSend_setBuiltIn_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_presetHandle, v6, 0);
  objc_msgSend_stringWithFormat_(v3, v8, @"<%@: presetHandle:%@; presetScenario:%@; name:%@; coolingSetpoint:%@; heatingSetpoint:%@; builtIn:%@; >",
    v5,
    v7,
    self->_presetScenario,
    self->_name,
    self->_coolingSetpoint,
    self->_heatingSetpoint,
  v9 = self->_builtIn);

  return v9;
}

- (NSData)presetHandle
{
  return self->_presetHandle;
}

- (void)setPresetHandle:(id)a3
{
}

- (NSNumber)presetScenario
{
  return self->_presetScenario;
}

- (void)setPresetScenario:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)coolingSetpoint
{
  return self->_coolingSetpoint;
}

- (void)setCoolingSetpoint:(id)a3
{
}

- (NSNumber)heatingSetpoint
{
  return self->_heatingSetpoint;
}

- (void)setHeatingSetpoint:(id)a3
{
}

- (NSNumber)builtIn
{
  return self->_builtIn;
}

- (void)setBuiltIn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builtIn, 0);
  objc_storeStrong((id *)&self->_heatingSetpoint, 0);
  objc_storeStrong((id *)&self->_coolingSetpoint, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_presetScenario, 0);

  objc_storeStrong((id *)&self->_presetHandle, 0);
}

@end