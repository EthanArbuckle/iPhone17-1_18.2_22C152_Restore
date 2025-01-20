@interface CRKASMRosterProviderEnvironment
- (BOOL)isEqual:(id)a3;
- (CRKASMCertificateVendor)certificateVendor;
- (CRKASMRosterProviderConfiguration)configuration;
- (CRKASMRosterProviderEnvironment)initWithConfiguration:(id)a3;
- (CRKASMRosterProviderEnvironment)initWithConfiguration:(id)a3 certificateVendor:(id)a4 userFactory:(id)a5;
- (CRKASMUserFactory)userFactory;
- (id)identityVendorForUserIdentifier:(id)a3;
- (unint64_t)hash;
@end

@implementation CRKASMRosterProviderEnvironment

- (CRKASMRosterProviderEnvironment)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [CRKASMCertificateVendor alloc];
  v6 = [v4 credentialStore];
  v7 = [(CRKASMCertificateVendor *)v5 initWithCredentialStore:v6];

  v8 = [[CRKASMUserFactory alloc] initWithConfiguration:v4 certificateVendor:v7];
  v9 = [(CRKASMRosterProviderEnvironment *)self initWithConfiguration:v4 certificateVendor:v7 userFactory:v8];

  return v9;
}

- (CRKASMRosterProviderEnvironment)initWithConfiguration:(id)a3 certificateVendor:(id)a4 userFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRKASMRosterProviderEnvironment;
  v12 = [(CRKASMRosterProviderEnvironment *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeStrong((id *)&v13->_certificateVendor, a4);
    objc_storeStrong((id *)&v13->_userFactory, a5);
  }

  return v13;
}

- (id)identityVendorForUserIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [CRKASMIdentityVendor alloc];
  v6 = [(CRKASMRosterProviderEnvironment *)self configuration];
  v7 = [v6 userCommonNamePrefix];
  v8 = [(CRKASMRosterProviderEnvironment *)self configuration];
  id v9 = [v8 credentialStore];
  id v10 = [(CRKASMIdentityVendor *)v5 initWithUserIdentifier:v4 commonNamePrefix:v7 credentialStore:v9];

  return v10;
}

- (unint64_t)hash
{
  v3 = [(CRKASMRosterProviderEnvironment *)self configuration];
  uint64_t v4 = [v3 hash];
  v5 = [(CRKASMRosterProviderEnvironment *)self certificateVendor];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(CRKASMRosterProviderEnvironment *)self userFactory];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(@"configuration, certificateVendor, userFactory", "componentsSeparatedByString:", @",");
  uint64_t v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_2;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  unint64_t v8 = self;
  id v9 = (CRKASMRosterProviderEnvironment *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKASMRosterProviderEnvironment *)v9 isMemberOfClass:objc_opt_class()])
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
          uint64_t v18 = [(CRKASMRosterProviderEnvironment *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKASMRosterProviderEnvironment *)v17 valueForKey:v16];

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

- (CRKASMUserFactory)userFactory
{
  return self->_userFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFactory, 0);
  objc_storeStrong((id *)&self->_certificateVendor, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end