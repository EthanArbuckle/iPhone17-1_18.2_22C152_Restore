@interface MTRDeviceEnergyManagementClusterPowerAdjustEndEvent
- (MTRDeviceEnergyManagementClusterPowerAdjustEndEvent)init;
- (NSNumber)cause;
- (NSNumber)duration;
- (NSNumber)energyUse;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCause:(id)a3;
- (void)setDuration:(id)a3;
- (void)setEnergyUse:(id)a3;
@end

@implementation MTRDeviceEnergyManagementClusterPowerAdjustEndEvent

- (MTRDeviceEnergyManagementClusterPowerAdjustEndEvent)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRDeviceEnergyManagementClusterPowerAdjustEndEvent;
  v2 = [(MTRDeviceEnergyManagementClusterPowerAdjustEndEvent *)&v8 init];
  v3 = v2;
  if (v2)
  {
    cause = v2->_cause;
    v2->_cause = (NSNumber *)&unk_26F9C8620;

    duration = v3->_duration;
    v3->_duration = (NSNumber *)&unk_26F9C8620;

    energyUse = v3->_energyUse;
    v3->_energyUse = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterPowerAdjustEndEvent);
  v7 = objc_msgSend_cause(self, v5, v6);
  objc_msgSend_setCause_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_duration(self, v9, v10);
  objc_msgSend_setDuration_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_energyUse(self, v13, v14);
  objc_msgSend_setEnergyUse_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: cause:%@; duration:%@; energyUse:%@; >",
    v5,
    self->_cause,
    self->_duration,
  v7 = self->_energyUse);

  return v7;
}

- (NSNumber)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSNumber)energyUse
{
  return self->_energyUse;
}

- (void)setEnergyUse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyUse, 0);
  objc_storeStrong((id *)&self->_duration, 0);

  objc_storeStrong((id *)&self->_cause, 0);
}

@end