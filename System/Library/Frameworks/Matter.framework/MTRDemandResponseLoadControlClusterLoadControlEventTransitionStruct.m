@interface MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct
- (MTRDemandResponseLoadControlClusterAverageLoadControlStruct)averageLoadControl;
- (MTRDemandResponseLoadControlClusterDutyCycleControlStruct)dutyCycleControl;
- (MTRDemandResponseLoadControlClusterHeatingSourceControlStruct)heatingSourceControl;
- (MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct)init;
- (MTRDemandResponseLoadControlClusterPowerSavingsControlStruct)powerSavingsControl;
- (MTRDemandResponseLoadControlClusterTemperatureControlStruct)temperatureControl;
- (NSNumber)control;
- (NSNumber)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAverageLoadControl:(id)a3;
- (void)setControl:(id)a3;
- (void)setDuration:(id)a3;
- (void)setDutyCycleControl:(id)a3;
- (void)setHeatingSourceControl:(id)a3;
- (void)setPowerSavingsControl:(id)a3;
- (void)setTemperatureControl:(id)a3;
@end

@implementation MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct

- (MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct;
  v2 = [(MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct *)&v12 init];
  v3 = v2;
  if (v2)
  {
    duration = v2->_duration;
    v2->_duration = (NSNumber *)&unk_26F9C8620;

    control = v3->_control;
    v3->_control = (NSNumber *)&unk_26F9C8620;

    temperatureControl = v3->_temperatureControl;
    v3->_temperatureControl = 0;

    averageLoadControl = v3->_averageLoadControl;
    v3->_averageLoadControl = 0;

    dutyCycleControl = v3->_dutyCycleControl;
    v3->_dutyCycleControl = 0;

    powerSavingsControl = v3->_powerSavingsControl;
    v3->_powerSavingsControl = 0;

    heatingSourceControl = v3->_heatingSourceControl;
    v3->_heatingSourceControl = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct);
  v7 = objc_msgSend_duration(self, v5, v6);
  objc_msgSend_setDuration_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_control(self, v9, v10);
  objc_msgSend_setControl_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_temperatureControl(self, v13, v14);
  objc_msgSend_setTemperatureControl_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_averageLoadControl(self, v17, v18);
  objc_msgSend_setAverageLoadControl_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_dutyCycleControl(self, v21, v22);
  objc_msgSend_setDutyCycleControl_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_powerSavingsControl(self, v25, v26);
  objc_msgSend_setPowerSavingsControl_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_heatingSourceControl(self, v29, v30);
  objc_msgSend_setHeatingSourceControl_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: duration:%@; control:%@; temperatureControl:%@; averageLoadControl:%@; dutyCycleControl:%@; powerSavingsControl:%@; heatingSourceControl:%@; >",
    v5,
    self->_duration,
    self->_control,
    self->_temperatureControl,
    self->_averageLoadControl,
    self->_dutyCycleControl,
    self->_powerSavingsControl,
  v7 = self->_heatingSourceControl);

  return v7;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
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

  objc_storeStrong((id *)&self->_duration, 0);
}

@end