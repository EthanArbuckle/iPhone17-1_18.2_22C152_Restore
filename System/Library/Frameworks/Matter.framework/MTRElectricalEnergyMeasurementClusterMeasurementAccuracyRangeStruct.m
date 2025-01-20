@interface MTRElectricalEnergyMeasurementClusterMeasurementAccuracyRangeStruct
- (MTRElectricalEnergyMeasurementClusterMeasurementAccuracyRangeStruct)init;
- (NSNumber)fixedMax;
- (NSNumber)fixedMin;
- (NSNumber)fixedTypical;
- (NSNumber)percentMax;
- (NSNumber)percentMin;
- (NSNumber)percentTypical;
- (NSNumber)rangeMax;
- (NSNumber)rangeMin;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFixedMax:(id)a3;
- (void)setFixedMin:(id)a3;
- (void)setFixedTypical:(id)a3;
- (void)setPercentMax:(id)a3;
- (void)setPercentMin:(id)a3;
- (void)setPercentTypical:(id)a3;
- (void)setRangeMax:(id)a3;
- (void)setRangeMin:(id)a3;
@end

@implementation MTRElectricalEnergyMeasurementClusterMeasurementAccuracyRangeStruct

- (MTRElectricalEnergyMeasurementClusterMeasurementAccuracyRangeStruct)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTRElectricalEnergyMeasurementClusterMeasurementAccuracyRangeStruct;
  v2 = [(MTRElectricalEnergyMeasurementClusterMeasurementAccuracyRangeStruct *)&v13 init];
  v3 = v2;
  if (v2)
  {
    rangeMin = v2->_rangeMin;
    v2->_rangeMin = (NSNumber *)&unk_26F9C8620;

    rangeMax = v3->_rangeMax;
    v3->_rangeMax = (NSNumber *)&unk_26F9C8620;

    percentMax = v3->_percentMax;
    v3->_percentMax = 0;

    percentMin = v3->_percentMin;
    v3->_percentMin = 0;

    percentTypical = v3->_percentTypical;
    v3->_percentTypical = 0;

    fixedMax = v3->_fixedMax;
    v3->_fixedMax = 0;

    fixedMin = v3->_fixedMin;
    v3->_fixedMin = 0;

    fixedTypical = v3->_fixedTypical;
    v3->_fixedTypical = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRElectricalEnergyMeasurementClusterMeasurementAccuracyRangeStruct);
  v7 = objc_msgSend_rangeMin(self, v5, v6);
  objc_msgSend_setRangeMin_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_rangeMax(self, v9, v10);
  objc_msgSend_setRangeMax_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_percentMax(self, v13, v14);
  objc_msgSend_setPercentMax_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_percentMin(self, v17, v18);
  objc_msgSend_setPercentMin_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_percentTypical(self, v21, v22);
  objc_msgSend_setPercentTypical_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_fixedMax(self, v25, v26);
  objc_msgSend_setFixedMax_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_fixedMin(self, v29, v30);
  objc_msgSend_setFixedMin_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_fixedTypical(self, v33, v34);
  objc_msgSend_setFixedTypical_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: rangeMin:%@; rangeMax:%@; percentMax:%@; percentMin:%@; percentTypical:%@; fixedMax:%@; fixedMin:%@; fixedTypical:%@; >",
    v5,
    self->_rangeMin,
    self->_rangeMax,
    self->_percentMax,
    self->_percentMin,
    self->_percentTypical,
    self->_fixedMax,
    self->_fixedMin,
  v7 = self->_fixedTypical);

  return v7;
}

- (NSNumber)rangeMin
{
  return self->_rangeMin;
}

- (void)setRangeMin:(id)a3
{
}

- (NSNumber)rangeMax
{
  return self->_rangeMax;
}

- (void)setRangeMax:(id)a3
{
}

- (NSNumber)percentMax
{
  return self->_percentMax;
}

- (void)setPercentMax:(id)a3
{
}

- (NSNumber)percentMin
{
  return self->_percentMin;
}

- (void)setPercentMin:(id)a3
{
}

- (NSNumber)percentTypical
{
  return self->_percentTypical;
}

- (void)setPercentTypical:(id)a3
{
}

- (NSNumber)fixedMax
{
  return self->_fixedMax;
}

- (void)setFixedMax:(id)a3
{
}

- (NSNumber)fixedMin
{
  return self->_fixedMin;
}

- (void)setFixedMin:(id)a3
{
}

- (NSNumber)fixedTypical
{
  return self->_fixedTypical;
}

- (void)setFixedTypical:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedTypical, 0);
  objc_storeStrong((id *)&self->_fixedMin, 0);
  objc_storeStrong((id *)&self->_fixedMax, 0);
  objc_storeStrong((id *)&self->_percentTypical, 0);
  objc_storeStrong((id *)&self->_percentMin, 0);
  objc_storeStrong((id *)&self->_percentMax, 0);
  objc_storeStrong((id *)&self->_rangeMax, 0);

  objc_storeStrong((id *)&self->_rangeMin, 0);
}

@end