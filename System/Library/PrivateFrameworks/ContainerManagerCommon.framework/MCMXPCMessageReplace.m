@interface MCMXPCMessageReplace
- (MCMConcreteContainerIdentity)containerIdentityNew;
- (MCMConcreteContainerIdentity)containerIdentityOld;
- (MCMXPCMessageReplace)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unsigned)disposition;
@end

@implementation MCMXPCMessageReplace

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentityNew, 0);

  objc_storeStrong((id *)&self->_containerIdentityOld, 0);
}

- (MCMConcreteContainerIdentity)containerIdentityNew
{
  return self->_containerIdentityNew;
}

- (MCMConcreteContainerIdentity)containerIdentityOld
{
  return self->_containerIdentityOld;
}

- (unsigned)disposition
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)MCMXPCMessageReplace;
  unsigned int v3 = [(MCMXPCMessageBase *)&v6 disposition];
  if (v3 == 1)
  {
    v4 = [(MCMXPCMessageReplace *)self containerIdentityNew];
    unsigned int v3 = [v4 disposition];
  }
  return v3;
}

- (MCMXPCMessageReplace)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)MCMXPCMessageReplace;
  v10 = [(MCMXPCMessageBase *)&v39 initWithXPCObject:v8 context:v9 error:a5];
  if (!v10) {
    goto LABEL_21;
  }
  unint64_t v38 = 1;
  v11 = xpc_dictionary_get_dictionary(v8, "OldContainer");
  if (v11)
  {
    uint64_t v12 = container_xpc_decode_container_object();
    if (!v12)
    {
      v29 = container_log_handle_for_category();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t error_description = container_get_error_description();
        *(_DWORD *)buf = 134218242;
        unint64_t v41 = v38;
        __int16 v42 = 2080;
        uint64_t v43 = error_description;
        _os_log_error_impl(&dword_1D7739000, v29, OS_LOG_TYPE_ERROR, "Failed to decode old container; error = (%llu) %s",
          buf,
          0x16u);
      }

      uint64_t v22 = 0;
      v20 = 0;
      uint64_t v13 = 0;
      goto LABEL_16;
    }
    uint64_t v13 = v12;
    v14 = [MCMConcreteContainerIdentityForLibsystem alloc];
    v15 = [v9 clientIdentity];
    v16 = [v15 userIdentity];
    v17 = [v9 userIdentityCache];
    uint64_t v18 = [(MCMConcreteContainerIdentityForLibsystem *)v14 initWithLibsystemContainer:v13 defaultUserIdentity:v16 userIdentityCache:v17 error:&v38];
    containerIdentityOld = v10->_containerIdentityOld;
    v10->_containerIdentityOld = (MCMConcreteContainerIdentity *)v18;
  }
  else
  {
    uint64_t v13 = 0;
  }
  v20 = xpc_dictionary_get_dictionary(v8, "NewContainer");
  if (v20)
  {
    uint64_t v21 = container_xpc_decode_container_object();
    if (v21)
    {
      uint64_t v22 = v21;
      v36 = [MCMConcreteContainerIdentityForLibsystem alloc];
      v23 = [v9 clientIdentity];
      [v23 userIdentity];
      v24 = v37 = a5;
      [v9 userIdentityCache];
      v26 = v25 = v11;
      uint64_t v27 = [(MCMConcreteContainerIdentityForLibsystem *)v36 initWithLibsystemContainer:v22 defaultUserIdentity:v24 userIdentityCache:v26 error:&v38];
      containerIdentityNew = v10->_containerIdentityNew;
      v10->_containerIdentityNew = (MCMConcreteContainerIdentity *)v27;

      v11 = v25;
      a5 = v37;
    }
    else
    {
      v30 = container_log_handle_for_category();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v33 = v11;
        unint64_t v34 = v38;
        uint64_t v35 = container_get_error_description();
        *(_DWORD *)buf = 134218242;
        unint64_t v41 = v34;
        v11 = v33;
        __int16 v42 = 2080;
        uint64_t v43 = v35;
        _os_log_error_impl(&dword_1D7739000, v30, OS_LOG_TYPE_ERROR, "Failed to decode new container; error = (%llu) %s",
          buf,
          0x16u);
      }

      uint64_t v22 = 0;
    }
  }
  else
  {
    uint64_t v22 = 0;
    unint64_t v38 = 38;
  }
LABEL_16:
  MEMORY[0x1D94785B0](v13);
  MEMORY[0x1D94785B0](v22);
  if (v38 != 1)
  {
    if (a5) {
      *a5 = v38;
    }

    v10 = 0;
  }

LABEL_21:
  return v10;
}

@end