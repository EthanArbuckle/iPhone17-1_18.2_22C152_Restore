@interface HDBackgroundFeatureDeliveryAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (HDBackgroundFeatureDeliveryAnalyticsEvent)initWithFeatureIdentifier:(id)a3 eventType:(id)a4 countryCode:(id)a5 countryCodeProvenance:(int64_t)a6 errorCategory:(id)a7 errorDetail:(id)a8;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HDBackgroundFeatureDeliveryAnalyticsEvent

- (HDBackgroundFeatureDeliveryAnalyticsEvent)initWithFeatureIdentifier:(id)a3 eventType:(id)a4 countryCode:(id)a5 countryCodeProvenance:(int64_t)a6 errorCategory:(id)a7 errorDetail:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)HDBackgroundFeatureDeliveryAnalyticsEvent;
  v19 = [(HDBackgroundFeatureDeliveryAnalyticsEvent *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    featureIdentifier = v19->_featureIdentifier;
    v19->_featureIdentifier = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    eventType = v19->_eventType;
    v19->_eventType = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    countryCode = v19->_countryCode;
    v19->_countryCode = (NSString *)v24;

    v19->_countryCodeProvenance = a6;
    uint64_t v26 = [v17 copy];
    errorCategory = v19->_errorCategory;
    v19->_errorCategory = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    errorDetail = v19->_errorDetail;
    v19->_errorDetail = (NSString *)v28;
  }
  return v19;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.health.location.gated.delivery.event";
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v18[0] = @"eventType";
  v18[1] = @"featureIdentifier";
  featureIdentifier = self->_featureIdentifier;
  v19[0] = self->_eventType;
  v19[1] = featureIdentifier;
  v18[2] = @"provenance";
  id v6 = a3;
  v7 = NSStringFromHKOnboardingCompletionCountryCodeProvenance();
  v19[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  v9 = (void *)[v8 mutableCopy];

  [v9 setObject:self->_errorCategory forKeyedSubscript:@"errorCategory"];
  [v9 setObject:self->_errorDetail forKeyedSubscript:@"errorDetail"];
  v10 = [MEMORY[0x1E4FB0098] clientWithIdentifier:275];
  v11 = [v10 rolloutIdentifiersWithNamespaceName:*MEMORY[0x1E4F2A278]];
  v12 = [v11 factorPackId];
  [v9 setObject:v12 forKeyedSubscript:@"OTAFactorPackID"];

  v13 = [v6 environmentDataSource];

  uint64_t v14 = [v13 isImproveHealthAndActivityEnabled];
  id v15 = [NSNumber numberWithBool:v14];
  [v9 setObject:v15 forKeyedSubscript:@"isImproveHealthAndActivityAllowed"];

  id v16 = (void *)[v9 copy];

  return v16;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  countryCode = self->_countryCode;
  if (countryCode)
  {
    v7 = @"countryCode";
    v8[0] = countryCode;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDetail, 0);
  objc_storeStrong((id *)&self->_errorCategory, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_eventType, 0);

  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end