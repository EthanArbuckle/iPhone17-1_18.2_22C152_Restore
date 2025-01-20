@interface IDSRemoteCredential
- (BOOL)_connect;
- (BOOL)_disconnect;
- (BOOL)wantsRetries;
- (void)_disconnected;
- (void)_sendMessage:(id)a3 withCompletionBlock:(id)a4;
- (void)dealloc;
- (void)fetchRemoteAccountsOfServiceTypes:(id)a3 withCompletionBlock:(id)a4;
- (void)fetchRemoteiMessageAndFaceTimeAccountInfoWithCompletionBlock:(id)a3;
- (void)requestIDStatusForURIs:(id)a3 service:(id)a4 lightQuery:(BOOL)a5 allowQuery:(BOOL)a6 completionBlock:(id)a7;
- (void)sendAccountSyncMessage:(id)a3 messageID:(id)a4 queueOneIdentifier:(id)a5 allowCloudFallback:(BOOL)a6 completionBlock:(id)a7;
- (void)sendIDSLocalDeviceInfoRequestWithCompletionBlock:(id)a3;
- (void)setWantsRetries:(BOOL)a3;
@end

@implementation IDSRemoteCredential

- (void)_disconnected
{
  if (self->_connection)
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEBUG, "Clearing out _connection, we're disconnected", v9, 2u);
    }

    uint64_t v4 = os_log_shim_legacy_logging_enabled();
    if (v4)
    {
      sub_19DB6E4C8(v4, v5, @"Clearing out _connection, we're disconnected");
      sub_19DB6E53C(v6, v7, @"Clearing out _connection, we're disconnected");
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    xpc_connection_cancel(self->_connection);
    connection = self->_connection;
    self->_connection = 0;
  }
}

- (BOOL)_disconnect
{
  if (self->_connection)
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19D9BE000, v3, OS_LOG_TYPE_DEBUG, "Forcing a disconnect, terminating connection", v10, 2u);
    }

    uint64_t v4 = os_log_shim_legacy_logging_enabled();
    if (v4)
    {
      sub_19DB6E4C8(v4, v5, @"Forcing a disconnect, terminating connection");
      sub_19DB6E53C(v6, v7, @"Forcing a disconnect, terminating connection");
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    xpc_connection_cancel(self->_connection);
    connection = self->_connection;
    self->_connection = 0;
  }
  return 1;
}

- (BOOL)_connect
{
  connection = self->_connection;
  if (!connection)
  {
    uint64_t v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to credential agent", buf, 2u);
    }

    uint64_t v5 = os_log_shim_legacy_logging_enabled();
    if (v5)
    {
      sub_19DB6E4C8(v5, (uint64_t)v6, @"Connecting to credential agent");
      sub_19DB6E53C(v9, v10, @"Connecting to credential agent");
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    objc_msgSend_UTF8String(@"com.apple.idscredentialsagent.embedded.auth", v6, v7, v8);
    v11 = im_primary_queue();
    v12 = (OS_xpc_object *)IMXPCCreateConnectionForServiceWithQueue();
    v13 = self->_connection;
    self->_connection = v12;

    IMXPCConfigureConnection();
    connection = self->_connection;
  }
  return connection != 0;
}

- (void)dealloc
{
  objc_msgSend__disconnect(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IDSRemoteCredential;
  [(IDSRemoteCredential *)&v5 dealloc];
}

- (void)fetchRemoteiMessageAndFaceTimeAccountInfoWithCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_super v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "** SENDING remote fetch iMessage account info request:", buf, 2u);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled();
  if (v6)
  {
    sub_19DB6E4C8(v6, v7, @"** SENDING remote fetch iMessage account info request:");
    sub_19DB6E53C(v8, v9, @"** SENDING remote fetch iMessage account info request:");
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  IMInsertIntsToXPCDictionary();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_19DB6EAD8;
  v14[3] = &unk_1E5975BA8;
  id v15 = v4;
  id v11 = v4;
  objc_msgSend__sendMessage_withCompletionBlock_(self, v12, (uint64_t)v10, v13, v14, 9, 0);
}

- (void)fetchRemoteAccountsOfServiceTypes:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "** SENDING remote fetch remote accounts of Service Types info request:", buf, 2u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled();
  if (v9)
  {
    sub_19DB6E4C8(v9, v10, @"** SENDING remote fetch remote accounts of Service Types info request:");
    sub_19DB6E53C(v11, v12, @"** SENDING remote fetch remote accounts of Service Types info request:");
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  IMInsertIntsToXPCDictionary();
  IMInsertArraysToXPCDictionary();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_19DB6EE7C;
  v17[3] = &unk_1E5975BA8;
  id v18 = v7;
  id v14 = v7;
  objc_msgSend__sendMessage_withCompletionBlock_(self, v15, (uint64_t)v13, v16, v17, v6, 0);
}

- (void)sendIDSLocalDeviceInfoRequestWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "Sending local device info request through credentials agent", buf, 2u);
  }

  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  if (v9)
  {
    IMInsertIntsToXPCDictionary();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_19DB6F19C;
    v12[3] = &unk_1E5975BA8;
    id v13 = v4;
    objc_msgSend__sendMessage_withCompletionBlock_(self, v10, (uint64_t)v9, v11, v12, 11, 0);
  }
}

- (void)requestIDStatusForURIs:(id)a3 service:(id)a4 lightQuery:(BOOL)a5 allowQuery:(BOOL)a6 completionBlock:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "** SENDING remote ID Query request V2 (New and Improved!!!) :", buf, 2u);
  }

  uint64_t v15 = os_log_shim_legacy_logging_enabled();
  if (v15)
  {
    sub_19DB6E4C8(v15, (uint64_t)v16, @"** SENDING remote ID Query request V2 (New and Improved!!!) :");
    sub_19DB6E53C(v18, v19, @"** SENDING remote ID Query request V2 (New and Improved!!!) :");
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  v20 = objc_msgSend___imArrayByApplyingBlock_(v11, v16, (uint64_t)&unk_1EEFCD8D8, v17);
  xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
  IMInsertIntsToXPCDictionary();
  IMInsertArraysToXPCDictionary();
  IMInsertNSStringsToXPCDictionary();
  IMInsertBoolsToXPCDictionary();
  IMInsertBoolsToXPCDictionary();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_19DB6F4D4;
  v26[3] = &unk_1E5975CB0;
  id v27 = v12;
  id v28 = v13;
  id v22 = v13;
  id v23 = v12;
  objc_msgSend__sendMessage_withCompletionBlock_(self, v24, (uint64_t)v21, v25, v26, v8, 0);
}

- (void)sendAccountSyncMessage:(id)a3 messageID:(id)a4 queueOneIdentifier:(id)a5 allowCloudFallback:(BOOL)a6 completionBlock:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v19 = objc_msgSend_accountSync(MEMORY[0x1E4F6C3B8], v16, v17, v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "Sending account sync message to credentials agent", buf, 2u);
  }

  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  if (v20)
  {
    IMInsertIntsToXPCDictionary();
    IMInsertCodableObjectsToXPCDictionary();
    IMInsertNSStringsToXPCDictionary();
    IMInsertBoolsToXPCDictionary();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_19DB6FD60;
    v23[3] = &unk_1E5975CD8;
    id v25 = v15;
    id v24 = v13;
    objc_msgSend__sendMessage_withCompletionBlock_(self, v21, (uint64_t)v20, v22, v23, v8, 0);
  }
}

- (void)_sendMessage:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend__connect(self, v8, v9, v10))
  {
    id v11 = (void *)MEMORY[0x19F3AF9A0](v6);
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = v11;
      _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "Sending remote credential request %s", buf, 0xCu);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled();
    if (v13)
    {
      sub_19DB6E4C8(v13, v14, @"Sending remote credential request %s");
      sub_19DB6E53C(v15, v16, @"Sending remote credential request %s");
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    free(v11);
    connection = self->_connection;
    double v18 = im_primary_queue();
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_19DB7005C;
    handler[3] = &unk_1E5975D28;
    id v21 = v7;
    handler[4] = self;
    id v20 = v6;
    xpc_connection_send_message_with_reply(connection, v20, v18, handler);
  }
}

- (BOOL)wantsRetries
{
  return self->_wantsRetries;
}

- (void)setWantsRetries:(BOOL)a3
{
  self->_wantsRetries = a3;
}

- (void).cxx_destruct
{
}

@end