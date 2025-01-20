@interface IMOneTimeCodeAccelerator
+ (IMSyncedSettingsManaging)syncedSettingsManager;
+ (void)setSyncedSettingsManager:(id)a3;
- (IMDaemonMultiplexedConnectionManaging)daemonConnection;
- (IMOneTimeCodeAccelerator)initWithBlockForUpdates:(id)a3;
- (id)settingUpdateBlock;
- (id)updateBlock;
- (void)_deleteVerificationCodesDidChange:(id)a3;
- (void)_incomingCodeUpdateFromDaemon:(id)a3;
- (void)consumeCodeWithGuid:(id)a3;
- (void)dealloc;
- (void)fetchAutoDeletionPreferenceWithCompletionHandler:(id)a3;
- (void)onboardDeleteVerificationCodesIfNeededWithCompletionHandler:(id)a3;
- (void)onboardDeleteVerificationCodesIfNeededWithMessage:(id)a3 completionHandler:(id)a4;
- (void)setAutoDeletionPreference:(BOOL)a3;
- (void)setDaemonConnection:(id)a3;
- (void)setSettingUpdateBlock:(id)a3;
- (void)setUpConnectionToDaemaon;
- (void)setUpdateBlock:(id)a3;
@end

@implementation IMOneTimeCodeAccelerator

+ (IMSyncedSettingsManaging)syncedSettingsManager
{
  v2 = (void *)qword_1E965E5B0;
  if (!qword_1E965E5B0)
  {
    v3 = objc_alloc_init(IMSyncedSettingsManager);
    v4 = (void *)qword_1E965E5B0;
    qword_1E965E5B0 = (uint64_t)v3;

    v2 = (void *)qword_1E965E5B0;
  }

  return (IMSyncedSettingsManaging *)v2;
}

+ (void)setSyncedSettingsManager:(id)a3
{
}

- (void)_deleteVerificationCodesDidChange:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Delete Verifications Codes setting updated.", (uint8_t *)&v38, 2u);
    }
  }
  v9 = objc_msgSend_userInfo(v4, v5, v6, v7);
  v12 = objc_msgSend_valueForKey_(v9, v10, @"reason", v11);
  char isEqual = objc_msgSend_isEqual_(v12, v13, @"LocallySet", v14);

  if ((isEqual & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "reason is not locally set", (uint8_t *)&v38, 2u);
      }
    }
    v20 = objc_msgSend_settingUpdateBlock(self, v16, v17, v18);

    if (v20)
    {
      v24 = objc_msgSend_syncedSettingsManager(IMOneTimeCodeAccelerator, v21, v22, v23);
      v27 = objc_msgSend_settingValueForKey_(v24, v25, 2, v26);
      uint64_t v31 = objc_msgSend_BOOLValue(v27, v28, v29, v30);

      if (IMOSLoggingEnabled())
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = @"NO";
          if (v31) {
            v36 = @"YES";
          }
          int v38 = 138412290;
          v39 = v36;
          _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Calling setting update block with %@", (uint8_t *)&v38, 0xCu);
        }
      }
      objc_msgSend_settingUpdateBlock(self, v32, v33, v34);
      v37 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      v37[2](v37, v31);
    }
  }
}

- (IMOneTimeCodeAccelerator)initWithBlockForUpdates:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IMOneTimeCodeAccelerator;
  v5 = [(IMOneTimeCodeAccelerator *)&v22 init];
  if (v5)
  {
    uint64_t v6 = _Block_copy(v4);
    id updateBlock = v5->_updateBlock;
    v5->_id updateBlock = v6;

    objc_msgSend_setUpConnectionToDaemaon(v5, v8, v9, v10);
    uint64_t v14 = objc_msgSend_syncedSettingsManager(IMOneTimeCodeAccelerator, v11, v12, v13);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v19 = objc_msgSend_syncedSettingsManager(IMOneTimeCodeAccelerator, v16, v17, v18);
      objc_msgSend_addObserver_selector_key_(v19, v20, (uint64_t)v5, (uint64_t)sel__deleteVerificationCodesDidChange_, 2);
    }
  }

  return v5;
}

- (void)consumeCodeWithGuid:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Sending request to daemon to consume code with GUID: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend_remoteProxy(self->_daemonConnection, v5, v6, v7);
  objc_msgSend_consumeCodeWithMessageGUID_(v9, v10, (uint64_t)v4, v11);
}

- (void)onboardDeleteVerificationCodesIfNeededWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Sending request to onboarding delete verification codes if needed", v12, 2u);
    }
  }
  uint64_t v9 = objc_msgSend_remoteProxy(self->_daemonConnection, v5, v6, v7);
  objc_msgSend_onboardDeleteVerificationCodesIfNeededWithReply_(v9, v10, (uint64_t)v4, v11);
}

- (void)onboardDeleteVerificationCodesIfNeededWithMessage:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Sending request to onboarding delete verification codes if needed, using custom message: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  int v12 = objc_msgSend_remoteProxy(self->_daemonConnection, v8, v9, v10);
  objc_msgSend_onboardDeleteVerificationCodesIfNeededWithMessage_reply_(v12, v13, (uint64_t)v6, (uint64_t)v7);
}

- (void)setAutoDeletionPreference:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend_remoteProxy(self->_daemonConnection, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAutoDeletionPreference_(v7, v5, v4, v6);
}

- (void)fetchAutoDeletionPreferenceWithCompletionHandler:(id)a3
{
  if (a3)
  {
    daemonConnection = self->_daemonConnection;
    id v4 = a3;
    objc_msgSend_remoteProxy(daemonConnection, v5, v6, v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchAutoDeletionPreferenceWithReply_(v10, v8, (uint64_t)v4, v9);
  }
}

- (void)dealloc
{
  v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  objc_msgSend_setUpdateBlock_(self, v8, 0, v9);
  id v13 = objc_msgSend_syncedSettingsManager(IMOneTimeCodeAccelerator, v10, v11, v12);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v18 = objc_msgSend_syncedSettingsManager(IMOneTimeCodeAccelerator, v15, v16, v17);
    objc_msgSend_removeObserver_key_(v18, v19, (uint64_t)self, 2);
  }
  v20.receiver = self;
  v20.super_class = (Class)IMOneTimeCodeAccelerator;
  [(IMOneTimeCodeAccelerator *)&v20 dealloc];
}

- (void)setUpConnectionToDaemaon
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Setting up IMAgent connect for OTC", buf, 2u);
    }
  }
  uint64_t v7 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v3, v4, v5);
  objc_msgSend_addObserver_selector_name_object_(v7, v8, (uint64_t)self, (uint64_t)sel__incomingCodeUpdateFromDaemon_, @"com.apple.imcore.otcUpdated", 0);

  uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v9, v10, v11);
  objc_msgSend_multiplexedConnectionWithLabel_capabilities_context_(v12, v13, @"com.apple.IMCore.IMOneTimeCodeAccelerator", 545259520, 0);
  char v14 = (IMDaemonMultiplexedConnectionManaging *)objc_claimAutoreleasedReturnValue();
  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = v14;

  uint64_t v16 = self->_daemonConnection;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1A4C07CD0;
  v19[3] = &unk_1E5B7ACD0;
  v19[4] = self;
  objc_msgSend_connectWithCompletion_(v16, v17, (uint64_t)v19, v18);
}

- (void)_incomingCodeUpdateFromDaemon:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_msgSend_userInfo(v4, v9, v10, v11);
      int v24 = 138412290;
      v25 = v12;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Recevied updated valid codes list from daemon: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  id v13 = objc_msgSend_userInfo(v4, v5, v6, v7);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"validCodes", v15);

  objc_super v20 = objc_msgSend_updateBlock(self, v17, v18, v19);
  if (v20) {
    BOOL v21 = v16 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  int v22 = !v21;

  if (v22)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Sending codes to SPI ", (uint8_t *)&v24, 2u);
      }
    }
    (*((void (**)(void))self->_updateBlock + 2))();
  }
}

- (id)settingUpdateBlock
{
  return self->_settingUpdateBlock;
}

- (void)setSettingUpdateBlock:(id)a3
{
}

- (IMDaemonMultiplexedConnectionManaging)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);

  objc_storeStrong(&self->_settingUpdateBlock, 0);
}

@end