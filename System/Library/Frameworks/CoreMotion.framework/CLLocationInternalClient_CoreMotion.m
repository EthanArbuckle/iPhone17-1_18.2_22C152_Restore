@interface CLLocationInternalClient_CoreMotion
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

@implementation CLLocationInternalClient_CoreMotion

+ (id)sharedServiceClient
{
  if (qword_1EB3BF580 != -1) {
    dispatch_once(&qword_1EB3BF580, &unk_1EDFD22E0);
  }
  return (id)qword_1EB3BF588;
}

- (id)connection
{
  objc_sync_enter(self);
  connection = self->_connection;
  if (!connection)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.locationd.synchronous", 4096);
    self->_connection = v6;
    uint64_t v8 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v7, (uint64_t)&unk_1EE01AB48);
    objc_msgSend_setRemoteObjectInterface_(v6, v9, v8);
    objc_msgSend_setInterruptionHandler_(self->_connection, v10, (uint64_t)&unk_1EDFD43E0);
    v11 = self->_connection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_190548C28;
    v16[3] = &unk_1E568D118;
    v16[4] = self;
    objc_msgSend_setInvalidationHandler_(v11, v12, (uint64_t)v16);
    objc_msgSend_resume(self->_connection, v13, v14);
    connection = self->_connection;
  }
  objc_sync_exit(self);
  return connection;
}

- (id)synchronousRemoteObject
{
  objc_sync_enter(self);
  v5 = objc_msgSend_sharedInstance(MEMORY[0x1E4F73050], v3, v4);
  objc_msgSend_intendToSyncServiceWithName_(v5, v6, @"CLInternalService");
  v9 = objc_msgSend_connection(self, v7, v8);
  v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)&unk_1EDFC3938);
  objc_sync_exit(self);
  return v11;
}

- (unsigned)setAuthorizationStatus:(unsigned __int8)a3 withCorrectiveCompensation:(int)a4 forBundleID:(__CFString *)a5 orBundlePath:(__CFString *)a6
{
  uint64_t v8 = *(void *)&a4;
  int v9 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10 = objc_msgSend_synchronousRemoteObject(self, a2, a3);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_190549118;
  v13[3] = &unk_1E568F5F0;
  v13[4] = &v14;
  objc_msgSend_setAuthorizationStatus_withCorrectiveCompensation_forBundleID_orBundlePath_replyBlock_(v10, v11, v9 != 0, v8, a5, a6, v13);
  LOBYTE(a6) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return a6;
}

- (unsigned)getIncidentalUseMode:(int *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19054920C;
  v11[3] = &unk_1E568F618;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend_getIncidentalUseModeForBundleID_orBundlePath_replyBlock_(v8, v9, (uint64_t)a4, a5, v11);
  LOBYTE(a5) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a5;
}

- (unsigned)reportLocationUtilityEvent:(int)a3 atDate:(__CFDate *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v6 = objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_190549308;
  v9[3] = &unk_1E568F5F0;
  v9[4] = &v10;
  objc_msgSend_reportLocationUtilityEvent_atDate_withReplyBlock_(v6, v7, v5, a4, v9);
  LOBYTE(a4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return a4;
}

- (void)clearLocationAuthorizationForBundleId:(__CFString *)a3 orBundlePath:(__CFString *)a4
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  v6 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1905493EC;
  v8[3] = &unk_1E568F5F0;
  v8[4] = v9;
  objc_msgSend_resetClientForBundleId_orBundlePath_withReplyBlock_(v6, v7, (uint64_t)a3, a4, v8);
  _Block_object_dispose(v9, 8);
}

- (unsigned)clearLocationAuthorizations
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1905494C4;
  v7[3] = &unk_1E568F5F0;
  v7[4] = &v8;
  objc_msgSend_resetAllClientsWithReplyBlock_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)getArchivedAuthorizationDecisionsWithError:(id *)a3
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = sub_1902DD170;
  v23 = sub_1902DD0C4;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = sub_1902DD170;
  char v17 = sub_1902DD0C4;
  uint64_t v18 = 0;
  uint64_t v4 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_19054967C;
  v12[3] = &unk_1E568F640;
  v12[4] = &v13;
  v12[5] = &v19;
  objc_msgSend_getArchivedAuthorizationDecisionsWithReplyBlock_(v4, v5, (uint64_t)v12);
  id v6 = (id)v20[5];
  id v7 = (id)v14[5];
  if (!v20[5] && !v14[5])
  {
    uint64_t v9 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v8, @"com.apple.locationd.internalservice.errorDomain", 1, 0);
    v14[5] = v9;
  }
  if (a3) {
    *a3 = (id)v14[5];
  }
  uint64_t v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

- (id)applyArchivedAuthorizationDecisions:(id)a3
{
  uint64_t v7 = objc_msgSend_UUID(MEMORY[0x1E4F29128], a2, (uint64_t)a3);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = sub_1902DD170;
  v25 = sub_1902DD0C4;
  uint64_t v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  int v8 = 3;
  do
  {
    uint64_t v9 = objc_msgSend_synchronousRemoteObject(self, v5, v6);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_19054987C;
    v16[3] = &unk_1E568F668;
    v16[4] = &v21;
    void v16[5] = &v17;
    objc_msgSend_applyArchivedAuthorizationDecisions_withConfirmationToken_replyBlock_(v9, v10, (uint64_t)a3, v7, v16);
    if (*((unsigned char *)v18 + 24))
    {
      char v11 = (void *)v22[5];
      goto LABEL_7;
    }
    --v8;
  }
  while (v8);
  char v11 = (void *)v22[5];
  if (!v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    char v11 = objc_msgSend_initWithDomain_code_userInfo_(v12, v13, @"com.apple.locationd.internalservice.errorDomain", 1, 0);
    v22[5] = (uint64_t)v11;
  }
LABEL_7:
  id v14 = v11;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v14;
}

- (__CFDictionary)copyAppsUsingLocation
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  char v11 = sub_1902DD170;
  id v12 = sub_1902DD0C4;
  uint64_t v13 = 0;
  v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1905499A0;
  v7[3] = &unk_1E568F690;
  v7[4] = &v8;
  objc_msgSend_getAppsUsingLocationWithReplyBlock_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = (__CFDictionary *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (__CFDictionary)copyActiveClientsUsingLocation
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  char v11 = sub_1902DD170;
  id v12 = sub_1902DD0C4;
  uint64_t v13 = 0;
  v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190549AA8;
  v7[3] = &unk_1E568F690;
  v7[4] = &v8;
  objc_msgSend_getActiveClientsUsingLocationWithReplyBlock_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = (__CFDictionary *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (__CFArray)copyTechnologiesInUse
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190549B8C;
  v7[3] = &unk_1E568F6B8;
  v7[4] = &v8;
  objc_msgSend_getTechnologiesInUseWithReplyBlock_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = (__CFArray *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (__CFDictionary)copyInternalState
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = sub_1902DD170;
  id v12 = sub_1902DD0C4;
  uint64_t v13 = 0;
  v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190549C98;
  v7[3] = &unk_1E568F690;
  v7[4] = &v8;
  objc_msgSend_getClientManagerInternalStateWithReplyBlock_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = (__CFDictionary *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (__CFString)copyMicroLocationInternalVersion
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190549D80;
  v7[3] = &unk_1E568F6E0;
  v7[4] = &v8;
  objc_msgSend_getMicroLocationInternalVersionWithReplyBlock_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = (__CFString *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (__CFDictionary)copyZaxisStats
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190549E68;
  v7[3] = &unk_1E568F690;
  v7[4] = &v8;
  objc_msgSend_getZaxisStatsWithReplyBlock_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = (__CFDictionary *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (__CFArray)copyGnssBandsInUse
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190549F50;
  v7[3] = &unk_1E568F6B8;
  v7[4] = &v8;
  objc_msgSend_getGnssBandsInUseWithReplyBlock_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = (__CFArray *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setLocationDefaultForKey:(__CFString *)a3 value:(void *)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4) {
      objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], a2, (uint64_t)a4, 200, 0, 0);
    }
    uint64_t v7 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
    MEMORY[0x1F4181798](v7, sel_setLocationDefaultForKey_andValue_replyBlock_, a3);
  }
  else
  {
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    uint64_t v6 = qword_1EB3BE850;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_FAULT, "#Spi, Key is NULL!", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE858 != -1) {
        dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
      }
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion setLocationDefaultForKey:value:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)getLocationDefaultForKey:(__CFString *)a3
{
  v3 = a3;
  if (a3)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3052000000;
    uint64_t v13 = sub_1902DD170;
    id v14 = sub_1902DD0C4;
    uint64_t v15 = 0;
    uint64_t v4 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_19054A440;
    void v9[3] = &unk_1E568F708;
    v9[4] = &v10;
    objc_msgSend_getLocationDefaultForKey_replyBlock_(v4, v5, (uint64_t)v3, v9);
    uint64_t v7 = v11[5];
    if (v7)
    {
      v3 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v6, v7, 0, 0, 0);
    }
    else
    {
      v3 = 0;
    }
    _Block_object_dispose(&v10, 8);
  }
  return v3;
}

- (id)timeZoneAtLocation:(id)a3
{
  if (!a3)
  {
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    uint64_t v12 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)"-[CLLocationInternalClient_CoreMotion timeZoneAtLocation:]");
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v10, v13, v12, @"LocationInternal.m", 642, @"Invalid parameter not satisfying: %@", @"nil != location");
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = sub_1902DD170;
  char v20 = sub_1902DD0C4;
  uint64_t v21 = 0;
  uint64_t v7 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  if (a3) {
    objc_msgSend_clientLocation(a3, v5, v6);
  }
  else {
    memset(v15, 0, 156);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_19054A6E4;
  v14[3] = &unk_1E568F6E0;
  v14[4] = &v16;
  objc_msgSend_timeZoneForLocation_replyBlock_(v7, v5, (uint64_t)v15, v14);
  id v8 = (id)v17[5];
  _Block_object_dispose(&v16, 8);
  return v8;
}

- (void)setPrivateMode:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v4 = objc_msgSend_synchronousRemoteObject(self, a2, a3);

  MEMORY[0x1F4181798](v4, sel_setPrivateMode_replyBlock_, v3 != 0);
}

- (unsigned)getPrivateMode
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  int v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19054A9C4;
  v7[3] = &unk_1E568F730;
  v7[4] = &v8;
  objc_msgSend_getPrivateMode_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unsigned)pingDaemon
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  int v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19054AA9C;
  v7[3] = &unk_1E568F5F0;
  v7[4] = &v8;
  objc_msgSend_pingDaemonWithReplyBlock_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setLocationServicesEnabled:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v4 = objc_msgSend_synchronousRemoteObject(self, a2, a3);
  objc_msgSend_setLocationServicesEnabled_replyBlock_(v4, v5, v3 != 0, &unk_1EDFC1B80);
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3C8];

  CFPreferencesSynchronize(@"com.apple.locationd", v6, v7);
}

- (unsigned)getLocationServicesEnabled:(char *)a3
{
  int v3 = a3;
  if (a3)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    uint64_t v4 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_19054AD70;
    v7[3] = &unk_1E568F618;
    v7[4] = &v8;
    void v7[5] = v3;
    objc_msgSend_getLocationServicesEnabledWithReplyBlock_(v4, v5, (uint64_t)v7);
    LOBYTE(v3) = *((unsigned char *)v9 + 24);
    _Block_object_dispose(&v8, 8);
  }
  return v3;
}

- (id)setAuthorizationPromptMapDisplayEnabled:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = sub_1902DD170;
  uint64_t v13 = sub_1902DD0C4;
  uint64_t v14 = 0;
  uint64_t v4 = objc_msgSend_synchronousRemoteObject(self, a2, a3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19054AE94;
  v8[3] = &unk_1E568F5F0;
  v8[4] = &v9;
  objc_msgSend_setAuthorizationPromptMapDisplayEnabled_replyBlock_(v4, v5, v3 != 0, v8);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (unsigned)getAuthorizationPromptMapDisplayEnabled:(char *)a3
{
  int v3 = a3;
  if (a3)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    uint64_t v4 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_19054B108;
    v7[3] = &unk_1E568F758;
    v7[4] = &v8;
    void v7[5] = v3;
    objc_msgSend_getAuthorizationPromptMapDisplayEnabledWithReplyBlock_(v4, v5, (uint64_t)v7);
    LOBYTE(v3) = *((unsigned char *)v9 + 24);
    _Block_object_dispose(&v8, 8);
  }
  return v3;
}

- (id)setTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 statusData:(id)a5
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = sub_1902DD170;
  v22 = sub_1902DD0C4;
  uint64_t v23 = 0;
  if (!a5)
  {
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    uint64_t v15 = objc_msgSend_stringWithUTF8String_(NSString, v14, (uint64_t)"-[CLLocationInternalClient_CoreMotion setTemporaryAuthorizationStatusForBundleId:orBundlePath:statusData:]");
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v13, v16, v15, @"LocationInternal.m", 765, @"Invalid parameter not satisfying: %@", @"data != nil");
  }
  uint64_t v9 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_19054B2A4;
  v17[3] = &unk_1E568F5F0;
  v17[4] = &v18;
  objc_msgSend_setTemporaryAuthorizationStatusForBundleId_orBundlePath_statusData_replyBlock_(v9, v10, (uint64_t)a3, a4, a5, v17);
  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)getTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 error:(id *)a5
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = sub_1902DD170;
  uint64_t v17 = sub_1902DD0C4;
  uint64_t v18 = 0;
  uint64_t v8 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_19054B558;
  v12[3] = &unk_1E568F780;
  v12[4] = &v13;
  v12[5] = a5;
  objc_msgSend_getTemporaryAuthorizationStatusForBundleId_orBundlePath_replyBlock_(v8, v9, (uint64_t)a3, a4, v12);
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (double)modifyOrSetAuthorizationTime:(double)a3 forBundleID:(id)a4 orBundlePath:(id)a5
{
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  unint64_t v16 = 0xBFF0000000000000;
  uint64_t v8 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a4);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_19054B80C;
  v12[3] = &unk_1E568F7A8;
  v12[4] = &v13;
  objc_msgSend_modifyOrSetAuthorizationTime_forBundleID_orBundlePath_replyBlock_(v8, v9, (uint64_t)a4, a5, v12, a3);
  double v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)triggerExpiredAuthorizationPurgeOnClientManager
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  id v11 = sub_1902DD170;
  uint64_t v12 = sub_1902DD0C4;
  uint64_t v13 = 0;
  int v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19054BAA0;
  v7[3] = &unk_1E568F5F0;
  v7[4] = &v8;
  objc_msgSend_triggerExpiredAuthorizationPurgeWithReplyBlock_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setGestureServiceEnabled:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v4 = objc_msgSend_synchronousRemoteObject(self, a2, a3);

  MEMORY[0x1F4181798](v4, sel_setGestureServiceEnabled_replyBlock_, v3 != 0);
}

- (unsigned)getGestureServiceEnabled:(char *)a3
{
  int v3 = a3;
  if (a3)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    uint64_t v4 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_19054BEE0;
    v7[3] = &unk_1E568F758;
    v7[4] = &v8;
    void v7[5] = v3;
    objc_msgSend_getGestureServiceEnabledWithReplyBlock_(v4, v5, (uint64_t)v7);
    LOBYTE(v3) = *((unsigned char *)v9 + 24);
    _Block_object_dispose(&v8, 8);
  }
  return v3;
}

- (unsigned)getAuthorizationStatusForApp:(int *)a3 withAuditToken:(id *)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v6 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19054BFE0;
  v11[3] = &unk_1E568F618;
  v11[4] = &v12;
  v11[5] = a3;
  long long v7 = *(_OWORD *)&a4->var0[4];
  v10[0] = *(_OWORD *)a4->var0;
  v10[1] = v7;
  objc_msgSend_getAuthorizationStatusForAppWithAuditToken_replyBlock_(v6, v8, (uint64_t)v10, v11);
  LOBYTE(a4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a4;
}

- (unsigned)getAuthorizationStatus:(int *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19054C0E0;
  v11[3] = &unk_1E568F618;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend_getAuthorizationStatusForBundleID_orBundlePath_replyBlock_(v8, v9, (uint64_t)a4, a5, v11);
  LOBYTE(a5) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a5;
}

- (unsigned)getPrecisionPermission:(char *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = sub_1902DD170;
  uint64_t v23 = sub_1902DD0C4;
  uint64_t v24 = 0;
  uint64_t v8 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_19054C3C8;
  v18[3] = &unk_1E568F7D0;
  v18[5] = &v19;
  v18[6] = a3;
  v18[4] = &v25;
  objc_msgSend_getPrecisionPermissionForBundleID_orBundlePath_replyBlock_(v8, v9, (uint64_t)a4, a5, v18);
  uint64_t v10 = v20;
  if (v20[5])
  {
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    char v11 = qword_1EB3BE850;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = v20[5];
      uint64_t buf = 68289282;
      __int16 v30 = 2082;
      v31 = "";
      __int16 v32 = 2114;
      uint64_t v33 = v12;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, CLInternalGetPrecisionPermission failed\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      if (qword_1EB3BE858 != -1) {
        dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
      }
    }
    uint64_t v13 = qword_1EB3BE850;
    BOOL v14 = os_signpost_enabled((os_log_t)qword_1EB3BE850);
    uint64_t v10 = v20;
    if (v14)
    {
      uint64_t v15 = v20[5];
      uint64_t buf = 68289282;
      __int16 v30 = 2082;
      v31 = "";
      __int16 v32 = 2114;
      uint64_t v33 = v15;
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, CLInternalGetPrecisionPermission failed", "{\"msg%{public}.0s\":\"#Spi, CLInternalGetPrecisionPermission failed\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      uint64_t v10 = v20;
    }
  }

  unsigned __int8 v16 = *((unsigned char *)v26 + 24);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v16;
}

- (unsigned)performMigration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  int v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_19054C64C;
  void v9[3] = &unk_1E568F5F0;
  v9[4] = &v10;
  objc_msgSend_performMigrationWithReplyBlock_(v3, v4, (uint64_t)v9);
  if (!*((unsigned char *)v11 + 24))
  {
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    unsigned __int8 v5 = qword_1EB3BE850;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_FAULT, "#Spi, _CLInternalPerformMigration failed", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE858 != -1) {
        dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
      }
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion performMigration]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
  unsigned __int8 v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (unsigned)shutdownDaemon
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  int v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_19054C898;
  void v9[3] = &unk_1E568F5F0;
  v9[4] = &v10;
  objc_msgSend_shutdownDaemonWithReplyBlock_(v3, v4, (uint64_t)v9);
  if (!*((unsigned char *)v11 + 24))
  {
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    unsigned __int8 v5 = qword_1EB3BE850;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_FAULT, "#Spi, _CLShutdownDaemon failed", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE858 != -1) {
        dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
      }
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion shutdownDaemon]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
  unsigned __int8 v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (unsigned)displayStatistics
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  int v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_19054CAE0;
  void v9[3] = &unk_1E568F5F0;
  v9[4] = &v10;
  objc_msgSend_displayStatisticsWithReplyBlock_(v3, v4, (uint64_t)v9);
  if (!*((unsigned char *)v11 + 24))
  {
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    unsigned __int8 v5 = qword_1EB3BE850;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_FAULT, "#Spi, _CLDisplayStatistics failed", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE858 != -1) {
        dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
      }
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion displayStatistics]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
  unsigned __int8 v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (unsigned)dumpLogs:(__CFString *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v4 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = sub_19054CD34;
  v10[3] = &unk_1E568F5F0;
  v10[4] = &v11;
  objc_msgSend_dumpLogsWithDescription_replyBlock_(v4, v5, (uint64_t)a3, v10);
  if (!*((unsigned char *)v12 + 24))
  {
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    unsigned __int8 v6 = qword_1EB3BE850;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_FAULT, "#Spi, _CLDumpLogs failed", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE858 != -1) {
        dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
      }
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion dumpLogs:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  unsigned __int8 v7 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v7;
}

- (__CFDictionary)copyMonitoredRegionsForBundleIdentifier:(__CFString *)a3 orBundlePath:(__CFString *)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  unsigned __int8 v6 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = sub_19054CE24;
  v10[3] = &unk_1E568F690;
  v10[4] = &v11;
  objc_msgSend_getMonitoredRegionsForBundleID_orBundlePath_replyBlock_(v6, v7, (uint64_t)a3, a4, v10);
  uint64_t v8 = (__CFDictionary *)v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (BOOL)checkAndExerciseAuthorizationForBundleID:(id)a3 orBundlePath:(id)a4 services:(unint64_t)a5 error:(id *)a6
{
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3052000000;
  uint64_t v25 = sub_1902DD170;
  uint64_t v26 = sub_1902DD0C4;
  uint64_t v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v10 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_19054D010;
  v17[3] = &unk_1E568F7F8;
  v17[4] = &v22;
  void v17[5] = &v28;
  v17[6] = &v18;
  objc_msgSend_checkAndExerciseAuthorizationForBundleID_orBundlePath_services_replyBlock_(v10, v11, (uint64_t)a3, a4, a5, v17);
  id v12 = (id)v23[5];
  if (!*((unsigned char *)v19 + 24))
  {
    uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, *MEMORY[0x1E4F281F8], 4097, 0);
    v23[5] = v14;
  }
  if (a6) {
    *a6 = (id)v23[5];
  }
  char v15 = *((unsigned char *)v29 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v15;
}

- (BOOL)registerCircularInterestZoneWithId:(id)a3 latitude:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundleId:(id)a9 orBundlePath:(id)a10 error:(id *)a11
{
  uint64_t v14 = *(void *)&a8;
  uint64_t v15 = *(void *)&a7;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3052000000;
  v29 = sub_1902DD170;
  uint64_t v30 = sub_1902DD0C4;
  uint64_t v31 = 0;
  uint64_t v20 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_19054D204;
  v25[3] = &unk_1E568F668;
  v25[4] = &v26;
  v25[5] = &v32;
  objc_msgSend_registerCircularInterestZoneWithId_latitude_longitude_radius_serviceMaskOperator_provenanceType_forBundleId_orBundlePath_replyBlock_(v20, v21, (uint64_t)a3, v15, v14, a9, a10, v25, a4, a5, a6);
  id v22 = (id)v27[5];
  if (a11) {
    *a11 = (id)v27[5];
  }
  BOOL v23 = *((unsigned char *)v33 + 24) != 0;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v23;
}

- (BOOL)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundleId:(id)a7 orBundlePath:(id)a8 error:(id *)a9
{
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  uint64_t v13 = *(void *)&a4;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = sub_1902DD170;
  uint64_t v25 = sub_1902DD0C4;
  uint64_t v26 = 0;
  uint64_t v15 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_19054D3D0;
  v20[3] = &unk_1E568F668;
  v20[4] = &v21;
  v20[5] = &v27;
  objc_msgSend_registerPhenolicInterestZoneWithId_phenolicLocation_serviceMaskOperator_provenanceType_forBundleId_orBundlePath_replyBlock_(v15, v16, (uint64_t)a3, v13, v12, v11, a7, a8, v20);
  id v17 = (id)v22[5];
  if (a9) {
    *a9 = (id)v22[5];
  }
  BOOL v18 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v18;
}

- (BOOL)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundleId:(id)a5 orBundlePath:(id)a6 error:(id *)a7
{
  BOOL v11 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = sub_1902DD170;
  id v22 = sub_1902DD0C4;
  uint64_t v23 = 0;
  uint64_t v12 = objc_msgSend_synchronousRemoteObject(self, a2, a3);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_19054D58C;
  v17[3] = &unk_1E568F668;
  v17[4] = &v18;
  void v17[5] = &v24;
  objc_msgSend_setRelevance_forInterestZoneWithId_registeredForBundleId_orBundlePath_replyBlock_(v12, v13, v11, a4, a5, a6, v17);
  id v14 = (id)v19[5];
  if (a7) {
    *a7 = (id)v19[5];
  }
  BOOL v15 = *((unsigned char *)v25 + 24) != 0;
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v15;
}

- (BOOL)deleteInterestZoneWithId:(id)a3 registeredForBundleId:(id)a4 orBundlePath:(id)a5 error:(id *)a6
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = sub_1902DD170;
  uint64_t v20 = sub_1902DD0C4;
  uint64_t v21 = 0;
  uint64_t v10 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_19054D738;
  v15[3] = &unk_1E568F668;
  v15[4] = &v16;
  v15[5] = &v22;
  objc_msgSend_deleteInterestZoneWithId_registeredForBundleId_orBundlePath_replyBlock_(v10, v11, (uint64_t)a3, a4, a5, v15);
  id v12 = (id)v17[5];
  if (a6) {
    *a6 = (id)v17[5];
  }
  BOOL v13 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

- (unsigned)getLocationForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4 dynamicAccuracyReductionEnabled:(unsigned __int8)a5 allowsAlteredAccessoryLocations:(unsigned __int8)a6 location:(id *)a7
{
  if (!a7) {
    return 0;
  }
  int v8 = a6;
  int v9 = a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v12 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_19054D888;
  v16[3] = &unk_1E568F780;
  v16[4] = &v17;
  void v16[5] = a7;
  objc_msgSend_getLocationForBundleID_orBundlePath_dynamicAccuracyReductionEnabled_allowsAlteredAccessoryLocations_replyBlock_(v12, v13, (uint64_t)a3, a4, v9 != 0, v8 != 0, v16);
  unsigned __int8 v14 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v14;
}

- (unsigned)getGroundAltitudeForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4 location:(id)a5 groundAltitude:(id *)a6
{
  unsigned __int8 v6 = 0;
  if (a5 && a6)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    BOOL v11 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_19054D9D0;
    v14[3] = &unk_1E568F820;
    v14[4] = &v15;
    void v14[5] = a6;
    objc_msgSend_getGroundAltitudeForBundleID_orBundlePath_location_replyBlock_(v11, v12, (uint64_t)a3, a4, a5, v14);
    unsigned __int8 v6 = *((unsigned char *)v16 + 24);
    _Block_object_dispose(&v15, 8);
  }
  return v6;
}

- (void)setMapMatchingRouteHint:(id *)a3 count:(int)a4 routingType:(int)a5 stepType:(int)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a4 < 501)
  {
    uint64_t v9 = *(void *)&a6;
    uint64_t v10 = *(void *)&a5;
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    BOOL v13 = qword_1EB3BE850;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 67240704;
      int v22 = a4;
      __int16 v23 = 1026;
      int v24 = v10;
      __int16 v25 = 1026;
      int v26 = v9;
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_DEBUG, "#Spi,RouteHint,LocationInternal,Received route hint road segments,%{public}d,routeType,%{public}d,stepType,%{public}d", buf, 0x14u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE858 != -1) {
        dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
      }
      char v20 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CLLocationInternalClient_CoreMotion setMapMatchingRouteHint:count:routingType:stepType:]", "CoreLocation: %s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
    uint64_t v15 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v14, (uint64_t)a3, 40 * a4);
    char v18 = objc_msgSend_synchronousRemoteObject(self, v16, v17);
    objc_msgSend_setMapMatchingRouteHint_routingType_stepType_replyBlock_(v18, v19, v15, v10, v9, &unk_1EDFC3958);
  }
  else
  {
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    unsigned __int8 v7 = qword_1EB3BE850;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 67240448;
      int v22 = a4;
      __int16 v23 = 1026;
      int v24 = 500;
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_ERROR, "#Spi,RouteHintError, Exceeded max number of route hint road segments (%{public}d > %{public}d)", buf, 0xEu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE858 != -1) {
        dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
      }
      int v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion setMapMatchingRouteHint:count:routingType:stepType:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)setTrackRunHint:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BE858 != -1) {
    dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
  }
  unsigned __int8 v5 = qword_1EB3BE850;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_INFO, "#Spi,CLTR,CLTrackRunHint received,framework side", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    id v12 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CLLocationInternalClient_CoreMotion setTrackRunHint:]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  uint64_t v7 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v6, (uint64_t)a3, 16);
  uint64_t v10 = objc_msgSend_synchronousRemoteObject(self, v8, v9);
  objc_msgSend_setTrackRunHint_replyBlock_(v10, v11, v7, &unk_1EDFD3460);
}

- (int)getAccessoryTypeBitSet
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  int v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19054E4C0;
  v11[3] = &unk_1E568F848;
  v11[4] = &v12;
  objc_msgSend_getAccessoryTypeBitSetWithReplyBlock_(v3, v4, (uint64_t)v11);
  if (qword_1EB3BE858 != -1) {
    dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
  }
  unsigned __int8 v5 = qword_1EB3BE850;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_DEBUG))
  {
    int v6 = *((_DWORD *)v13 + 6);
    *(_DWORD *)uint64_t buf = 67109120;
    int v19 = v6;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEBUG, "#Spi,getAccessoryTypeBitSet,%d", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    int v9 = *((_DWORD *)v13 + 6);
    int v16 = 67109120;
    int v17 = v9;
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CLLocationInternalClient_CoreMotion getAccessoryTypeBitSet]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  int v7 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (int)getAccessoryPASCDTransmissionState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 4;
  int v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19054E8BC;
  v11[3] = &unk_1E568F848;
  v11[4] = &v12;
  objc_msgSend_getAccessoryPASCDTransmissionStateWithReplyBlock_(v3, v4, (uint64_t)v11);
  if (qword_1EB3BE858 != -1) {
    dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
  }
  unsigned __int8 v5 = qword_1EB3BE850;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_DEBUG))
  {
    int v6 = *((_DWORD *)v13 + 6);
    *(_DWORD *)uint64_t buf = 67109120;
    int v19 = v6;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEBUG, "#Spi,getAccessoryPASCDTransmissionState,%d", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    int v9 = *((_DWORD *)v13 + 6);
    int v16 = 67109120;
    int v17 = v9;
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CLLocationInternalClient_CoreMotion getAccessoryPASCDTransmissionState]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  int v7 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)getOdometryBatchedLocations
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x3052000000;
  int v19 = sub_1902DD170;
  uint64_t v20 = sub_1902DD0C4;
  uint64_t v21 = 0;
  int v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_19054ECF8;
  v15[3] = &unk_1E568F690;
  v15[4] = &v16;
  objc_msgSend_getOdometryBatchedLocationsWithReplyBlock_(v3, v4, (uint64_t)v15);
  if (v17[5])
  {
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    unsigned __int8 v5 = qword_1EB3BE850;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = objc_msgSend_count((void *)v17[5], v6, v7);
      *(_DWORD *)uint64_t buf = 134349056;
      uint64_t v25 = v8;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEBUG, "#Spi,getOdometryBatchedLocations,returned with count,%{public}lu", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE858 != -1) {
        dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
      }
      uint64_t v13 = objc_msgSend_count((void *)v17[5], v11, v12);
      int v22 = 134349056;
      uint64_t v23 = v13;
      uint64_t v14 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CLLocationInternalClient_CoreMotion getOdometryBatchedLocations]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
  }
  int v9 = (void *)v17[5];
  _Block_object_dispose(&v16, 8);
  return v9;
}

- (unsigned)copyLastLog
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  int v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_19054F22C;
  void v9[3] = &unk_1E568F5F0;
  v9[4] = &v10;
  objc_msgSend_copyLastLogWithReplyBlock_(v3, v4, (uint64_t)v9);
  if (!*((unsigned char *)v11 + 24))
  {
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    unsigned __int8 v5 = qword_1EB3BE850;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_FAULT, "#Spi, _CLCopyLastLog failed", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE858 != -1) {
        dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
      }
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion copyLastLog]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
  unsigned __int8 v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (unsigned)setStatusBarIconEnabled:(BOOL)a3 forEntityClass:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  unsigned __int8 v6 = objc_msgSend_synchronousRemoteObject(self, a2, a3);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_19054F48C;
  v12[3] = &unk_1E568F5F0;
  v12[4] = &v13;
  objc_msgSend_setStatusBarIconEnabledForEntityClass_enabled_replyBlock_(v6, v7, v4, v5, v12);
  if (!*((unsigned char *)v14 + 24))
  {
    if (qword_1EB3BE858 != -1) {
      dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
    }
    uint64_t v8 = qword_1EB3BE850;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      uint64_t v20 = "";
      __int16 v21 = 2050;
      uint64_t v22 = (int)v4;
      _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, Setting status bar enabled for entity class failed\", \"entityClass\":%{public, location:CLLocationDictionaryUtilitiesEntityClass}lld}", buf, 0x1Cu);
      if (qword_1EB3BE858 != -1) {
        dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
      }
    }
    int v9 = qword_1EB3BE850;
    if (os_signpost_enabled((os_log_t)qword_1EB3BE850))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      uint64_t v20 = "";
      __int16 v21 = 2050;
      uint64_t v22 = (int)v4;
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, Setting status bar enabled for entity class failed", "{\"msg%{public}.0s\":\"#Spi, Setting status bar enabled for entity class failed\", \"entityClass\":%{public, location:CLLocationDictionaryUtilitiesEntityClass}lld}", buf, 0x1Cu);
    }
  }
  unsigned __int8 v10 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (unsigned)getStatusBarIconEnabled:(BOOL *)a3 forEntityClass:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  unsigned __int8 v6 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_19054F57C;
  void v9[3] = &unk_1E568F870;
  v9[4] = &v11;
  void v9[5] = a3;
  int v10 = v4;
  objc_msgSend_getStatusBarIconEnabledForEntityClass_replyBlock_(v6, v7, v4, v9);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (int)getStatusBarIconState
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  int v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19054F7EC;
  v7[3] = &unk_1E568F848;
  v7[4] = &v8;
  objc_msgSend_getStatusBarIconState_(v3, v4, (uint64_t)v7);
  int v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)getPipelinedCache
{
  unint64_t v4 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = sub_1902DD170;
  char v16 = sub_1902DD0C4;
  uint64_t v17 = 0;
  do
  {
    int v5 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_19054F928;
    v11[3] = &unk_1E568F6B8;
    v11[4] = &v12;
    objc_msgSend_getPipelinedCacheWithReply_(v5, v6, (uint64_t)v11);
    uint64_t v7 = (void *)v13[5];
    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v4 >= 9;
    }
    ++v4;
  }
  while (!v8);
  id v9 = v7;
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (unsigned)getGyroCalibrationDatabaseBiasFit:(id *)a3 atTemperature:(float)a4
{
  int v5 = a3;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  unsigned __int8 v6 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_19054FA40;
  void v9[3] = &unk_1E568F780;
  v9[4] = &v10;
  void v9[5] = v5;
  objc_msgSend_getGyroCalibrationDatabaseBiasFitAtTemperature_withReply_(v6, v7, (uint64_t)v9, COERCE_DOUBLE((unint64_t)LODWORD(a4)));
  LOBYTE(v5) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)startStopAdvertisingBeacon:(id)a3 power:(id)a4
{
  if (a4) {
    uint64_t v6 = objc_msgSend_intValue(a4, a2, (uint64_t)a3);
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v7 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19054FB8C;
  v11[3] = &unk_1E568F5F0;
  v11[4] = &v12;
  objc_msgSend_startStopAdvertisingBeacon_atPower_replyBlock_(v7, v8, (uint64_t)a3, v6, v11);
  BOOL v9 = *((unsigned char *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (unsigned)insertGyroCalibrationDatabaseBiasEstimateIfValid:(id)a3 temperature:(float)a4 variance:(id)a5 timestamp:(double)a6
{
  float var2 = a5.var2;
  float var1 = a5.var1;
  float var0 = a5.var0;
  float v12 = a3.var2;
  float v13 = a3.var1;
  float v14 = a3.var0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  char v15 = objc_msgSend_synchronousRemoteObject(self, a2, v6);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_19054FCC4;
  v25[3] = &unk_1E568F5F0;
  v25[4] = &v26;
  *(float *)&double v16 = v13;
  *(float *)&double v17 = v12;
  *(float *)&double v18 = a4;
  *(float *)&double v19 = var0;
  *(float *)&double v20 = var1;
  *(float *)&double v21 = var2;
  objc_msgSend_insertGyroCalibrationDatabaseBiasEstimateIfValid_temperature_variance_timestamp_replyBlock_(v15, v22, (uint64_t)v25, COERCE_DOUBLE((unint64_t)LODWORD(v14)), v16, v17, v18, v19, v20, v21, a6);
  unsigned __int8 v23 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v26, 8);
  return v23;
}

- (unsigned)gyroCalibrationDatabaseWipe
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  int v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19054FD9C;
  v7[3] = &unk_1E568F5F0;
  v7[4] = &v8;
  objc_msgSend_gyroCalibrationDatabaseWipeWithReplyBlock_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unsigned)getGyroCalibrationDatabaseNumTemperatures:(int *)a3
{
  int v3 = a3;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  unint64_t v4 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19054FE78;
  v7[3] = &unk_1E568F618;
  v7[4] = &v8;
  void v7[5] = v3;
  objc_msgSend_gyroCalibrationDatabaseGetNumTemperaturesWithReplyBlock_(v4, v5, (uint64_t)v7);
  LOBYTE(v3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

- (unsigned)configure:(id)a3
{
  uint64_t v3 = *(void *)&a3.var7;
  uint64_t v4 = *(void *)&a3.var0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  unsigned __int8 v5 = objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3.var0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19054FF74;
  v8[3] = &unk_1E568F5F0;
  v8[4] = &v9;
  objc_msgSend_configure_replyBlock_(v5, v6, v4, v3, v8);
  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v3;
}

- (unsigned)getControlPlaneStatusReportClear:(int)a3 startTime:(double *)a4 endTime:(double *)a5 latitude:(double *)a6 longitude:(double *)a7 altitude:(double *)a8 accuracy:(double *)a9 status:(unsigned int *)a10
{
  unsigned __int8 v10 = 0;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a7 && a6 && a4 && a5 && a10)
  {
    uint64_t v15 = *(void *)&a3;
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3052000000;
    v36 = sub_1902DD170;
    v37 = sub_1902DD0C4;
    uint64_t v38 = 0;
    double v17 = objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1905502F4;
    v32[3] = &unk_1E568F898;
    v32[6] = a5;
    v32[7] = a6;
    v32[8] = a7;
    v32[9] = a8;
    v32[10] = a9;
    v32[11] = a10;
    v32[4] = &v33;
    v32[5] = a4;
    objc_msgSend_getControlPlaneStatusReportClear_replyBlock_(v17, v18, v15, v32);
    while (1)
    {
      double v21 = (void *)v34[5];
      if (!v21)
      {
        unsigned __int8 v10 = 1;
        goto LABEL_21;
      }
      if (objc_msgSend_code(v21, v19, v20) != 1) {
        break;
      }
      if (qword_1EB3BE858 != -1) {
        dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
      }
      uint64_t v22 = qword_1EB3BE850;
      if (os_log_type_enabled((os_log_t)qword_1EB3BE850, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_DEBUG, "#Spi, Blocking Mig routine deferred on Daemon side... waiting and retrying", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE858 != -1) {
          dispatch_once(&qword_1EB3BE858, &unk_1EDFD4420);
        }
        __int16 v31 = 0;
        uint64_t v27 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CLLocationInternalClient_CoreMotion getControlPlaneStatusReportClear:startTime:endTime:latitude:longitude:altitude:accuracy:status:]", "CoreLocation: %s\n", v27);
        if (v27 != (char *)buf) {
          free(v27);
        }
      }
      sleep(1u);
      uint64_t v25 = objc_msgSend_synchronousRemoteObject(self, v23, v24);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_190550330;
      v30[3] = &unk_1E568F898;
      v30[6] = a5;
      v30[7] = a6;
      v30[8] = a7;
      v30[9] = a8;
      v30[10] = a9;
      v30[11] = a10;
      v30[4] = &v33;
      v30[5] = a4;
      objc_msgSend_getControlPlaneStatusReportClear_replyBlock_(v25, v26, v15, v30);
    }
    unsigned __int8 v10 = v34[5] == 0;
LABEL_21:
    _Block_object_dispose(&v33, 8);
  }
  return v10;
}

- (unsigned)getEmergencyLocationSettingsCompatibilityVersion:(int *)a3 andContentVersion:(int *)a4
{
  unsigned __int8 v4 = 0;
  if (a3 && a4)
  {
    uint64_t v11 = 0;
    char v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v7 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    _OWORD v10[2] = sub_19055044C;
    v10[3] = &unk_1E568F8C0;
    void v10[5] = a3;
    v10[6] = a4;
    v10[4] = &v11;
    objc_msgSend_getEmergencyLocationSettingsVersion_(v7, v8, (uint64_t)v10);
    unsigned __int8 v4 = *((unsigned char *)v12 + 24);
    _Block_object_dispose(&v11, 8);
  }
  return v4;
}

- (unsigned)deleteCurrentEmergencyLocationAsset
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190550530;
  v7[3] = &unk_1E568F5F0;
  v7[4] = &v8;
  objc_msgSend_deleteCurrentEmergencyLocationAsset_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (__CFDictionary)copyNearbyAssetSettings
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  char v11 = sub_1902DD170;
  char v12 = sub_1902DD0C4;
  uint64_t v13 = 0;
  uint64_t v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19055062C;
  v7[3] = &unk_1E568F8E8;
  v7[4] = &v8;
  objc_msgSend_copyNearbyAssetSettings_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = (__CFDictionary *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (__CFDictionary)copyNearbyAssetSettingsOfAccessoryFile:(__CFString *)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  char v12 = sub_1902DD170;
  uint64_t v13 = sub_1902DD0C4;
  uint64_t v14 = 0;
  unsigned __int8 v4 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190550750;
  v8[3] = &unk_1E568F8E8;
  v8[4] = &v9;
  objc_msgSend_copyNearbyAssetSettingsOfAccessoryFile_withReply_(v4, v5, (uint64_t)a3, v8);
  uint64_t v6 = (__CFDictionary *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (__CFDictionary)copyRoutineAssetSettingsWithCompatibilityVersion:(int *)a3 contentVersion:(int *)a4
{
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = sub_1902DD170;
  uint64_t v15 = sub_1902DD0C4;
  uint64_t v16 = 0;
  uint64_t v6 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = sub_190550880;
  v10[3] = &unk_1E568F910;
  v10[4] = &v11;
  void v10[5] = a3;
  v10[6] = a4;
  objc_msgSend_copyRoutineAssetSettings_(v6, v7, (uint64_t)v10);
  uint64_t v8 = (__CFDictionary *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (unsigned)shouldDisplayEEDUI
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19055099C;
  v7[3] = &unk_1E568F938;
  v7[4] = &v8;
  objc_msgSend_shouldDisplayEEDUI_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)getEEDCloakingKey:(id *)a3
{
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = sub_1902DD170;
  uint64_t v14 = sub_1902DD0C4;
  uint64_t v15 = 0;
  unsigned __int8 v4 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_190550AA4;
  void v9[3] = &unk_1E568F780;
  v9[4] = &v10;
  void v9[5] = a3;
  objc_msgSend_getEEDCloakingKeyWithReply_(v4, v5, (uint64_t)v9);
  id v6 = *a3;
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)getEEDEmergencyContactNames:(id *)a3
{
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = sub_1902DD170;
  uint64_t v14 = sub_1902DD0C4;
  uint64_t v15 = 0;
  unsigned __int8 v4 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_190550BE0;
  void v9[3] = &unk_1E568F960;
  v9[4] = &v10;
  void v9[5] = a3;
  objc_msgSend_getEEDEmergencyContactNamesWithReply_(v4, v5, (uint64_t)v9);
  id v6 = *a3;
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)getMotionSensorLogs
{
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = sub_1902DD170;
  uint64_t v14 = sub_1902DD0C4;
  uint64_t v15 = 0;
  while (1)
  {
    unsigned __int8 v4 = (void *)v11[5];
    if (v4) {
      break;
    }
    unsigned __int8 v5 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_190550D3C;
    void v9[3] = &unk_1E568F988;
    v9[4] = &v10;
    objc_msgSend_getMotionSensorLogsWithReply_(v5, v6, (uint64_t)v9);
  }
  id v7 = v4;
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)getAccessoryMotionSensorLogs
{
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = sub_1902DD170;
  uint64_t v14 = sub_1902DD0C4;
  uint64_t v15 = 0;
  while (1)
  {
    unsigned __int8 v4 = (void *)v11[5];
    if (v4) {
      break;
    }
    unsigned __int8 v5 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_190550E84;
    void v9[3] = &unk_1E568F988;
    v9[4] = &v10;
    objc_msgSend_getAccessoryMotionSensorLogsWithReply_(v5, v6, (uint64_t)v9);
  }
  id v7 = v4;
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (unsigned)setTemporaryAuthorizationGranted:(unsigned __int8)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5 orAuditToken:(id *)a6 byLocationButton:(unsigned __int8)a7 voiceInteractionEnabled:(unsigned __int8)a8
{
  int v8 = a8;
  int v9 = a7;
  int v13 = a3;
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = objc_msgSend_synchronousRemoteObject(self, a2, a3);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_190550FD0;
  v19[3] = &unk_1E568F5F0;
  v19[4] = &v20;
  long long v15 = *(_OWORD *)&a6->var0[4];
  v18[0] = *(_OWORD *)a6->var0;
  v18[1] = v15;
  objc_msgSend_setTemporaryAuthorizationGranted_forBundleID_orBundlePath_orAuditToken_byLocationButton_voiceInteractionEnabled_replyBlock_(v14, v16, v13 != 0, a4, a5, v18, v9 != 0, v8 != 0, v19);
  LOBYTE(a5) = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return a5;
}

- (unsigned)setTemporaryPreciseAuthorizationGranted:(unsigned __int8)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  int v7 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  int v8 = objc_msgSend_synchronousRemoteObject(self, a2, a3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1905510CC;
  v11[3] = &unk_1E568F5F0;
  v11[4] = &v12;
  objc_msgSend_setTemporaryPreciseAuthorizationGranted_forBundleID_orBundlePath_replyBlock_(v8, v9, v7 != 0, a4, a5, v11);
  LOBYTE(a5) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a5;
}

- (unsigned)tearDownLocationAuthPromptForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4
{
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v6 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1905511BC;
  void v9[3] = &unk_1E568F5F0;
  v9[4] = &v10;
  objc_msgSend_tearDownLocationAuthPromptForBundleID_orBundlePath_replyBlock_(v6, v7, (uint64_t)a3, a4, v9);
  LOBYTE(a4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return a4;
}

- (__CFArray)copyActivityAlarms
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v3 = objc_msgSend_synchronousRemoteObject(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190551294;
  v7[3] = &unk_1E568F6B8;
  v7[4] = &v8;
  objc_msgSend_getActivitiesWithReplyBlock_(v3, v4, (uint64_t)v7);
  unsigned __int8 v5 = (__CFArray *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unsigned)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 andZoneIdentifier:(__CFString *)a5 andSubIdentityIdentifier:(__CFString *)a6 forBundleID:(__CFString *)a7 orBundlePath:(__CFString *)a8
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v13 = *(void *)&a3;
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v14 = objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1905513C0;
  v17[3] = &unk_1E568F5F0;
  v17[4] = &v18;
  objc_msgSend_setAuthorizationStatusByType_withCorrectiveCompensation_andZoneIdentifier_andSubIdentityIdentifier_forBundleID_orBundlePath_replyBlock_(v14, v15, v13, v12, a5, a6, a7, a8, v17);
  LOBYTE(a8) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return a8;
}

- (unsigned)updatePillButtonChoiceForOutstandingPrompt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  unsigned __int8 v4 = objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1905514A0;
  v7[3] = &unk_1E568F5F0;
  v7[4] = &v8;
  objc_msgSend_updatePillButtonChoiceForOutstandingPrompt_replyBlock_(v4, v5, v3, v7);
  LOBYTE(v3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

- (unsigned)updatePromptedLatitude:(double)a3 longitude:(double)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  int v7 = objc_msgSend_synchronousRemoteObject(self, a2, v4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_190551590;
  v11[3] = &unk_1E568F5F0;
  v11[4] = &v12;
  objc_msgSend_updatePromptedLatitude_longitude_replyBlock_(v7, v8, (uint64_t)v11, a3, a4);
  unsigned __int8 v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (unsigned)setIncidentalUseMode:(int)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_190551688;
  v11[3] = &unk_1E568F5F0;
  v11[4] = &v12;
  objc_msgSend_setIncidentalUseMode_forBundleID_orBundlePath_replyBlock_(v8, v9, v7, a4, a5, v11);
  LOBYTE(a5) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a5;
}

- (unsigned)setLocationButtonUseMode:(int)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_190551780;
  v11[3] = &unk_1E568F5F0;
  v11[4] = &v12;
  objc_msgSend_setLocationButtonUseMode_forBundleID_orBundlePath_replyBlock_(v8, v9, v7, a4, a5, v11);
  LOBYTE(a5) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a5;
}

- (unsigned)setBackgroundIndicatorForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4 enabled:(unsigned __int8)a5
{
  int v5 = a5;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19055187C;
  v11[3] = &unk_1E568F5F0;
  v11[4] = &v12;
  objc_msgSend_setBackgroundIndicatorEnabled_forBundleID_orBundlePath_replyBlock_(v8, v9, v5 != 0, a3, a4, v11);
  LOBYTE(a4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a4;
}

- (unsigned)gyroCalibrationDatabaseSupportsMiniCalibration:(int *)a3
{
  uint64_t v3 = a3;
  uint64_t v8 = 0;
  unsigned __int8 v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v4 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190551958;
  v7[3] = &unk_1E568F618;
  v7[4] = &v8;
  void v7[5] = v3;
  objc_msgSend_gyroCalibrationDatabaseSupportsMiniCalibrationWithReplyBlock_(v4, v5, (uint64_t)v7);
  LOBYTE(v3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

- (unsigned)timeSyncMachTimeStamp:(unint64_t *)a3 oscarTimeStamp:(unint64_t *)a4
{
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v6 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_190551A50;
  void v9[3] = &unk_1E568F9B0;
  void v9[5] = a3;
  void v9[6] = a4;
  v9[4] = &v10;
  objc_msgSend_getOscarTimeSyncWithReplyBlock_(v6, v7, (uint64_t)v9);
  LOBYTE(a4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return a4;
}

- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5
{
  uint64_t v8 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);

  objc_msgSend_notifyPassKitPayment_transaction_info_(v8, v9, (uint64_t)a3, a4, a5);
}

- (void)notifyWeatherForecast:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 latitude:(double)a7 longitude:(double)a8
{
  uint64_t v14 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3);

  objc_msgSend_notifyWeatherForecast_airQualityConditions_hourlyForecasts_dailyForecasts_latitude_longitude_(v14, v15, (uint64_t)a3, a4, a5, a6, a7, a8);
}

@end