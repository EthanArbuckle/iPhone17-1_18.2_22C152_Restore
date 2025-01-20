@interface GSSCredXPCHelperClient
+ (id)createXPCConnection:(unsigned int)a3;
+ (int)acquireForCred:(HeimCred_s *)a3 expireTime:(int64_t *)a4;
+ (int)refreshForCred:(HeimCred_s *)a3 expireTime:(int64_t *)a4;
+ (void)sendWakeup:(id)a3;
@end

@implementation GSSCredXPCHelperClient

+ (id)createXPCConnection:(unsigned int)a3
{
  id v10 = a1;
  SEL v9 = a2;
  unsigned int v8 = a3;
  id v7 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.GSSCred" options:4096];

  objc_msgSend(v7, "setInterruptionHandler:");
  objc_msgSend(v7, "setInvalidationHandler:");
  memset(uu, 0, sizeof(uu));
  uuid_parse("D58511E6-6A96-41F0-B5CB-885DF4E3A531", uu);
  if (v8)
  {
    *(_DWORD *)uuid_t uu = v8;
    id v6 = [v7 _xpcConnection];
    xpc_connection_set_oneshot_instance();
  }
  objc_msgSend(v7, "resume", &v7);
  id v5 = v7;
  objc_storeStrong(location, 0);

  return v5;
}

+ (void)sendWakeup:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "command", "wakeup");
  v3 = (_xpc_connection_s *)[location[0] _xpcConnection];
  xpc_connection_send_message(v3, v4);

  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

+ (int)acquireForCred:(HeimCred_s *)a3 expireTime:(int64_t *)a4
{
  id v33 = a1;
  SEL v32 = a2;
  v31 = a3;
  v30 = a4;
  id v29 = sub_10001120C();
  char v28 = 2;
  if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEBUG))
  {
    log = v29;
    os_log_type_t type = v28;
    v36 = (__CFString *)CFUUIDCreateString(0, v31->var1);
    v11 = v36;
    v27 = v11;
    sub_100006434((uint64_t)v38, (uint64_t)v27);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "gsscred_cache_acquire: %@", v38, 0xCu);

    objc_storeStrong((id *)&v27, 0);
  }
  objc_storeStrong(&v29, 0);
  id v26 = [v33 createXPCConnection:v31->var11];
  [v33 sendWakeup:v26];
  var2 = 0;
  var2 = v31->var2;
  id v24 = (id)_CFXPCCreateXPCObjectFromCFObject();
  if (v24)
  {
    id v22 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v22, "command", "acquire");
    xpc_dictionary_set_value(v22, "attributes", v24);
    unsigned int v8 = (_xpc_connection_s *)[v26 _xpcConnection];
    id v21 = xpc_connection_send_message_with_reply_sync(v8, v22);

    [v26 invalidate];
    if (!v21)
    {
      id v20 = sub_10001120C();
      char v19 = 16;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      {
        id v6 = v20;
        os_log_type_t v7 = v19;
        sub_100003CE0(v18);
        _os_log_error_impl((void *)&_mh_execute_header, v6, v7, "server did not return any data", v18, 2u);
      }
      objc_storeStrong(&v20, 0);
    }
    if (xpc_get_type(v21) == (xpc_type_t)&_xpc_type_error)
    {
      os_log_t oslog = (os_log_t)sub_10001120C();
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_100006434((uint64_t)v37, (uint64_t)v21);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v16, "server returned an error: %@", v37, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    if (xpc_get_type(v21) == (xpc_type_t)&_xpc_type_dictionary)
    {
      id v35 = (id)_CFXPCCreateCFObjectFromXPCObject();
      id v15 = v35;
      id v14 = [v15 objectForKeyedSubscript:@"result"];
      id v13 = [v14 objectForKeyedSubscript:@"status"];
      id v12 = [v14 objectForKeyedSubscript:@"expire"];
      id v4 = [v12 longValue];
      int64_t *v30 = (int64_t)v4;
      int v34 = [v13 intValue];
      int v23 = 1;
      objc_storeStrong(&v12, 0);
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
    }
    else
    {
      int v34 = 1;
      int v23 = 1;
    }
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
  }
  else
  {
    int v34 = -1765328188;
    int v23 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v26, 0);
  return v34;
}

+ (int)refreshForCred:(HeimCred_s *)a3 expireTime:(int64_t *)a4
{
  id v30 = a1;
  SEL v29 = a2;
  char v28 = a3;
  v27 = a4;
  id v26 = sub_10001120C();
  char v25 = 2;
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
  {
    log = v26;
    os_log_type_t type = v25;
    id v33 = (__CFString *)CFUUIDCreateString(0, v28->var1);
    SEL v9 = v33;
    id v24 = v9;
    sub_100006434((uint64_t)v36, (uint64_t)v24);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "gsscred_cache_refresh: %@", v36, 0xCu);

    objc_storeStrong((id *)&v24, 0);
  }
  objc_storeStrong(&v26, 0);
  id v23 = [v30 createXPCConnection:v28->var11];
  [v30 sendWakeup:v23];
  var2 = 0;
  var2 = v28->var2;
  id v21 = (id)_CFXPCCreateXPCObjectFromCFObject();
  if (v21)
  {
    id v19 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v19, "command", "refresh");
    xpc_dictionary_set_value(v19, "attributes", v21);
    id v6 = (_xpc_connection_s *)[v23 _xpcConnection];
    id v18 = xpc_connection_send_message_with_reply_sync(v6, v19);

    [v23 invalidate];
    if (!v18)
    {
      id v17 = sub_10001120C();
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        sub_100006434((uint64_t)v35, (uint64_t)v18);
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v17, v16, "server returned an error during wakeup: %@", v35, 0xCu);
      }
      objc_storeStrong(&v17, 0);
    }
    if (xpc_get_type(v18) == (xpc_type_t)&_xpc_type_error)
    {
      os_log_t oslog = (os_log_t)sub_10001120C();
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_100006434((uint64_t)v34, (uint64_t)v18);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v14, "server returned an error: %@", v34, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    if (xpc_get_type(v18) == (xpc_type_t)&_xpc_type_dictionary)
    {
      id v32 = (id)_CFXPCCreateCFObjectFromXPCObject();
      id v13 = v32;
      id v12 = [v13 objectForKeyedSubscript:@"result"];
      id v11 = [v12 objectForKeyedSubscript:@"status"];
      id v10 = [v12 objectForKeyedSubscript:@"expire"];
      id v4 = [v10 longValue];
      int64_t *v27 = (int64_t)v4;
      int v31 = [v11 intValue];
      int v20 = 1;
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v12, 0);
      objc_storeStrong(&v13, 0);
    }
    else
    {
      int v31 = 1;
      int v20 = 1;
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    int v31 = -1765328188;
    int v20 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v23, 0);
  return v31;
}

@end