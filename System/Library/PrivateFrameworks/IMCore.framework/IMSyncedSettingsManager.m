@interface IMSyncedSettingsManager
- (IMSyncedSettingsManager)init;
- (IMSyncedSettingsManager_Impl)impl;
- (id)settingValueForKey:(int64_t)a3;
- (void)addObserver:(id)a3 selector:(SEL)a4 key:(int64_t)a5;
- (void)removeObserver:(id)a3 key:(int64_t)a4;
- (void)setSettingValue:(id)a3 forKey:(int64_t)a4;
@end

@implementation IMSyncedSettingsManager

- (IMSyncedSettingsManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)IMSyncedSettingsManager;
  v5 = [(IMSyncedSettingsManager *)&v24 init];
  if (v5)
  {
    v6 = objc_msgSend_sharedController(IMDaemonController, v2, v3, v4);
    v8 = objc_msgSend_multiplexedConnectionWithLabel_capabilities_context_(v6, v7, @"IMSyncedSettingsManager", 0x20000000, 0);

    objc_msgSend_connectWithCompletion_(v8, v9, (uint64_t)&unk_1EF8E52B8, v10);
    v11 = [IMSyncedSettingsManager_Impl alloc];
    v15 = objc_msgSend_sharedController(IMDaemonController, v12, v13, v14);
    v19 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v16, v17, v18);
    uint64_t v21 = objc_msgSend_initWithDaemonController_connection_notificationCenter_(v11, v20, (uint64_t)v15, (uint64_t)v8, v19);
    impl = v5->_impl;
    v5->_impl = (IMSyncedSettingsManager_Impl *)v21;
  }
  return v5;
}

- (id)settingValueForKey:(int64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1A4B344AC;
  v11 = sub_1A4B3433C;
  id v12 = 0;
  impl = self->_impl;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1A4B89668;
  v6[3] = &unk_1E5B7C548;
  v6[4] = &v7;
  objc_msgSend_settingValueForKey_reply_(impl, a2, a3, (uint64_t)v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setSettingValue:(id)a3 forKey:(int64_t)a4
{
}

- (void)addObserver:(id)a3 selector:(SEL)a4 key:(int64_t)a5
{
}

- (void)removeObserver:(id)a3 key:(int64_t)a4
{
}

- (IMSyncedSettingsManager_Impl)impl
{
  return (IMSyncedSettingsManager_Impl *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end