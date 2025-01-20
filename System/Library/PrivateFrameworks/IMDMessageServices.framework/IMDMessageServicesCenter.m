@interface IMDMessageServicesCenter
+ (id)sharedInstance;
- (BOOL)_connect;
- (BOOL)_disconnect;
- (IMDMessageServicesCenter)init;
- (void)_disconnected;
- (void)_requestExpireStateWithGUID:(id)a3 handler:(id)a4;
- (void)_requestRoutingWithGUID:(id)a3 chatGUID:(id)a4 downgradableServices:(id)a5 error:(unsigned int)a6 handler:(id)a7;
- (void)_requestScheduleMessagesWithGUID:(id)a3 handler:(id)a4;
- (void)_requestWatchdogWithGUID:(id)a3 handler:(id)a4;
- (void)dealloc;
- (void)requestExpireStateForMessageGuid:(id)a3 completionBlock:(id)a4;
- (void)requestExpireStateWithCompletion:(id)a3;
- (void)requestRoutingForMessageGuid:(id)a3 inChat:(id)a4 downgradableServices:(id)a5 error:(unsigned int)a6 completionBlock:(id)a7;
- (void)requestRoutingWithDowngradableServices:(id)a3 completion:(id)a4;
- (void)requestScheduledMessageForGuid:(id)a3 completionBlock:(id)a4;
- (void)requestScheduledMessagesWithCompletion:(id)a3;
- (void)requestWatchdogForMessageGuid:(id)a3 completionBlock:(id)a4;
- (void)requestWatchdogWithCompletion:(id)a3;
@end

@implementation IMDMessageServicesCenter

+ (id)sharedInstance
{
  if (qword_26AC136C8 != -1) {
    dispatch_once(&qword_26AC136C8, &unk_26DB65EF8);
  }
  return (id)qword_26AC136D0;
}

- (IMDMessageServicesCenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageServicesCenter;
  return [(IMDMessageServicesCenter *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IMDMessageServicesCenter;
  [(IMDMessageServicesCenter *)&v2 dealloc];
}

- (void)_disconnected
{
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_22743F000, v3, OS_LOG_TYPE_DEBUG, "Clearing out _connection, we're disconnected", v5, 2u);
    }
  }
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    xpc_release(self->_connection);
    self->_connection = 0;
  }
}

- (BOOL)_disconnect
{
  if (self->_connection)
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_22743F000, v3, OS_LOG_TYPE_DEBUG, "Forcing a disconnect, terminating connection", v5, 2u);
      }
    }
    xpc_connection_cancel(self->_connection);
    xpc_release(self->_connection);
    self->_connection = 0;
  }
  return 1;
}

- (BOOL)_connect
{
  connection = self->_connection;
  if (!connection)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22743F000, v4, OS_LOG_TYPE_INFO, "Connecting to message services agent", buf, 2u);
      }
    }
    self->_connection = (OS_xpc_object *)IMXPCCreateConnectionForServiceWithQueue();
    IMXPCConfigureConnection();
    connection = self->_connection;
  }
  return connection != 0;
}

- (void)_requestRoutingWithGUID:(id)a3 chatGUID:(id)a4 downgradableServices:(id)a5 error:(unsigned int)a6 handler:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  if ([(IMDMessageServicesCenter *)self _connect])
  {
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    IMInsertStringsToXPCDictionary();
    uint64_t v15 = v8;
    IMInsertIntsToXPCDictionary();
    if (a3)
    {
      uint64_t v15 = objc_msgSend(a3, "UTF8String", v8, 0);
      IMInsertStringsToXPCDictionary();
    }
    if (a4)
    {
      uint64_t v15 = [a4 UTF8String];
      IMInsertStringsToXPCDictionary();
    }
    if (objc_msgSend(a5, "count", v15, 0)) {
      IMInsertArraysToXPCDictionary();
    }
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_227440494;
    handler[3] = &unk_264807940;
    handler[4] = a7;
    xpc_connection_send_message_with_reply(self->_connection, v13, MEMORY[0x263EF83A0], handler);
    xpc_release(v13);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22743F000, v14, OS_LOG_TYPE_INFO, "Unable to connect to message services agent", buf, 2u);
      }
    }
    if (a7) {
      (*((void (**)(id, void, double))a7 + 2))(a7, 0, 0.0);
    }
  }
}

- (void)requestRoutingWithDowngradableServices:(id)a3 completion:(id)a4
{
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_22743F000, v7, OS_LOG_TYPE_INFO, "MessageServices received request for routing", v8, 2u);
    }
  }
  [(IMDMessageServicesCenter *)self _requestRoutingWithGUID:0 chatGUID:0 downgradableServices:a3 error:0 handler:a4];
}

- (void)requestRoutingForMessageGuid:(id)a3 inChat:(id)a4 downgradableServices:(id)a5 error:(unsigned int)a6 completionBlock:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    xpc_object_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      id v15 = a3;
      __int16 v16 = 1024;
      int v17 = v8;
      _os_log_impl(&dword_22743F000, v13, OS_LOG_TYPE_INFO, "MessageServices received request for routing for guid:%@  error:%d", (uint8_t *)&v14, 0x12u);
    }
  }
  [(IMDMessageServicesCenter *)self _requestRoutingWithGUID:a3 chatGUID:a4 downgradableServices:a5 error:v8 handler:a7];
}

- (void)_requestExpireStateWithGUID:(id)a3 handler:(id)a4
{
  if ([(IMDMessageServicesCenter *)self _connect])
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    IMInsertStringsToXPCDictionary();
    if (a3)
    {
      objc_msgSend(a3, "UTF8String", "expire", 0);
      IMInsertStringsToXPCDictionary();
    }
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_227440B08;
    handler[3] = &unk_264807940;
    handler[4] = a4;
    xpc_connection_send_message_with_reply(self->_connection, v7, MEMORY[0x263EF83A0], handler);
    xpc_release(v7);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22743F000, v8, OS_LOG_TYPE_INFO, "Unable to connect to message services agent", buf, 2u);
      }
    }
    if (a4) {
      (*((void (**)(id, void, double))a4 + 2))(a4, 0, 0.0);
    }
  }
}

- (void)requestExpireStateWithCompletion:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22743F000, v5, OS_LOG_TYPE_INFO, "MessageServices received request for expire state", v6, 2u);
    }
  }
  [(IMDMessageServicesCenter *)self _requestExpireStateWithGUID:0 handler:a3];
}

- (void)requestExpireStateForMessageGuid:(id)a3 completionBlock:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    xpc_object_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = a3;
      _os_log_impl(&dword_22743F000, v7, OS_LOG_TYPE_INFO, "MessageServices received request for expire state for guid: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [(IMDMessageServicesCenter *)self _requestExpireStateWithGUID:a3 handler:a4];
}

- (void)_requestWatchdogWithGUID:(id)a3 handler:(id)a4
{
  if ([(IMDMessageServicesCenter *)self _connect])
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    IMInsertStringsToXPCDictionary();
    if (a3)
    {
      objc_msgSend(a3, "UTF8String", "watchdog", 0);
      IMInsertStringsToXPCDictionary();
    }
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_227441138;
    handler[3] = &unk_264807940;
    handler[4] = a4;
    xpc_connection_send_message_with_reply(self->_connection, v7, MEMORY[0x263EF83A0], handler);
    xpc_release(v7);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22743F000, v8, OS_LOG_TYPE_INFO, "Unable to connect to message services agent", buf, 2u);
      }
    }
    if (a4) {
      (*((void (**)(id, void, double))a4 + 2))(a4, 0, 0.0);
    }
  }
}

- (void)requestWatchdogWithCompletion:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22743F000, v5, OS_LOG_TYPE_INFO, "MessageServices received request for watchdog", v6, 2u);
    }
  }
  [(IMDMessageServicesCenter *)self _requestWatchdogWithGUID:0 handler:a3];
}

- (void)requestWatchdogForMessageGuid:(id)a3 completionBlock:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    xpc_object_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = a3;
      _os_log_impl(&dword_22743F000, v7, OS_LOG_TYPE_INFO, "MessageServices received request for watchdog for guid: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [(IMDMessageServicesCenter *)self _requestWatchdogWithGUID:a3 handler:a4];
}

- (void)_requestScheduleMessagesWithGUID:(id)a3 handler:(id)a4
{
  if ([(IMDMessageServicesCenter *)self _connect])
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    IMInsertStringsToXPCDictionary();
    if (a3)
    {
      objc_msgSend(a3, "UTF8String", "scheduled", 0);
      IMInsertStringsToXPCDictionary();
    }
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_22744176C;
    handler[3] = &unk_264807940;
    handler[4] = a4;
    xpc_connection_send_message_with_reply(self->_connection, v7, MEMORY[0x263EF83A0], handler);
    xpc_release(v7);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22743F000, v8, OS_LOG_TYPE_INFO, "Unable to connect to message services agent", buf, 2u);
      }
    }
    if (a4) {
      (*((void (**)(id, void, double))a4 + 2))(a4, 0, 60.0);
    }
  }
}

- (void)requestScheduledMessagesWithCompletion:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22743F000, v5, OS_LOG_TYPE_INFO, "MessageServices received request for Schedule Messages", v6, 2u);
    }
  }
  [(IMDMessageServicesCenter *)self _requestScheduleMessagesWithGUID:0 handler:a3];
}

- (void)requestScheduledMessageForGuid:(id)a3 completionBlock:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    xpc_object_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = a3;
      _os_log_impl(&dword_22743F000, v7, OS_LOG_TYPE_INFO, "MessageServices received request for Schedule Messages for guid: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [(IMDMessageServicesCenter *)self _requestScheduleMessagesWithGUID:a3 handler:a4];
}

@end