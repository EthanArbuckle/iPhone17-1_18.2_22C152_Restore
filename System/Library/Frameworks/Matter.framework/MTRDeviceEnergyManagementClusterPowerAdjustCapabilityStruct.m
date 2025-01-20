@interface MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct
- (MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct)init;
- (NSArray)powerAdjustCapability;
- (NSNumber)cause;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCause:(id)a3;
- (void)setPowerAdjustCapability:(id)a3;
@end

@implementation MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct

- (MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct;
  v2 = [(MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    powerAdjustCapability = v2->_powerAdjustCapability;
    v2->_powerAdjustCapability = 0;

    cause = v3->_cause;
    v3->_cause = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct);
  objc_super v7 = objc_msgSend_powerAdjustCapability(self, v5, v6);
  objc_msgSend_setPowerAdjustCapability_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_cause(self, v9, v10);
  objc_msgSend_setCause_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: powerAdjustCapability:%@; cause:%@; >",
    v5,
    self->_powerAdjustCapability,
  objc_super v7 = self->_cause);

  return v7;
}

- (NSArray)powerAdjustCapability
{
  return self->_powerAdjustCapability;
}

- (void)setPowerAdjustCapability:(id)a3
{
}

- (NSNumber)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cause, 0);

  objc_storeStrong((id *)&self->_powerAdjustCapability, 0);
}

@end