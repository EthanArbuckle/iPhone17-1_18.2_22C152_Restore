@interface MTRElectricalEnergyMeasurementClusterMeasurementAccuracyStruct
- (MTRElectricalEnergyMeasurementClusterMeasurementAccuracyStruct)init;
- (NSArray)accuracyRanges;
- (NSNumber)maxMeasuredValue;
- (NSNumber)measured;
- (NSNumber)measurementType;
- (NSNumber)minMeasuredValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAccuracyRanges:(id)a3;
- (void)setMaxMeasuredValue:(id)a3;
- (void)setMeasured:(id)a3;
- (void)setMeasurementType:(id)a3;
- (void)setMinMeasuredValue:(id)a3;
@end

@implementation MTRElectricalEnergyMeasurementClusterMeasurementAccuracyStruct

- (MTRElectricalEnergyMeasurementClusterMeasurementAccuracyStruct)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTRElectricalEnergyMeasurementClusterMeasurementAccuracyStruct;
  v2 = [(MTRElectricalEnergyMeasurementClusterMeasurementAccuracyStruct *)&v13 init];
  v3 = v2;
  if (v2)
  {
    measurementType = v2->_measurementType;
    v2->_measurementType = (NSNumber *)&unk_26F9C8620;

    measured = v3->_measured;
    v3->_measured = (NSNumber *)&unk_26F9C8620;

    minMeasuredValue = v3->_minMeasuredValue;
    v3->_minMeasuredValue = (NSNumber *)&unk_26F9C8620;

    maxMeasuredValue = v3->_maxMeasuredValue;
    v3->_maxMeasuredValue = (NSNumber *)&unk_26F9C8620;

    uint64_t v10 = objc_msgSend_array(MEMORY[0x263EFF8C0], v8, v9);
    accuracyRanges = v3->_accuracyRanges;
    v3->_accuracyRanges = (NSArray *)v10;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRElectricalEnergyMeasurementClusterMeasurementAccuracyStruct);
  v7 = objc_msgSend_measurementType(self, v5, v6);
  objc_msgSend_setMeasurementType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_measured(self, v9, v10);
  objc_msgSend_setMeasured_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_minMeasuredValue(self, v13, v14);
  objc_msgSend_setMinMeasuredValue_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_maxMeasuredValue(self, v17, v18);
  objc_msgSend_setMaxMeasuredValue_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_accuracyRanges(self, v21, v22);
  objc_msgSend_setAccuracyRanges_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: measurementType:%@; measured:%@; minMeasuredValue:%@; maxMeasuredValue:%@; accuracyRanges:%@; >",
    v5,
    self->_measurementType,
    self->_measured,
    self->_minMeasuredValue,
    self->_maxMeasuredValue,
  v7 = self->_accuracyRanges);

  return v7;
}

- (NSNumber)measurementType
{
  return self->_measurementType;
}

- (void)setMeasurementType:(id)a3
{
}

- (NSNumber)measured
{
  return self->_measured;
}

- (void)setMeasured:(id)a3
{
}

- (NSNumber)minMeasuredValue
{
  return self->_minMeasuredValue;
}

- (void)setMinMeasuredValue:(id)a3
{
}

- (NSNumber)maxMeasuredValue
{
  return self->_maxMeasuredValue;
}

- (void)setMaxMeasuredValue:(id)a3
{
}

- (NSArray)accuracyRanges
{
  return self->_accuracyRanges;
}

- (void)setAccuracyRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accuracyRanges, 0);
  objc_storeStrong((id *)&self->_maxMeasuredValue, 0);
  objc_storeStrong((id *)&self->_minMeasuredValue, 0);
  objc_storeStrong((id *)&self->_measured, 0);

  objc_storeStrong((id *)&self->_measurementType, 0);
}

@end