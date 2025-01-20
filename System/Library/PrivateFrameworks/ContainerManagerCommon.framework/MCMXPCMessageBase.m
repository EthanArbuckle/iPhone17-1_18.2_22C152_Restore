@interface MCMXPCMessageBase
+ (id)userIdentityForContainerIdentifier:(id)a3 clientIdentity:(id)a4 containerClass:(unint64_t)a5 error:(unint64_t *)a6;
+ (id)xpcMessageFromXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (MCMCommandContext)context;
- (MCMXPCMessageBase)initWithContext:(id)a3;
- (MCMXPCMessageBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (OS_xpc_object)xpcObject;
- (container_client)proxy;
- (id)identifierFromXPCObject:(id)a3 elseClientIdentifier:(id)a4;
- (id)nsObjectFromXPCObject:(id)a3 key:(const char *)a4 error:(unint64_t *)a5;
- (id)nsStringValueFromXPCObject:(id)a3 key:(const char *)a4;
- (id)nsUUIDValueFromXPCObject:(id)a3 key:(const char *)a4;
- (id)userIdentityFromClientPersonaUniqueString:(id)a3 clientIdentity:(id)a4 error:(unint64_t *)a5;
- (unint64_t)command;
- (unsigned)disposition;
- (unsigned)platform;
- (void)dealloc;
@end

@implementation MCMXPCMessageBase

- (id)identifierFromXPCObject:(id)a3 elseClientIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(MCMXPCMessageBase *)self nsStringValueFromXPCObject:a3 key:"Identifier"];
  if (!v7) {
    id v7 = v6;
  }

  return v7;
}

- (id)nsStringValueFromXPCObject:(id)a3 key:(const char *)a4
{
  string = (void *)xpc_dictionary_get_string(a3, a4);
  if (string)
  {
    string = [NSString stringWithUTF8String:string];
  }

  return string;
}

+ (id)userIdentityForContainerIdentifier:(id)a3 clientIdentity:(id)a4 containerClass:(unint64_t)a5 error:(unint64_t *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [v10 userIdentity];
  v12 = v11;
  v13 = 0;
  unint64_t v14 = 1;
  if (a5 > 0xE || ((1 << a5) & 0x4ED4) == 0)
  {
LABEL_9:
    if (!a6) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  if (![v11 isNoSpecificPersona])
  {
    v13 = 0;
    unint64_t v14 = 1;
    goto LABEL_9;
  }
  id v15 = v9;
  v16 = v15;
  v17 = v15;
  if (a5 - 3 <= 3)
  {
    v17 = v15;
    if ((a5 | 2) == 6)
    {
      v18 = [(id)gCodeSigningMapping childParentMapCache];

      if (v18)
      {
        v19 = [(id)gCodeSigningMapping childParentMapCache];
        v17 = [v19 parentIdentifierForChildIdentifier:v16];
      }
      else
      {
        v20 = container_log_handle_for_category();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v36 = v16;
          _os_log_impl(&dword_1D7739000, v20, OS_LOG_TYPE_DEFAULT, "Warning: not remapping plugin identifier '%{public}@ to parent identifier [3]", buf, 0xCu);
        }

        v17 = v16;
      }
    }
  }
  v21 = [(id)gContainerCache userIdentityCache];
  v22 = [v21 userIdentitiesForBundleIdentifier:v17];

  if (v17 != v16)
  {
    v23 = container_log_handle_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v36 = v17;
      __int16 v37 = 2112;
      unint64_t v38 = (unint64_t)v22;
      __int16 v39 = 2112;
      v40 = v16;
      __int16 v41 = 2048;
      unint64_t v42 = a5;
      _os_log_debug_impl(&dword_1D7739000, v23, OS_LOG_TYPE_DEBUG, "Chose bundleIdentifier: %@, userIdentities: %@ for identifier: %@, class: %llu", buf, 0x2Au);
    }
  }
  if ([v22 count] == 1)
  {
    v13 = [v22 anyObject];
LABEL_24:
    unint64_t v14 = 1;
    goto LABEL_32;
  }
  if (unint64_t)[v22 count] < 2 || (objc_msgSend(v22, "containsObject:", v12))
  {
    if ([v22 count])
    {
      v13 = 0;
      goto LABEL_24;
    }
    v24 = container_log_handle_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v34 = [v10 codeSignInfo];
      v33 = [v34 identifier];
      *(_DWORD *)buf = 138543874;
      id v36 = v33;
      __int16 v37 = 2048;
      unint64_t v38 = a5;
      __int16 v39 = 2112;
      v40 = v16;
      _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "Client %{public}@ failed trying to look up persona for %llu:%@", buf, 0x20u);
    }
  }
  else
  {
    v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v36 = v10;
      __int16 v37 = 2112;
      unint64_t v38 = (unint64_t)v22;
      __int16 v39 = 2112;
      v40 = v12;
      _os_log_fault_impl(&dword_1D7739000, v25, OS_LOG_TYPE_FAULT, "Ambiguous user identity from [%@]. Expected one of [%@], got %@", buf, 0x20u);
    }
  }
  v13 = 0;
  unint64_t v14 = 76;
LABEL_32:

  if (!a6) {
    goto LABEL_35;
  }
LABEL_33:
  if (!v12) {
    *a6 = v14;
  }
LABEL_35:
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
  }
  if (!MCMRequirePersona_result)
  {
    BOOL v26 = 1;
    if (!v13) {
      goto LABEL_48;
    }
    goto LABEL_43;
  }
  if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
    dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_21);
  }
  BOOL v26 = MCMRequirePersonaTelemetryOnly_result != 0;
  if (v13)
  {
LABEL_43:
    if (([v12 isStrictlyEqualToUserIdentity:v13] & 1) == 0)
    {
      v27 = container_log_handle_for_category();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v30 = [v10 codeSignInfo];
        v31 = [v30 identifier];
        *(_DWORD *)buf = 138544642;
        v32 = " NOT";
        __int16 v37 = 2080;
        id v36 = v31;
        if (v26) {
          v32 = "";
        }
        unint64_t v38 = (unint64_t)v32;
        __int16 v39 = 2114;
        v40 = v13;
        __int16 v41 = 2114;
        unint64_t v42 = (unint64_t)v12;
        __int16 v43 = 2048;
        unint64_t v44 = a5;
        __int16 v45 = 2112;
        id v46 = v9;
        _os_log_debug_impl(&dword_1D7739000, v27, OS_LOG_TYPE_DEBUG, "For %{public}@ ,%s substituting user identity %{public}@ for client identity %{public}@ for container %llu:%@", buf, 0x3Eu);
      }
    }
    if (v26)
    {
      id v28 = v13;

      v12 = v28;
    }
  }
LABEL_48:

  return v12;
}

+ (id)xpcMessageFromXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithXPCObject:v9 context:v8 error:a5];

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  container_free_client();
  v3.receiver = self;
  v3.super_class = (Class)MCMXPCMessageBase;
  [(MCMXPCMessageBase *)&v3 dealloc];
}

- (unsigned)disposition
{
  return 1;
}

- (unsigned)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_xpcObject, 0);
}

- (id)userIdentityFromClientPersonaUniqueString:(id)a3 clientIdentity:(id)a4 error:(unint64_t *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint32_t v28 = 0;
  host_t v10 = MEMORY[0x1D9478CB0]();
  if (!host_get_multiuser_config_flags(v10, &v28) && (v28 & 0x80000000) != 0)
  {
    id v11 = [v9 userIdentity];
    goto LABEL_11;
  }
  v12 = [(MCMXPCMessageBase *)self context];
  v13 = [v12 userIdentityCache];
  int v14 = [(id)objc_opt_class() personasAreSupported];

  id v15 = [(MCMXPCMessageBase *)self context];
  v16 = [v15 userIdentityCache];
  v17 = v16;
  if (!v14)
  {
    v23 = [v9 posixUser];
    id v11 = [v17 userIdentityForPersonalPersonaWithPOSIXUser:v23];

LABEL_11:
    unint64_t v24 = 1;
    if (!a5) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  v18 = [v16 userIdentityForCurrentUserWithPersonaUniqueString:v8];

  if (!v18)
  {
    v19 = container_log_handle_for_category();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    v22 = [v9 codeSignInfo];
    BOOL v26 = [v22 identifier];
    uint32_t v28 = 138412546;
    v29 = v26;
    __int16 v30 = 2112;
    id v31 = v8;
    _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "Cannot reconstitute a user identity from provided persona unique string; client = [%@], personaUniqueString = [%@]",
      (uint8_t *)&v28,
      0x16u);
    goto LABEL_24;
  }
  v19 = [v9 userIdentity];
  char v20 = [v19 isNoSpecificPersona];
  int v21 = [v19 isEqual:v18];
  if ((v20 & 1) == 0 && !v21)
  {
    v22 = container_log_handle_for_category();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

LABEL_14:
      id v11 = 0;
      unint64_t v24 = 76;
      goto LABEL_16;
    }
    BOOL v26 = [v9 codeSignInfo];
    v27 = [v26 identifier];
    uint32_t v28 = 138413058;
    v29 = v27;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 1024;
    int v33 = 0;
    __int16 v34 = 1024;
    int v35 = 0;
    _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, "Persona unique string is not valid for this client; client = [%@], personaUniqueString = [%@], nonspecific = %d, s"
      "ameAsClient = %d",
      (uint8_t *)&v28,
      0x22u);

LABEL_24:
    goto LABEL_9;
  }
  id v11 = v18;
  unint64_t v24 = 1;
LABEL_16:

  if (!a5) {
    goto LABEL_19;
  }
LABEL_17:
  if (!v11) {
    *a5 = v24;
  }
LABEL_19:

  return v11;
}

- (id)nsObjectFromXPCObject:(id)a3 key:(const char *)a4 error:(unint64_t *)a5
{
  id v6 = xpc_dictionary_get_value(a3, a4);
  if (v6)
  {
    uint64_t v7 = _CFXPCCreateCFObjectFromXPCObject();
    id v8 = (void *)v7;
    if (a5 && !v7) {
      *a5 = 38;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (MCMCommandContext)context
{
  return self->_context;
}

- (MCMXPCMessageBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = [(MCMXPCMessageBase *)self initWithContext:a4];
  host_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcObject, a3);
    unsigned int uint64 = xpc_dictionary_get_uint64(v8, "Platform");
    uint64_t v12 = xpc_dictionary_get_dictionary(v8, "ProxyForClient");
    v13 = (void *)v12;
    if (v12) {
      uint64_t v12 = container_client_copy_decoded_from_xpc_object();
    }
    v10->_proxy = (container_client *)v12;
    v10->_platform = uint64;
    v10->_command = xpc_dictionary_get_uint64(v8, "Command");
  }
  return v10;
}

- (MCMXPCMessageBase)initWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMXPCMessageBase;
  id v6 = [(MCMXPCMessageBase *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (unint64_t)command
{
  return self->_command;
}

- (OS_xpc_object)xpcObject
{
  return self->_xpcObject;
}

- (container_client)proxy
{
  return self->_proxy;
}

- (id)nsUUIDValueFromXPCObject:(id)a3 key:(const char *)a4
{
  uuid = (uint8_t *)xpc_dictionary_get_uuid(a3, a4);
  if (uuid) {
    uuid = (uint8_t *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
  }

  return uuid;
}

@end