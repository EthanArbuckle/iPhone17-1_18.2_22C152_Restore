@interface CRKKeychainPasswordFacade
- (BOOL)removePasswordForService:(id)a3 error:(id *)a4;
- (BOOL)setPassword:(id)a3 forService:(id)a4 accessGroup:(id)a5 error:(id *)a6;
- (CRKKeychainPasswordFacade)initWithBaseQueryAttributes:(id)a3;
- (NSDictionary)baseQueryAttributes;
- (id)errorForPasswordStatus:(int)a3;
- (id)makeQueryWithAttributes:(id)a3;
- (id)passwordForService:(id)a3;
- (id)passwordForService:(id)a3 error:(id *)a4;
- (void)addAccessibilityAttributeToQuery:(id)a3;
- (void)setPassword:(id)a3 forService:(id)a4 accessGroup:(id)a5;
@end

@implementation CRKKeychainPasswordFacade

- (CRKKeychainPasswordFacade)initWithBaseQueryAttributes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKKeychainPasswordFacade;
  v5 = [(CRKKeychainPasswordFacade *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    baseQueryAttributes = v5->_baseQueryAttributes;
    v5->_baseQueryAttributes = (NSDictionary *)v6;
  }
  return v5;
}

- (void)setPassword:(id)a3 forService:(id)a4 accessGroup:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v13 = 0;
  LOBYTE(self) = [(CRKKeychainPasswordFacade *)self setPassword:a3 forService:v8 accessGroup:v9 error:&v13];
  id v10 = v13;
  if ((self & 1) == 0)
  {
    v11 = _CRKLogGeneral_11();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [v10 verboseDescription];
      *(_DWORD *)buf = 138412802;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2114;
      v19 = v12;
      _os_log_error_impl(&dword_224C00000, v11, OS_LOG_TYPE_ERROR, "Could not set password for service %@, access group %@. Error (ignored): %{public}@.", buf, 0x20u);
    }
  }
}

- (id)passwordForService:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v11 = 0;
  v5 = [(CRKKeychainPasswordFacade *)self passwordForService:v4 error:&v11];
  id v6 = v11;
  v7 = v6;
  if (!v5 && v6)
  {
    id v8 = _CRKLogGeneral_11();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 verboseDescription];
      *(_DWORD *)buf = 138412546;
      id v13 = v4;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl(&dword_224C00000, v8, OS_LOG_TYPE_DEFAULT, "Could not retrieve password for service %@. Error (ignored): %{public}@", buf, 0x16u);
    }
  }

  return v5;
}

- (BOOL)setPassword:(id)a3 forService:(id)a4 accessGroup:(id)a5 error:(id *)a6
{
  v23[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    if (v10)
    {
      uint64_t v13 = *MEMORY[0x263F171C8];
      uint64_t v14 = *MEMORY[0x263F17090];
      v22[0] = *MEMORY[0x263F171B8];
      v22[1] = v14;
      v23[0] = v13;
      v23[1] = v11;
      v22[2] = *MEMORY[0x263F175A8];
      v23[2] = v10;
      id v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
      uint64_t v16 = [(CRKKeychainPasswordFacade *)self makeQueryWithAttributes:v15];

      [v16 setObject:v12 forKeyedSubscript:*MEMORY[0x263F16E80]];
      [(CRKKeychainPasswordFacade *)self addAccessibilityAttributeToQuery:v16];
      uint64_t v17 = SecItemAdd((CFDictionaryRef)v16, 0);
      if (v17 == -25299)
      {
        if (![(CRKKeychainPasswordFacade *)self removePasswordForService:v11 error:a6])
        {
          BOOL v20 = 0;
LABEL_15:

          goto LABEL_16;
        }
        uint64_t v17 = SecItemAdd((CFDictionaryRef)v16, 0);
      }
      __int16 v18 = [(CRKKeychainPasswordFacade *)self errorForPasswordStatus:v17];
      v19 = v18;
      BOOL v20 = v18 == 0;
      if (a6 && v18) {
        *a6 = v18;
      }

      goto LABEL_15;
    }
    BOOL v20 = [(CRKKeychainPasswordFacade *)self removePasswordForService:v11 error:a6];
  }
  else if (a6)
  {
    CRKErrorWithCodeAndUserInfo(2, &unk_26D819F88);
    BOOL v20 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_16:

  return v20;
}

- (BOOL)removePasswordForService:(id)a3 error:(id *)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = *MEMORY[0x263F171C8];
    uint64_t v9 = *MEMORY[0x263F17090];
    v16[0] = *MEMORY[0x263F171B8];
    v16[1] = v9;
    v17[0] = v8;
    v17[1] = v6;
    id v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    CFDictionaryRef v11 = [(CRKKeychainPasswordFacade *)self makeQueryWithAttributes:v10];

    id v12 = [(CRKKeychainPasswordFacade *)self errorForPasswordStatus:SecItemDelete(v11)];
    uint64_t v13 = v12;
    BOOL v14 = v12 == 0;
    if (a4 && v12) {
      *a4 = v12;
    }
  }
  else if (a4)
  {
    CRKErrorWithCodeAndUserInfo(2, &unk_26D819FB0);
    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)passwordForService:(id)a3 error:(id *)a4
{
  v18[3] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v6 = *MEMORY[0x263F171C8];
    uint64_t v7 = *MEMORY[0x263F17520];
    v17[0] = *MEMORY[0x263F171B8];
    v17[1] = v7;
    v18[0] = v6;
    v18[1] = MEMORY[0x263EFFA88];
    v17[2] = *MEMORY[0x263F17090];
    v18[2] = a3;
    uint64_t v8 = NSDictionary;
    id v9 = a3;
    id v10 = [v8 dictionaryWithObjects:v18 forKeys:v17 count:3];

    CFDictionaryRef v11 = [(CRKKeychainPasswordFacade *)self makeQueryWithAttributes:v10];

    CFTypeRef v16 = 0;
    id v12 = [(CRKKeychainPasswordFacade *)self errorForPasswordStatus:SecItemCopyMatching(v11, &v16)];
    uint64_t v13 = v12;
    if (v12)
    {
      BOOL v14 = 0;
      if (a4) {
        *a4 = v12;
      }
    }
    else
    {
      BOOL v14 = (void *)v16;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)errorForPasswordStatus:(int)a3
{
  if (a3 == -25300)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x263F087E8], "crk_errorForSecurityOSStatus:", v3);
  }
  return v5;
}

- (void)addAccessibilityAttributeToQuery:(id)a3
{
}

- (id)makeQueryWithAttributes:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(CRKKeychainPasswordFacade *)self baseQueryAttributes];
  uint64_t v8 = (void *)[v6 initWithDictionary:v7];

  [v8 addEntriesFromDictionary:v5];

  return v8;
}

- (NSDictionary)baseQueryAttributes
{
  return self->_baseQueryAttributes;
}

- (void).cxx_destruct
{
}

@end