@interface MCMXPCMessageWithConcreteContainerBase
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (MCMXPCMessageWithConcreteContainerBase)initWithConcreteContainer:(id)a3 context:(id)a4;
- (MCMXPCMessageWithConcreteContainerBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unsigned)disposition;
@end

@implementation MCMXPCMessageWithConcreteContainerBase

- (void).cxx_destruct
{
  p_concreteContainerIdentity = &self->_concreteContainerIdentity;

  objc_storeStrong((id *)p_concreteContainerIdentity, 0);
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (unsigned)disposition
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)MCMXPCMessageWithConcreteContainerBase;
  unsigned int v3 = [(MCMXPCMessageBase *)&v6 disposition];
  if (v3 == 1)
  {
    v4 = [(MCMXPCMessageWithConcreteContainerBase *)self concreteContainerIdentity];
    unsigned int v3 = [v4 disposition];
  }
  return v3;
}

- (MCMXPCMessageWithConcreteContainerBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MCMXPCMessageWithConcreteContainerBase;
  v10 = [(MCMXPCMessageBase *)&v21 initWithXPCObject:v8 context:v9 error:a5];
  if (v10)
  {
    unint64_t v20 = 1;
    v11 = xpc_dictionary_get_dictionary(v8, "Container");
    uint64_t v12 = container_xpc_decode_container_object();
    if (!v12) {
      goto LABEL_4;
    }
    v13 = [MCMConcreteContainerIdentityForLibsystem alloc];
    v14 = [v9 clientIdentity];
    v15 = [v14 userIdentity];
    v16 = [v9 userIdentityCache];
    uint64_t v17 = [(MCMConcreteContainerIdentityForLibsystem *)v13 initWithLibsystemContainer:v12 defaultUserIdentity:v15 userIdentityCache:v16 error:&v20];
    concreteContainerIdentity = v10->_concreteContainerIdentity;
    v10->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v17;

    if (!v10->_concreteContainerIdentity)
    {
LABEL_4:

      v10 = 0;
    }
    if (a5 && v20 != 1) {
      *a5 = v20;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  MEMORY[0x1D94785B0](v12);

  return v10;
}

- (MCMXPCMessageWithConcreteContainerBase)initWithConcreteContainer:(id)a3 context:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMXPCMessageWithConcreteContainerBase;
  id v8 = [(MCMXPCMessageBase *)&v11 initWithContext:a4];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_concreteContainerIdentity, a3);
  }

  return v9;
}

@end