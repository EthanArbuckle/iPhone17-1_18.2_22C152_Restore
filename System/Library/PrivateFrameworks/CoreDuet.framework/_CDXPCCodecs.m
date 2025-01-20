@interface _CDXPCCodecs
+ (BOOL)addDeviceIDs:(id)a3 toDictionary:(id)a4 error:(id *)a5;
+ (BOOL)keepAliveFromKeepAliveEvent:(id)a3 error:(id *)a4;
+ (BOOL)parseNotificationEvent:(id)a3 registrationIdentifier:(id *)a4 info:(id *)a5 error:(id *)a6;
+ (id)_log;
+ (id)deviceIDsFromDictionary:(id)a3 error:(id *)a4;
+ (id)errorFromReply:(id)a3;
+ (id)fetchPropertiesReplyWithEvent:(id)a3 error:(id)a4;
+ (id)fetchProxySourceDeviceUUIDEvent;
+ (id)fetchProxySourceDeviceUUIDReplyWithEvent:(id)a3 sourceDeviceUUID:(id)a4 error:(id)a5;
+ (id)keepAliveEventWithKeepAlive:(BOOL)a3 error:(id *)a4;
+ (id)keepAliveReplyWithEvent:(id)a3 error:(id)a4;
+ (id)messageTypeFromEvent:(id)a3;
+ (id)notificationEventWithRegistrationIdentifier:(id)a3 info:(id)a4 error:(id *)a5;
+ (id)parseProxySourceDeviceUUIDEvent:(id)a3 error:(id *)a4;
+ (id)requestActivateDevicesEvent;
+ (id)requestActivateDevicesReplyWithEvent:(id)a3 error:(id)a4;
+ (id)supportedClassesToUnarchive;
+ (int64_t)eventTypeWithEvent:(id)a3;
+ (void)addError:(id)a3 toReply:(id)a4;
@end

@implementation _CDXPCCodecs

+ (id)_log
{
  if (_log_onceToken != -1) {
    dispatch_once(&_log_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)_log_log;
  return v2;
}

+ (BOOL)addDeviceIDs:(id)a3 toDictionary:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  xpc_object_t xdict = a4;
  xpc_object_t v7 = xpc_array_create(0, 0);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v23 + 1) + 8 * i);
        v14 = (const char *)[v13 UTF8String];
        if (v14)
        {
          v15 = xpc_string_create(v14);
          if (v15)
          {
            xpc_array_append_value(v7, v15);
          }
          else
          {
            v16 = +[_CDXPCCodecs _log];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v28 = v13;
              _os_log_error_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_ERROR, "Failed to convert string to xpc string: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          v15 = +[_CDXPCCodecs _log];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v28 = v13;
            _os_log_error_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_ERROR, "Failed to convert string to UTF-8: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v10);
  }

  if (!xpc_array_get_count(v7))
  {
    v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduetd" code:7 userInfo:0];
    v17 = xdict;
    v19 = a5;
    if (!a5) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v17 = xdict;
  xpc_dictionary_set_value(xdict, "ids", v7);
  v18 = 0;
  v19 = a5;
  if (a5) {
LABEL_18:
  }
    id *v19 = v18;
LABEL_19:

  return v18 == 0;
}

+ (id)deviceIDsFromDictionary:(id)a3 error:(id *)a4
{
  v5 = xpc_dictionary_get_array(a3, "ids");
  if (v5)
  {
    id v6 = objc_opt_new();
    if (!xpc_array_get_count(v5)) {
      goto LABEL_13;
    }
    size_t v7 = 0;
    char v8 = 0;
    uint64_t v9 = MEMORY[0x1E4F145F0];
    do
    {
      uint64_t v10 = xpc_array_get_value(v5, v7);
      uint64_t v11 = (void *)v10;
      if (v10 && MEMORY[0x192FB3850](v10) == v9 && (string_ptr = xpc_string_get_string_ptr(v11)) != 0)
      {
        id v13 = [NSString stringWithUTF8String:string_ptr];
        [v6 addObject:v13];
      }
      else
      {
        char v8 = 1;
      }

      ++v7;
    }
    while (v7 < xpc_array_get_count(v5));
    if ((v8 & 1) == 0)
    {
LABEL_13:
      id v14 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    id v6 = 0;
  }

  v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduetd" code:6 userInfo:0];
  id v14 = v15;
  if (a4)
  {
    id v14 = v15;
    id v6 = 0;
    *a4 = v14;
  }
  else
  {
    id v6 = 0;
  }
LABEL_17:

  return v6;
}

+ (void)addError:(id)a3 toReply:(id)a4
{
  if (a3 && a4)
  {
    xpc_object_t xdict = a4;
    id v5 = a3;
    id v6 = [v5 domain];
    size_t v7 = (const char *)[v6 UTF8String];

    xpc_dictionary_set_string(xdict, "error_domain", v7);
    int64_t v8 = [v5 code];

    xpc_dictionary_set_int64(xdict, "error_code", v8);
  }
}

+ (id)errorFromReply:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && (string = xpc_dictionary_get_string(v3, "error_domain")) != 0)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", string);
    size_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v6, xpc_dictionary_get_int64(v4, "error_code"), 0);
  }
  else
  {
    size_t v7 = 0;
  }

  return v7;
}

+ (int64_t)eventTypeWithEvent:(id)a3
{
  id v3 = a3;
  if (eventTypeWithEvent__initialized != -1) {
    dispatch_once(&eventTypeWithEvent__initialized, &__block_literal_global_503);
  }
  string = xpc_dictionary_get_string(v3, "msgtype");
  if (string)
  {
    id v5 = [NSString stringWithUTF8String:string];
    id v6 = [(id)eventTypeWithEvent__eventTypeByMsgType objectForKeyedSubscript:v5];
    int64_t v7 = [v6 integerValue];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

+ (id)fetchPropertiesReplyWithEvent:(id)a3 error:(id)a4
{
  id v6 = a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (v6) {
    [a1 addError:v6 toReply:reply];
  }

  return reply;
}

+ (id)keepAliveEventWithKeepAlive:(BOOL)a3 error:(id *)a4
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  xpc_object_t values = xpc_string_create("keep-alive");
  keys[0] = "msgtype";
  xpc_object_t v6 = values;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  xpc_dictionary_set_BOOL(v7, "keepAlive", a3);
  if (a4) {
    *a4 = 0;
  }

  return v7;
}

+ (BOOL)keepAliveFromKeepAliveEvent:(id)a3 error:(id *)a4
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "msgtype");
  if (string)
  {
    xpc_object_t v7 = [NSString stringWithUTF8String:string];
    int v8 = [v7 isEqualToString:@"keep-alive"];

    if (v8)
    {
      BOOL v9 = xpc_dictionary_get_BOOL(v5, "keepAlive");
      uint64_t v10 = 0;
      if (!a4) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  uint64_t v11 = (void *)MEMORY[0x192FB36A0](v5);
  v12 = +[_CDXPCCodecs _log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    +[_CDXPCCodecs keepAliveFromKeepAliveEvent:error:]();
  }

  if (v11) {
    free(v11);
  }
  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduetd" code:6 userInfo:0];
  BOOL v9 = 0;
  if (a4) {
LABEL_10:
  }
    *a4 = v10;
LABEL_11:

  return v9;
}

+ (id)keepAliveReplyWithEvent:(id)a3 error:(id)a4
{
  id v6 = a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (v6) {
    [a1 addError:v6 toReply:reply];
  }

  return reply;
}

+ (id)notificationEventWithRegistrationIdentifier:(id)a3 info:(id)a4 error:(id *)a5
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  keys[0] = "msgtype";
  xpc_object_t v9 = xpc_string_create("notification");
  xpc_object_t values = v9;
  xpc_object_t v10 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  id v11 = v8;
  v12 = (const char *)[v11 UTF8String];

  xpc_dictionary_set_string(v10, "id", v12);
  id v18 = 0;
  id v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:0 error:&v18];
  id v14 = v18;
  if (v13)
  {
    id v15 = v13;
    xpc_dictionary_set_data(v10, "info", (const void *)[v15 bytes], objc_msgSend(v15, "length"));
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v17 = +[_CDXPCCodecs _log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:info:error:]();
  }

  xpc_object_t v10 = 0;
  if (a5) {
LABEL_3:
  }
    *a5 = v14;
LABEL_4:

  return v10;
}

+ (BOOL)parseNotificationEvent:(id)a3 registrationIdentifier:(id *)a4 info:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  string = xpc_dictionary_get_string(v10, "msgtype");
  if (string)
  {
    v12 = [NSString stringWithUTF8String:string];
    int v13 = [v12 isEqualToString:@"notification"];

    if (v13)
    {
      if (a4)
      {
        id v14 = xpc_dictionary_get_string(v10, "id");
        if (v14)
        {
          id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v14);
          id v16 = 0;
        }
        else
        {
          id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduetd" code:6 userInfo:0];
          id v15 = 0;
        }
        id v18 = v15;
        *a4 = v18;
        size_t length = 0;
        data = xpc_dictionary_get_data(v10, "info", &length);
        if (data)
        {
          v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
          v21 = [a1 supportedClassesToUnarchive];
          id v28 = v16;
          v22 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v21 fromData:v20 error:&v28];
          id v17 = v28;

          if (!v22)
          {
            long long v23 = +[_CDXPCCodecs _log];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
              +[_CDXPCCodecs parseNotificationEvent:registrationIdentifier:info:error:]();
            }
          }
          id v16 = v22;
          *a5 = v16;
        }
        else
        {
          id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduetd" code:6 userInfo:0];
        }

        if (v17) {
          goto LABEL_18;
        }
      }
      else
      {
        id v17 = 0;
      }
LABEL_24:
      BOOL v26 = 1;
      goto LABEL_26;
    }
  }
  id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduetd" code:6 userInfo:0];
  if (!v17) {
    goto LABEL_24;
  }
LABEL_18:
  long long v24 = (void *)MEMORY[0x192FB36A0](v10);
  long long v25 = +[_CDXPCCodecs _log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    +[_CDXPCCodecs parseNotificationEvent:registrationIdentifier:info:error:]();
  }

  if (v24) {
    free(v24);
  }
  if (a6)
  {
    id v17 = v17;
    BOOL v26 = 0;
    *a6 = v17;
  }
  else
  {
    BOOL v26 = 0;
  }
LABEL_26:

  return v26;
}

+ (id)fetchProxySourceDeviceUUIDEvent
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  xpc_object_t values = xpc_string_create("fetch-uuid");
  keys[0] = "msgtype";
  xpc_object_t v2 = values;
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);

  return v3;
}

+ (id)fetchProxySourceDeviceUUIDReplyWithEvent:(id)a3 sourceDeviceUUID:(id)a4 error:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (v9)
  {
    [a1 addError:v9 toReply:reply];
  }
  else
  {
    xpc_object_t v11 = xpc_string_create("fetch-uuid");
    xpc_dictionary_set_value(reply, "msgtype", v11);
    *(void *)uuid = 0;
    uint64_t v14 = 0;
    [v8 getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(reply, "uuid", uuid);
  }
  return reply;
}

+ (id)parseProxySourceDeviceUUIDEvent:(id)a3 error:(id *)a4
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "msgtype");
  if (string
    && ([NSString stringWithUTF8String:string],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"fetch-uuid"],
        v7,
        v8)
    && (id v9 = xpc_dictionary_get_string(v5, "uuid")) != 0
    && (uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v9]) != 0)
  {
    xpc_object_t v11 = (void *)v10;
    id v12 = 0;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduetd" code:6 userInfo:0];
    if (!v12) {
      goto LABEL_13;
    }
    int v13 = (void *)MEMORY[0x192FB36A0](v5);
    uint64_t v14 = +[_CDXPCCodecs _log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[_CDXPCCodecs parseNotificationEvent:registrationIdentifier:info:error:]();
    }

    if (v13) {
      free(v13);
    }
    if (a4)
    {
      id v12 = v12;
      xpc_object_t v11 = 0;
      *a4 = v12;
    }
    else
    {
LABEL_13:
      xpc_object_t v11 = 0;
    }
  }

  return v11;
}

+ (id)requestActivateDevicesEvent
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  xpc_object_t values = xpc_string_create("activate-devices");
  keys[0] = "msgtype";
  xpc_object_t v2 = values;
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);

  return v3;
}

+ (id)requestActivateDevicesReplyWithEvent:(id)a3 error:(id)a4
{
  id v6 = a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (v6)
  {
    [a1 addError:v6 toReply:reply];
  }
  else
  {
    xpc_object_t v8 = xpc_string_create("activate-devices");
    xpc_dictionary_set_value(reply, "msgtype", v8);
  }
  return reply;
}

+ (id)messageTypeFromEvent:(id)a3
{
  string = (void *)xpc_dictionary_get_string(a3, "msgtype");
  if (string)
  {
    string = [NSString stringWithUTF8String:string];
  }
  return string;
}

+ (id)supportedClassesToUnarchive
{
  if (supportedClassesToUnarchive_initialized != -1) {
    dispatch_once(&supportedClassesToUnarchive_initialized, &__block_literal_global_551);
  }
  xpc_object_t v2 = (void *)supportedClassesToUnarchive_supportedClasses;
  return v2;
}

+ (void)keepAliveFromKeepAliveEvent:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Unknown event type in dictionary: %s", v2, v3, v4, v5, v6);
}

+ (void)notificationEventWithRegistrationIdentifier:info:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_18ECEB000, v1, OS_LOG_TYPE_FAULT, "Unable to encode info %@: %@", v2, 0x16u);
}

+ (void)parseNotificationEvent:registrationIdentifier:info:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Invalid event: %s", v2, v3, v4, v5, v6);
}

+ (void)parseNotificationEvent:registrationIdentifier:info:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_FAULT, "Unable to decode info: %@", v1, 0xCu);
}

@end