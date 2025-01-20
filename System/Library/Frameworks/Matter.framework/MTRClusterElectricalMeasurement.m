@interface MTRClusterElectricalMeasurement
- (MTRClusterElectricalMeasurement)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (NSDictionary)readAttributeAcActivePowerOverloadWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcCurrentDivisorWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcCurrentMultiplierWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcCurrentOverloadWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcFrequencyDivisorWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcFrequencyMaxWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcFrequencyMinWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcFrequencyMultiplierWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcFrequencyWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcOverloadAlarmsMaskWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcPowerDivisorWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcPowerMultiplierWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcReactivePowerOverloadWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcVoltageDivisorWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcVoltageMultiplierWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcVoltageOverloadWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActiveCurrentPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActiveCurrentPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActivePowerMaxPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActivePowerMaxPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActivePowerMaxWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActivePowerMinPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActivePowerMinPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActivePowerMinWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActivePowerPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActivePowerPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActivePowerWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeApparentPowerPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeApparentPowerPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeApparentPowerWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAverageRmsOverVoltageCounterPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAverageRmsOverVoltageCounterPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAverageRmsOverVoltageWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAverageRmsUnderVoltageCounterPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAverageRmsUnderVoltageCounterPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAverageRmsUnderVoltageCounterWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAverageRmsUnderVoltageWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAverageRmsVoltageMeasurementPeriodWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeCurrentOverloadWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcCurrentDivisorWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcCurrentMaxWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcCurrentMinWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcCurrentMultiplierWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcPowerDivisorWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcPowerMaxWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcPowerMinWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcPowerMultiplierWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcPowerWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcVoltageDivisorWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcVoltageMaxWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcVoltageMinWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcVoltageMultiplierWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDcVoltageWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeHarmonicCurrentMultiplierWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeInstantaneousActiveCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeInstantaneousLineCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeInstantaneousPowerWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeInstantaneousReactiveCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeInstantaneousVoltageWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeLineCurrentPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeLineCurrentPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasured11thHarmonicCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasured1stHarmonicCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasured3rdHarmonicCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasured5thHarmonicCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasured7thHarmonicCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasured9thHarmonicCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasuredPhase11thHarmonicCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasuredPhase1stHarmonicCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasuredPhase3rdHarmonicCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasuredPhase5thHarmonicCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasuredPhase7thHarmonicCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasuredPhase9thHarmonicCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeasurementTypeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeNeutralCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeOverloadAlarmsMaskWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePhaseHarmonicCurrentMultiplierWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePowerDivisorWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePowerFactorPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePowerFactorPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePowerFactorWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePowerMultiplierWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeReactiveCurrentPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeReactiveCurrentPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeReactivePowerPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeReactivePowerPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeReactivePowerWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsCurrentMaxPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsCurrentMaxPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsCurrentMaxWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsCurrentMinPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsCurrentMinPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsCurrentMinWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsCurrentPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsCurrentPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsExtremeOverVoltagePeriodPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsExtremeOverVoltagePeriodPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsExtremeOverVoltagePeriodWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsExtremeOverVoltageWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsExtremeUnderVoltagePeriodPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsExtremeUnderVoltagePeriodPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsExtremeUnderVoltagePeriodWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsExtremeUnderVoltageWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageMaxPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageMaxPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageMaxWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageMinPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageMinPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageMinWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltagePhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltagePhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageSagPeriodPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageSagPeriodPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageSagPeriodWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageSagWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageSwellPeriodPhaseBWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageSwellPeriodPhaseCWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageSwellPeriodWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageSwellWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRmsVoltageWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTotalActivePowerWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTotalApparentPowerWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTotalReactivePowerWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeVoltageOverloadWithParams:(MTRReadParams *)params;
- (void)getMeasurementProfileCommandWithParams:(MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)getMeasurementProfileCommandWithParams:(MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)getProfileInfoCommandWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)getProfileInfoCommandWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)getProfileInfoCommandWithParams:(MTRElectricalMeasurementClusterGetProfileInfoCommandParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)getProfileInfoCommandWithParams:(MTRElectricalMeasurementClusterGetProfileInfoCommandParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeAcOverloadAlarmsMaskWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeAcOverloadAlarmsMaskWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeAverageRmsUnderVoltageCounterWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeAverageRmsUnderVoltageCounterWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeAverageRmsVoltageMeasurementPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeAverageRmsVoltageMeasurementPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeOverloadAlarmsMaskWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeOverloadAlarmsMaskWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeRmsExtremeOverVoltagePeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeRmsExtremeOverVoltagePeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeRmsExtremeUnderVoltagePeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeRmsExtremeUnderVoltagePeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeRmsVoltageSagPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeRmsVoltageSagPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeRmsVoltageSwellPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeRmsVoltageSwellPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
@end

@implementation MTRClusterElectricalMeasurement

- (void)getProfileInfoCommandWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
}

- (void)getProfileInfoCommandWithParams:(MTRElectricalMeasurementClusterGetProfileInfoCommandParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v7 = completion;
  v10 = objc_msgSend_callbackQueue(self, v8, v9);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B7FBCC;
  block[3] = &unk_265194E00;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(v10, block);
}

- (void)getMeasurementProfileCommandWithParams:(MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v7 = completion;
  v10 = objc_msgSend_callbackQueue(self, v8, v9);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B7FD0C;
  block[3] = &unk_265194E00;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(v10, block);
}

- (NSDictionary)readAttributeMeasurementTypeWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA5B8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcVoltageWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA738, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcVoltageMinWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA858, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcVoltageMaxWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA870, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA750, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcCurrentMinWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA888, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcCurrentMaxWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA8A0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcPowerWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA8B8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcPowerMinWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA8D0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcPowerMaxWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA8E8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcVoltageMultiplierWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA900, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcVoltageDivisorWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA918, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcCurrentMultiplierWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA930, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcCurrentDivisorWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA948, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcPowerMultiplierWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA960, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDcPowerDivisorWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA978, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcFrequencyWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA990, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcFrequencyMinWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA9A8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcFrequencyMaxWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA9C0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeNeutralCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA9D8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTotalActivePowerWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA9F0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTotalReactivePowerWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAA08, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTotalApparentPowerWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAA20, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeasured1stHarmonicCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAA38, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeasured3rdHarmonicCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAA50, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeasured5thHarmonicCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAA68, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeasured7thHarmonicCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAA80, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeasured9thHarmonicCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAA98, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeasured11thHarmonicCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAAB0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeasuredPhase1stHarmonicCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAAC8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeasuredPhase3rdHarmonicCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAAE0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeasuredPhase5thHarmonicCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAAF8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeasuredPhase7thHarmonicCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAB10, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeasuredPhase9thHarmonicCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAB28, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeasuredPhase11thHarmonicCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAB40, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcFrequencyMultiplierWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAB58, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcFrequencyDivisorWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAB70, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePowerMultiplierWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAB88, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePowerDivisorWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CABA0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeHarmonicCurrentMultiplierWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CABB8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePhaseHarmonicCurrentMultiplierWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CABD0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeInstantaneousVoltageWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CABE8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeInstantaneousLineCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAC00, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeInstantaneousActiveCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAC18, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeInstantaneousReactiveCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAC30, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeInstantaneousPowerWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAC48, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAC60, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageMinWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAC78, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageMaxWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAC90, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CACA8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsCurrentMinWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CACC0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsCurrentMaxWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CACD8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActivePowerWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CACF0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActivePowerMinWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAD08, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActivePowerMaxWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAD20, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeReactivePowerWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAD38, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeApparentPowerWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAD50, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePowerFactorWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAD68, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAverageRmsVoltageMeasurementPeriodWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAD80, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeAverageRmsVoltageMeasurementPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeAverageRmsVoltageMeasurementPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA840, &unk_26F9CAD80, v19, v8, v11);
}

- (NSDictionary)readAttributeAverageRmsUnderVoltageCounterWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAD98, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeAverageRmsUnderVoltageCounterWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeAverageRmsUnderVoltageCounterWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA840, &unk_26F9CAD98, v19, v8, v11);
}

- (NSDictionary)readAttributeRmsExtremeOverVoltagePeriodWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CADB0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeRmsExtremeOverVoltagePeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeRmsExtremeOverVoltagePeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA840, &unk_26F9CADB0, v19, v8, v11);
}

- (NSDictionary)readAttributeRmsExtremeUnderVoltagePeriodWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CADC8, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeRmsExtremeUnderVoltagePeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeRmsExtremeUnderVoltagePeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA840, &unk_26F9CADC8, v19, v8, v11);
}

- (NSDictionary)readAttributeRmsVoltageSagPeriodWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CADE0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeRmsVoltageSagPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeRmsVoltageSagPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA840, &unk_26F9CADE0, v19, v8, v11);
}

- (NSDictionary)readAttributeRmsVoltageSwellPeriodWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CADF8, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeRmsVoltageSwellPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeRmsVoltageSwellPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA840, &unk_26F9CADF8, v19, v8, v11);
}

- (NSDictionary)readAttributeAcVoltageMultiplierWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAE10, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcVoltageDivisorWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAE28, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcCurrentMultiplierWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAE40, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcCurrentDivisorWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAE58, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcPowerMultiplierWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAE70, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcPowerDivisorWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAE88, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeOverloadAlarmsMaskWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAEA0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeOverloadAlarmsMaskWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeOverloadAlarmsMaskWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA840, &unk_26F9CAEA0, v19, v8, v11);
}

- (NSDictionary)readAttributeVoltageOverloadWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAEB8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeCurrentOverloadWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAED0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcOverloadAlarmsMaskWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAEE8, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeAcOverloadAlarmsMaskWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeAcOverloadAlarmsMaskWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA840, &unk_26F9CAEE8, v19, v8, v11);
}

- (NSDictionary)readAttributeAcVoltageOverloadWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAF00, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcCurrentOverloadWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAF18, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcActivePowerOverloadWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAF30, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcReactivePowerOverloadWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAF48, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAverageRmsOverVoltageWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAF60, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAverageRmsUnderVoltageWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAF78, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsExtremeOverVoltageWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAF90, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsExtremeUnderVoltageWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAFA8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageSagWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAFC0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageSwellWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAFD8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeLineCurrentPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CAFF0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActiveCurrentPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB008, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeReactiveCurrentPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB020, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltagePhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB038, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageMinPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB050, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageMaxPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB068, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsCurrentPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB080, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsCurrentMinPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB098, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsCurrentMaxPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB0B0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActivePowerPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB0C8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActivePowerMinPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB0E0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActivePowerMaxPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB0F8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeReactivePowerPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB110, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeApparentPowerPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB128, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePowerFactorPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB140, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB158, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAverageRmsOverVoltageCounterPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB170, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAverageRmsUnderVoltageCounterPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB188, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsExtremeOverVoltagePeriodPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB1A0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsExtremeUnderVoltagePeriodPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB1B8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageSagPeriodPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB1D0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageSwellPeriodPhaseBWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB1E8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeLineCurrentPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB200, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActiveCurrentPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB218, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeReactiveCurrentPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB230, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltagePhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB248, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageMinPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB260, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageMaxPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB278, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsCurrentPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB290, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsCurrentMinPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB2A8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsCurrentMaxPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB2C0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActivePowerPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB2D8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActivePowerMinPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB2F0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActivePowerMaxPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB308, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeReactivePowerPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB320, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeApparentPowerPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB338, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePowerFactorPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB350, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB368, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAverageRmsOverVoltageCounterPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB380, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAverageRmsUnderVoltageCounterPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB398, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsExtremeOverVoltagePeriodPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB3B0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsExtremeUnderVoltagePeriodPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB3C8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageSagPeriodPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB3E0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRmsVoltageSwellPeriodPhaseCWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CB3F8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA5E8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA600, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA618, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA630, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA840, &unk_26F9CA648, v4);

  return (NSDictionary *)v12;
}

- (MTRClusterElectricalMeasurement)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  v8 = device;
  uint64_t v9 = queue;
  id v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  uint64_t v13 = (MTRClusterElectricalMeasurement *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (void)getProfileInfoCommandWithParams:(MTRElectricalMeasurementClusterGetProfileInfoCommandParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)getProfileInfoCommandWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)getMeasurementProfileCommandWithParams:(MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

@end