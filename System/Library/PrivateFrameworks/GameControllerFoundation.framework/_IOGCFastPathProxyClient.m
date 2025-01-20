@interface _IOGCFastPathProxyClient
+ (id)withIncomingConnection:(uint64_t)a1;
- (_IOGCFastPathProxyClient)init;
- (_IOGCFastPathProxyClient)initWithIncomingConnection:(id)a3;
- (void)dealloc;
- (void)handleMessage:(uint64_t)a1;
@end

@implementation _IOGCFastPathProxyClient

+ (id)withIncomingConnection:(uint64_t)a1
{
  id v2 = a2;
  v3 = (void *)[objc_alloc((Class)self) initWithIncomingConnection:v2];

  return v3;
}

- (_IOGCFastPathProxyClient)initWithIncomingConnection:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_IOGCFastPathProxyClient;
  id v5 = [(_IOGCFastPathProxyClient *)&v15 init];
  dispatch_queue_t v6 = dispatch_queue_create("_IOGCFastPathProxyClient", 0);
  v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  v8 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v4;
  id v9 = v4;

  xpc_connection_get_audit_token();
  xpc_connection_set_target_queue(*((xpc_connection_t *)v5 + 2), *((dispatch_queue_t *)v5 + 1));
  v10 = (_xpc_connection_s *)*((void *)v5 + 2);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __55___IOGCFastPathProxyClient_initWithIncomingConnection___block_invoke;
  handler[3] = &unk_26BEC3AB0;
  v11 = (_IOGCFastPathProxyClient *)v5;
  v14 = v11;
  xpc_connection_set_event_handler(v10, handler);
  xpc_connection_activate(*((xpc_connection_t *)v5 + 2));

  return v11;
}

- (void)handleMessage:(uint64_t)a1
{
  kern_return_t v19;
  NSObject *v20;
  NSObject *v21;
  mach_port_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  kern_return_t v25;
  NSObject *v26;
  int v27;
  xpc_object_t reply;
  NSObject *v29;
  const char *v30;
  void *CFProperty;
  NSObject *v32;
  xpc_object_t v33;
  kern_return_t memory_entry_64;
  NSObject *v35;
  xpc_object_t v36;
  CFDataRef v37;
  CFDataRef v38;
  mach_port_t v39;
  const UInt8 *BytePtr;
  size_t Length;
  kern_return_t v42;
  NSObject *v43;
  xpc_object_t v44;
  xpc_object_t v45;
  NSObject *v46;
  uint64_t v47;
  int v48;
  NSObject *v49;
  xpc_object_t v50;
  NSObject *v51;
  uint64_t uint64;
  void *v53;
  id v54;
  CFDataRef v55;
  CFDataRef v56;
  mach_port_t v57;
  const UInt8 *v58;
  size_t v59;
  kern_return_t v60;
  void *v61;
  NSObject *v62;
  xpc_object_t v63;
  NSObject *v64;
  NSObject *v65;
  kern_return_t v66;
  NSObject *v67;
  xpc_object_t v68;
  NSObject *v69;
  xpc_object_t v70;
  xpc_object_t v71;
  void v72[4];
  id v73;
  void applier[4];
  id v75;
  mach_port_t object_handle[2];
  unsigned char buf[22];
  os_activity_scope_state_s input;
  uint8_t v79[8];
  uint8_t outputStruct[8];

  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_70;
  }
  string = xpc_dictionary_get_string(v3, "selector");
  if (!string)
  {
    v8 = _gc_log_iokit();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v4;
      _os_log_impl(&dword_20AD04000, v8, OS_LOG_TYPE_DEFAULT, "Client received message without selector: %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  uint64_t v6 = (uint64_t)string;
  Uid = (char *)sel_getUid(string);
  if (Uid == sel_connect_)
  {
    id v9 = _os_activity_create(&dword_20AD04000, "[IOGCFastPathProxyClient] Connect", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    os_activity_scope_enter(v9, (os_activity_scope_state_t)buf);
    io_service_t v10 = xpc_dictionary_copy_mach_send();
    io_service_t v11 = v10;
    if (v10)
    {
      if (!*(_DWORD *)(a1 + 60))
      {
        v25 = IOServiceOpen(v10, mach_task_self_, 1u, (io_connect_t *)(a1 + 64));
        if (!v25) {
          *(_DWORD *)(a1 + 60) = v11;
        }
        v26 = _gc_log_iokit();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = *(_DWORD *)(a1 + 60);
          LODWORD(input.opaque[0]) = 67109376;
          HIDWORD(input.opaque[0]) = v27;
          LOWORD(input.opaque[1]) = 1024;
          *(_DWORD *)((char *)&input.opaque[1] + 2) = v25;
          _os_log_impl(&dword_20AD04000, v26, OS_LOG_TYPE_DEFAULT, "IOServiceOpen(%x) returns %{mach.errno}d", (uint8_t *)&input, 0xEu);
        }

        reply = xpc_dictionary_create_reply(v4);
        xpc_dictionary_set_uint64(reply, "status", v25);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), reply);

        os_activity_scope_leave((os_activity_scope_state_t)buf);
        goto LABEL_70;
      }
      xpc_object_t v12 = xpc_dictionary_create_reply(v4);
      xpc_dictionary_set_uint64(v12, "status", 0xFFFFFFFFE00002D5);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v12);
    }
    else
    {
      v21 = _gc_log_iokit();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(input.opaque[0]) = 136315138;
        *(uint64_t *)((char *)input.opaque + 4) = v6;
        _os_log_impl(&dword_20AD04000, v21, OS_LOG_TYPE_DEFAULT, "Client received '%s' message with missing 'service' argument", (uint8_t *)&input, 0xCu);
      }

      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
    }
LABEL_59:
    os_activity_scope_leave((os_activity_scope_state_t)buf);

    goto LABEL_70;
  }
  if (Uid == sel_mapSharedMemory)
  {
    v13 = _os_activity_create(&dword_20AD04000, "[IOGCFastPathProxyClient] mapSharedMemory", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    os_activity_scope_enter(v13, (os_activity_scope_state_t)buf);
    uint64_t v14 = *(unsigned int *)(a1 + 64);
    if (v14)
    {
      input.opaque[0] = 0;
      *(void *)outputStruct = 0;
      int v15 = MEMORY[0x21052C4D0](v14, 0, mach_task_self_, &input, outputStruct, 1);
      v16 = _gc_log_iokit();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v79 = 67109120;
        *(_DWORD *)&v79[4] = v15;
        _os_log_impl(&dword_20AD04000, v16, OS_LOG_TYPE_DEFAULT, "IOConnectMapMemory64() returns %{mach.errno}d", v79, 8u);
      }

      if (v15)
      {
        xpc_object_t v17 = xpc_dictionary_create_reply(v4);
        xpc_dictionary_set_uint64(v17, "status", v15);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v17);
      }
      else
      {
        object_handle[0] = 0;
        memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, (memory_object_size_t *)outputStruct, input.opaque[0], 1, object_handle, 0);
        v35 = _gc_log_iokit();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v79 = 67109120;
          *(_DWORD *)&v79[4] = memory_entry_64;
          _os_log_impl(&dword_20AD04000, v35, OS_LOG_TYPE_DEFAULT, "mach_make_memory_entry_64() returns %{mach.errno}d", v79, 8u);
        }

        v36 = xpc_dictionary_create_reply(v4);
        if (memory_entry_64)
        {
          xpc_dictionary_set_uint64(v36, "status", memory_entry_64);
        }
        else
        {
          xpc_dictionary_set_uint64(v36, "status", 0);
          xpc_dictionary_set_mach_send();
          xpc_dictionary_set_uint64(v36, "memory_size", *(uint64_t *)outputStruct);
        }
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v36);
      }
      goto LABEL_69;
    }
    goto LABEL_36;
  }
  if (Uid == sel_open)
  {
    id v9 = _os_activity_create(&dword_20AD04000, "[IOGCFastPathProxyClient] open", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    os_activity_scope_enter(v9, (os_activity_scope_state_t)buf);
    mach_port_t v18 = *(_DWORD *)(a1 + 64);
    if (v18)
    {
      input.opaque[0] = 0;
      v19 = IOConnectCallMethod(v18, 0, input.opaque, 1u, 0, 0, 0, 0, 0, 0);
      v20 = _gc_log_iokit();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)outputStruct = 67109120;
        *(_DWORD *)&outputStruct[4] = v19;
        _os_log_impl(&dword_20AD04000, v20, OS_LOG_TYPE_DEFAULT, "IOConnectCallMethod() returns %{mach.errno}d", outputStruct, 8u);
      }
      goto LABEL_35;
    }
LABEL_58:
    v45 = xpc_dictionary_create_reply(v4);
    xpc_dictionary_set_uint64(v45, "status", 0xFFFFFFFFE00002D8);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v45);

    goto LABEL_59;
  }
  if (Uid == sel_close)
  {
    id v9 = _os_activity_create(&dword_20AD04000, "[IOGCFastPathProxyClient] Close", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    os_activity_scope_enter(v9, (os_activity_scope_state_t)buf);
    v22 = *(_DWORD *)(a1 + 64);
    if (v22)
    {
      input.opaque[0] = 0;
      v19 = IOConnectCallMethod(v22, 1u, input.opaque, 1u, 0, 0, 0, 0, 0, 0);
      v20 = _gc_log_iokit();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)outputStruct = 67109120;
        *(_DWORD *)&outputStruct[4] = v19;
        _os_log_impl(&dword_20AD04000, v20, OS_LOG_TYPE_DEFAULT, "IOConnectCallMethod() returns %{mach.errno}d", outputStruct, 8u);
      }
LABEL_35:

      v23 = xpc_dictionary_create_reply(v4);
      xpc_dictionary_set_uint64(v23, "status", v19);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v23);

      goto LABEL_59;
    }
    goto LABEL_58;
  }
  if (Uid == sel_getProperty_)
  {
    v29 = _os_activity_create(&dword_20AD04000, "[IOGCFastPathProxyClient] GetProperty", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    input.opaque[0] = 0;
    input.opaque[1] = 0;
    os_activity_scope_enter(v29, &input);
    if (*(_DWORD *)(a1 + 64))
    {
      v30 = xpc_dictionary_get_string(v4, "key");
      if (!v30)
      {
        v62 = _gc_log_iokit();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v6;
          _os_log_impl(&dword_20AD04000, v62, OS_LOG_TYPE_DEFAULT, "Client received '%s' message with missing 'key' argument", buf, 0xCu);
        }

        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
        goto LABEL_90;
      }
      CFProperty = (void *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 60), (CFStringRef)+[NSString stringWithUTF8String:v30], kCFAllocatorDefault, 0);
      v32 = _gc_log_iokit();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = CFProperty;
        _os_log_impl(&dword_20AD04000, v32, OS_LOG_TYPE_DEFAULT, "IORegistryEntryCreateCFProperty(%s) returns %@", buf, 0x16u);
      }

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = xpc_dictionary_create_reply(v4);
        xpc_dictionary_set_uint64(v33, "value", [CFProperty unsignedIntegerValue]);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v33);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v33 = xpc_dictionary_create_reply(v4);
          xpc_dictionary_set_string(v33, "value", (const char *)[CFProperty UTF8String]);
        }
        else
        {
          v33 = xpc_dictionary_create_reply(v4);
        }
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v33);
      }
    }
    else
    {
      CFProperty = xpc_dictionary_create_reply(v4);
      xpc_dictionary_set_uint64(CFProperty, "status", 0xFFFFFFFFE00002D8);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), CFProperty);
    }

LABEL_90:
    os_activity_scope_leave(&input);

    goto LABEL_70;
  }
  if (Uid == sel_createInputQueue_)
  {
    v13 = _os_activity_create(&dword_20AD04000, "[IOGCFastPathProxyClient] CreateInputQueue", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    os_activity_scope_enter(v13, (os_activity_scope_state_t)buf);
    if (*(_DWORD *)(a1 + 64))
    {
      input.opaque[0] = 0;
      *(void *)outputStruct = 0;
      object_handle[0] = 1;
      v37 = IOCFSerialize(&unk_26BEE28C0, 0);
      v38 = v37;
      if (v37)
      {
        v39 = *(_DWORD *)(a1 + 64);
        BytePtr = CFDataGetBytePtr(v37);
        Length = CFDataGetLength(v38);
        v42 = IOConnectCallMethod(v39, 2u, input.opaque, 1u, BytePtr, Length, (uint64_t *)outputStruct, object_handle, 0, 0);
        v43 = _gc_log_iokit();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v79 = 67109120;
          *(_DWORD *)&v79[4] = v42;
          _os_log_impl(&dword_20AD04000, v43, OS_LOG_TYPE_DEFAULT, "IOConnectCallMethod() returns %{mach.errno}d", v79, 8u);
        }

        v44 = xpc_dictionary_create_reply(v4);
        xpc_dictionary_set_uint64(v44, "status", v42);
        xpc_dictionary_set_uint64(v44, "port", *(uint64_t *)outputStruct);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v44);
      }
      else
      {
        v44 = xpc_dictionary_create_reply(v4);
        xpc_dictionary_set_uint64(v44, "status", 0xFFFFFFFFE00002C9);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v44);
      }

      goto LABEL_69;
    }
LABEL_36:
    v24 = xpc_dictionary_create_reply(v4);
    xpc_dictionary_set_uint64(v24, "status", 0xFFFFFFFFE00002D8);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v24);

LABEL_69:
    os_activity_scope_leave((os_activity_scope_state_t)buf);

    goto LABEL_70;
  }
  if (Uid != sel_mapMemoryForQueue_)
  {
    if (Uid != sel_getQueue_properties_)
    {
      v8 = _gc_log_iokit();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v6;
        _os_log_impl(&dword_20AD04000, v8, OS_LOG_TYPE_DEFAULT, "Client received message without unknown selector: %s", buf, 0xCu);
      }
LABEL_13:

      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
      goto LABEL_70;
    }
    v51 = _os_activity_create(&dword_20AD04000, "[IOGCFastPathProxyClient] GetQueueProperties", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    os_activity_scope_enter(v51, (os_activity_scope_state_t)buf);
    if (*(_DWORD *)(a1 + 64))
    {
      uint64 = xpc_dictionary_get_uint64(v4, "queue");
      if (!uint64)
      {
        v65 = _gc_log_iokit();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(input.opaque[0]) = 136315138;
          *(uint64_t *)((char *)input.opaque + 4) = v6;
          _os_log_impl(&dword_20AD04000, v65, OS_LOG_TYPE_DEFAULT, "Client received '%s' message with missing 'queue' argument", (uint8_t *)&input, 0xCu);
        }

        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
        goto LABEL_116;
      }
      v53 = xpc_dictionary_get_array(v4, "keys");
      if (v53)
      {
        input.opaque[0] = uint64;
        *(void *)outputStruct = 0;
        *(void *)v79 = -3;
        *(void *)object_handle = 0;
        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472;
        applier[2] = __42___IOGCFastPathProxyClient_handleMessage___block_invoke;
        applier[3] = &unk_26BEC5208;
        v54 = objc_alloc_init((Class)&off_26BEEE5A8);
        v75 = v54;
        xpc_array_apply(v53, applier);
        v55 = IOCFSerialize(v54, 0);
        v56 = v55;
        if (v55)
        {
          v57 = *(_DWORD *)(a1 + 64);
          v58 = CFDataGetBytePtr(v55);
          v59 = CFDataGetLength(v56);
          v60 = IOConnectCallMethod(v57, 5u, input.opaque, 1u, v58, v59, 0, 0, outputStruct, (size_t *)v79);
          if (v60)
          {
            v61 = xpc_dictionary_create_reply(v4);
            xpc_dictionary_set_uint64(v61, "status", v60);
            xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v61);
          }
          else
          {
            v61 = IOCFUnserializeBinary(*(const char **)outputStruct, *(size_t *)v79, kCFAllocatorDefault, 0, (CFStringRef *)object_handle);
            if (v61 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v70 = xpc_dictionary_create_reply(v4);
              xpc_dictionary_set_uint64(v70, "status", 0);
              v72[0] = _NSConcreteStackBlock;
              v72[1] = 3221225472;
              v72[2] = __42___IOGCFastPathProxyClient_handleMessage___block_invoke_2;
              v72[3] = &unk_26BEC5230;
              v71 = xpc_dictionary_create_empty();
              v73 = v71;
              [v61 enumerateKeysAndObjectsUsingBlock:v72];
              xpc_dictionary_set_value(v70, "properties", v71);
              xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v70);
            }
            else
            {
              v70 = xpc_dictionary_create_reply(v4);
              xpc_dictionary_set_uint64(v70, "status", 0xFFFFFFFFE00002C9);
              xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v70);
            }
          }
        }
        else
        {
          v61 = xpc_dictionary_create_reply(v4);
          xpc_dictionary_set_uint64(v61, "status", 0xFFFFFFFFE00002C9);
          xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v61);
        }
      }
      else
      {
        v69 = _gc_log_iokit();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(input.opaque[0]) = 136315138;
          *(uint64_t *)((char *)input.opaque + 4) = v6;
          _os_log_impl(&dword_20AD04000, v69, OS_LOG_TYPE_DEFAULT, "Client received '%s' message with missing 'queue' argument", (uint8_t *)&input, 0xCu);
        }

        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
      }
    }
    else
    {
      v53 = xpc_dictionary_create_reply(v4);
      xpc_dictionary_set_uint64(v53, "status", 0xFFFFFFFFE00002D8);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v53);
    }

LABEL_116:
    os_activity_scope_leave((os_activity_scope_state_t)buf);

    goto LABEL_70;
  }
  v46 = _os_activity_create(&dword_20AD04000, "[IOGCFastPathProxyClient] MapMemoryForQueue", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  input.opaque[0] = 0;
  input.opaque[1] = 0;
  os_activity_scope_enter(v46, &input);
  if (*(_DWORD *)(a1 + 64))
  {
    v47 = xpc_dictionary_get_uint64(v4, "queue");
    if (v47)
    {
      *(void *)outputStruct = 0;
      *(void *)v79 = 0;
      v48 = MEMORY[0x21052C4D0](*(unsigned int *)(a1 + 64), v47, mach_task_self_, outputStruct, v79, 1);
      v49 = _gc_log_iokit();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v48;
        _os_log_impl(&dword_20AD04000, v49, OS_LOG_TYPE_DEFAULT, "IOConnectMapMemory64() returns %{mach.errno}d", buf, 8u);
      }

      if (v48)
      {
        v50 = xpc_dictionary_create_reply(v4);
        xpc_dictionary_set_uint64(v50, "status", v48);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v50);
      }
      else
      {
        object_handle[0] = 0;
        v66 = mach_make_memory_entry_64(mach_task_self_, (memory_object_size_t *)v79, *(memory_object_offset_t *)outputStruct, 1, object_handle, 0);
        v67 = _gc_log_iokit();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = *(void *)outputStruct;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v66;
          _os_log_impl(&dword_20AD04000, v67, OS_LOG_TYPE_DEFAULT, "mach_make_memory_entry_64(%p) returns %{mach.errno}d", buf, 0x12u);
        }

        v68 = xpc_dictionary_create_reply(v4);
        if (v66)
        {
          xpc_dictionary_set_uint64(v68, "status", v66);
        }
        else
        {
          xpc_dictionary_set_uint64(v68, "status", 0);
          xpc_dictionary_set_mach_send();
          xpc_dictionary_set_uint64(v68, "memory_size", *(uint64_t *)v79);
        }
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v68);
      }
    }
    else
    {
      v64 = _gc_log_iokit();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v6;
        _os_log_impl(&dword_20AD04000, v64, OS_LOG_TYPE_DEFAULT, "Client received '%s' message with missing 'queue' argument", buf, 0xCu);
      }

      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
    }
  }
  else
  {
    v63 = xpc_dictionary_create_reply(v4);
    xpc_dictionary_set_uint64(v63, "status", 0xFFFFFFFFE00002D8);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v63);
  }
  os_activity_scope_leave(&input);

LABEL_70:
}

- (_IOGCFastPathProxyClient)init
{
  return 0;
}

- (void)dealloc
{
  id v3 = _gc_log_iokit();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_20AD04000, v3, OS_LOG_TYPE_DEFAULT, "%@::dealloc", buf, 0xCu);
  }

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    id v5 = self->_connection;
    self->_connection = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)_IOGCFastPathProxyClient;
  [(_IOGCFastPathProxyClient *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end