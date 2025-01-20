@interface MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier
- (MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSString)appGroupIdentifier;
- (unsigned)expectedPersonaKernelID;
@end

@implementation MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier

- (MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier;
  v10 = [(MCMXPCMessageBase *)&v36 initWithXPCObject:v8 context:v9 error:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_21;
  }
  v12 = [(MCMXPCMessageBase *)v10 nsStringValueFromXPCObject:v8 key:"Identifier"];
  if (v12)
  {
    objc_storeStrong((id *)&v11->_appGroupIdentifier, v12);
    v11->_unsigned int expectedPersonaKernelID = -1;
    v13 = [(MCMXPCMessageBase *)v11 context];
    v14 = [v13 userIdentityCache];
    int v15 = [(id)objc_opt_class() personasAreSupported];

    if (v15)
    {
      id v16 = containermanager_copy_global_configuration();
      v17 = [v16 staticConfig];

      uint64_t v18 = xpc_dictionary_get_value(v8, "PersonaKernelID");
      v19 = (void *)v18;
      if (v18 && MEMORY[0x1D94798D0](v18) == MEMORY[0x1E4F145F8])
      {
        v11->_unsigned int expectedPersonaKernelID = xpc_uint64_get_value(v19);
        if ([v9 kernelPersonaID] != v11->_expectedPersonaKernelID)
        {
          v22 = container_log_handle_for_category();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v35 = [v9 clientIdentity];
            v33 = [v35 codeSignInfo];
            v27 = [v33 identifier];
            v31 = [v9 clientIdentity];
            int v30 = [v31 posixPID];
            unsigned int expectedPersonaKernelID = v11->_expectedPersonaKernelID;
            int v29 = [v9 kernelPersonaID];
            *(_DWORD *)buf = 138413058;
            v38 = v27;
            __int16 v39 = 1024;
            int v40 = v30;
            __int16 v41 = 1024;
            unsigned int v42 = expectedPersonaKernelID;
            __int16 v43 = 1024;
            int v44 = v29;
            _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, "Persona failed to propgate; client[%@(%d)] = %d, server = %d",
              buf,
              0x1Eu);
          }
          if ([v17 errorOnPersonaPropagationFailure])
          {
            unint64_t v21 = 151;
            goto LABEL_10;
          }
        }
      }
      else
      {
        v20 = container_log_handle_for_category();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v34 = [v9 clientIdentity];
          v32 = [v34 codeSignInfo];
          v24 = [v32 identifier];
          v25 = [v9 clientIdentity];
          int v26 = [v25 posixPID];
          *(_DWORD *)buf = 138412546;
          v38 = v24;
          __int16 v39 = 1024;
          int v40 = v26;
          _os_log_error_impl(&dword_1D7739000, v20, OS_LOG_TYPE_ERROR, "Kernel persona ID is invalid; client[%@(%d)]",
            buf,
            0x12u);
        }
        if ([v17 errorOnPersonaPropagationFailure])
        {
          unint64_t v21 = 38;
LABEL_10:

          goto LABEL_12;
        }
      }
    }
    goto LABEL_21;
  }
  unint64_t v21 = 38;
LABEL_12:

  v11 = 0;
  if (a5) {
    *a5 = v21;
  }
LABEL_21:

  return v11;
}

- (NSString)appGroupIdentifier
{
  return self->_appGroupIdentifier;
}

- (void).cxx_destruct
{
  p_appGroupIdentifier = &self->_appGroupIdentifier;

  objc_storeStrong((id *)p_appGroupIdentifier, 0);
}

- (unsigned)expectedPersonaKernelID
{
  return self->_expectedPersonaKernelID;
}

@end