@interface BiometricKitXPCServer
+ (void)initialize;
- ($89967B733E8F0E8859294B5D59E7AF0F)userAccountsInfo;
- (ActivityTracker)ongoingBiometricOperation;
- (ActivityTracker)ongoingCatacombSaveTimer;
- (BKCatacomb)catacomb;
- (BOOL)ariadneSignposts;
- (BOOL)catacombFileAccessed;
- (BOOL)catacombRestored;
- (BOOL)fileRadarWithLogs:(id)a3 withDescription:(id)a4;
- (BOOL)getEnabledForUnlock;
- (BOOL)hasMultipleUserAccounts;
- (BOOL)isCatacombAccessible;
- (BOOL)isClassCFileAccessible;
- (BOOL)isDisplayOn;
- (BOOL)isFingerOnWithClient:(id)a3;
- (BOOL)isFingerprintModificationRestricted;
- (BOOL)isXARTAvailableWithClient:(id)a3;
- (BOOL)lastDisplayState;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)setPreferencesValue:(id)a3 forKey:(id)a4 withClient:(id)a5;
- (BOOL)supportsRemovableAccessories;
- (BOOL)templatesAtBoot;
- (BOOL)templatesExistAtBoot;
- (BOOL)validateAllUsers;
- (BiometricAutoBugCapture)biometricABC;
- (BiometricKitXPCServer)init;
- (BiometricOperation)runningBioOp;
- (CatacombStateCache)catacombStateCache;
- (EntitlementABCIssueReporter)reporter;
- (IONotificationPort)notifyport;
- (NSMutableArray)activeBioOpsQueue;
- (NSMutableArray)bioOpsQueue;
- (NSMutableArray)cachedIdentities;
- (NSMutableSet)accessories;
- (NSRecursiveLock)catacombLock;
- (OS_dispatch_queue)biometricABCDispatchQueue;
- (OS_dispatch_queue)cmdDispatchQueue;
- (id)allClients;
- (id)catacombComponentForIdentity:(id)a3;
- (id)catacombFileNameForComponent:(id)a3;
- (id)connectedAccessories;
- (id)createEnrollOperation;
- (id)createMatchEventDictionary:(id *)a3;
- (id)createMatchOperation;
- (id)createPresenceDetectOperation;
- (id)getAccessoryObject:(id *)a3;
- (id)getCalibrationDataInfoWithClient:(id)a3;
- (id)getIdentitiesDatabaseHashForUser:(unsigned int)a3 withClient:(id)a4;
- (id)getIdentitiesDatabaseUUIDForUser:(unsigned int)a3 withClient:(id)a4;
- (id)getIdentityFromUUID:(id)a3 withClient:(id)a4;
- (id)getIdentityObject:(id *)a3;
- (id)getIdentityObjectByUserID:(unsigned int)a3 UUID:(id)a4;
- (id)getLogs:(BOOL)a3 withDetails:(id *)a4;
- (id)getNodeTopologyForIdentity:(id)a3 withClient:(id)a4;
- (id)getProtectedConfigurationForUser:(unsigned int)a3 withClient:(id)a4;
- (id)getSensorInfoWithClient:(id)a3;
- (id)getSystemProtectedConfigurationWithClient:(id)a3;
- (id)getUserKeybagUUIDForUID:(unsigned int)a3;
- (id)hexDumpData:(char *)a3 size:(unint64_t)a4;
- (id)identities;
- (id)identities:(id)a3 withClient:(id)a4;
- (id)identitiesOfComponent:(id)a3;
- (id)identitiesOfUser:(unsigned int)a3;
- (id)pairedAccessories;
- (id)pullAlignmentData;
- (id)pullCalibrationDataWithClient:(id)a3;
- (id)pullCaptureBufferWithClient:(id)a3;
- (id)pullDebugImageData:(BOOL)a3 rotated:(BOOL)a4 hasWidth:(unsigned int *)a5 hasHeight:(unsigned int *)a6 withClient:(id)a7;
- (id)pullMatchPolicyInfoData;
- (id)stateDictionaryWithHints:(os_state_hints_s *)a3;
- (int)archiveCatacombDataForComponent:(id)a3 toArchiver:(id)a4;
- (int)cacheAccessories;
- (int)cacheCatacombInfo;
- (int)cancelWithClient:(id)a3;
- (int)checkCatacombForUser:(unsigned int)a3;
- (int)checkTemplatesValidityForUser:(unsigned int)a3;
- (int)completeEnrollmentWithClient:(id)a3;
- (int)detectPresenceWithOptions:(id)a3 withClient:(id)a4;
- (int)diagnostics:(int)a3 withOptions:(id)a4 passed:(BOOL *)a5 withDetails:(id *)a6 withClient:(id)a7;
- (int)displayStateChanged:(BOOL)a3;
- (int)dropUnlockTokenWithClient:(id)a3;
- (int)enableBackgroundFdet:(BOOL)a3 withClient:(id)a4;
- (int)enableMatchAutoRetry:(BOOL)a3 withClient:(id)a4;
- (int)enroll:(int)a3 forUser:(unsigned int)a4 withOptions:(id)a5 withClient:(id)a6;
- (int)enrollContinue;
- (int)filterIdentities:(id)a3 withFilter:(id)a4;
- (int)forceBioLockoutForUser:(unsigned int)a3 withOptions:(id)a4 withClient:(id)a5;
- (int)getBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5;
- (int)getBiometryAvailability:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5;
- (int)getCatacombSaveListForComponents:(id)a3 list:(id *)a4;
- (int)getCountersignedStoreToken:(id *)a3 withClient:(id)a4;
- (int)getDeviceHardwareState:(unsigned int *)a3 withClient:(id)a4;
- (int)getExpressModeState:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5;
- (int)getFreeIdentityCount:(unint64_t *)a3 forUser:(unsigned int)a4 accessoryGroup:(id)a5 client:(id)a6;
- (int)getLastMatchEvent:(id *)a3 withClient:(id)a4;
- (int)getPeriocularMatchStateForUser:(unsigned int)a3 state:(int64_t *)a4 withClient:(id)a5;
- (int)getPreferencesValue:(id *)a3 forKey:(id)a4 withClient:(id)a5;
- (int)getUserUUIDForUID:(unsigned int)a3 userUUID:(id *)a4;
- (int)getUserUUIDsForUIDs:(id)a3 userUUIDs:(id *)a4;
- (int)handleCatacombUnlock;
- (int)handleFirstUnlock;
- (int)initAutoBugCapture;
- (int)initEnrollOperation:(id)a3 biometricType:(int)a4 userID:(unsigned int)a5 options:(id)a6 client:(id)a7;
- (int)initMatchOperation:(id)a3 filter:(id)a4 options:(id)a5 client:(id)a6;
- (int)initPresenceDetectOperation:(id)a3 options:(id)a4 client:(id)a5;
- (int)isPeriocularEnrollmentSupported:(BOOL *)a3 withClient:(id)a4;
- (int)isValidUser:(unsigned int)a3;
- (int)listAccessories:(id *)a3 client:(id)a4;
- (int)loadCatacomb;
- (int)loadCatacombAfterFirstUnlock;
- (int)loadCatacombForComponent:(id)a3;
- (int)loadCatacombForUser:(unsigned int)a3;
- (int)logCatacombInfo:(id)a3 data:(id)a4;
- (int)match:(id)a3 withOptions:(id)a4 withClient:(id)a5;
- (int)parseAuthDict:(id)a3 toAuthData:(id *)a4;
- (int)pauseBioOperation:(id)a3;
- (int)pauseFaceDetectTimer:(BOOL)a3 withClient:(id)a4;
- (int)performCancelCommand;
- (int)performCompleteSaveCatacombCommand:(id)a3 outBuffer:(id)a4;
- (int)performConfirmSaveCatacombCommand:(id)a3;
- (int)performDisplayStatusChangedCommand:(BOOL)a3;
- (int)performDropUnlockTokenCommand;
- (int)performEnrollCommand:(id)a3;
- (int)performForceBioLockoutCommand:(unsigned int)a3;
- (int)performGetBioDeviceListCommand:(id)a3;
- (int)performGetBiometrickitdInfoCommand:(id *)a3;
- (int)performGetCatacombGroupStateCommand:(id)a3;
- (int)performGetCatacombHashCommand:(unsigned int)a3 outHash:(id *)a4;
- (int)performGetCatacombStateCommand:(id)a3;
- (int)performGetCatacombUUIDCommand:(unsigned int)a3 outUUID:(id *)a4;
- (int)performGetDeviceHardwareStateCommand:(unsigned int *)a3;
- (int)performGetFreeIdentityCountCommand:(unsigned int)a3 group:(id *)a4 outCount:(unsigned int *)a5;
- (int)performGetFreeIdentityCountCommand:(unsigned int)a3 outCount:(unsigned int *)a4;
- (int)performGetIdentitiesListCommand:(unsigned int)a3 outBuffer:(id)a4;
- (int)performGetIdentityRecordsCommand:(id)a3;
- (int)performGetLastMatchEventCommand:(id *)a3;
- (int)performGetProtectedConfigCommand:(unsigned int)a3 outSetCfg:(id *)a4 outEffectiveCfg:(id *)a5;
- (int)performGetSKSLockStateCommand:(unsigned int)a3 outState:(unsigned int *)a4;
- (int)performGetSystemProtectedConfigCommand:(id *)a3;
- (int)performGetTemplatesValidityCommand:(unsigned int)a3 isValid:(BOOL *)a4;
- (int)performIsXARTAvailableCommand:(BOOL *)a3;
- (int)performLoadBioLockoutRecordCommand:(id)a3;
- (int)performLoadCatacombCommand:(id)a3 inData:(id)a4;
- (int)performMatchCommand:(id)a3;
- (int)performNoCatacombCommand:(unsigned int)a3;
- (int)performPrepareSaveCatacombCommand:(id)a3 outDataSize:(unsigned int *)a4;
- (int)performPresenceDetectCommand:(id)a3;
- (int)performRemoveIdentityCommand:(id *)a3;
- (int)performRemoveUserDataCommand:(unsigned int)a3;
- (int)performRequestMaxIdentityCountCommand:(unsigned int *)a3;
- (int)performRequestMessageDataCommand:(unint64_t)a3 size:(unint64_t)a4 outData:(id *)a5;
- (int)performSaveBioLockoutRecordCommand:(id)a3;
- (int)performSetProtectedConfigCommand:(unsigned int)a3 cfg:(id)a4 authData:(id *)a5;
- (int)performSetSystemProtectedConfigCommand:(id)a3 authData:(id *)a4;
- (int)processBioOperation:(id)a3;
- (int)queryIdentityMigrationFailureForUser:(unsigned int)a3 failed:(BOOL *)a4 clear:(BOOL)a5 withClient:(id)a6;
- (int)readCatacombState;
- (int)registerDSID:(unint64_t)a3 withOptions:(id)a4 withClient:(id)a5;
- (int)registerStoreToken:(id)a3 withClient:(id)a4;
- (int)removeAllIdentitiesForUser:(unsigned int)a3 withOptions:(id)a4 withClient:(id)a5;
- (int)removeIdentity:(id)a3 withOptions:(id)a4 withClient:(id)a5;
- (int)removePeriocularTemplatesWithOptions:(id)a3 withClient:(id)a4;
- (int)removeUser:(unsigned int)a3;
- (int)resetAppleConnectCounterWithClient:(id)a3;
- (int)restoreAndSyncTemplates;
- (int)saveCatacomb;
- (int)saveCatacombForComponents:(id)a3;
- (int)saveCatacombForIdentity:(id)a3;
- (int)saveCatacombIfDirtyWithInterval:(double)a3 andDelay:(double)a4;
- (int)saveTemplateListAfterTemplateUpdate;
- (int)serviceStatus:(unsigned int)a3 version:(unsigned int)a4 ordinal:(unint64_t)a5 data:(id)a6 timestamp:(unint64_t)a7;
- (int)setAppleMesaSEPLoggingLevel;
- (int)setDebugImages:(BOOL)a3 withClient:(id)a4;
- (int)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 withOptions:(id)a5 withClient:(id)a6;
- (int)setSystemProtectedConfiguration:(id)a3 withOptions:(id)a4 withClient:(id)a5;
- (int)setTemplate:(id)a3 forIdentity:(id)a4 withClient:(id)a5;
- (int)setUserDSID:(unint64_t)a3 withOptions:(id)a4 withClient:(id)a5;
- (int)startBioOperation:(id)a3;
- (int)startEnrollOperation:(id)a3;
- (int)startMatchOperation:(id)a3;
- (int)startNewMatchAttemptWithClient:(id)a3;
- (int)startPresenceDetectOperation:(id)a3;
- (int)suspendEnrollment:(BOOL)a3 withClient:(id)a4;
- (int)syncTemplateListForUser:(unsigned int)a3;
- (int)unarchiveCatacombDataForComponent:(id)a3 fromUnarchiver:(id)a4 secureData:(id *)a5 identities:(id *)a6;
- (int)updateIdentity:(id)a3 withOptions:(id)a4 withClient:(id)a5;
- (int)updatePropertiesOfIdentities;
- (int)writeStringToPersistentLog:(id)a3;
- (int64_t)getDeviceStateWithClient:(id)a3;
- (int64_t)getFreeIdentityCount:(int)a3 forUser:(unsigned int)a4 withClient:(id)a5;
- (int64_t)getMaxIdentityCount:(int)a3 withClient:(id)a4;
- (int64_t)getProvisioningStateWithClient:(id)a3;
- (int64_t)getSensorCalibrationStatusWithClient:(id)a3;
- (os_state_data_s)osStateHandler:(os_state_hints_s *)a3;
- (unint64_t)identitiesCount;
- (unsigned)catacombVersion;
- (unsigned)currentAccountUserID;
- (unsigned)serviceConnect;
- (unsigned)singleEnrolledUser;
- (void)addIdentityObject:(id)a3;
- (void)addIdentityObjects:(id)a3;
- (void)cacheUserAccountsInfo;
- (void)clearTemplateList;
- (void)clearTemplateListForUser:(unsigned int)a3;
- (void)dealloc;
- (void)deleteUnusedCatacombFiles;
- (void)disconnectingClient:(id)a3;
- (void)doSharedMemoryTransfers;
- (void)handleSharedMemoryTransfer:(unsigned int)a3 withHeader:(id)a4 data:(id)a5;
- (void)logCatacombHashForUser:(unsigned int)a3 catacombHash:(id)a4;
- (void)logCatacombUUIDForUser:(unsigned int)a3 catacombUUID:(id)a4;
- (void)notifyAppIsInactive:(BOOL)a3 withClient:(id)a4;
- (void)postGeneralLockoutStateNotification;
- (void)registerDelegate:(BOOL)a3 withClient:(id)a4;
- (void)removeBioOperationOfClient:(id)a3;
- (void)removeIdentityObject:(id)a3;
- (void)resumeQueuedBioOperation;
- (void)sendStatusMessage:(unsigned int)a3 toClient:(id)a4;
- (void)serviceStatus:(unsigned int)a3 type:(unsigned int)a4 inValue:(void *)a5;
- (void)setAriadneSignposts:(BOOL)a3;
- (void)setBiometricABC:(id)a3;
- (void)setBiometricABCDispatchQueue:(id)a3;
- (void)setCatacombFileAccessed:(BOOL)a3;
- (void)setCatacombRestored:(BOOL)a3;
- (void)setGracePeriod:(unint64_t)a3;
- (void)setReporter:(id)a3;
- (void)setTemplatesAtBoot:(BOOL)a3;
- (void)stopBioOperationsAfterReconnect;
- (void)suspendAllConnections:(BOOL)a3;
- (void)switchToNextBioOperation:(BOOL)a3;
- (void)updateActiveOperationNotification;
- (void)updateActiveOperationNotificationWithOverride:(int)a3;
- (void)updateEnrollmentChangedNotification:(BOOL)a3;
- (void)updateExpressModeState;
- (void)updateExpressModeStateNotification;
- (void)updateExpressModeStateWithEnrollmentCount:(unsigned int)a3;
- (void)updateExpressModeStateWithLockoutState:(unsigned int)a3;
- (void)updateLockoutStateNotification:(unsigned int)a3;
- (void)userListDidUpdate;
- (void)validateUsersKeybagUUIDs;
@end

@implementation BiometricKitXPCServer

- (int)loadCatacombAfterFirstUnlock
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(BiometricKitXPCServer *)self catacombFileAccessed]
    || ![(BiometricKitXPCServer *)self isCatacombAccessible])
  {
    return 0;
  }
  v3 = &_os_log_internal;
  if (__osLog) {
    v4 = __osLog;
  }
  else {
    v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEFAULT, "loadCatacombAfterFirstUnlock: not received first unlock notification yet\n", (uint8_t *)&v9, 2u);
  }
  int v5 = [(BiometricKitXPCServer *)self handleCatacombUnlock];
  if (v5)
  {
    if (__osLog) {
      v6 = __osLog;
    }
    else {
      v6 = v3;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      v10 = "err == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      v14 = &unk_22004A573;
      __int16 v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v17 = 1024;
      int v18 = 3272;
      _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
    if (__osLog) {
      v7 = __osLog;
    }
    else {
      v7 = v3;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 67109120;
      LODWORD(v10) = v5;
      _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_ERROR, "loadCatacombAfterFirstUnlock: -> %d\n", (uint8_t *)&v9, 8u);
    }
  }
  return v5;
}

- (id)getProtectedConfigurationForUser:(unsigned int)a3 withClient:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = &_os_log_internal;
  if (__osLogTrace) {
    v8 = __osLogTrace;
  }
  else {
    v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v33 = v4;
    *(_WORD *)&v33[4] = 2112;
    *(void *)&v33[6] = v6;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "getProtectedConfigurationForUser:withClient: %d %@\n", buf, 0x12u);
  }
  [(BiometricKitXPCServer *)self validateAllUsers];
  id v30 = 0;
  id v31 = 0;
  int v9 = [(BiometricKitXPCServer *)self performGetProtectedConfigCommand:v4 outSetCfg:&v31 outEffectiveCfg:&v30];
  id v10 = v31;
  id v11 = v30;
  if (v9)
  {
    if (__osLog) {
      v27 = __osLog;
    }
    else {
      v27 = v7;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v33 = "err == 0 ";
      *(_WORD *)&v33[8] = 2048;
      *(void *)&v33[10] = v9;
      __int16 v34 = 2080;
      v35 = &unk_22004A573;
      __int16 v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v38 = 1024;
      int v39 = 6609;
      _os_log_impl(&dword_21FFF3000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace) {
      v28 = __osLogTrace;
    }
    else {
      v28 = v7;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v33 = 0;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = v9;
      _os_log_impl(&dword_21FFF3000, v28, OS_LOG_TYPE_ERROR, "getProtectedConfigurationForUser:withClient: -> %@ (%d)\n", buf, 0x12u);
    }
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    if (v12)
    {
      if ([v10 unlockEnabled] != -1)
      {
        __int16 v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "unlockEnabled") != 0);
        [v12 setObject:v13 forKeyedSubscript:@"BKUserCfgTouchIDUnlockEnabled"];
      }
      if ([v10 identificationEnabled] != -1)
      {
        v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "identificationEnabled") != 0);
        [v12 setObject:v14 forKeyedSubscript:@"BKUserCfgTouchIDIdentificationEnabled"];
      }
      if ([v10 loginEnabled] != -1)
      {
        __int16 v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "loginEnabled") != 0);
        [v12 setObject:v15 forKeyedSubscript:@"BKUserCfgTouchIDLoginEnabled"];
      }
      if ([v10 applePayEnabled] != -1)
      {
        v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "applePayEnabled") != 0);
        [v12 setObject:v16 forKeyedSubscript:@"BKUserCfgTouchIDApplePayEnabled"];
      }
      if ([v10 attentionDetectionEnabled] != -1)
      {
        __int16 v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "attentionDetectionEnabled") != 0);
        [v12 setObject:v17 forKeyedSubscript:@"BKUserCfgAttentionDetectionEnabled"];
      }
      if ([v10 periocularMatchEnabled] != -1)
      {
        int v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "periocularMatchEnabled") != 0);
        [v12 setObject:v18 forKeyedSubscript:@"BKUserCfgPeriocularMatchEnabled"];
      }
      if ([v11 unlockEnabled] != -1)
      {
        uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "unlockEnabled") != 0);
        [v12 setObject:v19 forKeyedSubscript:@"BKUserCfgEffectiveTouchIDUnlockEnabled"];
      }
      if ([v11 identificationEnabled] != -1)
      {
        v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "identificationEnabled") != 0);
        [v12 setObject:v20 forKeyedSubscript:@"BKUserCfgEffectiveTouchIDIdentificationEnabled"];
      }
      if ([v11 loginEnabled] != -1)
      {
        v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "loginEnabled") != 0);
        [v12 setObject:v21 forKeyedSubscript:@"BKUserCfgEffectiveTouchIDLoginEnabled"];
      }
      if ([v11 applePayEnabled] != -1)
      {
        v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "applePayEnabled") != 0);
        [v12 setObject:v22 forKeyedSubscript:@"BKUserCfgEffectiveTouchIDApplePayEnabled"];
      }
      if ([v11 attentionDetectionEnabled] != -1)
      {
        v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "attentionDetectionEnabled") != 0);
        [v12 setObject:v23 forKeyedSubscript:@"BKUserCfgEffectiveAttentionDetectionEnabled"];
      }
      if ([v11 periocularMatchEnabled] != -1)
      {
        v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "periocularMatchEnabled") != 0);
        [v12 setObject:v24 forKeyedSubscript:@"BKUserCfgEffectivePeriocularMatchEnabled"];
      }
    }
    else
    {
      if (__osLog) {
        v29 = __osLog;
      }
      else {
        v29 = v7;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v33 = "dict";
        *(_WORD *)&v33[8] = 2048;
        *(void *)&v33[10] = 0;
        __int16 v34 = 2080;
        v35 = &unk_22004A573;
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v38 = 1024;
        int v39 = 6612;
        _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    if (__osLogTrace) {
      v25 = __osLogTrace;
    }
    else {
      v25 = v7;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v33 = v12;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = 0;
      _os_log_impl(&dword_21FFF3000, v25, OS_LOG_TYPE_DEBUG, "getProtectedConfigurationForUser:withClient: -> %@ (%d)\n", buf, 0x12u);
    }
  }

  return v12;
}

- (BOOL)validateAllUsers
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    v3 = __osLogTrace;
  }
  else {
    v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEBUG, "validateAllUsers\n", buf, 2u);
  }
  if (self->_userListChangeDetected)
  {
    id v4 = self->_expressModeState;
    objc_sync_enter(v4);
    id obj = [self->_expressModeState allKeys];
    objc_sync_exit(v4);

    self->_userListChangeDetected = 0;
    id v32 = 0;
    int v5 = [(BiometricKitXPCServer *)self getUserUUIDsForUIDs:obj userUUIDs:&v32];
    id v6 = v32;
    v7 = v6;
    if (v5)
    {
      if (__osLog) {
        v24 = __osLog;
      }
      else {
        v24 = &_os_log_internal;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v35 = "err == 0 ";
        *(_WORD *)&v35[8] = 2048;
        *(void *)&v35[10] = v5;
        *(_WORD *)&v35[18] = 2080;
        *(void *)&v35[20] = &unk_22004A573;
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v38 = 1024;
        int v39 = 3455;
        _os_log_impl(&dword_21FFF3000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      int v21 = 0;
      self->_userListChangeDetected = 1;
    }
    else
    {
      if (!v6)
      {
        v25 = (__osLog ? __osLog : &_os_log_internal);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v35 = "uuidsDict";
          *(_WORD *)&v35[8] = 2048;
          *(void *)&v35[10] = 0;
          *(_WORD *)&v35[18] = 2080;
          *(void *)&v35[20] = &unk_22004A573;
          __int16 v36 = 2080;
          v37 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v38 = 1024;
          int v39 = 3456;
          _os_log_impl(&dword_21FFF3000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id obj = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v8)
      {
        char v10 = 0;
        uint64_t v11 = *(void *)v29;
        *(void *)&long long v9 = 67109634;
        long long v26 = v9;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(obj);
            }
            __int16 v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v14 = objc_msgSend(v7, "objectForKeyedSubscript:", v13, v26);
            id v15 = self->_expressModeState;
            objc_sync_enter(v15);
            v16 = [self->_expressModeState objectForKeyedSubscript:v13];
            objc_sync_exit(v15);

            if (v14) {
              BOOL v17 = v16 == 0;
            }
            else {
              BOOL v17 = 1;
            }
            if (v17 || ([v14 isEqual:v16] & 1) == 0)
            {
              if (__osLog) {
                int v18 = __osLog;
              }
              else {
                int v18 = &_os_log_internal;
              }
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v19 = v18;
                int v20 = [v13 unsignedIntValue];
                *(_DWORD *)buf = v26;
                *(_DWORD *)v35 = v20;
                *(_WORD *)&v35[4] = 2112;
                *(void *)&v35[6] = v14;
                *(_WORD *)&v35[14] = 2112;
                *(void *)&v35[16] = v16;
                _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_DEFAULT, "validateAllUsers: removing user %u because of invalid user UUID (real:%@ vs catacomb:%@)\n", buf, 0x1Cu);
              }
              -[BiometricKitXPCServer removeUser:](self, "removeUser:", [v13 unsignedIntValue]);
              char v10 = 1;
            }
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v8);

        if (v10)
        {
          [(BiometricKitXPCServer *)self saveCatacomb];
          [(BiometricKitXPCServer *)self syncTemplateListForUser:0xFFFFFFFFLL];
          int v21 = 1;
        }
        else
        {
          int v21 = v10 & 1;
        }
      }
      else
      {

        int v21 = 0;
      }
    }
  }
  else
  {
    int v21 = 0;
    v7 = 0;
    id obj = 0;
  }
  if (__osLogTrace) {
    v22 = __osLogTrace;
  }
  else {
    v22 = &_os_log_internal;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v35 = v21 ^ 1;
    _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_DEBUG, "validateAllUsers -> %d\n", buf, 8u);
  }

  return v21 ^ 1;
}

- (BOOL)catacombFileAccessed
{
  return HIBYTE(self->_mkbLockStatusNtfToken);
}

+ (void)initialize
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21FFF3000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Daemon-Common'!\n", v0, 2u);
}

- (BiometricKitXPCServer)init
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  uint64_t v3 = &_os_log_internal;
  if (__osLogTrace) {
    id v4 = __osLogTrace;
  }
  else {
    id v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "init\n", buf, 2u);
  }
  int v5 = dispatch_get_global_queue(0, 0);
  uint64_t v67 = MEMORY[0x263EF8330];
  uint64_t v68 = 3221225472;
  v69 = __29__BiometricKitXPCServer_init__block_invoke;
  v70 = &unk_26454E348;
  id v6 = self;
  v71 = v6;
  v6->_osStateHandle = os_state_add_handler();

  v66.receiver = v6;
  v66.super_class = (Class)BiometricKitXPCServer;
  v7 = [(BiometricKitXPCServer *)&v66 init];
  if (!v7)
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "self";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 743;
    goto LABEL_111;
  }
  mach_port_t v8 = *MEMORY[0x263F0EC88];
  long long v9 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
  *((void *)v7 + 18) = v9;
  if (!v9)
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_notifyport";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 747;
    goto LABEL_111;
  }
  IONotificationPortSetDispatchQueue(v9, MEMORY[0x263EF83A0]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v11 = (void *)*((void *)v7 + 2);
  *((void *)v7 + 2) = v10;

  if (!*((void *)v7 + 2))
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_exportedObjects != ((void *)0)";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 752;
    goto LABEL_111;
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  __int16 v13 = (void *)*((void *)v7 + 20);
  *((void *)v7 + 20) = v12;

  if (!*((void *)v7 + 20))
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_bioOpsQueue != ((void *)0)";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 756;
    goto LABEL_111;
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v15 = (void *)*((void *)v7 + 21);
  *((void *)v7 + 21) = v14;

  if (!*((void *)v7 + 21))
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_activeBioOpsQueue != ((void *)0)";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 760;
    goto LABEL_111;
  }
  v16 = [[ActivityTracker alloc] initWithDescription:@"com.apple.biometrickitd.ongoingBiometricOperation"];
  BOOL v17 = (void *)*((void *)v7 + 24);
  *((void *)v7 + 24) = v16;

  int v18 = [[ActivityTracker alloc] initWithDescription:@"com.apple.biometrickitd.ongoingCatacomSaveTimer"];
  uint64_t v19 = (void *)*((void *)v7 + 23);
  *((void *)v7 + 23) = v18;

  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v21 = (void *)*((void *)v7 + 25);
  *((void *)v7 + 25) = v20;

  if (!*((void *)v7 + 25))
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_cachedIdentities";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 768;
    goto LABEL_111;
  }
  id v22 = objc_alloc_init(MEMORY[0x263F08AE0]);
  v23 = (void *)*((void *)v7 + 26);
  *((void *)v7 + 26) = v22;

  if (!*((void *)v7 + 26))
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_catacombLock != ((void *)0)";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 772;
    goto LABEL_111;
  }
  uint64_t v24 = [MEMORY[0x263EFF9C0] set];
  v25 = (void *)*((void *)v7 + 31);
  *((void *)v7 + 31) = v24;

  if (!*((void *)v7 + 31))
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_accessories";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 776;
    goto LABEL_111;
  }
  dispatch_queue_t v26 = dispatch_queue_create("com.apple.biometrickitd.abcQueue", 0);
  v27 = (void *)*((void *)v7 + 30);
  *((void *)v7 + 30) = v26;

  if (!*((void *)v7 + 30))
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_biometricABCDispatchQueue";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 780;
    goto LABEL_111;
  }
  if ([v7 initAutoBugCapture])
  {
    long long v28 = (__osLog ? __osLog : v3);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FFF3000, v28, OS_LOG_TYPE_ERROR, "Failed to initialize BiometricAutoBugCapture. On systems without SymptomDiagnosticReporter this is expected behavior.\n", buf, 2u);
    }
  }
  long long v29 = [EntitlementABCIssueReporter alloc];
  long long v30 = [v7 biometricABC];
  long long v31 = [(EntitlementABCIssueReporter *)v29 initWithBiometricABC:v30];
  [v7 setReporter:v31];

  uint64_t v32 = +[BKCatacomb catacombWithDir:@"/var/root/Library/Catacomb/"];
  v33 = (void *)*((void *)v7 + 27);
  *((void *)v7 + 27) = v32;

  __int16 v34 = (void *)*((void *)v7 + 27);
  if (!v34)
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_catacomb";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 826;
    goto LABEL_111;
  }
  [v34 recover];
  v35 = objc_alloc_init(CatacombStateCache);
  __int16 v36 = (void *)*((void *)v7 + 28);
  *((void *)v7 + 28) = v35;

  if (!*((void *)v7 + 28))
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_catacombStateCache";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 831;
    goto LABEL_111;
  }
  id v37 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  __int16 v38 = (void *)*((void *)v7 + 14);
  *((void *)v7 + 14) = v37;

  if (!*((void *)v7 + 14))
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_catacombUserUUIDs";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 835;
    goto LABEL_111;
  }
  id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v40 = (void *)*((void *)v7 + 15);
  *((void *)v7 + 15) = v39;

  if (!*((void *)v7 + 15))
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_catacombUserKeybagUUIDs";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 839;
    goto LABEL_111;
  }
  v7[40] = notify_register_check("com.apple.BiometricKit.activeOperation", (int *)v7 + 9) == 0;
  dispatch_queue_t v41 = dispatch_queue_create("com.apple.biometrickitd.activeOpNtf", 0);
  v42 = (void *)*((void *)v7 + 6);
  *((void *)v7 + 6) = v41;

  if (!*((void *)v7 + 6))
  {
    if (__osLog) {
      v57 = __osLog;
    }
    else {
      v57 = v3;
    }
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)buf = 136316162;
    v73 = "_activeOperationNtfQueue";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 844;
    goto LABEL_111;
  }
  [v7 updateActiveOperationNotification];
  v7[76] = notify_register_check("com.apple.BiometricKit.enrollmentChanged", (int *)v7 + 18) == 0;
  [v7 cacheUserAccountsInfo];
  v7[88] = notify_register_check("com.apple.BiometricKit.lockoutStateChanged", (int *)v7 + 21) == 0;
  v7[96] = notify_register_check("com.apple.BiometricKit.expressModeStateChanged", (int *)v7 + 23) == 0;
  v7[136] = notify_register_check("com.apple.BiometricKit.connectedAccessoriesChanged", (int *)v7 + 33) == 0;
  dispatch_queue_t v43 = dispatch_queue_create("com.apple.biometrickitd.cmd", 0);
  v44 = (void *)*((void *)v7 + 19);
  *((void *)v7 + 19) = v43;

  if (*((void *)v7 + 19))
  {
    io_service_t MatchingService = IOServiceGetMatchingService(v8, (CFDictionaryRef)&unk_26D1E0C68);
    *((_DWORD *)v7 + 15) = MatchingService;
    if (MatchingService) {
      goto LABEL_28;
    }
    if (__osLog) {
      v59 = __osLog;
    }
    else {
      v59 = v3;
    }
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v73 = "_backlightService";
      __int16 v74 = 2048;
      uint64_t v75 = 0;
      __int16 v76 = 2080;
      v77 = &unk_22004A573;
      __int16 v78 = 2080;
      v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v80 = 1024;
      int v81 = 876;
      _os_log_impl(&dword_21FFF3000, v59, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (*((_DWORD *)v7 + 15))
    {
LABEL_28:
      v46 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v47 = dispatch_queue_attr_make_with_qos_class(v46, QOS_CLASS_BACKGROUND, 0);
      v48 = dispatch_queue_create("com.apple.biometrickitd.backlight", v47);

      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __29__BiometricKitXPCServer_init__block_invoke_365;
      handler[3] = &unk_26454E370;
      v65 = v7;
      uint32_t v49 = notify_register_dispatch("com.apple.iokit.hid.displayStatus", (int *)v7 + 16, v48, handler);
      if (v49)
      {
        uint32_t v60 = v49;
        v61 = (__osLog ? __osLog : v3);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v73 = "err == 0 ";
          __int16 v74 = 2048;
          uint64_t v75 = v60;
          __int16 v76 = 2080;
          v77 = &unk_22004A573;
          __int16 v78 = 2080;
          v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v80 = 1024;
          int v81 = 889;
          _os_log_impl(&dword_21FFF3000, v61, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
    }
    *((_DWORD *)v7 + 17) = -1;
    v50 = (int *)(v7 + 128);
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __29__BiometricKitXPCServer_init__block_invoke_369;
    v62[3] = &unk_26454E370;
    v51 = v7;
    v63 = v51;
    v52 = (void *)MEMORY[0x263EF83A0];
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", v50, MEMORY[0x263EF83A0], v62);

    v53 = [MEMORY[0x263F841B0] sharedManager];
    [v53 registerUserListUpdateObserver:v51];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v51, (CFNotificationCallback)__PasscodeChangedNotificationCallback, @"com.apple.managedconfiguration.passcodechanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (__osLogTrace) {
      v55 = __osLogTrace;
    }
    else {
      v55 = v3;
    }
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v73 = (const char *)v51;
      _os_log_impl(&dword_21FFF3000, v55, OS_LOG_TYPE_DEBUG, "BiometricKitXPCServer init: -> %p\n", buf, 0xCu);
    }
    goto LABEL_35;
  }
  if (__osLog) {
    v57 = __osLog;
  }
  else {
    v57 = v3;
  }
  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v73 = "_cmdDispatchQueue";
    __int16 v74 = 2048;
    uint64_t v75 = 0;
    __int16 v76 = 2080;
    v77 = &unk_22004A573;
    __int16 v78 = 2080;
    v79 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v80 = 1024;
    int v81 = 865;
LABEL_111:
    _os_log_impl(&dword_21FFF3000, v57, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_112:

  if (__osLogTrace) {
    v58 = __osLogTrace;
  }
  else {
    v58 = v3;
  }
  if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v73 = 0;
    _os_log_impl(&dword_21FFF3000, v58, OS_LOG_TYPE_ERROR, "BiometricKitXPCServer init: -> %p\n", buf, 0xCu);
  }
  v51 = 0;
LABEL_35:

  return v51;
}

uint64_t __29__BiometricKitXPCServer_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) osStateHandler:a2];
}

uint64_t __29__BiometricKitXPCServer_init__block_invoke_365(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(token, &state64);
  if (!result) {
    return [*(id *)(a1 + 32) displayStateChanged:state64 != 0];
  }
  return result;
}

void __29__BiometricKitXPCServer_init__block_invoke_369(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C64ED0]();
  [*(id *)(a1 + 32) validateUsersKeybagUUIDs];
}

- (int)initAutoBugCapture
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [[BiometricAutoBugCapture alloc] initWithDomain:@"BiometricSupport" process:@"biometrickitd" dispatchQueue:self->_biometricABC];
  catacombStateCache = self->_catacombStateCache;
  self->_catacombStateCache = (CatacombStateCache *)v3;

  if (self->_catacombStateCache) {
    return 0;
  }
  if (__osLog) {
    id v6 = __osLog;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136316162;
    mach_port_t v8 = "_biometricABC";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2080;
    id v12 = &unk_22004A573;
    __int16 v13 = 2080;
    id v14 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v15 = 1024;
    int v16 = 953;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
  }
  return 263;
}

- (void)dealloc
{
  uint64_t v3 = *(IONotificationPort **)&self->_connectedAccessoriesChgNtfTokenValid;
  if (v3) {
    IONotificationPortDestroy(v3);
  }
  os_state_remove_handler();
  if (self->_activeOperationNtfTokenValid) {
    notify_cancel(self->_activeOperationNtfToken);
  }
  if (self->_enrollChgNtfTokenValid) {
    notify_cancel(self->_enrollChgNtfToken);
  }
  if (self->_userAccountsInfoValid) {
    notify_cancel(*(_DWORD *)&self->_userAccountsInfo.hasMultipleUserAccounts);
  }
  if (self->_lockoutChgNtfTokenValid) {
    notify_cancel(self->_lockoutChgNtfToken);
  }
  if (LOBYTE(self->_mkbLockStatusNtfToken)) {
    notify_cancel(HIDWORD(self->_catacombUserKeybagUUIDs));
  }
  io_object_t backlightService = self->_backlightService;
  if (backlightService) {
    IOObjectRelease(backlightService);
  }
  int displayStatusNotifyToken = self->_displayStatusNotifyToken;
  if (displayStatusNotifyToken)
  {
    notify_cancel(displayStatusNotifyToken);
    self->_int displayStatusNotifyToken = 0;
  }
  int catacombUserKeybagUUIDs = (int)self->_catacombUserKeybagUUIDs;
  if (catacombUserKeybagUUIDs) {
    notify_cancel(catacombUserKeybagUUIDs);
  }
  v7.receiver = self;
  v7.super_class = (Class)BiometricKitXPCServer;
  [(BiometricKitXPCServer *)&v7 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  int v5 = (const char *)a3;
  id v6 = a4;
  if (__osLogTrace) {
    objc_super v7 = __osLogTrace;
  }
  else {
    objc_super v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v72 = v5;
    __int16 v73 = 2112;
    __int16 v74 = v5;
    __int16 v75 = 2048;
    __int16 v76 = v6;
    __int16 v77 = 2112;
    __int16 v78 = (const char *)v6;
    _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_DEBUG, "listener:shouldAcceptNewConnection: %p(%@) %p(%@)\n", buf, 0x2Au);
  }
  v59 = (char *)v5;
  objc_super v66 = [v6 valueForEntitlement:@"com.apple.private.bmk.allow"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v66 BOOLValue])
  {
    if (isInternalBuild())
    {
      mach_port_t v8 = (__osLog ? __osLog : &_os_log_internal);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __int16 v9 = v8;
        int v10 = [v6 processIdentifier];
        *(_DWORD *)buf = 67109120;
        LODWORD(v72) = v10;
        _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_ERROR, "PID %d does have legacy entitlement com.apple.private.bmk.allow, please set one of fine grained entitlements com.apple.private.biometrickit.allow-*\n", buf, 8u);
      }
    }
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v65 = [v6 valueForEntitlement:@"com.apple.private.biometrickit.allow-default"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v65 BOOLValue]) {
      uint64_t v11 = v11 | 2;
    }
    else {
      uint64_t v11 = v11;
    }
  }
  v64 = [v6 valueForEntitlement:@"com.apple.private.biometrickit.allow-enroll"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v64 BOOLValue]) {
      uint64_t v11 = v11 | 4;
    }
    else {
      uint64_t v11 = v11;
    }
  }
  v63 = [v6 valueForEntitlement:@"com.apple.private.biometrickit.allow-id-mgmt"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v63 BOOLValue]) {
      uint64_t v11 = v11 | 8;
    }
    else {
      uint64_t v11 = v11;
    }
  }
  v62 = [v6 valueForEntitlement:@"com.apple.private.biometrickit.allow-match"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v62 BOOLValue]) {
      uint64_t v11 = v11 | 0x10;
    }
    else {
      uint64_t v11 = v11;
    }
  }
  v61 = [v6 valueForEntitlement:@"com.apple.private.biometrickit.allow-config"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v61 BOOLValue]) {
      uint64_t v11 = v11 | 0x20;
    }
    else {
      uint64_t v11 = v11;
    }
  }
  uint32_t v60 = [v6 valueForEntitlement:@"com.apple.private.biometrickit.allow-internal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v60 BOOLValue])
  {
    uint64_t v11 = v11 | 0x40;
  }
  else if (!v11)
  {
    if (__osLog) {
      v53 = __osLog;
    }
    else {
      v53 = &_os_log_internal;
    }
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = v53;
      int v55 = [v6 processIdentifier];
      *(_DWORD *)buf = 67109120;
      LODWORD(v72) = v55;
      _os_log_impl(&dword_21FFF3000, v54, OS_LOG_TYPE_ERROR, "PID %d is missing entitlement (com.apple.private.biometrickit.*), dropping connection.\n", buf, 8u);
    }
    if (__osLog) {
      v56 = __osLog;
    }
    else {
      v56 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136316162;
    v72 = "acceptConnection";
    __int16 v73 = 2048;
    __int16 v74 = 0;
    __int16 v75 = 2080;
    __int16 v76 = &unk_22004A573;
    __int16 v77 = 2080;
    __int16 v78 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v79 = 1024;
    int v80 = 1092;
    goto LABEL_58;
  }
  if (listener_shouldAcceptNewConnection__onceToken != -1) {
    dispatch_once(&listener_shouldAcceptNewConnection__onceToken, &__block_literal_global);
  }
  if (!listener_shouldAcceptNewConnection__ifc)
  {
    if (__osLog) {
      v56 = __osLog;
    }
    else {
      v56 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136316162;
    v72 = "ifc != ((void *)0)";
    __int16 v73 = 2048;
    __int16 v74 = 0;
    __int16 v75 = 2080;
    __int16 v76 = &unk_22004A573;
    __int16 v77 = 2080;
    __int16 v78 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v79 = 1024;
    int v80 = 1100;
    goto LABEL_58;
  }
  if (!listener_shouldAcceptNewConnection__delegateIfc)
  {
    if (__osLog) {
      v56 = __osLog;
    }
    else {
      v56 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136316162;
    v72 = "delegateIfc != ((void *)0)";
    __int16 v73 = 2048;
    __int16 v74 = 0;
    __int16 v75 = 2080;
    __int16 v76 = &unk_22004A573;
    __int16 v77 = 2080;
    __int16 v78 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v79 = 1024;
    int v80 = 1101;
    goto LABEL_58;
  }
  uint64_t v68 = objc_alloc_init(BiometricKitXPCExportedObject);
  if (!v68)
  {
    if (__osLog) {
      v56 = __osLog;
    }
    else {
      v56 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136316162;
    v72 = "exportedObject != ((void *)0)";
    __int16 v73 = 2048;
    __int16 v74 = 0;
    __int16 v75 = 2080;
    __int16 v76 = &unk_22004A573;
    __int16 v77 = 2080;
    __int16 v78 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v79 = 1024;
    int v80 = 1105;
LABEL_58:
    _os_log_impl(&dword_21FFF3000, v56, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_59:
    v50 = 0;
    BOOL v52 = 0;
    goto LABEL_60;
  }
  id v12 = [(BiometricKitXPCServer *)self biometricABC];
  __int16 v13 = [(BiometricKitXPCServer *)self reporter];
  [v13 setBiometricABC:v12];

  [(BiometricKitXPCExportedObject *)v68 setServer:self];
  [(BiometricKitXPCExportedObject *)v68 setConnection:v6];
  [(BiometricKitXPCExportedObject *)v68 setClientEntitlement:v11];
  [v6 setExportedInterface:listener_shouldAcceptNewConnection__ifc];
  [v6 setExportedObject:v68];
  [v6 setRemoteObjectInterface:listener_shouldAcceptNewConnection__delegateIfc];
  id v14 = (void *)listener_shouldAcceptNewConnection__ifc;
  __int16 v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  int v21 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, v20, objc_opt_class(), 0);
  [v14 setClasses:v21 forSelector:sel_match_options_async_client_replyBlock_ argumentIndex:0 ofReply:0];

  id v22 = (void *)listener_shouldAcceptNewConnection__ifc;
  v23 = (void *)MEMORY[0x263EFFA08];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  long long v30 = objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, v28, v29, objc_opt_class(), 0);
  [v22 setClasses:v30 forSelector:sel_match_options_async_client_replyBlock_ argumentIndex:1 ofReply:0];

  long long v31 = (void *)listener_shouldAcceptNewConnection__ifc;
  uint64_t v32 = (void *)MEMORY[0x263EFFA08];
  uint64_t v33 = objc_opt_class();
  __int16 v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
  [v31 setClasses:v34 forSelector:sel_setPreferencesValue_forKey_client_replyBlock_ argumentIndex:0 ofReply:0];

  v35 = (void *)listener_shouldAcceptNewConnection__ifc;
  __int16 v36 = (void *)MEMORY[0x263EFFA08];
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  dispatch_queue_t v43 = objc_msgSend(v36, "setWithObjects:", v37, v38, v39, v40, v41, v42, objc_opt_class(), 0);
  [v35 setClasses:v43 forSelector:sel_enroll_user_options_async_client_replyBlock_ argumentIndex:2 ofReply:0];

  v44 = (void *)listener_shouldAcceptNewConnection__ifc;
  v45 = (void *)MEMORY[0x263EFFA08];
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  uint32_t v49 = objc_msgSend(v45, "setWithObjects:", v46, v47, v48, objc_opt_class(), 0);
  [v44 setClasses:v49 forSelector:sel_removePeriocularTemplatesWithOptions_async_client_replyBlock_ argumentIndex:0 ofReply:0];

  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __60__BiometricKitXPCServer_listener_shouldAcceptNewConnection___block_invoke_603;
  v69[3] = &unk_26454E3B8;
  v69[4] = self;
  v50 = v68;
  v70 = v50;
  [v6 setInvalidationHandler:v69];

  v51 = self->_exportedObjects;
  objc_sync_enter(v51);
  [(NSMutableSet *)self->_exportedObjects addObject:v50];
  if (!self->_connectionsSuspended) {
    [v6 resume];
  }
  objc_sync_exit(v51);

  BOOL v52 = 1;
LABEL_60:
  if (__osLogTrace) {
    v57 = __osLogTrace;
  }
  else {
    v57 = &_os_log_internal;
  }
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v72) = v52;
    _os_log_impl(&dword_21FFF3000, v57, OS_LOG_TYPE_DEBUG, "listener:shouldAcceptNewConnection: -> %d\n", buf, 8u);
  }

  return v52;
}

uint64_t __60__BiometricKitXPCServer_listener_shouldAcceptNewConnection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1E30D8];
  v1 = (void *)listener_shouldAcceptNewConnection__ifc;
  listener_shouldAcceptNewConnection__ifc = v0;

  listener_shouldAcceptNewConnection__delegateIfc = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1E8F50];
  return MEMORY[0x270F9A758]();
}

void __60__BiometricKitXPCServer_listener_shouldAcceptNewConnection___block_invoke_603(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "clients", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) disconnectingClient:*(void *)(*((void *)&v9 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 40) terminate];
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 24))
  {
    mach_port_t v8 = [*(id *)(a1 + 40) connection];
    [v8 resume];

    uint64_t v7 = *(void *)(a1 + 32);
  }
  [*(id *)(v7 + 16) removeObject:*(void *)(a1 + 40)];
  objc_sync_exit(v2);
}

- (void)suspendAllConnections:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL connectionsSuspended = self->_connectionsSuspended;
    *(_DWORD *)buf = 67109376;
    BOOL v23 = v3;
    __int16 v24 = 1024;
    BOOL v25 = connectionsSuspended;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "suspendAllConnections: %u (suspended:%u)\n", buf, 0xEu);
  }
  mach_port_t v8 = self->_exportedObjects;
  objc_sync_enter(v8);
  if (self->_connectionsSuspended != v3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v9 = self->_exportedObjects;
    uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          __int16 v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (v3)
          {
            uint64_t v14 = [v13 connection];
            [v14 suspend];
          }
          else
          {
            uint64_t v14 = objc_msgSend(v13, "connection", (void)v17);
            [v14 resume];
          }
        }
        uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    self->_BOOL connectionsSuspended = v3;
  }
  objc_sync_exit(v8);

  if (__osLogTrace) {
    __int16 v15 = __osLogTrace;
  }
  else {
    __int16 v15 = v5;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    BOOL v16 = self->_connectionsSuspended;
    *(_DWORD *)buf = 67109120;
    BOOL v23 = v16;
    _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_DEBUG, "suspendAllConnections: -> void (suspended:%u)\n", buf, 8u);
  }
}

- (os_state_data_s)osStateHandler:(os_state_hints_s *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v5 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unsigned int var0 = a3->var0;
    var1 = a3->var1;
    unsigned int var2 = a3->var2;
    unsigned int var3 = a3->var3;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)uint64_t v28 = var0;
    *(_WORD *)&v28[4] = 2080;
    *(void *)&v28[6] = var1;
    *(_WORD *)&v28[14] = 1024;
    *(_DWORD *)&v28[16] = var2;
    LOWORD(v29) = 1024;
    *(_DWORD *)((char *)&v29 + 2) = var3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "osStateHandler <- hints(osh_version:%d, osh_requestor:'%s', osh_api:%d, osh_reason:%d)\n", buf, 0x1Eu);
  }
  uint64_t v11 = [(BiometricKitXPCServer *)self stateDictionaryWithHints:a3];
  if (v11)
  {
    id v26 = 0;
    long long v12 = [MEMORY[0x263F08AC0] dataWithPropertyList:v11 format:200 options:0 error:&v26];
    id v13 = v26;
    if (v12)
    {
      if ((unint64_t)[v12 length] >= 0xFFFFFFFF)
      {
        if (__osLog) {
          BOOL v25 = __osLog;
        }
        else {
          BOOL v25 = v5;
        }
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_41;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)uint64_t v28 = "[data length] < 4294967295U";
        *(_WORD *)&v28[8] = 2048;
        *(void *)&v28[10] = 0;
        *(_WORD *)&v28[18] = 2080;
        uint64_t v29 = &unk_22004A573;
        __int16 v30 = 2080;
        long long v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v32 = 1024;
        int v33 = 1230;
        int v21 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
      }
      else
      {
        uint64_t v14 = (os_state_data_s *)malloc_type_calloc(1uLL, [v12 length] + 200, 0xE3EAFA13uLL);
        if (v14)
        {
          __int16 v15 = v14;
          v14->unsigned int var0 = 1;
          v14->var1.var1 = [v12 length];
          __strlcpy_chk();
          id v16 = v12;
          memcpy(v15->var4, (const void *)[v16 bytes], objc_msgSend(v16, "length"));
LABEL_11:

          goto LABEL_13;
        }
        if (__osLog) {
          BOOL v25 = __osLog;
        }
        else {
          BOOL v25 = v5;
        }
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
LABEL_41:
          __int16 v15 = 0;
          goto LABEL_11;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)uint64_t v28 = "state";
        *(_WORD *)&v28[8] = 2048;
        *(void *)&v28[10] = 0;
        *(_WORD *)&v28[18] = 2080;
        uint64_t v29 = &unk_22004A573;
        __int16 v30 = 2080;
        long long v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v32 = 1024;
        int v33 = 1233;
        int v21 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
      }
      id v22 = v25;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      uint32_t v24 = 48;
    }
    else
    {
      if (__osLog) {
        long long v19 = __osLog;
      }
      else {
        long long v19 = v5;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)uint64_t v28 = "data";
        *(_WORD *)&v28[8] = 2048;
        *(void *)&v28[10] = 0;
        *(_WORD *)&v28[18] = 2080;
        uint64_t v29 = &unk_22004A573;
        __int16 v30 = 2080;
        long long v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v32 = 1024;
        int v33 = 1229;
        _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      if (__osLog) {
        long long v20 = __osLog;
      }
      else {
        long long v20 = v5;
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)uint64_t v28 = v13;
      int v21 = "osStateHandler: %{public}@\n";
      id v22 = v20;
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
      uint32_t v24 = 12;
    }
    _os_log_impl(&dword_21FFF3000, v22, v23, v21, buf, v24);
    goto LABEL_41;
  }
  __int16 v15 = 0;
LABEL_13:
  if (__osLogTrace) {
    long long v17 = __osLogTrace;
  }
  else {
    long long v17 = v5;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)uint64_t v28 = v15;
    _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_DEBUG, "osStateHandler -> %p\n", buf, 0xCu);
  }

  return v15;
}

- (id)stateDictionaryWithHints:(os_state_hints_s *)a3
{
  if (a3->var2 == 3)
  {
    BOOL v3 = [MEMORY[0x263F2AA60] sharedInstance];
    uint64_t v4 = [v3 stateDictionary];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (int)enroll:(int)a3 forUser:(unsigned int)a4 withOptions:(id)a5 withClient:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = &_os_log_internal;
  if (__osLogTrace) {
    id v13 = __osLogTrace;
  }
  else {
    id v13 = &_os_log_internal;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 67109890;
    *(_DWORD *)id v26 = v8;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v7;
    *(_WORD *)uint64_t v27 = 2112;
    *(void *)&v27[2] = v10;
    *(_WORD *)uint64_t v28 = 2112;
    *(void *)&v28[2] = v11;
    _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_DEFAULT, "enroll:forUser:withOptions:withClient: %d %d %@ %@\n", (uint8_t *)&v25, 0x22u);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (isEphemeralMultiUser())
  {
    if (__osLog) {
      id v22 = __osLog;
    }
    else {
      id v22 = v12;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    int v25 = 136316162;
    *(void *)id v26 = "!isEphemeralMultiUser()";
    *(_WORD *)&v26[8] = 2048;
    *(void *)uint64_t v27 = 0;
    *(_WORD *)&v27[8] = 2080;
    *(void *)uint64_t v28 = &unk_22004A573;
    *(_WORD *)&v28[8] = 2080;
    uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v30 = 1024;
    int v31 = 1274;
    goto LABEL_35;
  }
  if ([(BiometricKitXPCServer *)self isFingerprintModificationRestricted])
  {
    if (__osLog) {
      id v22 = __osLog;
    }
    else {
      id v22 = v12;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    int v25 = 136316162;
    *(void *)id v26 = "![self isFingerprintModificationRestricted]";
    *(_WORD *)&v26[8] = 2048;
    *(void *)uint64_t v27 = 0;
    *(_WORD *)&v27[8] = 2080;
    *(void *)uint64_t v28 = &unk_22004A573;
    *(_WORD *)&v28[8] = 2080;
    uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v30 = 1024;
    int v31 = 1275;
LABEL_35:
    _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
LABEL_36:
    __int16 v15 = 0;
    int v17 = 257;
    goto LABEL_13;
  }
  uint64_t v14 = [(BiometricKitXPCServer *)self createEnrollOperation];
  if (v14)
  {
    __int16 v15 = (void *)v14;
    int v16 = [(BiometricKitXPCServer *)self initEnrollOperation:v14 biometricType:v8 userID:v7 options:v10 client:v11];
    if (v16)
    {
      int v17 = v16;
      if (__osLog) {
        uint32_t v24 = __osLog;
      }
      else {
        uint32_t v24 = v12;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = 136316162;
        *(void *)id v26 = "err == 0 ";
        *(_WORD *)&v26[8] = 2048;
        *(void *)uint64_t v27 = v17;
        *(_WORD *)&v27[8] = 2080;
        *(void *)uint64_t v28 = &unk_22004A573;
        *(_WORD *)&v28[8] = 2080;
        uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v30 = 1024;
        int v31 = 1281;
LABEL_53:
        _os_log_impl(&dword_21FFF3000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
      }
    }
    else
    {
      int v17 = [(BiometricKitXPCServer *)self processBioOperation:v15];
      if (v17)
      {
        uint32_t v24 = (__osLog ? __osLog : v12);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          int v25 = 136316162;
          *(void *)id v26 = "err == 0 ";
          *(_WORD *)&v26[8] = 2048;
          *(void *)uint64_t v27 = v17;
          *(_WORD *)&v27[8] = 2080;
          *(void *)uint64_t v28 = &unk_22004A573;
          *(_WORD *)&v28[8] = 2080;
          uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v30 = 1024;
          int v31 = 1284;
          goto LABEL_53;
        }
      }
    }
  }
  else
  {
    if (__osLog) {
      os_log_type_t v23 = __osLog;
    }
    else {
      os_log_type_t v23 = v12;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136316162;
      *(void *)id v26 = "enrollOperation";
      *(_WORD *)&v26[8] = 2048;
      *(void *)uint64_t v27 = 0;
      *(_WORD *)&v27[8] = 2080;
      *(void *)uint64_t v28 = &unk_22004A573;
      *(_WORD *)&v28[8] = 2080;
      uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v30 = 1024;
      int v31 = 1278;
      _os_log_impl(&dword_21FFF3000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
    }
    __int16 v15 = 0;
    int v17 = 260;
  }
LABEL_13:
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (__osLogTrace) {
    long long v18 = __osLogTrace;
  }
  else {
    long long v18 = v12;
  }
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v25 = 67109120;
      *(_DWORD *)id v26 = v17;
      long long v19 = v18;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
LABEL_23:
      _os_log_impl(&dword_21FFF3000, v19, v20, "enroll:forUser:withOptions:withClient: -> %d\n", (uint8_t *)&v25, 8u);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 67109120;
    *(_DWORD *)id v26 = 0;
    long long v19 = v18;
    os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
    goto LABEL_23;
  }

  return v17;
}

- (id)createEnrollOperation
{
  id v2 = objc_alloc_init(BiometricEnrollOperation);
  return v2;
}

- (int)initEnrollOperation:(id)a3 biometricType:(int)a4 userID:(unsigned int)a5 options:(id)a6 client:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = v13;
  if (!v11)
  {
    if (__osLog) {
      os_log_type_t v20 = __osLog;
    }
    else {
      os_log_type_t v20 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    int v23 = 136316162;
    uint32_t v24 = "operation";
    __int16 v25 = 2048;
    uint64_t v26 = 0;
    __int16 v27 = 2080;
    uint64_t v28 = &unk_22004A573;
    __int16 v29 = 2080;
    __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v31 = 1024;
    int v32 = 1314;
LABEL_18:
    _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v23, 0x30u);
    goto LABEL_30;
  }
  if (!v13)
  {
    if (__osLog) {
      os_log_type_t v20 = __osLog;
    }
    else {
      os_log_type_t v20 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    int v23 = 136316162;
    uint32_t v24 = "client";
    __int16 v25 = 2048;
    uint64_t v26 = 0;
    __int16 v27 = 2080;
    uint64_t v28 = &unk_22004A573;
    __int16 v29 = 2080;
    __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v31 = 1024;
    int v32 = 1315;
    goto LABEL_18;
  }
  [v11 setPriority:0x7FFFFFFFFFFFFF9BLL];
  [v11 setUserID:v9];
  [v11 setClient:v14];
  int v15 = -[BiometricKitXPCServer parseAuthDict:toAuthData:](self, "parseAuthDict:toAuthData:", v12, [v11 authData]);
  if (v15)
  {
    LODWORD(v16) = v15;
    if (__osLog) {
      int v21 = __osLog;
    }
    else {
      int v21 = &_os_log_internal;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136316162;
      uint32_t v24 = "err == 0 ";
      __int16 v25 = 2048;
      uint64_t v26 = (int)v16;
      __int16 v27 = 2080;
      uint64_t v28 = &unk_22004A573;
      __int16 v29 = 2080;
      __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v31 = 1024;
      int v32 = 1322;
      _os_log_impl(&dword_21FFF3000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v23, 0x30u);
    }
  }
  else
  {
    int v16 = [v12 objectForKeyedSubscript:@"BKOptionEnrollAccessoryGroup"];
    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v17 = [v16 type];
        *(_DWORD *)[v11 deviceGroup] = v17;
        long long v18 = [v16 uuid];
        objc_msgSend(v18, "getUUIDBytes:", objc_msgSend(v11, "deviceGroup") + 4);

        LODWORD(v16) = 0;
        goto LABEL_7;
      }
      if (__osLog) {
        id v22 = __osLog;
      }
      else {
        id v22 = &_os_log_internal;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = 136316162;
        uint32_t v24 = "[value isKindOfClass:[BiometricKitAccessoryGroup class]]";
        __int16 v25 = 2048;
        uint64_t v26 = 0;
        __int16 v27 = 2080;
        uint64_t v28 = &unk_22004A573;
        __int16 v29 = 2080;
        __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v31 = 1024;
        int v32 = 1326;
        _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v23, 0x30u);
      }

LABEL_30:
      LODWORD(v16) = 258;
    }
  }
LABEL_7:

  return (int)v16;
}

- (int)startEnrollOperation:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = (char *)a3;
  uint64_t v5 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    int v17 = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "startEnrollOperation: %@\n", (uint8_t *)&v16, 0xCu);
  }
  if (!v4)
  {
    if (__osLog) {
      id v13 = __osLog;
    }
    else {
      id v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      int v17 = "operation";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      int v21 = &unk_22004A573;
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 1347;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    int v11 = 258;
    goto LABEL_39;
  }
  int v7 = -[BiometricKitXPCServer isValidUser:](self, "isValidUser:", [v4 userID]);
  if (v7)
  {
    int v11 = v7;
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = v5;
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    int v16 = 136316162;
    int v17 = "err == 0 ";
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    __int16 v20 = 2080;
    int v21 = &unk_22004A573;
    __int16 v22 = 2080;
    int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v24 = 1024;
    int v25 = 1351;
LABEL_38:
    _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    goto LABEL_39;
  }
  int v8 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", [v4 userID]);
  if (v8)
  {
    int v11 = v8;
    if (__osLog) {
      uint64_t v14 = __osLog;
    }
    else {
      uint64_t v14 = v5;
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    int v16 = 136316162;
    int v17 = "err == 0 ";
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    __int16 v20 = 2080;
    int v21 = &unk_22004A573;
    __int16 v22 = 2080;
    int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v24 = 1024;
    int v25 = 1355;
    goto LABEL_38;
  }
  int v9 = [(BiometricKitXPCServer *)self performEnrollCommand:v4];
  if (!v9)
  {
    if (__osLogTrace) {
      id v10 = __osLogTrace;
    }
    else {
      id v10 = v5;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 67109120;
      LODWORD(v17) = 0;
      _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "startEnrollOperation: -> %d\n", (uint8_t *)&v16, 8u);
    }
    int v11 = 0;
    goto LABEL_16;
  }
  int v11 = v9;
  if (__osLog) {
    uint64_t v14 = __osLog;
  }
  else {
    uint64_t v14 = v5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136316162;
    int v17 = "err == 0 ";
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    __int16 v20 = 2080;
    int v21 = &unk_22004A573;
    __int16 v22 = 2080;
    int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v24 = 1024;
    int v25 = 1358;
    goto LABEL_38;
  }
LABEL_39:
  if (__osLogTrace) {
    int v15 = __osLogTrace;
  }
  else {
    int v15 = v5;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v16 = 67109120;
    LODWORD(v17) = v11;
    _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "startEnrollOperation: -> %d\n", (uint8_t *)&v16, 8u);
  }
LABEL_16:

  return v11;
}

- (int)match:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v8 = (char *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = &_os_log_internal;
  if (__osLogTrace) {
    id v12 = __osLogTrace;
  }
  else {
    id v12 = &_os_log_internal;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412802;
    int v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    __int16 v29 = v10;
    _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_DEFAULT, "match:withOptions:withClient: %@ %@ %@\n", (uint8_t *)&v24, 0x20u);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  notify_post("com.apple.BiometricKit.matchOperationStartAttempted");
  if (isEphemeralMultiUser())
  {
    if (__osLog) {
      int v21 = __osLog;
    }
    else {
      int v21 = v11;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136316162;
      int v25 = "!isEphemeralMultiUser()";
      __int16 v26 = 2048;
      id v27 = 0;
      __int16 v28 = 2080;
      __int16 v29 = &unk_22004A573;
      __int16 v30 = 2080;
      __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v32 = 1024;
      int v33 = 1383;
      _os_log_impl(&dword_21FFF3000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    }
    uint64_t v14 = 0;
    int v16 = 257;
  }
  else
  {
    uint64_t v13 = [(BiometricKitXPCServer *)self createMatchOperation];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      int v15 = [(BiometricKitXPCServer *)self initMatchOperation:v13 filter:v8 options:v9 client:v10];
      if (v15)
      {
        int v16 = v15;
        if (__osLog) {
          int v23 = __osLog;
        }
        else {
          int v23 = v11;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          int v24 = 136316162;
          int v25 = "err == 0 ";
          __int16 v26 = 2048;
          id v27 = (id)v16;
          __int16 v28 = 2080;
          __int16 v29 = &unk_22004A573;
          __int16 v30 = 2080;
          __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v32 = 1024;
          int v33 = 1389;
LABEL_46:
          _os_log_impl(&dword_21FFF3000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
        }
      }
      else
      {
        int v16 = [(BiometricKitXPCServer *)self processBioOperation:v14];
        if (v16)
        {
          int v23 = (__osLog ? __osLog : v11);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            int v24 = 136316162;
            int v25 = "err == 0 ";
            __int16 v26 = 2048;
            id v27 = (id)v16;
            __int16 v28 = 2080;
            __int16 v29 = &unk_22004A573;
            __int16 v30 = 2080;
            __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            __int16 v32 = 1024;
            int v33 = 1392;
            goto LABEL_46;
          }
        }
      }
    }
    else
    {
      if (__osLog) {
        __int16 v22 = __osLog;
      }
      else {
        __int16 v22 = v11;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v24 = 136316162;
        int v25 = "matchOperation";
        __int16 v26 = 2048;
        id v27 = 0;
        __int16 v28 = 2080;
        __int16 v29 = &unk_22004A573;
        __int16 v30 = 2080;
        __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v32 = 1024;
        int v33 = 1386;
        _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
      }
      uint64_t v14 = 0;
      int v16 = 260;
    }
  }
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (__osLogTrace) {
    int v17 = __osLogTrace;
  }
  else {
    int v17 = v11;
  }
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v24 = 67109120;
      LODWORD(v25) = v16;
      __int16 v18 = v17;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
LABEL_22:
      _os_log_impl(&dword_21FFF3000, v18, v19, "match:withOptions:withClient: -> %d\n", (uint8_t *)&v24, 8u);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 67109120;
    LODWORD(v25) = 0;
    __int16 v18 = v17;
    os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
    goto LABEL_22;
  }

  return v16;
}

- (id)createMatchOperation
{
  id v2 = objc_alloc_init(BiometricMatchOperation);
  return v2;
}

- (int)initMatchOperation:(id)a3 filter:(id)a4 options:(id)a5 client:(id)a6
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  __int16 v64 = 0;
  __int16 v63 = 0;
  uint64_t v62 = 0;
  if (!v10)
  {
    if (__osLog) {
      v45 = __osLog;
    }
    else {
      v45 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_81;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v67 = "operation";
    __int16 v68 = 2048;
    uint64_t v69 = 0;
    __int16 v70 = 2080;
    v71 = &unk_22004A573;
    __int16 v72 = 2080;
    __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v74 = 1024;
    int v75 = 1431;
    goto LABEL_80;
  }
  if (!v13)
  {
    if (__osLog) {
      v45 = __osLog;
    }
    else {
      v45 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_81;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v67 = "client";
    __int16 v68 = 2048;
    uint64_t v69 = 0;
    __int16 v70 = 2080;
    v71 = &unk_22004A573;
    __int16 v72 = 2080;
    __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v74 = 1024;
    int v75 = 1432;
LABEL_80:
    _os_log_impl(&dword_21FFF3000, v45, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_81:
    __int16 v28 = 0;
    __int16 v29 = 0;
    int Data = 258;
    goto LABEL_62;
  }
  if (!v11 || (v61 = 0xFFFFFFFFLL, (int v15 = dictionaryGetInteger()) == 0))
  {
    if ([(BiometricKitXPCServer *)self hasMultipleUserAccounts])
    {
      uint64_t v16 = 0xFFFFFFFFLL;
      if (v12) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v16 = [(BiometricKitXPCServer *)self currentAccountUserID];
      if (v12)
      {
LABEL_7:
        uint64_t v17 = objc_msgSend(v12, "objectForKeyedSubscript:", @"BKOptionMatchSelectedIdentities", self);
        int v55 = (void *)v17;
        unsigned int v56 = v16;
        if (v17)
        {
          __int16 v18 = (void *)v17;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (__osLog) {
              v50 = __osLog;
            }
            else {
              v50 = &_os_log_internal;
            }
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v67 = "[array isKindOfClass:[NSArray class]]";
              __int16 v68 = 2048;
              uint64_t v69 = 0;
              __int16 v70 = 2080;
              v71 = &unk_22004A573;
              __int16 v72 = 2080;
              __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              __int16 v74 = 1024;
              int v75 = 1450;
              _os_log_impl(&dword_21FFF3000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }
            __int16 v28 = 0;
            __int16 v29 = 0;
            goto LABEL_182;
          }
          os_log_type_t v19 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", 20 * objc_msgSend(v18, "count") + 4);
          if (!v19)
          {
            if (__osLog) {
              v51 = __osLog;
            }
            else {
              v51 = &_os_log_internal;
            }
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v67 = "selectedIdentitiesBlob";
              __int16 v68 = 2048;
              uint64_t v69 = 0;
              __int16 v70 = 2080;
              v71 = &unk_22004A573;
              __int16 v72 = 2080;
              __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              __int16 v74 = 1024;
              int v75 = 1453;
              _os_log_impl(&dword_21FFF3000, v51, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }
            __int16 v28 = 0;
            __int16 v29 = 0;
            int Data = 260;
            goto LABEL_69;
          }
          v54 = v14;
          id v53 = v19;
          __int16 v20 = (_DWORD *)[v53 mutableBytes];
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v21 = v18;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v57 objects:v65 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v58;
            while (2)
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v58 != v24) {
                  objc_enumerationMutation(v21);
                }
                __int16 v26 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (__osLog) {
                    v44 = __osLog;
                  }
                  else {
                    v44 = &_os_log_internal;
                  }
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    uint64_t v67 = "[identity isKindOfClass:[BiometricKitIdentity class]]";
                    __int16 v68 = 2048;
                    uint64_t v69 = 0;
                    __int16 v70 = 2080;
                    v71 = &unk_22004A573;
                    __int16 v72 = 2080;
                    __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                    __int16 v74 = 1024;
                    int v75 = 1456;
                    _os_log_impl(&dword_21FFF3000, v44, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                  }

                  __int16 v29 = 0;
                  int Data = 258;
                  __int16 v28 = v53;
                  uint64_t v14 = v54;
                  goto LABEL_69;
                }
                v20[5 * *v20 + 1] = [v26 userID];
                id v27 = [v26 uuid];
                [v27 getUUIDBytes:&v20[5 * *v20 + 2]];

                ++*v20;
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v57 objects:v65 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          __int16 v28 = v53;
          uint64_t v14 = v54;
        }
        else
        {
          __int16 v28 = 0;
        }
        int Bool = dictionaryGetBool();
        if (Bool)
        {
          int Data = Bool;
          if (__osLog) {
            uint64_t v47 = __osLog;
          }
          else {
            uint64_t v47 = &_os_log_internal;
          }
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v67 = "err == 0 ";
            __int16 v68 = 2048;
            uint64_t v69 = Data;
            __int16 v70 = 2080;
            v71 = &unk_22004A573;
            __int16 v72 = 2080;
            __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            __int16 v74 = 1024;
            int v75 = 1464;
            _os_log_impl(&dword_21FFF3000, v47, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          __int16 v29 = 0;
          goto LABEL_69;
        }
        int Data = dictionaryGetData();
        id v34 = 0;
        __int16 v29 = v34;
        if (Data)
        {
          if (__osLog) {
            uint64_t v48 = __osLog;
          }
          else {
            uint64_t v48 = &_os_log_internal;
          }
          if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            goto LABEL_69;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v67 = "err == 0 ";
          __int16 v68 = 2048;
          uint64_t v69 = Data;
          __int16 v70 = 2080;
          v71 = &unk_22004A573;
          __int16 v72 = 2080;
          __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v74 = 1024;
          int v75 = 1467;
        }
        else
        {
          BOOL v31 = v34 != 0;
          int v35 = dictionaryGetBool();
          if (v35)
          {
            int Data = v35;
            if (__osLog) {
              uint64_t v48 = __osLog;
            }
            else {
              uint64_t v48 = &_os_log_internal;
            }
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
              goto LABEL_69;
            }
            *(_DWORD *)buf = 136316162;
            uint64_t v67 = "err == 0 ";
            __int16 v68 = 2048;
            uint64_t v69 = Data;
            __int16 v70 = 2080;
            v71 = &unk_22004A573;
            __int16 v72 = 2080;
            __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            __int16 v74 = 1024;
            int v75 = 1473;
          }
          else
          {
            int v36 = dictionaryGetBool();
            if (v36)
            {
              int Data = v36;
              if (__osLog) {
                uint64_t v48 = __osLog;
              }
              else {
                uint64_t v48 = &_os_log_internal;
              }
              if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                goto LABEL_69;
              }
              *(_DWORD *)buf = 136316162;
              uint64_t v67 = "err == 0 ";
              __int16 v68 = 2048;
              uint64_t v69 = Data;
              __int16 v70 = 2080;
              v71 = &unk_22004A573;
              __int16 v72 = 2080;
              __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              __int16 v74 = 1024;
              int v75 = 1476;
            }
            else
            {
              unint64_t v61 = 0;
              int Integer = dictionaryGetInteger();
              if (Integer)
              {
                int Data = Integer;
                if (__osLog) {
                  uint64_t v48 = __osLog;
                }
                else {
                  uint64_t v48 = &_os_log_internal;
                }
                if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_69;
                }
                *(_DWORD *)buf = 136316162;
                uint64_t v67 = "err == 0 ";
                __int16 v68 = 2048;
                uint64_t v69 = Data;
                __int16 v70 = 2080;
                v71 = &unk_22004A573;
                __int16 v72 = 2080;
                __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                __int16 v74 = 1024;
                int v75 = 1480;
              }
              else
              {
                unint64_t v30 = v61;
                if (HIDWORD(v61))
                {
                  if (__osLog) {
                    uint32_t v49 = __osLog;
                  }
                  else {
                    uint32_t v49 = &_os_log_internal;
                  }
                  if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_182;
                  }
                  *(_DWORD *)buf = 136316162;
                  uint64_t v67 = "intVal == (BiometricKitMatchUseCase)intVal";
                  __int16 v68 = 2048;
                  uint64_t v69 = 0;
                  __int16 v70 = 2080;
                  v71 = &unk_22004A573;
                  __int16 v72 = 2080;
                  __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                  __int16 v74 = 1024;
                  int v75 = 1481;
                  goto LABEL_181;
                }
                int v38 = dictionaryGetBool();
                if (v38)
                {
                  int Data = v38;
                  if (__osLog) {
                    uint64_t v48 = __osLog;
                  }
                  else {
                    uint64_t v48 = &_os_log_internal;
                  }
                  if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_69;
                  }
                  *(_DWORD *)buf = 136316162;
                  uint64_t v67 = "err == 0 ";
                  __int16 v68 = 2048;
                  uint64_t v69 = Data;
                  __int16 v70 = 2080;
                  v71 = &unk_22004A573;
                  __int16 v72 = 2080;
                  __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                  __int16 v74 = 1024;
                  int v75 = 1485;
                }
                else
                {
                  uint64_t v39 = [v12 objectForKeyedSubscript:@"BKOptionMatchAuthTokenToBypassPasscodeBiolockout"];

                  if (v39) {
                    LOBYTE(v63) = 1;
                  }
                  if ((_BYTE)v64)
                  {
                    if (HIBYTE(v64))
                    {
                      if (__osLog) {
                        uint32_t v49 = __osLog;
                      }
                      else {
                        uint32_t v49 = &_os_log_internal;
                      }
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_182;
                      }
                      *(_DWORD *)buf = 136316162;
                      uint64_t v67 = "!forUnlock";
                      __int16 v68 = 2048;
                      uint64_t v69 = 0;
                      __int16 v70 = 2080;
                      v71 = &unk_22004A573;
                      __int16 v72 = 2080;
                      __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      __int16 v74 = 1024;
                      int v75 = 1493;
                    }
                    else if (v29)
                    {
                      if (__osLog) {
                        uint32_t v49 = __osLog;
                      }
                      else {
                        uint32_t v49 = &_os_log_internal;
                      }
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_182;
                      }
                      *(_DWORD *)buf = 136316162;
                      uint64_t v67 = "!forCredentialSet";
                      __int16 v68 = 2048;
                      uint64_t v69 = 0;
                      __int16 v70 = 2080;
                      v71 = &unk_22004A573;
                      __int16 v72 = 2080;
                      __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      __int16 v74 = 1024;
                      int v75 = 1494;
                    }
                    else if (HIBYTE(v63))
                    {
                      if (__osLog) {
                        uint32_t v49 = __osLog;
                      }
                      else {
                        uint32_t v49 = &_os_log_internal;
                      }
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_182;
                      }
                      *(_DWORD *)buf = 136316162;
                      uint64_t v67 = "!stopOnSuccess";
                      __int16 v68 = 2048;
                      uint64_t v69 = 0;
                      __int16 v70 = 2080;
                      v71 = &unk_22004A573;
                      __int16 v72 = 2080;
                      __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      __int16 v74 = 1024;
                      int v75 = 1495;
                    }
                    else if ((_BYTE)v63)
                    {
                      if (__osLog) {
                        uint32_t v49 = __osLog;
                      }
                      else {
                        uint32_t v49 = &_os_log_internal;
                      }
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_182;
                      }
                      *(_DWORD *)buf = 136316162;
                      uint64_t v67 = "!noBioLockout";
                      __int16 v68 = 2048;
                      uint64_t v69 = 0;
                      __int16 v70 = 2080;
                      v71 = &unk_22004A573;
                      __int16 v72 = 2080;
                      __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      __int16 v74 = 1024;
                      int v75 = 1496;
                    }
                    else
                    {
                      if (!v28)
                      {
                        uint64_t v62 = -101;
LABEL_48:

                        uint64_t v16 = v56;
                        goto LABEL_49;
                      }
                      if (__osLog) {
                        uint32_t v49 = __osLog;
                      }
                      else {
                        uint32_t v49 = &_os_log_internal;
                      }
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_182;
                      }
                      *(_DWORD *)buf = 136316162;
                      uint64_t v67 = "!selectedIdentitiesBlob";
                      __int16 v68 = 2048;
                      uint64_t v69 = 0;
                      __int16 v70 = 2080;
                      v71 = &unk_22004A573;
                      __int16 v72 = 2080;
                      __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      __int16 v74 = 1024;
                      int v75 = 1497;
                    }
LABEL_181:
                    _os_log_impl(&dword_21FFF3000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_182:
                    int Data = 258;
                    goto LABEL_69;
                  }
                  int v40 = dictionaryGetInteger();
                  if (v40)
                  {
                    int Data = v40;
                    if (__osLog) {
                      uint64_t v48 = __osLog;
                    }
                    else {
                      uint64_t v48 = &_os_log_internal;
                    }
                    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_69;
                    }
                    *(_DWORD *)buf = 136316162;
                    uint64_t v67 = "err == 0 ";
                    __int16 v68 = 2048;
                    uint64_t v69 = Data;
                    __int16 v70 = 2080;
                    v71 = &unk_22004A573;
                    __int16 v72 = 2080;
                    __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                    __int16 v74 = 1024;
                    int v75 = 1504;
                  }
                  else
                  {
                    uint64_t v41 = v62;
                    if (v62 >= 100) {
                      uint64_t v41 = 100;
                    }
                    if (v41 <= -100) {
                      uint64_t v41 = -100;
                    }
                    uint64_t v62 = v41;
                    if (!(_BYTE)v63) {
                      goto LABEL_48;
                    }
                    if (HIBYTE(v64))
                    {
                      if (__osLog) {
                        uint32_t v49 = __osLog;
                      }
                      else {
                        uint32_t v49 = &_os_log_internal;
                      }
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_182;
                      }
                      *(_DWORD *)buf = 136316162;
                      uint64_t v67 = "!forUnlock";
                      __int16 v68 = 2048;
                      uint64_t v69 = 0;
                      __int16 v70 = 2080;
                      v71 = &unk_22004A573;
                      __int16 v72 = 2080;
                      __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      __int16 v74 = 1024;
                      int v75 = 1512;
                      goto LABEL_181;
                    }
                    if (v29)
                    {
                      if (__osLog) {
                        uint32_t v49 = __osLog;
                      }
                      else {
                        uint32_t v49 = &_os_log_internal;
                      }
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_182;
                      }
                      *(_DWORD *)buf = 136316162;
                      uint64_t v67 = "!forCredentialSet";
                      __int16 v68 = 2048;
                      uint64_t v69 = 0;
                      __int16 v70 = 2080;
                      v71 = &unk_22004A573;
                      __int16 v72 = 2080;
                      __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      __int16 v74 = 1024;
                      int v75 = 1513;
                      goto LABEL_181;
                    }
                    if ((_BYTE)v64)
                    {
                      if (__osLog) {
                        uint32_t v49 = __osLog;
                      }
                      else {
                        uint32_t v49 = &_os_log_internal;
                      }
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_182;
                      }
                      *(_DWORD *)buf = 136316162;
                      uint64_t v67 = "!forPreArm";
                      __int16 v68 = 2048;
                      uint64_t v69 = 0;
                      __int16 v70 = 2080;
                      v71 = &unk_22004A573;
                      __int16 v72 = 2080;
                      __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      __int16 v74 = 1024;
                      int v75 = 1514;
                      goto LABEL_181;
                    }
                    [v10 setNoBioLockoutUserID:v56];
                    int v42 = objc_msgSend(v52, "parseAuthDict:toAuthData:", v12, objc_msgSend(v10, "noBioLockoutAuthData"));
                    if (!v42) {
                      goto LABEL_48;
                    }
                    int Data = v42;
                    if (__osLog) {
                      uint64_t v48 = __osLog;
                    }
                    else {
                      uint64_t v48 = &_os_log_internal;
                    }
                    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                    {
LABEL_69:

                      goto LABEL_62;
                    }
                    *(_DWORD *)buf = 136316162;
                    uint64_t v67 = "err == 0 ";
                    __int16 v68 = 2048;
                    uint64_t v69 = Data;
                    __int16 v70 = 2080;
                    v71 = &unk_22004A573;
                    __int16 v72 = 2080;
                    __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                    __int16 v74 = 1024;
                    int v75 = 1518;
                  }
                }
              }
            }
          }
        }
        _os_log_impl(&dword_21FFF3000, v48, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        goto LABEL_69;
      }
    }
    __int16 v28 = 0;
    __int16 v29 = 0;
    unint64_t v30 = 0;
    BOOL v31 = 0;
LABEL_49:
    [v10 setUserID:v16];
    [v10 setSelectedIdentitiesBlob:v28];
    [v10 setPriority:v62];
    [v10 setForUnlock:HIBYTE(v64)];
    [v10 setForCredentialSet:v31];
    [v10 setAcmContext:v29];
    [v10 setForPreArm:v64];
    [v10 setStopOnSuccess:HIBYTE(v63)];
    [v10 setUseCase:v30];
    [v10 setNoBioLockout:v63];
    [v10 setClient:v14];
    if (v28) {
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 0x4000);
    }
    if (HIBYTE(v64)) {
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 1);
    }
    if (v31) {
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 8);
    }
    if ((_BYTE)v64) {
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 0x100);
    }
    if (HIBYTE(v63)) {
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 0x80);
    }
    if ((_BYTE)v63) {
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 0x10);
    }
    int Data = 0;
    goto LABEL_62;
  }
  int Data = v15;
  if (__osLog) {
    uint64_t v46 = __osLog;
  }
  else {
    uint64_t v46 = &_os_log_internal;
  }
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v67 = "err == 0 ";
    __int16 v68 = 2048;
    uint64_t v69 = Data;
    __int16 v70 = 2080;
    v71 = &unk_22004A573;
    __int16 v72 = 2080;
    __int16 v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v74 = 1024;
    int v75 = 1437;
    _os_log_impl(&dword_21FFF3000, v46, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  __int16 v28 = 0;
  __int16 v29 = 0;
LABEL_62:

  return Data;
}

- (int)startMatchOperation:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v4 = (char *)a3;
  uint64_t v5 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138412290;
    os_log_type_t v19 = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "startMatchOperation: %@\n", (uint8_t *)&v18, 0xCu);
  }
  if (!v4)
  {
    if (__osLog) {
      int v15 = __osLog;
    }
    else {
      int v15 = v5;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      os_log_type_t v19 = "operation";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      uint64_t v23 = &unk_22004A573;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v26 = 1024;
      int v27 = 1569;
      _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    int v13 = 258;
    goto LABEL_56;
  }
  if (![(BiometricKitXPCServer *)self identitiesCount] && !BYTE2(self->_mkbLockStatusNtfToken))
  {
    if (__osLog) {
      id v9 = __osLog;
    }
    else {
      id v9 = v5;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    int v18 = 136316162;
    os_log_type_t v19 = "([self identitiesCount] != 0) || (_templatesAtBoot)";
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = &unk_22004A573;
    __int16 v24 = 2080;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v26 = 1024;
    int v27 = 1570;
    goto LABEL_54;
  }
  if (![(BiometricKitXPCServer *)self validateAllUsers])
  {
    if ([v4 userID] == -1)
    {
      if (![(BiometricKitXPCServer *)self identitiesCount])
      {
        if (__osLog) {
          id v9 = __osLog;
        }
        else {
          id v9 = v5;
        }
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_55;
        }
        int v18 = 136316162;
        os_log_type_t v19 = "[self identitiesCount] != 0";
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        __int16 v22 = 2080;
        uint64_t v23 = &unk_22004A573;
        __int16 v24 = 2080;
        int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v26 = 1024;
        int v27 = 1576;
        goto LABEL_54;
      }
    }
    else
    {
      int v7 = -[BiometricKitXPCServer identitiesOfUser:](self, "identitiesOfUser:", [v4 userID]);
      uint64_t v8 = [v7 count];

      if (!v8)
      {
        if (__osLog) {
          id v9 = __osLog;
        }
        else {
          id v9 = v5;
        }
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_55;
        }
        int v18 = 136316162;
        os_log_type_t v19 = "[[self identitiesOfUser:operation.userID] count] != 0";
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        __int16 v22 = 2080;
        uint64_t v23 = &unk_22004A573;
        __int16 v24 = 2080;
        int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v26 = 1024;
        int v27 = 1579;
LABEL_54:
        _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
LABEL_55:
        int v13 = 257;
        goto LABEL_56;
      }
    }
  }
  int v10 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", [v4 userID]);
  if (v10)
  {
    int v13 = v10;
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = v5;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    int v18 = 136316162;
    os_log_type_t v19 = "err == 0 ";
    __int16 v20 = 2048;
    uint64_t v21 = v13;
    __int16 v22 = 2080;
    uint64_t v23 = &unk_22004A573;
    __int16 v24 = 2080;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v26 = 1024;
    int v27 = 1585;
LABEL_43:
    _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
LABEL_56:
    if (__osLogTrace) {
      uint64_t v17 = __osLogTrace;
    }
    else {
      uint64_t v17 = v5;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = v13;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "startMatchOperation: -> %d\n", (uint8_t *)&v18, 8u);
    }
    goto LABEL_26;
  }
  int v11 = [(BiometricKitXPCServer *)self performMatchCommand:v4];
  if (v11)
  {
    int v13 = v11;
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = v5;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    int v18 = 136316162;
    os_log_type_t v19 = "err == 0 ";
    __int16 v20 = 2048;
    uint64_t v21 = v13;
    __int16 v22 = 2080;
    uint64_t v23 = &unk_22004A573;
    __int16 v24 = 2080;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v26 = 1024;
    int v27 = 1588;
    goto LABEL_43;
  }
  if (__osLogTrace) {
    id v12 = __osLogTrace;
  }
  else {
    id v12 = v5;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 67109120;
    LODWORD(v19) = 0;
    _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_DEBUG, "startMatchOperation: -> %d\n", (uint8_t *)&v18, 8u);
  }
  int v13 = 0;
LABEL_26:

  return v13;
}

- (int)detectPresenceWithOptions:(id)a3 withClient:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  uint64_t v8 = &_os_log_internal;
  if (__osLogTrace) {
    id v9 = __osLogTrace;
  }
  else {
    id v9 = &_os_log_internal;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    __int16 v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_DEFAULT, "detectPresenceWithOptions:withClient: %@ %@\n", (uint8_t *)&v19, 0x16u);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  int v10 = [(BiometricKitXPCServer *)self createPresenceDetectOperation];
  if (v10)
  {
    int v11 = [(BiometricKitXPCServer *)self initPresenceDetectOperation:v10 options:v6 client:v7];
    if (v11)
    {
      int v12 = v11;
      if (__osLog) {
        int v18 = __osLog;
      }
      else {
        int v18 = v8;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136316162;
        __int16 v20 = "err == 0 ";
        __int16 v21 = 2048;
        id v22 = (id)v12;
        __int16 v23 = 2080;
        __int16 v24 = &unk_22004A573;
        __int16 v25 = 2080;
        __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v27 = 1024;
        int v28 = 1615;
LABEL_39:
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
      }
    }
    else
    {
      int v12 = [(BiometricKitXPCServer *)self processBioOperation:v10];
      if (v12)
      {
        int v18 = (__osLog ? __osLog : v8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v19 = 136316162;
          __int16 v20 = "err == 0 ";
          __int16 v21 = 2048;
          id v22 = (id)v12;
          __int16 v23 = 2080;
          __int16 v24 = &unk_22004A573;
          __int16 v25 = 2080;
          __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v27 = 1024;
          int v28 = 1618;
          goto LABEL_39;
        }
      }
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v17 = __osLog;
    }
    else {
      uint64_t v17 = v8;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      __int16 v20 = "pdetOperation";
      __int16 v21 = 2048;
      id v22 = 0;
      __int16 v23 = 2080;
      __int16 v24 = &unk_22004A573;
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v27 = 1024;
      int v28 = 1612;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    int v12 = 260;
  }
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (__osLogTrace) {
    int v13 = __osLogTrace;
  }
  else {
    int v13 = v8;
  }
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v19 = 67109120;
      LODWORD(v20) = v12;
      uint64_t v14 = v13;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_21:
      _os_log_impl(&dword_21FFF3000, v14, v15, "detectPresenceWithOptions:withClient: -> %d\n", (uint8_t *)&v19, 8u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 67109120;
    LODWORD(v20) = 0;
    uint64_t v14 = v13;
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
    goto LABEL_21;
  }

  return v12;
}

- (id)createPresenceDetectOperation
{
  id v2 = objc_alloc_init(BiometricPresenceDetectOperation);
  return v2;
}

- (int)initPresenceDetectOperation:(id)a3 options:(id)a4 client:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = v9;
  if (!v7)
  {
    if (__osLog) {
      os_log_type_t v15 = __osLog;
    }
    else {
      os_log_type_t v15 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136316162;
    int v18 = "operation";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2080;
    id v22 = &unk_22004A573;
    __int16 v23 = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v25 = 1024;
    int v26 = 1649;
    goto LABEL_18;
  }
  if (!v9)
  {
    if (__osLog) {
      os_log_type_t v15 = __osLog;
    }
    else {
      os_log_type_t v15 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136316162;
    int v18 = "client";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2080;
    id v22 = &unk_22004A573;
    __int16 v23 = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v25 = 1024;
    int v26 = 1650;
LABEL_18:
    _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_19:
    int v13 = 258;
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_6:
    [v7 setPriority:0x8000000000000064];
    [v7 setClient:v10];
    int v13 = 0;
    goto LABEL_7;
  }
  int Integer = dictionaryGetInteger();
  if (Integer)
  {
    int v13 = Integer;
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v18 = "err == 0 ";
      __int16 v19 = 2048;
      uint64_t v20 = v13;
      __int16 v21 = 2080;
      id v22 = &unk_22004A573;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v25 = 1024;
      int v26 = 1654;
LABEL_30:
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    int Bool = dictionaryGetBool();
    if (!Bool) {
      goto LABEL_6;
    }
    int v13 = Bool;
    if (__osLog) {
      uint64_t v16 = __osLog;
    }
    else {
      uint64_t v16 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v18 = "err == 0 ";
      __int16 v19 = 2048;
      uint64_t v20 = v13;
      __int16 v21 = 2080;
      id v22 = &unk_22004A573;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v25 = 1024;
      int v26 = 1657;
      goto LABEL_30;
    }
  }
LABEL_7:

  return v13;
}

- (int)startPresenceDetectOperation:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = (char *)a3;
  uint64_t v5 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412290;
    os_log_type_t v15 = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "startPresenceDetectOperation: %@\n", (uint8_t *)&v14, 0xCu);
  }
  int v7 = [(BiometricKitXPCServer *)self performPresenceDetectCommand:v4];
  if (v7)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136316162;
      os_log_type_t v15 = "err == 0 ";
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      __int16 v19 = &unk_22004A573;
      __int16 v20 = 2080;
      __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v22 = 1024;
      int v23 = 1688;
      _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
    }
    if (__osLogTrace) {
      int v13 = __osLogTrace;
    }
    else {
      int v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 67109120;
      LODWORD(v15) = v7;
      id v9 = v13;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace) {
      id v8 = __osLogTrace;
    }
    else {
      id v8 = v5;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 67109120;
      LODWORD(v15) = 0;
      id v9 = v8;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_21FFF3000, v9, v10, "startPresenceDetectOperation: -> %d\n", (uint8_t *)&v14, 8u);
    }
  }

  return v7;
}

- (int)cancelWithClient:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__osLogTrace) {
    uint64_t v5 = __osLogTrace;
  }
  else {
    uint64_t v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEBUG, "cancelWithClient: %@\n", buf, 0xCu);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  uint64_t v6 = self->_cmdDispatchQueue;
  objc_sync_enter(v6);
  activeBioOpsQueue = self->_activeBioOpsQueue;
  if (activeBioOpsQueue)
  {
    if ([(NSMutableArray *)activeBioOpsQueue status] != 2
      || ([(NSMutableArray *)self->_activeBioOpsQueue client],
          id v8 = (id)objc_claimAutoreleasedReturnValue(),
          BOOL v9 = v8 == v4,
          v8,
          !v9))
    {
      os_log_type_t v10 = self->_bioOpsQueue;
      objc_sync_enter(v10);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      int v11 = self->_bioOpsQueue;
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v11);
            }
            os_log_type_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            objc_msgSend(v15, "client", (void)v25);
            id v16 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v17 = v16 == v4;

            if (v17)
            {
              [v15 setStatus:4];

              objc_sync_exit(v10);
              goto LABEL_25;
            }
          }
          uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      objc_sync_exit(v10);
      [(BiometricKitXPCServer *)self removeBioOperationOfClient:v4];
      goto LABEL_25;
    }
    __int16 v18 = self->_activeBioOpsQueue;
    if (v18) {
      [(NSMutableArray *)v18 setStatus:4];
    }
  }
  if ([(OS_dispatch_queue *)self->_cmdDispatchQueue count])
  {
    [(BiometricKitXPCServer *)self resumeQueuedBioOperation];
LABEL_25:
    int v19 = 0;
    goto LABEL_26;
  }
  int v19 = [(BiometricKitXPCServer *)self performCancelCommand];
  if (v19)
  {
    uint64_t v24 = (__osLog ? __osLog : &_os_log_internal);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "err == 0 ";
      __int16 v31 = 2048;
      uint64_t v32 = v19;
      __int16 v33 = 2080;
      id v34 = &unk_22004A573;
      __int16 v35 = 2080;
      int v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v37 = 1024;
      int v38 = 1730;
      _os_log_impl(&dword_21FFF3000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
LABEL_26:
  objc_sync_exit(v6);

  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (__osLogTrace) {
    __int16 v20 = __osLogTrace;
  }
  else {
    __int16 v20 = &_os_log_internal;
  }
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v19;
      __int16 v21 = v20;
      os_log_type_t v22 = OS_LOG_TYPE_ERROR;
LABEL_36:
      _os_log_impl(&dword_21FFF3000, v21, v22, "cancelWithClient: -> %d\n", buf, 8u);
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 67109120;
    __int16 v21 = v20;
    os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
    goto LABEL_36;
  }

  return v19;
}

- (void)registerDelegate:(BOOL)a3 withClient:(id)a4
{
  BOOL v4 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (__osLog) {
    uint64_t v6 = __osLog;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = v4;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEFAULT, "registerDelegate:withClient: %d %@ -> void\n", (uint8_t *)v7, 0x12u);
  }
}

- (void)notifyAppIsInactive:(BOOL)a3 withClient:(id)a4
{
  BOOL v4 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (__osLog) {
    uint64_t v6 = __osLog;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = v4;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEFAULT, "notifyAppIsInactive:withClient: %d %@ -> void\n", (uint8_t *)v7, 0x12u);
  }
}

- (int)startBioOperation:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = (char *)a3;
  uint64_t v6 = &_os_log_internal;
  if (__osLogTrace) {
    int v7 = __osLogTrace;
  }
  else {
    int v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 138412290;
    os_log_type_t v22 = v5;
    _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_DEBUG, "startBioOperation: %@\n", (uint8_t *)&v21, 0xCu);
  }
  if (!v5)
  {
    if (__osLog) {
      BOOL v17 = __osLog;
    }
    else {
      BOOL v17 = v6;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136316162;
      os_log_type_t v22 = "bioOp";
      __int16 v23 = 2048;
      uint64_t v24 = 0;
      __int16 v25 = 2080;
      long long v26 = &unk_22004A573;
      __int16 v27 = 2080;
      long long v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v29 = 1024;
      int v30 = 1795;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    goto LABEL_49;
  }
  __int16 v8 = self->_bioOpsQueue;
  objc_sync_enter(v8);
  [(NSMutableArray *)self->_bioOpsQueue addObject:v5];
  objc_sync_exit(v8);

  int v9 = [v5 type];
  switch(v9)
  {
    case 1:
      int v10 = [(BiometricKitXPCServer *)self startEnrollOperation:v5];
      break;
    case 2:
      int v10 = [(BiometricKitXPCServer *)self startMatchOperation:v5];
      break;
    case 3:
      int v10 = [(BiometricKitXPCServer *)self startPresenceDetectOperation:v5];
      break;
    default:
      if (__osLog) {
        uint64_t v13 = __osLog;
      }
      else {
        uint64_t v13 = v6;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136316162;
        os_log_type_t v22 = "err == 0 ";
        __int16 v23 = 2048;
        int v11 = 258;
        uint64_t v24 = 258;
        __int16 v25 = 2080;
        long long v26 = &unk_22004A573;
        __int16 v27 = 2080;
        long long v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v29 = 1024;
        int v30 = 1819;
LABEL_37:
        _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
LABEL_50:
        __int16 v18 = self->_bioOpsQueue;
        objc_sync_enter(v18);
        [(NSMutableArray *)self->_bioOpsQueue removeObject:v5];
        objc_sync_exit(v18);

        if (__osLogTrace) {
          int v19 = __osLogTrace;
        }
        else {
          int v19 = v6;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v21 = 67109120;
          LODWORD(v22) = v11;
          _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "startBioOperation: -> %d\n", (uint8_t *)&v21, 8u);
        }
        goto LABEL_55;
      }
LABEL_49:
      int v11 = 258;
      goto LABEL_50;
  }
  int v11 = v10;
  if (v10)
  {
    activeBioOpsQueue = self->_activeBioOpsQueue;
    if (activeBioOpsQueue
      && ([(NSMutableArray *)activeBioOpsQueue status] == 3
       || [(NSMutableArray *)self->_activeBioOpsQueue status] == 4))
    {
      if ([(NSMutableArray *)self->_activeBioOpsQueue status] == 3) {
        [(OS_dispatch_queue *)self->_cmdDispatchQueue insertObject:self->_activeBioOpsQueue atIndex:0];
      }
      [(BiometricKitXPCServer *)self performCancelCommand];
    }
    if (__osLog) {
      uint64_t v13 = __osLog;
    }
    else {
      uint64_t v13 = v6;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_50;
    }
    int v21 = 136316162;
    os_log_type_t v22 = "err == 0 ";
    __int16 v23 = 2048;
    uint64_t v24 = v11;
    __int16 v25 = 2080;
    long long v26 = &unk_22004A573;
    __int16 v27 = 2080;
    long long v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v29 = 1024;
    int v30 = 1860;
    goto LABEL_37;
  }
  int v14 = self->_bioOpsQueue;
  objc_sync_enter(v14);
  if (![(NSMutableArray *)self->_bioOpsQueue count])
  {
    [(BiometricKitXPCServer *)self performCancelCommand];
    if (__osLog) {
      id v16 = __osLog;
    }
    else {
      id v16 = v6;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136316162;
      os_log_type_t v22 = "err == 0 ";
      __int16 v23 = 2048;
      uint64_t v24 = 257;
      __int16 v25 = 2080;
      long long v26 = &unk_22004A573;
      __int16 v27 = 2080;
      long long v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v29 = 1024;
      int v30 = 1834;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    objc_sync_exit(v14);

    int v11 = 257;
    goto LABEL_50;
  }
  objc_sync_exit(v14);

  [v5 setStatus:2];
  objc_storeStrong((id *)&self->_activeBioOpsQueue, a3);
  [(ActivityTracker *)self->_ongoingCatacombSaveTimer setActive:1];
  if (__osLogTrace) {
    os_log_type_t v15 = __osLogTrace;
  }
  else {
    os_log_type_t v15 = v6;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 67109120;
    LODWORD(v22) = 0;
    _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_DEBUG, "startBioOperation: -> %d\n", (uint8_t *)&v21, 8u);
  }
  int v11 = 0;
LABEL_55:

  return v11;
}

- (void)removeBioOperationOfClient:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "removeBioOperationOfClient: %@\n", buf, 0xCu);
  }
  int v7 = self->_cmdDispatchQueue;
  objc_sync_enter(v7);
  cmdDispatchQueue = self->_cmdDispatchQueue;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  int v14 = __52__BiometricKitXPCServer_removeBioOperationOfClient___block_invoke;
  os_log_type_t v15 = &unk_26454E3E0;
  id v9 = v4;
  id v16 = v9;
  BOOL v17 = self;
  uint64_t v10 = [(OS_dispatch_queue *)cmdDispatchQueue indexOfObjectPassingTest:&v12];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    -[OS_dispatch_queue removeObjectAtIndex:](self->_cmdDispatchQueue, "removeObjectAtIndex:", v10, v12, v13, v14, v15);
  }

  objc_sync_exit(v7);
  if (__osLogTrace) {
    int v11 = __osLogTrace;
  }
  else {
    int v11 = v5;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "removeBioOperationOfClient: -> void\n", buf, 2u);
  }
}

BOOL __52__BiometricKitXPCServer_removeBioOperationOfClient___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  int v7 = *(void **)(a1 + 32);
  __int16 v8 = [v6 client];

  if (v7 == v8)
  {
    if ([v6 status] == 3) {
      objc_msgSend(*(id *)(a1 + 40), "sendStatusMessage:toClient:", objc_msgSend(v6, "taskResumedMessage"), *(void *)(a1 + 32));
    }
    objc_msgSend(*(id *)(a1 + 40), "sendStatusMessage:toClient:", objc_msgSend(v6, "cancelledMessage"), *(void *)(a1 + 32));
    *a4 = 1;
  }

  return v7 == v8;
}

- (int)pauseBioOperation:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  id v5 = &_os_log_internal;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int v21 = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "pauseBioOperation: %@\n", buf, 0xCu);
  }
  if (v4)
  {
    [v4 setStatus:3];
    uint64_t v7 = [v4 taskPausedMessage];
    __int16 v8 = [v4 client];
    [(BiometricKitXPCServer *)self sendStatusMessage:v7 toClient:v8];

    cmdDispatchQueue = self->_cmdDispatchQueue;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__BiometricKitXPCServer_pauseBioOperation___block_invoke;
    v18[3] = &unk_26454E408;
    uint64_t v10 = v4;
    id v19 = v10;
    uint64_t v11 = [(OS_dispatch_queue *)cmdDispatchQueue indexOfObjectPassingTest:v18];

    uint64_t v12 = self->_cmdDispatchQueue;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      [(OS_dispatch_queue *)v12 addObject:v10];
    }
    else {
      [(OS_dispatch_queue *)v12 insertObject:v10 atIndex:v11];
    }
    if (__osLogTrace) {
      uint64_t v13 = __osLogTrace;
    }
    else {
      uint64_t v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = 0;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_DEBUG, "pauseBioOperation: -> %d\n", buf, 8u);
    }
    int v14 = 0;
  }
  else
  {
    if (__osLog) {
      id v16 = __osLog;
    }
    else {
      id v16 = v5;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v21 = "bioOp";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2080;
      __int16 v25 = &unk_22004A573;
      __int16 v26 = 2080;
      __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v28 = 1024;
      int v29 = 1927;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace) {
      BOOL v17 = __osLogTrace;
    }
    else {
      BOOL v17 = v5;
    }
    int v14 = 258;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = 258;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "pauseBioOperation: -> %d\n", buf, 8u);
    }
  }

  return v14;
}

BOOL __43__BiometricKitXPCServer_pauseBioOperation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 priority];
  uint64_t v8 = [v6 priority];

  if (v7 >= v8) {
    *a4 = 1;
  }
  return v7 >= v8;
}

- (void)resumeQueuedBioOperation
{
  BOOL v3 = &_os_log_internal;
  if (__osLogTrace) {
    id v4 = __osLogTrace;
  }
  else {
    id v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "resumeQueuedBioOperation\n", buf, 2u);
  }
  do
  {
    if (![(OS_dispatch_queue *)self->_cmdDispatchQueue count]) {
      break;
    }
    id v5 = [(OS_dispatch_queue *)self->_cmdDispatchQueue objectAtIndex:0];
    [(OS_dispatch_queue *)self->_cmdDispatchQueue removeObject:v5];
    uint64_t v6 = [(BiometricKitXPCServer *)self startBioOperation:v5];
    if (v6) {
      uint64_t v7 = [v5 taskResumeFailedMessage];
    }
    else {
      uint64_t v7 = [v5 taskResumedMessage];
    }
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = [v5 client];
      [(BiometricKitXPCServer *)self sendStatusMessage:v8 toClient:v9];

      uint64_t v10 = [v5 client];
      [v10 taskResumeStatus:v6];
    }
  }
  while (v6);
  if (__osLogTrace) {
    uint64_t v11 = __osLogTrace;
  }
  else {
    uint64_t v11 = v3;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "resumeQueuedBioOperation: -> void\n", v12, 2u);
  }
}

- (int)processBioOperation:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  id v5 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 138412290;
    __int16 v27 = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "processBioOperation: %@\n", (uint8_t *)&v26, 0xCu);
  }
  if (!v4)
  {
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = v5;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_49;
    }
    int v26 = 136316162;
    __int16 v27 = "bioOp";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    uint64_t v31 = &unk_22004A573;
    __int16 v32 = 2080;
    __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v34 = 1024;
    int v35 = 2011;
    goto LABEL_48;
  }
  uint64_t v7 = [v4 client];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = v5;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_49;
    }
    int v26 = 136316162;
    __int16 v27 = "bioOp.client";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    uint64_t v31 = &unk_22004A573;
    __int16 v32 = 2080;
    __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v34 = 1024;
    int v35 = 2012;
LABEL_48:
    _os_log_impl(&dword_21FFF3000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v26, 0x30u);
LABEL_49:
    int v20 = 258;
    goto LABEL_26;
  }
  [v4 setStatus:1];
  id v9 = self->_cmdDispatchQueue;
  objc_sync_enter(v9);
  uint64_t v10 = [v4 client];
  [(BiometricKitXPCServer *)self removeBioOperationOfClient:v10];

  activeBioOpsQueue = self->_activeBioOpsQueue;
  if (!activeBioOpsQueue) {
    goto LABEL_23;
  }
  uint64_t v12 = [(NSMutableArray *)activeBioOpsQueue client];
  uint64_t v13 = [v4 client];
  BOOL v14 = v12 == v13;

  os_log_type_t v15 = self->_activeBioOpsQueue;
  if (!v14)
  {
    uint64_t v16 = [(NSMutableArray *)v15 priority];
    if (v16 > [v4 priority])
    {
      int v17 = [(BiometricKitXPCServer *)self pauseBioOperation:v4];
LABEL_24:
      int v20 = v17;
      goto LABEL_25;
    }
    if ([(NSMutableArray *)self->_activeBioOpsQueue type] == 1
      || [(NSMutableArray *)self->_activeBioOpsQueue type] == 2
      && ([(NSMutableArray *)self->_activeBioOpsQueue forPreArm] & 1) != 0)
    {
      uint64_t v21 = 4;
LABEL_22:
      [(NSMutableArray *)self->_activeBioOpsQueue setStatus:v21];
      goto LABEL_23;
    }
    if ([(NSMutableArray *)self->_activeBioOpsQueue status] != 4)
    {
      uint64_t v21 = 3;
      goto LABEL_22;
    }
LABEL_23:
    int v17 = [(BiometricKitXPCServer *)self startBioOperation:v4];
    goto LABEL_24;
  }
  [(NSMutableArray *)v15 setStatus:4];
  if (![(OS_dispatch_queue *)self->_cmdDispatchQueue count]) {
    goto LABEL_23;
  }
  __int16 v18 = [(OS_dispatch_queue *)self->_cmdDispatchQueue firstObject];
  uint64_t v19 = [v18 priority];
  LODWORD(v19) = v19 > [v4 priority];

  if (!v19) {
    goto LABEL_23;
  }
  int v20 = [(BiometricKitXPCServer *)self pauseBioOperation:v4];
  if (!v20)
  {
    [(BiometricKitXPCServer *)self resumeQueuedBioOperation];
    int v20 = 0;
  }
LABEL_25:
  objc_sync_exit(v9);

  [(BiometricKitXPCServer *)self updateActiveOperationNotification];
  if (v20)
  {
LABEL_26:
    if (__osLogTrace) {
      __int16 v22 = __osLogTrace;
    }
    else {
      __int16 v22 = v5;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v26 = 67109120;
      LODWORD(v27) = v20;
      _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "processBioOperation:withPriority:withParams:withClient: -> %d\n", (uint8_t *)&v26, 8u);
    }
    goto LABEL_37;
  }
  if (__osLogTrace) {
    uint64_t v23 = __osLogTrace;
  }
  else {
    uint64_t v23 = v5;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 67109120;
    LODWORD(v27) = 0;
    _os_log_impl(&dword_21FFF3000, v23, OS_LOG_TYPE_DEBUG, "processBioOperation:withPriority:withParams:withClient: -> %d\n", (uint8_t *)&v26, 8u);
  }
  int v20 = 0;
LABEL_37:

  return v20;
}

- (void)switchToNextBioOperation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v19[0] = 67109120;
    v19[1] = v3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "switchToNextBioOperation: %d\n", (uint8_t *)v19, 8u);
  }
  uint64_t v7 = self->_cmdDispatchQueue;
  objc_sync_enter(v7);
  BOOL v8 = self->_bioOpsQueue;
  objc_sync_enter(v8);
  if (![(NSMutableArray *)self->_bioOpsQueue count]) {
    goto LABEL_11;
  }
  id v9 = [(NSMutableArray *)self->_bioOpsQueue objectAtIndex:0];
  if ([v9 status] == 3)
  {
    uint64_t v10 = [v9 taskPausedMessage];
    uint64_t v11 = [v9 client];
    [(BiometricKitXPCServer *)self sendStatusMessage:v10 toClient:v11];

    [(OS_dispatch_queue *)self->_cmdDispatchQueue insertObject:v9 atIndex:0];
  }
  [(NSMutableArray *)self->_bioOpsQueue removeObject:v9];
  if ([(NSMutableArray *)self->_bioOpsQueue count])
  {

LABEL_11:
    objc_sync_exit(v8);

    goto LABEL_12;
  }
  [(ActivityTracker *)self->_ongoingCatacombSaveTimer setActive:0];

  objc_sync_exit(v8);
  activeBioOpsQueue = self->_activeBioOpsQueue;
  if (activeBioOpsQueue)
  {
    int v14 = [(NSMutableArray *)activeBioOpsQueue status];
    os_log_type_t v15 = self->_activeBioOpsQueue;
    self->_activeBioOpsQueue = 0;

    BOOL v16 = (v14 - 3) < 2;
    if (v3) {
      goto LABEL_25;
    }
  }
  else
  {
    BOOL v16 = 0;
    if (v3)
    {
LABEL_25:
      [(BiometricKitXPCServer *)self resumeQueuedBioOperation];
      goto LABEL_12;
    }
  }
  if (v16) {
    goto LABEL_25;
  }
  while ([(OS_dispatch_queue *)self->_cmdDispatchQueue count])
  {
    int v17 = [(OS_dispatch_queue *)self->_cmdDispatchQueue objectAtIndex:0];
    __int16 v18 = [v17 client];
    [(BiometricKitXPCServer *)self removeBioOperationOfClient:v18];
  }
  [(ActivityTracker *)self->_ongoingCatacombSaveTimer setActive:0];
LABEL_12:
  objc_sync_exit(v7);

  [(BiometricKitXPCServer *)self updateActiveOperationNotification];
  if (__osLogTrace) {
    uint64_t v12 = __osLogTrace;
  }
  else {
    uint64_t v12 = v5;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v19[0]) = 0;
    _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_DEBUG, "switchToNextBioOperation: -> void\n", (uint8_t *)v19, 2u);
  }
}

- (void)stopBioOperationsAfterReconnect
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    BOOL v3 = __osLogTrace;
  }
  else {
    BOOL v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEBUG, "stopBioOperationsAfterReconnect\n", buf, 2u);
  }
  id v4 = self->_cmdDispatchQueue;
  objc_sync_enter(v4);
  id v5 = self->_bioOpsQueue;
  objc_sync_enter(v5);
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  while ([(NSMutableArray *)self->_bioOpsQueue count])
  {
    [v6 addObjectsFromArray:self->_bioOpsQueue];
    [(NSMutableArray *)self->_bioOpsQueue removeAllObjects];
  }
  if ([(OS_dispatch_queue *)self->_cmdDispatchQueue count])
  {
    [v6 addObjectsFromArray:self->_cmdDispatchQueue];
    [(OS_dispatch_queue *)self->_cmdDispatchQueue removeAllObjects];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "status", (void)v19);
        if (v12 != 1)
        {
          if (v12 == 3)
          {
            uint64_t v13 = [v11 taskResumedMessage];
            int v14 = [v11 client];
            [(BiometricKitXPCServer *)self sendStatusMessage:v13 toClient:v14];
          }
          uint64_t v15 = [v11 cancelledMessage];
          BOOL v16 = [v11 client];
          [(BiometricKitXPCServer *)self sendStatusMessage:v15 toClient:v16];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
  }

  activeBioOpsQueue = self->_activeBioOpsQueue;
  if (activeBioOpsQueue)
  {
    self->_activeBioOpsQueue = 0;
  }
  -[ActivityTracker setActive:](self->_ongoingCatacombSaveTimer, "setActive:", 0, (void)v19);

  objc_sync_exit(v5);
  objc_sync_exit(v4);

  if (__osLogTrace) {
    __int16 v18 = __osLogTrace;
  }
  else {
    __int16 v18 = &_os_log_internal;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_DEBUG, "stopBioOperationsAfterReconnect -> void\n", buf, 2u);
  }
}

- (void)updateActiveOperationNotificationWithOverride:(int)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_activeOperationNtfTokenValid)
  {
    LODWORD(v3) = a3;
    id v5 = self->_bioOpsQueue;
    objc_sync_enter(v5);
    uint64_t v6 = [(NSMutableArray *)self->_bioOpsQueue firstObject];
    id v7 = v6;
    if (v6)
    {
      int v8 = [v6 type];
      BOOL v9 = v8 != 3;
      if (v8 == 3) {
        int v10 = 3;
      }
      else {
        int v10 = 0;
      }
      if (v8 == 2)
      {
        BOOL v9 = 0;
        int v11 = 2;
      }
      else
      {
        int v11 = v10;
      }
      char v12 = v8 != 1 && v9;
      if (v8 == 1) {
        unsigned int v13 = 1;
      }
      else {
        unsigned int v13 = v11;
      }
    }
    else
    {
      unsigned int v13 = 0;
      char v12 = 1;
    }
    if (((v3 != 0) & v12) != 0) {
      uint64_t v3 = v3;
    }
    else {
      uint64_t v3 = v13;
    }
    uint64_t state64 = -1;
    notify_get_state(self->_activeOperationNtfToken, &state64);
    if (state64 != v3)
    {
      notify_set_state(self->_activeOperationNtfToken, v3);
      notify_post("com.apple.BiometricKit.activeOperation");
      if (__osLog) {
        int v14 = __osLog;
      }
      else {
        int v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v17 = v3;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_DEFAULT, "updateActiveOperationNotificationWithOverride: posted value = %d\n", buf, 8u);
      }
    }

    objc_sync_exit(v5);
  }
}

- (void)updateActiveOperationNotification
{
}

- (void)sendStatusMessage:(unsigned int)a3 toClient:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = v5;
  if (v4)
  {
    [v5 statusMessage:v4];
    if (__osLog) {
      id v7 = __osLog;
    }
    else {
      id v7 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109378;
      v8[1] = v4;
      __int16 v9 = 2112;
      int v10 = v6;
      _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_DEFAULT, "sending status message %u to %@\n", (uint8_t *)v8, 0x12u);
    }
  }
}

- (BOOL)isClassCFileAccessible
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v4 = __osLogTrace;
  }
  else {
    uint64_t v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "isClassCFileAccessible\n", buf, 2u);
  }
  int v5 = MKBDeviceUnlockedSinceBoot();
  if (v5 >= 1)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__BiometricKitXPCServer_isClassCFileAccessible__block_invoke;
    block[3] = &unk_26454E2E0;
    block[4] = self;
    if (isClassCFileAccessible_onceToken != -1) {
      dispatch_once(&isClassCFileAccessible_onceToken, block);
    }
  }
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = v3;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v5 > 0;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "isClassCFileAccessible -> %d\n", buf, 8u);
  }
  return v5 > 0;
}

void __47__BiometricKitXPCServer_isClassCFileAccessible__block_invoke(uint64_t a1)
{
  v1 = (NSObject **)&__osLog;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = &_os_log_internal;
  if (__osLog) {
    uint64_t v3 = __osLog;
  }
  else {
    uint64_t v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEFAULT, "Starting catacomb file check\n", buf, 2u);
  }
  [*(id *)(*(void *)(a1 + 32) + 208) lock];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 216) catacombDir];
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = +[CatacombComponent masterComponent];
  id v7 = [v5 catacombFileNameForComponent:v6];
  int v8 = [v4 stringByAppendingString:v7];

  __int16 v9 = [MEMORY[0x263F08850] defaultManager];
  LODWORD(v6) = [v9 fileExistsAtPath:v8];

  if (v6)
  {
    id v10 = 0;
    uint64_t v11 = 1;
    unint64_t v12 = 0x263F08000uLL;
    unint64_t v13 = 0x263EFF000uLL;
    __int16 v30 = v8;
    while (1)
    {
      int v14 = v10;
      uint64_t v15 = *(void **)(v12 + 2112);
      BOOL v16 = [*(id *)(v13 + 2608) fileURLWithPath:v8];
      id v32 = v14;
      int v17 = [v15 fileHandleForReadingFromURL:v16 error:&v32];
      id v10 = v32;

      if (v17) {
        break;
      }
      uint64_t v18 = [NSString stringWithFormat:@"Catacomb file check (attempt %d) failed, fileHandleForReadingFromURL(file:'%@') -> %@", v11, v8, v10];
      if (isInternalBuild())
      {
        long long v19 = *(void **)(a1 + 32);
        unint64_t v20 = v13;
        unint64_t v21 = v12;
        long long v22 = v1;
        uint64_t v23 = v2;
        __int16 v24 = NSString;
        uint64_t v25 = [MEMORY[0x263EFF910] date];
        int v26 = [v24 stringWithFormat:@"%@ - %@", v25, v18];
        [v19 writeStringToPersistentLog:v26];

        id v2 = v23;
        v1 = v22;
        unint64_t v12 = v21;
        unint64_t v13 = v20;
        int v8 = v30;
      }
      if (*v1) {
        __int16 v27 = *v1;
      }
      else {
        __int16 v27 = v2;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v34 = v18;
        _os_log_impl(&dword_21FFF3000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@\n", buf, 0xCu);
      }
      sleep(1u);

      uint64_t v11 = (v11 + 1);
      if (v11 == 11) {
        goto LABEL_30;
      }
    }
    if (*v1) {
      uint64_t v29 = *v1;
    }
    else {
      uint64_t v29 = v2;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_DEFAULT, "Catacomb file check succeeded\n", buf, 2u);
    }
  }
  else
  {
    if (__osLog) {
      __int16 v28 = __osLog;
    }
    else {
      __int16 v28 = v2;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FFF3000, v28, OS_LOG_TYPE_DEFAULT, "Catacomb file check skipped (file not found)\n", buf, 2u);
    }
    id v10 = 0;
  }
LABEL_30:
  [*(id *)(*(void *)(a1 + 32) + 208) unlock];
}

- (BOOL)isCatacombAccessible
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v4 = __osLogTrace;
  }
  else {
    uint64_t v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "isCatacombAccessible\n", (uint8_t *)v8, 2u);
  }
  BOOL v5 = [(BiometricKitXPCServer *)self isClassCFileAccessible];
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = v3;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "isCatacombAccessible -> %d\n", (uint8_t *)v8, 8u);
  }
  return v5;
}

- (int)writeStringToPersistentLog:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08840] fileHandleForWritingAtPath:@"/var/mobile/Library/Logs/biometrickitd.log"];
  if (v4
    || ([MEMORY[0x263F08850] defaultManager],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [v5 createFileAtPath:@"/var/mobile/Library/Logs/biometrickitd.log" contents:0 attributes:0], v5, objc_msgSend(MEMORY[0x263F08840], "fileHandleForWritingAtPath:", @"/var/mobile/Library/Logs/biometrickitd.log"), (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v4 seekToEndOfFile];
    uint64_t v6 = [v3 dataUsingEncoding:4];
    [v4 writeData:v6];

    id v7 = [@"\n" dataUsingEncoding:4];
    [v4 writeData:v7];

    int v8 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v9 = [v8 attributesOfItemAtPath:@"/var/mobile/Library/Logs/biometrickitd.log" error:0];

    if (v9)
    {
      id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F080B8]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v11 = [v10 integerValue];
      }
      else {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    [v4 closeFile];

    if (v11 > 0x200000)
    {
      unint64_t v12 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:@"/var/mobile/Library/Logs/biometrickitd.log"];
      unint64_t v13 = v12;
      if (v12)
      {
        int v14 = objc_msgSend(v12, "subdataWithRange:", v11 - 0x100000, 0x100000);

        [v14 writeToFile:@"/var/mobile/Library/Logs/biometrickitd.log" atomically:0];
      }
      else
      {
        int v14 = 0;
      }
    }
    int v15 = 0;
  }
  else
  {
    if (__osLog) {
      int v17 = __osLog;
    }
    else {
      int v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      long long v19 = "fileHandle";
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      uint64_t v23 = &unk_22004A573;
      __int16 v24 = 2080;
      uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v26 = 1024;
      int v27 = 2369;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    int v15 = 268;
  }

  return v15;
}

- (id)hexDumpData:(char *)a3 size:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v6 = [MEMORY[0x263F089D8] string];
  if (a3)
  {
    for (; a4; --a4)
    {
      unsigned int v7 = *a3++;
      objc_msgSend(v6, "appendFormat:", @"%02x", v7);
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v9 = __osLog;
    }
    else {
      uint64_t v9 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v11 = "data";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      int v15 = &unk_22004A573;
      __int16 v16 = 2080;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v18 = 1024;
      int v19 = 2425;
      _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v6;
}

- (int)logCatacombInfo:(id)a3 data:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v26[0] = 0;
  v26[1] = 0;
  int v27 = 0;
  if (v7)
  {
    ccsha1_di();
    [v7 length];
    id v8 = v7;
    [v8 bytes];
    ccdigest();
    uint64_t v9 = (void *)MEMORY[0x263F089D8];
    id v10 = [MEMORY[0x263EFF910] date];
    uint64_t v11 = [v9 stringWithFormat:@"%@ - %@: ", v10, v6];

    __int16 v12 = [(BiometricKitXPCServer *)self hexDumpData:v26 size:20];
    [v11 appendFormat:@"SHA1: %@, ", v12];

    objc_msgSend(v11, "appendFormat:", @"Size: %zu", objc_msgSend(v8, "length"));
    int v13 = [(BiometricKitXPCServer *)self writeStringToPersistentLog:v11];
  }
  else
  {
    if (__osLog) {
      int v15 = __osLog;
    }
    else {
      int v15 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v17 = "data";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      uint64_t v21 = &unk_22004A573;
      __int16 v22 = 2080;
      uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 2446;
      _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v13 = 258;
  }

  return v13;
}

- (void)logCatacombUUIDForUser:(unsigned int)a3 catacombUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = v6;
  if (v4 == -1)
  {
    if (__osLog) {
      int v17 = __osLog;
    }
    else {
      int v17 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)uint64_t v21 = "userID != 4294967295U";
    *(_WORD *)&v21[8] = 2048;
    *(void *)&v21[10] = 0;
    __int16 v22 = 2080;
    uint64_t v23 = &unk_22004A573;
    __int16 v24 = 2080;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v26 = 1024;
    int v27 = 2466;
    int v13 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
LABEL_27:
    __int16 v14 = v17;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 48;
    goto LABEL_15;
  }
  if (!v6)
  {
    id v18 = 0;
    int v8 = [(BiometricKitXPCServer *)self performGetCatacombUUIDCommand:v4 outUUID:&v18];
    id v7 = v18;
    if (v8)
    {
      if (__osLog) {
        int v17 = __osLog;
      }
      else {
        int v17 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)uint64_t v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&v21[10] = v8;
      __int16 v22 = 2080;
      uint64_t v23 = &unk_22004A573;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v26 = 1024;
      int v27 = 2470;
      int v13 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
      goto LABEL_27;
    }
  }
  if (isInternalBuild())
  {
    if (__osLog) {
      uint64_t v9 = __osLog;
    }
    else {
      uint64_t v9 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      uint64_t v11 = [v7 UUIDString];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v21 = v4;
      *(_WORD *)&v21[4] = 2112;
      *(void *)&v21[6] = v11;
      _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEFAULT, "logCatacombUUIDForUser:%u -> %@\n", buf, 0x12u);
    }
    goto LABEL_16;
  }
  v19[0] = 0;
  v19[1] = 0;
  [v7 getUUIDBytes:v19];
  if (__osLog) {
    __int16 v12 = __osLog;
  }
  else {
    __int16 v12 = &_os_log_internal;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)uint64_t v21 = v4;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = LOBYTE(v19[0]);
    *(_WORD *)&v21[10] = 1024;
    *(_DWORD *)&v21[12] = BYTE1(v19[0]);
    int v13 = "logCatacombUUIDForUser:%u -> %02X%02X***\n";
    __int16 v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 20;
LABEL_15:
    _os_log_impl(&dword_21FFF3000, v14, v15, v13, buf, v16);
  }
LABEL_16:
}

- (void)logCatacombHashForUser:(unsigned int)a3 catacombHash:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = v6;
  if (v4 == -1)
  {
    if (__osLog) {
      uint32_t v16 = __osLog;
    }
    else {
      uint32_t v16 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)__int16 v20 = "userID != 4294967295U";
    *(_WORD *)&v20[8] = 2048;
    *(void *)&v20[10] = 0;
    *(_WORD *)uint64_t v21 = 2080;
    *(void *)&v21[2] = &unk_22004A573;
    __int16 v22 = 2080;
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v24 = 1024;
    int v25 = 2492;
LABEL_27:
    _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_16;
  }
  if (!v6)
  {
    id v18 = 0;
    int v8 = [(BiometricKitXPCServer *)self performGetCatacombHashCommand:v4 outHash:&v18];
    id v7 = v18;
    if (v8)
    {
      if (__osLog) {
        uint32_t v16 = __osLog;
      }
      else {
        uint32_t v16 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v20 = "err == 0 ";
      *(_WORD *)&v20[8] = 2048;
      *(void *)&v20[10] = v8;
      *(_WORD *)uint64_t v21 = 2080;
      *(void *)&v21[2] = &unk_22004A573;
      __int16 v22 = 2080;
      uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 2496;
      goto LABEL_27;
    }
  }
  if (isInternalBuild())
  {
    if (__osLog) {
      uint64_t v9 = __osLog;
    }
    else {
      uint64_t v9 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      uint64_t v11 = [v7 debugDescription];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)__int16 v20 = v4;
      *(_WORD *)&v20[4] = 2112;
      *(void *)&v20[6] = v11;
      _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEFAULT, "logCatacombHashForUser:%u -> %@\n", buf, 0x12u);

LABEL_15:
    }
  }
  else
  {
    __int16 v17 = 0;
    [v7 getBytes:&v17 length:2];
    if (__osLog) {
      __int16 v12 = __osLog;
    }
    else {
      __int16 v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = v17;
      int v14 = HIBYTE(v17);
      id v10 = v12;
      uint64_t v15 = [v7 length];
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)__int16 v20 = v4;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v13;
      *(_WORD *)&v20[10] = 1024;
      *(_DWORD *)&v20[12] = v14;
      *(_WORD *)&v20[16] = 2048;
      *(void *)uint64_t v21 = v15;
      _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEFAULT, "logCatacombHashForUser:%u -> %02x%02x*** (len=%lu)\n", buf, 0x1Eu);
      goto LABEL_15;
    }
  }
LABEL_16:
}

- (int)filterIdentities:(id)a3 withFilter:(id)a4
{
  uint64_t v232 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)__osLogTrace;
  if (!__osLogTrace) {
    id v7 = (void *)&_os_log_internal;
  }
  int v8 = v7;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v225 = v5;
    *(_WORD *)&v225[8] = 2112;
    *(void *)&v225[10] = v6;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "filterIdentities:withFilter: %@ %@\n", buf, 0x16u);
  }

  v132 = v5;
  v133 = v6;
  if (v5 && v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog) {
        v122 = __osLog;
      }
      else {
        v122 = &_os_log_internal;
      }
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v225 = "[filter isKindOfClass:[NSDictionary class]]";
        *(_WORD *)&v225[8] = 2048;
        *(void *)&v225[10] = 0;
        __int16 v226 = 2080;
        v227 = &unk_22004A573;
        __int16 v228 = 2080;
        v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v230 = 1024;
        int v231 = 2526;
        _os_log_impl(&dword_21FFF3000, v122, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_222;
    }
    uint64_t v9 = [MEMORY[0x263EFF980] arrayWithArray:v5];
    id v10 = v6;
    uint64_t v11 = (void *)v9;
    uint64_t v12 = [v10 objectForKeyedSubscript:@"BKFilterIdentity"];
    unint64_t v13 = 0x263EFF000uLL;
    if (v12)
    {
      int v14 = (void *)v12;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObject:v14];

        int v14 = (void *)v15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog) {
          v123 = __osLog;
        }
        else {
          v123 = &_os_log_internal;
        }
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v225 = "[value isKindOfClass:[NSArray class]]";
          *(_WORD *)&v225[8] = 2048;
          *(void *)&v225[10] = 0;
          __int16 v226 = 2080;
          v227 = &unk_22004A573;
          __int16 v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v230 = 1024;
          int v231 = 2535;
          _os_log_impl(&dword_21FFF3000, v123, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        goto LABEL_279;
      }
      id v138 = [MEMORY[0x263EFF980] arrayWithArray:v11];
      [v11 removeAllObjects];
      long long v208 = 0u;
      long long v209 = 0u;
      long long v206 = 0u;
      long long v207 = 0u;
      id obj = v14;
      uint64_t v143 = [obj countByEnumeratingWithState:&v206 objects:v223 count:16];
      if (v143)
      {
        id v135 = *(id *)v207;
        while (2)
        {
          uint64_t v16 = 0;
          do
          {
            if (*(id *)v207 != v135) {
              objc_enumerationMutation(obj);
            }
            __int16 v17 = *(void **)(*((void *)&v206 + 1) + 8 * v16);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (__osLog) {
                v110 = __osLog;
              }
              else {
                v110 = &_os_log_internal;
              }
              if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(void *)v225 = "[obj isKindOfClass:[BiometricKitIdentity class]]";
                *(_WORD *)&v225[8] = 2048;
                *(void *)&v225[10] = 0;
                __int16 v226 = 2080;
                v227 = &unk_22004A573;
                __int16 v228 = 2080;
                v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                __int16 v230 = 1024;
                int v231 = 2541;
                _os_log_impl(&dword_21FFF3000, v110, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              v111 = obj;

              v112 = v138;
              goto LABEL_220;
            }
            uint64_t v148 = v16;
            long long v204 = 0u;
            long long v205 = 0u;
            long long v202 = 0u;
            long long v203 = 0u;
            id v18 = v138;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v202 objects:v222 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v203;
              do
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v203 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v23 = *(void **)(*((void *)&v202 + 1) + 8 * i);
                  __int16 v24 = [v23 uuid];
                  int v25 = [v17 uuid];
                  if ([v24 isEqual:v25]
                    && (int v26 = [v23 userID], v26 == objc_msgSend(v17, "userID"))
                    && (int v27 = [v23 type], v27 == objc_msgSend(v17, "type")))
                  {
                    char v28 = [v11 containsObject:v23];

                    if ((v28 & 1) == 0) {
                      [v11 addObject:v23];
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v202 objects:v222 count:16];
              }
              while (v20);
            }

            uint64_t v16 = v148 + 1;
          }
          while (v148 + 1 != v143);
          uint64_t v143 = [obj countByEnumeratingWithState:&v206 objects:v223 count:16];
          if (v143) {
            continue;
          }
          break;
        }
      }

      unint64_t v13 = 0x263EFF000;
    }
    else
    {
      id v138 = 0;
    }
    uint64_t v29 = [v133 objectForKeyedSubscript:@"BKFilterUUID"];
    if (v29)
    {
      __int16 v30 = (void *)v29;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v31 = [*(id *)(v13 + 2240) arrayWithObject:v30];

        __int16 v30 = (void *)v31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog) {
          v124 = __osLog;
        }
        else {
          v124 = &_os_log_internal;
        }
        if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v225 = "[value isKindOfClass:[NSArray class]]";
          *(_WORD *)&v225[8] = 2048;
          *(void *)&v225[10] = 0;
          __int16 v226 = 2080;
          v227 = &unk_22004A573;
          __int16 v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v230 = 1024;
          int v231 = 2560;
          _os_log_impl(&dword_21FFF3000, v124, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        v125 = v138;
        goto LABEL_286;
      }
      v144 = [MEMORY[0x263EFF980] arrayWithArray:v11];

      [v11 removeAllObjects];
      long long v200 = 0u;
      long long v201 = 0u;
      long long v198 = 0u;
      long long v199 = 0u;
      id v136 = v30;
      uint64_t v149 = [v136 countByEnumeratingWithState:&v198 objects:v221 count:16];
      if (v149)
      {
        id v139 = *(id *)v199;
        while (2)
        {
          for (uint64_t j = 0; j != v149; ++j)
          {
            if (*(id *)v199 != v139) {
              objc_enumerationMutation(v136);
            }
            uint64_t v33 = *(void *)(*((void *)&v198 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (__osLog) {
                v113 = __osLog;
              }
              else {
                v113 = &_os_log_internal;
              }
              if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(void *)v225 = "[obj isKindOfClass:[NSUUID class]]";
                *(_WORD *)&v225[8] = 2048;
                *(void *)&v225[10] = 0;
                __int16 v226 = 2080;
                v227 = &unk_22004A573;
                __int16 v228 = 2080;
                v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                __int16 v230 = 1024;
                int v231 = 2566;
                _os_log_impl(&dword_21FFF3000, v113, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              v111 = v136;
              goto LABEL_219;
            }
            long long v196 = 0u;
            long long v197 = 0u;
            long long v194 = 0u;
            long long v195 = 0u;
            id v34 = v144;
            uint64_t v35 = [v34 countByEnumeratingWithState:&v194 objects:v220 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v195;
              do
              {
                for (uint64_t k = 0; k != v36; ++k)
                {
                  if (*(void *)v195 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  uint64_t v39 = *(void **)(*((void *)&v194 + 1) + 8 * k);
                  int v40 = [v39 uuid];
                  if ([v40 isEqual:v33])
                  {
                    char v41 = [v11 containsObject:v39];

                    if ((v41 & 1) == 0) {
                      [v11 addObject:v39];
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v194 objects:v220 count:16];
              }
              while (v36);
            }
          }
          uint64_t v149 = [v136 countByEnumeratingWithState:&v198 objects:v221 count:16];
          if (v149) {
            continue;
          }
          break;
        }
      }

      unint64_t v13 = 0x263EFF000;
    }
    else
    {
      v144 = v138;
    }
    uint64_t v42 = [v133 objectForKeyedSubscript:@"BKFilterUserID"];
    if (v42)
    {
      __int16 v30 = (void *)v42;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v43 = [*(id *)(v13 + 2240) arrayWithObject:v30];

        __int16 v30 = (void *)v43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog) {
          v126 = __osLog;
        }
        else {
          v126 = &_os_log_internal;
        }
        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v225 = "[value isKindOfClass:[NSArray class]]";
          *(_WORD *)&v225[8] = 2048;
          *(void *)&v225[10] = 0;
          __int16 v226 = 2080;
          v227 = &unk_22004A573;
          __int16 v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v230 = 1024;
          int v231 = 2582;
          _os_log_impl(&dword_21FFF3000, v126, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
LABEL_285:

        v125 = v144;
LABEL_286:

        goto LABEL_222;
      }
      v150 = [MEMORY[0x263EFF980] arrayWithArray:v11];

      [v11 removeAllObjects];
      long long v192 = 0u;
      long long v193 = 0u;
      long long v190 = 0u;
      long long v191 = 0u;
      id v140 = v30;
      uint64_t v44 = [v140 countByEnumeratingWithState:&v190 objects:v219 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v145 = *(void *)v191;
        while (2)
        {
          for (uint64_t m = 0; m != v45; ++m)
          {
            if (*(void *)v191 != v145) {
              objc_enumerationMutation(v140);
            }
            uint64_t v47 = *(void **)(*((void *)&v190 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (__osLog) {
                v114 = __osLog;
              }
              else {
                v114 = &_os_log_internal;
              }
              if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(void *)v225 = "[obj isKindOfClass:[NSNumber class]]";
                *(_WORD *)&v225[8] = 2048;
                *(void *)&v225[10] = 0;
                __int16 v226 = 2080;
                v227 = &unk_22004A573;
                __int16 v228 = 2080;
                v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                __int16 v230 = 1024;
                int v231 = 2588;
LABEL_210:
                _os_log_impl(&dword_21FFF3000, v114, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              goto LABEL_211;
            }
            long long v188 = 0u;
            long long v189 = 0u;
            long long v186 = 0u;
            long long v187 = 0u;
            id v48 = v150;
            uint64_t v49 = [v48 countByEnumeratingWithState:&v186 objects:v218 count:16];
            if (v49)
            {
              uint64_t v50 = v49;
              uint64_t v51 = *(void *)v187;
              do
              {
                for (uint64_t n = 0; n != v50; ++n)
                {
                  if (*(void *)v187 != v51) {
                    objc_enumerationMutation(v48);
                  }
                  id v53 = *(void **)(*((void *)&v186 + 1) + 8 * n);
                  int v54 = [v53 userID];
                  if (v54 == [v47 intValue]
                    && ([v11 containsObject:v53] & 1) == 0)
                  {
                    [v11 addObject:v53];
                  }
                }
                uint64_t v50 = [v48 countByEnumeratingWithState:&v186 objects:v218 count:16];
              }
              while (v50);
            }
          }
          uint64_t v45 = [v140 countByEnumeratingWithState:&v190 objects:v219 count:16];
          if (v45) {
            continue;
          }
          break;
        }
      }

      unint64_t v13 = 0x263EFF000;
    }
    else
    {
      v150 = v144;
    }
    uint64_t v55 = [v133 objectForKeyedSubscript:@"BKFilterType"];
    if (v55)
    {
      __int16 v30 = (void *)v55;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v56 = [*(id *)(v13 + 2240) arrayWithObject:v30];

        __int16 v30 = (void *)v56;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog) {
          v127 = __osLog;
        }
        else {
          v127 = &_os_log_internal;
        }
        if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v225 = "[value isKindOfClass:[NSArray class]]";
          *(_WORD *)&v225[8] = 2048;
          *(void *)&v225[10] = 0;
          __int16 v226 = 2080;
          v227 = &unk_22004A573;
          __int16 v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v230 = 1024;
          int v231 = 2604;
          _os_log_impl(&dword_21FFF3000, v127, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        v125 = v150;
        goto LABEL_286;
      }
      v144 = [MEMORY[0x263EFF980] arrayWithArray:v11];

      [v11 removeAllObjects];
      long long v184 = 0u;
      long long v185 = 0u;
      long long v182 = 0u;
      long long v183 = 0u;
      id v141 = v30;
      uint64_t v57 = [v141 countByEnumeratingWithState:&v182 objects:v217 count:16];
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v151 = *(void *)v183;
        while (2)
        {
          for (iuint64_t i = 0; ii != v58; ++ii)
          {
            if (*(void *)v183 != v151) {
              objc_enumerationMutation(v141);
            }
            long long v60 = *(void **)(*((void *)&v182 + 1) + 8 * ii);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (__osLog) {
                v115 = __osLog;
              }
              else {
                v115 = &_os_log_internal;
              }
              if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(void *)v225 = "[obj isKindOfClass:[NSNumber class]]";
                *(_WORD *)&v225[8] = 2048;
                *(void *)&v225[10] = 0;
                __int16 v226 = 2080;
                v227 = &unk_22004A573;
                __int16 v228 = 2080;
                v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                __int16 v230 = 1024;
                int v231 = 2610;
LABEL_217:
                _os_log_impl(&dword_21FFF3000, v115, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              goto LABEL_218;
            }
            long long v180 = 0u;
            long long v181 = 0u;
            long long v178 = 0u;
            long long v179 = 0u;
            id v61 = v144;
            uint64_t v62 = [v61 countByEnumeratingWithState:&v178 objects:v216 count:16];
            if (v62)
            {
              uint64_t v63 = v62;
              uint64_t v64 = *(void *)v179;
              do
              {
                for (juint64_t j = 0; jj != v63; ++jj)
                {
                  if (*(void *)v179 != v64) {
                    objc_enumerationMutation(v61);
                  }
                  objc_super v66 = *(void **)(*((void *)&v178 + 1) + 8 * jj);
                  int v67 = [v66 type];
                  if (v67 == [v60 intValue]
                    && ([v11 containsObject:v66] & 1) == 0)
                  {
                    [v11 addObject:v66];
                  }
                }
                uint64_t v63 = [v61 countByEnumeratingWithState:&v178 objects:v216 count:16];
              }
              while (v63);
            }
          }
          uint64_t v58 = [v141 countByEnumeratingWithState:&v182 objects:v217 count:16];
          if (v58) {
            continue;
          }
          break;
        }
      }

      unint64_t v13 = 0x263EFF000;
    }
    else
    {
      v144 = v150;
    }
    uint64_t v68 = [v133 objectForKeyedSubscript:@"BKFilterAttribute"];
    if (v68)
    {
      uint64_t v69 = (void *)v68;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v70 = [*(id *)(v13 + 2240) arrayWithObject:v69];

        uint64_t v69 = (void *)v70;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog) {
          v128 = __osLog;
        }
        else {
          v128 = &_os_log_internal;
        }
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v225 = "[value isKindOfClass:[NSArray class]]";
          *(_WORD *)&v225[8] = 2048;
          *(void *)&v225[10] = 0;
          __int16 v226 = 2080;
          v227 = &unk_22004A573;
          __int16 v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v230 = 1024;
          int v231 = 2626;
          _os_log_impl(&dword_21FFF3000, v128, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        goto LABEL_222;
      }
      v150 = [MEMORY[0x263EFF980] arrayWithArray:v11];

      [v11 removeAllObjects];
      long long v176 = 0u;
      long long v177 = 0u;
      long long v174 = 0u;
      long long v175 = 0u;
      id v140 = v69;
      uint64_t v71 = [v140 countByEnumeratingWithState:&v174 objects:v215 count:16];
      if (v71)
      {
        uint64_t v72 = v71;
        uint64_t v146 = *(void *)v175;
LABEL_114:
        uint64_t v73 = 0;
        while (1)
        {
          if (*(void *)v175 != v146) {
            objc_enumerationMutation(v140);
          }
          __int16 v74 = *(void **)(*((void *)&v174 + 1) + 8 * v73);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          long long v172 = 0u;
          long long v173 = 0u;
          long long v170 = 0u;
          long long v171 = 0u;
          id v75 = v150;
          uint64_t v76 = [v75 countByEnumeratingWithState:&v170 objects:v214 count:16];
          if (v76)
          {
            uint64_t v77 = v76;
            uint64_t v78 = *(void *)v171;
            do
            {
              for (kuint64_t k = 0; kk != v77; ++kk)
              {
                if (*(void *)v171 != v78) {
                  objc_enumerationMutation(v75);
                }
                int v80 = *(void **)(*((void *)&v170 + 1) + 8 * kk);
                int v81 = [v80 attribute];
                if (v81 == [v74 intValue]
                  && ([v11 containsObject:v80] & 1) == 0)
                {
                  [v11 addObject:v80];
                }
              }
              uint64_t v77 = [v75 countByEnumeratingWithState:&v170 objects:v214 count:16];
            }
            while (v77);
          }

          if (++v73 == v72)
          {
            uint64_t v72 = [v140 countByEnumeratingWithState:&v174 objects:v215 count:16];
            if (v72) {
              goto LABEL_114;
            }
            goto LABEL_130;
          }
        }
        if (__osLog) {
          v114 = __osLog;
        }
        else {
          v114 = &_os_log_internal;
        }
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v225 = "[obj isKindOfClass:[NSNumber class]]";
          *(_WORD *)&v225[8] = 2048;
          *(void *)&v225[10] = 0;
          __int16 v226 = 2080;
          v227 = &unk_22004A573;
          __int16 v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v230 = 1024;
          int v231 = 2632;
          goto LABEL_210;
        }
LABEL_211:
        v111 = v140;

        v112 = v150;
LABEL_220:

LABEL_221:
        goto LABEL_222;
      }
LABEL_130:

      unint64_t v13 = 0x263EFF000;
    }
    else
    {
      v150 = v144;
    }
    uint64_t v82 = [v133 objectForKeyedSubscript:@"BKFilterEntity"];
    if (!v82)
    {
      v144 = v150;
LABEL_156:
      uint64_t v95 = [v133 objectForKeyedSubscript:@"BKFilterName"];
      if (!v95)
      {
        v97 = v144;
LABEL_182:
        [v132 setArray:v11];

        int v109 = 0;
        goto LABEL_223;
      }
      __int16 v30 = (void *)v95;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v96 = [*(id *)(v13 + 2240) arrayWithObject:v30];

        __int16 v30 = (void *)v96;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v97 = [MEMORY[0x263EFF980] arrayWithArray:v11];

        [v11 removeAllObjects];
        long long v160 = 0u;
        long long v161 = 0u;
        long long v158 = 0u;
        long long v159 = 0u;
        id v137 = v30;
        uint64_t v153 = [v137 countByEnumeratingWithState:&v158 objects:v211 count:16];
        if (v153)
        {
          id v142 = v97;
          uint64_t v147 = *(void *)v159;
          while (2)
          {
            for (muint64_t m = 0; mm != v153; ++mm)
            {
              if (*(void *)v159 != v147) {
                objc_enumerationMutation(v137);
              }
              uint64_t v99 = *(void *)(*((void *)&v158 + 1) + 8 * mm);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v119 = (void *)__osLog;
                if (!__osLog) {
                  v119 = (void *)&_os_log_internal;
                }
                v120 = v119;
                if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  *(void *)v225 = "[obj isKindOfClass:[NSString class]]";
                  *(_WORD *)&v225[8] = 2048;
                  *(void *)&v225[10] = 0;
                  __int16 v226 = 2080;
                  v227 = &unk_22004A573;
                  __int16 v228 = 2080;
                  v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                  __int16 v230 = 1024;
                  int v231 = 2676;
                  _os_log_impl(&dword_21FFF3000, v120, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }

                v111 = v137;
                goto LABEL_221;
              }
              long long v156 = 0u;
              long long v157 = 0u;
              long long v154 = 0u;
              long long v155 = 0u;
              id v100 = v97;
              uint64_t v101 = [v100 countByEnumeratingWithState:&v154 objects:v210 count:16];
              if (v101)
              {
                uint64_t v102 = v101;
                uint64_t v103 = *(void *)v155;
                do
                {
                  for (nuint64_t n = 0; nn != v102; ++nn)
                  {
                    if (*(void *)v155 != v103) {
                      objc_enumerationMutation(v100);
                    }
                    v105 = *(void **)(*((void *)&v154 + 1) + 8 * nn);
                    v106 = [v105 name];
                    if (([v106 isEqual:v99] & 1) == 0
                      && ([v105 name], uint64_t v107 = objc_claimAutoreleasedReturnValue(), v107 | v99))
                    {
                    }
                    else
                    {
                      char v108 = [v11 containsObject:v105];

                      if ((v108 & 1) == 0) {
                        [v11 addObject:v105];
                      }
                    }
                  }
                  uint64_t v102 = [v100 countByEnumeratingWithState:&v154 objects:v210 count:16];
                }
                while (v102);
              }

              v97 = v142;
            }
            uint64_t v153 = [v137 countByEnumeratingWithState:&v158 objects:v211 count:16];
            if (v153) {
              continue;
            }
            break;
          }
        }

        goto LABEL_182;
      }
      v130 = (void *)__osLog;
      if (!__osLog) {
        v130 = (void *)&_os_log_internal;
      }
      v131 = v130;
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v225 = "[value isKindOfClass:[NSArray class]]";
        *(_WORD *)&v225[8] = 2048;
        *(void *)&v225[10] = 0;
        __int16 v226 = 2080;
        v227 = &unk_22004A573;
        __int16 v228 = 2080;
        v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v230 = 1024;
        int v231 = 2670;
        _os_log_impl(&dword_21FFF3000, v131, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      goto LABEL_285;
    }
    int v14 = (void *)v82;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v83 = [*(id *)(v13 + 2240) arrayWithObject:v14];

      int v14 = (void *)v83;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v144 = [MEMORY[0x263EFF980] arrayWithArray:v11];

      [v11 removeAllObjects];
      long long v168 = 0u;
      long long v169 = 0u;
      long long v166 = 0u;
      long long v167 = 0u;
      id v141 = v14;
      uint64_t v84 = [v141 countByEnumeratingWithState:&v166 objects:v213 count:16];
      if (v84)
      {
        uint64_t v85 = v84;
        uint64_t v152 = *(void *)v167;
LABEL_138:
        uint64_t v86 = 0;
        while (1)
        {
          if (*(void *)v167 != v152) {
            objc_enumerationMutation(v141);
          }
          v87 = *(void **)(*((void *)&v166 + 1) + 8 * v86);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          long long v164 = 0u;
          long long v165 = 0u;
          long long v162 = 0u;
          long long v163 = 0u;
          id v88 = v144;
          uint64_t v89 = [v88 countByEnumeratingWithState:&v162 objects:v212 count:16];
          if (v89)
          {
            uint64_t v90 = v89;
            uint64_t v91 = *(void *)v163;
            do
            {
              for (uint64_t i1 = 0; i1 != v90; ++i1)
              {
                if (*(void *)v163 != v91) {
                  objc_enumerationMutation(v88);
                }
                v93 = *(void **)(*((void *)&v162 + 1) + 8 * i1);
                int v94 = [v93 entity];
                if (v94 == [v87 intValue]
                  && ([v11 containsObject:v93] & 1) == 0)
                {
                  [v11 addObject:v93];
                }
              }
              uint64_t v90 = [v88 countByEnumeratingWithState:&v162 objects:v212 count:16];
            }
            while (v90);
          }

          if (++v86 == v85)
          {
            uint64_t v85 = [v141 countByEnumeratingWithState:&v166 objects:v213 count:16];
            if (v85) {
              goto LABEL_138;
            }
            goto LABEL_154;
          }
        }
        if (__osLog) {
          v115 = __osLog;
        }
        else {
          v115 = &_os_log_internal;
        }
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v225 = "[obj isKindOfClass:[NSNumber class]]";
          *(_WORD *)&v225[8] = 2048;
          *(void *)&v225[10] = 0;
          __int16 v226 = 2080;
          v227 = &unk_22004A573;
          __int16 v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v230 = 1024;
          int v231 = 2654;
          goto LABEL_217;
        }
LABEL_218:
        v111 = v141;
LABEL_219:

        v112 = v144;
        goto LABEL_220;
      }
LABEL_154:

      unint64_t v13 = 0x263EFF000;
      goto LABEL_156;
    }
    if (__osLog) {
      v129 = __osLog;
    }
    else {
      v129 = &_os_log_internal;
    }
    if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v225 = "[value isKindOfClass:[NSArray class]]";
      *(_WORD *)&v225[8] = 2048;
      *(void *)&v225[10] = 0;
      __int16 v226 = 2080;
      v227 = &unk_22004A573;
      __int16 v228 = 2080;
      v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v230 = 1024;
      int v231 = 2648;
      _os_log_impl(&dword_21FFF3000, v129, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_279:
LABEL_222:
    int v109 = 258;
    goto LABEL_223;
  }
  if (__osLog) {
    v121 = __osLog;
  }
  else {
    v121 = &_os_log_internal;
  }
  if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)v225 = "filter != ((void *)0) && identities != ((void *)0)";
    *(_WORD *)&v225[8] = 2048;
    *(void *)&v225[10] = 0;
    __int16 v226 = 2080;
    v227 = &unk_22004A573;
    __int16 v228 = 2080;
    v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v230 = 1024;
    int v231 = 2525;
    _os_log_impl(&dword_21FFF3000, v121, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  int v109 = 263;
LABEL_223:
  v116 = (void *)__osLogTrace;
  if (!__osLogTrace) {
    v116 = (void *)&_os_log_internal;
  }
  v117 = v116;
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v225 = v109;
    *(_WORD *)&v225[4] = 2112;
    *(void *)&v225[6] = v132;
    _os_log_impl(&dword_21FFF3000, v117, OS_LOG_TYPE_DEBUG, "filterIdentities:withFilter: -> %d (%@)\n", buf, 0x12u);
  }

  return v109;
}

- (int)parseAuthDict:(id)a3 toAuthData:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = (char *)a3;
  id v6 = &_os_log_internal;
  if (__osLogTrace) {
    id v7 = __osLogTrace;
  }
  else {
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v27 = 138412546;
    char v28 = v5;
    __int16 v29 = 2048;
    __int16 v30 = a4;
    _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_DEBUG, "parseAuthDict:toAuthData: %@ %p\n", (uint8_t *)&v27, 0x16u);
  }
  if (!a4)
  {
    if (__osLog) {
      __int16 v24 = __osLog;
    }
    else {
      __int16 v24 = v6;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136316162;
      char v28 = "authData";
      __int16 v29 = 2048;
      __int16 v30 = 0;
      __int16 v31 = 2080;
      id v32 = &unk_22004A573;
      __int16 v33 = 2080;
      id v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v35 = 1024;
      int v36 = 2713;
      _os_log_impl(&dword_21FFF3000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v27, 0x30u);
    }
    goto LABEL_54;
  }
  *(void *)&a4->var2[24] = 0;
  *(_OWORD *)&a4->unsigned int var0 = 0u;
  *(_OWORD *)&a4->var2[8] = 0u;
  if (!v5) {
    goto LABEL_24;
  }
  int v8 = @"BKOptionAuthWithCredentialSet";
  uint64_t v9 = [v5 objectForKeyedSubscript:@"BKOptionAuthWithCredentialSet"];

  if (v9) {
    goto LABEL_11;
  }
  int v8 = @"BKOptionEnrollWithCredentialSet";
  id v10 = [v5 objectForKeyedSubscript:@"BKOptionEnrollWithCredentialSet"];

  if (v10
    || (int v8 = @"BKOptionMatchCredentialSetForExtendEnrollment",
        [v5 objectForKeyedSubscript:@"BKOptionMatchCredentialSetForExtendEnrollment"],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
LABEL_11:
    unsigned int v12 = 0;
  }
  else
  {
    int v8 = @"BKOptionAuthWithAuthToken";
    id v18 = [v5 objectForKeyedSubscript:@"BKOptionAuthWithAuthToken"];

    if (!v18)
    {
      int v8 = @"BKOptionEnrollWithAuthToken";
      uint64_t v19 = [v5 objectForKeyedSubscript:@"BKOptionEnrollWithAuthToken"];

      if (!v19)
      {
        int v8 = @"BKOptionMatchAuthTokenForExtendEnrollment";
        uint64_t v20 = [v5 objectForKeyedSubscript:@"BKOptionMatchAuthTokenForExtendEnrollment"];

        if (!v20)
        {
          int v8 = @"BKOptionMatchAuthTokenToBypassPasscodeBiolockout";
          uint64_t v21 = [v5 objectForKeyedSubscript:@"BKOptionMatchAuthTokenToBypassPasscodeBiolockout"];

          if (!v21) {
            goto LABEL_24;
          }
        }
      }
    }
    unsigned int v12 = 1;
  }
  uint64_t v13 = [v5 objectForKeyedSubscript:v8];
  if (!v13)
  {
LABEL_24:
    int v17 = 0;
    a4->unsigned int var0 = 1;
    goto LABEL_25;
  }
  id v14 = (id)v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (__osLog) {
      int v25 = __osLog;
    }
    else {
      int v25 = v6;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136316162;
      char v28 = "[value isKindOfClass:[NSData class]]";
      __int16 v29 = 2048;
      __int16 v30 = 0;
      __int16 v31 = 2080;
      id v32 = &unk_22004A573;
      __int16 v33 = 2080;
      id v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v35 = 1024;
      int v36 = 2746;
      _os_log_impl(&dword_21FFF3000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v27, 0x30u);
    }
    goto LABEL_53;
  }
  id v14 = v14;
  unint64_t v15 = [v14 length];
  if (v15 >= 0x21)
  {
    if (__osLog) {
      int v26 = __osLog;
    }
    else {
      int v26 = v6;
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    int v27 = 136316162;
    char v28 = "dataLength <= 32";
    __int16 v29 = 2048;
    __int16 v30 = 0;
    __int16 v31 = 2080;
    id v32 = &unk_22004A573;
    __int16 v33 = 2080;
    id v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v35 = 1024;
    int v36 = 2750;
  }
  else
  {
    BOOL v16 = (v15 & 0xFFFFFFFFFFFFFFEFLL) != 0;
    if (!v12) {
      BOOL v16 = v15 == 0;
    }
    if (!v16)
    {
      a4->unsigned int var0 = v12;
      a4->var1 = v15;
      objc_msgSend(v14, "getBytes:length:", a4->var2);

      int v17 = 0;
      goto LABEL_25;
    }
    if (__osLog) {
      int v26 = __osLog;
    }
    else {
      int v26 = v6;
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    int v27 = 136316162;
    char v28 = "(authToken && (!dataLength || (dataLength == 16)) || (!authToken && dataLength))";
    __int16 v29 = 2048;
    __int16 v30 = 0;
    __int16 v31 = 2080;
    id v32 = &unk_22004A573;
    __int16 v33 = 2080;
    id v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v35 = 1024;
    int v36 = 2751;
  }
  _os_log_impl(&dword_21FFF3000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v27, 0x30u);
LABEL_52:

LABEL_53:
LABEL_54:
  int v17 = 258;
LABEL_25:
  if (__osLogTrace) {
    __int16 v22 = __osLogTrace;
  }
  else {
    __int16 v22 = v6;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v27 = 67109120;
    LODWORD(v28) = v17;
    _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_DEBUG, "parseAuthDict:toAuthData: -> %d\n", (uint8_t *)&v27, 8u);
  }

  return v17;
}

- (BOOL)lastDisplayState
{
  return self->_lastDisplayState > 0;
}

- (BOOL)isDisplayOn
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = &_os_log_internal;
  if (__osLog) {
    uint64_t v4 = __osLog;
  }
  else {
    uint64_t v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "isDisplayOn\n", buf, 2u);
  }
  int valuePtr = 0;
  io_registry_entry_t backlightService = self->_backlightService;
  if (!backlightService)
  {
    if (__osLog) {
      uint64_t v13 = __osLog;
    }
    else {
      uint64_t v13 = v3;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136316162;
    int v17 = "_backlightService";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    uint64_t v21 = &unk_22004A573;
    __int16 v22 = 2080;
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v24 = 1024;
    int v25 = 2791;
    goto LABEL_28;
  }
  CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(backlightService, @"IODisplayParameters", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFDictionaryRef v7 = CFProperty;
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(CFProperty, @"brightness");
    if (Value)
    {
      CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(Value, @"value");
      if (v9)
      {
        CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
LABEL_11:
        CFRelease(v7);
        BOOL v10 = valuePtr != 0;
        goto LABEL_12;
      }
      if (__osLog) {
        id v14 = __osLog;
      }
      else {
        id v14 = v3;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136316162;
      int v17 = "cfBrightnessValue";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      uint64_t v21 = &unk_22004A573;
      __int16 v22 = 2080;
      uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 2800;
    }
    else
    {
      if (__osLog) {
        id v14 = __osLog;
      }
      else {
        id v14 = v3;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136316162;
      int v17 = "cfBrightnessKey";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      uint64_t v21 = &unk_22004A573;
      __int16 v22 = 2080;
      uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 2797;
    }
    _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_11;
  }
  if (__osLog) {
    uint64_t v13 = __osLog;
  }
  else {
    uint64_t v13 = v3;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    int v17 = "cfProperty";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    uint64_t v21 = &unk_22004A573;
    __int16 v22 = 2080;
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v24 = 1024;
    int v25 = 2794;
LABEL_28:
    _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_29:
  BOOL v10 = 0;
LABEL_12:
  if (__osLog) {
    uint64_t v11 = __osLog;
  }
  else {
    uint64_t v11 = v3;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v10;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "isDisplayOn -> %d\n", buf, 8u);
  }
  return v10;
}

- (int)displayStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = &_os_log_internal;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 67109120;
    LODWORD(v15) = v3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "displayStateChanged: %d\n", (uint8_t *)&v14, 8u);
  }
  if (self->_lastDisplayState == v3) {
    goto LABEL_13;
  }
  int v7 = [(BiometricKitXPCServer *)self performDisplayStatusChangedCommand:v3];
  if (!v7)
  {
    self->_lastDisplayState = v3;
    if (__osLog) {
      int v8 = __osLog;
    }
    else {
      int v8 = v5;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      LODWORD(v15) = v3;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEFAULT, "displayStateChanged: (_lastDisplayState !=) %d\n", (uint8_t *)&v14, 8u);
    }
LABEL_13:
    if (__osLogTrace) {
      CFNumberRef v9 = __osLogTrace;
    }
    else {
      CFNumberRef v9 = v5;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 67109120;
      LODWORD(v15) = 0;
      _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_DEBUG, "displayStateChanged: -> %d\n", (uint8_t *)&v14, 8u);
    }
    return 0;
  }
  int v10 = v7;
  if (__osLog) {
    unsigned int v12 = __osLog;
  }
  else {
    unsigned int v12 = v5;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136316162;
    unint64_t v15 = "err == 0 ";
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    __int16 v18 = 2080;
    uint64_t v19 = &unk_22004A573;
    __int16 v20 = 2080;
    uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v22 = 1024;
    int v23 = 2829;
    _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
  }
  if (__osLogTrace) {
    uint64_t v13 = __osLogTrace;
  }
  else {
    uint64_t v13 = v5;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v14 = 67109120;
    LODWORD(v15) = v10;
    _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "displayStateChanged: -> %d\n", (uint8_t *)&v14, 8u);
  }
  return v10;
}

- (void)postGeneralLockoutStateNotification
{
  if (__osLogTrace) {
    id v2 = __osLogTrace;
  }
  else {
    id v2 = &_os_log_internal;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_21FFF3000, v2, OS_LOG_TYPE_DEBUG, "postGeneralLockoutStateNotification\n", v3, 2u);
  }
  notify_post("com.apple.BiometricKit.generalLockoutStateChanged");
}

- (void)updateEnrollmentChangedNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = &_os_log_internal;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v12[0] = 67109120;
    v12[1] = v3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "updateEnrollmentChangedNotification: %d\n", (uint8_t *)v12, 8u);
  }
  if (self->_enrollChgNtfTokenValid)
  {
    enrollChgNtfTokeuint64_t n = self->_enrollChgNtfToken;
    uint64_t v8 = BYTE2(self->_mkbLockStatusNtfToken) ? 1 : [(BiometricKitXPCServer *)self identitiesCount];
    notify_set_state(enrollChgNtfToken, v8);
    if (v3) {
      notify_post("com.apple.BiometricKit.enrollmentChanged");
    }
  }
  if (BYTE2(self->_mkbLockStatusNtfToken))
  {
    [(BiometricKitXPCServer *)self updateExpressModeStateWithEnrollmentCount:1];
  }
  else
  {
    CFNumberRef v9 = [(BiometricKitXPCServer *)self identitiesOfUser:[(BiometricKitXPCServer *)self currentAccountUserID]];
    uint64_t v10 = [v9 count];

    [(BiometricKitXPCServer *)self updateExpressModeStateWithEnrollmentCount:v10];
    if (!v10) {
      [(BiometricKitXPCServer *)self updateLockoutStateNotification:0];
    }
  }
  if (__osLogTrace) {
    uint64_t v11 = __osLogTrace;
  }
  else {
    uint64_t v11 = v5;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "updateEnrollmentChangedNotification: -> void\n", (uint8_t *)v12, 2u);
  }
}

- (void)cacheUserAccountsInfo
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F841B0] sharedManager];
  uint64_t v4 = [v3 currentUser];

  BOOL v5 = v4 != 0;
  id v6 = &_os_log_internal;
  if (v4)
  {
    int v7 = [v4 uid];
  }
  else
  {
    if (__osLog) {
      uint64_t v13 = __osLog;
    }
    else {
      uint64_t v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      *(void *)__int16 v16 = "currentUser";
      *(_WORD *)&v16[8] = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      uint64_t v19 = &unk_22004A573;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v22 = 1024;
      int v23 = 2895;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    int v7 = 501;
  }
  uint64_t v8 = [MEMORY[0x263F841B0] sharedManager];
  CFNumberRef v9 = [v8 allUsers];

  if (![v9 count])
  {
    if (__osLog) {
      int v14 = __osLog;
    }
    else {
      int v14 = v6;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136316162;
      *(void *)__int16 v16 = "users.count";
      *(_WORD *)&v16[8] = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      uint64_t v19 = &unk_22004A573;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v22 = 1024;
      int v23 = 2901;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    BOOL v5 = 0;
  }
  unint64_t v10 = [v9 count];
  *(_DWORD *)(&self->_enrollChgNtfTokenValid + 1) = v7;
  BYTE1(self->_userAccountsInfo.currentAccountUserID) = v10 > 1;
  BYTE2(self->_userAccountsInfo.currentAccountUserID) = v5;
  if (__osLog) {
    uint64_t v11 = __osLog;
  }
  else {
    uint64_t v11 = v6;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = BYTE2(self->_userAccountsInfo.currentAccountUserID);
    int v15 = 67109632;
    *(_DWORD *)__int16 v16 = v7;
    *(_WORD *)&v16[4] = 1024;
    *(_DWORD *)&v16[6] = v10 > 1;
    LOWORD(v17) = 1024;
    *(_DWORD *)((char *)&v17 + 2) = v12;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEFAULT, "cacheUserAccountsInfo: currentAccountUserID = %d, hasMultipleUserAccounts = %u, valid = %u\n", (uint8_t *)&v15, 0x14u);
  }
}

- ($89967B733E8F0E8859294B5D59E7AF0F)userAccountsInfo
{
  if (!BYTE2(self->_userAccountsInfo.currentAccountUserID)) {
    [(BiometricKitXPCServer *)self cacheAndSetUserAccountsInfo];
  }
  return ($89967B733E8F0E8859294B5D59E7AF0F *)(&self->_enrollChgNtfTokenValid + 1);
}

- (unsigned)currentAccountUserID
{
  if (!BYTE2(self->_userAccountsInfo.currentAccountUserID)) {
    [(BiometricKitXPCServer *)self cacheAndSetUserAccountsInfo];
  }
  return *(_DWORD *)(&self->_enrollChgNtfTokenValid + 1);
}

- (BOOL)hasMultipleUserAccounts
{
  if (!BYTE2(self->_userAccountsInfo.currentAccountUserID)) {
    [(BiometricKitXPCServer *)self cacheAndSetUserAccountsInfo];
  }
  return BYTE1(self->_userAccountsInfo.currentAccountUserID) != 0;
}

- (void)updateLockoutStateNotification:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10[1] = *MEMORY[0x263EF8340];
  BOOL v5 = &_os_log_internal;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v10[0]) = 67109120;
    HIDWORD(v10[0]) = v3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "updateLockoutStateNotification: %u\n", (uint8_t *)v10, 8u);
  }
  if (self->_userAccountsInfoValid)
  {
    int v7 = [(BiometricKitXPCServer *)self identitiesOfUser:[(BiometricKitXPCServer *)self currentAccountUserID]];
    uint64_t v8 = (([v7 count] != 0) & (v3 >> 2)) != 0 ? 3 : 0;

    v10[0] = 0;
    if (!notify_get_state(*(_DWORD *)&self->_userAccountsInfo.hasMultipleUserAccounts, v10) && v8 != v10[0])
    {
      notify_set_state(*(_DWORD *)&self->_userAccountsInfo.hasMultipleUserAccounts, v8);
      notify_post("com.apple.BiometricKit.lockoutStateChanged");
    }
  }
  [(BiometricKitXPCServer *)self updateExpressModeStateWithLockoutState:v3];
  if (__osLogTrace) {
    CFNumberRef v9 = __osLogTrace;
  }
  else {
    CFNumberRef v9 = v5;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_DEBUG, "updateLockoutStateNotification: -> void\n", (uint8_t *)v10, 2u);
  }
}

- (void)updateExpressModeStateWithLockoutState:(unsigned int)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v5 = &_os_log_internal;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109120;
    v10[1] = a3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "updateExpressModeStateWithLockoutState: %u\n", (uint8_t *)v10, 8u);
  }
  uint64_t v7 = *(void *)&self->_expressModeChgNtfTokenValid;
  unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL | ((a3 & 0x16) != 0);
  if ((v7 & 4) != 0) {
    unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFCLL | ((a3 & 0x16) != 0) | (2 * ((a3 & 0x208) == 0));
  }
  *(void *)&self->_expressModeChgNtfTokenValid = v8;
  [(BiometricKitXPCServer *)self updateExpressModeStateNotification];
  if (__osLogTrace) {
    CFNumberRef v9 = __osLogTrace;
  }
  else {
    CFNumberRef v9 = v5;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_DEBUG, "updateExpressModeStateWithLockoutState: -> void\n", (uint8_t *)v10, 2u);
  }
}

- (void)updateExpressModeStateWithEnrollmentCount:(unsigned int)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v5 = &_os_log_internal;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 67109120;
    LODWORD(v12) = a3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "updateExpressModeStateWithEnrollmentCount: %u\n", (uint8_t *)&v11, 8u);
  }
  if (a3 != 1)
  {
    if (!a3) {
      *(void *)&self->_expressModeChgNtfTokenValid = 0;
    }
    goto LABEL_11;
  }
  if ((self->_expressModeChgNtfTokenValid & 4) != 0
    || (int v7 = [(BiometricKitXPCServer *)self getExpressModeState:&self->_expressModeChgNtfTokenValid forUser:[(BiometricKitXPCServer *)self currentAccountUserID] withClient:0]) == 0)
  {
LABEL_11:
    [(BiometricKitXPCServer *)self updateExpressModeStateNotification];
    goto LABEL_12;
  }
  int v9 = v7;
  if (__osLog) {
    unint64_t v10 = __osLog;
  }
  else {
    unint64_t v10 = v5;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136316162;
    int v12 = "[self getExpressModeState:&_expressModeState forUser:[self currentAccountUserID] withClient:((void *)0)] == 0 ";
    __int16 v13 = 2048;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = &unk_22004A573;
    __int16 v17 = 2080;
    __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v19 = 1024;
    int v20 = 3032;
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
  }
LABEL_12:
  if (__osLogTrace) {
    unint64_t v8 = __osLogTrace;
  }
  else {
    unint64_t v8 = v5;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "updateExpressModeStateWithEnrollmentCount: -> void\n", (uint8_t *)&v11, 2u);
  }
}

- (void)updateExpressModeState
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v4 = __osLogTrace;
  }
  else {
    uint64_t v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "updateExpressModeState\n", (uint8_t *)&v9, 2u);
  }
  int v5 = [(BiometricKitXPCServer *)self getExpressModeState:&self->_expressModeChgNtfTokenValid forUser:[(BiometricKitXPCServer *)self currentAccountUserID] withClient:0];
  if (v5)
  {
    int v7 = v5;
    if (__osLog) {
      unint64_t v8 = __osLog;
    }
    else {
      unint64_t v8 = v3;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      unint64_t v10 = "[self getExpressModeState:&_expressModeState forUser:[self currentAccountUserID] withClient:((void *)0)] == 0 ";
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      uint64_t v14 = &unk_22004A573;
      __int16 v15 = 2080;
      __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v17 = 1024;
      int v18 = 3049;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  else
  {
    [(BiometricKitXPCServer *)self updateExpressModeStateNotification];
  }
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = v3;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "updateExpressModeState -> void\n", (uint8_t *)&v9, 2u);
  }
}

- (void)updateExpressModeStateNotification
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v4 = __osLogTrace;
  }
  else {
    uint64_t v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)&self->_expressModeChgNtfTokenValid;
    *(_DWORD *)unint64_t v8 = 134217984;
    *(void *)&v8[4] = v5;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "updateExpressModeStateNotification %ld\n", v8, 0xCu);
  }
  if (self->_lockoutChgNtfTokenValid)
  {
    *(void *)unint64_t v8 = 0;
    if (!notify_get_state(self->_lockoutChgNtfToken, (uint64_t *)v8))
    {
      uint64_t v6 = *(void *)&self->_expressModeChgNtfTokenValid;
      if (v6 != *(void *)v8)
      {
        notify_set_state(self->_lockoutChgNtfToken, v6);
        notify_post("com.apple.BiometricKit.expressModeStateChanged");
      }
    }
  }
  if (__osLogTrace) {
    int v7 = __osLogTrace;
  }
  else {
    int v7 = v3;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unint64_t v8 = 0;
    _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_DEBUG, "updateExpressModeStateNotification -> void\n", v8, 2u);
  }
}

- (void)disconnectingClient:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (__osLog) {
    uint64_t v4 = __osLog;
  }
  else {
    uint64_t v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEFAULT, "disconnecting client: %@\n", (uint8_t *)&v5, 0xCu);
  }
}

- (id)allClients
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = self->_exportedObjects;
  objc_sync_enter(v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = self->_exportedObjects;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "clients", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)createMatchEventDictionary:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a3)
  {
    int v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", a3->var1, @"BKMatchEventResult");
    v14[1] = @"BKMatchEventTimeStamp";
    v15[0] = v5;
    uint64_t v6 = [NSNumber numberWithUnsignedLongLong:a3->var0];
    v15[1] = v6;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

    if (a3->var1)
    {
      unint64_t v8 = [(BiometricKitXPCServer *)self getIdentityObject:&a3->var1 + 1];
      if (v8)
      {
        uint64_t v9 = (void *)[v7 mutableCopy];
        [v9 setObject:v8 forKey:@"BKMatchEventMatchedIdentity"];
        uint64_t v10 = [v9 copy];

        uint64_t v7 = v9;
      }
      else
      {
        if (__osLog) {
          long long v13 = __osLog;
        }
        else {
          long long v13 = &_os_log_internal;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v17 = "matchedIdentity";
          __int16 v18 = 2048;
          uint64_t v19 = 0;
          __int16 v20 = 2080;
          uint64_t v21 = &unk_22004A573;
          __int16 v22 = 2080;
          int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v24 = 1024;
          int v25 = 3121;
          _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v10 = 0;
      }

      uint64_t v7 = (void *)v10;
    }
  }
  else
  {
    if (__osLog) {
      long long v12 = __osLog;
    }
    else {
      long long v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v17 = "matchEvent";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      uint64_t v21 = &unk_22004A573;
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 3114;
      _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v7 = 0;
  }
  return v7;
}

- (BOOL)isFingerprintModificationRestricted
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.applicationaccess"];
  id v3 = v2;
  if (v2 && [v2 objectIsForcedForKey:@"allowFingerprintModification"])
  {
    int v4 = [v3 BOOLForKey:@"allowFingerprintModification"];
    char v5 = v4 ^ 1;
    if (__osLog) {
      uint64_t v6 = __osLog;
    }
    else {
      uint64_t v6 = &_os_log_internal;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"YES";
      if (v4) {
        uint64_t v7 = @"NO";
      }
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEFAULT, "'FingerprintModification' restricted: %@\n", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (int)restoreAndSyncTemplates
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = &_os_log_internal;
  if (__osLogTrace) {
    int v4 = __osLogTrace;
  }
  else {
    int v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "restoreAndSyncTemplates\n", (uint8_t *)&v16, 2u);
  }
  int v5 = [(BiometricKitXPCServer *)self loadCatacomb];
  int v6 = v5;
  if (__osLog) {
    uint64_t v7 = __osLog;
  }
  else {
    uint64_t v7 = v3;
  }
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      __int16 v17 = "err == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = (void *)v6;
      __int16 v20 = 2080;
      uint64_t v21 = &unk_22004A573;
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 3161;
      _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    if (__osLogTrace) {
      __int16 v15 = __osLogTrace;
    }
    else {
      __int16 v15 = v3;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 67109120;
      LODWORD(v17) = v6;
      long long v12 = v15;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_17;
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = v7;
      unint64_t v9 = [(BiometricKitXPCServer *)self identitiesCount];
      uint64_t v10 = [(BiometricKitXPCServer *)self identities];
      int v16 = 134218242;
      __int16 v17 = (const char *)v9;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEFAULT, "restoreAndSyncTemplates identities %lu: %{public}@\n", (uint8_t *)&v16, 0x16u);
    }
    if (__osLogTrace) {
      uint64_t v11 = __osLogTrace;
    }
    else {
      uint64_t v11 = v3;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 67109120;
      LODWORD(v17) = 0;
      long long v12 = v11;
      os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
LABEL_17:
      _os_log_impl(&dword_21FFF3000, v12, v13, "restoreAndSyncTemplates -> %d\n", (uint8_t *)&v16, 8u);
    }
  }
  return v6;
}

- (void)clearTemplateList
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = &_os_log_internal;
  if (__osLogTrace) {
    id v3 = __osLogTrace;
  }
  else {
    id v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEBUG, "clearTemplateList\n", buf, 2u);
  }
  id obj = self->_ongoingBiometricOperation;
  objc_sync_enter(obj);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v4 = self->_ongoingBiometricOperation;
  uint64_t v5 = [(ActivityTracker *)v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        unint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v9 = __osLog;
        if (!__osLog) {
          unint64_t v9 = v2;
        }
        uint64_t v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [v8 uuid];
          *(_DWORD *)buf = 138412290;
          __int16 v20 = v11;
          _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEFAULT, "clearTemplateList removing identity %@\n", buf, 0xCu);
        }
      }
      uint64_t v5 = [(ActivityTracker *)v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }

  [(ActivityTracker *)self->_ongoingBiometricOperation removeAllObjects];
  objc_sync_exit(obj);

  if (__osLogTrace) {
    long long v12 = __osLogTrace;
  }
  else {
    long long v12 = v2;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_DEBUG, "clearTemplateList -> void\n", buf, 2u);
  }
}

- (void)clearTemplateListForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "clearTemplateListForUser: %d\n", buf, 8u);
  }
  id obj = self->_ongoingBiometricOperation;
  objc_sync_enter(obj);
  [(BiometricKitXPCServer *)self identitiesOfUser:v3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v12 = __osLog;
        if (!__osLog) {
          long long v12 = v5;
        }
        os_log_type_t v13 = v12;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          long long v14 = [v11 uuid];
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = v14;
          _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_DEFAULT, "clearTemplateListForUser: removing identity %@\n", buf, 0xCu);
        }
        [(ActivityTracker *)self->_ongoingBiometricOperation removeObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  objc_sync_exit(obj);
  if (__osLogTrace) {
    long long v15 = __osLogTrace;
  }
  else {
    long long v15 = v5;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_DEBUG, "clearTemplateListForUser: -> void\n", buf, 2u);
  }
}

- (int)handleFirstUnlock
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = &_os_log_internal;
  if (__osLogTrace) {
    int v4 = __osLogTrace;
  }
  else {
    int v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "handleFirstUnlock\n", (uint8_t *)&v11, 2u);
  }
  int v5 = [(BiometricKitXPCServer *)self handleCatacombUnlock];
  int v6 = v5;
  if (__osLogTrace) {
    id v7 = __osLogTrace;
  }
  else {
    id v7 = v3;
  }
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109120;
      int v12 = v6;
      uint64_t v8 = v7;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_14:
      _os_log_impl(&dword_21FFF3000, v8, v9, "handleFirstUnlock: -> %d\n", (uint8_t *)&v11, 8u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 67109120;
    int v12 = 0;
    uint64_t v8 = v7;
    os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
    goto LABEL_14;
  }
  return v6;
}

- (int)handleCatacombUnlock
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = &_os_log_internal;
  if (__osLogTrace) {
    int v4 = __osLogTrace;
  }
  else {
    int v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "handleCatacombUnlock\n", (uint8_t *)&v10, 2u);
  }
  if ([(BiometricKitXPCServer *)self isCatacombAccessible])
  {
    [(NSMutableArray *)self->_cachedIdentities lock];
    if (![(BiometricKitXPCServer *)self catacombFileAccessed])
    {
      [(BiometricKitXPCServer *)self restoreAndSyncTemplates];
      [(BiometricKitXPCServer *)self setCatacombFileAccessed:1];
      [(BiometricKitXPCServer *)self setTemplatesAtBoot:0];
      [(BiometricKitXPCServer *)self updateEnrollmentChangedNotification:1];
    }
    [(NSMutableArray *)self->_cachedIdentities unlock];
    if (__osLogTrace) {
      int v5 = __osLogTrace;
    }
    else {
      int v5 = v3;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 67109120;
      LODWORD(v11) = 0;
      _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEBUG, "handleCatacombUnlock: -> %d\n", (uint8_t *)&v10, 8u);
    }
    return 0;
  }
  else
  {
    if (__osLog) {
      uint64_t v8 = __osLog;
    }
    else {
      uint64_t v8 = v3;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136316162;
      int v11 = "[self isCatacombAccessible]";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      long long v15 = &unk_22004A573;
      __int16 v16 = 2080;
      long long v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v18 = 1024;
      int v19 = 3237;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
    if (__osLogTrace) {
      os_log_type_t v9 = __osLogTrace;
    }
    else {
      os_log_type_t v9 = v3;
    }
    int v6 = 261;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 67109120;
      LODWORD(v11) = 261;
      _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_ERROR, "handleCatacombUnlock: -> %d\n", (uint8_t *)&v10, 8u);
    }
  }
  return v6;
}

- (int)checkCatacombForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v5 = &_os_log_internal;
  if (__osLogTrace) {
    int v6 = __osLogTrace;
  }
  else {
    int v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 67109120;
    LODWORD(v14) = v3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "checkCatacombForUser: %d\n", (uint8_t *)&v13, 8u);
  }
  if (v3 == -1 || ([(BKCatacomb *)self->_catacomb stateOfUserComponent:v3] & 3) != 1) {
    goto LABEL_10;
  }
  int v7 = [(BiometricKitXPCServer *)self loadCatacombForUser:v3];
  if (!v7)
  {
    [(BiometricKitXPCServer *)self validateAllUsers];
    [(BiometricKitXPCServer *)self syncTemplateListForUser:v3];
LABEL_10:
    if (__osLogTrace) {
      uint64_t v8 = __osLogTrace;
    }
    else {
      uint64_t v8 = v5;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 67109120;
      LODWORD(v14) = 0;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "checkCatacombForUser: -> %d\n", (uint8_t *)&v13, 8u);
    }
    return 0;
  }
  int v9 = v7;
  if (__osLog) {
    int v11 = __osLog;
  }
  else {
    int v11 = v5;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136316162;
    __int16 v14 = "err == 0 ";
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2080;
    __int16 v18 = &unk_22004A573;
    __int16 v19 = 2080;
    uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v21 = 1024;
    int v22 = 3302;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
  }
  if (__osLogTrace) {
    __int16 v12 = __osLogTrace;
  }
  else {
    __int16 v12 = v5;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v13 = 67109120;
    LODWORD(v14) = v9;
    _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "checkCatacombForUser: -> %d\n", (uint8_t *)&v13, 8u);
  }
  return v9;
}

- (int)checkTemplatesValidityForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v5 = &_os_log_internal;
  if (__osLogTrace) {
    int v6 = __osLogTrace;
  }
  else {
    int v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "checkTemplatesValidityForUser: %d\n", buf, 8u);
  }
  char v14 = 0;
  if (![(BiometricKitXPCServer *)self identitiesCount]) {
    goto LABEL_10;
  }
  int v7 = [(BiometricKitXPCServer *)self checkCatacombForUser:v3];
  if (v7)
  {
    int v9 = v7;
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = v5;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v16 = "err == 0 ";
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    __int16 v19 = 2080;
    uint64_t v20 = &unk_22004A573;
    __int16 v21 = 2080;
    int v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v23 = 1024;
    int v24 = 3335;
LABEL_39:
    _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_18;
  }
  int v8 = [(BiometricKitXPCServer *)self performGetTemplatesValidityCommand:v3 isValid:&v14];
  if (v8)
  {
    int v9 = v8;
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = v5;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v16 = "err == 0 ";
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    __int16 v19 = 2080;
    uint64_t v20 = &unk_22004A573;
    __int16 v21 = 2080;
    int v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v23 = 1024;
    int v24 = 3339;
    goto LABEL_39;
  }
  if (v14)
  {
LABEL_10:
    int v9 = 0;
    goto LABEL_18;
  }
  if (__osLog) {
    int v10 = __osLog;
  }
  else {
    int v10 = v5;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v3;
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEFAULT, "checkTemplatesValidityForUser: removing user %u because keybag UUID has changed\n", buf, 8u);
  }
  int v9 = [(BiometricKitXPCServer *)self removeUser:v3];
  if (!v9)
  {
    [(BiometricKitXPCServer *)self saveCatacomb];
    [(BiometricKitXPCServer *)self syncTemplateListForUser:0xFFFFFFFFLL];
    goto LABEL_18;
  }
  if (__osLog) {
    int v13 = __osLog;
  }
  else {
    int v13 = v5;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v16 = "err == 0 ";
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    __int16 v19 = 2080;
    uint64_t v20 = &unk_22004A573;
    __int16 v21 = 2080;
    int v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v23 = 1024;
    int v24 = 3346;
    goto LABEL_39;
  }
LABEL_18:
  if (__osLogTrace) {
    int v11 = __osLogTrace;
  }
  else {
    int v11 = v5;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v9;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "checkTemplatesValidityForUser: -> %d\n", buf, 8u);
  }
  return v9;
}

- (int)removeUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v5 = &_os_log_internal;
  if (__osLogTrace) {
    int v6 = __osLogTrace;
  }
  else {
    int v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 67109120;
    LODWORD(v24) = v3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "removeUser: %d\n", (uint8_t *)&v23, 8u);
  }
  if (v3 == -1)
  {
    if (__osLog) {
      uint64_t v20 = __osLog;
    }
    else {
      uint64_t v20 = v5;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136316162;
      int v24 = "userID != 4294967295U";
      __int16 v25 = 2048;
      uint64_t v26 = 0;
      __int16 v27 = 2080;
      char v28 = &unk_22004A573;
      __int16 v29 = 2080;
      __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v31 = 1024;
      int v32 = 3374;
      _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v23, 0x30u);
    }
    int v7 = 258;
  }
  else
  {
    int v7 = [(BiometricKitXPCServer *)self performRemoveUserDataCommand:v3];
    if (!v7)
    {
      [(BKCatacomb *)self->_catacomb removeUser:v3];
      id v8 = self->_expressModeState;
      objc_sync_enter(v8);
      expressModeState = (void *)self->_expressModeState;
      int v10 = [NSNumber numberWithUnsignedInt:v3];
      [expressModeState removeObjectForKey:v10];

      objc_sync_exit(v8);
      int v11 = self->_catacombUserUUIDs;
      objc_sync_enter(v11);
      catacombUserUUIDs = self->_catacombUserUUIDs;
      int v13 = [NSNumber numberWithUnsignedInt:v3];
      [(NSMutableDictionary *)catacombUserUUIDs removeObjectForKey:v13];

      objc_sync_exit(v11);
      catacombLocuint64_t k = self->_catacombLock;
      __int16 v15 = +[CatacombComponent componentForUserID:v3];
      uint64_t v16 = [(BiometricKitXPCServer *)self catacombFileNameForComponent:v15];
      [(NSRecursiveLock *)catacombLock deleteFile:v16];

      if (__osLog) {
        __int16 v17 = __osLog;
      }
      else {
        __int16 v17 = v5;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 67109120;
        LODWORD(v24) = v3;
        _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_DEFAULT, "User %u removed\n", (uint8_t *)&v23, 8u);
      }
      if (__osLogTrace) {
        uint64_t v18 = __osLogTrace;
      }
      else {
        uint64_t v18 = v5;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 67109120;
        LODWORD(v24) = 0;
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_DEBUG, "removeUser: -> %d\n", (uint8_t *)&v23, 8u);
      }
      return 0;
    }
    if (__osLog) {
      __int16 v21 = __osLog;
    }
    else {
      __int16 v21 = v5;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136316162;
      int v24 = "err == 0 ";
      __int16 v25 = 2048;
      uint64_t v26 = v7;
      __int16 v27 = 2080;
      char v28 = &unk_22004A573;
      __int16 v29 = 2080;
      __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v31 = 1024;
      int v32 = 3377;
      _os_log_impl(&dword_21FFF3000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v23, 0x30u);
    }
  }
  if (__osLogTrace) {
    int v22 = __osLogTrace;
  }
  else {
    int v22 = v5;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    int v23 = 67109120;
    LODWORD(v24) = v7;
    _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "removeUser: -> %d\n", (uint8_t *)&v23, 8u);
  }
  return v7;
}

- (int)isValidUser:(unsigned int)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v4 = &_os_log_internal;
  if (__osLogTrace) {
    int v5 = __osLogTrace;
  }
  else {
    int v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEBUG, "isValidUser\n", (uint8_t *)&v10, 2u);
  }
  if (a3 == 501)
  {
    int v6 = 0;
  }
  else
  {
    if (__osLog) {
      int v9 = __osLog;
    }
    else {
      int v9 = v4;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136316162;
      int v11 = "userID == 501";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      __int16 v15 = &unk_22004A573;
      __int16 v16 = 2080;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v18 = 1024;
      int v19 = 3418;
      _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
    int v6 = 258;
  }
  if (__osLogTrace) {
    int v7 = __osLogTrace;
  }
  else {
    int v7 = v4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 67109120;
    LODWORD(v11) = v6;
    _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_DEBUG, "isValidUser -> %d\n", (uint8_t *)&v10, 8u);
  }
  return v6;
}

- (int)syncTemplateListForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v63 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    int v5 = __osLogTrace;
  }
  else {
    int v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v3;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEBUG, "syncTemplateListForUser: %d\n", buf, 8u);
  }
  [(BiometricKitXPCServer *)self cacheCatacombInfo];
  unsigned int maxTemplatesPerUser = self->_maxTemplatesPerUser;
  BOOL v7 = [(BiometricKitXPCServer *)self supportsRemovableAccessories];
  unsigned int v8 = 20;
  if (v7) {
    unsigned int v8 = 120;
  }
  int v9 = [MEMORY[0x263EFF990] dataWithLength:v8 * (unint64_t)maxTemplatesPerUser];
  if (!v9)
  {
    if (__osLog) {
      char v41 = __osLog;
    }
    else {
      char v41 = &_os_log_internal;
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "buffer";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = 0;
      __int16 v57 = 2080;
      uint64_t v58 = &unk_22004A573;
      __int16 v59 = 2080;
      long long v60 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v61 = 1024;
      int v62 = 3516;
      _os_log_impl(&dword_21FFF3000, v41, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id obj = 0;
    int v37 = 260;
    goto LABEL_61;
  }
  int v10 = [(BiometricKitXPCServer *)self performGetIdentitiesListCommand:v3 outBuffer:v9];
  if (v10)
  {
    int v37 = v10;
    if (__osLog) {
      uint64_t v42 = __osLog;
    }
    else {
      uint64_t v42 = &_os_log_internal;
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "err == 0 ";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v37;
      __int16 v57 = 2080;
      uint64_t v58 = &unk_22004A573;
      __int16 v59 = 2080;
      long long v60 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v61 = 1024;
      int v62 = 3519;
      _os_log_impl(&dword_21FFF3000, v42, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id obj = 0;
    goto LABEL_61;
  }
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * [v9 length], 2) >= 0xCCCCCCCCCCCCCCDuLL)
  {
    if (__osLog) {
      uint64_t v43 = __osLog;
    }
    else {
      uint64_t v43 = &_os_log_internal;
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "(buffer.length % sizeof(identity_v1_t)) == 0";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = 0;
      __int16 v57 = 2080;
      uint64_t v58 = &unk_22004A573;
      __int16 v59 = 2080;
      long long v60 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v61 = 1024;
      int v62 = 3520;
      _os_log_impl(&dword_21FFF3000, v43, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id obj = 0;
    int v37 = 261;
LABEL_61:
    if (__osLogTrace) {
      int v38 = __osLogTrace;
    }
    else {
      int v38 = &_os_log_internal;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v37;
      _os_log_impl(&dword_21FFF3000, v38, OS_LOG_TYPE_ERROR, "syncTemplateListForUser: -> %d\n", buf, 8u);
    }
    goto LABEL_72;
  }
  uint64_t v49 = self;
  unint64_t v11 = [v9 length];
  unint64_t v12 = v11 / 0x14;
  uint64_t v13 = [v9 bytes];
  unint64_t v50 = v11;
  unint64_t v47 = v11 / 0x14;
  uint64_t v44 = v13;
  if (v11 >= 0x14)
  {
    int v46 = 0;
    char v14 = 0;
    if (v12 <= 1) {
      unint64_t v12 = 1;
    }
    __int16 v15 = (unsigned int *)v13;
    do
    {
      __int16 v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v15 + 1];
      __int16 v17 = [(BiometricKitXPCServer *)v49 getIdentityObjectByUserID:*v15 UUID:v16];

      if (!v17)
      {
        if (__osLog) {
          __int16 v18 = __osLog;
        }
        else {
          __int16 v18 = &_os_log_internal;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v19 = *v15;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[8] = 2112;
          *(void *)&buf[10] = v16;
          _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_DEFAULT, "syncTemplateListForUser: removing SEP identity [%u:%@] because it is not present in biometrickitd\n", buf, 0x12u);
        }
        int v20 = [(BiometricKitXPCServer *)v49 performRemoveIdentityCommand:v15];
        if (v20)
        {
          int v21 = v20;
          if (__osLog) {
            int v22 = __osLog;
          }
          else {
            int v22 = &_os_log_internal;
          }
          int v46 = v20;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&uint8_t buf[4] = "err == 0 ";
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v21;
            __int16 v57 = 2080;
            uint64_t v58 = &unk_22004A573;
            __int16 v59 = 2080;
            long long v60 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            __int16 v61 = 1024;
            int v62 = 3532;
            _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        else
        {
          int v46 = 0;
        }
        char v14 = 1;
      }

      v15 += 5;
      --v12;
    }
    while (v12);
  }
  else
  {
    char v14 = 0;
    int v46 = 0;
  }
  if (v3 == -1) {
    [(BiometricKitXPCServer *)v49 identities];
  }
  else {
    [(BiometricKitXPCServer *)v49 identitiesOfUser:v3];
  }
  uint64_t v45 = v9;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v52;
    if (v47 <= 1) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = v47;
    }
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v52 != v25) {
          objc_enumerationMutation(obj);
        }
        char v28 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if (v50 < 0x14)
        {
LABEL_50:
          if (__osLog) {
            uint64_t v33 = __osLog;
          }
          else {
            uint64_t v33 = &_os_log_internal;
          }
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            id v34 = v33;
            int v35 = [v28 userID];
            int v36 = [v28 uuid];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&uint8_t buf[4] = v35;
            *(_WORD *)&buf[8] = 2112;
            *(void *)&buf[10] = v36;
            _os_log_impl(&dword_21FFF3000, v34, OS_LOG_TYPE_DEFAULT, "syncTemplateListForUser: removing biometrickitd identity [%u:%@] because it is not present in SEP\n", buf, 0x12u);
          }
          [(BiometricKitXPCServer *)v49 removeIdentityObject:v28];
          char v14 = 1;
        }
        else
        {
          __int16 v29 = (void *)(v44 + 4);
          uint64_t v30 = v26;
          while (1)
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = 0;
            __int16 v31 = [v28 uuid];
            [v31 getUUIDBytes:buf];

            if ([v28 userID] == *((_DWORD *)v29 - 1)
              && *v29 == *(void *)buf
              && v29[1] == *(void *)&buf[8])
            {
              break;
            }
            __int16 v29 = (void *)((char *)v29 + 20);
            if (!--v30) {
              goto LABEL_50;
            }
          }
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v24);
  }

  if (v14)
  {
    [(BiometricKitXPCServer *)v49 saveCatacomb];
    [(BiometricKitXPCServer *)v49 updateEnrollmentChangedNotification:1];
  }
  int v9 = v45;
  int v37 = v46;
  if (v46) {
    goto LABEL_61;
  }
  if (__osLogTrace) {
    uint64_t v39 = __osLogTrace;
  }
  else {
    uint64_t v39 = &_os_log_internal;
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 67109120;
    _os_log_impl(&dword_21FFF3000, v39, OS_LOG_TYPE_DEBUG, "syncTemplateListForUser: -> %d\n", buf, 8u);
  }
  int v37 = 0;
LABEL_72:

  return v37;
}

- (int)updatePropertiesOfIdentities
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v3 = &_os_log_internal;
  if (__osLogTrace) {
    int v4 = __osLogTrace;
  }
  else {
    int v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "updatePropertiesOfIdentities\n", buf, 2u);
  }
  unint64_t v5 = [(BiometricKitXPCServer *)self identitiesCount];
  if (!v5) {
    goto LABEL_25;
  }
  unint64_t v6 = v5;
  if ([(BiometricKitXPCServer *)self supportsRemovableAccessories])
  {
    BOOL v7 = [MEMORY[0x263EFF990] dataWithLength:40 * v6];
    int v8 = [(BiometricKitXPCServer *)self performGetIdentityRecordsCommand:v7];
    if (v8)
    {
      int v25 = v8;
      if (__osLog) {
        uint64_t v30 = __osLog;
      }
      else {
        uint64_t v30 = v3;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        int v40 = "err == 0 ";
        __int16 v41 = 2048;
        uint64_t v42 = v25;
        __int16 v43 = 2080;
        uint64_t v44 = &unk_22004A573;
        __int16 v45 = 2080;
        int v46 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v47 = 1024;
        int v48 = 3592;
        _os_log_impl(&dword_21FFF3000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_45;
    }
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * [v7 length], 3) >= 0x666666666666667uLL)
    {
      if (__osLog) {
        char v28 = __osLog;
      }
      else {
        char v28 = v3;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        int v40 = "outBuffer.length % sizeof(identity_record_t) == 0";
        __int16 v41 = 2048;
        uint64_t v42 = 0;
        __int16 v43 = 2080;
        uint64_t v44 = &unk_22004A573;
        __int16 v45 = 2080;
        int v46 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v47 = 1024;
        int v48 = 3593;
LABEL_37:
        _os_log_impl(&dword_21FFF3000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
LABEL_44:
      int v25 = 261;
LABEL_45:

      goto LABEL_26;
    }
    unint64_t v9 = [v7 length];
    id v10 = v7;
    uint64_t v11 = [v10 mutableBytes];
    if (v9 >= 0x28)
    {
      uint64_t v12 = v11;
      unint64_t v13 = v9 / 0x28;
      while (1)
      {
        uint64_t v14 = [(BiometricKitXPCServer *)self getIdentityObject:v12];
        if (!v14) {
          break;
        }
        __int16 v15 = (void *)v14;
        uint64_t v16 = [(BiometricKitXPCServer *)self getAccessoryObject:v12 + 20];
        if (!v16)
        {
          if (__osLog) {
            __int16 v29 = __osLog;
          }
          else {
            __int16 v29 = v3;
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            int v40 = "accessory";
            __int16 v41 = 2048;
            uint64_t v42 = 0;
            __int16 v43 = 2080;
            uint64_t v44 = &unk_22004A573;
            __int16 v45 = 2080;
            int v46 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            __int16 v47 = 1024;
            int v48 = 3603;
            _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }

          goto LABEL_44;
        }
        __int16 v17 = (void *)v16;
        [v15 setAccessory:v16];

        v12 += 40;
        if (!--v13) {
          goto LABEL_15;
        }
      }
      if (__osLog) {
        char v28 = __osLog;
      }
      else {
        char v28 = v3;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        int v40 = "identity";
        __int16 v41 = 2048;
        uint64_t v42 = 0;
        __int16 v43 = 2080;
        uint64_t v44 = &unk_22004A573;
        __int16 v45 = 2080;
        int v46 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v47 = 1024;
        int v48 = 3600;
        goto LABEL_37;
      }
      goto LABEL_44;
    }
LABEL_15:

LABEL_25:
    int v25 = 0;
    goto LABEL_26;
  }
  int v38 = 0;
  long long v37 = xmmword_220049588;
  uint64_t v18 = [(BiometricKitXPCServer *)self getAccessoryObject:&v37];
  if (v18)
  {
    unsigned int v19 = (void *)v18;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    int v20 = [(BiometricKitXPCServer *)self identities];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * i) setAccessory:v19];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v22);
    }

    goto LABEL_25;
  }
  if (__osLog) {
    __int16 v31 = __osLog;
  }
  else {
    __int16 v31 = v3;
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    int v40 = "accessory";
    __int16 v41 = 2048;
    uint64_t v42 = 0;
    __int16 v43 = 2080;
    uint64_t v44 = &unk_22004A573;
    __int16 v45 = 2080;
    int v46 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v47 = 1024;
    int v48 = 3612;
    _os_log_impl(&dword_21FFF3000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  int v25 = 261;
LABEL_26:
  if (__osLogTrace) {
    uint64_t v26 = __osLogTrace;
  }
  else {
    uint64_t v26 = v3;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v26, OS_LOG_TYPE_DEBUG, "updatePropertiesOfIdentities: -> void\n", buf, 2u);
  }
  return v25;
}

- (BOOL)templatesExistAtBoot
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v2 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v3 = __osLogTrace;
  }
  else {
    uint64_t v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf.st_dev) = 0;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEBUG, "templatesExistAtBoot\n", (uint8_t *)&buf, 2u);
  }
  memset(&buf, 0, sizeof(buf));
  [(NSRecursiveLock *)self->_catacombLock content];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v40 count:16];
  if (!v5)
  {
    BOOL v20 = 0;
    goto LABEL_29;
  }
  uint64_t v7 = v5;
  uint64_t v8 = *(void *)v26;
  *(void *)&long long v6 = 136316162;
  long long v23 = v6;
LABEL_8:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v26 != v8) {
      objc_enumerationMutation(v4);
    }
    id v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
    if (!objc_msgSend(v10, "hasPrefix:", @"user_", v23)
      || ![v10 hasSuffix:@".cat"])
    {
      goto LABEL_17;
    }
    uint64_t v11 = [(NSRecursiveLock *)self->_catacombLock catacombDir];
    uint64_t v12 = [v11 stringByAppendingString:v10];

    id v13 = v12;
    int v14 = open_dprotected_np((const char *)[v13 UTF8String], 0, 0, 1);
    if (v14 == -1)
    {
      if (__osLog) {
        uint64_t v18 = __osLog;
      }
      else {
        uint64_t v18 = &_os_log_internal;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v30 = v23;
        __int16 v31 = "fd != -1";
        __int16 v32 = 2048;
        uint64_t v33 = 0;
        __int16 v34 = 2080;
        long long v35 = &unk_22004A573;
        __int16 v36 = 2080;
        long long v37 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v38 = 1024;
        int v39 = 3645;
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v30, 0x30u);
      }
      goto LABEL_16;
    }
    int v15 = v14;
    int v16 = fstat(v14, &buf);
    off_t st_size = buf.st_size;
    close(v15);
    if (v16 != -1 && st_size > 1024) {
      break;
    }
LABEL_16:

LABEL_17:
    if (v7 == ++v9)
    {
      uint64_t v19 = [v4 countByEnumeratingWithState:&v25 objects:v40 count:16];
      uint64_t v7 = v19;
      if (!v19)
      {
        BOOL v20 = 0;
        goto LABEL_27;
      }
      goto LABEL_8;
    }
  }

  BOOL v20 = 1;
LABEL_27:
  id v2 = &_os_log_internal;
LABEL_29:

  if (__osLogTrace) {
    uint64_t v21 = __osLogTrace;
  }
  else {
    uint64_t v21 = v2;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v30 = 67109120;
    LODWORD(v31) = v20;
    _os_log_impl(&dword_21FFF3000, v21, OS_LOG_TYPE_DEBUG, "templatesExistAtBoot -> %d\n", v30, 8u);
  }

  return v20;
}

- (int)cacheCatacombInfo
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = &_os_log_internal;
  if (__osLogTrace) {
    id v4 = __osLogTrace;
  }
  else {
    id v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "cacheCatacombInfo\n", buf, 2u);
  }
  if (self->_maxTemplatesPerUser && self->_maxSupportedUsers) {
    goto LABEL_10;
  }
  uint64_t v11 = 0;
  v12[0] = 0;
  *(void *)((char *)v12 + 7) = 0;
  int v5 = [(BiometricKitXPCServer *)self performGetBiometrickitdInfoCommand:&v11];
  if (!v5)
  {
    *(void *)&self->_unsigned int maxTemplatesPerUser = v11;
LABEL_10:
    if (__osLogTrace) {
      long long v6 = __osLogTrace;
    }
    else {
      long long v6 = v3;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v14) = 0;
      _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "cacheCatacombInfo -> %d\n", buf, 8u);
    }
    return 0;
  }
  int v7 = v5;
  if (__osLog) {
    uint64_t v9 = __osLog;
  }
  else {
    uint64_t v9 = v3;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 136316162;
    int v14 = "err == 0 ";
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    __int16 v17 = 2080;
    uint64_t v18 = &unk_22004A573;
    __int16 v19 = 2080;
    BOOL v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v21 = 1024;
    int v22 = 3684;
    _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  if (__osLogTrace) {
    id v10 = __osLogTrace;
  }
  else {
    id v10 = v3;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v14) = v7;
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_ERROR, "cacheCatacombInfo -> %d\n", buf, 8u);
  }
  return v7;
}

- (int)readCatacombState
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v3 = &_os_log_internal;
  if (__osLogTrace) {
    id v4 = __osLogTrace;
  }
  else {
    id v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "readCatacombState\n", buf, 2u);
  }
  int v5 = [MEMORY[0x263EFF980] array];
  [(BiometricKitXPCServer *)self cacheCatacombInfo];
  uint64_t v6 = [MEMORY[0x263EFF990] dataWithLength:8 * (self->_maxSupportedUsers + 1)];
  if (!v6)
  {
    if (__osLog) {
      __int16 v32 = __osLog;
    }
    else {
      __int16 v32 = v3;
    }
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_68;
    }
    *(_DWORD *)stat buf = 136316162;
    *(void *)&uint8_t buf[4] = "buffer";
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = 0;
    __int16 v50 = 2080;
    long long v51 = &unk_22004A573;
    __int16 v52 = 2080;
    long long v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v54 = 1024;
    int v55 = 3717;
    goto LABEL_67;
  }
  int v7 = (void *)v6;
  int v8 = [(BiometricKitXPCServer *)self performGetCatacombStateCommand:v6];
  if (v8)
  {
    int v30 = v8;
    if (__osLog) {
      uint64_t v33 = __osLog;
    }
    else {
      uint64_t v33 = v3;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)&uint8_t buf[4] = "err == 0 ";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v30;
      __int16 v50 = 2080;
      long long v51 = &unk_22004A573;
      __int16 v52 = 2080;
      long long v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v54 = 1024;
      int v55 = 3720;
LABEL_61:
      _os_log_impl(&dword_21FFF3000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    [(BKCatacomb *)self->_catacomb reset];
    int v9 = [(BKCatacomb *)self->_catacomb addUserStatesFromBuffer:v7];
    if (!v9)
    {
      if (![(BiometricKitXPCServer *)self supportsRemovableAccessories])
      {
        long long v37 = v7;
        goto LABEL_15;
      }
      uint64_t v10 = [MEMORY[0x263EFF990] dataWithLength:140 * self->_maxSupportedUsers];

      if (v10)
      {
        int v11 = [(BiometricKitXPCServer *)self performGetCatacombGroupStateCommand:v10];
        if (v11)
        {
          int v30 = v11;
          if (__osLog) {
            __int16 v34 = __osLog;
          }
          else {
            __int16 v34 = v3;
          }
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            goto LABEL_80;
          }
          *(_DWORD *)stat buf = 136316162;
          *(void *)&uint8_t buf[4] = "err == 0 ";
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = v30;
          __int16 v50 = 2080;
          long long v51 = &unk_22004A573;
          __int16 v52 = 2080;
          long long v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v54 = 1024;
          int v55 = 3735;
        }
        else
        {
          int v12 = [(BKCatacomb *)self->_catacomb addGroupStatesFromBuffer:v10];
          if (!v12)
          {
            long long v37 = (void *)v10;
LABEL_15:
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v13 = [(BiometricKitXPCServer *)self identities];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v44;
              do
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v44 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
                  if ([v18 userID] != -1
                    && (-[BKCatacomb stateOfUserComponent:](self->_catacomb, "stateOfUserComponent:", [v18 userID]) & 1) == 0)
                  {
                    [v5 addObject:v18];
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
              }
              while (v15);
            }

            if ([v5 count])
            {
              long long v41 = 0u;
              long long v42 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              __int16 v36 = v5;
              id obj = v5;
              uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v40;
                do
                {
                  for (uint64_t j = 0; j != v20; ++j)
                  {
                    if (*(void *)v40 != v21) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v23 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                    if (__osLog) {
                      uint64_t v24 = __osLog;
                    }
                    else {
                      uint64_t v24 = v3;
                    }
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                    {
                      long long v25 = v24;
                      long long v26 = v3;
                      int v27 = [v23 userID];
                      long long v28 = [v23 uuid];
                      *(_DWORD *)stat buf = 67109378;
                      *(_DWORD *)&uint8_t buf[4] = v27;
                      uint64_t v3 = v26;
                      *(_WORD *)&buf[8] = 2112;
                      *(void *)&buf[10] = v28;
                      _os_log_impl(&dword_21FFF3000, v25, OS_LOG_TYPE_DEFAULT, "readCatacombState: removing biometrickitd identity [%u:%@]\n", buf, 0x12u);
                    }
                    -[BiometricKitXPCServer removeIdentityObject:](self, "removeIdentityObject:", v23, v36);
                  }
                  uint64_t v20 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
                }
                while (v20);
              }

              [(BiometricKitXPCServer *)self updateEnrollmentChangedNotification:1];
              int v5 = v36;
            }
            if (__osLogTrace) {
              __int16 v29 = __osLogTrace;
            }
            else {
              __int16 v29 = v3;
            }
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(void *)stat buf = 67109120;
              _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_DEBUG, "readCatacombState -> %d\n", buf, 8u);
            }
            int v30 = 0;
            int v7 = v37;
            goto LABEL_45;
          }
          int v30 = v12;
          if (__osLog) {
            __int16 v34 = __osLog;
          }
          else {
            __int16 v34 = v3;
          }
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            goto LABEL_80;
          }
          *(_DWORD *)stat buf = 136316162;
          *(void *)&uint8_t buf[4] = "err == 0 ";
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = v30;
          __int16 v50 = 2080;
          long long v51 = &unk_22004A573;
          __int16 v52 = 2080;
          long long v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v54 = 1024;
          int v55 = 3738;
        }
        _os_log_impl(&dword_21FFF3000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_80:
        int v7 = (void *)v10;
        goto LABEL_81;
      }
      if (__osLog) {
        __int16 v32 = __osLog;
      }
      else {
        __int16 v32 = v3;
      }
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
LABEL_68:
        int v7 = 0;
        int v30 = 260;
        goto LABEL_81;
      }
      *(_DWORD *)stat buf = 136316162;
      *(void *)&uint8_t buf[4] = "buffer";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = 0;
      __int16 v50 = 2080;
      long long v51 = &unk_22004A573;
      __int16 v52 = 2080;
      long long v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v54 = 1024;
      int v55 = 3732;
LABEL_67:
      _os_log_impl(&dword_21FFF3000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      goto LABEL_68;
    }
    int v30 = v9;
    if (__osLog) {
      uint64_t v33 = __osLog;
    }
    else {
      uint64_t v33 = v3;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)&uint8_t buf[4] = "err == 0 ";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v30;
      __int16 v50 = 2080;
      long long v51 = &unk_22004A573;
      __int16 v52 = 2080;
      long long v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v54 = 1024;
      int v55 = 3727;
      goto LABEL_61;
    }
  }
LABEL_81:
  if (__osLogTrace) {
    long long v35 = __osLogTrace;
  }
  else {
    long long v35 = v3;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v30;
    _os_log_impl(&dword_21FFF3000, v35, OS_LOG_TYPE_ERROR, "readCatacombState -> %d\n", buf, 8u);
  }
LABEL_45:

  return v30;
}

- (id)catacombFileNameForComponent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = (__CFString *)a3;
  id v4 = &_os_log_internal;
  if (__osLog) {
    int v5 = __osLog;
  }
  else {
    int v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 134217984;
    uint64_t v14 = v3;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEBUG, "catacombFileNameForComponent: %p\n", buf, 0xCu);
  }
  if ([(__CFString *)v3 isMasterComponent])
  {
    uint64_t v6 = @"master.cat";
  }
  else if ([(__CFString *)v3 isUserComponent])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"user_%08x.cat", -[__CFString userID](v3, "userID"));
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if ([(__CFString *)v3 isGroupComponent])
  {
    int v7 = NSString;
    uint64_t v8 = [(__CFString *)v3 userID];
    uint64_t v9 = *(unsigned int *)[(__CFString *)v3 group];
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDBytes:", -[__CFString group](v3, "group") + 4);
    uint64_t v6 = [v7 stringWithFormat:@"group_%08x_%x_%@.cat", v8, v9, v10];
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (__osLog) {
    int v11 = __osLog;
  }
  else {
    int v11 = v4;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138412290;
    uint64_t v14 = v6;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "catacombFileNameForComponent: -> %@\n", buf, 0xCu);
  }

  return v6;
}

- (id)getIdentityObjectByUserID:(unsigned int)a3 UUID:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (__osLogTrace) {
    int v7 = __osLogTrace;
  }
  else {
    int v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109378;
    *(_DWORD *)uint64_t v24 = a3;
    *(_WORD *)&v24[4] = 2112;
    *(void *)&v24[6] = v6;
    _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_DEBUG, "getIdentityObjectByUserID:UUID: %d %@\n", buf, 0x12u);
  }
  uint64_t v8 = self->_ongoingBiometricOperation;
  objc_sync_enter(v8);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = self->_ongoingBiometricOperation;
  uint64_t v10 = [(ActivityTracker *)v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "userID", (void)v19) == a3)
        {
          uint64_t v14 = [v13 uuid];
          int v15 = [v14 isEqual:v6];

          if (v15)
          {
            id v16 = v13;
            goto LABEL_17;
          }
        }
      }
      uint64_t v10 = [(ActivityTracker *)v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_17:

  objc_sync_exit(v8);
  if (__osLogTrace) {
    __int16 v17 = __osLogTrace;
  }
  else {
    __int16 v17 = &_os_log_internal;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 134218242;
    *(void *)uint64_t v24 = v16;
    *(_WORD *)&v24[8] = 2112;
    *(void *)&v24[10] = v16;
    _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_DEBUG, "getIdentityObjectByUserID:UUID: -> %p(%@)\n", buf, 0x16u);
  }

  return v16;
}

- (id)getIdentityObject:(id *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v5 = &_os_log_internal;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    id v13 = a3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "getIdentityObject: %p\n", (uint8_t *)&v12, 0xCu);
  }
  if (a3)
  {
    uint64_t var0 = a3->var0;
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->var1];
    uint64_t v9 = [(BiometricKitXPCServer *)self getIdentityObjectByUserID:var0 UUID:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (__osLogTrace) {
    uint64_t v10 = __osLogTrace;
  }
  else {
    uint64_t v10 = v5;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134218242;
    id v13 = v9;
    __int16 v14 = 2112;
    int v15 = v9;
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "getIdentityObject: -> %p(%@)\n", (uint8_t *)&v12, 0x16u);
  }
  return v9;
}

- (id)identities
{
  uint64_t v3 = self->_ongoingBiometricOperation;
  objc_sync_enter(v3);
  id v4 = [MEMORY[0x263EFF8C0] arrayWithArray:self->_ongoingBiometricOperation];
  objc_sync_exit(v3);

  return v4;
}

- (unint64_t)identitiesCount
{
  uint64_t v3 = self->_ongoingBiometricOperation;
  objc_sync_enter(v3);
  unint64_t v4 = [(ActivityTracker *)self->_ongoingBiometricOperation count];
  objc_sync_exit(v3);

  return v4;
}

- (id)identitiesOfUser:(unsigned int)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v5 = &_os_log_internal;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v21) = a3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "identitiesOfUser: %d\n", buf, 8u);
  }
  int v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = self->_ongoingBiometricOperation;
  objc_sync_enter(v8);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = self->_ongoingBiometricOperation;
  uint64_t v10 = [(ActivityTracker *)v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "userID", (void)v16) == a3) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [(ActivityTracker *)v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
  if (__osLogTrace) {
    __int16 v14 = __osLogTrace;
  }
  else {
    __int16 v14 = v5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138412290;
    long long v21 = v7;
    _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_DEBUG, "identitiesOfUser: -> %@\n", buf, 0xCu);
  }
  return v7;
}

- (id)identitiesOfComponent:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v24 = a3;
  if (__osLogTrace) {
    unint64_t v4 = __osLogTrace;
  }
  else {
    unint64_t v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138412290;
    id v31 = v24;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "identitiesOfComponent: %@\n", buf, 0xCu);
  }
  if (![(BiometricKitXPCServer *)self supportsRemovableAccessories])
  {
    if ([v24 isUserComponent])
    {
      -[BiometricKitXPCServer identitiesOfUser:](self, "identitiesOfUser:", [v24 userID]);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_12;
  }
  if ([v24 isMasterComponent])
  {
LABEL_12:
    id v20 = 0;
    goto LABEL_27;
  }
  if ([v24 isGroupComponent]) {
    int v5 = *(_DWORD *)[v24 group];
  }
  else {
    int v5 = 1;
  }
  int v22 = v5;
  long long v21 = objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDBytes:", objc_msgSend(v24, "group") + 4);
  id v20 = [MEMORY[0x263EFF980] array];
  long long v19 = self->_ongoingBiometricOperation;
  objc_sync_enter(v19);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = self->_ongoingBiometricOperation;
  uint64_t v6 = [(ActivityTracker *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v10 = objc_msgSend(v9, "userID", v19);
        if (v10 == [v24 userID])
        {
          uint64_t v11 = [v9 accessory];
          int v12 = [v11 group];
          if ([v12 type] == v22)
          {
            id v13 = [v9 accessory];
            __int16 v14 = [v13 group];
            int v15 = [v14 uuid];
            int v16 = [v15 isEqual:v21];

            if (v16) {
              [v20 addObject:v9];
            }
          }
          else
          {
          }
        }
      }
      uint64_t v6 = [(ActivityTracker *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v19);
LABEL_27:
  if (__osLogTrace) {
    long long v17 = __osLogTrace;
  }
  else {
    long long v17 = &_os_log_internal;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138412290;
    id v31 = v20;
    _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_DEBUG, "identitiesOfComponent: -> %@\n", buf, 0xCu);
  }

  return v20;
}

- (id)catacombComponentForIdentity:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long v19 = 138412290;
    *(void *)&v19[4] = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "catacombComponentForIdentity: %@\n", v19, 0xCu);
  }
  if (v4)
  {
    if ([(BiometricKitXPCServer *)self supportsRemovableAccessories]
      && ([v4 accessory],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v7 group],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 type],
          v8,
          v7,
          v9 != 1))
    {
      *(_OWORD *)&v19[8] = 0uLL;
      *(_DWORD *)long long v19 = [v4 userID];
      int v12 = objc_msgSend(v4, "accessory", *(void *)v19);
      id v13 = [v12 group];
      *(_DWORD *)&v19[4] = [v13 type];

      __int16 v14 = [v4 accessory];
      int v15 = [v14 group];
      int v16 = [v15 uuid];
      [v16 getUUIDBytes:&v19[8]];

      uint64_t v10 = +[CatacombComponent component:v19];
    }
    else
    {
      uint64_t v10 = +[CatacombComponent componentForUserID:](CatacombComponent, "componentForUserID:", [v4 userID]);
    }
    uint64_t v11 = (void *)v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (__osLogTrace) {
    long long v17 = __osLogTrace;
  }
  else {
    long long v17 = v5;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long v19 = 138412290;
    *(void *)&v19[4] = v11;
    _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_DEBUG, "identitiesOfComponent: -> %@\n", v19, 0xCu);
  }

  return v11;
}

- (unsigned)singleEnrolledUser
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_ongoingBiometricOperation;
  objc_sync_enter(v3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_ongoingBiometricOperation;
  uint64_t v5 = [(ActivityTracker *)v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    unsigned int v7 = -1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v7 == -1)
        {
          unsigned int v7 = objc_msgSend(v9, "userID", (void)v12);
        }
        else if (v7 != [v9 userID])
        {
          goto LABEL_13;
        }
      }
      uint64_t v5 = [(ActivityTracker *)v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
LABEL_13:
    unsigned int v7 = -1;
  }

  objc_sync_exit(v3);
  if (__osLogTrace) {
    uint64_t v10 = __osLogTrace;
  }
  else {
    uint64_t v10 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109120;
    unsigned int v17 = v7;
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "singleEnrolledUser: -> %d\n", buf, 8u);
  }
  return v7;
}

- (void)removeIdentityObject:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__osLogTrace) {
    uint64_t v5 = __osLogTrace;
  }
  else {
    uint64_t v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v5;
    int v7 = [v4 userID];
    uint64_t v8 = [v4 uuid];
    *(_DWORD *)stat buf = 67109378;
    int v28 = v7;
    __int16 v29 = 2112;
    int v30 = v8;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "removeIdentityObject: %u:%@\n", buf, 0x12u);
  }
  int v9 = self->_ongoingBiometricOperation;
  objc_sync_enter(v9);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v21 = self;
  uint64_t v10 = self->_ongoingBiometricOperation;
  uint64_t v11 = [(ActivityTracker *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v15 = [v14 userID];
        if (v15 == [v4 userID])
        {
          int v16 = [v14 uuid];
          unsigned int v17 = [v4 uuid];
          char v18 = [v16 isEqual:v17];

          if (v18)
          {
            id v19 = v14;

            if (v19) {
              [(ActivityTracker *)v21->_ongoingBiometricOperation removeObject:v19];
            }
            goto LABEL_18;
          }
        }
      }
      uint64_t v11 = [(ActivityTracker *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v19 = 0;
LABEL_18:

  objc_sync_exit(v9);
  if (__osLogTrace) {
    uint64_t v20 = __osLogTrace;
  }
  else {
    uint64_t v20 = &_os_log_internal;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_DEBUG, "removeIdentityObject: -> void\n", buf, 2u);
  }
}

- (void)addIdentityObject:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v11) = 138412290;
    *(void *)((char *)&v11 + 4) = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "addIdentityObject: %@\n", (uint8_t *)&v11, 0xCu);
  }
  if (v4)
  {
    int v7 = [v4 accessory];
    if (v7)
    {
    }
    else if (![(BiometricKitXPCServer *)self supportsRemovableAccessories])
    {
      int v12 = 0;
      long long v11 = xmmword_220049588;
      uint64_t v8 = [(BiometricKitXPCServer *)self getAccessoryObject:&v11];
      [v4 setAccessory:v8];
    }
    int v9 = self->_ongoingBiometricOperation;
    objc_sync_enter(v9);
    [(ActivityTracker *)self->_ongoingBiometricOperation addObject:v4];
    objc_sync_exit(v9);
  }
  if (__osLogTrace) {
    uint64_t v10 = __osLogTrace;
  }
  else {
    uint64_t v10 = v5;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "addIdentityObject: -> void\n", (uint8_t *)&v11, 2u);
  }
}

- (void)addIdentityObjects:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "addIdentityObjects: %@\n", buf, 0xCu);
  }
  if (v4)
  {
    if (![(BiometricKitXPCServer *)self supportsRemovableAccessories])
    {
      int v23 = 0;
      *(_OWORD *)stat buf = xmmword_220049588;
      int v7 = [(BiometricKitXPCServer *)self getAccessoryObject:buf];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v8);
            }
            int v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            uint64_t v13 = objc_msgSend(v12, "accessory", (void)v17);
            BOOL v14 = v13 == 0;

            if (v14) {
              [v12 setAccessory:v7];
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);
      }
    }
    int v15 = self->_ongoingBiometricOperation;
    objc_sync_enter(v15);
    [(ActivityTracker *)self->_ongoingBiometricOperation addObjectsFromArray:v4];
    objc_sync_exit(v15);
  }
  if (__osLogTrace) {
    int v16 = __osLogTrace;
  }
  else {
    int v16 = v5;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_DEBUG, "addIdentityObjects: -> void\n", buf, 2u);
  }
}

- (int)saveCatacombIfDirtyWithInterval:(double)a3 andDelay:(double)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v7 = &_os_log_internal;
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 134218240;
    double v19 = a3;
    __int16 v20 = 2048;
    double v21 = a4;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "saveCatacombIfDirtyWithInterval:andDelay: %f %f\n", buf, 0x16u);
  }
  memset(v17, 0, 23);
  int v9 = [(BiometricKitXPCServer *)self performGetBiometrickitdInfoCommand:v17];
  if (v9)
  {
    if (__osLog) {
      int v15 = __osLog;
    }
    else {
      int v15 = v7;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      double v19 = COERCE_DOUBLE("err == 0 ");
      __int16 v20 = 2048;
      *(void *)&double v21 = v9;
      __int16 v22 = 2080;
      int v23 = &unk_22004A573;
      __int16 v24 = 2080;
      long long v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v26 = 1024;
      int v27 = 4076;
      _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else if (BYTE4(v17[2]))
  {
    if (a3 <= 0.0)
    {
      double v12 = 1.79769313e308;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x263EFF910] date];
      [v10 timeIntervalSince1970];
      double v12 = v11 - (double)*(void *)((char *)&v17[1] + 4);
    }
    if (a3 == 0.0 || v12 > a3)
    {
      [(BiometricOperation *)self->_runningBioOp setActive:1];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__BiometricKitXPCServer_saveCatacombIfDirtyWithInterval_andDelay___block_invoke;
      block[3] = &unk_26454E430;
      block[4] = self;
      *(double *)&void block[5] = a4;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  if (__osLogTrace) {
    uint64_t v13 = __osLogTrace;
  }
  else {
    uint64_t v13 = v7;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v19) = v9;
    _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_DEBUG, "saveCatacombIfDirtyWithInterval:andDelay: -> %d\n", buf, 8u);
  }
  return v9;
}

uint64_t __66__BiometricKitXPCServer_saveCatacombIfDirtyWithInterval_andDelay___block_invoke(uint64_t a1)
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_saveTemplateListAfterTemplateUpdate object:0];
  id v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  return [v2 performSelector:sel_saveTemplateListAfterTemplateUpdate withObject:0 afterDelay:v3];
}

- (int)saveTemplateListAfterTemplateUpdate
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v3 = &_os_log_internal;
  if (__osLogTrace) {
    id v4 = __osLogTrace;
  }
  else {
    id v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "saveTemplateListAfterTemplateUpdate\n", (uint8_t *)&v12, 2u);
  }
  int v5 = [(BiometricKitXPCServer *)self saveCatacomb];
  if (v5)
  {
    if (__osLog) {
      uint64_t v10 = __osLog;
    }
    else {
      uint64_t v10 = v3;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136316162;
      uint64_t v13 = "err == 0 ";
      __int16 v14 = 2048;
      uint64_t v15 = v5;
      __int16 v16 = 2080;
      long long v17 = &unk_22004A573;
      __int16 v18 = 2080;
      double v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v20 = 1024;
      int v21 = 4113;
      _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    if (__osLogTrace) {
      double v11 = __osLogTrace;
    }
    else {
      double v11 = v3;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 67109120;
      LODWORD(v13) = v5;
      int v7 = v11;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace) {
      uint64_t v6 = __osLogTrace;
    }
    else {
      uint64_t v6 = v3;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 67109120;
      LODWORD(v13) = 0;
      int v7 = v6;
      os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_21FFF3000, v7, v8, "saveTemplateListAfterTemplateUpdate -> %d\n", (uint8_t *)&v12, 8u);
    }
  }
  return v5;
}

- (void)deleteUnusedCatacombFiles
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  double v3 = &_os_log_internal;
  if (__osLogTrace) {
    id v4 = __osLogTrace;
  }
  else {
    id v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "deleteUnusedCatacombFiles\n", buf, 2u);
  }
  int v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  if (([(BKCatacomb *)self->_catacomb stateOfMasterComponent] & 2) != 0)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    int v7 = [(BKCatacomb *)self->_catacomb cachedComponents];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = [(BiometricKitXPCServer *)self catacombFileNameForComponent:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          [v5 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v9);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v13 = [(NSRecursiveLock *)self->_catacombLock content];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          __int16 v18 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if (([v5 containsObject:v18] & 1) == 0
            && ([v18 isEqualToString:@"biolockout.cat"] & 1) == 0)
          {
            [v6 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v15);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = v6;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          -[NSRecursiveLock deleteFile:](self->_catacombLock, "deleteFile:", *(void *)(*((void *)&v25 + 1) + 8 * k), (void)v25);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v38 count:16];
      }
      while (v21);
    }
  }
  if (__osLogTrace) {
    __int16 v24 = __osLogTrace;
  }
  else {
    __int16 v24 = v3;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21FFF3000, v24, OS_LOG_TYPE_DEBUG, "deleteUnusedCatacombFiles -> void\n", buf, 2u);
  }
}

- (int)getCatacombSaveListForComponents:(id)a3 list:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138412546;
    *(void *)long long v37 = v6;
    *(_WORD *)&v37[8] = 2048;
    *(void *)&v37[10] = a4;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "getCatacombSaveListForComponents:list: %@, %p\n", buf, 0x16u);
  }
  uint64_t v9 = [MEMORY[0x263EFF980] array];
  if (v6)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (([v15 isMasterComponent] & 1) == 0) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v12);

      int v7 = &_os_log_internal;
LABEL_30:
      id v10 = +[CatacombComponent masterComponent];
      [v9 addObject:v10];
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  int v16 = [(BiometricKitXPCServer *)self readCatacombState];
  if (!v16)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = [(BKCatacomb *)self->_catacomb cachedComponents];
    uint64_t v17 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      char v19 = 0;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v10);
          }
          uint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          if (([(BKCatacomb *)self->_catacomb stateOfComponent:v22] & 4) != 0)
          {
            if (([v22 isMasterComponent] & 1) == 0) {
              [v9 addObject:v22];
            }
            char v19 = 1;
          }
        }
        uint64_t v18 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v18);

      int v7 = &_os_log_internal;
      if ((v19 & 1) == 0) {
        goto LABEL_32;
      }
      goto LABEL_30;
    }
LABEL_31:

LABEL_32:
    int v23 = 0;
    if (a4) {
      *a4 = v9;
    }
    goto LABEL_34;
  }
  int v23 = v16;
  if (__osLog) {
    long long v26 = __osLog;
  }
  else {
    long long v26 = v7;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 136316162;
    *(void *)long long v37 = "err == 0 ";
    *(_WORD *)&v37[8] = 2048;
    *(void *)&v37[10] = v23;
    __int16 v38 = 2080;
    long long v39 = &unk_22004A573;
    __int16 v40 = 2080;
    uint64_t v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v42 = 1024;
    int v43 = 4198;
    _os_log_impl(&dword_21FFF3000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_34:
  if (__osLogTrace) {
    __int16 v24 = __osLogTrace;
  }
  else {
    __int16 v24 = v7;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109378;
    *(_DWORD *)long long v37 = v23;
    *(_WORD *)&v37[4] = 2112;
    *(void *)&v37[6] = v9;
    _os_log_impl(&dword_21FFF3000, v24, OS_LOG_TYPE_DEBUG, "getCatacombSaveListForComponents:list: -> %d (list = %@)\n", buf, 0x12u);
  }

  return v23;
}

- (unsigned)catacombVersion
{
  return 0x10000;
}

- (int)archiveCatacombDataForComponent:(id)a3 toArchiver:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = (char *)a3;
  id v7 = a4;
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 134218240;
    long long v36 = v6;
    __int16 v37 = 2048;
    id v38 = v7;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "archiveCatacombDataForComponent:toArchiver: %p, %p\n", buf, 0x16u);
  }
  unsigned int v34 = 0;
  if (!v6)
  {
    if (__osLog) {
      long long v27 = __osLog;
    }
    else {
      long long v27 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)stat buf = 136316162;
    long long v36 = "component";
    __int16 v37 = 2048;
    id v38 = 0;
    __int16 v39 = 2080;
    __int16 v40 = &unk_22004A573;
    __int16 v41 = 2080;
    __int16 v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v43 = 1024;
    int v44 = 4249;
    goto LABEL_47;
  }
  if (!v7)
  {
    if (__osLog) {
      long long v27 = __osLog;
    }
    else {
      long long v27 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)stat buf = 136316162;
    long long v36 = "archiver";
    __int16 v37 = 2048;
    id v38 = 0;
    __int16 v39 = 2080;
    __int16 v40 = &unk_22004A573;
    __int16 v41 = 2080;
    __int16 v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v43 = 1024;
    int v44 = 4250;
LABEL_47:
    _os_log_impl(&dword_21FFF3000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_48:
    id v10 = 0;
    int v9 = 258;
    goto LABEL_66;
  }
  int v9 = [(BiometricKitXPCServer *)self performPrepareSaveCatacombCommand:v6 outDataSize:&v34];
  if (v9)
  {
    if (__osLog) {
      long long v28 = __osLog;
    }
    else {
      long long v28 = &_os_log_internal;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      long long v36 = "err == 0 ";
      __int16 v37 = 2048;
      id v38 = (id)v9;
      __int16 v39 = 2080;
      __int16 v40 = &unk_22004A573;
      __int16 v41 = 2080;
      __int16 v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v43 = 1024;
      int v44 = 4254;
      _os_log_impl(&dword_21FFF3000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v10 = 0;
  }
  else
  {
    id v10 = [MEMORY[0x263EFF990] dataWithLength:v34];
    if (v10)
    {
      int v9 = [(BiometricKitXPCServer *)self performCompleteSaveCatacombCommand:v6 outBuffer:v10];
      if (!v9)
      {
        if (isInternalBuild())
        {
          uint64_t v11 = [NSString stringWithFormat:@"Saving secure data, component = %@", v6];
          [(BiometricKitXPCServer *)self logCatacombInfo:v11 data:v10];
        }
        objc_msgSend(v7, "encodeInt32:forKey:", -[BiometricKitXPCServer catacombVersion](self, "catacombVersion"), @"CatacombVersion");
        objc_msgSend(v7, "encodeInt32:forKey:", objc_msgSend(v6, "userID"), @"CatacombUserID");
        [v7 encodeObject:v10 forKey:@"CatacombSecureData"];
        if ([v6 isMasterComponent]) {
          goto LABEL_30;
        }
        uint64_t v12 = [(BiometricKitXPCServer *)self identitiesOfComponent:v6];
        if (v12) {
          [v7 encodeObject:v12 forKey:@"CatacombIdentityList"];
        }
        if ([v6 isUserComponent])
        {
          id v13 = self->_expressModeState;
          objc_sync_enter(v13);
          expressModeState = (void *)self->_expressModeState;
          uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "userID"));
          int v16 = [expressModeState objectForKeyedSubscript:v15];

          objc_sync_exit(v13);
          if (!v16)
          {
            id v33 = 0;
            -[BiometricKitXPCServer getUserUUIDForUID:userUUID:](self, "getUserUUIDForUID:userUUID:", [v6 userID], &v33);
            id v17 = v33;
            if (v17)
            {
              int v16 = v17;
              id v18 = self->_expressModeState;
              objc_sync_enter(v18);
              char v19 = (void *)self->_expressModeState;
              uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "userID"));
              [v19 setObject:v16 forKey:v20];

              objc_sync_exit(v18);
            }
            else
            {
              if (__osLog) {
                long long v32 = __osLog;
              }
              else {
                long long v32 = &_os_log_internal;
              }
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)stat buf = 136316162;
                long long v36 = "uuid";
                __int16 v37 = 2048;
                id v38 = 0;
                __int16 v39 = 2080;
                __int16 v40 = &unk_22004A573;
                __int16 v41 = 2080;
                __int16 v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                __int16 v43 = 1024;
                int v44 = 4305;
                _os_log_impl(&dword_21FFF3000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              int v16 = 0;
            }
          }
          [v7 encodeObject:v16 forKey:@"CatacombUserUUID"];
          uint64_t v21 = -[BiometricKitXPCServer getUserKeybagUUIDForUID:](self, "getUserKeybagUUIDForUID:", [v6 userID]);
          uint64_t v22 = self->_catacombUserUUIDs;
          objc_sync_enter(v22);
          catacombUserUUIDs = self->_catacombUserUUIDs;
          __int16 v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "userID"));
          if (v21)
          {
            [(NSMutableDictionary *)catacombUserUUIDs setObject:v21 forKey:v24];
          }
          else
          {
            uint64_t v21 = [(NSMutableDictionary *)catacombUserUUIDs objectForKeyedSubscript:v24];
          }

          objc_sync_exit(v22);
          if (v21) {
            [v7 encodeObject:v21 forKey:@"CatacombUserKeybagUUID"];
          }
        }
        else
        {
          if (![v6 isGroupComponent])
          {
LABEL_29:

LABEL_30:
            if (__osLogTrace) {
              long long v25 = __osLogTrace;
            }
            else {
              long long v25 = &_os_log_internal;
            }
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)stat buf = 67109120;
              LODWORD(v36) = 0;
              _os_log_impl(&dword_21FFF3000, v25, OS_LOG_TYPE_DEBUG, "archiveCatacombDataForComponent:toArchiver: -> %d\n", buf, 8u);
            }
            int v9 = 0;
            goto LABEL_36;
          }
          int v16 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", objc_msgSend(v6, "group"), 8);
          [v7 encodeObject:v16 forKey:@"CatacombGroup"];
        }

        goto LABEL_29;
      }
      if (__osLog) {
        long long v30 = __osLog;
      }
      else {
        long long v30 = &_os_log_internal;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        long long v36 = "err == 0 ";
        __int16 v37 = 2048;
        id v38 = (id)v9;
        __int16 v39 = 2080;
        __int16 v40 = &unk_22004A573;
        __int16 v41 = 2080;
        __int16 v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v43 = 1024;
        int v44 = 4262;
        _os_log_impl(&dword_21FFF3000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (__osLog) {
        long long v29 = __osLog;
      }
      else {
        long long v29 = &_os_log_internal;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        long long v36 = "buffer";
        __int16 v37 = 2048;
        id v38 = 0;
        __int16 v39 = 2080;
        __int16 v40 = &unk_22004A573;
        __int16 v41 = 2080;
        __int16 v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v43 = 1024;
        int v44 = 4258;
        _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v10 = 0;
      int v9 = 260;
    }
  }
LABEL_66:
  if (__osLogTrace) {
    long long v31 = __osLogTrace;
  }
  else {
    long long v31 = &_os_log_internal;
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v36) = v9;
    _os_log_impl(&dword_21FFF3000, v31, OS_LOG_TYPE_ERROR, "archiveCatacombDataForComponent:toArchiver: -> %d\n", buf, 8u);
  }
LABEL_36:

  return v9;
}

- (int)unarchiveCatacombDataForComponent:(id)a3 fromUnarchiver:(id)a4 secureData:(id *)a5 identities:(id *)a6
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (__osLogTrace) {
    uint64_t v11 = __osLogTrace;
  }
  else {
    uint64_t v11 = &_os_log_internal;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138413058;
    *(void *)&uint8_t buf[4] = v9;
    __int16 v59 = 2048;
    id v60 = v10;
    __int16 v61 = 2048;
    int v62 = a5;
    __int16 v63 = 2048;
    uint64_t v64 = a6;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "unarchiveCatacombDataForComponent:fromUnarchiver:secureData:identities: %@, %p, %p, %p\n", buf, 0x2Au);
  }
  if (!v9)
  {
    if (__osLog) {
      uint64_t v45 = __osLog;
    }
    else {
      uint64_t v45 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_71;
    }
    *(_DWORD *)stat buf = 136316162;
    *(void *)&uint8_t buf[4] = "component";
    __int16 v59 = 2048;
    id v60 = 0;
    __int16 v61 = 2080;
    int v62 = (id *)&unk_22004A573;
    __int16 v63 = 2080;
    uint64_t v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v65 = 1024;
    int v66 = 4354;
    goto LABEL_70;
  }
  if (v10)
  {
    unsigned int v12 = [(BiometricKitXPCServer *)self catacombVersion];
    if (v12 == [v10 decodeInt32ForKey:@"CatacombVersion"])
    {
      int v13 = [v9 userID];
      if (v13 == [v10 decodeInt32ForKey:@"CatacombUserID"])
      {
        id v50 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"CatacombSecureData"];
        if ([v9 isMasterComponent])
        {
          id v14 = 0;
LABEL_49:
          if (a5) {
            *a5 = v50;
          }
          if (a6) {
            *a6 = v14;
          }
          if (__osLogTrace) {
            __int16 v43 = __osLogTrace;
          }
          else {
            __int16 v43 = &_os_log_internal;
          }
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(void *)stat buf = 67109120;
            _os_log_impl(&dword_21FFF3000, v43, OS_LOG_TYPE_DEBUG, "unarchiveCatacombDataForComponent:fromUnarchiver:secureData:identities: -> %d\n", buf, 8u);
          }
          int v32 = 0;
          goto LABEL_59;
        }
        uint64_t v15 = (void *)MEMORY[0x263EFFA08];
        uint64_t v16 = objc_opt_class();
        id v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
        id v18 = [v10 decodeObjectOfClasses:v17 forKey:@"CatacombIdentityList"];

        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v14 = v18;
        uint64_t v19 = [v14 countByEnumeratingWithState:&v53 objects:v57 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v54;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v54 != v20) {
                objc_enumerationMutation(v14);
              }
              int v22 = [*(id *)(*((void *)&v53 + 1) + 8 * i) userID];
              if (v22 != [v9 userID])
              {
                if (__osLog) {
                  long long v31 = __osLog;
                }
                else {
                  long long v31 = &_os_log_internal;
                }
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)stat buf = 136316162;
                  *(void *)&uint8_t buf[4] = "identity.userID == component.userID";
                  __int16 v59 = 2048;
                  id v60 = 0;
                  __int16 v61 = 2080;
                  int v62 = (id *)&unk_22004A573;
                  __int16 v63 = 2080;
                  uint64_t v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
                  __int16 v65 = 1024;
                  int v66 = 4378;
                  _os_log_impl(&dword_21FFF3000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }

                goto LABEL_36;
              }
            }
            uint64_t v19 = [v14 countByEnumeratingWithState:&v53 objects:v57 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        if ([v9 isUserComponent])
        {
          int v23 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"CatacombUserUUID"];
          id v24 = self->_expressModeState;
          objc_sync_enter(v24);
          if (v23)
          {
            expressModeState = (void *)self->_expressModeState;
            long long v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "userID"));
            [expressModeState setObject:v23 forKey:v26];
          }
          else
          {
            id v52 = 0;
            -[BiometricKitXPCServer getUserUUIDForUID:userUUID:](self, "getUserUUIDForUID:userUUID:", [v9 userID], &v52);
            id v34 = v52;
            if (v34)
            {
              int v23 = v34;
              id v35 = self->_expressModeState;
              objc_sync_enter(v35);
              long long v36 = (void *)self->_expressModeState;
              __int16 v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "userID"));
              [v36 setObject:v23 forKey:v37];

              objc_sync_exit(v35);
            }
            else
            {
              if (__osLog) {
                uint64_t v49 = __osLog;
              }
              else {
                uint64_t v49 = &_os_log_internal;
              }
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)stat buf = 136316162;
                *(void *)&uint8_t buf[4] = "uuid";
                __int16 v59 = 2048;
                id v60 = 0;
                __int16 v61 = 2080;
                int v62 = (id *)&unk_22004A573;
                __int16 v63 = 2080;
                uint64_t v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                __int16 v65 = 1024;
                int v66 = 4393;
                _os_log_impl(&dword_21FFF3000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              int v23 = 0;
            }
          }
          objc_sync_exit(v24);

          id v38 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"CatacombUserKeybagUUID"];
          if (!v38) {
            goto LABEL_48;
          }
          __int16 v39 = self->_catacombUserUUIDs;
          objc_sync_enter(v39);
          catacombUserUUIDs = self->_catacombUserUUIDs;
          __int16 v41 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "userID"));
          [(NSMutableDictionary *)catacombUserUUIDs setObject:v38 forKey:v41];

          objc_sync_exit(v39);
          __int16 v42 = -[BiometricKitXPCServer getUserKeybagUUIDForUID:](self, "getUserKeybagUUIDForUID:", [v9 userID]);
          if (!v42 || ([v38 isEqual:v42] & 1) != 0)
          {

LABEL_48:
            goto LABEL_49;
          }
          __int16 v47 = v23;
          if (__osLog) {
            int v48 = __osLog;
          }
          else {
            int v48 = &_os_log_internal;
          }
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 136316162;
            *(void *)&uint8_t buf[4] = "[kbuuid isEqual:akskbuuid]";
            __int16 v59 = 2048;
            id v60 = 0;
            __int16 v61 = 2080;
            int v62 = (id *)&unk_22004A573;
            __int16 v63 = 2080;
            uint64_t v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            __int16 v65 = 1024;
            int v66 = 4412;
            _os_log_impl(&dword_21FFF3000, v48, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        else
        {
          if (![v9 isGroupComponent]) {
            goto LABEL_49;
          }
          long long v27 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"CatacombGroup"];
          long long v28 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", objc_msgSend(v9, "group"), 8);
          char v29 = [v27 isEqualToData:v28];

          if (v29) {
            goto LABEL_49;
          }
          if (__osLog) {
            long long v30 = __osLog;
          }
          else {
            long long v30 = &_os_log_internal;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 136316162;
            *(void *)&uint8_t buf[4] = "isEqualGroup";
            __int16 v59 = 2048;
            id v60 = 0;
            __int16 v61 = 2080;
            int v62 = (id *)&unk_22004A573;
            __int16 v63 = 2080;
            uint64_t v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            __int16 v65 = 1024;
            int v66 = 4419;
            _os_log_impl(&dword_21FFF3000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        goto LABEL_36;
      }
      if (__osLog) {
        long long v46 = __osLog;
      }
      else {
        long long v46 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
LABEL_83:
        id v14 = 0;
        id v50 = 0;
LABEL_36:
        int v32 = 269;
        goto LABEL_37;
      }
      *(_DWORD *)stat buf = 136316162;
      *(void *)&uint8_t buf[4] = "component.userID == [unarchiver decodeInt32ForKey:kCatacombUserIDKey]";
      __int16 v59 = 2048;
      id v60 = 0;
      __int16 v61 = 2080;
      int v62 = (id *)&unk_22004A573;
      __int16 v63 = 2080;
      uint64_t v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v65 = 1024;
      int v66 = 4359;
    }
    else
    {
      if (__osLog) {
        long long v46 = __osLog;
      }
      else {
        long long v46 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        goto LABEL_83;
      }
      *(_DWORD *)stat buf = 136316162;
      *(void *)&uint8_t buf[4] = "[self catacombVersion] == [unarchiver decodeInt32ForKey:kCatacombVersionKey]";
      __int16 v59 = 2048;
      id v60 = 0;
      __int16 v61 = 2080;
      int v62 = (id *)&unk_22004A573;
      __int16 v63 = 2080;
      uint64_t v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v65 = 1024;
      int v66 = 4358;
    }
    _os_log_impl(&dword_21FFF3000, v46, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_83;
  }
  if (__osLog) {
    uint64_t v45 = __osLog;
  }
  else {
    uint64_t v45 = &_os_log_internal;
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 136316162;
    *(void *)&uint8_t buf[4] = "unarchiver";
    __int16 v59 = 2048;
    id v60 = 0;
    __int16 v61 = 2080;
    int v62 = (id *)&unk_22004A573;
    __int16 v63 = 2080;
    uint64_t v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v65 = 1024;
    int v66 = 4355;
LABEL_70:
    _os_log_impl(&dword_21FFF3000, v45, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_71:
  id v14 = 0;
  id v50 = 0;
  int v32 = 258;
LABEL_37:
  if (__osLogTrace) {
    id v33 = __osLogTrace;
  }
  else {
    id v33 = &_os_log_internal;
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v32;
    _os_log_impl(&dword_21FFF3000, v33, OS_LOG_TYPE_ERROR, "unarchiveCatacombDataForComponent:fromUnarchiver:secureData:identities: -> %d\n", buf, 8u);
  }
LABEL_59:

  return v32;
}

- (int)saveCatacomb
{
  if (__osLogTrace) {
    double v3 = __osLogTrace;
  }
  else {
    double v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEBUG, "saveCatacomb --> saveCatacombForComponents:\n", v5, 2u);
  }
  return [(BiometricKitXPCServer *)self saveCatacombForComponents:0];
}

- (int)saveCatacombForComponents:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  int v5 = &_os_log_internal;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 134218242;
    id v34 = v4;
    __int16 v35 = 2114;
    long long v36 = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEFAULT, "saveCatacombForComponents: %p(%{public}@)\n", buf, 0x16u);
  }
  id v7 = (void *)os_transaction_create();
  uint64_t v8 = (void *)MEMORY[0x223C64ED0]([(NSMutableArray *)self->_cachedIdentities lock]);
  if (isEphemeralMultiUser())
  {
    if (__osLog) {
      long long v27 = __osLog;
    }
    else {
      long long v27 = v5;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      id v34 = "!isEphemeralMultiUser()";
      __int16 v35 = 2048;
      long long v36 = 0;
      __int16 v37 = 2080;
      id v38 = &unk_22004A573;
      __int16 v39 = 2080;
      __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v41 = 1024;
      int v42 = 4468;
      _os_log_impl(&dword_21FFF3000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v11 = 0;
    int v9 = 257;
  }
  else
  {
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_saveTemplateListAfterTemplateUpdate object:0];
    [(BiometricOperation *)self->_runningBioOp setActive:0];
    [(BiometricKitXPCServer *)self cacheCatacombInfo];
    id v32 = 0;
    int v9 = [(BiometricKitXPCServer *)self getCatacombSaveListForComponents:v4 list:&v32];
    id v10 = v32;
    uint64_t v11 = v10;
    if (v9)
    {
      if (__osLog) {
        long long v28 = __osLog;
      }
      else {
        long long v28 = v5;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        id v34 = "err == 0 ";
        __int16 v35 = 2048;
        long long v36 = (char *)v9;
        __int16 v37 = 2080;
        id v38 = &unk_22004A573;
        __int16 v39 = 2080;
        __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v41 = 1024;
        int v42 = 4478;
        _os_log_impl(&dword_21FFF3000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (![v10 count])
      {
        int v9 = 0;
        goto LABEL_23;
      }
      char v29 = v8;
      long long v30 = v7;
      long long v31 = v4;
      uint64_t v12 = 0;
      while (1)
      {
        int v13 = [v11 objectAtIndexedSubscript:v12];
        id v14 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
        if (!v14)
        {
          int v5 = &_os_log_internal;
          if (__osLog) {
            long long v25 = __osLog;
          }
          else {
            long long v25 = &_os_log_internal;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 136316162;
            id v34 = "archiver";
            __int16 v35 = 2048;
            long long v36 = 0;
            __int16 v37 = 2080;
            id v38 = &unk_22004A573;
            __int16 v39 = 2080;
            __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            __int16 v41 = 1024;
            int v42 = 4486;
            _os_log_impl(&dword_21FFF3000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          int v9 = 261;
          goto LABEL_56;
        }
        int v15 = [(BiometricKitXPCServer *)self archiveCatacombDataForComponent:v13 toArchiver:v14];
        if (v15) {
          break;
        }
        [v14 finishEncoding];
        if (isInternalBuild())
        {
          uint64_t v16 = [NSString stringWithFormat:@"Saving Catacomb file, component = %@", v13];
          id v17 = [v14 encodedData];
          [(BiometricKitXPCServer *)self logCatacombInfo:v16 data:v17];
        }
        catacombLocuint64_t k = self->_catacombLock;
        uint64_t v19 = [v14 encodedData];
        uint64_t v20 = [(BiometricKitXPCServer *)self catacombFileNameForComponent:v13];
        int v9 = [(NSRecursiveLock *)catacombLock writeData:v19 toFile:v20];

        if (v9)
        {
          int v5 = &_os_log_internal;
          if (__osLog) {
            long long v26 = __osLog;
          }
          else {
            long long v26 = &_os_log_internal;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 136316162;
            id v34 = "err == 0 ";
            __int16 v35 = 2048;
            long long v36 = (char *)v9;
            __int16 v37 = 2080;
            id v38 = &unk_22004A573;
            __int16 v39 = 2080;
            __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            __int16 v41 = 1024;
            int v42 = 4502;
            goto LABEL_55;
          }
          goto LABEL_56;
        }
        if (v12 == [v11 count] - 1)
        {
          int v21 = [(NSRecursiveLock *)self->_catacombLock commitWrite];
          if (v21)
          {
            int v9 = v21;
            int v5 = &_os_log_internal;
            if (__osLog) {
              long long v26 = __osLog;
            }
            else {
              long long v26 = &_os_log_internal;
            }
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)stat buf = 136316162;
              id v34 = "err == 0 ";
              __int16 v35 = 2048;
              long long v36 = (char *)v9;
              __int16 v37 = 2080;
              id v38 = &unk_22004A573;
              __int16 v39 = 2080;
              __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              __int16 v41 = 1024;
              int v42 = 4508;
              goto LABEL_55;
            }
            goto LABEL_56;
          }
        }
        int v22 = [(BiometricKitXPCServer *)self performConfirmSaveCatacombCommand:v13];
        if (v22)
        {
          int v9 = v22;
          int v5 = &_os_log_internal;
          if (__osLog) {
            long long v26 = __osLog;
          }
          else {
            long long v26 = &_os_log_internal;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 136316162;
            id v34 = "err == 0 ";
            __int16 v35 = 2048;
            long long v36 = (char *)v9;
            __int16 v37 = 2080;
            id v38 = &unk_22004A573;
            __int16 v39 = 2080;
            __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            __int16 v41 = 1024;
            int v42 = 4513;
            goto LABEL_55;
          }
          goto LABEL_56;
        }
        if ([v13 isUserComponent])
        {
          -[BiometricKitXPCServer logCatacombUUIDForUser:catacombUUID:](self, "logCatacombUUIDForUser:catacombUUID:", [v13 userID], 0);
          -[BiometricKitXPCServer logCatacombHashForUser:catacombHash:](self, "logCatacombHashForUser:catacombHash:", [v13 userID], 0);
        }

        if ([v11 count] <= (unint64_t)++v12)
        {
          int v9 = 0;
          id v7 = v30;
          id v4 = v31;
          int v5 = &_os_log_internal;
          uint64_t v8 = v29;
          goto LABEL_23;
        }
      }
      int v9 = v15;
      int v5 = &_os_log_internal;
      if (__osLog) {
        long long v26 = __osLog;
      }
      else {
        long long v26 = &_os_log_internal;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        id v34 = "err == 0 ";
        __int16 v35 = 2048;
        long long v36 = (char *)v9;
        __int16 v37 = 2080;
        id v38 = &unk_22004A573;
        __int16 v39 = 2080;
        __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v41 = 1024;
        int v42 = 4490;
LABEL_55:
        _os_log_impl(&dword_21FFF3000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
LABEL_56:
      id v7 = v30;
      id v4 = v31;
      uint64_t v8 = v29;
    }
    if (v9 == 269)
    {
      [(BiometricKitXPCServer *)self clearTemplateList];
      [(NSRecursiveLock *)self->_catacombLock deleteAll];
      int v9 = 269;
    }
  }
LABEL_23:

  [(NSMutableArray *)self->_cachedIdentities unlock];
  if (__osLogTrace) {
    int v23 = __osLogTrace;
  }
  else {
    int v23 = v5;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v34) = v9;
    _os_log_impl(&dword_21FFF3000, v23, OS_LOG_TYPE_DEFAULT, "saveCatacombForComponents -> %d\n", buf, 8u);
  }

  return v9;
}

- (int)saveCatacombForIdentity:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  int v5 = &_os_log_internal;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "saveCatacombForIdentity: %@\n", buf, 0xCu);
  }
  if (v4)
  {
    id v7 = [(BiometricKitXPCServer *)self catacombComponentForIdentity:v4];
    int v15 = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    int v9 = [(BiometricKitXPCServer *)self saveCatacombForComponents:v8];

    if (!v9)
    {
      if (__osLogTrace) {
        id v10 = __osLogTrace;
      }
      else {
        id v10 = v5;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)stat buf = 67109120;
        LODWORD(v17) = 0;
        _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "saveCatacombForIdentity: -> %d\n", buf, 8u);
      }
      int v9 = 0;
      goto LABEL_14;
    }
    if (__osLog) {
      int v13 = __osLog;
    }
    else {
      int v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      id v17 = "err == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = v9;
      __int16 v20 = 2080;
      int v21 = &unk_22004A573;
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 4552;
      _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v12 = __osLog;
    }
    else {
      uint64_t v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      id v17 = "identity";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      int v21 = &unk_22004A573;
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 4549;
      _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v9 = 258;
  }
  if (__osLogTrace) {
    id v14 = __osLogTrace;
  }
  else {
    id v14 = v5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v17) = v9;
    _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "saveCatacombForIdentity: -> %d\n", buf, 8u);
  }
LABEL_14:

  return v9;
}

- (int)loadCatacomb
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    double v3 = __osLogTrace;
  }
  else {
    double v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEFAULT, "loadCatacomb\n", buf, 2u);
  }
  [(NSMutableArray *)self->_cachedIdentities lock];
  if (![(BiometricKitXPCServer *)self supportsRemovableAccessories]) {
    [(BiometricKitXPCServer *)self cacheAccessories];
  }
  [(BiometricKitXPCServer *)self clearTemplateList];
  int v4 = [(BiometricKitXPCServer *)self readCatacombState];
  if (v4)
  {
    int v9 = v4;
    if (__osLog) {
      __int16 v35 = __osLog;
    }
    else {
      __int16 v35 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_68;
    }
    *(_DWORD *)stat buf = 136316162;
    __int16 v47 = "err == 0 ";
    __int16 v48 = 2048;
    uint64_t v49 = v9;
    __int16 v50 = 2080;
    long long v51 = &unk_22004A573;
    __int16 v52 = 2080;
    long long v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v54 = 1024;
    int v55 = 4586;
    goto LABEL_67;
  }
  if (isEphemeralMultiUser()) {
    goto LABEL_13;
  }
  if (isInternalBuild())
  {
    int v5 = [(NSRecursiveLock *)self->_catacombLock content];
    id v6 = NSString;
    id v7 = [MEMORY[0x263EFF910] date];
    uint64_t v8 = [v6 stringWithFormat:@"%@ - BKCatacomb::content(), count = %lu", v7, objc_msgSend(v5, "count")];
    [(BiometricKitXPCServer *)self writeStringToPersistentLog:v8];
  }
  if (([(BKCatacomb *)self->_catacomb stateOfMasterComponent] & 1) == 0)
  {
LABEL_13:
    int v9 = 0;
    char v10 = 1;
LABEL_14:
    [(BiometricKitXPCServer *)self performNoCatacombCommand:0xFFFFFFFFLL];
    [(BiometricKitXPCServer *)self readCatacombState];
    if ((v10 & 1) == 0
      && ([(CatacombStateCache *)self->_catacombStateCache sendAutoBugCaptureEvent:4098] & 1) == 0)
    {
      uint64_t v11 = (__osLog ? __osLog : &_os_log_internal);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        __int16 v47 = "abcResult";
        __int16 v48 = 2048;
        uint64_t v49 = 0;
        __int16 v50 = 2080;
        long long v51 = &unk_22004A573;
        __int16 v52 = 2080;
        long long v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v54 = 1024;
        int v55 = 4682;
        _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    goto LABEL_56;
  }
  uint64_t v12 = +[CatacombComponent masterComponent];
  int v9 = [(BiometricKitXPCServer *)self loadCatacombForComponent:v12];

  if (v9)
  {
    if (__osLog) {
      __int16 v35 = __osLog;
    }
    else {
      __int16 v35 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_68;
    }
    *(_DWORD *)stat buf = 136316162;
    __int16 v47 = "err == 0 ";
    __int16 v48 = 2048;
    uint64_t v49 = v9;
    __int16 v50 = 2080;
    long long v51 = &unk_22004A573;
    __int16 v52 = 2080;
    long long v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v54 = 1024;
    int v55 = 4601;
    goto LABEL_67;
  }
  int v13 = [(BiometricKitXPCServer *)self readCatacombState];
  if (v13)
  {
    int v9 = v13;
    if (__osLog) {
      __int16 v35 = __osLog;
    }
    else {
      __int16 v35 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_68;
    }
    *(_DWORD *)stat buf = 136316162;
    __int16 v47 = "err == 0 ";
    __int16 v48 = 2048;
    uint64_t v49 = v9;
    __int16 v50 = 2080;
    long long v51 = &unk_22004A573;
    __int16 v52 = 2080;
    long long v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v54 = 1024;
    int v55 = 4605;
LABEL_67:
    _os_log_impl(&dword_21FFF3000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_68:
    [(BiometricKitXPCServer *)self clearTemplateList];
    if (v9 == 269)
    {
      [(NSRecursiveLock *)self->_catacombLock deleteAll];
      char v10 = 0;
      int v9 = 269;
    }
    else
    {
      char v10 = 0;
    }
    goto LABEL_14;
  }
  id v14 = [MEMORY[0x263EFF980] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  int v15 = [(BKCatacomb *)self->_catacomb cachedUserComponents];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(v15);
        }
        __int16 v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([(BKCatacomb *)self->_catacomb stateOfComponent:v20])
        {
          int v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "userID"));
          [v14 addObject:v21];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v17);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v22 = v14;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = [*(id *)(*((void *)&v36 + 1) + 8 * v26) unsignedIntValue];
        int v28 = [(BiometricKitXPCServer *)self loadCatacombForUser:v27];
        if (__osLog) {
          char v29 = __osLog;
        }
        else {
          char v29 = &_os_log_internal;
        }
        if (v28)
        {
          int v30 = v28;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 136316162;
            __int16 v47 = "tempErr == 0 ";
            __int16 v48 = 2048;
            uint64_t v49 = v30;
            __int16 v50 = 2080;
            long long v51 = &unk_22004A573;
            __int16 v52 = 2080;
            long long v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            __int16 v54 = 1024;
            int v55 = 4622;
            _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          [(BiometricKitXPCServer *)self performNoCatacombCommand:v27];
          [(BiometricKitXPCServer *)self readCatacombState];
          if (([(CatacombStateCache *)self->_catacombStateCache sendAutoBugCaptureEvent:4098] & 1) == 0)
          {
            long long v31 = (__osLog ? __osLog : &_os_log_internal);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)stat buf = 136316162;
              __int16 v47 = "abcResult";
              __int16 v48 = 2048;
              uint64_t v49 = 0;
              __int16 v50 = 2080;
              long long v51 = &unk_22004A573;
              __int16 v52 = 2080;
              long long v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              __int16 v54 = 1024;
              int v55 = 4639;
              _os_log_impl(&dword_21FFF3000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }
          }
        }
        else
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)stat buf = 67109120;
            LODWORD(v47) = v27;
            _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_DEFAULT, "loadCatacomb loaded user: %u\n", buf, 8u);
          }
          [(BiometricKitXPCServer *)self syncTemplateListForUser:v27];
        }
        ++v26;
      }
      while (v24 != v26);
      uint64_t v32 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
      uint64_t v24 = v32;
    }
    while (v32);
  }

  [(BiometricKitXPCServer *)self updatePropertiesOfIdentities];
  self->_userListChangeDetected = 1;
  [(BiometricKitXPCServer *)self validateAllUsers];
  [(BiometricKitXPCServer *)self deleteUnusedCatacombFiles];

  int v9 = 0;
LABEL_56:
  [(BiometricKitXPCServer *)self setCatacombRestored:1];
  [(NSMutableArray *)self->_cachedIdentities unlock];
  if (__osLogTrace) {
    id v33 = __osLogTrace;
  }
  else {
    id v33 = &_os_log_internal;
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v47) = v9;
    _os_log_impl(&dword_21FFF3000, v33, OS_LOG_TYPE_DEFAULT, "loadCatacomb -> %d\n", buf, 8u);
  }
  return v9;
}

- (int)loadCatacombForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    int v5 = __osLogTrace;
  }
  else {
    int v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v29) = v3;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEFAULT, "loadCatacombForUser: %u\n", buf, 8u);
  }
  [(NSMutableArray *)self->_cachedIdentities lock];
  id v6 = +[CatacombComponent componentForUserID:v3];
  int v7 = [(BiometricKitXPCServer *)self loadCatacombForComponent:v6];

  if (v7)
  {
    if (__osLog) {
      int v21 = __osLog;
    }
    else {
      int v21 = &_os_log_internal;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      char v29 = "err == 0 ";
      __int16 v30 = 2048;
      uint64_t v31 = v7;
      __int16 v32 = 2080;
      id v33 = &unk_22004A573;
      __int16 v34 = 2080;
      __int16 v35 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v36 = 1024;
      int v37 = 4711;
      _os_log_impl(&dword_21FFF3000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v8 = [(BKCatacomb *)self->_catacomb cachedGroupComponentsForUser:v3];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v24;
      *(void *)&long long v10 = 136316162;
      long long v22 = v10;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
          if (-[BKCatacomb stateOfComponent:](self->_catacomb, "stateOfComponent:", v14, v22))
          {
            int v15 = [(BiometricKitXPCServer *)self loadCatacombForComponent:v14];
            if (v15)
            {
              int v16 = v15;
              uint64_t v17 = (__osLog ? __osLog : &_os_log_internal);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)stat buf = v22;
                char v29 = "err == 0 ";
                __int16 v30 = 2048;
                uint64_t v31 = v16;
                __int16 v32 = 2080;
                id v33 = &unk_22004A573;
                __int16 v34 = 2080;
                __int16 v35 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                __int16 v36 = 1024;
                int v37 = 4717;
                _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
            }
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v18 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        uint64_t v11 = v18;
      }
      while (v18);
    }

    [(BiometricKitXPCServer *)self logCatacombUUIDForUser:v3 catacombUUID:0];
    [(BiometricKitXPCServer *)self logCatacombHashForUser:v3 catacombHash:0];
    int v7 = 0;
  }
  [(NSMutableArray *)self->_cachedIdentities unlock];
  if (__osLogTrace) {
    uint64_t v19 = __osLogTrace;
  }
  else {
    uint64_t v19 = &_os_log_internal;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v29) = v7;
    _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_DEFAULT, "loadCatacombForUser: -> %d\n", buf, 8u);
  }
  return v7;
}

- (int)loadCatacombForComponent:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  int v4 = (char *)a3;
  if (__osLogTrace) {
    int v5 = __osLogTrace;
  }
  else {
    int v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 138412290;
    uint64_t v45 = v4;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEFAULT, "loadCatacombForComponent: %@\n", buf, 0xCu);
  }
  if (!v4)
  {
    if (__osLog) {
      uint64_t v31 = __osLog;
    }
    else {
      uint64_t v31 = &_os_log_internal;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      uint64_t v45 = "component";
      __int16 v46 = 2048;
      uint64_t v47 = 0;
      __int16 v48 = 2080;
      uint64_t v49 = &unk_22004A573;
      __int16 v50 = 2080;
      long long v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v52 = 1024;
      int v53 = 4751;
      _os_log_impl(&dword_21FFF3000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v10 = 0;
    __int16 v20 = 0;
    id v37 = 0;
    id v38 = 0;
    id v18 = 0;
    uint64_t v9 = 258;
    goto LABEL_41;
  }
  char v6 = [(BKCatacomb *)self->_catacomb stateOfComponent:v4];
  if ([v4 isUserComponent]) {
    -[BiometricKitXPCServer clearTemplateListForUser:](self, "clearTemplateListForUser:", [v4 userID]);
  }
  if ((v6 & 1) == 0)
  {
    if (__osLog) {
      __int16 v32 = __osLog;
    }
    else {
      __int16 v32 = &_os_log_internal;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      uint64_t v45 = "catacombState & (1 << 0)";
      __int16 v46 = 2048;
      uint64_t v47 = 0;
      __int16 v48 = 2080;
      uint64_t v49 = &unk_22004A573;
      __int16 v50 = 2080;
      long long v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v52 = 1024;
      int v53 = 4763;
      _os_log_impl(&dword_21FFF3000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v10 = 0;
    __int16 v20 = 0;
    id v37 = 0;
    id v38 = 0;
    id v18 = 0;
    uint64_t v9 = 257;
    goto LABEL_41;
  }
  catacombLocuint64_t k = self->_catacombLock;
  id v42 = 0;
  uint64_t v8 = [(BiometricKitXPCServer *)self catacombFileNameForComponent:v4];
  id v41 = 0;
  uint64_t v9 = [(NSRecursiveLock *)catacombLock readData:&v42 fromFile:v8 logString:&v41];
  id v10 = v42;
  id v37 = v41;

  if (isInternalBuild())
  {
    uint64_t v11 = NSString;
    uint64_t v12 = [MEMORY[0x263EFF910] date];
    uint64_t v13 = [(BiometricKitXPCServer *)self catacombFileNameForComponent:v4];
    uint64_t v14 = [v11 stringWithFormat:@"%@ - BKCatacomb::readData(file = '%@'), err = %d (%@)", v12, v13, v9, v37];
    [(BiometricKitXPCServer *)self writeStringToPersistentLog:v14];
  }
  if (v9)
  {
    if (__osLog) {
      id v33 = __osLog;
    }
    else {
      id v33 = &_os_log_internal;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      uint64_t v45 = "err == 0 ";
      __int16 v46 = 2048;
      uint64_t v47 = (int)v9;
      __int16 v48 = 2080;
      uint64_t v49 = &unk_22004A573;
      __int16 v50 = 2080;
      long long v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v52 = 1024;
      int v53 = 4770;
      _os_log_impl(&dword_21FFF3000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    __int16 v20 = 0;
    id v38 = 0;
    id v18 = 0;
    goto LABEL_41;
  }
  if (!v10)
  {
    if (__osLog) {
      __int16 v34 = __osLog;
    }
    else {
      __int16 v34 = &_os_log_internal;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      uint64_t v45 = "catacombData";
      __int16 v46 = 2048;
      uint64_t v47 = 0;
      __int16 v48 = 2080;
      uint64_t v49 = &unk_22004A573;
      __int16 v50 = 2080;
      long long v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v52 = 1024;
      int v53 = 4771;
      _os_log_impl(&dword_21FFF3000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v10 = 0;
    __int16 v20 = 0;
    id v38 = 0;
    id v18 = 0;
    uint64_t v9 = 261;
    goto LABEL_41;
  }
  if (isInternalBuild())
  {
    int v15 = [NSString stringWithFormat:@"Loading Catacomb file, component = %@", v4];
    [(BiometricKitXPCServer *)self logCatacombInfo:v15 data:v10];
  }
  if ([v10 length])
  {
    int v16 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v10 error:0];
    uint64_t v17 = v16;
    if (v16)
    {
      [v16 setDecodingFailurePolicy:0];
      id v39 = 0;
      id v40 = 0;
      uint64_t v9 = [(BiometricKitXPCServer *)self unarchiveCatacombDataForComponent:v4 fromUnarchiver:v17 secureData:&v40 identities:&v39];
      id v38 = v40;
      id v18 = v39;
      if (v9)
      {
        if (__osLog) {
          __int16 v36 = __osLog;
        }
        else {
          __int16 v36 = &_os_log_internal;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 136316162;
          uint64_t v45 = "err == 0 ";
          __int16 v46 = 2048;
          uint64_t v47 = (int)v9;
          __int16 v48 = 2080;
          uint64_t v49 = &unk_22004A573;
          __int16 v50 = 2080;
          long long v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v52 = 1024;
          int v53 = 4788;
          _os_log_impl(&dword_21FFF3000, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        int v19 = 4;
      }
      else
      {
        int v19 = 0;
      }
      __int16 v20 = v17;
    }
    else
    {
      if (__osLog) {
        __int16 v35 = __osLog;
      }
      else {
        __int16 v35 = &_os_log_internal;
      }
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        uint64_t v45 = "unarchiver";
        __int16 v46 = 2048;
        uint64_t v47 = 0;
        __int16 v48 = 2080;
        uint64_t v49 = &unk_22004A573;
        __int16 v50 = 2080;
        long long v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v52 = 1024;
        int v53 = 4783;
        _os_log_impl(&dword_21FFF3000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v18 = 0;
      id v38 = 0;
      __int16 v20 = 0;
      uint64_t v9 = 261;
      int v19 = 4;
    }
    [v20 finishDecoding];
    if (v19)
    {
LABEL_40:
      if (!v9) {
        goto LABEL_51;
      }
      goto LABEL_41;
    }
  }
  else
  {
    id v18 = 0;
    id v38 = 0;
    __int16 v20 = 0;
    uint64_t v9 = 0;
  }
  if ((v6 & 2) != 0)
  {
LABEL_38:
    if (v18) {
      [(BiometricKitXPCServer *)self addIdentityObjects:v18];
    }
    goto LABEL_40;
  }
  if (![v38 length])
  {
    if (([v4 isMasterComponent] & 1) != 0 || objc_msgSend(v4, "isUserComponent"))
    {
      uint64_t v9 = -[BiometricKitXPCServer performNoCatacombCommand:](self, "performNoCatacombCommand:", [v4 userID]);
      if (v9)
      {
        if (__osLog) {
          long long v22 = __osLog;
        }
        else {
          long long v22 = &_os_log_internal;
        }
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          goto LABEL_41;
        }
        *(_DWORD *)stat buf = 136316162;
        uint64_t v45 = "err == 0 ";
        __int16 v46 = 2048;
        uint64_t v47 = (int)v9;
        __int16 v48 = 2080;
        uint64_t v49 = &unk_22004A573;
        __int16 v50 = 2080;
        long long v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v52 = 1024;
        int v53 = 4828;
        goto LABEL_98;
      }
    }
    goto LABEL_37;
  }
  if (isInternalBuild())
  {
    int v21 = [NSString stringWithFormat:@"Loading secure data, component = %@", v4];
    [(BiometricKitXPCServer *)self logCatacombInfo:v21 data:v38];
  }
  uint64_t v9 = [(BiometricKitXPCServer *)self performLoadCatacombCommand:v4 inData:v38];
  if (!v9)
  {
LABEL_37:
    [(BiometricKitXPCServer *)self readCatacombState];
    goto LABEL_38;
  }
  if (__osLog) {
    long long v22 = __osLog;
  }
  else {
    long long v22 = &_os_log_internal;
  }
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    goto LABEL_41;
  }
  *(_DWORD *)stat buf = 136316162;
  uint64_t v45 = "err == 0 ";
  __int16 v46 = 2048;
  uint64_t v47 = (int)v9;
  __int16 v48 = 2080;
  uint64_t v49 = &unk_22004A573;
  __int16 v50 = 2080;
  long long v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
  __int16 v52 = 1024;
  int v53 = 4821;
LABEL_98:
  _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_41:
  if (isInternalBuild())
  {
    long long v23 = [NSString stringWithFormat:@"Loading catacomb failed, err = %d (0x%x)", v9, v9];
    [(BiometricKitXPCServer *)self writeStringToPersistentLog:v23];
  }
  if ([v4 isUserComponent]) {
    -[BiometricKitXPCServer clearTemplateListForUser:](self, "clearTemplateListForUser:", [v4 userID]);
  }
  if (v9 == 269)
  {
    char v24 = [v4 isMasterComponent];
    long long v25 = self->_catacombLock;
    if (v24)
    {
      [(NSRecursiveLock *)self->_catacombLock deleteAll];
    }
    else
    {
      long long v26 = [(BiometricKitXPCServer *)self catacombFileNameForComponent:v4];
      [(NSRecursiveLock *)v25 deleteFile:v26];

      if ([v4 isUserComponent])
      {
        -[BiometricKitXPCServer removeUser:](self, "removeUser:", [v4 userID]);
        uint64_t v27 = +[CatacombComponent masterComponent];
        long long v43 = v27;
        int v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
        [(BiometricKitXPCServer *)self saveCatacombForComponents:v28];
      }
    }
    LODWORD(v9) = 269;
  }
LABEL_51:
  if (__osLogTrace) {
    char v29 = __osLogTrace;
  }
  else {
    char v29 = &_os_log_internal;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v45) = v9;
    _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_DEFAULT, "loadCatacombForComponent: -> %d\n", buf, 8u);
  }

  return v9;
}

- (BOOL)supportsRemovableAccessories
{
  return 0;
}

- (int)cacheAccessories
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    uint64_t v3 = __osLogTrace;
  }
  else {
    uint64_t v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEBUG, "cacheAccessories\n", buf, 2u);
  }
  uint64_t v54 = [MEMORY[0x263EFF9C0] set];
  int v53 = [MEMORY[0x263EFF9C0] set];
  if (![(BiometricKitXPCServer *)self supportsRemovableAccessories])
  {
    char v6 = [MEMORY[0x263EFF990] dataWithLength:44];
    if (v6)
    {
      id v55 = v6;
      uint64_t v7 = [v55 mutableBytes];
      *(_DWORD *)uint64_t v7 = 1;
      uuid_clear((unsigned __int8 *)(v7 + 4));
      *(_DWORD *)(v7 + 20) = 1;
      uuid_clear((unsigned __int8 *)(v7 + 24));
      *(_DWORD *)(v7 + 40) = 6;
      goto LABEL_16;
    }
    if (__osLog) {
      __int16 v50 = __osLog;
    }
    else {
      __int16 v50 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
LABEL_105:
      id v55 = 0;
      int v4 = 260;
LABEL_106:
      if (__osLogTrace) {
        long long v51 = __osLogTrace;
      }
      else {
        long long v51 = &_os_log_internal;
      }
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v4;
        _os_log_impl(&dword_21FFF3000, v51, OS_LOG_TYPE_ERROR, "cacheAccessories -> %d\n", buf, 8u);
      }
      goto LABEL_87;
    }
    *(_DWORD *)stat buf = 136316162;
    *(void *)&uint8_t buf[4] = "buffer";
    __int16 v72 = 2048;
    id v73 = 0;
    __int16 v74 = 2080;
    id v75 = &unk_22004A573;
    __int16 v76 = 2080;
    uint64_t v77 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v78 = 1024;
    int v79 = 5357;
LABEL_104:
    _os_log_impl(&dword_21FFF3000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_105;
  }
  id v55 = [MEMORY[0x263EFF990] dataWithLength:264];
  if (!v55)
  {
    if (__osLog) {
      __int16 v50 = __osLog;
    }
    else {
      __int16 v50 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_105;
    }
    *(_DWORD *)stat buf = 136316162;
    *(void *)&uint8_t buf[4] = "buffer";
    __int16 v72 = 2048;
    id v73 = 0;
    __int16 v74 = 2080;
    id v75 = &unk_22004A573;
    __int16 v76 = 2080;
    uint64_t v77 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v78 = 1024;
    int v79 = 5348;
    goto LABEL_104;
  }
  int v4 = -[BiometricKitXPCServer performGetBioDeviceListCommand:](self, "performGetBioDeviceListCommand:");
  if (v4)
  {
    if (__osLog) {
      int v5 = __osLog;
    }
    else {
      int v5 = &_os_log_internal;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)&uint8_t buf[4] = "err == 0 ";
      __int16 v72 = 2048;
      id v73 = (id)v4;
      __int16 v74 = 2080;
      id v75 = &unk_22004A573;
      __int16 v76 = 2080;
      uint64_t v77 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v78 = 1024;
      int v79 = 5352;
      _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_106;
  }
LABEL_16:
  if (__ROR8__(0x2E8BA2E8BA2E8BA3 * [v55 length], 2) >= 0x5D1745D1745D175uLL)
  {
    if (__osLog) {
      uint64_t v49 = __osLog;
    }
    else {
      uint64_t v49 = &_os_log_internal;
    }
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)&uint8_t buf[4] = "buffer.length % sizeof(biodevice_info_t) == 0";
      __int16 v72 = 2048;
      id v73 = 0;
      __int16 v74 = 2080;
      id v75 = &unk_22004A573;
      __int16 v76 = 2080;
      uint64_t v77 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v78 = 1024;
      int v79 = 5365;
      _os_log_impl(&dword_21FFF3000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v4 = 261;
    goto LABEL_106;
  }
  unint64_t v8 = [v55 length];
  if (v8 >= 0x2C)
  {
    uint64_t v9 = 0;
    unint64_t v10 = v8 / 0x2C;
    do
    {
      uint64_t v11 = [v55 mutableBytes];
      id v12 = objc_alloc_init(MEMORY[0x263F2AA70]);
      id v13 = objc_alloc_init(MEMORY[0x263F2AA78]);
      [v13 setType:*(unsigned int *)(v11 + v9 + 20)];
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v11 + v9 + 24];
      [v13 setUuid:v14];

      if ([v13 type] == 1)
      {
        [v13 setName:@"Builtin"];
      }
      else
      {
        int v15 = [v13 type];
        int v16 = NSString;
        if (v15 == 2)
        {
          uint64_t v17 = [v13 uuid];
          id v18 = [v17 UUIDString];
          int v19 = [v16 stringWithFormat:@"Trusted Accessory %@", v18];
          [v13 setName:v19];
        }
        else
        {
          uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Type %u", objc_msgSend(v13, "type"));
          [v13 setName:v17];
        }
      }
      [v12 setType:*(unsigned int *)(v11 + v9)];
      __int16 v20 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v11 + v9 + 4];
      [v12 setUuid:v20];

      if ([v12 type] == 1)
      {
        [v12 setName:@"Builtin"];
      }
      else
      {
        int v21 = [v12 type];
        long long v22 = NSString;
        if (v21 == 2)
        {
          long long v23 = [v12 uuid];
          char v24 = [v23 UUIDString];
          long long v25 = [v22 stringWithFormat:@"Trusted Accessory %@", v24];
          [v12 setName:v25];
        }
        else
        {
          long long v23 = objc_msgSend(NSString, "stringWithFormat:", @"Type %u", objc_msgSend(v12, "type"));
          [v13 setName:v23];
        }
      }
      [v12 setGroup:v13];
      [v12 setFlags:*(unsigned int *)(v11 + v9 + 40)];
      [v54 addObject:v12];
      if (([v12 flags] & 1) != 0 && (objc_msgSend(v12, "flags") & 2) != 0) {
        [v53 addObject:v12];
      }

      v9 += 44;
      --v10;
    }
    while (v10);
  }
  long long v26 = self->_biometricABCDispatchQueue;
  objc_sync_enter(v26);
  uint64_t v27 = [MEMORY[0x263EFF9C0] set];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  int v28 = self->_biometricABCDispatchQueue;
  uint64_t v29 = [(OS_dispatch_queue *)v28 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v65 != v30) {
          objc_enumerationMutation(v28);
        }
        __int16 v32 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        if (([v32 flags] & 1) != 0 && (objc_msgSend(v32, "flags") & 2) != 0) {
          [v27 addObject:v32];
        }
      }
      uint64_t v29 = [(OS_dispatch_queue *)v28 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v29);
  }

  int v33 = [v27 isEqualToSet:v53];
  int v52 = [(OS_dispatch_queue *)self->_biometricABCDispatchQueue isEqualToSet:v54];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v34 = v54;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v61 != v36) {
          objc_enumerationMutation(v34);
        }
        id v38 = *(void **)(*((void *)&v60 + 1) + 8 * j);
        if ([v38 flags])
        {
          if (([(OS_dispatch_queue *)self->_biometricABCDispatchQueue containsObject:v38] & 1) == 0) {
            [(BiometricKitXPCServer *)self accessoryAdded:v38];
          }
          if (([v38 flags] & 2) != 0 && (objc_msgSend(v27, "containsObject:", v38) & 1) == 0)
          {
            [(BiometricKitXPCServer *)self accessoryConnected:v38];
          }
          else if (([v38 flags] & 2) == 0 && objc_msgSend(v27, "containsObject:", v38))
          {
            [(BiometricKitXPCServer *)self accessoryDisconnected:v38];
          }
        }
      }
      uint64_t v35 = [v34 countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v35);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v39 = self->_biometricABCDispatchQueue;
  uint64_t v40 = [(OS_dispatch_queue *)v39 countByEnumeratingWithState:&v56 objects:v68 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v57;
    do
    {
      for (uint64_t k = 0; k != v40; ++k)
      {
        if (*(void *)v57 != v41) {
          objc_enumerationMutation(v39);
        }
        long long v43 = *(void **)(*((void *)&v56 + 1) + 8 * k);
        if (([v43 flags] & 1) != 0 && (objc_msgSend(v34, "containsObject:", v43) & 1) == 0) {
          [(BiometricKitXPCServer *)self accessoryRemoved:v43];
        }
      }
      uint64_t v40 = [(OS_dispatch_queue *)v39 countByEnumeratingWithState:&v56 objects:v68 count:16];
    }
    while (v40);
  }

  [(OS_dispatch_queue *)self->_biometricABCDispatchQueue setSet:v34];
  if ((v52 & v33) == 1) {
    [(BiometricKitXPCServer *)self accessoryMayHaveChanged];
  }
  if ((v33 & 1) == 0 && LOBYTE(self->_mkbLockStatusNtfToken))
  {
    notify_set_state(HIDWORD(self->_catacombUserKeybagUUIDs), [v53 count]);
    notify_post("com.apple.BiometricKit.connectedAccessoriesChanged");
  }

  objc_sync_exit(v26);
  if (__osLog) {
    int v44 = __osLog;
  }
  else {
    int v44 = &_os_log_internal;
  }
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v45 = v44;
    uint64_t v46 = [v34 count];
    *(_DWORD *)stat buf = 134218242;
    *(void *)&uint8_t buf[4] = v46;
    __int16 v72 = 2114;
    id v73 = v34;
    _os_log_impl(&dword_21FFF3000, v45, OS_LOG_TYPE_DEFAULT, "cacheAccessories accessories %lu: %{public}@\n", buf, 0x16u);
  }
  if (__osLogTrace) {
    uint64_t v47 = __osLogTrace;
  }
  else {
    uint64_t v47 = &_os_log_internal;
  }
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    *(void *)stat buf = 67109120;
    _os_log_impl(&dword_21FFF3000, v47, OS_LOG_TYPE_DEBUG, "cacheAccessories -> %d\n", buf, 8u);
  }
  int v4 = 0;
LABEL_87:

  return v4;
}

- (id)getAccessoryObject:(id *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    int v5 = __osLogTrace;
  }
  else {
    int v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 134217984;
    long long v25 = a3;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEBUG, "getAccessoryObject: %p\n", buf, 0xCu);
  }
  if (a3)
  {
    id obj = self->_biometricABCDispatchQueue;
    objc_sync_enter(obj);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    char v6 = self->_biometricABCDispatchQueue;
    uint64_t v7 = [(OS_dispatch_queue *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          unint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v10 type] == a3->var0)
          {
            uint64_t v11 = [v10 uuid];
            id v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->var1];
            int v13 = [v11 isEqual:v12];

            if (v13)
            {
              uint64_t v14 = v10;
              goto LABEL_18;
            }
          }
        }
        uint64_t v7 = [(OS_dispatch_queue *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v14 = 0;
LABEL_18:

    objc_sync_exit(obj);
  }
  else
  {
    if (__osLog) {
      uint64_t v17 = __osLog;
    }
    else {
      uint64_t v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      long long v25 = ($7287BE6C16BD8CBBAFC45DEB4D81687E *)"device";
      __int16 v26 = 2048;
      uint64_t v27 = 0;
      __int16 v28 = 2080;
      uint64_t v29 = &unk_22004A573;
      __int16 v30 = 2080;
      uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v32 = 1024;
      int v33 = 5482;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v14 = 0;
  }
  if (__osLogTrace) {
    int v15 = __osLogTrace;
  }
  else {
    int v15 = &_os_log_internal;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 134218242;
    long long v25 = v14;
    __int16 v26 = 2112;
    uint64_t v27 = v14;
    _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_DEBUG, "getAccessoryObject: -> %p(%@)\n", buf, 0x16u);
  }
  return v14;
}

- (id)pairedAccessories
{
  uint64_t v3 = self->_biometricABCDispatchQueue;
  objc_sync_enter(v3);
  int v4 = (void *)[(OS_dispatch_queue *)self->_biometricABCDispatchQueue copy];
  objc_sync_exit(v3);

  return v4;
}

- (id)connectedAccessories
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:1];
  int v4 = self->_biometricABCDispatchQueue;
  objc_sync_enter(v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v5 = self->_biometricABCDispatchQueue;
  uint64_t v6 = [(OS_dispatch_queue *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "flags", (void)v12) & 2) != 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(OS_dispatch_queue *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
  unint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (int)listAccessories:(id *)a3 client:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134218242;
    long long v20 = (const char *)a3;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "listAccessories:client: %p %@\n", (uint8_t *)&v19, 0x16u);
  }
  if (a3)
  {
    int v9 = [(BiometricKitXPCServer *)self cacheAccessories];
    if (!v9)
    {
      unint64_t v10 = self->_biometricABCDispatchQueue;
      objc_sync_enter(v10);
      uint64_t v11 = [(OS_dispatch_queue *)self->_biometricABCDispatchQueue allObjects];
      *a3 = (id)[v11 copy];

      objc_sync_exit(v10);
      if (__osLogTrace) {
        long long v12 = __osLogTrace;
      }
      else {
        long long v12 = v7;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        long long v13 = (const char *)*a3;
        int v19 = 138412546;
        long long v20 = v13;
        __int16 v21 = 1024;
        LODWORD(v22) = 0;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_DEBUG, "listAccessories:client: -> %@ %d\n", (uint8_t *)&v19, 0x12u);
      }
      int v9 = 0;
      goto LABEL_14;
    }
    if (__osLog) {
      int v16 = __osLog;
    }
    else {
      int v16 = v7;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      long long v20 = "err == 0 ";
      __int16 v21 = 2048;
      id v22 = (id)v9;
      __int16 v23 = 2080;
      char v24 = &unk_22004A573;
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v27 = 1024;
      int v28 = 5581;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      long long v15 = __osLog;
    }
    else {
      long long v15 = v7;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      long long v20 = "accessories";
      __int16 v21 = 2048;
      id v22 = 0;
      __int16 v23 = 2080;
      char v24 = &unk_22004A573;
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v27 = 1024;
      int v28 = 5577;
      _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    int v9 = 258;
  }
  if (__osLogTrace) {
    uint64_t v17 = __osLogTrace;
  }
  else {
    uint64_t v17 = v7;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      id v18 = (const char *)*a3;
    }
    else {
      id v18 = 0;
    }
    int v19 = 138412546;
    long long v20 = v18;
    __int16 v21 = 1024;
    LODWORD(v22) = v9;
    _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "listAccessories:client: -> %@ %d\n", (uint8_t *)&v19, 0x12u);
  }
LABEL_14:

  return v9;
}

- (int)getFreeIdentityCount:(unint64_t *)a3 forUser:(unsigned int)a4 accessoryGroup:(id)a5 client:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  long long v12 = &_os_log_internal;
  if (__osLogTrace) {
    long long v13 = __osLogTrace;
  }
  else {
    long long v13 = &_os_log_internal;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 134218754;
    __int16 v30 = (const char *)a3;
    __int16 v31 = 1024;
    *(_DWORD *)__int16 v32 = v7;
    *(_WORD *)&v32[4] = 2112;
    *(void *)&v32[6] = v10;
    *(_WORD *)&v32[14] = 2112;
    *(void *)&v32[16] = v11;
    _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_DEBUG, "getFreeIdentityCount:forUser:accessoryGroup:client: %p %u %@ %@\n", buf, 0x26u);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  v35[0] = 0;
  v35[1] = 0;
  int v36 = 0;
  unsigned int v28 = 0;
  if (!a3)
  {
    if (__osLog) {
      __int16 v27 = __osLog;
    }
    else {
      __int16 v27 = v12;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      __int16 v30 = "count";
      __int16 v31 = 2048;
      *(void *)__int16 v32 = 0;
      *(_WORD *)&v32[8] = 2080;
      *(void *)&v32[10] = &unk_22004A573;
      *(_WORD *)&v32[18] = 2080;
      *(void *)&v32[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
      __int16 v33 = 1024;
      int v34 = 5609;
      _os_log_impl(&dword_21FFF3000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v18 = 258;
    goto LABEL_19;
  }
  [(BiometricKitXPCServer *)self validateAllUsers];
  BOOL v14 = [(BiometricKitXPCServer *)self supportsRemovableAccessories];
  int v15 = [v10 type];
  if (v14)
  {
    LODWORD(v35[0]) = v15;
    int v16 = [v10 uuid];
    [v16 getUUIDBytes:(char *)v35 + 4];

    int v17 = [(BiometricKitXPCServer *)self performGetFreeIdentityCountCommand:v7 group:v35 outCount:&v28];
    if (v17)
    {
      int v18 = v17;
      if (__osLog) {
        int v19 = __osLog;
      }
      else {
        int v19 = v12;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        __int16 v30 = "err == 0 ";
        __int16 v31 = 2048;
        *(void *)__int16 v32 = v18;
        *(_WORD *)&v32[8] = 2080;
        *(void *)&v32[10] = &unk_22004A573;
        *(_WORD *)&v32[18] = 2080;
        *(void *)&v32[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
        __int16 v33 = 1024;
        int v34 = 5619;
LABEL_48:
        _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
LABEL_18:
    int v18 = 0;
    *a3 = v28;
    goto LABEL_19;
  }
  if (v15 != 1) {
    goto LABEL_18;
  }
  int v20 = [(BiometricKitXPCServer *)self performGetFreeIdentityCountCommand:v7 outCount:&v28];
  if (!v20) {
    goto LABEL_18;
  }
  int v18 = v20;
  if (__osLog) {
    int v19 = __osLog;
  }
  else {
    int v19 = v12;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 136316162;
    __int16 v30 = "err == 0 ";
    __int16 v31 = 2048;
    *(void *)__int16 v32 = v18;
    *(_WORD *)&v32[8] = 2080;
    *(void *)&v32[10] = &unk_22004A573;
    *(_WORD *)&v32[18] = 2080;
    *(void *)&v32[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v33 = 1024;
    int v34 = 5624;
    goto LABEL_48;
  }
LABEL_19:
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (__osLogTrace) {
    __int16 v21 = __osLogTrace;
  }
  else {
    __int16 v21 = v12;
  }
  if (v18)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        unint64_t v22 = *a3;
      }
      else {
        unint64_t v22 = 0;
      }
      *(_DWORD *)stat buf = 134218240;
      __int16 v30 = (const char *)v22;
      __int16 v31 = 1024;
      *(_DWORD *)__int16 v32 = v18;
      char v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
LABEL_35:
      _os_log_impl(&dword_21FFF3000, v24, v25, "getFreeIdentityCount:forUser:accessoryGroup:client: -> %lu %d\n", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    if (a3) {
      unint64_t v23 = *a3;
    }
    else {
      unint64_t v23 = 0;
    }
    *(_DWORD *)stat buf = 134218240;
    __int16 v30 = (const char *)v23;
    __int16 v31 = 1024;
    *(_DWORD *)__int16 v32 = 0;
    char v24 = v21;
    os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
    goto LABEL_35;
  }

  return v18;
}

- (int)getPreferencesValue:(id *)a3 forKey:(id)a4 withClient:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  int v9 = &_os_log_internal;
  if (__osLogTrace) {
    id v10 = __osLogTrace;
  }
  else {
    id v10 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 134218242;
    int v17 = a3;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "getPreferencesValue:%p forKey:%@\n", (uint8_t *)&v16, 0x16u);
  }
  if (a3)
  {
    *a3 = [MEMORY[0x263F2AA60] preferenceObjectForKey:v7];
    if (__osLogTrace) {
      id v11 = __osLogTrace;
    }
    else {
      id v11 = v9;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      long long v12 = (id *)*a3;
      int v16 = 138412802;
      int v17 = v12;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 1024;
      int v21 = 0;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "getPreferencesValue:%@ forKey:%@ -> %d\n", (uint8_t *)&v16, 0x1Cu);
    }
    int v13 = 0;
  }
  else
  {
    if (__osLogTrace) {
      BOOL v14 = __osLogTrace;
    }
    else {
      BOOL v14 = v9;
    }
    int v13 = 258;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412802;
      int v17 = 0;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 1024;
      int v21 = 258;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "getPreferencesValue:%@ forKey:%@ -> %d\n", (uint8_t *)&v16, 0x1Cu);
    }
  }

  return v13;
}

- (BOOL)setPreferencesValue:(id)a3 forKey:(id)a4 withClient:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = &_os_log_internal;
  if (__osLogTrace) {
    id v11 = __osLogTrace;
  }
  else {
    id v11 = &_os_log_internal;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "setPreferencesValue:%@ forKey:%@\n", (uint8_t *)&v17, 0x16u);
  }
  long long v12 = [MEMORY[0x263F2AA60] sharedInstance];
  int v13 = [v12 setObject:v7 forKey:v8];

  if (__osLogTrace) {
    BOOL v14 = __osLogTrace;
  }
  else {
    BOOL v14 = v10;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v15 = @"false";
    int v17 = 138412802;
    id v18 = v7;
    __int16 v19 = 2112;
    if (v13) {
      int v15 = @"true";
    }
    id v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_DEBUG, "setPreferencesValue:%@ forKey:%@ -> %@\n", (uint8_t *)&v17, 0x20u);
  }

  return v13;
}

- (int)getUserUUIDsForUIDs:(id)a3 userUUIDs:(id *)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = &_os_log_internal;
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v8;
    id v10 = [v6 componentsJoinedByString:@","];
    *(_DWORD *)stat buf = 134218242;
    uint64_t v46 = (const char *)v6;
    __int16 v47 = 2112;
    *(void *)__int16 v48 = v10;
    _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_DEBUG, "getUserUUIDsForUIDs: %p(%@)\n", buf, 0x16u);
  }
  id v11 = [MEMORY[0x263F841B0] sharedManager];
  long long v12 = [v11 allUsers];

  if (!v12)
  {
    if (__osLog) {
      int v36 = __osLog;
    }
    else {
      int v36 = v7;
    }
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_DWORD *)stat buf = 136316162;
    uint64_t v46 = "users";
    __int16 v47 = 2048;
    *(void *)__int16 v48 = 0;
    *(_WORD *)&v48[8] = 2080;
    *(void *)&v48[10] = &unk_22004A573;
    __int16 v49 = 2080;
    __int16 v50 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v51 = 1024;
    int v52 = 5749;
    goto LABEL_51;
  }
  if (![v12 count])
  {
    if (__osLog) {
      int v36 = __osLog;
    }
    else {
      int v36 = v7;
    }
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_DWORD *)stat buf = 136316162;
    uint64_t v46 = "users.count";
    __int16 v47 = 2048;
    *(void *)__int16 v48 = 0;
    *(_WORD *)&v48[8] = 2080;
    *(void *)&v48[10] = &unk_22004A573;
    __int16 v49 = 2080;
    __int16 v50 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v51 = 1024;
    int v52 = 5750;
LABEL_51:
    _os_log_impl(&dword_21FFF3000, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_52:
    int v13 = 0;
    int v31 = 261;
    goto LABEL_36;
  }
  uint64_t v37 = self;
  id v38 = a4;
  int v13 = [MEMORY[0x263EFF9A0] dictionary];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v39 = v12;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v14);
        }
        __int16 v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v19, "uid"));
        id v21 = v6;
        int v22 = [v6 containsObject:v20];

        if (v22)
        {
          id v23 = objc_alloc(MEMORY[0x263F08C38]);
          char v24 = [v19 alternateDSID];
          os_log_type_t v25 = (void *)[v23 initWithUUIDString:v24];

          if (!v25)
          {
            id v7 = &_os_log_internal;
            if (__osLog) {
              __int16 v32 = __osLog;
            }
            else {
              __int16 v32 = &_os_log_internal;
            }
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)stat buf = 136316162;
              uint64_t v46 = "uuid";
              __int16 v47 = 2048;
              *(void *)__int16 v48 = 0;
              *(_WORD *)&v48[8] = 2080;
              *(void *)&v48[10] = &unk_22004A573;
              __int16 v49 = 2080;
              __int16 v50 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              __int16 v51 = 1024;
              int v52 = 5757;
              _os_log_impl(&dword_21FFF3000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }

            int v31 = 261;
            long long v12 = v39;
            id v6 = v21;
            goto LABEL_36;
          }
          __int16 v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v19, "uid"));
          [v13 setObject:v25 forKey:v26];
        }
        id v6 = v21;
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  if (!BYTE2(v37->_userAccountsInfo.currentAccountUserID)) {
    [(BiometricKitXPCServer *)v37 cacheAndSetUserAccountsInfo];
  }
  id v7 = &_os_log_internal;
  if (v38) {
    *id v38 = v13;
  }
  uint64_t v27 = [v13 count];
  long long v12 = v39;
  if (v27 == [v6 count])
  {
    if (__osLogTrace) {
      unsigned int v28 = __osLogTrace;
    }
    else {
      unsigned int v28 = v7;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = v28;
      __int16 v30 = [v6 componentsJoinedByString:@","];
      *(_DWORD *)stat buf = 138412802;
      uint64_t v46 = v30;
      __int16 v47 = 1024;
      *(_DWORD *)__int16 v48 = 0;
      *(_WORD *)&v48[4] = 2112;
      *(void *)&v48[6] = v13;
      _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_DEBUG, "getUserUUIDsForUIDs(%@): -> %d, userUUIDs = %@\n", buf, 0x1Cu);
    }
    int v31 = 0;
    goto LABEL_40;
  }
  int v31 = 0;
LABEL_36:
  if (__osLogTrace) {
    id v7 = __osLogTrace;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __int16 v33 = v7;
    int v34 = [v6 componentsJoinedByString:@","];
    *(_DWORD *)stat buf = 138412802;
    uint64_t v46 = v34;
    __int16 v47 = 1024;
    *(_DWORD *)__int16 v48 = v31;
    *(_WORD *)&v48[4] = 2112;
    *(void *)&v48[6] = v13;
    _os_log_impl(&dword_21FFF3000, v33, OS_LOG_TYPE_ERROR, "getUserUUIDsForUIDs(%@): -> %d, userUUIDs = %@\n", buf, 0x1Cu);
  }
LABEL_40:

  return v31;
}

- (int)getUserUUIDForUID:(unsigned int)a3 userUUID:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = &_os_log_internal;
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109120;
    *(_DWORD *)char v24 = v5;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "getUserUUIDForUID: %d\n", buf, 8u);
  }
  uint64_t v9 = [NSNumber numberWithUnsignedInt:v5];
  id v10 = (void *)v9;
  if (v5 == -1)
  {
    if (__osLog) {
      __int16 v19 = __osLog;
    }
    else {
      __int16 v19 = v7;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)char v24 = "userID != 4294967295U";
      *(_WORD *)&v24[8] = 2048;
      *(void *)os_log_type_t v25 = 0;
      *(_WORD *)&v25[8] = 2080;
      __int16 v26 = &unk_22004A573;
      __int16 v27 = 2080;
      unsigned int v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v29 = 1024;
      int v30 = 5797;
      _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v13 = 0;
    int v12 = 258;
  }
  else
  {
    uint64_t v22 = v9;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    id v21 = 0;
    int v12 = [(BiometricKitXPCServer *)self getUserUUIDsForUIDs:v11 userUUIDs:&v21];
    id v13 = v21;

    if (v12)
    {
      if (__osLog) {
        id v20 = __osLog;
      }
      else {
        id v20 = v7;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        *(void *)char v24 = "err == 0 ";
        *(_WORD *)&v24[8] = 2048;
        *(void *)os_log_type_t v25 = v12;
        *(_WORD *)&v25[8] = 2080;
        __int16 v26 = &unk_22004A573;
        __int16 v27 = 2080;
        unsigned int v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v29 = 1024;
        int v30 = 5800;
        _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      id v14 = [v13 objectForKeyedSubscript:v10];
      uint64_t v15 = v14;
      if (a4) {
        *a4 = v14;
      }
      if (v15)
      {
        if (__osLogTrace) {
          uint64_t v16 = __osLogTrace;
        }
        else {
          uint64_t v16 = v7;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)stat buf = 67109634;
          *(_DWORD *)char v24 = v5;
          *(_WORD *)&v24[4] = 1024;
          *(_DWORD *)&v24[6] = 0;
          *(_WORD *)os_log_type_t v25 = 2112;
          *(void *)&v25[2] = v15;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_DEBUG, "getUserUUIDForUID(%d): -> %d, userUUID = %@\n", buf, 0x18u);
        }
        int v12 = 0;
        goto LABEL_24;
      }
      int v12 = 0;
    }
  }
  if (__osLogTrace) {
    uint64_t v17 = __osLogTrace;
  }
  else {
    uint64_t v17 = v7;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 67109634;
    *(_DWORD *)char v24 = v5;
    *(_WORD *)&v24[4] = 1024;
    *(_DWORD *)&v24[6] = v12;
    strcpy(v25, "@\b");
    v25[3] = 0;
    *(_WORD *)&v25[4] = 0;
    *(_DWORD *)&v25[6] = 0;
    _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "getUserUUIDForUID(%d): -> %d, userUUID = %@\n", buf, 0x18u);
  }
  uint64_t v15 = 0;
LABEL_24:

  return v12;
}

- (id)getUserKeybagUUIDForUID:(unsigned int)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v4 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v5 = __osLogTrace;
  }
  else {
    uint64_t v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 67109120;
    LODWORD(v12) = a3;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEBUG, "getUserKeybagUUIDForUID: %d\n", (uint8_t *)&v11, 8u);
  }
  long long v21 = 0uLL;
  int bag_uuid = aks_get_bag_uuid(-a3, &v21);
  if (bag_uuid != -536870160)
  {
    int v7 = bag_uuid;
    if (!bag_uuid)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v21];
      goto LABEL_9;
    }
    if (__osLog) {
      id v10 = __osLog;
    }
    else {
      id v10 = v4;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136316162;
      int v12 = "err == 0 ";
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      __int16 v15 = 2080;
      uint64_t v16 = &unk_22004A573;
      __int16 v17 = 2080;
      id v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v19 = 1024;
      int v20 = 5830;
      _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
    }
  }
  id v8 = 0;
LABEL_9:
  return v8;
}

- (void)userListDidUpdate
{
  if (__osLog) {
    uint64_t v3 = __osLog;
  }
  else {
    uint64_t v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEFAULT, "userListDidUpdate\n", v5, 2u);
  }
  int v4 = (void *)MEMORY[0x223C64ED0]();
  [(BiometricKitXPCServer *)self cacheAndSetUserAccountsInfo];
  self->_userListChangeDetected = 1;
  [(BiometricKitXPCServer *)self validateAllUsers];
}

- (void)validateUsersKeybagUUIDs
{
  uint64_t v3 = &_os_log_internal;
  if (__osLogTrace) {
    int v4 = __osLogTrace;
  }
  else {
    int v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "validateUsersKeybagUUIDs\n", buf, 2u);
  }
  *(void *)stat buf = 0;
  int v11 = buf;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v5 = self->_catacombUserUUIDs;
  objc_sync_enter(v5);
  id v6 = [NSDictionary dictionaryWithDictionary:self->_catacombUserUUIDs];
  objc_sync_exit(v5);

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__BiometricKitXPCServer_validateUsersKeybagUUIDs__block_invoke;
  v9[3] = &unk_26454E458;
  v9[4] = self;
  v9[5] = buf;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  if (v11[24])
  {
    [(BiometricKitXPCServer *)self saveCatacomb];
    [(BiometricKitXPCServer *)self syncTemplateListForUser:0xFFFFFFFFLL];
  }
  if (__osLogTrace) {
    int v7 = __osLogTrace;
  }
  else {
    int v7 = v3;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_DEBUG, "validateUsersKeybagUUIDs -> void\n", v8, 2u);
  }
  _Block_object_dispose(buf, 8);
}

void __49__BiometricKitXPCServer_validateUsersKeybagUUIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "getUserKeybagUUIDForUID:", objc_msgSend(v7, "unsignedIntValue"));
  if (v9 && ([v8 isEqual:v9] & 1) == 0)
  {
    if (__osLog) {
      id v10 = __osLog;
    }
    else {
      id v10 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = v10;
      v12[0] = 67109634;
      v12[1] = [v7 unsignedIntValue];
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEFAULT, "validateUsersKeybagUUIDs: removing user %u because of invalid user keybag UUID (real:%@ vs catacomb:%@)\n", (uint8_t *)v12, 0x1Cu);
    }
    objc_msgSend(*(id *)(a1 + 32), "removeUser:", objc_msgSend(v7, "unsignedIntValue"));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (int)updateIdentity:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = (char *)a3;
  id v9 = a4;
  id v10 = (char *)a5;
  int v11 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v12 = __osLogTrace;
  }
  else {
    uint64_t v12 = &_os_log_internal;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 134218754;
    __int16 v26 = v8;
    __int16 v27 = 2114;
    unsigned int v28 = v8;
    __int16 v29 = 2048;
    int v30 = v9;
    __int16 v31 = 2112;
    __int16 v32 = v10;
    _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_DEFAULT, "updateIdentity:withOptions:withClient: %p(%{public}@) %p %@\n", (uint8_t *)&v25, 0x2Au);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (isEphemeralMultiUser())
  {
    if (__osLog) {
      uint64_t v22 = __osLog;
    }
    else {
      uint64_t v22 = v11;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    int v25 = 136316162;
    __int16 v26 = "!isEphemeralMultiUser()";
    __int16 v27 = 2048;
    unsigned int v28 = 0;
    __int16 v29 = 2080;
    int v30 = &unk_22004A573;
    __int16 v31 = 2080;
    __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v33 = 1024;
    int v34 = 5968;
    goto LABEL_36;
  }
  if ([(BiometricKitXPCServer *)self isFingerprintModificationRestricted])
  {
    if (__osLog) {
      uint64_t v22 = __osLog;
    }
    else {
      uint64_t v22 = v11;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    int v25 = 136316162;
    __int16 v26 = "![self isFingerprintModificationRestricted]";
    __int16 v27 = 2048;
    unsigned int v28 = 0;
    __int16 v29 = 2080;
    int v30 = &unk_22004A573;
    __int16 v31 = 2080;
    __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v33 = 1024;
    int v34 = 5969;
LABEL_36:
    _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
LABEL_37:
    int v17 = 257;
    goto LABEL_14;
  }
  [(BiometricKitXPCServer *)self validateAllUsers];
  uint64_t v13 = [v8 userID];
  uint64_t v14 = [v8 uuid];
  __int16 v15 = [(BiometricKitXPCServer *)self getIdentityObjectByUserID:v13 UUID:v14];

  if (v15)
  {
    objc_msgSend(v15, "setAttribute:", objc_msgSend(v8, "attribute"));
    objc_msgSend(v15, "setEntity:", objc_msgSend(v8, "entity"));
    id v16 = [v8 name];
    [v15 setName:v16];

    int v17 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", [v8 userID]);
    if (v17)
    {
      if (__osLog) {
        char v24 = __osLog;
      }
      else {
        char v24 = v11;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = 136316162;
        __int16 v26 = "err == 0 ";
        __int16 v27 = 2048;
        unsigned int v28 = (char *)v17;
        __int16 v29 = 2080;
        int v30 = &unk_22004A573;
        __int16 v31 = 2080;
        __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v33 = 1024;
        int v34 = 5983;
        _os_log_impl(&dword_21FFF3000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
      }
    }
    else
    {
      [(BiometricKitXPCServer *)self saveCatacombForIdentity:v15];
    }
  }
  else
  {
    if (__osLog) {
      id v23 = __osLog;
    }
    else {
      id v23 = v11;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136316162;
      __int16 v26 = "obj";
      __int16 v27 = 2048;
      unsigned int v28 = 0;
      __int16 v29 = 2080;
      int v30 = &unk_22004A573;
      __int16 v31 = 2080;
      __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v33 = 1024;
      int v34 = 5975;
      _os_log_impl(&dword_21FFF3000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
    }
    int v17 = 258;
  }
LABEL_14:
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (__osLogTrace) {
    id v18 = __osLogTrace;
  }
  else {
    id v18 = v11;
  }
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v25 = 67109120;
      LODWORD(v26) = v17;
      __int16 v19 = v18;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
LABEL_24:
      _os_log_impl(&dword_21FFF3000, v19, v20, "updateIdentity:withOptions:withClient: -> %d\n", (uint8_t *)&v25, 8u);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 67109120;
    LODWORD(v26) = 0;
    __int16 v19 = v18;
    os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
    goto LABEL_24;
  }

  return v17;
}

- (int)removeIdentity:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = (char *)a3;
  id v9 = a4;
  id v10 = (char *)a5;
  int v11 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v12 = __osLogTrace;
  }
  else {
    uint64_t v12 = &_os_log_internal;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134218754;
    int v25 = v8;
    __int16 v26 = 2114;
    __int16 v27 = v8;
    __int16 v28 = 2048;
    __int16 v29 = v9;
    __int16 v30 = 2112;
    __int16 v31 = v10;
    _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_DEFAULT, "removeIdentity:withOptions:withClient: %p(%{public}@) %p %@\n", (uint8_t *)&v24, 0x2Au);
  }
  v34[0] = 0;
  v34[1] = 0;
  int v35 = 0;
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (isEphemeralMultiUser())
  {
    if (__osLog) {
      long long v21 = __osLog;
    }
    else {
      long long v21 = v11;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    int v24 = 136316162;
    int v25 = "!isEphemeralMultiUser()";
    __int16 v26 = 2048;
    __int16 v27 = 0;
    __int16 v28 = 2080;
    __int16 v29 = &unk_22004A573;
    __int16 v30 = 2080;
    __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v32 = 1024;
    int v33 = 6010;
    goto LABEL_37;
  }
  if ([(BiometricKitXPCServer *)self isFingerprintModificationRestricted])
  {
    if (__osLog) {
      long long v21 = __osLog;
    }
    else {
      long long v21 = v11;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    int v24 = 136316162;
    int v25 = "![self isFingerprintModificationRestricted]";
    __int16 v26 = 2048;
    __int16 v27 = 0;
    __int16 v28 = 2080;
    __int16 v29 = &unk_22004A573;
    __int16 v30 = 2080;
    __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v32 = 1024;
    int v33 = 6011;
LABEL_37:
    _os_log_impl(&dword_21FFF3000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
LABEL_38:
    int v16 = 257;
    goto LABEL_15;
  }
  if (!v8)
  {
    if (__osLog) {
      uint64_t v22 = __osLog;
    }
    else {
      uint64_t v22 = v11;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136316162;
      int v25 = "identity";
      __int16 v26 = 2048;
      __int16 v27 = 0;
      __int16 v28 = 2080;
      __int16 v29 = &unk_22004A573;
      __int16 v30 = 2080;
      __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v32 = 1024;
      int v33 = 6012;
      _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    }
    int v16 = 258;
    goto LABEL_15;
  }
  [(BiometricKitXPCServer *)self validateAllUsers];
  int v13 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", [v8 userID]);
  if (v13)
  {
    int v16 = v13;
    if (__osLog) {
      id v23 = __osLog;
    }
    else {
      id v23 = v11;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v24 = 136316162;
    int v25 = "err == 0 ";
    __int16 v26 = 2048;
    __int16 v27 = (char *)v16;
    __int16 v28 = 2080;
    __int16 v29 = &unk_22004A573;
    __int16 v30 = 2080;
    __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v32 = 1024;
    int v33 = 6019;
LABEL_60:
    _os_log_impl(&dword_21FFF3000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    goto LABEL_15;
  }
  LODWORD(v34[0]) = [v8 userID];
  uint64_t v14 = [v8 uuid];
  [v14 getUUIDBytes:(char *)v34 + 4];

  int v15 = [(BiometricKitXPCServer *)self performRemoveIdentityCommand:v34];
  if (v15)
  {
    int v16 = v15;
    if (__osLog) {
      id v23 = __osLog;
    }
    else {
      id v23 = v11;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v24 = 136316162;
    int v25 = "err == 0 ";
    __int16 v26 = 2048;
    __int16 v27 = (char *)v16;
    __int16 v28 = 2080;
    __int16 v29 = &unk_22004A573;
    __int16 v30 = 2080;
    __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v32 = 1024;
    int v33 = 6025;
    goto LABEL_60;
  }
  [(BiometricKitXPCServer *)self removeIdentityObject:v8];
  int v16 = [(BiometricKitXPCServer *)self saveCatacomb];
  if (!v16)
  {
    [(BiometricKitXPCServer *)self updateEnrollmentChangedNotification:1];
    goto LABEL_15;
  }
  if (__osLog) {
    id v23 = __osLog;
  }
  else {
    id v23 = v11;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    int v24 = 136316162;
    int v25 = "err == 0 ";
    __int16 v26 = 2048;
    __int16 v27 = (char *)v16;
    __int16 v28 = 2080;
    __int16 v29 = &unk_22004A573;
    __int16 v30 = 2080;
    __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v32 = 1024;
    int v33 = 6032;
    goto LABEL_60;
  }
LABEL_15:
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (__osLogTrace) {
    int v17 = __osLogTrace;
  }
  else {
    int v17 = v11;
  }
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v24 = 67109120;
      LODWORD(v25) = v16;
      id v18 = v17;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
LABEL_25:
      _os_log_impl(&dword_21FFF3000, v18, v19, "removeIdentity:withOptions:withClient: -> %d\n", (uint8_t *)&v24, 8u);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 67109120;
    LODWORD(v25) = 0;
    id v18 = v17;
    os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
    goto LABEL_25;
  }

  return v16;
}

- (int)removeAllIdentitiesForUser:(unsigned int)a3 withOptions:(id)a4 withClient:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = &_os_log_internal;
  if (__osLogTrace) {
    int v11 = __osLogTrace;
  }
  else {
    int v11 = &_os_log_internal;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = v6;
    *(_WORD *)&uint8_t buf[8] = 2048;
    *(void *)&buf[10] = v8;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v9;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEFAULT, "removeAllIdentitiesForUser:withOptions:withClient: %d %p %@\n", buf, 0x1Cu);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (isEphemeralMultiUser())
  {
    if (__osLog) {
      __int16 v29 = __osLog;
    }
    else {
      __int16 v29 = v10;
    }
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_DWORD *)stat buf = 136316162;
    *(void *)&uint8_t buf[4] = "!isEphemeralMultiUser()";
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = 0;
    *(_WORD *)&unsigned char buf[22] = 2080;
    *(void *)&buf[24] = &unk_22004A573;
    __int16 v40 = 2080;
    long long v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v42 = 1024;
    int v43 = 6060;
    goto LABEL_54;
  }
  if ([(BiometricKitXPCServer *)self isFingerprintModificationRestricted])
  {
    if (__osLog) {
      __int16 v29 = __osLog;
    }
    else {
      __int16 v29 = v10;
    }
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_DWORD *)stat buf = 136316162;
    *(void *)&uint8_t buf[4] = "![self isFingerprintModificationRestricted]";
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = 0;
    *(_WORD *)&unsigned char buf[22] = 2080;
    *(void *)&buf[24] = &unk_22004A573;
    __int16 v40 = 2080;
    long long v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v42 = 1024;
    int v43 = 6061;
LABEL_54:
    _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_55:
    int v23 = 257;
    goto LABEL_32;
  }
  [(BiometricKitXPCServer *)self validateAllUsers];
  int v12 = [(BiometricKitXPCServer *)self checkCatacombForUser:v6];
  if (v12)
  {
    int v23 = v12;
    if (__osLog) {
      __int16 v30 = __osLog;
    }
    else {
      __int16 v30 = v10;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)&uint8_t buf[4] = "err == 0 ";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v23;
      *(_WORD *)&unsigned char buf[22] = 2080;
      *(void *)&buf[24] = &unk_22004A573;
      __int16 v40 = 2080;
      long long v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v42 = 1024;
      int v43 = 6068;
LABEL_61:
      _os_log_impl(&dword_21FFF3000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    int v13 = [(BiometricKitXPCServer *)self identities];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      id v31 = v9;
      id v16 = v8;
      char v17 = 0;
      uint64_t v18 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v13);
          }
          os_log_type_t v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if ([v20 userID] == v6)
          {
            v36[0] = 0;
            v36[1] = 0;
            int v37 = 0;
            LODWORD(v36[0]) = [v20 userID];
            long long v21 = [v20 uuid];
            [v21 getUUIDBytes:(char *)v36 + 4];

            int v22 = [(BiometricKitXPCServer *)self performRemoveIdentityCommand:v36];
            if (v22)
            {
              int v23 = v22;
              id v10 = &_os_log_internal;
              if (__osLog) {
                int v24 = __osLog;
              }
              else {
                int v24 = &_os_log_internal;
              }
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)stat buf = 136316162;
                *(void *)&uint8_t buf[4] = "err == 0 ";
                *(_WORD *)&unsigned char buf[12] = 2048;
                *(void *)&buf[14] = v23;
                *(_WORD *)&unsigned char buf[22] = 2080;
                *(void *)&buf[24] = &unk_22004A573;
                __int16 v40 = 2080;
                long long v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                __int16 v42 = 1024;
                int v43 = 6080;
                _os_log_impl(&dword_21FFF3000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }

              id v8 = v16;
              id v9 = v31;
              goto LABEL_32;
            }
            [(BiometricKitXPCServer *)self removeIdentityObject:v20];
            char v17 = 1;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v38 count:16];
        if (v15) {
          continue;
        }
        break;
      }

      if ((v17 & 1) == 0)
      {
        int v23 = 0;
        id v8 = v16;
        id v9 = v31;
        id v10 = &_os_log_internal;
        goto LABEL_32;
      }
      int v23 = [(BiometricKitXPCServer *)self saveCatacomb];
      id v8 = v16;
      id v10 = &_os_log_internal;
      if (!v23)
      {
        [(BiometricKitXPCServer *)self updateEnrollmentChangedNotification:1];
        id v9 = v31;
        goto LABEL_32;
      }
      if (__osLog) {
        __int16 v30 = __osLog;
      }
      else {
        __int16 v30 = &_os_log_internal;
      }
      id v9 = v31;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        *(void *)&uint8_t buf[4] = "err == 0 ";
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v23;
        *(_WORD *)&unsigned char buf[22] = 2080;
        *(void *)&buf[24] = &unk_22004A573;
        __int16 v40 = 2080;
        long long v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v42 = 1024;
        int v43 = 6092;
        goto LABEL_61;
      }
    }
    else
    {

      int v23 = 0;
    }
  }
LABEL_32:
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (__osLogTrace) {
    int v25 = __osLogTrace;
  }
  else {
    int v25 = v10;
  }
  if (v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v23;
      __int16 v26 = v25;
      os_log_type_t v27 = OS_LOG_TYPE_ERROR;
LABEL_42:
      _os_log_impl(&dword_21FFF3000, v26, v27, "removeAllIdentitiesForUser:withOptions:withClient: -> %d\n", buf, 8u);
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(void *)stat buf = 67109120;
    __int16 v26 = v25;
    os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
    goto LABEL_42;
  }

  return v23;
}

- (id)getIdentityFromUUID:(id)a3 withClient:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v18 = a4;
  if (__osLogTrace) {
    id v7 = __osLogTrace;
  }
  else {
    id v7 = &_os_log_internal;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 134218498;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v18;
    _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_DEBUG, "getIdentityFromUUID:withClient: %p(%@) %@\n", buf, 0x20u);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  [(BiometricKitXPCServer *)self validateAllUsers];
  id v8 = self->_ongoingBiometricOperation;
  objc_sync_enter(v8);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = self->_ongoingBiometricOperation;
  id v10 = (id)[(ActivityTracker *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        int v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = [v13 uuid];
        int v15 = [v14 isEqual:v6];

        if (v15)
        {
          id v10 = v13;
          goto LABEL_18;
        }
      }
      id v10 = (id)[(ActivityTracker *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  objc_sync_exit(v8);
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (__osLogTrace) {
    id v16 = __osLogTrace;
  }
  else {
    id v16 = &_os_log_internal;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 138543362;
    id v25 = v10;
    _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_DEFAULT, "getIdentityFromUUID:withClient: -> %{public}@\n", buf, 0xCu);
  }

  return v10;
}

- (id)identities:(id)a3 withClient:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = &_os_log_internal;
  if (__osLogTrace) {
    id v9 = __osLogTrace;
  }
  else {
    id v9 = &_os_log_internal;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134218498;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_DEBUG, "identities:withClient: %p(%@) %@\n", (uint8_t *)&v15, 0x20u);
  }
  [(BiometricKitXPCServer *)self validateAllUsers];
  if (BYTE2(self->_mkbLockStatusNtfToken))
  {
    id v10 = [MEMORY[0x263F2AA80] biometricKitIdentity];
    [v10 setUserID:501];
    [v10 setFlags:1];
    [MEMORY[0x263EFF980] arrayWithObject:v10];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263EFF980];
    id v10 = [(BiometricKitXPCServer *)self identities];
    [v11 arrayWithArray:v10];
  int v12 = };

  if (v6 && [(BiometricKitXPCServer *)self filterIdentities:v12 withFilter:v6]) {
    [v12 removeAllObjects];
  }
  if (__osLogTrace) {
    int v13 = __osLogTrace;
  }
  else {
    int v13 = v8;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v12;
    _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_DEFAULT, "identities:withClient: -> %@\n", (uint8_t *)&v15, 0xCu);
  }

  return v12;
}

- (int64_t)getMaxIdentityCount:(int)a3 withClient:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = &_os_log_internal;
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109378;
    *(_DWORD *)__int16 v17 = a3;
    *(_WORD *)&v17[4] = 2112;
    *(void *)&v17[6] = v6;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "getMaxIdentityCount:withClient: %d %@\n", buf, 0x12u);
  }
  unsigned int v15 = 0;
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  int v9 = [(BiometricKitXPCServer *)self performRequestMaxIdentityCountCommand:&v15];
  if (v9)
  {
    int v13 = v9;
    uint64_t v14 = (__osLog ? __osLog : v7);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)__int16 v17 = "err == 0 ";
      *(_WORD *)&v17[8] = 2048;
      *(void *)&v17[10] = v13;
      __int16 v18 = 2080;
      __int16 v19 = &unk_22004A573;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v22 = 1024;
      int v23 = 6190;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (__osLogTrace) {
    id v10 = __osLogTrace;
  }
  else {
    id v10 = v7;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109120;
    *(_DWORD *)__int16 v17 = v15;
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "getMaxIdentityCount:withClient: -> %u\n", buf, 8u);
  }
  int64_t v11 = v15;

  return v11;
}

- (int64_t)getFreeIdentityCount:(int)a3 forUser:(unsigned int)a4 withClient:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = &_os_log_internal;
  if (__osLogTrace) {
    id v10 = __osLogTrace;
  }
  else {
    id v10 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109634;
    *(_DWORD *)__int16 v19 = a3;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v5;
    *(_WORD *)__int16 v20 = 2112;
    *(void *)&v20[2] = v8;
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "getFreeIdentityCount:forUser:withClient: %d %d %@\n", buf, 0x18u);
  }
  unsigned int v17 = 0;
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  [(BiometricKitXPCServer *)self validateAllUsers];
  int v11 = [(BiometricKitXPCServer *)self performGetFreeIdentityCountCommand:v5 outCount:&v17];
  if (v11)
  {
    int v15 = v11;
    id v16 = (__osLog ? __osLog : v9);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)__int16 v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      *(void *)__int16 v20 = v15;
      *(_WORD *)&v20[8] = 2080;
      uint64_t v21 = &unk_22004A573;
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 6217;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (BYTE1(self->_mkbLockStatusNtfToken)) {
    kdebug_trace();
  }
  if (__osLogTrace) {
    int v12 = __osLogTrace;
  }
  else {
    int v12 = v9;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109120;
    *(_DWORD *)__int16 v19 = v17;
    _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_DEBUG, "getFreeIdentityCount:forUser:withClient: -> %u\n", buf, 8u);
  }
  int64_t v13 = v17;

  return v13;
}

- (id)getIdentitiesDatabaseUUIDForUser:(unsigned int)a3 withClient:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = &_os_log_internal;
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109378;
    *(_DWORD *)uint64_t v21 = v4;
    *(_WORD *)&v21[4] = 2112;
    *(void *)&v21[6] = v6;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "getIdentitiesDatabaseUUIDForUser:withClient: %d %@\n", buf, 0x12u);
  }
  [(BiometricKitXPCServer *)self validateAllUsers];
  if (v4 == -1 || ([(BKCatacomb *)self->_catacomb stateOfUserComponent:v4] & 1) == 0)
  {
    id v11 = 0;
    int v10 = 263;
LABEL_31:
    if (__osLogTrace) {
      __int16 v18 = __osLogTrace;
    }
    else {
      __int16 v18 = v7;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)stat buf = 138412546;
    *(void *)uint64_t v21 = v11;
    *(_WORD *)&v21[8] = 1024;
    *(_DWORD *)&unsigned char v21[10] = v10;
    int64_t v13 = v18;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    goto LABEL_15;
  }
  int v9 = [(BiometricKitXPCServer *)self checkCatacombForUser:v4];
  if (v9)
  {
    int v10 = v9;
    if (__osLog) {
      id v16 = __osLog;
    }
    else {
      id v16 = v7;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)uint64_t v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&unsigned char v21[10] = v10;
      __int16 v22 = 2080;
      int v23 = &unk_22004A573;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v26 = 1024;
      int v27 = 6246;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v11 = 0;
    goto LABEL_31;
  }
  id v19 = 0;
  int v10 = [(BiometricKitXPCServer *)self performGetCatacombUUIDCommand:v4 outUUID:&v19];
  id v11 = v19;
  if (v10)
  {
    if (__osLog) {
      unsigned int v17 = __osLog;
    }
    else {
      unsigned int v17 = v7;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)uint64_t v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&unsigned char v21[10] = v10;
      __int16 v22 = 2080;
      int v23 = &unk_22004A573;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v26 = 1024;
      int v27 = 6249;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_31;
  }
  [(BiometricKitXPCServer *)self logCatacombUUIDForUser:v4 catacombUUID:v11];
  if (__osLogTrace) {
    int v12 = __osLogTrace;
  }
  else {
    int v12 = v7;
  }
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_16;
  }
  *(_DWORD *)stat buf = 138412546;
  *(void *)uint64_t v21 = v11;
  *(_WORD *)&v21[8] = 1024;
  *(_DWORD *)&unsigned char v21[10] = 0;
  int64_t v13 = v12;
  os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
LABEL_15:
  _os_log_impl(&dword_21FFF3000, v13, v14, "getIdentitiesDatabaseUUIDForUser:withClient: -> %@ (%d)\n", buf, 0x12u);
LABEL_16:

  return v11;
}

- (id)getIdentitiesDatabaseHashForUser:(unsigned int)a3 withClient:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = &_os_log_internal;
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109378;
    *(_DWORD *)uint64_t v21 = v4;
    *(_WORD *)&v21[4] = 2112;
    *(void *)&v21[6] = v6;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "getIdentitiesDatabaseHashForUser:withClient: %d %@\n", buf, 0x12u);
  }
  [(BiometricKitXPCServer *)self validateAllUsers];
  if (v4 == -1 || ([(BKCatacomb *)self->_catacomb stateOfUserComponent:v4] & 1) == 0)
  {
    id v11 = 0;
    int v10 = 263;
LABEL_31:
    if (__osLogTrace) {
      __int16 v18 = __osLogTrace;
    }
    else {
      __int16 v18 = v7;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)stat buf = 138412546;
    *(void *)uint64_t v21 = v11;
    *(_WORD *)&v21[8] = 1024;
    *(_DWORD *)&unsigned char v21[10] = v10;
    int64_t v13 = v18;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    goto LABEL_15;
  }
  int v9 = [(BiometricKitXPCServer *)self checkCatacombForUser:v4];
  if (v9)
  {
    int v10 = v9;
    if (__osLog) {
      id v16 = __osLog;
    }
    else {
      id v16 = v7;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)uint64_t v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&unsigned char v21[10] = v10;
      __int16 v22 = 2080;
      int v23 = &unk_22004A573;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v26 = 1024;
      int v27 = 6278;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v11 = 0;
    goto LABEL_31;
  }
  id v19 = 0;
  int v10 = [(BiometricKitXPCServer *)self performGetCatacombHashCommand:v4 outHash:&v19];
  id v11 = v19;
  if (v10)
  {
    if (__osLog) {
      unsigned int v17 = __osLog;
    }
    else {
      unsigned int v17 = v7;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)uint64_t v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&unsigned char v21[10] = v10;
      __int16 v22 = 2080;
      int v23 = &unk_22004A573;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v26 = 1024;
      int v27 = 6281;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_31;
  }
  [(BiometricKitXPCServer *)self logCatacombHashForUser:v4 catacombHash:v11];
  if (__osLogTrace) {
    int v12 = __osLogTrace;
  }
  else {
    int v12 = v7;
  }
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_16;
  }
  *(_DWORD *)stat buf = 138412546;
  *(void *)uint64_t v21 = v11;
  *(_WORD *)&v21[8] = 1024;
  *(_DWORD *)&unsigned char v21[10] = 0;
  int64_t v13 = v12;
  os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
LABEL_15:
  _os_log_impl(&dword_21FFF3000, v13, v14, "getIdentitiesDatabaseHashForUser:withClient: -> %@ (%d)\n", buf, 0x12u);
LABEL_16:

  return v11;
}

- (int)dropUnlockTokenWithClient:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = (char *)a3;
  uint64_t v5 = &_os_log_internal;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412290;
    int v15 = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "dropUnlockTokenWithClient: %@\n", (uint8_t *)&v14, 0xCu);
  }
  int v7 = [(BiometricKitXPCServer *)self performDropUnlockTokenCommand];
  if (v7)
  {
    if (__osLog) {
      int v12 = __osLog;
    }
    else {
      int v12 = v5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136316162;
      int v15 = "err == 0 ";
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      id v19 = &unk_22004A573;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v22 = 1024;
      int v23 = 6302;
      _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
    }
    if (__osLogTrace) {
      int64_t v13 = __osLogTrace;
    }
    else {
      int64_t v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 67109120;
      LODWORD(v15) = v7;
      int v9 = v13;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace) {
      id v8 = __osLogTrace;
    }
    else {
      id v8 = v5;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 67109120;
      LODWORD(v15) = 0;
      int v9 = v8;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_21FFF3000, v9, v10, "dropUnlockTokenWithClient: -> %d\n", (uint8_t *)&v14, 8u);
    }
  }

  return v7;
}

- (int)forceBioLockoutForUser:(unsigned int)a3 withOptions:(id)a4 withClient:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  os_log_type_t v10 = &_os_log_internal;
  if (__osLogTrace) {
    id v11 = __osLogTrace;
  }
  else {
    id v11 = &_os_log_internal;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109634;
    *(_DWORD *)uint64_t v21 = v6;
    *(_WORD *)&v21[4] = 2048;
    *(void *)&v21[6] = v8;
    *(_WORD *)&v21[14] = 2112;
    *(void *)&v21[16] = v9;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "forceBioLockoutForUser:withOptions:withClient: %d %p %@\n", buf, 0x1Cu);
  }
  if (v8 && (char v19 = 0, (Bool = dictionaryGetBool()) != 0))
  {
    int v15 = Bool;
    if (__osLog) {
      uint64_t v17 = __osLog;
    }
    else {
      uint64_t v17 = v10;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)uint64_t v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&unsigned char v21[10] = v15;
      *(_WORD *)&unsigned char v21[18] = 2080;
      *(void *)&v21[20] = &unk_22004A573;
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 6325;
      goto LABEL_26;
    }
  }
  else
  {
    int v13 = [(BiometricKitXPCServer *)self performForceBioLockoutCommand:v6];
    if (!v13)
    {
      if (__osLogTrace) {
        int v14 = __osLogTrace;
      }
      else {
        int v14 = v10;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)stat buf = 67109120;
        *(_DWORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_DEBUG, "forceBioLockoutForUser:withClient: -> %d\n", buf, 8u);
      }
      int v15 = 0;
      goto LABEL_15;
    }
    int v15 = v13;
    if (__osLog) {
      uint64_t v17 = __osLog;
    }
    else {
      uint64_t v17 = v10;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)uint64_t v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&unsigned char v21[10] = v15;
      *(_WORD *)&unsigned char v21[18] = 2080;
      *(void *)&v21[20] = &unk_22004A573;
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v24 = 1024;
      int v25 = 6338;
LABEL_26:
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (__osLogTrace) {
    __int16 v18 = __osLogTrace;
  }
  else {
    __int16 v18 = v10;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 67109120;
    *(_DWORD *)uint64_t v21 = v15;
    _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "forceBioLockoutForUser:withClient: -> %d\n", buf, 8u);
  }
LABEL_15:

  return v15;
}

- (int)getBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = &_os_log_internal;
  if (__osLogTrace) {
    os_log_type_t v10 = __osLogTrace;
  }
  else {
    os_log_type_t v10 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109378;
    *(_DWORD *)__int16 v22 = v5;
    *(_WORD *)&v22[4] = 2112;
    *(void *)&v22[6] = v8;
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "getBioLockoutState:forUser:withClient: %d %@\n", buf, 0x12u);
  }
  unsigned int v20 = 0;
  if (a3)
  {
    int v11 = [(BiometricKitXPCServer *)self performGetSKSLockStateCommand:v5 outState:&v20];
    if (!v11)
    {
      BOOL v12 = [(BiometricKitXPCServer *)self hasMultipleUserAccounts];
      unsigned int v13 = v20;
      if (!v12)
      {
        unsigned int v13 = v20 & 0xFFFFFFBF;
        v20 &= ~0x40u;
      }
      *a3 = v13;
      if (__osLogTrace) {
        int v14 = __osLogTrace;
      }
      else {
        int v14 = v9;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)stat buf = 134218240;
        *(void *)__int16 v22 = v20;
        *(_WORD *)&v22[8] = 1024;
        *(_DWORD *)&v22[10] = 0;
        _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_DEBUG, "getBioLockoutState:forUser:withClient: -> %ld (%d)\n", buf, 0x12u);
      }
      int v15 = 0;
      goto LABEL_16;
    }
    int v15 = v11;
    if (__osLog) {
      __int16 v18 = __osLog;
    }
    else {
      __int16 v18 = v9;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)__int16 v22 = "err == 0 ";
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = v15;
      __int16 v23 = 2080;
      __int16 v24 = &unk_22004A573;
      __int16 v25 = 2080;
      uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v27 = 1024;
      int v28 = 6378;
      _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v17 = __osLog;
    }
    else {
      uint64_t v17 = v9;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)__int16 v22 = "state";
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = 0;
      __int16 v23 = 2080;
      __int16 v24 = &unk_22004A573;
      __int16 v25 = 2080;
      uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v27 = 1024;
      int v28 = 6368;
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v15 = 258;
  }
  if (__osLogTrace) {
    char v19 = __osLogTrace;
  }
  else {
    char v19 = v9;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 134218240;
    *(void *)__int16 v22 = v20;
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)&v22[10] = v15;
    _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "getBioLockoutState:forUser:withClient: -> %ld (%d)\n", buf, 0x12u);
  }
LABEL_16:

  return v15;
}

- (int)getExpressModeState:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = &_os_log_internal;
  if (__osLogTrace) {
    os_log_type_t v10 = __osLogTrace;
  }
  else {
    os_log_type_t v10 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109378;
    *(_DWORD *)uint64_t v30 = v5;
    *(_WORD *)&uint8_t v30[4] = 2112;
    *(void *)&v30[6] = v8;
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "getExpressModeState:forUser:withClient: %d %@\n", buf, 0x12u);
  }
  if (a3)
  {
    int v11 = [(BiometricKitXPCServer *)self identitiesOfUser:v5];
    if (v11)
    {
      BOOL v12 = v11;
      if (![v11 count])
      {
        int64_t v15 = 0;
LABEL_19:
        *a3 = v15;
        if (__osLogTrace) {
          unsigned int v20 = __osLogTrace;
        }
        else {
          unsigned int v20 = v9;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)stat buf = 134218240;
          *(void *)uint64_t v30 = v15;
          *(_WORD *)&v30[8] = 1024;
          *(_DWORD *)&v30[10] = 0;
          _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_DEBUG, "getExpressModeState:forUser:withClient: -> %ld (%d)\n", buf, 0x12u);
        }
        int v21 = 0;
        goto LABEL_25;
      }
      uint64_t v28 = 0;
      unsigned int v13 = [(BiometricKitXPCServer *)self getProtectedConfigurationForUser:v5 withClient:v8];
      if (v13)
      {
        int v14 = [(BiometricKitXPCServer *)self getBioLockoutState:&v28 forUser:v5 withClient:v8];
        if (!v14)
        {
          int64_t v15 = (v28 & 0x16) != 0;
          __int16 v16 = [v13 objectForKeyedSubscript:@"BKUserCfgEffectiveTouchIDApplePayEnabled"];
          if ([v16 BOOLValue])
          {
          }
          else
          {
            uint64_t v17 = [v13 objectForKeyedSubscript:@"BKUserCfgEffectiveTouchIDUnlockEnabled"];
            int v18 = [v17 BOOLValue];

            if (!v18)
            {
LABEL_18:

              goto LABEL_19;
            }
          }
          uint64_t v19 = 4;
          if ((v28 & 0x208) == 0) {
            uint64_t v19 = 6;
          }
          v15 |= v19;
          goto LABEL_18;
        }
        int v21 = v14;
        if (__osLog) {
          uint64_t v26 = __osLog;
        }
        else {
          uint64_t v26 = v9;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 136316162;
          *(void *)uint64_t v30 = "err == 0 ";
          *(_WORD *)&v30[8] = 2048;
          *(void *)&v30[10] = v21;
          __int16 v31 = 2080;
          long long v32 = &unk_22004A573;
          __int16 v33 = 2080;
          long long v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v35 = 1024;
          int v36 = 6427;
          _os_log_impl(&dword_21FFF3000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else
      {
        if (__osLog) {
          __int16 v25 = __osLog;
        }
        else {
          __int16 v25 = v9;
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 136316162;
          *(void *)uint64_t v30 = "configuration";
          *(_WORD *)&v30[8] = 2048;
          *(void *)&v30[10] = 0;
          __int16 v31 = 2080;
          long long v32 = &unk_22004A573;
          __int16 v33 = 2080;
          long long v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v35 = 1024;
          int v36 = 6424;
          _os_log_impl(&dword_21FFF3000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        int v21 = 261;
      }
    }
    else
    {
      if (__osLog) {
        __int16 v24 = __osLog;
      }
      else {
        __int16 v24 = v9;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        *(void *)uint64_t v30 = "identities";
        *(_WORD *)&v30[8] = 2048;
        *(void *)&v30[10] = 0;
        __int16 v31 = 2080;
        long long v32 = &unk_22004A573;
        __int16 v33 = 2080;
        long long v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v35 = 1024;
        int v36 = 6417;
        _os_log_impl(&dword_21FFF3000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      BOOL v12 = 0;
      int v21 = 261;
    }
  }
  else
  {
    if (__osLog) {
      __int16 v23 = __osLog;
    }
    else {
      __int16 v23 = v9;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)uint64_t v30 = "state";
      *(_WORD *)&v30[8] = 2048;
      *(void *)&v30[10] = 0;
      __int16 v31 = 2080;
      long long v32 = &unk_22004A573;
      __int16 v33 = 2080;
      long long v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v35 = 1024;
      int v36 = 6414;
      _os_log_impl(&dword_21FFF3000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    BOOL v12 = 0;
    int v21 = 258;
  }
  if (__osLogTrace) {
    __int16 v27 = __osLogTrace;
  }
  else {
    __int16 v27 = v9;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 134218240;
    *(void *)uint64_t v30 = 0;
    *(_WORD *)&v30[8] = 1024;
    *(_DWORD *)&v30[10] = v21;
    _os_log_impl(&dword_21FFF3000, v27, OS_LOG_TYPE_ERROR, "getExpressModeState:forUser:withClient: -> %ld (%d)\n", buf, 0x12u);
  }
LABEL_25:

  return v21;
}

- (int)getBiometryAvailability:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = &_os_log_internal;
  if (__osLogTrace) {
    id v9 = __osLogTrace;
  }
  else {
    id v9 = &_os_log_internal;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134218498;
    int v18 = a3;
    __int16 v19 = 1024;
    *(_DWORD *)unsigned int v20 = a4;
    *(_WORD *)&v20[4] = 2112;
    *(void *)&v20[6] = v7;
    _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_DEBUG, "getBiometryAvailability:forUser:withClient: %p %d %@\n", (uint8_t *)&v17, 0x1Cu);
  }
  if (a3)
  {
    int64_t v10 = 3;
    if (a4 == 501) {
      int64_t v10 = 1;
    }
    *a3 = v10;
    if (__osLogTrace) {
      int v11 = __osLogTrace;
    }
    else {
      int v11 = v8;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int64_t v12 = *a3;
      int v17 = 134218240;
      int v18 = (int64_t *)v12;
      __int16 v19 = 1024;
      *(_DWORD *)unsigned int v20 = 0;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "getBiometryAvailability: -> %ld (%d)\n", (uint8_t *)&v17, 0x12u);
    }
    int v13 = 0;
  }
  else
  {
    if (__osLog) {
      int64_t v15 = __osLog;
    }
    else {
      int64_t v15 = v8;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316162;
      int v18 = (int64_t *)"info";
      __int16 v19 = 2048;
      *(void *)unsigned int v20 = 0;
      *(_WORD *)&v20[8] = 2080;
      *(void *)&unsigned char v20[10] = &unk_22004A573;
      __int16 v21 = 2080;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v23 = 1024;
      int v24 = 6466;
      _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    if (__osLogTrace) {
      __int16 v16 = __osLogTrace;
    }
    else {
      __int16 v16 = v8;
    }
    int v13 = 258;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 134218240;
      int v18 = 0;
      __int16 v19 = 1024;
      *(_DWORD *)unsigned int v20 = 258;
      _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "getBiometryAvailability: -> %ld (%d)\n", (uint8_t *)&v17, 0x12u);
    }
  }

  return v13;
}

- (BOOL)isXARTAvailableWithClient:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (__osLogTrace) {
    uint64_t v4 = __osLogTrace;
  }
  else {
    uint64_t v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "isXARTAvailableWithClient: %@\n", (uint8_t *)&v6, 0xCu);
  }

  return 1;
}

- (int)getLastMatchEvent:(id *)a3 withClient:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 134218242;
    unsigned int v20 = (const char *)a3;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "getLastMatchEvent:withClient: %p %@\n", buf, 0x16u);
  }
  if (a3)
  {
    memset(v18, 0, 29);
    int v9 = [(BiometricKitXPCServer *)self performGetLastMatchEventCommand:v18];
    if (!v9)
    {
      *a3 = [(BiometricKitXPCServer *)self createMatchEventDictionary:v18];
      if (__osLogTrace) {
        int64_t v10 = __osLogTrace;
      }
      else {
        int64_t v10 = v7;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v11 = (const char *)*a3;
        *(_DWORD *)stat buf = 138412546;
        unsigned int v20 = v11;
        __int16 v21 = 1024;
        LODWORD(v22) = 0;
        _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "getLastMatchEvent:withClient: -> %@ %d\n", buf, 0x12u);
      }
      int v12 = 0;
      goto LABEL_14;
    }
    int v12 = v9;
    if (__osLog) {
      int64_t v15 = __osLog;
    }
    else {
      int64_t v15 = v7;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      unsigned int v20 = "err == 0 ";
      __int16 v21 = 2048;
      id v22 = (id)v12;
      __int16 v23 = 2080;
      int v24 = &unk_22004A573;
      __int16 v25 = 2080;
      uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v27 = 1024;
      int v28 = 6549;
      _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      int v14 = __osLog;
    }
    else {
      int v14 = v7;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      unsigned int v20 = "matchEventDict";
      __int16 v21 = 2048;
      id v22 = 0;
      __int16 v23 = 2080;
      int v24 = &unk_22004A573;
      __int16 v25 = 2080;
      uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v27 = 1024;
      int v28 = 6542;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    int v12 = 258;
  }
  if (__osLogTrace) {
    __int16 v16 = __osLogTrace;
  }
  else {
    __int16 v16 = v7;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      int v17 = (const char *)*a3;
    }
    else {
      int v17 = 0;
    }
    *(_DWORD *)stat buf = 138412546;
    unsigned int v20 = v17;
    __int16 v21 = 1024;
    LODWORD(v22) = v12;
    _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "getLastMatchEvent:withClient: -> %@ %d\n", buf, 0x12u);
  }
LABEL_14:

  return v12;
}

- (int)getDeviceHardwareState:(unsigned int *)a3 withClient:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134218242;
    *(void *)__int16 v19 = a3;
    *(_WORD *)&v19[8] = 2112;
    id v20 = v6;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "getDeviceHardwareState:withClient: %p %@\n", (uint8_t *)&v18, 0x16u);
  }
  if (a3)
  {
    int v9 = [(BiometricKitXPCServer *)self performGetDeviceHardwareStateCommand:a3];
    if (!v9)
    {
      if (__osLogTrace) {
        int64_t v10 = __osLogTrace;
      }
      else {
        int64_t v10 = v7;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v11 = *a3;
        int v18 = 67109376;
        *(_DWORD *)__int16 v19 = v11;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = 0;
        _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "getDeviceHardwareState:withClient: -> %d %d\n", (uint8_t *)&v18, 0xEu);
      }
      int v12 = 0;
      goto LABEL_14;
    }
    int v12 = v9;
    if (__osLog) {
      int64_t v15 = __osLog;
    }
    else {
      int64_t v15 = v7;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      *(void *)__int16 v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      id v20 = (id)v12;
      __int16 v21 = 2080;
      id v22 = &unk_22004A573;
      __int16 v23 = 2080;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v25 = 1024;
      int v26 = 6581;
      _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
  }
  else
  {
    if (__osLog) {
      int v14 = __osLog;
    }
    else {
      int v14 = v7;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      *(void *)__int16 v19 = "hardwareState";
      *(_WORD *)&v19[8] = 2048;
      id v20 = 0;
      __int16 v21 = 2080;
      id v22 = &unk_22004A573;
      __int16 v23 = 2080;
      int v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v25 = 1024;
      int v26 = 6578;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    int v12 = 258;
  }
  if (__osLogTrace) {
    __int16 v16 = __osLogTrace;
  }
  else {
    __int16 v16 = v7;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      unsigned int v17 = *a3;
    }
    else {
      unsigned int v17 = 0;
    }
    int v18 = 67109376;
    *(_DWORD *)__int16 v19 = v17;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v12;
    _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_ERROR, "getDeviceHardwareState:withClient: -> %d %d\n", (uint8_t *)&v18, 0xEu);
  }
LABEL_14:

  return v12;
}

- (id)getSystemProtectedConfigurationWithClient:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v4 = (char *)a3;
  uint64_t v5 = &_os_log_internal;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138412290;
    __int16 v25 = v4;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "getSystemProtectedConfigurationWithClient: %@\n", buf, 0xCu);
  }
  id v23 = 0;
  int v7 = [(BiometricKitXPCServer *)self performGetSystemProtectedConfigCommand:&v23];
  id v8 = v23;
  if (v7)
  {
    if (__osLog) {
      id v20 = __osLog;
    }
    else {
      id v20 = v5;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      __int16 v25 = "err == 0 ";
      __int16 v26 = 2048;
      uint64_t v27 = v7;
      __int16 v28 = 2080;
      uint64_t v29 = &unk_22004A573;
      __int16 v30 = 2080;
      __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v32 = 1024;
      int v33 = 6675;
      _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace) {
      __int16 v21 = __osLogTrace;
    }
    else {
      __int16 v21 = v5;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138412546;
      __int16 v25 = 0;
      __int16 v26 = 1024;
      LODWORD(v27) = v7;
      _os_log_impl(&dword_21FFF3000, v21, OS_LOG_TYPE_ERROR, "getSystemProtectedConfigurationWithClient: -> %@ (%d)\n", buf, 0x12u);
    }
    int v9 = 0;
  }
  else
  {
    int v9 = [MEMORY[0x263EFF9A0] dictionary];
    if (v9)
    {
      if ([v8 biometryEnabled] != -1)
      {
        int64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "biometryEnabled") != 0);
        [v9 setObject:v10 forKeyedSubscript:@"BKSysCfgTouchIDEnabled"];
      }
      if ([v8 unlockEnabled] != -1)
      {
        unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "unlockEnabled") != 0);
        [v9 setObject:v11 forKeyedSubscript:@"BKSysCfgTouchIDUnlockEnabled"];
      }
      if ([v8 identificationEnabled] != -1)
      {
        int v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "identificationEnabled") != 0);
        [v9 setObject:v12 forKeyedSubscript:@"BKSysCfgTouchIDIdentificationEnabled"];
      }
      if ([v8 loginEnabled] != -1)
      {
        int v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "loginEnabled") != 0);
        [v9 setObject:v13 forKeyedSubscript:@"BKSysCfgTouchIDLoginEnabled"];
      }
      if (([v8 unlockTokenMaxLifetime] & 0x80000000) == 0)
      {
        int v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "unlockTokenMaxLifetime"));
        [v9 setObject:v14 forKeyedSubscript:@"BKSysCfgTouchIDUnlockTokenMaxLifetime"];
      }
      if (([v8 bioMatchLifespan] & 0x80000000) == 0)
      {
        int64_t v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "bioMatchLifespan"));
        [v9 setObject:v15 forKeyedSubscript:@"BKSysCfgTouchIDBioMatchLifespan"];
      }
      if (([v8 passcodeInputLifespan] & 0x80000000) == 0)
      {
        __int16 v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "passcodeInputLifespan"));
        [v9 setObject:v16 forKeyedSubscript:@"BKSysCfgTouchIDPasscodeInputLifespan"];
      }
      if (([v8 periocularMatchEnabled] & 0x80000000) == 0)
      {
        unsigned int v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "periocularMatchEnabled"));
        [v9 setObject:v17 forKeyedSubscript:@"BKSysCfgPeriocularMatchEnabled"];
      }
    }
    else
    {
      if (__osLog) {
        id v22 = __osLog;
      }
      else {
        id v22 = v5;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        __int16 v25 = "dict";
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        uint64_t v29 = &unk_22004A573;
        __int16 v30 = 2080;
        __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v32 = 1024;
        int v33 = 6678;
        _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    if (__osLogTrace) {
      int v18 = __osLogTrace;
    }
    else {
      int v18 = v5;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)stat buf = 138412546;
      __int16 v25 = (const char *)v9;
      __int16 v26 = 1024;
      LODWORD(v27) = 0;
      _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_DEBUG, "getSystemProtectedConfigurationWithClient: -> %@ (%d)\n", buf, 0x12u);
    }
  }

  return v9;
}

- (int)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 withOptions:(id)a5 withClient:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v66 = *MEMORY[0x263EF8340];
  int64_t v10 = (char *)a3;
  id v56 = a5;
  id v11 = a6;
  if (__osLogTrace) {
    int v12 = __osLogTrace;
  }
  else {
    int v12 = &_os_log_internal;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138413058;
    long long v59 = v10;
    __int16 v60 = 1024;
    *(_DWORD *)long long v61 = v8;
    *(_WORD *)&v61[4] = 2048;
    *(void *)&v61[6] = v56;
    *(_WORD *)&v61[14] = 2112;
    *(void *)&v61[16] = v11;
    _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_DEBUG, "setProtectedConfiguration:forUser:withOptions:withClient: %@ %d %p %@\n", buf, 0x26u);
  }
  uint64_t v65 = 0;
  memset(v64, 0, sizeof(v64));
  id v55 = v11;
  if (isEphemeralMultiUser())
  {
    __int16 v30 = &_os_log_internal;
    if (__osLog) {
      long long v41 = __osLog;
    }
    else {
      long long v41 = &_os_log_internal;
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      long long v59 = "!isEphemeralMultiUser()";
      __int16 v60 = 2048;
      *(void *)long long v61 = 0;
      *(_WORD *)&v61[8] = 2080;
      *(void *)&v61[10] = &unk_22004A573;
      *(_WORD *)&v61[18] = 2080;
      *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
      __int16 v62 = 1024;
      int v63 = 6734;
      _os_log_impl(&dword_21FFF3000, v41, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v27 = 0;
    int64_t v15 = 0;
    id v23 = 0;
    id v22 = 0;
    __int16 v21 = 0;
    id v20 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    int v26 = 257;
    goto LABEL_134;
  }
  int v13 = [(BiometricKitXPCServer *)self isValidUser:v8];
  if (v13)
  {
    int v26 = v13;
    __int16 v30 = &_os_log_internal;
    if (__osLog) {
      __int16 v42 = __osLog;
    }
    else {
      __int16 v42 = &_os_log_internal;
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      long long v59 = "err == 0 ";
      __int16 v60 = 2048;
      *(void *)long long v61 = v26;
      *(_WORD *)&v61[8] = 2080;
      *(void *)&v61[10] = &unk_22004A573;
      *(_WORD *)&v61[18] = 2080;
      *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
      __int16 v62 = 1024;
      int v63 = 6738;
      _os_log_impl(&dword_21FFF3000, v42, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v27 = 0;
    int64_t v15 = 0;
    id v23 = 0;
    id v22 = 0;
    __int16 v21 = 0;
    id v20 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    goto LABEL_134;
  }
  int v14 = objc_alloc_init(UserProtectedConfig);
  if (!v14)
  {
    __int16 v30 = &_os_log_internal;
    if (__osLog) {
      int v43 = __osLog;
    }
    else {
      int v43 = &_os_log_internal;
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      long long v59 = "cfg";
      __int16 v60 = 2048;
      *(void *)long long v61 = 0;
      *(_WORD *)&v61[8] = 2080;
      *(void *)&v61[10] = &unk_22004A573;
      *(_WORD *)&v61[18] = 2080;
      *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
      __int16 v62 = 1024;
      int v63 = 6741;
      _os_log_impl(&dword_21FFF3000, v43, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v27 = 0;
    int64_t v15 = 0;
    id v23 = 0;
    id v22 = 0;
    __int16 v21 = 0;
    id v20 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    int v26 = 261;
    goto LABEL_134;
  }
  int64_t v15 = v14;
  uint64_t v16 = [v10 objectForKeyedSubscript:@"BKUserCfgTouchIDUnlockEnabled"];
  uint64_t v54 = (void *)v16;
  if (v16)
  {
    unsigned int v17 = (void *)v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v30 = &_os_log_internal;
      if (__osLog) {
        uint64_t v46 = __osLog;
      }
      else {
        uint64_t v46 = &_os_log_internal;
      }
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        long long v59 = "[enabledForUnlock isKindOfClass:[NSNumber class]]";
        __int16 v60 = 2048;
        *(void *)long long v61 = 0;
        *(_WORD *)&v61[8] = 2080;
        *(void *)&v61[10] = &unk_22004A573;
        *(_WORD *)&v61[18] = 2080;
        *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
        __int16 v62 = 1024;
        int v63 = 6746;
        _os_log_impl(&dword_21FFF3000, v46, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v27 = 0;
      id v23 = 0;
      id v22 = 0;
      __int16 v21 = 0;
      id v20 = 0;
      uint64_t v53 = 0;
      goto LABEL_133;
    }
    -[UserProtectedConfig setUnlockEnabled:](v15, "setUnlockEnabled:", [v17 BOOLValue]);
  }
  uint64_t v18 = [v10 objectForKeyedSubscript:@"BKUserCfgTouchIDIdentificationEnabled"];
  uint64_t v53 = (void *)v18;
  if (v18)
  {
    __int16 v19 = (void *)v18;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v30 = &_os_log_internal;
      if (__osLog) {
        __int16 v47 = __osLog;
      }
      else {
        __int16 v47 = &_os_log_internal;
      }
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        long long v59 = "[enabledForIdentification isKindOfClass:[NSNumber class]]";
        __int16 v60 = 2048;
        *(void *)long long v61 = 0;
        *(_WORD *)&v61[8] = 2080;
        *(void *)&v61[10] = &unk_22004A573;
        *(_WORD *)&v61[18] = 2080;
        *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
        __int16 v62 = 1024;
        int v63 = 6753;
        _os_log_impl(&dword_21FFF3000, v47, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v27 = 0;
      id v23 = 0;
      id v22 = 0;
      __int16 v21 = 0;
      id v20 = 0;
      goto LABEL_133;
    }
    -[UserProtectedConfig setIdentificationEnabled:](v15, "setIdentificationEnabled:", [v19 BOOLValue]);
  }
  id v20 = [v10 objectForKeyedSubscript:@"BKUserCfgTouchIDLoginEnabled"];
  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v30 = &_os_log_internal;
      if (__osLog) {
        __int16 v48 = __osLog;
      }
      else {
        __int16 v48 = &_os_log_internal;
      }
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        long long v59 = "[enabledForLogin isKindOfClass:[NSNumber class]]";
        __int16 v60 = 2048;
        *(void *)long long v61 = 0;
        *(_WORD *)&v61[8] = 2080;
        *(void *)&v61[10] = &unk_22004A573;
        *(_WORD *)&v61[18] = 2080;
        *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
        __int16 v62 = 1024;
        int v63 = 6760;
        _os_log_impl(&dword_21FFF3000, v48, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v27 = 0;
      id v23 = 0;
      id v22 = 0;
      __int16 v21 = 0;
      goto LABEL_133;
    }
    -[UserProtectedConfig setLoginEnabled:](v15, "setLoginEnabled:", [v20 BOOLValue]);
  }
  __int16 v21 = [v10 objectForKeyedSubscript:@"BKUserCfgTouchIDApplePayEnabled"];
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v30 = &_os_log_internal;
      if (__osLog) {
        __int16 v49 = __osLog;
      }
      else {
        __int16 v49 = &_os_log_internal;
      }
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        long long v59 = "[enabledForApplePay isKindOfClass:[NSNumber class]]";
        __int16 v60 = 2048;
        *(void *)long long v61 = 0;
        *(_WORD *)&v61[8] = 2080;
        *(void *)&v61[10] = &unk_22004A573;
        *(_WORD *)&v61[18] = 2080;
        *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
        __int16 v62 = 1024;
        int v63 = 6767;
        _os_log_impl(&dword_21FFF3000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v27 = 0;
      id v23 = 0;
      id v22 = 0;
      goto LABEL_133;
    }
    -[UserProtectedConfig setApplePayEnabled:](v15, "setApplePayEnabled:", [v21 BOOLValue]);
  }
  id v22 = [v10 objectForKeyedSubscript:@"BKUserCfgAttentionDetectionEnabled"];
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v30 = &_os_log_internal;
      if (__osLog) {
        __int16 v50 = __osLog;
      }
      else {
        __int16 v50 = &_os_log_internal;
      }
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        long long v59 = "[enabledForAttentionDetection isKindOfClass:[NSNumber class]]";
        __int16 v60 = 2048;
        *(void *)long long v61 = 0;
        *(_WORD *)&v61[8] = 2080;
        *(void *)&v61[10] = &unk_22004A573;
        *(_WORD *)&v61[18] = 2080;
        *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
        __int16 v62 = 1024;
        int v63 = 6774;
        _os_log_impl(&dword_21FFF3000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v27 = 0;
      id v23 = 0;
      goto LABEL_133;
    }
    -[UserProtectedConfig setAttentionDetectionEnabled:](v15, "setAttentionDetectionEnabled:", [v22 BOOLValue]);
  }
  id v23 = [v10 objectForKeyedSubscript:@"BKUserCfgPeriocularMatchEnabled"];
  if (!v23) {
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v30 = &_os_log_internal;
    if (__osLog) {
      __int16 v51 = __osLog;
    }
    else {
      __int16 v51 = &_os_log_internal;
    }
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      long long v59 = "[enabledForPeriocularMatch isKindOfClass:[NSNumber class]]";
      __int16 v60 = 2048;
      *(void *)long long v61 = 0;
      *(_WORD *)&v61[8] = 2080;
      *(void *)&v61[10] = &unk_22004A573;
      *(_WORD *)&v61[18] = 2080;
      *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
      __int16 v62 = 1024;
      int v63 = 6782;
      _os_log_impl(&dword_21FFF3000, v51, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v27 = 0;
LABEL_133:
    int v26 = 258;
    goto LABEL_134;
  }
  -[UserProtectedConfig setPeriocularMatchEnabled:](v15, "setPeriocularMatchEnabled:", [v23 BOOLValue]);
LABEL_27:
  int v24 = [(BiometricKitXPCServer *)self parseAuthDict:v56 toAuthData:v64];
  if (v24)
  {
    int v26 = v24;
    __int16 v30 = &_os_log_internal;
    if (__osLog) {
      uint64_t v44 = __osLog;
    }
    else {
      uint64_t v44 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      goto LABEL_80;
    }
    *(_DWORD *)stat buf = 136316162;
    long long v59 = "err == 0 ";
    __int16 v60 = 2048;
    *(void *)long long v61 = v26;
    *(_WORD *)&v61[8] = 2080;
    *(void *)&v61[10] = &unk_22004A573;
    *(_WORD *)&v61[18] = 2080;
    *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v62 = 1024;
    int v63 = 6788;
    goto LABEL_79;
  }
  int v25 = [(BiometricKitXPCServer *)self checkCatacombForUser:v8];
  if (v25)
  {
    int v26 = v25;
    __int16 v30 = &_os_log_internal;
    if (__osLog) {
      uint64_t v44 = __osLog;
    }
    else {
      uint64_t v44 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      goto LABEL_80;
    }
    *(_DWORD *)stat buf = 136316162;
    long long v59 = "err == 0 ";
    __int16 v60 = 2048;
    *(void *)long long v61 = v26;
    *(_WORD *)&v61[8] = 2080;
    *(void *)&v61[10] = &unk_22004A573;
    *(_WORD *)&v61[18] = 2080;
    *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v62 = 1024;
    int v63 = 6792;
LABEL_79:
    _os_log_impl(&dword_21FFF3000, v44, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_80:
    id v27 = 0;
    goto LABEL_134;
  }
  id v57 = 0;
  int v26 = [(BiometricKitXPCServer *)self performGetProtectedConfigCommand:v8 outSetCfg:&v57 outEffectiveCfg:0];
  id v27 = v57;
  if (v26)
  {
    __int16 v30 = &_os_log_internal;
    if (__osLog) {
      uint64_t v45 = __osLog;
    }
    else {
      uint64_t v45 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_134;
    }
    *(_DWORD *)stat buf = 136316162;
    long long v59 = "err == 0 ";
    __int16 v60 = 2048;
    *(void *)long long v61 = v26;
    *(_WORD *)&v61[8] = 2080;
    *(void *)&v61[10] = &unk_22004A573;
    *(_WORD *)&v61[18] = 2080;
    *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v62 = 1024;
    int v63 = 6796;
LABEL_96:
    _os_log_impl(&dword_21FFF3000, v45, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_134;
  }
  int v28 = [(BiometricKitXPCServer *)self performSetProtectedConfigCommand:v8 cfg:v15 authData:v64];
  if (v28)
  {
    int v26 = v28;
    __int16 v30 = &_os_log_internal;
    if (__osLog) {
      uint64_t v45 = __osLog;
    }
    else {
      uint64_t v45 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_134;
    }
    *(_DWORD *)stat buf = 136316162;
    long long v59 = "err == 0 ";
    __int16 v60 = 2048;
    *(void *)long long v61 = v26;
    *(_WORD *)&v61[8] = 2080;
    *(void *)&v61[10] = &unk_22004A573;
    *(_WORD *)&v61[18] = 2080;
    *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v62 = 1024;
    int v63 = 6800;
    goto LABEL_96;
  }
  int v29 = [(UserProtectedConfig *)v15 unlockEnabled];
  __int16 v30 = &_os_log_internal;
  if ((v29 == -1
     || (int v31 = [(UserProtectedConfig *)v15 unlockEnabled],
         v31 == [v27 unlockEnabled]))
    && ([(UserProtectedConfig *)v15 identificationEnabled] == -1
     || (int v32 = [(UserProtectedConfig *)v15 identificationEnabled],
         v32 == [v27 identificationEnabled]))
    && ([(UserProtectedConfig *)v15 loginEnabled] == -1
     || (int v33 = [(UserProtectedConfig *)v15 loginEnabled],
         v33 == [v27 loginEnabled]))
    && ([(UserProtectedConfig *)v15 applePayEnabled] == -1
     || (int v34 = [(UserProtectedConfig *)v15 applePayEnabled],
         v34 == [v27 applePayEnabled]))
    && ([(UserProtectedConfig *)v15 attentionDetectionEnabled] == -1
     || (int v35 = [(UserProtectedConfig *)v15 attentionDetectionEnabled],
         v35 == [v27 attentionDetectionEnabled]))
    && ([(UserProtectedConfig *)v15 periocularMatchEnabled] == -1
     || (int v36 = [(UserProtectedConfig *)v15 periocularMatchEnabled],
         v36 == [v27 periocularMatchEnabled]))
    || (int v37 = [(BiometricKitXPCServer *)self saveCatacomb]) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.BiometricKit.userProtectedConfigUpdated", 0, 0, 1u);
    [(BiometricKitXPCServer *)self updateExpressModeState];
    if (__osLogTrace) {
      id v39 = __osLogTrace;
    }
    else {
      id v39 = v30;
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v59) = 0;
      _os_log_impl(&dword_21FFF3000, v39, OS_LOG_TYPE_DEBUG, "setProtectedConfiguration:forUser:withOptions:withClient: -> %d\n", buf, 8u);
    }
    int v26 = 0;
    goto LABEL_50;
  }
  int v26 = v37;
  if (__osLog) {
    uint64_t v45 = __osLog;
  }
  else {
    uint64_t v45 = v30;
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 136316162;
    long long v59 = "err == 0 ";
    __int16 v60 = 2048;
    *(void *)long long v61 = v26;
    *(_WORD *)&v61[8] = 2080;
    *(void *)&v61[10] = &unk_22004A573;
    *(_WORD *)&v61[18] = 2080;
    *(void *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v62 = 1024;
    int v63 = 6815;
    goto LABEL_96;
  }
LABEL_134:
  if (__osLogTrace) {
    int v52 = __osLogTrace;
  }
  else {
    int v52 = v30;
  }
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v59) = v26;
    _os_log_impl(&dword_21FFF3000, v52, OS_LOG_TYPE_ERROR, "setProtectedConfiguration:forUser:withOptions:withClient: -> %d\n", buf, 8u);
  }
LABEL_50:

  return v26;
}

- (int)setSystemProtectedConfiguration:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t v8 = (char *)a3;
  id v9 = a4;
  id v10 = a5;
  if (__osLogTrace) {
    id v11 = __osLogTrace;
  }
  else {
    id v11 = &_os_log_internal;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138412802;
    uint64_t v66 = v8;
    __int16 v67 = 2048;
    id v68 = v9;
    __int16 v69 = 2112;
    uint64_t v70 = v10;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "setSystemProtectedConfiguration:withOptions:withClient: %@ %p %@\n", buf, 0x20u);
  }
  uint64_t v76 = 0;
  memset(v75, 0, sizeof(v75));
  __int16 v62 = v10;
  int v63 = v9;
  if (isEphemeralMultiUser())
  {
    if (__osLog) {
      __int16 v47 = __osLog;
    }
    else {
      __int16 v47 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_92;
    }
    *(_DWORD *)stat buf = 136316162;
    uint64_t v66 = "!isEphemeralMultiUser()";
    __int16 v67 = 2048;
    id v68 = 0;
    __int16 v69 = 2080;
    uint64_t v70 = &unk_22004A573;
    __int16 v71 = 2080;
    __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v73 = 1024;
    int v74 = 6858;
    goto LABEL_91;
  }
  if (!v8)
  {
    if (__osLog) {
      __int16 v48 = __osLog;
    }
    else {
      __int16 v48 = &_os_log_internal;
    }
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      uint64_t v66 = "configuration";
      __int16 v67 = 2048;
      id v68 = 0;
      __int16 v69 = 2080;
      uint64_t v70 = &unk_22004A573;
      __int16 v71 = 2080;
      __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v73 = 1024;
      int v74 = 6859;
      _os_log_impl(&dword_21FFF3000, v48, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v30 = 0;
    uint64_t v16 = 0;
    id v27 = 0;
    int v26 = 0;
    int v25 = 0;
    int v24 = 0;
    id v23 = 0;
    long long v59 = 0;
    __int16 v60 = 0;
    long long v61 = 0;
    goto LABEL_163;
  }
  int v12 = [v10 exportedObject];
  int v13 = [v12 connection];
  int v14 = [v13 effectiveUserIdentifier];

  if (v14)
  {
    if (__osLog) {
      __int16 v47 = __osLog;
    }
    else {
      __int16 v47 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_92;
    }
    *(_DWORD *)stat buf = 136316162;
    uint64_t v66 = "userid == 0";
    __int16 v67 = 2048;
    id v68 = 0;
    __int16 v69 = 2080;
    uint64_t v70 = &unk_22004A573;
    __int16 v71 = 2080;
    __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v73 = 1024;
    int v74 = 6862;
LABEL_91:
    _os_log_impl(&dword_21FFF3000, v47, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_92:
    id v30 = 0;
    uint64_t v16 = 0;
    id v27 = 0;
    int v26 = 0;
    int v25 = 0;
    int v24 = 0;
    id v23 = 0;
    long long v59 = 0;
    __int16 v60 = 0;
    long long v61 = 0;
    int v29 = 257;
    goto LABEL_60;
  }
  int64_t v15 = objc_alloc_init(SystemProtectedConfig);
  if (!v15)
  {
    if (__osLog) {
      __int16 v49 = __osLog;
    }
    else {
      __int16 v49 = &_os_log_internal;
    }
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      uint64_t v66 = "cfg";
      __int16 v67 = 2048;
      id v68 = 0;
      __int16 v69 = 2080;
      uint64_t v70 = &unk_22004A573;
      __int16 v71 = 2080;
      __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v73 = 1024;
      int v74 = 6865;
      _os_log_impl(&dword_21FFF3000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v30 = 0;
    uint64_t v16 = 0;
    id v27 = 0;
    int v26 = 0;
    int v25 = 0;
    int v24 = 0;
    id v23 = 0;
    long long v59 = 0;
    __int16 v60 = 0;
    long long v61 = 0;
    int v29 = 261;
    goto LABEL_60;
  }
  uint64_t v16 = v15;
  uint64_t v17 = [v8 objectForKeyedSubscript:@"BKSysCfgTouchIDEnabled"];
  long long v61 = (void *)v17;
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog) {
        __int16 v51 = __osLog;
      }
      else {
        __int16 v51 = &_os_log_internal;
      }
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        uint64_t v66 = "[enabledBiometry isKindOfClass:[NSNumber class]]";
        __int16 v67 = 2048;
        id v68 = 0;
        __int16 v69 = 2080;
        uint64_t v70 = &unk_22004A573;
        __int16 v71 = 2080;
        __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v73 = 1024;
        int v74 = 6870;
        _os_log_impl(&dword_21FFF3000, v51, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v30 = 0;
      id v27 = 0;
      int v26 = 0;
      int v25 = 0;
      int v24 = 0;
      id v23 = 0;
      long long v59 = 0;
      __int16 v60 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setBiometryEnabled:](v16, "setBiometryEnabled:", [v18 BOOLValue]);
  }
  uint64_t v19 = [v8 objectForKeyedSubscript:@"BKSysCfgTouchIDUnlockEnabled"];
  __int16 v60 = (void *)v19;
  if (v19)
  {
    id v20 = (void *)v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog) {
        int v52 = __osLog;
      }
      else {
        int v52 = &_os_log_internal;
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        uint64_t v66 = "[enabledForUnlock isKindOfClass:[NSNumber class]]";
        __int16 v67 = 2048;
        id v68 = 0;
        __int16 v69 = 2080;
        uint64_t v70 = &unk_22004A573;
        __int16 v71 = 2080;
        __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v73 = 1024;
        int v74 = 6877;
        _os_log_impl(&dword_21FFF3000, v52, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v30 = 0;
      id v27 = 0;
      int v26 = 0;
      int v25 = 0;
      int v24 = 0;
      id v23 = 0;
      long long v59 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setUnlockEnabled:](v16, "setUnlockEnabled:", [v20 BOOLValue]);
  }
  uint64_t v21 = [v8 objectForKeyedSubscript:@"BKSysCfgTouchIDIdentificationEnabled"];
  long long v59 = (void *)v21;
  if (v21)
  {
    id v22 = (void *)v21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog) {
        uint64_t v53 = __osLog;
      }
      else {
        uint64_t v53 = &_os_log_internal;
      }
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        uint64_t v66 = "[enabledForIdentification isKindOfClass:[NSNumber class]]";
        __int16 v67 = 2048;
        id v68 = 0;
        __int16 v69 = 2080;
        uint64_t v70 = &unk_22004A573;
        __int16 v71 = 2080;
        __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v73 = 1024;
        int v74 = 6884;
        _os_log_impl(&dword_21FFF3000, v53, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v30 = 0;
      id v27 = 0;
      int v26 = 0;
      int v25 = 0;
      int v24 = 0;
      id v23 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setIdentificationEnabled:](v16, "setIdentificationEnabled:", objc_msgSend(v22, "BOOLValue", v59, v60, v61, v10, v9));
  }
  id v23 = objc_msgSend(v8, "objectForKeyedSubscript:", @"BKSysCfgTouchIDLoginEnabled", v59);
  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog) {
        uint64_t v54 = __osLog;
      }
      else {
        uint64_t v54 = &_os_log_internal;
      }
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        uint64_t v66 = "[enabledForLogin isKindOfClass:[NSNumber class]]";
        __int16 v67 = 2048;
        id v68 = 0;
        __int16 v69 = 2080;
        uint64_t v70 = &unk_22004A573;
        __int16 v71 = 2080;
        __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v73 = 1024;
        int v74 = 6891;
        _os_log_impl(&dword_21FFF3000, v54, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v30 = 0;
      id v27 = 0;
      int v26 = 0;
      int v25 = 0;
      int v24 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setLoginEnabled:](v16, "setLoginEnabled:", [v23 BOOLValue]);
  }
  int v24 = [v8 objectForKeyedSubscript:@"BKSysCfgTouchIDUnlockTokenMaxLifetime"];
  if (v24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog) {
        id v55 = __osLog;
      }
      else {
        id v55 = &_os_log_internal;
      }
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        uint64_t v66 = "[bioTokenLifespan isKindOfClass:[NSNumber class]]";
        __int16 v67 = 2048;
        id v68 = 0;
        __int16 v69 = 2080;
        uint64_t v70 = &unk_22004A573;
        __int16 v71 = 2080;
        __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v73 = 1024;
        int v74 = 6897;
        _os_log_impl(&dword_21FFF3000, v55, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v30 = 0;
      id v27 = 0;
      int v26 = 0;
      int v25 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setUnlockTokenMaxLifetime:](v16, "setUnlockTokenMaxLifetime:", [v24 intValue]);
  }
  int v25 = [v8 objectForKeyedSubscript:@"BKSysCfgTouchIDBioMatchLifespan"];
  if (v25)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog) {
        id v56 = __osLog;
      }
      else {
        id v56 = &_os_log_internal;
      }
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        uint64_t v66 = "[bioMatchLifespan isKindOfClass:[NSNumber class]]";
        __int16 v67 = 2048;
        id v68 = 0;
        __int16 v69 = 2080;
        uint64_t v70 = &unk_22004A573;
        __int16 v71 = 2080;
        __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v73 = 1024;
        int v74 = 6903;
        _os_log_impl(&dword_21FFF3000, v56, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v30 = 0;
      id v27 = 0;
      int v26 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setBioMatchLifespan:](v16, "setBioMatchLifespan:", [v25 intValue]);
  }
  int v26 = [v8 objectForKeyedSubscript:@"BKSysCfgTouchIDPasscodeInputLifespan"];
  if (v26)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog) {
        id v57 = __osLog;
      }
      else {
        id v57 = &_os_log_internal;
      }
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        uint64_t v66 = "[passcodeInputLifespan isKindOfClass:[NSNumber class]]";
        __int16 v67 = 2048;
        id v68 = 0;
        __int16 v69 = 2080;
        uint64_t v70 = &unk_22004A573;
        __int16 v71 = 2080;
        __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v73 = 1024;
        int v74 = 6909;
        _os_log_impl(&dword_21FFF3000, v57, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v30 = 0;
      id v27 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setPasscodeInputLifespan:](v16, "setPasscodeInputLifespan:", [v26 intValue]);
  }
  id v27 = [v8 objectForKeyedSubscript:@"BKSysCfgPeriocularMatchEnabled"];
  if (!v27) {
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (__osLog) {
      long long v58 = __osLog;
    }
    else {
      long long v58 = &_os_log_internal;
    }
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      uint64_t v66 = "[enabledForPeriocularMatch isKindOfClass:[NSNumber class]]";
      __int16 v67 = 2048;
      id v68 = 0;
      __int16 v69 = 2080;
      uint64_t v70 = &unk_22004A573;
      __int16 v71 = 2080;
      __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v73 = 1024;
      int v74 = 6917;
      _os_log_impl(&dword_21FFF3000, v58, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v30 = 0;
LABEL_163:
    int v29 = 258;
    goto LABEL_60;
  }
  -[SystemProtectedConfig setPeriocularMatchEnabled:](v16, "setPeriocularMatchEnabled:", [v27 BOOLValue]);
LABEL_34:
  int v28 = [(BiometricKitXPCServer *)self parseAuthDict:v9 toAuthData:v75];
  if (v28)
  {
    int v29 = v28;
    if (__osLog) {
      __int16 v50 = __osLog;
    }
    else {
      __int16 v50 = &_os_log_internal;
    }
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      uint64_t v66 = "err == 0 ";
      __int16 v67 = 2048;
      id v68 = (id)v29;
      __int16 v69 = 2080;
      uint64_t v70 = &unk_22004A573;
      __int16 v71 = 2080;
      __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v73 = 1024;
      int v74 = 6923;
      _os_log_impl(&dword_21FFF3000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v30 = 0;
    goto LABEL_60;
  }
  id v64 = 0;
  int v29 = [(BiometricKitXPCServer *)self performGetSystemProtectedConfigCommand:&v64];
  id v30 = v64;
  if (v29)
  {
    if (__osLog) {
      long long v41 = __osLog;
    }
    else {
      long long v41 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_60;
    }
    *(_DWORD *)stat buf = 136316162;
    uint64_t v66 = "err == 0 ";
    __int16 v67 = 2048;
    id v68 = (id)v29;
    __int16 v69 = 2080;
    uint64_t v70 = &unk_22004A573;
    __int16 v71 = 2080;
    __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v73 = 1024;
    int v74 = 6927;
LABEL_59:
    _os_log_impl(&dword_21FFF3000, v41, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_60:
    if (__osLogTrace) {
      __int16 v42 = __osLogTrace;
    }
    else {
      __int16 v42 = &_os_log_internal;
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v66) = v29;
      _os_log_impl(&dword_21FFF3000, v42, OS_LOG_TYPE_ERROR, "setSystemProtectedConfiguration:withOptions:withClient: -> %d\n", buf, 8u);
    }
    goto LABEL_74;
  }
  int v31 = [(BiometricKitXPCServer *)self performSetSystemProtectedConfigCommand:v16 authData:v75];
  if (v31)
  {
    int v29 = v31;
    if (__osLog) {
      long long v41 = __osLog;
    }
    else {
      long long v41 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_60;
    }
    *(_DWORD *)stat buf = 136316162;
    uint64_t v66 = "err == 0 ";
    __int16 v67 = 2048;
    id v68 = (id)v29;
    __int16 v69 = 2080;
    uint64_t v70 = &unk_22004A573;
    __int16 v71 = 2080;
    __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v73 = 1024;
    int v74 = 6931;
    goto LABEL_59;
  }
  if ([(SystemProtectedConfig *)v16 biometryEnabled] != -1)
  {
    int v32 = [(SystemProtectedConfig *)v16 biometryEnabled];
    if (v32 != [v30 biometryEnabled]) {
      goto LABEL_53;
    }
  }
  if ([(SystemProtectedConfig *)v16 unlockEnabled] != -1
    && (int v33 = [(SystemProtectedConfig *)v16 unlockEnabled],
        v33 != [v30 unlockEnabled])
    || [(SystemProtectedConfig *)v16 identificationEnabled] != -1
    && (int v34 = [(SystemProtectedConfig *)v16 identificationEnabled],
        v34 != [v30 identificationEnabled])
    || [(SystemProtectedConfig *)v16 loginEnabled] != -1
    && (int v35 = [(SystemProtectedConfig *)v16 loginEnabled],
        v35 != [v30 loginEnabled])
    || [(SystemProtectedConfig *)v16 unlockTokenMaxLifetime] != -1
    && (int v36 = [(SystemProtectedConfig *)v16 unlockTokenMaxLifetime],
        v36 != [v30 unlockTokenMaxLifetime])
    || [(SystemProtectedConfig *)v16 bioMatchLifespan] != -1
    && (int v37 = [(SystemProtectedConfig *)v16 bioMatchLifespan],
        v37 != [v30 bioMatchLifespan])
    || [(SystemProtectedConfig *)v16 passcodeInputLifespan] != -1
    && (int v38 = [(SystemProtectedConfig *)v16 passcodeInputLifespan],
        v38 != [v30 passcodeInputLifespan])
    || [(SystemProtectedConfig *)v16 periocularMatchEnabled] != -1
    && (int v39 = [(SystemProtectedConfig *)v16 periocularMatchEnabled],
        v39 != [v30 periocularMatchEnabled]))
  {
LABEL_53:
    int v40 = [(BiometricKitXPCServer *)self saveCatacomb];
    if (v40)
    {
      int v29 = v40;
      if (__osLog) {
        long long v41 = __osLog;
      }
      else {
        long long v41 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      *(_DWORD *)stat buf = 136316162;
      uint64_t v66 = "err == 0 ";
      __int16 v67 = 2048;
      id v68 = (id)v29;
      __int16 v69 = 2080;
      uint64_t v70 = &unk_22004A573;
      __int16 v71 = 2080;
      __int16 v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v73 = 1024;
      int v74 = 6965;
      goto LABEL_59;
    }
    if (![(SystemProtectedConfig *)v16 biometryEnabled])
    {
      int v43 = [(SystemProtectedConfig *)v16 biometryEnabled];
      if (v43 != [v30 biometryEnabled])
      {
        [(BiometricKitXPCServer *)self syncTemplateListForUser:0xFFFFFFFFLL];
        [(BiometricKitXPCServer *)self deleteUnusedCatacombFiles];
      }
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.BiometricKit.systemProtectedConfigUpdated", 0, 0, 1u);
  [(BiometricKitXPCServer *)self updateExpressModeState];
  if (__osLogTrace) {
    uint64_t v45 = __osLogTrace;
  }
  else {
    uint64_t v45 = &_os_log_internal;
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v66) = 0;
    _os_log_impl(&dword_21FFF3000, v45, OS_LOG_TYPE_DEBUG, "setSystemProtectedConfiguration:withOptions:withClient: -> %d\n", buf, 8u);
  }
  int v29 = 0;
LABEL_74:

  return v29;
}

- (int)performCancelCommand
{
  return 262;
}

- (int)performEnrollCommand:(id)a3
{
  return 262;
}

- (int)performMatchCommand:(id)a3
{
  return 262;
}

- (int)performPresenceDetectCommand:(id)a3
{
  return 262;
}

- (int)performDisplayStatusChangedCommand:(BOOL)a3
{
  return 262;
}

- (int)performGetIdentitiesListCommand:(unsigned int)a3 outBuffer:(id)a4
{
  return 262;
}

- (int)performGetCatacombStateCommand:(id)a3
{
  return 262;
}

- (int)performGetTemplatesValidityCommand:(unsigned int)a3 isValid:(BOOL *)a4
{
  return 262;
}

- (int)performRemoveIdentityCommand:(id *)a3
{
  return 262;
}

- (int)performGetBiometrickitdInfoCommand:(id *)a3
{
  return 262;
}

- (int)performRemoveUserDataCommand:(unsigned int)a3
{
  return 262;
}

- (int)performPrepareSaveCatacombCommand:(id)a3 outDataSize:(unsigned int *)a4
{
  return 262;
}

- (int)performCompleteSaveCatacombCommand:(id)a3 outBuffer:(id)a4
{
  return 262;
}

- (int)performConfirmSaveCatacombCommand:(id)a3
{
  return 262;
}

- (int)performNoCatacombCommand:(unsigned int)a3
{
  return 262;
}

- (int)performLoadCatacombCommand:(id)a3 inData:(id)a4
{
  return 262;
}

- (int)performSaveBioLockoutRecordCommand:(id)a3
{
  return 262;
}

- (int)performLoadBioLockoutRecordCommand:(id)a3
{
  return 262;
}

- (int)performRequestMaxIdentityCountCommand:(unsigned int *)a3
{
  return 262;
}

- (int)performGetFreeIdentityCountCommand:(unsigned int)a3 outCount:(unsigned int *)a4
{
  return 262;
}

- (int)performGetCatacombUUIDCommand:(unsigned int)a3 outUUID:(id *)a4
{
  return 262;
}

- (int)performGetCatacombHashCommand:(unsigned int)a3 outHash:(id *)a4
{
  return 262;
}

- (int)performDropUnlockTokenCommand
{
  return 262;
}

- (int)performForceBioLockoutCommand:(unsigned int)a3
{
  return 262;
}

- (int)performGetSKSLockStateCommand:(unsigned int)a3 outState:(unsigned int *)a4
{
  return 262;
}

- (int)performIsXARTAvailableCommand:(BOOL *)a3
{
  return 262;
}

- (int)performGetLastMatchEventCommand:(id *)a3
{
  return 262;
}

- (int)performGetDeviceHardwareStateCommand:(unsigned int *)a3
{
  return 262;
}

- (int)performGetProtectedConfigCommand:(unsigned int)a3 outSetCfg:(id *)a4 outEffectiveCfg:(id *)a5
{
  return 262;
}

- (int)performGetSystemProtectedConfigCommand:(id *)a3
{
  return 262;
}

- (int)performSetProtectedConfigCommand:(unsigned int)a3 cfg:(id)a4 authData:(id *)a5
{
  return 262;
}

- (int)performSetSystemProtectedConfigCommand:(id)a3 authData:(id *)a4
{
  return 262;
}

- (int)performRequestMessageDataCommand:(unint64_t)a3 size:(unint64_t)a4 outData:(id *)a5
{
  return 262;
}

- (int)performGetCatacombGroupStateCommand:(id)a3
{
  return 262;
}

- (int)performGetIdentityRecordsCommand:(id)a3
{
  return 262;
}

- (int)performGetBioDeviceListCommand:(id)a3
{
  return 262;
}

- (int)performGetFreeIdentityCountCommand:(unsigned int)a3 group:(id *)a4 outCount:(unsigned int *)a5
{
  return 262;
}

- (unsigned)serviceConnect
{
  return 0;
}

- (void)doSharedMemoryTransfers
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (__osLogTrace) {
    id v2 = __osLogTrace;
  }
  else {
    id v2 = &_os_log_internal;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_21FFF3000, v2, OS_LOG_TYPE_DEBUG, "doSharedMemoryTransfers\n", buf, 2u);
  }
  id v3 = (void *)os_transaction_create();
  uint64_t v4 = (void *)MEMORY[0x223C64ED0]();
  uint64_t v5 = [(BiometricKitXPCServer *)self serviceConnect];
  if (!v5)
  {
    if (__osLog) {
      int v37 = __osLog;
    }
    else {
      int v37 = &_os_log_internal;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      uint64_t v45 = "connect";
      __int16 v46 = 2048;
      uint64_t v47 = 0;
      __int16 v48 = 2080;
      __int16 v49 = &unk_22004A573;
      __int16 v50 = 2080;
      __int16 v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v52 = 1024;
      int v53 = 7395;
      _os_log_impl(&dword_21FFF3000, v37, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v8 = 0;
    int v31 = 268;
    goto LABEL_61;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  if (!v7)
  {
    if (__osLog) {
      int v38 = __osLog;
    }
    else {
      int v38 = &_os_log_internal;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      uint64_t v45 = "dataArray";
      __int16 v46 = 2048;
      uint64_t v47 = 0;
      __int16 v48 = 2080;
      __int16 v49 = &unk_22004A573;
      __int16 v50 = 2080;
      __int16 v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v52 = 1024;
      int v53 = 7398;
      _os_log_impl(&dword_21FFF3000, v38, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v8 = 0;
    int v31 = 260;
    goto LABEL_61;
  }
  uint64_t v8 = (void *)v7;
  int v39 = v4;
  int v40 = v3;
  id v9 = (unsigned int *)MEMORY[0x263EF8960];
  while (1)
  {
    unint64_t v42 = 0;
    int v43 = 0;
    int v10 = MEMORY[0x223C64640](v6, 0, *v9, &v43, &v42, 4097);
    if (v10) {
      break;
    }
    if (v42 <= 0xF)
    {
      if (__osLog) {
        int v28 = __osLog;
      }
      else {
        int v28 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      *(_DWORD *)stat buf = 136316162;
      uint64_t v45 = "size >= sizeof(*transfer)";
      __int16 v46 = 2048;
      uint64_t v47 = 0;
      __int16 v48 = 2080;
      __int16 v49 = &unk_22004A573;
      __int16 v50 = 2080;
      __int16 v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v52 = 1024;
      int v53 = 7413;
      int v29 = v28;
LABEL_49:
      _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      goto LABEL_22;
    }
    id v11 = v43;
    uint64_t v12 = v43[1];
    uint64_t v13 = 8 * v12;
    uint64_t v14 = *((void *)v43 + 1);
    if (v14)
    {
      if (v13 + 16 + v14 > v42)
      {
        if (__osLog) {
          id v30 = __osLog;
        }
        else {
          id v30 = &_os_log_internal;
        }
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        *(_DWORD *)stat buf = 136316162;
        uint64_t v45 = "offset + transfer->headerLength <= size";
        __int16 v46 = 2048;
        uint64_t v47 = 0;
        __int16 v48 = 2080;
        __int16 v49 = &unk_22004A573;
        __int16 v50 = 2080;
        __int16 v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v52 = 1024;
        int v53 = 7420;
        int v29 = v30;
        goto LABEL_49;
      }
      int64_t v15 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", &v43[(unint64_t)v13 / 4 + 4]);
      uint64_t v16 = *((void *)v11 + 1);
      if (v11[1])
      {
LABEL_16:
        uint64_t v17 = 0;
        uint64_t v18 = (v13 + v16 + *MEMORY[0x263EF8AF8] + 15) & -*MEMORY[0x263EF8AF8];
        uint64_t v19 = v11 + 4;
        while (*(void *)&v19[2 * v17] + v18 <= v42)
        {
          uint64_t v20 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", (char *)v43 + v18);
          if (!v20)
          {
            if (__osLog) {
              id v27 = __osLog;
            }
            else {
              id v27 = &_os_log_internal;
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)stat buf = 136316162;
              uint64_t v45 = "data";
              __int16 v46 = 2048;
              uint64_t v47 = 0;
              __int16 v48 = 2080;
              __int16 v49 = &unk_22004A573;
              __int16 v50 = 2080;
              __int16 v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              __int16 v52 = 1024;
              int v53 = 7430;
              int v26 = v27;
              goto LABEL_38;
            }
            goto LABEL_21;
          }
          uint64_t v21 = (void *)v20;
          [v8 addObject:v20];
          v18 += *(void *)&v19[2 * v17];

          if (++v17 >= (unint64_t)v11[1]) {
            goto LABEL_20;
          }
        }
        if (__osLog) {
          int v25 = __osLog;
        }
        else {
          int v25 = &_os_log_internal;
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 136316162;
          uint64_t v45 = "offset + transfer->lengths[i] <= size";
          __int16 v46 = 2048;
          uint64_t v47 = 0;
          __int16 v48 = 2080;
          __int16 v49 = &unk_22004A573;
          __int16 v50 = 2080;
          __int16 v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          __int16 v52 = 1024;
          int v53 = 7428;
          int v26 = v25;
LABEL_38:
          _os_log_impl(&dword_21FFF3000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v16 = 0;
      int64_t v15 = 0;
      if (v12) {
        goto LABEL_16;
      }
    }
LABEL_20:
    -[BiometricKitXPCServer handleSharedMemoryTransfer:withHeader:data:](self, "handleSharedMemoryTransfer:withHeader:data:", *v11, v15, v8, v39, v40);
LABEL_21:

LABEL_22:
    objc_msgSend(v8, "removeAllObjects", v39, v40);
    int v22 = MEMORY[0x223C64660](v6, 1, *v9, v43);
    if (v22)
    {
      int v23 = v22;
      if (__osLog) {
        int v24 = __osLog;
      }
      else {
        int v24 = &_os_log_internal;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 136316162;
        uint64_t v45 = "IOConnectUnmapMemory(connect, kAppleBiometricLastSharedMemoryTransferComplete, mach_task_self_, address) == 0 ";
        __int16 v46 = 2048;
        uint64_t v47 = v23;
        __int16 v48 = 2080;
        __int16 v49 = &unk_22004A573;
        __int16 v50 = 2080;
        __int16 v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        __int16 v52 = 1024;
        int v53 = 7439;
        _os_log_impl(&dword_21FFF3000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  int v31 = v10;
  if (v10 == -536870206)
  {
    if (__osLogTrace) {
      int v32 = __osLogTrace;
    }
    else {
      int v32 = &_os_log_internal;
    }
    uint64_t v4 = v39;
    id v3 = v40;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v45) = 0;
      int v33 = v32;
      os_log_type_t v34 = OS_LOG_TYPE_DEBUG;
      goto LABEL_66;
    }
    goto LABEL_67;
  }
  if (__osLog) {
    int v35 = __osLog;
  }
  else {
    int v35 = &_os_log_internal;
  }
  uint64_t v4 = v39;
  id v3 = v40;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 136316162;
    uint64_t v45 = "err == 0 ";
    __int16 v46 = 2048;
    uint64_t v47 = v31;
    __int16 v48 = 2080;
    __int16 v49 = &unk_22004A573;
    __int16 v50 = 2080;
    __int16 v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    __int16 v52 = 1024;
    int v53 = 7411;
    _os_log_impl(&dword_21FFF3000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_61:
  if (__osLogTrace) {
    int v36 = __osLogTrace;
  }
  else {
    int v36 = &_os_log_internal;
  }
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v45) = v31;
    int v33 = v36;
    os_log_type_t v34 = OS_LOG_TYPE_ERROR;
LABEL_66:
    _os_log_impl(&dword_21FFF3000, v33, v34, "doSharedMemoryTransfers -> %{errno}d\n", buf, 8u);
  }
LABEL_67:
}

- (void)handleSharedMemoryTransfer:(unsigned int)a3 withHeader:(id)a4 data:(id)a5
{
  if (__osLog) {
    uint64_t v5 = __osLog;
  }
  else {
    uint64_t v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_ERROR, "handleSharedMemoryTransfer must be overriden in subclass to do shared memory transfers!\n", v6, 2u);
  }
}

- (void)setGracePeriod:(unint64_t)a3
{
  uint64_t v4 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__BiometricKitXPCServer_setGracePeriod___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(v4, block);
}

void __40__BiometricKitXPCServer_setGracePeriod___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v2 = &_os_log_internal;
  if (__osLogTrace) {
    id v3 = __osLogTrace;
  }
  else {
    id v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEBUG, "setGracePeriod\n", (uint8_t *)&v10, 2u);
  }
  uint64_t v20 = @"GracePeriod";
  uint64_t v4 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v21[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

  int v6 = MKBDeviceSetGracePeriod();
  if (v6)
  {
    int v8 = v6;
    if (__osLog) {
      id v9 = __osLog;
    }
    else {
      id v9 = v2;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136316162;
      id v11 = "result == 0 ";
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      int64_t v15 = &unk_22004A573;
      __int16 v16 = 2080;
      uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      __int16 v18 = 1024;
      int v19 = 7465;
      _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.BiometricKit.passcodeGracePeriodChanged", 0, 0, 1u);
  }
}

- (int)registerDSID:(unint64_t)a3 withOptions:(id)a4 withClient:(id)a5
{
  return 45;
}

- (int)registerStoreToken:(id)a3 withClient:(id)a4
{
  return 45;
}

- (int)getCountersignedStoreToken:(id *)a3 withClient:(id)a4
{
  return 45;
}

- (int)diagnostics:(int)a3 withOptions:(id)a4 passed:(BOOL *)a5 withDetails:(id *)a6 withClient:(id)a7
{
  return 45;
}

- (int)setUserDSID:(unint64_t)a3 withOptions:(id)a4 withClient:(id)a5
{
  return 45;
}

- (int)resetAppleConnectCounterWithClient:(id)a3
{
  return 45;
}

- (int)enrollContinue
{
  return 45;
}

- (id)pullAlignmentData
{
  return 0;
}

- (id)pullMatchPolicyInfoData
{
  return 0;
}

- (id)getNodeTopologyForIdentity:(id)a3 withClient:(id)a4
{
  return 0;
}

- (BOOL)getEnabledForUnlock
{
  return 0;
}

- (int)setAppleMesaSEPLoggingLevel
{
  return 45;
}

- (int64_t)getProvisioningStateWithClient:(id)a3
{
  return -1;
}

- (BOOL)isFingerOnWithClient:(id)a3
{
  return 0;
}

- (int)enableBackgroundFdet:(BOOL)a3 withClient:(id)a4
{
  return 45;
}

- (int64_t)getDeviceStateWithClient:(id)a3
{
  return -1;
}

- (int)startNewMatchAttemptWithClient:(id)a3
{
  return 0;
}

- (int)completeEnrollmentWithClient:(id)a3
{
  return 0;
}

- (int)suspendEnrollment:(BOOL)a3 withClient:(id)a4
{
  return 0;
}

- (int)setTemplate:(id)a3 forIdentity:(id)a4 withClient:(id)a5
{
  return 0;
}

- (int)isPeriocularEnrollmentSupported:(BOOL *)a3 withClient:(id)a4
{
  return 0;
}

- (int)getPeriocularMatchStateForUser:(unsigned int)a3 state:(int64_t *)a4 withClient:(id)a5
{
  return 0;
}

- (int)removePeriocularTemplatesWithOptions:(id)a3 withClient:(id)a4
{
  return 0;
}

- (int)queryIdentityMigrationFailureForUser:(unsigned int)a3 failed:(BOOL *)a4 clear:(BOOL)a5 withClient:(id)a6
{
  return 0;
}

- (int)enableMatchAutoRetry:(BOOL)a3 withClient:(id)a4
{
  return 0;
}

- (int)pauseFaceDetectTimer:(BOOL)a3 withClient:(id)a4
{
  return 0;
}

- (id)pullCalibrationDataWithClient:(id)a3
{
  return 0;
}

- (id)pullCaptureBufferWithClient:(id)a3
{
  return 0;
}

- (int)setDebugImages:(BOOL)a3 withClient:(id)a4
{
  return 45;
}

- (id)pullDebugImageData:(BOOL)a3 rotated:(BOOL)a4 hasWidth:(unsigned int *)a5 hasHeight:(unsigned int *)a6 withClient:(id)a7
{
  return 0;
}

- (int64_t)getSensorCalibrationStatusWithClient:(id)a3
{
  return -1;
}

- (id)getCalibrationDataInfoWithClient:(id)a3
{
  return 0;
}

- (id)getSensorInfoWithClient:(id)a3
{
  return 0;
}

- (id)getLogs:(BOOL)a3 withDetails:(id *)a4
{
  return 0;
}

- (BOOL)fileRadarWithLogs:(id)a3 withDescription:(id)a4
{
  return 0;
}

- (void)serviceStatus:(unsigned int)a3 type:(unsigned int)a4 inValue:(void *)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unsigned int v24 = a4;
  uint64_t v9 = &_os_log_internal;
  if (__osLogTrace) {
    int v10 = __osLogTrace;
  }
  else {
    int v10 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109888;
    *(_DWORD *)int v26 = a3;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = a4;
    *(_WORD *)&unsigned char v26[10] = 1024;
    *(_DWORD *)&v26[12] = a5;
    *(_WORD *)&v26[16] = 1024;
    *(_DWORD *)&v26[18] = a5;
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_DEBUG, "serviceStatus:type:inValue: %u 0x%x %u(0x%x)\n", buf, 0x1Au);
  }
  unsigned int v23 = 0;
  uint64_t v21 = 0;
  int v22 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v11 = MCDMExtractMessageData(&v24, &v23, (uint64_t *)a5, &v22, &v20, &v21, &v19);
  uint64_t v12 = v11;
  if (v20)
  {
    if (a5 && v11)
    {
      int v13 = -[BiometricKitXPCServer performRequestMessageDataCommand:size:outData:](self, "performRequestMessageDataCommand:size:outData:", v11);
      id v14 = 0;
      if (v13)
      {
        if (__osLog) {
          int64_t v15 = __osLog;
        }
        else {
          int64_t v15 = v9;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 136316162;
          *(void *)int v26 = "err == 0 ";
          *(_WORD *)&v26[8] = 2048;
          *(void *)&unsigned char v26[10] = v13;
          *(_WORD *)&v26[18] = 2080;
          *(void *)&v26[20] = &unk_22004A573;
          *(_WORD *)&v26[28] = 2080;
          *(void *)id v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biometr"
                           "icKitXPCServer.m";
          *(_WORD *)&v27[8] = 1024;
          *(_DWORD *)int v28 = 7872;
LABEL_29:
          _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v22);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v14 = 0;
  }
  if (__osLog) {
    __int16 v16 = __osLog;
  }
  else {
    __int16 v16 = v9;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67111170;
    *(_DWORD *)int v26 = v24;
    *(_WORD *)&v26[4] = 2048;
    *(void *)&v26[6] = v12;
    *(_WORD *)&v26[14] = 1024;
    *(_DWORD *)&v26[16] = v23;
    *(_WORD *)&v26[20] = 2048;
    *(void *)&v26[22] = v22;
    *(_WORD *)id v27 = 2048;
    *(void *)&v27[2] = v20;
    *(_WORD *)int v28 = 2112;
    *(void *)&v28[2] = v14;
    __int16 v29 = 2048;
    uint64_t v30 = v21;
    __int16 v31 = 2048;
    uint64_t v32 = v21;
    __int16 v33 = 2048;
    uint64_t v34 = v19;
    _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_DEBUG, "serviceStatus:type:inValue: MCDMExtractMessageData %u %llu %u %p %zu %@ %llu(0x%llx) %llu\n", buf, 0x54u);
  }
  int v17 = [(BiometricKitXPCServer *)self serviceStatus:v24 version:v23 ordinal:v21 data:v14 timestamp:v19];
  if (v17)
  {
    int v18 = v17;
    int64_t v15 = (__osLog ? __osLog : v9);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136316162;
      *(void *)int v26 = "err == 0 ";
      *(_WORD *)&v26[8] = 2048;
      *(void *)&unsigned char v26[10] = v18;
      *(_WORD *)&v26[18] = 2080;
      *(void *)&v26[20] = &unk_22004A573;
      *(_WORD *)&v26[28] = 2080;
      *(void *)id v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)int v28 = 7883;
      goto LABEL_29;
    }
  }
LABEL_23:
}

- (int)serviceStatus:(unsigned int)a3 version:(unsigned int)a4 ordinal:(unint64_t)a5 data:(id)a6 timestamp:(unint64_t)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v12 = a6;
  int v13 = &_os_log_internal;
  if (__osLog) {
    id v14 = __osLog;
  }
  else {
    id v14 = &_os_log_internal;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 67110146;
    *(_DWORD *)unsigned int v23 = a3;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = a4;
    *(_WORD *)unsigned int v24 = 2048;
    *(void *)&v24[2] = a5;
    *(_WORD *)int v25 = 2112;
    *(void *)&v25[2] = v12;
    *(_WORD *)int v26 = 2048;
    *(void *)&void v26[2] = a7;
    _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_DEBUG, "serviceStatus:version:ordinal:data:timestamp: 0x%x 0x%x 0x%llx %@ %llu\n", (uint8_t *)&v22, 0x2Cu);
  }
  int v15 = 0;
  if ((int)a3 > -469794561)
  {
    if (a3 != -469794560 && a3 != -469794304)
    {
      if (a3 == -469793536)
      {
        if (a4 != 1)
        {
          if (__osLog) {
            uint64_t v21 = __osLog;
          }
          else {
            uint64_t v21 = v13;
          }
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          int v22 = 136316162;
          *(void *)unsigned int v23 = "msgVersion == 1";
          *(_WORD *)&v23[8] = 2048;
          *(void *)unsigned int v24 = 0;
          *(_WORD *)&v24[8] = 2080;
          *(void *)int v25 = &unk_22004A573;
          *(_WORD *)&v25[8] = 2080;
          *(void *)int v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biometr"
                           "icKitXPCServer.m";
          *(_WORD *)&v26[8] = 1024;
          int v27 = 7908;
          int v17 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
          goto LABEL_41;
        }
        if ([(CatacombStateCache *)self->_catacombStateCache sendAutoBugCaptureEvent:a5]) {
          goto LABEL_17;
        }
        if (__osLog) {
          uint64_t v21 = __osLog;
        }
        else {
          uint64_t v21 = v13;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v22 = 136316162;
          *(void *)unsigned int v23 = "status";
          *(_WORD *)&v23[8] = 2048;
          *(void *)unsigned int v24 = 0;
          *(_WORD *)&v24[8] = 2080;
          *(void *)int v25 = &unk_22004A573;
          *(_WORD *)&v25[8] = 2080;
          *(void *)int v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biometr"
                           "icKitXPCServer.m";
          *(_WORD *)&v26[8] = 1024;
          int v27 = 7911;
          int v17 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
          goto LABEL_41;
        }
LABEL_24:
        int v15 = 263;
        goto LABEL_25;
      }
LABEL_18:
      if (__osLog) {
        __int16 v16 = __osLog;
      }
      else {
        __int16 v16 = v13;
      }
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      int v22 = 67109120;
      *(_DWORD *)unsigned int v23 = a3;
      int v17 = "serviceStatus: Unknown message type: 0x%x\n";
      int v18 = v16;
      uint32_t v19 = 8;
      goto LABEL_23;
    }
  }
  else if (a3 != -536870384 && a3 != -536870352)
  {
    if (a3 == -469794815)
    {
      if (a4 == 1)
      {
        [(BiometricKitXPCServer *)self statusMessage:a5 withData:v12 timestamp:a7];
LABEL_17:
        int v15 = 0;
        goto LABEL_25;
      }
      if (__osLog) {
        uint64_t v21 = __osLog;
      }
      else {
        uint64_t v21 = v13;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136316162;
        *(void *)unsigned int v23 = "msgVersion == 1";
        *(_WORD *)&v23[8] = 2048;
        *(void *)unsigned int v24 = 0;
        *(_WORD *)&v24[8] = 2080;
        *(void *)int v25 = &unk_22004A573;
        *(_WORD *)&v25[8] = 2080;
        *(void *)int v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        *(_WORD *)&v26[8] = 1024;
        int v27 = 7902;
        int v17 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
LABEL_41:
        int v18 = v21;
        uint32_t v19 = 48;
LABEL_23:
        _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v22, v19);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    goto LABEL_18;
  }
LABEL_25:

  return v15;
}

- (IONotificationPort)notifyport
{
  return *(IONotificationPort **)&self->_connectedAccessoriesChgNtfTokenValid;
}

- (OS_dispatch_queue)cmdDispatchQueue
{
  return self->_notifyport;
}

- (BOOL)ariadneSignposts
{
  return BYTE1(self->_mkbLockStatusNtfToken);
}

- (void)setAriadneSignposts:(BOOL)a3
{
  BYTE1(self->_mkbLockStatusNtfToken) = a3;
}

- (NSMutableArray)bioOpsQueue
{
  return (NSMutableArray *)self->_cmdDispatchQueue;
}

- (NSMutableArray)activeBioOpsQueue
{
  return self->_bioOpsQueue;
}

- (BiometricOperation)runningBioOp
{
  return (BiometricOperation *)self->_activeBioOpsQueue;
}

- (ActivityTracker)ongoingCatacombSaveTimer
{
  return (ActivityTracker *)self->_runningBioOp;
}

- (ActivityTracker)ongoingBiometricOperation
{
  return self->_ongoingCatacombSaveTimer;
}

- (NSMutableArray)cachedIdentities
{
  return (NSMutableArray *)self->_ongoingBiometricOperation;
}

- (NSRecursiveLock)catacombLock
{
  return (NSRecursiveLock *)self->_cachedIdentities;
}

- (BKCatacomb)catacomb
{
  return (BKCatacomb *)self->_catacombLock;
}

- (BOOL)templatesAtBoot
{
  return BYTE2(self->_mkbLockStatusNtfToken);
}

- (void)setTemplatesAtBoot:(BOOL)a3
{
  BYTE2(self->_mkbLockStatusNtfToken) = a3;
}

- (void)setCatacombFileAccessed:(BOOL)a3
{
  HIBYTE(self->_mkbLockStatusNtfToken) = a3;
}

- (BOOL)catacombRestored
{
  return self->_connectedAccessoriesChgNtfToken;
}

- (void)setCatacombRestored:(BOOL)a3
{
  LOBYTE(self->_connectedAccessoriesChgNtfToken) = a3;
}

- (CatacombStateCache)catacombStateCache
{
  return (CatacombStateCache *)self->_catacomb;
}

- (BiometricAutoBugCapture)biometricABC
{
  return (BiometricAutoBugCapture *)self->_catacombStateCache;
}

- (void)setBiometricABC:(id)a3
{
}

- (OS_dispatch_queue)biometricABCDispatchQueue
{
  return (OS_dispatch_queue *)self->_biometricABC;
}

- (void)setBiometricABCDispatchQueue:(id)a3
{
}

- (NSMutableSet)accessories
{
  return (NSMutableSet *)self->_biometricABCDispatchQueue;
}

- (EntitlementABCIssueReporter)reporter
{
  return (EntitlementABCIssueReporter *)self->_accessories;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_biometricABCDispatchQueue, 0);
  objc_storeStrong((id *)&self->_biometricABC, 0);
  objc_storeStrong((id *)&self->_catacombStateCache, 0);
  objc_storeStrong((id *)&self->_catacomb, 0);
  objc_storeStrong((id *)&self->_catacombLock, 0);
  objc_storeStrong((id *)&self->_cachedIdentities, 0);
  objc_storeStrong((id *)&self->_ongoingBiometricOperation, 0);
  objc_storeStrong((id *)&self->_ongoingCatacombSaveTimer, 0);
  objc_storeStrong((id *)&self->_runningBioOp, 0);
  objc_storeStrong((id *)&self->_activeBioOpsQueue, 0);
  objc_storeStrong((id *)&self->_bioOpsQueue, 0);
  objc_storeStrong((id *)&self->_cmdDispatchQueue, 0);
  objc_storeStrong((id *)&self->_notifyport, 0);
  objc_storeStrong((id *)&self->_catacombUserUUIDs, 0);
  objc_storeStrong((id *)&self->_expressModeState, 0);
  objc_storeStrong((id *)&self->_activeOperationNtfQueue, 0);
  objc_storeStrong((id *)&self->_exportedObjects, 0);
}

@end