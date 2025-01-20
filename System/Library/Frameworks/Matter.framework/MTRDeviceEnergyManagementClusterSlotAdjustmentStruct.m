@interface MTRDeviceEnergyManagementClusterSlotAdjustmentStruct
- (MTRDeviceEnergyManagementClusterSlotAdjustmentStruct)init;
- (NSNumber)duration;
- (NSNumber)nominalPower;
- (NSNumber)slotIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDuration:(id)a3;
- (void)setNominalPower:(id)a3;
- (void)setSlotIndex:(id)a3;
@end

@implementation MTRDeviceEnergyManagementClusterSlotAdjustmentStruct

- (MTRDeviceEnergyManagementClusterSlotAdjustmentStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRDeviceEnergyManagementClusterSlotAdjustmentStruct;
  v2 = [(MTRDeviceEnergyManagementClusterSlotAdjustmentStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    slotIndex = v2->_slotIndex;
    v2->_slotIndex = (NSNumber *)&unk_26F9C8620;

    nominalPower = v3->_nominalPower;
    v3->_nominalPower = 0;

    duration = v3->_duration;
    v3->_duration = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterSlotAdjustmentStruct);
  v7 = objc_msgSend_slotIndex(self, v5, v6);
  objc_msgSend_setSlotIndex_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_nominalPower(self, v9, v10);
  objc_msgSend_setNominalPower_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_duration(self, v13, v14);
  objc_msgSend_setDuration_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: slotIndex:%@; nominalPower:%@; duration:%@; >",
    v5,
    self->_slotIndex,
    self->_nominalPower,
  v7 = self->_duration);

  return v7;
}

- (NSNumber)slotIndex
{
  return self->_slotIndex;
}

- (void)setSlotIndex:(id)a3
{
}

- (NSNumber)nominalPower
{
  return self->_nominalPower;
}

- (void)setNominalPower:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_nominalPower, 0);

  objc_storeStrong((id *)&self->_slotIndex, 0);
}

@end