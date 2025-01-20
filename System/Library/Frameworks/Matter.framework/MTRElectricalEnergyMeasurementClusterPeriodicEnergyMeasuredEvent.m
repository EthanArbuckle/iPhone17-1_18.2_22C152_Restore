@interface MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent
- (MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct)energyExported;
- (MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct)energyImported;
- (MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEnergyExported:(id)a3;
- (void)setEnergyImported:(id)a3;
@end

@implementation MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent

- (MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent;
  v2 = [(MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent *)&v7 init];
  v3 = v2;
  if (v2)
  {
    energyImported = v2->_energyImported;
    v2->_energyImported = 0;

    energyExported = v3->_energyExported;
    v3->_energyExported = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent);
  objc_super v7 = objc_msgSend_energyImported(self, v5, v6);
  objc_msgSend_setEnergyImported_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_energyExported(self, v9, v10);
  objc_msgSend_setEnergyExported_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: energyImported:%@; energyExported:%@; >",
    v5,
    self->_energyImported,
  objc_super v7 = self->_energyExported);

  return v7;
}

- (MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct)energyImported
{
  return self->_energyImported;
}

- (void)setEnergyImported:(id)a3
{
}

- (MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct)energyExported
{
  return self->_energyExported;
}

- (void)setEnergyExported:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyExported, 0);

  objc_storeStrong((id *)&self->_energyImported, 0);
}

@end