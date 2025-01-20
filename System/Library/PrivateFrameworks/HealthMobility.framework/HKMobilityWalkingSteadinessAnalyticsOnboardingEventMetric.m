@interface HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric
+ (BOOL)requiresImproveHealthAndActivityAllowed;
- (BOOL)isImproveHealthAndActivityAllowed;
- (HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric)initWithImproveHealthAndActivityAllowed:(BOOL)a3;
- (NSNumber)acceptDefaultHeight;
- (NSNumber)acceptDefaultNotifications;
- (NSNumber)acceptDefaultWeight;
- (NSNumber)age;
- (NSNumber)biologicalSex;
- (NSNumber)hasDefaultHeight;
- (NSNumber)hasDefaultWeight;
- (NSString)activeWatchProductType;
- (NSString)featureVersion;
- (NSString)provenance;
- (NSString)step;
- (id)eventName;
- (id)eventPayload;
- (void)setAcceptDefaultHeight:(id)a3;
- (void)setAcceptDefaultNotifications:(id)a3;
- (void)setAcceptDefaultWeight:(id)a3;
- (void)setActiveWatchProductType:(id)a3;
- (void)setAge:(id)a3;
- (void)setBiologicalSex:(id)a3;
- (void)setFeatureVersion:(id)a3;
- (void)setHasDefaultHeight:(id)a3;
- (void)setHasDefaultWeight:(id)a3;
- (void)setImproveHealthAndActivityAllowed:(BOOL)a3;
- (void)setProvenance:(id)a3;
- (void)setStep:(id)a3;
@end

@implementation HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric

- (HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric)initWithImproveHealthAndActivityAllowed:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric;
  result = [(HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *)&v5 init];
  if (result) {
    result->_improveHealthAndActivityAllowed = a3;
  }
  return result;
}

+ (BOOL)requiresImproveHealthAndActivityAllowed
{
  return 0;
}

- (id)eventName
{
  return @"com.apple.health.walkingsteadiness.onboarding";
}

- (id)eventPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric isImproveHealthAndActivityAllowed](self, "isImproveHealthAndActivityAllowed"));
  [v3 setObject:v4 forKeyedSubscript:@"isImproveHealthAndActivityAllowed"];

  objc_super v5 = [(HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *)self step];
  [v3 setObject:v5 forKeyedSubscript:@"step"];

  v6 = [(HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *)self featureVersion];
  [v3 setObject:v6 forKeyedSubscript:@"featureVersion"];

  v7 = [(HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *)self provenance];
  [v3 setObject:v7 forKeyedSubscript:@"provenance"];

  v8 = +[HKMobilityAnalyticsUtilities activeWatchProductType];
  [v3 setObject:v8 forKeyedSubscript:@"activeWatchProductType"];

  v9 = [(HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *)self hasDefaultHeight];
  [v3 setObject:v9 forKeyedSubscript:@"hasDefaultHeight"];

  v10 = [(HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *)self hasDefaultWeight];
  [v3 setObject:v10 forKeyedSubscript:@"hasDefaultWeight"];

  v11 = [(HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *)self acceptDefaultHeight];
  [v3 setObject:v11 forKeyedSubscript:@"acceptDefaultHeight"];

  v12 = [(HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *)self acceptDefaultWeight];
  [v3 setObject:v12 forKeyedSubscript:@"acceptDefaultWeight"];

  v13 = [(HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *)self acceptDefaultNotifications];
  [v3 setObject:v13 forKeyedSubscript:@"acceptDefaultNotifications"];

  v14 = [(HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *)self age];
  v15 = +[HKMobilityAnalyticsUtilities payloadValueForAge:v14];
  [v3 setObject:v15 forKeyedSubscript:@"age"];

  v16 = [(HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *)self biologicalSex];
  v17 = +[HKMobilityAnalyticsUtilities payloadStringForBiologicalSex:v16];
  [v3 setObject:v17 forKeyedSubscript:@"sex"];

  v18 = (void *)[v3 copy];

  return v18;
}

- (BOOL)isImproveHealthAndActivityAllowed
{
  return self->_improveHealthAndActivityAllowed;
}

- (void)setImproveHealthAndActivityAllowed:(BOOL)a3
{
  self->_improveHealthAndActivityAllowed = a3;
}

- (NSString)step
{
  return self->_step;
}

- (void)setStep:(id)a3
{
}

- (NSString)featureVersion
{
  return self->_featureVersion;
}

- (void)setFeatureVersion:(id)a3
{
}

- (NSString)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(id)a3
{
}

- (NSString)activeWatchProductType
{
  return self->_activeWatchProductType;
}

- (void)setActiveWatchProductType:(id)a3
{
}

- (NSNumber)hasDefaultHeight
{
  return self->_hasDefaultHeight;
}

- (void)setHasDefaultHeight:(id)a3
{
}

- (NSNumber)hasDefaultWeight
{
  return self->_hasDefaultWeight;
}

- (void)setHasDefaultWeight:(id)a3
{
}

- (NSNumber)acceptDefaultHeight
{
  return self->_acceptDefaultHeight;
}

- (void)setAcceptDefaultHeight:(id)a3
{
}

- (NSNumber)acceptDefaultWeight
{
  return self->_acceptDefaultWeight;
}

- (void)setAcceptDefaultWeight:(id)a3
{
}

- (NSNumber)acceptDefaultNotifications
{
  return self->_acceptDefaultNotifications;
}

- (void)setAcceptDefaultNotifications:(id)a3
{
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
}

- (NSNumber)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biologicalSex, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_acceptDefaultNotifications, 0);
  objc_storeStrong((id *)&self->_acceptDefaultWeight, 0);
  objc_storeStrong((id *)&self->_acceptDefaultHeight, 0);
  objc_storeStrong((id *)&self->_hasDefaultWeight, 0);
  objc_storeStrong((id *)&self->_hasDefaultHeight, 0);
  objc_storeStrong((id *)&self->_activeWatchProductType, 0);
  objc_storeStrong((id *)&self->_provenance, 0);
  objc_storeStrong((id *)&self->_featureVersion, 0);

  objc_storeStrong((id *)&self->_step, 0);
}

@end