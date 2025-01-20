@interface MTRDeviceEnergyManagementClusterPowerAdjustStruct
- (MTRDeviceEnergyManagementClusterPowerAdjustStruct)init;
- (NSNumber)maxDuration;
- (NSNumber)maxPower;
- (NSNumber)minDuration;
- (NSNumber)minPower;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setMaxDuration:(id)a3;
- (void)setMaxPower:(id)a3;
- (void)setMinDuration:(id)a3;
- (void)setMinPower:(id)a3;
@end

@implementation MTRDeviceEnergyManagementClusterPowerAdjustStruct

- (MTRDeviceEnergyManagementClusterPowerAdjustStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRDeviceEnergyManagementClusterPowerAdjustStruct;
  v2 = [(MTRDeviceEnergyManagementClusterPowerAdjustStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    minPower = v2->_minPower;
    v2->_minPower = (NSNumber *)&unk_26F9C8620;

    maxPower = v3->_maxPower;
    v3->_maxPower = (NSNumber *)&unk_26F9C8620;

    minDuration = v3->_minDuration;
    v3->_minDuration = (NSNumber *)&unk_26F9C8620;

    maxDuration = v3->_maxDuration;
    v3->_maxDuration = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterPowerAdjustStruct);
  v7 = objc_msgSend_minPower(self, v5, v6);
  objc_msgSend_setMinPower_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_maxPower(self, v9, v10);
  objc_msgSend_setMaxPower_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_minDuration(self, v13, v14);
  objc_msgSend_setMinDuration_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_maxDuration(self, v17, v18);
  objc_msgSend_setMaxDuration_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: minPower:%@; maxPower:%@; minDuration:%@; maxDuration:%@; >",
    v5,
    self->_minPower,
    self->_maxPower,
    self->_minDuration,
  v7 = self->_maxDuration);

  return v7;
}

- (NSNumber)minPower
{
  return self->_minPower;
}

- (void)setMinPower:(id)a3
{
}

- (NSNumber)maxPower
{
  return self->_maxPower;
}

- (void)setMaxPower:(id)a3
{
}

- (NSNumber)minDuration
{
  return self->_minDuration;
}

- (void)setMinDuration:(id)a3
{
}

- (NSNumber)maxDuration
{
  return self->_maxDuration;
}

- (void)setMaxDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxDuration, 0);
  objc_storeStrong((id *)&self->_minDuration, 0);
  objc_storeStrong((id *)&self->_maxPower, 0);

  objc_storeStrong((id *)&self->_minPower, 0);
}

@end