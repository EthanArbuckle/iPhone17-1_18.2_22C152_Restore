@interface MTRThermostatClusterScheduleTypeStruct
- (MTRThermostatClusterScheduleTypeStruct)init;
- (NSNumber)numberOfSchedules;
- (NSNumber)scheduleTypeFeatures;
- (NSNumber)systemMode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setNumberOfSchedules:(id)a3;
- (void)setScheduleTypeFeatures:(id)a3;
- (void)setSystemMode:(id)a3;
@end

@implementation MTRThermostatClusterScheduleTypeStruct

- (MTRThermostatClusterScheduleTypeStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRThermostatClusterScheduleTypeStruct;
  v2 = [(MTRThermostatClusterScheduleTypeStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    systemMode = v2->_systemMode;
    v2->_systemMode = (NSNumber *)&unk_26F9C8620;

    numberOfSchedules = v3->_numberOfSchedules;
    v3->_numberOfSchedules = (NSNumber *)&unk_26F9C8620;

    scheduleTypeFeatures = v3->_scheduleTypeFeatures;
    v3->_scheduleTypeFeatures = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThermostatClusterScheduleTypeStruct);
  v7 = objc_msgSend_systemMode(self, v5, v6);
  objc_msgSend_setSystemMode_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_numberOfSchedules(self, v9, v10);
  objc_msgSend_setNumberOfSchedules_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_scheduleTypeFeatures(self, v13, v14);
  objc_msgSend_setScheduleTypeFeatures_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: systemMode:%@; numberOfSchedules:%@; scheduleTypeFeatures:%@; >",
    v5,
    self->_systemMode,
    self->_numberOfSchedules,
  v7 = self->_scheduleTypeFeatures);

  return v7;
}

- (NSNumber)systemMode
{
  return self->_systemMode;
}

- (void)setSystemMode:(id)a3
{
}

- (NSNumber)numberOfSchedules
{
  return self->_numberOfSchedules;
}

- (void)setNumberOfSchedules:(id)a3
{
}

- (NSNumber)scheduleTypeFeatures
{
  return self->_scheduleTypeFeatures;
}

- (void)setScheduleTypeFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleTypeFeatures, 0);
  objc_storeStrong((id *)&self->_numberOfSchedules, 0);

  objc_storeStrong((id *)&self->_systemMode, 0);
}

@end