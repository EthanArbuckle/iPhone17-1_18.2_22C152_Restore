@interface CRKASMConcreteRoster
- (BOOL)isEqual:(id)a3;
- (CRKASMCertificateVendor)certificateVendor;
- (CRKASMConcreteRoster)initWithOrganization:(id)a3 user:(id)a4 courses:(id)a5 certificateVendor:(id)a6;
- (CRKASMOrganization)organization;
- (CRKASMUser)user;
- (NSArray)courses;
- (NSSet)allTrustedUserCertificates;
- (NSString)description;
- (id)allTrustedUserIdentifiers;
- (unint64_t)hash;
@end

@implementation CRKASMConcreteRoster

- (CRKASMConcreteRoster)initWithOrganization:(id)a3 user:(id)a4 courses:(id)a5 certificateVendor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CRKASMConcreteRoster;
  v15 = [(CRKASMConcreteRoster *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_organization, a3);
    objc_storeStrong((id *)&v16->_user, a4);
    uint64_t v17 = [v13 copy];
    courses = v16->_courses;
    v16->_courses = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_certificateVendor, a6);
  }

  return v16;
}

- (NSSet)allTrustedUserCertificates
{
  v3 = [(CRKASMConcreteRoster *)self certificateVendor];
  v4 = [(CRKASMConcreteRoster *)self allTrustedUserIdentifiers];
  v5 = [v3 certificatesForUserIdentifiers:v4];

  return (NSSet *)v5;
}

- (id)allTrustedUserIdentifiers
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = [(CRKASMConcreteRoster *)self courses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v10 = objc_msgSend(v9, "trustedUsers", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = [*(id *)(*((void *)&v18 + 1) + 8 * j) identifier];
              [v3 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  v16 = (void *)[v3 copy];

  return v16;
}

- (unint64_t)hash
{
  v3 = [(CRKASMConcreteRoster *)self organization];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(CRKASMConcreteRoster *)self user];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(CRKASMConcreteRoster *)self courses];
  uint64_t v8 = [v7 hash];
  v9 = [(CRKASMConcreteRoster *)self certificateVendor];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(@"organization, user, courses, certificateVendor", "componentsSeparatedByString:", @",");
  uint64_t v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  uint64_t v8 = self;
  v9 = (CRKASMConcreteRoster *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKASMConcreteRoster *)v9 isMemberOfClass:objc_opt_class()])
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
          uint64_t v17 = v9;
          uint64_t v18 = [(CRKASMConcreteRoster *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKASMConcreteRoster *)v17 valueForKey:v16];

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
  uint64_t v5 = [(CRKASMConcreteRoster *)self courses];
  uint64_t v6 = [(CRKASMConcreteRoster *)self user];
  id v7 = [(CRKASMConcreteRoster *)self organization];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p { courses = %@, user = %@, organization = %@ }>", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

- (CRKASMOrganization)organization
{
  return self->_organization;
}

- (CRKASMUser)user
{
  return self->_user;
}

- (NSArray)courses
{
  return self->_courses;
}

- (CRKASMCertificateVendor)certificateVendor
{
  return self->_certificateVendor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateVendor, 0);
  objc_storeStrong((id *)&self->_courses, 0);
  objc_storeStrong((id *)&self->_user, 0);

  objc_storeStrong((id *)&self->_organization, 0);
}

@end