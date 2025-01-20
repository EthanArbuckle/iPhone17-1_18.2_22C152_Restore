@interface MTRElectricalMeasurementClusterGetMeasurementProfileResponseCommandParams
- (MTRElectricalMeasurementClusterGetMeasurementProfileResponseCommandParams)init;
- (MTRElectricalMeasurementClusterGetMeasurementProfileResponseCommandParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSArray)intervals;
- (NSNumber)attributeId;
- (NSNumber)numberOfIntervalsDelivered;
- (NSNumber)profileIntervalPeriod;
- (NSNumber)startTime;
- (NSNumber)status;
- (NSNumber)timedInvokeTimeoutMs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAttributeId:(NSNumber *)attributeId;
- (void)setIntervals:(NSArray *)intervals;
- (void)setNumberOfIntervalsDelivered:(NSNumber *)numberOfIntervalsDelivered;
- (void)setProfileIntervalPeriod:(NSNumber *)profileIntervalPeriod;
- (void)setStartTime:(NSNumber *)startTime;
- (void)setStatus:(NSNumber *)status;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRElectricalMeasurementClusterGetMeasurementProfileResponseCommandParams

- (MTRElectricalMeasurementClusterGetMeasurementProfileResponseCommandParams)init
{
  v15.receiver = self;
  v15.super_class = (Class)MTRElectricalMeasurementClusterGetMeasurementProfileResponseCommandParams;
  v2 = [(MTRElectricalMeasurementClusterGetMeasurementProfileResponseCommandParams *)&v15 init];
  v3 = v2;
  if (v2)
  {
    startTime = v2->_startTime;
    v2->_startTime = (NSNumber *)&unk_26F9CA828;

    status = v3->_status;
    v3->_status = (NSNumber *)&unk_26F9CA828;

    profileIntervalPeriod = v3->_profileIntervalPeriod;
    v3->_profileIntervalPeriod = (NSNumber *)&unk_26F9CA828;

    numberOfIntervalsDelivered = v3->_numberOfIntervalsDelivered;
    v3->_numberOfIntervalsDelivered = (NSNumber *)&unk_26F9CA828;

    attributeId = v3->_attributeId;
    v3->_attributeId = (NSNumber *)&unk_26F9CA828;

    uint64_t v11 = objc_msgSend_array(MEMORY[0x263EFF8C0], v9, v10);
    intervals = v3->_intervals;
    v3->_intervals = (NSArray *)v11;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRElectricalMeasurementClusterGetMeasurementProfileResponseCommandParams);
  v7 = objc_msgSend_startTime(self, v5, v6);
  objc_msgSend_setStartTime_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_status(self, v9, v10);
  objc_msgSend_setStatus_(v4, v12, (uint64_t)v11);

  objc_super v15 = objc_msgSend_profileIntervalPeriod(self, v13, v14);
  objc_msgSend_setProfileIntervalPeriod_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_numberOfIntervalsDelivered(self, v17, v18);
  objc_msgSend_setNumberOfIntervalsDelivered_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_attributeId(self, v21, v22);
  objc_msgSend_setAttributeId_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_intervals(self, v25, v26);
  objc_msgSend_setIntervals_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_timedInvokeTimeoutMs(self, v29, v30);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: startTime:%@; status:%@; profileIntervalPeriod:%@; numberOfIntervalsDelivered:%@; attributeId:%@; intervals:%@; >",
    v5,
    self->_startTime,
    self->_status,
    self->_profileIntervalPeriod,
    self->_numberOfIntervalsDelivered,
    self->_attributeId,
  v7 = self->_intervals);

  return v7;
}

- (MTRElectricalMeasurementClusterGetMeasurementProfileResponseCommandParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  if (error)
  {
    LODWORD(v7) = 45;
    *((void *)&v7 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP"
                           "/MTRBackwardsCompatShims.mm";
    int v8 = 11883;
    sub_244B26908((uint64_t)MTRError, &v7);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(NSNumber *)startTime
{
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(NSNumber *)status
{
}

- (NSNumber)profileIntervalPeriod
{
  return self->_profileIntervalPeriod;
}

- (void)setProfileIntervalPeriod:(NSNumber *)profileIntervalPeriod
{
}

- (NSNumber)numberOfIntervalsDelivered
{
  return self->_numberOfIntervalsDelivered;
}

- (void)setNumberOfIntervalsDelivered:(NSNumber *)numberOfIntervalsDelivered
{
}

- (NSNumber)attributeId
{
  return self->_attributeId;
}

- (void)setAttributeId:(NSNumber *)attributeId
{
}

- (NSArray)intervals
{
  return self->_intervals;
}

- (void)setIntervals:(NSArray *)intervals
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_intervals, 0);
  objc_storeStrong((id *)&self->_attributeId, 0);
  objc_storeStrong((id *)&self->_numberOfIntervalsDelivered, 0);
  objc_storeStrong((id *)&self->_profileIntervalPeriod, 0);
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end