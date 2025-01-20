@interface CRKASMConcreteLocation
- (BOOL)isEqual:(id)a3;
- (CRKASMConcreteLocation)initWithBackingLocation:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (unint64_t)hash;
@end

@implementation CRKASMConcreteLocation

- (CRKASMConcreteLocation)initWithBackingLocation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKASMConcreteLocation;
  v5 = [(CRKASMConcreteLocation *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectID];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = [v4 locationName];
    uint64_t v10 = [v9 copy];
    name = v5->_name;
    v5->_name = (NSString *)v10;
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = [(CRKASMConcreteLocation *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(CRKASMConcreteLocation *)self name];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(@"identifier, name", "componentsSeparatedByString:", @",");
  unint64_t v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_12;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  v8 = self;
  v9 = (CRKASMConcreteLocation *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKASMConcreteLocation *)v9 isMemberOfClass:objc_opt_class()])
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
          uint64_t v18 = [(CRKASMConcreteLocation *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKASMConcreteLocation *)v17 valueForKey:v16];

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
  v5 = [(CRKASMConcreteLocation *)self identifier];
  unint64_t v6 = [(CRKASMConcreteLocation *)self name];
  id v7 = [v3 stringWithFormat:@"<%@: %p { identifier = %@, name = %@ }>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end