@interface IDSLegacyDeviceMessageProtectionCypher
+ (BOOL)supportsSecureCoding;
+ (id)cypherWithEndpoint:(id)a3 error:(id *)a4;
- (IDSLegacyDeviceMessageProtectionCypher)initWithCoder:(id)a3;
- (IDSLegacyDeviceMessageProtectionCypher)initWithPublicIdentity:(id)a3;
- (IDSMPPublicLegacyIdentity)publicIdentity;
- (NSString)identifier;
- (id)_fullIdentityFromAccountIdentity:(id)a3 error:(id *)a4;
- (id)cypherData:(id)a3 withAccountIdentity:(id)a4 identifier:(id *)a5 error:(id *)a6;
- (id)decypherData:(id)a3 withAccountIdentity:(id)a4 signingDevicePublicKey:(id)a5 identifier:(id)a6 error:(id *)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSLegacyDeviceMessageProtectionCypher

- (IDSLegacyDeviceMessageProtectionCypher)initWithPublicIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSLegacyDeviceMessageProtectionCypher;
  v6 = [(IDSLegacyDeviceMessageProtectionCypher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_publicIdentity, a3);
  }

  return v7;
}

+ (id)cypherWithEndpoint:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)a1);
  v10 = objc_msgSend_publicDeviceIdentityContainer(v5, v7, v8, v9);

  v14 = objc_msgSend_legacyPublicIdentity(v10, v11, v12, v13);
  v17 = objc_msgSend_initWithPublicIdentity_(v6, v15, (uint64_t)v14, v16);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_publicIdentity(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v10, v9, @"kIDSLegacyDeviceMessageProtectionCypherPublicIdentity");
}

- (IDSLegacyDeviceMessageProtectionCypher)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"kIDSLegacyDeviceMessageProtectionCypherPublicIdentity");

  if (v8)
  {
    self = (IDSLegacyDeviceMessageProtectionCypher *)(id)objc_msgSend_initWithPublicIdentity_(self, v9, (uint64_t)v8, v11);
    uint64_t v12 = self;
  }
  else
  {
    double v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v9, v10, v11);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "Failed to initWithCoder MPLegacy cypher", v15, 2u);
    }

    uint64_t v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return (NSString *)IDSEncryptionTypeStringFromEncryptionType(1);
}

- (id)cypherData:(id)a3 withAccountIdentity:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (void *)MEMORY[0x1E4F6C3B8];
  id v11 = a4;
  v15 = objc_msgSend_registration(v10, v12, v13, v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v47) = 0;
    _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_INFO, "LegacyMP cypher data - Begin", (uint8_t *)&v47, 2u);
  }

  v19 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v16, v17, v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_19DB7F31C((uint64_t)v9, v19);
  }

  v22 = objc_msgSend__fullIdentityFromAccountIdentity_error_(self, v20, (uint64_t)v11, v21, a6);

  if (v22)
  {
    v26 = objc_msgSend_publicIdentity(self, v23, v24, v25);
    v29 = objc_msgSend_signAndProtectData_withSigner_error_(v26, v27, (uint64_t)v9, v28, v22, a6);

    v33 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v30, v31, v32);
    v34 = v33;
    if (v29)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        LOWORD(v47) = 0;
        _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_INFO, "LegacyMP cypher data - encryption success - Done", (uint8_t *)&v47, 2u);
      }

      v29 = v29;
      v35 = v29;
    }
    else
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = objc_msgSend_publicIdentity(self, v40, v41, v42);
        v44 = (void *)v43;
        if (a6) {
          id v45 = *a6;
        }
        else {
          id v45 = 0;
        }
        int v47 = 138478595;
        id v48 = v9;
        __int16 v49 = 2113;
        v50 = v22;
        __int16 v51 = 2113;
        uint64_t v52 = v43;
        __int16 v53 = 2114;
        id v54 = v45;
        _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "LegacyMP cypher data - missing decryption failed - Fail {data: %{private}@, fullIdentity: %{private}@, publicIdentity: %{private}@, error: %{public}@}", (uint8_t *)&v47, 0x2Au);
      }
      v35 = 0;
    }
  }
  else
  {
    v29 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v23, v24, v25);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend_publicIdentity(self, v36, v37, v38);
      int v47 = 138478083;
      id v48 = v9;
      __int16 v49 = 2114;
      v50 = v39;
      _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "LegacyMP cypher data - missing full identity - Fail {data: %{private}@, publicIdentity: %{public}@}", (uint8_t *)&v47, 0x16u);
    }
    v35 = 0;
  }

  return v35;
}

- (id)decypherData:(id)a3 withAccountIdentity:(id)a4 signingDevicePublicKey:(id)a5 identifier:(id)a6 error:(id *)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (void *)MEMORY[0x1E4F6C3B8];
  id v12 = a4;
  double v16 = objc_msgSend_registration(v11, v13, v14, v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v48) = 0;
    _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_INFO, "LegacyMP decypher data - Begin", (uint8_t *)&v48, 2u);
  }

  v19 = objc_msgSend__fullIdentityFromAccountIdentity_error_(self, v17, (uint64_t)v12, v18, a7);

  if (v19)
  {
    v23 = objc_msgSend_publicIdentity(self, v20, v21, v22);
    v26 = objc_msgSend_verifyAndExposeData_withSigner_error_(v19, v24, (uint64_t)v10, v25, v23, a7);

    v30 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v27, v28, v29);
    uint64_t v31 = v30;
    if (v26)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        LOWORD(v48) = 0;
        _os_log_impl(&dword_19D9BE000, v31, OS_LOG_TYPE_INFO, "LegacyMP decypher data - decryption success - Done", (uint8_t *)&v48, 2u);
      }

      v35 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v32, v33, v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        sub_19DB7F394((uint64_t)v26, v35);
      }

      v26 = v26;
      v36 = v26;
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = objc_msgSend_publicIdentity(self, v41, v42, v43);
        id v45 = (void *)v44;
        if (a7) {
          id v46 = *a7;
        }
        else {
          id v46 = 0;
        }
        int v48 = 138478595;
        id v49 = v10;
        __int16 v50 = 2114;
        uint64_t v51 = v44;
        __int16 v52 = 2113;
        __int16 v53 = v19;
        __int16 v54 = 2114;
        id v55 = v46;
        _os_log_impl(&dword_19D9BE000, v31, OS_LOG_TYPE_DEFAULT, "LegacyMP decyper data - decryption failed - Fail {data: %{private}@, publicIdentity: %{public}@, fullIdentity: %{private}@, error: %{public}@}", (uint8_t *)&v48, 0x2Au);
      }
      v36 = 0;
    }
  }
  else
  {
    v26 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v20, v21, v22);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_msgSend_publicIdentity(self, v37, v38, v39);
      int v48 = 138543618;
      id v49 = v10;
      __int16 v50 = 2114;
      uint64_t v51 = (uint64_t)v40;
      _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "LegacyMP decypher data - missing full identity - Fail {data: %{public}@, publicIdentity: %{public}@", (uint8_t *)&v48, 0x16u);
    }
    v36 = 0;
  }

  return v36;
}

- (id)_fullIdentityFromAccountIdentity:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v9 = objc_msgSend_deviceKey(v5, v6, v7, v8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = objc_msgSend_legacyIdentity(v9, v10, v11, v12);
    id v17 = v13;
    if (v13)
    {
      id v17 = v13;
      double v18 = v17;
    }
    else
    {
      v26 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v14, v15, v16);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        id v31 = v5;
        _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "Failed ot create full identity from account identity {accountIdentity: %{private}@}", buf, 0xCu);
      }

      double v18 = 0;
    }
    goto LABEL_11;
  }
  v19 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11, v12);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v31 = v5;
    _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "Failed to create full identity from account identity - class mismatch {accountIdentity: %{private}@}", buf, 0xCu);
  }

  if (a4)
  {
    double v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F61128];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    double v29 = @"Device Identity class mismatch expected IDSDeviceIdentity";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)&v29, v21, &v28, 1);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v22, v24, v23, v25, -2000, v17);
    double v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  double v18 = 0;
LABEL_12:

  return v18;
}

- (IDSMPPublicLegacyIdentity)publicIdentity
{
  return self->_publicIdentity;
}

- (void).cxx_destruct
{
}

@end