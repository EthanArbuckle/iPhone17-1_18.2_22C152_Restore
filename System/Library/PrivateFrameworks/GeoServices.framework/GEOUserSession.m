@interface GEOUserSession
+ (BOOL)initialShareSessionWithMaps;
+ (GEOSessionID)_newSessionId;
+ (id)highBytesStringFromSession:(GEOSessionID)a3;
+ (id)lowBytesStringFromSession:(GEOSessionID)a3;
+ (id)mapsUnifiedBundleId;
+ (id)sharedInstance;
+ (void)setInitialShareSessionWithMaps:(BOOL)a3;
- (BOOL)_hasGoodTimeSync;
- (BOOL)_hasMapsUserStartDate;
- (BOOL)_updateNavSessionIDAtTime:(double)a3;
- (BOOL)shareSessionWithMaps;
- (BOOL)shouldSuppressSession;
- (GEOSessionID)navSessionID;
- (GEOUserSession)init;
- (NSDictionary)_sharedSessionDataByAppId;
- (double)_currentTime;
- (double)_getMapsUserStartDate;
- (double)_preferredSessionStartDateDerivedFromMapsUserStartDate:(double)a3 currentDate:(double)a4;
- (id)_get15moDeviceRawSessionData;
- (id)_get15moDeviceSessionData;
- (id)_getPersistedLongSessionData;
- (id)_getPersistedNavSessionData;
- (id)_mapsUserSessionEntity;
- (id)_updateSharedSessionDataByAppId;
- (id)longSessionAppIdForActualAppId:(id)a3;
- (unint64_t)_get15moDeviceSessionConfiguredEpoch;
- (void)_accessLongSessionValuesInBlock:(id)a3;
- (void)_currentTimeResult:(id)a3;
- (void)_generateNewNavSessionIDAtTime:(double)a3;
- (void)_initializeLongSessionData;
- (void)_initializeShortAndNavData;
- (void)_mapsShortSessionValues:(id)a3;
- (void)_resetShortSessionID;
- (void)_saveSharedSessionDataByAppId:(id)a3;
- (void)_set15moDeviceSessionData:(id)a3;
- (void)_setMapsUserStartDate:(double)a3;
- (void)_setPersistedLongSessionData:(id)a3;
- (void)_setPersistedNavSessionData:(id)a3;
- (void)_setShortSessionId:(GEOSessionID)a3 sessionCreateTime:(double)a4;
- (void)_shortSessionValues:(id)a3;
- (void)endNavigationSession;
- (void)fifteenMonthDeviceSessionValues:(id)a3;
- (void)longSessionValuesForAppId:(id)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)mapsSessionEntityWithCallback:(id)a3 shareSessionIDWithMaps:(BOOL)a4 resetSession:(BOOL)a5;
- (void)resetLongSessionValuesForAppId:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)setMapsShortSession:(id)a3;
- (void)setMapsUserSessionEntity:(id)a3;
- (void)setShareSessionWithMaps:(BOOL)a3;
- (void)setSharedMapsUserSessionEntity:(id)a3 shareSessionIDWithMaps:(BOOL)a4;
- (void)shortAndNavSessionValues:(id)a3;
- (void)shortSessionValues:(id)a3;
- (void)startNavigationSessionWithDirectionsID:(id)a3 originalDirectionsID:(id)a4;
@end

@implementation GEOUserSession

void __32__GEOUserSession_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(GEOUserSession);
  v1 = (void *)_MergedGlobals_319;
  _MergedGlobals_319 = (uint64_t)v0;
}

- (GEOUserSession)init
{
  v17.receiver = self;
  v17.super_class = (Class)GEOUserSession;
  v2 = [(GEOUserSession *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_shortNavSessionLock._os_unfair_lock_opaque = 0;
    v2->_longSessionLock._os_unfair_lock_opaque = 0;
    BOOL v4 = 1;
    v2->_shortNavSessionNeedsInit = 1;
    v2->_longSessionNeedsInit = 1;
    uint64_t v5 = geo_dispatch_queue_create();
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v5;

    v3->_zeroSessionID._high = 0;
    v3->_zeroSessionID._low = 0;
    if (([(id)objc_opt_class() initialShareSessionWithMaps] & 1) == 0) {
      BOOL v4 = +[GEOPlatform isRunningInGeod];
    }
    v3->_shareSessionWithMaps = v4;
    v3->_fifteenMoDeviceSessionLock._os_unfair_lock_opaque = 0;
    v7 = v3->_serialQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __22__GEOUserSession_init__block_invoke;
    v15[3] = &unk_1E53ED650;
    v8 = v3;
    v16 = v8;
    uint64_t v9 = _GEOConfigAddBlockListenerForKey(GeoUserSessionConfig_ShortSessionDataByAppID, (uint64_t)off_1E9110838, v7, v15);
    id shortSessionListener = v8->_shortSessionListener;
    v8->_id shortSessionListener = (id)v9;

    v11 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v14 = 0;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "new instance", (uint8_t *)&v14, 2u);
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)onLocationServicesResetNotification, @"com.apple.Preferences.ResetPrivacyWarningsNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  return v3;
}

+ (BOOL)initialShareSessionWithMaps
{
  return _initialShareSessionWithMaps;
}

- (void)shortAndNavSessionValues:(id)a3
{
  id v4 = a3;
  uint64_t v47 = 0;
  v48 = (double *)&v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3010000000;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  v44 = "";
  uint64_t v37 = 0;
  v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  v34 = (double *)&v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3010000000;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  v26 = "";
  uint64_t v19 = 0;
  v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  os_unfair_lock_lock(&self->_shortNavSessionLock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__GEOUserSession_shortAndNavSessionValues___block_invoke;
  v6[3] = &unk_1E53ED6F0;
  v6[6] = &v41;
  v6[7] = &v37;
  v6[8] = &v33;
  v6[9] = &v29;
  v6[10] = &v23;
  v6[4] = self;
  v6[5] = &v47;
  v6[11] = &v19;
  v6[12] = &v15;
  v6[13] = &v11;
  v6[14] = &v7;
  [(GEOUserSession *)self _shortSessionValues:v6];
  os_unfair_lock_unlock(&self->_shortNavSessionLock);
  char v5 = *((unsigned char *)v8 + 24);
  (*((void (**)(id, uint64_t, uint64_t, void, uint64_t, uint64_t, void, void, double, double, double, double, char))v4
   + 2))(v4, v42[4], v42[5], *((unsigned int *)v30 + 6), v24[4], v24[5], *((unsigned __int8 *)v16 + 24), *((unsigned __int8 *)v12 + 24), v48[3], v38[3], v34[3], v20[3], v5);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
}

- (void)fifteenMonthDeviceSessionValues:(id)a3
{
  p_fifteenMoDeviceSessionLock = &self->_fifteenMoDeviceSessionLock;
  char v5 = (void (**)(id, uint64_t, uint64_t, void, uint64_t, double, double, double, double))a3;
  os_unfair_lock_lock(p_fifteenMoDeviceSessionLock);
  [(GEOUserSession *)self _currentTime];
  double v7 = v6;
  unint64_t v8 = [(GEOUserSession *)self _get15moDeviceSessionConfiguredEpoch];
  fifteenMoDeviceSessionData = self->_fifteenMoDeviceSessionData;
  if (fifteenMoDeviceSessionData)
  {
    char v10 = fifteenMoDeviceSessionData;
  }
  else
  {
    uint64_t v11 = [(GEOUserSession *)self _get15moDeviceSessionData];
    v12 = self->_fifteenMoDeviceSessionData;
    self->_fifteenMoDeviceSessionData = v11;

    char v10 = self->_fifteenMoDeviceSessionData;
    if (!v10)
    {
      uint64_t v18 = 0;
      goto LABEL_9;
    }
  }
  uint64_t v39 = v10;
  if (v8 == [(GEOAPSessionData *)v10 sessionEpoch])
  {
    [(GEOAPSessionData *)v39 createTime];
    char v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v13 + 39398400.0];
    id v15 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v16 = (void *)[v15 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v17 = [v16 components:12 fromDate:v14];
    uint64_t v18 = 1;
    [v17 setDay:1];
    uint64_t v19 = [v16 dateFromComponents:v17];
    [v19 timeIntervalSinceReferenceDate];
    double v21 = v20;

    char v10 = v39;
    if (v21 > v7) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v18 = 1;
    char v10 = v39;
  }
LABEL_9:
  uint64_t v40 = v10;
  double v22 = 0.0;
  if ([(GEOAPSessionData *)v10 hasMapsUserStartDate])
  {
    [(GEOAPSessionData *)v40 mapsUserStartDate];
    double v22 = v23;
  }
  v24 = GEOGetUserSessionLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_DEBUG, "creating new feature quality session data", buf, 2u);
  }

  uint64_t v25 = objc_alloc_init(GEOAPSessionData);
  [(GEOAPSessionData *)v25 setCreateTime:v7];
  uint64_t v26 = [(id)objc_opt_class() _newSessionId];
  -[GEOAPSessionData setSessionId:](v25, "setSessionId:", v26, v27);
  [(GEOAPSessionData *)v25 setSessionEpoch:v8];
  uint64_t v28 = +[GEOPlatform sharedPlatform];
  uint64_t v29 = [v28 hardwareClass];
  [(GEOAPSessionData *)v25 setOriginHardwareClass:v29];

  [(GEOAPSessionData *)v25 setHasRotated:v18];
  if (v22 != 0.0) {
    [(GEOAPSessionData *)v25 setMapsUserStartDate:v22];
  }
  GEOConfigSetBOOL(GeoUserSessionConfig_NeedsFallbackRegions, (uint64_t)off_1E9110818);

  objc_storeStrong((id *)&self->_fifteenMoDeviceSessionData, v25);
  [(GEOUserSession *)self _set15moDeviceSessionData:v25];
  char v10 = v25;
LABEL_16:
  uint64_t v41 = v10;
  os_unfair_lock_unlock(p_fifteenMoDeviceSessionLock);
  [(GEOAPSessionData *)v41 createTime];
  double v31 = floor(floor(v7 - v30) / 86400.0) * 86400.0;
  uint64_t v32 = [(GEOAPSessionData *)v41 sessionEpoch];
  uint64_t v33 = [(GEOAPSessionData *)v41 sessionId];
  uint64_t v35 = v34;
  [(GEOAPSessionData *)v41 createTime];
  double v37 = v36;
  [(GEOAPSessionData *)v41 mapsUserStartDate];
  v5[2](v5, v32, v33, v35, [(GEOAPSessionData *)v41 hasRotated], v7, v37, v31, v38);
}

- (id)_get15moDeviceSessionData
{
  v2 = [(GEOUserSession *)self _get15moDeviceRawSessionData];
  v3 = GEOGetUserSessionLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "15mo device raw session data was retrieved", v7, 2u);
    }

    char v5 = [[GEOAPSessionData alloc] initWithData:v2];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "15mo device raw session data not found", buf, 2u);
    }

    char v5 = 0;
  }

  return v5;
}

- (unint64_t)_get15moDeviceSessionConfiguredEpoch
{
  return GEOConfigGetUint64(GeoUserSessionConfig_FifteenMonthDeviceSessionConfiguredEpoch, (uint64_t)off_1E91107A8);
}

- (id)_get15moDeviceRawSessionData
{
  return _getValue(GeoUserSessionConfig_FifteenMonthDeviceSessionData, (uint64_t)off_1E91107C8, 1, 0, 0, 0);
}

- (double)_currentTime
{
  v2 = +[GEOReferenceTimeManager sharedManager];
  [v2 bestReferenceTime];
  double v4 = v3;

  return v4;
}

- (void)shortSessionValues:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_shortNavSessionLock);
  [(GEOUserSession *)self _shortSessionValues:v4];
  os_unfair_lock_unlock(&self->_shortNavSessionLock);
}

- (void)_shortSessionValues:(id)a3
{
  id v4 = a3;
  if (self->_shortNavSessionNeedsInit)
  {
    [(GEOUserSession *)self _initializeShortAndNavData];
    self->_shortNavSessionNeedsInit = 0;
  }
  uint64_t v24 = 0;
  uint64_t v25 = (double *)&v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __38__GEOUserSession__shortSessionValues___block_invoke;
  v23[3] = &unk_1E53E87C8;
  v23[4] = &v24;
  [(GEOUserSession *)self _currentTimeResult:v23];
  if ([(GEOUserSession *)self _updateNavSessionIDAtTime:v25[3]]) {
    [(GEOUserSession *)self _resetShortSessionID];
  }
  uint64_t v17 = 0;
  uint64_t v18 = (GEOSessionID *)&v17;
  uint64_t v19 = 0x3010000000;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  double v20 = "";
  uint64_t v13 = 0;
  char v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  BOOL v5 = [(GEOUserSession *)self shouldSuppressSession];
  if (self->_shareSessionWithMaps)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__GEOUserSession__shortSessionValues___block_invoke_2;
    v12[3] = &unk_1E53ED718;
    v12[4] = &v17;
    v12[5] = &v13;
    v12[6] = &v24;
    [(GEOUserSession *)self _mapsShortSessionValues:v12];
    double v6 = v25;
    double shortSessionStartTime = v14[3];
    unint64_t v8 = v18;
  }
  else
  {
    double v6 = v25;
    if (v25[3] > self->_shortSessionStartTime + 900.0)
    {
      uint64_t v9 = GEOGetUserSessionLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v11[0] = 0;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "creating new short session data", (uint8_t *)v11, 2u);
      }

      self->_shortSessionID._high = [(id)objc_opt_class() _newSessionId];
      self->_shortSessionID._low = v10;
      double v6 = v25;
      self->_double shortSessionStartTime = v25[3];
    }
    unint64_t v8 = v18;
    v18[2] = self->_shortSessionID;
    double shortSessionStartTime = self->_shortSessionStartTime;
    v14[3] = shortSessionStartTime;
  }
  (*((void (**)(id, unint64_t, unint64_t, void, void, void, BOOL))v4 + 2))(v4, v8[2]._high, v8[2]._low, ((v6[3] - shortSessionStartTime) * 10000.0), 0, 0, v5);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v24, 8);
}

- (BOOL)shouldSuppressSession
{
  v2 = +[GEOPlatform sharedPlatform];
  if ([v2 isInternalInstall])
  {

    return 1;
  }
  char BOOL = GEOConfigGetBOOL(GeoUserSessionConfig_ChildSuppressionEnabled, (uint64_t)off_1E9110848);

  return (BOOL & 1) != 0;
}

- (BOOL)_updateNavSessionIDAtTime:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double navigationSessionStartTime = self->_navigationSessionStartTime;
  BOOL v5 = a3 - navigationSessionStartTime >= 10800.0 && navigationSessionStartTime != 0.0;
  if (v5)
  {
    double v7 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unint64_t v8 = GEOSessionIDDescription(&self->_navigationSessionID._high);
      double v9 = self->_navigationSessionStartTime;
      int v11 = 138478339;
      v12 = v8;
      __int16 v13 = 2049;
      double v14 = v9;
      __int16 v15 = 2048;
      double v16 = a3;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "NavSessionID %{private}@ expired: startTime %{private}f, currentTime=%f", (uint8_t *)&v11, 0x20u);
    }
    [(GEOUserSession *)self _generateNewNavSessionIDAtTime:a3];
  }
  return v5;
}

- (void)_mapsShortSessionValues:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v40 = (void (**)(id, uint64_t, void, double, double))a3;
  uint64_t v47 = 0;
  v48 = (double *)&v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __42__GEOUserSession__mapsShortSessionValues___block_invoke;
  v46[3] = &unk_1E53E87C8;
  v46[4] = &v47;
  [(GEOUserSession *)self _currentTimeResult:v46];
  double v4 = v48[3];
  uint64_t v39 = self;
  BOOL v5 = [(GEOUserSession *)self _sharedSessionDataByAppId];
  double v6 = GEOGetUserSessionLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [v5 count];
    *(_DWORD *)buf = 134217984;
    v52 = v7;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "===== will evalutate session data from %lu appIds", buf, 0xCu);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v57 count:16];
  if (!v9)
  {

    double v30 = 0;
    goto LABEL_29;
  }
  uint64_t v41 = 0;
  unint64_t v10 = 0;
  double v11 = v4 + -900.0;
  uint64_t v12 = *(void *)v43;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v43 != v12) {
        objc_enumerationMutation(v8);
      }
      double v14 = *(NSObject **)(*((void *)&v42 + 1) + 8 * i);
      __int16 v15 = GEOGetUserSessionLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v14;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "evalutating session data created by %@", buf, 0xCu);
      }

      double v16 = [v8 objectForKeyedSubscript:v14];
      [v16 createTime];
      if (v17 <= v11)
      {
        uint64_t v26 = GEOGetUserSessionLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          [v16 createTime];
          *(_DWORD *)buf = 138412802;
          v52 = v14;
          __int16 v53 = 2048;
          uint64_t v54 = v27;
          __int16 v55 = 2048;
          double v56 = v11;
          _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_DEBUG, "session data created by %@ is already expired (%f <= %f)", buf, 0x20u);
        }
      }
      else if (v10)
      {
        [v16 createTime];
        double v19 = v18;
        [(GEOAPSessionData *)v10 createTime];
        if (v19 <= v20) {
          goto LABEL_22;
        }
        uint64_t v21 = GEOGetUserSessionLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          [v16 createTime];
          uint64_t v23 = v22;
          [(GEOAPSessionData *)v10 createTime];
          *(_DWORD *)buf = 138412802;
          v52 = v14;
          __int16 v53 = 2048;
          uint64_t v54 = v23;
          __int16 v55 = 2048;
          double v56 = v24;
          _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_DEBUG, "new candidate session data created by %@ (%f > %f)", buf, 0x20u);
        }

        uint64_t v25 = v16;
        uint64_t v26 = v41;
        uint64_t v41 = v14;
        unint64_t v10 = v25;
      }
      else
      {
        uint64_t v28 = GEOGetUserSessionLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v14;
          _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_DEBUG, "new candidate session data created by %@", buf, 0xCu);
        }

        unint64_t v10 = v16;
        uint64_t v26 = v41;
        uint64_t v41 = v14;
      }

LABEL_22:
    }
    uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v57 count:16];
  }
  while (v9);

  if (v10)
  {
    uint64_t v29 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v41;
      _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_DEBUG, "Using existing shared short session data created by %@", buf, 0xCu);
    }
    goto LABEL_32;
  }
  double v30 = v41;
LABEL_29:
  uint64_t v41 = GEOApplicationIdentifierOrProcessName();

  double v31 = GEOGetUserSessionLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v41;
    _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_DEBUG, "%@ is creating new shared short session data", buf, 0xCu);
  }

  unint64_t v10 = objc_alloc_init(GEOAPSessionData);
  [(GEOAPSessionData *)v10 setCreateTime:v48[3]];
  uint64_t v32 = [(id)objc_opt_class() _newSessionId];
  -[GEOAPSessionData setSessionId:](v10, "setSessionId:", v32, v33);
  uint64_t v29 = [v8 mutableCopy];
  [v29 setObject:v10 forKeyedSubscript:v41];
  [(GEOUserSession *)v39 _saveSharedSessionDataByAppId:v29];
LABEL_32:

  double v34 = v48[3];
  uint64_t v35 = [(GEOAPSessionData *)v10 sessionId];
  uint64_t v37 = v36;
  [(GEOAPSessionData *)v10 createTime];
  v40[2](v40, v35, v37, v34, v38);

  _Block_object_dispose(&v47, 8);
}

void *__38__GEOUserSession__shortSessionValues___block_invoke_2(void *result, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result[4] + 8);
  *(void *)(v5 + 32) = a2;
  *(void *)(v5 + 40) = a3;
  *(double *)(*(void *)(result[5] + 8) + 24) = a5;
  *(double *)(*(void *)(result[6] + 8) + 24) = a4;
  return result;
}

- (NSDictionary)_sharedSessionDataByAppId
{
  shortSessionByAppID = self->_shortSessionByAppID;
  if (shortSessionByAppID)
  {
    double v3 = shortSessionByAppID;
  }
  else
  {
    double v3 = [(GEOUserSession *)self _updateSharedSessionDataByAppId];
  }

  return v3;
}

- (void)_currentTimeResult:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOReferenceTimeManager sharedManager];
  [v4 referenceTimeResult:v3];
}

uint64_t __42__GEOUserSession__mapsShortSessionValues___block_invoke(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __38__GEOUserSession__shortSessionValues___block_invoke(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void *__43__GEOUserSession_shortAndNavSessionValues___block_invoke(void *result, uint64_t a2, uint64_t a3, int a4, char a5, char a6, char a7, double a8, double a9, double a10)
{
  *(double *)(*(void *)(result[5] + 8) + 24) = a8;
  uint64_t v10 = *(void *)(result[6] + 8);
  *(void *)(v10 + 32) = a2;
  *(void *)(v10 + 40) = a3;
  *(double *)(*(void *)(result[7] + 8) + 24) = a9;
  *(double *)(*(void *)(result[8] + 8) + 24) = a10;
  *(_DWORD *)(*(void *)(result[9] + 8) + 24) = a4;
  *(_OWORD *)(*(void *)(result[10] + 8) + 32) = *(_OWORD *)(result[4] + 80);
  double v11 = *(double *)(result[4] + 96);
  double v12 = 0.0;
  if (v11 != 0.0) {
    double v12 = *(double *)(*(void *)(result[5] + 8) + 24) - v11;
  }
  *(double *)(*(void *)(result[11] + 8) + 24) = v12;
  *(unsigned char *)(*(void *)(result[12] + 8) + 24) = a5;
  *(unsigned char *)(*(void *)(result[13] + 8) + 24) = a6;
  *(unsigned char *)(*(void *)(result[14] + 8) + 24) = a7;
  return result;
}

void __22__GEOUserSession_init__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  id v2 = (id)[*(id *)(a1 + 32) _updateSharedSessionDataByAppId];
  id v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 40);

  os_unfair_lock_unlock(v3);
}

- (id)_updateSharedSessionDataByAppId
{
  id v3 = _getValue(GeoUserSessionConfig_ShortSessionDataByAppID, (uint64_t)off_1E9110838, 1, 0, 0, 0);
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    id v11 = 0;
    double v6 = [v4 unarchivedDictionaryWithKeysOfClass:v5 objectsOfClass:objc_opt_class() fromData:v3 error:&v11];
    id v7 = v11;
    shortSessionByAppID = self->_shortSessionByAppID;
    self->_shortSessionByAppID = v6;

    uint64_t v9 = self->_shortSessionByAppID;
  }
  else
  {
    uint64_t v9 = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

- (void)_saveSharedSessionDataByAppId:(id)a3
{
  objc_storeStrong((id *)&self->_shortSessionByAppID, a3);
  id v4 = a3;
  uint64_t v6 = 0;
  uint64_t v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v6];
  _setValue(GeoUserSessionConfig_ShortSessionDataByAppID, (uint64_t)off_1E9110838, v5, 1, 0);
}

- (void)_initializeShortAndNavData
{
  self->_shortSessionID = self->_zeroSessionID;
  self->_double shortSessionStartTime = 0.0;
  navigationDirectionsID = self->_navigationDirectionsID;
  self->_navigationDirectionsID = 0;

  self->_navigationSessionID = self->_zeroSessionID;
  previousNavigationDirectionsID = self->_previousNavigationDirectionsID;
  self->_double navigationSessionStartTime = 0.0;
  self->_previousNavigationDirectionsID = 0;

  self->_previousNavigationSessionID = self->_zeroSessionID;
}

+ (GEOSessionID)_newSessionId
{
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  id v2 = objc_alloc_init(MEMORY[0x1E4F29128]);
  [v2 getUUIDBytes:&v5];

  unint64_t v3 = v5;
  unint64_t v4 = v6;
  result._low = v4;
  result._high = v3;
  return result;
}

+ (id)sharedInstance
{
  if (qword_1EB2A05F0 != -1) {
    dispatch_once(&qword_1EB2A05F0, &__block_literal_global_182);
  }
  id v2 = (void *)_MergedGlobals_319;

  return v2;
}

- (double)_getMapsUserStartDate
{
  return GEOConfigGetDouble(GeoUserSessionConfig_MapsUserStartDate, (uint64_t)off_1E91107F8);
}

+ (void)setInitialShareSessionWithMaps:(BOOL)a3
{
  _initialShareSessionWithMaps = a3;
}

+ (id)highBytesStringFromSession:(GEOSessionID)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%0*llu", a3._low, 20, a3._high);
}

+ (id)lowBytesStringFromSession:(GEOSessionID)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%0*llu", 20, a3._low);
}

- (void)_initializeLongSessionData
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(GEOUserSession *)self _getPersistedLongSessionData];
  if (v3)
  {
    unint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    id v23 = 0;
    unint64_t v6 = [v4 unarchivedDictionaryWithKeysOfClass:v5 objectsOfClass:objc_opt_class() fromData:v3 error:&v23];
    id v7 = v23;
    id v8 = v7;
    if (v6)
    {

      uint64_t v9 = (NSMutableDictionary *)[v6 mutableCopy];
      goto LABEL_8;
    }
    uint64_t v10 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "unarchival error %@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v6 = 0;
LABEL_8:
  p_longSessionByAppID = &self->_longSessionByAppID;
  longSessionByAppID = self->_longSessionByAppID;
  self->_longSessionByAppID = v9;

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __44__GEOUserSession__initializeLongSessionData__block_invoke;
  v22[3] = &unk_1E53E87C8;
  v22[4] = &buf;
  [(GEOUserSession *)self _currentTimeResult:v22];
  double v14 = self->_longSessionByAppID;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  double v18 = __44__GEOUserSession__initializeLongSessionData__block_invoke_2;
  double v19 = &unk_1E53ED678;
  p_long long buf = &buf;
  id v15 = v13;
  id v20 = v15;
  [(NSMutableDictionary *)v14 enumerateKeysAndObjectsUsingBlock:&v16];
  if (objc_msgSend(v15, "count", v16, v17, v18, v19)) {
    [(NSMutableDictionary *)*p_longSessionByAppID removeObjectsForKeys:v15];
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __44__GEOUserSession__initializeLongSessionData__block_invoke(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __44__GEOUserSession__initializeLongSessionData__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  double v5 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  [a3 createTime];
  if (v5 > v6 + 2592000.0) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (void)_accessLongSessionValuesInBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (unsigned int (**)(id, NSMutableDictionary *))a3;
  p_longSessionLock = &self->_longSessionLock;
  os_unfair_lock_lock(&self->_longSessionLock);
  if (self->_longSessionNeedsInit)
  {
    [(GEOUserSession *)self _initializeLongSessionData];
    self->_longSessionNeedsInit = 0;
  }
  if (v4[2](v4, self->_longSessionByAppID))
  {
    longSessionByAppID = self->_longSessionByAppID;
    id v10 = 0;
    id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:longSessionByAppID requiringSecureCoding:1 error:&v10];
    id v8 = v10;
    if (v7)
    {
      [(GEOUserSession *)self _setPersistedLongSessionData:v7];
      _setValue(GeoUserSessionConfig_LongSessionDataByAppID, (uint64_t)off_1E9110828, v7, 1, 0);
    }
    else
    {
      uint64_t v9 = GEOGetUserSessionLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v12 = v8;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "archival error %@", buf, 0xCu);
      }
    }
  }
  os_unfair_lock_unlock(p_longSessionLock);
}

- (void)longSessionValuesForAppId:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(GEOUserSession *)self longSessionAppIdForActualAppId:a3];
  id v11 = v10;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3010000000;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v49 = "";
  uint64_t v42 = 0;
  long long v43 = (double *)&v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v41 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = (double *)&v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  if (v10)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke_2;
    v26[3] = &unk_1E53ED6A0;
    id v27 = v10;
    uint64_t v28 = self;
    uint64_t v29 = &v34;
    double v30 = &v46;
    double v31 = &v42;
    uint64_t v32 = &v38;
    [(GEOUserSession *)self _accessLongSessionValuesInBlock:v26];
  }
  else
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke;
    v33[3] = &unk_1E53E87C8;
    v33[4] = &v34;
    [(GEOUserSession *)self _currentTimeResult:v33];
    v43[3] = v35[3];
    uint64_t v12 = [(id)objc_opt_class() _newSessionId];
    uint64_t v13 = v47;
    v47[4] = v12;
    v13[5] = v14;
    *((_DWORD *)v39 + 6) = -1;
  }
  double v15 = v35[3];
  double v16 = v43[3];
  v18[1] = 3221225472;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[2] = __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke_19;
  v18[3] = &unk_1E53ED6C8;
  id v19 = v9;
  id v20 = &v34;
  uint64_t v21 = &v46;
  uint64_t v22 = &v42;
  double v24 = floor(v15 / 60.0) * 60.0;
  double v25 = v15 - v16;
  id v23 = &v38;
  id v17 = v9;
  dispatch_async(v8, v18);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

uint64_t __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

BOOL __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  double v5 = (GEOAPSessionData *)v4;
  if (!v4)
  {
    double v6 = *(void **)(a1 + 32);
    id v7 = +[GEOUserSession mapsUnifiedBundleId];
    char v8 = [v6 isEqualToString:v7];

    double v5 = objc_alloc_init(GEOAPSessionData);
    if (v8) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = [*(id *)(a1 + 32) hash];
    }
    [(GEOAPSessionData *)v5 setOpaqueAppId:v9];
    id v10 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138478083;
      uint64_t v30 = v11;
      __int16 v31 = 1025;
      unsigned int v32 = [(GEOAPSessionData *)v5 opaqueAppId];
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "creating new long session for '%{private}@' with opaqueID %{private}u", buf, 0x12u);
    }

    [(GEOAPSessionData *)v5 setCreateTime:0.0];
    if (*(void *)(a1 + 32)) {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5);
    }
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke_17;
  v28[3] = &unk_1E53E87C8;
  uint64_t v12 = *(void **)(a1 + 40);
  v28[4] = *(void *)(a1 + 48);
  [v12 _currentTimeResult:v28];
  double v13 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  [(GEOAPSessionData *)v5 createTime];
  double v15 = v14 + 2592000.0;
  if (v13 > v14 + 2592000.0)
  {
    double v16 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138477827;
      uint64_t v30 = v17;
      _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "long session expired for '%{private}@'", buf, 0xCu);
    }

    uint64_t v18 = [(id)objc_opt_class() _newSessionId];
    -[GEOAPSessionData setSessionId:](v5, "setSessionId:", v18, v19);
    [(GEOAPSessionData *)v5 setCreateTime:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    if (!v4)
    {
      uint32_t v20 = arc4random_uniform(0x1Eu);
      [(GEOAPSessionData *)v5 createTime];
      [(GEOAPSessionData *)v5 setCreateTime:v21 - (double)(86400 * v20)];
      uint64_t v22 = GEOGetUserSessionLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v30) = v20;
        _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_DEBUG, "applying create time offset of %u days", buf, 8u);
      }
    }
  }
  uint64_t v23 = [(GEOAPSessionData *)v5 sessionId];
  uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v24 + 32) = v23;
  *(void *)(v24 + 40) = v25;
  [(GEOAPSessionData *)v5 createTime];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v26;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [(GEOAPSessionData *)v5 opaqueAppId];

  return v13 > v15;
}

uint64_t __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke_17(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __71__GEOUserSession_longSessionValuesForAppId_completionQueue_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, double, double, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)setShareSessionWithMaps:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_shortNavSessionLock = &self->_shortNavSessionLock;
  os_unfair_lock_lock(&self->_shortNavSessionLock);
  if (self->_shortNavSessionNeedsInit)
  {
    [(GEOUserSession *)self _initializeShortAndNavData];
    self->_shortNavSessionNeedsInit = 0;
  }
  double v6 = GEOGetUserSessionLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = "no";
    if (v3) {
      char v8 = "yes";
    }
    else {
      char v8 = "no";
    }
    if (self->_shareSessionWithMaps) {
      id v7 = "yes";
    }
    int v9 = 136315394;
    id v10 = v8;
    __int16 v11 = 2080;
    uint64_t v12 = v7;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "setting maps share state to %s; previous state %s",
      (uint8_t *)&v9,
      0x16u);
  }

  if (self->_shareSessionWithMaps != v3) {
    self->_double shortSessionStartTime = 0.0;
  }
  self->_shareSessionWithMaps = v3;
  os_unfair_lock_unlock(p_shortNavSessionLock);
}

- (id)_mapsUserSessionEntity
{
  if (self->_shareSessionWithMaps)
  {
    *(void *)long long buf = 0;
    id v7 = buf;
    uint64_t v8 = 0x3032000000;
    int v9 = __Block_byref_object_copy__92;
    id v10 = __Block_byref_object_dispose__92;
    id v11 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__GEOUserSession__mapsUserSessionEntity__block_invoke;
    v5[3] = &unk_1E53ED740;
    v5[4] = buf;
    [(GEOUserSession *)self shortSessionValues:v5];
    id v2 = *((id *)v7 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v3 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "maps short session requested but session sharing is not enabled", buf, 2u);
    }

    id v2 = 0;
  }

  return v2;
}

void __40__GEOUserSession__mapsUserSessionEntity__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  id v7 = -[GEOUserSessionEntity initWithSessionID:sessionCreationTime:sequenceNumber:]([GEOUserSessionEntity alloc], "initWithSessionID:sessionCreationTime:sequenceNumber:", a2, a3, a4, a6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)_setShortSessionId:(GEOSessionID)a3 sessionCreateTime:(double)a4
{
  unint64_t low = a3._low;
  unint64_t high = a3._high;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_shortNavSessionLock = &self->_shortNavSessionLock;
  os_unfair_lock_lock(&self->_shortNavSessionLock);
  if (self->_shortNavSessionNeedsInit)
  {
    [(GEOUserSession *)self _initializeShortAndNavData];
    self->_shortNavSessionNeedsInit = 0;
  }
  if (self->_shareSessionWithMaps)
  {
    int v9 = [(GEOUserSession *)self _sharedSessionDataByAppId];
    id v10 = [v9 mutableCopy];

    id v11 = objc_alloc_init(GEOAPSessionData);
    -[GEOAPSessionData setSessionId:](v11, "setSessionId:", high, low);
    [(GEOAPSessionData *)v11 setCreateTime:a4];
    uint64_t v12 = GEOApplicationIdentifierOrProcessName();
    [v10 setObject:v11 forKeyedSubscript:v12];
    [(GEOUserSession *)self _saveSharedSessionDataByAppId:v10];
    uint64_t v13 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      double v15 = v12;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEBUG, "%@ has reset the short session", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    id v10 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "request to set maps short session but session sharing is not enabled", (uint8_t *)&v14, 2u);
    }
  }

  os_unfair_lock_unlock(p_shortNavSessionLock);
}

- (void)setMapsUserSessionEntity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sessionID];
  uint64_t v7 = v6;
  [v4 sessionCreationTime];
  double v9 = v8;

  -[GEOUserSession _setShortSessionId:sessionCreateTime:](self, "_setShortSessionId:sessionCreateTime:", v5, v7, v9);
}

- (void)setMapsShortSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sessionID];
  uint64_t v7 = v6;
  [v4 sessionCreationTime];
  double v9 = v8;

  -[GEOUserSession _setShortSessionId:sessionCreateTime:](self, "_setShortSessionId:sessionCreateTime:", v5, v7, v9);
}

- (void)setSharedMapsUserSessionEntity:(id)a3 shareSessionIDWithMaps:(BOOL)a4
{
  self->_shareSessionWithMaps = a4;
  id v5 = a3;
  uint64_t v6 = [v5 sessionID];
  uint64_t v8 = v7;
  [v5 sessionCreationTime];
  double v10 = v9;

  -[GEOUserSession _setShortSessionId:sessionCreateTime:](self, "_setShortSessionId:sessionCreateTime:", v6, v8, v10);
}

- (void)mapsSessionEntityWithCallback:(id)a3 shareSessionIDWithMaps:(BOOL)a4 resetSession:(BOOL)a5
{
  self->_shareSessionWithMaps = a4;
  id v7 = a3;
  id v8 = [(GEOUserSession *)self _mapsUserSessionEntity];
  (*((void (**)(id, id))a3 + 2))(v7, v8);
}

- (void)_generateNewNavSessionIDAtTime:(double)a3
{
  self->_double navigationSessionStartTime = a3;
  self->_navigationSessionID._unint64_t high = [(id)objc_opt_class() _newSessionId];
  self->_navigationSessionID._unint64_t low = v4;
}

- (GEOSessionID)navSessionID
{
  p_shortNavSessionLock = &self->_shortNavSessionLock;
  os_unfair_lock_lock(&self->_shortNavSessionLock);
  if (self->_shortNavSessionNeedsInit)
  {
    [(GEOUserSession *)self _initializeShortAndNavData];
    self->_shortNavSessionNeedsInit = 0;
  }
  unint64_t high = self->_navigationSessionID._high;
  unint64_t low = self->_navigationSessionID._low;
  os_unfair_lock_unlock(p_shortNavSessionLock);
  unint64_t v6 = high;
  unint64_t v7 = low;
  result._unint64_t low = v7;
  result._unint64_t high = v6;
  return result;
}

- (void)startNavigationSessionWithDirectionsID:(id)a3 originalDirectionsID:(id)a4
{
  unint64_t v6 = (NSData *)a3;
  id v7 = a4;
  id v8 = GEOGetUserSessionLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "begin nav", buf, 2u);
  }

  os_unfair_lock_lock(&self->_shortNavSessionLock);
  if (self->_shortNavSessionNeedsInit)
  {
    [(GEOUserSession *)self _initializeShortAndNavData];
    self->_shortNavSessionNeedsInit = 0;
  }
  *(void *)long long buf = 0;
  uint64_t v25 = buf;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  previousNavigationDirectionsID = self->_previousNavigationDirectionsID;
  if (!v7 || !previousNavigationDirectionsID)
  {
    double v10 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v19 = 0;
      id v11 = "no previous nav session data";
LABEL_14:
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, v11, v19, 2u);
    }
LABEL_15:

    v25[24] = 1;
    goto LABEL_16;
  }
  if (([(NSData *)previousNavigationDirectionsID isEqual:v7] & 1) == 0)
  {
    double v10 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v19 = 0;
      id v11 = "previous nav session data stale; not a reroute";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (self->_previousNavigationSessionEndTime > 0.0)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __78__GEOUserSession_startNavigationSessionWithDirectionsID_originalDirectionsID___block_invoke;
    v23[3] = &unk_1E53ED768;
    v23[4] = self;
    void v23[5] = buf;
    [(GEOUserSession *)self _currentTimeResult:v23];
  }
LABEL_16:
  *(void *)uint64_t v19 = 0;
  uint32_t v20 = v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__GEOUserSession_startNavigationSessionWithDirectionsID_originalDirectionsID___block_invoke_30;
  v18[3] = &unk_1E53E87C8;
  void v18[4] = v19;
  [(GEOUserSession *)self _currentTimeResult:v18];
  if (v25[24])
  {
    uint64_t v12 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "will create new nav session data", v17, 2u);
    }

    [(GEOUserSession *)self _generateNewNavSessionIDAtTime:*((double *)v20 + 3)];
    uint64_t v13 = v6;
  }
  else
  {
    int v14 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "will continue using existing nav session data", v17, 2u);
    }

    self->_navigationSessionID = self->_previousNavigationSessionID;
    self->_double navigationSessionStartTime = self->_previousNavigationSessionStartTime;
    uint64_t v13 = self->_previousNavigationDirectionsID;
  }
  double v15 = v13;
  navigationDirectionsID = self->_navigationDirectionsID;
  self->_navigationDirectionsID = v15;

  self->_previousNavigationSessionID = self->_navigationSessionID;
  self->_previousNavigationSessionStartTime = self->_navigationSessionStartTime;
  objc_storeStrong((id *)&self->_previousNavigationDirectionsID, self->_navigationDirectionsID);
  self->_previousNavigationSessionEndTime = 0.0;
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(buf, 8);
  os_unfair_lock_unlock(&self->_shortNavSessionLock);
}

void __78__GEOUserSession_startNavigationSessionWithDirectionsID_originalDirectionsID___block_invoke(uint64_t a1, double a2)
{
  if (a2 - *(double *)(*(void *)(a1 + 32) + 136) > 900.0)
  {
    BOOL v3 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)unint64_t v4 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "previous nav session data stale; reroute threshhold exceeded",
        v4,
        2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __78__GEOUserSession_startNavigationSessionWithDirectionsID_originalDirectionsID___block_invoke_30(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)endNavigationSession
{
  BOOL v3 = GEOGetUserSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "end nav", buf, 2u);
  }

  os_unfair_lock_lock(&self->_shortNavSessionLock);
  if (self->_shortNavSessionNeedsInit)
  {
    [(GEOUserSession *)self _initializeShortAndNavData];
    self->_shortNavSessionNeedsInit = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__GEOUserSession_endNavigationSession__block_invoke;
  v6[3] = &unk_1E53DC4A8;
  v6[4] = self;
  [(GEOUserSession *)self _currentTimeResult:v6];
  self->_navigationSessionID = self->_zeroSessionID;
  self->_double navigationSessionStartTime = 0.0;
  navigationDirectionsID = self->_navigationDirectionsID;
  self->_navigationDirectionsID = 0;

  id v5 = GEOGetUserSessionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "will reset maps short session data", buf, 2u);
  }

  [(GEOUserSession *)self _resetShortSessionID];
  os_unfair_lock_unlock(&self->_shortNavSessionLock);
}

uint64_t __38__GEOUserSession_endNavigationSession__block_invoke(uint64_t result, double a2)
{
  *(double *)(*(void *)(result + 32) + 136) = a2;
  return result;
}

- (BOOL)shareSessionWithMaps
{
  return self->_shareSessionWithMaps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_fifteenMoDeviceSessionData, 0);
  objc_storeStrong((id *)&self->_longSessionByAppID, 0);
  objc_storeStrong((id *)&self->_previousNavigationDirectionsID, 0);
  objc_storeStrong((id *)&self->_navigationDirectionsID, 0);
  objc_storeStrong(&self->_shortSessionListener, 0);

  objc_storeStrong((id *)&self->_shortSessionByAppID, 0);
}

- (void)resetLongSessionValuesForAppId:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__GEOUserSession_Internal__resetLongSessionValuesForAppId_queue_completion___block_invoke;
  v8[3] = &unk_1E53ED790;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(GEOUserSession *)self _accessLongSessionValuesInBlock:v8];
}

BOOL __76__GEOUserSession_Internal__resetLongSessionValuesForAppId_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) longSessionAppIdForActualAppId:*(void *)(a1 + 40)];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (v5) {
    [v3 removeObjectForKey:v4];
  }

  return v5 != 0;
}

- (void)_resetShortSessionID
{
  if ([(GEOUserSession *)self shareSessionWithMaps])
  {
    _setValue(GeoUserSessionConfig_ShortSessionDataByAppID, (uint64_t)off_1E9110838, 0, 0, 0);
    shortSessionByAppID = self->_shortSessionByAppID;
    self->_shortSessionByAppID = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    self->_double shortSessionStartTime = 0.0;
  }
}

+ (id)mapsUnifiedBundleId
{
  return @"com.apple.MapsConfederation";
}

- (id)longSessionAppIdForActualAppId:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (qword_1EB2A06D0 == -1)
  {
    if (!v3)
    {
LABEL_4:
      id v5 = [(id)objc_opt_class() mapsUnifiedBundleId];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&qword_1EB2A06D0, &__block_literal_global_193);
    if (!v4) {
      goto LABEL_4;
    }
  }
  if ([(id)_MergedGlobals_329 containsObject:v4]) {
    goto LABEL_4;
  }
  id v5 = v4;
LABEL_6:
  id v6 = v5;

  return v6;
}

void __67__GEOUserSession_LongSessionAppId__longSessionAppIdForActualAppId___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1ED73F190];
  v1 = (void *)_MergedGlobals_329;
  _MergedGlobals_329 = v0;
}

- (double)_preferredSessionStartDateDerivedFromMapsUserStartDate:(double)a3 currentDate:(double)a4
{
  double v4 = a4;
  if (a3 != a4)
  {
    id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
    id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v4];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v9 setDay:456];
    if ([v7 compare:v8] == 1)
    {
      double v10 = v7;
    }
    else
    {
      do
      {
        double v10 = [v6 dateByAddingComponents:v9 toDate:v7 options:0];

        id v7 = v10;
      }
      while ([v10 compare:v8] != 1);
    }
    [v9 setDay:-456];
    id v11 = [v6 dateByAddingComponents:v9 toDate:v10 options:0];
    [v11 timeIntervalSinceReferenceDate];
    double v4 = v12;
  }
  return v4;
}

- (BOOL)_hasMapsUserStartDate
{
  return _GEOConfigHasValue(GeoUserSessionConfig_MapsUserStartDate, (uint64_t)off_1E91107F8);
}

- (void)_setMapsUserStartDate:(double)a3
{
}

- (BOOL)_hasGoodTimeSync
{
  id v2 = +[GEOReferenceTimeManager sharedManager];
  char v3 = [v2 synchronized];

  return v3;
}

- (void)_set15moDeviceSessionData:(id)a3
{
  id v3 = [a3 data];
  _setValue(GeoUserSessionConfig_FifteenMonthDeviceSessionData, (uint64_t)off_1E91107C8, v3, 1, 0);
}

- (id)_getPersistedLongSessionData
{
  return _getValue(GeoUserSessionConfig_LongSessionDataByAppID, (uint64_t)off_1E9110828, 1, 0, 0, 0);
}

- (void)_setPersistedLongSessionData:(id)a3
{
}

- (id)_getPersistedNavSessionData
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v2 = _getValue(GeoUserSessionConfig_NavigationSessionInfo, (uint64_t)off_1E9110808, 1, 0, 0, 0);
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    id v5 = (void *)[v3 initWithArray:v4];

    id v10 = 0;
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v5 fromData:v2 error:&v10];
    id v7 = v10;
    if (!v6)
    {
      id v8 = GEOGetUserSessionLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "found stored nav session data but couldn't read it (%@)", buf, 0xCu);
      }

      _setValue(GeoUserSessionConfig_NavigationSessionInfo, (uint64_t)off_1E9110808, 0, 0, 0);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_setPersistedNavSessionData:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v6];
  id v4 = v6;
  if (v3)
  {
    _setValue(GeoUserSessionConfig_NavigationSessionInfo, (uint64_t)off_1E9110808, v3, 1, 0);
  }
  else
  {
    id v5 = GEOGetUserSessionLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "unable to serialize nav session data for archival (%@)", buf, 0xCu);
    }
  }
}

@end