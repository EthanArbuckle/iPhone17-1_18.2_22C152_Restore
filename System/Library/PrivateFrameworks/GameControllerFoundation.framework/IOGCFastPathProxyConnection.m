@interface IOGCFastPathProxyConnection
+ (id)connectTo:(unsigned int)a3 withProxyService:(id)a4 error:(int *)a5;
- (IOGCFastPathProxyConnection)init;
- (id)createInputQueueWithOptions:(id)a3 error:(int *)a4;
- (id)description;
- (id)getProperty:(id)a3;
- (int)close;
- (int)mapSharedMemoryAt:(unint64_t *)a3 ofSize:(unint64_t *)a4 options:(unsigned int)a5;
- (int)open;
- (int)unmapSharedMemoryAt:(unint64_t)a3;
- (unint64_t)clientID;
- (unsigned)service;
- (void)close;
- (void)dealloc;
- (void)invalidate;
- (void)open;
- (xpc_connection_t)_initWithService:(void *)a3 withProxyService:(_DWORD *)a4 error:;
@end

@implementation IOGCFastPathProxyConnection

+ (id)connectTo:(unsigned int)a3 withProxyService:(id)a4 error:(int *)a5
{
  id v8 = a4;
  v9 = -[IOGCFastPathProxyConnection _initWithService:withProxyService:error:](objc_alloc((Class)a1), a3, v8, a5);

  return v9;
}

- (xpc_connection_t)_initWithService:(void *)a3 withProxyService:(_DWORD *)a4 error:
{
  kern_return_t v10;
  xpc_connection_t *v11;
  NSObject *v12;
  xpc_connection_t mach_service;
  xpc_connection_t v14;
  _xpc_connection_s *v15;
  xpc_connection_t *v16;
  NSObject *v17;
  const char *Name;
  xpc_object_t v19;
  xpc_object_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  int value;
  NSObject *v26;
  void *v28;
  void *v29;
  void handler[4];
  xpc_connection_t *v31;
  uint64_t entryID;
  objc_super v33;
  uint8_t buf[4];
  char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  xpc_object_t v39;
  xpc_object_t values;
  char *keys;
  char className[136];

  id v7 = a3;
  id v8 = v7;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_27;
  }
  if (v7)
  {
    if (a2) {
      goto LABEL_4;
    }
  }
  else
  {
    v28 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithService_withProxyService_error_, a1, @"IOGCFastPathProxyConnection.m", 32, @"Invalid parameter not satisfying: %s", "name");

    if (a2) {
      goto LABEL_4;
    }
  }
  v29 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithService_withProxyService_error_, a1, @"IOGCFastPathProxyConnection.m", 33, @"Invalid parameter not satisfying: %s", "service != IO_OBJECT_NULL");

LABEL_4:
  v33.receiver = a1;
  v33.super_class = (Class)IOGCFastPathProxyConnection;
  v9 = (xpc_connection_t *)objc_msgSendSuper2(&v33, sel_init);
  entryID = 0;
  memset(className, 0, 128);
  v10 = IOObjectRetain(a2);
  IORegistryEntryGetRegistryEntryID(a2, &entryID);
  IOObjectGetClass(a2, className);
  v11 = 0;
  if (!v10)
  {
    v12 = _gc_log_iokit();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[IOGCFastPathProxyConnection _initWithService:withProxyService:error:]();
    }

    mach_service = xpc_connection_create_mach_service((const char *)[v8 UTF8String], 0, 2uLL);
    v14 = v9[2];
    v9[2] = mach_service;

    v15 = v9[2];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke;
    handler[3] = &unk_26BEC3AB0;
    v16 = v9;
    v31 = v16;
    xpc_connection_set_event_handler(v15, handler);
    xpc_connection_activate(v9[2]);
    v17 = _gc_log_iokit();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[IOGCFastPathProxyConnection _initWithService:withProxyService:error:]();
    }

    keys = "selector";
    Name = sel_getName(sel_connect_);
    values = xpc_string_create(Name);
    v19 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
    xpc_dictionary_set_mach_send();
    v20 = xpc_connection_send_message_with_reply_sync(v9[2], v19);
    v21 = (void *)MEMORY[0x21052D670]();
    if (v21 == &_xpc_type_dictionary)
    {
      v22 = xpc_dictionary_get_value(v20, "status");
      if ((_UNKNOWN *)MEMORY[0x21052D670]() == &_xpc_type_uint64)
      {
        value = xpc_uint64_get_value(v22);
        v26 = _gc_log_iokit();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v35 = className;
          v36 = 2048;
          v37 = entryID;
          v38 = 1024;
          LODWORD(v39) = value;
          _os_log_debug_impl(&dword_20AD04000, v26, OS_LOG_TYPE_DEBUG, "Handshake for <%s %#llx> returns %{mach.errno}d", buf, 0x1Cu);
        }

        if (!value)
        {

          goto LABEL_11;
        }
        xpc_connection_cancel(v9[2]);
        *a4 = value;
      }
      else
      {
        v23 = _gc_log_iokit();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v35 = className;
          v36 = 2048;
          v37 = entryID;
          v38 = 2112;
          v39 = v20;
          _os_log_debug_impl(&dword_20AD04000, v23, OS_LOG_TYPE_DEBUG, "Handshake for <%s %#llx> returns bad reply: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      if (v21 != &_xpc_type_error)
      {
LABEL_11:

        v11 = v16;
LABEL_25:

        goto LABEL_26;
      }
      v24 = _gc_log_iokit();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v35 = className;
        v36 = 2048;
        v37 = entryID;
        v38 = 2112;
        v39 = v20;
        _os_log_impl(&dword_20AD04000, v24, OS_LOG_TYPE_DEFAULT, "Handshake for <%s %#llx> failed: %@", buf, 0x20u);
      }

      xpc_connection_cancel(v9[2]);
      *a4 = -536870209;
    }

    v11 = 0;
    goto LABEL_25;
  }
LABEL_26:

LABEL_27:
  return v11;
}

void __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x21052D670]();
  if (v4 == &_xpc_type_dictionary)
  {
    v5 = _gc_log_iokit();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_1();
    }
  }
  else if (v4 == &_xpc_type_error)
  {
    v5 = _gc_log_iokit();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v3 == &_xpc_error_connection_invalid)
    {
      if (v6) {
        __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_2(v5);
      }

      xpc_connection_set_event_handler(*(xpc_connection_t *)(*(void *)(a1 + 32) + 16), &__block_literal_global_17);
      xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(a1 + 32) + 16));
      uint64_t v7 = *(void *)(a1 + 32);
      v5 = *(NSObject **)(v7 + 16);
      *(void *)(v7 + 16) = 0;
    }
    else if (v6)
    {
      __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_3();
    }
  }
  else
  {
    v5 = _gc_log_iokit();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_4();
    }
  }
}

- (IOGCFastPathProxyConnection)init
{
  return 0;
}

- (void)dealloc
{
  id v3 = _gc_log_iokit();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_20AD04000, v3, OS_LOG_TYPE_DEFAULT, "%@::dealloc", buf, 0xCu);
  }

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v5 = self->_connection;
    self->_connection = 0;
  }
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)IOGCFastPathProxyConnection;
  [(IOGCFastPathProxyConnection *)&v7 dealloc];
}

- (void)invalidate
{
}

- (int)mapSharedMemoryAt:(unint64_t *)a3 ofSize:(unint64_t *)a4 options:(unsigned int)a5
{
  id v8 = _gc_log_iokit();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[IOGCFastPathProxyConnection mapSharedMemoryAt:ofSize:options:]();
  }

  keys = "selector";
  Name = sel_getName(sel_mapSharedMemory);
  xpc_object_t values = xpc_string_create(Name);
  xpc_object_t v10 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  xpc_object_t v11 = xpc_connection_send_message_with_reply_sync(self->_connection, v10);
  v12 = (void *)MEMORY[0x21052D670]();
  if (v12 == &_xpc_type_dictionary)
  {
    v17 = xpc_dictionary_get_value(v11, "status");
    if ((_UNKNOWN *)MEMORY[0x21052D670]() != &_xpc_type_uint64)
    {
      v18 = _gc_log_iokit();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[IOGCFastPathProxyConnection mapSharedMemoryAt:ofSize:options:]();
      }
      int value = -536870209;

      goto LABEL_31;
    }
    int value = xpc_uint64_get_value(v17);
    v20 = _gc_log_iokit();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[IOGCFastPathProxyConnection mapSharedMemoryAt:ofSize:options:]();
    }

    if (value) {
      goto LABEL_31;
    }
    mem_entry_name_port_t v21 = xpc_dictionary_copy_mach_send();
    if (v21)
    {
      mem_entry_name_port_t v22 = v21;
      uint64_t uint64 = xpc_dictionary_get_uint64(v11, "memory_size");
      if (uint64)
      {
        unint64_t v24 = uint64;
        int value = mach_vm_map(mach_task_self_, a3, uint64, 0, 1, v22, 0, 0, 1, 1, 0);
        if (value)
        {
          v25 = _gc_log_iokit();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v30) = value;
            _os_log_impl(&dword_20AD04000, v25, OS_LOG_TYPE_DEFAULT, "vm_map returns %{mach.errno}d", buf, 8u);
          }
        }
        *a4 = v24;
        goto LABEL_31;
      }
      v26 = _gc_log_iokit();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 138412290;
      v30 = self;
      v27 = "mapSharedMemory reply for %@ missing 'memory_size' argument";
    }
    else
    {
      v26 = _gc_log_iokit();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        int value = -536870209;

        xpc_connection_cancel(self->_connection);
LABEL_31:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 138412290;
      v30 = self;
      v27 = "mapSharedMemory reply for %@ missing 'memory' argument";
    }
    _os_log_impl(&dword_20AD04000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
    goto LABEL_30;
  }
  v13 = v12;
  v14 = _gc_log_iokit();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13 == &_xpc_type_error)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412546;
      v30 = self;
      __int16 v31 = 2112;
      xpc_object_t v32 = v11;
      v16 = "Handshake for %@ failed: %@";
      goto LABEL_13;
    }
  }
  else if (v15)
  {
    *(_DWORD *)buf = 138412546;
    v30 = self;
    __int16 v31 = 2112;
    xpc_object_t v32 = v11;
    v16 = "Handshake for %@ unknown response: %@";
LABEL_13:
    _os_log_impl(&dword_20AD04000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
  }
  int value = -536870209;

  xpc_connection_cancel(self->_connection);
LABEL_32:

  return value;
}

- (int)unmapSharedMemoryAt:(unint64_t)a3
{
  return 0;
}

- (int)open
{
  keys = "selector";
  Name = sel_getName(sel_open);
  xpc_object_t values = xpc_string_create(Name);
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(self->_connection, v4);
  BOOL v6 = (void *)MEMORY[0x21052D670]();
  if (v6 != &_xpc_type_dictionary)
  {
    objc_super v7 = v6;
    int value = -536870209;
    v9 = _gc_log_iokit();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 == &_xpc_type_error)
    {
      if (v10)
      {
        int v15 = 138412546;
        v16 = self;
        __int16 v17 = 2112;
        xpc_object_t v18 = v5;
        xpc_object_t v11 = "Open for %@ failed: %@";
        goto LABEL_11;
      }
    }
    else if (v10)
    {
      int v15 = 138412546;
      v16 = self;
      __int16 v17 = 2112;
      xpc_object_t v18 = v5;
      xpc_object_t v11 = "Open for %@ unknown response: %@";
LABEL_11:
      _os_log_impl(&dword_20AD04000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0x16u);
    }

    xpc_connection_cancel(self->_connection);
    goto LABEL_15;
  }
  v12 = xpc_dictionary_get_value(v5, "status");
  if ((_UNKNOWN *)MEMORY[0x21052D670]() == &_xpc_type_uint64)
  {
    int value = xpc_uint64_get_value(v12);
  }
  else
  {
    v13 = _gc_log_iokit();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[IOGCFastPathProxyConnection open]();
    }
    int value = -536870209;
  }
LABEL_15:

  return value;
}

- (int)close
{
  keys = "selector";
  Name = sel_getName(sel_close);
  xpc_object_t values = xpc_string_create(Name);
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(self->_connection, v4);
  BOOL v6 = (void *)MEMORY[0x21052D670]();
  if (v6 != &_xpc_type_dictionary)
  {
    objc_super v7 = v6;
    int value = -536870209;
    v9 = _gc_log_iokit();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 == &_xpc_type_error)
    {
      if (v10)
      {
        int v15 = 138412546;
        v16 = self;
        __int16 v17 = 2112;
        xpc_object_t v18 = v5;
        xpc_object_t v11 = "Close for %@ failed: %@";
        goto LABEL_11;
      }
    }
    else if (v10)
    {
      int v15 = 138412546;
      v16 = self;
      __int16 v17 = 2112;
      xpc_object_t v18 = v5;
      xpc_object_t v11 = "Close for %@ unknown response: %@";
LABEL_11:
      _os_log_impl(&dword_20AD04000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0x16u);
    }

    xpc_connection_cancel(self->_connection);
    goto LABEL_15;
  }
  v12 = xpc_dictionary_get_value(v5, "status");
  if ((_UNKNOWN *)MEMORY[0x21052D670]() == &_xpc_type_uint64)
  {
    int value = xpc_uint64_get_value(v12);
  }
  else
  {
    v13 = _gc_log_iokit();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[IOGCFastPathProxyConnection close]();
    }
    int value = -536870209;
  }
LABEL_15:

  return value;
}

- (id)getProperty:(id)a3
{
  id v4 = a3;
  *(_OWORD *)keys = xmmword_26BEC5128;
  Name = sel_getName(sel_getProperty_);
  values[0] = xpc_string_create(Name);
  id v6 = v4;
  values[1] = xpc_string_create((const char *)[v6 UTF8String]);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(self->_connection, v7);
  v9 = (void *)MEMORY[0x21052D670]();
  if (v9 == &_xpc_type_dictionary)
  {
    uint64_t v14 = xpc_dictionary_get_value(v8, "value");
    int v15 = (void *)v14;
    if (v14)
    {
      if ((_UNKNOWN *)MEMORY[0x21052D670](v14) == &_xpc_type_uint64)
      {
        uint64_t v16 = +[NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v15)];
        goto LABEL_20;
      }
      if ((_UNKNOWN *)MEMORY[0x21052D670](v15) == &_xpc_type_int64)
      {
        uint64_t v16 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v15)];
        goto LABEL_20;
      }
      if ((_UNKNOWN *)MEMORY[0x21052D670](v15) == &_xpc_type_string)
      {
        uint64_t v16 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v15)];
LABEL_20:
        __int16 v17 = (void *)v16;
        goto LABEL_21;
      }
    }
    else
    {
      xpc_object_t v18 = _gc_log_iokit();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[IOGCFastPathProxyConnection getProperty:]();
      }
    }
    __int16 v17 = 0;
LABEL_21:

    goto LABEL_22;
  }
  BOOL v10 = v9;
  xpc_object_t v11 = _gc_log_iokit();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10 == &_xpc_type_error)
  {
    if (v12)
    {
      int v21 = 138412546;
      mem_entry_name_port_t v22 = self;
      __int16 v23 = 2112;
      xpc_object_t v24 = v8;
      v13 = "getProperty for %@ failed: %@";
      goto LABEL_12;
    }
  }
  else if (v12)
  {
    int v21 = 138412546;
    mem_entry_name_port_t v22 = self;
    __int16 v23 = 2112;
    xpc_object_t v24 = v8;
    v13 = "getProperty for %@ unknown response: %@";
LABEL_12:
    _os_log_impl(&dword_20AD04000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, 0x16u);
  }

  xpc_connection_cancel(self->_connection);
  __int16 v17 = 0;
LABEL_22:

  for (uint64_t i = 1; i != -1; --i)

  return v17;
}

- (id)createInputQueueWithOptions:(id)a3 error:(int *)a4
{
  keys = "selector";
  Name = sel_getName(sel_createInputQueue_);
  xpc_object_t values = xpc_string_create(Name);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(self->_connection, v7);
  v9 = (void *)MEMORY[0x21052D670]();
  if (v9 != &_xpc_type_dictionary)
  {
    BOOL v10 = v9;
    xpc_object_t v11 = _gc_log_iokit();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10 == &_xpc_type_error)
    {
      if (v12)
      {
        int v20 = 138412546;
        int v21 = self;
        __int16 v22 = 2112;
        xpc_object_t v23 = v8;
        v13 = "createInputQueue for %@ failed: %@";
        goto LABEL_11;
      }
    }
    else if (v12)
    {
      int v20 = 138412546;
      int v21 = self;
      __int16 v22 = 2112;
      xpc_object_t v23 = v8;
      v13 = "createInputQueue for %@ unknown response: %@";
LABEL_11:
      _os_log_impl(&dword_20AD04000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, 0x16u);
    }

    xpc_connection_cancel(self->_connection);
    id v16 = 0;
    goto LABEL_18;
  }
  uint64_t v14 = xpc_dictionary_get_value(v8, "status");
  if ((_UNKNOWN *)MEMORY[0x21052D670]() == &_xpc_type_uint64)
  {
    int value = xpc_uint64_get_value(v14);
    if (value)
    {
      id v16 = 0;
      *a4 = value;
      goto LABEL_17;
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(v8, "port");
    if (uint64)
    {
      id v16 = [[IOGCFastPathProxyQueue alloc] _initWithConnection:self queue:uint64];
      goto LABEL_17;
    }
    int v15 = _gc_log_iokit();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[IOGCFastPathProxyConnection createInputQueueWithOptions:error:]();
    }
  }
  else
  {
    int v15 = _gc_log_iokit();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[IOGCFastPathProxyConnection createInputQueueWithOptions:error:]();
    }
  }

  id v16 = 0;
  *a4 = -536870209;
LABEL_17:

LABEL_18:

  return v16;
}

- (id)description
{
  uint64_t entryID = 0;
  memset(className, 0, 128);
  IORegistryEntryGetRegistryEntryID(self->_service, &entryID);
  IOObjectGetClass(self->_service, className);
  id v3 = +[NSString stringWithFormat:@"(PROXY) %s %#llx", className, entryID];

  return v3;
}

- (unsigned)service
{
  return self->_service;
}

- (unint64_t)clientID
{
  return self->_clientID;
}

- (void).cxx_destruct
{
}

- (void)_initWithService:withProxyService:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_5(&dword_20AD04000, v0, v1, "Initiate handshake for <%s %#llx>", v2, v3);
}

- (void)_initWithService:withProxyService:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_5(&dword_20AD04000, v0, v1, "Opening proxy connection to <%s %#llx>", v2, v3);
}

void __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_0(&dword_20AD04000, v0, v1, "Proxy connection received unexpected message: %@", v2, v3, v4, v5, v6);
}

void __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20AD04000, log, OS_LOG_TYPE_ERROR, "Proxy connection invalidated!", v1, 2u);
}

void __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_0(&dword_20AD04000, v0, v1, "Proxy connection received error: %@", v2, v3, v4, v5, v6);
}

void __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_0(&dword_20AD04000, v0, v1, "Proxy connection received unknown event: %@", v2, v3, v4, v5, v6);
}

- (void)mapSharedMemoryAt:ofSize:options:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_2(&dword_20AD04000, v0, v1, "mapSharedMemory request for %@ returns %{mach.errno}d");
}

- (void)mapSharedMemoryAt:ofSize:options:.cold.2()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_20AD04000, v0, v1, "Handshake for %@ returns bad reply: %@");
}

- (void)mapSharedMemoryAt:ofSize:options:.cold.3()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6(&dword_20AD04000, v0, v1, "%@::mapSharedMemory", v2, v3, v4, v5, v6);
}

- (void)open
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_20AD04000, v0, v1, "Open for %@ returns bad reply: %@");
}

- (void)close
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_20AD04000, v0, v1, "Close for %@ returns bad reply: %@");
}

- (void)getProperty:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_20AD04000, v0, v1, "getProperty for %@ returns bad reply: %@");
}

- (void)createInputQueueWithOptions:error:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_20AD04000, v0, v1, "createInputQueue for %@ returns bad reply: %@");
}

- (void)createInputQueueWithOptions:error:.cold.2()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_20AD04000, v0, v1, "createInputQueue for %@ returns bad reply: %@");
}

@end