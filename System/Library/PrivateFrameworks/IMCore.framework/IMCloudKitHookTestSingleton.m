@interface IMCloudKitHookTestSingleton
+ (id)logHandle;
- (BOOL)eligibleForTruthZone;
- (BOOL)isDisablingDevices;
- (BOOL)isEnabled;
- (BOOL)isInExitState;
- (BOOL)isStartingSync;
- (BOOL)isSyncing;
- (BOOL)rampedIntoTruthZone;
- (IMCloudKitHookTestSingleton)init;
- (IMCloudKitMockSyncState)testState;
- (NSArray)IMCloudKitSyncErrors;
- (NSDate)lastSyncDate;
- (NSDictionary)syncStats;
- (id)logHandle;
- (id)syncStateDictionary;
- (int64_t)isChangingEnabledState;
- (int64_t)syncType;
- (unint64_t)syncControllerSyncState;
- (void)fetchSyncStateStatistics;
- (void)initiatePeriodicSync;
- (void)sendSyncChangedEvent;
- (void)setControllerSyncState:(unint64_t)a3;
- (void)setControllerSyncType:(int64_t)a3;
- (void)setEligibleForTruthZone:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIMCloudKitSyncErrors:(id)a3;
- (void)setIsChangingEnabledState:(int64_t)a3;
- (void)setIsDisablingDevices:(BOOL)a3;
- (void)setIsInExitState:(BOOL)a3;
- (void)setIsStartingSync:(BOOL)a3;
- (void)setLastSyncDate:(id)a3;
- (void)setRampedIntoTruthZone:(BOOL)a3;
- (void)setSyncControllerSyncState:(unint64_t)a3;
- (void)setSyncStats:(id)a3;
- (void)setSyncType:(int64_t)a3;
- (void)setSyncing:(BOOL)a3;
- (void)setTestState:(id)a3;
@end

@implementation IMCloudKitHookTestSingleton

- (IMCloudKitHookTestSingleton)init
{
  v15.receiver = self;
  v15.super_class = (Class)IMCloudKitHookTestSingleton;
  v2 = [(IMCloudKitHookTestSingleton *)&v15 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    uint64_t v6 = objc_msgSend__createSyncStatisticsDictionary_messageSyncCount_messageUnresolvedCount_chatCount_chatSyncCount_chatUnresolvedCount_attachmentCount_attachmentSyncCount_attachmentUnresolvedCount_serverRecordCounts_syncStoreCounts_(IMCloudKitSyncStatistics, v5, 0, 0, 0, 0, 0, 0, 0, 0, 0, v3, v4);
    syncStats = v2->_syncStats;
    v2->_syncStats = (NSDictionary *)v6;

    v8 = objc_alloc_init(IMCloudKitMockSyncState);
    testState = v2->_testState;
    v2->_testState = v8;

    objc_msgSend_setIMCloudKitSyncingEnabled_(v2->_testState, v10, 1, v11);
    objc_msgSend_setIMCloudKitIsEligibleForTruthZone_(v2->_testState, v12, 1, v13);
  }
  return v2;
}

+ (id)logHandle
{
  if (qword_1EB3F22F8 != -1) {
    dispatch_once(&qword_1EB3F22F8, &unk_1EF8E5718);
  }
  v2 = (void *)qword_1EB3F2310;

  return v2;
}

- (id)logHandle
{
  v2 = objc_opt_class();

  return (id)objc_msgSend_logHandle(v2, v3, v4, v5);
}

- (void)setTestState:(id)a3
{
  objc_storeStrong((id *)&self->_testState, a3);

  objc_msgSend_sendSyncChangedEvent(self, v4, v5, v6);
}

- (void)fetchSyncStateStatistics
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4C39D10;
  block[3] = &unk_1E5B7ACD0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)sendSyncChangedEvent
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_sharedInstance(IMCloudKitHooks, a2, v2, v3);
  v9 = objc_msgSend_syncStateDictionary(v5, v6, v7, v8);

  uint64_t v13 = objc_msgSend_logHandle(self, v10, v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    v20 = v9;
    _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Sending fake state: %@ from IMCloudKitHooksTestSingleton", (uint8_t *)&v19, 0xCu);
  }

  v17 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v14, v15, v16);
  objc_msgSend_postNotificationName_object_userInfo_(v17, v18, @"com.apple.IMCore.IMCloudKitHooks.ValuesChanged", 0, v9);
}

- (BOOL)isEnabled
{
  return objc_msgSend_IMCloudKitSyncingEnabled(self->_testState, a2, v2, v3);
}

- (void)setEnabled:(BOOL)a3
{
  objc_msgSend_setIMCloudKitSyncingEnabled_(self->_testState, a2, a3, v3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4C39F44;
  block[3] = &unk_1E5B7E9F8;
  BOOL v10 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_msgSend_sendSyncChangedEvent(self, v6, v7, v8);
}

- (BOOL)eligibleForTruthZone
{
  return objc_msgSend_IMCloudKitIsEligibleForTruthZone(self->_testState, a2, v2, v3);
}

- (void)setEligibleForTruthZone:(BOOL)a3
{
  objc_msgSend_setIMCloudKitIsEligibleForTruthZone_(self->_testState, a2, a3, v3);

  objc_msgSend_sendSyncChangedEvent(self, v5, v6, v7);
}

- (BOOL)isSyncing
{
  return objc_msgSend_IMCloudKitIsSyncing(self->_testState, a2, v2, v3);
}

- (void)setSyncing:(BOOL)a3
{
  objc_msgSend_setIMCloudKitIsSyncing_(self->_testState, a2, a3, v3);

  objc_msgSend_sendSyncChangedEvent(self, v5, v6, v7);
}

- (void)initiatePeriodicSync
{
}

- (BOOL)isDisablingDevices
{
  return objc_msgSend_IMCloudKitStartingDisableDevices(self->_testState, a2, v2, v3);
}

- (BOOL)isStartingSync
{
  if (objc_msgSend_IMCloudKitStartingInitialSync(self->_testState, a2, v2, v3)) {
    return 1;
  }
  testState = self->_testState;

  return objc_msgSend_IMCloudKitStartingPeriodicSync(testState, v5, v6, v7);
}

- (int64_t)isChangingEnabledState
{
  return objc_msgSend_IMCloudKitStartingEnabledSettingChange(self->_testState, a2, v2, v3);
}

- (NSDate)lastSyncDate
{
  return (NSDate *)objc_msgSend_IMCloudKitSyncDate(self->_testState, a2, v2, v3);
}

- (void)setLastSyncDate:(id)a3
{
  objc_msgSend_setIMCloudKitSyncDate_(self->_testState, a2, (uint64_t)a3, v3);

  objc_msgSend_sendSyncChangedEvent(self, v5, v6, v7);
}

- (id)syncStateDictionary
{
  return (id)((uint64_t (*)(IMCloudKitMockSyncState *, char *))MEMORY[0x1F4181798])(self->_testState, sel_convertToDictionary);
}

- (BOOL)isInExitState
{
  return objc_msgSend_IMCloudKitIsInExitState(self->_testState, a2, v2, v3);
}

- (void)setIsInExitState:(BOOL)a3
{
  objc_msgSend_setIMCloudKitIsInExitState_(self->_testState, a2, a3, v3);

  objc_msgSend_sendSyncChangedEvent(self, v5, v6, v7);
}

- (unint64_t)syncControllerSyncState
{
  return objc_msgSend_IMCloudKitSyncControllerSyncState(self->_testState, a2, v2, v3);
}

- (void)setControllerSyncState:(unint64_t)a3
{
  objc_msgSend_setIMCloudKitSyncControllerSyncState_(self->_testState, a2, a3, v3);

  MEMORY[0x1F4181798](self, sel_setSyncing_, a3 == 0, v6);
}

- (int64_t)syncType
{
  return objc_msgSend_IMCloudKitSyncControllerSyncType(self->_testState, a2, v2, v3);
}

- (void)setControllerSyncType:(int64_t)a3
{
  objc_msgSend_setIMCloudKitSyncControllerSyncType_(self->_testState, a2, a3, v3);

  objc_msgSend_sendSyncChangedEvent(self, v5, v6, v7);
}

- (NSArray)IMCloudKitSyncErrors
{
  return (NSArray *)objc_msgSend_IMCloudKitSyncErrors(self->_testState, a2, v2, v3);
}

- (void)setIMCloudKitSyncErrors:(id)a3
{
  objc_msgSend_setIMCloudKitSyncErrors_(self->_testState, a2, (uint64_t)a3, v3);

  objc_msgSend_sendSyncChangedEvent(self, v5, v6, v7);
}

- (IMCloudKitMockSyncState)testState
{
  return self->_testState;
}

- (BOOL)rampedIntoTruthZone
{
  return self->_rampedIntoTruthZone;
}

- (void)setRampedIntoTruthZone:(BOOL)a3
{
  self->_rampedIntoTruthZone = a3;
}

- (void)setIsChangingEnabledState:(int64_t)a3
{
  self->_isChangingEnabledState = a3;
}

- (void)setIsStartingSync:(BOOL)a3
{
  self->_isStartingSync = a3;
}

- (void)setIsDisablingDevices:(BOOL)a3
{
  self->_isDisablingDevices = a3;
}

- (void)setSyncControllerSyncState:(unint64_t)a3
{
  self->_syncControllerSyncState = a3;
}

- (void)setSyncType:(int64_t)a3
{
  self->_syncType = a3;
}

- (NSDictionary)syncStats
{
  return self->_syncStats;
}

- (void)setSyncStats:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncStats, 0);

  objc_storeStrong((id *)&self->_testState, 0);
}

@end