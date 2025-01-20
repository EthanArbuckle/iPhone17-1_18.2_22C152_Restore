@interface MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent
- (MTRDemandResponseLoadControlClusterAverageLoadControlStruct)averageLoadControl;
- (MTRDemandResponseLoadControlClusterDutyCycleControlStruct)dutyCycleControl;
- (MTRDemandResponseLoadControlClusterHeatingSourceControlStruct)heatingSourceControl;
- (MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent)init;
- (MTRDemandResponseLoadControlClusterPowerSavingsControlStruct)powerSavingsControl;
- (MTRDemandResponseLoadControlClusterTemperatureControlStruct)temperatureControl;
- (NSData)eventID;
- (NSNumber)control;
- (NSNumber)criticality;
- (NSNumber)status;
- (NSNumber)transitionIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAverageLoadControl:(id)a3;
- (void)setControl:(id)a3;
- (void)setCriticality:(id)a3;
- (void)setDutyCycleControl:(id)a3;
- (void)setEventID:(id)a3;
- (void)setHeatingSourceControl:(id)a3;
- (void)setPowerSavingsControl:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTemperatureControl:(id)a3;
- (void)setTransitionIndex:(id)a3;
@end

@implementation MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent

- (MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent)init
{
  v17.receiver = self;
  v17.super_class = (Class)MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent;
  v4 = [(MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent *)&v17 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    eventID = v4->_eventID;
    v4->_eventID = (NSData *)v5;

    transitionIndex = v4->_transitionIndex;
    v4->_transitionIndex = 0;

    status = v4->_status;
    v4->_status = (NSNumber *)&unk_26F9C8620;

    criticality = v4->_criticality;
    v4->_criticality = (NSNumber *)&unk_26F9C8620;

    control = v4->_control;
    v4->_control = (NSNumber *)&unk_26F9C8620;

    temperatureControl = v4->_temperatureControl;
    v4->_temperatureControl = 0;

    averageLoadControl = v4->_averageLoadControl;
    v4->_averageLoadControl = 0;

    dutyCycleControl = v4->_dutyCycleControl;
    v4->_dutyCycleControl = 0;

    powerSavingsControl = v4->_powerSavingsControl;
    v4->_powerSavingsControl = 0;

    heatingSourceControl = v4->_heatingSourceControl;
    v4->_heatingSourceControl = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent);
  v7 = objc_msgSend_eventID(self, v5, v6);
  objc_msgSend_setEventID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_transitionIndex(self, v9, v10);
  objc_msgSend_setTransitionIndex_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_status(self, v13, v14);
  objc_msgSend_setStatus_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_criticality(self, v17, v18);
  objc_msgSend_setCriticality_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_control(self, v21, v22);
  objc_msgSend_setControl_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_temperatureControl(self, v25, v26);
  objc_msgSend_setTemperatureControl_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_averageLoadControl(self, v29, v30);
  objc_msgSend_setAverageLoadControl_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_dutyCycleControl(self, v33, v34);
  objc_msgSend_setDutyCycleControl_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_powerSavingsControl(self, v37, v38);
  objc_msgSend_setPowerSavingsControl_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_heatingSourceControl(self, v41, v42);
  objc_msgSend_setHeatingSourceControl_(v4, v44, (uint64_t)v43);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_eventID, v6, 0);
  objc_msgSend_stringWithFormat_(v3, v8, @"<%@: eventID:%@; transitionIndex:%@; status:%@; criticality:%@; control:%@; temperatureControl:%@; averageLoadControl:%@; dutyCycleControl:%@; powerSavingsControl:%@; heatingSourceControl:%@; >",
    v5,
    v7,
    self->_transitionIndex,
    self->_status,
    self->_criticality,
    self->_control,
    self->_temperatureControl,
    self->_averageLoadControl,
    self->_dutyCycleControl,
    self->_powerSavingsControl,
  v9 = self->_heatingSourceControl);

  return v9;
}

- (NSData)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
}

- (NSNumber)transitionIndex
{
  return self->_transitionIndex;
}

- (void)setTransitionIndex:(id)a3
{
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSNumber)criticality
{
  return self->_criticality;
}

- (void)setCriticality:(id)a3
{
}

- (NSNumber)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
}

- (MTRDemandResponseLoadControlClusterTemperatureControlStruct)temperatureControl
{
  return self->_temperatureControl;
}

- (void)setTemperatureControl:(id)a3
{
}

- (MTRDemandResponseLoadControlClusterAverageLoadControlStruct)averageLoadControl
{
  return self->_averageLoadControl;
}

- (void)setAverageLoadControl:(id)a3
{
}

- (MTRDemandResponseLoadControlClusterDutyCycleControlStruct)dutyCycleControl
{
  return self->_dutyCycleControl;
}

- (void)setDutyCycleControl:(id)a3
{
}

- (MTRDemandResponseLoadControlClusterPowerSavingsControlStruct)powerSavingsControl
{
  return self->_powerSavingsControl;
}

- (void)setPowerSavingsControl:(id)a3
{
}

- (MTRDemandResponseLoadControlClusterHeatingSourceControlStruct)heatingSourceControl
{
  return self->_heatingSourceControl;
}

- (void)setHeatingSourceControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heatingSourceControl, 0);
  objc_storeStrong((id *)&self->_powerSavingsControl, 0);
  objc_storeStrong((id *)&self->_dutyCycleControl, 0);
  objc_storeStrong((id *)&self->_averageLoadControl, 0);
  objc_storeStrong((id *)&self->_temperatureControl, 0);
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_criticality, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_transitionIndex, 0);

  objc_storeStrong((id *)&self->_eventID, 0);
}

@end