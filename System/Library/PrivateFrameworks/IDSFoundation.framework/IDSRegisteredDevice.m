@interface IDSRegisteredDevice
+ (BOOL)supportsSecureCoding;
+ (id)registeredDeviceFromDependentRegistrationDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRegisteredDevice:(id)a3;
- (IDSRegisteredDevice)initWithCoder:(id)a3;
- (IDSRegisteredDevice)initWithName:(id)a3 hardwareVersion:(id)a4 pushToken:(id)a5 URIs:(id)a6 publicDeviceIdentity:(id)a7;
- (NSArray)URIs;
- (NSData)publicDeviceIdentity;
- (NSData)pushToken;
- (NSString)hardwareVersion;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSRegisteredDevice

+ (id)registeredDeviceFromDependentRegistrationDictionary:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"device-name", v5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  v11 = objc_msgSend_objectForKeyedSubscript_(v3, v9, @"hardware-version", v10);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  v16 = 0;
  if (v8) {
    BOOL v17 = v13 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    uint64_t v54 = (uint64_t)v8;
    v18 = objc_msgSend_objectForKeyedSubscript_(v3, v14, @"push-token", v15);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    id v53 = v19;

    v22 = objc_msgSend_objectForKeyedSubscript_(v3, v20, @"client-data", v21);
    v25 = objc_msgSend_objectForKeyedSubscript_(v22, v23, @"public-message-identity-key", v24);

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v26 = v25;
    }
    else {
      v26 = 0;
    }
    id v52 = v26;

    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v29 = objc_msgSend_objectForKeyedSubscript_(v3, v28, @"identities", 0.0);
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v55, v31, v59, 16);
    if (v32)
    {
      uint64_t v35 = v32;
      uint64_t v36 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v56 != v36) {
            objc_enumerationMutation(v29);
          }
          v38 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v55 + 1) + 8 * i), v33, @"uri", v34);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v39 = v38;
          }
          else {
            v39 = 0;
          }
          id v40 = v39;

          if (v40)
          {
            v41 = [IDSURI alloc];
            v45 = objc_msgSend_initWithPrefixedURI_(v41, v42, (uint64_t)v40, v43);
            if (v45) {
              objc_msgSend_addObject_(v27, v44, (uint64_t)v45, v46);
            }
          }
        }
        uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v33, (uint64_t)&v55, v34, v59, 16);
      }
      while (v35);
    }

    id v8 = (id)v54;
    if (v53)
    {
      v47 = [IDSRegisteredDevice alloc];
      v48 = v52;
      v16 = objc_msgSend_initWithName_hardwareVersion_pushToken_URIs_publicDeviceIdentity_(v47, v49, v54, v50, v13, v53, v27, v52);
    }
    else
    {
      v16 = 0;
      v48 = v52;
    }
  }
  return v16;
}

- (IDSRegisteredDevice)initWithName:(id)a3 hardwareVersion:(id)a4 pushToken:(id)a5 URIs:(id)a6 publicDeviceIdentity:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)IDSRegisteredDevice;
  v19 = [(IDSRegisteredDevice *)&v44 init];
  if (v19)
  {
    uint64_t v21 = objc_msgSend_copy(v12, v17, v18, v20);
    name = v19->_name;
    v19->_name = (NSString *)v21;

    uint64_t v26 = objc_msgSend_copy(v13, v23, v24, v25);
    hardwareVersion = v19->_hardwareVersion;
    v19->_hardwareVersion = (NSString *)v26;

    uint64_t v31 = objc_msgSend_copy(v14, v28, v29, v30);
    pushToken = v19->_pushToken;
    v19->_pushToken = (NSData *)v31;

    uint64_t v36 = objc_msgSend_copy(v15, v33, v34, v35);
    URIs = v19->_URIs;
    v19->_URIs = (NSArray *)v36;

    uint64_t v41 = objc_msgSend_copy(v16, v38, v39, v40);
    publicDeviceIdentity = v19->_publicDeviceIdentity;
    v19->_publicDeviceIdentity = (NSData *)v41;
  }
  return v19;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v8 = objc_msgSend_name(self, v5, v6, v7);
  id v12 = objc_msgSend_hardwareVersion(self, v9, v10, v11);
  id v16 = objc_msgSend_pushToken(self, v13, v14, v15);
  double v20 = objc_msgSend_publicDeviceIdentity(self, v17, v18, v19);
  uint64_t v24 = objc_msgSend_publicDeviceIdentity(self, v21, v22, v23);
  id v27 = objc_msgSend_descriptionForData_options_(IDSLogFormatter, v25, (uint64_t)v24, v26, 2);
  double v30 = objc_msgSend_stringWithFormat_(v3, v28, @"<%@: %p name: %@, hardwareVersion: %@, pushToken: %@, identities: %@, publicKey: %@>", v29, v4, self, v8, v12, v16, v20, v27);

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (IDSRegisteredDevice *)a3;
  if (self == v4)
  {
    char isEqualToRegisteredDevice = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char isEqualToRegisteredDevice = objc_msgSend_isEqualToRegisteredDevice_(self, v5, (uint64_t)v4, v6);
    }
    else {
      char isEqualToRegisteredDevice = 0;
    }
  }

  return isEqualToRegisteredDevice;
}

- (BOOL)isEqualToRegisteredDevice:(id)a3
{
  double v7 = (IDSRegisteredDevice *)a3;
  double v11 = v7;
  if (self == v7)
  {
    char isEqual = 1;
  }
  else
  {
    if (v7)
    {
      id v12 = objc_msgSend_name(self, v8, v9, v10);
      uint64_t v18 = objc_msgSend_name(v11, v13, v14, v15);
      if (v12 != v18)
      {
        double v20 = objc_msgSend_name(self, v16, v17, v19);
        objc_msgSend_name(v11, v21, v22, v23);
        v97 = v96 = v20;
        if (!objc_msgSend_isEqual_(v20, v24, (uint64_t)v97, v25))
        {
          char isEqual = 0;
          goto LABEL_31;
        }
      }
      id v27 = objc_msgSend_hardwareVersion(self, v16, v17, v19);
      v33 = objc_msgSend_hardwareVersion(v11, v28, v29, v30);
      if (v27 != v33)
      {
        double v5 = objc_msgSend_hardwareVersion(self, v31, v32, v34);
        id v3 = objc_msgSend_hardwareVersion(v11, v35, v36, v37);
        if (!objc_msgSend_isEqual_(v5, v38, (uint64_t)v3, v39))
        {
          char isEqual = 0;
LABEL_29:

LABEL_30:
          if (v12 == v18)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
      }
      uint64_t v40 = objc_msgSend_pushToken(self, v31, v32, v34);
      uint64_t v94 = objc_msgSend_pushToken(v11, v41, v42, v43);
      v95 = (void *)v40;
      if (v40 == v94)
      {
        v91 = v3;
      }
      else
      {
        v47 = objc_msgSend_pushToken(self, v44, v45, v46);
        v92 = objc_msgSend_pushToken(v11, v48, v49, v50);
        v93 = v47;
        if (!objc_msgSend_isEqual_(v47, v51, (uint64_t)v92, v52))
        {
          char isEqual = 0;
          v67 = (void *)v94;
          v66 = v95;
LABEL_27:

LABEL_28:
          if (v27 == v33) {
            goto LABEL_30;
          }
          goto LABEL_29;
        }
        v91 = v3;
      }
      id v53 = objc_msgSend_URIs(self, v44, v45, v46);
      v59 = objc_msgSend_URIs(v11, v54, v55, v56);
      if (v53 == v59)
      {
        v88 = v5;
        v89 = v33;
      }
      else
      {
        uint64_t v4 = objc_msgSend_URIs(self, v57, v58, v60);
        v90 = objc_msgSend_URIs(v11, v61, v62, v63);
        if (!objc_msgSend_isEqual_(v4, v64, (uint64_t)v90, v65))
        {
          char isEqual = 0;
          goto LABEL_25;
        }
        v88 = v5;
        v89 = v33;
      }
      v68 = objc_msgSend_publicDeviceIdentity(self, v57, v58, v60);
      uint64_t v72 = objc_msgSend_publicDeviceIdentity(v11, v69, v70, v71);
      if (v68 == (void *)v72)
      {

        char isEqual = 1;
      }
      else
      {
        v76 = (void *)v72;
        objc_msgSend_publicDeviceIdentity(self, v73, v74, v75);
        v77 = v86 = v4;
        objc_msgSend_publicDeviceIdentity(v11, v78, v79, v80);
        v87 = v27;
        v82 = v81 = v53;
        char isEqual = objc_msgSend_isEqual_(v77, v83, (uint64_t)v82, v84);

        id v53 = v81;
        id v27 = v87;

        uint64_t v4 = v86;
      }
      double v5 = v88;
      v33 = v89;
      if (v53 == v59)
      {
LABEL_26:

        v67 = (void *)v94;
        v66 = v95;
        id v3 = v91;
        if (v95 == (void *)v94) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
LABEL_25:

      goto LABEL_26;
    }
    char isEqual = 0;
  }
LABEL_33:

  return isEqual;
}

- (unint64_t)hash
{
  double v5 = objc_msgSend_name(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  id v13 = objc_msgSend_hardwareVersion(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_pushToken(self, v18, v19, v20);
  unint64_t v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSRegisteredDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"IDSRegisteredDeviceNameKey");
  uint64_t v9 = objc_opt_class();
  double v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, @"IDSRegisteredDeviceHardwareVersionKey");
  uint64_t v13 = objc_opt_class();
  double v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, v15, @"IDSRegisteredDevicePushTokenKey");
  uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v22 = objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
  unint64_t v25 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, v24, @"IDSRegisteredDeviceURIsKey");

  double v26 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v27 = objc_opt_class();
  double v30 = objc_msgSend_setWithObjects_(v26, v28, v27, v29, 0);
  v33 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, v32, @"IDSRegisteredDevicePublicDeviceIdentityKey");

  uint64_t v36 = (IDSRegisteredDevice *)objc_msgSend_initWithName_hardwareVersion_pushToken_URIs_publicDeviceIdentity_(self, v34, (uint64_t)v8, v35, v12, v16, v25, v33);
  return v36;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v8 = objc_msgSend_name(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, @"IDSRegisteredDeviceNameKey");

  uint64_t v14 = objc_msgSend_hardwareVersion(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, v16, @"IDSRegisteredDeviceHardwareVersionKey");

  double v20 = objc_msgSend_pushToken(self, v17, v18, v19);
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, v22, @"IDSRegisteredDevicePushTokenKey");

  double v26 = objc_msgSend_URIs(self, v23, v24, v25);
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, v28, @"IDSRegisteredDeviceURIsKey");

  objc_msgSend_publicDeviceIdentity(self, v29, v30, v31);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v34, v33, @"IDSRegisteredDevicePublicDeviceIdentityKey");
}

- (NSString)name
{
  return self->_name;
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (NSArray)URIs
{
  return self->_URIs;
}

- (NSData)publicDeviceIdentity
{
  return self->_publicDeviceIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicDeviceIdentity, 0);
  objc_storeStrong((id *)&self->_URIs, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end