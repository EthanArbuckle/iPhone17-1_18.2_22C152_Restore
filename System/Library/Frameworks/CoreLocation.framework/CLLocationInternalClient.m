@interface CLLocationInternalClient
+ (id)sharedServiceClient;
- (BOOL)checkAndExerciseAuthorizationForBundleID:(id)a3 orBundlePath:(id)a4 services:(unint64_t)a5 error:(id *)a6;
- (BOOL)deleteInterestZoneWithId:(id)a3 registeredForBundleId:(id)a4 orBundlePath:(id)a5 error:(id *)a6;
- (BOOL)registerCircularInterestZoneWithId:(id)a3 latitude:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundleId:(id)a9 orBundlePath:(id)a10 error:(id *)a11;
- (BOOL)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundleId:(id)a7 orBundlePath:(id)a8 error:(id *)a9;
- (BOOL)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundleId:(id)a5 orBundlePath:(id)a6 error:(id *)a7;
- (BOOL)startStopAdvertisingBeacon:(id)a3 power:(id)a4;
- (__CFArray)copyActivityAlarms;
- (__CFArray)copyGnssBandsInUse;
- (__CFArray)copyTechnologiesInUse;
- (__CFDictionary)copyActiveClientsUsingLocation;
- (__CFDictionary)copyAppsUsingLocation;
- (__CFDictionary)copyInternalState;
- (__CFDictionary)copyMonitoredRegionsForBundleIdentifier:(__CFString *)a3 orBundlePath:(__CFString *)a4;
- (__CFDictionary)copyNearbyAssetSettings;
- (__CFDictionary)copyNearbyAssetSettingsOfAccessoryFile:(__CFString *)a3;
- (__CFDictionary)copyRoutineAssetSettingsWithCompatibilityVersion:(int *)a3 contentVersion:(int *)a4;
- (__CFDictionary)copyZaxisStats;
- (__CFString)copyMicroLocationInternalVersion;
- (double)modifyOrSetAuthorizationTime:(double)a3 forBundleID:(id)a4 orBundlePath:(id)a5;
- (id)applyArchivedAuthorizationDecisions:(id)a3;
- (id)connection;
- (id)getAccessoryMotionSensorLogs;
- (id)getArchivedAuthorizationDecisionsWithError:(id *)a3;
- (id)getEEDCloakingKey:(id *)a3;
- (id)getEEDEmergencyContactNames:(id *)a3;
- (id)getMotionSensorLogs;
- (id)getOdometryBatchedLocations;
- (id)getPipelinedCache;
- (id)getTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 error:(id *)a5;
- (id)setAuthorizationPromptMapDisplayEnabled:(unsigned __int8)a3;
- (id)setTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 statusData:(id)a5;
- (id)synchronousRemoteObject;
- (id)timeZoneAtLocation:(id)a3;
- (id)triggerExpiredAuthorizationPurgeOnClientManager;
- (int)getAccessoryPASCDTransmissionState;
- (int)getAccessoryTypeBitSet;
- (int)getStatusBarIconState;
- (unsigned)clearLocationAuthorizations;
- (unsigned)configure:(id)a3;
- (unsigned)copyLastLog;
- (unsigned)deleteCurrentEmergencyLocationAsset;
- (unsigned)displayStatistics;
- (unsigned)dumpLogs:(__CFString *)a3;
- (unsigned)getAuthorizationPromptMapDisplayEnabled:(char *)a3;
- (unsigned)getAuthorizationStatus:(int *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5;
- (unsigned)getAuthorizationStatusForApp:(int *)a3 withAuditToken:(id *)a4;
- (unsigned)getControlPlaneStatusReportClear:(int)a3 startTime:(double *)a4 endTime:(double *)a5 latitude:(double *)a6 longitude:(double *)a7 altitude:(double *)a8 accuracy:(double *)a9 status:(unsigned int *)a10;
- (unsigned)getEmergencyLocationSettingsCompatibilityVersion:(int *)a3 andContentVersion:(int *)a4;
- (unsigned)getGestureServiceEnabled:(char *)a3;
- (unsigned)getGroundAltitudeForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4 location:(id)a5 groundAltitude:(id *)a6;
- (unsigned)getGyroCalibrationDatabaseBiasFit:(id *)a3 atTemperature:(float)a4;
- (unsigned)getGyroCalibrationDatabaseNumTemperatures:(int *)a3;
- (unsigned)getIncidentalUseMode:(int *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5;
- (unsigned)getLocationForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4 dynamicAccuracyReductionEnabled:(unsigned __int8)a5 allowsAlteredAccessoryLocations:(unsigned __int8)a6 location:(id *)a7;
- (unsigned)getLocationServicesEnabled:(char *)a3;
- (unsigned)getPrecisionPermission:(char *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5;
- (unsigned)getPrivateMode;
- (unsigned)getStatusBarIconEnabled:(BOOL *)a3 forEntityClass:(unsigned int)a4;
- (unsigned)gyroCalibrationDatabaseSupportsMiniCalibration:(int *)a3;
- (unsigned)gyroCalibrationDatabaseWipe;
- (unsigned)insertGyroCalibrationDatabaseBiasEstimateIfValid:(id)a3 temperature:(float)a4 variance:(id)a5 timestamp:(double)a6;
- (unsigned)performMigration;
- (unsigned)pingDaemon;
- (unsigned)reportLocationUtilityEvent:(int)a3 atDate:(__CFDate *)a4;
- (unsigned)setAuthorizationStatus:(unsigned __int8)a3 withCorrectiveCompensation:(int)a4 forBundleID:(__CFString *)a5 orBundlePath:(__CFString *)a6;
- (unsigned)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 andZoneIdentifier:(__CFString *)a5 andSubIdentityIdentifier:(__CFString *)a6 forBundleID:(__CFString *)a7 orBundlePath:(__CFString *)a8;
- (unsigned)setBackgroundIndicatorForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4 enabled:(unsigned __int8)a5;
- (unsigned)setIncidentalUseMode:(int)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5;
- (unsigned)setLocationButtonUseMode:(int)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5;
- (unsigned)setStatusBarIconEnabled:(BOOL)a3 forEntityClass:(unsigned int)a4;
- (unsigned)setTemporaryAuthorizationGranted:(unsigned __int8)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5 orAuditToken:(id *)a6 byLocationButton:(unsigned __int8)a7 voiceInteractionEnabled:(unsigned __int8)a8;
- (unsigned)setTemporaryPreciseAuthorizationGranted:(unsigned __int8)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5;
- (unsigned)shouldDisplayEEDUI;
- (unsigned)shutdownDaemon;
- (unsigned)tearDownLocationAuthPromptForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4;
- (unsigned)timeSyncMachTimeStamp:(unint64_t *)a3 oscarTimeStamp:(unint64_t *)a4;
- (unsigned)updatePillButtonChoiceForOutstandingPrompt:(int)a3;
- (unsigned)updatePromptedLatitude:(double)a3 longitude:(double)a4;
- (void)clearLocationAuthorizationForBundleId:(__CFString *)a3 orBundlePath:(__CFString *)a4;
- (void)getLocationDefaultForKey:(__CFString *)a3;
- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5;
- (void)notifyWeatherForecast:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 latitude:(double)a7 longitude:(double)a8;
- (void)setGestureServiceEnabled:(unsigned __int8)a3;
- (void)setLocationDefaultForKey:(__CFString *)a3 value:(void *)a4;
- (void)setLocationServicesEnabled:(unsigned __int8)a3;
- (void)setMapMatchingRouteHint:(id *)a3 count:(int)a4 routingType:(int)a5 stepType:(int)a6;
- (void)setPrivateMode:(unsigned __int8)a3;
- (void)setTrackRunHint:(id *)a3;
@end

@implementation CLLocationInternalClient

- (__CFArray)copyTechnologiesInUse
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1906C3250;
  v5[3] = &unk_1E5698020;
  v5[4] = &v6;
  [v2 getTechnologiesInUseWithReplyBlock:v5];
  v3 = (__CFArray *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundleId:(id)a5 orBundlePath:(id)a6 error:(id *)a7
{
  BOOL v11 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3052000000;
  v20 = sub_1907F55EC;
  v21 = sub_1907F55FC;
  uint64_t v22 = 0;
  id v12 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1906DDA84;
  v16[3] = &unk_1E5697FD0;
  v16[4] = &v17;
  v16[5] = &v23;
  [v12 setRelevance:v11 forInterestZoneWithId:a4 registeredForBundleId:a5 orBundlePath:a6 replyBlock:v16];
  id v13 = (id)v18[5];
  if (a7) {
    *a7 = (id)v18[5];
  }
  BOOL v14 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v14;
}

- (id)synchronousRemoteObject
{
  objc_sync_enter(self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F73050], "sharedInstance"), "intendToSyncServiceWithName:", @"CLInternalService");
  v3 = objc_msgSend(-[CLLocationInternalClient connection](self, "connection"), "synchronousRemoteObjectProxyWithErrorHandler:", &unk_1EE0065E0);
  objc_sync_exit(self);
  return v3;
}

- (id)connection
{
  objc_sync_enter(self);
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.locationd.synchronous" options:4096];
    self->_connection = v4;
    -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE041D68]);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:&unk_1EE0065C0];
    v5 = self->_connection;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1907F4C10;
    v7[3] = &unk_1E5696BF0;
    v7[4] = self;
    [(NSXPCConnection *)v5 setInvalidationHandler:v7];
    [(NSXPCConnection *)self->_connection resume];
    connection = self->_connection;
  }
  objc_sync_exit(self);
  return connection;
}

- (BOOL)deleteInterestZoneWithId:(id)a3 registeredForBundleId:(id)a4 orBundlePath:(id)a5 error:(id *)a6
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3052000000;
  v18 = sub_1907F55EC;
  uint64_t v19 = sub_1907F55FC;
  uint64_t v20 = 0;
  id v10 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1907F91BC;
  v14[3] = &unk_1E5697FD0;
  v14[4] = &v15;
  v14[5] = &v21;
  [v10 deleteInterestZoneWithId:a3 registeredForBundleId:a4 orBundlePath:a5 replyBlock:v14];
  id v11 = (id)v16[5];
  if (a6) {
    *a6 = (id)v16[5];
  }
  BOOL v12 = *((unsigned char *)v22 + 24) != 0;
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v12;
}

+ (id)sharedServiceClient
{
  if (qword_1EB272560 != -1) {
    dispatch_once(&qword_1EB272560, &unk_1EE005D20);
  }
  return (id)qword_1EB272568;
}

- (unsigned)getAuthorizationStatus:(int *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v8 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1906DD884;
  v10[3] = &unk_1E5697F80;
  v10[4] = &v11;
  v10[5] = a3;
  [v8 getAuthorizationStatusForBundleID:a4 orBundlePath:a5 replyBlock:v10];
  LOBYTE(a5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return a5;
}

- (unsigned)setAuthorizationStatus:(unsigned __int8)a3 withCorrectiveCompensation:(int)a4 forBundleID:(__CFString *)a5 orBundlePath:(__CFString *)a6
{
  uint64_t v8 = *(void *)&a4;
  int v9 = a3;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v10 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1907F5088;
  v12[3] = &unk_1E5697F58;
  v12[4] = &v13;
  [v10 setAuthorizationStatus:v9 != 0 withCorrectiveCompensation:v8 forBundleID:a5 orBundlePath:a6 replyBlock:v12];
  LOBYTE(a6) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return a6;
}

- (unsigned)getIncidentalUseMode:(int *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v8 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1907F517C;
  v10[3] = &unk_1E5697F80;
  v10[4] = &v11;
  v10[5] = a3;
  [v8 getIncidentalUseModeForBundleID:a4 orBundlePath:a5 replyBlock:v10];
  LOBYTE(a5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return a5;
}

- (unsigned)reportLocationUtilityEvent:(int)a3 atDate:(__CFDate *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v6 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1907F5278;
  v8[3] = &unk_1E5697F58;
  v8[4] = &v9;
  [v6 reportLocationUtilityEvent:v5 atDate:a4 withReplyBlock:v8];
  LOBYTE(a4) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a4;
}

- (void)clearLocationAuthorizationForBundleId:(__CFString *)a3 orBundlePath:(__CFString *)a4
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 0;
  id v6 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1907F535C;
  v7[3] = &unk_1E5697F58;
  v7[4] = v8;
  [v6 resetClientForBundleId:a3 orBundlePath:a4 withReplyBlock:v7];
  _Block_object_dispose(v8, 8);
}

- (unsigned)clearLocationAuthorizations
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907F5434;
  v5[3] = &unk_1E5697F58;
  v5[4] = &v6;
  [v2 resetAllClientsWithReplyBlock:v5];
  unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)getArchivedAuthorizationDecisionsWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = sub_1907F55EC;
  uint64_t v21 = sub_1907F55FC;
  uint64_t v22 = 0;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3052000000;
  char v14 = sub_1907F55EC;
  uint64_t v15 = sub_1907F55FC;
  uint64_t v16 = 0;
  id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1907F5608;
  v10[3] = &unk_1E5697FA8;
  v10[4] = &v11;
  v10[5] = &v17;
  [v4 getArchivedAuthorizationDecisionsWithReplyBlock:v10];
  id v5 = (id)v18[5];
  id v6 = (id)v12[5];
  if (!v18[5] && !v12[5])
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:1 userInfo:0];
    void v12[5] = v7;
  }
  if (a3) {
    *a3 = (id)v12[5];
  }
  uint64_t v8 = (void *)v18[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)applyArchivedAuthorizationDecisions:(id)a3
{
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = sub_1907F55EC;
  uint64_t v20 = sub_1907F55FC;
  uint64_t v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  int v6 = 3;
  do
  {
    id v7 = [(CLLocationInternalClient *)self synchronousRemoteObject];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1907F5808;
    v11[3] = &unk_1E5697FD0;
    v11[4] = &v16;
    v11[5] = &v12;
    [v7 applyArchivedAuthorizationDecisions:a3 withConfirmationToken:v5 replyBlock:v11];
    if (*((unsigned char *)v13 + 24))
    {
      uint64_t v8 = (void *)v17[5];
      goto LABEL_7;
    }
    --v6;
  }
  while (v6);
  uint64_t v8 = (void *)v17[5];
  if (!v8)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:1 userInfo:0];
    v17[5] = (uint64_t)v8;
  }
LABEL_7:
  id v9 = v8;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

- (__CFDictionary)copyAppsUsingLocation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = sub_1907F55EC;
  id v10 = sub_1907F55FC;
  uint64_t v11 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907F592C;
  v5[3] = &unk_1E5697FF8;
  v5[4] = &v6;
  [v2 getAppsUsingLocationWithReplyBlock:v5];
  unsigned __int8 v3 = (__CFDictionary *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (__CFDictionary)copyActiveClientsUsingLocation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = sub_1907F55EC;
  id v10 = sub_1907F55FC;
  uint64_t v11 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907F5A34;
  v5[3] = &unk_1E5697FF8;
  v5[4] = &v6;
  [v2 getActiveClientsUsingLocationWithReplyBlock:v5];
  unsigned __int8 v3 = (__CFDictionary *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (__CFDictionary)copyInternalState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = sub_1907F55EC;
  id v10 = sub_1907F55FC;
  uint64_t v11 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907F5B3C;
  v5[3] = &unk_1E5697FF8;
  v5[4] = &v6;
  [v2 getClientManagerInternalStateWithReplyBlock:v5];
  unsigned __int8 v3 = (__CFDictionary *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (__CFString)copyMicroLocationInternalVersion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907F5C24;
  v5[3] = &unk_1E5698048;
  v5[4] = &v6;
  [v2 getMicroLocationInternalVersionWithReplyBlock:v5];
  unsigned __int8 v3 = (__CFString *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (__CFDictionary)copyZaxisStats
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907F5D0C;
  v5[3] = &unk_1E5697FF8;
  v5[4] = &v6;
  [v2 getZaxisStatsWithReplyBlock:v5];
  unsigned __int8 v3 = (__CFDictionary *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (__CFArray)copyGnssBandsInUse
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907F5DF4;
  v5[3] = &unk_1E5698020;
  v5[4] = &v6;
  [v2 getGnssBandsInUseWithReplyBlock:v5];
  unsigned __int8 v3 = (__CFArray *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setLocationDefaultForKey:(__CFString *)a3 value:(void *)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4) {
      [MEMORY[0x1E4F28F98] dataWithPropertyList:a4 format:200 options:0 error:0];
    }
    id v6 = [(CLLocationInternalClient *)self synchronousRemoteObject];
    MEMORY[0x1F4181798](v6, sel_setLocationDefaultForKey_andValue_replyBlock_);
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    uint64_t v5 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_FAULT, "#Spi, Key is NULL!", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
      }
      id v7 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationInternalClient setLocationDefaultForKey:value:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)getLocationDefaultForKey:(__CFString *)a3
{
  unsigned __int8 v3 = a3;
  if (a3)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3052000000;
    uint64_t v11 = sub_1907F55EC;
    uint64_t v12 = sub_1907F55FC;
    uint64_t v13 = 0;
    id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1907F62E4;
    v7[3] = &unk_1E5698070;
    v7[4] = &v8;
    [v4 getLocationDefaultForKey:v3 replyBlock:v7];
    uint64_t v5 = v9[5];
    if (v5)
    {
      unsigned __int8 v3 = (__CFString *)[MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:0];
    }
    else
    {
      unsigned __int8 v3 = 0;
    }
    _Block_object_dispose(&v8, 8);
  }
  return v3;
}

- (id)timeZoneAtLocation:(id)a3
{
  if (!a3)
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "-[CLLocationInternalClient timeZoneAtLocation:]"), @"LocationInternal.m", 642, @"Invalid parameter not satisfying: %@", @"nil != location" file lineNumber description];
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = sub_1907F55EC;
  char v15 = sub_1907F55FC;
  uint64_t v16 = 0;
  id v5 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  if (a3) {
    [a3 clientLocation];
  }
  else {
    memset(v10, 0, 156);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1907F6588;
  v9[3] = &unk_1E5698048;
  v9[4] = &v11;
  [v5 timeZoneForLocation:v10 replyBlock:v9];
  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)setPrivateMode:(unsigned __int8)a3
{
  id v3 = [(CLLocationInternalClient *)self synchronousRemoteObject];

  MEMORY[0x1F4181798](v3, sel_setPrivateMode_replyBlock_);
}

- (unsigned)getPrivateMode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907F6868;
  v5[3] = &unk_1E5698098;
  v5[4] = &v6;
  [v2 getPrivateMode:v5];
  unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)pingDaemon
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907F6940;
  v5[3] = &unk_1E5697F58;
  v5[4] = &v6;
  [v2 pingDaemonWithReplyBlock:v5];
  unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setLocationServicesEnabled:(unsigned __int8)a3
{
  objc_msgSend(-[CLLocationInternalClient synchronousRemoteObject](self, "synchronousRemoteObject"), "setLocationServicesEnabled:replyBlock:", a3 != 0, &unk_1EE002E00);
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];

  CFPreferencesSynchronize(@"com.apple.locationd", v3, v4);
}

- (unsigned)getLocationServicesEnabled:(char *)a3
{
  CFStringRef v3 = a3;
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1907F6C14;
    v6[3] = &unk_1E5697F80;
    v6[4] = &v7;
    v6[5] = v3;
    [v4 getLocationServicesEnabledWithReplyBlock:v6];
    LOBYTE(v3) = *((unsigned char *)v8 + 24);
    _Block_object_dispose(&v7, 8);
  }
  return v3;
}

- (id)setAuthorizationPromptMapDisplayEnabled:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = sub_1907F55EC;
  uint64_t v12 = sub_1907F55FC;
  uint64_t v13 = 0;
  id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1907F6D38;
  v7[3] = &unk_1E5697F58;
  v7[4] = &v8;
  [v4 setAuthorizationPromptMapDisplayEnabled:v3 != 0 replyBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unsigned)getAuthorizationPromptMapDisplayEnabled:(char *)a3
{
  int v3 = a3;
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1907F6FAC;
    v6[3] = &unk_1E56980C0;
    v6[4] = &v7;
    v6[5] = v3;
    [v4 getAuthorizationPromptMapDisplayEnabledWithReplyBlock:v6];
    LOBYTE(v3) = *((unsigned char *)v8 + 24);
    _Block_object_dispose(&v7, 8);
  }
  return v3;
}

- (id)setTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 statusData:(id)a5
{
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = sub_1907F55EC;
  uint64_t v18 = sub_1907F55FC;
  uint64_t v19 = 0;
  if (!a5)
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "-[CLLocationInternalClient setTemporaryAuthorizationStatusForBundleId:orBundlePath:statusData:]"), @"LocationInternal.m", 765, @"Invalid parameter not satisfying: %@", @"data != nil" file lineNumber description];
  }
  id v9 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1907F7148;
  v13[3] = &unk_1E5697F58;
  v13[4] = &v14;
  [v9 setTemporaryAuthorizationStatusForBundleId:a3 orBundlePath:a4 statusData:a5 replyBlock:v13];
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v10;
}

- (id)getTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 error:(id *)a5
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  char v15 = sub_1907F55EC;
  uint64_t v16 = sub_1907F55FC;
  uint64_t v17 = 0;
  id v8 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1907F73FC;
  v11[3] = &unk_1E56980E8;
  v11[4] = &v12;
  v11[5] = a5;
  [v8 getTemporaryAuthorizationStatusForBundleId:a3 orBundlePath:a4 replyBlock:v11];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (double)modifyOrSetAuthorizationTime:(double)a3 forBundleID:(id)a4 orBundlePath:(id)a5
{
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  unint64_t v15 = 0xBFF0000000000000;
  id v8 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1907F76B0;
  v11[3] = &unk_1E5698110;
  v11[4] = &v12;
  [v8 modifyOrSetAuthorizationTime:a4 forBundleID:a5 orBundlePath:v11 replyBlock:a3];
  double v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)triggerExpiredAuthorizationPurgeOnClientManager
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  double v9 = sub_1907F55EC;
  id v10 = sub_1907F55FC;
  uint64_t v11 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907F7944;
  v5[3] = &unk_1E5697F58;
  v5[4] = &v6;
  [v2 triggerExpiredAuthorizationPurgeWithReplyBlock:v5];
  int v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setGestureServiceEnabled:(unsigned __int8)a3
{
  id v3 = [(CLLocationInternalClient *)self synchronousRemoteObject];

  MEMORY[0x1F4181798](v3, sel_setGestureServiceEnabled_replyBlock_);
}

- (unsigned)getGestureServiceEnabled:(char *)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1907F7D84;
    v6[3] = &unk_1E56980C0;
    v6[4] = &v7;
    v6[5] = v3;
    [v4 getGestureServiceEnabledWithReplyBlock:v6];
    LOBYTE(v3) = *((unsigned char *)v8 + 24);
    _Block_object_dispose(&v7, 8);
  }
  return v3;
}

- (unsigned)getAuthorizationStatusForApp:(int *)a3 withAuditToken:(id *)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v6 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1907F7E84;
  v10[3] = &unk_1E5697F80;
  v10[4] = &v11;
  v10[5] = a3;
  long long v7 = *(_OWORD *)&a4->var0[4];
  v9[0] = *(_OWORD *)a4->var0;
  v9[1] = v7;
  [v6 getAuthorizationStatusForAppWithAuditToken:v9 replyBlock:v10];
  LOBYTE(a4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return a4;
}

- (unsigned)getPrecisionPermission:(char *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = sub_1907F55EC;
  uint64_t v22 = sub_1907F55FC;
  uint64_t v23 = 0;
  id v8 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1907F816C;
  v17[3] = &unk_1E5698138;
  v17[5] = &v18;
  v17[6] = a3;
  v17[4] = &v24;
  [v8 getPrecisionPermissionForBundleID:a4 orBundlePath:a5 replyBlock:v17];
  uint64_t v9 = v19;
  if (v19[5])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    char v10 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = v19[5];
      uint64_t buf = 68289282;
      __int16 v29 = 2082;
      v30 = "";
      __int16 v31 = 2114;
      uint64_t v32 = v11;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, CLInternalGetPrecisionPermission failed\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
      }
    }
    uint64_t v12 = qword_1EB2713E0;
    BOOL v13 = os_signpost_enabled((os_log_t)qword_1EB2713E0);
    uint64_t v9 = v19;
    if (v13)
    {
      uint64_t v14 = v19[5];
      uint64_t buf = 68289282;
      __int16 v29 = 2082;
      v30 = "";
      __int16 v31 = 2114;
      uint64_t v32 = v14;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, CLInternalGetPrecisionPermission failed", "{\"msg%{public}.0s\":\"#Spi, CLInternalGetPrecisionPermission failed\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      uint64_t v9 = v19;
    }
  }

  unsigned __int8 v15 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v15;
}

- (unsigned)performMigration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1907F83F0;
  v7[3] = &unk_1E5697F58;
  v7[4] = &v8;
  [v2 performMigrationWithReplyBlock:v7];
  if (!*((unsigned char *)v9 + 24))
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    id v3 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_FAULT, "#Spi, _CLInternalPerformMigration failed", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
      }
      id v6 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationInternalClient performMigration]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  unsigned __int8 v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (unsigned)shutdownDaemon
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1907F863C;
  v7[3] = &unk_1E5697F58;
  v7[4] = &v8;
  [v2 shutdownDaemonWithReplyBlock:v7];
  if (!*((unsigned char *)v9 + 24))
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    id v3 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_FAULT, "#Spi, _CLShutdownDaemon failed", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
      }
      id v6 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationInternalClient shutdownDaemon]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  unsigned __int8 v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (unsigned)displayStatistics
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1907F8884;
  v7[3] = &unk_1E5697F58;
  v7[4] = &v8;
  [v2 displayStatisticsWithReplyBlock:v7];
  if (!*((unsigned char *)v9 + 24))
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    id v3 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_FAULT, "#Spi, _CLDisplayStatistics failed", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
      }
      id v6 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationInternalClient displayStatistics]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  unsigned __int8 v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (unsigned)dumpLogs:(__CFString *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = sub_1907F8AD8;
  v9[3] = &unk_1E5697F58;
  v9[4] = &v10;
  [v4 dumpLogsWithDescription:a3 replyBlock:v9];
  if (!*((unsigned char *)v11 + 24))
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    id v5 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_FAULT, "#Spi, _CLDumpLogs failed", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
      }
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationInternalClient dumpLogs:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
  unsigned __int8 v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (__CFDictionary)copyMonitoredRegionsForBundleIdentifier:(__CFString *)a3 orBundlePath:(__CFString *)a4
{
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v6 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = sub_1907F8BC8;
  v9[3] = &unk_1E5697FF8;
  v9[4] = &v10;
  [v6 getMonitoredRegionsForBundleID:a3 orBundlePath:a4 replyBlock:v9];
  long long v7 = (__CFDictionary *)v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)checkAndExerciseAuthorizationForBundleID:(id)a3 orBundlePath:(id)a4 services:(unint64_t)a5 error:(id *)a6
{
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = sub_1907F55EC;
  uint64_t v24 = sub_1907F55FC;
  uint64_t v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v10 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1907F8DB4;
  v15[3] = &unk_1E5698160;
  v15[4] = &v20;
  v15[5] = &v26;
  v15[6] = &v16;
  [v10 checkAndExerciseAuthorizationForBundleID:a3 orBundlePath:a4 services:a5 replyBlock:v15];
  id v11 = (id)v21[5];
  if (!*((unsigned char *)v17 + 24))
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4097 userInfo:0];
    v21[5] = v12;
  }
  if (a6) {
    *a6 = (id)v21[5];
  }
  char v13 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v13;
}

- (BOOL)registerCircularInterestZoneWithId:(id)a3 latitude:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundleId:(id)a9 orBundlePath:(id)a10 error:(id *)a11
{
  uint64_t v14 = *(void *)&a8;
  uint64_t v15 = *(void *)&a7;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000;
  uint64_t v28 = sub_1907F55EC;
  char v29 = sub_1907F55FC;
  uint64_t v30 = 0;
  id v20 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1907F8FA8;
  v24[3] = &unk_1E5697FD0;
  v24[4] = &v25;
  v24[5] = &v31;
  [v20 registerCircularInterestZoneWithId:a3 latitude:v15 longitude:v14 radius:a9 serviceMaskOperator:a10 provenanceType:v24 forBundleId:a4 orBundlePath:a5 replyBlock:a6];
  id v21 = (id)v26[5];
  if (a11) {
    *a11 = (id)v26[5];
  }
  BOOL v22 = *((unsigned char *)v32 + 24) != 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  return v22;
}

- (BOOL)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundleId:(id)a7 orBundlePath:(id)a8 error:(id *)a9
{
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  uint64_t v13 = *(void *)&a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = sub_1907F55EC;
  uint64_t v24 = sub_1907F55FC;
  uint64_t v25 = 0;
  id v15 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1907F9174;
  v19[3] = &unk_1E5697FD0;
  v19[4] = &v20;
  v19[5] = &v26;
  [v15 registerPhenolicInterestZoneWithId:a3 phenolicLocation:v13 serviceMaskOperator:v12 provenanceType:v11 forBundleId:a7 orBundlePath:a8 replyBlock:v19];
  id v16 = (id)v21[5];
  if (a9) {
    *a9 = (id)v21[5];
  }
  BOOL v17 = *((unsigned char *)v27 + 24) != 0;
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v17;
}

- (unsigned)getLocationForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4 dynamicAccuracyReductionEnabled:(unsigned __int8)a5 allowsAlteredAccessoryLocations:(unsigned __int8)a6 location:(id *)a7
{
  if (!a7) {
    return 0;
  }
  int v8 = a6;
  int v9 = a5;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v12 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1907F930C;
  v15[3] = &unk_1E56980E8;
  v15[4] = &v16;
  v15[5] = a7;
  [v12 getLocationForBundleID:a3 orBundlePath:a4 dynamicAccuracyReductionEnabled:v9 != 0 allowsAlteredAccessoryLocations:v8 != 0 replyBlock:v15];
  unsigned __int8 v13 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v13;
}

- (unsigned)getGroundAltitudeForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4 location:(id)a5 groundAltitude:(id *)a6
{
  unsigned __int8 v6 = 0;
  if (a5 && a6)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    id v11 = [(CLLocationInternalClient *)self synchronousRemoteObject];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1907F9454;
    v13[3] = &unk_1E5698188;
    v13[4] = &v14;
    void v13[5] = a6;
    [v11 getGroundAltitudeForBundleID:a3 orBundlePath:a4 location:a5 replyBlock:v13];
    unsigned __int8 v6 = *((unsigned char *)v15 + 24);
    _Block_object_dispose(&v14, 8);
  }
  return v6;
}

- (void)setMapMatchingRouteHint:(id *)a3 count:(int)a4 routingType:(int)a5 stepType:(int)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a4 < 501)
  {
    uint64_t v9 = *(void *)&a6;
    uint64_t v10 = *(void *)&a5;
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    unsigned __int8 v13 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 67240704;
      int v16 = a4;
      __int16 v17 = 1026;
      int v18 = v10;
      __int16 v19 = 1026;
      int v20 = v9;
      _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEBUG, "#Spi,RouteHint,LocationInternal,Received route hint road segments,%{public}d,routeType,%{public}d,stepType,%{public}d", buf, 0x14u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
      }
      uint64_t v14 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationInternalClient setMapMatchingRouteHint:count:routingType:stepType:]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    objc_msgSend(-[CLLocationInternalClient synchronousRemoteObject](self, "synchronousRemoteObject"), "setMapMatchingRouteHint:routingType:stepType:replyBlock:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", a3, 40 * a4), v10, v9, &unk_1EE006640);
  }
  else
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    long long v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 67240448;
      int v16 = a4;
      __int16 v17 = 1026;
      int v18 = 500;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_ERROR, "#Spi,RouteHintError, Exceeded max number of route hint road segments (%{public}d > %{public}d)", buf, 0xEu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
      }
      int v8 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationInternalClient setMapMatchingRouteHint:count:routingType:stepType:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)setTrackRunHint:(id *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
  }
  id v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_INFO, "#Spi,CLTR,CLTrackRunHint received,framework side", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    unsigned __int8 v6 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationInternalClient setTrackRunHint:]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  objc_msgSend(-[CLLocationInternalClient synchronousRemoteObject](self, "synchronousRemoteObject"), "setTrackRunHint:replyBlock:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", a3, 16), &unk_1EE002E20);
}

- (int)getAccessoryTypeBitSet
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = sub_1907F9F44;
  v9[3] = &unk_1E56981B0;
  v9[4] = &v10;
  [v2 getAccessoryTypeBitSetWithReplyBlock:v9];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
  }
  id v3 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
  {
    int v4 = *((_DWORD *)v11 + 6);
    *(_DWORD *)uint64_t buf = 67109120;
    int v17 = v4;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEBUG, "#Spi,getAccessoryTypeBitSet,%d", buf, 8u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    int v7 = *((_DWORD *)v11 + 6);
    int v14 = 67109120;
    int v15 = v7;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationInternalClient getAccessoryTypeBitSet]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  int v5 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (int)getAccessoryPASCDTransmissionState
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 4;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = sub_1907FA340;
  v9[3] = &unk_1E56981B0;
  v9[4] = &v10;
  [v2 getAccessoryPASCDTransmissionStateWithReplyBlock:v9];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
  }
  id v3 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
  {
    int v4 = *((_DWORD *)v11 + 6);
    *(_DWORD *)uint64_t buf = 67109120;
    int v17 = v4;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEBUG, "#Spi,getAccessoryPASCDTransmissionState,%d", buf, 8u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    int v7 = *((_DWORD *)v11 + 6);
    int v14 = 67109120;
    int v15 = v7;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationInternalClient getAccessoryPASCDTransmissionState]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  int v5 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)getOdometryBatchedLocations
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3052000000;
  int v13 = sub_1907F55EC;
  int v14 = sub_1907F55FC;
  uint64_t v15 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = sub_1907FA77C;
  v9[3] = &unk_1E5697FF8;
  v9[4] = &v10;
  [v2 getOdometryBatchedLocationsWithReplyBlock:v9];
  if (v11[5])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    id v3 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = [(id)v11[5] count];
      *(_DWORD *)uint64_t buf = 134349056;
      uint64_t v19 = v4;
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEBUG, "#Spi,getOdometryBatchedLocations,returned with count,%{public}lu", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
      }
      uint64_t v7 = [(id)v11[5] count];
      int v16 = 134349056;
      uint64_t v17 = v7;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationInternalClient getOdometryBatchedLocations]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
  int v5 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (unsigned)copyLastLog
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1907FACB0;
  v7[3] = &unk_1E5697F58;
  v7[4] = &v8;
  [v2 copyLastLogWithReplyBlock:v7];
  if (!*((unsigned char *)v9 + 24))
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    id v3 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_FAULT, "#Spi, _CLCopyLastLog failed", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
      }
      unsigned __int8 v6 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationInternalClient copyLastLog]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  unsigned __int8 v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (unsigned)setStatusBarIconEnabled:(BOOL)a3 forEntityClass:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v6 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1907FAF10;
  v11[3] = &unk_1E5697F58;
  v11[4] = &v12;
  [v6 setStatusBarIconEnabledForEntityClass:v4 enabled:v5 replyBlock:v11];
  if (!*((unsigned char *)v13 + 24))
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
    }
    uint64_t v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2050;
      uint64_t v21 = (int)v4;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, Setting status bar enabled for entity class failed\", \"entityClass\":%{public, location:CLLocationDictionaryUtilitiesEntityClass}lld}", buf, 0x1Cu);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
      }
    }
    uint64_t v8 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2050;
      uint64_t v21 = (int)v4;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, Setting status bar enabled for entity class failed", "{\"msg%{public}.0s\":\"#Spi, Setting status bar enabled for entity class failed\", \"entityClass\":%{public, location:CLLocationDictionaryUtilitiesEntityClass}lld}", buf, 0x1Cu);
    }
  }
  unsigned __int8 v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (unsigned)getStatusBarIconEnabled:(BOOL *)a3 forEntityClass:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v6 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1907FB000;
  void v8[3] = &unk_1E56981D8;
  v8[4] = &v10;
  void v8[5] = a3;
  int v9 = v4;
  [v6 getStatusBarIconEnabledForEntityClass:v4 replyBlock:v8];
  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (int)getStatusBarIconState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907FB270;
  v5[3] = &unk_1E56981B0;
  v5[4] = &v6;
  [v2 getStatusBarIconState:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)getPipelinedCache
{
  unint64_t v3 = 0;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3052000000;
  char v13 = sub_1907F55EC;
  uint64_t v14 = sub_1907F55FC;
  uint64_t v15 = 0;
  do
  {
    id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _OWORD v9[2] = sub_1907FB3AC;
    v9[3] = &unk_1E5698020;
    v9[4] = &v10;
    [v4 getPipelinedCacheWithReply:v9];
    BOOL v5 = (void *)v11[5];
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v3 >= 9;
    }
    ++v3;
  }
  while (!v6);
  id v7 = v5;
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (unsigned)getGyroCalibrationDatabaseBiasFit:(id *)a3 atTemperature:(float)a4
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v6 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1907FB4C4;
  void v8[3] = &unk_1E56980E8;
  v8[4] = &v9;
  void v8[5] = a3;
  [v6 getGyroCalibrationDatabaseBiasFitAtTemperature:v8 withReply:COERCE_DOUBLE((unint64_t)LODWORD(a4))];
  LOBYTE(a3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a3;
}

- (BOOL)startStopAdvertisingBeacon:(id)a3 power:(id)a4
{
  if (a4) {
    uint64_t v6 = [a4 intValue];
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v7 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1907FB610;
  v10[3] = &unk_1E5697F58;
  v10[4] = &v11;
  [v7 startStopAdvertisingBeacon:a3 atPower:v6 replyBlock:v10];
  BOOL v8 = *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (unsigned)insertGyroCalibrationDatabaseBiasEstimateIfValid:(id)a3 temperature:(float)a4 variance:(id)a5 timestamp:(double)a6
{
  float var2 = a5.var2;
  float var1 = a5.var1;
  float var0 = a5.var0;
  float v11 = a3.var2;
  float v12 = a3.var1;
  float v13 = a3.var0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  id v14 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1907FB748;
  v23[3] = &unk_1E5697F58;
  v23[4] = &v24;
  *(float *)&double v15 = v12;
  *(float *)&double v16 = v11;
  *(float *)&double v17 = a4;
  *(float *)&double v18 = var0;
  *(float *)&double v19 = var1;
  *(float *)&double v20 = var2;
  objc_msgSend(v14, "insertGyroCalibrationDatabaseBiasEstimateIfValid:temperature:variance:timestamp:replyBlock:", v23, COERCE_DOUBLE((unint64_t)LODWORD(v13)), v15, v16, v17, v18, v19, v20, a6);
  unsigned __int8 v21 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  return v21;
}

- (unsigned)gyroCalibrationDatabaseWipe
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907FB820;
  v5[3] = &unk_1E5697F58;
  v5[4] = &v6;
  [v2 gyroCalibrationDatabaseWipeWithReplyBlock:v5];
  unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)getGyroCalibrationDatabaseNumTemperatures:(int *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1907FB8FC;
  v6[3] = &unk_1E5697F80;
  v6[4] = &v7;
  v6[5] = a3;
  [v4 gyroCalibrationDatabaseGetNumTemperaturesWithReplyBlock:v6];
  LOBYTE(a3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return a3;
}

- (unsigned)configure:(id)a3
{
  uint64_t v3 = *(void *)&a3.var7;
  uint64_t v4 = *(void *)&a3.var0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1907FB9F8;
  v7[3] = &unk_1E5697F58;
  v7[4] = &v8;
  objc_msgSend(v5, "configure:replyBlock:", v4, v3, v7);
  LOBYTE(v3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

- (unsigned)getControlPlaneStatusReportClear:(int)a3 startTime:(double *)a4 endTime:(double *)a5 latitude:(double *)a6 longitude:(double *)a7 altitude:(double *)a8 accuracy:(double *)a9 status:(unsigned int *)a10
{
  unsigned __int8 v10 = 0;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a7 && a6 && a4 && a5 && a10)
  {
    uint64_t v15 = *(void *)&a3;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3052000000;
    uint64_t v30 = sub_1907F55EC;
    uint64_t v31 = sub_1907F55FC;
    uint64_t v32 = 0;
    id v17 = [(CLLocationInternalClient *)self synchronousRemoteObject];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1907FBD78;
    v26[3] = &unk_1E5698200;
    v26[6] = a5;
    v26[7] = a6;
    v26[8] = a7;
    v26[9] = a8;
    v26[10] = a9;
    v26[11] = a10;
    v26[4] = &v27;
    v26[5] = a4;
    [v17 getControlPlaneStatusReportClear:v15 replyBlock:v26];
    while (1)
    {
      double v18 = (void *)v28[5];
      if (!v18)
      {
        unsigned __int8 v10 = 1;
        goto LABEL_21;
      }
      if ([v18 code] != 1) {
        break;
      }
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
      }
      double v19 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl(&dword_1906B8000, v19, OS_LOG_TYPE_DEBUG, "#Spi, Blocking Mig routine deferred on Daemon side... waiting and retrying", buf, 2u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE006660);
        }
        __int16 v25 = 0;
        unsigned __int8 v21 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationInternalClient getControlPlaneStatusReportClear:startTime:endTime:latitude:longitude:altitude:accuracy:status:]", "CoreLocation: %s\n", v21);
        if (v21 != (char *)buf) {
          free(v21);
        }
      }
      sleep(1u);
      id v20 = [(CLLocationInternalClient *)self synchronousRemoteObject];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = sub_1907FBDB4;
      v24[3] = &unk_1E5698200;
      void v24[6] = a5;
      v24[7] = a6;
      v24[8] = a7;
      v24[9] = a8;
      v24[10] = a9;
      v24[11] = a10;
      v24[4] = &v27;
      v24[5] = a4;
      [v20 getControlPlaneStatusReportClear:v15 replyBlock:v24];
    }
    unsigned __int8 v10 = v28[5] == 0;
LABEL_21:
    _Block_object_dispose(&v27, 8);
  }
  return v10;
}

- (unsigned)getEmergencyLocationSettingsCompatibilityVersion:(int *)a3 andContentVersion:(int *)a4
{
  unsigned __int8 v4 = 0;
  if (a3 && a4)
  {
    uint64_t v10 = 0;
    char v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    id v7 = [(CLLocationInternalClient *)self synchronousRemoteObject];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _OWORD v9[2] = sub_1907FBED0;
    v9[3] = &unk_1E5698228;
    void v9[5] = a3;
    v9[6] = a4;
    v9[4] = &v10;
    [v7 getEmergencyLocationSettingsVersion:v9];
    unsigned __int8 v4 = *((unsigned char *)v11 + 24);
    _Block_object_dispose(&v10, 8);
  }
  return v4;
}

- (unsigned)deleteCurrentEmergencyLocationAsset
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907FBFB4;
  v5[3] = &unk_1E5697F58;
  v5[4] = &v6;
  [v2 deleteCurrentEmergencyLocationAsset:v5];
  unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (__CFDictionary)copyNearbyAssetSettings
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = sub_1907F55EC;
  uint64_t v10 = sub_1907F55FC;
  uint64_t v11 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907FC0B0;
  v5[3] = &unk_1E5698250;
  v5[4] = &v6;
  [v2 copyNearbyAssetSettings:v5];
  unsigned __int8 v3 = (__CFDictionary *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (__CFDictionary)copyNearbyAssetSettingsOfAccessoryFile:(__CFString *)a3
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = sub_1907F55EC;
  uint64_t v12 = sub_1907F55FC;
  uint64_t v13 = 0;
  id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1907FC1D4;
  v7[3] = &unk_1E5698250;
  v7[4] = &v8;
  [v4 copyNearbyAssetSettingsOfAccessoryFile:a3 withReply:v7];
  id v5 = (__CFDictionary *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (__CFDictionary)copyRoutineAssetSettingsWithCompatibilityVersion:(int *)a3 contentVersion:(int *)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = sub_1907F55EC;
  id v14 = sub_1907F55FC;
  uint64_t v15 = 0;
  id v6 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = sub_1907FC304;
  v9[3] = &unk_1E5698278;
  v9[4] = &v10;
  void v9[5] = a3;
  v9[6] = a4;
  [v6 copyRoutineAssetSettings:v9];
  id v7 = (__CFDictionary *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (unsigned)shouldDisplayEEDUI
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907FC420;
  v5[3] = &unk_1E56982A0;
  v5[4] = &v6;
  [v2 shouldDisplayEEDUI:v5];
  unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)getEEDCloakingKey:(id *)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = sub_1907F55EC;
  uint64_t v13 = sub_1907F55FC;
  uint64_t v14 = 0;
  id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1907FC528;
  void v8[3] = &unk_1E56980E8;
  v8[4] = &v9;
  void v8[5] = a3;
  [v4 getEEDCloakingKeyWithReply:v8];
  id v5 = *a3;
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)getEEDEmergencyContactNames:(id *)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = sub_1907F55EC;
  uint64_t v13 = sub_1907F55FC;
  uint64_t v14 = 0;
  id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1907FC664;
  void v8[3] = &unk_1E56982C8;
  v8[4] = &v9;
  void v8[5] = a3;
  [v4 getEEDEmergencyContactNamesWithReply:v8];
  id v5 = *a3;
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)getMotionSensorLogs
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = sub_1907F55EC;
  uint64_t v12 = sub_1907F55FC;
  uint64_t v13 = 0;
  while (1)
  {
    unsigned __int8 v3 = (void *)v9[5];
    if (v3) {
      break;
    }
    id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1907FC7C0;
    v7[3] = &unk_1E56982F0;
    v7[4] = &v8;
    [v4 getMotionSensorLogsWithReply:v7];
  }
  id v5 = v3;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)getAccessoryMotionSensorLogs
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = sub_1907F55EC;
  uint64_t v12 = sub_1907F55FC;
  uint64_t v13 = 0;
  while (1)
  {
    unsigned __int8 v3 = (void *)v9[5];
    if (v3) {
      break;
    }
    id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1907FC908;
    v7[3] = &unk_1E56982F0;
    v7[4] = &v8;
    [v4 getAccessoryMotionSensorLogsWithReply:v7];
  }
  id v5 = v3;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unsigned)setTemporaryAuthorizationGranted:(unsigned __int8)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5 orAuditToken:(id *)a6 byLocationButton:(unsigned __int8)a7 voiceInteractionEnabled:(unsigned __int8)a8
{
  int v8 = a8;
  int v9 = a7;
  int v13 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v14 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1907FCA54;
  v18[3] = &unk_1E5697F58;
  v18[4] = &v19;
  long long v15 = *(_OWORD *)&a6->var0[4];
  v17[0] = *(_OWORD *)a6->var0;
  v17[1] = v15;
  [v14 setTemporaryAuthorizationGranted:v13 != 0 forBundleID:a4 orBundlePath:a5 orAuditToken:v17 byLocationButton:v9 != 0 voiceInteractionEnabled:v8 != 0 replyBlock:v18];
  LOBYTE(a5) = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return a5;
}

- (unsigned)setTemporaryPreciseAuthorizationGranted:(unsigned __int8)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  int v7 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v8 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1907FCB50;
  v10[3] = &unk_1E5697F58;
  v10[4] = &v11;
  [v8 setTemporaryPreciseAuthorizationGranted:v7 != 0 forBundleID:a4 orBundlePath:a5 replyBlock:v10];
  LOBYTE(a5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return a5;
}

- (unsigned)tearDownLocationAuthPromptForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v6 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1907FCC40;
  void v8[3] = &unk_1E5697F58;
  v8[4] = &v9;
  [v6 tearDownLocationAuthPromptForBundleID:a3 orBundlePath:a4 replyBlock:v8];
  LOBYTE(a4) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a4;
}

- (__CFArray)copyActivityAlarms
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1907FCD18;
  v5[3] = &unk_1E5698020;
  v5[4] = &v6;
  [v2 getActivitiesWithReplyBlock:v5];
  unsigned __int8 v3 = (__CFArray *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 andZoneIdentifier:(__CFString *)a5 andSubIdentityIdentifier:(__CFString *)a6 forBundleID:(__CFString *)a7 orBundlePath:(__CFString *)a8
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v13 = *(void *)&a3;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v14 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1907FCE44;
  v16[3] = &unk_1E5697F58;
  v16[4] = &v17;
  [v14 setAuthorizationStatusByType:v13 withCorrectiveCompensation:v12 andZoneIdentifier:a5 andSubIdentityIdentifier:a6 forBundleID:a7 orBundlePath:a8 replyBlock:v16];
  LOBYTE(a8) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return a8;
}

- (unsigned)updatePillButtonChoiceForOutstandingPrompt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1907FCF24;
  v6[3] = &unk_1E5697F58;
  v6[4] = &v7;
  [v4 updatePillButtonChoiceForOutstandingPrompt:v3 replyBlock:v6];
  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (unsigned)updatePromptedLatitude:(double)a3 longitude:(double)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v6 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = sub_1907FD014;
  v9[3] = &unk_1E5697F58;
  v9[4] = &v10;
  [v6 updatePromptedLatitude:v9 longitude:a3 replyBlock:a4];
  unsigned __int8 v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (unsigned)setIncidentalUseMode:(int)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v8 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1907FD10C;
  v10[3] = &unk_1E5697F58;
  v10[4] = &v11;
  [v8 setIncidentalUseMode:v7 forBundleID:a4 orBundlePath:a5 replyBlock:v10];
  LOBYTE(a5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return a5;
}

- (unsigned)setLocationButtonUseMode:(int)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v8 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1907FD204;
  v10[3] = &unk_1E5697F58;
  v10[4] = &v11;
  [v8 setLocationButtonUseMode:v7 forBundleID:a4 orBundlePath:a5 replyBlock:v10];
  LOBYTE(a5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return a5;
}

- (unsigned)setBackgroundIndicatorForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4 enabled:(unsigned __int8)a5
{
  int v5 = a5;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v8 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1907FD300;
  v10[3] = &unk_1E5697F58;
  v10[4] = &v11;
  [v8 setBackgroundIndicatorEnabled:v5 != 0 forBundleID:a3 orBundlePath:a4 replyBlock:v10];
  LOBYTE(a4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return a4;
}

- (unsigned)gyroCalibrationDatabaseSupportsMiniCalibration:(int *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1907FD3DC;
  v6[3] = &unk_1E5697F80;
  v6[4] = &v7;
  void v6[5] = a3;
  [v4 gyroCalibrationDatabaseSupportsMiniCalibrationWithReplyBlock:v6];
  LOBYTE(a3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return a3;
}

- (unsigned)timeSyncMachTimeStamp:(unint64_t *)a3 oscarTimeStamp:(unint64_t *)a4
{
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v6 = [(CLLocationInternalClient *)self synchronousRemoteObject];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1907FD4D4;
  void v8[3] = &unk_1E5698318;
  void v8[5] = a3;
  void v8[6] = a4;
  v8[4] = &v9;
  [v6 getOscarTimeSyncWithReplyBlock:v8];
  LOBYTE(a4) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a4;
}

- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5
{
  id v8 = [(CLLocationInternalClient *)self synchronousRemoteObject];

  [v8 notifyPassKitPayment:a3 transaction:a4 info:a5];
}

- (void)notifyWeatherForecast:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 latitude:(double)a7 longitude:(double)a8
{
  id v14 = [(CLLocationInternalClient *)self synchronousRemoteObject];

  [v14 notifyWeatherForecast:a3 airQualityConditions:a4 hourlyForecasts:a5 dailyForecasts:a6 latitude:a7 longitude:a8];
}

@end