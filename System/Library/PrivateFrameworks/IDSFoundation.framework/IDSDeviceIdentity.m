@interface IDSDeviceIdentity
+ (BOOL)supportsSecureCoding;
- (ENDevicePublicKey)devicePublicKey;
- (IDSAccountIdentity)accountIdentity;
- (IDSDeviceIdentity)initWithCoder:(id)a3;
- (IDSDeviceIdentity)initWithLegacyIdentity:(id)a3 modernIdentity:(id)a4 accountIdentity:(id)a5;
- (IDSMPFullDeviceIdentity)modernIdentity;
- (IDSMPFullLegacyIdentity)legacyIdentity;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSDeviceIdentity

- (IDSDeviceIdentity)initWithLegacyIdentity:(id)a3 modernIdentity:(id)a4 accountIdentity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSDeviceIdentity;
  v12 = [(IDSDeviceIdentity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_legacyIdentity, a3);
    objc_storeStrong((id *)&v13->_modernIdentity, a4);
    objc_storeStrong((id *)&v13->_accountIdentity, a5);
  }

  return v13;
}

- (ENDevicePublicKey)devicePublicKey
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_legacyIdentity(self, a2, v2, v3);
  id v32 = 0;
  v8 = objc_msgSend_publicIdentityWithError_(v5, v6, (uint64_t)&v32, v7);
  id v9 = v32;

  if (v8)
  {
    v13 = objc_msgSend_modernIdentity(self, v10, v11, v12);
    id v31 = v9;
    v16 = objc_msgSend_publicDeviceIdentityWithError_(v13, v14, (uint64_t)&v31, v15);
    id v17 = v31;

    if (v16)
    {
      v21 = objc_msgSend_accountIdentity(self, v18, v19, v20);
      v25 = objc_msgSend_accountPublicKey(v21, v22, v23, v24);

      v26 = [IDSPublicDeviceIdentity alloc];
      v29 = objc_msgSend_initWithPublicLegacyIdentity_modernIdentity_accountIdentity_(v26, v27, (uint64_t)v8, v28, v16, v25);
    }
    else
    {
      v25 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v18, v19, v20);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v34 = self;
        __int16 v35 = 2114;
        id v36 = v17;
        _os_log_impl(&dword_19D9BE000, v25, OS_LOG_TYPE_DEFAULT, "Failed to create modernPublicKey {deviceIdentity: %{public}@, error: %{public}@}", buf, 0x16u);
      }
      v29 = 0;
    }
  }
  else
  {
    v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11, v12);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v34 = self;
      __int16 v35 = 2114;
      id v36 = v9;
      _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "Failed to create legacyPublicKey {deviceIdentity: %{public}@, error: %{public}@}", buf, 0x16u);
    }
    v29 = 0;
    id v17 = v9;
  }

  return (ENDevicePublicKey *)v29;
}

- (NSString)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_legacyIdentity(self, v5, v6, v7);
  double v12 = objc_msgSend_modernIdentity(self, v9, v10, v11);
  v16 = objc_msgSend_accountIdentity(self, v13, v14, v15);
  uint64_t v19 = objc_msgSend_stringWithFormat_(v3, v17, @"<%@ %p legacyIdentity: %@, modernIdentity: %@, accountIdentity: %@>", v18, v4, self, v8, v12, v16);

  return (NSString *)v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSDeviceIdentity)initWithCoder:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"kIDSDeviceIdentityLegacy");
  id v47 = 0;
  double v11 = objc_msgSend_identityWithData_error_(IDSMPFullLegacyIdentity, v9, (uint64_t)v8, v10, &v47);
  id v13 = v47;
  if (v11)
  {
    uint64_t v15 = objc_opt_class();
    double v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, v17, @"kIDSDeviceIdentityAccount");
    uint64_t v19 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, v21, @"kIDSDeviceIdentityModern");
    v26 = (void *)v22;
    if (v18 && v22)
    {
      v27 = objc_msgSend_adminIdentity(v18, v23, v24, v25);
      id v46 = v13;
      uint64_t v30 = objc_msgSend_publicServiceIdentityAdminWithError_(v27, v28, (uint64_t)&v46, v29);
      id v31 = v46;

      if (v30)
      {
        id v45 = v31;
        __int16 v35 = objc_msgSend_deviceIdentityFromDataRepresentation_publicAdminServiceIdentity_error_(IDSMPFullDeviceIdentity, v32, (uint64_t)v26, v34, v30, &v45, v30);
        id v36 = v45;

        if (v35)
        {
          self = (IDSDeviceIdentity *)(id)objc_msgSend_initWithLegacyIdentity_modernIdentity_accountIdentity_(self, v37, (uint64_t)v11, v38, v35, v18);
          v39 = self;
        }
        else
        {
          objc_msgSend_failWithError_(v4, v37, (uint64_t)v36, v38);
          v39 = 0;
        }

        id v31 = v36;
      }
      else
      {
        v40 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v32, v33, v34, 0);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v49 = v18;
          __int16 v50 = 2114;
          id v51 = v31;
          _os_log_impl(&dword_19D9BE000, v40, OS_LOG_TYPE_DEFAULT, "Failed to initWithCoder missing publicAdminKey from account {account: %{public}@, error: %{public}@", buf, 0x16u);
        }

        objc_msgSend_failWithError_(v4, v41, (uint64_t)v31, v42);
        v39 = 0;
      }

      id v13 = v31;
    }
    else
    {
      self = (IDSDeviceIdentity *)(id)objc_msgSend_initWithLegacyIdentity_modernIdentity_accountIdentity_(self, v23, (uint64_t)v11, v25, 0, 0);
      v39 = self;
    }
  }
  else
  {
    objc_msgSend_failWithError_(v4, v12, (uint64_t)v13, v14);
    v39 = 0;
  }

  return v39;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_legacyIdentity(self, v5, v6, v7);
  id v41 = 0;
  double v11 = objc_msgSend_dataRepresentationWithError_(v8, v9, (uint64_t)&v41, v10);
  id v12 = v41;

  if (!v11)
  {
    objc_msgSend_failWithError_(v4, v13, (uint64_t)v12, v14);
LABEL_7:
    id v31 = v12;
    goto LABEL_10;
  }
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v11, v14, @"kIDSDeviceIdentityLegacy");
  uint64_t v18 = objc_msgSend_modernIdentity(self, v15, v16, v17);
  if (!v18) {
    goto LABEL_7;
  }
  uint64_t v22 = (void *)v18;
  uint64_t v23 = objc_msgSend_accountIdentity(self, v19, v20, v21);

  if (!v23) {
    goto LABEL_7;
  }
  v27 = objc_msgSend_modernIdentity(self, v24, v25, v26);
  id v40 = v12;
  uint64_t v30 = objc_msgSend_dataRepresentationWithError_(v27, v28, (uint64_t)&v40, v29);
  id v31 = v40;

  if (v30)
  {
    objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v30, v33, @"kIDSDeviceIdentityModern");
    uint64_t v37 = objc_msgSend_accountIdentity(self, v34, v35, v36);
    objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, v39, @"kIDSDeviceIdentityAccount");
  }
  else
  {
    objc_msgSend_failWithError_(v4, v32, (uint64_t)v31, v33);
  }

LABEL_10:
}

- (IDSMPFullLegacyIdentity)legacyIdentity
{
  return self->_legacyIdentity;
}

- (IDSMPFullDeviceIdentity)modernIdentity
{
  return self->_modernIdentity;
}

- (IDSAccountIdentity)accountIdentity
{
  return self->_accountIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentity, 0);
  objc_storeStrong((id *)&self->_modernIdentity, 0);
  objc_storeStrong((id *)&self->_legacyIdentity, 0);
}

@end