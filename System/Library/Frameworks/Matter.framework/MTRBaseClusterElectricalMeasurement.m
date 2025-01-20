@interface MTRBaseClusterElectricalMeasurement
+ (void)readAttributeAcActivePowerOverloadWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcActivePowerOverloadWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcCurrentDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcCurrentDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcCurrentMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcCurrentMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcCurrentOverloadWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcCurrentOverloadWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcFrequencyDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcFrequencyDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcFrequencyMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcFrequencyMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcFrequencyMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcFrequencyMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcFrequencyMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcFrequencyMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcFrequencyWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcFrequencyWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcOverloadAlarmsMaskWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcOverloadAlarmsMaskWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcPowerDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcPowerDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcPowerMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcPowerMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcReactivePowerOverloadWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcReactivePowerOverloadWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcVoltageDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcVoltageDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcVoltageMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcVoltageMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcVoltageOverloadWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcVoltageOverloadWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActiveCurrentPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActiveCurrentPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActiveCurrentPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActiveCurrentPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActivePowerMaxPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActivePowerMaxPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActivePowerMaxPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActivePowerMaxPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActivePowerMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActivePowerMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActivePowerMinPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActivePowerMinPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActivePowerMinPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActivePowerMinPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActivePowerMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActivePowerMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActivePowerPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActivePowerPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActivePowerPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActivePowerPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActivePowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActivePowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeApparentPowerPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeApparentPowerPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeApparentPowerPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeApparentPowerPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeApparentPowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeApparentPowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAverageRmsOverVoltageCounterPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAverageRmsOverVoltageCounterPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAverageRmsOverVoltageCounterPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAverageRmsOverVoltageCounterPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAverageRmsOverVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAverageRmsOverVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAverageRmsUnderVoltageCounterPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAverageRmsUnderVoltageCounterPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAverageRmsUnderVoltageCounterPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAverageRmsUnderVoltageCounterPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAverageRmsUnderVoltageCounterWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAverageRmsUnderVoltageCounterWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAverageRmsUnderVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAverageRmsUnderVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAverageRmsVoltageMeasurementPeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAverageRmsVoltageMeasurementPeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeCurrentOverloadWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeCurrentOverloadWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcCurrentDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcCurrentDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcCurrentMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcCurrentMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcCurrentMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcCurrentMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcCurrentMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcCurrentMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcPowerDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcPowerDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcPowerMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcPowerMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcPowerMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcPowerMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcPowerMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcPowerMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcPowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcPowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcVoltageDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcVoltageDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcVoltageMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcVoltageMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcVoltageMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcVoltageMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcVoltageMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcVoltageMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDcVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDcVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeHarmonicCurrentMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeHarmonicCurrentMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInstantaneousActiveCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeInstantaneousActiveCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInstantaneousLineCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeInstantaneousLineCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInstantaneousPowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeInstantaneousPowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInstantaneousReactiveCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeInstantaneousReactiveCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInstantaneousVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeInstantaneousVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeLineCurrentPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeLineCurrentPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeLineCurrentPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeLineCurrentPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasured11thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasured11thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasured1stHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasured1stHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasured3rdHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasured3rdHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasured5thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasured5thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasured7thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasured7thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasured9thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasured9thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasuredPhase11thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasuredPhase11thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasuredPhase1stHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasuredPhase1stHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasuredPhase3rdHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasuredPhase3rdHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasuredPhase5thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasuredPhase5thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasuredPhase7thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasuredPhase7thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasuredPhase9thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasuredPhase9thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeasurementTypeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeasurementTypeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNeutralCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeNeutralCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeOverloadAlarmsMaskWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeOverloadAlarmsMaskWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributePhaseHarmonicCurrentMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributePhaseHarmonicCurrentMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributePowerDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributePowerDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributePowerFactorPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributePowerFactorPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributePowerFactorPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributePowerFactorPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributePowerFactorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributePowerFactorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributePowerMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributePowerMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeReactiveCurrentPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeReactiveCurrentPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeReactiveCurrentPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeReactiveCurrentPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeReactivePowerPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeReactivePowerPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeReactivePowerPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeReactivePowerPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeReactivePowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeReactivePowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsCurrentMaxPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsCurrentMaxPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsCurrentMaxPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsCurrentMaxPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsCurrentMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsCurrentMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsCurrentMinPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsCurrentMinPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsCurrentMinPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsCurrentMinPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsCurrentMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsCurrentMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsCurrentPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsCurrentPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsCurrentPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsCurrentPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsExtremeOverVoltagePeriodPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsExtremeOverVoltagePeriodPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsExtremeOverVoltagePeriodPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsExtremeOverVoltagePeriodPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsExtremeOverVoltagePeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsExtremeOverVoltagePeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsExtremeOverVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsExtremeOverVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsExtremeUnderVoltagePeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsExtremeUnderVoltagePeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsExtremeUnderVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsExtremeUnderVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageMaxPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageMaxPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageMaxPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageMaxPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageMinPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageMinPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageMinPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageMinPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltagePhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltagePhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltagePhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltagePhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageSagPeriodPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageSagPeriodPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageSagPeriodPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageSagPeriodPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageSagPeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageSagPeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageSagWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageSagWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageSwellPeriodPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageSwellPeriodPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageSwellPeriodPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageSwellPeriodPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageSwellPeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageSwellPeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageSwellWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageSwellWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRmsVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRmsVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTotalActivePowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTotalActivePowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTotalApparentPowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTotalApparentPowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTotalReactivePowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTotalReactivePowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeVoltageOverloadWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeVoltageOverloadWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
- (MTRBaseClusterElectricalMeasurement)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (void)getMeasurementProfileCommandWithParams:(MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams *)params completion:(MTRStatusCompletion)completion;
- (void)getMeasurementProfileCommandWithParams:(MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)getProfileInfoCommandWithCompletion:(MTRStatusCompletion)completion;
- (void)getProfileInfoCommandWithCompletionHandler:(MTRStatusCompletion)completionHandler;
- (void)getProfileInfoCommandWithParams:(MTRElectricalMeasurementClusterGetProfileInfoCommandParams *)params completion:(MTRStatusCompletion)completion;
- (void)getProfileInfoCommandWithParams:(MTRElectricalMeasurementClusterGetProfileInfoCommandParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)readAttributeAcActivePowerOverloadWithCompletion:(void *)completion;
- (void)readAttributeAcActivePowerOverloadWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcCurrentDivisorWithCompletion:(void *)completion;
- (void)readAttributeAcCurrentDivisorWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcCurrentMultiplierWithCompletion:(void *)completion;
- (void)readAttributeAcCurrentMultiplierWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcCurrentOverloadWithCompletion:(void *)completion;
- (void)readAttributeAcCurrentOverloadWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcFrequencyDivisorWithCompletion:(void *)completion;
- (void)readAttributeAcFrequencyDivisorWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcFrequencyMaxWithCompletion:(void *)completion;
- (void)readAttributeAcFrequencyMaxWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcFrequencyMinWithCompletion:(void *)completion;
- (void)readAttributeAcFrequencyMinWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcFrequencyMultiplierWithCompletion:(void *)completion;
- (void)readAttributeAcFrequencyMultiplierWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcFrequencyWithCompletion:(void *)completion;
- (void)readAttributeAcFrequencyWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcOverloadAlarmsMaskWithCompletion:(void *)completion;
- (void)readAttributeAcOverloadAlarmsMaskWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcPowerDivisorWithCompletion:(void *)completion;
- (void)readAttributeAcPowerDivisorWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcPowerMultiplierWithCompletion:(void *)completion;
- (void)readAttributeAcPowerMultiplierWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcReactivePowerOverloadWithCompletion:(void *)completion;
- (void)readAttributeAcReactivePowerOverloadWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcVoltageDivisorWithCompletion:(void *)completion;
- (void)readAttributeAcVoltageDivisorWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcVoltageMultiplierWithCompletion:(void *)completion;
- (void)readAttributeAcVoltageMultiplierWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcVoltageOverloadWithCompletion:(void *)completion;
- (void)readAttributeAcVoltageOverloadWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion;
- (void)readAttributeAcceptedCommandListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActiveCurrentPhaseBWithCompletion:(void *)completion;
- (void)readAttributeActiveCurrentPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActiveCurrentPhaseCWithCompletion:(void *)completion;
- (void)readAttributeActiveCurrentPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActivePowerMaxPhaseBWithCompletion:(void *)completion;
- (void)readAttributeActivePowerMaxPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActivePowerMaxPhaseCWithCompletion:(void *)completion;
- (void)readAttributeActivePowerMaxPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActivePowerMaxWithCompletion:(void *)completion;
- (void)readAttributeActivePowerMaxWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActivePowerMinPhaseBWithCompletion:(void *)completion;
- (void)readAttributeActivePowerMinPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActivePowerMinPhaseCWithCompletion:(void *)completion;
- (void)readAttributeActivePowerMinPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActivePowerMinWithCompletion:(void *)completion;
- (void)readAttributeActivePowerMinWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActivePowerPhaseBWithCompletion:(void *)completion;
- (void)readAttributeActivePowerPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActivePowerPhaseCWithCompletion:(void *)completion;
- (void)readAttributeActivePowerPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActivePowerWithCompletion:(void *)completion;
- (void)readAttributeActivePowerWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeApparentPowerPhaseBWithCompletion:(void *)completion;
- (void)readAttributeApparentPowerPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeApparentPowerPhaseCWithCompletion:(void *)completion;
- (void)readAttributeApparentPowerPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeApparentPowerWithCompletion:(void *)completion;
- (void)readAttributeApparentPowerWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAttributeListWithCompletion:(void *)completion;
- (void)readAttributeAttributeListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAverageRmsOverVoltageCounterPhaseBWithCompletion:(void *)completion;
- (void)readAttributeAverageRmsOverVoltageCounterPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAverageRmsOverVoltageCounterPhaseCWithCompletion:(void *)completion;
- (void)readAttributeAverageRmsOverVoltageCounterPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAverageRmsOverVoltageWithCompletion:(void *)completion;
- (void)readAttributeAverageRmsOverVoltageWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAverageRmsUnderVoltageCounterPhaseBWithCompletion:(void *)completion;
- (void)readAttributeAverageRmsUnderVoltageCounterPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAverageRmsUnderVoltageCounterPhaseCWithCompletion:(void *)completion;
- (void)readAttributeAverageRmsUnderVoltageCounterPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAverageRmsUnderVoltageCounterWithCompletion:(void *)completion;
- (void)readAttributeAverageRmsUnderVoltageCounterWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAverageRmsUnderVoltageWithCompletion:(void *)completion;
- (void)readAttributeAverageRmsUnderVoltageWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithCompletion:(void *)completion;
- (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithCompletion:(void *)completion;
- (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAverageRmsVoltageMeasurementPeriodWithCompletion:(void *)completion;
- (void)readAttributeAverageRmsVoltageMeasurementPeriodWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeClusterRevisionWithCompletion:(void *)completion;
- (void)readAttributeClusterRevisionWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeCurrentOverloadWithCompletion:(void *)completion;
- (void)readAttributeCurrentOverloadWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcCurrentDivisorWithCompletion:(void *)completion;
- (void)readAttributeDcCurrentDivisorWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcCurrentMaxWithCompletion:(void *)completion;
- (void)readAttributeDcCurrentMaxWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcCurrentMinWithCompletion:(void *)completion;
- (void)readAttributeDcCurrentMinWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcCurrentMultiplierWithCompletion:(void *)completion;
- (void)readAttributeDcCurrentMultiplierWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcCurrentWithCompletion:(void *)completion;
- (void)readAttributeDcCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcPowerDivisorWithCompletion:(void *)completion;
- (void)readAttributeDcPowerDivisorWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcPowerMaxWithCompletion:(void *)completion;
- (void)readAttributeDcPowerMaxWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcPowerMinWithCompletion:(void *)completion;
- (void)readAttributeDcPowerMinWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcPowerMultiplierWithCompletion:(void *)completion;
- (void)readAttributeDcPowerMultiplierWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcPowerWithCompletion:(void *)completion;
- (void)readAttributeDcPowerWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcVoltageDivisorWithCompletion:(void *)completion;
- (void)readAttributeDcVoltageDivisorWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcVoltageMaxWithCompletion:(void *)completion;
- (void)readAttributeDcVoltageMaxWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcVoltageMinWithCompletion:(void *)completion;
- (void)readAttributeDcVoltageMinWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcVoltageMultiplierWithCompletion:(void *)completion;
- (void)readAttributeDcVoltageMultiplierWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDcVoltageWithCompletion:(void *)completion;
- (void)readAttributeDcVoltageWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeFeatureMapWithCompletion:(void *)completion;
- (void)readAttributeFeatureMapWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion;
- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeHarmonicCurrentMultiplierWithCompletion:(void *)completion;
- (void)readAttributeHarmonicCurrentMultiplierWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeInstantaneousActiveCurrentWithCompletion:(void *)completion;
- (void)readAttributeInstantaneousActiveCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeInstantaneousLineCurrentWithCompletion:(void *)completion;
- (void)readAttributeInstantaneousLineCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeInstantaneousPowerWithCompletion:(void *)completion;
- (void)readAttributeInstantaneousPowerWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeInstantaneousReactiveCurrentWithCompletion:(void *)completion;
- (void)readAttributeInstantaneousReactiveCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeInstantaneousVoltageWithCompletion:(void *)completion;
- (void)readAttributeInstantaneousVoltageWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeLineCurrentPhaseBWithCompletion:(void *)completion;
- (void)readAttributeLineCurrentPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeLineCurrentPhaseCWithCompletion:(void *)completion;
- (void)readAttributeLineCurrentPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasured11thHarmonicCurrentWithCompletion:(void *)completion;
- (void)readAttributeMeasured11thHarmonicCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasured1stHarmonicCurrentWithCompletion:(void *)completion;
- (void)readAttributeMeasured1stHarmonicCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasured3rdHarmonicCurrentWithCompletion:(void *)completion;
- (void)readAttributeMeasured3rdHarmonicCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasured5thHarmonicCurrentWithCompletion:(void *)completion;
- (void)readAttributeMeasured5thHarmonicCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasured7thHarmonicCurrentWithCompletion:(void *)completion;
- (void)readAttributeMeasured7thHarmonicCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasured9thHarmonicCurrentWithCompletion:(void *)completion;
- (void)readAttributeMeasured9thHarmonicCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasuredPhase11thHarmonicCurrentWithCompletion:(void *)completion;
- (void)readAttributeMeasuredPhase11thHarmonicCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasuredPhase1stHarmonicCurrentWithCompletion:(void *)completion;
- (void)readAttributeMeasuredPhase1stHarmonicCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasuredPhase3rdHarmonicCurrentWithCompletion:(void *)completion;
- (void)readAttributeMeasuredPhase3rdHarmonicCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasuredPhase5thHarmonicCurrentWithCompletion:(void *)completion;
- (void)readAttributeMeasuredPhase5thHarmonicCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasuredPhase7thHarmonicCurrentWithCompletion:(void *)completion;
- (void)readAttributeMeasuredPhase7thHarmonicCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasuredPhase9thHarmonicCurrentWithCompletion:(void *)completion;
- (void)readAttributeMeasuredPhase9thHarmonicCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeasurementTypeWithCompletion:(void *)completion;
- (void)readAttributeMeasurementTypeWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeNeutralCurrentWithCompletion:(void *)completion;
- (void)readAttributeNeutralCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeOverloadAlarmsMaskWithCompletion:(void *)completion;
- (void)readAttributeOverloadAlarmsMaskWithCompletionHandler:(void *)completionHandler;
- (void)readAttributePhaseHarmonicCurrentMultiplierWithCompletion:(void *)completion;
- (void)readAttributePhaseHarmonicCurrentMultiplierWithCompletionHandler:(void *)completionHandler;
- (void)readAttributePowerDivisorWithCompletion:(void *)completion;
- (void)readAttributePowerDivisorWithCompletionHandler:(void *)completionHandler;
- (void)readAttributePowerFactorPhaseBWithCompletion:(void *)completion;
- (void)readAttributePowerFactorPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributePowerFactorPhaseCWithCompletion:(void *)completion;
- (void)readAttributePowerFactorPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributePowerFactorWithCompletion:(void *)completion;
- (void)readAttributePowerFactorWithCompletionHandler:(void *)completionHandler;
- (void)readAttributePowerMultiplierWithCompletion:(void *)completion;
- (void)readAttributePowerMultiplierWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeReactiveCurrentPhaseBWithCompletion:(void *)completion;
- (void)readAttributeReactiveCurrentPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeReactiveCurrentPhaseCWithCompletion:(void *)completion;
- (void)readAttributeReactiveCurrentPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeReactivePowerPhaseBWithCompletion:(void *)completion;
- (void)readAttributeReactivePowerPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeReactivePowerPhaseCWithCompletion:(void *)completion;
- (void)readAttributeReactivePowerPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeReactivePowerWithCompletion:(void *)completion;
- (void)readAttributeReactivePowerWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsCurrentMaxPhaseBWithCompletion:(void *)completion;
- (void)readAttributeRmsCurrentMaxPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsCurrentMaxPhaseCWithCompletion:(void *)completion;
- (void)readAttributeRmsCurrentMaxPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsCurrentMaxWithCompletion:(void *)completion;
- (void)readAttributeRmsCurrentMaxWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsCurrentMinPhaseBWithCompletion:(void *)completion;
- (void)readAttributeRmsCurrentMinPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsCurrentMinPhaseCWithCompletion:(void *)completion;
- (void)readAttributeRmsCurrentMinPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsCurrentMinWithCompletion:(void *)completion;
- (void)readAttributeRmsCurrentMinWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsCurrentPhaseBWithCompletion:(void *)completion;
- (void)readAttributeRmsCurrentPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsCurrentPhaseCWithCompletion:(void *)completion;
- (void)readAttributeRmsCurrentPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsCurrentWithCompletion:(void *)completion;
- (void)readAttributeRmsCurrentWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsExtremeOverVoltagePeriodPhaseBWithCompletion:(void *)completion;
- (void)readAttributeRmsExtremeOverVoltagePeriodPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsExtremeOverVoltagePeriodPhaseCWithCompletion:(void *)completion;
- (void)readAttributeRmsExtremeOverVoltagePeriodPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsExtremeOverVoltagePeriodWithCompletion:(void *)completion;
- (void)readAttributeRmsExtremeOverVoltagePeriodWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsExtremeOverVoltageWithCompletion:(void *)completion;
- (void)readAttributeRmsExtremeOverVoltageWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseBWithCompletion:(void *)completion;
- (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseCWithCompletion:(void *)completion;
- (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsExtremeUnderVoltagePeriodWithCompletion:(void *)completion;
- (void)readAttributeRmsExtremeUnderVoltagePeriodWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsExtremeUnderVoltageWithCompletion:(void *)completion;
- (void)readAttributeRmsExtremeUnderVoltageWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageMaxPhaseBWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageMaxPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageMaxPhaseCWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageMaxPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageMaxWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageMaxWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageMinPhaseBWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageMinPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageMinPhaseCWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageMinPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageMinWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageMinWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltagePhaseBWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltagePhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltagePhaseCWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltagePhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageSagPeriodPhaseBWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageSagPeriodPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageSagPeriodPhaseCWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageSagPeriodPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageSagPeriodWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageSagPeriodWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageSagWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageSagWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageSwellPeriodPhaseBWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageSwellPeriodPhaseBWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageSwellPeriodPhaseCWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageSwellPeriodPhaseCWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageSwellPeriodWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageSwellPeriodWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageSwellWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageSwellWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRmsVoltageWithCompletion:(void *)completion;
- (void)readAttributeRmsVoltageWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTotalActivePowerWithCompletion:(void *)completion;
- (void)readAttributeTotalActivePowerWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTotalApparentPowerWithCompletion:(void *)completion;
- (void)readAttributeTotalApparentPowerWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTotalReactivePowerWithCompletion:(void *)completion;
- (void)readAttributeTotalReactivePowerWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeVoltageOverloadWithCompletion:(void *)completion;
- (void)readAttributeVoltageOverloadWithCompletionHandler:(void *)completionHandler;
- (void)subscribeAttributeAcActivePowerOverloadWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcActivePowerOverloadWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcCurrentDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcCurrentDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcCurrentMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcCurrentMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcCurrentOverloadWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcCurrentOverloadWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcFrequencyDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcFrequencyDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcFrequencyMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcFrequencyMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcFrequencyMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcFrequencyMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcFrequencyMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcFrequencyMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcFrequencyWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcFrequencyWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcOverloadAlarmsMaskWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcOverloadAlarmsMaskWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcPowerDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcPowerDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcPowerMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcPowerMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcReactivePowerOverloadWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcReactivePowerOverloadWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcVoltageDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcVoltageDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcVoltageMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcVoltageMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcVoltageOverloadWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcVoltageOverloadWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcceptedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActiveCurrentPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActiveCurrentPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActiveCurrentPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActiveCurrentPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerMaxPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerMaxPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerMaxPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerMaxPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerMinPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerMinPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerMinPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerMinPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActivePowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeApparentPowerPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeApparentPowerPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeApparentPowerPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeApparentPowerPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeApparentPowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeApparentPowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttributeListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsOverVoltageCounterPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsOverVoltageCounterPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsOverVoltageCounterPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsOverVoltageCounterPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsOverVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsOverVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsUnderVoltageCounterPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsUnderVoltageCounterPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsUnderVoltageCounterPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsUnderVoltageCounterPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsUnderVoltageCounterWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsUnderVoltageCounterWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsUnderVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsUnderVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsVoltageMeasurementPeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAverageRmsVoltageMeasurementPeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeCurrentOverloadWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeCurrentOverloadWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcCurrentDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcCurrentDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcCurrentMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcCurrentMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcCurrentMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcCurrentMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcCurrentMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcCurrentMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcPowerDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcPowerDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcPowerMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcPowerMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcPowerMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcPowerMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcPowerMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcPowerMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcPowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcPowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcVoltageDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcVoltageDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcVoltageMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcVoltageMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcVoltageMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcVoltageMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcVoltageMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcVoltageMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDcVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFeatureMapWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeHarmonicCurrentMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeHarmonicCurrentMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInstantaneousActiveCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInstantaneousActiveCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInstantaneousLineCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInstantaneousLineCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInstantaneousPowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInstantaneousPowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInstantaneousReactiveCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInstantaneousReactiveCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInstantaneousVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInstantaneousVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLineCurrentPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLineCurrentPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLineCurrentPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLineCurrentPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasured11thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasured11thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasured1stHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasured1stHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasured3rdHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasured3rdHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasured5thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasured5thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasured7thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasured7thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasured9thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasured9thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasuredPhase11thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasuredPhase11thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasuredPhase1stHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasuredPhase1stHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasuredPhase3rdHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasuredPhase3rdHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasuredPhase5thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasuredPhase5thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasuredPhase7thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasuredPhase7thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasuredPhase9thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasuredPhase9thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasurementTypeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeasurementTypeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNeutralCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNeutralCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeOverloadAlarmsMaskWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeOverloadAlarmsMaskWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributePhaseHarmonicCurrentMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributePhaseHarmonicCurrentMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributePowerDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributePowerDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributePowerFactorPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributePowerFactorPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributePowerFactorPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributePowerFactorPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributePowerFactorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributePowerFactorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributePowerMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributePowerMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeReactiveCurrentPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeReactiveCurrentPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeReactiveCurrentPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeReactiveCurrentPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeReactivePowerPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeReactivePowerPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeReactivePowerPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeReactivePowerPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeReactivePowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeReactivePowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentMaxPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentMaxPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentMaxPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentMaxPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentMinPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentMinPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentMinPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentMinPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeOverVoltagePeriodPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeOverVoltagePeriodPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeOverVoltagePeriodPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeOverVoltagePeriodPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeOverVoltagePeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeOverVoltagePeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeOverVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeOverVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeUnderVoltagePeriodPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeUnderVoltagePeriodPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeUnderVoltagePeriodPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeUnderVoltagePeriodPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeUnderVoltagePeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeUnderVoltagePeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeUnderVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsExtremeUnderVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageMaxPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageMaxPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageMaxPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageMaxPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageMinPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageMinPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageMinPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageMinPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltagePhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltagePhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltagePhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltagePhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSagPeriodPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSagPeriodPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSagPeriodPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSagPeriodPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSagPeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSagPeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSagWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSagWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSwellPeriodPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSwellPeriodPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSwellPeriodPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSwellPeriodPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSwellPeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSwellPeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSwellWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageSwellWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRmsVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTotalActivePowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTotalActivePowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTotalApparentPowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTotalApparentPowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTotalReactivePowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTotalReactivePowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeVoltageOverloadWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeVoltageOverloadWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)writeAttributeAcOverloadAlarmsMaskWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeAcOverloadAlarmsMaskWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeAcOverloadAlarmsMaskWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeAcOverloadAlarmsMaskWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeAverageRmsUnderVoltageCounterWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeAverageRmsUnderVoltageCounterWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeAverageRmsUnderVoltageCounterWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeAverageRmsUnderVoltageCounterWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeAverageRmsVoltageMeasurementPeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeAverageRmsVoltageMeasurementPeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeAverageRmsVoltageMeasurementPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeAverageRmsVoltageMeasurementPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeOverloadAlarmsMaskWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeOverloadAlarmsMaskWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeOverloadAlarmsMaskWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeOverloadAlarmsMaskWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeRmsExtremeOverVoltagePeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRmsExtremeOverVoltagePeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeRmsExtremeOverVoltagePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRmsExtremeOverVoltagePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeRmsExtremeUnderVoltagePeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRmsExtremeUnderVoltagePeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeRmsExtremeUnderVoltagePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRmsExtremeUnderVoltagePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeRmsVoltageSagPeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRmsVoltageSagPeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeRmsVoltageSagPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRmsVoltageSagPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeRmsVoltageSwellPeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRmsVoltageSwellPeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeRmsVoltageSwellPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRmsVoltageSwellPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
@end

@implementation MTRBaseClusterElectricalMeasurement

- (void)getProfileInfoCommandWithCompletion:(MTRStatusCompletion)completion
{
}

- (void)getProfileInfoCommandWithParams:(MTRElectricalMeasurementClusterGetProfileInfoCommandParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v5 = completion;
  v8 = objc_msgSend_callbackQueue(self, v6, v7);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4467C;
  block[3] = &unk_265194E00;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, block);
}

- (void)getMeasurementProfileCommandWithParams:(MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v5 = completion;
  v8 = objc_msgSend_callbackQueue(self, v6, v7);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B447BC;
  block[3] = &unk_265194E00;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, block);
}

- (void)readAttributeMeasurementTypeWithCompletion:(void *)completion
{
  v4 = completion;
  uint64_t v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B448FC;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasurementTypeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B44A40;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasurementTypeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B44B5C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcVoltageWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B44CA0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B44DE4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B44F00;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcVoltageMinWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B45044;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcVoltageMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B45188;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcVoltageMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B452A4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcVoltageMaxWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B453E8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcVoltageMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4552C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcVoltageMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B45648;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4578C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B458D0;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B459EC;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcCurrentMinWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B45B30;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcCurrentMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B45C74;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcCurrentMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B45D90;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcCurrentMaxWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B45ED4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcCurrentMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B46018;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcCurrentMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B46134;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcPowerWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B46278;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcPowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B463BC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcPowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B464D8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcPowerMinWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4661C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcPowerMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B46760;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcPowerMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4687C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcPowerMaxWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B469C0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcPowerMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B46B04;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcPowerMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B46C20;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcVoltageMultiplierWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B46D64;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcVoltageMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B46EA8;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcVoltageMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B46FC4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcVoltageDivisorWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B47108;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcVoltageDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4724C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcVoltageDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B47368;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcCurrentMultiplierWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B474AC;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcCurrentMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B475F0;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcCurrentMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4770C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcCurrentDivisorWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B47850;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcCurrentDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B47994;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcCurrentDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B47AB0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcPowerMultiplierWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B47BF4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcPowerMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B47D38;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcPowerMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B47E54;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeDcPowerDivisorWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B47F98;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeDcPowerDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B480DC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeDcPowerDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B481F8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcFrequencyWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4833C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcFrequencyWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B48480;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcFrequencyWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4859C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcFrequencyMinWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B486E0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcFrequencyMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B48824;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcFrequencyMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B48940;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcFrequencyMaxWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B48A84;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcFrequencyMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B48BC8;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcFrequencyMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B48CE4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeNeutralCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B48E28;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeNeutralCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B48F6C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeNeutralCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B49088;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeTotalActivePowerWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B491CC;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeTotalActivePowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B49310;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeTotalActivePowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4942C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeTotalReactivePowerWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B49570;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeTotalReactivePowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B496B4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeTotalReactivePowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B497D0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeTotalApparentPowerWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B49914;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeTotalApparentPowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B49A58;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeTotalApparentPowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B49B74;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeMeasured1stHarmonicCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B49CB8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasured1stHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B49DFC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasured1stHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B49F18;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeMeasured3rdHarmonicCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4A05C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasured3rdHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4A1A0;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasured3rdHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4A2BC;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeMeasured5thHarmonicCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4A400;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasured5thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4A544;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasured5thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4A660;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeMeasured7thHarmonicCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4A7A4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasured7thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4A8E8;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasured7thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4AA04;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeMeasured9thHarmonicCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4AB48;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasured9thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4AC8C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasured9thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4ADA8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeMeasured11thHarmonicCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4AEEC;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasured11thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4B030;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasured11thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4B14C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeMeasuredPhase1stHarmonicCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4B290;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasuredPhase1stHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4B3D4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasuredPhase1stHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4B4F0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeMeasuredPhase3rdHarmonicCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4B634;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasuredPhase3rdHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4B778;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasuredPhase3rdHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4B894;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeMeasuredPhase5thHarmonicCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4B9D8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasuredPhase5thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4BB1C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasuredPhase5thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4BC38;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeMeasuredPhase7thHarmonicCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4BD7C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasuredPhase7thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4BEC0;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasuredPhase7thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4BFDC;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeMeasuredPhase9thHarmonicCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4C120;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasuredPhase9thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4C264;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasuredPhase9thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4C380;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeMeasuredPhase11thHarmonicCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4C4C4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeMeasuredPhase11thHarmonicCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4C608;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeMeasuredPhase11thHarmonicCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4C724;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcFrequencyMultiplierWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4C868;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcFrequencyMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4C9AC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcFrequencyMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4CAC8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcFrequencyDivisorWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4CC0C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcFrequencyDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4CD50;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcFrequencyDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4CE6C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributePowerMultiplierWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4CFB0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributePowerMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4D0F4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributePowerMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4D210;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributePowerDivisorWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4D354;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributePowerDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4D498;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributePowerDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4D5B4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeHarmonicCurrentMultiplierWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4D6F8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeHarmonicCurrentMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4D83C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeHarmonicCurrentMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4D958;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributePhaseHarmonicCurrentMultiplierWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4DA9C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributePhaseHarmonicCurrentMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4DBE0;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributePhaseHarmonicCurrentMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4DCFC;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeInstantaneousVoltageWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4DE40;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeInstantaneousVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4DF84;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeInstantaneousVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4E0A0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeInstantaneousLineCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4E1E4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeInstantaneousLineCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4E328;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeInstantaneousLineCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4E444;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeInstantaneousActiveCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4E588;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeInstantaneousActiveCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4E6CC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeInstantaneousActiveCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4E7E8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeInstantaneousReactiveCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4E92C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeInstantaneousReactiveCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4EA70;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeInstantaneousReactiveCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4EB8C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeInstantaneousPowerWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4ECD0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeInstantaneousPowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4EE14;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeInstantaneousPowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4EF30;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4F074;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4F1B8;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4F2D4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageMinWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4F418;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4F55C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4F678;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageMaxWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4F7BC;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4F900;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4FA1C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsCurrentWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4FB60;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsCurrentWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4FCA4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsCurrentWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4FDC0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsCurrentMinWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B4FF04;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsCurrentMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B50048;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsCurrentMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B50164;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsCurrentMaxWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B502A8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsCurrentMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B503EC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsCurrentMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B50508;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeActivePowerWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5064C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeActivePowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B50790;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeActivePowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B508AC;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeActivePowerMinWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B509F0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeActivePowerMinWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B50B34;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeActivePowerMinWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B50C50;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeActivePowerMaxWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B50D94;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeActivePowerMaxWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B50ED8;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeActivePowerMaxWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B50FF4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeReactivePowerWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B51138;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeReactivePowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5127C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeReactivePowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B51398;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeApparentPowerWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B514DC;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeApparentPowerWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B51620;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeApparentPowerWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5173C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributePowerFactorWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B51880;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributePowerFactorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B519C4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributePowerFactorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B51AE0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAverageRmsVoltageMeasurementPeriodWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B51C24;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeAverageRmsVoltageMeasurementPeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeAverageRmsVoltageMeasurementPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B51D74;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeAverageRmsVoltageMeasurementPeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B51EB4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAverageRmsVoltageMeasurementPeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B51FD0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAverageRmsUnderVoltageCounterWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B52114;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeAverageRmsUnderVoltageCounterWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeAverageRmsUnderVoltageCounterWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B52264;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeAverageRmsUnderVoltageCounterWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B523A4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAverageRmsUnderVoltageCounterWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B524C0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsExtremeOverVoltagePeriodWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B52604;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeRmsExtremeOverVoltagePeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeRmsExtremeOverVoltagePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B52754;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeRmsExtremeOverVoltagePeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B52894;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsExtremeOverVoltagePeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B529B0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsExtremeUnderVoltagePeriodWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B52AF4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeRmsExtremeUnderVoltagePeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeRmsExtremeUnderVoltagePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B52C44;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeRmsExtremeUnderVoltagePeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B52D84;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsExtremeUnderVoltagePeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B52EA0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageSagPeriodWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B52FE4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeRmsVoltageSagPeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeRmsVoltageSagPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B53134;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeRmsVoltageSagPeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B53274;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageSagPeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B53390;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageSwellPeriodWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B534D4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeRmsVoltageSwellPeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeRmsVoltageSwellPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B53624;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeRmsVoltageSwellPeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B53764;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageSwellPeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B53880;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcVoltageMultiplierWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B539C4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcVoltageMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B53B08;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcVoltageMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B53C24;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcVoltageDivisorWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B53D68;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcVoltageDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B53EAC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcVoltageDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B53FC8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcCurrentMultiplierWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5410C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcCurrentMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B54250;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcCurrentMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5436C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcCurrentDivisorWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B544B0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcCurrentDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B545F4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcCurrentDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B54710;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcPowerMultiplierWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B54854;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcPowerMultiplierWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B54998;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcPowerMultiplierWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B54AB4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcPowerDivisorWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B54BF8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcPowerDivisorWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B54D3C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcPowerDivisorWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B54E58;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeOverloadAlarmsMaskWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B54F9C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeOverloadAlarmsMaskWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeOverloadAlarmsMaskWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B550EC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeOverloadAlarmsMaskWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5522C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeOverloadAlarmsMaskWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B55348;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeVoltageOverloadWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5548C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeVoltageOverloadWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B555D0;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeVoltageOverloadWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B556EC;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeCurrentOverloadWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B55830;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeCurrentOverloadWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B55974;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeCurrentOverloadWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B55A90;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcOverloadAlarmsMaskWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B55BD4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeAcOverloadAlarmsMaskWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeAcOverloadAlarmsMaskWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B55D24;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeAcOverloadAlarmsMaskWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B55E64;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcOverloadAlarmsMaskWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B55F80;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcVoltageOverloadWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B560C4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcVoltageOverloadWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B56208;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcVoltageOverloadWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B56324;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcCurrentOverloadWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B56468;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcCurrentOverloadWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B565AC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcCurrentOverloadWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B566C8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcActivePowerOverloadWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5680C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcActivePowerOverloadWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B56950;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcActivePowerOverloadWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B56A6C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcReactivePowerOverloadWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B56BB0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcReactivePowerOverloadWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B56CF4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcReactivePowerOverloadWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B56E10;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAverageRmsOverVoltageWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B56F54;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAverageRmsOverVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B57098;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAverageRmsOverVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B571B4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAverageRmsUnderVoltageWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B572F8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAverageRmsUnderVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5743C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAverageRmsUnderVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B57558;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsExtremeOverVoltageWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5769C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsExtremeOverVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B577E0;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsExtremeOverVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B578FC;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsExtremeUnderVoltageWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B57A40;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsExtremeUnderVoltageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B57B84;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsExtremeUnderVoltageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B57CA0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageSagWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B57DE4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageSagWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B57F28;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageSagWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B58044;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageSwellWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B58188;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageSwellWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B582CC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageSwellWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B583E8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeLineCurrentPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5852C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeLineCurrentPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B58670;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeLineCurrentPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5878C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeActiveCurrentPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B588D0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeActiveCurrentPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B58A14;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeActiveCurrentPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B58B30;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeReactiveCurrentPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B58C74;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeReactiveCurrentPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B58DB8;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeReactiveCurrentPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B58ED4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltagePhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B59018;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltagePhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5915C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltagePhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B59278;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageMinPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B593BC;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageMinPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B59500;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageMinPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5961C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageMaxPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B59760;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageMaxPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B598A4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageMaxPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B599C0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsCurrentPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B59B04;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsCurrentPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B59C48;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsCurrentPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B59D64;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsCurrentMinPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B59EA8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsCurrentMinPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B59FEC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsCurrentMinPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5A108;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsCurrentMaxPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5A24C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsCurrentMaxPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5A390;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsCurrentMaxPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5A4AC;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeActivePowerPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5A5F0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeActivePowerPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5A734;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeActivePowerPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5A850;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeActivePowerMinPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5A994;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeActivePowerMinPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5AAD8;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeActivePowerMinPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5ABF4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeActivePowerMaxPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5AD38;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeActivePowerMaxPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5AE7C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeActivePowerMaxPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5AF98;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeReactivePowerPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5B0DC;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeReactivePowerPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5B220;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeReactivePowerPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5B33C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeApparentPowerPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5B480;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeApparentPowerPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5B5C4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeApparentPowerPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5B6E0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributePowerFactorPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5B824;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributePowerFactorPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5B968;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributePowerFactorPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5BA84;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5BBC8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5BD0C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5BE28;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAverageRmsOverVoltageCounterPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5BF6C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAverageRmsOverVoltageCounterPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5C0B0;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAverageRmsOverVoltageCounterPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5C1CC;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAverageRmsUnderVoltageCounterPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5C310;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAverageRmsUnderVoltageCounterPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5C454;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAverageRmsUnderVoltageCounterPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5C570;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsExtremeOverVoltagePeriodPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5C6B4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsExtremeOverVoltagePeriodPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5C7F8;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsExtremeOverVoltagePeriodPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5C914;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5CA58;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsExtremeUnderVoltagePeriodPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5CB9C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5CCB8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageSagPeriodPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5CDFC;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageSagPeriodPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5CF40;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageSagPeriodPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5D05C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageSwellPeriodPhaseBWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5D1A0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageSwellPeriodPhaseBWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5D2E4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageSwellPeriodPhaseBWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5D400;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeLineCurrentPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5D544;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeLineCurrentPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5D688;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeLineCurrentPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5D7A4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeActiveCurrentPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5D8E8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeActiveCurrentPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5DA2C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeActiveCurrentPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5DB48;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeReactiveCurrentPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5DC8C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeReactiveCurrentPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5DDD0;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeReactiveCurrentPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5DEEC;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltagePhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5E030;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltagePhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5E174;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltagePhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5E290;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageMinPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5E3D4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageMinPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5E518;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageMinPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5E634;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageMaxPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5E778;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageMaxPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5E8BC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageMaxPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5E9D8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsCurrentPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5EB1C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsCurrentPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5EC60;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsCurrentPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5ED7C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsCurrentMinPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5EEC0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsCurrentMinPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5F004;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsCurrentMinPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5F120;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsCurrentMaxPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5F264;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsCurrentMaxPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5F3A8;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsCurrentMaxPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5F4C4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeActivePowerPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5F608;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeActivePowerPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5F74C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeActivePowerPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5F868;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeActivePowerMinPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5F9AC;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeActivePowerMinPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5FAF0;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeActivePowerMinPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5FC0C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeActivePowerMaxPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5FD50;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeActivePowerMaxPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5FE94;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeActivePowerMaxPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B5FFB0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeReactivePowerPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B600F4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeReactivePowerPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B60238;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeReactivePowerPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B60354;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeApparentPowerPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B60498;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeApparentPowerPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B605DC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeApparentPowerPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B606F8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributePowerFactorPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B6083C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributePowerFactorPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B60980;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributePowerFactorPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B60A9C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B60BE0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B60D24;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B60E40;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAverageRmsOverVoltageCounterPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B60F84;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAverageRmsOverVoltageCounterPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B610C8;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAverageRmsOverVoltageCounterPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B611E4;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAverageRmsUnderVoltageCounterPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B61328;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAverageRmsUnderVoltageCounterPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B6146C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAverageRmsUnderVoltageCounterPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B61588;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsExtremeOverVoltagePeriodPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B616CC;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsExtremeOverVoltagePeriodPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B61810;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsExtremeOverVoltagePeriodPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B6192C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B61A70;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsExtremeUnderVoltagePeriodPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B61BB4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B61CD0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageSagPeriodPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B61E14;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageSagPeriodPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B61F58;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageSagPeriodPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B62074;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeRmsVoltageSwellPeriodPhaseCWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B621B8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeRmsVoltageSwellPeriodPhaseCWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B622FC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeRmsVoltageSwellPeriodPhaseCWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B62418;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B6255C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B626A0;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B627BC;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B62900;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B62A44;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B62B60;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAttributeListWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B62CA4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B62DE8;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B62F04;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeFeatureMapWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B63048;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B6318C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B632A8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeClusterRevisionWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B633EC;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B63530;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B6364C;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)getProfileInfoCommandWithParams:(MTRElectricalMeasurementClusterGetProfileInfoCommandParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)getProfileInfoCommandWithCompletionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)getMeasurementProfileCommandWithParams:(MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)readAttributeMeasurementTypeWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B63794;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasurementTypeWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasurementTypeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B63914;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasurementTypeWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasurementTypeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B63A3C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasurementTypeWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcVoltageWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B63AF8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcVoltageWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B63C78;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcVoltageWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B63DA0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcVoltageWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcVoltageMinWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B63E5C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcVoltageMinWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcVoltageMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B63FDC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcVoltageMinWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcVoltageMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B64104;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcVoltageMinWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcVoltageMaxWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B641C0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcVoltageMaxWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcVoltageMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B64340;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcVoltageMaxWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcVoltageMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B64468;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcVoltageMaxWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B64524;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B646A4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B647CC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcCurrentMinWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B64888;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcCurrentMinWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcCurrentMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B64A08;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcCurrentMinWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcCurrentMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B64B30;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcCurrentMinWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcCurrentMaxWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B64BEC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcCurrentMaxWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcCurrentMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B64D6C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcCurrentMaxWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcCurrentMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B64E94;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcCurrentMaxWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcPowerWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B64F50;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcPowerWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcPowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B650D0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcPowerWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcPowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B651F8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcPowerWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcPowerMinWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B652B4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcPowerMinWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcPowerMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B65434;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcPowerMinWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcPowerMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6555C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcPowerMinWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcPowerMaxWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B65618;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcPowerMaxWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcPowerMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B65798;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcPowerMaxWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcPowerMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B658C0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcPowerMaxWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcVoltageMultiplierWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6597C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcVoltageMultiplierWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcVoltageMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B65AFC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcVoltageMultiplierWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcVoltageMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B65C24;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcVoltageMultiplierWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcVoltageDivisorWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B65CE0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcVoltageDivisorWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcVoltageDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B65E60;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcVoltageDivisorWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcVoltageDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B65F88;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcVoltageDivisorWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcCurrentMultiplierWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B66044;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcCurrentMultiplierWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcCurrentMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B661C4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcCurrentMultiplierWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcCurrentMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B662EC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcCurrentMultiplierWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcCurrentDivisorWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B663A8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcCurrentDivisorWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcCurrentDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B66528;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcCurrentDivisorWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcCurrentDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B66650;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcCurrentDivisorWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcPowerMultiplierWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6670C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcPowerMultiplierWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcPowerMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6688C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcPowerMultiplierWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcPowerMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B669B4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcPowerMultiplierWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDcPowerDivisorWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B66A70;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDcPowerDivisorWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDcPowerDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B66BF0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDcPowerDivisorWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDcPowerDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B66D18;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDcPowerDivisorWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcFrequencyWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B66DD4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcFrequencyWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcFrequencyWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B66F54;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcFrequencyWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcFrequencyWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6707C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcFrequencyWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcFrequencyMinWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B67138;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcFrequencyMinWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcFrequencyMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B672B8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcFrequencyMinWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcFrequencyMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B673E0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcFrequencyMinWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcFrequencyMaxWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6749C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcFrequencyMaxWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcFrequencyMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6761C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcFrequencyMaxWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcFrequencyMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B67744;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcFrequencyMaxWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeNeutralCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B67800;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeNeutralCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeNeutralCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B67980;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeNeutralCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeNeutralCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B67AA8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeNeutralCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTotalActivePowerWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B67B64;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTotalActivePowerWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTotalActivePowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B67CE4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTotalActivePowerWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTotalActivePowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B67E0C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTotalActivePowerWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTotalReactivePowerWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B67EC8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTotalReactivePowerWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTotalReactivePowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B68048;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTotalReactivePowerWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTotalReactivePowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B68170;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTotalReactivePowerWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTotalApparentPowerWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6822C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTotalApparentPowerWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTotalApparentPowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B683AC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTotalApparentPowerWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTotalApparentPowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B684D4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTotalApparentPowerWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeasured1stHarmonicCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B68590;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasured1stHarmonicCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasured1stHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B68710;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasured1stHarmonicCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasured1stHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B68838;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasured1stHarmonicCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeasured3rdHarmonicCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B688F4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasured3rdHarmonicCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasured3rdHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B68A74;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasured3rdHarmonicCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasured3rdHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B68B9C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasured3rdHarmonicCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeasured5thHarmonicCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B68C58;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasured5thHarmonicCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasured5thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B68DD8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasured5thHarmonicCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasured5thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B68F00;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasured5thHarmonicCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeasured7thHarmonicCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B68FBC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasured7thHarmonicCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasured7thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6913C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasured7thHarmonicCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasured7thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B69264;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasured7thHarmonicCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeasured9thHarmonicCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B69320;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasured9thHarmonicCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasured9thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B694A0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasured9thHarmonicCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasured9thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B695C8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasured9thHarmonicCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeasured11thHarmonicCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B69684;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasured11thHarmonicCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasured11thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B69804;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasured11thHarmonicCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasured11thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6992C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasured11thHarmonicCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeasuredPhase1stHarmonicCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B699E8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasuredPhase1stHarmonicCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasuredPhase1stHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B69B68;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasuredPhase1stHarmonicCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasuredPhase1stHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B69C90;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasuredPhase1stHarmonicCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeasuredPhase3rdHarmonicCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B69D4C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasuredPhase3rdHarmonicCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasuredPhase3rdHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B69ECC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasuredPhase3rdHarmonicCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasuredPhase3rdHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B69FF4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasuredPhase3rdHarmonicCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeasuredPhase5thHarmonicCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6A0B0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasuredPhase5thHarmonicCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasuredPhase5thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6A230;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasuredPhase5thHarmonicCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasuredPhase5thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6A358;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasuredPhase5thHarmonicCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeasuredPhase7thHarmonicCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6A414;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasuredPhase7thHarmonicCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasuredPhase7thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6A594;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasuredPhase7thHarmonicCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasuredPhase7thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6A6BC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasuredPhase7thHarmonicCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeasuredPhase9thHarmonicCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6A778;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasuredPhase9thHarmonicCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasuredPhase9thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6A8F8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasuredPhase9thHarmonicCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasuredPhase9thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6AA20;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasuredPhase9thHarmonicCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeasuredPhase11thHarmonicCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6AADC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeasuredPhase11thHarmonicCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeasuredPhase11thHarmonicCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6AC5C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeasuredPhase11thHarmonicCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeasuredPhase11thHarmonicCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6AD84;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeasuredPhase11thHarmonicCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcFrequencyMultiplierWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6AE40;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcFrequencyMultiplierWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcFrequencyMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6AFC0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcFrequencyMultiplierWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcFrequencyMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6B0E8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcFrequencyMultiplierWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcFrequencyDivisorWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6B1A4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcFrequencyDivisorWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcFrequencyDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6B324;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcFrequencyDivisorWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcFrequencyDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6B44C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcFrequencyDivisorWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributePowerMultiplierWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6B508;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributePowerMultiplierWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributePowerMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6B688;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributePowerMultiplierWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributePowerMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6B7B0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributePowerMultiplierWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributePowerDivisorWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6B86C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributePowerDivisorWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributePowerDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6B9EC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributePowerDivisorWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributePowerDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6BB14;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributePowerDivisorWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeHarmonicCurrentMultiplierWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6BBD0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeHarmonicCurrentMultiplierWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeHarmonicCurrentMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6BD50;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeHarmonicCurrentMultiplierWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeHarmonicCurrentMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6BE78;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeHarmonicCurrentMultiplierWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributePhaseHarmonicCurrentMultiplierWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6BF34;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributePhaseHarmonicCurrentMultiplierWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributePhaseHarmonicCurrentMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6C0B4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributePhaseHarmonicCurrentMultiplierWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributePhaseHarmonicCurrentMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6C1DC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributePhaseHarmonicCurrentMultiplierWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeInstantaneousVoltageWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6C298;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeInstantaneousVoltageWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeInstantaneousVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6C418;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeInstantaneousVoltageWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeInstantaneousVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6C540;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeInstantaneousVoltageWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeInstantaneousLineCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6C5FC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeInstantaneousLineCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeInstantaneousLineCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6C77C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeInstantaneousLineCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeInstantaneousLineCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6C8A4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeInstantaneousLineCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeInstantaneousActiveCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6C960;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeInstantaneousActiveCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeInstantaneousActiveCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6CAE0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeInstantaneousActiveCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeInstantaneousActiveCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6CC08;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeInstantaneousActiveCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeInstantaneousReactiveCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6CCC4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeInstantaneousReactiveCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeInstantaneousReactiveCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6CE44;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeInstantaneousReactiveCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeInstantaneousReactiveCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6CF6C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeInstantaneousReactiveCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeInstantaneousPowerWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6D028;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeInstantaneousPowerWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeInstantaneousPowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6D1A8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeInstantaneousPowerWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeInstantaneousPowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6D2D0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeInstantaneousPowerWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6D38C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6D50C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6D634;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageMinWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6D6F0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageMinWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6D870;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageMinWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6D998;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageMinWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageMaxWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6DA54;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageMaxWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6DBD4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageMaxWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6DCFC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageMaxWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsCurrentWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6DDB8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsCurrentWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsCurrentWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6DF38;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsCurrentWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsCurrentWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6E060;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsCurrentWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsCurrentMinWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6E11C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsCurrentMinWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsCurrentMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6E29C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsCurrentMinWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsCurrentMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6E3C4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsCurrentMinWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsCurrentMaxWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6E480;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsCurrentMaxWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsCurrentMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6E600;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsCurrentMaxWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsCurrentMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6E728;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsCurrentMaxWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActivePowerWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6E7E4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActivePowerWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActivePowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6E964;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActivePowerWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActivePowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6EA8C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActivePowerWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActivePowerMinWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6EB48;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActivePowerMinWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActivePowerMinWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6ECC8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActivePowerMinWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActivePowerMinWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6EDF0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActivePowerMinWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActivePowerMaxWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6EEAC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActivePowerMaxWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActivePowerMaxWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6F02C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActivePowerMaxWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActivePowerMaxWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6F154;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActivePowerMaxWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeReactivePowerWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6F210;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeReactivePowerWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeReactivePowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6F390;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeReactivePowerWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeReactivePowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6F4B8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeReactivePowerWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeApparentPowerWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6F574;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeApparentPowerWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeApparentPowerWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6F6F4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeApparentPowerWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeApparentPowerWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6F81C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeApparentPowerWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributePowerFactorWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6F8D8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributePowerFactorWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributePowerFactorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6FA58;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributePowerFactorWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributePowerFactorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6FB80;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributePowerFactorWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAverageRmsVoltageMeasurementPeriodWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6FC3C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAverageRmsVoltageMeasurementPeriodWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeAverageRmsVoltageMeasurementPeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeAverageRmsVoltageMeasurementPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeAverageRmsVoltageMeasurementPeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B6FDCC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAverageRmsVoltageMeasurementPeriodWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAverageRmsVoltageMeasurementPeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B6FEF4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAverageRmsVoltageMeasurementPeriodWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAverageRmsUnderVoltageCounterWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B6FFB0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAverageRmsUnderVoltageCounterWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeAverageRmsUnderVoltageCounterWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeAverageRmsUnderVoltageCounterWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeAverageRmsUnderVoltageCounterWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B70140;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAverageRmsUnderVoltageCounterWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAverageRmsUnderVoltageCounterWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B70268;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAverageRmsUnderVoltageCounterWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsExtremeOverVoltagePeriodWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B70324;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsExtremeOverVoltagePeriodWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeRmsExtremeOverVoltagePeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeRmsExtremeOverVoltagePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeRmsExtremeOverVoltagePeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B704B4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsExtremeOverVoltagePeriodWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsExtremeOverVoltagePeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B705DC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsExtremeOverVoltagePeriodWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsExtremeUnderVoltagePeriodWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B70698;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsExtremeUnderVoltagePeriodWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeRmsExtremeUnderVoltagePeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeRmsExtremeUnderVoltagePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeRmsExtremeUnderVoltagePeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B70828;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsExtremeUnderVoltagePeriodWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsExtremeUnderVoltagePeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B70950;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsExtremeUnderVoltagePeriodWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageSagPeriodWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B70A0C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageSagPeriodWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeRmsVoltageSagPeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeRmsVoltageSagPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeRmsVoltageSagPeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B70B9C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageSagPeriodWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageSagPeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B70CC4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageSagPeriodWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageSwellPeriodWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B70D80;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageSwellPeriodWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeRmsVoltageSwellPeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeRmsVoltageSwellPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeRmsVoltageSwellPeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B70F10;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageSwellPeriodWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageSwellPeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B71038;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageSwellPeriodWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcVoltageMultiplierWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B710F4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcVoltageMultiplierWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcVoltageMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B71274;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcVoltageMultiplierWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcVoltageMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7139C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcVoltageMultiplierWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcVoltageDivisorWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B71458;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcVoltageDivisorWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcVoltageDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B715D8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcVoltageDivisorWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcVoltageDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B71700;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcVoltageDivisorWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcCurrentMultiplierWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B717BC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcCurrentMultiplierWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcCurrentMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7193C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcCurrentMultiplierWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcCurrentMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B71A64;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcCurrentMultiplierWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcCurrentDivisorWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B71B20;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcCurrentDivisorWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcCurrentDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B71CA0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcCurrentDivisorWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcCurrentDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B71DC8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcCurrentDivisorWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcPowerMultiplierWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B71E84;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcPowerMultiplierWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcPowerMultiplierWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B72004;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcPowerMultiplierWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcPowerMultiplierWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7212C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcPowerMultiplierWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcPowerDivisorWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B721E8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcPowerDivisorWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcPowerDivisorWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B72368;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcPowerDivisorWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcPowerDivisorWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B72490;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcPowerDivisorWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeOverloadAlarmsMaskWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7254C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeOverloadAlarmsMaskWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeOverloadAlarmsMaskWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeOverloadAlarmsMaskWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeOverloadAlarmsMaskWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B726DC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeOverloadAlarmsMaskWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeOverloadAlarmsMaskWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B72804;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeOverloadAlarmsMaskWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeVoltageOverloadWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B728C0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeVoltageOverloadWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeVoltageOverloadWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B72A40;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeVoltageOverloadWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeVoltageOverloadWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B72B68;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeVoltageOverloadWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeCurrentOverloadWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B72C24;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeCurrentOverloadWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeCurrentOverloadWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B72DA4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeCurrentOverloadWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeCurrentOverloadWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B72ECC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeCurrentOverloadWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcOverloadAlarmsMaskWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B72F88;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcOverloadAlarmsMaskWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeAcOverloadAlarmsMaskWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeAcOverloadAlarmsMaskWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeAcOverloadAlarmsMaskWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B73118;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcOverloadAlarmsMaskWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcOverloadAlarmsMaskWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B73240;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcOverloadAlarmsMaskWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcVoltageOverloadWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B732FC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcVoltageOverloadWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcVoltageOverloadWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7347C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcVoltageOverloadWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcVoltageOverloadWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B735A4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcVoltageOverloadWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcCurrentOverloadWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B73660;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcCurrentOverloadWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcCurrentOverloadWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B737E0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcCurrentOverloadWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcCurrentOverloadWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B73908;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcCurrentOverloadWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcActivePowerOverloadWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B739C4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcActivePowerOverloadWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcActivePowerOverloadWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B73B44;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcActivePowerOverloadWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcActivePowerOverloadWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B73C6C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcActivePowerOverloadWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcReactivePowerOverloadWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B73D28;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcReactivePowerOverloadWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcReactivePowerOverloadWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B73EA8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcReactivePowerOverloadWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcReactivePowerOverloadWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B73FD0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcReactivePowerOverloadWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAverageRmsOverVoltageWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7408C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAverageRmsOverVoltageWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAverageRmsOverVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7420C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAverageRmsOverVoltageWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAverageRmsOverVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B74334;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAverageRmsOverVoltageWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAverageRmsUnderVoltageWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B743F0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAverageRmsUnderVoltageWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAverageRmsUnderVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B74570;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAverageRmsUnderVoltageWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAverageRmsUnderVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B74698;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAverageRmsUnderVoltageWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsExtremeOverVoltageWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B74754;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsExtremeOverVoltageWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsExtremeOverVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B748D4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsExtremeOverVoltageWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsExtremeOverVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B749FC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsExtremeOverVoltageWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsExtremeUnderVoltageWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B74AB8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsExtremeUnderVoltageWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsExtremeUnderVoltageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B74C38;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsExtremeUnderVoltageWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsExtremeUnderVoltageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B74D60;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsExtremeUnderVoltageWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageSagWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B74E1C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageSagWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageSagWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B74F9C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageSagWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageSagWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B750C4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageSagWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageSwellWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B75180;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageSwellWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageSwellWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B75300;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageSwellWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageSwellWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B75428;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageSwellWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeLineCurrentPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B754E4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeLineCurrentPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeLineCurrentPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B75664;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeLineCurrentPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeLineCurrentPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7578C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeLineCurrentPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActiveCurrentPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B75848;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActiveCurrentPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActiveCurrentPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B759C8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActiveCurrentPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActiveCurrentPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B75AF0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActiveCurrentPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeReactiveCurrentPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B75BAC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeReactiveCurrentPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeReactiveCurrentPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B75D2C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeReactiveCurrentPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeReactiveCurrentPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B75E54;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeReactiveCurrentPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltagePhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B75F10;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltagePhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltagePhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B76090;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltagePhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltagePhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B761B8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltagePhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageMinPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B76274;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageMinPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageMinPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B763F4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageMinPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageMinPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7651C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageMinPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageMaxPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B765D8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageMaxPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageMaxPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B76758;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageMaxPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageMaxPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B76880;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageMaxPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsCurrentPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7693C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsCurrentPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsCurrentPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B76ABC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsCurrentPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsCurrentPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B76BE4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsCurrentPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsCurrentMinPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B76CA0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsCurrentMinPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsCurrentMinPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B76E20;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsCurrentMinPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsCurrentMinPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B76F48;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsCurrentMinPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsCurrentMaxPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B77004;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsCurrentMaxPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsCurrentMaxPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B77184;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsCurrentMaxPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsCurrentMaxPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B772AC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsCurrentMaxPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActivePowerPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B77368;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActivePowerPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActivePowerPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B774E8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActivePowerPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActivePowerPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B77610;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActivePowerPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActivePowerMinPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B776CC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActivePowerMinPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActivePowerMinPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7784C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActivePowerMinPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActivePowerMinPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B77974;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActivePowerMinPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActivePowerMaxPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B77A30;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActivePowerMaxPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActivePowerMaxPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B77BB0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActivePowerMaxPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActivePowerMaxPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B77CD8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActivePowerMaxPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeReactivePowerPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B77D94;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeReactivePowerPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeReactivePowerPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B77F14;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeReactivePowerPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeReactivePowerPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7803C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeReactivePowerPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeApparentPowerPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B780F8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeApparentPowerPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeApparentPowerPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B78278;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeApparentPowerPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeApparentPowerPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B783A0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeApparentPowerPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributePowerFactorPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7845C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributePowerFactorPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributePowerFactorPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B785DC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributePowerFactorPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributePowerFactorPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B78704;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributePowerFactorPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B787C0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B78940;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B78A68;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAverageRmsVoltageMeasurementPeriodPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAverageRmsOverVoltageCounterPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B78B24;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAverageRmsOverVoltageCounterPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAverageRmsOverVoltageCounterPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B78CA4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAverageRmsOverVoltageCounterPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAverageRmsOverVoltageCounterPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B78DCC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAverageRmsOverVoltageCounterPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAverageRmsUnderVoltageCounterPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B78E88;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAverageRmsUnderVoltageCounterPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAverageRmsUnderVoltageCounterPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B79008;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAverageRmsUnderVoltageCounterPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAverageRmsUnderVoltageCounterPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B79130;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAverageRmsUnderVoltageCounterPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsExtremeOverVoltagePeriodPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B791EC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsExtremeOverVoltagePeriodPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsExtremeOverVoltagePeriodPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7936C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsExtremeOverVoltagePeriodPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsExtremeOverVoltagePeriodPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B79494;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsExtremeOverVoltagePeriodPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B79550;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsExtremeUnderVoltagePeriodPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsExtremeUnderVoltagePeriodPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B796D0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsExtremeUnderVoltagePeriodPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B797F8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsExtremeUnderVoltagePeriodPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageSagPeriodPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B798B4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageSagPeriodPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageSagPeriodPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B79A34;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageSagPeriodPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageSagPeriodPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B79B5C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageSagPeriodPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageSwellPeriodPhaseBWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B79C18;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageSwellPeriodPhaseBWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageSwellPeriodPhaseBWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B79D98;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageSwellPeriodPhaseBWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageSwellPeriodPhaseBWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B79EC0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageSwellPeriodPhaseBWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeLineCurrentPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B79F7C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeLineCurrentPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeLineCurrentPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7A0FC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeLineCurrentPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeLineCurrentPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7A224;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeLineCurrentPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActiveCurrentPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7A2E0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActiveCurrentPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActiveCurrentPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7A460;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActiveCurrentPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActiveCurrentPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7A588;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActiveCurrentPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeReactiveCurrentPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7A644;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeReactiveCurrentPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeReactiveCurrentPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7A7C4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeReactiveCurrentPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeReactiveCurrentPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7A8EC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeReactiveCurrentPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltagePhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7A9A8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltagePhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltagePhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7AB28;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltagePhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltagePhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7AC50;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltagePhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageMinPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7AD0C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageMinPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageMinPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7AE8C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageMinPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageMinPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7AFB4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageMinPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageMaxPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7B070;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageMaxPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageMaxPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7B1F0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageMaxPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageMaxPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7B318;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageMaxPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsCurrentPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7B3D4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsCurrentPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsCurrentPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7B554;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsCurrentPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsCurrentPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7B67C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsCurrentPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsCurrentMinPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7B738;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsCurrentMinPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsCurrentMinPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7B8B8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsCurrentMinPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsCurrentMinPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7B9E0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsCurrentMinPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsCurrentMaxPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7BA9C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsCurrentMaxPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsCurrentMaxPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7BC1C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsCurrentMaxPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsCurrentMaxPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7BD44;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsCurrentMaxPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActivePowerPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7BE00;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActivePowerPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActivePowerPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7BF80;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActivePowerPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActivePowerPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7C0A8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActivePowerPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActivePowerMinPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7C164;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActivePowerMinPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActivePowerMinPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7C2E4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActivePowerMinPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActivePowerMinPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7C40C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActivePowerMinPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActivePowerMaxPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7C4C8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActivePowerMaxPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActivePowerMaxPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7C648;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActivePowerMaxPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActivePowerMaxPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7C770;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActivePowerMaxPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeReactivePowerPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7C82C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeReactivePowerPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeReactivePowerPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7C9AC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeReactivePowerPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeReactivePowerPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7CAD4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeReactivePowerPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeApparentPowerPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7CB90;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeApparentPowerPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeApparentPowerPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7CD10;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeApparentPowerPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeApparentPowerPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7CE38;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeApparentPowerPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributePowerFactorPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7CEF4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributePowerFactorPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributePowerFactorPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7D074;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributePowerFactorPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributePowerFactorPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7D19C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributePowerFactorPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7D258;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7D3D8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7D500;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAverageRmsVoltageMeasurementPeriodPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAverageRmsOverVoltageCounterPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7D5BC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAverageRmsOverVoltageCounterPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAverageRmsOverVoltageCounterPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7D73C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAverageRmsOverVoltageCounterPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAverageRmsOverVoltageCounterPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7D864;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAverageRmsOverVoltageCounterPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAverageRmsUnderVoltageCounterPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7D920;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAverageRmsUnderVoltageCounterPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAverageRmsUnderVoltageCounterPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7DAA0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAverageRmsUnderVoltageCounterPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAverageRmsUnderVoltageCounterPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7DBC8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAverageRmsUnderVoltageCounterPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsExtremeOverVoltagePeriodPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7DC84;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsExtremeOverVoltagePeriodPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsExtremeOverVoltagePeriodPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7DE04;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsExtremeOverVoltagePeriodPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsExtremeOverVoltagePeriodPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7DF2C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsExtremeOverVoltagePeriodPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7DFE8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsExtremeUnderVoltagePeriodPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsExtremeUnderVoltagePeriodPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7E168;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsExtremeUnderVoltagePeriodPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsExtremeUnderVoltagePeriodPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7E290;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsExtremeUnderVoltagePeriodPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageSagPeriodPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7E34C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageSagPeriodPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageSagPeriodPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7E4CC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageSagPeriodPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageSagPeriodPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7E5F4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageSagPeriodPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRmsVoltageSwellPeriodPhaseCWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7E6B0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRmsVoltageSwellPeriodPhaseCWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRmsVoltageSwellPeriodPhaseCWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7E830;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRmsVoltageSwellPeriodPhaseCWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRmsVoltageSwellPeriodPhaseCWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7E958;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRmsVoltageSwellPeriodPhaseCWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7EA14;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeGeneratedCommandListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeGeneratedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7EB94;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeGeneratedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7ECBC;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeGeneratedCommandListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcceptedCommandListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7ED78;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcceptedCommandListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcceptedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7EEF8;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcceptedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7F020;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcceptedCommandListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAttributeListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7F0DC;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAttributeListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAttributeListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7F25C;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAttributeListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7F384;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAttributeListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeFeatureMapWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7F440;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeFeatureMapWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeFeatureMapWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7F5C0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeFeatureMapWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7F6E8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeFeatureMapWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeClusterRevisionWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B7F7A4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeClusterRevisionWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeClusterRevisionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B7F924;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeClusterRevisionWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B7FA4C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeClusterRevisionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (MTRBaseClusterElectricalMeasurement)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  id v8 = device;
  id v9 = queue;
  id v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  v13 = (MTRBaseClusterElectricalMeasurement *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end