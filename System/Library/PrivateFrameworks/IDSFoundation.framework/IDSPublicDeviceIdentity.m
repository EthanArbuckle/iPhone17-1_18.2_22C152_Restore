@interface IDSPublicDeviceIdentity
+ (BOOL)supportsSecureCoding;
- (IDSMPPublicDeviceIdentity)modernIdentity;
- (IDSMPPublicLegacyIdentity)legacyIdentity;
- (IDSPublicAccountIdentity)accountIdentity;
- (IDSPublicDeviceIdentity)initWithCoder:(id)a3;
- (IDSPublicDeviceIdentity)initWithPublicLegacyIdentity:(id)a3 modernIdentity:(id)a4 accountIdentity:(id)a5;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSPublicDeviceIdentity

- (IDSPublicDeviceIdentity)initWithPublicLegacyIdentity:(id)a3 modernIdentity:(id)a4 accountIdentity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSPublicDeviceIdentity;
  v12 = [(IDSPublicDeviceIdentity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_legacyIdentity, a3);
    objc_storeStrong((id *)&v13->_modernIdentity, a4);
    objc_storeStrong((id *)&v13->_accountIdentity, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPublicDeviceIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"kIDSPublicDeviceIdentityLegacy");
  id v37 = 0;
  id v11 = objc_msgSend_identityWithData_error_(IDSMPPublicLegacyIdentity, v9, (uint64_t)v8, v10, &v37);
  id v13 = v37;
  if (v11)
  {
    uint64_t v15 = objc_opt_class();
    v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, v17, @"kIDSPublicDeviceIdentityAccount");
    uint64_t v19 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, v21, @"kIDSPublicDeviceIdentityModern");
    v26 = (void *)v22;
    if (v18 && v22)
    {
      v27 = objc_msgSend_adminIdentity(v18, v23, v24, v25);
      id v36 = v13;
      v30 = objc_msgSend_deviceIdentityFromDataRepresentation_publicAdminServiceIdentity_error_(IDSMPPublicDeviceIdentity, v28, (uint64_t)v26, v29, v27, &v36);
      id v31 = v36;

      if (v30)
      {
        self = (IDSPublicDeviceIdentity *)(id)objc_msgSend_initWithPublicLegacyIdentity_modernIdentity_accountIdentity_(self, v32, (uint64_t)v11, v33, v30, v18);
        id v13 = v31;
        v34 = self;
      }
      else
      {
        objc_msgSend_failWithError_(v4, v32, (uint64_t)v31, v33);
        id v13 = v31;
        v34 = 0;
      }
    }
    else
    {
      self = (IDSPublicDeviceIdentity *)(id)objc_msgSend_initWithPublicLegacyIdentity_modernIdentity_accountIdentity_(self, v23, (uint64_t)v11, v25, 0, 0);
      v34 = self;
    }
  }
  else
  {
    objc_msgSend_failWithError_(v4, v12, (uint64_t)v13, v14);
    v34 = 0;
  }

  return v34;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_legacyIdentity(self, v5, v6, v7);
  id v41 = 0;
  id v11 = objc_msgSend_dataRepresentationWithError_(v8, v9, (uint64_t)&v41, v10);
  id v12 = v41;

  if (!v11)
  {
    objc_msgSend_failWithError_(v4, v13, (uint64_t)v12, v14);
LABEL_7:
    id v31 = v12;
    goto LABEL_10;
  }
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v11, v14, @"kIDSPublicDeviceIdentityLegacy");
  uint64_t v18 = objc_msgSend_modernIdentity(self, v15, v16, v17);
  if (!v18) {
    goto LABEL_7;
  }
  uint64_t v22 = (void *)v18;
  v23 = objc_msgSend_accountIdentity(self, v19, v20, v21);

  if (!v23) {
    goto LABEL_7;
  }
  v27 = objc_msgSend_modernIdentity(self, v24, v25, v26);
  id v40 = v12;
  v30 = objc_msgSend_dataRepresentationWithError_(v27, v28, (uint64_t)&v40, v29);
  id v31 = v40;

  if (v30)
  {
    objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v30, v33, @"kIDSPublicDeviceIdentityModern");
    id v37 = objc_msgSend_accountIdentity(self, v34, v35, v36);
    objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, v39, @"kIDSPublicDeviceIdentityAccount");
  }
  else
  {
    objc_msgSend_failWithError_(v4, v32, (uint64_t)v31, v33);
  }

LABEL_10:
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_legacyIdentity(self, v5, v6, v7);
  id v12 = objc_msgSend_modernIdentity(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_accountIdentity(self, v13, v14, v15);
  uint64_t v19 = objc_msgSend_stringWithFormat_(v3, v17, @"<%@ %p legacyIdentity: %@, modernIdentity: %@, accountIdentity: %@>", v18, v4, self, v8, v12, v16);

  return (NSString *)v19;
}

- (IDSMPPublicLegacyIdentity)legacyIdentity
{
  return self->_legacyIdentity;
}

- (IDSMPPublicDeviceIdentity)modernIdentity
{
  return self->_modernIdentity;
}

- (IDSPublicAccountIdentity)accountIdentity
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