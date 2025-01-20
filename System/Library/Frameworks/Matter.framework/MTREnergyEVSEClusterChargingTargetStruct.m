@interface MTREnergyEVSEClusterChargingTargetStruct
- (MTREnergyEVSEClusterChargingTargetStruct)init;
- (NSNumber)addedEnergy;
- (NSNumber)targetSoC;
- (NSNumber)targetTimeMinutesPastMidnight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAddedEnergy:(id)a3;
- (void)setTargetSoC:(id)a3;
- (void)setTargetTimeMinutesPastMidnight:(id)a3;
@end

@implementation MTREnergyEVSEClusterChargingTargetStruct

- (MTREnergyEVSEClusterChargingTargetStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTREnergyEVSEClusterChargingTargetStruct;
  v2 = [(MTREnergyEVSEClusterChargingTargetStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    targetTimeMinutesPastMidnight = v2->_targetTimeMinutesPastMidnight;
    v2->_targetTimeMinutesPastMidnight = (NSNumber *)&unk_26F9C8620;

    targetSoC = v3->_targetSoC;
    v3->_targetSoC = 0;

    addedEnergy = v3->_addedEnergy;
    v3->_addedEnergy = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyEVSEClusterChargingTargetStruct);
  v7 = objc_msgSend_targetTimeMinutesPastMidnight(self, v5, v6);
  objc_msgSend_setTargetTimeMinutesPastMidnight_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_targetSoC(self, v9, v10);
  objc_msgSend_setTargetSoC_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_addedEnergy(self, v13, v14);
  objc_msgSend_setAddedEnergy_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: targetTimeMinutesPastMidnight:%@; targetSoC:%@; addedEnergy:%@; >",
    v5,
    self->_targetTimeMinutesPastMidnight,
    self->_targetSoC,
  v7 = self->_addedEnergy);

  return v7;
}

- (NSNumber)targetTimeMinutesPastMidnight
{
  return self->_targetTimeMinutesPastMidnight;
}

- (void)setTargetTimeMinutesPastMidnight:(id)a3
{
}

- (NSNumber)targetSoC
{
  return self->_targetSoC;
}

- (void)setTargetSoC:(id)a3
{
}

- (NSNumber)addedEnergy
{
  return self->_addedEnergy;
}

- (void)setAddedEnergy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedEnergy, 0);
  objc_storeStrong((id *)&self->_targetSoC, 0);

  objc_storeStrong((id *)&self->_targetTimeMinutesPastMidnight, 0);
}

@end