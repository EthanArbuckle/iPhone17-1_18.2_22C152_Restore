@interface MTRDeviceEnergyManagementClusterSlotStruct
- (MTRDeviceEnergyManagementClusterSlotStruct)init;
- (NSArray)costs;
- (NSNumber)defaultDuration;
- (NSNumber)elapsedSlotTime;
- (NSNumber)manufacturerESAState;
- (NSNumber)maxDuration;
- (NSNumber)maxDurationAdjustment;
- (NSNumber)maxPauseDuration;
- (NSNumber)maxPower;
- (NSNumber)maxPowerAdjustment;
- (NSNumber)minDuration;
- (NSNumber)minDurationAdjustment;
- (NSNumber)minPauseDuration;
- (NSNumber)minPower;
- (NSNumber)minPowerAdjustment;
- (NSNumber)nominalEnergy;
- (NSNumber)nominalPower;
- (NSNumber)remainingSlotTime;
- (NSNumber)slotIsPausable;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCosts:(id)a3;
- (void)setDefaultDuration:(id)a3;
- (void)setElapsedSlotTime:(id)a3;
- (void)setManufacturerESAState:(id)a3;
- (void)setMaxDuration:(id)a3;
- (void)setMaxDurationAdjustment:(id)a3;
- (void)setMaxPauseDuration:(id)a3;
- (void)setMaxPower:(id)a3;
- (void)setMaxPowerAdjustment:(id)a3;
- (void)setMinDuration:(id)a3;
- (void)setMinDurationAdjustment:(id)a3;
- (void)setMinPauseDuration:(id)a3;
- (void)setMinPower:(id)a3;
- (void)setMinPowerAdjustment:(id)a3;
- (void)setNominalEnergy:(id)a3;
- (void)setNominalPower:(id)a3;
- (void)setRemainingSlotTime:(id)a3;
- (void)setSlotIsPausable:(id)a3;
@end

@implementation MTRDeviceEnergyManagementClusterSlotStruct

- (MTRDeviceEnergyManagementClusterSlotStruct)init
{
  v23.receiver = self;
  v23.super_class = (Class)MTRDeviceEnergyManagementClusterSlotStruct;
  v2 = [(MTRDeviceEnergyManagementClusterSlotStruct *)&v23 init];
  v3 = v2;
  if (v2)
  {
    minDuration = v2->_minDuration;
    v2->_minDuration = (NSNumber *)&unk_26F9C8620;

    maxDuration = v3->_maxDuration;
    v3->_maxDuration = (NSNumber *)&unk_26F9C8620;

    defaultDuration = v3->_defaultDuration;
    v3->_defaultDuration = (NSNumber *)&unk_26F9C8620;

    elapsedSlotTime = v3->_elapsedSlotTime;
    v3->_elapsedSlotTime = (NSNumber *)&unk_26F9C8620;

    remainingSlotTime = v3->_remainingSlotTime;
    v3->_remainingSlotTime = (NSNumber *)&unk_26F9C8620;

    slotIsPausable = v3->_slotIsPausable;
    v3->_slotIsPausable = 0;

    minPauseDuration = v3->_minPauseDuration;
    v3->_minPauseDuration = 0;

    maxPauseDuration = v3->_maxPauseDuration;
    v3->_maxPauseDuration = 0;

    manufacturerESAState = v3->_manufacturerESAState;
    v3->_manufacturerESAState = 0;

    nominalPower = v3->_nominalPower;
    v3->_nominalPower = 0;

    minPower = v3->_minPower;
    v3->_minPower = 0;

    maxPower = v3->_maxPower;
    v3->_maxPower = 0;

    nominalEnergy = v3->_nominalEnergy;
    v3->_nominalEnergy = 0;

    costs = v3->_costs;
    v3->_costs = 0;

    minPowerAdjustment = v3->_minPowerAdjustment;
    v3->_minPowerAdjustment = 0;

    maxPowerAdjustment = v3->_maxPowerAdjustment;
    v3->_maxPowerAdjustment = 0;

    minDurationAdjustment = v3->_minDurationAdjustment;
    v3->_minDurationAdjustment = 0;

    maxDurationAdjustment = v3->_maxDurationAdjustment;
    v3->_maxDurationAdjustment = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterSlotStruct);
  v7 = objc_msgSend_minDuration(self, v5, v6);
  objc_msgSend_setMinDuration_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_maxDuration(self, v9, v10);
  objc_msgSend_setMaxDuration_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_defaultDuration(self, v13, v14);
  objc_msgSend_setDefaultDuration_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_elapsedSlotTime(self, v17, v18);
  objc_msgSend_setElapsedSlotTime_(v4, v20, (uint64_t)v19);

  objc_super v23 = objc_msgSend_remainingSlotTime(self, v21, v22);
  objc_msgSend_setRemainingSlotTime_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_slotIsPausable(self, v25, v26);
  objc_msgSend_setSlotIsPausable_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_minPauseDuration(self, v29, v30);
  objc_msgSend_setMinPauseDuration_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_maxPauseDuration(self, v33, v34);
  objc_msgSend_setMaxPauseDuration_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_manufacturerESAState(self, v37, v38);
  objc_msgSend_setManufacturerESAState_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_nominalPower(self, v41, v42);
  objc_msgSend_setNominalPower_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_minPower(self, v45, v46);
  objc_msgSend_setMinPower_(v4, v48, (uint64_t)v47);

  v51 = objc_msgSend_maxPower(self, v49, v50);
  objc_msgSend_setMaxPower_(v4, v52, (uint64_t)v51);

  v55 = objc_msgSend_nominalEnergy(self, v53, v54);
  objc_msgSend_setNominalEnergy_(v4, v56, (uint64_t)v55);

  v59 = objc_msgSend_costs(self, v57, v58);
  objc_msgSend_setCosts_(v4, v60, (uint64_t)v59);

  v63 = objc_msgSend_minPowerAdjustment(self, v61, v62);
  objc_msgSend_setMinPowerAdjustment_(v4, v64, (uint64_t)v63);

  v67 = objc_msgSend_maxPowerAdjustment(self, v65, v66);
  objc_msgSend_setMaxPowerAdjustment_(v4, v68, (uint64_t)v67);

  v71 = objc_msgSend_minDurationAdjustment(self, v69, v70);
  objc_msgSend_setMinDurationAdjustment_(v4, v72, (uint64_t)v71);

  v75 = objc_msgSend_maxDurationAdjustment(self, v73, v74);
  objc_msgSend_setMaxDurationAdjustment_(v4, v76, (uint64_t)v75);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: minDuration:%@; maxDuration:%@; defaultDuration:%@; elapsedSlotTime:%@; remainingSlotTime:%@; slotIsPausable:%@; minPauseDuration:%@; maxPauseDuration:%@; manufacturerESAState:%@; nominalPower:%@; minPower:%@; maxPower:%@; nominalEnergy:%@; costs:%@; minPowerAdjustment:%@; maxPowerAdjustment:%@; minDurationAdjustment:%@; maxDurationAdjustment:%@; >",
    v5,
    self->_minDuration,
    self->_maxDuration,
    self->_defaultDuration,
    self->_elapsedSlotTime,
    self->_remainingSlotTime,
    self->_slotIsPausable,
    self->_minPauseDuration,
    self->_maxPauseDuration,
    self->_manufacturerESAState,
    self->_nominalPower,
    self->_minPower,
    self->_maxPower,
    self->_nominalEnergy,
    self->_costs,
    self->_minPowerAdjustment,
    self->_maxPowerAdjustment,
    self->_minDurationAdjustment,
  v7 = self->_maxDurationAdjustment);

  return v7;
}

- (NSNumber)minDuration
{
  return self->_minDuration;
}

- (void)setMinDuration:(id)a3
{
}

- (NSNumber)maxDuration
{
  return self->_maxDuration;
}

- (void)setMaxDuration:(id)a3
{
}

- (NSNumber)defaultDuration
{
  return self->_defaultDuration;
}

- (void)setDefaultDuration:(id)a3
{
}

- (NSNumber)elapsedSlotTime
{
  return self->_elapsedSlotTime;
}

- (void)setElapsedSlotTime:(id)a3
{
}

- (NSNumber)remainingSlotTime
{
  return self->_remainingSlotTime;
}

- (void)setRemainingSlotTime:(id)a3
{
}

- (NSNumber)slotIsPausable
{
  return self->_slotIsPausable;
}

- (void)setSlotIsPausable:(id)a3
{
}

- (NSNumber)minPauseDuration
{
  return self->_minPauseDuration;
}

- (void)setMinPauseDuration:(id)a3
{
}

- (NSNumber)maxPauseDuration
{
  return self->_maxPauseDuration;
}

- (void)setMaxPauseDuration:(id)a3
{
}

- (NSNumber)manufacturerESAState
{
  return self->_manufacturerESAState;
}

- (void)setManufacturerESAState:(id)a3
{
}

- (NSNumber)nominalPower
{
  return self->_nominalPower;
}

- (void)setNominalPower:(id)a3
{
}

- (NSNumber)minPower
{
  return self->_minPower;
}

- (void)setMinPower:(id)a3
{
}

- (NSNumber)maxPower
{
  return self->_maxPower;
}

- (void)setMaxPower:(id)a3
{
}

- (NSNumber)nominalEnergy
{
  return self->_nominalEnergy;
}

- (void)setNominalEnergy:(id)a3
{
}

- (NSArray)costs
{
  return self->_costs;
}

- (void)setCosts:(id)a3
{
}

- (NSNumber)minPowerAdjustment
{
  return self->_minPowerAdjustment;
}

- (void)setMinPowerAdjustment:(id)a3
{
}

- (NSNumber)maxPowerAdjustment
{
  return self->_maxPowerAdjustment;
}

- (void)setMaxPowerAdjustment:(id)a3
{
}

- (NSNumber)minDurationAdjustment
{
  return self->_minDurationAdjustment;
}

- (void)setMinDurationAdjustment:(id)a3
{
}

- (NSNumber)maxDurationAdjustment
{
  return self->_maxDurationAdjustment;
}

- (void)setMaxDurationAdjustment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxDurationAdjustment, 0);
  objc_storeStrong((id *)&self->_minDurationAdjustment, 0);
  objc_storeStrong((id *)&self->_maxPowerAdjustment, 0);
  objc_storeStrong((id *)&self->_minPowerAdjustment, 0);
  objc_storeStrong((id *)&self->_costs, 0);
  objc_storeStrong((id *)&self->_nominalEnergy, 0);
  objc_storeStrong((id *)&self->_maxPower, 0);
  objc_storeStrong((id *)&self->_minPower, 0);
  objc_storeStrong((id *)&self->_nominalPower, 0);
  objc_storeStrong((id *)&self->_manufacturerESAState, 0);
  objc_storeStrong((id *)&self->_maxPauseDuration, 0);
  objc_storeStrong((id *)&self->_minPauseDuration, 0);
  objc_storeStrong((id *)&self->_slotIsPausable, 0);
  objc_storeStrong((id *)&self->_remainingSlotTime, 0);
  objc_storeStrong((id *)&self->_elapsedSlotTime, 0);
  objc_storeStrong((id *)&self->_defaultDuration, 0);
  objc_storeStrong((id *)&self->_maxDuration, 0);

  objc_storeStrong((id *)&self->_minDuration, 0);
}

@end