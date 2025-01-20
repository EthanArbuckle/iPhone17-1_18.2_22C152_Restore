@interface MTREnergyEVSEClusterChargingTargetScheduleStruct
- (MTREnergyEVSEClusterChargingTargetScheduleStruct)init;
- (NSArray)chargingTargets;
- (NSNumber)dayOfWeekForSequence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setChargingTargets:(id)a3;
- (void)setDayOfWeekForSequence:(id)a3;
@end

@implementation MTREnergyEVSEClusterChargingTargetScheduleStruct

- (MTREnergyEVSEClusterChargingTargetScheduleStruct)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTREnergyEVSEClusterChargingTargetScheduleStruct;
  v2 = [(MTREnergyEVSEClusterChargingTargetScheduleStruct *)&v10 init];
  v3 = v2;
  if (v2)
  {
    dayOfWeekForSequence = v2->_dayOfWeekForSequence;
    v2->_dayOfWeekForSequence = (NSNumber *)&unk_26F9C8620;

    uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF8C0], v5, v6);
    chargingTargets = v3->_chargingTargets;
    v3->_chargingTargets = (NSArray *)v7;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyEVSEClusterChargingTargetScheduleStruct);
  uint64_t v7 = objc_msgSend_dayOfWeekForSequence(self, v5, v6);
  objc_msgSend_setDayOfWeekForSequence_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_chargingTargets(self, v9, v10);
  objc_msgSend_setChargingTargets_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: dayOfWeekForSequence:%@; chargingTargets:%@; >",
    v5,
    self->_dayOfWeekForSequence,
  uint64_t v7 = self->_chargingTargets);

  return v7;
}

- (NSNumber)dayOfWeekForSequence
{
  return self->_dayOfWeekForSequence;
}

- (void)setDayOfWeekForSequence:(id)a3
{
}

- (NSArray)chargingTargets
{
  return self->_chargingTargets;
}

- (void)setChargingTargets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargingTargets, 0);

  objc_storeStrong((id *)&self->_dayOfWeekForSequence, 0);
}

@end