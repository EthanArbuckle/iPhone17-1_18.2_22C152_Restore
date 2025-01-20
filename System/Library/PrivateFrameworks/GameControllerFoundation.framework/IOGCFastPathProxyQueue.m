@interface IOGCFastPathProxyQueue
- (id)_initWithConnection:(id)a3 queue:(unint64_t)a4;
- (int)getProperties:(id)a3 dictionary:(id *)a4;
- (int)mapMemoryAt:(unint64_t *)a3 ofSize:(unint64_t *)a4 options:(unsigned int)a5;
- (int)unmapMemoryAt:(unint64_t)a3;
@end

@implementation IOGCFastPathProxyQueue

- (id)_initWithConnection:(id)a3 queue:(unint64_t)a4
{
  v6 = (IOGCFastPathProxyConnection *)a3;
  v10.receiver = self;
  v10.super_class = (Class)IOGCFastPathProxyQueue;
  v7 = [(IOGCFastPathProxyQueue *)&v10 init];
  parent = v7->_parent;
  v7->_parent = v6;

  v7->_queue = a4;
  return v7;
}

- (int)mapMemoryAt:(unint64_t *)a3 ofSize:(unint64_t *)a4 options:(unsigned int)a5
{
  v8 = _gc_log_iokit();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[IOGCFastPathProxyQueue mapMemoryAt:ofSize:options:]();
  }

  *(_OWORD *)keys = xmmword_26BEC5138;
  Name = sel_getName(sel_mapMemoryForQueue_);
  values[0] = xpc_string_create(Name);
  values[1] = xpc_uint64_create(self->_queue);
  xpc_object_t v10 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  xpc_object_t v11 = xpc_connection_send_message_with_reply_sync(self->_parent->_connection, v10);
  v12 = (void *)MEMORY[0x21052D670]();
  if (v12 == &_xpc_type_dictionary)
  {
    v17 = xpc_dictionary_get_value(v11, "status");
    if ((_UNKNOWN *)MEMORY[0x21052D670]() != &_xpc_type_uint64)
    {
      v18 = _gc_log_iokit();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[IOGCFastPathProxyQueue mapMemoryAt:ofSize:options:]();
      }
      int value = -536870209;

      goto LABEL_31;
    }
    int value = xpc_uint64_get_value(v17);
    v20 = _gc_log_iokit();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[IOGCFastPathProxyQueue mapMemoryAt:ofSize:options:]();
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
        int value = mach_vm_map(mach_task_self_, a3, uint64, 0, 1, v22, 0, 0, 1, 1, 2u);
        if (value)
        {
          v25 = _gc_log_iokit();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v31) = value;
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
      v31 = self;
      v27 = "mapMemory reply for %@ missing 'memory_size' argument";
    }
    else
    {
      v26 = _gc_log_iokit();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        int value = -536870209;

        xpc_connection_cancel(self->_parent->_connection);
LABEL_31:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 138412290;
      v31 = self;
      v27 = "mapMemory reply for %@ missing 'memory' argument";
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
      v31 = self;
      __int16 v32 = 2112;
      xpc_object_t v33 = v11;
      v16 = "mapMemory for %@ failed: %@";
      goto LABEL_13;
    }
  }
  else if (v15)
  {
    *(_DWORD *)buf = 138412546;
    v31 = self;
    __int16 v32 = 2112;
    xpc_object_t v33 = v11;
    v16 = "mapMemory for %@ unknown response: %@";
LABEL_13:
    _os_log_impl(&dword_20AD04000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
  }
  int value = -536870209;

  xpc_connection_cancel(self->_parent->_connection);
LABEL_32:

  for (uint64_t i = 1; i != -1; --i)
  return value;
}

- (int)unmapMemoryAt:(unint64_t)a3
{
  return 0;
}

- (int)getProperties:(id)a3 dictionary:(id *)a4
{
  id v6 = a3;
  v7 = _gc_log_iokit();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[IOGCFastPathProxyQueue getProperties:dictionary:].cold.4();
  }

  xpc_object_t empty = xpc_array_create_empty();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        xpc_object_t v14 = xpc_string_create((const char *)[*(id *)(*((void *)&v35 + 1) + 8 * i) UTF8String]);
        xpc_array_append_value(empty, v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v11);
  }

  *(_OWORD *)keys = xmmword_26BEC5148;
  v45 = "keys";
  Name = sel_getName(sel_getQueue_properties_);
  values[0] = xpc_string_create(Name);
  values[1] = xpc_uint64_create(self->_queue);
  id v16 = empty;
  xpc_object_t values[2] = v16;
  xpc_object_t v17 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  xpc_object_t v18 = xpc_connection_send_message_with_reply_sync(self->_parent->_connection, v17);
  v19 = (void *)MEMORY[0x21052D670]();
  if (v19 == &_xpc_type_dictionary)
  {
    v25 = xpc_dictionary_get_value(v18, "status");
    if ((_UNKNOWN *)MEMORY[0x21052D670]() == &_xpc_type_uint64)
    {
      int value = xpc_uint64_get_value(v25);
      v27 = _gc_log_iokit();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[IOGCFastPathProxyQueue getProperties:dictionary:]();
      }

      if (value) {
        goto LABEL_25;
      }
      v26 = xpc_dictionary_get_value(v18, "properties");
      if ((_UNKNOWN *)MEMORY[0x21052D670]() == &_xpc_type_dictionary)
      {
        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472;
        applier[2] = __51__IOGCFastPathProxyQueue_getProperties_dictionary___block_invoke;
        applier[3] = &unk_26BEC5168;
        id v31 = (id)objc_opt_new();
        id v34 = v31;
        xpc_dictionary_apply(v26, applier);
        id v32 = *a4;
        *a4 = v31;
        v30 = v31;

        int value = 0;
      }
      else
      {
        int value = -536870209;
        v30 = _gc_log_iokit();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[IOGCFastPathProxyQueue getProperties:dictionary:]();
        }
      }
    }
    else
    {
      int value = -536870209;
      v26 = _gc_log_iokit();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[IOGCFastPathProxyQueue getProperties:dictionary:]();
      }
    }

LABEL_25:
    goto LABEL_26;
  }
  v20 = v19;
  int value = -536870209;
  mem_entry_name_port_t v22 = _gc_log_iokit();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v20 == &_xpc_type_error)
  {
    if (v23)
    {
      *(_DWORD *)buf = 138412546;
      v40 = self;
      __int16 v41 = 2112;
      xpc_object_t v42 = v18;
      unint64_t v24 = "getProperties for %@ failed: %@";
      goto LABEL_20;
    }
  }
  else if (v23)
  {
    *(_DWORD *)buf = 138412546;
    v40 = self;
    __int16 v41 = 2112;
    xpc_object_t v42 = v18;
    unint64_t v24 = "getProperties for %@ unknown response: %@";
LABEL_20:
    _os_log_impl(&dword_20AD04000, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
  }

  xpc_connection_cancel(self->_parent->_connection);
LABEL_26:

  for (uint64_t j = 2; j != -1; --j)
  return value;
}

uint64_t __51__IOGCFastPathProxyQueue_getProperties_dictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((_UNKNOWN *)MEMORY[0x21052D670]() == &_xpc_type_uint64)
  {
    id v6 = *(void **)(a1 + 32);
    v7 = +[NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v5)];
    v8 = +[NSString stringWithUTF8String:a2];
    [v6 setObject:v7 forKey:v8];
  }
  if ((_UNKNOWN *)MEMORY[0x21052D670](v5) == &_xpc_type_int64)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
    uint64_t v11 = +[NSString stringWithUTF8String:a2];
    [v9 setObject:v10 forKey:v11];
  }
  return 1;
}

- (void).cxx_destruct
{
}

- (void)mapMemoryAt:ofSize:options:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_2(&dword_20AD04000, v0, v1, "mapMemory request for %@ returns %{mach.errno}d");
}

- (void)mapMemoryAt:ofSize:options:.cold.2()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_20AD04000, v0, v1, "mapMemory for %@ returns bad reply: %@");
}

- (void)mapMemoryAt:ofSize:options:.cold.3()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6(&dword_20AD04000, v0, v1, "%@::mapMemoryAt", v2, v3, v4, v5, v6);
}

- (void)getProperties:dictionary:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_20AD04000, v0, v1, "getProperties for %@ returns bad reply: %@");
}

- (void)getProperties:dictionary:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_2(&dword_20AD04000, v0, v1, "getProperties request for %@ returns %{mach.errno}d");
}

- (void)getProperties:dictionary:.cold.3()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_20AD04000, v0, v1, "getProperties for %@ returns bad reply: %@");
}

- (void)getProperties:dictionary:.cold.4()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6(&dword_20AD04000, v0, v1, "%@::getProperties", v2, v3, v4, v5, v6);
}

@end