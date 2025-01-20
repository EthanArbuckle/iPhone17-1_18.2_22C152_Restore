@interface CKAPSMachServiceConnectionDelegate
- (APSConnection)connection;
- (CKAPSMachServiceConnectionDelegate)initWithConnection:(id)a3 key:(id)a4;
- (CKAPSMachServiceConnectionKey)key;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)setConnection:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation CKAPSMachServiceConnectionDelegate

- (CKAPSMachServiceConnectionDelegate)initWithConnection:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKAPSMachServiceConnectionDelegate;
  v8 = [(CKAPSMachServiceConnectionDelegate *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    uint64_t v13 = objc_msgSend_copy(v7, v10, v11, v12);
    key = v9->_key;
    v9->_key = (CKAPSMachServiceConnectionKey *)v13;

    objc_msgSend_setDelegate_(v6, v15, (uint64_t)v9, v16);
  }

  return v9;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v34 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  v10 = objc_msgSend_dictionaryWithCapacity_(v6, v8, 3, v9);
  v14 = objc_msgSend_key(self, v11, v12, v13);
  objc_super v18 = objc_msgSend_environmentName(v14, v15, v16, v17);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v19, (uint64_t)v18, @"environmentName");

  v23 = objc_msgSend_key(self, v20, v21, v22);
  v27 = objc_msgSend_namedDelegatePort(v23, v24, v25, v26);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v28, (uint64_t)v27, @"namedDelegatePort");

  if (v34) {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v29, (uint64_t)v34, @"publicToken");
  }
  v32 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v29, v30, v31);
  objc_msgSend_postNotificationName_object_userInfo_(v32, v33, @"CKAPSMachServiceConnectionDidReceivePublicTokenNotification", (uint64_t)v7, v10);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v40 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (void *)MEMORY[0x1E4F1CA60];
  id v13 = a3;
  uint64_t v16 = objc_msgSend_dictionaryWithCapacity_(v12, v14, 5, v15);
  v20 = objc_msgSend_key(self, v17, v18, v19);
  v24 = objc_msgSend_environmentName(v20, v21, v22, v23);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v25, (uint64_t)v24, @"environmentName");

  v29 = objc_msgSend_key(self, v26, v27, v28);
  v33 = objc_msgSend_namedDelegatePort(v29, v30, v31, v32);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v34, (uint64_t)v33, @"namedDelegatePort");

  if (v40) {
    objc_msgSend_setObject_forKeyedSubscript_(v16, v35, (uint64_t)v40, @"token");
  }
  if (v10) {
    objc_msgSend_setObject_forKeyedSubscript_(v16, v35, (uint64_t)v10, @"topic");
  }
  if (v11) {
    objc_msgSend_setObject_forKeyedSubscript_(v16, v35, (uint64_t)v11, @"identifier");
  }
  v38 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v35, v36, v37);
  objc_msgSend_postNotificationName_object_userInfo_(v38, v39, @"CKAPSMachServiceConnectionDidReceiveTokenNotification", (uint64_t)v13, v16);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v34 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v10 = objc_msgSend_dictionaryWithCapacity_(v6, v8, 3, v9);
  v14 = objc_msgSend_key(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_environmentName(v14, v15, v16, v17);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v19, (uint64_t)v18, @"environmentName");

  uint64_t v23 = objc_msgSend_key(self, v20, v21, v22);
  uint64_t v27 = objc_msgSend_namedDelegatePort(v23, v24, v25, v26);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v28, (uint64_t)v27, @"namedDelegatePort");

  if (v34) {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v29, (uint64_t)v34, @"message");
  }
  uint64_t v32 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v29, v30, v31);
  objc_msgSend_postNotificationName_object_userInfo_(v32, v33, @"CKAPSMachServiceConnectionDidReceiveIncomingMessageNotification", (uint64_t)v7, v10);
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v37 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = a3;
  uint64_t v13 = objc_msgSend_dictionaryWithCapacity_(v9, v11, 4, v12);
  uint64_t v17 = objc_msgSend_key(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_environmentName(v17, v18, v19, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v13, v22, (uint64_t)v21, @"environmentName");

  uint64_t v26 = objc_msgSend_key(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_namedDelegatePort(v26, v27, v28, v29);
  objc_msgSend_setObject_forKeyedSubscript_(v13, v31, (uint64_t)v30, @"namedDelegatePort");

  if (v37) {
    objc_msgSend_setObject_forKeyedSubscript_(v13, v32, (uint64_t)v37, @"topic");
  }
  if (v8) {
    objc_msgSend_setObject_forKeyedSubscript_(v13, v32, (uint64_t)v8, @"userInfo");
  }
  v35 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v32, v33, v34);
  objc_msgSend_postNotificationName_object_userInfo_(v35, v36, @"CKAPSMachServiceConnectionDidReceiveMessageForTopicNotification", (uint64_t)v10, v13);
}

- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4
{
  id v34 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v10 = objc_msgSend_dictionaryWithCapacity_(v6, v8, 5, v9);
  v14 = objc_msgSend_key(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_environmentName(v14, v15, v16, v17);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v19, (uint64_t)v18, @"environmentName");

  uint64_t v23 = objc_msgSend_key(self, v20, v21, v22);
  uint64_t v27 = objc_msgSend_namedDelegatePort(v23, v24, v25, v26);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v28, (uint64_t)v27, @"namedDelegatePort");

  if (v34) {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v29, (uint64_t)v34, @"message");
  }
  uint64_t v32 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v29, v30, v31);
  objc_msgSend_postNotificationName_object_userInfo_(v32, v33, @"CKAPSMachServiceConnectionDidSendOutgoingMessageNotification", (uint64_t)v7, v10);
}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  id v37 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = a3;
  uint64_t v13 = objc_msgSend_dictionaryWithCapacity_(v9, v11, 4, v12);
  uint64_t v17 = objc_msgSend_key(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_environmentName(v17, v18, v19, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v13, v22, (uint64_t)v21, @"environmentName");

  uint64_t v26 = objc_msgSend_key(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_namedDelegatePort(v26, v27, v28, v29);
  objc_msgSend_setObject_forKeyedSubscript_(v13, v31, (uint64_t)v30, @"namedDelegatePort");

  if (v37) {
    objc_msgSend_setObject_forKeyedSubscript_(v13, v32, (uint64_t)v37, @"message");
  }
  if (v8) {
    objc_msgSend_setObject_forKeyedSubscript_(v13, v32, (uint64_t)v8, @"error");
  }
  v35 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v32, v33, v34);
  objc_msgSend_postNotificationName_object_userInfo_(v35, v36, @"CKAPSMachServiceConnectionDidFailToSendOutgoingMessageNotification", (uint64_t)v10, v13);
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  objc_msgSend_dictionaryWithCapacity_(v6, v8, 3, v9);
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_key(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_environmentName(v13, v14, v15, v16);
  objc_msgSend_setObject_forKeyedSubscript_(v37, v18, (uint64_t)v17, @"environmentName");

  uint64_t v22 = objc_msgSend_key(self, v19, v20, v21);
  uint64_t v26 = objc_msgSend_namedDelegatePort(v22, v23, v24, v25);
  objc_msgSend_setObject_forKeyedSubscript_(v37, v27, (uint64_t)v26, @"namedDelegatePort");

  uint64_t v30 = objc_msgSend_numberWithBool_(NSNumber, v28, v4, v29);
  objc_msgSend_setObject_forKeyedSubscript_(v37, v31, (uint64_t)v30, @"connected");

  v35 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v32, v33, v34);
  objc_msgSend_postNotificationName_object_userInfo_(v35, v36, @"CKAPSMachServiceConnectionDidChangeConnectedStatusNotification", (uint64_t)v7, v37);
}

- (void)connectionDidReconnect:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  objc_msgSend_dictionaryWithCapacity_(v4, v6, 2, v7);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_key(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_environmentName(v11, v12, v13, v14);
  objc_msgSend_setObject_forKeyedSubscript_(v31, v16, (uint64_t)v15, @"environmentName");

  uint64_t v20 = objc_msgSend_key(self, v17, v18, v19);
  uint64_t v24 = objc_msgSend_namedDelegatePort(v20, v21, v22, v23);
  objc_msgSend_setObject_forKeyedSubscript_(v31, v25, (uint64_t)v24, @"namedDelegatePort");

  uint64_t v29 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v26, v27, v28);
  objc_msgSend_postNotificationName_object_userInfo_(v29, v30, @"CKAPSMachServiceConnectionDidReconnectNotification", (uint64_t)v5, v31);
}

- (APSConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (APSConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (CKAPSMachServiceConnectionKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);

  objc_destroyWeak((id *)&self->_connection);
}

@end