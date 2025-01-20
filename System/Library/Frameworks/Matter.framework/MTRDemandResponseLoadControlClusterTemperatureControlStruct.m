@interface MTRDemandResponseLoadControlClusterTemperatureControlStruct
- (MTRDemandResponseLoadControlClusterTemperatureControlStruct)init;
- (NSNumber)coolingTempOffset;
- (NSNumber)coolingTempSetpoint;
- (NSNumber)heatingTempSetpoint;
- (NSNumber)heatingtTempOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCoolingTempOffset:(id)a3;
- (void)setCoolingTempSetpoint:(id)a3;
- (void)setHeatingTempSetpoint:(id)a3;
- (void)setHeatingtTempOffset:(id)a3;
@end

@implementation MTRDemandResponseLoadControlClusterTemperatureControlStruct

- (MTRDemandResponseLoadControlClusterTemperatureControlStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRDemandResponseLoadControlClusterTemperatureControlStruct;
  v2 = [(MTRDemandResponseLoadControlClusterTemperatureControlStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    coolingTempOffset = v2->_coolingTempOffset;
    v2->_coolingTempOffset = 0;

    heatingtTempOffset = v3->_heatingtTempOffset;
    v3->_heatingtTempOffset = 0;

    coolingTempSetpoint = v3->_coolingTempSetpoint;
    v3->_coolingTempSetpoint = 0;

    heatingTempSetpoint = v3->_heatingTempSetpoint;
    v3->_heatingTempSetpoint = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterTemperatureControlStruct);
  v7 = objc_msgSend_coolingTempOffset(self, v5, v6);
  objc_msgSend_setCoolingTempOffset_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_heatingtTempOffset(self, v9, v10);
  objc_msgSend_setHeatingtTempOffset_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_coolingTempSetpoint(self, v13, v14);
  objc_msgSend_setCoolingTempSetpoint_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_heatingTempSetpoint(self, v17, v18);
  objc_msgSend_setHeatingTempSetpoint_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: coolingTempOffset:%@; heatingtTempOffset:%@; coolingTempSetpoint:%@; heatingTempSetpoint:%@; >",
    v5,
    self->_coolingTempOffset,
    self->_heatingtTempOffset,
    self->_coolingTempSetpoint,
  v7 = self->_heatingTempSetpoint);

  return v7;
}

- (NSNumber)coolingTempOffset
{
  return self->_coolingTempOffset;
}

- (void)setCoolingTempOffset:(id)a3
{
}

- (NSNumber)heatingtTempOffset
{
  return self->_heatingtTempOffset;
}

- (void)setHeatingtTempOffset:(id)a3
{
}

- (NSNumber)coolingTempSetpoint
{
  return self->_coolingTempSetpoint;
}

- (void)setCoolingTempSetpoint:(id)a3
{
}

- (NSNumber)heatingTempSetpoint
{
  return self->_heatingTempSetpoint;
}

- (void)setHeatingTempSetpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heatingTempSetpoint, 0);
  objc_storeStrong((id *)&self->_coolingTempSetpoint, 0);
  objc_storeStrong((id *)&self->_heatingtTempOffset, 0);

  objc_storeStrong((id *)&self->_coolingTempOffset, 0);
}

@end