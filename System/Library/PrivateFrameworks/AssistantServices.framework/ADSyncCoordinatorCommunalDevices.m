@interface ADSyncCoordinatorCommunalDevices
+ (unint64_t)_computeLeeway:(unint64_t)a3;
+ (unint64_t)_timerIntervalNanosec;
+ (unint64_t)_timerStartNanosec;
- (ADSyncCoordinatorCommunalDevices)init;
- (ADSyncCoordinatorCommunalDevices)initWithProfileUserId:(id)a3;
- (ADSyncCoordinatorCommunalDevices)initWithProfileUserId:(id)a3 homeInfoManager:(id)a4 multiUserService:(id)a5 disableTimer:(BOOL)a6;
- (BOOL)_isDefaultUserAvailable;
- (BOOL)_sameItem:(id)a3 other:(id)a4;
- (BOOL)addAggregationIdForUser:(id)a3 aggregationId:(id)a4;
- (BOOL)addSeedForHome:(id)a3 seed:(id)a4;
- (BOOL)addSeedForUser:(id)a3 seed:(id)a4;
- (BOOL)isPartOfHome;
- (BOOL)multiUserDevice;
- (NSString)defaultUserId;
- (NSUUID)currentHomeId;
- (id)_fetchKnownAccounts;
- (id)_fetchKnownAccountsWithMultiUserService:(id)a3 userSeedStream:(id)a4;
- (id)_profileUserId;
- (id)fetchSynchronizedAnalyticsIdsForHome:(id)a3;
- (id)fetchSynchronizedAnalyticsIdsForUser:(id)a3;
- (void)_initConsistencyTimer;
- (void)_initHomeDetailsWithProfileUserId:(id)a3 homeInfoManager:(id)a4 multiUserService:(id)a5;
- (void)_logTVOSMacroError;
- (void)_publishHomeSeed:(id)a3 forAccounts:(id)a4;
- (void)_publishHomeSeedToAllMembers;
- (void)_publishHomeSeedToAllMembers:(id)a3;
- (void)_refreshHomeAndUserDetailsWithHomeInfoManager:(id)a3 multiUserService:(id)a4;
- (void)refreshHomeAndUserDetails;
@end

@implementation ADSyncCoordinatorCommunalDevices

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHomeId, 0);
  objc_storeStrong((id *)&self->_defaultUserId, 0);
  objc_storeStrong((id *)&self->_consistencyTimer, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
}

- (NSUUID)currentHomeId
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)multiUserDevice
{
  return self->_multiUserDevice;
}

- (void)_logTVOSMacroError
{
  if (!self->_macroErrorLogged)
  {
    v3 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "TVOS macro is false in communal devices sync coordinator!", v4, 2u);
    }

    self->_macroErrorLogged = 1;
  }
}

- (void)_publishHomeSeed:(id)a3 forAccounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_cache = &OBJC_METACLASS___ADDictationConnection.cache;
  v9 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Going to publish seed to %@", buf, 0xCu);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v7;
  id v39 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v39)
  {
    uint64_t v11 = *(void *)v41;
    v12 = ADCommunalDeviceUserAttributes;
    v13 = &HMAccessoryCategoryTypeAirPort_ptr;
    *(void *)&long long v10 = 138412290;
    long long v35 = v10;
    id v37 = v6;
    while (2)
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v16 = objc_msgSend(v13[408], "now", v35);
        v17 = [&v12[34] processorForBMSiriHomeSeed:v16 homeId:self->_currentHomeId account:v15];

        v18 = [v17 fetchLocalIdItemPair];
        v19 = v18;
        if (!v18) {
          goto LABEL_18;
        }
        v38 = v15;
        v20 = [v18 current];
        if ([(ADSyncCoordinatorCommunalDevices *)self _sameItem:v6 other:v20])
        {
        }
        else
        {
          [v19 next];
          v21 = v17;
          v22 = v12;
          uint64_t v23 = v11;
          v25 = v24 = p_cache;
          unsigned int v26 = [(ADSyncCoordinatorCommunalDevices *)self _sameItem:v6 other:v25];

          p_cache = v24;
          uint64_t v11 = v23;
          v12 = v22;
          v17 = v21;
          v13 = &HMAccessoryCategoryTypeAirPort_ptr;

          if (!v26)
          {
            id v6 = v37;
            v15 = v38;
LABEL_18:
            v28 = [p_cache + 383 logger];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              v29 = [v19 current];
              v30 = [v29 createdOn];
              [v19 next];
              v32 = v31 = v15;
              v33 = [v32 createdOn];
              v34 = [v6 createdOn];
              *(_DWORD *)buf = 138413058;
              id v45 = v31;
              __int16 v46 = 2112;
              v47 = v30;
              __int16 v48 = 2112;
              v49 = v33;
              __int16 v50 = 2112;
              v51 = v34;
              _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Account %@ does not have the seed. current:%@ next:%@ expected:%@", buf, 0x2Au);

              id v6 = v37;
            }

            [(ADSyncCoordinatorCommunalDevices *)self _logTVOSMacroError];
            goto LABEL_21;
          }
        }
        v27 = [p_cache + 383 logger];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v35;
          id v45 = v38;
          _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Account %@ already has the seed!", buf, 0xCu);
        }

        id v6 = v37;
      }
      id v39 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
      if (v39) {
        continue;
      }
      break;
    }
  }
LABEL_21:
}

- (BOOL)_sameItem:(id)a3 other:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v5 = a3;
  id v6 = [a4 value];
  id v7 = [v5 value];

  LOBYTE(v5) = [v6 isEqual:v7];
  return (char)v5;
}

- (void)_publishHomeSeedToAllMembers:(id)a3
{
  id v4 = a3;
  if (+[ADAnalyticsIdentifiersUtils isPartOfHome:self->_currentHomeId])
  {
    backgroundQueue = self->_backgroundQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002E918C;
    v7[3] = &unk_10050E160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(backgroundQueue, v7);
  }
  else
  {
    id v6 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Won't run publish seed to home members as device is not part of a home", buf, 2u);
    }
  }
}

- (void)_publishHomeSeedToAllMembers
{
  v3 = +[NSDate now];
  id v4 = +[ADBiomeStreamProcessor processorForBMSiriHomeSeed:v3 homeId:self->_currentHomeId userId:self->_defaultUserId];

  id v5 = [v4 fetchLocalIdItemPair];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 current];
    uint64_t v8 = [v6 next];
    if (v7 | v8)
    {
      long long v10 = [(ADSyncCoordinatorCommunalDevices *)self _fetchKnownAccounts];
      if (v7) {
        [(ADSyncCoordinatorCommunalDevices *)self _publishHomeSeed:v7 forAccounts:v10];
      }
      if (v8) {
        [(ADSyncCoordinatorCommunalDevices *)self _publishHomeSeed:v8 forAccounts:v10];
      }
    }
    else
    {
      v9 = +[ADAnalyticsIdentifiersUtils logger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Both current and next seeds are nil. Nothing to publish", v11, 2u);
      }
    }
  }
  else
  {
    uint64_t v7 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEBUG, "There are no ephemeral home seeds. Nothing to publish", buf, 2u);
    }
  }
}

- (id)_fetchKnownAccountsWithMultiUserService:(id)a3 userSeedStream:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v8 = [v6 allUsersBySharedUserID];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002E9638;
  v18[3] = &unk_10050B2E0;
  id v9 = v7;
  id v19 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v18];
  long long v10 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Home member accounts based on RMV:%@", buf, 0xCu);
  }

  id v17 = 0;
  uint64_t v11 = [v5 sharedDeviceAccountsWithError:&v17];

  id v12 = v17;
  v13 = +[ADAnalyticsIdentifiersUtils logger];
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Biome accounts could not be fetched. Will be able to share home id details only with RMV enabled home members. Error:%@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Home member accounts based on inbound sync:%@", buf, 0xCu);
    }

    [v9 addObjectsFromArray:v11];
    v14 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Post merge %@", buf, 0xCu);
    }
  }

  v15 = [v9 allObjects];

  return v15;
}

- (id)_fetchKnownAccounts
{
  v3 = +[ADMultiUserService sharedService];
  id v4 = BiomeLibrary();
  id v5 = [v4 Siri];
  id v6 = [v5 AnalyticsIdentifiers];
  id v7 = [v6 UserSeed];
  uint64_t v8 = [(ADSyncCoordinatorCommunalDevices *)self _fetchKnownAccountsWithMultiUserService:v3 userSeedStream:v7];

  return v8;
}

- (id)_profileUserId
{
  return 0;
}

- (id)fetchSynchronizedAnalyticsIdsForUser:(id)a3
{
  id v4 = (NSString *)a3;
  if (!v4) {
    id v4 = self->_defaultUserId;
  }
  if ([(ADSyncCoordinatorCommunalDevices *)self _isDefaultUserAvailable])
  {
    id v5 = +[NSDate now];
    id v6 = +[ADBiomeStreamProcessor processorForBMSiriUserSeed:v5 userId:v4];
    id v7 = [v6 fetchIdItemPair];
    uint64_t v8 = +[ADBiomeStreamProcessor processorForBMSiriUserAggregationId:v5 userId:v4];
    id v9 = [v8 fetchIdItemPair];
    long long v10 = [[ADSynchronizedUserAnalyticsIds alloc] initWithUserEphemeralSeeds:v7 andUserAggregationIds:v9];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)fetchSynchronizedAnalyticsIdsForHome:(id)a3
{
  if ([(ADSyncCoordinatorCommunalDevices *)self isPartOfHome]
    && [(ADSyncCoordinatorCommunalDevices *)self _isDefaultUserAvailable])
  {
    id v4 = +[NSDate now];
    id v5 = +[ADBiomeStreamProcessor processorForBMSiriHomeSeed:v4 homeId:self->_currentHomeId userId:self->_defaultUserId];

    id v6 = [v5 fetchIdItemPair];
    id v7 = [[ADSynchronizedHomeAnalyticsIds alloc] initWithHomeEphemeralSeeds:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (BOOL)addSeedForUser:(id)a3 seed:(id)a4
{
  return 0;
}

- (BOOL)addSeedForHome:(id)a3 seed:(id)a4
{
  id v5 = (NSUUID *)a3;
  if (!v5) {
    id v5 = self->_currentHomeId;
  }
  if (+[ADAnalyticsIdentifiersUtils isPartOfHome:v5]
    && [(ADSyncCoordinatorCommunalDevices *)self _isDefaultUserAvailable])
  {
    id v6 = [objc_alloc((Class)BMAccount) initWithAltDSID:self->_defaultUserId];
    if (v6) {
      [(ADSyncCoordinatorCommunalDevices *)self _logTVOSMacroError];
    }

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)addAggregationIdForUser:(id)a3 aggregationId:(id)a4
{
  id v4 = a4;
  id v5 = BiomeLibrary();
  id v6 = [v5 Siri];
  BOOL v7 = [v6 AnalyticsIdentifiers];
  uint64_t v8 = [v7 UserAggregationId];
  id v9 = [v8 source];
  long long v10 = [v4 toBMSiriUserAggregationId];

  [v9 sendEvent:v10];
  return 1;
}

- (void)_refreshHomeAndUserDetailsWithHomeInfoManager:(id)a3 multiUserService:(id)a4
{
  id v7 = [(ADSyncCoordinatorCommunalDevices *)self _profileUserId];
  id v5 = +[ADHomeInfoManager sharedInfoManager];
  id v6 = +[ADMultiUserService sharedService];
  [(ADSyncCoordinatorCommunalDevices *)self _initHomeDetailsWithProfileUserId:v7 homeInfoManager:v5 multiUserService:v6];
}

- (void)refreshHomeAndUserDetails
{
  v3 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Checking to see if the device still belongs to the same home", v6, 2u);
  }

  id v4 = +[ADHomeInfoManager sharedInfoManager];
  id v5 = +[ADMultiUserService sharedService];
  [(ADSyncCoordinatorCommunalDevices *)self _refreshHomeAndUserDetailsWithHomeInfoManager:v4 multiUserService:v5];
}

- (void)_initConsistencyTimer
{
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_backgroundQueue);
  consistencyTimer = self->_consistencyTimer;
  self->_consistencyTimer = v3;

  if (self->_consistencyTimer)
  {
    int64_t v5 = +[ADSyncCoordinatorCommunalDevices _timerStartNanosec];
    uint64_t v6 = +[ADSyncCoordinatorCommunalDevices _timerIntervalNanosec];
    uint64_t v7 = +[ADSyncCoordinatorCommunalDevices _computeLeeway:v6];
    uint64_t v8 = self->_consistencyTimer;
    dispatch_time_t v9 = dispatch_time(0xFFFFFFFFFFFFFFFELL, v5);
    dispatch_source_set_timer(v8, v9, v6, v7);
    long long v10 = self->_consistencyTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1002E9E10;
    handler[3] = &unk_10050E138;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);
    uint64_t v11 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      int64_t v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Starting consistency check timer start=%llu interval=%llu leeway=%llu", buf, 0x20u);
    }

    dispatch_resume((dispatch_object_t)self->_consistencyTimer);
  }
  else
  {
    id v12 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Timer to ensure home seed and aggregation id is synced to all home members could not be started. If a newly created id was not written to the stream of a home member, that member may not see the correct id and home-scoped analytics will not work correctly for that user's devices", buf, 2u);
    }
  }
}

- (BOOL)_isDefaultUserAvailable
{
  defaultUserId = self->_defaultUserId;
  if (defaultUserId) {
    LOBYTE(defaultUserId) = [(NSString *)defaultUserId isEqual:@"userNotYetDetermined"] ^ 1;
  }
  return (char)defaultUserId;
}

- (BOOL)isPartOfHome
{
  return +[ADAnalyticsIdentifiersUtils isPartOfHome:self->_currentHomeId];
}

- (NSString)defaultUserId
{
  return self->_defaultUserId;
}

- (void)_initHomeDetailsWithProfileUserId:(id)a3 homeInfoManager:(id)a4 multiUserService:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = [a4 currentHome];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = [v10 uniqueIdentifier];
    currentHomeId = self->_currentHomeId;
    self->_currentHomeId = v12;

    v14 = [v9 deviceOwner];
    int64_t v15 = [v14 iCloudAltDSID];
    defaultUserId = self->_defaultUserId;
    self->_defaultUserId = v15;

    int v17 = 1;
  }
  else
  {
    __int16 v18 = (NSString *)v8;
    int v17 = 0;
    v14 = self->_defaultUserId;
    self->_defaultUserId = v18;
  }

  if (!self->_currentHomeId)
  {
    uint64_t v19 = +[ADAnalyticsIdentifiersUtils idWhenNotPartOfHome];
    v20 = self->_currentHomeId;
    self->_currentHomeId = v19;
  }
  if (!self->_defaultUserId) {
    objc_storeStrong((id *)&self->_defaultUserId, @"userNotYetDetermined");
  }
  id v21 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = self->_defaultUserId;
    v22 = self->_currentHomeId;
    v24[0] = 67109634;
    v24[1] = v17;
    __int16 v25 = 2112;
    unsigned int v26 = v22;
    __int16 v27 = 2112;
    v28 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Initializing Home details; partOfHome:%d currentHomeId:%@ defaultUserId:%@",
      (uint8_t *)v24,
      0x1Cu);
  }
}

- (ADSyncCoordinatorCommunalDevices)initWithProfileUserId:(id)a3 homeInfoManager:(id)a4 multiUserService:(id)a5 disableTimer:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ADSyncCoordinatorCommunalDevices;
  v13 = [(ADSyncCoordinatorCommunalDevices *)&v18 init];
  if (v13)
  {
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("ADAnalyticsIdentifiersHomeQueue", v14);

    backgroundQueue = v13->_backgroundQueue;
    v13->_backgroundQueue = (OS_dispatch_queue *)v15;

    v13->_multiUserDevice = 1;
    [(ADSyncCoordinatorCommunalDevices *)v13 _initHomeDetailsWithProfileUserId:v10 homeInfoManager:v11 multiUserService:v12];
    if (!a6) {
      [(ADSyncCoordinatorCommunalDevices *)v13 _initConsistencyTimer];
    }
  }

  return v13;
}

- (ADSyncCoordinatorCommunalDevices)initWithProfileUserId:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[ADHomeInfoManager sharedInfoManager];
  uint64_t v6 = +[ADMultiUserService sharedService];
  uint64_t v7 = [(ADSyncCoordinatorCommunalDevices *)self initWithProfileUserId:v4 homeInfoManager:v5 multiUserService:v6 disableTimer:0];

  return v7;
}

- (ADSyncCoordinatorCommunalDevices)init
{
  v3 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int64_t v5 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Initializing ADSyncCoordinatorCommunalDevices", v5, 2u);
  }

  return [(ADSyncCoordinatorCommunalDevices *)self initWithProfileUserId:0];
}

+ (unint64_t)_computeLeeway:(unint64_t)a3
{
  unint64_t v3 = a3 / 0xA;
  if (a3 / 0xA <= 0xF4240) {
    unint64_t v3 = 1000000;
  }
  if (v3 >= 0xDF8475800) {
    return 60000000000;
  }
  else {
    return v3;
  }
}

+ (unint64_t)_timerIntervalNanosec
{
  v2 = +[ADPreferences sharedPreferences];
  unint64_t v3 = (unint64_t)[v2 siriAnalyticsIdentifiersConsistencyTimerIntervalMillisec];

  int v4 = AFIsInternalInstall() ^ 1;
  if (!v3) {
    int v4 = 1;
  }
  if (v3 > 0x1B7740) {
    int v4 = 1;
  }
  if (v4) {
    return 1800000000000;
  }
  else {
    return 1000000 * v3;
  }
}

+ (unint64_t)_timerStartNanosec
{
  v2 = +[ADPreferences sharedPreferences];
  unint64_t v3 = (unint64_t)[v2 siriAnalyticsIdentifiersConsistencyTimerStartDelayMillisec];

  int v4 = AFIsInternalInstall() ^ 1;
  if (!v3) {
    int v4 = 1;
  }
  if (v3 > 0x493E0) {
    int v4 = 1;
  }
  if (v4) {
    return 300000000000;
  }
  else {
    return 1000000 * v3;
  }
}

@end