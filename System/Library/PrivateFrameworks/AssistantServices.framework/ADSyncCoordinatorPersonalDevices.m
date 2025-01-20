@interface ADSyncCoordinatorPersonalDevices
- (ADSyncCoordinatorPersonalDevices)init;
- (BOOL)addAggregationIdForUser:(id)a3 aggregationId:(id)a4;
- (BOOL)addSeedForHome:(id)a3 seed:(id)a4;
- (BOOL)addSeedForUser:(id)a3 seed:(id)a4;
- (BOOL)isPartOfHome;
- (BOOL)multiUserDevice;
- (NSString)defaultUserId;
- (NSUUID)currentHomeId;
- (id)fetchSynchronizedAnalyticsIdsForHome:(id)a3;
- (id)fetchSynchronizedAnalyticsIdsForUser:(id)a3;
@end

@implementation ADSyncCoordinatorPersonalDevices

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHomeId, 0);
  objc_storeStrong((id *)&self->_defaultUserId, 0);
}

- (NSUUID)currentHomeId
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)defaultUserId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)multiUserDevice
{
  return self->_multiUserDevice;
}

- (id)fetchSynchronizedAnalyticsIdsForUser:(id)a3
{
  v3 = +[NSDate now];
  v4 = +[ADBiomeStreamProcessor processorForBMSiriUserSeed:v3 userId:0];
  v5 = [v4 fetchIdItemPair];
  v6 = +[ADBiomeStreamProcessor processorForBMSiriUserAggregationId:v3 userId:0];
  v7 = [v6 fetchIdItemPair];
  v8 = [[ADSynchronizedUserAnalyticsIds alloc] initWithUserEphemeralSeeds:v5 andUserAggregationIds:v7];

  return v8;
}

- (id)fetchSynchronizedAnalyticsIdsForHome:(id)a3
{
  v4 = (NSUUID *)a3;
  if (!v4) {
    v4 = self->_currentHomeId;
  }
  v5 = +[ADAnalyticsIdentifiersUtils idWhenNotPartOfHome];
  unsigned __int8 v6 = [(NSUUID *)v4 isEqual:v5];

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = +[NSDate now];
    v9 = +[ADBiomeStreamProcessor processorForBMSiriHomeSeed:v8 homeId:v4 userId:0];
    v10 = [v9 fetchIdItemPair];
    v7 = [[ADSynchronizedHomeAnalyticsIds alloc] initWithHomeEphemeralSeeds:v10];
  }
  return v7;
}

- (BOOL)addSeedForUser:(id)a3 seed:(id)a4
{
  id v4 = a4;
  v5 = BiomeLibrary();
  unsigned __int8 v6 = [v5 Siri];
  v7 = [v6 AnalyticsIdentifiers];
  v8 = [v7 UserSeed];

  v9 = [v8 source];
  v10 = [v4 toBMSiriUserSeed];

  [v9 sendEvent:v10];
  return 1;
}

- (BOOL)addSeedForHome:(id)a3 seed:(id)a4
{
  return 0;
}

- (BOOL)addAggregationIdForUser:(id)a3 aggregationId:(id)a4
{
  id v4 = a4;
  v5 = BiomeLibrary();
  unsigned __int8 v6 = [v5 Siri];
  v7 = [v6 AnalyticsIdentifiers];
  v8 = [v7 UserAggregationId];

  v9 = [v8 source];
  v10 = [v4 toBMSiriUserAggregationId];

  [v9 sendEvent:v10];
  return 1;
}

- (BOOL)isPartOfHome
{
  return +[ADAnalyticsIdentifiersUtils isPartOfHome:self->_currentHomeId];
}

- (ADSyncCoordinatorPersonalDevices)init
{
  v15.receiver = self;
  v15.super_class = (Class)ADSyncCoordinatorPersonalDevices;
  v2 = [(ADSyncCoordinatorPersonalDevices *)&v15 init];
  if (v2)
  {
    v3 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Initializing ADSyncCoordinatorPersonalDevices", buf, 2u);
    }

    v2->_multiUserDevice = 0;
    defaultUserId = v2->_defaultUserId;
    v2->_defaultUserId = (NSString *)@"singleUserDevice";

    v5 = +[ADHomeInfoManager sharedInfoManager];
    unsigned __int8 v6 = [v5 currentHome];

    if (v6)
    {
      uint64_t v7 = [v6 uniqueIdentifier];
      currentHomeId = v2->_currentHomeId;
      v2->_currentHomeId = (NSUUID *)v7;

      int v9 = 1;
    }
    else
    {
      int v9 = 0;
    }
    if (!v2->_currentHomeId)
    {
      uint64_t v10 = +[ADAnalyticsIdentifiersUtils idWhenNotPartOfHome];
      v11 = v2->_currentHomeId;
      v2->_currentHomeId = (NSUUID *)v10;
    }
    v12 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = v2->_currentHomeId;
      *(_DWORD *)buf = 67109378;
      int v17 = v9;
      __int16 v18 = 2112;
      v19 = v14;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Initializing Home details; partOfHome:%d currentHomeId:%@",
        buf,
        0x12u);
    }
  }
  return v2;
}

@end