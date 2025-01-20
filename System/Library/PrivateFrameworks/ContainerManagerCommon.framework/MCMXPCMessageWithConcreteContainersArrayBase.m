@interface MCMXPCMessageWithConcreteContainersArrayBase
- (MCMXPCMessageWithConcreteContainersArrayBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSArray)concreteContainerIdentities;
@end

@implementation MCMXPCMessageWithConcreteContainersArrayBase

- (void).cxx_destruct
{
  p_concreteContainerIdentities = &self->_concreteContainerIdentities;

  objc_storeStrong((id *)p_concreteContainerIdentities, 0);
}

- (NSArray)concreteContainerIdentities
{
  return self->_concreteContainerIdentities;
}

- (MCMXPCMessageWithConcreteContainersArrayBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v29 = 0;
  v30[0] = 1;
  v28.receiver = self;
  v28.super_class = (Class)MCMXPCMessageWithConcreteContainersArrayBase;
  v10 = [(MCMXPCMessageBase *)&v28 initWithXPCObject:v8 context:v9 error:a5];
  if (v10)
  {
    v11 = xpc_dictionary_get_array(v8, "ContainersArray");
    uint64_t container_object_array = container_xpc_decode_create_container_object_array();
    if (container_object_array)
    {
      uint64_t v13 = container_object_array;
      v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v29];
      if (v29)
      {
        v25 = v11;
        id v26 = v8;
        v27 = a5;
        uint64_t v15 = 0;
        while (1)
        {
          v16 = [MCMConcreteContainerIdentityForLibsystem alloc];
          uint64_t v17 = *(void *)(v13 + 8 * v15);
          v18 = [v9 clientIdentity];
          v19 = [v18 userIdentity];
          v20 = [v9 userIdentityCache];
          v21 = [(MCMConcreteContainerIdentityForLibsystem *)v16 initWithLibsystemContainer:v17 defaultUserIdentity:v19 userIdentityCache:v20 error:v30];

          if (!v21) {
            break;
          }
          [v14 addObject:v21];

          if (++v15 >= v29)
          {
            id v8 = v26;
            a5 = v27;
            goto LABEL_10;
          }
        }
        v30[0] = 38;

        v10 = 0;
        id v8 = v26;
        a5 = v27;
LABEL_10:
        v11 = v25;
      }
      if (v30[0] == 1)
      {
        uint64_t v22 = [v14 copy];
        concreteContainerIdentities = v10->_concreteContainerIdentities;
        v10->_concreteContainerIdentities = (NSArray *)v22;
      }
      container_free_array_of_containers();
    }
    else
    {

      v10 = 0;
    }
  }
  if (a5 && v30[0] != 1) {
    *a5 = v30[0];
  }

  return v10;
}

@end