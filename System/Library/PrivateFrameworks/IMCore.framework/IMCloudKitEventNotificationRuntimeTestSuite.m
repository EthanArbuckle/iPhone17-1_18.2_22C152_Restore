@interface IMCloudKitEventNotificationRuntimeTestSuite
+ (void)runTestsIfNeeded;
- (BOOL)shouldTearDown;
- (IMCloudKitEventNotificationRuntimeTestSuite)init;
- (IMCloudKitHookTestSingleton)cloudKitHooks;
- (void)cloudKitEventNotificationManager:(id)a3 syncProgressDidUpdate:(id)a4;
- (void)setCloudKitHooks:(id)a3;
- (void)setShouldTearDown:(BOOL)a3;
- (void)setUp;
- (void)tearDown;
@end

@implementation IMCloudKitEventNotificationRuntimeTestSuite

- (IMCloudKitEventNotificationRuntimeTestSuite)init
{
  v36.receiver = self;
  v36.super_class = (Class)IMCloudKitEventNotificationRuntimeTestSuite;
  v2 = [(IMRuntimeTestSuite *)&v36 init];
  if (v2)
  {
    IMSetAlwaysUseSingletonProxies();
    objc_msgSend_setTestSuiteStartDelay_(v2, v3, v4, v5, 5.0);
    v6 = objc_alloc_init(IMCloudKitSyncProgressRuntimeTestUploading);
    objc_msgSend_addTest_(v2, v7, (uint64_t)v6, v8);

    v9 = objc_alloc_init(IMCloudKitSyncProgressRuntimeTestDownloading);
    objc_msgSend_addTest_(v2, v10, (uint64_t)v9, v11);

    v12 = objc_alloc_init(IMCloudKitSyncProgressRuntimeTestDeleting);
    objc_msgSend_addTest_(v2, v13, (uint64_t)v12, v14);

    v15 = objc_alloc_init(IMCloudKitSyncProgressRuntimeTestPreparing);
    objc_msgSend_addTest_(v2, v16, (uint64_t)v15, v17);

    v18 = objc_alloc_init(IMCloudKitSyncProgressRuntimeTestPaused);
    objc_msgSend_addTest_(v2, v19, (uint64_t)v18, v20);

    v21 = [IMCloudKitErrorProgressTest alloc];
    v24 = objc_msgSend_initWithErrorCode_(v21, v22, 3, v23);
    objc_msgSend_addTest_(v2, v25, (uint64_t)v24, v26);

    v27 = [IMCloudKitErrorProgressTest alloc];
    v30 = objc_msgSend_initWithErrorCode_(v27, v28, 6, v29);
    objc_msgSend_addTest_(v2, v31, (uint64_t)v30, v32);

    objc_msgSend_testLog_(v2, v33, @"installed tests", v34);
  }
  return v2;
}

- (void)setUp
{
  v40.receiver = self;
  v40.super_class = (Class)IMCloudKitEventNotificationRuntimeTestSuite;
  [(IMRuntimeTest *)&v40 setUp];
  objc_msgSend_setShouldTearDown_(self, v3, 0, v4);
  objc_msgSend_testLog_(self, v5, @"Setting up cloudkit hooks, etc", v6);
  v10 = objc_msgSend_sharedInstance(IMCloudKitEventNotificationManager, v7, v8, v9);
  objc_msgSend_progressBroadcastDelay(v10, v11, v12, v13);
  objc_msgSend_setTestStartDelay_(self, v15, v16, v17, v14 + 2.0);

  v18 = objc_alloc_init(IMCloudKitHookTestSingleton);
  objc_msgSend_setCloudKitHooks_(self, v19, (uint64_t)v18, v20);

  v24 = objc_msgSend_cloudKitHooks(self, v21, v22, v23);
  objc_msgSend_overrideSingletonWithObject_(IMCloudKitHooks, v25, (uint64_t)v24, v26);

  v30 = objc_msgSend_sharedInstance(IMCloudKitEventNotificationManager, v27, v28, v29);
  objc_msgSend_addEventHandler_(v30, v31, (uint64_t)self, v32);

  objc_super v36 = objc_msgSend_cloudKitHooks(self, v33, v34, v35);
  v37 = objc_alloc_init(IMCloudKitMockSyncState);
  objc_msgSend_setTestState_(v36, v38, (uint64_t)v37, v39);
}

- (void)cloudKitEventNotificationManager:(id)a3 syncProgressDidUpdate:(id)a4
{
  if (objc_msgSend_shouldTearDown(self, a2, (uint64_t)a3, (uint64_t)a4))
  {
    objc_msgSend_setShouldTearDown_(self, v5, 0, v6);
    objc_msgSend_testLog_(self, v7, @"Actually Tearing down cloudkit hooks", v8);
    objc_msgSend_removeSingletonOverride(IMCloudKitHooks, v9, v10, v11);
    objc_msgSend_setCloudKitHooks_(self, v12, 0, v13);
    objc_msgSend_sharedInstance(IMCloudKitEventNotificationManager, v14, v15, v16);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeEventHandler_(v19, v17, (uint64_t)self, v18);
  }
}

- (void)tearDown
{
  objc_msgSend_setShouldTearDown_(self, a2, 1, v2);
  v7 = objc_msgSend_cloudKitHooks(self, v4, v5, v6);
  uint64_t v8 = objc_alloc_init(IMCloudKitMockSyncState);
  objc_msgSend_setTestState_(v7, v9, (uint64_t)v8, v10);

  v11.receiver = self;
  v11.super_class = (Class)IMCloudKitEventNotificationRuntimeTestSuite;
  [(IMRuntimeTest *)&v11 tearDown];
}

+ (void)runTestsIfNeeded
{
  uint64_t v5 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], a2, v2, v3);
  uint64_t v8 = objc_msgSend_integerForKey_(v5, v6, @"cloudkit-sync-ui-tests", v7);

  if (v8 >= 1)
  {
    objc_msgSend_testLog_(a1, v9, @"user default cloudkit-sync-ui-tests == %ld, starting runtime tests", v10, v8);
    MEMORY[0x1F4181798](a1, sel_runTestsIfNeededWithRepeatCount_, v8, v11);
  }
}

- (IMCloudKitHookTestSingleton)cloudKitHooks
{
  return self->_cloudKitHooks;
}

- (void)setCloudKitHooks:(id)a3
{
}

- (BOOL)shouldTearDown
{
  return self->_shouldTearDown;
}

- (void)setShouldTearDown:(BOOL)a3
{
  self->_shouldTearDown = a3;
}

- (void).cxx_destruct
{
}

@end