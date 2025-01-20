@interface HKOnboardingUIErrorAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (HKOnboardingUIErrorAnalyticsEvent)initWithFeatureIdentifier:(id)a3 featureVersion:(id)a4 countryCode:(id)a5 step:(id)a6 errorCategory:(id)a7 errorDetail:(id)a8 OTAFactorPackID:(id)a9;
- (HKOnboardingUIErrorAnalyticsEvent)initWithFeatureIdentifier:(id)a3 featureVersion:(id)a4 countryCode:(id)a5 step:(id)a6 onboardingEligibility:(id)a7;
- (HKOnboardingUIErrorAnalyticsEvent)initWithFeatureIdentifier:(id)a3 featureVersion:(id)a4 countryCode:(id)a5 step:(id)a6 onboardingIneligibilityReasons:(unint64_t)a7;
- (NSString)OTAFactorPackID;
- (NSString)countryCode;
- (NSString)errorCategory;
- (NSString)errorDetail;
- (NSString)eventName;
- (NSString)featureIdentifier;
- (NSString)featureVersion;
- (NSString)step;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HKOnboardingUIErrorAnalyticsEvent

- (HKOnboardingUIErrorAnalyticsEvent)initWithFeatureIdentifier:(id)a3 featureVersion:(id)a4 countryCode:(id)a5 step:(id)a6 onboardingEligibility:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = HKAnalyticsErrorCategoryForFeatureAvailabilityOnboardingEligibility();
  v18 = HKAnalyticsErrorDetailsForFeatureAvailabilityOnboardingEligibility();

  v19 = HKOTAFactorPackID();
  v20 = [(HKOnboardingUIErrorAnalyticsEvent *)self initWithFeatureIdentifier:v16 featureVersion:v15 countryCode:v14 step:v13 errorCategory:v17 errorDetail:v18 OTAFactorPackID:v19];

  return v20;
}

- (HKOnboardingUIErrorAnalyticsEvent)initWithFeatureIdentifier:(id)a3 featureVersion:(id)a4 countryCode:(id)a5 step:(id)a6 onboardingIneligibilityReasons:(unint64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = HKAnalyticsErrorCategoryForFeatureAvailabilityOnboardingIneligibilityReasons();
  id v16 = HKAnalyticsErrorDetailsForFeatureAvailabilityOnboardingIneligibilityReasons();
  v17 = HKOTAFactorPackID();
  v18 = [(HKOnboardingUIErrorAnalyticsEvent *)self initWithFeatureIdentifier:v14 featureVersion:v13 countryCode:v12 step:v11 errorCategory:v15 errorDetail:v16 OTAFactorPackID:v17];

  return v18;
}

- (HKOnboardingUIErrorAnalyticsEvent)initWithFeatureIdentifier:(id)a3 featureVersion:(id)a4 countryCode:(id)a5 step:(id)a6 errorCategory:(id)a7 errorDetail:(id)a8 OTAFactorPackID:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)HKOnboardingUIErrorAnalyticsEvent;
  v22 = [(HKOnboardingUIErrorAnalyticsEvent *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    featureIdentifier = v22->_featureIdentifier;
    v22->_featureIdentifier = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    featureVersion = v22->_featureVersion;
    v22->_featureVersion = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    countryCode = v22->_countryCode;
    v22->_countryCode = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    step = v22->_step;
    v22->_step = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    errorCategory = v22->_errorCategory;
    v22->_errorCategory = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    errorDetail = v22->_errorDetail;
    v22->_errorDetail = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    OTAFactorPackID = v22->_OTAFactorPackID;
    v22->_OTAFactorPackID = (NSString *)v35;
  }
  return v22;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.health.onboardingerrors";
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v6 setObject:self->_countryCode forKeyedSubscript:@"countryCode"];
  v7 = [v5 healthDataSource];
  v8 = [v5 environmentDataSource];
  v9 = [v8 currentDate];
  v10 = [v7 ageWithCurrentDate:v9 error:0];

  if (v10)
  {
    id v11 = HKAnalyticsDecadeBucketedAgeForAge();
    [v6 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F29688]];
  }
  else
  {
    [v6 setObject:*MEMORY[0x1E4F29668] forKeyedSubscript:*MEMORY[0x1E4F29688]];
  }
  id v12 = [v5 healthDataSource];
  id v13 = [v12 biologicalSexWithError:0];

  if (v13)
  {
    id v14 = HKAnalyticsPropertyValueForBiologicalSex();
    [v6 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F29698]];
  }
  else
  {
    [v6 setObject:*MEMORY[0x1E4F296C8] forKeyedSubscript:*MEMORY[0x1E4F29698]];
  }
  id v15 = (void *)[v6 copy];

  return v15;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setObject:self->_featureIdentifier forKeyedSubscript:@"featureIdentifier"];
  [v7 setObject:self->_featureVersion forKeyedSubscript:@"featureVersion"];
  [v7 setObject:self->_step forKeyedSubscript:@"step"];
  [v7 setObject:self->_errorCategory forKeyedSubscript:@"errorCategory"];
  [v7 setObject:self->_errorDetail forKeyedSubscript:@"errorDetail"];
  [v7 setObject:self->_OTAFactorPackID forKeyedSubscript:@"OTAFactorPackID"];
  v8 = NSNumber;
  v9 = [v6 environmentDataSource];
  v10 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "isImproveHealthAndActivityEnabled"));
  [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F296C0]];

  id v11 = [v6 environmentDataSource];
  id v12 = [v11 activePairedDeviceProductType];
  [v7 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F29680]];

  id v13 = [v6 environmentDataSource];
  id v14 = [v13 activePairedDeviceModelNumber];
  [v7 setObject:v14 forKeyedSubscript:@"activeWatchPPN"];

  id v15 = [v6 environmentDataSource];

  id v16 = [v15 activePairedDeviceRegionInfo];
  [v7 setObject:v16 forKeyedSubscript:@"activeWatchRegionInfo"];

  id v17 = (void *)[v7 copy];
  return v17;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)featureVersion
{
  return self->_featureVersion;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)step
{
  return self->_step;
}

- (NSString)errorCategory
{
  return self->_errorCategory;
}

- (NSString)errorDetail
{
  return self->_errorDetail;
}

- (NSString)OTAFactorPackID
{
  return self->_OTAFactorPackID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OTAFactorPackID, 0);
  objc_storeStrong((id *)&self->_errorDetail, 0);
  objc_storeStrong((id *)&self->_errorCategory, 0);
  objc_storeStrong((id *)&self->_step, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_featureVersion, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end