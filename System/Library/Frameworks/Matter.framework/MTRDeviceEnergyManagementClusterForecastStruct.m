@interface MTRDeviceEnergyManagementClusterForecastStruct
- (MTRDeviceEnergyManagementClusterForecastStruct)init;
- (NSArray)slots;
- (NSNumber)activeSlotNumber;
- (NSNumber)earliestStartTime;
- (NSNumber)endTime;
- (NSNumber)forecastID;
- (NSNumber)forecastUpdateReason;
- (NSNumber)isPausable;
- (NSNumber)latestEndTime;
- (NSNumber)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setActiveSlotNumber:(id)a3;
- (void)setEarliestStartTime:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setForecastID:(id)a3;
- (void)setForecastUpdateReason:(id)a3;
- (void)setIsPausable:(id)a3;
- (void)setLatestEndTime:(id)a3;
- (void)setSlots:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation MTRDeviceEnergyManagementClusterForecastStruct

- (MTRDeviceEnergyManagementClusterForecastStruct)init
{
  v17.receiver = self;
  v17.super_class = (Class)MTRDeviceEnergyManagementClusterForecastStruct;
  v2 = [(MTRDeviceEnergyManagementClusterForecastStruct *)&v17 init];
  v3 = v2;
  if (v2)
  {
    forecastID = v2->_forecastID;
    v2->_forecastID = (NSNumber *)&unk_26F9C8620;

    activeSlotNumber = v3->_activeSlotNumber;
    v3->_activeSlotNumber = 0;

    startTime = v3->_startTime;
    v3->_startTime = (NSNumber *)&unk_26F9C8620;

    endTime = v3->_endTime;
    v3->_endTime = (NSNumber *)&unk_26F9C8620;

    earliestStartTime = v3->_earliestStartTime;
    v3->_earliestStartTime = 0;

    latestEndTime = v3->_latestEndTime;
    v3->_latestEndTime = 0;

    isPausable = v3->_isPausable;
    v3->_isPausable = (NSNumber *)&unk_26F9C8620;

    uint64_t v13 = objc_msgSend_array(MEMORY[0x263EFF8C0], v11, v12);
    slots = v3->_slots;
    v3->_slots = (NSArray *)v13;

    forecastUpdateReason = v3->_forecastUpdateReason;
    v3->_forecastUpdateReason = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterForecastStruct);
  v7 = objc_msgSend_forecastID(self, v5, v6);
  objc_msgSend_setForecastID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_activeSlotNumber(self, v9, v10);
  objc_msgSend_setActiveSlotNumber_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_startTime(self, v13, v14);
  objc_msgSend_setStartTime_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_endTime(self, v17, v18);
  objc_msgSend_setEndTime_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_earliestStartTime(self, v21, v22);
  objc_msgSend_setEarliestStartTime_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_latestEndTime(self, v25, v26);
  objc_msgSend_setLatestEndTime_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_isPausable(self, v29, v30);
  objc_msgSend_setIsPausable_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_slots(self, v33, v34);
  objc_msgSend_setSlots_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_forecastUpdateReason(self, v37, v38);
  objc_msgSend_setForecastUpdateReason_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: forecastID:%@; activeSlotNumber:%@; startTime:%@; endTime:%@; earliestStartTime:%@; latestEndTime:%@; isPausable:%@; slots:%@; forecastUpdateReason:%@; >",
    v5,
    self->_forecastID,
    self->_activeSlotNumber,
    self->_startTime,
    self->_endTime,
    self->_earliestStartTime,
    self->_latestEndTime,
    self->_isPausable,
    self->_slots,
  v7 = self->_forecastUpdateReason);

  return v7;
}

- (NSNumber)forecastID
{
  return self->_forecastID;
}

- (void)setForecastID:(id)a3
{
}

- (NSNumber)activeSlotNumber
{
  return self->_activeSlotNumber;
}

- (void)setActiveSlotNumber:(id)a3
{
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (NSNumber)earliestStartTime
{
  return self->_earliestStartTime;
}

- (void)setEarliestStartTime:(id)a3
{
}

- (NSNumber)latestEndTime
{
  return self->_latestEndTime;
}

- (void)setLatestEndTime:(id)a3
{
}

- (NSNumber)isPausable
{
  return self->_isPausable;
}

- (void)setIsPausable:(id)a3
{
}

- (NSArray)slots
{
  return self->_slots;
}

- (void)setSlots:(id)a3
{
}

- (NSNumber)forecastUpdateReason
{
  return self->_forecastUpdateReason;
}

- (void)setForecastUpdateReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forecastUpdateReason, 0);
  objc_storeStrong((id *)&self->_slots, 0);
  objc_storeStrong((id *)&self->_isPausable, 0);
  objc_storeStrong((id *)&self->_latestEndTime, 0);
  objc_storeStrong((id *)&self->_earliestStartTime, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_activeSlotNumber, 0);

  objc_storeStrong((id *)&self->_forecastID, 0);
}

@end