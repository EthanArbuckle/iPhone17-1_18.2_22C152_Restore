@interface AudioAppleSiriRemoteInputPlugin
- (AVAudioRemoteInputPluginDelegate)delegate;
- (AudioAppleSiriRemoteInputPlugin)initWithPluginDelegate:(id)a3;
- (NSArray)devices;
- (NSMutableSet)inputDevices;
- (OS_xpc_object)xpcConnection;
- (id)_inputDeviceForArgs:(id)a3;
- (id)sendSyncMsg:(id)a3 args:(id)a4;
- (void)_RequestSiriAudioConnection;
- (void)_checkIn;
- (void)_handleAudioFrameMsg:(id)a3;
- (void)_handleError:(id)a3;
- (void)_handleEvent:(id)a3;
- (void)_handleMsg:(id)a3;
- (void)_handlePublishMsg:(id)a3;
- (void)_handleStreamDidCancelMsg:(id)a3;
- (void)_handleTransportDidStartMsg:(id)a3;
- (void)_handleTransportDidStopMsg:(id)a3;
- (void)_handleUnpublishMsg:(id)a3;
- (void)invalidate;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation AudioAppleSiriRemoteInputPlugin

- (AudioAppleSiriRemoteInputPlugin)initWithPluginDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AudioAppleSiriRemoteInputPlugin;
  v5 = [(AudioAppleSiriRemoteInputPlugin *)&v11 init];
  if (v5)
  {
    sub_1B94("AudioAppleSiriRemoteInputPlugin");
    v6 = qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Initializing siri remote plugin", v10, 2u);
    }
    [(AudioAppleSiriRemoteInputPlugin *)v5 setDelegate:v4];
    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    inputDevices = v5->_inputDevices;
    v5->_inputDevices = v7;
  }
  return v5;
}

- (NSArray)devices
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(AudioAppleSiriRemoteInputPlugin *)v2 xpcConnection];

  if (!v3) {
    [(AudioAppleSiriRemoteInputPlugin *)v2 _RequestSiriAudioConnection];
  }
  objc_sync_exit(v2);

  id v4 = [(AudioAppleSiriRemoteInputPlugin *)v2 inputDevices];
  objc_sync_enter(v4);
  v5 = (id)qword_D420;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(AudioAppleSiriRemoteInputPlugin *)v2 inputDevices];
    int v10 = 138412290;
    objc_super v11 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "AudioAppleSiriRemoteInputPlugin Get devices %@", (uint8_t *)&v10, 0xCu);
  }
  v7 = [(AudioAppleSiriRemoteInputPlugin *)v2 inputDevices];
  v8 = [v7 allObjects];

  objc_sync_exit(v4);

  return (NSArray *)v8;
}

- (void)invalidate
{
  os_unfair_lock_lock(&stru_D428);
  v3 = qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    xpcConnection = self->_xpcConnection;
    int v7 = 134217984;
    v8 = xpcConnection;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "AudioAppleSiriRemoteInputPlugin invalidate xpc connection %p", (uint8_t *)&v7, 0xCu);
  }
  v5 = self->_xpcConnection;
  if (v5)
  {
    xpc_connection_cancel(v5);
    v6 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
  os_unfair_lock_unlock(&stru_D428);
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6 = a4;
  *(_OWORD *)keys = *(_OWORD *)off_82C0;
  xpc_object_t v12 = xpc_string_create((const char *)[a3 UTF8String]);
  uint64_t v13 = _CFXPCCreateXPCObjectFromCFObject();
  if (v6) {
    size_t v7 = 2;
  }
  else {
    size_t v7 = 1;
  }
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)keys, &v12, v7);
  os_unfair_lock_lock(&stru_D428);
  if (self->_xpcConnection)
  {
    v9 = [(AudioAppleSiriRemoteInputPlugin *)self xpcConnection];
    xpc_connection_send_message(v9, v8);
  }
  else
  {
    int v10 = qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_4C0C(v10);
    }
  }
  os_unfair_lock_unlock(&stru_D428);

  for (uint64_t i = 8; i != -8; i -= 8)
}

- (id)sendSyncMsg:(id)a3 args:(id)a4
{
  id v6 = a4;
  *(_OWORD *)keys = *(_OWORD *)off_82C0;
  xpc_object_t v15 = xpc_string_create((const char *)[a3 UTF8String]);
  uint64_t v16 = _CFXPCCreateXPCObjectFromCFObject();
  if (v6) {
    size_t v7 = 2;
  }
  else {
    size_t v7 = 1;
  }
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)keys, &v15, v7);
  os_unfair_lock_lock(&stru_D428);
  if (self->_xpcConnection)
  {
    v9 = [(AudioAppleSiriRemoteInputPlugin *)self xpcConnection];
    xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(v9, v8);

    os_unfair_lock_unlock(&stru_D428);
  }
  else
  {
    os_unfair_lock_unlock(&stru_D428);
    objc_super v11 = qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_4C50(v11);
    }
    xpc_object_t v10 = &_xpc_error_connection_invalid;
    id v12 = &_xpc_error_connection_invalid;
  }

  for (uint64_t i = 8; i != -8; i -= 8)

  return v10;
}

- (void)_checkIn
{
  v3 = qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    xpcConnection = self->_xpcConnection;
    *(_DWORD *)buf = 134217984;
    v24 = xpcConnection;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Send CheckIn to xpc connection %p", buf, 0xCu);
  }
  v5 = [(AudioAppleSiriRemoteInputPlugin *)self sendSyncMsg:@"CheckIn" args:0];
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v10 = xpc_dictionary_get_value(v5, "kMsgArgs");
    objc_super v11 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    id v12 = v11;
    if (v11)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v13 = v11;
      id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            -[AudioAppleSiriRemoteInputPlugin _handlePublishMsg:](self, "_handlePublishMsg:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v17), (void)v18);
            v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v15);
      }
    }
  }
  else
  {
    os_unfair_lock_lock(&stru_D428);
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_4C94();
    }
    id v6 = self->_xpcConnection;
    if (v6)
    {
      xpc_connection_cancel(v6);
      size_t v7 = qword_D420;
      if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
      {
        xpc_object_t v8 = self->_xpcConnection;
        *(_DWORD *)buf = 134217984;
        v24 = v8;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Canceling xpc connection: %p", buf, 0xCu);
      }
      v9 = self->_xpcConnection;
      self->_xpcConnection = 0;
    }
    os_unfair_lock_unlock(&stru_D428);
  }
}

- (void)_handlePublishMsg:(id)a3
{
  id v4 = a3;
  v5 = [[AudioAppleSiriRemoteInputDevice alloc] initWithInfo:v4];
  if (v5)
  {
    id v6 = (void *)qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
    {
      size_t v7 = v6;
      xpc_object_t v8 = [(AudioAppleSiriRemoteInputDevice *)v5 identifier];
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Publishing remote %@", (uint8_t *)&v12, 0xCu);
    }
    [(AudioAppleSiriRemoteInputDevice *)v5 setPlugin:self];
    v9 = [(AudioAppleSiriRemoteInputPlugin *)self inputDevices];
    objc_sync_enter(v9);
    xpc_object_t v10 = [(AudioAppleSiriRemoteInputPlugin *)self inputDevices];
    [v10 addObject:v5];

    objc_sync_exit(v9);
    objc_super v11 = [(AudioAppleSiriRemoteInputPlugin *)self delegate];
    [v11 inputPlugin:self didPublishDevice:v5];
  }
}

- (void)_handleUnpublishMsg:(id)a3
{
  id v4 = a3;
  v5 = [(AudioAppleSiriRemoteInputPlugin *)self _inputDeviceForArgs:v4];
  id v6 = (void *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    size_t v7 = v6;
    xpc_object_t v8 = [v5 identifier];
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Unpublishing remote %@", (uint8_t *)&v12, 0xCu);
  }
  [v5 invalidate];
  v9 = [(AudioAppleSiriRemoteInputPlugin *)self inputDevices];
  objc_sync_enter(v9);
  xpc_object_t v10 = [(AudioAppleSiriRemoteInputPlugin *)self inputDevices];
  [v10 removeObject:v5];

  objc_sync_exit(v9);
  objc_super v11 = [(AudioAppleSiriRemoteInputPlugin *)self delegate];
  [v11 inputPlugin:self didUnpublishDevice:v5];
}

- (void)_handleTransportDidStartMsg:(id)a3
{
  id v4 = a3;
  v5 = [(AudioAppleSiriRemoteInputPlugin *)self _inputDeviceForArgs:v4];
  id v6 = (void *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    size_t v7 = v6;
    xpc_object_t v8 = [v5 identifier];
    int v9 = 138412290;
    xpc_object_t v10 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Transport did start to remote %@", (uint8_t *)&v9, 0xCu);
  }
  [v5 handleTransportDidStartMsg:v4];
}

- (void)_handleTransportDidStopMsg:(id)a3
{
  id v4 = a3;
  v5 = [(AudioAppleSiriRemoteInputPlugin *)self _inputDeviceForArgs:v4];
  id v6 = (void *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    size_t v7 = v6;
    xpc_object_t v8 = [v5 identifier];
    int v9 = 138412290;
    xpc_object_t v10 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Transport did stop to remote %@", (uint8_t *)&v9, 0xCu);
  }
  [v5 handleTransportDidStopMsg:v4];
}

- (void)_handleAudioFrameMsg:(id)a3
{
  id v4 = a3;
  id v5 = [(AudioAppleSiriRemoteInputPlugin *)self _inputDeviceForArgs:v4];
  [v5 handleAudioFrameMsg:v4];
}

- (void)_handleStreamDidCancelMsg:(id)a3
{
  id v4 = a3;
  id v5 = [(AudioAppleSiriRemoteInputPlugin *)self _inputDeviceForArgs:v4];
  id v6 = (void *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    size_t v7 = v6;
    xpc_object_t v8 = [v5 identifier];
    int v9 = 138412290;
    xpc_object_t v10 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Stream did cancel to remote %@", (uint8_t *)&v9, 0xCu);
  }
  [v5 handleStreamDidCancelMsg:v4];
}

- (void)_RequestSiriAudioConnection
{
  os_unfair_lock_lock(&stru_D428);
  mach_service = xpc_connection_create_mach_service("com.apple.BTLEAudioController.xpc", 0, 0);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = mach_service;

  id v5 = qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = self->_xpcConnection;
    *(_DWORD *)buf = 134217984;
    xpc_object_t v10 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "AudioAppleSiriRemoteInputPlugin xpc connection created at %p", buf, 0xCu);
  }
  size_t v7 = self->_xpcConnection;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_2BA8;
  handler[3] = &unk_82D8;
  handler[4] = self;
  xpc_connection_set_event_handler(v7, handler);
  xpc_connection_resume(self->_xpcConnection);
  os_unfair_lock_unlock(&stru_D428);
  [(AudioAppleSiriRemoteInputPlugin *)self _checkIn];
}

- (void)_handleEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    [(AudioAppleSiriRemoteInputPlugin *)self _handleMsg:v4];
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    [(AudioAppleSiriRemoteInputPlugin *)self _handleError:v4];
  }
  else
  {
    id v6 = qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_4D00((uint64_t)v4, v6);
    }
  }
}

- (void)_handleMsg:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "kMsgId");
  xpc_dictionary_get_value(v4, "kMsgArgs");
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  size_t v7 = +[NSString stringWithFormat:@"_handle%sMsg:", string];
  xpc_object_t v8 = NSSelectorFromString(v7);

  objc_msgSend(self, v8, v6);
}

- (void)_handleError:(id)a3
{
  id v4 = a3;
  id v5 = [(AudioAppleSiriRemoteInputPlugin *)self inputDevices];
  objc_sync_enter(v5);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(AudioAppleSiriRemoteInputPlugin *)self inputDevices];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        xpc_object_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v10 invalidate];
        objc_super v11 = [(AudioAppleSiriRemoteInputPlugin *)self delegate];
        [v11 inputPlugin:self didUnpublishDevice:v10];
      }
      id v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  int v12 = [(AudioAppleSiriRemoteInputPlugin *)self inputDevices];
  [v12 removeAllObjects];

  objc_sync_exit(v5);
  os_unfair_lock_lock(&stru_D428);
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
    sub_4DF0();
  }
  if (v4 == &_xpc_error_connection_interrupted || v4 == &_xpc_error_connection_invalid)
  {
    if (self->_xpcConnection)
    {
      id v14 = qword_D420;
      if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
      {
        xpcConnection = self->_xpcConnection;
        *(_DWORD *)buf = 134217984;
        v24 = xpcConnection;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Canceling xpc connection: %p", buf, 0xCu);
      }
      v17 = self->_xpcConnection;
      p_xpcConnection = &self->_xpcConnection;
      xpc_connection_cancel(v17);
      long long v18 = *p_xpcConnection;
      *p_xpcConnection = 0;
    }
  }
  else
  {
    id v13 = qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_4D78((uint64_t)v4, v13);
    }
  }
  os_unfair_lock_unlock(&stru_D428);
}

- (id)_inputDeviceForArgs:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kMsgArgIdentifier"];
  id v6 = [(AudioAppleSiriRemoteInputPlugin *)self inputDevices];
  objc_sync_enter(v6);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(AudioAppleSiriRemoteInputPlugin *)self inputDevices];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_super v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v12 = [v11 identifier];
        unsigned int v13 = [v12 isEqual:v5];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v6);

  return v8;
}

- (AVAudioRemoteInputPluginDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVAudioRemoteInputPluginDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)inputDevices
{
  return self->_inputDevices;
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_inputDevices, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end