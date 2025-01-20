@interface IMCloudKitEventNotificationManagerRuntimeTest
- (IMCloudKitHookTestSingleton)cloudKitHooks;
- (double)defaultTestDuration;
- (id)createSyncStatisticsForMockSyncState:(id)a3;
- (void)cloudKitEventNotificationManager:(id)a3 syncProgressDidUpdate:(id)a4;
- (void)cloudKitEventNotificationManager:(id)a3 syncStateDidChange:(id)a4;
- (void)sendSyncStateChangedEvent;
- (void)setCloudKitHooks:(id)a3;
- (void)setDefaultTestDuration:(double)a3;
- (void)setUp;
- (void)startTest;
- (void)tearDown;
- (void)updateMockSyncState;
@end

@implementation IMCloudKitEventNotificationManagerRuntimeTest

- (void)setUp
{
  v22.receiver = self;
  v22.super_class = (Class)IMCloudKitEventNotificationManagerRuntimeTest;
  [(IMRuntimeTest *)&v22 setUp];
  objc_msgSend_setDefaultTestDuration_(self, v3, v4, v5, 1.0);
  v9 = objc_msgSend_singletonOverride(IMCloudKitHooks, v6, v7, v8);
  objc_msgSend_setCloudKitHooks_(self, v10, (uint64_t)v9, v11);

  v15 = objc_msgSend_sharedInstance(IMCloudKitEventNotificationManager, v12, v13, v14);
  objc_msgSend_addEventHandler_(v15, v16, (uint64_t)self, v17);

  v18 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v18);
  objc_msgSend_testLog_(self, v20, @"Setting up test: %@", v21, v19);
}

- (void)tearDown
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  objc_msgSend_testLog_(self, v5, @"Tearing down test: %@", v6, v4);

  v10 = objc_msgSend_sharedInstance(IMCloudKitEventNotificationManager, v7, v8, v9);
  objc_msgSend_removeEventHandler_(v10, v11, (uint64_t)self, v12);

  v16 = objc_msgSend_cloudKitHooks(self, v13, v14, v15);
  uint64_t v17 = objc_alloc_init(IMCloudKitMockSyncState);
  objc_msgSend_setTestState_(v16, v18, (uint64_t)v17, v19);

  objc_msgSend_setCloudKitHooks_(self, v20, 0, v21);
  v22.receiver = self;
  v22.super_class = (Class)IMCloudKitEventNotificationManagerRuntimeTest;
  [(IMRuntimeTest *)&v22 tearDown];
}

- (id)createSyncStatisticsForMockSyncState:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_IMCloudKitSyncControllerSyncState(v3, v4, v5, v6);
  uint64_t v11 = objc_msgSend_IMCloudKitSyncControllerSyncRecordType(v3, v8, v9, v10);

  return (id)MEMORY[0x1F4181798](IMCloudKitSyncStatistics, sel__createSyncStatisticsDictionaryForSyncControllerSyncState_syncType_count_max_unresolved_, v7, v11);
}

- (void)updateMockSyncState
{
  uint64_t v5 = objc_msgSend_cloudKitHooks(self, a2, v2, v3);
  objc_msgSend_testState(v5, v6, v7, v8);
  id v50 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setIMCloudKitSyncDate_(v50, v9, 0, v10);
  objc_msgSend_setIMCloudKitIsSyncing_(v50, v11, 1, v12);
  objc_msgSend_setIMCloudKitSyncControllerSyncType_(v50, v13, 2, v14);
  objc_msgSend_setIMCloudKitIsEligibleForTruthZone_(v50, v15, 1, v16);
  objc_msgSend_setIMCloudKitSyncingEnabled_(v50, v17, 1, v18);
  objc_msgSend_setIMCloudKitSyncControllerSyncRecordType_(v50, v19, 1, v20);
  objc_msgSend_willUpdateSyncState_(self, v21, (uint64_t)v50, v22);
  v25 = objc_msgSend_createSyncStatisticsForMockSyncState_(self, v23, (uint64_t)v50, v24);
  objc_msgSend_willSendSyncState_withSyncStatistics_(self, v26, (uint64_t)v50, (uint64_t)v25);
  v30 = objc_msgSend_cloudKitHooks(self, v27, v28, v29);
  objc_msgSend_setSyncStats_(v30, v31, (uint64_t)v25, v32);

  v36 = objc_msgSend_sharedInstance(IMCloudKitHooks, v33, v34, v35);
  v40 = objc_msgSend_syncStateDictionary(v36, v37, v38, v39);
  objc_msgSend_testLog_(self, v41, @"Updated mock sync state to: %@, with sync stats: %@", v42, v40, v25);

  v46 = objc_msgSend_cloudKitHooks(self, v43, v44, v45);
  objc_msgSend_sendSyncChangedEvent(v46, v47, v48, v49);
}

- (void)sendSyncStateChangedEvent
{
  objc_msgSend_updateMockSyncState(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_sharedInstance(IMCloudKitHooks, v5, v6, v7);
  uint64_t v12 = objc_msgSend_syncStateDictionary(v8, v9, v10, v11);
  objc_msgSend_testLog_(self, v13, @"Sending fake syncState dictionary: %@", v14, v12);

  objc_msgSend_cloudKitHooks(self, v15, v16, v17);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendSyncChangedEvent(v21, v18, v19, v20);
}

- (void)cloudKitEventNotificationManager:(id)a3 syncStateDidChange:(id)a4
{
}

- (void)cloudKitEventNotificationManager:(id)a3 syncProgressDidUpdate:(id)a4
{
}

- (void)startTest
{
  objc_msgSend_defaultTestDuration(self, a2, v2, v3);
  objc_msgSend_testLog_(self, v5, @"Running test for %f seconds", v6, v7);
  objc_msgSend_updateMockSyncState(self, v8, v9, v10);
  objc_msgSend_defaultTestDuration(self, v11, v12, v13);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1A4C3BAA0;
  v16[3] = &unk_1E5B7ACD0;
  v16[4] = self;
  objc_msgSend_dispatchAfter_block_(self, v14, (uint64_t)v16, v15);
}

- (double)defaultTestDuration
{
  return self->_defaultTestDuration;
}

- (void)setDefaultTestDuration:(double)a3
{
  self->_defaultTestDuration = a3;
}

- (IMCloudKitHookTestSingleton)cloudKitHooks
{
  return self->_cloudKitHooks;
}

- (void)setCloudKitHooks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end