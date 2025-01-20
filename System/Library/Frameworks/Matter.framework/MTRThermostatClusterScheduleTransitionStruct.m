@interface MTRThermostatClusterScheduleTransitionStruct
- (MTRThermostatClusterScheduleTransitionStruct)init;
- (NSData)presetHandle;
- (NSNumber)coolingSetpoint;
- (NSNumber)dayOfWeek;
- (NSNumber)heatingSetpoint;
- (NSNumber)systemMode;
- (NSNumber)transitionTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCoolingSetpoint:(id)a3;
- (void)setDayOfWeek:(id)a3;
- (void)setHeatingSetpoint:(id)a3;
- (void)setPresetHandle:(id)a3;
- (void)setSystemMode:(id)a3;
- (void)setTransitionTime:(id)a3;
@end

@implementation MTRThermostatClusterScheduleTransitionStruct

- (MTRThermostatClusterScheduleTransitionStruct)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRThermostatClusterScheduleTransitionStruct;
  v2 = [(MTRThermostatClusterScheduleTransitionStruct *)&v11 init];
  v3 = v2;
  if (v2)
  {
    dayOfWeek = v2->_dayOfWeek;
    v2->_dayOfWeek = (NSNumber *)&unk_26F9C8620;

    transitionTime = v3->_transitionTime;
    v3->_transitionTime = (NSNumber *)&unk_26F9C8620;

    presetHandle = v3->_presetHandle;
    v3->_presetHandle = 0;

    systemMode = v3->_systemMode;
    v3->_systemMode = 0;

    coolingSetpoint = v3->_coolingSetpoint;
    v3->_coolingSetpoint = 0;

    heatingSetpoint = v3->_heatingSetpoint;
    v3->_heatingSetpoint = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThermostatClusterScheduleTransitionStruct);
  v7 = objc_msgSend_dayOfWeek(self, v5, v6);
  objc_msgSend_setDayOfWeek_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_transitionTime(self, v9, v10);
  objc_msgSend_setTransitionTime_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_presetHandle(self, v13, v14);
  objc_msgSend_setPresetHandle_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_systemMode(self, v17, v18);
  objc_msgSend_setSystemMode_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_coolingSetpoint(self, v21, v22);
  objc_msgSend_setCoolingSetpoint_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_heatingSetpoint(self, v25, v26);
  objc_msgSend_setHeatingSetpoint_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  dayOfWeek = self->_dayOfWeek;
  transitionTime = self->_transitionTime;
  v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_presetHandle, v8, 0);
  objc_msgSend_stringWithFormat_(v3, v10, @"<%@: dayOfWeek:%@; transitionTime:%@; presetHandle:%@; systemMode:%@; coolingSetpoint:%@; heatingSetpoint:%@; >",
    v5,
    dayOfWeek,
    transitionTime,
    v9,
    self->_systemMode,
    self->_coolingSetpoint,
  objc_super v11 = self->_heatingSetpoint);

  return v11;
}

- (NSNumber)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void)setDayOfWeek:(id)a3
{
}

- (NSNumber)transitionTime
{
  return self->_transitionTime;
}

- (void)setTransitionTime:(id)a3
{
}

- (NSData)presetHandle
{
  return self->_presetHandle;
}

- (void)setPresetHandle:(id)a3
{
}

- (NSNumber)systemMode
{
  return self->_systemMode;
}

- (void)setSystemMode:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heatingSetpoint, 0);
  objc_storeStrong((id *)&self->_coolingSetpoint, 0);
  objc_storeStrong((id *)&self->_systemMode, 0);
  objc_storeStrong((id *)&self->_presetHandle, 0);
  objc_storeStrong((id *)&self->_transitionTime, 0);

  objc_storeStrong((id *)&self->_dayOfWeek, 0);
}

@end