@interface HDHeartDailyAnalytics
- (HDHeartDailyAnalytics)init;
- (NSDictionary)payload;
- (id)copyWithZone:(_NSZone *)a3;
- (void)updateActiveWatchProductType:(id)a3;
- (void)updateActiveWatchSystemBuildVersion:(id)a3;
- (void)updateAgeInYears:(id)a3;
- (void)updateAlgorithmVersionIRN:(id)a3;
- (void)updateAreHealthNotificationsAuthorized:(BOOL)a3;
- (void)updateAtrialFibrillationDetectionV2CountryCode:(id)a3;
- (void)updateCountAnalyzedTachogramsPast24Hours:(int64_t)a3;
- (void)updateCountMobileAssetsDownloadedPast24Hours:(int64_t)a3;
- (void)updateCountRecordedTachogramsPast24Hours:(int64_t)a3;
- (void)updateDaysSinceLastCountryMonitorCheck:(id)a3;
- (void)updateDaysSinceLastCountryMonitorFetch:(id)a3;
- (void)updateECGActiveAlgorithmVersion:(id)a3;
- (void)updateECGOnboardingCountryCode:(id)a3;
- (void)updateECGUpdateVersionPhone:(id)a3;
- (void)updateECGUpdateVersionWatch:(id)a3;
- (void)updateElectrocardiogramClassificationCount:(int64_t)a3;
- (void)updateGlucoseEnhancedChartingCountryCode:(id)a3;
- (void)updateHighHeartRateNotificationThreshold:(id)a3;
- (void)updateIRNOnboardingCountryCode:(id)a3;
- (void)updateIrregularRhythmNotificationClassificationCount:(int64_t)a3;
- (void)updateIsAtrialFibrillationEnabled:(id)a3;
- (void)updateIsAtrialFibrillationEnabledV2:(id)a3;
- (void)updateIsBradycardiaDetectionEnabled:(BOOL)a3;
- (void)updateIsEcgOnboarded:(BOOL)a3;
- (void)updateIsGlucoseEnhancedChartingDelivered:(BOOL)a3;
- (void)updateIsImproveHealthAndActivityAllowed:(BOOL)a3;
- (void)updateIsIrnOnboarded:(BOOL)a3;
- (void)updateIsMenstrualCyclesHeartRateInputDelivered:(BOOL)a3;
- (void)updateIsRespiratoryRateDelivered:(BOOL)a3;
- (void)updateIsRespiratoryRateEnabledInPrivacy:(id)a3;
- (void)updateIsTachycardiaDetectionEnabled:(BOOL)a3;
- (void)updateLastCountryMonitorFetchBuildNumber:(id)a3;
- (void)updateLowHeartRateNotificationThreshold:(id)a3;
- (void)updateMenstrualCyclesHeartRateInputCountryCode:(id)a3;
- (void)updateNumberOfStandAndIdleHoursInPreviousCalendarDay:(id)a3;
- (void)updateOTAFactorPackID:(id)a3;
- (void)updateRespiratoryRateCountryCode:(id)a3;
- (void)updateSex:(int64_t)a3;
- (void)updateWasWatchWornPast24Hours:(BOOL)a3;
- (void)updateWeeksSinceElectrocardiogramOnboarded:(id)a3;
- (void)updateWithElectrocardiogramClassifications:(id)a3 isWithin24HoursPostIRN:(BOOL)a4;
@end

@implementation HDHeartDailyAnalytics

- (HDHeartDailyAnalytics)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDHeartDailyAnalytics;
  v2 = [(HDHeartDailyAnalytics *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    payload = v2->_payload;
    v2->_payload = v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSMutableDictionary *)self->_payload copy];
  objc_super v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSDictionary)payload
{
  v2 = (void *)[(NSMutableDictionary *)self->_payload copy];

  return (NSDictionary *)v2;
}

- (void)updateIsEcgOnboarded:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"isECGOnboarded"];
}

- (void)updateIsIrnOnboarded:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"isIRNOnboarded"];
}

- (void)updateIsImproveHealthAndActivityAllowed:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"isImproveHealthAndActivityAllowed"];
}

- (void)updateElectrocardiogramClassificationCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"ecgCount"];
}

- (void)updateIrregularRhythmNotificationClassificationCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"irregularRhythmNotificationCount"];
}

- (void)updateActiveWatchProductType:(id)a3
{
}

- (void)updateActiveWatchSystemBuildVersion:(id)a3
{
}

- (void)updateWeeksSinceElectrocardiogramOnboarded:(id)a3
{
}

- (void)updateWithElectrocardiogramClassifications:(id)a3 isWithin24HoursPostIRN:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = [*(id *)(*((void *)&v19 + 1) + 8 * v10) unsignedIntegerValue];
        if (!v4)
        {
          if (self)
          {
            v12 = off_1E630CD58;
            v13 = @"ecgClassificationCountWithin24HoursUnknown";
            if (v11 > 0xA) {
              goto LABEL_13;
            }
LABEL_12:
            v13 = v12[v11];
            goto LABEL_13;
          }
LABEL_18:
          v13 = 0;
          goto LABEL_13;
        }
        if (!self) {
          goto LABEL_18;
        }
        v12 = off_1E630CD00;
        v13 = @"ecgClassificationCountWithin24HoursPostIRNUnknown";
        if (v11 < 0xB) {
          goto LABEL_12;
        }
LABEL_13:
        v14 = v13;
        v15 = [(NSMutableDictionary *)self->_payload objectForKeyedSubscript:v14];
        v16 = v15;
        if (v15)
        {
          v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "integerValue") + 1);
          [(NSMutableDictionary *)self->_payload setObject:v17 forKeyedSubscript:v14];
        }
        else
        {
          [(NSMutableDictionary *)self->_payload setObject:&unk_1F17EEFB8 forKeyedSubscript:v14];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v18 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v8 = v18;
    }
    while (v18);
  }
}

- (void)updateECGActiveAlgorithmVersion:(id)a3
{
}

- (void)updateECGUpdateVersionPhone:(id)a3
{
}

- (void)updateECGUpdateVersionWatch:(id)a3
{
}

- (void)updateECGOnboardingCountryCode:(id)a3
{
}

- (void)updateIRNOnboardingCountryCode:(id)a3
{
}

- (void)updateIsAtrialFibrillationEnabled:(id)a3
{
}

- (void)updateWasWatchWornPast24Hours:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"wasWatchWornPast24Hours"];
}

- (void)updateCountRecordedTachogramsPast24Hours:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"countRecordedTachogramsPast24Hours"];
}

- (void)updateCountAnalyzedTachogramsPast24Hours:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"countAnalyzedTachogramsPast24Hours"];
}

- (void)updateCountMobileAssetsDownloadedPast24Hours:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"countMobileAssetsDownloadedPast24Hours"];
}

- (void)updateOTAFactorPackID:(id)a3
{
}

- (void)updateAgeInYears:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSNumber;
  id v6 = v4;
  id v9 = v6;
  if (v6)
  {
    if ([v6 integerValue] >= 22)
    {
      if ([v9 integerValue] >= 30)
      {
        if ([v9 integerValue] > 99) {
          uint64_t v7 = 100;
        }
        else {
          uint64_t v7 = 10 * ([v9 integerValue] / 10);
        }
      }
      else
      {
        uint64_t v7 = 22;
      }
    }
    else
    {
      uint64_t v7 = 21;
    }
  }
  else
  {
    uint64_t v7 = -1;
  }

  uint64_t v8 = [v5 numberWithInteger:v7];
  [(NSMutableDictionary *)self->_payload setObject:v8 forKeyedSubscript:@"age"];
}

- (void)updateSex:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    v3 = @"Unknown";
  }
  else {
    v3 = off_1E630CDB0[a3];
  }
  [(NSMutableDictionary *)self->_payload setObject:v3 forKeyedSubscript:@"sex"];
}

- (void)updateAreHealthNotificationsAuthorized:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"areHealthNotificationsAuthorized"];
}

- (void)updateNumberOfStandAndIdleHoursInPreviousCalendarDay:(id)a3
{
}

- (void)updateDaysSinceLastCountryMonitorCheck:(id)a3
{
}

- (void)updateDaysSinceLastCountryMonitorFetch:(id)a3
{
}

- (void)updateLastCountryMonitorFetchBuildNumber:(id)a3
{
}

- (void)updateIsGlucoseEnhancedChartingDelivered:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"isGlucoseEnhancedChartingDelivered"];
}

- (void)updateGlucoseEnhancedChartingCountryCode:(id)a3
{
}

- (void)updateHighHeartRateNotificationThreshold:(id)a3
{
}

- (void)updateLowHeartRateNotificationThreshold:(id)a3
{
}

- (void)updateIsTachycardiaDetectionEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"isTachycardiaDetectionEnabled"];
}

- (void)updateIsBradycardiaDetectionEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"isBradycardiaDetectionEnabled"];
}

- (void)updateAlgorithmVersionIRN:(id)a3
{
}

- (void)updateAtrialFibrillationDetectionV2CountryCode:(id)a3
{
}

- (void)updateIsAtrialFibrillationEnabledV2:(id)a3
{
}

- (void)updateIsMenstrualCyclesHeartRateInputDelivered:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"isMenstrualCyclesHeartRateInputDelivered"];
}

- (void)updateMenstrualCyclesHeartRateInputCountryCode:(id)a3
{
}

- (void)updateIsRespiratoryRateDelivered:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)self->_payload setObject:v4 forKeyedSubscript:@"isRespiratoryRateDelivered"];
}

- (void)updateIsRespiratoryRateEnabledInPrivacy:(id)a3
{
}

- (void)updateRespiratoryRateCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end