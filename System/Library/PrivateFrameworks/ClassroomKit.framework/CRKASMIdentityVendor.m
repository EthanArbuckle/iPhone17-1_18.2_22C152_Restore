@interface CRKASMIdentityVendor
- (BOOL)isEqual:(id)a3;
- (CRKASMCredentialStore)credentialStore;
- (CRKASMIdentityVendor)initWithUserIdentifier:(id)a3 commonNamePrefix:(id)a4 credentialStore:(id)a5;
- (CRKIdentity)identity;
- (NSString)commonNamePrefix;
- (NSString)userIdentifier;
- (id)description;
- (id)existingIdentity;
- (id)makeIdentity;
- (id)makeIdentityAndAddToKeychain;
- (unint64_t)hash;
- (void)makeIdentityAndAddToKeychain;
@end

@implementation CRKASMIdentityVendor

- (CRKASMIdentityVendor)initWithUserIdentifier:(id)a3 commonNamePrefix:(id)a4 credentialStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKASMIdentityVendor;
  v11 = [(CRKASMIdentityVendor *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    userIdentifier = v11->_userIdentifier;
    v11->_userIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    commonNamePrefix = v11->_commonNamePrefix;
    v11->_commonNamePrefix = (NSString *)v14;

    objc_storeStrong((id *)&v11->_credentialStore, a5);
  }

  return v11;
}

- (CRKIdentity)identity
{
  v3 = [(CRKASMIdentityVendor *)self existingIdentity];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CRKASMIdentityVendor *)self makeIdentityAndAddToKeychain];
  }
  v6 = v5;

  return (CRKIdentity *)v6;
}

- (id)existingIdentity
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [CRKASMIdentityPicker alloc];
  v4 = [(CRKASMIdentityVendor *)self credentialStore];
  id v5 = [(CRKASMIdentityVendor *)self userIdentifier];
  v6 = [(CRKASMIdentityPicker *)v3 initWithCredentialStore:v4 userIdentifier:v5];

  v7 = [(CRKASMIdentityPicker *)v6 identity];
  if (v7)
  {
    id v8 = _CRKLogASM_8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(CRKASMIdentityVendor *)self userIdentifier];
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_224C00000, v8, OS_LOG_TYPE_DEFAULT, "Found existing ASM identity for user identifier %@", (uint8_t *)&v11, 0xCu);
    }
  }

  return v7;
}

- (id)makeIdentityAndAddToKeychain
{
  v3 = [(CRKASMIdentityVendor *)self makeIdentity];
  if (v3)
  {
    v4 = [(CRKASMIdentityVendor *)self credentialStore];
    id v5 = [(CRKASMIdentityVendor *)self userIdentifier];
    v6 = [v4 addIdentity:v3 forUserIdentifier:v5];

    if (!v6)
    {
      v7 = _CRKLogASM_8();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CRKASMIdentityVendor makeIdentityAndAddToKeychain](v7);
      }
    }
    id v8 = v3;
  }

  return v3;
}

- (id)makeIdentity
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = _CRKLogASM_8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(CRKASMIdentityVendor *)self userIdentifier];
    int v10 = 138412290;
    int v11 = v4;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "Creating new identity for ASM user identifier %@", (uint8_t *)&v10, 0xCu);
  }
  id v5 = [(CRKASMIdentityVendor *)self credentialStore];
  v6 = [(CRKASMIdentityVendor *)self commonNamePrefix];
  v7 = [(CRKASMIdentityVendor *)self userIdentifier];
  id v8 = [v5 makeIdentityWithCommonNamePrefix:v6 userIdentifier:v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = [(CRKASMIdentityVendor *)self userIdentifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(CRKASMIdentityVendor *)self commonNamePrefix];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(CRKASMIdentityVendor *)self credentialStore];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(@"userIdentifier, commonNamePrefix, credentialStore", "componentsSeparatedByString:", @",");
  uint64_t v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_8;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  unint64_t v8 = self;
  id v9 = (CRKASMIdentityVendor *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKASMIdentityVendor *)v9 isMemberOfClass:objc_opt_class()])
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
          objc_super v17 = v9;
          uint64_t v18 = [(CRKASMIdentityVendor *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKASMIdentityVendor *)v17 valueForKey:v16];

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

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CRKASMIdentityVendor *)self userIdentifier];
  uint64_t v6 = [(CRKASMIdentityVendor *)self commonNamePrefix];
  id v7 = [(CRKASMIdentityVendor *)self credentialStore];
  unint64_t v8 = [v3 stringWithFormat:@"<%@: %p { userIdentifier = %@, commonNamePrefix = %@, credentialStore = %@ }>", v4, self, v5, v6, v7];

  return v8;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)commonNamePrefix
{
  return self->_commonNamePrefix;
}

- (CRKASMCredentialStore)credentialStore
{
  return self->_credentialStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialStore, 0);
  objc_storeStrong((id *)&self->_commonNamePrefix, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

- (void)makeIdentityAndAddToKeychain
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Failed to add ASM user identity to keychain", v1, 2u);
}

@end