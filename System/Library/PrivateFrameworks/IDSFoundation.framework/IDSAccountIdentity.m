@interface IDSAccountIdentity
+ (BOOL)supportsSecureCoding;
- (IDSAccountIdentity)initWithCoder:(id)a3;
- (IDSAccountIdentity)initWithFullCluster:(id)a3;
- (IDSMPFullAccountIdentity)accountIdentity;
- (IDSMPFullAccountIdentityCluster)identityCluster;
- (IDSMPFullServiceIdentityAdmin)adminIdentity;
- (IDSMPFullServiceIdentitySigning)signingIdentity;
- (IDSPublicAccountIdentity)accountPublicKey;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSAccountIdentity

- (IDSAccountIdentity)initWithFullCluster:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSAccountIdentity;
  v6 = [(IDSAccountIdentity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identityCluster, a3);
  }

  return v7;
}

- (IDSPublicAccountIdentity)accountPublicKey
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_adminIdentity(self, a2, v2, v3);
  id v36 = 0;
  v8 = objc_msgSend_publicServiceIdentityAdminWithError_(v5, v6, (uint64_t)&v36, v7);
  id v9 = v36;

  if (v8)
  {
    v13 = objc_msgSend_signingIdentity(self, v10, v11, v12);
    id v35 = v9;
    v16 = objc_msgSend_publicServiceIdentitySigningWithError_(v13, v14, (uint64_t)&v35, v15);
    id v17 = v35;

    if (v16)
    {
      v21 = objc_msgSend_accountIdentity(self, v18, v19, v20);
      id v34 = v17;
      v24 = objc_msgSend_publicAccountIdentityWithError_(v21, v22, (uint64_t)&v34, v23);
      id v9 = v34;

      if (v24)
      {
        v28 = [IDSPublicAccountIdentity alloc];
        v31 = objc_msgSend_initWithAccountIdentity_adminIdentity_signingIdentity_(v28, v29, (uint64_t)v24, v30, v8, v16);
      }
      else
      {
        v32 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v25, v26, v27);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v38 = self;
          __int16 v39 = 2114;
          id v40 = v9;
          _os_log_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_DEFAULT, "Failed to create publicAccountIdentity for IDSPublicAccountIdentity {IDSAccountIdentity: %{public}@, error: %{public}@}", buf, 0x16u);
        }

        v31 = 0;
      }
    }
    else
    {
      v24 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v18, v19, v20);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v38 = self;
        __int16 v39 = 2114;
        id v40 = v17;
        _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, "Failed to create publicSigningIdentity for IDSPublicAccountIdentity {IDSAccountIdentity: %{public}@, error: %{public}@}", buf, 0x16u);
      }
      v31 = 0;
      id v9 = v17;
    }
  }
  else
  {
    v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11, v12);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v38 = self;
      __int16 v39 = 2114;
      id v40 = v9;
      _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "Failed to create publicAdminIdentity for IDSPublicAccountIdentity {IDSAccountIdentity: %{public}@, error: %{public}@}", buf, 0x16u);
    }
    v31 = 0;
  }

  return (IDSPublicAccountIdentity *)v31;
}

- (NSString)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_accountIdentity(self, v5, v6, v7);
  double v12 = objc_msgSend_adminIdentity(self, v9, v10, v11);
  v16 = objc_msgSend_signingIdentity(self, v13, v14, v15);
  uint64_t v19 = objc_msgSend_stringWithFormat_(v3, v17, @"<%@ %p accountIdentity: %@, adminIdentity: %@, signingIdentity: %@>", v18, v4, self, v8, v12, v16);

  return (NSString *)v19;
}

- (IDSAccountIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"kIDSAccountIdentityClusterData");
  id v17 = 0;
  double v11 = objc_msgSend_clusterWithDataRepresentation_error_(IDSMPFullAccountIdentityCluster, v9, (uint64_t)v8, v10, &v17);
  id v13 = v17;
  if (v11)
  {
    self = (IDSAccountIdentity *)(id)objc_msgSend_initWithFullCluster_(self, v12, (uint64_t)v11, v14);
    double v15 = self;
  }
  else
  {
    objc_msgSend_failWithError_(v4, v12, (uint64_t)v13, v14);
    double v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_identityCluster(self, v5, v6, v7);
  id v15 = 0;
  double v11 = objc_msgSend_dataRepresentationWithError_(v8, v9, (uint64_t)&v15, v10);
  id v12 = v15;

  if (v11) {
    objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v11, v14, @"kIDSAccountIdentityClusterData");
  }
  else {
    objc_msgSend_failWithError_(v4, v13, (uint64_t)v12, v14);
  }
}

- (IDSMPFullAccountIdentity)accountIdentity
{
  id v4 = objc_msgSend_identityCluster(self, a2, v2, v3);
  v8 = objc_msgSend_fullAccountIdentity(v4, v5, v6, v7);

  return (IDSMPFullAccountIdentity *)v8;
}

- (IDSMPFullServiceIdentityAdmin)adminIdentity
{
  id v4 = objc_msgSend_identityCluster(self, a2, v2, v3);
  double v7 = objc_msgSend_adminServiceIdentityWithType_(v4, v5, 1, v6);

  return (IDSMPFullServiceIdentityAdmin *)v7;
}

- (IDSMPFullServiceIdentitySigning)signingIdentity
{
  id v4 = objc_msgSend_identityCluster(self, a2, v2, v3);
  double v7 = objc_msgSend_signingServiceIdentityWithType_(v4, v5, 1, v6);

  return (IDSMPFullServiceIdentitySigning *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSMPFullAccountIdentityCluster)identityCluster
{
  return self->_identityCluster;
}

- (void).cxx_destruct
{
}

@end