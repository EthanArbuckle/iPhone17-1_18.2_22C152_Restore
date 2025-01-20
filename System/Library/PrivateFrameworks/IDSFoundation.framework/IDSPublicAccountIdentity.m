@interface IDSPublicAccountIdentity
+ (BOOL)supportsSecureCoding;
- (IDSMPPublicAccountIdentity)accountIdentity;
- (IDSMPPublicServiceIdentityAdmin)adminIdentity;
- (IDSMPPublicServiceIdentitySigning)signingIdentity;
- (IDSPublicAccountIdentity)initWithAccountIdentity:(id)a3 adminIdentity:(id)a4 signingIdentity:(id)a5;
- (IDSPublicAccountIdentity)initWithCoder:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSPublicAccountIdentity

- (IDSPublicAccountIdentity)initWithAccountIdentity:(id)a3 adminIdentity:(id)a4 signingIdentity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSPublicAccountIdentity;
  v12 = [(IDSPublicAccountIdentity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountIdentity, a3);
    objc_storeStrong((id *)&v13->_adminIdentity, a4);
    objc_storeStrong((id *)&v13->_signingIdentity, a5);
  }

  return v13;
}

- (IDSPublicAccountIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"kIDSPublicAccountIdentityAccountData");
  uint64_t v9 = objc_opt_class();
  v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, @"kIDSPublicAccountIdentityAdminData");
  uint64_t v13 = objc_opt_class();
  v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, v15, @"kIDSPublicAccountIdentitySigningData");
  id v37 = 0;
  v19 = objc_msgSend_publicAccountIdentitywithDataRepresentation_error_(IDSMPPublicAccountIdentity, v17, (uint64_t)v8, v18, &v37);
  id v21 = v37;
  if (v19)
  {
    id v36 = v21;
    v23 = objc_msgSend_publicServiceIdentityAdminWithDataRepresentation_publicAccountIdentity_error_(IDSMPPublicServiceIdentityAdmin, v20, (uint64_t)v12, v22, v19, &v36);
    id v24 = v36;

    if (v23)
    {
      uint64_t v27 = (uint64_t)v16;
      v28 = self;
      v34 = (void *)v27;
      id v35 = v24;
      v29 = objc_msgSend_publicServiceIdentitySigningWithDataRepresentation_publicAccountIdentity_error_(IDSMPPublicServiceIdentitySigning, v25, v27, v26, v19, &v35);
      id v21 = v35;

      if (v29)
      {
        v32 = (IDSPublicAccountIdentity *)(id)objc_msgSend_initWithAccountIdentity_adminIdentity_signingIdentity_(v28, v30, (uint64_t)v19, v31, v23, v29);
        v28 = v32;
      }
      else
      {
        objc_msgSend_failWithError_(v4, v30, (uint64_t)v21, v31);
        v32 = 0;
      }

      self = v28;
      v16 = v34;
    }
    else
    {
      objc_msgSend_failWithError_(v4, v25, (uint64_t)v24, v26);
      v32 = 0;
      id v21 = v24;
    }
  }
  else
  {
    objc_msgSend_failWithError_(v4, v20, (uint64_t)v21, v22);
    v32 = 0;
  }

  return v32;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_accountIdentity(self, v5, v6, v7);
  id v36 = 0;
  double v11 = objc_msgSend_dataRepresentationWithError_(v8, v9, (uint64_t)&v36, v10);
  id v12 = v36;

  if (v11)
  {
    v16 = objc_msgSend_adminIdentity(self, v13, v14, v15);
    id v35 = v12;
    v19 = objc_msgSend_dataRepresentationWithError_(v16, v17, (uint64_t)&v35, v18);
    id v20 = v35;

    if (v19)
    {
      id v24 = objc_msgSend_signingIdentity(self, v21, v22, v23);
      id v34 = v20;
      uint64_t v27 = objc_msgSend_dataRepresentationWithError_(v24, v25, (uint64_t)&v34, v26);
      id v12 = v34;

      if (v27)
      {
        objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v11, v29, @"kIDSPublicAccountIdentityAccountData");
        objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v19, v31, @"kIDSPublicAccountIdentityAdminData");
        objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v27, v33, @"kIDSPublicAccountIdentitySigningData");
      }
      else
      {
        objc_msgSend_failWithError_(v4, v28, (uint64_t)v12, v29);
      }
    }
    else
    {
      objc_msgSend_failWithError_(v4, v21, (uint64_t)v20, v23);
      id v12 = v20;
    }
  }
  else
  {
    objc_msgSend_failWithError_(v4, v13, (uint64_t)v12, v15);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_accountIdentity(self, v5, v6, v7);
  id v12 = objc_msgSend_adminIdentity(self, v9, v10, v11);
  v16 = objc_msgSend_signingIdentity(self, v13, v14, v15);
  v19 = objc_msgSend_stringWithFormat_(v3, v17, @"<%@ %p accountIdentity: %@, adminIdentity: %@, signingIdentity: %@>", v18, v4, self, v8, v12, v16);

  return (NSString *)v19;
}

- (IDSMPPublicAccountIdentity)accountIdentity
{
  return self->_accountIdentity;
}

- (IDSMPPublicServiceIdentityAdmin)adminIdentity
{
  return self->_adminIdentity;
}

- (IDSMPPublicServiceIdentitySigning)signingIdentity
{
  return self->_signingIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingIdentity, 0);
  objc_storeStrong((id *)&self->_adminIdentity, 0);
  objc_storeStrong((id *)&self->_accountIdentity, 0);
}

@end