@interface MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct
- (MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct)init;
- (NSNumber)exportedResetSystime;
- (NSNumber)exportedResetTimestamp;
- (NSNumber)importedResetSystime;
- (NSNumber)importedResetTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setExportedResetSystime:(id)a3;
- (void)setExportedResetTimestamp:(id)a3;
- (void)setImportedResetSystime:(id)a3;
- (void)setImportedResetTimestamp:(id)a3;
@end

@implementation MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct

- (MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct;
  v2 = [(MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    importedResetTimestamp = v2->_importedResetTimestamp;
    v2->_importedResetTimestamp = 0;

    exportedResetTimestamp = v3->_exportedResetTimestamp;
    v3->_exportedResetTimestamp = 0;

    importedResetSystime = v3->_importedResetSystime;
    v3->_importedResetSystime = 0;

    exportedResetSystime = v3->_exportedResetSystime;
    v3->_exportedResetSystime = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct);
  v7 = objc_msgSend_importedResetTimestamp(self, v5, v6);
  objc_msgSend_setImportedResetTimestamp_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_exportedResetTimestamp(self, v9, v10);
  objc_msgSend_setExportedResetTimestamp_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_importedResetSystime(self, v13, v14);
  objc_msgSend_setImportedResetSystime_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_exportedResetSystime(self, v17, v18);
  objc_msgSend_setExportedResetSystime_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: importedResetTimestamp:%@; exportedResetTimestamp:%@; importedResetSystime:%@; exportedResetSystime:%@; >",
    v5,
    self->_importedResetTimestamp,
    self->_exportedResetTimestamp,
    self->_importedResetSystime,
  v7 = self->_exportedResetSystime);

  return v7;
}

- (NSNumber)importedResetTimestamp
{
  return self->_importedResetTimestamp;
}

- (void)setImportedResetTimestamp:(id)a3
{
}

- (NSNumber)exportedResetTimestamp
{
  return self->_exportedResetTimestamp;
}

- (void)setExportedResetTimestamp:(id)a3
{
}

- (NSNumber)importedResetSystime
{
  return self->_importedResetSystime;
}

- (void)setImportedResetSystime:(id)a3
{
}

- (NSNumber)exportedResetSystime
{
  return self->_exportedResetSystime;
}

- (void)setExportedResetSystime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedResetSystime, 0);
  objc_storeStrong((id *)&self->_importedResetSystime, 0);
  objc_storeStrong((id *)&self->_exportedResetTimestamp, 0);

  objc_storeStrong((id *)&self->_importedResetTimestamp, 0);
}

@end