@interface CRKASMConcreteOrganization
- (BOOL)isEqual:(id)a3;
- (CRKASMConcreteOrganization)initWithIdentifier:(id)a3 name:(id)a4;
- (NSString)description;
- (NSString)name;
- (NSUUID)UUID;
- (unint64_t)hash;
@end

@implementation CRKASMConcreteOrganization

- (CRKASMConcreteOrganization)initWithIdentifier:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKASMConcreteOrganization;
  v8 = [(CRKASMConcreteOrganization *)&v14 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F08C38], "crk_UUIDWithOpaqueString:", v6);
    UUID = v8->_UUID;
    v8->_UUID = (NSUUID *)v9;

    uint64_t v11 = [v7 copy];
    name = v8->_name;
    v8->_name = (NSString *)v11;
  }
  return v8;
}

- (unint64_t)hash
{
  v3 = [(CRKASMConcreteOrganization *)self UUID];
  uint64_t v4 = [v3 hash];
  v5 = [(CRKASMConcreteOrganization *)self name];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(@"UUID, name", "componentsSeparatedByString:", @",");
  unint64_t v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_9;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  v8 = self;
  uint64_t v9 = (CRKASMConcreteOrganization *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKASMConcreteOrganization *)v9 isMemberOfClass:objc_opt_class()])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v23 = v10;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          v17 = v9;
          uint64_t v18 = [(CRKASMConcreteOrganization *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKASMConcreteOrganization *)v17 valueForKey:v16];

          if (v18 | v19)
          {
            int v20 = [(id)v18 isEqual:v19];

            if (!v20)
            {
              BOOL v21 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v21 = 1;
LABEL_16:
      id v10 = v23;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRKASMConcreteOrganization *)self UUID];
  unint64_t v6 = [v5 UUIDString];
  id v7 = [(CRKASMConcreteOrganization *)self name];
  v8 = [v3 stringWithFormat:@"<%@: %p { UUID = %@, name = %@ }>", v4, self, v6, v7];

  return (NSString *)v8;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end