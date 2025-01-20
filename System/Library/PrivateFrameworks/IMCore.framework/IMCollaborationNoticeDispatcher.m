@interface IMCollaborationNoticeDispatcher
- (IMCollaborationNoticeDispatcher)init;
- (IMDaemonMultiplexedConnectionManaging)daemonConnection;
- (id)_bestSendingHandle;
- (void)dealloc;
- (void)disconnectFromDaemon;
- (void)sendClearNotice:(id)a3 toHandles:(id)a4 completion:(id)a5;
- (void)sendNotice:(id)a3 toHandles:(id)a4 completion:(id)a5;
- (void)setDaemonConnection:(id)a3;
- (void)setUpConnectionToDaemon;
@end

@implementation IMCollaborationNoticeDispatcher

- (IMCollaborationNoticeDispatcher)init
{
  v11.receiver = self;
  v11.super_class = (Class)IMCollaborationNoticeDispatcher;
  v2 = [(IMCollaborationNoticeDispatcher *)&v11 init];
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Success init", v10, 2u);
      }
    }
    objc_msgSend_setUpConnectionToDaemon(v2, v4, v5, v6);
  }
  else if (v3)
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "IMCollaborationNoticeDispatcher failed init", v10, 2u);
    }
  }
  return v2;
}

- (void)sendNotice:(id)a3 toHandles:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Connecting to daemon to send notice %@ to %@", buf, 0x16u);
    }
  }
  v15 = objc_msgSend_daemonConnection(self, v11, v12, v13);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1A4BC0E38;
  v21[3] = &unk_1E5B7BCE0;
  v21[4] = self;
  id v22 = v8;
  id v23 = v9;
  id v24 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  objc_msgSend_connectWithCompletion_(v15, v19, (uint64_t)v21, v20);
}

- (void)sendClearNotice:(id)a3 toHandles:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Connecting to daemon to send clear notice %@ to %@", buf, 0x16u);
    }
  }
  v15 = objc_msgSend_daemonConnection(self, v11, v12, v13);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1A4BC133C;
  v21[3] = &unk_1E5B7BCE0;
  v21[4] = self;
  id v22 = v8;
  id v23 = v9;
  id v24 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  objc_msgSend_connectWithCompletion_(v15, v19, (uint64_t)v21, v20);
}

- (id)_bestSendingHandle
{
  int v3 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, a2, *MEMORY[0x1E4F6E1B0], v2);
  v7 = objc_msgSend_sharedInstance(IMAccountController, v4, v5, v6);
  id v10 = objc_msgSend_bestAccountForService_(v7, v8, (uint64_t)v3, v9);

  v14 = objc_msgSend_loginIMHandle(v10, v11, v12, v13);
  id v18 = objc_msgSend_ID(v14, v15, v16, v17);
  v19 = MEMORY[0x1A62639E0]();

  if (objc_msgSend__appearsToBeEmail(v19, v20, v21, v22)) {
    uint64_t v23 = MEMORY[0x1A6262E50](v19);
  }
  else {
    uint64_t v23 = IDSCopyIDForPhoneNumber();
  }
  id v24 = (void *)v23;

  return v24;
}

- (void)dealloc
{
  objc_msgSend_disconnectFromDaemon(self, a2, v2, v3);
  objc_msgSend_setDaemonConnection_(self, v5, 0, v6);
  v7.receiver = self;
  v7.super_class = (Class)IMCollaborationNoticeDispatcher;
  [(IMCollaborationNoticeDispatcher *)&v7 dealloc];
}

- (void)setUpConnectionToDaemon
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_super v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      int v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Setting up connection for %@", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend_sharedController(IMDaemonController, v3, v4, v5);
  objc_msgSend_multiplexedConnectionWithLabel_capabilities_context_(v9, v10, @"com.apple.IMCore.IMCollaborationNoticeDispatcher", 512, 0);
  objc_super v11 = (IMDaemonMultiplexedConnectionManaging *)objc_claimAutoreleasedReturnValue();
  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = v11;
}

- (void)disconnectFromDaemon
{
  objc_msgSend_invalidate(self->_daemonConnection, a2, v2, v3);
}

- (IMDaemonMultiplexedConnectionManaging)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end