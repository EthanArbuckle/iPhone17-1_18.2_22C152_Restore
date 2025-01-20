@interface MTRElectricalPowerMeasurementClusterMeasurementRangeStruct
- (MTRElectricalPowerMeasurementClusterMeasurementRangeStruct)init;
- (NSNumber)endSystime;
- (NSNumber)endTimestamp;
- (NSNumber)max;
- (NSNumber)maxSystime;
- (NSNumber)maxTimestamp;
- (NSNumber)measurementType;
- (NSNumber)min;
- (NSNumber)minSystime;
- (NSNumber)minTimestamp;
- (NSNumber)startSystime;
- (NSNumber)startTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEndSystime:(id)a3;
- (void)setEndTimestamp:(id)a3;
- (void)setMax:(id)a3;
- (void)setMaxSystime:(id)a3;
- (void)setMaxTimestamp:(id)a3;
- (void)setMeasurementType:(id)a3;
- (void)setMin:(id)a3;
- (void)setMinSystime:(id)a3;
- (void)setMinTimestamp:(id)a3;
- (void)setStartSystime:(id)a3;
- (void)setStartTimestamp:(id)a3;
@end

@implementation MTRElectricalPowerMeasurementClusterMeasurementRangeStruct

- (MTRElectricalPowerMeasurementClusterMeasurementRangeStruct)init
{
  v16.receiver = self;
  v16.super_class = (Class)MTRElectricalPowerMeasurementClusterMeasurementRangeStruct;
  v2 = [(MTRElectricalPowerMeasurementClusterMeasurementRangeStruct *)&v16 init];
  v3 = v2;
  if (v2)
  {
    measurementType = v2->_measurementType;
    v2->_measurementType = (NSNumber *)&unk_26F9C8620;

    min = v3->_min;
    v3->_min = (NSNumber *)&unk_26F9C8620;

    max = v3->_max;
    v3->_max = (NSNumber *)&unk_26F9C8620;

    startTimestamp = v3->_startTimestamp;
    v3->_startTimestamp = 0;

    endTimestamp = v3->_endTimestamp;
    v3->_endTimestamp = 0;

    minTimestamp = v3->_minTimestamp;
    v3->_minTimestamp = 0;

    maxTimestamp = v3->_maxTimestamp;
    v3->_maxTimestamp = 0;

    startSystime = v3->_startSystime;
    v3->_startSystime = 0;

    endSystime = v3->_endSystime;
    v3->_endSystime = 0;

    minSystime = v3->_minSystime;
    v3->_minSystime = 0;

    maxSystime = v3->_maxSystime;
    v3->_maxSystime = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRElectricalPowerMeasurementClusterMeasurementRangeStruct);
  v7 = objc_msgSend_measurementType(self, v5, v6);
  objc_msgSend_setMeasurementType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_min(self, v9, v10);
  objc_msgSend_setMin_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_max(self, v13, v14);
  objc_msgSend_setMax_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_startTimestamp(self, v17, v18);
  objc_msgSend_setStartTimestamp_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_endTimestamp(self, v21, v22);
  objc_msgSend_setEndTimestamp_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_minTimestamp(self, v25, v26);
  objc_msgSend_setMinTimestamp_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_maxTimestamp(self, v29, v30);
  objc_msgSend_setMaxTimestamp_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_startSystime(self, v33, v34);
  objc_msgSend_setStartSystime_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_endSystime(self, v37, v38);
  objc_msgSend_setEndSystime_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_minSystime(self, v41, v42);
  objc_msgSend_setMinSystime_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_maxSystime(self, v45, v46);
  objc_msgSend_setMaxSystime_(v4, v48, (uint64_t)v47);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: measurementType:%@; min:%@; max:%@; startTimestamp:%@; endTimestamp:%@; minTimestamp:%@; maxTimestamp:%@; startSystime:%@; endSystime:%@; minSystime:%@; maxSystime:%@; >",
    v5,
    self->_measurementType,
    self->_min,
    self->_max,
    self->_startTimestamp,
    self->_endTimestamp,
    self->_minTimestamp,
    self->_maxTimestamp,
    self->_startSystime,
    self->_endSystime,
    self->_minSystime,
  v7 = self->_maxSystime);

  return v7;
}

- (NSNumber)measurementType
{
  return self->_measurementType;
}

- (void)setMeasurementType:(id)a3
{
}

- (NSNumber)min
{
  return self->_min;
}

- (void)setMin:(id)a3
{
}

- (NSNumber)max
{
  return self->_max;
}

- (void)setMax:(id)a3
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

- (NSNumber)minTimestamp
{
  return self->_minTimestamp;
}

- (void)setMinTimestamp:(id)a3
{
}

- (NSNumber)maxTimestamp
{
  return self->_maxTimestamp;
}

- (void)setMaxTimestamp:(id)a3
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

- (NSNumber)minSystime
{
  return self->_minSystime;
}

- (void)setMinSystime:(id)a3
{
}

- (NSNumber)maxSystime
{
  return self->_maxSystime;
}

- (void)setMaxSystime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSystime, 0);
  objc_storeStrong((id *)&self->_minSystime, 0);
  objc_storeStrong((id *)&self->_endSystime, 0);
  objc_storeStrong((id *)&self->_startSystime, 0);
  objc_storeStrong((id *)&self->_maxTimestamp, 0);
  objc_storeStrong((id *)&self->_minTimestamp, 0);
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);

  objc_storeStrong((id *)&self->_measurementType, 0);
}

@end