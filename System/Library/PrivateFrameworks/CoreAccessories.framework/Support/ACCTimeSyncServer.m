@interface ACCTimeSyncServer
+ (id)sharedServer;
- (ACCTimeSyncServer)init;
- (BOOL)_initXPC;
- (BOOL)isActive;
- (BOOL)isServerActive;
- (void)_connectPeer:(id)a3;
- (void)_formSNTPPacket:(id)a3;
- (void)_getAccessoryTime:(id)a3;
- (void)_initXPC;
- (void)_notifyServerActive;
- (void)_sendHostTimeToAccessory:(id)a3;
- (void)_setSystemTime:(__CFData *)a3;
- (void)dealloc;
- (void)setIsActive:(BOOL)a3;
- (void)setSystemTime:(__CFData *)a3;
@end

@implementation ACCTimeSyncServer

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __33__ACCTimeSyncServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once_5 != -1) {
    dispatch_once(&sharedServer_once_5, block);
  }
  v2 = (void *)sharedServer_sharedInstance_5;

  return v2;
}

uint64_t __33__ACCTimeSyncServer_sharedServer__block_invoke(uint64_t a1)
{
  sharedServer_sharedInstance_5 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

- (ACCTimeSyncServer)init
{
  v5.receiver = self;
  v5.super_class = (Class)ACCTimeSyncServer;
  v2 = [(ACCTimeSyncServer *)&v5 init];
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "in init", buf, 2u);
    }
    unsigned int v3 = [(ACCTimeSyncServer *)v2 _initXPC];
    v2->_isActive = v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer: init finished with :%d", buf, 8u);
    }
  }
  return v2;
}

- (void)dealloc
{
  if (self->_isActive) {
    xpc_connection_cancel(self->_listenerConnection);
  }
  self->_isActive = 0;
  v3.receiver = self;
  v3.super_class = (Class)ACCTimeSyncServer;
  [(ACCTimeSyncServer *)&v3 dealloc];
}

- (void)setSystemTime:(__CFData *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer setSystemTime", v5, 2u);
  }
  [(ACCTimeSyncServer *)self _setSystemTime:a3];
}

- (BOOL)isServerActive
{
  return self->_isActive;
}

- (void)_setSystemTime:(__CFData *)a3
{
  size_t Length = CFDataGetLength(a3);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer _setSystemTime", buf, 2u);
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "xpcEventName", "setSystemTime");
  BytePtr = CFDataGetBytePtr(a3);
  xpc_dictionary_set_data(v6, "sntpPacket", BytePtr, Length);
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __36__ACCTimeSyncServer__setSystemTime___block_invoke;
  v10[3] = &unk_100215968;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(queue, v10);
}

void __36__ACCTimeSyncServer__setSystemTime___block_invoke(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      xpc_object_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        xpc_connection_send_message(*(xpc_connection_t *)(*((void *)&v8 + 1) + 8 * (void)v6), *(xpc_object_t *)(a1 + 40));
        xpc_object_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  if (![*(id *)(*(void *)(a1 + 32) + 24) count]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer no peers attached", v7, 2u);
  }
}

- (void)_formSNTPPacket:(id)a3
{
  id v3 = a3;
  id v4 = malloc_type_calloc(1uLL, 0x30uLL, 0x1000040EED21634uLL);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      long long v8 = "-[ACCTimeSyncServer _formSNTPPacket:]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s Could not allocate SNTP buffer.", (uint8_t *)&v7, 0xCu);
    }
    goto LABEL_4;
  }
  uint64_t v5 = v4;
  if (!xpc_data_get_bytes(v3, v4, 0, 0x30uLL))
  {
    free(v5);
LABEL_4:
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_getAccessoryTime:(id)a3
{
  id v3 = [(ACCTimeSyncServer *)self _formSNTPPacket:a3];
  if (v3)
  {
    id v4 = v3;
    platform_timeSync_getAccessoryTime((uint64_t)v3);
    free(v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    xpc_object_t v6 = "-[ACCTimeSyncServer _getAccessoryTime:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer::%s could not create SNTP packet to send to accessory.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_sendHostTimeToAccessory:(id)a3
{
  id v3 = [(ACCTimeSyncServer *)self _formSNTPPacket:a3];
  if (v3)
  {
    id v4 = v3;
    platform_timeSync_sendHostTimeToAccessory((uint64_t)v3);
    free(v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    xpc_object_t v6 = "-[ACCTimeSyncServer _sendHostTimeToAccessory:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer::%s could not create SNTP packet to send to accessory.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_notifyServerActive
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.coreaccessories.TimeSyncServerArrived", 0, 0, 1u);
}

- (BOOL)_initXPC
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (OS_dispatch_queue *)dispatch_queue_create("accessoryTimeSyncQueue", v3);
  queue = self->_queue;
  self->_queue = v4;

  mach_service = xpc_connection_create_mach_service("com.apple.timed.accessory-timesync", (dispatch_queue_t)self->_queue, 1uLL);
  listenerConnection = self->_listenerConnection;
  self->_listenerConnection = mach_service;

  if (!self->_listenerConnection) {
    -[ACCTimeSyncServer _initXPC]();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer - initXPC", buf, 2u);
  }
  xpc_set_event_stream_handler("com.apple.timed.accessory-timesync", (dispatch_queue_t)self->_queue, &__block_literal_global_19);
  long long v8 = self->_listenerConnection;
  BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer: listenerConnection", buf, 2u);
    }
    long long v10 = self->_listenerConnection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __29__ACCTimeSyncServer__initXPC__block_invoke_12;
    handler[3] = &unk_100216710;
    handler[4] = self;
    xpc_connection_set_event_handler(v10, handler);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer: activate connection.", buf, 2u);
    }
    xpc_connection_resume(self->_listenerConnection);
    [(ACCTimeSyncServer *)self _notifyServerActive];
  }
  else if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer: unable to create listner connection.", buf, 2u);
  }
  return v8 != 0;
}

void __29__ACCTimeSyncServer__initXPC__block_invoke(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    id v3 = string;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer: Received %s", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __29__ACCTimeSyncServer__initXPC__block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer: peer connection arrived", (uint8_t *)&v8, 2u);
    }
    [*(id *)(a1 + 32) _connectPeer:v3];
  }
  else
  {
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      int v5 = xpc_copy_description(v3);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136446210;
        string_ptr = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer: received error or other non-connection type in handler for listener: %{public}s.", (uint8_t *)&v8, 0xCu);
      }
      free(v5);
      goto LABEL_9;
    }
    if (xpc_equal(v3, &_xpc_error_connection_interrupted))
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      int v8 = 136315138;
      string_ptr = "com.apple.timed.accessory-timesync";
      xpc_object_t v6 = "ACCTimeSyncServer: Service interrupted: %s";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
      goto LABEL_9;
    }
    if (xpc_equal(v3, &_xpc_error_connection_invalid))
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      int v8 = 136315138;
      string_ptr = "com.apple.timed.accessory-timesync";
      xpc_object_t v6 = "ACCTimeSyncServer: Service not available: %s";
      goto LABEL_16;
    }
    int v7 = xpc_dictionary_get_value(v3, _xpc_error_key_description);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      string_ptr = xpc_string_get_string_ptr(v7);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer: listener connection error %s", (uint8_t *)&v8, 0xCu);
    }
  }
LABEL_9:
}

- (void)_connectPeer:(id)a3
{
  int v4 = (_xpc_connection_s *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer: _connectPeer.", buf, 2u);
  }
  peers = self->_peers;
  if (!peers)
  {
    xpc_object_t v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    int v7 = self->_peers;
    self->_peers = v6;

    peers = self->_peers;
  }
  [(NSMutableArray *)peers addObject:v4];
  id v8 = [(NSMutableArray *)self->_peers count];
  if ((unint64_t)v8 >= 2)
  {
    id v9 = v8;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer: unexpected number of peer connections %lu.", buf, 0xCu);
    }
  }
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __34__ACCTimeSyncServer__connectPeer___block_invoke;
  v11[3] = &unk_100218718;
  v11[4] = self;
  v12 = v4;
  long long v10 = v4;
  xpc_connection_set_event_handler(v10, v11);
  xpc_connection_resume(v10);
}

void __34__ACCTimeSyncServer__connectPeer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v6 = xpc_dictionary_get_value(v3, "xpcEventName");
    string_ptr = xpc_string_get_string_ptr(v6);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v11 = 136315138;
      *(void *)&v11[4] = string_ptr;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AccessoryTimeSyncServer: received event name:%s", v11, 0xCu);
    }
    if (!strcmp(string_ptr, "getTimeFromAccessory"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer:: getTimeFromAccessory msg received", v11, 2u);
      }
      long long v10 = xpc_dictionary_get_value(v3, "sntpPacket");
      [*(id *)(a1 + 32) _getAccessoryTime:v10];
    }
    else
    {
      if (strcmp(string_ptr, "sendTimeToAccessory"))
      {
        if (!strcmp(string_ptr, "timeSyncClientArrived")
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer:: timeSyncClientArrived msg received, adding to list of peers", v11, 2u);
        }
        goto LABEL_29;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer:: sendTimeToAccessory msg received", v11, 2u);
      }
      long long v10 = xpc_dictionary_get_value(v3, "sntpPacket");
      [*(id *)(a1 + 32) _sendHostTimeToAccessory:v10];
    }

    goto LABEL_29;
  }
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v11 = 0;
      int v5 = "ACCTimeSyncServer: Unexpected data, invalidating the connection.";
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, v11, 2u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  if (v3 != &_xpc_error_connection_interrupted && v3 != &_xpc_error_termination_imminent)
  {
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v3 == &_xpc_error_connection_invalid)
    {
      if (v9)
      {
        *(_WORD *)long long v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ACCTimeSyncServer:: disconnecting peer", v11, 2u);
      }
      goto LABEL_7;
    }
    if (v9)
    {
      *(_WORD *)long long v11 = 0;
      int v5 = "ACCTimeSyncServer: Unexpected error dictionary, invalidating the connection.";
      goto LABEL_5;
    }
LABEL_6:
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
LABEL_7:
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObjectIdenticalTo:", *(void *)(a1 + 40), *(void *)v11);
  }
LABEL_29:
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_listenerConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_initXPC
{
}

@end