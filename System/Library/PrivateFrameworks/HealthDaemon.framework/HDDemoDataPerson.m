@interface HDDemoDataPerson
+ (id)defaultPersonWithBiologicalSex:(int64_t)a3;
- (BOOL)createHighFidelityData;
- (BOOL)sexualActivityIsTryingToConceive;
- (BOOL)useContinuousGlucoseMonitoring;
- (HDDemoDataPerson)initWithFirstName:(id)a3 lastName:(id)a4 description:(id)a5 birthDateComponents:(id)a6 biologicalSex:(int64_t)a7;
- (HDDemoDataSleepParameters)weekdaySleepParameters;
- (HDDemoDataSleepParameters)weekendSleepParameters;
- (NSArray)weightGainHolidayDaysInYear;
- (NSDate)birthDate;
- (NSDateComponents)birthDateComponents;
- (NSDictionary)workoutPrototypesByCalendarDay;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)personDescription;
- (_HKMedicalIDData)medicalIDData;
- (double)activeCaloriesSampleFrequency;
- (double)asymmetryPercentageMean;
- (double)asymmetryPercentageSampleFrequency;
- (double)asymmetryPercentageSampleFrequencyStdDev;
- (double)asymmetryPercentageStdDev;
- (double)baseCorrectedWristSkinTemperatureInCelsius;
- (double)bedtimeNoiseStdDev;
- (double)bloodPressureSampleFrequency;
- (double)bodyTempExerciseMultiplier;
- (double)bodyTempFeverMultiplier;
- (double)bodyTempSampleFrequency;
- (double)bodyTempSampleNoiseStdDev;
- (double)breakfastTime;
- (double)breakfastTimeSampleNoiseStdDev;
- (double)continuousGlucoseMonitoringSampleFrequency;
- (double)crossCountrySkiingSpeedMean;
- (double)cyclingCadenceMean;
- (double)cyclingCadenceMeanStdDev;
- (double)cyclingFTPMean;
- (double)cyclingFTPMeanStdDev;
- (double)cyclingPowerMean;
- (double)cyclingPowerMeanStdDev;
- (double)cyclingSpeedMean;
- (double)dawnTime;
- (double)dayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius;
- (double)dinnerTime;
- (double)doubleSupportPercentageMean;
- (double)doubleSupportPercentageSampleFrequency;
- (double)doubleSupportPercentageSampleFrequencyStdDev;
- (double)doubleSupportPercentageStdDev;
- (double)exerciseCooldownTime;
- (double)exerciseGoal;
- (double)exerciseIntensityPercentage;
- (double)exercisePostDietWeeklyWorkoutsMean;
- (double)exercisePostDietWeeklyWorkoutsStdDev;
- (double)exerciseStartTime;
- (double)exerciseStartTimeStdDev;
- (double)exerciseStopTime;
- (double)exerciseStopTimeStdDev;
- (double)exerciseTimeSampleFrequency;
- (double)exerciseWeeklyWorkoutsMean;
- (double)exerciseWeeklyWorkoutsStdDev;
- (double)fallSampleFrequency;
- (double)fallsDailyMean;
- (double)fallsDailyStdDev;
- (double)fitzpatrickSkinTypeSampleTime;
- (double)flightsClimbedDailyMean;
- (double)flightsClimbedSampleFrequency;
- (double)flightsClimbedSampleFrequencyStdDev;
- (double)flightsClimbedSampleTime;
- (double)flightsClimbedStdDev;
- (double)forearmCircumferenceInInches;
- (double)genericSampleTimeNoiseStdDev;
- (double)handwashingDurationMean;
- (double)handwashingDurationMeanStdDev;
- (double)handwashingSampleFrequency;
- (double)handwashingSampleFrequencyStdDev;
- (double)heartRateRecovery;
- (double)heartRateRecoveryValueMaxConsecutiveDifference;
- (double)heartRateRecoveryValueMaxTotalDifference;
- (double)heartRateRecoveryValueStdDev;
- (double)heartRateSampleFrequency;
- (double)heartRateSampleFrequencyStdDev;
- (double)heartRateSampleNoiseStdDev;
- (double)heightSampleNoiseStdDev;
- (double)heightSampleTime;
- (double)heightSampleTimeFrequency;
- (double)heightTargetInCm;
- (double)hipCircumferenceInInches;
- (double)inBedTimeStdDev;
- (double)insulinAdherence;
- (double)insulinProduction;
- (double)insulinSensitivity;
- (double)lunchTime;
- (double)mealTimeSampleNoiseStdDev;
- (double)menstrualPeriodFrequency;
- (double)mindfulSessionFrequency;
- (double)moveGoal;
- (double)numCupsOfCoffeeDailyMean;
- (double)numCupsOfCoffeeStdDev;
- (double)numDailyFingerSticksAdherence;
- (double)ovulationIndeterminateProbabilityPercentage;
- (double)oxygenSaturationMean;
- (double)oxygenSaturationMeanAtElevation;
- (double)oxygenSaturationMeasuringSuccessRate;
- (double)oxygenSaturationMeasuringSuccessRateDuringSleep;
- (double)oxygenSaturationSampleFrequency;
- (double)oxygenSaturationStdDev;
- (double)oxygenSaturationStdDevAtElevation;
- (double)paddleSportsSpeedMean;
- (double)peripheralPerfusionIndexMean;
- (double)peripheralPerfusionIndexSampleFrequency;
- (double)peripheralPerfusionIndexStdDev;
- (double)preDietIntakeMultiplier;
- (double)rehabLogarithmicConstant;
- (double)restingCaloriesSampleFrequency;
- (double)restingDiastolicBloodPressureSampleNoiseStdDev;
- (double)restingRespirationRateSampleFrequency;
- (double)restingRespirationRateSampleFrequencyDuringSleep;
- (double)restingRespirationRateSampleNoiseStdDev;
- (double)restingSystolicBloodPressureSampleNoiseStdDev;
- (double)rowingSpeedMean;
- (double)runningGroundContactTimeMean;
- (double)runningGroundContactTimeMeanStdDev;
- (double)runningPowerMean;
- (double)runningPowerMeanStdDev;
- (double)runningStrideLengthMean;
- (double)runningStrideLengthMeanStdDev;
- (double)runningVerticalOscillationMean;
- (double)runningVerticalOscillationMeanStdDev;
- (double)sedentarySampleFrequency;
- (double)sexualActivityProbabilityPercentage;
- (double)sexualActivityProtectionDocumentationProbabilityPercentage;
- (double)sexualActivityProtectionProbabilityPercentage;
- (double)sixMinuteWalkTestDistanceMean;
- (double)sixMinuteWalkTestDistanceSampleFrequency;
- (double)sixMinuteWalkTestDistanceSampleFrequencyStdDev;
- (double)sixMinuteWalkTestDistanceStdDev;
- (double)snackTime;
- (double)speedMeanStdDev;
- (double)spirometrySampleFrequency;
- (double)spirometrySampleTime;
- (double)stairAscentSpeedMean;
- (double)stairAscentSpeedSampleFrequency;
- (double)stairAscentSpeedSampleFrequencyStdDev;
- (double)stairAscentSpeedStdDev;
- (double)stairDescentSpeedMean;
- (double)stairDescentSpeedSampleFrequency;
- (double)stairDescentSpeedSampleFrequencyStdDev;
- (double)stairDescentSpeedStdDev;
- (double)standGoal;
- (double)stepLengthMean;
- (double)stepLengthSampleFrequency;
- (double)stepLengthSampleFrequencyStdDev;
- (double)stepLengthStdDev;
- (double)stepsSampleFrequency;
- (double)stepsSampleFrequencyDuringExercise;
- (double)sunsetTime;
- (double)swimmingStrokesPerYard;
- (double)timeInDaylightDurationMean;
- (double)timeInDaylightDurationMeanStdDev;
- (double)timeInDaylightSampleFrequency;
- (double)timeInDaylightSampleFrequencyStdDev;
- (double)timeIncrement;
- (double)timeIncrementDuringExercise;
- (double)toothbrushingDurationMean;
- (double)toothbrushingDurationMeanStdDev;
- (double)underwaterDivingWaterTemperatureMean;
- (double)underwaterDivingWaterTemperatureStdDev;
- (double)uvIndexSampleFrequency;
- (double)vo2MaxSampleTimeNoiseStdDev;
- (double)vo2MaxValueMaxConsecutiveDifference;
- (double)vo2MaxValueMaxTotalDifference;
- (double)vo2MaxValueStdDev;
- (double)waistCircumferenceInInches;
- (double)wakeUpTimeNoiseStdDev;
- (double)walkingSpeedMean;
- (double)walkingSpeedSampleFrequency;
- (double)walkingSpeedSampleFrequencyStdDev;
- (double)walkingSpeedStdDev;
- (double)walkingSteadinessMean;
- (double)walkingSteadinessSampleFrequency;
- (double)walkingSteadinessSampleFrequencyStdDev;
- (double)walkingSteadinessStdDev;
- (double)waterConsumedDailyMean;
- (double)waterConsumedIntervalMean;
- (double)waterConsumedIntervalStdDev;
- (double)waterConsumedSampleFrequency;
- (double)waterConsumedSampleTime;
- (double)waterConsumedStdDev;
- (double)weightChangePercentageMax;
- (double)weightDailyChangeStdDev;
- (double)weightDailyMaxLoss;
- (double)weightLossStartDay;
- (double)weightSampleNoiseStdDev;
- (double)weightSampleTime;
- (double)weightSampleTimeFrequency;
- (double)weightTargetInKg;
- (double)wristCircumferenceInInches;
- (id)fullName;
- (int64_t)asthmaSeverity;
- (int64_t)biologicalSex;
- (int64_t)bloodType;
- (int64_t)fitzpatrickSkinType;
- (int64_t)fitzpatrickSkinTypeScore;
- (int64_t)mindfulSessionMean;
- (int64_t)mindfulSessionStdDev;
- (int64_t)nutritionTrackingType;
- (int64_t)profileType;
- (int64_t)restingDiastolicBloodPressure;
- (int64_t)restingHeartRate;
- (int64_t)restingHeartRateMaxDailyDifference;
- (int64_t)restingHeartRateMaxTotalDifference;
- (int64_t)restingRespirationRate;
- (int64_t)restingSystolicBloodPressure;
- (int64_t)resultsTrackingType;
- (int64_t)walkingHeartRateAverage;
- (int64_t)walkingHeartRateAverageMaxDailyDifference;
- (int64_t)walkingHeartRateAverageMaxTotalDifference;
- (unint64_t)insulinTherapy;
- (void)applyProfileType:(int64_t)a3;
- (void)setActiveCaloriesSampleFrequency:(double)a3;
- (void)setAsthmaSeverity:(int64_t)a3;
- (void)setAsymmetryPercentageMean:(double)a3;
- (void)setAsymmetryPercentageSampleFrequency:(double)a3;
- (void)setAsymmetryPercentageSampleFrequencyStdDev:(double)a3;
- (void)setAsymmetryPercentageStdDev:(double)a3;
- (void)setBaseCorrectedWristSkinTemperatureInCelsius:(double)a3;
- (void)setBedtimeNoiseStdDev:(double)a3;
- (void)setBiologicalSex:(int64_t)a3;
- (void)setBirthDate:(id)a3;
- (void)setBirthDateComponents:(id)a3;
- (void)setBloodPressureSampleFrequency:(double)a3;
- (void)setBloodType:(int64_t)a3;
- (void)setBodyTempExerciseMultiplier:(double)a3;
- (void)setBodyTempFeverMultiplier:(double)a3;
- (void)setBodyTempSampleFrequency:(double)a3;
- (void)setBodyTempSampleNoiseStdDev:(double)a3;
- (void)setBreakfastTime:(double)a3;
- (void)setBreakfastTimeSampleNoiseStdDev:(double)a3;
- (void)setContinuousGlucoseMonitoringSampleFrequency:(double)a3;
- (void)setCreateHighFidelityData:(BOOL)a3;
- (void)setCrossCountrySkiingSpeedMean:(double)a3;
- (void)setCyclingCadenceMean:(double)a3;
- (void)setCyclingCadenceMeanStdDev:(double)a3;
- (void)setCyclingFTPMean:(double)a3;
- (void)setCyclingFTPMeanStdDev:(double)a3;
- (void)setCyclingPowerMean:(double)a3;
- (void)setCyclingPowerMeanStdDev:(double)a3;
- (void)setCyclingSpeedMean:(double)a3;
- (void)setDawnTime:(double)a3;
- (void)setDayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius:(double)a3;
- (void)setDinnerTime:(double)a3;
- (void)setDoubleSupportPercentageMean:(double)a3;
- (void)setDoubleSupportPercentageSampleFrequency:(double)a3;
- (void)setDoubleSupportPercentageSampleFrequencyStdDev:(double)a3;
- (void)setDoubleSupportPercentageStdDev:(double)a3;
- (void)setExerciseCooldownTime:(double)a3;
- (void)setExerciseGoal:(double)a3;
- (void)setExerciseIntensityPercentage:(double)a3;
- (void)setExercisePostDietWeeklyWorkoutsMean:(double)a3;
- (void)setExercisePostDietWeeklyWorkoutsStdDev:(double)a3;
- (void)setExerciseStartTime:(double)a3;
- (void)setExerciseStartTimeStdDev:(double)a3;
- (void)setExerciseStopTime:(double)a3;
- (void)setExerciseStopTimeStdDev:(double)a3;
- (void)setExerciseTimeSampleFrequency:(double)a3;
- (void)setExerciseWeeklyWorkoutsMean:(double)a3;
- (void)setExerciseWeeklyWorkoutsStdDev:(double)a3;
- (void)setFallSampleFrequency:(double)a3;
- (void)setFallsDailyMean:(double)a3;
- (void)setFallsDailyStdDev:(double)a3;
- (void)setFirstName:(id)a3;
- (void)setFitzpatrickSkinType:(int64_t)a3;
- (void)setFitzpatrickSkinTypeSampleTime:(double)a3;
- (void)setFitzpatrickSkinTypeScore:(int64_t)a3;
- (void)setFlightsClimbedDailyMean:(double)a3;
- (void)setFlightsClimbedSampleFrequency:(double)a3;
- (void)setFlightsClimbedSampleFrequencyStdDev:(double)a3;
- (void)setFlightsClimbedSampleTime:(double)a3;
- (void)setFlightsClimbedStdDev:(double)a3;
- (void)setForearmCircumferenceInInches:(double)a3;
- (void)setGenericSampleTimeNoiseStdDev:(double)a3;
- (void)setHandwashingDurationMean:(double)a3;
- (void)setHandwashingDurationMeanStdDev:(double)a3;
- (void)setHandwashingSampleFrequency:(double)a3;
- (void)setHandwashingSampleFrequencyStdDev:(double)a3;
- (void)setHeartRateRecovery:(double)a3;
- (void)setHeartRateRecoveryValueMaxConsecutiveDifference:(double)a3;
- (void)setHeartRateRecoveryValueMaxTotalDifference:(double)a3;
- (void)setHeartRateRecoveryValueStdDev:(double)a3;
- (void)setHeartRateSampleFrequency:(double)a3;
- (void)setHeartRateSampleFrequencyStdDev:(double)a3;
- (void)setHeartRateSampleNoiseStdDev:(double)a3;
- (void)setHeightSampleNoiseStdDev:(double)a3;
- (void)setHeightSampleTime:(double)a3;
- (void)setHeightSampleTimeFrequency:(double)a3;
- (void)setHeightTargetInCm:(double)a3;
- (void)setHighFidelityGeneration:(BOOL)a3;
- (void)setHipCircumferenceInInches:(double)a3;
- (void)setInBedTimeStdDev:(double)a3;
- (void)setInsulinAdherence:(double)a3;
- (void)setInsulinProduction:(double)a3;
- (void)setInsulinSensitivity:(double)a3;
- (void)setInsulinTherapy:(unint64_t)a3;
- (void)setLastName:(id)a3;
- (void)setLunchTime:(double)a3;
- (void)setMealTimeSampleNoiseStdDev:(double)a3;
- (void)setMedicalIDData:(id)a3;
- (void)setMenstrualPeriodFrequency:(double)a3;
- (void)setMindfulSessionFrequency:(double)a3;
- (void)setMindfulSessionMean:(int64_t)a3;
- (void)setMindfulSessionStdDev:(int64_t)a3;
- (void)setMoveGoal:(double)a3;
- (void)setNumCupsOfCoffeeDailyMean:(double)a3;
- (void)setNumCupsOfCoffeeStdDev:(double)a3;
- (void)setNumDailyFingerSticksAdherence:(double)a3;
- (void)setNutritionTrackingType:(int64_t)a3;
- (void)setOvulationIndeterminateProbabilityPercentage:(double)a3;
- (void)setOxygenSaturationMean:(double)a3;
- (void)setOxygenSaturationMeanAtElevation:(double)a3;
- (void)setOxygenSaturationMeasuringSuccessRate:(double)a3;
- (void)setOxygenSaturationMeasuringSuccessRateDuringSleep:(double)a3;
- (void)setOxygenSaturationSampleFrequency:(double)a3;
- (void)setOxygenSaturationStdDev:(double)a3;
- (void)setOxygenSaturationStdDevAtElevation:(double)a3;
- (void)setPaddleSportsSpeedMean:(double)a3;
- (void)setPeripheralPerfusionIndexMean:(double)a3;
- (void)setPeripheralPerfusionIndexSampleFrequency:(double)a3;
- (void)setPeripheralPerfusionIndexStdDev:(double)a3;
- (void)setPersonDescription:(id)a3;
- (void)setPreDietIntakeMultiplier:(double)a3;
- (void)setProfileType:(int64_t)a3;
- (void)setRehabLogarithmicConstant:(double)a3;
- (void)setRestingCaloriesSampleFrequency:(double)a3;
- (void)setRestingDiastolicBloodPressure:(int64_t)a3;
- (void)setRestingDiastolicBloodPressureSampleNoiseStdDev:(double)a3;
- (void)setRestingHeartRate:(int64_t)a3;
- (void)setRestingHeartRateMaxDailyDifference:(int64_t)a3;
- (void)setRestingHeartRateMaxTotalDifference:(int64_t)a3;
- (void)setRestingRespirationRate:(int64_t)a3;
- (void)setRestingRespirationRateSampleFrequency:(double)a3;
- (void)setRestingRespirationRateSampleFrequencyDuringSleep:(double)a3;
- (void)setRestingRespirationRateSampleNoiseStdDev:(double)a3;
- (void)setRestingSystolicBloodPressure:(int64_t)a3;
- (void)setRestingSystolicBloodPressureSampleNoiseStdDev:(double)a3;
- (void)setResultsTrackingType:(int64_t)a3;
- (void)setRowingSpeedMean:(double)a3;
- (void)setRunningGroundContactTimeMean:(double)a3;
- (void)setRunningGroundContactTimeMeanStdDev:(double)a3;
- (void)setRunningPowerMean:(double)a3;
- (void)setRunningPowerMeanStdDev:(double)a3;
- (void)setRunningStrideLengthMean:(double)a3;
- (void)setRunningStrideLengthMeanStdDev:(double)a3;
- (void)setRunningVerticalOscillationMean:(double)a3;
- (void)setRunningVerticalOscillationMeanStdDev:(double)a3;
- (void)setSedentarySampleFrequency:(double)a3;
- (void)setSexualActivityIsTryingToConceive:(BOOL)a3;
- (void)setSexualActivityProbabilityPercentage:(double)a3;
- (void)setSexualActivityProtectionDocumentationProbabilityPercentage:(double)a3;
- (void)setSexualActivityProtectionProbabilityPercentage:(double)a3;
- (void)setSixMinuteWalkTestDistanceMean:(double)a3;
- (void)setSixMinuteWalkTestDistanceSampleFrequency:(double)a3;
- (void)setSixMinuteWalkTestDistanceSampleFrequencyStdDev:(double)a3;
- (void)setSixMinuteWalkTestDistanceStdDev:(double)a3;
- (void)setSnackTime:(double)a3;
- (void)setSpeedMeanStdDev:(double)a3;
- (void)setSpirometrySampleFrequency:(double)a3;
- (void)setSpirometrySampleTime:(double)a3;
- (void)setStairAscentSpeedMean:(double)a3;
- (void)setStairAscentSpeedSampleFrequency:(double)a3;
- (void)setStairAscentSpeedSampleFrequencyStdDev:(double)a3;
- (void)setStairAscentSpeedStdDev:(double)a3;
- (void)setStairDescentSpeedMean:(double)a3;
- (void)setStairDescentSpeedSampleFrequency:(double)a3;
- (void)setStairDescentSpeedSampleFrequencyStdDev:(double)a3;
- (void)setStairDescentSpeedStdDev:(double)a3;
- (void)setStandGoal:(double)a3;
- (void)setStepLengthMean:(double)a3;
- (void)setStepLengthSampleFrequency:(double)a3;
- (void)setStepLengthSampleFrequencyStdDev:(double)a3;
- (void)setStepLengthStdDev:(double)a3;
- (void)setStepsSampleFrequency:(double)a3;
- (void)setStepsSampleFrequencyDuringExercise:(double)a3;
- (void)setSunsetTime:(double)a3;
- (void)setSwimmingStrokesPerYard:(double)a3;
- (void)setTimeInDaylightDurationMean:(double)a3;
- (void)setTimeInDaylightDurationMeanStdDev:(double)a3;
- (void)setTimeInDaylightSampleFrequency:(double)a3;
- (void)setTimeInDaylightSampleFrequencyStdDev:(double)a3;
- (void)setTimeIncrement:(double)a3;
- (void)setTimeIncrementDuringExercise:(double)a3;
- (void)setToothbrushingDurationMean:(double)a3;
- (void)setToothbrushingDurationMeanStdDev:(double)a3;
- (void)setUnderwaterDivingWaterTemperatureMean:(double)a3;
- (void)setUnderwaterDivingWaterTemperatureStdDev:(double)a3;
- (void)setUseContinuousGlucoseMonitoring:(BOOL)a3;
- (void)setUvIndexSampleFrequency:(double)a3;
- (void)setVo2MaxSampleTimeNoiseStdDev:(double)a3;
- (void)setVo2MaxValueMaxConsecutiveDifference:(double)a3;
- (void)setVo2MaxValueMaxTotalDifference:(double)a3;
- (void)setVo2MaxValueStdDev:(double)a3;
- (void)setWaistCircumferenceInInches:(double)a3;
- (void)setWakeUpTimeNoiseStdDev:(double)a3;
- (void)setWalkingHeartRateAverage:(int64_t)a3;
- (void)setWalkingHeartRateAverageMaxDailyDifference:(int64_t)a3;
- (void)setWalkingHeartRateAverageMaxTotalDifference:(int64_t)a3;
- (void)setWalkingSpeedMean:(double)a3;
- (void)setWalkingSpeedSampleFrequency:(double)a3;
- (void)setWalkingSpeedSampleFrequencyStdDev:(double)a3;
- (void)setWalkingSpeedStdDev:(double)a3;
- (void)setWalkingSteadinessMean:(double)a3;
- (void)setWalkingSteadinessSampleFrequency:(double)a3;
- (void)setWalkingSteadinessSampleFrequencyStdDev:(double)a3;
- (void)setWalkingSteadinessStdDev:(double)a3;
- (void)setWaterConsumedDailyMean:(double)a3;
- (void)setWaterConsumedIntervalMean:(double)a3;
- (void)setWaterConsumedIntervalStdDev:(double)a3;
- (void)setWaterConsumedSampleFrequency:(double)a3;
- (void)setWaterConsumedSampleTime:(double)a3;
- (void)setWaterConsumedStdDev:(double)a3;
- (void)setWeekdaySleepParameters:(id)a3;
- (void)setWeekendSleepParameters:(id)a3;
- (void)setWeightChangePercentageMax:(double)a3;
- (void)setWeightDailyChangeStdDev:(double)a3;
- (void)setWeightDailyMaxLoss:(double)a3;
- (void)setWeightGainHolidayDaysInYear:(id)a3;
- (void)setWeightLossStartDay:(double)a3;
- (void)setWeightSampleNoiseStdDev:(double)a3;
- (void)setWeightSampleTime:(double)a3;
- (void)setWeightSampleTimeFrequency:(double)a3;
- (void)setWeightTargetInKg:(double)a3;
- (void)setWorkoutPrototypesByCalendarDay:(id)a3;
- (void)setWristCircumferenceInInches:(double)a3;
- (void)updateMedicalIDData;
@end

@implementation HDDemoDataPerson

- (HDDemoDataPerson)initWithFirstName:(id)a3 lastName:(id)a4 description:(id)a5 birthDateComponents:(id)a6 biologicalSex:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HDDemoDataPerson;
  v17 = [(HDDemoDataPerson *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_firstName, a3);
    objc_storeStrong((id *)&v18->_lastName, a4);
    objc_storeStrong((id *)&v18->_personDescription, a5);
    objc_storeStrong((id *)&v18->_birthDateComponents, a6);
    v18->_biologicalSex = a7;
    v19 = (_HKMedicalIDData *)objc_alloc_init(MEMORY[0x1E4F2B920]);
    medicalIDData = v18->_medicalIDData;
    v18->_medicalIDData = v19;
  }
  return v18;
}

+ (id)defaultPersonWithBiologicalSex:(int64_t)a3
{
  v93[7] = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3 == 2;
  if (a3 == 2) {
    v5 = @"Dave";
  }
  else {
    v5 = @"Lani";
  }
  v6 = @"Knox";
  if (a3 != 2) {
    v6 = @"Martinez";
  }
  v7 = (objc_class *)MEMORY[0x1E4F1C9D8];
  if (a3 == 2) {
    uint64_t v8 = 1971;
  }
  else {
    uint64_t v8 = 1985;
  }
  if (a3 == 2) {
    uint64_t v9 = 73;
  }
  else {
    uint64_t v9 = 65;
  }
  if (a3 == 2) {
    uint64_t v10 = 180;
  }
  else {
    uint64_t v10 = 140;
  }
  if (a3 == 2) {
    uint64_t v11 = 74;
  }
  else {
    uint64_t v11 = 58;
  }
  double v12 = 150.0;
  if (a3 == 2) {
    double v12 = 200.0;
  }
  double v63 = v12;
  double v13 = 250.0;
  if (a3 != 2) {
    double v13 = 200.0;
  }
  double v65 = v13;
  if (a3 == 2) {
    double v14 = 80.0;
  }
  else {
    double v14 = 70.0;
  }
  double v15 = 5.0;
  if (a3 == 2) {
    double v15 = 7.0;
  }
  double v67 = v14;
  double v69 = v15;
  double v16 = 6.0;
  if (a3 == 2) {
    double v16 = 4.0;
  }
  double v71 = v16;
  if (a3 == 2) {
    double v17 = 3.3;
  }
  else {
    double v17 = 4.0;
  }
  double v18 = 1.0;
  if (a3 == 2) {
    double v18 = 2.5;
  }
  double v73 = v17;
  double v75 = v18;
  if (a3 == 2) {
    uint64_t v19 = 31;
  }
  else {
    uint64_t v19 = 26;
  }
  v20 = v6;
  v21 = v5;
  id v22 = objc_alloc_init(v7);
  [v22 setMonth:2];
  [v22 setDay:10];
  [v22 setYear:v8];
  [v22 setEra:1];
  v23 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithUTCTimeZone");
  v77 = v22;
  [v22 setCalendar:v23];

  v24 = [[HDDemoDataPerson alloc] initWithFirstName:v21 lastName:v20 description:@"Default Person" birthDateComponents:v22 biologicalSex:a3];
  [(HDDemoDataPerson *)v24 setBloodType:arc4random_uniform(7u) + 1];
  [(HDDemoDataPerson *)v24 setFitzpatrickSkinType:3];
  [(HDDemoDataPerson *)v24 setTimeIncrement:0.0208333333];
  [(HDDemoDataPerson *)v24 setTimeIncrementDuringExercise:0.000347222222];
  [(HDDemoDataPerson *)v24 setDawnTime:0.25];
  [(HDDemoDataPerson *)v24 setSunsetTime:0.8125];
  -[HDDemoDataPerson setGenericSampleTimeNoiseStdDev:](v24, "setGenericSampleTimeNoiseStdDev:");
  [(HDDemoDataPerson *)v24 setUvIndexSampleFrequency:0.0416666667];
  [(HDDemoDataPerson *)v24 setWaistCircumferenceInInches:33.0];
  [(HDDemoDataPerson *)v24 setWristCircumferenceInInches:0.0];
  [(HDDemoDataPerson *)v24 setForearmCircumferenceInInches:0.0];
  [(HDDemoDataPerson *)v24 setHipCircumferenceInInches:0.0];
  [(HDDemoDataPerson *)v24 setHeightTargetInCm:(double)v9 * 2.53999996];
  [(HDDemoDataPerson *)v24 setHeightSampleTime:0.416666667];
  [(HDDemoDataPerson *)v24 setHeightSampleTimeFrequency:80.0];
  -[HDDemoDataPerson setHeightSampleNoiseStdDev:](v24, "setHeightSampleNoiseStdDev:");
  [(HDDemoDataPerson *)v24 setWeightTargetInKg:(double)v10 * 0.453592933];
  [(HDDemoDataPerson *)v24 setWeightSampleTime:0.375];
  [(HDDemoDataPerson *)v24 setWeightSampleTimeFrequency:1.0];
  [(HDDemoDataPerson *)v24 setWeightLossStartDay:110.0];
  [(HDDemoDataPerson *)v24 setWeightSampleNoiseStdDev:0.47627258];
  [(HDDemoDataPerson *)v24 setWeightDailyChangeStdDev:0.226796467];
  -[HDDemoDataPerson setWeightChangePercentageMax:](v24, "setWeightChangePercentageMax:");
  [(HDDemoDataPerson *)v24 setWeightDailyMaxLoss:0.317515053];
  [(HDDemoDataPerson *)v24 setWeightGainHolidayDaysInYear:&unk_1F17E9570];
  [(HDDemoDataPerson *)v24 setRestingHeartRate:65];
  [(HDDemoDataPerson *)v24 setRestingHeartRateMaxDailyDifference:1];
  [(HDDemoDataPerson *)v24 setRestingHeartRateMaxTotalDifference:3];
  [(HDDemoDataPerson *)v24 setWalkingHeartRateAverage:110];
  [(HDDemoDataPerson *)v24 setWalkingHeartRateAverageMaxDailyDifference:5];
  [(HDDemoDataPerson *)v24 setWalkingHeartRateAverageMaxTotalDifference:15];
  [(HDDemoDataPerson *)v24 setHeartRateSampleFrequency:0.00555555556];
  [(HDDemoDataPerson *)v24 setHeartRateSampleFrequencyStdDev:0.0138888889];
  [(HDDemoDataPerson *)v24 setHeartRateSampleNoiseStdDev:13.0];
  [(HDDemoDataPerson *)v24 setHeartRateRecovery:50.0];
  [(HDDemoDataPerson *)v24 setHeartRateRecoveryValueStdDev:5.0];
  [(HDDemoDataPerson *)v24 setHeartRateRecoveryValueMaxConsecutiveDifference:10.0];
  [(HDDemoDataPerson *)v24 setHeartRateRecoveryValueMaxTotalDifference:50.0];
  [(HDDemoDataPerson *)v24 setVo2MaxValueStdDev:1.0];
  [(HDDemoDataPerson *)v24 setVo2MaxValueMaxConsecutiveDifference:1.0];
  [(HDDemoDataPerson *)v24 setVo2MaxValueMaxTotalDifference:3.0];
  [(HDDemoDataPerson *)v24 setVo2MaxSampleTimeNoiseStdDev:0.0208333333];
  [(HDDemoDataPerson *)v24 setRestingRespirationRate:13];
  [(HDDemoDataPerson *)v24 setRestingRespirationRateSampleFrequency:0.166666667];
  [(HDDemoDataPerson *)v24 setRestingRespirationRateSampleFrequencyDuringSleep:0.00694444444];
  [(HDDemoDataPerson *)v24 setRestingRespirationRateSampleNoiseStdDev:3.0];
  [(HDDemoDataPerson *)v24 setBloodPressureSampleFrequency:0.5];
  [(HDDemoDataPerson *)v24 setRestingSystolicBloodPressure:127];
  [(HDDemoDataPerson *)v24 setRestingDiastolicBloodPressure:84];
  [(HDDemoDataPerson *)v24 setRestingSystolicBloodPressureSampleNoiseStdDev:2.0];
  [(HDDemoDataPerson *)v24 setRestingDiastolicBloodPressureSampleNoiseStdDev:1.0];
  [(HDDemoDataPerson *)v24 setBodyTempSampleFrequency:0.5];
  -[HDDemoDataPerson setBodyTempSampleNoiseStdDev:](v24, "setBodyTempSampleNoiseStdDev:");
  [(HDDemoDataPerson *)v24 setBodyTempFeverMultiplier:0.0];
  [(HDDemoDataPerson *)v24 setBodyTempExerciseMultiplier:0.015];
  [(HDDemoDataPerson *)v24 setBaseCorrectedWristSkinTemperatureInCelsius:36.0];
  [(HDDemoDataPerson *)v24 setDayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius:0.25];
  [(HDDemoDataPerson *)v24 setOxygenSaturationSampleFrequency:0.0222222222];
  [(HDDemoDataPerson *)v24 setOxygenSaturationMean:98.0];
  [(HDDemoDataPerson *)v24 setOxygenSaturationStdDev:3.0];
  [(HDDemoDataPerson *)v24 setOxygenSaturationMeanAtElevation:93.5];
  [(HDDemoDataPerson *)v24 setOxygenSaturationStdDevAtElevation:1.5];
  [(HDDemoDataPerson *)v24 setOxygenSaturationMeasuringSuccessRate:0.2];
  -[HDDemoDataPerson setOxygenSaturationMeasuringSuccessRateDuringSleep:](v24, "setOxygenSaturationMeasuringSuccessRateDuringSleep:");
  [(HDDemoDataPerson *)v24 setPeripheralPerfusionIndexMean:4.0];
  [(HDDemoDataPerson *)v24 setPeripheralPerfusionIndexStdDev:0.5];
  [(HDDemoDataPerson *)v24 setPeripheralPerfusionIndexSampleFrequency:0.000347222222];
  [(HDDemoDataPerson *)v24 setSexualActivityProbabilityPercentage:0.2];
  [(HDDemoDataPerson *)v24 setSexualActivityProtectionProbabilityPercentage:0.6];
  [(HDDemoDataPerson *)v24 setSexualActivityProtectionDocumentationProbabilityPercentage:0.8];
  [(HDDemoDataPerson *)v24 setSexualActivityIsTryingToConceive:0];
  [(HDDemoDataPerson *)v24 setMenstrualPeriodFrequency:28.0];
  -[HDDemoDataPerson setOvulationIndeterminateProbabilityPercentage:](v24, "setOvulationIndeterminateProbabilityPercentage:");
  -[HDDemoDataPerson setToothbrushingDurationMean:](v24, "setToothbrushingDurationMean:");
  [(HDDemoDataPerson *)v24 setToothbrushingDurationMeanStdDev:20.0];
  [(HDDemoDataPerson *)v24 setHandwashingDurationMean:21.0];
  [(HDDemoDataPerson *)v24 setHandwashingDurationMeanStdDev:6.0];
  [(HDDemoDataPerson *)v24 setHandwashingSampleFrequency:0.0555555556];
  [(HDDemoDataPerson *)v24 setHandwashingSampleFrequencyStdDev:0.0208333333];
  [(HDDemoDataPerson *)v24 setTimeInDaylightSampleFrequency:0.0416666667];
  [(HDDemoDataPerson *)v24 setTimeInDaylightSampleFrequencyStdDev:0.00833333333];
  [(HDDemoDataPerson *)v24 timeIncrementDuringExercise];
  -[HDDemoDataPerson setActiveCaloriesSampleFrequency:](v24, "setActiveCaloriesSampleFrequency:");
  [(HDDemoDataPerson *)v24 setRestingCaloriesSampleFrequency:0.0416666667];
  [(HDDemoDataPerson *)v24 timeIncrement];
  -[HDDemoDataPerson setStepsSampleFrequency:](v24, "setStepsSampleFrequency:");
  [(HDDemoDataPerson *)v24 timeIncrementDuringExercise];
  -[HDDemoDataPerson setStepsSampleFrequencyDuringExercise:](v24, "setStepsSampleFrequencyDuringExercise:");
  [(HDDemoDataPerson *)v24 setSedentarySampleFrequency:0.0416666667];
  [(HDDemoDataPerson *)v24 setRunningPowerMean:200.0];
  [(HDDemoDataPerson *)v24 setRunningPowerMeanStdDev:40.0];
  [(HDDemoDataPerson *)v24 setRunningStrideLengthMean:(double)v11 * 2.53999996 / 100.0];
  [(HDDemoDataPerson *)v24 setRunningStrideLengthMeanStdDev:0.5];
  [(HDDemoDataPerson *)v24 setRunningVerticalOscillationMean:0.11];
  [(HDDemoDataPerson *)v24 setRunningVerticalOscillationMeanStdDev:0.02];
  [(HDDemoDataPerson *)v24 setRunningGroundContactTimeMean:200.0];
  [(HDDemoDataPerson *)v24 setRunningGroundContactTimeMeanStdDev:25.0];
  [(HDDemoDataPerson *)v24 setSwimmingStrokesPerYard:0.727272727];
  [(HDDemoDataPerson *)v24 setCyclingPowerMean:v63];
  [(HDDemoDataPerson *)v24 setCyclingPowerMeanStdDev:40.0];
  [(HDDemoDataPerson *)v24 setCyclingFTPMean:v65];
  [(HDDemoDataPerson *)v24 setCyclingFTPMeanStdDev:50.0];
  [(HDDemoDataPerson *)v24 setCyclingCadenceMean:v67];
  [(HDDemoDataPerson *)v24 setCyclingCadenceMeanStdDev:20.0];
  [(HDDemoDataPerson *)v24 setSpeedMeanStdDev:0.5];
  [(HDDemoDataPerson *)v24 setCyclingSpeedMean:v69];
  [(HDDemoDataPerson *)v24 setCrossCountrySkiingSpeedMean:v71];
  [(HDDemoDataPerson *)v24 setRowingSpeedMean:v73];
  [(HDDemoDataPerson *)v24 setPaddleSportsSpeedMean:v75];
  [(HDDemoDataPerson *)v24 setUnderwaterDivingWaterTemperatureMean:25.0];
  [(HDDemoDataPerson *)v24 setUnderwaterDivingWaterTemperatureStdDev:1.0];
  [(HDDemoDataPerson *)v24 setExerciseIntensityPercentage:0.8];
  [(HDDemoDataPerson *)v24 setExerciseStartTime:0.34375];
  [(HDDemoDataPerson *)v24 setExerciseStopTime:0.368055556];
  [(HDDemoDataPerson *)v24 setExerciseStartTimeStdDev:0.00833333333];
  [(HDDemoDataPerson *)v24 setExerciseStopTimeStdDev:0.00625];
  [(HDDemoDataPerson *)v24 setExerciseCooldownTime:0.00763888889];
  [(HDDemoDataPerson *)v24 setExerciseWeeklyWorkoutsMean:2.0];
  [(HDDemoDataPerson *)v24 setExerciseWeeklyWorkoutsStdDev:0.5];
  [(HDDemoDataPerson *)v24 setExercisePostDietWeeklyWorkoutsMean:3.8];
  [(HDDemoDataPerson *)v24 setExercisePostDietWeeklyWorkoutsStdDev:0.5];
  [(HDDemoDataPerson *)v24 setFlightsClimbedDailyMean:7.0];
  [(HDDemoDataPerson *)v24 setFlightsClimbedStdDev:3.0];
  [(HDDemoDataPerson *)v24 setFlightsClimbedSampleTime:0.0131944444];
  [(HDDemoDataPerson *)v24 setFlightsClimbedSampleFrequency:0.0104166667];
  [(HDDemoDataPerson *)v24 setFlightsClimbedSampleFrequencyStdDev:0.000694444444];
  [(HDDemoDataPerson *)v24 setRehabLogarithmicConstant:2.0];
  [(HDDemoDataPerson *)v24 setWalkingSpeedMean:1.5];
  [(HDDemoDataPerson *)v24 setWalkingSpeedStdDev:0.1];
  [(HDDemoDataPerson *)v24 setWalkingSpeedSampleFrequency:0.0416666667];
  [(HDDemoDataPerson *)v24 setWalkingSpeedSampleFrequencyStdDev:0.0104166667];
  [(HDDemoDataPerson *)v24 setStepLengthMean:(double)v19 * 2.53999996 / 100.0];
  [(HDDemoDataPerson *)v24 setStepLengthStdDev:0.02];
  [(HDDemoDataPerson *)v24 setStepLengthSampleFrequency:0.0416666667];
  [(HDDemoDataPerson *)v24 setStepLengthSampleFrequencyStdDev:0.0104166667];
  [(HDDemoDataPerson *)v24 setAsymmetryPercentageMean:0.03];
  [(HDDemoDataPerson *)v24 setAsymmetryPercentageStdDev:0.01];
  [(HDDemoDataPerson *)v24 setAsymmetryPercentageSampleFrequency:0.0416666667];
  [(HDDemoDataPerson *)v24 setAsymmetryPercentageSampleFrequencyStdDev:0.0104166667];
  [(HDDemoDataPerson *)v24 setDoubleSupportPercentageMean:0.2];
  [(HDDemoDataPerson *)v24 setDoubleSupportPercentageStdDev:0.03];
  [(HDDemoDataPerson *)v24 setDoubleSupportPercentageSampleFrequency:0.0416666667];
  [(HDDemoDataPerson *)v24 setDoubleSupportPercentageSampleFrequencyStdDev:0.0104166667];
  [(HDDemoDataPerson *)v24 setSixMinuteWalkTestDistanceMean:dbl_1BD329FA0[v4]];
  [(HDDemoDataPerson *)v24 setSixMinuteWalkTestDistanceStdDev:12.0];
  [(HDDemoDataPerson *)v24 setSixMinuteWalkTestDistanceSampleFrequency:7.0];
  [(HDDemoDataPerson *)v24 setSixMinuteWalkTestDistanceSampleFrequencyStdDev:0.0416666667];
  [(HDDemoDataPerson *)v24 setStairAscentSpeedMean:0.2936];
  [(HDDemoDataPerson *)v24 setStairAscentSpeedStdDev:0.1134];
  [(HDDemoDataPerson *)v24 setStairAscentSpeedSampleFrequency:0.0416666667];
  [(HDDemoDataPerson *)v24 setStairAscentSpeedSampleFrequencyStdDev:0.0208333333];
  [(HDDemoDataPerson *)v24 setStairDescentSpeedMean:0.3109];
  [(HDDemoDataPerson *)v24 setStairDescentSpeedStdDev:0.1006];
  [(HDDemoDataPerson *)v24 setStairDescentSpeedSampleFrequency:0.0416666667];
  [(HDDemoDataPerson *)v24 setStairDescentSpeedSampleFrequencyStdDev:0.0208333333];
  [(HDDemoDataPerson *)v24 setWalkingSteadinessMean:0.85];
  [(HDDemoDataPerson *)v24 setWalkingSteadinessStdDev:0.05];
  [(HDDemoDataPerson *)v24 setWalkingSteadinessSampleFrequency:7.0];
  [(HDDemoDataPerson *)v24 setWalkingSteadinessSampleFrequencyStdDev:0.0104166667];
  [(HDDemoDataPerson *)v24 setMoveGoal:800.0];
  [(HDDemoDataPerson *)v24 setExerciseGoal:(double)(uint64_t)*MEMORY[0x1E4F2BA30]];
  [(HDDemoDataPerson *)v24 setStandGoal:(double)(uint64_t)*MEMORY[0x1E4F2BA28]];
  v92[0] = &unk_1F17EB928;
  v76 = +[HDDemoDataWorkoutPrototype HIITPrototype];
  v90[0] = v76;
  v74 = +[HDDemoDataWorkoutPrototype functionalStrengthTrainingPrototype];
  v90[1] = v74;
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
  v70 = +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:v72];
  v91 = v70;
  v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
  v93[0] = v68;
  v92[1] = &unk_1F17EB940;
  v66 = +[HDDemoDataWorkoutPrototype dancePrototype];
  v88[0] = v66;
  v64 = +[HDDemoDataWorkoutPrototype yogaPrototype];
  v88[1] = v64;
  v62 = +[HDDemoDataWorkoutPrototype rowingPrototype];
  v88[2] = v62;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:3];
  v60 = +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:v61];
  v89 = v60;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
  v93[1] = v59;
  v92[2] = &unk_1F17EB958;
  v58 = +[HDDemoDataWorkoutPrototype swimmingPrototype];
  v86[0] = v58;
  v57 = +[HDDemoDataWorkoutPrototype coolDownPrototype];
  v86[1] = v57;
  v56 = +[HDDemoDataWorkoutPrototype skatingSportsPrototype];
  v86[2] = v56;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:3];
  v54 = +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:v55];
  v87 = v54;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
  v93[2] = v53;
  v92[3] = &unk_1F17EB970;
  v52 = +[HDDemoDataWorkoutPrototype runningPrototype];
  v84[0] = v52;
  v51 = +[HDDemoDataWorkoutPrototype walkingPrototype];
  v84[1] = v51;
  v50 = +[HDDemoDataWorkoutPrototype soccerPrototype];
  v84[2] = v50;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
  v48 = +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:v49];
  v85 = v48;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
  v93[3] = v47;
  v92[4] = &unk_1F17EB988;
  v46 = +[HDDemoDataWorkoutPrototype ellipticalPrototype];
  v82[0] = v46;
  v45 = +[HDDemoDataWorkoutPrototype coreTrainingPrototype];
  v82[1] = v45;
  v44 = +[HDDemoDataWorkoutPrototype golfPrototype];
  v82[2] = v44;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:3];
  v42 = +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:v43];
  v83 = v42;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
  v93[4] = v41;
  v92[5] = &unk_1F17EB9A0;
  v40 = +[HDDemoDataWorkoutPrototype cyclingPrototype];
  v80[0] = v40;
  v39 = +[HDDemoDataWorkoutPrototype paddleSportsPrototype];
  v80[1] = v39;
  v38 = +[HDDemoDataWorkoutPrototype downhillSnowSportsPrototype];
  v80[2] = v38;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:3];
  v25 = +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:v37];
  v81 = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
  v93[5] = v26;
  v92[6] = &unk_1F17EB9B8;
  v27 = +[HDDemoDataWorkoutPrototype hikingPrototype];
  v78[0] = v27;
  v28 = +[HDDemoDataWorkoutPrototype underwaterDivingPrototype];
  v78[1] = v28;
  v29 = +[HDDemoDataWorkoutPrototype crossCountrySkiingPrototype];
  v78[2] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:3];
  v31 = +[HDDemoDataWorkoutPrototype pickRandomWorkoutFrom:v30];
  v79 = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
  v93[6] = v32;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:7];
  [(HDDemoDataPerson *)v24 setWorkoutPrototypesByCalendarDay:v33];

  [(HDDemoDataPerson *)v24 setMealTimeSampleNoiseStdDev:0.03125];
  [(HDDemoDataPerson *)v24 setBreakfastTimeSampleNoiseStdDev:0.00625];
  [(HDDemoDataPerson *)v24 setBreakfastTime:0.302083333];
  [(HDDemoDataPerson *)v24 setLunchTime:0.5];
  [(HDDemoDataPerson *)v24 setSnackTime:0.625];
  [(HDDemoDataPerson *)v24 setDinnerTime:0.791666667];
  [(HDDemoDataPerson *)v24 setPreDietIntakeMultiplier:1.07];
  [(HDDemoDataPerson *)v24 setNumCupsOfCoffeeDailyMean:1.0];
  [(HDDemoDataPerson *)v24 setNumCupsOfCoffeeStdDev:0.5];
  [(HDDemoDataPerson *)v24 setWaterConsumedSampleFrequency:0.01875];
  [(HDDemoDataPerson *)v24 setWaterConsumedDailyMean:1000.0];
  [(HDDemoDataPerson *)v24 setWaterConsumedStdDev:125.0];
  [(HDDemoDataPerson *)v24 setWaterConsumedIntervalMean:300.0];
  [(HDDemoDataPerson *)v24 setWaterConsumedIntervalStdDev:225.0];
  [(HDDemoDataPerson *)v24 setWaterConsumedSampleTime:0.0416666667];
  v34 = objc_alloc_init(HDDemoDataSleepParameters);
  [(HDDemoDataSleepParameters *)v34 setBedtime:0.951388889];
  [(HDDemoDataSleepParameters *)v34 setWakeUpTime:0.25];
  [(HDDemoDataSleepParameters *)v34 setBedtimeGoalHour:23];
  [(HDDemoDataSleepParameters *)v34 setWakeUpTimeGoalHour:6];
  [(HDDemoDataPerson *)v24 setWeekdaySleepParameters:v34];
  v35 = objc_alloc_init(HDDemoDataSleepParameters);
  [(HDDemoDataSleepParameters *)v35 setBedtime:0.0];
  [(HDDemoDataSleepParameters *)v35 setWakeUpTime:0.298611111];
  [(HDDemoDataSleepParameters *)v35 setBedtimeGoalHour:0];
  [(HDDemoDataSleepParameters *)v35 setWakeUpTimeGoalHour:7];
  [(HDDemoDataPerson *)v24 setWeekendSleepParameters:v35];
  [(HDDemoDataPerson *)v24 setWakeUpTimeNoiseStdDev:0.0277777778];
  [(HDDemoDataPerson *)v24 setBedtimeNoiseStdDev:0.0201388889];
  [(HDDemoDataPerson *)v24 setInBedTimeStdDev:0.0107638889];
  [(HDDemoDataPerson *)v24 setFallSampleFrequency:0.0416666667];
  [(HDDemoDataPerson *)v24 setFallsDailyMean:0.2];
  [(HDDemoDataPerson *)v24 setFallsDailyStdDev:0.15];
  [(HDDemoDataPerson *)v24 setUseContinuousGlucoseMonitoring:1];
  [(HDDemoDataPerson *)v24 setContinuousGlucoseMonitoringSampleFrequency:0.00347222222];
  [(HDDemoDataPerson *)v24 setNumDailyFingerSticksAdherence:0.9];
  [(HDDemoDataPerson *)v24 setInsulinSensitivity:1.0];
  [(HDDemoDataPerson *)v24 setInsulinProduction:1.0];
  [(HDDemoDataPerson *)v24 setInsulinAdherence:1.0];
  [(HDDemoDataPerson *)v24 setInsulinTherapy:0];
  [(HDDemoDataPerson *)v24 setSpirometrySampleFrequency:170.0];
  [(HDDemoDataPerson *)v24 setSpirometrySampleTime:80.6];
  [(HDDemoDataPerson *)v24 setAsthmaSeverity:2];
  [(HDDemoDataPerson *)v24 setMindfulSessionFrequency:0.395833333];
  [(HDDemoDataPerson *)v24 setMindfulSessionMean:2];
  [(HDDemoDataPerson *)v24 setMindfulSessionStdDev:1];
  [(HDDemoDataPerson *)v24 setNutritionTrackingType:1];
  [(HDDemoDataPerson *)v24 setResultsTrackingType:1];
  [(HDDemoDataPerson *)v24 updateMedicalIDData];

  return v24;
}

- (double)exerciseTimeSampleFrequency
{
  return 0.000694444444;
}

- (id)fullName
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  BOOL v4 = [(HDDemoDataPerson *)self firstName];
  [v3 setGivenName:v4];

  v5 = [(HDDemoDataPerson *)self lastName];
  [v3 setFamilyName:v5];

  v6 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v3 style:2 options:0];

  return v6;
}

- (void)applyProfileType:(int64_t)a3
{
  -[HDDemoDataPerson setProfileType:](self, "setProfileType:");
  switch(a3)
  {
    case 4:
      objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithUTCTimeZone");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v5 setMonth:2];
      [v5 setDay:10];
      [v5 setYear:1962];
      [v5 setEra:1];
      [v5 setCalendar:v14];
      [(HDDemoDataPerson *)self setBirthDateComponents:v5];
      v6 = [v14 dateFromComponents:v5];
      [(HDDemoDataPerson *)self setBirthDate:v6];

      break;
    case 3:
      [(HDDemoDataPerson *)self rehabLogarithmicConstant];
      long double v8 = 2.0 - log(v7);
      [(HDDemoDataPerson *)self asymmetryPercentageMean];
      [(HDDemoDataPerson *)self setAsymmetryPercentageMean:(double)(v9 * v8)];
      [(HDDemoDataPerson *)self rehabLogarithmicConstant];
      long double v11 = 2.0 - log(v10);
      [(HDDemoDataPerson *)self doubleSupportPercentageMean];
      double v13 = v12 * v11;
      [(HDDemoDataPerson *)self setDoubleSupportPercentageMean:v13];
      break;
    case 2:
      [(HDDemoDataPerson *)self setInsulinProduction:0.0];
      [(HDDemoDataPerson *)self setInsulinAdherence:1.0];
      [(HDDemoDataPerson *)self setInsulinTherapy:1];
      [(HDDemoDataPerson *)self setUseContinuousGlucoseMonitoring:1];
      break;
  }
}

- (void)setHighFidelityGeneration:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = 0.0204050926;
  if (a3)
  {
    double v5 = 0.00998842593;
    double v6 = 0.00304398148;
  }
  else
  {
    double v6 = 0.00555555556;
  }
  if (a3) {
    double v7 = 0.0000347222222;
  }
  else {
    double v7 = 0.0138888889;
  }
  [(HDDemoDataPerson *)self setTimeIncrement:v5];
  [(HDDemoDataPerson *)self setHeartRateSampleFrequency:v6];
  [(HDDemoDataPerson *)self setHeartRateSampleFrequencyStdDev:v7];

  [(HDDemoDataPerson *)self setCreateHighFidelityData:v3];
}

- (void)updateMedicalIDData
{
  v31[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F2B370];
  BOOL v4 = [MEMORY[0x1E4F2B618] meterUnitWithMetricPrefix:5];
  [(HDDemoDataPerson *)self heightTargetInCm];
  double v5 = objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4);

  double v6 = (void *)MEMORY[0x1E4F2B370];
  double v7 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:9];
  [(HDDemoDataPerson *)self weightTargetInKg];
  long double v8 = objc_msgSend(v6, "quantityWithUnit:doubleValue:", v7);

  double v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if ([(HDDemoDataPerson *)self biologicalSex] == 2) {
    long double v10 = @"DaveKnox";
  }
  else {
    long double v10 = @"LaniMartinez";
  }
  long double v11 = [v9 URLForResource:v10 withExtension:@"png"];
  double v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v11];
  double v13 = [(HDDemoDataPerson *)self medicalIDData];
  [v13 setPictureData:v12];

  id v14 = objc_alloc_init(MEMORY[0x1E4F2B8D0]);
  if ([(HDDemoDataPerson *)self biologicalSex] == 2) {
    double v15 = @"Lani Martinez";
  }
  else {
    double v15 = @"Dave Knox";
  }
  [v14 setName:v15];
  [v14 setPhoneNumber:@"(555) 555-0100"];
  [v14 setRelationship:@"spouse"];
  v31[0] = v14;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  double v17 = [(HDDemoDataPerson *)self medicalIDData];
  [v17 setEmergencyContacts:v16];

  double v18 = [(HDDemoDataPerson *)self fullName];
  uint64_t v19 = [(HDDemoDataPerson *)self medicalIDData];
  [v19 setName:v18];

  v20 = [(HDDemoDataPerson *)self birthDateComponents];
  v21 = [(HDDemoDataPerson *)self medicalIDData];
  [v21 setGregorianBirthday:v20];

  int64_t v22 = [(HDDemoDataPerson *)self bloodType];
  v23 = [(HDDemoDataPerson *)self medicalIDData];
  [v23 setBloodType:v22];

  v24 = [(HDDemoDataPerson *)self medicalIDData];
  [v24 setMedicalConditions:@"Hypertension"];

  v25 = [(HDDemoDataPerson *)self medicalIDData];
  [v25 setAllergyInfo:@"Peanuts"];

  v26 = [(HDDemoDataPerson *)self medicalIDData];
  [v26 setMedicationInfo:@"Lisinopril (10mg by mouth once a day)"];

  v27 = [(HDDemoDataPerson *)self medicalIDData];
  [v27 setHeight:v5];

  v28 = [(HDDemoDataPerson *)self medicalIDData];
  [v28 setWeight:v8];

  if ([(HDDemoDataPerson *)self biologicalSex] == 2) {
    v29 = @"en";
  }
  else {
    v29 = @"es";
  }
  v30 = [(HDDemoDataPerson *)self medicalIDData];
  [v30 setPrimaryLanguageCode:v29];
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)personDescription
{
  return self->_personDescription;
}

- (void)setPersonDescription:(id)a3
{
}

- (NSDateComponents)birthDateComponents
{
  return self->_birthDateComponents;
}

- (void)setBirthDateComponents:(id)a3
{
}

- (NSDate)birthDate
{
  return self->_birthDate;
}

- (void)setBirthDate:(id)a3
{
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
}

- (int64_t)bloodType
{
  return self->_bloodType;
}

- (void)setBloodType:(int64_t)a3
{
  self->_bloodType = a3;
}

- (int64_t)fitzpatrickSkinType
{
  return self->_fitzpatrickSkinType;
}

- (void)setFitzpatrickSkinType:(int64_t)a3
{
  self->_fitzpatrickSkinType = a3;
}

- (double)timeIncrement
{
  return self->_timeIncrement;
}

- (void)setTimeIncrement:(double)a3
{
  self->_timeIncrement = a3;
}

- (double)timeIncrementDuringExercise
{
  return self->_timeIncrementDuringExercise;
}

- (void)setTimeIncrementDuringExercise:(double)a3
{
  self->_timeIncrementDuringExercise = a3;
}

- (double)dawnTime
{
  return self->_dawnTime;
}

- (void)setDawnTime:(double)a3
{
  self->_dawnTime = a3;
}

- (double)sunsetTime
{
  return self->_sunsetTime;
}

- (void)setSunsetTime:(double)a3
{
  self->_sunsetTime = a3;
}

- (double)genericSampleTimeNoiseStdDev
{
  return self->_genericSampleTimeNoiseStdDev;
}

- (void)setGenericSampleTimeNoiseStdDev:(double)a3
{
  self->_genericSampleTimeNoiseStdDev = a3;
}

- (BOOL)createHighFidelityData
{
  return self->_createHighFidelityData;
}

- (void)setCreateHighFidelityData:(BOOL)a3
{
  self->_createHighFidelityData = a3;
}

- (int64_t)profileType
{
  return self->_profileType;
}

- (void)setProfileType:(int64_t)a3
{
  self->_profileType = a3;
}

- (double)uvIndexSampleFrequency
{
  return self->_uvIndexSampleFrequency;
}

- (void)setUvIndexSampleFrequency:(double)a3
{
  self->_uvIndexSampleFrequency = a3;
}

- (double)waistCircumferenceInInches
{
  return self->_waistCircumferenceInInches;
}

- (void)setWaistCircumferenceInInches:(double)a3
{
  self->_waistCircumferenceInInches = a3;
}

- (double)wristCircumferenceInInches
{
  return self->_wristCircumferenceInInches;
}

- (void)setWristCircumferenceInInches:(double)a3
{
  self->_wristCircumferenceInInches = a3;
}

- (double)forearmCircumferenceInInches
{
  return self->_forearmCircumferenceInInches;
}

- (void)setForearmCircumferenceInInches:(double)a3
{
  self->_forearmCircumferenceInInches = a3;
}

- (double)hipCircumferenceInInches
{
  return self->_hipCircumferenceInInches;
}

- (void)setHipCircumferenceInInches:(double)a3
{
  self->_hipCircumferenceInInches = a3;
}

- (double)heightSampleTime
{
  return self->_heightSampleTime;
}

- (void)setHeightSampleTime:(double)a3
{
  self->_heightSampleTime = a3;
}

- (double)heightTargetInCm
{
  return self->_heightTargetInCm;
}

- (void)setHeightTargetInCm:(double)a3
{
  self->_heightTargetInCm = a3;
}

- (double)heightSampleTimeFrequency
{
  return self->_heightSampleTimeFrequency;
}

- (void)setHeightSampleTimeFrequency:(double)a3
{
  self->_heightSampleTimeFrequency = a3;
}

- (double)heightSampleNoiseStdDev
{
  return self->_heightSampleNoiseStdDev;
}

- (void)setHeightSampleNoiseStdDev:(double)a3
{
  self->_heightSampleNoiseStdDev = a3;
}

- (double)weightSampleTime
{
  return self->_weightSampleTime;
}

- (void)setWeightSampleTime:(double)a3
{
  self->_weightSampleTime = a3;
}

- (double)weightTargetInKg
{
  return self->_weightTargetInKg;
}

- (void)setWeightTargetInKg:(double)a3
{
  self->_weightTargetInKg = a3;
}

- (double)weightSampleTimeFrequency
{
  return self->_weightSampleTimeFrequency;
}

- (void)setWeightSampleTimeFrequency:(double)a3
{
  self->_weightSampleTimeFrequency = a3;
}

- (double)weightSampleNoiseStdDev
{
  return self->_weightSampleNoiseStdDev;
}

- (void)setWeightSampleNoiseStdDev:(double)a3
{
  self->_weightSampleNoiseStdDev = a3;
}

- (double)weightLossStartDay
{
  return self->_weightLossStartDay;
}

- (void)setWeightLossStartDay:(double)a3
{
  self->_weightLossStartDay = a3;
}

- (double)weightDailyChangeStdDev
{
  return self->_weightDailyChangeStdDev;
}

- (void)setWeightDailyChangeStdDev:(double)a3
{
  self->_weightDailyChangeStdDev = a3;
}

- (double)weightDailyMaxLoss
{
  return self->_weightDailyMaxLoss;
}

- (void)setWeightDailyMaxLoss:(double)a3
{
  self->_weightDailyMaxLoss = a3;
}

- (double)weightChangePercentageMax
{
  return self->_weightChangePercentageMax;
}

- (void)setWeightChangePercentageMax:(double)a3
{
  self->_weightChangePercentageMax = a3;
}

- (NSArray)weightGainHolidayDaysInYear
{
  return self->_weightGainHolidayDaysInYear;
}

- (void)setWeightGainHolidayDaysInYear:(id)a3
{
}

- (int64_t)restingHeartRate
{
  return self->_restingHeartRate;
}

- (void)setRestingHeartRate:(int64_t)a3
{
  self->_restingHeartRate = a3;
}

- (int64_t)restingHeartRateMaxDailyDifference
{
  return self->_restingHeartRateMaxDailyDifference;
}

- (void)setRestingHeartRateMaxDailyDifference:(int64_t)a3
{
  self->_restingHeartRateMaxDailyDifference = a3;
}

- (int64_t)restingHeartRateMaxTotalDifference
{
  return self->_restingHeartRateMaxTotalDifference;
}

- (void)setRestingHeartRateMaxTotalDifference:(int64_t)a3
{
  self->_restingHeartRateMaxTotalDifference = a3;
}

- (int64_t)walkingHeartRateAverage
{
  return self->_walkingHeartRateAverage;
}

- (void)setWalkingHeartRateAverage:(int64_t)a3
{
  self->_walkingHeartRateAverage = a3;
}

- (int64_t)walkingHeartRateAverageMaxDailyDifference
{
  return self->_walkingHeartRateAverageMaxDailyDifference;
}

- (void)setWalkingHeartRateAverageMaxDailyDifference:(int64_t)a3
{
  self->_walkingHeartRateAverageMaxDailyDifference = a3;
}

- (int64_t)walkingHeartRateAverageMaxTotalDifference
{
  return self->_walkingHeartRateAverageMaxTotalDifference;
}

- (void)setWalkingHeartRateAverageMaxTotalDifference:(int64_t)a3
{
  self->_walkingHeartRateAverageMaxTotalDifference = a3;
}

- (double)heartRateSampleFrequency
{
  return self->_heartRateSampleFrequency;
}

- (void)setHeartRateSampleFrequency:(double)a3
{
  self->_heartRateSampleFrequency = a3;
}

- (double)heartRateSampleFrequencyStdDev
{
  return self->_heartRateSampleFrequencyStdDev;
}

- (void)setHeartRateSampleFrequencyStdDev:(double)a3
{
  self->_heartRateSampleFrequencyStdDev = a3;
}

- (double)heartRateSampleNoiseStdDev
{
  return self->_heartRateSampleNoiseStdDev;
}

- (void)setHeartRateSampleNoiseStdDev:(double)a3
{
  self->_heartRateSampleNoiseStdDev = a3;
}

- (double)heartRateRecovery
{
  return self->_heartRateRecovery;
}

- (void)setHeartRateRecovery:(double)a3
{
  self->_heartRateRecovery = a3;
}

- (double)heartRateRecoveryValueStdDev
{
  return self->_heartRateRecoveryValueStdDev;
}

- (void)setHeartRateRecoveryValueStdDev:(double)a3
{
  self->_heartRateRecoveryValueStdDev = a3;
}

- (double)heartRateRecoveryValueMaxConsecutiveDifference
{
  return self->_heartRateRecoveryValueMaxConsecutiveDifference;
}

- (void)setHeartRateRecoveryValueMaxConsecutiveDifference:(double)a3
{
  self->_heartRateRecoveryValueMaxConsecutiveDifference = a3;
}

- (double)heartRateRecoveryValueMaxTotalDifference
{
  return self->_heartRateRecoveryValueMaxTotalDifference;
}

- (void)setHeartRateRecoveryValueMaxTotalDifference:(double)a3
{
  self->_heartRateRecoveryValueMaxTotalDifference = a3;
}

- (double)vo2MaxValueStdDev
{
  return self->_vo2MaxValueStdDev;
}

- (void)setVo2MaxValueStdDev:(double)a3
{
  self->_vo2MaxValueStdDev = a3;
}

- (double)vo2MaxValueMaxConsecutiveDifference
{
  return self->_vo2MaxValueMaxConsecutiveDifference;
}

- (void)setVo2MaxValueMaxConsecutiveDifference:(double)a3
{
  self->_vo2MaxValueMaxConsecutiveDifference = a3;
}

- (double)vo2MaxValueMaxTotalDifference
{
  return self->_vo2MaxValueMaxTotalDifference;
}

- (void)setVo2MaxValueMaxTotalDifference:(double)a3
{
  self->_vo2MaxValueMaxTotalDifference = a3;
}

- (double)vo2MaxSampleTimeNoiseStdDev
{
  return self->_vo2MaxSampleTimeNoiseStdDev;
}

- (void)setVo2MaxSampleTimeNoiseStdDev:(double)a3
{
  self->_vo2MaxSampleTimeNoiseStdDev = a3;
}

- (int64_t)restingRespirationRate
{
  return self->_restingRespirationRate;
}

- (void)setRestingRespirationRate:(int64_t)a3
{
  self->_restingRespirationRate = a3;
}

- (double)restingRespirationRateSampleFrequency
{
  return self->_restingRespirationRateSampleFrequency;
}

- (void)setRestingRespirationRateSampleFrequency:(double)a3
{
  self->_restingRespirationRateSampleFrequency = a3;
}

- (double)restingRespirationRateSampleFrequencyDuringSleep
{
  return self->_restingRespirationRateSampleFrequencyDuringSleep;
}

- (void)setRestingRespirationRateSampleFrequencyDuringSleep:(double)a3
{
  self->_restingRespirationRateSampleFrequencyDuringSleep = a3;
}

- (double)restingRespirationRateSampleNoiseStdDev
{
  return self->_restingRespirationRateSampleNoiseStdDev;
}

- (void)setRestingRespirationRateSampleNoiseStdDev:(double)a3
{
  self->_restingRespirationRateSampleNoiseStdDev = a3;
}

- (double)bloodPressureSampleFrequency
{
  return self->_bloodPressureSampleFrequency;
}

- (void)setBloodPressureSampleFrequency:(double)a3
{
  self->_bloodPressureSampleFrequency = a3;
}

- (int64_t)restingSystolicBloodPressure
{
  return self->_restingSystolicBloodPressure;
}

- (void)setRestingSystolicBloodPressure:(int64_t)a3
{
  self->_restingSystolicBloodPressure = a3;
}

- (int64_t)restingDiastolicBloodPressure
{
  return self->_restingDiastolicBloodPressure;
}

- (void)setRestingDiastolicBloodPressure:(int64_t)a3
{
  self->_restingDiastolicBloodPressure = a3;
}

- (double)restingSystolicBloodPressureSampleNoiseStdDev
{
  return self->_restingSystolicBloodPressureSampleNoiseStdDev;
}

- (void)setRestingSystolicBloodPressureSampleNoiseStdDev:(double)a3
{
  self->_restingSystolicBloodPressureSampleNoiseStdDev = a3;
}

- (double)restingDiastolicBloodPressureSampleNoiseStdDev
{
  return self->_restingDiastolicBloodPressureSampleNoiseStdDev;
}

- (void)setRestingDiastolicBloodPressureSampleNoiseStdDev:(double)a3
{
  self->_restingDiastolicBloodPressureSampleNoiseStdDev = a3;
}

- (double)bodyTempFeverMultiplier
{
  return self->_bodyTempFeverMultiplier;
}

- (void)setBodyTempFeverMultiplier:(double)a3
{
  self->_bodyTempFeverMultiplier = a3;
}

- (double)bodyTempExerciseMultiplier
{
  return self->_bodyTempExerciseMultiplier;
}

- (void)setBodyTempExerciseMultiplier:(double)a3
{
  self->_bodyTempExerciseMultiplier = a3;
}

- (double)bodyTempSampleFrequency
{
  return self->_bodyTempSampleFrequency;
}

- (void)setBodyTempSampleFrequency:(double)a3
{
  self->_bodyTempSampleFrequency = a3;
}

- (double)bodyTempSampleNoiseStdDev
{
  return self->_bodyTempSampleNoiseStdDev;
}

- (void)setBodyTempSampleNoiseStdDev:(double)a3
{
  self->_bodyTempSampleNoiseStdDev = a3;
}

- (double)baseCorrectedWristSkinTemperatureInCelsius
{
  return self->_baseCorrectedWristSkinTemperatureInCelsius;
}

- (void)setBaseCorrectedWristSkinTemperatureInCelsius:(double)a3
{
  self->_baseCorrectedWristSkinTemperatureInCelsius = a3;
}

- (double)dayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius
{
  return self->_dayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius;
}

- (void)setDayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius:(double)a3
{
  self->_dayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius = a3;
}

- (double)oxygenSaturationMean
{
  return self->_oxygenSaturationMean;
}

- (void)setOxygenSaturationMean:(double)a3
{
  self->_oxygenSaturationMean = a3;
}

- (double)oxygenSaturationStdDev
{
  return self->_oxygenSaturationStdDev;
}

- (void)setOxygenSaturationStdDev:(double)a3
{
  self->_oxygenSaturationStdDev = a3;
}

- (double)oxygenSaturationMeanAtElevation
{
  return self->_oxygenSaturationMeanAtElevation;
}

- (void)setOxygenSaturationMeanAtElevation:(double)a3
{
  self->_oxygenSaturationMeanAtElevation = a3;
}

- (double)oxygenSaturationStdDevAtElevation
{
  return self->_oxygenSaturationStdDevAtElevation;
}

- (void)setOxygenSaturationStdDevAtElevation:(double)a3
{
  self->_oxygenSaturationStdDevAtElevation = a3;
}

- (double)oxygenSaturationMeasuringSuccessRate
{
  return self->_oxygenSaturationMeasuringSuccessRate;
}

- (void)setOxygenSaturationMeasuringSuccessRate:(double)a3
{
  self->_oxygenSaturationMeasuringSuccessRate = a3;
}

- (double)oxygenSaturationMeasuringSuccessRateDuringSleep
{
  return self->_oxygenSaturationMeasuringSuccessRateDuringSleep;
}

- (void)setOxygenSaturationMeasuringSuccessRateDuringSleep:(double)a3
{
  self->_oxygenSaturationMeasuringSuccessRateDuringSleep = a3;
}

- (double)oxygenSaturationSampleFrequency
{
  return self->_oxygenSaturationSampleFrequency;
}

- (void)setOxygenSaturationSampleFrequency:(double)a3
{
  self->_oxygenSaturationSampleFrequency = a3;
}

- (double)peripheralPerfusionIndexMean
{
  return self->_peripheralPerfusionIndexMean;
}

- (void)setPeripheralPerfusionIndexMean:(double)a3
{
  self->_peripheralPerfusionIndexMean = a3;
}

- (double)peripheralPerfusionIndexSampleFrequency
{
  return self->_peripheralPerfusionIndexSampleFrequency;
}

- (void)setPeripheralPerfusionIndexSampleFrequency:(double)a3
{
  self->_peripheralPerfusionIndexSampleFrequency = a3;
}

- (double)peripheralPerfusionIndexStdDev
{
  return self->_peripheralPerfusionIndexStdDev;
}

- (void)setPeripheralPerfusionIndexStdDev:(double)a3
{
  self->_peripheralPerfusionIndexStdDev = a3;
}

- (double)sexualActivityProbabilityPercentage
{
  return self->_sexualActivityProbabilityPercentage;
}

- (void)setSexualActivityProbabilityPercentage:(double)a3
{
  self->_sexualActivityProbabilityPercentage = a3;
}

- (double)sexualActivityProtectionProbabilityPercentage
{
  return self->_sexualActivityProtectionProbabilityPercentage;
}

- (void)setSexualActivityProtectionProbabilityPercentage:(double)a3
{
  self->_sexualActivityProtectionProbabilityPercentage = a3;
}

- (double)sexualActivityProtectionDocumentationProbabilityPercentage
{
  return self->_sexualActivityProtectionDocumentationProbabilityPercentage;
}

- (void)setSexualActivityProtectionDocumentationProbabilityPercentage:(double)a3
{
  self->_sexualActivityProtectionDocumentationProbabilityPercentage = a3;
}

- (double)menstrualPeriodFrequency
{
  return self->_menstrualPeriodFrequency;
}

- (void)setMenstrualPeriodFrequency:(double)a3
{
  self->_menstrualPeriodFrequency = a3;
}

- (BOOL)sexualActivityIsTryingToConceive
{
  return self->_sexualActivityIsTryingToConceive;
}

- (void)setSexualActivityIsTryingToConceive:(BOOL)a3
{
  self->_sexualActivityIsTryingToConceive = a3;
}

- (double)ovulationIndeterminateProbabilityPercentage
{
  return self->_ovulationIndeterminateProbabilityPercentage;
}

- (void)setOvulationIndeterminateProbabilityPercentage:(double)a3
{
  self->_ovulationIndeterminateProbabilityPercentage = a3;
}

- (double)fitzpatrickSkinTypeSampleTime
{
  return self->_fitzpatrickSkinTypeSampleTime;
}

- (void)setFitzpatrickSkinTypeSampleTime:(double)a3
{
  self->_fitzpatrickSkinTypeSampleTime = a3;
}

- (int64_t)fitzpatrickSkinTypeScore
{
  return self->_fitzpatrickSkinTypeScore;
}

- (void)setFitzpatrickSkinTypeScore:(int64_t)a3
{
  self->_fitzpatrickSkinTypeScore = a3;
}

- (double)toothbrushingDurationMean
{
  return self->_toothbrushingDurationMean;
}

- (void)setToothbrushingDurationMean:(double)a3
{
  self->_toothbrushingDurationMean = a3;
}

- (double)toothbrushingDurationMeanStdDev
{
  return self->_toothbrushingDurationMeanStdDev;
}

- (void)setToothbrushingDurationMeanStdDev:(double)a3
{
  self->_toothbrushingDurationMeanStdDev = a3;
}

- (double)handwashingDurationMean
{
  return self->_handwashingDurationMean;
}

- (void)setHandwashingDurationMean:(double)a3
{
  self->_handwashingDurationMean = a3;
}

- (double)handwashingDurationMeanStdDev
{
  return self->_handwashingDurationMeanStdDev;
}

- (void)setHandwashingDurationMeanStdDev:(double)a3
{
  self->_handwashingDurationMeanStdDev = a3;
}

- (double)handwashingSampleFrequency
{
  return self->_handwashingSampleFrequency;
}

- (void)setHandwashingSampleFrequency:(double)a3
{
  self->_handwashingSampleFrequency = a3;
}

- (double)handwashingSampleFrequencyStdDev
{
  return self->_handwashingSampleFrequencyStdDev;
}

- (void)setHandwashingSampleFrequencyStdDev:(double)a3
{
  self->_handwashingSampleFrequencyStdDev = a3;
}

- (double)timeInDaylightDurationMean
{
  return self->_timeInDaylightDurationMean;
}

- (void)setTimeInDaylightDurationMean:(double)a3
{
  self->_timeInDaylightDurationMean = a3;
}

- (double)timeInDaylightDurationMeanStdDev
{
  return self->_timeInDaylightDurationMeanStdDev;
}

- (void)setTimeInDaylightDurationMeanStdDev:(double)a3
{
  self->_timeInDaylightDurationMeanStdDev = a3;
}

- (double)timeInDaylightSampleFrequency
{
  return self->_timeInDaylightSampleFrequency;
}

- (void)setTimeInDaylightSampleFrequency:(double)a3
{
  self->_timeInDaylightSampleFrequency = a3;
}

- (double)timeInDaylightSampleFrequencyStdDev
{
  return self->_timeInDaylightSampleFrequencyStdDev;
}

- (void)setTimeInDaylightSampleFrequencyStdDev:(double)a3
{
  self->_timeInDaylightSampleFrequencyStdDev = a3;
}

- (double)activeCaloriesSampleFrequency
{
  return self->_activeCaloriesSampleFrequency;
}

- (void)setActiveCaloriesSampleFrequency:(double)a3
{
  self->_activeCaloriesSampleFrequency = a3;
}

- (double)restingCaloriesSampleFrequency
{
  return self->_restingCaloriesSampleFrequency;
}

- (void)setRestingCaloriesSampleFrequency:(double)a3
{
  self->_restingCaloriesSampleFrequency = a3;
}

- (double)stepsSampleFrequency
{
  return self->_stepsSampleFrequency;
}

- (void)setStepsSampleFrequency:(double)a3
{
  self->_stepsSampleFrequency = a3;
}

- (double)stepsSampleFrequencyDuringExercise
{
  return self->_stepsSampleFrequencyDuringExercise;
}

- (void)setStepsSampleFrequencyDuringExercise:(double)a3
{
  self->_stepsSampleFrequencyDuringExercise = a3;
}

- (double)sedentarySampleFrequency
{
  return self->_sedentarySampleFrequency;
}

- (void)setSedentarySampleFrequency:(double)a3
{
  self->_sedentarySampleFrequency = a3;
}

- (void)setExerciseTimeSampleFrequency:(double)a3
{
  self->_exerciseTimeSampleFrequency = a3;
}

- (double)moveGoal
{
  return self->_moveGoal;
}

- (void)setMoveGoal:(double)a3
{
  self->_moveGoal = a3;
}

- (double)exerciseGoal
{
  return self->_exerciseGoal;
}

- (void)setExerciseGoal:(double)a3
{
  self->_exerciseGoal = a3;
}

- (double)standGoal
{
  return self->_standGoal;
}

- (void)setStandGoal:(double)a3
{
  self->_standGoal = a3;
}

- (double)runningPowerMean
{
  return self->_runningPowerMean;
}

- (void)setRunningPowerMean:(double)a3
{
  self->_runningPowerMean = a3;
}

- (double)runningPowerMeanStdDev
{
  return self->_runningPowerMeanStdDev;
}

- (void)setRunningPowerMeanStdDev:(double)a3
{
  self->_runningPowerMeanStdDev = a3;
}

- (double)runningStrideLengthMean
{
  return self->_runningStrideLengthMean;
}

- (void)setRunningStrideLengthMean:(double)a3
{
  self->_runningStrideLengthMean = a3;
}

- (double)runningStrideLengthMeanStdDev
{
  return self->_runningStrideLengthMeanStdDev;
}

- (void)setRunningStrideLengthMeanStdDev:(double)a3
{
  self->_runningStrideLengthMeanStdDev = a3;
}

- (double)runningVerticalOscillationMean
{
  return self->_runningVerticalOscillationMean;
}

- (void)setRunningVerticalOscillationMean:(double)a3
{
  self->_runningVerticalOscillationMean = a3;
}

- (double)runningVerticalOscillationMeanStdDev
{
  return self->_runningVerticalOscillationMeanStdDev;
}

- (void)setRunningVerticalOscillationMeanStdDev:(double)a3
{
  self->_runningVerticalOscillationMeanStdDev = a3;
}

- (double)runningGroundContactTimeMean
{
  return self->_runningGroundContactTimeMean;
}

- (void)setRunningGroundContactTimeMean:(double)a3
{
  self->_runningGroundContactTimeMean = a3;
}

- (double)runningGroundContactTimeMeanStdDev
{
  return self->_runningGroundContactTimeMeanStdDev;
}

- (void)setRunningGroundContactTimeMeanStdDev:(double)a3
{
  self->_runningGroundContactTimeMeanStdDev = a3;
}

- (double)swimmingStrokesPerYard
{
  return self->_swimmingStrokesPerYard;
}

- (void)setSwimmingStrokesPerYard:(double)a3
{
  self->_swimmingStrokesPerYard = a3;
}

- (double)cyclingPowerMean
{
  return self->_cyclingPowerMean;
}

- (void)setCyclingPowerMean:(double)a3
{
  self->_cyclingPowerMean = a3;
}

- (double)cyclingPowerMeanStdDev
{
  return self->_cyclingPowerMeanStdDev;
}

- (void)setCyclingPowerMeanStdDev:(double)a3
{
  self->_cyclingPowerMeanStdDev = a3;
}

- (double)cyclingFTPMean
{
  return self->_cyclingFTPMean;
}

- (void)setCyclingFTPMean:(double)a3
{
  self->_cyclingFTPMean = a3;
}

- (double)cyclingFTPMeanStdDev
{
  return self->_cyclingFTPMeanStdDev;
}

- (void)setCyclingFTPMeanStdDev:(double)a3
{
  self->_cyclingFTPMeanStdDev = a3;
}

- (double)cyclingCadenceMean
{
  return self->_cyclingCadenceMean;
}

- (void)setCyclingCadenceMean:(double)a3
{
  self->_cyclingCadenceMean = a3;
}

- (double)cyclingCadenceMeanStdDev
{
  return self->_cyclingCadenceMeanStdDev;
}

- (void)setCyclingCadenceMeanStdDev:(double)a3
{
  self->_cyclingCadenceMeanStdDev = a3;
}

- (double)cyclingSpeedMean
{
  return self->_cyclingSpeedMean;
}

- (void)setCyclingSpeedMean:(double)a3
{
  self->_cyclingSpeedMean = a3;
}

- (double)speedMeanStdDev
{
  return self->_speedMeanStdDev;
}

- (void)setSpeedMeanStdDev:(double)a3
{
  self->_speedMeanStdDev = a3;
}

- (double)underwaterDivingWaterTemperatureMean
{
  return self->_underwaterDivingWaterTemperatureMean;
}

- (void)setUnderwaterDivingWaterTemperatureMean:(double)a3
{
  self->_underwaterDivingWaterTemperatureMean = a3;
}

- (double)underwaterDivingWaterTemperatureStdDev
{
  return self->_underwaterDivingWaterTemperatureStdDev;
}

- (void)setUnderwaterDivingWaterTemperatureStdDev:(double)a3
{
  self->_underwaterDivingWaterTemperatureStdDev = a3;
}

- (double)crossCountrySkiingSpeedMean
{
  return self->_crossCountrySkiingSpeedMean;
}

- (void)setCrossCountrySkiingSpeedMean:(double)a3
{
  self->_crossCountrySkiingSpeedMean = a3;
}

- (double)rowingSpeedMean
{
  return self->_rowingSpeedMean;
}

- (void)setRowingSpeedMean:(double)a3
{
  self->_rowingSpeedMean = a3;
}

- (double)paddleSportsSpeedMean
{
  return self->_paddleSportsSpeedMean;
}

- (void)setPaddleSportsSpeedMean:(double)a3
{
  self->_paddleSportsSpeedMean = a3;
}

- (double)exerciseStartTime
{
  return self->_exerciseStartTime;
}

- (void)setExerciseStartTime:(double)a3
{
  self->_exerciseStartTime = a3;
}

- (double)exerciseStopTime
{
  return self->_exerciseStopTime;
}

- (void)setExerciseStopTime:(double)a3
{
  self->_exerciseStopTime = a3;
}

- (double)exerciseCooldownTime
{
  return self->_exerciseCooldownTime;
}

- (void)setExerciseCooldownTime:(double)a3
{
  self->_exerciseCooldownTime = a3;
}

- (double)exerciseStartTimeStdDev
{
  return self->_exerciseStartTimeStdDev;
}

- (void)setExerciseStartTimeStdDev:(double)a3
{
  self->_exerciseStartTimeStdDev = a3;
}

- (double)exerciseStopTimeStdDev
{
  return self->_exerciseStopTimeStdDev;
}

- (void)setExerciseStopTimeStdDev:(double)a3
{
  self->_exerciseStopTimeStdDev = a3;
}

- (double)exerciseIntensityPercentage
{
  return self->_exerciseIntensityPercentage;
}

- (void)setExerciseIntensityPercentage:(double)a3
{
  self->_exerciseIntensityPercentage = a3;
}

- (NSDictionary)workoutPrototypesByCalendarDay
{
  return self->_workoutPrototypesByCalendarDay;
}

- (void)setWorkoutPrototypesByCalendarDay:(id)a3
{
}

- (double)exerciseWeeklyWorkoutsMean
{
  return self->_exerciseWeeklyWorkoutsMean;
}

- (void)setExerciseWeeklyWorkoutsMean:(double)a3
{
  self->_exerciseWeeklyWorkoutsMean = a3;
}

- (double)exerciseWeeklyWorkoutsStdDev
{
  return self->_exerciseWeeklyWorkoutsStdDev;
}

- (void)setExerciseWeeklyWorkoutsStdDev:(double)a3
{
  self->_exerciseWeeklyWorkoutsStdDev = a3;
}

- (double)exercisePostDietWeeklyWorkoutsMean
{
  return self->_exercisePostDietWeeklyWorkoutsMean;
}

- (void)setExercisePostDietWeeklyWorkoutsMean:(double)a3
{
  self->_exercisePostDietWeeklyWorkoutsMean = a3;
}

- (double)exercisePostDietWeeklyWorkoutsStdDev
{
  return self->_exercisePostDietWeeklyWorkoutsStdDev;
}

- (void)setExercisePostDietWeeklyWorkoutsStdDev:(double)a3
{
  self->_exercisePostDietWeeklyWorkoutsStdDev = a3;
}

- (double)flightsClimbedDailyMean
{
  return self->_flightsClimbedDailyMean;
}

- (void)setFlightsClimbedDailyMean:(double)a3
{
  self->_flightsClimbedDailyMean = a3;
}

- (double)flightsClimbedStdDev
{
  return self->_flightsClimbedStdDev;
}

- (void)setFlightsClimbedStdDev:(double)a3
{
  self->_flightsClimbedStdDev = a3;
}

- (double)flightsClimbedSampleTime
{
  return self->_flightsClimbedSampleTime;
}

- (void)setFlightsClimbedSampleTime:(double)a3
{
  self->_flightsClimbedSampleTime = a3;
}

- (double)flightsClimbedSampleFrequency
{
  return self->_flightsClimbedSampleFrequency;
}

- (void)setFlightsClimbedSampleFrequency:(double)a3
{
  self->_flightsClimbedSampleFrequency = a3;
}

- (double)flightsClimbedSampleFrequencyStdDev
{
  return self->_flightsClimbedSampleFrequencyStdDev;
}

- (void)setFlightsClimbedSampleFrequencyStdDev:(double)a3
{
  self->_flightsClimbedSampleFrequencyStdDev = a3;
}

- (double)rehabLogarithmicConstant
{
  return self->_rehabLogarithmicConstant;
}

- (void)setRehabLogarithmicConstant:(double)a3
{
  self->_rehabLogarithmicConstant = a3;
}

- (double)walkingSpeedMean
{
  return self->_walkingSpeedMean;
}

- (void)setWalkingSpeedMean:(double)a3
{
  self->_walkingSpeedMean = a3;
}

- (double)walkingSpeedStdDev
{
  return self->_walkingSpeedStdDev;
}

- (void)setWalkingSpeedStdDev:(double)a3
{
  self->_walkingSpeedStdDev = a3;
}

- (double)walkingSpeedSampleFrequency
{
  return self->_walkingSpeedSampleFrequency;
}

- (void)setWalkingSpeedSampleFrequency:(double)a3
{
  self->_walkingSpeedSampleFrequency = a3;
}

- (double)walkingSpeedSampleFrequencyStdDev
{
  return self->_walkingSpeedSampleFrequencyStdDev;
}

- (void)setWalkingSpeedSampleFrequencyStdDev:(double)a3
{
  self->_walkingSpeedSampleFrequencyStdDev = a3;
}

- (double)stepLengthMean
{
  return self->_stepLengthMean;
}

- (void)setStepLengthMean:(double)a3
{
  self->_stepLengthMean = a3;
}

- (double)stepLengthStdDev
{
  return self->_stepLengthStdDev;
}

- (void)setStepLengthStdDev:(double)a3
{
  self->_stepLengthStdDev = a3;
}

- (double)stepLengthSampleFrequency
{
  return self->_stepLengthSampleFrequency;
}

- (void)setStepLengthSampleFrequency:(double)a3
{
  self->_stepLengthSampleFrequency = a3;
}

- (double)stepLengthSampleFrequencyStdDev
{
  return self->_stepLengthSampleFrequencyStdDev;
}

- (void)setStepLengthSampleFrequencyStdDev:(double)a3
{
  self->_stepLengthSampleFrequencyStdDev = a3;
}

- (double)asymmetryPercentageMean
{
  return self->_asymmetryPercentageMean;
}

- (void)setAsymmetryPercentageMean:(double)a3
{
  self->_asymmetryPercentageMean = a3;
}

- (double)asymmetryPercentageStdDev
{
  return self->_asymmetryPercentageStdDev;
}

- (void)setAsymmetryPercentageStdDev:(double)a3
{
  self->_asymmetryPercentageStdDev = a3;
}

- (double)asymmetryPercentageSampleFrequency
{
  return self->_asymmetryPercentageSampleFrequency;
}

- (void)setAsymmetryPercentageSampleFrequency:(double)a3
{
  self->_asymmetryPercentageSampleFrequency = a3;
}

- (double)asymmetryPercentageSampleFrequencyStdDev
{
  return self->_asymmetryPercentageSampleFrequencyStdDev;
}

- (void)setAsymmetryPercentageSampleFrequencyStdDev:(double)a3
{
  self->_asymmetryPercentageSampleFrequencyStdDev = a3;
}

- (double)doubleSupportPercentageMean
{
  return self->_doubleSupportPercentageMean;
}

- (void)setDoubleSupportPercentageMean:(double)a3
{
  self->_doubleSupportPercentageMean = a3;
}

- (double)doubleSupportPercentageStdDev
{
  return self->_doubleSupportPercentageStdDev;
}

- (void)setDoubleSupportPercentageStdDev:(double)a3
{
  self->_doubleSupportPercentageStdDev = a3;
}

- (double)doubleSupportPercentageSampleFrequency
{
  return self->_doubleSupportPercentageSampleFrequency;
}

- (void)setDoubleSupportPercentageSampleFrequency:(double)a3
{
  self->_doubleSupportPercentageSampleFrequency = a3;
}

- (double)doubleSupportPercentageSampleFrequencyStdDev
{
  return self->_doubleSupportPercentageSampleFrequencyStdDev;
}

- (void)setDoubleSupportPercentageSampleFrequencyStdDev:(double)a3
{
  self->_doubleSupportPercentageSampleFrequencyStdDev = a3;
}

- (double)sixMinuteWalkTestDistanceMean
{
  return self->_sixMinuteWalkTestDistanceMean;
}

- (void)setSixMinuteWalkTestDistanceMean:(double)a3
{
  self->_sixMinuteWalkTestDistanceMean = a3;
}

- (double)sixMinuteWalkTestDistanceStdDev
{
  return self->_sixMinuteWalkTestDistanceStdDev;
}

- (void)setSixMinuteWalkTestDistanceStdDev:(double)a3
{
  self->_sixMinuteWalkTestDistanceStdDev = a3;
}

- (double)sixMinuteWalkTestDistanceSampleFrequency
{
  return self->_sixMinuteWalkTestDistanceSampleFrequency;
}

- (void)setSixMinuteWalkTestDistanceSampleFrequency:(double)a3
{
  self->_sixMinuteWalkTestDistanceSampleFrequency = a3;
}

- (double)sixMinuteWalkTestDistanceSampleFrequencyStdDev
{
  return self->_sixMinuteWalkTestDistanceSampleFrequencyStdDev;
}

- (void)setSixMinuteWalkTestDistanceSampleFrequencyStdDev:(double)a3
{
  self->_sixMinuteWalkTestDistanceSampleFrequencyStdDev = a3;
}

- (double)stairAscentSpeedMean
{
  return self->_stairAscentSpeedMean;
}

- (void)setStairAscentSpeedMean:(double)a3
{
  self->_stairAscentSpeedMean = a3;
}

- (double)stairAscentSpeedStdDev
{
  return self->_stairAscentSpeedStdDev;
}

- (void)setStairAscentSpeedStdDev:(double)a3
{
  self->_stairAscentSpeedStdDev = a3;
}

- (double)stairAscentSpeedSampleFrequency
{
  return self->_stairAscentSpeedSampleFrequency;
}

- (void)setStairAscentSpeedSampleFrequency:(double)a3
{
  self->_stairAscentSpeedSampleFrequency = a3;
}

- (double)stairAscentSpeedSampleFrequencyStdDev
{
  return self->_stairAscentSpeedSampleFrequencyStdDev;
}

- (void)setStairAscentSpeedSampleFrequencyStdDev:(double)a3
{
  self->_stairAscentSpeedSampleFrequencyStdDev = a3;
}

- (double)stairDescentSpeedMean
{
  return self->_stairDescentSpeedMean;
}

- (void)setStairDescentSpeedMean:(double)a3
{
  self->_stairDescentSpeedMean = a3;
}

- (double)stairDescentSpeedStdDev
{
  return self->_stairDescentSpeedStdDev;
}

- (void)setStairDescentSpeedStdDev:(double)a3
{
  self->_stairDescentSpeedStdDev = a3;
}

- (double)stairDescentSpeedSampleFrequency
{
  return self->_stairDescentSpeedSampleFrequency;
}

- (void)setStairDescentSpeedSampleFrequency:(double)a3
{
  self->_stairDescentSpeedSampleFrequency = a3;
}

- (double)stairDescentSpeedSampleFrequencyStdDev
{
  return self->_stairDescentSpeedSampleFrequencyStdDev;
}

- (void)setStairDescentSpeedSampleFrequencyStdDev:(double)a3
{
  self->_stairDescentSpeedSampleFrequencyStdDev = a3;
}

- (double)walkingSteadinessMean
{
  return self->_walkingSteadinessMean;
}

- (void)setWalkingSteadinessMean:(double)a3
{
  self->_walkingSteadinessMean = a3;
}

- (double)walkingSteadinessStdDev
{
  return self->_walkingSteadinessStdDev;
}

- (void)setWalkingSteadinessStdDev:(double)a3
{
  self->_walkingSteadinessStdDev = a3;
}

- (double)walkingSteadinessSampleFrequency
{
  return self->_walkingSteadinessSampleFrequency;
}

- (void)setWalkingSteadinessSampleFrequency:(double)a3
{
  self->_walkingSteadinessSampleFrequency = a3;
}

- (double)walkingSteadinessSampleFrequencyStdDev
{
  return self->_walkingSteadinessSampleFrequencyStdDev;
}

- (void)setWalkingSteadinessSampleFrequencyStdDev:(double)a3
{
  self->_walkingSteadinessSampleFrequencyStdDev = a3;
}

- (double)breakfastTime
{
  return self->_breakfastTime;
}

- (void)setBreakfastTime:(double)a3
{
  self->_breakfastTime = a3;
}

- (double)lunchTime
{
  return self->_lunchTime;
}

- (void)setLunchTime:(double)a3
{
  self->_lunchTime = a3;
}

- (double)snackTime
{
  return self->_snackTime;
}

- (void)setSnackTime:(double)a3
{
  self->_snackTime = a3;
}

- (double)dinnerTime
{
  return self->_dinnerTime;
}

- (void)setDinnerTime:(double)a3
{
  self->_dinnerTime = a3;
}

- (double)mealTimeSampleNoiseStdDev
{
  return self->_mealTimeSampleNoiseStdDev;
}

- (void)setMealTimeSampleNoiseStdDev:(double)a3
{
  self->_mealTimeSampleNoiseStdDev = a3;
}

- (double)breakfastTimeSampleNoiseStdDev
{
  return self->_breakfastTimeSampleNoiseStdDev;
}

- (void)setBreakfastTimeSampleNoiseStdDev:(double)a3
{
  self->_breakfastTimeSampleNoiseStdDev = a3;
}

- (double)preDietIntakeMultiplier
{
  return self->_preDietIntakeMultiplier;
}

- (void)setPreDietIntakeMultiplier:(double)a3
{
  self->_preDietIntakeMultiplier = a3;
}

- (double)numCupsOfCoffeeDailyMean
{
  return self->_numCupsOfCoffeeDailyMean;
}

- (void)setNumCupsOfCoffeeDailyMean:(double)a3
{
  self->_numCupsOfCoffeeDailyMean = a3;
}

- (double)numCupsOfCoffeeStdDev
{
  return self->_numCupsOfCoffeeStdDev;
}

- (void)setNumCupsOfCoffeeStdDev:(double)a3
{
  self->_numCupsOfCoffeeStdDev = a3;
}

- (double)waterConsumedSampleTime
{
  return self->_waterConsumedSampleTime;
}

- (void)setWaterConsumedSampleTime:(double)a3
{
  self->_waterConsumedSampleTime = a3;
}

- (double)waterConsumedSampleFrequency
{
  return self->_waterConsumedSampleFrequency;
}

- (void)setWaterConsumedSampleFrequency:(double)a3
{
  self->_waterConsumedSampleFrequency = a3;
}

- (double)waterConsumedDailyMean
{
  return self->_waterConsumedDailyMean;
}

- (void)setWaterConsumedDailyMean:(double)a3
{
  self->_waterConsumedDailyMean = a3;
}

- (double)waterConsumedStdDev
{
  return self->_waterConsumedStdDev;
}

- (void)setWaterConsumedStdDev:(double)a3
{
  self->_waterConsumedStdDev = a3;
}

- (double)waterConsumedIntervalMean
{
  return self->_waterConsumedIntervalMean;
}

- (void)setWaterConsumedIntervalMean:(double)a3
{
  self->_waterConsumedIntervalMean = a3;
}

- (double)waterConsumedIntervalStdDev
{
  return self->_waterConsumedIntervalStdDev;
}

- (void)setWaterConsumedIntervalStdDev:(double)a3
{
  self->_waterConsumedIntervalStdDev = a3;
}

- (HDDemoDataSleepParameters)weekdaySleepParameters
{
  return self->_weekdaySleepParameters;
}

- (void)setWeekdaySleepParameters:(id)a3
{
}

- (HDDemoDataSleepParameters)weekendSleepParameters
{
  return self->_weekendSleepParameters;
}

- (void)setWeekendSleepParameters:(id)a3
{
}

- (double)wakeUpTimeNoiseStdDev
{
  return self->_wakeUpTimeNoiseStdDev;
}

- (void)setWakeUpTimeNoiseStdDev:(double)a3
{
  self->_wakeUpTimeNoiseStdDev = a3;
}

- (double)bedtimeNoiseStdDev
{
  return self->_bedtimeNoiseStdDev;
}

- (void)setBedtimeNoiseStdDev:(double)a3
{
  self->_bedtimeNoiseStdDev = a3;
}

- (double)inBedTimeStdDev
{
  return self->_inBedTimeStdDev;
}

- (void)setInBedTimeStdDev:(double)a3
{
  self->_inBedTimeStdDev = a3;
}

- (double)fallSampleFrequency
{
  return self->_fallSampleFrequency;
}

- (void)setFallSampleFrequency:(double)a3
{
  self->_fallSampleFrequency = a3;
}

- (double)fallsDailyMean
{
  return self->_fallsDailyMean;
}

- (void)setFallsDailyMean:(double)a3
{
  self->_fallsDailyMean = a3;
}

- (double)fallsDailyStdDev
{
  return self->_fallsDailyStdDev;
}

- (void)setFallsDailyStdDev:(double)a3
{
  self->_fallsDailyStdDev = a3;
}

- (double)spirometrySampleFrequency
{
  return self->_spirometrySampleFrequency;
}

- (void)setSpirometrySampleFrequency:(double)a3
{
  self->_spirometrySampleFrequency = a3;
}

- (double)spirometrySampleTime
{
  return self->_spirometrySampleTime;
}

- (void)setSpirometrySampleTime:(double)a3
{
  self->_spirometrySampleTime = a3;
}

- (int64_t)asthmaSeverity
{
  return self->_asthmaSeverity;
}

- (void)setAsthmaSeverity:(int64_t)a3
{
  self->_asthmaSeverity = a3;
}

- (BOOL)useContinuousGlucoseMonitoring
{
  return self->_useContinuousGlucoseMonitoring;
}

- (void)setUseContinuousGlucoseMonitoring:(BOOL)a3
{
  self->_useContinuousGlucoseMonitoring = a3;
}

- (double)continuousGlucoseMonitoringSampleFrequency
{
  return self->_continuousGlucoseMonitoringSampleFrequency;
}

- (void)setContinuousGlucoseMonitoringSampleFrequency:(double)a3
{
  self->_continuousGlucoseMonitoringSampleFrequency = a3;
}

- (double)numDailyFingerSticksAdherence
{
  return self->_numDailyFingerSticksAdherence;
}

- (void)setNumDailyFingerSticksAdherence:(double)a3
{
  self->_numDailyFingerSticksAdherence = a3;
}

- (double)insulinSensitivity
{
  return self->_insulinSensitivity;
}

- (void)setInsulinSensitivity:(double)a3
{
  self->_insulinSensitivity = a3;
}

- (double)insulinProduction
{
  return self->_insulinProduction;
}

- (void)setInsulinProduction:(double)a3
{
  self->_insulinProduction = a3;
}

- (double)insulinAdherence
{
  return self->_insulinAdherence;
}

- (void)setInsulinAdherence:(double)a3
{
  self->_insulinAdherence = a3;
}

- (unint64_t)insulinTherapy
{
  return self->_insulinTherapy;
}

- (void)setInsulinTherapy:(unint64_t)a3
{
  self->_insulinTherapy = a3;
}

- (double)mindfulSessionFrequency
{
  return self->_mindfulSessionFrequency;
}

- (void)setMindfulSessionFrequency:(double)a3
{
  self->_mindfulSessionFrequency = a3;
}

- (int64_t)mindfulSessionMean
{
  return self->_mindfulSessionMean;
}

- (void)setMindfulSessionMean:(int64_t)a3
{
  self->_mindfulSessionMean = a3;
}

- (int64_t)mindfulSessionStdDev
{
  return self->_mindfulSessionStdDev;
}

- (void)setMindfulSessionStdDev:(int64_t)a3
{
  self->_mindfulSessionStdDev = a3;
}

- (int64_t)nutritionTrackingType
{
  return self->_nutritionTrackingType;
}

- (void)setNutritionTrackingType:(int64_t)a3
{
  self->_nutritionTrackingType = a3;
}

- (int64_t)resultsTrackingType
{
  return self->_resultsTrackingType;
}

- (void)setResultsTrackingType:(int64_t)a3
{
  self->_resultsTrackingType = a3;
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_weekendSleepParameters, 0);
  objc_storeStrong((id *)&self->_weekdaySleepParameters, 0);
  objc_storeStrong((id *)&self->_workoutPrototypesByCalendarDay, 0);
  objc_storeStrong((id *)&self->_weightGainHolidayDaysInYear, 0);
  objc_storeStrong((id *)&self->_birthDate, 0);
  objc_storeStrong((id *)&self->_birthDateComponents, 0);
  objc_storeStrong((id *)&self->_personDescription, 0);
  objc_storeStrong((id *)&self->_lastName, 0);

  objc_storeStrong((id *)&self->_firstName, 0);
}

@end