@interface ADAnalyticsIdentifiersProvider
+ (ADAnalyticsIdentifiersProvider)sharedInstance;
+ (id)_alignToRotationCadence:(id)a3;
+ (id)_createHomeEphemeralIdWithHomeSeed:(id)a3 withCreationTime:(id)a4;
+ (id)_createUserEphemeralIdWithUserSeed:(id)a3 withCreationTime:(id)a4;
+ (id)_homeEphemeralIdNamespace;
+ (id)_timestampToNSString:(id)a3;
+ (id)_userEphemeralIdNamespace;
+ (int64_t)_computeSecondsSinceBirth:(id)a3;
+ (int64_t)_computeSecondsSinceBirth:(id)a3 forTimeInterval:(double)a4;
- (ADAnalyticsIdentifiersCheckpoint)checkpoint;
- (ADAnalyticsIdentifiersProvider)init;
- (ADSyncCoordinating)syncCoordinator;
- (ADSynchronizedHomeAnalyticsIds)analyticsIdsForCurrentHome;
- (ADSynchronizedUserAnalyticsIds)analyticsIdsForDefaultUser;
- (BOOL)ephemeralIdWasCreatedBySyncPath;
- (BOOL)firstRefresh;
- (NSDate)ephemeralIdCreationDate;
- (NSDate)localUserSeedCreationTime;
- (NSDate)syncPathExecutionTime;
- (NSUUID)fixedDeviceId;
- (NSUUID)lastCreatedHomeEphemeralId;
- (NSUUID)lastCreatedUserEphemeralId;
- (NSUUID)localUserSeed;
- (OS_dispatch_queue)queue;
- (id)_combineUUIDsWithUuid1:(id)a3 uuid2:(id)a4;
- (id)_createAndSaveFixedDeviceId;
- (id)_createDIMEphemeralIdentifiersEvent:(int64_t)a3;
- (id)_createDIMEphemeralToAggregationIdentifierMapEvent;
- (id)_fetchIdsForHomeWithCreationTime:(id)a3;
- (id)_fetchIdsForUser:(id)a3 creationTime:(id)a4;
- (id)_fetchOrCreateFixedDeviceId;
- (id)_initWithSyncCoordinator:(id)a3 withCheckpoint:(id)a4;
- (id)_readCheckpoint;
- (id)ephemeralIdForDefaultUser;
- (int64_t)_refreshEphemeralIdentifiers:(BOOL)a3;
- (os_unfair_lock_s)id_assignment_lock;
- (unsigned)_convertDataToScaledUInt32:(id)a3;
- (unsigned)experimentBucketId;
- (void)_asyncLogAnalyticsIdentifiersDIMEvents:(id)a3;
- (void)_createAndTestAndSetDefaultUserEphemeralId:(id)a3 expectedValue:(id)a4 expectedValueWasCreatedBySyncPath:(BOOL)a5;
- (void)_testAndSetDefaultUserEphemeralId:(id)a3 creationTime:(id)a4 syncPath:(BOOL)a5 expectedValue:(id)a6;
- (void)_writeCheckpoint:(id)a3;
- (void)asyncLogAnalyticsIdentifiersDIMEvents;
- (void)fetchDeviceAggregationIdWithCallback:(id)a3;
- (void)fetchDeviceAndUserIdsForSharedUserId:(id)a3 withCallback:(id)a4;
- (void)fetchDeviceAndUserIdsForiCloudAltDSId:(id)a3 withCallback:(id)a4;
- (void)setFirstRefresh:(BOOL)a3;
- (void)setSyncPathExecutionTime:(id)a3;
@end

@implementation ADAnalyticsIdentifiersProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncPathExecutionTime, 0);
  objc_storeStrong((id *)&self->_localUserSeedCreationTime, 0);
  objc_storeStrong((id *)&self->_localUserSeed, 0);
  objc_storeStrong((id *)&self->_checkpoint, 0);
  objc_storeStrong((id *)&self->_lastCreatedHomeEphemeralId, 0);
  objc_storeStrong((id *)&self->_lastCreatedUserEphemeralId, 0);
  objc_storeStrong((id *)&self->_ephemeralIdCreationDate, 0);
  objc_storeStrong((id *)&self->_analyticsIdsForCurrentHome, 0);
  objc_storeStrong((id *)&self->_analyticsIdsForDefaultUser, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_fixedDeviceId, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (unsigned)experimentBucketId
{
  return self->_experimentBucketId;
}

- (void)setSyncPathExecutionTime:(id)a3
{
}

- (NSDate)syncPathExecutionTime
{
  return self->_syncPathExecutionTime;
}

- (os_unfair_lock_s)id_assignment_lock
{
  return self->_id_assignment_lock;
}

- (NSDate)localUserSeedCreationTime
{
  return self->_localUserSeedCreationTime;
}

- (NSUUID)localUserSeed
{
  return self->_localUserSeed;
}

- (ADAnalyticsIdentifiersCheckpoint)checkpoint
{
  return self->_checkpoint;
}

- (BOOL)ephemeralIdWasCreatedBySyncPath
{
  return self->_ephemeralIdWasCreatedBySyncPath;
}

- (NSUUID)lastCreatedHomeEphemeralId
{
  return self->_lastCreatedHomeEphemeralId;
}

- (NSUUID)lastCreatedUserEphemeralId
{
  return self->_lastCreatedUserEphemeralId;
}

- (NSDate)ephemeralIdCreationDate
{
  return self->_ephemeralIdCreationDate;
}

- (ADSynchronizedHomeAnalyticsIds)analyticsIdsForCurrentHome
{
  return self->_analyticsIdsForCurrentHome;
}

- (ADSynchronizedUserAnalyticsIds)analyticsIdsForDefaultUser
{
  return self->_analyticsIdsForDefaultUser;
}

- (void)setFirstRefresh:(BOOL)a3
{
  self->_firstRefresh = a3;
}

- (BOOL)firstRefresh
{
  return self->_firstRefresh;
}

- (ADSyncCoordinating)syncCoordinator
{
  return self->_syncCoordinator;
}

- (NSUUID)fixedDeviceId
{
  return self->_fixedDeviceId;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unsigned)_convertDataToScaledUInt32:(id)a3
{
  id v3 = a3;
  v4 = (unsigned __int8 *)[v3 bytes];
  if ([v3 length])
  {
    unint64_t v5 = 0;
    unsigned int v6 = 0;
    do
      unsigned int v6 = v4[v5++] | (v6 << 8);
    while (v5 < (unint64_t)[v3 length]);
    unsigned int v7 = v6 % 0x14;
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (id)_combineUUIDsWithUuid1:(id)a3 uuid2:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [a3 UUIDString];
  unsigned int v7 = [v6 dataUsingEncoding:4];

  v8 = [v5 UUIDString];
  v9 = [v8 dataUsingEncoding:4];

  id v10 = +[NSMutableData dataWithLength:16];
  v11 = [v10 mutableBytes];
  id v12 = v7;
  v13 = [v12 bytes];
  id v14 = v9;
  v15 = [v14 bytes];
  for (uint64_t i = 0; i != 16; ++i)
    v11[i] = v15[i] ^ v13[i];

  return v10;
}

- (id)_fetchIdsForHomeWithCreationTime:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(ADSyncCoordinating *)self->_syncCoordinator isPartOfHome];
  unsigned int v6 = +[ADAnalyticsIdentifiersUtils logger];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v17) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Fetching home seed", (uint8_t *)&v17, 2u);
    }

    v8 = [(ADSyncCoordinating *)self->_syncCoordinator fetchSynchronizedAnalyticsIdsForHome:0];
    if (!v8) {
      v8 = [[ADSynchronizedHomeAnalyticsIds alloc] initWithHomeEphemeralSeeds:0];
    }
    unsigned __int8 v9 = [(ADSynchronizedIds *)v8 populateNullsWithCreationTime:v4];
    if (v9)
    {
      id v10 = [(ADSynchronizedIds *)v8 ephemeralSeeds];
      v11 = [v10 current];

      id v12 = +[ADAnalyticsIdentifiersUtils logger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138412290;
        v18 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Created current home seed %@", (uint8_t *)&v17, 0xCu);
      }

      [(ADSyncCoordinating *)self->_syncCoordinator addSeedForHome:0 seed:v11];
    }
    if ((v9 & 2) != 0)
    {
      v13 = [(ADSynchronizedIds *)v8 ephemeralSeeds];
      id v14 = [v13 next];

      v15 = +[ADAnalyticsIdentifiersUtils logger];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138412290;
        v18 = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Created next home seed %@", (uint8_t *)&v17, 0xCu);
      }

      [(ADSyncCoordinating *)self->_syncCoordinator addSeedForHome:0 seed:v14];
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v17) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Not part of home. Will not fetch home seed", (uint8_t *)&v17, 2u);
    }

    v8 = [[ADSynchronizedHomeAnalyticsIds alloc] initWithHomeEphemeralSeeds:0];
  }

  return v8;
}

- (id)_fetchIdsForUser:(id)a3 creationTime:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v28) = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Fetching user seed and aggregation ids", (uint8_t *)&v28, 2u);
  }

  unsigned __int8 v9 = [(ADSyncCoordinating *)self->_syncCoordinator fetchSynchronizedAnalyticsIdsForUser:v7];

  if (v9)
  {
    if (v7) {
      goto LABEL_11;
    }
  }
  else
  {
    unsigned __int8 v9 = [[ADSynchronizedUserAnalyticsIds alloc] initWithUserEphemeralSeeds:0 andUserAggregationIds:0];
    if (v7) {
      goto LABEL_11;
    }
  }
  if ([(ADSynchronizedIds *)v9 setCurrentEphemeralSeedIfNil:self->_localUserSeed andCreationTime:self->_localUserSeedCreationTime])
  {
    id v10 = [(ADSynchronizedIds *)v9 ephemeralSeeds];
    v11 = [v10 current];

    id v12 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v28 = 138412290;
      v29 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Populated current user seed with local value %@", (uint8_t *)&v28, 0xCu);
    }

    [(ADSyncCoordinating *)self->_syncCoordinator addSeedForUser:0 seed:v11];
  }
LABEL_11:
  unsigned __int8 v13 = [(ADSynchronizedIds *)v9 populateNullsWithCreationTime:v6];
  unsigned __int8 v14 = v13;
  if (v13)
  {
    v15 = [(ADSynchronizedIds *)v9 ephemeralSeeds];
    v16 = [v15 current];

    int v17 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v28 = 138412290;
      v29 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Created current user seed %@", (uint8_t *)&v28, 0xCu);
    }

    [(ADSyncCoordinating *)self->_syncCoordinator addSeedForUser:0 seed:v16];
    if ((v14 & 2) == 0)
    {
LABEL_13:
      if ((v14 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_22;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_13;
  }
  v18 = [(ADSynchronizedIds *)v9 ephemeralSeeds];
  v19 = [v18 next];

  v20 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 138412290;
    v29 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Created next user seed %@", (uint8_t *)&v28, 0xCu);
  }

  [(ADSyncCoordinating *)self->_syncCoordinator addSeedForUser:0 seed:v19];
  if ((v14 & 4) == 0)
  {
LABEL_14:
    if ((v14 & 8) == 0) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
LABEL_22:
  v21 = [(ADSynchronizedIds *)v9 aggregationIds];
  v22 = [v21 current];

  v23 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 138412290;
    v29 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Created current aggregation id %@", (uint8_t *)&v28, 0xCu);
  }

  [(ADSyncCoordinating *)self->_syncCoordinator addAggregationIdForUser:0 aggregationId:v22];
  if ((v14 & 8) != 0)
  {
LABEL_25:
    v24 = [(ADSynchronizedIds *)v9 aggregationIds];
    v25 = [v24 next];

    v26 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      int v28 = 138412290;
      v29 = v25;
      _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Created next aggregation id %@", (uint8_t *)&v28, 0xCu);
    }

    [(ADSyncCoordinating *)self->_syncCoordinator addAggregationIdForUser:0 aggregationId:v25];
  }
LABEL_28:

  return v9;
}

- (void)_testAndSetDefaultUserEphemeralId:(id)a3 creationTime:(id)a4 syncPath:(BOOL)a5 expectedValue:(id)a6
{
  id v14 = a3;
  id v11 = a4;
  id v12 = (NSUUID *)a6;
  os_unfair_lock_lock(&self->_id_assignment_lock);
  lastCreatedUserEphemeralId = self->_lastCreatedUserEphemeralId;

  if (lastCreatedUserEphemeralId == v12)
  {
    objc_storeStrong((id *)&self->_lastCreatedUserEphemeralId, a3);
    objc_storeStrong((id *)&self->_ephemeralIdCreationDate, a4);
    self->_ephemeralIdWasCreatedBySyncPath = a5;
  }
  os_unfair_lock_unlock(&self->_id_assignment_lock);
}

- (void)_createAndTestAndSetDefaultUserEphemeralId:(id)a3 expectedValue:(id)a4 expectedValueWasCreatedBySyncPath:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!v5) {
    goto LABEL_8;
  }
  [(NSDate *)self->_syncPathExecutionTime timeIntervalSinceNow];
  double v11 = v10;
  BOOL v12 = v10 <= -5.0 || v10 > 0.0;
  unsigned __int8 v13 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134218240;
    double v20 = -v11;
    __int16 v21 = 1024;
    BOOL v22 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Current id was created by sync path. It was created %f seconds ago. Ignoring? %d", (uint8_t *)&v19, 0x12u);
  }

  if (v12)
  {
LABEL_8:
    id v14 = +[NSDate now];
    v15 = +[ADAnalyticsIdentifiersProvider _alignToRotationCadence:v14];

    v16 = [v8 current];
    int v17 = [v16 value];
    v18 = +[ADAnalyticsIdentifiersProvider _createUserEphemeralIdWithUserSeed:v17 withCreationTime:v15];

    [(ADAnalyticsIdentifiersProvider *)self _testAndSetDefaultUserEphemeralId:v18 creationTime:v15 syncPath:0 expectedValue:v9];
  }
}

- (int64_t)_refreshEphemeralIdentifiers:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = self->_lastCreatedUserEphemeralId;
  BOOL ephemeralIdWasCreatedBySyncPath = self->_ephemeralIdWasCreatedBySyncPath;
  if (v5) {
    int64_t v7 = +[ADAnalyticsIdentifiersProvider _computeSecondsSinceBirth:self->_ephemeralIdCreationDate];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v8 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    BOOL v42 = self->_analyticsIdsForDefaultUser == 0;
    BOOL v43 = self->_analyticsIdsForCurrentHome == 0;
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v55 = v3;
    *(_WORD *)&v55[4] = 2048;
    *(void *)&v55[6] = v7;
    *(_WORD *)&v55[14] = 1024;
    *(_DWORD *)&v55[16] = v42;
    LOWORD(v56) = 1024;
    *(_DWORD *)((char *)&v56 + 2) = v43;
    HIWORD(v56) = 1024;
    v57[0] = ephemeralIdWasCreatedBySyncPath;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Refreshing syncData force:%d secondsSinceBirth:%ld _analyticsIdsForDefaultUserNil:%d  _analyticsIdsForCurrentHomeNil:%d _lastCreatedBySyncPath:%d", buf, 0x24u);
  }

  if (!v5 || v3 || !self->_analyticsIdsForDefaultUser)
  {
    if (v3 && !self->_firstRefresh)
    {
      [(ADSyncCoordinating *)self->_syncCoordinator refreshHomeAndUserDetails];
      self->_firstRefresh = 0;
    }
    v53 = +[NSDate now];
    -[ADAnalyticsIdentifiersProvider _fetchIdsForUser:creationTime:](self, "_fetchIdsForUser:creationTime:", 0);
    id v9 = (ADSynchronizedUserAnalyticsIds *)objc_claimAutoreleasedReturnValue();
    analyticsIdsForDefaultUser = self->_analyticsIdsForDefaultUser;
    self->_analyticsIdsForDefaultUser = v9;

    double v11 = [(ADSynchronizedIds *)self->_analyticsIdsForDefaultUser ephemeralSeeds];
    v52 = v5;
    [(ADAnalyticsIdentifiersProvider *)self _createAndTestAndSetDefaultUserEphemeralId:v11 expectedValue:v5 expectedValueWasCreatedBySyncPath:ephemeralIdWasCreatedBySyncPath];

    BOOL v12 = [(ADSynchronizedIds *)self->_analyticsIdsForDefaultUser ephemeralSeeds];
    unsigned __int8 v13 = [v12 current];

    id v14 = [(ADSynchronizedIds *)self->_analyticsIdsForDefaultUser ephemeralSeeds];
    v15 = [v14 next];

    v16 = [ADAnalyticsIdentifiersCheckpoint alloc];
    int v17 = [v13 value];
    v50 = v13;
    v18 = [v13 expirationDate];
    int v19 = [v15 value];
    double v20 = [v15 effectiveFrom];
    __int16 v21 = [v15 expirationDate];
    BOOL v22 = [(ADAnalyticsIdentifiersCheckpoint *)v16 initWithCurrentUserSeed:v17 currentUserSeedExpirationDate:v18 nextUserSeed:v19 nextUserSeedEffectiveFromDate:v20 nextUserSeedExpirationDate:v21];
    [(ADAnalyticsIdentifiersProvider *)self _writeCheckpoint:v22];

    int64_t v23 = +[ADAnalyticsIdentifiersProvider _computeSecondsSinceBirth:self->_ephemeralIdCreationDate];
    v24 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      ephemeralIdCreationDate = self->_ephemeralIdCreationDate;
      lastCreatedUserEphemeralId = self->_lastCreatedUserEphemeralId;
      BOOL v46 = !self->_ephemeralIdWasCreatedBySyncPath;
      *(_DWORD *)buf = 138413058;
      *(void *)v55 = lastCreatedUserEphemeralId;
      *(_WORD *)&v55[8] = 2112;
      *(void *)&v55[10] = ephemeralIdCreationDate;
      *(_WORD *)&v55[18] = 2048;
      int64_t v56 = v23;
      LOWORD(v57[0]) = 1024;
      *(_DWORD *)((char *)v57 + 2) = v46;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Created user ephemeral identifier for default user; uuid:%@ creationDate:%@ secondsSinceBirth:%ld wonRace?%d",
        buf,
        0x26u);
    }
    int64_t v51 = v23;

    v25 = [(ADSynchronizedIds *)self->_analyticsIdsForDefaultUser aggregationIds];
    v26 = [v25 current];

    v27 = [v26 value];
    uint64_t v28 = [v26 effectiveFrom];
    uint64_t v29 = [v26 expirationDate];
    v30 = +[ADAnalyticsDeviceAndUserIds deviceAggregationIdWithDeviceId:self->_fixedDeviceId forUserAggregationId:v27];
    v31 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)v55 = v30;
      *(_WORD *)&v55[8] = 2112;
      *(void *)&v55[10] = v27;
      *(_WORD *)&v55[18] = 2112;
      int64_t v56 = v28;
      LOWORD(v57[0]) = 2112;
      *(void *)((char *)v57 + 2) = v29;
      _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Aggregation id details: device:%@ user:%@ effectiveFrom:%@ expirationDate:%@", buf, 0x2Au);
    }
    v48 = (void *)v29;
    v49 = (void *)v28;

    v32 = [(ADAnalyticsIdentifiersProvider *)self _combineUUIDsWithUuid1:v30 uuid2:v27];
    v33 = [@"*^&9aM&A#^&Sn3" dataUsingEncoding:4];
    v34 = AFSecurityDigestData();
    self->_experimentBucketId = [(ADAnalyticsIdentifiersProvider *)self _convertDataToScaledUInt32:v34];
    v35 = [(ADAnalyticsIdentifiersProvider *)self _fetchIdsForHomeWithCreationTime:v53];
    analyticsIdsForCurrentHome = self->_analyticsIdsForCurrentHome;
    self->_analyticsIdsForCurrentHome = v35;

    v37 = [(ADSynchronizedIds *)self->_analyticsIdsForCurrentHome currentEphemeralSeed];
    if (v37)
    {
      +[ADAnalyticsIdentifiersProvider _createHomeEphemeralIdWithHomeSeed:withCreationTime:](ADAnalyticsIdentifiersProvider, "_createHomeEphemeralIdWithHomeSeed:withCreationTime:", v37, self->_ephemeralIdCreationDate, v48, v49);
      v38 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      lastCreatedHomeEphemeralId = self->_lastCreatedHomeEphemeralId;
      self->_lastCreatedHomeEphemeralId = v38;

      v40 = +[ADAnalyticsIdentifiersUtils logger];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        v47 = self->_lastCreatedHomeEphemeralId;
        *(_DWORD *)buf = 138412290;
        *(void *)v55 = v47;
        _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Created home ephemeral identifier for current home; uuid:%@",
          buf,
          0xCu);
      }
    }
    int64_t v7 = v51;
    BOOL v5 = v52;
  }

  return v7;
}

- (id)_fetchOrCreateFixedDeviceId
{
  BOOL v3 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Reading fixed device identifier from Keychain", buf, 2u);
  }

  id v4 = AFKeychainValueForAccountAndKey();
  if (!v4)
  {
    id v8 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Fixed device identifier keychain entry does not exist. Creating new UUID", buf, 2u);
    }

    id v6 = 0;
    goto LABEL_13;
  }
  id v10 = 0;
  BOOL v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v10];
  id v6 = v10;
  if (v6)
  {
    int64_t v7 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Fixed device identifier keychain entry could not be fetched or saved; will use a temporary value. Error: %@",
        buf,
        0xCu);
    }
  }
  if (!v5)
  {
LABEL_13:
    BOOL v5 = [(ADAnalyticsIdentifiersProvider *)self _createAndSaveFixedDeviceId];
  }

  return v5;
}

- (id)_createAndSaveFixedDeviceId
{
  id v2 = objc_alloc_init((Class)NSUUID);
  BOOL v3 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Saving fixed device identifier to Keychain", buf, 2u);
  }

  id v8 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v8];
  id v5 = v8;
  if (v5)
  {
    id v6 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Fixed device identifier keychain entry could not be archived. Error:%@", buf, 0xCu);
    }
  }
  else
  {
    AFKeychainSetValueForAccountAndKey();
  }

  return v2;
}

- (void)_writeCheckpoint:(id)a3
{
  id v3 = a3;
  id v4 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Checkpointing to Keychain", buf, 2u);
  }

  id v5 = [v3 archive];

  if (v5)
  {
    AFKeychainSetValueForAccountAndKey();
  }
  else
  {
    id v6 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int64_t v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Checkpoint could not be archived and will not be saved to keychain", v7, 2u);
    }
  }
}

- (id)_readCheckpoint
{
  id v2 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v9 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Reading checkpointed state from Keychain", v9, 2u);
  }

  id v3 = AFKeychainValueForAccountAndKey();
  if (v3)
  {
    id v4 = +[ADAnalyticsIdentifiersCheckpoint unarchive:v3];
    if (v4) {
      goto LABEL_10;
    }
    id v5 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Checkpoint object not available; will assume that there was no prior state",
        buf,
        2u);
    }
  }
  else
  {
    id v5 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Checkpoint state keychain entry does not exist; will use local seed if needed",
        v7,
        2u);
    }
  }

  id v4 = 0;
LABEL_10:

  return v4;
}

- (id)_createDIMEphemeralToAggregationIdentifierMapEvent
{
  id v3 = [(ADSynchronizedIds *)self->_analyticsIdsForDefaultUser aggregationIds];
  id v4 = [v3 current];

  id v5 = [v4 effectiveFrom];
  [v5 timeIntervalSince1970];
  unint64_t v7 = (unint64_t)(v6 * 1000.0);

  id v8 = [v4 expirationDate];
  [v8 timeIntervalSince1970];
  unint64_t v10 = (unint64_t)(v9 * 1000.0);

  double v11 = [v4 value];
  id v12 = +[ADAnalyticsDeviceAndUserIds deviceAggregationIdWithDeviceId:self->_fixedDeviceId forUserAggregationId:v11];
  id v13 = objc_alloc_init((Class)DIMSchemaDIMEphemeralToAggregationIdentifierMap);
  id v14 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:self->_lastCreatedUserEphemeralId];
  [v13 setUserEphemeralId:v14];

  id v15 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v11];
  [v13 setUserAggregationId:v15];

  id v16 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v12];
  [v13 setDeviceAggregationId:v16];

  [v13 setUserAggregationIdRotationTimestampMs:v7];
  [v13 setUserAggregationIdExpirationTimestampMs:v10];
  id v17 = objc_alloc_init((Class)DIMSchemaDIMClientEvent);
  [v17 setEphemeralToAggregationIdentifierMap:v13];

  return v17;
}

- (id)_createDIMEphemeralIdentifiersEvent:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)DIMSchemaDIMEphemeralIdentifiers);
  id v6 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:self->_lastCreatedUserEphemeralId];
  [v5 setUserEphemeralId:v6];

  [v5 setSecondsSinceEphemeralIdCreation:a3];
  if (AFIsInternalInstall())
  {
    id v7 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:self->_lastCreatedHomeEphemeralId];
    [v5 setHomeEphemeralId:v7];
  }
  id v8 = objc_alloc_init((Class)DIMSchemaDIMClientEvent);
  [v8 setEphemeralIdentifiers:v5];

  return v8;
}

- (void)fetchDeviceAggregationIdWithCallback:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1002B1188;
  v18 = sub_1002B1198;
  id v5 = [(ADSynchronizedIds *)self->_analyticsIdsForDefaultUser aggregationIds];
  id v6 = [v5 current];
  id v19 = [v6 value];

  if (v15[5])
  {
    id v7 = +[ADAnalyticsDeviceAndUserIds deviceAggregationIdWithDeviceId:forUserAggregationId:](ADAnalyticsDeviceAndUserIds, "deviceAggregationIdWithDeviceId:forUserAggregationId:", self->_fixedDeviceId);
    v4[2](v4, v7);
  }
  else
  {
    id v8 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "userAggregationId not yet available. Dispatching to queue to fetch.", buf, 2u);
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002B11A0;
    block[3] = &unk_10050B828;
    block[4] = self;
    id v12 = &v14;
    double v11 = v4;
    dispatch_async(queue, block);
  }
  _Block_object_dispose(&v14, 8);
}

- (void)fetchDeviceAndUserIdsForSharedUserId:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B1334;
  block[3] = &unk_10050E1D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)fetchDeviceAndUserIdsForiCloudAltDSId:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B1588;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_asyncLogAnalyticsIdentifiersDIMEvents:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002B1904;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)asyncLogAnalyticsIdentifiersDIMEvents
{
}

- (id)ephemeralIdForDefaultUser
{
  id v3 = +[NSDate now];
  syncPathExecutionTime = self->_syncPathExecutionTime;
  self->_syncPathExecutionTime = v3;

  id v5 = +[ADAnalyticsIdentifiersProvider _alignToRotationCadence:self->_syncPathExecutionTime];
  if (![(ADAnalyticsIdentifiersCheckpoint *)self->_checkpoint hasValidCurrentUserSeed:v5]) {
    goto LABEL_17;
  }
  id v6 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v15[0]) = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Checkpoint has valid current user seed", (uint8_t *)v15, 2u);
  }

  id v7 = [(ADAnalyticsIdentifiersCheckpoint *)self->_checkpoint currentUserSeed];
  if (!v7)
  {
LABEL_17:
    if (![(ADAnalyticsIdentifiersCheckpoint *)self->_checkpoint hasValidNextUserSeed:v5]) {
      goto LABEL_9;
    }
    id v8 = +[ADAnalyticsIdentifiersUtils logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15[0]) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Checkpoint has valid next user seed that is usable now", (uint8_t *)v15, 2u);
    }

    id v7 = [(ADAnalyticsIdentifiersCheckpoint *)self->_checkpoint nextUserSeed];
    if (!v7)
    {
LABEL_9:
      id v9 = +[ADAnalyticsIdentifiersUtils logger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v15[0]) = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Using locally created seed", (uint8_t *)v15, 2u);
      }

      id v7 = self->_localUserSeed;
    }
  }
  id v10 = +[ADAnalyticsIdentifiersProvider _createUserEphemeralIdWithUserSeed:v7 withCreationTime:v5];
  [(ADAnalyticsIdentifiersProvider *)self _testAndSetDefaultUserEphemeralId:v10 creationTime:v5 syncPath:1 expectedValue:0];
  double v11 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    BOOL ephemeralIdWasCreatedBySyncPath = self->_ephemeralIdWasCreatedBySyncPath;
    v15[0] = 67109120;
    v15[1] = ephemeralIdWasCreatedBySyncPath;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Synchronous path won race?%d", (uint8_t *)v15, 8u);
  }

  id v12 = self->_lastCreatedUserEphemeralId;
  return v12;
}

- (id)_initWithSyncCoordinator:(id)a3 withCheckpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ADAnalyticsIdentifiersProvider;
  id v8 = [(ADAnalyticsIdentifiersProvider *)&v24 init];
  id v9 = v8;
  if (v8)
  {
    v8->_id_assignment_lock._os_unfair_lock_opaque = 0;
    *(_WORD *)&v8->_firstRefresh = 1;
    if (v7)
    {
      id v10 = (ADAnalyticsIdentifiersCheckpoint *)v7;
    }
    else
    {
      id v10 = [(ADAnalyticsIdentifiersProvider *)v8 _readCheckpoint];
    }
    checkpoint = v9->_checkpoint;
    v9->_checkpoint = v10;

    id v12 = (NSUUID *)objc_alloc_init((Class)NSUUID);
    localUserSeed = v9->_localUserSeed;
    v9->_localUserSeed = v12;

    uint64_t v14 = +[NSDate now];
    localUserSeedCreationTime = v9->_localUserSeedCreationTime;
    v9->_localUserSeedCreationTime = (NSDate *)v14;

    uint64_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("ADAnalyticsIdentifiersProvider", v16);

    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v17;

    id v19 = v9->_queue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1002B1E9C;
    v21[3] = &unk_10050E160;
    id v22 = v6;
    int64_t v23 = v9;
    dispatch_async(v19, v21);
  }
  return v9;
}

- (ADAnalyticsIdentifiersProvider)init
{
  return (ADAnalyticsIdentifiersProvider *)[(ADAnalyticsIdentifiersProvider *)self _initWithSyncCoordinator:0 withCheckpoint:0];
}

+ (ADAnalyticsIdentifiersProvider)sharedInstance
{
  if (qword_100586150 != -1) {
    dispatch_once(&qword_100586150, &stru_100509ED0);
  }
  id v2 = (void *)qword_100586148;
  return (ADAnalyticsIdentifiersProvider *)v2;
}

+ (id)_alignToRotationCadence:(id)a3
{
  id v3 = a3;
  [v3 timeIntervalSince1970];
  unint64_t v5 = (unint64_t)(v4 * 1000.0);
  unint64_t v6 = 900 * (v5 / 0xDBBA0);
  if (1000 * (v5 / 0x3E8) == v5 && v6 == v5 / 0x3E8) {
    id v8 = v3;
  }
  else {
    id v8 = [objc_alloc((Class)NSDate) initWithTimeIntervalSince1970:(double)v6];
  }
  id v9 = v8;

  return v9;
}

+ (int64_t)_computeSecondsSinceBirth:(id)a3 forTimeInterval:(double)a4
{
  [a3 timeIntervalSince1970];
  return (uint64_t)(a4 - v5);
}

+ (int64_t)_computeSecondsSinceBirth:(id)a3
{
  id v4 = a3;
  double v5 = +[NSDate now];
  [v5 timeIntervalSince1970];
  id v6 = objc_msgSend(a1, "_computeSecondsSinceBirth:forTimeInterval:", v4);

  return (int64_t)v6;
}

+ (id)_createHomeEphemeralIdWithHomeSeed:(id)a3 withCreationTime:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADAnalyticsIdentifiersProvider _homeEphemeralIdNamespace];
  id v8 = +[ADAnalyticsIdentifiersProvider _timestampToNSString:v5];

  id v9 = +[NSUUID ad_createV5UUIDWithNamespace:](NSUUID, "ad_createV5UUIDWithNamespace:", v7, v6, v8, 0);

  return v9;
}

+ (id)_createUserEphemeralIdWithUserSeed:(id)a3 withCreationTime:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADAnalyticsIdentifiersProvider _userEphemeralIdNamespace];
  id v8 = +[ADAnalyticsIdentifiersProvider _timestampToNSString:v5];

  id v9 = +[NSUUID ad_createV5UUIDWithNamespace:](NSUUID, "ad_createV5UUIDWithNamespace:", v7, v6, v8, 0);

  return v9;
}

+ (id)_timestampToNSString:(id)a3
{
  uint64_t v3 = qword_100586140;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100586140, &stru_100509EB0);
  }
  id v5 = [(id)qword_100586138 stringFromDate:v4];

  return v5;
}

+ (id)_userEphemeralIdNamespace
{
  if (qword_100586130 != -1) {
    dispatch_once(&qword_100586130, &stru_100509E90);
  }
  id v2 = (void *)qword_100586128;
  return v2;
}

+ (id)_homeEphemeralIdNamespace
{
  if (qword_100586120 != -1) {
    dispatch_once(&qword_100586120, &stru_100509E70);
  }
  id v2 = (void *)qword_100586118;
  return v2;
}

@end