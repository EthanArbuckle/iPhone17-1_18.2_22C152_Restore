@interface IMSendEmergencyMessage
- (IMDaemonProtocol)daemon;
- (IMSendEmergencyMessage)init;
- (IMSendEmergencyMessage)initWithDaemon:(id)a3;
- (void)daemonConnectionLost;
- (void)daemonControllerDidDisconnect;
- (void)dealloc;
- (void)locationUpdateSent;
- (void)sendEmergencyQuestionnaire:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setUpConnectionToDaemaon;
@end

@implementation IMSendEmergencyMessage

- (IMSendEmergencyMessage)init
{
  v5 = objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  v8 = (IMSendEmergencyMessage *)objc_msgSend_initWithDaemon_(self, v6, (uint64_t)v5, v7);

  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = 0;
        v11 = "Success init";
        v12 = (uint8_t *)&v15;
LABEL_8:
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v9)
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = 0;
      v11 = "Failed init";
      v12 = (uint8_t *)&v14;
      goto LABEL_8;
    }
LABEL_9:
  }
  return v8;
}

- (void)sendEmergencyQuestionnaire:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Sending request to daemon to send emergency questionnaire", v8, 2u);
    }
  }
  objc_msgSend_sendEmergencyQuestionnaire_(self->_daemon, v5, (uint64_t)v4, v6);
}

- (void)locationUpdateSent
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Sending a location update", v7, 2u);
    }
  }
  objc_msgSend_locationUpdateSent(self->_daemon, v3, v4, v5);
}

- (IMSendEmergencyMessage)initWithDaemon:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMSendEmergencyMessage;
  uint64_t v5 = [(IMSendEmergencyMessage *)&v13 init];
  v8 = v5;
  if (v5)
  {
    objc_msgSend_setDaemon_(v5, v6, (uint64_t)v4, v7);
    objc_msgSend_setUpConnectionToDaemaon(v8, v9, v10, v11);
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  objc_msgSend_setDelegate_(self->_daemon, v8, 0, v9);
  objc_msgSend_setDaemon_(self, v10, 0, v11);
  v12.receiver = self;
  v12.super_class = (Class)IMSendEmergencyMessage;
  [(IMSendEmergencyMessage *)&v12 dealloc];
}

- (void)setUpConnectionToDaemaon
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Setting up IMAgent connect for Stewie emergency message", buf, 2u);
    }
  }
  objc_msgSend_setDelegate_(self->_daemon, v3, (uint64_t)self, v4);
  uint64_t v9 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v6, v7, v8);
  objc_super v13 = objc_msgSend_bundleIdentifier(v9, v10, v11, v12);

  v16 = objc_msgSend_stringWithFormat_(NSString, v14, @"%@-SendEmergencyMessage", v15, v13);
  objc_msgSend_addListenerID_capabilities_(self->_daemon, v17, (uint64_t)v16, *MEMORY[0x1E4F6C558]);
  daemon = self->_daemon;
  uint64_t v22 = objc_msgSend_capabilities(daemon, v19, v20, v21);
  objc_msgSend_connectToDaemonWithLaunch_capabilities_blockUntilConnected_(daemon, v23, 0, v22, 0);
}

- (void)daemonControllerDidDisconnect
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1A4AF7000, v2, OS_LOG_TYPE_INFO, "Did disconnect from daemon", v3, 2u);
    }
  }
}

- (void)daemonConnectionLost
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1A4AF7000, v2, OS_LOG_TYPE_INFO, "Lost connection daemon", v3, 2u);
    }
  }
}

- (IMDaemonProtocol)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end