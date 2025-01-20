@interface IMBackgroundMessagingAPIConnection
- (IMBackgroundMessagingAPIConnection)init;
- (id)_backgroundMessagingAPIServiceWithErrorHandler:(id)a3;
- (id)_currentConnection;
- (void)_clearConnection;
- (void)checkAuthorizationStatusForRecipients:(id)a3 completion:(id)a4;
- (void)requestBackgroundMessagingAuthorizationForRecipients:(id)a3 completion:(id)a4;
- (void)sendBackgroundMessage:(id)a3 toRecipient:(id)a4 completion:(id)a5;
@end

@implementation IMBackgroundMessagingAPIConnection

- (IMBackgroundMessagingAPIConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMBackgroundMessagingAPIConnection;
  v2 = [(IMBackgroundMessagingAPIConnection *)&v6 init];
  dispatch_queue_t v3 = dispatch_queue_create("IMBackgroundMessagingAPIConnectionQueue", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  return v2;
}

- (id)_currentConnection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    objc_super v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.messages.critical-messaging", 0);
    v7 = self->_connection;
    self->_connection = v6;

    objc_msgSend__setQueue_(self->_connection, v8, (uint64_t)self->_queue, v9);
    id location = 0;
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1A4BCC67C;
    v26[3] = &unk_1E5B7ADC8;
    objc_copyWeak(&v27, &location);
    objc_msgSend_setInvalidationHandler_(v10, v11, (uint64_t)v26, v12);
    v13 = self->_connection;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1A4BCC724;
    v24[3] = &unk_1E5B7ADC8;
    objc_copyWeak(&v25, &location);
    objc_msgSend_setInterruptionHandler_(v13, v14, (uint64_t)v24, v15);
    v16 = self->_connection;
    v17 = IMDaemonBackgroundMessagingProtocolXPCInterface();
    objc_msgSend_setRemoteObjectInterface_(v16, v18, (uint64_t)v17, v19);

    objc_msgSend_resume(self->_connection, v20, v21, v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

- (void)_clearConnection
{
  objc_msgSend_invalidate(self->_connection, a2, v2, v3);
  connection = self->_connection;
  self->_connection = 0;
}

- (id)_backgroundMessagingAPIServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend__currentConnection(self, v5, v6, v7);
  v11 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (void)requestBackgroundMessagingAuthorizationForRecipients:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "requestBackgroundMessagingAuthorizationForRecipients", buf, 2u);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4BCC9AC;
  block[3] = &unk_1E5B7D1C8;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)checkAuthorizationStatusForRecipients:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "checkAuthorizationStatusForRecipients", buf, 2u);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4BCCC48;
  block[3] = &unk_1E5B7D1C8;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)sendBackgroundMessage:(id)a3 toRecipient:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "sendBackgroundMessage", buf, 2u);
    }
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1A4BCCF0C;
  v16[3] = &unk_1E5B7D1F0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  dispatch_async(queue, v16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end