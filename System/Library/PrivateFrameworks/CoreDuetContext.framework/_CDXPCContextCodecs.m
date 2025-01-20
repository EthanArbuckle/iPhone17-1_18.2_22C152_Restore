@interface _CDXPCContextCodecs
+ (BOOL)addKeyPaths:(id)a3 toDictionary:(id)a4 error:(id *)a5;
+ (BOOL)addRegistration:(id)a3 toDictionary:(id)a4 error:(id *)a5;
+ (BOOL)parseSubscribeToContextValueNotificationsEvent:(id)a3 registration:(id *)a4 deviceIDs:(id *)a5 error:(id *)a6;
+ (BOOL)parseUnsubscribeFromContextValueNotificationsEvent:(id)a3 registration:(id *)a4 deviceIDs:(id *)a5 error:(id *)a6;
+ (id)commonContextValueNotificationsEventWithType:(const char *)a3 registration:(id)a4 deviceIDs:(id)a5 error:(id *)a6;
+ (id)fetchPropertiesEventWithRemoteKeyPaths:(id)a3 error:(id *)a4;
+ (id)keyPathsFromDictionary:(id)a3 error:(id *)a4;
+ (id)keyPathsFromFetchPropertiesEvent:(id)a3 error:(id *)a4;
+ (id)registrationFromDictionary:(id)a3 error:(id *)a4;
+ (id)subscribeToContextValueNotificationsEventWithRegistration:(id)a3 deviceIDs:(id)a4 error:(id *)a5;
+ (id)subscribeToContextValueNotificationsReplyWithEvent:(id)a3 error:(id)a4;
+ (id)supportedClassesToUnarchive;
+ (id)unsubscribeFromContextValueNotificationsEventWithRegistration:(id)a3 deviceIDs:(id)a4 error:(id *)a5;
+ (id)unsubscribeFromContextValueNotificationsReplyWithEvent:(id)a3 error:(id)a4;
@end

@implementation _CDXPCContextCodecs

+ (BOOL)addRegistration:(id)a3 toDictionary:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v12 = 0;
  v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v12];
  id v9 = v12;
  if (v8)
  {
    id v10 = v8;
    xpc_dictionary_set_data(v7, "registration", (const void *)[v10 bytes], objc_msgSend(v10, "length"));
  }
  if (a5) {
    *a5 = v9;
  }

  return v9 == 0;
}

+ (id)registrationFromDictionary:(id)a3 error:(id *)a4
{
  size_t length = 0;
  data = xpc_dictionary_get_data(a3, "registration", &length);
  if (!data
    || ([MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B668] userInfo:0];
    id v7 = 0;
    v8 = 0;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v7 = (void *)v6;
  id v11 = 0;
  v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v11];
  id v9 = v11;
  if (a4) {
LABEL_6:
  }
    *a4 = v9;
LABEL_7:

  return v8;
}

+ (BOOL)addKeyPaths:(id)a3 toDictionary:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  xpc_object_t xdict = a4;
  xpc_object_t xarray = xpc_array_create(0, 0);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    unint64_t v11 = 0x1E4F5B000uLL;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        objc_msgSend(v13, "key", xdict);
        id v14 = objc_claimAutoreleasedReturnValue();
        v15 = (const char *)[v14 UTF8String];

        id v16 = [v13 deviceID];
        v17 = (const char *)[v16 UTF8String];

        if (v15) {
          BOOL v18 = v17 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (v18)
        {
          v21 = [*(id *)(v11 + 1048) contextChannel];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v19 = [v13 key];
            v20 = [v13 deviceID];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v20;
            _os_log_error_impl(&dword_18EC9B000, v21, OS_LOG_TYPE_ERROR, "Failed to convert string to UTF-8: %@/%@", buf, 0x16u);
          }
        }
        else
        {
          v21 = xpc_string_create(v15);
          xpc_object_t v22 = xpc_string_create(v17);
          v23 = v22;
          if (v21) {
            BOOL v24 = v22 == 0;
          }
          else {
            BOOL v24 = 1;
          }
          if (v24)
          {
            v25 = [*(id *)(v11 + 1048) contextChannel];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v28 = [v13 key];
              v29 = [v13 deviceID];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v28;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v29;
              _os_log_error_impl(&dword_18EC9B000, v25, OS_LOG_TYPE_ERROR, "Failed to convert string to xpc string: %@/%@", buf, 0x16u);

              unint64_t v11 = 0x1E4F5B000;
            }
          }
          else
          {
            *(_OWORD *)buf = xmmword_1E56091F8;
            values[0] = v21;
            values[1] = v23;
            xpc_object_t v26 = xpc_dictionary_create((const char *const *)buf, values, 2uLL);
            xpc_array_append_value(xarray, v26);

            for (uint64_t j = 1; j != -1; --j)
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v9);
  }

  if (!xpc_array_get_count(xarray))
  {
    v31 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B668] userInfo:0];
    v30 = xdict;
    v32 = a5;
    if (!a5) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  v30 = xdict;
  xpc_dictionary_set_value(xdict, "keyPaths", xarray);
  v31 = 0;
  v32 = a5;
  if (a5) {
LABEL_27:
  }
    id *v32 = v31;
LABEL_28:

  return v31 == 0;
}

+ (id)keyPathsFromDictionary:(id)a3 error:(id *)a4
{
  *(void *)&v35[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = xpc_dictionary_get_array(v5, "keyPaths");
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:xpc_array_get_count(v6)];
    if (!xpc_array_get_count(v7))
    {
      id v22 = 0;
      goto LABEL_30;
    }
    id v32 = v5;
    v33 = v8;
    v31 = a4;
    size_t v9 = 0;
    uint64_t v10 = MEMORY[0x1E4F145F0];
    while (1)
    {
      unint64_t v11 = xpc_array_get_value(v7, v9);
      id v12 = xpc_dictionary_get_value(v11, "key");
      uint64_t v13 = xpc_dictionary_get_value(v11, "id");
      id v14 = (void *)v13;
      if (!v12 || !v13 || MEMORY[0x192FB23A0](v12) != v10 || MEMORY[0x192FB23A0](v14) != v10) {
        break;
      }
      string_ptr = xpc_string_get_string_ptr(v12);
      id v16 = xpc_string_get_string_ptr(v14);
      if (!string_ptr || (v17 = v16) == 0)
      {
        xpc_object_t v26 = (void *)MEMORY[0x192FB22E0](v11);
        v28 = [MEMORY[0x1E4F5B418] contextChannel];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)v35 = v26;
          _os_log_error_impl(&dword_18EC9B000, v28, OS_LOG_TYPE_ERROR, "Failed to perform string conversion: %s", buf, 0xCu);
        }

        goto LABEL_24;
      }
      BOOL v18 = [NSString stringWithUTF8String:string_ptr];
      v19 = [NSString stringWithUTF8String:v17];
      v20 = +[_CDContextualKeyPath keyPathWithKey:v18];
      v21 = +[_CDContextualKeyPath remoteKeyPathForKeyPath:v20 forDeviceID:v19];
      [v33 addObject:v21];

      if (++v9 >= xpc_array_get_count(v7))
      {
        id v22 = 0;
        id v5 = v32;
        uint64_t v8 = v33;
        goto LABEL_30;
      }
    }
    xpc_object_t v26 = (void *)MEMORY[0x192FB22E0](v11);
    v27 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v35[0] = v9;
      LOWORD(v35[1]) = 2080;
      *(void *)((char *)&v35[1] + 2) = v26;
      _os_log_error_impl(&dword_18EC9B000, v27, OS_LOG_TYPE_ERROR, "Unable to fetch strings from array at index %d: %s", buf, 0x12u);
    }

LABEL_24:
    v25 = v33;
    if (v26) {
      free(v26);
    }

    a4 = v31;
    id v5 = v32;
  }
  else
  {
    v23 = (void *)MEMORY[0x192FB22E0](v5);
    BOOL v24 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[_CDXPCContextCodecs keyPathsFromDictionary:error:]();
    }

    if (v23) {
      free(v23);
    }
    v25 = 0;
  }

  v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B670] userInfo:0];
  id v22 = v29;
  if (a4)
  {
    id v22 = v29;
    uint64_t v8 = 0;
    *a4 = v22;
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_30:

  return v8;
}

+ (id)fetchPropertiesEventWithRemoteKeyPaths:(id)a3 error:(id *)a4
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  id v6 = a3;
  keys[0] = "msgtype";
  xpc_object_t v7 = xpc_string_create("fetch-properties");
  xpc_object_t values = v7;
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  id v12 = 0;
  [a1 addKeyPaths:v6 toDictionary:v8 error:&v12];

  id v9 = v12;
  uint64_t v10 = v9;
  if (a4) {
    *a4 = v9;
  }

  return v8;
}

+ (id)keyPathsFromFetchPropertiesEvent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  string = xpc_dictionary_get_string(v6, "msgtype");
  if (string)
  {
    xpc_object_t v8 = [NSString stringWithUTF8String:string];
    int v9 = [v8 isEqualToString:@"fetch-properties"];

    if (v9)
    {
      id v15 = 0;
      uint64_t v10 = [a1 keyPathsFromDictionary:v6 error:&v15];
      id v11 = v15;
      if (!a4) {
        goto LABEL_11;
      }
LABEL_10:
      *a4 = v11;
      goto LABEL_11;
    }
  }
  id v12 = (void *)MEMORY[0x192FB22E0](v6);
  uint64_t v13 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    +[_CDXPCContextCodecs keyPathsFromFetchPropertiesEvent:error:]();
  }

  if (v12) {
    free(v12);
  }
  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B670] userInfo:0];
  uint64_t v10 = 0;
  if (a4) {
    goto LABEL_10;
  }
LABEL_11:

  return v10;
}

+ (id)commonContextValueNotificationsEventWithType:(const char *)a3 registration:(id)a4 deviceIDs:(id)a5 error:(id *)a6
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  keys[0] = "msgtype";
  xpc_object_t v12 = xpc_string_create(a3);
  xpc_object_t values = v12;
  xpc_object_t v13 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  id v20 = 0;
  int v14 = [a1 addRegistration:v11 toDictionary:v13 error:&v20];

  id v15 = v20;
  id v16 = v15;
  if (v14)
  {
    id v19 = v15;
    [a1 addDeviceIDs:v10 toDictionary:v13 error:&v19];
    id v17 = v19;

    id v16 = v17;
  }
  if (v16)
  {

    xpc_object_t v13 = 0;
  }
  if (a6) {
    *a6 = v16;
  }

  return v13;
}

+ (id)subscribeToContextValueNotificationsEventWithRegistration:(id)a3 deviceIDs:(id)a4 error:(id *)a5
{
  id v10 = 0;
  id v6 = [a1 commonContextValueNotificationsEventWithType:"subscribe" registration:a3 deviceIDs:a4 error:&v10];
  id v7 = v10;
  xpc_object_t v8 = v7;
  if (a5) {
    *a5 = v7;
  }

  return v6;
}

+ (BOOL)parseSubscribeToContextValueNotificationsEvent:(id)a3 registration:(id *)a4 deviceIDs:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  string = xpc_dictionary_get_string(v10, "msgtype");
  if (!string
    || ([NSString stringWithUTF8String:string],
        xpc_object_t v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqualToString:@"subscribe"],
        v12,
        !v13))
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B670] userInfo:0];
    goto LABEL_7;
  }
  if (a4)
  {
    id v21 = 0;
    int v14 = [a1 registrationFromDictionary:v10 error:&v21];
    id v15 = v21;
    *a4 = v14;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v15 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if (!v15)
  {
    id v20 = 0;
    id v19 = [a1 deviceIDsFromDictionary:v10 error:&v20];
    id v15 = v20;
    *a5 = v19;
  }
LABEL_7:
  if (v15)
  {
    id v16 = (void *)MEMORY[0x192FB22E0](v10);
    id v17 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[_CDXPCContextCodecs parseSubscribeToContextValueNotificationsEvent:registration:deviceIDs:error:]();
    }

    if (v16) {
      free(v16);
    }
    if (a6) {
      *a6 = v15;
    }
  }

  return v15 == 0;
}

+ (id)subscribeToContextValueNotificationsReplyWithEvent:(id)a3 error:(id)a4
{
  id v6 = a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (v6) {
    [a1 addError:v6 toReply:reply];
  }

  return reply;
}

+ (id)unsubscribeFromContextValueNotificationsEventWithRegistration:(id)a3 deviceIDs:(id)a4 error:(id *)a5
{
  id v10 = 0;
  id v6 = [a1 commonContextValueNotificationsEventWithType:"unsubscribe" registration:a3 deviceIDs:a4 error:&v10];
  id v7 = v10;
  xpc_object_t v8 = v7;
  if (a5) {
    *a5 = v7;
  }

  return v6;
}

+ (BOOL)parseUnsubscribeFromContextValueNotificationsEvent:(id)a3 registration:(id *)a4 deviceIDs:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  string = xpc_dictionary_get_string(v10, "msgtype");
  if (!string
    || ([NSString stringWithUTF8String:string],
        xpc_object_t v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqualToString:@"unsubscribe"],
        v12,
        !v13))
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B670] userInfo:0];
    goto LABEL_7;
  }
  if (a4)
  {
    id v21 = 0;
    int v14 = [a1 registrationFromDictionary:v10 error:&v21];
    id v15 = v21;
    *a4 = v14;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v15 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if (!v15)
  {
    id v20 = 0;
    id v19 = [a1 deviceIDsFromDictionary:v10 error:&v20];
    id v15 = v20;
    *a5 = v19;
  }
LABEL_7:
  if (v15)
  {
    id v16 = (void *)MEMORY[0x192FB22E0](v10);
    id v17 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[_CDXPCContextCodecs parseSubscribeToContextValueNotificationsEvent:registration:deviceIDs:error:]();
    }

    if (v16) {
      free(v16);
    }
    if (a6) {
      *a6 = v15;
    }
  }

  return v15 == 0;
}

+ (id)unsubscribeFromContextValueNotificationsReplyWithEvent:(id)a3 error:(id)a4
{
  id v6 = a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (v6) {
    [a1 addError:v6 toReply:reply];
  }

  return reply;
}

+ (id)supportedClassesToUnarchive
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS____CDXPCContextCodecs;
  v2 = objc_msgSendSuper2(&v9, sel_supportedClassesToUnarchive);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___CDXPCContextCodecs_supportedClassesToUnarchive__block_invoke;
  block[3] = &unk_1E5609210;
  id v8 = v2;
  uint64_t v3 = supportedClassesToUnarchive_initialized;
  id v4 = v2;
  if (v3 != -1) {
    dispatch_once(&supportedClassesToUnarchive_initialized, block);
  }
  id v5 = (id)supportedClassesToUnarchive_supportedClasses;

  return v5;
}

+ (void)keyPathsFromDictionary:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "Unable to fetch key paths from dictionary: %s", v2, v3, v4, v5, v6);
}

+ (void)keyPathsFromFetchPropertiesEvent:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "Unknown event type in dictionary: %s", v2, v3, v4, v5, v6);
}

+ (void)parseSubscribeToContextValueNotificationsEvent:registration:deviceIDs:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "Invalid event: %s", v2, v3, v4, v5, v6);
}

@end