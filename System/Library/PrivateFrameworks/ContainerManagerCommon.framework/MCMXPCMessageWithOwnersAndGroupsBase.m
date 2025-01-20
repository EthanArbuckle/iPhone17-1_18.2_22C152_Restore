@interface MCMXPCMessageWithOwnersAndGroupsBase
- (MCMXPCMessageWithOwnersAndGroupsBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSSet)groupIdentifiers;
- (NSSet)ownerIdentifiers;
- (unint64_t)containerClass;
@end

@implementation MCMXPCMessageWithOwnersAndGroupsBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);

  objc_storeStrong((id *)&self->_ownerIdentifiers, 0);
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (NSSet)ownerIdentifiers
{
  return self->_ownerIdentifiers;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (MCMXPCMessageWithOwnersAndGroupsBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MCMXPCMessageWithOwnersAndGroupsBase;
  v9 = [(MCMXPCMessageBase *)&v32 initWithXPCObject:v8 context:a4 error:a5];
  v10 = v9;
  if (v9)
  {
    uint64_t v31 = 1;
    v9->_containerClass = 0;
    ownerIdentifiers = v9->_ownerIdentifiers;
    v9->_ownerIdentifiers = 0;

    groupIdentifiers = v10->_groupIdentifiers;
    v10->_groupIdentifiers = 0;

    uint64_t uint64 = xpc_dictionary_get_uint64(v8, "ContainerClass");
    v10->_containerClass = uint64;
    if (uint64 - 1 >= 0xE)
    {
      v14 = 0;
      v22 = 0;
      unint64_t v23 = 20;
LABEL_29:
      uint64_t v31 = v23;
      goto LABEL_30;
    }
    v10->_containerClass = container_class_normalized();
    v14 = [(MCMXPCMessageBase *)v10 nsObjectFromXPCObject:v8 key:"OwnerIdentifiersArray" error:&v31];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = 0;
LABEL_28:
        unint64_t v23 = 110;
        goto LABEL_29;
      }
      v30 = v14;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v15 = v14;
      uint64_t v16 = [(NSSet *)v15 countByEnumeratingWithState:&v39 objects:v38 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v40 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v22 = 0;
              uint64_t v31 = 110;
              goto LABEL_38;
            }
          }
          uint64_t v17 = [(NSSet *)v15 countByEnumeratingWithState:&v39 objects:v38 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
      v21 = v10->_ownerIdentifiers;
      v10->_ownerIdentifiers = (NSSet *)v20;
    }
    else
    {
      unint64_t v23 = v31;
      if (v31 != 1)
      {
        v14 = 0;
        v22 = 0;
        goto LABEL_30;
      }
    }
    v22 = [(MCMXPCMessageBase *)v10 nsObjectFromXPCObject:v8 key:"GroupIdentifiers" error:&v31];
    if (!v22) {
      goto LABEL_39;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = v14;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v22 = v22;
      uint64_t v24 = [(NSSet *)v22 countByEnumeratingWithState:&v34 objects:v33 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v35;
        while (2)
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v35 != v26) {
              objc_enumerationMutation(v22);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v31 = 110;
              v15 = v22;
              goto LABEL_38;
            }
          }
          uint64_t v25 = [(NSSet *)v22 countByEnumeratingWithState:&v34 objects:v33 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      uint64_t v28 = [MEMORY[0x1E4F1CAD0] setWithArray:v22];
      v15 = v10->_groupIdentifiers;
      v10->_groupIdentifiers = (NSSet *)v28;
LABEL_38:

      v14 = v30;
LABEL_39:
      unint64_t v23 = v31;
      if (v31 == 1)
      {
LABEL_33:

        goto LABEL_34;
      }
LABEL_30:
      if (a5) {
        *a5 = v23;
      }

      v10 = 0;
      goto LABEL_33;
    }
    goto LABEL_28;
  }
LABEL_34:

  return v10;
}

@end