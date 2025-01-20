@interface MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct
- (MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct)init;
- (NSNumber)endSystime;
- (NSNumber)endTimestamp;
- (NSNumber)energy;
- (NSNumber)startSystime;
- (NSNumber)startTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEndSystime:(id)a3;
- (void)setEndTimestamp:(id)a3;
- (void)setEnergy:(id)a3;
- (void)setStartSystime:(id)a3;
- (void)setStartTimestamp:(id)a3;
@end

@implementation MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct

- (MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct;
  v2 = [(MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct *)&v10 init];
  v3 = v2;
  if (v2)
  {
    energy = v2->_energy;
    v2->_energy = (NSNumber *)&unk_26F9C8620;

    startTimestamp = v3->_startTimestamp;
    v3->_startTimestamp = 0;

    endTimestamp = v3->_endTimestamp;
    v3->_endTimestamp = 0;

    startSystime = v3->_startSystime;
    v3->_startSystime = 0;

    endSystime = v3->_endSystime;
    v3->_endSystime = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct);
  v7 = objc_msgSend_energy(self, v5, v6);
  objc_msgSend_setEnergy_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_startTimestamp(self, v9, v10);
  objc_msgSend_setStartTimestamp_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_endTimestamp(self, v13, v14);
  objc_msgSend_setEndTimestamp_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_startSystime(self, v17, v18);
  objc_msgSend_setStartSystime_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_endSystime(self, v21, v22);
  objc_msgSend_setEndSystime_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: energy:%@; startTimestamp:%@; endTimestamp:%@; startSystime:%@; endSystime:%@; >",
    v5,
    self->_energy,
    self->_startTimestamp,
    self->_endTimestamp,
    self->_startSystime,
  v7 = self->_endSystime);

  return v7;
}

- (NSNumber)energy
{
  return self->_energy;
}

- (void)setEnergy:(id)a3
{
}

- (NSNumber)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(id)a3
{
}

- (NSNumber)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setEndTimestamp:(id)a3
{
}

- (NSNumber)startSystime
{
  return self->_startSystime;
}

- (void)setStartSystime:(id)a3
{
}

- (NSNumber)endSystime
{
  return self->_endSystime;
}

- (void)setEndSystime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endSystime, 0);
  objc_storeStrong((id *)&self->_startSystime, 0);
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);

  objc_storeStrong((id *)&self->_energy, 0);
}

@end