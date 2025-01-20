@interface MTRThermostatClusterWeeklyScheduleTransitionStruct
- (MTRThermostatClusterWeeklyScheduleTransitionStruct)init;
- (NSNumber)coolSetpoint;
- (NSNumber)heatSetpoint;
- (NSNumber)transitionTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCoolSetpoint:(id)a3;
- (void)setHeatSetpoint:(id)a3;
- (void)setTransitionTime:(id)a3;
@end

@implementation MTRThermostatClusterWeeklyScheduleTransitionStruct

- (MTRThermostatClusterWeeklyScheduleTransitionStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRThermostatClusterWeeklyScheduleTransitionStruct;
  v2 = [(MTRThermostatClusterWeeklyScheduleTransitionStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    transitionTime = v2->_transitionTime;
    v2->_transitionTime = (NSNumber *)&unk_26F9C8620;

    heatSetpoint = v3->_heatSetpoint;
    v3->_heatSetpoint = 0;

    coolSetpoint = v3->_coolSetpoint;
    v3->_coolSetpoint = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThermostatClusterWeeklyScheduleTransitionStruct);
  v7 = objc_msgSend_transitionTime(self, v5, v6);
  objc_msgSend_setTransitionTime_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_heatSetpoint(self, v9, v10);
  objc_msgSend_setHeatSetpoint_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_coolSetpoint(self, v13, v14);
  objc_msgSend_setCoolSetpoint_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: transitionTime:%@; heatSetpoint:%@; coolSetpoint:%@; >",
    v5,
    self->_transitionTime,
    self->_heatSetpoint,
  v7 = self->_coolSetpoint);

  return v7;
}

- (NSNumber)transitionTime
{
  return self->_transitionTime;
}

- (void)setTransitionTime:(id)a3
{
}

- (NSNumber)heatSetpoint
{
  return self->_heatSetpoint;
}

- (void)setHeatSetpoint:(id)a3
{
}

- (NSNumber)coolSetpoint
{
  return self->_coolSetpoint;
}

- (void)setCoolSetpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coolSetpoint, 0);
  objc_storeStrong((id *)&self->_heatSetpoint, 0);

  objc_storeStrong((id *)&self->_transitionTime, 0);
}

@end