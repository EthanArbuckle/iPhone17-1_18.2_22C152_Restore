@interface MTRThermostatClusterScheduleStruct
- (MTRThermostatClusterScheduleStruct)init;
- (NSArray)transitions;
- (NSData)presetHandle;
- (NSData)scheduleHandle;
- (NSNumber)builtIn;
- (NSNumber)systemMode;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBuiltIn:(id)a3;
- (void)setName:(id)a3;
- (void)setPresetHandle:(id)a3;
- (void)setScheduleHandle:(id)a3;
- (void)setSystemMode:(id)a3;
- (void)setTransitions:(id)a3;
@end

@implementation MTRThermostatClusterScheduleStruct

- (MTRThermostatClusterScheduleStruct)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTRThermostatClusterScheduleStruct;
  v2 = [(MTRThermostatClusterScheduleStruct *)&v14 init];
  v3 = v2;
  if (v2)
  {
    scheduleHandle = v2->_scheduleHandle;
    v2->_scheduleHandle = 0;

    systemMode = v3->_systemMode;
    v3->_systemMode = (NSNumber *)&unk_26F9C8620;

    name = v3->_name;
    v3->_name = 0;

    presetHandle = v3->_presetHandle;
    v3->_presetHandle = 0;

    uint64_t v10 = objc_msgSend_array(MEMORY[0x263EFF8C0], v8, v9);
    transitions = v3->_transitions;
    v3->_transitions = (NSArray *)v10;

    builtIn = v3->_builtIn;
    v3->_builtIn = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThermostatClusterScheduleStruct);
  v7 = objc_msgSend_scheduleHandle(self, v5, v6);
  objc_msgSend_setScheduleHandle_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_systemMode(self, v9, v10);
  objc_msgSend_setSystemMode_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_name(self, v13, v14);
  objc_msgSend_setName_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_presetHandle(self, v17, v18);
  objc_msgSend_setPresetHandle_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_transitions(self, v21, v22);
  objc_msgSend_setTransitions_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_builtIn(self, v25, v26);
  objc_msgSend_setBuiltIn_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_scheduleHandle, v6, 0);
  systemMode = self->_systemMode;
  name = self->_name;
  v11 = objc_msgSend_base64EncodedStringWithOptions_(self->_presetHandle, v10, 0);
  objc_msgSend_stringWithFormat_(v3, v12, @"<%@: scheduleHandle:%@; systemMode:%@; name:%@; presetHandle:%@; transitions:%@; builtIn:%@; >",
    v5,
    v7,
    systemMode,
    name,
    v11,
    self->_transitions,
  v13 = self->_builtIn);

  return v13;
}

- (NSData)scheduleHandle
{
  return self->_scheduleHandle;
}

- (void)setScheduleHandle:(id)a3
{
}

- (NSNumber)systemMode
{
  return self->_systemMode;
}

- (void)setSystemMode:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSData)presetHandle
{
  return self->_presetHandle;
}

- (void)setPresetHandle:(id)a3
{
}

- (NSArray)transitions
{
  return self->_transitions;
}

- (void)setTransitions:(id)a3
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
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_presetHandle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_systemMode, 0);

  objc_storeStrong((id *)&self->_scheduleHandle, 0);
}

@end