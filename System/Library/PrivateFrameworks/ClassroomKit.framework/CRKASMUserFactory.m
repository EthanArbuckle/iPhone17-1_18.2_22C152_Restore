@interface CRKASMUserFactory
- (BOOL)isEqual:(id)a3;
- (BOOL)isUser:(id)a3 suitableForPerson:(id)a4;
- (CRKASMCertificateVendor)certificateVendor;
- (CRKASMRosterProviderConfiguration)configuration;
- (CRKASMUserFactory)initWithConfiguration:(id)a3 certificateVendor:(id)a4;
- (id)cachedTrustedUserForPerson:(id)a3;
- (id)cachedUserForPerson:(id)a3;
- (id)makeTrustedUserForPerson:(id)a3;
- (id)makeUserForPerson:(id)a3;
- (id)trustedUserForPerson:(id)a3;
- (id)userForPerson:(id)a3;
- (unint64_t)hash;
@end

@implementation CRKASMUserFactory

- (CRKASMUserFactory)initWithConfiguration:(id)a3 certificateVendor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKASMUserFactory;
  v9 = [(CRKASMUserFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_certificateVendor, a4);
  }

  return v10;
}

- (id)userForPerson:(id)a3
{
  id v4 = a3;
  v5 = [(CRKASMUserFactory *)self cachedUserForPerson:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(CRKASMUserFactory *)self makeUserForPerson:v4];
  }
  id v8 = v7;

  return v8;
}

- (id)trustedUserForPerson:(id)a3
{
  id v4 = a3;
  v5 = [(CRKASMUserFactory *)self cachedTrustedUserForPerson:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(CRKASMUserFactory *)self makeTrustedUserForPerson:v4];
  }
  id v8 = v7;

  return v8;
}

- (id)cachedUserForPerson:(id)a3
{
  id v4 = a3;
  v5 = [(CRKASMUserFactory *)self configuration];
  v6 = [v5 userCache];
  id v7 = [v4 objectID];
  id v8 = [v6 objectForKey:v7];

  LODWORD(self) = [(CRKASMUserFactory *)self isUser:v8 suitableForPerson:v4];
  if (self) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)makeUserForPerson:(id)a3
{
  id v4 = a3;
  v5 = [[CRKASMConcreteUser alloc] initWithBackingPerson:v4];
  v6 = [(CRKASMUserFactory *)self configuration];
  id v7 = [v6 userCache];
  id v8 = [v4 objectID];

  [v7 setObject:v5 forKey:v8];

  return v5;
}

- (id)cachedTrustedUserForPerson:(id)a3
{
  id v4 = a3;
  v5 = [(CRKASMUserFactory *)self configuration];
  v6 = [v5 trustedUserCache];
  id v7 = [v4 objectID];
  id v8 = [v6 objectForKey:v7];

  LODWORD(self) = [(CRKASMUserFactory *)self isUser:v8 suitableForPerson:v4];
  if (self) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)makeTrustedUserForPerson:(id)a3
{
  id v4 = a3;
  v5 = [CRKASMConcreteTrustedUser alloc];
  v6 = [(CRKASMUserFactory *)self certificateVendor];
  id v7 = [(CRKASMConcreteTrustedUser *)v5 initWithBackingPerson:v4 certificateVendor:v6];

  id v8 = [(CRKASMUserFactory *)self configuration];
  id v9 = [v8 trustedUserCache];
  v10 = [v4 objectID];

  [v9 setObject:v7 forKey:v10];

  return v7;
}

- (BOOL)isUser:(id)a3 suitableForPerson:(id)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = [MEMORY[0x263F08690] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[CRKASMUserFactory isUser:suitableForPerson:]"];
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      [v13 handleFailureInFunction:v14, @"CRKASMUserFactory.m", 91, @"expected %@, got %@", v16, v18 file lineNumber description];
    }
    id v9 = [v7 backingPersonInitialModificationDate];
    v10 = [v8 dateLastModified];

    char v11 = [v9 isEqualToDate:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v2 = [(CRKASMUserFactory *)self configuration];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [@"configuration" componentsSeparatedByString:@","];
  v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_1;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  id v8 = self;
  id v9 = (CRKASMUserFactory *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKASMUserFactory *)v9 isMemberOfClass:objc_opt_class()])
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
          uint64_t v18 = [(CRKASMUserFactory *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKASMUserFactory *)v17 valueForKey:v16];

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

- (CRKASMRosterProviderConfiguration)configuration
{
  return self->_configuration;
}

- (CRKASMCertificateVendor)certificateVendor
{
  return self->_certificateVendor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateVendor, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end