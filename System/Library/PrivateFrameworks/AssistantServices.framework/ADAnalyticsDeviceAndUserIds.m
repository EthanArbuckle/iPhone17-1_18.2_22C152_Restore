@interface ADAnalyticsDeviceAndUserIds
+ (id)_deviceAggregationIdNamespace;
+ (id)deviceAggregationIdWithDeviceId:(id)a3 forUserAggregationId:(id)a4;
- (ADAnalyticsDeviceAndUserIds)initWithFixedDeviceId:(id)a3 withUserEphemeralId:(id)a4 withUserAggregationId:(id)a5 withUserAggregationIdEffectiveFrom:(id)a6 withUserAggregationIdExpiration:(id)a7;
- (NSDate)userAggregationIdEffectiveFrom;
- (NSDate)userAggregationIdExpiration;
- (NSUUID)deviceAggregationId;
- (NSUUID)userAggregationId;
- (NSUUID)userEphemeralId;
@end

@implementation ADAnalyticsDeviceAndUserIds

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAggregationIdExpiration, 0);
  objc_storeStrong((id *)&self->_userAggregationIdEffectiveFrom, 0);
  objc_storeStrong((id *)&self->_userAggregationId, 0);
  objc_storeStrong((id *)&self->_userEphemeralId, 0);
  objc_storeStrong((id *)&self->_deviceAggregationId, 0);
}

- (NSDate)userAggregationIdExpiration
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)userAggregationIdEffectiveFrom
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)userAggregationId
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)userEphemeralId
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)deviceAggregationId
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (ADAnalyticsDeviceAndUserIds)initWithFixedDeviceId:(id)a3 withUserEphemeralId:(id)a4 withUserAggregationId:(id)a5 withUserAggregationIdEffectiveFrom:(id)a6 withUserAggregationIdExpiration:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ADAnalyticsDeviceAndUserIds;
  v17 = [(ADAnalyticsDeviceAndUserIds *)&v21 init];
  if (v17)
  {
    uint64_t v18 = +[ADAnalyticsDeviceAndUserIds deviceAggregationIdWithDeviceId:v12 forUserAggregationId:v14];
    deviceAggregationId = v17->_deviceAggregationId;
    v17->_deviceAggregationId = (NSUUID *)v18;

    objc_storeStrong((id *)&v17->_userEphemeralId, a4);
    objc_storeStrong((id *)&v17->_userAggregationId, a5);
    objc_storeStrong((id *)&v17->_userAggregationIdEffectiveFrom, a6);
    objc_storeStrong((id *)&v17->_userAggregationIdExpiration, a7);
  }

  return v17;
}

+ (id)deviceAggregationIdWithDeviceId:(id)a3 forUserAggregationId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 _deviceAggregationIdNamespace];
  v9 = +[NSUUID ad_createV5UUIDWithNamespace:](NSUUID, "ad_createV5UUIDWithNamespace:", v8, v6, v7, 0);

  return v9;
}

+ (id)_deviceAggregationIdNamespace
{
  if (qword_100585CF8 != -1) {
    dispatch_once(&qword_100585CF8, &stru_100503CA8);
  }
  v2 = (void *)qword_100585CF0;
  return v2;
}

@end