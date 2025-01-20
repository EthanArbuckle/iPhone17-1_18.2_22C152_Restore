@interface MTRDeviceEnergyManagementClusterConstraintsStruct
- (MTRDeviceEnergyManagementClusterConstraintsStruct)init;
- (NSNumber)duration;
- (NSNumber)loadControl;
- (NSNumber)maximumEnergy;
- (NSNumber)nominalPower;
- (NSNumber)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDuration:(id)a3;
- (void)setLoadControl:(id)a3;
- (void)setMaximumEnergy:(id)a3;
- (void)setNominalPower:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation MTRDeviceEnergyManagementClusterConstraintsStruct

- (MTRDeviceEnergyManagementClusterConstraintsStruct)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRDeviceEnergyManagementClusterConstraintsStruct;
  v2 = [(MTRDeviceEnergyManagementClusterConstraintsStruct *)&v10 init];
  v3 = v2;
  if (v2)
  {
    startTime = v2->_startTime;
    v2->_startTime = (NSNumber *)&unk_26F9C8620;

    duration = v3->_duration;
    v3->_duration = (NSNumber *)&unk_26F9C8620;

    nominalPower = v3->_nominalPower;
    v3->_nominalPower = 0;

    maximumEnergy = v3->_maximumEnergy;
    v3->_maximumEnergy = 0;

    loadControl = v3->_loadControl;
    v3->_loadControl = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterConstraintsStruct);
  v7 = objc_msgSend_startTime(self, v5, v6);
  objc_msgSend_setStartTime_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_duration(self, v9, v10);
  objc_msgSend_setDuration_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_nominalPower(self, v13, v14);
  objc_msgSend_setNominalPower_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_maximumEnergy(self, v17, v18);
  objc_msgSend_setMaximumEnergy_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_loadControl(self, v21, v22);
  objc_msgSend_setLoadControl_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: startTime:%@; duration:%@; nominalPower:%@; maximumEnergy:%@; loadControl:%@; >",
    v5,
    self->_startTime,
    self->_duration,
    self->_nominalPower,
    self->_maximumEnergy,
  v7 = self->_loadControl);

  return v7;
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSNumber)nominalPower
{
  return self->_nominalPower;
}

- (void)setNominalPower:(id)a3
{
}

- (NSNumber)maximumEnergy
{
  return self->_maximumEnergy;
}

- (void)setMaximumEnergy:(id)a3
{
}

- (NSNumber)loadControl
{
  return self->_loadControl;
}

- (void)setLoadControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadControl, 0);
  objc_storeStrong((id *)&self->_maximumEnergy, 0);
  objc_storeStrong((id *)&self->_nominalPower, 0);
  objc_storeStrong((id *)&self->_duration, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end