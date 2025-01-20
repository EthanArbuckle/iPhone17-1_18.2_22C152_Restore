@interface HKMCOnboardingCompletionInfo
- (BOOL)deviationDetectionEnabled;
- (BOOL)fertileWindowProjectionsEnabled;
- (BOOL)fertilityTrackingDisplayTypesVisible;
- (BOOL)menstruationProjectionsEnabled;
- (BOOL)sexualActivityDisplayTypeVisible;
- (HKCurrentCountryCode)deviationDetectionSupportedCountryCode;
- (HKCurrentCountryCode)heartRateInputSupportedCountryCode;
- (HKCurrentCountryCode)wristTemperatureInputSupportedCountryCode;
- (HKMCOnboardingCompletionInfo)initWithUserEnteredCycleLength:(id)a3 userEnteredPeriodLength:(id)a4 userEnteredLastPeriodStartDay:(id)a5 addedCycleFactors:(id)a6 deletedCycleFactors:(id)a7 menstruationProjectionsEnabled:(BOOL)a8 fertileWindowProjectionsEnabled:(BOOL)a9 deviationDetectionEnabled:(BOOL)a10 fertilityTrackingDisplayTypesVisible:(BOOL)a11 sexualActivityDisplayTypeVisible:(BOOL)a12 heartRateInputSupportedCountryCode:(id)a13 deviationDetectionSupportedCountryCode:(id)a14 wristTemperatureInputSupportedCountryCode:(id)a15 heartRateInputEnabled:(id)a16 wristTemperatureInputEnabled:(id)a17;
- (HKQuantity)userEnteredCycleLength;
- (HKQuantity)userEnteredPeriodLength;
- (NSArray)addedCycleFactors;
- (NSArray)deletedCycleFactors;
- (NSNumber)heartRateInputEnabled;
- (NSNumber)userEnteredLastPeriodStartDay;
- (NSNumber)wristTemperatureInputEnabled;
@end

@implementation HKMCOnboardingCompletionInfo

- (HKMCOnboardingCompletionInfo)initWithUserEnteredCycleLength:(id)a3 userEnteredPeriodLength:(id)a4 userEnteredLastPeriodStartDay:(id)a5 addedCycleFactors:(id)a6 deletedCycleFactors:(id)a7 menstruationProjectionsEnabled:(BOOL)a8 fertileWindowProjectionsEnabled:(BOOL)a9 deviationDetectionEnabled:(BOOL)a10 fertilityTrackingDisplayTypesVisible:(BOOL)a11 sexualActivityDisplayTypeVisible:(BOOL)a12 heartRateInputSupportedCountryCode:(id)a13 deviationDetectionSupportedCountryCode:(id)a14 wristTemperatureInputSupportedCountryCode:(id)a15 heartRateInputEnabled:(id)a16 wristTemperatureInputEnabled:(id)a17
{
  id v48 = a3;
  id v47 = a4;
  id v46 = a5;
  id v45 = a6;
  id v44 = a7;
  id v22 = a13;
  id v23 = a14;
  id v43 = a15;
  id v24 = a16;
  id v25 = a17;
  v49.receiver = self;
  v49.super_class = (Class)HKMCOnboardingCompletionInfo;
  v26 = [(HKMCOnboardingCompletionInfo *)&v49 init];
  if (v26)
  {
    uint64_t v27 = [v48 copy];
    userEnteredCycleLength = v26->_userEnteredCycleLength;
    v26->_userEnteredCycleLength = (HKQuantity *)v27;

    uint64_t v29 = [v47 copy];
    userEnteredPeriodLength = v26->_userEnteredPeriodLength;
    v26->_userEnteredPeriodLength = (HKQuantity *)v29;

    uint64_t v31 = [v46 copy];
    userEnteredLastPeriodStartDay = v26->_userEnteredLastPeriodStartDay;
    v26->_userEnteredLastPeriodStartDay = (NSNumber *)v31;

    uint64_t v33 = [v45 copy];
    addedCycleFactors = v26->_addedCycleFactors;
    v26->_addedCycleFactors = (NSArray *)v33;

    uint64_t v35 = [v44 copy];
    deletedCycleFactors = v26->_deletedCycleFactors;
    v26->_deletedCycleFactors = (NSArray *)v35;

    v26->_menstruationProjectionsEnabled = a8;
    v26->_fertileWindowProjectionsEnabled = a9;
    v26->_deviationDetectionEnabled = a10;
    v26->_fertilityTrackingDisplayTypesVisible = a11;
    v26->_sexualActivityDisplayTypeVisible = a12;
    objc_storeStrong((id *)&v26->_heartRateInputSupportedCountryCode, a13);
    objc_storeStrong((id *)&v26->_deviationDetectionSupportedCountryCode, a14);
    objc_storeStrong((id *)&v26->_wristTemperatureInputSupportedCountryCode, a15);
    uint64_t v37 = [v24 copy];
    heartRateInputEnabled = v26->_heartRateInputEnabled;
    v26->_heartRateInputEnabled = (NSNumber *)v37;

    uint64_t v39 = [v25 copy];
    wristTemperatureInputEnabled = v26->_wristTemperatureInputEnabled;
    v26->_wristTemperatureInputEnabled = (NSNumber *)v39;
  }
  return v26;
}

- (HKQuantity)userEnteredCycleLength
{
  return self->_userEnteredCycleLength;
}

- (HKQuantity)userEnteredPeriodLength
{
  return self->_userEnteredPeriodLength;
}

- (NSNumber)userEnteredLastPeriodStartDay
{
  return self->_userEnteredLastPeriodStartDay;
}

- (NSArray)addedCycleFactors
{
  return self->_addedCycleFactors;
}

- (NSArray)deletedCycleFactors
{
  return self->_deletedCycleFactors;
}

- (BOOL)menstruationProjectionsEnabled
{
  return self->_menstruationProjectionsEnabled;
}

- (BOOL)fertileWindowProjectionsEnabled
{
  return self->_fertileWindowProjectionsEnabled;
}

- (BOOL)deviationDetectionEnabled
{
  return self->_deviationDetectionEnabled;
}

- (BOOL)fertilityTrackingDisplayTypesVisible
{
  return self->_fertilityTrackingDisplayTypesVisible;
}

- (BOOL)sexualActivityDisplayTypeVisible
{
  return self->_sexualActivityDisplayTypeVisible;
}

- (HKCurrentCountryCode)heartRateInputSupportedCountryCode
{
  return self->_heartRateInputSupportedCountryCode;
}

- (HKCurrentCountryCode)deviationDetectionSupportedCountryCode
{
  return self->_deviationDetectionSupportedCountryCode;
}

- (HKCurrentCountryCode)wristTemperatureInputSupportedCountryCode
{
  return self->_wristTemperatureInputSupportedCountryCode;
}

- (NSNumber)heartRateInputEnabled
{
  return self->_heartRateInputEnabled;
}

- (NSNumber)wristTemperatureInputEnabled
{
  return self->_wristTemperatureInputEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wristTemperatureInputEnabled, 0);
  objc_storeStrong((id *)&self->_heartRateInputEnabled, 0);
  objc_storeStrong((id *)&self->_wristTemperatureInputSupportedCountryCode, 0);
  objc_storeStrong((id *)&self->_deviationDetectionSupportedCountryCode, 0);
  objc_storeStrong((id *)&self->_heartRateInputSupportedCountryCode, 0);
  objc_storeStrong((id *)&self->_deletedCycleFactors, 0);
  objc_storeStrong((id *)&self->_addedCycleFactors, 0);
  objc_storeStrong((id *)&self->_userEnteredLastPeriodStartDay, 0);
  objc_storeStrong((id *)&self->_userEnteredPeriodLength, 0);
  objc_storeStrong((id *)&self->_userEnteredCycleLength, 0);
}

@end