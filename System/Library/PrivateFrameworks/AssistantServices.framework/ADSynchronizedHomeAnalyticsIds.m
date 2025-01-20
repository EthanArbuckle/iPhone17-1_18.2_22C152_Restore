@interface ADSynchronizedHomeAnalyticsIds
- (ADSynchronizedHomeAnalyticsIds)initWithHomeEphemeralSeeds:(id)a3;
- (id)description;
- (unint64_t)_populateNullAggregationIdsWithCreationTime:(id)a3 today:(id)a4;
@end

@implementation ADSynchronizedHomeAnalyticsIds

- (unint64_t)_populateNullAggregationIdsWithCreationTime:(id)a3 today:(id)a4
{
  return 0;
}

- (id)description
{
  v2 = [(ADSynchronizedIds *)self ephemeralSeeds];
  v3 = +[NSString stringWithFormat:@"homeEphemeralSeeds:(%@)", v2];

  return v3;
}

- (ADSynchronizedHomeAnalyticsIds)initWithHomeEphemeralSeeds:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ADSynchronizedHomeAnalyticsIds;
  return [(ADSynchronizedIds *)&v4 initWithEphemeralSeeds:a3 andAggregationIds:0];
}

@end