@interface MCMResultWithOwnersAndGroupsBase
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultWithOwnersAndGroupsBase)init;
- (NSArray)groupIdentifiers;
- (NSArray)ownerIdentifiers;
- (void)addOwner:(id)a3 group:(id)a4;
@end

@implementation MCMResultWithOwnersAndGroupsBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facts, 0);
  objc_storeStrong((id *)&self->_mutableGroupIdentifiers, 0);

  objc_storeStrong((id *)&self->_mutableOwnerIdentifiers, 0);
}

- (MCMResultWithOwnersAndGroupsBase)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)MCMResultWithOwnersAndGroupsBase;
  v2 = [(MCMResultBase *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableOwnerIdentifiers = v2->_mutableOwnerIdentifiers;
    v2->_mutableOwnerIdentifiers = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableGroupIdentifiers = v2->_mutableGroupIdentifiers;
    v2->_mutableGroupIdentifiers = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    facts = v2->_facts;
    v2->_facts = v7;
  }
  return v2;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MCMResultWithOwnersAndGroupsBase;
  BOOL v5 = [(MCMResultBase *)&v23 encodeResultOntoReply:v4];
  if (v5)
  {
    v6 = [(MCMResultBase *)self error];

    if (!v6)
    {
      BOOL v20 = v5;
      size_t v7 = [(NSMutableSet *)self->_facts count];
      if (v7 <= 1) {
        size_t v7 = 1;
      }
      bytes = (char *)malloc_type_calloc(v7, 0x10uLL, 0x1000040451B5BE8uLL);
      __s = bytes;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v19 = 40;
      v8 = self->_facts;
      uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v25 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v26;
        do
        {
          uint64_t v13 = 0;
          v14 = &bytes[16 * v11 + 8];
          do
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v8);
            }
            v15 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
            *((void *)v14 - 1) = objc_msgSend(v15, "ownerIndex", v19);
            *(void *)v14 = [v15 groupIndex];
            v14 += 16;
            ++v13;
          }
          while (v10 != v13);
          v11 += v13;
          uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v25 objects:v24 count:16];
        }
        while (v10);
      }

      xpc_dictionary_set_data(v4, "ReplyFacts", bytes, 16 * [*(id *)((char *)&self->super.super.isa + v19) count]);
      v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v16) {
        xpc_dictionary_set_value(v4, "ReplyOwnerIdentifiers", v16);
      }
      v17 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      LOBYTE(v5) = v20;
      if (v17) {
        xpc_dictionary_set_value(v4, "ReplyGroupIdentifiers", v17);
      }
      if (bytes)
      {
        free(bytes);
        memset_s(&__s, 8uLL, 0, 8uLL);
      }
    }
  }

  return v5;
}

- (void)addOwner:(id)a3 group:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableArray *)self->_mutableOwnerIdentifiers indexOfObject:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(NSMutableArray *)self->_mutableOwnerIdentifiers count];
    [(NSMutableArray *)self->_mutableOwnerIdentifiers addObject:v10];
  }
  uint64_t v8 = -[NSMutableArray indexOfObject:](self->_mutableGroupIdentifiers, "indexOfObject:", v6, v10);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(NSMutableArray *)self->_mutableGroupIdentifiers count];
    [(NSMutableArray *)self->_mutableGroupIdentifiers addObject:v6];
  }
  uint64_t v9 = [[MCMResultWithOwnersAndGroupsBaseFact alloc] initWithOwnerIndex:v7 groupIndex:v8];
  [(NSMutableSet *)self->_facts addObject:v9];
}

- (NSArray)groupIdentifiers
{
  v2 = (void *)[(NSMutableArray *)self->_mutableGroupIdentifiers copy];

  return (NSArray *)v2;
}

- (NSArray)ownerIdentifiers
{
  v2 = (void *)[(NSMutableArray *)self->_mutableOwnerIdentifiers copy];

  return (NSArray *)v2;
}

@end