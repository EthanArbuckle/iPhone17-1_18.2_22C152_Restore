@interface MCMXPCMessageWithContainerBase
- (MCMContainerIdentity)containerIdentity;
- (MCMXPCMessageWithContainerBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (id)containerIdentityFromXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unsigned)disposition;
@end

@implementation MCMXPCMessageWithContainerBase

- (MCMXPCMessageWithContainerBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MCMXPCMessageWithContainerBase;
  v10 = [(MCMXPCMessageBase *)&v15 initWithXPCObject:v8 context:v9 error:a5];
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = [(MCMXPCMessageWithContainerBase *)v10 containerIdentityFromXPCObject:v8 context:v9 error:a5];
    containerIdentity = v11->_containerIdentity;
    v11->_containerIdentity = (MCMContainerIdentity *)v12;

    if (!v11->_containerIdentity)
    {

      v11 = 0;
    }
  }

  return v11;
}

- (id)containerIdentityFromXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v27[0] = 1;
  v10 = [v9 clientIdentity];
  uint64_t uint64 = xpc_dictionary_get_uint64(v8, "Platform");
  uint64_t v12 = [v10 codeSignInfo];
  v13 = [v12 identifier];
  v14 = [(MCMXPCMessageBase *)self identifierFromXPCObject:v8 elseClientIdentifier:v13];

  if (!v14)
  {
    v22 = 0;
    v20 = 0;
    v18 = 0;
    uint64_t v23 = 18;
    goto LABEL_10;
  }
  uint64_t v26 = uint64;
  uint64_t v15 = xpc_dictionary_get_uint64(v8, "ContainerClass");
  uint64_t v16 = [v9 globalConfiguration];
  v17 = [v16 staticConfig];
  v18 = [v17 configForContainerClass:v15];

  if (!v18)
  {
    v22 = 0;
    v20 = 0;
    uint64_t v23 = 20;
    goto LABEL_10;
  }
  if (([v18 supportedOnPlatform] & 1) == 0)
  {
    v22 = 0;
    v20 = 0;
    uint64_t v23 = 72;
LABEL_10:
    v27[0] = v23;
    if (!a5) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  BOOL v19 = xpc_dictionary_get_BOOL(v8, "Transient");
  v20 = [(id)objc_opt_class() userIdentityForContainerIdentifier:v14 clientIdentity:v10 containerClass:v15 error:v27];
  if (v20)
  {
    v21 = [v9 userIdentityCache];
    v22 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v20 identifier:v14 containerConfig:v18 platform:v26 transient:v19 userIdentityCache:v21 error:v27];

    if (!a5) {
      goto LABEL_13;
    }
  }
  else
  {
    v22 = 0;
    if (!a5) {
      goto LABEL_13;
    }
  }
LABEL_11:
  if (!v22) {
    *a5 = v27[0];
  }
LABEL_13:
  id v24 = v22;

  return v24;
}

- (unsigned)disposition
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)MCMXPCMessageWithContainerBase;
  unsigned int v3 = [(MCMXPCMessageBase *)&v6 disposition];
  if (v3 == 1)
  {
    v4 = [(MCMXPCMessageWithContainerBase *)self containerIdentity];
    unsigned int v3 = [v4 disposition];
  }
  return v3;
}

- (void).cxx_destruct
{
  p_containerIdentity = &self->_containerIdentity;

  objc_storeStrong((id *)p_containerIdentity, 0);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

@end